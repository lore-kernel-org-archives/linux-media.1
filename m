Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537707;
	b=vdEBipsTVQNmJpNyIiB+ERMouEgs8B3BTvIuCNOtn+TDBrRYjjjl2um3FQkQGoqMim3i
	 9jE2/iydfOnIHnF8S/uJJFuP6tnxAUcSrn6X5TF6Jxg0P5xQ7xREMOkbA724kq9g5YfK2
	 7js3yOJQmX2n7NQh3CcM4fexYZPVyIQ2noP/b7uRAuym5prDMhhSRlwbH9ErgfKIVDZ67
	 TxCI5ODxYn/cVKn9IktzXPTcaCXE3Mbq2rRj2kRb739gvBW7zrMOMe1VaO9PJdDT9LfRM
	 U7fxvSMP30YCq9qERm9w9rHzxW3g/6ygcLJ2wOxC1Weev7vCsCc8GxrRkXq3xsF8n5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u6lNp8lnIwL0NWxmhBen6oXEwfx6srUbxa1sij+LFbA=;
	b=vD6W9Piy9PzBx9Su2HRB/sOsiBl69ORvdp3RHNanhKgxk9PhV9WxWT1mHAom7O6nHHTC
	 0QCIV+hljSj1ek9r/CcwF/QoMQv37f4XOV6O93CMBxwrWWw0Yrp8FuEWplqenRBtJhGj5
	 7078fZhjr7dQ1OSEDizz+TVA3G8CpITMmB5kiGlyUjP1pCe75vPAWv7uP2/2C60SUi9lx
	 1cVpROgYy7Oqly9rJ2iD63K1de3UyeI0Bhnea5Ws91O73l5jg+fdQgWP9P+9AXkAvaDuD
	 Qn7xeHE8lu0LIGJkAMESV+vzC1ej0XsPSl2n4vizN8t+FVX/hW/StaqpyiU3DyCdtOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JX/bkH2O";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB269606A32A
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 02:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB269606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JX/bkH2O
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37123334649so58880eec.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 18:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537706; x=1795142506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u6lNp8lnIwL0NWxmhBen6oXEwfx6srUbxa1sij+LFbA=;
        b=JX/bkH2OO+zkH+u0TLXi4XhLMiHSB1i855Dks24O10Z2oMf3yWTg+My2CweZ4JQBUc
         iF7ufnyeh9vfkWa3FS7oJrGcuukGxObZ/4M8hnL9Mz98umtbyP1ryErvtUICym6YEPLf
         2cvUJ4d6rilQZGmuEFedyjGgGE49ZvJQj/wAhzzn2OQIXpPW17s4MeU0h1JjCei6kK3e
         l8F7Wj5zUWRUhl7bNrs2gg35bT21uOltlUkLRnX7rZkmZ/iDxqnJxbA+AWH0STFKXvbz
         eztr0tcjyhDZoDTye9Ih+LQT9VNkvVY/9mrUcGlrAq05wj/jKslwYuy+9D9KhiJF3RL0
         VgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537706; x=1795142506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u6lNp8lnIwL0NWxmhBen6oXEwfx6srUbxa1sij+LFbA=;
        b=etW2trZZlEYPKtprUW2s/s6uxLxidJUCouDsKdofyFaKcVxMZAlpDJv19tGsowCbw3
         a2PseQSq/8RwM71eVhfbEr15uHPH198rDIHJNUxMLsk89YkC4E/qO6WcIcHwMvWpb5E3
         fqaVkXSJBs9kxJtvDHqyFhTn89KjMv3PcQDWZ2XuatoDXCJ48NSxY5n5ZUmt/D++lKOd
         j99lmG/IldzeXXTYfSTonJTWlR0tNc1HCt5k7mCJ6RfqiJ+R4RMiaA3uH6F2yBnXD1zV
         8b8OMzFnI8Qx7j8GWu4WbcA+0fmfbszzCVkiSSf9DTbG9FV6WhzEPfO9uVyrQZUngRoR
         YDJA==
X-Gm-Message-State: APuU4Z/C7ci3RmrGamfM+/tdY35Nx14cxLuC2GyxagXMZCrjuEJDjwhk
	XXILS/IOIFe0/8qPkdCtwhlEgCQr48YdRMLENF+BJwb97Tr1Rprgr+wJ/UjdrJFuFvo5bDrW
X-Gm-Gg: AYBFou0kKjma3QCSzqpuZWQIxzuBkE3cEc2n1QT5/LwqOBVwO/15PgWoi18gcGy6wK0
	ysZhMDWp7NfBduGUGimh9KGG/GwmE3DCi+4YQoI5Z6zeNfM8uiIFC6aXskDPwllrxMRAQLaN1eC
	H40dyn2MgIxLr8qhov2I5qXe1CLLIBDjPpUv1z/CHFQWDTj5HklVbQNHMsKUslIOkbfzAyriGGU
	MJhRHu356pYOqtiFNZDg4yjRaL+Rz/0lyxmHvp2QH9wbg4S4RqptqxpvDtdVvW7juzlYz6xcbTH
	7RARFLgLhYNZlzElSjWgxYNozQuthciOYE1j4y355nUIVJZJKaipcCWJc/y9/jimU/HvGWXJ29N
	LqytkAAxC0pg0mopRj9mR3XN+H9YYCIy3peU8I99pH44jWNFkE2Nnw4BY5ACU/JGGfLHd62VXe/
	H/AbAxCw7BY+7fv+l3c6Ts1mWOdcLS00uECvKvIyEbhDpaYoeIoP3uf1QCCBcXScPAgHk44Ei+P
	aKTQ7clD8OZwHuA9cnYueO5I9LP6YlsFjEuoAFzfCe9rKunf5IVdpBPuIAurH+woH1lZ2zOK+Bq
	kdbmjqJH34mhuruMiNuOOQ/GBJHA99krt4i6DYhjdMauGbqVn521lVC9wnOw51MuL1+ZWlt/xbc
	aD6WAAxr0205nZ2h8HX7gT1rOd6FvzrDVk94tVqDpzMycSYh4STMsu0XHUKfg3uk8ueLS5OCc+R
	x+6fmS7IDhNg==
X-Received: by 2002:a05:7300:c00e:20b0:35e:d21c:f33e with SMTP id 5a478bee46e88-379651ecb3emr1701515eec.1.1794537706078;
        Thu, 12 Nov 2026 18:41:46 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:623:52c6::44d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm2334704eec.22.2026.11.12.18.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:41:45 -0800 (PST)
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
Subject: [PATCH v3 5/9] media: i2c: ov7251: Use sub-device active state
Date: Fri, 13 Nov 2026 11:40:55 +0900
Message-ID: <20261113024059.1087031-6-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113024059.1087031-1-antoine.pichot@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com>
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

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/linux-media/at863XdUDea7JDA8@kekkonen.localdomain/
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 154 +++++++++++--------------------------
 1 file changed, 43 insertions(+), 111 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 81520833120a..c7489c6305aa 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -131,8 +131,6 @@ struct ov7251 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_fwnode_endpoint ep;
-	struct v4l2_mbus_framefmt fmt;
-	struct v4l2_rect crop;
 	struct clk *xclk;
 	u32 xclk_freq;
 
@@ -158,7 +156,6 @@ struct ov7251 {
 	u8 timing_format1;
 	u8 timing_format2;
 
-	struct mutex lock; /* lock to protect power state, ctrls and mode */
 	bool power_on;
 
 	struct gpio_desc *enable_gpio;
@@ -1042,8 +1039,6 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 					     exposure_max));
 	}
 
-	/* v4l2_ctrl_lock() locks our mutex */
-
 	if (!pm_runtime_get_if_in_use(ov7251->dev))
 		return 0;
 
@@ -1131,52 +1126,6 @@ static int ov7251_enum_frame_ival(struct v4l2_subdev *subdev,
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
@@ -1221,12 +1170,9 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
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
@@ -1241,16 +1187,16 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
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
@@ -1258,17 +1204,16 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
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
@@ -1281,27 +1226,21 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 
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
@@ -1309,15 +1248,10 @@ static int ov7251_get_selection(struct v4l2_subdev *sd,
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
@@ -1341,14 +1275,15 @@ static int ov7251_get_selection(struct v4l2_subdev *sd,
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
 
@@ -1382,12 +1317,12 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
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
 
@@ -1404,9 +1339,7 @@ static int ov7251_get_frame_interval(struct v4l2_subdev *subdev,
 	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	mutex_lock(&ov7251->lock);
 	fi->interval = ov7251->current_mode->timeperframe;
-	mutex_unlock(&ov7251->lock);
 
 	return 0;
 }
@@ -1418,7 +1351,7 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 	struct ov7251 *ov7251 = to_ov7251(subdev);
 	const struct ov7251_mode_info *new_mode;
 	int vblank_def;
-	int ret = 0;
+	int ret;
 
 	/*
 	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
@@ -1427,7 +1360,6 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	mutex_lock(&ov7251->lock);
 	new_mode = ov7251_find_mode_by_ival(ov7251, &fi->interval);
 
 	if (new_mode != ov7251->current_mode) {
@@ -1435,16 +1367,16 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
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
@@ -1453,21 +1385,18 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
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
@@ -1478,7 +1407,7 @@ static const struct v4l2_subdev_pad_ops ov7251_subdev_pad_ops = {
 	.enum_mbus_code = ov7251_enum_mbus_code,
 	.enum_frame_size = ov7251_enum_frame_size,
 	.enum_frame_interval = ov7251_enum_frame_ival,
-	.get_fmt = ov7251_get_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ov7251_set_format,
 	.get_selection = ov7251_get_selection,
 	.get_frame_interval = ov7251_get_frame_interval,
@@ -1583,18 +1512,20 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
 
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
@@ -1704,14 +1635,10 @@ static int ov7251_probe(struct i2c_client *client)
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
@@ -1726,9 +1653,16 @@ static int ov7251_probe(struct i2c_client *client)
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
@@ -1769,11 +1703,9 @@ static int ov7251_probe(struct i2c_client *client)
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
@@ -1781,12 +1713,12 @@ static int ov7251_probe(struct i2c_client *client)
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
@@ -1797,9 +1729,9 @@ static void ov7251_remove(struct i2c_client *client)
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

