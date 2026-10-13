Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691CC2EA173
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 12:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895225; cv=none; b=QPw0kAjeChuixHez7bBuSekyaBUHF9rp8ZFMbbsqKzVfi83gKe44FpL98Y/zLfDbUJld8a1Iv5phkTgxeTzL2jBvbewDwXQOoHX2/Ps9Mw9tyCwsO1Y6856nHm0uh+4rMt7bZay4PrN0epz/rpPCnq8GDvz99dOVDjDuxGdt9YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895225; c=relaxed/simple;
	bh=m57KIRJgsGLVC+8qu0NB/QkOahZKDItsSgJ6WcQKKO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgF47m4mCNK7eddZeQV8K4C9nr+YYPOG3ptlYwpwxxAPEGbw/nqTV+IQYfDL4oF8AYrmuIVG+MjwaBh0OpmI1X2BDhkDpxERpgUWxH6dozHRre5MIy384v/GGe0Hyi8Rn5MBy2l5SzcUjty4MY73PwFE1yPtoipDK1foAws+npM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SD1Ydzzw; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SD1Ydzzw"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1380571a91.0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 05:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791895224; x=1792500024; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltMnIOP2nOYvYd7LoZiQDXdhGDBwlJ2oi6mkT/rek5g=;
        b=SD1YdzzwDAZOamiig7kjq5wXuiHl9cbsxLdLfdOxIE9w1zBe/OX9GUKMRnmQQ5K+Ef
         QlfI6bBCaSKb0WaJ3PADS0moXvVdV0BzW0xKGdzUik+7DKvzfMWdpNktodRrphjtv31p
         exDOZO8jMuVTGBjrSOArVLdIV55PHOcwraZfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895224; x=1792500024;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ltMnIOP2nOYvYd7LoZiQDXdhGDBwlJ2oi6mkT/rek5g=;
        b=WxZOeRql9ckgWXUBLV0VXWWssLbSoGYzJh8cShf3SWy0IOxx6LarFNLTXlL7pio/zv
         5smvmJu9mwlxODNqMef22E/2Hrd27+A6tJRFxgTi1movNlu9nrxc2bDN9NUW2KrQedsd
         ybZM56HM0yBNBXIiFd0oymQvBbPQwWPxZPh/Bd+mnygzIi4f6euOhXpGmmjYphBHvK0f
         zS0aQ8QQ4hrlSUaF+CxRqlE7i8vfPuVSWKFWi6nO+K3cs4fTCwnyzseiTB2M+ElFipn9
         v3SKZKwke4slBtEIhh78arpxOfYcasSDj7FX3GvClzGmMlSgaicMv0S5OsQ9Vw7CasmY
         8FRw==
X-Forwarded-Encrypted: i=1; AKwUvBz3d6cx6338d8JqH1lJUOoaO0ZKi7H5OWQS6qs9YlyuNgHVHezguxkgMzTo5fP9X8nZKwDLggpRNieoSw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLp1cWN9nr7XR6jvukjs9BwfZ2gTYHjAP4vFy9elvIkHJsaW5mT
	xap7qik33xUkF0hfkLSO5SgEqm1ra6mKWqHXLqS8mTvfF5x9pMg4nuRPskEIbrEc+fHo5KWd1Eo
	A7aHqHw==
X-Gm-Gg: AYBFou2FMXLEABY2LpAjmfHX8bm5fNcMiRnUh7nc5f6b+FWef69dXYndgCFMuS3iJyJ
	U5rUZc8MsduSxf2gZoi8UPs4po8aoQM8aa1xsVcvqI/RMp0eQJ0kFuBR3PxMk5bEjTGMXN8yU+r
	qQL/Y7NbdxHeuczjChKaHQEOddIP9DsuDmDQuZd6EcgY73Wk0V2m4pUbzWSQgUUZTzM6AzZxoeZ
	VsUobXb0EFOVZVIQ/01bneajzbZ6X83kUnP3sPZscNPBc6FPB2O32v03+inONGlfzz86Xxie0rr
	8mmlXBUMG5iS/1uoBb7XfJtUxXu+2+zFLplFtkflMshDIgnKFoo4l5LJRKd6paazR+Xr8SlCPIB
	880s7CEW2FFcmBu3PfStWBVWdrB8fl4lmLYv8/eHYy1LdTFD2KhSe040qCa9bOCrAt0erywsU5U
	cila9m+WZjRkm4xaMLavUnoO+evpxYqIA7HXk2GW3liX1qGIjymEW1IsbQ161tyvuZ6rzLha5BH
	7R/e19UCgINC7ipPLUzVzGvG9MCOsIZ6z0=
X-Received: by 2002:a17:90b:258f:b0:3a5:c08:4c41 with SMTP id 98e67ed59e1d1-3ab3ae368c6mr9287504a91.50.1791895223630;
        Tue, 13 Oct 2026 05:40:23 -0700 (PDT)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com. [74.125.82.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab393efd88sm12402657a91.3.2026.10.13.05.40.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 05:40:23 -0700 (PDT)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15dd124bbe7so5541869c88.1
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 05:40:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxv3MJOpZeNJTdhzvVX66Fv1ZOFSXCfzgFIBgpGv3unKVClabWDWNk4inIl2WzgxB3KbJYCN+3iW78A0Q==@vger.kernel.org
X-Received: by 2002:a05:701b:2605:b0:153:21e5:4328 with SMTP id
 a92af1059eb24-16a5d6403e9mr18801883c88.17.1791895221502; Tue, 13 Oct 2026
 05:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013103041.145445-1-clinckx.louis@gmail.com>
In-Reply-To: <20261013103041.145445-1-clinckx.louis@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Oct 2026 20:40:07 +0800
X-Gmail-Original-Message-ID: <CANiDSCsT546cV8F4XiriArF9n-ESC0nFFQu7dzcjqO7iJfQj+w@mail.gmail.com>
X-Gm-Features: AclHuK8mIYN_KuyoSL5jnzS_fT52N05tBS78HT8rCrgqoFCz8zUH21MlXCbAwC0
Message-ID: <CANiDSCsT546cV8F4XiriArF9n-ESC0nFFQu7dzcjqO7iJfQj+w@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: reject bulk output payloads too small
 for the header
To: Louis Clinckx <clinckx.louis@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

HI Louis

On Tue, 13 Oct 2026 at 19:53, Louis Clinckx <clinckx.louis@gmail.com> wrote:
>
> A bulk video output stream prefixes each payload with a fixed 2-byte
> header written by uvc_video_encode_header(). The per-URB length counter
> in uvc_video_encode_bulk() is a signed int initialised to the URB size:
>
>         int len = stream->urb_size;
>         ...
>         len -= uvc_video_encode_header(...);    /* returns 2 */
>
> An output device can describe a bulk endpoint with wMaxPacketSize 1 and
> negotiate dwMaxPayloadTransferSize 1, leaving stream->urb_size == 1. len
> then becomes -1, and uvc_video_encode_data() casts it to unsigned
> (nbytes = min((unsigned int)len, ...)), so (unsigned)-1 defeats the
> clamp and the following memcpy() copies the whole frame past the
> one-byte URB buffer.
>
> Rather than guard the encode path, reject the invalid configuration when
> the stream is started: the negotiated maximum payload transfer size must
> be able to hold the 2-byte payload header. Requiring size >= 2 also
> guarantees urb_size = psize * npackets >= 2, so the encode path can no
> longer underflow.
>
> Signed-off-by: Louis Clinckx <clinckx.louis@gmail.com>
> ---
> v1 -> v2: per review (Ricardo Ribalda, Laurent Pinchart), reject the bad
>           configuration at stream start in uvc_init_video_bulk() instead
>           of adding a guard to the encode path. Can move the check to
>           probe/commit (uvc_fixup_video_ctrl) if preferred.
>
>  drivers/media/usb/uvc/uvc_video.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1942,6 +1942,16 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
>         size = stream->ctrl.dwMaxPayloadTransferSize;
>         stream->bulk.max_payload_size = size;
>
> +       /*
> +        * Output payloads start with a 2-byte header (see
> +        * uvc_video_encode_header()), so a device negotiating a maximum
> +        * payload transfer size smaller than that would make the encode
> +        * path underflow its signed length counter. Reject it here.
> +        */
> +       if (stream->type == V4L2_BUF_TYPE_VIDEO_OUTPUT &&
> +           stream->bulk.max_payload_size < 2)
> +               return -EINVAL;

nit: I'd replace the 2 with a #define and use it also in
uvc_video_encode_header() for the return



And I know that Laurent said otherwise, but probably due to my rust
intoxication, I still recommend applying the check that I recommended
in the previous version. It is pretty cheap. Otherwise If the size is
not important, why do we pass it to uvc_video_encode_header()?

In fact I think that if usb_endpoint_maxp()==1 and
stream->bulk.max_payload_size==2 with memory pressure your code could
fails

> +
>         npackets = uvc_alloc_urb_buffers(stream, size, psize, gfp_flags);
>         if (npackets == 0)
>                 return -ENOMEM;
>

ps: Sorry to repeat myself; this isn't related to accepting or not the
patch... Do you have a usb bulk output "camera" . I want one for my
collection :)
-- 
Ricardo Ribalda
