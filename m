Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9112F28FF
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 07:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903613; cv=none; b=IVbCgPSSbj2e7acar0T4bjo7TZoh8tw/BxMmYvH/BNMzoIvptgUcjX2BaQeCSClSlXhnNj6Yhw2A7LOYQfavRHVL593F/DQn7D7BRBLuua2k9od8vhRy3e2TItYwVcNJI4KK9yJ38zoo04jWK3i5lZ1ixJYVGz0Wy0b9yijISZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903613; c=relaxed/simple;
	bh=naBz08lHg1Sg6+HMY3HcV7GZPAqxcAJ/y4CaIIHflfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNdpKGKQYabIjYL8ZuDEXhs7K2yVR4DG+YEqZr/gUZOFWDtnShbLJhzLNTaJU0MmlDj4M/XDaoqlFSWz3yNbESeY5MndjyRG9OyHqP0QoT5XILaBmDH4APOju7vS+xzC5gCLLUU9Yrv5TSqWHHqY0mubdqmAfam1t+szKHCWURk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UGjDq4ED; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UGjDq4ED"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0515A2EE;
	Mon,  8 Jun 2026 09:26:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780903581;
	bh=naBz08lHg1Sg6+HMY3HcV7GZPAqxcAJ/y4CaIIHflfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGjDq4EDQG+NsVFYAoCpvIxE4NXy4FX5rkC0WpAJzCPfTzEYv32fosWneVuU2QPMv
	 1pPH2P1wberXQzGbtmPGJxvGrDK5HR05oV+zHnSmrELbZFUfJI6klAQQ+Yk8PgYmRA
	 GoLbTAyL8kkRi60Uw9sWgJ4gLODy+89qtDlJUWI4=
Date: Mon, 8 Jun 2026 10:26:46 +0300
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
Subject: Re: [PATCH v5 02/10] media: imx219: Scale the vblank limits
 according to rate_factor
Message-ID: <20260608072646.GC370380@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260607215356.842932-3-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, Jun 08, 2026 at 12:53:48AM +0300, Sakari Ailus wrote:
> The limits for vertical blanking (and frame length in pixels) is related
> to the properties of the hardware, it's not in half-line units the driver
> uses.

The driver only uses half-line units when binning in the analog domain.
The commit message would benefit from making this clearer.

> Multiply the vertical blanking limits by the rate_factor to satisty
> hardware requirements.
> 
> Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx219.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 223d3753cc93..d8fe7db18b6c 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -878,14 +878,17 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>  
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> +		unsigned int rate_factor = imx219_get_rate_factor(state);
>  		int exposure_max;
>  		int exposure_def;
>  		int llp_min;
>  		int pixel_rate;
>  
>  		/* Update limits and set FPS to default */
> -		ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> -					       IMX219_FLL_MAX - mode->height, 1,
> +		ret = __v4l2_ctrl_modify_range(imx219->vblank,
> +					       IMX219_VBLANK_MIN * rate_factor,
> +					       (IMX219_FLL_MAX - mode->height) *
> +					       rate_factor, rate_factor,

Without judging whether or not dividing LLP by the rate factor in
imx219_set_ctrl() is correct or not, this patch brings the control
limits in line with how the control is applied, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  					       mode->fll_def - mode->height);
>  		if (ret)
>  			return ret;
> @@ -928,8 +931,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  			return ret;
>  
>  		/* Scale the pixel rate based on the mode specific factor */
> -		pixel_rate = imx219_get_pixel_rate(imx219) *
> -			     imx219_get_rate_factor(state);
> +		pixel_rate = imx219_get_pixel_rate(imx219) * rate_factor;
>  		ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
>  					       pixel_rate, 1, pixel_rate);
>  		if (ret)

-- 
Regards,

Laurent Pinchart
