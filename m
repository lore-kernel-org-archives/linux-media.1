Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FCC279DAD;
	Thu, 18 Jun 2026 13:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788547; cv=none; b=QiYtJtcJnzW7ZlyExgnfx4oBo+DhIPIYHfSktRYbVzU9RXTpfFDB0RrFz105viwqGXuBex0K4rCmBFtIX3ufCAJScFo294ifi9WGB7ryA0VDuIQlvnwFrCjs1DCrTVy2pjshZFsyj7h5X8B6NvprTD2tLsG0C2Gr8HLEUtVuJBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788547; c=relaxed/simple;
	bh=Ydi58P8/U8S3GJjOKAuYVOWaXjapA8VKxCLrKSzkh0c=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=U1MK0w0uQThWhNWJZeKisYokrtIQ5IzMfK8H8sDbE7ivI5rjGlPdI1vHUVXw1GPQ8DG1GLyjPDqF2hVfSCgC6YvBkJrf6qK+eXpuElppcGO00Ej62R5jwMpCVb4UTLJFP3Sr/fT8+TyrubI0Yo/tsAU/f8xiVS0VdhvGfbOvOw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ofW0a2z0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ofW0a2z0"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5960B1121;
	Thu, 18 Jun 2026 15:15:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781788508;
	bh=Ydi58P8/U8S3GJjOKAuYVOWaXjapA8VKxCLrKSzkh0c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ofW0a2z0gy6iVtljTBiUzBkCTIxOvowaQred+WXWixdwZMrMj3Seli8cG3TnhchaI
	 9EyeyKzg2IhXwWRlZhxvecZC+rBqqaX3u0mWkkuy6yCjniF7MI72ZE4gZA9UZR94CE
	 HswNNWdqNqJ/pZRCQJFOKmcSAJ3nDWz4nY9+ECyM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <226a55a6-babd-47ce-b261-35b982d5c7db@oss.qualcomm.com>
References: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com> <20260618-og0va1b-v1-2-dda71bb83009@oss.qualcomm.com> <1a57863c-831a-411c-a0ae-da3d4f1fd6a0@linaro.org> <226a55a6-babd-47ce-b261-35b982d5c7db@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] media: i2c: og0va1b: Add OmniVision OG0VA1B camera sensor
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:15:40 +0100
Message-ID: <178178854034.861173.9780571180496261859@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Wenmeng Liu (2026-06-18 13:36:27)
>=20
>=20
> On 6/18/2026 6:50 PM, Vladimir Zapolskiy wrote:
> > Hello Wenmeng.
> >=20
> > On 6/18/26 13:37, Wenmeng Liu wrote:
> >> Add V4L2 sub device driver for OmniVision OG0VA1B image sensor.
> >> OmniVision OG0VA1B is an image sensor, which produces frames in 10-bit
> >> raw output format (Y10) over a 1-lane MIPI CSI-2 interface and supports
> >> the 640x480 (VGA) resolution.
> >>
> >> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> >> ---
> >> =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> >> =C2=A0 drivers/media/i2c/Kconfig=C2=A0=C2=A0 |=C2=A0 10 +
> >> =C2=A0 drivers/media/i2c/Makefile=C2=A0 |=C2=A0=C2=A0 1 +
> >> =C2=A0 drivers/media/i2c/og0va1b.c | 867 +++++++++++++++++++++++++++++=
+++++=20
> >> ++++++++++
> >> =C2=A0 4 files changed, 879 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index=20
> >> 5aa846c8479b20651291d5bd2e316308310f826c..85a06eb9eacc410a565b80d56979=
eaa565515d0e 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -19891,6 +19891,7 @@ M:=C2=A0=C2=A0=C2=A0 Wenmeng Liu <wenmeng.liu@=
oss.qualcomm.com>
> >> =C2=A0 L:=C2=A0=C2=A0=C2=A0 linux-media@vger.kernel.org
> >> =C2=A0 S:=C2=A0=C2=A0=C2=A0 Maintained
> >> =C2=A0 F:=C2=A0=C2=A0=C2=A0 Documentation/devicetree/bindings/media/i2=
c/ovti,og0va1b.yaml
> >> +F:=C2=A0=C2=A0=C2=A0 drivers/media/i2c/og0va1b.c
> >> =C2=A0 OMNIVISION OG0VE1B SENSOR DRIVER
> >> =C2=A0 M:=C2=A0=C2=A0=C2=A0 Vladimir Zapolskiy <vladimir.zapolskiy@lin=
aro.org>
> >> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> >> index=20
> >> 5d173e0ecf424f2f204f8d426be818e44357f8e4..56680772f5f47b4629c4e17f5a5f=
eba08b1d94fc 100644
> >> --- a/drivers/media/i2c/Kconfig
> >> +++ b/drivers/media/i2c/Kconfig
> >> @@ -363,6 +363,16 @@ config VIDEO_OG01A1B
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 To compile this driver as a=
 module, choose M here: the
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 module will be called og01a=
1b.
> >> +config VIDEO_OG0VA1B
> >> +=C2=A0=C2=A0=C2=A0 tristate "OmniVision OG0VA1B sensor support"
> >> +=C2=A0=C2=A0=C2=A0 select V4L2_CCI_I2C
> >> +=C2=A0=C2=A0=C2=A0 help
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This is a Video4Linux2 sensor driver f=
or the OmniVision
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OG0VA1B camera.
> >> +
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 To compile this driver as a module, ch=
oose M here: the
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 module will be called og0va1b.
> >> +
> >> =C2=A0 config VIDEO_OG0VE1B
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "OmniVision OG0VE1B sensor sup=
port"
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select V4L2_CCI_I2C
> >> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> >> index=20
> >> e45359efe0e41e13e3c0869e5ead7d6cf4aca3a7..c60851c7fe07e3bdc511c5f48252=
5ba7a044f48e 100644
> >> --- a/drivers/media/i2c/Makefile
> >> +++ b/drivers/media/i2c/Makefile
> >> @@ -83,6 +83,7 @@ obj-$(CONFIG_VIDEO_MT9V011) +=3D mt9v011.o
> >> =C2=A0 obj-$(CONFIG_VIDEO_MT9V032) +=3D mt9v032.o
> >> =C2=A0 obj-$(CONFIG_VIDEO_MT9V111) +=3D mt9v111.o
> >> =C2=A0 obj-$(CONFIG_VIDEO_OG01A1B) +=3D og01a1b.o
> >> +obj-$(CONFIG_VIDEO_OG0VA1B) +=3D og0va1b.o
> >> =C2=A0 obj-$(CONFIG_VIDEO_OG0VE1B) +=3D og0ve1b.o
> >> =C2=A0 obj-$(CONFIG_VIDEO_OS05B10) +=3D os05b10.o
> >> =C2=A0 obj-$(CONFIG_VIDEO_OV01A10) +=3D ov01a10.o
> >> diff --git a/drivers/media/i2c/og0va1b.c b/drivers/media/i2c/og0va1b.c
> >> new file mode 100644
> >> index=20
> >> 0000000000000000000000000000000000000000..f0505b7ba7f329ad57ffafa8f90a=
24204f002d3c
> >> --- /dev/null
> >> +++ b/drivers/media/i2c/og0va1b.c
> >> @@ -0,0 +1,867 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * OmniVision OG0VA1B Camera Sensor Driver
> >> + *
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries
> >> + */
> >> +
> >> +#include <linux/clk.h>
> >> +#include <linux/delay.h>
> >> +#include <linux/gpio/consumer.h>
> >> +#include <linux/i2c.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/pm_runtime.h>
> >> +#include <linux/regulator/consumer.h>
> >> +
> >> +#include <media/v4l2-cci.h>
> >> +#include <media/v4l2-ctrls.h>
> >> +#include <media/v4l2-device.h>
> >> +#include <media/v4l2-fwnode.h>
> >> +#include <media/v4l2-subdev.h>
> >> +
> >> +#define OG0VA1B_REG_CHIP_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 CCI_REG16(0x300a)
> >> +#define OG0VA1B_CHIP_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0xC756
> >=20
> > This is the same chip id as of the OG0VE1B sensor device.
> >=20
> > What's the difference between these two sensors, and do you find it=20
> > possible
> > to add support of OG0VA1B sensor/modes into OG0VE1B sensor driver? Or is
> > it just the same device?
> >=20
> > Hardware specifics described in dt changes also does not show a differe=
nce
> > in comparison to ovti,og0ve1b.yaml.
> >=20
>=20
>=20
> Hi Vladimir,
>=20
>=20
> Both OG0VE1B and OG0VA1B belong to the same OmniVision VGA monochrome=20
> sensor family. They share the same resolution, power rails, reset GPIO=20
> behavior and power management framework.
>=20
> But they are different:
> OG0VE1B:  8-bit RAW, lower FPS
> OG0VA1B: 10-bit RAW, higher FPS
> and some registers are not same.

Can you identify which registers are not the same?

Mapping between 8bit and 10 bit or different frame rates could easily be
managed in a single driver with exposing different capabilities based on
the variant.

We should really work towards reducing the huge duplication that is
happening with copy/paste sensor drivers.

--
Regards

Kieran


>=20
>=20
> The DT bindings can be reused, but would it be more appropriate for the=20
> driver to remain independent?
>=20
>=20
> Thanks,
> Wenmeng
>=20
>=20
>
