Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FAA26738C
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 21:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784149751; cv=none; b=LFp0EbVzSqJCpbpK9/3qv3EDABZkCdHq6Mi1BQN4HWLNVGLVz5YsmTBWe3LxF0pJv0E8Nu7M26TX4Ig8aX1j4tI0NTAXfo0OEerzcRfs98e3BZ4vIy3qyTfeVJOl0+HwMBd/PaigqdwiWsrFap8QG1p3YAOwndYh8rWI7AdMhQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784149751; c=relaxed/simple;
	bh=SKkv3ErHhptdfYoAwGSVeqmf2EaneXa/hPmwiywYFgA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B2QU929ouWJt1fI94G6pJXo0bUBIqlTyUnyyEt9FRAWC2/x0DcuPDgXQS5/hLQ47eGHer42iD+uicQV+nqz+9IixuSedDUpEPqEjXBaJGyUGxO1rSKEjQykGL1gV8/mKh87CoTFq5NLQy3WMv0nYm52GMNc4Yn5ipI9su7K9Ecs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qj2GJS3+; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qj2GJS3+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784149745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5G8w25jbF9nT6RuVbcyyH+9ndfwQr+hlB09IP9hSE40=;
	b=qj2GJS3+7Abfh6Yjz0oQS98HIil4ON+oMoil6PZ1XMou5Nc6n68JU9CvDb2tV7XeciF63r
	7SqUjwRzMsi4bukdoafuxZqibqEeMAi0M7QN4dphAkiRGeHXZEgZROx+nzPZgad9mm6jyH
	YXUJBVgiSCz3CO8KOi6hsGXZYmzzePI=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,  Derek Barbosa
 <debarbos@redhat.com>,  Matthieu Baerts <matttbe@kernel.org>,  Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>,  Jason Gunthorpe
 <jgg@ziepe.ca>,  Steven Rostedt <rostedt@goodmis.org>,  users@kernel.org,
  Linux Media Mailing List <linux-media@vger.kernel.org>,  Stephen Finucane
 <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
In-Reply-To: <20260715162816.GF1778116@killaraus.ideasonboard.com> (Laurent
	Pinchart's message of "Wed, 15 Jul 2026 19:28:16 +0300")
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	<4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	<20260715162816.GF1778116@killaraus.ideasonboard.com>
Date: Wed, 15 Jul 2026 21:08:47 +0000
Message-ID: <7ia47bmw0xls.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> Hi Roman,
>
> On Tue, Jul 14, 2026 at 07:00:54PM -0700, Roman Gushchin wrote:
>> On Jul 14, 2026, at 5:59=E2=80=AFPM, Laurent Pinchart wrote:
>> > On Tue, Jul 14, 2026 at 10:55:42PM +0000, Roman Gushchin wrote:
>> >> Mauro Carvalho Chehab writes:
>> >>>> On Mon, 13 Jul 2026 12:41:20 +0300 Laurent Pinchart wrote:
>> >>>>>>> Individuals can set their
>> >>>>>>> spam filters up if they don't want to get these emails, I can't =
control
>> >>>>>>> it. Providing individual authors an option "I don't want my patc=
hes
>> >>>>>>> to be reviewed" sound strange to me. It's like "I don't want my =
patches
>> >>>>>>> to be tested by unit tests".=20=20
>> >>>>>>=20
>> >>>>>> I agree with you, and, on my head, not sending e-mails to the aut=
hor
>> >>>>>> is a clear violation to one of the most basic net etiquette rule =
on
>> >>>>>> mailing lists: any replies to posts there should reach the author=
.=20=20
>> >>>>>=20
>> >>>>> I don't know where that one comes from.
>> >>>>>=20
>> >>>>> What happened to this other "most basic rule" that subscription to
>> >>>>> services that deliver e-mails should be opt-in ?
>> >>>=20
>> >>> Replying to an e-mail is not subscribing to a service. It is the
>> >>> author's right to know if one replies publicly to his e-mails.
>> >>> Explicitly removing him from the C/C of such replies is a violation
>> >>> of his rights.
>> >>>=20
>> >>> On other words, it is implicit that, if you post an e-mail, you'll be
>> >>> expecting actions or answers to it.
>> >>>=20
>> >>> Now, if one really doesn't really want to receive e-mails from a
>> >>> particular sender, a block list solves it. Alternatively, a way to
>> >>> opt-out is welcomed.
>> >>>=20
>> >>> See, this is different than adding someone to a mailing list without
>> >>> his consent: On such case, people receive e-mails unrelated to their
>> >>> preferences. For those, opt-in is the right net etiquette.
>> >>=20
>> >> I agree with this.
>> >>=20
>> >> But also just practically: if someone who opted out from sashiko emai=
ls
>> >> posts a patch and sashiko finds say a critical issue, do we expect the
>> >> maintainer to go and manually check each time whether the author opted
>> >> out and forward the review?
>> >=20
>> > I expect maintainers who want to act on sashiko reviews to triage and
>> > verify them first before bothering authors, yes. I believe we should
>> > follow the first two recommendations of the Software Freedom Conservan=
cy
>> > on using LLM-backed generative AI systems for FOSS contributions ([1]).
>> >=20
>> > [1] https://sfconservancy.org/llm-gen-ai/llm-backed-generative-ai-reco=
mmendations.html
>>=20
>> I think it makes the point of sashiko - helping maintainers -
>> unachievable.

Hi Laurent!

> Why do you think so ? As far as I can see, there are many maintainers
> and contributors with a strong enthousiasm for generative AI reviews.
> Assuming those tools would give a net positive result, isn't that
> initial mass sizeable enough to help maintainers ? It could even be
> argued that starting with enthousiasts will help convince some of the
> sceptics over time.

At this moment there are 36 mailing lists who opted in for delivering email
reviews over email (without counting linux-media@). In every single case
it was based on maintainers requests in all cases of a disagreement
between maintainers I took the conservative side.

Also:
$ git log next/master --grep=3Dsashiko -i --oneline | wc -l
826

This is in less that 4 month since Sashiko's public launch mid-March.
Most of this commits are bug fixes for existing issues discovered by
Sashiko as a byproduct of reviewing new changes, so arguably there is a
larger set of bugs which were prevented to enter the kernel.

So it's fair to say that there are lot of enthusiasts and lot of data
already which proves the usefulness of AI code reviews. If it's not
convincing, I'm sorry, but it's unlikely I'll be able to convince you
anyway.

>> If the point to not use LLMs in general, let=E2=80=99s discuss this, not=
 how
>> to make each use case more complex.
>
> To be clear, that's not what I'm calling for. I'm asking for
> contributors to not be forced to use LLMs. I'm not campaigning for the
> kernel to ban their usage.
>
>> It seems like [1]  expresses a very anti-LLM position in general, which =
I can understand and I agree=20
>> with some of concerns. But I think it=E2=80=99s up to project leaders to=
 decide if Linux in general  takes this=20
>> position and my take so far is that the answer is not.
>
> I would be surprised if Linus broadly agreed with [1] :-) I however hope
> that we, as a community, have enough shared values to listen to
> everybody.

The reality is that there are multiple actors in the world who are
actively using AI for at least the security vulnerability scanning across
ALL Linux kernel codebase, including your changes. And it's completely
out of our control (ours as kernel community). And we can't ignore these
findings completely (how to handle them it's a separate discussion).
So there is simple no way someone who wants to contribute their code
to the kernel can pretend to live in the world where ai doesn't exist.
So the real choice is more like do we want to find (most of)
AI-discoverable issues before they get merged or after.
(Obviously not all issues are security-related, but it doesn't change
the point).

Thanks!
