Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461311;
	b=bBE2laFNUUbINBGzTLsHu7WGQdiUagGkKDVxNDsNF3pBLHLcUW56MN/8DkctfyBPG61y
	 vR68qNHqKSfOnX7++PV2zbUPJw7QDJyxV5Q3TkXjDvOFnYcANksrRdU0QzFxZjayvcuWb
	 PazL6YYbXtRcB9tIQoDpLK5FBsz9GUbuthHoW5AM1Uftw+8IgXYlAXDv58d/f+UzYdBpW
	 fKaAV81xhjvWHc2DTjNXhKSU6CEZfZ0FHG0TfQJzHB/wc8NZmJSX10a8SAxqhClO2RO0e
	 Kb4RVe4zlg52nAJurYzMkwx2mTjULLyOTwaGZ4+XgqKpA/QFyTB8tL7rVy+pyBkoxog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461311;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=TtwF9m0dsYM7DXA5kCIoVhSRU8hz4R/5DTLztjK7Brs=;
	b=WGYATPMerKzzqGylGZr37T2ytLUsqWy+pQWAgJ1+g7omOouVkjtRloB9n78bN+jNlumB
	 LehdAk1hV7Tp0SWmYZoTBC/T/BnvqVUEx0FdZfMFkH6kZsIjVw3+2iCDdHfkQG5C2Wj/9
	 sNBA5VDPQDb868rWAkj/0z+a/CLNsl8r1uRenVqHhsCtIU+KJz2GHyhFohyPs6GePHM/i
	 vTmizTibtdMwlFowS7OB02as0votCzu2RqiB1QYbjgPhyRZNHJXcvkR+deaAYfUdyjKSb
	 JjYsjp/LnsQ0BHoPWanj+jcYK+gDirGeN9j1pIPcpTENGDt3cFYQ/g7ryVgZPjo9EKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RZnu+8vT;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432AB606A31A;
	Mon, 23 Nov 2026 19:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 432AB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RZnu+8vT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795461309;
	bh=1UTK7C2L/leKYOV1vpyJUfwzZPkqImLHSYWPJ0HxDWA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RZnu+8vT52sXp8u5MzM7OVRlx+tCuz5kp2Q710LRjID98hbmD6aG+rcG+vtjbjChJ
	 vIb8qB554gew2pq2FKrpk/f5HmivAHinpFmzMKaTsXa6CVDeZxqlvV7WSw8Eveea4B
	 DKVVfizmpDtQJFGs1gVTEncZMI7oqMODQlN9Ubf27C5ZsfZ/yYMRcg6DMw5WfgfPdk
	 lMkQKWxr7DszHYqomtMGa11CJM951Bp/9WzIh6zBOL+4H9SfH7VUa8ScM1XAShOmVk
	 VcVe47GHSLFV8CQPyqxB304vTOhWC9dZ8sOd++u+sRghyiR5BGKU3ML5rMbmCbkuU6
	 pueGA33+BUMAQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71DAE17E00B2;
	Mon, 23 Nov 2026 20:15:08 +0100 (CET)
Message-ID: <5b5b87d40c3a3ac5c9b04ea77e9310c92f9f4e49.camel@collabora.com>
Subject: Re: [PATCH v3 7/7] media: verisilicon: mpeg4: Use alloc/free
 helpers for auxiliary buffers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 14:15:06 -0500
In-Reply-To: <20261123095905.60622-8-benjamin.gaignard@collabora.com>
References: <20261123095905.60622-1-benjamin.gaignard@collabora.com>
	 <20261123095905.60622-8-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-6OhJFZ1YC2eqKEd3+Wjr"
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

--=-6OhJFZ1YC2eqKEd3+Wjr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 23 novembre 2026 =C3=A0 10:59 +0100, Benjamin Gaignard a =C3=A9cri=
t=C2=A0:
> Simplify and clean up the code by using the helpers.

I'll pick the series, just wanted to mention that I will edit your subject =
line
from mpeg4 to mpeg2.

Nicolas

>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> changes in v3:
> - As suggested by Philipp do not mask hantro_allocate_aux_buf() returned
>   value.
>=20
>  .../media/platform/verisilicon/hantro_mpeg2.c | 19 ++-----------------
>  1 file changed, 2 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_mpeg2.c b/drivers/=
media/platform/verisilicon/hantro_mpeg2.c
> index 04e545eb0a83..7386cc50b11b 100644
> --- a/drivers/media/platform/verisilicon/hantro_mpeg2.c
> +++ b/drivers/media/platform/verisilicon/hantro_mpeg2.c
> @@ -37,25 +37,10 @@ void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
> =20
>  int hantro_mpeg2_dec_init(struct hantro_ctx *ctx)
>  {
> -=09struct hantro_dev *vpu =3D ctx->dev;
> -
> -=09ctx->mpeg2_dec.qtable.size =3D ARRAY_SIZE(zigzag) * 4;
> -=09ctx->mpeg2_dec.qtable.cpu =3D
> -=09=09dma_alloc_coherent(vpu->dev,
> -=09=09=09=09   ctx->mpeg2_dec.qtable.size,
> -=09=09=09=09   &ctx->mpeg2_dec.qtable.dma,
> -=09=09=09=09   GFP_KERNEL);
> -=09if (!ctx->mpeg2_dec.qtable.cpu)
> -=09=09return -ENOMEM;
> -=09return 0;
> +=09return hantro_allocate_aux_buf(ctx, &ctx->mpeg2_dec.qtable, ARRAY_SIZ=
E(zigzag) * 4);
>  }
> =20
>  void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx)
>  {
> -=09struct hantro_dev *vpu =3D ctx->dev;
> -
> -=09dma_free_coherent(vpu->dev,
> -=09=09=09  ctx->mpeg2_dec.qtable.size,
> -=09=09=09  ctx->mpeg2_dec.qtable.cpu,
> -=09=09=09  ctx->mpeg2_dec.qtable.dma);
> +=09hantro_free_aux_buf(ctx, &ctx->mpeg2_dec.qtable);
>  }

--=-6OhJFZ1YC2eqKEd3+Wjr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawSQugAKCRDZQZRRKWBy
9DGRAQCUAeCDyxVQ+dajb9KwTStV2mLTHQA7lvvU5/davwOQJwD/e9YUVaBM3LkJ
BAk47rc4UTDzFemhor+2FOHt4ASpjAE=
=IhE2
-----END PGP SIGNATURE-----

--=-6OhJFZ1YC2eqKEd3+Wjr--
