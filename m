Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774C346D54A
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 16:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649834; cv=none; b=Nj2dJNZe3vK4DYjWnXRfccC6B6d/lU+9W8OeGvT/JUW2z7CGEvprsWF/t2sGpP2Koqi+OEbPXYlXsGNyuzoevJFmb11rtu1Ig9gHaUHnsM0KQ2hfpx90+/dgSlKjaOrCXz7WDOoE3MwKePjgE5bh9Xyl2BNE1a0EuoSkzDK1n3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649834; c=relaxed/simple;
	bh=Kxnw4Na2pOx89/0IREFLqdz0u9HnEDzpOqIGsseKmgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGw/TjU7c5L2dkqlEXvnEin9RUmtj8SLopl2uF8CwT2G8tYLNPQ6c3PpHZKzJ3fAARtDtX2ihBZo+YQIXpUrqZjgZSHK2sjwjV5QOt+AbuC98M5x3K4fOTCBmSJvQDwAmHGN6cGjR3MC4Hu5WLdUdMwGAA+xWPCBdP+Btbtm8L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=szvTlNKW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="szvTlNKW"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29798517;
	Tue, 21 Jul 2026 18:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784649772;
	bh=Kxnw4Na2pOx89/0IREFLqdz0u9HnEDzpOqIGsseKmgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=szvTlNKWULS0aBnlYbI/JhNK7qk+0vnrZ6i8U6C90NMRMPRSPG+y5WNNeEony1eig
	 KVxvlJfAeC900ywcUYEIndZUKQvT/JHFCTrv+26/J3zU2rTCOdKhJpjXCytKy8sGGs
	 DtKHvUUBYr87qhvzYWinOqaeJJo+lum/WuVViOIg=
Date: Tue, 21 Jul 2026 19:03:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: August Zeller <augzeller@gmail.com>
Cc: users@kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260721160350.GD536385@killaraus.ideasonboard.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eab30fce0d18137800ce7a77ee1083f11aa1a770.camel@gmail.com>

On Thu, Jul 16, 2026 at 05:10:11PM +0200, August Zeller wrote:
> The frustrating part of this situation is how everyone arguing on both
> sides is right in some way.
> 
> 1. The tools work, yes. This used to be up for debate until recently,
> but now it's clear that AI can enhance contributor *and* maintainer
> productivity in the kernel if used correctly.
> 
> 2. On the other hand, it is also true that LLMs and derived tools are a
> comprehensive manifestation of the problems of the industry and there
> are valid ethical concerns regarding access discrimination, copyright,
> workload externalization, job loss, etc.
> 
> 3. However, a "no AI used" policy is unenforcible. Many people would
> use these tools regardless without announcing it, which is the worse
> outcome. If we're transparent about our AI usage, then at least
> everyone is aware and can treat the affected code with the right level
> of scrutiny.
> 
> 4. Moreover, a "no AI used" policy isn't the best thing to do
> technically, as AI has proven to be very useful to catch bugs, review
> code, and even write some new code. Some critical bugs that we could've
> caught with AI *will* slip under the radar if we refuse to use those
> tools, while bad actors will gladly use the newest models to find
> exploits.

I don't think there's much disagreement on all that. I'm not aware of
anyone trying to get the kernel to adopt a "no AI" policy.

> Overall, even though I've been known as a great AI skeptic in the past,
> I'm with Linus on this issue. *Accepting and embracing AI may not be a
> desirable thing to do, but the alternative is even worse.*

-- 
Regards,

Laurent Pinchart
