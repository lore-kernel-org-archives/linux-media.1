Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793668135;
	b=pp9oesxaWoz1E9oqK8Y+Ftoo4R6IwvKLRFo+uSOFezLjLfd0VowbqUYCWbuN3W6g6/ix
	 MrG4AKNIdjMb8Uw5GZWbRYz5yYQ/DPSNX1LCPIUc4oDgpetJmqrDgsm/+a5Z1hv4dWNMz
	 O9CtEea4bcquDUg60wnkEVX9ZJ4mlbv6uiO5eIlyjPrL8uB1Q4+CFC554mgnS8T34GHso
	 CCERUxppr1uIyL+kw2cJ2k/qDbuL2N6ahAbgjRZl0P6w7ujvreKgH6dnJ5CxHw8DqqHHy
	 uH0rHPiR58AsneIGf4K1Ci9pIgUaSm7J1lVfQFRrU28cvVwo5bezZzfM0fNW+rWQifg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Us9uyqDvvriV3s06O4jeqZld0pMlKcDJ7sK+x+EI1fU=;
	b=RDGdM/OpeyWrcIXH1NfHhV2IEUuBvyHO/QC9XaqQp9c3mZX66dluHcPNW8ipneu8UnkW
	 4lrZTODxkx0CQ8wRlE+zVJunzfjf0apBzooqBr9C9+G0AtUyX3n0OD9/9Qs+XNJA3asGT
	 rOlbI0lnjGRYEVQQZqvoM5tJQjgmmW59OUqxeCsTdpIXqDUQxXl9TmjUdcnOG1gO/W3Uq
	 5x9sMdwIBY2HKMDBCuIDptEdcEPdVLrr39WNs4mUhRpwSbIlCtR982uVfNcpSQ1v+pfY6
	 sg7AFlOUeepgjEHaGm1awm8cfLMk/kn8LdXRS/WMhw3Fe/NxGDKZDRhqLc0IGe63wGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dgrkeaN9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A69606A326
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 01:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A69606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dgrkeaN9
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso2600436eaf.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 17:08:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793668134; cv=none;
        d=google.com; s=arc-20260327;
        b=Ggt9UGB3f0mxDv4aZmFsQ71QpRKXTlbdOHOtsxgj73L4TN1FHbi7LyBCzKdURHnBny
         lHkDJIriBN+3eSViP1+UL3ycoSHwUkM9CI/UfCI5JrkQqTcqXv2O0HQme9qqqiBtDW90
         Sa62LjY0pLhuDL8mhDbwHwaPy7IhxLBYLeLoa8SBTcJfddle799YdPpxpjXyorwIv+/X
         9q2YOkN/RmGqjh5so2m/e9iG3MCd2ddWxgC8Kkk95xCxIVrrZ97G7YzManMqFd/2hGK7
         Lm0J/o7KiWCOdZorTZYmA9AkU1wf8ksgaEL+L3aYs5jzXBsTUW723hHvxseqNGxcttOe
         qpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Us9uyqDvvriV3s06O4jeqZld0pMlKcDJ7sK+x+EI1fU=;
        fh=5C2xJBcYjajg935WzL+lB+kcUS8hwsJuh5umAx5DqbQ=;
        b=SC5NdXGiT+U712jws9ts0hp1+0dhoKlmYWyEw5rOvx48AkeNjv5hBBb/CA/6ekHrrL
         eik/p9+36rnut06Cg/jYil2IWs13T3g0ZKvpKgFpmTSxA7Cj84Ntm53JRN9j8oSyZ2he
         koTOuk/Mv66/j0+nOO+dQW5qsojsUod23eM9fW8/vokslIIdszLM0xQnXvQS1ioG71Dc
         UH6Wrxh1208RvGHde4Bhlff1GchfTuGBGrfwOSvUHQ8EFdmBMT3d6ALbRI7YiaPNRNP2
         ldIHJcuVs2QRJ4OAFOX/YGUIt8lpgvqnM8HNDq0ff4xaBkSmDmSqFkXliJa0akHq/Qx+
         MxZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793668134; x=1794272934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Us9uyqDvvriV3s06O4jeqZld0pMlKcDJ7sK+x+EI1fU=;
        b=dgrkeaN903ttE5BpyfZfJV7eZg9gliEDCuodyKrf+jXIz3kfY2bQXMbBcLK2ofGuAH
         I0OJmL2xexNiKcD1jIEWU13bTUzrjBOnAYE1iDYceobXb6bbvhujZWev1mnF9o7IZ8e8
         bKlmYAx9Hvp8C5LrI+ZTj/zfADRWXDVCJExPZn8b3kXrUpemDvjRqGRbZxOxZYcDgE43
         ViR1wcGVcwb57ipIFN4x5Tn/CRIX/63GsLJ3xKeISxnvmWLaZPTM9khHm2eaLN8gd9a/
         lpG1mqDa73+ibRN5CnUkDiBEsekXR7L2Xy4Nuh863n/2ZKMCDZCVc96TGnGxbrTS7ib0
         nLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668134; x=1794272934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Us9uyqDvvriV3s06O4jeqZld0pMlKcDJ7sK+x+EI1fU=;
        b=TzB2b37sMg4nsJGzS5/4Cg+gMxWaZTNOU7yjtIve46jPIK95INPVlF1MpZ28XhLTD9
         W8uG5x32lxBBX4GiO8E75xR+1bysCfdQNfhrN77Xi4xIOpFbWP9K5k0fShmP81OC3epo
         1jDdlJiuESvroMwOmnCGeVfoInyc2pAeRL6azvOKcva1UR4ucY7H9tjaJh3NMYS9BhPv
         tWaPtcFeIaxp5VK3HuwoSRzA0xiYqHdnOu2NfcDkawY7HE3N8fd1bn7RLwCn1p53Nm60
         JeShRn2NCihTX2kJjs44tccmQjDCbt8Mg17vjIe+8GpUTe0PuASAXADC1L0uM9dgDHNj
         8O6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxKwjk1ML11nhjSytSNqLxsCDkPFJa9uUuV3MXhJIbzS3iR8pq0k/uB0HJwG4Jwa+DiYlbyR1nZXD4ayQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJla2hu+1KBydyEoIQFMHcMwBpdwqGE3Xl4r3XtC+NtwVuYZRB8
	UKEVNOn2YuqBd0D5giwTM4lauFAk/GF0yIFDuxbUKn34lhWG1YOTpN/2NviGcWDE9Fy9ozVr9Kg
	J9ti6ZIEDKwYcjSRAeeiwHBqan6jLAE86R/Ac
X-Gm-Gg: AYBFou2DpFkHcNMfz5CiOI0v2QDoNQdLt6hO4EjQALImiP4jn2OZTGseNpZUyxSibTx
	TJj83HX2OR72Enbb1nCXF4GdOEsSLINlD9MZp5fn/mvbU8ZSqf4TzsfdQRjhqRR6VV03WYwMiZO
	oS8FdRAckoexnSP1zFGGQhDik6bP6tV+c5K92cxYBLWtrvymxobuMWDXTGoJmqdYXTjdzivey5C
	t0cZKo6DYNvY1P4T9gOvfZUNN7QFlPwM2znTDz/KCHXK5041QiNX1ks+DbnLcwiFKiTAM155SY0
	X3AjbykoU/+oLr3diatmh439olcnmJLI1YEXUdT7S8/LXmPBAVz432AuyLjLGtMO2sxC/Xjp4LF
	Y3iN+OhGFruCa+gRAIf2z4Jp5qIxFBM1I17lxd9398bYX1k7JyAxKscNyF1/d
X-Received: by 2002:a05:6820:a65e:20b0:702:dd8d:3167 with SMTP id
 006d021491bc7-714f2a0b974mr4624732eaf.53.1793668133765; Mon, 02 Nov 2026
 17:08:53 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029033106.7374-1-ki.chiang65@gmail.com> <20261029085610.GC2673734@killaraus.ideasonboard.com>
In-Reply-To: <20261029085610.GC2673734@killaraus.ideasonboard.com>
From: Kuangyi Chiang <ki.chiang65@gmail.com>
Date: Tue, 3 Nov 2026 09:08:45 +0800
X-Gm-Features: AclHuK__Z4IbWBemCKllUOBlE45796QmTyXwO65UFmWddNfrWR2s7z8p7hWvah0
Message-ID: <CAHN5xi0-=24_xzXWP9RwfogiRdtF9poWk=eYi+7JPQfXMUxxyQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add UVC_QUIRK_CTL_MSG_DELAY_1M for HIK camera
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: hansg@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the review.

Laurent Pinchart <laurent.pinchart@ideasonboard.com> =E6=96=BC 2026=E5=B9=
=B410=E6=9C=8829=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:56=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Thu, Oct 29, 2026 at 11:31:06AM +0800, Kuangyi Chiang wrote:
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
>
> We don't add random delays. This needs a root cause analysis.

We captured USB traces using a protocol analyzer and observed
different behavior between the failing and successful cases.

In the failing case, the device ACKed the DATA stage but kept
NAKing the STATUS stage until the transfer timed out.

In the successful case, the device initially NAKed the DATA stage,
then ACKed it, and the STATUS stage completed successfully.

The patch adds a delay after usb_control_msg() returns, before
the next UVC control request.

Although this delay prevented the timeouts in our tests,
we haven't identified the root cause yet.

We agree that a root cause analysis is needed.
Do you have any suggestions on what else we should investigate?

Regards,
Kuangyi

>
> > Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>
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
> --
> Regards,
>
> Laurent Pinchart
