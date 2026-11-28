Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852096;
	b=M8Q2ub5rnYm7i/pErbO4YGZccoGLx2TJmKwa55HikJDCrydconovFlc4cY2NXHSXPeK6
	 KCUs3+0UlDjAVjETJDQVV/1ggPyDQZkiDKra41dLXag8Gxmk19MPcnZ58RhBzcEG+8ikM
	 W67UNYjPiFhxENtkRzqBUBhCcwqfVhzCX9etGi5aI5EZrfB1ohqHI4mzDKVeotrhZKfHH
	 m++bHRCqQenyjkvyzGvntX4iSvDLiTHjTbKMA3LkvCZQJtEFaGNmqf0E+uzJw36t5vY8O
	 JQZ2awMT/7HnF1MoTWf1w9dsXK3SaR6gsSMbKFB6brp6EZ4OWMBaVa6VP3FDN2Y+UhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852096;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=O3G+MRttKmNoxAj4olc3NilBe7aSEMFIGcpN4x6WEkI=;
	b=4K/35jwNjwMNYzSP3RnFj/FTDVA6ZI3XZHvKkzfl7cfeJhBlgzBGzqXLNLHhhF7V8GjD
	 RRMmPTJFm73nzM+zJtbgzfSLLfFvC00/O1SNW9S3JAgMUGI4h62msd5/EYtLXUlQGrddS
	 RqGDfKzlPousZwQxIGMyePYVQOwHWscDR1K/pQx7zzHWPLblBvA1DRE8cNK/ZpPdpGfAa
	 fP47nM39xY47SgQBai43KyKn6dbTFvUhRql6Y3tJKrwvtVFloG562IOO25S0jcCY4FZoZ
	 ngCURoa89zLkqOKwYmKzbkxLSbBqLJko9iNRFmZY10Yznxj4hlxXY3wQVLJAcrbj25w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=KJgoWCaf;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D35606A31F;
	Sat, 28 Nov 2026 07:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69D35606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=KJgoWCaf
X-UUID: 0f488c06eb0011f1b9cf3d4034dccee2-20261128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=O3G+MRttKmNoxAj4olc3NilBe7aSEMFIGcpN4x6WEkI=;
	b=KJgoWCaf9rp8zNYOBgsU51/dc3Hu8JDTOplV4g/Tmu7xY1SJhZKFCnHxCjLe7A6r7qPQcJByE6kq4onK4vuhcHtykir6nbQOmQkqOvFfo+PmSf8ln20Ot5u0ny567+4oWOF9KMICKp4cycLQ4KGhBGEjE9xFoASQjFqSZViS7Zc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:ea2e2709-199f-456f-bfb2-61e26b182eb1,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:2ecd2c1a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0f488c06eb0011f1b9cf3d4034dccee2-20261128
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1503361054; Sat, 28 Nov 2026 15:48:11 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 28 Nov 2026 15:48:10 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Sat, 28 Nov 2026 15:48:08 +0800
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
	<tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Qianfeng Rong
	<rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v10 04/14] media: mediatek: vcodec: get different firmware ipi id
Date: Sat, 28 Nov 2026 15:47:50 +0800
Message-ID: <20261128074800.3108429-5-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128074800.3108429-1-kyrie.wu@mediatek.com>
References: <20261128074800.3108429-1-kyrie.wu@mediatek.com>
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

Getting ipi(inter-processor interrupt) id according to firmware
type and hardware index for different architecture.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_fw.c         | 14 ++++++++++++++
 .../mediatek/vcodec/common/mtk_vcodec_fw.h         |  1 +
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c      |  5 +++--
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c   |  5 +++--
 .../vcodec/decoder/vdec/vdec_hevc_req_multi_if.c   |  5 +++--
 .../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c |  5 +++--
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c      |  5 +++--
 7 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
index 552d0d8a8..8630e871d 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
@@ -3,6 +3,20 @@
 #include "../decoder/mtk_vcodec_dec_drv.h"
 #include "../encoder/mtk_vcodec_enc_drv.h"
 #include "mtk_vcodec_fw_priv.h"
+#include "mtk_vcodec_fw_vcp.h"
+
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
 
 struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_use fw_use,
 					   mtk_vcodec_fw_init_func fw_init)
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
index 50d93d47b..005ac9969 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
@@ -43,5 +43,6 @@ int mtk_vcodec_fw_ipi_register(struct mtk_vcodec_fw *fw, int id,
 int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, int id,
 			   void *buf, unsigned int len, unsigned int wait);
 int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw);
+int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id);
 
 #endif /* _MTK_VCODEC_FW_H_ */
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 49d9b4a72..154abb42b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1878,6 +1878,7 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
 	struct vdec_av1_slice_instance *instance;
 	struct vdec_av1_slice_init_vsi *vsi;
+	enum mtk_vcodec_fw_type fw_type = mtk_vcodec_fw_get_type(ctx->dev->fw_handler);
 	int ret;
 
 	instance = kzalloc_obj(*instance);
@@ -1885,8 +1886,8 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		return -ENOMEM;
 
 	instance->ctx = ctx;
-	instance->vpu.id = SCP_IPI_VDEC_LAT;
-	instance->vpu.core_id = SCP_IPI_VDEC_CORE;
+	instance->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	instance->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	instance->vpu.ctx = ctx;
 	instance->vpu.codec_type = ctx->current_codec;
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 10359ce9b..7c1c41ab9 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -1204,6 +1204,7 @@ err_free_fb_out:
 
 static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
+	enum mtk_vcodec_fw_type fw_type = mtk_vcodec_fw_get_type(ctx->dev->fw_handler);
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
index 02f39954a..2a099d983 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
@@ -855,6 +855,7 @@ static int vdec_hevc_slice_setup_core_buffer(struct vdec_hevc_slice_inst *inst,
 
 static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
+	enum mtk_vcodec_fw_type fw_type = mtk_vcodec_fw_get_type(ctx->dev->fw_handler);
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
index 391e789a5..d270e924f 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
@@ -272,6 +272,7 @@ static int vdec_vp8_slice_get_decode_parameters(struct vdec_vp8_slice_inst *inst
 
 static int vdec_vp8_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
+	enum mtk_vcodec_fw_type fw_type = mtk_vcodec_fw_get_type(ctx->dev->fw_handler);
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
index ba7a1cd99..8992cf8fa 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1833,6 +1833,7 @@ static int vdec_vp9_slice_update_core(struct vdec_vp9_slice_instance *instance,
 
 static int vdec_vp9_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
+	enum mtk_vcodec_fw_type fw_type = mtk_vcodec_fw_get_type(ctx->dev->fw_handler);
 	struct vdec_vp9_slice_instance *instance;
 	struct vdec_vp9_slice_init_vsi *vsi;
 	int ret;
@@ -1842,8 +1843,8 @@ static int vdec_vp9_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		return -ENOMEM;
 
 	instance->ctx = ctx;
-	instance->vpu.id = SCP_IPI_VDEC_LAT;
-	instance->vpu.core_id = SCP_IPI_VDEC_CORE;
+	instance->vpu.id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_LAT0);
+	instance->vpu.core_id = mtk_vcodec_fw_get_ipi(fw_type, MTK_VDEC_CORE);
 	instance->vpu.ctx = ctx;
 	instance->vpu.codec_type = ctx->current_codec;
 
-- 
2.51.0.windows.2

