Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187634;
	b=OHuWu6OVdnKZJAEJT9wZeUFnIYioYzVFMA8+uqan1D8Ng1tmgVt7P8Qhh0PtA1waK/PH
	 nMTGCLc/ZcvfDc6b2BJbE3cB8JOvl3SnDOkZxTtRLyoCXZO9Sr80cHqfP+/nNRCdrcDoN
	 FZQY2KWQVLLQ/Y3/sIE/H/OJfGKU7loZhE9iZYxWuSC5bOzU/VZ5kOZ6Ddp4/Evr9HCmV
	 GLu05p6JsDHD6SHBEt/Ibg0OQ2//PRgfqB4lRBC6TOhIZWcB6WotUzhfnSoky1/qODk5+
	 yIpQ5el10awWG5xNk3Jkutpd0VevKU4/Jv49k/RZiESy8+AIiYPwRRigUe/mYyC12eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187634;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wum9UTH7k5KUf/gIvdZYtDUvKY4lwu9bOBdclBB3LIw=;
	b=iOmcxdiXSEXkaKskMZrvRl09P6pKEIxuSkI3n9eMTS6BJW3glat7bWUlsuR6Mr5leKdw
	 n8ZqYfgrtoVR6sI9GcY0Z/UGMQ1MJ69TyeADi8JacCWnJz39gnf93nhFwIGqLlzQc8k7+
	 6lnSZGsrkMbLESH+BG+mOSfASwsVw8m+6tppwkETmM0UryrUUI44H8cfGYkZ+ZfHmGL73
	 bUrSPXBDP20Z9fdZ9kEW02Y2BSmgLuRfk4sXykIyIfY/LSwBfVpPZUJGqemx1a80R+T/f
	 bijcZvvcdQkJTZ7cC8JJXqHZp3x9xt9OrBIsQl1gEO3+OF1SbF2CHlV46fH7EUP7Cig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nNKngpPU;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE16606A33C;
	Fri, 20 Nov 2026 15:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE16606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nNKngpPU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795187632;
	bh=8Rk9LjJ/jdOzkoL2cr3fH0fUboreQmsCt3JKbE30n6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nNKngpPURUAUmwxbDD18PfpzqmPts8j+ocbAIgR894nI2YKKVy765DOcspp2E98v5
	 YrfDUaehpKppVv4vr5gc61I1NPyRAbWtwto2EVuhUVkYvEooT2Mgt7vr8HG7XCWYio
	 akP8V5IFMAq4m98zdg7Xw5J+jOE0nI8EInEBoodynTiE6S9kjwyCvOF86W+HSRu4AR
	 3d/L3b0ytOosrnJ04UBEAcDnsOM1AznEezE0we5Ch+CIg0n6dF4y2JhEAsc3jClux4
	 2cvy35JGzyYKibDYj0gpksfdL372mtzXdYXl1fwp0NBwZkSo+W0C70nIB3lwSH0Qwb
	 RxJyHcAdzo9uA==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40B6617E09F3;
	Fri, 20 Nov 2026 16:13:52 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 4/7] media: verisilicon: hevc: Use alloc/free helpers for auxiliary buffers
Date: Fri, 20 Nov 2026 16:13:42 +0100
Message-ID: <20261120151345.88802-5-benjamin.gaignard@collabora.com>
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
 .../media/platform/verisilicon/hantro_hevc.c  | 130 +++++-------------
 1 file changed, 33 insertions(+), 97 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_hevc.c b/drivers/media/platform/verisilicon/hantro_hevc.c
index 83cd12b0ddd6..cc6fa233c0a0 100644
--- a/drivers/media/platform/verisilicon/hantro_hevc.c
+++ b/drivers/media/platform/verisilicon/hantro_hevc.c
@@ -74,7 +74,6 @@ int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc, dma_addr_t addr)
 
 static int tile_buffer_reallocate(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
 	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
 	const struct v4l2_ctrl_hevc_pps *pps = ctrls->pps;
@@ -82,74 +81,40 @@ static int tile_buffer_reallocate(struct hantro_ctx *ctx)
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
 
 	size = (VERT_SAO_RAM_SIZE * height64 * (num_tile_cols - 1) * ctx->bit_depth) / 8;
-	hevc_dec->tile_sao.cpu = dma_alloc_coherent(vpu->dev, size,
-						    &hevc_dec->tile_sao.dma,
-						    GFP_KERNEL);
-	if (!hevc_dec->tile_sao.cpu)
-		goto err_free_tile_buffers;
-	hevc_dec->tile_sao.size = size;
+	hevc_dec->tile_sao.attrs = DMA_ATTR_NO_KERNEL_MAPPING;
+	ret |= hantro_allocate_aux_buf(ctx, &hevc_dec->tile_sao, size);
 
 	size = BSD_CTRL_RAM_SIZE * height64 * (num_tile_cols - 1);
-	hevc_dec->tile_bsd.cpu = dma_alloc_coherent(vpu->dev, size,
-						    &hevc_dec->tile_bsd.dma,
-						    GFP_KERNEL);
-	if (!hevc_dec->tile_bsd.cpu)
-		goto err_free_sao_buffers;
-	hevc_dec->tile_bsd.size = size;
+	hevc_dec->tile_bsd.attrs = DMA_ATTR_NO_KERNEL_MAPPING;
+	ret |= hantro_allocate_aux_buf(ctx, &hevc_dec->tile_bsd, size);
+
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
@@ -214,45 +179,20 @@ int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx)
 
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
 
@@ -262,21 +202,11 @@ int hantro_hevc_dec_init(struct hantro_ctx *ctx)
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
 
@@ -284,4 +214,10 @@ int hantro_hevc_dec_init(struct hantro_ctx *ctx)
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

