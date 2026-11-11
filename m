Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406922;
	b=pdl8jt96jJdKIuBOBTV+hjDXV0NjNxDYvNZHxf4drhl9giTZkqS/2/Guj4TGFSfEG/cI
	 TYmyFMyZ/Zxh2RH3b27E+ANG7a2vwJGUrNmdsVOJTQW/5LNDiiEySOPhE5dDcURT6c2jP
	 e0ezEkibUGpxSaHh7xMIivq53FljMZcwih253fAFyJNAgDkNJTEd1gSmCyuIpPGzQ6CJg
	 3w39LxIC45IQUchyxcxB5oKdtjhfVAZ33uJ5HHeTm580jZ9LwKz4miYa9na2hoeJ1aV/C
	 48tuhdCqAB3Qgwwg4KnzuzXGruBS1NjzLaIMOt8JFNWYzvD2YAp828Cp++9iFIPVVVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406922;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=X64+esIJqu6yPctO8xBViHgFfvpIfI1g3WYK021K2Ho=;
	b=Upp8QBH3t00ttf5ehEgwNIrOpoyUPTmq4PeYv1cqgewVsYvi273+1URKi63ZfR4YEEM0
	 /6Mtpf+ClrC5RDjStdmC+xHfiBzMVZNmBNcPybnaFL/os/b1k/2t3yKnxrNEoxEORFDi/
	 4MHFfQtb3BBdu5xvvb08uf4DXH79cUhAb9qr3FvWbmgTwq8z1LPSeoX9VLPzTYfnXZ6jv
	 XSk7V0/PqLzIaTxlPWaLwXVOadszw9DU3lzhoPdgm1Oj+T8v0LbUhm+p4CNRMrABd8pr1
	 viwHJ9xDe3HsOKCkoEamq4ypYpyrtvel0kyzOovdZhl4yCvTNaem/cfXlM8W48s65UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=HQ0Ux0Fy;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ED5606A326
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 14:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51ED5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=HQ0Ux0Fy
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7002EBB;
	Wed, 11 Nov 2026 15:19:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794406776;
	bh=/gCP3Zh6m6WNRuDdrJWa8xduFB83Oq7GWiF7daWtdxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HQ0Ux0FyyS9FJbOYjyXqx8ILoF4ImntZzfHd0ydA3SkLPJ7hUB57jKcpU9kN2Njz9
	 yXUfWuYhn/SJaNJXJnggdqnD78FY1U2dqZOzoqkq3p7NeKXyro+luPHZFg7S7gMWex
	 smyhIgfv2NYiMZw3UDrAGbG+WW9XXQ6Qo1gXSgKU=
Date: Wed, 11 Nov 2026 16:21:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [RFC] Media Summit 2027: one or two days?
Message-ID: <20261111142158.GA192350@killaraus.ideasonboard.com>
References: <adeb9e3e-ba93-420f-a9c6-f56a7d3b6bbf@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adeb9e3e-ba93-420f-a9c6-f56a7d3b6bbf@kernel.org>

Hi Hans,

On Wed, Nov 11, 2026 at 11:12:00AM +0100, Hans Verkuil wrote:
> Hi all,
> 
> I propose to again co-locate the Media Summit 2027 with Embedded Recipes:

Thank you for taking the lead in organizing the media summit once again.

> https://embedded-recipes.org/2027/
> 
> That conference is on May 27-28 (Thursday and Friday), again in Nice, France, but at a
> different venue.
> 
> I have three questions:
> 
> 1) Should we use the same meeting room again in hotel Campanile? I really liked that meeting
> room, and the price was reasonable. It is a 20 minute bus ride from the new ER venue, so
> that's not too bad.

It was convenient. The main downside was the very limited interesting
lunch options around, so we may end up in the same restaurant again.
It's not a good enough reason to move to a different venue, so no
objection against the Campanile.

> 2) Should we do a two day summit? The Media Summit from this year really had too many
> topics and we had to rush at the end. So either we stick to one day and I have to be
> more strict with regards to the number of topics, or we expand to two days, but keep it
> shorter (e.g. start at 10 AM, stop at 17 AM or earlier). Stopping earlier also makes
> it possible to split off in smaller groups if there are specific issues (not directly
> part of the Summit) that people want to discuss.

This is a more tricky question. Two days is a lot in a crowded week. I
understand that Embedded Recipes will be part of an "Embedded Week"
again next year (and this overlaps with the third point below).

We definitely ran out of time last year.  I'd argue it was caused by not
just the number of topics, but also their nature. There were quite a few
topics that were of interest to only a very limited number of people in
the audience. Part of the trouble is that there are a few core people
who are interested in most topics, so splitting in two groups for half
of the day would likely not be a great solution either.

I wonder if we should try the LPC style, where sessions focus on
discussions instead of presentations. Some of the topics this year had a
long presentation for limited discussions. This would require topic
leads to submit the presentation ahead of time (with a very strict
deadline of at least a week before the event) in order for all attendees
to have a chance to read through presentations.

This wouldn't forbid presentations completely, I think there's still a
need for them for topics that aim at informing the audience, not
gathering feedback.

> 3) When do we hold the summit? I.e. for a one-day summit do we pick May 25 or 26? For a
> two-day summit that would be May 24-25 or 25-26. I suspect there may be workshops on the
> Wednesday (May 26), so keeping the Wednesday free might be better. Nice is not the worst
> place to spend a day :-)

Yes, there will most likely be workshops, and we need to avoid
conflicting with them. I expect we'll organize a libcamera workshop
again. We need to align the agenda with the Embedded Recipes organizers.

-- 
Regards,

Laurent Pinchart
