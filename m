Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996DD3B14D1
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 16:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784133831; cv=none; b=jyUNR3OpvufXmUgniZkLsB9Fbo/K7WCtp4sQRoSoXOxJzq8DfXZA3do/CWltlDs0iZxRD2cYjUHQHb9h+qCJTc4A1/9SEqfeJN9HZa6Q6EzSraYkEZkKSoyHDfTNeiCnb48Eoc+UYDGPK0Qtd6i3urHCikeX6N9Q8wo9Ur+dx+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784133831; c=relaxed/simple;
	bh=aX2nWp74/q4Odph1mc77esy2yiP+oqHMtvrmL2DQ8Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uS0iHTSs1fYh+JR3va0YaG2n8nip4/SaS0Cbd96xLa8a0IyxhiSNWygpk849D/oiMWYwMcQ0ZaHqb92sq8XWTvNPSoEe9W8XFRk3GAZjfgTJqMwuoFkxSGVG+jsTHBru91lkel2dS5Zu0mYYegb4Ypqu+rF9EK/KfFslxo0UNLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A8eiSWS3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A8eiSWS3"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C6D612D6;
	Wed, 15 Jul 2026 18:42:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784133773;
	bh=aX2nWp74/q4Odph1mc77esy2yiP+oqHMtvrmL2DQ8Ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8eiSWS3PREH+40TlkL7AS0m8CUeLfXOfPJIu5rMiNyXkv2bbtgZ1+ZCFYktmamMu
	 e7rMhLFMTE6Mt8baMDUpkY0EWnBYAr+XhHQcxmhpZVXBCJq9CbL9cwIET0/hdDWMtT
	 FKI+J0pBDg30qjDp6pzYDV5BOpLnMIXJJndbcT7c=
Date: Wed, 15 Jul 2026 19:43:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Torvalds <torvalds@linuxfoundation.org>
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
Message-ID: <20260715164347.GA1802977@killaraus.ideasonboard.com>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
 <CAHk-=wi4zC+Ze8e+p3tMv8TtG_80KzsZ1syL9anBtmEh5Z40vg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wi4zC+Ze8e+p3tMv8TtG_80KzsZ1syL9anBtmEh5Z40vg@mail.gmail.com>

On Tue, Jul 14, 2026 at 08:06:14PM -0700, Linus Torvalds wrote:
> On Tue, 14 Jul 2026 at 19:01, Roman Gushchin <roman.gushchin@linux.dev> wrote:
> >
> > I think it makes the point of sashiko - helping maintainers - unachievable. If the point to not use
> > LLMs in general, let’s discuss this, not how to make each use case more complex.
> >
> > It seems like [1]  expresses a very anti-LLM position in general
> 
> Yes.
> 
> And no, that's not the position of the Linux kernel.
> 
> I realize that some people really dislike AI, but this is an area
> where I'm willing to absolutely put my foot down as the top-level
> maintainer.
> 
> Linux is not one of those anti-AI projects, and if somebody has issues
> with that, they can do the open-source thing and fork it.
> 
> Or just walk away.

"My way or the highway" doesn't show a willingness to listen, I'll stop
this reply here.

Maybe those topics are best discussed face to face. I'll be in Prague in
October if you think talking to me has more value than talking to an LLM
;-) (and for clarification, this is really meant as humour to cool down
the discussion, if you find any passive-aggressive interpretation of
this comment please know it's wasn't meant that way).

> AI is a tool, just like other tools we use.  And it's clearly a useful one.
> 
> It may not have been that "clearly" even just a year ago, but it's no
> longer in question today.
> 
> There are other questions around AI (like what the economy of it will
> actually look like in the end), but "is it useful" is no longer one of
> those questions. Anybody who doubts that clearly hasn't actually used
> it.
> 
> Yes, it can also be a somewhat painful tool, both for maintainer
> workloads and just from a "it keeps finding embarrassing bugs"
> standpoint.
> 
> But the solution is not to put your head in the sand and sing "La La
> La, I can't hear you" at the top of your voice like some people seem
> to do.
> 
> The solution is to make sure those LLM tools _help_ maintainers
> instead of just causing them pain. There's no question on that side.
> 
> We're not forcing anybody to use it, but I will very loudly ignore
> people who try to argue against other people from using it.
> 
> And no, AI isn't perfect. But Christ, anybody who points to the
> problems at AI had better be looking in the mirror and pointing at
> themselves at the same time.
> 
> Because it's not like natural intelligence is always all that great either.
> 
> The kernel project has been and will continue to be about the technology.
> 
> Sure, the social angle of working on open source is important and
> often a very motivating part of the project, but in the end that's a
> side benefit, not the _point_ of the project.
> 
> This is *NOT* some kind of "social warrior" project, never has been,
> and never will be.
> 
> In the kernel community we do open source because it results in better
> technology, not because of religious reasons.
> 
> And so we make decisions primarily based on technical merit. Not fear
> of new tools.

-- 
Regards,

Laurent Pinchart
