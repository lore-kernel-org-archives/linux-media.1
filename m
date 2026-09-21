Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B983F49F131
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999042; cv=none; b=d1qWQrgObpezlozIJ8dH3eOVeZK1dBuAX0EigKkLnDtpcg0nQfBhpQqMJ0/iRizsCv3i6HPbMhZrr/YZjiPhbnYXip/arZso6FsRZKSvi9pYk8pzqASrcLufJhK2zX7ro97NXfEYUHeE77iQl1D3iOu/5mnY8oLFWxpqXK19jkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999042; c=relaxed/simple;
	bh=05nQQn1fD5gOEpF/ULLHdZqTcDXLkNhHu9x2ubpJqaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QoRh/g2I4kUk6Gcm6UZcsrFYf3P31GjII7OmAPCGGyaH01HTpIMyvEfHOR/KazLuPG4FBlk771iJgEgmK6E2b+czvCwB0HKiymFfaUJEmJbtVSRDFdWuPfHBfxnRbaTSZb5lefV34+qKkV8CqITAZKleO9XkSCiRAk4LAhRQXVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzWI9N2G; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzWI9N2G"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60590a85cso5615493a12.0
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 06:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789999037; x=1790603837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofpT4h/xZOk97T1LnY16xox+YwsLCtjUsNXPXQGc7Q0=;
        b=mzWI9N2GG3yCh33wQMPJzyAje6/w1azTh4oUjAdlzJOreyc1TK6YMNTV/hQZ9TK3Gd
         CEyFT6JaVuVjed/fVn+ehu8kPa8HNUOBbo0dKThcMYqAxQ33Sj3C6fOg7tWRzo9WCdYB
         CgktU7m3qHBLqKFnkA5IBAlERt+FmUYJlBApJNKVhbQFFUR5JGgAq2NbcjsWbRyg6SFr
         8Cqy4Q2D+SN+vgDtmn38CUCnH3wPIvBSzJNJo61M9aWxru9kd6n65Lm/HaoGXxtsYsZY
         9ms6vbHcQFg4jHmo+4f1jqR7dpXme2eRW7XmPC1nlYjnriBkw/EB1U5QYlSftufCNk/N
         jkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999037; x=1790603837;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ofpT4h/xZOk97T1LnY16xox+YwsLCtjUsNXPXQGc7Q0=;
        b=zm4ftSkTQhHeH2S5koZhHP2A5KTEw1Hn7/fmFtQYnRLAGSY66N61/Sb8fFIT3JAePZ
         63ej0rh5dq0hk3HQLK9l/LJ1K0uHuBHn0tWG3tjRgU2KAQ1zMbszRvluU7GndZJ9CcuT
         0aoSZJdJLx0jSCehu49fILJyuAVRhPO3qYkH8dYZUgtXM56SitRzmq/qejWKfpBXwHrv
         e/fpZ5zuZvxD/TstIqGUN5FeFoirXMCHbdofhG95SexhZid7nVBcr7XpgxTQeN9v0hdf
         vEe3jxRmOztDKIsn89h64gjPUQhvFqKI387gUd5IlENLK0fpdiVH+EzAujjG59RBtNp+
         M+8w==
X-Forwarded-Encrypted: i=1; AKwUvBxixNg6O34miT32Wwn1UA2VoJlcE5iaGtUlo0WupQPgeU8fvZ3dPk2it0FlUBYMXTLFUtPJ4cgxMLZuTA==@vger.kernel.org
X-Gm-Message-State: AFuF++lcxczXCvI0kL8zUHKakPmjz27xp67yvao5dNL/3/rk+aBVpFAO
	AgZbkImmr5tpiKCIspd+h8yI5NoH9Aiu9/S60D/4fLk5whtU5Q532h/i
X-Gm-Gg: AYBFou027T2NPoQeFfAR/fEhLFAe5Wrk857iLMMKNaNHj3fN5GqRoFoMHanARYRGePy
	eez3kn8CUlLlJRtprwpuQcoxASGkQffzLVV9lYPgnOpWsJNAkQOTqLsgoTYDHb0zkTF/kn243WQ
	MNCSdqh9c0xXj06YybMZKdmAu2Evwmo/cZCc9od8ErH0bCkgQ8YuNlmaPpe1rfd5Jtr6boMdWGT
	C+V2DEx39XEK9Vr9XW0cZK5GjZAWWpJWXGdygYopyetdb20RpIHzH6OwSVerr1Pb2MN0wPJ8h6O
	4l5xS+7xUCEGw0RnQJPL5DTXmbYkeTxZIlkxMRkpCCiWUEY8a4n01c4JeRgMQBqmiPY9iFUYl4E
	rc81pt4dUvNsWfHw41RiEzo2Sng4AbiSLf/Mvh2vja7nD1L2v8WXjvsp9L1Ids0nxW/+N6GTUPJ
	9zfW0OKX1+WqeMDEJrVV9y4AW8M9g2r7OvOVZ6ga/MmmdAYN4Ctvpf7MAXfTvfz2Kwwi94Y0ge4
	m1JCRQZKe+v/WmuF3PUMAKmNrUePt7MTg6+urpohaFwLWbWVhx6mkbNWAwwBYAJ5vbctEBPUU9l
	HG2yohQv9clGEG5rnrmXIUmnanKeIKYRiXCR
X-Received: by 2002:a05:6402:210f:b0:6a9:aead:4e98 with SMTP id 4fb4d7f45d1cf-6aa577f5cfdmr8215865a12.1.1789999036894;
        Mon, 21 Sep 2026 06:57:16 -0700 (PDT)
Received: from [10.54.182.141] (82-132-213-26.dab.02.net. [82.132.213.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67e0d3c5sm4446691a12.22.2026.09.21.06.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:57:14 -0700 (PDT)
Message-ID: <a8b01e56-bc86-412b-862c-d6a3efef2e6d@gmail.com>
Date: Mon, 21 Sep 2026 14:57:05 +0100
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
 <8285ede8-bebb-403a-8a37-b9987cd37a8f@gmail.com>
 <0113c49a-a364-4df6-9ab4-681c789d9d3b@amd.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <0113c49a-a364-4df6-9ab4-681c789d9d3b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/6/26 08:29, Christian König wrote:
> On 8/5/26 12:59, Pavel Begunkov wrote:
>> On 8/5/26 09:27, Christian König wrote:
> 
>>>> +
>>>> +    dma_resv_lock(dmabuf->resv, NULL);
>>>> +    ctx->dev_ops->unmap(ctx, map);
>>>> +    dma_resv_unlock(dmabuf->resv);
>>>> +
>>>> +    dma_fence_put(&fence->base);
>>>
>>> You should probably set map->fence to NULL after that.
>>
>> The map is freed two lines below, but I can add it as
>> a defensive measure.
> 
> In that case it's ok, I've just haven't seen the kfree(map) below.
> 
>> ...
>>>> +    ret = dma_resv_reserve_fences(dmabuf->resv, 1);
>>>> +    if (WARN_ON_ONCE(ret)) {
>>>> +        struct dma_fence *fence = &map->fence->base;
>>>> +
>>>> +        dma_fence_get(fence);
>>>> +        percpu_ref_kill(&map->refs);
>>>> +        dma_fence_wait(fence, false);
>>>> +        dma_fence_put(fence);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    dma_resv_add_fence(dmabuf->resv, &map->fence->base,
>>>> +               DMA_RESV_USAGE_KERNEL);
>>>
>>> That sequence is clearly incorrect!
>>>
>>> The fence must be created after dma_resv_reserve_fences(), otherwise you definately have an illegal memory operation here.
>>
>> I'm not sure what you mean, can you elaborate? I only cared about
>> pre-allocating it to avoid allocations here. We add / signal the fence
>> only once, no reuse. The map is going to be killed here, and if we
>> create a new map, it'll have its own fence.
>>
>> I can move the dma_fence_init() call here if that makes a difference?
> 
> Yeah that is a good start, but you might need a bit more.
> 
> Here is a summary of the usual procedure you need to follow when implementing a dma_fence backend:
> 
> 1. Allocate your operation object, in this case here it's your mapping I think.
> 2. Prepare your operation, including all memory allocations.
> 3. Call dma_resv_reserve_fences() to reserve a fence slot.
> 4. Allocate and init your dma_fence object.

Looks I forgot it reply here, sorry for that. I killed dma fences in
v6 in favour of synchronous waiting, it turned to be less trouble even
outside of these fencing rules as I can rely on dma-resv lock less in
the code.

-- 
Pavel Begunkov

