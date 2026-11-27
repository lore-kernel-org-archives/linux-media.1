Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745011;
	b=rT3IZfHj/KizFKfe6Bcwd9FVh/P7a8EZ5oeI/foN/hclvfvMQLwwrjK0zRWSIsMJqwVE
	 kGKkDFS3AnFiQrYq6qK6cKCvzsQ+EnGdhcAqR4lV6wOD3s0XOnFAP1dQzg8vYs3SrE2Eu
	 2WI4RVOIi6TJiHlzmI0+Mfp5hBNpfbs1J6+dmrHVCv7R+bAzENkdNTkBWH8LRzLsJ5np9
	 ikyW2hpqikNWloGybta34d56r4+HGuzs8N/bdZ+cXgMYr/1rXPx2wdnJWwJCqrVyd3GtR
	 uN2Two9GhkO6d2vvDVHRls/p18ozjWXWbpLxKQ/8dFC1dgds8z7fXs/UbqROHLDJQ4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745011;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=zinsNkA/MCmk8bh88Wgj8xpqSQkw+nXigBT68XWmIeE=;
	b=WyFJa9zMtdqU8+q0knWN0HoEQ1HonMXnOVZWWrREg7Fs6e8qPV1UlTTH0joK9n1keCH7
	 50Zx8wFNBvSqsV+tJsubDup2q4UnsNw5jUYmGzIBCiXfpdmTHqGXttqrxxrkCviMbiLgp
	 zhQvy8eG3hZ1fUIoZc+aZ/tZbCPlma5rcTV6XQUnKbfgtD8FR7TNOHbgytUwcQK8e49YG
	 3ZOfV9y3rZj010GcAvhwx1v8WyY2vENDulMFCs8Z3ZsdLK81lBGeoHZFWAZ0rjcoXrrBI
	 3ZJjxa4sfZmplsbNtcpiaxx9Nz0hTYE7LrM6QFcTECSsyiUQ/MQ2l7jDGSPiuus2zdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JUc4fyKs;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B858606A31C;
	Fri, 27 Nov 2026 02:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B858606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JUc4fyKs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795745009;
	bh=vbOHt71Rd2dKgPsjFkZRH/OqXPRhU2dyC/OJCjwDGrE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=JUc4fyKsJ0aDWvW23BXR8hrlSDuUC/tjT9b2H1Tv0SnbBQwYTZvIaXJoOIm0L+YrQ
	 X4j+Tvee+eFcJSVq1P4auoIoarJw7spGV15n98wVwxXsFSLzWZ3kq4AXhhNMhHiA7s
	 CtCNkIUn26slJNmWifJJAz13Ha07ayOtCD+ZNz7ZCMvAJBSPCa9AefROPWHXbvAK63
	 kpYuBHlFtPhFORukZZ2iwSw8VPfUou1xQIKdyDj3zaz2R80C2Q6ez9t+r540XlYXLe
	 I18JoyguZB0yEMfCbsakCHO6R4XRFRV91I2gl0uRFtmkeFUDT9MO0G9QMVU4AQqgp7
	 QXQ6JaJAzmsYQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B74117E01C2;
	Fri, 27 Nov 2026 03:03:27 +0100 (CET)
Message-ID: <f6e35a9c3f8240dba3ae413c52b9627f42a34b27.camel@collabora.com>
Subject: Re: [PATCH v9 2/4] media: verisilicon: Use
 V4L2_AV1_PRIMARY_REF_NONE and V4L2_AV1_REF_FRAME_INVALID
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Date: Thu, 26 Nov 2026 21:03:26 -0500
In-Reply-To: <20261125122825.236422-3-benjamin.gaignard@collabora.com>
References: <20261125122825.236422-1-benjamin.gaignard@collabora.com>
	 <20261125122825.236422-3-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-F4AFt9xHfzt4V+lORLb9"
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

--=-F4AFt9xHfzt4V+lORLb9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 novembre 2026 =C3=A0 13:28 +0100, Benjamin Gaignard a =C3=A9=
crit=C2=A0:
> Use V4L2_AV1_PRIMARY_REF_NONE and V4L2_AV1_REF_FRAME_INVALID instead
> of local definition.
> Since ref_frame_idx[] values have been checked inside v4l2-ctrl-core.c
> remove the useless duplicate check.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> changes in v9:
> - Split core changes and drivers changes
> - Use V4L2_AV1_REF_FRAME_INVALID
>=20
>  .../verisilicon/rockchip_vpu981_hw_av1_dec.c       | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index 2a145433e6d1..087a944b3394 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -18,9 +18,7 @@
>  #define AV1_TILE_INFO_SIZE=09(AV1_MAX_TILES * 16)
>  #define AV1DEC_MAX_PIC_BUFFERS=0924
>  #define AV1_REF_SCALE_SHIFT=0914
> -#define AV1_INVALID_IDX=09=09-1
>  #define MAX_FRAME_DISTANCE=0931
> -#define AV1_PRIMARY_REF_NONE=097
>  #define AV1_TILE_SIZE=09=09ALIGN(32 * 128, 4096)
>  /*
>   * These 3 values aren't defined enum v4l2_av1_segment_feature because
> @@ -123,8 +121,8 @@ static int rockchip_vpu981_get_frame_index(struct han=
tro_ctx *ctx, int ref)
>  =09u64 timestamp;
>  =09int i, idx =3D frame->ref_frame_idx[ref];
> =20
> -=09if (idx >=3D V4L2_AV1_TOTAL_REFS_PER_FRAME || idx < 0)
> -=09=09return AV1_INVALID_IDX;
> +=09if (idx < 0)
> +=09=09return V4L2_AV1_REF_FRAME_INVALID;
> =20
>  =09timestamp =3D frame->reference_frame_ts[idx];
>  =09for (i =3D 0; i < AV1_MAX_FRAME_BUF_COUNT; i++) {
> @@ -134,7 +132,7 @@ static int rockchip_vpu981_get_frame_index(struct han=
tro_ctx *ctx, int ref)
>  =09=09=09return i;
>  =09}
> =20
> -=09return AV1_INVALID_IDX;
> +=09return V4L2_AV1_REF_FRAME_INVALID;
>  }
> =20
>  static int rockchip_vpu981_get_order_hint(struct hantro_ctx *ctx, int re=
f)
> @@ -142,7 +140,7 @@ static int rockchip_vpu981_get_order_hint(struct hant=
ro_ctx *ctx, int ref)
>  =09struct hantro_av1_dec_hw_ctx *av1_dec =3D &ctx->av1_dec;
>  =09int idx =3D rockchip_vpu981_get_frame_index(ctx, ref);
> =20
> -=09if (idx !=3D AV1_INVALID_IDX)
> +=09if (idx !=3D V4L2_AV1_REF_FRAME_INVALID)
>  =09=09return av1_dec->frame_refs[idx].order_hint;
> =20
>  =09return 0;
> @@ -179,7 +177,7 @@ static int rockchip_vpu981_av1_dec_frame_ref(struct h=
antro_ctx *ctx,
>  =09=09return i;
>  =09}
> =20
> -=09return AV1_INVALID_IDX;
> +=09return V4L2_AV1_REF_FRAME_INVALID;
>  }
> =20
>  static void rockchip_vpu981_av1_dec_frame_unref(struct hantro_ctx *ctx, =
int idx)
> @@ -1256,7 +1254,7 @@ static void rockchip_vpu981_av1_dec_set_prob(struct=
 hantro_ctx *ctx)
>  =09bool frame_is_intra =3D IS_INTRA(frame->frame_type);
> =20
>  =09if (error_resilient_mode || frame_is_intra ||
> -=09    frame->primary_ref_frame =3D=3D AV1_PRIMARY_REF_NONE) {
> +=09    frame->primary_ref_frame =3D=3D V4L2_AV1_PRIMARY_REF_NONE) {
>  =09=09av1_dec->cdfs =3D &av1_dec->default_cdfs;
>  =09=09av1_dec->cdfs_ndvc =3D &av1_dec->default_cdfs_ndvc;
>  =09=09rockchip_av1_default_coeff_probs(quantization->base_q_idx,

--=-F4AFt9xHfzt4V+lORLb9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawjk7gAKCRDZQZRRKWBy
9HU2AP9Uo6Vsm4QhJ7Kzx8kbnip6CwEzPNy9N2P7ptRISEWP+wEA2FqoTfLf0U9/
do+1ErYb2GPGhnPqwAZVhUhNqvZCoQs=
=DbLk
-----END PGP SIGNATURE-----

--=-F4AFt9xHfzt4V+lORLb9--
