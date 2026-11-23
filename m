Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427954;
	b=vft9zyyYa94DaJ6AQ0cE9AHvwxBzzz1m8WSIsy5X+PJRzORhltXWgS1f3gW1FaPcrrNx
	 k0WEkOy7P0FO2YCZwZYXyCctPqov1B4o1dVzwDMBgVb0uBtEBNcNkcGlY2EiaVInUgoia
	 /OkQRLL/xPHz9zByi8jO0P4HD3ojHzFo/1fK5W4H7nvveosFKWIHHAqE08xgSp4X86RM7
	 3grvOuH2tcabjVWd+ELY83tsHvp2h6hjWJDrKfc2T8m0YvbiiazAoehkiASX/wQL+VdSQ
	 KB/1JCF2WYxVsZjZp/rIoC/50Aoj0unq4KaKP/LCD5x1qW7DW06DvkilyQYS4TV6kRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427954;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EYJVe96NE+VrGD72o9OfCZoIR6BvYJwvq4SU0CJlGqs=;
	b=RHAsZeslliWoH0oIglWK7IUfDE8kVGVCe56IkJZRnSRQ9Sx7bzdwdohVFE2oRyvIfH95
	 FTitptmivwZziVspkvIQ/SDMDBTVv+hFvipO8X4HW9MJrLbpqJXfJYI1fn7/3Uum6d5Im
	 +QGuAKd5umbKFrNUiHnfw9/h1cSQE1AZBXafAJYFgwksYWiXKYqpQPfvyVzmTtx3bcskb
	 uTQS/3wrZJYAAFPHeTiPh5KdwpXVOYf4cXlrgGGXyBytwgXkhMS+V8ooTXikTdoXejD0t
	 zvpq2ez4U8mRblhDToiKnGV9M4sbhTxonG4mCC/9ShZa+pzSninegcFsTbkQuCkIcug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nQAsim8+;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EE2606A687;
	Mon, 23 Nov 2026 09:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0EE2606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nQAsim8+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795427952;
	bh=evnoDDja13qQhWcx6ZeHLGNkdq48etxzGfvzkkKHGg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nQAsim8+pCE9+MBliSBcTLdSamn6cvzw9Orz+kUfPKSTb91wXDuEUG3CwZCwS8t2C
	 LiiYeQG+jaU7X4qkxb4P/ed+EL3lSVt4KUWtyGEck4yTaE/CriWRzQ3VMiM66/Qih5
	 6P1gCdBa2MEjnf3+EAouykFce6lo3qijsim+37PQEmVhXP3khdMk8qODX44yVMh7be
	 PAPpuRHjLoPn+dcT4sequwbFoCsujoggwM36sDP1K0UKO4arF0QuqkkkEktHdOIlHu
	 M29gVlkdJ4hXNV/l6S4O5JIvzdPVwF2DXZVzxzkCj5AKskBXxj7X0H6jZ9mopI0DCx
	 Z1b8JcZu4JlwQ==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 48D3E17E0EB0;
	Mon, 23 Nov 2026 10:59:12 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 4/7] media: verisilicon: hevc: Use alloc/free helpers for auxiliary buffers
Date: Mon, 23 Nov 2026 10:59:02 +0100
Message-ID: <20261123095905.60622-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123095905.60622-1-benjamin.gaignard@collabora.com>
References: <20261123095905.60622-1-benjamin.gaignard@collabora.com>
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
changes in v3:
- As suggested by Philipp do not mask hantro_allocate_aux_buf() returned
  value.

 .../media/platform/verisilicon/hantro_hevc.c  | 133 +++++-------------
 1 file changed, 36 insertions(+), 97 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_hevc.c b/drivers/media/platform/verisilicon/hantro_hevc.c
index 83cd12b0ddd6..951ecc27ca0f 100644
--- a/drivers/media/platform/verisilicon/hantro_hevc.c
+++ b/drivers/media/platform/verisilicon/hantro_hevc.c
@@ -74,7 +74,6 @@ int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc, dma_addr_t addr)
 
 static int tile_buffer_reallocate(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
 	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
 	const struct v4l2_ctrl_hevc_pps *pps = ctrls->pps;
@@ -82,74 +81,43 @@ static int tile_buffer_reallocate(struct hantro_ctx *ctx)
 	unsigned int num_tile_cols = pps->num_tile_columns_minus1 + 1;
 	unsigned int height64 = (sps->pic_height_in_luma_samples + 63) & ~63;
 	unsigned int size;
+	int ret;
 
 	if (num_tile_cols <= 1 ||
 	    num_tile_cols <= hevc_dec->num_tile_cols_allocated)
 		return 0;
 
 	/* Need to reallocate due to tiles passed via PPS */
-	if (hevc_dec->tile_filter.cpu) {
-		dma_free_coherent(vpu->dev, hevc_dec->tile_filter.size,
-				  hevc_dec->tile_filter.cpu,
-				  hevc_dec->tile_filter.dma);
-		hevc_dec->tile_filter.cpu = NULL;
-	}
-
-	if (hevc_dec->tile_sao.cpu) {
-		dma_free_coherent(vpu->dev, hevc_dec->tile_sao.size,
-				  hevc_dec->tile_sao.cpu,
-				  hevc_dec->tile_sao.dma);
-		hevc_dec->tile_sao.cpu = NULL;
-	}
-
-	if (hevc_dec->tile_bsd.cpu) {
-		dma_free_coherent(vpu->dev, hevc_dec->tile_bsd.size,
-				  hevc_dec->tile_bsd.cpu,
-				  hevc_dec->tile_bsd.dma);
-		hevc_dec->tile_bsd.cpu = NULL;
-	}
+	hantro_free_aux_buf(ctx, &hevc_dec->tile_filter);
+	hantro_free_aux_buf(ctx, &hevc_dec->tile_sao);
+	hantro_free_aux_buf(ctx, &hevc_dec->tile_bsd);
 
 	size = (VERT_FILTER_RAM_SIZE * height64 * (num_tile_cols - 1) * ctx->bit_depth) / 8;
-	hevc_dec->tile_filter.cpu = dma_alloc_coherent(vpu->dev, size,
-						       &hevc_dec->tile_filter.dma,
-						       GFP_KERNEL);
-	if (!hevc_dec->tile_filter.cpu)
-		return -ENOMEM;
-	hevc_dec->tile_filter.size = size;
+	hevc_dec->tile_filter.attrs = DMA_ATTR_NO_KERNEL_MAPPING;
+	ret = hantro_allocate_aux_buf(ctx, &hevc_dec->tile_filter, size);
+	if (ret)
+		goto error;
 
 	size = (VERT_SAO_RAM_SIZE * height64 * (num_tile_cols - 1) * ctx->bit_depth) / 8;
-	hevc_dec->tile_sao.cpu = dma_alloc_coherent(vpu->dev, size,
-						    &hevc_dec->tile_sao.dma,
-						    GFP_KERNEL);
-	if (!hevc_dec->tile_sao.cpu)
-		goto err_free_tile_buffers;
-	hevc_dec->tile_sao.size = size;
+	hevc_dec->tile_sao.attrs = DMA_ATTR_NO_KERNEL_MAPPING;
+	ret = hantro_allocate_aux_buf(ctx, &hevc_dec->tile_sao, size);
+	if (ret)
+		goto error;
 
 	size = BSD_CTRL_RAM_SIZE * height64 * (num_tile_cols - 1);
-	hevc_dec->tile_bsd.cpu = dma_alloc_coherent(vpu->dev, size,
-						    &hevc_dec->tile_bsd.dma,
-						    GFP_KERNEL);
-	if (!hevc_dec->tile_bsd.cpu)
-		goto err_free_sao_buffers;
-	hevc_dec->tile_bsd.size = size;
+	hevc_dec->tile_bsd.attrs = DMA_ATTR_NO_KERNEL_MAPPING;
+	ret = hantro_allocate_aux_buf(ctx, &hevc_dec->tile_bsd, size);
+	if (ret)
+		goto error;
 
 	hevc_dec->num_tile_cols_allocated = num_tile_cols;
 
 	return 0;
 
-err_free_sao_buffers:
-	if (hevc_dec->tile_sao.cpu)
-		dma_free_coherent(vpu->dev, hevc_dec->tile_sao.size,
-				  hevc_dec->tile_sao.cpu,
-				  hevc_dec->tile_sao.dma);
-	hevc_dec->tile_sao.cpu = NULL;
-
-err_free_tile_buffers:
-	if (hevc_dec->tile_filter.cpu)
-		dma_free_coherent(vpu->dev, hevc_dec->tile_filter.size,
-				  hevc_dec->tile_filter.cpu,
-				  hevc_dec->tile_filter.dma);
-	hevc_dec->tile_filter.cpu = NULL;
+error:
+	hantro_free_aux_buf(ctx, &hevc_dec->tile_filter);
+	hantro_free_aux_buf(ctx, &hevc_dec->tile_sao);
+	hantro_free_aux_buf(ctx, &hevc_dec->tile_bsd);
 
 	return -ENOMEM;
 }
@@ -214,45 +182,20 @@ int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx)
 
 void hantro_hevc_dec_exit(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
 
-	if (hevc_dec->tile_sizes.cpu)
-		dma_free_coherent(vpu->dev, hevc_dec->tile_sizes.size,
-				  hevc_dec->tile_sizes.cpu,
-				  hevc_dec->tile_sizes.dma);
-	hevc_dec->tile_sizes.cpu = NULL;
-
-	if (hevc_dec->scaling_lists.cpu)
-		dma_free_coherent(vpu->dev, hevc_dec->scaling_lists.size,
-				  hevc_dec->scaling_lists.cpu,
-				  hevc_dec->scaling_lists.dma);
-	hevc_dec->scaling_lists.cpu = NULL;
-
-	if (hevc_dec->tile_filter.cpu)
-		dma_free_coherent(vpu->dev, hevc_dec->tile_filter.size,
-				  hevc_dec->tile_filter.cpu,
-				  hevc_dec->tile_filter.dma);
-	hevc_dec->tile_filter.cpu = NULL;
-
-	if (hevc_dec->tile_sao.cpu)
-		dma_free_coherent(vpu->dev, hevc_dec->tile_sao.size,
-				  hevc_dec->tile_sao.cpu,
-				  hevc_dec->tile_sao.dma);
-	hevc_dec->tile_sao.cpu = NULL;
-
-	if (hevc_dec->tile_bsd.cpu)
-		dma_free_coherent(vpu->dev, hevc_dec->tile_bsd.size,
-				  hevc_dec->tile_bsd.cpu,
-				  hevc_dec->tile_bsd.dma);
-	hevc_dec->tile_bsd.cpu = NULL;
+	hantro_free_aux_buf(ctx, &hevc_dec->tile_sizes);
+	hantro_free_aux_buf(ctx, &hevc_dec->scaling_lists);
+	hantro_free_aux_buf(ctx, &hevc_dec->tile_filter);
+	hantro_free_aux_buf(ctx, &hevc_dec->tile_sao);
+	hantro_free_aux_buf(ctx, &hevc_dec->tile_bsd);
 }
 
 int hantro_hevc_dec_init(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
 	unsigned int size;
+	int ret;
 
 	memset(hevc_dec, 0, sizeof(*hevc_dec));
 
@@ -262,21 +205,11 @@ int hantro_hevc_dec_init(struct hantro_ctx *ctx)
 	 * chunk (HW guys wanted to have this).
 	 */
 	size = round_up(MAX_TILE_COLS * MAX_TILE_ROWS * 4 * sizeof(u16) + 16, 16);
-	hevc_dec->tile_sizes.cpu = dma_alloc_coherent(vpu->dev, size,
-						      &hevc_dec->tile_sizes.dma,
-						      GFP_KERNEL);
-	if (!hevc_dec->tile_sizes.cpu)
-		return -ENOMEM;
-
-	hevc_dec->tile_sizes.size = size;
-
-	hevc_dec->scaling_lists.cpu = dma_alloc_coherent(vpu->dev, SCALING_LIST_SIZE,
-							 &hevc_dec->scaling_lists.dma,
-							 GFP_KERNEL);
-	if (!hevc_dec->scaling_lists.cpu)
-		return -ENOMEM;
+	ret = hantro_allocate_aux_buf(ctx, &hevc_dec->tile_sizes, size);
+	ret = hantro_allocate_aux_buf(ctx, &hevc_dec->scaling_lists, SCALING_LIST_SIZE);
 
-	hevc_dec->scaling_lists.size = SCALING_LIST_SIZE;
+	if (ret)
+		goto error;
 
 	hantro_hevc_ref_init(ctx);
 
@@ -284,4 +217,10 @@ int hantro_hevc_dec_init(struct hantro_ctx *ctx)
 		hevc_use_compression & hantro_needs_postproc(ctx, ctx->vpu_dst_fmt);
 
 	return 0;
+
+error:
+	hantro_free_aux_buf(ctx, &hevc_dec->tile_sizes);
+	hantro_free_aux_buf(ctx, &hevc_dec->scaling_lists);
+
+	return -ENOMEM;
 }
-- 
2.53.0

