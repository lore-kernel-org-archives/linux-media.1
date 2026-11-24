Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526153;
	b=J7k81rX+jOKbFUASA6O1CBWjNq55vEH8aqBBOqPFcmsZBgBsdkj5zV0lBHGHeYl5snlR
	 goK+mYZz4HDL+3IdXGnZj+L+/yKuimmUzWMIX4qbz5iciRrmQ3x6m/4Sg4YUhLTMq+uhZ
	 l+kF/rVZuYMM/6Ak3J9Q8xZ0xCcghdG7L1DTW0Fscv1kt/8HKK0Us5nvxELb924/YyHPg
	 y0s2lUON/2oaV0AUtnQMi5q2K16BICAmYNcLls6HCfTeadlH9QhF8IbKC5p7MwPWNT8dC
	 QCN9nrdZfneGWxildCBrUnMwvTLeuTZS8vLjPBHY/nUQy3ZaCkRJtJx0nhCdfrn5CCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=tuT74cz72c8LGaZEf/EXNbRDOp5lSq9neVcNGUi1Xnk=;
	b=UL0L539Du9z1VQi5+qfrSK4WcJXZKy6NO3RSzx8iXZ293190ne4dgGzFVAq5eVyJJO+l
	 b8mZOdF99uP8QTcJGrirlwoyyVrzCarAYYxWn+fiDWybePjjCpb7Tti+WXsiyyqDepzxE
	 lqNBa/JkkoQxJnQ2gJL4FQzknh0ZnKlQjXBZhRaLO8OokICU9ybNzoFZCpCBwx1mRZ2MF
	 BhOY7Enc+VIJiQjtmKUz+HFrPWGAqnDRtWkq+uAedP7R3ZzoJaCTwTFDx5VCZLTLZ/E9x
	 HgIMbSLP5PIwMaU5dvgBGH0lj5NExMwXqwiTwW9LyS9RAeXZ+LBF+QR9H8S4k6u+hRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BTqIpOd6;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD101606A32A
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 13:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD101606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BTqIpOd6
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso31994845e9.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 05:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795526151; x=1796130951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tuT74cz72c8LGaZEf/EXNbRDOp5lSq9neVcNGUi1Xnk=;
        b=BTqIpOd68pWLD8LXUCoXpoi8tAzUUHdzQ6p6HHGgKtUp+FvnFlJeMGSW0XRLwsf0Fz
         OIVl33otepuQlzg28evxJncHfTam2yM6YZROtH0g6GCtb31Gpc9Z/NmZeUpeuMAZB+dZ
         6rApZ2nTPaBXez6jMsQ2LG9OPsYyRlisvaCdDYLJCl4rBp3iMsZsQzH8rufJF6mFqwt1
         LPjrWRigDHVlOK/12/Up94tsCBIXqbf24jGghoYEvjEx8aCTK9Ix7WZNtTZ/ubpJzLUx
         PZho9OeZ6wzfJiG9qmpqapzpW914BhoadgV2uhGMP08ovGtNtZmbX59yxHu7kGf631iY
         3W3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526151; x=1796130951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tuT74cz72c8LGaZEf/EXNbRDOp5lSq9neVcNGUi1Xnk=;
        b=I6TXkQcwWh/HG3w/EES9bPdk7jhCMGS50+q8iuioyGdAK/TeOumGUEc5cYHU+Svk76
         TD1VIZWqwZmtCN12R1xEhEUDKpqAS20rXwVe9ThWX5YbKWO8eRC4SVsarI2ghLSsXnSQ
         GxA7W4AwwEZMEZrqYt4JZtqoGX37lpK5mFv9maRtHazgN6a+BvT1n13ZawRQyaP3FL+M
         48UcGerALvJ+XWSQn1CyLhsJC2k9YIiVUihp9o9yqsrOE3+Sx4qBeDgrj36I2qffr5un
         7QFRra73UYTJOcxLXNjAD2qUyzJDtckXm+B1QIZIMBYkAx91+Ed9OOz3e1W+D8zfavme
         qcEQ==
X-Gm-Message-State: APuU4Z/6FJ+tXz4RWeX0pKaLpdYTHeYAds5gngGYU8eQjJZDExGAfeyR
	y2Js0rHcg4cPFtQKl5pgWx6PKfMzhRt9WCp19Z+Wga9cCc6fVco7pTENSIbjNRB2fSI=
X-Gm-Gg: AZFdTZddB/Yrlg8DyczKKrZHp5D3xpcYE65o+S9PVO+vkVgXSKFu5M80xxib0R2Cyay
	zxVnacwar/EcyR3SJrmoitjw9c6PNLclkyyN4ucjjW8V3HSfmC64K9wwMTxAO7TogseQqegQHsZ
	WNvP3HJm8/UIGnjbovp6OwpZxvUFCQN+BoZ86GKIYXO9x+rDD1bigCO5yJYyPWvN/P1+VBWD5Fn
	ys+rSh9kEcS6Szaf3er+tjvexU79iotn3TwSfICQ6KdvSlbkIqsSxo8kiaNKoIganXVfhVSIS3Y
	lE3SA5NKhV423F/ipRPxplVXh2yWa7NqvWlEG2EAPSjnANBv9COJszlYGGPhuxuQILqCUwOSTfb
	PsQPgjDZHDmLaxThUMYm6XyPra6W2U1kwRFI86yz2f9Csf+QNjcw1jSpTjSx/4VMQzDRwCI3RKL
	6ot7XBf0C9oL01EQQSKZEoX1l4ppcf6UeUtBW/fnq3Kht7/y885msnwq51wlT5fWB8z1bwrtH9g
	59um+7hC4QmIoTsrz+5OfbPJ5/SmF8JRxZSQdSSr25Swqan2W3EwzdNiy8BJfPX5Klv64KSL5rF
	cJRGYX05Q+IJv5WE4zqmJIj1GmonhoViCk03LZULZeEZw+zcubIG8XD6b4Z3Lz7WHNNKJ01Ktgv
	ic6YfeOi/AoCirZrO1dNJB9Vlmt3g5rOf8NyYtBc=
X-Received: by 2002:a05:600c:4f0d:b0:4bb:5c97:f4b1 with SMTP id 5b1f17b1804b1-4bb8881941bmr337984875e9.24.1795526151031;
        Tue, 24 Nov 2026 05:15:51 -0800 (PST)
Received: from localhost (p200300f65f19a9047f1ca7b446868308.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7f1c:a7b4:4686:8308])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884b39b6sm396762345e9.12.2026.11.24.05.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:15:50 -0800 (PST)
Date: Tue, 24 Nov 2026 14:15:48 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Charvi Mehta <charvi.mehta@arm.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Rathinavel Sankaralingam <rath.sankaralingam@arm.com>, 
	Shobhit Pandey <shobhit.pandey@arm.com>
Subject: Re: [RFC PATCH 02/28] media: mali-vpu: add Mali VPU platform driver
Message-ID: <awWFan4TZChEmL4G@monoceros>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-3-charvi.mehta@arm.com>
 <awAzFsX_VUbzTqK4@monoceros>
 <fdabdd57-74f7-4be5-93a8-a6955d205791@arm.com>
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
	protocol="application/pgp-signature"; boundary="kbfofxqjlphqnytx"
Content-Disposition: inline
In-Reply-To: <fdabdd57-74f7-4be5-93a8-a6955d205791@arm.com>


--kbfofxqjlphqnytx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 02/28] media: mali-vpu: add Mali VPU platform driver
MIME-Version: 1.0

On Tue, Nov 24, 2026 at 10:17:51AM +0000, Charvi Mehta wrote:
>=20
> On 11/20/26 11:48, Uwe Kleine-K=C3=B6nig wrote:
> > > +#include <linux/bitfield.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/device.h>
> > > +#include <linux/err.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/io.h>
> > > +#include <linux/mod_devicetable.h>
> > Please don't include <linux/mod_devicetable.h>.
> >=20
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > <linux/platform_device.h> already provides of_device_id, so
> > <linux/mod_devicetable.h> can just be dropped.
> Thanks, I=E2=80=99ll drop the redundant include.
>=20
>=20
> > > [...]
> > > +static const struct of_device_id mali_vpu_dt_match[] =3D {
> > > +	{
> > > +		.compatible =3D "arm,mali-v76",
> > > +		.data =3D &mali_vpu_v76_variant,
> > > +	},
> > > +	{},
> > s/{},/{ }/
> I=E2=80=99ll add the space, keeping the trailing comma for consistency wi=
th the
> other initializers in the driver.

Which driver? With your full series applied this is the only list
terminator below drivers/media/platform/arm. Note this is
different from

static struct platform_driver mali_vpu_driver =3D {
        .probe =3D mali_vpu_probe,
        .remove =3D mali_vpu_remove,
        .driver =3D {
                .name =3D MALI_VPU_DRV_NAME,
                .of_match_table =3D mali_vpu_dt_match,
        },
};

where the trailing , is right. My request to drop it only applies to
arrays where the empty initializer signals the array's end.

I don't find that documented in the coding style description, but with
next-20261123 checked out:

	$ git ls-files drivers | xargs -n 1 perl -g -n -e 'print "$1\n" if m/devic=
e_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*(?:\s\/\*[^*]*\*\/)=
?},?))/' | sort | uniq -c
	      1 	}
	      1 {
	      6 {  }
	   1957 { }
	    405 { },
	    490 {}
	    576 {},
	      1 { /* end */},
	      2 { /* sentinel */}
	      1 { /* sentinel */},

So arrays of type \*device_id[] typically end with the terminator having
no trailing comma. (But honestly I'm surprised about nearly 1000
trailing commas, I would have expected that to be much less common, and
drivers/media/platform even has more terminators with a trailing comma
than without. I'm embarrassed.)

Best regards
Uwe

--kbfofxqjlphqnytx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsFjgEACgkQj4D7WH0S
/k6mJwf9Ecz2SoCd8AmGmyq3W20lpLfNrHtMVzKLZ73vPVXUSeTOE9anlo/n5gwT
dkGiZeqHTi1VF+KBdtQnFvvcYsPujwiRAP5NPZfFoTlK6ozq7QAKFGuP68S3ABgX
oYIAu4FksdXvbvN62qVP5eb54vzthaRYiZ4oY31gHG00KwCLt+ul//+RB1Lj4rwY
I5fWK6hOQlER4U34qBHtTXc95xIicyybp8EQFn8C6oTwU53NJ2kf6cMxUR7ylqK7
VlrK2w6e9ol+WQrQiRHNVflApysdbORy94EnF9msQh8X2ECL4VQHSeEl2+u+eyey
zlAZgbX/HBZqGSqmU+XsLIuD23GGXw==
=vPI4
-----END PGP SIGNATURE-----

--kbfofxqjlphqnytx--
