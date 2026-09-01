Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C3D4A0135
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 19:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289519; cv=none; b=Wv4bqFqtE+xZeJ9SgJkdrstc67BtPcbPNS++Um/oKeVFQwmPq9Ydn5oxWXqdDvHw3+Cz368KpsCawcGGoCnjiYxoCnFoI7tKTGVpb3Ru6Funq9UNuJ4NbQD4ZBqYmNyIcvuQChaUEQMI8N4e/ZEkaCZFgRHp4FX2r1t/XdlXeX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289519; c=relaxed/simple;
	bh=yy7NqzFTCZj46zAWpwdiPyZCalfwq4poxZvjcHNMIH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emYPABnBKNhcIiB0rPUkshMrPxDpd3O8pWSkN0bLFK6JgyxK9Ungb37lQinP3/thqUcO/Ca0CmZ5bU9GWG4vDpONzFkDPVs3jGMdPTlA7MeyRP4qWtIMNZqLdLJn2eArBjSgcKIL5AqpYsjx8E2nlel9/ZJr6a3y1UJfrNd/Fjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEr97gUD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEr97gUD"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b8687630fso1026785e9.3
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 12:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289507; x=1788894307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lm5sUM7FjiWcwv7SFl7EV+zS0klFRC7hu81VsxS1+dg=;
        b=JEr97gUDqQhXhh0nhoNt5HVitgZfqLVNxKHOvKRci2AudMnH9wW7whed8fAIWzXeAJ
         8GfqLdjQNsuHVFOvh+LsP4i4JIjUU16Yab+MgbI1OOvcogRcE99k5MSb3Stnzc1Xt4i6
         +7bXnyWV4XkEK4Rdi5qmxz4MUzsHY3lFZf5seTcj9BkJ3s7PIlgxKlqDuKCRogotglZL
         tKbYJVR1nGVPWKIopIGEdh+swGBCkiyCjpFpkYV2pFrtWNY15xM0QWo61Vjn256mfUXJ
         S7lj2TUc35aoiTNMaT6bGR0QCVM9HBtvYpXKw1NLwhiUfzgmgvaQEBc6E05YJfsgnUWI
         RdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289507; x=1788894307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lm5sUM7FjiWcwv7SFl7EV+zS0klFRC7hu81VsxS1+dg=;
        b=T/ixo/I3B1Y5JvhX/hG7bLCFNdfTjOcYLgiXLcA2sMqI2psUb/ewgzCSKTkilMiD23
         Tb9Gzgro2lJwsGLyvE/Pb6plLY2jDEX256ckACEs1uFJ7239cVko1/Oi6VMUonwWzm/G
         WT8dtqw2K2n+l2amMRo7CZ2jiIKKLxtsE+hcfUsZnWVGb/OscfHtz5h2I+uuRzP5DoFM
         HZKZ4c0fwJYzuw9OL6/b1fOUWVU0ZxU7Oumd64JdNcqyEf8SYyPUcyDbw7iCisTn2CRi
         PrqilIygd4h4qNY+ZjU9K8JhHqKiM4QwbF9TFTbBh7grD/KhxDqmuv/Hany7GdZYeu8j
         oLIA==
X-Forwarded-Encrypted: i=1; AHgh+RpVJYdk8ewdGwvZ1TEnEybNqFtCzlPLJ3mJT4rcofwvfV3TolZq0Em3ku0gSQZtdTzUpsdUbb5ocz/A7g==@vger.kernel.org
X-Gm-Message-State: AFuF++kV5iKWZmR5OqqFCdHEqvOSUUPliH+gE4544Q7RPLK5cQxgVjP1
	4mhBxo1Jz+jr0PBNgouYR6hgaUVbbafXbG5T/ja58aPV++rFW9Exc6Vc
X-Gm-Gg: AR+sD12XG6BNClWkKbeYo0UXHz0ESjYRZG6goi1nM+FgxlVOw/mvvQ6T9uDRPCiYEJ8
	AiWcdh3l7WTsWD6u/B5eLsq1eQ8p8OXTw7t/Dl45VUeTLg9Mbc+7NRR6QNeIPZqhwnUWn/sQBqo
	psWDdCgebG1Y19r2wiFC8+EQpz8Jv5hFvfO+M/yR5QTrJoy7Ey+wBHd9KC5n8yEdpSEOvBuJ/m8
	y/GPbinvfpwT3GE9/DqTvGnzvmU5ddkP9QDg4xlWNvYmTYOusgO+WplAuj83fgOFz+4lIM7QvrE
	dBrxjqediCaDGylzegwWwocmIG6Yru8o55BWc3mVOwTvfbOozQymwIA8xfdJBueMB6FXFyAK0hs
	Mw4AgEsn52pXoaX3+Dld2EMjNJRoU5ugvQvUsoA1iotDwHOh5XwMj68tz33ZMQhI5XvPCiK36nR
	GNLN/DV7r8vwy0V5Zr6tEaXuv1MZAIEH1T622iK5Ti/AR8VutNNf2IyAQwaWV3kM/niznrqx7e/
	CVxgPi5yihVAVRsYR862Cy1j16XGgkgkSIp4m5JLw==
X-Received: by 2002:a05:600c:870e:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49cdc43f461mr233533705e9.12.1788289507179;
        Tue, 01 Sep 2026 12:05:07 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:05:06 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 13/16] media: ov2740: add manual white balance controls
Date: Tue,  1 Sep 2026 21:04:35 +0200
Message-ID: <10f597f1911de1d3cc43b5aa7a4b3a13aff4e63b.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
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

Expose red- and blue-balance controls relative to the digital gain and
update all three channels under group hold.

Tested on the Yoga Book OV2740 with live gain changes and continuous raw
capture.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 44 +++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 5f381b7972bf..4600bbc90293 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -565,6 +565,9 @@ struct ov2740 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *digital_gain;
+	struct v4l2_ctrl *red_balance;
+	struct v4l2_ctrl *blue_balance;
 
 	/* GPIOs, clocks, regulators */
 	struct gpio_desc *reset_gpio;
@@ -694,8 +697,10 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 	return 0;
 }
 
-static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
+static int ov2740_update_mwb_gains(struct ov2740 *ov2740)
 {
+	u32 d_gain = ov2740->digital_gain->val;
+	u32 blue_gain, red_gain;
 	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
@@ -703,7 +708,11 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 	if (ret)
 		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
+	/* Balance controls use 1024 as unity relative to the digital gain. */
+	red_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->red_balance->val,
+				     OV2740_DGTL_GAIN_DEFAULT);
+	red_gain = min(red_gain, OV2740_DGTL_GAIN_MAX);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, red_gain);
 	if (ret)
 		goto release_group;
 
@@ -711,7 +720,10 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 	if (ret)
 		goto release_group;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
+	blue_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->blue_balance->val,
+				      OV2740_DGTL_GAIN_DEFAULT);
+	blue_gain = min(blue_gain, OV2740_DGTL_GAIN_MAX);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, blue_gain);
 
 release_group:
 	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
@@ -760,7 +772,9 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_DIGITAL_GAIN:
-		ret = ov2740_update_digital_gain(ov2740, ctrl->val);
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret = ov2740_update_mwb_gains(ov2740);
 		break;
 
 	case V4L2_CID_EXPOSURE:
@@ -801,7 +815,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -836,9 +850,23 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
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
+	v4l2_ctrl_cluster(3, &ov2740->digital_gain);
 	exposure_max = ov2740->cur_mode->vts_def - OV2740_EXPOSURE_MAX_MARGIN;
 	ov2740->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
-- 
2.53.0

