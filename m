Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58447484235
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 16:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946324; cv=none; b=TDayrBQ49AK2DqJhMnJcFouLyE2D+LCkYqoHPA5+mUqkPEVt1LiWYZJAoWMo0pPDZYZVHh5wvUJJAccpRqr483wIS78htEFBBQRPYPdJIEewDycHCqi5Qs8EKlBsNzYpaD68ftXNzOIpQa5M7aJoHyRmjwnailqWnRJjJNWYst0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946324; c=relaxed/simple;
	bh=mG2bDcWTi4mlRLUm9EKQVSx+fZ0rDkJ2RZNnJggcNYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j1JwTqKhHos1cmzz+7UVALx+fCMisqdEb1qLVqtsUpc4BPUMf6CpnFwboWQ4r2pGE5HCB7NBrRec/AyZcwM8A1pDPfyK8kCJ5/uDDzK9pHhwD4wjmlpIMWKkt4KIFD0/+PPCWspaJFhwHRDBBFsVAvXAFv4fzknPj0uzgyiFMhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=YAdQE7jR; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="YAdQE7jR"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so896590f8f.2
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1785946315; x=1786551115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kolcK42TrMzxGiVKCT6CZlZE37gCSGJD0amwvaAk9p8=;
        b=YAdQE7jRIUBFXJk4HjuKK6/OXKqnJPZC0DAOItLemGUN/+ZzGrkdmgq6IHYnJ6j1LK
         WLbnI9FQtk19sBzcJjSO9UuvMFV9YcVatE50DdkFFgRg/lLP2f84Biq0pClvAc0hZefB
         a3mJq1LQmkORP2n/pGBD/PJL/1JTdzag3ZWPPdf9JKgUhQbLgavb8cK/uCSC1S7rPk7/
         8/8GEtGGpu3QPQv1wFs9r0NvqSlhUouB7vOTM1DPwarnx7RgZoKX/T/hXkwBVa8RSUfZ
         aeT8isB2Ue3BhnzYCB4K7r14VNVs+eHKgeaLV9zwYOfYp+ICH3SP1gff6bio21PReiIh
         ACjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785946315; x=1786551115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kolcK42TrMzxGiVKCT6CZlZE37gCSGJD0amwvaAk9p8=;
        b=Fx2ZHmLpokKKAkdRMsLMoHpBjB5EZAPB9wdr2igaNH4spRVUoKA6q32GS0fSDMJysa
         fFPn9bBXoOYxlKEU0j1LsiRauFMTQa7S/KHe/3R5bxndSACGPd6Ein51eUdVgnRo078X
         PQgupdYhZSU5CpacYSZHzBlbHE9ZAvbNRP75dwkSMhjW6U7zQ3bGRMMfNV62UTtuu7It
         11kuyBd2f0Pf9AS03QjlkC/8rqtxL20t7SIQR2UZXG3fIVhKu8dtIKoeM6nChrXWq8bU
         UX6j3q2Zv08VchP+/Z4yWgn5BMQh2QINVioTvqIg2mM6PjajEsJSvDKdfucgLlG9oGjp
         OXSw==
X-Forwarded-Encrypted: i=1; AHgh+RpvosI9rsEsOkq9pFhoz7YchoN2fnVsLfWXTFKNIDemq19nbwAHf4gY2sPHi1IM7sfkDtGEmb/lytjH5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx01RiuA01wArUaXCTCdvSXBPqKVPaGjLaphR7WbsGiXQAcokm3
	CpV5xwIiVKHlILMUMK11/s/4exPCsWIDCxM0NxYDOYGoPUQXhOmync6Ngq2v+W7RsGw=
X-Gm-Gg: AR+sD11+Vu1HX54Cyg9U6wHXH9+LOHcka5NMvXSxYW4qBzfGh7s+nXzzadVQXhHWMiX
	S/RXdOov0MtWnkEUiY+qhKTVmZtoI+XUfVoKUIYHyJeZdVcNwdPALTMPPKrsAegORn6m1dhogbH
	kbolSrtTpI5e7WwzikGkx1aeFN+Vn5faC14W4x73C8StTQ2viKOgsA/k06qDV+N+mjiNnIoIGeC
	9sM2M0nbjDnWbpMasgVdcrNnBKbFhc8tKwRp7cYOS2e98kespeRpmbCZFz2WFesbcnKjaBu2wjL
	XjCx9BMkOm2ZWXiOCmDoj1u1YuFHJWoRZWSmZwliFBLSdKIWcAcJq4NPBBuVgz0EJGwCqCQettY
	wR96rcgFYAORTCU4tcBkR67YNCt9uvyCUl9CFX3CRKjzKHct2JwxWfbul5OKIBurWeJf53nfzZ/
	mRpApOcKloqCx4d22JiSao5tp2PhR7YfKFU2rcsrewTdd+XMlVHJ09pFQxq1EwpVTX+B/XtDSzb
	uPQFREV3Bi0IFfQARFkYcRQvJ3SITmGcok8l5aP
X-Received: by 2002:a05:6000:2995:20b0:47f:c648:e265 with SMTP id ffacd0b85a97d-47fec51960cmr12093963f8f.17.1785946314940;
        Wed, 05 Aug 2026 09:11:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47febfda0cbsm9802575f8f.6.2026.08.05.09.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:11:54 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 05 Aug 2026 17:09:17 +0100
Subject: [PATCH RFC 2/4] media: i2c: imx678: Parameterise the configuration
 to allow for other models
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-media-starvis2-v1-2-91e8e4eae44f@raspberrypi.com>
References: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com>
In-Reply-To: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Several of the Sony Starvis 2 sensors are identical in the
majority of their programming, but differ largely only in the
size of pixel array and some timing parameters.

Parameterise those parameters in preparation for supporting other
variants.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx678.c | 161 +++++++++++++++++++++++++++++----------------
 1 file changed, 106 insertions(+), 55 deletions(-)

diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
index f7b988dca2ac..40ba6661b366 100644
--- a/drivers/media/i2c/imx678.c
+++ b/drivers/media/i2c/imx678.c
@@ -148,32 +148,11 @@
 /* Subdev pads */
 #define IMX678_SOURCE_PAD		0
 
-/* IMX678 native and active pixel array size. */
-static const struct v4l2_rect imx678_native_area = {
-	.top = 0,
-	.left = 0,
-	.width = 3857,
-	.height = 2201,
-};
-
-static const struct v4l2_rect imx678_active_area = {
-	.top = 20,
-	.left = 0,
-	.width = 3856,
-	.height = 2180,
-};
-
 enum imx678_type {
 	IMX678_COLOR = 0,
 	IMX678_MONOCHROME = 1,
 };
 
-struct imx678_model_info {
-	enum imx678_type type;
-	const u32 *codes;
-	unsigned int num_codes;
-};
-
 enum imx678_lanemode {
 	IMX678_LANEMODE_2L = 1,
 	IMX678_LANEMODE_4L = 3,
@@ -213,7 +192,7 @@ static const u64 link_freqs[] = {
 	[IMX678_LINK_FREQ_1188MHZ] = 1188000000,
 };
 
-static const u16 min_hmax_4lane[] = {
+static const u16 imx678_min_hmax_4lane[] = {
 	[IMX678_LINK_FREQ_297MHZ] = 1584,
 	[IMX678_LINK_FREQ_360MHZ] = 1320,
 	[IMX678_LINK_FREQ_445MHZ] = 1100,
@@ -273,7 +252,7 @@ static const int imx678_tpg_val[] = {
 };
 
 /* Common configuration */
-static const struct cci_reg_sequence common_regs[] = {
+static const struct cci_reg_sequence imx678_common_regs[] = {
 	{ IMX678_REG_THIN_V_EN, 0x00 },
 	{ IMX678_REG_VCMODE, 0x01 },
 	{ CCI_REG8(0x306b), 0x00 },
@@ -656,16 +635,72 @@ static const u32 codes_monochrome[] = {
 	MEDIA_BUS_FMT_Y12_1X12,
 };
 
+struct imx678_variant {
+	const char *name;
+	u32 id_reg;
+	u32 id_value;
+	struct v4l2_rect native_area;
+	struct v4l2_rect active_area;
+	u64 pixel_rate;
+	unsigned int pix_per_clk;
+	const struct cci_reg_sequence *common_regs;
+	unsigned int num_common_regs;
+	unsigned int vmax_default;
+	const u16 *hmax_min;
+};
+
+const struct imx678_variant imx678_variant_def = {
+	.name = "imx678",
+	.id_reg = IMX678_REG_MODULE_ID,
+	.id_value = IMX678_ID,
+	.native_area = {
+		.top = 0,
+		.left = 0,
+		.width = 3857,
+		.height = 2201,
+	},
+	.active_area = {
+		.top = 20,
+		.left = 0,
+		.width = 3856,
+		.height = 2180,
+	},
+	.pixel_rate = IMX678_PIXEL_RATE,
+	.pix_per_clk = IMX678_PIX_PER_CLK,
+	.common_regs = imx678_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx678_common_regs),
+	.vmax_default = IMX678_VMAX_DEFAULT,
+	.hmax_min = imx678_min_hmax_4lane,
+};
+
+struct imx678_model_info {
+	enum imx678_type type;
+	const u32 *codes;
+	unsigned int num_codes;
+	const struct imx678_variant *variant;
+
+	const struct imx678_model_info *auto_detect_colour;
+	const struct imx678_model_info *auto_detect_mono;
+};
+
 static const struct imx678_model_info imx678_aaqr_info = {
 	.type = IMX678_COLOR,
 	.codes = codes_bayer,
 	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx678_variant_def,
 };
 
 static const struct imx678_model_info imx678_aamr_info = {
 	.type = IMX678_MONOCHROME,
 	.codes = codes_monochrome,
 	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx678_variant_def,
+};
+
+static const struct imx678_model_info imx678_autodetect_info = {
+	.variant = &imx678_variant_def,
+	.auto_detect_colour = &imx678_aaqr_info,
+	.auto_detect_mono = &imx678_aamr_info,
 };
 
 static const char * const imx678_supply_name[] = {
@@ -680,6 +715,7 @@ struct imx678 {
 	struct regmap *cci;
 
 	const struct imx678_model_info *info;
+	const struct imx678_variant *variant;
 
 	struct clk *xclk;
 	u32 xclk_freq;
@@ -774,7 +810,7 @@ static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(imx678->cci, IMX678_REG_GAIN, ctrl->val, &ret);
 		break;
 	case V4L2_CID_HBLANK: {
-		u32 hmax = (format->width + ctrl->val) / IMX678_PIX_PER_CLK;
+		u32 hmax = (format->width + ctrl->val) / imx678->variant->pix_per_clk;
 
 		cci_write(imx678->cci, IMX678_REG_HMAX, hmax, &ret);
 		break;
@@ -852,18 +888,20 @@ static int imx678_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
+	struct imx678 *imx678 = to_imx678(sd);
+
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
 		sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
 		return 0;
 
 	case V4L2_SEL_TGT_NATIVE_SIZE:
-		sel->r = imx678_native_area;
+		sel->r = imx678->variant->native_area;
 		return 0;
 
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		sel->r = imx678_active_area;
+		sel->r = imx678->variant->active_area;
 		return 0;
 	}
 
@@ -878,12 +916,12 @@ static int imx678_init_state(struct v4l2_subdev *sd,
 	struct v4l2_rect *crop;
 
 	crop = v4l2_subdev_state_get_crop(state, IMX678_SOURCE_PAD);
-	*crop = imx678_active_area;
+	*crop = imx678->variant->active_area;
 
 	format = v4l2_subdev_state_get_format(state, IMX678_SOURCE_PAD);
 	format->code = imx678_default_mbus_code(imx678);
-	format->width = imx678_active_area.width;
-	format->height = imx678_active_area.height;
+	format->width = imx678->variant->active_area.width;
+	format->height = imx678->variant->active_area.height;
 	format->field = V4L2_FIELD_NONE;
 	format->colorspace = V4L2_COLORSPACE_RAW;
 	format->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
@@ -897,8 +935,8 @@ static int imx678_write_common(struct imx678 *imx678)
 {
 	int ret = 0;
 
-	cci_multi_reg_write(imx678->cci, common_regs, ARRAY_SIZE(common_regs),
-			    &ret);
+	cci_multi_reg_write(imx678->cci, imx678->variant->common_regs,
+			    imx678->variant->num_common_regs, &ret);
 
 	cci_write(imx678->cci, IMX678_REG_INCK_SEL, imx678->inck_sel_val, &ret);
 	cci_write(imx678->cci, IMX678_REG_DATARATE_SEL,
@@ -919,10 +957,10 @@ static int imx678_program_window(struct imx678 *imx678,
 	cci_write(imx678->cci, IMX678_REG_ADDMODE, 0x00, &ret);
 	cci_write(imx678->cci, IMX678_REG_WINMODE, 0x04, &ret);
 	cci_write(imx678->cci, IMX678_REG_PIX_HST,
-		  crop->left - imx678_active_area.left, &ret);
+		  crop->left - imx678->variant->active_area.left, &ret);
 	cci_write(imx678->cci, IMX678_REG_PIX_HWIDTH, crop->width, &ret);
 	cci_write(imx678->cci, IMX678_REG_PIX_VST,
-		  crop->top - imx678_active_area.top, &ret);
+		  crop->top - imx678->variant->active_area.top, &ret);
 	cci_write(imx678->cci, IMX678_REG_PIX_VWIDTH, crop->height, &ret);
 	cci_write(imx678->cci, IMX678_REG_ADBIT, 0x01, &ret);
 
@@ -1027,11 +1065,13 @@ static int imx678_power_on(struct device *dev)
 
 	fsleep(20); /* T4 > 20us */
 
-	ret = imx678_write_common(imx678);
-	if (ret) {
-		dev_err(&client->dev, "%s failed to write registers\n",
-			__func__);
-		goto clk_off;
+	if (imx678->variant) {
+		ret = imx678_write_common(imx678);
+		if (ret) {
+			dev_err(&client->dev, "%s failed to write registers\n",
+				__func__);
+			goto clk_off;
+		}
 	}
 
 	return 0;
@@ -1065,11 +1105,16 @@ static int imx678_identify_model(struct imx678 *imx678)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&imx678->sd);
 	const struct imx678_model_info *info;
+	const struct imx678_variant *variant;
 	enum imx678_type detected;
 	int ret = 0;
 	u64 val = 0;
 
 	info = device_get_match_data(&client->dev);
+	if (!info)
+		return -EINVAL;
+
+	variant = info->variant;
 
 	/*
 	 * This sensor's ID registers become accessible 80ms after coming out
@@ -1078,7 +1123,7 @@ static int imx678_identify_model(struct imx678 *imx678)
 	cci_write(imx678->cci, IMX678_REG_MODE_SELECT, 0, &ret);
 	fsleep(IMX678_MODULE_ID_DELAY);
 
-	cci_read(imx678->cci, IMX678_REG_MODULE_ID, &val, &ret);
+	cci_read(imx678->cci, variant->id_reg, &val, &ret);
 
 	if (ret) {
 		dev_err(&client->dev,
@@ -1086,9 +1131,9 @@ static int imx678_identify_model(struct imx678 *imx678)
 		return ret;
 	}
 
-	if (val != IMX678_ID) {
-		dev_err(&client->dev,
-			"Chip ID mismatch: %x!=%llx\n", IMX678_ID, val);
+	if (val != variant->id_value) {
+		dev_err(&client->dev, "Chip ID mismatch: %x!=%llx\n",
+			variant->id_value, val);
 		return -ENXIO;
 	}
 
@@ -1103,7 +1148,7 @@ static int imx678_identify_model(struct imx678 *imx678)
 	detected = val & IMX678_TYPE;
 
 	/* Prefer to use sensor type specified in device tree */
-	if (info) {
+	if (info->codes) {
 		imx678->info = info;
 		if (detected != info->type)
 			dev_err(&client->dev,
@@ -1112,12 +1157,14 @@ static int imx678_identify_model(struct imx678 *imx678)
 				info->type == IMX678_COLOR ? "color" : "mono");
 	} else {
 		imx678->info = detected == IMX678_MONOCHROME ?
-			       &imx678_aamr_info : &imx678_aaqr_info;
+			       info->auto_detect_mono : info->auto_detect_colour;
 		dev_info(&client->dev,
 			 "sensor type missing in DT; detected %s sensor\n",
 			 detected == IMX678_MONOCHROME ? "mono" : "color");
 	}
 
+	imx678->variant = imx678->info->variant;
+
 	return 0;
 }
 
@@ -1147,7 +1194,7 @@ static const struct v4l2_subdev_internal_ops imx678_internal_ops = {
 static int imx678_init_controls(struct imx678 *imx678)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
-	const u32 hmax_4lane = min_hmax_4lane[__ffs(imx678->link_freq_bitmap)];
+	const u32 hmax_4lane = imx678->variant->hmax_min[__ffs(imx678->link_freq_bitmap)];
 	const u32 lane_scale = imx678->lane_mode == IMX678_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&imx678->sd);
 	struct v4l2_fwnode_device_properties props;
@@ -1165,13 +1212,14 @@ static int imx678_init_controls(struct imx678 *imx678)
 	if (ret)
 		return ret;
 
-	imx678->vmax = IMX678_VMAX_DEFAULT;
+	imx678->vmax = imx678->variant->vmax_default;
 	hmax = hmax_4lane * lane_scale;
 
 	/* PIXEL_RATE is fixed and read-only */
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops, V4L2_CID_PIXEL_RATE,
-			  IMX678_PIXEL_RATE, IMX678_PIXEL_RATE, 1,
-			  IMX678_PIXEL_RATE);
+			  imx678->variant->pixel_rate,
+			  imx678->variant->pixel_rate, 1,
+			  imx678->variant->pixel_rate);
 
 	/* LINK_FREQ is also read only */
 	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx678_ctrl_ops,
@@ -1183,15 +1231,16 @@ static int imx678_init_controls(struct imx678 *imx678)
 	if (link_freq)
 		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	vblank = imx678->vmax - imx678_active_area.height;
-	max_vblank = IMX678_VMAX_MAX - imx678_active_area.height;
+	vblank = imx678->vmax - imx678->variant->active_area.height;
+	max_vblank = IMX678_VMAX_MAX - imx678->variant->active_area.height;
 	imx678->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops,
 					   V4L2_CID_VBLANK, vblank, max_vblank,
 					   2, vblank);
 
-	hblank = hmax * IMX678_PIX_PER_CLK - imx678_active_area.width;
-	max_hblank = IMX678_HMAX_MAX * IMX678_PIX_PER_CLK -
-		     imx678_active_area.width;
+	hblank = hmax * imx678->variant->pix_per_clk -
+					imx678->variant->active_area.width;
+	max_hblank = IMX678_HMAX_MAX * imx678->variant->pix_per_clk -
+		     imx678->variant->active_area.width;
 	imx678->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops,
 					   V4L2_CID_HBLANK, hblank, max_hblank,
 					   IMX678_PIX_PER_CLK, hblank);
@@ -1335,11 +1384,13 @@ static int imx678_probe(struct i2c_client *client)
 	ret = imx678_power_on(dev);
 	if (ret)
 		return ret;
-
 	ret = imx678_identify_model(imx678);
 	if (ret)
 		goto error_power_off;
 
+	v4l2_i2c_subdev_set_name(&imx678->sd, client,
+				 imx678->variant->name, NULL);
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
@@ -1420,7 +1471,7 @@ static const struct of_device_id imx678_of_match[] = {
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
 	/* for non-conforming DTs that rely on runtime check */
-	{ .compatible = "sony,imx678" },
+	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
 	{ /* sentinel */ }
 };
 

-- 
2.34.1

