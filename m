Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D5C2BE62E;
	Mon, 16 Mar 2026 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773661995; cv=none; b=h0L5ViOP2gLFppfP2lCxipbw7V+39zXUjqRrLDiJGexaJIlicwzyuvHdnGesmeZjsBJMg3R6qJYxCfrhFobVaAMZ0BGWQb0QJtZ14u0hiB6MF4LcRp7ro9oPvT27IYcpJD1d79wGhXRnck3GZGl0ekPBKJVqf6oREwN6KunNXNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773661995; c=relaxed/simple;
	bh=GSX7mMS1tW+ieBVU2jvNwZNax1JG7ubf99IRKkQwP8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3muxnkcpZ33UzRvKJmLKJxoVZs3yUqLminNWuC6N09JpL4On/u1YkJz8s38v1iKc7ldALGA9HHbtRXW/Ki5+ocKJJeu4RWKlMVkDaZ03cT16xsBzJwgKO9uxW+slesNKhoSjRwgF2cQBL87vn84pxXBU2fvF8i2yEjxpu3yNRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8VZ9/Cm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8VZ9/Cm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8C5C19421;
	Mon, 16 Mar 2026 11:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773661995;
	bh=GSX7mMS1tW+ieBVU2jvNwZNax1JG7ubf99IRKkQwP8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L8VZ9/Cm/OLpD4VjXU0BCDz+gZJWsZ98rZPKhahvZHbm1lXrpPXq3hnIqMlMHMtgN
	 bevrf7iYd9pgXCrld9lFJTnYWOJ2c1+GTy0qAzEvWQQZTIwjnwrMwgHe2ka2FpYYXW
	 SmVelNgc58IcFRps2E50l787wTvzKzkRFts3GY82qCjqpbyPRtKqZNmvc0FwROKvsu
	 EfTbWjXVyUc5slg3bDECEDFVn7zi1r/yxVWfG98Mm2n9uM7w31CxHr1pxZBEUe6Ao+
	 5H5GrmzWy9FkAHa/A5EbGqH9aYuX6ztzNA0jPLvA2ocLm1MIgJ7ssrT7FXv5jXuOqU
	 SHRvJvEiUAwTQ==
Message-ID: <e82689ce-ebc7-4413-ae24-30328329749d@kernel.org>
Date: Mon, 16 Mar 2026 12:53:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: uvcvideo: Allow userspace to increase the meta
 buffersize
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yunke Cao <yunkec@google.com>
References: <20260309-uvc-metadata-dmabuf-v1-0-fc8b87bd29c5@chromium.org>
 <20260309-uvc-metadata-dmabuf-v1-3-fc8b87bd29c5@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260309-uvc-metadata-dmabuf-v1-3-fc8b87bd29c5@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Mar-26 4:01 PM, Ricardo Ribalda wrote:
> Now we have the metadata size hardcoded to 10 KiB, this is a value that
> works fine for bulk cameras or frames with no extra metadata. But not
> for all usecases.
> 
> We have seen some cameras that produce more metadata per frame. Eg:
> Frame 1 captured (Bytes: 11154)
> Frame 2 captured (Bytes: 11616)
> Frame 3 captured (Bytes: 11374)
> Frame 4 captured (Bytes: 11132)
> Frame 5 captured (Bytes: 11594)
> Frame 6 captured (Bytes: 11352)
> Frame 7 captured (Bytes: 11110)
> Frame 8 captured (Bytes: 11572)
> Frame 9 captured (Bytes: 11308)
> 
> When this happens, the driver (correctly) marks the metadata as ERROR.
> 
> This patch let userspace set bigger buffersize via S_FMT.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> ---
>  drivers/media/usb/uvc/uvc_metadata.c | 9 +++++++--
>  drivers/media/usb/uvc/uvc_queue.c    | 2 +-
>  drivers/media/usb/uvc/uvcvideo.h     | 3 ++-
>  3 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 0a906ae3f971..9de8aba1229e 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -50,7 +50,7 @@ static int uvc_meta_v4l2_get_format(struct file *file, void *priv,
>  		return -EINVAL;
>  
>  	fmt->dataformat = stream->meta.format;
> -	fmt->buffersize = UVC_METADATA_BUF_SIZE;
> +	fmt->buffersize = stream->meta.buffersize;
>  
>  	return 0;
>  }
> @@ -63,6 +63,7 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *priv,
>  	struct uvc_device *dev = stream->dev;
>  	struct v4l2_meta_format *fmt = &format->fmt.meta;
>  	u32 fmeta = V4L2_META_FMT_UVC;
> +	u32 buffersize;
>  
>  	if (format->type != vfh->vdev->queue->type)
>  		return -EINVAL;
> @@ -74,10 +75,12 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *priv,
>  		}
>  	}
>  
> +	buffersize = max(UVC_METADATA_BUF_MIN_SIZE, fmt->buffersize);
> +
>  	memset(fmt, 0, sizeof(*fmt));
>  
>  	fmt->dataformat = fmeta;
> -	fmt->buffersize = UVC_METADATA_BUF_SIZE;
> +	fmt->buffersize = buffersize;
>  
>  	return 0;
>  }
> @@ -103,6 +106,7 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *priv,
>  		return -EBUSY;
>  
>  	stream->meta.format = fmt->dataformat;
> +	stream->meta.buffersize = fmt->buffersize;
>  
>  	return 0;
>  }
> @@ -229,6 +233,7 @@ int uvc_meta_register(struct uvc_streaming *stream)
>  	struct uvc_video_queue *queue = &stream->meta.queue;
>  
>  	stream->meta.format = V4L2_META_FMT_UVC;
> +	stream->meta.buffersize = UVC_METADATA_BUF_MIN_SIZE;
>  
>  	return uvc_register_video_device(dev, stream, queue,
>  					 V4L2_BUF_TYPE_META_CAPTURE,
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index 68ed2883edb2..89206f761006 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -83,7 +83,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  
>  	switch (vq->type) {
>  	case V4L2_BUF_TYPE_META_CAPTURE:
> -		size = UVC_METADATA_BUF_SIZE;
> +		size = stream->meta.buffersize;
>  		break;
>  
>  	default:
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 9b4849fda12f..5ba698d2a23d 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -409,7 +409,7 @@ struct uvc_stats_stream {
>  	unsigned int max_sof;		/* Maximum STC.SOF value */
>  };
>  
> -#define UVC_METADATA_BUF_SIZE 10240
> +#define UVC_METADATA_BUF_MIN_SIZE 10240
>  
>  /**
>   * struct uvc_copy_op: Context structure to schedule asynchronous memcpy
> @@ -482,6 +482,7 @@ struct uvc_streaming {
>  	struct {
>  		struct uvc_video_queue queue;
>  		u32 format;
> +		u32 buffersize;
>  	} meta;
>  
>  	/* Context data used by the bulk completion handler. */
> 

