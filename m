Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29AD21CC5A;
	Mon, 20 Jul 2026 01:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784510498; cv=none; b=ZfH73XrYuyc9ux/pua8zpk6lxW+ZE7DLQXZrEjv5r9TDlLkHOdg9mU6DKhJzBMMWMtcsoYBYWrBunNdy0SXztVWH26Z/4XCTy60EgY8qcbrsxTO+qlYF6OYyBbOZk1m2zUcTkqAjhQJEr/zukGQzSbWh/M4v73rpb8P5Tb83hhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784510498; c=relaxed/simple;
	bh=J70523kmgCibnOehGJG6LlpQKZDvIeZY37Rl1i7fm6o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AZv9tbfuA+WTlQWB4Q1AFhOG0bU75FEhJY3pBkjERunhc1ytsJwsBJC5st5MkDY6pD9kvK+o/L5pyHPq4MIhggePqiDDenZlY0xPpMGV+YRD5bfmc2App+vp8UUND50CpFjo1AyKsM5MeJGVWCnATb7t3LTFJf0i9QBP+jj0+VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=LUY4DnSy; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LUY4DnSy"
X-UUID: 502595ea83d911f1b1788b6acf885367-20260720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qh8w95cDgBf8m+ks492ITfBmR6HaPxLoY6qViKB2mgw=;
	b=LUY4DnSyqbuYg57ZgLBr62QFIzm/pZuQbhxBRgRIl217sTayGiXYcr1KgNtQSPzDSVC0+t7ynSw+NoIy4BXgIjAy5eWTiAyQcLeExM2Yn6F2D2glYJq+BWxiUC080w8BJVlG+jkQCJRxOS8QWKovTJQyKQo4O4ME1nE/rrqHs78=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:e0999982-5ac2-48d6-92e2-fc229eb77ee8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:25525219-ab14-4403-9336-76696324c5a8,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 502595ea83d911f1b1788b6acf885367-20260720
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1957719352; Mon, 20 Jul 2026 09:21:20 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 20 Jul 2026 09:21:19 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 20 Jul 2026 09:21:18 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Ricardo Ribalda
	<ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li
	<haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
	<tfiga@chromium.org>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Qianfeng Rong <rongqianfeng@vivo.com>,
	Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v6 12/14] media: mediatek: vcodec: clean xpc status
Date: Mon, 20 Jul 2026 09:20:54 +0800
Message-ID: <20260720012056.1026551-13-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The driver need to clean xpc status when receive decoder hardware
interrupt for mt8196 platform.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        | 31 +++++++++++++++++++
 .../vcodec/decoder/mtk_vcodec_dec_hw.h        | 13 ++++++--
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
index 881d5de41..46ac3e41c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
@@ -61,6 +61,34 @@ static int mtk_vdec_hw_prob_done(struct mtk_vcodec_dec_dev *vdec_dev)
 	return 0;
 }
 
+static void mtk_vdec_hw_write_reg_mask(void __iomem *reg_base, u32 reg_offset, u32 val, u32 mask)
+{
+	void __iomem *reg_addr = reg_base + reg_offset;
+	u32 reg_val;
+
+	reg_val =  readl(reg_addr);
+	reg_val &= ~mask;
+	reg_val |= (val & mask);
+	writel(reg_val, reg_addr);
+}
+
+static void mtk_vdec_hw_clean_xpc(struct mtk_vdec_hw_dev *dev)
+{
+	unsigned long flags;
+	u32 val, mask, addr = VDEC_XPC_CLEAN_ADDR;
+
+	if (dev->main_dev->chip_name != MTK_VDEC_MT8196)
+		return;
+
+	val = dev->hw_idx == MTK_VDEC_LAT0 ? VDEC_XPC_LAT_VAL : VDEC_XPC_CORE_VAL;
+	mask = dev->hw_idx == MTK_VDEC_LAT0 ? VDEC_XPC_LAT_MASK : VDEC_XPC_CORE_MASK;
+
+	spin_lock_irqsave(&dev->main_dev->irqlock, flags);
+	mtk_vdec_hw_write_reg_mask(dev->reg_base[VDEC_HW_XPC], addr, val, mask);
+	mtk_vdec_hw_write_reg_mask(dev->reg_base[VDEC_HW_XPC], addr, 0, mask);
+	spin_unlock_irqrestore(&dev->main_dev->irqlock, flags);
+}
+
 static irqreturn_t mtk_vdec_hw_irq_handler(int irq, void *priv)
 {
 	struct mtk_vdec_hw_dev *dev = priv;
@@ -88,6 +116,8 @@ static irqreturn_t mtk_vdec_hw_irq_handler(int irq, void *priv)
 	writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
 	writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
 
+	mtk_vdec_hw_clean_xpc(dev);
+
 	wake_up_dec_ctx(ctx, MTK_INST_IRQ_RECEIVED, dev->hw_idx);
 
 	mtk_v4l2_vdec_dbg(3, ctx, "wake up ctx %d, dec_done_status=%x",
@@ -166,6 +196,7 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 	subdev_dev->hw_idx = hw_idx;
 	subdev_dev->main_dev = main_dev;
 	subdev_dev->reg_base[VDEC_HW_SYS] = main_dev->reg_base[VDEC_HW_SYS];
+	subdev_dev->reg_base[VDEC_HW_XPC] = main_dev->reg_base[VDEC_HW_MISC];
 	set_bit(subdev_dev->hw_idx, main_dev->subdev_bitmap);
 
 	if (IS_SUPPORT_VDEC_HW_IRQ(hw_idx)) {
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
index 83fe8b942..5c906143c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
@@ -18,17 +18,26 @@
 #define VDEC_IRQ_CLR 0x10
 #define VDEC_IRQ_CFG_REG 0xa4
 
+#define VDEC_XPC_CLEAN_ADDR 0xc
+#define VDEC_XPC_LAT_VAL BIT(0)
+#define VDEC_XPC_LAT_MASK BIT(0)
+
+#define VDEC_XPC_CORE_VAL BIT(4)
+#define VDEC_XPC_CORE_MASK BIT(4)
+
 #define IS_SUPPORT_VDEC_HW_IRQ(hw_idx) ((hw_idx) != MTK_VDEC_LAT_SOC)
 
 /**
  * enum mtk_vdec_hw_reg_idx - subdev hardware register base index
- * @VDEC_HW_SYS : vdec soc register index
+ * @VDEC_HW_SYS:  vdec soc register index
  * @VDEC_HW_MISC: vdec misc register index
- * @VDEC_HW_MAX : vdec supported max register index
+ * @VDEC_HW_XPC:  vdec xpc register index
+ * @VDEC_HW_MAX:  vdec supported max register index
  */
 enum mtk_vdec_hw_reg_idx {
 	VDEC_HW_SYS,
 	VDEC_HW_MISC,
+	VDEC_HW_XPC,
 	VDEC_HW_MAX
 };
 
-- 
2.51.0.windows.2

