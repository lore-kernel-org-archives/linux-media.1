Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AF8484236
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 16:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946326; cv=none; b=sHAUn358LM3cLkfQsnvkEafzEZc2y3z39U0yF35lX7b++zsHMaJy/hvu4WgdQwQrjMpwBEYRkFhgmzSkBgX53YVQVeydzNxu3beVXOVDIFi83OcnkU2EQ2czR6HiV6dAzT70ukQwEgtkJSTM9eYL5i7PzjV5PdEyEK8fF3HwFfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946326; c=relaxed/simple;
	bh=FgMNnupzl/wbCFMVKT6oUWB6/AyBhoDN7bICQL5q434=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HrUaNXPHUzPmkf6lpIYc94P5PntxnU/XAkpEhIusCqI5Ema+u7IS9GbKweKeB8D5nhVGg1VEUk3fkEhEWGosNdY+FBqkQsAi65uqV9C6QmHkqmxA1FvXd0d4wX4iq9LAwpV7fccFm3mxQ1kDJeWkqsuRg9L1FqC5P/a2UmWpM1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=omcd2gOB; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="omcd2gOB"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so712561f8f.2
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1785946317; x=1786551117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aD0tLJm4COdWx094gUFOmAoaj1UQAD3Pfy2ZGgr+UzY=;
        b=omcd2gOBEDHEnbX6batW+6KyIgAloWualiw7SfSkQn/WWz2p6xjl3ItgkVMq67J0FF
         9objWsydcUiCLS3Y6opaj7lsVPLgwhb7zj5Sots+XN4Ik88/cHMjCSy6GHoHr90lH0Hv
         GVsXpeIIhUlTTG82tCNOB13GKMH4AXXTO1QhHRyyIBdo18MyZp9ukUV6cB/8lmy/wjbN
         ZCg5tAWwZQqwanqQ97T4W+r6VX6q+z/PDcdGPxedcvMiiTNNpKhsK0JAM+wPkyh2YjGX
         dRALeKVJurUpZ+u1mKZeW1DrKY2CCadwhgO0uKp3xB58lLmnPgIrN4RRXcvk6MJ2cvh3
         80oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785946317; x=1786551117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aD0tLJm4COdWx094gUFOmAoaj1UQAD3Pfy2ZGgr+UzY=;
        b=DYp13g8+xsKLurPrdh6z5Z0xCkwPpFHyPtu1qsy9IhdraZly9/Z6Z9C1EQpc/JiyOs
         eBjJg72x4nkDVUt+I2wkCzaQa16Sm+dwjqBszWthnQqc6WgAE8W+gVKbwpnNPDqOoIQ1
         EvD6oLQ/qBgdiTf/v3+EMkmCmtUwimC9CxM00GTiO+841AdRmSOi2t7oEE7Z0prpJzEP
         AhgQ7jyl7y0G01z/T5jUrxBkZGxOFXt4vWPPY0r3kbaqbtI05BRhiup45RqKMkr2NPpu
         sdtISonzIyyRgXLuMHHhT3CkJ1mRNBr5AXv4Ybj81snArFcXZgmi0RP0WDrHrUYI7m2B
         mFRw==
X-Forwarded-Encrypted: i=1; AHgh+Roz43nVhq1OFn9Hc3+wNb/aHDt45Dii3BoNT1GcWKOHamx0lWImIAMT5WIvXRLS6qSW6ExReiqFtz+uHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhY4Yv2P5f8yIDNyUl4p7vTcG28v8y0gjaRmySZ2++pujUlE4W
	5CiJzUtelGb1pW/WuPzj8toVYg8rfByd83vAvJ/jUmlPC7YE8JuAjJ0prGwKA6/GQQA=
X-Gm-Gg: AR+sD12hQhwALOEBMI76lLKZYzLQ4dQA4ezjnRFVOUvTzl4pChPAncaQPfvBhyrccDz
	QUXIQEWt0AecXDdwTeo9oncJVlKZ/O4aADMVpXYc9dugsBODg2rzT+wr79Qa/TJ5iy4EdC39V1c
	VSMde5H4ANWAIKPtDC3XJOONs/ZJsN3Sj6Lczgws37G5x7a5+css9DYabopgRtLkHAHafrp85cE
	Sstfz8RozEIlpqvxrqQjCuB4Jp8n8XGsokQE1bZhGmMLSsXgezuH6cYDCpwrc57ibXSmQgrqnOn
	s0WR2NRX4oWM5ayh/wNMfdxMb+nRhE+wLDuXXWzI/cdmTC1Aa3mv1hBrEcaCpZ+ZS2WHSV85m5Q
	XnUd1phYJ9kmS6IQO8kIrkFWkN7Yf6BoxFzkxExC8CEEgobUOrX05SwqHSmLEkRkZJLX6ysAf5Z
	L3RYsqxb4q+7/uvyM8Z96Ls3i7lE1nVy5EUrF77xS3YnhNxpCQfI4mj4zUUFyackgwajRNSh+IQ
	CClPFwRAqewIu+dtOVXjGHKTttMEEIJiOJKGrbr
X-Received: by 2002:a05:6000:4b02:b0:47f:70f1:a577 with SMTP id ffacd0b85a97d-47fec62d892mr14400581f8f.17.1785946316964;
        Wed, 05 Aug 2026 09:11:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47febfda0cbsm9802575f8f.6.2026.08.05.09.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:11:56 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 05 Aug 2026 17:09:19 +0100
Subject: [PATCH RFC 4/4] media: i2c: imx678: Add imx675 support to the
 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-media-starvis2-v1-4-91e8e4eae44f@raspberrypi.com>
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

The IMX675 is a 5MPix Starvis2 sensor that follows the same
programming pattern as IMX678 and IMX662, so add it into the
driver.

FIXME: Validate common_regs against Sony documentation.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx678.c | 222 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 222 insertions(+)

diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
index 9083f2744510..4b82823c260e 100644
--- a/drivers/media/i2c/imx678.c
+++ b/drivers/media/i2c/imx678.c
@@ -714,6 +714,205 @@ const struct imx678_variant imx662_variant_def = {
 	.hmax_min = imx662_min_hmax_4lane,
 };
 
+static const struct cci_reg_sequence imx675_common_regs[] = {
+	{ CCI_REG8(0x301B), 0x00 },
+	{ CCI_REG8(0x301C), 0x00 },
+	{ CCI_REG8(0x301E), 0x01 },
+
+	{ CCI_REG8(0x3060), 0x95 },
+	{ CCI_REG8(0x3061), 0x00 },
+	{ CCI_REG8(0x3062), 0x00 },
+	{ CCI_REG8(0x3064), 0x56 },
+	{ CCI_REG8(0x3065), 0x00 },
+	{ CCI_REG8(0x3066), 0x00 },
+
+	{ CCI_REG8(0x3072), 0x00 },
+	{ CCI_REG8(0x3073), 0x00 },
+	{ CCI_REG8(0x3074), 0x00 },
+	{ CCI_REG8(0x3075), 0x00 },
+	{ CCI_REG8(0x3081), 0x00 },
+	{ CCI_REG8(0x30A4), 0xAA },
+	{ CCI_REG8(0x30A6), 0x0F },
+	{ CCI_REG8(0x30CC), 0x00 },
+	{ CCI_REG8(0x30CD), 0x00 },
+	{ CCI_REG8(0x30CE), 0x02 },
+	{ CCI_REG8(0x3400), 0x01 },
+
+	{ CCI_REG8(0x3400), 0x01 },
+	{ CCI_REG8(0x3460), 0x22 },
+	{ CCI_REG8(0x3492), 0x08 },
+	{ CCI_REG8(0x3B1D), 0x17 },
+	{ CCI_REG8(0x3B44), 0x3F },
+	{ CCI_REG8(0x3B60), 0x03 },
+	{ CCI_REG8(0x3C03), 0x04 },
+	{ CCI_REG8(0x3C04), 0x04 },
+	{ CCI_REG8(0x3C0A), 0x00 },
+	{ CCI_REG8(0x3C0B), 0x00 },
+	{ CCI_REG8(0x3C0C), 0x00 },
+	{ CCI_REG8(0x3C0D), 0x00 },
+	{ CCI_REG8(0x3C0E), 0x00 },
+	{ CCI_REG8(0x3C0F), 0x00 },
+	{ CCI_REG8(0x3C30), 0x73 },
+	{ CCI_REG8(0x3C3C), 0x20 },
+	{ CCI_REG8(0x3C7C), 0xB9 },
+	{ CCI_REG8(0x3C7D), 0x01 },
+	{ CCI_REG8(0x3C7E), 0xB7 },
+	{ CCI_REG8(0x3C7F), 0x01 },
+	{ CCI_REG8(0x3CB0), 0x00 },
+	{ CCI_REG8(0x3CB2), 0xFF },
+	{ CCI_REG8(0x3CB3), 0x03 },
+	{ CCI_REG8(0x3CB4), 0xFF },
+	{ CCI_REG8(0x3CB5), 0x03 },
+	{ CCI_REG8(0x3CBA), 0xFF },
+	{ CCI_REG8(0x3CBB), 0x03 },
+	{ CCI_REG8(0x3CC0), 0xFF },
+	{ CCI_REG8(0x3CC1), 0x03 },
+	{ CCI_REG8(0x3CC2), 0x00 },
+	{ CCI_REG8(0x3CC6), 0xFF },
+	{ CCI_REG8(0x3CC7), 0x03 },
+	{ CCI_REG8(0x3CC8), 0xFF },
+	{ CCI_REG8(0x3CC9), 0x03 },
+	{ CCI_REG8(0x3E00), 0x1E },
+	{ CCI_REG8(0x3E02), 0x04 },
+	{ CCI_REG8(0x3E03), 0x00 },
+	{ CCI_REG8(0x3E20), 0x04 },
+	{ CCI_REG8(0x3E21), 0x00 },
+	{ CCI_REG8(0x3E22), 0x1E },
+	{ CCI_REG8(0x3E24), 0xBA },
+	{ CCI_REG8(0x3E72), 0x85 },
+	{ CCI_REG8(0x3E76), 0x0C },
+
+	{ CCI_REG8(0x3E77), 0x01 },
+	{ CCI_REG8(0x3E7A), 0x85 },
+	{ CCI_REG8(0x3E7E), 0x1F },
+	{ CCI_REG8(0x3E82), 0xA6 },
+	{ CCI_REG8(0x3E86), 0x2D },
+	{ CCI_REG8(0x3EE2), 0x33 },
+	{ CCI_REG8(0x3EE3), 0x03 },
+	{ CCI_REG8(0x4490), 0x07 },
+	{ CCI_REG8(0x4494), 0x19 },
+	{ CCI_REG8(0x4495), 0x00 },
+	{ CCI_REG8(0x4496), 0xBB },
+	{ CCI_REG8(0x4497), 0x00 },
+	{ CCI_REG8(0x4498), 0x55 },
+	{ CCI_REG8(0x449A), 0x50 },
+	{ CCI_REG8(0x449C), 0x50 },
+	{ CCI_REG8(0x449E), 0x50 },
+	{ CCI_REG8(0x44A0), 0x3C },
+	{ CCI_REG8(0x44A2), 0x19 },
+	{ CCI_REG8(0x44A4), 0x19 },
+	{ CCI_REG8(0x44A6), 0x19 },
+	{ CCI_REG8(0x44A8), 0x4B },
+	{ CCI_REG8(0x44AA), 0x4B },
+	{ CCI_REG8(0x44AC), 0x4B },
+	{ CCI_REG8(0x44AE), 0x4B },
+	{ CCI_REG8(0x44B0), 0x3C },
+	{ CCI_REG8(0x44B2), 0x19 },
+	{ CCI_REG8(0x44B4), 0x19 },
+	{ CCI_REG8(0x44B6), 0x19 },
+	{ CCI_REG8(0x44B8), 0x4B },
+	{ CCI_REG8(0x44BA), 0x4B },
+	{ CCI_REG8(0x44BC), 0x4B },
+	{ CCI_REG8(0x44BE), 0x4B },
+	{ CCI_REG8(0x44C0), 0x3C },
+	{ CCI_REG8(0x44C2), 0x19 },
+	{ CCI_REG8(0x44C4), 0x19 },
+	{ CCI_REG8(0x44C6), 0x19 },
+	{ CCI_REG8(0x44C8), 0xF0 },
+	{ CCI_REG8(0x44CA), 0xEB },
+	{ CCI_REG8(0x44CC), 0xEB },
+	{ CCI_REG8(0x44CE), 0xE6 },
+	{ CCI_REG8(0x44D0), 0xE6 },
+	{ CCI_REG8(0x44D2), 0xBB },
+
+	{ CCI_REG8(0x44D4), 0xBB },
+	{ CCI_REG8(0x44D6), 0xBB },
+	{ CCI_REG8(0x44D8), 0xE6 },
+	{ CCI_REG8(0x44DA), 0xE6 },
+	{ CCI_REG8(0x44DC), 0xE6 },
+	{ CCI_REG8(0x44DE), 0xE6 },
+	{ CCI_REG8(0x44E0), 0xE6 },
+	{ CCI_REG8(0x44E2), 0xBB },
+	{ CCI_REG8(0x44E4), 0xBB },
+	{ CCI_REG8(0x44E6), 0xBB },
+	{ CCI_REG8(0x44E8), 0xE6 },
+	{ CCI_REG8(0x44EA), 0xE6 },
+	{ CCI_REG8(0x44EC), 0xE6 },
+	{ CCI_REG8(0x44EE), 0xE6 },
+	{ CCI_REG8(0x44F0), 0xE6 },
+	{ CCI_REG8(0x44F2), 0xBB },
+	{ CCI_REG8(0x44F4), 0xBB },
+	{ CCI_REG8(0x44F6), 0xBB },
+	{ CCI_REG8(0x4538), 0x15 },
+	{ CCI_REG8(0x4539), 0x15 },
+	{ CCI_REG8(0x453A), 0x15 },
+	{ CCI_REG8(0x4544), 0x15 },
+	{ CCI_REG8(0x4545), 0x15 },
+	{ CCI_REG8(0x4546), 0x15 },
+	{ CCI_REG8(0x4550), 0x11 },
+	{ CCI_REG8(0x4551), 0x11 },
+	{ CCI_REG8(0x4552), 0x11 },
+	{ CCI_REG8(0x4553), 0x11 },
+	{ CCI_REG8(0x4554), 0x11 },
+	{ CCI_REG8(0x4555), 0x11 },
+	{ CCI_REG8(0x4556), 0x11 },
+	{ CCI_REG8(0x4557), 0x11 },
+	{ CCI_REG8(0x4558), 0x11 },
+	{ CCI_REG8(0x455C), 0x11 },
+	{ CCI_REG8(0x455D), 0x11 },
+	{ CCI_REG8(0x455E), 0x11 },
+	{ CCI_REG8(0x455F), 0x11 },
+	{ CCI_REG8(0x4560), 0x11 },
+	{ CCI_REG8(0x4561), 0x11 },
+	{ CCI_REG8(0x4562), 0x11 },
+	{ CCI_REG8(0x4563), 0x11 },
+	{ CCI_REG8(0x4564), 0x11 },
+
+	{ CCI_REG8(0x4569), 0x01 },
+	{ CCI_REG8(0x456A), 0x01 },
+	{ CCI_REG8(0x456B), 0x06 },
+	{ CCI_REG8(0x456C), 0x06 },
+	{ CCI_REG8(0x456D), 0x06 },
+	{ CCI_REG8(0x456E), 0x06 },
+	{ CCI_REG8(0x456F), 0x06 },
+	{ CCI_REG8(0x4570), 0x06 },
+};
+
+static const u16 imx675_min_hmax_4lane[] = {
+	[IMX678_LINK_FREQ_297MHZ] = 1125,
+	[IMX678_LINK_FREQ_360MHZ] = 1125,
+	[IMX678_LINK_FREQ_445MHZ] = 1125,
+	[IMX678_LINK_FREQ_594MHZ] = 1125 / 2,
+	[IMX678_LINK_FREQ_720MHZ] = 1125 / 2,
+	[IMX678_LINK_FREQ_891MHZ] = 1125 / 2,
+	[IMX678_LINK_FREQ_1039MHZ] = 1125 / 2,
+	[IMX678_LINK_FREQ_1188MHZ] = 1125 / 2,
+};
+
+const struct imx678_variant imx675_variant_def = {
+	.name = "imx675",
+	.id_reg = IMX678_REG_MODULE_ID,
+	.id_value = 0x296,
+	.native_area = {
+		.top = 0,
+		.left = 0,
+		.width = 2609,
+		.height = 1984,
+	},
+	.active_area = {
+		.top = 0,
+		.left = 0,
+		.width = 2608,
+		.height = 1984,
+	},
+	.pixel_rate = 594000000,
+	.pix_per_clk = 8,
+	.common_regs = imx675_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx675_common_regs),
+	.vmax_default = 1984 + 40,
+	.hmax_min = imx675_min_hmax_4lane,
+};
+
 struct imx678_model_info {
 	enum imx678_type type;
 	const u32 *codes;
@@ -764,6 +963,26 @@ static const struct imx678_model_info imx662_autodetect_info = {
 	.auto_detect_mono = &imx662_aamr_info,
 };
 
+static const struct imx678_model_info imx675_aaqr_info = {
+	.type = IMX678_COLOR,
+	.codes = codes_bayer,
+	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx675_variant_def,
+};
+
+static const struct imx678_model_info imx675_aamr_info = {
+	.type = IMX678_MONOCHROME,
+	.codes = codes_monochrome,
+	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx675_variant_def,
+};
+
+static const struct imx678_model_info imx675_autodetect_info = {
+	.variant = &imx675_variant_def,
+	.auto_detect_colour = &imx675_aaqr_info,
+	.auto_detect_mono = &imx675_aamr_info,
+};
+
 static const char * const imx678_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
@@ -1533,9 +1752,12 @@ static const struct of_device_id imx678_of_match[] = {
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
 	{ .compatible = "sony,imx662-aamr", .data = &imx662_aamr_info },
 	{ .compatible = "sony,imx662-aaqr", .data = &imx662_aaqr_info },
+	{ .compatible = "sony,imx675-aamr", .data = &imx675_aamr_info },
+	{ .compatible = "sony,imx675-aaqr", .data = &imx675_aaqr_info },
 	/* for non-conforming DTs that rely on runtime check */
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
 	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
+	{ .compatible = "sony,imx675", .data = &imx675_autodetect_info },
 	{ /* sentinel */ }
 };
 

-- 
2.34.1

