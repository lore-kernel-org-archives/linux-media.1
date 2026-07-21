Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6EC30EF9A
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 16:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784652178; cv=none; b=nRMGdaZ4w49zvT/u4S4iENliq2csAvUCvMDiG5wUMIoV8RmGMIMIm8jXPtcmwuQTj116uwef4+XXgPo+TNs+E6odF/PYl55JLgzBd5QdLryTgnxXeTWbl/oKHC6e37e3qsKQf+A8b7GZRj7Vv2bilPVXv1urq9LZM03nFJI10yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784652178; c=relaxed/simple;
	bh=KjdXtd/Zs+SkNHMfNofagHHEOCx2dD0+Hqs6TDg//zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTEMX28hGo/VFVy8ROfAXLT/6If34H5nGydhTxrg6A6DuW83Y/ucHck2jj3OGwi1Yi8EGMBIesQg7ncHSEdMX7zyUvdqZkgX+mEtqNdY/zUeALE7frHjsTRdVbCQZE+Slfx9AG//0QCh+CV7AcaH19m6cGpUNspkNUELsl9pHAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNVN/EoM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNVN/EoM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B941F000E9;
	Tue, 21 Jul 2026 16:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784652176;
	bh=KjdXtd/Zs+SkNHMfNofagHHEOCx2dD0+Hqs6TDg//zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kNVN/EoMnOImLi9/Q6OaHj3T2r/GWolygGnU0vBxSsVL0tsNVEswZyhUcTd2EZFhi
	 gLS4LwqWU63FMx9imzvjet6YSj1XTqFDd7bJM5M9JzqJw5obaAv1Ke8GOZQRBkba0F
	 F6CyJleqtRhmSz65D0hn1/zvMlVWkdhsZztRzNBCXWVtIdShoAoVm3Jn3Qy/FCcqlb
	 bHdl7bbjBe0eSLk6b2Rdw9FdDKsiJhcdsPMB0M/Gd7Bg6kqjKaRZ/KxBQsUUPQRRkP
	 TN8m2ZO1S5xnf6i2DtVl4MfaYJ0OvbAP/MWt1Ii8h0jtGqS99U2GgKRw1S34lfpQNr
	 m2YecBU2zq2QQ==
Date: Tue, 21 Jul 2026 17:42:51 +0100
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
Message-ID: <c349b75c-556b-4f70-a243-f44fc04a0684@sirena.org.uk>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
 <alc3gAJfAkG5DULJ@zed>
 <alfBvhZkAelq5RVf@mit.edu>
 <aliMsSH373RJ31Mq@zed>
 <aloZ9hqSgzN3beqH@mit.edu>
 <20260717152559.2d2bfc8d@localhost>
 <20260720095537.4d5d503b@robin>
 <ce1df91e-0674-4861-90ff-bcaf5428b414@sirena.org.uk>
 <20260720142432.288b0433@robin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kki+qrRqVKpM8z4f"
Content-Disposition: inline
In-Reply-To: <20260720142432.288b0433@robin>
X-Cookie: Love America -- or give it back.


--kki+qrRqVKpM8z4f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 02:24:32PM -0400, Steven Rostedt wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > > Do we need to add an flag to the MAINTAINERS file that states which
> > > sub-systems uses AI? =20

> > That's probably too complicated - some poeple will want submitters to do
> > things like ask submitters to address Sashiko reviews before the
> > maintainers will look at it, other subsystems might make use of Sashiko
> > reviews or whatever but not make it a requirement for submitters to do
> > so.

> Is it too complicated? Do you mean it's too complicated if one
> sub-system says "resolve all Sashiko feedback you receive" and another
> is "You may ignore it"?

I mean that "use AI" covers a huge spectrum of things, Sashiko and
potential requirements for submitters to interact with it is just one
example of LLM usage.

> We probably don't want maintainers to require resolving all Sashiko
> reviews, but at least respond to them. Where "I don't know" and "I
> think this review is wrong" are legitimate responses. It is basically
> saying "I want to speak to a person" when drudging through the phone
> automated AI teleprompters.

People were complaining very strongly about such requirements elsewhere
in this thread, especially given it's propensity for warning about
preexisting issues.

--kki+qrRqVKpM8z4f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfoYoACgkQJNaLcl1U
h9AoLAf6Al8F5zXWfBnxj9ky52ow9UX+edVTXdRJRptX9E6S0yj/2ac20Ns5mtdI
Vx6KKGfmJqpcs2XWc4vOh2dnWeTg/v1IsIc5qZcbNkj05BFi1loAUenjzTGXKr2O
kxp8J4zA1QMEtu9tA6v1v6vFV9u8BCS1Snl5gUib5YOrtYAUIyi83ILAswArf+MA
qs2VSO0aUJLcDtSehabSAkI9Bp4NzO/9L6bFu4kLO9Py4QYziXdiLEkZiD96dO/a
+9JXdKF78AizaDRZUo4VR2ups9qHIxEJ3zcgeO1UQT7g+Y2E2E3IkriYswu/WrVh
SCbtvMPlN1j493V1qdpj/oo28bG62g==
=EoFJ
-----END PGP SIGNATURE-----

--kki+qrRqVKpM8z4f--
