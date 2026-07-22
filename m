Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B039140F743
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 14:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729431; cv=none; b=QWAnkqCAtEYNriy0Xd6N9PMp7CG2VTsSnOB1u5pQL7C909LcB6Npt8Dylx3Yb3YaqD9q8/jk6Wv0+lzF1zfRZjf8G3U09eZrULJ8+o8m+f404vnmOd6JyLOprsphbXoaKVp/O7kD4t+nA7w88QD/oaPnULpBHbVk/UJurZRHxGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729431; c=relaxed/simple;
	bh=CBNs5JoLSdTr6zlIdBeClu3MUxVOepip3ydDubMAuF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8Czz0YergkbgJ23qUISakg0aPtAp00f4LRkKNDayF2jurmHK096KqamRUAtrcZzbGuSyaBGqBRsCjwJKZejJq+WNkIN1kamHsrjhzL5XhR3ru4+Xx947WLUT3znkqdtMzuTCeciNmz+E3odhnx7VO1wlbfZm+i2zgcgALNqKYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M10nG5BA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M10nG5BA"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2D38B08;
	Wed, 22 Jul 2026 16:09:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784729365;
	bh=CBNs5JoLSdTr6zlIdBeClu3MUxVOepip3ydDubMAuF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M10nG5BA7NuYtFn4tGUixOr3c1cNUBwgHluij8ku2I+svZohoHphWBkz3IcA9Smf+
	 Djix8kVerICHJhs5KadVzB7Au9hpkq4a7wDbW7jEoKcDVibEOK4mLqt8pOHC4Pz5Ov
	 DxWWmkXDKVegrx9JqQNFVegT9Yl9b9DYf9yjLTeI=
Date: Wed, 22 Jul 2026 17:10:24 +0300
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
Subject: Re: [PATCH v6 16/16] media: v4l2-subdev: Add struct
 v4l2_subdev_client_info pointer to pad ops
Message-ID: <20260722141024.GE3679@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-17-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-17-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

This is a partial review to flag one specific issue. A second review
will come next.

On Wed, Jul 01, 2026 at 03:26:34PM +0300, Sakari Ailus wrote:
> Add a pointer to const struct v4l2_subdev_client_info to the get_fmt,
> set_fmt, get_selection and set_selection sub-device pad ops. The client
> info struct will soon be used to differentiate UAPI based on client
> capabilities.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

[snip]

>  246 files changed, 541 insertions(+), 153 deletions(-)

[snip]

> diff --git a/drivers/media/i2c/ak881x.c b/drivers/media/i2c/ak881x.c
> index cea46f01997d..3449d95ee8a0 100644
> --- a/drivers/media/i2c/ak881x.c
> +++ b/drivers/media/i2c/ak881x.c

[snip]

> @@ -216,7 +217,6 @@ static const struct v4l2_subdev_video_ops ak881x_subdev_video_ops = {
>  static const struct v4l2_subdev_pad_ops ak881x_subdev_pad_ops = {
>  	.enum_mbus_code = ak881x_enum_mbus_code,
>  	.get_selection	= ak881x_get_selection,
> -	.set_fmt	= ak881x_fill_fmt,

This belongs to a separate patch.

>  	.get_fmt	= ak881x_fill_fmt,
>  };
>  

[snip]

> diff --git a/drivers/media/i2c/ml86v7667.c b/drivers/media/i2c/ml86v7667.c
> index 48b7d589df31..eda41a80d20c 100644
> --- a/drivers/media/i2c/ml86v7667.c
> +++ b/drivers/media/i2c/ml86v7667.c
> @@ -298,7 +298,6 @@ static const struct v4l2_subdev_video_ops ml86v7667_subdev_video_ops = {
>  static const struct v4l2_subdev_pad_ops ml86v7667_subdev_pad_ops = {
>  	.enum_mbus_code = ml86v7667_enum_mbus_code,
>  	.get_fmt = ml86v7667_fill_fmt,
> -	.set_fmt = ml86v7667_fill_fmt,

This too.

>  	.get_mbus_config = ml86v7667_get_mbus_config,
>  };
>  
[snip]

> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index 9c204f38935d..91064f06f8c1 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c

[snip]

> @@ -1724,7 +1726,6 @@ static const struct v4l2_subdev_vbi_ops tvp5150_vbi_ops = {
>  static const struct v4l2_subdev_pad_ops tvp5150_pad_ops = {
>  	.enum_mbus_code = tvp5150_enum_mbus_code,
>  	.enum_frame_size = tvp5150_enum_frame_size,
> -	.set_fmt = tvp5150_fill_fmt,

This too.

>  	.get_fmt = tvp5150_fill_fmt,
>  	.get_selection = tvp5150_get_selection,
>  	.set_selection = tvp5150_set_selection,

[snip]

> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index 0751b2e04895..94ae304ac85f 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -264,7 +264,6 @@ static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
>  
>  static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
>  	.get_fmt = v4l2_subdev_get_fmt,
> -	.set_fmt = v4l2_subdev_get_fmt,

And this too.

You don't need one patch per driver, a tree-wide patch for similar
changes is fine.

>  };
>  
>  static const struct v4l2_subdev_ops max96712_subdev_ops = {

[snip]

-- 
Regards,

Laurent Pinchart
