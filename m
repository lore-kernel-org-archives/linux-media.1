Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A104740861B;
	Mon, 10 Aug 2026 15:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375346; cv=none; b=JOmBKZUq185S/HbobWdYCAtikW9W0AhHkzOYZVF//9X0/X2SOvkVjI8vJz9lUhr3pJ1d5+f7XYxymb/zqmKyn4NuVMdQRw6gTS+6vx9eofpUIIxclB4s9EW8AwAbRADViL6BqqHIMfjOH4VaCaVSsKuLwRknyyiiP1p6JBo7+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375346; c=relaxed/simple;
	bh=e71GDVW7JWrMuo4GRQ4jmJJ53lTpZaHnnvO0b/ljVaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YaqcOyBPMlKHx5efbkHdqcaGyXUGohvvJJYefK/kYRNTy07LCcV+nP/HNB4jQaPapO7xvAdNfp5a8C/fFvVDx2yaWV6j2JV58npzN5vTQw0bbjdDe9t9C2czUlTvqFqWUB79fYDAc+VcOHQ7jraTmLvrhJFXSOW/EDgx3gxuwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZXVL1KP3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZXVL1KP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786375342;
	bh=e71GDVW7JWrMuo4GRQ4jmJJ53lTpZaHnnvO0b/ljVaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZXVL1KP3rmA4kk5VU4wUurorKVvcVqgkaybOifIOJRVRmQvPn43oXGe+IwOn3JKAC
	 q9+naFcgnzUj/cfisJelxbiVc30ZsgToGaWrduqq+B2dCPbTdudKwT/oLhO3R/+PQt
	 QpDpx/gW9kWjNlrJ0SsDGSxDvYCnUw+NAGArX6IijQ6tAWH/z2go/TbXMteBsvdJzK
	 ZnpjmB/zSPlA0YAkrqYwYV+2eA16808lueF3YuIIAlTsHVrHdZET9QIOJ9fPkpf7ro
	 Zo79o9M0aF1p9hOhGQfozw1FeZZdKbRu+lpz/l1TaAaH3zQod6jqIymVAva1FVKEwl
	 2IxcMKmlPPrsg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B34D17E080A;
	Mon, 10 Aug 2026 17:22:21 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 10 Aug 2026 11:22:11 -0400
Subject: [PATCH v2 1/5] media: rkvdec: Keep RCB to the correct size
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-rkvdec-multicore-v2-1-986f89d22cdc@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
In-Reply-To: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

Currently, if a video changes resolution, the RCB size might be too small
and the HW could try to write out of the allocated buffer.

To fix that, make sure that the RCB size is validated for each run and
increase the buffer size when needed.

Fixes: e5640dbb991c ("media: rkvdec: Add RCB and SRAM support")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    | 26 +++++++++++++++---
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.h    |  3 ++-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 31 +++++++++++-----------
 3 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
index fdcf1f177379..191f78278c01 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
@@ -17,6 +17,8 @@
 struct rkvdec_rcb_config {
 	struct rkvdec_aux_buf *rcb_bufs;
 	size_t rcb_count;
+	u32 width;
+	u32 height;
 };
 
 static size_t rkvdec_rcb_size(const struct rcb_size_info *size_info,
@@ -40,6 +42,21 @@ int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx)
 	return ctx->rcb_config->rcb_count;
 }
 
+bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx)
+{
+	struct rkvdec_rcb_config *cfg = ctx->rcb_config;
+
+	bool ret = cfg && cfg->height >= ctx->decoded_fmt.fmt.pix_mp.height &&
+		   cfg->width >= ctx->decoded_fmt.fmt.pix_mp.width;
+
+	if (!ret && cfg) {
+		dev_dbg(ctx->dev->dev, "RCB size %ux%u -> %ux%u\n", cfg->width, cfg->height,
+			ctx->decoded_fmt.fmt.pix_mp.width, ctx->decoded_fmt.fmt.pix_mp.height);
+	}
+
+	return ret;
+}
+
 void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_dev *dev = ctx->dev;
@@ -77,14 +94,15 @@ void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
 		devm_kfree(dev->dev, cfg->rcb_bufs);
 
 	devm_kfree(dev->dev, cfg);
+
+	ctx->rcb_config = NULL;
 }
 
-int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
+int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 width, u32 height,
 			const struct rcb_size_info *size_info,
 			size_t rcb_count)
 {
 	int ret, i;
-	u32 width, height;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	struct rkvdec_rcb_config *cfg;
 
@@ -105,8 +123,8 @@ int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
 		goto err_alloc;
 	}
 
-	width = ctx->decoded_fmt.fmt.pix_mp.width;
-	height = ctx->decoded_fmt.fmt.pix_mp.height;
+	cfg->width = width;
+	cfg->height = height;
 
 	for (i = 0; i < rcb_count; i++) {
 		void *cpu = NULL;
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
index 30e8002555c8..0662a4359bdf 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
@@ -20,10 +20,11 @@ struct rcb_size_info {
 	enum rcb_axis axis;
 };
 
-int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
+int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 width, u32 height,
 			const struct rcb_size_info *size_info,
 			size_t rcb_count);
 dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id);
 size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id);
 int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx);
+bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx);
 void rkvdec_free_rcb(struct rkvdec_ctx *ctx);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e9..31ddfcc58894 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -978,8 +978,7 @@ static int rkvdec_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct rkvdec_ctx *ctx = vb2_get_drv_priv(q);
 	const struct rkvdec_coded_fmt_desc *desc;
-	const struct rkvdec_variant *variant = ctx->dev->variant;
-	int ret;
+	int ret = 0;
 
 	if (V4L2_TYPE_IS_CAPTURE(q->type))
 		return 0;
@@ -988,20 +987,8 @@ static int rkvdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (WARN_ON(!desc))
 		return -EINVAL;
 
-	ret = rkvdec_allocate_rcb(ctx, variant->rcb_sizes, variant->num_rcb_sizes);
-	if (ret)
-		return ret;
-
-	if (desc->ops->start) {
+	if (desc->ops->start)
 		ret = desc->ops->start(ctx);
-		if (ret)
-			goto err_ops_start;
-	}
-
-	return 0;
-
-err_ops_start:
-	rkvdec_free_rcb(ctx);
 
 	return ret;
 }
@@ -1174,6 +1161,20 @@ static void rkvdec_device_run(void *priv)
 		return;
 	}
 
+	if (!rkvdec_rcb_buf_validate_size(ctx)) {
+		rkvdec_free_rcb(ctx);
+
+		ret = rkvdec_allocate_rcb(ctx,
+					  ctx->decoded_fmt.fmt.pix_mp.width,
+					  ctx->decoded_fmt.fmt.pix_mp.height,
+					  ctx->dev->variant->rcb_sizes,
+					  ctx->dev->variant->num_rcb_sizes);
+		if (ret) {
+			rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
+			return;
+		}
+	}
+
 	ret = desc->ops->run(ctx);
 	if (ret)
 		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);

-- 
2.55.0

