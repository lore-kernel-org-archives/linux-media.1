Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795473222;
	b=DFRPf3ZzCwlDkUS1HpWE5ooJHmGe4dHZweRZH61hQR0fx8xcp+89BRGQ+7i/iVP/B/BT
	 ecCTeHnbq2UdBQM8p9bv6ozLFUB0eaYy8IQ021MMU3i2sf89ojCq2oE64aGaq6dctyaqB
	 4HAReYL8aYkig0PVEfwo78ku0K/Nh+7T0Oe3WSnu8VFbqCkQ34/be0I63LQQ7tQOv5m72
	 VjsVdJV3jLTPwsMnaETP7gMP77N2Jkucv6RyzmnGRgtWDaKuFvKo3uXd2sGp9QJ2aJfez
	 OW27luXQC7rn+GSnfZedqEwtmrOtG+0CEgdUSz5vaKf16FjevUXrkKxpK73p3kYip5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473222;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=Y1Cbx6fTiHSbxrAfycLCnlMfGzSknt7wJP5rbYdVFA4=;
	b=d6Uk5ROlWMEaRLkJd+ZfOAkc8DHitPc7MLP/sfz8YXBgeA1ICBXwC/pUpGHo/n/zhQB0
	 qgt8KOQ+6xLSyZ10d71jTQUr21FUdnLiLtxT0k11I48iWdCNla9tWc4ArGc5yhAyyBm5l
	 +3JdP2iMwn0lNpnWD3IJczI/XP/9tMX1vfmKtZqQSxOLRlmP679Gbrwmku+5d7lgGK6Vf
	 FEc/AnOdpOJFxfOsjv+wLmUASXIQ2IwBkF2B2nno4bj6LQpuCK3KkmJQ64tITT9nxQU1t
	 kydkDEQ4LnFMpQRFX9bYMx9Y+UKx4FldAkAEdI7/WvD80GGIrPssCB+hSnsLDXj2TNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XzWNCIEj;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C242606A31E;
	Mon, 23 Nov 2026 22:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C242606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XzWNCIEj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795473220;
	bh=dL+tpQbnMGg66PBUgwxTYFnvLpJiNAfb+/Z5mreVWiM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=XzWNCIEjUReHDb6XRM0dqL0Mcy85gpjoqurw2tzgzS3Leb4+7sDHfSiCIh+EEZqqM
	 rb1MkgV6TOqtfjmQZNYvdFLKFFDzW2ETHGwQhzeJfxPOTRbWHMg/zUtLYymnDdYGxZ
	 VuDQmnM3YHVIZ3k6t0QfoLODZW7UwvXPWPlIiBb31egsE0loUZDL2EJKkZqbWH00Y5
	 Z77l+JNZGMCRtIiCnRnAyRF/PWbTBeUnuFaK+x2DiNS+xy4/GBb3wQJh2HeDIM4oKL
	 EJCLoFNG4jzmmu29/rZp8vT+YNgibIXpn6Za+vdzrkGCOenQXZYO7WYPBlgmt4ZGh5
	 nSrW5UqGKXXhg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4190517E0285;
	Mon, 23 Nov 2026 23:33:39 +0100 (CET)
Message-ID: <caa2a55c7dacff3416e404ce6108badf431ea0cd.camel@collabora.com>
Subject: Re: [PATCH v9 0/4] E5010 Probe Cleanup and Adding autosuspend
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Thakkar, Devarsh" <devarsht@ti.com>, "Brnich, Brandon"
 <b-brnich@ti.com>,  "mchehab@kernel.org"	 <mchehab@kernel.org>,
 "hverkuil@kernel.org" <hverkuil@kernel.org>, 
 "benjamin.gaignard@collabora.com"	 <benjamin.gaignard@collabora.com>,
 "linux-media@vger.kernel.org"	 <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>
Cc: "Willis, Kendall" <k-willis@ti.com>, "jai.luthra@ideasonboard.com"
	 <jai.luthra@ideasonboard.com>
Date: Mon, 23 Nov 2026 17:33:37 -0500
In-Reply-To: <b7db145d-5236-47f1-91e4-af6106ecb145@ti.com>
References: <20261111170530.809226-1-b-brnich@ti.com>
	 <b7db145d-5236-47f1-91e4-af6106ecb145@ti.com>
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
	protocol="application/pgp-signature"; boundary="=-LZ/pVYr6COIByQxLqLfu"
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

--=-LZ/pVYr6COIByQxLqLfu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 06:44 +0000, Thakkar, Devarsh a =C3=A9c=
rit=C2=A0:
> Hi Nicolas,
>=20
> On 11/11/2026 10:35 PM, Brnich, Brandon wrote:
> > Hello all,
> >=20
>=20
> [...]
>=20
> >=20
> > Brandon Brnich (3):
> >   media: imagination: e5010: Fix clk never enabled without CONFIG_PM
> >   media: imagination: e5010: Update e5010_init_device Call Sites to
> >     Ensure Proper Device State
> >   media: imagination: e5010: Enable autosuspend for runtime PM
> >=20
> > Myeonghun Pak (1):
> >   media: imagination: e5010: release m2m device on probe failure
> >=20
>=20
> I've reviewed this series in detail, and it looks good to me as the
> driver maintainer. All four patches carry my Reviewed-by.
>=20
> When you have a chance, would you be able to pick up this series ?
> Patches 1-3 are fixes tagged for stable, and patch 4 adds autosuspend
> support.
>=20
> Please let me know if anything is needed from my side.

Applied, I'll send a PR this week.

Nicolas

--=-LZ/pVYr6COIByQxLqLfu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawS/QgAKCRDZQZRRKWBy
9PgEAP9FT9xvAjV8hnPXOtV0mcTPHXyszDdN9NUmyrBdBE2KoAEAx28mpVzolZOh
ApqtgWoPugSICDeMhNZUtsoPHUTK0gE=
=3RqH
-----END PGP SIGNATURE-----

--=-LZ/pVYr6COIByQxLqLfu--
