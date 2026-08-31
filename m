Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5CD3515E9
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169221; cv=none; b=AwHrCtA27TnWXfHV/rQPsKdPKWVeEKqbozY09MTId7cl4bGCgkX+ggK97ua/M97CLcRxfkQzpWIZy98sn/rbp0mW1mzCjANMJRcQm9D64Vu/+Luga/e6AIVybCeg4TPvRp9fE/ioVeqYoUi1uqG3CG0R4QXYain2dDjnjdI39DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169221; c=relaxed/simple;
	bh=xR5V4mqRnJ2h415I0ZezSQC+FdMHVcF4o0ifHmQnAvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbvnlkdU20rv47yFQyQJgg3HjNt+ojcpmsN16pYgG5rykzFw0yf72S9ogFziT0ORFsXOQkCKnb1xKYgRRvkFuPqnshEPBaaKB/lAJzDrFIAIuEHeEd4rgo0Qsl8y89aXHSp3d4RL/KVkGha43z0puPGJTq++RX+rJASgzNDpoqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R3wGEoiy; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R3wGEoiy"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84864086bfeso3400584b3a.1
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 02:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788169219; x=1788774019; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hv2KFH2PSVY185Ch/I9YNWDMF2WOwC9PF1oi5xWUWNs=;
        b=R3wGEoiyB40//DOKkHR/E0L3YFzzMMmRJ+2wLvuodhfVamZL1EwlwOcLALGi+OAKmR
         c+RMQ4jE+aVnNqy7uo9uEsdLiEmWGAteIt/Pj2d3WotTWlumfO3ZKNbYf5FAFb9jzG3D
         ZnOxNzJxg0DTjg9qrcXMs7SM6OfJpx4DyVn74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169219; x=1788774019;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hv2KFH2PSVY185Ch/I9YNWDMF2WOwC9PF1oi5xWUWNs=;
        b=TkhTKcxVy3rob38CIlF/xWrXYpSKeagDiR+v6SnLP+JBOo9xPr5Wj3PSlnWzVd4+CH
         A7vvVzXAoR3Gx6SGcdWm6HFd4kLmVTx2Brv0yZ5j7FIux1OagzI/FZgcUtacWuiFq8lk
         DhhNH3QM9QSqvB+IvyF5t/YVjp9YrbiRA+5nhQmvklQhLPPE/9hF4jzEa8tfjvs6r2ry
         XxPLXk9lWjqWL8c7vrs3IuzkeO2HtNGD1vp5kNL8QrLilMx5Rn5Un4g+L5eyJN3PEADs
         PTpPkAwA0ahvLX9Nmh7xjchJ1MOnvG/eHFoboGhvy0iTxCEcR+5M0qyBqdQIud7XOSFq
         ujug==
X-Forwarded-Encrypted: i=1; AHgh+RrCdCbV8lLG/JOk+yFucLfrLjSrkOjLFjBq68eLHawP9FljtdPjFCRMamjSJgr3rM4N0KNAqMvtC+T1JQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mICI1rOeQFxOsHByUqRJNExF4v8X91wlQaW/9lh2lnL/LrMd4H
	KEzXbbqdQIbvoOj94+VuAn0fPdxBCD23mdCwFvjHT6gxg90LQ2pgFoQM5zx3su7j78wgsUnpQ8+
	3iK4f4MT5
X-Gm-Gg: AR+sD12hUvgRdxFWPBjEer+mHsBMe5GpuQUxQYw+meWIhpwiHzNFXz6pJPXLQ2mz0aV
	aUV4qA/bZbi/J0s8lBmH5sM9pvJG5C0w2eUJC27khGChJD7GvdnjgptaksvBo5HDwZ0Q7a5RXH5
	mxdGK1PmBFDnJsTPHcBx5jaPP6dZCHr/U1G7H9Q7wpnnk0SuAGoYVorpXCcA1fqU0MQvfHnNChO
	6c/33gS4fza+XGnlvBtEYfKDTKNpBmohf/ceD9ib+VNz+QgQn94ES7/NvnNmC4FJesZH9+yu8J0
	JzlJJfus3/vI7ivMizxW2D4O636xXcZGnnFRRaFPx589dM3AkF0K+p4t1Sb7BU8xy4/CJOtal+S
	oru77r+dJQ+MckGBpT3yAYYWP90hvxX2gauqLbHCH4Rlu5Cs3ssH4z+jmtjVb9XQJ6xhFJCPKYk
	k+Sg/YdKPKFzzr7oy3hFi6BVFtUwpht+zP26MTo+hyLIEut4fuRnuwXBUt+hCQs/9R+kCqi5Awr
	9axUFefPNzuiy/t0BRE+8FUXoDIKpwPoo+0
X-Received: by 2002:a05:6a00:390c:b0:857:726d:2e9c with SMTP id d2e1a72fcca58-857726d301cmr22172920b3a.25.1788169219041;
        Mon, 31 Aug 2026 02:40:19 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569f49ed61sm3534667b3a.1.2026.08.31.02.40.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:40:18 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so4586895a91.0
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 02:40:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBysgfh7NzJ+shXsGcSS/2S/6F+Hiv0PsxlGKQa4motmneNFfZr7LroPmCBYOsw0IYdT8B5Q2Po5JSuUIA==@vger.kernel.org
X-Received: by 2002:a17:90b:1d04:b0:398:9bd4:d13 with SMTP id
 98e67ed59e1d1-3989bd40d7fmr25156709a91.18.1788169217299; Mon, 31 Aug 2026
 02:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828152557.653475-1-jordan.mymail@gmail.com> <20260828152557.653475-4-jordan.mymail@gmail.com>
In-Reply-To: <20260828152557.653475-4-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 11:40:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCsL0kffzysq-9ttk_po6T1uYA5+JwDriMbdD62K1zZQLw@mail.gmail.com>
X-Gm-Features: AcwNN1Xbx0PmpAiEEXxdELUGcpg-nzJsOWBXYbUv-kLDqXvb7wHjPCAFw9oLXM8
Message-ID: <CANiDSCsL0kffzysq-9ttk_po6T1uYA5+JwDriMbdD62K1zZQLw@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on OBSBOT
 Tiny 2 pan/tilt
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael

Thanks for the patch, and for contacting the vendor.
Could you reply to this patch with the full output of lsusb -v instead
of a cropped one?

We keep that info for future reference.

Thanks!

On Fri, 28 Aug 2026 at 17:26, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
> The OBSBOT Tiny 2 (3564:fef8) answers GET_INFO for CT_PANTILT_ABSOLUTE
> (entity 1, selector 0x0d) with 0x03 -- GET and SET capable, but with the
> AUTOUPDATE bit clear. It returns the same 0x03 for every Camera Terminal
> control queried, so the firmware is not computing the byte per control.
> uvc_ctrl_get_flags() takes the flags from that byte, so it clears the
> UVC_CTRL_FLAG_AUTO_UPDATE that the static uvc_ctrls[] entry sets for
> this control. Without AUTO_UPDATE nothing clears ctrl->loaded after the
> first read, so uvcvideo serves the control from its cache indefinitely:
> VIDIOC_G_CTRL returns the last value the host commanded, never the
> actuator's live position. On a motorised PTZ camera the position keeps
> changing during a move, and changes on its own under the camera's
> autonomous subject tracking, so userspace cannot observe it at all.
>
> Add a flags fixup entry restoring AUTO_UPDATE, alongside the flags the
> control already has, for this camera's pan/tilt control. With
> AUTO_UPDATE restored, the rollback at the end of every
> VIDIOC_G_EXT_CTRLS runs uvc_ctrl_commit_entity(), which clears
> ctrl->loaded, so the next read re-queries the device and reports the
> live position. The fixup replaces info->flags wholesale rather than
> OR-ing, so the entry spells out the full flag set for the control.
>
> Tested on an OBSBOT Tiny 2: without this, a read taken while the gimbal
> is moving (or after the gimbal is moved by hand) returns a stale value;
> with it, VIDIOC_G_EXT_CTRLS tracks the physical position on both axes.
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
>         VideoControl Interface Descriptor:
>           bLength                18
>           bDescriptorType        36
>           bDescriptorSubtype      2 (INPUT_TERMINAL)
>           bTerminalID             1
>           wTerminalType      0x0201 Camera Sensor
>           bAssocTerminal          0
>           iTerminal               0
>           wObjectiveFocalLengthMin      0
>           wObjectiveFocalLengthMax      0
>           wOcularFocalLength            0
>           bControlSize                  3
>           bmControls           0x00023e3e
>             Auto-Exposure Mode
>             Auto-Exposure Priority
>             Exposure Time (Absolute)
>             Exposure Time (Relative)
>             Focus (Absolute)
>             Zoom (Absolute)
>             Zoom (Relative)
>             PanTilt (Absolute)
>             PanTilt (Relative)
>             Roll (Absolute)
>             Focus, Auto
>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index b16a5cc0d..379ee51bd 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2876,6 +2876,15 @@ static void uvc_ctrl_fixup_flags(struct uvc_device *dev,
>                         UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
>                         UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
>                         UVC_CTRL_FLAG_AUTO_UPDATE },
> +               /*
> +                * OBSBOT Tiny 2: GET_INFO on CT_PANTILT_ABSOLUTE_CONTROL is a
> +                * stub that reports GET|SET only, clearing the AUTO_UPDATE the
> +                * driver's own control table sets for this control.
> +                */
> +               { { USB_DEVICE(0x3564, 0xfef8) }, 1,
> +                       UVC_CT_PANTILT_ABSOLUTE_CONTROL,
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
