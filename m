Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57F43AFD11
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 20:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813318; cv=none; b=Bgf+HD8EZ3boispgIz4TaHdKLTAi69fkYRXLuHJknGuk2P/6OjA1apPOjPm3yHNLWvBN7N+o0FJUvr+s4PYtBVZ87QHSBUywXCoqwPQ9athkhBjX3xil8vqNUU1wc3XnBfJUDbx5o4v842Gt9pd6rfUUwSBzklC2SLc2eP3YEls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813318; c=relaxed/simple;
	bh=0IWffhzqrmniLL2Di1468HaXy5XBGp6F5hPaHXf5tcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUl0SduSEM3DL4X7xYgzK+kJ8aOEh8eu04Zo2TZIdSJL56g1s5hsfDuMdxNWcronTBcDde5c9iz2o5HZy8/wGa1zqsjBYHbpKXRz+NO9HB59GqgvOIFujRlZuRgo2UblHO39ccfZFazvteM35LiU+pEeiTEXesuEA72HjDlG3vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MN65LrUL; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MN65LrUL"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84864086bfeso3397938b3a.1
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 13:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788813316; x=1789418116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rO3cSSdgmmCGUMwqu72s3FkePHh37ZNmQCVh7o0zSTA=;
        b=MN65LrULLMrI6uQxEyY3Hnrj1afOucP1p8/U0a+TWlKRxo461mEBBcEpDTcbuul2xL
         iHXm+aZAsuzy+Ln3oEklyyTnxE08V9xoCxIzc+SR/wqbDOB+u5x2pCqZXM5EWGMnVqqu
         HJX54z1GlsVQ8Ar0ibgGl8G79sUrfIzFEQAVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813316; x=1789418116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rO3cSSdgmmCGUMwqu72s3FkePHh37ZNmQCVh7o0zSTA=;
        b=dWA4ks319nLsMKaSFcpypoWFrcOlIadYSYePwe9gsYq9/ZYAj7yFjTZVHgZDm7+167
         /YXaTXM0JiUXbQfnHOPbVo59zNRMiHtGacwfpFm4soNuML6lrGM12hBxOLOEGkJiL5Gy
         LTDbt9cV2zY/voTrkBpysYkpmbg/NrxyH55+IhLsSKLKW2rUTX1+/ggiqjaOeL4vPtpp
         yJO0X1Prma+3cXYiDe2RQjPdZaEPIs5oSoQPfiExibGjblnqOfs6QeEQk+je8HhrDR7r
         AhbdDW5+1zukcscEIrd1GP7/WozxIjWJgLqXVRVSgKPjLYYLPFHGCGUE6CZlM9svwZVj
         zTqg==
X-Gm-Message-State: AFuF++lGBeEFc76rsg/L7GZcDL7xwuPs4DmqyZjvXn/UvY/dB7lvo/vw
	XPokSC82TnZ126T8eNYJmpA66OoLwD4vuMOmSvVwcNlyTIdzPjM4xRhBUJILwa3tcgLIcGWQSf4
	CtrLuqw==
X-Gm-Gg: AYBFou0bZCow5cnQdHyx2RIM2aOKxade2kps3lpz+ZEb+efBoy8BQnTu1Yst1gTEaIJ
	LO1brNyADKyFAcWu2nG3m3sHj+efHq5spK52UCQHLRbfyPXhgM67r7CX/e/ac3BfUTepRY9FvUz
	UboDn34CHX9jYDFb48mEBdwCuJCBl7dOej1K3NJ1MGz1M8fmRGyMCBZtDDsa7MqvamXBpfSJfwc
	xEIbTd2Hw8qgT4OSh8BiT4O+7bOXXv0C7j+5pNOaQ38czhBPS/PBqxqZFSe+u1/bqzf8NfkuiBB
	d2ft9fFjQrewbggB4hnaHmTfBtKiBxgC+fR3eBVyM6jS6kN53jQeZL54fHEzyyvBgOVR2rf4LMD
	33RYowueGEAjskx9zwoObQ7A/3WJhFBjZLCFs27pCk0tlJgVI0yEH/9hEFnNPcQ3YA0L5v4kRnp
	XkzVgaPRhNFJptJUp9Y1EXWqmNzyl8Dm/RcN+JeDZrD+QzI7w2tVUzDInwNrz4rqJuNn6U5PsgN
	0ne8IN8jVTWtGxjUX5f1UbxyQ==
X-Received: by 2002:a05:6a00:2c94:b0:848:3f07:c5a2 with SMTP id d2e1a72fcca58-86167aab584mr34698843b3a.4.1788813316011;
        Mon, 07 Sep 2026 13:35:16 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com. [209.85.216.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152045e8dsm4629432b3a.20.2026.09.07.13.35.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 13:35:15 -0700 (PDT)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so3637556a91.0
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 13:35:14 -0700 (PDT)
X-Received: by 2002:a17:90b:35d2:b0:39a:e002:f192 with SMTP id
 98e67ed59e1d1-39b2628f040mr35825240a91.22.1788813313674; Mon, 07 Sep 2026
 13:35:13 -0700 (PDT)
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
 <CANiDSCu4AW=JZ9FS+Ny=DK_+LqqytGvSe+V6aVncRiGRiyDMfA@mail.gmail.com> <njQpJCsjie_PEmoIZWXlTHCGW4nqAbpwp0ev50qLl-r5rWkV4mwEK0lSvJ-3w9BOPhvZE04A9O7pFeAdqq6-zKAF6tVIsPN6dPA1dnx86dE=@protonmail.com>
In-Reply-To: <njQpJCsjie_PEmoIZWXlTHCGW4nqAbpwp0ev50qLl-r5rWkV4mwEK0lSvJ-3w9BOPhvZE04A9O7pFeAdqq6-zKAF6tVIsPN6dPA1dnx86dE=@protonmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 7 Sep 2026 22:34:59 +0200
X-Gmail-Original-Message-ID: <CANiDSCumxDChOj9JyCW3s1nBhpyeicerLyHSZDh=mTNfxbkGUg@mail.gmail.com>
X-Gm-Features: AcwNN1XZi1OkN1QEyP04rEo5KTOyDMfCcubsSINtUZMsfpyJW1Vs-nLA_P1V_0M
Message-ID: <CANiDSCumxDChOj9JyCW3s1nBhpyeicerLyHSZDh=mTNfxbkGUg@mail.gmail.com>
Subject: Re: Re : Re: Avermedia GC515 implementation
To: Edwin Gatier <edwin.gatier@protonmail.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Edwin


On Mon, 7 Sept 2026 at 22:31, Edwin Gatier <edwin.gatier@protonmail.com> wr=
ote:
>
> IT WORKS
>
> forcing uvc 1.1 works!!! a bit weird because I'm sure I tried that at som=
e point but to no avail, might have made a typo like "0x011"

Happy to hear that :) I will likely ask you to test a couple of
patches so this is fixed for everyone.

Regards!

>
> thanks a lot for your help, I'm making the change permanent on my side.
>
> OBS has access to the H264 stream, sound is on the side obviously and I h=
ave a small latency but it was expected behavior without the obs plugin onl=
y available on windows as far as I know.
>
> I still include the logs for you to make a proper implementation in the k=
ernel's repo. Don't hesitate to contact me for more info/test.
>
> Thanks again
>
> Edwin
>
>
>
> Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
>
> Le lundi 7 septembre 2026 =C3=A0 22:04, Ricardo Ribalda <ribalda@chromium=
.org> a =C3=A9crit :
>
> > Hi Edwin
> >
> > On Mon, 7 Sept 2026 at 21:39, Edwin Gatier <edwin.gatier@protonmail.com=
> wrote:
> > >
> > > Indeed the mod was not loaded sorry about that, I thought the raw/out=
 of the box result would be the starting point for the log.
> > >
> > > Here are the logs with the mod loaded in.
> >
> > Could you try modifying the original patch?
> >
> > Where it says:
> >
> >  .uvc_version =3D 0x010a,
> >
> > it should say
> >
> >  .uvc_version =3D 0x0110,
> >
> >
> > Thanks!
> > >
> > >
> > >
> > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
> > >
> > > Le lundi 7 septembre 2026 =C3=A0 13:14, Ricardo Ribalda <ribalda@chro=
mium.org> a =C3=A9crit :
> > >
> > > > Hi Edwin
> > > >
> > > > Thanks a lot for the logs.
> > > > This is a new one:
> > > > Failed to query (GET_CUR) UVC probe control : -75 (exp. 26).
> > > >
> > > > (we had before  Failed to query (GET_CUR) UVC probe control : 34 (e=
xp. 48).)
> > > >
> > > > Progress??? who knows :P
> > > >
> > > > It would help to have a usb trace...  Have you used usbmon before?
> > > >
> > > > If you get a trace, add also the dmesg output. You can use somethin=
g like this
> > > >
> > > > # disconnect the camera
> > > > dmesg -c > /dev/null
> > > > rmmod uvcvideo
> > > > modprobe uvcvideo trace=3D0xffffffff
> > > > modprobe usbmon
> > > > # Start wireshark and start capturing on the correct port
> > > > # connect the camera and give it a couple of secs
> > > > # Stop capturing
> > > > dmesg > dmesg.log
> > > >
> > > > Hopefully the logs will give us something to work with... But bear =
in
> > > > mind that we are only looking at it from "uvc" perspective. The
> > > > high-speed vs super-speed problem will not be solved.
> > > >
> > > > Regards!
> > > > --
> > > > Ricardo Ribalda
> > > >
> > > > On Sun, 6 Sept 2026 at 18:23, Edwin Gatier <edwin.gatier@protonmail=
.com> wrote:
> > > > >
> > > > > Hello,
> > > > >
> > > > > Sorry for the delay, I had other matter to attend to and also it'=
s my first time making drivers so i had some issues making it work.
> > > > > Thank you for the quick response.
> > > > > I added the quirk but it still does not work, the quirk is taken =
into account (forcing v 1.0a) but the probe still returns a mismatch length=
 error.
> > > > > A "very usefull" comment on a reddit thread I openned indicates t=
hat the card is suppose to behave like a usb hub with a uvc device as one o=
f the device of the hub, but the list of usb devices connected to the pc do=
es only show one device and dmesg shows it is recognised (falsly) as a 1.5 =
uvc device.
> > > > >
> > > > > How do you recon we/I could go on from this point on ?
> > > > >
> > > > > Regards
> > > > >
> > > > > Edwin
> > > > >
> > > > >
> > > > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
> > > > >
> > > > > Le mardi 1 septembre 2026 =C3=A0 08:45, Ricardo Ribalda <ribalda@=
chromium.org> a =C3=A9crit :
> > > > >
> > > > > > Hi Edwin
> > > > > >
> > > > > > Looks like your camera is not following the spec. It says that =
it is
> > > > > > uvc 1.5 but behaves like 1.1
> > > > > >
> > > > > >
> > > > > > Could you try if this patch fixes it for you?
> > > > > >
> > > > > > Regards!
> > > > > >
> > > > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > index e289cc71ba98..615cebb67508 100644
> > > > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > @@ -2851,6 +2851,17 @@ static const struct usb_device_id uvc_id=
s[] =3D {
> > > > > >           .bInterfaceSubClass   =3D 1,
> > > > > >           .bInterfaceProtocol   =3D 0,
> > > > > >           .driver_info          =3D (kernel_ulong_t)&uvc_quirk_=
fix_bandwidth },
> > > > > > +       /* Avermedia GC515 */
> > > > > > +       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> > > > > > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > > > > > +         .idVendor             =3D 0x07ca,
> > > > > > +         .idProduct            =3D 0x1515,
> > > > > > +         .bInterfaceClass      =3D USB_CLASS_VIDEO,
> > > > > > +         .bInterfaceSubClass   =3D 1,
> > > > > > +         .bInterfaceProtocol   =3D UVC_PC_PROTOCOL_15,
> > > > > > +         .driver_info          =3D (kernel_ulong_t)&(const str=
uct
> > > > > > uvc_device_info){
> > > > > > +               .uvc_version =3D 0x010a,
> > > > > > +         } },
> > > > > >         /* ViMicro Vega */
> > > > > >         { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> > > > > >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> > > > > >
> > > > > > On Tue, 1 Sept 2026 at 02:45, Edwin Gatier <edwin.gatier@proton=
mail.com> wrote:
> > > > > > >
> > > > > > > Hello,
> > > > > > >
> > > > > > > I'm trying to use the usb capture card x'tra go from avermedi=
a but the uvc implementation is not very good from the vendor. The card fal=
ls back at usb 2 speed (high speed detected) while it works fine on windows=
 with usb3 speed (super speed) which it as been designed for. Video stream =
should be 1080p120 and h265 compressed by the card.
> > > > > > >
> > > > > > > Plugging the card does nothing, the card is not recognized at=
 all as seen in the dmesg log, and subsequently is not mounted in /dev/vide=
oX.
> > > > > > > I tried some quirks but didn't manage to pass the probe.
> > > > > > >
> > > > > > > You of course can contact me for more information.
> > > > > > >
> > > > > > > I'm on linux 7.2.2-1-cachyos with Wayland and have a dualboot=
 with windows 11 on separate drive to update and test the capture card.
> > > > > > >
> > > > > > > Best Regards
> > > > > > >
> > > > > > > Edwin GATIER
> > > > > > >
> > > > > > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
> > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > Ricardo Ribalda
> > > > > >
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
