Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587388;
	b=dbJ3KBG4xxysYNGY1kC0tRzd/AN10705i91a/Piilvtqx+MgyarTvIqVavpE1TFHnXZm
	 PQ55l2+b6OzfEs6yD8tEdZdu9UsNNe3mkzR/nXHrHXjQKSv8Gya0D4+/PyKOdDaFdyUKo
	 z8bldoJgv6U/U4+ySoVeVIbb99JXOKigz4rh3ieh2dtJO3TYMdHbNOtyogijSmQ5DUmqf
	 ULpsjv9IFh3OZIec8MqYsdmSY5sxro1sjBv4T1u4eO0yI5+/ImgxgR4rd2yvhQ//V5/J0
	 R13wxoS7AWzJ2LSyc8e40yb8H2QW3g8Qtx908LqRb9IQ6MHKDyNOnDDkiCunJcTl7tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587388;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=YUv16SrYzKKD3UA4yBxILMFKnt2taw8dsCdRPnHsbeY=;
	b=oRmNBgmw+HJ+NbKTcAp2Q4+/6t9qmgxCYMgyo8OanO6FL5tvh/ZD3pJNcpfLAdxeOxse
	 QfIg8aoNVZOeqeV21MPRY7fohj3hh34fmMiXbfvNZpgBHV8jIdoxZF6Ea3hnIQa3s8k0y
	 MfT1I8oGHD7vTXFkNAdd2//icqHqrDL3sKTt7zkXH7jD+mj99j7P1Hh1FjaWBvn8mG98F
	 8JiJwrekL5Ix6k1eYzb8uJZ5WlOjBpIts4vPX3j+oVi8y4OIbR2HgmkV/o8x03FCuaKQs
	 BG4ShX+G6OdUGNrGFNvfxsWtzoheXI6zNLRv/1KuL/uCFWX1KCoqgI5VFWzyd1x3OrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=sGES3IRD;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA05E6070A15;
	Wed, 25 Nov 2026 06:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA05E6070A15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=sGES3IRD
X-UUID: bcf27350e89711f1b1788b6acf885367-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YUv16SrYzKKD3UA4yBxILMFKnt2taw8dsCdRPnHsbeY=;
	b=sGES3IRDyBleRMHP/1SQNRUCoPj8967R1F9UY4FfD0woq0fUXulkKYL55cHeurCg+aI6p3IXydKg1tLzhVtmfxBlJ+sM2xGp1oFIRbwTbhSna+P6u2fh+XCz84fmnIAAReUaDqbBlO2ppISslgY9rpvg4kE3dBbRfYmUR3GCtbw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:2da48395-06e6-493d-bd1d-8727a87f69b9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:3af9f2bd-9e04-43bc-9c07-a2d8d8315d7e,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bcf27350e89711f1b1788b6acf885367-20261125
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1822242111; Wed, 25 Nov 2026 14:16:23 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:16:22 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:16:21 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil
	<hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: [PATCH v20 01/15] media: mediatek: jpeg: fix jpeg cores' amounts setting
Date: Wed, 25 Nov 2026 14:16:04 +0800
Message-ID: <20261125061618.2544386-2-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
References: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Different ICs have different amounts of cores,
use a variable to set the cores' amounts.

Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 19 ++++++++++++++-----
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  2 ++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  |  2 ++
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  |  2 ++
 4 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index e01dd4d80..3caee184f 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1294,6 +1294,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	struct mtk_jpeg_dev *jpeg;
 	struct device_node *child;
 	int num_child = 0;
+	int hw_max;
 	int ret;
 
 	jpeg = devm_kzalloc_obj(&pdev->dev, *jpeg);
@@ -1302,6 +1303,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 
 	mutex_init(&jpeg->lock);
 	spin_lock_init(&jpeg->hw_lock);
+	atomic_set(&jpeg->hw_rdy, 0);
 	jpeg->dev = &pdev->dev;
 	jpeg->variant = of_device_get_match_data(jpeg->dev);
 
@@ -1325,7 +1327,14 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		for_each_child_of_node(pdev->dev.of_node, child)
 			num_child++;
 
-		atomic_set(&jpeg->hw_rdy, num_child);
+		hw_max = jpeg->variant->cap_q_default_fourcc == V4L2_PIX_FMT_JPEG ?
+			 MTK_JPEGENC_HW_MAX : MTK_JPEGDEC_HW_MAX;
+		if (num_child > hw_max)
+			return dev_err_probe(jpeg->dev, -EINVAL,
+					     "Too many JPEG cores: %d (max %d)\n",
+					     num_child, hw_max);
+
+		jpeg->max_hw_count = num_child;
 		atomic_set(&jpeg->hw_index, 0);
 
 		jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
@@ -1462,7 +1471,7 @@ static int mtk_jpegenc_get_hw(struct mtk_jpeg_ctx *ctx)
 	int i;
 
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
-	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+	for (i = 0; i < jpeg->max_hw_count; i++) {
 		comp_jpeg = jpeg->enc_hw_dev[i];
 		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
 			hw_id = i;
@@ -1509,7 +1518,7 @@ static int mtk_jpegdec_get_hw(struct mtk_jpeg_ctx *ctx)
 	int i;
 
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
-	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
+	for (i = 0; i < jpeg->max_hw_count; i++) {
 		comp_jpeg = jpeg->dec_hw_dev[i];
 		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
 			hw_id = i;
@@ -1592,7 +1601,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 		jpeg_work);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 
-	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++)
+	for (i = 0; i < jpeg->max_hw_count; i++)
 		comp_jpeg[i] = jpeg->enc_hw_dev[i];
 	i = 0;
 
@@ -1688,7 +1697,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	struct mtk_jpeg_fb fb;
 	unsigned long flags;
 
-	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++)
+	for (i = 0; i < jpeg->max_hw_count; i++)
 		comp_jpeg[i] = jpeg->dec_hw_dev[i];
 	i = 0;
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 02ed0ed5b..6be5cf30d 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -212,6 +212,7 @@ struct mtk_jpegdec_comp_dev {
  * @reg_decbase:	jpg decode register base addr
  * @dec_hw_dev:	jpg decode hardware device
  * @hw_index:		jpg hw index
+ * @max_hw_count:	jpeg hw-core count
  */
 struct mtk_jpeg_dev {
 	struct mutex		lock;
@@ -234,6 +235,7 @@ struct mtk_jpeg_dev {
 	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
 	struct mtk_jpegdec_comp_dev *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
 	atomic_t hw_index;
+	u32 max_hw_count;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 74df7fbad..3c22417f4 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -668,6 +668,8 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
 
+	atomic_inc(&master_dev->hw_rdy);
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index cbea791e6..708f3fbc6 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -389,6 +389,8 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
 
+	atomic_inc(&master_dev->hw_rdy);
+
 	return 0;
 }
 
-- 
2.51.0.windows.2

