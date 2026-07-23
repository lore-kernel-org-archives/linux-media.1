Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0737445D1B7
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 16:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784824822; cv=none; b=TJFKg+D48cl2HX/+/NUVYXlo7wAE3Q/JfS4TwHWiXkycU5NUcP9t7Q5in6+iuxkXFLnG8GbLTIXEfNVvWKVwmeiZIPLIv7MwS8CKR7kJpNTcJjPBI1NukIDg3hHoAdDi013ZRinTqQkaxB9pJZ9+/eJ5k73UNEKGjLDB3kmFO8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784824822; c=relaxed/simple;
	bh=5EveNS8ryz0nTRmfUab1loZHbqnAaH6DfQqCSNVysRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbRA+yaXL6SnbXNgv5uwXAWa2VBgYxpIVl5QCROeL5j8bLMimbAXZXLk6pB1bCCzV+dHyu0M/0xqy4qNDTw6PV5mI8ggk7Msq5IVVV8zi1TH403wuPzkNma9MYt3fNZK8qcbltUlu1k0pbjSFp5ce+/seWrV/DwLuWvyPxtiEM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQgSf6Yo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQgSf6Yo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D441F000E9;
	Thu, 23 Jul 2026 16:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784824820;
	bh=9ri58NmNBOr7vFiF18aJfzGGVB0ZPfEIIyFgzuBcFSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lQgSf6YocJ9Yaehij2/HqvZhbGKmssBQIctFEGj6CandJ1Bp55EWC2Z1CPaBZ2h7Z
	 K3Vu+ER+Rz/59WbEOx3Iawzb9X9HhI/i15uXlhqGFJC+UIPrxHwb3QEwbjxNWyZdox
	 beli34Q8idBZ6ph1DI+N+inv63EMnVEmyxW7dG8hYXeeu3aPxVj+Gvd6GXoIHtI5cr
	 tbx3Ocj3C6/r+FMXj4htvK4TQ5p3WtOhLOAHCOiZSu+91m838YTqyUxCp4Bd6SWWfP
	 W4ldzh3IUUy5PY+WxEIPpcB/UX/zruuzR2mcP3dHCgbYj8W8dpRYU0aa84DThimrly
	 TCTBTBbR7E47A==
Date: Thu, 23 Jul 2026 17:39:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Theodore Tso <tytso@mit.edu>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
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
Message-ID: <87a82e2b-b0e1-49ab-ac61-a1061c305a5e@sirena.org.uk>
References: <aliMsSH373RJ31Mq@zed>
 <aloZ9hqSgzN3beqH@mit.edu>
 <20260717152559.2d2bfc8d@localhost>
 <20260720095537.4d5d503b@robin>
 <ce1df91e-0674-4861-90ff-bcaf5428b414@sirena.org.uk>
 <20260720142432.288b0433@robin>
 <c349b75c-556b-4f70-a243-f44fc04a0684@sirena.org.uk>
 <20260721151517.42674981@gandalf.local.home>
 <b68a3c0a-6894-4f51-ac98-a28912ee2c82@sirena.org.uk>
 <amD6YEiOp7KkSMzu@mit.edu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nIejWiArf4WUOI5W"
Content-Disposition: inline
In-Reply-To: <amD6YEiOp7KkSMzu@mit.edu>
X-Cookie: (null cookie


--nIejWiArf4WUOI5W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 22, 2026 at 01:33:31PM -0400, Theodore Tso wrote:
> On Wed, Jul 22, 2026 at 03:51:41PM -0500, Mark Brown wrote:

> > There's a whole range of things we could mean when we talk about AI
> > reviewing things - are we expecting the contributor to deal with some
> > specific tool, will other people happen to use LLMs (with or without
> > disclosure that they're doing so)?

> I assume that we're talking about the case where the contributor is
> given an AI generated review.  (e.g., an e-mail from Sashiko).  The

I wouldn't assume that TBH.

> complaints here have fallen into two categories (1) sometimes the
> reviews contain false positives, and (2) the fact that an AI bot is
> criticizing a submitter code, even if it is true, somehow demeans the
> humanity of the patch submitter.

...

> In case (2), I don't have a lot of sympathy, especially if the
> solution is demanding that the maintainer rephrase the Sashiko report
> so it's coming from a human being instead of an AI bot.

I think the issue people had there was more that when the reports are
spurious and generally low quality having to continually respond to
whatever is being thrown out before anyone will even consider looking at
your stuff doesn't exactly feel great.  This seems to affect different
areas of the code to different degrees, some things the various bots
seem to struggle with more.  The nondeterminalistic aspect of things
doesn't help either.

--nIejWiArf4WUOI5W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpiQ9QACgkQJNaLcl1U
h9D1CAf/dEgh6bkx7ksqibcqh0+47rvJkwQ9FNUhD8Noh80zU2D1CdCMpz9UOiLE
QqdJQaQo9jEFRK8CMGI+rS5oXSNkoEqzGCVxpRsNMPvi6R0GSppjBVvJBU1iyZmo
WVbglKn6wuP+wUKd7UCKDKZx/UQeUimbi3NGE0R6PLY8bzCzumDT/0efGaz3oy88
1RmKKU1iKY75fr1JOTBEwpjGN6V4O+iV7ceuePW+pmDjBwSZrB6GTXR1sus4uB1t
RyrIADNUkWK7J1gJKAOWZEPGKJduTMIfGz9PtX4CN/E4AnnJO8LsySHQrSiDR1M5
v3D50G/TAxE/Zf6pOA+ULH4lSMeqbg==
=GgJy
-----END PGP SIGNATURE-----

--nIejWiArf4WUOI5W--
