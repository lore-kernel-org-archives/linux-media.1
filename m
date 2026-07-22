Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A491263C8C;
	Wed, 22 Jul 2026 12:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723890; cv=none; b=dXXxe+CcttJTJ3qqGGrfAyc20KOjNwq8cnnXsy3BCWQz1QTQevAYCF/zVF+SWX6mcHhwlqZnr6BEvIzgjoR9ZBPCBUpVTGN7dZ/0Fb68alqDqM1+DCCEEYhKsxbHB8vCEbCXQwOEteYvucjeHEClvj6y6i86MfG2OGe+wrvL4Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723890; c=relaxed/simple;
	bh=M8ZfCaabV6wO9LjSIyRufenlhtLG88EK7GN6bP3hLAg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=C/pZI1ibBgpsVCWNGjXBWM6fdGJDWuy340df+DxZtUiAlbyin2M7iBc4Wjmz+KYTuw8dgQtA+dnXgVCWQzryjRpfSoJDqK2LC0YctY2EZD9lfyVQn1ES75tLeyDTtjSfvSXLY4amOxtPddkwy3GYYqq9nvcwrN/51CuySOXqlek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lTBjo0q0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lTBjo0q0"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 505DBB08;
	Wed, 22 Jul 2026 14:37:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784723823;
	bh=M8ZfCaabV6wO9LjSIyRufenlhtLG88EK7GN6bP3hLAg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lTBjo0q0mRolVWsNPhpRHZ4Z2m7w46z0WYQ5zNAsl5J7aLQ03fUztUplp3Iw+xfVE
	 9Hyots3+IOApmzbE2jp3D3KAp5i1op5jpR0gVnR3DpIfG49CocoLLOXtYZe/qbpmqF
	 6WNy94pUUP/yQ5yfffxXNObdE69jj3oCkm7aIMYo=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260722-mira220-v7-2-dd5f1de98cd4@ideasonboard.com>
References: <20260722-mira220-v7-0-dd5f1de98cd4@ideasonboard.com> <20260722-mira220-v7-2-dd5f1de98cd4@ideasonboard.com>
Subject: Re: [PATCH v7 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Philippe Baetens <philippebaetens@gmail.com>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 22 Jul 2026 18:07:56 +0530
Message-ID: <178472387683.3005206.5602199112336367476@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Jacopo,

Thank you for the patch.

Quoting Jacopo Mondi (2026-07-22 16:25:17)
> From: Philippe Baetens <philippebaetens@gmail.com>
>=20
> Add a V4L2 subdev driver for driver for the AMS-OSRAM Mira220 image
> sensor.
>=20
> Mira220 is a global shutter image sensor with a resolution of 1600x1400
> pixels.
>=20
> The driver implements support for mono and RGB 12, 10 and 8 bits
> formats. The output data-rate per lane is 1500Mbit/s, with a maximum
> frame rate up to 90 fps.
>=20
> Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

[...]

> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 5c52007f9cbe..c933acc96d23 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -313,6 +313,20 @@ config VIDEO_IMX678
>  config VIDEO_MAX9271_LIB
>         tristate
> =20
> +config VIDEO_MIRA220
> +       tristate "ams MIRA220 sensor support"
> +       depends on I2C && VIDEO_DEV
> +       select MEDIA_CONTROLLER
> +       select VIDEO_V4L2_SUBDEV_API
> +       select V4L2_CCI_I2C
> +       select V4L2_FWNODE

nit: Many of these are redundant, at the top of the Kconfig we have:

    if VIDEO_DEV
    ...
    menuconfig VIDEO_CAMERA_SENSOR
        bool "Camera sensor devices"
        depends on MEDIA_CAMERA_SUPPORT && I2C && HAVE_CLK
        select MEDIA_CONTROLLER
        select V4L2_FWNODE
        select VIDEO_V4L2_SUBDEV_API
        default y

    if VIDEO_CAMERA_SENSOR

More importantly, this missed GPIOLIB.

I think the following should be good enough:

	depends on GPIOLIB
	select V4L2_CCI_I2C

> +       help
> +         This is a Video4Linux2 sensor driver for the ams
> +         MIRA220 camera.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called mira220.
> +
>  config VIDEO_MT9M001
>         tristate "mt9m001 support"
>         help
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index d04bd5724552..6ecfe6c65af4 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -74,6 +74,7 @@ obj-$(CONFIG_VIDEO_MAX9271_LIB) +=3D max9271.o
>  obj-$(CONFIG_VIDEO_MAX9286) +=3D max9286.o
>  obj-$(CONFIG_VIDEO_MAX96714) +=3D max96714.o
>  obj-$(CONFIG_VIDEO_MAX96717) +=3D max96717.o
> +obj-$(CONFIG_VIDEO_MIRA220)    +=3D mira220.o
>  obj-$(CONFIG_VIDEO_ML86V7667) +=3D ml86v7667.o
>  obj-$(CONFIG_VIDEO_MSP3400) +=3D msp3400.o
>  obj-$(CONFIG_VIDEO_MT9M001) +=3D mt9m001.o
> diff --git a/drivers/media/i2c/mira220.c b/drivers/media/i2c/mira220.c
> new file mode 100644
> index 000000000000..5f4864864926
> --- /dev/null
> +++ b/drivers/media/i2c/mira220.c
> @@ -0,0 +1,2068 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * A V4L2 driver for ams MIRA220 cameras.
> + *
> + * Mira220 comes in monochrome, RGB and IR-RGB variants. The driver supp=
orts
> + * the mono and RGB variants.
> + *
> + * Copyright (C) 2026, ams-OSRAM
> + *
> + * Based on Sony IMX219 camera driver
> + * Copyright (C) 2019, Raspberry Pi (Trading) Ltd
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mediabus.h>
> +
> +/*
> + * Active pixel array is 1600 (H) x 1400 (V) pixels.
> + * Physical resolution including buffer pixels: 1642 (H) x 1464 (V) pixe=
ls.
> + */
> +#define MIRA220_NATIVE_WIDTH 1642U
> +#define MIRA220_NATIVE_HEIGHT 1464U

nit: I like tabs before the values to make things a bit easier to read.

> +#define MIRA220_PIXEL_ARRAY_LEFT 21U
> +#define MIRA220_PIXEL_ARRAY_TOP 32U
> +#define MIRA220_PIXEL_ARRAY_WIDTH 1600U
> +#define MIRA220_PIXEL_ARRAY_HEIGHT 1400U
> +
> +/* Mira220 does not support analog gain. */
> +#define MIRA220_ANALOG_GAIN_MIN 1
> +#define MIRA220_ANALOG_GAIN_MAX 1
> +#define MIRA220_ANALOG_GAIN_STEP 1
> +#define MIRA220_ANALOG_GAIN_DEFAULT MIRA220_ANALOG_GAIN_MIN
> +
> +/* Bit order */
> +#define MIRA220_BIT_ORDER_REG CCI_REG8(0x2063)
> +#define MIRA220_BIT_ORDER_NORMAL 0x00
> +#define MIRA220_BIT_ORDER_REVERSED 0x01
> +
> +/* Bit depth */
> +#define MIRA220_BIT_DEPTH_REG CCI_REG8(0x209E)
> +#define MIRA220_BIT_DEPTH_12_BIT 0x02
> +#define MIRA220_BIT_DEPTH_10_BIT 0x04
> +#define MIRA220_BIT_DEPTH_8_BIT 0x06
> +#define MIRA220_CSI_DATA_TYPE_REG CCI_REG8(0x208D)
> +#define MIRA220_CSI_DATA_TYPE_12_BIT 0x04
> +#define MIRA220_CSI_DATA_TYPE_10_BIT 0x02
> +#define MIRA220_CSI_DATA_TYPE_8_BIT 0x01
> +
> +/* Imager state master/slave registers */
> +#define MIRA220_IMAGER_STATE_REG CCI_REG8(0x1003)
> +#define MIRA220_IMAGER_STATE_STOP_AT_ROW 0x02
> +#define MIRA220_IMAGER_STATE_STOP_AT_FRAME 0x04
> +#define MIRA220_IMAGER_STATE_MASTER_CONTROL 0x10
> +#define MIRA220_IMAGER_STATE_SLAVE_CONTROL 0x08
> +
> +/* Start image acquisition */
> +#define MIRA220_IMAGER_RUN_REG CCI_REG8(0x10F0)
> +#define MIRA220_IMAGER_RUN_START 0x01
> +#define MIRA220_IMAGER_RUN_STOP 0x00
> +
> +/* Continuous running, not limited to nr of frames. */
> +#define MIRA220_IMAGER_RUN_CONT_REG CCI_REG8(0x1002)
> +#define MIRA220_IMAGER_RUN_CONT_ENABLE 0x04
> +#define MIRA220_IMAGER_RUN_CONT_DISABLE 0x00
> +
> +/* Exposure time is indicated in number of rows */
> +#define MIRA220_EXP_TIME_REG CCI_REG16_LE(0x100C)
> +
> +/* Vertical Blank */
> +#define MIRA220_VBLANK_REG CCI_REG16_LE(0x1012)
> +#define MIRA220_MIN_VBLANK_MARGIN 11
> +#define MIRA220_MAX_VBLANK 0xffff
> +
> +/* Horizontal flip */
> +#define MIRA220_HFLIP_REG CCI_REG8(0x209C)
> +#define MIRA220_HFLIP_ENABLE_MIRROR 1
> +#define MIRA220_HFLIP_DISABLE_MIRROR 0
> +
> +/* Vertical flip */
> +#define MIRA220_VFLIP_REG CCI_REG8(0x1095)
> +#define MIRA220_VFLIP_ENABLE_FLIP 1
> +#define MIRA220_VFLIP_DISABLE_FLIP 0

I don't see the above macros being used when updating the flip registers,
and also HFLIP value is swapped from the control, which does not match the
macro.

Could you please use the macros to keep things easy to read? And maybe a
mask macro instead of `(i & ~3)` too?

> +
> +#define MIRA220_VSIZE_REG CCI_REG16_LE(0x1087)
> +#define MIRA220_VSTART_REG CCI_REG16_LE(0x107d)
> +#define MIRA220_HSIZE_REG CCI_REG16_LE(0x2008)
> +#define MIRA220_HSIZE_MASK GENMASK(9, 0)
> +#define MIRA220_HSTART_REG CCI_REG16_LE(0x200a)
> +#define MIRA220_HSTART_MASK GENMASK(9, 0)

Same, drop the mask if unused.

> +#define MIRA220_MIPI_HSIZE_REG CCI_REG16_LE(0x207d)
> +
> +/* MIPI bus control */
> +#define MIRA220_MIPI_LANES_REG CCI_REG8(0x6012)
> +
> +#define MIRA220_MIPI_CLK_MODE_REG CCI_REG8(0x6013)
> +#define MIRA220_MIPI_CLK_CONTINUOUS 0x00
> +#define MIRA220_MIPI_CLK_NON_CONTINUOUS 0x01

Does DT allow clock-continuous property? Do we handle it?

> +
> +/* OTP control */
> +#define MIRA220_OTP_CMD_REG CCI_REG8(0x0080)
> +#define MIRA220_OTP_CMD_UP 0x4
> +#define MIRA220_OTP_CMD_DOWN 0x8
> +
> +/* Global sampling time */
> +#define MIRA220_GLOB_NUM_CLK_CYCLES 1928
> +
> +/* External clock frequency is 38.4 M */
> +#define MIRA220_SUPPORTED_XCLK_FREQ 38400000
> +
> +/* Default exposure is adjusted to mode with smallest height */
> +#define MIRA220_DEFAULT_EXPOSURE 1000
> +#define MIRA220_MAX_EXPOSURE 0xffff
> +#define MIRA220_EXPOSURE_MIN 1
> +
> +/*
> + * Pixel rate is an artificial value. This value is used for timing calc=
ulations

nit: Pixel rate is artificially scaled to keep hblank non-negative for
timing calculations.

> + * in combination with vblank/hblank.
> + */
> +#define MIRA220_PIXEL_RATE 384000000
> +
> +/* Total line length for 2 lanes calculated for ROW_LENGTH =3D 304. */
> +#define MIRA220_LLP_1600x1400_304 3040
> +

nit: Most Sony drivers with scaled pixel rate and HTS define the ratio
once, so something like `#define MIRA220_PIXEL_SCALE_FACTOR 10` and use it
at both places. This is fine too though.

> +/*
> + * ROW_LENGTH: duration of row length in clk_in cycles; set to minimum s=
upported
> + * value for higher frame rate.
> + */
> +#define MIRA220_REG_ROW_LENGTH         CCI_REG16_LE(0x102b)
> +#define MIRA220_ROW_LENGTH_MIN         304
> +
> +/* Test Pattern */
> +#define MIRA220_REG_TEST_PATTERN CCI_REG8(0x2091)
> +#define MIRA220_TEST_PATTERN_DISABLE 0x00
> +#define MIRA220_TEST_PATTERN_VERTICAL_GRADIENT 0x01
> +
> +/* Module variant identifiers */
> +#define MIRA220_MONO_PLAIN_PF          0x1e62a032
> +#define MIRA220_MONO_PLAIN_NO_PF       0x1e62a045
> +#define MIRA220_MONO_AR_PF             0x1e62a036
> +#define MIRA220_RGB_PLAIN_PF           0x1e62a03b
> +#define MIRA220_RGB_PLAIN_NO_PF                0x1e62a046
> +#define MIRA220_RGB_AR_PF              0x1e62a03d

Ah, I think this might be relevant to userspace, but not a problem to solve
in this patch.

> +
> +enum mira220_variants {
> +       MIRA220_VARIANT_MONO,
> +       MIRA220_VARIANT_RGB,
> +};
> +
> +static const struct cci_reg_sequence mira220_init_reg_list[] =3D {
> +       /* Base configuration*/
> +       { CCI_REG8(0x6006), 0x0 },
> +       { CCI_REG8(0x6012), 0x1 },
> +       { CCI_REG8(0x6013), 0x0 },
> +       { CCI_REG8(0x6006), 0x1 },
> +       { CCI_REG8(0x205D), 0x0 },

We have a convention to stick to lowercase hex values throughout the
driver.

[...]

> +       /* TP */
> +       { CCI_REG8(0x2091), 0x0 }, //  Test Pattern Generator.TPG_EN(0)
> +       { CCI_REG8(0x2091), 0x0 }, //  Test Pattern Generator.TPG_CONFIG(=
0)

Maybe use macros for the TPG instead of comments here?

> +       /* Reduce Slew Rate - fix for defect line */
> +       { CCI_REG8(0x402D), 0x7B },
> +
> +};
> +
> +static const char *const mira220_test_pattern_menu[] =3D {
> +       "Disabled",
> +       "Vertical Gradient",
> +};
> +
> +static const int mira220_test_pattern_val[] =3D {
> +       MIRA220_TEST_PATTERN_DISABLE,
> +       MIRA220_TEST_PATTERN_VERTICAL_GRADIENT,
> +};
> +
> +/* regulator supplies */
> +static const char *const mira220_supply_name[] =3D {
> +       /* Supplies can be enabled in any order */
> +       "vana", /* Analog (2.8V) supply */
> +       "vdig", /* Digital Core (1.8V) supply */
> +       "vddl", /* IF (1.2V) supply */
> +};
> +
> +#define MIRA220_NUM_SUPPLIES ARRAY_SIZE(mira220_supply_name)
> +
> +/*
> + * The supported formats.
> + * This table MUST contain 4 entries per format, to cover the various fl=
ip
> + * combinations in the order
> + * - no flip
> + * - h flip
> + * - v flip
> + * - h&v flips
> + */
> +static const u32 mira220_mbus_color_formats[] =3D {
> +       MEDIA_BUS_FMT_SRGGB12_1X12,
> +       MEDIA_BUS_FMT_SGRBG12_1X12,
> +       MEDIA_BUS_FMT_SGBRG12_1X12,
> +       MEDIA_BUS_FMT_SBGGR12_1X12,
> +
> +       MEDIA_BUS_FMT_SRGGB10_1X10,
> +       MEDIA_BUS_FMT_SGRBG10_1X10,
> +       MEDIA_BUS_FMT_SGBRG10_1X10,
> +       MEDIA_BUS_FMT_SBGGR10_1X10,
> +
> +       MEDIA_BUS_FMT_SRGGB8_1X8,
> +       MEDIA_BUS_FMT_SGRBG8_1X8,
> +       MEDIA_BUS_FMT_SGBRG8_1X8,
> +       MEDIA_BUS_FMT_SBGGR8_1X8,
> +};
> +
> +static const u32 mira220_mbus_mono_formats[] =3D {
> +       MEDIA_BUS_FMT_Y12_1X12,
> +       MEDIA_BUS_FMT_Y10_1X10,
> +       MEDIA_BUS_FMT_Y8_1X8,
> +};
> +
> +struct mira220 {
> +       struct v4l2_subdev sd;
> +       struct media_pad pad;
> +
> +       enum mira220_variants variant;
> +
> +       struct v4l2_mbus_framefmt fmt;
> +
> +       struct clk *xclk;
> +       u32 xclk_freq;
> +
> +       struct regulator_bulk_data supplies[MIRA220_NUM_SUPPLIES];
> +
> +       struct gpio_desc *reset_gpio;
> +
> +       unsigned int lanes;
> +       unsigned int row_length;
> +
> +       struct v4l2_ctrl_handler ctrl_handler;
> +       struct v4l2_ctrl *vflip;
> +       struct v4l2_ctrl *hflip;
> +       struct v4l2_ctrl *vblank;
> +       struct v4l2_ctrl *exposure;
> +
> +       const struct mira220_mode *mode;

Is this defined or [used anywhere? A grep for mira220_mode returns empty
for me.

> +
> +       struct regmap *regmap;
> +};
> +
> +static inline struct mira220 *to_mira220(struct v4l2_subdev *sd)
> +{
> +       return container_of(sd, struct mira220, sd);

nit: latest best practices are to use container_of_const() everywhere,
which uses _Generic().

> +}
> +
> +static bool mira220_is_mono(struct mira220 *mira220)
> +{
> +       return mira220->variant =3D=3D MIRA220_VARIANT_MONO;
> +}
> +
> +/* Power/clock management functions */
> +static int mira220_power_on(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct mira220 *mira220 =3D to_mira220(sd);
> +       int ret;
> +
> +       ret =3D regulator_bulk_enable(MIRA220_NUM_SUPPLIES, mira220->supp=
lies);
> +       if (ret) {
> +               dev_err(&client->dev, "%s: failed to enable regulators\n",
> +                       __func__);
> +               return ret;
> +       }
> +
> +       ret =3D clk_prepare_enable(mira220->xclk);
> +       if (ret) {
> +               dev_err(&client->dev, "%s: failed to enable clock\n", __f=
unc__);
> +               goto reg_off;
> +       }
> +
> +       gpiod_set_value_cansleep(mira220->reset_gpio, 0);
> +
> +       return 0;
> +
> +reg_off:
> +       regulator_bulk_disable(MIRA220_NUM_SUPPLIES, mira220->supplies);
> +       return ret;
> +}
> +
> +static int mira220_power_off(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct mira220 *mira220 =3D to_mira220(sd);
> +
> +       gpiod_set_value_cansleep(mira220->reset_gpio, 1);
> +       clk_disable_unprepare(mira220->xclk);
> +       regulator_bulk_disable(MIRA220_NUM_SUPPLIES, mira220->supplies);
> +
> +       return 0;
> +}
> +
> +static int mira220_write_start_streaming_regs(struct mira220 *mira220)
> +{
> +       int ret;
> +
> +       /* Setting master control */
> +       ret =3D cci_write(mira220->regmap, MIRA220_IMAGER_STATE_REG,
> +                       MIRA220_IMAGER_STATE_MASTER_CONTROL, NULL);
> +       if (ret)
> +               return ret;
> +
> +       /* Enable continuous streaming */
> +       ret =3D cci_write(mira220->regmap, MIRA220_IMAGER_RUN_CONT_REG,
> +                       MIRA220_IMAGER_RUN_CONT_ENABLE, NULL);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D cci_write(mira220->regmap, MIRA220_IMAGER_RUN_REG,
> +                       MIRA220_IMAGER_RUN_START, NULL);
> +       if (ret)
> +               return ret;

Would be simpler if we init ret to 0 and pass is to the cci_write() calls.

> +
> +       return ret;
> +}
> +
> +static int mira220_write_stop_streaming_regs(struct mira220 *mira220)
> +{
> +       int ret;
> +
> +       ret =3D cci_write(mira220->regmap, MIRA220_IMAGER_STATE_REG,
> +                       MIRA220_IMAGER_STATE_STOP_AT_ROW, NULL);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D cci_write(mira220->regmap, MIRA220_IMAGER_RUN_REG,
> +                       MIRA220_IMAGER_RUN_STOP, NULL);
> +       if (ret)
> +               return ret;
> +

Same here.

> +       return ret;
> +}
> +
> +/*
> + * Returns the exposure in lines. Calculation is baded on Mira220 datash=
eet
> + * Section 9.2.
> + */
> +static u32 mira220_calc_exposure(struct mira220 *mira220, u32 height, u3=
2 vblank)
> +{
> +       u32 max_exposure =3D (height + vblank) -
> +                          (MIRA220_GLOB_NUM_CLK_CYCLES / mira220->row_le=
ngth);
> +
> +       return min(max_exposure, MIRA220_MAX_EXPOSURE);
> +}
> +
> +static u32 mira220_calc_min_vblank(struct mira220 *mira220)
> +{
> +       return (MIRA220_GLOB_NUM_CLK_CYCLES / mira220->row_length)
> +              + MIRA220_MIN_VBLANK_MARGIN;
> +}
> +
> +static int mira220_write_exposure_reg(struct mira220 *mira220, u32 expos=
ure)
> +{
> +       struct i2c_client *const client =3D v4l2_get_subdevdata(&mira220-=
>sd);
> +       int ret;
> +
> +       ret =3D cci_write(mira220->regmap, MIRA220_EXP_TIME_REG, exposure=
, NULL);
> +       if (ret) {
> +               dev_err_ratelimited(&client->dev,
> +                                   "Error setting exposure time to %d",
> +                                   exposure);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +/* Get bayer order based on flip setting. */
> +static u32 mira220_get_format_code(struct mira220 *mira220, u32 code)
> +{
> +       unsigned int i;
> +
> +       if (mira220_is_mono(mira220)) {
> +               /* for now only support Y10. */

nit: outdated comment?

> +               for (i =3D 0; i < ARRAY_SIZE(mira220_mbus_mono_formats); =
i++) {
> +                       if (mira220_mbus_mono_formats[i] =3D=3D code)
> +                               return mira220_mbus_mono_formats[i];
> +               }
> +
> +               return mira220_mbus_mono_formats[0];
> +       }
> +
> +       for (i =3D 0; i < ARRAY_SIZE(mira220_mbus_color_formats); i++) {
> +               if (mira220_mbus_color_formats[i] =3D=3D code)
> +                       break;
> +       }

nit: \n here please

> +       if (i >=3D ARRAY_SIZE(mira220_mbus_color_formats))
> +               i =3D 0;
> +
> +       i =3D (i & ~3) | (mira220->vflip->val ? 2 : 0) | (mira220->hflip-=
>val ? 0 : 1);

Using macros here would be nice.

> +
> +       return mira220_mbus_color_formats[i];
> +}
> +
> +static int mira220_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct mira220 *mira220 =3D
> +               container_of(ctrl->handler, struct mira220, ctrl_handler);
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&mira220->sd);
> +       struct v4l2_mbus_framefmt *format;
> +       struct v4l2_subdev_state *state;
> +       int ret =3D 0;
> +
> +       state =3D v4l2_subdev_get_locked_active_state(&mira220->sd);
> +       format =3D v4l2_subdev_state_get_format(state, 0);
> +
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +               int exposure_max, exposure_def;
> +
> +               /* Update max exposure while meeting expected vblanking */
> +               exposure_max =3D mira220_calc_exposure(mira220, format->h=
eight,
> +                                                    ctrl->val);
> +               exposure_def =3D min(exposure_max, MIRA220_DEFAULT_EXPOSU=
RE);
> +               ret =3D __v4l2_ctrl_modify_range(mira220->exposure,
> +                                              mira220->exposure->minimum,
> +                                              exposure_max,
> +                                              mira220->exposure->step,
> +                                              exposure_def);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /* Update the format code to adjust it to the new flip state. */
> +       if (ctrl->id =3D=3D V4L2_CID_VFLIP || ctrl->id =3D=3D V4L2_CID_HF=
LIP)
> +               format->code =3D mira220_get_format_code(mira220, format-=
>code);
> +
> +       if (!pm_runtime_get_if_in_use(&client->dev))
> +               return 0;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_EXPOSURE:
> +               ret =3D mira220_write_exposure_reg(mira220, ctrl->val);
> +               break;
> +       case V4L2_CID_TEST_PATTERN:
> +               ret =3D cci_write(mira220->regmap, MIRA220_REG_TEST_PATTE=
RN,
> +                               mira220_test_pattern_val[ctrl->val], NULL=
);
> +               break;
> +       case V4L2_CID_HFLIP:
> +               ret =3D cci_write(mira220->regmap, MIRA220_HFLIP_REG,
> +                               mira220->hflip->val, NULL);
> +               break;
> +       case V4L2_CID_VFLIP:
> +               ret =3D cci_write(mira220->regmap, MIRA220_VFLIP_REG,
> +                               mira220->vflip->val, NULL);
> +               break;
> +       case V4L2_CID_VBLANK:
> +               ret =3D cci_write(mira220->regmap, MIRA220_VBLANK_REG, ct=
rl->val,
> +                               NULL);
> +               break;
> +       default:
> +               dev_info(&client->dev,
> +                        "ctrl(id:0x%x,val:0x%x) is not handled\n", ctrl-=
>id,
> +                        ctrl->val);
> +               ret =3D -EINVAL;
> +               break;
> +       }
> +
> +       pm_runtime_put_autosuspend(&client->dev);
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops mira220_ctrl_ops =3D {
> +       .s_ctrl =3D mira220_set_ctrl,
> +};
> +
> +static void mira220_update_pad_format(struct mira220 *mira220,
> +                                     struct v4l2_mbus_framefmt *fmt, u32=
 code)
> +{
> +       /* Bayer order varies with flips */
> +       fmt->code =3D mira220_get_format_code(mira220, code);
> +       /*
> +        * The mira220 sensor doesn't support binning/skipping but only
> +        * cropping to reduce the frame size so the correct API to config=
ure
> +        * windowing is the .set_selection one, while format is fixed to
> +        * the full resolution 1600x1400 one.
> +        */
> +       fmt->width =3D MIRA220_PIXEL_ARRAY_WIDTH;
> +       fmt->height =3D MIRA220_PIXEL_ARRAY_HEIGHT;
> +       fmt->field =3D V4L2_FIELD_NONE;
> +       fmt->colorspace =3D V4L2_COLORSPACE_RAW;
> +       fmt->ycbcr_enc =3D V4L2_YCBCR_ENC_601;
> +       fmt->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> +       fmt->xfer_func =3D V4L2_XFER_FUNC_NONE;
> +}
> +
> +static int mira220_set_pad_format(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_state *state,
> +                                 struct v4l2_subdev_format *fmt)
> +{
> +       struct mira220 *mira220 =3D to_mira220(sd);
> +       struct v4l2_rect *crop;
> +       u32 min_vblank;
> +       int ret;
> +
> +       mira220_update_pad_format(mira220, &fmt->format, fmt->format.code=
);
> +       *v4l2_subdev_state_get_format(state, 0) =3D fmt->format;
> +
> +       crop =3D v4l2_subdev_state_get_crop(state, 0);
> +       crop->width =3D fmt->format.width * 1;
> +       crop->height =3D fmt->format.height * 1;

The * 1 seems odd, the sensor doesn't support binning so I doubt it would
become * 2 later?

> +       crop->left =3D MIRA220_PIXEL_ARRAY_LEFT;
> +       crop->top =3D MIRA220_PIXEL_ARRAY_TOP;
> +
> +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +               return 0;
> +
> +       /* Update vblank based on new mode. */
> +       min_vblank =3D mira220_calc_min_vblank(mira220);
> +       ret =3D __v4l2_ctrl_modify_range(mira220->vblank, min_vblank,
> +                                      MIRA220_MAX_VBLANK, 1, min_vblank);
> +       if (ret)
> +               return ret;
> +
> +       return __v4l2_ctrl_s_ctrl(mira220->vblank, min_vblank);
> +}
> +

[...]

> +/* OTP power on */
> +static int mira220_otp_read(struct mira220 *mira220, u8 addr, u8 offset,
> +                           u8 *val, int *err)
> +{
> +       int ret;
> +       u64 readback;
> +
> +       if (err && *err)
> +               return *err;
> +
> +       ret =3D cci_write(mira220->regmap, CCI_REG8(0x0086), addr, NULL);
> +       if (ret)
> +               goto out;
> +
> +       ret =3D cci_write(mira220->regmap, CCI_REG8(0x0080), 0x02, NULL);
> +       if (ret)
> +               goto out;
> +
> +       ret =3D cci_read(mira220->regmap, CCI_REG8(0x0082 + offset), &rea=
dback,
> +                      NULL);
> +       if (ret)
> +               goto out;

Maybe pass &ret to all cci_read()s and check it only once here?

> +
> +       *val =3D readback & 0xFF;
> +
> +       return 0;
> +
> +out:
> +       if (err)
> +               *err =3D ret;
> +       return ret;
> +}

[...]

> +static const struct v4l2_subdev_core_ops mira220_core_ops =3D {
> +       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> +       .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> +};

Drop these, see commit 17971a430ff90df896fb6

[...]

> +static int mira220_probe(struct i2c_client *client)
> +{
> +       struct device *dev =3D &client->dev;
> +       struct mira220 *mira220;
> +       int ret;
> +
> +       mira220 =3D devm_kzalloc(&client->dev, sizeof(*mira220), GFP_KERN=
EL);
> +       if (!mira220)
> +               return -ENOMEM;
> +
> +       v4l2_i2c_subdev_init(&mira220->sd, client, &mira220_subdev_ops);
> +       mira220->sd.internal_ops =3D &mira220_internal_ops;
> +
> +       ret =3D mira220_parse_endpoint(dev, mira220);
> +       if (ret)
> +               return ret;
> +
> +       mira220->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> +       if (IS_ERR(mira220->regmap))
> +               return dev_err_probe(dev, PTR_ERR(mira220->regmap),
> +                                    "failed to initialize CCI\n");
> +
> +       /* Get system clock (xclk) */
> +       mira220->xclk =3D devm_clk_get(dev, NULL);

Maybe use devm_v4l2_sensor_clk_get() which works for both ACPI and DT.

> +       if (IS_ERR(mira220->xclk))
> +               return dev_err_probe(dev, PTR_ERR(mira220->xclk),
> +                                    "failed to get xclk\n");
> +
> +       mira220->xclk_freq =3D clk_get_rate(mira220->xclk);
> +       if (mira220->xclk_freq !=3D MIRA220_SUPPORTED_XCLK_FREQ) {
> +               dev_err(dev, "xclk frequency not supported: %d Hz\n",
> +                       mira220->xclk_freq);
> +               return -EINVAL;
> +       }
> +
> +       ret =3D mira220_get_regulators(mira220);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to get regulators\=
n");
> +
> +       mira220->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> +                                                     GPIOD_OUT_HIGH);
> +       if (IS_ERR(mira220->reset_gpio))
> +               return dev_err_probe(dev, PTR_ERR(mira220->reset_gpio),
> +                                    "failed to get reset gpio\n");
> +
> +       ret =3D mira220_power_on(dev);
> +       if (ret)
> +               return ret;
> +
> +       /* Enable runtime PM and power on the device */
> +       pm_runtime_set_active(dev);
> +       pm_runtime_enable(dev);
> +
> +       ret =3D mira220_identify_module(mira220);
> +       if (ret)
> +               goto error_power_off;
> +
> +       ret =3D mira220_init_controls(mira220);
> +       if (ret)
> +               goto error_power_off;
> +
> +       /* Initialize subdev */
> +       mira220->sd.internal_ops =3D &mira220_internal_ops;
> +       mira220->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> +                            V4L2_SUBDEV_FL_HAS_EVENTS;

HAS_EVENTS flag is not needed, see commit 17971a430ff90.

> +       mira220->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> +
> +       /* Initialize source pads */
> +       mira220->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +
> +       ret =3D media_entity_pads_init(&mira220->sd.entity, 1, &mira220->=
pad);
> +       if (ret) {
> +               dev_err_probe(dev, ret, "failed to init entity pads\n");
> +               goto error_handler_free;
> +       }
> +
> +       mira220->sd.state_lock =3D mira220->ctrl_handler.lock;
> +       ret =3D v4l2_subdev_init_finalize(&mira220->sd);
> +       if (ret < 0) {
> +               dev_err_probe(dev, ret, "subdev init error\n");
> +               goto error_media_entity;
> +       }
> +
> +       ret =3D v4l2_async_register_subdev_sensor(&mira220->sd);
> +       if (ret < 0) {
> +               dev_err_probe(dev, ret,
> +                             "failed to register sensor sub-device\n");
> +               goto error_subdev_cleanup;
> +       }
> +
> +       pm_runtime_idle(dev);
> +       pm_runtime_set_autosuspend_delay(dev, 1000);
> +       pm_runtime_use_autosuspend(dev);
> +
> +       return 0;
> +
> +error_subdev_cleanup:
> +       v4l2_subdev_cleanup(&mira220->sd);
> +error_media_entity:
> +       media_entity_cleanup(&mira220->sd.entity);
> +error_handler_free:
> +       v4l2_ctrl_handler_free(mira220->sd.ctrl_handler);
> +error_power_off:
> +       pm_runtime_disable(dev);
> +       mira220_power_off(dev);
> +       pm_runtime_set_suspended(dev);
> +       return ret;
> +}
> +
> +static void mira220_remove(struct i2c_client *client)
> +{
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct mira220 *mira220 =3D to_mira220(sd);
> +
> +       v4l2_async_unregister_subdev(sd);
> +       v4l2_subdev_cleanup(&mira220->sd);
> +       media_entity_cleanup(&sd->entity);
> +
> +       v4l2_ctrl_handler_free(mira220->sd.ctrl_handler);
> +
> +       pm_runtime_disable(&client->dev);
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               mira220_power_off(&client->dev);
> +       pm_runtime_set_suspended(&client->dev);
> +}
> +
> +static const struct dev_pm_ops mira220_pm_ops =3D {
> +       SET_RUNTIME_PM_OPS(mira220_power_off, mira220_power_on, NULL)
> +};
> +
> +static const struct of_device_id mira220_dt_ids[] =3D {
> +       { .compatible =3D "ams,mira220" },

I see AMS-OSRAM using the following naming scheme on the product page [1]:
    Mira220-2QC: Color
    Mira220-2QM: Mono
    Mira220-2QI: RGB-IR

Should we use separate compatibles for the three variants? This is a
practice we have followed for other sensors too, and especially relevant
here because the driver currently doesn't work for RGB-IR variants.

[1]: https://ams-osram.com/products/sensor-solutions/cmos-image-sensors/ams=
-mira220

> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, mira220_dt_ids);
> +
> +static struct i2c_driver mira220_i2c_driver =3D {
> +       .driver =3D {
> +               .name =3D "mira220",
> +               .of_match_table =3D mira220_dt_ids,
> +               .pm =3D pm_ptr(&mira220_pm_ops),
> +       },
> +       .probe =3D mira220_probe,
> +       .remove =3D mira220_remove,
> +};
> +
> +module_i2c_driver(mira220_i2c_driver);
> +
> +MODULE_AUTHOR("Philippe Baetens <philippe.baetens@ams-osram.com>");
> +MODULE_DESCRIPTION("ams MIRA220 sensor driver");
> +MODULE_LICENSE("GPL");
>=20
> --=20
> 2.54.0
>=20

Thanks,
    Jai
