Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125610;
	b=dWyJ5NqCbDCbubHBJYxOYgibCj9TSViGodjwB0Dx6K9IcU+Ar2ibNZzznYoE2k0vfiLH
	 DaRhnhF74yZu9FbeH4aEVyLo+xgBHcdZtbm11cTwigt0GFlV2Mhk6jrbzhE/8VJdVh8dC
	 Pm8HK+1Gx4k/Gf5OApygAxs7rC1xD4AKYRDJYXPfHd3oL2u9Dh7/r6M8GzaeqgIHvMlyU
	 zDdJwoqRJP4vshq9Bq25SdEOffVBUGbwwoIypRFtmat1zj1HE/ZvLaUmv7kui4Tn7v+pD
	 nEPDVk7H5kq6fKCZgGqW6kyIp60zKxHUk01omXGfbeek2W16kcuk/oQ3V+OfwG4JuBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125610;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=b8RA3ta6yB7KG6C+oi2I81qObYEOEClzlaOS46Zo9ps=;
	b=q0SSCz9QGlSUfSdly14RLEJSggqCkc7XyXYlUHq2cTk6nkk5BBf5WRIBM+nO2/ABBh7A
	 VfRGbq/c3L7+QV6wPWUIzqhFJ3mWk1shMhx2bO+na1qqDcKF5u0vbFBQLlrryd/s5Icyc
	 NQR+4CchIF0AZhgG8JGIZ4o9sCjhKh2aJi4TLh09sElh4w/8cP7TSfpDDkiSSS91JmNRy
	 PrMn2nRTVp3pOvMRnG2qmxHZodjcdq309cAmhK2uxM6rf2IGGGh9FUc8kK1BgGUToTes7
	 ZuHIr1UnZ0clQUOuxmMkw5/UJWvi+FB2IVG4TmHjlbMSKz9q3Oddocv2MBy12ylJ+rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=mD3KMJqM;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F22606A324;
	Thu, 19 Nov 2026 22:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F22606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=mD3KMJqM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795125608;
	bh=yPie2JFk3z5BHC8U+5RNQzc1hLl+oTmCgkNUpsBRj0U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mD3KMJqMWgiWgPU4dijEHTB832GOfirF7iuTrEUpgs3hvWcUC/2aFq0WpgIV9GRE1
	 mJ3EYyeag0W4LEtwkPB9EQ+QChJ7S7x2F+BBws/EcdzgQFPgc0HGQJ/VsEj1vR8b3M
	 gh4LJB9R9Oqdzj5udh8siMOMrIi1WJkmAamP6xdjplN61aLWz2tNxPpT5puVN1nAYi
	 BxahU2rB+HtwijlgvYJ/HbK9l+0aJz+Oh7Gdah0+3Y7R/n1yzEEjbMUQ9rYEtyEkGX
	 NJVzBCBrqDGeAnzMtaNm+82FaRLvi2T5eamLulK1w2THkV+9zovkQtPOV1keD4YaDD
	 NFkxymAZutZqQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 665B817E00E8;
	Thu, 19 Nov 2026 23:00:07 +0100 (CET)
Message-ID: <4cb0a15ebb28d3121b761f5acc006c9f0da2a709.camel@collabora.com>
Subject: Re: [PATCH v1 4/7] media: verisilicon: hevc: Use alloc/free helpers
 for auxiliary buffers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Date: Thu, 19 Nov 2026 17:00:06 -0500
In-Reply-To: <20260916125443.78602-5-benjamin.gaignard@collabora.com>
References: <20260916125443.78602-1-benjamin.gaignard@collabora.com>
	 <20260916125443.78602-5-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-UbsCRD9e17KQymsF/Ytm"
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

--=-UbsCRD9e17KQymsF/Ytm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 14:54 +0200, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> Simplify and clean up the code by using the helpers.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../media/platform/verisilicon/hantro_hevc.c  | 130 +++++-------------
>  1 file changed, 33 insertions(+), 97 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_hevc.c b/drivers/m=
edia/platform/verisilicon/hantro_hevc.c
> index 83cd12b0ddd6..cc6fa233c0a0 100644
> --- a/drivers/media/platform/verisilicon/hantro_hevc.c
> +++ b/drivers/media/platform/verisilicon/hantro_hevc.c
> @@ -74,7 +74,6 @@ int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int=
 poc, dma_addr_t addr)
> =20
>  static int tile_buffer_reallocate(struct hantro_ctx *ctx)
>  {
> -=09struct hantro_dev *vpu =3D ctx->dev;
>  =09struct hantro_hevc_dec_hw_ctx *hevc_dec =3D &ctx->hevc_dec;
>  =09const struct hantro_hevc_dec_ctrls *ctrls =3D &ctx->hevc_dec.ctrls;
>  =09const struct v4l2_ctrl_hevc_pps *pps =3D ctrls->pps;
> @@ -82,74 +81,40 @@ static int tile_buffer_reallocate(struct hantro_ctx *=
ctx)
>  =09unsigned int num_tile_cols =3D pps->num_tile_columns_minus1 + 1;
>  =09unsigned int height64 =3D (sps->pic_height_in_luma_samples + 63) & ~6=
3;
>  =09unsigned int size;
> +=09int ret;
> =20
>  =09if (num_tile_cols <=3D 1 ||
>  =09    num_tile_cols <=3D hevc_dec->num_tile_cols_allocated)
>  =09=09return 0;
> =20
>  =09/* Need to reallocate due to tiles passed via PPS */
> -=09if (hevc_dec->tile_filter.cpu) {
> -=09=09dma_free_coherent(vpu->dev, hevc_dec->tile_filter.size,
> -=09=09=09=09  hevc_dec->tile_filter.cpu,
> -=09=09=09=09  hevc_dec->tile_filter.dma);
> -=09=09hevc_dec->tile_filter.cpu =3D NULL;
> -=09}
> -
> -=09if (hevc_dec->tile_sao.cpu) {
> -=09=09dma_free_coherent(vpu->dev, hevc_dec->tile_sao.size,
> -=09=09=09=09  hevc_dec->tile_sao.cpu,
> -=09=09=09=09  hevc_dec->tile_sao.dma);
> -=09=09hevc_dec->tile_sao.cpu =3D NULL;
> -=09}
> -
> -=09if (hevc_dec->tile_bsd.cpu) {
> -=09=09dma_free_coherent(vpu->dev, hevc_dec->tile_bsd.size,
> -=09=09=09=09  hevc_dec->tile_bsd.cpu,
> -=09=09=09=09  hevc_dec->tile_bsd.dma);
> -=09=09hevc_dec->tile_bsd.cpu =3D NULL;
> -=09}
> +=09hantro_free_aux_buf(ctx, &hevc_dec->tile_filter);
> +=09hantro_free_aux_buf(ctx, &hevc_dec->tile_sao);
> +=09hantro_free_aux_buf(ctx, &hevc_dec->tile_bsd);
> =20
>  =09size =3D (VERT_FILTER_RAM_SIZE * height64 * (num_tile_cols - 1) * ctx=
->bit_depth) / 8;
> -=09hevc_dec->tile_filter.cpu =3D dma_alloc_coherent(vpu->dev, size,
> -=09=09=09=09=09=09       &hevc_dec->tile_filter.dma,
> -=09=09=09=09=09=09       GFP_KERNEL);
> -=09if (!hevc_dec->tile_filter.cpu)
> -=09=09return -ENOMEM;
> -=09hevc_dec->tile_filter.size =3D size;
> +=09hevc_dec->tile_filter.attrs =3D DMA_ATTR_NO_KERNEL_MAPPING;
> +=09ret =3D hantro_allocate_aux_buf(ctx, &hevc_dec->tile_filter, size);
> =20
>  =09size =3D (VERT_SAO_RAM_SIZE * height64 * (num_tile_cols - 1) * ctx->b=
it_depth) / 8;
> -=09hevc_dec->tile_sao.cpu =3D dma_alloc_coherent(vpu->dev, size,
> -=09=09=09=09=09=09    &hevc_dec->tile_sao.dma,
> -=09=09=09=09=09=09    GFP_KERNEL);
> -=09if (!hevc_dec->tile_sao.cpu)
> -=09=09goto err_free_tile_buffers;
> -=09hevc_dec->tile_sao.size =3D size;
> +=09hevc_dec->tile_sao.attrs =3D DMA_ATTR_NO_KERNEL_MAPPING;
> +=09ret |=3D hantro_allocate_aux_buf(ctx, &hevc_dec->tile_sao, size);
> =20
>  =09size =3D BSD_CTRL_RAM_SIZE * height64 * (num_tile_cols - 1);
> -=09hevc_dec->tile_bsd.cpu =3D dma_alloc_coherent(vpu->dev, size,
> -=09=09=09=09=09=09    &hevc_dec->tile_bsd.dma,
> -=09=09=09=09=09=09    GFP_KERNEL);
> -=09if (!hevc_dec->tile_bsd.cpu)
> -=09=09goto err_free_sao_buffers;
> -=09hevc_dec->tile_bsd.size =3D size;
> +=09hevc_dec->tile_bsd.attrs =3D DMA_ATTR_NO_KERNEL_MAPPING;
> +=09ret |=3D hantro_allocate_aux_buf(ctx, &hevc_dec->tile_bsd, size);
> +
> +=09if (ret)
> +=09=09goto error;
> =20
>  =09hevc_dec->num_tile_cols_allocated =3D num_tile_cols;
> =20
>  =09return 0;
> =20
> -err_free_sao_buffers:
> -=09if (hevc_dec->tile_sao.cpu)
> -=09=09dma_free_coherent(vpu->dev, hevc_dec->tile_sao.size,
> -=09=09=09=09  hevc_dec->tile_sao.cpu,
> -=09=09=09=09  hevc_dec->tile_sao.dma);
> -=09hevc_dec->tile_sao.cpu =3D NULL;
> -
> -err_free_tile_buffers:
> -=09if (hevc_dec->tile_filter.cpu)
> -=09=09dma_free_coherent(vpu->dev, hevc_dec->tile_filter.size,
> -=09=09=09=09  hevc_dec->tile_filter.cpu,
> -=09=09=09=09  hevc_dec->tile_filter.dma);
> -=09hevc_dec->tile_filter.cpu =3D NULL;
> +error:
> +=09hantro_free_aux_buf(ctx, &hevc_dec->tile_filter);
> +=09hantro_free_aux_buf(ctx, &hevc_dec->tile_sao);
> +=09hantro_free_aux_buf(ctx, &hevc_dec->tile_bsd);
> =20
>  =09return -ENOMEM;
>  }
> @@ -214,45 +179,20 @@ int hantro_hevc_dec_prepare_run(struct hantro_ctx *=
ctx)
> =20
>  void hantro_hevc_dec_exit(struct hantro_ctx *ctx)
>  {
> -=09struct hantro_dev *vpu =3D ctx->dev;
>  =09struct hantro_hevc_dec_hw_ctx *hevc_dec =3D &ctx->hevc_dec;
> =20
> -=09if (hevc_dec->tile_sizes.cpu)
> -=09=09dma_free_coherent(vpu->dev, hevc_dec->tile_sizes.size,
> -=09=09=09=09  hevc_dec->tile_sizes.cpu,
> -=09=09=09=09  hevc_dec->tile_sizes.dma);
> -=09hevc_dec->tile_sizes.cpu =3D NULL;
> -
> -=09if (hevc_dec->scaling_lists.cpu)
> -=09=09dma_free_coherent(vpu->dev, hevc_dec->scaling_lists.size,
> -=09=09=09=09  hevc_dec->scaling_lists.cpu,
> -=09=09=09=09  hevc_dec->scaling_lists.dma);
> -=09hevc_dec->scaling_lists.cpu =3D NULL;
> -
> -=09if (hevc_dec->tile_filter.cpu)
> -=09=09dma_free_coherent(vpu->dev, hevc_dec->tile_filter.size,
> -=09=09=09=09  hevc_dec->tile_filter.cpu,
> -=09=09=09=09  hevc_dec->tile_filter.dma);
> -=09hevc_dec->tile_filter.cpu =3D NULL;
> -
> -=09if (hevc_dec->tile_sao.cpu)
> -=09=09dma_free_coherent(vpu->dev, hevc_dec->tile_sao.size,
> -=09=09=09=09  hevc_dec->tile_sao.cpu,
> -=09=09=09=09  hevc_dec->tile_sao.dma);
> -=09hevc_dec->tile_sao.cpu =3D NULL;
> -
> -=09if (hevc_dec->tile_bsd.cpu)
> -=09=09dma_free_coherent(vpu->dev, hevc_dec->tile_bsd.size,
> -=09=09=09=09  hevc_dec->tile_bsd.cpu,
> -=09=09=09=09  hevc_dec->tile_bsd.dma);
> -=09hevc_dec->tile_bsd.cpu =3D NULL;
> +=09hantro_free_aux_buf(ctx, &hevc_dec->tile_sizes);
> +=09hantro_free_aux_buf(ctx, &hevc_dec->scaling_lists);
> +=09hantro_free_aux_buf(ctx, &hevc_dec->tile_filter);
> +=09hantro_free_aux_buf(ctx, &hevc_dec->tile_sao);
> +=09hantro_free_aux_buf(ctx, &hevc_dec->tile_bsd);
>  }
> =20
>  int hantro_hevc_dec_init(struct hantro_ctx *ctx)
>  {
> -=09struct hantro_dev *vpu =3D ctx->dev;
>  =09struct hantro_hevc_dec_hw_ctx *hevc_dec =3D &ctx->hevc_dec;
>  =09unsigned int size;
> +=09int ret;
> =20
>  =09memset(hevc_dec, 0, sizeof(*hevc_dec));
> =20
> @@ -262,21 +202,11 @@ int hantro_hevc_dec_init(struct hantro_ctx *ctx)
>  =09 * chunk (HW guys wanted to have this).
>  =09 */
>  =09size =3D round_up(MAX_TILE_COLS * MAX_TILE_ROWS * 4 * sizeof(u16) + 1=
6, 16);
> -=09hevc_dec->tile_sizes.cpu =3D dma_alloc_coherent(vpu->dev, size,
> -=09=09=09=09=09=09      &hevc_dec->tile_sizes.dma,
> -=09=09=09=09=09=09      GFP_KERNEL);
> -=09if (!hevc_dec->tile_sizes.cpu)
> -=09=09return -ENOMEM;
> -
> -=09hevc_dec->tile_sizes.size =3D size;
> -
> -=09hevc_dec->scaling_lists.cpu =3D dma_alloc_coherent(vpu->dev, SCALING_=
LIST_SIZE,
> -=09=09=09=09=09=09=09 &hevc_dec->scaling_lists.dma,
> -=09=09=09=09=09=09=09 GFP_KERNEL);
> -=09if (!hevc_dec->scaling_lists.cpu)
> -=09=09return -ENOMEM;
> +=09ret =3D hantro_allocate_aux_buf(ctx, &hevc_dec->tile_sizes, size);
> +=09ret =3D hantro_allocate_aux_buf(ctx, &hevc_dec->scaling_lists, SCALIN=
G_LIST_SIZE);
> =20
> -=09hevc_dec->scaling_lists.size =3D SCALING_LIST_SIZE;
> +=09if (ret)
> +=09=09goto error;
> =20
>  =09hantro_hevc_ref_init(ctx);
> =20
> @@ -284,4 +214,10 @@ int hantro_hevc_dec_init(struct hantro_ctx *ctx)
>  =09=09hevc_use_compression & hantro_needs_postproc(ctx, ctx->vpu_dst_fmt=
);
> =20
>  =09return 0;
> +
> +error:
> +=09hantro_free_aux_buf(ctx, &hevc_dec->tile_sizes);
> +=09hantro_free_aux_buf(ctx, &hevc_dec->scaling_lists);
> +
> +=09return -ENOMEM;
>  }

--=-UbsCRD9e17KQymsF/Ytm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9xZgAKCRDZQZRRKWBy
9BoKAP9lHQSuYVvLFue2xJO/7JWg4UvuizSsobcyTimHAf8tEgD/aJWRatDDiwuu
yqxhj3NbKOiG7nlqcngw9Ztb2waznwQ=
=fAxr
-----END PGP SIGNATURE-----

--=-UbsCRD9e17KQymsF/Ytm--
