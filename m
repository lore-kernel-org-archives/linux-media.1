Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4D0390C8D;
	Thu, 20 Aug 2026 18:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787249713; cv=none; b=W5LGTLvNBYjwJQWtMM8e/5kiLQJC1eLhWxgg/lDBr9esBus4yVs79DqoTWtKFU93pzukOR5Im4Whcf70bJEPOQ42rZdqUM7cL7QCHlwVZeS17rYEtvPcqiAKmTKMKM+k7FiIfRWN1JosktBnX7OhU3L/ykbCbm6sWVyu9427dlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787249713; c=relaxed/simple;
	bh=jU6zI6MIC9LRHB21fB6/8k5KXNhaDTI+dxJnt+Itj8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Id1S+/booTkx+dBRy2wnwQdYarXXdOjBv6T6ABExl+9FvPk3U39azBXgfOmP+doJU2fxfbkBdg0NBg1nxMloX/eBkb0xtqHdiiuQsDJ4FDiCi65T3D4L4X2l0ubJT7rXQciJRMvjaHDbXJbUUvxdt1DsbyfBvcfV0dm2lhD8CrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=M6utw7K0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="M6utw7K0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6455202C;
	Thu, 20 Aug 2026 11:15:03 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A69CB3F85F;
	Thu, 20 Aug 2026 11:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787249707; bh=jU6zI6MIC9LRHB21fB6/8k5KXNhaDTI+dxJnt+Itj8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M6utw7K01T6RvxDb5Fxf+itP2QxURUCI9W6wXMyH5WbqbCTQ//OCF1LKW9rFjpwJM
	 TMnRTAOzs8YvET+6KIojUb/ASLBn8wD0MCE0Qg4p8ksWlxM2iMihkYnVI/tOa2QwQG
	 e0GYN8WTwdNakj5f96xV0tXH5k4IZ4RLjeaSglVQ=
Date: Thu, 20 Aug 2026 19:15:03 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Steven Price <steven.price@arm.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Marc Zyngier <maz@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"T.J. Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v2 1/4] irqchip/gic-v3-its: Zero shared pages after
 conversion
Message-ID: <aodEJ1bUDiHVGXBw@arm.com>
References: <20260820150034.88729-1-steven.price@arm.com>
 <20260820150034.88729-2-steven.price@arm.com>
 <aoc9CyxGPHPKFH1N@arm.com>
 <20260820174739.GA981928@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820174739.GA981928@ziepe.ca>

On Thu, Aug 20, 2026 at 02:47:39PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 20, 2026 at 06:44:43PM +0100, Catalin Marinas wrote:
> > On Thu, Aug 20, 2026 at 04:00:30PM +0100, Steven Price wrote:
> > > diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> > > index 6f5811aae59c..a055837832bc 100644
> > > --- a/drivers/irqchip/irq-gic-v3-its.c
> > > +++ b/drivers/irqchip/irq-gic-v3-its.c
> > > @@ -213,16 +213,18 @@ static gfp_t gfp_flags_quirk;
> > >  static struct page *its_alloc_pages_node(int node, gfp_t gfp,
> > >  					 unsigned int order)
> > >  {
> > > +	bool want_zero = gfp & __GFP_ZERO;
> > >  	struct page *page;
> > >  	int ret = 0;
> > >  
> > > -	page = alloc_pages_node(node, gfp | gfp_flags_quirk, order);
> > > +	page = alloc_pages_node(node, (gfp & ~__GFP_ZERO) | gfp_flags_quirk,
> > > +				order);
> > 
> > I don't think pKVM does any scrubbing on set_memory_decrypted(), so it
> > potentially exposes confidential guest data before it reaches
> > clear_pages() below.
> 
> IMHO that has got to be handled in the arch code implementing set
> memory decrypted.

I guess that's a better separation. It probably needs to clear the MTE
tags as well, it's not great to leak them (though not as bad as leaking
data).

OTOH, pKVM would no longer need the clear_pages() afterwards since
there's no encryption key changed. Not too bad, it's not a hot path.

> Further pointing that maybe we should have an alloc decrypted so we
> can at least try to minimize the number of times we write to this
> memory. :(

This would be better.

-- 
Catalin
