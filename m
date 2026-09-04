Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20508378824
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513332; cv=none; b=VAPsdkG1LjTPqf9ZDXpSpKeqRwVUmDREyc/DFpIg7DNznFdEL9J6+RrlzuRsFvvmp664MN4btwpDLqFQDrCHzGuTsTHNipDRBn5vJ0ORTJZbmzVlSX7d/DRpKmWbyHCY48VoU1m61UsLuQuf+roldv2W92U5v5VrlcJRMOUqajY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513332; c=relaxed/simple;
	bh=R5NXZJqCVXMl3fMVgJejfyzwqnW9AkNvzaBL+3CjJCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUfNHc3OByos0xWYJ5MdcG+hU7zy7zkIthKpvruR9IyOjSqk8MlUHvmpbrFmeBrPyl2yhWRewQuxO121BF3IgWo8wis502QZraEECaaHivGmlyuTRkJ/60RVFL8VIBW9h9TrqEtSC5jMq3aN/3CBSuYUYIQiFpW+tYEDKWSoZQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DunV7VDx; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DunV7VDx"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4b396d2fb9bso364336b6e.0
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 02:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788513330; x=1789118130; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uMWzPa0juwBb1k6yY463W+ILZD/WKBScEKIEzPYh6cM=;
        b=DunV7VDx2kNPfWAuo9lZR7wvdo4Ccrod50FKiF5CBp55B2uUJTMpfHj5Wst18iT37V
         Sa2bnjC0Mypmx/3WceH6/gXyBZQZr7uT8sReg3Pxkxvtos0MZRwGiKCaXIWFpwa4XlgT
         prHPvWjuIJopzDETKeVVBfU+vMRlmzc4cTIko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513330; x=1789118130;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uMWzPa0juwBb1k6yY463W+ILZD/WKBScEKIEzPYh6cM=;
        b=dpG9Mnl21l2+AymVLuWUcFIRNQjaY/OXpfj0YxwCaVT4vuA/K3XdXaNLYJ6F3ixeip
         5FSddrXuBtqgIbeiQYjVp7Jwxt5QIEtUrf8iiV9MCUWseuqHTXqyRbx523xrrESHfyug
         eHJeUOn+RqzT7R1M3eUSzeHjYCVul51jx9k8YT572Xp6vFW7tAylohfTKdggAksLW/tf
         GvWl0HdlJYrxReXutl21FVn7Pi0aQnnA0Q8sTYNcuZqPtdDZ6OIpacQR8t5xS4vbusMs
         Jwwj0gKPOx1Z5zuC5s6/zTOskkn0lHgVNkkfTyCHf3TFOT11LJFVJwH255GysiPWsJRf
         YgJA==
X-Forwarded-Encrypted: i=1; AKwUvBz8WsjSsV5R2tigJMRVtfdsRAJkWgF2MeJWkD1GWbKsO+DfBVXzSYiOPnWCv4YfdRXbaLy6Rc6ke6AjRQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kSxhA6f5sXgASeWTUwtsuvj+3JKS+CngOVsfIAnJ7s3lbJOSFP
	Wv0xd6er6ZKouyE/SyLHH5qDyqSq0UV75SRT5NRMm7CYEVp6LUVLrI0YJlbt/KY2t1LFFAZTpku
	Dy/1lIQ==
X-Gm-Gg: AYBFou0O1RqREhHE6ECVqv6HBQOpSFIJ3H+C6YEM37bn/zsOGYfp3lU1L3w7wWCGZoH
	dYMGVuti6yW1GhiZtMQJLgcVmk2PSUsefkbEoFCf1gWHZbPs7bCYf08J/uuuAQVHm4lopfTszZN
	0JdZI1k1/dN8uqWiOgWERgmRS7GMtj71eTY1mhTFbqSMUhD2A8D2Wl7sMkTmylIgn4KYDc8FW9D
	La11+kWeRgMM8YYPcexelAVB4JB7zaD5sXH+ZBds9QF+iiGXa7+qQ7RNXAR6QqpS57auMVW1EVs
	7n3c8ImcGHdCpPpUdwwuHAn1GiCiJms5MlItBaJU1BTSVJthN9pPt3MBFiMQzXF491Kz0PePENZ
	rwZnm/g24TACeLZO6f70T8JfjgoZEfEn4FtpA+ZER+Q0ygMNX7yIeWZKuyHb7h/HfRdQm2ieoMF
	FdLZ0gGPpl9f5eEpQh4VFkWAiXsEzNq6i1cENT3ex6YGqVE00w2Py4pxu1Ts6iHrbcYr6oX/bWd
	M+DxaRYUxZbAtYZ4gAq43e3jlVgAY0ZH27H
X-Received: by 2002:a05:6808:1906:b0:4b9:a88b:8881 with SMTP id 5614622812f47-4b9a88b90bcmr1648026b6e.23.1788513329868;
        Fri, 04 Sep 2026 02:15:29 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971240f68sm1773996b6e.8.2026.09.04.02.15.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:15:29 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f4cc6797b7so451076a34.0
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 02:15:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwg34fOeyQrkc39BQnBTU6pAD191dVigeSZouwLpG+DmKCfq5tGDPtMnqE6x3Sg64CuZMxwvSgv14Hzxg==@vger.kernel.org
X-Received: by 2002:a05:6820:1c88:b0:6b7:46e9:96f3 with SMTP id
 006d021491bc7-6b746e9a23bmr1781061eaf.35.1788513328426; Fri, 04 Sep 2026
 02:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903081145.8382-1-rh_king@163.com>
In-Reply-To: <20260903081145.8382-1-rh_king@163.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 4 Sep 2026 11:15:15 +0200
X-Gmail-Original-Message-ID: <CANiDSCsqZzFY+KMKGBg06vm6rGR4FMy63hd0HShiHfb+vpqyqg@mail.gmail.com>
X-Gm-Features: AcwNN1XKHymeIA-S6Rs3lXgSMWA8Egd58BO-6mTYrvDxAlW9gnMLUcdDBBtKg2k
Message-ID: <CANiDSCsqZzFY+KMKGBg06vm6rGR4FMy63hd0HShiHfb+vpqyqg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add quirk for Luxvisions RGB Camera (30c9:0122)
To: Kean Ren <rh_king@163.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 10:58, Kean Ren <rh_king@163.com> wrote:
>
> The device binds cleanly but delivers no image data; USB autosuspend is
> suspending the streaming endpoint. Disable autosuspend for it.
>
> Issue found on Lenovo ThinkPad X13 (codename Zelda, Intel); confirmed
> working with this quirk.
>
Link: https://lore.kernel.org/linux-media/20260904090751.1814783-1-rh_king@163.com/T/#mf5306ef689ce38ed331a3098272cb0ac2588ed79
> Tested-by: Kean Ren <rh_king@163.com>
nit: I think we do not usually add the Tested-by: tag for authors. We
expect that it has been tested :)
> Signed-off-by: Kean Ren <rh_king@163.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e289cc71ba98..32bf353013a1 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3216,6 +3216,15 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* Luxvisions Innotech Integrated RGB Camera (Lenovo laptops) */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x30c9,
> +         .idProduct            = 0x0122,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
The quirks are sorted by vid:pid. Sorry I did not notice this before.
>         /* Intel Realsense D435i depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> --
> 2.40.0
>
>


-- 
Ricardo Ribalda
