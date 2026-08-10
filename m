Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36B6403AF9
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 15:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374662; cv=none; b=gL0AKrVoHgiqxnUKlW0VS4w+5m5lRjC5L4USPQxjYEOP2OaXhZ3pBw81ZWuJMCMvlijAzPZJV2E+WSRompa4M8VHIpF2+yKtx+Xq2iEJCWZqxg7dhfhvmZME67n+LNAWPeW2BlqNw2ZXxMoj+DxdcCxAq/aaSYkigBmlSHMTSy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374662; c=relaxed/simple;
	bh=YeUuyT8DtZhNCrNcshz0W69GulLY7bro8uPw0k4OIZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrCCOknyygT6ZbwXlosGSJegiLEJbP2mYYHf1sX+sU1HfnclozRF4ZXemRbw+0YIXSucMzuVGdefOtI1sfXnt/Yy3oQJO3iJJzbeezWjEV+IvYKpK+i06SZyZtitOnNKiRkyx3/NVosPrLMzb1PnQeYlucpZ/d0PdqP28HBRr4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YYnE+zQy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YYnE+zQy"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2314BB;
	Mon, 10 Aug 2026 17:09:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786374583;
	bh=YeUuyT8DtZhNCrNcshz0W69GulLY7bro8uPw0k4OIZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYnE+zQy+dG2zotL9r1Cn/B1SgLXuVSxUVaTNq/ywbwWlxDG9yyAQAc3TINdLORDJ
	 19aNZe9a809VQxkGjfcc0AnBljRdECrA630cXUMjD5BT5HQoSlx5tk9Zk/Js1JYiTG
	 7s/pbiadG7gJJNdqB+cJ1URAnTvMm/vqJBRSaCIc=
Date: Mon, 10 Aug 2026 18:10:55 +0300
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
Subject: Re: [PATCH v7 03/14] media: imx219: Account for rate_factor in
 control steps
Message-ID: <20260810151055.GD2967212@killaraus.ideasonboard.com>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
 <20260807122409.45807-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260807122409.45807-4-sakari.ailus@linux.intel.com>

On Fri, Aug 07, 2026 at 03:23:58PM +0300, Sakari Ailus wrote:
> The controls that are divided by the rate_factor before writing them to
> the registers have the step of the value of the rate_factor. Take this
> into account when the control's range is modified. The controls are
> created in a configuration where rate_factor is always 1, hence there's no
> need to change the code adding new controls.
> 
> Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx219.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 5184523de8be..b1f29037af74 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -340,13 +340,13 @@ static const struct imx219_mode supported_modes[] = {
>  		/* 2x2 binned 60fps mode */
>  		.width = 1640,
>  		.height = 1232,
> -		.fll_def = 1707,
> +		.fll_def = 1706,
>  	},
>  	{
>  		/* 640x480 60fps mode */
>  		.width = 640,
>  		.height = 480,
> -		.fll_def = 1707,
> +		.fll_def = 1706,
>  	},
>  };
>  
> @@ -473,8 +473,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = __v4l2_ctrl_modify_range(imx219->exposure,
>  					       imx219->exposure->minimum,
>  					       exposure_max,
> -					       imx219->exposure->step,
> -					       exposure_def);
> +					       rate_factor, exposure_def);
>  		if (ret)
>  			return ret;
>  
> @@ -902,7 +901,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  
>  		/* Update limits and set FPS to default */
>  		ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> -					       IMX219_FLL_MAX - mode->height, 1,
> +					       IMX219_FLL_MAX - mode->height,
> +					       rate_factor,
>  					       mode->fll_def - mode->height);
>  		if (ret)
>  			return ret;
> @@ -920,8 +920,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  		ret = __v4l2_ctrl_modify_range(imx219->exposure,
>  					       imx219->exposure->minimum,
>  					       exposure_max,
> -					       imx219->exposure->step,
> -					       exposure_def);
> +					       rate_factor, exposure_def);
>  		if (ret)
>  			return ret;
>  
> @@ -946,8 +945,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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
