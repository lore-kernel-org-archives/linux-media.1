Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D885BA3D
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784292465; cv=none; b=MC7+eu02J+qD4lrF8L6jjvacCf9mXhUHBclerMocFsAkwDYj/BTYyPU/kSayDsR6CAv0Hu20pcfovU4/Ncun8IloJ0RA1LwFww/fokizwyHS72hb58rAYh6f8S6/KUj2fY+bSsLdMqGruxNqsj0G+enYnRe95I5703WrFwS2gkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784292465; c=relaxed/simple;
	bh=GNopo1IsDHYaZsHZoXVdB1ioZkQ0LkKCIPzLGK2mIwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=It4WhgOn/eXiJmtbL2ApkPiZRBGUCVtInpUf+aCIuXXTLTwybHCveem1BbOhUDURvnuEMTbj1i3LC5Pbz8UNZWG5TVzvipD4hXwU8snuZJ6aYZZLvneui9eW5R3AXgo82dGy/kM8M0fM6KW7i6R1suq1UFZTjbYp26ai8g9QeJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wpOfro4w; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wpOfro4w"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A319269;
	Fri, 17 Jul 2026 14:46:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784292405;
	bh=GNopo1IsDHYaZsHZoXVdB1ioZkQ0LkKCIPzLGK2mIwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wpOfro4wEYx2IXptUw/iyxvfC5k3KOsQcOJTnEHeHHqRLWQWsUeaaTSIHR+bojJVh
	 QLJJYZBnnROONF12l0s8YGeJ1vmU3LTYtvMiAF7rIlATRaKhrdfgxPC9MbdanoAt0M
	 VSIHXeOtdfE/8nkMCLN9hSMzeulaHGRZShrNbCsw=
Date: Fri, 17 Jul 2026 15:47:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, Keke Li <keke.li@amlogic.com>
Subject: Re: [PATCH 06/19] media: amlogic: c3: isp: drop vb2_queue_release
 calls
Message-ID: <20260717124740.GT1778116@killaraus.ideasonboard.com>
References: <cover.1784276382.git.hverkuil+cisco@kernel.org>
 <23c3158b126781da9437ec8facf153bf95520fc4.1784276382.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <23c3158b126781da9437ec8facf153bf95520fc4.1784276382.git.hverkuil+cisco@kernel.org>

Hi Hans,

Thank you for the patch.

On Fri, Jul 17, 2026 at 10:19:29AM +0200, Hans Verkuil wrote:
> Either that function was called when the video device was not
> yet registered (so nothing to release), or use vb2_video_unregister_device
> instead of the video_unregister_device/vb2_queue_release pair.
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Cc: Keke Li <keke.li@amlogic.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../media/platform/amlogic/c3/isp/c3-isp-capture.c    |  7 ++-----
>  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 11 ++++-------
>  drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c  |  7 ++-----
>  3 files changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c
> index 11d85f5342f0..a0d92ac1b78c 100644
> --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c
> +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c
> @@ -720,7 +720,7 @@ static int c3_isp_register_capture(struct c3_isp_capture *cap)
>  	cap->pad.flags = MEDIA_PAD_FL_SINK;
>  	ret = media_entity_pads_init(&vdev->entity, 1, &cap->pad);
>  	if (ret)
> -		goto err_queue_release;
> +		goto err_destroy;
>  
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
> @@ -733,8 +733,6 @@ static int c3_isp_register_capture(struct c3_isp_capture *cap)
>  
>  err_entity_cleanup:
>  	media_entity_cleanup(&vdev->entity);
> -err_queue_release:
> -	vb2_queue_release(vb2_q);
>  err_destroy:
>  	mutex_destroy(&cap->lock);
>  	return ret;
> @@ -789,9 +787,8 @@ void c3_isp_captures_unregister(struct c3_isp_device *isp)
>  
>  		if (!cap->isp)
>  			continue;
> -		vb2_queue_release(&cap->vb2_q);
>  		media_entity_cleanup(&cap->vdev.entity);
> -		video_unregister_device(&cap->vdev);
> +		vb2_video_unregister_device(&cap->vdev);

Is it safe to change the order of operations here, can't driver code
called from queue release access the media entity ?

Same below.

>  		mutex_destroy(&cap->lock);
>  	}
>  }
> diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> index aec3eed0e443..782f18c90995 100644
> --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> @@ -876,12 +876,12 @@ int c3_isp_params_register(struct c3_isp_device *isp)
>  
>  	ret = vb2_queue_init(vb2_q);
>  	if (ret)
> -		goto err_detroy;
> +		goto err_destroy;
>  
>  	params->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	ret = media_entity_pads_init(&vdev->entity, 1, &params->pad);
>  	if (ret)
> -		goto err_queue_release;
> +		goto err_destroy;
>  
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret < 0) {
> @@ -894,9 +894,7 @@ int c3_isp_params_register(struct c3_isp_device *isp)
>  
>  err_entity_cleanup:
>  	media_entity_cleanup(&vdev->entity);
> -err_queue_release:
> -	vb2_queue_release(vb2_q);
> -err_detroy:
> +err_destroy:
>  	mutex_destroy(&params->lock);
>  	return ret;
>  }
> @@ -905,9 +903,8 @@ void c3_isp_params_unregister(struct c3_isp_device *isp)
>  {
>  	struct c3_isp_params *params = &isp->params;
>  
> -	vb2_queue_release(&params->vb2_q);
>  	media_entity_cleanup(&params->vdev.entity);
> -	video_unregister_device(&params->vdev);
> +	vb2_video_unregister_device(&params->vdev);
>  	mutex_destroy(&params->lock);
>  }
>  
> diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c
> index 8a5d7e1a30c9..78722cbe44b4 100644
> --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c
> +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c
> @@ -279,7 +279,7 @@ int c3_isp_stats_register(struct c3_isp_device *isp)
>  	stats->pad.flags = MEDIA_PAD_FL_SINK;
>  	ret = media_entity_pads_init(&vdev->entity, 1, &stats->pad);
>  	if (ret)
> -		goto err_queue_release;
> +		goto err_destroy;
>  
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
> @@ -292,8 +292,6 @@ int c3_isp_stats_register(struct c3_isp_device *isp)
>  
>  err_entity_cleanup:
>  	media_entity_cleanup(&vdev->entity);
> -err_queue_release:
> -	vb2_queue_release(vb2_q);
>  err_destroy:
>  	mutex_destroy(&stats->lock);
>  	return ret;
> @@ -303,9 +301,8 @@ void c3_isp_stats_unregister(struct c3_isp_device *isp)
>  {
>  	struct c3_isp_stats *stats = &isp->stats;
>  
> -	vb2_queue_release(&stats->vb2_q);
>  	media_entity_cleanup(&stats->vdev.entity);
> -	video_unregister_device(&stats->vdev);
> +	vb2_video_unregister_device(&stats->vdev);
>  	mutex_destroy(&stats->lock);
>  }
>  

-- 
Regards,

Laurent Pinchart
