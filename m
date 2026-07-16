Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A090E330659
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 15:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784214303; cv=none; b=jJVMleQ7xAEwceSQBFTP2SwN+FLQY20XvR+YQ3AnG+lcgjR+ytV1MctYizgiORWd2VN9m/f1rwDmFbdxRgmevuT6ieYklziBzBkhXKHMrkMwckyzmuBpot+9FSqPMcXpvuSXDeNcA2+tmR1qO/9eDpegLIDk18uGNaKfF1yPYC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784214303; c=relaxed/simple;
	bh=wXfSYEa7F/UI/UoyMogygaOBI7vMQy6IjsPWOJwBiKk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NWAHtUlnaCpK3gmxRIQkQ0+6k71px7QmaPAoY+WZSmlopU9wtK6LnsnIFdiKV4zMhhVrH8Tz1AbSLwbFHbTGi3okFTlEeGbnFuftSO4KX2PQNam9M+Z98RMp+hduFy42CtxlnOjw4YpBDSwse0IciEo7AtIVP+0IRvR+pEWEz1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XV4Rf/Rq; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XV4Rf/Rq"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4953e1062e8so3874425e9.1
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784214300; x=1784819100; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wXfSYEa7F/UI/UoyMogygaOBI7vMQy6IjsPWOJwBiKk=;
        b=XV4Rf/RqoGkxrsMCThdskV2QgEjhOCOz3g33pF6HvOVJU+lBhkhANaV2FHhWxqLFGn
         gTgTqjjBA9dpHZP06ZiowMwj+wglzBlOTO44wF/6Gy/cBUacFKF8sSqa6cD7GYXWmri9
         lTQjnnDq792Ie1Nmi2xp+XIIYBfnSsfdfEDaJwU90ZqQ/jHySCGWca+eVp3iDy4cKmZy
         +m99jp48iod8fsKtPeub5C1CnNaFAOWTjKF9emtSzlTXPzDa2jv3+PP4sYSKArZy5IkH
         0JyM/qEaWAzGD9y5vI6x6oi6sAeSa7nXq7e7NpicxQiar0N2SQ7PjRVuiWSEv8nZqbJk
         XSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784214300; x=1784819100;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXfSYEa7F/UI/UoyMogygaOBI7vMQy6IjsPWOJwBiKk=;
        b=isg/MkmII7IsOeAR5VKsz50cy2u/uO2oOxj9TUSNFWyhJZzHZzwlxbTAJmAAXrOTb+
         n0a9SOUufem0fOQuTFlhzDmgX0BgTmNFkTHoQCLttDfjDensDai6/MzarkarSSk04Gj3
         wSdvG78qlAkilqtlc9KpxA2wmf6+OOK8g0phPyBiTg6NARCoEzTX3iKjSs3JuxFUq010
         2OONSMsdxYFlzYLmVYK6+NEJzDgNDpU8btH6DfSHlFYv36dgRz23hBNZEpZ+0M8nxyb/
         lF5fXAKIYzoF6vHn2hAF08ATFysumepAAVLdNi/AP32EJmvT9Lw9c70a872n0T/gIwg+
         IflA==
X-Forwarded-Encrypted: i=1; AHgh+RrWS4zGJUQ+aPuRwK2MWkUdyeUM5/z5YplVD1f3H48sZnXuq6eB6/LoEv+6A/thF3Ij8CUo/Bh5L4tx8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTJOf32hR2EEZxymDVgvvXDSkYOwyybTcDe8H7U27Y4T4O/Jou
	y3NWdQ2xm3k9nbli08rwny4opZyLvbPVGiJVerAL3QHtrnIYBoRBoWhB
X-Gm-Gg: AfdE7ckM//3Vd7lXr+pkfV/VKeAj9AiBljjjlavA2HFzsxT0aHPwgIXK1WQmbpovd5i
	3fpOwKn4NOZnSU0DZMR/fmQqor5FVIVIc2MNotV9667e2d/NHUiftSp6zjgVvo8Y1dyKPAxzKIQ
	ZNgJ1025amx20AJPkmVV6HO9X1/ogYrLhO9rCD9e63bxzZdPWWgzAHiWCNhubMzpyZonmRb+Ca0
	smAOCoH4OsxMWJ/0bK11TwO/r1UqLlVTQgBaV93/CYNJGoGB7Ezo6Ylb1apTBXu7ytLiRRKxabb
	38RTlcKIA0YMRE/OgsL71Ld2OTk6RtJK/8ghtoy7vneN+yCB55EQxBKpv+rHQPd9WbhzBknxzqu
	vtjLHBP9ouenj6V5T4SsKUJHXOvAIIjlcQoeZZ4YuZlZGNNv465DrFl7sGlpmPq+/yvRWADXXA0
	+Bf3wuy93PjrzyYV+Nggw+Xtld3Y3h
X-Received: by 2002:a05:600c:6792:b0:495:3f28:3f19 with SMTP id 5b1f17b1804b1-495407316c4mr52967395e9.37.1784214299505;
        Thu, 16 Jul 2026 08:04:59 -0700 (PDT)
Received: from [10.1.0.100] (62-178-209-45.cable.dynamic.surfer.at. [62.178.209.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541ebe625sm58832345e9.15.2026.07.16.08.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 08:04:59 -0700 (PDT)
Message-ID: <4ccd9f0cea1adbce53f5d1f614382315b20ad9c2.camel@gmail.com>
Subject: Re: Linking Patchwork with Sashiko?
From: August Zeller <augzeller@gmail.com>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab	
 <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>, Matthieu
 Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Date: Thu, 16 Jul 2026 17:04:50 +0200
In-Reply-To: <aldx9KiAHM4CRI0m@lt-jori.localdomain>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	 <CAHk-=wi4zC+Ze8e+p3tMv8TtG_80KzsZ1syL9anBtmEh5Z40vg@mail.gmail.com>
	 <aldx9KiAHM4CRI0m@lt-jori.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

> While there is some truly ridiculous anti-LLM brigading in some open
> source projects, I feel like saying it is just another tool does not
> do
> justice to some of the harm that is done by that industry. Also,
> precisely because of the usefulness of LLMs, I worry about creating
> an
> uneven playing field, where new contributors can't keep up if they
> can't
> afford the needed tools (something that is not as much the case with
> compilers.)
>=20
> These are not arguments that others should not use LLMs, and I find
> LLMs
> to be tremendously useful for reviewing code and understanding
> context.

The frustrating part of this situation is how everyone arguing on both
sides is right in some way.

1. The tools work, yes. This used to be up for debate until recently,
but now it's clear that AI can enhance contributor *and* maintainer
productivity in the kernel if used correctly.

2. On the other hand, it is also true that LLMs and derived tools are a
comprehensive manifestation of the problems of the industry and there
are valid ethical concerns regarding access discrimination, copyright,
workload externalization, job loss, etc.

3. However, a "no AI used" policy is unenforcible. Many people would
use these tools regardless without announcing it, which is the worse
outcome. If we're transparent about our AI usage, then at least
everyone is aware and can treat the affected code with the right level
of scrutiny.

4. Moreover, a "no AI used" policy isn't the best thing to do
technically, as AI has proven to be very useful to catch bugs, review
code, and even write some new code. Some critical bugs that we could've
caught with AI *will* slip under the radar if we refuse to use those
tools, while bad actors will gladly use the newest models to find
exploits.

Overall, even though I've been known as a great AI skeptic in the past,
I'm with Linus on this issue. *Accepting and embracing AI may not be a
desirable thing to do, but the alternative is even worse.*

- August

