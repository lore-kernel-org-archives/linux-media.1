Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E7A3FCB10;
	Tue, 28 Jul 2026 21:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785273682; cv=none; b=tbkbKTu2Er5QBowJRqQKjd4o0ogMRUX5xYJOIqIxlgk6xBOqYbM+zdPaLNMvCaqKLuBrwuV+Nkw6m/1TwxclbiqK5yfSUh5rweIRkThOtGGqqi20E5+zPjwC4VIBjF5lFW056ufq+v5OIEWuSsPHSF3YTOVPSwzeGzIT7BD4RPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785273682; c=relaxed/simple;
	bh=Srrl7wk8ZS7C7yj5dgZkLHAtIulRQn1GxUyv1FqS938=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UM1M7YWIuY3v/W2KDTpJnHT9RxutKglkV10E9KV5vHxXqHkPGFDU3PbKqP26yKl2v8uY1TezuYHeccCFCTkU04EBAXPalZwrbhpMdGTeBEUeFh1mrVs7ZIrgiZYYH1W+HGEVQUmx+zen1yhNsy9A3btVKGvKfl1dZKfCKNqas74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NN02Vwij; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NN02Vwij"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6916240430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785273679; bh=N+tREFikhTzGP5Sp5+shjkryH62wM0kw8ouIHCWG3Xs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NN02VwijLLCY4EH1MPABKgZg2ecJKfh9FpPSb9G7NGbFlbZ0gMfAbOXt9a2YPDOhW
	 gwE8072rJF+WNQgqNvymGNbDf1jGU78zA1sGrSmRY9e8gYuHKhwPq6uYfgH2K3kTwl
	 hp/aOIsPtrZ0yE+bLJ8pHqnQQ57Av5p7dPY0xL3AGWlILevJvM3lZM7Vv7994dnHKs
	 h5v2dwCX1jud78b5BFx70umM0ZDuKe3mZR+xf+Bz3GriRZd0xttmw5k9ISSvSVpFqP
	 n/RwAcfcPJ5qceCMYnAXHSN5Brb8zb+YCDf1LOYnw6v30zZeyu2innoPYYEBn8yyNK
	 co8rchO5OJRhg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6916240430;
	Tue, 28 Jul 2026 21:21:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Daniel Lundberg Pedersen <dlp@qtec.com>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH 0/2] docs: make tables responsive with content-aware
 column widths
In-Reply-To: <DK78KJA4LEAN.2H4O5BZN6H8LK@ritovision.com>
References: <20260724214249.23830-1-rito@ritovision.com>
 <87ik646lfc.fsf@trenco.lwn.net>
 <DK78KJA4LEAN.2H4O5BZN6H8LK@ritovision.com>
Date: Tue, 28 Jul 2026 15:21:18 -0600
Message-ID: <87wluedd4h.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Rito Rhymes" <rito@ritovision.com> writes:

>> So I will look at this in more detail in the coming days.
>
> Thank you, I look forward to the review.
>
>> this is the injection of a bunch of complexity to solve a problem that
>> nobody has complained about.
>
> I don't believe that aligns with the reality, Jon.

So I have spent a while looking at this change and playing with it.  It
hasn't really changed my feeling about the whole thing.

You speak repeatedly about rendering on browser windows of widths less
than 500px.  Who uses such a window?  The last Nexus 1 holdout I knew
gave up years ago.  I would want some sort of indication that this is an
actual use case - one with unusually silent users it seems - before
trying to address it.

I really don't like the 40-classes hack.  CSS makes us do some painful
things sometimes, but still ... again, I would have to see that there is
a real use case before even considering it.

Just setting max-width doesn't do what you want?

I will listen to what others have to say and, if there is a clamor for
the inclusion of this work, I'll consider it further.  But, as it
stands, my impression still is that it adds a lot of machine-generated
complexity that humans will have to maintain going forward for a problem
that nobody has complained about.

Thanks,

jon
