Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90684468C33
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387360; cv=none; b=JwQLr22XOjWNqQ502Z/A1zbj6ZLdVw5bJAZXbhTcqKtvvzJ+aGYmzs3zoQyheaalhhPT8bu/bxbOpI1ed1XSE1ARvnWYahWgyNHfkYswQP1rbv+qg2sz7mimdHE9A2XQO+IYJcuNqwhds1VtVjWqkFtL2qCfoAuqCg63HaYHyrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387360; c=relaxed/simple;
	bh=OBJTVG3KaCYx5dqRlUlnH4YuIlNE1i7sXS2XyIwUEY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfZgRwJvvcj2IklGU8Jl8IDYPmRPGRGU8Aym8l/lhjnlFbCAAk7Hc5sAkMgRdtAWzvsU50iND4I+467Z4f1UWzjIt2ru54SRE7N6V9h27Qx+dpoarZ3R8B1uZOD877MHpARN/WXGTUiJBuV4zsCxzDY0n6q4kunGtkYtABrI3J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y6rRHsRo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y6rRHsRo"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38EA2929;
	Mon, 14 Sep 2026 14:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789387244;
	bh=OBJTVG3KaCYx5dqRlUlnH4YuIlNE1i7sXS2XyIwUEY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6rRHsRoZ6JnMF6IP0OXA810q64Yo6yZJ9Uy61tOl679ffXMRG8E3cewEQYmmNy3g
	 kTModTCcpyA6FtJ1q7rKQ4ZWgMwN3pB0B3z4y62CnP6lQP7Yn67oSCewOBviEIT3E+
	 g/i135rA0yTR0hT9Jj18XC5D3I4zCVxTmwITzfXA=
Date: Mon, 14 Sep 2026 15:02:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
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
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
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
Message-ID: <20260914120222.GC2522202@killaraus.ideasonboard.com>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
 <20260807122409.45807-15-sakari.ailus@linux.intel.com>
 <20260902132651.GA287496@killaraus.ideasonboard.com>
 <aqfPBN0lX95Xiqeq@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aqfPBN0lX95Xiqeq@kekkonen.localdomain>

On Mon, Sep 14, 2026 at 01:40:04PM +0300, Sakari Ailus wrote:
> On Wed, Sep 02, 2026 at 04:26:51PM +0300, Laurent Pinchart wrote:
> > On Fri, Aug 07, 2026 at 03:24:09PM +0300, Sakari Ailus wrote:
> > > Add a pointer to const struct v4l2_subdev_client_info to the get_fmt,
> > > set_fmt, get_selection and set_selection sub-device pad ops. The client
> > > info struct will soon be used to differentiate UAPI based on client
> > > capabilities.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > 
> > [snip]
> > 
> > I really dislike that the operations can receive a NULL client info
> > pointer. Let's see where that's the case. We have multiple categories of
> > users:
> > 
> > - Drivers that call their own .set_fmt() or .set_selection() operations
> >   from .init_state():
> > 
> >   - drivers/media/i2c/adv7180.c
> >   - drivers/media/i2c/gc05a2.c
> >   - drivers/media/i2c/gc08a3.c
> >   - drivers/media/i2c/imx214.c
> >   - drivers/media/i2c/imx219.c
> >   - drivers/media/i2c/imx290.c
> >   - drivers/media/i2c/imx296.c
> >   - drivers/media/i2c/imx334.c
> >   - drivers/media/i2c/imx335.c
> >   - drivers/media/i2c/imx355.c
> >   - drivers/media/i2c/imx412.c
> >   - drivers/media/i2c/imx415.c
> >   - drivers/media/i2c/imx471.c
> >   - drivers/media/i2c/lt6911uxe.c
> >   - drivers/media/i2c/og01a1b.c
> >   - drivers/media/i2c/og0ve1b.c
> >   - drivers/media/i2c/ov02a10.c
> >   - drivers/media/i2c/ov2732.c
> >   - drivers/media/i2c/ov2735.c
> >   - drivers/media/i2c/ov5645.c
> >   - drivers/media/i2c/ov6211.c
> >   - drivers/media/i2c/ov7251.c
> >   - drivers/media/i2c/ov8858.c
> >   - drivers/media/i2c/ov9282.c
> >   - drivers/media/i2c/s5k3m5.c
> >   - drivers/media/i2c/s5kjn1.c
> >   - drivers/media/i2c/vd55g1.c
> >   - drivers/media/i2c/vd56g3.c
> >   - drivers/media/i2c/vgxy61.c
> >   - drivers/media/platform/nxp/imx-mipi-csis.c
> >   - drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> >   - drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > 
> >   Those are internal calls, so the driver knows what to expect. We can
> >   live with that for the time being. However, I don't want to see NULL
> >   checks appearing in the .set_fmt() and .set_selection() operations for
> >   those drivers. This design pattern should be deprecated, and drivers
> >   should be refactored to avoid introducing NULL checks. If we agree on
> >   paying attention to this during reviews, I have no objection to
> >   addressing this issue in the future.
> 
> I'm fine with that.
> 
> > 
> > - Drivers that call their own .set_fmt() or .set_selection() operations
> >   from .open():
> > 
> >   - drivers/media/platform/qcom/camss/camss-csid.c
> >   - drivers/media/platform/qcom/camss/camss-csiphy.c
> >   - drivers/media/platform/qcom/camss/camss-ispif.c
> >   - drivers/media/platform/qcom/camss/camss-tpg.c
> >   - drivers/media/platform/qcom/camss/camss-vfe.c
> >   - drivers/media/platform/ti/omap3isp/ispccdc.c
> >   - drivers/media/platform/ti/omap3isp/ispccp2.c
> >   - drivers/media/platform/ti/omap3isp/ispcsi2.c
> >   - drivers/media/platform/ti/omap3isp/isppreview.c
> >   - drivers/media/platform/ti/omap3isp/ispresizer.c
> >   - drivers/media/platform/ti/omap3isp/ispvideo.c
> > 
> >   Bryan has volunteered (or maybe I should say I have volunteered Bryan)
> >   to convert the camss driver to the active state API and use
> >   .init_state(). It will then fall in the previous category.
> > 
> >   The omap3isp driver should be converted as well. Furthermore, it
> >   should stop calling internal subdev operations to implement
> >   G_SELECTION and S_SELECTION on video nodes. No objection against doing
> >   so at a later date.
> > 
> > - Drivers that call their own .set_fmt() or .set_selection() operations
> >   from .probe():
> > 
> >   - drivers/media/i2c/adv7183.c
> > 
> >   The proper fix is to convert the driver to use the subdev active
> >   state. This can be left for later (likely never, as the driver doesn't
> >   receive much attention).
> > 
> > - Drivers that call their own .set_fmt() or .set_selection() operations
> >   at runtime:
> > 
> >   - drivers/media/platform/renesas/vsp1/vsp1_drm.c
> >   - drivers/media/platform/renesas/vsp1/vsp1_entity.c
> >   - drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> > 
> >   This is a special case. The driver calls subdev operations of its
> >   internal subdevs to configure the media pipeline on behalf of
> >   in-kernel clients. Should there be a need to check the client info in
> >   subdevs, an in-kernel client info will be allocated. Using NULL is
> >   fine for the time being, it doesn't cross any driver boundary.
> > 
> > - Drivers that call their own .set_fmt() or .set_selection() operations
> >   from an IRQ handler:
> > 
> >   - drivers/media/i2c/lt6911uxe.c
> > 
> >   The driver calls the .set_fmt() handler to update the active format
> >   when the device reports an input format change. This seems to be an
> >   incorrect usage of the V4L2 API, the right fix will be to drop that.
> >   It can be done later.
> 
> In this case the format is obtained from the upstream HDMI link and there's
> no subdevice driver there.

As far as I understand, the driver is responsible for notifying
userspace that a format change occurred, but is not supposed to modify
the pad format automatically.

> > 
> > - Drivers that already pass a NULL (or fake) subdev state to .set_fmt()
> >   or .set_selection() and now also pass a NULL client info:
> > 
> >   - drivers/media/pci/cobalt/cobalt-driver.c
> >   - drivers/media/pci/cobalt/cobalt-v4l2.c
> >   - drivers/media/pci/cx18/cx18-controls.c
> >   - drivers/media/pci/cx18/cx18-ioctl.c
> >   - drivers/media/pci/cx23885/cx23885-video.c
> >   - drivers/media/pci/ivtv/ivtv-controls.c
> >   - drivers/media/pci/ivtv/ivtv-ioctl.c
> >   - drivers/media/pci/saa7134/saa7134-empress.c
> >   - drivers/media/platform/amd/isp4/isp4_video.c
> >   - drivers/media/platform/atmel/atmel-isi.c
> >   - drivers/media/platform/intel/pxa_camera.c
> >   - drivers/media/platform/marvell/mcam-core.c
> >   - drivers/media/platform/renesas/renesas-ceu.c
> >   - drivers/media/platform/renesas/sh_vou.c
> >   - drivers/media/platform/samsung/exynos4-is/fimc-capture.c
> >   - drivers/media/platform/samsung/s3c-camif/camif-core.c
> >   - drivers/media/platform/st/stm32/stm32-dcmi.c
> >   - drivers/media/platform/ti/am437x/am437x-vpfe.c
> >   - drivers/media/platform/ti/vpe/vip.c
> >   - drivers/media/platform/via/via-camera.c
> >   - drivers/media/usb/cx231xx/cx231xx-417.c
> >   - drivers/media/usb/cx231xx/cx231xx-video.c
> >   - drivers/media/usb/dvb-usb/cxusb-analog.c
> >   - drivers/media/usb/em28xx/em28xx-camera.c
> >   - drivers/media/usb/go7007/go7007-v4l2.c
> >   - drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> >   - drivers/staging/media/tegra-video/vi.c
> > 
> >   Those drivers are not compatible with modern source (i.e. image
> >   sensors, video receivers, ...) subdev drivers that use the active
> >   state API. No workaround will be added to source drivers to support
> >   the above drivers, they should instead be converted to modern APIs. I
> >   have no objection passing a NULL client info.
> > 
> >   drivers/media/platform/ti/cal/cal-video.c is in a similar category. It
> >   calls those operations to implement the legacy video node-centric API,
> >   which is getting deprecated. No concern there either.
> > 
> > - Finally, there's the atomisp driver. Cleaning that up will require
> >   time. As it's a staging driver I'm not concerned about adding NULL
> >   checks to sensor drivers. If atomisp uses a sensor driver that
> >   requires client info, the fix should be on the atomisp side.
> > 
> > 
> > Conclusion: I'm fine with this patch (with two changes pointed out
> > separately moved to 10/14) as long as we address the above issues when
> > required, without adding NULL checks on the client info in subdev
> > drivers.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!

-- 
Regards,

Laurent Pinchart
