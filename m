Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF492BE65F
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 17:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135378; cv=none; b=PEcf1o99rsaocBIUzHG9GpLgCCu/2WBmAu9vOHO5PB261aFvmohZuO5HMMNCNQDjCADpZkNhPyEiGfYZdEknsoSDlnLGqAn5/zlxLNlT+bBwnjs9egQg6uupKqln2AnEbqbQdNyx8FAlulWMkpW4BjjjoJiWSD8gYVCcfkOiFnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135378; c=relaxed/simple;
	bh=mzw3hBV7t/aw/0xVudmYaTIyfRsE9p97qUnrjhOc364=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJyT64xxAz9ZqYza9DwEntE8Lu3OV4RDEoXs2ezggXrPwB426csTAApExCAMJb8V5rNOS8i8fMElUCPNBRJn7RWeyuvMx6z4c7IsdA+X+eSmFb7wrvkQcYYSUI8M4itSeeFFHvWxvlkvBiYdPWhW0RBC2YY8zEfGj+KLfO+XWhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I7dLtLnp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I7dLtLnp"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68818104C;
	Wed, 15 Jul 2026 19:08:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784135318;
	bh=mzw3hBV7t/aw/0xVudmYaTIyfRsE9p97qUnrjhOc364=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I7dLtLnpeicQunG/IQ006w0sfIN+W3HMVL2gwDNXXbaiQps4B4on9x2TK+1eHoK5j
	 zPvLMZ8AqskOOkutYE4sj8S64k5xCPaSu2UqHm8OEBvCwh04vhiVkFGnBLYNYOqhOV
	 7sYING5F0OgLkb3QuWz5rP9DkdDdf4PxelbdmuEg=
Date: Wed, 15 Jul 2026 20:09:32 +0300
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
Message-ID: <20260715170932.GB1735001@killaraus.ideasonboard.com>
References: <20260713095538.3d5e86f1@foz.lan>
 <20260713094120.GD1127719@killaraus.ideasonboard.com>
 <20260713220427.582b28bf@foz.lan>
 <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <alcBvuIMEGSjAD1R@mit.edu>
 <20260715091349.2094a0ec@foz.lan>
 <460bb8002edc009194dcc0ad68a0538e5df6bfb5.camel@HansenPartnership.com>
 <20260715161840.GD1778116@killaraus.ideasonboard.com>
 <a03c191ab567d1f24708a797755e380b7657617e.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a03c191ab567d1f24708a797755e380b7657617e.camel@HansenPartnership.com>

On Wed, Jul 15, 2026 at 12:53:47PM -0400, James Bottomley wrote:
> On Wed, 2026-07-15 at 19:18 +0300, Laurent Pinchart wrote:
> > On Wed, Jul 15, 2026 at 08:42:54AM -0400, James Bottomley wrote:
> > > On Wed, 2026-07-15 at 09:13 +0200, Mauro Carvalho Chehab wrote:
> > > > On Tue, 14 Jul 2026 23:54:43 -0400 "Theodore Tso" wrote:
> [...]
> > > > > Things get a lot more complicated when we're considering the
> > > > > use of LLM's to (a) review code, (b) automate the analysis of a
> > > > > bug report or stack trace, or (c) automate backporting a patch
> > > > > to LTS kernel.
> > > > > 
> > > > > Consider the first recommendation, "The FOSS community should
> > > > > support, not just tolerate, those who outright reject LLM-gen-
> > > > > AI systems."  If someone rejects LLM-gen-AI systems, and the
> > > > > LTS kernel contains patches which are automated backported, and
> > > > > they object, are we bound to forswear the use of automated
> > > > > backport technologies?
> > > > > 
> > > > > What if someone reports a bug with a kernel stack trace, and
> > > > > someone uses an LLM agent to analyze their bug report and find
> > > > > a fix.  What does it mean to "support somone who outright
> > > > > rejects the use of LLM-gen-AI systems" in that case?
> > > 
> > > I think it's simpler than that: The contributor doesn't get to
> > > approve the tools the maintainer uses to assess and apply patches. 
> > > If there's AI in there and the contributor is an AI luddite, then
> > > the patch doesn't get applied (i.e. your right to ignore AI stops
> > > when it infringes others' right to use it).
> > 
> > I don't think anyone instructed any maintainer to stop using those
> > tools to assess patches.
> 
> Well, AI replies to patches were the discussion.  That is part of a
> maintainer assessment (at least if sashiko replies with a problem to
> SCSI patches I ignore the patch until the submitter either fixes the
> issue or explains why it is wrong).
> 
> > On a side note, I find the formulation "contributor *is* an AI
> > luddite" gets close to an ad hominem attack. I assume it wasn't your
> > intention. Given how heated this topic is, focussing on people's
> > actions instead of their nature could help making the discussion more
> > productive (if that's at all possible on a mailing list).
> 
> It's a common and neutral dictionary term to mean someone opposed to
> change:
> 
> https://www.dictionary.com/browse/luddite

It was the conjunction with *is* in that formulation that triggered me
(and before anyone sends a meme involving Bill Clinton: pleast don't).
It puts people in boxes and that doesn't help discussions. But we're
digressing, I don't think this is worth debating here.

> If we avoid all words which originally had negative origins because the
> origins might cause offence to some, you'll find a long list of
> everyday words:
> 
> https://www.mentalfloss.com/language/words/13-words-changed-negative-positive-or-vice-versa
> 
> Although I personally would love to support banning the word "Dude" in
> silicon valley on grounds of original negative connotation ...

:-D

-- 
Regards,

Laurent Pinchart
