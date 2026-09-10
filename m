Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541A841D112
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 21:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074644; cv=none; b=kDx9e3b4DlaKOFdEpcNP9fY6hVYYr+04RPd9yKzSTjzQ2FXLmpASRZC8KUfqxhMi0GIUMS8p9eKr+Kx3gSUNRe/vBKqcYzeh9cv4RaNlHB6f3DC9McXDyLH3zjY3vdg4IGMtxwTWP6uFZfYqBozBFCRf0pzpZGDnhgYBn4BPHtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074644; c=relaxed/simple;
	bh=Db5degL+hUfM+L9Le+gSdiZAGmlBTLP5ygI4b6t6p0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J79M8UPjCmtlfa04OTjXYZ2BmCXQzPOSugdMwuZsAL277xF6y3gQwl90bfXCV28BleOl+Zf+q+JqVS9y/cEimEtYOEu0oZxTVW/xxPd3pmQWWgwoJg1FfNbzOnxGWmSlLdWrN5QQVhzT6HqBpI+jJeyTqVw49e4BJSejgR80hw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Od3VRsLD; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Od3VRsLD"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-86a31708876so146802b3a.2
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 14:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789074640; x=1789679440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kJqbdevsoigXDe2FrYPP/ulwysWj9PxmJ4sdiPlrlnA=;
        b=Od3VRsLDpZNjElzsXK8bzD9HDQmaTTkSnnvRi6tA0nYveHl93jBInF26ZUXA4g1lvg
         ws3g3PVb4aPnRQCu5eabcl2rk0C0ooKFxxEaqRTgu+zARaG48yBBaruE3jVafzMmOFum
         DKL/yDGr+7qoeW/a8wW4UwMbavBTZgyGOssUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789074640; x=1789679440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJqbdevsoigXDe2FrYPP/ulwysWj9PxmJ4sdiPlrlnA=;
        b=ab4WJkkjixz18g18EAhF1+Zr126NVRFKp2VWcyDwB0AWvuFkQ9V44wS0yq4MW/eKQg
         sohtNjGt3P+M9keg6pcmrrmsWawdEn9npYnUVnqlgGk3WREcmh1dduykh0qjCGQZ+JPq
         HnwDwSuzzmVWAQTRI+ItNu22z4PwuYXmRo9l2fg6PRLp/+BHEB6F65i2ZpSegSHKWNvO
         p1vHAFa9oK/JnXduR6sYJteUSt7IjJQyvrhfhJ3dBPFyRjp0ux2yBXGL8tcmIn7cFgRl
         FNgjVAgfMPwnmknfmW53JA6QzwpntKZzs96U1iLub2mCgKhQci7UIGFZDxSJYAbsB/Ke
         +8og==
X-Gm-Message-State: AFuF++l7Z51mgACj29GZU3AqJ1jpKXw4WuttH7rWpU9W7B9fGx69i9ZI
	L4ueqD0S11NaZU0Td1IrPMdEz3M8OC8X0Cuwa65KYaPJaRKsb8NO1zUDx7bbUjMawIx/ekBOfWf
	DNawBNw==
X-Gm-Gg: AYBFou3V9xemuThBgqaiNiqMaOqhW+nSqzj9XzWm/SYaJdGdD9weVAQdFkQnNoY/kFA
	7hOS2/zJHlUtrQgVL0XOrVSEqloQorl/reI8uWelZL7Iz7dHUWzkFaEhzLDHDVqPpZq35YRY3L5
	RIfo1/wFMmqqpzm9tgwSkSzUq+96ZtYLjT+ninqRkbje65LbuV7zrL7iA+EyPGQE7Es8O/vyfhc
	oNktTc6G4R7cNSSqudVZZ8ZqA+TfQHr20YEKC2NgAn6mWQ1RfhmAE9q5YBJXg96fosszxpWWDGe
	gX3E1E6WqtsvHbe86+O2cmaoV4DcfZd1MbT3tF19d7a+OG4Mgits+86k7NMLWUWMirgqZSqX4Vi
	dufsMjWWwWEjK2XzfSYTfxlGyBPapLpipcqJ/uCFa4CHNLt2HSdIzKuPQ5bTZ1w2BL+qk4XmU5A
	1m9USWhZzaP9Sda8lH7+wu3nR347KmoLYHfObO+9QdY6FvTu6vtZ3X/c3FHrNVse4anJEognKhQ
	U99h+hrrNqk56ib9WLCLt2VJWW9NerFqHhMubip
X-Received: by 2002:a05:6a21:113:b0:3c3:7a0a:18a6 with SMTP id adf61e73a8af0-3daed31ae39mr1456554637.18.1789074639852;
        Thu, 10 Sep 2026 14:10:39 -0700 (PDT)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com. [209.85.214.170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6036fd7sm240106a12.0.2026.09.10.14.10.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 14:10:38 -0700 (PDT)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cace91f112so1366435ad.0
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 14:10:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2701:b0:398:9beb:5c19 with SMTP id
 98e67ed59e1d1-39d9c21b92fmr1034214a91.20.1789074636949; Thu, 10 Sep 2026
 14:10:36 -0700 (PDT)
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
In-Reply-To: <CANiDSCumxDChOj9JyCW3s1nBhpyeicerLyHSZDh=mTNfxbkGUg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 10 Sep 2026 23:10:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCts7TgGB8eVBSw1L8MNioHxD6_KfoW6mBwn9D51crVsvQ@mail.gmail.com>
X-Gm-Features: AcwNN1Wbl364gt3oz5rzoTlQec_sR5hCKheSCfkhP4l37A2eQRwin_B_9zjK1iY
Message-ID: <CANiDSCts7TgGB8eVBSw1L8MNioHxD6_KfoW6mBwn9D51crVsvQ@mail.gmail.com>
Subject: Re: Re : Re: Avermedia GC515 implementation
To: Edwin Gatier <edwin.gatier@protonmail.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Edwin

On Mon, 7 Sept 2026 at 22:34, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Edwin
>
>
> On Mon, 7 Sept 2026 at 22:31, Edwin Gatier <edwin.gatier@protonmail.com> =
wrote:
> >
> > IT WORKS
> >
> > forcing uvc 1.1 works!!! a bit weird because I'm sure I tried that at s=
ome point but to no avail, might have made a typo like "0x011"
>
> Happy to hear that :) I will likely ask you to test a couple of
> patches so this is fixed for everyone.

Just to make sure that you did not missed it.

I did prepare this patch:
https://lore.kernel.org/linux-media/20260907-uvc-version-v1-1-34e45dfe04de@=
chromium.org/

It would be great if you could test it with your camera

thanks!


>
> Regards!
>
> >
> > thanks a lot for your help, I'm making the change permanent on my side.
> >
> > OBS has access to the H264 stream, sound is on the side obviously and I=
 have a small latency but it was expected behavior without the obs plugin o=
nly available on windows as far as I know.
> >
> > I still include the logs for you to make a proper implementation in the=
 kernel's repo. Don't hesitate to contact me for more info/test.
> >
> > Thanks again
> >
> > Edwin
> >
> >
> >
> > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
> >
> > Le lundi 7 septembre 2026 =C3=A0 22:04, Ricardo Ribalda <ribalda@chromi=
um.org> a =C3=A9crit :
> >
> > > Hi Edwin
> > >
> > > On Mon, 7 Sept 2026 at 21:39, Edwin Gatier <edwin.gatier@protonmail.c=
om> wrote:
> > > >
> > > > Indeed the mod was not loaded sorry about that, I thought the raw/o=
ut of the box result would be the starting point for the log.
> > > >
> > > > Here are the logs with the mod loaded in.
> > >
> > > Could you try modifying the original patch?
> > >
> > > Where it says:
> > >
> > >  .uvc_version =3D 0x010a,
> > >
> > > it should say
> > >
> > >  .uvc_version =3D 0x0110,
> > >
> > >
> > > Thanks!
> > > >
> > > >
> > > >
> > > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
> > > >
> > > > Le lundi 7 septembre 2026 =C3=A0 13:14, Ricardo Ribalda <ribalda@ch=
romium.org> a =C3=A9crit :
> > > >
> > > > > Hi Edwin
> > > > >
> > > > > Thanks a lot for the logs.
> > > > > This is a new one:
> > > > > Failed to query (GET_CUR) UVC probe control : -75 (exp. 26).
> > > > >
> > > > > (we had before  Failed to query (GET_CUR) UVC probe control : 34 =
(exp. 48).)
> > > > >
> > > > > Progress??? who knows :P
> > > > >
> > > > > It would help to have a usb trace...  Have you used usbmon before=
?
> > > > >
> > > > > If you get a trace, add also the dmesg output. You can use someth=
ing like this
> > > > >
> > > > > # disconnect the camera
> > > > > dmesg -c > /dev/null
> > > > > rmmod uvcvideo
> > > > > modprobe uvcvideo trace=3D0xffffffff
> > > > > modprobe usbmon
> > > > > # Start wireshark and start capturing on the correct port
> > > > > # connect the camera and give it a couple of secs
> > > > > # Stop capturing
> > > > > dmesg > dmesg.log
> > > > >
> > > > > Hopefully the logs will give us something to work with... But bea=
r in
> > > > > mind that we are only looking at it from "uvc" perspective. The
> > > > > high-speed vs super-speed problem will not be solved.
> > > > >
> > > > > Regards!
> > > > > --
> > > > > Ricardo Ribalda
> > > > >
> > > > > On Sun, 6 Sept 2026 at 18:23, Edwin Gatier <edwin.gatier@protonma=
il.com> wrote:
> > > > > >
> > > > > > Hello,
> > > > > >
> > > > > > Sorry for the delay, I had other matter to attend to and also i=
t's my first time making drivers so i had some issues making it work.
> > > > > > Thank you for the quick response.
> > > > > > I added the quirk but it still does not work, the quirk is take=
n into account (forcing v 1.0a) but the probe still returns a mismatch leng=
th error.
> > > > > > A "very usefull" comment on a reddit thread I openned indicates=
 that the card is suppose to behave like a usb hub with a uvc device as one=
 of the device of the hub, but the list of usb devices connected to the pc =
does only show one device and dmesg shows it is recognised (falsly) as a 1.=
5 uvc device.
> > > > > >
> > > > > > How do you recon we/I could go on from this point on ?
> > > > > >
> > > > > > Regards
> > > > > >
> > > > > > Edwin
> > > > > >
> > > > > >
> > > > > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
> > > > > >
> > > > > > Le mardi 1 septembre 2026 =C3=A0 08:45, Ricardo Ribalda <ribald=
a@chromium.org> a =C3=A9crit :
> > > > > >
> > > > > > > Hi Edwin
> > > > > > >
> > > > > > > Looks like your camera is not following the spec. It says tha=
t it is
> > > > > > > uvc 1.5 but behaves like 1.1
> > > > > > >
> > > > > > >
> > > > > > > Could you try if this patch fixes it for you?
> > > > > > >
> > > > > > > Regards!
> > > > > > >
> > > > > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > index e289cc71ba98..615cebb67508 100644
> > > > > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > @@ -2851,6 +2851,17 @@ static const struct usb_device_id uvc_=
ids[] =3D {
> > > > > > >           .bInterfaceSubClass   =3D 1,
> > > > > > >           .bInterfaceProtocol   =3D 0,
> > > > > > >           .driver_info          =3D (kernel_ulong_t)&uvc_quir=
k_fix_bandwidth },
> > > > > > > +       /* Avermedia GC515 */
> > > > > > > +       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVIC=
E
> > > > > > > +                               | USB_DEVICE_ID_MATCH_INT_INF=
O,
> > > > > > > +         .idVendor             =3D 0x07ca,
> > > > > > > +         .idProduct            =3D 0x1515,
> > > > > > > +         .bInterfaceClass      =3D USB_CLASS_VIDEO,
> > > > > > > +         .bInterfaceSubClass   =3D 1,
> > > > > > > +         .bInterfaceProtocol   =3D UVC_PC_PROTOCOL_15,
> > > > > > > +         .driver_info          =3D (kernel_ulong_t)&(const s=
truct
> > > > > > > uvc_device_info){
> > > > > > > +               .uvc_version =3D 0x010a,
> > > > > > > +         } },
> > > > > > >         /* ViMicro Vega */
> > > > > > >         { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVIC=
E
> > > > > > >                                 | USB_DEVICE_ID_MATCH_INT_INF=
O,
> > > > > > >
> > > > > > > On Tue, 1 Sept 2026 at 02:45, Edwin Gatier <edwin.gatier@prot=
onmail.com> wrote:
> > > > > > > >
> > > > > > > > Hello,
> > > > > > > >
> > > > > > > > I'm trying to use the usb capture card x'tra go from averme=
dia but the uvc implementation is not very good from the vendor. The card f=
alls back at usb 2 speed (high speed detected) while it works fine on windo=
ws with usb3 speed (super speed) which it as been designed for. Video strea=
m should be 1080p120 and h265 compressed by the card.
> > > > > > > >
> > > > > > > > Plugging the card does nothing, the card is not recognized =
at all as seen in the dmesg log, and subsequently is not mounted in /dev/vi=
deoX.
> > > > > > > > I tried some quirks but didn't manage to pass the probe.
> > > > > > > >
> > > > > > > > You of course can contact me for more information.
> > > > > > > >
> > > > > > > > I'm on linux 7.2.2-1-cachyos with Wayland and have a dualbo=
ot with windows 11 on separate drive to update and test the capture card.
> > > > > > > >
> > > > > > > > Best Regards
> > > > > > > >
> > > > > > > > Edwin GATIER
> > > > > > > >
> > > > > > > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
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
> > >
>
>
>
> --
> Ricardo Ribalda



--=20
Ricardo Ribalda
