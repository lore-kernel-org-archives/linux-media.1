Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBFB3C3C11
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221808; cv=none; b=sFN2yyJsMAzOoezzDE21/5CNBTSWBCMA6e4UnpbcPpju16sNbf7NX0Cx7hgaMmNqw57vDJzFL5X0Uryz4nb1ua4ds2l95oFrlS7O4EmhVa7/cVGA9MEdMlHibjTSOzmKcdaiXEumJlsVasb0bT1qjK8Vdnq5J6pJPj5Lq0gvBV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221808; c=relaxed/simple;
	bh=g3JRO9O7G2IJDN+8UQIFj94a5h1FQ3MFHRJ7R/0D4SY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sI7pwno074AvsIxHXjwoKCCUIxcVs6r2jtY7KoSqhk55EyT7TxGZUtM9DkDV9qz3olTVyOiutqRtNtxalsPUz5wvPABLt/R+uq7X0kQjPD1gBHVfkfqrXyoCWnFQOpaAi7sUrq5hKkM7axkBIv4rgweZuukEw67ZF27XvDqB4r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YUINLcx7; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YUINLcx7"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a157f90752so3691598a12.3
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 03:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787221804; x=1787826604; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xgk0gcUij9t1Zktyfwo1OhttybzA3umgR6gVLSa3/4I=;
        b=YUINLcx79MAjxGjnljka5y1CmDbkkcoAHnQjyqM8nqCsTYTppF9pLjxVGq2vXlmASZ
         ZgcW3Ta+D76uZC+6D7z3prWDKos/bIcg9ePZqbGnoNVagQw6Uehqi7styZwErS7Cbm7/
         tT1Mo//8qp9MEsakQzMYqu1v1sLp6QdvBbhFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221804; x=1787826604;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xgk0gcUij9t1Zktyfwo1OhttybzA3umgR6gVLSa3/4I=;
        b=AD8cvU1uwPZco0s1vqKY2J/ZWJV+69GkQDi76N1alfsLYalcDrQ/1oxM+8TxBJ60Tk
         t8uBm8utWhcpxFcdOys2tY6DM3ay9Rw91v0JZLF2HtpYW0+qyYqtwH7wrCGCWdseqpsE
         wWryU2UsXb9fZEBLK9zJOmQkSc2Hu5bKPYwZLU9VX/x/O3B4SzCNmZzt6J+nprU/YanF
         Gv4/w3nTbeN1JmTVAc+fu9vYwF1aCNDN4ONW8bcFCy72j1KUgXC/+I8XF+Uw9Bn5fMA1
         DXcaZltGGkCdtd0JSman1UeQfwzRf4X45S/0GK1Gr4OxjcQ6GUXGGtn0GL59/7JVvMUI
         yWfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqnpiOns6g8Mv130eys6wA5qQIjjW4+aAGIvcnWV2RVX4rtVinYLzH4AzpFCUsonXIukYgQzJr3D8LCtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Y/zh0kvbFgzNAUnQ7D8d+Y5XBWU/eaF0caax+YiY/nlrzToJ
	e7WcrN57GTa4w7hXul/U79F9ziY7QsH5YjHIRm7xtZXXuUZxlQS2x/VPyP0RrsZSMlhlfk4TudF
	WcWdKiw==
X-Gm-Gg: AR+sD13tX/LgtqyC0GBlqXhntpDj45EBZMd5Ahmmcfw8LQNWZNpktZ5p6Q1ay/IFXV8
	OZYh3tislLTi+QSz9jClL8gVQQnGsvrSg6SNm6OTVAYNtMLGCTO7ugcac2GmIUoqIcQNilWkmAB
	2Zu4t61RHKRJMt8bD2TfIXmsNbZ46DxJRO2dJR5h9GjNtv7hj/gnR5UtxVgBD8EXUKwSFRwYbVw
	aYrfVo8kzR7lsV3tpdei7vrvYR+GG8c4wwy1cYTYIB2eSE3PcOeP5pDfbXNCzq5F8SRrRJpqMf/
	+sfXCAdDrXKUQRG8fV/cl01S7GjHPWTKRwf/OukFImlAVP9gCKT7Quo3jAMQEuEs3q6WEUgBsiI
	PqHa7eGxKt1IRaKoAc/ihp6fSE4EXi41vbi1fuv7E2zwHvujJP7SwSJYdEgWgLe8abmxaKqBK63
	BNQyTsCKd3slzF2ooGpUp8Z6WySmrOYtXlJp8V3X0nJd6Apkw9SyW2OkKcMP88OwxaaERqX24ro
	2Giaf2qQKJDONOaWBXkzo3wzQ==
X-Received: by 2002:a17:907:1788:b0:c20:fe93:a86 with SMTP id a640c23a62f3a-c242e1de421mr825842466b.18.1787221804491;
        Thu, 20 Aug 2026 03:30:04 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459197cd4sm52714266b.30.2026.08.20.03.30.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:30:03 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso328722366b.3
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 03:30:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RquWCZGxPb3Dha2HYEtyV434r7n7yZtNmH9CKlEX0Sg0JHIWYJxOdtKiezgjVgLhBHUuI5EvF0NPxJyQA==@vger.kernel.org
X-Received: by 2002:a17:906:fe42:b0:c21:9cf4:e1b0 with SMTP id
 a640c23a62f3a-c23f929e249mr793080966b.3.1787221802587; Thu, 20 Aug 2026
 03:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820095626.111196-1-natalie.klaus@runtimeverification.com> <20260820095626.111196-2-natalie.klaus@runtimeverification.com>
In-Reply-To: <20260820095626.111196-2-natalie.klaus@runtimeverification.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 20 Aug 2026 12:29:48 +0200
X-Gmail-Original-Message-ID: <CANiDSCtDyJsFrz7iBe8Yb8rPM=Tb1e1av9qGcNwE-C5nwFPfZw@mail.gmail.com>
X-Gm-Features: AcwNN1WOz4wySaVT8CaYdQaKGy6rC0J4crS2XKI6gD7IQwqmpusCzVh5-L3tA38
Message-ID: <CANiDSCtDyJsFrz7iBe8Yb8rPM=Tb1e1av9qGcNwE-C5nwFPfZw@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: uvcvideo: Let uvc_parse_frame() report a
 skipped frame
To: Natasha Klaus <natalie.klaus@runtimeverification.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	noambs2999@gmail.com, david.laight.linux@gmail.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Natasha

On Thu, 20 Aug 2026 at 11:56, Natasha Klaus
<natalie.klaus@runtimeverification.com> wrote:
>
> uvc_parse_frame() returns the descriptor length on success and a
> negative error code on failure, and uvc_parse_format() treats every
> negative value as fatal for the whole streaming interface. There is no
> way for the parser to say "this frame descriptor is unusable, but the
> rest of the format is fine".
>
> Change the return convention so it can. Return 0 on success and let the
> caller advance by buffer[0], which is the value the function returned
> anyway. Report a truncated descriptor with -ENODATA, which stays fatal,
> and leave every other negative value to mean "skip this frame descriptor
> and carry on with the next one".
>
> -ENODATA is currently the only error the function can return, so the
> skip path is unreachable until later patches add checks that use it. The
> one behavioural change is the truncated-descriptor diagnostic, which
> moves from uvc_dbg() to dev_warn() so a malformed descriptor is reported
> without the DESCR debug flag. That leaves the local alts variable
> unused, and the kernel builds -Wunused-variable as an error, so it goes
> too.
>
> Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
> Link: https://lore.kernel.org/linux-media/CANiDSCue8yyiGubzbAybRqSUTTFuB=-Y2TZy6yvOx32SpAASWg@mail.gmail.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Natasha Klaus <natalie.klaus@runtimeverification.com>
> ---
> The Cc: stable line is present without a Fixes: tag because this patch is
> a prerequisite for 2/3 rather than a fix in its own right. Stable needs
> both or neither: backported alone, 2/3's -EINVAL would revert to meaning
> "discard the whole streaming interface".
>
>  drivers/media/usb/uvc/uvc_driver.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e289cc71ba98..0cc0e351d139 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -230,7 +230,6 @@ static int uvc_parse_frame(struct uvc_device *dev,
>                            u32 **intervals, u8 ftype, int width_multiplier,
>                            const unsigned char *buffer, int buflen)
>  {
> -       struct usb_host_interface *alts = streaming->intf->cur_altsetting;
>         unsigned int maxIntervalIndex;
>         unsigned int interval;
>         unsigned int i, n;
> @@ -243,10 +242,10 @@ static int uvc_parse_frame(struct uvc_device *dev,
>         n = n ? n : 3;
>
>         if (buflen < 26 + 4 * n) {
> -               uvc_dbg(dev, DESCR,
> -                       "device %d videostreaming interface %d FRAME error\n",
> -                       dev->udev->devnum, alts->desc.bInterfaceNumber);
> -               return -EINVAL;
> +               dev_warn(&streaming->intf->dev,
> +                        "UVC non compliance: FRAME descriptor is %d bytes, expected at least %u.\n",
> +                        buflen, 26 + 4 * n);
> +               return -ENODATA;
>         }
>
>         frame->bFrameIndex = buffer[3];
> @@ -329,7 +328,7 @@ static int uvc_parse_frame(struct uvc_device *dev,
>
>         *intervals += n;
>
> -       return buffer[0];
> +       return 0;
>  }
>
>  static int uvc_parse_format(struct uvc_device *dev,
> @@ -492,11 +491,12 @@ static int uvc_parse_format(struct uvc_device *dev,
>                         ret = uvc_parse_frame(dev, streaming, format, frame,
>                                               intervals, ftype, width_multiplier,
>                                               buffer, buflen);
> -                       if (ret < 0)
> +                       if (!ret)
> +                               format->nframes++;
> +                       if (ret == -ENODATA)
>                                 return ret;

I know this is my proposal, but if you resubmit the series I think it
is more correct to swap the order (sorry about that):
 +                       if (ret == -ENODATA)
 +                                return ret;
 +                       if (!ret)
 +                               format->nframes++;

> -                       format->nframes++;
> -                       buflen -= ret;
> -                       buffer += ret;
> +                       buflen -= buffer[0];
> +                       buffer += buffer[0];
>                 }
>         }
>
> --
> 2.34.1
>
With that minor nitpick, regardless of whether you change it or not.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

-- 
Ricardo Ribalda
