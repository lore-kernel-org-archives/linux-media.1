Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DDF3AE6F4
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784131878; cv=none; b=NxmXOnwMgqIGuTR2WIvIn2QhqgrYovUS0wbJQPnFr9DGeSb1nw3/9EnbFkyix4/L4a0ro8eGI2Y5HWUye6ojZYkFDKIpHjvXyCGFXgjBXPgGgf35dTd/UrTdGoFcH7pfpPxxwwxDmbWBACftlLzpgZdpcBN1b8VuRHpMI+3qXJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784131878; c=relaxed/simple;
	bh=Jc5D6erLnoQERsq3iTZLg2xIPpu3AUgQo5/zvRrZFq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnCGoQztbkJh5o7PnXfZXkdJdDaR1zm/800457lYKi2OtOrqsO462r1B2UulL9EaG1++BcHxI5113ZoC+unDPaHddWQH5HzBJs7BG7rQwvUOlCAB6R4i6FmE4w2YhyukT61aRfvemS/W2aOpiHriue1xNG2KOkKUPPeAiDiBgNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZHiGTUzg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZHiGTUzg"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F6D833D;
	Wed, 15 Jul 2026 18:10:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784131818;
	bh=Jc5D6erLnoQERsq3iTZLg2xIPpu3AUgQo5/zvRrZFq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHiGTUzgfbQ2qLm3NjELJv0uiLI+u9y2m/gg88MX/oKIEw/8mgzbxBj6/u/9XR6kh
	 t8Sg5u++Wc2hmE9ssVp/bUligpyUeYHH0xR5NfRQWNQSqM+0CQsu3iA4ujd5vNOr8y
	 mUi+zYJkTgjTYExIgmspUXsApBB9XGzPu9AfZnoE=
Date: Wed, 15 Jul 2026 19:11:11 +0300
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
Message-ID: <20260715161111.GC1778116@killaraus.ideasonboard.com>
References: <akQlPSNfGEllNVhe@debarbos-thinkpadt14gen5.rmtusma.csb>
 <20260710074528.5a6e4457@foz.lan>
 <20260710083845.23c753ca@foz.lan>
 <87wlv2jq4t.fsf@linux.dev>
 <20260713095538.3d5e86f1@foz.lan>
 <20260713094120.GD1127719@killaraus.ideasonboard.com>
 <20260713220427.582b28bf@foz.lan>
 <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <alcBvuIMEGSjAD1R@mit.edu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alcBvuIMEGSjAD1R@mit.edu>

Hi Ted,

On Tue, Jul 14, 2026 at 11:54:43PM -0400, Theodore Tso wrote:
> On Wed, Jul 15, 2026 at 03:59:09AM -0500, Laurent Pinchart wrote:
> > I believe we should
> > follow the first two recommendations of the Software Freedom Conservancy
> > on using LLM-backed generative AI systems for FOSS contributions ([1]).
> > 
> > [1] https://sfconservancy.org/llm-gen-ai/llm-backed-generative-ai-recommendations.html
> 
> It's not clear to me that the SFC document is particularly applicable
> for the use of LLM's beyond the use case of generating code which is
> contributed to FOSS projects.
> 
> Things get a lot more complicated when we're considering the use of
> LLM's to (a) review code, (b) automate the analysis of a bug report or
> stack trace, or (c) automate backporting a patch to LTS kernel.
> 
> Consider the first recommendation, "The FOSS community should support,
> not just tolerate, those who outright reject LLM-gen-AI systems."  If
> someone rejects LLM-gen-AI systems, and the LTS kernel contains
> patches which are automated backported, and they object, are we bound
> to forswear the use of automated backport technologies?

I think this is a bit of an extreme example that does not reflect the
rationale for the SFC recommandations. Note recommendation 3, which
states

"FOSS projects should not shun contributors who choose to use LLM-gen-AI
systems"

I hold personal opinions on what I consider is or isn't ethical in this
context, and I also understand that ethical principles have a personal
dimension. Within the boundaries of the rules of our community, people
should be entitled to have different opinions. I don't think anyone is
seriously trying to *force* the whole kernel community to ban usage of
generative AI (believing in chances of complete success would be a bit
foolish at this time), not even the people having the most extreme moral
compasses pointing towards that direction.

> What if someone reports a bug with a kernel stack trace, and someone
> uses an LLM agent to analyze their bug report and find a fix.  What
> does it mean to "support somone who outright rejects the use of
> LLM-gen-AI systems" in that case?

My interpretation (which conveniently matches my opinion) is that
developers should not be forced to directly *use* generative AI tools,
and should not be forced to *process* unfiltered output of those tools.

What does this translate to in practice ? I will need to sleep over it
for at least a few nights to formulate it clearly. I know that I (along
numerous other people) have strong negative feelings if forced to
justify myself against unchecked output of an LLM-based review bot, or
to review patches where the submitter has clearly not invested
substantial time in making the contributions as good as they can. When
this happens with human reviewers or developers, they lose trust points
and end up being ignored. I don't want to be forced to hold LLMs in
higher regards than that.

If you use generative AI to detect issues, find an actionable comment
after careful verification and tell me why you find it actionable, I
will treat it as a review from Ted Ts'o. I may think your moral compass
isn't tuned as mine, but I can still hold you in high regard despite
differences in opinions. I certainly wouldn't ignore a serious security
issue you would report in that way.

If you start letting obvious false positives through your filter, or
significantly more false positives, then my trust in your reviews and
skills as a maintainer will diminish over time. The same would apply if
you started rambling nonsensically on your own. Occasional mistakes will
likely have little impact as we all make mistakes, especially if you
acknowledged such mistakes.

What this does *not* mean to me is creating an environment where we
pretend those technologies don't exist. The "put your head in the sand"
comment from Linus elsewhere in this thread is a bit of a
mischaracterization. To his defence, discussions on this topic on kernel
mailing lists have been quite heated and prone to mischaracterization.

I have talked with multiple people across the whole spectrum from
neutral to very negative opinions about generative AI. One thing that
struck me is how a large number of those people feel they're not allowed
to express any opinion that is not strongly pro-AI. Maybe listening to
each other could be a good first step towards better understanding. I
hope we as a community share enough common values to consider important
for everybody to feel heard.

On a side note, I have submitted a BoF proposal on this topic for the
OSS Europe conference (quite ironically, in the AI track). The goal is
to give a place for the people who feel the community only listens to
the pro-AI voices and rejects all other opinions. I don't know if it
will be accepted.

> > I expect maintainers who want to act on sashiko reviews to triage and
> > verify them first before bothering authors
> 
> As a maintainer, I don't believe I should be forced to rephrase a
> Sashiko report just because a patch author "outright rejects" LLM's.

I don't think I have called for that. What I believe is that triaging
LLM reviews should not be forced onto contributors.

> For that matter, I don't believe I'm obliged to accept patches from
> someone who forces me to do extra work because they refuse to look at
> Sashiko reviews....

Flipping the argument, should contributors be obliged to do extra work
that make them feel diminished as a human ? I'm talking here about
justifying themselves against LLM arguments that have not been analyzed
by a maintainer first.

> How do we balance the needs and time of maintainers with patch
> authors?  I don't think it's obvious that we *MUST* bend over
> backwards to oblige the needs of all patch authors.

Does the above bring some clarification to this question, or at least
useful examples to continue a constructive discussion ?

-- 
Regards,

Laurent Pinchart
