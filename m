Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0466402432
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 10:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221939; cv=none; b=ElfO2Pnd7NFQ566bhhZKy29YLUOZbFAHyzAc6tOvzt0IanSaf5jPPjLdFIvp2UXVWKe2tMv1mzr0fQDIzNtxwdZQXtF0YaS/Yi5vGYzovtC/O1GI1IuQ4WZ9GFrdtsmobtfOsmF5PKtZZe2q5+KtCKSPMPQKDmnHudHnauf+2tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221939; c=relaxed/simple;
	bh=KWwU9fKJ0FKccFa9CEsaT/oAI0rQxv7O8etWGutvVqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q5LYd5EpbKnRRFd4prUXaH230cwzIkjp7qvvisMpHxwYWnJ+ONi6cky+MkScuc0xb7l6xz5Agl6a5RKHuBRwJMvRZRhu5rLmU6KFFCLj12/fJ+pS1F1XoPJ7xdcdbNLc9Mzm1R+bIQg187riglgdUBzwXDOXdP8DLF46A1X1aiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lLKSF+IA; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lLKSF+IA"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1677c91969so230886966b.1
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 03:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787221936; x=1787826736; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HC96uIh5OlerbZADctBJVxLvYqvq4QcjjrItEzh8ENo=;
        b=lLKSF+IARN89cSDXsJWXi1kG5UKRrrCvsQFdDG0b+XWMjpvxjq1FLOJywNHTKj6VGH
         04XzeF1IYQ70FnjxVudQud8GQ9ZQiaaChUpwpiq2J7KvpiyYCM0fkSRW7zriBS3hwUan
         NrKn6ULz63EmFv/0gUu4GEQ2u7Vy/ojsx1x4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221936; x=1787826736;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HC96uIh5OlerbZADctBJVxLvYqvq4QcjjrItEzh8ENo=;
        b=WUiDXziwnZQG27N3lj3ses4omef5BrRGkIkTbVpYAaMsphIb53wjAk7CCocWlN1di/
         VIRBAE2uoTMTfuBHXqgpQ4NILtLUobf5gC7E32AHcEQqR0oblums4GQbnpCfLpwMUX9Z
         rgWou9pzZPROXn9hurzvz8qdQTvRSUSJ1cEhJcrkP24aTtxa92a3nBXPg1XREJm6RD3s
         Vw6/Fc5nKtATxrzXuiNxTUt+u1Z3ylytuZWR00vuCY0vyN9lLx9ZweNxk3Ibqip60v7X
         BpABEq+xt231EOHdx1blEIOIyFKDru3JfOX627mEc4nFZjSyYKgwmxzA0S8vXDNygoy3
         LOgg==
X-Forwarded-Encrypted: i=1; AHgh+RqNE5fKjp3JrEoeHQo4DsyzCu7eklTiiuIgtI4/TsX4Hh5hPUKdQAFNdKChhkEJ6KYRqWq20mQ8zKeaRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPgYNa99fE8cLCV+M8dVCYLueFooUITdf3t0ECYSIQlunGFX4+
	YIN8iLxd9gs3pRpduYfyQOQsGI0r0rQoQhZVECbw1ejGGWovOhy+mkITpD7NWp5mVFSiehEwYS4
	3jtM9Mg==
X-Gm-Gg: AR+sD11NXmJPqhe4I5D9yuoOALgWpIb/Phr8v7+MrfC/RazBNLYbLg0uD7cTh90W4qc
	ja5a0/fBC8Ph+9IT+HJRWPeVpuF+4FbaX6+sCAwZwlIblan4VMfeP+n/XjXH9TB2xlOk5qRD4zv
	tr1WJTkWtx6mEZ/u3+xHSN19uevoAB0PKjcNqch64W2BfiH66wke/E8502TvCVbH/tByffPq5f+
	5LrBjVWXRQocJeotAQcraLLM25vScjNbvat8rV9O1ksQN6MjfnsLFaLvB5CvGjHYyaKv8+NYUu+
	8rt0Q2IO8o72zgmguT3ey0ozPqqkiMUc5TbfBDTOCcUl1lniAJpblnVdIV0/I8uvGUsIiiwzczC
	ARm7WpY8KlQEzAMUKkSetcdPpDvhn2HL7WltUFqNkOOhEQm127EaJIQNdbR736BKvsb4TnR1TZr
	wLpPKeM0Z5SgJBx3QSjTeVel/MpftuML3gxkAdw6hEcC6C8hhvYBVWuqW0ZIeQNxaoAKx4QtMzY
	eJu5q4AxCovHvxEZuaDzqYkemeP1rd999aq
X-Received: by 2002:a17:907:db15:b0:c21:450d:cd7e with SMTP id a640c23a62f3a-c23e8713c52mr665651466b.9.1787221936055;
        Thu, 20 Aug 2026 03:32:16 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b095fasm50441766b.24.2026.08.20.03.32.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:32:14 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so3466796a12.0
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 03:32:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq8yTvYKNWKzucHCUMq+Sa1ZPBY9Wr0NcfFKAsKa/+UF0DaIjm/wtSYIzqq4f25Dt6BS+aqECxwWcMaYw==@vger.kernel.org
X-Received: by 2002:a17:907:608c:b0:c20:3679:a2e6 with SMTP id
 a640c23a62f3a-c23e8718f2cmr774092066b.10.1787221932268; Thu, 20 Aug 2026
 03:32:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820095626.111196-1-natalie.klaus@runtimeverification.com> <20260820095626.111196-4-natalie.klaus@runtimeverification.com>
In-Reply-To: <20260820095626.111196-4-natalie.klaus@runtimeverification.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 20 Aug 2026 12:31:58 +0200
X-Gmail-Original-Message-ID: <CANiDSCtBqiShkaCyrDhwiFZSJTwZSLng=sphMf4MmfGEvyziLQ@mail.gmail.com>
X-Gm-Features: AcwNN1VgxCuQFxEdQnaD8YO_4dvDDcuFE-RRU3gi3eYWhGfjPwO7J_qs8KsaJc8
Message-ID: <CANiDSCtBqiShkaCyrDhwiFZSJTwZSLng=sphMf4MmfGEvyziLQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: uvcvideo: Skip frame descriptors with a zero
 computed size
To: Natasha Klaus <natalie.klaus@runtimeverification.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	noambs2999@gmail.com, david.laight.linux@gmail.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Natasha

On Thu, 20 Aug 2026 at 11:57, Natasha Klaus
<natalie.klaus@runtimeverification.com> wrote:
>
> For uncompressed formats uvc_parse_frame() recomputes
> dwMaxVideoFrameBufferSize from the frame dimensions and the bits per
> pixel. All three operands are read straight from the descriptor bytes
> with no range check, so the computed size is zero whenever any of them
> is zero.
>
> A zero size is not harmless. It is copied into
> ctrl->dwMaxVideoFrameSize by uvc_fixup_video_ctrl() and reaches
> uvc_queue_setup() as the vb2 plane size, where it trips
> WARN_ON(!plane_sizes[i]) in vb2_core_reqbufs() at
> drivers/media/common/videobuf2/videobuf2-core.c:951 and fails
> VIDIOC_REQBUFS with -EINVAL. On a kernel built with panic_on_warn that
> WARN is fatal.
>
> Such a frame can also become the active one without any application
> asking for it: when no frame matches the device's default bFrameIndex,
> uvc_video_init() falls back to frames[0], so a device that also has
> usable frames can come up unusable.
>
> Skip the frame rather than rejecting the descriptor, which would discard
> the whole streaming interface and every valid format on it. This follows
> commit 81f3affa19d6 ("media: uvcvideo: Don't expose unsupported formats
> to userspace"), which drops a format descriptor the driver cannot use
> for the same reason: to keep it from reaching userspace and triggering a
> WARN_ON.
>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Natasha Klaus <natalie.klaus@runtimeverification.com>
> ---
> Depends on 1/3 for -EINVAL to mean "skip this frame", and on 2/3 for the
> bufsize local.
>
> After 2/3 rounds up instead of truncating, the computed size is zero only
> when one of bpp, wWidth or wHeight is zero; the "product below 8 truncates
> to zero" case no longer exists.
>
>  drivers/media/usb/uvc/uvc_driver.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index eb7177ea291d..3bd8d31e1378 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -308,6 +308,20 @@ static int uvc_parse_frame(struct uvc_device *dev,
>                         return -EINVAL;
>                 }
>
> +               /*
> +                * A zero-sized frame is unusable: it reaches vb2 as a zero
> +                * plane size, and it is reported to userspace as a 0x0 frame
> +                * with a zero sizeimage. Skip the frame descriptor, the
> +                * caller moves on to the next one.
> +                */
> +               if (!bufsize) {
> +                       dev_warn(&streaming->intf->dev,
> +                                "UVC non compliance: FRAME %u has zero size (%ux%u, %u bpp), skipping it.\n",
> +                                frame->bFrameIndex, frame->wWidth,
> +                                frame->wHeight, format->bpp);
> +                       return -EINVAL;
> +               }
> +
>                 frame->dwMaxVideoFrameBufferSize = bufsize;
>         }
>
> --
> 2.34.1
>


-- 
Ricardo Ribalda
