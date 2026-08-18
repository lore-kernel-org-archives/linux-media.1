Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A3633F58D
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 06:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787036240; cv=none; b=Sio0cfdL1VpvqkEZLV4JEZQvv2jfYgn5ImL1eAPxuSVDwhdUlaaS7RTUw+VR3xxU+UYzDMnZELAnoC22cMKjIRa6lfqxZ51UjZBCGmmJDaX9dgaFkwD9njDYyiUvX/EBJxVE0/yxjiFJY+4cUlbwMqSDLwd3KW2m3kn8Zf32N+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787036240; c=relaxed/simple;
	bh=E2CIPHxgwpoXbFUTsjhVbpH8t7M62JTjoMaXNB6jIvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYi/vyZftLpoU0bEeoN1dzSuh1IjOPYWswD05OStTRV2ynzBCZv4rDZHyaVoukNT6S4tmUWYVlF/9+fi/iDI0KGzlpJI767j8jVdYMHsZWvIDJ6bBwIkVxaDmybwgnD1ZALEXf/DehcobHWeTm22Qd3BY2+C4xUQMd7qzHlwSVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M6otQepo; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M6otQepo"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2055573c8cso591315666b.3
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 23:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787036237; x=1787641037; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxlib7nhZH7DursbLf7CWsGpwBO/a85PLqVDzbhx3qg=;
        b=M6otQepoIf/FLkTr0iBgREyJFF8InN3wFP3OtY4RTelmJaF9HZ+KcFethkrLRjiJZR
         yBbA3MT7qoTFAYGXKGXiqDVscr+Dvmh1kNRPw1/s2Ub5VNMM7krjwPouSIsJILY/SYZr
         b/aYTPZ8+RiF9YeTerOpgU0WlpOOujMrob2as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787036237; x=1787641037;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bxlib7nhZH7DursbLf7CWsGpwBO/a85PLqVDzbhx3qg=;
        b=Ev6PRHBT78yCRcGaJyiy5AEezR3YobH3PBohfOtWRxB9tDukXir+/6+mWEeAkuyari
         OrtQHkzn+b35zythBtaOfJXyMDXhEQaQXRQ+37+KryWw1UNcmnrN/Gt/jqrI3ahyRYjn
         32Wx2lf2UwfJu5p//jTLbVDGQuHlAueloAYCWe3Pvw/BebBot923dmaE4UQcIKUcSIav
         OHTm+tcaIeRV1FbE43Sf1RTF9RzdStH1VsdijVnR/0qlR0l951k899tDrQekrbWmDyhL
         gkyQC/WBTc6co3cUPqfzVV0pWFQ/KOfN5+EsaBkY+hvdNajD6rmV5q5WNWPchP9onrAO
         QdMg==
X-Forwarded-Encrypted: i=1; AHgh+RqG9eO5+E5djJ/5jLa9FyoeUHtfVsrGEThqrV/Nlqw3Ftc92RY0q5Foa1QUoIm6yGfXOxABiUyhy1lo5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Z6Clz58Z88BZUoHDLmjfoJrRfXVqHY77EAnCO/iRKZiPYJN5
	ayAuQgh3mGc1yulVTt/gvxXk4gMBROmF97bUKECSi9gQOpY1WIp9sz+WW66aFLRe5r/4HQiaS6m
	lCji+tEa+
X-Gm-Gg: AR+sD1261WJ15UjnNYmeZHm1ARBdAG+fNOCEmGdKWKxTkPfFMpYObt8IH3FWbBhv6ep
	vMMCb47KUTZjgFn0EYuyPjKm1CbmdT81GbowdAABAnm+Wvqx187K8uiNFybNw6m5OfAD/wzaxIf
	anQoblxcODAiotPDV+u+OHhe/M4i1rVCG4ebdSOsEL2g0Z+5ySFHdPcYmTlkD4P26Ogaszy66jW
	8Xap4Guesvxq3ZEv005U9VQNNPN3+iJY8lj6CX/gGoxIh6w1qIVnDKfm7B2jPi4DxT0YRo8G/c+
	2FhF6M6L39G9ts7oL6/fNm5bY3bB+xy56occEZJZcP4kYyc8mVDoT1kXaRMW5lh0XiNaju8hLrb
	3fy0Wj9ZqMMx2a52v0wXHrZE9V9FCzHkTKZ0LIpCVyg6zR4HZanSM55v4Sz+cRsBWJuibQ/heRx
	MDzRpRDtDIFSL4HBn2FLejyeqJJQO3ENuve/Qj7ctxpXwbGeYfNfubrmdOTXYG2mIzbOVHTYs4a
	D6us50Z8SAKsLgTa7CYzDUcdhBof6nW7Q0/
X-Received: by 2002:a17:907:3e96:b0:c12:6632:e7f0 with SMTP id a640c23a62f3a-c212a30923fmr1391743466b.24.1787036236689;
        Mon, 17 Aug 2026 23:57:16 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85a656fsm1582694a12.31.2026.08.17.23.57.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 23:57:15 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15d111ca99so457758466b.0
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 23:57:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro6Fa8FUXU27s6slTyhIdUA21JO5KmJl4RGaVf/05Hw1WK7loBaChYG3WY94Wqnxy0ekEM5bpl0Qw2Yhg==@vger.kernel.org
X-Received: by 2002:a17:907:e003:10b0:c21:450d:cd7e with SMTP id
 a640c23a62f3a-c21450e15dcmr744689866b.9.1787036234553; Mon, 17 Aug 2026
 23:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812103251.18309-1-noambs2999@gmail.com> <20260818064511.104024-1-natalie.klaus@runtimeverification.com>
 <CANiDSCuMJ6A+0aC32Fz18P4x=of6Ww0FgudVXHKOtXFx09fjDA@mail.gmail.com>
In-Reply-To: <CANiDSCuMJ6A+0aC32Fz18P4x=of6Ww0FgudVXHKOtXFx09fjDA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Aug 2026 08:57:01 +0200
X-Gmail-Original-Message-ID: <CANiDSCufTS+j=w7Y_hhjvXqRprkbcofF8vq3=fnZRMG4p-JMxA@mail.gmail.com>
X-Gm-Features: AcwNN1VoNYfGSK8tZwSgWpslUmv-WRCThBRSCKIxhdMoei-Pb5ZEjz-KZ7ttvXA
Message-ID: <CANiDSCufTS+j=w7Y_hhjvXqRprkbcofF8vq3=fnZRMG4p-JMxA@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Fix integer overflow in frame buffer
 size calculation
To: Natasha Klaus <natalie.klaus@runtimeverification.com>
Cc: noambs2999@gmail.com, laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Aug 2026 at 08:54, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Natasha
>
> Thanks for the thorough review
>
>
> On Tue, 18 Aug 2026 at 08:45, Natasha Klaus
> <natalie.klaus@runtimeverification.com> wrote:
> >
> > On Wed, Aug 12, 2026 at 01:32:51PM +0300, Noam Ben Shimon wrote:
> > > +     if (!(format->flags & UVC_FMT_FLAG_COMPRESSED)) {
> > > +             u64 bufsize;
> > > +
> > > +             bufsize = ((u64)format->bpp * frame->wWidth * frame->wHeight) >> 3;
> > > +             if (bufsize > U32_MAX) {
> > > +                     uvc_dbg(dev, DESCR,
> > > +                             "device %d videostreaming interface %d FRAME %u: computed buffer size overflows\n",
> > > +                             dev->udev->devnum,
> > > +                             alts->desc.bInterfaceNumber,
> > > +                             frame->bFrameIndex);
> > > +                     return -EINVAL;
> > > +             }
> > > +
> > > +             frame->dwMaxVideoFrameBufferSize = bufsize;
> > > +     }
> >
> > Ricardo asked me to look at this. I had been looking at the same expression
> > independently, so I checked your numbers and the surrounding behaviour
> > rather than only the diff.
> >
> > Both examples in the commit message reproduce exactly. 32 bpp at
> > 16384x4096 gives 4026531840 against a true 268435456, and 16 bpp at
> > 16384x16384 gives 0 against 536870912.
> >
> > One case I would add to the commit message, because it is the strongest
> > argument for rejecting rather than only widening. bpp=32 at 32768x32768
> > is exactly 2^35, so the 64-bit quotient is exactly 2^32. A bare (u64)
> > cast without your check would store 0 there, which is the same failure
> > the patch removes. Your check catches it.
> >
> > I also checked when the check can fire at all. For bpp <= 8 the threshold
> > is unreachable given the u16 field limits, and it does not need to be
> > reachable: the largest possible result at bpp=8 is 4294836225, which
> > still fits in u32. So the check fires exactly where it is needed and
> > nowhere else. That seemed worth confirming rather than assuming.
> >
> > My one question is about the error path rather than the arithmetic.
> >
> > uvc_parse_frame() has a single caller, and -EINVAL propagates further
> > than I first expected:
> >
> >   uvc_driver.c:495   return ret, so the whole format is abandoned
> >   uvc_driver.c:745   goto error, so remaining formats are never parsed
> >   uvc_driver.c:788   usb_driver_release_interface() and uvc_stream_delete(),
> >                      so the streaming interface never reaches dev->streams
> >   uvc_driver.c:1004  the uvc_parse_streaming() return value is discarded,
> >                      so probe continues and succeeds
> >   uvc_driver.c:2135  "No streaming interface found for terminal %u"
> >
> > So one malformed frame descriptor costs the entire streaming interface,
> > not just that frame, and probe still succeeds. On a single-interface
> > webcam that means the device binds with no /dev/videoN, and the only
> > explanation is the uvc_dbg line above, which sits behind a debug bit
> > that is off by default.
> >
> > I do not think this is a practical regression risk, since no plausible
> > device reaches 2^35, and the surrounding function is otherwise built
> > around repairing bad descriptors rather than rejecting them. What
> > bothers me is the silence: a user who does trip it sees a device that
> > binds and produces nothing, with no logged reason. Two ways to address
> > that:
> >
> >   - dev_warn() instead of uvc_dbg(), so the reason is visible without a
> >     debug build
> >   - skip only that frame descriptor and continue, rather than failing
> >     the format
>
> Good point. if you send a v3. please use:
>  dev_warn_once(&dev->intf->dev, "UVC non compliance: blah blah foo bar"...)
>
> We are trying to standarize the "UVC non compliance" string

I meant dev_warn() not dev_warn_once()

The user cannot easily trigger the error message (besides re-probing the device)


>
>
>
> >
> > Either would satisfy me. If you and the maintainers would rather keep
> > -EINVAL with uvc_dbg as it stands, I have no objection to that either,
> > and you are welcome to add
> >
> > Reviewed-by: Natasha Klaus <natalie.klaus@runtimeverification.com>
> >
> > to v2 as it is.
> >
> > Separately, and explicitly not an objection to this patch: a zero
> > dwMaxVideoFrameBufferSize stays reachable from the other end. Any zero
> > operand, or any product below 8, gives 0 after the shift, and bpp=0 does
> > reach the computation on uncompressed formats. Nothing between the
> > descriptor bytes at uvc_driver.c:254, :255 and :382 and this line
> > validates any of the three. A zero then goes through uvc_video.c:214
> > into stream->ctrl, sizes vb2 at uvc_queue.c:90, and trips
> > WARN_ON(!plane_sizes[i]) in vb2_core_reqbufs() at
> > videobuf2-core.c:951. That is pre-existing and unchanged by your patch,
> > so it is not yours to fix here. I am happy to send a follow-up if the
> > maintainers want it as a separate change.
>
> Happy to review it if you send it :)
>
> >
> > One caveat on my side: all of the above comes from reading the tree at
> > v7.2, not from running it. I did not test on hardware or a UVC gadget,
> > and I did not build your patch.
> >
> > Natasha
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
