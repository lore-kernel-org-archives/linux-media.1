Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAA7435520;
	Tue, 28 Jul 2026 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241662; cv=none; b=MNb2C7BZnZRXCa0G+wRXQJM2LUwAVY6ZQNDq+DJuNDx8nY0TXKInLnO9WsGH0rpGBtRTrmuQxhWvY+0ooKuRbcBnRgGGQMQuKq5SASiEn2HduEzdrBylqLZMsx6KOn1i5d+zSqe0EsUPz8oaXiZOsTHcvBOtUyGpW9tjqnQ/Bwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241662; c=relaxed/simple;
	bh=skNwBeM0xhdzodG09om1zJMxkK9//R0aOwypLLXtBLw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IMcGFUlHAPljfcSMTZ937JbhUEPIW4oSf9sonH2FiWPG6Tsn6umUrTPy4b664dPLbZlnczUP1oux4puYJ2hGaEcg7fa1UYewYH8GKfiE7/RyHscCQ2w42QZ3dse/NCrnFlYXfaM9H+Ins6L3aQh2Flh8sQOZ51/x7CcM559VUhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKbDqTqh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKbDqTqh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F5C1F000E9;
	Tue, 28 Jul 2026 12:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785241658;
	bh=5YG3ruB6nyVV77DSV8ACxVj8DWtTrgBc+2lCxM0N0ZY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=VKbDqTqh7AP/jCw/GBMmwWeJMu3g4ZBe0qeWhfIEr8IrvAHJVPQ4oD0baLuUHTxE5
	 QPICmJO1RMG4uFg5Oh2EsUDJvPK7vDMVBtjcvD5JTBqYKSOsek0l8dagzLqsl77zwU
	 c+/kZfIu2VjD62HBs4ULkjeMW6XnWwH5dDqgB/PSa+XVHvYP+6YtqV0B3gGupedJ+I
	 k/WzYJBpKE4snr64/QGuLrtnrZM4xRV+OCkJOs2IxZ540L7XgfSVy427yeX63yCWd6
	 BS1Gs8R90ux8MPgwtIicuuS5d6Eupl4dRnp2CDDq+l07Oq99At/82eoHJM782r7Gta
	 kk2ybKuqQQ/Tw==
Message-ID: <ae9de4f1-5803-4ab8-9d68-939cc049fa2f@kernel.org>
Date: Tue, 28 Jul 2026 14:27:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hverkuil+cisco@kernel.org
Subject: Re: [PATCH v2] media: v4l2-dev: fix media controller registration
 error handling
To: Shih-Sheng Yang <yshihsheng@gmail.com>, mchehab@kernel.org
Cc: kees@kernel.org, laurent.pinchart+renesas@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260630095840.1749448-1-yshihsheng@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260630095840.1749448-1-yshihsheng@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/06/2026 11:58, Shih-Sheng Yang wrote:
> __video_register_device() ignores failures from
> video_register_media_controller(). If media_devnode_create() fails,
> vdev->intf_devnode remains NULL but the video device is still marked as
> registered. A later video_unregister_device() reaches
> v4l2_device_release(), which calls media_devnode_remove() and
> dereferences the NULL pointer.
> 
> If media_create_intf_link() fails, video_register_media_controller()
> removes vdev->intf_devnode but leaves the stale pointer behind.
> 
> Fix this by propagating video_register_media_controller() failures from
> __video_register_device(). Since device_register() has already
> succeeded, unwind the device with device_unregister(). Also make
> media_devnode_remove() tolerate NULL devnodes and clear
> vdev->intf_devnode after removing it in the link failure path.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Shih-Sheng Yang <yshihsheng@gmail.com>
> ---
> v1: https://lore.kernel.org/r/20260625193916.3562596-1-yshihsheng@gmail.com
> 
> Changes in v2:
> - Move the NULL check to media_devnode_remove().
> - Use device_unregister() after device_register() has succeeded.
> - Keep clearing vdev->intf_devnode in the link failure path.
> 
>  drivers/media/mc/mc-entity.c       | 3 +++
>  drivers/media/v4l2-core/v4l2-dev.c | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 3fa0bc687851..79f55375e9d6 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1563,6 +1563,9 @@ EXPORT_SYMBOL_GPL(media_devnode_create);
>  
>  void media_devnode_remove(struct media_intf_devnode *devnode)
>  {
> +	if (!devnode)
> +		return;
> +
>  	media_remove_intf_links(&devnode->intf);
>  	media_gobj_destroy(&devnode->intf.graph_obj);
>  	kfree(devnode);
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 5516b2bbb08f..56b51d5d49ae 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -896,6 +896,7 @@ static int video_register_media_controller(struct video_device *vdev)
>  					      MEDIA_LNK_FL_IMMUTABLE);
>  		if (!link) {
>  			media_devnode_remove(vdev->intf_devnode);
> +			vdev->intf_devnode = NULL;
>  			media_device_unregister_entity(&vdev->entity);
>  			return -ENOMEM;
>  		}
> @@ -1092,6 +1093,11 @@ int __video_register_device(struct video_device *vdev,
>  
>  	/* Part 5: Register the entity. */
>  	ret = video_register_media_controller(vdev);
> +	if (ret < 0) {
> +		mutex_unlock(&videodev_lock);
> +		device_unregister(&vdev->dev);

This causes problems. See this series for more information:

https://patchwork.linuxtv.org/project/linux-media/list/?series=27907

I think it is better to limit yourself to just setting vdev->intf_devnode
to NULL and checking for a NULL pointer in media_devnode_remove().

As mentioned in that series, this function really needs to be split into
two parts. But that's a much larger effort.

There is just a lot of history here, and no easy fix.

Regards,

	Hans

> +		return ret;
> +	}
>  
>  	/* Part 6: Activate this minor. The char device can now be used. */
>  	set_bit(V4L2_FL_REGISTERED, &vdev->flags);

