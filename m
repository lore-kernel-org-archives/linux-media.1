Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205449;
	b=p8E8X2GbZe+jsNY8pu2Gy7YY3bCPc/8pdva/bklR6lmUMpVSlga3UgVZ32ScGcMo+4tz
	 0Z5knrnotvOpcVmk6Skzjg/bTZl5gFfkECnx1watEEgXAeUV7fILGrlz/IAOWzuZ7dTt2
	 HxnI4phnOfcgp/7LbxUHxYt6Mu8DvgPf2p3lBbdze6GSfoRXahhvSA9FQaHsUYv5Q1aIc
	 j0lVfhf01mg+VjgvPVCxRrSty5u0Zcj93/g3ghK5XBQipq1CYC70EAnGhISNbm7ZmGPgX
	 FVR9Pscxol3RaixnOPQqbq3XES+3gOXhEQPv1MG4ad/muDIfk9F1PG4TLdCpzGsmkkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205449;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=iMYeeumlJ6k7W7C1kYBU0zY2YGhgrTr3LdRD0Cz1xDc=;
	b=BTJKTsc6Zy5NQJ4JDBkO/WAFa6rUiA1mEm0/bScF52IwU5K9rn+W6ODVeZbwSXzX23VE
	 vrFKADYPvcK0iIGWzUPya7REgctRfS/pn2EosfYYJHgDr1YRHVpjL6ncIJpUAZUibmqcI
	 uK3OOy+YyJo+MFTYu+3nk/hbR+QfG9+p7hAgxJiwC/5U6+89/1/cBa7qs/pjrjBWmJNCv
	 N9ZHXRvslPUtTTEkdW1p1R7q8/8hCvoDApc7xX0Jh3OAmpKO80dFzrS26qz8wVmhA/ktE
	 RBnRT3Np7ujuBE1wN8CQHQz61efSR3HysLctmK/I3rGVUzwDlO3RatCHVuu/WS4bULA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=i82JSpCj;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1319E606A32A;
	Fri, 20 Nov 2026 20:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1319E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=i82JSpCj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795205436;
	bh=y8WIRtNa9ntKa66hdWT9XNsrnk+I3E36TFv0h428JSk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=i82JSpCjje+GdHGn6r/jQeQkXvDAhhCqdTHvGqlQwIS/9vuqoTzyzSO475QOFjDFQ
	 RUp+i/kVbCvfMSUok4Qe9iJT4Pg96mRmNrPoYkkZCP2ml+nSJPJ/pMh3LE25FudUju
	 2KhRahqKpFDQwWytbUrvqGcjzaIJjqQRtEz22j5fLDMemx1l4k2VaO8U9wHsEU78By
	 dpKcQdp1zONAYmPXUMQUmvUkP4TJ+ICm1LD+OSyfuq6jMksP9vtgLdUOFdUrPeQwP6
	 ZTtet/bUmYgl5XJR8rLwfLxkcW5qjJw4XlcGd2bw9qMh5vuT4rdqIAdr9wLhx57NRo
	 YZ7YgyN5kblpg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 07E2517E07B5;
	Fri, 20 Nov 2026 21:10:34 +0100 (CET)
Message-ID: <aecaf769d7db9775e695b7d64e5723d9a6b0b17b.camel@collabora.com>
Subject: Re: [PATCH v2 2/7] media: verisilicon: AV1: Use alloc/free helpers
 for auxiliary buffers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Benjamin Gaignard
	 <benjamin.gaignard@collabora.com>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 15:10:32 -0500
In-Reply-To: <dca17004d6cd81f66ebadc0a227548a4e558f2df.camel@pengutronix.de>
References: <20261120151345.88802-1-benjamin.gaignard@collabora.com>
		 <20261120151345.88802-3-benjamin.gaignard@collabora.com>
	 <dca17004d6cd81f66ebadc0a227548a4e558f2df.camel@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-ZKa5jFkrGUs7quLmIcXR"
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

--=-ZKa5jFkrGUs7quLmIcXR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 16:56 +0100, Philipp Zabel a =C3=A9crit=
=C2=A0:
> On Fr, 2026-11-20 at 16:13 +0100, Benjamin Gaignard wrote:
> > Simplify and clean up the code by using the helpers.
> >=20
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---
> >  .../media/platform/verisilicon/hantro_av1.c   | 177 ++++--------------
> >  1 file changed, 39 insertions(+), 138 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/verisilicon/hantro_av1.c b/drivers/=
media/platform/verisilicon/hantro_av1.c
> > index 2cde32f0e935..e05816c7dfa3 100644
> > --- a/drivers/media/platform/verisilicon/hantro_av1.c
> > +++ b/drivers/media/platform/verisilicon/hantro_av1.c
> > @@ -235,40 +235,17 @@ size_t hantro_av1_chroma_size(struct hantro_ctx *=
ctx)
> > =20
> >  static void hantro_av1_tiles_free(struct hantro_ctx *ctx)
> >  {
> > -=09struct hantro_dev *vpu =3D ctx->dev;
> >  =09struct hantro_av1_dec_hw_ctx *av1_dec =3D &ctx->av1_dec;
> > =20
> > -=09if (av1_dec->db_data_col.cpu)
> > -=09=09dma_free_coherent(vpu->dev, av1_dec->db_data_col.size,
> > -=09=09=09=09  av1_dec->db_data_col.cpu,
> > -=09=09=09=09  av1_dec->db_data_col.dma);
> > -=09av1_dec->db_data_col.cpu =3D NULL;
> > -
> > -=09if (av1_dec->db_ctrl_col.cpu)
> > -=09=09dma_free_coherent(vpu->dev, av1_dec->db_ctrl_col.size,
> > -=09=09=09=09  av1_dec->db_ctrl_col.cpu,
> > -=09=09=09=09  av1_dec->db_ctrl_col.dma);
> > -=09av1_dec->db_ctrl_col.cpu =3D NULL;
> > -
> > -=09if (av1_dec->cdef_col.cpu)
> > -=09=09dma_free_coherent(vpu->dev, av1_dec->cdef_col.size,
> > -=09=09=09=09  av1_dec->cdef_col.cpu, av1_dec->cdef_col.dma);
> > -=09av1_dec->cdef_col.cpu =3D NULL;
> > -
> > -=09if (av1_dec->sr_col.cpu)
> > -=09=09dma_free_coherent(vpu->dev, av1_dec->sr_col.size,
> > -=09=09=09=09  av1_dec->sr_col.cpu, av1_dec->sr_col.dma);
> > -=09av1_dec->sr_col.cpu =3D NULL;
> > -
> > -=09if (av1_dec->lr_col.cpu)
> > -=09=09dma_free_coherent(vpu->dev, av1_dec->lr_col.size,
> > -=09=09=09=09  av1_dec->lr_col.cpu, av1_dec->lr_col.dma);
> > -=09av1_dec->lr_col.cpu =3D NULL;
> > +=09hantro_free_aux_buf(ctx, &av1_dec->db_data_col);
> > +=09hantro_free_aux_buf(ctx, &av1_dec->db_ctrl_col);
> > +=09hantro_free_aux_buf(ctx, &av1_dec->cdef_col);
> > +=09hantro_free_aux_buf(ctx, &av1_dec->sr_col);
> > +=09hantro_free_aux_buf(ctx, &av1_dec->lr_col);
> >  }
> > =20
> >  static int hantro_av1_tiles_reallocate(struct hantro_ctx *ctx)
> >  {
> > -=09struct hantro_dev *vpu =3D ctx->dev;
> >  =09struct hantro_av1_dec_hw_ctx *av1_dec =3D &ctx->av1_dec;
> >  =09struct hantro_av1_dec_ctrls *ctrls =3D &av1_dec->ctrls;
> >  =09const struct v4l2_av1_tile_info *tile_info =3D &ctrls->frame->tile_=
info;
> > @@ -277,6 +254,7 @@ static int hantro_av1_tiles_reallocate(struct hantr=
o_ctx *ctx)
> >  =09unsigned int height_in_sb =3D height / 64;
> >  =09unsigned int stripe_num =3D ((height + 8) + 63) / 64;
> >  =09size_t size;
> > +=09int ret;
> > =20
> >  =09if (av1_dec->db_data_col.size >=3D
> >  =09    ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols)
> > @@ -285,44 +263,22 @@ static int hantro_av1_tiles_reallocate(struct han=
tro_ctx *ctx)
> >  =09hantro_av1_tiles_free(ctx);
> > =20
> >  =09size =3D ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_co=
ls;
> > -=09av1_dec->db_data_col.cpu =3D dma_alloc_coherent(vpu->dev, size,
> > -=09=09=09=09=09=09      &av1_dec->db_data_col.dma,
> > -=09=09=09=09=09=09      GFP_KERNEL);
> > -=09if (!av1_dec->db_data_col.cpu)
> > -=09=09goto buffer_allocation_error;
> > -=09av1_dec->db_data_col.size =3D size;
> > +=09ret =3D hantro_allocate_aux_buf(ctx, &av1_dec->db_data_col, size);
> > =20
> >  =09size =3D ALIGN(height * 2 * 16 / 4, 128) * num_tile_cols;
> > -=09av1_dec->db_ctrl_col.cpu =3D dma_alloc_coherent(vpu->dev, size,
> > -=09=09=09=09=09=09      &av1_dec->db_ctrl_col.dma,
> > -=09=09=09=09=09=09      GFP_KERNEL);
> > -=09if (!av1_dec->db_ctrl_col.cpu)
> > -=09=09goto buffer_allocation_error;
> > -=09av1_dec->db_ctrl_col.size =3D size;
> > +=09ret |=3D hantro_allocate_aux_buf(ctx, &av1_dec->db_ctrl_col, size);
>=20
> Please don't |=3D error return values. Even if it happens to work here
> because hantro_allocate_aux_buf() is guaranteed to return the same
> error, it may inspire others to copy this in places where it's invalid.
>=20
> Further, hantro_allocate_aux_buf() looks like it can return -EINVAL and
> -ENOMEM, not sure if that can happen inside reallocate. That would
> combine into -ENOENT, which makes no sense to return.

Fair enough, I reviewed too quickly and assumed it was boolean. Not very co=
mmon,
but something I've seen in the past:

  =09ret =3D func(params1, ret);
=09ret =3D func(params2, ret);
=09...

And then:

int func(params, int ret)
{
=09if (!ret)
=09=09return ret;
=09
=09...

=09return ret;
}

That would allow moving the repetitive branch inside hantro_allocate_aux_bu=
f()
and keep the proposed simplification.

Nicolas

>=20
> regards
> Philipp

--=-ZKa5jFkrGUs7quLmIcXR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawCpOAAKCRDZQZRRKWBy
9Mk+AP9rxBt8WJt8L/siIRkqPG4cX8VRHZfapljBbwQquzWw8gD/RMQgkR0xMM5a
HwF4v+9kCMeurUc+h5VUP/Nz1Ry2iAo=
=mSPK
-----END PGP SIGNATURE-----

--=-ZKa5jFkrGUs7quLmIcXR--
