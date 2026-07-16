Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC5A3793AD
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 20:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784235277; cv=none; b=AiVg9NfF38FS5tepuWjkGNQOvbWS+HIGqjx29XYmA+Vf+3IOFNrq+zktGfnqDFauKRXboJOsrzNKh3vWZjO54j7Z8j9ul1qSK96AIfyJYIUBOl4Q4NbfeeFnsHUsV+uExvjRLhMbgfRhlIcHGVu1aa88Gzeo3ztqHZ9Fvc7/0S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784235277; c=relaxed/simple;
	bh=pJ/3WBRsfAwjcbO4iM/Aly8h12otNDT4sL+votjuol4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJYNrbgRNMS5AQfVcUiJoggUh2Zohk2+DPMB339ykMhdMfAc3Zi0vUt8AACm7qfro7+G5QJKdcTLNN2jKnaCLN9mh/GgaSGtAKVNif4xnwYE49H1ZuH/tnsD4/JbPvvi8GOWE2ZMyw5AtCmkVXUnsVWUoL/gaWJr3M5I1rmgi+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=f7xoMoWS; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="f7xoMoWS"
Received: from macsyma.thunk.org ([151.240.45.27])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 66GKsIl7026627
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 16:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1784235260; bh=5sd2/fI6dhWdujKIVFzi12j261maCRe6c1gBh/vf4DI=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=f7xoMoWSd7vuo5cqM+A1Wk9rUeC1Rqxc6L37piob3hDCO7L076UbQ6wwj8/rJA99e
	 MHxv2Un663593juy3xJm2oZJCbvClLtr2m4eumnWxwvMm1HdJDlq0scVpxBLcz/qYE
	 abPS+vXzXgjEhQuj3nKlRN6Jdb+AK22SmUWbIoJoJQGGgCaKGrLEBr9Q9NjWrpf8ZP
	 YgqXjE/jtUgJnHTrUoQWIb8Pa2VHHivBqqq3gF4sSpwjV80vxpyytatPuXCAfFr3bs
	 0kl9gOLj7/GWYqtp8smJAlcZIazAm/un0cRPIRY0XiHrK9HNrbSxggZ+lLLYxat4Tz
	 wLBhWQ96cz9kw==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 4A78AA55278; Thu, 16 Jul 2026 16:54:18 -0400 (EDT)
Date: Thu, 16 Jul 2026 16:54:18 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: August Zeller <augzeller@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, users@kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <allD8zl_IzTAS7Nl@mit.edu>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <alcBvuIMEGSjAD1R@mit.edu>
 <20260715161111.GC1778116@killaraus.ideasonboard.com>
 <ale45QPntcwA-aLB@mit.edu>
 <20260715174138.GI1778116@killaraus.ideasonboard.com>
 <CAHk-=wiL7kFVWNtvE5S9A4iqXYat66NaUqX1+gZT0QCndi4eQw@mail.gmail.com>
 <20260715185141.GJ1778116@killaraus.ideasonboard.com>
 <CAHk-=wi7KN9_DYdmaE2chC92EhTrO=Wtx1bPBER-EQfAZ8FREg@mail.gmail.com>
 <20260715201301.GB1824265@killaraus.ideasonboard.com>
 <eab30fce0d18137800ce7a77ee1083f11aa1a770.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eab30fce0d18137800ce7a77ee1083f11aa1a770.camel@gmail.com>

On Thu, Jul 16, 2026 at 05:10:11PM -0500, August Zeller wrote:
> 2. On the other hand, it is also true that LLMs and derived tools are a
> comprehensive manifestation of the problems of the industry and there
> are valid ethical concerns regarding access discrimination, copyright,
> workload externalization, job loss, etc.

Also, there are multiple ways that LLMs can be used, and questions
about access discrimination, copyright, etc. are *different* if what
we are talking about vibe coding versus code review.

The original question in this thread was *only* about Sashiko, which
is a code review tool.  Making general arguments about all LLM use
cases is not helpful, and the policies that we might have for
reviewing or teseting code might be **very** different compared to
vibe coding.  For example, copyright concerns simply don't apply.

Can we please avoid conflating all AI use cases?  This leads to more
heat rather than light.

					- Ted
