Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3890A481A91
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 16:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946322; cv=none; b=bbfhW1jkbiK8kjJu2O+kv6moz0QJVm9MiwbcW8ZB/7YoxAtrB0xQbjCn/3CAls3ECzxO7pWQxkIm5xva7wLdWvi76iCz3us6c8qmdzsZEiq8VmnTFlvTPckI9UIkr0UYxUh21V1wTJDRfopGsmaCOVZaBsZrnWjVPYYSjbm7YdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946322; c=relaxed/simple;
	bh=kq6UPYxJnKt1KsMEi+elORd7jcNTRJU7IYK+5lILbYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BffZBMgJS8H5W1ULVZaH+kLZ5RmpnhUH79YTZF/6gy64nlCmiAsgVgjkOrvvlr/L4pO3TOX/R+pSSj4kd5+k7UYoTtO05Gigwaqj2jzxSuVubVfsJpr+aW9H+eHRnvPLuJw0BCaSB7EKdfY8v3CS09s0fbXZYYC7Jrvu/YEMx9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=n9/2uV+M; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="n9/2uV+M"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47fe89fb333so721810f8f.3
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1785946316; x=1786551116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ems9IaHYt2ebi/BADr6sqNPXhUyM5/Ruyeb7hHdsh7w=;
        b=n9/2uV+MjdA7dlfl7JD2mEhmH/Mmxd5rzHkOsyL5DrbFoNj1I4el9rgYioq6YDfLaG
         h6IEdHRTiA7hMlQmnXZvdntYImO3furmnijBmd1mFahX10iyuaJgxPqRfEnw+zkrnjgS
         Yt0WM17Qom2dHI5F7jO2vOj7dxc58JN4giN1nkTQcKn4bLJgjphrVcr+4MHOC3oo6+Mn
         yuAqi6My2dnFZ/Tn4OImkzivrAiqpVzfu9ANyh/i9wKm3ibrIAs97GiR05EbzIj9rTyV
         mx1L/0bWab+nInWSUmgXnTZq4JktG+xwKL5t0PrtwBbDdsv8dxAmABV2VvJNmjZySVv7
         dSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785946316; x=1786551116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ems9IaHYt2ebi/BADr6sqNPXhUyM5/Ruyeb7hHdsh7w=;
        b=QEQj2m4IM9vWy4j1UYShSnKUV5NjN+MZpGSxTbWf3R3OmNrgEA0wQIqiyBLikQUwbA
         bEq8c8MK/NOjI8/MoXQBi7oZsUe43yDZ+SOGsNkYagYGaZIIoTO8ymo/fvlr6120oEis
         qBHbfIQ8zUdaiUjZwWSlO5i6Mq9/nrDaamiJ7k56KIdgSaA+6iZaKtwpAx0Rpc3YYgdn
         HXn8sPhqb3Yk5MaBTKfuHD5semQ6+JYCMX8N2I3Y0gXVHTmrXH2XAAfNwvV0Kkl0e+zp
         cYNqZRs3Zmte+3DzJ7z6aOBHSoC95E1IkGKgFniZKGKXS4BA1CV+ikWUvlX+QRwkEDZi
         rptQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEWuXuTR7k+0qyumKVj1cY3B/hZ8S8Hpsm3oEmfFrZ2ZYV+rS7klEpTiLQFqg8SXS+HSp48TUBTrb/6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6fXXZdisqn8W1w4itMGDxL9Exh8P1vYXAF1D08GXC0GOM8hbu
	FqYrLbFizkq2ZBiltZD+NyroFjjBonTMn3+7fWfnrKNRVMTiSKp/gYUrXTto3OjzYNA=
X-Gm-Gg: AR+sD12R/KDlxtUVuEK+s58EbBOHLMY1BOx1W2kke2SyA4VeFGwHm6dDcOdAOI0Yt6p
	jAsPCCSgd4dwXxifA6GINGln+AFdpI+2/bYS6373/ffJrrvIjH8+Yp8jhtJczxsfmaANY2O5HmU
	325IJVpvmyzuhqRlRnLIc0fxuwsMgIQtt6Tg2cFoIVXIjbM5hZNdEi1BGjssKhRaoF2uMr7VtR+
	U3B7dSSDJOxMyx7FaJcO8q6LiLt8Jg1HGxtnQPvS2E5q3/12bD7X34vV+mHGDxnhgg7DrnLEgmg
	HlWfi+MWY/IRn/XYI4nU91vv8LUhR5ce+b4Mxnw8Yv3RWJzfafeFAwMlq0O0uU+JVdnyA4KfPJk
	xlO5m3hZN5Vmv29GCRps74t5VBHD3PT3t5yhdFP8yhv+jBau8gRU86ohL5JeXrmKSv3voWS/zcX
	3PVpUT/xRh65oroAouhefRDjqbbEWXrojtzA1Rrr/riB3C6wpAThr6MtvP7zFbLJeB4jPFAq+36
	whjVAHNUSHAObhD5R4bWbpFC5CtYxa59OkqA7wu
X-Received: by 2002:adf:f311:0:b0:46e:7f72:b6fe with SMTP id ffacd0b85a97d-47fec523d07mr10569022f8f.19.1785946315912;
        Wed, 05 Aug 2026 09:11:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47febfda0cbsm9802575f8f.6.2026.08.05.09.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:11:55 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 05 Aug 2026 17:09:18 +0100
Subject: [PATCH RFC 3/4] media: i2c: imx678: Add imx662 support to the
 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-media-starvis2-v1-3-91e8e4eae44f@raspberrypi.com>
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

IMX662 is a 1080p Starvis 2 sensor that follows the same programming
pattern as IMX678, so add it to the newly parameterised driver.

FIXME: Update the common registers based on the Sony spreadsheet.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx678.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
index 40ba6661b366..9083f2744510 100644
--- a/drivers/media/i2c/imx678.c
+++ b/drivers/media/i2c/imx678.c
@@ -673,6 +673,47 @@ const struct imx678_variant imx678_variant_def = {
 	.hmax_min = imx678_min_hmax_4lane,
 };
 
+static const struct cci_reg_sequence imx662_common_regs[] = {
+	{ IMX678_REG_WDMODE, 0x00 },
+	{ IMX678_REG_MDBIT, 0x01 },
+	{ IMX678_REG_XXS_DRV, 0x00 },
+};
+
+static const u16 imx662_min_hmax_4lane[] = {
+	[IMX678_LINK_FREQ_297MHZ] = 990,
+	[IMX678_LINK_FREQ_360MHZ] = 990,
+	[IMX678_LINK_FREQ_445MHZ] = 990,
+	[IMX678_LINK_FREQ_594MHZ] = 990,
+	[IMX678_LINK_FREQ_720MHZ] = 990,
+	[IMX678_LINK_FREQ_891MHZ] = 990,
+	[IMX678_LINK_FREQ_1039MHZ] = 990,
+	[IMX678_LINK_FREQ_1188MHZ] = 990,
+};
+
+const struct imx678_variant imx662_variant_def = {
+	.name = "imx662",
+	.id_reg = IMX678_REG_MODULE_ID,
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
+	.vmax_default = 1096 + 40,
+	.hmax_min = imx662_min_hmax_4lane,
+};
+
 struct imx678_model_info {
 	enum imx678_type type;
 	const u32 *codes;
@@ -703,6 +744,26 @@ static const struct imx678_model_info imx678_autodetect_info = {
 	.auto_detect_mono = &imx678_aamr_info,
 };
 
+static const struct imx678_model_info imx662_aaqr_info = {
+	.type = IMX678_COLOR,
+	.codes = codes_bayer,
+	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx662_variant_def,
+};
+
+static const struct imx678_model_info imx662_aamr_info = {
+	.type = IMX678_MONOCHROME,
+	.codes = codes_monochrome,
+	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx662_variant_def,
+};
+
+static const struct imx678_model_info imx662_autodetect_info = {
+	.variant = &imx662_variant_def,
+	.auto_detect_colour = &imx662_aaqr_info,
+	.auto_detect_mono = &imx662_aamr_info,
+};
+
 static const char * const imx678_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
@@ -1470,8 +1531,11 @@ static const struct dev_pm_ops imx678_pm_ops = {
 static const struct of_device_id imx678_of_match[] = {
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

