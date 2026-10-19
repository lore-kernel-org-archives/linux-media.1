Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AA457FEF0
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420124; cv=none; b=CFfLr+1vbDmnEqpvFPksmscq4G/f3UGYXfvx1yZCocxK0z0x79i93VIeJZe8mOmSeT9VgSHjmLbsL+1FWIUlENMZMGSA3JFDNeCEL4vO2x3cbmFHw97AzCcWGgZB60V8+QENIHpJZW1rPFq567h6JdTdMViTrtbJJYP4N8sEjwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420124; c=relaxed/simple;
	bh=o+GRXga578RiSuKbmERt6Aw2aGwmTdTl7J/ae/pnFyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1sgK8NQEkDdpKLXDTkrKyjnxTsAZRLj9wIe3vNhGGr4M3YhI4a+7edzEG+8m4ofc0rGPIvm5SP7so/xc7BBCoqqx0zjZ5Y1YIsB3T2tpXSErpT0B5zadlIhdAA4CLP9zrGBeYUpBYWv+9F5eG0FLik+gWzaVRuVEeG52cZ36N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OJUWFlF1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OJUWFlF1"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1676633f8f.2
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 07:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420121; x=1793024921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGq5/FjKN+dURc5nu0HyEupdJjBxMRwTPEQlM6a2NmY=;
        b=OJUWFlF1lAIKpwLmZKOiFO4W0F812a1tBTAxTH3SvqhVK4ADYjzslafKoXtRAFbTVA
         Fc7a178cYOODNZlylMaGHfazpbtb51hwBuZWy5M0c0pMUHfCf020U143pPl9+7x2Sddi
         H5A2SYzkUmrprvZAgXFJCtZ6WkgbmUD08vbVlClnsSbzmJd0xrm3V/n0O7ehkfXGedps
         PKky+pLtARzfLUKYBqfXBk7vM1WPqS6zg3n5eH04KY07HYc2tOH+QOiFtVkZK+CHqhhC
         0/weOXDiOcIP0is+vEHrdALVpSV13sADac8iSatfbX+6148HQIE3NlQP7ITgAAKYMPfM
         htRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420121; x=1793024921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGq5/FjKN+dURc5nu0HyEupdJjBxMRwTPEQlM6a2NmY=;
        b=yrcIDGdBZG4EGlDUZxfY0Mf1R6HrMAjgtrvW9hE2vAwr4HLwKWgjHPb1i9KL0q3hhv
         qoiQUzq99Kkj7PCXt5UNkHEHWzVNHtPyIeUE7ZLrwRqzLpV3/sDlrw+t6ZAJN/cd4Yce
         k/LH5hK94CaghqywlBnjj8C/cJaBkgyAIxfzGbWEZBYGMsi1EF2NReNWPhVbfdzVSQW4
         6tB8Hz7IhJla2zQPggGzf392tzU8bMmOZ/rGtHeX3IrT8FA2lpd1Tpr1TdpixxFRwbmZ
         nL2z7ooqhBkAJPz2bOwyjaPvOHuaQsJsSn1yMLus5X10+SYHWfsNbAq5DA1ufr8GDCpW
         XDhQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4hIxmMist8y28vqxrpW+AC7GkZdkd+htyn4zPLwORf+UjJFndEmdLphvtcTT0db7Cy0m7cdJpgve4GA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJLeL1ewRwufzcf09+ffdpVqNDqli3GM1a6efbCahQBg0fZYeQ1
	FseYfJVX21DIQKMIEnzZ/2BnqlSxVy1ssufrBXpmTQshtSF4u1BkbVWxJ+bjyvd7wFQ=
X-Gm-Gg: AYBFou0PLHcVThWP5a4DcO3C5c9aLyvXxpinxIEYLT2jc4yBrzDnLjYGp8tjDppVoGf
	vwGyLjCfaBbkSdYcONmiZGWt49vAs56DIhqO+nUcsWbgvWjcmofZ0Bw+e6dit229g5irgqbU4lY
	rVZyweDMCzZJ0VPhe4o2vHcekDhjgQWRoKGIBiFJmezX4WZ0K9Uv8ky5yved9gW756+99yvxBJM
	SrrlJazsBdUu5eb2r+94q+cu3PE4AMf12bbOjDRv+wdxkTLga0cBGOO0ItX39kTEjmG9xdeOdYV
	K7nX3NuChB6q0h16cJ0zlsoP72AxgZAy4ZIwJwmIJw+CTzA1y/cTBofXAZ3NqK80atJqL4kOam5
	TBqUzh/pHuZplX9WnhrtupEVJjaNeb9vXQIB1GFrTJDumKDunvEsfTnNivESLUr3m1+nhvlQven
	72i6Y0u4kKtlkGTesHQJWYknyFe/2J8auhrXKyVqiaaAHi5pi7jBGkF52fxARcPlJede5GPBU5b
	ow2/XAkmSnq1uilNkpTbumvUoS0/1CSu9UNLRy/2itow0ovI56FWFOtRGDD
X-Received: by 2002:a05:6000:4b05:b0:48e:1399:a13 with SMTP id ffacd0b85a97d-48e13990a64mr8759225f8f.9.1792420120737;
        Mon, 19 Oct 2026 07:28:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:39 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:22 +0100
Subject: [PATCH v5 15/16] media: sony-starvis2: Parameterise exposure min
 and step
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-15-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
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

All the Starvis2 sensors supported to this point have specified
the range for the SHR (exposure) register as being 4 to
(number of line per frame -1).

Newer sensors are deviating from that, so parameterise
these into the sensor variant, replacing STARVIS2_EXPOSURE_MIN,
STARVIS2_EXPOSURE_STEP, and STARVIS2_SHR_MIN.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index e2b161656a5c..b9ade0887b6b 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -67,11 +67,8 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR                  CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN                  4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN             1
-#define STARVIS2_EXPOSURE_STEP            1
 #define STARVIS2_EXPOSURE_DEFAULT         1000
 
 /*
@@ -640,6 +637,9 @@ struct starvis2_variant {
 	unsigned int vmax_default;
 	const u16 *hmax_min_link_freq;
 	u16 hmax_min_pixel_array;
+	unsigned int exposure_min;
+	unsigned int exposure_step;
+	unsigned int shr_min;
 };
 
 static const struct starvis2_variant imx678_variant_def = {
@@ -666,6 +666,9 @@ static const struct starvis2_variant imx678_variant_def = {
 	.vmax_default = 2250,
 	.hmax_min_link_freq = imx678_min_hmax_2lane,
 	.hmax_min_pixel_array = 550,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx662_common_regs[] = {
@@ -796,6 +799,9 @@ static const struct starvis2_variant imx662_variant_def = {
 	.vmax_default = 1136,
 	.hmax_min_link_freq = imx662_min_hmax_2lane,
 	.hmax_min_pixel_array = 990,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx675_common_regs[] = {
@@ -983,6 +989,9 @@ static const struct starvis2_variant imx675_variant_def = {
 	.vmax_default = 2024,
 	.hmax_min_link_freq = imx675_min_hmax_2lane,
 	.hmax_min_pixel_array = 528,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx832_common_regs[] = {
@@ -1076,6 +1085,9 @@ static const struct starvis2_variant imx832_variant_def = {
 	.vmax_default = 1136,
 	.hmax_min_link_freq = imx832_min_hmax_2lane,
 	.hmax_min_pixel_array = 990,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 struct starvis2_model_info {
@@ -1247,12 +1259,15 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		starvis2->vmax = format->height + ctrl->val;
 
 		current_exposure = clamp_t(u32, current_exposure,
-					   STARVIS2_EXPOSURE_MIN,
-					   starvis2->vmax - STARVIS2_SHR_MIN);
+					   starvis2->variant->exposure_min,
+					   starvis2->vmax -
+						starvis2->variant->shr_min);
 		ret = __v4l2_ctrl_modify_range(starvis2->exposure,
-					       STARVIS2_EXPOSURE_MIN,
-					       starvis2->vmax - STARVIS2_SHR_MIN,
-					       1, current_exposure);
+					       starvis2->variant->exposure_min,
+					       starvis2->vmax -
+						starvis2->variant->shr_min,
+					       starvis2->variant->exposure_step,
+					       current_exposure);
 		if (ret)
 			return ret;
 	}
@@ -1776,10 +1791,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 
 	starvis2->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
 					       V4L2_CID_EXPOSURE,
-					       STARVIS2_EXPOSURE_MIN,
+					       starvis2->variant->exposure_min,
 					       starvis2->variant->vmax_default -
-					       STARVIS2_SHR_MIN,
-					       STARVIS2_EXPOSURE_STEP,
+						starvis2->variant->shr_min,
+					       starvis2->variant->exposure_step,
 					       STARVIS2_EXPOSURE_DEFAULT);
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,

-- 
2.34.1

