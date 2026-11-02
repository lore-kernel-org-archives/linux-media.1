Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639002;
	b=nox5PUK07o5xvCT0sxrMD+Qyg5XKj0E1RzmGGJL0Da2V6fLe5E1pK4xhoENyJlX8lf8i
	 b4on5m+ir2Bxn4k3YeGHLjXlZLNd0+ExVf4MLEMeysvjLN2ttl6qFAoA9C0vIDFvYJsTd
	 QDetwiFznQdPo53zTl9xoUYbz305k4UjmnBwAHA8kACV+62oGzW9xrGKuVJOS+PwI+tBK
	 By5CuWdVFHtf2S6kaCxbxQv1JJhxLfe59pQ5EObDmYO3WfhWgHqAYfAcX60hPF4orgbIf
	 rhFLUveAQlxsg62OJNRQywaGjotV+a8we87vtC4WViufRYpjr+Wh1STv8dkpWfE/2bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f5lmPxUQrehbk3MnxRPQzuHAZsqfVJpRH/eTUnAIWdE=;
	b=E4nyAVAEjMdrsnfWoTq4GvHDWVrPpNvuUw7H5uAxDkgPzV+AMBQnThmqYilG3sbTwX1D
	 DJVWQGU4utDagPfOWY1q9VrZChkWCGU7aIt3eirUPmfLXP0TSoGI8n8KB46lW6E7mJ8NJ
	 n4oDt3rrJvVnxHISHqznxTuiHiwgcEYyf2I/eIg4kmxGhLyzQWg6FCug9VNoapr+Ik+su
	 vDFcCA7R0jmZ7+KSZOFgnRCFUEhDiD8UXoPH+s//vm5bT3SLS2r1LAO4LkC5R7QbElSBi
	 5G3BHfgCvXc+xpVu35cy2PELav2aEYGrFxp1xOLJKFihYm3Ra+I7sfS3jy0Cd8TBKhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6aJWumm;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E025F606C545
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 17:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E025F606C545
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6aJWumm
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so21632995e9.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639000; x=1794243800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5lmPxUQrehbk3MnxRPQzuHAZsqfVJpRH/eTUnAIWdE=;
        b=w6aJWummwrLAE6LPz8/O1lQaaO79X7S4YqjaXnc8AafaQyhqWCirkes6dHuDCbB08P
         dwb+3gn0fTKdfnX2vbAudOPCgUUF7b5asHHFj6q+Uss3YRZHvI2Hi9kZ8QQbmJ/tqNG4
         mMeqGpafKlEsUAsQ8OM35U3NgjRglsFRW/FIUBVrpsYH7L0k7boQgjlurTmZtfim50fi
         Mqg2OyT0k5cEN+6+Iaz28co48wwkqDj+9hpWxEz731/8AqA9JM1ztqTm7la1qwKxpjc0
         3l/RZrWB8/a+vmo8pBSjt38JVafbz5WmsYKixx5TiXgdJ1wXC0vz0lts4le57b3uSQsi
         pugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639000; x=1794243800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5lmPxUQrehbk3MnxRPQzuHAZsqfVJpRH/eTUnAIWdE=;
        b=axNnU21UowKUjrklWvoUD4bItbu09xACVjOJkOjurn3kFd79/xXeTDvfXrBPFDqxIV
         fiD22vAHXdqd6vq0d60Suhw789K8xrb1ijYDOxCt8+LbVBsKcuLqmD4Xp0xpqJCg+Tg1
         CsQrGG/S4eoFjOyNOlOeTlY31nHwZIdpJZJuDFNgD0VpSh7jiCehKXYpuYH6na1qpCUT
         WIdgj+NWzvso/Mu7FgV68yAInjEi/buQGwg09Fp4DYQKfbxIevTK6VldgvmB9VzMnYmz
         3u5adR6pLT+w0JwpjHkQxdYSIwH+UAPuNL89phPMZbkMOP1Fq1rOk/b7Lw7m+6EmmqyI
         76yg==
X-Forwarded-Encrypted: i=1; AKwUvBwIukcGtXKMVdq5BjwfknLEpPNpNgrix4ssoH509zV7QbnqdoLWN1FkbmrTU165XJ0R9waTAxnFRN+CAQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2CLAPjWOwR8AeEICGltFTytvhjCvZqcXz9ahITV8MEAj6iKYP
	pB2798jtwDFL2/D46xKU9pQC1afkvKjqojcLgZOxnVKrgwaCltjDP91/
X-Gm-Gg: AYBFou0HNgln4NzVfpVaHQvlsJ+5rVCYOuWT4HHkLwJNxWCgwq2LF6MCVjNYFKbekqT
	YIYkqb18wCsVTVSxyrZ/ERnXbuMBxlN02NRMh6ZLbb1QOGnJBDX+ScpvDlnjoPkWdsf+Q1njcG8
	Kgyps7wpRibC+WMCl+JxhpUoQzILjpppnro7ZpmNWv7jB3ubhNDMTCmEUTEu9DIxzKHNI0zA3YN
	sIqHQMVY7XE+J1AOjMgru2jF91UBqUw7yOQE+csBtQFeAdUYEeivyxrITuiKFp0i5DfLFgS1bFq
	1FQxd6Kac2wOj9q0VV1zz02WLBtWwlTQqet/AYQyLBewq0IPxkiXrqOtHQnyxSNIXJwz+YTzqN8
	cNhhA4gkH1504+ThLjAxa3ah8Cqc1gMyyV8rHv9NwOfiJOupdcc0Imcda2DW0XeZ80OM/7Rc8et
	M3fAQo3bGugWIjNiP/Hc+RBIlfWBclnusnRotyVcVsIG+vbWik9OB1aMhpMsPIHf2iAIAj6iQe+
	hO6x3w7XDyuGIBTmBVESjYr5CQxQAvEB0NpSCgMdg2Uj2kj3it3PWgf0CFdNrQKA9y70CaYjcHN
	cCfzglsC9j8vi+dyEsByadqwocR2r6Z47Pe0KWkkR/lG0dpM72/EcdElVDb2pLXMjdOA4TvLuVz
	13aDMNONFqyZp5sRahBduUCrd0e0mrzNs5ZQuA80z1+OKXDfYgXSiS4yTIKKslqklN9ch+IQJII
	D8IZhFN/CT1wEdQqlHBmGLjUcE3DpmiL6htc0Dz/eAhnMv6H6qCV4C/Ks34mwoeeVehSZ0oPYPO
	xc/z8XdeEqjfATWc8HvbCwrEVxG4IMEZDeBEvrG3KlrXaS2Qg==
X-Received: by 2002:a05:600c:3b1a:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ac18c73df6mr248056415e9.27.1793639000058;
        Mon, 02 Nov 2026 09:03:20 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:18 -0800 (PST)
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
Subject: [PATCH 02/10] staging: media: cedrus: reject too large H.264/HEVC SPS
Date: Mon,  2 Nov 2026 18:02:55 +0100
Message-ID: <20261102170303.1973892-3-jernej.skrabec@gmail.com>
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

The hardware decodes whatever picture size the SPS describes. An SPS
beyond CEDRUS_MAX_WIDTH/HEIGHT, or beyond the capture buffers once they
are allocated, makes the hardware overrun memory and hang. On H616, the
JCT-VC PICSIZE_A..D streams (1056x8440, 8440x1056, 528x4216 and
4216x528) leave the hardware wedged, so that every following job times
out until reboot.

Validate the SPS picture size in try_ctrl. Move the size limits to
cedrus_video.h for that.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c   | 40 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 +++
 3 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index c3331b4f3f02..45deebddb630 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -28,10 +28,38 @@
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
 
+/*
+ * The hardware decodes whatever picture size the bitstream headers describe.
+ * Reject sizes beyond the hardware limits, or beyond the capture buffers once
+ * they are allocated, instead of letting the hardware overrun memory and hang.
+ */
+static int cedrus_check_pic_size(struct cedrus_ctx *ctx, u32 width, u32 height)
+{
+	struct vb2_queue *vq;
+
+	if (width > CEDRUS_MAX_WIDTH || height > CEDRUS_MAX_HEIGHT)
+		return -EINVAL;
+
+	/*
+	 * The hardware decodes whole 16x16 macroblocks, and all capture
+	 * formats pad the buffers to at least 16 pixels in both directions.
+	 */
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	if (vb2_is_busy(vq) &&
+	    (width > ALIGN(ctx->src_fmt.width, 16) ||
+	     height > ALIGN(ctx->src_fmt.height, 16)))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 {
+	struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
+
 	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
 		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
+		u32 height;
 
 		if (sps->chroma_format_idc != 1)
 			/* Only 4:2:0 is supported */
@@ -42,9 +70,15 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0)
 			/* Only 8-bit is supported */
 			return -EINVAL;
+		height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
+		if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
+			height *= 2;
+		if (cedrus_check_pic_size(ctx,
+					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
+					  height))
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
-		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
 		unsigned int bit_depth, max_depth;
 		struct vb2_queue *vq;
 
@@ -52,6 +86,10 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 			/* Only 4:2:0 is supported */
 			return -EINVAL;
 
+		if (cedrus_check_pic_size(ctx, sps->pic_width_in_luma_samples,
+					  sps->pic_height_in_luma_samples))
+			return -EINVAL;
+
 		bit_depth = max(sps->bit_depth_luma_minus8,
 				sps->bit_depth_chroma_minus8) + 8;
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index adc7f255d7cf..2521315abdb7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -29,11 +29,6 @@
 #define CEDRUS_DECODE_SRC	BIT(0)
 #define CEDRUS_DECODE_DST	BIT(1)
 
-#define CEDRUS_MIN_WIDTH	16U
-#define CEDRUS_MIN_HEIGHT	16U
-#define CEDRUS_MAX_WIDTH	4096U
-#define CEDRUS_MAX_HEIGHT	2304U
-
 static struct cedrus_format cedrus_formats[] = {
 	{
 		.pixelformat	= V4L2_PIX_FMT_MPEG2_SLICE,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.h b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
index 8e1afc16a6a1..367e52158f01 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
@@ -22,6 +22,11 @@ struct cedrus_format {
 	unsigned int	capabilities;
 };
 
+#define CEDRUS_MIN_WIDTH	16U
+#define CEDRUS_MIN_HEIGHT	16U
+#define CEDRUS_MAX_WIDTH	4096U
+#define CEDRUS_MAX_HEIGHT	2304U
+
 extern const struct v4l2_ioctl_ops cedrus_ioctl_ops;
 
 int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
-- 
2.43.0

