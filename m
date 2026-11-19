Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119056;
	b=x7Eyhhl8j6DRLAdIlQP9Fu94x25Cb4E/M21O3bUZr5OA1TeigLjvQRVKho1VviASKiFj
	 knUUCE8KAgeDv18KcB0fD5CODOnHg+d+A3jakYacuSv8n7qzqNz1HduQUe0kWyfwfgzMT
	 e3Uk2ZlWpOmRjEjJEizsxqdckEhxOCc/W8LX13al0QFKzQQ9ZP9tQYuMuxGTigoxR9khR
	 /gxdS9Zmx3Xp3mqBRplrSckgpmht0vQv9bzQvbJhk8HtQ1Yr1JMsW0cde/ZE/a07TQZS4
	 aI8MmU4MBmVJar8nmVbK0tqipwMZZ3174m214oQ1yprbOXCvNBKMOLiFO99fQHuc5Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=8aqv+DwVQzSb2PSvDQkheb2OINfUMuqmq/Dn5ckO2bU=;
	b=iE0+D2mlUPV/Bp5Zt7GNK7ZzSI1hGp0LxUdLvaM++WTt30kQGhZp/VjWlldpZ0NsFNEH
	 61VhSzkbR/W0XvvBrdqR3P7XsesEPqwSdZt/maH1AfDQQOLVwcY+JMthAC9onDn3EjW+n
	 gt/+fQsezPMUaGZb+UQnaSE/rVMXvnbIVwNBHAGzKRZXSRotCV98UvQGw+CASqkkbMW+E
	 H1VqdwtAyY+1uzdhNwsZLdBFdAftRxdVPJJbBJPbKJooFaCPkHQ+oY5GhRJ6bA8GJzSvu
	 GXEV5DZw4fcoukOPr2Ik9MZm04XcsIeOOolR3hqLplMKl4IVYtBGy4c5B8kxkgEfudA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hyGQcQ+k;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81292606A324
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 20:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81292606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hyGQcQ+k
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-94937a33cfbso18777185a.0
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 12:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795119054; x=1795723854; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8aqv+DwVQzSb2PSvDQkheb2OINfUMuqmq/Dn5ckO2bU=;
        b=hyGQcQ+keDK2b+poWfXaBz3rTfz1FyheOYiUzJEERYAMhFZyAu6PuvsqtyX6pjeesS
         RPo/zf+sr9tDJlWK7LXyI/JwnAF7qkNwpYO+juoobzUbk0BUFczoNvQWEGADycDW2iwF
         y7jXJjMSOIhu/MUmTcjReZe3qIh+eFzLgqwR6LVOhkzMf0koL12QfW68TIcDa6ESyTAX
         A9hpOxUza4P7LOMWuFbIYg7gicCapbN+ffcwUDGx9yF0j4jjlLHoiZI6aajcrdXNLT9q
         oyXtSD7jOBruYl34nyNNIo/0UAbvOlzJE8VI6uN8Ph4wXC/te+u0l1swEJRdwwPBFBRP
         Hcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795119054; x=1795723854;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aqv+DwVQzSb2PSvDQkheb2OINfUMuqmq/Dn5ckO2bU=;
        b=IUYdJ2oYBV2yP2zxNV5zauMyfXJN8oTRjwQFpohcLlMMB8DpEtctcwvN1idPzsuDYp
         pby+W4cblHwp18tUP4leAd802e4V9G/MDWU1hh+bTyEGqBXVsGAxjXfDJXFN6Q7KtAyq
         6NJzEHj9+c5DIlmhNnX0l6c3Wk1UDgoBmTt0NjMbMbG4wc6NGylJJtL1xS7b6lP/Hibb
         I4Pxg3jJdObLo+bRxe9lLZ3w58+6XvPNM5TFyqXXLScrgpw1UdVelBSvroqc+c4CwKb+
         LY+sLoBdMQ6xENkBxbX+pKIq+oqtTgjbS100MzyK3JImMQhLwOykED4mqmz6zbbZAglQ
         FxpQ==
X-Forwarded-Encrypted: i=1; AL+hErF1hkLs5XVNXPGu/PGpRFGnKVg/Hh5QwOQ57fBnfAz3h3kHknKsrQY6nYVpargTiLPxkjBsu6WJ5aWpzg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8cjIsoXULyQSwrWY7l/Z+CrMD1lEbBY8F1QsQ7xevUOdXkrJWf
	+6hUmVX8OCsZlAKEVXN2QGPwCnHjhvn2AR6Xh9mflK+X3qfocFkn6es0unz3fyXzfk4=
X-Gm-Gg: AYBFou1Lm2OISKrRuTY7Uavymx57h7Pt5mN4paKvYgzQBZXJPeLsjoIHptgVxhK/478
	Ph8BRNXh8ziZqXrqR3it5TZDTU8+bG5NYqScjCX9gE4xp3g5dd5zxrxpgovaKiH3GTfmmV0rixQ
	pIl3ADGHrZLIC/Z0jz3w/8ONiWALsA+5vhfuWzwqUVDBMNdMXuDoe5A+TaNkfrUxdM1ytMW84mO
	0AnTdX8FR+nBmeiEUD/eE1UrBH4CoFZz+e/DEtFvewLU+kTv2pPP/8xphpSsiZrZD44AMe8pxH+
	bkEOgQ1SWB+gmkRkhZrLR4/pSuNrdU75BrEvkKsWsGGGOKeBiBbDOVUb6taCV+rlPm3NnJUIj/f
	HLplpHrz0p4niThd0m41TgqwgW5Z/ISLAjEKS77dt4RxZJGE4lj4VQoKt/Hwrak3tSQbtJAse/U
	ZmF0b4OM+3rfnKBA/M5M5u/04nFSrVS77fwzjoh1AwrQOzUWZ8AHqiEAT1L8UOo8e9IGknisHz0
	a7+MdjyOoYzfnKwbYDnb8RuI+fEi3jdD5tQ9TZuyt7h/1CjQR75iGsa3cb2oBOkjkQ2XADe+Dx8
	8L/bxv99yCLIN8nv+rSELBmMA9qWK/6RLDW5oSTefX2RDYzeyiVmAgc=
X-Received: by 2002:a05:620a:480e:b0:949:7502:6a5 with SMTP id af79cd13be357-949bab2275emr133918285a.57.1795119054458;
        Thu, 19 Nov 2026 12:10:54 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3ba04bsm37578685a.24.2026.11.19.12.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:10:53 -0800 (PST)
Message-ID: <91e8a132f2ddff24b30c244dff0a8389afa313fa.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 03/28] media: mali-vpu: register V4L2 decoder device
 and add querycap ioctl
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Charvi Mehta <charvi.mehta@arm.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,  Rathinavel Sankaralingam
 <rath.sankaralingam@arm.com>, Shobhit Pandey <shobhit.pandey@arm.com>
Date: Thu, 19 Nov 2026 15:10:51 -0500
In-Reply-To: <20261119153758.1426673-4-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
	 <20261119153758.1426673-4-charvi.mehta@arm.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-68tdt8CJA0v7u8ZWQyHT"
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

--=-68tdt8CJA0v7u8ZWQyHT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 19 novembre 2026 =C3=A0 15:37 +0000, Charvi Mehta a =C3=A9crit=C2=
=A0:
> Register a V4L2 M2M decoder video device for the Mali VPU.
> Add open and release file operations that allocate a per-file session.
>=20
> Implement VIDIOC_QUERYCAP to report the driver and decoder identity.
>=20
> Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
> ---
>  drivers/media/platform/arm/mali-vpu/Kconfig   |  1 +
>  drivers/media/platform/arm/mali-vpu/Makefile  |  3 +-
>  .../platform/arm/mali-vpu/mali-vpu-device.h   | 15 ++++
>  .../platform/arm/mali-vpu/mali-vpu-probe.c    | 59 +++++++++++++-
>  .../platform/arm/mali-vpu/mali-vpu-session.h  | 26 +++++++
>  .../platform/arm/mali-vpu/mali-vpu-vidioc.c   | 78 +++++++++++++++++++
>  .../platform/arm/mali-vpu/mali-vpu-vidioc.h   | 15 ++++

nit: I'd say rename to mali-vpu-v4l2.c to be consistent with nearly all oth=
er
drivers.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-68tdt8CJA0v7u8ZWQyHT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9XywAKCRDZQZRRKWBy
9Gk9AQClEgbrQYsilxSJEOtw7LEwCrwtEVoSpQ1tbx+me1p3KwEA6yr3WzRocwTb
/VnV9DMVgAS6/9EfRVX6UUJhsXdqnAI=
=Gwtb
-----END PGP SIGNATURE-----

--=-68tdt8CJA0v7u8ZWQyHT--
