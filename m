Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989141;
	b=mzs83aiqPMgiHA/DP6sT6JzQ4hGZ+kwAiZMnKYs/UKzbZY96IknwGVasKmE1D26i9iA4
	 22aWBFNDEHaUTG3iKkjYbTFYYpE36rS6lVfZk6LW1OACMvT+1FgMAFvvyMfXTz8gdTHC6
	 6PrYe5C3VZjOTlov0yAqDkY+Icg40Hfd73sKqIWnllhG/zhZN0hzwPKbV+H2ymcVqcGAm
	 bFNhlxomqk+R9lzR4yCbJbIt5EYaML7SMaRwZA2b1LtqurCgK+VZk1pS8IEnpR5o3svu5
	 xXyW4dmdymu8NYpTwRieN4Wz4C7TBG7vJViKGuOwZwvF9/9L7/zVAx6DmH8F2VMaVGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989141;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=D6wcvXz+3VFjmwaXZqu53OPZKJ3AhVArDX6YTdc8W4E=;
	b=Mg6+9BQ8v3tqyUw6W0001AHTzf1p9/4wdxRD56c1RpFiWTYSxbqGU8blbl1IwLtbu+8z
	 GlG8JDjJfmQ6cE+ww0rT2doMSf5p17a++nJA17opILvyY/XxYfqFe/taA1/IbFLuxocht
	 KlJRXdlwv71KeMz+S2AG6Qbr1Xnz3hPqmhEfVikZjHUI9eLKzXMw0w/uQcPq6UDFEIcDX
	 GV3EeK5Y/9SZ7c+Qn6/PYne0kReHQG3EuGCxYeuOGLGms6IbPDzeSyvcMLfBdzOHaJqDW
	 0Cl14v2IJSieuoi5k6Ds5zR2LbB7Awn6DtmPuTx7unLwcckxC00zLvUfXsice2+Fniw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=aKdqcyhG;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80599606A31C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 08:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80599606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=aKdqcyhG
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261118080536euoutp0218dc33112c0ad54cddaeb9be7b1fbb66~pFRwFmsPb2515525155euoutp02Q
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 08:05:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261118080536euoutp0218dc33112c0ad54cddaeb9be7b1fbb66~pFRwFmsPb2515525155euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794989136;
	bh=D6wcvXz+3VFjmwaXZqu53OPZKJ3AhVArDX6YTdc8W4E=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=aKdqcyhGFaiQHwYEXFHR+D2kPlLirVWKgp/AFFxw/eNnJGJIRz9+vXUSujwa70g+j
	 rfkLIK5cYprST4iPTbgbMH9XNL0iJjg3nkVgKI127PhdnWu0IB4Ym/TNWjtdIckRAQ
	 N8vLCZsOhxh+DetlQuUdkga13JrKpJzqgsd1mZws=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261118080536eucas1p250aaaa4c5a74f1d8ea77b05ae499c208~pFRvmAThv0498604986eucas1p2B;
	Wed, 18 Nov 2026 08:05:35 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261118080534eusmtip1f0c261bfe6ce1a4f8ad61f83e303149e~pFRukqbHp2329623296eusmtip1s;
	Wed, 18 Nov 2026 08:05:34 +0000 (GMT)
Message-ID: <ac09180d-27ea-40dc-a728-68e07333e153@samsung.com>
Date: Wed, 18 Nov 2026 09:05:34 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] dma-buf: heaps: system: zero pages after
 set_memory_decrypted()
To: Ying Xiao <eagleshaw@google.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, "T . J . Mercier" <tjmercier@google.com>, Jiri
	Pirko <jiri@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>, Philipp Stanner <phasta@kernel.org>, Jacob
	Moroni <jmoroni@google.com>, Xuehao Hu <xuehaohu@google.com>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261117155431.1654298-1-eagleshaw@google.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261118080536eucas1p250aaaa4c5a74f1d8ea77b05ae499c208
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261117155436eucas1p2fa7d030f5557d1c88d943226d65f69ca
X-EPHeader: CA
X-CMS-RootMailID: 20261117155436eucas1p2fa7d030f5557d1c88d943226d65f69ca
References: <CGME20261117155436eucas1p2fa7d030f5557d1c88d943226d65f69ca@eucas1p2.samsung.com>
	<20261117155431.1654298-1-eagleshaw@google.com>

On 17.11.2026 16:54, Ying Xiao wrote:
> system_heap_allocate() allocates pages via order_flags[] with __GFP_ZERO
> while the direct map still has the memory encryption bit set. For the
> system_cc_shared heap, set_memory_decrypted() subsequently clears the
> encryption bit without re-zeroing, leaving ciphertext in DRAM on
> confidential computing (CoCo) guests instead of plaintext zeros.
>
> Skip __GFP_ZERO during alloc_pages() for cc_shared allocations, and zero
> the pages once in system_heap_set_page_decrypted() after
> set_memory_decrypted() succeeds.
>
> Fixes: 78b30c50a7ac ("dma-buf: heaps: system: add system_cc_shared heap for explicitly shared memory")
> Reviewed-by: Jacob Moroni <jmoroni@google.com>
> Signed-off-by: Ying Xiao <eagleshaw@google.com>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
>  drivers/dma-buf/heaps/system_heap.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index c8959eadc71d..5f98d0df11e7 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -72,11 +72,19 @@ static int system_heap_set_page_decrypted(struct page *page)
>  	int ret;
>  
>  	ret = set_memory_decrypted(addr, nr_pages);
> -	if (ret)
> +	if (ret) {
>  		pr_warn_ratelimited("dma-buf system heap: failed to decrypt page at %p\n",
>  				    page_address(page));
> +		return ret;
> +	}
>  
> -	return ret;
> +	/*
> +	 * Clearing the encryption bit does not clear DRAM, leaving ciphertext
> +	 * from when the page was encrypted. Zero it now that it is decrypted.
> +	 */
> +	memset((void *)addr, 0, (size_t)nr_pages << PAGE_SHIFT);
> +
> +	return 0;
>  }
>  
>  static int system_heap_set_page_encrypted(struct page *page)
> @@ -376,7 +384,8 @@ static const struct dma_buf_ops system_heap_buf_ops = {
>  };
>  
>  static struct page *alloc_largest_available(unsigned long size,
> -					    unsigned int max_order)
> +					    unsigned int max_order,
> +					    bool cc_shared)
>  {
>  	struct page *page;
>  	int i;
> @@ -388,6 +397,12 @@ static struct page *alloc_largest_available(unsigned long size,
>  		if (max_order < orders[i])
>  			continue;
>  		flags = order_flags[i];
> +		/*
> +		 * Zeroing while encrypted is wasted since decryption leaves
> +		 * ciphertext; system_heap_set_page_decrypted() zeroes instead.
> +		 */
> +		if (cc_shared)
> +			flags &= ~__GFP_ZERO;
>  		if (mem_accounting)
>  			flags |= __GFP_ACCOUNT;
>  		page = alloc_pages(flags, orders[i]);
> @@ -438,7 +453,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>  			goto free_buffer;
>  		}
>  
> -		page = alloc_largest_available(size_remaining, max_order);
> +		page = alloc_largest_available(size_remaining, max_order,
> +					       cc_shared_buffer(buffer));
>  		if (!page)
>  			goto free_buffer;
>  

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

