Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795271125;
	b=Av1J1e6kGebrjK5Q++RkuPu599LVFohQwn8xredxHyRgsR+DTk90BEfvBNfqD9yXD9oA
	 Xs80ObOD5qcxkLTseDnyR0110QLq8EwWbvCCxmSQtyVvx4FnX3hh+1GuiZsfMqLDSJscX
	 g0jNoj1TSSPLZiGO4WdMpDw+DwB6MPA1nsKvL6eQVmJ6k1tV54H+5Z5cNBjGslOIUJwAN
	 TZPsfxf83meu+CIHSZETvtbKwL+yv53tKMzrB1Fm6mJ1+uQYTVRepXg9s3VQ0gFb7w0TV
	 BNVYArweKCpycZI1VlWwPJjqKcqPp/rQqxDCK6AMPdgqyMRbBdbLXLVm9ZmgCNaslwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271125;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/ZON3SAIrRksZXfRlKemsDJY0riEoLQaMw2lMa61zkw=;
	b=EcjA2WYJ7pJdX9OImqmSuApskmfjwDfUf2C0gH3wEbvBTx4devYD3wSEr6jKPbTHWf57
	 3s5MwRAMwzzHH1SvZ3TpM7RgD7tDCnN4Gus+OTqUKMaS8xEHteEsXg3++06982xCwo5xr
	 CtHImOjJ9y5TcC2cJVKnStz3bX4gezOEGAyDAe2QuCD4Z6dkXllb2OQyAREIGPnQh2TDz
	 81s8OP/hvuXR6lz0gNbqziJVfluMwgoPpN+PzGfJl9rjFjo41ZnIeQWtYFS19y3FoOsK6
	 zRkoCQ7b1F9FNB9cPXILnxtIj6cynffIHPkyQXqRdM3+skQWWgWmSw7QFoG5tU+1doQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jhtJ5BdZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F117606A334;
	Sat, 21 Nov 2026 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jhtJ5BdZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795271125;
	b=253y0VxLzVBJCFonE3IAhVL45aXDm4/vHxkwsUErVBwMW0kyodLBILyuPn8XjirTsqGE
	 OuyGe1L5xoPVGpat29Ui3hWlkie77C2MCYuZdRmsBfFHWXTCrdyy6aDk3Ja9T0rIPOQUi
	 2b4JmttyEf7ZNrUyesGjRh3kaOGOBlQ+kvaXncJSyxZqo7KddLvsZ5e1YgysYLlCwgdnd
	 CnbykWmFwBLLOY0t5h6eGI7USg9YCWT17njYKUhrKWPGmUk/GwOO9DeoiGE1l3qJz5Y4E
	 lA2NYSnTfSdP4XkU6mpcIbs51ufKUF8so2iu72yNjl0U6wuzxI/Ezgpdk0lcRm1ky9A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795271125;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/ZON3SAIrRksZXfRlKemsDJY0riEoLQaMw2lMa61zkw=;
	b=o1lRpCDnnI8bB+sz7v8cxe6k1mmKlmIAMeTNbkdaH8zyZcUzg1bF54CEsksSb9lhgnEH
	 /LyVJbPBNJB+e6LbO+jJsAxmF0e3BIpdxzMOXvZ4eUA85jpU9fcbhlvYgdh5FjLSgRytr
	 yv6osLMyG9k18or4nyvRj2ohnpw2a91SQbGoo1c8rvrpUI2bnyRtScNj7TSqcGnrF6wc8
	 crTN5WfXDsEmcfEQnPP4MEGvXfEdhDvfQbFK2+YnYUEsj1Q0SEZdCXdEX40cEXaUhX6nv
	 OPUIaeZeN6tNdY5iKOVrsR+hZeI2ssZDKon+FPg5RIg8rLkKXOElorCuI0Cfe0WWwUg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E08BD1F000C4;
	Sat, 21 Nov 2026 14:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795271124;
	bh=/ZON3SAIrRksZXfRlKemsDJY0riEoLQaMw2lMa61zkw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jhtJ5BdZqaF217mxVLg1LW8f7QKI2++eZpyUKRXI6S8yT9v33s9vfljo5t/kcxBYt
	 4qQF0Xyo6Z5um9cCsxizDtAYqguhaVEdlmD4oQytTPf6ADk4v4E/mIER98jzvaf08m
	 XLtJzAIoQ309EhaA5P0XMzpPg7V5ec6UNap6Jo8PGvnFGWMzaG5Lnzs/uuMDLWt3mw
	 uYbXFmTGeaKjEiUBpoUrdKrQ+0DWqHu47DC7WxdF7ltN93wdYmEIxXA8puakI/3Otu
	 2Jb9v53W5WEXSHOqKPGLkSmE2bKVY/Auep9KVSixcWCjFLIKs++EyRiw3ecRyGxNRJ
	 +lxq0lKEgTe6w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5E0A54BC91;
	Sat, 21 Nov 2026 14:25:23 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 14:25:23 +0000
Subject: [PATCH v2 1/2] media: verisilicon: Decode monochrome H.264 to GREY
 on Rockchip
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-b4-h264-monochrome-grey-v2-1-ffe7f2383cbe@gmail.com>
References: <20261121-b4-h264-monochrome-grey-v2-0-ffe7f2383cbe@gmail.com>
In-Reply-To: <20261121-b4-h264-monochrome-grey-v2-0-ffe7f2383cbe@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795271122; l=12642;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Z3+iElbs/OfCDOIXVvuAgXQIjbuCEJMtq47u/P7A09U=;
 b=SJ/ReUHfAnKzfDOamcznBgade9/pm7TkIDN1P+2RA03hRbgdRCruIRlLyHNmO/yN/NB/HMHt3
 mgNV2OO3z03ARW9iRvauaufcqU2JXqOQS8Ugde9hgybEssiOSlmywHP
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The Rockchip G1 and VDPU2 decoders write no chroma for a 4:0:0 High
profile H.264 picture, and the driver places the direct mode motion
vectors right after the luma plane. The driver offers NV12 only, so
userspace reads motion vectors as chroma. JVT-FR-EXT HPCAMOLQ_BRCM_B
and HPCVMOLQ_BRCM_B fail although their luma is bit-exact.

Offer only GREY for such streams on these variants. Refuse the switch
with -EBUSY while CAPTURE streams and fail requests that try it. As a
control can now change the CAPTURE format after buffers were queued,
fail jobs whose CAPTURE buffer is too small. Other variants are
unchanged.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro.h        | 11 ++++
 drivers/media/platform/verisilicon/hantro_drv.c    | 71 ++++++++++++++++++++--
 drivers/media/platform/verisilicon/hantro_h264.c   | 11 +++-
 drivers/media/platform/verisilicon/hantro_hw.h     |  2 +-
 drivers/media/platform/verisilicon/hantro_v4l2.c   | 22 +++++--
 .../media/platform/verisilicon/rockchip_vpu_hw.c   | 39 ++++++++++++
 6 files changed, 144 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0353de154a1e..7ffe56d8003f 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -234,6 +234,7 @@ struct hantro_dev {
  * @ctrl_handler:	Control handler used to register controls.
  * @jpeg_quality:	User-specified JPEG compression quality.
  * @bit_depth:		Bit depth of current frame
+ * @monochrome:		The H.264 SPS is 4:0:0 and the variant has a 4:0:0 format
  * @need_postproc:	Set to true if the bitstream features require to
  *			use the post-processor.
  *
@@ -263,6 +264,7 @@ struct hantro_ctx {
 	struct v4l2_ctrl_handler ctrl_handler;
 	int jpeg_quality;
 	int bit_depth;
+	bool monochrome;
 
 	const struct hantro_codec_ops *codec_ops;
 	struct hantro_postproc_ctx postproc;
@@ -291,6 +293,7 @@ struct hantro_ctx {
  * @frmsize:	Supported range of frame sizes (only for bitstream formats).
  * @postprocessed: Indicates if this format needs the post-processor.
  * @match_depth: Indicates if format bit depth must match video bit depth
+ * @monochrome: Decoded format for 4:0:0 streams only
  */
 struct hantro_fmt {
 	char *name;
@@ -302,8 +305,16 @@ struct hantro_fmt {
 	struct v4l2_frmsize_stepwise frmsize;
 	bool postprocessed;
 	bool match_depth;
+	bool monochrome;
 };
 
+/* CAPTURE takes the 4:0:0 format */
+static inline bool hantro_is_monochrome(const struct hantro_ctx *ctx)
+{
+	return ctx->monochrome && ctx->vpu_src_fmt &&
+	       ctx->vpu_src_fmt->codec_mode == HANTRO_MODE_H264_DEC;
+}
+
 struct hantro_reg {
 	u32 base;
 	u32 shift;
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 26e5d5547466..c3078568ac2c 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -128,13 +128,14 @@ void hantro_watchdog(struct work_struct *work)
 	}
 }
 
-void hantro_start_prepare_run(struct hantro_ctx *ctx)
+int hantro_start_prepare_run(struct hantro_ctx *ctx)
 {
 	struct vb2_v4l2_buffer *src_buf;
+	int ret;
 
 	src_buf = hantro_get_src_buf(ctx);
-	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
-				&ctx->ctrl_handler);
+	ret = v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
+				      &ctx->ctrl_handler);
 
 	if (!ctx->is_encoder && !ctx->dev->variant->late_postproc) {
 		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
@@ -142,6 +143,8 @@ void hantro_start_prepare_run(struct hantro_ctx *ctx)
 		else
 			hantro_postproc_disable(ctx);
 	}
+
+	return ret;
 }
 
 void hantro_end_prepare_run(struct hantro_ctx *ctx)
@@ -182,6 +185,15 @@ static void device_run(void *priv)
 
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
+	/* Queued before a control changed the CAPTURE format */
+	if (vb2_plane_size(&dst->vb2_buf, 0) <
+	    ctx->dst_fmt.plane_fmt[0].sizeimage) {
+		v4l2_ctrl_request_complete(src->vb2_buf.req_obj.req,
+					   &ctx->ctrl_handler);
+		hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
+		return;
+	}
+
 	ret = ctx->codec_ops->run(ctx);
 	if (ret)
 		hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
@@ -300,6 +312,54 @@ static int hantro_jpeg_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static bool hantro_has_monochrome_fmt(const struct hantro_ctx *ctx)
+{
+	const struct hantro_variant *variant = ctx->dev->variant;
+	unsigned int i;
+
+	for (i = 0; i < variant->num_dec_fmts; i++)
+		if (variant->dec_fmts[i].monochrome)
+			return true;
+
+	return false;
+}
+
+static int hantro_h264_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	const struct v4l2_ctrl_h264_sps *sps;
+	struct hantro_ctx *ctx;
+	bool monochrome, h264;
+	int ret;
+
+	ctx = container_of(ctrl->handler,
+			   struct hantro_ctx, ctrl_handler);
+
+	switch (ctrl->id) {
+	case V4L2_CID_STATELESS_H264_SPS:
+		sps = ctrl->p_new.p_h264_sps;
+		/* The decoder writes luma only for High profile 4:0:0 */
+		monochrome = sps->profile_idc >= 100 && !sps->chroma_format_idc &&
+			     hantro_has_monochrome_fmt(ctx);
+		if (ctx->monochrome == monochrome)
+			return 0;
+
+		h264 = ctx->vpu_src_fmt->codec_mode == HANTRO_MODE_H264_DEC;
+		if (h264 && vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)))
+			return -EBUSY;
+
+		ctx->monochrome = monochrome;
+		if (!h264)
+			return 0;
+
+		ret = hantro_reset_raw_fmt(ctx, ctx->bit_depth, HANTRO_AUTO_POSTPROC);
+		if (ret)
+			ctx->monochrome = !monochrome;
+		return ret;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int hantro_vp9_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct hantro_ctx *ctx;
@@ -377,8 +437,9 @@ static int hantro_av1_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
-static const struct v4l2_ctrl_ops hantro_ctrl_ops = {
+static const struct v4l2_ctrl_ops hantro_h264_ctrl_ops = {
 	.try_ctrl = hantro_try_ctrl,
+	.s_ctrl = hantro_h264_s_ctrl,
 };
 
 static const struct v4l2_ctrl_ops hantro_jpeg_ctrl_ops = {
@@ -460,7 +521,7 @@ static const struct hantro_ctrl controls[] = {
 		.codec = HANTRO_H264_DECODER,
 		.cfg = {
 			.id = V4L2_CID_STATELESS_H264_SPS,
-			.ops = &hantro_ctrl_ops,
+			.ops = &hantro_h264_ctrl_ops,
 		},
 	}, {
 		.codec = HANTRO_H264_DECODER,
diff --git a/drivers/media/platform/verisilicon/hantro_h264.c b/drivers/media/platform/verisilicon/hantro_h264.c
index 2414782f1eb6..ca52c977f591 100644
--- a/drivers/media/platform/verisilicon/hantro_h264.c
+++ b/drivers/media/platform/verisilicon/hantro_h264.c
@@ -440,8 +440,15 @@ int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx)
 	struct hantro_h264_dec_hw_ctx *h264_ctx = &ctx->h264_dec;
 	struct hantro_h264_dec_ctrls *ctrls = &h264_ctx->ctrls;
 	struct v4l2_h264_reflist_builder reflist_builder;
-
-	hantro_start_prepare_run(ctx);
+	int ret;
+
+	ret = hantro_start_prepare_run(ctx);
+	if (ret) {
+		/* E.g. an SPS that needs another CAPTURE format */
+		v4l2_ctrl_request_complete(hantro_get_src_buf(ctx)->vb2_buf.req_obj.req,
+					   &ctx->ctrl_handler);
+		return ret;
+	}
 
 	ctrls->scaling =
 		hantro_get_ctrl(ctx, V4L2_CID_STATELESS_H264_SCALING_MATRIX);
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 13e573f1f19d..4b49ff7da2e2 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -429,7 +429,7 @@ extern const u32 hantro_vp8_dec_mc_filter[8][6];
 void hantro_watchdog(struct work_struct *work);
 void hantro_irq_done(struct hantro_dev *vpu,
 		     enum vb2_buffer_state result);
-void hantro_start_prepare_run(struct hantro_ctx *ctx);
+int hantro_start_prepare_run(struct hantro_ctx *ctx);
 void hantro_end_prepare_run(struct hantro_ctx *ctx);
 
 irqreturn_t hantro_g1_irq(int irq, void *dev_id);
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 83af9fa1ce94..6cf8408354b0 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -109,6 +109,17 @@ hantro_check_depth_match(const struct hantro_fmt *fmt, int bit_depth)
 	return fmt_depth == bit_depth;
 }
 
+static bool
+hantro_check_fmt_match(const struct hantro_ctx *ctx,
+		       const struct hantro_fmt *fmt, int bit_depth)
+{
+	if (!ctx->is_encoder && fmt->codec_mode == HANTRO_MODE_NONE &&
+	    fmt->monochrome != hantro_is_monochrome(ctx))
+		return false;
+
+	return hantro_check_depth_match(fmt, bit_depth);
+}
+
 static const struct hantro_fmt *
 hantro_find_format(const struct hantro_ctx *ctx, u32 fourcc)
 {
@@ -156,7 +167,7 @@ hantro_get_default_fmt(const struct hantro_ctx *ctx, bool bitstream,
 	for (i = 0; i < num_fmts; i++) {
 		if (bitstream == (formats[i].codec_mode !=
 				  HANTRO_MODE_NONE) &&
-		    hantro_check_depth_match(&formats[i], bit_depth))
+		    hantro_check_fmt_match(ctx, &formats[i], bit_depth))
 			return &formats[i];
 	}
 
@@ -164,7 +175,7 @@ hantro_get_default_fmt(const struct hantro_ctx *ctx, bool bitstream,
 	for (i = 0; i < num_fmts; i++) {
 		if (bitstream == (formats[i].codec_mode !=
 				  HANTRO_MODE_NONE) &&
-		    hantro_check_depth_match(&formats[i], bit_depth))
+		    hantro_check_fmt_match(ctx, &formats[i], bit_depth))
 			return &formats[i];
 	}
 
@@ -253,7 +264,7 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 
 		if (skip_mode_none == mode_none)
 			continue;
-		if (!hantro_check_depth_match(fmt, ctx->bit_depth) && !enum_all_formats)
+		if (!hantro_check_fmt_match(ctx, fmt, ctx->bit_depth) && !enum_all_formats)
 			continue;
 		if (j == index) {
 			f->pixelformat = fmt->fourcc;
@@ -273,7 +284,7 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	for (i = 0; i < num_fmts; i++) {
 		fmt = &formats[i];
 
-		if (!hantro_check_depth_match(fmt, ctx->bit_depth) && !enum_all_formats)
+		if (!hantro_check_fmt_match(ctx, fmt, ctx->bit_depth) && !enum_all_formats)
 			continue;
 		if (j == index) {
 			f->pixelformat = fmt->fourcc;
@@ -337,6 +348,9 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 	vpu_debug(4, "trying format %p4cc\n", &pix_mp->pixelformat);
 
 	fmt = hantro_find_format(ctx, pix_mp->pixelformat);
+	if (fmt && !coded && !ctx->is_encoder &&
+	    fmt->monochrome != hantro_is_monochrome(ctx))
+		fmt = NULL;
 	if (!fmt) {
 		fmt = hantro_get_default_fmt(ctx, coded, HANTRO_DEFAULT_BIT_DEPTH, HANTRO_AUTO_POSTPROC);
 		pix_mp->pixelformat = fmt->fourcc;
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e..851af0e6c80b 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -134,6 +134,19 @@ static const struct hantro_fmt rk3066_vpu_dec_fmts[] = {
 			.step_height = MB_DIM,
 		},
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.codec_mode = HANTRO_MODE_NONE,
+		.monochrome = true,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	},
 	{
 		.fourcc = V4L2_PIX_FMT_H264_SLICE,
 		.codec_mode = HANTRO_MODE_H264_DEC,
@@ -188,6 +201,19 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
 			.step_height = MB_DIM,
 		},
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.codec_mode = HANTRO_MODE_NONE,
+		.monochrome = true,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_4K_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_4K_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	},
 	{
 		.fourcc = V4L2_PIX_FMT_H264_SLICE,
 		.codec_mode = HANTRO_MODE_H264_DEC,
@@ -242,6 +268,19 @@ static const struct hantro_fmt rockchip_vdpu2_dec_fmts[] = {
 			.step_height = MB_DIM,
 		},
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.codec_mode = HANTRO_MODE_NONE,
+		.monochrome = true,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	},
 	{
 		.fourcc = V4L2_PIX_FMT_H264_SLICE,
 		.codec_mode = HANTRO_MODE_H264_DEC,

-- 
2.55.0


