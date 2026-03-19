Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873E93859C0;
	Thu, 19 Mar 2026 02:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773886928; cv=none; b=XYzKDf+n9AAMQl7lYcWsgBaD89E142HS2q8qKfgDubccTJY15CY6o5zhmuj+5LGCx3onYbSYuvWbtUbK5dodBrfaRew4WCdx2HUPLUrgvtXnRi0ZbvykXzoAqMGrvjQx2MfXDq1bBzImsmmgqnuNyqZ+V1UgvZlEGW8mhNRaCgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773886928; c=relaxed/simple;
	bh=F6BCz1W/6IkUSkSq4PyHbJ16pszmpcA89Hs3UfZ1R2A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OzCr/7kOZIN9TckBJahp1GWeuJOecXxxuXmFiVVvPPhnQa5dGoJy3bUpL77CJc2sBtrt3t/eQ/N5+ygLlssT4QCtfEaNp4lWs/UZb6gK/EActwk96TvVvI7K1F194ULA8Loy0kGWIM7EtZOQIBESOPCoO7ZhafObaLNmAZ7LylU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=iQYlssHo; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iQYlssHo"
X-UUID: 67bd4928233a11f1a39cd589f645bc18-20260319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=OF09D1blmjrOmkJf4C4D8gCiJHH4E8NDDCU6oRB/rFs=;
	b=iQYlssHovEkuLkez+TwLYkPym1YMQfcDfkty+uDTB4CgzyiiJfNEGy8ZPCUWaR2+O4yPwJ7NnQWU5Q47KEr1N+MGOlbWugX5ZWkkKz1238iF2KHtVN6Zsy5AuYtXACwIJNFJy+e1UE8+8TFu9lniey3ofy+UhVmvrhFdGPVZRPo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:99206e15-b504-4a59-94e3-d52809a22ab9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:19f5e2d4-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 67bd4928233a11f1a39cd589f645bc18-20260319
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 445308726; Thu, 19 Mar 2026 10:21:58 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 19 Mar 2026 10:21:56 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 19 Mar 2026 10:21:56 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v13 03/12] media: mediatek: jpeg: fix buffer structure size and layout
Date: Thu, 19 Mar 2026 10:21:42 +0800
Message-ID: <20260319022152.31313-4-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260319022152.31313-1-kyrie.wu@mediatek.com>
References: <20260319022152.31313-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Updates the `buf_struct_size` in the JPEG driver to use the correct
structure `mtk_jpeg_src_buf` instead of `v4l2_m2m_buffer`, ensuring
proper handling of source buffers. The previous buffer size led to
mismatches and potential issues during video buffer handling.

Moves `frame_num` in the `mtk_jpeg_src_buf` structure to align with
other members appropriately. The first field of the driver-specific
buffer structure must be the subsystem-specificstruct
(vb2_v4l2_buffer in the case of V4L2).

Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index f12e7dc073f3..687354d76e6e 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1092,7 +1092,7 @@ static int mtk_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	dst_vq->io_modes = VB2_DMABUF | VB2_MMAP;
 	dst_vq->drv_priv = ctx;
-	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	dst_vq->buf_struct_size = sizeof(struct mtk_jpeg_src_buf);
 	dst_vq->ops = jpeg->variant->qops;
 	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 6be5cf30dea1..148fd41759b7 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -85,10 +85,10 @@ struct mtk_jpeg_variant {
 };
 
 struct mtk_jpeg_src_buf {
-	u32 frame_num;
 	struct vb2_v4l2_buffer b;
 	struct list_head list;
 	u32 bs_size;
+	u32 frame_num;
 	struct mtk_jpeg_dec_param dec_param;
 
 	struct mtk_jpeg_ctx *curr_ctx;
-- 
2.45.2

