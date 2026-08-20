Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF1B40B107
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220052; cv=pass; b=DMUZ3PNJCat8Ee8Krs0m5QTGr6g5a/Wi5AtgIauCq2LKfpGy4Y1/xN3eo8T+vdEnO/kWR8GxKSr+0Xyig3QXK9yBR/hEh4UJ5Yaw4PPeaOTmeXZzYfA+RjZJeVQmR1mdXJov1jNLQOpOCb8ugs2WSsyz9tMNkAULPvWQMHumAc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220052; c=relaxed/simple;
	bh=qK8YsMEikYoy/DmMieOi90FTOZ6OmGN2qIJtuy3Zpsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYFF0Lib2oEka/u/e1DksFnJPgjKSn45OpZ4r6A20TD8QFfH21vdnfDW0zejsFTq4bY4XV7Kdh+LAbRCLx86E+/OVBb5XYYXF30yBmEnjsQxeBUuU55dpDn1f34ls9x4udt142V5wf4aEBOol0guDUsFlPIBGGLUqNJuqetobXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4mfJhKo; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4mfJhKo"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b15dcaca31so2179178e87.0
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 03:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787220048; cv=none;
        d=google.com; s=arc-20260327;
        b=h6YiuXH4+fURNu+29WlC5MRjBXQh9oE9J67DPbNYWVhNClC3gJOvPekDtM86KXRhXr
         yhg4UWjkvRb/hqwNL2yeSZ4MqqhCX6SqLBGAVFLBRUVEJkxgfhFq5TigkiiBJ/Lh6DOr
         K9YuQMqArxonUzfNGDqAiOF1hbEvh1Ep6ujOLmJjwCilrqfV+qj5uSY5cof/SDX89op3
         9t4NObjKdnYhT3VrGviU8WCITXQZII/PZXaszWsdASxc5xaIBAAV/kmJtOug7bYP5OG+
         iUPlnGNdNdNQLRbx5sNnDZevDo1BKrsml4r//HQSOS0dWtSQOaARWw9HannLKdINdI34
         fo8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vcv28x2vhQfUpNe8kuIw9FYu9WSZRplZfEx9IMrcJEU=;
        fh=GlaCGDxmQSz7tsljJajB66Th4Ay7/dqmoVmYvIrxF0g=;
        b=ddFXk3xa9rTEVfB1FN7pLtsIizBpPPU+WGVnpVvGpljjEKp3hzFfThPggwF5OKAEq8
         HDWWsZZO8jJNgesf306h811JPUiLHSt25qrWR11Vky/whDF62JK2dJ6eqtNDbOt/23A+
         fb3N1d8Tqc98S9dnDMw5FPAPRCfx/e8ajwKYqxhiSxKXesi+kxhxfs0DvGRipZnT+6/K
         xPgtnzZt/OjQD+yhDlWUV7x1wjQWHstHGWmGWrv9xN/YEmpBETNt+OBWGtJacoeXCFOG
         U0LTo8W9CjSIrmglxfnuNqqkk6UAOy3ufVRDNSUplK38pf6CqbAal6KAv+K+dzPgafPf
         nl5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787220048; x=1787824848; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vcv28x2vhQfUpNe8kuIw9FYu9WSZRplZfEx9IMrcJEU=;
        b=L4mfJhKoIpexz9CcFU8p0V6mHq/M1IsUWwsfmBgS0K1rNpJVMz8AgxEFq67YZtlU7E
         1E2pZQbFXvguf35B//0sr18Dm7xMe/9esnmOL3PozMXo7qYgDerXL5lJgMbnfloVBfPS
         25F+OzZvWD6li6Ow7JeBhyAfP2WucIxDpUlF1p0jhjUGALwSJlurU+pmzbQk+RDqnMz7
         bhI4ZXYuK9u0aEDWoK1+pCkOG0Jzx/0cwiVeDB+TT1/TaZnSlCCvfFiAfxfYQp+p3b8D
         kXgMo5lOr8i3YMldnXrzaE1Amp1O7L9YJH5MuRNn8wiC05fUwig3n8V01RAr3PYlwyU2
         h4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220048; x=1787824848;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vcv28x2vhQfUpNe8kuIw9FYu9WSZRplZfEx9IMrcJEU=;
        b=dI9+oQGUMeo76Hgi8CWhH65M5BDcseboueePblWDiPFvh5jvCA3fF2q6JTFo9KpGcs
         pZ5iffb+ZJREls+Bvrp6u3tk531mkHq/g88sCrpQg1hZCt/uJBsdu5498duxhqLEYXqF
         BXAyREqgAuEVXvh1GDvWX8nADAzXQsNdDZxUZ33J04YjDVo0POxfZ260O4cYqvdE8Csy
         sYJzZSKFx8TSvHhdGXiMAqwI58k59BmH5Q+d2cNgbNf8RlkSDDR1isgEOmHLu8mWTd1k
         fFDVX+Wh8PfQCX4dZxX4315meOPqC+w/knCh5INGtCud0PcqJ5s4rll7YIpymgt/5zx8
         AiNQ==
X-Forwarded-Encrypted: i=1; AHgh+RofwzSTiJ9vEETblSHghkeMBmpNv4g+Pim0HYgkRSyy8mBpbHlZrJgzU9Bvpsch1H3jvKiQ9cxIoXoUSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeAAWMKag50jdPH09hYst4uKEP6fZmpAYW6mcjzoqGuKSuc7rI
	LMsPB65tBtLRd0cxY/k6ANm/ahEmkvuXYGpA3EZAa5N0DkfRiY+f+T0GGJTpVl2y2Qgfk9iQbZQ
	yhSxPeWDpwnqh1jT95JuCrILMi3xjPD8=
X-Gm-Gg: AR+sD13JmWtO/ZSpd6uaisJwDO7vlYBhAlDt0RGgmrx+k+pmoEyE7Wu08Qee0fzPkzw
	n14owVFRTFGfMMfRoS73vdbtcsEW+kHIrixrek/UXtE8NppJodgN/p3C4yd57wchpIj9WAEjMGy
	fBwGj50AljYoH8yETfuv9HuDcMr7QMEzAM5Vhhkmu1J4hCTeygKvkOSgGLFaYHJOlRQ99MR9HLv
	ubF0I7s7xwdPUrhhmoTEdXoOhx/5UB/se6ZXGYmtxOsgzD6gZ5gSRZpJh9sbzpMRNhVpYfYCGWo
	9TlCPRE7VPcFNx6Ye2i+pqjLvjOlnLRfA7afAafgHGYU
X-Received: by 2002:a05:6512:32c9:b0:5b0:d0d:1f14 with SMTP id
 2adb3069b0e04-5b478bd8f9cmr3843034e87.8.1787220048214; Thu, 20 Aug 2026
 03:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807101433.54886-1-noambs2999@gmail.com> <20260818092803.4f51e6dc@pumpkin>
In-Reply-To: <20260818092803.4f51e6dc@pumpkin>
From: Noam Ben <noambs2999@gmail.com>
Date: Thu, 20 Aug 2026 13:01:02 +0300
X-Gm-Features: AcwNN1XqobGbCmiipCnwlKyWytKIABAHwKOaqviwe-cC59OcTWUkTW-eetHWvNk
Message-ID: <CA+toCPeMfnB2p=kbEfo0nK+UbkyZebcfXi4KawUOo7Gjo5FbBQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix integer overflow in frame buffer
 size calculation
To: David Laight <david.laight.linux@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi David,

Thanks for the review!
Agreed on "frame buffer size" rather than "buffer size".

On Tue, 18 Aug 2026 at 11:28, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Fri,  7 Aug 2026 13:14:33 +0300
> Noam Ben Shimon <noambs2999@gmail.com> wrote:
>
> > In the function uvc_parse_frame(), it recomputes
> > dwMaxVideoFrameBufferSize for uncompressed formats. This helps working
> > around devices that report it wrong:
> >
> >       frame->dwMaxVideoFrameBufferSize = format->bpp * frame->wWidth
> >                                        * frame->wHeight / 8;
> >
> > These three arguments originate from the device's own descriptors, and
> > therefore can be decided by it. bpp is a u8 and wWidth and wHeight are
> > u16. The expression is evaluated in int, and the maximum value is
> > 255 * 65535 * 65535 (which is roughly 510 times INT_MAX).
> > A device that declares large dimensions therefore overflows a signed
> > int here.
> > The kernel is built using -fno-strict-overflow, so this wraps rather
> > than being miscompiled, but the wrapped value (which is often negative)
> > is then divided by 8 and stored in a u32 used as a size.
> >
> > Two examples for this (using legal field values):
> >
> >   - 32 bpp, 16384x4096: the product is exactly 2^31 and wraps to
> >     INT_MIN. After division and conversion to u32 the field has the
> >     value 4026531840 rather than 268435456.
> >
> >   - 16 bpp, 16384x16384: the product is exactly 2^32 and wraps to 0.
> >     The field holds 0, rather than the correct 536870912.
> >
> > I don't think memory corruption is a consequence of this. The value
> > reaches uvc_queue_setup() as the vb2 buffer size, and every copy on the
> > decode path is bounded by buf->length, which uvc_buffer_prepare() gets
> > from vb2_plane_size() rather than this field. What a wrapped value does
> > instead is make the driver describe the stream inconsistently.
> > For an uncompressed format uvc_fixup_video_ctrl() copies it into
> > ctrl->dwMaxVideoFrameSize unconditionally, and that becomes the
> > sizeimage reported by VIDIOC_G_FMT. This is while width, height and
> > bytesperline continue to describe the full frame.
> > This also makes uvc_video_validate_buffer() mark error on all frames,
> > because it is comparing bytesused against the same number.
> >
> > Compute the size in 64-bit, and if the result does not fit in the u32
> > field then reject the frame descriptor. An uncompressed frame this
> > large is probably not a real device and rejection is consistent with
> > the other checks over malformed-descriptors in this function.
> >
> > Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> > Signed-off-by: Noam Ben Shimon <noambs2999@gmail.com>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index e289cc71ba98..d319368f9d21 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -296,9 +296,21 @@ static int uvc_parse_frame(struct uvc_device *dev,
> >        * information. For uncompressed formats this can be fixed by computing
> >        * the value from the frame size.
> >        */
> > -     if (!(format->flags & UVC_FMT_FLAG_COMPRESSED))
> > -             frame->dwMaxVideoFrameBufferSize = format->bpp * frame->wWidth
> > -                                              * frame->wHeight / 8;
> > +     if (!(format->flags & UVC_FMT_FLAG_COMPRESSED)) {
> > +             u64 bufsize;
> > +
> > +             bufsize = (u64)format->bpp * frame->wWidth * frame->wHeight / 8;
>
> I'd bet there is a requirement that width*bpp is a multiple of 8 (or even 32)?
> You definitely don't want the divide rounding down!
>
> > +             if (bufsize > U32_MAX) {
>
> Should that be >= ?
>
> > +                     uvc_dbg(dev, DESCR,
> > +                             "device %d videostreaming interface %d FRAME %u: computed buffer size overflows\n",
>
> s/buffer/frame buffer/ ?
>
> > +                             dev->udev->devnum,
> > +                             alts->desc.bInterfaceNumber,
> > +                             frame->bFrameIndex);
>
> I'd include the bpp, width and height values in the trace.
> If the error happens the first thing you need the the three values.
>
>         David
>
> > +                     return -EINVAL;
> > +             }
> > +
> > +             frame->dwMaxVideoFrameBufferSize = bufsize;
> > +     }
> >
> >       /*
> >        * Clamp the default frame interval to the boundaries. A zero
> >
> > base-commit: f9a2394a23482bfd330911e9c8295b71724feacd
>
