Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4A73B42D7
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911282; cv=none; b=JhtJ/PXgZ/SGyvMEPplny2faOx//IpOyT8+ZmKib6jN3pojgdGj0xiF+VAYuAxiDyB3rDqnIkFaMeg8bVXxTHr7isDCygoatlRtxuQWUdzNknf4E29YC1v9qsZpSOqk+7IO0p2j8TvUBjbFOsKqL8ulIhXTKrSoky2Smv9rgcnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911282; c=relaxed/simple;
	bh=xj6upxhcfl+Ax8bF4ytIKRBfQNVmvIPWdSdc/+Vvmn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFYTBt+uSw4g6YDeVPL+LKDAngeMKy6kAf6xr++crgE8WWrpFtVRfuYB4kqvoePirwyV4Lbmtnk0KThqjj11gxfBCD+OkgAdvlzT2BkLjlU9CRuHbahsIU92jEybjFFr827+qd7cN08r5Jb+FlKRLnepKzcJ7dYgTE/K3ydqXH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MPpqcEgx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MPpqcEgx"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AC442D7;
	Mon,  8 Jun 2026 11:34:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780911250;
	bh=xj6upxhcfl+Ax8bF4ytIKRBfQNVmvIPWdSdc/+Vvmn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPpqcEgxmb1U2ox88yoNqQrU1i1pz0c9nCy5mfP8Co33XpfUqz2ei3zR0i5Z3FzcE
	 jJs5v6Z4kr48082mxy85t3jcciajLDIAnXU2wu7gSZnvpZasubyv6/9GxbyWDXCkb9
	 F66odRqXyjCa6zYuoJINEN9oo4c40JpS3mNS4lr4=
Date: Mon, 8 Jun 2026 12:34:36 +0300
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
Subject: Re: [PATCH v5 08/10] media: v4l2-subdev: Move subdev client
 capabilities into a new struct
Message-ID: <20260608093436.GD772117@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-9-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260607215356.842932-9-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, Jun 08, 2026 at 12:53:54AM +0300, Sakari Ailus wrote:
> Add struct v4l2_subdev_client_info to hold sub-device client capability
> bits that used to be stored in the client_caps field of struct
> v4l2_subdev_fh. The intent is to enable passing this struct to sub-device
> pad operation callbacks for capability information. The main reason why
> this is a new struct instead of a u64 field is that modifying the callback
> arguments requires touching almost every sub-device driver and that is
> desirable to avoid in the future, should more than the client capability bits
> need to be known to the callbacks.
> 
> To be squashed to the previous patch.

This seems to be a leftover, patch 07/10 is unrelated.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c |  8 ++++----
>  include/media/v4l2-subdev.h           | 12 ++++++++++--
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index dc4ac08c210f..e4ac6981e950 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -634,7 +634,7 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>  	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
>  		struct v4l2_subdev_frame_interval *fi = arg;
>  
> -		if (!(subdev_fh->client_caps &
> +		if (!(subdev_fh->ci.client_caps &
>  		      V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH))
>  			fi->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>  
> @@ -673,7 +673,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
>  	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
>  	bool streams_subdev = sd->flags & V4L2_SUBDEV_FL_STREAMS;
> -	bool client_supports_streams = subdev_fh->client_caps &
> +	bool client_supports_streams = subdev_fh->ci.client_caps &
>  				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
>  	int rval;
>  
> @@ -1133,7 +1133,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
>  		struct v4l2_subdev_client_capability *client_cap = arg;
>  
> -		client_cap->capabilities = subdev_fh->client_caps;
> +		client_cap->capabilities = subdev_fh->ci.client_caps;
>  
>  		return 0;
>  	}
> @@ -1153,7 +1153,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
>  					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
>  
> -		subdev_fh->client_caps = client_cap->capabilities;
> +		subdev_fh->ci.client_caps = client_cap->capabilities;
>  
>  		return 0;
>  	}
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index a25234befbe9..e83ef88fe12c 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -741,6 +741,14 @@ struct v4l2_subdev_state {
>  	struct v4l2_subdev_stream_configs stream_configs;
>  };
>  
> +/**
> + * struct v4l2_subdev_client_info - Sub-device client information
> + * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
> + */
> +struct v4l2_subdev_client_info {
> +	u64 client_caps;

As this is now part of a structure called *client* info, maybe the field
could be named just "caps" ?

> +};
> +
>  /**
>   * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
>   *
> @@ -1144,14 +1152,14 @@ struct v4l2_subdev {
>   * @vfh: pointer to &struct v4l2_fh
>   * @state: pointer to &struct v4l2_subdev_state
>   * @owner: module pointer to the owner of this file handle
> - * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
> + * @ci: sub-device client info related to this file handle

I'm not a fan of "ci", I would write client_info to make the code more
explicit.

>   */
>  struct v4l2_subdev_fh {
>  	struct v4l2_fh vfh;
>  	struct module *owner;
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  	struct v4l2_subdev_state *state;
> -	u64 client_caps;
> +	struct v4l2_subdev_client_info ci;
>  #endif
>  };
>  

-- 
Regards,

Laurent Pinchart
