Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59F437EFF1;
	Wed,  8 Apr 2026 19:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775677749; cv=none; b=GQUQt1g4u0QWiC3b5tSGdngTvJ+q+uNOTrIosVd54vMC0t8Qzc8lciNxLQ9buBtWlY9OkrZXumEq6rNPaw+eQiz4ZEWA23L8Cf0P9junSmnqMyowBmSoxQkO5wu0aGrIRjEN8/VJAEvKJOeFRkbjc6ko7yWM3cF6BzKXfsPtkKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775677749; c=relaxed/simple;
	bh=tz8CVy1W20G2fKkpZL7CTx9D5Goyx1D1bN5OlJng/I0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TIpf60NVN8HIi4OMLb4DC9WvKc+NcJY5Yo1B4jPnkclAqvUqAA3Rw8lJ1H7djIUDVZu8vjTdHPqQIuLm5ViALtrwbOH7eZT1yJtKNhqIRqiHIeXCMMnmE/wkjQtqSfukJdNhSpxwUxTtsQU9WlUT8tsPVjQ2uGdhdjgJt2ECFoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qquXjlNt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qquXjlNt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775677746;
	bh=tz8CVy1W20G2fKkpZL7CTx9D5Goyx1D1bN5OlJng/I0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=qquXjlNtlX/W3P6CQcrmMP1FqkU+bjHfmbSfGIBGRpjvE9TXs7eJEbMhfumadx2zP
	 mY6G+zfD+ZI8/WG6ATCuhO7Dh4aKG09f7RYHz6snWYizEcfTetq4PUYuWkP19iNFSz
	 yiBTNWkyL3z0wWkgM3rd5zs2/j4us+7MMbLuD1sbKDnSPGX9we83h1CMmS5sG/EyPo
	 uEzgTUxW3uxorkoiGuHIU3rSZGrVKpKJTXbgEpastF1neshWm34nLogGVlVAptGVDC
	 6fgYQ7+AMcdFD6dcNa9tKTlkIRBmApRXEEEkpm0OHGjJ7btq9bkxJlHoh/4moaDeBj
	 5T3WV+u2XdzmQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D225E17E0A2A;
	Wed,  8 Apr 2026 21:49:04 +0200 (CEST)
Message-ID: <16fecb553474b09c280e76d85db619fd2171d8b6.camel@collabora.com>
Subject: Re: [PATCH v2] media: verisilicon: Create AV1 helper library
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Date: Wed, 08 Apr 2026 15:49:03 -0400
In-Reply-To: <20260312091525.28118-1-benjamin.gaignard@collabora.com>
References: <20260312091525.28118-1-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-BquN7X0OQqwiN7U+0FMh"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-BquN7X0OQqwiN7U+0FMh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 mars 2026 =C3=A0 10:15 +0100, Benjamin Gaignard a =C3=A9crit=C2=
=A0:
> Regroup all none hardware related AV1 functions into a helper library.
> The goal is to avoid code duplication for futur AV1 codecs.
>=20
> Tested on rock 5b board Fluster score remains the same 204/241.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> change in v2
> - rockchip av1 codec use hantro_av1_get_hardware_tx_mode() and no more
> =C2=A0 it own function.
>=20
> =C2=A0drivers/media/platform/verisilicon/Makefile=C2=A0=C2=A0 |=C2=A0=C2=
=A0 7 +-
> =C2=A0.../media/platform/verisilicon/hantro_av1.c=C2=A0=C2=A0 | 780 +++++=
++++++++++
> =C2=A0.../media/platform/verisilicon/hantro_av1.h=C2=A0=C2=A0 |=C2=A0 62 =
++
> =C2=A0...entropymode.c =3D> hantro_av1_entropymode.c} |=C2=A0 18 +-
> =C2=A0...entropymode.h =3D> hantro_av1_entropymode.h} |=C2=A0 18 +-
> =C2=A0...av1_filmgrain.c =3D> hantro_av1_filmgrain.c} |=C2=A0 82 +-
> =C2=A0.../verisilicon/hantro_av1_filmgrain.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 44 +
> =C2=A0.../media/platform/verisilicon/hantro_hw.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 4 +-
> =C2=A0.../verisilicon/rockchip_av1_filmgrain.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 36 -
> =C2=A0.../verisilicon/rockchip_vpu981_hw_av1_dec.c=C2=A0 | 942 ++--------=
--------
> =C2=A010 files changed, 1048 insertions(+), 945 deletions(-)
> =C2=A0create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
> =C2=A0create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
> =C2=A0rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode=
.c =3D> hantro_av1_entropymode.c} (99%)
> =C2=A0rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode=
.h =3D> hantro_av1_entropymode.h} (95%)
> =C2=A0rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c=
 =3D> hantro_av1_filmgrain.c} (92%)
> =C2=A0create mode 100644 drivers/media/platform/verisilicon/hantro_av1_fi=
lmgrain.h
> =C2=A0delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_=
filmgrain.h

[...]
=C2=A0
> =C2=A0	rockchip_vpu981_av1_dec_set_parameters(ctx);
> =C2=A0	rockchip_vpu981_av1_dec_set_global_model(ctx);
> @@ -2197,6 +1439,16 @@ int rockchip_vpu981_av1_dec_run(struct hantro_ctx =
*ctx)
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)

nit: The wrapper is no longer needed, you can change rockchip_vpu_hw.c code=
 to:

           .init =3D hantro_av1_init

> +{
> +	return hantro_av1_init(ctx);
> +}
> +
> +void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx)
> +{
> +	hantro_av1_exit(ctx);

Same nit, different function. Appart from that:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> +}
> +
> =C2=A0static void rockchip_vpu981_postproc_enable(struct hantro_ctx *ctx)
> =C2=A0{
> =C2=A0	struct hantro_dev *vpu =3D ctx->dev;

--=-BquN7X0OQqwiN7U+0FMh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCadaxLwAKCRDZQZRRKWBy
9OVJAQCBHm061j2iSakJtpkUf3ehkY8lD427TC3hCZcwyNnOBQEAz7E+YilOtBy0
YD6ugaA0uvKYx6SYGex2GZ7c3rAPSQQ=
=FywA
-----END PGP SIGNATURE-----

--=-BquN7X0OQqwiN7U+0FMh--
