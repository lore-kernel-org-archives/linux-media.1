Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210313;
	b=4ARf4BxCa6RJU0bGNrCkuezpW9lXZZJblIuDZy8Bm3ZQDfIXw/pFRlM4+3RSmBh9lDcx
	 RAYym5fnrJb/eoFqYAK0ZLqq5wprdXsl47KMRdpq6Pdp+bVIojXogzN00ePFort4RcpXJ
	 qSQyhAn+OlxQUjBeT5+vUhVHq7lgh8Llf/r/vbivbXp3S17DxQ6aqCa9hFaHwoa9I1CrW
	 skY4Y0HJJQopuKDiOrryRCvf/JbaCLkzyOVTwn+yzVoRnj8EFf3U4pRR3obkoxFoFmVoy
	 4jn0CcYvrPuS1Duzc2gzXHoqk4iiSuUW7NEn3U+ybvt9cStr7DMsSip28CKytrKrcqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210313;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=f6Uv9MJ4vpovhqINHEuPUPqtVo+UnXFbVPdaYJZYw1U=;
	b=KC57W0iXpKnsnmNxg3JxdRRrkCyfy+5FlKQUbHSTAvUGqTW1X3gOcXKPM6jrT3myfsk9
	 PR0n39J/DH2cZzj21w/CvglThx35TEoi4UKgWx3I/F5F0x9GLV/6OlEw9fKd6xZwIiv12
	 NvrrS2bKR7q2ogDgjO+mI+7Z1LlghNbJpP9Fk6LM5AB7M2sXZ5jvdxgQdCLIyr1jezY7m
	 Ie/DZwtDlfKh5gI8Zn+t9aD5n+qr5oHoqoW1uUkOFpGi+Ri4lVsgAP4PMiCCDh7Gano46
	 iJrwAqv6q9FZApujF+DEt83Lez5c3K36b98qcRAj5z939zSI/XazhTowX51FbXRsp1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=iYvfWxJN;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E64606A680;
	Fri, 20 Nov 2026 21:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E64606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=iYvfWxJN
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 090794E6;
	Fri, 20 Nov 2026 22:29:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795210159;
	bh=HSzhy66PiWvOlLRkHf2I9CCsNl+3COEm1jiGZVw6MaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYvfWxJNUjUistDmt8x/KLvOdXWH56uTon8uwgZ4Jqbnu0XRNWyeel4e6rDzWmJXT
	 kB8BI6h/skQ+fxABkZE57zGBuseArNtUVuuQItBBOK0HZo1u2+VIqDRcyxpeFuJown
	 1uepMe5cpqss5+AF/IinjfCg/+YIp58bbaOsjWwE=
Date: Fri, 20 Nov 2026 23:31:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] media: i2c: mt9m114: Add get_fwnode_pad operation
 for IFP
Message-ID: <20261120213147.GA2510168@killaraus.ideasonboard.com>
References: <20261006153619.304520-1-clamor95@gmail.com>
 <20261006153619.304520-2-clamor95@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261006153619.304520-2-clamor95@gmail.com>

On Tue, Oct 06, 2026 at 06:36:19PM +0300, Svyatoslav Ryhel wrote:
> Currently, the driver's binding exposes only one endpoint, which maps to
> the IFP subdevice's SOURCE pad. This configuration causes failures for
> many devices using this camera because both the DT binding and the
> one-to-one pad mapping logic map the endpoint to the wrong pad. Fix this
> by implementing the get_fwnode_pad operation for the IFP, which correctly
> matches the endpoint to the corresponding IFP pad.

The discussion in the review of v1 died out after my last reply. Let's
continue it there.

https://lore.kernel.org/linux-media/20260721103845.GJ50424@killaraus.ideasonboard.com/

> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/media/i2c/mt9m114.c | 39 +++++++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index c6c950d5c8f3d..583cf47aa652e 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -9,6 +9,7 @@
>   * itself based on work from Andrew Chew <achew@nvidia.com>.
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/errno.h>
> @@ -1019,14 +1020,6 @@ static int mt9m114_stop_streaming(struct mt9m114 *sensor)
>  	return ret;
>  }
>  
> -/* -----------------------------------------------------------------------------
> - * Common Subdev Operations
> - */
> -
> -static const struct media_entity_operations mt9m114_entity_ops = {
> -	.link_validate = v4l2_subdev_link_validate,
> -};
> -
>  /* -----------------------------------------------------------------------------
>   * Pixel Array Control Operations
>   */
> @@ -1383,6 +1376,10 @@ static const struct v4l2_subdev_internal_ops mt9m114_pa_internal_ops = {
>  	.init_state = mt9m114_pa_init_state,
>  };
>  
> +static const struct media_entity_operations mt9m114_pa_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
>  static int mt9m114_pa_init(struct mt9m114 *sensor)
>  {
>  	struct v4l2_ctrl_handler *hdl = &sensor->pa.hdl;
> @@ -1405,7 +1402,7 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
>  
>  	/* Initialize the media entity. */
>  	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> -	sd->entity.ops = &mt9m114_entity_ops;
> +	sd->entity.ops = &mt9m114_pa_entity_ops;
>  	pads[0].flags = MEDIA_PAD_FL_SOURCE;
>  	ret = media_entity_pads_init(&sd->entity, 1, pads);
>  	if (ret < 0)
> @@ -2097,6 +2094,23 @@ static int mt9m114_ifp_registered(struct v4l2_subdev *sd)
>  	return 0;
>  }
>  
> +/*
> + * The IFP has only one fwnode endpoint, which corresponds to the pad
> + * linked to the PA (PA SINK), while it should be the SOURCE for the
> + * next media device in the pipe.
> + */
> +static int mt9m114_ifp_get_fwnode_pad(struct media_entity *entity,
> +				      struct fwnode_endpoint *endpoint)
> +{
> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> +	struct fwnode_handle *fwnode = dev_fwnode(&sensor->client->dev);
> +	struct fwnode_handle *ifp_ep __free(fwnode_handle) =
> +		fwnode_graph_get_next_endpoint(fwnode, NULL);
> +
> +	return endpoint->local_fwnode == ifp_ep ? 1 : -ENXIO;
> +}
> +
>  static const struct v4l2_subdev_video_ops mt9m114_ifp_video_ops = {
>  	.s_stream = mt9m114_ifp_s_stream,
>  };
> @@ -2124,6 +2138,11 @@ static const struct v4l2_subdev_internal_ops mt9m114_ifp_internal_ops = {
>  	.unregistered = mt9m114_ifp_unregistered,
>  };
>  
> +static const struct media_entity_operations mt9m114_ifp_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +	.get_fwnode_pad = mt9m114_ifp_get_fwnode_pad,
> +};
> +
>  static int mt9m114_ifp_init(struct mt9m114 *sensor)
>  {
>  	struct v4l2_subdev *sd = &sensor->ifp.sd;
> @@ -2141,7 +2160,7 @@ static int mt9m114_ifp_init(struct mt9m114 *sensor)
>  
>  	/* Initialize the media entity. */
>  	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
> -	sd->entity.ops = &mt9m114_entity_ops;
> +	sd->entity.ops = &mt9m114_ifp_entity_ops;
>  	pads[0].flags = MEDIA_PAD_FL_SINK;
>  	pads[1].flags = MEDIA_PAD_FL_SOURCE;
>  	ret = media_entity_pads_init(&sd->entity, 2, pads);
> -- 
> 2.53.0
> 

-- 
Regards,

Laurent Pinchart
