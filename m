Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13183161AD
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 13:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784209528; cv=none; b=K/wxOU8UZm/QLI+idLLvBQt/Wk7ygAr/GThUrQfF778pCKms4OU8Hwx7L2hK2yVFMIKoAg8xkGFkvKY3Wfz7huex00uqD9+GKbU+xvW+NSWbPYcBFXk9ABMyJ7Z8NbWf9QLX9IQ+kSIpzuikuB9iFZqCyQ48yBkdZ7c3ztczO88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784209528; c=relaxed/simple;
	bh=Ic1p9l23LMUS0idoGpsKbc5C5GZGJZdCAt9BrDifgTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfQlVHEQ4vB2BfElNNlqviFf8yZxEBMH6X4A5DxtpIs9JzWPr3LUJRHgLZqT1FRMAYfs5zEGbTFdXdGOF9Z36to+9h9Uk9oueE4inlyZ/nX6mHpklUk9TSJWtm2ow7KBWHPMeoKAetetl4OItbvNMVyYLwQKw5F8WCMjJpFZ9XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U7xFlYb1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U7xFlYb1"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 327737CA;
	Thu, 16 Jul 2026 15:44:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784209468;
	bh=Ic1p9l23LMUS0idoGpsKbc5C5GZGJZdCAt9BrDifgTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U7xFlYb1XoULlXRaIKzq+ciyhZhu0AAGDfMGxNVaS4TFTIQyUe5sMDt8dAZFs1sFs
	 TWllreQcS0GJ/9n9qV3JcqC5QN3VJATAKI3VtVLAHZK9g2WA0pNG5100lvYMVQ7a0H
	 4TlXFAqytUV/sCF5nyzvyalXgsbUgWfV/0te8+EY=
Date: Thu, 16 Jul 2026 16:45:22 +0300
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
Subject: Re: [PATCH v6 02/16] media: imx219: Account rate_factor in setting
 upper exposure limit
Message-ID: <20260716134522.GA1889304@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-2-sakari.ailus@linux.intel.com>

On Wed, Jul 01, 2026 at 03:26:19PM +0300, Sakari Ailus wrote:
> The rate_factor multiplier is used to multiply a few values in the
> sensor's timing configuration and the exposure time is one of them. This
> also needs to be taken into account in exposure time margin: multiply it
> by rate_factor so that sensor's exposure time margin is respected.
> 
> Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx219.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 223d3753cc93..05d9737bdc95 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -451,7 +451,8 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  		int exposure_max, exposure_def;
>  
>  		/* Update max exposure while meeting expected vblanking */
> -		exposure_max = format->height + ctrl->val - IMX219_EXPOSURE_OFFSET;
> +		exposure_max = format->height + ctrl->val -
> +			IMX219_EXPOSURE_OFFSET * rate_factor;
>  		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>  				exposure_max : IMX219_EXPOSURE_DEFAULT;
>  		ret = __v4l2_ctrl_modify_range(imx219->exposure,
> @@ -878,6 +879,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>  
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> +		int rate_factor = imx219_get_rate_factor(state);
>  		int exposure_max;
>  		int exposure_def;
>  		int llp_min;
> @@ -896,7 +898,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  			return ret;
>  
>  		/* Update max exposure while meeting expected vblanking */
> -		exposure_max = mode->fll_def - IMX219_EXPOSURE_OFFSET;
> +		exposure_max = mode->fll_def -
> +			IMX219_EXPOSURE_OFFSET * rate_factor;
>  		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>  				exposure_max : IMX219_EXPOSURE_DEFAULT;
>  		ret = __v4l2_ctrl_modify_range(imx219->exposure,

-- 
Regards,

Laurent Pinchart
