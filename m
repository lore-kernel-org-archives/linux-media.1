Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E663E49CA
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 17:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784653975; cv=none; b=FLaccxrLUA4Om3L97l1NW1mk6E1SiEautwfhX9KFn2mC8QEkiF39peeggm3Zhj8+THudulDkrbvPSwP8Yu0TMylZICWkxE441X779oPVulleXQEcMVGfQK60NJmpoeWKnasrN9D8VDE+WbHtu1wIA2TvBti7P2nngTaIOSt4OvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784653975; c=relaxed/simple;
	bh=mz2NZVCbidIJyhdfVYmGlc4F7FqNTvxN4yyNVqzvlHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fC9gy36Vvb3kkvAblF810LuGX4iA9SMbhoEW4WyNX+NGaW+6bPUVU/9sUG5Gic0y0ui91QHv2husBRsT7QqtQUHj3gQgXyGhWzp45Awp+B59n0Ue7ySSvOm8oglAd1OA4+PxgJSne3udnqlxaMBGoZlEQWoTrGxkAxiBZwyvF30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Aj1xX1WA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Aj1xX1WA"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE2B7C1;
	Tue, 21 Jul 2026 19:11:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784653912;
	bh=mz2NZVCbidIJyhdfVYmGlc4F7FqNTvxN4yyNVqzvlHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aj1xX1WA2s3aaWD3yGeXLLLZkugxGtuqElhg50GU4169JOumPp8Gd3zU1faJSpsLa
	 HEGZBkhvKX0sEsv/MgFOuz+Arx/6wBK97VIZmqCmgSQe7N7wSwAGTgSg35VDllsXxu
	 z51Vx0fsU5cWoaByJhmyqG037KempAjyRW+Njcyk=
Date: Tue, 21 Jul 2026 20:12:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Theodore Tso <tytso@mit.edu>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Derek Barbosa <debarbos@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, users@kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260721171249.GF536385@killaraus.ideasonboard.com>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
 <alc3gAJfAkG5DULJ@zed>
 <alfBvhZkAelq5RVf@mit.edu>
 <aliMsSH373RJ31Mq@zed>
 <aloZ9hqSgzN3beqH@mit.edu>
 <20260717152559.2d2bfc8d@localhost>
 <20260720095537.4d5d503b@robin>
 <ce1df91e-0674-4861-90ff-bcaf5428b414@sirena.org.uk>
 <20260720142432.288b0433@robin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720142432.288b0433@robin>

On Mon, Jul 20, 2026 at 02:24:32PM -0400, Steven Rostedt wrote:
> On Mon, 20 Jul 2026 15:26:34 +0100 Mark Brown wrote:
> > On Mon, Jul 20, 2026 at 09:55:37AM -0400, Steven Rostedt wrote:
> > 
> > > designed. But I fortunately know of these areas and can easily see when
> > > Sashiko falls over it. Hence, these false positives do not waste my
> > > time as I'm already aware of them. (I do take a deeper look to make
> > > sure it's not reporting something similar that may truly be a bug).  
> > 
> > OTOH I had a submitter up to v14 on a new series over the weekend since
> > they were iterating Sashiko feedback.
> 
> Hmm, we should state that Sashiko is sometimes wrong.  A submitter to
> me asked what they should do about a Sashiko feedback they diddn't
> understand, and after reading the Sashiko review, I told them to ignore
> it.

We discussed this at length in linux-media. There were proposals for a
custom header telling patch authors that in case they think a flagged
issue may be incorrect they should reach to an experienced reviewer (or
just ignore it, the wording went through multiple iterations). The
problem there is that, by definition, a junior, unexperienced developer
will have more trouble determining if feedback is correct or not.

> > > Do we need to add an flag to the MAINTAINERS file that states which
> > > sub-systems uses AI?  
> > 
> > That's probably too complicated - some poeple will want submitters to do
> > things like ask submitters to address Sashiko reviews before the
> > maintainers will look at it, other subsystems might make use of Sashiko
> > reviews or whatever but not make it a requirement for submitters to do
> > so.
> 
> Is it too complicated? Do you mean it's too complicated if one
> sub-system says "resolve all Sashiko feedback you receive" and another
> is "You may ignore it"?
> 
> We probably don't want maintainers to require resolving all Sashiko
> reviews, but at least respond to them. Where "I don't know" and "I
> think this review is wrong" are legitimate responses. It is basically
> saying "I want to speak to a person" when drudging through the phone
> automated AI teleprompters.

-- 
Regards,

Laurent Pinchart
