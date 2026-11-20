Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209640;
	b=BLbgd3cr0QK2dau8WhnZNoNwOwIf2IrD1g9K452mE0Bjkuj+wg4DrmHprNiRzhWo6QgC
	 c1sB/eV9EH49v0pJ9CxlBDwsl3pwBGgw2qe4O3eiz+uoG6suIEYAqp/bBvT3+4WYJSllm
	 hiozhMtoYJx/m0fXPpEMKVxJ9CWN35d7MDe4Vql09HMTTZnyTESUCpNAv67ZuuHs1K3ct
	 HoTUlNrCDUOqmgkJr8Ea+mslQN32P0ITLTrnqDIp8dfDdWuANoO5Nr6sSm8hw6P8GZNAd
	 +flAmnnLQR7Eh2RSJo/jVyifizQzHVL6acckPR0TXbreBOQBwVNunOgTTs4sIajp0og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209640;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=LmcAi6HEybEAMZVvo4K38uL60nPeQBtPpV5MltW1eac=;
	b=h7slA2IF08Ob9AlEl7Ti3gqYbieFseAbQcElhKuGO6YygRm8tE61PbF1jSFGTDMzu0WC
	 Pq7PlU2GEAYRG7vAxPK19miOchP5BuqwUFG8C5SaxglilNof/crsd37fIQ0+1pJasrAEC
	 ADWc50qyFlvoFBq3f1M096h6IP8mZLBeMgLzn9iM5L3LaICDNDo/2OAjaGbBaES9rP2YM
	 8z/vS/QU6rHWYxiMIdRsxULLBVKVehQ+ewI3BkgkueidJThl/I4bE4OeK7f9KWT4SVNYD
	 XF5THLkSgKAlRgCSuxZTwoWMBKaiBiQIuJXdOonvYgvrOf4hY2MEsm0+69ZbijQj9bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=l8dCeRqd;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6D6606A6A8;
	Fri, 20 Nov 2026 21:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF6D6606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=l8dCeRqd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795209636;
	bh=LmcAi6HEybEAMZVvo4K38uL60nPeQBtPpV5MltW1eac=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=l8dCeRqdGGvDvQZ6PoqXdbpOJ2+fHWxxCuy7aAJ3wsV3nStEcpuZBlfrRlpSY2N3w
	 kp75T389Dl2TmMOXvOIh4ISZYhHDjk5iD7ViLnd0A34sXeoqUknsWdR7cYp7Oc+hIn
	 pBe56/3B9KMjtV7WZx3gkQ0tnfAIlsQIg8dUkR9qr0tGjKddwrHudAPm3qgJmFkWNs
	 n5tIOgBsi8D+TFQnBOPA7qZnQdAHAmRv3EjMfN23Pd5g6xxPn6CTdEtE1PgUr7wC3l
	 1R1F6KUaGcIqH1MwDscd7s0zLu3GFyUp5s5BFYVJOe5NWVmO3NJiSvIVUqremtdRJa
	 kkOjH8KNmIsHg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A965017E0060;
	Fri, 20 Nov 2026 22:20:33 +0100 (CET)
Message-ID: <bc777a9772d1dd841d1928421a7881fb57f9d70a.camel@collabora.com>
Subject: Re: [PATCH v5 3/5] media: rkvdec: vdpu381: Program the read caches
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Daniel Golle <daniel@makrotopia.org>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner	
 <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>, Michael Riesch	
 <michael.riesch@collabora.com>, David Heidelberg <david@ixit.cz>, Christian
 Hewitt <christianshewitt@gmail.com>, Marc Zyngier <maz@kernel.org>,
 linux-media@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman
 <jonas@kwiboo.se>,  Diederik de Haas <diederik@cknow-tech.com>, Dang Huynh
 <dang.huynh@mainlining.org>, Piotr Oniszczuk	 <piotr.oniszczuk@gmail.com>
Date: Fri, 20 Nov 2026 16:20:31 -0500
In-Reply-To: <57258f1199fdbf24ac57081c6f3df219464e870a.1795191822.git.daniel@makrotopia.org>
References: <cover.1795191822.git.daniel@makrotopia.org>
	 <57258f1199fdbf24ac57081c6f3df219464e870a.1795191822.git.daniel@makrotopia.org>
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
	protocol="application/pgp-signature"; boundary="=-xMvWOScR5XSmqSVox+1m"
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

--=-xMvWOScR5XSmqSVox+1m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 17:41 +0000, Daniel Golle a =C3=A9crit=
=C2=A0:
> The VDPU381 and VDPU346 have three read caches, configured through the
> "cache" register block. The driver leaves them in their reset state,
> and on the RK3568 some streams then decode with wrong output.
>=20
> Configure and clear the caches before each H.264 and HEVC run, the way
> the vendor kernel driver does. The "cache" block, which the binding
> requires, is now mapped at probe for every variant with named register
> blocks; the VDPU383 does not use it.
>=20
> On the RK3568 this fixes the HEVC conformance vectors RAP_B_Bossen_2,
> WPP_D_ericsson_MAIN_2, WPP_D_ericsson_MAIN10_2 and
> WPP_E_ericsson_MAIN_2 and the H.264 vectors CAPM3_Sony_D, MR8_BT_B,
> MR9_BT_B and NRF_MW_E.
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-xMvWOScR5XSmqSVox+1m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawC5nwAKCRDZQZRRKWBy
9P8TAQDpyeSu1gXllnkYGeMqRKPvJ8onxEJ+yv2Jv5OBpiybIQEA1uZT2/boTgHm
weAd02uKsuvt1n9zB+lAaVOMSc3SMgQ=
=K9qN
-----END PGP SIGNATURE-----

--=-xMvWOScR5XSmqSVox+1m--
