Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2518123EAAD;
	Fri, 24 Jul 2026 02:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784861639; cv=none; b=QT9qxaHwIrfJYb9kAVhvf60/BEAkv2r9oGuACVGiMayGybseNwLt1144skNn7RL+pP4jWeqIvtEpy63vms/kC7Q3xUzrS8m8LzZpoiTYPhrlQY6af8yj30ygMTMP1Z+EVVMdwG6lb5qvR0CICG8AU90DLq3FGTP5H4MfFE1DtXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784861639; c=relaxed/simple;
	bh=dZ2lXiFvyaDXnWA6TOBlKgbIh+FfJbgWAxCgK6MWMAA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HmKcOl4evBU0VjtvEHIuKDZ6pLhh3MVcnj1tc20/nAhXduzH8Hp34BOURac41/k6VpIb98IVmiTfUK5o7cdgZzZqriHY0Qw0LQUniwuQA4tpXhUsxfB2l/8DVbsMaQu48xnXvXMu2zuKJtKJf37sKuR8REXlRI7NsueA7Yzy8IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e5149ad2870a11f1aa26b74ffac11d73-20260724
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d2c51983-416a-419f-addd-0ca603d44db1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:bb1fcfce4c656625eb123ca09925a1b6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e5149ad2870a11f1aa26b74ffac11d73-20260724
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 738090921; Fri, 24 Jul 2026 10:53:48 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	p.zabel@pengutronix.de
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Changcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH] media: mali-c55: fix clock leak when reset deassert fails
Date: Fri, 24 Jul 2026 10:53:45 +0800
Message-Id: <20260724025345.32644-1-chenchangcheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In __mali_c55_power_on(), if clk_bulk_prepare_enable() succeeds but
reset_control_bulk_deassert() fails, the function returns the error
directly without disabling the clocks. This leaves the clocks enabled
permanently in the runtime resume path, or leaks them in the probe
path.

Fix this by calling clk_bulk_disable_unprepare() before returning the
error.

Signed-off-by: Chen Changcheng <chenchangcheng@kylinos.cn>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 94a389b3f833..f28e9f4354ac 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -698,6 +698,8 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
 					  mali_c55->resets);
 	if (ret) {
 		dev_err(mali_c55->dev, "failed to deassert resets\n");
+		clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks),
+					   mali_c55->clks);
 		return ret;
 	}
 
-- 
2.25.1

