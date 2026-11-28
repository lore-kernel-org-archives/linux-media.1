Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852109;
	b=SjrcKHsLPL5m0+5N6n64loAZA6YGYPp36bWKIqBrud0dQX/ghULDmR4wTHsILsVttyuU
	 NndlBWzh+mCQavUeI2CxAGxT9kyz5EH3HrJXBBMPkzjOmliBILndOBysdQ1U/Pbq7uyv8
	 7QrjMJOzzPP1NsmnhhkGlIP9ugJgXljuuf3SBF9HzmbVD6Eafe2yvIWHC+ZFUo5irJd0s
	 YN6Mgzq/pNXg2DIGzydkgkBrq9XPRjL1Q27/vJGxQt2/OhgR2tZIuWUx2N6uVKdGfcGy0
	 YU5IHcLEJPAiXPxgpP5BBnQ1yRB6tk90b1j7LyHu+KWgBaP/6EgmSJSfj+l5xcaLcFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852109;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=6vr8fRdX4FmEW4+zJg+R3SBojMo0/rylKaLXN9orJks=;
	b=NaCptfq7WUIeUMuVwZ+mVT+uRP4AX2eVKGJTkj5DTa0115FkS3OHpx10dQlVHnqtoULD
	 fJNh4/pIWtfXDGT7x62mz7Zy7F8ssreReLmGgIhUUo6e/kGSiZe7jAHD3JQxsSZbHPbi1
	 ETwc+/dPyoDJ4wSAz4EO4qzLSnhv4yqDHyKfw0ngIurvzcd56ltcb8ijGsrpL1VxP6kLU
	 yXTR5/0WxHVnMHlw66WFuHZdsffWrsgsNZQKgUnJUVd7LcXn8iAPYo4sol5WtbbE/V99c
	 vgmaTujG25Sm5ZuTbgYM2wxKTsQLukF2ZGW809TV9tounVusBkUJ0alGuFqvUFp3Txw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=UMyRrs12;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2307606A332;
	Sat, 28 Nov 2026 07:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2307606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=UMyRrs12
X-UUID: 153f3042eb0011f1a7aecdb2598be72c-20261128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6vr8fRdX4FmEW4+zJg+R3SBojMo0/rylKaLXN9orJks=;
	b=UMyRrs128DPRGZfPu/JvX7el7tJz28jDNYfR9u7ZAtNawQ0WcBTDQof6S9Ed328C+rAG3aHl12WuEX0qtFFF5AWwpL8ucoBJy8xWTCks7ERDqb5Ujm+wBEVHFmkleMvpaTV3oRa13vyIntkamDFXVDw+n6wFMPVHuZWWT8tGwkU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:c6c5a668-3d51-4ad2-93fc-988ca81fdfea,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:5152e666-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 153f3042eb0011f1a7aecdb2598be72c-20261128
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 369739621; Sat, 28 Nov 2026 15:48:21 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 28 Nov 2026 15:48:20 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Sat, 28 Nov 2026 15:48:18 +0800
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
Subject: [PATCH v10 10/14] media: mediatek: vcodec: define MT8196 vcodec levels.
Date: Sat, 28 Nov 2026 15:47:56 +0800
Message-ID: <20261128074800.3108429-11-kyrie.wu@mediatek.com>
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

The supported level and profile are not the same for different
codecs and architecture. Select the correct one.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index ab1894fba..472ece571 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -577,6 +577,7 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
 		break;
 	case MTK_VDEC_MT8195:
+	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_6_0;
 		break;
 	case MTK_VDEC_MT8183:
@@ -595,6 +596,7 @@ static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_config *cfg,
 	switch (ctx->dev->chip_name) {
 	case MTK_VDEC_MT8188:
 	case MTK_VDEC_MT8195:
+	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
 		break;
 	default:
@@ -611,6 +613,7 @@ static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
 		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
 		break;
 	case MTK_VDEC_MT8195:
+	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2;
 		break;
 	default:
@@ -625,6 +628,7 @@ static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
 	switch (ctx->dev->chip_name) {
 	case MTK_VDEC_MT8188:
 	case MTK_VDEC_MT8195:
+	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
 		break;
 	default:
@@ -642,6 +646,7 @@ static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
 		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
 		break;
 	case MTK_VDEC_MT8195:
+	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
 		break;
 	case MTK_VDEC_MT8186:
@@ -659,6 +664,7 @@ static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config *cfg,
 	switch (ctx->dev->chip_name) {
 	case MTK_VDEC_MT8188:
 	case MTK_VDEC_MT8195:
+	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_2;
 		break;
 	default:
-- 
2.51.0.windows.2

