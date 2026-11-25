Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587397;
	b=NLvnMli9nkTlwXsiPyGICtuOwANLiMmFJL6DFt1vabcdCtgt/qbNM5HFm/j/TeqJRA2I
	 Rg1RyvhqauwjW0hQPgNYTIBpZg8ugq40RMiK/4SSWLk6z+GfWRbZjT9WetXcEA3ZyIELB
	 TjKM9UB5x3JxZfOgMk6jaTdmQmvcLNuo0EEy2qwnWSwHOpvZFCdOrCQLYtYwh8vNyS5ZC
	 ozVlpR8KEvjRRapgLPqEv6Gr4RbcUMRdlmhKTPAuVHV4gmo4Q/H/CUSC6k8G+MmnMsa+e
	 vcc+83/cEIbV11TaTiuknQDQSuC7WfRNxxHP0aLDWG6e/36bSTiA/sAixcx/Y9LMnlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587397;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=GQIyhrWituSo4khzwwk6ifkbTQSv4OQVU4aUUyh4K54=;
	b=zUhnDngRfp39XK9YfhywUdw99v7QDholvHGP4J0tjBVaRzynuIHD5N2MTVE3xD9VuoVE
	 Z3bre1qOhnHjHJiNkptwdqQJbzXK4Rkr69KxJDxvIS2ZJnKmT/p+bkzx39l+jtpr5vQ4b
	 Af8sR2C6l5Mz+U16q8lYkO92ChAeUTgk8EQLcJtTf+oISWgCFoQ+5zResYNoc/XvSHoTa
	 jBXcaG1pdbMTJkrSjUqNm5Hiu/gMbqUEfwFQaIOfs+IyE/E99RzFGZVo06YVOGio3j+eb
	 qcvHwEOLQbUMQddq00MYawSWnTct/dcc2LeRFBjgLbeYgMuiWhmGkJXaMl++TDdbcPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Q0LS2Ymo;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B6A606A68C;
	Wed, 25 Nov 2026 06:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49B6A606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Q0LS2Ymo
X-UUID: be25c40ce89711f18dc8c9802ae25ab1-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GQIyhrWituSo4khzwwk6ifkbTQSv4OQVU4aUUyh4K54=;
	b=Q0LS2YmobVViZaqHcUvBiGAqTQmPhQUMT4ENj2GKY2uFV35yJLYdHOzHqtXatgwkRuF9GJ6/zBoyquH01rGdvATfzM+YObHvxfkxThp6K86JdrbnDQlMwQp9emScoAoCQk4XfYMpjbDi3T4o1BZx1M4gfhvVjQigA/9YMTgZoyQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:a5fcebfe-e6c1-4130-afcf-3d1b15e84953,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:61f9f2bd-9e04-43bc-9c07-a2d8d8315d7e,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: be25c40ce89711f18dc8c9802ae25ab1-20261125
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 265563208; Wed, 25 Nov 2026 14:16:25 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:16:25 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:16:24 +0800
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
Subject: [PATCH v20 04/15] media: mediatek: jpeg: Fix buffer completion on multi-core streaming stop
Date: Wed, 25 Nov 2026 14:16:07 +0800
Message-ID: <20261125061618.2544386-5-kyrie.wu@mediatek.com>
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

Enhances the Mediatek JPEG driver's stability and reliability by ensuring
that all queued buffers are processed before stopping the streaming in
multi-core environments. It introduces a call to
`vb2_wait_for_all_buffers()` in the `mtk_jpeg_enc_stop_streaming()` and
`mtk_jpeg_dec_stop_streaming()` functions when the `multi_core` variant
is enabled. This change ensures that no buffers are left unprocessed,
preventing potential data loss or corruption during multi-core flow.

Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 16798b2c7..6386f9004 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -850,22 +850,33 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(struct mtk_jpeg_ctx *ctx,
 static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct vb2_v4l2_buffer *vb;
 
 	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
 		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
+
+	if (jpeg->variant->multi_core)
+		vb2_wait_for_all_buffers(q);
 }
 
 static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct vb2_v4l2_buffer *vb;
 
+	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
+		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
+
 	/*
 	 * STREAMOFF is an acknowledgment for source change event.
 	 * Before STREAMOFF, we still have to return the old resolution and
 	 * subsampling. Update capture queue when the stream is off.
 	 */
+	if (jpeg->variant->multi_core)
+		vb2_wait_for_all_buffers(q);
+
 	if (ctx->state == MTK_JPEG_SOURCE_CHANGE &&
 	    V4L2_TYPE_IS_CAPTURE(q->type)) {
 		struct mtk_jpeg_src_buf *src_buf;
@@ -877,9 +888,6 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
 	} else if (V4L2_TYPE_IS_OUTPUT(q->type)) {
 		ctx->state = MTK_JPEG_INIT;
 	}
-
-	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
-		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
 }
 
 static const struct vb2_ops mtk_jpeg_dec_qops = {
-- 
2.51.0.windows.2

