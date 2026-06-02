Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4283822A2
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 20:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780432782; cv=none; b=V5MTcMH1xUcBrQ0jHPZpLOaZK1gwdv5relR8dbaXzwjPQeU8kz5smAdNIQ1MAwYs7VPyDBltq5fOynnCGgRSDfvI0DSBpVaSJ30ERsOjakE2VimYIhtkJlor/1Z3gnnygR5yMDNKSgCTZnVlPlTNGxpSR2ugkM0VY22zIT04nnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780432782; c=relaxed/simple;
	bh=sx/jxOAIY5lVzYlos5HSlOqYoVYMlbrtiIQGoN3fIgI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tQf0FgxOarxrdNR+elaQQ+s56REKdVKSh8Vd28bq245LEkM1Dhs+0Tc0+Hq7Wp2Yx8ANLa8bVv8zUO9JsQFh3JAF5y1X7sy1f7WR3URwzK/B9dk7cv/CE6G5LQxz0EyOwfFxw7x+5NVQ/guq4kguscpJcfv80nXi6XxEtIE2ZJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtBeIXU2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtBeIXU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341651F00893;
	Tue,  2 Jun 2026 20:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780432780;
	bh=ff6Jnsg4p1rtvTmJXfsBnAyAYrybLqo1Jx7l3ICf/9A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HtBeIXU2e083qefAEY29W3LnO5eNrm7264CK3otB7J9bbuRDAjjA0+1dccSZsC0rT
	 mqMo8LaWfO+UL4TaUwfGwa8qK4PU52tHZM5CygvuAvx1uW02YOlW5kOg6N5wc/tMQD
	 I6ejNTlp4W0bNeOlXpmBtxjQ39xHiBhUzCcgUB9J8hsmoyEMDDl/NC/MOjoyIU5fNb
	 sxGMK6ZzjWeoxYC58UIBb32Oo5f2rpT4DjHZdKQrYg3Xlu8riQ9pYNT3eDBZd2hC5C
	 1CvbR4faFb9obAPx9cPAeGiiyueEwQevplf2/rFjPuhSq9lM8NxAwa2qhSNL7riG4c
	 bA2YwQSblJ9tg==
Date: Tue, 2 Jun 2026 22:39:36 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Derek Barbosa <debarbos@redhat.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260602223936.27def657@foz.lan>
In-Reply-To: <7ia4tsrkn1k4.fsf@castle.c.googlers.com>
References: <20260530103004.6fe2ffa7@foz.lan>
	<7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
	<20260530200017.0fe7f685@foz.lan>
	<20260530204945.22ac92c6@foz.lan>
	<20260530205351.19847fc8@foz.lan>
	<ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb>
	<7ia4tsrkn1k4.fsf@castle.c.googlers.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 02 Jun 2026 20:13:15 +0000
Roman Gushchin <roman.gushchin@linux.dev> wrote:

> Derek Barbosa <debarbos@redhat.com> writes:
> 
> > On Sat, May 30, 2026 at 08:53:51PM +0200, Mauro Carvalho Chehab wrote:  
> >> 
> >> In time: problematic in the sense that the first project that
> >> picked it is likely the patch "owner": the token will require
> >> maintainership on such project.
> >> 
> >> In practice it would mean that the token used on patchwork instances
> >> with multiple Kernel projects may need maintainers permission on all
> >> such projects, as otherwise patchwork update will fail.
> >> 
> >> Thanks,
> >> Mauro
> >>   
> >
> > Hi Mauro,
> >
> > Just to recap the the thread, to confirm that I am following it correctly:
> >
> > - Patchwork only supports a single URL mask for message-ID lookup (lore or
> >   sashiko). Adding a sashiko link would require diverging from
> > upstream.  
> 
> Is it something we can change upstream?

No idea. I suspect a change like that will require change patches database
and use Django's migration logic to touch its database.

However, at least for me, I can't see any value of being able search for a
patch based on Sashiko's message ID.

> > - pw_tools is a workaround solution to get/set status on patchwork via bot-mail
> >   parsing. pw tokens also have broad permission scope.
> >
> > which that leaves us with two "methods" of integration:
> >
> > 1. The Sashiko daemon calls the pw_tools script directly to update the status.
> > 2. Sashiko sends a single-per-patch-email with parseable "status" to a mailing
> > list, where some running daemon will pickup the mail.  
> 
> This feels a bit hacky.

The alternative that would be acceptable, at least on media, is if 
one would add support on patchwork to have a separate permission just
for checks update.

Granting full maintainership control to external bots sounds too risky 
for my taste.


Thanks,
Mauro
