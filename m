Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125504;
	b=vXlKiSvlrwe2KXHFjQJkZNeIrTyv1CNh1peIv/ocKoXcSQAw0qztmu9F06wBmY5/De6E
	 cqcynt0A2vqUAjNG2qB2JjFiS3k1nBi4iqTsJ0EjvP1bszJa3Sw8e03TWHxOGeoFxDcO1
	 6CmlpT/NPF0yWb2tZ+0Y25iQgQyhy5/Lot9MzVvYBpc9V900X2sl1TEbyAUmhGqNFmnFv
	 /mkGmjr8Js8RT/WsERxrt3j2mKEOoGz/+w3TodEAPXSUs4yZ1kYD8QoN3fKDvtYcJixZx
	 GXWYuV1Q7fxhSjPLb81T+/rl+IovVHgajtSWhEw20JWgAuiUgpapmz1Z5k3WUTIlOmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125504;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=LBFpxZHG8DXttjFCfrXOKXE0UTtg7CewXCAmh+s72GQ=;
	b=zamOe24VZ171FmBq6lXnp6/+SUPywoRCK9BY9sY2taY1Jheufz/+/CM0eYZFTTszARw9
	 Bi6ISiBEW0dq1Pghv4gvZDaYX2j1GjfjBFiY2ZfqcFzjKvyZK64qIRChhZcInFsD+8kCY
	 dXUY/KxaK4+8CluCzK3gp0wh/5sw79FIWumBYQEcmNGHNxPq6R2dlsby79Nssh7SQlZiM
	 S6biYLxOOoobFZiSyrqe+ZzQbUISd5v/0TCLQvoa0J56APViK2D2zIejpjInpfocNftYj
	 590O9IxQ0DX7J2eOZQsV9pArJ1GQxVA4N61CK0gggxalTx6Q5R1vNmOhejwxTiUdJzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VnUIuf9k;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B483606A326;
	Thu, 19 Nov 2026 21:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B483606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VnUIuf9k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795125501;
	bh=LBFpxZHG8DXttjFCfrXOKXE0UTtg7CewXCAmh+s72GQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VnUIuf9ky9aDe1HxfNH7n/JRkL0tH6fDtd1pmgAHcpIPsYV4qEcppVPVs6UHTEuKP
	 gjZvkzJvIwVUvFP4k2TK2e/26DPoEvL7E4a2bVl1frNp06SX8149Rfwvx2Jz2VPZL/
	 QKffBIi50UkDoyEMpYdd7sFaKU3EFJZuYcU7OgAGQystKWNHO1XEiuV525pKsOs51l
	 PKLMpCdzfGcbGFZbPO5TU3ium3jMDRmcOkscStUK44xUNJf7r7RDWbEsVyNSRWxH2H
	 tIjk1cdvMv5nm32Rqux71mpjWvA/r2M92JIeIslUrhD1IYeWDQCaf9twQghz+UBfkI
	 BHcQozXjsWzlQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A553017E00E8;
	Thu, 19 Nov 2026 22:58:20 +0100 (CET)
Message-ID: <e5b11c9daee18bc93aa3986d85bb280117cf5620.camel@collabora.com>
Subject: Re: [PATCH v1 1/7] media: verisilicon: Add helpers to allocate and
 free auxiliary buffers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Date: Thu, 19 Nov 2026 16:58:18 -0500
In-Reply-To: <20260916125443.78602-2-benjamin.gaignard@collabora.com>
References: <20260916125443.78602-1-benjamin.gaignard@collabora.com>
	 <20260916125443.78602-2-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-G8gCA4wMjP1oE/ZB/PAu"
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

--=-G8gCA4wMjP1oE/ZB/PAu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 14:54 +0200, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> Add helpers functions to allocate and free the auxiliary buffers.
> That simplify the code and make it more easy to read and maintain.

"more easy" -> easier, :-D

>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-G8gCA4wMjP1oE/ZB/PAu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9w+gAKCRDZQZRRKWBy
9MMpAQDX5MVq3FLT2AZZbIUK7/q/eAwYusGRmh55gqMqOKSEEQD+Jl7Y+eu4QRt9
niSMVaKFbGTbklGM/mSgUMIS6CkB0gw=
=yWYf
-----END PGP SIGNATURE-----

--=-G8gCA4wMjP1oE/ZB/PAu--
