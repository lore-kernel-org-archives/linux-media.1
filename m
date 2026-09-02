Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6312330E85B
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 06:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331122; cv=none; b=Yku/ApkvUYbX9H5KuVKtB64Pp9+Ji0X0DI9x/4zGbKH5Qw/FxoL1ef+D8faWn02i78ZLBsVkkjF63IE0quVpAVem9U88VlyeGdcqHDGYNbBJBUhT8yiPnW507yHpez4Gk6TvFNSWsH6FD0iKh4xjwmWzCZtsmlycUyozZUTkRQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331122; c=relaxed/simple;
	bh=d4vLhITn+jR/h6W3zj3Hov9b+bUcb/iUnGTEbg+K46g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ExM4wCGyWVdT7U7t04uQu2YeXclbcqh9mAHiPSFaFu0Yc0nSNNbuJYqBfmzCDzX6n6D9r7q5/odSd1n3ZSsq+fsLVk28iDSfULCVdGlHYCVCF6rcwCLcR9rMVIKmOE2Y1uKMZw+dKm4OkYDsrwp2JrHhJlyfJlqAvvm9GxaNGCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kOK+dnXU; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kOK+dnXU"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8568e3ed034so576421b3a.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 23:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788331121; x=1788935921; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpQcfp2zeHT8RNQwdlP8Z2qS1OhmNqrs1OuEaNbmbws=;
        b=kOK+dnXU/IQStXCqfWj6g9vkNX8OJdbJ2A8U2yCYRiLUdklUnHecOSk1qR+WFZiA/I
         Yk+smBJybqStI9gSEEL881Zs9ENsSdfad4paR1vhlqBRddR38SyTDyXRI500PDaoVpEg
         /wfzUfE5zXagxjD7qjAMWJwTsVSVyEbOBofYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331121; x=1788935921;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xpQcfp2zeHT8RNQwdlP8Z2qS1OhmNqrs1OuEaNbmbws=;
        b=p+ZF/yrlrVH8qf0sm7rhlWC+Y3uMcIV82j3D0PYiCPa3BsPBbiBfzLVdt5POJi8Cl4
         0lo0ypqjfhDgMWCPcjZIfPAGo7FRYW4zEllLzSIhCtzoirlT1I4HMmWvbb/yuKXVum8s
         w6KutjdZ9ssfBZIu08xM3a52XUCyNjDtmdMJGm3zddAk6pZ9uIFWdldmZLU4oe44G6Jo
         RFl6CKRfVVMF44fEKRGnXb0U/0qq/3E+5js31UzeFAFpqp5AJRC9o6Iomo6NYrD1CVpz
         mma2SflB8ESM14nLns19Pt7sYJzeM5o8HmyWc4cj7OleK6XlVDsvbgRqwOwnAZK/XZny
         sLdw==
X-Forwarded-Encrypted: i=1; AKwUvByvl0cZ4s50rQT6FqQ5BbdHy1GLxXXRtRezaujHzf8eT+JG1kACs+4RNrl5qHJvnavstCbHNoC7+KLY8g==@vger.kernel.org
X-Gm-Message-State: AFuF++n2fpocfszuJw/tPIaynLutH5qjEm5TmASbyMHJDe9mLGumuQja
	alU+S08MOQ2pYGk6rVqiX7uynsfZ0+DTy0twDyCX1ww/Sdmiia5ilC0olBe82AuCwctLFWWyHp3
	I4fofUA==
X-Gm-Gg: AYBFou3iSAivjZSquI6Do0AWqWn2BV1J8o7Sy5klD1xYYfngMR2v4411vnnLZeXq1/7
	wTHosNW8BGP4eivjLiFujBjEI089Wc0fzQH5SULcN/K6vOC1gMe/AiXmYglz1Lq7HH/N+/QI3yv
	GO26rr1SyAlVdlCwwfYetHVgHw7hjTwer7hM2S0zch2c0uMSHx9WWwgyJ1+Kuim2MvmqZSL9NUL
	xkK2uZANKtZeEsuUVzDiCnEbfDBMeJ+QLjoqAerd2xrN72XEbavndGAoc3J/ul2+7IJLAKs1/Uk
	Oc0Ea7Ygfong378cH6o0j7pHnW7AQjoswSHH6jYtzT1LnrSjL2V7vTzgo1uvsknHgbelfa6oLqk
	wcUhLva64rpDbokD5ovxo0uG8+hbcCFqdna7rPdqEm1b3irO8BsacckjNbKFr7hJ40HSrUIbvbv
	SC2ZcvLF/Si282gW9ctEptb2frWN6VJWDfzzjFqVvsYTrMuraLbLTag6Rb1pOTMZGkeraCZWZ+r
	3Xz6SOkkZwYa7H8kqqcLZ8o8w==
X-Received: by 2002:a05:6a00:4c9c:b0:857:7317:cff3 with SMTP id d2e1a72fcca58-85ed444cdcbmr4952226b3a.20.1788331119914;
        Tue, 01 Sep 2026 23:38:39 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc11f44a8sm848049b3a.56.2026.09.01.23.38.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:38:39 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so637347a91.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 23:38:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxBtQCkIUhKC4SXGj2lrXlI7D1QcjLSG4WS7p+N6Tdwx56yn0/rfDb4FAArsOodRbUh35QweUc8CBG7GQ==@vger.kernel.org
X-Received: by 2002:a17:90b:4a:b0:398:9be9:ab92 with SMTP id
 98e67ed59e1d1-39aee17ab22mr4098888a91.23.1788331117973; Tue, 01 Sep 2026
 23:38:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902002553.34839-1-jordan.mymail@gmail.com> <20260902002553.34839-3-jordan.mymail@gmail.com>
In-Reply-To: <20260902002553.34839-3-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 2 Sep 2026 08:38:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCtNb1YE1CgUCx4a+WFbjrNDbuoSRN_Y2F+fyWH7zae5oA@mail.gmail.com>
X-Gm-Features: AcwNN1VaVnNnO0ABGaKnSfEvaKXGYoxdBD-bQsnkN8Htq1fDqUxdpnpCBKWudIg
Message-ID: <CANiDSCtNb1YE1CgUCx4a+WFbjrNDbuoSRN_Y2F+fyWH7zae5oA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] media: uvcvideo: generalise the XU flags fixup to
 all controls
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael

On Wed, 2 Sept 2026 at 02:25, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
> uvc_ctrl_fixup_xu_info() holds a per-device table of controls whose
> GET_INFO reply is wrong, and overrides the flags for them. It only runs
> from uvc_ctrl_fill_xu_info(), so it can only correct extension unit
> controls, but standard controls suffer from the same class of firmware
> bug: a device can report a wrong capability byte for a Camera Terminal
> or Processing Unit control just as easily.
>
> Rename it to uvc_ctrl_fixup_flags() and call it at the start of
> uvc_ctrl_get_flags(), where the flags are derived from GET_INFO for
> every control, standard and XU alike. The fixup replaces the flags
> wholesale, so when the table covers a control there is no point in
> querying a device we already know gives a wrong answer: return early
> and skip the GET_INFO request altogether. The call in
> uvc_ctrl_fill_xu_info() is dropped, as uvc_ctrl_get_flags() now handles
> the fixup for XU controls too.
>
> No functional change for the devices already in the table: their
> entries are XU controls, matched by entity and selector before as they
> are now, and their flags come from the table either way. The only
> difference is one GET_INFO request no longer issued per fixed-up
> control.
>
> Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 91 ++++++++++++++++++--------------
>  1 file changed, 50 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index aceb26310..64c90c380 100644
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
