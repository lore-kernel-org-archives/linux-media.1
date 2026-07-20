Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6203AEF3F
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 05:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784526805; cv=none; b=CSDMs8KyWr+KOB8tw0H0Lt5KcGXblPkrcZ+qS8+Z2iAp+c08AeuKBkHH19tJ7g5k2tHB8LMzysMzJgv/IL45ojas5h72a5APb0f1zN1SacQIlf6Ua++fDSzOTlXf4DrOUzm5maayJx8eYvLS4gPgeV3dRsFuwkXLRVj0d52F5HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784526805; c=relaxed/simple;
	bh=KxEy9QrlmX6VLqcgGcVFoFNHB1clRRgSimrbJPgMiD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHk3U6hsAJWwU2wV98YHmoX7t4uEitreJUfpunKYChH59kGt9tYrI00A3LtBQ1eJDYj5Lxckjd7A0nbkL/T6meXem7iwf053VOGW6g5rFCKhHGOHmWWd25zHB61z2J9Jcx0iwlgt0ZbsvJHfv9sGCARtQoo9E+VPVy5tbkdu/c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vbcsZ2V1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vbcsZ2V1"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77B9D6DF;
	Mon, 20 Jul 2026 07:51:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784526711;
	bh=KxEy9QrlmX6VLqcgGcVFoFNHB1clRRgSimrbJPgMiD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vbcsZ2V1lg3LmS/o07uRsKW7Aoang4W0gfk6R8c2D+k9Ns04afbiSVhGJWBLKDw5l
	 KpmDA9RNE8Lfn90xFREZKoLv4v9ZYFPQF43q9Y6oSB/vgrmsc5DTjl0fv1hCi7lhqT
	 h3aHknfcPalQQNjcgY9+3AaMLVP3JvZ0KzxCSLEw=
Date: Mon, 20 Jul 2026 08:52:48 +0300
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
Subject: Re: [PATCH v6 03/16] media: imx219: Account for rate_factor in
 control steps
Message-ID: <20260720055248.GA2208631@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-3-sakari.ailus@linux.intel.com>
 <20260717142121.GC1889304@killaraus.ideasonboard.com>
 <al0686b7StFtPfY2@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <al0686b7StFtPfY2@kekkonen.localdomain>

On Mon, Jul 20, 2026 at 12:00:35AM +0300, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Fri, Jul 17, 2026 at 05:21:21PM +0300, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Wed, Jul 01, 2026 at 03:26:20PM +0300, Sakari Ailus wrote:
> > > The controls that are divided by the rate_factor before writing them to
> > > the registers have the step of the value of the rate_factor. Take this
> > > into account when the control's range is modified. The controls are
> > > created in a configuration where rate_factor is always 1, hence there's no
> > > need to change the code adding new controls.
> > > 
> > > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/i2c/imx219.c | 18 ++++++++----------
> > >  1 file changed, 8 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > index 05d9737bdc95..2aab6e7180d4 100644
> > > --- a/drivers/media/i2c/imx219.c
> > > +++ b/drivers/media/i2c/imx219.c
> > > @@ -319,19 +319,19 @@ static const struct imx219_mode supported_modes[] = {
> > >  		/* 1080P 30fps cropped */
> > >  		.width = 1920,
> > >  		.height = 1080,
> > > -		.fll_def = 1763,
> > > +		.fll_def = 1762,
> > 
> > This is not a binned mode, an odd default value is not incorrect. Is
> > there a reason to change it ?
> 
> The fll_def field is used to calculate the VBLANK control range and odd
> number here results in an odd number for the default, which is invalid and
> so __v4l2_ctrl_modify_range() will fail as a result.

It's only invalid if the step is 2, isn't it ? The 1920x1080 mode
doesn't use binning, so the rate factor should be 1, and the step should
therefore be 1 as well as far as I understand. Am I missing something ?

> The register value isn't changed whereas the value that is visible to the
> userspace does change.
> 
> > 
> > >  	},
> > >  	{
> > >  		/* 2x2 binned 60fps mode */
> > >  		.width = 1640,
> > >  		.height = 1232,
> > > -		.fll_def = 1707,
> > > +		.fll_def = 1706,
> > >  	},
> > >  	{
> > >  		/* 640x480 60fps mode */
> > >  		.width = 640,
> > >  		.height = 480,
> > > -		.fll_def = 1707,
> > > +		.fll_def = 1706,
> > 
> > Those two are fine as they won't (AFAIU) change register values.
> > 
> > >  	},
> > >  };
> > >  
> > > @@ -458,8 +458,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > >  		ret = __v4l2_ctrl_modify_range(imx219->exposure,
> > >  					       imx219->exposure->minimum,
> > >  					       exposure_max,
> > > -					       imx219->exposure->step,
> > > -					       exposure_def);
> > > +					       rate_factor, exposure_def);
> > 
> > The change is simple so I'm fine with it, but in general I'm not sure
> > this would be worth it if it were to make the code more complex.
> > Userspace can benefit from getting a precise step value, as well as
> > seeing the control value being adjusted when setting controls. However,
> > dealing with limit updates reported through events is quite cumbersome
> > for userspace. It's a big change and not a high priority, but I'd like
> > an API where ioctls such as VIDIOC_SUBDEV_S_FMT would have the ability
> > to report control changes synchronously.
> 
> I wonder if VIDIOC_S_EXT_EXT_CTRLS could do that. :-)

It wouldn't, we would need to have new versions of all ioctls that can
result in controls being changed. That would be quick a big modification
of the API.

> > With the change to the first fll_def possibly dropped,
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thank you.
> 
> > >  		if (ret)
> > >  			return ret;
> > >  
> > > @@ -887,7 +886,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >  
> > >  		/* Update limits and set FPS to default */
> > >  		ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> > > -					       IMX219_FLL_MAX - mode->height, 1,
> > > +					       IMX219_FLL_MAX - mode->height,
> > > +					       rate_factor,
> > >  					       mode->fll_def - mode->height);
> > >  		if (ret)
> > >  			return ret;
> > > @@ -905,8 +905,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >  		ret = __v4l2_ctrl_modify_range(imx219->exposure,
> > >  					       imx219->exposure->minimum,
> > >  					       exposure_max,
> > > -					       imx219->exposure->step,
> > > -					       exposure_def);
> > > +					       rate_factor, exposure_def);
> > >  		if (ret)
> > >  			return ret;
> > >  
> > > @@ -931,8 +930,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >  			return ret;
> > >  
> > >  		/* Scale the pixel rate based on the mode specific factor */
> > > -		pixel_rate = imx219_get_pixel_rate(imx219) *
> > > -			     imx219_get_rate_factor(state);
> > > +		pixel_rate = imx219_get_pixel_rate(imx219) * rate_factor;
> > >  		ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> > >  					       pixel_rate, 1, pixel_rate);
> > >  		if (ret)

-- 
Regards,

Laurent Pinchart
