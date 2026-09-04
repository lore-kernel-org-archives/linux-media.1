Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9523A544D
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 08:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511239; cv=none; b=b2W345IjR1Qxy0XFUW5ELT/BTdatb2CwYRrFOzsjO48nsR9j0YTTq6QqVTzuOM4tAJJyI4C1cYY4LCjLysDvLciqXpqKyoM2XzB5wnYdWaEcfxFZk1xGAGrgkfZxVREspozLWb9R3u5pMbkszcUSPhA0jbOBQFYEFngcqo8fKD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511239; c=relaxed/simple;
	bh=KhU6jGTmTkTaau40wVsjNcR8J0pvK67N20EoMPqwV9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r81bJlsqOHO8N+n7TM8lJU6HYjHMPosa3Q3lzBeXV1NcI+J2cxApvM/mRG+enOb5yhi69eupEk3jkXJUwymoEwBcuf+MLhlDneIEkWCvp/aIJ5Uxwb4SOvYobL3CPUQV8CIY85FePaOCH/Zau+Zvkwjg/r/x/0LYsswKBBP6DX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=StLmREyV; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="StLmREyV"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so884331a91.0
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 01:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511238; x=1789116038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WWxKvLFem3x1UnUj6lzBslbqm6k7zfr8RzsgQ0D0syQ=;
        b=StLmREyVpJPM+R27gmPiynAPpviw7Tec+hwp9YMpLHN6vj9GVfRU0+X8RO1kiFZfWC
         SMANtGMRBcO1tMOc4QfcgMmDpZIxxsQQVPsvfX5hvWCuF2nEJWF3LuzWeZdniHOzjDCh
         UGAnQEnk33vOuGjYrzAeAxia7VzeGQoEsmoOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511238; x=1789116038;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWxKvLFem3x1UnUj6lzBslbqm6k7zfr8RzsgQ0D0syQ=;
        b=QIQP05TNkBJRBvXLqZuIYsf71m3tO2tBgXQDhsO5jKydlgKKynG+8OQIj0X0Zvxn82
         Ez4KbB6VAspQqItlL0nPr624FSdt9bffKkXKVCL7mx44Hoq5NMNyNndS3kNopecKmX+u
         OCSIOrf91qWWrR9BujR+tvZHPOrLOB2MKXZvl9u1vtO/TiLfbXi9MobXB7mBo+BfoVlD
         lFmdOXto22tkSqzVflJiMQ5X9afvKeIOvkOQjgzCjeKejiRZeQdaWh3GVw8HcRqQkDqe
         AT6PfcVP/WZqsUlSqM4uXNUWeMhKqv3YdvhX47SIiJPFWr4umopSQ+ZvQLpw4VEkvHBc
         HMBg==
X-Forwarded-Encrypted: i=1; AKwUvBxcqiCJZ4ABg1Y9tpfXu0EqLmdkFPF0raKSxPy0iVaiLalfQH3OCFqn85ucRbKOxX3ixnNftLoFHJKAsg==@vger.kernel.org
X-Gm-Message-State: AFuF++kMqdm1TNBAOxkv+KMP8Oll11king8KQ0CfjjduwaxAp9o2QA9j
	mGges919WfNtMjhQGT0ky1Zutl1URgYOMzYudYC5RGG4gQwFPDx9B9OeeKrDfkk1ehCL08JEt15
	e+0QI+Q==
X-Gm-Gg: AYBFou1UXNkOVcaPWmc2Z0CUobllT4WhSQ4sEIMPP1WLNyCAi9GanSr/zmqY9xzknJq
	gEXFbtCuelRUO+qGd2sPH6g8Hh7U9EcSdEwQc3khvDVNBBUcfi0vMslMMDva6rMRksAnSjRRNQS
	NU4ip0cQdMa4NkPPOg6SpnGTnCuXmjAXqX2PekG9f8e3oOozEEf35W7x0bkSAHcQp/1t+Nr1oZe
	KXodwGCG+D5rjd9mFxNemT03EFWM+YJG9LxUF0WNghxZ/BWnHMxE1XqtJcaQ9PLwnWb51wY3F/J
	8L6DiW6kdgHtJiRUXUrGv4QPTDxugR26zV2PDWPAq4M18IBT8N2vpgngbc8Gc5euSj+sXMy6FpS
	q/FyN1ZwwI/OZ2XjkdnG8tX23grhGnQ0aBv7Bbp3annxDWu++wYcQXQ0789QJJBrENg4Uuf+5u/
	5nETVy0vakeeNht7RBaKiy+MWNjcD92rpKDLnfREBd2XKeiPWCoLzGHIGCb+m+WC5s4P85L1BVc
	1RQc+uE9QLUy3l+9NUtLz89f+2p/w==
X-Received: by 2002:a17:90b:57cd:b0:398:c150:e7b3 with SMTP id 98e67ed59e1d1-39b2609f356mr7587521a91.4.1788511237025;
        Fri, 04 Sep 2026 01:40:37 -0700 (PDT)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com. [209.85.215.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497d455sm6870755ad.30.2026.09.04.01.40.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:40:36 -0700 (PDT)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so884720a12.2
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 01:40:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzJG0zoy9IM/M2uESp2cb+iFAYwqjVboH7YygJk9EPtk5PW1elfbrhWV4fmUMgc6Ikbo6vQMgcy1Plv8A==@vger.kernel.org
X-Received: by 2002:a17:90a:d004:b0:398:c9be:cca8 with SMTP id
 98e67ed59e1d1-39b2609f363mr7895398a91.2.1788511235561; Fri, 04 Sep 2026
 01:40:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903081145.8382-1-rh_king@163.com> <CANiDSCse5+Ke-Z2321F_QHJZX2suCKxnBy5WuNHE3m1wjoxX-Q@mail.gmail.com>
 <42a544a1.3e7.1a06b912fdb.Coremail.rh_king@163.com>
In-Reply-To: <42a544a1.3e7.1a06b912fdb.Coremail.rh_king@163.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 4 Sep 2026 10:40:22 +0200
X-Gmail-Original-Message-ID: <CANiDSCsO4SFhKz6OvTZCrojyA8QUYg5+9aMigOkum_nRX-N3oA@mail.gmail.com>
X-Gm-Features: AcwNN1Wy19_xCMbKNIDkMQ7Mkm8-Ojvi8LGf_3lPq1ekEd1Uwv-OTFJuBfSHlK8
Message-ID: <CANiDSCsO4SFhKz6OvTZCrojyA8QUYg5+9aMigOkum_nRX-N3oA@mail.gmail.com>
Subject: Re: Re: [PATCH] media: uvcvideo: Add quirk for Luxvisions RGB Camera (30c9:0122)
To: =?UTF-8?B?5Lu75rW3?= <rh_king@163.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi.

I think something went wrong when you pasted the text and also when you run=
 it.

checkout: https://lore.kernel.org/linux-media/CANiDSCse5+Ke-Z2321F_QHJZX2su=
CKxnBy5WuNHE3m1wjoxX-Q@mail.gmail.com/T/#t

You seem to have run `lsusb`, not `lsusb -v -d 30c9:0122`

Can you try again?

Thanks!

On Fri, 4 Sept 2026 at 10:38, =E4=BB=BB=E6=B5=B7 <rh_king@163.com> wrote:
>
> Hi&nbsp;Ricardo=EF=BC=8C
> Thanks&nbsp;for&nbsp;your&nbsp;review.&nbsp;This&nbsp;is&nbsp;the&nbsp;or=
iginal&nbsp;output&nbsp;of&nbsp;'lsusb'
> testing@fedora:~$&nbsp;lsusb
> Bus&nbsp;001&nbsp;Device&nbsp;001:&nbsp;ID&nbsp;1d6b:0002&nbsp;Linux&nbsp=
;Foundation&nbsp;2.0&nbsp;root&nbsp;hub
> Bus&nbsp;002&nbsp;Device&nbsp;001:&nbsp;ID&nbsp;1d6b:0003&nbsp;Linux&nbsp=
;Foundation&nbsp;3.0&nbsp;root&nbsp;hub
> Bus&nbsp;003&nbsp;Device&nbsp;001:&nbsp;ID&nbsp;1d6b:0002&nbsp;Linux&nbsp=
;Foundation&nbsp;2.0&nbsp;root&nbsp;hub
> Bus&nbsp;003&nbsp;Device&nbsp;002:&nbsp;ID&nbsp;30c9:0122&nbsp;Luxvisions=
&nbsp;Innotech&nbsp;Limited&nbsp;Integrated&nbsp;RGB&nbsp;Camera
> Bus&nbsp;003&nbsp;Device&nbsp;011:&nbsp;ID&nbsp;06cb:00f9&nbsp;Synaptics,=
&nbsp;Inc.&nbsp;
> Bus&nbsp;003&nbsp;Device&nbsp;012:&nbsp;ID&nbsp;17ef:62af&nbsp;Lenovo&nbs=
p;ThinkPad&nbsp;X13&nbsp;Detachable&nbsp;Gen&nbsp;1
> Bus&nbsp;004&nbsp;Device&nbsp;001:&nbsp;ID&nbsp;1d6b:0003&nbsp;Linux&nbsp=
;Foundation&nbsp;3.0&nbsp;root&nbsp;hub
> =E5=9C=A8 2026-09-03 16:59:59=EF=BC=8C"Ricardo Ribalda" <ribalda@chromium=
.org> =E5=86=99=E9=81=93=EF=BC=9A
> Hi Kean
>
> Could you provide the whole output of lsusb -v 30c9:0122
>
> Thanks!
>
> On Thu, 3 Sept 2026 at 10:58, Kean Ren <rh_king@163.com> wrote:
> >
> > The device binds cleanly but delivers no image data; USB autosuspend is
> > suspending the streaming endpoint. Disable autosuspend for it.
> >
> > Issue found on Lenovo ThinkPad X13 (codename Zelda, Intel); confirmed
> > working with this quirk.
> >
> > Tested-by: Kean Ren <rh_king@163.com>
> > Signed-off-by: Kean Ren <rh_king@163.com>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc=
/uvc_driver.c
> > index e289cc71ba98..32bf353013a1 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -3216,6 +3216,15 @@ static const struct usb_device_id uvc_ids[] =3D =
{
> >           .bInterfaceSubClass   =3D 1,
> >           .bInterfaceProtocol   =3D 0,
> >           .driver_info          =3D UVC_INFO_META(V4L2_META_FMT_D4XX) }=
,
> > +       /* Luxvisions Innotech Integrated RGB Camera (Lenovo laptops) *=
/
> > +       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > +         .idVendor             =3D 0x30c9,
> > +         .idProduct            =3D 0x0122,
> > +         .bInterfaceClass      =3D USB_CLASS_VIDEO,
> > +         .bInterfaceSubClass   =3D 1,
> > +         .bInterfaceProtocol   =3D 0,
> > +         .driver_info          =3D UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AU=
TOSUSPEND) },
> >         /* Intel Realsense D435i depth camera */
> >         { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> > --
> > 2.40.0
> >
> >
>
>
> --
> Ricardo Ribalda



--=20
Ricardo Ribalda
