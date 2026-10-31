Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793481298;
	b=hG7spWaOJiuio5PzpO29yD3IUJP7Ht9KZAp2kMhpimiP780/iVmDadAVfVk1NpdFMUjH
	 SFh3E7L8TQKdG7262QINlp53ILixhJRGNBS72khwW22bMeQAUqSWBWTnHS6zLGVt0z9ya
	 ol80s+1AvDWZklT/zlaJCzVvoa04Qvs1KQW8w741IbmPknawd1jGYb5GXNAa3TmpN17sW
	 vJqYkpyQiyBP6v/xhlsbPhgTuWZh+KdDt/IGFEqmA2laCRxofCz5+4duwvgW6mMplIEbj
	 yGwqD6QLit1IbLYkHEWqwFmZ9/VzFLTzPRfyleDBmok4iE8OqBPmTQzr2afxYvrfxNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793481298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UT8zOBBGoDfTpj3pNsjdxxy8ejhTH0diBHKOBMAZTYg=;
	b=MEDSbeb6+C6nRBX1m9v4t2+3w+btog6JsRgqe0cPpYJPtOdLU/h+qRiOsTtGpFlK6V6H
	 qo+WVY7Iox61YWahgCZz5wRy1iOeP8G9XCegMQs5+SKy3y1IcAo8lEef3+bt9MvzIghTK
	 sIjpgAbHUgDapUpFk/2G20DUrages+oXRADtO+n0HxoVUmqOHpCdnCWBoV/zHU3q332gm
	 2gnZvDxdgsuW+nQLWqaHGKApEotp8a2+bfUXAstOuCb84yrq4pSAztiVXRTsmjXPEAd65
	 NPBtGEwmQ2EVmuNHNh5KuRph8xwAwPq+D3HDd56o67L1ug2JABNcsC91e3uPMOIBnxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=gfD9o9cW;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4806D606A31C
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 21:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4806D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=gfD9o9cW
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b486e1d02eso2322391a12.2
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 14:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793481295; x=1794086095; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UT8zOBBGoDfTpj3pNsjdxxy8ejhTH0diBHKOBMAZTYg=;
        b=gfD9o9cWqelHNkIggrnXJWdFNCnWZ2LsKAihXy5PKo9lKZgRIiDnzUWbxOZ5MOTRTN
         KgM1zTdStZxFnE/MCWhAVdb35FjLfa4hwfrEyqFmFr+FqlMZnVYSyoYQrt53UZkn7fOG
         Cy7IwdwVIS+PbsFrm+yKoMA0gF3SHP7isgcAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793481295; x=1794086095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UT8zOBBGoDfTpj3pNsjdxxy8ejhTH0diBHKOBMAZTYg=;
        b=jnbTJHRo2w/egPANi0v7BkLz2LVi98XiqqPsP3F29IIP5oJepNggtx48hhT5u1b9fm
         vl6wJ8wfvyTti8y3rqTOXvpjBqmojdaWeI7x3moBM4epdEJTZNVy93aYbdwa7IfQmjRU
         jXOhVNz28NKQF5Jfv5NljI2Pj/fGUN7JXpJbtm/5ZfMfvWxrZgDtQoX9L33UPgyg5pRa
         UAzUamLHhvSWod1fi4388ZDGQLC6sC6x2cNw1JBEu1mUmCXCI5N95fDBu4B8JKNyriD5
         HpgT3UPwCOTehbCLtBQIAjKuyNpS7xjtH59ptNlX2Uv2ZdECATsZU2lhzmqowMs9seMS
         EToQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbZ+f/iyvTt9WXAHbNNEOCEMjk54Emv+Tv+UxL+FoMFtIF+YeHSsZKfWKH9AjLGnOSkxaVAz5ap+4SJw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIAjSHy9ngPYJWLXLdtIipmGO6IvYkD6ruZxTAnsPtRA0SrK/Sk
	rtfdqADnON8dgHkaVNYVEvEaC9kJHXrbt5xjP3JNWIWmVxTZfvgpmnJk/oBzhJk9lVa7QooV5s8
	q1xOPfEY=
X-Gm-Gg: AYBFou3u8YsgBlxkL3kfFOcLDb345sgAOpd7S6bxM5ctOims3SZQyFYsUufk3n4yUFD
	RqdNHR3y9RFCjm6fFeM0JRUfCtdcXWqR3zdmfkh9++L2CncYWuzTpNIQoADvYuj9g8MdCJAorft
	AJHUn86D4F3cJTYAIaqltajaEpy7heweT0Fe7gfC6v/ButoJOC8jOMHng1p22GIz1kMwovaZWh0
	oCHlTKrWtaUmBjTLyh8c6BCo4UCHTS+dTuCdtUaH1b6otaT/AIWzf85+e2y2d2a1ejxLGLpf59F
	Qo+tNvYbU0CCXVSIIFvoDP1mSz8og+CY6QUDTlxavsyRjquBQWwpSzZL7/bqSA0NBvntRwl6jMm
	1M/BP5qQnp9kA69jMaaz/X1sirkzpIWdRAPOjG3wL+6XXkCKc67GlOLl9iirvrfTWc6MTgiKqZi
	adyrWgmtZ/3nYTVZqk+4exUVq7TNzD54eDSDCQvKbv1HWe7pdUu4l/vGVeVIVukiMuTqz9FnSA7
	nFA1MRZxyNamqSYXYzaSIt5EhFPC+temPS1jfQPuUIoLWYfqMbMkHdVpSMsDJN9QzLG5KqpAUuA
	iIEXPRMvm2zIkt6u6VKU+D0pN0CFDqTMhUsO/SHQZlYslNXi5HnISxdTlIqbYcDL+NRyQdIHkm2
	nh7Y=
X-Received: by 2002:a05:6402:5297:b0:6af:9dd5:f524 with SMTP id 4fb4d7f45d1cf-6b4d60d40b3mr3857094a12.37.1793481295508;
        Sat, 31 Oct 2026 14:14:55 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca29382sm1366271a12.37.2026.10.31.14.14.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 14:14:54 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c34bff61551so325568966b.2
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 14:14:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBweCwHyhTiM6iT1v6UVBq36GAIixgXNnwsSFF0q2TmnT4PvuiQxLy6NA6LLgdjlcdf8kchorQT9JftH3Q==@vger.kernel.org
X-Received: by 2002:a17:907:6e8a:b0:c49:ca4e:b978 with SMTP id
 a640c23a62f3a-c4ca7aed610mr501988566b.49.1793481294514; Sat, 31 Oct 2026
 14:14:54 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024185058.20410953@foz.lan> <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
 <CAHk-=wg0+RmcNDKQ4Qf82-miG4gjZ+CzqjTBET1ZZhkrPBp5Kw@mail.gmail.com>
In-Reply-To: <CAHk-=wg0+RmcNDKQ4Qf82-miG4gjZ+CzqjTBET1ZZhkrPBp5Kw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 31 Oct 2026 14:14:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wixKLm5ahcYJ0tZNViP298RNJ_QwDcXN-AheH6uOfLZwA@mail.gmail.com>
X-Gm-Features: AclHuK-PA9_OP2L-Ic2kc6kRoIyFKxv50uCSJqTU-oVYS2P3UYeuSSnYgVuW6eQ
Message-ID: <CAHk-=wixKLm5ahcYJ0tZNViP298RNJ_QwDcXN-AheH6uOfLZwA@mail.gmail.com>
Subject: Re: [GIT PULL for v7.4] media updates
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 Oct 2026 at 00:47, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And if people are playing games with commit dates, they need to stop
> doing that. NOW. Because I'm not pulling the media tree until this is
> dealt with.

Note that this is more than "don't lie" (although that's the biggest
issue to me personally - I don't want to see people lying about what
is going on).

It actually broke git this merge window. See

   https://lore.kernel.org/all/20261031065525.19883-2-torvalds@kernel.org/

for a patch I sent to the git mailing list to make git-describe show
the right commit counts.

Git doesn't depend on commit dates for _correctness_, but they are
used for a few heuristics for quick history traversal.

So if you lie about commit times, or are committing on a broken
machine with dates completely off, the resulting repository data is
actively worse.

               Linus
