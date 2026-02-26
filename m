Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590CC44D686;
	Thu, 26 Feb 2026 19:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772133953; cv=none; b=DgmXBcFLTKqkWJd6aL7/leCWULlavCFaQRzAdkvR9o7T++slf27FhDbUyDq+zlXkgozNkpPxx+yypn4lbn2NDWwXxg9AjM3g9LUHogLrxm3bg8RiOsjV6w3oar1Xc7p7sITeQvjcw98S4kVHU5Gnvvu5r5hMtx5gyq/lEJG0JaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772133953; c=relaxed/simple;
	bh=b9CvPoj/OtYglTXhUk/6DhyMwP9/PO1MO0jnGKsTsQ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rfSzGV0E2lRdWLJTDcv2wCtmCRHUmHycjUt0dK+Oq4d0BHaXRmak+gqpR+VIZhkoCSBuxPSwQXJexKT3HAIOfSfVM8H+/G+C+BZ2ecROhywhfGSMzuUiTI5hSQNkF27FcUq0AhhTAC9yWwT/grwx7YXevBPdcnVIPEIP5zGZ1Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=C6hv5SOE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="C6hv5SOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772133940;
	bh=b9CvPoj/OtYglTXhUk/6DhyMwP9/PO1MO0jnGKsTsQ0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=C6hv5SOEnGEyc4i5YDQElhLZZq/FiXxc2KIFBXihMkdim925S8EvIKUFysmfABL8O
	 +FBmB87uICQCxiYTwJ1dm1vLrYdglFHnE9Iv4b/OR1batQ8rToFwedPo2FBNwfgWLO
	 NaTp/rjULbDhfKEwVh56CRp7P09hq68tTbbB3Q+4hcDQTASXNG9KI8LgYoD+Kn4Ans
	 tUUjEoAiMQpi+enQ9gq69HD8Tid1qAp6ZMFEsE7gBmAlzktojsEAmHJqQK/z7CzRsj
	 wbQCOaIZq6DXTRon5mNXUZ86oFag4bxQvy5xeT+IrnaErssD/AeU2FZk96WNYBVFUq
	 +oh4CZwTctFKw==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB74017E005F;
	Thu, 26 Feb 2026 20:25:37 +0100 (CET)
Message-ID: <e8ed4c2bb4f1543a4d2cf75b28fab157332a3e17.camel@collabora.com>
Subject: Re: [PATCH v3 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	linux-media@vger.kernel.org
Date: Thu, 26 Feb 2026 14:25:35 -0500
In-Reply-To: <20260225-vdec-reg-order-rk3576-v3-1-5a2ebe1b11a8@collabora.com>
References: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
	 <20260225-vdec-reg-order-rk3576-v3-1-5a2ebe1b11a8@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-oG/QpE1zaXLEWLDnfuQm"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-oG/QpE1zaXLEWLDnfuQm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 f=C3=A9vrier 2026 =C3=A0 14:19 +0200, Cristian Ciocaltea a =
=C3=A9crit=C2=A0:
> With the introduction of the RK3588 SoC, and RK3576 afterwards, the
> 'link' and 'cache' register blocks have been provided for the video
> decoder unit in addition to the existing 'function' one, which now shows
> up in between them (from address-based ordering point of view).
>=20
> However, the binding does not properly describe this hardware layout, as
> the new blocks are listed after the old one.=C2=A0 Therefore it breaks th=
e
> convention expecting the unit address to indicate the first register
> range.
>=20
> Since the binding changes have been already released and a fix would
> bring up an ABI break, mark the current 'reg-names' listing as
> deprecated and introduce an alternative 'link,function,cache' one.
>=20
> Additionally, drop the 'reg' description items as the order is not fixed
> anymore, while the information they offer is not very relevant anyway.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../devicetree/bindings/media/rockchip,vdec.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 19 ++++++++++++-------
> =C2=A01 file changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b=
/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> index 809fda45b3bd..3f6072e8baa5 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -28,16 +28,21 @@ properties:
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 minItems: 1
> -=C2=A0=C2=A0=C2=A0 items:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The function configuration=
 registers base
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The link table configurati=
on registers base
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The cache configuration re=
gisters base
> +=C2=A0=C2=A0=C2=A0 maxItems: 3
> =C2=A0
> =C2=A0=C2=A0 reg-names:
> -=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0 oneOf:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: function
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: function
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: function
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deprecated: true
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: Use link,functio=
n,cache block order instead.
> =C2=A0
> =C2=A0=C2=A0 interrupts:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1

--=-oG/QpE1zaXLEWLDnfuQm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaaCeLwAKCRDZQZRRKWBy
9IvUAQDfqcrOLtwQ1nyL9R5heMbr1tHkRWWhLf61QA2aJxBUdwD/XaDwTxRmRLzV
6if3ujVa9dS6lCQLPv5IU64T9qq/sQw=
=t0d/
-----END PGP SIGNATURE-----

--=-oG/QpE1zaXLEWLDnfuQm--
