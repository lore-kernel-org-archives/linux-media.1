Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491875;
	b=AEdZJjfuJqtxo70LS6wpnesMKIKdI21oXfVPQHtqYe2c5Zpx2nM5074NJo5r4P79km/7
	 MxLl+PHkJ7ucnzlgQEb276u0LwZr5NPYZqED4pe0h++ty7vf4C1Fi5Ws2FgRE9fwMkNrw
	 jKaNseamDfiYUsDotTGv9YxMT8VsNOxHZBmP8caxDOwtHS0PQPnAHhEJAwZsUZHDdmiKd
	 4WmwWDFt15ySuC4TFRLw272PyY68TFHRdpZ1zox9KA5hnedhxBWsUPJ9RHwaZJ2I705GA
	 E9v3wbP3ZZkyS7jY71fkIeVtxT58H3NlX+hWrbFc9AaXFQW3CbImyKdBTfw9T4KGJUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491875;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=iXPJfQL37+lFuWrPBpgG/yJPGWXB8XjhyfXUrG6mrgA=;
	b=VfQst1YQMw1Bl1tre+cZ0We9zV1/OkLPv/4ZK0VAdxOU1aL6KeMTgto7aUgvvo3wN/GH
	 Tf3qKcs/AtdrRrmsJIIgvsji61bG7aNtJigiKxCftptT0UA/lF6MLRs01r376jKrOEvQv
	 X2WR7HcjJ6Iq0aaEx5cWW95ZgtCCAQ3FUzZ4K+HwHPhSGL2ThsADin55QEztcFZbhOLRF
	 Cx/n38nY2GPIoLyYHk1fHLp/zItL9siRagj1L9CysC52BSK4oCM55sAEDyQ8AfWL0SNZR
	 CbqeGzceEXcmeqlF3FM5yJSs0EQFmH/IMuVlWNdv0Tl3jY6QEgM22YX2nMUKmLlRJNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Vj8u7L60;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F436606A31E;
	Tue, 24 Nov 2026 03:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F436606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Vj8u7L60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795491873;
	bh=nMy8A8dspKyD4GQcj7I09F4uoZ54ej+K/KIoy3ZgamU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Vj8u7L60X2/fSBAqE7B8mTW5UwhE4nXuBjHrS8KCtkpKKcbMtxLHf4wtXLUaVvID4
	 pL2YYg6FYFXWqafhzHVqx3wEoROA0OzKyGXOexhXeT1YfB9BK9+x06jILxkqXEzFok
	 NYEbNoCeVMkFwW6aoqdiurnfGZ2A2sYgnjha9qYs72W13Io8qqFJoQdAT+P5LRB7WT
	 XpiNaevNeVpLmZ0TOCcr5FYzIlxd1B0n5rjfvKvCEhsCkQyyrTh+Qs86hBhkqX27+f
	 //D06V3rLOEYC21jgh9OzfR8iP32p6RmMLO64ixjChwNE5t+xBtF1vLm2vYH/zP/Zx
	 aDBhywIK6GAog==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D4F517E0CD7;
	Tue, 24 Nov 2026 04:44:32 +0100 (CET)
Message-ID: <1e59911003612aa645607efcd502c010f1972a5e.camel@collabora.com>
Subject: Re: [PATCH v7 2/3] media: verisilicon: AV1: Fix luma size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Nov 2026 22:44:31 -0500
In-Reply-To: <3dfe5ae59107fa77075676fc226ac818bc2700f9.camel@collabora.com>
References: <20261120143135.71134-1-benjamin.gaignard@collabora.com>
		 <20261120143135.71134-3-benjamin.gaignard@collabora.com>
	 <3dfe5ae59107fa77075676fc226ac818bc2700f9.camel@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-VHcejEzEPR4GHlk6YEht"
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

--=-VHcejEzEPR4GHlk6YEht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Since you need a v8 ...

Le lundi 23 novembre 2026 =C3=A0 22:30 -0500, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Le vendredi 20 novembre 2026 =C3=A0 15:31 +0100, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> > Use the values computed by v4l2 helpers to get luma size.
> > Unlile before this will also take care of padding.

    Unlike

> >=20
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")

Fixes goes before Signed-off-by, does this need to be cc to stable?

>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> > ---
> >  drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_=
dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > index 5da59104a966..5e0cd5268f22 100644
> > --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > @@ -221,7 +221,7 @@ static void rockchip_vpu981_av1_dec_clean_refs(stru=
ct hantro_ctx *ctx)
> > =20
> >  static size_t rockchip_vpu981_av1_dec_luma_size(struct hantro_ctx *ctx=
)
> >  {
> > -=09return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / =
8;
> > +=09return ctx->ref_fmt.plane_fmt[0].bytesperline * ctx->ref_fmt.height=
;
> >  }
> > =20
> >  static size_t rockchip_vpu981_av1_dec_chroma_size(struct hantro_ctx *c=
tx)

--=-VHcejEzEPR4GHlk6YEht
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawUIHwAKCRDZQZRRKWBy
9AgzAQCYcZQsQXxWhzBG+rQkqaUoWlXfLw76Ec7suNYc7L3DYgD/WVROKXt7doP/
gd9qyH1wa0gnWIXTtyOoUMoj8l+1TQY=
=hkrb
-----END PGP SIGNATURE-----

--=-VHcejEzEPR4GHlk6YEht--
