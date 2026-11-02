Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638998;
	b=MaRoxahfnMITaz+azm+8VdRMyLDQL4UU8nSTY94XMnDcxN6fNWPmIUGZ7LInLH5FPOJT
	 FeUEPXAR0rA/i6cuzu3gsc4yLt+N+kyNuCCADsbyZX9WFycxGPgY5rBHuyUtTYEcqtP/A
	 4In26zjp+R+GWVxmU6vhoW+Kop0vAX9tHSZ+MGoCT+obcLAoT8xzc9U/SHbJcusC+bqbi
	 CYI3jHtfkpo6KiWK5Uu4XwiPU5nX86NAtE6v7zNMlkReV4a9H0efcK04Tu8JfodlzKM/D
	 2JJj3KRXgWuCAxRL496lNCs+B1v/hI67A4GRXi7qOXXluC7kGD8GFBP9fu3x3IMpn6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BuM2x27esv9HJJ72txAMjkLX+sEnXEmUVgCjirEtUA8=;
	b=jAvasvUrgzvncNbpXH9i8s8ukUsqEN13AGI/3UUFOSkrQVxdwNDQqm3cDr7TNobE9PSY
	 MPAulYolzG7zW+DkbS6zaVW/goIEKgGKscp1QbY+YMVTNArSjCQmxl7WdBYB7pG0UL3ha
	 dbYFo4cQjykP1eHqqNeyww4N5++nq1gjtMexQRT/gCfKRRmmPgqPjxPNBk04M7DNW6KZG
	 Us50z07XFZ1FnMk0hfMo9ESCi7u3xB0keSPBbV8vDW2wRKFZm4vWARaMwfionHKdUowhq
	 Ke2CTEBAcOnfzUyxTK3kFw7hTg6FVDMtysBHAUpjbb2uGLq8k1v6bYKry9ZeUrj3PfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1yT2Nit;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AA0606C544
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 17:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6AA0606C544
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1yT2Nit
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso28865945e9.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638996; x=1794243796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BuM2x27esv9HJJ72txAMjkLX+sEnXEmUVgCjirEtUA8=;
        b=M1yT2NitDz4CXfoU8I1R0c7bOY+0ctNnKpitvxEkOW5AD8sJlO+yw1Vee8xNWn/4XF
         IJA5+o2ewR05bZTyR39aUKC2JuG24zXhi97etjwoF0JfzYiyXYUm39IOO1YEByRjaFO6
         0KPkGKDR5IqXZ+LNUVlFeomD7/LmR3buq0rhtuq32yLqUYTxKicHjmcxOgixCH0OUSFQ
         JgLe+PwlQZdpGYe8T0GenpaMFVpsNcWq0GIjm8xh6KnHyDcjoUxjtopa3fDndjoGuZ8T
         97BnQoaMUA61eY0jxqJfa0qsqIhZHUU09k1EHPHxyHrbhJXrpJ4hi+pFBFX6z8blH5ze
         114w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638996; x=1794243796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BuM2x27esv9HJJ72txAMjkLX+sEnXEmUVgCjirEtUA8=;
        b=g5r1S0bpT2u52GQ/CIixJaQxNRb8VhDbnNu73zTRmAg7TuKnoXprwhp5vhkM+nO+7K
         FciQjRcOuFMYKgxI63rwESZcb8mElAGGshB8nYhLy0ON6WKLkk0FWopwJxTiyk3d9D19
         VVYszTBhFpQQY0GcRhFltHzZxfvsygPVKjdNe8T0uEMpXQHFIJ1iFMcCYtkm/k5Ihclb
         96FhJ1yrM6/0YnG+4+LLix4Pe84koWYH/+5RdhFzbXW2subcHyOhYwzuQBe/xKEMWoS7
         nH0jfqheq2l+b7jkYg2BWJVK6L3MQWRu5dT4WSC4ZeFDkXUzVHdPVjlpaB4hurn6J6az
         9OdA==
X-Forwarded-Encrypted: i=1; AKwUvBy5kDGPwiQDQEUoKGMa4Tri88rSelBGVhoi/8gtAI9O/ytPCsGiGcwQPOscwIa3XtFHMlOVOaG0QJEvaw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIcnomfgeZlxtrK1ESuzCB/mjY/PMWW2ZyjeKby+s4ZBju4koKz
	I/qpzUIs948v3Foi+TvN6vFf3uMOegekgxB4Jl2abWNlk2VmyI6hfXcl
X-Gm-Gg: AYBFou0pipZcmcdWfftTLP95Fs3OpqwrOrAzxIymdElg+oecE4UoafeSmyDBi8zX4H6
	wnVnxE0B4gJYXEEXbh9a9aHFHAHg8hsWq0q6C4OdVGTdulCaHqsnAySAj5tUBUOX+ox7OlQARJr
	BpiqACbjg3nmq0hl713GyXdd4BGg/3Ja2gZWMRLdkNBfeYWKCuAV4mincirq8LvfZj+SJQNhUg1
	C/TIEAWePOjgA47YuRPIxA5kZzqkq0+m1hGpmkH7zc1rpekfTFPFcAps1U0y9LI44cK66YRoklA
	WqFw6eqIRFCDiO10IbnwOzfMJwTbKDnD3uFKXFXFhWFCO3NRFePuUn7Fqlhj9mA+eHRW5ouANiw
	TvYZXWvRQ/WCZRRw6wWwjZ98mCQ5eh2s6mZ781N0gbR5t9meon4FABsFLZDjNSK2vqgtjTx+djL
	wqnU/gn3LELTjwTn0Xl/rzS5pRckKywbrk4LwBkBLdA1ljoG+eoQPg5GlJ/imfj6p8/Fyo95I57
	t+moXZuq9JHAskpHdAKbVAROLU+F7GL8SvRjc7yRUSgrr890Le8UKLfiotoWPqVlN15xXgIFmwd
	6of3XRFQxxDmm+toeZDbqXqWhVGDpNxLw/D8bCVebjN82CxHRp6WBPs2lguvMtn/LSUQcemhCKb
	UeLwv0WmPziANvQKdu5p6xBv4PsDM6nLtg82BQPsquPcbqyU38LuTgR0Uv8Ph9bv81VLMMSzwq4
	Je1Ylcn01q6/8/K2l5hkA7PcEbxGfy8iKN/DiDItXwD2HXOOfO6yntT2hxLwzGOF/GJzIQdUIG5
	h9KKLpchwD8UUWpVic9MkYTZz/b/B/sm1Zc0n1o/HvaCIGeQA==
X-Received: by 2002:a05:600c:848c:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4ac1709b206mr260803075e9.17.1793638995840;
        Mon, 02 Nov 2026 09:03:15 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:14 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 01/10] staging: media: cedrus: free MV-col buffers in buf_cleanup
Date: Mon,  2 Nov 2026 18:02:54 +0100
Message-ID: <20261102170303.1973892-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
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

v4l2_m2m_ctx_release() releases the CAPTURE queue before the OUTPUT
queue. When userspace closes the file handle without STREAMOFF, the
CAPTURE buffers are already gone by the time the OUTPUT stop_streaming
calls the codec stop() callback, so the per-buffer H.264/HEVC MV-col
buffers are never freed. This is easily reproduced by killing a player
during H.264 or HEVC decoding. Each killed 1080p session leaks about
2.3 MiB.

Add a buf_cleanup codec op, called from the vb2 buf_cleanup of the
CAPTURE queue, and free the MV-col buffer there. stop() keeps using the
same helper.

Fixes: fec94f8c9954 ("media: cedrus: h264: Optimize mv col buffer allocation")
Fixes: 0ee952c2f484 ("media: cedrus: h265: Associate mv col buffers with buffer")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 28 +++++++++++--------
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 28 +++++++++++--------
 .../staging/media/sunxi/cedrus/cedrus_video.c | 10 +++++++
 4 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index c4b1217c14b6..54f867949fba 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -167,6 +167,7 @@ struct cedrus_dec_ops {
 	int (*setup)(struct cedrus_ctx *ctx, struct cedrus_run *run);
 	int (*start)(struct cedrus_ctx *ctx);
 	void (*stop)(struct cedrus_ctx *ctx);
+	void (*buf_cleanup)(struct cedrus_ctx *ctx, struct cedrus_buffer *buf);
 	void (*trigger)(struct cedrus_ctx *ctx);
 	unsigned int (*extra_cap_size)(struct cedrus_ctx *ctx,
 				       struct v4l2_pix_format *pix_fmt);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index fc54d993b11f..892193c12b2f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -647,10 +647,23 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 	return ret;
 }
 
+static void cedrus_h264_buf_cleanup(struct cedrus_ctx *ctx,
+				    struct cedrus_buffer *buf)
+{
+	if (buf->codec.h264.mv_col_buf_size > 0) {
+		dma_free_attrs(ctx->dev->dev,
+			       buf->codec.h264.mv_col_buf_size,
+			       buf->codec.h264.mv_col_buf,
+			       buf->codec.h264.mv_col_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+
+		buf->codec.h264.mv_col_buf_size = 0;
+	}
+}
+
 static void cedrus_h264_stop(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
-	struct cedrus_buffer *buf;
 	struct vb2_queue *vq;
 	unsigned int i;
 
@@ -662,17 +675,7 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
 		if (!vb)
 			continue;
 
-		buf = vb2_to_cedrus_buffer(vb);
-
-		if (buf->codec.h264.mv_col_buf_size > 0) {
-			dma_free_attrs(dev->dev,
-				       buf->codec.h264.mv_col_buf_size,
-				       buf->codec.h264.mv_col_buf,
-				       buf->codec.h264.mv_col_buf_dma,
-				       DMA_ATTR_NO_KERNEL_MAPPING);
-
-			buf->codec.h264.mv_col_buf_size = 0;
-		}
+		cedrus_h264_buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
 	}
 
 	dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
@@ -710,5 +713,6 @@ struct cedrus_dec_ops cedrus_dec_ops_h264 = {
 	.setup		= cedrus_h264_setup,
 	.start		= cedrus_h264_start,
 	.stop		= cedrus_h264_stop,
+	.buf_cleanup	= cedrus_h264_buf_cleanup,
 	.trigger	= cedrus_h264_trigger,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 780da4a8b5af..6c643862ab73 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -858,10 +858,23 @@ static int cedrus_h265_start(struct cedrus_ctx *ctx)
 	return 0;
 }
 
+static void cedrus_h265_buf_cleanup(struct cedrus_ctx *ctx,
+				    struct cedrus_buffer *buf)
+{
+	if (buf->codec.h265.mv_col_buf_size > 0) {
+		dma_free_attrs(ctx->dev->dev,
+			       buf->codec.h265.mv_col_buf_size,
+			       buf->codec.h265.mv_col_buf,
+			       buf->codec.h265.mv_col_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+
+		buf->codec.h265.mv_col_buf_size = 0;
+	}
+}
+
 static void cedrus_h265_stop(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
-	struct cedrus_buffer *buf;
 	struct vb2_queue *vq;
 	unsigned int i;
 
@@ -873,17 +886,7 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
 		if (!vb)
 			continue;
 
-		buf = vb2_to_cedrus_buffer(vb);
-
-		if (buf->codec.h265.mv_col_buf_size > 0) {
-			dma_free_attrs(dev->dev,
-				       buf->codec.h265.mv_col_buf_size,
-				       buf->codec.h265.mv_col_buf,
-				       buf->codec.h265.mv_col_buf_dma,
-				       DMA_ATTR_NO_KERNEL_MAPPING);
-
-			buf->codec.h265.mv_col_buf_size = 0;
-		}
+		cedrus_h265_buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
 	}
 
 	dma_free_attrs(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
@@ -918,6 +921,7 @@ struct cedrus_dec_ops cedrus_dec_ops_h265 = {
 	.setup		= cedrus_h265_setup,
 	.start		= cedrus_h265_start,
 	.stop		= cedrus_h265_stop,
+	.buf_cleanup	= cedrus_h265_buf_cleanup,
 	.trigger	= cedrus_h265_trigger,
 	.extra_cap_size	= cedrus_h265_extra_cap_size,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index ad4ec3490775..adc7f255d7cf 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -560,6 +560,15 @@ static void cedrus_stop_streaming(struct vb2_queue *vq)
 	cedrus_queue_cleanup(vq, VB2_BUF_STATE_ERROR);
 }
 
+static void cedrus_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct cedrus_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
+	    ctx->current_codec && ctx->current_codec->buf_cleanup)
+		ctx->current_codec->buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
+}
+
 static void cedrus_buf_queue(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -579,6 +588,7 @@ static const struct vb2_ops cedrus_qops = {
 	.queue_setup		= cedrus_queue_setup,
 	.buf_prepare		= cedrus_buf_prepare,
 	.buf_queue		= cedrus_buf_queue,
+	.buf_cleanup		= cedrus_buf_cleanup,
 	.buf_out_validate	= cedrus_buf_out_validate,
 	.buf_request_complete	= cedrus_buf_request_complete,
 	.start_streaming	= cedrus_start_streaming,
-- 
2.43.0

