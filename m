Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2213E49DC;
	Thu, 23 Jul 2026 09:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798176; cv=none; b=AzaqcnUdMWep3wzFY6fJHuGc8PbfJGY2HLQPYgbPG3tzjvcSs4ZyffjkCW30PKlu9O+oSnuX+RkFun5g10m9UrkLz3SSyxX7WfcBbCrFvUkLXFjqBzRZNsKeXeFTVR64jToA4yNxzuetlcuDSjTrWqzRB/rwBK2jBAGaCDRv5i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798176; c=relaxed/simple;
	bh=ACUvj+bEVd2IPNwnjNTmrVAlvwJ4gqC0Uwiq25rofbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/InHNzk/h88SwuP6nkVX6XYg8/iXxp4fq93L4WJl36yR5JUAE7uHjO4QraqD6+Z6+nhcLzZJOq6+Qmc9dB3i7JDhDuYwkpqvlBFeeJH6YuTtyh0+6Ahh4cV+bjwGrXZn+ZiU2McTWz/4qT6UwvC1pH/Y7d/vMlyr53n2fk4Hok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R6SS2y4y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R6SS2y4y"
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EB8D153F;
	Thu, 23 Jul 2026 11:15:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784798110;
	bh=ACUvj+bEVd2IPNwnjNTmrVAlvwJ4gqC0Uwiq25rofbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R6SS2y4y0AG4mHxcygT+sWNYEKSGeS3Ef3hMoW8vW9TkdZ7DeQ/9JbI7vUiPHEEMM
	 JooFVGIpKlWfxmhny5IHjRi+gm92fVnBZrhBaBwemsCv9cedz8cfjS+EX9tXluyKLw
	 wYxnQDebNUMvHsIy/93I6psfnJ/lOZwBSyM+Jsr0=
Date: Thu, 23 Jul 2026 11:16:07 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philippe Baetens <philippebaetens@gmail.com>, 
	Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Message-ID: <amHRMQfRzppwZ5xz@zed>
References: <20260722-mira220-v7-0-dd5f1de98cd4@ideasonboard.com>
 <20260722-mira220-v7-2-dd5f1de98cd4@ideasonboard.com>
 <178472387683.3005206.5602199112336367476@freya>
 <amG5CiajbwGXhb59@zed>
 <178479424623.3238585.7446724208192156945@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178479424623.3238585.7446724208192156945@freya>

Hi Jai

On Thu, Jul 23, 2026 at 01:40:46PM +0530, Jai Luthra wrote:
> Quoting Jacopo Mondi (2026-07-23 12:51:48)
> > Hi Jai,
> >    thanks for the review
> >
> > On Wed, Jul 22, 2026 at 06:07:56PM +0530, Jai Luthra wrote:
> > > Hi Jacopo,
> > >
> > > Thank you for the patch.
> > >
> > > Quoting Jacopo Mondi (2026-07-22 16:25:17)
> > > > From: Philippe Baetens <philippebaetens@gmail.com>
> > > >
> > > > Add a V4L2 subdev driver for driver for the AMS-OSRAM Mira220 image
> > > > sensor.
> > > >
> > > > Mira220 is a global shutter image sensor with a resolution of 1600x1400
> > > > pixels.
> > > >
> > > > The driver implements support for mono and RGB 12, 10 and 8 bits
> > > > formats. The output data-rate per lane is 1500Mbit/s, with a maximum
> > > > frame rate up to 90 fps.
> > > >
> > > > Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> [...]
>
> > > > +
> > > > +/* Horizontal flip */
> > > > +#define MIRA220_HFLIP_REG CCI_REG8(0x209C)
> > > > +#define MIRA220_HFLIP_ENABLE_MIRROR 1
> > > > +#define MIRA220_HFLIP_DISABLE_MIRROR 0
> > > > +
> > > > +/* Vertical flip */
> > > > +#define MIRA220_VFLIP_REG CCI_REG8(0x1095)
> > > > +#define MIRA220_VFLIP_ENABLE_FLIP 1
> > > > +#define MIRA220_VFLIP_DISABLE_FLIP 0
> > >
> > > I don't see the above macros being used when updating the flip registers,
> >
> > We use ctrl->val indeed as it can be 1 or 0 only
> >
> > > and also HFLIP value is swapped from the control, which does not match the
> > > macro.
> >
> > Why I don't see it ?
> >
> >        case V4L2_CID_HFLIP:
> >                ret = cci_write(mira220->regmap, MIRA220_HFLIP_REG,
> >                                mira220->hflip->val, NULL);
> >
> >         mira220->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
> >                                            V4L2_CID_HFLIP, 0, 1, 1, 0);
> >
>
> Oops, my bad I confused the code picking the bayer order from the table
> with the one that writes to the registers. Please ignore this comment.
>

There is instead an inverted handling of hflip when adjusting the
image format

i = (i & ~3) | (mira220->vflip->val ? 2 : 0) | (mira220->hflip->val ? 0 : 1);

This is because the wrong sorting of mira220_mbus_color_formats[].

I've resorted it to match the ordering reported in the comment above
it

 * - no flip
 * - h flip
 * - v flip
 * - h&v flips

And adjusted the index calculation to use hflip->val ? 1 : 0

(Sashiko had also pointed this out, but thought this was going to
registers, while flip handling used to work fine as it was "wrong" in
two places in the driver).

> >
> > >
> > > Could you please use the macros to keep things easy to read? And maybe a
> > > mask macro instead of `(i & ~3)` too?
> > >
> >
> > I could
> >
> > > > +
> > > > +#define MIRA220_VSIZE_REG CCI_REG16_LE(0x1087)
> > > > +#define MIRA220_VSTART_REG CCI_REG16_LE(0x107d)
> > > > +#define MIRA220_HSIZE_REG CCI_REG16_LE(0x2008)
> > > > +#define MIRA220_HSIZE_MASK GENMASK(9, 0)
> > > > +#define MIRA220_HSTART_REG CCI_REG16_LE(0x200a)
> > > > +#define MIRA220_HSTART_MASK GENMASK(9, 0)
> > >
> > > Same, drop the mask if unused.
> > >
> >
> > Or maybe I should have used the masks!
> >
> > > > +#define MIRA220_MIPI_HSIZE_REG CCI_REG16_LE(0x207d)
> > > > +
> > > > +/* MIPI bus control */
> > > > +#define MIRA220_MIPI_LANES_REG CCI_REG8(0x6012)
> > > > +
> > > > +#define MIRA220_MIPI_CLK_MODE_REG CCI_REG8(0x6013)
> > > > +#define MIRA220_MIPI_CLK_CONTINUOUS 0x00
> > > > +#define MIRA220_MIPI_CLK_NON_CONTINUOUS 0x01
> > >
> > > Does DT allow clock-continuous property? Do we handle it?
> > >
> >
> > The bindings for this sensor allows all properties from
> > video-interfaces.yaml, including clock-noncontinuous.
> >
> > The driver doesn't support it at the moment and unconditionally use
> > continuous clock, but I guess it's nice to provide macros for the
> > non-continuous configuration as well
>
> Ah, that's not too good if the DT allows it but the driver silently ignores
> it.

Why ?

We allow all properties from video-interfaces.yaml (something which I
think it's wrong, but that's a long time ago discussion with dt
maintainers, so I'm not contesting that) and we certainly don't handle
them in drivers (in facts, what drivers do is not relevant to which
properties are allowed for a device).

>
> If you end up reading the DT property to report an error, might as well try
> setting the bit too? ;-)
>

I don't think I'm reading it, am I ?

> >
> > > > +
> > > > +/* OTP control */
> > > > +#define MIRA220_OTP_CMD_REG CCI_REG8(0x0080)
> > > > +#define MIRA220_OTP_CMD_UP 0x4
> > > > +#define MIRA220_OTP_CMD_DOWN 0x8
> > > > +
> > > > +/* Global sampling time */
> > > > +#define MIRA220_GLOB_NUM_CLK_CYCLES 1928
> > > > +
> > > > +/* External clock frequency is 38.4 M */
> > > > +#define MIRA220_SUPPORTED_XCLK_FREQ 38400000
> > > > +
> > > > +/* Default exposure is adjusted to mode with smallest height */
> > > > +#define MIRA220_DEFAULT_EXPOSURE 1000
> > > > +#define MIRA220_MAX_EXPOSURE 0xffff
> > > > +#define MIRA220_EXPOSURE_MIN 1
> > > > +
> > > > +/*
> > > > + * Pixel rate is an artificial value. This value is used for timing calculations
> > >
> > > nit: Pixel rate is artificially scaled to keep hblank non-negative for
> > > timing calculations.
> > >
> >
> > I'm not sure that's what the comment originally meant.
> >
> > > > + * in combination with vblank/hblank.
> > > > + */
> > > > +#define MIRA220_PIXEL_RATE 384000000
> > > > +
> > > > +/* Total line length for 2 lanes calculated for ROW_LENGTH = 304. */
> > > > +#define MIRA220_LLP_1600x1400_304 3040
> > > > +
> > >
> > > nit: Most Sony drivers with scaled pixel rate and HTS define the ratio
> > > once, so something like `#define MIRA220_PIXEL_SCALE_FACTOR 10` and use it
> > > at both places. This is fine too though.
> > >
> >
> > I'm not sure I got what scale factor are you referring to.
> >
> > > > +/*
> > > > + * ROW_LENGTH: duration of row length in clk_in cycles; set to minimum supported
> > > > + * value for higher frame rate.
> > > > + */
> > > > +#define MIRA220_REG_ROW_LENGTH         CCI_REG16_LE(0x102b)
> > > > +#define MIRA220_ROW_LENGTH_MIN         304
> >
> > Ah, do you think the above 3040 comes from this 304 * 10 ?
> >
> > Honestly I didn't realize it!
> >
> > 304 is the minimum value allowed for the row_length parameter, which
> > defines the row sampling rate in number of clk_in cycles.
> >
> > As I can't tell what the 10 scale factor would represent I would leave
> > these as they are ?
> >
>
> I'll leave that to you.
>
> What Dave pointed to me on my IMX678 patch [1] is something many
> sensors do (IMX678, IMX415, IMX667 and now this one), where
>
> time_to_read_row_in_s = 1/pixel_clock_in_hz * hts_reg
>
> where
>
> hts_reg < pixels_in_a_row
>
> when ideally what makes sense is,
>
> line_length_in_pixels > pixels_in_a_row
>
> or to be exact, for frame rate calculation we use
>
> line_length_in_pixels = pixels_in_a_row + blanking
>
> Thus the conclusion that we need to multiply both the hts_reg and
> pixel_clock_in_hz values by the same constant factor to get values for
> line_length_in_pixels and PIXEL_RATE that make "sense" wrt blankings
>
> In your case with 304 row length and 38.4M clock,
>
>    time_to_read_row = 1/38.4M * 304
>
> So if we multiply both by 10 we get the same timing but with values that
> avoid negative blankings,
>
>    time_to_read_row = 1/384M * 3040
>
> Now we could have multiplied by 5 or 8 or whatever and might still end up
> with non-negative blankings. You chose factor of 10 for the "artificial"
> pixel rate value, so it showed up in row length too.
>
> What the physically correct factor should be I don't know. But I usually
> pick whatever is the smallest number that works for the lowest possible
> value for the HTS/row_length register.
>
> [1]: https://lore.kernel.org/all/CAPY8ntBi88-dd2HxxftErf8h5-ERRPcGy5KJ-%2BoF7jawNOJpuA@mail.gmail.com/
>

Thanks for the detailed analysis.

I'll forward to know might know more about the sensor internal
architecture.


> > > > +
> > > > +/* Test Pattern */
> > > > +#define MIRA220_REG_TEST_PATTERN CCI_REG8(0x2091)
> > > > +#define MIRA220_TEST_PATTERN_DISABLE 0x00
> > > > +#define MIRA220_TEST_PATTERN_VERTICAL_GRADIENT 0x01
> > > > +
> > > > +/* Module variant identifiers */
> > > > +#define MIRA220_MONO_PLAIN_PF          0x1e62a032
> > > > +#define MIRA220_MONO_PLAIN_NO_PF       0x1e62a045
> > > > +#define MIRA220_MONO_AR_PF             0x1e62a036
> > > > +#define MIRA220_RGB_PLAIN_PF           0x1e62a03b
> > > > +#define MIRA220_RGB_PLAIN_NO_PF                0x1e62a046
> > > > +#define MIRA220_RGB_AR_PF              0x1e62a03d
> > >
> > > Ah, I think this might be relevant to userspace, but not a problem to solve
> > > in this patch.
> > >
> >
> > How so ?
> >
>
> I assumed AR coating and protective film might effect the tuning needed for
> the ISP, but I honestly don't know enough about that process.
>

One place where it is required to know the sensor variant is the
tuning file selection in libcamera.

We currently don't have a standardized way to do that. The only
pipeline that automatically adjust for _mono variants is RPi, and it
does that using the support image formats.

I presume other pipelines should do the same ?

> > > > +
> > > > +enum mira220_variants {
> > > > +       MIRA220_VARIANT_MONO,
> > > > +       MIRA220_VARIANT_RGB,
> > > > +};
> > > > +
> > > > +static const struct cci_reg_sequence mira220_init_reg_list[] = {
> > > > +       /* Base configuration*/
> > > > +       { CCI_REG8(0x6006), 0x0 },
> > > > +       { CCI_REG8(0x6012), 0x1 },
> > > > +       { CCI_REG8(0x6013), 0x0 },
> > > > +       { CCI_REG8(0x6006), 0x1 },
> > > > +       { CCI_REG8(0x205D), 0x0 },
> > >
> > > We have a convention to stick to lowercase hex values throughout the
> > > driver.
> > >
> >
> > Same reasoning as per the tabs in the defines.
> > The code base I started from had upper case.
> >
> > In the past I asked other contributors to adjust their tables to lower
> > case, so I guess it's not nice if I get a pass.
> >
> > I'll try to change them
> >
>
> Thanks, usually vim grep is good enough (I've even tried asking a local LLM
>                                          to come up with a grep and it did).
>
> [...]
>

It didn't take me long ..

> > > > +struct mira220 {
> > > > +       struct v4l2_subdev sd;
> > > > +       struct media_pad pad;
> > > > +
> > > > +       enum mira220_variants variant;
> > > > +
> > > > +       struct v4l2_mbus_framefmt fmt;
> > > > +
> > > > +       struct clk *xclk;
> > > > +       u32 xclk_freq;
> > > > +
> > > > +       struct regulator_bulk_data supplies[MIRA220_NUM_SUPPLIES];
> > > > +
> > > > +       struct gpio_desc *reset_gpio;
> > > > +
> > > > +       unsigned int lanes;
> > > > +       unsigned int row_length;
> > > > +
> > > > +       struct v4l2_ctrl_handler ctrl_handler;
> > > > +       struct v4l2_ctrl *vflip;
> > > > +       struct v4l2_ctrl *hflip;
> > > > +       struct v4l2_ctrl *vblank;
> > > > +       struct v4l2_ctrl *exposure;
> > > > +
> > > > +       const struct mira220_mode *mode;
> > >
> > > Is this defined or [used anywhere? A grep for mira220_mode returns empty
> > > for me.
> > >
> >
> > This defintely shouldn't be here
> >
> > Now the thing I don't get: why does this compile ?
> >
> >   CC [M]  mira220.o
> >   MODPOST Module.symvers
> >   CC [M]  mira220.mod.o
> >   LD [M]  mira220.ko
> >
> > ??
> >
> > And notice that if I remove the ; at the end
> >
> > -       const struct mira220_mode *mode;
> > +       const struct mira220_mode *mode
> >
> > to intentionally break it .. it breaks!
> >
> > mira220.c:1016:9: error: expected ‘:’, ‘,’, ‘;’, ‘}’ or ‘__attribute__’ before ‘struct’
> >  1016 |         struct regmap *regmap;
> >       |         ^~~~~~
> >
> > I'm puzzled :)
> >
>
> Google says compilers are happy to chug along with "struct unknown *val;"
> as long as it is never dereferenced.
>

I had no idea (and it quite surprises me :)

> > > > +
> > > > +       struct regmap *regmap;
> > > > +};
>
> [...]
>
> > > > +       if (i >= ARRAY_SIZE(mira220_mbus_color_formats))
> > > > +               i = 0;
> > > > +
> > > > +       i = (i & ~3) | (mira220->vflip->val ? 2 : 0) | (mira220->hflip->val ? 0 : 1);
> > >
> > > Using macros here would be nice.
> > >
> >
> > I'm not sure, we're just adjusting the index, there's nothing related
> > to the registers layout here
> >
>
> My bad, please ignore.
>
> [...]
>
> > > > +static const struct of_device_id mira220_dt_ids[] = {
> > > > +       { .compatible = "ams,mira220" },
> > >
> > > I see AMS-OSRAM using the following naming scheme on the product page [1]:
> > >     Mira220-2QC: Color
> > >     Mira220-2QM: Mono
> > >     Mira220-2QI: RGB-IR
> > >
> > > Should we use separate compatibles for the three variants? This is a
> > > practice we have followed for other sensors too, and especially relevant
> > > here because the driver currently doesn't work for RGB-IR variants.
> > >
> > > [1]: https://ams-osram.com/products/sensor-solutions/cmos-image-sensors/ams-mira220
> > >
> >
> > I don't know. As we can perform runtime identification what would an
> > additional compatible give us here ?
> >
>
> Some usecases might want to avoid powering on (and potentially flashing
> privacy LED) and doing I2C transactions if the type of sensor can be known
> at boot-time already.
>
> There was a similar discussion here:
> https://lore.kernel.org/linux-media/20260521-dangling-utensil-610af5e07d79@spud/
>
> I don't know enough about this particular sensor, and if reading the OTP
> values and programming registers is mandatory for all potential usecases
> anyway, which would mean there's no benefit for avoiding the runtime
> detection.

A bit out of my territory here, but can we start with a single
compatible and add more if needed (and use the initial one as a
fallback?)

>
> > Thanks
> >    j
> >
>
> Thanks,
>     Jai
>
