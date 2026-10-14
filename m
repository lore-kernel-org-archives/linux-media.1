Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEA556511F
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 17:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000480; cv=none; b=a7ZyR4fo51im41bA4VH6pRsLyKylUdem4HZzMp6Umaw1KP38IH2Ig3fy+8rvxNMAe66kjk9Jnt/mBac+puidehveUvsw+IG8WWdaxnRthQ8kB8qa5rvoBay5BQgNJ1/UD7Eo9MER3fIz3ep42Yz3Fba/Anu9sN8JMzuM+9tHST0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000480; c=relaxed/simple;
	bh=Ygt58a39ODK5Ix55P49F6dWVJjCA0eX3r3+KfduSHQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QsAKFcJjITKJjcEb4sJ3mKh4S8/xuDmxFhfwblZ2YsAIbyiEeZkKyQiH77Vf+ifr22Z+5JiMNa86DxmmJCfccxmrllhtoVzGO3iOdJdn0ZGou0sJ2c3R6Hb+fw7YA8cDDWzxx8m99nzk7coG4tx98K6BmUS3y5qJAgarpvWVRp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=KzFE4fLu; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KzFE4fLu"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b042c0759so3312932f8f.2
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 10:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000475; x=1792605275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGCCybkG7GF2ABFeMy61l6UkIcxmTI9+K+xoGadulns=;
        b=KzFE4fLujEHvokLW/rwZPiKiU2oe9h/kyvycrsMMvL/AlTSSyHbk9405q2FkcSLl0l
         OeBMh2443lb+IsJ11OPAIw3kHpDNwQofzjhWJHLnajkRHSLXlKLEAkCHlReV1kAbJaaM
         07dF0BdcBllB7W8cSRHKeoAGUKdtIKddO1IOKFSwkAeZiV+QphGoP/ZRHbj/PvaM3f9Z
         Zhz9gcwgR4r8uYFASJv36oialvcLk7pe/GKCCLbj/zXJyVeqVIKnchbW7zZv8MqPpSWl
         hiIkDyOXOKEaxTcoDT21YFgZvRIRhi+2FceUeIR9/bCq6N/C/5h80W91dg8vzOgNsSqF
         Gvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000475; x=1792605275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGCCybkG7GF2ABFeMy61l6UkIcxmTI9+K+xoGadulns=;
        b=IM9NxFIqE6ssD7W0U3nuy1Ro9StHDICknN0zaQTlEv/Gi1RtfK4Awaj4+Alrdz3P23
         uNnmEXoEGglwFAZyC3IcDqUhpOVs1C7NasFZmSmADjp3+lRKxjsx3Er3Z3E4TpCm3+rw
         aBQ2hayYpeZlUwXZMz6ZUme7EpCoAws0ldenORa+oUe1IhMrqTG1hgy1kplQq7iEOKK/
         M+1JPI06h6GfArroLoRNlJZMUFw5aOzuivogOI0v+ucCbxTjc0RLSYREZRFsxh4KVF8L
         8diRybijKvMyQPQ/ia1xu2pEC0lo6wmnQLhGjxmY81ygh3bF6ZigsJ1jAz1bIeEc/V7m
         xLug==
X-Forwarded-Encrypted: i=1; AKwUvByC+1urgbH0NhJ8ClDRFnvsRN4hsnl613CjnmNjFmZ5auNDzCmO5/wEcpm7y/dNuGmn730wVcbRXJ+qBQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZwOfUxJqwQfJC2WDfMyxFjnB3eO+hPASg/7cZYf79tEaw0Qem
	wjDXRcIWvRNPISTM1SG1mlsCBqoxG/lgcACsmwUuTj34Auuls0RK8cQXLYN3VQ2WGk0=
X-Gm-Gg: AYBFou3TnPlp9AYQy3h9V+HXs4bmdU0Efg4k3Zn7yKAYCOHBL9aqFIaADbzCwhhoIWf
	RdBqkiHyagQ8/2Ew+kt+4zK54QeRogD1uv/iSjk39ncVv79hXy6v5rw4Jn6rhGXIMkrnklc8CJa
	j9CNCrJBc15nDUdT5QmdHKql5NtJbADwr2+SQdCMdSmbzc9NapR7rjBcvN9S0eZiBl/P8QnNJ4h
	5/rnSJ6tqlbPn+AsCxedBHb66gBvH+t6pKjHlNgEi/YvSFlHCShGiPtP2i0PFlxhz+tFotAwj+a
	DPLYSF2TGS3P1Q/07R5tk8rSRAnhwkzCOwgZXfx2T9mVlE3iHbfq+wVnXMxtdXA8HPuJCuDC0uZ
	kkI1J/xSieqfqGAdzYNfMFzNKOi8+4GO1r6dTHxJDzhpF1EKesFrbPduwzmWHsnN+oNl4h2VgY2
	2pJwbRREQPtjHgBFe1khcpxU+R3K+7JRqklqHIWBdT2v8ohq6ydQIABIOrXYUiLeTAN84iEWroG
	wq6YUkXurhRej2mgJ5Scbe4iRmzS8sd5r+M7jPL3x/WWdoiFg==
X-Received: by 2002:a05:600c:c104:b0:4a1:96cd:2f6f with SMTP id 5b1f17b1804b1-4a196cd328dmr190156275e9.1.1792000473800;
        Wed, 14 Oct 2026 10:54:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:33 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:27 +0100
Subject: [PATCH v3 06/14] media: sony-starvis2: Allow runtime control of
 link frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-6-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
In-Reply-To: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

DT allows configuration of multiple link frequencies.
V4L2_CID_LINK_FREQ allows read write control.

Join these up so that link frequency can be configured at run time,
as long as the sensor isn't streaming.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 75 ++++++++++++++++++++++++++++-----------
 1 file changed, 55 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 1f3b33a5e44d..72fb037d7dbe 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -725,6 +725,7 @@ struct starvis2 {
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *link_freq;
 
 	/* Track VMAX for exposure updates */
 	u32 vmax;
@@ -755,6 +756,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct starvis2 *starvis2 = container_of_const(ctrl->handler, struct
 						       starvis2, ctrl_handler);
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
+	const struct starvis2_variant *variant = starvis2->variant;
 	const struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
 	int ret = 0;
@@ -778,6 +780,25 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 			return ret;
 	}
 
+	if (ctrl->id == V4L2_CID_LINK_FREQ) {
+		u32 hmax = variant->hmax_min_link_freq[ctrl->val];
+		s32 hblank;
+
+		if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+			hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
+
+		hblank = hmax * variant->pix_per_clk -
+					variant->active_area.width;
+
+		ret = __v4l2_ctrl_modify_range(starvis2->hblank,
+					       hblank,
+					       starvis2->hblank->maximum,
+					       starvis2->hblank->step,
+					       hblank);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * Only apply control values when device is powered on (RPM ACTIVE)
 	 * and streaming (usage count != 0)
@@ -824,6 +845,12 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(starvis2->cci, STARVIS2_REG_WINMODEV, ctrl->val,
 			  &ret);
 		break;
+	case V4L2_CID_LINK_FREQ:
+		/* The STARVIS2_LINK_FREQ_ enums match up with the register */
+		cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL, ctrl->val,
+			  &ret);
+		break;
+
 	default:
 		dev_warn(&client->dev,
 			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
@@ -938,9 +965,6 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  __fls(starvis2->link_freq_bitmap),
-		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
 
@@ -1018,6 +1042,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	__v4l2_ctrl_grab(starvis2->link_freq, true);
 	return 0;
 
 err_rpm_put:
@@ -1042,6 +1067,8 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(&client->dev, "%s failed to stop stream\n", __func__);
 
+	__v4l2_ctrl_grab(starvis2->link_freq, false);
+
 	pm_runtime_put(&client->dev);
 
 	return ret;
@@ -1208,7 +1235,6 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
 	const struct starvis2_variant *variant = starvis2->variant;
 	struct v4l2_fwnode_device_properties props;
-	struct v4l2_ctrl *link_freq;
 	s32 hblank, max_hblank, vblank, max_vblank;
 	u32 hmax;
 	int ret;
@@ -1224,25 +1250,26 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 
 	starvis2->vmax = starvis2->variant->vmax_default;
 
-	hmax = variant->hmax_min_link_freq[__fls(starvis2->link_freq_bitmap)];
-	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
-		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
-
 	/* PIXEL_RATE is fixed and read-only */
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  starvis2->variant->pixel_rate,
 			  starvis2->variant->pixel_rate, 1,
 			  starvis2->variant->pixel_rate);
 
-	/* LINK_FREQ is also read only */
-	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
-					   V4L2_CID_LINK_FREQ,
-					   ARRAY_SIZE(link_freqs) - 1,
-					   __ffs(starvis2->link_freq_bitmap),
-					   link_freqs);
-
-	if (link_freq)
-		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	starvis2->link_freq =
+		v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
+				       V4L2_CID_LINK_FREQ,
+				       __fls(starvis2->link_freq_bitmap),
+				       __ffs(starvis2->link_freq_bitmap),
+				       link_freqs);
+	if (!starvis2->link_freq)
+		goto err_free_handler;
+
+	v4l2_ctrl_modify_range(starvis2->link_freq,
+			       __ffs(starvis2->link_freq_bitmap),
+			       __fls(starvis2->link_freq_bitmap),
+			       ~(starvis2->link_freq_bitmap),
+			       __ffs(starvis2->link_freq_bitmap));
 
 	vblank = starvis2->vmax - starvis2->variant->active_area.height;
 	max_vblank = STARVIS2_VMAX_MAX - starvis2->variant->active_area.height;
@@ -1250,6 +1277,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 					     V4L2_CID_VBLANK, vblank, max_vblank,
 					     2, vblank);
 
+	hmax = variant->hmax_min_link_freq[starvis2->link_freq->val];
+	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
+
 	hblank = hmax * starvis2->variant->pix_per_clk -
 					starvis2->variant->active_area.width;
 	max_hblank = STARVIS2_HMAX_MAX * starvis2->variant->pix_per_clk -
@@ -1285,16 +1316,20 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &starvis2_ctrl_ops, &props);
 
 	if (ctrl_hdlr->error) {
-		ret = ctrl_hdlr->error;
 		dev_err(&client->dev, "%s control init failed (%d)\n",
 			__func__, ret);
-		v4l2_ctrl_handler_free(ctrl_hdlr);
-		return ret;
+		goto err_free_handler;
 	}
 
 	starvis2->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
+
+err_free_handler:
+	ret = ctrl_hdlr->error;
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
 }
 
 static int starvis2_check_hwcfg(struct device *dev, struct starvis2 *starvis2)

-- 
2.34.1

