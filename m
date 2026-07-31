Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA5242B320;
	Fri, 31 Jul 2026 14:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507373; cv=none; b=hJr9NOWNImlU1C0Bosx+Qmxc7ZGx+cWbPeBKNP+Lrb6m+p88OLmKfZnfMvMfm3SiMTd/xAJBXhUgV62QR7UWtt/ouCF0bmSg9Se0KDUalQqNeSF/GUvrHtjOx9/LRSoVkuaWIr1RuEugSSFiN5wn48GgEzfpvX3vS86+xFA9hd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507373; c=relaxed/simple;
	bh=y+tXKMNiN7RqkRYNo3gdv1UryKTab0gkGrbeft+Xm6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3ObczgYUcuEor8pmRWDZU4mUnDOxxRlIuLkRiDB0GuSLo8gZdLn6AGbICPPSxazwS1G1OUOsqw/oSKxqfHGSs+vbR2oVgRp/QsaQbr0OtHko5YNyAJrEw1rIw6R7vxSqy4OVscEwvxt3ThVvLeanXPORSW/tnD38OTd25ifhsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z2A+o6It; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z2A+o6It"
Received: from ideasonboard.com (mob-109-113-25-35.net.vodafone.it [109.113.25.35])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94DFD2E9;
	Fri, 31 Jul 2026 16:14:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785507291;
	bh=y+tXKMNiN7RqkRYNo3gdv1UryKTab0gkGrbeft+Xm6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z2A+o6Itqz3VBXLPhDJITYx4LsH7crkP7iNR3uwMguq7RHmRFRjx0vvzgS2opz7iY
	 OsBZglDZ/N0cd3trCxCVwwEXS3JwU59DBtir8w0YJy0L4HXsuems0shTj3QlN5b69G
	 cqD4Gak4VfOzK68asKV/mjvj43XZ7ACYv1o41fTM=
Date: Fri, 31 Jul 2026 16:15:53 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Philippe Baetens <philippebaetens@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Message-ID: <amypEMpDvY47VkG5@zed>
References: <20260727-mira220-v10-0-8825794e6095@ideasonboard.com>
 <20260727-mira220-v10-2-8825794e6095@ideasonboard.com>
 <amjAgRnL0vM2eQJl@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amjAgRnL0vM2eQJl@kekkonen.localdomain>

Hi Sakari

On Tue, Jul 28, 2026 at 05:45:21PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> A few comments below...

Thanks for the review

>
> On Mon, Jul 27, 2026 at 10:56:31AM +0200, Jacopo Mondi wrote:
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
> > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> >
> > ---
> > v9->v10:
> > - Remove leftover 'fmt' in driver structure
> >
> > v8->v9:
> > - Drop spurious empty line
> > - Use v4l2_link_freq_to_bitmap() instead of manually parsing the
> >   endpoint
> >
> > v7->v8:
> > - Adjust KConfig entry to only depend on GPIOLIB and select CCI
> > - Register V4L2_CID_LINK_FREQ and validate the dts link-frequencies property
> > - Refuse the clock-continuous dts property
> > - Drop MIRA220_NUM_SUPPLIES and use ARRAY_SIZE()
> > - Rework flip index computation through a dedicated function
> > - Re-sort mira220_mbus_color_formats[] to avoid inverting hflip value
> >   when adjusting format to flips
> > - Address Jai's review comments
> >   - Re-indent macros with tabs
> >   - Use container_of_const
> >   - Use lowercase for hex values
> >   - Remove left-over mira220_mode *
> >   - Use HSTART_MASK when programming register
> >   - Use cci_write(..., &ret) to simplify register write sequences
> >   - Drop outdate comment
> >   - Do not * 1 sizes to initialize crop rectangle
> >   - Remove support for events
> >   - Use devm_v4l2_sensor_clk_get() to support ACPI systems
> >
> > v6->v7:
> > - Address Sashiko review comments:
> >   - Return error code from mira220_power_on()
> >   - Use if (!pm_runtime_get_if_in_use(&client->dev)) in set_ctrl to
> >     support !PM
> >   - Power OTP off in case of errors
> >   - Use pm_ptr() when initializing the pm ops
> >
> > v5->v6:
> > - Address Sashiko review comments:
> >   - Clamp max exposure not to overlow the 16 bits register
> >   - Update pad format on flip
> >   - Check otp_read() return value before accessing 'id'
> >   - Add v4l2_subdev_cleanup() to remove()
> >   - Do not access vblank in init_controls
> >   - Enable pm_runtime autosuspend last in probe
> >   - Scale hblank according to lane number to match row_length
> >
> > v4->v5:
> > - Address checkpatch warnings and other minor style fixes (c++ comments
> >   80-cols etc)
> > - Restore MEDIA_BUS_FMT_Y12_1X12 format
> > - Run-time identify mono vs rgb variants
> > - Remove debug messages
> > - Remove delays not documented in datasheet
> > - Adjust min/max blankings to datasheet values
> > - Do not update limits of read-only controls with a single values on
> >   set_fmt
> > - Use pm_runtime autosuspend delay
> > - Remove fixed modes and dynamically program:
> >   - CSI-2 bus config (lanes number and clock mode)
> >   - frame windowing
> >   - image format and data-type
> > - Remove programming of secondary page for fast switiching (not used yet)
> > - Add support for reset_gpio in driver
> > - Use control's mutex for state locking
> > - Use format from subdev state and remove format from driver structure
> > - Rework OTP programming routines to shorten error handling
> > - Use enable/disable_streams() in place of set_stream()
> > - Add fwnode parsing for data lanes configuration
> > ---
> >  MAINTAINERS                 |    1 +
> >  drivers/media/i2c/Kconfig   |   12 +
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/mira220.c | 2077 +++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 2091 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 55ac4ec433a6..7c4f743ae026 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1436,6 +1436,7 @@ M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> > +F:	drivers/media/i2c/mira220.c
> >
> >  AMT (Automatic Multicast Tunneling)
> >  M:	Taehee Yoo <ap420073@gmail.com>
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 5c52007f9cbe..650d5c86baa4 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -313,6 +313,18 @@ config VIDEO_IMX678
> >  config VIDEO_MAX9271_LIB
> >  	tristate
> >
> > +config VIDEO_MIRA220
> > +	tristate "ams MIRA220 sensor support"
> > +	depends on I2C && VIDEO_DEV
> > +	depends on GPIOLIB
> > +	select V4L2_CCI_I2C
> > +	help
> > +	  This is a Video4Linux2 sensor driver for the ams
> > +	  MIRA220 camera.
> > +
> > +	  To compile this driver as a module, choose M here: the
> > +	  module will be called mira220.
> > +
> >  config VIDEO_MT9M001
> >  	tristate "mt9m001 support"
> >  	help
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index d04bd5724552..6ecfe6c65af4 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -74,6 +74,7 @@ obj-$(CONFIG_VIDEO_MAX9271_LIB) += max9271.o
> >  obj-$(CONFIG_VIDEO_MAX9286) += max9286.o
> >  obj-$(CONFIG_VIDEO_MAX96714) += max96714.o
> >  obj-$(CONFIG_VIDEO_MAX96717) += max96717.o
> > +obj-$(CONFIG_VIDEO_MIRA220)	+= mira220.o
> >  obj-$(CONFIG_VIDEO_ML86V7667) += ml86v7667.o
> >  obj-$(CONFIG_VIDEO_MSP3400) += msp3400.o
> >  obj-$(CONFIG_VIDEO_MT9M001) += mt9m001.o
> > diff --git a/drivers/media/i2c/mira220.c b/drivers/media/i2c/mira220.c
> > new file mode 100644
> > index 000000000000..40462adc64eb
> > --- /dev/null
> > +++ b/drivers/media/i2c/mira220.c
> > @@ -0,0 +1,2077 @@
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
> > +#include <media/v4l2-common.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-mediabus.h>
> > +
> > +/*
> > + * Active pixel array is 1600 (H) x 1400 (V) pixels.
> > + * Physical resolution including buffer pixels: 1642 (H) x 1464 (V) pixels.
> > + */
> > +#define MIRA220_NATIVE_WIDTH		1642U
> > +#define MIRA220_NATIVE_HEIGHT		1464U
> > +#define MIRA220_PIXEL_ARRAY_LEFT	21U
> > +#define MIRA220_PIXEL_ARRAY_TOP		32U
> > +#define MIRA220_PIXEL_ARRAY_WIDTH	1600U
> > +#define MIRA220_PIXEL_ARRAY_HEIGHT	1400U
> > +
> > +/* Mira220 does not support analog gain. */
> > +#define MIRA220_ANALOG_GAIN_MIN		1
> > +#define MIRA220_ANALOG_GAIN_MAX		1
> > +#define MIRA220_ANALOG_GAIN_STEP	1
> > +#define MIRA220_ANALOG_GAIN_DEFAULT	MIRA220_ANALOG_GAIN_MIN
> > +
> > +/* Bit order */
> > +#define MIRA220_BIT_ORDER_REG		CCI_REG8(0x2063)
> > +#define MIRA220_BIT_ORDER_NORMAL	0x00
> > +#define MIRA220_BIT_ORDER_REVERSED	0x01
> > +
> > +/* Bit depth */
> > +#define MIRA220_BIT_DEPTH_REG		CCI_REG8(0x209e)
> > +#define MIRA220_BIT_DEPTH_12_BIT	0x02
> > +#define MIRA220_BIT_DEPTH_10_BIT	0x04
> > +#define MIRA220_BIT_DEPTH_8_BIT		0x06
> > +#define MIRA220_CSI_DATA_TYPE_REG	CCI_REG8(0x208d)
> > +#define MIRA220_CSI_DATA_TYPE_12_BIT	0x04
> > +#define MIRA220_CSI_DATA_TYPE_10_BIT	0x02
> > +#define MIRA220_CSI_DATA_TYPE_8_BIT	0x01
> > +
> > +/* Imager state master/slave registers */
> > +#define MIRA220_IMAGER_STATE_REG		CCI_REG8(0x1003)
> > +#define MIRA220_IMAGER_STATE_STOP_AT_ROW	0x02
> > +#define MIRA220_IMAGER_STATE_STOP_AT_FRAME	0x04
> > +#define MIRA220_IMAGER_STATE_MASTER_CONTROL	0x10
> > +#define MIRA220_IMAGER_STATE_SLAVE_CONTROL	0x08
> > +
> > +/* Start image acquisition */
> > +#define MIRA220_IMAGER_RUN_REG		CCI_REG8(0x10f0)
> > +#define MIRA220_IMAGER_RUN_START	0x01
> > +#define MIRA220_IMAGER_RUN_STOP		0x00
> > +
> > +/* Continuous running, not limited to nr of frames. */
> > +#define MIRA220_IMAGER_RUN_CONT_REG	CCI_REG8(0x1002)
> > +#define MIRA220_IMAGER_RUN_CONT_ENABLE	0x04
> > +#define MIRA220_IMAGER_RUN_CONT_DISABLE	0x00
> > +
> > +/* Exposure time is indicated in number of rows */
> > +#define MIRA220_EXP_TIME_REG		CCI_REG16_LE(0x100c)
> > +
> > +/* Vertical Blank */
> > +#define MIRA220_VBLANK_REG		CCI_REG16_LE(0x1012)
> > +#define MIRA220_MIN_VBLANK_MARGIN	11
> > +#define MIRA220_MAX_VBLANK		0xffff
> > +
> > +/* Horizontal flip */
> > +#define MIRA220_HFLIP_REG		CCI_REG8(0x209c)
> > +#define MIRA220_HFLIP_ENABLE_MIRROR	1
> > +#define MIRA220_HFLIP_DISABLE_MIRROR	0
> > +
> > +/* Vertical flip */
> > +#define MIRA220_VFLIP_REG		CCI_REG8(0x1095)
> > +#define MIRA220_VFLIP_ENABLE_FLIP	1
> > +#define MIRA220_VFLIP_DISABLE_FLIP	0
> > +
> > +#define MIRA220_VSIZE_REG		CCI_REG16_LE(0x1087)
> > +#define MIRA220_VSTART_REG		CCI_REG16_LE(0x107d)
> > +#define MIRA220_HSIZE_REG		CCI_REG16_LE(0x2008)
> > +#define MIRA220_HSIZE_MASK		GENMASK(9, 0)
> > +#define MIRA220_HSTART_REG		CCI_REG16_LE(0x200a)
> > +#define MIRA220_HSTART_MASK		GENMASK(9, 0)
> > +#define MIRA220_MIPI_HSIZE_REG		CCI_REG16_LE(0x207d)
> > +
> > +/* MIPI bus control */
> > +#define MIRA220_MIPI_LANES_REG		CCI_REG8(0x6012)
> > +
> > +#define MIRA220_MIPI_CLK_MODE_REG	CCI_REG8(0x6013)
> > +#define MIRA220_MIPI_CLK_CONTINUOUS	0x00
> > +#define MIRA220_MIPI_CLK_NON_CONTINUOUS	0x01
> > +
> > +/* OTP control */
> > +#define MIRA220_OTP_CMD_REG		CCI_REG8(0x0080)
> > +#define MIRA220_OTP_CMD_UP		0x4
> > +#define MIRA220_OTP_CMD_DOWN		0x8
> > +
> > +/* Global sampling time */
> > +#define MIRA220_GLOB_NUM_CLK_CYCLES	1928
> > +
> > +/* External clock frequency is 38.4 M */
> > +#define MIRA220_SUPPORTED_XCLK_FREQ	38400000
> > +
> > +/* Default exposure is adjusted to mode with smallest height */
> > +#define MIRA220_DEFAULT_EXPOSURE	1000
> > +#define MIRA220_MAX_EXPOSURE		0xffff
> > +#define MIRA220_EXPOSURE_MIN		1
> > +
> > +/*
> > + * Pixel rate is an artificial value. This value is used for timing calculations
> > + * in combination with vblank/hblank.
> > + */
> > +#define MIRA220_PIXEL_RATE		384000000
> > +
> > +/* Total line length for 2 lanes calculated for ROW_LENGTH = 304. */
> > +#define MIRA220_LLP_1600x1400_304	3040
> > +
> > +/*
> > + * ROW_LENGTH: duration of row length in clk_in cycles; set to minimum supported
> > + * value for higher frame rate.
> > + */
> > +#define MIRA220_REG_ROW_LENGTH		CCI_REG16_LE(0x102b)
> > +#define MIRA220_ROW_LENGTH_MIN		304
> > +
> > +/* MIPI CSI-2 link frequency for 1.5Mbps per lane */
> > +#define MIRA220_LINK_FREQ_750M		750000000
> > +
> > +/* Test Pattern */
> > +#define MIRA220_REG_TEST_PATTERN	CCI_REG8(0x2091)
> > +#define MIRA220_TEST_PATTERN_DISABLE	0x00
> > +#define MIRA220_TEST_PATTERN_VERTICAL_GRADIENT 0x01
> > +
> > +/* Module variant identifiers */
> > +#define MIRA220_MONO_PLAIN_PF		0x1e62a032
> > +#define MIRA220_MONO_PLAIN_NO_PF	0x1e62a045
> > +#define MIRA220_MONO_AR_PF		0x1e62a036
> > +#define MIRA220_RGB_PLAIN_PF		0x1e62a03b
> > +#define MIRA220_RGB_PLAIN_NO_PF		0x1e62a046
> > +#define MIRA220_RGB_AR_PF		0x1e62a03d
> > +
> > +enum mira220_variants {
> > +	MIRA220_VARIANT_MONO,
> > +	MIRA220_VARIANT_RGB,
> > +};
> > +
> > +static const s64 mira220_link_freqs[] = {
> > +	[0] = MIRA220_LINK_FREQ_750M,
> > +};
> > +
> > +static const struct cci_reg_sequence mira220_init_reg_list[] = {
> > +	/* Base configuration*/
> > +	{ CCI_REG8(0x6006), 0x0 },
>
> Is there any information on what these values signify?
>

For this specific entry yes, but most of the following sequence is
generated.

The initial register list as submitted in the first versions
was larger and I have removed 78 entries from it to program the frame
sizes and (part) of the bus configuration dynamically.

I'm sure more things can be removed but I wouldn't push for doing so
right away

> > +	{ CCI_REG8(0x6012), 0x1 },
> > +	{ CCI_REG8(0x6013), 0x0 },
> > +	{ CCI_REG8(0x6006), 0x1 },
> > +	{ CCI_REG8(0x205d), 0x0 },
> > +	{ CCI_REG8(0x2063), 0x0 },
> > +	{ CCI_REG8(0x24dc), 0x13 },
> > +	{ CCI_REG8(0x24dd), 0x3 },
> > +	{ CCI_REG8(0x24de), 0x3 },

[snip]

> > +	/* Sensor control mode */
> > +	{ CCI_REG8(0x0043), 0x0 }, //  Sensor Control Mode.SLEEP_POWER_MODE(0)
> > +	{ CCI_REG8(0x0043), 0x0 }, //  Sensor Control Mode.IDLE_POWER_MODE(0)
> > +	{ CCI_REG8(0x0043), 0x4 }, //  Sensor Control Mode.SYSTEM_CLOCK_ENABLE(0)
> > +	{ CCI_REG8(0x0043), 0xC }, //  Sensor Control Mode.SRAM_CLOCK_ENABLE(0)
> > +	{ CCI_REG8(0x1001), 0x41 }, //  Sensor Control Mode.EXT_EVENT_SEL(0)
> > +	{ CCI_REG8(0x10f2), 0x1 }, //  Sensor Control Mode.NB_OF_FRAMES_A(0)
> > +	{ CCI_REG8(0x10f3), 0x0 }, //  Sensor Control Mode.NB_OF_FRAMES_A(1)
> > +	{ CCI_REG8(0x0012), 0x0 }, //  IO Drive Strength.DIG_DRIVE_STRENGTH(0)
> > +	{ CCI_REG8(0x0012), 0x0 }, //  IO Drive Strength.CCI_DRIVE_STRENGTH(0)
> > +	{ CCI_REG8(0x1001), 0x41 }, //  Readout && Exposure.EXT_EXP_PW_SEL(0)
> > +	{ CCI_REG8(0x10d0), 0x0 }, //  Readout && Exposure.EXT_EXP_PW_DELAY(0)
> > +	{ CCI_REG8(0x10d1), 0x0 }, //  Readout && Exposure.EXT_EXP_PW_DELAY(1)
> > +	/* MIPI */
> > +	{ CCI_REG8(0x6006), 0x0 }, //  MIPI.TX_CTRL_EN(0)
> > +	{ CCI_REG8(0x5004), 0x1 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x5086), 0x2 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x5087), 0x4e }, //  MIPI.datarate
> > +	{ CCI_REG8(0x5088), 0x0 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x5090), 0x0 }, //  MIPI.datarate
>
> How many of these registers are actually 16 or 32 bits? Does the sensor
> support wider than single-octet writes -- few don't?

The sensor is said to support both single read/write and burst read/write
sequences.

There is room for improvements here, but as the startup latency is not
a concern for the time being, I would leave this as an exercize for
later

>
> > +	{ CCI_REG8(0x5091), 0x8 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x5092), 0x14 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x5093), 0xf }, //  MIPI.datarate
> > +	{ CCI_REG8(0x5094), 0x6 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x5095), 0x32 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x5096), 0xe }, //  MIPI.datarate
> > +	{ CCI_REG8(0x5097), 0x0 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x5098), 0x11 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x5004), 0x0 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x2066), 0x6c }, //  MIPI.datarate
> > +	{ CCI_REG8(0x2067), 0x7 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x206e), 0x7e }, //  MIPI.datarate
> > +	{ CCI_REG8(0x206f), 0x6 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x20ac), 0x7e }, //  MIPI.datarate
> > +	{ CCI_REG8(0x20ad), 0x6 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x2076), 0xc8 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x2077), 0x0 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x20b4), 0xc8 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x20b5), 0x0 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x2078), 0x1e }, //  MIPI.datarate
> > +	{ CCI_REG8(0x2079), 0x4 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x20b6), 0x1e }, //  MIPI.datarate
> > +	{ CCI_REG8(0x20b7), 0x4 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x207a), 0xd4 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x207b), 0x4 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x20b8), 0xd4 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x20b9), 0x4 }, //  MIPI.datarate
> > +	{ CCI_REG8(0x207c), 0x0 }, //  MIPI.VC_ID(0)
> > +	{ CCI_REG8(0x6001), 0x7 }, //  MIPI.TINIT(0)
> > +	{ CCI_REG8(0x6002), 0xd8 }, //  MIPI.TINIT(1)
> > +	{ CCI_REG8(0x6010), 0x0 }, //  MIPI.FRAME_MODE(0)
> > +	{ CCI_REG8(0x6010), 0x0 }, //  MIPI.EMBEDDED_FRAME_MODE(0)
> > +	{ CCI_REG8(0x6011), 0x0 }, //  MIPI.DATA_ENABLE_POLARITY(0)
> > +	{ CCI_REG8(0x6011), 0x0 }, //  MIPI.HSYNC_POLARITY(0)
> > +	{ CCI_REG8(0x6011), 0x0 }, //  MIPI.VSYNC_POLARITY(0)
> > +	{ CCI_REG8(0x6016), 0x0 }, //  MIPI.FRAME_COUNTER(0)
> > +	{ CCI_REG8(0x6017), 0x0 }, //  MIPI.FRAME_COUNTER(1)
> > +	{ CCI_REG8(0x6037), 0x1 }, //  MIPI.LINE_COUNT_RAW8(0)
> > +	{ CCI_REG8(0x6037), 0x3 }, //  MIPI.LINE_COUNT_RAW10(0)
> > +	{ CCI_REG8(0x6037), 0x7 }, //  MIPI.LINE_COUNT_RAW12(0)
> > +	{ CCI_REG8(0x6039), 0x1 }, //  MIPI.LINE_COUNT_EMB(0)
> > +	{ CCI_REG8(0x6018), 0x0 }, //  MIPI.CCI_READ_INTERRUPT_EN(0)
> > +	{ CCI_REG8(0x6018), 0x0 }, //  MIPI.CCI_WRITE_INTERRUPT_EN(0)
> > +	{ CCI_REG8(0x6065), 0x0 }, //  MIPI.TWAKE_TIMER(0)
> > +	{ CCI_REG8(0x6066), 0x0 }, //  MIPI.TWAKE_TIMER(1)
> > +	{ CCI_REG8(0x601c), 0x0 }, //  MIPI.SKEW_CAL_EN(0)
> > +	{ CCI_REG8(0x601d), 0x0 }, //  MIPI.SKEW_COUNT(0)
> > +	{ CCI_REG8(0x601e), 0x22 }, //  MIPI.SKEW_COUNT(1)
> > +	{ CCI_REG8(0x601f), 0x0 }, //  MIPI.SCRAMBLING_EN(0)
> > +	{ CCI_REG8(0x6003), 0x1 }, //  MIPI.INIT_SKEW_EN(0)
> > +	{ CCI_REG8(0x6004), 0x7a }, //  MIPI.INIT_SKEW(0)
> > +	{ CCI_REG8(0x6005), 0x12 }, //  MIPI.INIT_SKEW(1)
> > +	{ CCI_REG8(0x6006), 0x1 }, //  MIPI.TX_CTRL_EN(0)
> > +	/* Processing */
> > +	{ CCI_REG8(0x4006), 0x8 }, //  Processing.BSP(0)
> > +	{ CCI_REG8(0x2045), 0x1 }, //  Processing.CDS_RNC(0)
> > +	{ CCI_REG8(0x2048), 0x1 }, //  Processing.CDS_IMG(0)
> > +	{ CCI_REG8(0x204b), 0x3 }, //  Processing.RNC_EN(0)
> > +	{ CCI_REG8(0x205b), 0x64 }, //  Processing.RNC_DARK_TARGET(0)
> > +	{ CCI_REG8(0x205c), 0x0 }, //  Processing.RNC_DARK_TARGET(1)
> > +	{ CCI_REG8(0x24dc), 0x12 }, //  Defect Pixel Correction.DC_ENABLE(0)
> > +	{ CCI_REG8(0x24dc), 0x10 }, //  Defect Pixel Correction.DC_MODE(0)
> > +	{ CCI_REG8(0x24dc), 0x0 }, //  Defect Pixel Correction.DC_REPLACEMENT_VALUE(0)
> > +	{ CCI_REG8(0x24dd), 0x0 }, //  Defect Pixel Correction.DC_LIMIT_LOW(0)
> > +	{ CCI_REG8(0x24de), 0x0 }, //  Defect Pixel Correction.DC_LIMIT_HIGH(0)
> > +	{ CCI_REG8(0x24df), 0x0 }, //  Defect Pixel Correction.DC_LIMIT_HIGH_MODE(0)
> > +	/* Illumination */
> > +	{ CCI_REG8(0x10d7), 0x1 }, //  Illumination Trigger.ILLUM_EN(0)
> > +	{ CCI_REG8(0x10d8), 0x2 }, //  Illumination Trigger.ILLUM_POL(0)
> > +	/* Histogram */
> > +	{ CCI_REG8(0x205d), 0x0 }, //  Histogram.HIST_EN(0)
> > +	{ CCI_REG8(0x205e), 0x0 }, //  Histogram.HIST_USAGE_RATIO(0)
> > +	{ CCI_REG8(0x2063), 0x0 }, //  Histogram.PIXEL_DATA_SUPP(0)
> > +	{ CCI_REG8(0x2063), 0x0 }, //  Histogram.PIXEL_TRANSMISSION(0)
> > +	/* TP */
> > +	{ CCI_REG8(0x2091), 0x0 }, //  Test Pattern Generator.TPG_EN(0)
> > +	{ CCI_REG8(0x2091), 0x0 }, //  Test Pattern Generator.TPG_CONFIG(0)
> > +	/* Reduce Slew Rate - fix for defect line */
> > +	{ CCI_REG8(0x402d), 0x7b },
> > +};
> > +
> > +static const char *const mira220_test_pattern_menu[] = {
> > +	"Disabled",
> > +	"Vertical Gradient",
> > +};
> > +
> > +static const int mira220_test_pattern_val[] = {
> > +	MIRA220_TEST_PATTERN_DISABLE,
> > +	MIRA220_TEST_PATTERN_VERTICAL_GRADIENT,
> > +};
> > +
> > +/* regulator supplies */
> > +static const char *const mira220_supplies[] = {
> > +	/* Supplies can be enabled in any order */
> > +	"vana", /* Analog (2.8V) supply */
> > +	"vdig", /* Digital Core (1.8V) supply */
> > +	"vddl", /* IF (1.2V) supply */
> > +};
> > +
> > +struct mira220 {
> > +	struct v4l2_subdev sd;
> > +	struct media_pad pad;
> > +
> > +	enum mira220_variants variant;
> > +
> > +	struct clk *xclk;
> > +	u32 xclk_freq;
> > +
> > +	struct regulator_bulk_data supplies[ARRAY_SIZE(mira220_supplies)];
> > +
> > +	struct gpio_desc *reset_gpio;
> > +
> > +	unsigned int lanes;
> > +	unsigned int row_length;
> > +
> > +	struct v4l2_ctrl_handler ctrl_handler;
> > +	struct v4l2_ctrl *vflip;
> > +	struct v4l2_ctrl *hflip;
> > +	struct v4l2_ctrl *vblank;
> > +	struct v4l2_ctrl *exposure;
> > +
> > +	struct regmap *regmap;
> > +};
> > +
> > +static inline struct mira220 *to_mira220(struct v4l2_subdev *sd)
> > +{
> > +	return container_of_const(sd, struct mira220, sd);
> > +}
> > +
> > +static bool mira220_is_mono(struct mira220 *mira220)
> > +{
> > +	return mira220->variant == MIRA220_VARIANT_MONO;
> > +}
> > +
> > +/*
> > + * The supported formats. This table contains 4 entries per format, to cover the
> > + * various flip combinations in the order:
> > + * - no flip
> > + * - h flip
> > + * - v flip
> > + * - h&v flips
> > + */
> > +static const u32 mira220_mbus_color_formats[] = {
> > +	MEDIA_BUS_FMT_SGRBG12_1X12,
> > +	MEDIA_BUS_FMT_SRGGB12_1X12,
> > +	MEDIA_BUS_FMT_SBGGR12_1X12,
> > +	MEDIA_BUS_FMT_SGBRG12_1X12,
> > +
> > +	MEDIA_BUS_FMT_SGRBG10_1X10,
> > +	MEDIA_BUS_FMT_SRGGB10_1X10,
> > +	MEDIA_BUS_FMT_SBGGR10_1X10,
> > +	MEDIA_BUS_FMT_SGBRG10_1X10,
> > +
> > +	MEDIA_BUS_FMT_SGRBG8_1X8,
> > +	MEDIA_BUS_FMT_SRGGB8_1X8,
> > +	MEDIA_BUS_FMT_SBGGR8_1X8,
> > +	MEDIA_BUS_FMT_SGBRG8_1X8,
> > +};
> > +
> > +static const u32 mira220_mbus_mono_formats[] = {
> > +	MEDIA_BUS_FMT_Y12_1X12,
> > +	MEDIA_BUS_FMT_Y10_1X10,
> > +	MEDIA_BUS_FMT_Y8_1X8,
> > +};
> > +
> > +#define MIRA220_FLIP_FORMAT_MASK	0x3
> > +static inline unsigned int mira220_flip_format_index(struct mira220 *mira220,
> > +						     unsigned int index)
> > +{
> > +	return (index & ~MIRA220_FLIP_FORMAT_MASK)	|
> > +	       (mira220->vflip->val ? BIT(1) : 0)	|
> > +	       (mira220->hflip->val ? BIT(0) : 0);
> > +}
> > +
> > +/* Power/clock management functions */
> > +static int mira220_power_on(struct device *dev)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct mira220 *mira220 = to_mira220(sd);
> > +	int ret;
> > +
> > +	ret = regulator_bulk_enable(ARRAY_SIZE(mira220_supplies),
> > +				    mira220->supplies);
> > +	if (ret) {
> > +		dev_err(&client->dev, "%s: failed to enable regulators\n",
> > +			__func__);
> > +		return ret;
> > +	}
> > +
> > +	ret = clk_prepare_enable(mira220->xclk);
> > +	if (ret) {
> > +		dev_err(&client->dev, "%s: failed to enable clock\n", __func__);
> > +		goto reg_off;
> > +	}
> > +
> > +	gpiod_set_value_cansleep(mira220->reset_gpio, 0);
> > +
> > +	return 0;
> > +
> > +reg_off:
> > +	regulator_bulk_disable(ARRAY_SIZE(mira220_supplies), mira220->supplies);
> > +	return ret;
> > +}
> > +
> > +static int mira220_power_off(struct device *dev)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct mira220 *mira220 = to_mira220(sd);
> > +
> > +	gpiod_set_value_cansleep(mira220->reset_gpio, 1);
> > +	clk_disable_unprepare(mira220->xclk);
> > +	regulator_bulk_disable(ARRAY_SIZE(mira220_supplies), mira220->supplies);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mira220_write_start_streaming_regs(struct mira220 *mira220)
> > +{
> > +	int ret = 0;
> > +
> > +	/* Setting master control */
> > +	cci_write(mira220->regmap, MIRA220_IMAGER_STATE_REG,
> > +		  MIRA220_IMAGER_STATE_MASTER_CONTROL, &ret);
> > +
> > +	/* Enable continuous streaming */
> > +	cci_write(mira220->regmap, MIRA220_IMAGER_RUN_CONT_REG,
> > +		  MIRA220_IMAGER_RUN_CONT_ENABLE, &ret);
> > +	cci_write(mira220->regmap, MIRA220_IMAGER_RUN_REG,
> > +		  MIRA220_IMAGER_RUN_START, &ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static int mira220_write_stop_streaming_regs(struct mira220 *mira220)
> > +{
> > +	int ret = 0;
> > +
> > +	cci_write(mira220->regmap, MIRA220_IMAGER_STATE_REG,
> > +		  MIRA220_IMAGER_STATE_STOP_AT_ROW, &ret);
> > +	cci_write(mira220->regmap, MIRA220_IMAGER_RUN_REG,
> > +		  MIRA220_IMAGER_RUN_STOP, &ret);
> > +
> > +	return ret;
> > +}
> > +
> > +/*
> > + * Returns the exposure in lines. Calculation is baded on Mira220 datasheet
> > + * Section 9.2.
> > + */
> > +static u32 mira220_calc_exposure(struct mira220 *mira220, u32 height, u32 vblank)
> > +{
> > +	u32 max_exposure = (height + vblank) -
> > +			   (MIRA220_GLOB_NUM_CLK_CYCLES / mira220->row_length);
> > +
> > +	return min(max_exposure, MIRA220_MAX_EXPOSURE);
> > +}
> > +
> > +static u32 mira220_calc_min_vblank(struct mira220 *mira220)
> > +{
> > +	return (MIRA220_GLOB_NUM_CLK_CYCLES / mira220->row_length)
> > +	       + MIRA220_MIN_VBLANK_MARGIN;
> > +}
> > +
> > +static int mira220_write_exposure_reg(struct mira220 *mira220, u32 exposure)
> > +{
> > +	struct i2c_client *const client = v4l2_get_subdevdata(&mira220->sd);
> > +	int ret;
> > +
> > +	ret = cci_write(mira220->regmap, MIRA220_EXP_TIME_REG, exposure, NULL);
> > +	if (ret) {
> > +		dev_err_ratelimited(&client->dev,
> > +				    "Error setting exposure time to %d",
> > +				    exposure);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/* Get bayer order based on flip setting. */
> > +static u32 mira220_get_format_code(struct mira220 *mira220, u32 code)
> > +{
> > +	unsigned int i;
> > +
> > +	if (mira220_is_mono(mira220)) {
> > +		for (i = 0; i < ARRAY_SIZE(mira220_mbus_mono_formats); i++) {
> > +			if (mira220_mbus_mono_formats[i] == code)
> > +				return mira220_mbus_mono_formats[i];
> > +		}
> > +
> > +		return mira220_mbus_mono_formats[0];
> > +	}
> > +
> > +	for (i = 0; i < ARRAY_SIZE(mira220_mbus_color_formats); i++) {
> > +		if (mira220_mbus_color_formats[i] == code)
> > +			break;
> > +	}
> > +	if (i >= ARRAY_SIZE(mira220_mbus_color_formats))
> > +		i = 0;
> > +
> > +	i = mira220_flip_format_index(mira220, i);
> > +
> > +	return mira220_mbus_color_formats[i];
> > +}
> > +
> > +static int mira220_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct mira220 *mira220 =
> > +		container_of(ctrl->handler, struct mira220, ctrl_handler);
> > +	struct i2c_client *client = v4l2_get_subdevdata(&mira220->sd);
> > +	struct v4l2_mbus_framefmt *format;
> > +	struct v4l2_subdev_state *state;
> > +	int ret = 0;
> > +
> > +	state = v4l2_subdev_get_locked_active_state(&mira220->sd);
> > +	format = v4l2_subdev_state_get_format(state, 0);
> > +
> > +	if (ctrl->id == V4L2_CID_VBLANK) {
> > +		int exposure_max, exposure_def;
> > +
> > +		/* Update max exposure while meeting expected vblanking */
> > +		exposure_max = mira220_calc_exposure(mira220, format->height,
> > +						     ctrl->val);
> > +		exposure_def = min(exposure_max, MIRA220_DEFAULT_EXPOSURE);
> > +		ret = __v4l2_ctrl_modify_range(mira220->exposure,
> > +					       mira220->exposure->minimum,
> > +					       exposure_max,
> > +					       mira220->exposure->step,
> > +					       exposure_def);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	/* Update the format code to adjust it to the new flip state. */
> > +	if (ctrl->id == V4L2_CID_VFLIP || ctrl->id == V4L2_CID_HFLIP)
> > +		format->code = mira220_get_format_code(mira220, format->code);
> > +
> > +	if (!pm_runtime_get_if_in_use(&client->dev))
> > +		return 0;
> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_EXPOSURE:
> > +		ret = mira220_write_exposure_reg(mira220, ctrl->val);
> > +		break;
> > +	case V4L2_CID_TEST_PATTERN:
> > +		ret = cci_write(mira220->regmap, MIRA220_REG_TEST_PATTERN,
> > +				mira220_test_pattern_val[ctrl->val], NULL);
> > +		break;
> > +	case V4L2_CID_HFLIP:
> > +		ret = cci_write(mira220->regmap, MIRA220_HFLIP_REG,
> > +				mira220->hflip->val, NULL);
> > +		break;
> > +	case V4L2_CID_VFLIP:
> > +		ret = cci_write(mira220->regmap, MIRA220_VFLIP_REG,
> > +				mira220->vflip->val, NULL);
> > +		break;
> > +	case V4L2_CID_VBLANK:
> > +		ret = cci_write(mira220->regmap, MIRA220_VBLANK_REG, ctrl->val,
> > +				NULL);
> > +		break;
> > +	default:
> > +		dev_info(&client->dev,
> > +			 "ctrl(id:0x%x,val:0x%x) is not handled\n", ctrl->id,
> > +			 ctrl->val);
> > +		ret = -EINVAL;
> > +		break;
> > +	}
> > +
> > +	pm_runtime_put_autosuspend(&client->dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops mira220_ctrl_ops = {
> > +	.s_ctrl = mira220_set_ctrl,
> > +};
> > +
> > +static void mira220_update_pad_format(struct mira220 *mira220,
> > +				      struct v4l2_mbus_framefmt *fmt, u32 code)
> > +{
> > +	/* Bayer order varies with flips */
> > +	fmt->code = mira220_get_format_code(mira220, code);
> > +	/*
> > +	 * The mira220 sensor doesn't support binning/skipping but only
> > +	 * cropping to reduce the frame size so the correct API to configure
> > +	 * windowing is the .set_selection one, while format is fixed to
> > +	 * the full resolution 1600x1400 one.
> > +	 */
> > +	fmt->width = MIRA220_PIXEL_ARRAY_WIDTH;
> > +	fmt->height = MIRA220_PIXEL_ARRAY_HEIGHT;
> > +	fmt->field = V4L2_FIELD_NONE;
> > +	fmt->colorspace = V4L2_COLORSPACE_RAW;
> > +	fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> > +	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > +	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
> > +}
> > +
> > +static int mira220_set_pad_format(struct v4l2_subdev *sd,
> > +				  struct v4l2_subdev_state *state,
> > +				  struct v4l2_subdev_format *fmt)
> > +{
> > +	struct mira220 *mira220 = to_mira220(sd);
> > +	struct v4l2_rect *crop;
> > +	u32 min_vblank;
> > +	int ret;
> > +
> > +	mira220_update_pad_format(mira220, &fmt->format, fmt->format.code);
> > +	*v4l2_subdev_state_get_format(state, 0) = fmt->format;
> > +
> > +	crop = v4l2_subdev_state_get_crop(state, 0);
> > +	crop->width = fmt->format.width;
> > +	crop->height = fmt->format.height;
> > +	crop->left = MIRA220_PIXEL_ARRAY_LEFT;
> > +	crop->top = MIRA220_PIXEL_ARRAY_TOP;
> > +
> > +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > +		return 0;
> > +
> > +	/* Update vblank based on new mode. */
> > +	min_vblank = mira220_calc_min_vblank(mira220);
> > +	ret = __v4l2_ctrl_modify_range(mira220->vblank, min_vblank,
> > +				       MIRA220_MAX_VBLANK, 1, min_vblank);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return __v4l2_ctrl_s_ctrl(mira220->vblank, min_vblank);
> > +}
> > +
> > +static int mira220_enum_mbus_code(struct v4l2_subdev *sd,
> > +				  struct v4l2_subdev_state *state,
> > +				  struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	struct mira220 *mira220 = to_mira220(sd);
> > +	bool mono = mira220_is_mono(mira220);
> > +	unsigned int num_formats;
> > +	unsigned int index;
> > +	const u32 *codes;
> > +
> > +	num_formats = mono ? ARRAY_SIZE(mira220_mbus_mono_formats) :
> > +			     (ARRAY_SIZE(mira220_mbus_color_formats) / 4);
> > +
> > +	if (code->index >= num_formats)
> > +		return -EINVAL;
> > +
> > +	index = mono ? code->index : (code->index * 4);
> > +	codes = mono ? mira220_mbus_mono_formats : mira220_mbus_color_formats;
> > +	code->code = mira220_get_format_code(mira220, codes[index]);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mira220_enum_frame_size(struct v4l2_subdev *sd,
> > +				   struct v4l2_subdev_state *state,
> > +				   struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +	struct mira220 *mira220 = to_mira220(sd);
> > +	u32 code;
> > +
> > +	if (fse->index)
> > +		return -EINVAL;
> > +
> > +	code = mira220_get_format_code(mira220, fse->code);
> > +	if (fse->code != code)
> > +		return -EINVAL;
> > +
> > +	fse->min_width = MIRA220_PIXEL_ARRAY_WIDTH;
> > +	fse->max_width = fse->min_width;
> > +	fse->min_height = MIRA220_PIXEL_ARRAY_HEIGHT;
> > +	fse->max_height = fse->min_height;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mira220_init_state(struct v4l2_subdev *sd,
> > +			      struct v4l2_subdev_state *state)
> > +{
> > +	struct v4l2_subdev_format fmt = {
> > +		.which = V4L2_SUBDEV_FORMAT_TRY,
> > +		.pad = 0,
> > +		.format = {
> > +			.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> > +			.width = MIRA220_PIXEL_ARRAY_WIDTH,
> > +			.height = MIRA220_PIXEL_ARRAY_HEIGHT,
> > +		},
> > +	};
> > +
> > +	mira220_set_pad_format(sd, state, &fmt);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mira220_set_bus_config(struct mira220 *mira220)
> > +{
> > +	int ret = 0;
> > +
> > +	cci_write(mira220->regmap, MIRA220_MIPI_LANES_REG,
> > +		  mira220->lanes - 1, &ret);
> > +
> > +	cci_write(mira220->regmap, MIRA220_MIPI_CLK_MODE_REG,
> > +		  MIRA220_MIPI_CLK_CONTINUOUS, &ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static int mira220_set_framefmt(struct mira220 *mira220,
> > +				struct v4l2_subdev_state *state)
> > +{
> > +	const struct v4l2_mbus_framefmt *format;
> > +	u32 top, left;
> > +	int ret = 0;
> > +
> > +	format = v4l2_subdev_state_get_format(state, 0);
> > +
> > +	/* Program the image format bit order, bit depth and CSI-2 data type */
> > +
> > +	ret = cci_write(mira220->regmap, MIRA220_BIT_ORDER_REG,
> > +			MIRA220_BIT_ORDER_NORMAL, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	switch (format->code) {
> > +	case MEDIA_BUS_FMT_Y8_1X8:
> > +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +		cci_write(mira220->regmap, MIRA220_BIT_DEPTH_REG,
> > +			  MIRA220_BIT_DEPTH_8_BIT, &ret);
> > +		cci_write(mira220->regmap, MIRA220_CSI_DATA_TYPE_REG,
> > +			  MIRA220_CSI_DATA_TYPE_8_BIT, &ret);
> > +		break;
> > +	case MEDIA_BUS_FMT_Y10_1X10:
> > +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +		cci_write(mira220->regmap, MIRA220_BIT_DEPTH_REG,
> > +			  MIRA220_BIT_DEPTH_10_BIT, &ret);
> > +		cci_write(mira220->regmap, MIRA220_CSI_DATA_TYPE_REG,
> > +			  MIRA220_CSI_DATA_TYPE_10_BIT, &ret);
> > +
> > +		break;
> > +	case MEDIA_BUS_FMT_Y12_1X12:
> > +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> > +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> > +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> > +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> > +		cci_write(mira220->regmap, MIRA220_BIT_DEPTH_REG,
> > +			  MIRA220_BIT_DEPTH_12_BIT, &ret);
> > +		cci_write(mira220->regmap, MIRA220_CSI_DATA_TYPE_REG,
> > +			  MIRA220_CSI_DATA_TYPE_12_BIT, &ret);
> > +
> > +		break;
> > +	default:
> > +		ret = -EINVAL;
> > +		break;
> > +	}
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Program the sensor's row length. */
> > +	ret = cci_write(mira220->regmap, MIRA220_REG_ROW_LENGTH,
> > +			mira220->row_length, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Program the ROI area, centered in the sensor's pixel array.
> > +	 *
> > +	 * TODO: Use the crop rectangle sizes once the driver is ported to the
> > +	 * new RAW camera sensor model.
> > +	 */
> > +	top = (MIRA220_PIXEL_ARRAY_HEIGHT - format->height) / 2;
> > +	left = (MIRA220_PIXEL_ARRAY_WIDTH - format->width) / 2;
> > +
> > +	cci_write(mira220->regmap, MIRA220_VSTART_REG, top, &ret);
> > +	cci_write(mira220->regmap, MIRA220_HSTART_REG,
> > +		  left & MIRA220_HSTART_MASK, &ret);
> > +	cci_write(mira220->regmap, MIRA220_VSIZE_REG, format->height, &ret);
> > +	cci_write(mira220->regmap, MIRA220_HSIZE_REG,
> > +		  (format->width / 2) & MIRA220_HSIZE_MASK, &ret);
> > +	cci_write(mira220->regmap, MIRA220_MIPI_HSIZE_REG, format->width, &ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static int mira220_get_selection(struct v4l2_subdev *sd,
> > +				 struct v4l2_subdev_state *state,
> > +				 struct v4l2_subdev_selection *sel)
> > +{
> > +	switch (sel->target) {
> > +	case V4L2_SEL_TGT_CROP:
> > +		sel->r = *v4l2_subdev_state_get_crop(state, 0);
> > +		return 0;
> > +
> > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > +		sel->r.top = 0;
> > +		sel->r.left = 0;
> > +		sel->r.width = MIRA220_NATIVE_WIDTH;
> > +		sel->r.height = MIRA220_NATIVE_HEIGHT;
> > +		return 0;
> > +
> > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > +		sel->r.top = MIRA220_PIXEL_ARRAY_TOP;
> > +		sel->r.left = MIRA220_PIXEL_ARRAY_LEFT;
> > +		sel->r.width = MIRA220_PIXEL_ARRAY_WIDTH;
> > +		sel->r.height = MIRA220_PIXEL_ARRAY_HEIGHT;
> > +		return 0;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +/* OTP power on */
> > +static int mira220_otp_power_on(struct mira220 *mira220)
> > +{
> > +	int ret = cci_write(mira220->regmap, MIRA220_OTP_CMD_REG,
> > +			    MIRA220_OTP_CMD_UP, NULL);
> > +	fsleep(100);
> > +
> > +	return ret;
> > +}
> > +
> > +/* OTP power off */
> > +static int mira220_otp_power_off(struct mira220 *mira220)
> > +{
> > +	return cci_write(mira220->regmap, MIRA220_OTP_CMD_REG,
> > +			 MIRA220_OTP_CMD_DOWN, NULL);
> > +}
> > +
> > +/* OTP power on */
> > +static int mira220_otp_read(struct mira220 *mira220, u8 addr, u8 offset,
> > +			    u8 *val, int *err)
> > +{
> > +	u64 readback;
> > +	int ret = 0;
> > +
> > +	if (err && *err)
> > +		return *err;
> > +
> > +	cci_write(mira220->regmap, CCI_REG8(0x0086), addr, &ret);
> > +	cci_write(mira220->regmap, CCI_REG8(0x0080), 0x02, &ret);
> > +	cci_read(mira220->regmap, CCI_REG8(0x0082 + offset), &readback, &ret);
> > +	if (ret)
> > +		goto out;
> > +
> > +	*val = readback & 0xFF;
> > +
> > +	return 0;
> > +
> > +out:
> > +	if (err)
> > +		*err = ret;
> > +	return ret;
> > +}
> > +
> > +/* Verify chip ID, module version, unique ID and variant */
> > +static int mira220_identify_module(struct mira220 *mira220)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&mira220->sd);
> > +	u8 b0, b1, b2, b3, b4, b5, b6, b7;
> > +	u32 variant;
> > +	int ret;
> > +	u8 val;
> > +	u8 id;
> > +
> > +	ret = mira220_otp_power_on(mira220);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Log module version checks */
> > +	mira220_otp_read(mira220, 0x0d, 0, &val, &ret);
> > +	mira220_otp_read(mira220, 0x1e, 0, &val, &ret);
> > +	if (ret)
> > +		goto err_power_off;
> > +
> > +	/* Check unique module hardware ID version */
> > +	ret = mira220_otp_read(mira220, 0x3a, 0, &id, NULL);
> > +	if (ret)
> > +		goto err_power_off;
> > +
> > +	if (id < 1 || id > 2) {
> > +		dev_err(&client->dev,
> > +			"Read OTP 0x3a, id must be 1 or 2, but got: 0x%02x\n", id);
> > +		ret = -EINVAL;
> > +		goto err_power_off;
> > +	}
> > +
> > +	/* Read Unique ID bytes sequentially using the correct 4-argument signature */
> > +	mira220_otp_read(mira220, 0x25, 0, &b0, &ret);
> > +	mira220_otp_read(mira220, 0x1e, 0, &b1, &ret);
> > +	mira220_otp_read(mira220, 0x1e, 1, &b2, &ret);
> > +	mira220_otp_read(mira220, 0x1e, 2, &b3, &ret);
> > +	mira220_otp_read(mira220, 0x1d, 0, &b4, &ret);
> > +	mira220_otp_read(mira220, 0x1d, 1, &b5, &ret);
> > +	mira220_otp_read(mira220, 0x1d, 2, &b6, &ret);
> > +	mira220_otp_read(mira220, 0x1d, 3, &b7, &ret);
> > +	if (ret)
> > +		goto err_power_off;
> > +
> > +	dev_dbg(&client->dev, "Unique ID: %02X:%02X:%02X:%02X:%02X:%02X:%02X:%02X\n",
> > +		b7, b6, b5, b4, b3, b2, b1, b0);
> > +
> > +	mira220_otp_read(mira220, 0x3e, 0, &b0, &ret);
> > +	mira220_otp_read(mira220, 0x3e, 1, &b1, &ret);
> > +	mira220_otp_read(mira220, 0x3e, 2, &b2, &ret);
> > +	mira220_otp_read(mira220, 0x3e, 3, &b3, &ret);
> > +	if (ret)
> > +		goto err_power_off;
> > +
> > +	variant = b0 | b1 << 8 | b2 << 16 | b3 << 24;
> > +
> > +	switch (variant) {
> > +	case MIRA220_MONO_PLAIN_PF:
> > +	case MIRA220_MONO_PLAIN_NO_PF:
> > +	case MIRA220_MONO_AR_PF:
> > +		dev_dbg(&client->dev, "Mira220 MONO variant: %x\n", variant);
> > +		mira220->variant = MIRA220_VARIANT_MONO;
> > +		break;
> > +	case MIRA220_RGB_PLAIN_PF:
> > +	case MIRA220_RGB_PLAIN_NO_PF:
> > +	case MIRA220_RGB_AR_PF:
> > +		dev_dbg(&client->dev, "Mira220 RGB variant: %x\n", variant);
> > +		mira220->variant = MIRA220_VARIANT_RGB;
> > +		break;
> > +	default:
> > +		dev_info(&client->dev,
> > +			 "Unsupported mira220 variant %x; default to RGB\n",
> > +			 variant);
> > +		mira220->variant = MIRA220_VARIANT_RGB;
> > +		break;
> > +	}
> > +
> > +err_power_off:
> > +	mira220_otp_power_off(mira220);
> > +	return ret;
> > +}
> > +
> > +static int mira220_otp_restore(struct mira220 *mira220)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&mira220->sd);
> > +	static const u16 reg_list[] = {
> > +		0x4015, 0x4016, 0x4017, 0x4018, 0x403B, 0x4040, 0x4041, 0x4042,
> > +		0x402a, 0x4029, 0x4009
> > +	};
> > +	u8 val;
> > +	int ret;
> > +
> > +	ret = mira220_otp_power_on(mira220);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Write OTP to image sensor when programmed */
> > +	ret = mira220_otp_read(mira220, 0x1d, 0, &val, NULL);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "Failed to read OTP programming status\n");
> > +		goto out;
> > +	}
> > +
> > +	if (val == 0xff) {
> > +		dev_info(&client->dev, "OTP not programmed, skipping calibration\n");
> > +		return mira220_otp_power_off(mira220);
> > +	}
> > +
> > +	for (unsigned int i = 0; i < ARRAY_SIZE(reg_list); i++) {
> > +		ret = mira220_otp_read(mira220, i, 0, &val, NULL);
> > +		if (ret < 0) {
> > +			dev_err(&client->dev, "Failed to read OTP address %d\n", i);
> > +			goto out;
> > +		}
> > +		ret = cci_write(mira220->regmap, CCI_REG8(reg_list[i]), val, NULL);
> > +		if (ret < 0) {
> > +			dev_err(&client->dev,
> > +				"Failed to write register 0x%04x\n", reg_list[i]);
> > +			goto out;
> > +		}
> > +		dev_dbg(&client->dev, "OTP CALIBRATION: 0x%04x, val=0x%02x\n",
> > +			reg_list[i], val);
> > +	}
> > +
> > +	ret = mira220_otp_read(mira220, 0x0d, 0, &val, NULL);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "Failed to read OTP address 0x0d\n");
> > +		goto out;
> > +	}
> > +
> > +	ret = cci_write(mira220->regmap, CCI_REG8(0x403e), val, NULL);
> > +	if (ret < 0)
> > +		dev_err(&client->dev, "Failed to write register 0x403e\n");
> > +
> > +out:
> > +	mira220_otp_power_off(mira220);
> > +	return ret;
> > +}
> > +
> > +static int mira220_enable_streams(struct v4l2_subdev *sd,
> > +				  struct v4l2_subdev_state *state, u32 pad,
> > +				  u64 streams_mask)
> > +{
> > +	struct mira220 *mira220 = to_mira220(sd);
> > +	struct i2c_client *client = v4l2_get_subdevdata(&mira220->sd);
> > +	int ret;
> > +
> > +	ret = pm_runtime_resume_and_get(&client->dev);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/*
> > +	 * Apply default values of current mode. Stop streaming before
> > +	 * uploading register sequence.
> > +	 */
> > +	ret = mira220_write_stop_streaming_regs(mira220);
> > +	if (ret)
> > +		goto err_rpm_put;
> > +
> > +	ret = cci_multi_reg_write(mira220->regmap, mira220_init_reg_list,
> > +				  ARRAY_SIZE(mira220_init_reg_list), NULL);
> > +	if (ret)
> > +		goto err_rpm_put;
> > +
> > +	ret = mira220_otp_restore(mira220);
> > +	if (ret)
> > +		goto err_rpm_put;
> > +
> > +	ret = mira220_set_bus_config(mira220);
> > +	if (ret)
> > +		goto err_rpm_put;
> > +
> > +	ret = mira220_set_framefmt(mira220, state);
> > +	if (ret)
> > +		goto err_rpm_put;
>
> Instead of a series of ifs and gotos, you could do
>
> 	if (!ret)
> 		...;
>
> Up to you.
>

	ret = pm_runtime_resume_and_get(&client->dev);
	if (ret < 0)
		return ret;

	/*
	 * Apply default values of current mode. Stop streaming before
	 * uploading register sequence.
	 */
	if (!ret)
		ret = mira220_write_stop_streaming_regs(mira220);
	if (!ret)
		ret = cci_multi_reg_write(mira220->regmap, mira220_init_reg_list,
					  ARRAY_SIZE(mira220_init_reg_list), NULL);
	if (!ret)
		ret = mira220_otp_restore(mira220);
	if (!ret)
		ret = mira220_set_bus_config(mira220);
	if (!ret)
		ret = mira220_set_framefmt(mira220, state);

	/* Apply customized values from user */
	if (!ret)
		ret = __v4l2_ctrl_handler_setup(mira220->sd.ctrl_handler);
	if (!ret)
		ret = mira220_write_start_streaming_regs(mira220);

	if (ret)
		goto err_rpm_put;

	/* vflip and hflip cannot change during streaming */
	__v4l2_ctrl_grab(mira220->hflip, true);
	__v4l2_ctrl_grab(mira220->vflip, true);

	return 0;

Looks a bit unusual, but I think I can do that

> > +
> > +	/* Apply customized values from user */
> > +	ret = __v4l2_ctrl_handler_setup(mira220->sd.ctrl_handler);
> > +	if (ret)
> > +		goto err_rpm_put;
> > +
> > +	ret = mira220_write_start_streaming_regs(mira220);
> > +	if (ret)
> > +		goto err_rpm_put;
> > +
> > +	/* vflip and hflip cannot change during streaming */
> > +	__v4l2_ctrl_grab(mira220->hflip, true);
> > +	__v4l2_ctrl_grab(mira220->vflip, true);
> > +
> > +	return 0;
> > +
> > +err_rpm_put:
> > +	pm_runtime_put_autosuspend(&client->dev);
> > +	return ret;
> > +}
> > +
> > +static int mira220_disable_streams(struct v4l2_subdev *sd,
> > +				   struct v4l2_subdev_state *state, u32 pad,
> > +				   u64 streams_mask)
> > +{
> > +	struct mira220 *mira220 = to_mira220(sd);
> > +	struct i2c_client *client = v4l2_get_subdevdata(&mira220->sd);
> > +
> > +	mira220_write_stop_streaming_regs(mira220);
> > +
> > +	__v4l2_ctrl_grab(mira220->hflip, false);
> > +	__v4l2_ctrl_grab(mira220->vflip, false);
> > +
> > +	pm_runtime_put_autosuspend(&client->dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mira220_get_regulators(struct mira220 *mira220)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&mira220->sd);
> > +
> > +	for (unsigned int i = 0; i < ARRAY_SIZE(mira220_supplies); i++)
> > +		mira220->supplies[i].supply = mira220_supplies[i];
> > +
> > +	return devm_regulator_bulk_get(&client->dev,
> > +				       ARRAY_SIZE(mira220_supplies),
> > +				       mira220->supplies);
> > +}
> > +
> > +static const struct v4l2_subdev_video_ops mira220_video_ops = {
> > +	.s_stream = v4l2_subdev_s_stream_helper,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops mira220_pad_ops = {
> > +	.enum_mbus_code = mira220_enum_mbus_code,
> > +	.get_fmt = v4l2_subdev_get_fmt,
> > +	.set_fmt = mira220_set_pad_format,
> > +	.get_selection = mira220_get_selection,
> > +	.enum_frame_size = mira220_enum_frame_size,
> > +	.enable_streams = mira220_enable_streams,
> > +	.disable_streams = mira220_disable_streams,
> > +};
> > +
> > +static const struct v4l2_subdev_ops mira220_subdev_ops = {
> > +	.video = &mira220_video_ops,
> > +	.pad = &mira220_pad_ops,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops mira220_internal_ops = {
> > +	.init_state = mira220_init_state,
> > +};
> > +
> > +/* Initialize control handlers */
> > +static int mira220_init_controls(struct mira220 *mira220)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&mira220->sd);
> > +	struct v4l2_ctrl_handler *ctrl_hdlr;
> > +	struct v4l2_fwnode_device_properties props;
> > +	struct v4l2_ctrl *ctrl;
> > +	u32 max_exposure = 0;
> > +	u32 min_vblank;
> > +	u32 hblank_val;
> > +	int ret;
> > +
> > +	ctrl_hdlr = &mira220->ctrl_handler;
> > +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* By default, PIXEL_RATE is read only */
> > +	v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops, V4L2_CID_PIXEL_RATE,
> > +			  MIRA220_PIXEL_RATE, MIRA220_PIXEL_RATE, 1,
> > +			  MIRA220_PIXEL_RATE);
> > +
> > +	min_vblank = mira220_calc_min_vblank(mira220);
> > +	mira220->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
> > +					    V4L2_CID_VBLANK,
> > +					    min_vblank, MIRA220_MAX_VBLANK, 1,
> > +					    min_vblank);
> > +
> > +	ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL, V4L2_CID_LINK_FREQ,
> > +				      0, 0, &mira220_link_freqs[0]);
> > +	if (ctrl)
> > +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +	/*
> > +	 * Scale hblank according to the number of enabled data lanes to match
> > +	 * row_length.
> > +	 */
> > +	hblank_val = MIRA220_LLP_1600x1400_304 * (2 / mira220->lanes)
> > +		   - MIRA220_PIXEL_ARRAY_WIDTH;
> > +	ctrl = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK, hblank_val,
> > +				 hblank_val, 1, hblank_val);
> > +	if (ctrl)
> > +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +	/* Max exposure is determined by vblank + vsize and Tglob. */
> > +	max_exposure = mira220_calc_exposure(mira220,
> > +					     MIRA220_PIXEL_ARRAY_HEIGHT,
> > +					     min_vblank);
> > +
> > +	mira220->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
> > +					      V4L2_CID_EXPOSURE,
> > +					      MIRA220_EXPOSURE_MIN,
> > +					      max_exposure, 1,
> > +					      MIRA220_DEFAULT_EXPOSURE);
> > +
> > +	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_ANALOGUE_GAIN,
> > +			  MIRA220_ANALOG_GAIN_MIN, MIRA220_ANALOG_GAIN_MAX,
> > +			  MIRA220_ANALOG_GAIN_STEP,
> > +			  MIRA220_ANALOG_GAIN_DEFAULT);
> > +
> > +	mira220->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
> > +					   V4L2_CID_HFLIP, 0, 1, 1, 0);
> > +	if (mira220->hflip)
> > +		mira220->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>
> You can omit these checks if you move setting the control flags after

ah yes

> checking for the handler's error state. I'd use different variables for the
> hblank and vblank controls for this reason.

vblank is writable and stored in the driver structure

link_freq and hblank are RO and re-use the local 'ctrl' variable.

if I move everything below, I'll have to use 2 different variables for
sure

>
> > +
> > +	mira220->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
> > +					   V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +	if (mira220->vflip)
> > +		mira220->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +
> > +	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &mira220_ctrl_ops,
> > +				     V4L2_CID_TEST_PATTERN,
> > +				     ARRAY_SIZE(mira220_test_pattern_menu) - 1,
> > +				     0, 0, mira220_test_pattern_menu);
> > +
> > +	if (ctrl_hdlr->error) {
> > +		ret = ctrl_hdlr->error;
> > +		goto error;
> > +	}
> > +
> > +	ret = v4l2_fwnode_device_parse(&client->dev, &props);
>
> You can significantly improve error handling by moving this before
> initialising the control handler.
>

Sure

> > +	if (ret)
> > +		goto error;
> > +
> > +	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &mira220_ctrl_ops,
> > +					      &props);
> > +	if (ret)
> > +		goto error;
>
> This should also be done before checking for handler's errors. In fact,
> v4l2_ctrl_new_fwnode_properties() also returns the handler's error status.
>

Right

> > +
> > +	mira220->sd.ctrl_handler = ctrl_hdlr;
> > +
> > +	return 0;
> > +
> > +error:
> > +	v4l2_ctrl_handler_free(ctrl_hdlr);
> > +
> > +	return ret;
> > +}
> > +
> > +static int mira220_parse_endpoint(struct device *dev, struct mira220 *mira220)
> > +{
> > +	struct v4l2_fwnode_endpoint ep_cfg = {
> > +		.bus_type = V4L2_MBUS_CSI2_DPHY
> > +	};
> > +	struct fwnode_handle *endpoint;
> > +	unsigned long bitmap;
> > +	int ret = 0;
> > +
> > +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
>
> You can simplify error handling by using __free() for endpoint.
>

I'll have a look

> > +	if (!endpoint) {
> > +		dev_err(dev, "Endpoint node not found\n");
> > +		return -EINVAL;
> > +	}
>
> You can omit this check, it's done by v4l2_fwnode_endpoint_alloc_parse()
> below.
>

ack

> > +
> > +	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg)) {
> > +		ret = -EINVAL;
> > +		dev_err(dev, "Failed to parse endpoint\n");
> > +		goto error_out;
>
> Maybe we could introduce __free() use for struct v4l2_fwnode_endpoint, too?
> Perhaps out of scope of this set though.

nice idea, but not for this patch :)

>
> > +	}
> > +
> > +	/* Non-continuous mode not implemented. */
> > +	if (ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK) {
> > +		dev_warn(dev, "clock non-continuous mode not supported\n");
> > +		ret = -EINVAL;
> > +		goto error_out;
> > +	}
> > +
> > +	/*
> > +	 * Link frequencies: the driver supports a single link frequency,
> > +	 * no need to check bitmap after this call.
> > +	 */
> > +	ret = v4l2_link_freq_to_bitmap(dev, ep_cfg.link_frequencies,
> > +				       ep_cfg.nr_of_link_frequencies,
> > +				       mira220_link_freqs,
> > +				       ARRAY_SIZE(mira220_link_freqs),
> > +				       &bitmap);
> > +	if (ret)
> > +		goto error_out;
> > +
> > +	/* Check the number of MIPI CSI2 data lanes */
> > +	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 1 &&
> > +	    ep_cfg.bus.mipi_csi2.num_data_lanes != 2) {
> > +		ret = -EINVAL;
> > +		dev_err(dev, "%u data lanes are not supported\n",
> > +			ep_cfg.bus.mipi_csi2.num_data_lanes);
> > +		goto error_out;
> > +	}
> > +
> > +	mira220->lanes = ep_cfg.bus.mipi_csi2.num_data_lanes;
> > +	mira220->row_length = MIRA220_ROW_LENGTH_MIN * (2 / mira220->lanes);
>
> I'd just calculate this based on lanes where needed, using a macro.
>

ok

> > +
> > +error_out:
> > +	v4l2_fwnode_endpoint_free(&ep_cfg);
> > +	fwnode_handle_put(endpoint);
> > +
> > +	return ret;
> > +}
> > +
> > +static int mira220_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev = &client->dev;
> > +	struct mira220 *mira220;
> > +	int ret;
> > +
> > +	mira220 = devm_kzalloc(&client->dev, sizeof(*mira220), GFP_KERNEL);
> > +	if (!mira220)
> > +		return -ENOMEM;
> > +
> > +	v4l2_i2c_subdev_init(&mira220->sd, client, &mira220_subdev_ops);
> > +	mira220->sd.internal_ops = &mira220_internal_ops;
> > +
> > +	ret = mira220_parse_endpoint(dev, mira220);
> > +	if (ret)
> > +		return ret;
> > +
> > +	mira220->regmap = devm_cci_regmap_init_i2c(client, 16);
> > +	if (IS_ERR(mira220->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(mira220->regmap),
> > +				     "failed to initialize CCI\n");
> > +
> > +	/* Get system clock (xclk) */
> > +	mira220->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
> > +	if (IS_ERR(mira220->xclk))
> > +		return dev_err_probe(dev, PTR_ERR(mira220->xclk),
> > +				     "failed to get xclk\n");
> > +
> > +	mira220->xclk_freq = clk_get_rate(mira220->xclk);
> > +	if (mira220->xclk_freq != MIRA220_SUPPORTED_XCLK_FREQ) {
> > +		dev_err(dev, "xclk frequency not supported: %d Hz\n",
> > +			mira220->xclk_freq);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = mira220_get_regulators(mira220);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> > +
> > +	mira220->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > +						      GPIOD_OUT_HIGH);
> > +	if (IS_ERR(mira220->reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(mira220->reset_gpio),
> > +				     "failed to get reset gpio\n");
> > +
> > +	ret = mira220_power_on(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Enable runtime PM and power on the device */
> > +	pm_runtime_set_active(dev);
> > +	pm_runtime_enable(dev);
> > +
> > +	ret = mira220_identify_module(mira220);
> > +	if (ret)
> > +		goto error_power_off;
> > +
> > +	ret = mira220_init_controls(mira220);
> > +	if (ret)
> > +		goto error_power_off;
> > +
> > +	/* Initialize subdev */
> > +	mira220->sd.internal_ops = &mira220_internal_ops;
> > +	mira220->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	mira220->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +	/* Initialize source pads */
> > +	mira220->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +
> > +	ret = media_entity_pads_init(&mira220->sd.entity, 1, &mira220->pad);
> > +	if (ret) {
> > +		dev_err_probe(dev, ret, "failed to init entity pads\n");
> > +		goto error_handler_free;
> > +	}
> > +
> > +	mira220->sd.state_lock = mira220->ctrl_handler.lock;
> > +	ret = v4l2_subdev_init_finalize(&mira220->sd);
> > +	if (ret < 0) {
> > +		dev_err_probe(dev, ret, "subdev init error\n");
> > +		goto error_media_entity;
> > +	}
> > +
> > +	ret = v4l2_async_register_subdev_sensor(&mira220->sd);
> > +	if (ret < 0) {
> > +		dev_err_probe(dev, ret,
> > +			      "failed to register sensor sub-device\n");
> > +		goto error_subdev_cleanup;
> > +	}
> > +
> > +	pm_runtime_idle(dev);
>
> You probably want to call pm_runtime_idle() after setting autosuspend
> delay.
>
To be honest I copied this from imx219 but I can certainly change it.



> > +	pm_runtime_set_autosuspend_delay(dev, 1000);
> > +	pm_runtime_use_autosuspend(dev);
> > +
> > +	return 0;
> > +
> > +error_subdev_cleanup:
> > +	v4l2_subdev_cleanup(&mira220->sd);
> > +error_media_entity:
> > +	media_entity_cleanup(&mira220->sd.entity);
> > +error_handler_free:
> > +	v4l2_ctrl_handler_free(mira220->sd.ctrl_handler);
> > +error_power_off:
> > +	pm_runtime_disable(dev);
> > +	mira220_power_off(dev);
> > +	pm_runtime_set_suspended(dev);
>
> A newline here perhaps?
>

Usually I like to keep error path returns compact

Thanks, I'll send a new version soon.
It's mostly minor stuff, do you think I can get this in for this cycle
(a bit last minute, I know)

Thanks
  j


> > +	return ret;
> > +}
> > +
> > +static void mira220_remove(struct i2c_client *client)
> > +{
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct mira220 *mira220 = to_mira220(sd);
> > +
> > +	v4l2_async_unregister_subdev(sd);
> > +	v4l2_subdev_cleanup(&mira220->sd);
> > +	media_entity_cleanup(&sd->entity);
> > +
> > +	v4l2_ctrl_handler_free(mira220->sd.ctrl_handler);
> > +
> > +	pm_runtime_disable(&client->dev);
> > +	if (!pm_runtime_status_suspended(&client->dev))
> > +		mira220_power_off(&client->dev);
> > +	pm_runtime_set_suspended(&client->dev);
> > +}
> > +
> > +static const struct dev_pm_ops mira220_pm_ops = {
> > +	SET_RUNTIME_PM_OPS(mira220_power_off, mira220_power_on, NULL)
> > +};
> > +
> > +static const struct of_device_id mira220_dt_ids[] = {
> > +	{ .compatible = "ams,mira220" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, mira220_dt_ids);
> > +
> > +static struct i2c_driver mira220_i2c_driver = {
> > +	.driver = {
> > +		.name = "mira220",
> > +		.of_match_table	= mira220_dt_ids,
> > +		.pm = pm_ptr(&mira220_pm_ops),
> > +	},
> > +	.probe = mira220_probe,
> > +	.remove = mira220_remove,
> > +};
> > +
> > +module_i2c_driver(mira220_i2c_driver);
> > +
> > +MODULE_AUTHOR("Philippe Baetens <philippe.baetens@ams-osram.com>");
> > +MODULE_DESCRIPTION("ams MIRA220 sensor driver");
> > +MODULE_LICENSE("GPL");
> >
>
> --
> Regards,
>
> Sakari Ailus
>
