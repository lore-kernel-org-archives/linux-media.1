Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AAF415B68;
	Thu, 20 Aug 2026 16:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787241748; cv=none; b=CoSug5qJFNwTbfURbH6L1YsSs4f9y1uGEejxiFrb3kcR3q0miSke0gQMeAehjg3qiktLJzGAJR5dLkl9rY5y9hK6/CfizL08WHbEK4Z8p2tGOxR9Fk56H7tp5O6SY9KTPRuT9B3ZGRw0VB4uSiA23+Bz8dzu+rflomiYGrAd1YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787241748; c=relaxed/simple;
	bh=NgH4cC1k4sPYlDBooHzRMAITIKBecBzHZ/fTd5G2PNk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=crT/J8RKBm7MFvtCUlybbs2b1efoYZv/eEwDk1borkR2qxAAHHQX8P2ZNBIbdMSRKBZxNrPOd3HqsQwZUirleiUnQfIAHf3+FHvRIrVbYk9MkqlOgaAK/nroql8YBvDzq/wXBDOqXIH6aThyjOu5lTl0P1YruIPlzJfs9efnYaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DC6VOVdb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DC6VOVdb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787241744;
	bh=NgH4cC1k4sPYlDBooHzRMAITIKBecBzHZ/fTd5G2PNk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=DC6VOVdbdADn3RntNzAknAEaFIbouGLxbmBetmcHMrmjSmOtxh4v/f+CMSrZrCsh4
	 mSdTz1AFQlUlMIEmERp8xJX4dlSAQngCtsIxBPc563rbEJZyvBV225vH0vIb5gPG6G
	 TTm65/KLjABNhPb1HsKXLUU8J7+cYI8CPLMax1AO4thv5DGfzBettTbdHrAp8Cl9CY
	 8B2TFiUQmlSxGTTESwEcg7gb1kRw2xuXeofljxRtfabBiaz8b3seTeBBY3RdXxAXy9
	 t1Z3OwWR8a/dxAxZHIvSnXDwjIcQ1vYZHJQmpbfZYM+swMz0bPGUhRqG5ScymWAFMF
	 WCRpEZnboQQxQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 706FC17E0860;
	Thu, 20 Aug 2026 18:02:22 +0200 (CEST)
Message-ID: <61537689daa428a577e6bdab794d044f5405128e.camel@collabora.com>
Subject: Re: [PATCH 5/7] media: verisilicon: Add Rockchip VPU720 JPEG decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel	
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Andrzej Pietrasiewicz	
 <andrzej.p@collabora.com>, Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai
	 <wenst@chromium.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lucas Sinn	
 <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	devicetree@vger.kernel.org
Date: Thu, 20 Aug 2026 12:02:20 -0400
In-Reply-To: <5436875c-9724-41f3-aaf9-76d43e05f0a8@pengutronix.de>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
	 <20260819-rk3588-jpegdec-v1-5-33d74cdf369c@pengutronix.de>
	 <2816bd84651dcbfd0cd76bbc56e461bd409f9611.camel@collabora.com>
	 <5436875c-9724-41f3-aaf9-76d43e05f0a8@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-Sh7xuFpFF+Uoq55bNVgI"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Sh7xuFpFF+Uoq55bNVgI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sascha,

Le jeudi 20 ao=C3=BBt 2026 =C3=A0 10:03 +0000, Sascha Hauer a =C3=A9crit=C2=
=A0:
> On 2026-08-19 11:48, Nicolas Dufresne wrote:
> > Hi Sascha,
> >=20
> > Le mercredi 19 ao=C3=BBt 2026 =C3=A0 12:37 +0200, Sascha Hauer a =C3=A9=
crit=C2=A0:
> > > +/* -----------------------------------------------------------------=
- */
> > > +/* Register byte offsets from dec_base=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 */
> > > +/* -----------------------------------------------------------------=
- */
> > > +
> > > +/* REG0: IP version / product ID */
> > > +#define VDPU720_REG_VERSION		0x000
> > > +#define VDPU720_PROD_NUM		GENMASK(31, 16)
> > > +#define VDPU720_BIT_DEPTH		BIT(8)
> >=20
> > Can you share a dump and share these register reset values. Looking at =
the
> > layout, clearly its highly modified, but probably derived from VSI mult=
i-codec,
> > but I'm thinking perhaps we'll learn more from that. Its always nice to=
 justify
> > when adding more chips that are not strictly VSI designs (or maybe it i=
s) to the
> > hantro dirver.
>=20
> Here's a full register dump right after reset:
>=20
> 00000000: db1f0005 00000004 00120000 00000000

I've look around as much as I could, and could not find any indication that=
 this
is an IP from VSI or derived from a VSI core. It is entirely different from
vdpu1 in mpp (proper G1, rk3288 and similar) and vdpu2 (modified G1 / VDPU1=
21).
In short, this is not a multi-codec core.

So that ball is on your end to show that this driver belongs to hantro rath=
er
then its own driver. In absence of evidence, this driver should be part of
rockchip vendor folder, not vsi. Don't read me wrong, I trust that you have
tested what the LLM have chosen, but anything can be implement in Hantro re=
ally,
it does not mean it should be there.

Nicolas

> 00000010: 00004400 00000000 00000000 00000000
> 00000020: 00000000 00000000 00000000 00000000
> 00000030: 00000000 00000000 00000000 00000000
> 00000040: 000000ff 00000000 00000000 00000000
> 00000050: 00000000 00000000 00000000 00000000
> 00000060: 00000000 00000000 00000000 00000000
> 00000070: 00000000 00000000 000000a8 00000001
> 00000080: 00200000 00080f06 00000000 00000000
> 00000090: 00000000 00000000 00000000 00000000
> 000000a0: 00040000 00001556 00000000 00000000
> 000000b0: 00000000 00000000 00000000 00000000
> ...
> 000003f0: 00000000 00000000 00000000 00000000
>=20
> Sascha

--=-Sh7xuFpFF+Uoq55bNVgI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaoclDAAKCRDZQZRRKWBy
9J71AQDIPC+bWNjjlyxNCjQSdvKc/XKLnolosfjxhlZ4DMvNMQD/U+0qQgLG7T19
Z4oo+bnV8HuZ4bzEtkpq2qUeEgaEiwk=
=SqwL
-----END PGP SIGNATURE-----

--=-Sh7xuFpFF+Uoq55bNVgI--
