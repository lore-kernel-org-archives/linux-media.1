Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAD647ACE2
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 16:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787243018; cv=pass; b=jaTxfvWrTLwO7aH4ncni+hTlB7tKGy3tCNlBBxYfKsq96UkbNRQyN9D6RYILsCDput0viv28qXRHDY5LrQw6g/izWBqJHfQeLKfOSUcc61H2CA7txtXsCNe0kO5ai6thKpodW7o9REyCkWU9XRFtI8KMgJ2vhGx0PmYAHA1f7B0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787243018; c=relaxed/simple;
	bh=9NvAZTe/xeY48pNBZPHQysKUH30JnhBtmj3WSY969Wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kMyBI5CcsHGQE2nUY6Su6VtTaePSoIWVstoNwOCZQn7Bx2A/enyX7HfdnGDdi8ZnYXkNvTBO6yivVNMMZ3jhy2pN9IdYT5gJdtdnJ+FrERtx4aSjyvZUUCO+5VHhP0XtnNghVJKbFGiB1Eb88rs4ku3+Gw6Rk4BgJts3G46QJmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk; spf=pass smtp.mailfrom=kynesim.co.uk; dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b=tl2Bk/0d; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b="tl2Bk/0d"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81ff017d420so18203857b3.0
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 09:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787243015; cv=none;
        d=google.com; s=arc-20260327;
        b=nVBmTuii7V1wNKstcOqP0FARUJiWYVy8bz2GD9gjPSHigj1XwYcDbF1+a86SjjMwSq
         TuPCZRab2wYiSTyhlOalpuzwTvLShjhqZqHmlF7MlhJ2CsHH78b7R1aGXTdMN+8Icm8/
         CCQxBTk00cISO/l+cvJfftzvxZ2EB1qWo76I+ud+/TAkCFyfYHTHuhPXcE9VMCw5BtXU
         ZIQ3RzLD4e9dupD8e44367skTpAfB/qbRSHY60vH4r8uhmufnkKiAf41O1ocZw/ZplRH
         pg3fn2JcatOgyAFBWrnjEpOFI3dqQ6F7P7XYt8kXkQx4Zro89ub5ZmFPyKxB7MxAjHoF
         Uvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YnRM0KTrisOCjmklL/YoGuQ5GhJTGvbJYvWODwmflkI=;
        fh=VLCyHz+sXBr9yuSMsI48rBnVN8RDlgysj89mafUCmOM=;
        b=CsDkEvqzmEtj/8H74qejluqxIx4JGPTbB30Eub8jRlBWAsBges2f2WQlfv7f9IZxhu
         xFDAd7s60OK/i5BY62R80GlrnsGdpRMd05SXxg4WR+XgnDWg1Z7KrAJgq1LtWkhl9KvC
         1usPLFAkxEigMl1UkopbA9gI0z1NJridnj1cMtUBb+S15ciY9PkEcsIKTMkXdrxJj1ci
         xWKg6mwac11gCsSARgX+0UrdVOtEj+K1s4wEmUmpjzRmt/cYwnoCBKQLgd6xiHloE69+
         5+mtT0TwYCoj4TNVdTyyo54UiBttPqRkTY7hbyAT8m0GGmyZbt9pQAt/BV4gmUkK6VCV
         QhHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1787243015; x=1787847815; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YnRM0KTrisOCjmklL/YoGuQ5GhJTGvbJYvWODwmflkI=;
        b=tl2Bk/0d2LcMp0a3as1bkT9/DE7qmYlit/vq/qo2yAwrl/WUUwt3iLJDb1gKQeK6x7
         b/QV7R7SRAFRHrkHF35ZkoGwZ9yBdbiSetSMtEYP7QWPMO5ydl2GEdgfyLKtxlsbI4YU
         h31CIW3IG3wfjehXFen2334XIAZtGHmeCGw3cb6Y98lPkCfRa3JB2A71HPnf/YxgH/sC
         ZAm7hCnGAcE8iUlAP9YCn2EolYoTuBFemOABoGBQdjyTlZmQnUfpKHU3DgV7ObtSK+ng
         qNO4P7uo1rN9jn7FK7WIHCmE2O7gbCnDsH0W+H1eb0A/FCiv19/ExslFfLXbLAaXBFAU
         XbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787243015; x=1787847815;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YnRM0KTrisOCjmklL/YoGuQ5GhJTGvbJYvWODwmflkI=;
        b=Wc8T08QQnHTisYrZJ7pUIVpx3UkFJUy68Be7/t/xERqJaRalWTN8Xz9KBvm+3/9Hje
         Lw5xKXXLUl4CDZZs939Gl2fX3+0METUcolb47TRl5B6rUTtXWT1iI015MsmJN1M6c3bj
         7vDvbsIL1Pde+muMLXh8n4Nhfmx7NTnwOcZyOpQNpGQHpZD4206FL+yzDEdlCMeWIU5z
         rqb4xdHKC3JpQZzzNXMj7o0v5mrzgjplEFnKmV3zU3lCvcW0ERic2bZcnHKhVDg+SVZb
         9pBqSZ0Nj206VvS8l3zRmzWLE6qVBV453x+XdJWZrDJi3iP+SsjencPYlffQ/EZ2Sbkb
         aiGQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRpC9M/3Sp7LNxpcK3QM3sOoE3WctapIYzgG0qAqIHsvbODypuXekV+O5J6gBq/R4npnpoLNDjue+t2g==@vger.kernel.org
X-Gm-Message-State: AFuF++lnxYdzzy5HmKhBHhPAIjEOSKhsZW5uMDetvwuCAcwNKeXcRN6/
	OGourNRbKzRJKGwpR3RVKYg0IbXJ/611eP9P9de9ORqOY9lumIF20jUD6qdbLxrA7u6HbGebaEM
	dDFpnuekJKUxFEUon1f5Jpkm++qyc45FYzX16CfEq8Q==
X-Gm-Gg: AR+sD10hpxTyZ8MxUyMP8HSaLviRVrXMsxmpUJMD8++0NjQH2qJfJdp+JOH+SNZHUNZ
	HGmelhFmspQExdFq1XqM5k4gulPE9EfKhR4tGHtJ2stMqsH7+QoZxVP3rMkt1xG5JGsVK2u5Hqb
	pIBozrUp7LDsBYREtSRj9XAsIq3qPRcBE5kEdwv/BOQRUGufLeoHq191u/TDg1NYnAUmeOGpuQN
	TXZXqCq9w3bAp10lBGLam49uz8hWwk9itSE8u+w+S52gqlx/H8y+52QJyk25BBh3Lrvch7DVVKf
	74lXnnJ5gROJXBoZ9dzeCReWqlRwAZFz0tKEcTW6tts=
X-Received: by 2002:a05:690c:88f:b0:826:8d02:8e97 with SMTP id
 00721157ae682-8470b3d3551mr31060647b3.11.1787243015459; Thu, 20 Aug 2026
 09:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
 <20250724-multicontext-mainline-2025-v2-13-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-13-c9b316773486@ideasonboard.com>
Reply-To: jc@kynesim.co.uk
From: John Cox <jc@kynesim.co.uk>
Date: Thu, 20 Aug 2026 17:23:23 +0100
X-Gm-Features: AcwNN1Umw00-Vm0FaKi02tHzavFmcraLoTJPjWghZ5jBCN0htqJyMwd4j2ttQ1Q
Message-ID: <CAFyCYyPq0P0FfNL=ciiPnOV5Oa9tXZ09TE2gca9ovEiYOUqd3w@mail.gmail.com>
Subject: Re: [PATCH v2 13/27] media: v4l2-subdev: Introduce VIDIOC_SUBDEV_BIND_CONTEXT
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

> Introduce a new ioctl in V4L2 subdev to allocate a subdevice context
> and associate it with a media device context.
>
> The ioctl handler calls the entity ops to let the driver allocate a
> new context and initialize the subdev state there contained.
>
> The new subdevice context is bound to the media device context
> associated with the file descriptor provided by userspace as the new
> ioctl argument.
>
> The newly allocated context is stored in the v4l2_subdev_fh handle
> that represent the open file handle on which the ioctl has been called.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 59 +++++++++++++++++++++++++++++++++++
>  include/uapi/linux/v4l2-subdev.h      | 11 +++++++
>  2 files changed, 70 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 7307f57439499c8d5360c89f492944828ac23973..300f84317623dd082a4cd2caec97057f972e82a3 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -607,6 +607,46 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>                              v4l2_subdev_get_unlocked_active_state(sd);
>  }
>
> +static int subdev_do_bind_context(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_context **context,
> +                                 struct media_device_context *mdev_context)
> +{
> +       static struct lock_class_key key;
> +       struct v4l2_subdev_state *state;
> +       int ret;
> +
> +       ret = sd->entity.ops->alloc_context(&sd->entity,
> +                                           (struct media_entity_context **)
> +                                           context);
> +       if (ret)
> +               return ret;
> +
> +       state = __v4l2_subdev_state_alloc(sd, "context->state->lock", &key);
> +       if (IS_ERR(state)) {
> +               ret = PTR_ERR(state);
> +               goto err_put_context;
> +       }
> +       (*context)->state = state;
> +
> +       /*
> +        * Bind the newly created video device context to the media device
> +        * context identified by the file descriptor.
> +        */
> +       ret = media_device_bind_context(mdev_context,
> +                                       (struct media_entity_context *)
> +                                       *context);
> +       if (ret)
> +               goto err_free_state;
> +
> +       return 0;
> +
> +err_free_state:
> +       __v4l2_subdev_state_free((*context)->state);
> +err_put_context:
> +       v4l2_subdev_context_put(*context);
> +       return ret;
> +}
> +
>  static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>                             struct v4l2_subdev_state *state)
>  {
> @@ -1089,6 +1129,25 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>                 return 0;
>         }
>
> +       case VIDIOC_SUBDEV_BIND_CONTEXT: {
> +               struct v4l2_subdev_bind_context *c = arg;
> +               struct media_device_context *mdev_context;
> +               int ret;
> +
> +               if (!sd->entity.ops || !sd->entity.ops->alloc_context ||
> +                   !sd->entity.ops->destroy_context)
> +                       return -ENOTTY;
> +
> +               mdev_context = media_device_context_get_from_fd(c->context_fd);
> +               if (!mdev_context)
> +                       return -EINVAL;
> +
> +               ret = subdev_do_bind_context(sd, &subdev_fh->context,
> +                                            mdev_context);
> +               media_device_context_put(mdev_context);
> +               return ret;
> +       }
> +
I think you also need a v4l2_subdev_context_put in subdev_close to
free up the bound
context.

Regards

John Cox

>         case VIDIOC_SUBDEV_G_CLIENT_CAP: {
>                 struct v4l2_subdev_client_capability *client_cap = arg;
>
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 2347e266cf7516b4073c1edd43b97a3ddddb183b..6184cc0153a9dd9fbfa6729e1b6127ba4a961395 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -243,6 +243,16 @@ struct v4l2_subdev_routing {
>         __u32 reserved[11];
>  };
>
> +/**
> + * struct v4l2_subdev_bind_context - Subdev context information
> + *
> + * @context_fd: The file descriptor of the media_device instance the subdevice
> + *             has to be bound to
> + */
> +struct v4l2_subdev_bind_context {
> +       __u32 context_fd;
> +};
> +
>  /*
>   * The client is aware of streams. Setting this flag enables the use of 'stream'
>   * fields (referring to the stream number) with various ioctls. If this is not
> @@ -285,6 +295,7 @@ struct v4l2_subdev_client_capability {
>  #define VIDIOC_SUBDEV_S_SELECTION              _IOWR('V', 62, struct v4l2_subdev_selection)
>  #define VIDIOC_SUBDEV_G_ROUTING                        _IOWR('V', 38, struct v4l2_subdev_routing)
>  #define VIDIOC_SUBDEV_S_ROUTING                        _IOWR('V', 39, struct v4l2_subdev_routing)
> +#define VIDIOC_SUBDEV_BIND_CONTEXT             _IOWR('V', 50, struct v4l2_subdev_bind_context)
>  #define VIDIOC_SUBDEV_G_CLIENT_CAP             _IOR('V',  101, struct v4l2_subdev_client_capability)
>  #define VIDIOC_SUBDEV_S_CLIENT_CAP             _IOWR('V',  102, struct v4l2_subdev_client_capability)
>
>
> --
> 2.49.0
>
>
