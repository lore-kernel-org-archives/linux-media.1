Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8A246D0BD
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 16:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787243760; cv=pass; b=XNovauIZ+KHoJxhogsL22sJSFtqIv4nrE/LZkiuBYrHJ38tByee8/wkt9eKx8LF6lGMy1E3VB4vwrs8P0nk/Kv6J5HHgqyK0B85bo4CpzO6cY/CLAiyaxtOFlFhq+7jHy/q+f3Ljy/x/BYiFIwgnm3uBdM9+ayrkjGUtUQ8acKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787243760; c=relaxed/simple;
	bh=ncEsqQ0AAYurKKLqsqrXr21Ar5a5RoOWWYL6ZOQlXcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPHhJ0JE16vI6YNdZOGgVHZDgDeIv17iVm9U+K9dXY+jzzxm6i6U74lx8CJHBECx/ogQ+M0k3vt+nrgqac23fJhAZ/VsZmG6fYnJhhVwcl2dQUIVRI7uxz8WV0yp3rjOmy1U4i2LANw4nZ4jtnYrNUQ3hKZfrOulkINC5snegqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk; spf=pass smtp.mailfrom=kynesim.co.uk; dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b=uwrAbve4; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b="uwrAbve4"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66c2d726650so4108d50.0
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 09:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787243757; cv=none;
        d=google.com; s=arc-20260327;
        b=ieMK4fjK0w2U5VY04Bm0muCjAEUBVJlt/HzWRRYu2yhyof7+9TFAKDIbO8xL5fVxgg
         2V3DtAzcWwHSU1WgPZMWol0Dxx0q6KW1eBIIGmGL7BgQCr2fvhCz3fxfWU+B/owv7Ki9
         WwP0PKvklw1fpuz+QN09DRJ12KA60giDuVrqB5GvzHxXrR7ZcA4EycMvZNCy0dx0uRkr
         4ed5lstji1aNqPp/I+gDx0YxxHjcSXjKX6/fS8bSKf0ydDrcqJmUVMOoP0DXOK1bJIhq
         XrworIC83/HX34llG5ZCDvC8f0+l/B7GvSp86m6pCJy5upxBV9M2GlZl4dXQHb6ThgxB
         TDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NYyiZU75J+4VHDQmrZ9Udm24uk72U3pWtfogoXgw+Us=;
        fh=HlrIm4oYengf7L8h2G7SEgh9XfO97Z0/o6yFdTdYZDY=;
        b=G2dA7SSgqB72ha8OYs+7lC+WaAdxPnp5dWrkiNIzgh5VNyYJG2Nu9u13CR5UvdZfGY
         78j3ixfeVhQ/b/10HApZxF+h5cRtVVDMIoqMaAGU9lJrW51jrLayk4Bagigy079CJwdY
         6bU8WdhibXApMu8WMoTlhI/YUvNYBC+KP8+tOryaRQ2qJqnE7fnT5jHxQoSoIUNdy3HR
         4yKnv1MxfXuWR+5dGe4uqxozbswVuNgP1Mj8njK4AcfR5XqxqPX0R6xNIyZkvd8dI1y+
         QgJw2h2rzKFaTb9Q3J8uoqL1xOSJE8RfQ3fvdwgjAHUPXqe60cIYFXMtTb1C6iu9y2PR
         1Szw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1787243757; x=1787848557; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYyiZU75J+4VHDQmrZ9Udm24uk72U3pWtfogoXgw+Us=;
        b=uwrAbve4Ax1qErCWxELg5U8KWoIvbOwEx7VzXPdhMs0Id/3Q3Q13zJ17NtXKOpEhWw
         XOh92KJ6vKsu2YFYr5P2PUxeNW3kBwG8fKnGPfrOHOLOXbYnE9r8Vom/7BZMoZNgbXFs
         Lkr2HHLAW61SEk8aaRjnzpk4sReBapDt7OqvpBhKFDP4+3XHe/OWSk6vYqovVWqeXP4u
         v17meVNBYqjg51BJHHqIOEa491o9kbqua1jG2Xt4KYWTOmackrKV2SC+3hHovhSOzURu
         8WIeS1fie548sYL04hVaAzsAJzd9BP5CZZw1k4aUHuUJQiTwk/joiW6SlT/55uhhllCs
         rtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787243757; x=1787848557;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NYyiZU75J+4VHDQmrZ9Udm24uk72U3pWtfogoXgw+Us=;
        b=a81ZXdlpPR47Y49iQB5p5wMGqA27bIjnMYOEohqKP3Q+K5MLS8FuYTJTjWb+1rjwcR
         siZT6+XmDFYxplXXASTxxQ1TWr3irNxHQ8knRK94RZwkyALpvdN2n4YMqh0WIQM8ItBy
         6BHfT6s/BiucH+hvBIRaUqM1zjNWzB81P2omwSf6nheSjSynC5nhL0AsNz1sL0QhLbOI
         0AVmAsQiFSmlb30jp7JPsF7Fa88MNbxaLs3bHzHIHPxIxGwVxOrXY0Xb0ZNY0nNgEWKw
         BTx2+qa0FQHNCHCab9H2JuRosjwWH0MOQHtsK9aSTN/rP/UQYWlKnxc4Lwv38djgRsb3
         jzvw==
X-Forwarded-Encrypted: i=1; AHgh+RqAmlNtOjqXTXZMpaGjyKiPK8OPbzIltUBfeVFhCw9Cevf/F/ioHEN+Ot5tlsaiB8avBphIsmHEW2AmwA==@vger.kernel.org
X-Gm-Message-State: AFuF++kGS6C1pCWc78q4hlCUD95Ef93yJA9Uu4hVOXyQXz8+/rFojb+p
	00G2Aan0M2Xx8OkPj6F+G3vxXBs7RinVxwnhLWKz6UE3GNBMTmSyjpCqxQ+PJGLK0ibkQK0sEsG
	DDnqx4bRxd65j/WkqLmSxw8/v5fTLNjmPEnefTtRj/Q==
X-Gm-Gg: AR+sD11sC1oKqkaMtHyzyBbYXpzBVDYnHr0fxnbB/KcQIfnucLq+1WDxy9tBl3x8jCJ
	sXPi+/M2Sa4Rx37jFAueAVws/MxR2vDtLpx5NoQgiBCMFxA4yuZsUaDc3wtDB6y21q2LjkpT3tp
	OZf+oy/A+IsFCohOoOhA+KmEv2nGNaK3tHBWR88BUOlmytn7aCupbwHX3myuBrcoIZ8prgaBcf4
	kKaeTYl2Dg2AW+j5nDZGe8vs/kUuBvMhiEEHTH+ZZ4A7xprWv657eA/Pxgl4/Oy2Mz/2inRPrnm
	ptv4YFwyTWiw8ubWb2Kla9Z+6+TVMNgVYop6lIrWE+w=
X-Received: by 2002:a05:690c:6c8e:b0:7ff:1a93:be35 with SMTP id
 00721157ae682-844df158a81mr55435577b3.16.1787243757334; Thu, 20 Aug 2026
 09:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
 <20250724-multicontext-mainline-2025-v2-16-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-16-c9b316773486@ideasonboard.com>
Reply-To: jc@kynesim.co.uk
From: John Cox <jc@kynesim.co.uk>
Date: Thu, 20 Aug 2026 17:35:44 +0100
X-Gm-Features: AcwNN1XvSxfmyHAua9fqxn606YkjVXnPvYXRH1omWRpiWwQiPt5bLdsOlWDBu1A
Message-ID: <CAFyCYyNsKa4CvpYNsRc_UabDg5emev6qdCtqUkqMHbJ0BNiOnw@mail.gmail.com>
Subject: Re: [PATCH v2 16/27] media: v4l2-subdev: Add subdev state accessor helpers
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

> The v4l2-subdev.c file offers three helpers to access the subdevice
> active state from a v4l2_subdev pointer:
>
> - v4l2_subdev_get_unlocked_active_state(sd)
> - v4l2_subdev_get_locked_active_state(sd)
> - v4l2_subdev_lock_and_get_active_state(sd)
>
> With the introduction of struct v4l2_subdev_context which contains a
> subdev_state as well, the actual "active" state is stored in three
> possible places:
> - A context associated with a v4l2_subdev_fh for context aware drivers
>   operated by context aware userspace
> - The default subdevice context for context aware drivers operated by
>   non-context aware userspace
> - The subdevice active state for non-context aware drivers
>
> Provide helpers similar in spirit the existing ones but accept as
> argument either a subdevice the context itself and retrieve the active
> state from the correct place.
>
> Helpers will be used in following patches for link validation.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 101 +++++++++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 104 +++++++++++++++++++---------------
>  2 files changed, 159 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 438f51980e5ac0f092ba6b0a979a376133968ddf..7372f61127c871cec44a3d1900e2b8bef34632b9 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -20,6 +20,7 @@
>  #include <linux/version.h>
>  #include <linux/videodev2.h>
>
> +#include <media/media-device.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -189,6 +190,106 @@ static inline int check_pad(struct v4l2_subdev *sd, u32 pad)
>         return 0;
>  }
>
> +/* subdev state accessor helpers */
> +
> +/*
> + * Access the state from the subdevice.
> + *
> + * If the driver is context-aware use the state stored in the default context
> + * otherwise use the active state stored in the subdevice.
> + */
> +
> +struct v4l2_subdev_state *
> +v4l2_subdev_get_unlocked_active_state_from_sd(struct v4l2_subdev *sd)
> +{
> +       if (!sd)
> +               return NULL;
> +
> +       if (sd->default_context) {
> +               lockdep_assert_not_held(sd->default_context->state->lock);
> +
> +               return sd->default_context->state;
> +       }
> +
> +       if (sd->active_state)
> +               lockdep_assert_not_held(sd->active_state->lock);
> +       return sd->active_state;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_unlocked_active_state_from_sd);
> +
> +struct v4l2_subdev_state *
> +v4l2_subdev_get_locked_active_state_from_sd(struct v4l2_subdev *sd)
> +{
> +       if (!sd)
> +               return NULL;
> +
> +       if (sd->default_context) {
> +               lockdep_assert_held(sd->default_context->state->lock);
> +
> +               return sd->default_context->state;
> +       }
> +
> +       if (sd->active_state)
> +               lockdep_assert_held(sd->active_state->lock);
> +       return sd->active_state;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_locked_active_state_from_sd);
> +
> +struct v4l2_subdev_state *
> +v4l2_subdev_lock_and_get_active_state_from_sd(struct v4l2_subdev *sd)
> +{
> +       if (!sd)
> +               return NULL;
> +
> +       if (sd->default_context) {
> +               v4l2_subdev_lock_state(sd->default_context->state);
> +
> +               return sd->default_context->state;
> +       }
> +
> +       if (sd->active_state)
> +               v4l2_subdev_lock_state(sd->active_state);
> +       return sd->active_state;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_lock_and_get_active_state_from_sd);
> +
> +/* Access the subdevice state from a subdvice context. */
> +struct v4l2_subdev_state *
> +v4l2_subdev_get_unlocked_active_state_from_ctx(struct v4l2_subdev_context *ctx)
> +{
> +       if (!ctx)
> +               return NULL;
> +
> +       if (ctx->state)
> +               lockdep_assert_not_held(ctx->state->lock);
> +       return ctx->state;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_unlocked_active_state_from_ctx);
> +
> +struct v4l2_subdev_state *
> +v4l2_subdev_get_locked_active_state_from_ctx(struct v4l2_subdev_context *ctx)
> +{
> +       if (!ctx)
> +               return NULL;
> +
> +       if (ctx->state)
> +               lockdep_assert_held(ctx->state->lock);
> +       return ctx->state;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_locked_active_state_from_ctx);
> +
> +struct v4l2_subdev_state *
> +v4l2_subdev_lock_and_get_active_state_from_ctx(struct v4l2_subdev_context *ctx)
> +{
> +       if (!ctx)
> +               return NULL;
> +
> +       if (ctx->state)
> +               v4l2_subdev_lock_state(ctx->state);
> +       return ctx->state;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_lock_and_get_active_state_from_ctx);
> +
>  static int check_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>                        u32 which, u32 pad, u32 stream)
>  {
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 1fa42a9f322be0be44fc9308744f4f4ae0cf1606..8087c0ae3bc0a0a95512b4b0ff5257522a104ca0 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -29,16 +29,17 @@
>
>  #define        V4L2_DEVICE_NOTIFY_EVENT                _IOW('v', 2, struct v4l2_event)
>
> -struct v4l2_device;
> +struct led_classdev;
> +struct media_device_context;
> +struct tuner_setup;
>  struct v4l2_ctrl_handler;
> +struct v4l2_device;
>  struct v4l2_event;
>  struct v4l2_event_subscription;
>  struct v4l2_fh;
> +struct v4l2_mbus_frame_desc;
>  struct v4l2_subdev;
>  struct v4l2_subdev_fh;
> -struct tuner_setup;
> -struct v4l2_mbus_frame_desc;
> -struct led_classdev;
>
>  /**
>   * struct v4l2_decode_vbi_line - used to decode_vbi_line
> @@ -1968,64 +1969,75 @@ static inline void v4l2_subdev_unlock_states(struct v4l2_subdev_state *state1,
>                 mutex_unlock(state2->lock);
>  }
>
> +struct v4l2_subdev_state *
> +v4l2_subdev_get_unlocked_active_state_from_sd(struct v4l2_subdev *sd);
> +struct v4l2_subdev_state *
> +v4l2_subdev_get_locked_active_state_from_sd(struct v4l2_subdev *sd);
> +struct v4l2_subdev_state *
> +v4l2_subdev_lock_and_get_active_state_from_sd(struct v4l2_subdev *sd);
> +
> +struct v4l2_subdev_state *
> +v4l2_subdev_get_unlocked_active_state_from_ctx(struct v4l2_subdev_context *ctx);
> +struct v4l2_subdev_state *
> +v4l2_subdev_get_locked_active_state_from_ctx(struct v4l2_subdev_context *ctx);
> +struct v4l2_subdev_state *
> +v4l2_subdev_lock_and_get_active_state_from_ctx(struct v4l2_subdev_context *ctx);
> +
>  /**
> - * v4l2_subdev_get_unlocked_active_state() - Checks that the active subdev state
> - *                                          is unlocked and returns it
> - * @sd: The subdevice
> + * v4l2_subdev_get_unlocked_active_state() - Checks that the subdev state is
> + *                                          unlocked and returns it
> + * @sdctx: The subdevice, or the subdevice context
>   *
> - * Returns the active state for the subdevice, or NULL if the subdev does not
> - * support active state. If the state is not NULL, calls
> - * lockdep_assert_not_held() to issue a warning if the state is locked.
> + * Returns the subdevice state, or NULL if it is not valid. If the state is
> + * not NULL, calls lockdep_assert_not_held() to issue a warning if the state
> + * is locked.
>   *
> - * This function is to be used e.g. when getting the active state for the sole
> - * purpose of passing it forward, without accessing the state fields.
> + * This function is to be used e.g. when getting the state for the sole purpose
> + * of passing it forward, without accessing the state fields.
>   */
> -static inline struct v4l2_subdev_state *
> -v4l2_subdev_get_unlocked_active_state(struct v4l2_subdev *sd)
> -{
> -       if (sd->active_state)
> -               lockdep_assert_not_held(sd->active_state->lock);
> -       return sd->active_state;
> -}
> +#define v4l2_subdev_get_unlocked_active_state(sdctx)                           \
> +       _Generic((sdctx),                                                       \
> +               struct v4l2_subdev *:                                           \
> +                       v4l2_subdev_get_unlocked_active_state_from_sd,          \
> +               struct v4l2_subdev_context *:                                   \
> +                       v4l2_subdev_get_unlocked_active_state_from_ctx)         \
> +       (sdctx)
>
>  /**
> - * v4l2_subdev_get_locked_active_state() - Checks that the active subdev state
> - *                                        is locked and returns it
> - *
> - * @sd: The subdevice
> + * v4l2_subdev_get_locked_active_state() - Checks that the subdev state is
> + *                                        locked and returns it
> + * @sdctx: The subdevice, or the subdevice context
>   *
> - * Returns the active state for the subdevice, or NULL if the subdev does not
> - * support active state. If the state is not NULL, calls lockdep_assert_held()
> - * to issue a warning if the state is not locked.
> + * Returns the subdevice state, or NULL is not valid. If the state is not NULL,
> + * calls lockdep_assert_held() to issue a warning if the state is not locked.
>   *
> - * This function is to be used when the caller knows that the active state is
> + * This function is to be used when the caller knows that the context state is
>   * already locked.
>   */
> -static inline struct v4l2_subdev_state *
> -v4l2_subdev_get_locked_active_state(struct v4l2_subdev *sd)
> -{
> -       if (sd->active_state)
> -               lockdep_assert_held(sd->active_state->lock);
> -       return sd->active_state;
> -}
> +#define v4l2_subdev_get_locked_active_state(sdctx)                             \
> +       _Generic((sdctx),                                                       \
> +               struct v4l2_subdev *:                                           \
> +                       v4l2_subdev_get_locked_active_state_from_sd,            \
> +               struct v4l2_subdev_context *:                                   \
> +                       v4l2_subdev_get_locked_active_state_from_ctx)           \
> +       (sdctx)
>
>  /**
> - * v4l2_subdev_lock_and_get_active_state() - Locks and returns the active subdev
> - *                                          state for the subdevice
> - * @sd: The subdevice
> + * v4l2_subdev_lock_and_get_active_state_from_ctx() - Locks and returns the
> + *                                                   subdevice state
> + * @sdctx: The subdevice, or the subdevice context
>   *
> - * Returns the locked active state for the subdevice, or NULL if the subdev
> - * does not support active state.
> + * Returns the locked subdevice state, or NULL if it is not valid.
>   *
>   * The state must be unlocked with v4l2_subdev_unlock_state() after use.
>   */
> -static inline struct v4l2_subdev_state *
> -v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
> -{
> -       if (sd->active_state)
> -               v4l2_subdev_lock_state(sd->active_state);
> -       return sd->active_state;
> -}
> +#define v4l2_subdev_lock_and_get_active_state(sdctx)                           \
> +       _Generic((sdctx),                                                       \
> +               struct v4l2_subdev *:                                           \v4l2_subdev_lock_and_get_active_state_from_
> +                       v4l2_subdev_lock_and_get_active_state_from_sd,          \
> +               struct v4l2_subdev_context *:                                   \
> +                       v4l2_subdev_get_locked_active_state_from_ctx)           \
Cut and paste error?
This should be v4l2_subdev_lock_and_get_active_state_from_ctx?

Regards

John Cox

> +       (sdctx)
>
>  /**
>   * v4l2_subdev_init - initializes the sub-device struct
>
> --
> 2.49.0
>
>
