Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B229747DD5D
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 16:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787244463; cv=pass; b=XB1kRsWKfIirt2uNape0AWJBvRj4k2e9BVTYTq3lr6KmaWV8RLy0wXCrRX7jb2barFUs6fdPrLMaRFoBQV4PI4ZmU5/P1DnFKX7ebwNtqprtMKE1hJQloYNXpRjpt9JPz3VgtMgKdvqhce1JPISl74KF3hu8cTgUWHwRqlR0lK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787244463; c=relaxed/simple;
	bh=Lkh0NNey+z7gSu2+vJpX+xdheboLYUVXXw+g2pUv6N4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eEdjr2T0MTVXC3Xw8OE0dZgj5Q8RokDfKNBY25gOluJejwF0p1W3TVUZ2CFWCoirY+W07ovkHeoQDUJVuyO+T5nMlchGPVrfOoL+14TZKVEG7zOp86Ohwhu7B5rdJOTcw8mbg0jcl+4v/6kPTNxDUvceKTwyD+kxQAgNHOsZaMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk; spf=pass smtp.mailfrom=kynesim.co.uk; dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b=BT1m5qau; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b="BT1m5qau"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66c7127a73dso3023776d50.2
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 09:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787244460; cv=none;
        d=google.com; s=arc-20260327;
        b=YgHjtBc7S+ZqmlvpWSiSQX2T6E8sJl336Cy/D6ausIWdUCxnz6qgGg18VErepbwZD6
         POPtIi5ivkx4jnGj9QqUVQ3w87LF4QfjMPH/+zwLFGQiLXo7/u+fryCmDUz3ZlGKDfEK
         7+DqBJ84WfxfeoBmVysE9d60CjMi6fX7RbfbtRVgWo8lTRT4hRkNgl51xO0+bZhs2VOQ
         asGdrE+/b38/kv6Iq4GARq1YeEFGeMYRsf+d8tgMypZPPbKIoeaW4TNt4KtOCkBm3p/E
         1jSTKEpAfL8Avs7h5cn1O50Yzw2OVIUryVRblFAltVBbo2mqk9ILPsZiFxnle94yRBZu
         s/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N8/7EJgXScxMsb8yLNOXdKHQST7x7f+prdDpaOJKJXg=;
        fh=t9jGfxS4hk5rhQ/Nq4XZ5zUy2qxISK3K6zWHyhlXsDk=;
        b=BpdG+t2qh8pamhvY/beFYx706z4iVMV1pUA7mkmumX+0t2GLAE/xlUGchqrJcGDQnb
         r0nILK4HxbTAc26wnNp9B+nwOMs8Ux5QMDIoYMTJ383SrOgtz/IeCetAqyGr8CjKeWto
         E2wUTfzY3md4okn+hBiM+tFGRGNsAa9i3bxBXBxhILT2aK8RRBn7lROrYyVAXCrrQESY
         XznWlIMC5GwslHbXJqeP/v13qBgD92bXhbK/zfgBNtLa4gckXPVTr0e6shKGHyt5oRKi
         A5S0KsFHlnsbcKSLBMrU1lNs+x4O71mvAXcngITcNJS4iIq12bRMCyX0n8l698qHbIe+
         gVPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1787244460; x=1787849260; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8/7EJgXScxMsb8yLNOXdKHQST7x7f+prdDpaOJKJXg=;
        b=BT1m5qauCA7gTnBTybVq1wSrgj8MwLkLLCWbLHFRL9ergUl1faffSly41PwVmpGyH2
         93nLXI4kHktYvS3V75U4HIRf9U11pGyzcSj1B3P/ur5Y5Tt3tb/Y+tFtLW5E+BD/1cLR
         /xFZ55splSurV+lQLHcrTbNFMMC4JOxDAuo6ZIXUDArkLlsCrPRtfB0F+e9M3VBgBuKS
         YnFg7zx0/7WWgbLhMB2F4b8ST37hEhxezt4UsnGNih7+Pyv2+TOzzo2wLgP37uuxnsXs
         XuULZWq6FN2an9sQ9IgepWzegzHMfJbm7WC4ZEARAmmib1n/M82sUSdoWO6YaENpA1IM
         tJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787244460; x=1787849260;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8/7EJgXScxMsb8yLNOXdKHQST7x7f+prdDpaOJKJXg=;
        b=FRANnvAnCTlBBOYdd/vGt2RaJxA8paiorfxI5XkSDxsPAxea7a6MY4PxEKaTYBSJDb
         rLtlpVW1PklppMscx6RSQlxJWe/iHRdQy1FvEwUtgs3dKttrA+l4cmhZmOI9btb3By1H
         fqccNXOCpnFjVuqtbQxzCcq+AJKUMXG1MI1bRPRTz1j228V9fdWGlaaAKn0URNYNhtdH
         b10mztpUlANVBA5wkVmOfV9Dj2IL6N/2Pb8j2DHTnb317hOiRxc651tFLIxNoVz1zxKw
         txfYBmCbIvFGXxN1FvQJUxpRJHIVSCrdnBnul6+X76W5sYAy7ZUcDYRD1RcNFqG8UAHV
         9O8A==
X-Forwarded-Encrypted: i=1; AHgh+RqSXXXJcXrr7/N0zb7zSGaM9pNmfRifXtearH7wPfhwxTm+HCFW5Y3USJZWRu8c1ikiZ6i/0HL/3OaWjw==@vger.kernel.org
X-Gm-Message-State: AFuF++kydJSskDOT6b7ld/jzscflKrQTjdWP9kHyn1ONCoYlehYLV69E
	ZVTUKGTKkyoQULJNaX3IFAImgAOQODT/tZwcDj1vPDDoJkDLXQDlIpO/ePuoKcvaipr+G6qDXpa
	Y+A58P0NWvyWysuKvtK7lKJHkD0TycjShoan/1VjnPg==
X-Gm-Gg: AR+sD110/JZI42WiUseCH/xKkalob5yIenVAJQ6ELuPagAvOvt3XgCkLzF+FMNTVgPR
	2BfJ7WKksP6fJ+Z6tgxrfD6YQBp9lEeYh8SZdayBGf+GZfhW6qXtf0KCP7zYPmZaCpVuHrdlR+g
	FgDxf7DLvZAm5nmw8Omt9ic9MdfWTRa8yoDG8QgQeRoimPZSrzXT4u1ZvzEkIe6CVgkZaKid1vg
	ezhNvXR8B/AyeRdSJpIbBeb6/1NRRfptL1IIUlkWH9QGKT5zIbRTUoCuOlYw4hbw8APX9DE6Nhh
	LpdejJ8Z/vZuU3zkM7OoT7N45UQuSV8QZqIbXck0g80=
X-Received: by 2002:a05:690e:dcf:b0:669:3e3e:d64a with SMTP id
 956f58d0204a3-66ce49ed2c5mr65947d50.15.1787244460433; Thu, 20 Aug 2026
 09:47:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
 <20250724-multicontext-mainline-2025-v2-12-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-12-c9b316773486@ideasonboard.com>
Reply-To: jc@kynesim.co.uk
From: John Cox <jc@kynesim.co.uk>
Date: Thu, 20 Aug 2026 17:47:27 +0100
X-Gm-Features: AcwNN1Xnu7zppNIGQ2MdBufll4blyAkR6vOITHjuMugVUus8gLxrHEWDDpf2rnc
Message-ID: <CAFyCYyOPESG6TJaUBdWE28BRxwems_EQsvhMP08LbN8D=sYAWw@mail.gmail.com>
Subject: Re: [PATCH v2 12/27] media: v4l2-subdev: Introduce v4l2 subdev context
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

> Introduce a new type in v4l2 subdev that represents a v4l2 subdevice
> contex. It extends 'struct media_entity_context' and is intended to be
> extended by drivers that can store driver-specific information
> in their derived types.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c |  39 +++++++++++
>  include/media/v4l2-subdev.h           | 126 ++++++++++++++++++++++++++++++++++
>  2 files changed, 165 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 4fd25fea3b58477056729665706ddbacc436379c..7307f57439499c8d5360c89f492944828ac23973 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1577,6 +1577,45 @@ bool v4l2_subdev_has_pad_interdep(struct media_entity *entity,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_has_pad_interdep);
>
> +struct v4l2_subdev_context *
> +v4l2_subdev_context_get(struct media_device_context *mdev_context,
> +                       struct v4l2_subdev *sd)
> +{
> +       struct media_entity *entity = &sd->entity;
> +       struct media_entity_context *ctx =
> +                media_device_get_entity_context(mdev_context, entity);
> +
> +       if (!ctx)
This needs to be "if (IS_ERR_OR_NULL(ctx))" as media_device_get_entity_context()
can return an error pointer.

Regards

John Cox

> +               return NULL;
> +
> +       return container_of(ctx, struct v4l2_subdev_context, base);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_context_get);
> +
> +void v4l2_subdev_context_put(struct v4l2_subdev_context *ctx)
> +{
> +       if (!ctx)
> +               return;
> +
> +       media_entity_context_put(&ctx->base);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_context_put);
> +
> +int v4l2_subdev_init_context(struct v4l2_subdev *sd,
> +                            struct v4l2_subdev_context *context)
> +{
> +       media_entity_init_context(&sd->entity, &context->base);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_init_context);
> +
> +void v4l2_subdev_cleanup_context(struct v4l2_subdev_context *context)
> +{
> +       media_entity_cleanup_context(&context->base);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup_context);
> +
>  struct v4l2_subdev_state *
>  __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
>                           struct lock_class_key *lock_key)
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 5dcf4065708f32e7d3b5da003771810d5f7973b8..9d257b859acafb11cfe6976e906e7baabd0206f6 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -757,6 +757,78 @@ struct v4l2_subdev_state {
>         struct v4l2_subdev_stream_configs stream_configs;
>  };
>
> +/**
> + * struct v4l2_subdev_context - The v4l2 subdevice context
> + * @base: The media entity context base class member
> + * @state: The subdevice state associated with this context
> + *
> + * This structure represents an isolated execution context of a subdevice.
> + * This type 'derives' the base 'struct media_entity_context' type which
> + * implements refcounting on our behalf and allows instances of this type to be
> + * linked in the media_device_context contexts list.
> + *
> + * The subdevice context stores the subdev state in a per-file handle context,
> + * userspace is allowed to multiplex the usage of a subdevice devnode by opening
> + * it multiple times and by associating it with a media device context. This
> + * operation is called 'bounding' and is performed using the
> + * VIDIOC_SUBDEV_BIND_CONTEXT ioctl.
> + *
> + * A subdevice context is created and stored in the v4l2_fh file handle
> + * associated with an open file descriptor when a subdevice is 'bound' to a
> + * media device context. The 'bounding' operation realizes a permanent
> + * association valid until the subdevice context is released.
> + *
> + * A subdevice can be bound to the same media device context once only.
> + * Trying to bind the same subdevice to the same media device context a
> + * second time, without releasing the already established context by closing the
> + * bound file descriptor first, will result in an error.
> + *
> + * To create a subdevice context userspace shall use the
> + * VIDIOC_SUBDEV_BIND_CONTEXT ioctl that creates the subdevice context and
> + * uniquely associates it with a media device file descriptor.
> + *
> + * Once a subdevice file descriptor has been bound to a media device context,
> + * all the operations performed on the subdevice file descriptor will be
> + * directed on the just created subdevice context. This means, in example, that
> + * the subdevice state and configuration is isolated from the ones associated
> + * with a different file descriptor obtained by opening again the same subdevice
> + * devnode but bound to a different media device context.
> + *
> + * Drivers that implement multiplexing support have to provide a valid
> + * implementation of the context-related operations in the media entity
> + * operations.
> + *
> + * Drivers are allowed to sub-class the v4l2_subdevice_context structure by
> + * defining a driver-specific type which embeds a struct v4l2_subdevice_context
> + * instance as first member, and allocate the driver-specific structure size in
> + * their implementation of the `alloc_context` operation.
> + *
> + * Subdevice contexts are ref-counted by embedding an instance of 'struct
> + * media_entity_context' and are freed once all the references to it are
> + * released.
> + *
> + * A subdevice context ref-count is increased when:
> + * - The context is created by bounding a video device to a media device context
> + * - The media pipeline it is part of starts streaming
> + * A subdevice context ref-count is decreased when:
> + * - The associated file handle is closed
> + * - The media pipeline it is part of stops streaming
> + *
> + * The ref-count is increased by a call to v4l2_subdev_context_get() and is
> + * reponsibility of the caller to decrease the reference count with a call to
> + * v4l2_subdev_context_put().
> + */
> +struct v4l2_subdev_context {
> +       struct media_entity_context base;
> +       /*
> +        * TODO: active_state should most likely be changed from a pointer to an
> +        * embedded field. For the time being it's kept as a pointer to more
> +        * easily catch uses of active_state in the cases where the driver
> +        * doesn't support it.
> +        */
> +       struct v4l2_subdev_state *state;
> +};
> +
>  /**
>   * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
>   *
> @@ -1152,6 +1224,7 @@ struct v4l2_subdev_fh {
>         struct module *owner;
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>         struct v4l2_subdev_state *state;
> +       struct v4l2_subdev_context *context;
>         u64 client_caps;
>  #endif
>  };
> @@ -1285,6 +1358,59 @@ int v4l2_subdev_link_validate(struct media_link *link);
>  bool v4l2_subdev_has_pad_interdep(struct media_entity *entity,
>                                   unsigned int pad0, unsigned int pad1);
>
> +/**
> + * v4l2_subdev_context_get - Helper to get a v4l2 subdev context from a
> + *                          media device context
> + *
> + * @mdev_context: The media device context
> + * @sd: The V4L2 subdevice the context refers to
> + *
> + * Helper function that wraps media_device_get_entity_context() and returns
> + * the v4l2 subdevice context associated with a subdevice in a media device
> + * context.
> + *
> + * The reference count of the returned v4l2 subdevice context is increased.
> + * Callers of this function are required to decrease the reference count of
> + * the context reference with a call to v4l2_subdev_context_put().
> + */
> +struct v4l2_subdev_context *
> +v4l2_subdev_context_get(struct media_device_context *mdev_context,
> +                       struct v4l2_subdev *sd);
> +
> +/**
> + * v4l2_subdev_context_put - Helper to decrease a v4l2 subdevice context
> + *                          reference count
> + *
> + * @ctx: The v4l2 subdevice context to put
> + */
> +void v4l2_subdev_context_put(struct v4l2_subdev_context *ctx);
> +
> +/**
> + * v4l2_subdev_init_context - Initialize the v4l2 subdevice context
> + *
> + * @sd: The subdevice the context belongs to
> + * @ctx: The context to initialize
> + *
> + * Initialize the v4l2 subdevice context. The intended callers of this function
> + * are driver-specific implementations of the media_entity_ops.alloc_context()
> + * function that allocates their driver specific types that derive from
> + * struct v4l2_subdev_context.
> + */
> +int v4l2_subdev_init_context(struct v4l2_subdev *sd,
> +                            struct v4l2_subdev_context *ctx);
> +
> +/**
> + * v4l2_subdev_cleanup_context - Cleanup the v4l2 subdevice context
> + *
> + * @ctx: The context to cleanup.
> + *
> + * Cleanup the v4l2 subdevice context. The intended callers of this function are
> + * driver specific implementation of the media_entity_ops.destroy_context()
> + * function before releasing the memory previously allocated by
> + * media_entity_ops.alloc_context().
> + */
> +void v4l2_subdev_cleanup_context(struct v4l2_subdev_context *ctx);
> +
>  /**
>   * __v4l2_subdev_state_alloc - allocate v4l2_subdev_state
>   *
>
> --
> 2.49.0
>
>
