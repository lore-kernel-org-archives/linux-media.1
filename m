Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60121423A6D
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515130; cv=none; b=RSVFT4F4oG4Z497yx5Ok1iMPc4i4BvlvVwRj9Gn0SR/LITtsSWdBfEQrZ/PWOeMOjQ/wG81ss5e5AVjhkERXU0XNCwFEQzHh2wvriNQTmaH/jnE4+XHvOMCmXvy/xgWMCBYzMEkpuLwMZrCfPx1CFmzWKsTZGQYqM3nMl63v3so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515130; c=relaxed/simple;
	bh=tPjz8MvZYUwd2HrVmfdhiEjC4piGNjBbAcum3J0fxsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iX7pDZQrEY7ITqBeULtLvgDN0/Rua1B0wH82secaFRY5TS8YytJsncWO6kimtF9vC6ZjCoxQRXV5frV81jOQ5C1efr2ytPmHZ+wESaKXs6g0jM9JXr2DegNHgjMASfl5k9iyRqBbuRNGvOGQlmrtmtZW9tp15pApsJWkLyzG+no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a26rWmr/; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a26rWmr/"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bc356898256so760595566b.3
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 08:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778515126; x=1779119926; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gGm3/h7WrYTDgc2Zza1Wt6uQJTTMxObDFpBEiSspy7s=;
        b=a26rWmr/2wOeK5THa3Vt8qROcGtedTUCHaw3vcpGIit4+dArqT0RyNy35+MpIj48bH
         UWXU0aDDjivZFrr8kk7J9tyPOhSA7bDcg4DmUHPDrTC5RaKrvEjpq9fVFCvvJ3SxWxuq
         pqImnjjJqI/QAuPHq0+ET91pEApLfVTr84RXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778515126; x=1779119926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGm3/h7WrYTDgc2Zza1Wt6uQJTTMxObDFpBEiSspy7s=;
        b=OicudpwWkXdZAejUSqzMS5RzYyFPHxWe0NnI65zDUWzDJ6TxOwZLizF2GTTDRNn7Ze
         WUebhFijnnqE63osszzSpCfmnqstpxXJjVQQ7yMTudx6aZk9kHDHMF+hsXmMhkRMegGi
         JqLIGk5FFMDaLgJBz13nCltGWt6wE0f/v21sFb/+Dx+4DLHVqu9eiJPsIE7C58FMPgnT
         MilAk9y/edyLQoQu0qMDl3BQYibxEazZU2lYag6YFyxpS7QWAy5FfJWlJCQxVoisQOVh
         cPVBQzdVJq2m58ERpK30vF0S2xON+1psLfaFOEQE3RFaqavT88IBQbk1KsfSOkjhgS8l
         QxNw==
X-Forwarded-Encrypted: i=1; AFNElJ933BnEBPW9L0TAusRCpGYMzG3rQpYtY0k5+nSi+bG4BCY0ABoA8UjGlxfMWX6biRqTw11+hoj1uLhe9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4rCDtG6aA9wivTMlzljhRImWPPFypLuSkQoGlMMBFXzgtMUbz
	4dDyG/GXWhQFeoo2hM5JYl1xmMimigxVp7Ok2XRoz9TLBm9lM8GV8awrNZv4p7zb9EERYWbhmMf
	vAkw=
X-Gm-Gg: Acq92OH1YCNGu52LmQufxuf7VwnIKmUZfjv0kMQK7FghHc65gfus9uLx7RRBXMQnbDh
	ayWtGg8vtrobn3OZljAzOOknFx4M/beBIWMxhhb9ukhoQwHj9zjmbZkQi1biV83ho/8vW0lx3b0
	VeSXKM3oNRpw8fQOgrRImlfrcVTp9LfdvdRMO/4LWZj+2KINQf9iohfb324xYg9AEdVPKbEEokG
	IHhX/VYOfkjCey9BVL2/2YBNOgYNAJ8MDx1KBlwQI8CVFMWjyKbKEPB9cgA5nnyFqzeXUNhq+we
	63OQLD9FkNvPmbaScH0J3Ep4/8SQQodbxvi97lAJjM+3EFiZzQDjcGj5KVsn2OI5EpFTPDvLcBW
	b5+i3xL6yGnlQ581ZU9A25Lpg/7l6KjN3w0RvX5yrCBPDfrXeigqTkhaAhU/An1Ubv+POfStHHr
	ik8+rqBkOcpvYtWRwD7ChMoLpxDmWd0AMd2ITtHo+C+I4lGzA73zvkD7d26/GME+uRIbpZQaI=
X-Received: by 2002:a17:907:7f8e:b0:bca:190f:9827 with SMTP id a640c23a62f3a-bcc14daf6ecmr494822266b.45.1778515126230;
        Mon, 11 May 2026 08:58:46 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bce4c41b1e8sm258966566b.8.2026.05.11.08.58.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 08:58:45 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bccb9dca1beso329939166b.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 08:58:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+9GbjY/Pp+zDJvRwNNisr/ebucbQ3XPFgiRHZSI8l9zvIPWCOKYINJt6Zc8qw/KKmTdiBsIng1tz0qSA==@vger.kernel.org
X-Received: by 2002:a17:906:c14d:b0:bd0:6dbe:22b3 with SMTP id
 a640c23a62f3a-bd06dbe3240mr238397466b.18.1778515124475; Mon, 11 May 2026
 08:58:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
 <20260323-uvc-hwtimestamp-v1-3-aa42e3865204@chromium.org> <20260511155125.GD3043805@killaraus.ideasonboard.com>
In-Reply-To: <20260511155125.GD3043805@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 11 May 2026 17:58:30 +0200
X-Gmail-Original-Message-ID: <CANiDSCs5jeEN7OL1PDc0XXtCP5Op2jpnWJyw7WR4Vn_Z7ECYOQ@mail.gmail.com>
X-Gm-Features: AVHnY4LotYKZD0QXvksPifwDyP78oM1-PCByG8vfrZnviLIV2oBHBptW9nPbzG8
Message-ID: <CANiDSCs5jeEN7OL1PDc0XXtCP5Op2jpnWJyw7WR4Vn_Z7ECYOQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: uvcvideo: Relax the constrains for
 interpolating the hw clock
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 11 May 2026 at 17:51, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Mar 23, 2026 at 01:10:30PM +0000, Ricardo Ribalda wrote:
> > In the initial version we set the min value to 250msec. Looks like
> > 100msec can also provide a good value.
>
> I'd like to know where the value comes from and how it has been tested.

I used the Android CTS framework for testing. It checks in multiple
places that the timestamps are stable.

>
> > Now that we are at it, refactor a bit the code to make it cleaner.
>
> Do you mean using a macro ? You can mention that explicitly here.
>
> > Fixes: 6243c83be6ee8 ("media: uvcvideo: Allow hw clock updates with buffers not full")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 18 +++++++++++-------
> >  1 file changed, 11 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index c7ebedb3450f..dcbc0941ffe6 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -494,6 +494,13 @@ static int uvc_commit_video(struct uvc_streaming *stream,
> >   * Clocks and timestamps
> >   */
> >
> > +/*
> > + * The accuracy of the hardware timestamping depends on having enough data to
> > + * interpolate between the different clock domains. This value is sof cycles,
> > + * this is, milliseconds.
> > + */
> > +#define MIN_HW_TIMESTAMP_DIFF 100
>
> UVC prefix.
>
> > +
> >  static inline ktime_t uvc_video_get_time(void)
> >  {
> >       if (uvc_clock_param == CLOCK_MONOTONIC)
> > @@ -834,15 +841,12 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
> >               y2 += 2048 << 16;
> >
> >       /*
> > -      * Have at least 1/4 of a second of timestamps before we
> > -      * try to do any calculation. Otherwise we do not have enough
> > -      * precision. This value was determined by running Android CTS
> > -      * on different devices.
> > +      * Check that we have enough data to do the interpolation.
> >        *
> > -      * dev_sof runs at 1KHz, and we have a fixed point precision of
> > -      * 16 bits.
> > +      * y1 and y2 are dev_sof with a fixed point precision of 16 bits.
> >        */
> > -     if (clock->size != clock->count && (y2 - y1) < ((1000 / 4) << 16))
> > +     if (clock->size != clock->count &&
> > +         (y2 - y1) < (MIN_HW_TIMESTAMP_DIFF << 16))
> >               goto done;
> >
> >       y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
