Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F86E471D16
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 08:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116328; cv=none; b=EhoysQsNq/euTVsX5PaeESpsq4PZFQN5ZB3rHh40kRZtkp8D/cF1k9WycN30nJJ2VZi1Y9OOKydTPpGwyOrs/Wj81vaUrQq5xS3/DJqthQYBhk556RbzcyMPB0lDEd2q+3yNhV35cSjp8A1sLr78FlvDAjgyOIFayBKIiZc+Q8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116328; c=relaxed/simple;
	bh=PoChUQAj8OdR5kmEke4MjMtcv0yNsbpilFwtc2SFp1w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LLYrYp54vWkwT6Ubxdor37pGiYw/Nq5I+ixnUNFcPW6ndB9yuXPjW9Z/xJhN/tiGX0RGrsdYk24LXE1bddVEJ4au7Z7DdyTYNIgvRkob8eL0NruqsmWYTAkGSLG8NIIkFmkMJkHRgn0tUZb/LO7xX5xkUT8rE5YExRawMmDFqNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=AIDAiwXw; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="AIDAiwXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1789116298; x=1789375498;
	bh=VYCOe7mYXtW98n5f+Y/02ciDmNcf10iJ0Km0zu9LhQY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AIDAiwXwZaYYPcT4sKVNBDWW+mCjoZolccCcNB60nTTmP7bJIH9AThSywoaup+ift
	 6LKjlszmRZA0NNmlK30fZs1F9rAHOmMTdE+Ej0Oj+9gdqPp1tyGbCcXV5zbKXHCK1S
	 gvP299guiI0g9k4yHaBimgSZMQOWep+WYLB89v+2CNtHQczx/IFIhA5Jqew9daiR0g
	 Pb4SfFdWrDS992BhXb51xYcIgnBsvc7BcO1fHYFmAInpWIlmBZAX/hv5yVHHpZvN3y
	 B0HOQ5rMqvNOE6DzEsENFfhkAfOAIGvzcczD8g8SZJdwKZJQKcWqUVRYOG8xUfT9Cv
	 40+Uh5K1Hw+fA==
Date: Fri, 11 Sep 2026 08:44:53 +0000
To: Ricardo Ribalda <ribalda@chromium.org>
From: Edwin Gatier <edwin.gatier@protonmail.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re : Re: Re : Re: Avermedia GC515 implementation
Message-ID: <tzjfIh6x0Uwujqr2ejd12rHu20MI9yIVwFE8AnxwHqGnTy6C1AVK6IzI2TdM-0RUriXVnCBZ9jf8hqbCTwyfg0UegbRSXAMp0bym0gU0vEs=@protonmail.com>
In-Reply-To: <CANiDSCts7TgGB8eVBSw1L8MNioHxD6_KfoW6mBwn9D51crVsvQ@mail.gmail.com>
References: <NyIyntNSKnGNUZ9e_D85jiYUrnTPBu_Ux5olvRdPsK8lpjI8wYk-xb6sGrx9eK9iapaHROjWS3G2oeH5rkJyAiyjjYocn4CoYdvUoq92Pss=@protonmail.com> <CANiDSCu2=p_o8qNZeEOQB_um0YH_+3jefB=4xsC6k6Z349xtaQ@mail.gmail.com> <28dJLjsoYQxYnUJloPFduvPFDUb6r-YQrLRK0aT_UZ1GJAMGt9892Ltc6-1Uppe3UiQILaOwlEqsj5W6IUKFUvYDs8osrNPH1Z9MnvE0ed0=@protonmail.com> <CANiDSCsQL_AWPz+spNwFkD=iSuDp5YKuk_0KROvmLNx0rG4tfQ@mail.gmail.com> <t3hEIJz-K9HvqsANa0jwTFis2jKV-LIIUZ3-7AUs-sQnAgSsLZhu2013EUO_AOWgospC7Lvphv7D1iyhJb9vFMxnbtUjaKwTljvmHjUiU8A=@protonmail.com> <CANiDSCu4AW=JZ9FS+Ny=DK_+LqqytGvSe+V6aVncRiGRiyDMfA@mail.gmail.com> <njQpJCsjie_PEmoIZWXlTHCGW4nqAbpwp0ev50qLl-r5rWkV4mwEK0lSvJ-3w9BOPhvZE04A9O7pFeAdqq6-zKAF6tVIsPN6dPA1dnx86dE=@protonmail.com> <CANiDSCumxDChOj9JyCW3s1nBhpyeicerLyHSZDh=mTNfxbkGUg@mail.gmail.com> <CANiDSCts7TgGB8eVBSw1L8MNioHxD6_KfoW6mBwn9D51crVsvQ@mail.gmail.com>
Feedback-ID: 9206640:user:proton
X-Pm-Message-ID: d93d8ce9b4300d3051e0c1e46c102859002413c8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1=_xTGIZnIGr6fBU5XUCzXWqHutpweoe9FcKEdYXjR8ZM"

--b1=_xTGIZnIGr6fBU5XUCzXWqHutpweoe9FcKEdYXjR8ZM
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I meant to respond earlier, sorry.

The auto detection works well, at least on OBS I have the video stream work=
ing properly.

Please find the dmesg log attached.

Regards

Edwin

Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.

Le jeudi 10 septembre 2026 =C3=A0 23:10, Ricardo Ribalda <ribalda@chromium.=
org> a =C3=A9crit=C2=A0:

> Hi Edwin
>=20
> On Mon, 7 Sept 2026 at 22:34, Ricardo Ribalda <ribalda@chromium.org> wrot=
e:
> >
> > Hi Edwin
> >
> >
> > On Mon, 7 Sept 2026 at 22:31, Edwin Gatier <edwin.gatier@protonmail.com=
> wrote:
> > >
> > > IT WORKS
> > >
> > > forcing uvc 1.1 works!!! a bit weird because I'm sure I tried that at=
 some point but to no avail, might have made a typo like "0x011"
> >
> > Happy to hear that :) I will likely ask you to test a couple of
> > patches so this is fixed for everyone.
>=20
> Just to make sure that you did not missed it.
>=20
> I did prepare this patch:
> https://lore.kernel.org/linux-media/20260907-uvc-version-v1-1-34e45dfe04d=
e@chromium.org/
>=20
> It would be great if you could test it with your camera
>=20
> thanks!
>=20
>=20
> >
> > Regards!
> >
> > >
> > > thanks a lot for your help, I'm making the change permanent on my sid=
e.
> > >
> > > OBS has access to the H264 stream, sound is on the side obviously and=
 I have a small latency but it was expected behavior without the obs plugin=
 only available on windows as far as I know.
> > >
> > > I still include the logs for you to make a proper implementation in t=
he kernel's repo. Don't hesitate to contact me for more info/test.
> > >
> > > Thanks again
> > >
> > > Edwin
> > >
> > >
> > >
> > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
> > >
> > > Le lundi 7 septembre 2026 =C3=A0 22:04, Ricardo Ribalda <ribalda@chro=
mium.org> a =C3=A9crit :
> > >
> > > > Hi Edwin
> > > >
> > > > On Mon, 7 Sept 2026 at 21:39, Edwin Gatier <edwin.gatier@protonmail=
.com> wrote:
> > > > >
> > > > > Indeed the mod was not loaded sorry about that, I thought the raw=
/out of the box result would be the starting point for the log.
> > > > >
> > > > > Here are the logs with the mod loaded in.
> > > >
> > > > Could you try modifying the original patch?
> > > >
> > > > Where it says:
> > > >
> > > >  .uvc_version =3D 0x010a,
> > > >
> > > > it should say
> > > >
> > > >  .uvc_version =3D 0x0110,
> > > >
> > > >
> > > > Thanks!
> > > > >
> > > > >
> > > > >
> > > > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
> > > > >
> > > > > Le lundi 7 septembre 2026 =C3=A0 13:14, Ricardo Ribalda <ribalda@=
chromium.org> a =C3=A9crit :
> > > > >
> > > > > > Hi Edwin
> > > > > >
> > > > > > Thanks a lot for the logs.
> > > > > > This is a new one:
> > > > > > Failed to query (GET_CUR) UVC probe control : -75 (exp. 26).
> > > > > >
> > > > > > (we had before  Failed to query (GET_CUR) UVC probe control : 3=
4 (exp. 48).)
> > > > > >
> > > > > > Progress??? who knows :P
> > > > > >
> > > > > > It would help to have a usb trace...  Have you used usbmon befo=
re?
> > > > > >
> > > > > > If you get a trace, add also the dmesg output. You can use some=
thing like this
> > > > > >
> > > > > > # disconnect the camera
> > > > > > dmesg -c > /dev/null
> > > > > > rmmod uvcvideo
> > > > > > modprobe uvcvideo trace=3D0xffffffff
> > > > > > modprobe usbmon
> > > > > > # Start wireshark and start capturing on the correct port
> > > > > > # connect the camera and give it a couple of secs
> > > > > > # Stop capturing
> > > > > > dmesg > dmesg.log
> > > > > >
> > > > > > Hopefully the logs will give us something to work with... But b=
ear in
> > > > > > mind that we are only looking at it from "uvc" perspective. The
> > > > > > high-speed vs super-speed problem will not be solved.
> > > > > >
> > > > > > Regards!
> > > > > > --
> > > > > > Ricardo Ribalda
> > > > > >
> > > > > > On Sun, 6 Sept 2026 at 18:23, Edwin Gatier <edwin.gatier@proton=
mail.com> wrote:
> > > > > > >
> > > > > > > Hello,
> > > > > > >
> > > > > > > Sorry for the delay, I had other matter to attend to and also=
 it's my first time making drivers so i had some issues making it work.
> > > > > > > Thank you for the quick response.
> > > > > > > I added the quirk but it still does not work, the quirk is ta=
ken into account (forcing v 1.0a) but the probe still returns a mismatch le=
ngth error.
> > > > > > > A "very usefull" comment on a reddit thread I openned indicat=
es that the card is suppose to behave like a usb hub with a uvc device as o=
ne of the device of the hub, but the list of usb devices connected to the p=
c does only show one device and dmesg shows it is recognised (falsly) as a =
1.5 uvc device.
> > > > > > >
> > > > > > > How do you recon we/I could go on from this point on ?
> > > > > > >
> > > > > > > Regards
> > > > > > >
> > > > > > > Edwin
> > > > > > >
> > > > > > >
> > > > > > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
> > > > > > >
> > > > > > > Le mardi 1 septembre 2026 =C3=A0 08:45, Ricardo Ribalda <riba=
lda@chromium.org> a =C3=A9crit :
> > > > > > >
> > > > > > > > Hi Edwin
> > > > > > > >
> > > > > > > > Looks like your camera is not following the spec. It says t=
hat it is
> > > > > > > > uvc 1.5 but behaves like 1.1
> > > > > > > >
> > > > > > > >
> > > > > > > > Could you try if this patch fixes it for you?
> > > > > > > >
> > > > > > > > Regards!
> > > > > > > >
> > > > > > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > index e289cc71ba98..615cebb67508 100644
> > > > > > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > @@ -2851,6 +2851,17 @@ static const struct usb_device_id uv=
c_ids[] =3D {
> > > > > > > >           .bInterfaceSubClass   =3D 1,
> > > > > > > >           .bInterfaceProtocol   =3D 0,
> > > > > > > >           .driver_info          =3D (kernel_ulong_t)&uvc_qu=
irk_fix_bandwidth },
> > > > > > > > +       /* Avermedia GC515 */
> > > > > > > > +       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEV=
ICE
> > > > > > > > +                               | USB_DEVICE_ID_MATCH_INT_I=
NFO,
> > > > > > > > +         .idVendor             =3D 0x07ca,
> > > > > > > > +         .idProduct            =3D 0x1515,
> > > > > > > > +         .bInterfaceClass      =3D USB_CLASS_VIDEO,
> > > > > > > > +         .bInterfaceSubClass   =3D 1,
> > > > > > > > +         .bInterfaceProtocol   =3D UVC_PC_PROTOCOL_15,
> > > > > > > > +         .driver_info          =3D (kernel_ulong_t)&(const=
 struct
> > > > > > > > uvc_device_info){
> > > > > > > > +               .uvc_version =3D 0x010a,
> > > > > > > > +         } },
> > > > > > > >         /* ViMicro Vega */
> > > > > > > >         { .match_flags          =3D USB_DEVICE_ID_MATCH_DEV=
ICE
> > > > > > > >                                 | USB_DEVICE_ID_MATCH_INT_I=
NFO,
> > > > > > > >
> > > > > > > > On Tue, 1 Sept 2026 at 02:45, Edwin Gatier <edwin.gatier@pr=
otonmail.com> wrote:
> > > > > > > > >
> > > > > > > > > Hello,
> > > > > > > > >
> > > > > > > > > I'm trying to use the usb capture card x'tra go from aver=
media but the uvc implementation is not very good from the vendor. The card=
 falls back at usb 2 speed (high speed detected) while it works fine on win=
dows with usb3 speed (super speed) which it as been designed for. Video str=
eam should be 1080p120 and h265 compressed by the card.
> > > > > > > > >
> > > > > > > > > Plugging the card does nothing, the card is not recognize=
d at all as seen in the dmesg log, and subsequently is not mounted in /dev/=
videoX.
> > > > > > > > > I tried some quirks but didn't manage to pass the probe.
> > > > > > > > >
> > > > > > > > > You of course can contact me for more information.
> > > > > > > > >
> > > > > > > > > I'm on linux 7.2.2-1-cachyos with Wayland and have a dual=
boot with windows 11 on separate drive to update and test the capture card.
> > > > > > > > >
> > > > > > > > > Best Regards
> > > > > > > > >
> > > > > > > > > Edwin GATIER
> > > > > > > > >
> > > > > > > > > Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail=
.
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > --
> > > > > > > > Ricardo Ribalda
> > > > > > > >
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
>=20
>=20
>=20
> --
> Ricardo Ribalda
> 
--b1=_xTGIZnIGr6fBU5XUCzXWqHutpweoe9FcKEdYXjR8ZM
Content-Type: text/x-log; name=dmesg.log
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=dmesg.log

WyA0MDQzLjE1MDc1N10gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwNDMuMTUw
NzY3XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA0My4xNTA5MTFdIHV2
Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDQzLjE1MDkxNF0gdXZjdmlkZW8gNy0z
OjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwNDMuMTUxMDM2XSB1dmN2aWRlbyA3LTM6MS4wOiB1
dmNfdjRsMl9vcGVuClsgNDA0My4xNTEwMzldIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3Jl
bGVhc2UKWyA0MDQ2LjE1MDg1Nl0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQw
NDYuMTUwODY1XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA0Ni4xNTEw
MDldIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDQ2LjE1MTAxMl0gdXZjdmlk
ZW8gNy0zOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwNDYuMTUxMTM2XSB1dmN2aWRlbyA3LTM6
MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA0Ni4xNTExMzldIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192
NGwyX3JlbGVhc2UKWyA0MDQ5LjA4MzUzNV0gdXNiY29yZTogZGVyZWdpc3RlcmluZyBpbnRlcmZh
Y2UgZHJpdmVyIHV2Y3ZpZGVvClsgNDA0OS4xNzYyOTNdIHV2Y3ZpZGVvIDctMzoxLjA6IFJlc3Vt
aW5nIGludGVyZmFjZSAwClsgNDA0OS4xNzYyOTldIHV2Y3ZpZGVvIDctMzoxLjA6IFJlc3VtaW5n
IGludGVyZmFjZSAxClsgNDA3Mi4xMjI2NzhdIHV2Y3ZpZGVvIDctMzoxLjA6IFByb2JpbmcgZ2Vu
ZXJpYyBVVkMgZGV2aWNlIDMKWyA0MDcyLjEyMzI1N10gdXZjdmlkZW8gNy0zOjEuMDogRm91bmQg
Zm9ybWF0IE1KUEcgbGl0dGxlLWVuZGlhbiAoMHg0NzUwNGE0ZCkKWyA0MDcyLjEyMzI2Ml0gdXZj
dmlkZW8gNy0zOjEuMDogLSAxOTIweDEwODAgKDMwLjAgZnBzKQpbIDQwNzIuMTIzMjY1XSB1dmN2
aWRlbyA3LTM6MS4wOiAtIDEyODB4OTYwICgzMC4wIGZwcykKWyA0MDcyLjEyMzI2OF0gdXZjdmlk
ZW8gNy0zOjEuMDogLSAxMjgweDcyMCAoMzAuMCBmcHMpClsgNDA3Mi4xMjMyNzBdIHV2Y3ZpZGVv
IDctMzoxLjA6IC0gODAweDYwMCAoMzAuMCBmcHMpClsgNDA3Mi4xMjMyNzJdIHV2Y3ZpZGVvIDct
MzoxLjA6IC0gNjQweDQ4MCAoMzAuMCBmcHMpClsgNDA3Mi4xMjMyNzRdIHV2Y3ZpZGVvIDctMzox
LjA6IC0gNjQweDMyMCAoMzAuMCBmcHMpClsgNDA3Mi4xMjMyNzddIHV2Y3ZpZGVvIDctMzoxLjA6
IEZvdW5kIGZvcm1hdCBZVVlWIGxpdHRsZS1lbmRpYW4gKDB4NTY1OTU1NTkpClsgNDA3Mi4xMjMy
NzldIHV2Y3ZpZGVvIDctMzoxLjA6IC0gMTkyMHgxMDgwICg1LjAgZnBzKQpbIDQwNzIuMTIzMjgy
XSB1dmN2aWRlbyA3LTM6MS4wOiAtIDEyODB4OTYwICg1LjAgZnBzKQpbIDQwNzIuMTIzMjg0XSB1
dmN2aWRlbyA3LTM6MS4wOiAtIDEyODB4NzIwICg1LjAgZnBzKQpbIDQwNzIuMTIzMjg3XSB1dmN2
aWRlbyA3LTM6MS4wOiAtIDgwMHg2MDAgKDEwLjAgZnBzKQpbIDQwNzIuMTIzMjg5XSB1dmN2aWRl
byA3LTM6MS4wOiAtIDY0MHg0ODAgKDMwLjAgZnBzKQpbIDQwNzIuMTIzMjkxXSB1dmN2aWRlbyA3
LTM6MS4wOiAtIDY0MHgzMjAgKDMwLjAgZnBzKQpbIDQwNzIuMTIzMjk0XSB1dmN2aWRlbyA3LTM6
MS4wOiBGb3VuZCBmb3JtYXQgSDI2NCBsaXR0bGUtZW5kaWFuICgweDM0MzYzMjQ4KQpbIDQwNzIu
MTIzMjk3XSB1dmN2aWRlbyA3LTM6MS4wOiAtIDE5MjB4MTA4MCAoMzAuMCBmcHMpClsgNDA3Mi4x
MjMyOTldIHV2Y3ZpZGVvIDctMzoxLjA6IC0gMTI4MHg5NjAgKDMwLjAgZnBzKQpbIDQwNzIuMTIz
MzAxXSB1dmN2aWRlbyA3LTM6MS4wOiAtIDEyODB4NzIwICgzMC4wIGZwcykKWyA0MDcyLjEyMzQ4
NV0gdXZjdmlkZW8gNy0zOjEuMDogLSA4MDB4NjAwICgzMC4wIGZwcykKWyA0MDcyLjEyMzQ4OF0g
dXZjdmlkZW8gNy0zOjEuMDogLSA2NDB4NDgwICgzMC4wIGZwcykKWyA0MDcyLjEyMzQ5MV0gdXZj
dmlkZW8gNy0zOjEuMDogLSA2NDB4MzIwICgzMC4wIGZwcykKWyA0MDcyLjEyMzQ5N10gdXZjdmlk
ZW8gNy0zOjEuMDogRm91bmQgYSBTdGF0dXMgZW5kcG9pbnQgKGFkZHIgODEpClsgNDA3Mi4xMjM1
MDFdIHV2Y3ZpZGVvIDctMzoxLjA6IEZvdW5kIFVWQyAxLjAwIGRldmljZSBIRCBXZWIgQ2FtZXJh
ICgwNWEzOjkzMzEpClsgNDA3Mi4xMjM1MDVdIHV2Y3ZpZGVvIDctMzoxLjA6IFNjYW5uaW5nIFVW
QyBjaGFpbjoKWyA0MDcyLjEyMzUwN10gIE9UIDMyNzcxIDwtIFBVIDIgPC0gSVQgMQpbIDQwNzIu
MTIzNTEyXSB1dmN2aWRlbyA3LTM6MS4wOiBGb3VuZCBhIHZhbGlkIHZpZGVvIGNoYWluICgxIC0+
IDMyNzcxKQpbIDQwNzIuMTIzNTE2XSB1dmN2aWRlbyA3LTM6MS4wOiBBZGRlZCBjb250cm9sIDAw
MDAwMDAwLTAwMDAtMDAwMC0wMDAwLTAwMDAwMDAwMDEwMS8yIHRvIGRldmljZSAzIGVudGl0eSAy
ClsgNDA3Mi4xMjcwNDFdIHV2Y3ZpZGVvIDctMzoxLjA6IEFkZGluZyBtYXBwaW5nICdCcmlnaHRu
ZXNzJyB0byBjb250cm9sIDAwMDAwMDAwLTAwMDAtMDAwMC0wMDAwLTAwMDAwMDAwMDEwMS8yClsg
NDA3Mi4xMjcwNDZdIHV2Y3ZpZGVvIDctMzoxLjA6IEFkZGVkIGNvbnRyb2wgMDAwMDAwMDAtMDAw
MC0wMDAwLTAwMDAtMDAwMDAwMDAwMTAxLzMgdG8gZGV2aWNlIDMgZW50aXR5IDIKWyA0MDcyLjEz
MjI5NF0gdXZjdmlkZW8gNy0zOjEuMDogQWRkaW5nIG1hcHBpbmcgJ0NvbnRyYXN0JyB0byBjb250
cm9sIDAwMDAwMDAwLTAwMDAtMDAwMC0wMDAwLTAwMDAwMDAwMDEwMS8zClsgNDA3Mi4xMzIyOTld
IHV2Y3ZpZGVvIDctMzoxLjA6IEFkZGVkIGNvbnRyb2wgMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAt
MDAwMDAwMDAwMTAxLzYgdG8gZGV2aWNlIDMgZW50aXR5IDIKWyA0MDcyLjEzNzY2NV0gdXZjdmlk
ZW8gNy0zOjEuMDogQWRkaW5nIG1hcHBpbmcgJ0h1ZScgdG8gY29udHJvbCAwMDAwMDAwMC0wMDAw
LTAwMDAtMDAwMC0wMDAwMDAwMDAxMDEvNgpbIDQwNzIuMTM3NjY5XSB1dmN2aWRlbyA3LTM6MS4w
OiBBZGRlZCBjb250cm9sIDAwMDAwMDAwLTAwMDAtMDAwMC0wMDAwLTAwMDAwMDAwMDEwMS83IHRv
IGRldmljZSAzIGVudGl0eSAyClsgNDA3Mi4xNDI5MTRdIHV2Y3ZpZGVvIDctMzoxLjA6IEFkZGlu
ZyBtYXBwaW5nICdTYXR1cmF0aW9uJyB0byBjb250cm9sIDAwMDAwMDAwLTAwMDAtMDAwMC0wMDAw
LTAwMDAwMDAwMDEwMS83ClsgNDA3Mi4xNDI5MThdIHV2Y3ZpZGVvIDctMzoxLjA6IEFkZGVkIGNv
bnRyb2wgMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAtMDAwMDAwMDAwMTAxLzggdG8gZGV2aWNlIDMg
ZW50aXR5IDIKWyA0MDcyLjE0ODI5MV0gdXZjdmlkZW8gNy0zOjEuMDogQWRkaW5nIG1hcHBpbmcg
J1NoYXJwbmVzcycgdG8gY29udHJvbCAwMDAwMDAwMC0wMDAwLTAwMDAtMDAwMC0wMDAwMDAwMDAx
MDEvOApbIDQwNzIuMTQ4Mjk1XSB1dmN2aWRlbyA3LTM6MS4wOiBBZGRlZCBjb250cm9sIDAwMDAw
MDAwLTAwMDAtMDAwMC0wMDAwLTAwMDAwMDAwMDEwMS85IHRvIGRldmljZSAzIGVudGl0eSAyClsg
NDA3Mi4xNjM5MjBdIHV2Y3ZpZGVvIDctMzoxLjA6IENvbnRyb2wgZXJyb3IgNgpbIDQwNzIuMTYz
OTI0XSB1dmN2aWRlbyA3LTM6MS4wOiBBZGRpbmcgbWFwcGluZyAnR2FtbWEnIHRvIGNvbnRyb2wg
MDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAtMDAwMDAwMDAwMTAxLzkKWyA0MDcyLjE2MzkyOV0gdXZj
dmlkZW8gNy0zOjEuMDogQWRkZWQgY29udHJvbCAwMDAwMDAwMC0wMDAwLTAwMDAtMDAwMC0wMDAw
MDAwMDAxMDEvMTAgdG8gZGV2aWNlIDMgZW50aXR5IDIKWyA0MDcyLjE2OTE3MF0gdXZjdmlkZW8g
Ny0zOjEuMDogQWRkaW5nIG1hcHBpbmcgJ1doaXRlIEJhbGFuY2UgVGVtcGVyYXR1cmUnIHRvIGNv
bnRyb2wgMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAtMDAwMDAwMDAwMTAxLzEwClsgNDA3Mi4xNjkx
NzZdIHV2Y3ZpZGVvIDctMzoxLjA6IEFkZGVkIGNvbnRyb2wgMDAwMDAwMDAtMDAwMC0wMDAwLTAw
MDAtMDAwMDAwMDAwMTAxLzEgdG8gZGV2aWNlIDMgZW50aXR5IDIKWyA0MDcyLjE3NDQxNl0gdXZj
dmlkZW8gNy0zOjEuMDogQWRkaW5nIG1hcHBpbmcgJ0JhY2tsaWdodCBDb21wZW5zYXRpb24nIHRv
IGNvbnRyb2wgMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAtMDAwMDAwMDAwMTAxLzEKWyA0MDcyLjE3
NDQyMV0gdXZjdmlkZW8gNy0zOjEuMDogQWRkZWQgY29udHJvbCAwMDAwMDAwMC0wMDAwLTAwMDAt
MDAwMC0wMDAwMDAwMDAxMDEvNCB0byBkZXZpY2UgMyBlbnRpdHkgMgpbIDQwNzIuMTkwNDE1XSB1
dmN2aWRlbyA3LTM6MS4wOiBDb250cm9sIGVycm9yIDYKWyA0MDcyLjE5MDQxOV0gdXZjdmlkZW8g
Ny0zOjEuMDogQWRkaW5nIG1hcHBpbmcgJ0dhaW4nIHRvIGNvbnRyb2wgMDAwMDAwMDAtMDAwMC0w
MDAwLTAwMDAtMDAwMDAwMDAwMTAxLzQKWyA0MDcyLjE5MDQyMl0gdXZjdmlkZW8gNy0zOjEuMDog
QWRkZWQgY29udHJvbCAwMDAwMDAwMC0wMDAwLTAwMDAtMDAwMC0wMDAwMDAwMDAxMDEvNSB0byBk
ZXZpY2UgMyBlbnRpdHkgMgpbIDQwNzIuMjE3MDQyXSB1dmN2aWRlbyA3LTM6MS4wOiBBZGRpbmcg
bWFwcGluZyAnUG93ZXIgTGluZSBGcmVxdWVuY3knIHRvIGNvbnRyb2wgMDAwMDAwMDAtMDAwMC0w
MDAwLTAwMDAtMDAwMDAwMDAwMTAxLzUKWyA0MDcyLjIxNzA0Nl0gdXZjdmlkZW8gNy0zOjEuMDog
QWRkZWQgY29udHJvbCAwMDAwMDAwMC0wMDAwLTAwMDAtMDAwMC0wMDAwMDAwMDAxMDEvMTEgdG8g
ZGV2aWNlIDMgZW50aXR5IDIKWyA0MDcyLjIzODQxN10gdXZjdmlkZW8gNy0zOjEuMDogQ29udHJv
bCBlcnJvciA3ClsgNDA3Mi4yMzg0MjJdIHV2Y3ZpZGVvIDctMzoxLjA6IEFkZGluZyBtYXBwaW5n
ICdXaGl0ZSBCYWxhbmNlLCBBdXRvbWF0aWMnIHRvIGNvbnRyb2wgMDAwMDAwMDAtMDAwMC0wMDAw
LTAwMDAtMDAwMDAwMDAwMTAxLzExClsgNDA3Mi4yMzg0MjZdIHV2Y3ZpZGVvIDctMzoxLjA6IEFk
ZGVkIGNvbnRyb2wgMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAtMDAwMDAwMDAwMDAxLzIgdG8gZGV2
aWNlIDMgZW50aXR5IDEKWyA0MDcyLjI0MzY3MF0gdXZjdmlkZW8gNy0zOjEuMDogQWRkaW5nIG1h
cHBpbmcgJ0F1dG8gRXhwb3N1cmUnIHRvIGNvbnRyb2wgMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAt
MDAwMDAwMDAwMDAxLzIKWyA0MDcyLjI2NTU3OF0gaW5wdXQ6IEhEIFdlYiBDYW1lcmE6IEhEIFdl
YiBDYW1lcmEgYXMgL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjA4LjEvMDAwMDoyOTowMC4z
L3VzYjcvNy0zLzctMzoxLjAvaW5wdXQvaW5wdXQ0MQpbIDQwNzIuMjY2Mjc4XSB1dmN2aWRlbyA3
LTM6MS4wOiBVVkMgZGV2aWNlIGluaXRpYWxpemVkClsgNDA3Mi4yNjY1MTVdIHVzYmNvcmU6IHJl
Z2lzdGVyZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgdXZjdmlkZW8KWyA0MDcyLjI3MjM3NV0gdXZj
dmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwNzIuMjcyMzk4XSB1dmN2aWRlbyA3LTM6
MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA3Mi4yNzUzOTddIHV2Y3ZpZGVvIDctMzoxLjA6IHV2
Y192NGwyX29wZW4KWyA0MDcyLjI3NTQxMV0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfcmVs
ZWFzZQpbIDQwNzIuMjc1NjA0XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA3
Mi4yNzU3NTJdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDcyLjMwODI1
OV0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwNzIuMzA4Mzg1XSB1dmN2aWRl
byA3LTM6MS4wOiBDb250cm9sIDB4MDA5YTA5MDggbm90IGZvdW5kClsgNDA3Mi4zMDg0NTNdIHV2
Y3ZpZGVvIDctMzoxLjA6IENvbnRyb2wgMHgwMDlhMDkwOSBub3QgZm91bmQKWyA0MDcyLjMwODUy
Nl0gdXZjdmlkZW8gNy0zOjEuMDogQ29udHJvbCAweDAwOWEwOTBkIG5vdCBmb3VuZApbIDQwNzIu
MzA4NjA3XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA3Mi4zMDg4OTFd
IHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDcyLjMwODk3NV0gdXZjdmlkZW8g
Ny0zOjEuMDogQ29udHJvbCAweDAwOWEwOTA4IG5vdCBmb3VuZApbIDQwNzIuMzA5MDM3XSB1dmN2
aWRlbyA3LTM6MS4wOiBDb250cm9sIDB4MDA5YTA5MDkgbm90IGZvdW5kClsgNDA3Mi4zMDkxMThd
IHV2Y3ZpZGVvIDctMzoxLjA6IENvbnRyb2wgMHgwMDlhMDkwZCBub3QgZm91bmQKWyA0MDcyLjMw
OTE5NF0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwNzMuMTUxNjIwXSB1
dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA3My4xNTE2MjldIHV2Y3ZpZGVvIDct
MzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDczLjE1MTc3NF0gdXZjdmlkZW8gNy0zOjEuMDog
dXZjX3Y0bDJfb3BlbgpbIDQwNzMuMTUxNzc3XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9y
ZWxlYXNlClsgNDA3My4xNTE5MjJdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX29wZW4KWyA0
MDczLjE1MTkyN10gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwNzMuMTUz
MjU0XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA3My4xNTMzNzJdIHV2Y3Zp
ZGVvIDctMzoxLjA6IENvbnRyb2wgMHgwMDlhMDkwOCBub3QgZm91bmQKWyA0MDczLjE1MzQ0MF0g
dXZjdmlkZW8gNy0zOjEuMDogQ29udHJvbCAweDAwOWEwOTA5IG5vdCBmb3VuZApbIDQwNzMuMTUz
NTE4XSB1dmN2aWRlbyA3LTM6MS4wOiBDb250cm9sIDB4MDA5YTA5MGQgbm90IGZvdW5kClsgNDA3
My4xNTM1OTNdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDczLjI3NzEz
NV0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwNzMuMjc3MTQ4XSB1dmN2aWRl
byA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA3My4yNzc0ODhdIHV2Y3ZpZGVvIDctMzox
LjA6IHV2Y192NGwyX29wZW4KWyA0MDczLjM4MjY2Nl0gdXZjdmlkZW8gNy0zOjEuMDogQ29udHJv
bCBlcnJvciA2ClsgNDA3My4zOTg0MThdIHV2Y3ZpZGVvIDctMzoxLjA6IENvbnRyb2wgZXJyb3Ig
NgpbIDQwNzMuMzk4NDI1XSB1dmN2aWRlbyA3LTM6MS4wOiBVVkMgbm9uIGNvbXBsaWFuY2U6IHBl
cm1hbmVudGx5IGRpc2FibGluZyBjb250cm9sIDk4MDkxMCAoR2FtbWEpLCBkdWUgdG8gZXJyb3Ig
LTUKWyA0MDczLjQxNDA0NF0gdXZjdmlkZW8gNy0zOjEuMDogQ29udHJvbCBlcnJvciA2ClsgNDA3
My40Mjk3OTFdIHV2Y3ZpZGVvIDctMzoxLjA6IENvbnRyb2wgZXJyb3IgNgpbIDQwNzMuNDI5Nzk4
XSB1dmN2aWRlbyA3LTM6MS4wOiBVVkMgbm9uIGNvbXBsaWFuY2U6IHBlcm1hbmVudGx5IGRpc2Fi
bGluZyBjb250cm9sIDk4MDkxMyAoR2FpbiksIGR1ZSB0byBlcnJvciAtNQpbIDQwNzMuNTE1Mjcx
XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA3My41MTUyOTddIHV2Y3Zp
ZGVvIDctMzoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDczLjU2MzI2Ml0gdXZjdmlkZW8gNy0zOjEu
MDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwNzMuNTYzMzAzXSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNf
djRsMl9vcGVuClsgNDA3My41NjQxMzBdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVh
c2UKWyA0MDczLjU2NDE1MF0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwNzMu
NTY0MTY0XSB1dmN2aWRlbyA3LTM6MS4wOiBUcnlpbmcgZm9ybWF0IDB4NDc1MDRhNGQgKE1KUEcp
OiAxOTIweDEwODAKWyA0MDczLjU2NDE2OF0gdXZjdmlkZW8gNy0zOjEuMDogVXNpbmcgZGVmYXVs
dCBmcmFtZSBpbnRlcnZhbCAzMzMzMy4zIHVzICgzMC4wIGZwcykKWyA0MDczLjYwMDE5Nl0gdXZj
dmlkZW8gNy0zOjEuMDogVHJ5aW5nIGZvcm1hdCAweDQ3NTA0YTRkIChNSlBHKTogMTI4MHg5NjAK
WyA0MDczLjYwMDIwOV0gdXZjdmlkZW8gNy0zOjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBpbnRl
cnZhbCAzMzMzMy4zIHVzICgzMC4wIGZwcykKWyA0MDczLjYzNzUyNl0gdXZjdmlkZW8gNy0zOjEu
MDogVHJ5aW5nIGZvcm1hdCAweDQ3NTA0YTRkIChNSlBHKTogMTI4MHg3MjAKWyA0MDczLjYzNzUz
M10gdXZjdmlkZW8gNy0zOjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBpbnRlcnZhbCAzMzMzMy4z
IHVzICgzMC4wIGZwcykKWyA0MDczLjY3NDUxOV0gdXZjdmlkZW8gNy0zOjEuMDogVHJ5aW5nIGZv
cm1hdCAweDQ3NTA0YTRkIChNSlBHKTogODAweDYwMApbIDQwNzMuNjc0NTI2XSB1dmN2aWRlbyA3
LTM6MS4wOiBVc2luZyBkZWZhdWx0IGZyYW1lIGludGVydmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBz
KQpbIDQwNzMuNzExNDQ3XSB1dmN2aWRlbyA3LTM6MS4wOiBUcnlpbmcgZm9ybWF0IDB4NDc1MDRh
NGQgKE1KUEcpOiA2NDB4NDgwClsgNDA3My43MTE0NTRdIHV2Y3ZpZGVvIDctMzoxLjA6IFVzaW5n
IGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMzMzMzMuMyB1cyAoMzAuMCBmcHMpClsgNDA3My43NDg1
MTddIHV2Y3ZpZGVvIDctMzoxLjA6IFRyeWluZyBmb3JtYXQgMHg0NzUwNGE0ZCAoTUpQRyk6IDY0
MHgzMjAKWyA0MDczLjc0ODUyM10gdXZjdmlkZW8gNy0zOjEuMDogVXNpbmcgZGVmYXVsdCBmcmFt
ZSBpbnRlcnZhbCAzMzMzMy4zIHVzICgzMC4wIGZwcykKWyA0MDczLjc4NTU3Ml0gdXZjdmlkZW8g
Ny0zOjEuMDogVHJ5aW5nIGZvcm1hdCAweDU2NTk1NTU5IChZVVlWKTogMTkyMHgxMDgwClsgNDA3
My43ODU1ODBdIHV2Y3ZpZGVvIDctMzoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwg
MTk5OTk5LjggdXMgKDUuMCBmcHMpClsgNDA3My44MjI3NzBdIHV2Y3ZpZGVvIDctMzoxLjA6IFRy
eWluZyBmb3JtYXQgMHg1NjU5NTU1OSAoWVVZVik6IDEyODB4OTYwClsgNDA3My44MjI3NzddIHV2
Y3ZpZGVvIDctMzoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMTk5OTk5LjggdXMg
KDUuMCBmcHMpClsgNDA3My44NTk4MTVdIHV2Y3ZpZGVvIDctMzoxLjA6IFRyeWluZyBmb3JtYXQg
MHg1NjU5NTU1OSAoWVVZVik6IDEyODB4NzIwClsgNDA3My44NTk4MjJdIHV2Y3ZpZGVvIDctMzox
LjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMTk5OTk5LjggdXMgKDUuMCBmcHMpClsg
NDA3My44OTY4MjVdIHV2Y3ZpZGVvIDctMzoxLjA6IFRyeWluZyBmb3JtYXQgMHg1NjU5NTU1OSAo
WVVZVik6IDgwMHg2MDAKWyA0MDczLjg5NjgzMl0gdXZjdmlkZW8gNy0zOjEuMDogVXNpbmcgZGVm
YXVsdCBmcmFtZSBpbnRlcnZhbCA5OTk5OS45IHVzICgxMC4wIGZwcykKWyA0MDczLjkzNDAzMl0g
dXZjdmlkZW8gNy0zOjEuMDogVHJ5aW5nIGZvcm1hdCAweDU2NTk1NTU5IChZVVlWKTogNjQweDQ4
MApbIDQwNzMuOTM0MDM5XSB1dmN2aWRlbyA3LTM6MS4wOiBVc2luZyBkZWZhdWx0IGZyYW1lIGlu
dGVydmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBzKQpbIDQwNzMuOTcxMDcxXSB1dmN2aWRlbyA3LTM6
MS4wOiBUcnlpbmcgZm9ybWF0IDB4NTY1OTU1NTkgKFlVWVYpOiA2NDB4MzIwClsgNDA3My45NzEw
NzhdIHV2Y3ZpZGVvIDctMzoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMzMzMzMu
MyB1cyAoMzAuMCBmcHMpClsgNDA3NC4wMDgyMjJdIHV2Y3ZpZGVvIDctMzoxLjA6IFRyeWluZyBm
b3JtYXQgMHgzNDM2MzI0OCAoSDI2NCk6IDE5MjB4MTA4MApbIDQwNzQuMDA4MjI5XSB1dmN2aWRl
byA3LTM6MS4wOiBVc2luZyBkZWZhdWx0IGZyYW1lIGludGVydmFsIDMzMzMzLjMgdXMgKDMwLjAg
ZnBzKQpbIDQwNzQuMDQ1Mjc1XSB1dmN2aWRlbyA3LTM6MS4wOiBUcnlpbmcgZm9ybWF0IDB4MzQz
NjMyNDggKEgyNjQpOiAxMjgweDk2MApbIDQwNzQuMDQ1MjgyXSB1dmN2aWRlbyA3LTM6MS4wOiBV
c2luZyBkZWZhdWx0IGZyYW1lIGludGVydmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBzKQpbIDQwNzQu
MDgyMzE3XSB1dmN2aWRlbyA3LTM6MS4wOiBUcnlpbmcgZm9ybWF0IDB4MzQzNjMyNDggKEgyNjQp
OiAxMjgweDcyMApbIDQwNzQuMDgyMzI0XSB1dmN2aWRlbyA3LTM6MS4wOiBVc2luZyBkZWZhdWx0
IGZyYW1lIGludGVydmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBzKQpbIDQwNzQuMTE5NTcwXSB1dmN2
aWRlbyA3LTM6MS4wOiBUcnlpbmcgZm9ybWF0IDB4MzQzNjMyNDggKEgyNjQpOiA4MDB4NjAwClsg
NDA3NC4xMTk1NzddIHV2Y3ZpZGVvIDctMzoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2
YWwgMzMzMzMuMyB1cyAoMzAuMCBmcHMpClsgNDA3NC4xNTY2NDVdIHV2Y3ZpZGVvIDctMzoxLjA6
IFRyeWluZyBmb3JtYXQgMHgzNDM2MzI0OCAoSDI2NCk6IDY0MHg0ODAKWyA0MDc0LjE1NjY1Ml0g
dXZjdmlkZW8gNy0zOjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBpbnRlcnZhbCAzMzMzMy4zIHVz
ICgzMC4wIGZwcykKWyA0MDc0LjE5MzY5OF0gdXZjdmlkZW8gNy0zOjEuMDogVHJ5aW5nIGZvcm1h
dCAweDM0MzYzMjQ4IChIMjY0KTogNjQweDMyMApbIDQwNzQuMTkzNzA1XSB1dmN2aWRlbyA3LTM6
MS4wOiBVc2luZyBkZWZhdWx0IGZyYW1lIGludGVydmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBzKQpb
IDQwNzQuMjMwODIzXSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA3NC4y
MzEyMDhdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDc0LjI0NjQxNl0gdXZj
dmlkZW8gNy0zOjEuMDogQ29udHJvbCBlcnJvciA2ClsgNDA3NC4yNjIwNDNdIHV2Y3ZpZGVvIDct
MzoxLjA6IENvbnRyb2wgZXJyb3IgNgpbIDQwNzQuMjc3OTE4XSB1dmN2aWRlbyA3LTM6MS4wOiBD
b250cm9sIGVycm9yIDYKWyA0MDc0LjI5MzU0NF0gdXZjdmlkZW8gNy0zOjEuMDogQ29udHJvbCBl
cnJvciA2ClsgNDA3NC4yOTQ2NTNdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVhc2UK
WyA0MDc0LjI5NDY3NF0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwNzQuMjk0
Njg4XSB1dmN2aWRlbyA3LTM6MS4wOiBUcnlpbmcgZm9ybWF0IDB4NDc1MDRhNGQgKE1KUEcpOiAx
OTIweDEwODAKWyA0MDc0LjI5NDY5Ml0gdXZjdmlkZW8gNy0zOjEuMDogVXNpbmcgZGVmYXVsdCBm
cmFtZSBpbnRlcnZhbCAzMzMzMy4zIHVzICgzMC4wIGZwcykKWyA0MDc0LjMzMDYzMl0gdXZjdmlk
ZW8gNy0zOjEuMDogVHJ5aW5nIGZvcm1hdCAweDQ3NTA0YTRkIChNSlBHKTogMTI4MHg5NjAKWyA0
MDc0LjMzMDYzNl0gdXZjdmlkZW8gNy0zOjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBpbnRlcnZh
bCAzMzMzMy4zIHVzICgzMC4wIGZwcykKWyA0MDc0LjM2NzY4MF0gdXZjdmlkZW8gNy0zOjEuMDog
VHJ5aW5nIGZvcm1hdCAweDQ3NTA0YTRkIChNSlBHKTogMTI4MHg3MjAKWyA0MDc0LjM2NzY4NV0g
dXZjdmlkZW8gNy0zOjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBpbnRlcnZhbCAzMzMzMy4zIHVz
ICgzMC4wIGZwcykKWyA0MDc0LjQwNDg4N10gdXZjdmlkZW8gNy0zOjEuMDogVHJ5aW5nIGZvcm1h
dCAweDQ3NTA0YTRkIChNSlBHKTogODAweDYwMApbIDQwNzQuNDA0ODkxXSB1dmN2aWRlbyA3LTM6
MS4wOiBVc2luZyBkZWZhdWx0IGZyYW1lIGludGVydmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBzKQpb
IDQwNzQuNDQxOTQ0XSB1dmN2aWRlbyA3LTM6MS4wOiBUcnlpbmcgZm9ybWF0IDB4NDc1MDRhNGQg
KE1KUEcpOiA2NDB4NDgwClsgNDA3NC40NDE5NTFdIHV2Y3ZpZGVvIDctMzoxLjA6IFVzaW5nIGRl
ZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMzMzMzMuMyB1cyAoMzAuMCBmcHMpClsgNDA3NC40NzkwMDld
IHV2Y3ZpZGVvIDctMzoxLjA6IFRyeWluZyBmb3JtYXQgMHg0NzUwNGE0ZCAoTUpQRyk6IDY0MHgz
MjAKWyA0MDc0LjQ3OTAxM10gdXZjdmlkZW8gNy0zOjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBp
bnRlcnZhbCAzMzMzMy4zIHVzICgzMC4wIGZwcykKWyA0MDc0LjUxNjA1OF0gdXZjdmlkZW8gNy0z
OjEuMDogVHJ5aW5nIGZvcm1hdCAweDU2NTk1NTU5IChZVVlWKTogMTkyMHgxMDgwClsgNDA3NC41
MTYwNjNdIHV2Y3ZpZGVvIDctMzoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMTk5
OTk5LjggdXMgKDUuMCBmcHMpClsgNDA3NC41NTMxODBdIHV2Y3ZpZGVvIDctMzoxLjA6IFRyeWlu
ZyBmb3JtYXQgMHg1NjU5NTU1OSAoWVVZVik6IDEyODB4OTYwClsgNDA3NC41NTMxODVdIHV2Y3Zp
ZGVvIDctMzoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMTk5OTk5LjggdXMgKDUu
MCBmcHMpClsgNDA3NC41OTAyNjJdIHV2Y3ZpZGVvIDctMzoxLjA6IFRyeWluZyBmb3JtYXQgMHg1
NjU5NTU1OSAoWVVZVik6IDEyODB4NzIwClsgNDA3NC41OTAyNjddIHV2Y3ZpZGVvIDctMzoxLjA6
IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMTk5OTk5LjggdXMgKDUuMCBmcHMpClsgNDA3
NC42MjczMTFdIHV2Y3ZpZGVvIDctMzoxLjA6IFRyeWluZyBmb3JtYXQgMHg1NjU5NTU1OSAoWVVZ
Vik6IDgwMHg2MDAKWyA0MDc0LjYyNzMxNl0gdXZjdmlkZW8gNy0zOjEuMDogVXNpbmcgZGVmYXVs
dCBmcmFtZSBpbnRlcnZhbCA5OTk5OS45IHVzICgxMC4wIGZwcykKWyA0MDc0LjY2NDQzOV0gdXZj
dmlkZW8gNy0zOjEuMDogVHJ5aW5nIGZvcm1hdCAweDU2NTk1NTU5IChZVVlWKTogNjQweDQ4MApb
IDQwNzQuNjY0NDQ0XSB1dmN2aWRlbyA3LTM6MS4wOiBVc2luZyBkZWZhdWx0IGZyYW1lIGludGVy
dmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBzKQpbIDQwNzQuNzAxNjM0XSB1dmN2aWRlbyA3LTM6MS4w
OiBUcnlpbmcgZm9ybWF0IDB4NTY1OTU1NTkgKFlVWVYpOiA2NDB4MzIwClsgNDA3NC43MDE2Mzhd
IHV2Y3ZpZGVvIDctMzoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMzMzMzMuMyB1
cyAoMzAuMCBmcHMpClsgNDA3NC43Mzg2ODZdIHV2Y3ZpZGVvIDctMzoxLjA6IFRyeWluZyBmb3Jt
YXQgMHgzNDM2MzI0OCAoSDI2NCk6IDE5MjB4MTA4MApbIDQwNzQuNzM4NjkwXSB1dmN2aWRlbyA3
LTM6MS4wOiBVc2luZyBkZWZhdWx0IGZyYW1lIGludGVydmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBz
KQpbIDQwNzQuNzc1ODE4XSB1dmN2aWRlbyA3LTM6MS4wOiBUcnlpbmcgZm9ybWF0IDB4MzQzNjMy
NDggKEgyNjQpOiAxMjgweDk2MApbIDQwNzQuNzc1ODIzXSB1dmN2aWRlbyA3LTM6MS4wOiBVc2lu
ZyBkZWZhdWx0IGZyYW1lIGludGVydmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBzKQpbIDQwNzQuODEy
ODkyXSB1dmN2aWRlbyA3LTM6MS4wOiBUcnlpbmcgZm9ybWF0IDB4MzQzNjMyNDggKEgyNjQpOiAx
MjgweDcyMApbIDQwNzQuODEyODk3XSB1dmN2aWRlbyA3LTM6MS4wOiBVc2luZyBkZWZhdWx0IGZy
YW1lIGludGVydmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBzKQpbIDQwNzQuODQ5ODA3XSB1dmN2aWRl
byA3LTM6MS4wOiBUcnlpbmcgZm9ybWF0IDB4MzQzNjMyNDggKEgyNjQpOiA4MDB4NjAwClsgNDA3
NC44NDk4MTFdIHV2Y3ZpZGVvIDctMzoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwg
MzMzMzMuMyB1cyAoMzAuMCBmcHMpClsgNDA3NC44ODY5MzZdIHV2Y3ZpZGVvIDctMzoxLjA6IFRy
eWluZyBmb3JtYXQgMHgzNDM2MzI0OCAoSDI2NCk6IDY0MHg0ODAKWyA0MDc0Ljg4Njk0MV0gdXZj
dmlkZW8gNy0zOjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBpbnRlcnZhbCAzMzMzMy4zIHVzICgz
MC4wIGZwcykKWyA0MDc0LjkyNDEzMl0gdXZjdmlkZW8gNy0zOjEuMDogVHJ5aW5nIGZvcm1hdCAw
eDM0MzYzMjQ4IChIMjY0KTogNjQweDMyMApbIDQwNzQuOTI0MTM2XSB1dmN2aWRlbyA3LTM6MS4w
OiBVc2luZyBkZWZhdWx0IGZyYW1lIGludGVydmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBzKQpbIDQw
NzQuOTYxMDU0XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA3Ni4xNTE3
NTBdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDc2LjE1MTc2MV0gdXZjdmlk
ZW8gNy0zOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwNzYuMTUxOTI0XSB1dmN2aWRlbyA3LTM6
MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA3Ni4xNTE5MjddIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192
NGwyX3JlbGVhc2UKWyA0MDc2LjE1MjA4Nl0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3Bl
bgpbIDQwNzYuMTUyMDkxXSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA3
Ny4wNjU5NzBdIHV2Y3ZpZGVvIDctMzoxLjA6IFN1c3BlbmRpbmcgaW50ZXJmYWNlIDEKWyA0MDc3
LjA2NTk3N10gdXZjdmlkZW8gNy0zOjEuMDogU3VzcGVuZGluZyBpbnRlcmZhY2UgMApbIDQwNzku
MTUxOTExXSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA3OS4xNTE5MjJdIHV2
Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDc5LjE1MjA4M10gdXZjdmlkZW8g
Ny0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwNzkuMTUyMDg2XSB1dmN2aWRlbyA3LTM6MS4wOiB1
dmNfdjRsMl9yZWxlYXNlClsgNDA3OS4xNTIyMjNdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwy
X29wZW4KWyA0MDc5LjE1MjIyN10gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpb
IDQwODEuMDQ4NzA2XSB1c2IgMy0yOiBuZXcgaGlnaC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAx
MSB1c2luZyB4aGNpX2hjZApbIDQwODEuMTcyMDg2XSB1c2IgMy0yOiBOZXcgVVNCIGRldmljZSBm
b3VuZCwgaWRWZW5kb3I9MDdjYSwgaWRQcm9kdWN0PTE1MTUsIGJjZERldmljZT0gMC4xMApbIDQw
ODEuMTc2MjAzXSB1c2IgMy0yOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVj
dD0yLCBTZXJpYWxOdW1iZXI9MwpbIDQwODEuMTc2MjA3XSB1c2IgMy0yOiBQcm9kdWN0OiBYJ3Ry
YSBHbyBHQzUxNQpbIDQwODEuMTc2MjA5XSB1c2IgMy0yOiBNYW51ZmFjdHVyZXI6IEFWZXJNZWRp
YQpbIDQwODEuMTc2MjExXSB1c2IgMy0yOiBTZXJpYWxOdW1iZXI6IDUzMTMxODAwMDAyMjEKWyA0
MDgxLjE3NzAyNV0gdXZjdmlkZW8gMy0yOjEuMDogUHJvYmluZyBnZW5lcmljIFVWQyBkZXZpY2Ug
MgpbIDQwODEuMTc3MDQ3XSB1dmN2aWRlbyAzLTI6MS4wOiBGb3VuZCBmb3JtYXQgSDI2NCBsaXR0
bGUtZW5kaWFuICgweDM0MzYzMjQ4KQpbIDQwODEuMTc3MDUwXSB1dmN2aWRlbyAzLTI6MS4wOiAt
IDE5MjB4MTA4MCAoNjAuMCBmcHMpClsgNDA4MS4xNzcwNTJdIHV2Y3ZpZGVvIDMtMjoxLjA6IC0g
Mzg0MHgyMTYwICgzMC4wIGZwcykKWyA0MDgxLjE3NzA1NF0gdXZjdmlkZW8gMy0yOjEuMDogLSAy
NTYweDE0NDAgKDYwLjAgZnBzKQpbIDQwODEuMTc3MDU3XSB1dmN2aWRlbyAzLTI6MS4wOiAtIDEy
ODB4ODAwICg2MC4wIGZwcykKWyA0MDgxLjE3NzA1OV0gdXZjdmlkZW8gMy0yOjEuMDogLSAxMjgw
eDcyMCAoNjAuMCBmcHMpClsgNDA4MS4xNzcwNjFdIHV2Y3ZpZGVvIDMtMjoxLjA6IC0gNzIweDU3
NiAoNTAuMCBmcHMpClsgNDA4MS4xNzcwNjNdIHV2Y3ZpZGVvIDMtMjoxLjA6IC0gNzIweDQ4MCAo
NjAuMCBmcHMpClsgNDA4MS4xNzcwNjVdIHV2Y3ZpZGVvIDMtMjoxLjA6IC0gNjQweDQ4MCAoNjAu
MCBmcHMpClsgNDA4MS4xNzcwNjddIHV2Y3ZpZGVvIDMtMjoxLjA6IEZvdW5kIGZvcm1hdCBIRVZD
IGxpdHRsZS1lbmRpYW4gKDB4NDM1NjQ1NDgpClsgNDA4MS4xNzcwNjldIHV2Y3ZpZGVvIDMtMjox
LjA6IC0gMTkyMHgxMDgwICg2MC4wIGZwcykKWyA0MDgxLjE3NzA3MV0gdXZjdmlkZW8gMy0yOjEu
MDogLSAzODQweDIxNjAgKDMwLjAgZnBzKQpbIDQwODEuMTc3MDczXSB1dmN2aWRlbyAzLTI6MS4w
OiAtIDI1NjB4MTQ0MCAoNjAuMCBmcHMpClsgNDA4MS4xNzcwNzVdIHV2Y3ZpZGVvIDMtMjoxLjA6
IC0gMTI4MHg4MDAgKDYwLjAgZnBzKQpbIDQwODEuMTc3MDc3XSB1dmN2aWRlbyAzLTI6MS4wOiAt
IDEyODB4NzIwICg2MC4wIGZwcykKWyA0MDgxLjE3NzA3OV0gdXZjdmlkZW8gMy0yOjEuMDogLSA3
MjB4NTc2ICg1MC4wIGZwcykKWyA0MDgxLjE3NzA4MV0gdXZjdmlkZW8gMy0yOjEuMDogLSA3MjB4
NDgwICg2MC4wIGZwcykKWyA0MDgxLjE3NzA4Ml0gdXZjdmlkZW8gMy0yOjEuMDogLSA2NDB4NDgw
ICg2MC4wIGZwcykKWyA0MDgxLjE3NzA4NF0gdXZjdmlkZW8gMy0yOjEuMDogRm91bmQgZm9ybWF0
IE1KUEcgbGl0dGxlLWVuZGlhbiAoMHg0NzUwNGE0ZCkKWyA0MDgxLjE3NzA4Nl0gdXZjdmlkZW8g
My0yOjEuMDogLSAxOTIweDEwODAgKDYwLjAgZnBzKQpbIDQwODEuMTc3MDkzXSB1dmN2aWRlbyAz
LTI6MS4wOiBGb3VuZCBhIFN0YXR1cyBlbmRwb2ludCAoYWRkciA4NSkKWyA0MDgxLjE3NzA5Nl0g
dXZjdmlkZW8gMy0yOjEuMDogRm91bmQgVVZDIDEuNTAgZGV2aWNlIFgndHJhIEdvIEdDNTE1ICgw
N2NhOjE1MTUpClsgNDA4MS4xNzcwOTldIHV2Y3ZpZGVvIDMtMjoxLjA6IFNjYW5uaW5nIFVWQyBj
aGFpbjoKWyA0MDgxLjE3NzEwMV0gIE9UIDMyNzcwIDwtIFBVIDQgKC0+IFhVIDUpIDwtIFNVIDMg
PC0gSVQgMQpbIDQwODEuMTc3MTA5XSB1dmN2aWRlbyAzLTI6MS4wOiBGb3VuZCBhIHZhbGlkIHZp
ZGVvIGNoYWluICgxIC0+IDMyNzcwKQpbIDQwODEuMTc3ODMwXSB1dmN2aWRlbyAzLTI6MS4xOiBV
VkMgbm9uIGNvbXBsaWFuY2U6IFF1ZXJ5IChHRVRfREVGKSBVVkMgcHJvYmUgY29udHJvbCBoYWQg
YSBzaXplIG9mIDM0IGluc3RlYWQgb2YgNDguClsgNDA4MS4xNzkzNDJdIHV2Y3ZpZGVvIDMtMjox
LjA6IFVWQyBkZXZpY2UgaW5pdGlhbGl6ZWQKWyA0MDgxLjE4MTY2Ml0gdXNiIDMtMjogMzoxOiBj
YW5ub3QgZ2V0IGZyZXEgYXQgZXAgMHg4MwpbIDQwODEuMTg2ODI2XSB1c2IgMy0yOiBXYXJuaW5n
ISBVbmxpa2VseSBzbWFsbCB2b2x1bWUgcmFuZ2UgKD05OSksIGxpbmVhciB2b2x1bWUgb3IgY3Vz
dG9tIGN1cnZlPwpbIDQwODEuMTg2ODI5XSB1c2IgMy0yOiBbM10gRlUgW0RpZ2l0YWwgSW4gQ2Fw
dHVyZSBWb2x1bWVdIGNoID0gMSwgdmFsID0gMS8xMDAvMQpbIDQwODEuMjA0MzU2XSB1dmN2aWRl
byAzLTI6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA4MS4yMDQzNzZdIHV2Y3ZpZGVvIDMtMjoxLjA6
IHV2Y192NGwyX3JlbGVhc2UKWyA0MDgxLjIwNzM1OF0gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0
bDJfb3BlbgpbIDQwODEuMjA3MzcxXSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9yZWxlYXNl
ClsgNDA4MS4yMDc2NzddIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDgxLjIw
Nzg0N10gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwODEuMjQwMjc2XSB1
c2IgMy0yOiAzOjE6IGNhbm5vdCBnZXQgZnJlcSBhdCBlcCAweDgzClsgNDA4MS4yNDA2OTJdIHV2
Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDgxLjI0MDc4OF0gdXZjdmlkZW8gMy0y
OjEuMDogQ29udHJvbCAweDAwOWEwOTA4IG5vdCBmb3VuZApbIDQwODEuMjQwODU3XSB1dmN2aWRl
byAzLTI6MS4wOiBDb250cm9sIDB4MDA5YTA5MDkgbm90IGZvdW5kClsgNDA4MS4yNDA5MzVdIHV2
Y3ZpZGVvIDMtMjoxLjA6IENvbnRyb2wgMHgwMDlhMDkwZCBub3QgZm91bmQKWyA0MDgxLjI0MTAx
NV0gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwODEuMjQxMDI2XSB1dmN2
aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA4MS4yNDYwMjZdIHVzYiAzLTI6IDM6MTog
Y2Fubm90IGdldCBmcmVxIGF0IGVwIDB4ODMKWyA0MDgxLjI1MDU5OF0gdXNiIDMtMjogVVNCIGRp
c2Nvbm5lY3QsIGRldmljZSBudW1iZXIgMTEKWyA0MDgxLjMzNDA1MF0gdXZjdmlkZW8gNy0zOjEu
MDogUmVzdW1pbmcgaW50ZXJmYWNlIDAKWyA0MDgxLjMzNDA1Nl0gdXZjdmlkZW8gNy0zOjEuMDog
UmVzdW1pbmcgaW50ZXJmYWNlIDEKWyA0MDgxLjMzNTA1MF0gdXZjdmlkZW8gNy0zOjEuMDogQ29u
dHJvbCAweDAwOWEwOTA4IG5vdCBmb3VuZApbIDQwODEuMzM1MTMxXSB1dmN2aWRlbyA3LTM6MS4w
OiBDb250cm9sIDB4MDA5YTA5MDkgbm90IGZvdW5kClsgNDA4MS4zMzUyMDNdIHV2Y3ZpZGVvIDct
MzoxLjA6IENvbnRyb2wgMHgwMDlhMDkwZCBub3QgZm91bmQKWyA0MDgxLjMzNTI5MV0gdXZjdmlk
ZW8gNy0zOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwODEuMzM1NjkzXSB1dmN2aWRlbyA3LTM6
MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA4MS4zMzU3ODFdIHV2Y3ZpZGVvIDctMzoxLjA6IENvbnRy
b2wgMHgwMDlhMDkwOCBub3QgZm91bmQKWyA0MDgxLjMzNTg0NV0gdXZjdmlkZW8gNy0zOjEuMDog
Q29udHJvbCAweDAwOWEwOTA5IG5vdCBmb3VuZApbIDQwODEuMzM1OTIyXSB1dmN2aWRlbyA3LTM6
MS4wOiBDb250cm9sIDB4MDA5YTA5MGQgbm90IGZvdW5kClsgNDA4MS4zMzYwMDBdIHV2Y3ZpZGVv
IDctMzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDgyLjE1MjA0N10gdXZjdmlkZW8gNy0zOjEu
MDogdXZjX3Y0bDJfb3BlbgpbIDQwODIuMTUyMDU4XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRs
Ml9yZWxlYXNlClsgNDA4Mi4xNTIxOThdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX29wZW4K
WyA0MDgyLjE1MjIwMl0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwODIu
MTUyMzI0XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA4Mi4xNTIzMjddIHV2
Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDgyLjk4NjUzOV0gdXNiIDMtMjog
bmV3IGhpZ2gtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMTIgdXNpbmcgeGhjaV9oY2QKWyA0MDgz
LjEwOTg1MF0gdXNiIDMtMjogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTA3Y2EsIGlk
UHJvZHVjdD0xNTE1LCBiY2REZXZpY2U9IDAuMTAKWyA0MDgzLjExMzk2OF0gdXNiIDMtMjogTmV3
IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMKWyA0
MDgzLjExMzk3Ml0gdXNiIDMtMjogUHJvZHVjdDogWCd0cmEgR28gR0M1MTUKWyA0MDgzLjExMzk3
NF0gdXNiIDMtMjogTWFudWZhY3R1cmVyOiBBVmVyTWVkaWEKWyA0MDgzLjExMzk3Nl0gdXNiIDMt
MjogU2VyaWFsTnVtYmVyOiA1MzEzMTgwMDAwMjIxClsgNDA4My4xMTUwMzddIHV2Y3ZpZGVvIDMt
MjoxLjA6IFByb2JpbmcgZ2VuZXJpYyBVVkMgZGV2aWNlIDIKWyA0MDgzLjExNTA1OV0gdXZjdmlk
ZW8gMy0yOjEuMDogRm91bmQgZm9ybWF0IEgyNjQgbGl0dGxlLWVuZGlhbiAoMHgzNDM2MzI0OCkK
WyA0MDgzLjExNTA2M10gdXZjdmlkZW8gMy0yOjEuMDogLSAxOTIweDEwODAgKDYwLjAgZnBzKQpb
IDQwODMuMTE1MDY2XSB1dmN2aWRlbyAzLTI6MS4wOiAtIDM4NDB4MjE2MCAoMzAuMCBmcHMpClsg
NDA4My4xMTUwNjldIHV2Y3ZpZGVvIDMtMjoxLjA6IC0gMjU2MHgxNDQwICg2MC4wIGZwcykKWyA0
MDgzLjExNTA3MV0gdXZjdmlkZW8gMy0yOjEuMDogLSAxMjgweDgwMCAoNjAuMCBmcHMpClsgNDA4
My4xMTUwNzRdIHV2Y3ZpZGVvIDMtMjoxLjA6IC0gMTI4MHg3MjAgKDYwLjAgZnBzKQpbIDQwODMu
MTE1MDc2XSB1dmN2aWRlbyAzLTI6MS4wOiAtIDcyMHg1NzYgKDUwLjAgZnBzKQpbIDQwODMuMTE1
MDc4XSB1dmN2aWRlbyAzLTI6MS4wOiAtIDcyMHg0ODAgKDYwLjAgZnBzKQpbIDQwODMuMTE1MDgw
XSB1dmN2aWRlbyAzLTI6MS4wOiAtIDY0MHg0ODAgKDYwLjAgZnBzKQpbIDQwODMuMTE1MDgyXSB1
dmN2aWRlbyAzLTI6MS4wOiBGb3VuZCBmb3JtYXQgSEVWQyBsaXR0bGUtZW5kaWFuICgweDQzNTY0
NTQ4KQpbIDQwODMuMTE1MDg1XSB1dmN2aWRlbyAzLTI6MS4wOiAtIDE5MjB4MTA4MCAoNjAuMCBm
cHMpClsgNDA4My4xMTUwODddIHV2Y3ZpZGVvIDMtMjoxLjA6IC0gMzg0MHgyMTYwICgzMC4wIGZw
cykKWyA0MDgzLjExNTA4OF0gdXZjdmlkZW8gMy0yOjEuMDogLSAyNTYweDE0NDAgKDYwLjAgZnBz
KQpbIDQwODMuMTE1MDkwXSB1dmN2aWRlbyAzLTI6MS4wOiAtIDEyODB4ODAwICg2MC4wIGZwcykK
WyA0MDgzLjExNTA5Ml0gdXZjdmlkZW8gMy0yOjEuMDogLSAxMjgweDcyMCAoNjAuMCBmcHMpClsg
NDA4My4xMTUwOTRdIHV2Y3ZpZGVvIDMtMjoxLjA6IC0gNzIweDU3NiAoNTAuMCBmcHMpClsgNDA4
My4xMTUwOTZdIHV2Y3ZpZGVvIDMtMjoxLjA6IC0gNzIweDQ4MCAoNjAuMCBmcHMpClsgNDA4My4x
MTUwOThdIHV2Y3ZpZGVvIDMtMjoxLjA6IC0gNjQweDQ4MCAoNjAuMCBmcHMpClsgNDA4My4xMTUx
MDBdIHV2Y3ZpZGVvIDMtMjoxLjA6IEZvdW5kIGZvcm1hdCBNSlBHIGxpdHRsZS1lbmRpYW4gKDB4
NDc1MDRhNGQpClsgNDA4My4xMTUxMDJdIHV2Y3ZpZGVvIDMtMjoxLjA6IC0gMTkyMHgxMDgwICg2
MC4wIGZwcykKWyA0MDgzLjExNTEwN10gdXZjdmlkZW8gMy0yOjEuMDogRm91bmQgYSBTdGF0dXMg
ZW5kcG9pbnQgKGFkZHIgODUpClsgNDA4My4xMTUxMTBdIHV2Y3ZpZGVvIDMtMjoxLjA6IEZvdW5k
IFVWQyAxLjUwIGRldmljZSBYJ3RyYSBHbyBHQzUxNSAoMDdjYToxNTE1KQpbIDQwODMuMTE1MTEz
XSB1dmN2aWRlbyAzLTI6MS4wOiBTY2FubmluZyBVVkMgY2hhaW46ClsgNDA4My4xMTUxMTVdICBP
VCAzMjc3MCA8LSBQVSA0ICgtPiBYVSA1KSA8LSBTVSAzIDwtIElUIDEKWyA0MDgzLjExNTEyM10g
dXZjdmlkZW8gMy0yOjEuMDogRm91bmQgYSB2YWxpZCB2aWRlbyBjaGFpbiAoMSAtPiAzMjc3MCkK
WyA0MDgzLjExNzQwMF0gdXZjdmlkZW8gMy0yOjEuMDogVVZDIGRldmljZSBpbml0aWFsaXplZApb
IDQwODMuMTE5Njc1XSB1c2IgMy0yOiAzOjE6IGNhbm5vdCBnZXQgZnJlcSBhdCBlcCAweDgzClsg
NDA4My4xMjUwOTBdIHVzYiAzLTI6IFdhcm5pbmchIFVubGlrZWx5IHNtYWxsIHZvbHVtZSByYW5n
ZSAoPTk5KSwgbGluZWFyIHZvbHVtZSBvciBjdXN0b20gY3VydmU/ClsgNDA4My4xMjUwOTNdIHVz
YiAzLTI6IFszXSBGVSBbRGlnaXRhbCBJbiBDYXB0dXJlIFZvbHVtZV0gY2ggPSAxLCB2YWwgPSAx
LzEwMC8xClsgNDA4My4xNDQ4MjhdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX29wZW4KWyA0
MDgzLjE0NDg0N10gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwODMuMTQ2
NTgxXSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA4My4xNDY2NjRdIHV2Y3Zp
ZGVvIDMtMjoxLjA6IENvbnRyb2wgMHgwMDlhMDkwOCBub3QgZm91bmQKWyA0MDgzLjE0Njc2NV0g
dXZjdmlkZW8gMy0yOjEuMDogQ29udHJvbCAweDAwOWEwOTA5IG5vdCBmb3VuZApbIDQwODMuMTQ2
ODQwXSB1dmN2aWRlbyAzLTI6MS4wOiBDb250cm9sIDB4MDA5YTA5MGQgbm90IGZvdW5kClsgNDA4
My4xNDY5MTddIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDgzLjE0Njky
OV0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwODMuMTQ3MDE4XSB1dmN2aWRl
byA3LTM6MS4wOiBDb250cm9sIDB4MDA5YTA5MDggbm90IGZvdW5kClsgNDA4My4xNDcwODVdIHV2
Y3ZpZGVvIDctMzoxLjA6IENvbnRyb2wgMHgwMDlhMDkwOSBub3QgZm91bmQKWyA0MDgzLjE0NzE2
OF0gdXZjdmlkZW8gNy0zOjEuMDogQ29udHJvbCAweDAwOWEwOTBkIG5vdCBmb3VuZApbIDQwODMu
MTQ3MjQwXSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA4My4xNDc1MDBd
IHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDgzLjE0NzU4N10gdXZjdmlkZW8g
My0yOjEuMDogQ29udHJvbCAweDAwOWEwOTA4IG5vdCBmb3VuZApbIDQwODMuMTQ3NjYzXSB1dmN2
aWRlbyAzLTI6MS4wOiBDb250cm9sIDB4MDA5YTA5MDkgbm90IGZvdW5kClsgNDA4My4xNDc3Mzdd
IHV2Y3ZpZGVvIDMtMjoxLjA6IENvbnRyb2wgMHgwMDlhMDkwZCBub3QgZm91bmQKWyA0MDgzLjE0
NzgxNF0gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwODMuMTQ3ODI4XSB1
dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA4My4xNDc5MjNdIHV2Y3ZpZGVvIDct
MzoxLjA6IENvbnRyb2wgMHgwMDlhMDkwOCBub3QgZm91bmQKWyA0MDgzLjE0Nzk4N10gdXZjdmlk
ZW8gNy0zOjEuMDogQ29udHJvbCAweDAwOWEwOTA5IG5vdCBmb3VuZApbIDQwODMuMTQ4MDY3XSB1
dmN2aWRlbyA3LTM6MS4wOiBDb250cm9sIDB4MDA5YTA5MGQgbm90IGZvdW5kClsgNDA4My4xNDgx
NDRdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDgzLjE0ODI2MF0gdXZj
dmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwODMuMTQ4Mjc0XSB1dmN2aWRlbyAzLTI6
MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA4My4xNDg0MDFdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2
Y192NGwyX29wZW4KWyA0MDgzLjE0ODU1M10gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVs
ZWFzZQpbIDQwODMuMTc5MDQyXSB1c2IgMy0yOiAzOjE6IGNhbm5vdCBnZXQgZnJlcSBhdCBlcCAw
eDgzClsgNDA4My4xODQ5MTRdIHVzYiAzLTI6IDM6MTogY2Fubm90IGdldCBmcmVxIGF0IGVwIDB4
ODMKWyA0MDgzLjkyNTgzOF0gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwODMu
OTI1OTM4XSB1dmN2aWRlbyAzLTI6MS4wOiBDb250cm9sIDB4MDA5YTA5MDggbm90IGZvdW5kClsg
NDA4My45MjYwMTVdIHV2Y3ZpZGVvIDMtMjoxLjA6IENvbnRyb2wgMHgwMDlhMDkwOSBub3QgZm91
bmQKWyA0MDgzLjkyNjA5MF0gdXZjdmlkZW8gMy0yOjEuMDogQ29udHJvbCAweDAwOWEwOTBkIG5v
dCBmb3VuZApbIDQwODMuOTI2MTcxXSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9yZWxlYXNl
ClsgNDA4My45MjYxODddIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDgzLjky
NjI4Nl0gdXZjdmlkZW8gNy0zOjEuMDogQ29udHJvbCAweDAwOWEwOTA4IG5vdCBmb3VuZApbIDQw
ODMuOTI2MzUzXSB1dmN2aWRlbyA3LTM6MS4wOiBDb250cm9sIDB4MDA5YTA5MDkgbm90IGZvdW5k
ClsgNDA4My45MjY0MzBdIHV2Y3ZpZGVvIDctMzoxLjA6IENvbnRyb2wgMHgwMDlhMDkwZCBub3Qg
Zm91bmQKWyA0MDgzLjkyNjUwOF0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpb
IDQwODQuMTUwMTQ4XSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA4NC4xNTAx
NjFdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDg0LjE1MDQ0M10gdXZj
dmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwODQuMTUwNTM3XSB1dmN2aWRlbyAzLTI6
MS4wOiBDb250cm9sIDB4MDA5ODA5MDAgbm90IGZvdW5kClsgNDA4NC4xNTA2MDldIHV2Y3ZpZGVv
IDMtMjoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDg0LjE1MDYxNV0gdXZjdmlkZW8gMy0yOjEu
MDogdXZjX3Y0bDJfb3BlbgpbIDQwODQuMTUwNjE5XSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRs
Ml9yZWxlYXNlClsgNDA4NC4xNTA2MjRdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX29wZW4K
WyA0MDg0LjE1MDYyN10gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwODQu
MTUwNjMyXSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA4NC4xNTA2NDNdIHV2
Y3ZpZGVvIDMtMjoxLjA6IFRyeWluZyBmb3JtYXQgMHgzNDM2MzI0OCAoSDI2NCk6IDE5MjB4MTA4
MApbIDQwODQuMTUwNjQ2XSB1dmN2aWRlbyAzLTI6MS4wOiBVc2luZyBkZWZhdWx0IGZyYW1lIGlu
dGVydmFsIDE2NjY2LjYgdXMgKDYwLjAgZnBzKQpbIDQwODQuMTUzMjQ2XSB1dmN2aWRlbyAzLTI6
MS4wOiBUcnlpbmcgZm9ybWF0IDB4MzQzNjMyNDggKEgyNjQpOiAzODQweDIxNjAKWyA0MDg0LjE1
MzI0OV0gdXZjdmlkZW8gMy0yOjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBpbnRlcnZhbCAzMzMz
My4zIHVzICgzMC4wIGZwcykKWyA0MDg0LjE1NTc0M10gdXZjdmlkZW8gMy0yOjEuMDogVHJ5aW5n
IGZvcm1hdCAweDM0MzYzMjQ4IChIMjY0KTogMjU2MHgxNDQwClsgNDA4NC4xNTU3NDZdIHV2Y3Zp
ZGVvIDMtMjoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMTY2NjYuNiB1cyAoNjAu
MCBmcHMpClsgNDA4NC4xNTgyNDBdIHV2Y3ZpZGVvIDMtMjoxLjA6IFRyeWluZyBmb3JtYXQgMHgz
NDM2MzI0OCAoSDI2NCk6IDEyODB4ODAwClsgNDA4NC4xNTgyNDNdIHV2Y3ZpZGVvIDMtMjoxLjA6
IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMTY2NjYuNiB1cyAoNjAuMCBmcHMpClsgNDA4
NC4xNjA3NDFdIHV2Y3ZpZGVvIDMtMjoxLjA6IFRyeWluZyBmb3JtYXQgMHgzNDM2MzI0OCAoSDI2
NCk6IDEyODB4NzIwClsgNDA4NC4xNjA3NDRdIHV2Y3ZpZGVvIDMtMjoxLjA6IFVzaW5nIGRlZmF1
bHQgZnJhbWUgaW50ZXJ2YWwgMTY2NjYuNiB1cyAoNjAuMCBmcHMpClsgNDA4NC4xNjMyNDBdIHV2
Y3ZpZGVvIDMtMjoxLjA6IFRyeWluZyBmb3JtYXQgMHgzNDM2MzI0OCAoSDI2NCk6IDcyMHg1NzYK
WyA0MDg0LjE2MzI0M10gdXZjdmlkZW8gMy0yOjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBpbnRl
cnZhbCAyMDAwMC4wIHVzICg1MC4wIGZwcykKWyA0MDg0LjE2NTc0MV0gdXZjdmlkZW8gMy0yOjEu
MDogVHJ5aW5nIGZvcm1hdCAweDM0MzYzMjQ4IChIMjY0KTogNzIweDQ4MApbIDQwODQuMTY1NzQ1
XSB1dmN2aWRlbyAzLTI6MS4wOiBVc2luZyBkZWZhdWx0IGZyYW1lIGludGVydmFsIDE2NjY2LjYg
dXMgKDYwLjAgZnBzKQpbIDQwODQuMTY4MjQ3XSB1dmN2aWRlbyAzLTI6MS4wOiBUcnlpbmcgZm9y
bWF0IDB4MzQzNjMyNDggKEgyNjQpOiA2NDB4NDgwClsgNDA4NC4xNjgyNTJdIHV2Y3ZpZGVvIDMt
MjoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMTY2NjYuNiB1cyAoNjAuMCBmcHMp
ClsgNDA4NC4xNzA4NzBdIHV2Y3ZpZGVvIDMtMjoxLjA6IFRyeWluZyBmb3JtYXQgMHg0NzUwNGE0
ZCAoTUpQRyk6IDE5MjB4MTA4MApbIDQwODQuMTcwODc0XSB1dmN2aWRlbyAzLTI6MS4wOiBVc2lu
ZyBkZWZhdWx0IGZyYW1lIGludGVydmFsIDE2NjY2LjYgdXMgKDYwLjAgZnBzKQpbIDQwODQuMTcz
MzYyXSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA4NC4xNzM2MjhdIHV2
Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDg0LjE3MzcxMl0gdXZjdmlkZW8gMy0y
OjEuMDogQ29udHJvbCAweDAwOTgwOTAwIG5vdCBmb3VuZApbIDQwODQuMTczNzg0XSB1dmN2aWRl
byAzLTI6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA4NC4xNzM3OTRdIHV2Y3ZpZGVvIDMtMjox
LjA6IHV2Y192NGwyX29wZW4KWyA0MDg0LjE3MzgwNV0gdXZjdmlkZW8gMy0yOjEuMDogVHJ5aW5n
IGZvcm1hdCAweDM0MzYzMjQ4IChIMjY0KTogMTkyMHgxMDgwClsgNDA4NC4xNzM4MDddIHV2Y3Zp
ZGVvIDMtMjoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMTY2NjYuNiB1cyAoNjAu
MCBmcHMpClsgNDA4NC4xNzYyNDJdIHV2Y3ZpZGVvIDMtMjoxLjA6IFRyeWluZyBmb3JtYXQgMHgz
NDM2MzI0OCAoSDI2NCk6IDM4NDB4MjE2MApbIDQwODQuMTc2MjQ1XSB1dmN2aWRlbyAzLTI6MS4w
OiBVc2luZyBkZWZhdWx0IGZyYW1lIGludGVydmFsIDMzMzMzLjMgdXMgKDMwLjAgZnBzKQpbIDQw
ODQuMTc4NzM5XSB1dmN2aWRlbyAzLTI6MS4wOiBUcnlpbmcgZm9ybWF0IDB4MzQzNjMyNDggKEgy
NjQpOiAyNTYweDE0NDAKWyA0MDg0LjE3ODc0Ml0gdXZjdmlkZW8gMy0yOjEuMDogVXNpbmcgZGVm
YXVsdCBmcmFtZSBpbnRlcnZhbCAxNjY2Ni42IHVzICg2MC4wIGZwcykKWyA0MDg0LjE4MTIzNl0g
dXZjdmlkZW8gMy0yOjEuMDogVHJ5aW5nIGZvcm1hdCAweDM0MzYzMjQ4IChIMjY0KTogMTI4MHg4
MDAKWyA0MDg0LjE4MTIzOV0gdXZjdmlkZW8gMy0yOjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBp
bnRlcnZhbCAxNjY2Ni42IHVzICg2MC4wIGZwcykKWyA0MDg0LjE4Mzc0Ml0gdXZjdmlkZW8gMy0y
OjEuMDogVHJ5aW5nIGZvcm1hdCAweDM0MzYzMjQ4IChIMjY0KTogMTI4MHg3MjAKWyA0MDg0LjE4
Mzc0Nl0gdXZjdmlkZW8gMy0yOjEuMDogVXNpbmcgZGVmYXVsdCBmcmFtZSBpbnRlcnZhbCAxNjY2
Ni42IHVzICg2MC4wIGZwcykKWyA0MDg0LjE4NjIzNl0gdXZjdmlkZW8gMy0yOjEuMDogVHJ5aW5n
IGZvcm1hdCAweDM0MzYzMjQ4IChIMjY0KTogNzIweDU3NgpbIDQwODQuMTg2MjM5XSB1dmN2aWRl
byAzLTI6MS4wOiBVc2luZyBkZWZhdWx0IGZyYW1lIGludGVydmFsIDIwMDAwLjAgdXMgKDUwLjAg
ZnBzKQpbIDQwODQuMTg4ODYwXSB1dmN2aWRlbyAzLTI6MS4wOiBUcnlpbmcgZm9ybWF0IDB4MzQz
NjMyNDggKEgyNjQpOiA3MjB4NDgwClsgNDA4NC4xODg4NjJdIHV2Y3ZpZGVvIDMtMjoxLjA6IFVz
aW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2YWwgMTY2NjYuNiB1cyAoNjAuMCBmcHMpClsgNDA4NC4x
OTEzNTldIHV2Y3ZpZGVvIDMtMjoxLjA6IFRyeWluZyBmb3JtYXQgMHgzNDM2MzI0OCAoSDI2NCk6
IDY0MHg0ODAKWyA0MDg0LjE5MTM2Ml0gdXZjdmlkZW8gMy0yOjEuMDogVXNpbmcgZGVmYXVsdCBm
cmFtZSBpbnRlcnZhbCAxNjY2Ni42IHVzICg2MC4wIGZwcykKWyA0MDg0LjE5Mzg2MV0gdXZjdmlk
ZW8gMy0yOjEuMDogVHJ5aW5nIGZvcm1hdCAweDQ3NTA0YTRkIChNSlBHKTogMTkyMHgxMDgwClsg
NDA4NC4xOTM4NjNdIHV2Y3ZpZGVvIDMtMjoxLjA6IFVzaW5nIGRlZmF1bHQgZnJhbWUgaW50ZXJ2
YWwgMTY2NjYuNiB1cyAoNjAuMCBmcHMpClsgNDA4NC4xOTYzNTZdIHV2Y3ZpZGVvIDMtMjoxLjA6
IHV2Y192NGwyX3JlbGVhc2UKWyA0MDg1LjE1MjE0OV0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0
bDJfb3BlbgpbIDQwODUuMTUyMTYwXSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNl
ClsgNDA4NS4xNTIxNzRdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDg1LjE1
MjE3OF0gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwODUuMTUyMzQ2XSB1
dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA4NS4xNTIzNTBdIHV2Y3ZpZGVvIDct
MzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDg1LjE1MjM1OV0gdXZjdmlkZW8gMy0yOjEuMDog
dXZjX3Y0bDJfb3BlbgpbIDQwODUuMTUyMzYyXSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9y
ZWxlYXNlClsgNDA4NS4xNTI1MTRdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX29wZW4KWyA0
MDg1LjE1MjUyMF0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwODUuMTUy
NTI1XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA4NS4xNTI1MjldIHV2Y3Zp
ZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDg1LjE1MjUzOF0gdXZjdmlkZW8gMy0y
OjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwODUuMTUyNTQyXSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNf
djRsMl9yZWxlYXNlClsgNDA4NS4xNTI2ODRdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX29w
ZW4KWyA0MDg1LjE1MjY4OF0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQw
ODUuMTUyNjk3XSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA4NS4xNTI3MDJd
IHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDg1LjE1NDE2Nl0gdXZjdmlk
ZW8gMy0yOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwODUuMTU0MjU5XSB1dmN2aWRlbyAzLTI6MS4w
OiBDb250cm9sIDB4MDA5YTA5MDggbm90IGZvdW5kClsgNDA4NS4xNTQzMzldIHV2Y3ZpZGVvIDMt
MjoxLjA6IENvbnRyb2wgMHgwMDlhMDkwOSBub3QgZm91bmQKWyA0MDg1LjE1NDQxNV0gdXZjdmlk
ZW8gMy0yOjEuMDogQ29udHJvbCAweDAwOWEwOTBkIG5vdCBmb3VuZApbIDQwODUuMTU0NDg5XSB1
dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA4NS4xNTQ1MDNdIHV2Y3ZpZGVv
IDctMzoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDg1LjE1NDU4OF0gdXZjdmlkZW8gNy0zOjEuMDog
Q29udHJvbCAweDAwOWEwOTA4IG5vdCBmb3VuZApbIDQwODUuMTU0NjUxXSB1dmN2aWRlbyA3LTM6
MS4wOiBDb250cm9sIDB4MDA5YTA5MDkgbm90IGZvdW5kClsgNDA4NS4xNTQ3MjddIHV2Y3ZpZGVv
IDctMzoxLjA6IENvbnRyb2wgMHgwMDlhMDkwZCBub3QgZm91bmQKWyA0MDg1LjE1NDgwNl0gdXZj
dmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwODcuMTczMDQyXSB1dmN2aWRlbyA3
LTM6MS4wOiBTdXNwZW5kaW5nIGludGVyZmFjZSAxClsgNDA4Ny4xNzMwNDldIHV2Y3ZpZGVvIDct
MzoxLjA6IFN1c3BlbmRpbmcgaW50ZXJmYWNlIDAKWyA0MDg3LjY1NDIxMV0gdXZjdmlkZW8gMy0y
OjEuMDogU3VzcGVuZGluZyBpbnRlcmZhY2UgMQpbIDQwODcuNjU0MjE3XSB1dmN2aWRlbyAzLTI6
MS4wOiBTdXNwZW5kaW5nIGludGVyZmFjZSAwClsgNDA4OC4xNTI1MjhdIHV2Y3ZpZGVvIDctMzox
LjA6IHV2Y192NGwyX29wZW4KWyA0MDg4LjE1MjUzOV0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0
bDJfcmVsZWFzZQpbIDQwODguMTUyNTUyXSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9vcGVu
ClsgNDA4OC4xNTI1NTZdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDg4
LjE1MjcwN10gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwODguMTUyNzEwXSB1
dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA4OC4xNTI3MThdIHV2Y3ZpZGVv
IDMtMjoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDg4LjE1MjcyMV0gdXZjdmlkZW8gMy0yOjEuMDog
dXZjX3Y0bDJfcmVsZWFzZQpbIDQwODguMTUyODUwXSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRs
Ml9vcGVuClsgNDA4OC4xNTI4NTRdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVhc2UK
WyA0MDg4LjE1Mjg1OF0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwODguMTUy
ODYyXSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA4OC4xNTI4NzBdIHV2
Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDg4LjE1Mjg3M10gdXZjdmlkZW8gMy0y
OjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwODguMTUzMDA2XSB1dmN2aWRlbyA3LTM6MS4wOiB1
dmNfdjRsMl9vcGVuClsgNDA4OC4xNTMwMTBdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3Jl
bGVhc2UKWyA0MDg4LjE1MzAxOF0gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQw
ODguMTUzMDIyXSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA5MS4xNTI4
NDJdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDkxLjE1Mjg1M10gdXZjdmlk
ZW8gNy0zOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwOTEuMTUyODY2XSB1dmN2aWRlbyAzLTI6
MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA5MS4xNTI4NzBdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192
NGwyX3JlbGVhc2UKWyA0MDkxLjE1MzA0MF0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3Bl
bgpbIDQwOTEuMTUzMDQ0XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA5
MS4xNTMwNTJdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDkxLjE1MzA1NV0g
dXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwOTEuMTUzMTg4XSB1dmN2aWRl
byA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA5MS4xNTMxOTJdIHV2Y3ZpZGVvIDctMzoxLjA6
IHV2Y192NGwyX3JlbGVhc2UKWyA0MDkxLjE1MzE5N10gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0
bDJfb3BlbgpbIDQwOTEuMTUzMjAwXSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNl
ClsgNDA5MS4xNTMyMDhdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDkxLjE1
MzIxMV0gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwOTEuMTUzMzQyXSB1
dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA5MS4xNTMzNDVdIHV2Y3ZpZGVvIDct
MzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDkxLjE1MzM1M10gdXZjdmlkZW8gMy0yOjEuMDog
dXZjX3Y0bDJfb3BlbgpbIDQwOTEuMTUzMzU3XSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9y
ZWxlYXNlClsgNDA5NC4xNTMxNzhdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX29wZW4KWyA0
MDk0LjE1MzE4OF0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwOTQuMTUz
MjAxXSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA5NC4xNTMyMDVdIHV2Y3Zp
ZGVvIDMtMjoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDk0LjE1MzM1N10gdXZjdmlkZW8gNy0z
OjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwOTQuMTUzMzYxXSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNf
djRsMl9yZWxlYXNlClsgNDA5NC4xNTMzNjldIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX29w
ZW4KWyA0MDk0LjE1MzM3Ml0gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQw
OTQuMTUzNTAzXSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA5NC4xNTM1MDdd
IHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDk0LjE1MzUxMl0gdXZjdmlk
ZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwOTQuMTUzNTE1XSB1dmN2aWRlbyA3LTM6MS4w
OiB1dmNfdjRsMl9yZWxlYXNlClsgNDA5NC4xNTM1MjNdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192
NGwyX29wZW4KWyA0MDk0LjE1MzUyN10gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVsZWFz
ZQpbIDQwOTQuMTUzNjU3XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDA5NC4x
NTM2NjFdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDk0LjE1MzY2OV0g
dXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwOTQuMTUzNjczXSB1dmN2aWRlbyAz
LTI6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA5Ny4xNTM0OTRdIHV2Y3ZpZGVvIDctMzoxLjA6
IHV2Y192NGwyX29wZW4KWyA0MDk3LjE1MzUwNF0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJf
cmVsZWFzZQpbIDQwOTcuMTUzNTE3XSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9vcGVuClsg
NDA5Ny4xNTM1MzFdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MDk3LjE1
MzY4M10gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwOTcuMTUzNjg2XSB1dmN2
aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA5Ny4xNTM2OTRdIHV2Y3ZpZGVvIDMt
MjoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDk3LjE1MzY5OF0gdXZjdmlkZW8gMy0yOjEuMDogdXZj
X3Y0bDJfcmVsZWFzZQpbIDQwOTcuMTUzODMyXSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9v
cGVuClsgNDA5Ny4xNTM4MzZdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0
MDk3LjE1Mzg0MV0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwOTcuMTUzODQ0
XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDA5Ny4xNTM4NTNdIHV2Y3Zp
ZGVvIDMtMjoxLjA6IHV2Y192NGwyX29wZW4KWyA0MDk3LjE1Mzg1Nl0gdXZjdmlkZW8gMy0yOjEu
MDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQwOTcuMTUzOTg1XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNf
djRsMl9vcGVuClsgNDA5Ny4xNTM5ODhdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVh
c2UKWyA0MDk3LjE1Mzk5Nl0gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQwOTcu
MTU0MDAwXSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDEwMC4xNTM4MjZd
IHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX29wZW4KWyA0MTAwLjE1MzgzNV0gdXZjdmlkZW8g
Ny0zOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQxMDAuMTUzODQ3XSB1dmN2aWRlbyAzLTI6MS4w
OiB1dmNfdjRsMl9vcGVuClsgNDEwMC4xNTM4NTFdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwy
X3JlbGVhc2UKWyA0MTAwLjE1Mzk4OF0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3Blbgpb
IDQxMDAuMTUzOTkxXSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDEwMC4x
NTM5OThdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX29wZW4KWyA0MTAwLjE1NDAwMV0gdXZj
dmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQxMDAuMTU0MTE3XSB1dmN2aWRlbyA3
LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDEwMC4xNTQxMjFdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2
Y192NGwyX3JlbGVhc2UKWyA0MTAwLjE1NDEyNV0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJf
b3BlbgpbIDQxMDAuMTU0MTI4XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsg
NDEwMC4xNTQxMzddIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX29wZW4KWyA0MTAwLjE1NDE0
MF0gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQxMDAuMTU0MjU2XSB1dmN2
aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDEwMC4xNTQyNTldIHV2Y3ZpZGVvIDctMzox
LjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MTAwLjE1NDI2Nl0gdXZjdmlkZW8gMy0yOjEuMDogdXZj
X3Y0bDJfb3BlbgpbIDQxMDAuMTU0MjY5XSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9yZWxl
YXNlClsgNDEwMy4xNTQwOTBdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX29wZW4KWyA0MTAz
LjE1NDEwOF0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQxMDMuMTU0MTIy
XSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDEwMy4xNTQxMjZdIHV2Y3ZpZGVv
IDMtMjoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MTAzLjE1NDI3OV0gdXZjdmlkZW8gNy0zOjEu
MDogdXZjX3Y0bDJfb3BlbgpbIDQxMDMuMTU0MjgyXSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRs
Ml9yZWxlYXNlClsgNDEwMy4xNTQyODldIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX29wZW4K
WyA0MTAzLjE1NDI5Ml0gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQxMDMu
MTU0NDA5XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDEwMy4xNTQ0MTJdIHV2
Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MTAzLjE1NDQxN10gdXZjdmlkZW8g
Ny0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQxMDMuMTU0NDE5XSB1dmN2aWRlbyA3LTM6MS4wOiB1
dmNfdjRsMl9yZWxlYXNlClsgNDEwMy4xNTQ0MjZdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwy
X29wZW4KWyA0MTAzLjE1NDQyOV0gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpb
IDQxMDMuMTU0NTQ2XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDEwMy4xNTQ1
NDldIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MTAzLjE1NDU1Nl0gdXZj
dmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQxMDMuMTU0NTU5XSB1dmN2aWRlbyAzLTI6
MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDEwNi4xNTQyNTNdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2
Y192NGwyX29wZW4KWyA0MTA2LjE1NDI2NF0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfcmVs
ZWFzZQpbIDQxMDYuMTU0Mjc3XSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDEw
Ni4xNTQyODBdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MTA2LjE1NDQz
Ml0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQxMDYuMTU0NDM1XSB1dmN2aWRl
byA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDEwNi4xNTQ0NDRdIHV2Y3ZpZGVvIDMtMjox
LjA6IHV2Y192NGwyX29wZW4KWyA0MTA2LjE1NDQ0N10gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0
bDJfcmVsZWFzZQpbIDQxMDYuMTU0NTc3XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9vcGVu
ClsgNDEwNi4xNTQ1ODJdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVhc2UKWyA0MTA2
LjE1NDU4Nl0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQxMDYuMTU0NTg5XSB1
dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDEwNi4xNTQ1OTddIHV2Y3ZpZGVv
IDMtMjoxLjA6IHV2Y192NGwyX29wZW4KWyA0MTA2LjE1NDYwMV0gdXZjdmlkZW8gMy0yOjEuMDog
dXZjX3Y0bDJfcmVsZWFzZQpbIDQxMDYuMTU0NzMxXSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRs
Ml9vcGVuClsgNDEwNi4xNTQ3MzRdIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX3JlbGVhc2UK
WyA0MTA2LjE1NDc0Ml0gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQxMDYuMTU0
NzQ2XSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDEwOS4xNTQyOTZdIHV2
Y3ZpZGVvIDctMzoxLjA6IHV2Y192NGwyX29wZW4KWyA0MTA5LjE1NDMwN10gdXZjdmlkZW8gNy0z
OjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQxMDkuMTU0MzIwXSB1dmN2aWRlbyAzLTI6MS4wOiB1
dmNfdjRsMl9vcGVuClsgNDEwOS4xNTQzMjRdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX3Jl
bGVhc2UKWyA0MTA5LjE1NDQ3Nl0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3BlbgpbIDQx
MDkuMTU0NDc5XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDEwOS4xNTQ0
ODddIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX29wZW4KWyA0MTA5LjE1NDQ5MV0gdXZjdmlk
ZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQxMDkuMTU0NjIzXSB1dmN2aWRlbyA3LTM6
MS4wOiB1dmNfdjRsMl9vcGVuClsgNDEwOS4xNTQ2MjddIHV2Y3ZpZGVvIDctMzoxLjA6IHV2Y192
NGwyX3JlbGVhc2UKWyA0MTA5LjE1NDYzMV0gdXZjdmlkZW8gNy0zOjEuMDogdXZjX3Y0bDJfb3Bl
bgpbIDQxMDkuMTU0NjM1XSB1dmN2aWRlbyA3LTM6MS4wOiB1dmNfdjRsMl9yZWxlYXNlClsgNDEw
OS4xNTQ2NDNdIHV2Y3ZpZGVvIDMtMjoxLjA6IHV2Y192NGwyX29wZW4KWyA0MTA5LjE1NDY0Nl0g
dXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0bDJfcmVsZWFzZQpbIDQxMDkuMTU0Nzc2XSB1dmN2aWRl
byA3LTM6MS4wOiB1dmNfdjRsMl9vcGVuClsgNDEwOS4xNTQ3NzldIHV2Y3ZpZGVvIDctMzoxLjA6
IHV2Y192NGwyX3JlbGVhc2UKWyA0MTA5LjE1NDc4N10gdXZjdmlkZW8gMy0yOjEuMDogdXZjX3Y0
bDJfb3BlbgpbIDQxMDkuMTU0NzkxXSB1dmN2aWRlbyAzLTI6MS4wOiB1dmNfdjRsMl9yZWxlYXNl
Cg==

--b1=_xTGIZnIGr6fBU5XUCzXWqHutpweoe9FcKEdYXjR8ZM--

