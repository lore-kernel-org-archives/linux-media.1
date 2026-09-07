Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AB2403E9D
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 06:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763921; cv=none; b=KvcuSd8syl8XB4ogeRaU1PuVbFfRiqSKn7/V+UteDbsQK5mD6zws8rVHe6GVkdLtv8Jyeas5KAJu42CvNlSpHT37G/G46h1Yop4n9lLF69nRgQPOV9hq+ek1OhywFx8jGOZAX7jnimjFZVYpj+ay993xmiVDROjnJEmnOqn0ygI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763921; c=relaxed/simple;
	bh=zPTLqj7M2sowhCEMCOIjV4OUVmZP7xmVC8flf/vDf/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1QmoZupUFJELbnG3VFufBzZZJh3gElBGQvbqMQIIwrrU6lmJ1EqLFC2gw0uXIwzFYZKpf+eS0GnNHQpxHzaRR6bYlQifoJqqZtFeR0gFMY5XRvVSd3kICfDT2x0eLglXXLAUdKw9WYxHnwI5kwSSFZE2s2rn0GC+JHl8bow3H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=loZhoEav; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="loZhoEav"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so3233396a91.3
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 23:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788763919; x=1789368719; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0VAf/+VGb/j1E+84EtyzEfQ6Scvu4LmVjCogzBoYhM=;
        b=loZhoEavvjKvBZffzV1JRyqHlPhb7XBFuraDPEgWExGVbx+J72iYycfpsIFnPc9OSu
         wxaNksjq7LvYP/s8PW9CpEAT/l60uwZbIrqfuBLeDbXE2tgIVNcFepnMQkK6CphSQyqq
         /ShUlnWohGJL1seaSH2x2fOOMCJaJxblDAnNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763919; x=1789368719;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X0VAf/+VGb/j1E+84EtyzEfQ6Scvu4LmVjCogzBoYhM=;
        b=MCmR4pf3zxYoAIriOXN6eivXmbPSGUr6IcMGVXA0MOKcS4KnPtzigqHp7cKNJi/v7A
         Zge4gIGtYDoRYlqAM0sysWdwWdxVAM99jiyFZKZuvrYiovGW7Qxpzl8w4Jy8KyjEoiEP
         YNJYblrrrxW77X7Alt/Cw3bytul6SYInpTPeJu7mu8Q1lZLVK+HYQMsePkm/7uIcULIh
         EeGLcH8w+JcC8l76xDmYfl4vyq+MlL9HEz+NHQdqqPI+KL/mz5Cs7m2Vww32zdAUHXNR
         cPmmQbjbyHio9SlBY2Zytd4SvYZGg4vSIYEbLYtPGPP1WLfVgnJLbYyxbSoHBvfmJT78
         i9yA==
X-Forwarded-Encrypted: i=1; AKwUvBxvFLgCT2FlkkOI2USoGFP5NaOL9G+InUuJDer8bK0dRdRjPcszpUITvp6Q6z779EqIwqKMiCwMToa6fg==@vger.kernel.org
X-Gm-Message-State: AFuF++kClEbouurTheYQ9U6m7b9Z3izbQcmQez+EvOPLHxHIxbPK7Wks
	+//BEO4CfcCcJjIpQGUovqlh4eUGGh6j8i5wz+YmsAIwrn8uzdohTdyKSoPihlhtkjQiCpdaeCI
	+rvg=
X-Gm-Gg: AYBFou1po1mheLRrqMo8+o091oCTOiKqZDYT4xv7KZWE/W3U6iuC+YwAuoD7kgA0Z34
	sVJJDZynoJdTO3eIorMtZwr6Kj6tHfVZJj1/Ce/Q97vN4kj03b+veazM24NvoMqHtgv44R0jUhY
	Z1fsy9kmwxJPTZl13t64vU8O0nIZlINiFB1fwkmRrwBybln/nuyz2rK4T44Ifmi6zw1ry/MtErY
	GBEkqdm9yuePIQ88IkD1Qii4l+bQst5NtSooN+0NmR1YB5B0KURTD2qVpDYHZhY/k4Fu2FaEi+k
	w7u3r81DH0HMO3XSMpXwNRob88Y7sTE5bH8s/q/ubeq7W8fJ70aTs4VYrxrUKf2Aq74MH9WuUzQ
	3e1pxSzAoPPSSNhA9x/rV88bzamvfGO01QWvigw0iDP1x8kRwBizZ/4E3xowtiqJEQr4LnlMDwF
	AhNm7bueP3YMMOUZB1H2tgrA24dXXeJ+yU+pg3fNrs/Uuquj696gbldLDS7ybiQYq/KfljrT1hc
	J4suRunC8I28k67udV58cSxDZm5AQ==
X-Received: by 2002:a17:90b:3fd0:b0:398:d6e6:4671 with SMTP id 98e67ed59e1d1-39b262981a2mr31052248a91.25.1788763919415;
        Sun, 06 Sep 2026 23:51:59 -0700 (PDT)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com. [209.85.215.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26155324sm18281410a91.17.2026.09.06.23.51.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 23:51:58 -0700 (PDT)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca12086c06eso2528992a12.0
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 23:51:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxuIC5GdbtPCYKTdOAFsLmAaOMBrC/9x/KR6s2z8Gh4UCZ8T5mmP3k3BK+xtQFSNwFtVFTzIDJtb4sYig==@vger.kernel.org
X-Received: by 2002:a05:6a21:3417:b0:3bf:7081:9356 with SMTP id
 adf61e73a8af0-3da3a08ecdbmr34321628637.17.1788763918085; Sun, 06 Sep 2026
 23:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907062819.2519878-1-98lawweijie@gmail.com> <20260907062819.2519878-3-98lawweijie@gmail.com>
In-Reply-To: <20260907062819.2519878-3-98lawweijie@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 7 Sep 2026 08:51:45 +0200
X-Gmail-Original-Message-ID: <CANiDSCvMZzb3ObT3401_iYeE3g+n6kYxTpZVJoDrx4N2_=jrHg@mail.gmail.com>
X-Gm-Features: AcwNN1UsSDcKPkMILOpVw0AYVR4mteKdpMFX9Kcq10_nDYUkxjE4yE_OMWZcYCI
Message-ID: <CANiDSCvMZzb3ObT3401_iYeE3g+n6kYxTpZVJoDrx4N2_=jrHg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: Fix out-of-bounds read in uvc_ctrl_status_event()
To: Wei Jie Law <98lawweijie@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wei


I belive this is already handled here:

https://lore.kernel.org/linux-media/20260813-uvc-status-11-v1-1-2cf43e9590b0@chromium.org/

On Mon, 7 Sept 2026 at 08:34, Wei Jie Law <98lawweijie@gmail.com> wrote:
>
> An out-of-bounds read exists in v6.12.105 and upstream. KASAN crash log:
>
>   BUG: KASAN: slab-use-after-free in uvc_get_le_value+0x314/0x350
>   Read of size 1 at addr ffff88802df955e4 by task kworker/0:2/128
>   Workqueue: events uvc_ctrl_status_event_work
>    uvc_ctrl_status_event+0x128/0x280
>    uvc_ctrl_status_event_work+0x82/0x240
>   The buggy address belongs to the object at ffff88802df955e0
>    which belongs to the cache kmalloc-16 of size 16
>
> uvc_ctrl_add_mapping() validates mapping->offset against the control
> data buffer, sized from the device's GET_LEN answer.
> uvc_ctrl_status_event() applies the same offset to the 11 byte bValue
> field of a control change event, so uvc_get_le_value() reads past the
> 16 byte struct uvc_status and the value is reported to userspace as a
> V4L2_EVENT_CTRL change.  offset is a u8 bit offset, so the read reaches
> 24 bytes into the neighbouring objects; KASAN calls it a use-after-free
> because the neighbour it read had just been freed.
>
> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wei Jie Law <98lawweijie@gmail.com>
> Assisted-by: Claude:claude-opus-5
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 21802f9b1b61..d082bcb8d98d 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2156,11 +2156,16 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>                 uvc_ctrl_clear_handle(ctrl);
>
>         list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> -               s32 value;
> +               s32 value = 0;
>
> -               if (uvc_ctrl_mapping_is_compound(mapping))
> -                       value = 0;
> -               else
> +               /*
> +                * The offset is validated against the control size, not
> +                * against the event payload, so a mapping can reach past
> +                * bValue[].
> +                */
> +               if (!uvc_ctrl_mapping_is_compound(mapping) &&
> +                   mapping->offset + mapping->size <=
> +                       8 * sizeof_field(struct uvc_status_control, bValue))
>                         value = uvc_mapping_get_s32(mapping, UVC_GET_CUR, data);
>
>                 /*
> --
> 2.43.0
>
>


-- 
Ricardo Ribalda
