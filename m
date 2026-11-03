Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713635;
	b=N7rA+5Zgw5KnKmbEyq3HI0DXvJ1NZeG6NW9Qcqwyn/3MA0aKnUDF8m0zYL2XKRMfjEpz
	 W8DfuHGDTDgy110uG8dqx00Ifmd+Rce4u5f2SjdLVkjxVLAKYPPZksxjtNDBsbst2/32T
	 zJonNtu599Xe+ANvM/3dhPHYawZIXgPK3zlVbgDT3CLqTFi9YZA9DASgsIwh3Y68c/5xI
	 OA26vKI+dw1WX9Qw28TdU609bcdcpDy/MyYw1CrIdlZp8mOGO/gkxFMP52gPZ2Tk5vQTz
	 jLvE0ituaRoHB2iZGJRh2qaO40vR5Hk0xZYobVGHawUdw2fTVpkQrZtyr55bKjS4kGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zueZNP1aj9vbS3XFpHdbqXKOjA2wf/HQOC7naWwefJk=;
	b=Aj33CdTwg0MhzY1wGATqsXvBYv3URnx4Lb8tPcrvZPCry1nLaLIWrPDyCGwROqBT1NSQ
	 1V3o7EREMGFsSCvUq2j7RPut43E0naOcCzuzRgLo9gmzayo8i5iG4+oGaB6jTMibvAZmf
	 i8oRA/UiYOVJcEkPDE8kOHXls1JLNAhplZOT8WqACsvFDODNptLrCAfI2PgiMfvnST4S8
	 k7KUSvSD6jGrMjRYG1Gv6xLa9ygm2kA586eDyh1Gl1oTdCkGJMoDjGB4B4MuYHmB7LA2N
	 GchNRsoSQ/yXOpNwtiwaIMa2IIs0XxK81/2rXthoo47TrrVma5S8soBcbCI6n/IfeeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="MS/nCF09";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F65606A32C
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 13:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F65606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MS/nCF09
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso3051214a91.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 05:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793713634; x=1794318434; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zueZNP1aj9vbS3XFpHdbqXKOjA2wf/HQOC7naWwefJk=;
        b=MS/nCF09Kaepy8l4amk1AQkeG3JDeFVFiR75xOhgb/2YUD0I64nG1hnAmPHtaRI9KL
         +12xegRgpBfgYCJdMNqlmMssuRfjcQSMvIfWtLsVW0pwT77LnFGz34MPXkvI7Ex/emG+
         J1Ge9yVaF6ICQLHwVOAuUiFxs/pxHXlDYaFPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713634; x=1794318434;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zueZNP1aj9vbS3XFpHdbqXKOjA2wf/HQOC7naWwefJk=;
        b=LpTqerrewtT3U021NgZcDxGY8p7/wN4PUutUiSR8bFa+sSX5me8/muNVhQlxqFTD0L
         4XgrWbVDpoxmiOIj4/PRjgsZQ36kPfTru3kqAH95aWgivojduGDKoJL9w3oF9t0xXDQd
         4egYowZujkXWdPI2ZyuECyy9s7XbKrKM7XlbPWwHFQBtUhuZHYjVls3vsjNtrFrYvzCn
         /pnoOkjvwVcpHiFKZWpH0xMXscN3HiQMTEBzsnqWR+h74DeJTtIG1SIBJlnpqFOt1hjU
         Ol6VZSv1GjFurAiBUb29MJB/xhsKsuZatDHY1NOaeP0dcKM90V+ctrgkH4pdCQkR8EAh
         yvsA==
X-Forwarded-Encrypted: i=1; AKwUvBznE0vD/KVf81BAfBObGYSM7CgnlcCNHqSXe71dFO9XNe4coACqxukJ3JwyCFyNbRsMtgtaOXL5xKeK1A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+63Dr9dLswDMbot7LdhLC53iU6qtWXNiCQaj7Ob+jL/1rgTrca
	CxA3OS1kOSdecAyAZkv5ltnPQ/V7MZaSjPf85dBhIq5Y/57bG7RnY6A5GBpJNPyagUfR0fj2XC/
	8bi2iSPi4
X-Gm-Gg: AYBFou2vNqk51OzVatPdt9Oq9UDiq+jp9hcPON3bZ+OyLnOXwpeADo9p6wAXWg74dyE
	2Ao4dttK50eZZeNd9m038vZDPoeEXWIkUhyOor82PuXDLOiDcGN29RcZhSHzva52xO6JYQAy9aO
	bcMgLVK7VAiqVGfAD44xSjlMc2PwMc4lBmZ8JpEjMxSZCMI9V29RMIUdOMUS5Xf9UhNFckkAQ/6
	qIO1vi9sMt+Io97sBfTDDK8lT1JtphMhMnwpv4JpdWB/w/jT0+XIGGZuYx2iR441Na2OaOJnqVt
	WXDMqeME293EA2+tsEgyQ//k9B7eRkr6M4WzBK6l3pkonRNDCy+DdUrKvoHT/F+4LW1y+5bYsN1
	ZOOLSHObUJ6xK8xVom+EeflEkT8BMjeFQ4Xhcj7I02G80e/6a7u1fauz9E5V8Oz2n55F+zS5pvj
	O5nIQ+6ZesDcdN72oYhXvmcsu2mhJFuIf9zkzxZNnIRYZrJCJljMCqYc2VNI4dr8k5YhIwo5vIu
	WNy2h5UzsVTz5s4uKuXSpoYy3IVjheHCKF4N1dTe6x6xL14LCFWOKOER667v6NLPfUZh1AlS2M6
	9830gLFF7QWuDEMDqPdQr/gF9T1TY2xI8oTY1h/mRpwDdRylHA0jV6EtfwmWtPf8
X-Received: by 2002:a17:90b:570c:b0:3ac:8897:7ba9 with SMTP id 98e67ed59e1d1-3ae8985d52dmr11827984a91.56.1793713634063;
        Tue, 03 Nov 2026 05:47:14 -0800 (PST)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com. [74.125.82.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5d7f82sm4574364a91.5.2026.11.03.05.47.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:47:13 -0800 (PST)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so4261169c88.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 05:47:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzcvSaY6ztIdHMeB7CHC9kVMNVnFB+v9xlli41LsRQhfWp1bGwW+JisaWw5tqaZOxKOcWP4BVTNfAMF2A==@vger.kernel.org
X-Received: by 2002:a05:7022:7f19:b0:1b2:3a68:f18f with SMTP id
 a92af1059eb24-1b23a68f64bmr6139614c88.22.1793713630988; Tue, 03 Nov 2026
 05:47:10 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025143522.327365-1-m@manuel-herrmann.de> <20261025200645.GB1001933@killaraus.ideasonboard.com>
In-Reply-To: <20261025200645.GB1001933@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 3 Nov 2026 14:46:56 +0100
X-Gmail-Original-Message-ID: <CANiDSCt4-Fe0K-Z1fZpSLzP9NgPvPgrFtP8L8AydgM=BQK_WYA@mail.gmail.com>
X-Gm-Features: AclHuK8xPEPmSnJMsCIQnMZV-pQNvjoVqbPFhW04b4cRIhHNAnZsPffF_fOjdMo
Message-ID: <CANiDSCt4-Fe0K-Z1fZpSLzP9NgPvPgrFtP8L8AydgM=BQK_WYA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add support for NV21 pixel format
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Manuel Herrmann <m@manuel-herrmann.de>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Manuel

On Sun, 25 Oct 2026 at 21:07, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Sun, Oct 25, 2026 at 03:35:22PM +0100, Manuel Herrmann wrote:
> > Add support for the NV21 (Y/VU 4:2:0) pixel format to the uvcvideo
> > driver. This format is exposed by the color camera of the Creality Pika
> > 3D scanner (2bc5:0c0b), next to YUYV and MJPEG. Without it, the driver
>
> Could you please provide the USB descriptors for that device
> (`lsusb -v -d 2bc5:0c0b`) ?
>
> > skips the format as unknown.
> >
> > NV21 only differs from NV12 in the order of the chroma samples, so
> > bytesperline is wWidth, as for NV12.
> >
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Manuel Herrmann <m@manuel-herrmann.de>
> > ---
> > Tested on media next (d7e7bca71698) in a QEMU guest with the scanner passed
> > through. Before the patch, the driver logs
> >
> >   uvcvideo 2-1:1.3: Unknown video format 3132564e-0000-0010-8000-00aa00389b71
> >
> > and the color node only offers YUYV and MJPG. With the patch, NV21 is
> > listed, G_FMT reports a bytesperline of 1280 for 1280x960, and v4l2-ctl
> > streams it at 30 fps. A frame captured in the guest has the right
> > colors decoded as NV21, and red and blue swapped decoded as NV12.
> >
> >  drivers/media/common/uvc.c       | 4 ++++
> >  drivers/media/usb/uvc/uvc_v4l2.c | 1 +
> >  include/linux/usb/uvc.h          | 3 +++
> >  3 files changed, 8 insertions(+)
> >
> > diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> > index 0107cedd0..7d918ba0e 100644
> > --- a/drivers/media/common/uvc.c
> > +++ b/drivers/media/common/uvc.c
> > @@ -24,6 +24,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
> >               .guid           = UVC_GUID_FORMAT_NV12,
> >               .fcc            = V4L2_PIX_FMT_NV12,
> >       },
> > +     {
> > +             .guid           = UVC_GUID_FORMAT_NV21,
> > +             .fcc            = V4L2_PIX_FMT_NV21,
> > +     },
> >       {
> >               .guid           = UVC_GUID_FORMAT_MJPEG,
> >               .fcc            = V4L2_PIX_FMT_MJPEG,
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 644c2f1cd..60732f5ac 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -232,6 +232,7 @@ static u32 uvc_v4l2_get_bytesperline(const struct uvc_format *format,
> >  {
> >       switch (format->fcc) {
> >       case V4L2_PIX_FMT_NV12:
> > +     case V4L2_PIX_FMT_NV21:
> >       case V4L2_PIX_FMT_YVU420:
> >       case V4L2_PIX_FMT_YUV420:
> >       case V4L2_PIX_FMT_M420:
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index 99b070ab8..48419a862 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -85,6 +85,9 @@
> >  #define UVC_GUID_FORMAT_NV12 \
> >       { 'N',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
> >        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > +#define UVC_GUID_FORMAT_NV21 \
> > +     { 'N',  'V',  '2',  '1', 0x00, 0x00, 0x10, 0x00, \
> > +      0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> >  #define UVC_GUID_FORMAT_YV12 \
> >       { 'Y',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
> >        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> >
> > base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
>
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
