Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B403AF641
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 17:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136919; cv=pass; b=kZdzG85y8DqO7Jdphp7oaNpRatb4d30+KysHs7icjFLJERupq9lZRDG8jxZqa39pDhuYjBUfQCyHBRELtFroX+LXBU/oCxGeT4eoPyJPAhZCdtNyoiMULT+Y+nBZdbCn/OuzUdd4DT2ng4YN5Y9QOHEUSfVzX50BvIisZ2G1NgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136919; c=relaxed/simple;
	bh=lotNcuevS40zn5YZkmsVcLYe0elkwwqNV1XX5NJ0BfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JDC2uFis/fX8DcphlLDf2cYQrZoU42VRmcxdYIhyQZcYXf7wnWSO/zNgRvZIdn5D5HIDrVJDr/zeBVuIuqY2YQfzmuSi3A+Hc0O/99AAvrnc2fR7eFUqA+NGX+w+fB6WNMz+F0wRap8viT/evVdnvTzEIrlVXmawkwflLzRJXbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQPj5Mq2; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQPj5Mq2"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381f03d7be0so830540a91.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 10:35:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784136918; cv=none;
        d=google.com; s=arc-20260327;
        b=gyWREFJCt+fLoGEP5hRcP2gbw4O1bPCsrq3rD6ruzKjO4t5zgha/AN//Hb9WGs//BF
         IyUtk5kvxmG0wwMOUiCCAM1PTsHISa2mo+rgeT8VSVU5A1vVwqTwkUnX7AQY2vVGb0gX
         vGi887OO+bs7Fg/PZLnPdAOk/0lOoAvyn0tkivpO4rRcrF7Z2pVtyqbjl9gYdt2K/9Z+
         Rs83UBJevlPTQxsrRtSCej2HP0HwCexHG0t2CHxWK62d8Motv2xwNhqzQK3LIy9myZ98
         LNYp6Q6ESswK3pXfUKiBrGMHuhZ9YFpxvlTLsd5VU7/Q0BUxJh8xMShfVCpwJn1Zq4Az
         8PIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FF5Kv2TdOaADP6f6RpKmYvf3/WNfqsszIjO95kkwzRM=;
        fh=EoV9AvliQXn0DDD0fKcS+JwlPQU9IZ5qYmPSPdTfFDw=;
        b=pnRvEQmtNyLNqrfmgE+6Ic47A/FYJ95zJybuNiP1Z+Zwaz0z0sgasydpJhS8pdTtRs
         tDdk1lLWPoE2c3BmoRiHeh95NbcsHuUr2Xqi+1Vr8DbM3KCY+8gj0YXhd3Mj65dhp8Bb
         +JkFw/w+LdtgauDO6OjWhQmr0amLH5M+YtMFdDVVbMrqcRv/DYefP1j3gDQ8snvOJ4or
         C/t2flyck+JE1FPCilLtfMyrhy/PSqrWWLNvxvy9Whv7T3HpPKmk6p+J2fhepAOwcHuW
         EN/GOnwLmyQHca6YOgjNk9sCw0TTnJUWpWqe9VJST2aZu1qyirsig4epLbbXripOfRwK
         Y92Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784136918; x=1784741718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FF5Kv2TdOaADP6f6RpKmYvf3/WNfqsszIjO95kkwzRM=;
        b=RQPj5Mq21WPcivUB8W0h692gdQKntXcFHAYWlueaUi1DJMMvSAnBnXaQyecTH6IX4M
         Xku3e9N20CThcnqp7HP9V6qrsGCrxsk9usr41YjIxo2OHO3NR/xSRq9wFwiPTICRG18J
         NHUksr9uDX4WAH6fTTEt4LCFgI7OLPGm+EQugmRAPbfMbLW6UIkvDlDMjhGjmopRZqG+
         c1w/OXm9rbrnkm1eugZRFr17uQJTJPLwWgpD5nlpRnzCsd34SCQCmAcnLt+HfZ9Kwn0c
         49K9GgA0w4llQvXdYssySr9GzctK5ZDjpCT3hCtNtN5T9X8I+g99fp1ZcoLXLnYL+AKv
         +7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784136918; x=1784741718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FF5Kv2TdOaADP6f6RpKmYvf3/WNfqsszIjO95kkwzRM=;
        b=QUTDojBV1kd0cdG8wsHCcKftrLXUi0Ee/AuSrjFtomfIh3oOC8piFHFhCJigiIq8bz
         dQ/Of9WMKi5Sw7WmlFvy7yFBQGCtgZ2az7qd3uVvy5K8v50iuIrlwybD8j6AsRKo2P0e
         zLyQ8+rbAfeL2E/X1CDtLHsLB/XbBBJFdaaY1qMuLt7nzRxB2UJ2ukD9flt2JUdOYrzu
         CyLQzAjFFH9dWU47PiEp1lanGTe9LnJIwMacnD+U1IyM8ez0dl5BCvoOCOmoj9yV+J9n
         5OtKJ19Gr6UYXiy0EXjlm71mUScTVCoMnFP/2m9iZQ8gX8vriQ3cTKZITT4of+ci905C
         UOig==
X-Forwarded-Encrypted: i=1; AHgh+RpnrAWrK+nzQSdO7rE5rLFi5r2JT/0w6O/QRF+F3QhNHkQD0dx/fJTwZAIZfQwKvcZC1v1ct6tbB3Wofg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEWi9NA5YrhjlDt/3Wb93y0YIteBAW9DiNpUmr7knqT72NDlA/
	4VLNhZw/7odDTHPTHAvTfx2QtP3IjpJR1lu//cY5JZB/Vvwk5BohfG/QB2SefT7ACgJb3XyCBb2
	5Q9OXpLhAZ8FrkqpiIaXLRlpMi2DOlU0=
X-Gm-Gg: AfdE7cmX21/bxnRtbrDAxCjsjqwxa28PAtSZtrdYNt8NUYPjpri605n+m5GJjdRYGuN
	x5OMuOChQIC+ORYoQ0eLiydNaEeFy/wWxx4cZzgu8KVhAucbvczqjUl19aTFvVAIysC8ZnoNiFp
	kAnnLvs6DrAyJpfMxWPEMqPO01JKTfTn52/wkUeOjt5hqupwNzbfeos4ikxGEWCMP9oIu3/gNQk
	k6RA2i2ajaEAWM4MDz8SFFioIS9GBNL1lBPUwFHpZdozU0wMqi64v7jo+SuRRibUm3oJ/Bv3bds
	jsvadtApV9wdF2OBkLUMn2DJV+fLr6CzRMWDJXIOqOoUVLnkKv7kQJ0Q8USi2trhyWwOe7Px3LA
	RLRt2E9TJR+so
X-Received: by 2002:a17:90b:4984:b0:380:9cd1:d985 with SMTP id
 98e67ed59e1d1-38dc7c111a8mr12003442a91.6.1784136917742; Wed, 15 Jul 2026
 10:35:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710074528.5a6e4457@foz.lan> <20260710083845.23c753ca@foz.lan>
 <87wlv2jq4t.fsf@linux.dev> <20260713095538.3d5e86f1@foz.lan>
 <20260713094120.GD1127719@killaraus.ideasonboard.com> <20260713220427.582b28bf@foz.lan>
 <7ia4mrvtrxjl.fsf@castle.c.googlers.com> <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <alcBvuIMEGSjAD1R@mit.edu> <20260715161111.GC1778116@killaraus.ideasonboard.com>
 <ale45QPntcwA-aLB@mit.edu>
In-Reply-To: <ale45QPntcwA-aLB@mit.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 15 Jul 2026 19:35:03 +0200
X-Gm-Features: AUfX_myfke9GJHcx5jQ-OBG2DZyRtYIDvN24co1235FHFivjvAAJn59ofpzjh90
Message-ID: <CANiq72mc+X6DBc2-ZR+R=Q+NskX0HKRX3vd5pd9_m1memz0_dw@mail.gmail.com>
Subject: Re: Linking Patchwork with Sashiko?
To: Theodore Tso <tytso@mit.edu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>, users@kernel.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 7:15=E2=80=AFPM Theodore Tso <tytso@mit.edu> wrote:
>
> I don't believe that triaging LLM revoews should be forced onto the
> maintainers.  Remember, the contributors outnumber the maintainers, so
> forcing more work on maintainers don't scale.

Indeed.

And even if a maintainer has the time to read carefully every AI
comment on every patch, in an ideal world it would still be good to
have the authors read them too, because then the chance of
disregarding a true positive is lower.

After all, the authors are the ones that have the context of the patch
since they just submitted it. That is, they are the best placed ones
to filter feedback that arrives soon after the patch is sent, AI or
not.

Of course, mistakes can happen, and there will be instances where a
confused AI may confuse an author to change the code for the worse.
But as long as we consider the result a net positive, it should be
fine.

This is the position I gave Roman back then, and when we enabled
"reply to author" in Sashiko, we did see authors engaging with the
reports. That actually saves time for maintainers (and reviewers) in some c=
ases.

In fact, at least one person asked about running Sashiko (or the
prompts) on their end to get their patches "AI-clean" (to some degree)
before sending them to the list. That is good -- it is like getting a
patch lint-clean before submitting.

Cheers,
Miguel
