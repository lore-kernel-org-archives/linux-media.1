Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCD533B961;
	Thu, 23 Jul 2026 07:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791325; cv=none; b=B2wuqqoBPcMYBkc2W6Bkdugv7v/nXm5r9cC1MIELANdwOjk/OGUIs5Tgtn33A0OGcF1DNxxyH9BbIszWNCX1u6fx1fQ5bOfra9t4gLmIBj7ljcw/+qGb0cqg/ZvKXzHVoRyRH3/LcuMIfDodJNcQ35xe8g6zMbTHNqlSQwrFm0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791325; c=relaxed/simple;
	bh=I1T3XFk1xW3I3Rile5/kRU6YAgx/EGSAbwL5MGYi5/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gG9fTPjeRDWv7MDyPqA28D4wBJyG1NPC8qNS1Et8c/A1AEqFOwY9k26raAZOvUfRfhTSbweNFU2VPTg/34AdMfnkeraT6L3npQSHqNzTT3wIA/5IbENMU0dSpe8Wt2gSpAB0H9KZ6x2MNZRhRSVm+caKqfMTnCgD1fv5eoo0SmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=subR35J5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="subR35J5"
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A48B19C;
	Thu, 23 Jul 2026 09:20:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784791252;
	bh=I1T3XFk1xW3I3Rile5/kRU6YAgx/EGSAbwL5MGYi5/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=subR35J5MObjah+6xQRk5PypPMBJzmTzKiC7aMNl/jtsSoSO8yUTHpHDHmDGB6pMh
	 okNtieCTdU1JW0YnxAkxCkBUTEj14oMlSNs4r6Osi2hkdvnnKBZH4+v1TF3v2CnjTr
	 f2SqGhTJ5n9/zzrh631jn9SY4BRtWKBEsQz8fJxg=
Date: Thu, 23 Jul 2026 09:21:48 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philippe Baetens <philippebaetens@gmail.com>, 
	Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Message-ID: <amG5CiajbwGXhb59@zed>
References: <20260722-mira220-v7-0-dd5f1de98cd4@ideasonboard.com>
 <20260722-mira220-v7-2-dd5f1de98cd4@ideasonboard.com>
 <178472387683.3005206.5602199112336367476@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178472387683.3005206.5602199112336367476@freya>

Hi Jai,
   thanks for the review

On Wed, Jul 22, 2026 at 06:07:56PM +0530, Jai Luthra wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> Quoting Jacopo Mondi (2026-07-22 16:25:17)
> > From: Philippe Baetens <philippebaetens@gmail.com>
> >
> > Add a V4L2 subdev driver for driver for the AMS-OSRAM Mira220 image
> > sensor.
> >
> > Mira220 is a global shutter image sensor with a resolution of 1600x1400
> > pixels.
> >
> > The driver implements support for mono and RGB 12, 10 and 8 bits
> > formats. The output data-rate per lane is 1500Mbit/s, with a maximum
> > frame rate up to 90 fps.
> >
> > Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> [...]
>
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 5c52007f9cbe..c933acc96d23 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -313,6 +313,20 @@ config VIDEO_IMX678
> >  config VIDEO_MAX9271_LIB
> >         tristate
> >
> > +config VIDEO_MIRA220
> > +       tristate "ams MIRA220 sensor support"
> > +       depends on I2C && VIDEO_DEV
> > +       select MEDIA_CONTROLLER
> > +       select VIDEO_V4L2_SUBDEV_API
> > +       select V4L2_CCI_I2C
> > +       select V4L2_FWNODE
>
> nit: Many of these are redundant, at the top of the Kconfig we have:
>
>     if VIDEO_DEV
>     ...
>     menuconfig VIDEO_CAMERA_SENSOR
>         bool "Camera sensor devices"
>         depends on MEDIA_CAMERA_SUPPORT && I2C && HAVE_CLK
>         select MEDIA_CONTROLLER
>         select V4L2_FWNODE
>         select VIDEO_V4L2_SUBDEV_API
>         default y
>
>     if VIDEO_CAMERA_SENSOR
>
> More importantly, this missed GPIOLIB.
>
> I think the following should be good enough:
>
> 	depends on GPIOLIB
> 	select V4L2_CCI_I2C
>

Oh, thanks!

> > +       help
> > +         This is a Video4Linux2 sensor driver for the ams
> > +         MIRA220 camera.
> > +
> > +         To compile this driver as a module, choose M here: the
> > +         module will be called mira220.
> > +
> >  config VIDEO_MT9M001
> >         tristate "mt9m001 support"
> >         help
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index d04bd5724552..6ecfe6c65af4 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -74,6 +74,7 @@ obj-$(CONFIG_VIDEO_MAX9271_LIB) += max9271.o
> >  obj-$(CONFIG_VIDEO_MAX9286) += max9286.o
> >  obj-$(CONFIG_VIDEO_MAX96714) += max96714.o
> >  obj-$(CONFIG_VIDEO_MAX96717) += max96717.o
> > +obj-$(CONFIG_VIDEO_MIRA220)    += mira220.o
> >  obj-$(CONFIG_VIDEO_ML86V7667) += ml86v7667.o
> >  obj-$(CONFIG_VIDEO_MSP3400) += msp3400.o
> >  obj-$(CONFIG_VIDEO_MT9M001) += mt9m001.o
> > diff --git a/drivers/media/i2c/mira220.c b/drivers/media/i2c/mira220.c
> > new file mode 100644
> > index 000000000000..5f4864864926
> > --- /dev/null
> > +++ b/drivers/media/i2c/mira220.c
> > @@ -0,0 +1,2068 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * A V4L2 driver for ams MIRA220 cameras.
> > + *
> > + * Mira220 comes in monochrome, RGB and IR-RGB variants. The driver supports
> > + * the mono and RGB variants.
> > + *
> > + * Copyright (C) 2026, ams-OSRAM
> > + *
> > + * Based on Sony IMX219 camera driver
> > + * Copyright (C) 2019, Raspberry Pi (Trading) Ltd
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <media/v4l2-cci.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-mediabus.h>
> > +
> > +/*
> > + * Active pixel array is 1600 (H) x 1400 (V) pixels.
> > + * Physical resolution including buffer pixels: 1642 (H) x 1464 (V) pixels.
> > + */
> > +#define MIRA220_NATIVE_WIDTH 1642U
> > +#define MIRA220_NATIVE_HEIGHT 1464U
>
> nit: I like tabs before the values to make things a bit easier to read.
>

I do as well

The code base I started from had this style, and honestly I considered
a better investment of my time looking at the implementation instead
of replacing spaces with tabs.

I can have a quick attempt with some vim macros

> > +#define MIRA220_PIXEL_ARRAY_LEFT 21U
> > +#define MIRA220_PIXEL_ARRAY_TOP 32U
> > +#define MIRA220_PIXEL_ARRAY_WIDTH 1600U
> > +#define MIRA220_PIXEL_ARRAY_HEIGHT 1400U
> > +
> > +/* Mira220 does not support analog gain. */
> > +#define MIRA220_ANALOG_GAIN_MIN 1
> > +#define MIRA220_ANALOG_GAIN_MAX 1
> > +#define MIRA220_ANALOG_GAIN_STEP 1
> > +#define MIRA220_ANALOG_GAIN_DEFAULT MIRA220_ANALOG_GAIN_MIN
> > +
> > +/* Bit order */
> > +#define MIRA220_BIT_ORDER_REG CCI_REG8(0x2063)
> > +#define MIRA220_BIT_ORDER_NORMAL 0x00
> > +#define MIRA220_BIT_ORDER_REVERSED 0x01
> > +
> > +/* Bit depth */
> > +#define MIRA220_BIT_DEPTH_REG CCI_REG8(0x209E)
> > +#define MIRA220_BIT_DEPTH_12_BIT 0x02
> > +#define MIRA220_BIT_DEPTH_10_BIT 0x04
> > +#define MIRA220_BIT_DEPTH_8_BIT 0x06
> > +#define MIRA220_CSI_DATA_TYPE_REG CCI_REG8(0x208D)
> > +#define MIRA220_CSI_DATA_TYPE_12_BIT 0x04
> > +#define MIRA220_CSI_DATA_TYPE_10_BIT 0x02
> > +#define MIRA220_CSI_DATA_TYPE_8_BIT 0x01
> > +
> > +/* Imager state master/slave registers */
> > +#define MIRA220_IMAGER_STATE_REG CCI_REG8(0x1003)
> > +#define MIRA220_IMAGER_STATE_STOP_AT_ROW 0x02
> > +#define MIRA220_IMAGER_STATE_STOP_AT_FRAME 0x04
> > +#define MIRA220_IMAGER_STATE_MASTER_CONTROL 0x10
> > +#define MIRA220_IMAGER_STATE_SLAVE_CONTROL 0x08
> > +
> > +/* Start image acquisition */
> > +#define MIRA220_IMAGER_RUN_REG CCI_REG8(0x10F0)
> > +#define MIRA220_IMAGER_RUN_START 0x01
> > +#define MIRA220_IMAGER_RUN_STOP 0x00
> > +
> > +/* Continuous running, not limited to nr of frames. */
> > +#define MIRA220_IMAGER_RUN_CONT_REG CCI_REG8(0x1002)
> > +#define MIRA220_IMAGER_RUN_CONT_ENABLE 0x04
> > +#define MIRA220_IMAGER_RUN_CONT_DISABLE 0x00
> > +
> > +/* Exposure time is indicated in number of rows */
> > +#define MIRA220_EXP_TIME_REG CCI_REG16_LE(0x100C)
> > +
> > +/* Vertical Blank */
> > +#define MIRA220_VBLANK_REG CCI_REG16_LE(0x1012)
> > +#define MIRA220_MIN_VBLANK_MARGIN 11
> > +#define MIRA220_MAX_VBLANK 0xffff
> > +
> > +/* Horizontal flip */
> > +#define MIRA220_HFLIP_REG CCI_REG8(0x209C)
> > +#define MIRA220_HFLIP_ENABLE_MIRROR 1
> > +#define MIRA220_HFLIP_DISABLE_MIRROR 0
> > +
> > +/* Vertical flip */
> > +#define MIRA220_VFLIP_REG CCI_REG8(0x1095)
> > +#define MIRA220_VFLIP_ENABLE_FLIP 1
> > +#define MIRA220_VFLIP_DISABLE_FLIP 0
>
> I don't see the above macros being used when updating the flip registers,

We use ctrl->val indeed as it can be 1 or 0 only

> and also HFLIP value is swapped from the control, which does not match the
> macro.

Why I don't see it ?

       case V4L2_CID_HFLIP:
               ret = cci_write(mira220->regmap, MIRA220_HFLIP_REG,
                               mira220->hflip->val, NULL);

	mira220->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
					   V4L2_CID_HFLIP, 0, 1, 1, 0);


>
> Could you please use the macros to keep things easy to read? And maybe a
> mask macro instead of `(i & ~3)` too?
>

I could

> > +
> > +#define MIRA220_VSIZE_REG CCI_REG16_LE(0x1087)
> > +#define MIRA220_VSTART_REG CCI_REG16_LE(0x107d)
> > +#define MIRA220_HSIZE_REG CCI_REG16_LE(0x2008)
> > +#define MIRA220_HSIZE_MASK GENMASK(9, 0)
> > +#define MIRA220_HSTART_REG CCI_REG16_LE(0x200a)
> > +#define MIRA220_HSTART_MASK GENMASK(9, 0)
>
> Same, drop the mask if unused.
>

Or maybe I should have used the masks!

> > +#define MIRA220_MIPI_HSIZE_REG CCI_REG16_LE(0x207d)
> > +
> > +/* MIPI bus control */
> > +#define MIRA220_MIPI_LANES_REG CCI_REG8(0x6012)
> > +
> > +#define MIRA220_MIPI_CLK_MODE_REG CCI_REG8(0x6013)
> > +#define MIRA220_MIPI_CLK_CONTINUOUS 0x00
> > +#define MIRA220_MIPI_CLK_NON_CONTINUOUS 0x01
>
> Does DT allow clock-continuous property? Do we handle it?
>

The bindings for this sensor allows all properties from
video-interfaces.yaml, including clock-noncontinuous.

The driver doesn't support it at the moment and unconditionally use
continuous clock, but I guess it's nice to provide macros for the
non-continuous configuration as well

> > +
> > +/* OTP control */
> > +#define MIRA220_OTP_CMD_REG CCI_REG8(0x0080)
> > +#define MIRA220_OTP_CMD_UP 0x4
> > +#define MIRA220_OTP_CMD_DOWN 0x8
> > +
> > +/* Global sampling time */
> > +#define MIRA220_GLOB_NUM_CLK_CYCLES 1928
> > +
> > +/* External clock frequency is 38.4 M */
> > +#define MIRA220_SUPPORTED_XCLK_FREQ 38400000
> > +
> > +/* Default exposure is adjusted to mode with smallest height */
> > +#define MIRA220_DEFAULT_EXPOSURE 1000
> > +#define MIRA220_MAX_EXPOSURE 0xffff
> > +#define MIRA220_EXPOSURE_MIN 1
> > +
> > +/*
> > + * Pixel rate is an artificial value. This value is used for timing calculations
>
> nit: Pixel rate is artificially scaled to keep hblank non-negative for
> timing calculations.
>

I'm not sure that's what the comment originally meant.

> > + * in combination with vblank/hblank.
> > + */
> > +#define MIRA220_PIXEL_RATE 384000000
> > +
> > +/* Total line length for 2 lanes calculated for ROW_LENGTH = 304. */
> > +#define MIRA220_LLP_1600x1400_304 3040
> > +
>
> nit: Most Sony drivers with scaled pixel rate and HTS define the ratio
> once, so something like `#define MIRA220_PIXEL_SCALE_FACTOR 10` and use it
> at both places. This is fine too though.
>

I'm not sure I got what scale factor are you referring to.

> > +/*
> > + * ROW_LENGTH: duration of row length in clk_in cycles; set to minimum supported
> > + * value for higher frame rate.
> > + */
> > +#define MIRA220_REG_ROW_LENGTH         CCI_REG16_LE(0x102b)
> > +#define MIRA220_ROW_LENGTH_MIN         304

Ah, do you think the above 3040 comes from this 304 * 10 ?

Honestly I didn't realize it!

304 is the minimum value allowed for the row_length parameter, which
defines the row sampling rate in number of clk_in cycles.

As I can't tell what the 10 scale factor would represent I would leave
these as they are ?

> > +
> > +/* Test Pattern */
> > +#define MIRA220_REG_TEST_PATTERN CCI_REG8(0x2091)
> > +#define MIRA220_TEST_PATTERN_DISABLE 0x00
> > +#define MIRA220_TEST_PATTERN_VERTICAL_GRADIENT 0x01
> > +
> > +/* Module variant identifiers */
> > +#define MIRA220_MONO_PLAIN_PF          0x1e62a032
> > +#define MIRA220_MONO_PLAIN_NO_PF       0x1e62a045
> > +#define MIRA220_MONO_AR_PF             0x1e62a036
> > +#define MIRA220_RGB_PLAIN_PF           0x1e62a03b
> > +#define MIRA220_RGB_PLAIN_NO_PF                0x1e62a046
> > +#define MIRA220_RGB_AR_PF              0x1e62a03d
>
> Ah, I think this might be relevant to userspace, but not a problem to solve
> in this patch.
>

How so ?

> > +
> > +enum mira220_variants {
> > +       MIRA220_VARIANT_MONO,
> > +       MIRA220_VARIANT_RGB,
> > +};
> > +
> > +static const struct cci_reg_sequence mira220_init_reg_list[] = {
> > +       /* Base configuration*/
> > +       { CCI_REG8(0x6006), 0x0 },
> > +       { CCI_REG8(0x6012), 0x1 },
> > +       { CCI_REG8(0x6013), 0x0 },
> > +       { CCI_REG8(0x6006), 0x1 },
> > +       { CCI_REG8(0x205D), 0x0 },
>
> We have a convention to stick to lowercase hex values throughout the
> driver.
>

Same reasoning as per the tabs in the defines.
The code base I started from had upper case.

In the past I asked other contributors to adjust their tables to lower
case, so I guess it's not nice if I get a pass.

I'll try to change them

> [...]
>
> > +       /* TP */
> > +       { CCI_REG8(0x2091), 0x0 }, //  Test Pattern Generator.TPG_EN(0)
> > +       { CCI_REG8(0x2091), 0x0 }, //  Test Pattern Generator.TPG_CONFIG(0)
>
> Maybe use macros for the TPG instead of comments here?
>
> > +       /* Reduce Slew Rate - fix for defect line */
> > +       { CCI_REG8(0x402D), 0x7B },
> > +
> > +};
> > +
> > +static const char *const mira220_test_pattern_menu[] = {
> > +       "Disabled",
> > +       "Vertical Gradient",
> > +};
> > +
> > +static const int mira220_test_pattern_val[] = {
> > +       MIRA220_TEST_PATTERN_DISABLE,
> > +       MIRA220_TEST_PATTERN_VERTICAL_GRADIENT,
> > +};
> > +
> > +/* regulator supplies */
> > +static const char *const mira220_supply_name[] = {
> > +       /* Supplies can be enabled in any order */
> > +       "vana", /* Analog (2.8V) supply */
> > +       "vdig", /* Digital Core (1.8V) supply */
> > +       "vddl", /* IF (1.2V) supply */
> > +};
> > +
> > +#define MIRA220_NUM_SUPPLIES ARRAY_SIZE(mira220_supply_name)
> > +
> > +/*
> > + * The supported formats.
> > + * This table MUST contain 4 entries per format, to cover the various flip
> > + * combinations in the order
> > + * - no flip
> > + * - h flip
> > + * - v flip
> > + * - h&v flips
> > + */
> > +static const u32 mira220_mbus_color_formats[] = {
> > +       MEDIA_BUS_FMT_SRGGB12_1X12,
> > +       MEDIA_BUS_FMT_SGRBG12_1X12,
> > +       MEDIA_BUS_FMT_SGBRG12_1X12,
> > +       MEDIA_BUS_FMT_SBGGR12_1X12,
> > +
> > +       MEDIA_BUS_FMT_SRGGB10_1X10,
> > +       MEDIA_BUS_FMT_SGRBG10_1X10,
> > +       MEDIA_BUS_FMT_SGBRG10_1X10,
> > +       MEDIA_BUS_FMT_SBGGR10_1X10,
> > +
> > +       MEDIA_BUS_FMT_SRGGB8_1X8,
> > +       MEDIA_BUS_FMT_SGRBG8_1X8,
> > +       MEDIA_BUS_FMT_SGBRG8_1X8,
> > +       MEDIA_BUS_FMT_SBGGR8_1X8,
> > +};
> > +
> > +static const u32 mira220_mbus_mono_formats[] = {
> > +       MEDIA_BUS_FMT_Y12_1X12,
> > +       MEDIA_BUS_FMT_Y10_1X10,
> > +       MEDIA_BUS_FMT_Y8_1X8,
> > +};
> > +
> > +struct mira220 {
> > +       struct v4l2_subdev sd;
> > +       struct media_pad pad;
> > +
> > +       enum mira220_variants variant;
> > +
> > +       struct v4l2_mbus_framefmt fmt;
> > +
> > +       struct clk *xclk;
> > +       u32 xclk_freq;
> > +
> > +       struct regulator_bulk_data supplies[MIRA220_NUM_SUPPLIES];
> > +
> > +       struct gpio_desc *reset_gpio;
> > +
> > +       unsigned int lanes;
> > +       unsigned int row_length;
> > +
> > +       struct v4l2_ctrl_handler ctrl_handler;
> > +       struct v4l2_ctrl *vflip;
> > +       struct v4l2_ctrl *hflip;
> > +       struct v4l2_ctrl *vblank;
> > +       struct v4l2_ctrl *exposure;
> > +
> > +       const struct mira220_mode *mode;
>
> Is this defined or [used anywhere? A grep for mira220_mode returns empty
> for me.
>

This defintely shouldn't be here

Now the thing I don't get: why does this compile ?

  CC [M]  mira220.o
  MODPOST Module.symvers
  CC [M]  mira220.mod.o
  LD [M]  mira220.ko

??

And notice that if I remove the ; at the end

-       const struct mira220_mode *mode;
+       const struct mira220_mode *mode

to intentionally break it .. it breaks!

mira220.c:1016:9: error: expected ‘:’, ‘,’, ‘;’, ‘}’ or ‘__attribute__’ before ‘struct’
 1016 |         struct regmap *regmap;
      |         ^~~~~~

I'm puzzled :)

> > +
> > +       struct regmap *regmap;
> > +};
> > +
> > +static inline struct mira220 *to_mira220(struct v4l2_subdev *sd)
> > +{
> > +       return container_of(sd, struct mira220, sd);
>
> nit: latest best practices are to use container_of_const() everywhere,
> which uses _Generic().
>

ack

> > +}
> > +
> > +static bool mira220_is_mono(struct mira220 *mira220)
> > +{
> > +       return mira220->variant == MIRA220_VARIANT_MONO;
> > +}
> > +
> > +/* Power/clock management functions */
> > +static int mira220_power_on(struct device *dev)
> > +{
> > +       struct i2c_client *client = to_i2c_client(dev);
> > +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +       struct mira220 *mira220 = to_mira220(sd);
> > +       int ret;
> > +
> > +       ret = regulator_bulk_enable(MIRA220_NUM_SUPPLIES, mira220->supplies);
> > +       if (ret) {
> > +               dev_err(&client->dev, "%s: failed to enable regulators\n",
> > +                       __func__);
> > +               return ret;
> > +       }
> > +
> > +       ret = clk_prepare_enable(mira220->xclk);
> > +       if (ret) {
> > +               dev_err(&client->dev, "%s: failed to enable clock\n", __func__);
> > +               goto reg_off;
> > +       }
> > +
> > +       gpiod_set_value_cansleep(mira220->reset_gpio, 0);
> > +
> > +       return 0;
> > +
> > +reg_off:
> > +       regulator_bulk_disable(MIRA220_NUM_SUPPLIES, mira220->supplies);
> > +       return ret;
> > +}
> > +
> > +static int mira220_power_off(struct device *dev)
> > +{
> > +       struct i2c_client *client = to_i2c_client(dev);
> > +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +       struct mira220 *mira220 = to_mira220(sd);
> > +
> > +       gpiod_set_value_cansleep(mira220->reset_gpio, 1);
> > +       clk_disable_unprepare(mira220->xclk);
> > +       regulator_bulk_disable(MIRA220_NUM_SUPPLIES, mira220->supplies);
> > +
> > +       return 0;
> > +}
> > +
> > +static int mira220_write_start_streaming_regs(struct mira220 *mira220)
> > +{
> > +       int ret;
> > +
> > +       /* Setting master control */
> > +       ret = cci_write(mira220->regmap, MIRA220_IMAGER_STATE_REG,
> > +                       MIRA220_IMAGER_STATE_MASTER_CONTROL, NULL);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Enable continuous streaming */
> > +       ret = cci_write(mira220->regmap, MIRA220_IMAGER_RUN_CONT_REG,
> > +                       MIRA220_IMAGER_RUN_CONT_ENABLE, NULL);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = cci_write(mira220->regmap, MIRA220_IMAGER_RUN_REG,
> > +                       MIRA220_IMAGER_RUN_START, NULL);
> > +       if (ret)
> > +               return ret;
>
> Would be simpler if we init ret to 0 and pass is to the cci_write() calls.
>

true that

> > +
> > +       return ret;
> > +}
> > +
> > +static int mira220_write_stop_streaming_regs(struct mira220 *mira220)
> > +{
> > +       int ret;
> > +
> > +       ret = cci_write(mira220->regmap, MIRA220_IMAGER_STATE_REG,
> > +                       MIRA220_IMAGER_STATE_STOP_AT_ROW, NULL);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = cci_write(mira220->regmap, MIRA220_IMAGER_RUN_REG,
> > +                       MIRA220_IMAGER_RUN_STOP, NULL);
> > +       if (ret)
> > +               return ret;
> > +
>
> Same here.
>

likewise

> > +       return ret;
> > +}
> > +
> > +/*
> > + * Returns the exposure in lines. Calculation is baded on Mira220 datasheet
> > + * Section 9.2.
> > + */
> > +static u32 mira220_calc_exposure(struct mira220 *mira220, u32 height, u32 vblank)
> > +{
> > +       u32 max_exposure = (height + vblank) -
> > +                          (MIRA220_GLOB_NUM_CLK_CYCLES / mira220->row_length);
> > +
> > +       return min(max_exposure, MIRA220_MAX_EXPOSURE);
> > +}
> > +
> > +static u32 mira220_calc_min_vblank(struct mira220 *mira220)
> > +{
> > +       return (MIRA220_GLOB_NUM_CLK_CYCLES / mira220->row_length)
> > +              + MIRA220_MIN_VBLANK_MARGIN;
> > +}
> > +
> > +static int mira220_write_exposure_reg(struct mira220 *mira220, u32 exposure)
> > +{
> > +       struct i2c_client *const client = v4l2_get_subdevdata(&mira220->sd);
> > +       int ret;
> > +
> > +       ret = cci_write(mira220->regmap, MIRA220_EXP_TIME_REG, exposure, NULL);
> > +       if (ret) {
> > +               dev_err_ratelimited(&client->dev,
> > +                                   "Error setting exposure time to %d",
> > +                                   exposure);
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +/* Get bayer order based on flip setting. */
> > +static u32 mira220_get_format_code(struct mira220 *mira220, u32 code)
> > +{
> > +       unsigned int i;
> > +
> > +       if (mira220_is_mono(mira220)) {
> > +               /* for now only support Y10. */
>
> nit: outdated comment?
>

Yup!

> > +               for (i = 0; i < ARRAY_SIZE(mira220_mbus_mono_formats); i++) {
> > +                       if (mira220_mbus_mono_formats[i] == code)
> > +                               return mira220_mbus_mono_formats[i];
> > +               }
> > +
> > +               return mira220_mbus_mono_formats[0];
> > +       }
> > +
> > +       for (i = 0; i < ARRAY_SIZE(mira220_mbus_color_formats); i++) {
> > +               if (mira220_mbus_color_formats[i] == code)
> > +                       break;
> > +       }
>
> nit: \n here please
>

Honestly I usually like to have the pattern

        for (; i < something; ++i) {

        }
        if (i >= something) {
                error
        }

as one block :)

> > +       if (i >= ARRAY_SIZE(mira220_mbus_color_formats))
> > +               i = 0;
> > +
> > +       i = (i & ~3) | (mira220->vflip->val ? 2 : 0) | (mira220->hflip->val ? 0 : 1);
>
> Using macros here would be nice.
>

I'm not sure, we're just adjusting the index, there's nothing related
to the registers layout here


> > +
> > +       return mira220_mbus_color_formats[i];
> > +}
> > +
> > +static int mira220_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct mira220 *mira220 =
> > +               container_of(ctrl->handler, struct mira220, ctrl_handler);
> > +       struct i2c_client *client = v4l2_get_subdevdata(&mira220->sd);
> > +       struct v4l2_mbus_framefmt *format;
> > +       struct v4l2_subdev_state *state;
> > +       int ret = 0;
> > +
> > +       state = v4l2_subdev_get_locked_active_state(&mira220->sd);
> > +       format = v4l2_subdev_state_get_format(state, 0);
> > +
> > +       if (ctrl->id == V4L2_CID_VBLANK) {
> > +               int exposure_max, exposure_def;
> > +
> > +               /* Update max exposure while meeting expected vblanking */
> > +               exposure_max = mira220_calc_exposure(mira220, format->height,
> > +                                                    ctrl->val);
> > +               exposure_def = min(exposure_max, MIRA220_DEFAULT_EXPOSURE);
> > +               ret = __v4l2_ctrl_modify_range(mira220->exposure,
> > +                                              mira220->exposure->minimum,
> > +                                              exposure_max,
> > +                                              mira220->exposure->step,
> > +                                              exposure_def);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       /* Update the format code to adjust it to the new flip state. */
> > +       if (ctrl->id == V4L2_CID_VFLIP || ctrl->id == V4L2_CID_HFLIP)
> > +               format->code = mira220_get_format_code(mira220, format->code);
> > +
> > +       if (!pm_runtime_get_if_in_use(&client->dev))
> > +               return 0;
> > +
> > +       switch (ctrl->id) {
> > +       case V4L2_CID_EXPOSURE:
> > +               ret = mira220_write_exposure_reg(mira220, ctrl->val);
> > +               break;
> > +       case V4L2_CID_TEST_PATTERN:
> > +               ret = cci_write(mira220->regmap, MIRA220_REG_TEST_PATTERN,
> > +                               mira220_test_pattern_val[ctrl->val], NULL);
> > +               break;
> > +       case V4L2_CID_HFLIP:
> > +               ret = cci_write(mira220->regmap, MIRA220_HFLIP_REG,
> > +                               mira220->hflip->val, NULL);
> > +               break;
> > +       case V4L2_CID_VFLIP:
> > +               ret = cci_write(mira220->regmap, MIRA220_VFLIP_REG,
> > +                               mira220->vflip->val, NULL);
> > +               break;
> > +       case V4L2_CID_VBLANK:
> > +               ret = cci_write(mira220->regmap, MIRA220_VBLANK_REG, ctrl->val,
> > +                               NULL);
> > +               break;
> > +       default:
> > +               dev_info(&client->dev,
> > +                        "ctrl(id:0x%x,val:0x%x) is not handled\n", ctrl->id,
> > +                        ctrl->val);
> > +               ret = -EINVAL;
> > +               break;
> > +       }
> > +
> > +       pm_runtime_put_autosuspend(&client->dev);
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops mira220_ctrl_ops = {
> > +       .s_ctrl = mira220_set_ctrl,
> > +};
> > +
> > +static void mira220_update_pad_format(struct mira220 *mira220,
> > +                                     struct v4l2_mbus_framefmt *fmt, u32 code)
> > +{
> > +       /* Bayer order varies with flips */
> > +       fmt->code = mira220_get_format_code(mira220, code);
> > +       /*
> > +        * The mira220 sensor doesn't support binning/skipping but only
> > +        * cropping to reduce the frame size so the correct API to configure
> > +        * windowing is the .set_selection one, while format is fixed to
> > +        * the full resolution 1600x1400 one.
> > +        */
> > +       fmt->width = MIRA220_PIXEL_ARRAY_WIDTH;
> > +       fmt->height = MIRA220_PIXEL_ARRAY_HEIGHT;
> > +       fmt->field = V4L2_FIELD_NONE;
> > +       fmt->colorspace = V4L2_COLORSPACE_RAW;
> > +       fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> > +       fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > +       fmt->xfer_func = V4L2_XFER_FUNC_NONE;
> > +}
> > +
> > +static int mira220_set_pad_format(struct v4l2_subdev *sd,
> > +                                 struct v4l2_subdev_state *state,
> > +                                 struct v4l2_subdev_format *fmt)
> > +{
> > +       struct mira220 *mira220 = to_mira220(sd);
> > +       struct v4l2_rect *crop;
> > +       u32 min_vblank;
> > +       int ret;
> > +
> > +       mira220_update_pad_format(mira220, &fmt->format, fmt->format.code);
> > +       *v4l2_subdev_state_get_format(state, 0) = fmt->format;
> > +
> > +       crop = v4l2_subdev_state_get_crop(state, 0);
> > +       crop->width = fmt->format.width * 1;
> > +       crop->height = fmt->format.height * 1;
>
> The * 1 seems odd, the sensor doesn't support binning so I doubt it would
> become * 2 later?

Yeah it's odd, I'll drop it

>
> > +       crop->left = MIRA220_PIXEL_ARRAY_LEFT;
> > +       crop->top = MIRA220_PIXEL_ARRAY_TOP;
> > +
> > +       if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > +               return 0;
> > +
> > +       /* Update vblank based on new mode. */
> > +       min_vblank = mira220_calc_min_vblank(mira220);
> > +       ret = __v4l2_ctrl_modify_range(mira220->vblank, min_vblank,
> > +                                      MIRA220_MAX_VBLANK, 1, min_vblank);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return __v4l2_ctrl_s_ctrl(mira220->vblank, min_vblank);
> > +}
> > +
>
> [...]
>
> > +/* OTP power on */
> > +static int mira220_otp_read(struct mira220 *mira220, u8 addr, u8 offset,
> > +                           u8 *val, int *err)
> > +{
> > +       int ret;
> > +       u64 readback;
> > +
> > +       if (err && *err)
> > +               return *err;
> > +
> > +       ret = cci_write(mira220->regmap, CCI_REG8(0x0086), addr, NULL);
> > +       if (ret)
> > +               goto out;
> > +
> > +       ret = cci_write(mira220->regmap, CCI_REG8(0x0080), 0x02, NULL);
> > +       if (ret)
> > +               goto out;
> > +
> > +       ret = cci_read(mira220->regmap, CCI_REG8(0x0082 + offset), &readback,
> > +                      NULL);
> > +       if (ret)
> > +               goto out;
>
> Maybe pass &ret to all cci_read()s and check it only once here?
>

ack

> > +
> > +       *val = readback & 0xFF;
> > +
> > +       return 0;
> > +
> > +out:
> > +       if (err)
> > +               *err = ret;
> > +       return ret;
> > +}
>
> [...]
>
> > +static const struct v4l2_subdev_core_ops mira220_core_ops = {
> > +       .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > +       .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > +};
>
> Drop these, see commit 17971a430ff90df896fb6

Uh, I missed that

>
> [...]
>
> > +static int mira220_probe(struct i2c_client *client)
> > +{
> > +       struct device *dev = &client->dev;
> > +       struct mira220 *mira220;
> > +       int ret;
> > +
> > +       mira220 = devm_kzalloc(&client->dev, sizeof(*mira220), GFP_KERNEL);
> > +       if (!mira220)
> > +               return -ENOMEM;
> > +
> > +       v4l2_i2c_subdev_init(&mira220->sd, client, &mira220_subdev_ops);
> > +       mira220->sd.internal_ops = &mira220_internal_ops;
> > +
> > +       ret = mira220_parse_endpoint(dev, mira220);
> > +       if (ret)
> > +               return ret;
> > +
> > +       mira220->regmap = devm_cci_regmap_init_i2c(client, 16);
> > +       if (IS_ERR(mira220->regmap))
> > +               return dev_err_probe(dev, PTR_ERR(mira220->regmap),
> > +                                    "failed to initialize CCI\n");
> > +
> > +       /* Get system clock (xclk) */
> > +       mira220->xclk = devm_clk_get(dev, NULL);
>
> Maybe use devm_v4l2_sensor_clk_get() which works for both ACPI and DT.
>

I'll have a look at it

> > +       if (IS_ERR(mira220->xclk))
> > +               return dev_err_probe(dev, PTR_ERR(mira220->xclk),
> > +                                    "failed to get xclk\n");
> > +
> > +       mira220->xclk_freq = clk_get_rate(mira220->xclk);
> > +       if (mira220->xclk_freq != MIRA220_SUPPORTED_XCLK_FREQ) {
> > +               dev_err(dev, "xclk frequency not supported: %d Hz\n",
> > +                       mira220->xclk_freq);
> > +               return -EINVAL;
> > +       }
> > +
> > +       ret = mira220_get_regulators(mira220);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "failed to get regulators\n");
> > +
> > +       mira220->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > +                                                     GPIOD_OUT_HIGH);
> > +       if (IS_ERR(mira220->reset_gpio))
> > +               return dev_err_probe(dev, PTR_ERR(mira220->reset_gpio),
> > +                                    "failed to get reset gpio\n");
> > +
> > +       ret = mira220_power_on(dev);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Enable runtime PM and power on the device */
> > +       pm_runtime_set_active(dev);
> > +       pm_runtime_enable(dev);
> > +
> > +       ret = mira220_identify_module(mira220);
> > +       if (ret)
> > +               goto error_power_off;
> > +
> > +       ret = mira220_init_controls(mira220);
> > +       if (ret)
> > +               goto error_power_off;
> > +
> > +       /* Initialize subdev */
> > +       mira220->sd.internal_ops = &mira220_internal_ops;
> > +       mira220->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +                            V4L2_SUBDEV_FL_HAS_EVENTS;
>
> HAS_EVENTS flag is not needed, see commit 17971a430ff90.
>

ack!

> > +       mira220->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +       /* Initialize source pads */
> > +       mira220->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +
> > +       ret = media_entity_pads_init(&mira220->sd.entity, 1, &mira220->pad);
> > +       if (ret) {
> > +               dev_err_probe(dev, ret, "failed to init entity pads\n");
> > +               goto error_handler_free;
> > +       }
> > +
> > +       mira220->sd.state_lock = mira220->ctrl_handler.lock;
> > +       ret = v4l2_subdev_init_finalize(&mira220->sd);
> > +       if (ret < 0) {
> > +               dev_err_probe(dev, ret, "subdev init error\n");
> > +               goto error_media_entity;
> > +       }
> > +
> > +       ret = v4l2_async_register_subdev_sensor(&mira220->sd);
> > +       if (ret < 0) {
> > +               dev_err_probe(dev, ret,
> > +                             "failed to register sensor sub-device\n");
> > +               goto error_subdev_cleanup;
> > +       }
> > +
> > +       pm_runtime_idle(dev);
> > +       pm_runtime_set_autosuspend_delay(dev, 1000);
> > +       pm_runtime_use_autosuspend(dev);
> > +
> > +       return 0;
> > +
> > +error_subdev_cleanup:
> > +       v4l2_subdev_cleanup(&mira220->sd);
> > +error_media_entity:
> > +       media_entity_cleanup(&mira220->sd.entity);
> > +error_handler_free:
> > +       v4l2_ctrl_handler_free(mira220->sd.ctrl_handler);
> > +error_power_off:
> > +       pm_runtime_disable(dev);
> > +       mira220_power_off(dev);
> > +       pm_runtime_set_suspended(dev);
> > +       return ret;
> > +}
> > +
> > +static void mira220_remove(struct i2c_client *client)
> > +{
> > +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +       struct mira220 *mira220 = to_mira220(sd);
> > +
> > +       v4l2_async_unregister_subdev(sd);
> > +       v4l2_subdev_cleanup(&mira220->sd);
> > +       media_entity_cleanup(&sd->entity);
> > +
> > +       v4l2_ctrl_handler_free(mira220->sd.ctrl_handler);
> > +
> > +       pm_runtime_disable(&client->dev);
> > +       if (!pm_runtime_status_suspended(&client->dev))
> > +               mira220_power_off(&client->dev);
> > +       pm_runtime_set_suspended(&client->dev);
> > +}
> > +
> > +static const struct dev_pm_ops mira220_pm_ops = {
> > +       SET_RUNTIME_PM_OPS(mira220_power_off, mira220_power_on, NULL)
> > +};
> > +
> > +static const struct of_device_id mira220_dt_ids[] = {
> > +       { .compatible = "ams,mira220" },
>
> I see AMS-OSRAM using the following naming scheme on the product page [1]:
>     Mira220-2QC: Color
>     Mira220-2QM: Mono
>     Mira220-2QI: RGB-IR
>
> Should we use separate compatibles for the three variants? This is a
> practice we have followed for other sensors too, and especially relevant
> here because the driver currently doesn't work for RGB-IR variants.
>
> [1]: https://ams-osram.com/products/sensor-solutions/cmos-image-sensors/ams-mira220
>

I don't know. As we can perform runtime identification what would an
additional compatible give us here ?

Thanks
   j

> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, mira220_dt_ids);
> > +
> > +static struct i2c_driver mira220_i2c_driver = {
> > +       .driver = {
> > +               .name = "mira220",
> > +               .of_match_table = mira220_dt_ids,
> > +               .pm = pm_ptr(&mira220_pm_ops),
> > +       },
> > +       .probe = mira220_probe,
> > +       .remove = mira220_remove,
> > +};
> > +
> > +module_i2c_driver(mira220_i2c_driver);
> > +
> > +MODULE_AUTHOR("Philippe Baetens <philippe.baetens@ams-osram.com>");
> > +MODULE_DESCRIPTION("ams MIRA220 sensor driver");
> > +MODULE_LICENSE("GPL");
> >
> > --
> > 2.54.0
> >
>
> Thanks,
>     Jai
