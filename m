Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A69B3D3D0E
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 07:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643610; cv=none; b=goNTb9gYndgj58AaXlLyKFaweCgPvBF3qiZLqSBx/hfAKcsM0xoNsFPAu/CfwnuPeNXEhwP/b42he53/YjRbpWzHjeOmr/hBtghavFPq5Y4doWnphZrSGjStKUPtCFspgTRx8ElAJQeo/Gys48zaBOFzcRET80ttpzU00jd8Oe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643610; c=relaxed/simple;
	bh=a1YFW4sxbhxwLhWumZ666b5KPB6y3tWXvK6hyeW7sZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LR6Uv3R2OtQISlJYamv3r6VGRkHNc18qoFd8Et7GqPG0GmuVM3Rij3RVW3AT+Gfd3d/Q0bwmJqKIuS4YuPNXyknBNlO3zkI7+INd4YkAuw79naOPKvGkPske6qM/LK11dfU3kicmfBRAaIDtoxOkweFtISckhPxzuwpHX/zB+M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JERKNmFu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JERKNmFu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787643609; x=1819179609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a1YFW4sxbhxwLhWumZ666b5KPB6y3tWXvK6hyeW7sZ8=;
  b=JERKNmFu2PGBRMoHsEKC6hauEwKEJXz8h2dT7Hd4eMdUucpaaZ79j4JR
   0CG2llopzw7CMmsQmALE/s2646SkO0MHUYRgwjOFLmlya9Sspr4Ft9Adg
   nyDkzgayP7g+s26jlI9HIcCERCBrZ9bJuM067ufE5XFScdjAAWdZrHKOL
   rLa+eJcOzdzGoT7QYvIy5i/yTZqd9cV+ojYSUPY1T+8CARVdLzkS9ckc2
   ZS+Rti+yf3JkzFZZwjSaHnrnvfSK1K7p8RHnSRiEJpmz0vOW0T0qVRGIa
   ZT82ZxKl+MTJo3L7lZqvwnvDCyTjivlvD2C0Md59QeHsb+Cwqp/AP4Z1z
   w==;
X-CSE-ConnectionGUID: Z5/6+l6vSZeTE9RGLKgVOg==
X-CSE-MsgGUID: IHLR1qyuT+WGc6iQHRRINw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="105634119"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="105634119"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 00:40:09 -0700
X-CSE-ConnectionGUID: Kazycxp+SD2h1vsa7h5p2g==
X-CSE-MsgGUID: f6zOXY0NQ5GNsJVPl66Pfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="266667954"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.50])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 00:40:06 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BE37B12033D;
	Tue, 25 Aug 2026 10:40:17 +0300 (EEST)
Date: Tue, 25 Aug 2026 10:40:17 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 17/29] media: bcm2835-unicam: Use
 v4l2_subdev_get_frame_desc()
Message-ID: <ao1G4askVEcrEXmp@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-18-sakari.ailus@linux.intel.com>
 <aoyyogifML-mDfYJ@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoyyogifML-mDfYJ@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Aug 24, 2026 at 05:07:46PM -0400, Frank Li wrote:
> On Mon, Aug 24, 2026 at 03:14:39PM +0300, Sakari Ailus wrote:
> > Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> > preferred over calling the get_frame_desc() pad operation directly.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/platform/broadcom/bcm2835-unicam.c  | 22 +++++++++----------
> >  1 file changed, 10 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > index 14bb916dd7b1..2322d3df3915 100644
> > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > @@ -27,6 +27,7 @@
> >   * output interface and V4L2 subdevice driver.
> >   */
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> > @@ -888,7 +889,6 @@ static int unicam_get_image_vc_dt(struct unicam_device *unicam,
> >  				  struct v4l2_subdev_state *state,
> >  				  u8 *vc, u8 *dt)
> >  {
> > -	struct v4l2_mbus_frame_desc fd;
> >  	u32 stream;
> >  	int ret;
> >
> > @@ -898,17 +898,15 @@ static int unicam_get_image_vc_dt(struct unicam_device *unicam,
> >  	if (ret)
> >  		return ret;
> >
> > -	ret = v4l2_subdev_call(unicam->sensor.subdev, pad, get_frame_desc,
> > -			       unicam->sensor.pad->index, &fd);
> > -	if (ret)
> > -		return ret;
> > -
> > -	/* Only CSI-2 supports DTs. */
> > -	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> > -		return -EINVAL;
> > +	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
> > +		v4l2_subdev_get_frame_desc(unicam->sensor.subdev,
> > +					   unicam->sensor.pad->index,
> > +					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
> > +	if (IS_ERR(fd))
> > +		return PTR_ERR(fd);
> >
> > -	for (unsigned int i = 0; i < fd.num_entries; ++i) {
> > -		const struct v4l2_mbus_frame_desc_entry *fde = &fd.entry[i];
> > +	for (unsigned int i = 0; i < fd->num_entries; ++i) {
> > +		const struct v4l2_mbus_frame_desc_entry *fde = &fd->entry[i];
> >
> >  		if (fde->stream == stream) {
> >  			*vc = fde->bus.csi2.vc;
> > @@ -927,7 +925,7 @@ static void unicam_start_rx(struct unicam_device *unicam,
> >  	const struct unicam_format_info *fmtinfo;
> >  	const struct v4l2_mbus_framefmt *fmt;
> >  	unsigned int line_int_freq;
> > -	u8 vc, dt;
> > +	u8 vc = 0, dt = 0;
> 
> not sure why need here,
> 
> if unicam_get_image_vc_dt() return failure, vc will be set to 0
> if unicam_get_image_vc_dt() return success, vc will be expected value.

You're right -- this chunk can be dropped.

-- 
Sakari Ailus
