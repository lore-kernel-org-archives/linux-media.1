Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BB5261B8A
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 15:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375854; cv=none; b=pjWDNvU+A8y9RbyzjvX4RQBnDLW+wKl9/keB2e/7SxwgdTz3hagrDECFTGXcwuWpbbqs5O9rGXWHSvkXeKb0aPcGhJh37OukmvOCe/NHVz/yeqzIJomZH0eWfbIbmKt9T8LD6Ih/owJUsce6PHIRdN8K0nSpCihJUKQ1virKlPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375854; c=relaxed/simple;
	bh=ccvzC4W1SX7cCtiUpoHSGZX5Y8p6tZP8UN5y6FrtpCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9ArRaxZh0v63tT0gbmPiKRr0gnV0nQgkCc+4tSQGD+xXoWuRK6xFsyJSSCdblYL/B5uyMkN2gtC1+s3TlGtNa9hBwE667DfJBIo/3mlEdKNDVIbcBVosX/+1D6BOr//TWQWjMtH0WchOdReyjtSUSctffqSThqEe1EkKf/GOUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oO6vsngO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oO6vsngO"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06491BB;
	Mon, 10 Aug 2026 17:29:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786375776;
	bh=ccvzC4W1SX7cCtiUpoHSGZX5Y8p6tZP8UN5y6FrtpCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oO6vsngOmItU8Z5jMGAzH1Hpfxm39CrKIaL0L32EY1JreM+ba+kLpi8LHZdvK33wt
	 ueJiDn9xnVeZyCm3mmIrwlvZ2jd39YQz/0Y8WemCAFLmkFo+epq1yxOgujdcROuR9t
	 MkwEOpcKbeVN0uFNeH66MQ5Yn5+pEOHYLjoG/xwY=
Date: Mon, 10 Aug 2026 18:30:48 +0300
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
Subject: Re: [PATCH v7 10/14] media: v4l2-subdev: Don't assign set_fmt where
 it's equivalent to get_fmt
Message-ID: <20260810153048.GB3011310@killaraus.ideasonboard.com>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
 <20260807122409.45807-11-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260807122409.45807-11-sakari.ailus@linux.intel.com>

On Fri, Aug 07, 2026 at 03:24:05PM +0300, Sakari Ailus wrote:
> Do not assign the set_fmt() pad op where it is the same as get_fmt(). The
> get_fmt() pad op is called by the framework now in absence of set_fmt()
> op.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ak881x.c                | 1 -
>  drivers/media/i2c/gc0310.c                | 1 -

You forgot ml86v7667.c. imx678.c has been added since v6 and should also
be addressed here.

With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  drivers/media/i2c/rdacm20.c               | 1 -
>  drivers/media/i2c/rdacm21.c               | 1 -
>  drivers/media/i2c/tvp5150.c               | 1 -
>  drivers/staging/media/max96712/max96712.c | 1 -
>  6 files changed, 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/ak881x.c b/drivers/media/i2c/ak881x.c
> index cea46f01997d..4cedfc2d4136 100644
> --- a/drivers/media/i2c/ak881x.c
> +++ b/drivers/media/i2c/ak881x.c
> @@ -216,7 +216,6 @@ static const struct v4l2_subdev_video_ops ak881x_subdev_video_ops = {
>  static const struct v4l2_subdev_pad_ops ak881x_subdev_pad_ops = {
>  	.enum_mbus_code = ak881x_enum_mbus_code,
>  	.get_selection	= ak881x_get_selection,
> -	.set_fmt	= ak881x_fill_fmt,
>  	.get_fmt	= ak881x_fill_fmt,
>  };
>  
> diff --git a/drivers/media/i2c/gc0310.c b/drivers/media/i2c/gc0310.c
> index 754e82ad50ae..f2c381602d18 100644
> --- a/drivers/media/i2c/gc0310.c
> +++ b/drivers/media/i2c/gc0310.c
> @@ -537,7 +537,6 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
>  	.enum_mbus_code = gc0310_enum_mbus_code,
>  	.enum_frame_size = gc0310_enum_frame_size,
>  	.get_fmt = v4l2_subdev_get_fmt,
> -	.set_fmt = v4l2_subdev_get_fmt, /* Only 1 fixed mode supported */
>  	.get_selection = gc0310_get_selection,
>  	.set_selection = gc0310_get_selection,
>  	.enable_streams = gc0310_enable_streams,
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 52e8e2620b4d..0179508626b5 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -442,7 +442,6 @@ static const struct v4l2_subdev_video_ops rdacm20_video_ops = {
>  static const struct v4l2_subdev_pad_ops rdacm20_subdev_pad_ops = {
>  	.enum_mbus_code = rdacm20_enum_mbus_code,
>  	.get_fmt	= rdacm20_get_fmt,
> -	.set_fmt	= rdacm20_get_fmt,
>  };
>  
>  static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index ece8a410e7ce..68d2b9d83c3c 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -322,7 +322,6 @@ static const struct v4l2_subdev_video_ops rdacm21_video_ops = {
>  static const struct v4l2_subdev_pad_ops rdacm21_subdev_pad_ops = {
>  	.enum_mbus_code = rdacm21_enum_mbus_code,
>  	.get_fmt	= rdacm21_get_fmt,
> -	.set_fmt	= rdacm21_get_fmt,
>  };
>  
>  static const struct v4l2_subdev_ops rdacm21_subdev_ops = {
> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index 9c204f38935d..5b92424a0148 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c
> @@ -1724,7 +1724,6 @@ static const struct v4l2_subdev_vbi_ops tvp5150_vbi_ops = {
>  static const struct v4l2_subdev_pad_ops tvp5150_pad_ops = {
>  	.enum_mbus_code = tvp5150_enum_mbus_code,
>  	.enum_frame_size = tvp5150_enum_frame_size,
> -	.set_fmt = tvp5150_fill_fmt,
>  	.get_fmt = tvp5150_fill_fmt,
>  	.get_selection = tvp5150_get_selection,
>  	.set_selection = tvp5150_set_selection,
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index 0751b2e04895..94ae304ac85f 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -264,7 +264,6 @@ static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
>  
>  static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
>  	.get_fmt = v4l2_subdev_get_fmt,
> -	.set_fmt = v4l2_subdev_get_fmt,
>  };
>  
>  static const struct v4l2_subdev_ops max96712_subdev_ops = {

-- 
Regards,

Laurent Pinchart
