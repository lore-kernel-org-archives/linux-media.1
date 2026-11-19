Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125620;
	b=FMeqGVE+KAhYAHaQmJl1H4Ev+SH10SVjozZcvATHUNfKr0JTlSVZnqAn8+HD0V7/mTaI
	 2lx2UzwIpKpO2I9tj0xYQloN2pP03MswdE0CcqEinSBkniPRe9h+iv0Wx+lu21XaDsBbj
	 8l5kz5yJjucP3o5EwQO0TMflG54p1Qqc6yD6V/FDKTmHhT8Izbl2hm32qXFSpDkFkReXc
	 Dud+jhEbWSc7ui8xmpc5uWsN2aQ+wlBjCtnrVhfny5ku+90s7oc6+F07mKO1BS+vBse+O
	 g/gxBGY1hWIThsEU1zHACQCCmYr70H3SInX+YGYM0Culln34XhnyhqrL2+Awt/xJJaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125620;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=Fv65xJoay4A9B9Tf34len2HYc+hr+FM6ouVzl0TsWsY=;
	b=ioHXLd2gWQHli++EhpEbbVOxNvI+skjzAjEAeIkpLFJPKzHYLEIRqrs0rVJJtSpqa9e/
	 Ftt3ZEbQR63TOPy/asswIru9SiIGkMSbBcn4orGZ05dsuxQgrsrtoEL5fS4k+BiPsIgIl
	 UHCby1Ixn2JiwrVB3Jk974E8ihfhuemeTy3IPK1theMp0BGw0CxPzsodwAsE2BbW1FzHG
	 jnpFjCtdg5I4F59mrfwp/m/cu9SftQs8X+1G66a+aJ6fmstlrGu9GAUTnYJxyz/fHMNSu
	 neoScmqTjzTL6RroLkXV7sEe/7aFTgwA3KUSHqFsh6ZK2eSXKu6SrQR4Ey2VyWLQV1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nfZZ26hZ;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537F6606A324;
	Thu, 19 Nov 2026 22:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 537F6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nfZZ26hZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795125618;
	bh=DpmY/9kLgONT5WlYQyctI8KKrOw6zz9ubksxwuSqtaQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=nfZZ26hZaUWrxqZoM1XZr5/xdn9sM28qrCGzjyl+HRvgoKPM+eg5Hvxinw0Ct1Dfv
	 RZMdFiyOxvk73ZZl8QkMpmB7DM0sNT+26jCVJbGYvXoiBSGdPes7xcLIOEgX5WTuLx
	 0kiqx2d+oms84cL1cyWqrQKBu8pOyIGscxKKY0cIxe/cAfwpKAi/C4KuGuHmwUIKV8
	 O1SSIT3c4YoP0706ra0SFqdUHC7R15SKOQqUK58VoCGd0h6kAbEgMuab+H0RMr1lwr
	 ZcHH15jS7c3zYVGm3Qr+d+CtmgP3oGj73rebzCFVXwFdKGM9oZl35s7DJwiAzVvM5x
	 qrdQro+XLBHXg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D339917E00E8;
	Thu, 19 Nov 2026 23:00:17 +0100 (CET)
Message-ID: <117762da7f209bf873c55f974f7dc9a20967d6d0.camel@collabora.com>
Subject: Re: [PATCH v1 5/7] media: verisilicon: vp8: Use alloc/free helpers
 for auxiliary buffers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Date: Thu, 19 Nov 2026 17:00:16 -0500
In-Reply-To: <20260916125443.78602-6-benjamin.gaignard@collabora.com>
References: <20260916125443.78602-1-benjamin.gaignard@collabora.com>
	 <20260916125443.78602-6-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-lU28nk6Mw4JLKHslNl6J"
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

--=-lU28nk6Mw4JLKHslNl6J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 14:54 +0200, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> Simplify and clean up the code by using the helpers.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../media/platform/verisilicon/hantro_vp8.c   | 37 +++++--------------
>  1 file changed, 10 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_vp8.c b/drivers/me=
dia/platform/verisilicon/hantro_vp8.c
> index 381bc1d3bfda..881e6c21f0fa 100644
> --- a/drivers/media/platform/verisilicon/hantro_vp8.c
> +++ b/drivers/media/platform/verisilicon/hantro_vp8.c
> @@ -144,11 +144,9 @@ void hantro_vp8_prob_update(struct hantro_ctx *ctx,
> =20
>  int hantro_vp8_dec_init(struct hantro_ctx *ctx)
>  {
> -=09struct hantro_dev *vpu =3D ctx->dev;
>  =09struct hantro_aux_buf *aux_buf;
>  =09unsigned int mb_width, mb_height;
>  =09size_t segment_map_size;
> -=09int ret;
> =20
>  =09/* segment map table size calculation */
>  =09mb_width =3D DIV_ROUND_UP(ctx->dst_fmt.width, 16);
> @@ -160,42 +158,27 @@ int hantro_vp8_dec_init(struct hantro_ctx *ctx)
>  =09 * And the data in segment map buffer must be set to all zero.
>  =09 */
>  =09aux_buf =3D &ctx->vp8_dec.segment_map;
> -=09aux_buf->size =3D segment_map_size;
> -=09aux_buf->cpu =3D dma_alloc_coherent(vpu->dev, aux_buf->size,
> -=09=09=09=09=09  &aux_buf->dma, GFP_KERNEL);
> -=09if (!aux_buf->cpu)
> -=09=09return -ENOMEM;
> +=09if (hantro_allocate_aux_buf(ctx, aux_buf, segment_map_size))
> +=09=09goto error;
> =20
>  =09/*
>  =09 * Allocate probability table buffer,
>  =09 * total 1208 bytes, 4K page is far enough.
>  =09 */
>  =09aux_buf =3D &ctx->vp8_dec.prob_tbl;
> -=09aux_buf->size =3D sizeof(struct vp8_prob_tbl_packed);
> -=09aux_buf->cpu =3D dma_alloc_coherent(vpu->dev, aux_buf->size,
> -=09=09=09=09=09  &aux_buf->dma, GFP_KERNEL);
> -=09if (!aux_buf->cpu) {
> -=09=09ret =3D -ENOMEM;
> -=09=09goto err_free_seg_map;
> -=09}
> +=09if (hantro_allocate_aux_buf(ctx, aux_buf, sizeof(struct vp8_prob_tbl_=
packed)))
> +=09=09goto error;
> =20
>  =09return 0;
> =20
> -err_free_seg_map:
> -=09dma_free_coherent(vpu->dev, ctx->vp8_dec.segment_map.size,
> -=09=09=09  ctx->vp8_dec.segment_map.cpu,
> -=09=09=09  ctx->vp8_dec.segment_map.dma);
> -
> -=09return ret;
> +error:
> +=09hantro_free_aux_buf(ctx, &ctx->vp8_dec.segment_map);
> +=09hantro_free_aux_buf(ctx, &ctx->vp8_dec.prob_tbl);
> +=09return -ENOMEM;
>  }
> =20
>  void hantro_vp8_dec_exit(struct hantro_ctx *ctx)
>  {
> -=09struct hantro_vp8_dec_hw_ctx *vp8_dec =3D &ctx->vp8_dec;
> -=09struct hantro_dev *vpu =3D ctx->dev;
> -
> -=09dma_free_coherent(vpu->dev, vp8_dec->segment_map.size,
> -=09=09=09  vp8_dec->segment_map.cpu, vp8_dec->segment_map.dma);
> -=09dma_free_coherent(vpu->dev, vp8_dec->prob_tbl.size,
> -=09=09=09  vp8_dec->prob_tbl.cpu, vp8_dec->prob_tbl.dma);
> +=09hantro_free_aux_buf(ctx, &ctx->vp8_dec.segment_map);
> +=09hantro_free_aux_buf(ctx, &ctx->vp8_dec.prob_tbl);
>  }

--=-lU28nk6Mw4JLKHslNl6J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9xcAAKCRDZQZRRKWBy
9NwyAP9De2MwtnhQkbK5vOVH8bz9umcKv4rOoJleUHse8mhHyAD/Sc4fkrLGLquh
jkOjXtk8lljCSuKyiy0rcex92YFVvwk=
=9daj
-----END PGP SIGNATURE-----

--=-lU28nk6Mw4JLKHslNl6J--
