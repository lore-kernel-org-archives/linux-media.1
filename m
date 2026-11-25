Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613814;
	b=MKV8O1bEzgaldsN5cUR9L7uNuAvGsj9Xfisd07wgLMwReiHprJnug6ZyeYw2011MhkzV
	 BE+Aguvq6l/Z+UUkzZCIE8Ovxxibh70TuPEgMpUnsw1XKdOV70Faw0vceVSl/C6JJ075H
	 2oiCVtb7XvfTdV5BzrsXkUgC0HgwPfm0GupWyq3OHt6Fid8QeUqXNaDdesQIlxLGlZfSD
	 kFOmt8aulu9G0AxDhayL3xeoaFgPw0sg7UnD+wfHtHrzJMheqmn3S4DuCGGmV/LsmewIU
	 TYNan/5jy9+sKmwZgihiGHoUXJqMnMu7KlH0WlOhTkx/FjJTeWu1DZpHXYA12o2BapA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=t7NuJuug1RI92gL1LSIYTg7ozZZRv7LRYkwgzgIElQo=;
	b=kN6E7S5mb1BGyDdh7da3abvAQdptVn2eFU1SXa3LDABcTwC6EneV7DqFfejFhuycgDpr
	 ezB2OMV9fugpZm5a7TeS6XXlBRRkQnYPpTLdMGIyvJb9B2985BJR8rpu4RGO9tkj2fuYM
	 1L/xlHHPQ2JueoXPNoVQsGp25+JrSbwKwkFr9My0WGPnzN+KitHMREeu2MqVOQR1y+IaZ
	 W5CD9CuPoEq7v/dcr+HJZoJjcvb+YsHXVw+gSP+Jhyqpfk7k27JLbtU8Mml3bK52Mo5Gn
	 cJPDiiI9o/wr2MRI8hNuD0NKpbg0I5Lkxpn2zG03VhZDxkAgv1bVa6o2CGbjQkAtLtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="A/6PEucN";
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A70606A321
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28A70606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=A/6PEucN
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1239765266b.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795613811; x=1796218611; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7NuJuug1RI92gL1LSIYTg7ozZZRv7LRYkwgzgIElQo=;
        b=A/6PEucNKsBX+N+CeH3xYc3kIrnxwipGeoWx5JuR6SbPOsvqPX9AGhkOrckvd+DQpx
         L4MlUX+GMwt/KK8zyZYyeGx5zbbGOhUVB/0mLAIkhw9xQeH8qq1KDlSBr7whk0sPuN3J
         sAfjB7KG7tRlDlV4HuJuBbgPHgOX81Gin85Pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613811; x=1796218611;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t7NuJuug1RI92gL1LSIYTg7ozZZRv7LRYkwgzgIElQo=;
        b=ytT4shZTuhnQ68ZpdNwYcq3rTdX/APLMmDozFVdbGsbSwepaxjaVry1AGn2mYanCo5
         nunqgN/A1wXBI3eE7lED66RmbWRuo0WwG/m52MFHulKmEi3PceujDkAHUVOVxnAHsf8u
         xWRacfw9mUPmZKrMop7gMYmPpSp5VmqpMW5yp+QVdbHDF3HuXhkv6UBCDT4CWPxW6AeT
         6c/urOCSx6VQQJNJM2y4dfci9IkLbMmoIbJmait5+pJmLXYHIyL9oAP+HdLji2esRIQl
         RzrBUs+vu7p8/yyfijJEm9eD8Vgpv08toSwsxMTxgOTselhX4h/JDM6otZ7aLnn4uHMw
         yALA==
X-Gm-Message-State: APuU4Z+U3R+1vq5uHUxQE2Ymc1z0CdULXlxlgugwjG1gpeo/l2NmsVf4
	mCW6U2oLZ1x5WvhIzs6IDawtwAtLIr3qOb33G40bX5d0K9j9kcJvDJzolF+2qKUGTzbBID90xeD
	qwTlc/eFM
X-Gm-Gg: AZFdTZcEXTER0gjzUfq5+KASe7LbS/WTkKaLzOfOkAtW8xB3qUsCO1Wo9Gv2rwV4L8V
	OlyDVR9ne3wVR6rR35SYAWZKXWnF3fSEWyTTCMZ+pehjVJlvlCWxZ1PJUGxCLhMoQUhb3DVtOTs
	/UD/IkGBU7KWYagrsWkPUHUbVwjrcKaomXf9u1mXJk+bUV0bhXbU/Wa7zZtNzIgOgOVBy0tetoK
	WU3/30sSEhGFD5TfHuF0F8F1vymGAzI2Fcsitt/sOLSATUxctUIE9S2plfaV1HBuSJa7m3OGs5+
	fU1Y93B1p/7cniTOtwnlAzFXce29mrk4dIoU4M1dA566B/mnJeaWIppNxuC7knaJNPG0bvnJJSZ
	hMZB/DXM52jjZ/RwpFsfGtlYkwFTPXLl8VfeWQU9GW6o/bQFQwTmQ+U5o6/DaGb+T7P60FDCOxT
	wHbrhlkbnuJsjaO8OVMQ9UYagTgol7aP2czELInn5O0S/QYRPFuNt54DD1p9b3uEY1csMhpoJIo
	UkDxJZRTdjS2FZGa6ANasSzmvM7bn6T7wi10fAAeXNafQqapVb3skXk2I3vsvx/5z59rqWJGHY+
	qwwZaeMBtEBDcX8uGiBp7zOMRQEDaZL6Y+Qsdb4bbslukfjK8IZCNch2VlLHuGv196HQIQfAxdk
	YWbaQmVYZMGdq
X-Received: by 2002:a17:906:9fca:b0:c51:8690:8265 with SMTP id a640c23a62f3a-c5186908490mr656566766b.24.1795613811334;
        Wed, 25 Nov 2026 05:36:51 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68788sm633225266b.29.2026.11.25.05.36.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 05:36:50 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c40e30c26a4so1280976366b.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:36:50 -0800 (PST)
X-Received: by 2002:a17:907:8745:b0:c2e:7fe7:2898 with SMTP id
 a640c23a62f3a-c513a82fa27mr1345562066b.12.1795613809594; Wed, 25 Nov 2026
 05:36:49 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFDWN6LPcz6CBOZzBVN-VbCce3g2wOrPZ8V45_=8xv16VCqzsg@mail.gmail.com>
In-Reply-To: <CAFDWN6LPcz6CBOZzBVN-VbCce3g2wOrPZ8V45_=8xv16VCqzsg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 25 Nov 2026 14:36:34 +0100
X-Gmail-Original-Message-ID: <CANiDSCsfUJfACHeDDNEdOHrEwGKertb4muW0exT2TZD77J=YCg@mail.gmail.com>
X-Gm-Features: Aa3M54rW4p7yS77Y_tZfTt1JflAy-Iulq7ovoOheyutWny0aXAI92CWmJYnYUmE
Message-ID: <CANiDSCsfUJfACHeDDNEdOHrEwGKertb4muW0exT2TZD77J=YCg@mail.gmail.com>
Subject: Re: uvcvideo: AUKEY PC-LM1 (0203:145f) gets Auto Exposure permanently
 disabled and VIDIOC_G_CTRL returns -EIO
To: Nezul Tairus <radwolf.83@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, hansg@kernel.org, 
	laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"

Hi Nezul

On Wed, 25 Nov 2026 at 02:32, Nezul Tairus <radwolf.83@gmail.com> wrote:
>
> Reported in Bugzilla as https://bugzilla.kernel.org/show_bug.cgi?id=222325
>
> Device: AUKEY PC-LM1 USB Camera, Sunplus, ID 0203:145f, UVC 1.00.
> Host: Ubuntu 26.04.1 LTS, kernel 7.0.0-44-generic (Ubuntu
> 7.0.0-44.44), pipewire 1.6.2.
>
> The device does not answer correctly the queries the driver makes for
> the exposure
> controls. On plug, or on the first open by the session manager:
>
>     uvcvideo 3-1:1.0: Found UVC 1.00 device AUKEY PC-LM1 USB Camera (0203:145f)
>     uvcvideo 3-1:1.0: UVC non compliance: Error -5 querying master
> control 9a0901 (Auto Exposure)
>     uvcvideo 3-1:1.0: UVC non compliance: permanently disabling
> control 9a0901 (Auto Exposure), due to error -5
>     uvcvideo 3-1:1.0: UVC non compliance: Error -5 querying master
> control 9a0901 (Auto Exposure)
>     uvcvideo 3-1:1.0: UVC non compliance: permanently disabling
> control 9a0902 (Exposure Time, Absolute), due to error -5
>
> What changed in 7.0 is the reaction to that error.
> __uvc_query_v4l2_ctrl() now retries
> the master-control query MAX_QUERY_RETRIES times before warning, and when
> __uvc_queryctrl_boundaries() still fails it warns "permanently
> disabling control" and
> sets mapping->disabled, which only adds V4L2_CTRL_FLAG_DISABLED. No
> value is cached
> and __uvc_ctrl_get() still goes to the wire, so a later VIDIOC_G_CTRL
> for 0x009a0901 or
> 0x009a0902 returns -EIO again.
>
> That gap matters here. The intent of commit 649c033711d7 ("media: uvcvideo: Set
> V4L2_CTRL_FLAG_DISABLED during queryctrl errors") was to keep a
> failing QUERYCTRL away
> from userspace. The goal is met for VIDIOC_QUERYCTRL, but not for the
> value read, and
> that is the path PipeWire uses.
>
> Consequences measured on this machine:
>
> - Streaming is fine and the image is correctly exposed for the
> available light, so this
>   is not a dead camera. /dev/video0 enumerates MJPG and YUYV at
> 640x480, 320x240,
>   1280x720 and 1920x1080, and ffmpeg reading /dev/video0 produces frames.
> - Frame rate never goes above about 6 fps, which is the camera's long
> default exposure:
>   60 MJPEG frames in 9.56 s and 30 YUYV frames in 5.40 s, against the
> 30 fps the camera
>   advertises.
> - Userspace: PipeWire's spa.v4l2 walks every control to build
> SPA_PARAM_Props and gives
>   up on the first errno other than -EACCES. With this device the v4l2
> node exposes no
>   properties at all and the daemon logs "spa.v4l2: error: Error de
> entrada/salida" at
>   v4l2-source.c:323 impl_node_enum_params(). GNOME's camera
> application shows no image.
>   Rebuilding pipewire 1.6.2 with commit 458b8b18 ("spa: v4l2: keep
> reading the other
>   controls when one cannot be read") makes the properties come back
> and the camera

I think the PipeWire fix is the right thing to do here.

In the V4L2 control framework, G_EXT_CTRLS returns -EINVAL for
controls with V4L2_CTRL_FLAG_DISABLED, whereas G_CTRL does not check
that flag (and in uvcvideo both go to the hardware). So userspace
should not rely on a specific error code here and should skip
V4L2_CTRL_FLAG_DISABLED controls (or keep going on read errors like
PipeWire 458b8b18 does).

I have prepared a patch that might work around your issue (converting
-EIO to -EINVAL on disabled controls while still trying GET_CUR),
though I am not sure it is the right thing to do as it could affect
other userspace applications. Hans V, any advice from the control
framework perspective?

https://lore.kernel.org/linux-media/20261125-uvc-invalid-einval-v1-1-57e34bd8ce06@chromium.org/T/#u

>   application works again, which confirms the failing control read is
> what breaks
>   userspace.
>
> Source history, checked against kernel.org:
>
> - v6.8: drivers/media/usb/uvc/uvc_ctrl.c already queries the master
> control, but it has
>   no MAX_QUERY_RETRIES loop and no "permanently disabling control"
> path. A failed query
>   returns the error for that control only and the mapping stays usable
> afterwards.
> - v7.0 and current mainline: both the retry loop and the permanent
> disable are present
>   in __uvc_query_v4l2_ctrl().
>
> Suggestions:
>
> 1. Do not forward VIDIOC_G_CTRL to the device for a mapping already
> marked disabled, or
>    keep the last successful value. If the read must fail, -EINVAL is
> what userspace can
>    skip; -EIO looks like a transport error and is fatal for consumers.
> 2. Consider not marking the mapping disabled on the first failed
> query. 6.8 returned the
>    error per query without disabling anything, and this device needs
> the control to
>    survive. I cannot boot 6.8 on this machine to prove the frame rate
> difference, so
>    treat the 6 fps as an observation of the current state, not as a
> regression claim.

I believe the 6 fps is probably due to V4L2_CID_EXPOSURE_AUTO_PRIORITY
(dynamic framerate): the camera tries to achieve a bright image at the
cost of lowering the framerate. I recommend opening your curtains :P
or setting that control (exposure_dynamic_framerate=0) if the camera
supports it.

Thanks for the report!

>
> I can test patches on this hardware and report back.



-- 
Ricardo Ribalda
