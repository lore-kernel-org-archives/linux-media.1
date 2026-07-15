Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897A727A91D
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 23:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784158122; cv=none; b=Izps7tzDMgsGTrRGd99r64KZEfYfdT2XjHQ1tAIN8TmgaAGcSY417T5fMcEexYxtyW7EKR5/ysccQxPMCikO6Xgay4Omb+1H7qM8iH6yiiladj/QBLYkW67EvxHBORd/2bYCLx0wly3AoTJP3tVVfO7RoWHrs7AjPqXlwr3ISMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784158122; c=relaxed/simple;
	bh=bca6uItKdslDdk3BTykFgzJYT/g3V4DspfWVjWsK3+A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tEmHud6c//3Z0JZO6IHonrzc8QpGDm6EI6K5jdBCC5A4nHM+RQF/jnhviJhNexuijEryQe1zbzXiK9XN74N66sL/YMCWgxP17RarQPniEC24KxoXU7j8MLbHoB/N+2of16YD7OujZrsH41R6JrudT5IbbXvqKaMBntWExw6Gw5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gENvC+89; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kZCFRTYP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gENvC+89";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kZCFRTYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784158119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6ATasn0a/sdVMDwI2BCOgdofTrn+8vAM6SrwD81nn4=;
	b=gENvC+89Ns6Rr8nAsusO1ysBZ47yBsXtlcH5qtDxpz9XSh5HvLDryObOME1/0/7oRkxGqM
	SMHd7r21lGD+E4Zb3IsQETZsFvBmgHOFEoiuPoHeFiPHmiEXyAkN8EdtbSDwCuIyPbbRZr
	2ivTuRp1j37cREg2/BHwDV/8Y2KS5OM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-VX21NnOJNJqpWx7Bzy6GZg-1; Wed, 15 Jul 2026 19:28:38 -0400
X-MC-Unique: VX21NnOJNJqpWx7Bzy6GZg-1
X-Mimecast-MFC-AGG-ID: VX21NnOJNJqpWx7Bzy6GZg_1784158118
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92da6f3cc81so503423185a.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 16:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784158117; x=1784762917; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z6ATasn0a/sdVMDwI2BCOgdofTrn+8vAM6SrwD81nn4=;
        b=kZCFRTYPQmEenAcLVhDF+wLYvxlmcHKjItr0nsKV1rR7TVcJ0719+MUJ8VsClrMMaL
         zQszQj0IU+jJTFPSm7Ok8QQG6vvsKiD4ysz5gJJFqsavHqg0/oVBPs/G3OVo8rm27XmB
         nXj3IkcNdnTNjcFswp77qG5BqpmVD1IpnlKhvWtlaG2+QWq6pw/RnR65RMPfWGVYo7Av
         DEvt6ukzNlo7dh4ojc7Vv4Ce/4Rx/zBJv7dtrREVvx+MztZPSm84fbBbOqiyiB+Xyp3M
         Q9lLwTr19t0ER/5AdcB8TUG/Pm5pTAHYNuDoM8sCNSctuNlfqxb/1Vd6pJgzPithhMUR
         jn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784158117; x=1784762917;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6ATasn0a/sdVMDwI2BCOgdofTrn+8vAM6SrwD81nn4=;
        b=mpJFZiZzeHVKSpFqsjgTjJ03iSo2NodEeLjEZdoEIfAQ2rgGggv8eMee3BFkiTTH+n
         wM53iNjRHNBpN0/W+3NZxov2JhwBiWVPNrz+qGz73pLlGcYgRdHXZ56PhY1EfTA+0RuI
         7grV8II8EuHkd1tQIPJsrljQd828TOMH1VMVvGho2CuxVs0O28iR1fL98ZNXXQ6DvQS9
         hsIjFF6i0rCJLrjqC/SqC+6L+y7b27erEVPGNEDtncGaGepvsXsDC2zv5psZIhlB6bQI
         Wf7aq0VDBJZbTJwCn+LLTLWp3zF9dxLNCmYOFdw3g/R67zvem6AFSscRf/RP23hOF6IO
         krbg==
X-Forwarded-Encrypted: i=1; AHgh+RplDH2wqNAuUfB3aPTZPc/Tz/szcT4cOREpEXiiqmRojVPMF9xY0KkrdT+e4M2Hklx3vrOESRrKt1J9vA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd3N4qEAXEyHbDuraRkGWFKDp9lUguZEWa5NrJ40A12oyiZ8WM
	OfTnsqaNPrSBsk12LQGo68aIcQLhZZMnGPin12waTNA7E5tqpIOesNGzqa78caimL0fzDHebkrn
	NSR3AQ8Jg17oqN0ZaG3lkTmFwH38v92hBKYdSmz+16zPrMLgExBXDJAAOHFHZ+sfuirgaCCTL
X-Gm-Gg: AfdE7ck+o9R1U5RDFKUuXg2V+HmcX0XLKtcUyuGH7mA653wgl0fZGUTZ959DLDilQ4U
	xOEpwTCZ8ftV/6vSdxqnrCUSUN/EGQnakcWvy7NU0x3K9R3ogTtjT55mL/ovvIJGB7Yt604PvCU
	g+qc5OWrM9zfkpovGluf9HKg8814UAQKoi1MXSP1ViZWJH0mjSXcLZGKWKeOmitMRXijz15rhny
	G4aK4aPgqx3spRq8C11X/26NCBg4EEv+7WpL9tnGRG7lNG5wgziVWcwUOqz/EIVSVMPW/Rj9WF4
	i2X4bHdf4sQOgAHe5vArPxduVSccRyH4nKQJQDPPRKn9RC10jupAeGxOelVRUJXJtnv+7tN4
X-Received: by 2002:a05:620a:8908:b0:92b:6805:9198 with SMTP id af79cd13be357-92ef2c69c53mr2100952885a.64.1784158117493;
        Wed, 15 Jul 2026 16:28:37 -0700 (PDT)
X-Received: by 2002:a05:620a:8908:b0:92b:6805:9198 with SMTP id af79cd13be357-92ef2c69c53mr2100948585a.64.1784158116941;
        Wed, 15 Jul 2026 16:28:36 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d2d68bsm1860208685a.33.2026.07.15.16.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 16:28:35 -0700 (PDT)
Message-ID: <3a5d891b536588e8e4fc84d60a5c8af72091d852.camel@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
From: lyude@redhat.com
To: Linus Torvalds <torvalds@linuxfoundation.org>, Roman Gushchin
	 <roman.gushchin@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>,
 Matthieu Baerts	 <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>,  Jason Gunthorpe	 <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Date: Wed, 15 Jul 2026 19:28:34 -0400
In-Reply-To: <CAHk-=wi4zC+Ze8e+p3tMv8TtG_80KzsZ1syL9anBtmEh5Z40vg@mail.gmail.com>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
		 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	 <CAHk-=wi4zC+Ze8e+p3tMv8TtG_80KzsZ1syL9anBtmEh5Z40vg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-07-14 at 20:06 -0700, Linus Torvalds wrote:
>=20
> AI is a tool, just like other tools we use.  And it's clearly a
> useful one.
>=20
> It may not have been that "clearly" even just a year ago, but it's no
> longer in question today.
>=20


I don't think it's like other tools either honestly. I also don't
that characteristic is mutually exclusive to whether or not AI based
tooling is useful.

There are absolutely useful usages of LLMs, and please note - I'm
literally saying this as someone whose own personal projects disallow
AI contributions. But I've also OK'd enabling sashiko for nouveau,
and I've also reviewed and pushed AI generated patches from others a
few times now. I've found sashiko to be quite useful.=C2=A0And a huge part
of that was the patience I've been given from people and the fact that
in all of the discussions I had, everyone was respectful of my views.
(also, thank you for being clear about not forcing people to use these
tools!).

I will point out: many of us have actually tried vibecoding, and the
result that we found was that we get dramatically more benefit a lot of
the time from writing the code ourselves and relying on the LLM for
analysis instead. The thing is, the seemingly limited and selective
usage doesn't really come from us thinking "well, the LLM can't write
code.". I'm sure some people think that, but for a lot of anti-AI
people like myself we're not going to play pretend. Of course the LLM
can write code, it's been able to do that for a while to an impressive
extent. And, moving aside the moral/ethical issues many of us have for
a moment, it's capabilities aren't the biggest problem.

The bigger problem is "can the LLM write code that won't take me much
longer to understand to a reasonable extent, such that I can reasonably
own and explain it, rather than if I wrote it myself?". At what point
is vibecoding simply not realistic for a human to be able to claim
accountability over? What about agentically written code?

To me, that's the crux of the issue here. Many, many of our employers
are explicitly trying to force these tools on people with the expected
result being a magical 10x productivity boost that just isn't
compatible with oversight. It is being used in a LOT of workplaces as
an excuse to throw any notion of actual review or code quality out the
window. While we've been dealing with slop for decades in the kernel
already: I think it is very worthwhile to point out that a tool that
dramatically lowers the bar required to generate huge amounts of sniff-
test passing slop is in fact, not like other tools. And it does need
some level of special consideration, even if it's not being banned.
This is especially true when it's now an industry-wide trend that's
affecting pretty much every single employer in this space.

For many people who need their jobs, guidelines around acceptable use
of these tools beyond "a person needs to own the the code" may end up
being the only thing allowing employees to be responsible with their
contributions without repercussion from employers. I've already ran
into this on fdo with people asking us about rules around AI
contributions for this reason. I personally,  say no to my employer all
the time, but there is a limit to how much any of us are able to do
that. It is exceedingly rare that companies employing kernel
contributors have "maintainable and well written, understandable code"
as a top corporate priority in the face of what they perceive to be a
game changing cost savings measure, even if the contributors they
employ have been able to uphold that expectation until now.

It's easy to prevent a single company pushing a slop driver into the
kernel, even easier to prevent a handful of contributors. But what
about when the offender is most employers? There's a huge industry-wide
push to try removing human oversight from writing code. And it's a lot
harder to push back against when your employer argues "well, I could
have an agent work on this problem 7 days a week 24 hours a day, why
should I pay you to quality check this?". Agentic tooling isn't at that
point, but most employers only care that it _could_ get there. If your
employer doesn't care about the quality of the code that's written, how
do you justify spending billable work hours on ensuring it? How do we
do this for literally every person in the chain, numerous of which have
different employers?

The least we could do is make what human ownership entails clear, maybe
clarify that this means that that regardless of the way code was
written it has to have been written in such a way it is reasonable to
assume it has been mostly/entirely reviewed by the person submitting
it. At least that way maintainers and contributors have actual solid
guidelines that they can lean on to avoid being forced into their
contributions turning into slop, with or without AI. And additionally,
maybe stop conflating generative AI with analytic uses of AI and
actually be really clear about this in public messaging. Sashiko can be
compared to other tools, but really - I don't think that comparison is
remotely fair with stuff like generative AI. The logistics are just too
different, and it really does feel like it gives people the wrong idea.

And also, we should probably assume that most people have tried
vibecoding. Honestly, I don't know many people in this industry who
actually haven't tried it, especially when a lot of us were literally
required to.

On Tue, 2026-07-14 at 20:06 -0700, Linus Torvalds wrote:
>=20
> Linux is not one of those anti-AI projects, and if somebody has
> issues
> with that, they can do the open-source thing and fork it.
>=20
> Or just walk away.

I don't think this is a great point to lean on. We all know most of us
are paying our bills with the work we do here, and the job market
really isn't what it used to be in tech. The forks that do exist
already require massive amounts of resources to maintain, it's not a
feasible option for most people. It's not supposed to be this way in a
perfect world, but a lot of people -are- stuck here.

I normally wouldn't really bring this up. But I think when for a lot of
people the huge looming fear is "oh god, I do not want my entire life
to have to turn into managing an LLM to do my job for me" even if that
doesn't fully reflect reality right now, it's still very understandable
that these conversations get heated and that people default to such
harsh positions around this and respond so negatively to harsh takes in
the other direction. Like: to be clear, there sure is a lot of bullshit
in the discussion around AI right now, like man, I sure do get tired of
people telling me "some project got sloppified" only to find they
turned on an AI code review bot or accepted a single AI generated
patch. I've even gotten shit for just mentioning that sashiko can be
useful.

But: I don't hold it against people and try to be patient because
honestly, I get it. The PR from a lot of companies that are pushing AI
future is frankly repulsive, and I feel like it would be a disservice
to ignore that fact when just about everyone in the industry is
collectively dealing with the burnout from hearing it. I feel like
ignoring that does make it harder for a lot of people to get more
nuanced views on technologies like this.

