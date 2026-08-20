Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA06D47D930
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 16:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787244721; cv=pass; b=A9AqEmJV6BtGWUq1DjvSzFQmy6Qz/YN8wzaqIg8YHdqtwum/xbA3KJPTnlV/CKL0Ias5tqv2gmRAGphachbPkdqb3EuE4cgeDkT89fJZC+ro19ifu1h7dxp2vLXBrZ1J9AJ6APKua2Xr3XNfkpl05Edxoi722kWlYnp8c9jihDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787244721; c=relaxed/simple;
	bh=yyOHGz7RXXVC57xoRkoaTFCBjwkuyt6at/OQqRYbakg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FlWsodfTUfRbu9LGb6LAN8bVsnC80lXeJ1Ek+ZvaYi8MZ+5WJ4/f6KhtDG+D6QhRko+uX6r3GkK/Fpq7CmYC/egaJlLDPPIhvaBM4wibwoXOdID7fTJWsqEFQsCfwelx7Ut0f/ThyeDn0fQuV8YbMIzo6/MSUH3HtT+dzQJlgJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk; spf=pass smtp.mailfrom=kynesim.co.uk; dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b=XjUBKzmz; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b="XjUBKzmz"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-836c8bdac50so1786287b3.0
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 09:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787244718; cv=none;
        d=google.com; s=arc-20260327;
        b=PglihK8nUEOuYkEf58XO6QmcMmVLCTIbiHHbwO+igyMEyr9Q3h40QID6pO89jxEf1z
         aF3DAGXBsF9HI9Yd6l3C1zCBcasiGPXiDl2yI1lgtV0r7xy2ISnxgOvwOuBcZjB/ZYk+
         /vpeb8/tHq+RiMX9EkzfvmYzk+kt5qXp2/CksOcwSmWXfCcUZVt/j/UtwYqTbiZ35iV7
         okkXcuV97DhOzMqV7cxVFle98LUl8s2ILnUGr6eyBeXN5hB+Wlf4KXjhBxk19KC4vJKH
         6+RHCt9mNaPVuo9Wel+hM7Y62jdzOBkse2QtezG2WRgxZ3pWyAJ87uFAtO5QITuVo2I6
         O8cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=akmJEAxXxvOvCDET//elsxAbX/pgqZ+J1NNSEmRTcEk=;
        fh=3v08Ty92Zsamfh4RsyoGhL6h2U/H4JAQBapWaAkpOEc=;
        b=U01aeJnlP0UtvDnj9vrbD3lkCAivaBHhfZYA4yti4QqlpVqsA1L0WbhrFOkIX68Ny4
         q5zk3c6JsMxPBLFyRrNxVWKPkPA5hCtmo8F4LTZzYa1KxFajtXn8W5iNL/h1hkSTU1Bl
         Fg3Rws+EATlaCTBd/C3DlAxDiaNVMp/0jk4KH/7Hkwvv3XlWn6wYiGzMQd9Hc3lYclN/
         Qisg2MRNP+gaact6/Iwpt6ch6DkUPyvuhovARCI8SrfT5n0sMMFo5rwBFVDYtXv2CKZa
         4zx2bkTzcvYaUaAhW+tsmOBsCX4LibNJHfMM1RYNcdgVd3+o5io/uHj4tJxK//RKu1jq
         0nPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1787244718; x=1787849518; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akmJEAxXxvOvCDET//elsxAbX/pgqZ+J1NNSEmRTcEk=;
        b=XjUBKzmzBtBfnto0Gvrxww3xU8fl4eB0gF5+mrdFpR09O4Ut19JsWlP3M/qbhibX3E
         YadnlsJgEq6nGWzuxTyu1sWKWfxTWdWdRe11YpBBMtxMkZEECKd0Z0CxAAyxXSB1LUMz
         1Qn7++JxcKZnC/t4wemZwNpA9H9W0585/N7fkzMOG6BrV6/1CoEV8p3AONDi++ltU/st
         G0XJA3Ss7GZjxMaKXJDvKvQ3uIF1tg/7w4fxYSTQQGMFUwLMJnEfgvgC4eNMh9OVMZ1a
         h0c1o4ks7zPxA0LsfS2VNzHfIeYsGnNmkmJNqJgf2/lABzZcR93L77wIFLfX0TSJUPBV
         gNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787244718; x=1787849518;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akmJEAxXxvOvCDET//elsxAbX/pgqZ+J1NNSEmRTcEk=;
        b=jkQWy96KqsWSOJM0EAyLF+xiU/VltKe4ZqtX64Imq1CkNPDynlfLEsX9Nqw9ce0OUO
         kG4PMrk8qIbAPaBuh0KablLk/uJzLOQswPzjVpI6HxX1tLF/AV6GbN3AnOQviCHhEtKz
         NrEeaLkdbsyywR3u8r8Z3DHW6h2OatCIuMRxAnrnDd7nePn1xpL8rJk3mLjvJKLriEsG
         VfH2qCM4nmsnEpmWkHBKr6ZEyhXP428f0zfEfMogdVaM/b0zTZhxPA1jwL1So7bwr/GL
         40TjjPmEEak7hn0fEZXsjKM0BtvBxmMidsxJYcN+2CPuH3koq8JnBtROKAv9ZpCUVSLJ
         EYhQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDxx5NV30b9qlnMSG4B95RALhmjq1T1Ji/hI1Vj6BLKKHFItuB9jQ1C3YNVKY4YZD0OwGSuyXJeEeVkA==@vger.kernel.org
X-Gm-Message-State: AFuF++mc/qzwTagR7qXNODuT/8U12Wi5kXPt62JZxWEmBycVaooRBR8S
	VIuwu6aq/sHuU0E4qLXsDpIL2uPVmNHj3awjzqhCOjlg80wMC42TaKzrOp9uNyjyALUG4v3u4Xc
	O1kG+NxZo7x8xT0FNdRLo1qp2VkMLpzHeSAFV33EwNA==
X-Gm-Gg: AR+sD10lPRAYjqfOqhcfpKnpaaR0Nzfm6VhmZOA6ia0B/YEyOt4o2/sPnpJ/8g/ISIj
	/P7ffrH6SVCTsSaEDvnMqKhPG9M9sfrK/oIm1p/+ti5dr9u4wOxESifLpTVG64LUvOdKYpFdo8I
	8JF2Sw25uRRsnK7Bg49HkJedfxOaf4VA3v70IivM6B37ygS5GspL8QJwTn2ECSrSCf7N0ocsBa5
	gTyMxXNxjpvRDnU97RmuFeLWlue4tqDbemzDPmkWdAGXKaffEacXkrw3ATjUCWdwpIx6UEQYudm
	F8WjccCq4dZmJOnDvofcmxRWFftPtkU0m3rJh1psvy3czLvUzLMi+g==
X-Received: by 2002:a05:690c:60c3:b0:820:a7c:7495 with SMTP id
 00721157ae682-844dd143d1cmr56304437b3.3.1787244717686; Thu, 20 Aug 2026
 09:51:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
 <20250724-multicontext-mainline-2025-v2-5-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-5-c9b316773486@ideasonboard.com>
Reply-To: jc@kynesim.co.uk
From: John Cox <jc@kynesim.co.uk>
Date: Thu, 20 Aug 2026 17:51:43 +0100
X-Gm-Features: AcwNN1WwQTxs0WjtTh8s7fQQFsbKA65xSEl5vJQyrVwbh2jI5dFisjCf1lLZEIo
Message-ID: <CAFyCYyM=WaDwVZY5yCYkpbF1psckzRLs_arJfWBu28sS8uy3GQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/27] media: v4l2-dev: Introduce video device context
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Introduce a new type in video-device that represents a video device
> context. It extends 'struct media_entity_context' to include
> video-device specific data and configuration. The new type is intended
> to be extended by drivers that can store driver-specific information
> in their video device derived types.
>
> The next patch will introduce the VIDIOC_BIND_CONTEXT ioctl that allows
> to create a video device context and uniquely associate it with a media
> context.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c |  43 +++++++++++++
>  include/media/v4l2-dev.h           | 126 +++++++++++++++++++++++++++++++++++++
>  include/media/v4l2-fh.h            |   3 +
>  3 files changed, 172 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index c369235113d98ae26c30a1aa386e7d60d541a66e..c83c37843c9e7beb899a4b2bd176273c3dec381b 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1200,6 +1200,49 @@ struct media_pipeline *video_device_pipeline(struct video_device *vdev)
>  }
>  EXPORT_SYMBOL_GPL(video_device_pipeline);
>
> +struct video_device_context *
> +video_device_context_get(struct media_device_context *mdev_context,
> +                        struct video_device *vdev)
> +{
> +       struct media_entity *entity = &vdev->entity;
> +       struct media_entity_context *ctx =
> +               media_device_get_entity_context(mdev_context, entity);
> +
> +       if (!ctx)
Needs to be IS_ERR_OR_NULL(ctx)

Regards

John Cox

> +               return NULL;
> +
> +       return container_of(ctx, struct video_device_context, base);
> +}
> +EXPORT_SYMBOL_GPL(video_device_context_get);
> +
> +void video_device_context_put(struct video_device_context *ctx)
> +{
> +       if (!ctx)
> +               return;
> +
> +       media_entity_context_put(&ctx->base);
> +}
> +EXPORT_SYMBOL_GPL(video_device_context_put);
> +
> +int video_device_init_context(struct video_device *vdev,
> +                             struct video_device_context *ctx)
> +{
> +       media_entity_init_context(&vdev->entity, &ctx->base);
> +
> +       ctx->vdev = vdev;
> +       mutex_init(&ctx->queue_lock);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(video_device_init_context);
> +
> +void video_device_cleanup_context(struct video_device_context *ctx)
> +{
> +       mutex_destroy(&ctx->queue_lock);
> +       media_entity_cleanup_context(&ctx->base);
> +}
> +EXPORT_SYMBOL_GPL(video_device_cleanup_context);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  /*
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index a69801274800f4f9add723b51fe0a31331e88f97..9276e095fb17414a9eb7845db0aa81572c42ca45 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -18,6 +18,7 @@
>  #include <linux/videodev2.h>
>
>  #include <media/media-entity.h>
> +#include <media/videobuf2-core.h>
>
>  #define VIDEO_MAJOR    81
>
> @@ -660,6 +661,131 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
>   */
>  struct media_pipeline *video_device_pipeline(struct video_device *vdev);
>
> +/**
> + * struct video_device_context - The video device context
> + * @base: The media entity context base class member
> + * @vdev: The video device this context belongs to
> + * @queue_lock: Protects the vb2 queue
> + * @queue: The vb2 queue
> + *
> + * This structure represents an isolated execution context of a video device.
> + * This type 'derives' the base 'struct media_entity_context' type which
> + * implements refcounting on our behalf and allows instances of this type to be
> + * linked in the media_device_context contexts list.
> + *
> + * By storing the data and the configuration of a video device in a per-file
> + * handle context, userspace is allowed to multiplex the usage of a single video
> + * device devnode by opening it multiple times and by associating it with a
> + * media device context. This operation is called 'bounding' and is performed
> + * using the VIDIOC_BIND_CONTEXT ioctl.
> + *
> + * A video device context is created and stored in the v4l2-fh file handle
> + * associated with an open file descriptor when a video device is 'bound' to a
> + * media device context. The 'bounding' operation realizes a permanent
> + * association valid until the video device context is released.
> + *
> + * A video device can be bound to the same media device context once only.
> + * Trying to bind the same video device to the same media device context a
> + * second time, without releasing the already established context by closing the
> + * bound file descriptor first, will result in an error.
> + *
> + * To create a video device context userspace shall use the VIDIOC_BIND_CONTEXT
> + * ioctl that creates the video device context and uniquely associates it with a
> + * media device file descriptor.
> + *
> + * Once a video device file descriptor has been bound to a media device context,
> + * all the operations performed on the video device file descriptor will be
> + * directed on the just created video device context. This means, in example,
> + * that the video device format and the buffer queue are isolated from the ones
> + * associated with a different file descriptor obtained by opening again the
> + * same video device devnode but bound to a different media device context.
> + *
> + * Drivers that implement multiplexing support have to provide a valid
> + * implementation of the context-related operations in the
> + * media entity operations.
> + *
> + * Drivers are allowed to sub-class the video_device_context structure by
> + * defining a driver-specific type which embeds a struct video_device_context
> + * instance as first member, and allocate the driver-specific structure size in
> + * their implementation of the `alloc_context` operation.
> + *
> + * Video device contexts are ref-counted by embedding an instance of 'struct
> + * media_entity_context' and are freed once all the references to it are
> + * released.
> + *
> + * A video device context ref-count is increased when:
> + * - The context is created by bounding a video device to a media device context
> + * - The media pipeline starts streaming
> + * A video device context ref-count is decreased when:
> + * - The associated file handle is closed
> + * - The media pipeline stops streaming
> + *
> + * The ref-count is increased by a call to video_device_context_get() and is
> + * reponsibility of the caller to decrease the reference count with a call to
> + * video_device_context_put().
> + */
> +struct video_device_context {
> +       struct media_entity_context base;
> +
> +       struct video_device *vdev;
> +       /* Protects the vb2 queue. */
> +       struct mutex queue_lock;
> +       struct vb2_queue queue;
> +};
> +
> +/**
> + * video_device_context_get - Helper to get a video device context from a
> + *                           media device context
> + *
> + * @mdev_context: The media device context
> + * @vdev: The video device the context refers to
> + *
> + * Helper function that wraps media_device_get_entity_context() and returns
> + * the video device context associated with a video device in a media device
> + * context.
> + *
> + * The reference count of the returned video device context is increased.
> + * Callers of this function are required to decrease the reference count of
> + * the context reference with a call to video_device_context_put().
> + */
> +struct video_device_context *
> +video_device_context_get(struct media_device_context *mdev_context,
> +                        struct video_device *vdev);
> +
> +/**
> + * video_device_context_put - Helper to decrease a video context reference
> + *                           count
> + *
> + * @ctx: The video context to release
> + */
> +void video_device_context_put(struct video_device_context *ctx);
> +
> +/**
> + * video_device_init_context - Initialize the video device context
> + *
> + * @vdev: The video device this context belongs to
> + * @ctx: The context to initialize
> + *
> + * Initialize the video device context. The intended callers of this function
> + * are driver-specific implementations of the media_entity_ops.alloc_context()
> + * function that allocates their driver specific types that derive from
> + * struct video_device_context.
> + */
> +int video_device_init_context(struct video_device *vdev,
> +                             struct video_device_context *ctx);
> +
> +/**
> + * video_device_cleanup_context - Cleanup the video device context
> + *
> + * @ctx: The context to cleanup.
> + *
> + * Cleanup the video device context. The intended callers of this function are
> + * driver specific implementation of the media_entity_ops.destroy_context()
> + * function before releasing the memory previously allocated by
> + * media_entity_ops.alloc_context().
> + */
> +void video_device_cleanup_context(struct video_device_context *ctx);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  #endif /* _V4L2_DEV_H */
> diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
> index b5b3e00c8e6a0b082d9cd8a0c972a5094adcb6f2..a8de8613a026589ede94dc3e70c8a49ae08f4582 100644
> --- a/include/media/v4l2-fh.h
> +++ b/include/media/v4l2-fh.h
> @@ -20,6 +20,7 @@
>
>  struct video_device;
>  struct v4l2_ctrl_handler;
> +struct video_device_context;
>
>  /**
>   * struct v4l2_fh - Describes a V4L2 file handler
> @@ -38,6 +39,7 @@ struct v4l2_ctrl_handler;
>   * @sequence: event sequence number
>   *
>   * @m2m_ctx: pointer to &struct v4l2_m2m_ctx
> + * @context: The video device context
>   */
>  struct v4l2_fh {
>         struct list_head        list;
> @@ -54,6 +56,7 @@ struct v4l2_fh {
>         u32                     sequence;
>
>         struct v4l2_m2m_ctx     *m2m_ctx;
> +       struct video_device_context *context;
>  };
>
>  /**
>
> --
> 2.49.0
>
>
