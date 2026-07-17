Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5003A3264FB;
	Fri, 17 Jul 2026 11:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784288182; cv=none; b=BgN5EHyB44LUKE3Mgjkpcl2MTfVaeSlSI5F9qnnr4JUbuREUYM4C871s8hAF8s43ylvKtGkEZrFlX2DDLScX9lZ6u6lktMfieIiCZV3O1iKJGZ9pQ8OlzRoDD84Ss21yINGVq7/XeVfp/t7iN2omdFJNaCog8wu+NM5Ce2OGhCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784288182; c=relaxed/simple;
	bh=FNePNVppOEoL/+yPS7KDbKsab4bLD3Klrarm7dVKLtU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=YZ0TuDZIft4WaqVDKQ7dv2KIa31Cx1RubH9FkAc4HM/rh0O/ze0zCgEANKsVQ5CXGYvw2aU5mfdW0sbpFTA1daskPSjfkVVItkzHCRU6frA+AMaAMd8wCen5z9DFfKQl+JqWS/pWEuVwdxu4v2dYwftr/xKI+4Q8ZlC8erJKn2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jIubq+AI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jIubq+AI"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C9E58FA;
	Fri, 17 Jul 2026 13:35:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784288122;
	bh=FNePNVppOEoL/+yPS7KDbKsab4bLD3Klrarm7dVKLtU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jIubq+AIpTSpky0jQECYUptn722NA9JfztOP1x+POKGZEiDx2T6fu5TlUaybydsJZ
	 dmPe3ypllTE+Lc/BWk1RQr3K0nM387HfwWy8VwS6cjSN4VJLlwhXktsjh5ybZ1vpT4
	 q1dz/+nkACDgoa7qAy+k6VY1IxxoR38gTB8lCBQo=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260717-b4-vchiq-isp-v3-7-fb8235e15c68@ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com> <20260717-b4-vchiq-isp-v3-7-fb8235e15c68@ideasonboard.com>
Subject: Re: [PATCH v3 7/9] media: platform: broadcom: Move unicam driver to subdir
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Florian Fainelli <florian.fainelli@broadcom.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Fri, 17 Jul 2026 17:06:13 +0530
Message-ID: <178428817339.1426769.9456608230178052105@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Jai Luthra (2026-07-17 16:34:22)
> The BCM283x/BCM2711x SoCs capture camera frames using CSI-2, and
> optionally process the raw frames using a VC4 firmware-based ISP block.
>=20
> As the ISP driver will be added subsequently, move the files related to
> the unicam driver to a separate subdirectory to ease distinction between
> the two drivers' files.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

[...]

> diff --git a/drivers/media/platform/broadcom/Kconfig b/drivers/media/plat=
form/broadcom/Kconfig
> index 93ba565d9a02..cab44885182c 100644
> --- a/drivers/media/platform/broadcom/Kconfig
> +++ b/drivers/media/platform/broadcom/Kconfig
> @@ -1,18 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
> -config VIDEO_BCM2835_UNICAM
> -       tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
> -       depends on ARCH_BCM2835 || COMPILE_TEST
> -       depends on COMMON_CLK && PM
> -       depends on VIDEO_DEV
> -       select MEDIA_CONTROLLER
> -       select V4L2_FWNODE
> -       select VIDEO_V4L2_SUBDEV_API
> -       select VIDEOBUF2_DMA_CONTIG
> -       help
> -         Say Y here to enable support for the BCM283x/BCM271x CSI-2 rece=
iver.
> -         This is a V4L2 driver that controls the CSI-2 receiver directly,
> -         independently from the VC4 firmware.
> +comment "Broadcom BCM283x/BCM271x media platform drivers"
> =20
> -         To compile this driver as a module, choose M here. The module w=
ill be
> -         called bcm2835-unicam.
> +source "drivers/media/platform/broadcom/bcm2835-unicam/Kconfig"
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig b/dri=
vers/media/platform/broadcom/bcm2835-unicam/Kconfig
> new file mode 100644
> index 000000000000..32b76ebfcd9a
> --- /dev/null
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config VIDEO_BCM2835_UNICAM
> +       tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
> +       depends on ARCH_BCM2835 || COMPILE_TEST
> +       depends on COMMON_CLK && PM
> +       depends on VIDEO_DEV
> +       select MEDIA_CONTROLLER
> +       select V4L2_FWNODE
> +       select VIDEO_V4L2_SUBDEV_API
> +       select VIDEOBUF2_DMA_CONTIG
> +       help
> +         Say Y here to enable support for the BCM283x/BCM271x CSI-2 rece=
iver.
> +         This is a V4L2 driver that controls the CSI-2 receiver directly,
> +         independently from the VC4 firmware.
> +
> +         This driver is mutually exclusive with the use of bcm2835-camer=
a. The
> +         firmware will disable all access to the peripheral from within =
the
> +         firmware if it finds a DT node using it, and bcm2835-camera will
> +         therefore fail to probe.
> +

Oops the above paragraph is no longer there in the old location, I must
have missed dropping it during the rebase.

> +         To compile this driver as a module, choose M here. The module w=
ill be
> +         called bcm2835-unicam.

--
Jai
