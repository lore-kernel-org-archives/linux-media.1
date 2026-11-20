Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795188690;
	b=G9ol6YZdO+wlm3Hwu/rYFr6fDf7SiaYerzwMwn3eQojC3r01P8sHGMLoiMXHj1MpvXX/
	 8uSCE3ChUCXA9j5HdBciQruCOrb2KK9kbA8OeprjSAbutmTUGZsxz1cu2ri9JGshZg+sR
	 RXWAF+GLZwkfUkKhh3hNbELcvPQJ2T3Q3vUWMqGYPINnl3XldU+q8B+loojsQS4rEdeWj
	 EePc5D78sPD/A8mNqHdC/ml1Z8DplhdYwgq5oVuJttD3YK/1UN8purvFUTrkfEAATKry2
	 TaMf2XMeIvkUvQGGJByuyuP8uxL8qoGofqiX1DAkZuuumn5U4Nad5pE9vmh/JgoTq7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
	b=F8tO8qlxPXqSoofb53oJ8nuhf/VJMbZ1p799QVVl+oWgdABzk4sHLS1FToqiBoVhifKE
	 FeVDrN3NfDLHJb/aGuSDWD5lwiizH2rA+6N55wBPO7iJ3/2xwbJ95LVdqGvdwYb6N8bZk
	 TUHI2nFlUpryDfzd8yVbGNU+Yu1SSa0ytIMFoS+Fi4dArpsS42WjbIS8aIu9yrdY1JZfH
	 GlTDJLm30gYoBmw1vjC8npzhPHZAeWTigH2TEyxUXBiMLRt+9c/LrvwYSBBghjzAHrplO
	 DXB8hdfnYhfIJPpgpR56oUN+vygTH9GrDS3tyZkMwZOZuzyHsMSs44Sm/IgoZd3ghEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rYiUfnZS;
	arc=fail smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E40F606A332
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 15:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E40F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rYiUfnZS
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3863db981d4so727793eec.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 07:31:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188689; cv=none;
        d=google.com; s=arc-20260327;
        b=fTNfL4HT+Y5gCZZhsLihN9Q4CoHBGtHsXBwF9PR8g6neKJNrJv9MmxX2JlXafCh8ms
         B3CuAaG6qkpiskqXhh+T11xrRbeGWbYsHUV4sGvr3zgFHAPCkkIYx6/zZrhAJ4Jl1YF8
         iXpAsGG8g+Urd1L8kgIIwtM/U+F20w9mGDsojIUJpGC+WFvFSgJT19lk9LSzgRxsQMCV
         hSjAJ6axRDLjbPJB69/Xz/w+jPxmdI4rkT7XqZTNlspP7bG5XdqoybGIaWJA6BycMwjZ
         epmb3+Rvbv/gnbK4HX3CSKv53WBdulmQP5aOAFUfenPBtB8lxrI2rzq6UMRNigJuBdmB
         5D4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
        fh=lQORkVNeTWnBNXolFIAearGsWzBhVUWYx6xEnrFb9Nc=;
        b=Jx7sGLupoiy2l4jLJbCNUEMcZiE9G3GvBAa7+JHJQpv8im1RCVnBj8JL+L3Z1RvIKS
         VDRZg741npTKA/Nbp/t1vtZtH5X47NBiVe0Y0JJy+Sew4US1mif2Sfw3RXps+jdkzl+x
         +nZBf+14Tnid+Vwa2Wa+S/bddfDmbWC7nySiLuqgoPMzTANsFkISLJ/isfL2wMgyFAtJ
         f3O3Fl1t0mHp176niORlYA7/IggE00KJPCtyEjODb58tG4hzRbRQ/HQdd9okmQbv/wQC
         2fgyW8aNJjZPK3WsBzthv4RQT1kesbAtUL4rIPQgBQCu0O46A09dVu96Li7D3/egj2RS
         Ol+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188689; x=1795793489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
        b=rYiUfnZSuaoielxLAtDf6tRtT09b3z0BbTf3Snshk09+yIK85WTu2JSCR8wJWNFFyE
         BONIXUlNMREfqT8nZtaskrOX9zSYxi5AXvSf30rqFA66oJ3LYHi7J3Mvj5THz6yVbEDE
         iK5wnp8bWy13CPECQBGqxn+SElETm1hRIy5Qam6OqXUD78v+dd6R5PcUnhTiC4ynJ+6T
         ZwdF3ery1c9v5wDocw5m2zc0VAUoNmiEaKySbXM1G28Z5oMGiNN++MUS0Fq9qykbeQuj
         AIBkQy/5BAYptgfXI0Au85iL2L2BqDxHptajlHv8Jnbkj6e3aibZBPHiotbwD8DmFSVd
         qCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188689; x=1795793489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
        b=L2EIaxMw3T8fW6WaAnfan9ZU8zcDcOV6ssDos/mxXj9/9YVYNHuwrQWN7A/RE4mKZu
         39f0pz3ZF2UOsIlvY0hwEkm7bv9Wsl0Fvt0BHdLWjR8/1J/BovAyeMbHXl9OOlcglD6x
         NpPg+/taedJfeJbYNYFHS6ZgWwIF35wxikPvziwhHzEk7LX3lVmPk3MVrSRDS8IWG3iK
         tSd7dCods3/crBHbK3Hf1h3k3rOEFetOtxFACO5l00Q3X1pgv4hDwMwKiFK9wGg96EpV
         JotGZZNJhYRMggr2ez5nwEAQ8KivUjxbt2TvuNaVP9O4kJ4nCrI9pjRNHdeYHtiqtk62
         a/HA==
X-Forwarded-Encrypted: i=1; AL+hErHGU3ozjVuOkb8L4IsjeNrQTYk9BC2AGuA9dALdvWJdr6XNePL6aqjOQfnTZi2bv9qmXom+/4v/6a5Chg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8mNrouSHSKpjSS7Z6+lFCpt3HI7bH8CcZOkMvo6OOQeXB7yxo8
	liHnv/eXei+QJe1zrC6VtqRnKvvh1hjctmcghkX4KKu48gzeO9dyYhmrQTKxDGH7luO4Swk2Fj5
	7A0PPjRuaWRcmb0H+0/VTAr/gDruSmc8=
X-Gm-Gg: AZFdTZcWtw5RXHIS4jzwReglpRWIrJmULfGCilyLcBZPicO9S7NblS8+NVUspU0F+HR
	S3AI+ht6rQ5FLEOZlmH3/EjuvwPFSRJ7AXauxLkm2y+hWvzGg7j4S5gI6JmFOjV0OsGhGg/zR/2
	dgldlYgvCBnTu07yAFGZbkdgRf3twJm5f0kSTvOq54inYOpXSPWDrvfm+/rLpj2vgN6gKlJ/GJL
	pHRKJl3oE+yD9cP/p4SHa6+OrTuoqIgYQay1nuGZ6Tf99cecjRdBdtCDPdZSfzJ7l9TWLXTFJLO
	DyFUkFfkir0q4nHAIR5q7LFqJU7q993wSMyB3uDSSgCCRsC4NTnEqF9NFcYDoChKUw0bqwI0T2n
	Q5PYrC1uXllmdmrc52xOwaSdy92hjBISDO4LprIAjG7WBpvei5kEAg8Qn9xfhTz+SgsfS7BYm5W
	74uUoLb699mxMf3dCYOQNQbHSbwxvF7DhQX4C8zc6W7ICwQL2Sb4g=
X-Received: by 2002:a05:7301:6408:b0:383:1bfc:f1c0 with SMTP id
 5a478bee46e88-38570f27a56mr3129077eec.32.1795188688670; Fri, 20 Nov 2026
 07:31:28 -0800 (PST)
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
 <20261120143147.GA2466366@killaraus.ideasonboard.com>
In-Reply-To: <20261120143147.GA2466366@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 20 Nov 2026 17:31:17 +0200
X-Gm-Features: Aa3M54rmNUuNZyda5qhpJslp9i1jTMK9Hg275DVhPVt4wZMMMc9yhIUe9r0PTkY
Message-ID: <CAPVz0n3u3oe1+H_w9jE2afb9PQT0VLtYVqfHeVNc3D+tLN6NDQ@mail.gmail.com>
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

=D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:3=
1 Laurent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 13, 2026 at 06:18:10PM +0200, Svyatoslav Ryhel wrote:
> > The Tegra Video Input drivers are mature and developed enough to be mov=
ed
> > from staging into the media subsystem. No other changes are introduced.
>
> The driver should at least be converted to be MC-centric before being
> moved out of staging. I haven't checked if other changes would also be
> needed.
>

Does the media subsystem deny video-centric devices from even being
moved into it? I have not seen this restriction imposed; could you
please point me to where this is stated in the media subsystem
documentation?

I would like to convert this device, but that may take quite some time
and may case regressions if not done carefully. This patchset apart
from moving to media is mostly fixes to work correctly with mt9m114
and tegra114 bring-up which is quite simple and straight forward
change.

BTW, may you ack mt9m114 get_fwnode_pad change[1]. I have updated it
to your liking, Sakari seems to ignore it.

[1] - https://lore.kernel.org/lkml/20261006153619.304520-1-clamor95@gmail.c=
om/

> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/platform/nvidia/Kconfig                           | 2 ++
> >  drivers/media/platform/nvidia/Makefile                          | 1 +
> >  .../media =3D> media/platform/nvidia}/tegra-video/Kconfig         | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/Makefile        | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/TODO   | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.c  | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.h  | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/tegra20.c       | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/tegra210.c      | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.c   | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.h   | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/video.c         | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/video.h         | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.c  | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.h  | 0
> >  drivers/staging/media/Kconfig                                   | 2 --
> >  drivers/staging/media/Makefile                                  | 1 -
> >  17 files changed, 3 insertions(+), 3 deletions(-)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
Kconfig (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
Makefile (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
TODO (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
csi.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
csi.h (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
tegra20.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
tegra210.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vi.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vi.h (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
video.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
video.h (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vip.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vip.h (100%)
>
> --
> Regards,
>
> Laurent Pinchart
