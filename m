Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682B931AF3B
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 03:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780889074; cv=none; b=fZacvPhozGntPI59iz5K2eYgknX/ZmkB6GOPVkv1F5KjDlmBZ2yFWOUju8jjlA7OqJL269ELwhzVPgliSbw4eC/Mr9VRUWkveg2ZesmdlbyKfKgzSObRZdWAV7zaMyL76mpv+6qnEdtOuMfDlZHrmKI1AsmBZ7vnujMNmfNyDlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780889074; c=relaxed/simple;
	bh=IeMY4HelRRynSce5j5/jfzXvOoGHZPcGDmM4C95T7E0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Az5OuNkbFvqVz4ZTI8goNlxHCdrX2azAIKQyK8RciVVkuFmxnC898W4SdUJDrcWkJzRtIxESc1SGfsq2l1SX0Qi3RdXroa4IcXf1W6UHthA/kUu1t/fU/wpl3ijs3WJERcN21Ru4m/U+5m9y9SW83cgMTn3XvNW5MwyQpjnkVSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfGRqOsc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RfGRqOsc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E011F00898
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 03:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780889073;
	bh=IeMY4HelRRynSce5j5/jfzXvOoGHZPcGDmM4C95T7E0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=RfGRqOscnO5CTvkm3E0cn+qsIwn8gVmT0rRYueNMitzP/PPARB8Ge/CrvxbfjTEs+
	 U4VtH0m5XIMVBKbraNkd+0paW5n6btMM60bdxexeuGNoLDcaYIPY6Tk3aRvnpDQTVw
	 pD51MEg3d3EJmIrvdF3ot+sxh3AttoECkb5z7sC2iv/y9S4QO2vHpezxrMyWReD9Z7
	 F9NV4NbJYFhYLRj0ivS7mzbFF2aAN0m1DF8Ugifb58kEElMv340jTqfT1mOH+HChPS
	 E2v5iwFJrUkl9Gziu/UnCKAXxWmgMLglwgjUogedUeeulsZ1/neXQA2J1xUzILPUGf
	 y49st1dl7tfuA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39676d82b7fso37602231fa.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 20:24:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ82nyj9U1RNvr0P/AmrQGADkXnb9D/0ufMcsjFeCIHf2qX3CG0T3ntyR4HH0xPEb/cmisZZWYgaJpzSfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw22NM2WFr73C/E4D07ugsCJ9OTT3h4B5RX49hvGnBcuKEunPB
	pFGv6j84+5Nvh6HiwtHmUY6L+d9edqWZ110dj95W8wHS0l/yqI7c0HbRxTZYxSTBp3Z08HjSwkt
	y/4d97wJ8Kl7c9wtIVzk67NGTHpYegIk=
X-Received: by 2002:a2e:be1c:0:b0:396:7f19:3b2 with SMTP id
 38308e7fff4ca-396d0879beamr36327111fa.20.1780889071472; Sun, 07 Jun 2026
 20:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCunFkyGqz5n15ezW0LHCHqU92g6xeVK43zRcqohS-QsdQ@mail.gmail.com>
 <177998407808.933414.10133969094530331086@freya> <CANiDSCuMUdh6MWw5O+nhFJzexMcGJRTZ38Fq1anihe7=zu5K2w@mail.gmail.com>
 <21425d0e18fd0afdfccef2a83cc5efaa153d5dbb.camel@ndufresne.ca>
In-Reply-To: <21425d0e18fd0afdfccef2a83cc5efaa153d5dbb.camel@ndufresne.ca>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 8 Jun 2026 11:24:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v66HTeQc1UZHCXg_v1yD=_CbYUTfXRSLqK8NV8HO=oyvGA@mail.gmail.com>
X-Gm-Features: AVVi8CczSBZz7FUpPs3VrEEUAmHntD9ltzrgvuPOa9_SIDVe9sdwYY6OEieGSek
Message-ID: <CAGb2v66HTeQc1UZHCXg_v1yD=_CbYUTfXRSLqK8NV8HO=oyvGA@mail.gmail.com>
Subject: Re: Adding Linux-media to Sashiko
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 2:24=E2=80=AFAM Nicolas Dufresne <nicolas@ndufresne.=
ca> wrote:
>
> Hi,
>
> Le jeudi 28 mai 2026 =C3=A0 23:44 +0200, Ricardo Ribalda a =C3=A9crit :
> > Hi Jai
> >
> > I thought that we agreed to experiment with cc to the list to evaluate
> > the quality of the review and then decide how to configure it.
> >
> > But I might also be miss-remembering it.
> >
> >
> > The current PR in sashiko has landed, but it is very easy (and fast)
> > to upload a change.
>
> I was pushing against having the emails during the summit, so I am equall=
y
> surprised. We can of course let it run and see how it goes, first thing I=
 notice
> is the amount of "existing issue" reports it adds is quite big. My a worr=
y is
> that people with low knowledge might try and fix them all, which just mak=
e the
> process stalled until sashiko gets quite about a specific code base.

Unfortunately this is already happening on other lists. In the case I
dealt with the submitter just tried to fix all the subsequent issues
without an actual deep understanding of the problem. It didn't help that
the submitter didn't have the hardware (or experience with the platform)
and was just doing cleanup fixes. The end result was that the commit
messages didn't really match reality.

I suspect that the media drivers are much larger and therefore harder
to fix by drive-by contributors like this. So as you said it could just
stall the whole process.


ChenYu


> Nicolas
>
> >
> >
> > Regards!!!
> >
> > On Thu, 28 May 2026 at 18:01, Jai Luthra <jai.luthra@ideasonboard.com> =
wrote:
> > >
> > > Hi Ricardo,
> > >
> > > Quoting Ricardo Ribalda (2026-05-28 20:41:56)
> > > > Hi
> > > >
> > > > As we discussed in the media summit, I just created the Pull reques=
t
> > > > to add linux-media to Sashiko.
> > > >
> > > > https://github.com/sashiko-dev/sashiko/pull/224
> > >
> > > Thank you. Does the cc option mean the list will get emails from Sash=
iko as
> > > well?
> > >
> > > I thought the consensus during the summit was to keep the replies onl=
y to
> > > the author (and maintainers can check sashiko manually) but maybe I'm
> > > misremembering it.
> > >
> > > >
> > > > Please let me know if something does not work as expected
> > > >
> > > > Regards!!!
> > > >
> > > > --
> > > > Ricardo Ribalda
> > > >
> > >
> > > Thanks,
> > > Jai
> >
> >
