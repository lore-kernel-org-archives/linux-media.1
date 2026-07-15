Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E71243F0AC
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 18:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141509; cv=none; b=ih57OOBFwQ3iaZC/TGzytTNEuxGXnFRksDG/xRYaYI+cp2yy/nGvxHmDbM5AR7UpucwV5W/BM6RS66ZZMPOgLVQdF0ulIkPk8Vu1NiuZ5pkdKMU9LBVp7F8ol9RWSn6T+yvLUV8WujWEGaR8vu4s1iaKotwN2j4X6jqJ7non/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141509; c=relaxed/simple;
	bh=uo88xVxIoZZTvqJn1BH8alUKpnktZW/UBfRMAa9g0D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLf3mvBz0CpSUCx3+EsoQobmqZFM2zvH5suAm44+yvSxkvPw8sPcISIgQ5MoZ8YSVD+W3xHC32QlrBCQWzoRLjoRUsMBY0aEPDKiaAiZoUwLaMKtPRmNCD34eX7nk9IkhMakuej4ghyRVR2R4F/B6fNTR17MUVVstgixw05VQfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sk0zE49u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sk0zE49u"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01DF412D6;
	Wed, 15 Jul 2026 20:50:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784141448;
	bh=uo88xVxIoZZTvqJn1BH8alUKpnktZW/UBfRMAa9g0D8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sk0zE49uJsoQxilUP49IxYhGWpbRktbiy1lGWo3qUyT7c6MtmITQELjoNBO4BEZN2
	 nssE9BPsUyXC2Lh56nj3MUIq2ofeULsOdGgVHJ+crmcLTYXbPtEKQdvWNon9q6p3Zs
	 WYNJ8Xn6D+K+6Sz5nrueJ7zZ1M+bX+NqDqd6vE44=
Date: Wed, 15 Jul 2026 21:51:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Torvalds <torvalds@linuxfoundation.org>
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
Message-ID: <20260715185141.GJ1778116@killaraus.ideasonboard.com>
References: <20260713095538.3d5e86f1@foz.lan>
 <20260713094120.GD1127719@killaraus.ideasonboard.com>
 <20260713220427.582b28bf@foz.lan>
 <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <alcBvuIMEGSjAD1R@mit.edu>
 <20260715161111.GC1778116@killaraus.ideasonboard.com>
 <ale45QPntcwA-aLB@mit.edu>
 <20260715174138.GI1778116@killaraus.ideasonboard.com>
 <CAHk-=wiL7kFVWNtvE5S9A4iqXYat66NaUqX1+gZT0QCndi4eQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wiL7kFVWNtvE5S9A4iqXYat66NaUqX1+gZT0QCndi4eQw@mail.gmail.com>

Hi Linus,

On Wed, Jul 15, 2026 at 11:18:17AM -0700, Linus Torvalds wrote:
> On Wed, 15 Jul 2026 at 10:42, Laurent Pinchart wrote:
> >
> > Please, let's stop comparing generative AI with zero-day kernel bot or
> > checkpatch. That's not a relevant comparison.
> 
> You are correct. The AI generated reports are usually much superior
> and more flexible.
> 
> They aren't just syntax highlighters or reporting "this doesn't
> build", they actually find real non-trivial problems.
> 
> Now, I'm not saying that one replaces the other. The zero-day bot
> finding things that don't even build or boot are great. That's a
> pretty hard and clear signal.
> 
> But the AI reports are often a lot better than checkpatch reports have been.
> 
> Those checkpatch reports have gone through years of trying to massage
> them into something that adds more value than pain - and I do think
> we're there now, but it really required that effort on the part of
> checkpatch maintainers.
> 
> And that's exactly the kind of effort we need for Sashiko and friends.
> 
> Because no, AI reports are not always great, but neither are human
> reviews. I see less useful reviews by humans where I go "did this
> person just try to get his name in the commit log, because that has no
> useful content".
> 
> I suspect you haven't used AI for programming. Try it. Try one of the
> *good* ones.
> 
> And I don't mean "use it for the kernel". Use it just for the fun of
> it. Find something you want to do, and just play with it.
> 
> The open models are getting pretty darn good too, but for a first
> trial without any real setup, one of the free tiers of the cloud ones
> is certainly the easiest way to just kick the tires.
> 
> Do it with something you find interesting, but not "important" - start
> small, and start with something you feel you probably wouldn't really
> waste your time on if it was just yourself, but where you have enough
> background knowledge that you can judge the output.
> 
> It's what I did, because I wanted to judge things based on real use,
> not on what others say (and sometimes the loudest ones do it for
> marketing reasons because they have stock that is tied to it).
> 
> You might find it enlightening, or at least interesting.

I've never (OK, not never, but not for some years now) that those tools
have technical merits. That is not my point in this or other similar
conversations.

I consider that, today, there's no ethical justification for the use of
generative AI in FOSS development. That's a personal opinion, it will
likely evolve with time (not entirely sure in which direction though, as
the industry is hard to predict accurately), I don't expect everybody to
agree, I'm not trying to change the opinion of the overall kernel
community here, and I'm not asking for sashiko-enthousiastic maintainers
or developers to stop using it.

What I'm asking is for the community to recognize there are people with
ethical concerns, listen, and try to see if a reasonable middleground
exists where some of those concerns could be addressed.

Because we all seem to like parallels, here's one that may or may not be
better than comparing generative AI with checkpatch. There have been
conscientious objectors probably for as long as humanity exists. They
have been judged and treated differently over time, often harshly. In
several countries today they can opt for a civilian service instead of
being considered a deserter.

Now I'll let someone reply to this comparison and argue that those
people are destroying the fabric of society :-)

> My own personal annoyance was how eager to please AI models tend to be
> at least by default. I understand why it happens, and that people like
> that subservient tone, but at least personally I was looking for more
> critical review of the code, not an AI that had been taught to say
> "You are entirely right" just to please people.

-- 
Regards,

Laurent Pinchart
