Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05DE42AFB7
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 13:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750602; cv=none; b=b3BHlKuV7O+E5USOI2eGlfJoL+zvfdRqSfkocOWbNeFes6vCKcBhzTjK1/Jhyi6nXVYnnF5X03+qQW4pWLn3Sdrn40NjMwHfAojWbadr1igbDy/pmgL/3yrt4ok2B3R1yFKO9AvWhVN0tUyhGXVAgY4v/CZshYUlofSom7dKGtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750602; c=relaxed/simple;
	bh=THMn0luMX4cku0CmD3upSa4VhiQXQXukK48ACXoBa6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QUmUlPLLGS0hNHGo5wGk4g6Q2ryFLIFjOv5CKyQZofSzS6f05eItQZMAfTyZIKvpvnVB0QWCVeYpL0v8Rvcdhh/uv624g9Lnu5XDspyR+UWxm9Akmd0anBrCDMFLrBlQvNan0+4DNoxaTYNzX3nG92q/IoHBXURih+knbppfhJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECx4eLn0; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECx4eLn0"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so1188436a12.1
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 06:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750596; x=1788355396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BJDJIpJZRxZ10l5Jed80WVNk6QVcCkQrV78n6UBbUM=;
        b=ECx4eLn0xDhrWwHqvDK1V4AD0X2kjhnDdhXoJf19m69heNvGJJCjkri39Qza/Qe+T1
         oxjFfSJXNPQbM4HEw9KPHFHdpvzGXpBMSEdlAUvcki2nznzB0EEbxZPdrjEuih45R0lW
         HbjJ11lNOBJo3AjM7CHdeEHyWGxu3DOEALt0CN5bMNchZviyjh3zYKcyD0jPTCz+SoQ0
         HjiBLSdyOXrU4n20gXekw2DHqz3w+zT+r/JH5N2cElsrRKUri+s1mFiAfaguEx6Kidlc
         nCG2SzKE/VJ56szqSmq+W+ducqMtzALXLuF6nwOGvU6dGCJbqdnObRviVVTB4p1pAIR9
         /Scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750596; x=1788355396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1BJDJIpJZRxZ10l5Jed80WVNk6QVcCkQrV78n6UBbUM=;
        b=gKHDX0p+mV1hUnwY2JwwBaT2vezHCHXa6QTzWLymIGHNRBnOVlU2hK63u8jdReV+wr
         ViCGgcvansqkZm7GEIpm8Y3Bu89/V4zo/L9ryqkhbX6qf8WuqmWX4ctLHWMWznyJzXrh
         Np4HJ2eDqIK6M3JL0iBs7tjnOWN9Gs/NOJvxwQuFKZJGI18dwRxNHe2Ct19KtngSZbME
         DC9XbXCKwoPvBxpEtl5rkTdAQKQSWXjkIF8sYEmEBDxZ6z3nbzZP/OcGd6Z0C67drYko
         yWUd8rDU0w8B8mgcEZhNmSDRXaZ4NHdWLvmP9d40Lw9NSAuW60P84S1eNtvhy7dJIYAT
         yoSQ==
X-Gm-Message-State: AFuF++ng0ScydqaSoqzBKEsfYWi0SLy2CBkVIHS+R9PkeIs2oN1kLCzz
	1FnpEU8SVrOgiesaxjzFXEBRdyRG/s8b3WgK1lFbHjuLe+P+26zwMdbI3b8hdQMh
X-Gm-Gg: AR+sD13CT/TorFMj1XDC8HFpJ/jup4fckC1ezl5iWdgrZsfGKzbGMYrnWMA7LlqgprD
	mOleTkny0s1l23j0d4sdQ7wYqR0X0eF9iN/4xNLacySNrRZ2RpXfjZbIiZ1HdTTqyQZkulEXjIn
	Ne9i9AGYCUQX3il3Ou0ktxhZB4nU39SpXVIhwFRaSaNFp9lte6JO2ulhKqLAd8WmxL/6PWM2u8U
	u5A2716m9bpSLgXIYzW5wbwe6fK18qSvpt3o0MLnxeHnK4Th6eLiyk3bjIncoFKToxWo9bDjo6j
	c7Fmc8R9B+1GXGBuIigSZs+qBo4H95DVkiuuQNE+9OE76V7bRj298XtvjWrE9s2Cr9NszPiGr81
	OIct2apLD345U8Qz+8W52OP1m0V0cqeLsKGxwosFnArIZXzYEUAzL29aRbEiRkbD71ORPN3RF+W
	NUqZS3WqXP64bshgwFi9bQUj/cg3nDtZUg5EEyTE1+H1qOqdZsMvtGxGSqypWjLWePaab87/plm
	5TsvbEG21pxBm82ohwoIzGDXuqI/S0gjPMHpUf2LKs=
X-Received: by 2002:a05:6402:538b:b0:698:ecf:d18a with SMTP id 4fb4d7f45d1cf-6a5df6535f1mr9483609a12.9.1787750596381;
        Wed, 26 Aug 2026 06:23:16 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a30sm3633147a12.15.2026.08.26.06.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:15 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 6/8] media: ov2740: add manual white balance controls
Date: Wed, 26 Aug 2026 15:22:54 +0200
Message-ID: <20260826132256.3343451-7-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sensor has separate red, green and blue manual white-balance gain
registers, but the driver currently writes the same digital-gain value
to all three channels. This prevents userspace from correcting the
strong color cast of raw Bayer capture.

Expose red- and blue-balance controls relative to the digital gain,
update all three channels under group hold, and always release and
launch the group even when a channel write fails.

Tested on the Yoga Book OV2740 with live gain changes and continuous raw
capture.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/i2c/ov2740.c | 71 +++++++++++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index b760d4dc0e68..7651443b28c1 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -607,6 +607,9 @@ struct ov2740 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *digital_gain;
+	struct v4l2_ctrl *red_balance;
+	struct v4l2_ctrl *blue_balance;
 
 	/* GPIOs, clocks, regulators */
 	struct gpio_desc *reset_gpio;
@@ -736,35 +739,46 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 	return 0;
 }
 
-static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
+static int ov2740_update_mwb_gains(struct ov2740 *ov2740)
 {
-	int ret;
+	u32 green_gain = ov2740->digital_gain->val;
+	u32 red_gain, blue_gain;
+	int end_ret, launch_ret, ret;
+
+	/* Balance controls use 1024 as unity relative to the digital gain. */
+	red_gain = min_t(u64,
+			 DIV_ROUND_CLOSEST_ULL((u64)green_gain *
+					       ov2740->red_balance->val,
+					       OV2740_DGTL_GAIN_DEFAULT),
+			 OV2740_DGTL_GAIN_MAX);
+	blue_gain = min_t(u64,
+			  DIV_ROUND_CLOSEST_ULL((u64)green_gain *
+						ov2740->blue_balance->val,
+						OV2740_DGTL_GAIN_DEFAULT),
+			  OV2740_DGTL_GAIN_MAX);
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
 	if (ret)
 		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, red_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, green_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, blue_gain);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }
 
 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
@@ -805,7 +819,9 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_DIGITAL_GAIN:
-		ret = ov2740_update_digital_gain(ov2740, ctrl->val);
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret = ov2740_update_mwb_gains(ov2740);
 		break;
 
 	case V4L2_CID_EXPOSURE:
@@ -846,7 +862,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -881,9 +897,22 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 			  OV2740_ANAL_GAIN_MIN, OV2740_ANAL_GAIN_MAX,
 			  OV2740_ANAL_GAIN_STEP, OV2740_ANAL_GAIN_MIN);
-	v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
-			  OV2740_DGTL_GAIN_MIN, OV2740_DGTL_GAIN_MAX,
-			  OV2740_DGTL_GAIN_STEP, OV2740_DGTL_GAIN_DEFAULT);
+	ov2740->digital_gain =
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+				  V4L2_CID_DIGITAL_GAIN,
+				  OV2740_DGTL_GAIN_MIN, OV2740_DGTL_GAIN_MAX,
+				  OV2740_DGTL_GAIN_STEP,
+				  OV2740_DGTL_GAIN_DEFAULT);
+	ov2740->red_balance =
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+				  V4L2_CID_RED_BALANCE,
+				  1, OV2740_DGTL_GAIN_MAX, 1,
+				  OV2740_DGTL_GAIN_DEFAULT);
+	ov2740->blue_balance =
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+				  V4L2_CID_BLUE_BALANCE,
+				  1, OV2740_DGTL_GAIN_MAX, 1,
+				  OV2740_DGTL_GAIN_DEFAULT);
 	exposure_max = ov2740->cur_mode->vts_def - OV2740_EXPOSURE_MAX_MARGIN;
 	ov2740->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
-- 
2.53.0

