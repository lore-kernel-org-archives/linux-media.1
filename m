Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489920;
	b=gWWhre5gR0xp5B41xYA1x+3hwvfl2hfaOmvHZ+o+b0zA0MmTCGyLfaCA/CYXjiZGSWwh
	 0b6pG/EaCRdFaSa9aye0rVG9u6Ocjy3dQzxrHf/8H5q62Zhp/VWHa/QcquBO0ox/jca9m
	 jnbOeq6MR+QQeFp+S5TbrXcDBWc8GSliaconzVwx/W0LD9Si1C8YGJXbshqo3pqGoVhHb
	 7rlsCVx49RgkV2SyHA61Gc14MWM+QrqywJh2kol6Tum9r0P7gU1+F71qKfatNGymyOOGl
	 M0KN0vA+8DlLJQVe5pxlGYM8HazQKQqDCcMK4FuwTB6If/mCbZ/ylhu87a8lL2LOeGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489920;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=oCY+1+MPsQmKQ7kPDmppRhpoAJ8AvSETKrDjoyEgHAI=;
	b=WLOSlncTiDEdOYjmHx4uUwUr/cdYffS11wk2DRdAo0kanpkEnWOI47p+OcpE+/xAuoDo
	 DW3vcvPxPwIUDsVbWB/Jjz0WERu51ncTFPBJmuvOPAGEYNp9QVPkSiHrOd/OdomLV+5i7
	 HeWCnqJLZ0YavW2qlyoBgpFvQlN286d7WcL/OuC3+F+UkSvUz2SUvSaCpjszl4eGC0ycF
	 xIn2woigin18tePGAfwLSdNOiqWV6tw+QDat48AoY5yZw4M330aHmCg/03pUb1pXrGbRD
	 LA2bmJebKkcKPLcNM+eCIMpgyOvpq57POvdKqXCC8ERLsrJV84lEGjZzevldvMHDwXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=jBKwAUXe;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8C0606A327;
	Tue, 24 Nov 2026 03:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D8C0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=jBKwAUXe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795489918;
	bh=v831malqTOJp05M/kfKFP+PcjKG9B5RxFf+eyZRs5hk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jBKwAUXe/9mv07j4pPecodrlaevS4B95RYQJVEoGbt5PONsH4befKSGIMSYAR3z/H
	 xssjZ3fJsoHd7uaXJGEXPpvp/vTadGekCmkl8n2hguZWnORkWBara7opnNgUW+wvh1
	 IQu7Lk6XEUM7IwD1RIxlsKUGqHBWKZ8kbtI/B7FZ7bjsjewfQtS42V5dpoMMd647kj
	 IfEWW6V6d3G6NwgoVT/cNkRR3V6oBllm31pxsPelg9ztTFFWyo+jFen1MnVkitSMw0
	 Pz0pri8Oet0H0WpLh0GmdKhFCAe//77Q65ion7rdwOTg4y6OJ+LD8q/X/pfjiwYvIc
	 44HEL5YH4MAEA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 695FD17E00B2;
	Tue, 24 Nov 2026 04:11:56 +0100 (CET)
Message-ID: <7a5a79bf8e1bfe698b7a49aa9580eb3858c25993.camel@collabora.com>
Subject: Re: [PATCH v2 4/7] media: verisilicon: Refuse JPEG encode jobs with
 inconsistent geometry
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
Date: Mon, 23 Nov 2026 22:11:54 -0500
In-Reply-To: <20261112-hantro-jpeg-enc-fixes-v2-4-de03e643c75d@gmail.com>
References: <20261112-hantro-jpeg-enc-fixes-v2-0-de03e643c75d@gmail.com>
	 <20261112-hantro-jpeg-enc-fixes-v2-4-de03e643c75d@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-0wk6dPrBem+ReKp/fVsc"
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

--=-0wk6dPrBem+ReKp/fVsc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 novembre 2026 =C3=A0 08:31 +0000, Arun Iyengar via B4 Relay a =
=C3=A9crit=C2=A0:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The JPEG encoders program the hardware with the macroblock count of the
> OUTPUT format and treat the difference between the OUTPUT and CAPTURE
> sizes as the crop inside the last macroblock, which is written into
> narrow register fields. They also write the JPEG header into the
> CAPTURE buffer without checking its size.
>=20
> When the two formats disagree beyond that, as could happen before the
> coded size was kept in sync with the OUTPUT format, the encoder on
> RK3588 generated IOMMU page faults close to address 0, timed out, and
> left the IOMMU unable to stall, requiring a reboot.
>=20
> The format ioctls are now expected to keep the formats consistent, but
> as getting this wrong takes down the whole encoder, check the geometry
> and the CAPTURE buffer size before programming the hardware and fail
> the job instead.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  .../platform/verisilicon/hantro_h1_jpeg_enc.c      |  9 ++++++
>  drivers/media/platform/verisilicon/hantro_jpeg.c   | 37 ++++++++++++++++=
++++++
>  drivers/media/platform/verisilicon/hantro_jpeg.h   |  5 +++
>  .../verisilicon/rockchip_vpu2_hw_jpeg_enc.c        |  9 ++++++
>  4 files changed, 60 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c b/dr=
ivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
> index 86cc1a07026f..b2f97f45e0ac 100644
> --- a/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
> +++ b/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
> @@ -109,10 +109,19 @@ int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
>  =09struct vb2_v4l2_buffer *src_buf, *dst_buf;
>  =09struct hantro_jpeg_ctx jpeg_ctx;
>  =09u32 reg;
> +=09int ret;
> =20
>  =09src_buf =3D hantro_get_src_buf(ctx);
>  =09dst_buf =3D hantro_get_dst_buf(ctx);
> =20
> +=09ret =3D hantro_jpeg_enc_check_job(ctx, &dst_buf->vb2_buf);
> +=09if (ret) {
> +=09=09/* Complete the controls of the request, the job is not run */
> +=09=09v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> +=09=09=09=09=09   &ctx->ctrl_handler);
> +=09=09return ret;
> +=09}
> +
>  =09hantro_start_prepare_run(ctx);
> =20
>  =09memset(&jpeg_ctx, 0, sizeof(jpeg_ctx));
> diff --git a/drivers/media/platform/verisilicon/hantro_jpeg.c b/drivers/m=
edia/platform/verisilicon/hantro_jpeg.c
> index 13a60638e43f..2f2afd632c1b 100644
> --- a/drivers/media/platform/verisilicon/hantro_jpeg.c
> +++ b/drivers/media/platform/verisilicon/hantro_jpeg.c
> @@ -14,6 +14,7 @@
>  #include <media/v4l2-jpeg.h>
>  #include "hantro_jpeg.h"
>  #include "hantro.h"
> +#include "hantro_hw.h"
> =20
>  #define LUMA_QUANT_OFF=09=0925
>  #define CHROMA_QUANT_OFF=0990
> @@ -243,3 +244,39 @@ void hantro_jpeg_header_assemble(struct hantro_jpeg_=
ctx *ctx)
> =20
>  =09jpeg_set_quality(ctx);
>  }
> +
> +/*
> + * Check that the formats describe a frame the JPEG encoders can be
> + * programmed with: the coded size may only crop the OUTPUT frame inside
> + * the right-most and bottom-most macroblocks, and the CAPTURE buffer
> + * must have room for the header and some payload. The V4L2 ioctls are
> + * expected to guarantee this, but programming the hardware with
> + * anything else makes it access memory outside the buffers, so refuse
> + * the job instead.
> + */
> +int hantro_jpeg_enc_check_job(struct hantro_ctx *ctx,
> +=09=09=09      struct vb2_buffer *dst_buf)
> +{
> +=09const struct v4l2_pix_format_mplane *src =3D &ctx->src_fmt;
> +=09const struct v4l2_pix_format_mplane *dst =3D &ctx->dst_fmt;
> +
> +=09if (!dst->width || !dst->height ||
> +=09    !IS_ALIGNED(src->width, MB_DIM) ||
> +=09    !IS_ALIGNED(src->height, MB_DIM) ||

The alignment should be controlled by the s_fmt function, and zeros should =
be
impossible.

> +=09    dst->width > src->width || dst->height > src->height ||
> +=09    src->width - dst->width >=3D MB_DIM ||
> +=09    src->height - dst->height >=3D MB_DIM ||
> +=09    !IS_ALIGNED(src->width - dst->width, 4)) {
> +=09=09vpu_err("inconsistent geometry: OUTPUT %ux%u, CAPTURE %ux%u\n",
> +=09=09=09src->width, src->height, dst->width, dst->height);
> +=09=09return -EINVAL;
> +=09}

Thinking out loud, spec says the dst_fmt width/height is ignored/read-only.=
 But
then resetting the OUTPUT, which isn't done properly in this driver it seem=
s,
will always go back to a "default size". And later on, the spec has a huge =
gab
for the case application did not pick sizeimage (what you are implementing)=
.=20

I think there is no choice but to first complete the spec here. Its going t=
o be
tricky to stay backward compatible, but I think we can assume that only
application passing a sizeimage > 0 worked.

Please make a propsal to try and fix the spec, and we can then review
accordingly to the updadated spec.

Nicolas

> +
> +=09if (vb2_plane_size(dst_buf, 0) <=3D ctx->vpu_dst_fmt->header_size) {
> +=09=09vpu_err("CAPTURE buffer too small: %lu bytes\n",
> +=09=09=09vb2_plane_size(dst_buf, 0));
> +=09=09return -EINVAL;
> +=09}
> +
> +=09return 0;
> +}
> diff --git a/drivers/media/platform/verisilicon/hantro_jpeg.h b/drivers/m=
edia/platform/verisilicon/hantro_jpeg.h
> index 0b49d0b82caa..296ad1e821c7 100644
> --- a/drivers/media/platform/verisilicon/hantro_jpeg.h
> +++ b/drivers/media/platform/verisilicon/hantro_jpeg.h
> @@ -1,5 +1,8 @@
>  /* SPDX-License-Identifier: GPL-2.0+ */
> =20
> +struct hantro_ctx;
> +struct vb2_buffer;
> +
>  #define JPEG_HEADER_SIZE=09624
>  #define JPEG_QUANT_SIZE=09=0964
> =20
> @@ -13,3 +16,5 @@ struct hantro_jpeg_ctx {
>  };
> =20
>  void hantro_jpeg_header_assemble(struct hantro_jpeg_ctx *ctx);
> +int hantro_jpeg_enc_check_job(struct hantro_ctx *ctx,
> +=09=09=09      struct vb2_buffer *dst_buf);
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc=
.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> index 61621b1be8a2..c7a1323506f5 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> @@ -135,10 +135,19 @@ int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *c=
tx)
>  =09struct vb2_v4l2_buffer *src_buf, *dst_buf;
>  =09struct hantro_jpeg_ctx jpeg_ctx;
>  =09u32 reg;
> +=09int ret;
> =20
>  =09src_buf =3D hantro_get_src_buf(ctx);
>  =09dst_buf =3D hantro_get_dst_buf(ctx);
> =20
> +=09ret =3D hantro_jpeg_enc_check_job(ctx, &dst_buf->vb2_buf);
> +=09if (ret) {
> +=09=09/* Complete the controls of the request, the job is not run */
> +=09=09v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> +=09=09=09=09=09   &ctx->ctrl_handler);
> +=09=09return ret;
> +=09}
> +
>  =09hantro_start_prepare_run(ctx);
> =20
>  =09memset(&jpeg_ctx, 0, sizeof(jpeg_ctx));

--=-0wk6dPrBem+ReKp/fVsc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawUAegAKCRDZQZRRKWBy
9Ap8AP9JBw3mAFed5vbCN0qgDYrTZrGG6TNf4OE4/xEADu2w0AEA6IkVBmyOIpHW
erokLROHSVarhZbmN0tF4cV6qr3uCQA=
=aN08
-----END PGP SIGNATURE-----

--=-0wk6dPrBem+ReKp/fVsc--
