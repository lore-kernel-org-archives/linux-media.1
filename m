Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187633;
	b=Vi9TeYbRqDgMEd7jQZukvHpFK27Z8IzWIF69BcFYVLYVQILEWkZvP3CA+BPL4VnOc0Vb
	 8dw2AeuDbvfV9hSwQoErDlgGUDME3/wlGJEeU8ygQWh9TfaDbAKEDVXHa31Sib3W6OuZb
	 YAT4O7jBqr4qsUecU1M2iVNIpFjPjvHUsOtxrmKKYFSXgxCoJXM9DW0kGlAttv4ajrXoq
	 Yk6WlEPzREFBDalKFUeT7S9b4KESvGqZiSYZ/FMpxSyofh+nar27gZX/BdnxZCG8pSnic
	 52LTYBtrb9Suvtry4oCahXuF4IE3CACY7JaU8zyB4/tgKjucfNRwiy9nqCK06Q2Ugrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187633;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qkuVzP7cCIjxZRAXZYRaAbkmEUUanEEGRVOUD2p+qvI=;
	b=j3i4zwOAMezqfDxjsvzX9Wmdyk60SzPQlpX+hDIr66fcbCDXxUCtnntNcjSVskDSvQu5
	 +Y1NWyeEtlhO7exm68fCmYLqB16/kk8nZUo1qEJwnsKNXQPa9Tsc9MsNu3pBCFUsR2Kp0
	 UXQr4gf6My8WVtfujfBuftvnek8RQBhBNIzkrjtxRVLEQGNejf9pTpKFUutqtC/mv8VIj
	 WnXtycG2/2oWHj7bx1dsLK7+Ir2MSok6/8D5XAi/oXEnwmnuKctEWMlYa00jk9aT63/+Y
	 c6I19TjjWX3fB2/G4vPaUqowk3VxrFPG45X5EPiqv8RqHCjC5haw6k0NJ9y1Xpl90aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RHprcYsB;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552A6606A326;
	Fri, 20 Nov 2026 15:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 552A6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RHprcYsB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795187631;
	bh=A02ED9LtA+ehxxa4E3wM7zDbo9eIWPexhlev9g9E81Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RHprcYsBLGhCPnleM/840zyTL99FWPeeQQPFcIn8cBlWAQDefIutidI5xDZteVCU1
	 eifLfyZPd+eQlB4lYkbw/uiD/IyNmR6bCDnkqp/9opSMi4y2Bfwuiiazora5LxxMHR
	 40zAMTBBDwtQHQ3mkKhxXK0baq2DmVOMPW4xcyT4pE8uIqRfe5UpVS83Mwq32yGGvx
	 pjvRS+xjAGibDm/CnEM8+AGjvsiVwwZXp1RHKBLx8voQ1jBc88K96GQifIuPbqK2iQ
	 chhn4A79+PiU4xj0nfl4XRPK4WszLDD0cTUlnEB8Hk60p5cD8jZl8QgDBWisXetSMI
	 /8CLljSQSdjVw==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A8AB17E0883;
	Fri, 20 Nov 2026 16:13:51 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 2/7] media: verisilicon: AV1: Use alloc/free helpers for auxiliary buffers
Date: Fri, 20 Nov 2026 16:13:40 +0100
Message-ID: <20261120151345.88802-3-benjamin.gaignard@collabora.com>
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
 .../media/platform/verisilicon/hantro_av1.c   | 177 ++++--------------
 1 file changed, 39 insertions(+), 138 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_av1.c b/drivers/media/platform/verisilicon/hantro_av1.c
index 2cde32f0e935..e05816c7dfa3 100644
--- a/drivers/media/platform/verisilicon/hantro_av1.c
+++ b/drivers/media/platform/verisilicon/hantro_av1.c
@@ -235,40 +235,17 @@ size_t hantro_av1_chroma_size(struct hantro_ctx *ctx)
 
 static void hantro_av1_tiles_free(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 
-	if (av1_dec->db_data_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->db_data_col.size,
-				  av1_dec->db_data_col.cpu,
-				  av1_dec->db_data_col.dma);
-	av1_dec->db_data_col.cpu = NULL;
-
-	if (av1_dec->db_ctrl_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->db_ctrl_col.size,
-				  av1_dec->db_ctrl_col.cpu,
-				  av1_dec->db_ctrl_col.dma);
-	av1_dec->db_ctrl_col.cpu = NULL;
-
-	if (av1_dec->cdef_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->cdef_col.size,
-				  av1_dec->cdef_col.cpu, av1_dec->cdef_col.dma);
-	av1_dec->cdef_col.cpu = NULL;
-
-	if (av1_dec->sr_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->sr_col.size,
-				  av1_dec->sr_col.cpu, av1_dec->sr_col.dma);
-	av1_dec->sr_col.cpu = NULL;
-
-	if (av1_dec->lr_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->lr_col.size,
-				  av1_dec->lr_col.cpu, av1_dec->lr_col.dma);
-	av1_dec->lr_col.cpu = NULL;
+	hantro_free_aux_buf(ctx, &av1_dec->db_data_col);
+	hantro_free_aux_buf(ctx, &av1_dec->db_ctrl_col);
+	hantro_free_aux_buf(ctx, &av1_dec->cdef_col);
+	hantro_free_aux_buf(ctx, &av1_dec->sr_col);
+	hantro_free_aux_buf(ctx, &av1_dec->lr_col);
 }
 
 static int hantro_av1_tiles_reallocate(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
 	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
@@ -277,6 +254,7 @@ static int hantro_av1_tiles_reallocate(struct hantro_ctx *ctx)
 	unsigned int height_in_sb = height / 64;
 	unsigned int stripe_num = ((height + 8) + 63) / 64;
 	size_t size;
+	int ret;
 
 	if (av1_dec->db_data_col.size >=
 	    ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols)
@@ -285,44 +263,22 @@ static int hantro_av1_tiles_reallocate(struct hantro_ctx *ctx)
 	hantro_av1_tiles_free(ctx);
 
 	size = ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols;
-	av1_dec->db_data_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						      &av1_dec->db_data_col.dma,
-						      GFP_KERNEL);
-	if (!av1_dec->db_data_col.cpu)
-		goto buffer_allocation_error;
-	av1_dec->db_data_col.size = size;
+	ret = hantro_allocate_aux_buf(ctx, &av1_dec->db_data_col, size);
 
 	size = ALIGN(height * 2 * 16 / 4, 128) * num_tile_cols;
-	av1_dec->db_ctrl_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						      &av1_dec->db_ctrl_col.dma,
-						      GFP_KERNEL);
-	if (!av1_dec->db_ctrl_col.cpu)
-		goto buffer_allocation_error;
-	av1_dec->db_ctrl_col.size = size;
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->db_ctrl_col, size);
 
 	size = ALIGN(height_in_sb * 44 * ctx->bit_depth * 16 / 8, 128) * num_tile_cols;
-	av1_dec->cdef_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						   &av1_dec->cdef_col.dma,
-						   GFP_KERNEL);
-	if (!av1_dec->cdef_col.cpu)
-		goto buffer_allocation_error;
-	av1_dec->cdef_col.size = size;
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->cdef_col, size);
 
 	size = ALIGN(height_in_sb * (3040 + 1280), 128) * num_tile_cols;
-	av1_dec->sr_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						 &av1_dec->sr_col.dma,
-						 GFP_KERNEL);
-	if (!av1_dec->sr_col.cpu)
-		goto buffer_allocation_error;
-	av1_dec->sr_col.size = size;
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->sr_col, size);
 
 	size = ALIGN(stripe_num * 1536 * ctx->bit_depth / 8, 128) * num_tile_cols;
-	av1_dec->lr_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						 &av1_dec->lr_col.dma,
-						 GFP_KERNEL);
-	if (!av1_dec->lr_col.cpu)
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->lr_col, size);
+
+	if (ret)
 		goto buffer_allocation_error;
-	av1_dec->lr_col.size = size;
 
 	av1_dec->num_tile_cols_allocated = num_tile_cols;
 	return 0;
@@ -334,105 +290,50 @@ static int hantro_av1_tiles_reallocate(struct hantro_ctx *ctx)
 
 void hantro_av1_exit(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 
-	if (av1_dec->global_model.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->global_model.size,
-				  av1_dec->global_model.cpu,
-				  av1_dec->global_model.dma);
-	av1_dec->global_model.cpu = NULL;
-
-	if (av1_dec->tile_info.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->tile_info.size,
-				  av1_dec->tile_info.cpu,
-				  av1_dec->tile_info.dma);
-	av1_dec->tile_info.cpu = NULL;
-
-	if (av1_dec->film_grain.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->film_grain.size,
-				  av1_dec->film_grain.cpu,
-				  av1_dec->film_grain.dma);
-	av1_dec->film_grain.cpu = NULL;
-
-	if (av1_dec->prob_tbl.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->prob_tbl.size,
-				  av1_dec->prob_tbl.cpu, av1_dec->prob_tbl.dma);
-	av1_dec->prob_tbl.cpu = NULL;
-
-	if (av1_dec->prob_tbl_out.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->prob_tbl_out.size,
-				  av1_dec->prob_tbl_out.cpu,
-				  av1_dec->prob_tbl_out.dma);
-	av1_dec->prob_tbl_out.cpu = NULL;
-
-	if (av1_dec->tile_buf.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->tile_buf.size,
-				  av1_dec->tile_buf.cpu, av1_dec->tile_buf.dma);
-	av1_dec->tile_buf.cpu = NULL;
+	hantro_free_aux_buf(ctx, &av1_dec->global_model);
+	hantro_free_aux_buf(ctx, &av1_dec->tile_info);
+	hantro_free_aux_buf(ctx, &av1_dec->film_grain);
+	hantro_free_aux_buf(ctx, &av1_dec->prob_tbl);
+	hantro_free_aux_buf(ctx, &av1_dec->prob_tbl_out);
 
 	hantro_av1_tiles_free(ctx);
 }
 
 int hantro_av1_init(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	int ret = 0;
 
 	memset(av1_dec, 0, sizeof(*av1_dec));
 
-	av1_dec->global_model.cpu = dma_alloc_coherent(vpu->dev, GLOBAL_MODEL_SIZE,
-						       &av1_dec->global_model.dma,
-						       GFP_KERNEL);
-	if (!av1_dec->global_model.cpu)
-		return -ENOMEM;
-	av1_dec->global_model.size = GLOBAL_MODEL_SIZE;
-
-	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_SIZE,
-						    &av1_dec->tile_info.dma,
-						    GFP_KERNEL);
-	if (!av1_dec->tile_info.cpu)
-		return -ENOMEM;
-	av1_dec->tile_info.size = AV1_TILE_INFO_SIZE;
-
-	av1_dec->film_grain.cpu = dma_alloc_coherent(vpu->dev,
-						     ALIGN(sizeof(struct hantro_av1_film_grain),
-							   2048),
-						     &av1_dec->film_grain.dma,
-						     GFP_KERNEL);
-	if (!av1_dec->film_grain.cpu)
-		return -ENOMEM;
-	av1_dec->film_grain.size = ALIGN(sizeof(struct hantro_av1_film_grain), 2048);
-
-	av1_dec->prob_tbl.cpu = dma_alloc_coherent(vpu->dev,
-						   ALIGN(sizeof(struct av1cdfs), 2048),
-						   &av1_dec->prob_tbl.dma,
-						   GFP_KERNEL);
-	if (!av1_dec->prob_tbl.cpu)
-		return -ENOMEM;
-	av1_dec->prob_tbl.size = ALIGN(sizeof(struct av1cdfs), 2048);
-
-	av1_dec->prob_tbl_out.cpu = dma_alloc_coherent(vpu->dev,
-						       ALIGN(sizeof(struct av1cdfs), 2048),
-						       &av1_dec->prob_tbl_out.dma,
-						       GFP_KERNEL);
-	if (!av1_dec->prob_tbl_out.cpu)
-		return -ENOMEM;
-	av1_dec->prob_tbl_out.size = ALIGN(sizeof(struct av1cdfs), 2048);
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->global_model, GLOBAL_MODEL_SIZE);
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->tile_info, AV1_TILE_INFO_SIZE);
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->film_grain,
+				       ALIGN(sizeof(struct hantro_av1_film_grain), 2048));
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->prob_tbl,
+				       ALIGN(sizeof(struct av1cdfs), 2048));
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->prob_tbl_out,
+				       ALIGN(sizeof(struct av1cdfs), 2048));
+	if (ret)
+		goto buffer_allocation_error;
+
 	av1_dec->cdfs = &av1_dec->default_cdfs;
 	av1_dec->cdfs_ndvc = &av1_dec->default_cdfs_ndvc;
 
 	hantro_av1_set_default_cdfs(av1_dec->cdfs, av1_dec->cdfs_ndvc);
 
-	av1_dec->tile_buf.cpu = dma_alloc_coherent(vpu->dev,
-						   AV1_TILE_SIZE,
-						   &av1_dec->tile_buf.dma,
-						   GFP_KERNEL);
-	if (!av1_dec->tile_buf.cpu)
-		return -ENOMEM;
-	av1_dec->tile_buf.size = AV1_TILE_SIZE;
-
 	return 0;
+
+buffer_allocation_error:
+	hantro_free_aux_buf(ctx, &av1_dec->global_model);
+	hantro_free_aux_buf(ctx, &av1_dec->tile_info);
+	hantro_free_aux_buf(ctx, &av1_dec->film_grain);
+	hantro_free_aux_buf(ctx, &av1_dec->prob_tbl);
+	hantro_free_aux_buf(ctx, &av1_dec->prob_tbl_out);
+
+	return -ENOMEM;
 }
 
 int hantro_av1_prepare_run(struct hantro_ctx *ctx)
-- 
2.53.0

