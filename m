Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125717;
	b=nxB0ch9YtsXYgAYsAp5csLt+822Vk/HyjDyWjbjSg++hj9bdedhx/G+GSASYN2pX5yNl
	 BFCG0/g4tDrAlwzVg+0sO4I1RrCy3nQhczs3gM09xIdPiS4/DFko7gG4vAV2HHfFqQe3d
	 uZHGo1XoSDx3d9icFeeGeJ2hBXodq90a5wlZHw2GjEXO0SOlPvS1gGforoqLKAYqMXO2h
	 0Nf3CtZCoOOTpQhgIFCRFz5YCQneLEk2cok7n6ra8VAHA9GFqP/1vGLp0WB0XQa46PFLH
	 fpVa1J+9EC2pVsEC+tL2/cTOfOEOk9+Mtz3Ce2fC8g1QzXVxYP1c6ZFhZIuG1DNWF2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125717;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=oplpI6eEMtoBxL6wUQwQJv5QhRq1ffS8cKsbhl/Ft20=;
	b=tUyrw6hltPIQmI3/smQy/wVi4a80p3c2WipnVfb9PdFTyibUBMABjHNxhsKb9dWCRgCU
	 3mH/lVN788se6ZVwmxFuE3w13vuSWCvW3wucG9dE13NlhZ1AtsMwiA20KEYa1pEqMSRBo
	 7NM8qUeK1qfakqdU2XiKGK0eFfKfzPRwMimx0wO7YUsq4cKDywQCxmoM1Lo+WbJmkcDs2
	 t0LTJdWup9Gbcw7gZj9O3g+je/4vaBQ4ftMwKAt/um/EFPBYvrZAn80i/GHKUPW3tez0m
	 hKI7vbvDLnxtjGQj7iyQsWQyj2UJnu+SaC/VJIrUIpeKJuhT00bfa3u2iwazgbse4eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AOpY1SSz;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18021606A325;
	Thu, 19 Nov 2026 22:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18021606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AOpY1SSz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795125715;
	bh=X23YaxjFeV2zYUTZgzInNORDdEE5msEkxPHU1jfRRjA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AOpY1SSzKfxYWCzhMCz3lter8jnMMJqqYqXT6o5Mc4mAN3GaPg9c1gJlDjsQryifw
	 4gpzmUXLoUWeruuLYaAuUvbTKqs64+sOMsI62+bNXX17PuBvTkpCGjMls5y62XMP2M
	 lt+bxCKC3+V36KfpdA9rbccnubCfI3rJflwVOYLPV1EZwOE3UIVsVfJ/3RdZArvqRx
	 LKFJPtPwloQzVvcknNQtC+dIN7CwD54pHIebkuG9uKJ8RJ2NjLqPu9P9ey5amyg/h6
	 II3c5ge6yqfb6iJ14OtOD2vyLQcwGNJAe0bntdW6eyuKGP57JNkBTkKZ5B3l6yax+l
	 TRMdyg/Fv74rQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CD7A17E0311;
	Thu, 19 Nov 2026 23:01:54 +0100 (CET)
Message-ID: <dc33dcf5fbc332d02dc54b2068787dc63f193f46.camel@collabora.com>
Subject: Re: [PATCH v1 7/7] media: verisilicon: mpeg4: Use alloc/free
 helpers for auxiliary buffers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Date: Thu, 19 Nov 2026 17:01:53 -0500
In-Reply-To: <20260916125443.78602-8-benjamin.gaignard@collabora.com>
References: <20260916125443.78602-1-benjamin.gaignard@collabora.com>
	 <20260916125443.78602-8-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-7qE1DpbACoyuWbHd2Qx0"
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

--=-7qE1DpbACoyuWbHd2Qx0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 14:54 +0200, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> Simplify and clean up the code by using the helpers.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../media/platform/verisilicon/hantro_mpeg2.c   | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_mpeg2.c b/drivers/=
media/platform/verisilicon/hantro_mpeg2.c
> index 04e545eb0a83..f21115e6bdbe 100644
> --- a/drivers/media/platform/verisilicon/hantro_mpeg2.c
> +++ b/drivers/media/platform/verisilicon/hantro_mpeg2.c
> @@ -37,25 +37,12 @@ void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
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
> +=09if (hantro_allocate_aux_buf(ctx, &ctx->mpeg2_dec.qtable, ARRAY_SIZE(z=
igzag) * 4))
>  =09=09return -ENOMEM;
>  =09return 0;
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

--=-7qE1DpbACoyuWbHd2Qx0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9x0QAKCRDZQZRRKWBy
9I5WAP0bVAbmeSLRHwv8CO5B/BZyJJ/7mKqBLZN3iIqZIpe4+wEA0LPjqPmZCWD8
2oRxjuRdHBGrPG4tB6J/F2paCcVd5gE=
=QSYg
-----END PGP SIGNATURE-----

--=-7qE1DpbACoyuWbHd2Qx0--
