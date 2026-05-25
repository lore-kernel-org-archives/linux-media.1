Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800393F0A9B;
	Mon, 25 May 2026 15:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779724069; cv=none; b=ml8nEGFxWhEpWqumVZBPn/VuO+UAKkTlyxU+uJFw4FwvM8+LnVO5YluZK3qkQaeymBgLBWYjvDEc8fkI6x0WVDPbUQw4nKEcUB8rnLFTPXCpW1rgCpKSOia+Sp8FIlKN1z//omZItfkz8Ol97jDRglW34H/947WsXQj4rQC3ndI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779724069; c=relaxed/simple;
	bh=DrnexA7je7PQWSjTQeVWmOtxj7eJT2Dst7Fjf63aG28=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EiFbknyvD+2CztqoWhZGhQUY9WJU592mK/npzEnQqcJUrXKzpVZBiTCCbKa6knhM+RCT/+3U9HnQoH16JJBifrvGAhOWSUA1eWtx0oU2pgi5WumgNmzIbo4qE9v2dOgebrMGnMfDgTrasXRAAxrOoPv/e0i7U6eq0FmlMfieeVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=AM6v4juS; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="AM6v4juS"
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3fbdb7a8a;
	Mon, 25 May 2026 23:42:30 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: mchehab@kernel.org
Cc: kees@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Dawei Feng <dawei.feng@seu.edu.cn>,
	stable@vger.kernel.org,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH RESEND] media: mantis: fix memory leak in hopper_pci_probe()
Date: Mon, 25 May 2026 23:42:29 +0800
Message-Id: <20260525154229.928736-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e5fcd4a6203a2kunm9ae92e48b9d38
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHR9NVklLGkoaSElMQk5JSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=AM6v4juSWbvd9iN2hrwROSo6t6F6UoPiDgkiAlkaVnIBvocJiSALeWC7QH0uvPjzjIOjEC+8wwviF1wCzQnDtg9/r0BLtl5ea/l8U5jqryK4rKsFS1y2ttljDKTYXzEmBz7+Q51S6TOOJDnnOaILWocNsuvXpjTIk4cUTeTAR0g=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=DawwoEvqy/RU2x32dtGT3ZnqibUyYSLLp+FB+/EHnGU=;
	h=date:mime-version:subject:message-id:from;

In hopper_pci_probe(), two probe-error paths jump to the wrong cleanup
stage. If mantis_get_mac() fails after mantis_i2c_init() succeeds, the
function skips mantis_i2c_exit() and leaves the I2C adapter registered.
If mantis_stream_control() fails after mantis_pci_init() succeeds, the
function frees the mantis structure without undoing the PCI setup.

Route the affected error paths to the correct cleanup labels so that
hopper_pci_probe() releases resources in reverse order, matching the
cleanup flow already used by mantis_pci_probe().

The bug was first flagged by an experimental analysis tool we are
developing for kernel memory-management bugs while analyzing
v6.13-rc1. The tool is still under development and is not yet publicly
available. Manual inspection confirms that the bug is still
present in v7.1-rc5.

An x86_64 allyesconfig build showed no new warnings. As we do
not have a Twinhan VP-3028 DVB-T board to test with, no runtime
testing was able to be performed.

Fixes: b3b961448f702 ("V4L/DVB (13795): [Mantis/Hopper] Code overhaul, add Hopper devices into the PCI ID list")
Cc: stable@vger.kernel.org
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
---
Resend to correct the recipient email addresses.
 drivers/media/pci/mantis/hopper_cards.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/mantis/hopper_cards.c b/drivers/media/pci/mantis/hopper_cards.c
index 050068308c10..b55543054727 100644
--- a/drivers/media/pci/mantis/hopper_cards.c
+++ b/drivers/media/pci/mantis/hopper_cards.c
@@ -175,7 +175,7 @@ static int hopper_pci_probe(struct pci_dev *pdev,
 	err = mantis_stream_control(mantis, STREAM_TO_HIF);
 	if (err < 0) {
 		dprintk(MANTIS_ERROR, 1, "ERROR: Mantis stream control failed <%d>", err);
-		goto fail1;
+		goto fail2;
 	}
 
 	err = mantis_i2c_init(mantis);
@@ -187,7 +187,7 @@ static int hopper_pci_probe(struct pci_dev *pdev,
 	err = mantis_get_mac(mantis);
 	if (err < 0) {
 		dprintk(MANTIS_ERROR, 1, "ERROR: Mantis MAC address read failed <%d>", err);
-		goto fail2;
+		goto fail3;
 	}
 
 	err = mantis_dma_init(mantis);
-- 
2.34.1

