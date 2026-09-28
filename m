Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51B24E01E7
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 17:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617821; cv=none; b=HPAGaOXiwUBWYlTsnfhvEWoLHge3aTsMTucwbuNwzeXjYeLu5VS+EIT4N2ONEV0JS6NQJUXq7/JWOnKEC+1BLqg9tEH77DbevnJxsH0Cf5UrWkRcWEHR47Z/gxitZ404kmaLHBkYG64PB0DjmjtLvcZ23TvhjgREV/VGn476Grw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617821; c=relaxed/simple;
	bh=Vo7tiaS4qd/hQI2D/pUUMf1JmeMr8vHttgciIKPZ3t0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIk+arA4aGaNdeE3UW0MWMY7WaRfWQZx/93OuzrEm9K7riKU/s6eBIaojxMo830GJ1rgiY26oSUSkIOW5UfP8JM6wDBwcX29dM2aGyea/o+MvXbU6kPcyIyERiViGFThHYiRa2+0k/VkvaaeEh+pGZS2oDpk7Kkbxo/TIZSfEJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LeIbOH1m; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LeIbOH1m"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a48e359e0fso375548a91.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 10:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790617819; x=1791222619; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUOcs/vLJRWuvXVgcchrSjRSXVJyt3AuDbAQ0AxA9eE=;
        b=LeIbOH1mJLd7K8xq17V1Nb8ISWjQ7/imlcR6yI3oiBzxS5yZROzhAE4Bqa213zhnj2
         J/hIUQv2E6nBcSoKpX6HL7AbsBVsO/qrIpCxPQsCdccBwvRJIyPBoWx0eRzxpUMkS4Im
         r/VEt0W4YyAxRC0MMvpmyfiub7eTh3xBM1zOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617819; x=1791222619;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kUOcs/vLJRWuvXVgcchrSjRSXVJyt3AuDbAQ0AxA9eE=;
        b=x8+PSrCS+j122TvXm3md4Ln9WIe49ABpn8zjN5zM8VfYYquJR9pbIXLAV9U/JFOjWx
         6mnAwlb4CA7EYkDdWMOrCPE0Z4A39mGhk874rXCDjqDwoUA0lENgEnAqhKXgydJggnDR
         q2/E093V0ipj0hu5pJWhu1r0hYromzawt1Asf1edetRULt4JvyzzhHI8HmkKViVK8ufK
         f/Kuj7Zo9ujziHamq35gYU2NIo/zD57KPSNRRkVoPHdiCDhL25KU+GJPdgu+mB3NfSWq
         vOJTv4RqXbg6ocqrBLzcLCR+pu29f809chRz7sBaZJlhtxf0nXvGBtwAf7A5+Jlozlbp
         Qcmg==
X-Forwarded-Encrypted: i=1; AKwUvBzAz1JdNwBpKE3aBBeKTy5kOlGBo+7Wq/i0A3QGSOrpeHPVvCCi4qe1iKg4lZOYVUO3F1Zn+0pNO2umPw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2W5x15ItjCkQO7QKIE5dTmfoN0KmPFYfjsAEHJuyg5LrvMw4q
	cgMkZwzKUUl2tc6uHEK4MBNycE353Pe99yb/olDdi+1AdiF1OzkbZrQvRB11dumIjLIYrfINDCw
	OcP0Mbw==
X-Gm-Gg: AYBFou0oiWaH1Yvz/NTEl1MV9JtV1pax44hGn3SFKAvCnWB34B27RvtvWs5uEemDXtc
	3uNddzfh+9w2spnJ6pI0yGQdvUcBgocyB5uOTTDkTtxHYdZ8NVUa2EnYr92ymr8nedXqh/XxqSd
	LoLYthDjZJncPDuoWZ3fC8Yvp/ji9Q3g7eA/GLc8GNmSY6Ly9AXx4yVra5fkjgbyXyd2nz9eOJv
	tL0VRQHVUoinR4mOoankTIxgZhD3YFcb6T9cQhjnFIKASaTRgX4P/Cjj8uvulMucLaD2DntRllT
	Cx4YUNXix2YZEAGzfhHP4Mixi/uHnuLIt6EsgmuI8qvKrXMQCVk6c4HL5am+asM2ZKbgaSIN2FG
	3RtErRSUBXMXJj+ry3+TlDtdDpQXafPF+Pm0wZ5YlAfvbt0KuJnKKsHaVw+cts6mG39o8rHe0jp
	OqZ1+5GPca0ZB7sqpdhPAsxd6UJql2gzQkYzL1IqYHbFGmYWJT8pOvrHyL4XKloFJe6jbd+jfSA
	3X3hX3bFLyZ4aaTI8bW4PS+XTxBGDjGoJ/J
X-Received: by 2002:a17:90b:39a6:b0:3a0:c0f0:9a96 with SMTP id 98e67ed59e1d1-3a0c0f0ab36mr8150185a91.62.1790617818981;
        Mon, 28 Sep 2026 10:50:18 -0700 (PDT)
Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com. [74.125.229.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498d8ee5esm184747a91.2.2026.09.28.10.50.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:50:18 -0700 (PDT)
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-34182b58d00so2317110eec.2
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 10:50:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwr5JL/ZXlW3fmxyjh6HuXjTDa71JFF6KB1wJk48fJJK1gBND9bdjoc6vlgAACFVaQLF50GXnaKYh0Y4A==@vger.kernel.org
X-Received: by 2002:a05:7022:5f08:b0:143:2982:1043 with SMTP id
 a92af1059eb24-146d039e75bmr8017356c88.36.1790617816308; Mon, 28 Sep 2026
 10:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928152416.766957-1-jordan.mymail@gmail.com> <20260928152416.766957-3-jordan.mymail@gmail.com>
In-Reply-To: <20260928152416.766957-3-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 19:50:01 +0200
X-Gmail-Original-Message-ID: <CANiDSCv4R-ogez_NaXdx+q+ejQLKhPTqdR6Dx1-HAk6Y3EHKsQ@mail.gmail.com>
X-Gm-Features: AclHuK-Ewb6GQzGWa58AXBEImlBnO_UZyyEBA5b-FDYbjUaORX1kCvkIJxuHdec
Message-ID: <CANiDSCv4R-ogez_NaXdx+q+ejQLKhPTqdR6Dx1-HAk6Y3EHKsQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] media: uvcvideo: generalise the XU flags fixup to
 all controls
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Michael


On Mon, 28 Sept 2026 at 17:24, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
> uvc_ctrl_fixup_xu_info() overrides the flags of controls whose GET_INFO
> reply is known to be wrong, but is only called for extension unit
> controls. Standard controls can have the same problem.
>
> Rename it to uvc_ctrl_fixup_flags() and call it from
> uvc_ctrl_get_flags(), which handles all controls. When an entry
> matches, skip the GET_INFO request, as its result would be overridden.
>
> Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Assisted-by: Claude:claude-fable-5

nit: I think that the current way is to not mention the model version

Assisted-by: LLM

https://docs.kernel.org/process/coding-assistants.html#attribution

If you need to respin please fix it, but maybe Hans or Laurent fix it for you.

Regards!
> Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 91 ++++++++++++++++++--------------
>  1 file changed, 50 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index aceb263103e9..64c90c380d3d 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2852,6 +2852,48 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
>   * Dynamic controls
>   */
>
> +static bool uvc_ctrl_fixup_flags(struct uvc_device *dev,
> +                                const struct uvc_control *ctrl,
> +                                struct uvc_control_info *info)
> +{
> +       struct uvc_ctrl_fixup {
> +               struct usb_device_id id;
> +               u8 entity;
> +               u8 selector;
> +               u8 flags;
> +       };
> +
> +       static const struct uvc_ctrl_fixup fixups[] = {
> +               { { USB_DEVICE(0x046d, 0x08c2) }, 9, 1,
> +                       UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> +                       UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> +                       UVC_CTRL_FLAG_AUTO_UPDATE },
> +               { { USB_DEVICE(0x046d, 0x08cc) }, 9, 1,
> +                       UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> +                       UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> +                       UVC_CTRL_FLAG_AUTO_UPDATE },
> +               { { USB_DEVICE(0x046d, 0x0994) }, 9, 1,
> +                       UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> +                       UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> +                       UVC_CTRL_FLAG_AUTO_UPDATE },
> +       };
> +
> +       unsigned int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(fixups); ++i) {
> +               if (!usb_match_one_id(dev->intf, &fixups[i].id))
> +                       continue;
> +
> +               if (fixups[i].entity == ctrl->entity->id &&
> +                   fixups[i].selector == info->selector) {
> +                       info->flags = fixups[i].flags;
> +                       return true;
> +               }
> +       }
> +
> +       return false;
> +}
> +
>  /*
>   * Retrieve flags for a given control
>   */
> @@ -2862,6 +2904,14 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
>         u8 *data;
>         int ret;
>
> +       /*
> +        * Some devices report bogus capabilities through GET_INFO. If the
> +        * fixup table covers this control, take the flags from the table and
> +        * skip the query altogether.
> +        */
> +       if (uvc_ctrl_fixup_flags(dev, ctrl, info))
> +               return 0;
> +
>         data = kmalloc(1, GFP_KERNEL);
>         if (data == NULL)
>                 return -ENOMEM;
> @@ -2893,45 +2943,6 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
>         return ret;
>  }
>
> -static void uvc_ctrl_fixup_xu_info(struct uvc_device *dev,
> -       const struct uvc_control *ctrl, struct uvc_control_info *info)
> -{
> -       struct uvc_ctrl_fixup {
> -               struct usb_device_id id;
> -               u8 entity;
> -               u8 selector;
> -               u8 flags;
> -       };
> -
> -       static const struct uvc_ctrl_fixup fixups[] = {
> -               { { USB_DEVICE(0x046d, 0x08c2) }, 9, 1,
> -                       UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> -                       UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> -                       UVC_CTRL_FLAG_AUTO_UPDATE },
> -               { { USB_DEVICE(0x046d, 0x08cc) }, 9, 1,
> -                       UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> -                       UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> -                       UVC_CTRL_FLAG_AUTO_UPDATE },
> -               { { USB_DEVICE(0x046d, 0x0994) }, 9, 1,
> -                       UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> -                       UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> -                       UVC_CTRL_FLAG_AUTO_UPDATE },
> -       };
> -
> -       unsigned int i;
> -
> -       for (i = 0; i < ARRAY_SIZE(fixups); ++i) {
> -               if (!usb_match_one_id(dev->intf, &fixups[i].id))
> -                       continue;
> -
> -               if (fixups[i].entity == ctrl->entity->id &&
> -                   fixups[i].selector == info->selector) {
> -                       info->flags = fixups[i].flags;
> -                       return;
> -               }
> -       }
> -}
> -
>  /*
>   * Query control information (size and flags) for XU controls.
>   */
> @@ -2972,8 +2983,6 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
>                 goto done;
>         }
>
> -       uvc_ctrl_fixup_xu_info(dev, ctrl, info);
> -
>         uvc_dbg(dev, CONTROL,
>                 "XU control %pUl/%u queried: len %u, flags { get %u set %u auto %u }\n",
>                 info->entity, info->selector, info->size,
> --
> 2.43.0
>


-- 
Ricardo Ribalda
