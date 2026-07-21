Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC622DECDF
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 18:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658315; cv=none; b=PwgzevVd+qq2U5uBq0au1f+90rNjIyUCN+E1QdVNWdAjqe3lP/ZfW/7q49ivzdZ5EzzlytFBRdynuM9pCmA3Nof/HJpZ5UC9OTD1KFkjAFLWUDjIAjLY8bqW4uxcdBLN/7AY9105waMFS5nMC9InIs6wePsJS0ArFCAAS5P73fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658315; c=relaxed/simple;
	bh=90LReE9LUeh1IHz7AV4yLv7VATbnkyi71Psa6QYeMIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjgY7ziICYaSIsg+pAcJIUxccUwy2z8CAGYiGWCjuaI+wnSQbZetOuVAlHseQL3WFqwuOuxgGatewwlp+kcnEq4h2pCSvL1eU8B2cjVxbBG+UA5MM4ICwxS0cKwIty1uQLkjXHgzo1Z7QM7+DROkF6DqkKOxz8pMSPmL43nCc2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HRaKbFcB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HRaKbFcB"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0271517;
	Tue, 21 Jul 2026 20:24:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784658251;
	bh=90LReE9LUeh1IHz7AV4yLv7VATbnkyi71Psa6QYeMIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HRaKbFcBeQHpEJ2e1mS2AR6/eON25gmiXQZnpBB69QYDLFpDJYn+Oi3nbG6td58Gq
	 1P6dH0KxeJ1Mr4j1uoQpm1wzZc+NMVmvysm3C2WMgwhW67qqGKppb+h/97rBkPrg72
	 TwGIlu9IJ75+nE74k1SJmhe4ilwpY3eyxwxh7Vj4=
Date: Tue, 21 Jul 2026 21:25:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Derek Barbosa <debarbos@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Steven Rostedt <rostedt@goodmis.org>, users@kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260721182509.GG536385@killaraus.ideasonboard.com>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
 <20260715162816.GF1778116@killaraus.ideasonboard.com>
 <7ia47bmw0xls.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ia47bmw0xls.fsf@castle.c.googlers.com>

Hi Roman,

On Wed, Jul 15, 2026 at 09:08:47PM +0000, Roman Gushchin wrote:
> Laurent Pinchart writes:
> > On Tue, Jul 14, 2026 at 07:00:54PM -0700, Roman Gushchin wrote:
> >> On Jul 14, 2026, at 5:59 PM, Laurent Pinchart wrote:
> >> > On Tue, Jul 14, 2026 at 10:55:42PM +0000, Roman Gushchin wrote:
> >> >> Mauro Carvalho Chehab writes:
> >> >>>> On Mon, 13 Jul 2026 12:41:20 +0300 Laurent Pinchart wrote:
> >> >>>>>>> Individuals can set their
> >> >>>>>>> spam filters up if they don't want to get these emails, I can't control
> >> >>>>>>> it. Providing individual authors an option "I don't want my patches
> >> >>>>>>> to be reviewed" sound strange to me. It's like "I don't want my patches
> >> >>>>>>> to be tested by unit tests".  
> >> >>>>>> 
> >> >>>>>> I agree with you, and, on my head, not sending e-mails to the author
> >> >>>>>> is a clear violation to one of the most basic net etiquette rule on
> >> >>>>>> mailing lists: any replies to posts there should reach the author.  
> >> >>>>> 
> >> >>>>> I don't know where that one comes from.
> >> >>>>> 
> >> >>>>> What happened to this other "most basic rule" that subscription to
> >> >>>>> services that deliver e-mails should be opt-in ?
> >> >>> 
> >> >>> Replying to an e-mail is not subscribing to a service. It is the
> >> >>> author's right to know if one replies publicly to his e-mails.
> >> >>> Explicitly removing him from the C/C of such replies is a violation
> >> >>> of his rights.
> >> >>> 
> >> >>> On other words, it is implicit that, if you post an e-mail, you'll be
> >> >>> expecting actions or answers to it.
> >> >>> 
> >> >>> Now, if one really doesn't really want to receive e-mails from a
> >> >>> particular sender, a block list solves it. Alternatively, a way to
> >> >>> opt-out is welcomed.
> >> >>> 
> >> >>> See, this is different than adding someone to a mailing list without
> >> >>> his consent: On such case, people receive e-mails unrelated to their
> >> >>> preferences. For those, opt-in is the right net etiquette.
> >> >> 
> >> >> I agree with this.
> >> >> 
> >> >> But also just practically: if someone who opted out from sashiko emails
> >> >> posts a patch and sashiko finds say a critical issue, do we expect the
> >> >> maintainer to go and manually check each time whether the author opted
> >> >> out and forward the review?
> >> > 
> >> > I expect maintainers who want to act on sashiko reviews to triage and
> >> > verify them first before bothering authors, yes. I believe we should
> >> > follow the first two recommendations of the Software Freedom Conservancy
> >> > on using LLM-backed generative AI systems for FOSS contributions ([1]).
> >> > 
> >> > [1] https://sfconservancy.org/llm-gen-ai/llm-backed-generative-ai-recommendations.html
> >> 
> >> I think it makes the point of sashiko - helping maintainers -
> >> unachievable.
> 
> Hi Laurent!
> 
> > Why do you think so ? As far as I can see, there are many maintainers
> > and contributors with a strong enthousiasm for generative AI reviews.
> > Assuming those tools would give a net positive result, isn't that
> > initial mass sizeable enough to help maintainers ? It could even be
> > argued that starting with enthousiasts will help convince some of the
> > sceptics over time.
> 
> At this moment there are 36 mailing lists who opted in for delivering email
> reviews over email (without counting linux-media@). In every single case
> it was based on maintainers requests in all cases of a disagreement
> between maintainers I took the conservative side.
> 
> Also:
> $ git log next/master --grep=sashiko -i --oneline | wc -l
> 826
> 
> This is in less that 4 month since Sashiko's public launch mid-March.
> Most of this commits are bug fixes for existing issues discovered by
> Sashiko as a byproduct of reviewing new changes, so arguably there is a
> larger set of bugs which were prevented to enter the kernel.
> 
> So it's fair to say that there are lot of enthusiasts and lot of data
> already which proves the usefulness of AI code reviews. If it's not
> convincing, I'm sorry, but it's unlikely I'll be able to convince you
> anyway.

I don't think I've claimed in this mail thread that there are no
enthusiasts, or that the tool can't be useful. There's no convincing
needed on those two points.

> >> If the point to not use LLMs in general, let’s discuss this, not how
> >> to make each use case more complex.
> >
> > To be clear, that's not what I'm calling for. I'm asking for
> > contributors to not be forced to use LLMs. I'm not campaigning for the
> > kernel to ban their usage.
> >
> >> It seems like [1]  expresses a very anti-LLM position in general, which I can understand and I agree 
> >> with some of concerns. But I think it’s up to project leaders to decide if Linux in general  takes this 
> >> position and my take so far is that the answer is not.
> >
> > I would be surprised if Linus broadly agreed with [1] :-) I however hope
> > that we, as a community, have enough shared values to listen to
> > everybody.
> 
> The reality is that there are multiple actors in the world who are
> actively using AI for at least the security vulnerability scanning across
> ALL Linux kernel codebase, including your changes. And it's completely
> out of our control (ours as kernel community). And we can't ignore these
> findings completely (how to handle them it's a separate discussion).
> So there is simple no way someone who wants to contribute their code
> to the kernel can pretend to live in the world where ai doesn't exist.

I'm quite sure I said in this mail thread (or, if not, in a related one
on the ksummit mailing list) that I won't ignore a security issue just
on the ground it has been discovered with LLM assistance. There's no
call for "putting our heads in the sand".

This is a situation we haven't chosen, most of us don't like it, and we
have no option but dealing with the fallout. I'm quite outraged the
companies making those tools are not being held accountable yet for not
seriously trying to limit the damage, but the priority here and now is
to figure out what to do without considering that anyone with some sort
of ethics has no place in the kernel community.

> So the real choice is more like do we want to find (most of)
> AI-discoverable issues before they get merged or after.
> (Obviously not all issues are security-related, but it doesn't change
> the point).

That seems a bit of a false dichotomy to me.

We've long known that we can't win if we treat security as a game of
whack-a-mole. Kees Cook and others have for years spent large mounts of
time and energy into securing the kernel by closing classes of
vulnerabilities. We've accepted a second programming language for kernel
development that should make memory-related bugs impossible in the first
place. In a less disruptive way, switching from C89 to C11 has enabled
features likes __free() that help make the code base safer.

Do we need to act on security issues reported by LLMs ? For the time
being, surely. Is that enough ? No way. It's even more important today
than it used to be to make whole classes of bugs impossible in the first
place. The good news for people interested in that development is
there's lots of work to be done all across the kernel :-)

Touting AI reviews as the solution to the security problem LLMs
generated in the first place without massively investing in kernel
hardening is in my opinion the real "putting our heads in the sand"
here.

-- 
Regards,

Laurent Pinchart
