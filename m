Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187635;
	b=p44B/tXtdY+E6q8/mH0typTMl4iE4Oi2ZSha6JxT8gx4O9CGUz7w5KLT0nLmi7Fe4xHz
	 JH0ts9u4HQ9K9Z5JPm2xMl20wpaayzc7RgA2hZArrPqDiq/vYCmvXAf8oN+lhta1a35rs
	 IggCh3bGJr/KjetjCSuQf+f4Z26J6f58Sw3Y/sOXxS7lh4y2jqG0IzBIjWXqkd6SWBBvz
	 g1DJ+1xTG6PNXwJfhdBFaLMLMXgoVYCSUaOo52mQu67ARW2dAz/jly30Zs/1M8hbgA66a
	 1eJCRm6nt47zXisajNvSwPIK5o6oKRrIUTEIi1D5t+/8+cPnB1g0Wswa5oGKU4NKFMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187635;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WuMRD2QdtruXPz7LjKEqa0019gv+E1m/m/y/+g9V2rQ=;
	b=5eOWqw56/bnfuC3dxZ85zxquq87x5KGg4XPZcbgNL20oOPDmA55Z2ttgcWZfMi5lHKrs
	 PGezTLNJLUE71CGBg2FzEV41xbtkNUCf/CwzeV3zXg6i7JbY6R6txvzZrXDRmQOHtnC+0
	 FPN/R8FrH0Cfib1NnCRlhuR064Pn7tKQrv9ShoEbj9zoRaBaA+tBLt4goHrbcBpkW8wPx
	 jDFywUuP7Ffr2xWkqS1xkJ91vG66kD7jUkipRzTBAfcZm7A6D8hihp1bjgUZrhEW/Tu24
	 lqcOIGrB+cc7/37T3XAKxLDAZFborSzkXA4Ktunh3WhgG81g1wnpnvvtrxB0gEi9qiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JUa6W9i8;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D68606A32C;
	Fri, 20 Nov 2026 15:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01D68606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JUa6W9i8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795187632;
	bh=uYpjRjKIcDvHcfogjZc8j+wXgp4LpP3iHh1tK9f2utU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JUa6W9i89EMto7cGwNX12qVkvkdaVYQmRC7R5j6tnBr7JqRI3vfOH1u1VcK5Q+UUg
	 Pxo4dCyu4DNZ/Q9vvtd6hgiLI+CVf6OCQo0n80lalHoUB3s4oGycLXbMhcaqV5Xvf7
	 uoyHeJjtg6XbFGeyDIh0IeXoRfsYoqGq1U+JdB7+dixwD29JVjakDTSy88mt/Dc+lM
	 DjVP9OpO6bCfItPFILRxjS9XsV9K4FeaanJLR7EBvyd67v3Nl7ARHe/3nPudYdloee
	 dlf+DLjgjyn2ycGXR0zBo40wdFjSytxkijr65i6M4Gqdh/pXn60KerKVBkoEp3fu0p
	 Uf4Oyt50khyRQ==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9574517E0ACE;
	Fri, 20 Nov 2026 16:13:52 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 5/7] media: verisilicon: vp8: Use alloc/free helpers for auxiliary buffers
Date: Fri, 20 Nov 2026 16:13:43 +0100
Message-ID: <20261120151345.88802-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120151345.88802-1-benjamin.gaignard@collabora.com>
References: <20261120151345.88802-1-benjamin.gaignard@collabora.com>
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

Simplify and clean up the code by using the helpers.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/platform/verisilicon/hantro_vp8.c   | 37 +++++--------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_vp8.c b/drivers/media/platform/verisilicon/hantro_vp8.c
index 381bc1d3bfda..881e6c21f0fa 100644
--- a/drivers/media/platform/verisilicon/hantro_vp8.c
+++ b/drivers/media/platform/verisilicon/hantro_vp8.c
@@ -144,11 +144,9 @@ void hantro_vp8_prob_update(struct hantro_ctx *ctx,
 
 int hantro_vp8_dec_init(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_aux_buf *aux_buf;
 	unsigned int mb_width, mb_height;
 	size_t segment_map_size;
-	int ret;
 
 	/* segment map table size calculation */
 	mb_width = DIV_ROUND_UP(ctx->dst_fmt.width, 16);
@@ -160,42 +158,27 @@ int hantro_vp8_dec_init(struct hantro_ctx *ctx)
 	 * And the data in segment map buffer must be set to all zero.
 	 */
 	aux_buf = &ctx->vp8_dec.segment_map;
-	aux_buf->size = segment_map_size;
-	aux_buf->cpu = dma_alloc_coherent(vpu->dev, aux_buf->size,
-					  &aux_buf->dma, GFP_KERNEL);
-	if (!aux_buf->cpu)
-		return -ENOMEM;
+	if (hantro_allocate_aux_buf(ctx, aux_buf, segment_map_size))
+		goto error;
 
 	/*
 	 * Allocate probability table buffer,
 	 * total 1208 bytes, 4K page is far enough.
 	 */
 	aux_buf = &ctx->vp8_dec.prob_tbl;
-	aux_buf->size = sizeof(struct vp8_prob_tbl_packed);
-	aux_buf->cpu = dma_alloc_coherent(vpu->dev, aux_buf->size,
-					  &aux_buf->dma, GFP_KERNEL);
-	if (!aux_buf->cpu) {
-		ret = -ENOMEM;
-		goto err_free_seg_map;
-	}
+	if (hantro_allocate_aux_buf(ctx, aux_buf, sizeof(struct vp8_prob_tbl_packed)))
+		goto error;
 
 	return 0;
 
-err_free_seg_map:
-	dma_free_coherent(vpu->dev, ctx->vp8_dec.segment_map.size,
-			  ctx->vp8_dec.segment_map.cpu,
-			  ctx->vp8_dec.segment_map.dma);
-
-	return ret;
+error:
+	hantro_free_aux_buf(ctx, &ctx->vp8_dec.segment_map);
+	hantro_free_aux_buf(ctx, &ctx->vp8_dec.prob_tbl);
+	return -ENOMEM;
 }
 
 void hantro_vp8_dec_exit(struct hantro_ctx *ctx)
 {
-	struct hantro_vp8_dec_hw_ctx *vp8_dec = &ctx->vp8_dec;
-	struct hantro_dev *vpu = ctx->dev;
-
-	dma_free_coherent(vpu->dev, vp8_dec->segment_map.size,
-			  vp8_dec->segment_map.cpu, vp8_dec->segment_map.dma);
-	dma_free_coherent(vpu->dev, vp8_dec->prob_tbl.size,
-			  vp8_dec->prob_tbl.cpu, vp8_dec->prob_tbl.dma);
+	hantro_free_aux_buf(ctx, &ctx->vp8_dec.segment_map);
+	hantro_free_aux_buf(ctx, &ctx->vp8_dec.prob_tbl);
 }
-- 
2.53.0

