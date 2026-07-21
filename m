Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007B5347BC6
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 22:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674008; cv=none; b=Gfgzmdx+0e1Bx8AB55P6MgqmNj7T6zOIpV6A6LwsP9i4ttii7JnHODi7cXv0GwR5F5QE3qOQTfhJPBDw0w/5ynYGamC6twYtuXf0wRzQeI8XUwTU1IEeVzIuXrV8wTqe6dHcO7iD5m+Baq5i6ypkA8EtPBfAeFs7w+1SsvJe3+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674008; c=relaxed/simple;
	bh=YzEZDy85dqrcs92Wg4WGWdAPpa3T9eDKBY5Fj0uTFfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLRM879uOaW+CH/Tgdc06vmtRrmsa2l6TONDjbvq7uUVvxzmCJ9V2GEzslhWHdm9zlPaB0l3jNDlk6aQn+SqllEidYgXJ6C747pkyg/V9f1ewc/7VTy13116cUfI0sg7QHcuaZ0Y3di4fvhkLtI4S3zm+AsCYU/yz6S+nt4HMuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tonppFHU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tonppFHU"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10E44BAE;
	Wed, 22 Jul 2026 00:45:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784673944;
	bh=YzEZDy85dqrcs92Wg4WGWdAPpa3T9eDKBY5Fj0uTFfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tonppFHUh26EWKLQXfa17/6EjRd2lNauwv5Ip2quIRUXcPyKCwOVzPfTg+RrhF4cR
	 meVNsiYanQ6Am0nt3VGuZi1fPYUv/wppOCkY73kntfxgAlHkCaR5rg7jdPfcfM3FRo
	 JNAf6AUwk/aEg6n4K3PpmXl7068yhMxIBUefj55k=
Date: Wed, 22 Jul 2026 01:46:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Derek Barbosa <debarbos@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, users@kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260721224642.GI536385@killaraus.ideasonboard.com>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
 <20260715162816.GF1778116@killaraus.ideasonboard.com>
 <7ia47bmw0xls.fsf@castle.c.googlers.com>
 <20260721182509.GG536385@killaraus.ideasonboard.com>
 <20260721152501.0ff97e8c@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721152501.0ff97e8c@gandalf.local.home>

On Tue, Jul 21, 2026 at 03:25:01PM -0400, Steven Rostedt wrote:
> On Tue, 21 Jul 2026 21:25:09 +0300 Laurent Pinchart wrote:
> 
> > We've long known that we can't win if we treat security as a game of
> > whack-a-mole. Kees Cook and others have for years spent large mounts of
> > time and energy into securing the kernel by closing classes of
> > vulnerabilities. We've accepted a second programming language for kernel
> > development that should make memory-related bugs impossible in the first
> > place. In a less disruptive way, switching from C89 to C11 has enabled
> > features likes __free() that help make the code base safer.
> > 
> > Do we need to act on security issues reported by LLMs ? For the time
> > being, surely. Is that enough ? No way. It's even more important today
> > than it used to be to make whole classes of bugs impossible in the first
> > place. The good news for people interested in that development is
> > there's lots of work to be done all across the kernel :-)
> > 
> > Touting AI reviews as the solution to the security problem LLMs
> > generated in the first place without massively investing in kernel
> > hardening is in my opinion the real "putting our heads in the sand"
> > here.
> 
> Who said the two are mutually exclusive? I believe there is still a large
> effort in hardening the kernel.

I certainly hope so :-)

> AI reviews is totally agnostic to that
> effort. Roman said at LSF/MM/BPF that he's the only one working on Sashikio
> at Google. Yes, Google is investing billions (if not trillions) of dollars
> into AI, but that has nothing to do with the Linux kernel. Roman has simply
> tapped into that effort to allow the Linux kernel to take advantage of that
> investment.
> 
> It really sounds like you want companies to move effort from AI into the
> Linux kernel hardening. If Google did that, all it would do is move Roman
> from working on Sashiko to working on hardening the kernel. I think Roman
> is doing a hell of a lot more for the Linux kernel by staying with Sashiko!

As you said, it's not mutually exclusive. I'm sure Google has other
kernel developers than Roman.

-- 
Regards,

Laurent Pinchart
