Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DB538757A;
	Fri,  7 Aug 2026 07:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086067; cv=none; b=KieG56X6bW1MYs115101h5gq8t4m3hN/i7gesalN3fQ5H2vHJm5A5nqBDbLocTf14qIscBkwedtp0z7jgwWzXdXlD7cV8lhfeO8CwKgvteggc9e2Dm//ytPdSkhYT+K6EW3mc/uWryqVeWr4izCA+yJyXb3UK7m//aFWle1ftgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086067; c=relaxed/simple;
	bh=DPt7Wbhkvslhx16ZR5jytlQCC2P1SaKxMzooIoqN/Ng=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=pZiKDEWP/E9dcYb/foZCE8ckWEcDMFrkrw5vBRSmrDkNUJTeFMuYNRvK9ppy12sB7M35XrGYkj1ZLPpZvJ+EY7pfdvFUWIDgeYh7ZrtUcFyJ5kDJcUJxif4+NE+q+P0FVsRnlEsXZaIMcwGC3Zx3FhBrLeqy1Zt4yDYAucizfYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xd4zvIEc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xd4zvIEc"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:4f4:b619:ec54:a907:a006])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B182741;
	Fri,  7 Aug 2026 08:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786085991;
	bh=DPt7Wbhkvslhx16ZR5jytlQCC2P1SaKxMzooIoqN/Ng=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Xd4zvIEc+lya0wIQoGbfWOxP5j2kEaiE1gAXLfgH+oOxs6G1TxU+npe2cUSCE4DCL
	 iyML0TkHa3QTgzcyqpLZSfEkr2TXbY8kB7H1fNyipvtvX2NrZveQK7HB3qoRY4R7Dr
	 +OixNfzjiZHoWgKzIJtU1Xfesuaq9RHV1Iy3Kwjc=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260806120216.24145-3-himanshu.bhavani@siliconsignals.io>
References: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io> <20260806120216.24145-3-himanshu.bhavani@siliconsignals.io>
Subject: Re: [PATCH v3 2/3] media: i2c: add imx576 image sensor driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Xiaolei Wang <xiaolei.wang@windriver.com>, Kate Hsuan <hpa@redhat.com>, Walter Werner Schneider <contact@schnwalter.eu>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, sakari.ailus@linux.intel.com
Date: Fri, 07 Aug 2026 12:30:57 +0530
Message-ID: <178608605778.4139729.11308202650136036897@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Himanshu,

Thanks for the patch.

Not a full review, but just a few comments on the PLL programming.

Quoting Himanshu Bhavani (2026-08-06 17:32:08)
> Add a v4l2 subdevice driver for the Sony imx576 sensor.
>=20
> The Sony IMX576 image sensor with an active
> array size of 5760 x 4312
>=20
> The following features are supported:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - Supported resolution: 5760 x 4312 30fps (SRGGB10)
>=20
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

[...]

> +#define IMX576_INCLK_RATE              (24 * HZ_PER_MHZ)
> +
> +#define IMX576_REG_CHIP_ID             CCI_REG16(0x0016)
> +#define IMX576_CHIP_ID                 0x0576
> +
> +#define IMX576_REG_MODE_SELECT         CCI_REG8(0x0100)
> +#define IMX576_MODE_STANDBY            0x00
> +#define IMX576_MODE_STREAMING          0x01
> +
> +#define IMX576_REG_HOLD                        CCI_REG8(0x0104)
> +
> +#define IMX576_REG_EXPOSURE            CCI_REG16(0x0202)
> +#define IMX576_EXPOSURE_MIN            8
> +#define IMX576_EXPOSURE_OFFSET         22
> +#define IMX576_EXPOSURE_STEP           1
> +#define IMX576_EXPOSURE_DEFAULT                0x0648
> +
> +#define IMX576_REG_ANALOG_GAIN         CCI_REG16(0x0204)
> +#define IMX576_ANA_GAIN_MIN            0
> +#define IMX576_ANA_GAIN_MAX            978
> +#define IMX576_ANA_GAIN_STEP           1
> +#define IMX576_ANA_GAIN_DEFAULT                0
> +
> +#define IMX576_REG_IVT_PXCK_DIV                CCI_REG8(0x0301)
> +#define IMX576_REG_IVT_SYCK_DIV                CCI_REG8(0x0303)
> +#define IMX576_REG_IVT_PREPLLCK_DIV    CCI_REG8(0x0305)
> +#define IMX576_REG_IVT_PLL_MPY         CCI_REG16(0x0306)
> +#define IMX576_REG_IOP_SYCK_DIV                CCI_REG8(0x030b)
> +#define IMX576_REG_IOP_PREPLLCK_DIV    CCI_REG8(0x030d)
> +#define IMX576_REG_IOP_PLL_MPY         CCI_REG16(0x030e)
> +#define IMX576_REG_PLL_MULT_DRIV       CCI_REG8(0x0310)
> +
> +#define IMX576_REG_FRM_LENGTH_LINES    CCI_REG16(0x0340)
> +#define IMX576_REG_LINE_LENGTH_PCK     CCI_REG16(0x0342)
> +#define IMX576_LINE_LENGTH             6144
> +#define IMX576_VBLANK_DEF              4387
> +
> +/* FIXME: Exact VBLANK limit unknown (no datasheet). */
> +#define IMX576_VBLANK_MAX              32420
> +
> +#define IMX576_REG_X_ADD_STA           CCI_REG16(0x0344)
> +#define IMX576_REG_Y_ADD_STA           CCI_REG16(0x0346)
> +#define IMX576_REG_X_ADD_END           CCI_REG16(0x0348)
> +#define IMX576_REG_Y_ADD_END           CCI_REG16(0x034a)
> +#define IMX576_REG_X_OUTPUT_SIZE       CCI_REG16(0x034c)
> +#define IMX576_REG_Y_OUTPUT_SIZE       CCI_REG16(0x034e)
> +
> +#define IMX576_REG_DIG_CROP_X_OFFSET   CCI_REG16(0x0408)
> +#define IMX576_REG_DIG_CROP_Y_OFFSET   CCI_REG16(0x040a)
> +#define IMX576_REG_DIG_CROP_WIDTH      CCI_REG16(0x040c)
> +#define IMX576_REG_DIG_CROP_HEIGHT     CCI_REG16(0x040e)

This sensor's registers seem quite similar to the MIPI CCS specification.

Please check if the sensor is CCS compatible. Even if it is not, I think
the PLL programming is compatible, so you can use the helpers from
ccs-pll.c.

> +
> +#define IMX576_REG_BINNING_MODE                CCI_REG8(0x0900)
> +#define IMX576_REG_BINNING_TYPE                CCI_REG8(0x0901)
> +#define IMX576_REG_BINNING_WEIGHT      CCI_REG8(0x0902)
> +
> +#define IMX576_PIXEL_RATE              813600000
> +#define IMX576_NUM_DATA_LANES          4
> +
> +/* IMX576 native and active pixel array size */
> +static const struct v4l2_rect imx576_native_area =3D {
> +       .top =3D 0,
> +       .left =3D 0,
> +       .width =3D 5792,
> +       .height =3D 4464,
> +};
> +
> +static const struct v4l2_rect imx576_active_area =3D {
> +       .top =3D 136,
> +       .left =3D 16,
> +       .width =3D 5760,
> +       .height =3D 4312,
> +};
> +
> +static const char * const imx576_supply_names[] =3D {
> +       "vana",         /* Analog Power */
> +       "vif",          /* Interface Power */
> +       "vdig",         /* Digital Power */
> +};
> +
> +static const struct cci_reg_sequence imx576_common_regs[] =3D {

[...]

> +       { IMX576_REG_IVT_PXCK_DIV, 0x05 },
> +       { IMX576_REG_IVT_SYCK_DIV, 0x02 },
> +       { IMX576_REG_IVT_PREPLLCK_DIV, 0x04 },
> +       { IMX576_REG_IVT_PLL_MPY, 0x0154 },
> +       { IMX576_REG_IOP_SYCK_DIV, 0x01 },
> +       { IMX576_REG_IOP_PREPLLCK_DIV, 0x04 },
> +       { IMX576_REG_PLL_MULT_DRIV, 0x01 },

I think when Laurent asked to make the PLL configurable for different link
frequencies, he meant deriving these and the OP_PLL_MPY value instead of
hardcoding all of them and only supporting one link freq.

> +       { CCI_REG8(0x0b06), 0x01 },
> +       { CCI_REG8(0x3620), 0x01 },
> +       { CCI_REG8(0x3f0c), 0x00 },
> +};
> +

Thanks,
    Jai
