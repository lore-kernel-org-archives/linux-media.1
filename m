Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283533;
	b=NvzhU7/yYRMHBabiS3b/nBzdfbWNArfr8lMGff/iYz8FdGFWkilhu4IZj5R5XZrtt4tW
	 mEQZOug7VucJ1rchJm/cjWhYOOkeIIwfrfx35yAgOxfPlgUZnnLni0/+4dZdvgITRMLcZ
	 M0/Dgb45+GFanYLz+l44r6JcjxYHdkqmST3b1gdz9mvLvxGHEaJMSB5x7TZtj0nvdKixW
	 mgUmjov4RYply9gW3f8920u+uo+YQb9FTdKvGNitqQ00STM+XjEfPBCv+30llk1Rhnm5y
	 ixZYUJ6a1lCJvUYjfDEnmp2qStucJGu6qcBiXnygmT0wygqBPoECHiXLPxb8cGdZW+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
	b=gJSAj/NGbyL1Bh67kudLZjCTUE5KzRo5Rhof3x9zQJX8X7phrdUbIiFBGdQT1K/saHPY
	 Ydz/FH7hGsma5PekDxCMeJWyqw07ZtNJZY5YcNfvG2pUoCJd/OTrrWXejXeAegDUrT+gn
	 3E3N5pMCXI29uNp9Mq+5xo8Y0GIT92FOK5AHUgh5u6fOlFMbZn71PF3vxO5R8mg9OGS2U
	 ZzEqTjmv8KbLkNTwCStLmuCUdCGWAvV91TtinJ/Y9fFqpwMxDjdM9pJMMGMvTgA50v9B3
	 sfsJn2LdmKTOD1XW3DP3SLtUYq3oEklZMTLANhkEdLz+MZX+Nb0Xf2zZPgL1izSovug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=U5QvBAkE;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94214606B6E3
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94214606B6E3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=U5QvBAkE
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso18344745e9.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283531; x=1793888331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
        b=U5QvBAkEHFeQUPa7mIoJ2tnS6H21i5vNQxgO8zYKKVfldO/R91nnx+iWp9JSyyCKyx
         ecTBS9Cv71lLj6+LhcRXRxl9oX0DjbkhKXlHB9F0ub3fHm4gnC6RYPFiKV8iMnDS2C3S
         LW7SV+07GqOFJO3KDDxUYmvq7Uw4COs6QAyoyuBOCJ0McHy2Mq76Lo2NCAeeHOnJOCsz
         J3QPzatJ4AEUlj8Pg4VJVC3jcgI7E2ZQrKpLDYOdhw6Tb7n4wLHsYCXqwyCOaxQjW893
         pews9uL805MVBf2XwXt0cjC0Lx7NBZQVnhoQa2izCmbTsWXOWjuu4V4ifsDr2lpAITn1
         E3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283531; x=1793888331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
        b=Wx5hrXknrO+edddky8rR7s4FD3A4IIWu3TvXTivAZ6nQVOOuw0P6Jni+TVsB0OY91R
         pNdtrQyyIJ6SsvuCcFdH6CMOIoIiQzv8Czv4hPjyCY66F1PUv0ZnUG2q0iyR4lqcCVhm
         YAmgnmMj3AS6Ju109vMOzn014Txe2cIlLBl8BXDQtJcVXhXbqXzTDtpz+uE4SIBDf+PF
         MWdDHPL1PAdMXY+iVrptk5q0oXh8aDHzUdAJ9SEpi+Qd6KRttLeAAQv76MnmZx3aaaxg
         c4msmiu74mpQXJ5Pyq3kSnibta5p7YoJfm8Wqsi6tifVY7ZHjqkXZp7Qha2jNeHii8aa
         ukdw==
X-Forwarded-Encrypted: i=1; AKwUvBxpyJCo5K0vM/Za2ro3rpruUJ6SHgShw78eW3dwvNN435G+CwUVihPniM916N7kN9wUVSD1QM52dYhKIA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKou3KrszraPIDjK5eYJPnYbBq+Q/85cTQ2lvEUI9P6PlweVaOa
	lRiyWmp643nBnNMB/cgbjUYvZyzGHNnoqcJMtdj4MKDe65vzsTTZ4J2NF1X3F03AUlFU1rTvlpu
	Einep3CE=
X-Gm-Gg: AYBFou3iqMpYA/NDBoYwTiz6CsArPGNZ0PuuHVqmly8YjalNOfp+C+pfgZEVsnISyum
	7CoBwqwmt4Eo35dq1c9byikBBjk5vpxUm2UuFsyryhyS1q55oz8u3puC5LCt/aBHblkm0oUAqwf
	Z3vjpRXy7UosNIS9FVuv0fAtXRBBF7UfFHLFKhvudi9tXZURsKshWmU4I1wHdo7OPipkTNcTLCN
	ROcvnt0E/0eljs/sSSoFkN8A9HiOMCGMk6Wr35GoIDELe8H+xgEB1iVBHwIaptzFRbX9uyvRpH/
	g7GRwKi7Q7KAIGYQn91faD6m0DXGLvOl8L1gMQQ2ojUh/LS7nNTZ1CRsQN9cBdg8kE4lDWw90wG
	B3HwHtXtT5u76CZydf3mDEvmsCJn7kBU2pisrf1s3W5L6pcVUHGiV+Zjdh62lMTmWqPoD20vp/Z
	ufwB9QjvInXFOnUWc1+5yuxIzQGtkRxYXgOOQQaT6gX4DiwoncAF8LkEPePXxA4Pzd2/S3iofNL
	I+tuLB0r3hrgxb06rxMZKkyv0I63FKgTBm9X1fl5puqLs71sOuvx1jY/iCLchl1sD0bAiEfJJvA
	ZQ05UvfiACKXNNz1siUAAO9nzuk6csM6JA79NqpT24JaNggzVKA1lIreCiEQhib8wsaMWmlEetm
	d/Mmg
X-Received: by 2002:a05:600c:8b85:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4a966f220f2mr121003265e9.20.1793283530836;
        Thu, 29 Oct 2026 07:18:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:50 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:34 +0000
Subject: [PATCH v7 13/18] media: sony-starvis2: Add support for IMX832
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-media-starvis2-v7-13-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
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

IMX832 is replacing IMX662, and it follows the same pattern as all the
Starvis2 sensors.

Add the sensor specific configuration for it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 118 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index a4815a142c9d..645417cc08fb 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -12,6 +12,8 @@
  *         pixels.
  * IMX675: Diagonal 6.53mm (Type 1/2.8) CMOS image sensor with 5.12 M effective
  *         pixels.
+ * IMX832: Diagonal 6.45mm (Type 1/2.8) CMOS image sensor with 2.12 M effective
+ *         pixels.
  *
  * Copyright (C) 2026 Ideas On Board Oy.
  * Copyright (C) 2026 Raspberry Pi
@@ -984,6 +986,99 @@ static const struct starvis2_variant imx675_variant_def = {
 	.hmax_min_pixel_array = 528,
 };
 
+static const struct cci_reg_sequence imx832_common_regs[] = {
+	{ CCI_REG8(0x3460), 0x21 },
+	{ CCI_REG8(0x3a94), 0x75 },
+	{ CCI_REG8(0x3a96), 0x69 },
+	{ CCI_REG8(0x3a98), 0x1e },
+	{ CCI_REG8(0x3a9a), 0x1e },
+	{ CCI_REG8(0x3b58), 0xeb },
+	{ CCI_REG8(0x3b5c), 0xeb },
+	{ CCI_REG8(0x3b88), 0xeb },
+	{ CCI_REG8(0x3b8c), 0xeb },
+	{ CCI_REG8(0x3c40), 0x06 },
+	{ CCI_REG8(0x3cae), 0x79 },
+	{ CCI_REG8(0x3cbc), 0x7b },
+	{ CCI_REG8(0x4508), 0x00 },
+	{ CCI_REG8(0x4509), 0x02 },
+	{ CCI_REG8(0x450a), 0x41 },
+	{ CCI_REG8(0x450b), 0x03 },
+	{ CCI_REG8(0x4660), 0x12 },
+	{ CCI_REG8(0x4661), 0x00 },
+	{ CCI_REG8(0x4662), 0x29 },
+	{ CCI_REG8(0x4664), 0x12 },
+	{ CCI_REG8(0x4665), 0x00 },
+	{ CCI_REG8(0x4666), 0x25 },
+	{ CCI_REG8(0x4667), 0x03 },
+	{ CCI_REG8(0x46c0), 0x13 },
+	{ CCI_REG8(0x46c1), 0x00 },
+	{ CCI_REG8(0x46c2), 0x28 },
+	{ CCI_REG8(0x46c4), 0x13 },
+	{ CCI_REG8(0x46c5), 0x00 },
+	{ CCI_REG8(0x46c6), 0x24 },
+	{ CCI_REG8(0x46c7), 0x03 },
+	{ CCI_REG8(0x4720), 0x07 },
+	{ CCI_REG8(0x4721), 0x00 },
+	{ CCI_REG8(0x4722), 0x23 },
+	{ CCI_REG8(0x4723), 0x03 },
+	{ CCI_REG8(0x4724), 0x14 },
+	{ CCI_REG8(0x4725), 0x00 },
+	{ CCI_REG8(0x4726), 0x2a },
+	{ CCI_REG8(0x4750), 0x1e },
+	{ CCI_REG8(0x4752), 0x22 },
+	{ CCI_REG8(0x4753), 0x03 },
+	{ CCI_REG8(0x4754), 0x25 },
+	{ CCI_REG8(0x4755), 0x00 },
+	{ CCI_REG8(0x4756), 0x29 },
+	{ CCI_REG8(0x4780), 0x08 },
+	{ CCI_REG8(0x4781), 0x00 },
+	{ CCI_REG8(0x4782), 0x1d },
+	{ CCI_REG8(0x4783), 0x03 },
+	{ CCI_REG8(0x4784), 0x15 },
+	{ CCI_REG8(0x4785), 0x00 },
+	{ CCI_REG8(0x4786), 0x24 },
+	{ STARVIS2_REG_WDMODE, 0x00 },
+	{ STARVIS2_REG_MDBIT, 0x01 },
+	{ STARVIS2_REG_XXS_DRV, 0x00 },
+};
+
+static const u16 imx832_min_hmax_2lane[] = {
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
+static const struct starvis2_variant imx832_variant_def = {
+	.name = "imx832",
+	.id_reg = CCI_REG16_LE(0x4d1c),
+	.id_mask = 0x3ff,
+	.id_value = 0x340,
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
+	.common_regs = imx832_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx832_common_regs),
+	.vmax_default = 1136,
+	.hmax_min_link_freq = imx832_min_hmax_2lane,
+	.hmax_min_pixel_array = 990,
+};
+
 struct starvis2_model_info {
 	enum starvis2_type type;
 	const u32 *codes;
@@ -1054,6 +1149,26 @@ static const struct starvis2_model_info imx675_autodetect_info = {
 	.auto_detect_mono = &imx675_aamr_info,
 };
 
+static const struct starvis2_model_info imx832_aqr_info = {
+	.type = STARVIS2_COLOR,
+	.codes = codes_bayer,
+	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx832_variant_def,
+};
+
+static const struct starvis2_model_info imx832_amr_info = {
+	.type = STARVIS2_MONOCHROME,
+	.codes = codes_monochrome,
+	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx832_variant_def,
+};
+
+static const struct starvis2_model_info imx832_autodetect_info = {
+	.variant = &imx832_variant_def,
+	.auto_detect_colour = &imx832_aqr_info,
+	.auto_detect_mono = &imx832_amr_info,
+};
+
 static const char * const starvis2_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
@@ -1895,10 +2010,13 @@ static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx675-aaqr", .data = &imx675_aaqr_info },
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
+	{ .compatible = "sony,imx832-amr", .data = &imx832_amr_info },
+	{ .compatible = "sony,imx832-aqr", .data = &imx832_aqr_info },
 	/* for non-conforming DTs that rely on runtime check */
 	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
 	{ .compatible = "sony,imx675", .data = &imx675_autodetect_info },
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
+	{ .compatible = "sony,imx832", .data = &imx832_autodetect_info },
 	{ /* sentinel */ }
 };
 

-- 
2.34.1

