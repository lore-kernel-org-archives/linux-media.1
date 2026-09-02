Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106B0243956
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 06:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330893; cv=none; b=igIUSBi0F6OD4P+wpdX3aOQZlM2pvN5vwjkdqTpRjBjsMpbVhR40GTrJiCkQqBpEXs5gkMPZPb9KwbA0TI3sXAdz/34d2pADyLSf1m0TLYRzJjdCovhl70P+MjJ1tOq+ATlhdmX7ZSOB/Y2UO47HS9SrzV0oLrBJKPembQaxmc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330893; c=relaxed/simple;
	bh=v5NNZ13ICIwFEB7KwX6D6WmT1ybAJgJP24OCFpO6Kvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEg2sQsOh0IjAk7ACgwXKGvr6Ii0rrafrYmu3Vg+lklE0Cp5MpvKFcvrD1mULM7NycZKQsf1D3MLcsL/Jy1dxTE8NgMFvjVQTZxSBY1F7ptJmdudkm78UFv0tQ9GtL0EU8KO9asq7ubNCNUPLs9Jqf3l12jmFZjUVPa+O1N885k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gLn6t9SJ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gLn6t9SJ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8568e3ed034so574126b3a.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 23:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788330891; x=1788935691; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gD6xC4rnHgCgww20/q5WKAfoI9VRmRXVJLBx2igp1m4=;
        b=gLn6t9SJh4aL6QJZhiVuZcIlAf0thdVUNVvYrd9dTm5yQ1Sux5VWac6uX7cupNMCdL
         yLvn5oLeJaCraf0UC8x7NcFZR0u5Nkvhnmp1N/CCMHSZd8jAhb+l0+pfFuUIDT9DddxU
         zdvCow/Mhzyne5CRaydLQJAcocTsqEtyTFkHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330891; x=1788935691;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gD6xC4rnHgCgww20/q5WKAfoI9VRmRXVJLBx2igp1m4=;
        b=DCcNq9Yutd97reFaoXD0l66QlkoB9gnRZ7jz7T/Zag9RGtM4Jgxh0WvVgUryAoAfQ1
         NihvbrKWK87l6gQlAhhOPhs33Yl2HwN7gZj5djKOeeS8nwSPvNhJHdL4n2p4r7dVbQ/t
         8bbIaRJpj6bS8Rkdk5T5u33PPebKR7bImW1UHC0bWXttSFZ22zDInjRBycE7G7eHyMBP
         yBAeHTFYNhbbMFcQaUXwAD6nCRR56ViP02NQcSKzR0MhXjJG20dS0K04IcBTNzM5Rc0j
         5nPnR28GEZ6p1xxpRNvUYtvLNzN/NIO4CKIcqHkbo1bap7EJmLxh/PBRN2W4wz/uzFi9
         /cKg==
X-Forwarded-Encrypted: i=1; AKwUvBwwIVE0xp+0sH5lNJ1+SIc7SDZKLRISMf/0ugEEUl0At10xD46vlXzAIhWHPXkm2YbKeqRSdNVWcUbEIA==@vger.kernel.org
X-Gm-Message-State: AFuF++nemGPeB0fMZA0CL1Fxl49ltu3IUgAmc2xg9iiOonoQE1oRhszh
	AESy+vmqHy2WjJ1JMJWjkDdQ7y4oGWDHVxSs41qkuBMILlUv0gk1NmFyZjthff5Y/fhGfKEhEUz
	0dBY16g==
X-Gm-Gg: AYBFou3zt9L60WQhkwJzxQLaYzJj7t7yJriQv6rQwYsx4whC5fpgnT32EIfuaNWveeS
	XH+TwnKXGwjQyqu06Aug3CqSRXUlBBA+D1/2QpmRTmcbCwJ2mWLB43xIR6uJ6Mj05HHopuTcabF
	bp1h1Mt6D4q2HlTyIYj2Vv1HQLzh8WyK4jdg9omKzIron/SOkyRPBrc5hfb5b4YXRb9XmetABDZ
	RSIOXT57lNMiuFMZ5EKLXAsEqKGwNkIXbZw4WBfvUpZxbV6ND2p8B1vABaUouDJ9ziSTuD5CUlB
	eI9EoZdvCsE4LCZbO55EQW9H7EAEGjy1Eu9PFj2ASACCqmtFrPMbpjVbEba7QIGlfAG39O21EbV
	z28AFFlyHdR/0Rhlbdj58k/PN+5ZZjT8ZZt3JGJZLxWypFIsf7vcx5UMVHYR1cSgI6ueRdSKVjZ
	q8FNZJRt3jE1+s3an7Zwkw9iTvkShxOvAKEcL4cLbVns8iMcNthVp4+0JStr9RtIXyYAyTufBkq
	Qxl0+9pegxZLUpEPpt4bwYR5Z2PC0wskKpQ9w==
X-Received: by 2002:a05:6a00:ad0b:b0:857:4dea:e1dd with SMTP id d2e1a72fcca58-85ed3c7d7b6mr4930372b3a.14.1788330891301;
        Tue, 01 Sep 2026 23:34:51 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2ad8a45sm887291b3a.18.2026.09.01.23.34.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:34:51 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso651090a91.3
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 23:34:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzYeF4bcIber3H9vP44toVAFb44uEzFyn8PLwj1/8uqfvxKh47csy6aM2x1g6eE3qzDUTG9h+S0vKgOdA==@vger.kernel.org
X-Received: by 2002:a17:90a:d44e:b0:398:ceed:6d44 with SMTP id
 98e67ed59e1d1-39aee1bdb29mr4020081a91.25.1788330889395; Tue, 01 Sep 2026
 23:34:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902002553.34839-1-jordan.mymail@gmail.com> <20260902002553.34839-4-jordan.mymail@gmail.com>
In-Reply-To: <20260902002553.34839-4-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 2 Sep 2026 08:34:34 +0200
X-Gmail-Original-Message-ID: <CANiDSCvBkMDS9eSRRVoMqQT41c2uq+MQtUFHPm0gGuv13FWevQ@mail.gmail.com>
X-Gm-Features: AcwNN1WU18_0j7LBDxpDuT4pyAr-4a1s3iw8XblmP-PrLavwmJt-FjbCa16vEiM
Message-ID: <CANiDSCvBkMDS9eSRRVoMqQT41c2uq+MQtUFHPm0gGuv13FWevQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on the
 OBSBOT Tiny 2
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael

Thanks for your patch:

On Wed, 2 Sept 2026 at 02:26, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
> The OBSBOT Tiny 2 (3564:fef8) computes its GET_INFO capability byte per
> control, but gets it wrong for the controls that matter most on a
> motorised PTZ camera: CT_PANTILT_ABSOLUTE, CT_PANTILT_RELATIVE and
> CT_ZOOM_ABSOLUTE all answer 0x03 -- GET and SET capable, with the
> AUTOUPDATE bit clear. (The byte is not a constant stub: CT_ZOOM_RELATIVE
> correctly reports 0x0f, CT_ROLL_ABSOLUTE reports 0x01.)
> uvc_ctrl_get_flags() takes the flags from that byte, so it clears the
> UVC_CTRL_FLAG_AUTO_UPDATE that the static uvc_ctrls[] entries set for
> all three controls. Without AUTO_UPDATE nothing clears ctrl->loaded
> after the first read, so uvcvideo serves them from its cache
> indefinitely: VIDIOC_G_CTRL returns the last value the host commanded,
> never the live one.
>
> All three controls were verified on the hardware to change autonomously
> and to report the live value on GET_CUR:
>
> - pan/tilt position keeps changing for the seconds a commanded gimbal
>   move takes, and changes on its own under the camera's autonomous
>   subject tracking;
> - zoom follows the subject under the camera's AI framing (observed
>   0-71% with the host issuing no zoom request, matching the vendor
>   status protocol's zoom report);
> - the pan/tilt speed control reports the actual current speed during a
>   relative move (a commanded 80 reads back as 78, then the deceleration
>   ramp, then 0 once the gimbal reaches the end stop). Without
>   AUTO_UPDATE the cache would report the written speed forever.
>
> Add fixup entries restoring AUTO_UPDATE, alongside the flags each
> control already has in uvc_ctrls[], for these three controls. The fixup
> replaces info->flags wholesale rather than OR-ing, so each entry spells
> out the full flag set.
>
> The camera's other AUTO_UPDATE-flagged controls were checked and
> deliberately left alone: exposure, white balance and focus have working
> autos, but their GET_CUR just echoes the last SET_CUR (the firmware
> never reports the auto-chosen value), so AUTO_UPDATE would add USB
> traffic for no benefit; there is no auto-hue; CT_ZOOM_RELATIVE already
> reports AUTOUPDATE; CT_ROLL_ABSOLUTE is read-only and unmapped.
>
> The vendor has been asked to fix the firmware (support ticket #8220,
> 2026-08-04); no fix is available at the time of writing.
>
> lsusb -v (device descriptor and the Camera Terminal):
>
>   Bus 003 Device 006: ID 3564:fef8 Remo Tech Co., Ltd. OBSBOT Tiny 2
>   Device Descriptor:
>     bLength                18
>     bDescriptorType         1
>     bcdUSB               2.10
>     bDeviceClass          239 Miscellaneous Device
>     bDeviceSubClass         2 [unknown]
>     bDeviceProtocol         1 Interface Association
>     bMaxPacketSize0        64
>     idVendor           0x3564 Remo Tech Co., Ltd.
>     idProduct          0xfef8 OBSBOT Tiny 2
>     bcdDevice            4.09
>     iManufacturer           1 Remo Tech Co., Ltd.
>     iProduct                2 OBSBOT Tiny 2
>     iSerial                 0
>     bNumConfigurations      1
>   [...]
>       VideoControl Interface Descriptor:
>         bLength                18
>         bDescriptorType        36
>         bDescriptorSubtype      2 (INPUT_TERMINAL)
>         bTerminalID             1
>         wTerminalType      0x0201 Camera Sensor
>         bAssocTerminal          0
>         iTerminal               0
>         wObjectiveFocalLengthMin      0
>         wObjectiveFocalLengthMax      0
>         wOcularFocalLength            0
>         bControlSize                  3
>         bmControls           0x00023e3e
>           Auto-Exposure Mode
>           Auto-Exposure Priority
>           Exposure Time (Absolute)
>           Exposure Time (Relative)
>           Focus (Absolute)
>           Zoom (Absolute)
>           Zoom (Relative)
>           PanTilt (Absolute)
>           PanTilt (Relative)
>           Roll (Absolute)
>           Focus, Auto
>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/linux-media/20260902002544.34798-1-jordan.mymail@gmail.com/T/#mf4b518b5bfa604a5c925d23d1653b927b811488e
> Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 64c90c380..74f6e8039 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2876,6 +2876,26 @@ static bool uvc_ctrl_fixup_flags(struct uvc_device *dev,
>                         UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
>                         UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
>                         UVC_CTRL_FLAG_AUTO_UPDATE },
> +               /*
> +                * OBSBOT Tiny 2: GET_INFO reports GET|SET without AUTOUPDATE
> +                * for the pan/tilt and zoom controls, clearing the AUTO_UPDATE
> +                * the driver's own control table sets for them. The device
> +                * moves all three on its own (gimbal moves take seconds, and
> +                * its autonomous subject tracking pans, tilts and zooms with
> +                * no host involvement) and reports the live values on GET_CUR.
> +                */
> +               { { USB_DEVICE(0x3564, 0xfef8) }, 1,
> +                       UVC_CT_PANTILT_ABSOLUTE_CONTROL,
> +                       UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
> +                       UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
> +               { { USB_DEVICE(0x3564, 0xfef8) }, 1,
> +                       UVC_CT_PANTILT_RELATIVE_CONTROL,
> +                       UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
> +                       UVC_CTRL_FLAG_AUTO_UPDATE },
> +               { { USB_DEVICE(0x3564, 0xfef8) }, 1,
> +                       UVC_CT_ZOOM_ABSOLUTE_CONTROL,
> +                       UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
> +                       UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
>         };
>
>         unsigned int i;
> --
> 2.43.0
>


-- 
Ricardo Ribalda
