Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBDF47ACD4
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 16:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787242275; cv=pass; b=HFWNPNLtgQ3pYHhZAY6Ik7AE62vQPaZ3Ank/WmcYY/sKtgwv7vTiihROoZPAVSJsNhld2n6Y+RtRe9f74gD8/TpXc2XsRp5DZ6TrKexPtGsluUboFquB+L9/KcifESPcEl+3etzKBkg2U5MTp8+68q2fCxOpYHN48xe6WgZWKNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787242275; c=relaxed/simple;
	bh=QJccLskrpAn1D0a2oDqJF86S6xGOrMefsxxtfxI6+D4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVvABVz9fIUKEWdbiu5J+8bXJhoZkdnvQvjOSrrHpZkus8fMbgWnLtvQLJm/41Qread/9iVMX5QWLDb5XPJNA040agScw9Nc07FusdFNYUBxzZRwQNk++nhLQ9lzQUtnZKAkZGfEemU3VpEmqSyw6hOSNSBHe1fv0ToLAfZrcPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk; spf=pass smtp.mailfrom=kynesim.co.uk; dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b=Mv3ynL2/; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b="Mv3ynL2/"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66c70d1672cso2770968d50.0
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 09:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787242272; cv=none;
        d=google.com; s=arc-20260327;
        b=LY067NdLmrbYzeUzIYeTIVNB0D1CIZZ3icv7khoDy79z8T7j6WYheAjsOKPb5iVNXE
         6t2ogWzA0k1QuiYknjnQc9vp/mhH987t8hcXvaLQx1Yqbg/tH65JuHUt/dF82K2xb/nS
         mZarVb186J342nWMD7KQjlk1fHZtyDxst9C39LD3FCFyybKX3yV1FUhCLmRWYwjB+UEj
         HFtUQnnSRGCARCtdzWhEb4tYbq7LUlZKh4RSZDd/geMnNfujQGYPN/mcyHGhswreTFzQ
         z8AgT2QN+Da3uAArq2bIYegTCKHXLtQ7pPD9+JAz90ROO6YMJNExbZzfIVkW8CuDk1A5
         VCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LvT1hGcgM8JOWRpKKkgMqVQoUDJ59PniRKM0U1WWl60=;
        fh=Y8FVOsVcQM/xcGVfJWEFa7nbaBf4G27IdZLt7fF1WDE=;
        b=aSDBmj2LRM4ZmhBopfxmy7mfog0PsC9CIwO48JJFxs8myXr/LRZaDtxM0MkOrkOkPi
         Un4iRxBXru2SLzYgALK6I1ixRB3yTVQZjp/P3QTT0K+e51lBPyI3nImg1V5eKqO05F69
         MrYbUyEIt12OKG1Sp5C5aJkM3gAY7y5He4FMsDjzqun9KmSGJ2NiukoeFHW0nxSdjgml
         xbqQM6zyOGnWLJh6S+f2ynqdT+L0VdZGqOFiez0VeGoS2ZOtA93FeaMtKiqTCYYjUAy1
         L5sJ/9wYNQySbeJ1YZ85zBU65LuiyXNjngn3n/XtEoWahTs+uYwpuoDlXwxF9UcvwIRG
         eLLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1787242272; x=1787847072; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LvT1hGcgM8JOWRpKKkgMqVQoUDJ59PniRKM0U1WWl60=;
        b=Mv3ynL2/axV9fBlu99+EqYnRSb68t1fvpuOHvz2aXVf9ug0Go06+nTKWrFoWw88oFI
         eG8AkHgsdkgqr/OtD1cXXCI6uPIzXXDu4dK4159jkvKeS0NVw06SjvMXS8SchSm/eNuO
         tOX88XjmgcfCboJJJtxKRqHk7nmz+mQK6f9N0mj/E/q1pmLwkA4egd/EFxmJr4Zdh28P
         rKp85KvkwF0Lhk63IpDwYLEY15minue/NUPWw2YDJXkO/qo71ewvXZhQKS5k5VBrgfHA
         plGmLR2mGyf1TY6EXH7hZZx3F5vWSdI9RLuE54LqKMJPwAzdI0fdmY+SbQnzI4TweuLi
         jNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787242272; x=1787847072;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LvT1hGcgM8JOWRpKKkgMqVQoUDJ59PniRKM0U1WWl60=;
        b=K/dBbdU0u+6xjr7Y8OGTotLvSPb9DYYGrzrLJFBP08SzhU0pheLxuk6oAxuUZE+7mO
         Gg7Pnb/NFE+g8SuBdAl2wJ5JXq0Pc5HnO6npP43+em+hTbKOhg2Dpwi3ASt6QAVjABGF
         nYEk9o81s4B29GnEFweBxRGl0aBxxIb/hbZy6EspOuiYKxbzjjze+NYZCPK/R05u9zkk
         CFIpDVJ7NRmbdEoS/Cnv8SuLAZvxAlM5Fy0x5hXBuP33DUjF98jW6+zItDBFLj6/cKzB
         +893Nhni9m4Rlh6cDAQU6jYb+XCLJFu2hTl1L5S5tj/HY/qkdd6mGFT3o73E/my7wjNJ
         RKUg==
X-Forwarded-Encrypted: i=1; AHgh+RoCoIfjjb7CVw/mKorT7SMeCS7oZV+7cZO36fcfD/j7SJmE0wBmpGzJ1JcC0Pf49RqQzLpITdBmeCj+RQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m5O0igQnuey0VlLknRUF+sqv1aftVdVQhxmaHGX0JCfHBN+QDw
	ANE7eawsriA9fRisufJawrio6rpM8DMp8xgxjL7pYiPW20VY7y2Vi2axkQnOVI+S9F/N6wIdvGe
	RB3WRTbcNwFpUHE3mpEQhWUwbGv4OwohFZs1zl1tjLA==
X-Gm-Gg: AR+sD10nreQ3r264U16aLFZwOjAxRUdgzc3lTBQiMv/PXXbnUfX3/rJzt+vehOsQdkv
	D6cZYMbzp/Q4CW3P5PDTl3zlxsZDOLgEs6vO+lainwNI8//CKY6d7ROanlvIzOp01AbDzIxDSRx
	Raoybb9DMae8+qod16cz7izgKJs8SmGqhiMyADLYDn81j2CQFpLtgviLhCBejAjTKjU8SV/JU1I
	AiNJBdf+1yRdKZ7Dysid7lwi+arLdqF9eiyfJuHLgIFL0mTrTXVwEjnCnkRiLa0YU/JejTT6wwB
	adJvXIqTKFzbCKlq+eUgWPAsueokT3Dj4r1oTojlNSQ=
X-Received: by 2002:a53:b5c8:0:b0:667:5960:a59d with SMTP id
 956f58d0204a3-66ccb5a3e50mr3251761d50.6.1787242271727; Thu, 20 Aug 2026
 09:11:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
 <20250724-multicontext-mainline-2025-v2-18-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-18-c9b316773486@ideasonboard.com>
Reply-To: jc@kynesim.co.uk
From: John Cox <jc@kynesim.co.uk>
Date: Thu, 20 Aug 2026 17:10:59 +0100
X-Gm-Features: AcwNN1V_idDpMwMCaz8xax0IgTVb59cj1wVnzqsdeIp7ExNN-xbtAqAZLpD_MCo
Message-ID: <CAFyCYyNgKx27CnR36PufqzayS7BZxjRzay2eDucYPri=6aY=GA@mail.gmail.com>
Subject: Re: [PATCH v2 18/27] media: media-entity: Support context in pipeline_start
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

> Add helpers to propagate an execution context when starting the media
> pipeline. Starting a pipeline with an execution context implies that
> when creating the streaming pipeline all the entities part of the
> pipeline shall have a valid context associated with the media context in
> use.
>
> When creating the media pipeline increase the device context use
> count to guarantee that during the streaming phase drivers will
> always operate with valid contexts.
>
> Add 'overrides' for all the video_device_pipeline_start() and
> media_pipeline_start() variants to support contexts.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/mc/mc-entity.c       | 150 ++++++++++++++++++++++++++++++++-----
>  drivers/media/v4l2-core/v4l2-dev.c |  44 +++++++++++
>  include/media/media-entity.h       |  56 +++++++++++++-
>  include/media/v4l2-dev.h           |  57 ++++++++++++++
>  4 files changed, 287 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 7bc276c725f974539ea06e3882d004b81be1de68..f421d6d74630bb96400d39d805c5db5d3d1ff913 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -768,8 +768,50 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
>         return ret;
>  }
>
> -__must_check int __media_pipeline_start(struct media_pad *origin,
> -                                       struct media_pipeline *pipe)
> +static int
> +media_pipeline_validate_context(struct media_device_context *mdev_context,
> +                               struct media_entity *entity,
> +                               struct media_pipeline_pad *ppad)
> +{
> +       struct media_entity_context *context;
> +
> +       if (!mdev_context)
> +               return 0;
> +
> +       /*
> +        * It's not mandatory for all entities in the pipeline to support
> +        * contexts.
> +        */
> +       if (!entity->ops || !entity->ops->alloc_context ||
> +           !entity->ops->destroy_context)
> +               return 0;
> +
> +       /*
> +        * But if they do they should be bound to the same media device context
> +        * as all other entities.
> +        *
> +        * media_device_get_entity_context increases the ref-counting of the
> +        * context. Store a reference in the ppad for later decreasing the
> +        * reference count when the pipeline is stopped.
> +        *
> +        * Fail validation if no context is associated with this media context
> +        * and be loud about that as userspace should be informed it has to
> +        * bind all entities of the pipeline in the same context.
> +        */
> +       context = media_device_get_entity_context(mdev_context, entity);
> +       if (WARN_ON(IS_ERR(context)))
> +               return -EPIPE;
> +
> +       media_entity_context_get(context);
I'm pretty sure this is a second unintended context_get as it is already done
by the media_device_get_entity_context() above.

Regards

John Cox

> +       ppad->context = context;
> +
> +       return 0;
> +}
> +
> +__must_check int
> +__media_pipeline_start_context(struct media_pad *origin,
> +                              struct media_pipeline *pipe,
> +                              struct media_device_context *mdev_context)
>  {
>         struct media_device *mdev = origin->graph_obj.mdev;
>         struct media_pipeline_pad *err_ppad;
> @@ -829,7 +871,15 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
>                 }
>
>                 /*
> -                * 2. Validate all active links whose sink is the current pad.
> +                * 2. If we have a media context, ensure the entity has a device
> +                * context associated with it.
> +                */
> +               ret = media_pipeline_validate_context(mdev_context, entity, ppad);
> +               if (ret)
> +                       goto error;
> +
> +               /*
> +                * 3. Validate all active links whose sink is the current pad.
>                  * Validation of the source pads is performed in the context of
>                  * the connected sink pad to avoid duplicating checks.
>                  */
> @@ -875,7 +925,7 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
>                 }
>
>                 /*
> -                * 3. If the pad has the MEDIA_PAD_FL_MUST_CONNECT flag set,
> +                * 4. If the pad has the MEDIA_PAD_FL_MUST_CONNECT flag set,
>                  * ensure that it has either no link or an enabled link.
>                  */
>                 if ((pad->flags & MEDIA_PAD_FL_MUST_CONNECT) &&
> @@ -905,6 +955,9 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
>                 if (err_ppad == ppad)
>                         break;
>
> +               if (err_ppad->context)
> +                       media_entity_context_put(err_ppad->context);
> +
>                 err_ppad->pad->pipe = NULL;
>         }
>
> @@ -912,19 +965,35 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
>
>         return ret;
>  }
> +EXPORT_SYMBOL_GPL(__media_pipeline_start_context);
> +
> +__must_check int __media_pipeline_start(struct media_pad *origin,
> +                                       struct media_pipeline *pipe)
> +{
> +       return __media_pipeline_start_context(origin, pipe, NULL);
> +}
>  EXPORT_SYMBOL_GPL(__media_pipeline_start);
>
> -__must_check int media_pipeline_start(struct media_pad *origin,
> -                                     struct media_pipeline *pipe)
> +__must_check int
> +media_pipeline_start_context(struct media_pad *origin,
> +                            struct media_pipeline *pipe,
> +                            struct media_device_context *context)
>  {
>         struct media_device *mdev = origin->graph_obj.mdev;
>         int ret;
>
>         mutex_lock(&mdev->graph_mutex);
> -       ret = __media_pipeline_start(origin, pipe);
> +       ret = __media_pipeline_start_context(origin, pipe, context);
>         mutex_unlock(&mdev->graph_mutex);
>         return ret;
>  }
> +EXPORT_SYMBOL_GPL(media_pipeline_start_context);
> +
> +__must_check int media_pipeline_start(struct media_pad *origin,
> +                                     struct media_pipeline *pipe)
> +{
> +       return media_pipeline_start_context(origin, pipe, NULL);
> +}
>  EXPORT_SYMBOL_GPL(media_pipeline_start);
>
>  void __media_pipeline_stop(struct media_pad *pad)
> @@ -942,8 +1011,11 @@ void __media_pipeline_stop(struct media_pad *pad)
>         if (--pipe->start_count)
>                 return;
>
> -       list_for_each_entry(ppad, &pipe->pads, list)
> +       list_for_each_entry(ppad, &pipe->pads, list) {
> +               if (ppad->context)
> +                       media_entity_context_put(ppad->context);
>                 ppad->pad->pipe = NULL;
> +       }
>
>         media_pipeline_cleanup(pipe);
>
> @@ -962,14 +1034,13 @@ void media_pipeline_stop(struct media_pad *pad)
>  }
>  EXPORT_SYMBOL_GPL(media_pipeline_stop);
>
> -__must_check int media_pipeline_alloc_start(struct media_pad *pad)
> +static struct media_pipeline *
> +media_pipeline_alloc(struct media_pad *pad)
>  {
>         struct media_device *mdev = pad->graph_obj.mdev;
> -       struct media_pipeline *new_pipe = NULL;
>         struct media_pipeline *pipe;
> -       int ret;
>
> -       mutex_lock(&mdev->graph_mutex);
> +       lockdep_assert_held(&mdev->graph_mutex);
>
>         /*
>          * Is the pad already part of a pipeline? If not, we need to allocate
> @@ -977,19 +1048,33 @@ __must_check int media_pipeline_alloc_start(struct media_pad *pad)
>          */
>         pipe = media_pad_pipeline(pad);
>         if (!pipe) {
> -               new_pipe = kzalloc(sizeof(*new_pipe), GFP_KERNEL);
> -               if (!new_pipe) {
> -                       ret = -ENOMEM;
> -                       goto out;
> -               }
> +               pipe = kzalloc(sizeof(*pipe), GFP_KERNEL);
> +               if (!pipe)
> +                       return ERR_PTR(-ENOMEM);
>
> -               pipe = new_pipe;
>                 pipe->allocated = true;
>         }
>
> +       return pipe;
> +}
> +
> +__must_check int media_pipeline_alloc_start(struct media_pad *pad)
> +{
> +       struct media_device *mdev = pad->graph_obj.mdev;
> +       struct media_pipeline *pipe;
> +       int ret;
> +
> +       mutex_lock(&mdev->graph_mutex);
> +
> +       pipe = media_pipeline_alloc(pad);
> +       if (IS_ERR(pipe)) {
> +               ret = PTR_ERR(pipe);
> +               goto out;
> +       }
> +
>         ret = __media_pipeline_start(pad, pipe);
>         if (ret)
> -               kfree(new_pipe);
> +               kfree(pipe);
>
>  out:
>         mutex_unlock(&mdev->graph_mutex);
> @@ -998,6 +1083,33 @@ __must_check int media_pipeline_alloc_start(struct media_pad *pad)
>  }
>  EXPORT_SYMBOL_GPL(media_pipeline_alloc_start);
>
> +__must_check
> +int media_pipeline_alloc_start_context(struct media_pad *pad,
> +                                      struct media_device_context *mdev_context)
> +{
> +       struct media_device *mdev = pad->graph_obj.mdev;
> +       struct media_pipeline *pipe;
> +       int ret;
> +
> +       mutex_lock(&mdev->graph_mutex);
> +
> +       pipe = media_pipeline_alloc(pad);
> +       if (IS_ERR(pipe)) {
> +               ret = PTR_ERR(pipe);
> +               goto out;
> +       }
> +
> +       ret = __media_pipeline_start_context(pad, pipe, mdev_context);
> +       if (ret)
> +               kfree(pipe);
> +
> +out:
> +       mutex_unlock(&mdev->graph_mutex);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(media_pipeline_alloc_start_context);
> +
>  struct media_pad *
>  __media_pipeline_pad_iter_next(struct media_pipeline *pipe,
>                                struct media_pipeline_pad_iter *iter,
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index fafd4209e2cab320a6e164d33e9a0f73784d22db..eacaa38cffe8847b66acdeebf2330a072b3be85f 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1221,6 +1221,36 @@ __must_check int __video_device_pipeline_start(struct video_device *vdev,
>  }
>  EXPORT_SYMBOL_GPL(__video_device_pipeline_start);
>
> +__must_check int
> +video_device_context_pipeline_start(struct video_device_context *context,
> +                                   struct media_pipeline *pipe)
> +{
> +       struct video_device *vdev = context->vdev;
> +       struct media_entity *entity = &vdev->entity;
> +
> +       if (entity->num_pads != 1)
> +               return -ENODEV;
> +
> +       return media_pipeline_start_context(&entity->pads[0], pipe,
> +                                           context->base.mdev_context);
> +}
> +EXPORT_SYMBOL(video_device_context_pipeline_start);
> +
> +__must_check int
> +__video_device_context_pipeline_start(struct video_device_context *context,
> +                                     struct media_pipeline *pipe)
> +{
> +       struct video_device *vdev = context->vdev;
> +       struct media_entity *entity = &vdev->entity;
> +
> +       if (entity->num_pads != 1)
> +               return -ENODEV;
> +
> +       return __media_pipeline_start_context(&entity->pads[0], pipe,
> +                                             context->base.mdev_context);
> +}
> +EXPORT_SYMBOL(__video_device_context_pipeline_start);
> +
>  void video_device_pipeline_stop(struct video_device *vdev)
>  {
>         struct media_entity *entity = &vdev->entity;
> @@ -1254,6 +1284,20 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev)
>  }
>  EXPORT_SYMBOL_GPL(video_device_pipeline_alloc_start);
>
> +__must_check int
> +video_device_context_pipeline_alloc_start(struct video_device_context *context)
> +{
> +       struct video_device *vdev = context->vdev;
> +       struct media_entity *entity = &vdev->entity;
> +
> +       if (entity->num_pads != 1)
> +               return -ENODEV;
> +
> +       return media_pipeline_alloc_start_context(&entity->pads[0],
> +                                                 context->base.mdev_context);
> +}
> +EXPORT_SYMBOL_GPL(video_device_context_pipeline_alloc_start);
> +
>  struct media_pipeline *video_device_pipeline(struct video_device *vdev)
>  {
>         struct media_entity *entity = &vdev->entity;
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 32298fe8a18c6ee3c1dbcff9ef869548904417a7..b60c311ab390beb6931fe8f2bbe8939e11cda452 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -119,16 +119,20 @@ struct media_pipeline {
>   * @list:              Entry in the media_pad pads list
>   * @pipe:              The media_pipeline that the pad is part of
>   * @pad:               The media pad
> + * @context:           Reference to a video device or subdevice context
>   *
>   * This structure associate a pad with a media pipeline. Instances of
>   * media_pipeline_pad are created by media_pipeline_start() when it builds the
>   * pipeline, and stored in the &media_pad.pads list. media_pipeline_stop()
> - * removes the entries from the list and deletes them.
> + * removes the entries from the list and deletes them. The context field is
> + * populated only if a valid context has been associated with the pad.
>   */
> +struct media_entity_context;
>  struct media_pipeline_pad {
>         struct list_head list;
>         struct media_pipeline *pipe;
>         struct media_pad *pad;
> +       struct media_entity_context *context;
>  };
>
>  /**
> @@ -1212,6 +1216,39 @@ __must_check int media_pipeline_start(struct media_pad *origin,
>  __must_check int __media_pipeline_start(struct media_pad *origin,
>                                         struct media_pipeline *pipe);
>
> +/**
> + * media_pipeline_start_context - Mark a pipeline as streaming
> + * @origin: Starting pad
> + * @pipe: Media pipeline to be assigned to all pads in the pipeline.
> + * @context: The media device context the pipeline belongs to
> + *
> + * Mark all pads connected to a given pad through enabled links, either
> + * directly or indirectly, as streaming. The given pipeline object is assigned
> + * to every pad in the pipeline and stored in the media_pad pipe field.
> + *
> + * Calls to this function can be nested, in which case the same number of
> + * media_pipeline_stop() calls will be required to stop streaming. The
> + * pipeline pointer must be identical for all nested calls to
> + * media_pipeline_start().
> + */
> +__must_check int
> +media_pipeline_start_context(struct media_pad *origin,
> +                            struct media_pipeline *pipe,
> +                            struct media_device_context *context);
> +
> +/**
> + * __media_pipeline_start_context - Mark a pipeline as streaming
> + * @origin: Starting pad
> + * @pipe: Media pipeline to be assigned to all pads in the pipeline.
> + * @context: The media device context the pipeline belongs to
> + *
> + * ..note:: This is the non-locking version of media_pipeline_start_context()
> + */
> +__must_check int
> +__media_pipeline_start_context(struct media_pad *origin,
> +                              struct media_pipeline *pipe,
> +                              struct media_device_context *context);
> +
>  /**
>   * media_pipeline_stop - Mark a pipeline as not streaming
>   * @pad: Starting pad
> @@ -1318,6 +1355,23 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
>   */
>  __must_check int media_pipeline_alloc_start(struct media_pad *pad);
>
> +/**
> + * media_pipeline_alloc_start_context - Mark a pipeline as streaming
> + * @pad: Starting pad
> + * @context: The media device context the pipeline belongs to
> + *
> + * media_pipeline_alloc_start_context() is similar to
> + * media_pipeline_start_context() but instead of working on a given pipeline the
> + * function will use an existing pipeline if the pad is already part of a
> + * pipeline, or allocate a new pipeline.
> + *
> + * Calls to media_pipeline_alloc_start_context() must be matched with
> + * media_pipeline_stop().
> + */
> +__must_check int
> +media_pipeline_alloc_start_context(struct media_pad *pad,
> +                                  struct media_device_context *context);
> +
>  /**
>   * media_devnode_create() - creates and initializes a device node interface
>   *
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index bab4b13b109362bec84d8d16440b6ea895206b60..93095df692e3628d4be003d25843fa744d6b20a4 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -602,6 +602,48 @@ __must_check int video_device_pipeline_start(struct video_device *vdev,
>  __must_check int __video_device_pipeline_start(struct video_device *vdev,
>                                                struct media_pipeline *pipe);
>
> +/**
> + * video_device_context_pipeline_start - Mark a pipeline as streaming starting
> + *                                      from a video device context
> + * @context: The video device context that starts the streaming
> + * @pipe: Media pipeline to be assigned to all entities in the pipeline.
> + *
> + * ..note:: This is the multi-context version of video_device_pipeline_start()
> + *          Documentation of this function only describes specific aspects of
> + *          this version. Refer to the video_device_pipeline_start()
> + *          documentation for a complete reference.
> + *
> + * Validate that all entities connected to a video device through enabled links
> + * by ensuring that a context associated with the same media device context
> + * exists for them. Increase the reference counting of each of the contexts part
> + * of the pipeline to guarantee their lifetime is maintained as long as the
> + * pipeline is streaming.
> + *
> + * Context validation and refcounting of all entities that are part of a
> + * streaming pipeline ensures that device drivers can safely access device
> + * contexts in a media device context during streaming. References to contexts
> + * retried by a call to media_device_get_entity_context(), are guaranteed to be
> + * valid as long as the pipeline is streaming. Likewise, the media device
> + * context that contains the device contexts is guaranteed to be valid as long
> + * as the pipeline is streaming.
> + */
> +__must_check int
> +video_device_context_pipeline_start(struct video_device_context *context,
> +                                   struct media_pipeline *pipe);
> +
> +/**
> + * __video_device_context_pipeline_start - Mark a pipeline as streaming starting
> + *                                        from a video device context
> + * @context: The video device context that starts the streaming
> + * @pipe: Media pipeline to be assigned to all entities in the pipeline.
> + *
> + * ..note:: This is the non-locking version of
> + *         __video_device_context_pipeline_start()
> + */
> +__must_check int
> +__video_device_context_pipeline_start(struct video_device_context *context,
> +                                     struct media_pipeline *pipe);
> +
>  /**
>   * video_device_pipeline_stop - Mark a pipeline as not streaming
>   * @vdev: Starting video device
> @@ -646,6 +688,21 @@ void __video_device_pipeline_stop(struct video_device *vdev);
>   */
>  __must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
>
> +/**
> + * video_device_context_pipeline_alloc_start - Mark a pipeline as streaming
> + * @context: The video device context that starts the streaming
> + *
> + * video_device_context_pipeline_alloc_start() is similar to
> + * video_device_context_pipeline_start() but instead of working on a given
> + * pipeline the function will use an existing pipeline if the video device is
> + * already part of a pipeline, or allocate a new pipeline.
> + *
> + * Calls to video_device_context_pipeline_alloc_start() must be matched with
> + * video_device_pipeline_stop().
> + */
> +__must_check int
> +video_device_context_pipeline_alloc_start(struct video_device_context *context);
> +
>  /**
>   * video_device_pipeline - Get the media pipeline a video device is part of
>   * @vdev: The video device
>
> --
> 2.49.0
>
>
