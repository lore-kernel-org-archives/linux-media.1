Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D41D184
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 00:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783988267; cv=none; b=pb5D4CekjItrzwYv3lhNo73Uff7JwVwgZrMZpUAJN2ml/CNe4r8ny13/GMakeEvkiEr5jcigVHZjef2N8vXqW5MrMXTMrEZ9d/rSTaPgwJUkGPx8WSr/q6bwyXZij2skZ+jeNl9uN94NN6lLUwj1Sy0co7QIO3jA7peCI1Jupz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783988267; c=relaxed/simple;
	bh=XAlGeUdZ25SqZx3pcRzKzyL2pTl8yfbUSjgStgfztIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjAXrQWpWFpSv5ITkQQIVtP16l66jBBxPgyMeBvcHJ4uj0d9V1EHo9FeXoAiA8YHjiOT95MGXmcjo1P6iBbHUOTJsOX/Kuc9GMq8lC4dEWA/I0+PHO5P8WPEXFYFqtMAwPVy4BcJr1avM8CJfe85DG1Nvt0PMpI4OcwPJzYW2SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jpkzku14; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jpkzku14"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02D6F1049;
	Tue, 14 Jul 2026 02:16:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783988209;
	bh=XAlGeUdZ25SqZx3pcRzKzyL2pTl8yfbUSjgStgfztIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jpkzku14kNNHIscQNixqEe07wU7kIfyQq+zRHXKlg3MmGIKSChgRwguFLbbBedM9o
	 yxSoHzukq1hXLacWlBO9NE85R+q7HShx5ys1qaqJzoLISMKOXUJImVkalw2GvBw8TY
	 jWWPJILtC9TSI9CbtSFnYNFsSieA7AIvANGGjUdU=
Date: Tue, 14 Jul 2026 03:17:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 6/8] media: platform: broadcom: Move unicam driver to
 subdir
Message-ID: <20260714001741.GA1573511@killaraus.ideasonboard.com>
References: <20260210-b4-vchiq-isp-v2-0-4403944152fe@ideasonboard.com>
 <20260210-b4-vchiq-isp-v2-6-4403944152fe@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260210-b4-vchiq-isp-v2-6-4403944152fe@ideasonboard.com>

On Tue, Feb 10, 2026 at 01:51:23PM +0530, Jai Luthra wrote:
> The BCM283x/BCM2711x SoCs capture camera frames using CSI-2, and
> optionally processes the raw frames using a VC4 firmware based ISP

s/processes/process/
s/firmware based/firmware-based/

> block.
> 
> As the driver for the ISP will be added subsequently, to ease
> distinction between the two drivers' files, move the files related to
> the unicam driver to a separate subdirectory.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  MAINTAINERS                                        |  2 +-
>  drivers/media/platform/broadcom/Kconfig            | 22 ++-------------------
>  drivers/media/platform/broadcom/Makefile           |  2 +-
>  .../media/platform/broadcom/bcm2835-unicam/Kconfig | 23 ++++++++++++++++++++++
>  .../platform/broadcom/bcm2835-unicam/Makefile      |  3 +++
>  .../{ => bcm2835-unicam}/bcm2835-unicam-regs.h     |  0
>  .../broadcom/{ => bcm2835-unicam}/bcm2835-unicam.c |  0
>  7 files changed, 30 insertions(+), 22 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 34f779679f1d0eff4cfbdc2533db153fb5f8fe2e..e9e8e735ecb2057581345fb7faad6608849fc3bf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4956,7 +4956,7 @@ M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> -F:	drivers/media/platform/broadcom/bcm2835-unicam*
> +F:	drivers/media/platform/broadcom/bcm2835-unicam/*
>  
>  BROADCOM BCM47XX MIPS ARCHITECTURE
>  M:	Hauke Mehrtens <hauke@hauke-m.de>
> diff --git a/drivers/media/platform/broadcom/Kconfig b/drivers/media/platform/broadcom/Kconfig
> index 32b76ebfcd9a194e285381fc4f1d0fbac7d62b4d..cab44885182ce658fa136e31485913b1f0547968 100644
> --- a/drivers/media/platform/broadcom/Kconfig
> +++ b/drivers/media/platform/broadcom/Kconfig
> @@ -1,23 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -config VIDEO_BCM2835_UNICAM
> -	tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
> -	depends on ARCH_BCM2835 || COMPILE_TEST
> -	depends on COMMON_CLK && PM
> -	depends on VIDEO_DEV
> -	select MEDIA_CONTROLLER
> -	select V4L2_FWNODE
> -	select VIDEO_V4L2_SUBDEV_API
> -	select VIDEOBUF2_DMA_CONTIG
> -	help
> -	  Say Y here to enable support for the BCM283x/BCM271x CSI-2 receiver.
> -	  This is a V4L2 driver that controls the CSI-2 receiver directly,
> -	  independently from the VC4 firmware.
> +comment "Broadcom BCM283x/BCM271x media platform drivers"
>  
> -	  This driver is mutually exclusive with the use of bcm2835-camera. The
> -	  firmware will disable all access to the peripheral from within the
> -	  firmware if it finds a DT node using it, and bcm2835-camera will
> -	  therefore fail to probe.
> -
> -	  To compile this driver as a module, choose M here. The module will be
> -	  called bcm2835-unicam.
> +source "drivers/media/platform/broadcom/bcm2835-unicam/Kconfig"
> diff --git a/drivers/media/platform/broadcom/Makefile b/drivers/media/platform/broadcom/Makefile
> index 03d2045aba2e4dd8989ca35a23e1be4ea1811787..33a89bdb0029bc67d90d16bc0910a681b7675ad7 100644
> --- a/drivers/media/platform/broadcom/Makefile
> +++ b/drivers/media/platform/broadcom/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -obj-$(CONFIG_VIDEO_BCM2835_UNICAM) += bcm2835-unicam.o
> +obj-y += bcm2835-unicam/
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig b/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..32b76ebfcd9a194e285381fc4f1d0fbac7d62b4d
> --- /dev/null
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config VIDEO_BCM2835_UNICAM
> +	tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
> +	depends on ARCH_BCM2835 || COMPILE_TEST
> +	depends on COMMON_CLK && PM
> +	depends on VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	select VIDEOBUF2_DMA_CONTIG
> +	help
> +	  Say Y here to enable support for the BCM283x/BCM271x CSI-2 receiver.
> +	  This is a V4L2 driver that controls the CSI-2 receiver directly,
> +	  independently from the VC4 firmware.
> +
> +	  This driver is mutually exclusive with the use of bcm2835-camera. The
> +	  firmware will disable all access to the peripheral from within the
> +	  firmware if it finds a DT node using it, and bcm2835-camera will
> +	  therefore fail to probe.
> +
> +	  To compile this driver as a module, choose M here. The module will be
> +	  called bcm2835-unicam.
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam/Makefile b/drivers/media/platform/broadcom/bcm2835-unicam/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..03d2045aba2e4dd8989ca35a23e1be4ea1811787
> --- /dev/null
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_VIDEO_BCM2835_UNICAM) += bcm2835-unicam.o
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam-regs.h b/drivers/media/platform/broadcom/bcm2835-unicam/bcm2835-unicam-regs.h
> similarity index 100%
> rename from drivers/media/platform/broadcom/bcm2835-unicam-regs.h
> rename to drivers/media/platform/broadcom/bcm2835-unicam/bcm2835-unicam-regs.h
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam/bcm2835-unicam.c
> similarity index 100%
> rename from drivers/media/platform/broadcom/bcm2835-unicam.c
> rename to drivers/media/platform/broadcom/bcm2835-unicam/bcm2835-unicam.c

-- 
Regards,

Laurent Pinchart
