Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E600C46D56F
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648618; cv=none; b=fNXFqQyowKysO1ncORWfykFY8/xVMlT9Hw1toIxE9oiDHj/DjKBYwVqzdyoakX7PPcq4LWsHB6geaFnjjvUjZiFld7fz8tpFQnrP5UKoEidyNlrhmK3bKn+SfWa5Jg60TLrXkqI/WBzeyH10SC/7YYm44NxPk8w500mZo2wavPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648618; c=relaxed/simple;
	bh=1MeqD1jRMOGwASjjRAgDyDZtJYNdBpaMYPFy0VsiK1c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oWygM4EJVEE7eW+eT+jvqUpxGVzWTvX7IChKyTWq5aNm3KF2dXDhcfydKIChfPpf3dCyoBG+OqMxNKrQvInOrZiRjzgS72nCgBtawJrF4Z09ceDY67aWbOlscY9fOKTxF8BZteq04wlEJq2JzLPr82EydwPZplXX+JMtD+H07o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rlih1ibb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rlih1ibb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA521F00A3A;
	Tue, 21 Jul 2026 15:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784648616;
	bh=OJFf0iRb6PP7xga0gx3925y23qBNO+KqTjOp3jia2qI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Rlih1ibbinBOOflPSydX2sThOqTt4YLQBtYaMMA7kWSajXo2NYX9UaOW3vEEUG1bz
	 i2TBuuutulO/EdF2Y/o3YXrN5n/LIIXpGjp5U8OxkIKi4vcXxoUX3VoRiHWw5LFOSr
	 4KT+ee1uobcllEF0E6i75wWZ7Sqh5oSsnXeDPzp1YrX7A7q/5vFMFWPd3p30lrNH6h
	 iXJub/Omf4DbQ6zwjbb123TuGPyU11NymqMqoH1rXszeoNjxD8HEcK0N1LWrUlVxoQ
	 LeYYyR84mFuWNkTYk96DPc03+2Ey9LktooweCbawY5rccnBfLBswLFKyrzv3u2Lo3D
	 7vahjffUkMOLA==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wmCd4-00000005aA5-1Hls;
	Tue, 21 Jul 2026 17:43:34 +0200
Date: Tue, 21 Jul 2026 17:43:33 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Theodore Tso" <tytso@mit.edu>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Derek Barbosa
 <debarbos@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>,
 Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260721174333.67a25aae@localhost>
In-Reply-To: <20260720211647.3d62f4b9@foz.lan>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	<4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	<alc3gAJfAkG5DULJ@zed>
	<alfBvhZkAelq5RVf@mit.edu>
	<aliMsSH373RJ31Mq@zed>
	<aloZ9hqSgzN3beqH@mit.edu>
	<20260717152559.2d2bfc8d@localhost>
	<20260720095537.4d5d503b@robin>
	<20260720211647.3d62f4b9@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Jul 2026 21:16:47 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> On Mon, 20 Jul 2026 09:55:37 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > On Fri, 17 Jul 2026 15:25:59 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> > > That's one of the reasons why I do think media needs its own custom
> > > prompts.    
> > 
> > Reading this thread I've come to the conclusion that different systems
> > have different results from Sashiko. Sashko gets confused with some of
> > the tracing logic, but that's because tracing does some hacks to keep
> > the overhead down (it's where live text updates started). It reports
> > issues sometimes that are not a problem due to the way the code was
> > designed.  
> 
> There is a custom prompt for tracing:
> 
> 	https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts/kernel/subsystem/tracing.md
> 
> Probably, if you run Sashiko without it you would get more false
> positives.
> 
> > But I fortunately know of these areas and can easily see when
> > Sashiko falls over it. Hence, these false positives do not waste my
> > time as I'm already aware of them. (I do take a deeper look to make
> > sure it's not reporting something similar that may truly be a bug).
> > 
> > But I can see where this could cause a bit more problems with a
> > different sub-system.
> > 
> > Hence, I don't believe there should be a one-size-fits-all for the
> > entire kernel,  
> 
> It is not like that. On static analyzers like Coverity, smatch,
> sparse, coccinelle... there's no space for per-subsystem adjustments.
> 
> Now, with LLM, each subsystem may have custom prompts:
> 
> 	https://github.com/sashiko-dev/sashiko/tree/main/third_party/prompts/kernel/subsystem
> 
> Also, when LLM parses a C file, it can pick some things from
> the documentation on it.

Btw, Sashiko has gained its first set of adjustments for media today:
	https://github.com/sashiko-dev/sashiko/issues/334

	https://github.com/sashiko-dev/sashiko/commit/b0aad67f2d5918dd5da768fde15a144f8435d387
	https://github.com/sashiko-dev/sashiko/commit/8ac8e51fd79c8560404efe62d0c9ce38defce5af

Hopefully, it will help to prevent some false positives noticed on
past reviews.

-- 
Thanks,
Mauro
