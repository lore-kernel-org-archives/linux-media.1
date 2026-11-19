Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125703;
	b=HN9edsMyaVUeaa/SZphIzR11wvl3Zjqtxf7wM1ikRgG1USujIH24Wg6YCJdXhJRU9viT
	 UXFAIKV0dasoHR/FQ7pFMA8wMmsXorgqaV0AbjlPDYm92u4UyQCg+u66PKLbj13w4Lbbj
	 FOImJYAwftznUJWjeqRcgp0vW/Sxi9xDNQwSJ+KSsBldZoBePlxeoaZ2d7lNCd/DZ4X2s
	 fgIU4xMDNG1pXU6uRFg/zUIMXjP6HQBOIUqaJXijyeFyMfnuTHtwK48BYZEe6QmU3yOdo
	 +8eVKsUzATgFYPOfdNMAMM2PLQLwftYqo8Y5pmkeCvtatOZwyhSYSYF9qH/Ymr2isRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125703;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=bFV9TsTjHT6hSPFjc0iPI6dPyGyNoUZ/LNuf2mJ730E=;
	b=K2FK/mwz3i9/DTTP54pFl1UdoXMZ6bJTav/pfBaONyS4ZgzV/CCFv/CEm8dh+/xAYqgQ
	 pPWs7XDq+hR8nklHV2808qTBb1qoMq/uPXCy8cRgZAoB0lJcKmd0X8NmiCPnXcy+ryiSA
	 8BaAROHsZqv3cE0bHQZ/6YildyLvVdTgHlD/2kF9Ns4me22BuQ0m0GpDzesBat56VyE/z
	 WmIwBkrT7YxTu8rOHcDMj2NZKfqUHFbC/6sl58RQFqd8b2MVZtPQ6jGhCiVOAWUDSB0Y2
	 Gx/2IRRl/C2bYm9XZYAURO6lI3BtjOVwG5QlpnjaO9Kwkk46sUZ92ljtl5tfH5j2qcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HTQ+HkMa;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219DB606A320;
	Thu, 19 Nov 2026 22:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 219DB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HTQ+HkMa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795125701;
	bh=ANMivH/q60amS51egZxMp9rwlv7XQDk68NdQazduH/c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=HTQ+HkMakNtqgxTMf1rmVeqvFNB3hKbHwG6dIBnPA2y5w8VdcXgvI2psMBTMg5L2S
	 WW54JmTnmaOUJX5zrnvl/cEVodDCIXnnqBIL4tyXN2F6m7bh3ZFHvbWLFsufdm4U5a
	 rSpSPOLE/tkXbsR/IwZtRrCiOl/eR7FrvYcNFNwXjRMS4JTd3ySYMWNv3ATcc5GqmH
	 3VezNNsAE9OE8BmrxVyFxiR6CXRxiEpNpJzu2mOogD3TSLqr5estFv2zgGbDTw7DBG
	 FXqGuHruYdeCQ0VMwaomE5UEq26LVUKfig/f6UFbaMucCQMgLOnHd8RMif5kyC3VEo
	 WHmB8FzXNAayw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B1D417E0311;
	Thu, 19 Nov 2026 23:01:40 +0100 (CET)
Message-ID: <21f16b602cbb1b581bb26356e39e86c845d5809a.camel@collabora.com>
Subject: Re: [PATCH v1 6/7] media: verisilicon: vp9: Use alloc/free helpers
 for auxiliary buffers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Date: Thu, 19 Nov 2026 17:01:39 -0500
In-Reply-To: <20260916125443.78602-7-benjamin.gaignard@collabora.com>
References: <20260916125443.78602-1-benjamin.gaignard@collabora.com>
	 <20260916125443.78602-7-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-SHXXuNwkg3TPbXQrg/xe"
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

--=-SHXXuNwkg3TPbXQrg/xe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 14:54 +0200, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> Simplify and clean up the code by using the helpers.
> For upstream it should be merged into only one commit.

What do you want me to do exactly?

>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../media/platform/verisilicon/hantro_vp9.c   | 37 ++++++-------------
>  1 file changed, 11 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_vp9.c b/drivers/me=
dia/platform/verisilicon/hantro_vp9.c
> index 566cd376c097..7a46a4767254 100644
> --- a/drivers/media/platform/verisilicon/hantro_vp9.c
> +++ b/drivers/media/platform/verisilicon/hantro_vp9.c
> @@ -181,23 +181,17 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
>  =09size =3D hantro_vp9_tile_filter_size(max_height);
>  =09vp9_dec->bsd_ctrl_offset =3D size;
>  =09size +=3D hantro_vp9_bsd_control_size(max_height);
> -
> -=09tile_edge->cpu =3D dma_alloc_coherent(vpu->dev, size, &tile_edge->dma=
, GFP_KERNEL);
> -=09if (!tile_edge->cpu)
> +=09if (hantro_allocate_aux_buf(ctx, tile_edge, size))
>  =09=09return -ENOMEM;
> =20
> -=09tile_edge->size =3D size;
>  =09memset(tile_edge->cpu, 0, size);
> =20
>  =09size =3D hantro_vp9_segment_map_size(max_width, max_height);
>  =09vp9_dec->segment_map_size =3D size;
>  =09size *=3D 2; /* we need two areas of this size, used alternately */
> +=09if (hantro_allocate_aux_buf(ctx, segment_map, size))
> +=09=09goto error;
> =20
> -=09segment_map->cpu =3D dma_alloc_coherent(vpu->dev, size, &segment_map-=
>dma, GFP_KERNEL);
> -=09if (!segment_map->cpu)
> -=09=09goto err_segment_map;
> -
> -=09segment_map->size =3D size;
>  =09memset(segment_map->cpu, 0, size);
> =20
>  =09size =3D hantro_vp9_prob_tab_size();
> @@ -205,36 +199,27 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
>  =09size +=3D hantro_vp9_count_tab_size();
>  =09vp9_dec->tile_info_offset =3D size;
>  =09size +=3D hantro_vp9_tile_info_size();
> +=09if (hantro_allocate_aux_buf(ctx, misc, size))
> +=09=09goto error;
> =20
> -=09misc->cpu =3D dma_alloc_coherent(vpu->dev, size, &misc->dma, GFP_KERN=
EL);
> -=09if (!misc->cpu)
> -=09=09goto err_misc;
> -
> -=09misc->size =3D size;
>  =09memset(misc->cpu, 0, size);
> =20
>  =09init_v4l2_vp9_count_tbl(ctx);
> =20
>  =09return 0;
> =20
> -err_misc:
> -=09dma_free_coherent(vpu->dev, segment_map->size, segment_map->cpu, segm=
ent_map->dma);
> -
> -err_segment_map:
> -=09dma_free_coherent(vpu->dev, tile_edge->size, tile_edge->cpu, tile_edg=
e->dma);
> +error:
> +=09hantro_free_aux_buf(ctx, segment_map);
> +=09hantro_free_aux_buf(ctx, tile_edge);
> =20
>  =09return -ENOMEM;
>  }
> =20
>  void hantro_vp9_dec_exit(struct hantro_ctx *ctx)
>  {
> -=09struct hantro_dev *vpu =3D ctx->dev;
>  =09struct hantro_vp9_dec_hw_ctx *vp9_dec =3D &ctx->vp9_dec;
> -=09struct hantro_aux_buf *tile_edge =3D &vp9_dec->tile_edge;
> -=09struct hantro_aux_buf *segment_map =3D &vp9_dec->segment_map;
> -=09struct hantro_aux_buf *misc =3D &vp9_dec->misc;
> =20
> -=09dma_free_coherent(vpu->dev, misc->size, misc->cpu, misc->dma);
> -=09dma_free_coherent(vpu->dev, segment_map->size, segment_map->cpu, segm=
ent_map->dma);
> -=09dma_free_coherent(vpu->dev, tile_edge->size, tile_edge->cpu, tile_edg=
e->dma);
> +=09hantro_free_aux_buf(ctx, &vp9_dec->tile_edge);
> +=09hantro_free_aux_buf(ctx, &vp9_dec->segment_map);
> +=09hantro_free_aux_buf(ctx, &vp9_dec->misc);
>  }

--=-SHXXuNwkg3TPbXQrg/xe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9xwwAKCRDZQZRRKWBy
9PpaAQCrbJCywZvoLReO0PLLa3rbPd7Mz0js3xyFsonVvBCcTQD7BSUTJgCdqtzO
kRtRf4dDAiPGIqL9SSArx+DZfoKn/wM=
=IjkY
-----END PGP SIGNATURE-----

--=-SHXXuNwkg3TPbXQrg/xe--
