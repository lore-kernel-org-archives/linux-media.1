Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5620D41C2F4;
	Wed, 15 Jul 2026 17:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136765; cv=none; b=Cw0kpCb3mYAyZ6n4ejtsgXWJoE5WHTuHFBCqQwQ3AJm0apZGjy1nYnseKP5WeKpGNAmwOezmuzftSGxEHfe0QRjdnE19oYoZuS7EALyFCKfMqrf9SWSUkfaJEWv8K/E5iu8VltU/5nCdXKBHwh0CSo7Ebh2JPoujBCUdpH7tGiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136765; c=relaxed/simple;
	bh=3r+JPtuKUOHsf5kbLxab13t3wRYwq0jVv1ZR9JJdXKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EUJZ4o57zhREmEIe9qz1PJxwNtHSGMk57TUrvdT2ZqEuPsKSHc/InfRzKcU9SqB6bM5au96poPQMLqMwFmpQD/OWI7NORyJQbHs9F/pYUg7WWtIw15ocjDKHx64se7O8oF1r+4SV6/clUVyfv1hACk5z5fcaesOAoCj9s8QINy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K6SkTmyh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K6SkTmyh"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AB59104C;
	Wed, 15 Jul 2026 19:31:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784136700;
	bh=3r+JPtuKUOHsf5kbLxab13t3wRYwq0jVv1ZR9JJdXKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K6SkTmyhdQLBtFyXfXya9G/ZksFsYtV23Gvae+wOan4qG0/9jR6Rz0TPFrY3hdRg/
	 WGAC5YdLU0QqvzxJNocJyS68dI+QFYeGiiIBqOysIY/34nF14BG3y6KwRoyz9u+jsW
	 YTndGpNaRZPgrrhebXCq+Ln62W6xPzMCbHpAMSk0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 15 Jul 2026 23:01:29 +0530
Subject: [PATCH 2/2] media: i2c: Add a driver for Sony IMX708
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx708-v1-2-1f36f54e14d4@ideasonboard.com>
References: <20260715-imx708-v1-0-1f36f54e14d4@ideasonboard.com>
In-Reply-To: <20260715-imx708-v1-0-1f36f54e14d4@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=40930;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=3r+JPtuKUOHsf5kbLxab13t3wRYwq0jVv1ZR9JJdXKw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqV8QhYzJ7Ct6tfRGUwUVd+nXmBcpUbGJm1OP19
 L0sPqMRjWyJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCalfEIQAKCRBD3pH5JJpx
 RWfrEACAwWVKnnANCEOGbQLIpCjPySCzZjv9nGsejtZ5SD9XDD5IMyi89EBm2SFYKGT94fFza3M
 KAys+/luCUBKJpR+z9/KFjP3hinSrBPcvKbUrQ9E538HQBt5hK0edG25DCV+idGO26RxXKG+3MC
 Ul+ypXWG79ypmQE1JxBvhC+MTHo30ouUuZFaluw+bzqn9d0s/SnI3bVjw2yaN9Oay9IebKrwiJt
 wKJM6EW7xUvrWfPhY0nMntHXNtTa9/urDVEkejowi3wBA3STrF3702sykl9gDI7qeap+9uxAODP
 44ER/k6nQGolEvyPtf0ZOXsw2T1pU4Wj/dU9BjjBcmcknQLBbjo/41HnrLiTVol+af9DmoFm+im
 pSyGbZcOdJ3Kul1gZkNuNT66jfrK8TaZfKRCZGUhYs9E1rtz1Bf2ayTUp6VIlJhYqynPgibwcjZ
 a6SDHyUCNtRgKT9QF9jK7nNL27UkxzXPAUg6DOpKdoCKeOaxwoHXOKkhCF/+TFtR+/yGAKMVCXJ
 DIFiGg7s+QN6mMgAKZlCPBuCiflyPGyKfWePUllVASBVHTYBjfpjUocdnQG+9qeRS0jPI6uP8xM
 YV0iNUykO+8O8bnV3v5rP27k05oMZToNFoqz6avXM3IF6x7mHHpPaHX+zwFlebFkLmIngrQbn/V
 vztSxajxAsl1xdA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Sony IMX708 is an 11.9 Megapixel CMOS sensor with a 16:9 aspect ratio.
It is a quad-bayer sensor with support for remosaicing the output to
a normal 2x2 bayer pattern.

This basic driver adds supports for capturing the full active-area of
4608x2592, up to 14.35fps. The following features are supported by the
driver:
- MIPI RAW10 output
- Fixed quad-bayer correction
- Multiple link frequencies (different IOP_PLL_MPY)
- VBLANK control for flexible frame-rate
- Analogue gain and exposure control
- Extremely long exposure time with LONG_EXP_SHIFT
- Test pattern support

The following features are currently not supported and may be added
later. Some of them depend on the new common raw sensor model:
- Embedded data stream
- Freely configurable crop (analog and digital)
- 2x2 binning
- Quad-bayer multi-exposure HDR support
- HBLANK control
- 4-lane support
- Configurable clock-tree
- Flexible quad-bayer correction

Co-developed-by: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Signed-off-by: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 MAINTAINERS                |    1 +
 drivers/media/i2c/Kconfig  |   11 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/imx708.c | 1255 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1268 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b0e3abfd88a9..448a7a801e94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25275,6 +25275,7 @@ M:	Jai Luthra <jai.luthra@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
+F:	drivers/media/i2c/imx708.c
 
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 7ffccba897ae..08ccadaef467 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -308,6 +308,17 @@ config VIDEO_IMX678
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx678.
 
+config VIDEO_IMX708
+	tristate "Sony IMX708 sensor support"
+	depends on GPIOLIB
+	select V4L2_CCI_I2C
+	help
+	  This is a Video4Linux2 sensor driver for the Sony
+	  IMX708 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called imx708.
+
 config VIDEO_MAX9271_LIB
 	tristate
 
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index d04bd5724552..15dc9755e321 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_VIDEO_IMX355) += imx355.o
 obj-$(CONFIG_VIDEO_IMX412) += imx412.o
 obj-$(CONFIG_VIDEO_IMX415) += imx415.o
 obj-$(CONFIG_VIDEO_IMX678) += imx678.o
+obj-$(CONFIG_VIDEO_IMX708) += imx708.o
 obj-$(CONFIG_VIDEO_IMX471) += imx471.o
 obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
 obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
diff --git a/drivers/media/i2c/imx708.c b/drivers/media/i2c/imx708.c
new file mode 100644
index 000000000000..052474befc5e
--- /dev/null
+++ b/drivers/media/i2c/imx708.c
@@ -0,0 +1,1255 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A V4L2 driver for Sony IMX708
+ *
+ * Copyright (C) 2026 Ideas on Board Oy
+ * Copyright (C) 2022 Raspberry Pi Ltd
+ */
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-cci.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mediabus.h>
+#include <media/v4l2-subdev.h>
+
+/* Chip ID */
+#define IMX708_REG_CHIP_ID		CCI_REG16(0x0016)
+#define IMX708_CHIP_ID			0x0708
+
+#define IMX708_REG_MODE_SELECT		CCI_REG8(0x0100)
+#define IMX708_MODE_STANDBY		0x00
+#define IMX708_MODE_STREAMING		0x01
+
+#define IMX708_REG_ORIENTATION		CCI_REG8(0x0101)
+
+#define IMX708_INCLK_FREQ		24000000
+
+/* Pixel rate  */
+#define IMX708_PIXEL_RATE		595200000
+
+/* PLL */
+#define IMX708_REG_IVT_PXCK_DIV		CCI_REG8(0x0301)
+#define IMX708_REG_IVT_SYCK_DIV		CCI_REG8(0x0303)
+#define IMX708_REG_IVT_PREPLLCK_DIV	CCI_REG8(0x0305)
+#define IMX708_REG_IVT_PLL_MPY		CCI_REG16(0x0306)
+#define IMX708_REG_IOP_SYCK_DIV		CCI_REG8(0x030b)
+#define IMX708_REG_IOP_PREPLLCK_DIV	CCI_REG8(0x030d)
+#define IMX708_REG_IOP_PLL_MPY		CCI_REG16(0x030e)
+#define IMX708_REG_PLL_MULT_DRIV	CCI_REG8(0x0310)
+
+/* V_TIMING internal */
+#define IMX708_REG_FRAME_LENGTH		CCI_REG16(0x0340)
+#define IMX708_FRAME_LENGTH_MAX		0xffff
+#define IMX708_REG_LINE_LENGTH		CCI_REG16(0x0342)
+#define IMX708_LINE_LENGTH		15648
+#define IMX708_VBLANK_MIN		58
+
+/* Imaging area */
+#define IMX708_REG_X_ADD_STA		CCI_REG16(0x0344)
+#define IMX708_REG_X_ADD_END		CCI_REG16(0x0348)
+#define IMX708_REG_Y_ADD_STA		CCI_REG16(0x0346)
+#define IMX708_REG_Y_ADD_END		CCI_REG16(0x034a)
+#define IMX708_REG_DIG_CROP_X_OFFSET	CCI_REG16(0x0408)
+#define IMX708_REG_DIG_CROP_Y_OFFSET	CCI_REG16(0x040a)
+#define IMX708_REG_DIG_CROP_WIDTH	CCI_REG16(0x040c)
+#define IMX708_REG_DIG_CROP_HEIGHT	CCI_REG16(0x040e)
+#define IMX708_REG_X_OUTPUT_SIZE	CCI_REG16(0x034c)
+#define IMX708_REG_Y_OUTPUT_SIZE	CCI_REG16(0x034e)
+
+#define IMX708_REG_ACROPLP_EN		CCI_REG8(0x32df)
+#define IMX708_REG_BINNING_MODE		CCI_REG8(0x0900)
+#define IMX708_REG_BINNING_TYPE		CCI_REG8(0x0901)
+#define IMX708_REG_BINNING_WEIGHT	CCI_REG8(0x0902)
+#define IMX708_REG_BINNING_PRIORITY_H	CCI_REG8(0x3200)
+#define IMX708_REG_BINNING_PRIORITY_V	CCI_REG8(0x3201)
+
+/* Long exposure multiplier */
+#define IMX708_LONG_EXP_SHIFT_MAX	7
+#define IMX708_LONG_EXP_SHIFT_REG	CCI_REG8(0x3100)
+
+/* Exposure control */
+#define IMX708_REG_EXPOSURE		CCI_REG16(0x0202)
+#define IMX708_EXPOSURE_OFFSET		48
+#define IMX708_EXPOSURE_DEFAULT		0x640
+#define IMX708_EXPOSURE_STEP		1
+#define IMX708_EXPOSURE_MIN		8
+
+/* Analog gain control */
+#define IMX708_REG_ANALOG_GAIN		CCI_REG16(0x0204)
+#define IMX708_ANA_GAIN_MIN		0
+#define IMX708_ANA_GAIN_MAX		960
+#define IMX708_ANA_GAIN_STEP		1
+#define IMX708_ANA_GAIN_DEFAULT	   IMX708_ANA_GAIN_MIN
+
+/* Digital gain control */
+#define IMX708_REG_DIGITAL_GAIN		CCI_REG16(0x020e)
+#define IMX708_DGTL_GAIN_MIN		0x0100
+#define IMX708_DGTL_GAIN_MAX		0xffff
+#define IMX708_DGTL_GAIN_DEFAULT	0x0100
+#define IMX708_DGTL_GAIN_STEP		1
+
+/* Colour balance controls */
+#define IMX708_REG_COLOUR_BALANCE_RED	CCI_REG16(0x0b90)
+#define IMX708_REG_COLOUR_BALANCE_BLUE	CCI_REG16(0x0b92)
+#define IMX708_COLOUR_BALANCE_MIN	0x01
+#define IMX708_COLOUR_BALANCE_MAX	0xffff
+#define IMX708_COLOUR_BALANCE_STEP	0x01
+#define IMX708_COLOUR_BALANCE_DEFAULT	0x100
+
+/* Test Pattern Control */
+#define IMX708_REG_TEST_PATTERN		CCI_REG16(0x0600)
+#define IMX708_TEST_PATTERN_DISABLE	0
+#define IMX708_TEST_PATTERN_SOLID_COLOR	1
+#define IMX708_TEST_PATTERN_COLOR_BARS	2
+#define IMX708_TEST_PATTERN_GREY_COLOR	3
+#define IMX708_TEST_PATTERN_PN9		4
+
+/* Test pattern colour components */
+#define IMX708_REG_TEST_PATTERN_R	CCI_REG16(0x0602)
+#define IMX708_REG_TEST_PATTERN_GR	CCI_REG16(0x0604)
+#define IMX708_REG_TEST_PATTERN_B	CCI_REG16(0x0606)
+#define IMX708_REG_TEST_PATTERN_GB	CCI_REG16(0x0608)
+#define IMX708_TEST_PATTERN_COLOUR_MIN	0
+#define IMX708_TEST_PATTERN_COLOUR_MAX	0x0fff
+#define IMX708_TEST_PATTERN_COLOUR_STEP	1
+
+#define IMX708_REG_BASE_SPC_GAINS_L	CCI_REG8(0x7b10)
+#define IMX708_REG_BASE_SPC_GAINS_R	CCI_REG8(0x7c00)
+
+/* Middle and short exposure */
+#define IMX708_REG_MID_EXPOSURE		CCI_REG16(0x3116)
+#define IMX708_REG_SHT_EXPOSURE		CCI_REG16(0x0224)
+#define IMX708_REG_MID_ANALOG_GAIN	CCI_REG16(0x3118)
+#define IMX708_REG_MID_DIGITAL_GAIN	CCI_REG16(0x311a)
+#define IMX708_REG_SHT_ANALOG_GAIN	CCI_REG16(0x0216)
+#define IMX708_REG_SHT_DIGITAL_GAIN	CCI_REG16(0x0218)
+
+#define IMX708_REG_CLKLANE_BLANK	CCI_REG8(0x3220)
+#define IMX708_CLKLANE_BLANK_NONCONT	BIT(0)
+
+/* QBC Re-mosaic broken line correction registers */
+#define IMX708_REG_QBC_RMSC_EN		CCI_REG8(0x32d5)
+#define IMX708_REG_LPF_INTENSITY_EN	CCI_REG8(0xc428)
+#define IMX708_LPF_INTENSITY_ENABLED	0x00
+#define IMX708_LPF_INTENSITY_DISABLED	0x01
+#define IMX708_REG_LPF_INTENSITY	CCI_REG8(0xc429)
+#define IMX708_LPF_INTENSITY_DEFAULT	2
+
+/* AE HIST */
+#define IMX708_REG_AEHIST_AUTO_THRESH	CCI_REG16(0x3360)
+#define IMX708_REG_AEHIST1_AREA_WIDTH	CCI_REG16(0x3366)
+#define IMX708_REG_AEHIST1_AREA_HEIGHT	CCI_REG16(0x3368)
+
+enum pad_types {
+	IMX708_SOURCE_PAD,
+	IMX708_NUM_PADS
+};
+
+/* IMX708 native and active pixel array size. */
+static const struct v4l2_rect imx708_native_area = {
+	.top = 0,
+	.left = 0,
+	.width = 4640,
+	.height = 2658,
+};
+
+static const struct v4l2_rect imx708_active_area = {
+	.top = 24,
+	.left = 16,
+	.width = 4608,
+	.height = 2592,
+};
+
+struct imx708_reg_list {
+	unsigned int num_of_regs;
+	const struct cci_reg_sequence *regs;
+};
+
+/* Default PDAF pixel correction gains */
+static const u8 pdaf_gains[2][9] = {
+	{ 0x4c, 0x4c, 0x4c, 0x46, 0x3e, 0x39, 0x36, 0x36, 0x36 },
+	{ 0x36, 0x36, 0x36, 0x39, 0x3e, 0x46, 0x4c, 0x4c, 0x4c }
+};
+
+/* Link frequency setup */
+enum {
+	IMX708_LINK_FREQ_450MHZ,
+	IMX708_LINK_FREQ_447MHZ,
+	IMX708_LINK_FREQ_453MHZ,
+};
+
+static const s64 link_freqs[] = {
+	[IMX708_LINK_FREQ_450MHZ] = 450000000,
+	[IMX708_LINK_FREQ_447MHZ] = 447000000,
+	[IMX708_LINK_FREQ_453MHZ] = 453000000,
+};
+
+/* 450MHz is the nominal "default" link frequency */
+static const struct cci_reg_sequence link_450Mhz_regs[] = {
+	{ IMX708_REG_IOP_PLL_MPY, 0x012c },
+};
+
+static const struct cci_reg_sequence link_447Mhz_regs[] = {
+	{ IMX708_REG_IOP_PLL_MPY, 0x012a },
+};
+
+static const struct cci_reg_sequence link_453Mhz_regs[] = {
+	{ IMX708_REG_IOP_PLL_MPY, 0x012e },
+};
+
+static const struct imx708_reg_list link_freq_regs[] = {
+	[IMX708_LINK_FREQ_450MHZ] = {
+		.regs = link_450Mhz_regs,
+		.num_of_regs = ARRAY_SIZE(link_450Mhz_regs)
+	},
+	[IMX708_LINK_FREQ_447MHZ] = {
+		.regs = link_447Mhz_regs,
+		.num_of_regs = ARRAY_SIZE(link_447Mhz_regs)
+	},
+	[IMX708_LINK_FREQ_453MHZ] = {
+		.regs = link_453Mhz_regs,
+		.num_of_regs = ARRAY_SIZE(link_453Mhz_regs)
+	},
+};
+
+static const struct cci_reg_sequence imx708_common_regs[] = {
+	/* Common */
+	{ CCI_REG8(0x0100), 0x00 },
+	{ CCI_REG8(0x0136), 0x18 },
+	{ CCI_REG8(0x0137), 0x00 },
+	{ CCI_REG8(0x33f0), 0x02 },
+	{ CCI_REG8(0x33f1), 0x05 },
+	{ CCI_REG8(0x3062), 0x00 },
+	{ CCI_REG8(0x3063), 0x12 },
+	{ CCI_REG8(0x3068), 0x00 },
+	{ CCI_REG8(0x3069), 0x12 },
+	{ CCI_REG8(0x306a), 0x00 },
+	{ CCI_REG8(0x306b), 0x30 },
+	{ CCI_REG8(0x3076), 0x00 },
+	{ CCI_REG8(0x3077), 0x30 },
+	{ CCI_REG8(0x3078), 0x00 },
+	{ CCI_REG8(0x3079), 0x30 },
+	{ CCI_REG8(0x5e54), 0x0c },
+	{ CCI_REG8(0x6e44), 0x00 },
+	{ CCI_REG8(0xb0b6), 0x01 },
+	{ CCI_REG8(0xe829), 0x00 },
+	{ CCI_REG8(0xf001), 0x08 },
+	{ CCI_REG8(0xf003), 0x08 },
+	{ CCI_REG8(0xf00d), 0x10 },
+	{ CCI_REG8(0xf00f), 0x10 },
+	{ CCI_REG8(0xf031), 0x08 },
+	{ CCI_REG8(0xf033), 0x08 },
+	{ CCI_REG8(0xf03d), 0x10 },
+	{ CCI_REG8(0xf03f), 0x10 },
+	{ CCI_REG8(0x0112), 0x0a },
+	{ CCI_REG8(0x0113), 0x0a },
+	{ CCI_REG8(0x0114), 0x01 },
+	{ CCI_REG8(0x0b8e), 0x01 },
+	{ CCI_REG8(0x0b8f), 0x00 },
+	{ CCI_REG8(0x0b94), 0x01 },
+	{ CCI_REG8(0x0b95), 0x00 },
+	{ CCI_REG8(0x3400), 0x01 },
+	{ CCI_REG8(0x3478), 0x01 },
+	{ CCI_REG8(0x3479), 0x1c },
+	{ CCI_REG8(0x3091), 0x01 },
+	{ CCI_REG8(0x3092), 0x00 },
+	{ CCI_REG8(0x3419), 0x00 },
+	{ CCI_REG8(0xbcf1), 0x02 },
+	{ CCI_REG8(0x3094), 0x01 },
+	{ CCI_REG8(0x3095), 0x01 },
+	{ CCI_REG8(0x3362), 0x00 },
+	{ CCI_REG8(0x3363), 0x00 },
+	{ CCI_REG8(0x3364), 0x00 },
+	{ CCI_REG8(0x3365), 0x00 },
+	{ CCI_REG8(0x0138), 0x01 },
+	/* PLL config */
+	{ IMX708_REG_IVT_PXCK_DIV, 0x05 },
+	{ IMX708_REG_IVT_SYCK_DIV, 0x02 },
+	{ IMX708_REG_IVT_PREPLLCK_DIV, 0x02 },
+	{ IMX708_REG_IVT_PLL_MPY, 0x007c },
+	{ IMX708_REG_IOP_SYCK_DIV, 0x02 },
+	{ IMX708_REG_IOP_PREPLLCK_DIV, 0x04 },
+	{ IMX708_REG_PLL_MULT_DRIV, 0x01 },
+	/* non-HDR defaults */
+	{ CCI_REG8(0x0220), 0x62 },
+	{ CCI_REG8(0x0222), 0x01 },
+	{ CCI_REG8(0x350c), 0x00 },
+	{ CCI_REG8(0x350d), 0x00 },
+	{ IMX708_REG_SHT_EXPOSURE, 0x01f4 },
+	{ IMX708_REG_MID_EXPOSURE, 0x01f4 },
+	{ IMX708_REG_SHT_ANALOG_GAIN, 0x0000 },
+	{ IMX708_REG_SHT_DIGITAL_GAIN, 0x0100 },
+	{ IMX708_REG_MID_ANALOG_GAIN, 0x0000 },
+	{ IMX708_REG_MID_DIGITAL_GAIN, 0x0100 },
+	{ IMX708_REG_AEHIST1_AREA_WIDTH, 0x0000 },
+	{ IMX708_REG_AEHIST1_AREA_HEIGHT, 0x0000 },
+	/* Quad-Bayer Compensation */
+	{ IMX708_REG_QBC_RMSC_EN, 0x01 },
+	{ IMX708_REG_LPF_INTENSITY, IMX708_LPF_INTENSITY_DEFAULT },
+	{ IMX708_REG_LPF_INTENSITY_EN, IMX708_LPF_INTENSITY_ENABLED },
+	{ CCI_REG8(0x32d6), 0x00 },
+	{ CCI_REG8(0x32db), 0x01 },
+	/* Analogue crop disabled */
+	{ IMX708_REG_ACROPLP_EN, 0x00 },
+	/* Unknown registers */
+	{ CCI_REG8(0x3ca0), 0x00 },
+	{ CCI_REG8(0x3ca1), 0x64 },
+	{ CCI_REG8(0x3ca4), 0x00 },
+	{ CCI_REG8(0x3ca5), 0x00 },
+	{ CCI_REG8(0x3ca6), 0x00 },
+	{ CCI_REG8(0x3ca7), 0x00 },
+	{ CCI_REG8(0x3caa), 0x00 },
+	{ CCI_REG8(0x3cab), 0x00 },
+	{ CCI_REG8(0x3cb8), 0x00 },
+	{ CCI_REG8(0x3cb9), 0x08 },
+	{ CCI_REG8(0x3cba), 0x00 },
+	{ CCI_REG8(0x3cbb), 0x00 },
+	{ CCI_REG8(0x3cbc), 0x00 },
+	{ CCI_REG8(0x3cbd), 0x3c },
+	{ CCI_REG8(0x3cbe), 0x00 },
+	{ CCI_REG8(0x3cbf), 0x00 },
+	{ CCI_REG8(0x341a), 0x00 },
+	{ CCI_REG8(0x341b), 0x00 },
+	{ CCI_REG8(0x341c), 0x00 },
+	{ CCI_REG8(0x341d), 0x00 },
+	{ CCI_REG8(0x341e), 0x01 },
+	{ CCI_REG8(0x341f), 0x20 },
+	{ CCI_REG8(0x3420), 0x00 },
+	{ CCI_REG8(0x3421), 0xd8 },
+};
+
+/*
+ * The supported formats.
+ * This table MUST contain 4 entries per format, to cover the various flip
+ * combinations in the order
+ * - no flip
+ * - h flip
+ * - v flip
+ * - h&v flips
+ */
+static const u32 codes[] = {
+	/* 10-bit modes. */
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+	MEDIA_BUS_FMT_SGBRG10_1X10,
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+};
+
+static const char * const imx708_test_pattern_menu[] = {
+	"Disabled",
+	"Color Bars",
+	"Solid Color",
+	"Grey Color Bars",
+	"PN9"
+};
+
+static const int imx708_test_pattern_val[] = {
+	IMX708_TEST_PATTERN_DISABLE,
+	IMX708_TEST_PATTERN_COLOR_BARS,
+	IMX708_TEST_PATTERN_SOLID_COLOR,
+	IMX708_TEST_PATTERN_GREY_COLOR,
+	IMX708_TEST_PATTERN_PN9,
+};
+
+/* regulator supplies */
+static const char * const imx708_supply_name[] = {
+	/* Supplies can be enabled in any order */
+	"vana1",  /* Analog1 (2.8V) supply */
+	"vana2",  /* Analog2 (1.8V) supply */
+	"vdig",  /* Digital Core (1.1V) supply */
+	"vddl",  /* IF (1.8V) supply */
+};
+
+/*
+ * Initialisation delay between XCLR low->high and the moment when the sensor
+ * can start capture (i.e. can leave software standby), given by T7 in the
+ * datasheet is 8ms.  This does include I2C setup time as well.
+ *
+ * Note, that delay between XCLR low->high and reading the CCI ID register (T6
+ * in the datasheet) is much smaller - 600us.
+ */
+#define IMX708_XCLR_MIN_DELAY_US	8000
+#define IMX708_XCLR_DELAY_RANGE_US	1000
+
+struct imx708 {
+	struct v4l2_subdev sd;
+	struct media_pad pad[IMX708_NUM_PADS];
+	struct regmap *cci;
+
+	struct clk *inclk;
+	u32 inclk_freq;
+
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(imx708_supply_name)];
+
+	struct v4l2_ctrl_handler ctrl_handler;
+	/* V4L2 Controls */
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *hblank;
+	struct {
+		struct v4l2_ctrl *hflip;
+		struct v4l2_ctrl *vflip;
+	};
+
+	/* Current long exposure factor in use. Set through V4L2_CID_VBLANK */
+	unsigned int long_exp_shift;
+
+	unsigned long link_freq_bitmap;
+
+	unsigned int csi_flags;
+};
+
+static inline struct imx708 *to_imx708(struct v4l2_subdev *_sd)
+{
+	return container_of_const(_sd, struct imx708, sd);
+}
+
+/* Get bayer order based on flip setting. */
+static u32 imx708_get_format_code(struct imx708 *imx708)
+{
+	unsigned int i;
+
+	i = (imx708->vflip->val ? 2 : 0) |
+	    (imx708->hflip->val ? 1 : 0);
+
+	return codes[i];
+}
+
+static void imx708_adjust_exposure_range(struct imx708 *imx708)
+{
+	int exposure_max, exposure_def;
+
+	/* Honour the VBLANK limits when setting exposure. */
+	exposure_max = imx708_active_area.height + imx708->vblank->val -
+		IMX708_EXPOSURE_OFFSET;
+	exposure_def = min(exposure_max, imx708->exposure->val);
+	__v4l2_ctrl_modify_range(imx708->exposure, imx708->exposure->minimum,
+				 exposure_max, imx708->exposure->step,
+				 exposure_def);
+}
+
+static int imx708_set_frame_length(struct imx708 *imx708, unsigned int val)
+{
+	int ret = 0;
+
+	imx708->long_exp_shift = 0;
+
+	while (val > IMX708_FRAME_LENGTH_MAX) {
+		imx708->long_exp_shift++;
+		val >>= 1;
+	}
+
+	cci_write(imx708->cci, IMX708_REG_FRAME_LENGTH, val, &ret);
+	cci_write(imx708->cci, IMX708_LONG_EXP_SHIFT_REG,
+		  imx708->long_exp_shift, &ret);
+
+	return ret;
+}
+
+static int imx708_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct imx708 *imx708 =
+		container_of_const(ctrl->handler, struct imx708, ctrl_handler);
+	struct i2c_client *client = v4l2_get_subdevdata(&imx708->sd);
+	int ret = 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		/*
+		 * The VBLANK control may change the limits of usable exposure,
+		 * so check and adjust if necessary.
+		 */
+		imx708_adjust_exposure_range(imx708);
+		break;
+
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP: {
+		struct v4l2_subdev_state *state =
+			v4l2_subdev_get_locked_active_state(&imx708->sd);
+		struct v4l2_mbus_framefmt *format;
+
+		format = v4l2_subdev_state_get_format(state, IMX708_SOURCE_PAD);
+		format->code = imx708_get_format_code(imx708);
+		break;
+	}
+	}
+
+	/*
+	 * Only apply control values when device is powered on (RPM ACTIVE)
+	 * and streaming (usage count != 0)
+	 */
+	if (!pm_runtime_get_if_in_use(&client->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		cci_write(imx708->cci, IMX708_REG_ANALOG_GAIN, ctrl->val, &ret);
+		break;
+	case V4L2_CID_VBLANK:
+		ret = imx708_set_frame_length(imx708,
+					      imx708_active_area.height +
+					      ctrl->val);
+		fallthrough; /* update exposure with new long_exp_shift */
+	case V4L2_CID_EXPOSURE:
+		cci_write(imx708->cci, IMX708_REG_EXPOSURE,
+			  imx708->exposure->val >> imx708->long_exp_shift,
+			  &ret);
+		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		cci_write(imx708->cci, IMX708_REG_DIGITAL_GAIN, ctrl->val, &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		cci_write(imx708->cci, IMX708_REG_TEST_PATTERN,
+			  imx708_test_pattern_val[ctrl->val], &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN_RED:
+		cci_write(imx708->cci, IMX708_REG_TEST_PATTERN_R,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN_GREENR:
+		cci_write(imx708->cci, IMX708_REG_TEST_PATTERN_GR,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN_BLUE:
+		cci_write(imx708->cci, IMX708_REG_TEST_PATTERN_B,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN_GREENB:
+		cci_write(imx708->cci, IMX708_REG_TEST_PATTERN_GB,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+		cci_write(imx708->cci, IMX708_REG_ORIENTATION,
+			  imx708->hflip->val | imx708->vflip->val << 1, &ret);
+		break;
+	case V4L2_CID_NOTIFY_GAINS:
+		cci_write(imx708->cci, IMX708_REG_COLOUR_BALANCE_BLUE,
+			  ctrl->p_new.p_u32[0], &ret);
+		if (ret)
+			break;
+		cci_write(imx708->cci, IMX708_REG_COLOUR_BALANCE_RED,
+			  ctrl->p_new.p_u32[3], &ret);
+		break;
+	default:
+		dev_warn(&client->dev,
+			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
+			 ctrl->id, ctrl->val);
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put_autosuspend(&client->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops imx708_ctrl_ops = {
+	.s_ctrl = imx708_set_ctrl,
+};
+
+static int imx708_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct imx708 *imx708 = to_imx708(sd);
+
+	if (code->pad >= IMX708_NUM_PADS)
+		return -EINVAL;
+
+	if (code->index >= (ARRAY_SIZE(codes) / 4))
+		return -EINVAL;
+
+	code->code = imx708_get_format_code(imx708);
+
+	return 0;
+}
+
+static int imx708_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct imx708 *imx708 = to_imx708(sd);
+	u32 code;
+
+	if (fse->pad >= IMX708_NUM_PADS)
+		return -EINVAL;
+
+	code = imx708_get_format_code(imx708);
+
+	if (fse->code != code)
+		return -EINVAL;
+
+	if (fse->index > 0)
+		return -EINVAL;
+
+	fse->min_width = imx708_active_area.width;
+	fse->max_width = fse->min_width;
+	fse->min_height = imx708_active_area.height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static int imx708_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	struct imx708 *imx708 = to_imx708(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
+
+	/* Initialize the image pad format. */
+	format = v4l2_subdev_state_get_format(state, IMX708_SOURCE_PAD);
+	format->code = imx708_get_format_code(imx708);
+	format->width = imx708_active_area.width;
+	format->height = imx708_active_area.height;
+	format->field = V4L2_FIELD_NONE;
+	format->colorspace = V4L2_COLORSPACE_RAW;
+	format->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	format->xfer_func = V4L2_XFER_FUNC_NONE;
+
+	/* Initialize the image pad crop. */
+	crop = v4l2_subdev_state_get_crop(state, IMX708_SOURCE_PAD);
+	*crop = imx708_active_area;
+
+	return 0;
+}
+
+static int imx708_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP: {
+		struct v4l2_rect *crop;
+
+		crop = v4l2_subdev_state_get_crop(sd_state, sel->pad);
+		sel->r = *crop;
+
+		return 0;
+	}
+
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r = imx708_native_area;
+
+		return 0;
+
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r = imx708_active_area;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int imx708_program_window(struct imx708 *imx708,
+				 struct v4l2_subdev_state *state)
+{
+	const struct v4l2_rect *crop;
+	const struct v4l2_mbus_framefmt *format;
+	int ret = 0;
+	s32 x_start, y_start;
+
+	crop = v4l2_subdev_state_get_crop(state, IMX708_SOURCE_PAD);
+	format = v4l2_subdev_state_get_format(state, IMX708_SOURCE_PAD);
+
+	/* Line length */
+	cci_write(imx708->cci, IMX708_REG_LINE_LENGTH, IMX708_LINE_LENGTH,
+		  &ret);
+
+	/* Imaging area */
+	x_start = crop->left - imx708_active_area.left;
+	y_start = crop->top - imx708_active_area.top;
+	cci_write(imx708->cci, IMX708_REG_X_ADD_STA, x_start, &ret);
+	cci_write(imx708->cci, IMX708_REG_Y_ADD_STA, y_start, &ret);
+	cci_write(imx708->cci, IMX708_REG_X_ADD_END, x_start + crop->width - 1,
+		  &ret);
+	cci_write(imx708->cci, IMX708_REG_Y_ADD_END, y_start + crop->height - 1,
+		  &ret);
+
+	/* Binning (fixed: no binning) */
+	cci_write(imx708->cci, IMX708_REG_BINNING_MODE, 0x00, &ret);
+	cci_write(imx708->cci, IMX708_REG_BINNING_TYPE, 0x11, &ret);
+	cci_write(imx708->cci, IMX708_REG_BINNING_WEIGHT, 0x0a, &ret);
+	cci_write(imx708->cci, IMX708_REG_BINNING_PRIORITY_H, 0x01, &ret);
+	cci_write(imx708->cci, IMX708_REG_BINNING_PRIORITY_V, 0x01, &ret);
+
+	/* Digital crop (fixed: no crop) */
+	cci_write(imx708->cci, IMX708_REG_DIG_CROP_X_OFFSET, 0, &ret);
+	cci_write(imx708->cci, IMX708_REG_DIG_CROP_Y_OFFSET, 0, &ret);
+	cci_write(imx708->cci, IMX708_REG_DIG_CROP_WIDTH, format->width, &ret);
+	cci_write(imx708->cci, IMX708_REG_DIG_CROP_HEIGHT, format->height, &ret);
+
+	/* Output size */
+	cci_write(imx708->cci, IMX708_REG_X_OUTPUT_SIZE, format->width, &ret);
+	cci_write(imx708->cci, IMX708_REG_Y_OUTPUT_SIZE, format->height, &ret);
+
+	return ret;
+}
+
+static int imx708_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 mask)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct imx708 *imx708 = to_imx708(sd);
+	const struct imx708_reg_list *freq_regs;
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
+		return ret;
+
+	/* Program windowing registers from V4L2 state */
+	ret = imx708_program_window(imx708, state);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to set mode\n", __func__);
+		goto err_rpm_put;
+	}
+
+	/* Update the link frequency registers */
+	freq_regs = &link_freq_regs[__ffs(imx708->link_freq_bitmap)];
+	cci_multi_reg_write(imx708->cci, freq_regs->regs,
+			    freq_regs->num_of_regs, &ret);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to set link frequency registers\n",
+			__func__);
+		goto err_rpm_put;
+	}
+
+	/* Apply customized values from user */
+	ret =  __v4l2_ctrl_handler_setup(imx708->sd.ctrl_handler);
+	if (ret)
+		goto err_rpm_put;
+
+	/* set stream on register */
+	cci_write(imx708->cci, IMX708_REG_MODE_SELECT,
+		  IMX708_MODE_STREAMING, &ret);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to start streaming\n",
+			__func__);
+		goto err_rpm_put;
+	}
+
+	/* vflip/hflip cannot change during streaming */
+	__v4l2_ctrl_grab(imx708->vflip, true);
+	__v4l2_ctrl_grab(imx708->hflip, true);
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put_sync(&client->dev);
+
+	return ret;
+}
+
+static int imx708_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 mask)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct imx708 *imx708 = to_imx708(sd);
+	int ret = 0;
+
+	/* set stream off register */
+	cci_write(imx708->cci, IMX708_REG_MODE_SELECT,
+		  IMX708_MODE_STANDBY, &ret);
+	if (ret)
+		dev_err(&client->dev, "%s failed to set stream\n", __func__);
+
+	__v4l2_ctrl_grab(imx708->vflip, false);
+	__v4l2_ctrl_grab(imx708->hflip, false);
+
+	pm_runtime_put_autosuspend(&client->dev);
+
+	return ret;
+}
+
+static int imx708_write_common(struct imx708 *imx708)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&imx708->sd);
+	int i, ret = 0;
+	u64 val;
+
+	cci_multi_reg_write(imx708->cci, imx708_common_regs,
+			    ARRAY_SIZE(imx708_common_regs), &ret);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to set common settings\n",
+			__func__);
+		return ret;
+	}
+
+	cci_write(imx708->cci, IMX708_REG_CLKLANE_BLANK,
+		  imx708->csi_flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK ?
+		  IMX708_CLKLANE_BLANK_NONCONT : 0, &ret);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to set clock lane mode\n",
+			__func__);
+		return ret;
+	}
+
+	cci_read(imx708->cci, IMX708_REG_BASE_SPC_GAINS_L, &val, &ret);
+	if (ret == 0 && val == 0x40) {
+		for (i = 0; i < 54 && ret == 0; i++) {
+			cci_write(imx708->cci,
+				  CCI_REG8(CCI_REG_ADDR(IMX708_REG_BASE_SPC_GAINS_L) + i),
+				  pdaf_gains[0][i % 9], &ret);
+		}
+		for (i = 0; i < 54 && ret == 0; i++) {
+			cci_write(imx708->cci,
+				  CCI_REG8(CCI_REG_ADDR(IMX708_REG_BASE_SPC_GAINS_R) + i),
+				  pdaf_gains[1][i % 9], &ret);
+		}
+	}
+	if (ret) {
+		dev_err(&client->dev, "%s failed to set PDAF gains\n",
+			__func__);
+		return ret;
+	}
+
+	return 0;
+}
+
+/* Power/clock management functions */
+static int imx708_power_on(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx708 *imx708 = to_imx708(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(imx708_supply_name),
+				    imx708->supplies);
+	if (ret) {
+		dev_err(&client->dev, "%s: failed to enable regulators\n",
+			__func__);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(imx708->inclk);
+	if (ret) {
+		dev_err(&client->dev, "%s: failed to enable clock\n",
+			__func__);
+		goto reg_off;
+	}
+
+	gpiod_set_value_cansleep(imx708->reset_gpio, 0);
+	usleep_range(IMX708_XCLR_MIN_DELAY_US,
+		     IMX708_XCLR_MIN_DELAY_US + IMX708_XCLR_DELAY_RANGE_US);
+
+	ret = imx708_write_common(imx708);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to write registers\n",
+			__func__);
+		goto clk_off;
+	}
+
+	return 0;
+
+clk_off:
+	gpiod_set_value_cansleep(imx708->reset_gpio, 1);
+	clk_disable_unprepare(imx708->inclk);
+
+reg_off:
+	regulator_bulk_disable(ARRAY_SIZE(imx708_supply_name),
+			       imx708->supplies);
+	return ret;
+}
+
+static int imx708_power_off(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx708 *imx708 = to_imx708(sd);
+
+	gpiod_set_value_cansleep(imx708->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(imx708_supply_name),
+			       imx708->supplies);
+	clk_disable_unprepare(imx708->inclk);
+
+	return 0;
+}
+
+/* Verify chip ID */
+static int imx708_identify_module(struct imx708 *imx708)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&imx708->sd);
+	int ret = 0;
+	u64 val;
+
+	cci_read(imx708->cci, IMX708_REG_CHIP_ID, &val, &ret);
+	if (ret) {
+		dev_err(&client->dev, "failed to read chip id %x, with error %d\n",
+			IMX708_CHIP_ID, ret);
+		return ret;
+	}
+
+	if (val != IMX708_CHIP_ID) {
+		dev_err(&client->dev, "chip id mismatch: %x!=%llx\n",
+			IMX708_CHIP_ID, val);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops imx708_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_video_ops imx708_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops imx708_pad_ops = {
+	.enum_mbus_code = imx708_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = v4l2_subdev_get_fmt,
+	.get_selection = imx708_get_selection,
+	.enum_frame_size = imx708_enum_frame_size,
+	.enable_streams = imx708_enable_streams,
+	.disable_streams = imx708_disable_streams,
+};
+
+static const struct v4l2_subdev_ops imx708_subdev_ops = {
+	.core = &imx708_core_ops,
+	.video = &imx708_video_ops,
+	.pad = &imx708_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops imx708_internal_ops = {
+	.init_state = imx708_init_state,
+};
+
+static const struct v4l2_ctrl_config imx708_notify_gains_ctrl = {
+	.ops = &imx708_ctrl_ops,
+	.id = V4L2_CID_NOTIFY_GAINS,
+	.type = V4L2_CTRL_TYPE_U32,
+	.min = IMX708_COLOUR_BALANCE_MIN,
+	.max = IMX708_COLOUR_BALANCE_MAX,
+	.step = IMX708_COLOUR_BALANCE_STEP,
+	.def = IMX708_COLOUR_BALANCE_DEFAULT,
+	.dims = { 4 },
+	.elem_size = sizeof(u32),
+};
+
+/* Initialize control handlers */
+static int imx708_init_controls(struct imx708 *imx708)
+{
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	struct i2c_client *client = v4l2_get_subdevdata(&imx708->sd);
+	struct v4l2_fwnode_device_properties props;
+	struct v4l2_ctrl *link_freq;
+	unsigned int i;
+	s32 hblank, vblank_max, exposure_max;
+	int ret;
+
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret < 0)
+		return ret;
+
+	ctrl_hdlr = &imx708->ctrl_handler;
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 17);
+	if (ret)
+		return ret;
+
+	/* By default, PIXEL_RATE is read only */
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx708_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  IMX708_PIXEL_RATE, IMX708_PIXEL_RATE, 1,
+			  IMX708_PIXEL_RATE);
+
+	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx708_ctrl_ops,
+					   V4L2_CID_LINK_FREQ,
+					   ARRAY_SIZE(link_freqs) - 1,
+					   __ffs(imx708->link_freq_bitmap),
+					   link_freqs);
+
+	/* Frame Time = 2^LONG_EXP_SHIFT * REG_FRAME_LENGTH */
+	vblank_max = ((1 << IMX708_LONG_EXP_SHIFT_MAX) *
+		      IMX708_FRAME_LENGTH_MAX) - imx708_active_area.height;
+	imx708->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx708_ctrl_ops,
+					   V4L2_CID_VBLANK, IMX708_VBLANK_MIN,
+					   vblank_max, 1, IMX708_VBLANK_MIN);
+
+	hblank = IMX708_LINE_LENGTH - imx708_active_area.width;
+	imx708->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx708_ctrl_ops,
+					   V4L2_CID_HBLANK, hblank, hblank, 1,
+					   hblank);
+
+	/* Max Exposure = FRAME_LENGTH - OFFSET */
+	exposure_max = (imx708_active_area.height + IMX708_VBLANK_MIN) -
+		IMX708_EXPOSURE_OFFSET;
+	imx708->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx708_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     IMX708_EXPOSURE_MIN,
+					     exposure_max,
+					     IMX708_EXPOSURE_STEP,
+					     IMX708_EXPOSURE_DEFAULT);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx708_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  IMX708_ANA_GAIN_MIN, IMX708_ANA_GAIN_MAX,
+			  IMX708_ANA_GAIN_STEP, IMX708_ANA_GAIN_DEFAULT);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx708_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+			  IMX708_DGTL_GAIN_MIN, IMX708_DGTL_GAIN_MAX,
+			  IMX708_DGTL_GAIN_STEP, IMX708_DGTL_GAIN_DEFAULT);
+
+	imx708->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx708_ctrl_ops,
+					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+
+	imx708->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx708_ctrl_ops,
+					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	v4l2_ctrl_cluster(2, &imx708->hflip);
+
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx708_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(imx708_test_pattern_menu) - 1,
+				     0, 0, imx708_test_pattern_menu);
+	for (i = 0; i < 4; i++) {
+		/*
+		 * The assumption is that
+		 * V4L2_CID_TEST_PATTERN_GREENR == V4L2_CID_TEST_PATTERN_RED + 1
+		 * V4L2_CID_TEST_PATTERN_BLUE   == V4L2_CID_TEST_PATTERN_RED + 2
+		 * V4L2_CID_TEST_PATTERN_GREENB == V4L2_CID_TEST_PATTERN_RED + 3
+		 */
+		v4l2_ctrl_new_std(ctrl_hdlr, &imx708_ctrl_ops,
+				  V4L2_CID_TEST_PATTERN_RED + i,
+				  IMX708_TEST_PATTERN_COLOUR_MIN,
+				  IMX708_TEST_PATTERN_COLOUR_MAX,
+				  IMX708_TEST_PATTERN_COLOUR_STEP,
+				  IMX708_TEST_PATTERN_COLOUR_MAX);
+		/* The "Solid color" pattern is white by default */
+	}
+
+	v4l2_ctrl_new_custom(ctrl_hdlr, &imx708_notify_gains_ctrl, NULL);
+
+	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx708_ctrl_ops, &props);
+
+	if (ctrl_hdlr->error) {
+		ret = ctrl_hdlr->error;
+		dev_err(&client->dev, "%s control init failed (%d)\n",
+			__func__, ret);
+		v4l2_ctrl_handler_free(ctrl_hdlr);
+
+		return ret;
+	}
+
+	link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	imx708->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	imx708->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+	imx708->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	imx708->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+}
+
+static int imx708_check_hwcfg(struct device *dev, struct imx708 *imx708)
+{
+	struct fwnode_handle *endpoint;
+	struct v4l2_fwnode_endpoint ep_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	int ret = -EINVAL;
+
+	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	if (!endpoint) {
+		dev_err(dev, "endpoint node not found\n");
+		return -EINVAL;
+	}
+
+	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg)) {
+		dev_err(dev, "could not parse endpoint\n");
+		goto error_out;
+	}
+
+	/* Check the number of MIPI CSI2 data lanes */
+	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2) {
+		dev_err(dev, "only 2 data lanes are currently supported\n");
+		goto error_out;
+	}
+
+	imx708->csi_flags = ep_cfg.bus.mipi_csi2.flags;
+
+	/* Check the link frequency set in device tree */
+	ret = v4l2_link_freq_to_bitmap(dev, ep_cfg.link_frequencies,
+				       ep_cfg.nr_of_link_frequencies,
+				       link_freqs, ARRAY_SIZE(link_freqs),
+				       &imx708->link_freq_bitmap);
+
+error_out:
+	v4l2_fwnode_endpoint_free(&ep_cfg);
+	fwnode_handle_put(endpoint);
+
+	return ret;
+}
+
+static int imx708_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct imx708 *imx708;
+	int ret;
+
+	imx708 = devm_kzalloc(&client->dev, sizeof(*imx708), GFP_KERNEL);
+	if (!imx708)
+		return -ENOMEM;
+
+	v4l2_i2c_subdev_init(&imx708->sd, client, &imx708_subdev_ops);
+
+	imx708->cci = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(imx708->cci))
+		return dev_err_probe(dev, PTR_ERR(imx708->cci),
+				     "failed to init CCI\n");
+
+	if (imx708_check_hwcfg(dev, imx708))
+		return -EINVAL;
+
+	imx708->inclk = devm_v4l2_sensor_clk_get(dev, NULL);
+	if (IS_ERR(imx708->inclk))
+		return dev_err_probe(dev, PTR_ERR(imx708->inclk),
+				     "failed to get inclk\n");
+
+	imx708->inclk_freq = clk_get_rate(imx708->inclk);
+	if (imx708->inclk_freq != IMX708_INCLK_FREQ)
+		return dev_err_probe(dev, -EINVAL,
+				     "inclk frequency not supported: %d Hz\n",
+				     imx708->inclk_freq);
+
+	for (int i = 0; i < ARRAY_SIZE(imx708_supply_name); i++)
+		imx708->supplies[i].supply = imx708_supply_name[i];
+
+	ret = devm_regulator_bulk_get(&client->dev,
+				      ARRAY_SIZE(imx708_supply_name),
+				      imx708->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	imx708->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(imx708->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(imx708->reset_gpio),
+				     "failed to get reset GPIO\n");
+
+	ret = imx708_power_on(dev);
+	if (ret)
+		return ret;
+
+	ret = imx708_identify_module(imx708);
+	if (ret)
+		goto error_power_off;
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	ret = imx708_init_controls(imx708);
+	if (ret)
+		goto error_pm_runtime;
+
+	imx708->sd.internal_ops = &imx708_internal_ops;
+	imx708->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	imx708->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	imx708->pad[IMX708_SOURCE_PAD].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&imx708->sd.entity, IMX708_NUM_PADS,
+				     imx708->pad);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to init entity pads\n");
+		goto error_handler_free;
+	}
+
+	imx708->sd.state_lock = imx708->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&imx708->sd);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to finalize subdev\n");
+		goto error_media_entity;
+	}
+
+	ret = v4l2_async_register_subdev_sensor(&imx708->sd);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to register sensor sub-device\n");
+		goto error_subdev_cleanup;
+	}
+
+	pm_runtime_idle(dev);
+	pm_runtime_set_autosuspend_delay(dev, 5000);
+	pm_runtime_use_autosuspend(dev);
+
+	return 0;
+
+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&imx708->sd);
+
+error_media_entity:
+	media_entity_cleanup(&imx708->sd.entity);
+
+error_handler_free:
+	v4l2_ctrl_handler_free(imx708->sd.ctrl_handler);
+
+error_pm_runtime:
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+
+error_power_off:
+	imx708_power_off(&client->dev);
+
+	return ret;
+}
+
+static void imx708_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx708 *imx708 = to_imx708(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(imx708->sd.ctrl_handler);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		imx708_power_off(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
+static const struct of_device_id imx708_dt_ids[] = {
+	{ .compatible = "sony,imx708" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx708_dt_ids);
+
+static const struct dev_pm_ops imx708_pm_ops = {
+	SET_RUNTIME_PM_OPS(imx708_power_off, imx708_power_on, NULL)
+};
+
+static struct i2c_driver imx708_i2c_driver = {
+	.driver = {
+		.name = "imx708",
+		.of_match_table	= imx708_dt_ids,
+		.pm = pm_ptr(&imx708_pm_ops),
+	},
+	.probe = imx708_probe,
+	.remove = imx708_remove,
+};
+
+module_i2c_driver(imx708_i2c_driver);
+
+MODULE_AUTHOR("David Plowman <david.plowman@raspberrypi.com>");
+MODULE_AUTHOR("Jai Luthra <jai.luthra@ideasonboard.com>");
+MODULE_DESCRIPTION("Sony IMX708 sensor driver");
+MODULE_LICENSE("GPL");

-- 
2.54.0

