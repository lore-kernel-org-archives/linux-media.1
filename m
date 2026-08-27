Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC384C8FE8
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 18:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854688; cv=none; b=HPOI3FHKxDl6qBrmmr83SUILcAlGAchsDPX70TIBh//s6klWh3Zg/9kI+7P2b69eu4FH0FYeZ10BsMvFf2te8LGSlijGVvpz5ZgLQ4inXy0O3c4kt+aCbIt7dMmv6lb6ApCqMsyHefxRyGy++v4+dW32/0T67rulucWNFZcJIg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854688; c=relaxed/simple;
	bh=YNX7By34Vbjk6uZtV8BsYmJMqcdL1930bdJ6ByoBlsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uhjo4An6kiuNAhCPheCQ6AeDu+q2ZpckdS/76u0RG5jx1T7qWGQ/JMZKLllIKA7rX3Kvhouc8ExDuYteNWHBaNQotLgHspCuQyidCUfgzDXOYB8abfij5F8mS0Hn8eSjWqeXhtqD3wmhmgQUFF7asNbwzm182hwZgh+fTiOBeYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9jIBeTW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9jIBeTW"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so283945e9.1
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 11:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854684; x=1788459484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KrTE0NEaNw83u8vsZX/37KxgJO69Dmhio94naZrt9Sg=;
        b=q9jIBeTWMCnox0J1gN15x0dBUkc1l+8ekBOwZg3S2YOXtwq+7/kNu59QYyDJ3vawZn
         3RvAlqVHETF0KoWmC5Z8JIjdweM3FVlGyCcC9ssR5A45rxwO1CxvlfX6QeWU9JUFcIQu
         HTIF9WoLqwcUg0PyLRQcLYtOWgflxnJMNnJFqZAQi8GrkaL3NJHICj+jap8/Sv/yQOan
         uR94xRYYYjsKZxYcI+vaFereH9XkxH5XEmWpdgNH42qyipO2eWHsy+VgE3XBTw4LTA/9
         YL3xHFNZw/skWRCx7FsrtJyL/e+c13niBsb4l02+vQQw6bgp4xTP0KC8r5r/DdSVXUZI
         qdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854684; x=1788459484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KrTE0NEaNw83u8vsZX/37KxgJO69Dmhio94naZrt9Sg=;
        b=cFoBFd+WuRtOsfkxDd8sh8lW8HCbTOTVeAnw22fGS2ITk5sL6pgyQsRkeibM4a24Qd
         6UMwZN+vtiiyMDO7mjcVmR6ltpzYurJf0YwHrHnY0+88EH0ZRzZZJbzcaLmiWZeRluUH
         zELAs8Cws8YJr98VikklPVYY2Tbp4dqcaJDoYJcPORZJjgPdyLK6nL9DD64asK/F9Jj7
         +JsN2Ipc/Ok2kQTmdm6s3EKrqU2WrVviEk7uX7iYNXsJ160nwxfM2oPSAt+0EeN4bSwf
         Vkfe9B4o4LzIAOscJtHMF/2duzLsU5yD4X7VliCFqOS+tLIPjO3TwbvHs1KuCJUHi3kS
         UsvA==
X-Gm-Message-State: AFuF++nvscNd1QVAC57Ffeyt4E1tlO+1KSLHCPNsUyZRrwhTwT053fWv
	jNwLwApODcR2Qkg5nphFO+TSf9HhGp9wUbSMu3G/7SpMIRRTOG7uTkwqt+cBAZ9F
X-Gm-Gg: AR+sD12XCa3vf0uYQllbq5qg0+x+w9btWb19XKBN3N4C4HIDRXRkjj26bMitnb7KhT8
	gjAsfXkd38KY5evbk+bZVuackB4cI4vykXcM8AQpIbVqHZ4Sf82GlaHWfmNAkC8OUShx9TsHjEP
	p5y4K34FHcLVkauWn8JfDYbX/RRzsqDukRcDwVmCNfl9tgmIccLQV5+t7bWAOrMDUCZOYBbxzT7
	qqJLfDNpgmj+ekqKQHuQ0KBlNNLi7oiNU8/FaXUs/8dQ8psIYCigwVILpuWC51YLIth8GB6uzxh
	4EnIfNZlZ1MaEbXR1dQht+LHPxOzzKknZjUjckrKIKvZugS3wmk8c3OOWwx3UuYlvqfpECVrfjR
	gT4UJvJAnMEnSlNmvuWB5TPa3ETFPMRJ/Kq8U1FTVVlTZ2aqqAytclCSLfjz+/O9djFW/nMRug8
	ijOK9PcW76Vv4Ml328chhzO+EKkXY2tMGswaQIdBnm9z9cFyWDF0W8hg7t3Nm+LRkl3vRNbF/wE
	KPgVs8x759XVWpYK4uQ7voHHPcoHx/4LFEmqinGqmih
X-Received: by 2002:a05:600c:a03:b0:499:93b3:91ea with SMTP id 5b1f17b1804b1-49b91c5096dmr9536175e9.15.1787854684140;
        Thu, 27 Aug 2026 11:18:04 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:03 -0700 (PDT)
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 02/11] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Thu, 27 Aug 2026 20:17:47 +0200
Message-ID: <20260827181756.2430054-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book drives its OV8858 from a 19.2 MHz platform clock, while
the existing mode tables program the sensor PLL for 24 MHz. Reusing
those settings produces incorrect internal and CSI-2 clocks.

Accept both input rates and use the actual rate for the reset delay. For
19.2 MHz, apply the Cherry Trail MRD PLL and black-level settings after
the generic mode table.

The 19.2 MHz platform uses the per-channel manual white-balance
registers for digital gain. Program registers 0x5032, 0x5034 and 0x5036
and expose their 1x-to-4x range, while retaining the existing
long-exposure gain block for 24 MHz systems.

The manual white-balance register definitions and programming follow
the GPL-2.0 Intel OV5670 driver, so retain its 2017 Intel copyright
notice in this file. No proprietary source or tuning binary is included.

Tested on the Lenovo Yoga Book YB1-X91L OV8858 with full-range test bars
and real 10-bit Bayer frames.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/i2c/ov8858.c | 138 +++++++++++++++++++++++++++++++------
 1 file changed, 117 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index f0b3b4a5d3bd..b8c2f0d25505 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -3,10 +3,9 @@
  * Copyright (C) 2023 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
  * Copyright (C) 2022 Nicholas Roth <nicholas@rothemail.net>
  * Copyright (C) 2017 Fuzhou Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2017 Intel Corporation.
  */
 
-#include <linux/unaligned.h>
-
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -18,6 +17,8 @@
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/unaligned.h>
+#include <linux/units.h>
 
 #include <media/media-entity.h>
 #include <media/v4l2-async.h>
@@ -28,8 +29,9 @@
 #include <media/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
 
-#define OV8858_LINK_FREQ		360000000U
-#define OV8858_XVCLK_FREQ		24000000
+#define OV8858_LINK_FREQ		(360 * HZ_PER_MHZ)
+#define OV8858_XVCLK_FREQ_19_2MHZ	(192 * HZ_PER_MHZ / 10)
+#define OV8858_XVCLK_FREQ_24MHZ		(24 * HZ_PER_MHZ)
 
 #define OV8858_REG_SIZE_SHIFT		16
 #define OV8858_REG_ADDR_MASK		0xffff
@@ -59,6 +61,14 @@
 #define OV8858_LONG_GAIN_STEP		1
 #define OV8858_LONG_GAIN_DEFAULT	0x80
 
+#define OV8858_REG_MWB_RED_GAIN		OV8858_REG_16BIT(0x5032)
+#define OV8858_REG_MWB_GREEN_GAIN	OV8858_REG_16BIT(0x5034)
+#define OV8858_REG_MWB_BLUE_GAIN	OV8858_REG_16BIT(0x5036)
+#define OV8858_MWB_GAIN_MIN		0x400
+#define OV8858_MWB_GAIN_MAX		0xfff
+#define OV8858_MWB_GAIN_STEP		1
+#define OV8858_MWB_GAIN_DEFAULT		0x400
+
 #define OV8858_REG_LONG_DIGIGAIN	OV8858_REG_16BIT(0x350a)
 #define OV8858_LONG_DIGIGAIN_H_MASK	0x3fc0
 #define OV8858_LONG_DIGIGAIN_L_MASK	0x3f
@@ -93,6 +103,33 @@ struct regval_modes {
 	const struct regval *mode_4lanes;
 };
 
+struct ov8858_gain_range {
+	u32 min;
+	u32 max;
+	u32 step;
+	u32 def;
+};
+
+enum ov8858_xvclk_index {
+	OV8858_XVCLK_24MHZ,
+	OV8858_XVCLK_19_2MHZ,
+};
+
+static const struct ov8858_gain_range ov8858_digital_gain_ranges[] = {
+	[OV8858_XVCLK_24MHZ] = {
+		.min = OV8858_LONG_DIGIGAIN_MIN,
+		.max = OV8858_LONG_DIGIGAIN_MAX,
+		.step = OV8858_LONG_DIGIGAIN_STEP,
+		.def = OV8858_LONG_DIGIGAIN_DEFAULT,
+	},
+	[OV8858_XVCLK_19_2MHZ] = {
+		.min = OV8858_MWB_GAIN_MIN,
+		.max = OV8858_MWB_GAIN_MAX,
+		.step = OV8858_MWB_GAIN_STEP,
+		.def = OV8858_MWB_GAIN_DEFAULT,
+	},
+};
+
 struct ov8858_mode {
 	u32 width;
 	u32 height;
@@ -104,6 +141,7 @@ struct ov8858_mode {
 
 struct ov8858 {
 	struct clk		*xvclk;
+	unsigned long		xvclk_rate;
 	struct gpio_desc	*reset_gpio;
 	struct gpio_desc	*pwdn_gpio;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(ov8858_supply_names)];
@@ -121,6 +159,41 @@ struct ov8858 {
 	unsigned int		num_lanes;
 };
 
+/*
+ * Cherry Trail MRD production settings for a 19.2 MHz input and 360 MHz
+ * CSI-2 link. Apply these after the otherwise reusable 24 MHz mode table.
+ *
+ * Besides the corrected sensor/MIPI PLL divisors, keep the final common
+ * black-level settings here. The per-mode tables retain their resolution
+ * dependent black-column anchors and window sizes.
+ */
+static const struct regval ov8858_cht_mrd_19_2mhz[] = {
+	{0x0300, 0x00},
+	{0x0302, 0x27},
+	{0x0303, 0x00},
+	{0x0304, 0x03},
+	{0x030b, 0x00},
+	{0x030d, 0x27},
+	{0x030e, 0x00},
+	{0x030f, 0x04},
+	{0x0312, 0x01},
+	{0x031e, 0x0c},
+	{0x3f08, 0x08},
+	{0x400a, 0x01},
+	{0x400d, 0x10},
+	{0x4011, 0x20},
+	{0x403e, 0x08},
+	{0x4040, 0x07},
+	{0x4041, 0xc6},
+	{0x4202, 0x00},
+	{0x4500, 0x58},
+	{0x470b, 0x28},
+	{0x4837, 0x15},
+	{0x58f4, 0x32},
+	{0x58f8, 0x3d},
+	{REG_NULL, 0x00},
+};
+
 static inline struct ov8858 *sd_to_ov8858(struct v4l2_subdev *sd)
 {
 	return container_of(sd, struct ov8858, subdev);
@@ -1345,6 +1418,13 @@ static int ov8858_start_stream(struct ov8858 *ov8858,
 	if (ret)
 		return ret;
 
+	/* The mode tables contain PLL settings for a 24 MHz input clock. */
+	if (ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ) {
+		ret = ov8858_write_array(ov8858, ov8858_cht_mrd_19_2mhz);
+		if (ret)
+			return ret;
+	}
+
 	/* 200 usec max to let PLL stabilize. */
 	fsleep(200);
 
@@ -1526,18 +1606,26 @@ static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
 static int ov8858_set_digital_gain(struct ov8858 *ov8858, u32 gain)
 {
 	u16 long_gain;
+	int ret;
 
-	/*
-	 * Digital gain is assembled as:
-	 * 0x350a[7:0] = dgain[13:6]
-	 * 0x350b[5:0] = dgain[5:0]
-	 * Reassemble the control value to write it in one go.
-	 */
-	long_gain = (gain & OV8858_LONG_DIGIGAIN_L_MASK) |
-		    ((gain & OV8858_LONG_DIGIGAIN_H_MASK) <<
-		     OV8858_LONG_DIGIGAIN_H_SHIFT);
+	if (ov8858->xvclk_rate != OV8858_XVCLK_FREQ_19_2MHZ) {
+		long_gain = (gain & OV8858_LONG_DIGIGAIN_L_MASK) |
+			    ((gain & OV8858_LONG_DIGIGAIN_H_MASK) <<
+			     OV8858_LONG_DIGIGAIN_H_SHIFT);
 
-	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
+		return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
+				    long_gain, NULL);
+	}
+
+	ret = ov8858_write(ov8858, OV8858_REG_MWB_RED_GAIN, gain, NULL);
+	if (ret)
+		return ret;
+
+	ret = ov8858_write(ov8858, OV8858_REG_MWB_GREEN_GAIN, gain, NULL);
+	if (ret)
+		return ret;
+
+	return ov8858_write(ov8858, OV8858_REG_MWB_BLUE_GAIN, gain, NULL);
 }
 
 static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
@@ -1622,9 +1710,6 @@ static int ov8858_power_on(struct ov8858 *ov8858)
 	unsigned long delay_us;
 	int ret;
 
-	if (clk_get_rate(ov8858->xvclk) != OV8858_XVCLK_FREQ)
-		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
-
 	ret = clk_prepare_enable(ov8858->xvclk);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable xvclk\n");
@@ -1643,7 +1728,7 @@ static int ov8858_power_on(struct ov8858 *ov8858)
 	 * transaction, but a double sleep between the release of gpios
 	 * helps with sporadic failures observed at probe time.
 	 */
-	delay_us = DIV_ROUND_UP(8192, OV8858_XVCLK_FREQ / 1000 / 1000);
+	delay_us = DIV_ROUND_UP(8192, ov8858->xvclk_rate / HZ_PER_MHZ);
 
 	gpiod_set_value_cansleep(ov8858->reset_gpio, 0);
 	fsleep(delay_us);
@@ -1701,9 +1786,11 @@ static int ov8858_init_ctrls(struct ov8858 *ov8858)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
 	struct v4l2_ctrl_handler *handler = &ov8858->ctrl_handler;
+	const struct ov8858_gain_range *digital_gain_range;
 	const struct ov8858_mode *mode = &ov8858_modes[0];
 	struct v4l2_fwnode_device_properties props;
 	s64 exposure_max, vblank_def;
+	unsigned int xvclk_index;
 	unsigned int pixel_rate;
 	struct v4l2_ctrl *ctrl;
 	u32 h_blank;
@@ -1746,10 +1833,12 @@ static int ov8858_init_ctrls(struct ov8858 *ov8858)
 			  OV8858_LONG_GAIN_MIN, OV8858_LONG_GAIN_MAX,
 			  OV8858_LONG_GAIN_STEP, OV8858_LONG_GAIN_DEFAULT);
 
+	xvclk_index = ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ ?
+		OV8858_XVCLK_19_2MHZ : OV8858_XVCLK_24MHZ;
+	digital_gain_range = &ov8858_digital_gain_ranges[xvclk_index];
 	v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
-			  OV8858_LONG_DIGIGAIN_MIN, OV8858_LONG_DIGIGAIN_MAX,
-			  OV8858_LONG_DIGIGAIN_STEP,
-			  OV8858_LONG_DIGIGAIN_DEFAULT);
+			  digital_gain_range->min, digital_gain_range->max,
+			  digital_gain_range->step, digital_gain_range->def);
 
 	v4l2_ctrl_new_std_menu_items(handler, &ov8858_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
@@ -1887,6 +1976,13 @@ static int ov8858_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(ov8858->xvclk),
 				     "Failed to get xvclk\n");
 
+	ov8858->xvclk_rate = clk_get_rate(ov8858->xvclk);
+	if (ov8858->xvclk_rate != OV8858_XVCLK_FREQ_19_2MHZ &&
+	    ov8858->xvclk_rate != OV8858_XVCLK_FREQ_24MHZ)
+		return dev_err_probe(dev, -EINVAL,
+				     "Unsupported xvclk rate %lu Hz\n",
+				     ov8858->xvclk_rate);
+
 	ov8858->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_HIGH);
 	if (IS_ERR(ov8858->reset_gpio))
-- 
2.53.0

