Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E2437F8DB
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 09:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723495; cv=none; b=c2LdJhfb3c2UZH1pxWQ2xXJLqCTomfxBpKZrAHlsHEgXznn/oJi0wJ6BN1AgNLcbVLWsOYSHbLR4Gf26wxqs9fN3HCLtFHoDfg9+5Bq/NiFTNcRGIBqdEiSEGLD75rGkId0zRyIJnrltD0+zqEnV2nJZDlhRsP5wr8OfkjyONFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723495; c=relaxed/simple;
	bh=a+Q7v0i4oUBDGIVKI9qESILy03zS5iR9AHdSgVZnVBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SrfEF9U9U/Tu6xnOrXpJnHXgVDyExwXqk2IQn+rMJOQJ8+kxKu6ZRGCqwUxvfFv1WNkrOTtlSMxVtXP3hvg/AKIvshboK1hQ5zq6mfW1cnYVc/OnxN0ONuszM6+iDWMZ8V24oxqlhMpMfNLB3B5EEWr+iz7Jf16eHVIAv48GjT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fz78ZDYu; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fz78ZDYu"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso490813a91.0
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 02:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789723492; x=1790328292; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6vnmAHaEKQvF5gCbmOjaBzceKMsg0XSgaVR/HCDL7Q=;
        b=Fz78ZDYuRbQSSADwhBiPxI+aNkeKsVckUTr8dK51mWm6T2B5yarayiM1hnue072cn/
         JMT7uA207yfsG9aJ0PFNfc3Gx3MTkY7poB5tQIv/g22/dxsZBSbAXC6rzACCly/LVTdA
         BQPkCRPh0WLrPrl3PYsEnOs4kGc3PwfDz1flY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723492; x=1790328292;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w6vnmAHaEKQvF5gCbmOjaBzceKMsg0XSgaVR/HCDL7Q=;
        b=RP16KTCJCPZnJLFth4VcJdREG+hdlXHKqY4et2qsD4XKM5G0DWO3mNF57FKMEQfT+e
         KpiOR/cunH+DvaNZ8QGcr2vjZZ7XDYQd+wd5uYSmx8pkFiaUpULUAjf6DeQ9slyZI4Xg
         85Coil5fJeBLWJFwNU0d4J+tDt8h3ynTg4o3N3dwU+QbyT3sPR9Hg6868rFYn3rxIArA
         SheEic8e4SUEP3iwXkSDgA9ua3iHjDkhc+Hwpiou6QTmCSa0kAT3FYHuPtOBoaEi+IMl
         U4yuo04csdkjOXTTzjRNBcTP5C7uJeTq+Ce/zILUB0v8dR8pXO3YQAklRwJzoNWDJ0k4
         6Oqg==
X-Forwarded-Encrypted: i=1; AKwUvBzSsVMxel2MkXWWE6w1lpgejQkmc40/MTEIPasewYCdO5QaSr7P7ClC+Q0LK6BWzva8wTZvVCOnAAd1zw==@vger.kernel.org
X-Gm-Message-State: AFuF++koRBvSOU/HdL1yGfiDISs93u7hOsHVtwhMPnNRBUKKk2YYzUsJ
	zPwvQ0uuWR5WqMERCst/Ix1MRIgT/2jLzbsjmC+Z9Z/Ve26TN4HvTtS5dSDLfqEcwVJMDv6nQaM
	e83U=
X-Gm-Gg: AYBFou3piQJbQerj+n+MOQy8q6izeNTrPqR1jdWR2VZ5tRPA0jPye91P7Ozwc4uXgNg
	eSQSo9QadpRMNCNx/vjI8d3BIuxNaN0Nw7pTPhV/5KRdmYRUr9gkvSelYnHfeDag1VTBbVz+3DQ
	cbfJO/qtvPpoChQyxkuqeP1P//xcffsMjlUDrhnDTXPy+g4WzC4B2fgcRywENeu/20B7N8KW1Rn
	rgxsqZbasu8c22OolFNAKhWYhBgaOUoB3X50sElyEMOatL3umnxbtFZTCNtK70jIjsdYB1fMSHM
	1mR5h54ljPO/O0Bvnp40IdaTMpVY2fxlpoUCQowjUGarqhlEhe0EAyO772oC5Dglpw9LXHUlZ9w
	rzFOPEOUZNMXTVXD0SQIB2u9raU+dg1nbAhtVHPt+LRL7dbwGATmAvL/gA+uGVwiNUudcJBbuUj
	bPIzA0+nOzweWdV3eya+/m8/3vNfMuQtW8EXr/pUHavnynk0ULZmSvU1dLOEh4/csaAIa7ad6UU
	mmPdIM/6THuu1W0Uk/cBWj4VPOF2xWLTtyD
X-Received: by 2002:a17:90b:4a4a:b0:39d:f253:5fc4 with SMTP id 98e67ed59e1d1-39e54c9ad06mr4381510a91.17.1789723491602;
        Fri, 18 Sep 2026 02:24:51 -0700 (PDT)
Received: from mail-pz2-f32.google.com (mail-pz2-f32.google.com. [74.125.228.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6137e111sm693113a91.1.2026.09.18.02.24.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:24:51 -0700 (PDT)
Received: by mail-pz2-f32.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so353774a12.1
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 02:24:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz8sJRkLlFujNMyc9skBgrnLUbAlOS4BHbZ4v56v4KBnPYV78GvL/yuXkjCs883TU5BB586k4aqJXbKYQ==@vger.kernel.org
X-Received: by 2002:a17:90b:2243:b0:39d:f770:774 with SMTP id
 98e67ed59e1d1-39e54c9c1bamr4114268a91.20.1789723489907; Fri, 18 Sep 2026
 02:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917212951.558283-1-henry.paradiz@gmail.com>
In-Reply-To: <20260917212951.558283-1-henry.paradiz@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 18 Sep 2026 11:24:36 +0200
X-Gmail-Original-Message-ID: <CANiDSCsoLGGewmpV6cL=wgkMh3qx=5dU_mVWUi_NaBdfZp+hPQ@mail.gmail.com>
X-Gm-Features: AcwNN1VQ-ralS2wlFfVEQO0FI9zCtwWQvGAVmdb-2nyKo8qFJX7tYvzulGq70JA
Message-ID: <CANiDSCsoLGGewmpV6cL=wgkMh3qx=5dU_mVWUi_NaBdfZp+hPQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: add capture quirks for 1e4e:7102
To: Henry Paradiz <henry.paradiz@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Henry

On Fri, 18 Sept 2026 at 02:35, Henry Paradiz <henry.paradiz@gmail.com> wrote:
>
> The eEver Live Streaming USB Device HDMI capture card (1e4e:7102,
> bcdDevice 1.00) exposes two problems when HDMI is connected but the
> input signal does not lock.


Could you please share the output of lsusb -v -d 1e4e:7102

>
> While idle, the device disconnects shortly after entering USB runtime
> suspend and repeatedly re-enumerates. Keeping it runtime-active stops
> this loop. Enable the existing UVC_QUIRK_DISABLE_AUTOSUSPEND for this
> USB ID to avoid the repeated USB, UVC and USB-audio discovery messages.
> Normal USB disconnect handling is preserved.
>
> On each enumeration, VIDIOC_TRY_FMT takes about 920 ms per call because
> uvcvideo negotiates with the device through UVC probe control transfers.
> PipeWire queries nine MJPEG frame sizes for colorimetry on its main loop,
> blocking unrelated audio mute and volume requests for roughly eight
> seconds while audio playback continues on a separate thread.

Isn't this a userspace or device issue?
If VIDIOC_TRY_FMT stalls the device, shouldn't you simply not call
VIDIOC_TRY_FMT?

This looks more like a hack than a quirk.

>
> Add UVC_QUIRK_SKIP_TRY_FMT_PROBE to answer this device's TRY_FMT calls
> using the parsed format and frame descriptors. The advertised frame
> buffer sizes match the observed probe results for all nine resolutions.
> S_FMT continues to negotiate with the hardware, and other devices retain
> their existing TRY_FMT behavior.
>
> Both quirks are enabled by one device-specific entry. The card can still
> provide diagnostic frames without an HDMI signal; HDMI signal recovery
> and capture configuration continue through the normal driver paths.
>
> Signed-off-by: Henry Paradiz <henry.paradiz@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c |  4 ++++
>  drivers/media/usb/uvc/uvc_v4l2.c   | 19 ++++++++++++-------
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  3 files changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3055,6 +3055,10 @@
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = (kernel_ulong_t)&uvc_quirk_probe_def },
> +       /* eEver Live Streaming USB Device HDMI capture */
> +       { USB_DEVICE_AND_INTERFACE_INFO(0x1e4e, 0x7102, USB_CLASS_VIDEO, 1, 0),

Please keep the list sorted by vid:pid

> +         .driver_info = UVC_INFO_QUIRK(UVC_QUIRK_SKIP_TRY_FMT_PROBE
> +                                     | UVC_QUIRK_DISABLE_AUTOSUSPEND) },
>         /* The Imaging Source USB CCD cameras */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -241,7 +241,7 @@
>  static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>         struct v4l2_format *fmt, struct uvc_streaming_control *probe,
>         const struct uvc_format **uvc_format,
> -       const struct uvc_frame **uvc_frame)
> +       const struct uvc_frame **uvc_frame, bool probe_device)
>  {
>         const struct uvc_format *format = NULL;
>         const struct uvc_frame *frame = NULL;
> @@ -336,10 +336,14 @@
>                 probe->dwMaxVideoFrameSize =
>                         stream->ctrl.dwMaxVideoFrameSize;
>
> -       /* Probe the device. */
> -       ret = uvc_probe_video(stream, probe);
> -       if (ret < 0)
> -               return ret;
> +       /* Some devices stall on probes during idle format enumeration. */
> +       if (probe_device) {
> +               ret = uvc_probe_video(stream, probe);
> +               if (ret < 0)
> +                       return ret;
> +       } else {
> +               probe->dwMaxVideoFrameSize = frame->dwMaxVideoFrameBufferSize;
> +       }
>
>         /*
>          * After the probe, update fmt with the values returned from
> @@ -432,7 +436,7 @@
>         if (fmt->type != stream->type)
>                 return -EINVAL;
>
> -       ret = uvc_v4l2_try_format(stream, fmt, &probe, &format, &frame);
> +       ret = uvc_v4l2_try_format(stream, fmt, &probe, &format, &frame, true);
>         if (ret < 0)
>                 return ret;
>
> @@ -649,7 +653,8 @@
>         struct uvc_streaming *stream = handle->stream;
>         struct uvc_streaming_control probe;
>
> -       return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
> +       return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL,
> +               !(stream->dev->quirks & UVC_QUIRK_SKIP_TRY_FMT_PROBE));
>  }
>
>  static int uvc_ioctl_enum_input(struct file *file, void *priv,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -81,6 +81,7 @@
>  #define UVC_QUIRK_INVALID_DEVICE_SOF   0x00010000
>  #define UVC_QUIRK_MJPEG_NO_EOF         0x00020000
>  #define UVC_QUIRK_MSXU_META            0x00040000
> +#define UVC_QUIRK_SKIP_TRY_FMT_PROBE   0x00080000
>
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED                0x00000001
>


-- 
Ricardo Ribalda
