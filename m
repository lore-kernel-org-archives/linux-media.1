Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729653;
	b=VO/c2PBvyWzLYSdrRQRDYechP60B2iQh+ZHBBud5Bu3F2mqS+EwDpdB6xHyPojXAU+Su
	 qjeE2NkLqcyaZHUhtpeQTvBi5T91KUdzaT/suqhTRM3dIIIQe216RlNSver+bdnmmVtb8
	 zQg3jeShqMoE21tEUb9929dkY5LCjKMy4BHGbowDuojGv01wjc4CeCaTcVGFbSq2hTwhd
	 qG+jZFdlw+32neePOKmzWCNxcb7hAp0T2rQ0imrAjPiXDQHPI+re4E/jL+oAAtnbkDpdc
	 HFqXNMXl7lW1eqGE5IviBPEDuBc4v/Hqmrd3Gh/wTpctWQuFwB32Hjm/x4NdXiPv3Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=4WhzaWPljb0SrZHlQ+9mxsjwiIar78ZdlRX5uWCA24c=;
	b=F8FyAYXkuewiuhYsBBJsgFrKxdQqKG2oxifivBrC5r05FQlmk7POERHVs/m+Fx3NrVlf
	 GCjWINoihNlwlGWVjeHsjckfMC6mKtAm8Z7eF7cGbr0rFNoqih/ajjNY4LDvokp88E1QB
	 Lcw067DzxbWzG3n4Hsb6SWs5vpL0yfDtt1Nyil5PylAJRdik8Ivd0CtA9VyEC17q3w+CV
	 Eo5Gm6iQMouiK008PUCFx8YJz4Vp/b7e1uoylixZS1Ke8d1t6TMWIg/wSUKLOMsdtcIYr
	 qbEAZ8IbHhVHnhuNo7noSnZEQbAW8ObAbjK0A4j4CLzJU8NHPYsgXZs4An1G1WY6Vog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gfAv9hgm;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8A6606A31E
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 21:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD8A6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gfAv9hgm
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9495f083657so806184085a.0
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 13:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795729647; x=1796334447; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4WhzaWPljb0SrZHlQ+9mxsjwiIar78ZdlRX5uWCA24c=;
        b=gfAv9hgmCUfUhVt9yp1cqZC3M+vVpjuvorFSUJ8lZZK7Yz6RfXYnP0V+3Tnok443+K
         bqPmsTHPQIg7G9Rst9BYY43B9uOOIGtdiRXGOQvNjM4lATa+EX7DhmE7r5a0VwuYRKRJ
         groWQvzoTpcB6PwuAG86bCI9eieAnAN3pxhauqOGR2VOVv5y9W8NqzMX+FGjTXr19KEI
         gAt0batfBCQziImW9g0m1NzpoSWJ1j35W4PBT8pXvwJ4Sgq/fuFZBKqvT2qK2pgxtSUn
         mwuekw1hX67rYb/Snknm/t7SPGami937f7gwI11amehttNorP2u1oHYu+kplgs/qtfTI
         cthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729647; x=1796334447;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WhzaWPljb0SrZHlQ+9mxsjwiIar78ZdlRX5uWCA24c=;
        b=h4SAVzCiC4KfI4FfReWdmKfRJbbBYj6OUpXs5Tmv2/1OeUBiCp3899f9eJh1qV6srH
         U72zSPynH3/oKy4vvx/WpusKB0mKTY0K5tLWhDNKmK671ATagvy0x8E6J+RcPZV3oYNW
         wkzAQDmfTTmM0pClGPbauCDsFfd65uonWclQXptPiq6d0jNMO2QiD/J9JOyjl4CqsNUF
         ncjqPim3bvMWhY6A9n0DnSrvo/uTinMDn/CbmNWonNWZBHDTWpjWWXT4wqUOupf/W4kB
         EaBnfi5C+JyqqJCkFrIOYNBPuWXcict/72ZaGPEewHnCm8LE+S2g5Flpn03a2h72BDPK
         UgFQ==
X-Forwarded-Encrypted: i=1; AL+hErFcXQJ0WPo1nXguInUtMB09beWhSHE2fgDL7eeQ1SmqJnwUjchhW1j6XP/0I1toRvvWiTg6z5ZCJ8X98g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Dbl+qn6DcC0zUPpGMHigiYuIa2ZAEO9jhC+XwPfSLFCtiLxjG
	uhRUTCrbVIMv9FudA5bShiZpzYoZ7Hr95KguCWfhavBHsA2NWr4J15jzzM9Qy5hCQjw=
X-Gm-Gg: AZFdTZfMFJmtk1uMg0O7LL+WLrDCGCKKGUFBdJOWIfDRClclErzcA2fkBDzgC2zVO4M
	L0DyLvsu1fJsiH3xcQQThuMu2d159O9kYp7b14nrXmIjYd8xvznKoBumA2tOO1FippNSvIcDnHn
	GYwgkcfYa6155crTid+/lCrS/RO8UyBhCtTDBbJ4hacFZAojFH/s0165KLbEJ0vS0+8bkVdgU1o
	H56GPP97ZD6BP06GPWZizZyt6Rs7Xw8KsrQ8KIQYius23YCDwA4+KGK3p5C3IQKIQWr0bO+0j+J
	pBz0cQYr21pCj+fYht8XZ/c/3ZsFhuI8+aZICWauxF4PRx/9P5ss6OFaDLv+5GdDVFXEYwfGF2n
	Z3bj66W4HVZ1QZADuctBcDKHk8Vfjwo1i5rQsH/kpCTdILB3sbm8XtwFb9gy6oMHZ1UTHDZvSQU
	NngEAAGGFIi9/xyju8RRW6d5IKSNqtQKb0DWFxa6C1ZhwFg4IfFsaNBB+HnG6zQNRy/EWdg4WaG
	MShXeWLeiQWUe+21LObbyX1NiTVMm0ipNDMOpAn3MW4SXYvgCLANkDrtfXFT2PXEJzS3j2k8+i7
	8oWfGHqwgXq0sUxTfDBnwkIaZ/rA6xnbZ/ALNUVorwAW25E2Q6pcDIxnvvk5trOxsg6buchgjgO
	4
X-Received: by 2002:a05:620a:1a0e:b0:93c:a40d:e3cf with SMTP id af79cd13be357-949ba828099mr4010614885a.1.1795729646763;
        Thu, 26 Nov 2026 13:47:26 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41a341sm1673622885a.37.2026.11.26.13.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:47:26 -0800 (PST)
Message-ID: <efe647d6ebb9583696527ee044093ba54ff0b9a7.camel@ndufresne.ca>
Subject: Re: [PATCH] media: st-delta: fix decoder use-after-free on release
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sicong Huang <congei42@163.com>, linux-media@vger.kernel.org, 
 "hugues.fruchet" <hugues.fruchet@foss.st.com>
Cc: mchehab@kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 16:47:24 -0500
In-Reply-To: <20261028074439.2515928-1-congei42@163.com>
References: <20261028074439.2515928-1-congei42@163.com>
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
	protocol="application/pgp-signature"; boundary="=-ZnfXehKJCjfHNFCFp1+S"
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

--=-ZnfXehKJCjfHNFCFp1+S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 28 octobre 2026 =C3=A0 15:44 +0800, Sicong Huang a =C3=A9crit=
=C2=A0:
> Found by code inspection.

All the changes in this driver since 2022 (and even there I'm not sure) are
"found by code inspection". Is there any users left of this? Shall we just
remove this driver ?

I'll hold on any changes until I ear back from Hugues or someone at ST.

Nicolas

--=-ZnfXehKJCjfHNFCFp1+S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawio7AAKCRDZQZRRKWBy
9GH+AP9Oqg4ss3SaCoTvoVSD5gtzy2jhoZwSztR/b+sN5AhqhQD/U00yLZRBQByA
DzpUMteYjIWOXG0T5S+VF5c1A5P2wQY=
=+D6r
-----END PGP SIGNATURE-----

--=-ZnfXehKJCjfHNFCFp1+S--
