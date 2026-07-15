Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2566741BA7D
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 18:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139524; cv=none; b=RScRXNswSyyD88GAZCHbr1ZC9/f5Ax0xqPmvTQ7rffaRxVy5AXhHTgEONG/SusvxgvJ00Sk8CackE4l8e4A3RQiMojYZPeSM7SjPthkAzEFtKERyas3bAy/Hwa6WhVV18UsfXHE8EQYuSupKSFkHr4LpADyohORar2Piiq522JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139524; c=relaxed/simple;
	bh=QS6sUX0R+lezz6EdqEUly2fltsPzwYz4hr6S+lzeYIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msYeaG2Xf0ODGhUZLSNSVKFpSkPNWEXkYb4tXutZ421MW1rd1AoRhAKBRQ/njm4qbbFDGb+5C9rsPRZIiOpM8PPHmpnApRDiv1cIzcZkOWvRzZg+s3rGJrWwfR+WeNAkLxH18ALQMpKve6bTqA2FqH1zzybe9zHsTibFndDttag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N5DlNJjP; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N5DlNJjP"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69532288224so10338338a12.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784139517; x=1784744317; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcPKlVwZdEgIFdUfDBTB2PFEAlHljUL0wImXB5fcx10=;
        b=N5DlNJjPUIMlDf85qAOWJqdxxWwaXTBObz/XII6IiOFNG3suRyNZEfdGRco2KNl36j
         bej2cpkIty/xcxx8o1XGiqRDtV9Q38voVWp1GaGYNFTie8lSxU7ecCcPsx0FnWw/HGOX
         Oy7eyjeCDg4EQiSD8fXieVu7juEEnH9vQyT/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139517; x=1784744317;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bcPKlVwZdEgIFdUfDBTB2PFEAlHljUL0wImXB5fcx10=;
        b=XKsScc84z2VWZCA+gaLPEcuz+WEEwCyPMb9kht0fz3G39O54apu+arh/eVJLiqBUt5
         g72HQeUVvkPfjOJ9lpG1A9MxCvNnyPLn539Oq/xDFfldWJQA8q8FJI2a5ZWkHYlW4vOT
         sfGrUgKTxCrSjN+Kt+zDIdAJrCCb3hMeSYKO9H6/wNB9MBDLh1sF1a0VW8FKfME0h2DF
         sSEkVaW83WfVxukq3D/DgAG6K6fF3CduuRa0iUlHC5nD6urZ+KdIRoFWIHh5/BY6Ea7I
         BdnOyTYE6/bTyuBAyry2ahDbovjcl0uUVcqS6w6Jj98pdelVY62nsyCwEwfhIwqBrVrO
         y3Bg==
X-Forwarded-Encrypted: i=1; AHgh+RovZnkc1iF56q7HvIsOKIQWm4LhqaTSZRkGXgXzD58JOZRrPCR1QG4vlniai5kX+hhAvMiEqGvfcA76Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Cl9iPZRUtrZn//00vHBDBTPlCrKb5l/AcgWYZ9OCiKBw8KeY
	fq4MkAXMVfiVDfi3OMff1WxioYJb3xm36J50SPUkYcIiUgXzbTVGbZJwOXzgBCFuYZ54zRgUZgQ
	zrH5DDnc=
X-Gm-Gg: AfdE7cnKOcPO6JwzauoSRQT57udLhpyyEeJxvyblx0Y0Gt5xgBLS+aQdwa7aaZBaIWT
	+np9XPDD2hf5w9+QLeEDREmNnZBKPtnEaQ6VRPm8UMJ6L/txkNVIwHyS6cwyE1b/VIjlwTQ4je3
	pMhr0hI55TzJBLi62YraggMtCyMOnWvh4vnv9RChJzZ6a78+KFmP3N9/ZP6xtRu9YcxThQM6nvs
	v76MsrKBqoSX/c2y+4TiwdFKAaOvPtEBLqhxctJa0Nfw3rn2RRvzLSAbPLXmnyJsRJ+i5kmLKKV
	OliQ5B/+N4zP8dUGGqq7B//5x8NVkR/mMThcTEzaS1X3/ddKG5WkTUxQRtrPwAHtmAcT3jOeAmv
	jhHX4IawOP4qXUClNtWEdj6UIeFdtmCcQKQRgFwT/G1AAgALhvnG7XzdU31qb82aKuvQ86gZ+r2
	tFssxe+ICQpu5w3/kdK0nbFmjHlnSwkpbFpgy7urLuXCPuAYw9hu4kOoYXqfYMOMTcZh7U/K0=
X-Received: by 2002:a17:906:9c96:b0:c16:2750:fc56 with SMTP id a640c23a62f3a-c1667a76e98mr509264866b.41.1784139516716;
        Wed, 15 Jul 2026 11:18:36 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1686f44f6fsm78711366b.0.2026.07.15.11.18.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 11:18:35 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15c7d22070so754812266b.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:18:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrWmkdYUE6cMRbgcMJb3G/Z5Y+Bc6gZJsvsYIxoNYKf/PWKIZlQ6ABWHl3HCHJhTVwzdOfBjOTKceYdaQ==@vger.kernel.org
X-Received: by 2002:a17:907:60d1:b0:c16:558:e6a6 with SMTP id
 a640c23a62f3a-c16678c8425mr499635966b.5.1784139514856; Wed, 15 Jul 2026
 11:18:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710083845.23c753ca@foz.lan> <87wlv2jq4t.fsf@linux.dev>
 <20260713095538.3d5e86f1@foz.lan> <20260713094120.GD1127719@killaraus.ideasonboard.com>
 <20260713220427.582b28bf@foz.lan> <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com> <alcBvuIMEGSjAD1R@mit.edu>
 <20260715161111.GC1778116@killaraus.ideasonboard.com> <ale45QPntcwA-aLB@mit.edu>
 <20260715174138.GI1778116@killaraus.ideasonboard.com>
In-Reply-To: <20260715174138.GI1778116@killaraus.ideasonboard.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 15 Jul 2026 11:18:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiL7kFVWNtvE5S9A4iqXYat66NaUqX1+gZT0QCndi4eQw@mail.gmail.com>
X-Gm-Features: AUfX_myTuqQNvpcLEtvQxPC4lJcQjnEJBPlfP6rgApoBdDBWIpMttvH0W0eY2Sw
Message-ID: <CAHk-=wiL7kFVWNtvE5S9A4iqXYat66NaUqX1+gZT0QCndi4eQw@mail.gmail.com>
Subject: Re: Linking Patchwork with Sashiko?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Theodore Tso <tytso@mit.edu>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>, users@kernel.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 at 10:42, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Please, let's stop comparing generative AI with zero-day kernel bot or
> checkpatch. That's not a relevant comparison.

You are correct. The AI generated reports are usually much superior
and more flexible.

They aren't just syntax highlighters or reporting "this doesn't
build", they actually find real non-trivial problems.

Now, I'm not saying that one replaces the other. The zero-day bot
finding things that don't even build or boot are great. That's a
pretty hard and clear signal.

But the AI reports are often a lot better than checkpatch reports have been.

Those checkpatch reports have gone through years of trying to massage
them into something that adds more value than pain - and I do think
we're there now, but it really required that effort on the part of
checkpatch maintainers.

And that's exactly the kind of effort we need for Sashiko and friends.

Because no, AI reports are not always great, but neither are human
reviews. I see less useful reviews by humans where I go "did this
person just try to get his name in the commit log, because that has no
useful content".

I suspect you haven't used AI for programming. Try it. Try one of the
*good* ones.

And I don't mean "use it for the kernel". Use it just for the fun of
it. Find something you want to do, and just play with it.

The open models are getting pretty darn good too, but for a first
trial without any real setup, one of the free tiers of the cloud ones
is certainly the easiest way to just kick the tires.

Do it with something you find interesting, but not "important" - start
small, and start with something you feel you probably wouldn't really
waste your time on if it was just yourself, but where you have enough
background knowledge that you can judge the output.

It's what I did, because I wanted to judge things based on real use,
not on what others say (and sometimes the loudest ones do it for
marketing reasons because they have stock that is tied to it).

You might find it enlightening, or at least interesting.

My own personal annoyance was how eager to please AI models tend to be
at least by default. I understand why it happens, and that people like
that subservient tone, but at least personally I was looking for more
critical review of the code, not an AI that had been taught to say
"You are entirely right" just to please people.

          Linus
