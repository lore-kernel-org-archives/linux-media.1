Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBAC3BB693
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 12:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970748; cv=none; b=aKe+cPnDEnx/jsQPTxjW8hBNRe5ms96R1fUS/tVxkmmVmzONO3oRO8tZpsaLp/C7NwLGhkCX1IUu/3Xt0WZDV+wllAbGYZZ/vSqLctDLTyqSm7Evc+MDAJ4fASVLNI2Z8wnbuP8YIYxV7Gs01eAejfohcOR2hccOeJx/LbJdhNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970748; c=relaxed/simple;
	bh=n3D2xybgMfpqarnHdO9gK8+fHp8bdjV0IQN0jLbowMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=awSQdVfdc8gOyvuAhrtMZnWSMCvWMnPMcx5/rtUk8orY/mJhU2gSn36Rt9D4GGYmtDTefnnI+c1AtwFKbjGU65MhMqhDIB4OOApeAVBozPaTXkBelLvgdqYlzl8OD3Mwn+jWrnD94l0WBMbqRNL6yrTL6e/2kbaCN9BAg5nAWUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VB5Y9+mB; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VB5Y9+mB"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1c52d920b8so445847566b.2
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 05:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786970744; x=1787575544; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1jU/i5RKLqL9sRjj7rmogyYEDWSdM8+4x3uMat32UY=;
        b=VB5Y9+mB/DsUDWo2IWmdwnnEHDi7CMrRMalKJ8eA0ypRGy2aDaD5K/+w7RL2TynTo2
         cu9SzFH/e+9TWG0GCMuNjpvEWO8lIc0dA77SAeQQ2+9qtgdY7v8uRlBnLEMhBffJaVjy
         G6TMK5YdDLmu8eVM94xqzf3wyl0cYqCnib9aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786970744; x=1787575544;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T1jU/i5RKLqL9sRjj7rmogyYEDWSdM8+4x3uMat32UY=;
        b=OQ/oGjR3O9skfiuC1Sfw8ERkvQ0h4XEkTGkKocY4HddzLldPrObrsOS08s8BT2yDc1
         X2Lf5O91C7oXR2OZFAhlwCGYuxJC/9I/rP6aopska6LWicl/5Uu+M3RDUiin/jfxJ7H+
         HgUU7FLDgQGrFUgtyziJYeyimXlWJG+kD2WQ4VPebwpc3mOec2XvmLyyDHJTnwWADoMO
         0wSHfLCFv0VhuZo5aIqvcZovPoqXKLMIfPc2bW5j0neQnFGIIsrDP+l/niFJi8SwfFHA
         5oGgN+lVcvBjlBQYk5Yg/hc/ThpCoVdR9zC0YBN8HZq1jb5MhXTx8ikgHe+1POYrOuSk
         xtEQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMECg3vFVXFoIVstJ8Qu3aNgALVDzH3/xba2NFertyhhSLhRpjHOwzCiSUW5Rtokj4Sb/vExC6ws/M1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpVBluPYsOl8BaBA79k276b4uaf1F03kCB8zuwR8dz3FFsTbup
	MGCDAb5liYQsC6vbUW3KNihy3bt2Y0tEMq066Ss4ml+Fb0xCMM9P5TqjWAWE53yE83f7g5zDEw1
	Npb8ksA==
X-Gm-Gg: AR+sD11GMk7/zQFyZJ5CYzb2lgl8pjPS0UtMMc02ilVtuPHq5wnTgb8BtLGkUFArCNd
	EvqUL4YGGaCEK0UN2sNNl+8X/oQ1GsLVliEtXFD15WKQq8Vl6SdueYMPSaFeScLqDZ7QNlQ5aSh
	SSoBVHC/ybE6eUP9m6NJbSyNPnYIHqdOp2cTbunUgXIe/iKIOFrTxLNJLYWEvx0OTa7Cjs7Bh2q
	BzHQbcniLY8yFCs0wyK7Ac6gDAjgyAFxAPULuRqENapbfH6nWe5nyoXZuwwA9dVVwYm2Ueqvx2A
	EmAn+rxnizHUDBOKOFykHNVtZB4fJAHwHXs84hvMQwX7gtFFhw4A5g8sjncJ9htBw68EjZIcbIb
	0/1n3LtJUbB2UhXA7Tsoh61iKCoxI7GZAXWkR/kAoGgYl9+0FOy7xNKJz+lg3ktH8x2s2FprG3L
	1fk4l1OLzB/Hq+HT4oY9or1fdbqHpFuSW/29AzgX0xu/7Ew15wSMR/4oN2p5FUOBUQYOvihJ7yz
	X5JEK94kgAwvKoJcZ4WFOf1uw==
X-Received: by 2002:a17:907:3d0f:b0:c20:f913:9337 with SMTP id a640c23a62f3a-c212a265c29mr1168596966b.20.1786970743679;
        Mon, 17 Aug 2026 05:45:43 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b97aacsm22507166b.44.2026.08.17.05.45.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:45:42 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15b1da6b82so387122766b.1
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 05:45:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrPaQrgVJRbVYocDA45p0URGBJz9hD9LgSlhIqnd99wlSyUUufb77slCwKvmXuXPHvi7x2WZeooQ2AvJQ==@vger.kernel.org
X-Received: by 2002:a17:907:1688:b0:c20:f871:1020 with SMTP id
 a640c23a62f3a-c212a265d9emr992457566b.19.1786970741614; Mon, 17 Aug 2026
 05:45:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817123941.1701962-1-natalie.klaus@runtimeverification.com>
In-Reply-To: <20260817123941.1701962-1-natalie.klaus@runtimeverification.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 17 Aug 2026 14:45:27 +0200
X-Gmail-Original-Message-ID: <CANiDSCsH3+0Mc-05gR0260efg4taTSuqr4kG1R8XABzD6E7ZoA@mail.gmail.com>
X-Gm-Features: AcwNN1Uj1Zw9fa3EqfVvBr2Pg1tr4RKy3WXlYxrBihR4bfszL5ReACQkqMf73R0
Message-ID: <CANiDSCsH3+0Mc-05gR0260efg4taTSuqr4kG1R8XABzD6E7ZoA@mail.gmail.com>
Subject: Re: [RFC PATCH] media: uvcvideo: compute frame buffer size in 64-bit arithmetic
To: Natasha Klaus <natalie.klaus@runtimeverification.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Natasha

This has been previously discussed in the list:
https://lore.kernel.org/linux-media/20260812103251.18309-1-noambs2999@gmail.com/

Maybe you can help reviewing it?

Thanks!

On Mon, 17 Aug 2026 at 14:40, Natasha Klaus
<natalie.klaus@runtimeverification.com> wrote:
>
> uvc_parse_frame() computes the default frame buffer size as
>
>         frame->dwMaxVideoFrameBufferSize = format->bpp * frame->wWidth
>                                          * frame->wHeight / 8;
>
> format->bpp is u8 and wWidth and wHeight are u16, so all three operands
> promote to signed int and the product is evaluated in 32 bits. All three
> come from the frame descriptor and none of them is range checked, so a
> device can drive the product up to about 1.1e12 against a type that
> holds 2.1e9.
>
> The kernel builds with -fno-strict-overflow, so this is a defined
> wraparound rather than undefined behaviour, but the stored value is
> still wrong. A descriptor reporting bpp=207, wWidth=18501 and
> wHeight=43738 has a true frame size of 20937965595 and the driver
> stores 27. For bpp=233, wWidth=63435 and wHeight=58989 it stores 0, and
> uvc_queue_setup() then hands vb2 a zero plane size.
>
> Evaluate the product in 64-bit arithmetic by casting the first operand.
>
> Signed-off-by: Natasha Klaus <natalie.klaus@runtimeverification.com>
> ---
> This is RFC because the patch is deliberately incomplete and I would
> rather you pick the remedy than guess at it.
>
> The cast fixes the arithmetic, but dwMaxVideoFrameBufferSize is a
> 32-bit field, so the assignment still truncates and sizes above 4 GiB
> are not representable. The zero case survives too: bpp=32,
> wWidth=32768, wHeight=32768 gives exactly 2^35, the 64-bit quotient is
> exactly 2^32, and the stored value is 0 again.
>
> So the open question is what should happen when a descriptor claims a
> frame that does not fit. As I see it:
>
>   1. this patch, accepting that oversized values truncate
>   2. cap at U32_MAX
>   3. reject the frame descriptor, on the grounds that a device claiming
>      a 100 GB frame is lying
>   4. range check wWidth, wHeight and bpp at parse time, which would
>      also cover the two sibling computations
>
> I am happy to send whichever you prefer as a proper patch.
>
> Two other places take the same unchecked operands the same way:
> uvc_v4l2_get_bytesperline() in uvc_v4l2.c, and the bandwidth estimate
> in uvc_fixup_video_ctrl() in uvc_video.c, which is clamped only from
> below. If you want those fixed I would send a series rather than fold
> them in here.
>
> How this came up: we are building a memory-safe Rust rewrite of the UVC
> descriptor parser and proving properties about it, and the Rust and the
> C disagreed on this field. Standalone reproducer, one command, builds
> under gcc and clang with and without -fno-strict-overflow:
>
>   https://github.com/runtimeverification/uvc-frame-size-overflow
>
> Two caveats. This was measured on the isolated expression with the
> kernel operand types, not on a running kernel and not on a UVC gadget,
> so the vb2 behaviour above comes from reading the code rather than from
> observing it. And I was unable to search the list archives from my
> environment, so apologies if this has already been discussed.
>
>  drivers/media/usb/uvc/uvc_driver.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e289cc71ba98..5dfbd487732d 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -297,8 +297,8 @@ static int uvc_parse_frame(struct uvc_device *dev,
>          * the value from the frame size.
>          */
>         if (!(format->flags & UVC_FMT_FLAG_COMPRESSED))
> -               frame->dwMaxVideoFrameBufferSize = format->bpp * frame->wWidth
> -                                                * frame->wHeight / 8;
> +               frame->dwMaxVideoFrameBufferSize =
> +                       (u64)format->bpp * frame->wWidth * frame->wHeight / 8;
>
>         /*
>          * Clamp the default frame interval to the boundaries. A zero
>
> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
> --
> 2.34.1
>
>


-- 
Ricardo Ribalda
