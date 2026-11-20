Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215624;
	b=hjJ43GRHqwOhrH2XNQUCbJZNvcFefeRNEXhHqB90XuThbJ95Y2Fw4rA0gHi1WxQtU5B9
	 w5BF8LLOJn9Q4G0zqQTdLqotzh/ys7HQd0FYgtPa++mpFYm7pfXto9LAD3/gYoMEynpCu
	 QKS3CpMyGXIDtTOhT/a8s7ijR/ZDLkowEMyDy3wdIONsNz7XxVhwDZFOShJkjRFr6Wn29
	 2xOH9215jHnP9COB3PuiIBDBlzuVDEeZnocvfBeOsDmWzs/dmu9izw1b/QbsdZbI4ijfI
	 5DVCLKtYsmHIYNMWoHX6CMbsazHwVcW/+d1SYdJZKLfrznEjs6GCWkmBYWZW1ycJQJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215624;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=HhHXufRCrjFN/dq6HVpUh+o6/tPEtRCzgY7mDiTsBk8=;
	b=gAWueXKc/Si6NpcwnFeDKmcfHgACsXHPDUjPTowk7rWTYXGBzIeZlTBvoOObAjqCCUHc
	 tkOXP3GDqY7UOzpGkDf09mDuyabW1Eg4dyTXkXUbttfyWC1YQk5003zoFFVQ2Cm9XohOX
	 oDM/WfHwNgfJkLydg0Bh+qDl1dlWE7laQaQfR7RbB8G2mCB9u9fjgWjnW174rrmdF0idF
	 ZDVkHFt1oHcCSbHNB0x4vdqXTrY63IJknlM0KY1XvTRghS1E2T8gHd27hjmOm6WBequGH
	 keP8cHXUaPKigvuuOpjSR822EeVXdKSj//ZiGNGgDivYhDMpCWEG10tLUCqDLuMTSVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gGHxnwhR;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315FD606A33F;
	Fri, 20 Nov 2026 23:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 315FD606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gGHxnwhR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795215621;
	bh=8QJNmFNB7eHS2pukQJjzkptuIZoj5T1eb1LbOd09li4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gGHxnwhR7wS3xLVx3e/8nfAg/EVNeENnOlwCpEmChz3IRkICVAL5A9T5O3WD/4kT6
	 qh7sKqL2R4a+ZR1dqIUBLjRnpzaQf+O8LrrD3MONm407NmVGXH642k1dJ+OPtKvCeg
	 h6f53oSSarsDkCG6VXsq0HQwBQC0+pdP40juYiuzztCpF1TiCxoxD40vvlqYrnZbaM
	 qIefeVodquGiqyMZpto6J9CER9AvuJYbo6fRRzQaUNRaYtrqCt5OFXgxeiYIBJBC8J
	 3WkjW1P8hrQSJr6cpnhITvG9tAfsPGQGZ2SYPp5jPXpPKlPnS2+cpJLfupSfx67yyG
	 HIQefQIK9XS5Q==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 19E2217E0060;
	Sat, 21 Nov 2026 00:00:19 +0100 (CET)
Message-ID: <3fc964299086dbe5436d44009218d15eb7c51f69.camel@collabora.com>
Subject: Re: [PATCH v2 3/7] media: verisilicon: h264: Use alloc/free helpers
 for auxiliary buffers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 18:00:18 -0500
In-Reply-To: <20261120151345.88802-4-benjamin.gaignard@collabora.com>
References: <20261120151345.88802-1-benjamin.gaignard@collabora.com>
	 <20261120151345.88802-4-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-+jVkEY2oqmTK+8km2w/Y"
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

--=-+jVkEY2oqmTK+8km2w/Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 16:13 +0100, Benjamin Gaignard a =C3=A9=
crit=C2=A0:
> Simplify and clean up the code by using the helpers.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  drivers/media/platform/verisilicon/hantro_h264.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_h264.c b/drivers/m=
edia/platform/verisilicon/hantro_h264.c
> index 2414782f1eb6..68dde1cd1ac2 100644
> --- a/drivers/media/platform/verisilicon/hantro_h264.c
> +++ b/drivers/media/platform/verisilicon/hantro_h264.c
> @@ -494,26 +494,21 @@ int hantro_h264_dec_prepare_run(struct hantro_ctx *=
ctx)
> =20
>  void hantro_h264_dec_exit(struct hantro_ctx *ctx)
>  {
> -=09struct hantro_dev *vpu =3D ctx->dev;
>  =09struct hantro_h264_dec_hw_ctx *h264_dec =3D &ctx->h264_dec;
>  =09struct hantro_aux_buf *priv =3D &h264_dec->priv;
> =20
> -=09dma_free_coherent(vpu->dev, priv->size, priv->cpu, priv->dma);
> +=09hantro_free_aux_buf(ctx, priv);
>  }
> =20
>  int hantro_h264_dec_init(struct hantro_ctx *ctx)
>  {
> -=09struct hantro_dev *vpu =3D ctx->dev;
>  =09struct hantro_h264_dec_hw_ctx *h264_dec =3D &ctx->h264_dec;
>  =09struct hantro_aux_buf *priv =3D &h264_dec->priv;
>  =09struct hantro_h264_dec_priv_tbl *tbl;
> =20
> -=09priv->cpu =3D dma_alloc_coherent(vpu->dev, sizeof(*tbl), &priv->dma,
> -=09=09=09=09       GFP_KERNEL);
> -=09if (!priv->cpu)
> +=09if (hantro_allocate_aux_buf(ctx, priv, sizeof(*tbl)))
>  =09=09return -ENOMEM;

As found by Philipp, you mask EINVAL here.

> =20
> -=09priv->size =3D sizeof(*tbl);
>  =09tbl =3D priv->cpu;
>  =09memcpy(tbl->cabac_table, h264_cabac_table, sizeof(tbl->cabac_table));
> =20

--=-+jVkEY2oqmTK+8km2w/Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawDRAgAKCRDZQZRRKWBy
9P4IAQCJdmIkEYiKaA8iBuJXfScw1LKOvqzA9/ec/Hn+6SeuAgEA4MsYWMibrVth
vZnwseJRaP0E9TwFBy9oOlkTLuvesgE=
=V2kn
-----END PGP SIGNATURE-----

--=-+jVkEY2oqmTK+8km2w/Y--
