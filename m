Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499700;
	b=oUIkzLXa8kspyne/ysO7ClzNkz7V7nO0IE/gbquERinkhBst0XBm7CCWR0rOCkax/YtL
	 wzOgkbgE5yHTsMYOxSQ0Ble7T/QRm9+0Q6ifHBFpxvSNN3A21ja6NiHQZwIS3qFkZ1MvZ
	 1GZORAz9HMMddvb16MCgy3wn6Eyl44siqYmlvluYwhahDSq14ZO9rUs6sB8W731xI8guw
	 epw34Y+OlOMOy0A85NzeusDzAu+sqQQqAuB42ROwLBSDcRlU0qpRxbf0rQIPG6qXuoYQt
	 6J1HNG5CFyom0w0KGDVg5/UDcL2ZS2o4mHGSzeMpqRuRuyxIdlQi9Fy3dPPD3ehtHmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Qwdg7e6D/GugfGPnzIBhZP8p82T+k8mFvOy7rhrM3hA=;
	b=QghHOILl9W55P5UbmV+biCH7W6eCXHO1so8bRgBSuLRLk7LzHYyA5kFX3lnAWcdZUmRf
	 0vZ/l1rnHnhc2Nz3MuLi+aIjhl1mC/4YAQzI7GRZKrDjBaM93MVawXstaos/8+tfHPJYt
	 N1/L1WocKXVPi2Dn6yrOa47qrFJBkkKO9gmq8Nj+V5NWDpo2BtI6pfcRJCJmWU/SgZovg
	 1puDNQjXuApW9Yr3/Ax8uwmTxcjE/zXQ2pz2FasxNo3JIbbw6des7vcxrYMjkbQaMmUdb
	 iCdJU0KTLCvfuu3pxrbS5nPEFaVKWpAOltdCRTlv6opaCLBvpUMOOiIwcBTla01IPDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=f18I7bw5;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74258606A31C
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 16:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74258606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=f18I7bw5
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so6256908a12.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 08:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794499699; x=1795104499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qwdg7e6D/GugfGPnzIBhZP8p82T+k8mFvOy7rhrM3hA=;
        b=f18I7bw5oPHnp+35uA+sFvTzXJkMINh+uDUkKTPEPe1ppsp/dyG3Od4qRI86QFRqVg
         tWmHYBqQxO13VqstxJPGXogMd/SzaDjNIlzQQYctPwZkh8bqigBBA1gYsWCtk7WL2OBp
         wby4cvxd4yrhNKZ8zMka94DiCv4wNcEhHKawrYuruMExhzDatV2Hk7fiKTYFc/hVDSjG
         vOGtggdQICRN+YybDZAHzDb9WSSl99LrSxJO2IPt9N+vPWMXTauq6Baz0A80CieIVQNo
         vHCf8MgWUDSSBaAOAVXsBIEMxqQCyYD1Q9+RkFkG22NjgZr3nXth8FwtL4JvkngAqThP
         Mjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499699; x=1795104499;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qwdg7e6D/GugfGPnzIBhZP8p82T+k8mFvOy7rhrM3hA=;
        b=tnnztD92DDdUpl8o2BfOBt0yUUHPmVuNZUiOWvWb365Xc8PPsOzKRO2KeNQVhr7tHm
         5WIQzQC/FWXVILBpOefrLNE5/F7ypzsToqgoo/SbU6R7rANIYRNc7ydxmrFQYHtNrt+8
         Ec+aF+AYB+oSHPMDExHmtpcAB9GVSmrMCut5jNK3253hTB1XxYWu7sknZLmBwPPvOCMi
         FiZKDGOIV0Dw312TlxgwiHKrcOQ7VhYqUkMjKw5jxdIZ1hvJapkBaGj7ar1HEPvniEvy
         SDpkR6snucSgOMSlxta7U3e1Mk9XvqoOHn/kD4ZtxkRDWx8ztW90/qFC7X7IsKujS2/7
         vBaQ==
X-Forwarded-Encrypted: i=1; AL+hErGHR1XEo7apUixZyRE2kIY2JvofNt4MquPbJHBmdnd5OjryhFc66h5BinaC9yjw0H8LzHPQnl0BLvLXkQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z92VjleSWLqRASaSSSEFsREs9afXdGrs2R4WXe0Rah19KhFq+5C
	E8YS3XFMaRPLtB06ImyaQDInlwUbAyfqIa0KMBOCY6rl0N6NwOIjls1J9dJ9CArQ+dk=
X-Gm-Gg: AYBFou2teyxTRkZWyItYSAGeTRemKH0jKu7S6GUA44cvl8JvB3JZ7Yr8KKPsES+1ZPn
	icLD9h0RoHcB3DzSir2KNDHcAcrdjcv5Qj0GJ9UrN2sQBtE/jsl6n2VtKqP+t4/iAMIbviskXcZ
	ukJpRZ7hx628D1aDXHhhLM4hfLoDbw2mabCmmQgy5iN+enq4XZc7AS9J6PRaqlXvpP9GPZneErh
	k0AuLwx4HaTE3YbN3y+tD8Y7Z3WG4HJAmWNoQygj352Xi8CeVdC9oZvw7pfXPbvTZDkSXRcq1wG
	pUMKoojgQuYOR2i7l1G8ulXWKcmNWvW8uIclKtgjOZhu3Tq/oGcvW3a1duIU0M+6HtIt0dF2bYK
	Y7n1Y/wzs4Nk4aXongF9ukd2dOy8vmUZf/R/hpiqeiITtwFcHimrsuiPkSN+hL4hnkVaShw+CaQ
	dpuZUzEr0663KnIMCdp3zogtX5UP8HtI9xZUJ29BhranGIjO+pOBP9M/y/26zhUvndwMNJj//au
	0VbgpHd1hXaBXvDouun1gE3AuTwKpTn6wYAjrtzg4fS9vtnOChoYm4iCrNVBm8+Q+szRBaKrTJ+
	Y5ZEW8vA1uOxnow70C0x75OiYDnbnxH17kDW5CRU1zgWvbA3b4Sf57pLVvVdsRuM9ElFqqmF9p1
	RRhD68rzvObuE0SlO
X-Received: by 2002:a17:906:d542:b0:c48:9228:bdcb with SMTP id a640c23a62f3a-c50668506b4mr524911766b.3.1794499698245;
        Thu, 12 Nov 2026 08:08:18 -0800 (PST)
Received: from localhost (p200300f65f19a9043dac1f1ce30146b0.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3dac:1f1c:e301:46b0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c5f1c1968sm32995f8f.10.2026.11.12.08.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:08:17 -0800 (PST)
Date: Thu, 12 Nov 2026 17:08:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Stefan Richter <stefanr@s5r6.in-berlin.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
	linux-media@vger.kernel.org, linux1394-devel@lists.sourceforge.net
Subject: Re: [PATCH] media: firewire: Drop <linux/mod_devicetable.h> from
 firedtv.h
Message-ID: <avXkO5IO_Vni93PA@monoceros>
References: <20261112101815.2772413-2-u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qrgify6avsbclcuw"
Content-Disposition: inline
In-Reply-To: <20261112101815.2772413-2-u.kleine-koenig@baylibre.com>


--qrgify6avsbclcuw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] media: firewire: Drop <linux/mod_devicetable.h> from
 firedtv.h
MIME-Version: 1.0

On Thu, Nov 12, 2026 at 11:18:15AM +0100, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> This header has 6 consumers:
>=20
> 	x$ git grep firedtv.h

There --^ is a stray x. Iff you like the patch as is otherwise feel free
to drop this when applying. Otherwise I will fix it in the next revision
of this patch.

Best regards
Uwe

--qrgify6avsbclcuw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr15G0ACgkQj4D7WH0S
/k4gMwf9Fop0yrgV3FlM2DiWWWZtUODtvno7iBzUXqqKuXRUQW5N3VHTNa87Z/w0
TiEG/G5r94GhSdUmwQhY09VdeLo4Y0PtBegu5qpAQQBClDuo3HUWqM5h9NgrN/Zj
CZc19aOhQoJl/8CICQypOPJg8O05/ggSzQarkuptLJUwG2cDGGJjSiEsGr8hm6G4
MVIe+pKsSUQaguJWQPopC+vpmcqgUHzqS3Rxt/QnsJSrdpRUv2C3VtH/sj/0vYXE
O33Oz28E4taku9iyLiDi8cseyGJINs/qIPX8XAAP5fUfhfRLyUXqVcD8/jyvyhz6
oYyxXJyeUhNw3uRxHxX8AzyxU9FWVw==
=4uML
-----END PGP SIGNATURE-----

--qrgify6avsbclcuw--
