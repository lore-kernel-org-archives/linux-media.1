Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D393E8695
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371171; cv=none; b=WLG1qv5eEvJEoDFSN8VqdOH3GApcn24Onaa5kdFsKjxSjxROzLFj7JGyDZFjwWrWsH8qk0S0JghyI0apie6Gpu9C1OnWhYpY/OCsrf1CWcGXUnaCvwaqFgCcr5JOA0rpJ4HI/W8lZQeT9dIk5W0ecHjr1/P4WNv2rRcIjjiAybw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371171; c=relaxed/simple;
	bh=Csxp0GAhWcqB3HJ+l+TRPUBvbPxEZLOcO71hGZATSaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TYJAwJTedmfxqukXMrD9NdaJgo6dhVP811Xcm2A2k91BNWuXvKXa5xrcF/5ymWdfnCrSpmsBjMCDhN0O4GMEH51zjq5MUD2wtZxOEVdWG3g+4c8N4T0GESmaMnUYCcP/UXgBGy4Dt4eQ71uFdT1ltI3OAholQV6Ihd6hYbegG98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QAod11rI; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QAod11rI"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15e592da74so231241966b.1
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 07:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786371168; x=1786975968; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcytllYBEyOBuEppbsBZzkxTHexO3p9jpt8jgBuF2hk=;
        b=QAod11rIjfQjNwreaZAgEmqQUlVkpInpRMzEkc7OJCnd68I1psGXJIhIViOkkbJCVx
         G0sFgh1i4/Epp0uMy23tvOSXq/Jwc90r7CEWzfyrCLdHZSjuEIUyvfMpxtgGfpDgq+co
         NQoF7z01EaS5M5U6a8ikpfye8aJvDQMyaZgbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371168; x=1786975968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AcytllYBEyOBuEppbsBZzkxTHexO3p9jpt8jgBuF2hk=;
        b=DxfJaR4kRoZ+9n6woPXqer81hq2SMD12ipbsZrAPpmP1yXWv16FXhmuSqQhsQFPTX4
         bUkUuvr0TiABTOk4VFDidphLPJWmGt48n2NfoedVpcOnSKxfTk1MBUEsZJntJss6WFQj
         7bEJjP2ICR5S4WURlTY1ilvzumeC1rHEjJexc3DAzN6jAHjZ5nr1zT7fSG3Zt0zePXuH
         XU9IXOvv7MNy8UEDv3tiD3UiPhxQUUSNjCp+E2YldZ0jmQEw88F44IN5pJIcB24RxvVr
         /HkBt418VxWP7smnmauxeqzThh1IM2nKQsvuSz0vBx1e6+YaeB68DHxry32eolhfgAok
         nEPw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4eUwJFkFWZ2gtRLA2kTsNOLkJWDMC5e29mxVkVgbrSuM+3axo6AXHfC51sxUiKdXxXZcNVdWttRTZBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx80gwoK1tjPA2MxgoosTupaucDkpOW0mw9X8RHJ090jlPd9GiE
	1dHPJ5UXAWjGPnRoFm37A2qJ4aih0+8KPF6NUTKIMphTvNLG1WLW0Z2Cpj4KgsUavp+c1+ObEsu
	bJ+ppuA==
X-Gm-Gg: AR+sD13zBrCnSIY0rbrgMO6o/3wYxNLzVzfw7c4DFWWSdR2hTyyOKgNl7MZjo9BRKmL
	DORx7cYFtdS0Zco6tVQ/fL2eaWtkKomq/YmHbnBsoS4zh7tVVj6gw97VMHJwWpMHsojaJYKWfa0
	cyUwnBJ126adzXm3Hcb9FHOYWny2dlUaSwpTn4yl2kp6VPl3Jt0AMyB+XGnrm1Wr9vufNHp9Aw7
	lyRLcLcgLyioYK87ll5EA+BKPIg5fyBYv7lHomruZ4oaZ0W8aZor5KsEjAMoJ+yKNbsKCx7Q7Ca
	GJBWhCmpPbSnQiHF2elZQ7rszVOlQBiX6ZVe74m6EIRcLVQkD/di3GSzmSAD9wjG5zTZ3n9DanD
	B+nix1G0YpGues59N6ATPefTRf0+Os09PE6r9yHNA1VDDK0dA9DQuVQ/S7c262JGbxihRtcJrb5
	eCzfZaTUtADnRIgXwCATths/gMVkwz99THSzgBvaQXlcCWy3Q3lyjxorbfCQShAm2hke+E+ua6+
	uBgXbBZJxc+neb/SCH9dzbL3g==
X-Received: by 2002:a17:907:1b16:b0:c16:72ba:d352 with SMTP id a640c23a62f3a-c208761d3f6mr1034761266b.31.1786371167784;
        Mon, 10 Aug 2026 07:12:47 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080cfddbbsm397067466b.61.2026.08.10.07.12.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:12:47 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so323954966b.0
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 07:12:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqp8bWtVDH9tNQL061WSrgPZaYYa2M/d2REi9sT3tyYAVbrO8JLCnxZiLmq44+7gU+7KocgYFV/5okO6A==@vger.kernel.org
X-Received: by 2002:a17:906:7149:b0:c20:7a96:f7ad with SMTP id
 a640c23a62f3a-c20875d4845mr753005266b.29.1786371165627; Mon, 10 Aug 2026
 07:12:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807101433.54886-1-noambs2999@gmail.com>
In-Reply-To: <20260807101433.54886-1-noambs2999@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 10 Aug 2026 16:12:32 +0200
X-Gmail-Original-Message-ID: <CANiDSCs37sMQM+zjVnWTqnVejpu8uCb_sax5w3bHikb8z9TnkQ@mail.gmail.com>
X-Gm-Features: AUfX_mzbuWo9ERGUrVVH2PcLE3eE906N_os16DmwUbgE-ecDpsLgBrcSHbSfSs8
Message-ID: <CANiDSCs37sMQM+zjVnWTqnVejpu8uCb_sax5w3bHikb8z9TnkQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix integer overflow in frame buffer
 size calculation
To: Noam Ben Shimon <noambs2999@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Noam

On Fri, 7 Aug 2026 at 12:26, Noam Ben Shimon <noambs2999@gmail.com> wrote:
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
> field then reject the frame descriptor. An uncompressed frame this
> large is probably not a real device and rejection is consistent with
> the other checks over malformed-descriptors in this function.
>
> Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Cc: stable@vger.kernel.org
> Signed-off-by: Noam Ben Shimon <noambs2999@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e289cc71ba98..d319368f9d21 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -296,9 +296,21 @@ static int uvc_parse_frame(struct uvc_device *dev,
>          * information. For uncompressed formats this can be fixed by computing
>          * the value from the frame size.
>          */
> -       if (!(format->flags & UVC_FMT_FLAG_COMPRESSED))
> -               frame->dwMaxVideoFrameBufferSize = format->bpp * frame->wWidth
> -                                                * frame->wHeight / 8;
> +       if (!(format->flags & UVC_FMT_FLAG_COMPRESSED)) {
> +               u64 bufsize;
> +
> +               bufsize = (u64)format->bpp * frame->wWidth * frame->wHeight / 8;
I'd rather avoid doing a u64 division (even knowing that the compiler
is often clever enough to avoid it)
What about:

bufsize = ((u64)format->bpp * frame->wWidth * frame->wHeight) >> 3;

> +               if (bufsize > U32_MAX) {
> +                       uvc_dbg(dev, DESCR,
> +                               "device %d videostreaming interface %d FRAME %u: computed buffer size overflows\n",
> +                               dev->udev->devnum,
> +                               alts->desc.bInterfaceNumber,
> +                               frame->bFrameIndex);
> +                       return -EINVAL;
> +               }
> +
> +               frame->dwMaxVideoFrameBufferSize = bufsize;
> +       }
>
>         /*
>          * Clamp the default frame interval to the boundaries. A zero
>
> base-commit: f9a2394a23482bfd330911e9c8295b71724feacd
> --
> 2.34.1
> I was working on a certain device that had a variation of the Linux kernel.
> During my work, I had searched for memory mismanagement and misallocation in media
> drivers. At some point I stumbled into the `uvc_driver.c` and found a flaw that is
> not a vulnerability, but still a flaw.  I figured that it was worth letting you
> know rather than shrug it off.
Thanks for the report. Most of the times we want to trust the hw...
but for usb cameras is totally worth it to be extra cautious.

With my change (and if you test it :P) you can add my:
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

>


-- 
Ricardo Ribalda
