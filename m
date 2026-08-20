Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E4B40B6E0
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221601; cv=none; b=jbO6qeIiJIP4Mx1QIlNj1ZKLXB3KEVpBJY9fn/2PPSX0IRLWV8VAuCjYWZR2FkN0ckQdKart9TAISS4M8dlOLJwQYfCvjc3Zkz9BI9jSpWDoG55lR59Tbp1aC+BpHAdcv5cb3XUFHuJQFQcxxfxUM6/t0Vqp1Rme1AD2o+Zh76o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221601; c=relaxed/simple;
	bh=f4pxdxOm5KSlcTwOg7yLOGvkui7bGHcXbIihBrSAEi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KisGwi1hw7+gzRzfOeXx5mj8o0G5Jix3+KyItXGVZhq6l9ZJEvViYzXcf6bmGrygcpLAYGwRPiijGIQ1KYbp0LzE76GACughiN05XqDt55PdEp1Kk0yKYV+t2dYijaETvSfM2PixeE9kZQAW41xkcVxfIwXADgAtXcaEmmcZqOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YoQi9zMQ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YoQi9zMQ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so1521100a12.1
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 03:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787221595; x=1787826395; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JK3RPI3X6wjjizw2T6NiDoaTiSUZOw5BuBJ76PSCVyg=;
        b=YoQi9zMQG7Uq5Sru9o7LChM7SkyAD2VoqfHNrmm2tZjjByAJK3nKC8zxvvatbP2EJ7
         LqQMGrUYogKe/NqdOOtvcAfGlv+U1yZJf8UxnlgALwAJrL2qn2KUzQYVN8oAgez5nLHI
         jx8yeq+5ZwMKl14lqeJtA2kIePyjzrA+x6GIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221595; x=1787826395;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JK3RPI3X6wjjizw2T6NiDoaTiSUZOw5BuBJ76PSCVyg=;
        b=DmhPnWVcCzPeWthBU49Us8zr+UzU62AWJxae5k3by4HAHFpJ0BYKw/1KqXpA6c/KLe
         LSewMoqghUylHglmCbpdCyGfrXnw8hD5Luaxm2WZBVsk5O6ioaICfvVrBpYCysbuLxvF
         ow5UEmGq/nzv8Idl1ZgsVnRQmG4/J84E2F8g320XiLVwuEbo/Efsmip9evEcp8H7vjHC
         xN4yFrgIaTUtWDD26jNUf+H/5UqrI2/FdlDdFAZryZ2MOIZ0joK/ytY+V2ShxXGLxy4b
         oVoHHPiv9HUW6bqjBp7Qj0AYtu7HB8If/Y0eoXlo6zKDGCeyRfj6eHRYSUb4tkOgq27d
         Ro7w==
X-Forwarded-Encrypted: i=1; AHgh+Rpow5llrjMN9t239p39c7WaU1C4IUjCI5qLdSv1pYhxFJJvpQEL4Kjw+EB27P3qNMhZ9X9G9gIaHMo2FA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Um2Tml+DOaG+xzGJnLN6vo9rZTvfxlLnrDRL1MeeIX55ped4
	vwYxXnY2t65q/UviIAdkMGpU5gDcT6bc+/G6WOHPBMQicjbJLKhkh5cHECsKeI26zAhVIfLzLaj
	6jzfAgQ==
X-Gm-Gg: AR+sD12hZNp4qsBBWqD67wRlnYSmTJI7fOYsWPbe02C/ckuLNNAKJrTA4EjNGRQOjOP
	3CVVzuW3rhPoV7vDI/MkFVLJ/m+VaLoEA+IhgX4uHmWf423MVNjzm8DFcwgNkx9vPz/LKkiH/hI
	6ypojlNYg8Czm2WG2AFZ3EQUB8DJuA72zaiX33vG5YNq9fO0SbTvl6cN5Ortc1r1YSMYreJJyhe
	4/JTWrdvWCeSouAAoCaTuA8crAI/cc9gljZGazo0b2iASHThciRCnAFTU9UJo5ApTB/AOaR+11M
	8IpDqQM8pNg4vTdHHU/A2iUU+pROuD8xyPppCl67O5rZmjErEO1A9AsiKSRKZ/wK1KW8bj/eo1K
	3RUwcSy7CApPYZKySdSF4yOxcswY5yrt/1BRoSwEufooZ4H5hbAQyZb8DoCiBU988bUdLxUeEva
	3Pfa1tbVGRW8SUdWvWAZO5uoJKnsrpJ2szL5EpzGiNdWKrfHy2hBlXbAZoU1CvSLf9P1tQdhe7n
	sY5TgdCRMz8aMW2W6XObSd7EA==
X-Received: by 2002:a17:907:e8c:b0:c20:f85f:e7c6 with SMTP id a640c23a62f3a-c244d69f833mr352333766b.8.1787221594898;
        Thu, 20 Aug 2026 03:26:34 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b09448sm51884266b.17.2026.08.20.03.26.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:26:34 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1600d040e4so126154566b.1
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 03:26:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqyVMEDnsRNKDiYzD6kng1ljhCrJ9N0potauHtIDoAV90518O5QlEXjVBJBxxMhj//8vhGRN5U3fQS2Zw==@vger.kernel.org
X-Received: by 2002:a17:907:3e89:b0:c21:7c98:d9ec with SMTP id
 a640c23a62f3a-c244d6349a2mr384527466b.5.1787221593000; Thu, 20 Aug 2026
 03:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820095626.111196-1-natalie.klaus@runtimeverification.com> <20260820095626.111196-3-natalie.klaus@runtimeverification.com>
In-Reply-To: <20260820095626.111196-3-natalie.klaus@runtimeverification.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 20 Aug 2026 12:26:18 +0200
X-Gmail-Original-Message-ID: <CANiDSCv5pt6sNx9T8jt4K6MSn5YqyNHiPG7SPU=EZ8MQoOJysw@mail.gmail.com>
X-Gm-Features: AcwNN1Uj5RCmBRRL7so-rkJNHS9RjWVt2a2XT2d0yKtksHempvS34a_tprO4CM4
Message-ID: <CANiDSCv5pt6sNx9T8jt4K6MSn5YqyNHiPG7SPU=EZ8MQoOJysw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: uvcvideo: Fix integer overflow in frame buffer
 size calculation
To: Natasha Klaus <natalie.klaus@runtimeverification.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	noambs2999@gmail.com, david.laight.linux@gmail.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Natasha

On Thu, 20 Aug 2026 at 11:57, Natasha Klaus
<natalie.klaus@runtimeverification.com> wrote:
>
> From: Noam Ben Shimon <noambs2999@gmail.com>
>
> In the function uvc_parse_frame(), it recomputes
> dwMaxVideoFrameBufferSize for uncompressed formats. This helps working
> around devices that report it wrong:
>
>         frame->dwMaxVideoFrameBufferSize = format->bpp * frame->wWidth
>                                          * frame->wHeight / 8;
>
> These three arguments originate from the device's own descriptors, and
> therefore can be decided by it. bpp is a u8 and wWidth and wHeight are
> u16. The expression is evaluated in int, and the maximum value is
> 255 * 65535 * 65535 (which is roughly 510 times INT_MAX).
> A device that declares large dimensions therefore overflows a signed
> int here.
> The kernel is built using -fno-strict-overflow, so this wraps rather
> than being miscompiled, but the wrapped value (which is often negative)
> is then divided by 8 and stored in a u32 used as a size.
>
> Two examples for this (using legal field values):
>
>   - 32 bpp, 16384x4096: the product is exactly 2^31 and wraps to
>     INT_MIN. After division and conversion to u32 the field has the
>     value 4026531840 rather than 268435456.
>
>   - 16 bpp, 16384x16384: the product is exactly 2^32 and wraps to 0.
>     The field holds 0, rather than the correct 536870912.
>
> I don't think memory corruption is a consequence of this. The value
> reaches uvc_queue_setup() as the vb2 buffer size, and every copy on the
> decode path is bounded by buf->length, which uvc_buffer_prepare() gets
> from vb2_plane_size() rather than this field. What a wrapped value does
> instead is make the driver describe the stream inconsistently.
> For an uncompressed format uvc_fixup_video_ctrl() copies it into
> ctrl->dwMaxVideoFrameSize unconditionally, and that becomes the
> sizeimage reported by VIDIOC_G_FMT. This is while width, height and
> bytesperline continue to describe the full frame.
> This also makes uvc_video_validate_buffer() mark error on all frames,
> because it is comparing bytesused against the same number.
>
> Compute the size in 64-bit, and if the result does not fit in the u32
> field then skip the frame descriptor. An uncompressed frame this large
> is probably not a real device, and skipping it leaves the rest of the
> format and the streaming interface usable.
>
> The rounding also changes from truncation to round-up. Truncation is
> pre-existing rather than introduced here: the original expression used
> integer division, so it has rounded a partial trailing byte away since
> the driver was merged. Rounding up is the right direction for a buffer
> size, and DIV_ROUND_UP() against BITS_PER_BYTE is what the rest of the
> media tree uses for this computation, including uvc_parse_format()
> itself for the FORCE_BPP quirk.
>
> Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Noam Ben Shimon <noambs2999@gmail.com>
> Signed-off-by: Natasha Klaus <natalie.klaus@runtimeverification.com>
> ---
> Changes from Noam's v2:
> - Rebased onto patch 1/3; this patch no longer applies standalone.
> - Diagnostic changed from uvc_dbg(dev, DESCR, ...) to dev_warn() on
>   &streaming->intf->dev, reworded to begin "UVC non compliance: " and to
>   say the frame is skipped. The explicit device and interface numbers are
>   dropped from the message text because dev_warn() already identifies the
>   interface. (The original could not be kept as-is in any case: patch 1/3
>   removes the local alts variable it referenced.)
> - bpp, wWidth and wHeight added to the message text (David Laight), matching
>   the wording of the diagnostic in 3/3.
> - The >> 3 replaced with DIV_ROUND_UP() against BITS_PER_BYTE (David Laight),
>   so a partial trailing byte is no longer dropped. The overflow check is
>   applied to the rounded-up value.
> - The return value is still -EINVAL; what changed is its meaning, which
>   patch 1/3 redefines as "skip this frame descriptor" rather than "fail the
>   whole streaming interface".
> - Last paragraph of the commit message reworded from "reject the frame
>   descriptor ... rejection is consistent with the other checks over
>   malformed-descriptors in this function" to describe skipping instead, and
>   a paragraph added on the rounding change.
> - Ricardo Ribalda's Reviewed-by dropped, as it was given on the unmodified
>   v2.
> - Submitter's Signed-off-by added.
> - Fixes: and Cc: stable lines unchanged.
>
> Rounding up also moves the U32_MAX boundary: two inputs within the field
> limits (bpp=79 at 10077x43161 and bpp=237 at 3359x43161) landed exactly on
> U32_MAX with the old truncation and are now rejected, since the rounded-up
> size is not representable.
>
> Build tested on x86_64 only. gcc-multilib was not available in my
> environment, so the 32-bit code generation for the DIV_ROUND_UP() on a u64
> was not verified; the divisor is the power-of-two constant BITS_PER_BYTE, so
> I expect a shift rather than a libgcc 64-bit division helper, but I have not
> confirmed it. No hardware and no UVC gadget were used.
>
>  drivers/media/usb/uvc/uvc_driver.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 0cc0e351d139..eb7177ea291d 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -295,9 +295,21 @@ static int uvc_parse_frame(struct uvc_device *dev,
>          * information. For uncompressed formats this can be fixed by computing
>          * the value from the frame size.
>          */
> -       if (!(format->flags & UVC_FMT_FLAG_COMPRESSED))
> -               frame->dwMaxVideoFrameBufferSize = format->bpp * frame->wWidth
> -                                                * frame->wHeight / 8;
> +       if (!(format->flags & UVC_FMT_FLAG_COMPRESSED)) {
> +               u64 bufsize;
> +
> +               bufsize = DIV_ROUND_UP((u64)format->bpp * frame->wWidth *
> +                                      frame->wHeight, BITS_PER_BYTE);

I believe this should be DIV_ROUND_UP_ULL. Eventhough BITS_PER_BYTE is
a power-of-2, some compilers might have brain damage and complain
about 64 bit division.

> +               if (bufsize > U32_MAX) {
> +                       dev_warn(&streaming->intf->dev,
> +                                "UVC non compliance: FRAME %u computed buffer size overflows (%ux%u, %u bpp), skipping it.\n",
> +                                frame->bFrameIndex, frame->wWidth,
> +                                frame->wHeight, format->bpp);
> +                       return -EINVAL;
> +               }
> +
> +               frame->dwMaxVideoFrameBufferSize = bufsize;
> +       }
>
>         /*
>          * Clamp the default frame interval to the boundaries. A zero
> --
> 2.34.1
>
With that change, feel free to add my:

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

-- 
Ricardo Ribalda
