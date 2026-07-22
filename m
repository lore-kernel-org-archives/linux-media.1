Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399ED356A12;
	Wed, 22 Jul 2026 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715820; cv=none; b=V3f9NzBU8qHbANzQVtNksgLd84DarKVnDuKerg4+QcJLraOp1zlqbiQvf464024qjUgmhs9q3JpKOixANSft/goTOx2rH6RyzUchsm84q388bEiUBEbW2GkBn1eVKXms8dEogs6CuZXzffUUghsJ7IdAiwLPaGHIO4KBoJJza0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715820; c=relaxed/simple;
	bh=hZskAiLw+7/QQtBDtJ52pSqwBYflIv0Jl1uzpfBzU4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WCeIgm9h9B3F0Qp2sWDqcXqoWGhtbcs2k5PSc1dqaderDvAul1sIxigc97d1EcZc/zbWtf6i8dnjQtEQxDdFR23+7S6OQN74Vys3GlZN/Ij0IFdettS1Md74pnl9ACJZhJHatTWFwUsr2W9Iv33Q5Z2nARSh5u/wrLq+v+Z9GRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=CKCIJFtc; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=CKCIJFtc; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="CKCIJFtc";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="CKCIJFtc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715817; bh=hZskAiLw+7/QQtBDtJ52pSqwBYflIv0Jl1uzpfBzU4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CKCIJFtcGtXrb/pLGEfIoGOkUjXFzqQJ9iHocSRr+lFkDXWSNdl+VtKwn4csLm2wB
	 T8/Y+CBIJ3dqGP+yh7OnpmCu1LR2UxbWL6PCvTg2JwsEJZx88WzsAf44HpSV0XahJF
	 ibXtrqY2yezGKGIA36LBgYJ7OA4QcjsGWwbZdHE/tLj7lyB52XaA9e+iNqi0F0xozh
	 pXoKiPSqZSaW05aXhCrFl1JjHXy4+rzPpS6ux8Bucjk5XxGMPF82ZhH81tdQqUCL2n
	 m6FY/MuvmUoaPFr6BVyckAcpgsuqcYHQVK8GOrZrDlzvRGxH2OLWrIVX70L3nB4S++
	 p+iAdwFR8W6KA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id A44384253A; Wed, 22 Jul 2026 11:23:37 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715817; bh=hZskAiLw+7/QQtBDtJ52pSqwBYflIv0Jl1uzpfBzU4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CKCIJFtcGtXrb/pLGEfIoGOkUjXFzqQJ9iHocSRr+lFkDXWSNdl+VtKwn4csLm2wB
	 T8/Y+CBIJ3dqGP+yh7OnpmCu1LR2UxbWL6PCvTg2JwsEJZx88WzsAf44HpSV0XahJF
	 ibXtrqY2yezGKGIA36LBgYJ7OA4QcjsGWwbZdHE/tLj7lyB52XaA9e+iNqi0F0xozh
	 pXoKiPSqZSaW05aXhCrFl1JjHXy4+rzPpS6ux8Bucjk5XxGMPF82ZhH81tdQqUCL2n
	 m6FY/MuvmUoaPFr6BVyckAcpgsuqcYHQVK8GOrZrDlzvRGxH2OLWrIVX70L3nB4S++
	 p+iAdwFR8W6KA==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id E577842526;
	Wed, 22 Jul 2026 11:23:36 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jarod Wilson <jarod@redhat.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/13] media: redrat3: Ensure we don't read beyond the end of the packet
Date: Wed, 22 Jul 2026 11:23:15 +0100
Message-ID: <813937f8cffb517f1d5d287f6efbc0ed5161c224.1784715737.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784715737.git.sean@mess.org>
References: <cover.1784715737.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The length and offset is provided by the usb device, so it should be
validated.

Fixes: 2154be651b90 ("[media] redrat3: new rc-core IR transceiver device driver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/redrat3.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 2b639fe59923..f86efcb74e6e 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -358,8 +358,24 @@ static void redrat3_process_ir_data(struct redrat3_dev *rr3)
 
 	/* process each rr3 encoded byte into an int */
 	sig_size = be16_to_cpu(rr3->irdata.sig_size);
+
+	/*
+	 * Note we are not checking if we are reading beyond the end of the
+	 * packet which was sent, and reading stale data. If the device
+	 * sends a packet which is short then we get garbage IR, but no
+	 * out of bounds read.
+	 */
+	if (sig_size > RR3_MAX_SIG_SIZE) {
+		dev_err(dev, "length %u is incorrect\n", sig_size);
+		return;
+	}
+
 	for (i = 0; i < sig_size; i++) {
 		offset = rr3->irdata.sigdata[i];
+		if (offset >= RR3_DRIVER_MAXLENS) {
+			dev_err(dev, "offset %u is incorrect\n", offset);
+			return;
+		}
 		val = get_unaligned_be16(&rr3->irdata.lens[offset]);
 
 		/* we should always get pulse/space/pulse/space samples */
-- 
2.55.0

