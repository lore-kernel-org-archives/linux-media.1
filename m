Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9490B3AEF49
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 17:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135728; cv=none; b=uFx66VtP5yYFFwzTX+qtB5ew++LBWLAZU1Ix1hw8Rjuy6uYlDh5vl+dm9BTcgxfHJLLe7ggResq7Ojk6kYRuZjZrLDyTDD5TVU+W7sacKFZead/APGea+i5WCeDltrq7xCSnMvIWndgI+y5ClnnuZ00JFhgMJqtyNQgCyWhha74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135728; c=relaxed/simple;
	bh=jgrjtnUlepLmDTk9jJGlmbx9EOD70c1fXRuZS93lDKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7Q35AxT3nZtIeB5SF8Gvd0ev93rVUhAljTlAiQI/T1/dK4uuGGhroRyy3n+S5vqPBfz7Xd9NzHmrPIhsm8We9wRA0aus35TAzNCv3Iwx3NGeB355pFrUqy3Kvsihu6k+6QyHmAdFCwz3pyW50WwKt5dJ2fiMx3Q12OMSAmKTCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=aMdDAxL/; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="aMdDAxL/"
Received: from macsyma.thunk.org ([151.240.45.27])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 66FHEvfI023544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 13:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1784135701; bh=NfNVE1/OD36Hn2NGt6W/NSdsYcdTQq6dj4bpB21MVT4=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=aMdDAxL/E63qW3PVHKVYPMZAHHptpjztHclve4e+BUzgI4AFyD4QtBe0+lOLd4wOp
	 rKC2rdFYukUFroQJdkMjScj4iu7wzhNuqTgZvbVwK+4aAYpLpBctzOMhydLzGRdVKv
	 t6jbi29ADvrRAKzFrevzuvHi7WQvhcCkx403nVZvlyMhZIVmBgwU8da24edtcu5edB
	 Xbjtip3WYPSzmH5Wt5QX40VeR1TTzLAN6gi2RLrYStDLVBkTR5q0duu32KOL3n9FcD
	 tAmN3tL3OCQUBz27HjtGGKQ53svn1dwLObmCjpeEFp2bRkbvIa5GWR0Aj60QibxBKE
	 DxyD4brUoknmg==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 8761CA2F3E9; Wed, 15 Jul 2026 13:14:57 -0400 (EDT)
Date: Wed, 15 Jul 2026 13:14:57 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Derek Barbosa <debarbos@redhat.com>,
        Matthieu Baerts <matttbe@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>,
        users@kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <ale45QPntcwA-aLB@mit.edu>
References: <20260710074528.5a6e4457@foz.lan>
 <20260710083845.23c753ca@foz.lan>
 <87wlv2jq4t.fsf@linux.dev>
 <20260713095538.3d5e86f1@foz.lan>
 <20260713094120.GD1127719@killaraus.ideasonboard.com>
 <20260713220427.582b28bf@foz.lan>
 <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <alcBvuIMEGSjAD1R@mit.edu>
 <20260715161111.GC1778116@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715161111.GC1778116@killaraus.ideasonboard.com>

On Wed, Jul 15, 2026 at 07:11:11PM -0500, Laurent Pinchart wrote:
> My interpretation (which conveniently matches my opinion) is that
> developers should not be forced to directly *use* generative AI tools,
> and should not be forced to *process* unfiltered output of those tools.

But maintaineres should be forced to process the output of those tools
because the developers refuses to do that work?  If someone refuses to
use the unfiltered otuput of those tools, and their code *is* buggy, I
may not have time to cater to these people.  In which case, if I see
that their code is reliably buggy, and they are refusing to look at
the review from the LLM (or the zero-day kernel bot, or
checkpatch.pl), I reserve the right to just start ignoring patches
from those people.

> 
> I don't think I have called for that. What I believe is that triaging
> LLM reviews should not be forced onto contributors.

I don't believe that triaging LLM revoews should be forced onto the
maintainers.  Remember, the contributors outnumber the maintainers, so
forcing more work on maintainers don't scale.  One of the reasons why
I was so excited for Sashiko is that it reduced the load on
maintainers, while improving the quality of patch reviews.

> Flipping the argument, should contributors be obliged to do extra work
> that make them feel diminished as a human ? I'm talking here about
> justifying themselves against LLM arguments that have not been analyzed
> by a maintainer first.

Nope; but I don't believe I'm obliged to accept contributions from
people who feel that way....

						- Ted
