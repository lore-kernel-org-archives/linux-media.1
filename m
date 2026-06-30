Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D809E3F1676;
	Tue, 30 Jun 2026 13:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825032; cv=none; b=DIrOiI4LWI4xH0Njyg4E8kxGDYWHsYT3P/kcMYhfb2ojtx810T2SCsNSHjX7TYNhLmPjhFbCNFNd907LvQO4eocdXhkvbyxwy1CCI7OcSQrhT8/TQA+vSNic4C5Yexyu3a0E0jqVdoC93cgUj93c/JMKxS49Vii1l8aYxotc8LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825032; c=relaxed/simple;
	bh=OYo8cUh0/f1Urh9HD5WoByGgd80rDTbby76Op0+5XxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvRf0MaBoUQTUgwuEkU1PxWSpt8wJ9oAOi2GBGErRaiLMoSjxmTqSImnczRsvKGlrqtctHHYTrviT/w1kBVJ66Z9RKRDLoBtTQDsDAFDQc4i/imTnNuZeN/FHRFo877I76xhiVFTJVzorsNnOkqvbrSRhxbzGipgkkKiqbDFzgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W210+YiK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W210+YiK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361101F000E9;
	Tue, 30 Jun 2026 13:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782825030;
	bh=wV2WRPiKn/tRfG8aSkMx9ysBri8KCO7r2fEs+yVq8fg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=W210+YiKOcgVbeg9NoxjUPwCckIjf3rXLFhy6UbrTtMkst6JaPqEjJSvTWv5CTXfx
	 +xFq7lB73Td8y8Y4DDAjMfWqEiDC9DALrkDPNcl8euVJcLt3UA/BzZZA23RbRfBt2o
	 xI6TMkVzS8GRECANjWSnnPAUBfta4JXoDXmHPMnu7Mnq34DsiaqeIDUUgxUzag+y+r
	 C/FjmuXsWIho19mA3UXDcKxVv4pou7tLwjrZyvyZ4Gd3mQqGOwmA57me2Ba9jFUXHb
	 43uTpzhaBTkCMRjxzSDs/4RCnCmOBSTxT58Wbqc+qvTGEyTNdUBtcpHL0ENkQsxrBn
	 /yWAmrnrZNWkA==
Message-ID: <fa40ec4d-b51f-482f-a5fc-63c49e9177af@kernel.org>
Date: Tue, 30 Jun 2026 15:10:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Remove unused active field
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260630-uvc-remove-active-v1-1-ed1421b99429@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260630-uvc-remove-active-v1-1-ed1421b99429@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 30-Jun-26 12:28, Ricardo Ribalda wrote:
> The active field in struct uvc_streaming is not used anymore, drop it.
> 
> Reported-by: Hans de Goede <hansg@kernel.org>
> Closes: https://lore.kernel.org/linux-media/20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org/T/#m3078f0d5fd71435b5cfacaa5c99f23a446db581f
> Fixes: c93d73c9c2cf ("media: uvcvideo: Use vb2 ioctl and fop helpers")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_video.c | 2 --
>  drivers/media/usb/uvc/uvcvideo.h  | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index fc3536a4399f..0167f0f8e846 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -2229,8 +2229,6 @@ int uvc_video_init(struct uvc_streaming *stream)
>  		return -EINVAL;
>  	}
>  
> -	atomic_set(&stream->active, 0);
> -
>  	/*
>  	 * Alternate setting 0 should be the default, yet the XBox Live Vision
>  	 * Cam (and possibly other devices) crash or otherwise misbehave if
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b6bcee4a222f..021fd9af78b5 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -456,7 +456,6 @@ struct uvc_streaming {
>  	struct list_head list;
>  	struct uvc_device *dev;
>  	struct uvc_video_chain *chain;
> -	atomic_t active;
>  
>  	struct usb_interface *intf;
>  	int intfnum;
> 
> ---
> base-commit: 253355887a1ab0ac8f33b356c7c1140eee554d18
> change-id: 20260630-uvc-remove-active-8843181bcbb4
> 
> Best regards,

