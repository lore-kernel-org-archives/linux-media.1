Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D1F3630BA
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779687; cv=none; b=lyg0xIu31XPKsAxOudAati0/fmtKMYApVGkPxyv8ZxfRcHDemvEaz6chGrvjHagyO3hekCE7wmWHf0o2iS9oLfXK0Qu4Kg0ghjS1GaD9ilJa6G75bmz+Ec9soWKqWd/JXxBsHqpaDoGuHvc4zRnEFoziqNkvq9ForG+T43WSxQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779687; c=relaxed/simple;
	bh=U4ijrxCpTbIp1PxRaDG9U9riYMKCgu+sPj7RE/x/+ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3zs1CDUN9v3dkLCExtsKLjaqR8T0wD8iF464M/D7C/fiEOAmGp7HaHM55r0EhQsnTReCJ6crezVOHW3fDiG9L8E1umhuvgC2QMVDOELqbJR4yZIay8Nlzv8s0mAcyztWTbORA+yTZovyIY3MCIfm5rimJpbEeq/PRanVYDwGww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z4UAfhYT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z4UAfhYT"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cace91f112so28033815ad.0
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 04:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788779685; x=1789384485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cRlEG5pcDk7pkZCUFG/gh9csbwISOYhnxGShmv3bMPM=;
        b=Z4UAfhYT8+LTKiB/SqbLkzy+232+XaGaqjy3jfjsaDtMUiU64xS/5QLUZ+jslVevGf
         ePRkV5CHnFXTIUxZLWuvUtakwR3c+t9j5N29lRjGRTvT522BKfXMHg7lfHEGgoIMOUOD
         Yu9Zw/KQeEmjgJOImKN1QRXzELJGOFII7EapA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779685; x=1789384485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRlEG5pcDk7pkZCUFG/gh9csbwISOYhnxGShmv3bMPM=;
        b=YxFcw/nkZUFp4iaE5g1yPxGFJbkcKyd4RYNzFPCnOUlDVwNDPfmbsMdavv6D0eY3BX
         9UeiOV1N3XPk3dnaTXO7zH/3MSYitqw63lxO45/XpvStaRGCvkF0jUeJUYsdt3Y1TV++
         Rpak+L7lZ9NQfn+s/bZMcvEOxomZ2bkihz0HAzOEcfwZ9qnN8yam2Y54NAJUaJkgr1AN
         U6fMfatjemDiETt52A+a+vGfVD+n9fSvDmgyOL1eittvlXFd44hbhEl/Oa7+IldXkTUv
         oB4cQZeK1yZ90ta2fpDbtmVGRnRFRQMOfsDBJJBiJv775bhHcJoJspbwFwoTU1BajS1F
         //oA==
X-Gm-Message-State: AFuF++ncGzRhy1vPoln4OGQZkJTKDnnoX2nwEMjnw1EBMQynlLw3DnKx
	A/zR6+wLHajp38Z3S4OsSQ5st75kF5t44L/19uqJNt9AmBYhw9xjEArXc1oKV4SM3xoAI9Z+IEG
	YVhs=
X-Gm-Gg: AYBFou0kUhI62hZk2W5y0NUpNJSc7fcZQZROvPpuizy5dzarYbOuQy2XJE+xou7lXh3
	s5vmxiWhwC/fG3ZuqjAawK5UPBNAwdcanAREcPOvvDL0TgYXYSWruZPoROpunGZJmbe7fnJqzNZ
	8E9o4MCY4veG7/ZqSxcZ13DvP+Pp0scbhrvcKKRNYJ62AxdduD5NEcQpy1s/Z3VKqfSiu4Fwe+P
	t1+4JjaVtbVjr+FnTtP1w8WPJs4HFyJHiSl4v70HH5TwsqMXjQPU71wT3XsLPVb8EfN3+q+GCiI
	+XzpazRnW62mC79EhukqmxMKi+cPhFGQebXfW1/7QUHWJlYoxVwTN8HUawTKUmaEJSGpsylFrBA
	KJao5AkDxN/W1pJNmI5Qz/xIuK1Nf2tF4UakIExYgmyoYRdmq+wRYVoK8WZBCWChxIGVc1FLFHI
	DiuR9RJK0FmTRoDB04uvRcp6xsJWYPkzMGQWkqLqEzIwR7NmMJ9f7mhSEeLyCaA2vf+YUSXU5LT
	ncx0xuHcy7Er0hQRw1FCSCfZF4CO0JqpxijLZ6y
X-Received: by 2002:a17:90b:1dc3:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39b26207ee4mr34607374a91.17.1788779685393;
        Mon, 07 Sep 2026 04:14:45 -0700 (PDT)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com. [209.85.210.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm26513239a91.13.2026.09.07.04.14.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:14:45 -0700 (PDT)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8541875f596so1211756b3a.0
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 04:14:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:734c:b0:3bf:a543:e7f5 with SMTP id
 adf61e73a8af0-3da39eacfd3mr31314189637.3.1788779683916; Mon, 07 Sep 2026
 04:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <NyIyntNSKnGNUZ9e_D85jiYUrnTPBu_Ux5olvRdPsK8lpjI8wYk-xb6sGrx9eK9iapaHROjWS3G2oeH5rkJyAiyjjYocn4CoYdvUoq92Pss=@protonmail.com>
 <CANiDSCu2=p_o8qNZeEOQB_um0YH_+3jefB=4xsC6k6Z349xtaQ@mail.gmail.com> <28dJLjsoYQxYnUJloPFduvPFDUb6r-YQrLRK0aT_UZ1GJAMGt9892Ltc6-1Uppe3UiQILaOwlEqsj5W6IUKFUvYDs8osrNPH1Z9MnvE0ed0=@protonmail.com>
In-Reply-To: <28dJLjsoYQxYnUJloPFduvPFDUb6r-YQrLRK0aT_UZ1GJAMGt9892Ltc6-1Uppe3UiQILaOwlEqsj5W6IUKFUvYDs8osrNPH1Z9MnvE0ed0=@protonmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 7 Sep 2026 13:14:28 +0200
X-Gmail-Original-Message-ID: <CANiDSCsQL_AWPz+spNwFkD=iSuDp5YKuk_0KROvmLNx0rG4tfQ@mail.gmail.com>
X-Gm-Features: AcwNN1V9t8lqP1hf1oqrwKIpNCkC4Xu3yy2ZxD5aXckjoh9lDk-eL7nwfOceaa8
Message-ID: <CANiDSCsQL_AWPz+spNwFkD=iSuDp5YKuk_0KROvmLNx0rG4tfQ@mail.gmail.com>
Subject: Re: Re : Re: Avermedia GC515 implementation
To: Edwin Gatier <edwin.gatier@protonmail.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Edwin

Thanks a lot for the logs.
This is a new one:
Failed to query (GET_CUR) UVC probe control : -75 (exp. 26).

(we had before  Failed to query (GET_CUR) UVC probe control : 34 (exp. 48).=
)

Progress??? who knows :P

It would help to have a usb trace...  Have you used usbmon before?

If you get a trace, add also the dmesg output. You can use something like t=
his

# disconnect the camera
dmesg -c > /dev/null
rmmod uvcvideo
modprobe uvcvideo trace=3D0xffffffff
modprobe usbmon
# Start wireshark and start capturing on the correct port
# connect the camera and give it a couple of secs
# Stop capturing
dmesg > dmesg.log

Hopefully the logs will give us something to work with... But bear in
mind that we are only looking at it from "uvc" perspective. The
high-speed vs super-speed problem will not be solved.

Regards!
--=20
Ricardo Ribalda

On Sun, 6 Sept 2026 at 18:23, Edwin Gatier <edwin.gatier@protonmail.com> wr=
ote:
>
> Hello,
>
> Sorry for the delay, I had other matter to attend to and also it's my fir=
st time making drivers so i had some issues making it work.
> Thank you for the quick response.
> I added the quirk but it still does not work, the quirk is taken into acc=
ount (forcing v 1.0a) but the probe still returns a mismatch length error.
> A "very usefull" comment on a reddit thread I openned indicates that the =
card is suppose to behave like a usb hub with a uvc device as one of the de=
vice of the hub, but the list of usb devices connected to the pc does only =
show one device and dmesg shows it is recognised (falsly) as a 1.5 uvc devi=
ce.
>
> How do you recon we/I could go on from this point on ?
>
> Regards
>
> Edwin
>
>
> Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
>
> Le mardi 1 septembre 2026 =C3=A0 08:45, Ricardo Ribalda <ribalda@chromium=
.org> a =C3=A9crit :
>
> > Hi Edwin
> >
> > Looks like your camera is not following the spec. It says that it is
> > uvc 1.5 but behaves like 1.1
> >
> >
> > Could you try if this patch fixes it for you?
> >
> > Regards!
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c
> > b/drivers/media/usb/uvc/uvc_driver.c
> > index e289cc71ba98..615cebb67508 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2851,6 +2851,17 @@ static const struct usb_device_id uvc_ids[] =3D =
{
> >           .bInterfaceSubClass   =3D 1,
> >           .bInterfaceProtocol   =3D 0,
> >           .driver_info          =3D (kernel_ulong_t)&uvc_quirk_fix_band=
width },
> > +       /* Avermedia GC515 */
> > +       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > +         .idVendor             =3D 0x07ca,
> > +         .idProduct            =3D 0x1515,
> > +         .bInterfaceClass      =3D USB_CLASS_VIDEO,
> > +         .bInterfaceSubClass   =3D 1,
> > +         .bInterfaceProtocol   =3D UVC_PC_PROTOCOL_15,
> > +         .driver_info          =3D (kernel_ulong_t)&(const struct
> > uvc_device_info){
> > +               .uvc_version =3D 0x010a,
> > +         } },
> >         /* ViMicro Vega */
> >         { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> >
> > On Tue, 1 Sept 2026 at 02:45, Edwin Gatier <edwin.gatier@protonmail.com=
> wrote:
> > >
> > > Hello,
> > >
> > > I'm trying to use the usb capture card x'tra go from avermedia but th=
e uvc implementation is not very good from the vendor. The card falls back =
at usb 2 speed (high speed detected) while it works fine on windows with us=
b3 speed (super speed) which it as been designed for. Video stream should b=
e 1080p120 and h265 compressed by the card.
> > >
> > > Plugging the card does nothing, the card is not recognized at all as =
seen in the dmesg log, and subsequently is not mounted in /dev/videoX.
> > > I tried some quirks but didn't manage to pass the probe.
> > >
> > > You of course can contact me for more information.
> > >
> > > I'm on linux 7.2.2-1-cachyos with Wayland and have a dualboot with wi=
ndows 11 on separate drive to update and test the capture card.
> > >
> > > Best Regards
> > >
> > > Edwin GATIER
> > >
> > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
> >
> >
> >
> > --
> > Ricardo Ribalda
> >



--=20
Ricardo Ribalda
