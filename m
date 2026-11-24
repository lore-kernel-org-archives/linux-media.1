Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489051;
	b=b02Pr+8Hq/HYTQro8gKReGWDNT/9bCCTADcROHZkW7UZk+hSWyxJ/XYNcQKgA7ueAIKZ
	 e7jRl07UJFoH2/nDqyra4t1KE2mpzC+KzbJH/mMIWdtRIG+Ni8ls6/K44DpeQbraVcSLq
	 VG21GPaPoqeCHcx0ZfER10c00GDX2xT4E0XHUqPvkyiWmW1guhZzpFSQ1rp4tUkPr3PwT
	 Y/W8MY+EF/7/1/MMkOT7w/RyssApiD7TL8MIKGrz36p1dop0BT+5BC5HqKE/R0r/Vn1lP
	 wULTuNqmBOgfMJrQx7x4EwTh1rLFKZDONy6/haZCP5S2iDQVPXLYDc9yHoTNqinb1lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489051;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=kXq0Eheb2+1+jb0f/AeprT9shSL2ndw7j6GeQEw3A7I=;
	b=VX8ZDDm3GnkhyZSgg4DtCrhOK6lm/XPNmrTZIw+oJp9Q1xH6kGzxHihefVnC0m9qORoe
	 PjaR4xfsakfoEuYeRViBCr7d3BwJq/fu+l+J5aUIo45i5cXs0lLTfb526qXndTysoNZG+
	 rcZGZdMNyQhsGGy+PPS5CxqbslPNIETClb6z+tLW8+UAU3aAJBAbhYpIWmZkRuxIGeutn
	 dcqfvseDcbZpt20E5p6+tJToeBKQF8HLcHk560sOL5C0PNA+B/NGedM6v2SHoN1449vBh
	 ERH+MSiA5miC4C9bLm2ndQsqKaOdkr8lZ2i9ZRFVkICnBbhNx0jAhxZDOURSm64Znmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pNpVseDq;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D42606A334;
	Tue, 24 Nov 2026 02:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60D42606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pNpVseDq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795489049;
	bh=hBp4fEAeDQr7vaWjTTJLVZ0thKQS+kHTXID++ldMdgE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pNpVseDqBYOSbhT6osS3YB5MY6gvkT82HwEeA8tS2yS2ptqubciruHGOQPPDndxXN
	 p/MR6lTtO8+o0B9EAz2LtLuSnbfVCLQK2qbgCbrwMczmmi57ypTBo32kzeiQrrt00T
	 o4Bi0LHmy/DkqWJ/U1WMuH81nvXDP7lC+B3wPZttFqe6GYFjH4u87lfmc2oIpykGkQ
	 aYwK+m48UOUnQw6upl80KUvEtvbr8tYcieKqf/DgFzSYjcyXkat8yr3jI7URFmHSOD
	 8KiLUTQrrb8BRXp8dDvffhBnuoHkAD4Yo/ZV/ndiLjjm/S26A8YvcO0AzBoo1JPApL
	 6P3Zj95Otumpg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5367E17E00B2;
	Tue, 24 Nov 2026 03:57:27 +0100 (CET)
Message-ID: <03daf8e29ec2b53da4f626715b7bb08273237299.camel@collabora.com>
Subject: Re: [PATCH v2 3/7] media: verisilicon: Keep the encoder coded size
 in sync with OUTPUT
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
Date: Mon, 23 Nov 2026 21:57:25 -0500
In-Reply-To: <20261112-hantro-jpeg-enc-fixes-v2-3-de03e643c75d@gmail.com>
References: <20261112-hantro-jpeg-enc-fixes-v2-0-de03e643c75d@gmail.com>
	 <20261112-hantro-jpeg-enc-fixes-v2-3-de03e643c75d@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-uyQ3Q8y5bAy85ex1qmu0"
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

--=-uyQ3Q8y5bAy85ex1qmu0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 novembre 2026 =C3=A0 08:31 +0000, Arun Iyengar via B4 Relay a =
=C3=A9crit=C2=A0:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> On the encoder, setting the CAPTURE (coded) format resets the OUTPUT
> (raw) format to the same size, but setting the OUTPUT format never
> updates the CAPTURE format. Following the order mandated by the
> stateful encoder specification (CAPTURE first, then OUTPUT) therefore
> leaves the coded size at whatever it was before, e.g. the 96x32
> default:
>=20
>   v4l2-ctl --set-fmt-video-out=3Dwidth=3D1920,height=3D1080,pixelformat=
=3DNM12 \
>            --set-fmt-video=3Dpixelformat=3DJPEG --stream-out-mmap ...
>=20
> ends up with a 1920x1088 OUTPUT format and a 96x32 CAPTURE format with
> a 96x32 sized buffer. The JPEG encoders treat the difference between
> the two as the crop inside the last macroblock, which is expected to be
> below 16 pixels, and program the hardware with the full OUTPUT frame
> size. On RK3588 this results in IOMMU page faults, a frame processing
> timeout and a wedged encoder.
>=20
> The specification says that the CAPTURE width and height are set by the
> encoder from the OUTPUT format and selection rectangles, and that
> setting the OUTPUT format resets the crop rectangle to the full frame.
> Do that in hantro_set_fmt_out(): derive the coded format from the new
> OUTPUT size, re-applying the CAPTURE constraints, including the minimum
> sizeimage. As the coded format can now change from an OUTPUT S_FMT,
> return -EBUSY if this would require bigger CAPTURE buffers than the
> ones already allocated.
>=20
> With this, the coded size can only differ from the OUTPUT size by the
> crop set through VIDIOC_S_SELECTION, which is restricted to the last
> macroblock.
>=20
> Fixes: 953aaa1492c5 ("media: rockchip/vpu: Prepare things to support deco=
ders")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/media/platform/verisilicon/hantro_v4l2.c | 26 ++++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/m=
edia/platform/verisilicon/hantro_v4l2.c
> index c4e36a79eecc..e9d91504fab2 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -542,6 +542,7 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
>  =09=09=09      struct v4l2_pix_format_mplane *pix_mp,
>  =09=09=09      bool need_postproc)
>  {
> +=09struct v4l2_pix_format_mplane coded_fmt;
>  =09struct vb2_queue *vq;
>  =09int ret;
> =20
> @@ -561,16 +562,41 @@ static int hantro_set_fmt_out(struct hantro_ctx *ct=
x,
>  =09=09=09return -EBUSY;
>  =09=09}
>  =09} else {

You could fols the below if(busy) as:
=09} else if (vb2_is_busy(vq)) {
=09=09return -EBUSY;
=09
=09} else {
> +=09=09struct vb2_queue *peer_vq;
> +
>  =09=09/*
>  =09=09 * The encoder doesn't admit a format change if
>  =09=09 * there are OUTPUT buffers allocated.
>  =09=09 */
>  =09=09if (vb2_is_busy(vq))
>  =09=09=09return -EBUSY;
> +
> +=09=09/*
> +=09=09 * Setting the OUTPUT format resets the crop rectangle to
> +=09=09 * the full frame, so the coded size becomes the OUTPUT
> +=09=09 * size. Refuse the change if it would need bigger
> +=09=09 * CAPTURE buffers than the ones already allocated.
> +=09=09 */
> +=09=09coded_fmt =3D ctx->dst_fmt;
> +=09=09coded_fmt.width =3D pix_mp->width;
> +=09=09coded_fmt.height =3D pix_mp->height;
> +=09=09ret =3D hantro_try_fmt(ctx, &coded_fmt,
> +=09=09=09=09     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +=09=09if (ret)
> +=09=09=09return ret;
> +
> +=09=09peer_vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> +=09=09=09=09=09  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);

Its explicitly a capture queue, call the variable this way (or dst_vq);

> +=09=09if (vb2_is_busy(peer_vq) &&
> +=09=09    coded_fmt.plane_fmt[0].sizeimage >
> +=09=09    ctx->dst_fmt.plane_fmt[0].sizeimage)
> +=09=09=09return -EBUSY;

Its a reflection I started on previous patch, but on memory constrained dev=
ice,
if application wants to pick a smaller size image and use lower quality, ma=
ybe
it should. Our newly introduce max size does not scale based on the quality=
.

In short, its a bit application fault if the buffers ended up too small. Wh=
at
the driver should focus is to prevent iommu fault, and too short shouldn't =
do
that. Are you sure you are fixing this the right way?

>  =09}
> =20
>  =09ctx->vpu_src_fmt =3D hantro_find_format(ctx, pix_mp->pixelformat);
>  =09ctx->src_fmt =3D *pix_mp;
> +=09if (ctx->is_encoder)
> +=09=09ctx->dst_fmt =3D coded_fmt;
> =20
>  =09/*
>  =09 * Current raw format might have become invalid with newly

--=-uyQ3Q8y5bAy85ex1qmu0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawT9FQAKCRDZQZRRKWBy
9EfkAP9KD+KaGFiGMk8f5D9OivNcABwldsFyIa4c2/citzNJ7gEAietLuEc3rV/j
kkQZ2YINaHVfd3eTXOH9dyatN4CVfAc=
=5zHI
-----END PGP SIGNATURE-----

--=-uyQ3Q8y5bAy85ex1qmu0--
