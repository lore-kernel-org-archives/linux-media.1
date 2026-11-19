Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124730;
	b=AI8HuPgWfX3zFsy2eqqO2ZeDEkDWVpNpSkMpi5ycqGG4/vwCk7oWKc7R73KGE1ftrJ6q
	 nJJWNSswve3pTDqOpMNeI7K+uv1qLBEkptwL4WmtrhaTOQWhceK4wh7+Q4E/iurYqh8sq
	 MvnH240Sp2OPJGA7OsF9PFfCfpUf1uF5gXctW0UInZoz0ppDBwti2OqI/vN8ug3LR8LdT
	 nBa4ckvyRKNEMuIW/JXhNxWXWtjZ0QZvADv6AuqRdLThYPJSZuNuAZL0TOvPesFTLNnOM
	 cEpeq9EvD3qXQwGozOmEeDSTuAKDK3/jaAHrujx/vOpLjxRE87NvFFqdiHDGDTaQh+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124730;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=2B5oJvmSQj/uLvDSVbb038rz/I+fF454frE8nhawMRc=;
	b=Kux8CsllFCgE+/xbDK//9onUvNnopz4dAfRAdmAY55co2usnlCD66upzpwZmL5aHosDw
	 bdVn4itMFLWwGBhZyGG00YECNd0WtKL+Cn0JubaDo5mIClUB4q55PYxgUkgYRFJwaQegr
	 JVpDXDXDROT9snMLMsRKleFPXuMiFDyLpFhURBFyIWKIjtyNw12fYUbvdcKE/+koBQNcX
	 FIk7Q2xK1gM3Srp1VdeM4GOUIw5cauXb08RuRTFOEApghCdxam2PPZ8wtr232ZrkrhFas
	 tnFm3DPUQ8doydrybMVoZ5Y3WOa4CaXgp4NgFfOBju+4Ptaou0Bj+9ANqB4MRuyKoVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bUeatrqE;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C21606A320;
	Thu, 19 Nov 2026 21:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6C21606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bUeatrqE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795124728;
	bh=qWrn0xVdylPSfFkj1g2JFpd2zWe+c98phSaOjNlvRvg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bUeatrqEEzqiXVtOvzacLan37HwzC6db6JqRsmwDkTUkVSRoZT8UQsF4Pbg1hD7v3
	 xCi6tfisi0UkR4k/JzY5G7CdJ0uFfl4TNAtBa1hbmyBarDoq1+e5qxTd1m/34sdKqb
	 Qbm1cP5H9JVUp4GClTINNoLNKZD0c8W7e4fgqUBNxn+PaaXCbY1xU2XEf8qVJGGZN/
	 /IvE/PVq100GkIuRkN2RHTuqEdkJpnTn1BdpVc32KJ4NOb+pRKOykjS9t4ctddwskb
	 pBS8m+67VA+3/beOw+qxIy+tonf6jZnPi07bU3Gt59RTDG/C03covc9n2USyECJP+h
	 172Y0qY5UzqNA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1571C17E0480;
	Thu, 19 Nov 2026 22:45:26 +0100 (CET)
Message-ID: <3611eee93f6d48bbe7de642abd238c7da147eaa2.camel@collabora.com>
Subject: Re: [PATCH v6] media: verisilicon: Create AV1 helper library
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Date: Thu, 19 Nov 2026 16:45:25 -0500
In-Reply-To: <ac588bfc-94f3-4ad7-9808-92ea0db1d017@collabora.com>
References: <20260910092021.139970-1-benjamin.gaignard@collabora.com>
	 <ac588bfc-94f3-4ad7-9808-92ea0db1d017@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-Dg5vUNNPaPxbWQnJXS5h"
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

--=-Dg5vUNNPaPxbWQnJXS5h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 16 novembre 2026 =C3=A0 14:33 +0100, Benjamin Gaignard a =C3=A9cri=
t=C2=A0:
> Le 10/09/2026 =C3=A0 11:20, Benjamin Gaignard a =C3=A9crit=C2=A0:
> > Regroup all none hardware related AV1 functions into a helper library.
> > The goal is to avoid code duplication for future AV1 codecs.
> >=20
> > Tested on rock 5b board Fluster score remains the same 204/241.
> >=20
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> Gentle ping on this patch.

Nice ping, but it does not apply. I've manually applied it, but will leave =
to
you to retest.

https://gitlab.freedesktop.org/linux-media/users/ndufresne/-/commit/c98580a=
49562a26d2cfc11fc0eb88e6e75f329d8

While doing so I notice few hidden changes:

rockchip_vpu981_av1_dec_luma_size -> hantro_av1_luma_size:

-=09return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
+=09return ctx->ref_fmt.plane_fmt[0].bytesperline * ctx->ref_fmt.height;


Change is really good, and it allows for padding, but totally undocumented,=
 and
would be better placed in its own commit. And then couple of bound check, w=
hich:


int hantro_av1_get_frame_index(struct hantro_ctx *ctx, int ref):
+=09if (ref < 0 || ref >=3D V4L2_AV1_REFS_PER_FRAME)
+=09=09return AV1_INVALID_IDX;

void hantro_av1_set_prob(struct hantro_ctx *ctx):
 =09} else {
+=09=09if (frame->primary_ref_frame < 0 ||
+=09=09    frame->primary_ref_frame >=3D V4L2_AV1_REFS_PER_FRAME)
+=09=09=09return;


These should clearly be prepend patches with Fixes tag for backport, and no=
t
hidden in the rework. Looking for your v7.

Nicolas

--=-Dg5vUNNPaPxbWQnJXS5h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9t9QAKCRDZQZRRKWBy
9CM/AQCgYjUXpp9ak9su9niYjM75+PBdrqkoOLdBR1tzshrL7gEAvsCwrMGVV+Ln
l/ilaftJcZE6qkNjcFU3b6foC2Y9Ags=
=wAiv
-----END PGP SIGNATURE-----

--=-Dg5vUNNPaPxbWQnJXS5h--
