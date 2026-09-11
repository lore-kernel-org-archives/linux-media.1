Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CEA3B6347
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120450; cv=none; b=FO6W7FKmKpk97eDZTer0WRGijIpuNp9UWcIieK+cX0Lzojb+gg6FXWa2ZuCi5x7f0T1o309sm0tOYcyj+nxROyYPSFpSWVyYzz9Gy0AoOoiT9vgcygthJb2p/1SzTbBdjO7YWETBQVDsAFuZsa/KI9vHaAhArqoqhiPN6g4qUec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120450; c=relaxed/simple;
	bh=xV5mS7thzbHqZNjDxeOPI/Fv3NAyZAWx22OfInqdiaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GWZC15iMaee4XNUy+BDebPROkoY0ssauYgXXxB6v9jZwX7TTnO1lnYLw4idKm84BZxJ9fl+AsAFn6a1kW2DldJPtTKv4tBwaaAekRhnOLYoYrAr909S1se/3PYKjfzBftsGvEJIO31ejLt9+Tl/tC1o7fhRtu2fKJ2dDWKmnp2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZTyPF5At; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZTyPF5At"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso962518a91.2
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 02:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789120448; x=1789725248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6CkUzUZA6OTD0PsxDNM+y9rPjY+1vSVk2mXxiRzzLUI=;
        b=ZTyPF5At2g4ADS2/r3PeIrJIRSDeysULtfwJoCX20VyavmgCokbZV0hIzpiJ4+iwr5
         LMz6jStg/mwjNobqWn3rvXvUxX0YIEzGa3XiG/rCYtM478CvCG4qlQYoNnfb9jf4tnsq
         b7nQv36giI1Q0EsqUPlMtDAztJJUV7VCP9TZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789120448; x=1789725248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6CkUzUZA6OTD0PsxDNM+y9rPjY+1vSVk2mXxiRzzLUI=;
        b=jVu7BeRsZkv05S/FEHbQTpp33ytCN4kNMQgag33uV6ZWivJaCQZwK9VmxfMqgaswuQ
         +xCEOkNv7ExrlP86U9h8F2Ik7GynB9BXvwIcAdJIVe46Blcg1Rgrt4+DfR31TqZ3wRsk
         55BkdKNSAPFxKFM97XnO18wT/A4vt7l9t8RzmuYpBXNfWlztBFxSC9DsRfw5o/+W5z7y
         NmWwa1Epqjc0RQkgiD2tpNT4V/9G8mUsONfn2bB/dNgpD9OWXQDt54Rtd41tBtKQYZre
         CwobPj/dcS4MEWUsbeCG9AIow14bnJmJ3cmH1C158DrN7V4j2gOnFI7SFbwA3VD4chnt
         8gIw==
X-Gm-Message-State: AFuF++kKzI9/Sm8zj7JPoSbg1RxvTdg+lxA9p6olpHKK6gcEf5QEv0CV
	8qYpQxgzPdRqnuDetTju3ZZjHt5lzsLsWvbNaV+mauev5kzTznhmYsGZ8WfQVUcfHAwzamHWKd6
	YycrtyIma
X-Gm-Gg: AYBFou0/sJPBfZbg8F7hgvJTqGmPVgwYZSVhu7B7zvas+atNzxlg8uB2sQQMHHm6VGC
	rjawXerZ4SVWH5r6O0ybB5KTYqvZ2SNZ9mA9vtKAz+g9civsfxwsnVc91zqrFXak7W7BNMfnib8
	TyGHxn/BwO0cMpG5RfumgI1jLpDTHocpFD+0L9Hu8cL6C5O5J1OLwQWiUf2Avu7qcrwU+9+Eu+U
	AgEmtn+8py1tleFJkr09waUxwt55SipumPo+c0f8fRi/i535YCKcPodeFKXI92z3Gr2l2yz6/VU
	ghHem1tVZBPrkRT4jfIS8zkgwQ9P4CrFM/1bO3PD2lXtkozLYxyKXanouHcV+uuZ7ZDlYQRR/dT
	ThfB76JI3bj7wUI8etrBN/JlW1ER2oU8UpswiT6jGvPBfoCnpwHoMFdMuMXxJS55iEG5N4z825Z
	0Q5kwVYwlYOYiQK/zGEjTLLLttc+UpLhCNP2zd48nTt9DhfVtHv/hXlfdOlhEx3WnUkhUqjgXcV
	H820Ib4LVIzTB2gEDkHGRsHMN46VExivX0E4X2w
X-Received: by 2002:a17:90b:3f10:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39d9bdaac2fmr6165093a91.11.1789120447334;
        Fri, 11 Sep 2026 02:54:07 -0700 (PDT)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm3948606a91.4.2026.09.11.02.54.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 02:54:06 -0700 (PDT)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4aa0248cfso811650a12.1
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 02:54:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:3944:b0:3d0:5305:4fb9 with SMTP id
 adf61e73a8af0-3daed1a4c4emr6639311637.7.1789120445718; Fri, 11 Sep 2026
 02:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <NyIyntNSKnGNUZ9e_D85jiYUrnTPBu_Ux5olvRdPsK8lpjI8wYk-xb6sGrx9eK9iapaHROjWS3G2oeH5rkJyAiyjjYocn4CoYdvUoq92Pss=@protonmail.com>
 <CANiDSCu2=p_o8qNZeEOQB_um0YH_+3jefB=4xsC6k6Z349xtaQ@mail.gmail.com>
 <28dJLjsoYQxYnUJloPFduvPFDUb6r-YQrLRK0aT_UZ1GJAMGt9892Ltc6-1Uppe3UiQILaOwlEqsj5W6IUKFUvYDs8osrNPH1Z9MnvE0ed0=@protonmail.com>
 <CANiDSCsQL_AWPz+spNwFkD=iSuDp5YKuk_0KROvmLNx0rG4tfQ@mail.gmail.com>
 <t3hEIJz-K9HvqsANa0jwTFis2jKV-LIIUZ3-7AUs-sQnAgSsLZhu2013EUO_AOWgospC7Lvphv7D1iyhJb9vFMxnbtUjaKwTljvmHjUiU8A=@protonmail.com>
 <CANiDSCu4AW=JZ9FS+Ny=DK_+LqqytGvSe+V6aVncRiGRiyDMfA@mail.gmail.com>
 <njQpJCsjie_PEmoIZWXlTHCGW4nqAbpwp0ev50qLl-r5rWkV4mwEK0lSvJ-3w9BOPhvZE04A9O7pFeAdqq6-zKAF6tVIsPN6dPA1dnx86dE=@protonmail.com>
 <CANiDSCumxDChOj9JyCW3s1nBhpyeicerLyHSZDh=mTNfxbkGUg@mail.gmail.com>
 <CANiDSCts7TgGB8eVBSw1L8MNioHxD6_KfoW6mBwn9D51crVsvQ@mail.gmail.com> <tzjfIh6x0Uwujqr2ejd12rHu20MI9yIVwFE8AnxwHqGnTy6C1AVK6IzI2TdM-0RUriXVnCBZ9jf8hqbCTwyfg0UegbRSXAMp0bym0gU0vEs=@protonmail.com>
In-Reply-To: <tzjfIh6x0Uwujqr2ejd12rHu20MI9yIVwFE8AnxwHqGnTy6C1AVK6IzI2TdM-0RUriXVnCBZ9jf8hqbCTwyfg0UegbRSXAMp0bym0gU0vEs=@protonmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 11 Sep 2026 11:53:52 +0200
X-Gmail-Original-Message-ID: <CANiDSCtKAZhWTLmaDXHJVkUXTiik8v2VdTYjPubU8_=SzB6m5g@mail.gmail.com>
X-Gm-Features: AcwNN1VMvj67NhGLz8qdw_M4n-Tt9ovac3h5pRjq1sgZgigtH-aVbg48bhM3NdY
Message-ID: <CANiDSCtKAZhWTLmaDXHJVkUXTiik8v2VdTYjPubU8_=SzB6m5g@mail.gmail.com>
Subject: Re: Re : Re: Re : Re: Avermedia GC515 implementation
To: Edwin Gatier <edwin.gatier@protonmail.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Edwin



On Fri, 11 Sept 2026 at 10:45, Edwin Gatier <edwin.gatier@protonmail.com> w=
rote:
>
> Hello,
>
> I meant to respond earlier, sorry.
>
> The auto detection works well, at least on OBS I have the video stream wo=
rking properly.
>
> Please find the dmesg log attached.

Thanks for testing it :)

I have uploaded a v2 that slightly changes the way the uvc_version
works for uvc_set_video_ctrl(). If you can also test that one I would
be very grateful :)

https://lore.kernel.org/linux-media/20260911-uvc-version-v2-2-395f27b0444c@=
chromium.org/T/#m1883d2c1dcf042fa14ef5df84bfa84bc8f5fc713

(only apply 2/2 not 1/2)

Regards


>
> Regards
>
> Edwin
>
> Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
>
> Le jeudi 10 septembre 2026 =C3=A0 23:10, Ricardo Ribalda <ribalda@chromiu=
m.org> a =C3=A9crit :
>
> > Hi Edwin
> >
> > On Mon, 7 Sept 2026 at 22:34, Ricardo Ribalda <ribalda@chromium.org> wr=
ote:
> > >
> > > Hi Edwin
> > >
> > >
> > > On Mon, 7 Sept 2026 at 22:31, Edwin Gatier <edwin.gatier@protonmail.c=
om> wrote:
> > > >
> > > > IT WORKS
> > > >
> > > > forcing uvc 1.1 works!!! a bit weird because I'm sure I tried that =
at some point but to no avail, might have made a typo like "0x011"
> > >
> > > Happy to hear that :) I will likely ask you to test a couple of
> > > patches so this is fixed for everyone.
> >
> > Just to make sure that you did not missed it.
> >
> > I did prepare this patch:
> > https://lore.kernel.org/linux-media/20260907-uvc-version-v1-1-34e45dfe0=
4de@chromium.org/
> >
> > It would be great if you could test it with your camera
> >
> > thanks!
> >
> >
> > >
> > > Regards!
> > >
> > > >
> > > > thanks a lot for your help, I'm making the change permanent on my s=
ide.
> > > >
> > > > OBS has access to the H264 stream, sound is on the side obviously a=
nd I have a small latency but it was expected behavior without the obs plug=
in only available on windows as far as I know.
> > > >
> > > > I still include the logs for you to make a proper implementation in=
 the kernel's repo. Don't hesitate to contact me for more info/test.
> > > >
> > > > Thanks again
> > > >
> > > > Edwin
> > > >
> > > >
> > > >
> > > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
> > > >
> > > > Le lundi 7 septembre 2026 =C3=A0 22:04, Ricardo Ribalda <ribalda@ch=
romium.org> a =C3=A9crit :
> > > >
> > > > > Hi Edwin
> > > > >
> > > > > On Mon, 7 Sept 2026 at 21:39, Edwin Gatier <edwin.gatier@protonma=
il.com> wrote:
> > > > > >
> > > > > > Indeed the mod was not loaded sorry about that, I thought the r=
aw/out of the box result would be the starting point for the log.
> > > > > >
> > > > > > Here are the logs with the mod loaded in.
> > > > >
> > > > > Could you try modifying the original patch?
> > > > >
> > > > > Where it says:
> > > > >
> > > > >  .uvc_version =3D 0x010a,
> > > > >
> > > > > it should say
> > > > >
> > > > >  .uvc_version =3D 0x0110,
> > > > >
> > > > >
> > > > > Thanks!
> > > > > >
> > > > > >
> > > > > >
> > > > > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
> > > > > >
> > > > > > Le lundi 7 septembre 2026 =C3=A0 13:14, Ricardo Ribalda <ribald=
a@chromium.org> a =C3=A9crit :
> > > > > >
> > > > > > > Hi Edwin
> > > > > > >
> > > > > > > Thanks a lot for the logs.
> > > > > > > This is a new one:
> > > > > > > Failed to query (GET_CUR) UVC probe control : -75 (exp. 26).
> > > > > > >
> > > > > > > (we had before  Failed to query (GET_CUR) UVC probe control :=
 34 (exp. 48).)
> > > > > > >
> > > > > > > Progress??? who knows :P
> > > > > > >
> > > > > > > It would help to have a usb trace...  Have you used usbmon be=
fore?
> > > > > > >
> > > > > > > If you get a trace, add also the dmesg output. You can use so=
mething like this
> > > > > > >
> > > > > > > # disconnect the camera
> > > > > > > dmesg -c > /dev/null
> > > > > > > rmmod uvcvideo
> > > > > > > modprobe uvcvideo trace=3D0xffffffff
> > > > > > > modprobe usbmon
> > > > > > > # Start wireshark and start capturing on the correct port
> > > > > > > # connect the camera and give it a couple of secs
> > > > > > > # Stop capturing
> > > > > > > dmesg > dmesg.log
> > > > > > >
> > > > > > > Hopefully the logs will give us something to work with... But=
 bear in
> > > > > > > mind that we are only looking at it from "uvc" perspective. T=
he
> > > > > > > high-speed vs super-speed problem will not be solved.
> > > > > > >
> > > > > > > Regards!
> > > > > > > --
> > > > > > > Ricardo Ribalda
> > > > > > >
> > > > > > > On Sun, 6 Sept 2026 at 18:23, Edwin Gatier <edwin.gatier@prot=
onmail.com> wrote:
> > > > > > > >
> > > > > > > > Hello,
> > > > > > > >
> > > > > > > > Sorry for the delay, I had other matter to attend to and al=
so it's my first time making drivers so i had some issues making it work.
> > > > > > > > Thank you for the quick response.
> > > > > > > > I added the quirk but it still does not work, the quirk is =
taken into account (forcing v 1.0a) but the probe still returns a mismatch =
length error.
> > > > > > > > A "very usefull" comment on a reddit thread I openned indic=
ates that the card is suppose to behave like a usb hub with a uvc device as=
 one of the device of the hub, but the list of usb devices connected to the=
 pc does only show one device and dmesg shows it is recognised (falsly) as =
a 1.5 uvc device.
> > > > > > > >
> > > > > > > > How do you recon we/I could go on from this point on ?
> > > > > > > >
> > > > > > > > Regards
> > > > > > > >
> > > > > > > > Edwin
> > > > > > > >
> > > > > > > >
> > > > > > > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
> > > > > > > >
> > > > > > > > Le mardi 1 septembre 2026 =C3=A0 08:45, Ricardo Ribalda <ri=
balda@chromium.org> a =C3=A9crit :
> > > > > > > >
> > > > > > > > > Hi Edwin
> > > > > > > > >
> > > > > > > > > Looks like your camera is not following the spec. It says=
 that it is
> > > > > > > > > uvc 1.5 but behaves like 1.1
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Could you try if this patch fixes it for you?
> > > > > > > > >
> > > > > > > > > Regards!
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > > b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > > index e289cc71ba98..615cebb67508 100644
> > > > > > > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > > @@ -2851,6 +2851,17 @@ static const struct usb_device_id =
uvc_ids[] =3D {
> > > > > > > > >           .bInterfaceSubClass   =3D 1,
> > > > > > > > >           .bInterfaceProtocol   =3D 0,
> > > > > > > > >           .driver_info          =3D (kernel_ulong_t)&uvc_=
quirk_fix_bandwidth },
> > > > > > > > > +       /* Avermedia GC515 */
> > > > > > > > > +       { .match_flags          =3D USB_DEVICE_ID_MATCH_D=
EVICE
> > > > > > > > > +                               | USB_DEVICE_ID_MATCH_INT=
_INFO,
> > > > > > > > > +         .idVendor             =3D 0x07ca,
> > > > > > > > > +         .idProduct            =3D 0x1515,
> > > > > > > > > +         .bInterfaceClass      =3D USB_CLASS_VIDEO,
> > > > > > > > > +         .bInterfaceSubClass   =3D 1,
> > > > > > > > > +         .bInterfaceProtocol   =3D UVC_PC_PROTOCOL_15,
> > > > > > > > > +         .driver_info          =3D (kernel_ulong_t)&(con=
st struct
> > > > > > > > > uvc_device_info){
> > > > > > > > > +               .uvc_version =3D 0x010a,
> > > > > > > > > +         } },
> > > > > > > > >         /* ViMicro Vega */
> > > > > > > > >         { .match_flags          =3D USB_DEVICE_ID_MATCH_D=
EVICE
> > > > > > > > >                                 | USB_DEVICE_ID_MATCH_INT=
_INFO,
> > > > > > > > >
> > > > > > > > > On Tue, 1 Sept 2026 at 02:45, Edwin Gatier <edwin.gatier@=
protonmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > Hello,
> > > > > > > > > >
> > > > > > > > > > I'm trying to use the usb capture card x'tra go from av=
ermedia but the uvc implementation is not very good from the vendor. The ca=
rd falls back at usb 2 speed (high speed detected) while it works fine on w=
indows with usb3 speed (super speed) which it as been designed for. Video s=
tream should be 1080p120 and h265 compressed by the card.
> > > > > > > > > >
> > > > > > > > > > Plugging the card does nothing, the card is not recogni=
zed at all as seen in the dmesg log, and subsequently is not mounted in /de=
v/videoX.
> > > > > > > > > > I tried some quirks but didn't manage to pass the probe=
.
> > > > > > > > > >
> > > > > > > > > > You of course can contact me for more information.
> > > > > > > > > >
> > > > > > > > > > I'm on linux 7.2.2-1-cachyos with Wayland and have a du=
alboot with windows 11 on separate drive to update and test the capture car=
d.
> > > > > > > > > >
> > > > > > > > > > Best Regards
> > > > > > > > > >
> > > > > > > > > > Edwin GATIER
> > > > > > > > > >
> > > > > > > > > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Ma=
il.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > Ricardo Ribalda
> > > > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Ricardo Ribalda
> > > > > > >
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Ricardo Ribalda
> > > > >
> > >
> > >
> > >
> > > --
> > > Ricardo Ribalda
> >
> >
> >
> > --
> > Ricardo Ribalda
> >



--=20
Ricardo Ribalda
