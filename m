Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEF8400995
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 20:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788811488; cv=none; b=VCtFWsLARtYVGuCaI7QAtigpll23e5hm9EbJS3YAiCHszefQTHQkAeFpnC7goEOtTQdTcK4aGtlcYWwGq4LlRvCpkIp/amVurGvLdfB/oMtvFqo8MHkip+XHezYoAbsKVQgbmkPSZMZztbSdGvNdfXAwsSfFC+dwCRSNai/0mNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788811488; c=relaxed/simple;
	bh=Iat8F/qcc+3IsrStuAHjFA3vuz2bWLDktvYqeIom4iY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mgow7rNctmMEe0ocvTwEGY7pkCQ3ouKxuLoAPPej9sqFaN1MvnFyKdwWGJtjyzyoqX0did8+xY072I3Ystpgw53SQY3wmmiLHSAbY/HdP4upDRPUSrZXbltEMxGu2eQcb3KYFXqxq5U9xNLioq4ihR1FFEFuSjeDKYTHbs/rA5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XgmIaXhx; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XgmIaXhx"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3964e480f76so4495424a91.1
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 13:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788811486; x=1789416286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rduexaoiO5XHpMkpvmQap1VciOVOlr+3NBW0vbLvRsQ=;
        b=XgmIaXhxUTKdOKNerple4X7ITIAs5i3B0kxVXuqArake0Z+L3+uHjLPLGJSDr5JQST
         +ZwE6mJrlrVwYl7kYwgvPXVtbGS9BUOhOFu4g4JChpmVjXOaN8I1WVwOKH7rE+ESvJO6
         PYx9zp46/9jPXjHQr+/nj0Gd26yz6JnCeD3pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788811486; x=1789416286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rduexaoiO5XHpMkpvmQap1VciOVOlr+3NBW0vbLvRsQ=;
        b=R9dfWrjKn4tLpfokxd0eTOKw5lKF3vP393e/om9AGGHS0u4QP5iBwFEXa57Q/HONIi
         TNDraZ+rXoQroDDO/KVavVxGf9zA60Wyl+BVZCdn6l+hdusdA8jg+rbfuqZ5gBljkMxh
         AjwT1S57C35gBOgsoD5tbGCJ/Bn3ZzRT+VnI21ka/qiB94E5RW0xYHN/obcpZT+EmJ/W
         d4EYuvMrBhRRI+QcTkvRxGo22idRc0PDuNQMtbth8Nzc4wMv0I0dyYfwCts3Z2jRcRPR
         wYdjtha/WVSEGACeXSOt9YsGiLQP5QFelgpqMx2F1+iN9IarsNnN19hUunzqOf123l+2
         su4Q==
X-Gm-Message-State: AFuF++lcDLl2bUlMrTiSRyqbLkSRGumuO7P+WWk8I1fovrVU09O8EBRE
	shdEDz67EzVJwguhgF1qDQ6y+Hmy1hQ4iNAvTceqPrSZQxfhzpGy6bsddWlQ1FLaWRhzENBxGgH
	E61w=
X-Gm-Gg: AYBFou3+7aUASQGNLgO02A/yYZFdpgMEtJxWgqfn/GwmuCcVYGZBDNTSQ3GVv6tWy81
	ACv8qH77iYkbvw9JcZXRBB0O6NU7hW4Uv4P96V6utgolMCXuVxeuSm3rDh8zOt4QgN9sFfOIN7O
	GmcRuART0vzaLoij1MNRu0W9xIh4oZuMK70IsqNwgBerI33OA6U7xlxlQ31YFgYJtsAwqsjDQUz
	2fdYf7YGaRtNdnkV6k4F0o+YC3Rl/z4xLx90lK6S/6X/vE2g354kaZrU+LBA4FazwWZw+j0JkgS
	wowHyexoIBAMijyhzk0Mc9Lgz8uoeZXFoajn22NmGdYyVJTwJgSzgNAYqDd5UK3NuT/DqueXG9y
	6rzaYzP9L2dRREzb+WNlnM4iTFTyumCIxlqphRsBe+5/Pm61gGpCuakkYjDPUsdg74XbnZnJ65U
	E6oTBPlnanLM4SKcXvL7Txt8mskE4/U+bHCudstbYrAdvGPYAwpH23MDtwXkGOY5LH4Jv0ulFKM
	QmvKSBVyFvGL82QcfSDrhfKzZvPPA==
X-Received: by 2002:a17:90b:274e:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-39b2610fe62mr37574716a91.9.1788811486427;
        Mon, 07 Sep 2026 13:04:46 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com. [209.85.214.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc090sm28271849a91.4.2026.09.07.13.04.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 13:04:46 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d9520b9155so32260365ad.3
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 13:04:45 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcd:b0:396:4cbf:45a2 with SMTP id
 98e67ed59e1d1-39b84cce5a8mr5600273a91.14.1788811485062; Mon, 07 Sep 2026
 13:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <NyIyntNSKnGNUZ9e_D85jiYUrnTPBu_Ux5olvRdPsK8lpjI8wYk-xb6sGrx9eK9iapaHROjWS3G2oeH5rkJyAiyjjYocn4CoYdvUoq92Pss=@protonmail.com>
 <CANiDSCu2=p_o8qNZeEOQB_um0YH_+3jefB=4xsC6k6Z349xtaQ@mail.gmail.com>
 <28dJLjsoYQxYnUJloPFduvPFDUb6r-YQrLRK0aT_UZ1GJAMGt9892Ltc6-1Uppe3UiQILaOwlEqsj5W6IUKFUvYDs8osrNPH1Z9MnvE0ed0=@protonmail.com>
 <CANiDSCsQL_AWPz+spNwFkD=iSuDp5YKuk_0KROvmLNx0rG4tfQ@mail.gmail.com> <t3hEIJz-K9HvqsANa0jwTFis2jKV-LIIUZ3-7AUs-sQnAgSsLZhu2013EUO_AOWgospC7Lvphv7D1iyhJb9vFMxnbtUjaKwTljvmHjUiU8A=@protonmail.com>
In-Reply-To: <t3hEIJz-K9HvqsANa0jwTFis2jKV-LIIUZ3-7AUs-sQnAgSsLZhu2013EUO_AOWgospC7Lvphv7D1iyhJb9vFMxnbtUjaKwTljvmHjUiU8A=@protonmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 7 Sep 2026 22:04:31 +0200
X-Gmail-Original-Message-ID: <CANiDSCu4AW=JZ9FS+Ny=DK_+LqqytGvSe+V6aVncRiGRiyDMfA@mail.gmail.com>
X-Gm-Features: AcwNN1XmtBJiovRujG37sUNPw5Hu3hLxEj08g19abowEccjfD2DKlW_33tcEShE
Message-ID: <CANiDSCu4AW=JZ9FS+Ny=DK_+LqqytGvSe+V6aVncRiGRiyDMfA@mail.gmail.com>
Subject: Re: Avermedia GC515 implementation
To: Edwin Gatier <edwin.gatier@protonmail.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Edwin

On Mon, 7 Sept 2026 at 21:39, Edwin Gatier <edwin.gatier@protonmail.com> wr=
ote:
>
> Indeed the mod was not loaded sorry about that, I thought the raw/out of =
the box result would be the starting point for the log.
>
> Here are the logs with the mod loaded in.

Could you try modifying the original patch?

Where it says:

 .uvc_version =3D 0x010a,

it should say

 .uvc_version =3D 0x0110,


Thanks!
>
>
>
> Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
>
> Le lundi 7 septembre 2026 =C3=A0 13:14, Ricardo Ribalda <ribalda@chromium=
.org> a =C3=A9crit :
>
> > Hi Edwin
> >
> > Thanks a lot for the logs.
> > This is a new one:
> > Failed to query (GET_CUR) UVC probe control : -75 (exp. 26).
> >
> > (we had before  Failed to query (GET_CUR) UVC probe control : 34 (exp. =
48).)
> >
> > Progress??? who knows :P
> >
> > It would help to have a usb trace...  Have you used usbmon before?
> >
> > If you get a trace, add also the dmesg output. You can use something li=
ke this
> >
> > # disconnect the camera
> > dmesg -c > /dev/null
> > rmmod uvcvideo
> > modprobe uvcvideo trace=3D0xffffffff
> > modprobe usbmon
> > # Start wireshark and start capturing on the correct port
> > # connect the camera and give it a couple of secs
> > # Stop capturing
> > dmesg > dmesg.log
> >
> > Hopefully the logs will give us something to work with... But bear in
> > mind that we are only looking at it from "uvc" perspective. The
> > high-speed vs super-speed problem will not be solved.
> >
> > Regards!
> > --
> > Ricardo Ribalda
> >
> > On Sun, 6 Sept 2026 at 18:23, Edwin Gatier <edwin.gatier@protonmail.com=
> wrote:
> > >
> > > Hello,
> > >
> > > Sorry for the delay, I had other matter to attend to and also it's my=
 first time making drivers so i had some issues making it work.
> > > Thank you for the quick response.
> > > I added the quirk but it still does not work, the quirk is taken into=
 account (forcing v 1.0a) but the probe still returns a mismatch length err=
or.
> > > A "very usefull" comment on a reddit thread I openned indicates that =
the card is suppose to behave like a usb hub with a uvc device as one of th=
e device of the hub, but the list of usb devices connected to the pc does o=
nly show one device and dmesg shows it is recognised (falsly) as a 1.5 uvc =
device.
> > >
> > > How do you recon we/I could go on from this point on ?
> > >
> > > Regards
> > >
> > > Edwin
> > >
> > >
> > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
> > >
> > > Le mardi 1 septembre 2026 =C3=A0 08:45, Ricardo Ribalda <ribalda@chro=
mium.org> a =C3=A9crit :
> > >
> > > > Hi Edwin
> > > >
> > > > Looks like your camera is not following the spec. It says that it i=
s
> > > > uvc 1.5 but behaves like 1.1
> > > >
> > > >
> > > > Could you try if this patch fixes it for you?
> > > >
> > > > Regards!
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c
> > > > b/drivers/media/usb/uvc/uvc_driver.c
> > > > index e289cc71ba98..615cebb67508 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -2851,6 +2851,17 @@ static const struct usb_device_id uvc_ids[] =
=3D {
> > > >           .bInterfaceSubClass   =3D 1,
> > > >           .bInterfaceProtocol   =3D 0,
> > > >           .driver_info          =3D (kernel_ulong_t)&uvc_quirk_fix_=
bandwidth },
> > > > +       /* Avermedia GC515 */
> > > > +       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> > > > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > > > +         .idVendor             =3D 0x07ca,
> > > > +         .idProduct            =3D 0x1515,
> > > > +         .bInterfaceClass      =3D USB_CLASS_VIDEO,
> > > > +         .bInterfaceSubClass   =3D 1,
> > > > +         .bInterfaceProtocol   =3D UVC_PC_PROTOCOL_15,
> > > > +         .driver_info          =3D (kernel_ulong_t)&(const struct
> > > > uvc_device_info){
> > > > +               .uvc_version =3D 0x010a,
> > > > +         } },
> > > >         /* ViMicro Vega */
> > > >         { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> > > >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> > > >
> > > > On Tue, 1 Sept 2026 at 02:45, Edwin Gatier <edwin.gatier@protonmail=
.com> wrote:
> > > > >
> > > > > Hello,
> > > > >
> > > > > I'm trying to use the usb capture card x'tra go from avermedia bu=
t the uvc implementation is not very good from the vendor. The card falls b=
ack at usb 2 speed (high speed detected) while it works fine on windows wit=
h usb3 speed (super speed) which it as been designed for. Video stream shou=
ld be 1080p120 and h265 compressed by the card.
> > > > >
> > > > > Plugging the card does nothing, the card is not recognized at all=
 as seen in the dmesg log, and subsequently is not mounted in /dev/videoX.
> > > > > I tried some quirks but didn't manage to pass the probe.
> > > > >
> > > > > You of course can contact me for more information.
> > > > >
> > > > > I'm on linux 7.2.2-1-cachyos with Wayland and have a dualboot wit=
h windows 11 on separate drive to update and test the capture card.
> > > > >
> > > > > Best Regards
> > > > >
> > > > > Edwin GATIER
> > > > >
> > > > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
> > > >
> > > >
> > > >
> > > > --
> > > > Ricardo Ribalda
> > > >
> >
> >
> >
> > --
> > Ricardo Ribalda
> >



--=20
Ricardo Ribalda
