Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B97233938;
	Fri, 24 Jul 2026 23:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784934157; cv=none; b=uu1QMNDEIQYK/bk5ef6p8Bx6b6+0Y2bxUq2KcT1BuAsUxQYOKnKrmj3/LiNdINUa8tjv910qp5s9mqePzyy/FfouA5RpGyC2oaEeU9DXLcfQlwJA4nZVjuYFoNjtnbyCIH4JC7sGEU36iSJNvTnIABWu7Z5LM7F7LBPpO2ySoKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784934157; c=relaxed/simple;
	bh=FTnOMWflHGb2DcaV8KdTZwAfIe5InScntDUUNu5GPV0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NEpbOOnPD50bnoN6xzWS6cqE/Kw8Ib+cLRZqXt5dWd0wNJbbIVit7qa+YNRfbrggbBFtgjmkEXc0cnJ9U6Bi6B0FeAVyFykdSgPIv5lXLg2//AgIutjvsrUdCGuT4l4BoSLO7FIxXwcq+ZvHbS22GeOV6CStwqZf+fvNWn1M3b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Y4djdPHR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Y4djdPHR"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 48487408C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784934152; bh=XW+NBSSH4Kb5xT0ou0HpLbHQZuLFIPAxINFVFaksopU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Y4djdPHRjBFQPttUggrVX3RZdaqWvnzaiOpYRR/QJl+l1SFnzcekQ9wdhYR3uv1BK
	 PYncp1iphVUu6JXjB8b3mnkUEJ+hv5zIEXLL/J5zLudHC/k8DtTCCSDWlrWJDdNyAQ
	 /K3uOKLgUhwlsOC8nqlyjw50K60RUfDUWEpP/3r1kSDrLcas13rx7ZW0RIzFi61rOs
	 +1PKbGRVtjIISAwLIpO1MHdQzb/xmXKaglNNSG7CacRZ3BkZlgEDsl0PPQz1nxf+GI
	 EPzxN1LJ/VEzJ/9q5nvASMQeszLAZaoTZg6A//hvnFB0IGhHOAQlBA432tSR+8BbT+
	 IFkSglR/e6WXA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 48487408C5;
	Fri, 24 Jul 2026 23:02:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Daniel Lundberg Pedersen <dlp@qtec.com>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH 0/2] docs: make tables responsive with content-aware
 column widths
In-Reply-To: <20260724214249.23830-1-rito@ritovision.com>
References: <20260724214249.23830-1-rito@ritovision.com>
Date: Fri, 24 Jul 2026 17:02:31 -0600
Message-ID: <87ik646lfc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Rito Rhymes <rito@ritovision.com> writes:

> This series establishes a responsive layout foundation for generated
> tables throughout the documentation site. Wide tables can use contained
> horizontal scrolling on narrow viewports instead of widening the page or
> compressing their columns until the content becomes unreadable.
>
> It also derives content-aware minimum widths for each column, giving
> table content a reasonable floor before wrapping. This prevents
> aggressive wrapping from collapsing a column's own text into nearly
> vertical lines and prevents wider columns from squeezing neighboring
> columns into the same unreadable state.
>
> This addresses the current pathological failure modes in which tables
> either widen the page beyond its margins or collapse columns into
> nearly vertical text.

So I will look at this in more detail in the coming days.

My immediate reaction, though, is that this is the injection of a bunch
of complexity to solve a problem that nobody has complained about.  Your
last attempt here led to regressions that took a while to turn up; I
don't really see enough of a reason to risk that again.

Thanks,

jon
