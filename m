Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793673053;
	b=BnwVw1EZn7z2t1n0WwKAZridoRJFHUD6JUy7+24bNw7pswLjTCIH73TwxL4vSeG+iQGq
	 V0TX4mjWDkaLj9p+Wt0ajDyKk17EMvi88XMBt+tvf0hmikmOcixuPjcpEUfUuM2mGnaNf
	 8nimsqNW/VshfWKuj8/6OI6MiWkv/BxSieSAiBOqC2uLxEtGF2nQMHcon5V1Rk0yifjqf
	 DXmJTg1h7hgrEjb4e/0kzu6DFpY13jHVTl7qcXUtFF36YQliQiV6GjA12dH1EeQdGnni5
	 LLX+dFdQukW0vQETkNZxCJO20ZSPSawoy6NXUZXP2HVzKSw3pGzMrcfg5OQcmEbv62Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=7H7f2+sbvco+m727gcYXPh56BlLVYSp/7lO7c/5FC7c=;
	b=YbcQIOoiXCby978evqcQVuz7/VvcQJKoPveeJzCX4Awy04ys8MqW1eReYIPCHU7QDyPf
	 dMUbGVSDVBVqir1x+TUM4/xo0U9KVbSveI7srdshPvg7svCVCdTWtOfjNcSnT6sP/hvy+
	 6QSsAw8HjrEsoZ4DoDHhnMPvvB/am6b4lRijqf9B2K7d3Yq85xOnNFJ6Unr6Joec8bsXi
	 7//l/aqZ3AtAhIAkZKlHZfwAj2mNs5210YAddY6A5RE1QBjx9a8eBZ0OLsU0I2Nga8v7H
	 9ycmKlnJ4d9aqEfq3bEqmJ5P4St/BQuA5iA9tAqUVQhD5STm5/B587yxh6N9g3gxAMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qxWI18yA;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F409F606A326
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 02:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F409F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qxWI18yA
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e6eb77f0bso358746685a.3
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 18:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793673052; x=1794277852; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7H7f2+sbvco+m727gcYXPh56BlLVYSp/7lO7c/5FC7c=;
        b=qxWI18yAQF/7ypbC/cjrf7UhPNBt5hiGjrXaKC07xrDOTAGD+oNMaPO9o1FiV2cGHt
         lhvtLYIfIcNwql6S5LAgOvCAWS0ZRBu709hwdzHogI6+KpUyDGFOQDhZfjYR1487GunG
         rNNvIgRw2MAVZss29ozZDUTqwoClA3QJuQEr3tpFoQzyOc9S9p9IqnvZunmlJBEuKXIq
         7e44cd94OrEEoI5pVUXZhBNRzsHP9Wm27/NtoydkEbCsvQ35nMPicwQ46Jwci5If6wMW
         Jcy6T5XQx4t3ZM9oWsU6UoSskWMhmRbLBLFKJ8Qqwnn9Y4ly1NUbSTd9XhVcofs8Gf/K
         z6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673052; x=1794277852;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7H7f2+sbvco+m727gcYXPh56BlLVYSp/7lO7c/5FC7c=;
        b=Q5MraLbThGM91vsawFoqiopQAI3s561+4ETCBaLdyLU89u9xNGaC0yhUAMydbDjQEj
         PxojHVcBwDlN39Lm9TGxXaCaBPHaS9ZRniyGRhP7sW2ebqLY/Jh1CBqXa0wTLkWc5mSL
         vcL6Y6pn7P+2Ui3sq8O93aco+0Mp8G0RtAVs/aTkAZr/mBdr4kA22c1mmpmDKaqvaYXl
         sbFOuSRRhilx/P5jm4v8RuiSmEIS1bj4XYoLideuf2JwYrKPUwRxBhk+GglmSwk23hlo
         W9juac5olGfEI+dY1GNzsuEP0CoCxFUYFiUOUrCCFbYEVNY+7qae16Mwl2uGN93e6OQ2
         bonA==
X-Gm-Message-State: AFq9FYLux8d26OUDU6ru97h9oOKrgEXTdz+yW8hD+0T6aQBv7TNu5vfG
	+W+i34o9bLFg+oCelW9FyxbodafeFkClDFyLGj6RU95n0COmf/fQ7kjAChIZggyKx/KA/cGGec/
	CYVyF
X-Gm-Gg: AYBFou2hS4zae66XVx3hRYBZmbtZxJbQ/NLh2fHQjfnUyQddSb3B3NkbFZBVjH5pYsX
	nTaPuPKoCeWpCRQRTX1eYN0/fj9iqCl3wa/rqqJe6HwAwEBWXeAMMT9OXqbg4WV3E9LFBiiod+j
	C7X77bTFJ7C4JxNYlr0QdzC4UtR+lkJaP1B91EJDNJqqzhOmBl60WHZdHeZJhZf/Oi0mAB63Oar
	Y4H9bEl3r+l1k5mUDIEVyY1mLDvXxcvYbw1+9HcazEdLBLGkmerJ5CaRmqMKhHUTEQOg3WOpUDq
	6mpLOqAOEnBGWAJQv047kkCAtaJu7PpDOicIkuPtFAzTrBx1m4u692eIJ189ow5WXaOfle0GraQ
	USfeOtmqpd/t1kLJCBt1+qsWOz47l8YVsDPKoBfx5KcSm0V5EfRzxk1X7gz+rQjVYhXTSa7t4HD
	lWNSCGC8ZxmDryRP3KR6HCMPVnwxARHYCIlITHHYAYE+B6OXxJ2VodKDaZYcLfZvGse8/1Lepxp
	mYZc7qABfSLXZHB1/Cmafji6gg+p7UXkHvZCVpPsfJeNMn2YsDEqc2QX1rm/Ko29OTEmu9/Cdcd
	zjMN+4JWqoqfEJWHi5Xxze4AIQD3NQ4GgdlQAlUWZ+uuaHTx15QADt4=
X-Received: by 2002:a05:620a:84c4:b0:93f:211b:a88 with SMTP id af79cd13be357-94421712a75mr1959639885a.14.1793673051964;
        Mon, 02 Nov 2026 18:30:51 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425ae7f53sm964496885a.41.2026.11.02.18.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:30:51 -0800 (PST)
Message-ID: <69827153a6b0f3b863ebd764645efe0dc2fda6b9.camel@ndufresne.ca>
Subject: Re: [PATCH v2 1/3] media: v4l2-common: add V4L2_PIX_FMT_Y10 to
 v4l2_format_info
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Quentin Schulz <foss+kernel@0leil.net>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, Michael
 Riesch	 <michael.riesch@collabora.com>, Heiko Stuebner <heiko@sntech.de>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
Date: Mon, 02 Nov 2026 21:30:49 -0500
In-Reply-To: <20261102-v4l-y8-y10-csi-vicap-v2-1-0a4149d96dae@cherry.de>
References: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
	 <20261102-v4l-y8-y10-csi-vicap-v2-1-0a4149d96dae@cherry.de>
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
	protocol="application/pgp-signature"; boundary="=-PyPL7slarfAow59TTGqi"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-PyPL7slarfAow59TTGqi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 novembre 2026 =C3=A0 21:22 +0100, Quentin Schulz a =C3=A9crit=
=C2=A0:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> Add Y10 format to the v4l2_format_info table.
>=20
> Co-developed-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-PyPL7slarfAow59TTGqi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaulHWQAKCRDZQZRRKWBy
9PIyAQCt+smxAv2SEhjb0K1aod+ajV5VdSqoZA6d/mIWZv+ihQD/UjLohcJqLbkz
k6t3aQWhYB2RTbM8wRfVMsnXdYFJ5QM=
=W+rh
-----END PGP SIGNATURE-----

--=-PyPL7slarfAow59TTGqi--
