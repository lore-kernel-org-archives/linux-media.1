Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8088348A8A6;
	Thu, 23 Jul 2026 18:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832476; cv=none; b=u+OPGbztokZRpc9oh8KmJK8Sj+FlEYVVO6fFoybQAb2zoxBcS4iwenjIUSogeONPqefoRfuFCfeCT4KZ3JxEFKcA5TSv0Nd9X+GerkttnLO1wFzznxIgg0DjqnXVaJ56TUQbJS2fbIcCw+Nd94WEBEVIf+GZabBzMoVLu90R1Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832476; c=relaxed/simple;
	bh=4QpspjtslJ120+a+n4Oi2dib7YgmsWRuOIYa15ODY2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyJwyYtbRBSjFv7l7HxDucH2sQmtmxiwa62FKFEKelRXSxbf9DrN3nXlnTfFerU4Np0P0MEuJCFbad4X8XJoefjIExHYcFx8eSnpfulPFHPclskDiS8Ugxm/unB6NoC80ggRCVPtb0ho+sAECQ3Iudnw9/1ccMliLksHXjza0Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 1A6DD3700EC3;
	Thu, 23 Jul 2026 18:41:58 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 1EF62B49E0D; Thu, 23 Jul 2026 18:41:55 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 63EE7B49DF6;
	Thu, 23 Jul 2026 18:41:54 +0000 (UTC)
Date: Thu, 23 Jul 2026 20:41:52 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Jiaxing Hu <gahing@gahingwoo.com>, detlev.casanova@collabora.com,
	mchehab@kernel.org, heiko@sntech.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] media: rockchip: VEPU510 H.264 encoder for RK3576
Message-ID: <amJgcHf2vVDb75nR@collins>
References: <20260722073417.2064667-1-gahing@gahingwoo.com>
 <082e1141c38205222a91abf13b1a97d9a00e117a.camel@collabora.com>
 <20260723004642.2075233-1-gahing@gahingwoo.com>
 <210b72e32d1bd757a36b2baf532dd9f7d46ca5dc.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y1RuMRkspY6MNcmg"
Content-Disposition: inline
In-Reply-To: <210b72e32d1bd757a36b2baf532dd9f7d46ca5dc.camel@collabora.com>

--y1RuMRkspY6MNcmg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Thu 23 Jul 26, 12:14, Nicolas Dufresne a =C3=A9crit :
> Le jeudi 23 juillet 2026 =C3=A0 12:46 +1200, Jiaxing Hu a =C3=A9crit=C2=
=A0:
> > I'm not attached to the stateful interface -- I used it to get something
> > running on real silicon, not out of conviction. Before I commit to
> > reworking, I'd like to be sure I understand what "converge" means here,
> > because I see two fairly different directions in the thread: Paul's V4L2
> > stateless H.264 encoder (kernel-side reflist/rbsp/RC core), and the
> > Vulkan-Video split you describe for Detlev (thin kernel module + Mesa
> > userspace). Those differ a lot in kind and in effort. Which is the
> > intended target for the Rockchip encoders, or is that still open? Is
> > there a branch, early code or spec draft I should read beyond Paul's
> > series?

I would recommend taking a look at the slides of the talks I gave at the
Linux Media Summit last year and this year, which should give you more
context and insight about the design choices.

- https://paulk.fr/talks/2025-linux-media-summit/2025-linux-media-summit-v4=
l2-stateless-video-encoding-uapi.pdf
- https://paulk.fr/talks/2026-linux-media-summit/2026-linux-media-summit-v4=
l2-stateless-video-encoding-uapi-progress-update.pdf

Generally speaking the idea of this proposal is to stick with the same
design idea that we had for stateless decoders, including V4L2 M2M queues,
dedicated controls and media requests.

Like Nicolas explained, some hardware can be a good fit for both
approaches. I think we agreed that it wouldn't be a problem to have two
drivers (one v4l2, one drm-ish) for the same hardware, so the question is
really about what you prefer to do and get involved with.

My V4L2-based proposal is already rather usable, although it has not yet
reached its final form. I have a GStreamer implementation ready that has
been used extensively too, but it will also need to be reworked before
it can reach upstream.

The DRM-ish proposal is at an earlier stage and will likely require a
complete redesign of your driver, moving most things in userspace.

> Paul does not have this hardware protection, so I think he needs a higher=
 level
> interface for the driver, and at the point, why not base it on existing k=
ernel
> interface. Though, V4l2 is massively larger (probably around 100x) interf=
ace
> then what we are drafting currently for RKVENC in a drm style driver.
>=20
> The common part is the rate control. Typically, stateful encoder are firm=
ware
> based, and the rate control is in the firmware. We need an in kernel rate
> control for performance reason. The programming latency is going to be to=
o high
> otherwise. The point of convergence, is that we can share helpers for that
> purpose, and Paul's work is really clean, and already in the shape of hel=
pers
> not tied to v4l2.

Well there is some level of dependency to v4l2 in some places, but I'm
sure we can extract relevant parts and make them common so that a drm-ish
subsystem can reuse them easily.

> > Either way the RK3576 hardware enablement and the reference-read fix are
> > shared with RK3588, so I'd much rather contribute the VEPU510 side to a
> > common base than maintain a parallel one -- I'd just like to know which
> > base that is before rebuilding on it.
>=20
> This is our experience with decoder too, its relatively easy to support b=
oth,
> differences being minor. I will ping Detlev today and see if he can help =
here. I
> know in his case he was trying to avoid reconstructed frame compression, =
and it
> only started working when he enable that compression. Though, he had mmu =
faults
> prior to that.

In my opinion it would be fine to have two drivers, but it's really up
to you. Since you already have a v4l2 base for it, I would encourage you
to move it to my proposal, which will probably be finalized in a shorter
time frame than the other proposal and lets you reuse the code you've
already written. Then you could also add RK3576 support to the drm-ish
Vulkan Video proposal without too much work when it is ready, reusing the
RK3588 work.

But again, it's really your decision. And it's hard to say how long
things will take to finalize. But I think it would be beneficial to have
two drivers for this hardware and not trash the work you've done.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--y1RuMRkspY6MNcmg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmpiYHAACgkQhP3B6o/u
lQzhCQ//eEM+ZMphhJvq6bc0sgRl6B9jBmP3PVjzgcuz+TnIhJkSmgtwMxjh8JjT
0xP+8Gut4Mnz59rETlRaCw5Y+xxoh6CNb4v0DtaSt0P5Ljnv/dAPIhGcw9b38gXE
Y4kMug69WWsoi/iG4dZJqhci4u+QFoY3aFTVGxMG0EALywmwpSbKbSl4MPNkjrM/
5EZBicsAyWuxZXjpPVu4m1ULmAd5dwLAD2JUxun58uXFL/lhM0jRQkmJQdjUADTS
GuyLfMqsLHBJSJc4lXnYZaMJKXy59pQUiFaRF7ZT5+s9mP9IT73xY6OCbypvqnJe
mxb24FDHDQklyk3qkOCstplpJMir3tVv0khdWNpnQtRETAXQZUKGUbwjrG0hEr+L
LRdeS5EN/tSiGvIpaafyaflHi/Y7Rynew6/lq+Msb00przHOcZsG5gYhSsmdH9KJ
IzcGYKq+9hU9C8Fpu1aI6nPcry3lqpzBtjYSOyv8A3Vir2vt5fVXiKz+xC+oIf2W
3K+JoMZzw83MV+FqnXw3uSDjtMaOTZ7RcDz2X5RrrtZ/Vit628BXjnSsfRuP0Hds
GXtpAjhl0HuDmGjF/c4ietBePTrsNQSCw76WygulOhY7nQlEr8CsoYkh7SERCrKW
593Hsh9d4t9X+zSfLEj7JQwhMnb4ChtPM7v8Ylg/ZO83PzAefzM=
=25OK
-----END PGP SIGNATURE-----

--y1RuMRkspY6MNcmg--
