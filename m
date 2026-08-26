Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1645C364042;
	Wed, 26 Aug 2026 06:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787725985; cv=none; b=tmK7eVR4qzjJ4uC8hcWQm+cIdASzrjNkgpkQM+CVx6zAjkOu2wVXuBX2XaUwq4S+UvaLtD0xam5nuqpZpSiSMcK7E9oXFvRvmz2KzRgTYBYIHbjdljZwx8GA/FCkJPxK7kPjrS2Y3e877JS2Cxn/lzo6Ag5KR44poho1IObSy/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787725985; c=relaxed/simple;
	bh=0BtAWSZwhotS8PXB85lFALooA6E24pBG8DUkMZPTgWM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=f3KwfAY6IkUAtfxHjxabSK0I0Ft1iOSyyYNOI8FfKioGXIyqXqlj09nlicC64Xho9m+5vLjJgJhWC2JGzWZyNRWRkp651kn4xqAIFYYnYzJ86PDCDQzQkGLMPJaPHlemojYJRm+W9ZZd30EcRDNrJ9g7jR+ObQd2YuGeK+d2qRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZVQxmjZ2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZVQxmjZ2"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:56b2:8fe2:337f:8c01:dede])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1491819C;
	Wed, 26 Aug 2026 08:31:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787725894;
	bh=0BtAWSZwhotS8PXB85lFALooA6E24pBG8DUkMZPTgWM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZVQxmjZ2iPBL++fc0JysDiLc0I/Kft4au3FyxIMNhD3X7sCdlbzUTQsx+5mNdyYz4
	 /UdjjdMDYVOw6MbdJu0o6z2RhwhBA/QPuvXUX0dnRCxfTYvt0d0Ra4BhY/J+tabq9C
	 XqPMDAD69pUnp1mxFft23s0d/l8h/+MkZ4G1tWW4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260819125647.68910-3-himanshu.bhavani@siliconsignals.io>
References: <20260819125647.68910-1-himanshu.bhavani@siliconsignals.io> <20260819125647.68910-3-himanshu.bhavani@siliconsignals.io>
Subject: Re: [PATCH v4 2/2] media: i2c: add imx576 image sensor driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: tarang.raval@siliconsignals.io, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kate Hsuan <hpa@redhat.com>, Walter Werner Schneider <contact@schnwalter.eu>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Svyatoslav Ryhel <clamor95@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, sakari.ailus@linux.intel.com
Date: Wed, 26 Aug 2026 12:02:55 +0530
Message-ID: <178772597500.9142.2498807519600395462@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Himanshu,

Thanks for the patch, and converting to CCS registers and helpers.

I only have a few minor comments.

Quoting Himanshu Bhavani (2026-08-19 18:26:40)
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
> ---
>  MAINTAINERS                |    1 +
>  drivers/media/i2c/Kconfig  |   10 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/imx576.c | 1103 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 1115 insertions(+)
>  create mode 100644 drivers/media/i2c/imx576.c
>=20
> diff --git a/drivers/media/i2c/imx576.c b/drivers/media/i2c/imx576.c
> new file mode 100644
> index 000000000000..8115d0c16cc3
> --- /dev/null
> +++ b/drivers/media/i2c/imx576.c

[...]

> +
> +#define IMX576_LINE_LENGTH             6144
> +#define IMX576_VBLANK_DEF              4387
> +
> +/* FIXME: Exact VBLANK limit unknown (no datasheet). */
> +#define IMX576_VBLANK_MAX              32420

You could try reading the CCS.MAX_FRAME_LENGTH_LINES register (0x1142), in
IMX708 that had a value of 0xffff, which did work during my testing.

[...]

> +       { CCI_REG8(0x0401), 0x00 },

This might be writing to the CCS.SCALING_MODE (0x400) register's lower
byte, so you could use the macro here (unless the higher byte is programmed
to something else?)


[...]

> +static int imx576_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct imx576 *imx576 =3D container_of_const(ctrl->handler,
> +                                                  struct imx576, handler=
);
> +       struct v4l2_subdev_state *state;
> +       struct v4l2_mbus_framefmt *fmt;
> +       int ret =3D 0;
> +
> +       state =3D v4l2_subdev_get_locked_active_state(&imx576->sd);
> +       fmt =3D v4l2_subdev_state_get_format(state, 0);
> +
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +               /* Honour the VBLANK limits when setting exposure */
> +               ret =3D __v4l2_ctrl_modify_range(imx576->exposure,
> +                                              IMX576_EXPOSURE_MIN,
> +                                              fmt->height + ctrl->val -
> +                                              IMX576_EXPOSURE_OFFSET,
> +                                              IMX576_EXPOSURE_STEP,
> +                                              IMX576_EXPOSURE_DEFAULT);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       if (pm_runtime_get_if_active(imx576->dev) =3D=3D 0)
> +               return 0;
> +
> +       cci_write(imx576->regmap, CCS_R_GROUPED_PARAMETER_HOLD, 1, &ret);
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_VBLANK: {
> +               u64 vmax =3D fmt->height + ctrl->val;
> +
> +               cci_write(imx576->regmap, CCS_R_FRAME_LENGTH_LINES, vmax,=
 &ret);
> +               break;
> +       }
> +       case V4L2_CID_EXPOSURE:
> +               cci_write(imx576->regmap, CCS_R_COARSE_INTEGRATION_TIME, =
ctrl->val, &ret);

Does exposure register need an update in cases where VBLANK was modified in
a way that old value goes out of bounds?

[...]

Thanks,
    Jai
