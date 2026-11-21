Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795241025;
	b=Rsh9DxFWcbaChbDtiVKBxghUh+eIUtXhYOCUr9oZGPi7hi7MCfw0K+mUtRpPsphJJMw3
	 67Y/UuL+KN52BT+EKO0b2zABZc/k1xDjTIRT8WHEaX12oiLawL7WOAQ8E4UqUwfARShIJ
	 DgChQ/410fk+cqAvoQ0oBgq/rJsA8sEfN34GbyEX05Oinb5LHYNf0t0CeSyswjIZbTtIH
	 48RGtmRxXnsV5df61v5GdllXrhZdVKV/LgQtF/PgfbZEsKCmwmK5spjB1qQ+mkSasZUwD
	 STN47VhMX3p4+bVifQE/YHURHO1BorqW2XA95Glff5yEm9bSetlU2BwRtad4H8vDYyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795241025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
	b=Z9hRVHloyNA1D7o0SHDqE9lBqYi86mGGV4FsIe2UfHwb5HYm9MwQqowxvPvoM0ZJjUiv
	 T7xLCnwilvcmZIqh1HZqDEEG62jyygrePo3Zg+lZocv2J4Qq6BlqLKufTV+aP3ioTqa2h
	 rCTuZab2dZEG//lxokXn6RxkkqJc6Foy59kEGZs8hzyd/JoKQAOyQ154ruHydD5AUHiaw
	 hYQ896K6Lg/KVZ30nfoqza3VXC2dwD2bdyYfD2RS1Vz4pT5pswoaZhWVlKZ95xKxVEPmM
	 eCRrfwEAJwwuS2gLfGySQdJCW8IKyEVYJRIESvCpMebP8fbksGQ3Wnum4GpSCnjWTOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkncotie;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E00606A32A
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 06:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E00606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkncotie
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3869f03af6aso147741eec.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 22:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795241024; cv=none;
        d=google.com; s=arc-20260327;
        b=WAY3wV91iQiOOL3zjZEZqKHVkGGivFBgU/NLrkMktjzM0E09bt5yoGMquad5ITJV+t
         BU4pSVRpvP461N9ZaUjOVJy7CDqGvH07askLh73y+efxNbc5wI3C1URcb14nox47BV6P
         jA6zAcnyKQgkAzsYyrU3OOrtF8brvAQfY8o/gtRVFyHSv1JVyPNF1pAwirWx/4FE/jxp
         DwQOUOqXac6rJBy4rZHAk2CTyl9zX4DbtJ/Zb9RuQVQqEqOUUWM7v/M150EjFZxvSUib
         GtotfoAJ2XmN84sJQq5JqzXToVnLmBN5xs9vEzmKji5jCcmCzMhUx7P2V6uO31FgcWWn
         jr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
        fh=J+TBdfIJi5S6+u0nXxrTSFXrw/L6Lo/4ZfmN6Qz5D7M=;
        b=Ig8HO/i0ZmJKIObR/XuP32ZOOj4cu1TxYT/LMT3BkW8utkfwW+VrJ6llRqMC9Nko5K
         P+lHz9cm/QcmPhdnnVjuuVBaUqYCX30Zwp+5n/S+RN9vyIuKASWggwkRzql38AJgR9Z9
         smUz0jnRH+NWqgYCydAsEQ+d3PsmMXEXt5bBUbEbC+GTyu9pLmgBvNDFdYjMKLcITQ9x
         vytz4BxrtcWGjDzbor200oCny1IIyGmypinZhm9Xwzxaw3O10WOidTLKYhUfu52JtFlA
         XP1Ou/TuGkYRYrMz9zuD+7uugdEjvGHcgZuPL1iHJlyhdrkchyAtYbGCU+tZxa9HsdKu
         nmmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795241024; x=1795845824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
        b=fkncotieei3fyS8dWHzQm7M/AiGBj/CRGEBjdC2UYG1K6VO5O9PEVGFKKay9ckmx2z
         zS1y7h/y5IxeZ3c8VwbcVrRA3fVJQZM0IhChkXi1Jcf6wHM4gdrHWTdnteCJFFq8zo0w
         n8BTRduL63yAAFof8sanDkZWtT5UVPZsL9GrIebedHVQ7AXGV9w6BEEZqgblcJKX5xjJ
         jJZqdlB2de/PLQzCNejdlU18JJJVQQ0yNkz49Ypy9sabDWehPHpH2m2620BjUoL8UfGg
         5xugqW/nCm6pmHsgiOEnVtzjfSpmhpGmvx1U/cQXyj+xMuG0VuxXmQFXV2b7dI17fZZU
         ZCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795241024; x=1795845824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
        b=bNQWzoMycxl4y9G2HjLekHFfOjP70E0a7hfhK2KF6SZ33EKlMS2Dt43XV16XqhlGJa
         TK4vVv1lHJHxLQaxQtnfVlHWbThZjisWYshMgWMhuQLyt7Q0gOCMaQCvgQFt0bVs1WAI
         ycbr6sBFEu0OOhnCI3FHMRz1Jh05+AqIz/RwIO4P+hc5HWE0WL4asesjUAs7xEZZVfxG
         8DCY+WY2f2j6KQggH17KThlxFbXmXvUz6KypTy+/gSb5WUT1oQz8zfpz0pRGvHKLMeWR
         YLy8YitQiAs5DBD21u+nhaxV8Xw0HmycF5MWh2WP6nJTanBBXOUuBDma2CIDGO/twm8C
         1UUA==
X-Forwarded-Encrypted: i=1; AL+hErETUuyOHGPunm0Crrv2Tpgp1aDF5SI5X/WKy2uSNsiZmoh/7ZBoE4Lm+PZ4XvjQk44HlX89+J2g0n4OiA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/jI3yZm5NtgHn+Qe24Pdhf70MoFBfpPQjGBdUoBJptbfDmt6S9
	m8s5s5yioZajApNIJgZQUbX/NxrACA6jrHsBvVuKiLSTcR3YCmP+uvOVjV3zCE7ZVGTOCfjwax4
	ybYiAEjzvTsi0+Q/7kNynOeg2N+rtn/s=
X-Gm-Gg: AZFdTZcM2PuH2ndtF5vY/e5MdTlYAi+7ukvFTwt6UVpcHUVXV/oVrJy/vG9frucsOwk
	8YhT8cGfXnTha8SbtYogHYBMEP8x9+OjigYJxU6Bf2a9fLcX7MrECuR0RJhfq62R3TNakzLBWZR
	izbHGob9hfV7Si9/gk6DTr+nT26YXAGGAKkSwUhxJN9vWVdoLwK/t1Bq6WQJFJ1/bwuFFsD+0XZ
	fSrboJ8xNlEjTBp/W5fVy8OC9uDSXJQgfPEHqfhCykDgOZnyZPLCnI/b0V2jFOiRFnNfMaWqcs6
	NPFfzOfHOfXqf1T4oO5GMNT6BWAYYvs8+Ww3K70wH8brDByr7OpxrCEt+532Aew+jP0/ZqjERuL
	usDTZX1smEtLCbP//tcANcv3BATV7NJFv1RaaKOhwEXN/Xe3ru7MqyxEhV4bn7At14R8uA3+jfn
	tUp94kX89COaZIAkPAmFTOI7LCCgzQvw==
X-Received: by 2002:a05:7300:e9c4:20b0:383:6f73:eb34 with SMTP id
 5a478bee46e88-3856c6b00fdmr6323139eec.2.1795241023623; Fri, 20 Nov 2026
 22:03:43 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113161819.36847-1-clamor95@gmail.com> <20261113161819.36847-2-clamor95@gmail.com>
 <20261120143147.GA2466366@killaraus.ideasonboard.com> <CAPVz0n3u3oe1+H_w9jE2afb9PQT0VLtYVqfHeVNc3D+tLN6NDQ@mail.gmail.com>
 <20261120213116.GB2472094@killaraus.ideasonboard.com>
In-Reply-To: <20261120213116.GB2472094@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 21 Nov 2026 08:03:31 +0200
X-Gm-Features: Aa3M54qOnB5G9GXqLIL-lPBYx8eezPpq659tGJ_BSKM-GqCEY4niHx2BKUlkMTw
Message-ID: <CAPVz0n0h6xd4DbnpNTW63agospeJFqoV8vnkPYdzB3NmgVRM5Q@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] staging: media: tegra-video: Move driver to media/platform/nvidia
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Cong Nguyen <congnt264@gmail.com>, 
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>, Dan Carpenter <error27@gmail.com>, 
	Hungyu Lin <dennylin0707@gmail.com>, Hao-Qun Huang <alvinhuang0603@gmail.com>, 
	Yury Norov <ynorov@nvidia.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 23:3=
1 Laurent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 20, 2026 at 05:31:17PM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
16:31 Laurent Pinchart =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Fri, Nov 13, 2026 at 06:18:10PM +0200, Svyatoslav Ryhel wrote:
> > > > The Tegra Video Input drivers are mature and developed enough to be=
 moved
> > > > from staging into the media subsystem. No other changes are introdu=
ced.
> > >
> > > The driver should at least be converted to be MC-centric before being
> > > moved out of staging. I haven't checked if other changes would also b=
e
> > > needed.
> >
> > Does the media subsystem deny video-centric devices from even being
> > moved into it? I have not seen this restriction imposed; could you
> > please point me to where this is stated in the media subsystem
> > documentation?
>
> There's a consensus that devices that require control of camera sensors
> (i.e. "MIPI" cameras) must be MC-centric. That's not documented, we
> should probably fix that.
>

Yeah, stating this in documentation would simplify things.

> > I would like to convert this device, but that may take quite some time
> > and may case regressions if not done carefully. This patchset apart
> > from moving to media is mostly fixes to work correctly with mt9m114
> > and tegra114 bring-up which is quite simple and straight forward
> > change.
>
> Converting to the MC API will require some changes in userspace. That's
> why it's important to make this change before destaging the driver.
>

Noted, I will most likely drop destaging for now then.

> > BTW, may you ack mt9m114 get_fwnode_pad change[1]. I have updated it
> > to your liking, Sakari seems to ignore it.
> >
> > [1] - https://lore.kernel.org/lkml/20261006153619.304520-1-clamor95@gma=
il.com/
>
> In the review of v1, I wrote in my last message
> (https://lore.kernel.org/linux-media/20260721103845.GJ50424@killaraus.ide=
asonboard.com/)
> that the issue seems to come from a bug in the VI driver. Let's continue
> the discussion there.
>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/media/platform/nvidia/Kconfig                           | =
2 ++
> > > >  drivers/media/platform/nvidia/Makefile                          | =
1 +
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/Kconfig         =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/Makefile        =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/TODO   =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.c  =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.h  =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/tegra20.c       =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/tegra210.c      =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.c   =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.h   =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/video.c         =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/video.h         =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.c  =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.h  =
| 0
> > > >  drivers/staging/media/Kconfig                                   | =
2 --
> > > >  drivers/staging/media/Makefile                                  | =
1 -
> > > >  17 files changed, 3 insertions(+), 3 deletions(-)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/Kconfig (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/Makefile (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/TODO (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/csi.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/csi.h (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/tegra20.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/tegra210.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vi.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vi.h (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/video.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/video.h (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vip.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vip.h (100%)
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
>
> --
> Regards,
>
> Laurent Pinchart
