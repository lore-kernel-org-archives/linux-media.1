Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E053F823C
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 12:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784292075; cv=none; b=TlPib2BwqnZj7UNNUzRX3evpvK3mjIYxnSDi+JJBSEuMG6cAgKyNDPoUKlb310szXISdlGcJj0qmOKLeQg1vGcjmjWw92xw5rjwvlbSh8B1/0MhZ+lKAtpJ/QItC5VR9GuzwWheNfpKXAvwkIdZ2tQnaWKrrC5Qjh0r2PKjEIp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784292075; c=relaxed/simple;
	bh=u1DtGi3XWo3iXDeNVgg++VXJDhiGxmQ6aYP0X9cMfqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D72m9aMIGnpi1FfIunOnwzXXai+mqLni2RETZqAlDM1Ap2dVKGb8n84flYSGYEv51/BrEnqd4c0mxvPY0r4BcS4mOxkjva2u03brar+MuOZXWFZK6JzbfKtsV5mcUrGK4+gSalRAtPv9ez8zn9feuPjg6/Hk2jj98wx/MUvv5TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qw4WouAS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qw4WouAS"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29851267;
	Fri, 17 Jul 2026 14:40:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784292015;
	bh=u1DtGi3XWo3iXDeNVgg++VXJDhiGxmQ6aYP0X9cMfqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qw4WouASoIRFHj+kbyZT4jg4Fr83dC2z5ZgkM3mQUo8LM8Yua6eMgt8l5r11E4kk1
	 zue5U1gPwEF6oIL/nOCc5iOipmhqREWc6Ow0KAVtkOgbSAOcazL8gprQJrKilxScLV
	 b0XXoXcxMGVGZbPfxU4lgtvjYn/Lw5dKIGNKBSSg=
Date: Fri, 17 Jul 2026 15:41:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 11/19] media: nxp: imx7-media-csi: use
 _vb2_fop_release/vb2_video_unregister_device
Message-ID: <20260717124110.GS1778116@killaraus.ideasonboard.com>
References: <cover.1784276382.git.hverkuil+cisco@kernel.org>
 <b782f0db9e0521f97f001d71e3acdc0bc610b066.1784276382.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b782f0db9e0521f97f001d71e3acdc0bc610b066.1784276382.git.hverkuil+cisco@kernel.org>

On Fri, Jul 17, 2026 at 10:19:34AM +0200, Hans Verkuil wrote:
> Use _vb2_fop_release instead of manually calling vb2_queue_release
> and v4l2_fh_release.
> 
> Use vb2_video_unregister_device instead of video_unregister_device
> to ensure vb2_queue_release is called inside vb2_video_unregister_device
> if needed.

Please expand on the "if needed" to explain why this is needed.

> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 7ddc7ba06e3d..eb2b54944ed1 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1545,14 +1545,10 @@ static int imx7_csi_video_release(struct file *file)
>  
>  	mutex_lock(&csi->vdev_mutex);
>  
> -	if (file->private_data == vq->owner) {
> -		vb2_queue_release(vq);
> -		vq->owner = NULL;
> -	}
> +	_vb2_fop_release(file, NULL);
>  
>  	v4l2_pipeline_pm_put(&csi->vdev->entity);
>  
> -	v4l2_fh_release(file);

You're effectively inverting the order of v4l2_pipeline_pm_put() and
v4l2_fh_release(). Please explain in the commit message why this is
safe.

Commit messages need first and foremost to explain *why* a change is
needed. The *what* and *how* are secondary.

>  	mutex_unlock(&csi->vdev_mutex);
>  	return 0;
>  }
> @@ -1627,7 +1623,7 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
>  				    MEDIA_LNK_FL_ENABLED);
>  	if (ret) {
>  		dev_err(csi->dev, "failed to create link to device node\n");
> -		video_unregister_device(vdev);
> +		vb2_video_unregister_device(vdev);
>  		return ret;
>  	}
>  
> @@ -1637,7 +1633,7 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
>  static void imx7_csi_video_unregister(struct imx7_csi *csi)
>  {
>  	media_entity_cleanup(&csi->vdev->entity);
> -	video_unregister_device(csi->vdev);
> +	vb2_video_unregister_device(csi->vdev);
>  }
>  
>  static int imx7_csi_video_init(struct imx7_csi *csi)

-- 
Regards,

Laurent Pinchart
