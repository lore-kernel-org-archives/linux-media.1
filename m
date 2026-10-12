Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427763AFD19
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 18:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831098; cv=none; b=stDbp0atqfIq6s1xhm2A/GEYl4U3VtFumwrI1UXsxn6XjWdt79YpNTjcri9i3I2H0CJVi5Ai97V3gXR3F0i41SATntgvWJ6DIzreomH66O0TxjnrmUxtkz2FUfjiMlwI4bxu2aowhmI2uvD3m5x3jSP2aNi4DslNqhVt/t1FEXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831098; c=relaxed/simple;
	bh=eg8iQH53XMr6U9fhAElssnduDO8S6/m8PGLFcG3o0cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQGKMplMr6R9twWUlAsdPE+xpjCvx2yElbfjl9WRyD2jRaVAkibevEGrEyhs/sMaa+CrwxKuEutFaQNsGEXWr0n+i1KXwXuu3lUlDkP021v2FEjBHtS4WIvrSdVorTUJIF3LBPgm7HDD4AABxfOcjIwyLjDIOGbOs5xsF2KfjOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwGfC4YE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwGfC4YE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so17580295e9.2
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831095; x=1792435895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ky+Mh+cO5xMBG7Bn/5pO6nl62hMlLNRWkoqZnT1lz8o=;
        b=lwGfC4YEgmW6r/XCkNbkm5csRJAEQss0YAfp1aq8J+Q05zg9k4bDxhJz4i8/CsSZ2v
         9S5afsOB/0wh9PfXzfeg2LlPX37+RnvsiiUrnBRtfUEyHkBYLXewq+y4BQqiFd2WPxSw
         MdCWnwaVh2ySjc029S/kI4ZtQ48daDDf/hUEhsdkn2ceztQRNEIsu0UGYmiQze8G9v3U
         CWykJ5OtElYSU7H5XrmfYuVh8EZ2GSFklVhzTjuiNQ+Ti6SpM6jLrQMFI4VoEOeDQTXG
         7RPWgWcxQ/6jMynLAa3jLDTTXE+EiIkXY1sAqwd8u/ULqCaOaU42B7l2bA37tLJA5sz4
         XkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831095; x=1792435895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ky+Mh+cO5xMBG7Bn/5pO6nl62hMlLNRWkoqZnT1lz8o=;
        b=xJcTs2q2y/bSWsyHNWAY9ZIxVtrg1QgQsMBoe6hC6Ueh/+CvqBlqiS0/tcXIHHW/q9
         7S3UMI/uUlemNjIyOebB2Vp3dlHB0mftYgxWkV24Xk/sMKnH+ZRIc39vMxh3EbWEWBP2
         6pv0U7RklHuvswXnZoJcKQuSfh8lAN4m9vcr+63uhsf5c6pcY6Wo7TWwz+JQOgYV0PJq
         cZ0Fd/qLTwepi7CGNX3Sl6SGaT1/m/jFMLKtuLMT2mkcWYWBTENEXVxK7F0G8sSvYccU
         dK+R0mQM92SB+LAneHham4hkd0hRqSSI0S59QomsiRwkkjIaostKF+dvZwxjBoUUSegh
         eQ9g==
X-Forwarded-Encrypted: i=1; AKwUvBzjLUWAmK5Jh2BKXIt4b/0sduyvzLLWPnYw7oqjTkHQLW8sGxkrYy/TuuIkVvBGP/fAyQn16LfGBqHchg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJRDm/p0eBnJU0eDulF0tn/brVyF+uHWA/HjmWjn4qqy0/8H9Rg
	5QUcDuGk4GPE1BBL8mR9eJpfS6v4EZiM63rwWlGnc6z2Se9Q3qGEo6s+
X-Gm-Gg: AYBFou21KsF0T4sKB0SuP+4vcWU+rOSg19p5k41juejpW3m5ZJXbfUIBPwU3MCSdjs4
	pksCru4DtggtS106Ls6gC24jHRpr9GLglCsqhfp4IcZZwi6UHk0lVbfyZoL/QOuI9M8P9jmJuHC
	KKnFffte/Yr/TXC5baDB5PvxSZGmn7h9mW7gEfvjovjLtSKmEFPmFZBc9oaez4xK27VMLtwDCum
	n7RVd2eCJE1Bd8HCH3jAhJVyx3VwCMUPPanBbbTIYKbwFw7OjLln41bt9dRAJue/0QZ15G4BvHE
	QY46UbXMgXH+5WR50huiUG2J0XU+EvacWxVdkDSTb2Y2TYcEI2bX1p+NexCxYZ3A+cCuSq3k4j3
	t5fXQX0doSMnpriLHTfTeCAIOGSGnrksGBwAa/LE2QV1RJrrpa4ryqiHwTp2R6ROvPAdNtc9Sfb
	53QF9tT0RB+lTjwr5AErrWBjm+x/EIEnaPF9l15szyKMcwMtCkB0VCvQtXa1SJewfJ7ecsuFc/K
	u7BIGwRABfsAgTB0mCyIxzo4v7WPs0PJXu6SUEzb+02qnnp1q2zp3QxwaD6PGF/GKzBx9kBMS3Y
	b5+g5SY6DBjYwHof7OGoWxDqPlV9DHMXUj/DbMSNCY70NgFOJYGmBkOobm67RWmaKiiCEFw4Nuo
	QSGinz4g=
X-Received: by 2002:a05:600c:6297:b0:4a0:62d:4424 with SMTP id 5b1f17b1804b1-4a18e4a1756mr196491005e9.8.1791831095315;
        Mon, 12 Oct 2026 11:51:35 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a8ab-0f01-016a-c770-797f-eaee.310.pool.telefonica.de. [2a02:3100:a8ab:f01:16a:c770:797f:eaee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm336946215e9.0.2026.10.12.11.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:51:34 -0700 (PDT)
Date: Mon, 12 Oct 2026 20:51:33 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Rob Clark <rob.clark@oss.qualcomm.com>, 
	Jianfeng Liu <liujianfeng1994@gmail.com>, Diederik de Haas <diederik@cknow-tech.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vinod Koul <vkoul@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [RFC PATCH 0/3] dma-buf: warn-only mode for DMABUF_DEBUG
Message-ID: <as0r7Q4dHt9gQm_8@gmail.com>
References: <20261005064133.7305-1-kmehltretter@gmail.com>
 <d1ef135e-1b5d-4656-9229-348c7029efbb@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1ef135e-1b5d-4656-9229-348c7029efbb@leemhuis.info>

On Mon, Oct 12, 2026 at 10:12:02AM +0100, Thorsten Leemhuis wrote:
> 
> What's the status here given that 7.3 will likely be released in a few
> days? Note, I can see from the discussion that this is a complex problem
> that can't be quickly solved. That's how it is sometimes. But I wonder
> if the current state of things is the best compromise for now or if
> Rob's revert or some other option would be better.
> 

I think reverting my commit 143755bdabaa ("dma-buf: Make DMABUF_DEBUG
default to y on DEBUG_KERNEL kernels") is the best interim solution for
v7.3.

Christian, Sumit, could one of you apply Jianfeng's revert before the
final release?

https://lore.kernel.org/r/20260926022026.10539-1-liujianfeng1994@gmail.com/

Thanks,
Karl
