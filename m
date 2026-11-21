Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262862;
	b=Go2ieV0LZjGIy6RO8i+FEQVn31EFMNvLoy7nZ7K+WyjWGkBSsE9mj7zjxCOj5NhKoh3k
	 FQZuIHVxDkPaAv0MDwaIdMcat/jQkPeWD76mjHVw7IvcTBbv1bL+eUxQDlKdoOAd90hHl
	 PYtUxjA3ETsNeMrF3oTnLJGxaz/PclNkfYsOy2L9K1ymECR/5zWQ6EiEkbVH5Eeksma9o
	 Coqh9Lh8YVUqAo2eigUSrbjiioqFoIwKo42C/KJFisboSD20+9YzL86MEb93ICpH63dnE
	 yE9nvZeiF3SPZEWT7tOFj6kGvMtWBRfWPYi9Q5L0LDphAGLOzzo9ht8VJ9aOm1bcYug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pBcAFDSWzjSfOXEdobVxGEcQtev6dBbBBo06TmQdLZY=;
	b=LtNzAyR0uXTQiijG+XQxE5KK8IzO1XMtIs84x7Z5IrnWKvZOMvGfKjnV0oP7Ms+h5pf0
	 9fv5T6T+25z3Y+ziNT+RwKgrw3BHvGfSVnvuQVga0843RCv/1Y9kit5ErmnD65MaExfsl
	 IjxegEfynShdpe2wB6fC585NCuODcSDJTLLQd6MPfAKPL0vPZ/IrgEr/SeYI5sdZ1TwuB
	 VPT0TSjonnZadfDnoBtzdsAn3hOMFeqKGkXaudVTqSw2RApCOd53agn75SIoUpSjme/Ng
	 zg2WQ7h9ivVigH1eZ/NpekM7nWn04r8nEvnrLfbbEzTxpgvCrnqQLKSPLuQKLUcxUuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANy0zEoY;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B533606A32C
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 12:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B533606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANy0zEoY
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-380b40319bdso2370589eec.1
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 04:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795262860; x=1795867660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBcAFDSWzjSfOXEdobVxGEcQtev6dBbBBo06TmQdLZY=;
        b=ANy0zEoYD6tqer7WZNxJCxSGylX7Qz0rcL06OqKi3Dci3b/8A0RGWvQkgmjkb35I5v
         40PWkm3rn8T4yxhXKRUdwpdTrTrfU0QGZwmHhz5iexTwDZ+MRQ8XfYCCcsouL1tFfhQB
         ZfH8jOpfQ2ijsKqRh0rRGn4NXEFADB5zMB84PQ7bttCAaLDFT/dhzPmTK6Xo9uTKh9du
         gJ8Al5ViO2eNr5fKVqQktodOhR1XWtHfsvL4ra934wlZ+AttrmEUIJxBSwlnbPzO+10E
         TbxptTTf7/Nm/+8URFFrqSuvcUsEm0UORVQYUc8ZtjgI/Rk7sRWCuU6PDz9rF6EZyoMw
         1jFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795262860; x=1795867660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pBcAFDSWzjSfOXEdobVxGEcQtev6dBbBBo06TmQdLZY=;
        b=vCSmxQcP5A5c/1rsF2D2mIJBTfBFhNj2niRSm8Mwk4JDOtqWQAisG8baZXDuZQ8Zgr
         HvBzffSayX0u/95j+US1GP466JROr0smrj2xxduSz883t4TwVYdJSwptbXWSl6tB5Kzz
         xf/SXFHrBFiWzWfGnnKMdjwYl7saT3I5zXgH/XMrPfjtE4hQAMAUEzQxdkarbAa91ufn
         HV4VlkjoPICFGoV7/L8YgkkHnd08Ib6+WP2ZhD4u5PkA05L/joe1IJUuIHzEimkf5VCj
         YESwudht/ArBLwLGWnRrzhGGSWWLWyQqX8jpCD+EcXaRJ/H4Ddxh656/IuUQHwImZSKZ
         TOnQ==
X-Gm-Message-State: APuU4Z8Idyo72lhN2LWAgmpWCaap89AzljRPVdlMBL6kQoWRB77V+hWk
	64j1wMfUPWUoCFWZtM9nXGAbcn6YF3g7l6om3yKlzk+dp1+Ps4Vya+gcJUVCRVqhGq0=
X-Gm-Gg: AZFdTZcvakkVwi/fIHC0QgIi2SZEJu2EPFMw2AW9aZDmluUFfm4OIhrDIrMms6rCAgw
	wgiBz2oqbPDg+CRqOkCS5osj1CRYguFf1VE2OObpWow83yGeL4TvHlnckgVdWgJN6VuBDnN/AjG
	+7axrR1stoEhSAdDB3ueg3PaITvgu6DjA7RZXh+tT3T+s9x4i5kPseXNd/vnBg7ZaSHK99zk/UD
	8V/evrPnr8fJMb8kuvkGwFdqbOTOPLq0XelZFzyFwHoof0bsVLJV28a+5Hd83E2ZP4joK3x5wQk
	5Re+xJ6dhmM4Pg/Btt9bNs9uMpXDdfOkUggClcquILH7rrvtvG39IO4F63/JsEOFb/40NsC/b7I
	LaaBgCCexXBnmTCd5UP0t+5zEKc0Hjsosy2j6RujxSGtm4jkDBk7xxWZWMcNpVRANU1r8lMwlC5
	xM/npohFY8M/MfFdgs7ZEx66ZRuFUHDIgnfKLNG+mXjMy+uVN0TgzBnfVaVUqCDRzw4qWMvfMPB
	FYBgEqWHwAsNk1Zh33sSF89GEeIRsO2qWYNs2uTHrkl5CmCitYiArl/t+1g+U5zcERrFrZBy/V2
	wVnhkdSVHSrkU93vi2hCr4AJHKChPMDsJMnTT/6PTbadn7CPsj96A4rNiC2B5VlHO9wDUdlB/Zc
	AhPoI5sz5h+TiHUzY0RU=
X-Received: by 2002:a05:7301:7e07:b0:35f:2858:aa4b with SMTP id 5a478bee46e88-38570e23830mr5672889eec.30.1795262860291;
        Sat, 21 Nov 2026 04:07:40 -0800 (PST)
Received: from default-vnic.degu-barley.ts.net ([161.118.211.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm7465314eec.1.2026.11.21.04.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:07:39 -0800 (PST)
From: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chernyav.a@gmail.com,
	Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
Subject: [PATCH v2 2/2] media: i2c: Add Samsung S5K5E8YX camera sensor driver
Date: Sat, 21 Nov 2026 19:07:31 +0700
Message-ID: <20261121120731.2028810-3-huynhtuankiet33@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121120731.2028810-1-huynhtuankiet33@gmail.com>
References: <20261121091907.1190346-1-huynhtuankiet33@gmail.com>
 <20261121120731.2028810-1-huynhtuankiet33@gmail.com>
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

From: Andrii Cherniavskyi <chernyav.a@gmail.com>

Add V4L2 subdev driver for the Samsung S5K5E8YX 5MP CMOS image sensor,
supporting 2592x1944 (30 fps) and 1304x980 (60 fps) RAW10 GRBG modes,
exposure, analogue gain, VBLANK, H/V flip, test patterns, optional
standby GPIO, and selection rectangles.

Signed-off-by: Andrii Cherniavskyi <chernyav.a@gmail.com>
Co-developed-by: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
Signed-off-by: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
---
 MAINTAINERS                  |   1 +
 drivers/media/i2c/Kconfig    |  10 +
 drivers/media/i2c/Makefile   |   1 +
 drivers/media/i2c/s5k5e8yx.c | 972 +++++++++++++++++++++++++++++++++++
 4 files changed, 984 insertions(+)
 create mode 100644 drivers/media/i2c/s5k5e8yx.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b98726c35..5f4fdce90 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25020,6 +25020,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8yx.yaml
+F:	drivers/media/i2c/s5k5e8yx.c
 
 SAMSUNG S5KJN1 CAMERA DRIVER
 M:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 162b8ea02..4ef29f02f 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -885,6 +885,16 @@ config VIDEO_S5K5BAF
 	  This is a V4L2 sensor driver for Samsung S5K5BAF 2M
 	  camera sensor with an embedded SoC image signal processor.
 
+config VIDEO_S5K5E8YX
+	tristate "Samsung S5K5E8YX sensor support"
+	select V4L2_CCI_I2C
+	help
+	  This is a V4L2 sensor driver for Samsung S5K5E8YX 5MP raw
+	  camera sensor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called s5k5e8yx.
+
 config VIDEO_S5K6A3
 	tristate "Samsung S5K6A3 sensor support"
 	help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index a750942e9..da7dc2277 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -137,6 +137,7 @@ obj-$(CONFIG_VIDEO_RJ54N1) += rj54n1cb0c.o
 obj-$(CONFIG_VIDEO_S5C73M3) += s5c73m3/
 obj-$(CONFIG_VIDEO_S5K3M5) += s5k3m5.o
 obj-$(CONFIG_VIDEO_S5K5BAF) += s5k5baf.o
+obj-$(CONFIG_VIDEO_S5K5E8YX) += s5k5e8yx.o
 obj-$(CONFIG_VIDEO_S5K6A3) += s5k6a3.o
 obj-$(CONFIG_VIDEO_S5KJN1) += s5kjn1.o
 obj-$(CONFIG_VIDEO_S5KJN5) += s5kjn5.o
diff --git a/drivers/media/i2c/s5k5e8yx.c b/drivers/media/i2c/s5k5e8yx.c
new file mode 100644
index 000000000..5ad42e2fc
--- /dev/null
+++ b/drivers/media/i2c/s5k5e8yx.c
@@ -0,0 +1,972 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/units.h>
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define S5K5E8YX_LINK_FREQ_420MHZ	420000000ULL
+#define S5K5E8YX_MCLK_FREQ_24MHZ	24000000
+#define S5K5E8YX_DATA_LANES		2
+#define S5K5E8YX_NATIVE_WIDTH		2608
+#define S5K5E8YX_NATIVE_HEIGHT		1960
+
+#define S5K5E8YX_REG_CHIP_ID		CCI_REG16(0x0000)
+#define S5K5E8YX_CHIP_ID		0x5e80
+
+#define S5K5E8YX_REG_CTRL_MODE		CCI_REG8(0x0100)
+#define S5K5E8YX_MODE_STREAMING		BIT(0)
+
+#define S5K5E8YX_REG_ORIENTATION	CCI_REG8(0x0101)
+#define S5K5E8YX_VFLIP			BIT(1)
+#define S5K5E8YX_HFLIP			BIT(0)
+
+#define S5K5E8YX_REG_EXPOSURE		CCI_REG16(0x0202)
+#define S5K5E8YX_EXPOSURE_MIN		8
+#define S5K5E8YX_EXPOSURE_STEP		1
+#define S5K5E8YX_EXPOSURE_MARGIN	4
+
+#define S5K5E8YX_REG_AGAIN		CCI_REG16(0x0204)
+#define S5K5E8YX_AGAIN_MIN		0x020
+#define S5K5E8YX_AGAIN_MAX		0x200
+#define S5K5E8YX_AGAIN_STEP		1
+#define S5K5E8YX_AGAIN_DEFAULT		0x020
+#define S5K5E8YX_AGAIN_SHIFT		5
+
+#define S5K5E8YX_REG_VTS		CCI_REG16(0x0340)
+#define S5K5E8YX_VTS_MAX		0xffff
+#define S5K5E8YX_REG_HTS		CCI_REG16(0x0342)
+#define S5K5E8YX_REG_X_ADDR_START	CCI_REG16(0x0344)
+#define S5K5E8YX_REG_Y_ADDR_START	CCI_REG16(0x0346)
+#define S5K5E8YX_REG_X_ADDR_END		CCI_REG16(0x0348)
+#define S5K5E8YX_REG_Y_ADDR_END		CCI_REG16(0x034a)
+#define S5K5E8YX_REG_X_OUTPUT_SIZE	CCI_REG16(0x034c)
+#define S5K5E8YX_REG_Y_OUTPUT_SIZE	CCI_REG16(0x034e)
+
+#define S5K5E8YX_REG_TEST_PATTERN	CCI_REG8(0x0601)
+
+#define to_s5k5e8yx(_sd)		container_of(_sd, struct s5k5e8yx, sd)
+
+static const s64 s5k5e8yx_link_freq_menu[] = {
+	S5K5E8YX_LINK_FREQ_420MHZ,
+};
+
+/* List of supported formats to cover horizontal and vertical flip controls */
+static const u32 s5k5e8yx_mbus_formats[] = {
+	MEDIA_BUS_FMT_SGRBG10_1X10,	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SBGGR10_1X10,	MEDIA_BUS_FMT_SGBRG10_1X10,
+};
+
+struct s5k5e8yx_reg_list {
+	const struct cci_reg_sequence *regs;
+	unsigned int num_regs;
+};
+
+struct s5k5e8yx_mode {
+	u32 width;				/* Frame width in pixels */
+	u32 height;				/* Frame height in pixels */
+	u32 hts;				/* Horizontal timing size */
+	u32 vts;				/* Default vertical timing size */
+	u32 exposure;				/* Default exposure value */
+	struct v4l2_rect crop;			/* Sensor array crop rect */
+	struct s5k5e8yx_reg_list reg_list;	/* Sensor register setting */
+};
+
+static const char *const s5k5e8yx_test_pattern_menu[] = {
+	"Disabled",
+	"Solid colour",
+	"Colour bars",
+	"Fade to grey colour bars",
+};
+
+static const char *const s5k5e8yx_supply_names[] = {
+	"vdda",		/* Analog power */
+	"vddd",		/* Digital core power */
+	"vddio",	/* Digital I/O power */
+};
+
+#define S5K5E8YX_NUM_SUPPLIES ARRAY_SIZE(s5k5e8yx_supply_names)
+
+struct s5k5e8yx {
+	struct device *dev;
+	struct regmap *regmap;
+	struct clk *mclk;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *standby_gpio;
+	struct regulator_bulk_data supplies[S5K5E8YX_NUM_SUPPLIES];
+
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *hflip;
+
+	const struct s5k5e8yx_mode *mode;
+};
+
+static const struct cci_reg_sequence init_array_setting[] = {
+	{CCI_REG8(0x0100), 0x00},
+	{CCI_REG8(0x3906), 0x7e},
+	{CCI_REG8(0x3c01), 0x0f},
+	{CCI_REG8(0x3c14), 0x00},
+	{CCI_REG8(0x3235), 0x08},
+	{CCI_REG8(0x3063), 0x2e},
+	{CCI_REG8(0x307a), 0x10},
+	{CCI_REG8(0x307b), 0x0e},
+	{CCI_REG8(0x3079), 0x20},
+	{CCI_REG8(0x3070), 0x05},
+	{CCI_REG8(0x3067), 0x06},
+	{CCI_REG8(0x3071), 0x62},
+	{CCI_REG8(0x3072), 0x16},
+	{CCI_REG8(0x3203), 0x43},
+	{CCI_REG8(0x3205), 0x43},
+	{CCI_REG8(0x320b), 0x42},
+	{CCI_REG8(0x3007), 0x00},
+	{CCI_REG8(0x3008), 0x14},
+	{CCI_REG8(0x3020), 0x58},
+	{CCI_REG8(0x300d), 0x34},
+	{CCI_REG8(0x300e), 0x17},
+	{CCI_REG8(0x3021), 0x02},
+	{CCI_REG8(0x3010), 0x59},
+	{CCI_REG8(0x3002), 0x01},
+	{CCI_REG8(0x3005), 0x01},
+	{CCI_REG8(0x3008), 0x04},
+	{CCI_REG8(0x300f), 0x70},
+	{CCI_REG8(0x3010), 0x69},
+	{CCI_REG8(0x3017), 0x10},
+	{CCI_REG8(0x3019), 0x19},
+	{CCI_REG8(0x300c), 0x62},
+	{CCI_REG8(0x3064), 0x10},
+	{CCI_REG8(0x3c08), 0x0e},
+	{CCI_REG8(0x3c09), 0x10},
+	{CCI_REG8(0x3c31), 0x0d},
+	{CCI_REG8(0x3c32), 0xac},
+};
+
+static const struct cci_reg_sequence s5k5e8yx_2592x1944_30fps_mode[] = {
+	{ CCI_REG8(0x0100), 0x00 },
+	{ CCI_REG8(0x0136), 0x18 },
+	{ CCI_REG8(0x0137), 0x00 },
+	{ CCI_REG8(0x0305), 0x06 },
+	{ CCI_REG8(0x0306), 0x18 },
+	{ CCI_REG8(0x0307), 0xa8 },
+	{ CCI_REG8(0x0308), 0x34 },
+	{ CCI_REG8(0x0309), 0x42 },
+	{ CCI_REG8(0x3c1f), 0x00 },
+	{ CCI_REG8(0x3c17), 0x00 },
+	{ CCI_REG8(0x3c0b), 0x04 },
+	{ CCI_REG8(0x3c1c), 0x47 },
+	{ CCI_REG8(0x3c1d), 0x15 },
+	{ CCI_REG8(0x3c14), 0x04 },
+	{ CCI_REG8(0x3c16), 0x00 },
+	{ CCI_REG8(0x0820), 0x03 },
+	{ CCI_REG8(0x0821), 0x44 },
+	{ CCI_REG8(0x0114), 0x01 },
+	{ S5K5E8YX_REG_X_ADDR_START,  0x0000 },
+	{ S5K5E8YX_REG_Y_ADDR_START,  0x0008 },
+	{ S5K5E8YX_REG_X_ADDR_END,    0x0a27 },
+	{ S5K5E8YX_REG_Y_ADDR_END,    0x079f },
+	{ S5K5E8YX_REG_X_OUTPUT_SIZE, 0x0a20 },
+	{ S5K5E8YX_REG_Y_OUTPUT_SIZE, 0x0798 },
+	{ CCI_REG8(0x0900), 0x00 },
+	{ CCI_REG8(0x0901), 0x00 },
+	{ CCI_REG8(0x0381), 0x01 },
+	{ CCI_REG8(0x0383), 0x01 },
+	{ CCI_REG8(0x0385), 0x01 },
+	{ CCI_REG8(0x0387), 0x01 },
+	{ S5K5E8YX_REG_VTS, 0x07b0 },
+	{ S5K5E8YX_REG_HTS, 0x0b28 },
+	{ CCI_REG8(0x0200), 0x00 },
+	{ CCI_REG8(0x0201), 0x00 },
+	{ S5K5E8YX_REG_EXPOSURE, 0x03de },
+	{ CCI_REG8(0x3303), 0x02 },
+	{ CCI_REG8(0x3400), 0x00 },
+	{ CCI_REG8(0x323b), 0x02 },
+	{ CCI_REG8(0x3301), 0x00 },
+	{ CCI_REG8(0x3321), 0x04 },
+	{ CCI_REG8(0x3306), 0x00 },
+	{ CCI_REG8(0x3307), 0x08 },
+	{ CCI_REG8(0x3308), 0x0a },
+	{ CCI_REG8(0x3309), 0x27 },
+	{ CCI_REG8(0x330a), 0x01 },
+	{ CCI_REG8(0x330b), 0x01 },
+	{ CCI_REG8(0x330e), 0x00 },
+	{ CCI_REG8(0x330f), 0x08 },
+	{ CCI_REG8(0x3310), 0x07 },
+	{ CCI_REG8(0x3311), 0x9f },
+	{ CCI_REG8(0x3312), 0x01 },
+	{ CCI_REG8(0x3313), 0x01 },
+};
+
+static const struct cci_reg_sequence s5k5e8yx_1304x980_60fps_mode[] = {
+	{ CCI_REG8(0x0100), 0x00 },
+	{ CCI_REG8(0x0136), 0x18 },
+	{ CCI_REG8(0x0137), 0x00 },
+	{ CCI_REG8(0x0305), 0x06 },
+	{ CCI_REG8(0x0306), 0x14 },
+	{ CCI_REG8(0x0307), 0xa8 },
+	{ CCI_REG8(0x0308), 0x1f },
+	{ CCI_REG8(0x0309), 0x42 },
+	{ CCI_REG8(0x3c1f), 0x00 },
+	{ CCI_REG8(0x3c17), 0x00 },
+	{ CCI_REG8(0x3c0b), 0x04 },
+	{ CCI_REG8(0x3c1c), 0x47 },
+	{ CCI_REG8(0x3c1d), 0x15 },
+	{ CCI_REG8(0x3c14), 0x04 },
+	{ CCI_REG8(0x3c16), 0x00 },
+	{ CCI_REG8(0x0820), 0x02 },
+	{ CCI_REG8(0x0821), 0x58 },
+	{ CCI_REG8(0x0114), 0x01 },
+	{ S5K5E8YX_REG_X_ADDR_START,  0x0000 },
+	{ S5K5E8YX_REG_Y_ADDR_START,  0x0000 },
+	{ S5K5E8YX_REG_X_ADDR_END,    0x0a2f },
+	{ S5K5E8YX_REG_Y_ADDR_END,    0x07a7 },
+	{ S5K5E8YX_REG_X_OUTPUT_SIZE, 0x0518 },
+	{ S5K5E8YX_REG_Y_OUTPUT_SIZE, 0x03d4 },
+	{ CCI_REG8(0x0900), 0x01 },
+	{ CCI_REG8(0x0901), 0x22 },
+	{ CCI_REG8(0x0381), 0x01 },
+	{ CCI_REG8(0x0383), 0x01 },
+	{ CCI_REG8(0x0385), 0x01 },
+	{ CCI_REG8(0x0387), 0x03 },
+	{ S5K5E8YX_REG_VTS, 0x03f1 },
+	{ S5K5E8YX_REG_HTS, 0x0ae0 },
+	{ CCI_REG8(0x0200), 0x00 },
+	{ CCI_REG8(0x0201), 0x00 },
+	{ S5K5E8YX_REG_EXPOSURE, 0x03de },
+	{ CCI_REG8(0x3303), 0x02 },
+	{ CCI_REG8(0x3400), 0x00 },
+	{ CCI_REG8(0x323b), 0x02 },
+	{ CCI_REG8(0x3301), 0x00 },
+	{ CCI_REG8(0x3321), 0x04 },
+	{ CCI_REG8(0x3306), 0x00 },
+	{ CCI_REG8(0x3309), 0x2f },
+	{ CCI_REG8(0x330a), 0x01 },
+	{ CCI_REG8(0x330b), 0x01 },
+	{ CCI_REG8(0x330e), 0x00 },
+	{ CCI_REG8(0x330f), 0x00 },
+	{ CCI_REG8(0x3310), 0x07 },
+	{ CCI_REG8(0x3311), 0xa7 },
+	{ CCI_REG8(0x3312), 0x03 },
+	{ CCI_REG8(0x3313), 0x01 },
+};
+
+static const struct s5k5e8yx_mode s5k5e8yx_supported_modes[] = {
+	{
+		.width = 2592,
+		.height = 1944,
+		.vts = 1968,
+		.hts = 2856,
+		.exposure = 990,
+		.crop = {
+			.left = 0,
+			.top = 8,
+			.width = 2592,
+			.height = 1944,
+		},
+		.reg_list = {
+			.regs = s5k5e8yx_2592x1944_30fps_mode,
+			.num_regs = ARRAY_SIZE(s5k5e8yx_2592x1944_30fps_mode),
+		},
+	},
+	{
+		.width = 1304,
+		.height = 980,
+		.vts = 1009,
+		.hts = 2784,
+		.exposure = 990,
+		.crop = {
+			.left = 0,
+			.top = 0,
+			.width = 2608,
+			.height = 1960,
+		},
+		.reg_list = {
+			.regs = s5k5e8yx_1304x980_60fps_mode,
+			.num_regs = ARRAY_SIZE(s5k5e8yx_1304x980_60fps_mode),
+		},
+	},
+};
+
+static int s5k5e8yx_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct s5k5e8yx *s5k5e8yx =
+		container_of(ctrl->handler, struct s5k5e8yx, ctrl_handler);
+	const struct s5k5e8yx_mode *mode = s5k5e8yx->mode;
+	s64 exposure_max;
+	int ret;
+
+	/* Propagate change of current control to all related controls */
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		/* Update max exposure while meeting expected vblanking */
+		exposure_max =
+			mode->height + ctrl->val - S5K5E8YX_EXPOSURE_MARGIN;
+		__v4l2_ctrl_modify_range(s5k5e8yx->exposure,
+					 s5k5e8yx->exposure->minimum,
+					 exposure_max, s5k5e8yx->exposure->step,
+					 s5k5e8yx->exposure->default_value);
+		break;
+	}
+
+	/* V4L2 controls are applied, when sensor is powered up for streaming */
+	if (!pm_runtime_get_if_active(s5k5e8yx->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = cci_write(s5k5e8yx->regmap, S5K5E8YX_REG_AGAIN, ctrl->val,
+				NULL);
+		break;
+	case V4L2_CID_EXPOSURE:
+		ret = cci_write(s5k5e8yx->regmap, S5K5E8YX_REG_EXPOSURE,
+				ctrl->val, NULL);
+		break;
+	case V4L2_CID_VBLANK:
+		ret = cci_write(s5k5e8yx->regmap, S5K5E8YX_REG_VTS,
+				ctrl->val + mode->height, NULL);
+		break;
+	case V4L2_CID_VFLIP:
+	case V4L2_CID_HFLIP:
+		ret = cci_write(s5k5e8yx->regmap, S5K5E8YX_REG_ORIENTATION,
+				(s5k5e8yx->vflip->val ? S5K5E8YX_VFLIP : 0) |
+					(s5k5e8yx->hflip->val ? S5K5E8YX_HFLIP :
+								0),
+				NULL);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = cci_write(s5k5e8yx->regmap, S5K5E8YX_REG_TEST_PATTERN,
+				ctrl->val, NULL);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(s5k5e8yx->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops s5k5e8yx_ctrl_ops = {
+	.s_ctrl = s5k5e8yx_set_ctrl,
+};
+
+static inline u64 s5k5e8yx_freq_to_pixel_rate(const u64 freq)
+{
+	return div_u64(freq * 2 * S5K5E8YX_DATA_LANES, 10);
+}
+
+static int s5k5e8yx_init_controls(struct s5k5e8yx *s5k5e8yx)
+{
+	struct v4l2_ctrl_handler *ctrl_hdlr = &s5k5e8yx->ctrl_handler;
+	const struct s5k5e8yx_mode *mode = s5k5e8yx->mode;
+	s64 pixel_rate, hblank, vblank, exposure_max;
+	struct v4l2_fwnode_device_properties props;
+	int ret;
+
+	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+
+	s5k5e8yx->link_freq =
+		v4l2_ctrl_new_int_menu(ctrl_hdlr, &s5k5e8yx_ctrl_ops,
+				       V4L2_CID_LINK_FREQ,
+				       ARRAY_SIZE(s5k5e8yx_link_freq_menu) - 1,
+				       0, s5k5e8yx_link_freq_menu);
+	if (s5k5e8yx->link_freq)
+		s5k5e8yx->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	pixel_rate = s5k5e8yx_freq_to_pixel_rate(s5k5e8yx_link_freq_menu[0]);
+	s5k5e8yx->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &s5k5e8yx_ctrl_ops,
+						 V4L2_CID_PIXEL_RATE, 0,
+						 pixel_rate, 1, pixel_rate);
+
+	hblank = mode->hts - mode->width;
+	s5k5e8yx->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &s5k5e8yx_ctrl_ops,
+					     V4L2_CID_HBLANK, hblank, hblank, 1,
+					     hblank);
+	if (s5k5e8yx->hblank)
+		s5k5e8yx->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	vblank = mode->vts - mode->height;
+	s5k5e8yx->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &s5k5e8yx_ctrl_ops,
+					     V4L2_CID_VBLANK, vblank,
+					     S5K5E8YX_VTS_MAX - mode->height, 1,
+					     vblank);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &s5k5e8yx_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  S5K5E8YX_AGAIN_MIN, S5K5E8YX_AGAIN_MAX,
+			  S5K5E8YX_AGAIN_STEP, S5K5E8YX_AGAIN_DEFAULT);
+
+	exposure_max = mode->vts - S5K5E8YX_EXPOSURE_MARGIN;
+	s5k5e8yx->exposure =
+		v4l2_ctrl_new_std(ctrl_hdlr, &s5k5e8yx_ctrl_ops,
+				  V4L2_CID_EXPOSURE, S5K5E8YX_EXPOSURE_MIN,
+				  exposure_max, S5K5E8YX_EXPOSURE_STEP,
+				  mode->exposure);
+
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &s5k5e8yx_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(s5k5e8yx_test_pattern_menu) - 1,
+				     0, 0, s5k5e8yx_test_pattern_menu);
+
+	s5k5e8yx->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &s5k5e8yx_ctrl_ops,
+					    V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (s5k5e8yx->hflip)
+		s5k5e8yx->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	s5k5e8yx->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &s5k5e8yx_ctrl_ops,
+					    V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (s5k5e8yx->vflip)
+		s5k5e8yx->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	ret = v4l2_fwnode_device_parse(s5k5e8yx->dev, &props);
+	if (ret)
+		goto error_free_hdlr;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &s5k5e8yx_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error_free_hdlr;
+
+	s5k5e8yx->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+error_free_hdlr:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static int s5k5e8yx_enable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state, u32 pad,
+				   u64 streams_mask)
+{
+	struct s5k5e8yx *s5k5e8yx = to_s5k5e8yx(sd);
+	const struct s5k5e8yx_reg_list *reg_list = &s5k5e8yx->mode->reg_list;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(s5k5e8yx->dev);
+	if (ret)
+		return ret;
+
+	cci_multi_reg_write(s5k5e8yx->regmap, init_array_setting,
+			    ARRAY_SIZE(init_array_setting), &ret);
+	cci_multi_reg_write(s5k5e8yx->regmap, reg_list->regs,
+			    reg_list->num_regs, &ret);
+	if (ret)
+		goto error;
+
+	ret = __v4l2_ctrl_handler_setup(s5k5e8yx->sd.ctrl_handler);
+
+	cci_write(s5k5e8yx->regmap, S5K5E8YX_REG_CTRL_MODE,
+		  S5K5E8YX_MODE_STREAMING, &ret);
+	if (ret)
+		goto error;
+
+	__v4l2_ctrl_grab(s5k5e8yx->hflip, true);
+	__v4l2_ctrl_grab(s5k5e8yx->vflip, true);
+
+	return 0;
+
+error:
+	dev_err(s5k5e8yx->dev, "failed to start streaming: %d\n", ret);
+	pm_runtime_put_autosuspend(s5k5e8yx->dev);
+
+	return ret;
+}
+
+static int s5k5e8yx_disable_streams(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state, u32 pad,
+				    u64 streams_mask)
+{
+	struct s5k5e8yx *s5k5e8yx = to_s5k5e8yx(sd);
+	int ret;
+
+	ret = cci_write(s5k5e8yx->regmap, S5K5E8YX_REG_CTRL_MODE, 0, NULL);
+	if (ret)
+		dev_err(s5k5e8yx->dev, "failed to stop streaming: %d\n", ret);
+
+	__v4l2_ctrl_grab(s5k5e8yx->hflip, false);
+	__v4l2_ctrl_grab(s5k5e8yx->vflip, false);
+
+	pm_runtime_put_autosuspend(s5k5e8yx->dev);
+
+	return ret;
+}
+
+static u32 s5k5e8yx_get_format_code(struct s5k5e8yx *s5k5e8yx)
+{
+	unsigned int i;
+
+	i = (s5k5e8yx->vflip->val ? 2 : 0) | (s5k5e8yx->hflip->val ? 1 : 0);
+
+	return s5k5e8yx_mbus_formats[i];
+}
+
+static void s5k5e8yx_update_pad_format(struct s5k5e8yx *s5k5e8yx,
+				       const struct s5k5e8yx_mode *mode,
+				       struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->code = s5k5e8yx_get_format_code(s5k5e8yx);
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+}
+
+static int s5k5e8yx_set_pad_format(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_format *fmt)
+{
+	struct s5k5e8yx *s5k5e8yx = to_s5k5e8yx(sd);
+	s64 hblank, vblank, exposure_max;
+	const struct s5k5e8yx_mode *mode;
+
+	mode = v4l2_find_nearest_size(s5k5e8yx_supported_modes,
+				      ARRAY_SIZE(s5k5e8yx_supported_modes),
+				      width, height, fmt->format.width,
+				      fmt->format.height);
+
+	s5k5e8yx_update_pad_format(s5k5e8yx, mode, &fmt->format);
+
+	/* Format code could be updated with respect to flip controls */
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY || s5k5e8yx->mode == mode)
+		goto set_format;
+
+	hblank = mode->hts - mode->width;
+	__v4l2_ctrl_modify_range(s5k5e8yx->hblank, hblank, hblank, 1, hblank);
+
+	vblank = mode->vts - mode->height;
+	__v4l2_ctrl_modify_range(s5k5e8yx->vblank, vblank,
+				 S5K5E8YX_VTS_MAX - mode->height, 1, vblank);
+	__v4l2_ctrl_s_ctrl(s5k5e8yx->vblank, vblank);
+
+	exposure_max = mode->vts - S5K5E8YX_EXPOSURE_MARGIN;
+	__v4l2_ctrl_modify_range(s5k5e8yx->exposure, S5K5E8YX_EXPOSURE_MIN,
+				 exposure_max, S5K5E8YX_EXPOSURE_STEP,
+				 mode->exposure);
+	__v4l2_ctrl_s_ctrl(s5k5e8yx->exposure, mode->exposure);
+
+	if (s5k5e8yx->sd.ctrl_handler->error)
+		return s5k5e8yx->sd.ctrl_handler->error;
+
+	s5k5e8yx->mode = mode;
+
+set_format:
+	*v4l2_subdev_state_get_format(state, 0) = fmt->format;
+
+	return 0;
+}
+
+static int s5k5e8yx_enum_mbus_code(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct s5k5e8yx *s5k5e8yx = to_s5k5e8yx(sd);
+
+	/* Media bus code index is constant, but code formats are not */
+	if (code->index > 0)
+		return -EINVAL;
+
+	code->code = s5k5e8yx_get_format_code(s5k5e8yx);
+
+	return 0;
+}
+
+static int s5k5e8yx_enum_frame_size(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *sd_state,
+				    struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct s5k5e8yx *s5k5e8yx = to_s5k5e8yx(sd);
+
+	if (fse->index >= ARRAY_SIZE(s5k5e8yx_supported_modes))
+		return -EINVAL;
+
+	if (fse->code != s5k5e8yx_get_format_code(s5k5e8yx))
+		return -EINVAL;
+
+	fse->min_width = s5k5e8yx_supported_modes[fse->index].width;
+	fse->max_width = fse->min_width;
+	fse->min_height = s5k5e8yx_supported_modes[fse->index].height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static int s5k5e8yx_get_selection(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_selection *sel)
+{
+	const struct v4l2_mbus_framefmt *fmt;
+	const struct s5k5e8yx_mode *mode;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r = (struct v4l2_rect){
+			.left = 0,
+			.top = 0,
+			.width = S5K5E8YX_NATIVE_WIDTH,
+			.height = S5K5E8YX_NATIVE_HEIGHT,
+		};
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+		fmt = v4l2_subdev_state_get_format(state, 0);
+		mode = v4l2_find_nearest_size(s5k5e8yx_supported_modes,
+					      ARRAY_SIZE(s5k5e8yx_supported_modes),
+					      width, height, fmt->width,
+					      fmt->height);
+		sel->r = mode->crop;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int s5k5e8yx_init_state(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state)
+{
+	struct s5k5e8yx *s5k5e8yx = to_s5k5e8yx(sd);
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.pad = 0,
+		.format = {
+			/* Media bus code depends on current flip controls */
+			.width = s5k5e8yx->mode->width,
+			.height = s5k5e8yx->mode->height,
+		},
+	};
+
+	return s5k5e8yx_set_pad_format(sd, NULL, state, &fmt);
+}
+
+static const struct v4l2_subdev_video_ops s5k5e8yx_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops s5k5e8yx_pad_ops = {
+	.set_fmt = s5k5e8yx_set_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.get_selection = s5k5e8yx_get_selection,
+	.enum_mbus_code = s5k5e8yx_enum_mbus_code,
+	.enum_frame_size = s5k5e8yx_enum_frame_size,
+	.enable_streams = s5k5e8yx_enable_streams,
+	.disable_streams = s5k5e8yx_disable_streams,
+};
+
+static const struct v4l2_subdev_ops s5k5e8yx_subdev_ops = {
+	.video = &s5k5e8yx_video_ops,
+	.pad = &s5k5e8yx_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops s5k5e8yx_internal_ops = {
+	.init_state = s5k5e8yx_init_state,
+};
+
+static const struct media_entity_operations s5k5e8yx_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int s5k5e8yx_identify_sensor(struct s5k5e8yx *s5k5e8yx)
+{
+	u64 val;
+	int ret;
+
+	ret = cci_read(s5k5e8yx->regmap, S5K5E8YX_REG_CHIP_ID, &val, NULL);
+	if (ret) {
+		dev_err(s5k5e8yx->dev, "failed to read chip id: %d\n", ret);
+		return ret;
+	}
+
+	if (val != S5K5E8YX_CHIP_ID) {
+		dev_err(s5k5e8yx->dev, "chip id mismatch: %x!=%llx\n",
+			S5K5E8YX_CHIP_ID, val);
+		return -ENODEV;
+	}
+
+	dev_dbg(s5k5e8yx->dev, "identified Samsung S5K5E8 sensor (chip id 0x%04llx)\n",
+		val);
+
+	return 0;
+}
+
+static int s5k5e8yx_check_hwcfg(struct s5k5e8yx *s5k5e8yx)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(s5k5e8yx->dev), *ep;
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus = {
+			.mipi_csi2 = {
+				.num_data_lanes = S5K5E8YX_DATA_LANES,
+			},
+		},
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	unsigned long freq_bitmap;
+	int ret;
+
+	if (!fwnode)
+		return -ENODEV;
+
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep)
+		return -EINVAL;
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != S5K5E8YX_DATA_LANES) {
+		dev_err(s5k5e8yx->dev, "Invalid number of data lanes: %u\n",
+			bus_cfg.bus.mipi_csi2.num_data_lanes);
+		ret = -EINVAL;
+		goto endpoint_free;
+	}
+
+	ret = v4l2_link_freq_to_bitmap(s5k5e8yx->dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       s5k5e8yx_link_freq_menu,
+				       ARRAY_SIZE(s5k5e8yx_link_freq_menu),
+				       &freq_bitmap);
+
+endpoint_free:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
+static int s5k5e8yx_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct s5k5e8yx *s5k5e8yx = to_s5k5e8yx(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(S5K5E8YX_NUM_SUPPLIES, s5k5e8yx->supplies);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(s5k5e8yx->mclk);
+	if (ret)
+		goto disable_regulators;
+
+	usleep_range(1000, 2000);
+
+	gpiod_set_value_cansleep(s5k5e8yx->reset_gpio, 0);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(s5k5e8yx->standby_gpio, 0);
+
+	usleep_range(10000, 11000);
+
+	return 0;
+
+disable_regulators:
+	regulator_bulk_disable(S5K5E8YX_NUM_SUPPLIES, s5k5e8yx->supplies);
+
+	return ret;
+}
+
+static int s5k5e8yx_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct s5k5e8yx *s5k5e8yx = to_s5k5e8yx(sd);
+
+	gpiod_set_value_cansleep(s5k5e8yx->standby_gpio, 1);
+	gpiod_set_value_cansleep(s5k5e8yx->reset_gpio, 1);
+
+	clk_disable_unprepare(s5k5e8yx->mclk);
+
+	regulator_bulk_disable(S5K5E8YX_NUM_SUPPLIES, s5k5e8yx->supplies);
+
+	return 0;
+}
+
+static int s5k5e8yx_probe(struct i2c_client *client)
+{
+	struct s5k5e8yx *s5k5e8yx;
+	unsigned long freq;
+	unsigned int i;
+	int ret;
+
+	s5k5e8yx = devm_kzalloc(&client->dev, sizeof(*s5k5e8yx), GFP_KERNEL);
+	if (!s5k5e8yx)
+		return -ENOMEM;
+
+	s5k5e8yx->dev = &client->dev;
+	v4l2_i2c_subdev_init(&s5k5e8yx->sd, client, &s5k5e8yx_subdev_ops);
+
+	s5k5e8yx->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(s5k5e8yx->regmap))
+		return dev_err_probe(s5k5e8yx->dev, PTR_ERR(s5k5e8yx->regmap),
+				     "failed to init CCI\n");
+
+	s5k5e8yx->mclk = devm_v4l2_sensor_clk_get(s5k5e8yx->dev, NULL);
+	if (IS_ERR(s5k5e8yx->mclk))
+		return dev_err_probe(s5k5e8yx->dev, PTR_ERR(s5k5e8yx->mclk),
+				     "failed to get MCLK clock\n");
+
+	freq = clk_get_rate(s5k5e8yx->mclk);
+	if (freq != S5K5E8YX_MCLK_FREQ_24MHZ)
+		return dev_err_probe(s5k5e8yx->dev, -EINVAL,
+				     "MCLK clock frequency %lu is not supported\n",
+				     freq);
+
+	ret = s5k5e8yx_check_hwcfg(s5k5e8yx);
+	if (ret)
+		return dev_err_probe(s5k5e8yx->dev, ret,
+				     "failed to check HW configuration\n");
+
+	s5k5e8yx->reset_gpio =
+		devm_gpiod_get_optional(s5k5e8yx->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(s5k5e8yx->reset_gpio))
+		return dev_err_probe(s5k5e8yx->dev,
+				     PTR_ERR(s5k5e8yx->reset_gpio),
+				     "failed to get reset GPIO\n");
+
+	s5k5e8yx->standby_gpio =
+		devm_gpiod_get_optional(s5k5e8yx->dev, "standby", GPIOD_OUT_HIGH);
+	if (IS_ERR(s5k5e8yx->standby_gpio))
+		return dev_err_probe(s5k5e8yx->dev,
+				     PTR_ERR(s5k5e8yx->standby_gpio),
+				     "failed to get standby GPIO\n");
+
+	for (i = 0; i < S5K5E8YX_NUM_SUPPLIES; i++)
+		s5k5e8yx->supplies[i].supply = s5k5e8yx_supply_names[i];
+
+	ret = devm_regulator_bulk_get(s5k5e8yx->dev, S5K5E8YX_NUM_SUPPLIES,
+				      s5k5e8yx->supplies);
+	if (ret)
+		return dev_err_probe(s5k5e8yx->dev, ret,
+				     "failed to get supply regulators\n");
+
+	ret = s5k5e8yx_power_on(s5k5e8yx->dev);
+	if (ret)
+		return ret;
+
+	ret = s5k5e8yx_identify_sensor(s5k5e8yx);
+	if (ret) {
+		dev_err_probe(s5k5e8yx->dev, ret, "failed to find sensor\n");
+		goto power_off;
+	}
+
+	s5k5e8yx->mode = &s5k5e8yx_supported_modes[0];
+	ret = s5k5e8yx_init_controls(s5k5e8yx);
+	if (ret) {
+		dev_err_probe(s5k5e8yx->dev, ret, "failed to init controls\n");
+		goto power_off;
+	}
+
+	s5k5e8yx->sd.state_lock = s5k5e8yx->ctrl_handler.lock;
+	s5k5e8yx->sd.internal_ops = &s5k5e8yx_internal_ops;
+	s5k5e8yx->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	s5k5e8yx->sd.entity.ops = &s5k5e8yx_subdev_entity_ops;
+	s5k5e8yx->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	s5k5e8yx->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&s5k5e8yx->sd.entity, 1, &s5k5e8yx->pad);
+	if (ret) {
+		dev_err_probe(s5k5e8yx->dev, ret,
+			      "failed to init media entity pads\n");
+		goto v4l2_ctrl_handler_free;
+	}
+
+	ret = v4l2_subdev_init_finalize(&s5k5e8yx->sd);
+	if (ret < 0) {
+		dev_err_probe(s5k5e8yx->dev, ret,
+			      "failed to finalize v4l2 subdev\n");
+		goto media_entity_cleanup;
+	}
+
+	pm_runtime_set_active(s5k5e8yx->dev);
+	pm_runtime_enable(s5k5e8yx->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&s5k5e8yx->sd);
+	if (ret < 0) {
+		dev_err_probe(s5k5e8yx->dev, ret,
+			      "failed to register V4L2 subdev\n");
+		goto subdev_cleanup;
+	}
+
+	pm_runtime_set_autosuspend_delay(s5k5e8yx->dev, 1000);
+	pm_runtime_use_autosuspend(s5k5e8yx->dev);
+	pm_runtime_idle(s5k5e8yx->dev);
+
+	return 0;
+
+subdev_cleanup:
+	v4l2_subdev_cleanup(&s5k5e8yx->sd);
+	pm_runtime_disable(s5k5e8yx->dev);
+	pm_runtime_set_suspended(s5k5e8yx->dev);
+
+media_entity_cleanup:
+	media_entity_cleanup(&s5k5e8yx->sd.entity);
+
+v4l2_ctrl_handler_free:
+	v4l2_ctrl_handler_free(s5k5e8yx->sd.ctrl_handler);
+
+power_off:
+	s5k5e8yx_power_off(s5k5e8yx->dev);
+
+	return ret;
+}
+
+static void s5k5e8yx_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct s5k5e8yx *s5k5e8yx = to_s5k5e8yx(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(s5k5e8yx->dev);
+
+	if (!pm_runtime_status_suspended(s5k5e8yx->dev)) {
+		s5k5e8yx_power_off(s5k5e8yx->dev);
+		pm_runtime_set_suspended(s5k5e8yx->dev);
+	}
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(s5k5e8yx_pm_ops, s5k5e8yx_power_off,
+				 s5k5e8yx_power_on, NULL);
+
+static const struct of_device_id s5k5e8yx_of_match[] = {
+	{ .compatible = "samsung,s5k5e8yx" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, s5k5e8yx_of_match);
+
+static struct i2c_driver s5k5e8yx_i2c_driver = {
+	.driver = {
+		.name = "s5k5e8yx",
+		.pm = pm_ptr(&s5k5e8yx_pm_ops),
+		.of_match_table = s5k5e8yx_of_match,
+	},
+	.probe = s5k5e8yx_probe,
+	.remove = s5k5e8yx_remove,
+};
+
+module_i2c_driver(s5k5e8yx_i2c_driver);
+
+MODULE_AUTHOR("Andrii Cherniavskyi <chernyav.a@gmail.com>");
+MODULE_DESCRIPTION("Samsung S5K5E8YX image sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

