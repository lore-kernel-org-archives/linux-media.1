Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5E642B303
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 10:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785927551; cv=none; b=Mg9CVfPwt0XgIzatP7i2f9+fe7EQ/SyRbNK4zYoasEXOjAY8rsfA3aTi5TOCPTfZKWGpFRGK+y8GpQzwu5pjYKsPXQ5hMvju3gPg5mqXSLLsvECOcPdMFNXS/gpmSerjtENCyLvz28nBVAZ7Jl34Ji3ZdDEqazVzODsN566AZqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785927551; c=relaxed/simple;
	bh=/1dtEFjUK+P0pvRVxCDasuHqjQBqBeraGQRhegPMj5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B3uFgPGoYMM4dwS4rmiv1y+E16Dv5DI2UhqlIzwWHY6IuI9iK3ecUT8IFMe8w/it85rhMDd5DdCAR+oKhFJa3lvblQq86fTH0LD4d4sbp3J/Se7MePvfg31IKt5gAtaiPpouyiwqaglYlWJLZQnTXLhnjczXJZvTf0nS2K4W7zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZEXOh1K; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZEXOh1K"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso7946935e9.1
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 03:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785927546; x=1786532346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qChqnXEV/RUrII3F6FtB3OpL17H6S0GQj9i1G4DFOPk=;
        b=SZEXOh1KpuYJfaF3im7hVoma9sONKG+vqzLlaf7ooZ3+DAVgQF2n8nHiu3IBzKzRRw
         dp61JCqy4D2c2x5T+fFsho0Kc4LPfYzRhYnaRPQxTWRUmJNY2O3uEtNUJ9g0jtsQzB78
         acwHo/V/p7Z+a/CycbdYZGZ0/BQXrBPXtv82DmWLOJ6CXmegiDSc5Vpr9pIheKRjGqMF
         r+UcPmzDpbWcI8H13x2BkfrjOdsL8Xsy75IrRzcWKT2gi+twbWrzsVK/oIe0qJM2wJoa
         yEryF/AJxdc6tNkssc5mLthTAMvFEWY1cWRMtRboKcJGJ7HfUeRlxV4Ne690/an9Vv8/
         6wYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785927546; x=1786532346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qChqnXEV/RUrII3F6FtB3OpL17H6S0GQj9i1G4DFOPk=;
        b=TTVm/OyYEQSN6Mv8JDtGtgEy0W4YE3fiqft7Dq8NGjlvXZjgw4xI12sOv9ME+ZVg5m
         wqn7UptHuk66ndyo4J8tpP/YSbdDEje8iVxDTfyfMIWE6XYZ2abEbyY6v0vvXFxecRLy
         jJhgQDTqBV6ieaAZtvFZiR6x+URklCgFElY5j86dStVbLiNZkS45EICQ4sj6qEw4Stb1
         Cy6TQha0CCvqrd3MjVF6tjT5AHcPq9iDEVZBSteQBiWz2eNpiqrHrUdyAXbbN1O/q+Ov
         CkhO0cyQlSZkYRpoLzECHxDEQQHEQnI/M/XXHWMQsXip1h95nl1lJSimihko5TQQdNnU
         Gkow==
X-Forwarded-Encrypted: i=1; AHgh+Rr0/gik8RZIXYQvy6ZPl1VdLO+2em/JiFC4Q8A/jPFoJZQ9LK/YB1KyFji+8HilaNHYHGak3l3WzBwB+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqRCLiNrQITrCSMg2YpSWj3frfAF7Tf3JE+Xhjd8YZcmgdpYnX
	iC+Yu/LXJDLLqyjFrMI0QL/Q0ZmTgE4JYFAwcgYuj8V0Gb/V/uLGHH7h
X-Gm-Gg: AR+sD115YkJ/ADa/GAX8Dz5/NcuRE9/9iQUpTMlcKysZJuJGzVBQeGcdtUr0lWG0Tgj
	FBGC9dJTGgqfbiiNhGS4ai0Xzm/6z6LGa3GX/p9DOmMhrFQ0b8BbBX6GjzZwrVLDg0n1t9Iui2i
	mCOavcDFCW19IMpP3w+ELpb/ucSZR/77bRqjVj5aFG9o6GB9cirA3CMjrIdI6viHAJkFrjn313C
	qlkkqnOWO7UpSmbC5LUK7V/sLmw/uBd65jRF5HFkVjZWfJtWE2SRgfWV7V04SNwg0DOf8cQOjvm
	Rq+woXXqCkaAZo4C1GYakWAtKrWHVFEu5k9RlAP6f61D174IOgYW3FaIqOiqYoBFyvk8SfE2Xeb
	DAND7Hu795lPZeZgXblJDfqCOREM8iJYSUYIXaVyIk1Iz9fChufQ2qGHjKSYc3ocf0XcOapRyHf
	z7b6yLBSAYdf2IPDXYzPEwdBO5uqytijplV14UlFeh+Bod6LMOoEUmPp6EwjN1SP5DmAwD1WWMZ
	YDPfk7li5fgmn7n0uEB4i6xYjZOJlHARUJbdEi3n6yFWXcio3AaMQMwgNlQKp3UmLcLkl23pxMv
	qv4auOE61E3c2s+FXhip+nWlquFxIfqB0R7IEYJzXhzxKR77
X-Received: by 2002:a05:600c:4e94:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-4994e6c5eafmr60022735e9.0.1785927545848;
        Wed, 05 Aug 2026 03:59:05 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e035900sm80665575e9.11.2026.08.05.03.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 03:59:05 -0700 (PDT)
Message-ID: <8285ede8-bebb-403a-8a37-b9987cd37a8f@gmail.com>
Date: Wed, 5 Aug 2026 11:59:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/14] dma-buf: introduce initial file I/O
 infrastructure
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Nitesh Shetty
 <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Damien Le Moal <dlemoal@kernel.org>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, David Sterba <dsterba@suse.com>,
 Ilya Dryomov <idryomov@gmail.com>, dm-devel@lists.linux.dev,
 nvdimm@lists.linux.dev, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org
References: <cover.1785274111.git.asml.silence@gmail.com>
 <bc20381e8daf85ac58811c344325d8192cde9d1e.1785274111.git.asml.silence@gmail.com>
 <181b08be-04bc-4ae9-bb88-15321a82440f@amd.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <181b08be-04bc-4ae9-bb88-15321a82440f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/5/26 09:27, Christian König wrote:
...>> +struct dma_buf_io_fence {
>> +	struct dma_fence base;
>> +	spinlock_t lock;
>> +};
> 
> Upstream has change to allow embedding the spinlock into the dma_fence, so this structure here is most likely not necessary any more.

ok

>> +static const char *dma_buf_io_fence_drv_name(struct dma_fence *fence)
>> +{
>> +	/* default fence release kfree's the base pointer */
>> +	BUILD_BUG_ON(offsetof(struct dma_buf_io_fence, base));
>> +
>> +	return "dma-buf-io-ctx";
>> +}
...>> +static void dma_buf_io_map_release_work(struct work_struct *work)
>> +{
>> +	struct dma_buf_io_map *map = container_of(work, struct dma_buf_io_map,
>> +						  release_work);
>> +	struct dma_buf_io_fence *fence = map->fence;
>> +	struct dma_buf_io_ctx *ctx = map->ctx;
>> +	struct dma_buf *dmabuf = ctx->dmabuf;
>> +
>> +	/* the release path must wait for fences */
>> +	if (WARN_ON_ONCE(refcount_read(&ctx->refs) == 0))
>> +		return;
> 
> Stuff like that is usually illegal.

Should be fine, it's just a warning. The map holds a ctx
reference so can't be 0. IIRC, it was synchronised a bit
differently before. I can kill it, refcount_inc() has the
same warning anyway.

> And why are you using refcount directly instead of kref?

Not sure it'd make much difference here.

> 
>> +
>> +	/* Prevent from destoying the ctx while unmapping */
>> +	refcount_inc(&ctx->refs);
> 
>> +
>> +	/*
>> +	 * There are no more requests using the map, we can signal the fence.
>> +	 * It should be done before taking the resv lock as someone could be
>> +	 * waiting for the fence while holding the lock.
>> +	 */
>> +	dma_fence_signal(&fence->base);
> 
> Signaling fences has a whole bunch of very strict rules associated with it. E.g. you can't alocate memory for example.
> 
> Are you sure you actually need and want a dma_fence here?

Waiting for potentially a ton of IO synchronously on invalidate
sounds like a bad idea though. Hmm.

>> +
>> +	dma_resv_lock(dmabuf->resv, NULL);
>> +	ctx->dev_ops->unmap(ctx, map);
>> +	dma_resv_unlock(dmabuf->resv);
>> +
>> +	dma_fence_put(&fence->base);
> 
> You should probably set map->fence to NULL after that.

The map is freed two lines below, but I can add it as
a defensive measure.

>> +	percpu_ref_exit(&map->refs);
>> +	kfree(map);

...>> +struct dma_buf_io_map *dma_buf_io_create_map(struct dma_buf_io_ctx *ctx)
>> +{
>> +	struct dma_buf *dmabuf = ctx->dmabuf;
>> +	struct dma_buf_io_map *map;
>> +	long ret;
>> +
>> +retry:
>> +	/*
>> +	 * ->dmabuf_map() will be calling dma_buf_map_attachment(), for which
>> +	 * we'll need to wait for fences. Do a bit nicer and try to wait
>> +	 * without the resv lock first.
>> +	 */
> 
> Clear NAK to that. Always wait while holding the resv lock if you can!
> 
> It is absolutely not beneficial to do this outside of the lock and usually just hides problems instead and prevent fixing them.

Ok

...
>> +	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
>> +	if (WARN_ON_ONCE(ret)) {
>> +		struct dma_fence *fence = &map->fence->base;
>> +
>> +		dma_fence_get(fence);
>> +		percpu_ref_kill(&map->refs);
>> +		dma_fence_wait(fence, false);
>> +		dma_fence_put(fence);
>> +		return;
>> +	}
>> +
>> +	dma_resv_add_fence(dmabuf->resv, &map->fence->base,
>> +			   DMA_RESV_USAGE_KERNEL);
> 
> That sequence is clearly incorrect!
> 
> The fence must be created after dma_resv_reserve_fences(), otherwise you definately have an illegal memory operation here.

I'm not sure what you mean, can you elaborate? I only cared about
pre-allocating it to avoid allocations here. We add / signal the fence
only once, no reuse. The map is going to be killed here, and if we
create a new map, it'll have its own fence.

I can move the dma_fence_init() call here if that makes a difference?

-- 
Pavel Begunkov

