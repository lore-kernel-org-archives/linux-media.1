Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792478830;
	b=PmeQ8MDUAdb9+CVDD/8xAsSWhX0Xei8PlG1XAVgWHKUMg7xXeG9vA9bgJ52y5qMpUhGH
	 +i3QpbrwS8Da8JEr0N8jhHFcN9y90zBHqiErFZcdRyDTFitbKHtIDuHDZZUM69mDUCAKn
	 My367rvXZi9B8Zq5JRSoY6Fp29GfJ6Zsso2tkbyJn65FAEj6lawqMstMxT050/tA+ti+Q
	 85Des/WT9PI69l7vW4+qKeMaRhgUNYc+i9N89+3A0iNftbYexucKQllABkeFaBspONJA9
	 YiAGLqvKdlKmevkoZYyRQUz3PRs0j7AF8xg2D7RboLkNUp9UDf53XjeZOYJ5NlLz7kQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OGzmT80QXI1a2zkaTtW/57msiwUM6XTRu1xe5SaKjfA=;
	b=bK4zEsKuW0SOdTTBNVpb55CZS0MVTylyFQtWXd/g+8xN82gTaRto2/mBFcuwhaD2YGXD
	 RSoTykEELmEDeO1bb76QrD7g5MGmoB069uFCuobfgRGWpAMXpOirxRXbsY4liabpSr86t
	 ENBeRw+jg223z4G7ZUUQcYc9DIWf+QJbsQ1bQmEDGArH+ujKIFXvUWpEpwYipceGX1Cjf
	 E8GsMKX1zBv826HlG7vRPjS/L4jDVEjs84Hpo3/lgwc7jfwNBA4egbXX20kTgduYv9+xH
	 jFu9CNgL39ac6UztZRRmoLLFCeMO0C3Ca/yw08m4aZtAwRplE/w67s5/EW7xNfloSbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="PBe/iCO3";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D8260A2604
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13D8260A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PBe/iCO3
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35f1f76ea84so5297394eec.1
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792478829; cv=none;
        d=google.com; s=arc-20260327;
        b=gumjs0x5eoFRxliPhwEpVEz2KgH3rzqVTZMTI0wbLN9uzl26G7rKj5dlDVYeBYPCXm
         2J/JBk4NOjyjdBU/oJ/Wg9lMkYktMAXSG6QgZiyfltr4ycfVYlGD3saSkySqU6o9L9LO
         7wHVJ7Vz6gy2gi7Y/PZu20gg97hor/EMHM5UcD6pWiACg0zdgYRIcYFELznGD/GSXgNm
         +wEBsBZ4N1utYCzPQwXfmRswaE4ZrtmgH4GfEMrI8Au1eqmr9TT+/x6rHZ77P+6/3l9S
         gi4bBxbFqf2jaQUNgJoBqRwGUdQMMCHj0Dg2qKaCqLzUo5vG67OUFtDRX+mcLz1dRomG
         xgzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OGzmT80QXI1a2zkaTtW/57msiwUM6XTRu1xe5SaKjfA=;
        fh=4G8v2jxtn7sLRaE4CTxwUqA6s1bp32S8Ws/oDLEwFVY=;
        b=ofD30mFOg0B7h70Wu4xI9x5lIGzNCPe8oBtgYTb2xu0dY+IY4nA/5pJI08P2H3bscQ
         dX8MR7hw6cv7h8xf71BPBayQZ9rGLjSBpbABfKMA+K9ZySgjxiaTFJKHUIa1fRltu4j6
         hEX0lxcqBunMy71Y2snWJ0k2qweI4Xwx8owheTEUaoya1XCNShcoENzOisDqGcvfkOmk
         hawn7hdfAbYI2ZqlowjRL1iCWMv17ocvghdouuhQ01Gu7KQJJetr+JeBNQm7cxRCrYyP
         p+B5UyJy4p0sRb+hYKWI71BvTxWCB5DOulMwSvw0qq/2LlSVQSiG6hxhxbtqcNtfJmrG
         Jzxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478829; x=1793083629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OGzmT80QXI1a2zkaTtW/57msiwUM6XTRu1xe5SaKjfA=;
        b=PBe/iCO39Tf8txrU9IoIfeb24Y3wiSXWoxke9fnEw7gifXoY5X6JenqXyH4a48tOTK
         PBDdrAtLrAvZB4yujBOxkutMDsfjU/OpMA/wwssdjsR7tS4zIEBoo+NHSeULAkzgrUuJ
         BmxahJAb17eFAgrtkwxURDYmRBlvKejLL78+CPefV/OtK0SXZNoZpwjIulqdP2+rVYeU
         3l7MztMthZv3hvVBEGuKz/Dh7OPjiFPNCt1/nQQHQkrJa1y5jNg3yzxnfz01S9+8MGhz
         IgKBx9dJzAG9bmuHkdXrfJWM39x1WqG7G2Hca7aWcbcOq9UM3w3Z1EG4oRlXD8oUiKbw
         UDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478829; x=1793083629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGzmT80QXI1a2zkaTtW/57msiwUM6XTRu1xe5SaKjfA=;
        b=UzrDnFPphaLD9ncIIoFAEqCPoOsDYHeNj2VoSA+6M6vxbcQ2SgIKsy632N4L8in34g
         cRjVTJmgL/NW6PX3dHcegbODh5jDpB/IRJGCjlMTvoem71IcShv3qEgQlCpMQeb6D7be
         jRZmLIrZGRO+BalSJ+BL2F/DeewnC3EWxHsJOAf8sGd7U3hxDYZsJoPfZXVpHTR3HgDu
         Inw776h03zgj0LIJqYMKAFHMjL3rbMVUaWmxxdow40NqdNkn0zdchHd1w/McEt3x0k2u
         ApX+PFV2g6aVyLhVcz2pLjNkHxROPf2Sta2dIhuWhN6hxVRyQz0kTGhI7pTF6B6kly8K
         sh5A==
X-Forwarded-Encrypted: i=1; AKwUvBzZp4Vp2j0EY3F4E9YMuCFwUq+B+YpSk0CLnltZdw3LD0EbmzHk7ZO8iE+DhUrIGrfhHJ2pGQ5fhjFf2g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIcO/qrXvJJ8d3NiSqWOVIJN9EEblvAmnWKyWdhXanTYVnF+zoX
	Ks9tJ8klPoMvBSskPahrv9nRj+Pti1/FDOXolz8tNjn/WDuUzMVsF8N8u18VqJfYcfyT9OuVbcy
	6htrBtbxULkTZqpVkTAuKlMGnlP5Ftk8atNAY
X-Gm-Gg: AYBFou34QCagNB7qaJM4ogTn0dPAK63eGT7eo8ImLpT0gloM6ey03QROknYWL2MbogP
	V5TtJuRyRjkVmS79rTYRYNz266ES39uIwY4I6HP+kcN0ge9lRGIOLvkhfDAhrRlQhxIqTWnYnHm
	CSnFstB0gDYZQ89caO72KKqb6a58zHoojOfibzAf4dSBVzQHzTQhKtMYcQcCpdDE17lo4INf39f
	RzC0gzjxR2I9kDtwzjOniSp0AjHj4Jsu78FNSEESyzAml7KTyGDIKL2Rnd6YDtaapyVZ4MPK1ry
	JLnRr64/pV4RBbtzQQ69gGlyD+/Zhu830UdcbtajM8GWMJiq5LDtzvdbH3hvNIkMN0Y3ZN5rxn5
	vq6LD+QxmpAdbgbd3IbsDyuoddZHlPseuT/NO6JbMkMTJ7kXlldL3JlvnOktL+bMSI+y94QRhOT
	+c2mkILuNvaSMd48Kor6FEmLE7xG3EyXLBy+NAavgTuXG0us3mOP84U50=
X-Received: by 2002:a05:7023:a4c:b0:164:4e36:f956 with SMTP id
 a92af1059eb24-18512c3817cmr12260179c88.16.1792478828068; Mon, 19 Oct 2026
 23:47:08 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com> <20261020015001.15672-3-patrakov@gmail.com>
 <CAHp75VdnqDsqcLtUEjJfJX0hmwfrV=SjEDrD9JOMXhY0aVbHMA@mail.gmail.com>
In-Reply-To: <CAHp75VdnqDsqcLtUEjJfJX0hmwfrV=SjEDrD9JOMXhY0aVbHMA@mail.gmail.com>
From: Alexander Patrakov <patrakov@gmail.com>
Date: Tue, 20 Oct 2026 14:46:04 +0800
X-Gm-Features: AclHuK_JVoq3P46NCTd8ZAC7ZphXWg9MMcJNeqTWC7ZMqOVlnPuXJteVRxeXoLA
Message-ID: <CAN_LGv1q3AZFdmG-T7v+v2YmzzhFsVtnwYfJh82M0W86TAbR4Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: ov5675: Add the OVTI5678 RGB-IR variant
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: johannes.goede@oss.qualcomm.com, adee.sahan@gmail.com, andy@kernel.org, 
	antti.laakso@linux.intel.com, dan.scally@ideasonboard.com, 
	diamondback@cohunt.app, ilpo.jarvinen@linux.intel.com, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:43=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Oct 20, 2026 at 4:50=E2=80=AFAM Alexander Patrakov <patrakov@gmai=
l.com> wrote:
> >
> > The front camera of the Lenovo Yoga Duet 7 13ITL6 and of the Dell
> > Latitude 7320 Detachable is described in ACPI as OVTI5678. The part
> > reports the chip id of the OV5675 and takes its register settings, but
> > its color filter array is a complex 4x4 RGB-IR one.
> >
> > The silicon is likely the same as the one of the OVTI5675, so it still
> > has some features (binned mode, hardware defective pixel concealment)
> > that assume the classic 2x2 GRBG Bayer array and thus produce meaningle=
ss
> > output with the RGB-IR array. Disable them for OVTI5678.
>
> Should be marked as RFC...
>
> > NOTE: This patch cannot be upstreamed as there is no way to properly
> > describe the color filter array layout of the OVTI5678. The color forma=
t
> > is a placeholder at this point.
>
> ...and this paragraph should go to the comment block, ...
>
> >
> > Signed-off-by: Alexander Patrakov <patrakov@gmail.com>
> > ---
>
> ...somewhere here.

Hello Andy,

Thanks for the review. In fact, all three extra patches are RFC or
even just "FYI", to show what exactly was tested.

To satisfy the formalities, I will resubmit them as RFC with your
remarks addressed when I have time.

>
> >  drivers/media/i2c/ov5675.c | 149 ++++++++++++++++++++++++++++++++-----
> >  1 file changed, 131 insertions(+), 18 deletions(-)
>
> ...
>
> > +#include <linux/mod_devicetable.h>
>
> Not in a new code. Now it's provided by i2c.h. We probably need to add
> an ACPI ID header to it.
>
> ...
>
> >  {
> >         struct ov5675 *ov5675 =3D to_ov5675(sd);
> > +       const struct ov5675_mode *modes;
> > +       unsigned int num_modes;
> > +
> > +       modes =3D ov5675_get_modes(ov5675, &num_modes);
> >
> >         mutex_lock(&ov5675->mutex);
> > -       ov5675_update_pad_format(&supported_modes[0],
> > +       ov5675_update_pad_format(ov5675, &modes[0],
>
> &modes[0] --> modes
> in this case
>
> >                                  v4l2_subdev_state_get_format(fh->state=
, 0));
>
> ...
>
> > +       ov5675->variant =3D device_get_match_data(ov5675->dev);
> > +       if (!ov5675->variant)
> > +               ov5675->variant =3D &ov5675_variant_bayer;
>
> With driver_data it makes no sense to support driver_override.
> Better to return -ENODATA instead of pinning some defaults.
>
> ...
>
> >  static const struct of_device_id ov5675_of_match[] =3D {
> > -       { .compatible =3D "ovti,ov5675", },
> > +       { .compatible =3D "ovti,ov5675", .data =3D &ov5675_variant_baye=
r },
> >         { /* sentinel */ },
>
> At some point the trailing comma should be dropped.
>
> >  };
>
> --
> With Best Regards,
> Andy Shevchenko



--=20
Alexander Patrakov
