Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0625137BE6F;
	Thu, 20 Aug 2026 17:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247891; cv=none; b=M8JHCYfPlHvo2R+IJrZ/QEGWqYGKssOASf/ERKrdQ3c6eca7Hgrbw2YCE11DZCurQKo/H9akNv5EvXj/3vXzpbWxzuOUl+EPBHitBtjlP/qUMWmAX61AFuniIx0if1x/Alx/qWD5G65lKpo5QodDLUk1ALcScYXmoaymMoke5WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247891; c=relaxed/simple;
	bh=ZM9sg/RSerJOWxKjiA4PYnkNJoiYGKpyXA8LruZG+VE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSTGDL9lhRFG3GHOoZwEM6JPiNFYEsBDpDphiwkVtSvDxVEABdFZjXXfwGqasUuaL/cdE5djhlrsOALgH1SNWfQpo45phGIFXKMBnxXNbbVwyyhtFD4TlAL7oxKnyVmixXHzKGinxZbIW3QRcIHD4U5sV7ehLLeezyV8OY6A83w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=M/XzHRre; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="M/XzHRre"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74B511477;
	Thu, 20 Aug 2026 10:44:44 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F9C43F763;
	Thu, 20 Aug 2026 10:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787247888; bh=ZM9sg/RSerJOWxKjiA4PYnkNJoiYGKpyXA8LruZG+VE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/XzHRrezBOqpp2QoYljfNsuWLo6QApmQ7ZiAInG4n0QLnmZo37eyq/egMLz0msZl
	 NvS4zWlQ6NbWJC9JfVE+ouSxZwRdwNEuLGzeRKFCn8VoThkR+KDSRosyApkLL+ioKC
	 dsNRj5IMAfcmFGkEgCzp4TzBgmXrt7Iu8sLowYm8=
Date: Thu, 20 Aug 2026 18:44:43 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Marc Zyngier <maz@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"T.J. Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
	Jiri Pirko <jiri@resnulli.us>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 1/4] irqchip/gic-v3-its: Zero shared pages after
 conversion
Message-ID: <aoc9CyxGPHPKFH1N@arm.com>
References: <20260820150034.88729-1-steven.price@arm.com>
 <20260820150034.88729-2-steven.price@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820150034.88729-2-steven.price@arm.com>

On Thu, Aug 20, 2026 at 04:00:30PM +0100, Steven Price wrote:
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 6f5811aae59c..a055837832bc 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -213,16 +213,18 @@ static gfp_t gfp_flags_quirk;
>  static struct page *its_alloc_pages_node(int node, gfp_t gfp,
>  					 unsigned int order)
>  {
> +	bool want_zero = gfp & __GFP_ZERO;
>  	struct page *page;
>  	int ret = 0;
>  
> -	page = alloc_pages_node(node, gfp | gfp_flags_quirk, order);
> +	page = alloc_pages_node(node, (gfp & ~__GFP_ZERO) | gfp_flags_quirk,
> +				order);

I don't think pKVM does any scrubbing on set_memory_decrypted(), so it
potentially exposes confidential guest data before it reaches
clear_pages() below.

>  
>  	if (!page)
>  		return NULL;
>  
>  	ret = set_memory_decrypted((unsigned long)page_address(page),
> -				   1 << order);
> +				   BIT(order));
>  	/*
>  	 * If set_memory_decrypted() fails then we don't know what state the
>  	 * page is in, so we can't free it. Instead we leak it.
> @@ -231,6 +233,9 @@ static struct page *its_alloc_pages_node(int node, gfp_t gfp,
>  	if (ret)
>  		return NULL;
>  
> +	if (want_zero)
> +		clear_pages(page_address(page), BIT(order));
> +
>  	return page;
>  }
>  
> -- 
> 2.43.0

-- 
Catalin
