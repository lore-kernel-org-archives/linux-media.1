Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7459A43C043
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 18:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199295; cv=none; b=d75ulVGxsNHETrrcJt/KrdlDNZVUJnVCYQylVUA054NzhAwutQs+zHHyKRiXTi3IhOWwhUlGiLSYZSZ+eEtbsGcqmv/5zsxheGSojpBYVjQvhRMyqos+QK+WD/hg8S2ntCYQ4vUsZu8pCYS5sYfXFqdQybrY5RkRMV64ME/WfIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199295; c=relaxed/simple;
	bh=oLflI2lIWaedlQfh7py6if9FMg6ErqlHPns57DR1I38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DW5qjB9WZaPGZ+vKP/8Lpvb9pWTE0kos+Tj9h8L1FR1sXnYlmJ39EIz80Jd5MxkXEVnOSVwvFzUvEeH/Rf/Ve7pl5v59Pr9vWkeX0aKV/QGIMmsCntTBD809H95j5WvI3QlJ4pek6O5kwzkJxT17ASokJQsekY06eegjwtGw9N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYs0nWWm; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYs0nWWm"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so38118515e9.3
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 11:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199292; x=1788804092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MemavacMmy8dnLfi03Bks7Tye/ONeVO/Ogj/0TC3Kco=;
        b=UYs0nWWmLnjfUE1Bz+9RZ6Wh+QDcDbsr7qHtlDqfLCON4PvJK1aKPECoITQbOvCeNd
         qJf7EJ6slt5WKPJOZ3c2klTwkWntLGbxfC4wYJBQXCc8MWdYu1Ti98lliDL5TZ9ux6pl
         KbG9/vkW2qwYkdpmmBTXik/QUuQIO9y3kFux+46ojIgtYUUMESGtavuHGnkxEGy8Cf5r
         wLpBJGwA0vA1VHx38iZvYCKRsKvOTtuBQD+oxNCs49HhJ7CoDdtC0tC73koDLVbMk2h8
         VPbVk82eV7CK+zzgzzSK8bSXEDTDP/lG87vSnuuHWmrqAeYcMTkolU64KRHIrL2Zb9TR
         KSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199292; x=1788804092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MemavacMmy8dnLfi03Bks7Tye/ONeVO/Ogj/0TC3Kco=;
        b=NTU8LFqq6Bhb8jqTaeRhXTqjx5mj52Iw8LXv6qfBkjUNYcVu1BE887WIPKrR9N1fU/
         3HBRqi4oxKYT5OzRPg3t3sHqHqsYtuFecWaa4zGXwHmiWXTnSQMEhzO7E9ctTXwC7NVk
         A5/Lgd9tAyB0cBul5aejYQZBCaJSQ0n/JotobtHOIb+zavVMRNOORjg8WhvpwJ2R8ap+
         YJQvFkeKEmKbJ96bo5J2mf4SiolhfzfMbXFjnkHhk/35ycCVEsStKACGPl8NuiZB4Ats
         GuN1QVP5SSt7mRcsBfzmHHiQewTaT+gjs+0wusxEi5HqNyr9SImghUBB4X17AdBOV19K
         gtUQ==
X-Gm-Message-State: AFuF++mnFYSaBCx/O4+q3FOozRkg6IJLo+ovX3ntommhnG8q/Bj4Qecr
	xPSiKXGPbXbIqPVlttb2LTLAxZmCGW6u84zsoCIdj3TpwN7OvKC4o8ThCpmlcviTk1Q=
X-Gm-Gg: AR+sD13dOUPGPqYFsj9uSyZ7DA2VjeBsU7EAyASeLUsdWV8u+CkREfdyvQXeCfrCT48
	+mUDf+/F5UzAsfYDlLkHRRbFEmYWMbolFFxIY7Lj0utf3gdshH/P+tC7OwMQCRv2UH3b8o4yqKf
	Bm9UUjRZpT3kKst4GBu/nIVOPaWXRpaDAswgHh/jFhZKRE/At+kAN0Wke7piaGua/rj+UHdfW30
	tI4eCpQiVwWsl1NlUdhZn094sejDVzm33FG9/S3VRd8Hq5FBI822Q1sdACoT7fokxY1pzZc4A2Y
	1Hu7OKMBBvsuS4yIuimAEnUKsJueysJj84ky5og0ywhwdO6GUibyjlwxk7uO4h0WZIsi2dKwyJU
	RK3QqGte30t1DHl3PxJdXPMO2hyYE6H4VIFTvQi3C/NRFxkE6IdM6ByItZpKkjtJ4cnCEUCLKBW
	5rcf+SnagQ/z9/X/Q73wO3UmwPn3iHeIDEEfT2L2ZUcd2LwpTh1J7UIATb+sKWuVRMbJvo+w1Dw
	+tN54cWRgcqSjDDRVNigGywRD5zodL5Zi5GXni0S98=
X-Received: by 2002:a05:600c:354f:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49b91c1ece1mr494023035e9.5.1788199291582;
        Mon, 31 Aug 2026 11:01:31 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:31 -0700 (PDT)
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
Subject: [PATCH v5 13/16] media: ov2740: add manual white balance controls
Date: Mon, 31 Aug 2026 20:00:58 +0200
Message-ID: <20260831180101.3109854-14-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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
With Best Regards,
Maurizio Casciano

