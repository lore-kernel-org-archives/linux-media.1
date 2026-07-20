Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E831B86C7
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 07:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784530825; cv=none; b=bqcaJ9wFYmSy8l0txAPfZlH9rx9MBDmYS6b9lySzOC/sr3FBr534mEOa4p7ZsCVcvFHGdNu4pFRvnaS3pCIEkxiRfMvMX1r/Waly80DtiFkF+N38AvamPUFhVtahMxiqetSlVF5ySj6hPFfkfFzQIJN3whksKGBGHkMxYIufEXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784530825; c=relaxed/simple;
	bh=8eL1+nWjKX9zXLI4fxHiaatKCbN2rTmv5Xw6AReeycE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apq2tV2Pn7Y4P3T71+pfj14f1Y2TRBH/bt6ZZFTUbSsY/w5nQ5dW7mnKEVlVPCnfLoXSX92r2dtq3SC9esrbx277lgO76I7PBwKh//7aqp0D5NYJan5KVKe7mV4UIazCUUG43Qv25W9OA2Z2MSqBf6F8tcn/im1GJ4MVzRmSJMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rEY8++bC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rEY8++bC"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22B9BC1;
	Mon, 20 Jul 2026 08:59:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784530762;
	bh=8eL1+nWjKX9zXLI4fxHiaatKCbN2rTmv5Xw6AReeycE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rEY8++bC4dIzFOMd00czL2A7F6sqrs4fGntca4IVsFcMkAYCyuQ4kFJMRk509rKaS
	 7b4vbGeQfY4Vq03PsRlffetCZf1ZsX+AcdObEuGXdDWuDWGKtiuhZZtPDzPWn5Wywd
	 G56u9xgrtAdKkBZDWqjIoZR1NfO8dBMKiwHyjjv4=
Date: Mon, 20 Jul 2026 10:00:19 +0300
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
Subject: Re: [PATCH v6 14/16] media: mt9m001: Pass sub-device state to
 set_selection() callback
Message-ID: <20260720070019.GA2218925@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-14-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-14-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Jul 01, 2026 at 03:26:31PM +0300, Sakari Ailus wrote:
> When the set_selection() pad op is called from the set_fmt() pad op, pass
> the sub-device state to it instead of just a NULL pointer. This does patch
> not fix a bug but simply passes the expected information to the

I think you meant "This patch does not fix a bug".

> set_selection() op.

This doesn't explain why this should be done. Frankly I don't think this
deserves a separate patch, just squash it with whatever other patch
needs it.

> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/mt9m001.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> index 0ade967b357b..d8fffed0818a 100644
> --- a/drivers/media/i2c/mt9m001.c
> +++ b/drivers/media/i2c/mt9m001.c
> @@ -343,6 +343,7 @@ static int mt9m001_get_fmt(struct v4l2_subdev *sd,
>  }
>  
>  static int mt9m001_s_fmt(struct v4l2_subdev *sd,
> +			 struct v4l2_subdev_state *state,
>  			 const struct mt9m001_datafmt *fmt,
>  			 struct v4l2_mbus_framefmt *mf)
>  {
> @@ -359,7 +360,7 @@ static int mt9m001_s_fmt(struct v4l2_subdev *sd,
>  	int ret;
>  
>  	/* No support for scaling so far, just crop. TODO: use skipping */
> -	ret = mt9m001_set_selection(sd, NULL, &sel);
> +	ret = mt9m001_set_selection(sd, state, &sel);
>  	if (!ret) {
>  		mf->width	= mt9m001->rect.width;
>  		mf->height	= mt9m001->rect.height;
> @@ -404,7 +405,7 @@ static int mt9m001_set_fmt(struct v4l2_subdev *sd,
>  	mf->xfer_func	= V4L2_XFER_FUNC_DEFAULT;
>  
>  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> -		return mt9m001_s_fmt(sd, fmt, mf);
> +		return mt9m001_s_fmt(sd, sd_state, fmt, mf);
>  	*v4l2_subdev_state_get_format(sd_state, 0) = *mf;
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
