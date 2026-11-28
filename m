Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852097;
	b=CugU2zranCuQpiC8iyvN+SGNFu4p0HB98q+gG/XYjL1wKUX8Ks/sEgwpajz2lbRYFcwP
	 mFxRAKfMVx6F3VVsZntuPzbF9QMVHNCzy3R5TPFCka/gldyl0Qa4Wvy+vmgq3kOzRArig
	 l4/Redr41SW/EK/uUXuITOgXJC1fC1tFsD98TjbPdIfkPi4NjOVE3382T1VHKR1VPv4Ha
	 sFJ7MC+VVru1mdCa9It5WQpRp/VirdGf6bF08IaUDNR6DqdnbXjHpelKA/mkUcdt672i2
	 7M92uLea1ou8wr+4B8MBuGpLPiNNOJttTAO+vJkS7IEa0NeRIoIT6R+5ROJy2EelbPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852097;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=Sf1pQlbMbiIrjnz8/66tGMCRdtP6utc4O8nw4rUQzS8=;
	b=W8OYoOf5iVumrJNxv3kCwslAth7y9wUt18LknZEhWav0bGYarGgtqvC4YvRM6H9MZ5HG
	 Is+M7QrpMYx5OHWzCyrsjOan1CkCA2ngv4Xfut83BNk660Rj3xi1zc+tBj972Cj8Nivll
	 osWViXThExg4+GSFajar3PBSipHrD8AKLDk+p6Ne4tFkeC3KoKpzDlYyxEImoFaF0r78o
	 +8/WeIAC5rzwp6Ae5kGntARgk9edzJhiKSMWTSnLIMD1ACD0v5iK96bNJ49xoetzR6pfF
	 9EMXECG7dhrHwnFAQ1JM1ySdohpPHrm/ryCli2mvVMOEv7kJrFS3m1qtzFu+wol83QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="j/HZeWMQ";
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C08606A335;
	Sat, 28 Nov 2026 07:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9C08606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=j/HZeWMQ
X-UUID: 114141baeb0011f1b9cf3d4034dccee2-20261128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Sf1pQlbMbiIrjnz8/66tGMCRdtP6utc4O8nw4rUQzS8=;
	b=j/HZeWMQyCCFufNzb0BZnZWsBqAW2Xnotuvz319M5ra58Ct0/sWFeUdAny/1/rC7RnyRebeKtoAMUlkqijAt1Gr7ZtIo1O0q3Ww79ruLQqE3Vu1FKEu9EX7DOpBpUAoApOdi6OTxVoXz2LZl4RLuy+ld8nBcMnuHrqo1o+qcW7w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:c527bc6c-908c-4aab-9803-ddf5064f080a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:2152e666-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 114141baeb0011f1b9cf3d4034dccee2-20261128
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1851336856; Sat, 28 Nov 2026 15:48:14 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 28 Nov 2026 15:48:13 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Sat, 28 Nov 2026 15:48:11 +0800
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
Subject: [PATCH v10 06/14] media: mediatek: vcodec: add debug information
Date: Sat, 28 Nov 2026 15:47:52 +0800
Message-ID: <20261128074800.3108429-7-kyrie.wu@mediatek.com>
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

Print hevc/av1 output format and 10bit capture format
information to debug.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
index 2da11521f..a9e52a320 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
@@ -29,6 +29,14 @@ static void mtk_vdec_dbgfs_get_format_type(struct mtk_vcodec_dec_ctx *ctx, char
 		curr_len = snprintf(buf + *used, total - *used,
 				    "\toutput format: vp9 slice\n");
 		break;
+	case V4L2_PIX_FMT_HEVC_SLICE:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\toutput format: hevc slice\n");
+		break;
+	case V4L2_PIX_FMT_AV1_FRAME:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\toutput format: av1 slice\n");
+		break;
 	default:
 		curr_len = snprintf(buf + *used, total - *used,
 				    "\tunsupported output format: 0x%x\n",
@@ -45,6 +53,14 @@ static void mtk_vdec_dbgfs_get_format_type(struct mtk_vcodec_dec_ctx *ctx, char
 		curr_len = snprintf(buf + *used, total - *used,
 				    "\tcapture format: MT21C\n");
 		break;
+	case V4L2_PIX_FMT_MT2110T:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\tcapture format: MT2110T (10bit tile mode)\n");
+		break;
+	case V4L2_PIX_FMT_MT2110R:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\tcapture format: MT2110R (10bit raster mode)\n");
+		break;
 	default:
 		curr_len = snprintf(buf + *used, total - *used,
 				    "\tunsupported capture format: 0x%x\n",
@@ -122,9 +138,10 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
 
 		if (dbgfs_index[MTK_VDEC_DBGFS_PICINFO]) {
 			curr_len = snprintf(buf + used_len, total_len - used_len,
-					    "\treal(%dx%d)=>align(%dx%d)\n",
+					    "\treal(%dx%d)=>align(%dx%d) 10bit(%d)\n",
 					    ctx->picinfo.pic_w, ctx->picinfo.pic_h,
-					    ctx->picinfo.buf_w, ctx->picinfo.buf_h);
+					    ctx->picinfo.buf_w, ctx->picinfo.buf_h,
+					    ctx->is_10bit_bitstream);
 			used_len += curr_len;
 		}
 
-- 
2.51.0.windows.2

