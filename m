Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C523CDBB5
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189237; cv=none; b=ZliYFW7Xf++yPYU9QCmfOJlCK3yp+RMgLF7XAKQDwriS1JFux39wQ0znNyLoBFChetT5L1tayejWmYIiMfN4ADCMCYJ/vOYQSF7muEODo2vv8xJZSI4ztPwf8/v6TyD0jMfRfdibUBxf95t8bLNl0P3pzCEPZg22otI8OqEQCho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189237; c=relaxed/simple;
	bh=7CQU7txVsXJqOlgl54lEouruUVcjDuPVMXIU1NyNiRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8mG3Alu8BgBTMMukGZgU1ms4KwvWUHc4kyZdyncdo9HI5ohY5a7sPGt46CWxsigr/I0PgiJYFCC0veBLGyjkLDTDw5voTrWolqbxVGMHTc1ecrEb0kIJJxhyP5YwmHjsN3oXjSXyD6+77QpEWq1ckW1voG1fqYeVJ1q2cRGFUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mrPsAPGg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mrPsAPGg"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27A5F229;
	Thu, 16 Jul 2026 10:06:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784189171;
	bh=7CQU7txVsXJqOlgl54lEouruUVcjDuPVMXIU1NyNiRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mrPsAPGguM4HRsdBruTnaSEyZIzGmwjLdElSyJdoHYtwaufBftxHfq+PAUvF6ynXD
	 dOqpwBsy0sTRjGEu7tU6giRZt3BRZMb1OO7W3rJg39VpsPVWJeoA/fJgSRBT9tLW5f
	 WBQzWIzNHB2lIF1pPxZ9xrceEFwBSLuMJZC1oIT0=
Date: Thu, 16 Jul 2026 10:07:03 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Theodore Tso <tytso@mit.edu>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>, users@kernel.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <aliMsSH373RJ31Mq@zed>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
 <alc3gAJfAkG5DULJ@zed>
 <alfBvhZkAelq5RVf@mit.edu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alfBvhZkAelq5RVf@mit.edu>

Hi Ted,

On Wed, Jul 15, 2026 at 01:31:00PM -0400, Theodore Tso wrote:
> On Wed, Jul 15, 2026 at 09:59:57AM -0500, Jacopo Mondi wrote:
> > Far-fetched review comments, very convincing word salads mixed with
> > valuable findings have often been escalated by authors to maintainers
> > to have them distil the good from the bad.
>
> That hasn't been my experience with ext4.  As far as signal to noise,
> the main issue is one where pre-existing issues are flagged in
> multiple patches in the patch series.  However, (a) Romain knows about
> this, and a fix is in the works, and (b) it's flagged as a
> pre-existing issue --- and we tell newcomers that they are free to
> disgard pre-existing issues, but if they do want to fix it, in most
> cases do it as a separate patch (or in a separate patch series) and to
> avoid folding it into the current patch --- especially if the fix is
> non-trivial.

This is exactly happened to me last week.

I got fooled by a Sashiko reported issue on patch for a driver I
maintain. I asked the developer to address it, he did so in a separate
patch, people got involved, lost quite some time on it, it ended up
being a false positive.

Now, one could blame me for being fooled by Sashiko. One could say
that the above described process is exactly what we do: discuss code
to make it better.

I can agree with both the above point.

Fact is, reviewers/maintainers are scarce, and I got my time sucked in
by an hallucination. It could happen with people too, but the rate at
which LLMs produce output is super-human.

This might sound just one anecdotal experience, but is not just one
off. That's what I ear from most people doing reviews and driver
maintainership, and that's the reason the linux-media summit decided
to keep Sashiko reviews in a separate mailing list as an opt-in for
interested reviewers: to avoid overloading the most scarce resource we
have: maintainers and reviewers.

>
> > All discussions around AI inevitably ends being about principles and
> > good vs bad. I'm surprised Linus and Ted had to weight in to re-state
> > the "we're not against AI!" principle while I would like to discuss
> > signal-to-noise metrics instead.
>
> If it makes sense for a subsystem to move reviews to a separate list,
> by all means, that should be up to the subsystem maintainers.  There

In a large subsystem, where multiple people does reviews and effective
maintainership of drivers and large parts of the subsystem, these
kind of decision have to be made by consensus among the ones investing
time and energy to maintain the subsystem.

That's what we did during the linux-media summit.

> has been quite a lot of discussion about how we should accomodate
> people who object to AI by dumping more work on maintainers, and
> that's the part that I object to.

Sorry for not being clear. My point is exactly this: so far, LLM
reviews have proven to be time and energy consuming for maintainers
and reviewers.

Will they get better ? Surely.

At this time it's imposing more work on the active member of the
community.

>
> One of the things that really excites me about Shashiko is that it
> reduces my workload.  Whereas the false positives from Syxbot and

I'm really surprised how your experience differ from the one of most
people I interact with.

Maybe it's a question of what your role in the development pyramid is?

Who effectively does the first reviews on the list and interfaces
directly with contributors might be more affected by slop compared to
top-end maintainers that receive the end product ?

> oss-fuzz have caused me more work, not less, and has had significantly
> more noise than Shahiko.  (I've started outright ignoring oss-fuzz
> reports as a result, and the "respond within NN days or we will make
> our report public" has caused me to respond, "and this will say more
> bad things about oss-fuzz than my software"....)

>
> Cheers,
>
> 							- Ted
