Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639FF37CD21
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 08:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041690; cv=none; b=BKDx/7z1LUQujGpW2nmwGyei3gsPh20F1WG80WtfaSElBggashJRGvNzrW+LITa6OjKxDLQka2WAbEGCpkIZ9zyi2MYevImarf7zvBuzmnuk1kKJEf8NvKss4aYANolbMDxtUxSfINqRCrwZ+LaHbUEm3eGDf0BZXkPTWb1p6cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041690; c=relaxed/simple;
	bh=5WH9YNuH8fmW2zcH2Hrx09bNNHw+SgEvOlcVgPJoLxE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=extUr3GCJl122DTlP/6dU2mnhR930DkRLNYFAOEi09erwE2TWr+GConvoOg4g9eU/rvCZD8Rt5LV7MHecAGT4/PNkZDAtMNzdvwU130qeGOK6VpbQKG/GBo2aMpjmaiGYc2OOOo8vmMmW+cLguFpy/Xwor98umPpTeJxGoCgZJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cm01I/na; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cm01I/na"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47fe89fb333so2630483f8f.3
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 01:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787041688; x=1787646488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JqARlhjnju46OOH9kkzdURfO1R0DZex76yD1hra+3Ww=;
        b=cm01I/naHm1V16GIP98X7umB52jbnP3Tx7ilIp1rDlfLjmy/clEdNfL0iVthzI0mn0
         BdIgCduVs0hajvpdjPWazW7kVOVd41OuZ3/lbhLCzUjSVRE5eMsl18DvkAgKkIWo/v68
         /82gASzLKRuxS2vMbhe6sle+mNhFmZKQxSZl5jfEadDkGT6gUQjxNfsbn7q+GDgzenJG
         4lNt1IXn2JMMk8AjYQoJaWn/lukF5z7VJMPgG0EZhSvRe9FGdzMfLyNkX6s1zIhU3sB/
         a31qcFf8IBXAdMxT3PJCtaK1puWVr8uMhl30QcdFG4korWjOYCNDuijPdlCJIb7tg4p8
         Gi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041688; x=1787646488;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqARlhjnju46OOH9kkzdURfO1R0DZex76yD1hra+3Ww=;
        b=RWyaMWPulBAdaobhLfHkEJKdV/AhaHp25IeFNYDQl2Zezx0E/PXPSFmEJ4r/gpaEnh
         3qjVjGH3A8wh06OhdyFUGbanwZmJnq+lQnGbm8x9+yn7RcWHBQK5h8x4PJVTmdqlWotN
         BPlk3V+QOJQdHgFKYSRYC85t1vnmDAMTTkApPYTGZ75j+UHl1GN3Ca6Lzs++d3gVWURQ
         c3Wh3mBHq3smQLbvkB22CEtrW3GuB7owCSbOANfnofhN3khF0KWJ52J1I1XLEKn7p3bK
         P4RAByxUrrq8gDQ5JYLqp3aBxphRnhH8SsEt3v4P/lvK1/Qp0+kdgAWpYzwIrmbfilnB
         UihA==
X-Forwarded-Encrypted: i=1; AHgh+RoBh/dWNJzcztUc6phHOx0QOB6Svvnoyyr4XPwJk0O0tU8tjubbQiU4UWK5t9UmenlhLm8A81XcXU+oag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwo27+Wl3lfLA+fSkSaFFUM1LaqmUIXs4vpWnnpYNWhC0QDj5h
	D7o/m0EYKTM0p2DVZiBKtGxzs3gahyJ2VAZZWVQIAjTAOv8HuM5yUJyM
X-Gm-Gg: AR+sD13Q2U09oV/xIkyXek9dazWXd2uy8NwSYvQJs0kaiadSkg7iEHyBiX1mr3td0qg
	kG5eSybrX1uwRjbpwUf0qIV8GrG7dnkckFi7cbJeBFYJBhMUcSdNZ6I1XWdM4YUaDtgW3GFMfLl
	1XhZyUHIbLaqyIpS14MV+oTbcT/gCLhYjIv+BO4DXXOWtwx4bmpwW1UJvMlr9ShQ67RbWtpRIh/
	fJntuzjkAvUoZ103x9z0ctAOUfHkg7ZvSvy+o7veF6DPf4NbCNSkA3HAGy1z0n6bwBPUDgYpYIe
	AJCQEPwOXlw8LVIVosAJOnSSmEIiSSHQLxxdolaOGl4sx6tWmJgFQK66eFGGWKXeMnPl4EGqRgB
	O4i0IzGQqGSceDPEZQWB3oMHJFuR19KjOB9bMDjiYNR+7ISRaOROMJT/FbI6iU5mNXhPnfUYR/+
	77kvQUm2S3oHoiWt1+fUJtcXSeRIw+/t2PtToFw9GuLheOzu+yd5UCP5AyNc0ab1/+6KhbCC553
	ZR0wWoj3x/l9p/YthAc5vgr/w==
X-Received: by 2002:a5d:5009:0:b0:47f:e729:c588 with SMTP id ffacd0b85a97d-482a90cd751mr8657078f8f.14.1787041687385;
        Tue, 18 Aug 2026 01:28:07 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a31543sm10988285f8f.4.2026.08.18.01.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:28:05 -0700 (PDT)
Date: Tue, 18 Aug 2026 09:28:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Noam Ben Shimon <noambs2999@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix integer overflow in frame buffer
 size calculation
Message-ID: <20260818092803.4f51e6dc@pumpkin>
In-Reply-To: <20260807101433.54886-1-noambs2999@gmail.com>
References: <20260807101433.54886-1-noambs2999@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  7 Aug 2026 13:14:33 +0300
Noam Ben Shimon <noambs2999@gmail.com> wrote:

> In the function uvc_parse_frame(), it recomputes
> dwMaxVideoFrameBufferSize for uncompressed formats. This helps working
> around devices that report it wrong:
> 
> 	frame->dwMaxVideoFrameBufferSize = format->bpp * frame->wWidth
> 					 * frame->wHeight / 8;
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
>  	 * information. For uncompressed formats this can be fixed by computing
>  	 * the value from the frame size.
>  	 */
> -	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED))
> -		frame->dwMaxVideoFrameBufferSize = format->bpp * frame->wWidth
> -						 * frame->wHeight / 8;
> +	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED)) {
> +		u64 bufsize;
> +
> +		bufsize = (u64)format->bpp * frame->wWidth * frame->wHeight / 8;

I'd bet there is a requirement that width*bpp is a multiple of 8 (or even 32)?
You definitely don't want the divide rounding down!

> +		if (bufsize > U32_MAX) {

Should that be >= ?

> +			uvc_dbg(dev, DESCR,
> +				"device %d videostreaming interface %d FRAME %u: computed buffer size overflows\n",

s/buffer/frame buffer/ ?

> +				dev->udev->devnum,
> +				alts->desc.bInterfaceNumber,
> +				frame->bFrameIndex);

I'd include the bpp, width and height values in the trace.
If the error happens the first thing you need the the three values.

	David

> +			return -EINVAL;
> +		}
> +
> +		frame->dwMaxVideoFrameBufferSize = bufsize;
> +	}
>  
>  	/*
>  	 * Clamp the default frame interval to the boundaries. A zero
> 
> base-commit: f9a2394a23482bfd330911e9c8295b71724feacd

