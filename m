Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469869;
	b=IWl0tsFvgmQqOnPJBgisIyRAelUqUx2oDdFWTD33Z2ba//n4dE3Yc7N93gQH4pOqy/hO
	 +rKot5/T+9eYZeGftefQaBuBHQR4R/G8CidP6D8k093vly53oOYE754VeHsEQXztmJ2iR
	 iKkFhYSVVlh5TEA6BOhNa3/uHiXAr9EgAg1nvWYccNpGEi/6LbYvg+aNH9vG1eEGSX1/N
	 x5T3FglAFe5AbQ0V7/niamH4qzaqD4gM9hg0lNhs+i+VxV8NbIs0gqFsBdRgpf0Z/LpFu
	 wJ/HL3zgrezUIrJvjz8/Dkg/yBdwVHSXb1hqSlmT++5gFQY/7iF6jiU7Y/cXLO3etQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469869;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=XZB01VxXXHZ8JGUr/Kjr5B+9ghGqWLtm2u4oVk4hZ5A=;
	b=VL/jJhNIlJLv0tWd94hKwrpqX5BwyTR49PqCN+ZCmYHRQfb4uJxt5NlJvUnBpYumQEyg
	 azuxsgY6P4lQFzsXEXLtB2D2VVMqZIFxA3uIu0AMAuHB9FREVwpxEgWHVjpXY/HBdAGWJ
	 gCTEGFaCpM9qLAvf4qFlCVzIGgZTje4XijFxDNdvI9/+s8YkKThlb9k4c7cop62onZCtw
	 eLgmNtX+6X9bcJaF6QydMkbWAChwnhu6hGQTuVp+7U568M92Za70Hty3NX+Jh1nS3xSJp
	 L589RRFvEFYnKO2/Kt+8FjV4Oy4/HA7Lg+c9UTBsn4mOT9L3xR54uOPqQgdLai6njkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HSvYYxz4;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E106606A31E;
	Mon, 23 Nov 2026 21:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E106606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HSvYYxz4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795469867;
	bh=eqTz5I5hXDw/utCcHS4ZZHudHX0/EsrXro8Gc1lz+Ro=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=HSvYYxz4hFHJFR/ULMOWK5fixWjJk8ihJMLLpTqi1mYhOy6TG6rGg3D1/NOgqSsTi
	 fZ2ZNH7LPyrS1+Pgdbl6FVtI1xAWwVsEBFbsRMEsWSwYJ+4tCmZKzgBPDyndmHvHBo
	 p3WMpS1d/1YQsnf1854UNB/KRzskp7MMD9G1Cg+l0z5BdABPu03LzZtNb/HfR9swnj
	 ooJIucIZFqjqiYMwyTqa/ro63A473ypL+boC7bKpb94t6GVIggS6dCKDjasj/h+jPB
	 yc9GJUFSRmNXnr+zDToQ6ZD/nK1ScW7MemSzYVIM3wswQFQ3gi6AKXIomaj7uMBwHZ
	 Os7BjdgPgsMHg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A349717E04F7;
	Mon, 23 Nov 2026 22:37:45 +0100 (CET)
Message-ID: <aa951ce0fd972085a4c9fb19a3c67e36ed90dc7f.camel@collabora.com>
Subject: Re: [PATCH v3 0/3] media: rockchip: Add the IEP2 deinterlacer of
 RK3568/RK3588
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: aiyengar1990@gmail.com, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp
 Zabel	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, Alex Bee
	 <knaerzche@gmail.com>, Krzysztof Kozlowski
	 <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:37:43 -0500
In-Reply-To: <20261120-iep2-v3-0-e94eb9f629d2@gmail.com>
References: <20261120-iep2-v3-0-e94eb9f629d2@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-FWklcH9hjr78QjddYyVY"
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

--=-FWklcH9hjr78QjddYyVY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 11:30 +0000, Arun Iyengar via B4 Relay =
a =C3=A9crit=C2=A0:
> Add a V4L2 mem2mem driver for the IEP2 deinterlacer of the RK3568 and
> RK3588, with its binding and the RK3588 DT node. The V4L2 side follows
> Alex Bee's IEP driver.
>=20
> Tested on an Orange Pi 5 (RK3588S) with a 7.3-based kernel (KASAN,
> lockdep); build-tested on media next. v4l2-compliance 59/59, all four
> modes at 1080i without IOMMU faults, s2idle and deep suspend while
> streaming, unbind while streaming, forced watchdog and IOMMU fault
> resets. Not tested: RK3568. DMABUF imports of exactly the image size
> are refused, because of the 4 KiB OUTPUT padding (see 2/3).

What software makes use of this driver? Did you test in a real application?

>=20
> One case is still open: a reset during a transfer, seen only with
> forced watchdog resets, can leave the IOMMU busy. Jobs then fail
> without DMA and the driver suspends at once so that PD_VDPU powers
> off, which restores it. While another device of the domain, e.g. a
> video decoder, keeps it on, the jobs keep failing.

What do you mean by iommu busy? In the decoder, some errors would lead to t=
he
decoder core doing a self reset witch we believe wipes the MMU registers. C=
ould
the watchdog reset endup doing the same?

>=20
> Developed with Claude (Anthropic), which wrote the code and the commit
> messages. I reviewed every change.
>=20
> ---
> Changes in v3:
> - Drop the vendor kernel notes from the commit messages and cover (Krzysz=
tof)
> - 1/3: drop the linux-media list from the MAINTAINERS entry (Krzysztof)
> - 1/3: add Krzysztof's Reviewed-by
> - 2/3: start the job and its watchdog under irq_lock (Sashiko)
> - 2/3: soft-reset the core with the AXI side, CRU reset if the IOMMU
>   stays lost, shared IRQ off during a reset; no DMA until the IOMMU is
>   restored
> - 2/3: return OUTPUT buffers before CAPTURE buffers
> - 2/3: mask and clear all interrupts on completion and before a job
> - 2/3: suspend at once when the IOMMU is lost
> - 2/3: take the mutex in system suspend
> - Link to v2: https://patch.msgid.link/20261115-iep2-v2-0-3d8798cd9a55@gm=
ail.com
>=20
> ---
> Arun Iyengar (3):
>       media: dt-bindings: Add Rockchip IEP2 deinterlacer
>       media: rockchip: Add IEP2 deinterlacer driver
>       arm64: dts: rockchip: Add IEP2 deinterlacer to RK3588
>=20
>  Documentation/admin-guide/media/rockchip-iep2.rst  |   32 +
>  Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
>  .../bindings/media/rockchip,rk3568-iep2.yaml       |   95 ++
>  MAINTAINERS                                        |    8 +
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   22 +
>  drivers/media/platform/rockchip/Kconfig            |    1 +
>  drivers/media/platform/rockchip/Makefile           |    1 +
>  drivers/media/platform/rockchip/iep2/Kconfig       |   16 +
>  drivers/media/platform/rockchip/iep2/Makefile      |    3 +
>  drivers/media/platform/rockchip/iep2/iep2-regs.h   |  191 +++
>  drivers/media/platform/rockchip/iep2/iep2.c        | 1320 ++++++++++++++=
++++++
>  drivers/media/platform/rockchip/iep2/iep2.h        |  108 ++
>  12 files changed, 1798 insertions(+)
> ---
> base-commit: ad6549a46748d00818483b535e5cd2a704685c98
> change-id: 20261110-iep2-b9a9c6e77c44
>=20
> Best regards,
> -- =20
> Arun Iyengar <aiyengar1990@gmail.com>
>=20

--=-FWklcH9hjr78QjddYyVY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawSyJwAKCRDZQZRRKWBy
9HpuAQD2iyW68QKwqexXSmR8w/lWArl2Njqs9To+Zvdg2jBNBAEA6vJcr0L5MZYS
Rnl6XvNw8L5b5ihSSaBSPLHj+IItZgE=
=1qmu
-----END PGP SIGNATURE-----

--=-FWklcH9hjr78QjddYyVY--
