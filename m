Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187633;
	b=0Pw7t8kkVofkrjEgFcMGJxIZN76/2T9NOPhXDeVIm6Dt/KM6mquSPGbcILyer13tnebT
	 yvgd7BVQaq1dSIpHIO/NOmsoP+SjY7gEgpUNc75Xu6z82Y9BselBUmHfCZiDKQp0/mrDS
	 uE/Sp8L064I1YVN7NFOvy3Aiz4ZIRYY2FcNKG5xnCayC3K1BeBwljr6LptYxqEUxo9pNO
	 QFK2uQizjrlyU7D8Ap4T9bfWeDsjPWomcAE526zu2FTmyxaUdmY/lRrjhQDHrxMo1RThg
	 2LfXTFtpoFC1AxsxpJiZKU1p9XjbxyAcTR79v8ipBVr3IvB6NlbKpEqB8ENr+uphZxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187633;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OXDXy1gYFpPeoFgEsJlntmxznrmX3p1Ho81yxKjI+zw=;
	b=Hh9sKOzXFNLz5MhOZkKix8pFQIvimmv317+zmFsdC1cN7ZMXxhfZEE8mn1CAgc0UPYvz
	 sQW7DeKsNhTnEsKsuBultgiSfnshb4J0KFXHBWpQMH9D+HfH3syWEuiocf6F2x5mHuoCj
	 nv4zY7PVCgHnDqynNq7Zy3MacH/FqAltHKVwA11hTJd1sdHG6KIFPZ2RSRPJCJRhf6X3f
	 OpjpoODEeYM08Euutgh4bFxhgO85ig2BAgzPKxoAxe0CSyLNmo9OpCsUA56w69eXGcFr+
	 sfWe9x0JXcF+l7MCf2oeG/8nq1FnYrN7WVsbzkhD6h+Aq9pqRS+BsmN5YaEKrSe+Gtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=oKcN+iAf;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4871606A325;
	Fri, 20 Nov 2026 15:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4871606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=oKcN+iAf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795187631;
	bh=Ed1Md27qrSsvQ/BXYyeWigNJOnNjTq+gJh4jBrH7oeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oKcN+iAfhTzZQT7g4fSdG3NcLLBtuSJtQM2ui4wm9c2+SFGm0VenRz7O7Ts1WOT0R
	 XJXu7sJo2VvipkLQQaLehSwnqwjqjw1pOj2pBRNDWEMCye+nMQazgDUevmARbgtPLC
	 r6yBh/dzfs34ouFcCDZKoisgxv773Ny/jrWMkiV8Ha0U8iN9nKII9wq/WSaSaPcNTP
	 b38UEiwGxDSE5u+/0R/Wys5dND++SuS9vtnayEDQYdUDa3p1VtdS825lDpUYPQt4zd
	 jRguQXWMa48Epzs2AEWn7LZZk0RF5vIie1N+QymAXPbJnHslE9/laPD8+xeEFXJmhv
	 zYnLO+aQYPETQ==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 36E6317E0630;
	Fri, 20 Nov 2026 16:13:51 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 1/7] media: verisilicon: Add helpers to allocate and free auxiliary buffers
Date: Fri, 20 Nov 2026 16:13:39 +0100
Message-ID: <20261120151345.88802-2-benjamin.gaignard@collabora.com>
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

Add helpers functions to allocate and free the auxiliary buffers.
That simplify the code and make it easier to read and maintain.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
changes in v2:
- fix commit message

 drivers/media/platform/verisilicon/hantro.h   |  4 +++
 .../platform/verisilicon/hantro_postproc.c    | 21 ++---------
 .../media/platform/verisilicon/hantro_v4l2.c  | 35 +++++++++++++++++++
 3 files changed, 42 insertions(+), 18 deletions(-)

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
index 83af9fa1ce94..ec12950a1ae1 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -1029,3 +1029,38 @@ const struct vb2_ops hantro_queue_ops = {
 	.start_streaming = hantro_start_streaming,
 	.stop_streaming = hantro_stop_streaming,
 };
+
+int hantro_allocate_aux_buf(struct hantro_ctx *ctx, struct hantro_aux_buf *aux_buf,
+			    size_t size)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	if (!aux_buf || !ctx || !size)
+		return -EINVAL;
+
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
+	struct hantro_dev *vpu = ctx->dev;
+
+	if (!aux_buf || !ctx)
+		return;
+
+	if (aux_buf->cpu)
+		dma_free_attrs(vpu->dev, aux_buf->size,
+			       aux_buf->cpu, aux_buf->dma,
+			       aux_buf->attrs);
+	aux_buf->cpu = NULL;
+	aux_buf->size = 0;
+}
-- 
2.53.0

