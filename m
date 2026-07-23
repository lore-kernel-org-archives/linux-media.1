Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DD8363C55;
	Thu, 23 Jul 2026 09:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800231; cv=none; b=lbeFA4B+nAOyCeJ5JlQm/wURiOq8w6QnyNYSdLP/kMjKpNGwVUF+c4cYF6IrQGr8bBgtnm7AL5RktNSiRu2u6HKqM2yUSpXdeuL+qaFl/IVXRm9ZJl4GnM+zoQx5OgQjM3DM/2MTgpradcTLAfLPfUNXjQZ0sDOk+fGq+5u0Rtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800231; c=relaxed/simple;
	bh=s+rJhrrRzc7gtgnOiaRz6oK/0OxEcUF6W2fWZn+Z+vk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=QjTgmMwaMKUSAFoN2uuWeFmtiU/GbiwHsy+HFjUQiJXxVdhl+2V5SWcTL7uDXo7loSudO2aelpdu5Acak11ydAH0UGoVyVuz/IV4w9BQyv3necUL29Hytt5X/OJmyUmbYuG1YUSZMzGcJX2aYgVKVgM2+ubVQirvJ/zhJILIaN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F/ooZO8S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F/ooZO8S"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5F6C22B;
	Thu, 23 Jul 2026 11:49:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784800166;
	bh=s+rJhrrRzc7gtgnOiaRz6oK/0OxEcUF6W2fWZn+Z+vk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=F/ooZO8SDA7WISVQ0V8Zj7zQTshJmLAfdQ0/qF5qNOcrfRj7NoloRHfeMvZTTFaM/
	 GQutOFecfXNuXXI8a1RmSxKkijjPMgdw5fp4pUo03BoR4nojzZPNu6ZIa5+3WwYwnI
	 7Nk0PAOa2360uNI7JtTcWHRoKLU5Tx2E1RUmMp30=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <amHRMQfRzppwZ5xz@zed>
References: <20260722-mira220-v7-0-dd5f1de98cd4@ideasonboard.com> <20260722-mira220-v7-2-dd5f1de98cd4@ideasonboard.com> <178472387683.3005206.5602199112336367476@freya> <amG5CiajbwGXhb59@zed> <178479424623.3238585.7446724208192156945@freya> <amHRMQfRzppwZ5xz@zed>
Subject: Re: [PATCH v7 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Philippe Baetens <philippebaetens@gmail.com>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 23 Jul 2026 15:20:21 +0530
Message-ID: <178480022192.3238585.15132202916626773351@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Jacopo,

Quoting Jacopo Mondi (2026-07-23 14:46:07)
> Hi Jai
>=20
> On Thu, Jul 23, 2026 at 01:40:46PM +0530, Jai Luthra wrote:
> > Quoting Jacopo Mondi (2026-07-23 12:51:48)
> > > Hi Jai,
> > >    thanks for the review
> > >
> > > On Wed, Jul 22, 2026 at 06:07:56PM +0530, Jai Luthra wrote:
> > > > Hi Jacopo,
> > > >
> > > > Thank you for the patch.
> > > >
> > > > Quoting Jacopo Mondi (2026-07-22 16:25:17)
> > > > > From: Philippe Baetens <philippebaetens@gmail.com>
> > > > >
> > > > > Add a V4L2 subdev driver for driver for the AMS-OSRAM Mira220 ima=
ge
> > > > > sensor.
> > > > >
> > > > > Mira220 is a global shutter image sensor with a resolution of 160=
0x1400
> > > > > pixels.
> > > > >
> > > > > The driver implements support for mono and RGB 12, 10 and 8 bits
> > > > > formats. The output data-rate per lane is 1500Mbit/s, with a maxi=
mum
> > > > > frame rate up to 90 fps.
> > > > >
> > > > > Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > [...]
> >
> > > > > +
> > > > > +/* Horizontal flip */
> > > > > +#define MIRA220_HFLIP_REG CCI_REG8(0x209C)
> > > > > +#define MIRA220_HFLIP_ENABLE_MIRROR 1
> > > > > +#define MIRA220_HFLIP_DISABLE_MIRROR 0
> > > > > +
> > > > > +/* Vertical flip */
> > > > > +#define MIRA220_VFLIP_REG CCI_REG8(0x1095)
> > > > > +#define MIRA220_VFLIP_ENABLE_FLIP 1
> > > > > +#define MIRA220_VFLIP_DISABLE_FLIP 0
> > > >
> > > > I don't see the above macros being used when updating the flip regi=
sters,
> > >
> > > We use ctrl->val indeed as it can be 1 or 0 only
> > >
> > > > and also HFLIP value is swapped from the control, which does not ma=
tch the
> > > > macro.
> > >
> > > Why I don't see it ?
> > >
> > >        case V4L2_CID_HFLIP:
> > >                ret =3D cci_write(mira220->regmap, MIRA220_HFLIP_REG,
> > >                                mira220->hflip->val, NULL);
> > >
> > >         mira220->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl=
_ops,
> > >                                            V4L2_CID_HFLIP, 0, 1, 1, 0=
);
> > >
> >
> > Oops, my bad I confused the code picking the bayer order from the table
> > with the one that writes to the registers. Please ignore this comment.
> >
>=20
> There is instead an inverted handling of hflip when adjusting the
> image format
>=20
> i =3D (i & ~3) | (mira220->vflip->val ? 2 : 0) | (mira220->hflip->val ? 0=
 : 1);
>=20
> This is because the wrong sorting of mira220_mbus_color_formats[].
>=20
> I've resorted it to match the ordering reported in the comment above
> it
>=20
>  * - no flip
>  * - h flip
>  * - v flip
>  * - h&v flips
>=20
> And adjusted the index calculation to use hflip->val ? 1 : 0
>=20
> (Sashiko had also pointed this out, but thought this was going to
> registers, while flip handling used to work fine as it was "wrong" in
> two places in the driver).
>=20

Aah good find.

> > >
> > > >
> > > > Could you please use the macros to keep things easy to read? And ma=
ybe a
> > > > mask macro instead of `(i & ~3)` too?
> > > >
> > >
> > > I could
> > >
> > > > > +
> > > > > +#define MIRA220_VSIZE_REG CCI_REG16_LE(0x1087)
> > > > > +#define MIRA220_VSTART_REG CCI_REG16_LE(0x107d)
> > > > > +#define MIRA220_HSIZE_REG CCI_REG16_LE(0x2008)
> > > > > +#define MIRA220_HSIZE_MASK GENMASK(9, 0)
> > > > > +#define MIRA220_HSTART_REG CCI_REG16_LE(0x200a)
> > > > > +#define MIRA220_HSTART_MASK GENMASK(9, 0)
> > > >
> > > > Same, drop the mask if unused.
> > > >
> > >
> > > Or maybe I should have used the masks!
> > >
> > > > > +#define MIRA220_MIPI_HSIZE_REG CCI_REG16_LE(0x207d)
> > > > > +
> > > > > +/* MIPI bus control */
> > > > > +#define MIRA220_MIPI_LANES_REG CCI_REG8(0x6012)
> > > > > +
> > > > > +#define MIRA220_MIPI_CLK_MODE_REG CCI_REG8(0x6013)
> > > > > +#define MIRA220_MIPI_CLK_CONTINUOUS 0x00
> > > > > +#define MIRA220_MIPI_CLK_NON_CONTINUOUS 0x01
> > > >
> > > > Does DT allow clock-continuous property? Do we handle it?
> > > >
> > >
> > > The bindings for this sensor allows all properties from
> > > video-interfaces.yaml, including clock-noncontinuous.
> > >
> > > The driver doesn't support it at the moment and unconditionally use
> > > continuous clock, but I guess it's nice to provide macros for the
> > > non-continuous configuration as well
> >
> > Ah, that's not too good if the DT allows it but the driver silently ign=
ores
> > it.
>=20
> Why ?
>=20
> We allow all properties from video-interfaces.yaml (something which I
> think it's wrong, but that's a long time ago discussion with dt
> maintainers, so I'm not contesting that) and we certainly don't handle
> them in drivers (in facts, what drivers do is not relevant to which
> properties are allowed for a device).
>=20

I am not saying the bindings shouldn't support that property, bindings are
for hardware. And yes you are free to not implement all features in the
driver.

But given the bindings and the hardware both support toggling between
continuous or non-continous MIPI clock, from a hardware engineer or
integrators perspective it would be quite confusing that setting the field
in DT will do nothing, with *no* warning to the user either during the DT
validation or the driver probe that it was ignored.

> >
> > If you end up reading the DT property to report an error, might as well=
 try
> > setting the bit too? ;-)
> >
>=20
> I don't think I'm reading it, am I ?
>=20

I meant that if you do end up accepting my suggestion and read the DT to
add a dev_warn() somewhere, you might as well set the bit because that's
easier.

[...]

> > > > > +/* Test Pattern */
> > > > > +#define MIRA220_REG_TEST_PATTERN CCI_REG8(0x2091)
> > > > > +#define MIRA220_TEST_PATTERN_DISABLE 0x00
> > > > > +#define MIRA220_TEST_PATTERN_VERTICAL_GRADIENT 0x01
> > > > > +
> > > > > +/* Module variant identifiers */
> > > > > +#define MIRA220_MONO_PLAIN_PF          0x1e62a032
> > > > > +#define MIRA220_MONO_PLAIN_NO_PF       0x1e62a045
> > > > > +#define MIRA220_MONO_AR_PF             0x1e62a036
> > > > > +#define MIRA220_RGB_PLAIN_PF           0x1e62a03b
> > > > > +#define MIRA220_RGB_PLAIN_NO_PF                0x1e62a046
> > > > > +#define MIRA220_RGB_AR_PF              0x1e62a03d
> > > >
> > > > Ah, I think this might be relevant to userspace, but not a problem =
to solve
> > > > in this patch.
> > > >
> > >
> > > How so ?
> > >
> >
> > I assumed AR coating and protective film might effect the tuning needed=
 for
> > the ISP, but I honestly don't know enough about that process.
> >
>=20
> One place where it is required to know the sensor variant is the
> tuning file selection in libcamera.
>=20
> We currently don't have a standardized way to do that. The only
> pipeline that automatically adjust for _mono variants is RPi, and it
> does that using the support image formats.
>=20
> I presume other pipelines should do the same ?
>=20

I would guess so. I don't think that's easily solvable so I'm okay with the
current driver.

> > > > > +
> > > > > +enum mira220_variants {
> > > > > +       MIRA220_VARIANT_MONO,
> > > > > +       MIRA220_VARIANT_RGB,
> > > > > +};
> > > > > +
[...]
> > [...]
> >
> > > > > +static const struct of_device_id mira220_dt_ids[] =3D {
> > > > > +       { .compatible =3D "ams,mira220" },
> > > >
> > > > I see AMS-OSRAM using the following naming scheme on the product pa=
ge [1]:
> > > >     Mira220-2QC: Color
> > > >     Mira220-2QM: Mono
> > > >     Mira220-2QI: RGB-IR
> > > >
> > > > Should we use separate compatibles for the three variants? This is a
> > > > practice we have followed for other sensors too, and especially rel=
evant
> > > > here because the driver currently doesn't work for RGB-IR variants.
> > > >
> > > > [1]: https://ams-osram.com/products/sensor-solutions/cmos-image-sen=
sors/ams-mira220
> > > >
> > >
> > > I don't know. As we can perform runtime identification what would an
> > > additional compatible give us here ?
> > >
> >
> > Some usecases might want to avoid powering on (and potentially flashing
> > privacy LED) and doing I2C transactions if the type of sensor can be kn=
own
> > at boot-time already.
> >
> > There was a similar discussion here:
> > https://lore.kernel.org/linux-media/20260521-dangling-utensil-610af5e07=
d79@spud/
> >
> > I don't know enough about this particular sensor, and if reading the OTP
> > values and programming registers is mandatory for all potential usecases
> > anyway, which would mean there's no benefit for avoiding the runtime
> > detection.
>=20
> A bit out of my territory here, but can we start with a single
> compatible and add more if needed (and use the initial one as a
> fallback?)
>=20

That's fine with me.

Thanks,
Jai
