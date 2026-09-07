Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462D335DA47
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 18:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788806168; cv=none; b=T58qLwrfzvSyRwLVr8Eejzl16Suf9LmAMA8b4y+56by+KCkJk2Efsd5bf4condxczKFCRR3+cw452MS/4EO7UORdhJ225JEJUCWVmj79xjd4QYKdnMgy8hc6F4OOeU1gtSFI8fmaqCftROHAEzZGVP/Bl1F5tJcHRcgrhoCA8wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788806168; c=relaxed/simple;
	bh=+fbOcqBMU1tr+fEDBDY4Bw/6wH0TBlH5lTA9zGwJ+Ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1enj/maQPqOIMahLhyoUCda70RZdOTLLnutVzeZFXvxZrYlDO+pT7BhpUNtcFFm2K42PxJ3Y5kMXCOyWvW4UwIlUkfJB4iGjfl5//h07HsTpb197oTuflxg7WhQoDTX9j9W6kx+d6x4XXFz2W/bQ6xWLTK/5+bNzRnYynHtAyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EUqZ3oyt; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EUqZ3oyt"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-382ef647e20so3807179a91.1
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 11:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788806165; x=1789410965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gpyDrro9I02UGlwEdETP97qHnDQOWP7PTa4MSWZDpzo=;
        b=EUqZ3oytUot5js31bK6DhB/xuAstaSMKayWutR6zz37F+AFknC79OVjIoRavLJnIvh
         SYrpVA1lWaySXW/QhJWeDGxcuRIdxCtwNPzKpVdGA/0r/7CWx1oyQwtqni2g5qo/87d4
         lfPjrIpF5OTKa2oxdFkL6SLWw689U2/i9QN5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788806165; x=1789410965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gpyDrro9I02UGlwEdETP97qHnDQOWP7PTa4MSWZDpzo=;
        b=Nzbzy81deRiVIzJP1uRxcyMuyPfnBd7OrvH4++457Y/+9PxbHMtiarGF2gBB5cJcWB
         rA5m27+vUWLViDWE42BU8ZSdt3iHEHefKQpXbTxpEp5axC/+h1LshH+9lPZ+QpFsSdOm
         NdSeCY33auLKRqE87nJlR63Hk8uYiIwiRCXka7naKZ+VIG4zCrjr3IZgW4tuWIC46J53
         pyye4kHHLthOfLy90rzdTfGUR4YvH5ohPnOYNyy+PhRjkq8xBBPA4vULM6mDzQW8iubm
         QonK2Rp+kOvI9NiGjM38jjhjYVzOKnf1+30VpJl8xMCF8J3gblKtQZufAWAwtke5JuCB
         IPzw==
X-Gm-Message-State: AFuF++n0e6qU/rTl7c7xIL3qLncYEVWZYarxLWmQ2obJ75fNVb6QeSHX
	lyJMYdYW0t4ZjkT27lw7un6tbyeX0kB56Y30mbBnTQ06pK+IxpoSHPPCXM1bbdHnAjhsHSyRoo8
	Nwpo=
X-Gm-Gg: AYBFou0+CPKeNfMdQ3DFSKHZyGBwUvk7UWrfZArkbjqmaPo+KEUU3bBb1A5Xkea+Fwv
	CszC/fge/rA5pShdfQ+ipXFJENf7k5vTOR8jDoRW4iI8GFHkDzzqDhfXPxhLaFRZG4ccj03K6t+
	a/hJcFiFkI/BzE3n7fNDFL2IgnLqPQQAPx5Ixq9gU6muvfDM2QZ7GYHWK/SN2rcJPRfEXgjbmZh
	aD84BA6wnqe3Up0K3w3FrZWCqLJUyt2AmHch0gNz5ySO5MSaFe/Z+Px1wuErhxl8b6P3H1YJHt7
	lO8PGS7DkrZD1ZB3Du6srboqKp0ErOF60GR2x1nHRMi1mVUfZQ8SDqB7Mbz3iRWqIMw3CaBYTiV
	rQ+FcT3v1BykqVAJB+zx5YR5jTJMuSUwFMY1cfhzWnS+bhfnEGw/O47LG2H4lLAfmFbl2JCOR6/
	0n64HTSpm3ct0RUHF5uHZGM5Hb4Fn3Nt27VwGjC17hTnUYANQR5UQmvTtvRO13DZbVT9x0Qcoyr
	xohmEmXbTNR5qX5i3J3PBofzb2/Fw==
X-Received: by 2002:a17:90b:538b:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-39b261d5148mr35744904a91.13.1788806165375;
        Mon, 07 Sep 2026 11:36:05 -0700 (PDT)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com. [209.85.214.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm27806245a91.8.2026.09.07.11.36.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 11:36:04 -0700 (PDT)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d58efc7356so46650815ad.1
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 11:36:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e04:b0:3c6:61b9:917c with SMTP id
 adf61e73a8af0-3da39cfee0dmr39470962637.11.1788806163604; Mon, 07 Sep 2026
 11:36:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <NyIyntNSKnGNUZ9e_D85jiYUrnTPBu_Ux5olvRdPsK8lpjI8wYk-xb6sGrx9eK9iapaHROjWS3G2oeH5rkJyAiyjjYocn4CoYdvUoq92Pss=@protonmail.com>
 <CANiDSCu2=p_o8qNZeEOQB_um0YH_+3jefB=4xsC6k6Z349xtaQ@mail.gmail.com>
 <28dJLjsoYQxYnUJloPFduvPFDUb6r-YQrLRK0aT_UZ1GJAMGt9892Ltc6-1Uppe3UiQILaOwlEqsj5W6IUKFUvYDs8osrNPH1Z9MnvE0ed0=@protonmail.com>
 <CANiDSCsQL_AWPz+spNwFkD=iSuDp5YKuk_0KROvmLNx0rG4tfQ@mail.gmail.com> <RvTaL2E-hrP99NfDt6Vd551foC2i6P87ygj8B2zEZZgo0YH9VPLG0HUHZpSvhPKH74wOK_jV8QFiZhKjYIs852vA4OTy-hTp_BwVdTj2Bu0=@protonmail.com>
In-Reply-To: <RvTaL2E-hrP99NfDt6Vd551foC2i6P87ygj8B2zEZZgo0YH9VPLG0HUHZpSvhPKH74wOK_jV8QFiZhKjYIs852vA4OTy-hTp_BwVdTj2Bu0=@protonmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 7 Sep 2026 20:35:48 +0200
X-Gmail-Original-Message-ID: <CANiDSCvyDHJKNAnLZFxz8SjWg3Y4-LoFC3KqotMa5i1fP8aZ0g@mail.gmail.com>
X-Gm-Features: AcwNN1WejcwQPEW3a1TSmja9xFLELmsP9qBSIiEH15eHV9OBoI4OXKTaTcaVarM
Message-ID: <CANiDSCvyDHJKNAnLZFxz8SjWg3Y4-LoFC3KqotMa5i1fP8aZ0g@mail.gmail.com>
Subject: Re: Re : Re: Re : Re: Avermedia GC515 implementation
To: Edwin Gatier <edwin.gatier@protonmail.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Edwin



On Mon, 7 Sept 2026 at 17:01, Edwin Gatier <edwin.gatier@protonmail.com> wr=
ote:
>
> Hello,
>
> I saw that the audio is surprisingly working fine with whatever uvcvideo =
driver I use (the fact that the uvcvideo driver has no effect on audio is e=
xpected after all), confirming the USB HUB aspect, I suspect the requiremen=
t for usb 3.X by avermedia is to run audio and video in parallel with multi=
ple USB 2 virtual devices over a single physical cable.
>
> I didn't know that wireshark could look at USB packets, that's nice. I ha=
ve to say the card does communicate quite well and gives information onto w=
hat video format to expect (H264 and HVEC specifications) and audio expecta=
tions as well, it's on line 136 of the usb capture file.
>
> Because the usb is physically pluged on a usb card you have a bit of "noi=
se" in the recording, I used the 'usb.src =3D=3D "3.4.0" OR usb.dst =3D=3D =
"3.4.0"' and 'usb.src =3D=3D "3.5.0" OR usb.dst =3D=3D "3.5.0"' filters to =
follow the pc <-> capture card dialogue.
>
> I suspect the card resets when I force a new multimedia signal to be emit=
ted by powering on the plugged video source (a switch2 in that case) which =
explains the multiple dialogues.
>
> Attached are the 2 requested logs.

I have not looked into the pcap file yet. Before looking into it...

Are you sure that you applied the uvc_version patch when you run the test?

[  125.095549] uvcvideo 3-2:1.0: Found a valid video chain (1 -> 32770)
[  125.096613] uvcvideo 3-2:1.0: UVC non compliance - GET_DEF(PROBE)
not supported. Enabling workaround.
[  125.097110] uvcvideo 3-2:1.1: Failed to query (GET_CUR) UVC probe
control : 34 (exp. 48).
[  125.097114] uvcvideo 3-2:1.1: Failed to initialize the device (-5).
[  125.097152] uvcvideo 3-2:1.0: probe with driver uvcvideo failed with err=
or -5

Regards!
>
> Good day
>
> Edwin
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
