Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1104334DC
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 17:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784741647; cv=none; b=ZIvHasgsjCHgyKZW5vG5GJs6c4oJlmPJ3cbDCrhsVP1s4MrG7bx6QA2+MuSD7AXlLliymDfnYzEwnmrBPyYxjcZ+6pq/QXHIdVDURZl2f/8rfhegaiQQQ4hpxnpM7zX1at4i+5OP+hK9QSgbzrHFkSbhu57q6SMAr2aW3jKWQkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784741647; c=relaxed/simple;
	bh=8xlIPfJ+ChrZ8UwU5QYPS9K3pxjgNVYdKnhAzoEm2+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaEIwVur5f++k3FjChIVDoFCp/xC4HYMcpO63ZK0X8DOB+yQuJ5o0W4Qkfk6xsMR4ZNbWDHRE8kBtSNM/8PqVVtObWN3ntX65oXwfGuQlTequ+fGiYDwpA7bcguChJU46k486VaQzETEBzUyYCLpGwAFU6oabCau1hcBc11ATk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=pLdx2JbB; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="pLdx2JbB"
Received: from macsyma.thunk.org ([104.135.218.222])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 66MHXVNr027167
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 13:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1784741616; bh=W7CFE+0Q3AYiv3JHJ3zwCj9PvQyvsnuxfziUF4oH4mE=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=pLdx2JbBmFDActUL41ZT2s1th26zwVaZjnEGuE/sDLisQSVG2v2FFaCXl+/l9fDxp
	 TGbGnsdjpsQ01FoMuOFy1DCs+di4I1uPVhc9gt9eTFVpv4hsIUnlu4ueMLXd02NLO5
	 PaDxxzeBt50TGvGcBdrmwJbLgejFdMwzDK1mEbtMLYxZ7Z6xbRtcO02TO/cygKqsfK
	 NrnJb3SfnPASxcA+tcTFyElUMNSfNS3aIvMQpQpLdOyWp1YYqJBZNW7h0OUCDpz9ed
	 ltKzy79mWIV5mDtDQDxx8O4AZK7DqptDBGRA/QUiOoz+68d94GyzQ10zWnUdwpkoes
	 vB+HtYFN5xxdw==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 23B59BAB4C1; Wed, 22 Jul 2026 13:33:31 -0400 (EDT)
Date: Wed, 22 Jul 2026 13:33:31 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Derek Barbosa <debarbos@redhat.com>,
        Matthieu Baerts <matttbe@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, users@kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <amD6YEiOp7KkSMzu@mit.edu>
References: <alfBvhZkAelq5RVf@mit.edu>
 <aliMsSH373RJ31Mq@zed>
 <aloZ9hqSgzN3beqH@mit.edu>
 <20260717152559.2d2bfc8d@localhost>
 <20260720095537.4d5d503b@robin>
 <ce1df91e-0674-4861-90ff-bcaf5428b414@sirena.org.uk>
 <20260720142432.288b0433@robin>
 <c349b75c-556b-4f70-a243-f44fc04a0684@sirena.org.uk>
 <20260721151517.42674981@gandalf.local.home>
 <b68a3c0a-6894-4f51-ac98-a28912ee2c82@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b68a3c0a-6894-4f51-ac98-a28912ee2c82@sirena.org.uk>

On Wed, Jul 22, 2026 at 03:51:41PM -0500, Mark Brown wrote:
> On Tue, Jul 21, 2026 at 03:15:17PM -0400, Steven Rostedt wrote:
> > I was thinking of just having two options, each with various levels.
> > Option one, if AI is allowed to write algorithms (I mean something that is
> > enough to be copyrightable), and option two, if AI will be reviewing the
> > code you send. Yeah, the second is for those who are completely anti-AI and
> > want to avoid having any communication with AI. But then again, do we
> > really care?
> 
> There's a whole range of things we could mean when we talk about AI
> reviewing things - are we expecting the contributor to deal with some
> specific tool, will other people happen to use LLMs (with or without
> disclosure that they're doing so)?

I assume that we're talking about the case where the contributor is
given an AI generated review.  (e.g., an e-mail from Sashiko).  The
complaints here have fallen into two categories (1) sometimes the
reviews contain false positives, and (2) the fact that an AI bot is
criticizing a submitter code, even if it is true, somehow demeans the
humanity of the patch submitter.

In the case of (1) those are bugs, and we should work to try to
improve the kernel review prompts.  Roman has recently checked in
changes to reduce false positives in the media subsystem, and I've
reported a bug for a false positive when reviewing an ext4
contribution[1], which has since been fixed.

[1] https://github.com/sashiko-dev/sashiko/issues/357

In case (2), I don't have a lot of sympathy, especially if the
solution is demanding that the maintainer rephrase the Sashiko report
so it's coming from a human being instead of an AI bot.

If we're talking about other people happening to use LLM's, presumably
for code reviews, I'm not sure we need to report that.  After all,
copyright can't be implicated if the LLM is pointing out a problem in
pre-existing code, or in a patch, since LLM generated code isn't going
to end up the sources.  And if someone else is running a review, on
their code, why should the contributor care if it wasn't disclsoed?

I suppose if the NSA or GCHQ runs LLM reviews that finds that some
patch would introduce a zero-day bug, if they choose not to disclose
it, that would be sad.  But that's probably happening already, whether
we want it to happen or not, and there's nothing we can do about it.

Cheers,

	  	   	      	      	 	- Ted

