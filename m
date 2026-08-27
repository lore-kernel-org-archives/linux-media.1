Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72543F2118
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 09:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822694; cv=none; b=HIqKn9FPbtzcwm3wHo3sC5cX6tchUilshFEKsaHUxwihVL6SaUkFnEFNsE1A+6Et0hXEBu3MAT/twNFm1a813Jgn+nf7QhAJvv7IC9anJ7BuXrRtSlDxglguuOn95hNm4TQAwU243svtVuwqBQ0tAmYmSa1fj4XwXmPOWTtI42w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822694; c=relaxed/simple;
	bh=z2EWH7FeUM9/TSo6TLuCtDRJcE5vWDUMPiY/p4fGhXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ow4VYmP98f/AcRGBWGkjsmxxq8bJQF12VFW7uiJpdWc2gCrFwMk38Y+mHizFCicvQzye72SWDrwPw1doivrd8Z2aVP0nbJ30YmUAud36IUqpVz8cW6eNBZxv+kQRrVzWV3mkQidMJVW5fhaOlWDT0NkSfAeYrVenUcZ4yybREpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RkUuzXtT; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RkUuzXtT"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1786664a91.0
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 02:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787822692; x=1788427492; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+qDMS5fgezJeERP2RJ6v2fuoUWu61bf471m73GBDqg=;
        b=RkUuzXtTqYrKcyF/yN+mqxpYFyvLVdDI0kjijffQmkuiqAT1Bl/BftRduAlVLXRt7Z
         QoaVC/iv61DeIXQptzeWZF2MOkT+gHJWWR6vaFqrBS0ctGkx1nM48jHhUo4Aytjt+Hui
         5uxgQrDKPvkpQL1N7n5nBSzT7Sy0ZKPxaI+kU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787822692; x=1788427492;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8+qDMS5fgezJeERP2RJ6v2fuoUWu61bf471m73GBDqg=;
        b=VGlMmtdIUkiJcFaEG0jv6oTi3yvWUXYfj36mkEUZPnn2nMr7jfB/5BXvD6PEA7NinE
         n6bs8KRRR08/7K5LZpmAh7+xXWu+Rnu/F/Nj25viYQ7fYyqZHyvxuuMceumtbzS+4QLx
         O1afi4xRvIGUFbeMPQptNTC2dPKuKDNz77xusi5bw5ZUHLQCJXyrznGZGtOxsr0M5z2F
         ax2LELG75dtBTM3CYTKMipltktyPC4H0o+7f+iVTOFYmyroVCvHUzMa115PvJboC1wjY
         +ReVW4pfUVfY7JTmFUaxGvRSPLeaECjuPA+OtNlSq9AsOwP1zg41NCVdHeHD2rmZHD1I
         E6WQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXJuTLYPH6KgoaTjr0KS2z6lAvdHbazuEFAS61SS6w9xo278FrxiRD6ih52Is15ojXhpWhGQDCFXKQoQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lNND+F7u8bzXEQsiCtvmQR9DzkU8oMu458bxguXm/A0nAJW1i6
	xfk3vtRZBTRQmLpNRlsZsz5FkXue94CTToibcIpjRa6BylITBH2m0NMfZZsP4Rw1BbqJ76740A7
	cfEOHdA==
X-Gm-Gg: AR+sD113CAdI04bC6Vl/XyuEevw4aYzg/Dno+hAwR+lrTnaETHggkELSHu5WaV14tYs
	71NvWgGz+3glWmOoRKhCIyqryrAOIpOW6/kOFk8OPuMzC8akTwN2VELx7UVNtGvOgR6OT6Mkspa
	SzpWd3PA/p48YvBMvwS6uo21yybqUyJTxexcvaHOiFnfut0y2GkE4Wo4eL0I3Q2wf3WxK9l39ZA
	hYBWIj6CBYcKG0RknT3lrTCMd9tW+6uqzRZ7nRSBQwg94dxAsLQFx/g5Ydw6E5TuZC+VnEVkfCg
	1n9R9ot6z+HhdkT5MWDU96bLcpQ5bb8FgwELWGObt2SmpGOgV33sg7ScZug2+b6rkF+blKACvlA
	do460TcT2Nca+BHa1CONkEeMqvJe2xyLWdMV6a7rxTqeUFN0mwrRSy7nNCzD8u3L8nH5GpVkFFs
	BLt8pReg73/xAJ6RWffOwKlQ/BBGYKLl9GRu2RDWCik8y6/1CGjxj+udRBka0paKQMKzcXGissq
	DVpx3j9cNFagpiB09qAkfq0i3YrFg==
X-Received: by 2002:a17:90b:164b:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-3966cdf6813mr25497996a91.0.1787822692119;
        Thu, 27 Aug 2026 02:24:52 -0700 (PDT)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com. [209.85.215.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ead6a5sm2122505a91.8.2026.08.27.02.24.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 02:24:50 -0700 (PDT)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so1197087a12.1
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 02:24:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq5W9dptafPxqheMzDJzUTKuikGQDMl0ym5uExifEGcaJHbA4f8CFrqLXppWOMOYTPozVbaqU/W45rP2w==@vger.kernel.org
X-Received: by 2002:a17:90b:560c:b0:396:67ed:da2d with SMTP id
 98e67ed59e1d1-3966d4931a0mr28301374a91.15.1787822688301; Thu, 27 Aug 2026
 02:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820201128.35669-1-s.shtylyov@auroraos.dev>
In-Reply-To: <20260820201128.35669-1-s.shtylyov@auroraos.dev>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 27 Aug 2026 11:24:33 +0200
X-Gmail-Original-Message-ID: <CANiDSCuWc8oUhFgqVMH+4+nzStuPfA5b2Vz+2woXqEu6ob1yOA@mail.gmail.com>
X-Gm-Features: AcwNN1UG46EBFDQ4VlRpNyOCywXSGf3IqhbOtZIqZIMzPrkHbtNO4T67HlZRs5w
Message-ID: <CANiDSCuWc8oUhFgqVMH+4+nzStuPfA5b2Vz+2woXqEu6ob1yOA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: drop useless assignment in uvc_parse_format()
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sergey

On Thu, 20 Aug 2026 at 22:12, Sergey Shtylyov <s.shtylyov@auroraos.dev> wrote:
>
> Close to the end of uvc_parse_format(), the parameter buflen is decremented
> (again) but that statement seems pointless as buflen isn't used afterwards.
> Drop the useless assignment (gcc doesn't generate any code for it anyways).

The patch is correct, although I do not see a great benefit in
removing it. As you say, the compiler will remove it anyway. If we
modify the function to add logging or continue parsing the left over
buffer, it is going to come back to haunt us....

I leave it to Laurent or HansG to decide if they want to merge it.

Thanks!


>
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e289cc71ba98..0e78e8bcd320 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -520,7 +520,6 @@ static int uvc_parse_format(struct uvc_device *dev,
>                 format->xfer_func = uvc_xfer_func(buffer[4]);
>                 format->ycbcr_enc = uvc_ycbcr_enc(buffer[5]);
>
> -               buflen -= buffer[0];
>                 buffer += buffer[0];
>         } else {
>                 format->colorspace = V4L2_COLORSPACE_SRGB;
> --
> 2.55.0
>


--
Ricardo Ribalda
