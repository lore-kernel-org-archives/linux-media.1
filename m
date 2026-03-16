Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB311ACEDE;
	Mon, 16 Mar 2026 11:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773661648; cv=none; b=JWy5LMCTlvVEcgliDdLspKTigp6S0qozGoYEsvmunaqxntmA9+bjBypg2w5T2kzGC3OzkNRKZXPocW7rNnmReq4DDk+0nhcKo3ZrOkjtDj43uxEDyovtI6HgC8k0NQ2UhZkCrGo3+J141niRleRdOuV0sdrAlAEpLnrB58ecicc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773661648; c=relaxed/simple;
	bh=av+7z0mXyWtCSHRnkciprE6M07LpBQLUpNtFVLfrUAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cY9y+olfmScmI4BEXFTFRLbKu6SsRgBnIsWWjDsg5KIEYDWGvr4kcgIDpdo5ZMBEygwUa7qMyVgoRkgt2gqdcJFpUjpVY5nOkHukX/3zKYgTl+XopVDOXUrhZmNzTEhEZvahgOAK8SqacyT5Wn4qNNnfjJgBgHdyyGwOa5crljU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p16Nraxy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p16Nraxy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1A7C19421;
	Mon, 16 Mar 2026 11:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773661648;
	bh=av+7z0mXyWtCSHRnkciprE6M07LpBQLUpNtFVLfrUAg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p16Nraxy/pspvcMbyQg7yBMIBXWV0Hf9vFFoql6vzRWVfgFqeZW2H21XsMMOlO5+W
	 1RbDzEv81h95sSQnh8rcanik1MSqrJph0lFqRgaCbEj8jyJIyFjELidwI+fDHYPb+W
	 KhdqXjWo6tnv7PlrzEbwtWhv+WDafTiNds7IEZSkgqz52KeJQkfWsmQ+37IipUZewp
	 okgv6q4pt50PatDGQP+5AhvkD7LBIpFaN/KxOWJUAa+2ribwWXG4dBeHe3mLZcUm4P
	 kyo+jjYCKhEPyhPm5qHghhVp/uEwhvi3WEgoeN1wQzZomeij2uNRXMTYWxZtccTdcL
	 IuQXJ5ZtGUaqA==
Message-ID: <ae6e15c9-2004-4509-86d4-360ddb59af09@kernel.org>
Date: Mon, 16 Mar 2026 12:47:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: uvcvideo: Enable VB2_DMABUF for metadata
 stream
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yunke Cao <yunkec@google.com>, stable@vger.kernel.org
References: <20260309-uvc-metadata-dmabuf-v1-0-fc8b87bd29c5@chromium.org>
 <20260309-uvc-metadata-dmabuf-v1-1-fc8b87bd29c5@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260309-uvc-metadata-dmabuf-v1-1-fc8b87bd29c5@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Mar-26 4:01 PM, Ricardo Ribalda wrote:
> The UVC driver has two video streams, one for the frames and another one
> for the metadata. Both streams share most of the codebase, but only the
> data stream declares support for DMABUF transfer mode.
> 
> I have tried the DMABUF transfer mode with CONFIG_DMABUF_HEAPS_SYSTEM
> and the frames looked correct.
> 
> This patch announces the support for DMABUF for the metadata stream.
> This is useful for apps/HALs that only want to support DMABUF.
> 
> Cc: stable@vger.kernel.org
> Fixes: 088ead2552458 ("media: uvcvideo: Add a metadata device node")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_queue.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index 8b8f44b4a045..0eddd4f872ca 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -243,7 +243,7 @@ int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
>  	int ret;
>  
>  	queue->queue.type = type;
> -	queue->queue.io_modes = VB2_MMAP | VB2_USERPTR;
> +	queue->queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
>  	queue->queue.drv_priv = queue;
>  	queue->queue.buf_struct_size = sizeof(struct uvc_buffer);
>  	queue->queue.mem_ops = &vb2_vmalloc_memops;
> @@ -256,7 +256,6 @@ int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
>  		queue->queue.ops = &uvc_meta_queue_qops;
>  		break;
>  	default:
> -		queue->queue.io_modes |= VB2_DMABUF;
>  		queue->queue.ops = &uvc_queue_qops;
>  		break;
>  	}
> 

