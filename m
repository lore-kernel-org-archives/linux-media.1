Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793668702;
	b=NgxxHjvGcWLcQ9LEy7twYVYTD3gV8M0RgBbzozxdoCXb+ZEaNFAqTLrDDzDZky5hqxRU
	 ljQwzCzLdULzkR4AGEJ65d1qX/fKlCHLSElklx7axBMdKYuZBYutV0HG5AnohwvgTVyjh
	 tHDAZzx5j9u4vW8EOzFVEahyBKR86GCRIy1zdex3V6boHngVroi3Y4a4Q1uvamJpd7dtU
	 0d+hPEFn4Lf73YbeY52Jh4+hFk3VtzOBwIFeGTw0tvXU7Ut8cWtLZ3j6Jb7fPEq8GG8Yn
	 1m2WBruiQIgGyswf0ega5qNuA+Km94oogmcA2C50OB0Rj04rMavsaM/67y6bzo+A4Ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KTYlUBf0wD5xIYqHc70GJMPslPEvwEHVySo2mabcF+A=;
	b=mfwLp1AcaTsfrR2z5RHS5V+odkVnmqBLt6jgsXVpxPHIj5q/Dq35/eTslZelKJ5TOUs6
	 KrFXqJLaQ5aGUk0vuWZhUPWcJ7cTJGXeMUtDnrLH6Tdo9ChNaFYohaCukQciXvDsZX142
	 3tmrl1Q8xpvv5jK9b0/0qp9yBCOPyFqsFIJ3YnTjwalE5aBCjpTOtfJvgSFBRMNPvctOY
	 cvvFz9Jei7Hr3VC8fCj9pWqPOe/LLqeKI8lwPcTf9v4E6slGGscIEOgtcVBYt0dzlsh7n
	 BmB5rC184koLsgRLujHm3aJ/TWxvqLNmmCoWuC2ocHvJuQ4SeKB9NI9ftaYn/WJ5JjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I1WfL4yt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B491606A326
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 01:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B491606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I1WfL4yt
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-70bf1671c21so2118729eaf.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 17:18:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793668701; cv=none;
        d=google.com; s=arc-20260327;
        b=j7TVIr7ih6ZlQaPl++dzAK0QlKrpbkvg50CISIJsni9teubFOYv8zLWHv+LT3OeQ0S
         qIzzcdiFJ5hDuzd6nM+IgflHGxWLGmvF/ioqcabET27P92h4EbZcQ/9maAAzNQVgytP9
         I+Fk2d3xb3ziviA2FRx0JSCU58wd+EI5G7vZ/eSD0mXnnSHjhI0qxBA681zgpz1uXeeI
         ynSFpYIw1fPuGGuAnFr9zUz/7q/JRmwgsUGkZoCrJdv+NpiLmRKSpFRr6Wg14k089ewS
         I8874L10/qhyAhN1ExgLyAbbbY0l4rznrRgW31+4sqsFVaBqxkbjleILJso+bDZyBAYG
         O6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KTYlUBf0wD5xIYqHc70GJMPslPEvwEHVySo2mabcF+A=;
        fh=/oSTycIXe6x55RJqY6q4cGkcIVunbARBH5vRA/06caM=;
        b=WphPDOfl+I66D1ktQpIaov8ukyvJ4xZKzFadbyo73gq8HNrQnE4JYUFVI9vd6cMD1X
         KYxTvt8cxAatkTMRV4wFR/2hYVh1YDXu424LlMBAbI5DI7vbEwXLvoDOmHCg4lunEcxI
         9y3AtjqsYN582iF4s3AtcMNxN6TYOATtAAjtNF7pPZz3UT4wkmDCtU7A9vQcqaKxxoCi
         4daR0F8YGZvVctmtOdqNHH4h0cVMwB89f+OfnU99UOF0HREjv3SqeplL3bMvSA2OOCO6
         bzWwAPZE+2nbFKEkhDBovCB6T9Kp7lnCJ318waKabIyXZz8FD4NrC5zjcZ9XHW4knagQ
         2eHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793668701; x=1794273501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KTYlUBf0wD5xIYqHc70GJMPslPEvwEHVySo2mabcF+A=;
        b=I1WfL4ytP5PwbzDUaDvhqTkiaecS8GMOSCsuVNPCh06MuqdZ+b7BOGUKAZbfKz1lSU
         wqX8fJ48xHBAONej7ozo6kBZKTLlNrLr8aas5cjA8BudBs5GMxHsnDcRjRDyApYpAEjo
         n+o240w44flUBkfZ+ktLhThtKC1PJxjZ9ySj06qfR+VkBHmQ11X4nbklIS+69YVc2DML
         F+xSOg3IaLSr7VIEkciA9A9XC+/K/cGYLw+rQneE4NkgEBHAmm61spfbMgtCWqR9NJap
         NhSL44sl06D0HZG7cey1m6RmDT7N+aD+hu1jFVMrWq1O3szS5l8jl460/RaWEW2p16dI
         HpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668701; x=1794273501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTYlUBf0wD5xIYqHc70GJMPslPEvwEHVySo2mabcF+A=;
        b=q3E8g3GRf1TuQXgpccK1nV1QOUFXq0BgyaLw0TLrBX1KEaRC0TQMvugNDQLpLsSCLX
         zy+4jTPIi0VY5JGv6P4O4n34NH4uB3bD9lhd5Wis3DS/OT8fVVDEevLeJNbMKcTaUcr5
         cvG3es5kCLjzaITdavN+PyeFsh/47j0J8u29ufED0sRQx8Nys347gjGc3+klIp8UTqfv
         Gs4z8OUFm3ktJ3vlSYcAsO8ReN1lS+J3zJi4+xXC1hugZvDNSXXpp0n/+5hzqBG5JzBi
         Dgtgo5PHyigVWheYbpoWtvWrGsk+kW0DnaPuRMFmNFByCQfFpiJ0IQDuoFRfhEdyEoCK
         8mPw==
X-Forwarded-Encrypted: i=1; AKwUvBwNcVQmeqn1jWbkJRKIN8RO271r+Asmhg8Fkg1rTosvaavW5imJycZOKdue5NmEc9pBdfygl313Bks9/w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJfjSXApKwbdHHBur/LyE2UUoZBhqScQZ82KAhYAWux60A23Dd8
	hmT+vs+eItTZ/v/fUKS86AXf1/5MyXgkfQey/IQqlAXU52+dtrW7Jh5UyE71HdH95Di1zE1bz1c
	rOjUB8VA6djKIFvwPozG5Yjm1a/XZVWU=
X-Gm-Gg: AYBFou13k2ITjTiuNT2fBX6gizWe33OhZNPUVlsbdeo0+z0Um3R2pAAUkLE+vcRqzUj
	2zksC8CfRPhygkqWGzqqo+/AHG7pB8C5+sPFKH3c2FugFeCJbgRetF02panRxWBNcKOrF+6H/N2
	Kc1Nig4Z34AMnidnqiOWXv3aGn2dWag+nLgpaNQKbsQv3c2+B8NXPifLBj/lPVGlP6NQjUrSlNf
	OgmJdHkftTsx9Nly9rcT+Sp6CItwtKwo72wjWeRSr946Y5ktHwlKgcCxJAVqQ7xbq4QtqJo/OrB
	WQLPNplHU/jbHM41ItZsR66ixc+anA5kDlrZdnwLf+VkN1MN/y/NgCRUQaNcmcLnRVAb0LeaOV2
	UWKJgYxNnuFQemN/lBLmfNTfEJhfWF9vNkhCC3rg=
X-Received: by 2002:a05:6820:168e:b0:713:e3f5:251e with SMTP id
 006d021491bc7-714f29ba27emr6218018eaf.48.1793668700964; Mon, 02 Nov 2026
 17:18:20 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029033106.7374-1-ki.chiang65@gmail.com> <7c254ab7-579e-4c17-80fb-596e6fdd29a9@kernel.org>
In-Reply-To: <7c254ab7-579e-4c17-80fb-596e6fdd29a9@kernel.org>
From: Kuangyi Chiang <ki.chiang65@gmail.com>
Date: Tue, 3 Nov 2026 09:18:13 +0800
X-Gm-Features: AclHuK-xERevdyIuOmPpPuK18g64qqPWLytPJ62nx5z0uR0oy9As2XqZ8575ib0
Message-ID: <CAHN5xi1_T=C1v=hDqoHxLtc9uuZO5Evsv2hS2-ZSGd3_mo=qSA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add UVC_QUIRK_CTL_MSG_DELAY_1M for HIK camera
To: Hans de Goede <hansg@kernel.org>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the review.

Hans de Goede <hansg@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8829=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:46=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> On 29-Oct-26 4:31 AM, Kuangyi Chiang wrote:
> > UVC control requests issued when preparing a video stream sometimes
> > time out on the HIK 1080P Camera (2bdf:0280):
> >
> > [   48.363671] uvcvideo: Found UVC 1.00 device HIK 1080P Camera (2bdf:0=
280)
> > [   53.465662] uvcvideo: Failed to set UVC probe control : -110 (exp. 2=
6).
> > [   58.585653] uvcvideo: Failed to query (129) UVC probe control : -110=
 (exp. 26).
> > [   58.592967] uvcvideo: Failed to initialize the device (-5).
> >
> > Adding a 1ms delay after each control message avoids the issue.
> >
> > Introduce UVC_QUIRK_CTL_MSG_DELAY_1M for this device.
> >
> > Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>
>
> Is this a USB-2.0 camera connected to a XHCI controller ?
>
> And if yes, how old is this camera model ?

Yes, it's a USB 2.0 high-speed camera connected to an xHCI
controller.

It's an entry-level 1080p USB webcam from Hikvision that has
been available for several years.

The enumeration log is shown below:

[  421.245199] usb 5-3: new high-speed USB device number 2 using xhci_hcd
[  421.368603] usb 5-3: New USB device found, idVendor=3D2bdf,
idProduct=3D0280, bcdDevice=3D13.00
[  421.372056] usb 5-3: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[  421.372064] usb 5-3: Product: HIK 1080P Camera
[  421.372069] usb 5-3: Manufacturer: 04004000_P040200_SN0002
[  421.372072] usb 5-3: SerialNumber: 04004000_P040200_SN0002

So far, we have reproduced the issue with these xHCI hosts:

ASMedia ASM1142 (1b21:1242)
Etron EJ168 (1b6f:7023)
Etron EJ188 (1b6f:7052)
Intel xHCI (8086:8d31)

>
> The reason why I'm asking this is because the EHCI USB-2.0 controller
> interface causes a natural delay between consecutive ctrl commands queued
> one by one till the start of the next USB frrame, so they get spaced
> 1 ms apart.
>
> Where as the modern XHCI controller interface will put these back-to-back
> on the USB bus. We've seen some issues with (older) USB devices before wh=
ere
> they needed some delay because they were originally only validated with
> EHCI controllers and the hw/ff assumes it will get some "breathing space"
> between control messages.

Thanks for the explanation. That makes sense.

The camera works with the EHCI host we tested without any
additional delay.

We haven't observed this issue during device enumeration.

In our tests, adding a 1 ms delay to both the UAC and UVC
control request paths prevented the timeouts.

When the delay was added to only one driver, we still observed
control transfer timeouts (-110) in the other driver.

We also submitted a similar patch for the USB audio driver,
using the existing QUIRK_FLAG_CTL_MSG_DELAY_1M:

https://lore.kernel.org/linux-sound/20261029032856.7100-1-ki.chiang65@gmail=
.com/T/#u

Regards,
Kuangyi

>
> Regards,
>
> Hans
>
>
>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
> >  drivers/media/usb/uvc/uvc_video.c  | 10 ++++++++--
> >  drivers/media/usb/uvc/uvcvideo.h   |  1 +
> >  3 files changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc=
/uvc_driver.c
> > index e289cc7..c720d75 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -3162,6 +3162,15 @@ static const struct usb_device_id uvc_ids[] =3D =
{
> >         .bInterfaceSubClass   =3D 1,
> >         .bInterfaceProtocol   =3D 0,
> >         .driver_info          =3D UVC_INFO_QUIRK(UVC_QUIRK_FORCE_BPP) }=
,
> > +     /* HIK 1080P Camera */
> > +     { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> > +                             | USB_DEVICE_ID_MATCH_INT_INFO,
> > +       .idVendor             =3D 0x2bdf,
> > +       .idProduct            =3D 0x0280,
> > +       .bInterfaceClass      =3D USB_CLASS_VIDEO,
> > +       .bInterfaceSubClass   =3D 1,
> > +       .bInterfaceProtocol   =3D 0,
> > +       .driver_info          =3D UVC_INFO_QUIRK(UVC_QUIRK_CTL_MSG_DELA=
Y_1M) },
> >       /* Insta360 Link */
> >       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> >                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/=
uvc_video.c
> > index fc3536a..4667f86 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -35,13 +35,19 @@ static int __uvc_query_ctrl(struct uvc_device *dev,=
 u8 query, u8 unit,
> >  {
> >       u8 type =3D USB_TYPE_CLASS | USB_RECIP_INTERFACE;
> >       unsigned int pipe;
> > +     int ret;
> >
> >       pipe =3D (query & 0x80) ? usb_rcvctrlpipe(dev->udev, 0)
> >                             : usb_sndctrlpipe(dev->udev, 0);
> >       type |=3D (query & 0x80) ? USB_DIR_IN : USB_DIR_OUT;
> >
> > -     return usb_control_msg(dev->udev, pipe, query, type, cs << 8,
> > -                     unit << 8 | intfnum, data, size, timeout);
> > +     ret =3D usb_control_msg(dev->udev, pipe, query, type, cs << 8,
> > +                           unit << 8 | intfnum, data, size, timeout);
> > +
> > +     if (dev->quirks & UVC_QUIRK_CTL_MSG_DELAY_1M)
> > +             usleep_range(1000, 2000);
> > +
> > +     return ret;
> >  }
> >
> >  static const char *uvc_query_name(u8 query)
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/u=
vcvideo.h
> > index b6bcee4..1426d14 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -81,6 +81,7 @@
> >  #define UVC_QUIRK_INVALID_DEVICE_SOF 0x00010000
> >  #define UVC_QUIRK_MJPEG_NO_EOF               0x00020000
> >  #define UVC_QUIRK_MSXU_META          0x00040000
> > +#define UVC_QUIRK_CTL_MSG_DELAY_1M   0x00080000
> >
> >  /* Format flags */
> >  #define UVC_FMT_FLAG_COMPRESSED              0x00000001
>
