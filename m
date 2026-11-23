Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429845;
	b=IR1eenA1PkIEQqj/KLaDuSFAP7UvvVDVupaRDvAyRZjpzpHwHxoAnQWiUmccn9IuhqNQ
	 AaEDGZ0/23VtyJjGeJSmmyEVcU7RlS/O8SUqh74SnXZuHDr5uiAKIiYafMDMqmL9Jz9b6
	 4CXGB6AF8AaWHP7C0k7YCsSjiqkcrXRbedz39F52IwZPQV3obyBuGBa6juWQOy7Qb7tcl
	 nEmuQgWLZqBXFG2ZgNoJkTDdkxEPnPAu9OOq7L69KX3N/8K+j0vBn3G5eNbiIxBD6Z9vu
	 N/Eacl+S1KC2rISGU7q5Q/UupQ4SZhAyc67o695ZnNbieX/7LSZ0GLTG71j/uXPy9uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=W/y+mYRMmfGOv6XxlcO5KmQFJU+5n6UFhbQYgX4LGMs=;
	b=VNPsEXGcXtKZ+Y96ZLn3UzCPZalaRzIiD51rBjB/j7pfKRQ0TuzrD6now5PyH9f94iCv
	 YfPSVvbPr4GLjBlOuDTpgg7sRRa0oBeXvegqLSNoUVo3MM+6FZscjVG4/XeTHzuPLxAUB
	 wfsqB/uf+3S34yZzK50gTcimxor6FToHqxnJhrj2QkZbfAAROTKBc6Yz2rO+ebFlyxq/5
	 e5FdjoVszNoLiPJIWvU3LTNqfFj2Gu2Bz3fTWikZO7N61jzBN5u/SNWu6dtEVVUg2Bpki
	 Pejs1zkeNIkyNkoGMw0bEkF+lcLXIKD0cbjpP6/1ZLchc7gD7XVSugG3rtfNBChrF9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CHAQ1poz;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EA9606A321
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 10:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24EA9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CHAQ1poz
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso1531310a12.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 02:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795429844; x=1796034644; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/y+mYRMmfGOv6XxlcO5KmQFJU+5n6UFhbQYgX4LGMs=;
        b=CHAQ1pozqfpoWy5xzrMDAydlO99gtw+0RzjrPPAPDCChfRy+E8yfV55sFDKQ/lEQUR
         7zMsiG9rUjllyrROL5n+zxpSc+oMBdmOJC9n9wVddzKAj/Op3Tgym2xaaArcJuJvgSvK
         2mqrRr4wY1HJkycG0uxSW1kf27hrfUXfCTNO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429844; x=1796034644;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W/y+mYRMmfGOv6XxlcO5KmQFJU+5n6UFhbQYgX4LGMs=;
        b=N2JTx6SPySpETRXMrxTlE/zKlo3eE21a3uTU3A0EJ7coCkUcDwu/ZrQJc4spoSuTmo
         8jcuomX94t+RacGMZtzkKiujB/CDEj0V320D6s+yOMTJYzUNQKxjCUVuqyfu9wtqwXph
         RF2pvfXoIDYVGI1ZD6Mj0Yc19TW9OMyxKUacvl+bn0CnO6eN/1efyEnht4Y7FE2Uan90
         4BnmMHfeoPxEIWuoZkCiUmx8KVKStCTBM+zMUYszrcfU/RHEcxCrBw6nZKVWJ0jLPCt0
         3xaCOz7UDYCbmQJlQymPheQY6YkLBREl4ThS4wYLcoqYeqFl4mX/xMqBwXwU/0JlBh7D
         /ltA==
X-Gm-Message-State: APuU4Z8wrUrKMpqjoMtY7uBYLf5emLLX2E0TzY1Z5ZP8Fo3xWc7rWgQh
	Jxw9gZBe8GWzNH/inpezyT6yWLg0+u5CmwRFLHP3si6dN2JDMC6gefFQTckW7jEJfyA6/GosEeV
	HVLsT9A==
X-Gm-Gg: AZFdTZf3uVZwaln4NW/hGz3wrGSPXZs+pcKJtrbw/pR5TF1bjhxphEqGvbZtGAy52w+
	RwMf2am/n3tuK0NR9pubO4RT+Efp7NpP0xUqgdRLInTm6ZnTNboRCipCm8/fYzLqRH1W+xBsnXq
	a1L1QWHC6XCw6/fapeZnZGJ/Nfm/dbr7TEK+lgTQQElJHewwCv7t2RaPUWNZyFsFpBpjmgKKVsT
	D7E/MDPQDUp2PciH/SYHeX0J4zu439dJ4v6WmYIaA6CSRxq5LL+4k7fSYgFVWfpcROBbHA5jgLD
	CKy40mxu8leHafq6/ruBzCz9yBiN3ct8HntjgnMeg6L0sFC5CSaox4CkcPjSTYlm4uMKFg7j/2N
	1M8wXD1j0e28iJ2Q/0CfdZaBwL5e+qfaUrPXn5DrwS5SG4vs5tZeg/gpgApnBFqqaxmmgCJ6MTR
	7S4BitO/uarOzcUS9Yzi19YKSR74MPTk0LH+MHXzgg5olFHC41P29Sak/cbhSixtrFUTNMZp1Gf
	DkDEJR4KICXal49UHe7cj4zP4iKsBX/leRz/Q8MtpHN4jtXC8RdTrXcjinDT+iW47JiHYEjt3oG
	IW4volJrF1cAeMW8qoUdJnP4FesCsyn6Hq39pzz2vy7BkbTWI3v+hkTldjdVDdJQu+/3saSqA0k
	tFlzgwCfWmXY=
X-Received: by 2002:a17:90b:5546:b0:3b0:a1c6:95ae with SMTP id 98e67ed59e1d1-3b41c941f9amr6085229a91.31.1795429844033;
        Mon, 23 Nov 2026 02:30:44 -0800 (PST)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com. [74.125.82.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm17603023a91.17.2026.11.23.02.30.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:30:43 -0800 (PST)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-18818daa3e7so1804828c88.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 02:30:43 -0800 (PST)
X-Received: by 2002:a05:7023:a8c:b0:1b5:4d7b:9ea8 with SMTP id
 a92af1059eb24-1b55692849fmr11943688c88.20.1795429841975; Mon, 23 Nov 2026
 02:30:41 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122060309.105714-1-parmjotsinghrobot@gmail.com> <20261122060309.105714-3-parmjotsinghrobot@gmail.com>
In-Reply-To: <20261122060309.105714-3-parmjotsinghrobot@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Nov 2026 11:30:28 +0100
X-Gmail-Original-Message-ID: <CANiDSCuE=WOpDFqVtM2wXue5TDqvQgg6OeHZXfv_Bvzf2QmCDw@mail.gmail.com>
X-Gm-Features: Aa3M54rnctLnkhzopoZXDgx7QCwZEHCcUkpiBk-HjnKf2cjvcnFapOVs0ycponY
Message-ID: <CANiDSCuE=WOpDFqVtM2wXue5TDqvQgg6OeHZXfv_Bvzf2QmCDw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: delay HP True Vision 5MP isochronous start
To: Parmjot Singh <parmjotsinghrobot@gmail.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	hansg@kernel.org, mchehab@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Parmjot

Could you provide the whole USB descriptor of the device
lsusb -v -d 04f2:b767

Is it a internal camera (it looks so based on the name) if it is not,
could you try connecting it to USB2 hub?

On Sun, 22 Nov 2026 at 07:05, Parmjot Singh <parmjotsinghrobot@gmail.com> wrote:
>
> The HP True Vision 5MP Camera (04f2:b767, revision 0.05) accepts
> COMMIT and SET_INTERFACE, then may disconnect shortly after starting
> isochronous transfers. A 350 ms pause between SET_INTERFACE and the
> first video URB allowed color streaming in MJPEG and YUYV modes.
>
> Add a per-device isochronous startup delay and apply it to the color
> interface.
>
> On Arch Linux 7.2.14, FFmpeg decoded 90 frames each in 720p MJPEG,
> 640x480 YUYV and 2592x1944 MJPEG, plus 300 frames after a 720p
> restart. The infrared stream still disconnected during the delay
> experiment, before the first video URB was submitted.
>
> OpenAI Codex (GPT-6.2 Sol) helped design and analyze the USB timing
> experiment and write the driver change.
>
> Signed-off-by: Parmjot Singh <parmjotsinghrobot@gmail.com>
>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 14 ++++++++++++++
>  drivers/media/usb/uvc/uvc_video.c  |  4 ++++
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  3 files changed, 19 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 99c28991b..cfc626a15 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2754,6 +2754,20 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_RESTRICT_FRAME_RATE) },
> +       /* HP True Vision 5MP Camera (color) */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO
> +                               | USB_DEVICE_ID_MATCH_INT_NUMBER,

Why dont you add this to the previous quirk instead of adding a new fied?

We usually do not need to match int number.

> +         .idVendor             = 0x04f2,
> +         .idProduct            = 0xb767,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> +         .bInterfaceNumber     = 0,
> +         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> +               .quirks = UVC_QUIRK_PROBE_DEF,
> +               .isoc_start_delay_ms = 350,
> +         } },
>         /* HP True Vision 5MP Camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index a92a986ab..e20330998 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -6,6 +6,7 @@
>   *          Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>
> +#include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/highmem.h>
>  #include <linux/kernel.h>
> @@ -2103,6 +2104,9 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>                 if (ret < 0)
>                         return ret;
>
> +               if (stream->dev->info->isoc_start_delay_ms)
> +                       msleep(stream->dev->info->isoc_start_delay_ms);
> +
>                 ret = uvc_init_video_isoc(stream, best_ep, gfp_flags);
>         } else {
>                 /* Bulk endpoint, proceed to URB initialization. */
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index af8cef94f..eb949c6d8 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -545,6 +545,7 @@ struct uvc_device_info {
>         u32     quirks;
>         u32     meta_format;
>         u16     uvc_version;
> +       u16     isoc_start_delay_ms;
>  };
>
>  struct uvc_rect {
> --
> 2.56.0
>
>


-- 
Ricardo Ribalda
