Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665843D093A;
	Fri, 14 Aug 2026 12:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711961; cv=none; b=CovpHJLdi4uO88v/CQU3lUztWPiS2jJgXL8IcKUF1P+Ys3lYKbW/ejQhEDIaebSOxm5aY7pOgSCAGGWPiP6WjMYih8rN4QJP2uTVuImjhrsvTCqV1znjutOMKPP8C9qlWaYz0ilf17JElajZ4ynz4re435iYS1xmkBOlSK8Pz8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711961; c=relaxed/simple;
	bh=es0je0/437gq8cmzr14ZFgqh5uRZNgyLDKM3R3QMmLM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=cBZprrdWX7eDUz8/s5EtZYOQbyKq7lY8GCa6pZWuSq/ea1Gp64tu314ojmLeB6JB2RmC5cTyjPLeISRpdLbMQXAjXhAL3hbzQmS1+jiV9Ca9RnZMCh64RI4QcKGMKM82LuFrwrHCMTmlOtTOsap/Gdzg+O5SLFpIDIMgxM0nplc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XU/yPTea reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XU/yPTea"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:3dec:864f:91be:708:7e80])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 449F61E76;
	Fri, 14 Aug 2026 14:51:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786711877;
	bh=es0je0/437gq8cmzr14ZFgqh5uRZNgyLDKM3R3QMmLM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XU/yPTea6FabwU2r4z8rWFPUYYf04qwgEc5U5UKoMaC0aq+NK9gnDlTaFiTcgALYP
	 3Xe3wCIVrRcHy1CO06b2m7ow9JvWo0oM1KOMz0C6azsMIfzid2C3NMcqZWD3HDB4WO
	 WyJmVV7pwG6QZzinD3WQx6dhHR/vjzewLASYEsKs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PN0P287MB20192F0F48C2E2A29481DE549ADA2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io> <20260806120216.24145-3-himanshu.bhavani@siliconsignals.io> <178608605778.4139729.11308202650136036897@freya> <PN0P287MB201968EA50C12E941A58AABE9ADD2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM> <178651541361.128734.17813607544541448526@freya> <PN0P287MB20192F0F48C2E2A29481DE549ADA2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v3 2/3] media: i2c: add imx576 image sensor driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Xiaolei Wang <xiaolei.wang@windriver.com>, Kate Hsuan <hpa@redhat.com>, Walter Werner Schneider <contact@schnwalter.eu>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-ar
 m-msm@vger.kernel.org>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Date: Fri, 14 Aug 2026 18:22:29 +0530
Message-ID: <178671194916.652077.10721711492127784170@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Himanshu Bhavani (2026-08-14 17:05:12)
> Hi Jai,
>=20
> >Hi Himanshu,
> >
> > Quoting Himanshu Bhavani (2026-08-11 14:44:12)
> > > Hi Jai,
> > >
> > > >Hi Himanshu,
> > > >
> > > >Thanks for the patch.
> > > >
> > > >Not a full review, but just a few comments on the PLL programming.
> > > >
> > > >Quoting Himanshu Bhavani (2026-08-06 17:32:08)
> > > >> Add a v4l2 subdevice driver for the Sony imx576 sensor.
> > > >>
> > > >> The Sony IMX576 image sensor with an active
> > > >> array size of 5760 x 4312
> > > >>
> > > >> The following features are supported:
> > > >> - Manual exposure an gain control support
> > > >> - vblank/hblank control support
> > > >> - Supported resolution: 5760 x 4312 30fps (SRGGB10)
> > > >>
> > > >> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.i=
o>
> > > >
> > > >[...]
> > > >
> > > >> +#define IMX576_INCLK_RATE              (24 * HZ_PER_MHZ)
> > > >> +
> > > >> +#define IMX576_REG_CHIP_ID             CCI_REG16(0x0016)
> > > >> +#define IMX576_CHIP_ID                 0x0576
> > > >> +
> > > >> +#define IMX576_REG_MODE_SELECT         CCI_REG8(0x0100)
> > > >> +#define IMX576_MODE_STANDBY            0x00
> > > >> +#define IMX576_MODE_STREAMING          0x01
> > > >> +
> > > >> +#define IMX576_REG_HOLD                        CCI_REG8(0x0104)
> > > >> +
> > > >> +#define IMX576_REG_EXPOSURE            CCI_REG16(0x0202)
> > > >> +#define IMX576_EXPOSURE_MIN            8
> > > >> +#define IMX576_EXPOSURE_OFFSET         22
> > > >> +#define IMX576_EXPOSURE_STEP           1
> > > >> +#define IMX576_EXPOSURE_DEFAULT                0x0648
> > > >> +
> > > >> +#define IMX576_REG_ANALOG_GAIN         CCI_REG16(0x0204)
> > > >> +#define IMX576_ANA_GAIN_MIN            0
> > > >> +#define IMX576_ANA_GAIN_MAX            978
> > > >> +#define IMX576_ANA_GAIN_STEP           1
> > > >> +#define IMX576_ANA_GAIN_DEFAULT                0
> > > >> +
> > > >> +#define IMX576_REG_IVT_PXCK_DIV                CCI_REG8(0x0301)
> > > >> +#define IMX576_REG_IVT_SYCK_DIV                CCI_REG8(0x0303)
> > > >> +#define IMX576_REG_IVT_PREPLLCK_DIV    CCI_REG8(0x0305)
> > > >> +#define IMX576_REG_IVT_PLL_MPY         CCI_REG16(0x0306)
> > > >> +#define IMX576_REG_IOP_SYCK_DIV                CCI_REG8(0x030b)
> > > >> +#define IMX576_REG_IOP_PREPLLCK_DIV    CCI_REG8(0x030d)
> > > >> +#define IMX576_REG_IOP_PLL_MPY         CCI_REG16(0x030e)
> > > >> +#define IMX576_REG_PLL_MULT_DRIV       CCI_REG8(0x0310)
> > > >> +
> > > >> +#define IMX576_REG_FRM_LENGTH_LINES    CCI_REG16(0x0340)
> > > >> +#define IMX576_REG_LINE_LENGTH_PCK     CCI_REG16(0x0342)
> > > >> +#define IMX576_LINE_LENGTH             6144
> > > >> +#define IMX576_VBLANK_DEF              4387
> > > >> +
> > > >> +/* FIXME: Exact VBLANK limit unknown (no datasheet). */
> > > >> +#define IMX576_VBLANK_MAX              32420
> > > >> +
> > > >> +#define IMX576_REG_X_ADD_STA           CCI_REG16(0x0344)
> > > >> +#define IMX576_REG_Y_ADD_STA           CCI_REG16(0x0346)
> > > >> +#define IMX576_REG_X_ADD_END           CCI_REG16(0x0348)
> > > >> +#define IMX576_REG_Y_ADD_END           CCI_REG16(0x034a)
> > > >> +#define IMX576_REG_X_OUTPUT_SIZE       CCI_REG16(0x034c)
> > > >> +#define IMX576_REG_Y_OUTPUT_SIZE       CCI_REG16(0x034e)
> > > >> +
> > > >> +#define IMX576_REG_DIG_CROP_X_OFFSET   CCI_REG16(0x0408)
> > > >> +#define IMX576_REG_DIG_CROP_Y_OFFSET   CCI_REG16(0x040a)
> > > >> +#define IMX576_REG_DIG_CROP_WIDTH      CCI_REG16(0x040c)
> > > >> +#define IMX576_REG_DIG_CROP_HEIGHT     CCI_REG16(0x040e)
> > > >
> > > >This sensor's registers seem quite similar to the MIPI CCS specifica=
tion.
> > >
> > > Yes, you are right some registers seems to be similar I will address =
it.
> > >
> >
> > That's good to know. Did you check if the sensor itself advertises itse=
lf
> > as compliant to a particular version of the CCS standard? You can read =
the
> > below register:
> >
> > #define CCS_R_MIPI_CCS_VERSION                                        C=
CI_REG8(0x0007)
> >
> > In general it might help to take a dump of all the CCS registers to see=
 if
> > the ranges given in datasheet match what the sensor's registers say.
> >
>=20
> I tried reading CCS_R_MIPI_CCS_VERSION (CCI_REG8(0x0007)), but it
> returned 0x00.
> it is expected to return either CCS_MIPI_CCS_VERSION_V1_0 or
> CCS_MIPI_CCS_VERSION_V1_1 ?
>=20

Not necessarily, it's the same as IMX708 which also returned 0x00.

I interpreted this to mean the sensor isn't compliant to the CCS
specification v1.0 or v1.1.

It supports the same register layout, but some features might make it
incompatible with the spec.

> I have shared you the minimal datasheet in personal,
>=20
> Could you please clarify how you verified the IMX708 ? Is 0x0007
> documented as the MIPI CCS Version register?

It wasn't documented for IMX708 either. But dumping all CCS registers
(present in ccs-regs.h) worked for IMX708. I also ended up reusing the
register definitions by including ccs-regs.h in my driver, rather than
re-defining all macros.

>=20
>=20
> Because I tried applyig the imx576_pll_limits{..} PLL calculation and
> updating the corresponding registers, streaming works fine to me.
> readback those pll related registers confirms they are set as expected by
> the ccs-pll.c calculation.
>=20

That's good, I would suggest going forward with this rather than hardcoded
values.

Thanks,
    Jai

> > >
> > > >Please check if the sensor is CCS compatible. Even if it is not, I t=
hink
> > > >the PLL programming is compatible, so you can use the helpers from
> > > >ccs-pll.c.
> > >
> > > Most PLL values are derived from the limited IMX576 datasheet informa=
tion
> > > available.
> > >
> > > For the unknown values, I referred to out of tree driver and validated
> > > and assumed them based on the PLL configuration.
> > >
> > > Should I proceed with the PLL programming as it is, or drop the PLL
> > > approach and retain only the CCS-supported registers?
> > >
> >
> > I'm not sure I fully understand your question.
> >
> > If you can support more than 1 link frequency using the ccs_pll_calcula=
te()
> > helper, then my suggestion would be to do that, even if it's just 2
> > well-tested frequencies today.
> >
> > That leaves the driver in much better shape for future (for use with a
> > different input clock or frequency). At least that's what I have done f=
or
> > my IMX708 series, which was similar to this sensor.
> >
> > Thanks,
> >     Jai
> >
> > > static const struct ccs_pll_limits imx576_pll_limits =3D {
> > >         .min_ext_clk_freq_hz =3D 6000000,
> > >         .max_ext_clk_freq_hz =3D 27000000,
> > >
> > >         .vt_fr =3D {
> > >                 /* Confirmed values as per datasheet */
> > >
> > >                 .min_pre_pll_clk_div =3D 1,
> > >                 .max_pre_pll_clk_div =3D 4,
> > >                 .min_pll_ip_clk_freq_hz =3D 6000000,
> > >                 .max_pll_ip_clk_freq_hz =3D 12000000,
> > >                 .min_pll_multiplier =3D 87,
> > >                 .max_pll_multiplier =3D 350,
> > >                 .min_pll_op_clk_freq_hz =3D 1050000000,
> > >                 .max_pll_op_clk_freq_hz =3D 2100000000,
> > >         },
> > >
> > >         .vt_bk =3D {
> > >                 /* here the sys_clk_div (IVT_SYCK_DIV -> 0303) value =
as per out of tree driver they are using div as 2 or 4  */
> > >
> > >                 .min_sys_clk_div =3D 2,
> > >                 .max_sys_clk_div =3D 4,
> > >                 .min_sys_clk_freq_hz =3D 262500000,
> > >                 .max_sys_clk_freq_hz =3D 1050000000,
> > >
> > >                 /* pix_clk_div also being used as an Fixed to 5 */
> > >                 .min_pix_clk_div =3D 5,
> > >                 .max_pix_clk_div =3D 5,
> > >                 .min_pix_clk_freq_hz =3D 52500000,
> > >                 .max_pix_clk_freq_hz =3D 210000000,
> > >         },
> > >         .op_fr =3D {
> > >
> > >                 /* Confirmed values as per datasheet */
> > >
> > >                 .min_pre_pll_clk_div =3D 1,
> > >                 .max_pre_pll_clk_div =3D 15,
> > >                 .min_pll_ip_clk_freq_hz =3D 6000000,
> > >                 .max_pll_ip_clk_freq_hz =3D 12000000,
> > >                 .min_pll_multiplier =3D 47,
> > >                 .max_pll_multiplier =3D 2300,
> > >                 .min_pll_op_clk_freq_hz =3D 1250000000,
> > >                 .max_pll_op_clk_freq_hz =3D 2300000000,
> > >         },
> > >         .op_bk =3D {
> > >
> > >                  /* Similarly here also (OP_SYS_CLK_DIV -> 030b) valu=
e being used is 1,2,4 in out of tree driver
> > >                   * But as per ccs-limits { CCS_R_MAX_OP_SYS_CLK_DIV =
=3D 2 }
> > >                   */
> > >
> > >                 .min_sys_clk_div =3D 1,
> > >                 .max_sys_clk_div =3D 2,
> > >                 .min_sys_clk_freq_hz =3D 625000000,
> > >                 .max_sys_clk_freq_hz =3D 2300000000,
> > >
> > >                 /* (RAW8 and RAW10) */
> > >                 .min_pix_clk_div =3D 8,
> > >                 .max_pix_clk_div =3D 10,
> > >                 .min_pix_clk_freq_hz =3D 62500000,
> > >                 .max_pix_clk_freq_hz =3D 2300000000,
> > >         },
> > >
> > > >> +
> > > >> +#define IMX576_REG_BINNING_MODE                CCI_REG8(0x0900)
> > > >> +#define IMX576_REG_BINNING_TYPE                CCI_REG8(0x0901)
> > > >> +#define IMX576_REG_BINNING_WEIGHT      CCI_REG8(0x0902)
> > > >> +
> > > >> +#define IMX576_PIXEL_RATE              813600000
> > > >> +#define IMX576_NUM_DATA_LANES          4
> > > >> +
> > > >> +/* IMX576 native and active pixel array size */
> > > >> +static const struct v4l2_rect imx576_native_area =3D {
> > > >> +       .top =3D 0,
> > > >> +       .left =3D 0,
> > > >> +       .width =3D 5792,
> > > >> +       .height =3D 4464,
> > > >> +};
> > > >> +
> > > >> +static const struct v4l2_rect imx576_active_area =3D {
> > > >> +       .top =3D 136,
> > > >> +       .left =3D 16,
> > > >> +       .width =3D 5760,
> > > >> +       .height =3D 4312,
> > > >> +};
> > > >> +
> > > >> +static const char * const imx576_supply_names[] =3D {
> > > >> +       "vana",         /* Analog Power */
> > > >> +       "vif",          /* Interface Power */
> > > >> +       "vdig",         /* Digital Power */
> > > >> +};
> > > >> +
> > > >> +static const struct cci_reg_sequence imx576_common_regs[] =3D {
> > > >
> > > >[...]
> > > >
> > > >> +       { IMX576_REG_IVT_PXCK_DIV, 0x05 },
> > > >> +       { IMX576_REG_IVT_SYCK_DIV, 0x02 },
> > > >> +       { IMX576_REG_IVT_PREPLLCK_DIV, 0x04 },
> > > >> +       { IMX576_REG_IVT_PLL_MPY, 0x0154 },
> > > >> +       { IMX576_REG_IOP_SYCK_DIV, 0x01 },
> > > >> +       { IMX576_REG_IOP_PREPLLCK_DIV, 0x04 },
> > > >> +       { IMX576_REG_PLL_MULT_DRIV, 0x01 },
> > > >
> > > >I think when Laurent asked to make the PLL configurable for differen=
t link
> > > >frequencies, he meant deriving these and the OP_PLL_MPY value instea=
d of
> > > >hardcoding all of them and only supporting one link freq.
> > > >> +       { CCI_REG8(0x0b06), 0x01 },
> > > >> +       { CCI_REG8(0x3620), 0x01 },
> > > >> +       { CCI_REG8(0x3f0c), 0x00 },
> > > >> +};
> > > >> +
> > > >
> > > >Thanks,
> > > >    Jai
> > >
> > >
> > > Best Regards,
> > > Himanshu
>=20
> Best Regards,
> Himanshu
