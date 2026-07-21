Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F6F46EF84
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 19:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784661894; cv=none; b=BypyHUVicuWjmf6DQ426bEnyih6uUiPrlTunJVZqnfjKFuD6z8MrMK51e/M6WK2qb6sp3s6x+1Ysr8wC0p//rinJLtE2LU0a91GML1j3CxC3+fad4oOJLkQE3gYr5fVaPhthQlWCyZKgVdx3FkFCQKGkdMO8U6gG9g6/xkdmNj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784661894; c=relaxed/simple;
	bh=8VOeCTGKSamuz1dVtdzSYi66anVIRPETVlUTlzGiCvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HYtN5sjXoD8hAta1t2h52LFx4yjiyVdSSkhvHAjkZ1arD69uTrxrjQN6mu5DzvCo7oZMMeRIo1ctENRzc8AEQRtwY/1BdrxzmEMh0Ly3L0ska1tKSHN8jy3P9fR/lq3pWUtuil7bYsXexegGy6DtcqJ5rWOQICJZ7IYdhsHJ+RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 121DA4023E;
	Tue, 21 Jul 2026 19:24:45 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id B744520029;
	Tue, 21 Jul 2026 19:24:42 +0000 (UTC)
Date: Tue, 21 Jul 2026 15:25:01 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>, Matthieu
 Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>,
 Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260721152501.0ff97e8c@gandalf.local.home>
In-Reply-To: <20260721182509.GG536385@killaraus.ideasonboard.com>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	<4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	<20260715162816.GF1778116@killaraus.ideasonboard.com>
	<7ia47bmw0xls.fsf@castle.c.googlers.com>
	<20260721182509.GG536385@killaraus.ideasonboard.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: B744520029
X-Stat-Signature: tea7ngkbdn5rz6f4rcgpcda5g6b43grc
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19EjSpfBFYOyE+7aFpX2iwO5R6Arzw8mSE=
X-HE-Tag: 1784661882-993440
X-HE-Meta: U2FsdGVkX1+Gx/Lj9FZciv1Ow4gNBF2rtM5N3hqmlg2aL3z1QaHZc5joPzUvVTWbqVcYxntHT5PMhIR+S4IkIw9ObWLtwFfxXHGEtmfvWG0XgAP841357cxBcRJSGapD40v0W1QMQ0TGkvDBOzzAHH8lVAvz77q7PfRnwkbXHI1YP6fbGR31yZtkuX9W2XXMWX8K2ufwNLonpLlzpu6q77339eY6w9x9/FkgQfPFN/FuRmk8JMBB62wmtrFKkeBoJPK0Wz+VUWGEYwnMDAXeUxv3hw2cesAd19k086HtS7qx4a/76lptTs8r5yiHsUK3DYrx6jl9w84cZk1HAliu8YA+g0IlyWwV/ZH4a9reWtvwQzSvEe1xJgdr99hE6LE7

On Tue, 21 Jul 2026 21:25:09 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> We've long known that we can't win if we treat security as a game of
> whack-a-mole. Kees Cook and others have for years spent large mounts of
> time and energy into securing the kernel by closing classes of
> vulnerabilities. We've accepted a second programming language for kernel
> development that should make memory-related bugs impossible in the first
> place. In a less disruptive way, switching from C89 to C11 has enabled
> features likes __free() that help make the code base safer.
> 
> Do we need to act on security issues reported by LLMs ? For the time
> being, surely. Is that enough ? No way. It's even more important today
> than it used to be to make whole classes of bugs impossible in the first
> place. The good news for people interested in that development is
> there's lots of work to be done all across the kernel :-)
> 
> Touting AI reviews as the solution to the security problem LLMs
> generated in the first place without massively investing in kernel
> hardening is in my opinion the real "putting our heads in the sand"
> here.

Who said the two are mutually exclusive? I believe there is still a large
effort in hardening the kernel. AI reviews is totally agnostic to that
effort. Roman said at LSF/MM/BPF that he's the only one working on Sashikio
at Google. Yes, Google is investing billions (if not trillions) of dollars
into AI, but that has nothing to do with the Linux kernel. Roman has simply
tapped into that effort to allow the Linux kernel to take advantage of that
investment.

It really sounds like you want companies to move effort from AI into the
Linux kernel hardening. If Google did that, all it would do is move Roman
from working on Sashiko to working on hardening the kernel. I think Roman
is doing a hell of a lot more for the Linux kernel by staying with Sashiko!

-- Steve
