Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DD41A9B58
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 21:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784494842; cv=none; b=e6J7z5pGMY/wpcQla5ECrKOiS+PsghjrazdEoeFa/w7lDjca/4s76p3qONal3nlECLoA9Tp7XaltD3euboXsg4owHcMZlGfTWhjxlEBRmmDPr7TM3K+Iz65bVs3Y6xd1ZO0ocqx9bZm32QLBC97rwq/5HHBsz6idAVAJjymfU8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784494842; c=relaxed/simple;
	bh=ICPPZxuxVXcTTpK0xYdFOj0tO4ouKm1QcDecOEi6POA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSiXLNZdALXc0WeYKGrVzaPhekZh2wuTaHgxTcWtgQphLjLrkLsUh8BUcNwK2eMjqZMjHc6w0rDbJ+4zsgZQgY5itCGl4zsmLzaFyfE8yV3OG5X5kxjKStv/rwJ2qh0pVblUAvKVGCfBadr/vXJPu50eQX55ZsswKDzGdsoqPSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7kPZIvs; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7kPZIvs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784494840; x=1816030840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ICPPZxuxVXcTTpK0xYdFOj0tO4ouKm1QcDecOEi6POA=;
  b=W7kPZIvs7OS5tOdfo0qhMhid0kQUhFahX9m6q9/nrRtsV2N1KU7k0aPu
   FZntqom/g6wNh8PK0eOEvA4P1Viua6AfG61B3/ETZEB1Fhd5FdCV6Lly2
   NtnV2kARrRNoz2gqYQN2ybXRuG9U5G1Mig8eabDlasK9Jm+T4IvBwBhCe
   c6kjyHxr0vhoZh/9TBHljgbnJYm+W2jSjl3WXaSq2sWLK1bjY3V91Gh6T
   nxj7+hy83XDX9A+F8sA2iIAbg6hv6YvuRrpD6Hk2oAQ98xWtQyDVp8KSG
   fQe4Ilzd0f6kJ7PaSJzq3fKg1s4mwcZENzzrVs0Il/CA3ZlPSQ9So7Nwv
   g==;
X-CSE-ConnectionGUID: ZmrPPAnkTvaD88QY0maa6A==
X-CSE-MsgGUID: GsdL/v3oSJ6+T5EvIVUqlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="107870882"
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="107870882"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 14:00:39 -0700
X-CSE-ConnectionGUID: Hsp+hGY4T/+KpV2HtXAcwQ==
X-CSE-MsgGUID: H6XrdYcqRkasTiepXjRp7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="256116033"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 14:00:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3E03F121C0D;
	Mon, 20 Jul 2026 00:00:35 +0300 (EEST)
Date: Mon, 20 Jul 2026 00:00:35 +0300
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
Subject: Re: [PATCH v6 03/16] media: imx219: Account for rate_factor in
 control steps
Message-ID: <al0686b7StFtPfY2@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-3-sakari.ailus@linux.intel.com>
 <20260717142121.GC1889304@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717142121.GC1889304@killaraus.ideasonboard.com>

Hi Laurent,

On Fri, Jul 17, 2026 at 05:21:21PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Jul 01, 2026 at 03:26:20PM +0300, Sakari Ailus wrote:
> > The controls that are divided by the rate_factor before writing them to
> > the registers have the step of the value of the rate_factor. Take this
> > into account when the control's range is modified. The controls are
> > created in a configuration where rate_factor is always 1, hence there's no
> > need to change the code adding new controls.
> > 
> > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/imx219.c | 18 ++++++++----------
> >  1 file changed, 8 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 05d9737bdc95..2aab6e7180d4 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -319,19 +319,19 @@ static const struct imx219_mode supported_modes[] = {
> >  		/* 1080P 30fps cropped */
> >  		.width = 1920,
> >  		.height = 1080,
> > -		.fll_def = 1763,
> > +		.fll_def = 1762,
> 
> This is not a binned mode, an odd default value is not incorrect. Is
> there a reason to change it ?

The fll_def field is used to calculate the VBLANK control range and odd
number here results in an odd number for the default, which is invalid and
so __v4l2_ctrl_modify_range() will fail as a result.

The register value isn't changed whereas the value that is visible to the
userspace does change.

> 
> >  	},
> >  	{
> >  		/* 2x2 binned 60fps mode */
> >  		.width = 1640,
> >  		.height = 1232,
> > -		.fll_def = 1707,
> > +		.fll_def = 1706,
> >  	},
> >  	{
> >  		/* 640x480 60fps mode */
> >  		.width = 640,
> >  		.height = 480,
> > -		.fll_def = 1707,
> > +		.fll_def = 1706,
> 
> Those two are fine as they won't (AFAIU) change register values.
> 
> >  	},
> >  };
> >  
> > @@ -458,8 +458,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		ret = __v4l2_ctrl_modify_range(imx219->exposure,
> >  					       imx219->exposure->minimum,
> >  					       exposure_max,
> > -					       imx219->exposure->step,
> > -					       exposure_def);
> > +					       rate_factor, exposure_def);
> 
> The change is simple so I'm fine with it, but in general I'm not sure
> this would be worth it if it were to make the code more complex.
> Userspace can benefit from getting a precise step value, as well as
> seeing the control value being adjusted when setting controls. However,
> dealing with limit updates reported through events is quite cumbersome
> for userspace. It's a big change and not a high priority, but I'd like
> an API where ioctls such as VIDIOC_SUBDEV_S_FMT would have the ability
> to report control changes synchronously.

I wonder if VIDIOC_S_EXT_EXT_CTRLS could do that. :-)

> 
> With the change to the first fll_def possibly dropped,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you.

> 
> >  		if (ret)
> >  			return ret;
> >  
> > @@ -887,7 +886,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  
> >  		/* Update limits and set FPS to default */
> >  		ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> > -					       IMX219_FLL_MAX - mode->height, 1,
> > +					       IMX219_FLL_MAX - mode->height,
> > +					       rate_factor,
> >  					       mode->fll_def - mode->height);
> >  		if (ret)
> >  			return ret;
> > @@ -905,8 +905,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  		ret = __v4l2_ctrl_modify_range(imx219->exposure,
> >  					       imx219->exposure->minimum,
> >  					       exposure_max,
> > -					       imx219->exposure->step,
> > -					       exposure_def);
> > +					       rate_factor, exposure_def);
> >  		if (ret)
> >  			return ret;
> >  
> > @@ -931,8 +930,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  			return ret;
> >  
> >  		/* Scale the pixel rate based on the mode specific factor */
> > -		pixel_rate = imx219_get_pixel_rate(imx219) *
> > -			     imx219_get_rate_factor(state);
> > +		pixel_rate = imx219_get_pixel_rate(imx219) * rate_factor;
> >  		ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> >  					       pixel_rate, 1, pixel_rate);
> >  		if (ret)
> 

-- 
Kind regards,

Sakari Ailus
