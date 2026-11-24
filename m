Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491645;
	b=DCTSYBX20d1v2RRBxp0UZSGi0AH/XjqCfUdR8kHA1YUJm1OaXpKAYsulr+bJp0iRP7jq
	 C9flHMyKQB70wANCEluekwmuMo/fw6wuwoe2ApzaFEQ8TMj2w2iffE6U8onV0DYWKsv4c
	 hg+Te/TREKYzMrMWGUtz4ml/nDRlYHePQmBUwvY9TFPVqwPqLOjgg+QW7Z3bXOOQ80Evj
	 hADDUnJY7st3u9FOPUC24GXph/U4yB0j5dfjPapEUYyrpfDrE+RD25hCDvKwuv9DPhI0J
	 CTXKy3ML+MBT34hyFkKQeO4lYYuFLopNiUsxzJlco/QqOFKZz1cmd+ID8TVscSmma5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491645;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=/3sNuR4fYfduGSspGrUI+Nhd0G5pRFuRvvGEppI+8B8=;
	b=hkl6nNGQt2M7ZBCkL1jcnB3hn4iDeXWP+B00Nv62tu0/WgVYB9ZP7TCnc8VjgmkrMhab
	 AuAQzUsRZYY3GyqCu/tleiQBxf0/BLrs39HWnHaMe6qjvcvRcjUlX/fbgOjdn669oqpEe
	 zukxLFll/9k+24bxVGGWBNJBaLkLtNCPR2GeomexBfS+pG34/7MOUaOGGVCVHb0ASIZnd
	 AWr91sPXA6Uym5SKp6F1qW7c+a0usJX74O40POd58ccLRSvY7q3VKdb08m+3+MT0ABpTm
	 yREskdcL4igkhPiZE4KSSNJW+DKIr1bUyj2R5UChURETtn+pBeWdj14/I/VG+a+xR9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=h6mdar+A;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F86606A31E;
	Tue, 24 Nov 2026 03:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F86606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=h6mdar+A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795491643;
	bh=QhqdYdT7M/jtRCJyOksKmWAlKfDFnwolfbIqPbeF2ZQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=h6mdar+AFMHCToI32rjA1wBIRW0J4RGqS4fhfc8Yu1OxdPzFLH5DcYylsVe8Otx0v
	 kKAs6rwagzY1zT1gTNxKIU+qFcqfk8hVPgaPQCpQJ6yAKXAkBhjkMxv9KK2gOrNKZp
	 dZLPrPqQTvA+RseBr8ogAYrFMttuBXLmNV/3nNC7/7dTayvsN6/osYwH2Q5g0LIv/l
	 blnuWIghjBRPqWyiZDNSMVDtEi3qZVm6TTxKxL2KbF4iKO3kdtFVCFeojLhF8v5ynp
	 PwLFoMoJn7EdEVg5NCGJjbNamv2Sczyg/MfeUwqFXdOjPNzg0p3XgHPVM/eRJzupO0
	 c8OytkyiiRc6A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6637417E0CD7;
	Tue, 24 Nov 2026 04:40:42 +0100 (CET)
Message-ID: <542f7fd2973f4b32ec55bb5c3314535a2c4b82a6.camel@collabora.com>
Subject: Re: [PATCH v3 0/7] media: verisilicon: simplify auxiliary buffers
 allocation
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 22:40:40 -0500
In-Reply-To: <20261123095905.60622-1-benjamin.gaignard@collabora.com>
References: <20261123095905.60622-1-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-d1+zo/NEbm+5SALSuWmp"
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

--=-d1+zo/NEbm+5SALSuWmp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 23 novembre 2026 =C3=A0 10:58 +0100, Benjamin Gaignard a =C3=A9cri=
t=C2=A0:
> Verisilicon stateless video decoder driver allocates lot of auxiliary
> buffers to decode bitstreams. These allocations duplicate a lot of code.
> This series add helpers functions to allocate and free auxiliary
> buffers. This simplify the driver code and will allow to implement more
> easly incoming feature like disentanglement data buffers from mv and rfc=
=20
> buffers or adding reference frame support for more codecs.
>=20
> This series has been tested with fluster on IMX8MP for h264, hevc, vp8=
=20
> and vp9 codecs, and on rk3588 for av1.
>=20
> This series depends of this one:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=3D34366

This is only pending the dependency, which one of the hidden changes had is=
sues,
please fix and update, ping me once ready.

Nicolas

>=20
> Regards,
> Benjamin
>=20
> changes in v3:
> - As suggested by Philipp do not mask hantro_allocate_aux_buf() returned
>   value.
> - In hantro_allocate_aux_buf() and hantro_free_aux_buf() only set vpu if
>   ctx isn't NULL.
>=20
> changes in v2:
> - rebase on top of media: verisilicon: Create AV1 helper library v7
> - tag reviewed-by tag
> - fix patch 1 and 7 commit messages
>=20
> =20
> Benjamin Gaignard (7):
>   media: verisilicon: Add helpers to allocate and free auxiliary buffers
>   media: verisilicon: AV1: Use alloc/free helpers for auxiliary buffers
>   media: verisilicon: h264: Use alloc/free helpers for auxiliary buffers
>   media: verisilicon: hevc: Use alloc/free helpers for auxiliary buffers
>   media: verisilicon: vp8: Use alloc/free helpers for auxiliary buffers
>   media: verisilicon: vp9: Use alloc/free helpers for auxiliary buffers
>   media: verisilicon: mpeg4: Use alloc/free helpers for auxiliary
>     buffers
>=20
>  drivers/media/platform/verisilicon/hantro.h   |   4 +
>  .../media/platform/verisilicon/hantro_av1.c   | 191 +++++-------------
>  .../media/platform/verisilicon/hantro_h264.c  |  13 +-
>  .../media/platform/verisilicon/hantro_hevc.c  | 133 ++++--------
>  .../media/platform/verisilicon/hantro_mpeg2.c |  19 +-
>  .../platform/verisilicon/hantro_postproc.c    |  21 +-
>  .../media/platform/verisilicon/hantro_v4l2.c  |  37 ++++
>  .../media/platform/verisilicon/hantro_vp8.c   |  36 +---
>  .../media/platform/verisilicon/hantro_vp9.c   |  42 ++--
>  9 files changed, 169 insertions(+), 327 deletions(-)

--=-d1+zo/NEbm+5SALSuWmp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawUHOQAKCRDZQZRRKWBy
9F6EAQCwseq4NDQojK6PfR3v2YM5UAI7KZmdH0HcIjV+x6cdkQEAt4UtMeEuSbVm
CWa7124MFpsFveeuJOqp6SHTfm/plgU=
=AqRt
-----END PGP SIGNATURE-----

--=-d1+zo/NEbm+5SALSuWmp--
