Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795492065;
	b=EKRo1QGkWGewMh8edcpG5WYeWGhSaH1Q1qG+8BS9K6XMWBFgboy5sCelqQX1yhcNZoXx
	 CeHcVl1sV06o4zuSsg+iuu6Q3m6v473cxYwQ1U9NJD0Oc0rmLATbcJDrFCOoNRrPDpQeF
	 MjUDPsyS/LeAsWbPDFNGHXRS7NnKJnsTHruwHLAL+V/eGFwmAY1a+YRdQsYjJcEi+ckya
	 XtOlh5LOPU1GkhXlbdGKWUl7BDoDQ/YmvnhN0RlU41/vIj5Jkzkesatkk0ICy15rIifyp
	 GJIZMq40RDspSwbqJEsMV0XkuH8OHxx8griIwev4D0D8PKVowebay+04VtF0YRDzNbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492065;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=H+3HlGDl0jWhkQoLDJvtkNrFV/RdM1LfAUEpDa6mtKQ=;
	b=D/TAVGrpD20Cfnlf+Dv4RbzN0cb0gXBdV+dOeuAKg9l7LiqDTursxnPlAceMLf6V12Zg
	 n54+M5WMQNHHArWqa8gZS1dPNxS/x+gtSkHcoI5WUwZmP/usfV0mGFAPbzMKgUOpJOpXz
	 mDguavMeDS0u3MtIza9eDYzsohqIhWmUWuFXx/RLYcOhyZR61mXWL+UZ7sRsd5ux1PgY/
	 rXEgRen6xZ2U636NDO8cwsPOeZ4AyDGKBk/k+kSYWwVcnLx7FoPHz4GWs/ripO3H+kmZ/
	 LxY5joDEfEj0j7UAzdV0hzLYdu9MZpxeLem6aA2w/DjmMw6u3Avr4E4sNb5+PE7z22g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Z435zaMX;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F14A606A31E;
	Tue, 24 Nov 2026 03:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F14A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Z435zaMX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795492062;
	bh=WugA1Xe6UFchQyqrR/baOIOB+aIVWuHq2eVJHKMBAII=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Z435zaMXqZi+mNCGq7FMDiwNkztASb7kCOR1vOP8q6L2/TSfBCHSHBzaklBXgzP/M
	 /vPV9bVtqmwpxr2iqrJSx2M+kezCkKDzNIW77smXJlte/9K4WtkYRK+TOMoNjFwFB4
	 MtYtsYMEU5dWbNOQrSc5HfOkYeyhbf26We46lWLHdrU7MxMxvbtWfH4h6nJyCJpY03
	 mKI9DQ22deF5g3cfH+sZn9bgyhcjrf8wnzS/kujaAi3ZIra1qaGoWriTeskmaGReVk
	 OqplmhnEVOYsDGMMYvpmtUeWDha2SXYCyR1Y3A7L7dw6Ucod8yPG0Sgrlec7yTkG1d
	 9OIfqTKZxuFdA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6050C17E00B2;
	Tue, 24 Nov 2026 04:47:41 +0100 (CET)
Message-ID: <afb9f3dd7efebeadcfd04621d57e72374313fcc8.camel@collabora.com>
Subject: Re: [PATCH v7 3/3] media: verisilicon: Create AV1 helper library
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Nov 2026 22:47:39 -0500
In-Reply-To: <20261120143135.71134-4-benjamin.gaignard@collabora.com>
References: <20261120143135.71134-1-benjamin.gaignard@collabora.com>
	 <20261120143135.71134-4-benjamin.gaignard@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-rIlrM5CQacjfgEh5f7QL"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-rIlrM5CQacjfgEh5f7QL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 15:31 +0100, Benjamin Gaignard a =C3=A9=
crit=C2=A0:
> Regroup all none hardware related AV1 functions into a helper library.
> The goal is to avoid code duplication for future AV1 codecs.
>=20
> Tested on rock 5b board Fluster score remains the same 204/241.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> change in v7:
> - rebase the series on v7.4-rc3 tag
>=20
> change in v6:
> - include b84f6533a8ed ("media: verisilicon: rockchip: guard VPU981 AV1 d=
ivisor and tile buffer")
>   and 367db8b23c26 ("media: verisilicon: rockchip: reject AV1 frames exce=
eding the tile capacity")
>   fixes into the patch to not losing these improvements.
>=20
>  drivers/media/platform/verisilicon/Makefile   |    7 +-
>  .../media/platform/verisilicon/hantro_av1.c   |  816 ++++++++++++
>  .../media/platform/verisilicon/hantro_av1.h   |   64 +
>  ...entropymode.c =3D> hantro_av1_entropymode.c} |   18 +-
>  ...entropymode.h =3D> hantro_av1_entropymode.h} |   18 +-
>  ...av1_filmgrain.c =3D> hantro_av1_filmgrain.c} |  125 +-
>  .../verisilicon/hantro_av1_filmgrain.h        |   48 +
>  .../media/platform/verisilicon/hantro_hw.h    |    7 +-
>  .../verisilicon/rockchip_av1_filmgrain.h      |   36 -
>  .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 1091 ++---------------
>  .../platform/verisilicon/rockchip_vpu_hw.c    |    7 +-
>  11 files changed, 1140 insertions(+), 1097 deletions(-)
>  create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
>  create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
>  rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c =
=3D> hantro_av1_entropymode.c} (99%)
>  rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h =
=3D> hantro_av1_entropymode.h} (95%)
>  rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c =3D>=
 hantro_av1_filmgrain.c} (85%)
>  create mode 100644 drivers/media/platform/verisilicon/hantro_av1_filmgra=
in.h
>  delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmg=
rain.h
>=20
> diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/=
platform/verisilicon/Makefile
> index f6f019d04ff0..a1dd6c2d29be 100644
> --- a/drivers/media/platform/verisilicon/Makefile
> +++ b/drivers/media/platform/verisilicon/Makefile
> @@ -19,7 +19,10 @@ hantro-vpu-y +=3D \
>  =09=09hantro_hevc.o \
>  =09=09hantro_mpeg2.o \
>  =09=09hantro_vp8.o \
> -=09=09hantro_vp9.o
> +=09=09hantro_vp9.o \
> +=09=09hantro_av1.o \
> +=09=09hantro_av1_filmgrain.o \
> +=09=09hantro_av1_entropymode.o
> =20
>  hantro-vpu-$(CONFIG_VIDEO_HANTRO_IMX8M) +=3D \
>  =09=09imx8m_vpu_hw.o
> @@ -33,8 +36,6 @@ hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) +=3D \
>  =09=09rockchip_vpu2_hw_mpeg2_dec.o \
>  =09=09rockchip_vpu2_hw_vp8_dec.o \
>  =09=09rockchip_vpu981_hw_av1_dec.o \
> -=09=09rockchip_av1_filmgrain.o \
> -=09=09rockchip_av1_entropymode.o \
>  =09=09rockchip_vpu_hw.o
> =20
>  hantro-vpu-$(CONFIG_VIDEO_HANTRO_SUNXI) +=3D \
> diff --git a/drivers/media/platform/verisilicon/hantro_av1.c b/drivers/me=
dia/platform/verisilicon/hantro_av1.c
> new file mode 100644
> index 000000000000..2cde32f0e935
> --- /dev/null
> +++ b/drivers/media/platform/verisilicon/hantro_av1.c
> @@ -0,0 +1,816 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, Collabora

To be accurate:

+ * Copyright (c) 2023-2026, Collabora

--=-rIlrM5CQacjfgEh5f7QL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawUI2wAKCRDZQZRRKWBy
9IsJAQDzPkOm075MMWXCcLeu5KEwD4phFMCdQJprCIwoqnSh/AD+JXWa/422lgSo
mr69aLQM+/vfddhCSMK0pGiFDSIpzgs=
=rDF1
-----END PGP SIGNATURE-----

--=-rIlrM5CQacjfgEh5f7QL--
