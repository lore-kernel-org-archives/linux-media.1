Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C928725B
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 16:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784132901; cv=none; b=ryWo3JYr8UoXdqt6YdKjbL7uSVs6ZnisHndomZTtPadhQkx9VMipSkjnOfDrvFF3D83CrM1GH1aGtHAC5OQbkKVqYeqHb0LbM/AsRTpPxoEDFX19mV1yEtdd4nwH9jRTtPpTE5Gr3YI9mS/6DKvTmqsHO9goKZGiy5wPZ+HYmDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784132901; c=relaxed/simple;
	bh=2y27exXQsMf5AdWpVHWZzKBRkJnrJf5zfkO9jH8i8ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATF3dH6QEbowSoObCur1jqiNuho7SPfc0rJ4dajAV5cJyOSEvHXM3puZr6KGqFIBTmicIXrpCun7QUvAHDqqsB3OyTlLN4Ju5r3bn/3nszgFC7XP+UPiOS+2ODsfpHSSxf+XikarTRbE3QPXo/J36Jzdn16aEuQFBCTwYFW7rrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t5P2qTQG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t5P2qTQG"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D97712D6;
	Wed, 15 Jul 2026 18:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784132842;
	bh=2y27exXQsMf5AdWpVHWZzKBRkJnrJf5zfkO9jH8i8ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t5P2qTQGQ+X40Es+Z5NvWaWBTR7MxsBNO+tZeO4gq2s6aKvt7GZWm3025mCkJeuot
	 QciPjAlbcJnRChtjnTsZ2xNS91DaJU0cocNs3LoMpoqkm+FyWLxPpmyGYtDSrVduTo
	 EKf19+b9ew2/0CN60PxM+/nDO396YJp/mUzy7V5I=
Date: Wed, 15 Jul 2026 19:28:16 +0300
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
Message-ID: <20260715162816.GF1778116@killaraus.ideasonboard.com>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>

Hi Roman,

On Tue, Jul 14, 2026 at 07:00:54PM -0700, Roman Gushchin wrote:
> On Jul 14, 2026, at 5:59 PM, Laurent Pinchart wrote:
> > On Tue, Jul 14, 2026 at 10:55:42PM +0000, Roman Gushchin wrote:
> >> Mauro Carvalho Chehab writes:
> >>>> On Mon, 13 Jul 2026 12:41:20 +0300 Laurent Pinchart wrote:
> >>>>>>> Individuals can set their
> >>>>>>> spam filters up if they don't want to get these emails, I can't control
> >>>>>>> it. Providing individual authors an option "I don't want my patches
> >>>>>>> to be reviewed" sound strange to me. It's like "I don't want my patches
> >>>>>>> to be tested by unit tests".  
> >>>>>> 
> >>>>>> I agree with you, and, on my head, not sending e-mails to the author
> >>>>>> is a clear violation to one of the most basic net etiquette rule on
> >>>>>> mailing lists: any replies to posts there should reach the author.  
> >>>>> 
> >>>>> I don't know where that one comes from.
> >>>>> 
> >>>>> What happened to this other "most basic rule" that subscription to
> >>>>> services that deliver e-mails should be opt-in ?
> >>> 
> >>> Replying to an e-mail is not subscribing to a service. It is the
> >>> author's right to know if one replies publicly to his e-mails.
> >>> Explicitly removing him from the C/C of such replies is a violation
> >>> of his rights.
> >>> 
> >>> On other words, it is implicit that, if you post an e-mail, you'll be
> >>> expecting actions or answers to it.
> >>> 
> >>> Now, if one really doesn't really want to receive e-mails from a
> >>> particular sender, a block list solves it. Alternatively, a way to
> >>> opt-out is welcomed.
> >>> 
> >>> See, this is different than adding someone to a mailing list without
> >>> his consent: On such case, people receive e-mails unrelated to their
> >>> preferences. For those, opt-in is the right net etiquette.
> >> 
> >> I agree with this.
> >> 
> >> But also just practically: if someone who opted out from sashiko emails
> >> posts a patch and sashiko finds say a critical issue, do we expect the
> >> maintainer to go and manually check each time whether the author opted
> >> out and forward the review?
> > 
> > I expect maintainers who want to act on sashiko reviews to triage and
> > verify them first before bothering authors, yes. I believe we should
> > follow the first two recommendations of the Software Freedom Conservancy
> > on using LLM-backed generative AI systems for FOSS contributions ([1]).
> > 
> > [1] https://sfconservancy.org/llm-gen-ai/llm-backed-generative-ai-recommendations.html
> 
> I think it makes the point of sashiko - helping maintainers - unachievable.

Why do you think so ? As far as I can see, there are many maintainers
and contributors with a strong enthousiasm for generative AI reviews.
Assuming those tools would give a net positive result, isn't that
initial mass sizeable enough to help maintainers ? It could even be
argued that starting with enthousiasts will help convince some of the
sceptics over time.

> If the point to not use LLMs in general, let’s discuss this, not how
> to make each use case more complex.

To be clear, that's not what I'm calling for. I'm asking for
contributors to not be forced to use LLMs. I'm not campaigning for the
kernel to ban their usage.

> It seems like [1]  expresses a very anti-LLM position in general, which I can understand and I agree 
> with some of concerns. But I think it’s up to project leaders to decide if Linux in general  takes this 
> position and my take so far is that the answer is not.

I would be surprised if Linus broadly agreed with [1] :-) I however hope
that we, as a community, have enough shared values to listen to
everybody.

-- 
Regards,

Laurent Pinchart
