Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2041FA859;
	Mon, 20 Jul 2026 13:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554487; cv=none; b=I6YhCXwsU8PweBGRudvtuvpSu5SA3SrAGCBN6Wylzq/KG5fQsxrI0xXqnyYRSN1mb8tUAYxz/ZS9uW+o5famrEEt+weYSHn8zqN9TEecrXctIYcGxdnwCWEcvM9tio1K2ReOrsLzFtsPq4ODBvoNJwVXds7dLYTzvpKZUAWhhcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554487; c=relaxed/simple;
	bh=QSZ9iLci0NCW7YP2mJeHtdddSeibf/bhnNzsWnSx00s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jWSvYIzwDY7NtRlRHE/AzMuDhqjF2sSP3JtafS97ao+a4J06pIN6PmsKCFVxWSBEb/jZpxzgZmfMC58XHZZFuJ4cyK8VI/gLxecd53IeCp7KMgoqn9tbmZnUoarNdqG6h2ihbqdQslbelxern7zq04cFr1MzQSWmHoBRBgveoqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=XvYekTUF; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XvYekTUF"
X-UUID: c13e08e6843f11f1b1788b6acf885367-20260720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=afljm9BYYTnsaNHwaxnxCWdKCnBjs3MjRvf3f6sakc0=;
	b=XvYekTUFXJ/wGOevLzuTQMSkwnWQ/nTsqlUyYagk4WZXnyhhn63YAB4SiqW3S2ylTgIrv8n8Tgn9+Qj7X0EcsdtyCtoZQru6I+XLzPGy67sp4clty4Q829PyzTAKy7q0IZtx7J6JeoeM4Loksa6eg/S7UcPnYFTv5/6CkJwJesw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:774746a3-a3c8-4fcb-b27f-2f5168ab1fcd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:8cd47c3f-46cf-453a-bd84-ad9fc7cb0e8c,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c13e08e6843f11f1b1788b6acf885367-20260720
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 70531934; Mon, 20 Jul 2026 21:34:38 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 20 Jul 2026 21:34:37 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 20 Jul 2026 21:34:36 +0800
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
Subject: [PATCH v16 01/12] media: mediatek: jpeg: fix jpeg cores' amounts setting
Date: Mon, 20 Jul 2026 21:34:21 +0800
Message-ID: <20260720133432.1042046-2-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720133432.1042046-1-kyrie.wu@mediatek.com>
References: <20260720133432.1042046-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
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
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c  | 11 ++++++-----
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h  |  2 ++
 .../media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c    |  2 ++
 .../media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c    |  2 ++
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec483..41c4cf8dc 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1325,7 +1325,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		for_each_child_of_node(pdev->dev.of_node, child)
 			num_child++;
 
-		atomic_set(&jpeg->hw_rdy, num_child);
+		jpeg->max_hw_count = num_child;
+		atomic_set(&jpeg->hw_rdy, 0);
 		atomic_set(&jpeg->hw_index, 0);
 
 		jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
@@ -1462,7 +1463,7 @@ static int mtk_jpegenc_get_hw(struct mtk_jpeg_ctx *ctx)
 	int i;
 
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
-	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+	for (i = 0; i < jpeg->max_hw_count; i++) {
 		comp_jpeg = jpeg->enc_hw_dev[i];
 		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
 			hw_id = i;
@@ -1509,7 +1510,7 @@ static int mtk_jpegdec_get_hw(struct mtk_jpeg_ctx *ctx)
 	int i;
 
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
-	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
+	for (i = 0; i < jpeg->max_hw_count; i++) {
 		comp_jpeg = jpeg->dec_hw_dev[i];
 		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
 			hw_id = i;
@@ -1592,7 +1593,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 		jpeg_work);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 
-	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++)
+	for (i = 0; i < jpeg->max_hw_count; i++)
 		comp_jpeg[i] = jpeg->enc_hw_dev[i];
 	i = 0;
 
@@ -1687,7 +1688,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
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
index 32372781d..9ca68cde4 100644
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
index b6f5b2249..a3f414f92 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -390,6 +390,8 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
 
+	atomic_inc(&master_dev->hw_rdy);
+
 	return 0;
 }
 
-- 
2.51.0.windows.2

