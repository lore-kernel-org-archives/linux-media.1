Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A5F43F0BE
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 06:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529362; cv=none; b=TQSif9BlTXZnwr7qN9nY4zRyqe2Ux2nkswbkCjcz+3FibDGhBYHf/YTOfCjmTOgRUoQ0Zl12KMRKaFeh1QBbQ+tDHUQ7EGy3qPr6Qvx1Mq/Ybrn/pKnW4tXYOKxenMeRxvAZEkvvfRdp2yCiIWJv9zEFuCid43O2GDD/8LMbeXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529362; c=relaxed/simple;
	bh=j2NvoXmobaWvGeQhQBc3bXjS5Pr4PbNojkELJveGCZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VylZ439OwRDx10haI90DpwJNXqbGKeLleRSrraYUkE41utn3ZjYnzsYqX92uQCMozlaHlrQcp6dQE8H9b+7exXbGnMpK2/E/YOtkQ6seyptlh4kMxjbzGowDoGJZH30idH6opQcd0+Ot39KS97kY+s/9ZkPOp++FAE6BeLzq2uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MlTdYL5X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MlTdYL5X"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBA9DC1;
	Mon, 20 Jul 2026 08:34:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784529299;
	bh=j2NvoXmobaWvGeQhQBc3bXjS5Pr4PbNojkELJveGCZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MlTdYL5X6V6MJD7Y/ALn8MaU/5EwrdlkaX2wCFQ1TRZ36th5Ezen2aoMzUY9DWHA2
	 dMToZD0eiRCMUkRD68xmj0puwx771/LMeZ4GFrYiHmksUpelgM81OswHtB2INfsUoE
	 v+xOHysJ2aypL+wddjceMRgE5zZ6HYnEGE40Svzo=
Date: Mon, 20 Jul 2026 09:35:56 +0300
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
Subject: Re: [PATCH v6 07/16] media: v4l2-subdev: Move subdev client
 capabilities into a new struct
Message-ID: <20260720063556.GD2208631@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-7-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-7-sakari.ailus@linux.intel.com>

On Wed, Jul 01, 2026 at 03:26:24PM +0300, Sakari Ailus wrote:
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

It looks like you forgot to take my review comments from v5 into
account.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c |  8 ++++----
>  include/media/v4l2-subdev.h           | 12 ++++++++++--
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index e9f81b9be9e2..070a9e607fe3 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -611,7 +611,7 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>  	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
>  		struct v4l2_subdev_frame_interval *fi = arg;
>  
> -		if (!(subdev_fh->client_caps &
> +		if (!(subdev_fh->ci.client_caps &
>  		      V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH))
>  			fi->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>  
> @@ -650,7 +650,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
>  	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
>  	bool streams_subdev = sd->flags & V4L2_SUBDEV_FL_STREAMS;
> -	bool client_supports_streams = subdev_fh->client_caps &
> +	bool client_supports_streams = subdev_fh->ci.client_caps &
>  				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
>  	int rval;
>  
> @@ -1117,7 +1117,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
>  		struct v4l2_subdev_client_capability *client_cap = arg;
>  
> -		client_cap->capabilities = subdev_fh->client_caps;
> +		client_cap->capabilities = subdev_fh->ci.client_caps;
>  
>  		return 0;
>  	}
> @@ -1137,7 +1137,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
>  					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
>  
> -		subdev_fh->client_caps = client_cap->capabilities;
> +		subdev_fh->ci.client_caps = client_cap->capabilities;
>  
>  		return 0;
>  	}
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d9dca6905b33..b797923738b6 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -734,6 +734,14 @@ struct v4l2_subdev_state {
>  	struct v4l2_subdev_stream_configs stream_configs;
>  };
>  
> +/**
> + * struct v4l2_subdev_client_info - Sub-device client information
> + * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
> + */
> +struct v4l2_subdev_client_info {
> +	u64 client_caps;
> +};
> +
>  /**
>   * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
>   *
> @@ -1130,14 +1138,14 @@ struct v4l2_subdev {
>   * @vfh: pointer to &struct v4l2_fh
>   * @state: pointer to &struct v4l2_subdev_state
>   * @owner: module pointer to the owner of this file handle
> - * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
> + * @ci: sub-device client info related to this file handle
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
