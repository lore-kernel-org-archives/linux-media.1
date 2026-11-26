Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795731077;
	b=1N1kwOOd/3KCADvehtFUZGPh3VWIw+C6FAzi8pv+1JoCht1mjYL5oh2OBlMLwt39/Xo1
	 lyoq/G43P/K0EENoHctuDS/RujqqO8Y1AyQL12G2UbD7Iy2sVz0BZrSFjy3hkc8hx/jK5
	 Zz7bsaoadHbM4icgRzt5jIACW5yrtgHKVX9Ku3LeaEXm0TnM19nr1WaCwDx6di6ixQf7k
	 7rSrfEtNuFD9LYjgCocEakR9geIE2jL1Y2IRqj5hGc3TQ5HzO4SILrkmWAxcYxRW/J6OR
	 wnjJrAM3Df74LeAAmoaQzARCDQWA62cRqRkIx+/YyVzEXh+HLGlLEI5YXoy+hYzVtPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795731077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=EBJHUco/hzG0Sju8J8Gd4qY5V0VOeKsMcHwF08fQyis=;
	b=OwhYVSV0OTgKiveYW2epH4KOF1irl2FpRY4RGxvQeNwrsAJaJ/RhZ6TIKC+ug7+W3x+p
	 KZJJiVY1dLlBQ+g6wTw9AarXQBaqqx+011XUyZPri1Z6dFPCZRMFJ4iuMviDUnxzn4JQO
	 HABYePKF+IKtDUhpd3153RXGtKGS0r46hJVRl1uZWorMd5KEVkxf3La3zFzMXeS/8E0rb
	 gsu2vhy7Qmk78SjXY+L+GjypNXuIK+qLgRcQQm1oDMFn2oCbjKIr7Ydchxt85MYwKsj+L
	 xk/YqkT3dYT3yK7TNRqukO0QnFuZocoPa/KtRNZZFTF3rVHmU2eNGHI+OFLESB5mSHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K4P0sV8o;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DFC606A32A
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 22:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26DFC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K4P0sV8o
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9495e8ae23aso609605685a.2
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 14:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795731076; x=1796335876; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EBJHUco/hzG0Sju8J8Gd4qY5V0VOeKsMcHwF08fQyis=;
        b=K4P0sV8oBUN1OFFzIPzXx/xgERW0VP6DhJf5sKWY44lG7EQAHJ9qJbf2ooJlb3eIjd
         rdgM7ThXyX6p4Eyz+vf6nCL4fXqXhEjzyVXUP2GCuyraTnu9TV7PZncrs2fbMRvBNZE2
         0opeX4MjYwds8ARwXT4Z73tO8cKEfglFh/+evyj6552eO2xS0Ub3fAiHyC7ICpP5KwZm
         OTvyAYtKilWlZ5Kwy4ilsR4BHXfnP1FehQiNfLwIAf9aD3nAxu5NQSo6hRk21HKlToGu
         ZgyG3MVcI4SueOB5jXtePjBcs5CMmlMDcu84Tjhl25y5zS5ncfemajvMOociU9yLADU+
         9Mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795731076; x=1796335876;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBJHUco/hzG0Sju8J8Gd4qY5V0VOeKsMcHwF08fQyis=;
        b=BjA3rPQgxGUFoeRL6kwO6eEyG05qneP4ECLKewA7B6fOc/4zjZSSuh0yOW4NzJ+LMw
         GaZgaXqUoTlmTEjsF+yDF/PC9P9w0Z9gMkLgly79Rxn76OS41+L1er+AcEe+S29hEY1d
         NmqadijKZLwTgg/lUa4FxJLSZL4+CvmTbp1PAWXmNJ2r8tEmXUoOEy36EQRPcyCCAvFU
         75/BIKWAFDD0EYKL4A3toOoIFclmWS/cDUnCEqe6FYEENByoW/vXHJ+PYH3HwvpHTsqS
         /syu4dUALt8T123e6TkHG1ExA3sI+o8aN/VD4cduxPbj2eLkJe+Hoe3px5C8e/dItXFX
         fCSg==
X-Gm-Message-State: APuU4Z/A/TVhl/+xuxmQSX0UVfuin2LCc0HYGzQXXzWETbZxv/OO8WM4
	bWAC2AAOW8TY4QqQc+MUKs1GNy/nRaf3VhJ8hCOpiKI1bbDTXSDW8x/wPdmUXysoSL8=
X-Gm-Gg: AZFdTZdYkklR9pD0DkfRZb3c9IU7VizWkCRlfRlShE6wgfYnDrzwNR0szkLasF6pBKn
	VMesR4Nljmy4F2/vzJEOmkJRp2zO0mqVCZlSU/gF//UhLKqV37Nfn0wgzOLDuiLgkKYrmMOo72c
	KEPcL+eejgR6T9l0In+w0xfH4CO/0UGgwQRI3uxsYVk/HPdnlrkvJs4RpERWB8OfzIcUZjwY4TD
	VAtX54TtgWT6cqaBoV57vpPTQP7DSGtZLC5rFEqB4UflxrOCOyHF/UPS8BCqPk7FjJdp61bKg1n
	5LMIqX9/4RZS7Dfscp5334UxHjVc2MQgBavn3TeMYSkPJgpAd7Ea8zUE9C+PMvgX+vMpRXgLcNL
	g0A40N4LBlbeT5EU07taw98Va86SgyL7NaoajNxW7uhWph4tLHoX2ziGCr9uS4I89sSX0oCGGra
	S8JmasdvpZAHKDogG4FCiE/cpZ0nh4oGgo6xam9kH1ZuUVuqvDOVRxQIvb/uaI2JAotQRZ3DqpU
	FOuJ6RE5gGU9D3NYNKBlJ4oGTDPtn45z7E4LL4KuVA6rQiSFzXRc4bTWm3F9IymispgGs4FUgs4
	nmzMYL2BaZs3tNDoUKbiug1xnvnGE+7nrz3lJkDlKvE0Fdg5vdtCnoM=
X-Received: by 2002:a05:620a:270d:b0:949:3ea1:3021 with SMTP id af79cd13be357-949bab6d711mr3910620985a.68.1795731075981;
        Thu, 26 Nov 2026 14:11:15 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3a646fsm1686563185a.22.2026.11.26.14.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:11:15 -0800 (PST)
Message-ID: <d44dd85413d264b3536dcc2938ce7066a9fa0004.camel@ndufresne.ca>
Subject: Re: [PATCH] media: sti: hva: Remove bogus mutex_unlock() in
 hva_hw_get_ip_version()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>, Jean-Christophe Trotin	
 <jean-christophe.trotin@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 17:11:14 -0500
In-Reply-To: <20261117011400.1667-1-laixiangwu@cmss.chinamobile.com>
References: <20261103013440.1138-1-laixiangwu@cmss.chinamobile.com>
	 <20261117011400.1667-1-laixiangwu@cmss.chinamobile.com>
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
	protocol="application/pgp-signature"; boundary="=-8ZFNuaxoCdWsEFtb942r"
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

--=-8ZFNuaxoCdWsEFtb942r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 17 novembre 2026 =C3=A0 09:13 +0800, Xiangwu Lai a =C3=A9crit=C2=
=A0:
> Hi,
>=20
> gentle ping for:
>=20
>   media: sti: hva: Remove bogus mutex_unlock() in hva_hw_get_ip_version()
>   https://lore.kernel.org/all/20261103013440.1138-1-laixiangwu@cmss.china=
mobile.com/
>=20
> When runtime resume fails, hva_hw_get_ip_version() unlocks
> protect_mutex, but the only caller (hva_hw_probe()) never took that
> lock; the line was copied from the encode path which does run under
> the lock.  The patch removes the bogus unlock.
>=20
> Is there anything blocking this patch, or does it just need more
> time?

I'm trying to figure-out if its even worth the time to keep applying patche=
s, if
there is no ST reply next week, I'll send a patch to remove it, and that sh=
ould
also fix the issue.

Nicolas

>=20
> Best regards,
> Xiangwu Lai
>=20
>=20

--=-8ZFNuaxoCdWsEFtb942r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawiuggAKCRDZQZRRKWBy
9GJKAP40X/F3Jok+Mf+mGyPEt9dc4YPrSePyENDVB5NhmdUlBgD9G+Xkv+NsCBfL
wi/Et2PiHfDw4fFbZgFDQaYC+XR4Vwg=
=Cnt+
-----END PGP SIGNATURE-----

--=-8ZFNuaxoCdWsEFtb942r--
