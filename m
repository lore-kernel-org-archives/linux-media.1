Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353773EFFD1;
	Thu, 23 Jul 2026 20:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784837955; cv=none; b=SkYsIPamw5SHhvjWTP43T8QrWK6edfixmHxKnYzweLRrY0HPehxah2zi4u4EXUemrJvuAPX+ABobNAfn/LrA1fxavFYHpMjBVWbllsgQ8X1c6sxy/UTbdBoNhFuuGVSTZESWPYKkqxwftvvXqu1FyX+OGDESTsbRNJ1zg/vKA9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784837955; c=relaxed/simple;
	bh=46FWN177CCjlOBe+CD5xXNqVAb5ZdbN00qmRFVOXbnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmGzktfgSI3dL7mr7ueYxjdfDWdj6z55/d2pWHlYXczipOh//BveTiqxoL9CGyhpmIDDZk9bhLWUiqStngvmOrRCibBrUtw0/Lke/li5hXXYBVvOwLgkAPvWId8mCily57mlFlGlwpYoSqKFzurZMrOczMZ1ZK5o0Key3oca68Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E587A3700EC4;
	Thu, 23 Jul 2026 20:18:48 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 283A5B49EA2; Thu, 23 Jul 2026 20:18:47 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id C5575B49E99;
	Thu, 23 Jul 2026 20:18:45 +0000 (UTC)
Date: Thu, 23 Jul 2026 22:18:44 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Jiaxing Hu <gahing@gahingwoo.com>, detlev.casanova@collabora.com,
	mchehab@kernel.org, heiko@sntech.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] media: rockchip: VEPU510 H.264 encoder for RK3576
Message-ID: <amJ3JJjhlBokyzB5@collins>
References: <20260722073417.2064667-1-gahing@gahingwoo.com>
 <082e1141c38205222a91abf13b1a97d9a00e117a.camel@collabora.com>
 <20260723004642.2075233-1-gahing@gahingwoo.com>
 <210b72e32d1bd757a36b2baf532dd9f7d46ca5dc.camel@collabora.com>
 <amJgcHf2vVDb75nR@collins>
 <252d53c9e497530f9416599f9991b02c0c276a1f.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5NbzU9qqaTRP7CtZ"
Content-Disposition: inline
In-Reply-To: <252d53c9e497530f9416599f9991b02c0c276a1f.camel@collabora.com>

--5NbzU9qqaTRP7CtZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Le Thu 23 Jul 26, 15:39, Nicolas Dufresne a =C3=A9crit :
> Hi Paul.
>=20
> Le jeudi 23 juillet 2026 =C3=A0 20:41 +0200, Paul Kocialkowski a =C3=A9cr=
it=C2=A0:
> > In my opinion it would be fine to have two drivers, but it's really up
> > to you. Since you already have a v4l2 base for it, I would encourage you
> > to move it to my proposal, which will probably be finalized in a shorter
> > time frame than the other proposal and lets you reuse the code you've
> > already written. Then you could also add RK3576 support to the drm-ish
> > Vulkan Video proposal without too much work when it is ready, reusing t=
he
> > RK3588 work.
>=20
> My main concern is that once you exposed an API, the transition path is n=
ear
> impossible unless you accept to support both APIs concurrently. So I may =
raise a
> slight objection on the above proposal.

Well there could be a recommended implementation using your design and a
more experimental v4l2 implementation that is discouraged to use but
still available.

But that means another driver to maintain and more long-term involvement
=66rom Jiaxing Hu. I am not sure it is worth it, but I don't think we
should entirely close the door on the idea. I also understand that there
can be a bit of frustration with trashing code and a desire to continue
working on it (especially now that it can benefit from the technical
knowledge acquired from your work). But I'm just speculating here.

Still I would be interested to eventually be able to compare performance
between the two approaches on the same hardware :)

> Once we have the code shared (Detlev is
> working on it), you'll see that Detlev (and Daniel Almeida) implementatio=
n is
> just a step ahead, and adding RK3576 to an RK3588 is just a minor update =
(its
> the same chip, different minor version). On top of which, once the kernel=
 driver
> will have settled, adding more codecs will mostly (or entirely) happen in
> userspace.
>=20
> With no offense, the RFC here requires significant work before it can be
> upstreamed. A lot of the code is hex tables generated from inspecting a r=
unning
> driver. So there is a lot of work to decipher this into clean code.

Yes I'm sure there is still a lot of work to do.

All the best,

Paul

> On that aspect, if you are missing any reference code or technical
> documentation, let us know, though I believe most of this is public infor=
mation
> for this chip.
>=20
> regards,
> Nicolas



--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--5NbzU9qqaTRP7CtZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmpidyQACgkQhP3B6o/u
lQxJyQ//UloJz5n2lXdGyt3Z62A+B4oIbB2DTJ/v3EPlh37fTfmMOnXOR25G/Em+
I/4rc0DjJmSROIwu4b8DnZ5VC3NVG/K1F1+MxV67UXImGveKxrKzzs8CJ5/7GoOB
Gb8Xm6XzGYgsT+gYuNq5pxSIOZkO5RjrXlZdXGY1kkCO+0ht4ZBOZgSHWktIYWva
1wLIDQkt+eHnQ26lVLs1bDFjy8zE3UZXYTC04Qx/P0RNMA59f0iajMuVEOR9smvA
DqDQV7kklKA6wwqXYY4ksgDdIdyYuJVSLrBYMAIuS0CcGQEKkc3nB841bRT2Ow6y
ll8iHyq2ACkhJMZbG5uZ8W4258sLZ7Cp1bCAlK4dWwM9e0CArnqAdP7Y8g1RBfMn
ydWXbCl5wKIr1tQOTXDlu+pH+3k1lXj11FBi8zlB3CqwaFIibx9zTy3gAapzPJX5
ZHLw8t7dcK8xpaHAJXb0iDuffX+iOoa1irhTt9WCgfkZhOaPyh529N9GVHm1l54N
pLWa3cw4IkJ4n2HuKPnzkB/2sJrY/l7cng9yQH7+ls/7Weq5x/R4qMJCKOCu42GX
tpU5Dv13enniO8YpCbm94KetXN1OqLlC259A71vC9MlalzSmyGYr/RL8RICQ0+9O
kHxrS0Syc2qOjAfePLfm2KAMwbvsJ0K8iLN5wvSUa3gLnIkpJSc=
=Nec2
-----END PGP SIGNATURE-----

--5NbzU9qqaTRP7CtZ--
