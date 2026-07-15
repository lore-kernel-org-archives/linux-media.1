Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9C543A7E9
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 12:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119086; cv=none; b=S+CbI5uFmmDQqnIhEp/UN6azxPlBNTh53KbSgHA1jEAYFufc7ztQo2GpC/CEdPN8Gaib9PzcazpDSkzOQV2XFBTg14yEzughmy5gqgiN+5f3cgkP9q03SUNhNyQfQAN6x47UYMrD75s1+baqVA9AFtglNXVy3KS4tYWWiUUn0AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119086; c=relaxed/simple;
	bh=I8HBkrk9Ez1tf/lodK/6tNTn8RI9kVeAss/gNHWzBFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVADKcG6pF1RDmBwvPEFVtTYgmIUuH017UYJkX620bStczoDrqGmgCvZ140IIccAfFaTsFxCLbbf1UvI7vkgndPWjqejoFGWtf46ZL7L6QYX0kpuWjM4OWVubGb4E8zGsP9OfgjSj75DmTsyulmoEFnvfDLI2EvCFc1+i4KFp20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGllelGS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGllelGS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298941F000E9;
	Wed, 15 Jul 2026 12:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784119085;
	bh=VcRRidfkcKcQT4SpLm4n3cJNgI0aR6B2X+/sgyU+/CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nGllelGSocAnHIH/oaFQWQWJhchd7xFvUY41rbgWUZUJi4LY6aKe8HzfrWQyt9maE
	 ngLfRM5Hg0HXhmo6KSd19uB3vfcZkt9oZ6uCs8P62YcLeIt3kXEKItd13yjbGZP6Pt
	 vKNH0OzULrHx1Ut27Bm316imH8RPbTSs2DB1ssoHS4axTaeBluJyMv5huh1dasJpPE
	 DrB6UYii2ik5140yH3gk2sc8l4ZQ7wTGENhVE/IYbw431uaERGz5DQCQg8sUE9m28M
	 2JRMY/dNYTIZTMrx5G81w3Ux6TFky5d+5zH4MxPdDvlTsgdXUmqY0j5p9ADBPFwX9S
	 LCqzFMITdDkzg==
Date: Wed, 15 Jul 2026 13:38:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Derek Barbosa <debarbos@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Steven Rostedt <rostedt@goodmis.org>, users@kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <c6a17fee-3a36-4037-bf64-cf2d7c6639d3@sirena.org.uk>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BS4HSWwuYeJmnGeQ"
Content-Disposition: inline
In-Reply-To: <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
X-Cookie: "Speed is subsittute fo accurancy."


--BS4HSWwuYeJmnGeQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 07:00:54PM -0700, Roman Gushchin wrote:

> > I expect maintainers who want to act on sashiko reviews to triage and
> > verify them first before bothering authors, yes. I believe we should
> > follow the first two recommendations of the Software Freedom Conservancy
> > on using LLM-backed generative AI systems for FOSS contributions ([1]).

> > [1] https://sfconservancy.org/llm-gen-ai/llm-backed-generative-ai-recom=
mendations.html

> I think it makes the point of sashiko - helping maintainers - unachievabl=
e. If the point to not use
> LLMs in general, let=E2=80=99s discuss this, not how to make each use cas=
e more complex.

IME flagging areas of the code for consideration is much more reliably
useful than the specific content of what's generated - it helps with
finding areas to focus on, even if the text has all the problems LLM
generated stuff tends to have.  Those pointers can make things a lot
faster when you're reviewing. =20

There's a real risk that submitters looking at stuff directly will go
off in the wrong direction if they're not familiar with the area and
trust the output too much, I'm fairly sure I'm seeing the results of
that in a similar fashion to the thing you often see with people sending
patches to mindlessly squash things like uninitialised variable
warnings.

> It seems like [1]  expresses a very anti-LLM position in general, which I=
 can understand and I agree=20
> with some of concerns. But I think it=E2=80=99s up to project leaders to =
decide if Linux in general  takes this=20
> position and my take so far is that the answer is not.

Probably worth pointing out that the SFC has come in for a *huge* amount
of criticism for how pro AI people have found the above set of
recommendations to be.

--BS4HSWwuYeJmnGeQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXfycACgkQJNaLcl1U
h9DdEAf/SVvCNvFjLnV7wX+dEipdQKVkgD5Ora/ukLpiunpbWjfeZWFVGliBXt9z
y7syFYfBllIyo6Ds5EhXdHJSVpzjVEWbSE43f7S999lx86qtIOvCvugU60/Nyh6+
P9cMDQt3ngrUKdUi3uhk53BuCDk0aLtdIsGTVOpAcBZwQSbqDdgasw/Em9/zir7Z
z4ush0Z4BkJ7CMP6JIiTQoMSh3wvpImRt4ksjPo7lTjNgZ1ZtQQXX22aQX4rrsXW
XvFjp/zgomacvnZm7LpV+V9WG7+8hQYPd0aEA0237eHyMWGuTLCqe47tpL2eeOUm
65jyoApOvluIsFWObGd8uWn4n/BtFQ==
=EkwJ
-----END PGP SIGNATURE-----

--BS4HSWwuYeJmnGeQ--
