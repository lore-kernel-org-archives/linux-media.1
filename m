Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973FB3C9ED9
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 14:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901023; cv=pass; b=d/3rXx9JVdu8a8nKl9up3Hgbmw1WVLj+JLmWGCp1bsRDULi5fqio+OCEsiTiC950T0+Au456PUsdHCH/O3UIzijH2q+L2xn3rHOd/ze+3w2SV8MMr3Iv/b2jxrfVK4Qbf4lllcTIm2PP29N1EnDZXFHnPyiYS/Grx8aYOuR9KAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901023; c=relaxed/simple;
	bh=wNycpsWBlfQXgs2ZLPtEBzEs04amMNcoEiI5MVrXE/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u4ETecobAR3Ei0Rp8jQ2VA/tmcBdN8bv4FZXMPEYy2qoXE5hPY2uD3502s6oYaxnN55TxUdgFZ7+iTXNXEczoxLEp1khXGdH/s25vg/ucQDX2nI/urd40Bq8P96RO+OftzD4UR9C3UOdy0/wgC2WzhJaHjFiykr7N2FkMP1qVaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I/EAakkx; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I/EAakkx"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-676858d42f8so2315551d50.2
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 07:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791901021; cv=none;
        d=google.com; s=arc-20260327;
        b=iaOk3aAO2QDvn5r9PVBDsmDmZfzWkKppsovfpjH9koZlaJsh45s/bHsTKjdo1OnatG
         7WFO8ZABaqu62dEk3wcqqXp1LYF3HaW9lifzVq4qbfqNThAtIA4gq2sIqUHug8actkVn
         lYRdzAI4lfl3o6wDvl6DBLjS1dERBtAzV2UWZwTY0Y9qyY8ZPkQCYPmRnq01yJFO3sQn
         jcEcU58HjZ7NX/AHzl7lt60F18zqtuUhT5WZ1jmOd5nVyEToBgtanuuWHjdkDj7mDfzU
         /oC/b7VV9B9QZiPiLclSb350mOn2B1mf1PUeSunoViQPyIFPXmqpUmwpWUqKRcskP759
         cAZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wNycpsWBlfQXgs2ZLPtEBzEs04amMNcoEiI5MVrXE/Y=;
        fh=jAKSHOy3HR6TocH957pijC7CNUoKxt1IOwQpxQT9Av0=;
        b=h0/sK86ysDWZVn0I7QD+rAlXdHaJTBIxMFx1zfV7qidN9NQiSydmB281aWnJqQwgyr
         3mVOkM18TlG6083+T6iPyHKc4o+X621wQwsfv8mmhbs/LeqjEiOsDgNvMlqMllBFPDs9
         i3VoJ4G4lSUoM5N1tc98c/nnapBTK8AsaloCGzhJPieL32Za/uBcFmxQSNVH0Luokx50
         RvEnTYSLWkcmu7R2/0pqZ0TGdb4FjnumcojgdtTNoKZGeXHwESGrIq5I7tA2/Gu4xtTp
         zIpdXFvqUkQrlywyxK8msjtCcpUV9m96m4mct5pc7zSvG94xaXO60rPl7+/f39HD8AcA
         l9Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791901021; x=1792505821; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNycpsWBlfQXgs2ZLPtEBzEs04amMNcoEiI5MVrXE/Y=;
        b=I/EAakkxWChA/RLfs+fjleE/aJuUxYeK0LarM5S/CsbkJmjn72B3Y1hCJIyP+MtjWB
         pJtX5FRylCg48b6gAQZvQnM0uKCWoGV3zeje7Ytj0xi7P8H2JW35vyGD0PFV1gGfu3B7
         2DWhgfQaTwMhLiqE8gQjcFo1g/7QR4pe3JPueH0rxdZUhwCXv7fqAYYxUpGVjzs33sxS
         EpEGI8DTVciTlZPL1k1LhcnRw2k1mnTLtwLU3pjO8IHhcC50QyUodKlB2LHq25fy8OYb
         8gJTqHz43Ki8mws3ahx0L1sS2zZhaWFlG0NVALMD/AMp/48LMIx4OpufWjCAntw9AAzV
         j2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901021; x=1792505821;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wNycpsWBlfQXgs2ZLPtEBzEs04amMNcoEiI5MVrXE/Y=;
        b=wfC67V/idQDTSZ2jv3A8Q/gUrvFe3Xv6PFd3MYZY/vPERdkFOa76XYx5gttWS5ZCqA
         zGD8h3BcbJCgvcb+8gMD9OgNwt5pkDIHy9qNxWab7k5cO0auJcUhf1x8itK3c1KRWaKO
         ASYxu9NWWZ2T0fQPV0eUm1c8xf0LIt37H2EfWGt1pLuuITOK8ZuwXFwY8k8bLPO4Q7Bn
         gnqk0OaJOtI6e6zUwDN3C2jQcYYszfwobTIGJoObt4mSuSFScw2wNr15UIN2u2n4ctl6
         UKbaEii04flK7A/tQ5LrNZAweZj3FAYtjGLm8WN4P+K/GagX64FVFhWYrtlTYmRo9LIb
         wa4A==
X-Forwarded-Encrypted: i=1; AKwUvBwnAZh3kZfBJ187gve5YMFM7rOoRWrs4mYnRiXqGss71fMLxomwntpqEvHbvQbmZg/1S1EISD8GjIMzeg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJzO18j4XjVmXAJxUq6+Rzh7e/AN3ePyFlSZ3REq3R7lWBfpsdJ
	6HfN6JwAzn/jwnE5DkNZ2UTX/3WW98cCAGQQkrm4Cko5uTLMetFjpQQfWfixtUSGpGP+2ax8beC
	Nrx0FeEeiDhxbs8KfKwUEvwjSoaUN+f1Cf9/+vh2Syw==
X-Gm-Gg: AYBFou2k3/4uIieeZV/OqclCaRpR9Yz0HlPW1FwKQPPNIf7Ae9jZjT26QSmOiIYqthp
	rNuney2LpMoFhgHrZQhg3c0zELwJTtIOCXBjLkELtXKEbhaeomwHB5DlpOTbqIaOzzuyU2GZHxV
	gYa5c7aDv/7lOXOPxNShZI5C126oPbpgKWJIBDtSNwy4S7dowXUMk5gd22T8Lf6g368x/8f/Jfe
	Ptn5bSqcjcDf5OLy6AaNbaVcJ0uyiyB3jkKDljHx2ko6jvBZi6NpPKuKSW3k90ynrj5YqTkB1nW
	AXHhEFkT6DM9ikYRyqFHfvhYJsrQW+WjIJGqS1OIlLYmr7cX9txl6dulGArFtxfyIwgS5vss3Zc
	8XRGsNpQpxuZjBD+kYXvUir4=
X-Received: by 2002:a53:e313:0:b0:677:b7cc:210c with SMTP id
 956f58d0204a3-679362ede62mr2859896d50.163.1791901021395; Tue, 13 Oct 2026
 07:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005064133.7305-1-kmehltretter@gmail.com> <d1ef135e-1b5d-4656-9229-348c7029efbb@leemhuis.info>
 <as0r7Q4dHt9gQm_8@gmail.com>
In-Reply-To: <as0r7Q4dHt9gQm_8@gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 13 Oct 2026 19:46:43 +0530
X-Gm-Features: AclHuK9yOH0W7FJ5IkLpKJOcXHUnKCWcM6_hFWllx6ZiiWF7Douv1aRrjUDfUxs
Message-ID: <CAO_48GGTHcs5M0WyY6dcJLxy1kUJq6uNLh_s+221t3HcGoMxSw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] dma-buf: warn-only mode for DMABUF_DEBUG
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Rob Clark <rob.clark@oss.qualcomm.com>, Jianfeng Liu <liujianfeng1994@gmail.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vinod Koul <vkoul@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Karl,

On Tue, 13 Oct 2026 at 00:21, Karl Mehltretter <kmehltretter@gmail.com> wrote:
>
> On Mon, Oct 12, 2026 at 10:12:02AM +0100, Thorsten Leemhuis wrote:
> >
> > What's the status here given that 7.3 will likely be released in a few
> > days? Note, I can see from the discussion that this is a complex problem
> > that can't be quickly solved. That's how it is sometimes. But I wonder
> > if the current state of things is the best compromise for now or if
> > Rob's revert or some other option would be better.
> >
>
> I think reverting my commit 143755bdabaa ("dma-buf: Make DMABUF_DEBUG
> default to y on DEBUG_KERNEL kernels") is the best interim solution for
> v7.3.
>
> Christian, Sumit, could one of you apply Jianfeng's revert before the
> final release?
>
> https://lore.kernel.org/r/20260926022026.10539-1-liujianfeng1994@gmail.com/
>
> Thanks,
> Karl

I have pushed the revert to drm-misc-fixes; I'll request Dave to push
it out to Linus along with drm-fixes.

We should revisit this for the next cycle in a couple of weeks for sure.

Best,
Sumit.
