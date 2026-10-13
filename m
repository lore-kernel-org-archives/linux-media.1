Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4924D528442
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 15:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904674; cv=none; b=bNMdLhzmFDDa0pMhBqmZfOjT9VcfPbYqTaeCmP0OkYRVHkxMPK8wMkOLVmsBDUtH8/VbzxRGo6r+p1ISBxqOuIF+K6fRmPRyxJegXUr3eYgfcyQIq8yzaHzxwjVvcIjPDxH9yqCM40IbwyYzx0xZ8bNNFFoV9Y1PsOqQQy1aDR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904674; c=relaxed/simple;
	bh=9rRYKRj2/3oiqVKntCOS0KpO0iisRDCs6KF85QVKzlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cJDZtoa0odvEiN35lmacZSgDmrKvbCipHP2I3/QR/CG1B5AhJuPQTV2VtMmjI3x+mW8SPdRpXT3gIMddZQ+R7GHX71343O0NIfce/l9Dvbhu0Ev5eXvxy4SiDYGMVz2h9sMD+aBlM0fLIDKh92qkp+zsH9zr/6oXLpudMmLnNro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=QTV4bsDw; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="QTV4bsDw"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c6f764f82so1048460f8f.0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904669; x=1792509469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3NIRA2+ZUxD/nO2oNuIKjVFVnbOxTNYUQUTvmxIHeM=;
        b=QTV4bsDwUG5xXUKUmGiU1SKDD+mF8R2caovI43TSQUVJR6fSx6sgpN+lpg4IqqSjcz
         MZdxlG1JxPDO087PrC06PsLd+TsKpVH1Fer/nbyj0/71Ry/ZoBVhEqjJ3FyYskV67JsO
         KRLGmTTJqhI3heKL/aqXkHRBvS+bC1eQI3wJZxhzgS4JcSjbEcZ2d6TSWh1QeusGwSgz
         j4HK8YnbkUpNmnasLSzbp+xkvMJDIqRmLvuk7Dzcg8QPf2iYm1UtfZBHosyonU4wvTo2
         4/l16Q3hnPkkvwPaEZBzW9ZsP3NkmBAJmYCBDRyBjsmFwLaF4kiAbwBrgh2JTGY3ahD9
         Efsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904669; x=1792509469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3NIRA2+ZUxD/nO2oNuIKjVFVnbOxTNYUQUTvmxIHeM=;
        b=gvBaLxvVN8uTqRlcKFF/y+rgUjCtHqzi9uynEatwwO7nyhP830B6d5tkPCMt4vYmc7
         6J9poJ56UWJM1ide1dREwJUIpsqpbwMcu3G8tWUDK/HRpWgxF868lhTLCOpgEf7b4ulG
         lDVhJAI9Hf8EKgGPHDY0RP8nw91/LUbiSmLOPKUu4ZRC17ZwUezZNpXDnXgbgajFnHkr
         G9/qjHiO+5OUel8grGk7q4EyZIbUP+5po8amIEoT7wZqQY53Q0q1iomJ9c7OS3b45D3a
         ePY/t7+ukI3hk7eCWXpUuzTnwlJcfXsWbS1anphErO8MBUhf/qG5afLtkcbwk6v+lr8E
         QO9w==
X-Forwarded-Encrypted: i=1; AKwUvBxLglXr1KTVf6k9Xqdi4yGDJuFKCgYLm78VmuOnXdPJZXMT5bIyzY2zN9FjeCrF3X4NzjbGVs+QRqNHuA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL/uAlKLQgr7DLvRl1O/JWKNMj0NYpfu04vkIO3z472R3GwAjyL
	PGb/jFuUCyRjSdYAsg2StY2aGqq8CnyL0pLNpE56wXpcqERyhpa31O3IDvFHoJ55dlU=
X-Gm-Gg: AYBFou2pvh91HXp25TNTpADzzFi0YK1SxF1we52iAnFncV7pUiwHdQMBy/bXfYZdxrw
	pisxWPCBFz/5Cle9L/lk1xlHxrsDids6yEA73KDNCPTBI84GFZ6foQ8JgcjTuf8aDsB2j0uEYo+
	4MkumxQePOYfEf1D+frg93Wf9qDj4XKx9WWYDDiPKq96FC7GIPNc8aWFsGztt9/De1lEJeAM/4P
	gH/pDbIjRlxauPheIpPTY6VF9Get0CGwT2gLw0YfGrxQCe9UnCtLmiWH3GxXd3coCVPjPMwS8XG
	2QdmbvqGwOop7H7ufn5h6AwU0cTDGxsggjMQbIxj3EiYOpH/5zIOjqqwdBtD+fxm77FHI8ErtWD
	zHRSMxCey1rt2nEe/xlohyVVAry7LgYhjwapKSjwJzCaKpKxyVOXFeFktXUxmVdUkQLOPKl15qt
	5qmq0yo9yfo1qIbqV2JC+bwExlk3oASCqHDQ2tJzE6G6wOom9OF/TMM3yiqcKaE3rKPwW/JEkSK
	ZpLKPd08qH3oPFYMBcM6EKUHDyHFapa489oMWvn+5GqOmn6aA==
X-Received: by 2002:a05:6000:2f85:b0:48b:e25:21d6 with SMTP id ffacd0b85a97d-48dbace1a16mr24271611f8f.41.1791904669288;
        Tue, 13 Oct 2026 08:17:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:48 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:08 +0100
Subject: [PATCH v2 09/13] media: sony-starvis2: Add support for IMX662
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-9-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
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
 drivers/media/i2c/sony-starvis2.c | 157 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 156 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 27287924915c..c2d4b0aab8c8 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -8,7 +8,9 @@
  * Currently supported are:
  * IMX678: Diagonal 8.86 mm (Type 1/1.8) CMOS image sensor with 8.40 M effective
  *         pixels.
- *
+ * IMX662: Diagonal 6.45mm (Type 1/2.8) CMOS image sensor with 2.12 M effective
+ *         pixels.
+
  * Copyright (C) 2026 Ideas On Board Oy.
  *
  * Based on Sony IMX678 driver prepared by Will Whang & Soho Enterprise Ltd.
@@ -661,6 +663,136 @@ const struct starvis2_variant imx678_variant_def = {
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
+const struct starvis2_variant imx662_variant_def = {
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
@@ -1499,8 +1651,11 @@ static const struct dev_pm_ops starvis2_pm_ops = {
 static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
+	{ .compatible = "sony,imx662-aamr", .data = &imx662_aamr_info },
+	{ .compatible = "sony,imx662-aaqr", .data = &imx662_aaqr_info },
 	/* for non-conforming DTs that rely on runtime check */
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
+	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
 	{ /* sentinel */ }
 };
 

-- 
2.34.1

