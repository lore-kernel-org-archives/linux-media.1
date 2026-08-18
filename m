Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CE72C325C
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 06:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787036099; cv=none; b=tRHmmMuaXNrXufRceXYaKOBaVGWg9J8LlAQfE/yZzIfoGzkLQgI8EuOja+rXCk6l2a9853awQOoMUyroZJEU3bm6M3psDr+RaES7Lf4Ao2zuAH3ZAobjz2IvnXkyK1TUbjU5GZVscby39lqwSArhBZsX6N3Mys/yJ5KdakZS7/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787036099; c=relaxed/simple;
	bh=uxADqqUqCp9lRGcGKt4U7cXYiUtV7lUnZZyit6MQqoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GXFEaRExAa2ihl5yF7J0gjnp/qAIul/o4LuapoQFolSSI4X7mauRzTjFd2J8WN0htEAI2vPia7QlX+S7QlbS3Hi+k5aN6YEgYfLZAkxnomZzURqvJ1Yc5MXzW/NfUHVWapg6vuenJr482ZZbcHswydZDhvr6VNDdnOrIAQXGqHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cW6MOdcq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cW6MOdcq"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1c52d920b8so571480366b.2
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 23:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787036096; x=1787640896; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pO7FpNF5m3BDuFMVo48UeMY6Fg48ViaT4+C4AKatBjQ=;
        b=cW6MOdcqVT8rIr3w816DsBIPWVpFN3z9HG+85edIcx2FrayeTkJrLpNnH271XxrvVA
         UVVTl79aRroWaXFg8cx7bqKDMSyxYs1iXyBPiYzffoRh6+5UIOIp52fSKbER/khw1pk3
         rHLKpaqScz69qztm8lKw7mROH1DF4QShi5lug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787036096; x=1787640896;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pO7FpNF5m3BDuFMVo48UeMY6Fg48ViaT4+C4AKatBjQ=;
        b=CTVmZhgb7lW4Jt2ogbnmVMUfW+K6IBLvYijqdGwA12APqEybJwG4l1ldLRy4NrBkuk
         lX/YNqxqESva06BOaJoPJzebpvlS3t55OPnLyKi2syU3joyDPYHM4tHbSDkzaUYr6bLM
         Z9tAZhxLYBU95FFoBMHVR7iCOz8VGB195HIs2K7zo/GG2DIeq07C6dre9UjLjYf22ZLx
         AZJq+6LtMYFY2reMSwxvfNva9aMAQ66Y3VOaW2g/Ngbhj+eamOSjijgrLMdae5HuU+sr
         fQWmXTWoKqNPGqvDjOkCa5owpN/q7OHT7c5GgjdwnkMGyxzT8p+tyuF0pVKK8yjbWATC
         3a/w==
X-Forwarded-Encrypted: i=1; AHgh+RrV9Y5pxoULREdRLU8raA8LXNVp/6KUCScwUZHSbTCwAt2VAX9Oo69mRHaTaEhjjpgnandnu9Qmb8Mb2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkTtj/mk27ziDFanGXdOp2EzeyERkORcqwaZMVuXWVMGogs2XK
	94u7GbGu5OHEdLuo6VeRJ2ybIGbOtZxsrUkppkbzqNzPMpaNCEc6A/iIrfyz2M88TttbpBgSn2W
	XLsegyx6W
X-Gm-Gg: AR+sD10neTAIiSH00zgrEbpspuDC0b0cV9SzBTEHnE0lnpOu4aE7MBg2SjfSpYvXEDt
	lys50n0KK3InC8gD/2opCNUjRmdEdInWOMJ3rYvkx7OTUC1g3KTwlHypo3g/jStV/HIFC137Pn7
	2VQLcAH+2pRApG7ELiUBTR5SqrV6OoyDnYexGmDKls8E+JGV8bmfvSFYRC0xVyJU6st2gnAGUWG
	JhYDoy+4Mig7GbTV7ZqZaGV6ewcM7mBMnCeBOUZcp3UfCYE673VqKkzj8lxxQ1k1A/qQOusONUz
	Glxg9kgJU3IuGoD5E8iszc890ddbFxSOVWCCrmqxLX7p+8QvTajUad3qb/s4s3ecYmZrT6z/7O4
	UUhQprfzifsGf8TRoZ/+NedsZOJB5/9pdgT14Eau+BLAX9O/s+a6PLXmMZOIwEVRb79fZU3yI1N
	viel8T7cD3JnpXaUw8qDvqI1QaYsZkcDJIWoPVDyxtrqde1HQpeK5CMp0Cn2NDTvcrr1xrEUYZX
	bWwnDVkqFu9DZH3lt8gBM4Nvg==
X-Received: by 2002:a17:906:6290:b0:c20:3733:a8c5 with SMTP id a640c23a62f3a-c212a0ea0a2mr1425410666b.8.1787036096015;
        Mon, 17 Aug 2026 23:54:56 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea2607sm147656166b.16.2026.08.17.23.54.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 23:54:55 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so4337413a12.1
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 23:54:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrfPdWgIqlxS0runbgKGHByDjb1IA9CIyaSmDvXVso8XMLik16bgdNfqGa6iD26Am/kL5mFaEiXzEIOqQ==@vger.kernel.org
X-Received: by 2002:a17:906:ee84:b0:c1c:4db0:8314 with SMTP id
 a640c23a62f3a-c212a1428cemr1546194066b.13.1787036094082; Mon, 17 Aug 2026
 23:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812103251.18309-1-noambs2999@gmail.com> <20260818064511.104024-1-natalie.klaus@runtimeverification.com>
In-Reply-To: <20260818064511.104024-1-natalie.klaus@runtimeverification.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Aug 2026 08:54:41 +0200
X-Gmail-Original-Message-ID: <CANiDSCuMJ6A+0aC32Fz18P4x=of6Ww0FgudVXHKOtXFx09fjDA@mail.gmail.com>
X-Gm-Features: AcwNN1VjKbTcaMJT38M-etEGA88i2opui0_Dm_A0JJqhhudQSd62qK0pBK0DapM
Message-ID: <CANiDSCuMJ6A+0aC32Fz18P4x=of6Ww0FgudVXHKOtXFx09fjDA@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Fix integer overflow in frame buffer
 size calculation
To: Natasha Klaus <natalie.klaus@runtimeverification.com>
Cc: noambs2999@gmail.com, laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Natasha

Thanks for the thorough review


On Tue, 18 Aug 2026 at 08:45, Natasha Klaus
<natalie.klaus@runtimeverification.com> wrote:
>
> On Wed, Aug 12, 2026 at 01:32:51PM +0300, Noam Ben Shimon wrote:
> > +     if (!(format->flags & UVC_FMT_FLAG_COMPRESSED)) {
> > +             u64 bufsize;
> > +
> > +             bufsize = ((u64)format->bpp * frame->wWidth * frame->wHeight) >> 3;
> > +             if (bufsize > U32_MAX) {
> > +                     uvc_dbg(dev, DESCR,
> > +                             "device %d videostreaming interface %d FRAME %u: computed buffer size overflows\n",
> > +                             dev->udev->devnum,
> > +                             alts->desc.bInterfaceNumber,
> > +                             frame->bFrameIndex);
> > +                     return -EINVAL;
> > +             }
> > +
> > +             frame->dwMaxVideoFrameBufferSize = bufsize;
> > +     }
>
> Ricardo asked me to look at this. I had been looking at the same expression
> independently, so I checked your numbers and the surrounding behaviour
> rather than only the diff.
>
> Both examples in the commit message reproduce exactly. 32 bpp at
> 16384x4096 gives 4026531840 against a true 268435456, and 16 bpp at
> 16384x16384 gives 0 against 536870912.
>
> One case I would add to the commit message, because it is the strongest
> argument for rejecting rather than only widening. bpp=32 at 32768x32768
> is exactly 2^35, so the 64-bit quotient is exactly 2^32. A bare (u64)
> cast without your check would store 0 there, which is the same failure
> the patch removes. Your check catches it.
>
> I also checked when the check can fire at all. For bpp <= 8 the threshold
> is unreachable given the u16 field limits, and it does not need to be
> reachable: the largest possible result at bpp=8 is 4294836225, which
> still fits in u32. So the check fires exactly where it is needed and
> nowhere else. That seemed worth confirming rather than assuming.
>
> My one question is about the error path rather than the arithmetic.
>
> uvc_parse_frame() has a single caller, and -EINVAL propagates further
> than I first expected:
>
>   uvc_driver.c:495   return ret, so the whole format is abandoned
>   uvc_driver.c:745   goto error, so remaining formats are never parsed
>   uvc_driver.c:788   usb_driver_release_interface() and uvc_stream_delete(),
>                      so the streaming interface never reaches dev->streams
>   uvc_driver.c:1004  the uvc_parse_streaming() return value is discarded,
>                      so probe continues and succeeds
>   uvc_driver.c:2135  "No streaming interface found for terminal %u"
>
> So one malformed frame descriptor costs the entire streaming interface,
> not just that frame, and probe still succeeds. On a single-interface
> webcam that means the device binds with no /dev/videoN, and the only
> explanation is the uvc_dbg line above, which sits behind a debug bit
> that is off by default.
>
> I do not think this is a practical regression risk, since no plausible
> device reaches 2^35, and the surrounding function is otherwise built
> around repairing bad descriptors rather than rejecting them. What
> bothers me is the silence: a user who does trip it sees a device that
> binds and produces nothing, with no logged reason. Two ways to address
> that:
>
>   - dev_warn() instead of uvc_dbg(), so the reason is visible without a
>     debug build
>   - skip only that frame descriptor and continue, rather than failing
>     the format

Good point. if you send a v3. please use:
 dev_warn_once(&dev->intf->dev, "UVC non compliance: blah blah foo bar"...)

We are trying to standarize the "UVC non compliance" string



>
> Either would satisfy me. If you and the maintainers would rather keep
> -EINVAL with uvc_dbg as it stands, I have no objection to that either,
> and you are welcome to add
>
> Reviewed-by: Natasha Klaus <natalie.klaus@runtimeverification.com>
>
> to v2 as it is.
>
> Separately, and explicitly not an objection to this patch: a zero
> dwMaxVideoFrameBufferSize stays reachable from the other end. Any zero
> operand, or any product below 8, gives 0 after the shift, and bpp=0 does
> reach the computation on uncompressed formats. Nothing between the
> descriptor bytes at uvc_driver.c:254, :255 and :382 and this line
> validates any of the three. A zero then goes through uvc_video.c:214
> into stream->ctrl, sizes vb2 at uvc_queue.c:90, and trips
> WARN_ON(!plane_sizes[i]) in vb2_core_reqbufs() at
> videobuf2-core.c:951. That is pre-existing and unchanged by your patch,
> so it is not yours to fix here. I am happy to send a follow-up if the
> maintainers want it as a separate change.

Happy to review it if you send it :)

>
> One caveat on my side: all of the above comes from reading the tree at
> v7.2, not from running it. I did not test on hardware or a UVC gadget,
> and I did not build your patch.
>
> Natasha



-- 
Ricardo Ribalda
