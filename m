Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DE447F2E0
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 11:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349725; cv=none; b=CjwyHEieGAUoEZAus3igZ+odUbxsg3mHcVV4WHQQZKJb6KSAykEtK2AwqcFwejhRMlViDfCdyHAji8VhtUufTlHsaQ2kMe4toPnaGL4ZL4DpB4l29vLZwmY9UEnxIuc4ANeDg0gmsQaaE0OI8BAOqC1wTt5THYv3K4f8JjXcbDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349725; c=relaxed/simple;
	bh=J0CZmWuuC3lVFa4qkq3ON3DNS+wkoj/qswLx9oA1qs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjEyiq8aHTnfqHFSNdBWyOUJhOd8G85gN3rncuuBk+qmPXw7TNans7+WPpuWdVspvemYfexyyJw3/A9ULA8fsBY8XdoUEy3PWIkRaaYW9xq9F6NW/UerEv7XTk6Wb3yWjjElGqCGSUAvlt7/GOLru+Fm8NszhkXZBVTTYfDCMGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EFzeN7TJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EFzeN7TJ"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D05E218E9;
	Wed,  2 Sep 2026 13:47:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788349622;
	bh=J0CZmWuuC3lVFa4qkq3ON3DNS+wkoj/qswLx9oA1qs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFzeN7TJvPfvHLwhJ6OhsrNz7fvzV2ZzjDUdB6PXh+WHlP9HE3NOLpAUYYqc9VKlo
	 moyfc4w/luQ4pupYfgVj5S89haFF9Z4BY87J4zI/JdP5VNJYowsrPE8kSInCDsvvv1
	 YV8w/QGEEC7hJTApNJBNWoDTa20Qn+aEmxX2kmzY=
Date: Wed, 2 Sep 2026 14:48:31 +0300
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
Message-ID: <20260902114831.GA328588@killaraus.ideasonboard.com>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
 <20260807122409.45807-15-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260807122409.45807-15-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Fri, Aug 07, 2026 at 03:24:09PM +0300, Sakari Ailus wrote:
> Add a pointer to const struct v4l2_subdev_client_info to the get_fmt,
> set_fmt, get_selection and set_selection sub-device pad ops. The client
> info struct will soon be used to differentiate UAPI based on client
> capabilities.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---

[snip]

First, a partial review to point out one specific issue in two drivers.

> diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
> index 0efbf43d2fe6..8413fd44d657 100644
> --- a/drivers/media/i2c/imx678.c
> +++ b/drivers/media/i2c/imx678.c
> @@ -849,6 +849,7 @@ static int imx678_enum_frame_size(struct v4l2_subdev *sd,
>  }
>  
>  static int imx678_get_selection(struct v4l2_subdev *sd,
> +				const struct v4l2_subdev_client_info *ci,
>  				struct v4l2_subdev_state *sd_state,
>  				struct v4l2_subdev_selection *sel)
>  {
> @@ -1130,7 +1131,6 @@ static const struct v4l2_subdev_video_ops imx678_video_ops = {
>  static const struct v4l2_subdev_pad_ops imx678_pad_ops = {
>  	.enum_mbus_code = imx678_enum_mbus_code,
>  	.get_fmt = v4l2_subdev_get_fmt,
> -	.set_fmt = v4l2_subdev_get_fmt,

This belongs to patch 10/14.

>  	.get_selection = imx678_get_selection,
>  	.enum_frame_size = imx678_enum_frame_size,
>  	.enable_streams = imx678_enable_streams,

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

-- 
Regards,

Laurent Pinchart
