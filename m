Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B3827A92D
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 00:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784077160; cv=none; b=Wk+NMjuEgJERFd4GcQi6XNZaijKBnFSEEbkRXuvm1xyyEGTuZXfGvDLLb2uHMrAg0Tr8QJ9R+nGx4fmMZeZY08hai72LJRgbyskkkRd45gYA0L/VwQgqy4c8TJVyrsliMl92VYU46DVR50X6Hg8DukXInfM8cgICcSLRCjZkKc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784077160; c=relaxed/simple;
	bh=aCX0+CU46y6a32uCiBYa5efv5AprKSOP+I14jS+zYWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjNZR/UmxItaZ9ZQlVx0ujdYP3DHZtnsujByStVAKvNZGOyVr7WbTw7aB9eN/ikPHeIoQXEZRRMOzAqv3KNai+Sl5WyrNmAWnSEgdRsrvlli9asM1Fkuv2h1fAP/tg4hq+PpMTATSzJMX7KONlnzKsPU/SoJ76NbCJyt1DsHvPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CFJ5cE8E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CFJ5cE8E"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25CB1104C;
	Wed, 15 Jul 2026 02:58:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784077096;
	bh=aCX0+CU46y6a32uCiBYa5efv5AprKSOP+I14jS+zYWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CFJ5cE8EDntWHr4ULuXSi4ZaI3mdJOmUJccNI5fnO5wGSeT91ro8OU+EjcaDjuI8/
	 +ErAeyET3TP+PcIH+UblecdpIPFi+x/XwrZXa6WprBm1ZzaGBRFAQSDTOLY/i4pc5y
	 5gWXY8xyagBJUNf+TZyd/a5VX6z6G8B9HwIAWAUk=
Date: Wed, 15 Jul 2026 03:59:09 +0300
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
Message-ID: <20260715005909.GF1656185@killaraus.ideasonboard.com>
References: <20260604085201.177ad537@foz.lan>
 <20260607195656.02788791@foz.lan>
 <akQlPSNfGEllNVhe@debarbos-thinkpadt14gen5.rmtusma.csb>
 <20260710074528.5a6e4457@foz.lan>
 <20260710083845.23c753ca@foz.lan>
 <87wlv2jq4t.fsf@linux.dev>
 <20260713095538.3d5e86f1@foz.lan>
 <20260713094120.GD1127719@killaraus.ideasonboard.com>
 <20260713220427.582b28bf@foz.lan>
 <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7ia4mrvtrxjl.fsf@castle.c.googlers.com>

On Tue, Jul 14, 2026 at 10:55:42PM +0000, Roman Gushchin wrote:
> Mauro Carvalho Chehab writes:
> > On Mon, 13 Jul 2026 12:41:20 +0300 Laurent Pinchart wrote:
> >> > > Individuals can set their
> >> > > spam filters up if they don't want to get these emails, I can't control
> >> > > it. Providing individual authors an option "I don't want my patches
> >> > > to be reviewed" sound strange to me. It's like "I don't want my patches
> >> > > to be tested by unit tests".  
> >> > 
> >> > I agree with you, and, on my head, not sending e-mails to the author
> >> > is a clear violation to one of the most basic net etiquette rule on
> >> > mailing lists: any replies to posts there should reach the author.  
> >> 
> >> I don't know where that one comes from.
> >> 
> >> What happened to this other "most basic rule" that subscription to
> >> services that deliver e-mails should be opt-in ?
> >
> > Replying to an e-mail is not subscribing to a service. It is the
> > author's right to know if one replies publicly to his e-mails.
> > Explicitly removing him from the C/C of such replies is a violation
> > of his rights. 
> >
> > On other words, it is implicit that, if you post an e-mail, you'll be
> > expecting actions or answers to it.
> >
> > Now, if one really doesn't really want to receive e-mails from a
> > particular sender, a block list solves it. Alternatively, a way to
> > opt-out is welcomed.
> >
> > See, this is different than adding someone to a mailing list without
> > his consent: On such case, people receive e-mails unrelated to their 
> > preferences. For those, opt-in is the right net etiquette.
> 
> I agree with this.
> 
> But also just practically: if someone who opted out from sashiko emails
> posts a patch and sashiko finds say a critical issue, do we expect the
> maintainer to go and manually check each time whether the author opted
> out and forward the review?

I expect maintainers who want to act on sashiko reviews to triage and
verify them first before bothering authors, yes. I believe we should
follow the first two recommendations of the Software Freedom Conservancy
on using LLM-backed generative AI systems for FOSS contributions ([1]).

[1] https://sfconservancy.org/llm-gen-ai/llm-backed-generative-ai-recommendations.html

-- 
Regards,

Laurent Pinchart
