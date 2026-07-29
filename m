Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E233347988B
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 12:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328010; cv=none; b=Q7SL7+6OnWYJjUxOzjG7cMwmhVJEE3DyYh2fXT5vvW6UTviy89OSRzh/gw8DUANrQDE8YfrEanHp+xaPLS8mSGWjoRDjBb27hdoHknQvRS6Y1+fDH1BwTiR+1FLVT6n3o6waxTuUDGsYnRC+8xK6Osv1LhklAy/jq7hjqF5RlpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328010; c=relaxed/simple;
	bh=f1xeqPiSrp+Rr279usC4DFjydi12CsZMSl/yUPUxvQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4b0c2ZWDBaJLgO5QQG2u4BQRTq+xUHrDBWBQqlmzjXJu22SY1OWjUumaNN0sPfSPTHlA0TSiskQJoWs4rmvcCGPqwqixPwdTA+tyjpGOxTAIN1Co6+BgFDYaxi8Q5rRmkaykYUEYWkrCquD3X+MyeE7iHtQ1W34uiKLcpC+FO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RuMA/NlO; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RuMA/NlO"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-471eeac43bfso813134f8f.3
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 05:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785328007; x=1785932807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MaGA+jE8kdEUP/ki7Zibkhj5Jo7NHbafW4OgbnCW7us=;
        b=RuMA/NlOb0cXdFcx7GxnoTg2CvpoAJPahbyQeEorsG6/VtCNJ6s0ZD6myohOwCVncl
         mrcsxbYzNLmK8ZDC1ITBFVa3yHgxZwVywC7nkWkIPqUd9+E0PqVGYrbhbEMObT/FLqrE
         0JX1iwwwSWO/EojlBOm792z20g+mpIB/Ze0Q76OXR9FMIDQFL8Oi+cMg1lgsSG6vZDME
         CU1wkb8nwzhsbOjyUMwT7QbyJkdKylVC7/rgawOEkk439kTwyDu7YQoCHradOqtipfil
         rDYNJQy8Tw8lUR5dydhKcJdL4jx11dXpcx+2DiDVMr9a5MzRXl7pwFY/jax26gV5ucIn
         9qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328007; x=1785932807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MaGA+jE8kdEUP/ki7Zibkhj5Jo7NHbafW4OgbnCW7us=;
        b=Hj0baJOxTMoPuNbz2dagt5kz+xGTPmzEnpZUvuRaw550xNCNn6uLqFRlFVA15RFpU4
         y6H3jqYD83bPQaulW24AwNKdRArxZfSydDJDqDZ8FrySbHE1bXGyDPF9jQTl7D2Gibnc
         BXnvfrpCcbc4LE2mh2OJP6LygIFVJaHGHJfAjWChRz/gzdHLq1UTCHwAF3pon9ew9A6V
         UIK0XLgIknuZEZE2ji+4XZ1UeU0gMcdNRxNq3CIXRBkZLqrnXD1YNJY1yKocZD3faUNw
         7hPJMB70hBNK/wyw8bS1br1+818ez4llCE1m5PenMgufAbPXNOYvs1O0NqsCwxdewZGR
         fRBw==
X-Forwarded-Encrypted: i=1; AHgh+RpHKcAljZ4n6Fk2cHzw8rII/LGEjdnftVSfeRYWfcVQ/oPNQcO7k3OubwrwKyFBT1OFKCkU1RGuRlLydw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9N7RZiLMx96LRiyP/1NShNxn7iedM9Eh9YEOZIuhpr3WN/EsX
	qkkvCh6nZTb3C/pA3LzMZukHmDegwPyDAyp5Hcby7QXdArqKDnEb4N3UiFZ3/LvE4og=
X-Gm-Gg: AR+sD111aC2uls0ng6wgSP0zLyvR+M6IZ7j60xdyXpIqYA7VEvRXJyOEscEPdnqqZnk
	nBlLC8jA21K6tCl4q9/cMEQPbVV3OogVRh92NMEOcQpZApVCt0GUvVFaUM5sXFF3yqXoFoUboGZ
	RwBRE2d7FyLEy/NYiU6/1Mi/5cSqd+VYtfCZJ9e4cyC+U4LG7DqJi+1hwWGOs2dt988VBPUpnyG
	I8bHtft88oZM0ESouAv+tMwPhQIBrdNDHioSum52gjfRGhX3O+cluCIr6lvCjN1zj5AIe93qCla
	NSXpemkerDmPWBKDLrft2A2Brvk9zY3MF6jMrMbdK+W1TL0x/8v9tb1B39cxGUUv5yDJsB84H0s
	iNPsqs1xsw9/jc5IWo5xEldC2c02ro5XzZAGo5J8CwIsQFusc4OJBvMFj4HiYaH5KBAzU/Gpc9m
	oo+oZqpdCei0ixoPhDtXcTuKXqqvOSw43Wvh8CBcNRHKe2jEgIwDu9Vnr1f/b7nzIdIQKsZYduz
	dwqWoUgu9WsiAO+PMQ8beTbOZhPzIxUkRdJNjSxq0OHicDEtZg=
X-Received: by 2002:a05:6000:420a:b0:47f:7346:89df with SMTP id ffacd0b85a97d-47fb1ed82dfmr7309279f8f.24.1785328006747;
        Wed, 29 Jul 2026 05:26:46 -0700 (PDT)
Received: from localhost (p200300f65f47db0401da7fd03a16a046.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1da:7fd0:3a16:a046])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fb6aa394bsm7223845f8f.3.2026.07.29.05.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:26:45 -0700 (PDT)
Date: Wed, 29 Jul 2026 14:26:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: [PATCH v4 14/17] media: em28xx: Add include for struct
 usb_device_id
Message-ID: <amnxROxWbigw_i7S@monoceros>
References: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
 <e72de5b4b9f1aa77a3c19a5e698a195dfd81ae0b.1782808461.git.u.kleine-koenig@baylibre.com>
 <68d1c273-bbca-49cc-a7f2-7fd6e868fbf4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ftdoiam56l7uqpjy"
Content-Disposition: inline
In-Reply-To: <68d1c273-bbca-49cc-a7f2-7fd6e868fbf4@kernel.org>


--ftdoiam56l7uqpjy
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 14/17] media: em28xx: Add include for struct
 usb_device_id
MIME-Version: 1.0

Hello,

On Mon, Jul 27, 2026 at 12:14:51PM +0200, Hans Verkuil wrote:
> On 30/06/2026 11:24, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > Traditionally <linux/mod_devicetable.h> was a header defining a plethora
> > of structs, among them struct usb_device_id. This was split now with the
> > objective that only the relevant bits are included.
> >=20
> > Currently <linux/mod_devicetable.h> is transitively included in
> > drivers/media/usb/em28xx/em28xx.h via:
> >=20
> > 	drivers/media/usb/em28xx/em28xx.h ->
> > 	<linux/i2c.h> ->
> > 	<linux/acpi.h> ->
> > 	<linux/device.h> ->
> > 	<linux/device/driver.h> ->
> > 	<linux/mod_devicetable.h
> >=20
> > To keep struct usb_device_id available once <linux/device/driver.h>
> > stops including <linux/mod_devicetable.h>, include it the header
> > providing that struct explictly.
> >=20
> > Acked-by: Danilo Krummrich <dakr@kernel.org>
> > Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > Link: https://patch.msgid.link/b859817d9f6ec7450302a231e093a5ad5852cb91=
=2E1782682124.git.ukleinek@kernel.org
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
>=20
> Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Note you're late to the party. This patch already became commit
c19f08f796cb ("media: em28xx: Add include for struct usb_device_id") and
is part of v7.2-rc2.

Best regards
Uwe

--ftdoiam56l7uqpjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpp8YAACgkQj4D7WH0S
/k4f9wf/R+9fqRYwzLJxLAcYWyOPLtgppccbE0SAa6G3ubLnlhF//Kc939iAa+Hk
3mrxyhJev37lJ5YCMmxs1pWazLG2jhGK624NC0VRdKN4NE3M72SEFzhiq3EXQfav
Qafv0Y7ne57ehIPokORapgv+CCQ10LIotIwqjKzfMHoAUaPxagsuDW8WF1kmgqf5
73ravfx6oL/TXx+sSTNjUfx5MKygafje/mkO4sDHmnnAbcJHme/blsxZvZXS8mJ6
Gh5F2r7JaxEXioRl6BbrCMzRZ/XvsMc2EkDRuZtJlhP3EcBjPx8gAXvmOUVS4f5b
OnWfol8NMgCjseFVER/mdwmU2jYcfA==
=PUla
-----END PGP SIGNATURE-----

--ftdoiam56l7uqpjy--
