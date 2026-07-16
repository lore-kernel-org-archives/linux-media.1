Received: from 4.mo560.mail-out.ovh.net (4.mo560.mail-out.ovh.net [87.98.172.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB91A30DEA5
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 12:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.172.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784206723; cv=none; b=W3MlnZYfe8JSmvr16eEg92tQxY30R78Y/MTUCJuoTAtHU8QuxBXiRlGoqZ6Nuqs6VyAbEowiSO7K1SahL4Mkd/6Jg/hLML8jdxBT00Wzf8Xcr/uW4QMTCkQwJGDkOVdZmTmPZn+PTdMIS9lNnQUjZpJ5RhkL/ayUTyC66UtDyT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784206723; c=relaxed/simple;
	bh=sGBwHjd/ZVkGdkMWHFWnDzENUQGIJLOw78H6GMp3aFE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oSepfjIdhiykyQHtM2LOo1iDMryglmOghs+mbw3QoYeEGCm1hKss+c5kGX7ahroqJk/3E3EpfCFONtiBWYJ1JWJjpuF+/O7jWV6XN6Tz4Q1fmee+rFFn7j4gEOl9Imkx5BttRS57qE6lD44YXBG1E1HcNC5Zw3uIYeaKcnziMAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tesio.it; spf=pass smtp.mailfrom=tesio.it; dkim=pass (2048-bit key) header.d=tesio.it header.i=@tesio.it header.b=IXuIdPmr; arc=none smtp.client-ip=87.98.172.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tesio.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tesio.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tesio.it header.i=@tesio.it header.b="IXuIdPmr"
Received: from director10.ghost.mail-out.ovh.net (unknown [10.110.0.90])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4h16wM6w62zBDbn
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 09:20:51 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-hxx88 (unknown [10.110.178.103])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5935FC0CD9;
	Thu, 16 Jul 2026 09:20:50 +0000 (UTC)
Received: from tesio.it ([37.59.142.98])
	by ghost-submission-7d8d68f679-hxx88 with ESMTPSA
	id UUrDNnGiWGqVEDUAVK7ECA
	(envelope-from <giacomo@tesio.it>); Thu, 16 Jul 2026 09:20:50 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-98R00293812815-d21b-4760-86da-3e7935d23692,
                    3A08D15F88E16AE59486895140C0CFDE789B8E7A) smtp.auth=giacomo@tesio.it
X-OVh-ClientIp:109.53.128.115
Date: Thu, 16 Jul 2026 11:20:48 +0200
From: Giacomo Tesio <giacomo@tesio.it>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, Theodore Tso
 <tytso@mit.edu>, Roman Gushchin <roman.gushchin@linux.dev>, Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260716112048.2dc10a3f@hermes.development.it>
In-Reply-To: <20260715201301.GB1824265@killaraus.ideasonboard.com>
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
	<20260715201301.GB1824265@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
x-ovh-tracer-id: 11705699860253830100
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGYtsOh/QAqFffKJCjbKrqZMQCjya3Ti+dvZ6W47L7yc1UragHVV8SY1Z3aZjj5Xj5t0NtzsDtr50iVWCpwC91lpFzlvi3gqMvq5fDfZgRLQZRuGjp4vPlecaDbsSZvliOraqSLjzkvhQ2VbpfDD0KszdSXRcVhqD/HNy6BmV1KPq7moa2/4cQz7SHTRi5Y418W4ngD3k4rprUhXuIqmpy0BZhYl9rZm5Hpdfmw0RyAypFm7g6qqPZEuarXgR4sZpL+P/w6bWvbTOapr2MDnNI79QBHe3sbLwitWtuz7egtMUXpC9LUn6xSLX7gb2JWueGWa2ep07m4bT19LuQf/4AmelXi+QehwX51yCUVLCIBQt9YKaTiHrBceqXLWaQYSQRs+/LYOz+QCBpaH/Uc8QG/wJjk9KPHpWTrAENV67u3cs7vAv9Lh3PHq09cJ+4Vdi7Hrs7jIkvL6As0lo+Nz9a7kvZZDP6KkGbVM+B9Xn3hYtVJmzIpsg8SW0V+njM+v0Juiat+lEoa0b1GIgeJs4W3HIi08FfUUrrGmjP3jQmnJOb19RPQVzF+hMTg2cwih66bLD31APZJhYn2qZ7fCkucip3mgMaZAYjrIUA+E+8I3tSvWUYXA23z12Or2fxkXcVTji8CJAT+xHsxs3UXM3iVFdmOrkx8TeOgCVA1VvmFlA
DKIM-Signature: a=rsa-sha256; bh=AoAvqbIAoGlSas1mS4ZuuG8DnjJVI5IOMf5WvZexK1E=;
 c=relaxed/relaxed; d=tesio.it; h=From; s=ovhmo4282862-selector1;
 t=1784193652; v=1;
 b=IXuIdPmr80zTf6rWEEmWSKWPRDmqU+UKPBrea5N4TizZ8rewfY+d+fmcks06Q2vG1vD7ifDh
 4g/ziJREz7lwiiTXwSjh4XH7hf1ry2jNDB8Ru6pX1CHe4U3IMKiuhYcJKeuu9juyezuo3Lxcf1n
 toorS7dPOfAUzF7blEXy+/H8knvMQQSwi8LmKHu+l9kZv/icPTuDeANQlwhxsSi8Qa/Hy4/TU7y
 q9kvJn+uINsgBana2BO5vKdqP9UFazj6MKkmvTMUZAxN6SoyyOv6lYtXpKNxqfV+rWY3ChS5fuD
 vdLwhPQc91mcc3WqPI99i8RvhooYMXCySQZxIECGwsSAQ==

Come on Laurent, don't be naive: pointing out Linus' contradictions
won't move the conversation forward.

Because, when you look at the whole picture, his arguments and
actions show deep coehernce with the Foundation's _political_ goals.


On Wed, 15 Jul 2026 23:13:01 +0300 Laurent Pinchart wrote:

> On Wed, Jul 15, 2026 at 12:14:47PM -0700, Linus Torvalds wrote:
> > On Wed, 15 Jul 2026 at 11:51, Laurent Pinchart wrote:  
> > >
> > > I consider that, today, there's no ethical justification for the
> > > use of generative AI in FOSS development.  
> > 
> > So this is where the discussion ends.  
> > [...]
> > 
> > If you don't have technical reasons, you don't have reasons.  
> 
> You have accepted
> 
> commit a5f526ecb075a08c4a082355020166c7fe13ae27
> Author: Dan Williams <djbw@kernel.org>
> Date:   Fri Jul 3 23:54:35 2020 -0700
> 
>     CodingStyle: Inclusive Terminology
> 
> That commit shows the community can take ethical issues into
> consideration.

The US "inclusiveness" ethical issue was instrumental to the Linux
Foundation's marketing and to the narrations of its largest partners.
After all, LF tagline is "Decentralized innovation. Built on trust."
[1] so they need a cheap narrative that make them look trustworthy.


On the other hand, legitimizing any of the several AI issues is a greet
concern for the LF members [2] that includes companies such as Google,
Meta, Microsoft and Anthropic that are collectively exposed for
trillions of dollars over the AI bubble.
It's not that you must be "pro-AI", but if you are not, you will be
countered or silenced in every influential technical spaces.


So neither inclusiveness or developers' alienation are relevant ethical
issues in this list, just political tools or not.


Linus faithfully serves the interests of his employers, so no
argument, either ethical, technical or whatever, really counts
here whenever its effects could annoy them.

In fact, he already explained it clearly [3]:

> Linux is not one of those anti-AI projects, and if somebody has issues
> with that, they can do the open-source thing and fork it.
>
> Or just walk away.

Take this as a wise, friendly, suggestion.

If your goals and interests are not aligned with the goals and
interests of Linux Foundation's Platinum and Gold members [2] (and I
guess they are not, as several of them are even actively supporting a
genocide right now), you should simply devote your skills to projects
more aligned with your values and interests.

There are plenty of operating systems that need kernel hackers.


Giacomo

[1] https://www.linuxfoundation.org/

[2] https://www.linuxfoundation.org/about/members

[3]
https://lore.kernel.org/linux-media/CAHk-=wi4zC+Ze8e+p3tMv8TtG_80KzsZ1syL9anBtmEh5Z40vg@mail.gmail.com/
