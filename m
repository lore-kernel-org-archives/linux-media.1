Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D60542ED0
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 15:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079892; cv=none; b=CG5elo8R1zjDh30lGXoCXeUy1lHswmn/zbPmIM1myMnsm9YXLXluMkLwUDSwwUW8uY5Ik2rJQUxb1WtsDLqBa97n0noco5gnKlJQpB5UIGkmR9CqqtlqZPzgNTSK8vrs3QFQczIOMjS2IasBzArDnJTLqSEwHEo5rCjfQ05fAsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079892; c=relaxed/simple;
	bh=yUgE5Hb1Y40Z0ueWq51DnPKKmsPDqDf36Bvinlhnd64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hThskRdh9LEKbGfmDD6UJmUQh+wRYnHAZj4DcVtJrhwgjGdYn66sNqaVNXQ9uc9yflCfjQEr9KkH0vo23KcOup0ExMvdzqVleDrXVPGDYOV/pHQxOSJmG+jdP4p3MiR/aNlyc/dBCZ4fjdaxUfw1uDUWSjqFiv5lnCcAaWMHysw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=q61CLQC8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="q61CLQC8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afe75f055so602123f8f.2
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079868; x=1792684668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sHoFZ1i0WjX0t3uOtKZbpZede/LtCPkHLckxHmiivaM=;
        b=q61CLQC8jn/xAXA11+EiDGXd9qB22zVuwZZxpLuAl5giJyyzW9ep8L/L7fWCMV15z2
         04D4htx7wHF7vRX9scy+l4I1JKI0R6sJPFJ93WTCpasP2q4mjaTONgFNwmfdi+LMoVRY
         cUDI9c/87W9It4HS4B17L3WWFMUUBmPUv+Rl1109DQTM4dfTvKzbsrK05Lqs1AjnZnFW
         n75EeaOfrJ2Benqe19lL/alUH593FPDU/kq5Aw8XMLHr6pZDtCaRNaSJILOtPUEfUWw0
         9Ru0UZxy7e3HMUardr69xd22qA0PgwLofZ1sUZ1mrCiLwdBmLzx8fgiLTMIQFZSV8LbN
         4deA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079868; x=1792684668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHoFZ1i0WjX0t3uOtKZbpZede/LtCPkHLckxHmiivaM=;
        b=0ooRvFCWvfNzEzhCj5IiEKztnyt+2o45LUuP/0W4Fyzud3R2WmSGNbYjmFSyrSJJIz
         xHS1KS8Y09FoNhJa0HKl6h+JUNV4jNb09EG9wGAU0/B6mYo4KCFNv5AOsqa80mhUmnJN
         aIPHfRbnfb+3Ny5nZj6EevIEV3lMr3jYfxj6zLQCDW60u/t9eYGX2mY6e/M5949DIbyp
         Ws/Km7mZEfNoN2+CI8Yt04urf6eq/SVv2OxNSIppLd9B0i9SJZKMWx0rdKvZidvIAmUO
         ReDGB/2pl3I0BleZyBbpXrO4dSbI3iLoBA5RsbLNqDxo4IZhn2kziAFBu+jf6pWVIvra
         CpxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJs0zTAU+77q76IoRG/jxR3cFkazevmrPGvT/WIna4ZQhK6sdb747S/kLwexhFyQYcN5r8n8V5NzkuyQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6juHfEBgFHEnYAKcJBNWaxfTjwg51aaITBgjefO0IW6DiX1WY
	scKv/Ie+3ppFXc1ykZFp2X/pNSsEAqwiEEB227l6MmMEjdVt/Z9eOspVFpoVHLzZulE=
X-Gm-Gg: AYBFou15LU3K589+eqrIBpo8hs7fsuawPjR43l5LWfrDZJy5a2Q0dRQ8y9QLb3RKp9f
	uHQKQG7okqjAtxKpplhVoCEoQDcGWKk1YEWZ/vZOrtz/5XpxPJBGPdU9JwEg75LY4LuCOgXdXII
	VNTe8MKnzbeXI396C8lucWvjinHThTfcs/RnyVgdjToBUDMeR3QKXaFYCDfQdkJzll151TfI3Mn
	9EXUSzx2iStQiHBqXVh1kq/0txI21BCer6bo842meGASpWPEhL87rieHmYwtwSrynQEQ+Wvfbgw
	FM7YQzRKC3GCi49y8B9m8GNNfJskDEvVG+5io6TbwwYSyBJBTziEmipUglo1Zy1PZG2JjeAj0K0
	5vBYnJCotzyGAhdEpSW9CLBHbUmfccVjQ2yqmvfId4Zr98dFidvfuG6i0Tn1INA+RmlVp7+0ofy
	SC1MldYAfkFpOtq1DRTe9uMJX4naOW5I8Gl8woV6GxAziZ4RmTwhLsRxHue9pRS+UT+IkNq9uom
	OfPBP3eTLwemufdLraO7Yq+luKmbe4GcghGQsxwehkjmR2JKQ==
X-Received: by 2002:a05:6000:4b0b:b0:48a:fdde:5241 with SMTP id ffacd0b85a97d-48dbaaef91emr39129887f8f.31.1792079868156;
        Thu, 15 Oct 2026 08:57:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:47 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:37 +0100
Subject: [PATCH v4 11/16] media: sony-starvis2: Add support for IMX662
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-11-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
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

IMX662 is a 1080p Starvis 2 sensor that follows the same programming
pattern as IMX678, so add it to the newly parameterised common
driver.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 155 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index dce150304dc6..56e657748252 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -8,6 +8,8 @@
  * Currently supported are:
  * IMX678: Diagonal 8.86 mm (Type 1/1.8) CMOS image sensor with 8.40 M effective
  *         pixels.
+ * IMX662: Diagonal 6.45mm (Type 1/2.8) CMOS image sensor with 2.12 M effective
+ *         pixels.
  *
  * Copyright (C) 2026 Ideas On Board Oy.
  *
@@ -661,6 +663,136 @@ static const struct starvis2_variant imx678_variant_def = {
 	.hmax_min_pixel_array = 550,
 };
 
+static const struct cci_reg_sequence imx662_common_regs[] = {
+	{ CCI_REG8(0x3444), 0xac },
+	{ CCI_REG8(0x3492), 0x08 },
+	{ CCI_REG8(0x3b00), 0x39 },
+	{ CCI_REG8(0x3b23), 0x2d },
+	{ CCI_REG8(0x3b45), 0x04 },
+	{ CCI_REG8(0x3c0a), 0x1f },
+	{ CCI_REG8(0x3c0b), 0x1e },
+	{ CCI_REG8(0x3c38), 0x21 },
+	{ CCI_REG8(0x3c44), 0x00 },
+	{ CCI_REG8(0x3cb6), 0xd8 },
+	{ CCI_REG8(0x3cc4), 0xda },
+	{ CCI_REG8(0x3e24), 0x79 },
+	{ CCI_REG8(0x3e2c), 0x15 },
+	{ CCI_REG8(0x3edc), 0x2d },
+	{ CCI_REG8(0x4498), 0x05 },
+	{ CCI_REG8(0x449c), 0x19 },
+	{ CCI_REG8(0x449d), 0x00 },
+	{ CCI_REG8(0x449e), 0x32 },
+	{ CCI_REG8(0x449f), 0x01 },
+	{ CCI_REG8(0x44a0), 0x92 },
+	{ CCI_REG8(0x44a2), 0x91 },
+	{ CCI_REG8(0x44a4), 0x8c },
+	{ CCI_REG8(0x44a6), 0x87 },
+	{ CCI_REG8(0x44a8), 0x82 },
+	{ CCI_REG8(0x44aa), 0x78 },
+	{ CCI_REG8(0x44ac), 0x6e },
+	{ CCI_REG8(0x44ae), 0x69 },
+	{ CCI_REG8(0x44b0), 0x92 },
+	{ CCI_REG8(0x44b2), 0x91 },
+	{ CCI_REG8(0x44b4), 0x8c },
+	{ CCI_REG8(0x44b6), 0x87 },
+	{ CCI_REG8(0x44b8), 0x82 },
+	{ CCI_REG8(0x44ba), 0x78 },
+	{ CCI_REG8(0x44bc), 0x6e },
+	{ CCI_REG8(0x44be), 0x69 },
+	{ CCI_REG8(0x44c0), 0x7f },
+	{ CCI_REG8(0x44c1), 0x01 },
+	{ CCI_REG8(0x44c2), 0x7f },
+	{ CCI_REG8(0x44c3), 0x01 },
+	{ CCI_REG8(0x44c4), 0x7a },
+	{ CCI_REG8(0x44c5), 0x01 },
+	{ CCI_REG8(0x44c6), 0x7a },
+	{ CCI_REG8(0x44c7), 0x01 },
+	{ CCI_REG8(0x44c8), 0x70 },
+	{ CCI_REG8(0x44c9), 0x01 },
+	{ CCI_REG8(0x44ca), 0x6b },
+	{ CCI_REG8(0x44cb), 0x01 },
+	{ CCI_REG8(0x44cc), 0x6b },
+	{ CCI_REG8(0x44cd), 0x01 },
+	{ CCI_REG8(0x44ce), 0x5c },
+	{ CCI_REG8(0x44cf), 0x01 },
+	{ CCI_REG8(0x44d0), 0x7f },
+	{ CCI_REG8(0x44d1), 0x01 },
+	{ CCI_REG8(0x44d2), 0x7f },
+	{ CCI_REG8(0x44d3), 0x01 },
+	{ CCI_REG8(0x44d4), 0x7a },
+	{ CCI_REG8(0x44d5), 0x01 },
+	{ CCI_REG8(0x44d6), 0x7a },
+	{ CCI_REG8(0x44d7), 0x01 },
+	{ CCI_REG8(0x44d8), 0x70 },
+	{ CCI_REG8(0x44d9), 0x01 },
+	{ CCI_REG8(0x44da), 0x6b },
+	{ CCI_REG8(0x44db), 0x01 },
+	{ CCI_REG8(0x44dc), 0x6b },
+	{ CCI_REG8(0x44dd), 0x01 },
+	{ CCI_REG8(0x44de), 0x5c },
+	{ CCI_REG8(0x44df), 0x01 },
+	{ CCI_REG8(0x4534), 0x1c },
+	{ CCI_REG8(0x4535), 0x03 },
+	{ CCI_REG8(0x4538), 0x1c },
+	{ CCI_REG8(0x4539), 0x1c },
+	{ CCI_REG8(0x453a), 0x1c },
+	{ CCI_REG8(0x453b), 0x1c },
+	{ CCI_REG8(0x453c), 0x1c },
+	{ CCI_REG8(0x453d), 0x1c },
+	{ CCI_REG8(0x453e), 0x1c },
+	{ CCI_REG8(0x453f), 0x1c },
+	{ CCI_REG8(0x4540), 0x1c },
+	{ CCI_REG8(0x4541), 0x03 },
+	{ CCI_REG8(0x4542), 0x03 },
+	{ CCI_REG8(0x4543), 0x03 },
+	{ CCI_REG8(0x4544), 0x03 },
+	{ CCI_REG8(0x4545), 0x03 },
+	{ CCI_REG8(0x4546), 0x03 },
+	{ CCI_REG8(0x4547), 0x03 },
+	{ CCI_REG8(0x4548), 0x03 },
+	{ CCI_REG8(0x4549), 0x03 },
+	{ STARVIS2_REG_WDMODE, 0x00 },
+	{ STARVIS2_REG_MDBIT, 0x01 },
+	{ STARVIS2_REG_XXS_DRV, 0x00 },
+};
+
+static const u16 imx662_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ] = 1980,
+	[STARVIS2_LINK_FREQ_360MHZ] = 1980,
+	[STARVIS2_LINK_FREQ_445MHZ] = 1188,
+	[STARVIS2_LINK_FREQ_594MHZ] = 990,
+	[STARVIS2_LINK_FREQ_720MHZ] = 990,
+	[STARVIS2_LINK_FREQ_891MHZ] = 990,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 990,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 990,
+};
+
+static const struct starvis2_variant imx662_variant_def = {
+	.name = "imx662",
+	.id_reg = CCI_REG16_LE(0x4d1c),
+	.id_mask = 0x3ff,
+	.id_value = 0x296,
+	.native_area = {
+		.top = 0,
+		.left = 0,
+		.width = 1937,
+		.height = 1101,
+	},
+	.active_area = {
+		.top = 0,
+		.left = 0,
+		.width = 1936,
+		.height = 1096,
+	},
+	.pixel_rate = 222750000,
+	.pix_per_clk = 3,
+	.common_regs = imx662_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx662_common_regs),
+	.vmax_default = 1136,
+	.hmax_min_link_freq = imx662_min_hmax_2lane,
+	.hmax_min_pixel_array = 990,
+};
+
 struct starvis2_model_info {
 	enum starvis2_type type;
 	const u32 *codes;
@@ -691,6 +823,26 @@ static const struct starvis2_model_info imx678_autodetect_info = {
 	.auto_detect_mono = &imx678_aamr_info,
 };
 
+static const struct starvis2_model_info imx662_aaqr_info = {
+	.type = STARVIS2_COLOR,
+	.codes = codes_bayer,
+	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx662_variant_def,
+};
+
+static const struct starvis2_model_info imx662_aamr_info = {
+	.type = STARVIS2_MONOCHROME,
+	.codes = codes_monochrome,
+	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx662_variant_def,
+};
+
+static const struct starvis2_model_info imx662_autodetect_info = {
+	.variant = &imx662_variant_def,
+	.auto_detect_colour = &imx662_aaqr_info,
+	.auto_detect_mono = &imx662_aamr_info,
+};
+
 static const char * const starvis2_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
@@ -1527,9 +1679,12 @@ static const struct dev_pm_ops starvis2_pm_ops = {
 };
 
 static const struct of_device_id starvis2_of_match[] = {
+	{ .compatible = "sony,imx662-aamr", .data = &imx662_aamr_info },
+	{ .compatible = "sony,imx662-aaqr", .data = &imx662_aaqr_info },
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
 	/* for non-conforming DTs that rely on runtime check */
+	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
 	{ /* sentinel */ }
 };

-- 
2.34.1

