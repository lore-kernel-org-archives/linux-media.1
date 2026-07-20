Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28F338756E
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784575014; cv=none; b=qz7EZWbzuAvN1JpzKhN6kQzlUPxyltUQq2N3nz9p5G4IGxhbSzFLy381ePE29Al9WrJG4qsoCFAc2BXJTPjDj2yBkBTUAMkUVKWgSp8i8hD7+BATVaQKMOyEZghfaBzxHrGtJZgk2dMefZy22xfrkYQrJqcfA3GmMucdzvXIkaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784575014; c=relaxed/simple;
	bh=dTTFES1H/NZMVMmw+FkFPJ8QujVahpuAvQaqpvWfK3U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LH9p/PD+yqmjQH+CJy7D91G4x9YccW+yCcwzgdBd12+RoWTqRwAqc85i2o9iNoL6sKoiGpE9vhWenrKjn5HKyDAaEAAw3QLlKJUTvsfiQDVTcmwu3n9TtN1tRVX26fZJwgWc8sYTh/wYaJwoQc54jYwYW/nit93DUphTqyLRWHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FU5ZcbZF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FU5ZcbZF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0061F000E9;
	Mon, 20 Jul 2026 19:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784575012;
	bh=zFN9Vqz4Q1btaJHtifoFTcALuh1ABqGWIxNavpNcQnM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FU5ZcbZFQi2qQgo7Zn4lwj++6qgT1SXfUVrkBjZ6B+2Z2xhPyTqir6FAuhsKg7mkE
	 qWbJTuVzbtET4x6mdQr6xcicfOA5t97rU2/caqn6ELICG/cPQSJY3D3Z2N+/gXiQKn
	 Spxqq52VpiSVZxQ27JNtN50RAoVFcJkuBuwLCIoZEJo6gj8hIRUjRiZvYAksha2bKn
	 CH9Xkr1SOyn/pLddFFKtPmdiRQkXZEwIisuQPpj0PWbSnCcrp9ji6demH6DUTza4Oe
	 TT8aGD437D6Umna/Z7azLDxQ10EWbjHqYZgQy/gHrZ6Sev62m5fw10fMZkDuwxdwNZ
	 6BUh9bemjSMCg==
Date: Mon, 20 Jul 2026 21:16:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Theodore Tso" <tytso@mit.edu>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Derek Barbosa
 <debarbos@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>,
 Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260720211647.3d62f4b9@foz.lan>
In-Reply-To: <20260720095537.4d5d503b@robin>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	<4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	<alc3gAJfAkG5DULJ@zed>
	<alfBvhZkAelq5RVf@mit.edu>
	<aliMsSH373RJ31Mq@zed>
	<aloZ9hqSgzN3beqH@mit.edu>
	<20260717152559.2d2bfc8d@localhost>
	<20260720095537.4d5d503b@robin>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Jul 2026 09:55:37 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri, 17 Jul 2026 15:25:59 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > That's one of the reasons why I do think media needs its own custom
> > prompts.  
> 
> Reading this thread I've come to the conclusion that different systems
> have different results from Sashiko. Sashko gets confused with some of
> the tracing logic, but that's because tracing does some hacks to keep
> the overhead down (it's where live text updates started). It reports
> issues sometimes that are not a problem due to the way the code was
> designed.

There is a custom prompt for tracing:

	https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts/kernel/subsystem/tracing.md

Probably, if you run Sashiko without it you would get more false
positives.

> But I fortunately know of these areas and can easily see when
> Sashiko falls over it. Hence, these false positives do not waste my
> time as I'm already aware of them. (I do take a deeper look to make
> sure it's not reporting something similar that may truly be a bug).
> 
> But I can see where this could cause a bit more problems with a
> different sub-system.
> 
> Hence, I don't believe there should be a one-size-fits-all for the
> entire kernel,

It is not like that. On static analyzers like Coverity, smatch,
sparse, coccinelle... there's no space for per-subsystem adjustments.

Now, with LLM, each subsystem may have custom prompts:

	https://github.com/sashiko-dev/sashiko/tree/main/third_party/prompts/kernel/subsystem

Also, when LLM parses a C file, it can pick some things from
the documentation on it.


> but do as we have been doing and have everything be
> opt-in by subsystem. But that also means that if you contribute to a
> sub-system, you need to follow their rules. If you don't want to deal
> with AI, don't contribute to a subsystem that has it set up where you
> will receive an email from AI if you submit to it.
> 
> Do we need to add an flag to the MAINTAINERS file that states which
> sub-systems uses AI?

I don't think this would help.

Also, from my point of view, Sashiko is not different than any other
new CI technology: when one enables it, people will discover lots of
problems and start fixing. It can take quite some time to adjust.

On media, we had this when we started using Jenkis. We're now with
another CI via gitlab actions for some time: the project started on
Jan, 2024. I can't remember when we started deploying it, but it was
more than one year ago. Still, we're adjusting it to try to reduce
false positives and inconsistencies.

For instance, last week we added a fix where CI internal problems
was ending marking patches on patchwork checks as errors

In the specific case of Sashiko, we do need to adjust it to the
media subsystem, as currently it is running without any hints
about what is relevant to us and what are false positives.

Thanks,
Mauro
