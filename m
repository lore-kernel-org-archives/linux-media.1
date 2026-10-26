Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013045;
	b=lSqWaDSGowOVBf6ZhP5KPVRRRcOJ3N1mIHUtRXVJYEtJB4s8J7Tc7SIuMRHp6tjMV5YD
	 bjniq6Ii8ADoDHRrJRG/6uNIhAz6S6vaw/luiTfe1GpjZtioahPyioaIZTu51DtIbKfT6
	 8oZyRBvGct9gZGFuoZUeAhpr8DuFM/qkUPAjSIMIBSv9IJCi3sLq+/t7EqxSrDbrQjPm2
	 lapKZZy4UVO6QQOtO9+SRbAyZI7nnZRPIH1VIYRMATUodeZSY9Xg/o5Qi6NnlSzVrmqOr
	 ORI0Es7SYOEBlHy9KQ8jyRV240VNlVc9tcf44SKywb+SpQ4Gpr3SWV0n0vOLEogrjgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nHwPIC5V518+I2XjhxcGCGVOoAe1dG9UyV/ZbSTa7EE=;
	b=z64kfLyMothmVMAvUHeRpzm9LNNjswX8MEpymeK0IrSb4HVbeMbKIe9Wn0RM2X8jgkah
	 yJRcpiGH0HVNWku449alWJalPYsmhDl+d4QKKiu9gS7pweraXJzwp6XaKvUvZaN4vIT2K
	 YqF+iJ8oeO2lMC1JxYDLIfn+GPHAoNQ8gW9P6WSLdiL9641xWwRxFWaD9609yTHqi20Sy
	 CTJ8oAy5sHyj7wBUSH0sn9rBZxseiP5RcyjOA3+BzskFmtkxmh/sbHIbHIKtAN9cv1/lc
	 nOavhy1EuewYKW40Z5mT44lNrn+8B5mwzh+uzkgna1e2B506r21KeVGnn2f25479jUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="S+70Eus/";
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684C4606A96C
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 11:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 684C4606A96C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S+70Eus/
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e83d2cc8a2so3652725ad.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 04:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013045; x=1793617845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nHwPIC5V518+I2XjhxcGCGVOoAe1dG9UyV/ZbSTa7EE=;
        b=S+70Eus/h/4LcgubusQOsZXB2NnYIPMewD5k9iM537w47Q3qly3RjCOhPD0JINFDPq
         k6Tjrh8HK5VkxnJ4RSO0C/gVL4AySDoj5JKnXV0ma4pcBR6TcHxcdL2Ux7+3saVWOaME
         zaHVd2oBAalIvbDxWMKFRXmsJF6OOLaJ4rH8UrrxzxMDPBMV1K7mZnlTKdhAKNDvN7PW
         gSOJkXm/wKxQUTQ3hb7C84ek7AA5GBOJx6783OMPuCMjqDbodEUhhte2L6JnTdyZJEvC
         0Uk5JMKp5JyrFZrrdlr9iz88oqJo6TvtWulV15sjYqd3drB10uMApACHzXBCD6iXkOhg
         3r8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013045; x=1793617845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nHwPIC5V518+I2XjhxcGCGVOoAe1dG9UyV/ZbSTa7EE=;
        b=SJKT9SRnTnBFWfxdefZDQo/LqYeD+GYwWPQMxiPNBXIkDJRtZw6Ix2IH+W/6CIMZ5G
         PZpyY1dM9BxW0zXlaAtsXUabidC+knPXhx18H8LiXQNl5YhL8AuV4aG5E+KfVvZQmAXq
         TGa428vy0B4t1U6yLgKZCq8R91vXbrWSN/atOVLN+rnCvm0MR8bRCD2Layi/8JfDoccH
         f5P0Sj80pTpRfa+yi0iN2IVKvMuCRgfbejs0FetU/zlRzAl/AZ/Bt+45bcEElbjNOqDr
         ylUcapght8f21V5V/2TR70QBksL1NOuKMrTV5RigOstt09Lkcr0ye2dUqJ2HlLBWWC2h
         SmDw==
X-Gm-Message-State: AFq9FYLDFWNi5E5UzeJ7L/aoy+s8fNeTRQR1mv5Wdrs2KSaeKmyZlt5V
	m53/2W+ITDKNy/4HVQOLsbPzYKjaJEzPSqdYbmwVUDPHOw/R+/Mm3uzkXGIM6vIHUnA=
X-Gm-Gg: AYBFou36bThrsFObyxkEDxebnMP1LFyUeyvGdfH/OcUPeksujyf5iU/LqSJNG/L+SUl
	6YOmptAQh1fG1xiSObggjaOzktmlV0g6lp9Jm2ThFJrisJ3p9FLhXLZwHr48H1g5www7Jq8WQHC
	FDhDi1dLvyPvLAfs9Hb10WKbItAE6tNQBySbxh901rTXX4OdFdBg7g5ZlMj3CkTKEEFZSCZmmjB
	ixj6ixxdFXPRDSWshF4If+oFTxCgjqaMXq6tBNuAfvF9lFsCw8g6BAuP/nHhTCRBkHH/sxJFWEK
	eYX2vml68ZwI6Agekr5w7T6G/x9eKuTy0+exJoV6XyFOb3EbSK6ahdMm1HEsKIkjqD+vUx/OMht
	FbqFbNj37/S21YCaVqg2fiRQ1aUNm6C3sjwN2LJPwHqaH3zJzYYxfg6fc5amOciRm1Uz1kBOj93
	XpmC/Deh6k+4r8oQke8fjeeQfFqEVfEkcSP/M4c0lJAnGDHX0E318XC1NZ7k0HlS7GSU53CxNhY
	OTVnk+XvtWzt3uBa5YueQMUvdRCjjtsieK7URyl7YRcV+lgrHJF8+CfgiWWeCkMkQ9mDWJyw8BO
	Esb3Iu1w/PG6TvdaAC2eSETm9Ti6xS6FXKh+pIeU2Ek5vg6Q++HI9unH/w0x9J+RqcjDcvYx3iP
	8UPTSouuP7qb7HRt5wT2DQB3RLm7ygT9aqIWaV02fv8cfKA==
X-Received: by 2002:a17:90b:28c4:b0:3a6:f1d2:57fa with SMTP id 98e67ed59e1d1-3adeae5dd2emr8767861a91.4.1793013044804;
        Mon, 26 Oct 2026 04:10:44 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm8023593a91.8.2026.10.26.04.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:44 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Antoine Pichot <antoine.pichot@gmail.com>
Subject: [PATCH 3/7] media: i2c: ov7251: Add control event support
Date: Mon, 26 Oct 2026 20:10:28 +0900
Message-ID: <20261026111032.88355-4-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026111032.88355-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
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

The driver exposes writable controls on its subdev node but does not
support control events, so VIDIOC_SUBSCRIBE_EVENT fails and
v4l2-compliance reports:

  fail: v4l2-test-controls.cpp(1128): subscribe event for control
  'User Controls' failed
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

Set V4L2_SUBDEV_FL_HAS_EVENTS and use the standard control event
helpers, as other sensor drivers do.

Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 8dad747f77..917285a62d 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -1471,6 +1472,11 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 	return ret;
 }
 
+static const struct v4l2_subdev_core_ops ov7251_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_video_ops ov7251_video_ops = {
 	.s_stream = ov7251_s_stream,
 };
@@ -1487,6 +1493,7 @@ static const struct v4l2_subdev_pad_ops ov7251_subdev_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops ov7251_subdev_ops = {
+	.core = &ov7251_core_ops,
 	.video = &ov7251_video_ops,
 	.pad = &ov7251_subdev_pad_ops,
 };
@@ -1717,7 +1724,8 @@ static int ov7251_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&ov7251->sd, client, &ov7251_subdev_ops);
 	ov7251->sd.internal_ops = &ov7251_internal_ops;
-	ov7251->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov7251->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov7251->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ov7251->sd.dev = &client->dev;
 	ov7251->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-- 
2.53.0

