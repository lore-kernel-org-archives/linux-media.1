Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5449839A806
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 14:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557601; cv=none; b=Dr0L0oDCX5O/MYZB/7Bb+DhUKrC4a72k/gFuO+D7oKKnYLQlTB6EX4VTKf0ZbLZN0f/tMHhN+0UWzhxW2kOtRpeD04rFg4KF6MSumkhfU3OxNtEfveuUgIBDCM6YHIfRhpgowcCiC+3Clo0Bfwea8AT1r4kjdrix8eALKzNSPQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557601; c=relaxed/simple;
	bh=spQSkh+QrD92ygbE74b4O6NuAcu59lrkkkPAA8WOSZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gl1WNqhwJP9l9v307sS9qh1vihcBez6Yt67SL0AeSqMXb/o1U4yOz1jlBM0XsRG4ecRRbAlr/0L5KX4j23Q6wV9bnVhooysYcDYsoDv+X1UeXztDLi+oPPGvK7b+FH9jKfN9MZ/oJjLSHyzNlm02GOASojggtdb6SNLOw+ShK6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PK9jZIci; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PK9jZIci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A68D1F000E9;
	Mon, 20 Jul 2026 14:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784557600;
	bh=spQSkh+QrD92ygbE74b4O6NuAcu59lrkkkPAA8WOSZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PK9jZIci69cUA3J1TWmFFd5dUQhtEkr7FfLSEsUtnL4OqE4s49nlM3pLiGdhMw2Jj
	 WWQJfmvZ4PxvzNEoHe36A9suZ2VPTcme5CH1aVxjxQsivSXqyXoangOnG3pNVkoxsi
	 gxcJMknkPO5YHgfTMu8/8RgpZ2HVrebOXxKtqUDS2hv+nh0NX873ROjG6jJRSAl4yK
	 ++ag6mHzZwuyeWISdUdy+n7hj4ys/HJuS6Ov6+ECblMmSd2To00On9Msn7XtlLYMXA
	 i+VYqmHlJLXEEicdmtrsac79aV/lWDWrY/l8MecrvoxlI91d73OlJ2OZHAq267uzy/
	 XZzsjl5IudpPw==
Date: Mon, 20 Jul 2026 15:26:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Theodore Tso <tytso@mit.edu>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Derek Barbosa <debarbos@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, users@kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <ce1df91e-0674-4861-90ff-bcaf5428b414@sirena.org.uk>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
 <alc3gAJfAkG5DULJ@zed>
 <alfBvhZkAelq5RVf@mit.edu>
 <aliMsSH373RJ31Mq@zed>
 <aloZ9hqSgzN3beqH@mit.edu>
 <20260717152559.2d2bfc8d@localhost>
 <20260720095537.4d5d503b@robin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v6TdgCBrZ9oIfXbr"
Content-Disposition: inline
In-Reply-To: <20260720095537.4d5d503b@robin>
X-Cookie: Caution: Keep out of reach of children.


--v6TdgCBrZ9oIfXbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 20, 2026 at 09:55:37AM -0400, Steven Rostedt wrote:

> designed. But I fortunately know of these areas and can easily see when
> Sashiko falls over it. Hence, these false positives do not waste my
> time as I'm already aware of them. (I do take a deeper look to make
> sure it's not reporting something similar that may truly be a bug).

OTOH I had a submitter up to v14 on a new series over the weekend since
they were iterating Sashiko feedback.

> Do we need to add an flag to the MAINTAINERS file that states which
> sub-systems uses AI?

That's probably too complicated - some poeple will want submitters to do
things like ask submitters to address Sashiko reviews before the
maintainers will look at it, other subsystems might make use of Sashiko
reviews or whatever but not make it a requirement for submitters to do
so.

--v6TdgCBrZ9oIfXbr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeMBoACgkQJNaLcl1U
h9BHwgf9EL99RQ8Xd5lpdhU1Iko4oPfxWIG+LsRBtwRRW5LL66SyyB95llVHPLBa
/8lA/BEQStc+dVt8xVldmMqpuVWM6U6J3hgcRL0ZT4/AkkYLBi+4lfgq46HQ82dY
2gy4BqhZgO90ztFgGoupLCEa4/YeKF11KrY2PUY8ViIB/+ZiCNqAzl3pFg3pKSUd
ERmE5HXhVBnHk/O7f80ipADhGKjhpSyZDddYdilQWaf92UR6rE6z9HdqOstE6Pcw
YdvgRBhNWP6v8VmxAlNdZinzypGm2Bfru7g3KmFstuKcfADBTJkgwjTnOwzyLoH7
A5xrqM7CvehuPQDh4OpCkJlStkKv4w==
=O76p
-----END PGP SIGNATURE-----

--v6TdgCBrZ9oIfXbr--
