Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488351;
	b=0JBP0V6DbMRwgRZubHR2l9VfM4PuKRJiG+Rim2dW7qbb8OP5L22OMr6eesrjXh61xtop
	 fzpXjsRpUEVXDD7RI/z48P2jdtBGrJ1PN4rJIHx81bbchLwR+/pUwRZBgoXYUOKq0dD9c
	 xTmN0nErhsTRqZSz+XxNOj2JWlouSwExE5ZPNjjZli3MtI0MqqdUU2Y1nHMF5TQSnAHBm
	 P98FnEUVTdIkbsAo8OSTtBbUO+mtGrzvYCsyaJyJ1REoA4jJMS6y9aaKQ6AAQpovQN/z3
	 oh5SmHCkLASnxAeh/XO7eb4zOhBxRtQLiofT4x/VrTL8gkBiJLNoCNV+3dygwMWQcBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488351;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=25hLlxTJQf/HNrXLL86Uy2x9BKppkKPY+LRi2SlkhQ8=;
	b=2QtCtmCnmhrrtkoTutL4pmfRSo7o1wbcf6d/TqGV3lf4qBUHOgpFu6TLSdwXChf3TIii
	 SjRlPoRiejZDC+ukKo2w9utARXtZd7xyk6alGhaB+sFMPdVyeM2kL6sdw6ut8dF9tg1xM
	 yH21ZBMl5078Kl0slcAgUEcFnfmR5fymmDYUTqoeVEvUKmBnvvHneqObjBFWwMaR7c0kf
	 sBFIPLC48913KcsEBZ7k1kr6WGugpR+iyqv83o+Bsib1sZtWAldYqUlp/6pve2ZXdVJNQ
	 Ca/ir04ThT+UqImJvqfgDUaaz9JJ9OSXUN1/4jy8caFUEnyvBjIg1wB2eNk7Nr1TP1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BNJlh81v;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DD6606A31E;
	Tue, 24 Nov 2026 02:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1DD6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BNJlh81v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795488349;
	bh=hAWPWROczWYZNupwEyTrlKdHA0d8EAftyJ0z6GpDucA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BNJlh81v/8EtCMnxtkuGdFNYcCZpwLd0Ci7dYykDdWza5ubw8zHIMuh0+h1wge8rd
	 3AKDZwGENysd6nrDheXZsXzJQcSjz5eWG8om4NS/6McoyZkHrb/4dvLsfmH4b0sYA9
	 gDhVafa04lj6V1BYwgM6/yo5ymAunV2zbgB7HCSTLHsizT/qZLbFAK++bMjONqvMHp
	 ibAutszOnNFyUAGnjConVtKWfrsNzt4voG9yYc9DYyWPG0jflewPs2JW/vj98rTjro
	 3EN6MRG0HHQTxgHS94jgfBvIsLN0EyWYz/Zgjr78UbSb4x7IgzuZ2q1dkjZxzJjaM3
	 5ofAvY1wx7gYw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1778117E0CF4;
	Tue, 24 Nov 2026 03:45:46 +0100 (CET)
Message-ID: <74db7a7fa49abac0a91fb8585703b90244428b02.camel@collabora.com>
Subject: Re: [PATCH v2 2/7] media: verisilicon: Enforce a minimum CAPTURE
 sizeimage for the encoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: aiyengar1990@gmail.com, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner	
 <heiko@sntech.de>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Hans
 Verkuil <hverkuil@kernel.org>, Boris Brezillon
 <boris.brezillon@collabora.com>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sergei
 Khomenkov <shomenkow@gmail.com>
Date: Mon, 23 Nov 2026 21:45:44 -0500
In-Reply-To: <20261112-hantro-jpeg-enc-fixes-v2-2-de03e643c75d@gmail.com>
References: <20261112-hantro-jpeg-enc-fixes-v2-0-de03e643c75d@gmail.com>
	 <20261112-hantro-jpeg-enc-fixes-v2-2-de03e643c75d@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-AdAYXv1YzTfNAtP30eeO"
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

--=-AdAYXv1YzTfNAtP30eeO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 novembre 2026 =C3=A0 08:31 +0000, Arun Iyengar via B4 Relay a =
=C3=A9crit=C2=A0:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> For coded formats hantro_try_fmt() only computes sizeimage when the
> application passes 0, and otherwise accepts any value. On the encoder
> that lets the CAPTURE buffers be far too small for the selected
> resolution.
>=20
> This is easy to hit: "v4l2-ctl --set-fmt-video=3Dwidth=3D1920,height=3D10=
80,
> pixelformat=3DJPEG" does G_FMT, modifies the size and calls S_FMT, so it
> passes back the 6768 byte sizeimage of the 96x32 default format. The
> driver accepts it for 1920x1088, the hardware runs out of stream buffer
> on every frame and the encoder only produces empty buffers.
>=20
> The stateful encoder specification lets the encoder adjust sizeimage to
> match hardware requirements. For the encoder, clamp the requested
> sizeimage up to the size already used as the default, while still
> allowing applications to ask for larger buffers. The decoder behaviour
> is unchanged.
>=20
> Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/media/platform/verisilicon/hantro_v4l2.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/m=
edia/platform/verisilicon/hantro_v4l2.c
> index d033fe0ecef6..c4e36a79eecc 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -386,14 +386,25 @@ static int hantro_try_fmt(const struct hantro_ctx *=
ctx,
>  =09=09=09pix_mp->plane_fmt[0].sizeimage +=3D
>  =09=09=09=09hantro_av1_mv_size(pix_mp->width,
>  =09=09=09=09=09=09   pix_mp->height);
> -=09} else if (!pix_mp->plane_fmt[0].sizeimage) {
> +=09} else {
> +=09=09u32 max_size =3D fmt->header_size +
> +=09=09=09pix_mp->width * pix_mp->height * fmt->max_depth;
> +=09=09u32 *sizeimage =3D &pix_mp->plane_fmt[0].sizeimage;
> +
>  =09=09/*
>  =09=09 * For coded formats the application can specify
>  =09=09 * sizeimage. If the application passes a zero sizeimage,
>  =09=09 * let's default to the maximum frame size.
> +=09=09 *
> +=09=09 * On the encoder, a buffer that is too small for the
> +=09=09 * current resolution only gives failed frames, so never
> +=09=09 * let the application go below that default. Larger
> +=09=09 * values are kept.
>  =09=09 */
> -=09=09pix_mp->plane_fmt[0].sizeimage =3D fmt->header_size +
> -=09=09=09pix_mp->width * pix_mp->height * fmt->max_depth;
> +=09=09if (ctx->is_encoder)
> +=09=09=09*sizeimage =3D max(*sizeimage, max_size);
> +=09=09else if (!*sizeimage)
> +=09=09=09*sizeimage =3D max_size;

I find this part a bit loaded, maye you could add a helper and do something=
 such
as:

=09} else if (ctx->is_encoder) {
=09=09u32 sizeimage =3D pix_mp->plane_fmt[0].sizeimage;
=09=09u32 max_size =3D coded_max_size(pix_mp, fmt);
=09=09pix_mp->plane_fmt[0].sizeimage =3D max(sizeimage, max_size);
=09} else if (!pix_mp->plane_fmt[0].sizeimage) {
=09=09pix_mp->plane_fmt[0].sizeimage =3D coded_max_size(pix_mp, fmt);
=09}

> =20
>  =09return 0;

--=-AdAYXv1YzTfNAtP30eeO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawT6WAAKCRDZQZRRKWBy
9DN8AQDidI6brWMNg9iRjwOn80RNcWkk1i3HZpK9aFQ3oev3LwEArKEXDhNLzM7K
p8Qsj0dhUHNC6p6kJMLcWFI4UQgjuww=
=xex6
-----END PGP SIGNATURE-----

--=-AdAYXv1YzTfNAtP30eeO--
