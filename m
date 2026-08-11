Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FF4381E83
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 07:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786432698; cv=pass; b=pe6HCJBlWiBjK77EUIUcKHFmlVNX0rFmK4ExWjLNCHS95+jxGQMXPbUfAan8YN5mSHdjyjMCjEIDaXBb/0ux6bGmuxbcGuMwB28pulm4iHxZPlZLNZ+qP41WKUj8YP+Rj3P2PUSbdHGaGqRlUdtUx4i4+kidU2ac+OtRi4LAP4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786432698; c=relaxed/simple;
	bh=rEwZQ1CUQnEJj/4desrM8UrEwDbVByNjKCTmCZrm+tM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EaWPdsnMXi7hN4pSX6tx1u7SoxsDOjAyeKo/i4Pmqi7NY40QZjEHXSqT9W+Bs1DYQAGK6v8Lc7J9g/gS+MO2Pe3sCiGnXXEiYP58sxQdYlKHapfMlKLTPWHQdKcwRgdh0Xobzoq/lirPNJcvqqEJUwIFscdzo3pwdf+24ptG9JU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyYZ4ucl; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyYZ4ucl"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a10d6f455dso402642a12.1
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 00:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786432693; cv=none;
        d=google.com; s=arc-20260327;
        b=PTYyeI8cxjuavERodH2uGXNZTv1f2R6U3K/cuSlLtaAY4VKq8UWYqXNc3SM+GnkUP4
         e3OuwMf2D20d259KVuHWBNHXdvqv2SQ+njFpOZJvCIfJa7zs4Fi6Wbu1LMd5OnL8UI6R
         sFFpCKpSplYztJuhZovIAGO9eJdicsYTElmcD49HkjBlMjFmrRITD0p4lgxduJlR7U6p
         JE9Wl8OB3uRY4umKUQ3KMIw+k7I4MNalEb29wgNjTEiN8G4nAqRiBvKa/C0FByy8E4sS
         ahIhBNIqVvdt+rXzF4jjnXJe9c5kbbfUacBwKJ3Ivm7WydCQzoGT909fV9zYPFAZp5Si
         ESnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mMd3mDEzsh/bPauJVacIG4AFn2DZjvrAEWpiBcjl6EA=;
        fh=dfrsB4vkuMfmv8Y6eMQ7OXjNAj5fZjY0gQMLv/KzI8Q=;
        b=q2tkXvuClucRLpiWG91WR5FBGM7lukoBpPkMeGNpvy9vI3T6M0+do0r63Tq7Zjlqmk
         +SMPmYTbbUsTcgK2YfmZWXZrZQ/+m/4PAcPFi30NsKZht46Sfxei9LNJS66QJEfUu/Tb
         liDaXd4+26VIXLNjqBD+cxTNY6QU/K3WcAuSIPJkm93twDalcNhN/Ko/zH9NKegtx/lU
         VbdB1R09gzf5a73iUNOtYUvjQeY4hb3TNpFCsFg68E+nWEg1ReU73MDs9a2rd61MtaAs
         PaxYJqnGVb4qFe15I0RZq7bcHA8oCjjm7VVe03AAPR8ekT5NBc9dJzQG/nh1Q9MMnYLA
         TvGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786432693; x=1787037493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mMd3mDEzsh/bPauJVacIG4AFn2DZjvrAEWpiBcjl6EA=;
        b=AyYZ4uclOS1p7NKiVsQtPvbRLaY++gdZvSj8Ha1dCjF4H46s7nA6WXog3n02m5EGvH
         7NsKZsuj3oU5nerrlyEh2G6ldqUeY9aWgCLvYVsGK7tXMEFvOm6CK0t2BAoM+YuFCkbf
         KxuNo3VaTviAMOorYo0bweXeC5I1EEKmRmpa1si701Fqf77Q8P6XwmNvP8nqgkI+IaN6
         g66W97DSkOU43wVar7jbQnafHhpGBPGRKPthFzG35rq2Kx2ZK4tkHtkalhsV9xio2BaX
         +auOoiAEylMKRge1z1pFrfi8Pw6msWMPNDp6lDSVeG4RgVBIMrZA3wYDPn5YSOTayPa7
         JgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786432693; x=1787037493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mMd3mDEzsh/bPauJVacIG4AFn2DZjvrAEWpiBcjl6EA=;
        b=ntTM+VcVGNaVAvwtcCMlWYV7W40sOnaIenTXlUvvCnTy3i/a3aW6XXygD4n6aEnQa4
         TaoPb0FMFU/veyJG8R1oBMg4X2zx/4h7a39xRzKXO8cU8IITMvvp7UPnpaiGd2neTOAz
         ZkQyCBfp4VeKKbLEEOZjkCv6LWYX8xrKAEWt/F6Ccim8ioTmm+u4VQmRPEafVTHtpraY
         uP/IgVc4PJD3qaEaFTUakHa6pnTqsV4jmuDMflexxKLxZZMuASDQRviSWBZzIpmGGXw9
         BxPgiSFFaZYd+WMFT0SAmhXbpIlKsMdbc6dkfgxuUnojhSTjp5EexQpT6wLTl1223aWK
         ttJw==
X-Forwarded-Encrypted: i=1; AHgh+RpgdwCSxHYxavJIqv+1yVj5AC2IhW7UdsBGLshk/h98weeY5RepCMqc+agpjVNiffZzzsVUSCYhJ9pyvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycGkuJLl+42V4xiWCOxtC9ILVv+XDJCGYhr+tT/Nxg4GyBeEc7
	BbnrkVU3WglgO1dXI0U3qV0HUjHbHJKm1DC3RExT0auIK6j+QwjmFR1jqmzWKZ+ngHkQjxYjuiF
	ld2leY2HRLagAGwW9uEKyKNupT5a0EBLaUl4W
X-Gm-Gg: AR+sD10N3GV9wFF1nyfCfoKACLjfDUtdFqDdZedYbAzbO8hlkw4gz4UkxALRuyerKT1
	u2s3zq0eeh/tF9Gg9ksJ0JMNpS42AoEwEybCnGkia0aUs08wFwYc6rOjdNv7VgC2qwwZ55cEEVv
	a5Zot+RGPMSsFriwG0OtOFclSbos9YeEQYJDz4+LBhVhv4OiJGqRWuyv3XVkgm0b0x9K01EZ+Mh
	/5v3VM0h/ISi6JMI1s39u5ouIIJy2vtsAs9a3dVnQvsXEdNq5VXunpTmZabV89toC8sD4DQce8u
	ePcKbGfwzNtpp4oNMgUT/aH6/y48EOKnIeGgE0srQ6A=
X-Received: by 2002:a05:6402:e95:b0:6a0:19c8:f9c0 with SMTP id
 4fb4d7f45d1cf-6a364520ee6mr374159a12.4.1786432692638; Tue, 11 Aug 2026
 00:18:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-ov5640-1lane-v1-v1-1-79699457ce13@gmail.com> <anq5HzmP33fqWYEO@kekkonen.localdomain>
In-Reply-To: <anq5HzmP33fqWYEO@kekkonen.localdomain>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Tue, 11 Aug 2026 15:18:01 +0800
X-Gm-Features: AUfX_myFP5dME8niq9-mAhbCcuAxyLLCEIp-NHN_rgV5RBWZj9H6b1AfgaH4yTM
Message-ID: <CAPwA33LJsSr3w_Vfc6wd7VXNBW2fjrn2zaVxDGB_RfJ-FRrdHg@mail.gmail.com>
Subject: Re: [PATCH] media: ov5640: select the MIPI lane mode from the
 endpoint lane count
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Thanks for the review.

> I guess there wouldn't be harm from backporting either.

Agreed, switched to a plain stable Cc.

> How about:
>
>         ret =3D ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
>                                on ? 0x5 | ep.bus.mipi_csi2.num_data_lanes=
 << 5 :
>                                0x40);

Nicer, thanks - applied, with the lane count in a local variable to
stay within 80 columns.

> Do we need quotes?

Right, dropped.

Thanks,
Jason


Sakari Ailus <sakari.ailus@linux.intel.com> =E6=96=BC 2026=E5=B9=B48=E6=9C=
=8811=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=881:54=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Hi Jason,
>
> Thanks for the patch.
>
> On Tue, Aug 11, 2026 at 12:40:13PM +0800, Jason Yang via B4 Relay wrote:
> > From: Jason Yang <jason98166@gmail.com>
> >
> > ov5640_set_stream_mipi() always programs IO_MIPI_CTRL00 with 0x45,
> > which selects the two data lane mode: the number of data lanes
> > described in the devicetree endpoint only feeds the sensor's clock
> > tree computations, so a module wired with one data lane starts
> > streaming in two lane mode and the receiver never assembles a
> > frame.
> >
> > Select the lane mode from the endpoint instead. The one lane
> > encoding is [7:5] =3D 001 per the current sensor manual (version
> > 2.33). The 2.03 manual documented 000/001 for one/two lanes;
> > OmniVision corrected the table in version 2.1, which is why the
> > long-standing comment here found 001 unusable for two lanes and
> > validated 010 instead.
> >
> > The power-up path also programs a two data lane mode, but that
> > value is overwritten when streaming starts, so it is left alone.
> >
> > Tested with a single data lane module on an i.MX8MP board
> > (imx-mipi-csis receiver), where the unpatched value produces no
> > frames at all, and on an RK3588 board.
> >
> > Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> > Cc: stable+noautosel@kernel.org # no in-tree 1-lane users
>
> I guess there wouldn't be harm from backporting either.
>
> > Signed-off-by: Jason Yang <jason98166@gmail.com>
> > Assisted-by: Claude:claude-opus-5
> > ---
> > The three [7:5] encodings were exercised individually on the
> > i.MX8MP board (v7.2-rc4, data-lanes =3D <1>) by patching the value
> > and capturing with v4l2-ctl:
> >
> >   001 (this patch): 30/30 frames, zero PHY error events in
> >       steady state (3 x 300 frames)
> >   000 (2.03 manual / NXP KB): same result
> >   010 (unpatched two lane mode): no frames; the receiver logs
> >       only start-of-transmission errors and never assembles one
> >
> > The RK3588 run used the same module and devicetree (data-lanes =3D
> > <1>) through a Rockchip CSI-2 receiver, streaming to natural EOS
> > with a clean kernel log.
> >
> > Happy to run additional tests on either platform if that would
> > help.
> > ---
> >  drivers/media/i2c/ov5640.c | 22 +++++++++++-----------
> >  1 file changed, 11 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 8deb5f5501fa..ef731709bdc8 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -1826,27 +1826,27 @@ static int ov5640_set_stream_dvp(struct ov5640_=
dev *sensor, bool on)
> >
> >  static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
> >  {
> > +     u8 val;
> >       int ret;
> >
> >       /*
> >        * Enable/disable the MIPI interface
> >        *
> > -      * 0x300e =3D on ? 0x45 : 0x40
> > -      *
> > -      * FIXME: the sensor manual (version 2.03) reports
> > -      * [7:5] =3D 000  : 1 data lane mode
> > -      * [7:5] =3D 001  : 2 data lanes mode
> > -      * But this settings do not work, while the following ones
> > -      * have been validated for 2 data lanes mode.
> > -      *
> > +      * [7:5] =3D 001  : 1 data lane mode
> >        * [7:5] =3D 010  : 2 data lanes mode
> > +      *                Encodings per version 2.33 of the sensor manual=
.
> >        * [4] =3D 0      : Power up MIPI HS Tx
> >        * [3] =3D 0      : Power up MIPI LS Rx
> >        * [2] =3D 1/0    : MIPI interface enable/disable
> >        * [1:0] =3D 01/00: FIXME: 'debug'
> >        */
> > -     ret =3D ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
> > -                            on ? 0x45 : 0x40);
> > +     if (on)
> > +             val =3D sensor->ep.bus.mipi_csi2.num_data_lanes =3D=3D 1 =
?
> > +                   0x25 : 0x45;
>
> How about:
>
>         ret =3D ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
>                                on ? 0x5 | ep.bus.mipi_csi2.num_data_lanes=
 << 5 :
>                                0x40);
>
> > +     else
> > +             val =3D 0x40;
> > +
> > +     ret =3D ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, val);
> >       if (ret)
> >               return ret;
> >
> > @@ -2535,7 +2535,7 @@ static int ov5640_set_power_mipi(struct ov5640_de=
v *sensor, bool on)
> >        * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
> >        *
> >        * 0x300e =3D 0x40
> > -      * [7:5] =3D 010  : 2 data lanes mode (see FIXME note in
> > +      * [7:5] =3D 010  : 2 data lanes mode (see the note in
> >        *                "ov5640_set_stream_mipi()")
>
> Do we need quotes?
>
> >        * [4] =3D 0      : Power up MIPI HS Tx
> >        * [3] =3D 0      : Power up MIPI LS Rx
> >
>
> --
> Kind regards,
>
> Sakari Ailus
