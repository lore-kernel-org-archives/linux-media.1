Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50314A2E03
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 17:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784137303; cv=none; b=tLZSxcj+q6yq9uI5WZvWp5lrkE1oSia1LebFdCjSQzRejeKDjUwT5iliYiBnpFmyADZ7K6aUZ4WZXEZ09k2Tq1YQIMKhFdvJ2KL6j0iNbwpRMNUaL2Aq3SWK+NsAmSotj5ZA6EewPCTeKARNMrIzkHQPJJqBqqu55wkHbQWf0v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784137303; c=relaxed/simple;
	bh=tFdUKjGALS8xis5uoqyzkaY08dcIfZkRGCkAEU55Qog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dN6ym6Iiu68al7usBEJgdkNIrCAyZSozBXE3oluZfZr3e4XEfNGLJt3lOgtC7G2yPRXO7ZSprQOl7Ke4UC86/ucOvbUPxNGBu/Ca11xG9GlZJ+6G3aRLw5R8t5DchBvPYw9Lot+TAtdMCOcyxx16oatLJZh9hrBm3gsLxpiNGSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aZe2Q1Yq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aZe2Q1Yq"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62F2E104C;
	Wed, 15 Jul 2026 19:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784137244;
	bh=tFdUKjGALS8xis5uoqyzkaY08dcIfZkRGCkAEU55Qog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aZe2Q1YqaieG/FJ5f1Fw0bN2f9P1Es/MGa2ICpeJZ9wX+Q8TEaZ6e9W3P0fN1f2xk
	 tiLG24KSWeFKu5vpriDKQNbfK2qkEKLUtjHTKxunFWPPiq2siRR37yLr1sGrq/si2z
	 wlsx8d7AN+QSXZUyBhOjhMtuy/umcV/MFCOEvdw8=
Date: Wed, 15 Jul 2026 20:41:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Theodore Tso <tytso@mit.edu>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Derek Barbosa <debarbos@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Steven Rostedt <rostedt@goodmis.org>, users@kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260715174138.GI1778116@killaraus.ideasonboard.com>
References: <20260710083845.23c753ca@foz.lan>
 <87wlv2jq4t.fsf@linux.dev>
 <20260713095538.3d5e86f1@foz.lan>
 <20260713094120.GD1127719@killaraus.ideasonboard.com>
 <20260713220427.582b28bf@foz.lan>
 <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <alcBvuIMEGSjAD1R@mit.edu>
 <20260715161111.GC1778116@killaraus.ideasonboard.com>
 <ale45QPntcwA-aLB@mit.edu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ale45QPntcwA-aLB@mit.edu>

On Wed, Jul 15, 2026 at 01:14:57PM -0400, Theodore Tso wrote:
> On Wed, Jul 15, 2026 at 07:11:11PM -0500, Laurent Pinchart wrote:
> > My interpretation (which conveniently matches my opinion) is that
> > developers should not be forced to directly *use* generative AI tools,
> > and should not be forced to *process* unfiltered output of those tools.
> 
> But maintaineres should be forced to process the output of those tools
> because the developers refuses to do that work?

Maintainers (at least some of them) are the ones introducing a change in
the process here. I feel there's some sort of sense of panic among a
part of the kernel maintainers, or maybe such an acute burn out, that it
justifies anyone with different opinions being treated as collateral
damage.

Is there really no acceptable option beside forcing everybody to swallow
the generative AI pill ? No option for people with ethics concern to be
still considered part of the kernel community ? No option but complete
surrender and pledging allegiance ? This is how I increasingly feel
being treated, and I know I'm not alone.

> If someone refuses to
> use the unfiltered otuput of those tools, and their code *is* buggy, I
> may not have time to cater to these people.  In which case, if I see
> that their code is reliably buggy, and they are refusing to look at
> the review from the LLM (or the zero-day kernel bot, or
> checkpatch.pl), I reserve the right to just start ignoring patches
> from those people.

Please, let's stop comparing generative AI with zero-day kernel bot or
checkpatch. That's not a relevant comparison.

> > I don't think I have called for that. What I believe is that triaging
> > LLM reviews should not be forced onto contributors.
> 
> I don't believe that triaging LLM revoews should be forced onto the
> maintainers.  Remember, the contributors outnumber the maintainers, so
> forcing more work on maintainers don't scale.

I see many people claiming that LLMs drastically lower the review
burden. Does it do so only marginally, is effort to triage reviews
higher than the effort to write reviews in the first place ?

There's also an elephant in the room: beside paying for the tokens used
by sashiko, I'm sure Google could also affort funding developers and
maintainers to perform triage. That's a bit of a different question, but
it does feel that two byproducts of sashiko useful for Google are to
trick maintainers into forcing contributors to use generative AI, and to
be seen as helping the community without having to address the core,
long-term issue of underfunded maintainers.

> One of the reasons why
> I was so excited for Sashiko is that it reduced the load on
> maintainers, while improving the quality of patch reviews.
> 
> > Flipping the argument, should contributors be obliged to do extra work
> > that make them feel diminished as a human ? I'm talking here about
> > justifying themselves against LLM arguments that have not been analyzed
> > by a maintainer first.
> 
> Nope; but I don't believe I'm obliged to accept contributions from
> people who feel that way....

You're not obliged to accept contributions from anyone until Linus
forces you. That doesn't mean discriminating contributors based on their
beliefs would be a good idea.

-- 
Regards,

Laurent Pinchart
