Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794656256;
	b=KWR+J0EbC8uvapom7FZ0wEP+ZTSIlrHnLKwGTvBhMxcEL9eFN0btojNFrOQ2WSYncobs
	 XmlNcx2qXZpTBFVVtOPiuqNrd3afcdlsa4FxBUYnkJYCTV7/P9A/6vKhhxa8Ewy3frds6
	 vJm4fr3LTvIew+vowaBFUV+HByDUJe3G3aynWN11PdZTV1eEcnbtyWpojDAiTsMklLFZI
	 f3k3o/F3Pgqkjl+GHPKbB8AdXEq9iy+bpD/yYgyXrcJ4wvQnvmgUysTnyQH6DUvmyq3Fu
	 0+08VWNTiPH/lQhDVXfznm3uJy8SXox48XURC+hBmZyA0AOcm8VCy9xdnlKT+yPKyAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794656256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wFDS8IHvTjvrQur5Gw6DLU3xwLaJDxffSY0UtpBe/ts=;
	b=n0RzuWhSN0OGRwNClPtv0drNmF4AaASJklXDM0BEoGM7nh2wOagRWecj+PhlU1M89Cuw
	 K9M02hiKTpnl50obU1TnNfxIWVGhNPY3RZHNeM7SjogR9iUZtx6FDn624YqxJmgClyE2N
	 Nn9MI9KxAXaiF9D15lcHSuIZvuDkOiuoETObgN/OtZs8JNwEbH3dfwUHaw9WvgCxBfpj6
	 84rt2jsQvFxMmNurv7TVlXtbtyFeARl1lRpmjLtEgpUvnYjOoAfH/XrkIsFd5d/N4Vhuc
	 R+aJ/KvAC07thzNdovLVaU55wZhTJLojYCr95Moz8afKVhvTzCrj+gkgFVkNjfYn7/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LaTMQsE+;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CF3606A331
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4CF3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LaTMQsE+
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso320021066b.3
        for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794656254; x=1795261054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wFDS8IHvTjvrQur5Gw6DLU3xwLaJDxffSY0UtpBe/ts=;
        b=LaTMQsE+iubYDZJLNTd0/wJRwLbOWR2+92go1+3cSHmZBIqOauqTv/hCJMt7Mx7lIu
         8xQVznwC7BDoO7EbQqnJhMn+GlWYjRJNA5XZPSP8skvmQ68S/SoJKI+O82ejQYHEhxta
         JJ/sfMRYH9vG8bfYM/okDa2SSbQVjlBkKyu190GQBWOMDConsVMbd5UK0StR9KLWp/vU
         ch6/UduCt5cWG6iDqsnCbgeHtwVpoWDdUEoKdkiL4aXzkqsCqGQUp1Nu95f2fwmsaGMU
         NQvDI86TkdE0tk7RnI4/N19fxZQ3RrPUof9PcBTt2sS7SvEbaPsqlDUBByFJuNcWKYJ9
         qMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794656254; x=1795261054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wFDS8IHvTjvrQur5Gw6DLU3xwLaJDxffSY0UtpBe/ts=;
        b=AAhkA8xEL3yo1pgvSSbX0SJIKgF630B0ECC6+MwMsHknfNersP3KMOyg2pBRpJwBiv
         eONU1W+1CEE8xxH0lWoVkBGNZkp7i8lx87Do3SvP2tdRDMqBR7OqApW/+n1+n/e8upzS
         jx3I8dygw9tr8OnrXzb6SfRJfvMTIUxaznCOuPJovtTNIKKvcEwvAWfVMHafMPjR4c7a
         sv/AGlT0L68Xutb+iwvftgwh//OBn16Eh/qVOLKUHcosVVJdyguRPi7oNZ82UBeOctAm
         NAJUkNvdp35XxiYteDfrszLmCbdQFyA0xZXf4Yt4TVDubTSOBSWGeUEPgiirD8HA8Bav
         y8iQ==
X-Gm-Message-State: APuU4Z+ZZjp16Cs1T83pEVKnSnYWEtTUDeRyvg8Vbh7VTRxLZCceMKxF
	RZyX+hzuEwuX1/qDFA5X+sdLxHCUA0VXiB7rmwNVsl6UATttl+VOSFS9lRIYsQ==
X-Gm-Gg: AYBFou2UeHy5sCd01y5ko4Fhj3YGC7hJ28f/ADFDhpxAE8p2aERNdkNpvpWJmQwOq5T
	FkOArSaGzn5oOCk72vQ3+shvseMHOlh3yXDVGx4T8o4kp9ityb1NvFHMbPhwsdhX1b7JOjwpQ1V
	UEfougXMWhL3GS7cdEoSatS7xH+ELllJP9PUc1XPmwxUB1JYYhEJeTcgZ+s/iyh28Se1CAyGOw8
	iHV+MOGMOSI38W9lzKMl2Fsuk3d7HEYW/NYPWqoARmuRjcxzN/6MqBxcmBXqZm65Ct5GBMZNTVa
	W7SryZCe7FbA7ICdnZQrSHmonAJkxz+Z0hd0cAG3sb2XtPxB5EXWwsjGfSIJqOeumWuuJCnZRb5
	nnLB7BY9feA7hYUt1VavCzO8mM/osgODHLsURt3dyhIy5ABU86O5/8jiu02sRwbZprZ75xRQbql
	j0dBtpvlUeDkuPkbOy/AmKIpEEiVzO/ZFUGAWWQbEeVGyj2mckY73lmecaN4mFMhsVAxmyFTR+1
	IGKuXqda5HhbLbODgYFBnP4bHOthvXe2h7JP21bXq1xtXrskIi1u4lK1bftjZbKUkfk0z/abomU
	oKP1WEOHeqiTPrbueRm1fkv1QDH93iqXuvGhEXggtbb3ybWCNjbJ7V60oWLcDoNFFx1chgQVeZ+
	GqDQ3X21KUQ==
X-Received: by 2002:a17:907:96a3:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c50962eeff0mr452773366b.11.1794656253646;
        Sat, 14 Nov 2026 03:37:33 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b60988sm205279666b.59.2026.11.14.03.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:37:31 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] media: i2c: ov5693: Implement PLL configuration
Date: Sat, 14 Nov 2026 13:37:08 +0200
Message-ID: <20261114113708.127185-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the ov5693 driver hardcodes PLL register values in the global
register sequence and assumes a fixed 19.2 MHz XVCLK input, resulting in
hardcoded link frequency (419.2 MHz) and pixel rate (167.68 MHz) values.

Add dynamic PLL configuration support for multiple XVCLK frequencies
(6 MHz, 13.5 MHz, 19.2 MHz, 24 MHz, and 27 MHz) by:
- Introducing a PLL configuration table and ov5693_pll_configure() to
  program PLL1 and PLL2 dividers and multipliers during sensor init.
- Dynamically deriving the default link frequency and pixel rate from
  the selected PLL1 clock rate rather than relying on static defines.
- Updating VTS, frame interval, and V4L2 control initialization to use
  the calculated pixel rate and link frequency.
- Fetching XVCLK earlier in probe via devm_v4l2_sensor_clk_get() with a
  NULL connection ID to support standard DT clock lookups before checking
  the hardware configuration.

The new 19.2 MHz XVCLK link frequency and pixel rate calculations match
the original hardcoded values.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
Tested on Nvidia Tegra Note 7 and ASUS Transformer TF701T, Tegra 4 devices
where this sensor is used in the rear position.
---
 drivers/media/i2c/ov5693.c | 194 ++++++++++++++++++++++++++++---------
 1 file changed, 150 insertions(+), 44 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 56599f9ca74ba..1a5647c7b764c 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -17,6 +17,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -44,6 +45,21 @@
 /* Yes, this is right. The datasheet for the OV5693 gives its ID as 0x5690 */
 #define OV5693_CHIP_ID				0x5690
 
+#define OV5693_PLL2_PRE_DIV_REG			CCI_REG8(0x3098)
+#define OV5693_PLL2_MULT_REG			CCI_REG8(0x3099)
+#define OV5693_PLL2_SYS_DIV_REG			CCI_REG8(0x309a)
+#define OV5693_PLL2_SYS_DIV_DEFAULT		2
+#define OV5693_PLL2_DIV_REG			CCI_REG8(0x309b)
+#define OV5693_PLL2_DIV_DEFAULT			1
+
+#define OV5693_PLL1_MULT_REG			CCI_REG8(0x30b3)
+#define OV5693_PLL1_PRE_DIV_REG			CCI_REG8(0x30b4)
+#define OV5693_PLL1_PIX_DIV_REG			CCI_REG8(0x30b5)
+#define OV5693_PLL1_PIX_DIV_8			4
+#define OV5693_PLL1_PIX_DIV_10			5
+#define OV5693_PLL1_SYS_DIV_REG			CCI_REG8(0x30b6)
+#define OV5693_PLL1_SYS_DIV_DEFAULT		1
+
 /* Exposure */
 #define OV5693_EXPOSURE_CTRL_REG		CCI_REG24(0x3500)
 #define OV5693_EXPOSURE_CTRL_MASK		GENMASK(19, 4)
@@ -114,6 +130,7 @@
 #define OV5693_ACTIVE_START_TOP			6
 #define OV5693_MIN_CROP_WIDTH			2
 #define OV5693_MIN_CROP_HEIGHT			2
+#define OV5693_DATA_DEPTH_RAW10			10
 
 /* Test Pattern */
 #define OV5693_TEST_PATTERN_REG			CCI_REG8(0x5e00)
@@ -122,11 +139,6 @@
 #define OV5693_TEST_PATTERN_RANDOM		0x01
 #define OV5693_TEST_PATTERN_BARS		0x00
 
-/* System Frequencies */
-#define OV5693_XVCLK_FREQ			19200000
-#define OV5693_LINK_FREQ_419_2MHZ		419200000
-#define OV5693_PIXEL_RATE			167680000
-
 #define to_ov5693_sensor(x) container_of(x, struct ov5693_device, sd)
 
 static const char * const ov5693_supply_names[] = {
@@ -137,6 +149,14 @@ static const char * const ov5693_supply_names[] = {
 
 #define OV5693_NUM_SUPPLIES	ARRAY_SIZE(ov5693_supply_names)
 
+struct ov5693_pll {
+	u64 xvclk_rate;
+	u8 pll1_pre_div;
+	u8 pll1_mult;
+	u8 pll2_pre_div;
+	u8 pll2_mult;
+};
+
 struct ov5693_device {
 	struct device *dev;
 	struct regmap *regmap;
@@ -147,7 +167,11 @@ struct ov5693_device {
 	struct gpio_desc *reset;
 	struct gpio_desc *powerdown;
 	struct regulator_bulk_data supplies[OV5693_NUM_SUPPLIES];
+
 	struct clk *xvclk;
+	const struct ov5693_pll *pll;
+	u64 pixel_rate;
+	s64 default_link_freq;
 
 	/* Gate the MIPI clock lane when idle (CSI-2 non-continuous clock) */
 	bool clock_ncont;
@@ -180,24 +204,40 @@ struct ov5693_device {
 	} ctrls;
 };
 
+static const struct ov5693_pll ov5693_pll[] = {
+	{
+		.xvclk_rate = 6000000,
+		.pll1_pre_div = 1, .pll1_mult = 134,
+		.pll2_pre_div = 1, .pll2_mult = 20,
+	}, {
+		.xvclk_rate = 13500000,
+		.pll1_pre_div = 2, .pll1_mult = 121,
+		.pll2_pre_div = 3, .pll2_mult = 18,
+	}, {
+		.xvclk_rate = 19200000,
+		.pll1_pre_div = 3, .pll1_mult = 131,
+		.pll2_pre_div = 2, .pll2_mult = 25,
+	}, {
+		.xvclk_rate = 24000000,
+		.pll1_pre_div = 3, .pll1_mult = 100,
+		.pll2_pre_div = 3, .pll2_mult = 30,
+	}, {
+		.xvclk_rate = 27000000,
+		.pll1_pre_div = 3, .pll1_mult = 89,
+		.pll2_pre_div = 3, .pll2_mult = 27,
+	},
+};
+
 static const struct cci_reg_sequence ov5693_global_regs[] = {
 	{CCI_REG8(0x3016), 0xf0},
 	{CCI_REG8(0x3017), 0xf0},
 	{CCI_REG8(0x3018), 0xf0},
 	{CCI_REG8(0x3022), 0x01},
 	{CCI_REG8(0x3028), 0x44},
-	{CCI_REG8(0x3098), 0x02},
-	{CCI_REG8(0x3099), 0x19},
-	{CCI_REG8(0x309a), 0x02},
-	{CCI_REG8(0x309b), 0x01},
 	{CCI_REG8(0x309c), 0x00},
 	{CCI_REG8(0x30a0), 0xd2},
 	{CCI_REG8(0x30a2), 0x01},
 	{CCI_REG8(0x30b2), 0x00},
-	{CCI_REG8(0x30b3), 0x83},
-	{CCI_REG8(0x30b4), 0x03},
-	{CCI_REG8(0x30b5), 0x04},
-	{CCI_REG8(0x30b6), 0x01},
 	{CCI_REG8(0x3080), 0x01},
 	{CCI_REG8(0x3104), 0x21},
 	{CCI_REG8(0x3106), 0x00},
@@ -340,10 +380,6 @@ static const struct v4l2_mbus_framefmt ov5693_default_fmt = {
 	.code = MEDIA_BUS_FMT_SBGGR10_1X10,
 };
 
-static const s64 link_freq_menu_items[] = {
-	OV5693_LINK_FREQ_419_2MHZ
-};
-
 static const char * const ov5693_test_pattern_menu[] = {
 	"Disabled",
 	"Random Data",
@@ -557,6 +593,32 @@ static const struct v4l2_ctrl_ops ov5693_ctrl_ops = {
 
 /* System Control Functions */
 
+static int ov5693_pll_configure(struct ov5693_device *ov5693)
+{
+	const struct ov5693_pll *pll = ov5693->pll;
+	int ret = 0;
+
+	/* PLL2 */
+	cci_write(ov5693->regmap, OV5693_PLL2_PRE_DIV_REG, pll->pll2_pre_div,
+		  &ret);
+	cci_write(ov5693->regmap, OV5693_PLL2_MULT_REG, pll->pll2_mult, &ret);
+	cci_write(ov5693->regmap, OV5693_PLL2_SYS_DIV_REG,
+		  OV5693_PLL2_SYS_DIV_DEFAULT, &ret);
+	cci_write(ov5693->regmap, OV5693_PLL2_DIV_REG, OV5693_PLL2_DIV_DEFAULT,
+		  &ret);
+
+	/* PLL1 */
+	cci_write(ov5693->regmap, OV5693_PLL1_MULT_REG, pll->pll1_mult, &ret);
+	cci_write(ov5693->regmap, OV5693_PLL1_PRE_DIV_REG, pll->pll1_pre_div,
+		  &ret);
+	cci_write(ov5693->regmap, OV5693_PLL1_PIX_DIV_REG,
+		  OV5693_PLL1_PIX_DIV_8, &ret);
+	cci_write(ov5693->regmap, OV5693_PLL1_SYS_DIV_REG,
+		  OV5693_PLL1_SYS_DIV_DEFAULT, &ret);
+
+	return ret;
+}
+
 static int ov5693_mode_configure(struct ov5693_device *ov5693)
 {
 	const struct ov5693_mode *mode = &ov5693->mode;
@@ -657,6 +719,11 @@ static int ov5693_sensor_init(struct ov5693_device *ov5693)
 		return dev_err_probe(ov5693->dev, ret,
 				     "software reset error\n");
 
+	ret = ov5693_pll_configure(ov5693);
+	if (ret)
+		return dev_err_probe(ov5693->dev, ret,
+				     "PLL configure error\n");
+
 	ret = cci_multi_reg_write(ov5693->regmap, ov5693_global_regs,
 				  ARRAY_SIZE(ov5693_global_regs), NULL);
 	if (ret)
@@ -771,7 +838,7 @@ static int ov5693_detect(struct ov5693_device *ov5693)
 
 /* V4L2 Framework callbacks */
 
-static unsigned int __ov5693_calc_vts(u32 height)
+static unsigned int __ov5693_calc_vts(struct ov5693_device *ov5693, u32 height)
 {
 	/*
 	 * We need to set a sensible default VTS for whatever format height we
@@ -780,10 +847,17 @@ static unsigned int __ov5693_calc_vts(u32 height)
 	 */
 
 	unsigned int tgt_fps;
+	u64 temp_fps, vts;
+
+	temp_fps = div_u64(ov5693->pixel_rate, (u64)OV5693_FIXED_PPL * height);
+	tgt_fps = rounddown((u32)temp_fps, 30);
 
-	tgt_fps = rounddown(OV5693_PIXEL_RATE / OV5693_FIXED_PPL / height, 30);
+	if (tgt_fps == 0)
+		tgt_fps = 30;
 
-	return ALIGN_DOWN(OV5693_PIXEL_RATE / OV5693_FIXED_PPL / tgt_fps, 2);
+	vts = div_u64(ov5693->pixel_rate, (u64)OV5693_FIXED_PPL * tgt_fps);
+
+	return ALIGN_DOWN(vts, 2);
 }
 
 static struct v4l2_mbus_framefmt *
@@ -879,7 +953,7 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
 	ov5693->mode.binning_y = vratio > 1;
 	ov5693->mode.inc_y_odd = vratio > 1 ? 3 : 1;
 
-	ov5693->mode.vts = __ov5693_calc_vts(fmt->height);
+	ov5693->mode.vts = __ov5693_calc_vts(ov5693, fmt->height);
 
 	__v4l2_ctrl_modify_range(ov5693->ctrls.vblank,
 				 OV5693_TIMING_MIN_VTS,
@@ -1032,7 +1106,7 @@ static int ov5693_get_frame_interval(struct v4l2_subdev *sd,
 	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
 	unsigned int framesize = OV5693_FIXED_PPL * (ov5693->mode.format.height +
 				 ov5693->ctrls.vblank->val);
-	unsigned int fps = DIV_ROUND_CLOSEST(OV5693_PIXEL_RATE, framesize);
+	unsigned int fps = DIV_U64_ROUND_CLOSEST(ov5693->pixel_rate, framesize);
 
 	/*
 	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
@@ -1119,15 +1193,15 @@ static int ov5693_init_controls(struct ov5693_device *ov5693)
 	/* link freq */
 	ctrls->link_freq = v4l2_ctrl_new_int_menu(&ctrls->handler,
 						  NULL, V4L2_CID_LINK_FREQ,
-						  0, 0, link_freq_menu_items);
+						  0, 0, &ov5693->default_link_freq);
 	if (ctrls->link_freq)
 		ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* pixel rate */
 	ctrls->pixel_rate = v4l2_ctrl_new_std(&ctrls->handler, NULL,
 					      V4L2_CID_PIXEL_RATE, 0,
-					      OV5693_PIXEL_RATE, 1,
-					      OV5693_PIXEL_RATE);
+					      ov5693->pixel_rate, 1,
+					      ov5693->pixel_rate);
 
 	/* Exposure */
 	exposure_max = ov5693->mode.vts - OV5693_INTEGRATION_TIME_MARGIN;
@@ -1243,6 +1317,8 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
 	struct fwnode_handle *endpoint;
+	u64 xvclk_rate, pll1_clk;
+	u32 ndata_lanes;
 	unsigned int i;
 	int ret;
 
@@ -1260,7 +1336,8 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
 	if (ret)
 		return ret;
 
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
+	ndata_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
+	if (ndata_lanes != 2) {
 		dev_err(ov5693->dev, "only a 2-lane CSI2 config is supported");
 		ret = -EINVAL;
 		goto out_free_bus_cfg;
@@ -1272,17 +1349,51 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
 		goto out_free_bus_cfg;
 	}
 
-	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
-		if (bus_cfg.link_frequencies[i] == OV5693_LINK_FREQ_419_2MHZ)
+	xvclk_rate = clk_get_rate(ov5693->xvclk);
+	if (!xvclk_rate) {
+		dev_err(ov5693->dev, "XVCLK rate unknown\n");
+		ret = -EINVAL;
+		goto out_free_bus_cfg;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(ov5693_pll); i++) {
+		if (xvclk_rate == ov5693_pll[i].xvclk_rate) {
+			ov5693->pll = &ov5693_pll[i];
 			break;
+		}
+	}
+	if (!ov5693->pll) {
+		dev_err(ov5693->dev, "Unsupported XVCLK rate %llu\n",
+			xvclk_rate);
+		ret = -EINVAL;
+		goto out_free_bus_cfg;
+	}
+
+	pll1_clk = div_u64(xvclk_rate * ov5693->pll->pll1_mult,
+			   ov5693->pll->pll1_pre_div);
 
-	if (i == bus_cfg.nr_of_link_frequencies) {
-		dev_err(ov5693->dev, "supported link freq %ull not found\n",
-			OV5693_LINK_FREQ_419_2MHZ);
+	/*
+	 * The default link frequency is derived from PLL1 divided by the
+	 * number of data lanes.
+	 */
+	ov5693->default_link_freq = div_u64(pll1_clk, ndata_lanes);
+
+	if (bus_cfg.nr_of_link_frequencies != 1 ||
+	    bus_cfg.link_frequencies[0] != ov5693->default_link_freq) {
+		dev_err(ov5693->dev, "Invalid link-frequency, expected %llu\n",
+			ov5693->default_link_freq);
 		ret = -EINVAL;
 		goto out_free_bus_cfg;
 	}
 
+	/*
+	 * The pixel rate is calculated from PLL1 by multiplying by the number
+	 * of data lanes and dividing by the word length of the CSI-2 interface
+	 * (e.g., 10 for RAW10, which is the OV5693 default).
+	 */
+	ov5693->pixel_rate = div_u64(pll1_clk * ndata_lanes,
+				     OV5693_DATA_DEPTH_RAW10);
+
 	ov5693->clock_ncont = bus_cfg.bus.mipi_csi2.flags &
 			      V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
 
@@ -1295,7 +1406,6 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
 static int ov5693_probe(struct i2c_client *client)
 {
 	struct ov5693_device *ov5693;
-	u32 xvclk_rate;
 	int ret = 0;
 
 	ov5693 = devm_kzalloc(&client->dev, sizeof(*ov5693), GFP_KERNEL);
@@ -1308,6 +1418,12 @@ static int ov5693_probe(struct i2c_client *client)
 	if (IS_ERR(ov5693->regmap))
 		return PTR_ERR(ov5693->regmap);
 
+	ov5693->xvclk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
+	if (IS_ERR(ov5693->xvclk))
+		return dev_err_probe(&client->dev, PTR_ERR(ov5693->xvclk),
+				     "failed to get xvclk: %pe\n",
+				     ov5693->xvclk);
+
 	ret = ov5693_check_hwcfg(ov5693);
 	if (ret)
 		return ret;
@@ -1316,17 +1432,6 @@ static int ov5693_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&ov5693->sd, client, &ov5693_ops);
 
-	ov5693->xvclk = devm_v4l2_sensor_clk_get(&client->dev, "xvclk");
-	if (IS_ERR(ov5693->xvclk))
-		return dev_err_probe(&client->dev, PTR_ERR(ov5693->xvclk),
-				     "failed to get xvclk: %pe\n",
-				     ov5693->xvclk);
-
-	xvclk_rate = clk_get_rate(ov5693->xvclk);
-	if (xvclk_rate != OV5693_XVCLK_FREQ)
-		dev_warn(&client->dev, "Found clk freq %u, expected %u\n",
-			 xvclk_rate, OV5693_XVCLK_FREQ);
-
 	ret = ov5693_configure_gpios(ov5693);
 	if (ret)
 		return ret;
@@ -1342,7 +1447,8 @@ static int ov5693_probe(struct i2c_client *client)
 
 	ov5693->mode.crop = ov5693_default_crop;
 	ov5693->mode.format = ov5693_default_fmt;
-	ov5693->mode.vts = __ov5693_calc_vts(ov5693->mode.format.height);
+	ov5693->mode.vts = __ov5693_calc_vts(ov5693,
+					     ov5693->mode.format.height);
 
 	ret = ov5693_init_controls(ov5693);
 	if (ret)
-- 
2.53.0

