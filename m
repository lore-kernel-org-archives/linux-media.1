Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960847;
	b=PdnydYeVzsAhX+l4dx1jZA5/DnjsK+ZKl/fCms+L4rWO3TQJ5XIGsHa0RJP73KltFNSQ
	 G4M6PMMpyxNHg4Y787fGPO0AwoFRDR2jUL0f4nWajmrMiQ65r6dDe19nP4XhBisHii3fG
	 Zuc+sFa9T7jTUBgsr+yx6+sjCF4AYdxOFTOsw53v542+672g79n8ix/RSeOVdd+GhCSTl
	 1gjn/INpAwpZrRRTUKKEsM5TUD5uBawub/BGgEWAncmkwfNw4V4lZzLOeC4CAE+N8U/R/
	 ey2agWYdhvyI7UN5iVDGr0IFiaG5pvMFzH8Kqcv9655Ous/+opl2m+UjC3nTnQ42Zig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EAbgVGUld3HpnIPduKowYF30RMUoJTrsR13doWBMVWU=;
	b=n9MdGeevpVKnGudVlA70bsMbaPTskt9fjOfqA9tRiFeVk2O26IH0BfhIm+cQbVJgNwWk
	 grc+ckG4uW7XO0+7hgXIJEzgn4OdyWXKqNeyUVo5XLiu0CqiVpSRJzRwPHNrQUKHjwnWC
	 KOtry8J/JDJzyVyxCY7x+4xmQRA77hts+/DJqSZs9HUzp8QZwebyi0MpTPMFAgDloEeAk
	 iCpRHZBTgjBs9pOycLlNx3EQYZFnwVsj8rw2pimpk1zweyN6BPwRloserSh+abahKloPC
	 +cLIgYpS+akB90FTHOBTbPijfFWnaPvy2KLsKl4gepere4Y9iHKAQ8gTr2qJHlrHh5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GC+TsGsE;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3128F606A32F
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 10:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3128F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GC+TsGsE
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so4738885e9.2
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 02:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793960845; x=1794565645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EAbgVGUld3HpnIPduKowYF30RMUoJTrsR13doWBMVWU=;
        b=GC+TsGsE8wO2Hqmh/BvcfoRAtl1hYOJCA591nhaN0pElgXjO4M20iBXdOIPR3RQliw
         3qlaglFraP1oT1m4iODRdxxnTpqnFA3+vCr/3V7msrqxK4ZHzvxYrnVNN+YvsVNZ6n8X
         RSYs8R+x3aGovviFhxMIPmkJ5JTzuWi+SsrBNx53LoqQq0YT2b+SO5ET5HXiA7wgA8pQ
         glJJ3s7RN6tV0DY2ad7Pb+XT06BUX1wF423tkB2AGe1rUmodr15NWHEZbbIth4uAdpr3
         sQRJw3yoUJ5ShRTxkaZhL37nzua6weueFVwHdIgRv3mph1yPnozKtZY5bq9F6AjIYjaC
         rGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793960845; x=1794565645;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAbgVGUld3HpnIPduKowYF30RMUoJTrsR13doWBMVWU=;
        b=O3YBwRH6sD7+B+zwNLPC9EJ+62s2nIyJZuGvpRCmqViHVyKrNvO5nqwhcKdtpLexiY
         XdF3vsGE7s1VsXk011RsNWiUJCzcYR2H5kgMG/bFDgT0lnuPT1hTdRFIx5Jto2hKbEw9
         a2vB/HC6+/vIk1pMo2f0CpfYnP+RdlzBKvdqmvwXW8l4xr556+JhQs7degUsNs/96EEO
         zwM7iz0wzQ3kCfqOHtiOAGHYbDa/VE+1G8y8Mlt2e2frW+FKL5JdabWOkOwzMnECFCQK
         yBWUQoXhgRVkWHfJ3syVF1OgQbnVZB4UkBPsdOK8+l7DbsC8FoGsbPUGZ3jHO9XMtfIP
         t6Rg==
X-Forwarded-Encrypted: i=1; AKwUvByo46SY4YrSUwoYK2HY7Qjuwwhey1FHQsydzVaeEO1yAoRlshEV0wOyJEBCWiaBLtgH80+OIoNm4lEWGw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ngK0DyY38T1Ndczfr6EffaNMfEzTVmv8uwkIZb2wvUAWnHuQE
	OkZI+20+NL+wJPbU9WzXFZBYczQOXr2G2aMXCKI1twIUAoiyFH84wIy4
X-Gm-Gg: AYBFou11l/YHgVy9vh+YT1Z9AoE4dhkvk/wGCsVOatOku7Wz9jVkEmw93b92t3qUhB/
	MPZKytyR6wk8COhxJFC09zepXx6NRCY51K4kN+YM4vZPLuEO48OGkCmNm3bZ+SUOtH4bh5LF1Nv
	lsvRAyvLvprPGggWqQ3LViQKxW86nYnrMtiIEupqcrNqDy4I12OMPlvRxd9tCf0euUK0xFZJJWL
	nqA8QdHsvo/HeoyQU1BjqHd6ZWQEDPRD3NOk9gLKXH7EYzA/Bx/mDGz8p4ltvUgqMw29dnlFUxk
	0QmSjf5pLnmJfTnMKKVjRNrI+PNKhcIb6X8nixJU/PGdqAotRnwOj0fZjTERUcfo5IQpQu3oXtU
	0uqvnlTLv8TS2sClSz9tJuU85L4zwnL66uH25at9gSN8o//2iROHFhiXFct/iCUPxGEi9R4rdLc
	b9s+o7Yf3Ztdilqn9FhG0yl8t2jLj2iqy//fxxtQ+tCwhnsnN9oNUKvjFfz61ZwoXeXeqgD64Xc
	7u0nCVMB9htdJkyHBTSW4CKzhNNlO2oyt1MdGGSkvPIpPoIzKk36bV8GSn5rusKoHhg0N4G/9BM
	M0XVjJ4JeiejjeTvpS4Bm+MIBnAcee9XLgJUJ6kDeZrTbTN+M5sIhyK4sFNgXQxP
X-Received: by 2002:a05:600c:190d:b0:4a3:59c7:f226 with SMTP id 5b1f17b1804b1-4b6de4a5d67mr34911775e9.6.1793960845310;
        Fri, 06 Nov 2026 02:27:25 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eab6esm59845305e9.1.2026.11.06.02.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:27:24 -0800 (PST)
Date: Fri, 6 Nov 2026 10:27:23 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, kees@kernel.org, justinstitt@google.com,
 morbo@google.com
Subject: Re: [PATCH] media: siano: Replace strlcat() with snprintf() in
 sms_ir_init()
Message-ID: <20261106102723.1cc4d350@pumpkin>
In-Reply-To: <CAPDEY+X7q2yeWaa7J=Nre+pQqUa2C760Hh9NovdGNSQ=VsEr8w@mail.gmail.com>
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
	<ausVkYs1-3rJ5Fj0@devuan>
	<20261105113229.4126d872@pumpkin>
	<CAPDEY+X7q2yeWaa7J=Nre+pQqUa2C760Hh9NovdGNSQ=VsEr8w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Nov 2026 17:44:00 -0800
Mariia Nikitash <nikitash.mariiaw@gmail.com> wrote:

> On Thu, Nov 5, 2026 at 3:32=E2=80=AFAM David Laight <david.laight.linux@g=
mail.com>
> wrote:
> >
> > On Wed, 4 Nov 2026 12:25:17 +0100
> > Alejandro Colomar <alx+linux-hardening@kernel.org> wrote:
> > =20
> > > Hi Mariia,
> > > =20
> > > > Date: 2026-11-04 01:02:39-0800
> > > > From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> > > >
> > > > In preparation for removing the deprecated strlcat() API[1],
> > > > replace the strscpy() and strlcat() calls with a single snprintf()
> > > > call to construct the IR device path.
> > > >
> > > > Both the source and destination buffers have the same capacity, =20
> > >
> > > The line above seems irrelevant, and potentially confusing.
> > > The size of the input is not important, because since we're appending
> > > stuff after it, truncation may actually happen. =20
> >
> > And gcc's stupid format overflow check is going to complain. =20
>=20
> Thanks for pointing this out! I initially tested with Clang, but reproduc=
ed
> the warning with GCC. I've switched to seq_buf for v3.

That is entirely OTT.
Currently scnprintf() doesn't complain.

David

>=20
> >
> > David
> > =20
>=20
> Best,
> Mariia
>=20
>=20
> > > =20
> > > > and the return values are unused. This preserves the resulting
> > > > string, including truncation behavior.
> > > >
> > > > Link: https://github.com/KSPP/linux/issues/370 [1]
> > > > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com> =20
> > >
> > > Except for the small comment above,
> > >
> > > Reviewed-by: Alejandro Colomar <alx@kernel.org>
> > >
> > >
> > > Cheers,
> > > Alex
> > > =20
> > > > ---
> > > >  drivers/media/common/siano/smsir.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/common/siano/smsir.c =20
> b/drivers/media/common/siano/smsir.c
> > > > index 283770d583d5..636ff228108b 100644
> > > > --- a/drivers/media/common/siano/smsir.c
> > > > +++ b/drivers/media/common/siano/smsir.c
> > > > @@ -55,8 +55,8 @@ int sms_ir_init(struct smscore_device_t *coredev)
> > > >     snprintf(coredev->ir.name, sizeof(coredev->ir.name),
> > > >              "SMS IR (%s)", sms_get_board(board_id)->name);
> > > >
> > > > -   strscpy(coredev->ir.phys, coredev->devpath, =20
> sizeof(coredev->ir.phys));
> > > > -   strlcat(coredev->ir.phys, "/ir0", sizeof(coredev->ir.phys));
> > > > +   snprintf(coredev->ir.phys, sizeof(coredev->ir.phys),
> > > > +            "%s/ir0", coredev->devpath);
> > > >
> > > >     dev->device_name =3D coredev->ir.name;
> > > >     dev->input_phys =3D coredev->ir.phys;
> > > > --
> > > > 2.43.0
> > > >
> > > > =20
> > > =20
> > =20

