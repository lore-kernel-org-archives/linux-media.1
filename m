Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2C84248DF
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 20:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784147294; cv=none; b=gOPQYBCD6LnCAAZ875vDMnhPMmpOBOKzpwHAaMcHIYlD9nBAGSUBFvU18Bx1DGA9cktYcfr0F3BRpX1Mf5++i2pPQjFEpEhQjvoq8qyloiCFSZS6RiZBbaWtnJ+r5mTvV0WamlpFvF6ccspRuPIuqa9CbDMnQ+OmGD5reMQ/wNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784147294; c=relaxed/simple;
	bh=Kq5tPYfbrjLMUYghpb6g04hBzp48ITF+6KcgYhM7cEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpFXlLTmvLEMGRVq5kb9X2kc1v0pN9K/A7jPAlbJhe7emY2+zB2/OMz/v9ulDQ5BTOIbXtMa6uwnXcqtZPHbQd1JS0pkLvugg0bRfagYkypKcrgEV0FVPO+6/uBlr1ivnXauVwcSu7MFPxEWNbeLIVpD5NxUIbPhWxqr8UXfW8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rImLf13z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rImLf13z"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C481B267;
	Wed, 15 Jul 2026 22:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784147235;
	bh=Kq5tPYfbrjLMUYghpb6g04hBzp48ITF+6KcgYhM7cEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rImLf13z7EVf+Py/SzT+A/wAQHDU2i+G8MUrMGFVGO30EqiWU+p2R24qVQDtKNCwm
	 66Odk9gOiXAHLoabsPAK3ceuihddU7FtXr8/D2ggLUKIGXkxO3ZVRqM74PWZWKmstc
	 yjH6VkcJZ4YJ6/TglkRbFEF3FpaeEyteDA6gVkuA=
Date: Wed, 15 Jul 2026 23:28:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jan Kara <jack@suse.cz>
Cc: Theodore Tso <tytso@mit.edu>, Roman Gushchin <roman.gushchin@linux.dev>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Derek Barbosa <debarbos@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Steven Rostedt <rostedt@goodmis.org>, users@kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260715202808.GN1778116@killaraus.ideasonboard.com>
References: <20260710083845.23c753ca@foz.lan>
 <87wlv2jq4t.fsf@linux.dev>
 <20260713095538.3d5e86f1@foz.lan>
 <20260713094120.GD1127719@killaraus.ideasonboard.com>
 <20260713220427.582b28bf@foz.lan>
 <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <alcBvuIMEGSjAD1R@mit.edu>
 <20260715161111.GC1778116@killaraus.ideasonboard.com>
 <j4jhhj6rw6kgem73slctakegtoirqmngbejbabfnfwtyshdlgp@itpaup6ghuod>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <j4jhhj6rw6kgem73slctakegtoirqmngbejbabfnfwtyshdlgp@itpaup6ghuod>

On Wed, Jul 15, 2026 at 07:00:39PM +0200, Jan Kara wrote:
> Hi Laurent!

Hi Jan :-)

> On Wed 15-07-26 19:11:11, Laurent Pinchart wrote:
> > On Tue, Jul 14, 2026 at 11:54:43PM -0400, Theodore Tso wrote:
> > > On Wed, Jul 15, 2026 at 03:59:09AM -0500, Laurent Pinchart wrote:
> > > > I believe we should
> > > > follow the first two recommendations of the Software Freedom Conservancy
> > > > on using LLM-backed generative AI systems for FOSS contributions ([1]).
> > > > 
> > > > [1] https://sfconservancy.org/llm-gen-ai/llm-backed-generative-ai-recommendations.html
> > > 
> > > It's not clear to me that the SFC document is particularly applicable
> > > for the use of LLM's beyond the use case of generating code which is
> > > contributed to FOSS projects.
> > > 
> > > Things get a lot more complicated when we're considering the use of
> > > LLM's to (a) review code, (b) automate the analysis of a bug report or
> > > stack trace, or (c) automate backporting a patch to LTS kernel.
> > > 
> > > Consider the first recommendation, "The FOSS community should support,
> > > not just tolerate, those who outright reject LLM-gen-AI systems."  If
> > > someone rejects LLM-gen-AI systems, and the LTS kernel contains
> > > patches which are automated backported, and they object, are we bound
> > > to forswear the use of automated backport technologies?
> > 
> > I think this is a bit of an extreme example that does not reflect the
> > rationale for the SFC recommandations. Note recommendation 3, which
> > states
> > 
> > "FOSS projects should not shun contributors who choose to use LLM-gen-AI
> > systems"
> > 
> > I hold personal opinions on what I consider is or isn't ethical in this
> > context, and I also understand that ethical principles have a personal
> > dimension. Within the boundaries of the rules of our community, people
> > should be entitled to have different opinions. I don't think anyone is
> > seriously trying to *force* the whole kernel community to ban usage of
> > generative AI (believing in chances of complete success would be a bit
> > foolish at this time), not even the people having the most extreme moral
> > compasses pointing towards that direction.
> > 
> > > What if someone reports a bug with a kernel stack trace, and someone
> > > uses an LLM agent to analyze their bug report and find a fix.  What
> > > does it mean to "support somone who outright rejects the use of
> > > LLM-gen-AI systems" in that case?
> > 
> > My interpretation (which conveniently matches my opinion) is that
> > developers should not be forced to directly *use* generative AI tools,
> > and should not be forced to *process* unfiltered output of those tools.
> > 
> > What does this translate to in practice ? I will need to sleep over it
> > for at least a few nights to formulate it clearly. I know that I (along
> > numerous other people) have strong negative feelings if forced to
> > justify myself against unchecked output of an LLM-based review bot, or
> > to review patches where the submitter has clearly not invested
> > substantial time in making the contributions as good as they can. When
> > this happens with human reviewers or developers, they lose trust points
> > and end up being ignored. I don't want to be forced to hold LLMs in
> > higher regards than that.
> 
> I'm not sure I understand here. Do you say you have moral issues if you
> should read unchecked LLM output? Or is it just that you find noise /
> signal ratio too bad with LLM output so you find it a waste of your time
> (and thus feel badly if you were forced to waste this time)? Or something
> else?

I feel that justifying myself against generative AI hallucinations that
are blindly trusted by maintainers makes me feel diminished as a human.

No later than yesterday a friend of mine pointed me to a mail thread
where sashiko referenced code that has never existed in the kernel, and
the maintainer blindly trusted the comment and asked the patch author to
fix that issue, seemingly doubling down when told the code didn't exist.

Depending on one's beliefs, this can be easy to brush off, but such
incidents can easily make you question your value in a community where
maintainers would by default trust sashiko over an experienced
developer.

> > > > I expect maintainers who want to act on sashiko reviews to triage and
> > > > verify them first before bothering authors
> > > 
> > > As a maintainer, I don't believe I should be forced to rephrase a
> > > Sashiko report just because a patch author "outright rejects" LLM's.
> > 
> > I don't think I have called for that. What I believe is that triaging
> > LLM reviews should not be forced onto contributors.
> 
> Frankly, so far I see the issue with LLM review similarly as a dillema we
> used to have with checkpatch. It was finding some sensible issues but often
> the suggestions were also misleading. So some people just found it a waste
> of time and ignored it, other people didn't accept patches if it didn't
> pass checkpatch.
> 
> I guess nobody can really force contributors to read LLM reviews but OTOH
> if you see LLM review keeps finding real issues in the work of some
> contributor and you as a maintainer have to go and filter them for the
> contributor (instead of contributor doing this work on their own), then you
> naturally reduce priority of such contributions because it is more work for
> you as a maintainer to deal with them...

I understand the problem. That leads to the next question though: what
will happen when developers will have to pay for those tools ? Will
people who don't want to pay OpenAI, Anthropic or any of the similar
companies with dubious ethics be treated as second-class kernel
contributors and be deprioritized ?

> > > For that matter, I don't believe I'm obliged to accept patches from
> > > someone who forces me to do extra work because they refuse to look at
> > > Sashiko reviews....
> > 
> > Flipping the argument, should contributors be obliged to do extra work
> > that make them feel diminished as a human ? I'm talking here about
> > justifying themselves against LLM arguments that have not been analyzed
> > by a maintainer first.
> 
> You write here about "feeling diminished" or "justifying themselves" and
> I'm not sure I get it. If you get a complaint from some CI running
> checkpatch or say coverity which is bogus (or perhaps correct?), do you
> also feel diminished or needing to justify? I just don't see how LLMs are
> different here...

No, I don't get the same feeling. This is due to multiple factors. One
of them is due to the more deterministic nature of those tools. I know a
build failure from the 0day bot is a build failure. I know what warnings
from checkpatch can be ignored in a given subsystem. I know that I can
reply to some reported issues saying they're false positives and won't
be asked for a full justification. I know that the tool will not deploy
language aimed at convincing me to accept bogus findings. I know what
patterns of false positives to expect. More importantly, I know
maintainers will not blindly side with the tool against me by default.

Another factor that of course plays here is not having the same kind of
ethical concerns regarding static analyzers or build bots.

> And just to be sure: I'm genuinely trying to understand
> your position because so far I don't understand it.

That shows through the way you're asking questions, I really appreciate
it.

> For example when I get Sashiko feedback for my patches, I just ignore the
> comments I find bogus and address those that I find to the point in the
> next revision. If I see Sashiko found something fundamental, I'll also
> reply to the thread to notify human reviewers that I'll have to do a larger
> rewrite so they don't have to waste human time with reviewing this version
> of the patches.

Some maintainers have said they expect authors to justify themselves for
all the false positives.

To be honest, I expect that some authors are already gaming all this by
using generative AI to write convincing explanations to dismiss comments
as false positives, even when they're not, and I don't expect most
maintainers would notice.

-- 
Regards,

Laurent Pinchart
