Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8F13B995E
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 09:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168964; cv=none; b=riBqTaHOjW4pPRYnw1qw6QYWW7JfBWrIObp9vQ0Je0/+AmnkxfjQwK6Ksc9fdFggfkwTcMK951sZlB0lArqjZiM1+vbWMPVRXhWMVFKQ+9nfrRC1WsJTte+fJgoWLQ4V54YSRJWZBJFDQYlkE12uI84ZeY/BRCnG5o3wwhTLfw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168964; c=relaxed/simple;
	bh=7Mb+q6N+WQ81Oqcs4xdKYoCQuYOk9+K+7xb3AxjM1mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irRJfROlZx/y2bKdwOURsSEjcDQ2CNN8YXzInW6bAESXv4B/X6XRXeHa4rzeO96RSPupimdQr+FNHkK1q7T0mZ9/zGvVBtfT4fMncZ8z7U2u81fVp5IP0pE0HE5q5hMTanog6K3dSmqsWWt8SJBxi0Px2XredxESxWXm5Wgvz64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mZxpOwb5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mZxpOwb5"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d942c7cc2fso3004025ad.3
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 02:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788168962; x=1788773762; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FN1nAbCl0iWx1Jrj/gmdbaIbN4coW5aF8DCQuC7TC90=;
        b=mZxpOwb57z0ZQCis9Xax0JrtF0G6ZEc59kRDs8TsvbmGQbseKUa4CoZXO8xUjfPaNW
         EMbVSmurKMMNHe+Xy8WkuQfsJev9uFGo+Rv2xIBj8X+bXjrvbLdgCTKU8nKBdpLA2RNT
         SZHurQCrpmn9ObVq9SoCwLzeUkbnBInvshwto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168962; x=1788773762;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FN1nAbCl0iWx1Jrj/gmdbaIbN4coW5aF8DCQuC7TC90=;
        b=rTZlLUkuYOoh85IUOfOKZarg+l0lWVE3PInjbbplRfoank2anXYhTrRs4ufsc4f3Wa
         ln8jgPsewnHBLPR/IRDJcOoaZOnMUav6hk993VY7cbMQqfa70yNPHi/epys1TCBhFFde
         TLWlJfW3Yr97IcVtI/TcLKJIBhuDTTyfJiVUXeo+rc4qdaz1zCjQNJjjibVjKwobbtLK
         jamoortz5qvk5+ZTHsAL6GGiM+DPkmWLVsCbrtoYyLnr/GsCqBGBZzynP8ObNH6xbamo
         /dasQOHv66nysPsfm5wHqQpomj9UoHi60pXlbUL3qDdZVH53i7bA62d7YUgxB6RgGV+d
         YfFA==
X-Forwarded-Encrypted: i=1; AHgh+RoKRl17/Jc3VspT6JzMO5mZuqo1VcUzKtfGuxGB5ippB2ZaoKpHxrjSJWWAuVuVSiY7L8iMe+WhSJgq6A==@vger.kernel.org
X-Gm-Message-State: AFuF++kZNwIf27/jjsy2QULU7idLnohtHFgEoXJyZP0GRVqipTz6RwsP
	5Hk4GrX6zk+Oft/zNuEpZjFjNjLcaRLngqvESRjcsP5yebgf/tRcGpxTXt3Dx0ikXF4mGJQMZYl
	REx3UkEyQ
X-Gm-Gg: AYBFou3QW+KFmiQrg+qWOdAaPDa9dMciiwzFirTaPgraJf6t2JMQX/gvTFEX6UId3QD
	yhrRGEkKca4YSQRrJKVBqgWMoEHA2F8LSjt74J7yNalcZZ6sdYwQ2HBfIKvhpHAZeIufCW/n7NW
	B9xftXIB5xrzKkisQtQgA55v9iU3fMansxj7ZPqC89/2puTHTRiiMCbs8ppH9c4misJrmJMpV5U
	twbZFYZE+HzI+stuweavHClwD1e3D/bMGR7tfEHq7J+Cq62Jx5M3wgK7yeDy98riP34IoKOsMQd
	jcgPq6A7M658lRK4WKuDM+ev/btCCwDUXrq8XU6o9pWR3q3RdDSXzcKilu/0zD7AEzRZRl6XtSx
	OFgMVuKaUJqQBuy0Xz0ecWD3dkG+S2Vp8K35N5oad7UZ9NHEG7/AMpWpaT7wfG3IXpK36B/hin2
	2fflSU4CgfYXrPqkd0R0uatz3+nYAZsziy1UFpuxalt/TvU+mjz06fI2NEQOreekKD/14IVw0DY
	+SU+rdsz0MJUMii3aObpXWgS4Gsug==
X-Received: by 2002:a17:902:d2d0:b0:2d9:2148:12ab with SMTP id d9443c01a7336-2d9214813bamr64486165ad.8.1788168961621;
        Mon, 31 Aug 2026 02:36:01 -0700 (PDT)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com. [209.85.210.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598b98cbsm31883685ad.76.2026.08.31.02.36.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:36:00 -0700 (PDT)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-85590c5aeabso2380940b3a.3
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 02:36:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr9HY0H0n1EjGO9PBbnvpcC+kii6A2WgBe5ez7YYiGt9zu7b/jVlwF9jNoyTTh9D8Ij8likMDzwUv4M1w==@vger.kernel.org
X-Received: by 2002:a05:6a21:3a93:b0:3cc:eea9:f757 with SMTP id
 adf61e73a8af0-3d268f0155amr42887925637.16.1788168959895; Mon, 31 Aug 2026
 02:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828152557.653475-1-jordan.mymail@gmail.com> <20260828152557.653475-3-jordan.mymail@gmail.com>
In-Reply-To: <20260828152557.653475-3-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 11:35:46 +0200
X-Gmail-Original-Message-ID: <CANiDSCuBjSBaFn+_tU0_mJJPmYS22hYDtKkQPdA-hdyoYyAx2Q@mail.gmail.com>
X-Gm-Features: AcwNN1XgkLCjecn-xMPBFQ2S99WV76kJbhuKbPVXzKnNTlVDVd-mHsiSIZiuY6g
Message-ID: <CANiDSCuBjSBaFn+_tU0_mJJPmYS22hYDtKkQPdA-hdyoYyAx2Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: uvcvideo: generalise the XU flags fixup to all controls
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael

Thanks for your patch

On Fri, 28 Aug 2026 at 17:26, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
> uvc_ctrl_fixup_xu_info() holds a per-device table of controls whose
> GET_INFO reply is wrong, and overrides the flags for them. It only runs
> from uvc_ctrl_fill_xu_info(), so it can only correct extension unit
> controls, but standard controls suffer from the same class of firmware
> bug: a device can report a wrong capability byte for a Camera Terminal
> or Processing Unit control just as easily.
>
> Rename it to uvc_ctrl_fixup_flags() and call it from
> uvc_ctrl_get_flags(), where the flags are derived from GET_INFO for every
> control, standard and XU alike. Call it whether or not the GET_INFO
> request succeeded, so the table has the last word in both cases. The
> call in uvc_ctrl_fill_xu_info() is dropped, as it now runs from
> uvc_ctrl_get_flags() which that function calls.
>
> No functional change for the devices already in the table: their
> entries are XU controls, and were matched by entity and selector before
> as they are now.
>
> Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 87 +++++++++++++++++---------------
>  1 file changed, 46 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index aceb26310..b16a5cc0d 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2852,6 +2852,46 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
>   * Dynamic controls
>   */
>
What about making uvc_ctrl_fixup_flags return bool:
true if it applied a patch.

That way we can move it to the beggining of uvc_ctrl_flags, even
before the kmalloc and return early.


> +static void uvc_ctrl_fixup_flags(struct uvc_device *dev,
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
> +                       return;
> +               }
> +       }
> +}
> +
>  /*
>   * Retrieve flags for a given control
>   */
> @@ -2889,49 +2929,16 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
>                                 UVC_CTRL_FLAG_ASYNCHRONOUS : 0);
>         }
>
> +       /*
> +        * Some devices report bogus capabilities through GET_INFO. Let the
> +        * fixup table have the last word, whether or not GET_INFO succeeded.
> +        */
> +       uvc_ctrl_fixup_flags(dev, ctrl, info);
> +
>         kfree(data);
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
> @@ -2972,8 +2979,6 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
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
