Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C1939B970;
	Fri, 10 Jul 2026 08:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783671085; cv=none; b=SPQhJvs4D0TMeye9TQOiYc28/1yAOZLUqPpw/AfFwwFLic9oMCJmUfLREfMBZ4Vfv1JsrAIYzANKAEqUnxun0JCeeO/5D6/arNyzhfxBYt+IghjIMv85nSCjrWewIq36vM3EgRlhUFq+yDbsJ3D46JM5+TEdlk6InjteeJT0Xxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783671085; c=relaxed/simple;
	bh=tb4i1NFK2AtS7A19tqUyIjKvX2M3PZxC9zIsxtORnOs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=rlZtQ+UfPC3zqZ2AgCFUA00gT0V4AjqMslO6Xvd+nW+rlgVr6HJu0m7ZewU72E6t58q0dxx+aYCbFrfIRhAEmLFHwvALHT4BgbUBWl8TTlIbvibVIvcWfUSx5nS5bceDqog46Qo0xDdqr3/fBNCWmYM5o1/Mo/7Ub6U0RDhTFJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRQLOnyO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRQLOnyO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BF31F000E9;
	Fri, 10 Jul 2026 08:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783671084;
	bh=jMruBfVSyH3DVmk1GL0ZX3Bx9OKUNffdLyUYEdQDcYI=;
	h=Date:From:Subject:To:References:In-Reply-To;
	b=PRQLOnyO6sdmcbUffE89YnGACswQ+SQ2PxRL0B3fYF6//vXWGhePnmxKg9mZDVWt7
	 3zGxZUr8miFjL1Rj9J2B6vC0piJg+ZVya3AlZ/rDtqiZqPiaP12julzAGl05dHPKXW
	 xeU1mt9VCZIFs1QexWn8B8bXBAh1SQylicvoS5HfuGQzGwGOooVBYB8jExmkdeTrRC
	 kF9aClUQVe4GsAhbLXn5DdFS1YCRVlVvQisNh9TG8o54xGaVNnxt7WA6RvYRhILKb2
	 9s0lIdSqYeIm5MUlPedFuX8MAjUfzkmIZr7cmaJSzUx3FwuPi6Nx9zKVRpmmES5cJT
	 rC6eOcLV07bzQ==
Message-ID: <7fcac682-60e3-4e1d-b26b-5b23f8035a91@kernel.org>
Date: Fri, 10 Jul 2026 10:11:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: Bad wrapping in some tables
To: Rito Rhymes <rito@ritovision.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Lundberg Pedersen <dlp@qtec.com>, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org
References: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
 <87pl0yr9ah.fsf@trenco.lwn.net> <DJUP0UXLLHJ0.3P121A982R9TP@ritovision.com>
Content-Language: en-US, nl
In-Reply-To: <DJUP0UXLLHJ0.3P121A982R9TP@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/07/2026 08:55, Rito Rhymes wrote:
> I just got caught up to speed, reviewing the links, the regression, the
> prior state and other relevant context.
> 
> Daniel, thanks for pointing out the regression. As Jon said, it's
> always good to inform the author of the patch, and I'd have been happy
> to discuss and test out solutions with you.
> 
>> That overflow-wrap line is the problem. The patch was trying to
>> improve overflow from some literal blocks, but it does seem that the
>> cure is worse than the disease.
> 
>> This change causes truly unreadable breaking of literal strings in a
>> number of settings.
> 
> Can anyone provide any examples of issues happening outside of tables?
> 
> If not, that suggests the fix is working fine except inside tables,
> which means a targeted fix for tables is possible.
> 
> The intention of the fix is that inline literals in regular text bodies
> that have a generally defined (max) width will respect that width and
> not exceed it and cause overflow. It's serving that purpose and is a
> sensible default behavior because it is often used like text in text
> bodies and surrounded by other text, thus we make it also behave like
> text.
> 
> I don't believe a reversion is the right answer, for two reasons.
> 
> Reason 1:
> 
> Reverting the fix restores the issues outside the tables it previously
> fixed, and fixes some of the tables, but makes others just as
> unreadable.
> 
> In the second example Daniel provided, there is a two column table
> spanning the full width of the page on mobile viewport sizes without
> overflowing. The left column is inline literals only, the right column
> is regular text.
> 
> After my fix:
> https://www.kernel.org/doc/html/v7.1/process/debugging/kgdb.html#run-time-parameter-kgdbreboot
> 
> The left column of inline literals wraps down into vertical text and is
> unreadable, because the column has no minimum width and expects the
> contents to set the width, but it wraps immediately. That's a problem.
> The right column text is readable, though it does some wrapping for a
> few words.
> 
> Before the fix:
> https://www.kernel.org/doc/html/v7.0/process/debugging/kgdb.html#run-time-parameter-kgdbreboot
> 
> The issue is as bad or worse. The left column is fully readable and
> spans literals as far as needed, but it's crushing the right column and
> forcing that into vertical text (maybe 2-3 characters wide), making
> that column unreadable.
> 
> What's worse, unreadable vertical text as inline literals or as regular
> text? Regular text is worse because it's meant to be descriptive, but
> having either one is unacceptable.
> 
> Reason 2: the real culprit here is this:
> 
> Table mobile responsiveness in general in the Linux kernel
> documentation is systemically pathological.
> 
> Many if not most of the tables on smaller screens overflow page width
> and break the page margins. And this page is another example of
> pathological table behavior where the table doesn't overflow and
> break the page margins, it respects the page margin width, but
> instead makes the content inside unreadable as vertical text, either
> from the string literal wrapping or from the text wrapping. Neither
> my current fix nor the reverted state resolves that issue.
> 
> The best solution:
> Make targeted changes to the tables to make them fundamentally behave
> better on smaller screen sizes.
> 
> I began this effort with:
> [PATCH v3] docs: wrap generated tables to contain small-screen overflow
> 
> Jon hadn't followed up after testing out the fix with CSS and my
> explaining why the wrapper was the better approach, because it prevented
> regressions. That fix is a start, but more would need to be done.
> 
> If Daniel is willing to help test out table fixes and provide examples
> of regressions, and if Jon has the bandwidth to review my patch
> submissions to improve the tables, I am willing to tackle this systemic
> issue, which will result in this issue being resolved as well.
> 
> Rito
> 

FYI: the Media subsystem userspace API is full of tables, e.g.:

https://docs.kernel.org/userspace-api/media/v4l/vidioc-enuminput.html
https://docs.kernel.org/userspace-api/media/cec/cec-ioc-receive.html

There are many, many more of those.

Currently it is basically unreadable due to the breaking up of the literals.

Hopefully this can be fixed. I only noticed this issue yesterday, so it was
good to see your email so I know why it changed.

We're well aware that the tables in the media subsystem do not work well on
small screens. The only workable solution would be to move away from tables
and format it differently. And that's not going to happen as that would be a
massive job.

Regards,

	Hans
