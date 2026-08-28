Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AE0451071
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 16:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933733; cv=none; b=G4SwvD1NEWlXdeG/YZB1SLiowKee7MAWFFsKzy/EnlvGlTqW40pjcygtIDrq4YGUKOWRZAcM8zSrsFNvw0EX9pQG9ao5e0qhOCfPwRsy+cQsU/Aga/1A/MXK2rIpcw0jXA9eWMPx++qt5iS4eltz6LsVX5CL7vHlBIFtNz7oDDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933733; c=relaxed/simple;
	bh=BODxtu22bMbCeaCPm4r8rZD3W2Qadd/rUd5ROI9uEaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cip086BPI/I8QtmG854Z5w+6vVLp0Ak6C7JVDyk2fC1U3C8b7do/TosipSP4dp7PrAm2LLVF/57sEAFQ574LxnaNaHtIG2hXP64YTd1wxz/tasaSHAJjVM/IN/9xlyxDiENTF0FF32/B7Z8FRjOmZ7hyX3wk3OyzVVxkGp/HgZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwJZcSsm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwJZcSsm"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4815bce4652so905993f8f.1
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 09:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933729; x=1788538529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCkwaqt6mT/Mgi3LcK6pYptNejEWdk/2Ric0vWmObaI=;
        b=NwJZcSsmuLytFiukC6ddgOt+GaEainfG9kfrdthYL635duk1+oOy9bCaTO3u/MAc+v
         vCe+BBeqM45lsFPPhbx1jf1UbByeH4bGkMs8s1srDUzJALEPLjFXnBBdYDZb2do/FuH3
         EzpXhlBgU5LeJzBJU5cOOFzRt3kH5lCeu2ZpSa3Bmqr37h2e99yiP5QL835ILDeP/EIa
         RjRJXuZgOl+WcLQyseFiaQS4klKQ+m1TS6/4xglbf+vkr0LWCz3Sk0IKQmyBEAuTAeMB
         7L+wSO8QV75jVNzFtAzJN7BYaCkCi0K7paRMhpczQqba+a1113Mf9zt+9cCeRh0mRZTb
         8u9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933729; x=1788538529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pCkwaqt6mT/Mgi3LcK6pYptNejEWdk/2Ric0vWmObaI=;
        b=SBxK/3fNh7W72o/wMjmfVzWfeBBHIU8tpGrm+EbHVzExMRc9BF7w4eHXhcvAcuygep
         Lw06Aopa4AW4SYUdQgE20ckQ41fdtvdvbfECNibljuWRuECSKVXXGNGwBkKpRrkA1E3G
         MGImDH47CpSMygHoCNityGJLXmsl6cEzh9h14fNcjsfwSij8+etMjYWfh5GD6lfOSpn2
         /97e7YfTsH06s4Bnlcy3za3uGzh4ehceQywuIP7w1u/2vfMZaiOtBtm0Mo+booOkhvfX
         q9y39R96bFOD/q8dqLHiYho/34NXu9tZmARIpHekVz4LLePj2KRPPzy+JmqHlw6S+OFd
         MBxw==
X-Gm-Message-State: AFuF++mPXEzTnDG4SB/zLS5cmBmmMrAoLGENLY4akqc9WMn8vanmu1KK
	1GUfkrkJFsZ3EGwZVMjjQd1MleumNh2OakUILJpKE6n+bdaBLYBm5FDLMxU/IpJj
X-Gm-Gg: AR+sD12qOXiA/twGo85sPUpja6anrCGKDU6cAgd8Gcyh6CyE43nmEgkP2EG//1xIx1I
	LJqRJ4ldhFHTtV1q3asdrgzZQdig1bsRN+9eX4/BGylJOr86MyEI7Yz6te5NsYL55XxgBY5Hsno
	whcS5X34UEUW7XaiSwBDbjlw8VvnKuXT7Vg70MBX+76dK3bOqqMs1MXEEwl+PkMzfN0ElXuIzXe
	6ecj4tDQl0ouyKtK+hWzXNnPZ+yNF9y6Mp4VddmmCeFOIXfRSpH4NEA+wdbPauQb9Cb1wDNVF4p
	hp9Eg/397SgWL2nI1OtLCcvp8OxrVV8Jmu+ueFXzXFBxEeVHV/U2otSK5A26dtyFLvfvWjqydDJ
	TJ59Ydc9EKGgQovW4O5ZaboXWSIroMtffIbWucEqk/XCSCfknr2ooYsXqE+ftJ9ZVE/JfLMch8s
	5Ms7z/DYKZHFCiMfLjes0w1gLSopd34izd7HTEiEZrZQh79cPW4wViGSh52zTs2/GKUOi0OOW5F
	ZrnN6rkgjrEbyuiYkiYjXAIuFE4FGsD4iaUWkKbVw==
X-Received: by 2002:a5d:5d05:0:b0:482:e6ec:4ee9 with SMTP id ffacd0b85a97d-482f79947cfmr13628325f8f.7.1787933728667;
        Fri, 28 Aug 2026 09:15:28 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:28 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 12/15] media: ov2740: add manual white balance controls
Date: Fri, 28 Aug 2026 18:14:54 +0200
Message-ID: <a34bb1a2647d85de407b4c93627981ef0577cc75.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
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
 drivers/media/i2c/ov2740.c | 65 ++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index c67fcbad5bdb..c7f85c47bbd7 100644
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
@@ -694,35 +697,41 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 	return 0;
 }
 
-static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
+static int ov2740_update_mwb_gains(struct ov2740 *ov2740)
 {
-	int ret;
+	u32 d_gain = ov2740->digital_gain->val;
+	u32 blue_gain, red_gain;
+	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
 	if (ret)
 		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
+	/* Balance controls use 1024 as unity relative to the digital gain. */
+	red_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->red_balance->val,
+				     OV2740_DGTL_GAIN_DEFAULT);
+	red_gain = min(red_gain, OV2740_DGTL_GAIN_MAX);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, red_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
+	blue_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->blue_balance->val,
+				      OV2740_DGTL_GAIN_DEFAULT);
+	blue_gain = min(blue_gain, OV2740_DGTL_GAIN_MAX);
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
@@ -763,7 +772,9 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_DIGITAL_GAIN:
-		ret = ov2740_update_digital_gain(ov2740, ctrl->val);
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret = ov2740_update_mwb_gains(ov2740);
 		break;
 
 	case V4L2_CID_EXPOSURE:
@@ -804,7 +815,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -839,9 +850,23 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
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

