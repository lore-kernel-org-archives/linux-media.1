Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D323AE182
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 16:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784132329; cv=none; b=QS2DTADS2Trb7SWm3Qlktr+WNCYKz/I6BUhAGZBZFCgb7h7IMsviqo3AXC6mxKGWroYG96ShoqRIOdaPggqhAG9jT5lB9YTbVukiIfWFOUa11N08NAihj3Wz0vum1hH84wHtvkrWIoEnXH84murQQpChzVJVLdA+/MSMB5jVdtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784132329; c=relaxed/simple;
	bh=nisUttwPfDc1axZkOJq2eG4ALk8HqWzRnPdEMSRCbEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXM0FUNOUER3ZY+ERO4/Ls79vQF7yVIOQ0HKd0DXou6qQou6QJ/djDQQ0BSTK252j1TR8wG33G0/WcUcvK3jKHYNdb99ktfwjLoJhTh+OpeizzsVThvCb+VGDDWJdzyTeAZ0qgSAm15w7AugYN1xotJdpKIqxcr+jvXlbIKoiS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tp7ZX5KR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tp7ZX5KR"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2950A33D;
	Wed, 15 Jul 2026 18:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784132267;
	bh=nisUttwPfDc1axZkOJq2eG4ALk8HqWzRnPdEMSRCbEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tp7ZX5KRwAKItj4YQdz37vFFB7TwFrf4EYFiDGv7fV/IQdDHzxbjASgxFQmMkvp05
	 W9Q+lH4ZqZwvdFRBz1zZ7rWUSlbLQVgZOFMmq3TRVJ9+tw+05njEQue6K14zuCjJLQ
	 NlNfqIAVIPMeSMI5Zlj4Tj9HrPDxmzLmpR0pmok4=
Date: Wed, 15 Jul 2026 19:18:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Theodore Tso <tytso@mit.edu>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Derek Barbosa <debarbos@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Steven Rostedt <rostedt@goodmis.org>, users@kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260715161840.GD1778116@killaraus.ideasonboard.com>
References: <20260710083845.23c753ca@foz.lan>
 <87wlv2jq4t.fsf@linux.dev>
 <20260713095538.3d5e86f1@foz.lan>
 <20260713094120.GD1127719@killaraus.ideasonboard.com>
 <20260713220427.582b28bf@foz.lan>
 <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <alcBvuIMEGSjAD1R@mit.edu>
 <20260715091349.2094a0ec@foz.lan>
 <460bb8002edc009194dcc0ad68a0538e5df6bfb5.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <460bb8002edc009194dcc0ad68a0538e5df6bfb5.camel@HansenPartnership.com>

On Wed, Jul 15, 2026 at 08:42:54AM -0400, James Bottomley wrote:
> On Wed, 2026-07-15 at 09:13 +0200, Mauro Carvalho Chehab wrote:
> > On Tue, 14 Jul 2026 23:54:43 -0400 "Theodore Tso" wrote:
> > > On Wed, Jul 15, 2026 at 03:59:09AM -0500, Laurent Pinchart wrote:
> > > > I believe we should follow the first two recommendations of the
> > > > Software Freedom Conservancy on using LLM-backed generative AI
> > > > systems for FOSS contributions ([1]).
> > > > 
> > > > [1] https://sfconservancy.org/llm-gen-ai/llm-backed-generative-ai-recommendations.html
> > > 
> > > It's not clear to me that the SFC document is particularly
> > > applicable for the use of LLM's beyond the use case of generating
> > > code which is contributed to FOSS projects.
> > 
> > Agreed: the document there is about AI-generated code ("Generative
> > AI"), not about patch review.
> 
> In a narrow construction, possibly.  But broadly it seems to be a
> charter for the rights of people to ignore AI absolutely and how they
> should interact with people who use it: that does have applicability to
> AI reviews.

That is my understanding too. I think the industry broadly defines
"generative AI" as LLM-based tools that generate content traditionally
produced by humans (text and code in this case). I think this applies to
reviews. It does not mean one has to agree with the SFC recommandations
of course.

> > > Things get a lot more complicated when we're considering the use of
> > > LLM's to (a) review code, (b) automate the analysis of a bug report
> > > or stack trace, or (c) automate backporting a patch to LTS kernel.
> > > 
> > > Consider the first recommendation, "The FOSS community should
> > > support, not just tolerate, those who outright reject LLM-gen-AI
> > > systems."  If someone rejects LLM-gen-AI systems, and the LTS
> > > kernel contains patches which are automated backported, and they
> > > object, are we bound to forswear the use of automated backport
> > > technologies?
> > > 
> > > What if someone reports a bug with a kernel stack trace, and
> > > someone uses an LLM agent to analyze their bug report and find a
> > > fix.  What does it mean to "support somone who outright rejects the
> > > use of LLM-gen-AI systems" in that case?
> 
> I think it's simpler than that: The contributor doesn't get to approve
> the tools the maintainer uses to assess and apply patches.  If there's
> AI in there and the contributor is an AI luddite, then the patch
> doesn't get applied (i.e. your right to ignore AI stops when it
> infringes others' right to use it).

I don't think anyone instructed any maintainer to stop using those tools
to assess patches.

On a side note, I find the formulation "contributor *is* an AI luddite"
gets close to an ad hominem attack. I assume it wasn't your intention.
Given how heated this topic is, focussing on people's actions instead of
their nature could help making the discussion more productive (if that's
at all possible on a mailing list).

-- 
Regards,

Laurent Pinchart
