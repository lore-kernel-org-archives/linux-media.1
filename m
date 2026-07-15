Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8E935B653
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134851; cv=none; b=J39YxBcn/hJZ2v9DH/iatyZz5Z57FgKei/FPhiyf0vYP8OrvqFxozmOPCPjYdAVu0m2MKh94BufMG9hRXQ5x1Obz9+XjXpXdNsRjoivNVVrav7ynk3VULSfa+ToNl6pHcscmlbTiV6hooLbkYGdUEF9lRR50V0C9La72brthV0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134851; c=relaxed/simple;
	bh=/YMaR4yRRvzF5gjhB+W0WaJI+7Irnt0aGSlmSFODHvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddP/ID8QHXEJMD0garanWHWxsii8LTPIOpTZ0vOGwVIH+Kw24FPci/jOmW09ZAlO/y/KRGIPLKTF368cSCjPXR3MozPE/2TIe0DDI8/Q1lvMvDTPS98Z/nfxfgL2knazayD18E+mKLEuYPDIb1Sg145xvcpHhrDNxvaQHTweTeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=qeBxXWeU; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=3MMqLT3M; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=qeBxXWeU; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=3MMqLT3M; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="qeBxXWeU";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="3MMqLT3M";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="qeBxXWeU";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="3MMqLT3M"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 86BE93E2F;
	Wed, 15 Jul 2026 17:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1784134847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxuddVKW2gTUjXirkO/7eU/fus6bZV/OLqIzophBhRA=;
	b=qeBxXWeUKF+FXSvq7Hy0BoFEDAKklmlbRcms1nDSstiGpxw8YMZ185WZ65chWfLZxvaR29
	ba3IM+L0Ihg7eo900O6jsfuIosN1gQ6sJaDUQ9c3uQQyBUHt6FRPaMHAyVw8lu3nVMQMT7
	d4o/8qfNvqD+rhUN3N7ZBq5Bcv0F1R0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1784134847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxuddVKW2gTUjXirkO/7eU/fus6bZV/OLqIzophBhRA=;
	b=3MMqLT3Mzd7aKNAIgUgE2Hv+TiKMyeJxzwtseFs7DjQS5zozdhOxBVkza5BdE8RM5+jiYD
	l1ZZuttRHvf5+6CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1784134847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxuddVKW2gTUjXirkO/7eU/fus6bZV/OLqIzophBhRA=;
	b=qeBxXWeUKF+FXSvq7Hy0BoFEDAKklmlbRcms1nDSstiGpxw8YMZ185WZ65chWfLZxvaR29
	ba3IM+L0Ihg7eo900O6jsfuIosN1gQ6sJaDUQ9c3uQQyBUHt6FRPaMHAyVw8lu3nVMQMT7
	d4o/8qfNvqD+rhUN3N7ZBq5Bcv0F1R0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1784134847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxuddVKW2gTUjXirkO/7eU/fus6bZV/OLqIzophBhRA=;
	b=3MMqLT3Mzd7aKNAIgUgE2Hv+TiKMyeJxzwtseFs7DjQS5zozdhOxBVkza5BdE8RM5+jiYD
	l1ZZuttRHvf5+6CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B5E2779AD;
	Wed, 15 Jul 2026 17:00:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SdMZHr+8V2q7ZwAAD6G6ig
	(envelope-from <jack@suse.cz>); Wed, 15 Jul 2026 17:00:47 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 21618A084D; Wed, 15 Jul 2026 19:00:39 +0200 (CEST)
Date: Wed, 15 Jul 2026 19:00:39 +0200
From: Jan Kara <jack@suse.cz>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Theodore Tso <tytso@mit.edu>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Derek Barbosa <debarbos@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Steven Rostedt <rostedt@goodmis.org>, users@kernel.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <j4jhhj6rw6kgem73slctakegtoirqmngbejbabfnfwtyshdlgp@itpaup6ghuod>
References: <20260710074528.5a6e4457@foz.lan>
 <20260710083845.23c753ca@foz.lan>
 <87wlv2jq4t.fsf@linux.dev>
 <20260713095538.3d5e86f1@foz.lan>
 <20260713094120.GD1127719@killaraus.ideasonboard.com>
 <20260713220427.582b28bf@foz.lan>
 <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <alcBvuIMEGSjAD1R@mit.edu>
 <20260715161111.GC1778116@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715161111.GC1778116@killaraus.ideasonboard.com>
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[huawei];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,sfconservancy.org:url]
X-Spam-Level: 

Hi Laurent!

On Wed 15-07-26 19:11:11, Laurent Pinchart wrote:
> On Tue, Jul 14, 2026 at 11:54:43PM -0400, Theodore Tso wrote:
> > On Wed, Jul 15, 2026 at 03:59:09AM -0500, Laurent Pinchart wrote:
> > > I believe we should
> > > follow the first two recommendations of the Software Freedom Conservancy
> > > on using LLM-backed generative AI systems for FOSS contributions ([1]).
> > > 
> > > [1] https://sfconservancy.org/llm-gen-ai/llm-backed-generative-ai-recommendations.html
> > 
> > It's not clear to me that the SFC document is particularly applicable
> > for the use of LLM's beyond the use case of generating code which is
> > contributed to FOSS projects.
> > 
> > Things get a lot more complicated when we're considering the use of
> > LLM's to (a) review code, (b) automate the analysis of a bug report or
> > stack trace, or (c) automate backporting a patch to LTS kernel.
> > 
> > Consider the first recommendation, "The FOSS community should support,
> > not just tolerate, those who outright reject LLM-gen-AI systems."  If
> > someone rejects LLM-gen-AI systems, and the LTS kernel contains
> > patches which are automated backported, and they object, are we bound
> > to forswear the use of automated backport technologies?
> 
> I think this is a bit of an extreme example that does not reflect the
> rationale for the SFC recommandations. Note recommendation 3, which
> states
> 
> "FOSS projects should not shun contributors who choose to use LLM-gen-AI
> systems"
> 
> I hold personal opinions on what I consider is or isn't ethical in this
> context, and I also understand that ethical principles have a personal
> dimension. Within the boundaries of the rules of our community, people
> should be entitled to have different opinions. I don't think anyone is
> seriously trying to *force* the whole kernel community to ban usage of
> generative AI (believing in chances of complete success would be a bit
> foolish at this time), not even the people having the most extreme moral
> compasses pointing towards that direction.
> 
> > What if someone reports a bug with a kernel stack trace, and someone
> > uses an LLM agent to analyze their bug report and find a fix.  What
> > does it mean to "support somone who outright rejects the use of
> > LLM-gen-AI systems" in that case?
> 
> My interpretation (which conveniently matches my opinion) is that
> developers should not be forced to directly *use* generative AI tools,
> and should not be forced to *process* unfiltered output of those tools.
> 
> What does this translate to in practice ? I will need to sleep over it
> for at least a few nights to formulate it clearly. I know that I (along
> numerous other people) have strong negative feelings if forced to
> justify myself against unchecked output of an LLM-based review bot, or
> to review patches where the submitter has clearly not invested
> substantial time in making the contributions as good as they can. When
> this happens with human reviewers or developers, they lose trust points
> and end up being ignored. I don't want to be forced to hold LLMs in
> higher regards than that.

I'm not sure I understand here. Do you say you have moral issues if you
should read unchecked LLM output? Or is it just that you find noise /
signal ratio too bad with LLM output so you find it a waste of your time
(and thus feel badly if you were forced to waste this time)? Or something
else?

> > > I expect maintainers who want to act on sashiko reviews to triage and
> > > verify them first before bothering authors
> > 
> > As a maintainer, I don't believe I should be forced to rephrase a
> > Sashiko report just because a patch author "outright rejects" LLM's.
> 
> I don't think I have called for that. What I believe is that triaging
> LLM reviews should not be forced onto contributors.

Frankly, so far I see the issue with LLM review similarly as a dillema we
used to have with checkpatch. It was finding some sensible issues but often
the suggestions were also misleading. So some people just found it a waste
of time and ignored it, other people didn't accept patches if it didn't
pass checkpatch.

I guess nobody can really force contributors to read LLM reviews but OTOH
if you see LLM review keeps finding real issues in the work of some
contributor and you as a maintainer have to go and filter them for the
contributor (instead of contributor doing this work on their own), then you
naturally reduce priority of such contributions because it is more work for
you as a maintainer to deal with them...
 
> > For that matter, I don't believe I'm obliged to accept patches from
> > someone who forces me to do extra work because they refuse to look at
> > Sashiko reviews....
> 
> Flipping the argument, should contributors be obliged to do extra work
> that make them feel diminished as a human ? I'm talking here about
> justifying themselves against LLM arguments that have not been analyzed
> by a maintainer first.

You write here about "feeling diminished" or "justifying themselves" and
I'm not sure I get it. If you get a complaint from some CI running
checkpatch or say coverity which is bogus (or perhaps correct?), do you
also feel diminished or needing to justify? I just don't see how LLMs are
different here... And just to be sure: I'm genuinely trying to understand
your position because so far I don't understand it.

For example when I get Sashiko feedback for my patches, I just ignore the
comments I find bogus and address those that I find to the point in the
next revision. If I see Sashiko found something fundamental, I'll also
reply to the thread to notify human reviewers that I'll have to do a larger
rewrite so they don't have to waste human time with reviewing this version
of the patches.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
