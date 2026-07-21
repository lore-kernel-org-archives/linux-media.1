Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD39823DD
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 19:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784661310; cv=none; b=dYUHnrfn85IznZcq44pT1IzdnbNGAE4K0vA4PFsL39qMF7z5umt9uP3jpAuspIPwQ2oadBuHH31/HDe+f3rDLTdiiYwoUV7AVjxHwC9YXuRp94kILVjjdbgKMLvheAyVochmWgOYY8JISOUp8LnndAA8lTzfot9NqbnfQ0T+OXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784661310; c=relaxed/simple;
	bh=o/LkGKhm+PQu6JZN8bDLNOMVzCT58EhCcJssTTJSiMo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dhkPoX/olSgSyn7FfGRtUfUKa/NvH1xhHE+V3oh0ldl2uhoV44TsP1K8WoY0RBLesxzk6FIq4DRC4oi8gPDnJDslADcvaMkIkQJ3NENRWgfBhT+lRCxBXy54ktL6aMKwHBw8n3KD3si428CUA/DofhRFA1EkbOADep7enYzHeXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf14.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 199E8140288;
	Tue, 21 Jul 2026 19:15:01 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id 846953B;
	Tue, 21 Jul 2026 19:14:58 +0000 (UTC)
Date: Tue, 21 Jul 2026 15:15:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Brown <broonie@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Theodore Tso
 <tytso@mit.edu>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Roman
 Gushchin <roman.gushchin@linux.dev>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Derek Barbosa <debarbos@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>,
 Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260721151517.42674981@gandalf.local.home>
In-Reply-To: <c349b75c-556b-4f70-a243-f44fc04a0684@sirena.org.uk>
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
	<c349b75c-556b-4f70-a243-f44fc04a0684@sirena.org.uk>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: kegh14gaus45s4k1g3fo8xfzu9griwtr
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 846953B
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19dat/8/pK8ThJM+09/gC01MBAlCPUBwqw=
X-HE-Tag: 1784661298-158482
X-HE-Meta: U2FsdGVkX1/PGgkwmSI4Wss2trAURqcAH6WCsC6KoHmW8gRdu6wOgnII/o37rST/Os8sccgGsstKqrKnhdTIljPb++CjJTuwPC6nSxVLPx0vvrPE7Pj7/h4JhubcT2k66/NfGI121pNKkV+eIg+qSoHOkUrkIpXR4TApg/qdAnIHeVAWjVNS+IFhu7QON+9RO59eKLX4R907u+7FcDIEzUeKSgLHTqa0OuvTCz1vps1XKPuz1JHzC+bo/pHn1LSqp/seVtXO6eBmvznWeeehLrD012mUaAsjdNvB3Q9QEIxySwahTgPbmwQmiTdlUHebfLdPI0YQJYRmFPEiNao2I86NqMmwa4b/

On Tue, 21 Jul 2026 17:42:51 +0100
Mark Brown <broonie@kernel.org> wrote:

> > Is it too complicated? Do you mean it's too complicated if one
> > sub-system says "resolve all Sashiko feedback you receive" and another
> > is "You may ignore it"?  
> 
> I mean that "use AI" covers a huge spectrum of things, Sashiko and
> potential requirements for submitters to interact with it is just one
> example of LLM usage.

I was thinking of just having two options, each with various levels.
Option one, if AI is allowed to write algorithms (I mean something that is
enough to be copyrightable), and option two, if AI will be reviewing the
code you send. Yeah, the second is for those who are completely anti-AI and
want to avoid having any communication with AI. But then again, do we
really care?

> 
> > We probably don't want maintainers to require resolving all Sashiko
> > reviews, but at least respond to them. Where "I don't know" and "I
> > think this review is wrong" are legitimate responses. It is basically
> > saying "I want to speak to a person" when drudging through the phone
> > automated AI teleprompters.  
> 
> People were complaining very strongly about such requirements elsewhere
> in this thread, especially given it's propensity for warning about
> preexisting issues.

It was also mentioned that the pre-existing errors should be separated. It
shouldn't be bother patch submitters with them.

-- Steve
