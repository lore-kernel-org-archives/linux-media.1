Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE37941C30A;
	Wed,  3 Jun 2026 08:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476080; cv=none; b=X8PBJwl+Yn2AoE9RNglM/pIk8vzkEcME1xLIU6eqNSnFQgLvHdN0yAoqVVuWPglWhAT8L0RQEvAPm3zvT2OyQgcSPuwbqcq3P8Ws9isOUtm2BZYsf4mYBgR8ST659wdbLX7WuvV+EROPEJf6L8YoY5cfyFtTdcYAMFIiqmKS6P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476080; c=relaxed/simple;
	bh=I3t207Py95ke7EqI3JApqRETDdABYwC8UvdOSoVwlxY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MIBuPnYPhEIsv9OuG2P+sy1bDQLgPejstF+AFh2CBCL3oFeXpS3HqITj9JuTWelWb55mQ8WN8aeCLcRGXWaTiWvGbD+YF+MmM6s6oZzJVMrSnL/DM2JJisUZzhue7Kyb59MRpQn7clmYr0thKiCqzPllFyj1sDElo1Pu+psn7U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=b+FXuJkK; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="b+FXuJkK"
X-UUID: f9c9b5305f2711f1b1788b6acf885367-20260603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=C5dgAx2fihIuh8a+IW3WpARfTxvCykl2d3cjpoJ49IE=;
	b=b+FXuJkK25aMYtfUgyGtODbOZIiBjXG+dku52d3o5mwsEM9uXZaBc7rL4voLYojpEzbjap7JYeCEF+zN+xVKQb0vN08vUD/mDyE1WCsPF+kmtDA+GOHn/dm7x8ITNHCl9WLWuwzZ+wZTu89TbP2D8qDYl0hipxMsSUZDVqbPBpU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:e63a46d2-ff35-44d7-b644-e8bf10e5e484,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:55180a50-23b6-41e0-a310-51c498ab6908,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f9c9b5305f2711f1b1788b6acf885367-20260603
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 136024457; Wed, 03 Jun 2026 16:41:12 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Jun 2026 16:41:10 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 3 Jun 2026 16:41:09 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>,
	Kees Cook <kees@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Haoxiang Li <haoxiang_li2024@163.com>, Fei Shao <fshao@chromium.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Irui Wang <irui.wang@mediatek.com>, Fan Wu
	<fanwu01@zju.edu.cn>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Kyrie Wu <kyrie.wu@mediatek.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Tzung-Bi Shih
	<tzungbi@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v5 04/14] media: mediatek: vcodec: get different firmware ipi id
Date: Wed, 3 Jun 2026 16:40:34 +0800
Message-ID: <20260603084045.17488-5-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260603084045.17488-1-kyrie.wu@mediatek.com>
References: <20260603084045.17488-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Yunfei Dong <yunfei.dong@mediatek.com>

Getting ipi(inter-processor interrupt) id according to firmware
type and hardware index for different architecture.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/common/mtk_vcodec_fw.c | 13 +++++++++++++
 .../platform/mediatek/vcodec/common/mtk_vcodec_fw.h |  1 +
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c       |  5 +++--
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c    |  5 +++--
 .../vcodec/decoder/vdec/vdec_hevc_req_multi_if.c    |  5 +++--
 .../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c  |  5 +++--
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c       |  5 +++--
 7 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
index 64977bcd6abd..a2e6a01272b2 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
@@ -5,6 +5,19 @@
 #include "mtk_vcodec_fw_priv.h"
 #include "mtk_vcodec_fw_vcp.h"
 
+int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id)
+{
+	switch (type) {
+	case SCP:
+		return hw_id == MTK_VDEC_LAT0 ? SCP_IPI_VDEC_LAT : SCP_IPI_VDEC_CORE;
+	case VCP:
+		return hw_id == MTK_VDEC_LAT0 ? VCP_IPI_LAT_DECODER : VCP_IPI_CORE_DECODER;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_ipi);
+
 struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_type type,
 					   enum mtk_vcodec_fw_use fw_use)
 {
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
index c1642fb09b42..142e2e87905c 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
@@ -41,5 +41,6 @@ int mtk_vcodec_fw_ipi_register(struct mtk_vcodec_fw *fw, int id,
 int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, int id,
 			   void *buf, unsigned int len, unsigned int wait);
 int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw);
+int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id);
 
 #endif /* _MTK_VCODEC_FW_H_ */
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 2d622e85f827..756fbb7778b1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1877,6 +1877,7 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
 	struct vdec_av1_slice_instance *instance;
 	struct vdec_av1_slice_init_vsi *vsi;
+	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
 	int ret;
 
 	instance = kzalloc_obj(*instance);
@@ -1884,8 +1885,8 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		return -ENOMEM;
 
 	instance->ctx = ctx;
-	instance->vpu.id = SCP_IPI_VDEC_LAT;
-	instance->vpu.core_id = SCP_IPI_VDEC_CORE;
+	instance->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	instance->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	instance->vpu.ctx = ctx;
 	instance->vpu.codec_type = ctx->current_codec;
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 10359ce9b934..69d60717181a 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -1204,6 +1204,7 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 
 static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
+	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
 	struct vdec_h264_slice_inst *inst;
 	int err, vsi_size;
 	unsigned char *temp;
@@ -1214,8 +1215,8 @@ static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 
 	inst->ctx = ctx;
 
-	inst->vpu.id = SCP_IPI_VDEC_LAT;
-	inst->vpu.core_id = SCP_IPI_VDEC_CORE;
+	inst->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	inst->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	inst->vpu.ctx = ctx;
 	inst->vpu.codec_type = ctx->current_codec;
 	inst->vpu.capture_type = ctx->capture_fourcc;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
index 02f39954a4c2..dd638ef44083 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
@@ -855,6 +855,7 @@ static int vdec_hevc_slice_setup_core_buffer(struct vdec_hevc_slice_inst *inst,
 
 static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
+	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
 	struct vdec_hevc_slice_inst *inst;
 	int err, vsi_size;
 
@@ -864,8 +865,8 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 
 	inst->ctx = ctx;
 
-	inst->vpu.id = SCP_IPI_VDEC_LAT;
-	inst->vpu.core_id = SCP_IPI_VDEC_CORE;
+	inst->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	inst->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	inst->vpu.ctx = ctx;
 	inst->vpu.codec_type = ctx->current_codec;
 	inst->vpu.capture_type = ctx->capture_fourcc;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
index 391e789a5a13..d65e276f6cea 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
@@ -272,6 +272,7 @@ static int vdec_vp8_slice_get_decode_parameters(struct vdec_vp8_slice_inst *inst
 
 static int vdec_vp8_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
+	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
 	struct vdec_vp8_slice_inst *inst;
 	int err;
 
@@ -281,8 +282,8 @@ static int vdec_vp8_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 
 	inst->ctx = ctx;
 
-	inst->vpu.id = SCP_IPI_VDEC_LAT;
-	inst->vpu.core_id = SCP_IPI_VDEC_CORE;
+	inst->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	inst->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	inst->vpu.ctx = ctx;
 	inst->vpu.codec_type = ctx->current_codec;
 	inst->vpu.capture_type = ctx->capture_fourcc;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index adbacabdbebc..1f0479a8f5cb 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1844,6 +1844,7 @@ static int vdec_vp9_slice_update_core(struct vdec_vp9_slice_instance *instance,
 
 static int vdec_vp9_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
+	enum mtk_vcodec_fw_type fw_type = ctx->dev->fw_handler->type;
 	struct vdec_vp9_slice_instance *instance;
 	struct vdec_vp9_slice_init_vsi *vsi;
 	int ret;
@@ -1853,8 +1854,8 @@ static int vdec_vp9_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		return -ENOMEM;
 
 	instance->ctx = ctx;
-	instance->vpu.id = SCP_IPI_VDEC_LAT;
-	instance->vpu.core_id = SCP_IPI_VDEC_CORE;
+	instance->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	instance->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	instance->vpu.ctx = ctx;
 	instance->vpu.codec_type = ctx->current_codec;
 
-- 
2.45.2

