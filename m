Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792547153;
	b=gmlTgG/fsLcvqpYDNkGBueUWuFhGsdP936Fz/jUAIGEqOxvdg+u+B8oBit/3leOFW9+n
	 ACaB73a5zhkOp+ASmeLhkRIBT/5YIsFLjQ7tlk32eSTBubs/8uNSaEyB6wFwY8FQGFywu
	 V2u9csAC0sQLAM+qmMZFAx154uUngiCnqYe9QOWeUNsQ4R0bOEIQvovDEdr/cqWI6R+Lf
	 EN+pJQGeK+kd/YCy4w5TjJo6XHXRnveyucM0sAemCafXIEzFVDUFtV6Q+AsnMg/5hao6k
	 uYen7bdNvN8iE9eS+3NZjlLSraUq3mLVE0xonm85Z2xIG4sd+pI/lw4iNx8+q689mYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792547153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=N685GSgBsocOGOaVWgwO0dJAiPky3e+vK7Q06g1oPm0=;
	b=kHH4nwSoPW+Ppxt3l+D0RMn9GNYjOn6hH4lWsucJFra6lFSBAirW8CxIcnDbm0vHJHtY
	 NT063zvrIcOkAMs5FwHy7xk1RMsFqndjkhHsnAPynA7TSSSyyH2vYhbzci4uJImDXfiqw
	 x2gespce2faDW3mjeRnRLdl2jBlu3xHa7pAEhjIozIxS8PVyfGQBc8B0uhgR0KSgpHEW5
	 O8rGmMC7dKGf097gomsRpoxnFVc2WCWUOI8q5Di9ZJJ0pdvgFYss95/NaUXuraYtp1Loe
	 5TmgmBCDWuga8djrhkgHSpk1hzZYGVecaHvYGXP5wSfR6jVJb3Q4oTsEsKWsmQ7LV1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WzAyKkQI;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF201606A31A
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 01:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF201606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WzAyKkQI
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so853005e9.2
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 18:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792547151; x=1793151951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N685GSgBsocOGOaVWgwO0dJAiPky3e+vK7Q06g1oPm0=;
        b=WzAyKkQIvP9jsHhriZZX2+NqaSKHWEKR32z2b8t/JWsBJhI9LmHVIAXIBLYTkAYA/r
         3TGyWsXWtYwy8KpoOhpjH1fl9t0x4k6khmQIJL92JvLawBrNY7VRYtODbZfszkWfDtlk
         HS0nv1yw2o3ojEl/F9RuwBcjrzTj35JtlKNkAkhlvMWTSlXyVZ0NbGvSXNaCYhh3lowr
         8K0sT7LNm0C5SEtYt1ojPcHQSTBf7euz4WpBK9GJv7QbGxr3yWS8zNzfRz3gj0S6JFTW
         mufD344rkM56yUSSjQ5vawwRV2ICenp24WFiu8fR5gwCnnlj0z9aDx00NOzWNERUlClx
         vtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792547151; x=1793151951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N685GSgBsocOGOaVWgwO0dJAiPky3e+vK7Q06g1oPm0=;
        b=0IBUdaLU8e+IJG4mAAAJiaveClwjk49vFYEmdHnr3HgvrRO+LmQu24a6tiIyZmeFUL
         ekGMAkgjtwsCke3w0NlsSeUMMJ53gEMMCXh5vt59Yr1OQ6j7SLtQ5Vjw0PS6xNTIHISg
         O393Bt/UljqbHW1/eNA9RD7ljmudbeDPbD0sNVmLV7l/CnIFpuYlcMkYgUfHnr515uFs
         9SYDM1crcj6X1YvWCyrdF+Jt6B2mKNf2WlFzsRqPfPgMH9Ai74yTIdyEBhyiriNM1EY4
         w+9L+vuS9O+alAAjJzU9pEDGENL1eadRoMfbzTlKraGvSPVhLK2casOxk6DSF7vb+7Eb
         0Wrw==
X-Forwarded-Encrypted: i=1; AKwUvBxLXEZFRrWCu016pQLeXNK61u5qgo6fYMqKt1BXdOOw/jQo0CSESeNt9DEUj/fqNpW6jPuJeUBhPbNwTQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL1nCQ8TZGXzoHGpap3s0nfJYwHLoUb12DoCP8L8A5f4UhzM3FF
	pOEwao0lo/2LWwiJhhQQS5Utkmqah9XthQKkkRT7rkImUviA3/46Wvxy
X-Gm-Gg: AYBFou3OOHQCvBXqLrPlgj+hLmxRbhje0dWaE2kYPeneAZs1okUJMGM0/QKutVWxSVR
	wbHZNPcBHgQ8C8PnKWI6wwq0S16wzhWt3W3jLuzRLXqSkCbWdR5FPIMS41wLZswECOthpSbSFVN
	b0ihHYcmXzgbyMJrOqApfNIbNXFy0Opr8IufB4Z8ktwQ+RvXN7+C1ejrLZlW9dQ62a0e3KYs0Ep
	4VkW9UJgcvFZoA3/j72KjhT2Z29bCPDWuqPh6MKBxaRtTmPY9H696KcUXNt7i/J9IvUzd4OH5AW
	FrEqd2/Vprkc1VWHmobDbUXabLIrMj8zXvpRDSfC16U/gyAKOkjWCCcMHCvJkpLWbwZ2LoI9wlS
	eDAea1lTKwYfIkdb66ayofRAHGTbKI7MWJ5g5p23Wx4rOJ13PHyGbgdgqP0rwP8RqsjScbultbg
	KL+T4g77Gply3w6DbhcpVEp60DZS61XWYVbjMVPTsrjBUf++qZt2fSXksEUcBWCfe++mDsu616W
	/Ty7zn0uDd5ywiDBOtpZQkF4lLO8TRYmA5E7Ljl+F+VfU5Rq1SlCKVegK9abO4ndt5PP/l2sI3X
	gsMVGBNfx83PU+wT389F0lX+aI7okXjXsIfGl6He8JNDEiKahvx6QaOIXDhA9OtrWY71xLAYSIg
	PdRSVkTHUH7SkBUU=
X-Received: by 2002:a05:600c:8714:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4a1fdd1604fmr8629335e9.16.1792547150977;
        Tue, 20 Oct 2026 18:45:50 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-095-117-105-001.95.117.pool.telefonica.de. [95.117.105.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ca3666sm118638605e9.1.2026.10.20.18.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:45:50 -0700 (PDT)
Date: Wed, 21 Oct 2026 03:45:14 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, 
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [RFC PATCH 0/6] iommufd: harden DMA-BUF PAL setup and release
Message-ID: <atgWXLYKOFj5cZ0F@gmail.com>
References: <cover.1792477872.git.kmehltretter@gmail.com>
 <atdKZpEJVZY0enR2@nvdebian.thelocal>
 <20261020182029.GH3008132@nvidia.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020182029.GH3008132@nvidia.com>

On Tue, Oct 20, 2026 at 03:20:29PM +0100, Jason Gunthorpe wrote:
> On Tue, Oct 20, 2026 at 10:16:26PM +1100, Alistair Popple wrote:
> 
> > I haven't had a chance to look at these patches yet, but if some of them are
> > fixing bugs in Jason's series it might be best for us to fold them into that
> > series, with correct attribution of course. Anyway I will take a closer look in
> > the morning.
> 
> Are any fixing bugs in tree right now? I think one of them is already
> applied from someone else..
> 

Good catch. None of these fixes a bug in the current mainline tree. I
based the series on the stale c37cf2824740d topic and missed two fixes
that landed in mainline afterward:

- patch 4 is already covered more broadly by f2d70dbd3dce
  ("iommufd: Destroy the pages content after detaching from dmabuf");
- patch 5 duplicates Ankit Soni's e745cd2c749e
  ("iommufd: Take dma_resv lock before dma_buf_unpin() in release path").

Patches 1-3 address lifecycle issues introduced by the PAL conversion,
and patch 6 tests those paths.

My main goal with this RFC was to put the concrete lifecycle issues and
tests on the table and get the discussion moving.

I am not concerned about preserving these as separate commits for
attribution purposes. Please fold or rework any useful pieces into the
mapping-type series as makes sense.

Thanks,
Karl
