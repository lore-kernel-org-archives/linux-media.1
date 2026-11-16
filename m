Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835432;
	b=lJ7LQ5vAYRcmQPExBe/20KlNjnmxyPOSi85crXsUb6AcrpMCuRK4GrWvNNI3ve/MxCZg
	 0TBh/2EUON3kCiA6CXj9h9HPlyhyulpBfDYdgNUZ92OkajzHKEyClr6LZt9AfQ6h1yDrk
	 1tqbe6cPpVx2qUxe8mtTX6kNroBkWKYAPNjQFp7HQpAHktrHVA7rGfitRBlTjbXFmV+Mf
	 KHu8IRr0ajWSdKRPQHKH+NioJE2KuK1mc0jAlbC6C9rb+w3adVSW/FYSuSzd5SaTP9Xp1
	 vqfVJ1SNogCh4L4TjQ5RImwhIzAVkMgWDgUZyL/yuBx24ocl+J3FV6b8kiJE1PkXUuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fD5u8EDjljGCE0xDZ4fbiW3sWVh8TOsEBt4cumx8/T0=;
	b=MYm0AW+5u+ySDkRPuKie+PShCC4bfM2cBFov9H1B5WgvcCgdwO5XjIEOdieK+v16iLzt
	 NsBRD7NwScT03qVvwwBB8A/nXF1i0WO6P9BOiOyodO0pKQnd7HNj3y067rDp3tcgOCFZj
	 yh70W9IGChzxuO5I3FUkyOrWvuU6EF1dNtnTxOKKJ0P1laCBgZqOUD77bldyA5/oVfMgf
	 5ACsk+2Yk4xHQdj/7qN89IzHJYWcGLJwiqFTQF80mD5oI635pFEXYhZCInDu3pjUf49Ac
	 9n5kQWmlSbLPCB3vG3NJIuH6yBqxqNxCnumzngSQuLkzkfZE2IQ8f+UrCFNSfdP/ZSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XT+RFfUf;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C84606A323
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 13:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27C84606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XT+RFfUf
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b2f59de176so3867612b3a.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 05:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794835431; x=1795440231; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fD5u8EDjljGCE0xDZ4fbiW3sWVh8TOsEBt4cumx8/T0=;
        b=XT+RFfUfprv27LWd5bMdJlkR5mDDJLua3R67x8JDpXNDTPB12x0S/PLhevtlJR92rB
         fJiHrcxc+XmXYOko9f17f0xJylL1yN67m/OrY1tsbt2mc+bFsME+zVTfgeChqFAbpv7H
         yOC5Z1/8c9Bq6zZRY6JIi981H34TqvQL24Nrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835431; x=1795440231;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fD5u8EDjljGCE0xDZ4fbiW3sWVh8TOsEBt4cumx8/T0=;
        b=WxgUAl/rIxHNIqpPF1x3cvn5TvvV0QGvAsTN1GDjxt8kfroCld+YWUc3SsLOPVrLTw
         ar5/wqCaX9PAcCZCTwy4EvnQNESBW/G6laEP6b1PeeZKrsMPD2DPQTExNIohXghDNCBg
         Wqee2BJYsD9BWw0brHh1I02ZENHLi1FSXyxbDYfXJCqdVrFLY6WkV6++czrZsP1HdUqU
         lc8vE5ENYu0k5EatNoXK5egOd8OLL6JwJ7OFrX3QU8h89ETLmQAnlRcKoq58FbnN0WhZ
         4lbqNRp80NGvNIu1Z2m1uWsxId0HcKcv0OY2B+e+k8wUsM5tZt5XvWuyvuS6HA28U7G/
         yXxQ==
X-Forwarded-Encrypted: i=1; AL+hErH97Eye0u/x7Hw8pBasTQvQnGVKofTVEuI93JAvcR1jMx1Na7d0geaGZgxfQbFytt31SB1CbVsM9vLBWg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8PTj7ccXsdkgKg0co6XhlK5tsToMC61KNZzdIUIQIW3VmngHZD
	hMJsph+Zg3dE9XV7kO6I7OMYOPODj1QE9PW5Oxkqc4xLMZ0KSNdrc26124NGq3t4kd4qMygWDdL
	CahshHKir
X-Gm-Gg: AYBFou155jcrMzWLTAVWl0B/R0GrsdZCq9X1O71zgq6xNQfJeBq2EB0cDbF8zccWMWI
	+oWqFGR59zHDIhvxD9o44a5pBf6qNrpZYVOyb+RCRowOOAb5tNAYihrEsEwDlMvlrZrqnH/Vbzh
	o3whz+Hc7GSsv859zM2pzJeEgwqNxwyCyHISyP49zt300wI72Ki8SzEr+lSM+0Z5ln5S/Ux80T4
	nyP36uyZq6QQDaR8oqw3gTTp5ecbgyhVNV7J6h7G6NopZL5+v7Y1o0y5/lHY/uD+LHwl0ppAn30
	9aAPom1QZuEdnAUz4zmkCSdHE/w3ofHu4ooykLxloCCGvu4s5gvkQ/9/fNnkfH3zqSLkb/ROo/E
	GFHhoZamcH2AQfrg8jE9BZBRjDez7tZUSFTOU/V5XahjYlgc6/8c0O5wry57z8hI3+bV87pGAUK
	OclXZMYP9aaNv1H2YmBddCeH06FrPIc8g3OXAjQHjCZhq6nfdou2PGOWZv0MW8n+fRVXtSt1tqq
	6JdpjfmzmvIycoJvOmynkpeg9wRH0OHxmltBw1cqSi7QlCnK6sZiOwNcClxwmxNv8oX1DjyJrwt
	cEb4o0/p09bYKBwWhHQqArsUpVbqdpYQWM0hEolmdx8RijiGhyllpAVVkMY81x9jqQ==
X-Received: by 2002:a05:6a00:14cf:b0:89d:e6e2:b2a6 with SMTP id d2e1a72fcca58-8beb714f786mr10042282b3a.45.1794835431369;
        Mon, 16 Nov 2026 05:23:51 -0800 (PST)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com. [74.125.82.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6dbb1sm3829261b3a.23.2026.11.16.05.23.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 05:23:51 -0800 (PST)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so3710277c88.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 05:23:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGSTl4uVyHc9g72jFkTSw+DyDoSuWczuqC5gDJqOrSgOwvKxAXzmB/WC3dAP+ur/mV7ib6Ydc/NSqRgaA==@vger.kernel.org
X-Received: by 2002:a05:701a:cc91:10b0:1b5:2dce:1b6d with SMTP id
 a92af1059eb24-1b52dce1c17mr3055768c88.17.1794835429211; Mon, 16 Nov 2026
 05:23:49 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
 <20261116-uvc-shortmeta-v1-1-487cfe42fa89@chromium.org> <20261116130839.GA1714298@killaraus.ideasonboard.com>
In-Reply-To: <20261116130839.GA1714298@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 14:23:34 +0100
X-Gmail-Original-Message-ID: <CANiDSCsuPhCyeFWSBPWauECVHQ5A0ySMSqvC7UB6W9ZR4_+iAA@mail.gmail.com>
X-Gm-Features: AclHuK_Zhc9uC1guqtPyu4702nINbtLFRGaSTrUWoBHn2UUyYnjYXDCq7yKTSpg
Message-ID: <CANiDSCsuPhCyeFWSBPWauECVHQ5A0ySMSqvC7UB6W9ZR4_+iAA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: uvcvideo: Reject short metadata
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sinan Turunc <enscrpt@pm.me>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent


On Mon, 16 Nov 2026 at 14:08, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Nov 16, 2026 at 11:56:37AM +0000, Ricardo Ribalda wrote:
> > The UVC header has two bits saying whether the packet contains the
> > optional PTS or SCR fields.
> >
> > If the header says that those fields are there, but the header is not
> > big enough to hold them, there is something wrong going on and we could
> > read out of bounds.
>
> There are multiple checks scattered through the code for this already,
> some of them causing the whole data packet to be dropped, others just
> short-circuiting operations such as clock and stats updates. Did you ned
> see those ? It's getting too messy.

Yes I saw them :P.

I can move the tests to uvc_video_decode_start(). The question is what
we should do for non compliant cameras.

I would love to just drop the packet altogether (with a non compliance
warning), and if someone complains... we can add a quirk or some
heuristics.

Will send a v2


>
> > Mark the metadata as invalid and move on.
> >
> > Reported-by: Sinan Turunc <enscrpt@pm.me>
> > Closes: https://lore.kernel.org/linux-media/20261115121701.189-1-enscrpt@pm.me/
> > Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 8 ++++++++
> >  drivers/media/usb/uvc/uvcvideo.h  | 1 +
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index a92a986ab714..9cc5d83acbc2 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1487,6 +1487,14 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
> >       if (has_scr)
> >               len_std += 6;
> >
> > +     if (length < len_std) {
> > +             uvc_warn_once(stream->dev, UVC_WARN_META_SHORT,
> > +                           "UVC non compliance: payload header length %u is shorter than expected %zu (flags 0x%02x).\n",
> > +                           length, len_std, mem[1]);
> > +             meta_buf->error = 1;
> > +             return;
> > +     }
> > +
> >       if (stream->meta.format == V4L2_META_FMT_UVC)
> >               length = len_std;
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index af8cef94ffff..59e23e55bc2e 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -661,6 +661,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
> >  #define UVC_WARN_PROBE_DEF   1
> >  #define UVC_WARN_XU_GET_RES  2
> >  #define UVC_WARN_QUERY_CTRL  3
> > +#define UVC_WARN_META_SHORT  4
> >
> >  extern unsigned int uvc_clock_param;
> >  extern unsigned int uvc_no_drop_param;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
