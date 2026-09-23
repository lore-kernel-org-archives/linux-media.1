Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58BC5540B7
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 15:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176881; cv=none; b=FgqBYbSFpE/8NJLK/4h3B6V4QNZPL7b5no2csejYE4E2S2FED/XkfbcYTwR2kGuzy11DqCPk+A+xcm6cLBNxYcioe7LvVhiZg/vkZQDrBGGMYqtFZ9xPEagyWXhOwL0DpbYLkILoA4yHvrbQBVDun/9u/bpGTG0TA1Bc0jmpU08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176881; c=relaxed/simple;
	bh=3T521fW/HpOHDQpMbkHPHKx9NXhNDw5nf7wdl09SmWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWWjFwGS5B019Hus7UktGBrqh2oNh4KNC1x855JNapqHM4ZZd2e9ceHqfWP8R7lJZOBAfoCSSTYQCaZAWY9bangmIJhWXiYWkq2bMwdWRg7U6tkwvunpYujkZ6SQ9dXMuXjx1RzBRcZJf9UTH6Bs9uNwiD90xF75lbTRMU8RH4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NNNmbOlR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NNNmbOlR"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49ccf12bed0so51525e9.1
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 08:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790176877; x=1790781677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EE5PAnd1Wf6p3SmBC2optXiNbJWsLePJtC5K69fq2H0=;
        b=NNNmbOlRpgYNzDTFU/UaSc/XkZMwfPQ1tzkddx8wpC5f4qftRtKBxZH1QP+vnS/tOg
         /dFBh6ddeFJqCvISkfqsZPsEREJWaVe40sjhr9WOtfAGlrQokFEcj2Ytt6nyVofFpSZ6
         Sur9QIh8WZsZfYRpQpXp9ExNTeRsge0pYZqVYpnir1yIYK7CkShNm2cw0xvbg7fMYq5Y
         ZDZImwMwNJKgol5yJF0/o7Z5pxDDcJ5tU0dFB5+Nw7egkxyOnwYwWfFCI85WDW80p9so
         QXv+3ze8imekOmr0uv5GpcLjvkYVCeLVZweYrQf6SbKCZF0tMgPXnOtVE3dhXCikXv0P
         OJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176877; x=1790781677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EE5PAnd1Wf6p3SmBC2optXiNbJWsLePJtC5K69fq2H0=;
        b=yQ6JkqIi3TiT+LAKwx/a2EgIXElM+4Q9+8O6K72VMxAuuF9eVzwxPAgxQMkWiDNpWu
         r7nGxLlLKGGwsgG5qash8hxpjdKEaJNRvqxCkPBRdlpZO6FkEAYErw2bIZSiLMkzEiF3
         xtz9RJkakdBmj5A3erVDYIsMqQU/SacJilIfZKkRl+CJfVc0WVJuEyMWzZFTZzox1CWa
         9ZB+53lffS9bPwCLlbFJVQiQRD8SbmVgTGfbGaS8ut14QunB1DUUTt9IZHgYhZRqlLv0
         wuuu81ABVOO6eaavGMyD3KyGo6IDslwPCTAvCypJnEV3LLDrs8FnYa1Ks/YRpfrkUYFt
         7ibg==
X-Forwarded-Encrypted: i=1; AKwUvBztjvRQGC6pCbvzQwIoMaS8Hu7TPmaq02gsv6/uSegbCaKxNDrX7RUaIEJEf/Ikor+VHGiqGSveF96Wig==@vger.kernel.org
X-Gm-Message-State: AFuF++knmAEJBUnEyRM/yfwDkwQnK9XcTeDokaW/ChvGKlmg9r4V/2Lp
	HvJrQAFZ5H7PP6/ApTHZbypgHRPrlHvEhV0BY+EPO3FPUNAbuKtmtDK/wPt1fD5Ohw==
X-Gm-Gg: AYBFou3nJXwGSHUzgJisDTPFOBt1P2jrG2FtOuHRy+cuO0W6gEqMJxnWYTgjURm2jAw
	IDOHy7eiXuSrAjw6TnF3VjYXlaMx6pGCwlady3daVvyAmFnjcGYIUFega0OWK4U08rE2gcl5T0C
	xeWGDEYk0Em7Wa9/lsNjEIwzYiw5fsviGtZsAxIxjSWtdZoFnOaZ9HYjEIErZE89py1BnC0HBi0
	FCKtv4F/QwjUMo6RptViCdXeGFpaxelr1KK+znu/z3ieVVboaRh00/DaUlgefVwu+hNOy9zodJJ
	SlaqeNZc+mW7thbcb5xZGXMFN5JQQr4oy+QE4ibG6OwD5xGpPTuAJYixsAlF+bWmaX8EJ5Ji9sk
	cf6HcCN+NPsrLVNAJbCJmJfMxgBX3DTVKWe454lIl+S5BV71PGMQQnfJluZFuM2siMVQolWvQbb
	CkGFPb9mowT4RZn16IUsYoQ/5KPtHUo0ztBMk2tS5iP4+6JKmzaqtRTNS3YfXZ0xg0vG+BVsTTT
	UHKS/4MvW+eZu0Axw8dKpfwz/Uh/u0E1fcam5q6
X-Received: by 2002:a05:600c:4e8f:b0:49f:e1d3:fe03 with SMTP id 5b1f17b1804b1-49fe586ff32mr27765e9.3.1790176875531;
        Wed, 23 Sep 2026 08:21:15 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3ed96sm1697075e9.2.2026.09.23.08.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:21:13 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:20:43 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <arPuS9FXrkYJhbiA@google.com>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
 <20260923130031.GE1540250@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923130031.GE1540250@ziepe.ca>

On Wed, Sep 23, 2026 at 10:00:31AM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 23, 2026 at 10:42:39AM +0100, Catalin Marinas wrote:
> 
> > On pKVM, we want set_memory_decrypted() to zero the buffer
> > before the host can access it (I guess currently relying on __GFP_ZERO
> > allocations). Since no cryptographic encryption takes place, there's not
> > much point in memset'ing again after the operation as the content was
> > already zeroed.
> 
> It sounds like this a pkvm unique thing, since RMM always makes the
> memory hidden, pkvm flow should do it too. Either inside its guest
> set_memory_decrypted() or inside the hypervisor like RMM.
> 

pKVM doesn't clear memory on sharing (see __pkvm_guest_share_host()),
and that is not a documented behaviour for ARM_SMCCC_KVM_FUNC_MEM_SHARE
(see Documentation/virt/kvm/arm/hypercalls.rst) which implements
set_memory_decrypted().

The guest is definitely the one knowing what is inside the pages and
whether it can be shared or not.
For example, a while ago I was experimenting with inline decryption
to avoid bouncing, and I imagine it might be used to build on in the
future.
Also as these hypercalls are ABI, I'd argue we shouldn't change their
semantics.


> Hypervisor doing it is the right place, hypervisor always needs to
> ensure guest memory is cleansed whenever the guest gives it up. Either
> via a private to shared, unmap or just exiting.
> 

"gives it up" is different than sharing, for example:
- When the guest dies pKVM will zero the memory before returning it
  back to the host.
- At the moment the guest can not relinquish memory (ballooning) but
  that is supported in Android which can zero the page.

Thanks,
Mostafa

> > I don't think cc_make_shared() has the right information on how to
> > safely and efficiently do the zeroing. That's only known to the
> > set_memory_* backend. So you'd have to propagate the flag down.
> 
> +1
> 
> Jason
> 
