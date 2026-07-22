Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3089D371CE0
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784731908; cv=none; b=MqAa2kjt8fuV2R3UKogRV0evfuS6lQ61DI+Riyp5Lc+AyFllT744HvYk3qU6jWDGTJRD7GonGrDfURFimEwOprbqrC4o8+3j9hD57oQsM81gSjT16XCYqt7bm3MMIZGbH3CtoCcirsCZresNOGxwR3wY2eMkMT+OYa8KrTyXTdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784731908; c=relaxed/simple;
	bh=3RFiJSGQKs0gZkYqlLVATttYTgkVnbNSPDbJBPcj3Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRHhlb00nBBOvtLZQnj4qncrRt2vFlun012PiCvm4sQGh7uwaeroIdEsBmk+4z9VhrL/6Yzw+V0oao5pGw2PuIAJnKTBRUQqJErnBUqF8dRKSnFlnphBtKBrkRefzNhpV7UShx3xHI9mmT0E1+BSvVpfpaNKWogCWVFBVHlXD1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faox863p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faox863p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683301F000E9;
	Wed, 22 Jul 2026 14:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784731906;
	bh=3RFiJSGQKs0gZkYqlLVATttYTgkVnbNSPDbJBPcj3Rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=faox863pK7w/cNdMIBUrnrYeuQ/ZskVTZhfa4yIIwxrPJ65khsuBxSw9HrDCb0OFH
	 ZNeuInxKDCBLVJEAO6YWFoJ/b+4Jg394J74n+SMTV++Ml4LQ0PskRQCweiK9d2wY4G
	 SAF0N0rrvb8dF/JccOSZoGFXTpjJlATbVxbr8SirDNeb6f/t6MJyWQ6t9XB03ix2SB
	 23+J1ZKp4ni8IPbK+kAIpSVsUCrwUGhpZhE5uz5ZbnY81OMcidA+Mc+xiqHahx0H28
	 0iyULxqNy/c+Ynacw5WtW3+WEZRrlj4Jqwf/omBDBU2Akn36MBLvhPmhj9XzJeS4rj
	 xWp+vMM0fE6nw==
Date: Wed, 22 Jul 2026 15:51:41 +0100
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
Message-ID: <b68a3c0a-6894-4f51-ac98-a28912ee2c82@sirena.org.uk>
References: <alc3gAJfAkG5DULJ@zed>
 <alfBvhZkAelq5RVf@mit.edu>
 <aliMsSH373RJ31Mq@zed>
 <aloZ9hqSgzN3beqH@mit.edu>
 <20260717152559.2d2bfc8d@localhost>
 <20260720095537.4d5d503b@robin>
 <ce1df91e-0674-4861-90ff-bcaf5428b414@sirena.org.uk>
 <20260720142432.288b0433@robin>
 <c349b75c-556b-4f70-a243-f44fc04a0684@sirena.org.uk>
 <20260721151517.42674981@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HaOTdzHBXKUXMs/m"
Content-Disposition: inline
In-Reply-To: <20260721151517.42674981@gandalf.local.home>
X-Cookie: Life is like an analogy.


--HaOTdzHBXKUXMs/m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 03:15:17PM -0400, Steven Rostedt wrote:
> Mark Brown <broonie@kernel.org> wrote:
>=20
> > I mean that "use AI" covers a huge spectrum of things, Sashiko and
> > potential requirements for submitters to interact with it is just one
> > example of LLM usage.

> I was thinking of just having two options, each with various levels.
> Option one, if AI is allowed to write algorithms (I mean something that is
> enough to be copyrightable), and option two, if AI will be reviewing the
> code you send. Yeah, the second is for those who are completely anti-AI a=
nd
> want to avoid having any communication with AI. But then again, do we
> really care?

There's a whole range of things we could mean when we talk about AI
reviewing things - are we expecting the contributor to deal with some
specific tool, will other people happen to use LLMs (with or without
disclosure that they're doing so)?

--HaOTdzHBXKUXMs/m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpg2PwACgkQJNaLcl1U
h9C3awf+JSKgeEW6cukecPLmR0DzYSoM/2Dt8T4Y+3Ni9CtE7KepJpV3KHtKUHzd
q6VzK4tGsqQm2xHK483eDQ6vLW+3PInyjdPDnYcWykBALG74J76UF6R7LFRX+zlT
HUJrkjxWzYKfHUsZ4vwfLQN28HARPdKdhOHVqc4AzjYF63V6hZfmJJ6VjDtHhN8q
shrdj4tmBNjS5ErJeXxWxq+jgVCEcEQ+XoVLvG9kAycH5JYxmPeAC/yAI6Q8AEoA
E5Py7Zvn7mz83jUkQCU2T88ZHXkvIyUn75mxYFjV0251/KU45PqYUaHW6ZZeNT+i
vFKPqTHPjk1EJ20Cx2eSrXEFJ+06SA==
=hY9/
-----END PGP SIGNATURE-----

--HaOTdzHBXKUXMs/m--
