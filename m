Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125587;
	b=ds7KQqiaZqMFezRT1NKXkbSGzwfx8hHFyWtuxovXNy91ZiYEyTP/n0c8RQoZ/8uuiRSR
	 ggKnNIFi+akYRAS27fUgZQumZ86cO/3vapOz51Fks///TiCeH65cFb9HmoX0azZV81mxL
	 /Vscjl2ca5Yi66HL/ImuQ9KNlVbw4pxHtLZpF7mP5jkmBhZAEMoxICS1kiXJ32AIZg2ht
	 CW2bYqEJ55eWsPhfdThimWeO96LmhgXBq9rtgaBNylw1EiflbbIOPdSKjOaxe+/CpdpZ1
	 tL8Vuf77V1ecxoSAL5TDJvNeJH+1t4eFuaFNccl045tna01E9WGVLIlX35gVHVE8ARQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125587;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=BVuruTp3AMwAjqrT4rAdFqn22XJVyXv9Yc+FnSkdPL8=;
	b=NjpqulAGBbLZNyM4Pn8Q/JQXiTLJRQ2p0ZG+Sv7Z3oHEnUrsfdKEbz4AyLNGlGix99bf
	 759rHE0tdOTWd6kdCDZBWsWuOvV1JVU3FVWxI9EMgWkq4zdmjinw4aUO1qatCNM91P3dA
	 hiAIVG1hhp/2E66uyst9ryH1OS2fWMne8BO5+IpplF5IjXsjm23qldEZPOoT3wrQ1wJyc
	 QQk5JYjAVjceyDMeTEnrbC6d1ykpLDs8rctRNiyRMIPI3Y+a2ZMs/8JnqAbWkFECw3vx1
	 eXAYAIZ+W17pbewom7HlqFRFBbQhfFEWabk18/Odeeh5OunMu2sYRZWglQaNzq472iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qpHFL119;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83022606A320;
	Thu, 19 Nov 2026 21:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83022606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qpHFL119
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795125584;
	bh=ql+AdDy9utXRHQMQICnu4sMadnG9XV6j7g/rGB/Duf8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=qpHFL1193ILDJ9P5Wwf8syAQuJBVM9PgQ5/7cuc9xdXR66/EJZbj7AmfL7JsyOWp+
	 Y7fjFspLK6pqOaGO+yerJZYHjUAV5tzS2TUC6Al9SO0aPkaBRAMYA4n29PG9RLW83F
	 8um7UTxK7mk+mxH7lrYS44WWEqvFX8Bljr5rFJ7kg1lYO59hBtlZLepu505myEq2Y2
	 ah81gtv4vdquAzQuFlsIJcMtjgs2VqEokjfeSy2sxMevse4T6hOTGlGa1kGgPoWAvF
	 K1kZRdkQa2bTMwDp/5SSSabRN6q5VvZ5WI77754G30bhd0UgeUm8AFTtS8lPClF+OE
	 eC1nTSWaGnjUQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F0D0917E04AE;
	Thu, 19 Nov 2026 22:59:43 +0100 (CET)
Message-ID: <6b658f38d7b7a8a1bfe9e57818ee6ee3b5471aad.camel@collabora.com>
Subject: Re: [PATCH v1 3/7] media: verisilicon: h264: Use alloc/free helpers
 for auxiliary buffers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Date: Thu, 19 Nov 2026 16:59:42 -0500
In-Reply-To: <20260916125443.78602-4-benjamin.gaignard@collabora.com>
References: <20260916125443.78602-1-benjamin.gaignard@collabora.com>
	 <20260916125443.78602-4-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-hD+E2VI+vAcOj1KRFX7F"
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

--=-hD+E2VI+vAcOj1KRFX7F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 14:54 +0200, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> Simplify and clean up the code by using the helpers.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

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
> =20
> -=09priv->size =3D sizeof(*tbl);
>  =09tbl =3D priv->cpu;
>  =09memcpy(tbl->cabac_table, h264_cabac_table, sizeof(tbl->cabac_table));
> =20

--=-hD+E2VI+vAcOj1KRFX7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9xTgAKCRDZQZRRKWBy
9Nk8AP44VYjJqWNbwMYANCUkFmTxerCcRIwQ0lhnwm+TF9+DBwEAqyv64gAuU6bd
DxjNl2F+B/JuhG+f5YF/VDg/Y9LqdAI=
=VGpK
-----END PGP SIGNATURE-----

--=-hD+E2VI+vAcOj1KRFX7F--
