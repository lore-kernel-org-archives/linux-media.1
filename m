Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E238360ECD;
	Thu, 23 Jul 2026 08:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784794256; cv=none; b=aJS/aG2DHkc5iqXIk3nZa+0CNWpaAtjiMpxZM/fdLZyGKHNfpv/XJNjZcdsWh/+GJi2fzZUDwfeg1oLRwLvtW2s2ChWpWmmP4sc5nDQo2T3uVVipa2oexxw1Nj9W/ngM63E0rz6E5jHN77GhULWsdK34PtyJ+7NWI+AEKnSq1GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784794256; c=relaxed/simple;
	bh=23SA7els99raab77aMM3+5zB07ndMCAY+8GlUpi1WQ4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=D/y9GxSpLSt2hzBkm58Co10McdkTHoVxdPIQ2QOUKuY9UVNWPfBJPJ+UDrTXmjUSGwhyPI5t60jOEiTBk9B3TEJXwnX1gMFriPyqNomoPuXJyNX130W5jEtwRtv/ALWHuJsRQ78IeTuZc/2SlCuf7Kn+vgvg+tML/pp9wKnF5sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SRuoJ/ir; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SRuoJ/ir"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A55B4153F;
	Thu, 23 Jul 2026 10:09:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784794191;
	bh=23SA7els99raab77aMM3+5zB07ndMCAY+8GlUpi1WQ4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SRuoJ/ir/CV6L14NcTMaS24HfWEZaRjzdnWmXZyZa6iuaOyYfscvUOAUbjsNrRFa/
	 TuPchZ/NhQrW4TrXgtY9Y7HneVRXrOzyfCKuFRwq4o7xkDt2Si7gINvXQydE0fk80E
	 0a5mkoelpyIjVYX1z1HdYU+kYnlKcTRsPWmiNcDQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <amG5CiajbwGXhb59@zed>
References: <20260722-mira220-v7-0-dd5f1de98cd4@ideasonboard.com> <20260722-mira220-v7-2-dd5f1de98cd4@ideasonboard.com> <178472387683.3005206.5602199112336367476@freya> <amG5CiajbwGXhb59@zed>
Subject: Re: [PATCH v7 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Philippe Baetens <philippebaetens@gmail.com>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 23 Jul 2026 13:40:46 +0530
Message-ID: <178479424623.3238585.7446724208192156945@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Jacopo Mondi (2026-07-23 12:51:48)
> Hi Jai,
>    thanks for the review
>=20
> On Wed, Jul 22, 2026 at 06:07:56PM +0530, Jai Luthra wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > Quoting Jacopo Mondi (2026-07-22 16:25:17)
> > > From: Philippe Baetens <philippebaetens@gmail.com>
> > >
> > > Add a V4L2 subdev driver for driver for the AMS-OSRAM Mira220 image
> > > sensor.
> > >
> > > Mira220 is a global shutter image sensor with a resolution of 1600x14=
00
> > > pixels.
> > >
> > > The driver implements support for mono and RGB 12, 10 and 8 bits
> > > formats. The output data-rate per lane is 1500Mbit/s, with a maximum
> > > frame rate up to 90 fps.
> > >
> > > Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

[...]

> > > +
> > > +/* Horizontal flip */
> > > +#define MIRA220_HFLIP_REG CCI_REG8(0x209C)
> > > +#define MIRA220_HFLIP_ENABLE_MIRROR 1
> > > +#define MIRA220_HFLIP_DISABLE_MIRROR 0
> > > +
> > > +/* Vertical flip */
> > > +#define MIRA220_VFLIP_REG CCI_REG8(0x1095)
> > > +#define MIRA220_VFLIP_ENABLE_FLIP 1
> > > +#define MIRA220_VFLIP_DISABLE_FLIP 0
> >
> > I don't see the above macros being used when updating the flip register=
s,
>=20
> We use ctrl->val indeed as it can be 1 or 0 only
>=20
> > and also HFLIP value is swapped from the control, which does not match =
the
> > macro.
>=20
> Why I don't see it ?
>=20
>        case V4L2_CID_HFLIP:
>                ret =3D cci_write(mira220->regmap, MIRA220_HFLIP_REG,
>                                mira220->hflip->val, NULL);
>=20
>         mira220->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
>                                            V4L2_CID_HFLIP, 0, 1, 1, 0);
>=20

Oops, my bad I confused the code picking the bayer order from the table
with the one that writes to the registers. Please ignore this comment.

>=20
> >
> > Could you please use the macros to keep things easy to read? And maybe a
> > mask macro instead of `(i & ~3)` too?
> >
>=20
> I could
>=20
> > > +
> > > +#define MIRA220_VSIZE_REG CCI_REG16_LE(0x1087)
> > > +#define MIRA220_VSTART_REG CCI_REG16_LE(0x107d)
> > > +#define MIRA220_HSIZE_REG CCI_REG16_LE(0x2008)
> > > +#define MIRA220_HSIZE_MASK GENMASK(9, 0)
> > > +#define MIRA220_HSTART_REG CCI_REG16_LE(0x200a)
> > > +#define MIRA220_HSTART_MASK GENMASK(9, 0)
> >
> > Same, drop the mask if unused.
> >
>=20
> Or maybe I should have used the masks!
>=20
> > > +#define MIRA220_MIPI_HSIZE_REG CCI_REG16_LE(0x207d)
> > > +
> > > +/* MIPI bus control */
> > > +#define MIRA220_MIPI_LANES_REG CCI_REG8(0x6012)
> > > +
> > > +#define MIRA220_MIPI_CLK_MODE_REG CCI_REG8(0x6013)
> > > +#define MIRA220_MIPI_CLK_CONTINUOUS 0x00
> > > +#define MIRA220_MIPI_CLK_NON_CONTINUOUS 0x01
> >
> > Does DT allow clock-continuous property? Do we handle it?
> >
>=20
> The bindings for this sensor allows all properties from
> video-interfaces.yaml, including clock-noncontinuous.
>=20
> The driver doesn't support it at the moment and unconditionally use
> continuous clock, but I guess it's nice to provide macros for the
> non-continuous configuration as well

Ah, that's not too good if the DT allows it but the driver silently ignores
it.

If you end up reading the DT property to report an error, might as well try
setting the bit too? ;-)

>=20
> > > +
> > > +/* OTP control */
> > > +#define MIRA220_OTP_CMD_REG CCI_REG8(0x0080)
> > > +#define MIRA220_OTP_CMD_UP 0x4
> > > +#define MIRA220_OTP_CMD_DOWN 0x8
> > > +
> > > +/* Global sampling time */
> > > +#define MIRA220_GLOB_NUM_CLK_CYCLES 1928
> > > +
> > > +/* External clock frequency is 38.4 M */
> > > +#define MIRA220_SUPPORTED_XCLK_FREQ 38400000
> > > +
> > > +/* Default exposure is adjusted to mode with smallest height */
> > > +#define MIRA220_DEFAULT_EXPOSURE 1000
> > > +#define MIRA220_MAX_EXPOSURE 0xffff
> > > +#define MIRA220_EXPOSURE_MIN 1
> > > +
> > > +/*
> > > + * Pixel rate is an artificial value. This value is used for timing =
calculations
> >
> > nit: Pixel rate is artificially scaled to keep hblank non-negative for
> > timing calculations.
> >
>=20
> I'm not sure that's what the comment originally meant.
>=20
> > > + * in combination with vblank/hblank.
> > > + */
> > > +#define MIRA220_PIXEL_RATE 384000000
> > > +
> > > +/* Total line length for 2 lanes calculated for ROW_LENGTH =3D 304. =
*/
> > > +#define MIRA220_LLP_1600x1400_304 3040
> > > +
> >
> > nit: Most Sony drivers with scaled pixel rate and HTS define the ratio
> > once, so something like `#define MIRA220_PIXEL_SCALE_FACTOR 10` and use=
 it
> > at both places. This is fine too though.
> >
>=20
> I'm not sure I got what scale factor are you referring to.
>=20
> > > +/*
> > > + * ROW_LENGTH: duration of row length in clk_in cycles; set to minim=
um supported
> > > + * value for higher frame rate.
> > > + */
> > > +#define MIRA220_REG_ROW_LENGTH         CCI_REG16_LE(0x102b)
> > > +#define MIRA220_ROW_LENGTH_MIN         304
>=20
> Ah, do you think the above 3040 comes from this 304 * 10 ?
>=20
> Honestly I didn't realize it!
>=20
> 304 is the minimum value allowed for the row_length parameter, which
> defines the row sampling rate in number of clk_in cycles.
>=20
> As I can't tell what the 10 scale factor would represent I would leave
> these as they are ?
>=20

I'll leave that to you.

What Dave pointed to me on my IMX678 patch [1] is something many
sensors do (IMX678, IMX415, IMX667 and now this one), where

time_to_read_row_in_s =3D 1/pixel_clock_in_hz * hts_reg

where

hts_reg < pixels_in_a_row

when ideally what makes sense is,

line_length_in_pixels > pixels_in_a_row

or to be exact, for frame rate calculation we use

line_length_in_pixels =3D pixels_in_a_row + blanking

Thus the conclusion that we need to multiply both the hts_reg and
pixel_clock_in_hz values by the same constant factor to get values for
line_length_in_pixels and PIXEL_RATE that make "sense" wrt blankings

In your case with 304 row length and 38.4M clock,

   time_to_read_row =3D 1/38.4M * 304

So if we multiply both by 10 we get the same timing but with values that
avoid negative blankings,

   time_to_read_row =3D 1/384M * 3040

Now we could have multiplied by 5 or 8 or whatever and might still end up
with non-negative blankings. You chose factor of 10 for the "artificial"
pixel rate value, so it showed up in row length too.

What the physically correct factor should be I don't know. But I usually
pick whatever is the smallest number that works for the lowest possible
value for the HTS/row_length register.

[1]: https://lore.kernel.org/all/CAPY8ntBi88-dd2HxxftErf8h5-ERRPcGy5KJ-%2Bo=
F7jawNOJpuA@mail.gmail.com/

> > > +
> > > +/* Test Pattern */
> > > +#define MIRA220_REG_TEST_PATTERN CCI_REG8(0x2091)
> > > +#define MIRA220_TEST_PATTERN_DISABLE 0x00
> > > +#define MIRA220_TEST_PATTERN_VERTICAL_GRADIENT 0x01
> > > +
> > > +/* Module variant identifiers */
> > > +#define MIRA220_MONO_PLAIN_PF          0x1e62a032
> > > +#define MIRA220_MONO_PLAIN_NO_PF       0x1e62a045
> > > +#define MIRA220_MONO_AR_PF             0x1e62a036
> > > +#define MIRA220_RGB_PLAIN_PF           0x1e62a03b
> > > +#define MIRA220_RGB_PLAIN_NO_PF                0x1e62a046
> > > +#define MIRA220_RGB_AR_PF              0x1e62a03d
> >
> > Ah, I think this might be relevant to userspace, but not a problem to s=
olve
> > in this patch.
> >
>=20
> How so ?
>=20

I assumed AR coating and protective film might effect the tuning needed for
the ISP, but I honestly don't know enough about that process.

> > > +
> > > +enum mira220_variants {
> > > +       MIRA220_VARIANT_MONO,
> > > +       MIRA220_VARIANT_RGB,
> > > +};
> > > +
> > > +static const struct cci_reg_sequence mira220_init_reg_list[] =3D {
> > > +       /* Base configuration*/
> > > +       { CCI_REG8(0x6006), 0x0 },
> > > +       { CCI_REG8(0x6012), 0x1 },
> > > +       { CCI_REG8(0x6013), 0x0 },
> > > +       { CCI_REG8(0x6006), 0x1 },
> > > +       { CCI_REG8(0x205D), 0x0 },
> >
> > We have a convention to stick to lowercase hex values throughout the
> > driver.
> >
>=20
> Same reasoning as per the tabs in the defines.
> The code base I started from had upper case.
>=20
> In the past I asked other contributors to adjust their tables to lower
> case, so I guess it's not nice if I get a pass.
>=20
> I'll try to change them
>=20

Thanks, usually vim grep is good enough (I've even tried asking a local LLM
                                         to come up with a grep and it did).

[...]

> > > +struct mira220 {
> > > +       struct v4l2_subdev sd;
> > > +       struct media_pad pad;
> > > +
> > > +       enum mira220_variants variant;
> > > +
> > > +       struct v4l2_mbus_framefmt fmt;
> > > +
> > > +       struct clk *xclk;
> > > +       u32 xclk_freq;
> > > +
> > > +       struct regulator_bulk_data supplies[MIRA220_NUM_SUPPLIES];
> > > +
> > > +       struct gpio_desc *reset_gpio;
> > > +
> > > +       unsigned int lanes;
> > > +       unsigned int row_length;
> > > +
> > > +       struct v4l2_ctrl_handler ctrl_handler;
> > > +       struct v4l2_ctrl *vflip;
> > > +       struct v4l2_ctrl *hflip;
> > > +       struct v4l2_ctrl *vblank;
> > > +       struct v4l2_ctrl *exposure;
> > > +
> > > +       const struct mira220_mode *mode;
> >
> > Is this defined or [used anywhere? A grep for mira220_mode returns empty
> > for me.
> >
>=20
> This defintely shouldn't be here
>=20
> Now the thing I don't get: why does this compile ?
>=20
>   CC [M]  mira220.o
>   MODPOST Module.symvers
>   CC [M]  mira220.mod.o
>   LD [M]  mira220.ko
>=20
> ??
>=20
> And notice that if I remove the ; at the end
>=20
> -       const struct mira220_mode *mode;
> +       const struct mira220_mode *mode
>=20
> to intentionally break it .. it breaks!
>=20
> mira220.c:1016:9: error: expected =E2=80=98:=E2=80=99, =E2=80=98,=E2=80=
=99, =E2=80=98;=E2=80=99, =E2=80=98}=E2=80=99 or =E2=80=98__attribute__=E2=
=80=99 before =E2=80=98struct=E2=80=99
>  1016 |         struct regmap *regmap;
>       |         ^~~~~~
>=20
> I'm puzzled :)
>=20

Google says compilers are happy to chug along with "struct unknown *val;"
as long as it is never dereferenced.

> > > +
> > > +       struct regmap *regmap;
> > > +};

[...]

> > > +       if (i >=3D ARRAY_SIZE(mira220_mbus_color_formats))
> > > +               i =3D 0;
> > > +
> > > +       i =3D (i & ~3) | (mira220->vflip->val ? 2 : 0) | (mira220->hf=
lip->val ? 0 : 1);
> >
> > Using macros here would be nice.
> >
>=20
> I'm not sure, we're just adjusting the index, there's nothing related
> to the registers layout here
>=20

My bad, please ignore.

[...]

> > > +static const struct of_device_id mira220_dt_ids[] =3D {
> > > +       { .compatible =3D "ams,mira220" },
> >
> > I see AMS-OSRAM using the following naming scheme on the product page [=
1]:
> >     Mira220-2QC: Color
> >     Mira220-2QM: Mono
> >     Mira220-2QI: RGB-IR
> >
> > Should we use separate compatibles for the three variants? This is a
> > practice we have followed for other sensors too, and especially relevant
> > here because the driver currently doesn't work for RGB-IR variants.
> >
> > [1]: https://ams-osram.com/products/sensor-solutions/cmos-image-sensors=
/ams-mira220
> >
>=20
> I don't know. As we can perform runtime identification what would an
> additional compatible give us here ?
>=20

Some usecases might want to avoid powering on (and potentially flashing
privacy LED) and doing I2C transactions if the type of sensor can be known
at boot-time already.

There was a similar discussion here:
https://lore.kernel.org/linux-media/20260521-dangling-utensil-610af5e07d79@=
spud/

I don't know enough about this particular sensor, and if reading the OTP
values and programming registers is mandatory for all potential usecases
anyway, which would mean there's no benefit for avoiding the runtime
detection.

> Thanks
>    j
>=20

Thanks,
    Jai
