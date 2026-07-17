Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989A63F88A8
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294763; cv=none; b=l1LH46vwuk/k/nIBnBGI1vIwS8GcsYP+cB6SAYgPMyOayxb2wS0ievcDmsMGYmCQxG7n++R0bHwuGBFa56Hxk1nK7DYJ9e7p0Cc/9sH/sbBwpItc8GG1Q1TRH6zvafPwrg3kdHpzA3wgCzQPxiAG0Fl/XeWvOUJkDbEiUGBpGL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294763; c=relaxed/simple;
	bh=J6nUJ+hVttnfLxNtFEx4CW2WcYd3hsq2dhoKn4uek+U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYHI6iyvjMYAYnVV8RgrJA81u88WGkQzKCzmJqiwCnpj5lazm/xROIauiNe/ukg9Xm2KaaLd756YjEs/FJ36Eva6IiLHJFXPeGecDZ4GED5BN2cvSnHDnb7ItnO+QX7SC16xmiW5UbEOu5njchFYbvKeBHnNHfN/qsLubxFPKKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDt0O08M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDt0O08M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E64D1F000E9;
	Fri, 17 Jul 2026 13:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784294762;
	bh=jE0DwCf5QI4kLmK4ctc4sErmB48NRqsBtGfSQjC8PYU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dDt0O08M0K87pan45rUZagylS4IBsYHTktGDSZdKgw5eOlKeH1jZqvKWyTPfUUNYX
	 V+UqdX/w6Kl/14hCj8777U89bBPRJsA+5jKBHjuglC44nCl5M7EqRew0qr0wFQmUa5
	 Dl00+JlNRXjLDGEgOLSSWG/ojT5UBix6WmhVa9ZHrfik47YwujmpOTTSztqGtTJkoX
	 yv5N9fXjBwNt9055nevw+lCdJ0vyXyFigadd5ChoeEePHV0W2oHUtzjFNhm3fmIEOi
	 E+RVY+o89ZMh8YXRYjoCSNY6FzZQprePamY74vG5dwEDgoPooCQKZfVxuJqw9jfqaP
	 MDjCcAUlJ1glQ==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wkiZk-0000000EVJ1-0h2p;
	Fri, 17 Jul 2026 15:26:00 +0200
Date: Fri, 17 Jul 2026 15:25:59 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Theodore Tso" <tytso@mit.edu>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Derek Barbosa <debarbos@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260717152559.2d2bfc8d@localhost>
In-Reply-To: <aloZ9hqSgzN3beqH@mit.edu>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	<4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	<alc3gAJfAkG5DULJ@zed>
	<alfBvhZkAelq5RVf@mit.edu>
	<aliMsSH373RJ31Mq@zed>
	<aloZ9hqSgzN3beqH@mit.edu>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Jul 2026 08:20:48 -0400
"Theodore Tso" <tytso@mit.edu> wrote:

> On Thu, Jul 16, 2026 at 10:07:03AM -0500, Jacopo Mondi wrote:
> > I got fooled by a Sashiko reported issue on patch for a driver I
> > maintain. I asked the developer to address it, he did so in a separate
> > patch, people got involved, lost quite some time on it, it ended up
> > being a false positive.  
> 
> Thanks, I think I see why the Media subsystem has such a huge
> difference in their experience of Sashiko.  With the media subsystem,
> you have to support drivers and the driver maintainers don't
> necessarily have as much deep experience with the core media
> infrastructure / framework.  Hence, you didn't immediately realize
> that something which was a false positive.  I'm going to guess that
> you have three levels of expertise; (a) the patch authors, some of
> whom might have very little experience with the kernel, since their
> last project might have been developing the firmware for the card, (b)
> the driver maintainers, who know that driver very well, but might not
> have deep expertise the core media subsystems, and (c) the core media
> infrastructure developers / maintainers, who *do* know what is and
> isn't fair.

While there are still a certain amount of (a) and (b), a large amount
of media patches comes from experienced media driver developers with
a reasonable expertise at the core, as several vendors opt to hire
open source development companies.

For (a), current Sashiko reports could look scary, as false positives
might end causing confusion. We tried to reach a consensus with regards
to c/c the author. About half of the comments from people who 
participated at the last media summit think it was OK to c/c the author
at Sashiko reviews provided we add a disclaimer notice at the top of the
e-mail body; the other half thinks otherwise. Yet, there was a consensus
to enable Sashiko for a couple of Kernel releases to see how it goes.

So, we opted to start without c/c the author and placing reviews on a
separate opt-in ML, while also adding them to our patchwork instance
as well.

> I think the other difference is that in the media subsystem, you can
> rely on the userspace code being "nice" (so you don't need to worry
> about certain races or cleanup bugs, because a well-behaved upper
> layers of the stack would *never* abuse the kernel system call in that
> way). 

Yes, this is true. Also, V4L2 and dvb core are responsible to receive
system calls, passing them to drivers only after checking for abuses.

So, most of the issues there are things like use-after-free, error
handling logic, and lack of resource de-allocation (which is only an
issue, in practice, for usb drivers).

There are still a fair amount of such bugs, which is where Sashiko
and static analyzers can help more.

That's one of the reasons why I do think media needs its own custom
prompts.

> With file systems, we can *count* on syzbot abusing the system
> call interface and filing bugs which they will report to management as
> security bugs even though no sane userspace would ever do something
> like that.  

Syzbot issues are usually related to V4L2 core. We don't get many such
reports, probably because v4l2 core doesn't have too much changes those
days.

-- 
Thanks,
Mauro
