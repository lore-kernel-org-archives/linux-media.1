Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA844E679;
	Wed, 19 Aug 2026 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787138121; cv=none; b=D22+uL1aMq1nW+PB5U3/11YKTPm/JHjOLEhPGd94/W0pABwZ+3mCPvOJD7EXxhMjAbm35xF4mnWrVUI7aP2WUxiUVAEB+WkDE5ShZt/rOzFWDp3w87/9mry1zNiBRRRdhNkk20Hpxfbeq+z/YtHU/w3fY9h/t3wOXm97kofOe5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787138121; c=relaxed/simple;
	bh=fWxz3VMmZW9KqtqNY1LkgfM52UTditECJte/xRveldM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xr3s3ueJVS0iet8dTHnjRx8k6Y0vJ0qqUpj08ck/ebLrKU9R7qNXxqYr3gx82aOAyX0S4TsmpkBLXxEDdKkm+6sWdUsaiAlwkdwPlIiCiWkXE+/DEdAOBMrWze0VgbtrpZQoZmbiAvvdhOGIEOSFelFLxQ5CqCz84R4o+b/GzII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E9A0A201096;
	Wed, 19 Aug 2026 13:05:17 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wwe6f-002HRX-2O;
	Wed, 19 Aug 2026 13:05:17 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wwe6f-00000004K0O-2Qtp;
	Wed, 19 Aug 2026 13:05:17 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 19 Aug 2026 12:37:30 +0200
Subject: [PATCH 1/7] media: verisilicon: Fix the cleanup when a codec
 ->run() fails
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-rk3588-jpegdec-v1-1-33d74cdf369c@pengutronix.de>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
In-Reply-To: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lucas Sinn <lucas.sinn@wolfvision.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787137517; l=14121;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=fWxz3VMmZW9KqtqNY1LkgfM52UTditECJte/xRveldM=;
 b=LFWWvmAwv/DyWFncEuHIhKrgJTrY7ASBvVkpJ+i0JCddMgknkrVKH1iP7o+PAFLZOuJl3A9LW
 z1/9IaEFOD8DAjzhXpSlLgrSTe8uavO32xQyYTsQSMjMSPTzTpd0gh8
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

A codec ->run() operation that fails leaves three things behind, and they
cannot be untangled one at a time, so fix them together.

hantro_start_prepare_run() sets up the controls of the request attached
to the source buffer, hantro_end_prepare_run() completes them again and
arms the watchdog for the job that is about to be started. That pairing
does not survive the error paths. The two ->run() operations that do
reach hantro_end_prepare_run() arm a watchdog for a job that is never
started: device_run() finishes the job synchronously via
hantro_job_finish_no_pm() and nothing cancels the delayed work, so it
expires two seconds later and aborts whatever unrelated job happens to be
running by then.

Add an error argument to hantro_end_prepare_run() so that it can always
complete the request, but only arm the watchdog when the hardware is
really going to be started. Callers that succeed pass 0, the two existing
error paths pass their error code. Note the resulting invariant: after
hantro_end_prepare_run(ctx, 0) the ->run() operation must return 0, as
the watchdog is armed and only the interrupt handler disarms it.

rockchip_vpu981_av1_dec_run() then calls hantro_irq_done() on its error
path and returns the error code to device_run(), which finishes the job a
second time. The buffers have already been given back by then, so the
second attempt trips the WARN_ON(!src) in hantro_job_finish_no_pm() and
bails out. Without the watchdog change this at least reached the first
finish by accident, because the cancel_delayed_work() in
hantro_irq_done() returned true for the watchdog the error path had just
armed. Neither behaviour is something to rely on, so drop the call and
let device_run() clean the job up. No other codec calls hantro_irq_done()
from ->run().

That leaves device_run() itself. It takes a pm_runtime reference and
enables the clocks, then on any subsequent failure jumps to a single
err_cancel_job label that calls hantro_job_finish_no_pm() - which
releases neither. Release the acquired resources there.

This last part is what ties the three together. hantro_irq_done() ends up
in hantro_job_finish(), which already drops the pm reference and disables
the clocks, so as long as the AV1 error path still goes through it,
releasing the same resources in device_run() would trip the

  WARN_ON(core->enable_count == 0)

in clk_core_disable() and underflow dev->power.usage_count. Conversely,
as soon as a failed job no longer arms the watchdog, hantro_irq_done()
stops releasing anything at all and the resources are leaked until
device_run() takes over.

The late_postproc setup is skipped on the error path as well. It is part
of preparing the run, the hardware is not started and the next job
configures it again. Only the sunxi variant sets late_postproc, and its
only decoder is VP9.

Fixes: 892bb6ecead9 ("media: hantro: do a PM resume earlier")
Fixes: e2da465455ce ("media: hantro: Support VP9 on the G2 core")
Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/media/platform/verisilicon/hantro_drv.c    | 32 +++++++++++++++++++---
 .../platform/verisilicon/hantro_g1_h264_dec.c      |  2 +-
 .../platform/verisilicon/hantro_g1_mpeg2_dec.c     |  2 +-
 .../media/platform/verisilicon/hantro_g1_vp8_dec.c |  2 +-
 .../platform/verisilicon/hantro_g2_hevc_dec.c      |  2 +-
 .../media/platform/verisilicon/hantro_g2_vp9_dec.c |  4 +--
 .../platform/verisilicon/hantro_h1_jpeg_enc.c      |  2 +-
 drivers/media/platform/verisilicon/hantro_hw.h     |  2 +-
 .../verisilicon/rockchip_vpu2_hw_h264_dec.c        |  2 +-
 .../verisilicon/rockchip_vpu2_hw_jpeg_enc.c        |  2 +-
 .../verisilicon/rockchip_vpu2_hw_mpeg2_dec.c       |  2 +-
 .../verisilicon/rockchip_vpu2_hw_vp8_dec.c         |  2 +-
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       |  5 ++--
 13 files changed, 42 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640fb..d9936f6979d2c 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -147,11 +147,28 @@ void hantro_start_prepare_run(struct hantro_ctx *ctx)
 	}
 }
 
-void hantro_end_prepare_run(struct hantro_ctx *ctx)
+/**
+ * hantro_end_prepare_run() - finish the preparation of a job
+ * @ctx:	context the job belongs to
+ * @error:	0 if the job is about to be started, negative errno if the
+ *		codec ->run() operation failed and will return that error
+ *
+ * Every hantro_start_prepare_run() must be paired with a call to this
+ * function, including on the error paths of ->run(): the controls of the
+ * request were set up by hantro_start_prepare_run() and the request stays
+ * incomplete forever if they are not completed here.
+ *
+ * When @error is zero the caller must go on and start the hardware, as the
+ * watchdog is armed and only the interrupt handler disarms it again. On the
+ * error paths the job is finished synchronously by device_run(), so no
+ * watchdog is needed and arming it would make it expire during an unrelated
+ * job later on.
+ */
+void hantro_end_prepare_run(struct hantro_ctx *ctx, int error)
 {
 	struct vb2_v4l2_buffer *src_buf;
 
-	if (!ctx->is_encoder && ctx->dev->variant->late_postproc) {
+	if (!error && !ctx->is_encoder && ctx->dev->variant->late_postproc) {
 		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
 			hantro_postproc_enable(ctx);
 		else
@@ -162,6 +179,9 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
 				   &ctx->ctrl_handler);
 
+	if (error)
+		return;
+
 	/* Kick the watchdog. */
 	schedule_delayed_work(&ctx->dev->watchdog_work,
 			      msecs_to_jiffies(2000));
@@ -182,15 +202,19 @@ static void device_run(void *priv)
 
 	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
 	if (ret)
-		goto err_cancel_job;
+		goto err_pm_put;
 
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
 	if (ctx->codec_ops->run(ctx))
-		goto err_cancel_job;
+		goto err_clk_disable;
 
 	return;
 
+err_clk_disable:
+	clk_bulk_disable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
+err_pm_put:
+	pm_runtime_put_autosuspend(ctx->dev->dev);
 err_cancel_job:
 	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
 }
diff --git a/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c b/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c
index ad5c1a6634f5c..30c2ac32cd0b0 100644
--- a/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c
@@ -264,7 +264,7 @@ int hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
 	set_ref(ctx);
 	set_buffers(ctx, src_buf);
 
-	hantro_end_prepare_run(ctx);
+	hantro_end_prepare_run(ctx, 0);
 
 	/* Start decoding! */
 	vdpu_write_relaxed(vpu,
diff --git a/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c b/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
index e0d6bd0a6e44f..bfcece9f8e5dd 100644
--- a/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
@@ -232,7 +232,7 @@ int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 					&dst_buf->vb2_buf,
 					seq, pic);
 
-	hantro_end_prepare_run(ctx);
+	hantro_end_prepare_run(ctx, 0);
 
 	vdpu_write(vpu, G1_REG_INTERRUPT_DEC_E, G1_REG_INTERRUPT);
 
diff --git a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
index 851eb67f19f50..eb43b2fc19582 100644
--- a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
@@ -503,7 +503,7 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 	cfg_ref(ctx, hdr, vb2_dst);
 	cfg_buffers(ctx, hdr, vb2_dst);
 
-	hantro_end_prepare_run(ctx);
+	hantro_end_prepare_run(ctx, 0);
 
 	vdpu_write(vpu, G1_REG_INTERRUPT_DEC_E, G1_REG_INTERRUPT);
 
diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
index e8c2e83379def..d76d03eeac39d 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
@@ -611,7 +611,7 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
 
 	prepare_scaling_list_buffer(ctx);
 
-	hantro_end_prepare_run(ctx);
+	hantro_end_prepare_run(ctx, 0);
 
 	hantro_reg_write(vpu, &g2_mode, HEVC_DEC_MODE);
 	hantro_reg_write(vpu, &g2_clk_gate_e, 1);
diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
index 56c79e339030e..760f4acf90c34 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
@@ -895,7 +895,7 @@ int hantro_g2_vp9_dec_run(struct hantro_ctx *ctx)
 
 	ret = start_prepare_run(ctx, &decode_params);
 	if (ret) {
-		hantro_end_prepare_run(ctx);
+		hantro_end_prepare_run(ctx, ret);
 		return ret;
 	}
 
@@ -904,7 +904,7 @@ int hantro_g2_vp9_dec_run(struct hantro_ctx *ctx)
 
 	config_registers(ctx, decode_params, src, dst);
 
-	hantro_end_prepare_run(ctx);
+	hantro_end_prepare_run(ctx, 0);
 
 	vdpu_write(ctx->dev, G2_REG_INTERRUPT_DEC_E, G2_REG_INTERRUPT);
 
diff --git a/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c b/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
index 86cc1a07026f0..78f51e92fb2e3 100644
--- a/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
+++ b/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
@@ -148,7 +148,7 @@ int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
 		| H1_REG_ENC_PIC_INTRA
 		| H1_REG_ENC_CTRL_EN_BIT;
 
-	hantro_end_prepare_run(ctx);
+	hantro_end_prepare_run(ctx, 0);
 
 	vepu_write(vpu, reg, H1_REG_ENC_CTRL);
 
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 13e573f1f19de..9754672a3306b 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -430,7 +430,7 @@ void hantro_watchdog(struct work_struct *work);
 void hantro_irq_done(struct hantro_dev *vpu,
 		     enum vb2_buffer_state result);
 void hantro_start_prepare_run(struct hantro_ctx *ctx);
-void hantro_end_prepare_run(struct hantro_ctx *ctx);
+void hantro_end_prepare_run(struct hantro_ctx *ctx, int error);
 
 irqreturn_t hantro_g1_irq(int irq, void *dev_id);
 void hantro_g1_reset(struct hantro_ctx *ctx);
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c
index 6da87f5184bcb..eb9067d56f35d 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c
@@ -481,7 +481,7 @@ int rockchip_vpu2_h264_dec_run(struct hantro_ctx *ctx)
 	set_ref(ctx);
 	set_buffers(ctx, src_buf);
 
-	hantro_end_prepare_run(ctx);
+	hantro_end_prepare_run(ctx, 0);
 
 	/* Start decoding! */
 	reg = vdpu_read(vpu, VDPU_SWREG(57)) | VDPU_REG_DEC_E(1);
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
index 61621b1be8a2f..aa34bd2e47ad2 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
@@ -180,7 +180,7 @@ int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx)
 		| VEPU_REG_ENCODE_ENABLE;
 
 	/* Kick the watchdog and start encoding */
-	hantro_end_prepare_run(ctx);
+	hantro_end_prepare_run(ctx, 0);
 	vepu_write(vpu, reg, VEPU_REG_ENCODE_START);
 
 	return 0;
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_mpeg2_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_mpeg2_dec.c
index 50a3a3eeaa00d..e87604abb4626 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_mpeg2_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_mpeg2_dec.c
@@ -239,7 +239,7 @@ int rockchip_vpu2_mpeg2_dec_run(struct hantro_ctx *ctx)
 					    &dst_buf->vb2_buf, seq, pic);
 
 	/* Kick the watchdog and start decoding */
-	hantro_end_prepare_run(ctx);
+	hantro_end_prepare_run(ctx, 0);
 
 	reg = vdpu_read(vpu, VDPU_SWREG(57)) | VDPU_REG_DEC_E(1);
 	vdpu_write(vpu, reg, VDPU_SWREG(57));
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c
index d079075448c96..6568e2aee80fc 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c
@@ -592,7 +592,7 @@ int rockchip_vpu2_vp8_dec_run(struct hantro_ctx *ctx)
 	cfg_ref(ctx, hdr, vb2_dst);
 	cfg_buffers(ctx, hdr, vb2_dst);
 
-	hantro_end_prepare_run(ctx);
+	hantro_end_prepare_run(ctx, 0);
 
 	hantro_reg_write(vpu, &vp8_dec_start_dec, 1);
 
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4e21ad373233..c6a5af979d478 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -2185,15 +2185,14 @@ int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
 	rockchip_vpu981_av1_dec_set_output_buffer(ctx);
 	rockchip_vpu981_av1_dec_set_input_buffer(ctx, vb2_src);
 
-	hantro_end_prepare_run(ctx);
+	hantro_end_prepare_run(ctx, 0);
 
 	hantro_reg_write(vpu, &av1_dec_e, 1);
 
 	return 0;
 
 prepare_error:
-	hantro_end_prepare_run(ctx);
-	hantro_irq_done(vpu, VB2_BUF_STATE_ERROR);
+	hantro_end_prepare_run(ctx, ret);
 	return ret;
 }
 

-- 
2.47.3

