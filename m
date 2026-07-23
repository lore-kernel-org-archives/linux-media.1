Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76BA3DA7E6;
	Thu, 23 Jul 2026 19:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784835605; cv=none; b=gDT29N0NddldxG2dy+fmoO0Z8sayxMnDByf+D0JHzbfFqBg+r6lLFumc4/Oc3/PP1gf3LJo4ksnOznMPj+vl58DdwaQqUcr+ng0FoMkmX6t0x+UkbJ1cIoxFVp6YTFI8KMDz8j58HJ4HOBUUnWrXDLBLnWvGL7Hox4T11auUWP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784835605; c=relaxed/simple;
	bh=G0M9MI9dB901g7cMmjTeOdPTQ6Gbf1ggOTiUNsSEHfQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dZ9TYiaiZygVJkAsgNzyPKaOq39EBO9aHD5wZmajcThL76CuZTcqQXao9pqTILRqbeyv5w6fwCVcfRTsTtrvHvsLktEogko/aS8jK/sVxFIbTxSqw+HRhnz691I8MEFglvSE1xg8Q+/cSMZU3T6b6wnhAPNiD/Vvn4yJniBkxn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Pfv6T1TP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Pfv6T1TP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784835588;
	bh=G0M9MI9dB901g7cMmjTeOdPTQ6Gbf1ggOTiUNsSEHfQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Pfv6T1TPiUoHMM8XOwWq3m9en+TZtkiHrQ2rbxona1O1sAaw25V90llKOZcuzq3f7
	 j68dTeoDGGFEtv6qdvAFgBM8BhHhUj9xDL2zPqB7HSg2Ia6CpY0HLHMF4OBicd4icm
	 hK7V43P/axbMKKilDlAJ9dsbhUJ00ExG9dxCAtbXATaaalmhzvLEnfbH9qctlVehG7
	 t+rnoePEbI5Z1kquA8jSiue5lGvcaH3uTW8X5ETrVSiwYAYMsDaPyzkgXtEBWe4tDl
	 otZc6woBFcv91VTkf1f1ozczcSAnT6ad3K8p1AiGJYB5U+Q+dyBZFkt/fTbOmp5Ovk
	 Nge3QqZdiDmJQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D36BA17E0A46;
	Thu, 23 Jul 2026 21:39:46 +0200 (CEST)
Message-ID: <252d53c9e497530f9416599f9991b02c0c276a1f.camel@collabora.com>
Subject: Re: [RFC PATCH 0/3] media: rockchip: VEPU510 H.264 encoder for
 RK3576
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Jiaxing Hu <gahing@gahingwoo.com>, detlev.casanova@collabora.com, 
	mchehab@kernel.org, heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ezequiel@vanguardiasur.com.ar,
 linux-media@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 15:39:45 -0400
In-Reply-To: <amJgcHf2vVDb75nR@collins>
References: <20260722073417.2064667-1-gahing@gahingwoo.com>
	 <082e1141c38205222a91abf13b1a97d9a00e117a.camel@collabora.com>
	 <20260723004642.2075233-1-gahing@gahingwoo.com>
	 <210b72e32d1bd757a36b2baf532dd9f7d46ca5dc.camel@collabora.com>
	 <amJgcHf2vVDb75nR@collins>
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
	protocol="application/pgp-signature"; boundary="=-dZVtlSGeZCfvrclufsh3"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-dZVtlSGeZCfvrclufsh3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul.

Le jeudi 23 juillet 2026 =C3=A0 20:41 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> In my opinion it would be fine to have two drivers, but it's really up
> to you. Since you already have a v4l2 base for it, I would encourage you
> to move it to my proposal, which will probably be finalized in a shorter
> time frame than the other proposal and lets you reuse the code you've
> already written. Then you could also add RK3576 support to the drm-ish
> Vulkan Video proposal without too much work when it is ready, reusing the
> RK3588 work.

My main concern is that once you exposed an API, the transition path is nea=
r
impossible unless you accept to support both APIs concurrently. So I may ra=
ise a
slight objection on the above proposal. Once we have the code shared (Detle=
v is
working on it), you'll see that Detlev (and Daniel Almeida) implementation =
is
just a step ahead, and adding RK3576 to an RK3588 is just a minor update (i=
ts
the same chip, different minor version). On top of which, once the kernel d=
river
will have settled, adding more codecs will mostly (or entirely) happen in
userspace.

With no offense, the RFC here requires significant work before it can be
upstreamed. A lot of the code is hex tables generated from inspecting a run=
ning
driver. So there is a lot of work to decipher this into clean code.

On that aspect, if you are missing any reference code or technical
documentation, let us know, though I believe most of this is public informa=
tion
for this chip.

regards,
Nicolas

--=-dZVtlSGeZCfvrclufsh3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCamJuAQAKCRDZQZRRKWBy
9ChrAQDFYy3+9EG1k90i3qFuQHquFaa7OckWKYC1S7LgGkjApAD2KOYjLf8wKd7p
VqiNDw9wJaVm7ANxBYaRrp7s4J2DCw==
=OgIE
-----END PGP SIGNATURE-----

--=-dZVtlSGeZCfvrclufsh3--
