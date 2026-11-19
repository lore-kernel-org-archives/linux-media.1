Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109748;
	b=SRmu+Tv7KjoX01Cj5wm55NJBVoFToF83fN40YK+HC1N46RZR90IdGFRmSW7Y4/+yJkBE
	 mmCm+JCIz4LS8Q1mBlEJOkGc02pAguJOSO1m+jzdRLxg4bivea/W5J3gfBOWZBlk/FET5
	 iBPpBm8WoXVf05sAxg7k2NezpWGnxcza2lwXUeSkqSYYYkVtp35caoyraDOcHEi+0qnie
	 KmURKY9sEm1m6NxSI/IWQ+nYPN8qn6G2SrJgh++dUoHaxgnMYjHr8IswpXVYbsjsakCHg
	 o3yHJlFzPTrzpfKo57Nv6MwyFzUSVB8lcZhitXZ5OdcRgMeSTEM91fTvznG7BEESFIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109748;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=62yMPuLvuNHDTEn7DCclIB1obRkzwr1eicwWTfCp6QQ=;
	b=XBRnOqyHy0AUBmafEZvI+Csi6WijcN8G8aaPyMha+XTu/GIdxXGmMEW3GpOSUZjdvTpr
	 Al8RfySA5OnKGQtCUh88X0yIaadSxCL84F0I8N2d35RZaOPf0ctsr+9GlfkHG97blPIz1
	 muHm9uDNxXc0CFyWGu3EpdtFv/DILS/chktNUg23WgteFXMGnm0AiCGCwacKXRe+oqf+7
	 u7OoLWOLwI67suyebxQ5hx54uOeanbgFe5JyO18vU9MlsB81/BybzPBSbc4aWsggnn7VA
	 YWlP9zeHose9paFHuvaYF9jBDv5Xgsp1Bze/MGl6WN/rqlfhwoZuT8+5AtKiUXoSUIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=jTp7YByt;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39AC606A324;
	Thu, 19 Nov 2026 17:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E39AC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=jTp7YByt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795109746;
	bh=62yMPuLvuNHDTEn7DCclIB1obRkzwr1eicwWTfCp6QQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jTp7YBytXbg/Nrf1EWXt56qs+S96LAUOMsD15Ye8mO4ROTgyAmEtlNT92FL/R1cxD
	 a4L4aBDbVLzaD2pkFmZKBeVZUbdmPuOcZBabKj/LrQxfI25U8N3Hevuirwm+3irxw7
	 xcHL+NHe2UyLWn9nYTT9sv0jaNkSRi4NvThHgSnYCoqU6mp1d5JTdzKP/WwvbvDXZm
	 B/Jn/tMK+9NDXwlptpI3s4PhkOwSIkv/6ID3Qs9RtxS/x3roMgI73xhDVxuqp4VYTC
	 DCxzOmx+4KU08+Bie/KzdaGTcfUzanoDUv/erID1gVYgMP30C2DBWkQuAVjqs/en9f
	 1VbUDwcWGeqcQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF44617E0406;
	Thu, 19 Nov 2026 18:35:44 +0100 (CET)
Message-ID: <c0da8a7d22c6b837c2c8d62e6d267b54d6ed28f4.camel@collabora.com>
Subject: Re: [PATCH v2 2/5] media: rkvdec: Remove unused need_reset
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, 
	kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 19 Nov 2026 12:35:43 -0500
In-Reply-To: <20260810-rkvdec-multicore-v2-2-986f89d22cdc@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
	 <20260810-rkvdec-multicore-v2-2-986f89d22cdc@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-V6UIdoLb9tMLLBSKPyyL"
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

--=-V6UIdoLb9tMLLBSKPyyL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 10 ao=C3=BBt 2026 =C3=A0 11:22 -0400, Detlev Casanova a =C3=A9crit=
=C2=A0:
> A left-over from the iommu restore mecanism was forgotten.
> As need_reset is never set to true, the if has no use.
>=20
> The actual restore function is called above it vase the IRQ isn't in a

Tell me what you wanted to say instead if "it vase the IRQ", or define the =
verb
"to vase"?

> success status.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Duresne <nicolas.dufresne@collabora.com>

--=-V6UIdoLb9tMLLBSKPyyL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav8zcAAKCRDZQZRRKWBy
9FkTAP4t0zz/QIqw8O9VGTFTciZv8LQgBYP0Ptnu7sIg/btKQAEAuGbMsnVBoii7
IwuNwpYNoEWl5izIjIGttWzlVY4oqgk=
=HPL9
-----END PGP SIGNATURE-----

--=-V6UIdoLb9tMLLBSKPyyL--
