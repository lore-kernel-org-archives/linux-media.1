Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498074418F2
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548448; cv=pass; b=EGSYrosXjd2NuFK7nI9+Zttamg4VUfxyLN3cbPPHqyGV8sxKiHDPNil85NPoT7xVnGmi2aELx29r5eXUyxr5grp7xRvqGIylbA/Av74ujmRUq35alvcFzC2jK62AF89Uebk4gpR2uoHvk80aa+/Py3KNPKySuXekDJBFCqt1e2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548448; c=relaxed/simple;
	bh=Ts9PK9aXwLEU/nrIRNxnM9qG/yIOXNQLDe8r+ZcI+pE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbt3Vv2BHLIwSmZYf/oa6ao0sXIyGaad/3Rpfs4tnDfluQAVWZeVW8EHusiB+E2bEPtvSuKLt4kl2TQKw9RE13Sc/XlnLnmOEWVogDVY1snFByqf5JKEZ+idiDC7QIoVKdrnkbVfBlAjFvmEE3B39fd2kPWSKKxmPAtDotK3yS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MuE9lDq4; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MuE9lDq4"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so2051294a12.2
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 08:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786548436; cv=none;
        d=google.com; s=arc-20260327;
        b=fbhnvrWJxrZ6hjh2A5oJbwv7twM+mNpPrf20qqdla4VDe9JeW5OUfk1j6DliMxq/VX
         ZCMpU1mH3m86GS01Q/TYcB6mT3uwqreUux1/13LTJEffyua3Yj5LvQ+gb7rkhShcMNv5
         Cu/SDa8xQLWdIS6USOObpzDWpo/2RKiVqDVCM6y74eabEx3B0MOouFcSeBHb2eLq2Yc7
         u7aoUTXK4gkxCvOn4SC0LUaYW1AtmEbZbuBrcOMtwu0bPCySryQWIYF0VF3DE7TaY/BB
         GhciA7WlkLz7Tt9UkAthfT6hnzkZhXBNdicfjpv1hYSE37S5SdNZ9bsvPWPggmPMTyoD
         oZsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9HQw24hdIiiBy71zEiY+V8zJ9GZN0hXXJxvtzQE5bgc=;
        fh=M9xZU3JxhNoYAng4XvYVTk3pwhdt0hbz5kkDHlHDXjY=;
        b=HlIvg6JbfVT+v56d731ty9CEEul2d0zkNehTAQr9UWlDE6EFieM+R7B18fuWmKkyUy
         zmfrzmpVLkcPEFBqqneG1Sly5L2nspJwNT2TmIXJ9u74JrmsiXg0u2NB4Q50scBfyUMr
         kcC0JV3xbJPKloQFC4lNI7QV33shTIbAOoXO0KZayOnRs2KUguRQDe5M3iEnX/gkpkrJ
         xTbOPTjno3yh691KSwVhfJcM1DolAD0Hl6Uao3WCIrafrqbEJBPp1SeGTbHuoZgB9kgk
         mGTuebuUgf837TE5d90Ig0spzgItNJ6TwCx152r2QBj2caP7ewmYHRWIqFIFkggUGoRE
         8mMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786548436; x=1787153236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9HQw24hdIiiBy71zEiY+V8zJ9GZN0hXXJxvtzQE5bgc=;
        b=MuE9lDq4eU/VmDmnJ0bdER+wcAXpqzUL9FpQFQFw8ysphFxuWvXkt6ouCcNepWpmIi
         Hwp5S4eOH+U2E34qrxvHwOiYQ/aFVgvmnEOoDOywKLDpbJ1EmBz8HtOwUlq05v07c0EB
         7yJeTC5vSRJCLulUdZuaQVh8Of8LPr6dwk3Ca0D/fJDrWmvUm/VMgsCWyBVVOS6bZoVc
         LYvCemx9m7N5vs5dvziRKE3Ctm2pu8dcNnVsVeLiDmqmeFnudiwYpsnKXNnnSFu/th8a
         7pWmh1GregKJwByIXvrRVsD1iakbnBJxxGMjbIAfVMMGC09cADuF5spUQXinBM/mAaZr
         +qJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548436; x=1787153236;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9HQw24hdIiiBy71zEiY+V8zJ9GZN0hXXJxvtzQE5bgc=;
        b=ZF1GE4dtUXAa87+PoL5JnXkM5iIfslE5h0MMI7UtFDBVE+V0c42qckH3Q/fvOuN4gt
         4u6ZMwMtm7UCnZjsIPsBLUasS8CbiU3LnTegH8ie+Cx1L5SSkhXBw/APTI57OcdYjPXe
         n6QdPkyFxBvwqmpUnoYN3WqzsKTCl2nZZ+tfuVDYUOloYMYRrLnYzFQALcJHy8rBbI32
         nrkloF/Q/zpxVbAbtKz7SeMXIYGIQD3quNH94fzleOJ2slo4eoZd0JWQEjBeOgXVxpMQ
         Z7ilVyTtq1qdmG8gKKu1svKeuB+8AVgw0XZyt0a3XI0Xr+OcKLcqbFL/XjE/Ozg1YWWH
         8ulg==
X-Forwarded-Encrypted: i=1; AHgh+RqhYNprqnx2G+p8BHPyWzXjUp+Tk7hQY1o5DnI/GkPHdQgw9OJIL0H7FDwX8zQGsO1sp/nH0HF0ka6zag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCC5l1SBWkXro3CJH4l16QYFpu5dzwj9c8nD6v/BJUuWNEYQfd
	I6A/l+4XKZcX0OVRap8/+4vnfsbudXYC22xbLuMu9FrK3xazAzkJhVLEjbGzhBtHCf34HL+LZA2
	5Xwd2TdsHZZgnv88SlZ6rLxO6g8aXpCwA/gltkukjoA==
X-Gm-Gg: AR+sD118few6L7j0p3uuFMs1jpgIKvUe+8gs6vzBU6U9aZ58t7WpCjwMygzOg04wQc0
	hCub7TVjEi/EzFA4c9zh6z/mAkpwiVca7ocMtY9zkloHM/UcYhF4lEl5i8gYkaqxo0VY2hjbTfv
	aCrVrs55J73frhx2CtBKTcJ4Dg07prlUijjl8Z3iljcPIGSfoBIrvXrK41JdQW44k08PlJbjs35
	RuQtA1olDIdbfzDsunkDf7L0YgIWnBTdw7gmTkMFZHWUDpjjF7HI6tMAxUytYQI0th/d5C/hRQQ
	IsgqgQVvTfLU2Mcm8sEuvOp73o+xFbge6jsHWWY3ah7A8Bv0Tg8qOah8Opf9GLOnJUmxBlS2AA=
	=
X-Received: by 2002:a17:907:f816:b0:c20:2d38:e518 with SMTP id
 a640c23a62f3a-c20f2e66a3bmr273702966b.2.1786548435676; Wed, 12 Aug 2026
 08:27:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABdmKX1-0bXdU_pWKrY3LR4JmOpxC48ka9akS8PHYDBnngFqWQ@mail.gmail.com>
 <20260807101140.1357218-1-shoubaineng@gmail.com>
In-Reply-To: <20260807101140.1357218-1-shoubaineng@gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 12 Aug 2026 20:57:03 +0530
X-Gm-Features: AUfX_mxKHc0XJq4SFZbCVvYoj4A8ln1CqD7e7dKrGyTLzT3rZmWFByVVhkPNP5I
Message-ID: <CAO_48GHc2TQJ9baa+EYst5vR0qUYvRVj=r8F9hxMLpySWE5+QA@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] dma-buf: fix fd leak when copy_to_user() fails
 after fd_install()
To: Baineng Shou <shoubaineng@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Sandeep Patil <sspatil@android.com>, "Andrew F . Davis" <afd@ti.com>, Srinivas Kandagatla <srini@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, stable@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Baineng,

On Fri, 7 Aug 2026 at 15:41, Baineng Shou <shoubaineng@gmail.com> wrote:
>
> Several drivers call dma_buf_fd() =E2=80=94 which internally calls fd_ins=
tall()
> =E2=80=94 before copy_to_user() returns the fd number to userspace.  If
> copy_to_user() fails, the fd is already published in the caller's fd
> table but the ioctl returns an error, so userspace never learns the fd
> number.  Worse, the window between fd_install() and copy_to_user()
> allows other threads to observe and manipulate the fd (dup, close,
> SCM_RIGHTS), making any "close it on the failure path" fix unsafe.
>
> The fix is to split the allocation into three steps: reserve an fd with
> get_unused_fd_flags() (not yet visible to other threads), do
> copy_to_user(), and only then publish the fd with fd_install() via the
> new dma_buf_fd_install() helper.  On copy_to_user() failure,
> put_unused_fd() + dma_buf_put() cleanly unwind with no user-visible
> side effects.
>
> Patch 1 introduces dma_buf_fd_install() in dma-buf.c (wrapping
> fd_install() together with the DMA_BUF_TRACE call to preserve export
> tracing) and applies the fix to dma-heap.
>
> Patch 2 applies the same fix to fastrpc, which even had a comment
> acknowledging the problem could not be fixed before.
>
> Patch 3 replaces the bare fd_install() in drm_gem_prime_handle_to_fd()
> with dma_buf_fd_install() to restore tracepoint coverage for DRM PRIME
> exports (suggested by Christian K=C3=B6nig).
>
> Patch 4 adds a selftest to tools/testing/selftests/dmabuf-heaps/ that
> reproduces the fd-leak scenario (mprotect flip before the ioctl) and
> verifies the fd count is unchanged after a failed ioctl (suggested by
> Sumit Semwal).

Thank you for the series - please feel free to add my

Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

>
> v1: https://lore.kernel.org/dri-devel/20260703080922.1838362-1-shoubainen=
g@gmail.com/
> v2: https://lore.kernel.org/dri-devel/20260710105430.3059661-1-shoubainen=
g@gmail.com/
> v3: https://lore.kernel.org/dri-devel/20260714114654.3885457-1-shoubainen=
g@gmail.com/
>
> Changes in v6:
>  - Rework the selftest (patch 4) per review: extract a count_open_fds()
>    helper, fix the copy_from_user() comment, fail (not skip) when the
>    ioctl does not return -1, drop the bogus mprotect-race mention, and
>    reword the result message.
>
> Changes in v5:
>  - Add selftest (patch 4) reproducing the fd-leak scenario (Sumit Semwal)
>
> Changes in v4:
>  - Add patch 3: drm/prime: use dma_buf_fd_install() (Christian K=C3=B6nig=
)
>  - Add Acked-by: Christian K=C3=B6nig to patches 1 and 2
>
> Changes in v3:
>  - Split into two patches (dma-heap + fastrpc separately)
>  - Add dma_buf_fd_install() to preserve trace_dma_buf_fd tracepoint
>  - Add fastrpc fix using the new helper (T.J. Mercier)
>
> Baineng Shou (4):
>   dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
>   misc: fastrpc: don't publish fd before copy_to_user() succeeds
>   drm/prime: use dma_buf_fd_install() to preserve export tracing
>   selftests: dmabuf-heaps: add fd-leak-on-EFAULT regression test
>
>  drivers/dma-buf/dma-buf.c                     |  20 ++++
>  drivers/dma-buf/dma-heap.c                    |  80 ++++++-------
>  drivers/gpu/drm/drm_prime.c                   |   2 +-
>  drivers/misc/fastrpc.c                        |  16 +--
>  include/linux/dma-buf.h                       |   1 +
>  .../selftests/dmabuf-heaps/dmabuf-heap.c      | 113 +++++++++++++++++-
>  6 files changed, 180 insertions(+), 52 deletions(-)
>
> --
> 2.34.1
>

Best,
Sumit.
