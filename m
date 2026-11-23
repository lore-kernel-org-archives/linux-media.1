Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427953;
	b=f6MpqvEZVkE9tXhfE5jS9ucu6zHGh8q4lmgQGHN5ERdtcNt5BY9ATxbvhVNymFBelM3O
	 vy8Ju26CE7ZhSmQkIJdCNlnkcutXJQuSMVKgRdkal5tviKA2KKNj14ITwmAxgw3BeYDia
	 qfqpE0uQMYrcOOBevW7CIqIwGKsjSQniZ22RRBUWsyld763Ff9hZpe96xVEdlCjppJowH
	 raI+ZTCfR7vSESjvpZeMJiradjTm9VOBwZPTi3Q0Kr52uQUV5a92+RDGfY/XaLcF4MVqF
	 x04PgWwRreTIcrzNhU5w4TvRr+KJt7Jsdhee0v1bbvOFfKsncH065C32e0fQA1YlfHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427953;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bbsnSX9Qmkcw/N3r2XW9lN3RZnNtpOvwo01pguYXJVU=;
	b=NXhvfrUALC8cvY21O9iSSNs4VaCaXcD8qS9POi692O4YM5FuzloQimDWvXmgGY4B7Mz8
	 z/6+CbqJpmRBFg4aFKZkhHwIes96Smq4XAFJi7Efmhc/92+tFWvTqgzdbf7Zy+3CszoUn
	 Yju1fE0uh0AqS7u4KCkHk9exhx6BtQ5XkLOBwWRBM8UJMWKyvD/VFTxZnbDCiD3bt4ObJ
	 +oZM1yuk8GPZ5fKEbt/AnenOc0jpB7NACCh+Eb1QYgAfcBy2YQ3aI4cranC95p3MzBuMW
	 5kPeV+3GDo2gqBudx3kt8Necx5F1Gr6TuUqCnj0D9g6wuvKPEGPU0skM7BSgxvgOiCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=K4auACvY;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97B4606A32C;
	Mon, 23 Nov 2026 09:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C97B4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=K4auACvY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795427951;
	bh=OjDDyVHPNQifEr60j6NAsafCT0swfBWHW8NPixfG70A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K4auACvYkUdMZriytZX6utE0cikKw2SUz/QAg5TdofNGY2cUTK+lSxCVcLIge8BIz
	 2ARqlFRi2MU/yakYseDOwL3lW60v8uKAsu1DfZ6ygrifvm2bWA5E8hRpIMHyYLFufV
	 YBgdNd3tye9B4A7V5UhqXqYJpyAPstdOTKVDcXF5Us1gFs51h57k4gu5I+sP7AHnau
	 0wnvxwDKsw4Zhj+mGEn6fx4WnyrB4wSLm8kshurQCgyw+VceSgV0fXTNUDc69iyRq/
	 mKEIb5cLMhh4ep3iWLMxQEfq/a5p2y+ypYXZccwS9/EU7wTzvHikig0GPzHSa1z2Uz
	 15e4ikPqnASOQ==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C6DA17E0309;
	Mon, 23 Nov 2026 10:59:11 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 1/7] media: verisilicon: Add helpers to allocate and free auxiliary buffers
Date: Mon, 23 Nov 2026 10:58:59 +0100
Message-ID: <20261123095905.60622-2-benjamin.gaignard@collabora.com>
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

Add helpers functions to allocate and free the auxiliary buffers.
That simplify the code and make it easier to read and maintain.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
changes in v3:
- In hantro_allocate_aux_buf() and hantro_free_aux_buf() only set vpu if
  ctx isn't NULL.

 drivers/media/platform/verisilicon/hantro.h   |  4 ++
 .../platform/verisilicon/hantro_postproc.c    | 21 ++---------
 .../media/platform/verisilicon/hantro_v4l2.c  | 37 +++++++++++++++++++
 3 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0353de154a1e..f2f02522a543 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -507,4 +507,8 @@ void hantro_postproc_free(struct hantro_ctx *ctx);
 int hanto_postproc_enum_framesizes(struct hantro_ctx *ctx,
 				   struct v4l2_frmsizeenum *fsize);
 
+int hantro_allocate_aux_buf(struct hantro_ctx *ctx, struct hantro_aux_buf *aux_buf,
+			    size_t size);
+void hantro_free_aux_buf(struct hantro_ctx *ctx, struct hantro_aux_buf *aux_buf);
+
 #endif /* HANTRO_H_ */
diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index e94d1ba5ef10..3e202076bd2f 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -180,7 +180,6 @@ static int hantro_postproc_g2_enum_framesizes(struct hantro_ctx *ctx,
 
 void hantro_postproc_free(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	struct vb2_queue *queue = &m2m_ctx->cap_q_ctx.q;
 	unsigned int i;
@@ -188,11 +187,7 @@ void hantro_postproc_free(struct hantro_ctx *ctx)
 	for (i = 0; i < queue->max_num_buffers; ++i) {
 		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
 
-		if (priv->cpu) {
-			dma_free_attrs(vpu->dev, priv->size, priv->cpu,
-				       priv->dma, priv->attrs);
-			priv->cpu = NULL;
-		}
+		hantro_free_aux_buf(ctx, priv);
 	}
 }
 
@@ -223,7 +218,6 @@ static unsigned int hantro_postproc_buffer_size(struct hantro_ctx *ctx)
 
 static int hantro_postproc_alloc(struct hantro_ctx *ctx, int index)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_aux_buf *priv = &ctx->postproc.dec_q[index];
 	unsigned int buf_size = hantro_postproc_buffer_size(ctx);
 
@@ -235,13 +229,7 @@ static int hantro_postproc_alloc(struct hantro_ctx *ctx, int index)
 	 * buffers for the decoder, so no mapping is needed.
 	 */
 	priv->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
-	priv->cpu = dma_alloc_attrs(vpu->dev, buf_size, &priv->dma,
-				    GFP_KERNEL, priv->attrs);
-	if (!priv->cpu)
-		return -ENOMEM;
-	priv->size = buf_size;
-
-	return 0;
+	return hantro_allocate_aux_buf(ctx, priv, buf_size);
 }
 
 int hantro_postproc_init(struct hantro_ctx *ctx)
@@ -268,14 +256,11 @@ hantro_postproc_get_dec_buf_addr(struct hantro_ctx *ctx, int index)
 {
 	struct hantro_aux_buf *priv = &ctx->postproc.dec_q[index];
 	unsigned int buf_size = hantro_postproc_buffer_size(ctx);
-	struct hantro_dev *vpu = ctx->dev;
 	int ret;
 
 	if (priv->size < buf_size && priv->cpu) {
 		/* buffer is too small, release it */
-		dma_free_attrs(vpu->dev, priv->size, priv->cpu,
-			       priv->dma, priv->attrs);
-		priv->cpu = NULL;
+		hantro_free_aux_buf(ctx, priv);
 	}
 
 	if (!priv->cpu) {
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 83af9fa1ce94..9ca6509512e4 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -1029,3 +1029,40 @@ const struct vb2_ops hantro_queue_ops = {
 	.start_streaming = hantro_start_streaming,
 	.stop_streaming = hantro_stop_streaming,
 };
+
+int hantro_allocate_aux_buf(struct hantro_ctx *ctx, struct hantro_aux_buf *aux_buf,
+			    size_t size)
+{
+	struct hantro_dev *vpu;
+
+	if (!aux_buf || !ctx || !size)
+		return -EINVAL;
+
+	vpu = ctx->dev;
+	aux_buf->cpu = dma_alloc_attrs(vpu->dev, size,
+				       &aux_buf->dma,
+				       GFP_KERNEL,
+				       aux_buf->attrs);
+	if (!aux_buf->cpu)
+		return -ENOMEM;
+
+	aux_buf->size = size;
+
+	return 0;
+}
+
+void hantro_free_aux_buf(struct hantro_ctx *ctx, struct hantro_aux_buf *aux_buf)
+{
+	struct hantro_dev *vpu;
+
+	if (!aux_buf || !ctx)
+		return;
+
+	vpu = ctx->dev;
+	if (aux_buf->cpu)
+		dma_free_attrs(vpu->dev, aux_buf->size,
+			       aux_buf->cpu, aux_buf->dma,
+			       aux_buf->attrs);
+	aux_buf->cpu = NULL;
+	aux_buf->size = 0;
+}
-- 
2.53.0

