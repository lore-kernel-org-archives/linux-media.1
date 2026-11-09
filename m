Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246670;
	b=fwm8a3F0q309Ss68ZacudAfDNDl98+eoBsAaEpk6lsEHo2GoGONo7EHK+ACrxpTp73Au
	 +GVHy4ch1VquLlhqrzzoKn+cvSVlC+OE7CEN7R1eBdqMX7/Ahz+kDHdup4iALOMk84CP3
	 vxKZR4UtvC7pyfm6yn3bc8dagUjCNNtQLpbCIsB5UotfVLuSkGyVsHGNBQijSuWIe7Eit
	 ptywHu+Q8jOOuDKVoVLycd4uXDZN6dmRPBO2lMCYboSMADbk/Bis6V5uvk7nKpK/ghXyb
	 d2XPDC2fyTYOSpvJJSMbCChrgxmITF3qPGvzg/vGaBc6g7elWtVXIXiETC0MA76pAVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PRBCcyxG7vdWjrF56CJga6rW7J1Hfqypo5bq8n0AjVE=;
	b=FYH6m7YGk6xFdGklaDZ9kj6XvIfuBtx7H1RAArbcR+87Xct6uzcttc/f+0NAamr6npX5
	 SCaPSHof2x1DPnkQGIRVyimuP/nLg3E3Q2HKz8M+5spn81xy+1dFzI8IvGOxIA5GQ1lG/
	 a6TkuwusoXE/l4pr5FrIIUoKZaTMylk6LaNb8/7iWzV82F/MMRai5C/XHtE5PHCsnaDdp
	 ptpnqcKoYjBhW1FGoJNDP7Aenh6uX3vitjPEdyIMFHUE9axH+LAN7uzPVSKzeLb+RmR5F
	 QmBG5MWfOgk/6kxkjrkWMU8s9Z1TYQwlDNckUmooAc+NwjZZAPkYI1QXI5ex6+TcE2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fIBfoD7U;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0479960A261C
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 17:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0479960A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fIBfoD7U
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so11955015e9.3
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 09:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246668; x=1794851468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRBCcyxG7vdWjrF56CJga6rW7J1Hfqypo5bq8n0AjVE=;
        b=fIBfoD7UrKrPUDtCjmAIheF7XhAB+QOQIZvogOcqa1ii1GnKXwxs4NYJ3doNfPzh8P
         Ye2bYI7le9gu3QEYVHXyLQ1EkoQ/bHp6UGa2EnzKAmhoOoOhhi/YXRdm56zYD/McL6bZ
         7/ieyO6Rpzsmm9QNty+XKBenk8itrLby8np7OTT3Plnx2YFrLPuHv4e+U6vNss/4Ewe+
         bEtczOz0/hu7HK56gB1bp5nNBIti3w1mrqJJlxROQ0YeODtZhjpzL5bPeZ1Ko0NzcsSr
         8NlBR7/wUX+Wz/X0huCtHbkMoX2/fxFmRHYT6DaqN1hWGKUtfxdztg5w+1QG2RZzVj21
         my7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246668; x=1794851468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PRBCcyxG7vdWjrF56CJga6rW7J1Hfqypo5bq8n0AjVE=;
        b=m5NBsjmgZfot0cfjIujdj6SuRwSwo0u/T5Ui35tvxT+ATYEv0ZlF6E/6LV1nvkV2Rw
         7m7ONGDq1oWUjMLYh8FN3hNCT2mwdzWMFIu/S3xukl/buk68Iky0PoM57rXezVDD3vgz
         ynzbw6sGIN7tuUiffh/xvt8WjNvCS47MUzh50oCPx3G5sEcIOLwVr7Ohph3j2mWnxGS4
         OprfVQ4TDK/RuzK3P7FiDA/TFBzXz/4KuOF7sSoav3KYTimmQbqJfwwVGn5DzkG/JNaJ
         sSQvTTQMaKiqAsVMnMiQ4kt/LIOw8XAqOGdxgHYGqZUzMWF8pSEe/PUoU8nnZWXF2eb6
         VCeA==
X-Forwarded-Encrypted: i=1; AL+hErHbHuQxLgsIj01eWbNhdn8f2ISkRBYk3R1j+7k4WQ2pmk40UoJQ2uQOgiXevvl/EadlWAmAvOkKWlK6Sg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/vOO3IMAzMK6EoQAgGejh17pYGmOhyEN/l3DT+Mlvi1XMsBwX4
	P7wmIN9WRz+BjVxtiEV/aWkYF2GY++iP0C6ruRxNyggpD9mrTSly7ou/
X-Gm-Gg: AYBFou35n+IhLSM9eGOqg+5vDiFeJ+ga8wmp0e7Zb6hQ4yhPRKnOthrlGtBD/B0FJwm
	2s4DFCdVy4MwYV/Qy9zoiu4YlkcS1QSaZt5fnGADINBuplqdtn3XSTxvrb0iK+91AuCA841SbUi
	IHTXYJwhhlZuug5kmH6CvGaOBl1bBPJqJnRolKZ3AtSAli9lldyRNoZIlu+1yDYKyG6RvAT9GTL
	rb5S6RrG6yj3oVuudyoEmbmq84erFhfloE84K6hHxhYCtq9tnsk2/qWQXWIGt8BGCeYka+njIe6
	W3blL2RZ5+8riacmuOcXGtBmYAixvEGLdccjPAi1GQJEE0GJXoHfO56YgxJM7atN6Aye7qNxVp8
	k7xC1gXxRYoKf3b3UNPBpsIZO6XMXcQFoRJ8fXmYRWiaSkfJjY9MvkAxKWULrILY2dC/HeiWwWF
	SJk8fousPdcCNxxPO394tYIWGjSDW7msPRvhdGyPF7mLruMOMryNkOzDCvkSKajzpvce080RyxP
	8lke53Fl4efecFObse92AyG135YnvQRyzCplEohTYzfhuh11pNsLlO9oDrN+8RZ38Elbu+z70ER
	hH8TZFWj4JkSs4uVHh40ssoeMvo0d47BEmumt9bp87YSO+WiADlClRhIhR1Ru0iZ4cF9bdGiH7J
	ptffcqTx8XCgmMJ6zcVNJVurw3YIrdD5CsuhJ4xcvfMEo34HA878aV6Gl9yNiTrMP37RVL7YrJa
	WenPuBAn1cjwtXmLolBu5J8XQNUsi7zIjxU7eHQ7OBdV4QhJGbZVgZg4OPrWgm3qBhgCmmsZReU
	Fy+cvtVnvM10+vKrFS2Lb5xNWBWKokbryoJ4Mbn6YpucMRYVuQ=
X-Received: by 2002:a05:600c:1906:b0:4af:79ee:f660 with SMTP id 5b1f17b1804b1-4b963c8153cmr86011895e9.31.1794246668365;
        Mon, 09 Nov 2026 09:51:08 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:07 -0800 (PST)
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
Subject: [PATCH v2 02/11] staging: media: cedrus: reject too large H.264/HEVC SPS
Date: Mon,  9 Nov 2026 18:50:07 +0100
Message-ID: <20261109175016.42061-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
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

The H.264 decoder takes the picture size from the SPS, and the HEVC
decoder the position of the slices. An SPS beyond CEDRUS_MAX_WIDTH/HEIGHT,
or beyond the capture buffers, makes the hardware overrun memory and
hang. On H616, the JCT-VC PICSIZE_A..D streams (1056x8440, 8440x1056,
528x4216 and 4216x528) leave the hardware wedged, so that every
following job times out until reboot.

Reject an SPS beyond the hardware limits in try_ctrl, and move the
limits to cedrus_video.h for that.

Whether the picture fits the buffers can only be checked when a job
runs: the SPS can be set before the buffers are allocated, while the
OUTPUT format they are sized from can still change, and a request
doesn't have to carry an SPS at all. Check it in the setup callbacks,
so that such a job fails with an error buffer instead.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c   | 16 +++++++++
 drivers/staging/media/sunxi/cedrus/cedrus.h   | 34 +++++++++++++++++++
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 ++++
 .../staging/media/sunxi/cedrus/cedrus_h265.c  |  4 +++
 .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 +++
 6 files changed, 65 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index c3331b4f3f02..197213911bf7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -28,6 +28,15 @@
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
 
+/*
+ * Reject picture sizes beyond the hardware limits. Whether the picture fits
+ * the buffers is checked when a job is set up, see cedrus_check_pic_size().
+ */
+static bool cedrus_pic_size_supported(u32 width, u32 height)
+{
+	return width <= CEDRUS_MAX_WIDTH && height <= CEDRUS_MAX_HEIGHT;
+}
+
 static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 {
 	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
@@ -42,6 +51,9 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0)
 			/* Only 8-bit is supported */
 			return -EINVAL;
+		if (!cedrus_pic_size_supported(cedrus_h264_sps_width(sps),
+					       cedrus_h264_sps_height(sps)))
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
@@ -52,6 +64,10 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 			/* Only 4:2:0 is supported */
 			return -EINVAL;
 
+		if (!cedrus_pic_size_supported(sps->pic_width_in_luma_samples,
+					       sps->pic_height_in_luma_samples))
+			return -EINVAL;
+
 		bit_depth = max(sps->bit_depth_luma_minus8,
 				sps->bit_depth_chroma_minus8) + 8;
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 54f867949fba..c2318521d7e5 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -274,6 +274,40 @@ cedrus_is_capable(struct cedrus_ctx *ctx, unsigned int capabilities)
 	return (ctx->dev->capabilities & capabilities) == capabilities;
 }
 
+/*
+ * The decoders take the picture size, or the position of the slices, from
+ * the bitstream headers. Check that the picture fits the buffers, which are
+ * sized from the OUTPUT format and padded to at least 16 pixels in both
+ * directions, so that the hardware doesn't overrun them and hang.
+ */
+static inline int cedrus_check_pic_size(struct cedrus_ctx *ctx,
+					unsigned int width, unsigned int height)
+{
+	if (width > ALIGN(ctx->src_fmt.width, 16) ||
+	    height > ALIGN(ctx->src_fmt.height, 16))
+		return -EINVAL;
+
+	return 0;
+}
+
+static inline unsigned int
+cedrus_h264_sps_width(const struct v4l2_ctrl_h264_sps *sps)
+{
+	return (sps->pic_width_in_mbs_minus1 + 1) * 16;
+}
+
+static inline unsigned int
+cedrus_h264_sps_height(const struct v4l2_ctrl_h264_sps *sps)
+{
+	unsigned int height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
+
+	/* Map units are macroblock pairs, unless only frames are coded. */
+	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
+		height *= 2;
+
+	return height;
+}
+
 void *cedrus_find_control_data(struct cedrus_ctx *ctx, u32 id);
 u32 cedrus_get_num_of_controls(struct cedrus_ctx *ctx, u32 id);
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 892193c12b2f..e8229c60d3f5 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -518,9 +518,15 @@ static void cedrus_h264_irq_disable(struct cedrus_ctx *ctx)
 
 static int cedrus_h264_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 {
+	const struct v4l2_ctrl_h264_sps *sps = run->h264.sps;
 	struct cedrus_dev *dev = ctx->dev;
 	int ret;
 
+	ret = cedrus_check_pic_size(ctx, cedrus_h264_sps_width(sps),
+				    cedrus_h264_sps_height(sps));
+	if (ret)
+		return ret;
+
 	cedrus_engine_enable(ctx);
 
 	cedrus_write(dev, VE_H264_SDROT_CTRL, 0);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 6c643862ab73..aa772a8d71c8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -445,6 +445,10 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	cedrus_buf = vb2_to_cedrus_buffer(&run->dst->vb2_buf);
 	slice_bytes = vb2_get_plane_payload(&run->src->vb2_buf, 0);
 
+	if (cedrus_check_pic_size(ctx, sps->pic_width_in_luma_samples,
+				  sps->pic_height_in_luma_samples))
+		return -EINVAL;
+
 	/*
 	 * If entry points offsets are present, we should get them
 	 * exactly the right amount.
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

