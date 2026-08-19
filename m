Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E368D476CF7;
	Wed, 19 Aug 2026 15:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151942; cv=none; b=jfC2uS2gy8F6TMToExpPWEN3ATd+rwxSR9zhjd4NuHNLFG9JoNSvjicmrCRGBb+w12oNld2zWCaXvuXINH81PCgkLeH8tO6l7+dAl5AAHAECY20jut6BBLxP9CvpDD4JMOkWraTRUdqO6JHExqmKpOojYmVrd3tdUW20k0TgocY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151942; c=relaxed/simple;
	bh=ZOI+W6oA/uAi32MTH/0/AbBQ8UTI/tV8YYpxIRduY98=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qPtD4ELgI3CEkGqz1fRlfOdCHM6bIot5mqK7BX9DXJ8wj+E3Gy/D2m4zAnbif6Ctj2yk1ptwOzwqmBBkErYEYK/PqLFxHFIFWzxqowqk4AP+kRZtef9pHa0XQIXO/DDriu9g86pEv4THMDJa0OhtEE5a+4QK58knlgfhKAwFmLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ooh4O4nn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ooh4O4nn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787151939;
	bh=ZOI+W6oA/uAi32MTH/0/AbBQ8UTI/tV8YYpxIRduY98=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ooh4O4nnoS1GXQvarlxiNA7WIlnZgxkLdtnUfrl+ZIw4UZy8ON2JPAULUqn6glymV
	 TEYU4unh5Cc2IMADNY237oj8DvJF9Hf4tCTVa7vxKQfRINYeqorsHt6krRZH9EU6Fm
	 s6lHo8w0qteJ9R6d/YaycRc85DID+Z0N/SR23csjhtyO0HfJBKnSpHSKYDjNM5a5LZ
	 7iszudSMqSvCpRuNpe/leqIEAWFrE/hdO0T0/MuOWy5zh7GlklDoPoHMWTwm0WXpPY
	 dqkivmrgfcqdmQm4DZ8GhHEtvT4otsHUivKlsBJisFoGpuB5MVHt3le6zX6bL2X8eF
	 Ie3SXFdLuyg8A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E329617E0824;
	Wed, 19 Aug 2026 17:05:36 +0200 (CEST)
Message-ID: <ea57db621f1267c1cd3079cebed543180d82ed95.camel@collabora.com>
Subject: Re: [PATCH 1/7] media: verisilicon: Fix the cleanup when a codec
 ->run() fails
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Ezequiel Garcia	 <ezequiel@vanguardiasur.com.ar>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,  Hans Verkuil
 <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lucas Sinn	 <lucas.sinn@wolfvision.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Date: Wed, 19 Aug 2026 11:05:35 -0400
In-Reply-To: <20260819-rk3588-jpegdec-v1-1-33d74cdf369c@pengutronix.de>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
	 <20260819-rk3588-jpegdec-v1-1-33d74cdf369c@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-jClPjoRyYChhJM6d5vWN"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-jClPjoRyYChhJM6d5vWN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sascha,

Le mercredi 19 ao=C3=BBt 2026 =C3=A0 12:37 +0200, Sascha Hauer a =C3=A9crit=
=C2=A0:
> =C2=A0	ret =3D start_prepare_run(ctx, &decode_params);
> =C2=A0	if (ret) {
> -		hantro_end_prepare_run(ctx);
> +		hantro_end_prepare_run(ctx, ret);

Since its already in an if (ret) branch, and for code readability, can you =
use
hantro_abort_prepare_run(ctx) instead and leave all other sucessful calls a=
s-is.

Nicolas

--=-jClPjoRyYChhJM6d5vWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaoXGPwAKCRDZQZRRKWBy
9J96AP4pVbuljONCTasFDnqGz3LRJHuAwLr5VErmMrO2wrsqrwEAzhFgMDQ9TSeS
/dfy+t87UYjwpZwgjpWq+Cp2ewMU1wo=
=KCQs
-----END PGP SIGNATURE-----

--=-jClPjoRyYChhJM6d5vWN--
