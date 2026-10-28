Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186534;
	b=iK2/SUUdWVkEQW/Nd/qd3kC2RJAQb53Jm5bkOp1IfQjkxvSEDXe1tRiBEnH1KR42SGZj
	 AzUmjjTZZyKF5asCvNzsDWJ4ITh1hluRhlQMecQkxaU1M/8x40j0F72rqBNh10FW4OBcq
	 yrZnS3MpJKpiRRXon5WhJdl4BcfEEVeoxz2Pzg+t0QO1vYIXQVKVdom3AKQMN/9JRSkSF
	 7uuI6SzknI6bCxZ4TOayM/fHUBsEeaFOyuTq/ga2WOajYMoSyBOJMuYAqqjGUcEN8oQqK
	 GNPEtiHnw9kjr73Wlc9zeGNo2A9aEl7Z37i/XpzEvwpcAPB+e5oo4YojieuWKKYmPOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=54m2TSB1ZZXs4hqFBBBvsB03IQL64h1FC7FnVxPFkyY=;
	b=Hjp4y1ZI1Rj/AtHObh3H7vyQNaG2S3A9zV1hC4/I8QRhTbKaxHbpNLxcatDUQ3VEqFXf
	 prUNeFOwQ1+jDSlUm8/olc/jmRhLh8/3zNXrKIOM/QdlRTAsKfzAUrlv//K06H53Wl7n9
	 ICLQCQ6l9TVsfGRCWcpOYtTsZ4V9j9WtGW1kXcqZhgvOzJifcU76eUD8jl9hQyyMYW9s6
	 0Jtx+Z0v023xJ7VKCuF3EEwC2h6D0TR/dDnn8MakKz6y9x8HPaFAEkREy0QuZmS3wCyqo
	 IrvDfvbJz2Br/ouKD5swW1tsQtszHhLd5sku3eHSY35zWmd1SrRYAZMXxqsYhtCf9KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1leh29n;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EBE606A33D
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 11:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9EBE606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1leh29n
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9ae47b00cso1346685ad.3
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 04:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186533; x=1793791333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54m2TSB1ZZXs4hqFBBBvsB03IQL64h1FC7FnVxPFkyY=;
        b=m1leh29n9ZvLnc9HfzJL3HREV0Um85dQjLJ6fHl6jZbUjuy+MNirq5wswy9tua8Mx0
         gg2O8hbpklz57RrMW0ZLeQumm7UE+36+Ebp0nWPO2fd7q4A+GrCgkAGjrAG6ykc5j86h
         12+7GkX85rlGrBsxDpATYeGmVro0F7G6B8tUQ/roiHExBbcMY5gWgiMd/+h04HPu36Ry
         Ck270BF//HjlYMp1pGcWlqNrvsIwIv9IvbMclIQSTWFQz/7Boop4ef9ZE248zODXH+5v
         B+7dv6HBRvwgs737VzrTku4GvVcUpELZ7f0RjfYxxC2Bxod86UuHv2bnni5A6nipVZ5d
         azcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186533; x=1793791333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=54m2TSB1ZZXs4hqFBBBvsB03IQL64h1FC7FnVxPFkyY=;
        b=AiLajCfkIozG7kZhC9eKi7SOzt0stArJrBU9MRylWeoR/lDwWK7MeWRCALJsATnegL
         j5iWGZj5viOZkl3qcbhGowXRbPS33FeCb/KrLwb2r2P/9wATYvtUqopw8MqH2bU2yAtw
         UNZGnvpM8dV3iCRoqzx37a+8UxkPAyp9PX9v6Jw1vHOkOqf015eefJlp1ensPNybMxOS
         YqmPXdeh9It5WPogNwp1hOM0Qcp72yTaBJdCmCGlGC376IvyQrLDiZXXo6MZR8PtjWd+
         zUbYlGW8rgwr8RD6txumIB+XlXPEDKqsLhUGcwwsJxkKNyRqzqg6Qht/u8FUA0prLiXT
         s5CQ==
X-Gm-Message-State: AFq9FYKyVSw1vh1CHRQl8Xs25w6Fv3CQf/R/Ek71hwR2xm1MWUqr8yJj
	vxg4U1cS6ZCvnfcqjBZNu16Gq9SSHq22JHYWglbJ9rekzSgISYBbsHPQc3HOpdwNeQk=
X-Gm-Gg: AYBFou1w0Fy7GeL0i98UZKvQzf4GuLaCdUUTgO6LpmMXoEmlS79Yr0J8G9MMxpIFfWm
	SrnvhIi2q+07LndAaAb+xdaFFK1UE6++mmdqrT7+JN6NlAwkVpUUb39b37qHl4OeXB16Xk62tNg
	+E2WDx1j9wC05ZnAvZ4q0QiAXvup14aDdcHulsAkeK5wPHpSWUO+VBbZDb0XshL3cmL8iUYGPG9
	xBE0SHnMc0qPrt0NKsQCRM6vFg6J6S+soe7PKLCP6AhenIALrDVQmBHGiU4JbazhSF1j3SYf0oR
	XJWTJsf7SfAldjeHxWSXYbm9ooDjBc4g8XFzmj88gBjGSKn/FY3h46Q+oXt6LBgV+PrrZ1BFl8h
	gDd7izQP+8W+RYbefbyt3SpqPjsg4rviFEd5tcE1h5HJeH0mjNF8VzZOFeAZGBFe5L1DeyFy/lS
	H4Q3nGZt0Auefp/4QoEKhTEocnFQqu+KgZQ5jdQKIR301naWTAby5l330LlEhQZFEQ8LA4Hv0Ro
	VkQOFO9new4jS3IGMSUQf39Oo+Fj9gmHTxaXaQdWTUYFx6If+f0QTifrr2QLwINwmiEmmWAz6B2
	bsTS9X00fP+4nNHwtQzYzagZnFKeX83jaq4yhjfXa1eZfdZBYcz83LeOVQuzKXRN327KeS1cKu3
	cojahyQnGYVs49YrcI7mD+bb62pZret7JTMmDzbjz/1qlAu4QdUISbHYu3dLLHrqvKD720wa0Z2
	3BrUW9zLaa7e5wK6YeTrE=
X-Received: by 2002:a17:903:1b25:b0:2e2:d929:9c7c with SMTP id d9443c01a7336-2eb003297f4mr35850435ad.2.1793186532991;
        Wed, 28 Oct 2026 04:22:12 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eafcdb52e6sm10157945ad.74.2026.10.28.04.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:22:12 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/9] media: i2c: ov7251: Use sub-device active state
Date: Wed, 28 Oct 2026 20:21:50 +0900
Message-ID: <20261028112154.855185-6-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112154.855185-1-antoine.pichot@gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
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

Port the ov7251 driver to the sub-device active state.

The driver kept its own copies of the active format and crop rectangle
and selected between them and the try state with a pair of helpers
switching on the format's "which" field. Move the format and the crop
rectangle to the sub-device state for both the try and the active case,
drop the helpers and the private copies, and use the v4l2_subdev_get_fmt
helper for get_fmt. The init_state operation now fills whichever state
it is given through set_fmt, so the explicit ov7251_init_state() call at
the end of probe goes away; the exposure control gets the default mode's
range at creation instead of being adjusted by that call.

The driver mutex went away with it. The control handler's own lock now
serves as the state lock as well, so the control framework and the
sub-device core serialise the pad operations, the control operations
and the stream start between them; s_stream takes the active state lock
itself. The mode pointer, which the frame interval operations still
select by frame rate, stays and is protected by the same lock.

Behaviour is unchanged for applications. As a side effect the core now
reports V4L2_SUBDEV_FL_HAS_EVENTS for the sub-device and handles control
event subscription, so v4l2-compliance's VIDIOC_(UN)SUBSCRIBE_EVENT test
passes without the driver having to declare the event operations.

Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 154 +++++++++++--------------------------
 1 file changed, 43 insertions(+), 111 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 859bf6c42341..8277e28ac645 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -130,8 +130,6 @@ struct ov7251 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_fwnode_endpoint ep;
-	struct v4l2_mbus_framefmt fmt;
-	struct v4l2_rect crop;
 	struct clk *xclk;
 	u32 xclk_freq;
 
@@ -157,7 +155,6 @@ struct ov7251 {
 	u8 timing_format1;
 	u8 timing_format2;
 
-	struct mutex lock; /* lock to protect power state, ctrls and mode */
 	bool power_on;
 
 	struct gpio_desc *enable_gpio;
@@ -1041,8 +1038,6 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 					     exposure_max));
 	}
 
-	/* v4l2_ctrl_lock() locks our mutex */
-
 	if (!pm_runtime_get_if_in_use(ov7251->dev))
 		return 0;
 
@@ -1130,52 +1125,6 @@ static int ov7251_enum_frame_ival(struct v4l2_subdev *subdev,
 	return -EINVAL;
 }
 
-static struct v4l2_mbus_framefmt *
-__ov7251_get_pad_format(struct ov7251 *ov7251,
-			struct v4l2_subdev_state *sd_state,
-			unsigned int pad,
-			enum v4l2_subdev_format_whence which)
-{
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_state_get_format(sd_state, pad);
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return &ov7251->fmt;
-	default:
-		return NULL;
-	}
-}
-
-static int ov7251_get_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *sd_state,
-			     struct v4l2_subdev_format *format)
-{
-	struct ov7251 *ov7251 = to_ov7251(sd);
-
-	mutex_lock(&ov7251->lock);
-	format->format = *__ov7251_get_pad_format(ov7251, sd_state,
-						  format->pad,
-						  format->which);
-	mutex_unlock(&ov7251->lock);
-
-	return 0;
-}
-
-static struct v4l2_rect *
-__ov7251_get_pad_crop(struct ov7251 *ov7251,
-		      struct v4l2_subdev_state *sd_state,
-		      unsigned int pad, enum v4l2_subdev_format_whence which)
-{
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_state_get_crop(sd_state, pad);
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return &ov7251->crop;
-	default:
-		return NULL;
-	}
-}
-
 static inline u32 avg_fps(const struct v4l2_fract *t)
 {
 	return (t->denominator + (t->numerator >> 1)) / t->numerator;
@@ -1220,12 +1169,9 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 	int vblank_max, vblank_def;
 	struct v4l2_rect *__crop;
 	const struct ov7251_mode_info *new_mode;
-	int ret = 0;
-
-	mutex_lock(&ov7251->lock);
+	int ret;
 
-	__crop = __ov7251_get_pad_crop(ov7251, sd_state, format->pad,
-				       format->which);
+	__crop = v4l2_subdev_state_get_crop(sd_state, format->pad);
 
 	new_mode = v4l2_find_nearest_size(ov7251_mode_info_data,
 				ARRAY_SIZE(ov7251_mode_info_data),
@@ -1240,16 +1186,16 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 					       1, new_mode->exposure_max,
 					       1, new_mode->exposure_def);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		ret = __v4l2_ctrl_s_ctrl(ov7251->exposure,
 					 new_mode->exposure_def);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		ret = __v4l2_ctrl_s_ctrl(ov7251->gain, 16);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		vblank_max = OV7251_TIMING_MAX_VTS - new_mode->height;
 		vblank_def = new_mode->vts - new_mode->height;
@@ -1257,17 +1203,16 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 					       OV7251_TIMING_MIN_VTS,
 					       vblank_max, 1, vblank_def);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		ret = __v4l2_ctrl_s_ctrl(ov7251->vblank, vblank_def);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		ov7251->current_mode = new_mode;
 	}
 
-	__format = __ov7251_get_pad_format(ov7251, sd_state, format->pad,
-					   format->which);
+	__format = v4l2_subdev_state_get_format(sd_state, format->pad);
 	__format->width = __crop->width;
 	__format->height = __crop->height;
 	__format->code = MEDIA_BUS_FMT_Y10_1X10;
@@ -1280,27 +1225,21 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 
 	format->format = *__format;
 
-exit:
-	mutex_unlock(&ov7251->lock);
-
-	return ret;
+	return 0;
 }
 
 static int ov7251_init_state(struct v4l2_subdev *subdev,
 			     struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = {
-		.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
-		: V4L2_SUBDEV_FORMAT_ACTIVE,
+		.which = V4L2_SUBDEV_FORMAT_TRY,
 		.format = {
 			.width = 640,
 			.height = 480
 		}
 	};
 
-	ov7251_set_format(subdev, NULL, sd_state, &fmt);
-
-	return 0;
+	return ov7251_set_format(subdev, NULL, sd_state, &fmt);
 }
 
 static int ov7251_get_selection(struct v4l2_subdev *sd,
@@ -1308,15 +1247,10 @@ static int ov7251_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
-	struct ov7251 *ov7251 = to_ov7251(sd);
-
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP:
-	mutex_lock(&ov7251->lock);
-		sel->r = *__ov7251_get_pad_crop(ov7251, sd_state, sel->pad,
-						sel->which);
-		mutex_unlock(&ov7251->lock);
+		sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
 		break;
 	case V4L2_SEL_TGT_NATIVE_SIZE:
 		sel->r.top = 0;
@@ -1340,14 +1274,15 @@ static int ov7251_get_selection(struct v4l2_subdev *sd,
 static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 {
 	struct ov7251 *ov7251 = to_ov7251(subdev);
+	struct v4l2_subdev_state *state;
 	int ret;
 
-	mutex_lock(&ov7251->lock);
+	state = v4l2_subdev_lock_and_get_active_state(subdev);
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(ov7251->dev);
 		if (ret) {
-			mutex_unlock(&ov7251->lock);
+			v4l2_subdev_unlock_state(state);
 			return ret;
 		}
 
@@ -1381,12 +1316,12 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 		pm_runtime_put(ov7251->dev);
 	}
 
-	mutex_unlock(&ov7251->lock);
+	v4l2_subdev_unlock_state(state);
 	return ret;
 
 err_power_down:
 	pm_runtime_put(ov7251->dev);
-	mutex_unlock(&ov7251->lock);
+	v4l2_subdev_unlock_state(state);
 	return ret;
 }
 
@@ -1403,9 +1338,7 @@ static int ov7251_get_frame_interval(struct v4l2_subdev *subdev,
 	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	mutex_lock(&ov7251->lock);
 	fi->interval = ov7251->current_mode->timeperframe;
-	mutex_unlock(&ov7251->lock);
 
 	return 0;
 }
@@ -1417,7 +1350,7 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 	struct ov7251 *ov7251 = to_ov7251(subdev);
 	const struct ov7251_mode_info *new_mode;
 	int vblank_def;
-	int ret = 0;
+	int ret;
 
 	/*
 	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
@@ -1426,7 +1359,6 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	mutex_lock(&ov7251->lock);
 	new_mode = ov7251_find_mode_by_ival(ov7251, &fi->interval);
 
 	if (new_mode != ov7251->current_mode) {
@@ -1434,16 +1366,16 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 					       1, new_mode->exposure_max,
 					       1, new_mode->exposure_def);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		ret = __v4l2_ctrl_s_ctrl(ov7251->exposure,
 					 new_mode->exposure_def);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		ret = __v4l2_ctrl_s_ctrl(ov7251->gain, 16);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		vblank_def = new_mode->vts - new_mode->height;
 		ret = __v4l2_ctrl_modify_range(ov7251->vblank,
@@ -1452,21 +1384,18 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 					       new_mode->height,
 					       1, vblank_def);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		ret = __v4l2_ctrl_s_ctrl(ov7251->vblank, vblank_def);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		ov7251->current_mode = new_mode;
 	}
 
 	fi->interval = ov7251->current_mode->timeperframe;
 
-exit:
-	mutex_unlock(&ov7251->lock);
-
-	return ret;
+	return 0;
 }
 
 static const struct v4l2_subdev_video_ops ov7251_video_ops = {
@@ -1477,7 +1406,7 @@ static const struct v4l2_subdev_pad_ops ov7251_subdev_pad_ops = {
 	.enum_mbus_code = ov7251_enum_mbus_code,
 	.enum_frame_size = ov7251_enum_frame_size,
 	.enum_frame_interval = ov7251_enum_frame_ival,
-	.get_fmt = ov7251_get_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ov7251_set_format,
 	.get_selection = ov7251_get_selection,
 	.get_frame_interval = ov7251_get_frame_interval,
@@ -1582,18 +1511,20 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
 
 static int ov7251_init_ctrls(struct ov7251 *ov7251)
 {
+	const struct ov7251_mode_info *mode = ov7251->current_mode;
 	int vblank_max, vblank_def;
 	int hblank;
 
 	v4l2_ctrl_handler_init(&ov7251->ctrls, 7);
-	ov7251->ctrls.lock = &ov7251->lock;
 
 	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
 			  V4L2_CID_HFLIP, 0, 1, 1, 0);
 	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
 			  V4L2_CID_VFLIP, 0, 1, 1, 0);
 	ov7251->exposure = v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
-					     V4L2_CID_EXPOSURE, 1, 32, 1, 32);
+					     V4L2_CID_EXPOSURE, 1,
+					     mode->exposure_max, 1,
+					     mode->exposure_def);
 	ov7251->gain = v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
 					 V4L2_CID_GAIN, 16, 1023, 1, 16);
 	v4l2_ctrl_new_std_menu_items(&ov7251->ctrls, &ov7251_ctrl_ops,
@@ -1703,14 +1634,10 @@ static int ov7251_probe(struct i2c_client *client)
 		return PTR_ERR(ov7251->enable_gpio);
 	}
 
-	mutex_init(&ov7251->lock);
-
 	ov7251->current_mode = &ov7251_mode_info_data[0];
 	ret = ov7251_init_ctrls(ov7251);
-	if (ret) {
-		dev_err_probe(dev, ret, "error during v4l2 ctrl init\n");
-		goto destroy_mutex;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "error during v4l2 ctrl init\n");
 
 	v4l2_i2c_subdev_init(&ov7251->sd, client, &ov7251_subdev_ops);
 	ov7251->sd.internal_ops = &ov7251_internal_ops;
@@ -1725,9 +1652,16 @@ static int ov7251_probe(struct i2c_client *client)
 		goto free_ctrl;
 	}
 
+	ov7251->sd.state_lock = ov7251->ctrls.lock;
+	ret = v4l2_subdev_init_finalize(&ov7251->sd);
+	if (ret < 0) {
+		dev_err(dev, "could not initialize subdev state\n");
+		goto free_entity;
+	}
+
 	ret = ov7251_set_power_on(ov7251->dev);
 	if (ret)
-		goto free_entity;
+		goto subdev_cleanup;
 
 	ret = ov7251_detect_chip(ov7251);
 	if (ret)
@@ -1768,11 +1702,9 @@ static int ov7251_probe(struct i2c_client *client)
 	ret = v4l2_async_register_subdev(&ov7251->sd);
 	if (ret < 0) {
 		dev_err(dev, "could not register v4l2 device\n");
-		goto free_entity;
+		goto subdev_cleanup;
 	}
 
-	ov7251_init_state(&ov7251->sd, NULL);
-
 	return 0;
 
 err_pm_runtime:
@@ -1780,12 +1712,12 @@ static int ov7251_probe(struct i2c_client *client)
 	pm_runtime_put_noidle(ov7251->dev);
 power_down:
 	ov7251_set_power_off(ov7251->dev);
+subdev_cleanup:
+	v4l2_subdev_cleanup(&ov7251->sd);
 free_entity:
 	media_entity_cleanup(&ov7251->sd.entity);
 free_ctrl:
 	v4l2_ctrl_handler_free(&ov7251->ctrls);
-destroy_mutex:
-	mutex_destroy(&ov7251->lock);
 
 	return ret;
 }
@@ -1796,9 +1728,9 @@ static void ov7251_remove(struct i2c_client *client)
 	struct ov7251 *ov7251 = to_ov7251(sd);
 
 	v4l2_async_unregister_subdev(&ov7251->sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&ov7251->sd.entity);
 	v4l2_ctrl_handler_free(&ov7251->ctrls);
-	mutex_destroy(&ov7251->lock);
 
 	pm_runtime_disable(ov7251->dev);
 	if (!pm_runtime_status_suspended(ov7251->dev))
-- 
2.56.0

