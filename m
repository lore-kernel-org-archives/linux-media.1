Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A32E446044
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 18:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226286; cv=none; b=Zu8XcFATGV4b8BvLgXW0/I76JxOVtzhlTS2WqQrBDgvPXoUP5lGQTJgRksfAVT4b3UsFyB3ye0KiSYDBZy+jxWsUYwH3VRDec4Qi3YuUXD7FRGbBqdotklaQmeBfQfqCvbcAYIntL6+vDEivhSg4ad5i1YBwnfGfr1p9b4V0b94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226286; c=relaxed/simple;
	bh=hRR514Ctis5iRdYqHafnfYdOdDwfCi/AsI5jfXC5ATs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTcVzvrAyr7QGqabP0kvG9PfbMCTladmQWZqk4z5P7RoEnXNk1uTM8CNmcb52AbTuanpJ5EmlPyhyiuy7OpsB2p1xmPFASjCgCZJkctEB11ki+O0H/m39rsd2UaqAlfykN8pmq9f+earRVgLC0reKFjK8Arb+tM6QZrav1RLr+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=jV0vlT0f; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="jV0vlT0f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1784226264; bh=7gSh7rPR+wcXAzfxHYc4jsuFjpK1nLnEDJCvZqdJQag=;
	h=From:Message-ID:From;
	b=jV0vlT0f3Uh4pUldsQHNIblN+lxuhwSm5rQBdYQFlTqS7O7Fgn4roxfq1nFjilsob
	 vL7wIEp2yaw4+/fGIvvEweEQO9IujPhc4xEP+TTwt19OaUbdJmKbbxY9VUjr1G5O9T
	 zuYB2ljkpMac6Xu9VbtluL/tATl/UUlYfPA5ukNg=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 06BD7C0976;
	Thu, 16 Jul 2026 20:24:24 +0200 (CEST)
Date: Thu, 16 Jul 2026 20:24:23 +0200
From: Willy Tarreau <w@1wt.eu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jan Kara <jack@suse.cz>, Theodore Tso <tytso@mit.edu>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Derek Barbosa <debarbos@redhat.com>,
        Matthieu Baerts <matttbe@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>,
        users@kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <alkh1yOaG_rQlXdp@1wt.eu>
References: <87wlv2jq4t.fsf@linux.dev>
 <20260713095538.3d5e86f1@foz.lan>
 <20260713094120.GD1127719@killaraus.ideasonboard.com>
 <20260713220427.582b28bf@foz.lan>
 <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <alcBvuIMEGSjAD1R@mit.edu>
 <20260715161111.GC1778116@killaraus.ideasonboard.com>
 <j4jhhj6rw6kgem73slctakegtoirqmngbejbabfnfwtyshdlgp@itpaup6ghuod>
 <20260715202808.GN1778116@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715202808.GN1778116@killaraus.ideasonboard.com>

Hi Laurent,

On Wed, Jul 15, 2026 at 11:28:08PM +0300, Laurent Pinchart wrote:
> I feel that justifying myself against generative AI hallucinations that
> are blindly trusted by maintainers makes me feel diminished as a human.
> 
> No later than yesterday a friend of mine pointed me to a mail thread
> where sashiko referenced code that has never existed in the kernel, and
> the maintainer blindly trusted the comment and asked the patch author to
> fix that issue, seemingly doubling down when told the code didn't exist.
> 
> Depending on one's beliefs, this can be easy to brush off, but such
> incidents can easily make you question your value in a community where
> maintainers would by default trust sashiko over an experienced
> developer.

I think these ones will resolve by themselves as people get used to
trusting the tool at different degrees. The mistake in my opinion is
to see it as a tool, while LLMs are made to imitate humans. If you see
it as a limited human that can tirelessly work and verify stuff, you
can understand that it will sometimes bring some value in certain areas
and not at all (or even be negative) in others. But just like we've had
trolls or people with uneasy personalities in the past on the list that
were also doing some work and whom some readers just learned to ignore
or correct, here it might become exactly the same. Maybe sashiko itself
will be tuned to speak less confidently to authors so that they don't
take everything it says for granted. IMHO it's a matter of everyone
adapting with a certain degree of trust/mistrust.

But I do respect (even if I don't share all of) the concerns you expressed
regarding your beliefs and/or the impact of cost raises (that currently
doesn't affect the tool). I'm only speaking for the point above about
the possible social impact.
 
Willy
