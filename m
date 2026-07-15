Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CFE446854
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 20:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146387; cv=none; b=Rfhus7PoFGR1HXnzGWWq+yh/IzbIOyrpINiYERZEw15KUcvFOpa3vW+2Rq8Cyem4BhYAoMWbMYAsxCmiv3YQbuvK6twdglqdfGeVm0sQ/pRerGQt6uAXfXyftAPex+CzzNubVVZH0Fpx/b899enVI+8So0wEHjXR1iZCWLw/95Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146387; c=relaxed/simple;
	bh=VAZR3TwvECAloxb0OVVEvPjXCMzItmrxti3B2map6ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kvimil2X2a9Jzh98b/mFrcCMkpNbt7imYLK39amltEqvkghlwplFj8fLD7cQY6bDOeSGJKpSTQrniBcSOK4AoNhSmKVhN45RXMq1Oyhs+VyFViHH6KhHOmfPlz+VQQYsU4iD5L6nuIVZQcN2nSmJBYHwAUJ/UZruOMt1gN2TF6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nEW04Z9g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nEW04Z9g"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 677A1267;
	Wed, 15 Jul 2026 22:12:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784146327;
	bh=VAZR3TwvECAloxb0OVVEvPjXCMzItmrxti3B2map6ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nEW04Z9gBluTfS3SXR3FrPQOM3HpO4Ut0CS041Mds+7XbZk7HVT6L+1aUKNwlvHxa
	 YQ/MujfCzs/JkMsTLrighf4/sOPTOhArXv+3256V7m8Se0woc7Ot7GHOE/JSOQxDxx
	 jHN6OyN+7G+jbNVS/1FB11piXtgzasudqf2ruZs0=
Date: Wed, 15 Jul 2026 23:13:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Theodore Tso <tytso@mit.edu>, Roman Gushchin <roman.gushchin@linux.dev>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Derek Barbosa <debarbos@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Steven Rostedt <rostedt@goodmis.org>, users@kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260715201301.GB1824265@killaraus.ideasonboard.com>
References: <20260713220427.582b28bf@foz.lan>
 <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <alcBvuIMEGSjAD1R@mit.edu>
 <20260715161111.GC1778116@killaraus.ideasonboard.com>
 <ale45QPntcwA-aLB@mit.edu>
 <20260715174138.GI1778116@killaraus.ideasonboard.com>
 <CAHk-=wiL7kFVWNtvE5S9A4iqXYat66NaUqX1+gZT0QCndi4eQw@mail.gmail.com>
 <20260715185141.GJ1778116@killaraus.ideasonboard.com>
 <CAHk-=wi7KN9_DYdmaE2chC92EhTrO=Wtx1bPBER-EQfAZ8FREg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wi7KN9_DYdmaE2chC92EhTrO=Wtx1bPBER-EQfAZ8FREg@mail.gmail.com>

On Wed, Jul 15, 2026 at 12:14:47PM -0700, Linus Torvalds wrote:
> On Wed, 15 Jul 2026 at 11:51, Laurent Pinchart wrote:
> >
> > I consider that, today, there's no ethical justification for the use of
> > generative AI in FOSS development.
> 
> So this is where the discussion ends.

You've cut the rest that says

  I don't expect everybody to agree, I'm not trying to change the
  opinion of the overall kernel community here, and I'm not asking for
  sashiko-enthousiastic maintainers or developers to stop using it.

I think that's relevant.

> As I mentioned, Linux has never been a social warrior project.
> 
> If you don't have technical reasons, you don't have reasons.

You have accepted

commit a5f526ecb075a08c4a082355020166c7fe13ae27
Author: Dan Williams <djbw@kernel.org>
Date:   Fri Jul 3 23:54:35 2020 -0700

    CodingStyle: Inclusive Terminology


That commit shows the community can take ethical issues into
consideration.

> You can choose not to use AI, but that's your PERSONAL choice.
> 
> It has absolutely no impact on anybody else, and you should not expect
> it to have any.
> 
> Put another way: if you are vegetarian because you think meat is
> murder, that's perfectly fine. I know for a fact we have several vegan
> kernel developers, and I'm sure they have varied reasons for it. Maybe
> they just don't like the taste, maybe they have social or religious
> reasons for it. Lots of perfectly valid reasons, possibly driven by
> ethics.
> 
> But they don't expect the rest of the kernel community to become
> vegetarian because of their personal ethical standpoint, do they?

And I'm not either, cfr supra. What I'm asking is to not be forced to
eat meat (in the metaphorical sense only).

> This is absolutely no different.
> 
> And yes, I feel very strongly about this, not because I feel strongly
> about AI per se, but because we have a long history interacting with
> the FSF.
> 
> They have their "ethical" reasons too, and use them as a weapon, and
> as a way to drive away sane people.
> 
> It's why Linux is *not* GNU/Linux, and why we call things "open
> source" instead of "Free Software".
> 
> So keep your ethics where they belong - in your personal life. Don't
> try to enforce your ethics on others.

The mail thread has grown long, you may have missed the multiple places
where I have explained - or tried to - that I'm not expecting the rest
of the community to abide by my personal convictions.

-- 
Regards,

Laurent Pinchart
