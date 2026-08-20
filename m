Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5E947A0DA
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 16:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787243506; cv=pass; b=hGs56U4Ui6ohKZw7HRfBDHwVNWUoSidqqvp62ctd686ilnfn6pcB2vYy4ycM/6ZJh8uLhkNB9HRMLLy6wyW5Up4hvvC8GbeHOIeinCJIoCgl/Torwq4HI9dn0Gvd6weA+OMTr+gkmZUPd1kKBAkZmHN5OOCyhpbmwxa3qxEVPhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787243506; c=relaxed/simple;
	bh=Q41aA4cvtCASf2GuEIN5EZRDKyWnkPQvDlEFCmonvoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PFAX0stqpbjIGiIxJbucZe7pPVxEGEp/uEhHP5ktI043l/n2X5M5vAy/tJOm2UZFEKARK7QCqKd2SkP6I6a9Vxv29Mj6Unj9sgpLfwZjJed9b8RS5HEcp/xWksyUIwf+CL2NY+36u17ECLleE3JkO1zQXlQpA2WIgQFqidzqMAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk; spf=pass smtp.mailfrom=kynesim.co.uk; dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b=XccI/VSv; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b="XccI/VSv"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7dbcb505578so889727b3.3
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 09:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787243503; cv=none;
        d=google.com; s=arc-20260327;
        b=nSq1nnW5YFnDfvYQjsLHxTy9rSM92nb2RQjfAOdsGd4jdi1zk+IzdiSWiMWWWIIXSB
         vM99HBT9Jrsbnbwui/tHTueUPvqp/9jSYnLzZpxgv5tGvmaHim4L2HhaHPu7lp7LYZhF
         jDNUs4urqAJIgoLsY7slm+jMSKZqTFuGA1m3btuPDUg3m/gy5r0FObY1zNdSHVIxoWjM
         m8XuI2QgrI1QdsMKN3Qo0Ge2Ad42T8pbZqMESb4f/1d1YTUop7XLfzimA0Nv0zzavjU7
         oFU2Z8IQ5+MBjZyXXocswP3ICsdU7ayVaOMPAz+jeWEviKRYRD1wjYpkxg7pXHpFZbF+
         3bDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qEfeanj2B21UQ4s13w9n0/O/Ii0JASvFsbQaoVe9iHE=;
        fh=7Fyez3pIpQsIWrG2ZeflIDYGeKnXE7Sdv2BUfuyC1Bw=;
        b=h11rKLBRu9sKZIAvL64y5PfqNG87fWb9aho8m8Pyx+5uUdJZ7zglx+c7Mp8EIBetTw
         LVxZK2jfh9xJi1jM7VhgK7v/sAm2iMjmOZGNo1fVOTGPHJBNSZJbGLpxZwZV17wsR99x
         GTT5G9Te4x6j6Ys1cT1bX19uLfq4fgfhFCBqqrqk5PGsGdunlo1xb81aRvpX6a9TIhI/
         Mb9E8jynoU8mxXxnK0Q8YXl7KPoTraHhLbdK5xhRx5kMsUjehUhu8hd0Lqv9/6urkZXD
         rnZ/herhLbI3RMzvTyrprSkAqhV0l8x8br8/dDCA7GAcvm3JsYmEunuB/7eMFSSogSIo
         dUPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1787243503; x=1787848303; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEfeanj2B21UQ4s13w9n0/O/Ii0JASvFsbQaoVe9iHE=;
        b=XccI/VSvAKAJ3udI3BuJa/+5E3isT7oxlI9cOPwqQ7wfIjmdP8wAaa5Q28AlDoRW60
         aX8HkoQwveG16IOqpIIf+CF8ORZnbUH2YvoaN2MdioldyCM6N2GxW5jVnOWm69AQzdzw
         jr8f/YgkFrPIGWTz8klW7TJFUxjlZwEaCUcXsaJ29IK7vmd9gz09UzW0lObp6QnCOUDX
         uFCeoTyYtQX8gMMyiUAby+Pj/LmGx8cf3B0twe3KTJspj3IFGlBMjnWMIQI2NuNjq53O
         0e4VRczfuI+rpn2WlQUIIvbjq5UsC3rvBti9ohGIHIWucBU7UQ6qSokiLRFTXUwT5x/h
         g9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787243503; x=1787848303;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qEfeanj2B21UQ4s13w9n0/O/Ii0JASvFsbQaoVe9iHE=;
        b=hAjHmrOrTbvT/XL2u72MXPIO86xFnlV00FeFh6hk6pi2nFjYsL4X27V3IbshzlcYkB
         EilKNk1YN7awPO7QjG74DPnSZCC78tcAkfG+YsbUYixrPWgVIJX45pV88Qn3SYgLgRdz
         oIr6uoi2s2K3SDRp/WUl0A7BuYEcQ8lkK4w+SWpv+NJAGDJ88i7i2R60eUJcFR14aqWa
         8CFAFvVN1cvThFRhQttxDIQoC5N5py60skEDGHxmW7SiDyPIiXk7tj85aSkUCV0SGaD0
         34iyDwZRTfNpin2CsDFWRSDyyCRSJLo3kRp+hJTJRg4wizntDy4LQB06uU4B8cN2lOYK
         DpVA==
X-Forwarded-Encrypted: i=1; AHgh+RoZiwWBRwTkTIZfQU0qDIpIhAdaBk4ABLY4m3L7QPiK5PWdp6RoR99Wio3JGLKitkX+ejLvkMvEXED/JQ==@vger.kernel.org
X-Gm-Message-State: AFuF++maoTf3rlovT5LIxJwwDhd92mwcmk0wKG+eHqr26PUP3WxxhOL/
	uYDV4dKucC8XihlQhXbq4gy+Jt7dPnXcahcq2PuD7RoEy02yrFqQimzQV4Odao2GWySl0/GYQLH
	vWlaZEzKjc1UTyO3Z6TtnpcT0othD5f93Pmpp7FGECg==
X-Gm-Gg: AR+sD12OR5QPsO2Fe/coco64xGCzGD1TBQxKhW/odnAQ12l8Z2aQYo/yZULH5E7+PZB
	rkLHrHU+re8/J8NGaYtNNfcmgCRwdXIa5TJRwtQWORJE5zdF418c3gu2moPK4VPTjyIBU8wsOxy
	zeYfIUL7r4f/7ODL844zkUxV23JMQFMki/PJEVm7O2hGxw6yhBzZcDxHddHaGJB+VrSQGBr6BlQ
	zBEp8IBEbqv7V24t9tAgRejTXwiJ8Iv+0gT5icv204iRgc87uFNs9a+WaizpWPZ0Q3bUXpXFs1h
	YgYn6pE/pSF53YYlVcEjGCBVrEoDh8Fn7/ajVqt0TBo=
X-Received: by 2002:a05:690c:4b82:b0:820:1251:d2c2 with SMTP id
 00721157ae682-844e250fe23mr51872287b3.28.1787243503265; Thu, 20 Aug 2026
 09:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
 <20250724-multicontext-mainline-2025-v2-11-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-11-c9b316773486@ideasonboard.com>
Reply-To: jc@kynesim.co.uk
From: John Cox <jc@kynesim.co.uk>
Date: Thu, 20 Aug 2026 17:31:31 +0100
X-Gm-Features: AcwNN1WjC9dLxoZ7a36oz6GWGckQua1_XePXPkJUpae3tu3WKspB2mZQpv2Wx2Q
Message-ID: <CAFyCYyMaKT9zDxZCruS84S0DvSWrAR_==jjokTPXwBcJAp01pA@mail.gmail.com>
Subject: Re: [PATCH v2 11/27] media: videobuf2-v4l2: Support vb2_queue
 embedded in a context
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

> Support device drivers that implement multi-context operations in the
> videobuf2 core by providing an helper to retrieve the vb2_queue from
> the context associated with an open file handle. If no context is
> associated with a file handle, retrieve it from the video device
> default context, created by the core for multi-context aware drivers.
>
> Fall-back to use the vb2_queue from the video_device to support existing
> drivers which are not context aware.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 139 +++++++++++++++---------
>  1 file changed, 88 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 1cd26faee50338aefeb670c6865da7c2d43f44d3..ad7892551f54c5abc7db7641bb8fb89d77b1337f 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -998,23 +998,46 @@ EXPORT_SYMBOL_GPL(vb2_poll);
>   * and so they simplify the driver code.
>   */
>
> +/*
> + * Helper to get the vb2 queue either from:
> + * 1) The video context bound to the open file handle
> + * 2) The default context for context-aware drivers if userspace has not bound
> + *    a context to the file handle
> + * 3) From the video device for non-context aware drivers
> + */
> +static struct vb2_queue *get_vb2_queue(struct file *file,
> +                                      struct video_device *vdev)
> +{
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +       struct video_device_context *ctx =
> +                               video_device_context_from_file(file, vdev);
> +
> +       return ctx ? &ctx->queue
> +                  : vdev->default_context ? &vdev->default_context->queue
> +                  : vdev->queue;
> +#else
> +       return vdev->queue;
> +#endif /* CONFIG_MEDIA_CONTROLLER */
> +}
> +
>  /* vb2 ioctl helpers */
>
>  int vb2_ioctl_remove_bufs(struct file *file, void *priv,
>                           struct v4l2_remove_buffers *d)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       if (vdev->queue->type != d->type)
> +       if (q->type != d->type)
>                 return -EINVAL;
>
>         if (d->count == 0)
>                 return 0;
>
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
>
> -       return vb2_core_remove_bufs(vdev->queue, d->index, d->count);
> +       return vb2_core_remove_bufs(q, d->index, d->count);
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_remove_bufs);
>
> @@ -1022,21 +1045,21 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
>                           struct v4l2_requestbuffers *p)
>  {
>         struct video_device *vdev = video_devdata(file);
> -       int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
> +       int res = vb2_verify_memory_type(q, p->memory, p->type);
>         u32 flags = p->flags;
>
> -       vb2_set_flags_and_caps(vdev->queue, p->memory, &flags,
> -                              &p->capabilities, NULL);
> +       vb2_set_flags_and_caps(q, p->memory, &flags, &p->capabilities, NULL);
>         p->flags = flags;
>         if (res)
>                 return res;
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
> -       res = vb2_core_reqbufs(vdev->queue, p->memory, p->flags, &p->count);
> +       res = vb2_core_reqbufs(q, p->memory, p->flags, &p->count);
>         /* If count == 0, then the owner has released all buffers and he
>            is no longer owner of the queue. Otherwise we have a new owner. */
>         if (res == 0)
> -               vdev->queue->owner = p->count ? file->private_data : NULL;
> +               q->owner = p->count ? file->private_data : NULL;
>         return res;
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_reqbufs);
> @@ -1045,11 +1068,12 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
>                           struct v4l2_create_buffers *p)
>  {
>         struct video_device *vdev = video_devdata(file);
> -       int res = vb2_verify_memory_type(vdev->queue, p->memory, p->format.type);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
> +       int res = vb2_verify_memory_type(q, p->memory, p->format.type);
>
> -       p->index = vb2_get_num_buffers(vdev->queue);
> -       vb2_set_flags_and_caps(vdev->queue, p->memory, &p->flags,
> -                              &p->capabilities, &p->max_num_buffers);
> +       p->index = vb2_get_num_buffers(q);
> +       vb2_set_flags_and_caps(q, p->memory, &p->flags, &p->capabilities,
> +                              &p->max_num_buffers);
>         /*
>          * If count == 0, then just check if memory and type are valid.
>          * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
> @@ -1058,12 +1082,12 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
>                 return res != -EBUSY ? res : 0;
>         if (res)
>                 return res;
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
>
> -       res = vb2_create_bufs(vdev->queue, p);
> +       res = vb2_create_bufs(q, p);
>         if (res == 0)
> -               vdev->queue->owner = file->private_data;
> +               q->owner = file->private_data;
>         return res;
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_create_bufs);
> @@ -1072,69 +1096,76 @@ int vb2_ioctl_prepare_buf(struct file *file, void *priv,
>                           struct v4l2_buffer *p)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
> -       return vb2_prepare_buf(vdev->queue, vdev->v4l2_dev->mdev, p);
> +       return vb2_prepare_buf(q, vdev->v4l2_dev->mdev, p);
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_prepare_buf);
>
>  int vb2_ioctl_querybuf(struct file *file, void *priv, struct v4l2_buffer *p)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
>         /* No need to call vb2_queue_is_busy(), anyone can query buffers. */
> -       return vb2_querybuf(vdev->queue, p);
> +       return vb2_querybuf(q, p);
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_querybuf);
>
>  int vb2_ioctl_qbuf(struct file *file, void *priv, struct v4l2_buffer *p)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
> -       return vb2_qbuf(vdev->queue, vdev->v4l2_dev->mdev, p);
> +       return vb2_qbuf(q, vdev->v4l2_dev->mdev, p);
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_qbuf);
>
>  int vb2_ioctl_dqbuf(struct file *file, void *priv, struct v4l2_buffer *p)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
> -       return vb2_dqbuf(vdev->queue, p, file->f_flags & O_NONBLOCK);
> +       return vb2_dqbuf(q, p, file->f_flags & O_NONBLOCK);
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_dqbuf);
>
>  int vb2_ioctl_streamon(struct file *file, void *priv, enum v4l2_buf_type i)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
> -       return vb2_streamon(vdev->queue, i);
> +       return vb2_streamon(q, i);
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_streamon);
>
>  int vb2_ioctl_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
> -       return vb2_streamoff(vdev->queue, i);
> +       return vb2_streamoff(q, i);
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_streamoff);
>
>  int vb2_ioctl_expbuf(struct file *file, void *priv, struct v4l2_exportbuffer *p)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 return -EBUSY;
> -       return vb2_expbuf(vdev->queue, p);
> +       return vb2_expbuf(q, p);
>  }
>  EXPORT_SYMBOL_GPL(vb2_ioctl_expbuf);
>
> @@ -1143,20 +1174,22 @@ EXPORT_SYMBOL_GPL(vb2_ioctl_expbuf);
>  int vb2_fop_mmap(struct file *file, struct vm_area_struct *vma)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       return vb2_mmap(vdev->queue, vma);
> +       return vb2_mmap(q, vma);
>  }
>  EXPORT_SYMBOL_GPL(vb2_fop_mmap);
>
>  int _vb2_fop_release(struct file *file, struct mutex *lock)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
>         if (lock)
>                 mutex_lock(lock);
> -       if (!vdev->queue->owner || file->private_data == vdev->queue->owner) {
> -               vb2_queue_release(vdev->queue);
> -               vdev->queue->owner = NULL;
> +       if (!q->owner || file->private_data == q->owner) {
> +               vb2_queue_release(q);
> +               q->owner = NULL;
>         }
>         if (lock)
>                 mutex_unlock(lock);
> @@ -1167,7 +1200,8 @@ EXPORT_SYMBOL_GPL(_vb2_fop_release);
>  int vb2_fop_release(struct file *file)
>  {
>         struct video_device *vdev = video_devdata(file);
> -       struct mutex *lock = vdev->queue->lock ? vdev->queue->lock : vdev->lock;
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
> +       struct mutex *lock = q->lock ? q->lock : vdev->lock;
>
>         return _vb2_fop_release(file, lock);
>  }
> @@ -1177,19 +1211,20 @@ ssize_t vb2_fop_write(struct file *file, const char __user *buf,
>                 size_t count, loff_t *ppos)
>  {
>         struct video_device *vdev = video_devdata(file);
> -       struct mutex *lock = vdev->queue->lock ? vdev->queue->lock : vdev->lock;
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
> +       struct mutex *lock = q->lock ? q->lock : vdev->lock;
>         int err = -EBUSY;
>
> -       if (!(vdev->queue->io_modes & VB2_WRITE))
> +       if (!(q->io_modes & VB2_WRITE))
>                 return -EINVAL;
>         if (lock && mutex_lock_interruptible(lock))
>                 return -ERESTARTSYS;
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 goto exit;
> -       err = vb2_write(vdev->queue, buf, count, ppos,
> -                      file->f_flags & O_NONBLOCK);
> -       if (vdev->queue->fileio)
> -               vdev->queue->owner = file->private_data;
> +       err = vb2_write(q, buf, count, ppos,
> +                       file->f_flags & O_NONBLOCK);
> +       if (q->fileio)
> +               q->owner = file->private_data;
>  exit:
>         if (lock)
>                 mutex_unlock(lock);
> @@ -1201,20 +1236,21 @@ ssize_t vb2_fop_read(struct file *file, char __user *buf,
>                 size_t count, loff_t *ppos)
>  {
>         struct video_device *vdev = video_devdata(file);
> -       struct mutex *lock = vdev->queue->lock ? vdev->queue->lock : vdev->lock;
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
> +       struct mutex *lock = q->lock ? q->lock : vdev->lock;
>         int err = -EBUSY;
>
> -       if (!(vdev->queue->io_modes & VB2_READ))
> +       if (!(q->io_modes & VB2_READ))
>                 return -EINVAL;
>         if (lock && mutex_lock_interruptible(lock))
>                 return -ERESTARTSYS;
> -       if (vb2_queue_is_busy(vdev->queue, file))
> +       if (vb2_queue_is_busy(q, file))
>                 goto exit;
> -       vdev->queue->owner = file->private_data;
> -       err = vb2_read(vdev->queue, buf, count, ppos,
> +       q->owner = file->private_data;
> +       err = vb2_read(q, buf, count, ppos,
>                        file->f_flags & O_NONBLOCK);
> -       if (!vdev->queue->fileio)
> -               vdev->queue->owner = NULL;
> +       if (!q->fileio)
> +               q->owner = NULL;
>  exit:
>         if (lock)
>                 mutex_unlock(lock);
> @@ -1225,7 +1261,7 @@ EXPORT_SYMBOL_GPL(vb2_fop_read);
>  __poll_t vb2_fop_poll(struct file *file, poll_table *wait)
>  {
>         struct video_device *vdev = video_devdata(file);
> -       struct vb2_queue *q = vdev->queue;
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>         struct mutex *lock = q->lock ? q->lock : vdev->lock;
>         __poll_t res;
>         void *fileio;
> @@ -1241,7 +1277,7 @@ __poll_t vb2_fop_poll(struct file *file, poll_table *wait)
>
>         fileio = q->fileio;
>
> -       res = vb2_poll(vdev->queue, file, wait);
> +       res = vb2_poll(q, file, wait);
>
>         /* If fileio was started, then we have a new queue owner. */
>         if (!fileio && q->fileio)
> @@ -1257,8 +1293,9 @@ unsigned long vb2_fop_get_unmapped_area(struct file *file, unsigned long addr,
>                 unsigned long len, unsigned long pgoff, unsigned long flags)
>  {
>         struct video_device *vdev = video_devdata(file);
> +       struct vb2_queue *q = get_vb2_queue(file, vdev);
>
> -       return vb2_get_unmapped_area(vdev->queue, addr, len, pgoff, flags);
> +       return vb2_get_unmapped_area(q, addr, len, pgoff, flags);
>  }
>  EXPORT_SYMBOL_GPL(vb2_fop_get_unmapped_area);
>  #endif

You need similar logic in v4l2-ioctl.c to retrieve the correct queue from
a video_device and v4l2_fh so v4l2_ioctl_get_lock retrieves the correct
lock.

Regards

John Cox
