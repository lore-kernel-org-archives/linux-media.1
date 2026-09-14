Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43A043BDC7
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382408; cv=none; b=JIAHU/mYJTAM/6WJD7J8ScWwCIIS/0z1N0DUYmSvTn8ja5G4dPoG9j7rhz2OPrWC7Ipxjns7DYvxLMn9Ee1+nJ474Kvcp6aLuetL385XolbPzKwZUizWdMVlTgkTwA6J3FYlH01DtQylbeoK/vzCoByO3gPNo9YBwuYqpGyyAAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382408; c=relaxed/simple;
	bh=PTvjgwQ+yN25adXDyjq8mSXqE4+s2G8bIzgTZTvzHqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q77zmsc5GFMPUmGQa5RU7s6bO5IjgQaubKSTXrNk/FfAWo+VKFH9TTJqHjwydpkI/YZxSn8n2KUVSXLibKSthO3S9xiDBKMQZWKowkQ++AJh20LEub1LhmbBPWs2Veuiafx4Aw+s83MRYMDR+ofsAmDiZ2TAucFjmUsu6MBmNwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yu5sTzrk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yu5sTzrk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789382406; x=1820918406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PTvjgwQ+yN25adXDyjq8mSXqE4+s2G8bIzgTZTvzHqE=;
  b=Yu5sTzrkQq24Gx2DlJxTyHqOtMrWBwrTfdvbpkDK9VRNMVXzSnR4XIWT
   vIVxqd55BalkZDeroEPGC8lW79VZ5ld/EemKtG7Ejf+3jLbuBFOSIOQ9s
   Z8igGf6y3I5BvEY6qzGbwx5SHtQCVe1fbwORqiNSih/qGqB9Gw+CnnRdE
   HdZP97VecmDt1koRWuKx609GRXRg+pMvF+Zfnkrqa1CKzAdiZF7yrLI6M
   nXoyno8OVREl7e72bRP3HAPmq3Z+v4E/SskvJbNggoihb+2Mh6vKgWBt2
   bnOXASuXn67gH7m8NbqIsOtdx/nvAuBWJ4GL8a5K9/LrSfLi4ppjeOEFX
   A==;
X-CSE-ConnectionGUID: 4JB+K+UlRiSDMpgBMlGxJQ==
X-CSE-MsgGUID: CPyytmUcQkyywQiQ8VNMHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="107104507"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="107104507"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 03:40:05 -0700
X-CSE-ConnectionGUID: X6Ne53g5RY691ZAWFcE9CA==
X-CSE-MsgGUID: Xjf//VH0SteWwxjhcCzJqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="276127484"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.61])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 03:39:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AF585121BB5;
	Mon, 14 Sep 2026 13:40:04 +0300 (EEST)
Date: Mon, 14 Sep 2026 13:40:04 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v7 14/14] media: v4l2-subdev: Add struct
 v4l2_subdev_client_info pointer to pad ops
Message-ID: <aqfPBN0lX95Xiqeq@kekkonen.localdomain>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
 <20260807122409.45807-15-sakari.ailus@linux.intel.com>
 <20260902132651.GA287496@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902132651.GA287496@killaraus.ideasonboard.com>

Hi Laurent,

On Wed, Sep 02, 2026 at 04:26:51PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Aug 07, 2026 at 03:24:09PM +0300, Sakari Ailus wrote:
> > Add a pointer to const struct v4l2_subdev_client_info to the get_fmt,
> > set_fmt, get_selection and set_selection sub-device pad ops. The client
> > info struct will soon be used to differentiate UAPI based on client
> > capabilities.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> 
> [snip]
> 
> I really dislike that the operations can receive a NULL client info
> pointer. Let's see where that's the case. We have multiple categories of
> users:
> 
> - Drivers that call their own .set_fmt() or .set_selection() operations
>   from .init_state():
> 
>   - drivers/media/i2c/adv7180.c
>   - drivers/media/i2c/gc05a2.c
>   - drivers/media/i2c/gc08a3.c
>   - drivers/media/i2c/imx214.c
>   - drivers/media/i2c/imx219.c
>   - drivers/media/i2c/imx290.c
>   - drivers/media/i2c/imx296.c
>   - drivers/media/i2c/imx334.c
>   - drivers/media/i2c/imx335.c
>   - drivers/media/i2c/imx355.c
>   - drivers/media/i2c/imx412.c
>   - drivers/media/i2c/imx415.c
>   - drivers/media/i2c/imx471.c
>   - drivers/media/i2c/lt6911uxe.c
>   - drivers/media/i2c/og01a1b.c
>   - drivers/media/i2c/og0ve1b.c
>   - drivers/media/i2c/ov02a10.c
>   - drivers/media/i2c/ov2732.c
>   - drivers/media/i2c/ov2735.c
>   - drivers/media/i2c/ov5645.c
>   - drivers/media/i2c/ov6211.c
>   - drivers/media/i2c/ov7251.c
>   - drivers/media/i2c/ov8858.c
>   - drivers/media/i2c/ov9282.c
>   - drivers/media/i2c/s5k3m5.c
>   - drivers/media/i2c/s5kjn1.c
>   - drivers/media/i2c/vd55g1.c
>   - drivers/media/i2c/vd56g3.c
>   - drivers/media/i2c/vgxy61.c
>   - drivers/media/platform/nxp/imx-mipi-csis.c
>   - drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
>   - drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> 
>   Those are internal calls, so the driver knows what to expect. We can
>   live with that for the time being. However, I don't want to see NULL
>   checks appearing in the .set_fmt() and .set_selection() operations for
>   those drivers. This design pattern should be deprecated, and drivers
>   should be refactored to avoid introducing NULL checks. If we agree on
>   paying attention to this during reviews, I have no objection to
>   addressing this issue in the future.

I'm fine with that.

> 
> - Drivers that call their own .set_fmt() or .set_selection() operations
>   from .open():
> 
>   - drivers/media/platform/qcom/camss/camss-csid.c
>   - drivers/media/platform/qcom/camss/camss-csiphy.c
>   - drivers/media/platform/qcom/camss/camss-ispif.c
>   - drivers/media/platform/qcom/camss/camss-tpg.c
>   - drivers/media/platform/qcom/camss/camss-vfe.c
>   - drivers/media/platform/ti/omap3isp/ispccdc.c
>   - drivers/media/platform/ti/omap3isp/ispccp2.c
>   - drivers/media/platform/ti/omap3isp/ispcsi2.c
>   - drivers/media/platform/ti/omap3isp/isppreview.c
>   - drivers/media/platform/ti/omap3isp/ispresizer.c
>   - drivers/media/platform/ti/omap3isp/ispvideo.c
> 
>   Bryan has volunteered (or maybe I should say I have volunteered Bryan)
>   to convert the camss driver to the active state API and use
>   .init_state(). It will then fall in the previous category.
> 
>   The omap3isp driver should be converted as well. Furthermore, it
>   should stop calling internal subdev operations to implement
>   G_SELECTION and S_SELECTION on video nodes. No objection against doing
>   so at a later date.
> 
> - Drivers that call their own .set_fmt() or .set_selection() operations
>   from .probe():
> 
>   - drivers/media/i2c/adv7183.c
> 
>   The proper fix is to convert the driver to use the subdev active
>   state. This can be left for later (likely never, as the driver doesn't
>   receive much attention).
> 
> - Drivers that call their own .set_fmt() or .set_selection() operations
>   at runtime:
> 
>   - drivers/media/platform/renesas/vsp1/vsp1_drm.c
>   - drivers/media/platform/renesas/vsp1/vsp1_entity.c
>   - drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> 
>   This is a special case. The driver calls subdev operations of its
>   internal subdevs to configure the media pipeline on behalf of
>   in-kernel clients. Should there be a need to check the client info in
>   subdevs, an in-kernel client info will be allocated. Using NULL is
>   fine for the time being, it doesn't cross any driver boundary.
> 
> - Drivers that call their own .set_fmt() or .set_selection() operations
>   from an IRQ handler:
> 
>   - drivers/media/i2c/lt6911uxe.c
> 
>   The driver calls the .set_fmt() handler to update the active format
>   when the device reports an input format change. This seems to be an
>   incorrect usage of the V4L2 API, the right fix will be to drop that.
>   It can be done later.

In this case the format is obtained from the upstream HDMI link and there's
no subdevice driver there.

> 
> - Drivers that already pass a NULL (or fake) subdev state to .set_fmt()
>   or .set_selection() and now also pass a NULL client info:
> 
>   - drivers/media/pci/cobalt/cobalt-driver.c
>   - drivers/media/pci/cobalt/cobalt-v4l2.c
>   - drivers/media/pci/cx18/cx18-controls.c
>   - drivers/media/pci/cx18/cx18-ioctl.c
>   - drivers/media/pci/cx23885/cx23885-video.c
>   - drivers/media/pci/ivtv/ivtv-controls.c
>   - drivers/media/pci/ivtv/ivtv-ioctl.c
>   - drivers/media/pci/saa7134/saa7134-empress.c
>   - drivers/media/platform/amd/isp4/isp4_video.c
>   - drivers/media/platform/atmel/atmel-isi.c
>   - drivers/media/platform/intel/pxa_camera.c
>   - drivers/media/platform/marvell/mcam-core.c
>   - drivers/media/platform/renesas/renesas-ceu.c
>   - drivers/media/platform/renesas/sh_vou.c
>   - drivers/media/platform/samsung/exynos4-is/fimc-capture.c
>   - drivers/media/platform/samsung/s3c-camif/camif-core.c
>   - drivers/media/platform/st/stm32/stm32-dcmi.c
>   - drivers/media/platform/ti/am437x/am437x-vpfe.c
>   - drivers/media/platform/ti/vpe/vip.c
>   - drivers/media/platform/via/via-camera.c
>   - drivers/media/usb/cx231xx/cx231xx-417.c
>   - drivers/media/usb/cx231xx/cx231xx-video.c
>   - drivers/media/usb/dvb-usb/cxusb-analog.c
>   - drivers/media/usb/em28xx/em28xx-camera.c
>   - drivers/media/usb/go7007/go7007-v4l2.c
>   - drivers/media/usb/pvrusb2/pvrusb2-hdw.c
>   - drivers/staging/media/tegra-video/vi.c
> 
>   Those drivers are not compatible with modern source (i.e. image
>   sensors, video receivers, ...) subdev drivers that use the active
>   state API. No workaround will be added to source drivers to support
>   the above drivers, they should instead be converted to modern APIs. I
>   have no objection passing a NULL client info.
> 
>   drivers/media/platform/ti/cal/cal-video.c is in a similar category. It
>   calls those operations to implement the legacy video node-centric API,
>   which is getting deprecated. No concern there either.
> 
> - Finally, there's the atomisp driver. Cleaning that up will require
>   time. As it's a staging driver I'm not concerned about adding NULL
>   checks to sensor drivers. If atomisp uses a sensor driver that
>   requires client info, the fix should be on the atomisp side.
> 
> 
> Conclusion: I'm fine with this patch (with two changes pointed out
> separately moved to 10/14) as long as we address the above issues when
> required, without adding NULL checks on the client info in subdev
> drivers.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Regards,

Sakari Ailus
