Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859431;
	b=116qeVDZiO9ydaoaR4Lk3kA+Y4i/A4VOrDyMXtBDKJTDy93uHfECX/XVo5w12PyH5qV0
	 mmwgrEdN2FywktS0Saff0P4B62tNE/r9bwxWyOUuw5l3I9sC7kaz0kI7N5Uxgh9I6kSs/
	 mOciVEI61Z89KvAO15K1r0/OwgUCCC1sctd7z0BGi5ZVFnWVZYPmhSjSEPtx2ZrlVqnGc
	 +xr/g72DjmvFa7aaenK3cW1Am7qWOI93jiCOY9myXB8N+HDehRU3ukLzpsqQdfuq7CYTn
	 Ayb2es0iIpKaPLhIkFkSMJIcfuagj5CTbKMxi01o3DLMYiOihdTnP9wQV9MYkuSbTEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859431;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=SBXrMA4OPvMSxgKPEkxv8IegE/u3Mj36yDglY+dCJGM=;
	b=vz00knNOZI+M1BQHKQZZP8xQ+2NQA2KIfk1l+L4RrWTtgjvkbyyJ8qwBF9mNYLH78pyc
	 5V8ZJrUxebQTxfRbyFy7c81oPeK29Djqr3m4e9dbVHdOfbneaxFsGRJvveC2Ulczx0jrY
	 iqnf+39q1oBph0e++sFv8CgGGMPzOtKLrAJpETsUY2A+4rRfxB3oOq+NkRLCTVHRaru9T
	 90ULAdZ3gxNoT4NFnJIepNiTq2e24qafpmgFm38tYDXJbY5v+XKJd/ZGSGVKRqnUmwFas
	 8n2U6WwCoFmY8RI1GJlBOgWSa5YOvy2VywMnKwlZMSjWKWlpPvlY7ebmg7il6+USMqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=X4q42k32;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1BE606A323;
	Sat, 28 Nov 2026 09:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F1BE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=X4q42k32
X-UUID: 2226036aeb1111f1b9cf3d4034dccee2-20261128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SBXrMA4OPvMSxgKPEkxv8IegE/u3Mj36yDglY+dCJGM=;
	b=X4q42k32NcLBJQAhn3yAUrxQrfWZLMxuKxStU04Lz4syf1Dkdc/Rm0Cu2T5VJckzoRqiu14mujNnU3cigN+Xe5r5pLyLsKhX146irHWeY1ScWUGoSAraGYLvKRmK51Pg7ObzGum9JxMqacCNXIH+R7egnishFSWo+EkNYCEfu7U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:6dc13f13-1598-42b0-972c-00fa12a2de55,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:2e16e766-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2226036aeb1111f1b9cf3d4034dccee2-20261128
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 111388127; Sat, 28 Nov 2026 17:50:24 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 28 Nov 2026 17:50:22 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Sat, 28 Nov 2026 17:50:21 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v13 05/10] media: mediatek: vcodec: Add VP9 Probability Size Configuration
Date: Sat, 28 Nov 2026 17:50:09 +0800
Message-ID: <20261128095014.3128536-6-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128095014.3128536-1-kyrie.wu@mediatek.com>
References: <20261128095014.3128536-1-kyrie.wu@mediatek.com>
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

Introduce support for using different probability buffer sizes for
different stateless decoders: in particular, the VP9 decoder can use
a different size on different SoCs because of different
hardware capabilities.

Move the hardcoded single probability buffer size value to
decoder params, introduce a new VP9_4K_PROB_BUF_SIZE and assign:
  - VP9_PROB_BUF_SIZE (2560 lines) to legacy SoCs;
  - VP9_4K_PROB_BUF_SIZE (3840 lines) to newer SoCs (MT8196, MT8189).

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h         | 2 ++
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c    | 1 +
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c   | 9 +++++++++
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c   | 4 ++--
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index bbfa6954d..0bde1c5b5 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -82,10 +82,12 @@ struct vdec_pic_info {
  * struct mtk_vcodec_dec_params - decoder supported parameters
  * @level: decoder supported vcodec level
  * @profile: decoder supported vcodec profile
+ * @prob_size: vp9 decoder probability size
  */
 struct mtk_vcodec_dec_params {
 	s64 level;
 	s64 profile;
+	size_t prob_size;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index bf3569e6b..bfa62974b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -632,5 +632,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+		.prob_size = 2560,
 	},
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 5f2797971..7702c596d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -10,6 +10,9 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "vdec_drv_if.h"
 
+#define VP9_PROB_BUF_SIZE 2560
+#define VP9_4K_PROB_BUF_SIZE 3840
+
 /**
  * struct mtk_stateless_control  - CID control type
  * @cfg: control configuration
@@ -892,6 +895,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+		.prob_size = VP9_PROB_BUF_SIZE,
 	},
 };
 
@@ -945,6 +949,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+		.prob_size = VP9_PROB_BUF_SIZE,
 	},
 };
 
@@ -965,6 +970,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+		.prob_size = VP9_PROB_BUF_SIZE,
 	},
 };
 
@@ -985,6 +991,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+		.prob_size = VP9_PROB_BUF_SIZE,
 	},
 };
 
@@ -1005,6 +1012,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+		.prob_size = VP9_4K_PROB_BUF_SIZE,
 	},
 };
 
@@ -1042,5 +1050,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+		.prob_size = VP9_PROB_BUF_SIZE,
 	},
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index e3c768b0d..bc21935b7 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -22,7 +22,6 @@
 #define VP9_RESET_FRAME_CONTEXT_ALL 3
 
 #define VP9_TILE_BUF_SIZE 4096
-#define VP9_PROB_BUF_SIZE 2560
 #define VP9_COUNTS_BUF_SIZE 16384
 
 #define HDR_FLAG(x) (!!((hdr)->flags & V4L2_VP9_FRAME_FLAG_##x))
@@ -551,6 +550,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_instance *i
 					       struct vdec_vp9_slice_vsi *vsi)
 {
 	struct mtk_vcodec_dec_ctx *ctx = instance->ctx;
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
 	enum vdec_vp9_slice_resolution_level level;
 	/* super blocks */
 	unsigned int max_sb_w;
@@ -621,7 +621,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_instance *i
 	}
 
 	if (!instance->prob.va) {
-		instance->prob.size = VP9_PROB_BUF_SIZE;
+		instance->prob.size = pdev->vdec_pdata->vp9_params.prob_size;
 		if (mtk_vcodec_mem_alloc(ctx, &instance->prob))
 			goto err;
 	}
-- 
2.51.0.windows.2

