Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01733DD51C
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 09:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784281257; cv=pass; b=pXW5xQPjpLMz/Fc2pli5z035m0Nu4sNs39mGIjiLOBzCUPETdKbsJcox14XQWPYoho6PwzVUyijinKW896HaibL6EMPkxYwzNDafQYUWZE5vFB10DYsJCYxU6IuEqFoiknj3wYWSu/eTLnMkRB7CbRki5SufMd/yj/GJf98CV9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784281257; c=relaxed/simple;
	bh=jJAbX/KMkRMBuDgXDivklP/n64KQPEKkGuR/IpCZsbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Em1/9O9btJ/j+eO9Th2AZq6Cc20f84MvbojK7maFh+Ob+ueniUhkQahJyRIj/cVP6QQ3rswfhIYvrylrqy6YR0fb5sGWIgfvfbWodHs7kYcQCzBNOwMG3sRXT/cUop//vAqk3ODj8X8lhh5VA9tBSedbi6u4Vjan2WWfu4lz6vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dxr+guVz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RFMr4azK; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dxr+guVz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RFMr4azK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784281254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zArKPQ+mg0v3LhugyeNZU4eEg22p/7FN/529hVZ0mUo=;
	b=dxr+guVzaZfsfR3ICCXj/hGCSOZm8Uga6f5YRzIUThKgvTvDoptMwiFmRdnQ4ouofddoVk
	NtiMIBuhs9ucRQSxK/cmD66iNiamxwSmSQTq7quXLf+enFKEKNIRc/SvaRXmnQlXqu+nhC
	YzDcPEb05UsXneysDRBR78e/Ch+HsEE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-CAWCut-JNRStOW7sWDuAcw-1; Fri, 17 Jul 2026 05:40:52 -0400
X-MC-Unique: CAWCut-JNRStOW7sWDuAcw-1
X-Mimecast-MFC-AGG-ID: CAWCut-JNRStOW7sWDuAcw_1784281251
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-476d52b13d7so3853731f8f.0
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 02:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784281251; cv=none;
        d=google.com; s=arc-20260327;
        b=Fe9oAqmBdMFsxuIEErikQ81JquJfgQU8Hyq28xlu9ZqNau8QRXOgMqWBmzeTqqy6sT
         o4V6FmYZEEB9f490KX3hN1QnjLC4pHmVPkcldlSVzp+E1F60ooYO5n8icduw0xp3me02
         SYXDzRu3r6yOEfFOy2+yEpwACT36gLVDvbJRlvS1CDnlbV0OtBpZzOcId9LyJO1c7jGK
         NpQUpIkymsjPikedFWbB+JocNTjlSUeYt+9OqbKkOMHf5QPiZiiHlQFSmgC5DSKylqRF
         zPk71iXUxIYo4b92oj/fev+oGZe5fZYbZ3DREji+ItH2Zg6K7njlEXZ3TRtteYkRHZms
         lltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zArKPQ+mg0v3LhugyeNZU4eEg22p/7FN/529hVZ0mUo=;
        fh=V5wxXdpddN6oTYDzRtvSyTk0EW8WaTX4/tbakMfX800=;
        b=mFYEtIZgRijj0StB4hVZQ1rirJu3zSfceNpyrFBGSdAqvnc11e6IP0kPfkaGGXsLDa
         sFKP6tsN7pHmCGVkg2jaC/O6vqA5SiuBH8WyJzUEQtAJjW3WuWrwkHW9/LZigl3fLSTj
         jQX+RqRN0oxMXR0Xd+VANkDx1yOVsmarzB/muXv7B6E3eVFqvJ//OnKkK8mRdRF6AxTf
         6LyB2a2YZbRHms2jcZJADoeSyDrhP0evAD3EzkDJQRq0Y8ZywwXKwhcl6BESYh8P+uAD
         3V+dS4rmWHcYCjp35tb7yDSWp5977ki30xaEGYzkxbYxh4QdpccOaTsBo+3cejQvgNQM
         IPUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784281251; x=1784886051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zArKPQ+mg0v3LhugyeNZU4eEg22p/7FN/529hVZ0mUo=;
        b=RFMr4azKNdWIkmDL1VpQ4ygWghJ47P88PG5IiaKZYxDU4KJ1ouaYkgmhyOfFv9DLnJ
         j/b3s3JoT+cilUOdtxD8Cqnbfpj9SI6El9TcD5+NHGBqkHUb+KkGU6pxYBwRVhlErwVL
         maYhyinPjqT26hAxB+NtpG55pekDXxqpCBmuxjlRXqlkYaFjRvG2fSEePMbSnLItxy0o
         sZ3UcUDJf3zqU1FR8d0EWhc7NFOZpsm/CAIjSGyz+eATD9y7jS9NYqrGdrLaNSVzE78H
         g+XbPDRy4uNwFV0inWA3+mS8Ot1xJ4cZuXNOa7dHj0BY+333SpEUFkGu9XBfooj/Fqbh
         CzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784281251; x=1784886051;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zArKPQ+mg0v3LhugyeNZU4eEg22p/7FN/529hVZ0mUo=;
        b=Ev/jATe41Mwesv2QGuqPcLcEHX8Ay4U6tWWvtihgsEGlXBnfbpTaOmINvd5GmVK+wd
         BfpKuMNF6/iNS+2JIdptTgSv/8uz0X0ssXvpJoVr6qS8ZrTAZnpkGNkfw3DgzvbcF2PS
         BES5/jgEYrxfk6WUOd6FKE6w9BGFfuTxGyXvSYyeBs1m/pnuymSpUrf132atPRh313ac
         WXoyG7YUOARbH2coSLvXddmHQqQV909O8FOfql1Hjzp0kUOItEhPOMi9JhqJ1c/bhP6x
         E3KRB7gYO25ASSxOjlEi9hQFOQXpim2/iuFt8dRMTMPr9GCErrUZvwz4Zqj4xT4OS8SM
         kW+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoSY9VKNBoBilUa5garZZVZdtwtNhX6JezpmQAA573d1WXr7Syi5h8VCeet4Fao3ijtvWXxeH9Y+Jnwbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywXSznjg9BQncE/VrVDf2EKdQS5u1vhz3af05QApVc9SNFWOXP
	Z27qY+DNnuNoQjrI1fR1CIPnWPgws/ozwxCYEq+65D+X8dN074V1cye28Kk54IeRPy4FIBwENq5
	s8LmfbjedfVNg0ucIKkkKELUkv0yTjs6OQyuZt4v423OTLhPY9uWZQUeA0e6EoXK5jimrUi7pHR
	X7+UAPIapFGoJnpStTDXVWi3kzSTot4RK9uCMtRsk=
X-Gm-Gg: AfdE7clSPfCcIlC95FrctI/UUzTA4yJLrlyRAG2LBi1YkhUtKveo7WpRTnAzMFOv0vt
	Jrx02JtXKESYnylz3ARoTw47v2VrQl4g2X0fm7yqG7YPIfmPG5akVIu7oC1j/0k2PbsH5BJUZFo
	TXke7s2Wc0Du8dMI1XHJ7U36cjJEepDd16fXkU5MQ5YxQdWLASfbtrL2ehyimsVFsGR7aTKCy6+
	O+cPLXgX2lqnU32M3t8px8fxyDQBjz2daPNQHqghRDv4XWOrCdF7js02ws=
X-Received: by 2002:adf:e18e:0:b0:47e:12d9:1c79 with SMTP id ffacd0b85a97d-47f622ffc75mr2529511f8f.27.1784281250813;
        Fri, 17 Jul 2026 02:40:50 -0700 (PDT)
X-Received: by 2002:adf:e18e:0:b0:47e:12d9:1c79 with SMTP id
 ffacd0b85a97d-47f622ffc75mr2529456f8f.27.1784281250328; Fri, 17 Jul 2026
 02:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev> <alc3gAJfAkG5DULJ@zed>
 <alfBvhZkAelq5RVf@mit.edu> <aliMsSH373RJ31Mq@zed>
In-Reply-To: <aliMsSH373RJ31Mq@zed>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 17 Jul 2026 11:40:38 +0200
X-Gm-Features: AUfX_mxy2zLQcfSd7pUw-OcjYhgYnbXLv9QgdP4rJvr-drakzWhMw1jZFdGPHG4
Message-ID: <CABgObfbBfrHxvJGLt+FhnXTGm_Jr=EZPpTnEntALPEbc0hKiFA@mail.gmail.com>
Subject: Re: Linking Patchwork with Sashiko?
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Theodore Tso <tytso@mit.edu>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>, users@kernel.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 10:20=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
> Fact is, reviewers/maintainers are scarce, and I got my time sucked in
> by an hallucination. It could happen with people too, but the rate at
> which LLMs produce output is super-human.

Maintainers are also spending a good part of their time on AI's
finding a backlog of 10-15 years of vulnerabilities...  so sucks to be
us either way?

As an example I just posted a relatively large patchset and got the
following results from sashiko (categorized by me by hand, took about
30 minutes):

18 true positives
  3 actually done in later patches (patches intentionally ordered
wrong in RFC for ease of testing)
4 false positives
  1 comes with a suggestion that is good anyway
  1 is code that definitely needs a comment
  2 real false positive
3 need further analysis
1 optimization opportunity
1 correct observation but left for the future

While the code was early, it was not awful, and nevertheless I got a
pretty long list of things to do. Setting aside the three comments
about bisectability, there were 2 fully bad reports and 3 complex
observations needing further analysis, out of 23 reports.  It's a
total true positive rate of 80-90%, which is way better than most
static analysis tools. And unlike non-AI tools you can bring down the
false positive rates for subsequent versions with a comment[1], or a
change to the commit message.  *That English text will be there for
humans as well*, which means that even false positives sometimes are
useful.

The AI tool is not perfect and if you read the raw log you sometimes
lose an IQ point or two. The text sometimes makes no sense as it
throws everything at the patch until something sticks.  But at the
same time it clearly takes into account stuff that no other static
analysis tool can. Now, KVM uses processor features that are a bit
obscure but at least the manuals were in the training set.  That can
be different for other subsystems.  But in my experience, while
Sashiko adds work, it does so for good reasons.

> This might sound just one anecdotal experience, but is not just one
> off. That's what I ear from most people doing reviews and driver
> maintainership, and that's the reason the linux-media summit decided
> to keep Sashiko reviews in a separate mailing list as an opt-in for
> interested reviewers: to avoid overloading the most scarce resource we
> have: maintainers and reviewers.

Sure, that's fine if it's like that for your subsystem. But to be
honest as a maintainer and reviewer I _would_ subscribe to that list
and check the results before applying anything, and therefore what
you're *actually* doing with that choice is moving work from the
author to the maintainer or reviewer.

BTW, I totally don't buy the argument that AI review makes people feel
diminished. If one feels that way, maybe they had too high an opinion
of themselves to begin with. It's a tool and replying to an English
sentence is the same as replying to a lockdep chain. I for one know I
am worse than many others here... and nevertheless I became a
maintainer and I'm trusted by Linus and others despite the occasional
disagreement.  Our value as members of an open source community isn't
just in producing perfect bug-free code.

Paolo

[1] For example, you can see the evolution here:

- from https://sashiko.dev/#/patchset/20260326181723.218115-1-pbonzini%40re=
dhat.com?part=3D10
which reports an issue: "Is it safe for is_executable_pte() to return
true if either the supervisor-execute (XS) or user-execute (XU) bit is
set?"

- to https://lore.kernel.org/all/20260408154217.458420-14-pbonzini@redhat.c=
om/
which has a comment explaining why it is safe (for now), and does not
have a comment from the AI review

- to https://lore.kernel.org/all/20260624213102.71082-20-pbonzini@redhat.co=
m/
which removes the comment by rewriting the logic

If you look at the raw log for the second patch above it clearly had
again the same objection took the comment into account: "does
`is_access_allowed` need to know about the *specific* execution mode?
If the fault is from the User, but the SPTE has only Supervisor
execution, would `is_access_allowed` incorrectly allow this access?
[...] the comment in `is_executable_pte` is key, and it all makes
sense [...]  `fast_page_fault` is never used for shadow EPT (indirect
MMU), and regular page tables always have XS=3D=3DXU (direct MMU - TDP).
[...] KVM's direct EPT (TDP) maps GPA to HPA. It doesn't use MBEC
itself; so, it will always set both XS and XU the same. This implies
that they will be the same, and `is_executable_pte` correctly works".

It's not entirely correct terminology but the overall flow makes
sense; and the comment was clearly useful to have, because it pointed
out the need to rewrite the code before making further changes.

