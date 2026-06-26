Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F07353EC0;
	Fri, 26 Jun 2026 19:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782501789; cv=none; b=ipMxiaHduFL6OrW5McV4W4kmYeNQH9P2nj5xl/V4YmZRPzzvYnqQAjzRltIwPxK2e2qZFuX76vRw3AjbnVjlguPfrldm+xPzr+W8K4KMHC2Nv2Um5RLMNQyjqmdN8kiOJdwo/F5X8Z8PLkGSJ9AIe7320XtbGEWeR7NxWuqHwLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782501789; c=relaxed/simple;
	bh=QDwsxGnWpoA4///a4vr8Atk6hktnaX/1YIhMVC1/C3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpnmuR9jPMb7r+TBt3kFXImMoc8anUXR67ir0CCDxzdPdGyUsguOLIKxl+8K2EaVkpoSd18WgLllsxeQ7LcBJbhM4mpxdR6Z0vGQJctaEBr4Z+8I+PfMiehFB7usK4L0xL/4DOwfXlWy847T4FW+TlzXhAzg/+G8KQMQOUlHPMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XkGMZJP1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XkGMZJP1"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2E221E7;
	Fri, 26 Jun 2026 21:22:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782501737;
	bh=QDwsxGnWpoA4///a4vr8Atk6hktnaX/1YIhMVC1/C3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XkGMZJP1SH1wSx35/tcY23nTvbm+rUr3W4sqbr2DeFTjPd/p93qEzDy4VQLceyYhI
	 MJdd2yUckkMcP8Oa/i7KCK7TYhLW/KF95WdyUi6qEgJ1nXpgJyN12kPxJfrGATgked
	 PB72xVXsBn88hpXs2djTQc3sQpGXCc2QJKxshmz4=
Date: Fri, 26 Jun 2026 22:22:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shih-Sheng Yang <yshihsheng@gmail.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org, kees@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-dev: fix media controller registration error
 handling
Message-ID: <20260626192257.GA2894880@killaraus.ideasonboard.com>
References: <20260625193916.3562596-1-yshihsheng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625193916.3562596-1-yshihsheng@gmail.com>

On Fri, Jun 26, 2026 at 03:39:16AM +0800, Shih-Sheng Yang wrote:
> __video_register_device() registers the media-controller entity and
> interface after cdev_add() and device_register().
> 
> The return value from video_register_media_controller() is currently
> ignored. If media_devnode_create() fails, vdev->intf_devnode remains
> NULL, but the video device is still marked as registered and the caller
> sees a successful registration. A later video_unregister_device() reaches
> v4l2_device_release(), which calls media_devnode_remove() and
> dereferences that NULL pointer.
> 
> If media_create_intf_link() fails, the helper removes
> vdev->intf_devnode but leaves the stale pointer behind. A later release
> path may then try to remove it again.
> 
> Fix this by propagating video_register_media_controller() failures from
> __video_register_device(). Also make the media-controller cleanup path
> tolerate partially-created state by clearing vdev->intf_devnode after
> removal and checking it before release-time removal.
> 
> Signed-off-by: Shih-Sheng Yang <yshihsheng@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 6ce623a1245a..5d2faed002a7 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -203,7 +203,10 @@ static void v4l2_device_release(struct device *cd)
>  #if defined(CONFIG_MEDIA_CONTROLLER)
>  	if (v4l2_dev->mdev && vdev->vfl_dir != VFL_DIR_M2M) {
>  		/* Remove interfaces and interface links */
> -		media_devnode_remove(vdev->intf_devnode);
> +		if (vdev->intf_devnode) {
> +			media_devnode_remove(vdev->intf_devnode);

I'd move the NULL check to media_devnode_remove() and make this call
unconditionally.

If we want to harden this more, media_devnode_remove() could take a
struct media_intf_devnode **devnode parameters, and set

	*devnode = NULL;

after freeing it. This is not a common pattern in the media subsystem
though, but we may benefit from adopting it.

> +			vdev->intf_devnode = NULL;
> +		}
>  		if (vdev->entity.function != MEDIA_ENT_F_UNKNOWN)
>  			media_device_unregister_entity(&vdev->entity);
>  	}
> @@ -896,6 +899,7 @@ static int video_register_media_controller(struct video_device *vdev)
>  					      MEDIA_LNK_FL_IMMUTABLE);
>  		if (!link) {
>  			media_devnode_remove(vdev->intf_devnode);
> +			vdev->intf_devnode = NULL;
>  			media_device_unregister_entity(&vdev->entity);
>  			return -ENOMEM;
>  		}
> @@ -1087,6 +1091,11 @@ int __video_register_device(struct video_device *vdev,
>  
>  	/* Part 5: Register the entity. */
>  	ret = video_register_media_controller(vdev);
> +	if (ret < 0) {
> +		mutex_unlock(&videodev_lock);
> +		put_device(&vdev->dev);

Where's the device unregistration ?

> +		return ret;
> +	}
>  
>  	/* Part 6: Activate this minor. The char device can now be used. */
>  	set_bit(V4L2_FL_REGISTERED, &vdev->flags);

-- 
Regards,

Laurent Pinchart
