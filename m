Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FAB3D3334;
	Mon, 10 Aug 2026 14:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370992; cv=none; b=mllOqFhCy0BmWkDLR9Rzhj6KAK1PFQJSnJnXGbYfsuXr8NwYsBq46TP9lfEGjSICbTPn/Bg9ud8uQbl1zRuUOFzXWmA7p+asS7G5wHHtvNIAyvtD0uDtmhUjW7IEbDRyGKX2G7qwbs+mL8BXD3ClQUMRwYSDfAHOuxp1JOX8xc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370992; c=relaxed/simple;
	bh=q9XZ9PFaOttrJScNyLsrJJf0rfpu9aYHOmG8UewkSsY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ug7oNvHUDYLAhU13lWmPVILWZ6/Iv2fSQqvloPU+r/VJgGP3pR6jzOwo31GqTs5aFoMlGmimDEiPHTge2hWt5mWVig8cMv8yP3cRSoTzQr9RZLrkKcyeUEoyUAFF0OF/mHwZcd7SR8fU15WC2vJ3rTM5uUWbyDiCPanp2majfgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WVUqf6kd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WVUqf6kd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786370987;
	bh=q9XZ9PFaOttrJScNyLsrJJf0rfpu9aYHOmG8UewkSsY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WVUqf6kdmhif9DQCIU3WmUyS9amW1W3+89dBAQ4c4TpXeOM93wAwIRg9ldbukcGCd
	 FkvKkZaDBYXJdQyWH2OO/5rMSjn8H1WLRBoJ69zxAXuZS53cUti7M0pfZ88yde7KfP
	 L+NPf9SBo6N2AG44qWzVDMhDdJ6LvnX1CtvNJMpNMN/W9W5vLZULfeomUAaVfB4Sz9
	 vgC/G75pQnH4f8wjOOaghgJPWVvykDkruRUaxe1JwxkwLskpXG1muD015U71AcuTlA
	 mjJTYLNVR7c/j3nfF69QD0wYHXA23pZELAldzjSyAZ6+Q4Q+OtjlJOTsYHP18dTzD5
	 uru3kEg16fptA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9709617E077F;
	Mon, 10 Aug 2026 16:09:45 +0200 (CEST)
Message-ID: <2a5abb0004aa453c2f985aff41c72d4952006fc9.camel@collabora.com>
Subject: Re: [PATCH] media: hantro: Harden MPEG-2 control access against NULL
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Date: Mon, 10 Aug 2026 10:09:44 -0400
In-Reply-To: <20260731140751.1183-1-tharitt97@gmail.com>
References: <20260731140751.1183-1-tharitt97@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-zKDJou/lVj/KGzVMp1c8"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-zKDJou/lVj/KGzVMp1c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 31 juillet 2026 =C3=A0 14:07 +0000, Tharit Tangkijwanichakul a =
=C3=A9crit=C2=A0:
> The MPEG-2 sequence and picture controls are validated
> before a job is queued, so hantro_get_ctrl() is not expected to return
> NULL in hantro_g1_mpeg2_dec_run(). The controls are nonetheless
> dereferenced unconditionally.
>=20
> Harden the invariant by checking the sequence and picture controls with
> WARN_ON().
>=20
> Found by code inspection.
>=20
> Fixes: f329e21e9dad ("media: uapi: mpeg2: Split sequence and picture para=
meters")
> Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

p.s. this is a bit cosmetic, since only a programming error could lead to t=
hat,
once a control is registered, it has a value. But that makes it consistent =
with
all other use of hantro_get_ctrl() in this driver, which I like.

Nicolas

> ---
> Tested on a Rockchip RK3588 (Rock 5B) board with Fluster:
> =C2=A0 MPEG-2 (MPEG2_VIDEO-MAIN): 23/43, unchanged
>=20
> =C2=A0drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c b/d=
rivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
> index e0d6bd0a6e44..6a942f4b8a2d 100644
> --- a/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
> @@ -161,8 +161,13 @@ int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
> =C2=A0
> =C2=A0	seq =3D hantro_get_ctrl(ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_MPEG2_SEQUENCE=
);
> +	if (WARN_ON(!seq))
> +		return -EINVAL;
> +
> =C2=A0	pic =3D hantro_get_ctrl(ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_MPEG2_PICTURE)=
;
> +	if (WARN_ON(!pic))
> +		return -EINVAL;
> =C2=A0
> =C2=A0	reg =3D G1_REG_DEC_AXI_RD_ID(0) |
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 G1_REG_DEC_TIMEOUT_E(1) |

--=-zKDJou/lVj/KGzVMp1c8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCannbqAAKCRDZQZRRKWBy
9PC2AQDVAd/UdtrSKkwnBgNQg0ktJGp/cu6WEQ6j3In+PD+JiAEA0ZU60FJ2OJJD
VeT5C82uLSGrdUmNhdpqYU1ti06g2w8=
=2WtK
-----END PGP SIGNATURE-----

--=-zKDJou/lVj/KGzVMp1c8--
