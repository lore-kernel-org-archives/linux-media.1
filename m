Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEC73C0A00
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 10:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049636; cv=none; b=maGEaYQn05Bkx5l19hPG5lXbTmnS3myZPOXtqwNm0p83QX4y8/Vbo3wXc5iZ3g2uFI13N0ZPn3a7NuRbEH0aa85UiLb/D6oPJLZ1WvJMvtw2n+ONmJMxV9QrhmP+XZ1qCy9PFvx4oNgt1gnU+7zAjw8LnyKxSssow7jqWEdctVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049636; c=relaxed/simple;
	bh=zUZLkBVMrK7owjpZTJWpbjJkDFwxfVb6wF0lwEMbZWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M2k53hrf/P0e9KecQKwrLo4i+Cwdt7h73RYMBwoK6LLXnPx736MsT2pl0FeqzBibgsxk4E4KJ7hTssSuRhr1RfBUum5Tq0ZGgtPufgCkHniM2Z7hL/6/1HkU148j1ZwJ3LEQZgaSeniZxTKtZ5eQ3NOeBqQ2s/I8/8bieihRLPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tf2X9sHU; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tf2X9sHU"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1c52d920b8so596364366b.2
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 03:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787049633; x=1787654433; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/5B1ftRBvGY7uotDZLJ1AzsZaLdekTHa5tvbqNRUW8=;
        b=Tf2X9sHUHjEvib9VSYoStiBTdXkJMAVhulNmryGFNeIv6LT1w2P1KVPOoFHEgnvVGB
         7Iq4bmE1D/pb6OygeIG43V7GSBlSfMdvBooKjlgBC13scSjPTopWR0qty6x/b8hP8OTa
         aOB4v4WIlFi62lp4P6BRFIDOGxssEXTUV5+pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049633; x=1787654433;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y/5B1ftRBvGY7uotDZLJ1AzsZaLdekTHa5tvbqNRUW8=;
        b=AQ34NFMUgqq3lEyjlLcB/WOHmwRQWhJWnB+KX7H/QgxiD7UyEMQiwpYgfJrOuGIqXI
         3bPrsxcDmKBRqcB1NRF/uhQInOLCCHUAX9EFnPBajEQB3bF2zqJexaTHqSYOYzIqJ4jr
         yvtk2IcT9GPO3V+C6RHL4wVBlGWFv3oN4PChFdHXMM96pELHYAzpnA69fopJIQj3at29
         +v4lVIH1DZa+rH7+9JR0SvJKQqQiQTXQqJr1pfZVPWwf19n7O44LJnHyQl+uavaHMoHl
         wI6aYqyr7dnq/wz0VvUrsKMAgpggMRhWa1ZDqYFdM/LctTRG0QisDHfVYFJ+lz/WQ0II
         hcgg==
X-Forwarded-Encrypted: i=1; AHgh+RrrO7g/tIwxUu7svKCPIz1OxT/njuGRNJbdgyczQskp4Zx1ss4lrBEQNlbKU7QJ20+AsQTdVgutiZjX2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwATR93ruTUDOkrA45wMUO1n37lV25q61E0mYuF6QbJhzWfC4h2
	f4IzYEoP26rhcyHsAas9dCi699YtZXTpWk4tdR9pLPR6oLUC+eSV7hhESd5NpadaR36rUOqSuXf
	h9FgAqv2R
X-Gm-Gg: AR+sD11tGNs+yNt2gEkyOVUYDRAbdhG2f9dloYqxB+e66JPa5cOmxI0MznPvZtTvF/l
	6BaG0Hgi3YFm0h0nwJYZaD/PHePZSxwyqHiX7SIh/eqfMR4Oa8/j0DLDT769kPnxAi4JuRW2EuQ
	LQHqfEH/OxGhYnJ9scVYnSJYuN0Gzjo5V5mc4eQjB+5DLPRTGzOr35pbHDTMA02+VSb92xfIjk3
	1Avpa53Kj3VpNs0TyglEeBXSOTXxoywRvvdrKuQx6Ryy95eMPItZy3S3HKbcowZ6/73R1Pq47Ca
	WFecvlLGMSNnR6glGLPWrdNStO+RJZS6OhGVKpW3bYf5x0ZFXxaNWdiVvbN95voK7L/XJ+A5DsZ
	eXH38tFeyJHroVFusMgYd0Adsse598vViERHZOADm6rUNdIqzI2xUpjcYjypimGVh+u0kR70Ukh
	enwHJX5wqye+xmbs7J8R89+zRDk70SSbZaaStBKPlHmwOYaRz+bvGNtwFnpBOeXxuzGsX6/CAeb
	H1+CHqvPO/hfF+dCZMHfFB/uQ==
X-Received: by 2002:a17:907:e84a:b0:c20:1c9d:8d4b with SMTP id a640c23a62f3a-c212a0901afmr1554048466b.2.1787049633063;
        Tue, 18 Aug 2026 03:40:33 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b97aa1sm131640666b.46.2026.08.18.03.40.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:40:32 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1c52d920b8so596361466b.2
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 03:40:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoqO/kBVzBtkqHpzx9Lt9wxQ32GuuIIWLxkMp/PUzy2kQINNUWGeYPWtRUgY9nXHA2eJ++FdremBpQ4Tw==@vger.kernel.org
X-Received: by 2002:a17:907:9413:b0:c16:592b:ec4c with SMTP id
 a640c23a62f3a-c212a090a10mr1433923766b.1.1787049630964; Tue, 18 Aug 2026
 03:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCue8yyiGubzbAybRqSUTTFuB=-Y2TZy6yvOx32SpAASWg@mail.gmail.com>
 <20260818103207.431237-1-natalie.klaus@runtimeverification.com>
In-Reply-To: <20260818103207.431237-1-natalie.klaus@runtimeverification.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Aug 2026 12:40:18 +0200
X-Gmail-Original-Message-ID: <CANiDSCuk3PQwJAGAGiF_n8=Eshy-xxew=sWfvD1xm4uK+ZjurA@mail.gmail.com>
X-Gm-Features: AcwNN1Xil5YKiCWKsBCrnqSqEH233W4Wl0sk8JIw9W7E1SBnbfnbpQAVKonzUss
Message-ID: <CANiDSCuk3PQwJAGAGiF_n8=Eshy-xxew=sWfvD1xm4uK+ZjurA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Skip frame descriptors with a zero
 computed size
To: Natasha Klaus <natalie.klaus@runtimeverification.com>
Cc: noambs2999@gmail.com, laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Natasha

On Tue, 18 Aug 2026 at 12:32, Natasha Klaus
<natalie.klaus@runtimeverification.com> wrote:
>
> Understood on the placement, thanks.
>
> One finding while building your refactor: it does not compile as written.
> Dropping the uvc_dbg() removes the last use of alts in uvc_parse_frame(), and
> the kernel treats that as an error:
>
>   drivers/media/usb/uvc/uvc_driver.c:233:36: error: unused variable 'alts'
>   [-Werror=unused-variable]
>
> I removed the now-dead declaration, which adds a hunk you did not specify. Say
> if you would rather keep alts and identify the device explicitly in the
> dev_warn() instead.
>
> I also wrote the dev_warn() text, since you specified the level but not the
> wording:
>
>   dev_warn(&streaming->intf->dev,
>            "UVC non compliance: FRAME descriptor is %d bytes, expected at least %u.\n",
>            buflen, 26 + 4 * n);

I believe that I wrote :) :
+               dev_warn(&streaming->intf->dev,
+                        "UVC non compliance: device %d videostreaming
interface %d FRAME error\n",
+                        dev->udev->devnum, alts->desc.bInterfaceNumber);

But anyway... I think dev_warn with intf->dev is more than enough. I
prefer your message.
Thanks for that

>
> Happy to change it.
>
> To carry your refactor as 1/3 with you as author I need your Signed-off-by.
> Could you send it, or tell me if you would rather I take authorship with a
> Suggested-by: line pointing at your message.

Suggested-by is more than enough.

Thanks!

>
> Natasha



-- 
Ricardo Ribalda
