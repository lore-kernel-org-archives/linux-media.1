Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B51351C34;
	Wed, 12 Aug 2026 06:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786515428; cv=none; b=OElhZc/tYV/9AWA6oOifdwutTdHgUepPgHTiiS/7mnSrsjsCbYe85ozho5yv0nt91mlhdies4lbwWoxaurQ6LW0Zv0KMGNuKiO5qR/8m7Sf25FPfi3w970T07VAPqEvqTcUfICV/4e5xrqNuI4DIx/XSr/8LVmOVx+1CfP5rQOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786515428; c=relaxed/simple;
	bh=pH0ZesvOfjb5OXHLaaDp3KApXGZjjO2hy0Egxoxyx6M=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Xdr2LsZmjbOjE8GjjIkJJ+VxSiUGX84RKmI6Ba7x9VQGZyd4WCncVCmP83MsqQFEJYcXfag6JXdkQrKrrta6WJmj5KMdXtg7pMExCb3vAlzxAxCzSrDEsydv8pWEdqjyHQdP4kC+Z9qL8A1xrHD8tWD7F8DGUOizYZVIiWoGXFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lwISbQsQ reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lwISbQsQ"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:49da:a02a:36af:a1dd:9a63])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B680B2D;
	Wed, 12 Aug 2026 08:15:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786515343;
	bh=pH0ZesvOfjb5OXHLaaDp3KApXGZjjO2hy0Egxoxyx6M=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lwISbQsQnuE+DtezOi6VY3hphC2oMuW1k0NvIcTAiQqhHcXDQXoT3U3YdPFkGXiTl
	 jgtWM2uKe7RjtwgM/uNxADdR3DTVBaTVtH4HgZQ7TrOGbhKW4rbPIpgbBMPMJRVD5u
	 EgF2Xjo0dEI7Y1csWrVXy1MQH5bld7pojhmxP1wk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PN0P287MB201968EA50C12E941A58AABE9ADD2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io> <20260806120216.24145-3-himanshu.bhavani@siliconsignals.io> <178608605778.4139729.11308202650136036897@freya> <PN0P287MB201968EA50C12E941A58AABE9ADD2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v3 2/3] media: i2c: add imx576 image sensor driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Xiaolei Wang <xiaolei.wang@windriver.com>, Kate Hsuan <hpa@redhat.com>, Walter Werner Schneider <contact@schnwalter.eu>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-ar
 m-msm@vger.kernel.org>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Date: Wed, 12 Aug 2026 11:46:53 +0530
Message-ID: <178651541361.128734.17813607544541448526@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Himanshu,

Quoting Himanshu Bhavani (2026-08-11 14:44:12)
> Hi Jai,
>=20
> >Hi Himanshu,
> >
> >Thanks for the patch.
> >
> >Not a full review, but just a few comments on the PLL programming.
> >
> >Quoting Himanshu Bhavani (2026-08-06 17:32:08)
> >> Add a v4l2 subdevice driver for the Sony imx576 sensor.
> >>
> >> The Sony IMX576 image sensor with an active
> >> array size of 5760 x 4312
> >>
> >> The following features are supported:
> >> - Manual exposure an gain control support
> >> - vblank/hblank control support
> >> - Supported resolution: 5760 x 4312 30fps (SRGGB10)
> >>
> >> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> >
> >[...]
> >
> >> +#define IMX576_INCLK_RATE              (24 * HZ_PER_MHZ)
> >> +
> >> +#define IMX576_REG_CHIP_ID             CCI_REG16(0x0016)
> >> +#define IMX576_CHIP_ID                 0x0576
> >> +
> >> +#define IMX576_REG_MODE_SELECT         CCI_REG8(0x0100)
> >> +#define IMX576_MODE_STANDBY            0x00
> >> +#define IMX576_MODE_STREAMING          0x01
> >> +
> >> +#define IMX576_REG_HOLD                        CCI_REG8(0x0104)
> >> +
> >> +#define IMX576_REG_EXPOSURE            CCI_REG16(0x0202)
> >> +#define IMX576_EXPOSURE_MIN            8
> >> +#define IMX576_EXPOSURE_OFFSET         22
> >> +#define IMX576_EXPOSURE_STEP           1
> >> +#define IMX576_EXPOSURE_DEFAULT                0x0648
> >> +
> >> +#define IMX576_REG_ANALOG_GAIN         CCI_REG16(0x0204)
> >> +#define IMX576_ANA_GAIN_MIN            0
> >> +#define IMX576_ANA_GAIN_MAX            978
> >> +#define IMX576_ANA_GAIN_STEP           1
> >> +#define IMX576_ANA_GAIN_DEFAULT                0
> >> +
> >> +#define IMX576_REG_IVT_PXCK_DIV                CCI_REG8(0x0301)
> >> +#define IMX576_REG_IVT_SYCK_DIV                CCI_REG8(0x0303)
> >> +#define IMX576_REG_IVT_PREPLLCK_DIV    CCI_REG8(0x0305)
> >> +#define IMX576_REG_IVT_PLL_MPY         CCI_REG16(0x0306)
> >> +#define IMX576_REG_IOP_SYCK_DIV                CCI_REG8(0x030b)
> >> +#define IMX576_REG_IOP_PREPLLCK_DIV    CCI_REG8(0x030d)
> >> +#define IMX576_REG_IOP_PLL_MPY         CCI_REG16(0x030e)
> >> +#define IMX576_REG_PLL_MULT_DRIV       CCI_REG8(0x0310)
> >> +
> >> +#define IMX576_REG_FRM_LENGTH_LINES    CCI_REG16(0x0340)
> >> +#define IMX576_REG_LINE_LENGTH_PCK     CCI_REG16(0x0342)
> >> +#define IMX576_LINE_LENGTH             6144
> >> +#define IMX576_VBLANK_DEF              4387
> >> +
> >> +/* FIXME: Exact VBLANK limit unknown (no datasheet). */
> >> +#define IMX576_VBLANK_MAX              32420
> >> +
> >> +#define IMX576_REG_X_ADD_STA           CCI_REG16(0x0344)
> >> +#define IMX576_REG_Y_ADD_STA           CCI_REG16(0x0346)
> >> +#define IMX576_REG_X_ADD_END           CCI_REG16(0x0348)
> >> +#define IMX576_REG_Y_ADD_END           CCI_REG16(0x034a)
> >> +#define IMX576_REG_X_OUTPUT_SIZE       CCI_REG16(0x034c)
> >> +#define IMX576_REG_Y_OUTPUT_SIZE       CCI_REG16(0x034e)
> >> +
> >> +#define IMX576_REG_DIG_CROP_X_OFFSET   CCI_REG16(0x0408)
> >> +#define IMX576_REG_DIG_CROP_Y_OFFSET   CCI_REG16(0x040a)
> >> +#define IMX576_REG_DIG_CROP_WIDTH      CCI_REG16(0x040c)
> >> +#define IMX576_REG_DIG_CROP_HEIGHT     CCI_REG16(0x040e)
> >
> >This sensor's registers seem quite similar to the MIPI CCS specification.
>=20
> Yes, you are right some registers seems to be similar I will address it.
>=20

That's good to know. Did you check if the sensor itself advertises itself
as compliant to a particular version of the CCS standard? You can read the
below register:

#define CCS_R_MIPI_CCS_VERSION					CCI_REG8(0x0007)

In general it might help to take a dump of all the CCS registers to see if
the ranges given in datasheet match what the sensor's registers say.

>=20
> >Please check if the sensor is CCS compatible. Even if it is not, I think
> >the PLL programming is compatible, so you can use the helpers from
> >ccs-pll.c.
>=20
> Most PLL values are derived from the limited IMX576 datasheet information
> available.
>=20
> For the unknown values, I referred to out of tree driver and validated
> and assumed them based on the PLL configuration.
>=20
> Should I proceed with the PLL programming as it is, or drop the PLL
> approach and retain only the CCS-supported registers?
>=20

I'm not sure I fully understand your question.

If you can support more than 1 link frequency using the ccs_pll_calculate()
helper, then my suggestion would be to do that, even if it's just 2
well-tested frequencies today.

That leaves the driver in much better shape for future (for use with a
different input clock or frequency). At least that's what I have done for
my IMX708 series, which was similar to this sensor.

Thanks,
    Jai

> static const struct ccs_pll_limits imx576_pll_limits =3D {
>         .min_ext_clk_freq_hz =3D 6000000,
>         .max_ext_clk_freq_hz =3D 27000000,
>=20
>         .vt_fr =3D {
>                 /* Confirmed values as per datasheet */
>=20
>                 .min_pre_pll_clk_div =3D 1,
>                 .max_pre_pll_clk_div =3D 4,
>                 .min_pll_ip_clk_freq_hz =3D 6000000,
>                 .max_pll_ip_clk_freq_hz =3D 12000000,
>                 .min_pll_multiplier =3D 87,
>                 .max_pll_multiplier =3D 350,
>                 .min_pll_op_clk_freq_hz =3D 1050000000,
>                 .max_pll_op_clk_freq_hz =3D 2100000000,
>         },
>=20
>         .vt_bk =3D {
>                 /* here the sys_clk_div (IVT_SYCK_DIV -> 0303) value as p=
er out of tree driver they are using div as 2 or 4  */
>=20
>                 .min_sys_clk_div =3D 2,
>                 .max_sys_clk_div =3D 4,
>                 .min_sys_clk_freq_hz =3D 262500000,
>                 .max_sys_clk_freq_hz =3D 1050000000,
>=20
>                 /* pix_clk_div also being used as an Fixed to 5 */
>                 .min_pix_clk_div =3D 5,
>                 .max_pix_clk_div =3D 5,
>                 .min_pix_clk_freq_hz =3D 52500000,
>                 .max_pix_clk_freq_hz =3D 210000000,
>         },
>         .op_fr =3D {
>=20
>                 /* Confirmed values as per datasheet */
>=20
>                 .min_pre_pll_clk_div =3D 1,
>                 .max_pre_pll_clk_div =3D 15,
>                 .min_pll_ip_clk_freq_hz =3D 6000000,
>                 .max_pll_ip_clk_freq_hz =3D 12000000,
>                 .min_pll_multiplier =3D 47,
>                 .max_pll_multiplier =3D 2300,
>                 .min_pll_op_clk_freq_hz =3D 1250000000,
>                 .max_pll_op_clk_freq_hz =3D 2300000000,
>         },
>         .op_bk =3D {
>=20
>                  /* Similarly here also (OP_SYS_CLK_DIV -> 030b) value be=
ing used is 1,2,4 in out of tree driver
>                   * But as per ccs-limits { CCS_R_MAX_OP_SYS_CLK_DIV =3D =
2 }
>                   */
>=20
>                 .min_sys_clk_div =3D 1,
>                 .max_sys_clk_div =3D 2,
>                 .min_sys_clk_freq_hz =3D 625000000,
>                 .max_sys_clk_freq_hz =3D 2300000000,
>=20
>                 /* (RAW8 and RAW10) */
>                 .min_pix_clk_div =3D 8,
>                 .max_pix_clk_div =3D 10,
>                 .min_pix_clk_freq_hz =3D 62500000,
>                 .max_pix_clk_freq_hz =3D 2300000000,
>         },
>=20
> >> +
> >> +#define IMX576_REG_BINNING_MODE                CCI_REG8(0x0900)
> >> +#define IMX576_REG_BINNING_TYPE                CCI_REG8(0x0901)
> >> +#define IMX576_REG_BINNING_WEIGHT      CCI_REG8(0x0902)
> >> +
> >> +#define IMX576_PIXEL_RATE              813600000
> >> +#define IMX576_NUM_DATA_LANES          4
> >> +
> >> +/* IMX576 native and active pixel array size */
> >> +static const struct v4l2_rect imx576_native_area =3D {
> >> +       .top =3D 0,
> >> +       .left =3D 0,
> >> +       .width =3D 5792,
> >> +       .height =3D 4464,
> >> +};
> >> +
> >> +static const struct v4l2_rect imx576_active_area =3D {
> >> +       .top =3D 136,
> >> +       .left =3D 16,
> >> +       .width =3D 5760,
> >> +       .height =3D 4312,
> >> +};
> >> +
> >> +static const char * const imx576_supply_names[] =3D {
> >> +       "vana",         /* Analog Power */
> >> +       "vif",          /* Interface Power */
> >> +       "vdig",         /* Digital Power */
> >> +};
> >> +
> >> +static const struct cci_reg_sequence imx576_common_regs[] =3D {
> >
> >[...]
> >
> >> +       { IMX576_REG_IVT_PXCK_DIV, 0x05 },
> >> +       { IMX576_REG_IVT_SYCK_DIV, 0x02 },
> >> +       { IMX576_REG_IVT_PREPLLCK_DIV, 0x04 },
> >> +       { IMX576_REG_IVT_PLL_MPY, 0x0154 },
> >> +       { IMX576_REG_IOP_SYCK_DIV, 0x01 },
> >> +       { IMX576_REG_IOP_PREPLLCK_DIV, 0x04 },
> >> +       { IMX576_REG_PLL_MULT_DRIV, 0x01 },
> >
> >I think when Laurent asked to make the PLL configurable for different li=
nk
> >frequencies, he meant deriving these and the OP_PLL_MPY value instead of
> >hardcoding all of them and only supporting one link freq.
> >> +       { CCI_REG8(0x0b06), 0x01 },
> >> +       { CCI_REG8(0x3620), 0x01 },
> >> +       { CCI_REG8(0x3f0c), 0x00 },
> >> +};
> >> +
> >
> >Thanks,
> >    Jai
>=20
>=20
> Best Regards,
> Himanshu
