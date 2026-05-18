Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B623E5567
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096284; cv=none; b=OhaJXgXAxTGG1y9S95HaFb9ntVVDJqcWpwkBd24gfHkG/H8ZtR3/9SLsY/0s5A0etUzafLOipw5iMr99/XsGGEgorHR0qxGkyRco+raT0HDgf50R4kMvrTHlkecg4l1FJIi6Qwotz/PC/9KwdY79Qw6oALJELAii8nrq8ShpJA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096284; c=relaxed/simple;
	bh=aFahUNzTuRd9lUxR1CTcAQQJqOKmfE/dGIcc0XxoVMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LcbGQpvp7Uei2RcRgFeDuUr2WXStsNdifZ6HUZDdZ2iyAjH+vNGBvSbsMb0Cc2eJz8c6zj6FSTRt6vm/Po+wy4T4p1HsQ6/tcxVnt/MY/T5tzKfBcPADmk2f5CY6+Y4TFsKmOWHN+XKhvVGjrAvCmWGbeypFd2ZRfJOZU5oqFcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlgdSvCf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlgdSvCf"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43fe62837baso1049140f8f.3
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 02:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779096281; x=1779701081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ZnntFD93TY8/+xleaPVExk6NAT6He9j34KXY+n97WI=;
        b=AlgdSvCf0TRu9rJVleCHIzTcmD0GE+h3APf3VOfOZ1cbKpW6GubpjmhF4EwezjT5Vt
         TFs148AA7KCfRr+bwmWp3MR9SeVp2uvP+/gyUY5RvFBzbx2+gE7bTh09tdzJtCLELo0Q
         uYfcJCy9co8Wmd78W0TW+VrsKOeFaP4DATPE+fE0duTTx8VKUBBegBIstHdXyVNG/jLe
         gR6QTjNp8CNjx8WObfme7ar4nvVxXSf7b8cPeyguI2sxfZRylKWUUlIDpwrd025MhsLo
         CWCZpDS2CHpDJZUhf6x3MUl5XT6+wbbN2PUag9gYzY4dNJatC6vz777RWxanc9PlAtOi
         IozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779096281; x=1779701081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZnntFD93TY8/+xleaPVExk6NAT6He9j34KXY+n97WI=;
        b=M/PZLLNGestCIPrMFVmtqybkkGZgqWjBOwmHN0UOLF0IulZMb/CArq2Vh2UPd1t7c7
         GicdEZehTngaKvKJX7kssX7XUnvrcwAcv9mD0SLY/Z/ay7ObohmqgCvUn6+lb1jk7PBv
         7KMpp0t2MJDSBZwI7ZlnC/CueynQXve4LH1d/4aEMlGX2FVBL7Zj99/dNw+ikcJCRJOI
         4UoI3PbW1UVfK8RNUj4GQq3XbA+b2qMKYUlSszET4u+CmFtUwcjAoo+WrJcrZ6khttl+
         k1xZFmftzblMxIEMxEXmulSIfFx0UjQSz9jNmoieDA/BWtgV4AjU/KgUCLB9775KdG4h
         IXwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8i+1UkfHWo6cq+KHJi8CkyGlERzywyw3SZw0zx/4kbn4/dLAt5E1CWr/gZCe6IjMxOPIcUKz9PdMxI5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzubeKYh5Dv96y7jT/5BryyHBxm+mmwbceMty09AhRPRb1DZ8kc
	vW0E+MWb7Y1HtSAwzEzLS+9uowdSylqmRCxejAGK/FVsbOoTbFCf/zGE
X-Gm-Gg: Acq92OHBWWQayamU8BAoKO+EgmOcV3KrJJWzeXOWs2kpXXBqlQywv4Si4cXUQ9OUA2l
	Nhj26x31DFqEW6N5g0D9TjHEWsvgOtR+iRAGFMiOIYI2+GT5/kUurYlU5o+QB4PzMF9bqTpFE5h
	VHxBqwO8c5yUHo/zMQOV8RwF596wTLRQ6JVsO8eF5XHVrJgzcloQHe49iTZk6/DuXFA0VZPL7kV
	66l0cHJetXsAPrF/zUWqdKHeA3h+pAXzF+da44hueD+ltPQgqZDLO+kn0q1nv16zu2og5TL3R9q
	f2wS6wcelxikC3NyFG5c64nmiS+p5jTe5N9irjwGUSQNp37hvcdW6GnXxiobht010Fm96oHZNUx
	NQqy76fSoWFMuxb0zeOy8EJAy1B3CsituQiQuBUeUn8YxNKxVzAbpIXNmA+ZdSKwOtRXV2j2NfS
	BMVKu8fz9X78TrA31VzPX8NfTcIHB72DkhcF5fmkCUdhXP8iSYsr4eV0fIeofl5QLQmD9SPYxD9
	JDf14M+2ztQIwdVMwkdSKsn0cRue6Nl++8ufzM4e/UCuX05VOV42gZ29FY=
X-Received: by 2002:a05:6000:288c:b0:43b:962b:5314 with SMTP id ffacd0b85a97d-45e5c372a9cmr22814328f8f.19.1779096280750;
        Mon, 18 May 2026 02:24:40 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:6e9b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45e6a135f0csm17325957f8f.27.2026.05.18.02.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 02:24:40 -0700 (PDT)
Message-ID: <4b2f74e9-3225-47f6-85fe-911720030e35@gmail.com>
Date: Mon, 18 May 2026 10:24:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] iov_iter: add iterator type for dmabuf maps
To: David Laight <david.laight.linux@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.1777475843.git.asml.silence@gmail.com>
 <20a233d2f35274817aa643cc0fe113707eb47e72.1777475843.git.asml.silence@gmail.com>
 <20260513110557.705bdeed@pumpkin> <20260513142909.03ae6c2b@pumpkin>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260513142909.03ae6c2b@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 14:29, David Laight wrote:
> On Wed, 13 May 2026 11:05:57 +0100
> David Laight <david.laight.linux@gmail.com> wrote:
> 
> ...
>>> @@ -575,7 +575,8 @@ void iov_iter_advance(struct iov_iter *i, size_t size)
>>>   {
>>>   	if (unlikely(i->count < size))
>>>   		size = i->count;
>>> -	if (likely(iter_is_ubuf(i)) || unlikely(iov_iter_is_xarray(i))) {
>>> +	if (likely(iter_is_ubuf(i)) || unlikely(iov_iter_is_xarray(i)) ||
>>> +	    unlikely(iov_iter_is_dmabuf_map(i))) {
>>
>>
>> Doesn't the extra check add more code to all the non-ubuf cases?
>> This could be fixed by either making iter_type a bitmask (with one bit set)

Not going to do that. It was specifically converted from bitmask
before, and the check optimisations like this were voiced back than.

>> or writing an iter_is_one_of(i, ITER_xxx, ITER_yyy) define that uses
>> '(1 << i->iter_type) & ((1 << ITER_xxx) | ...)'
> 
> This seems to DTRT:
> 
> #define _ITER_IS_ONE_OF(iter, t1, t2, t3, t4, t5, t6, t7, t8, ...) \
>      ((1u << (iter)->iter_type) & ((1u << ITER_##t1) | (1u << ITER_##t2) | \
>          (1u << ITER_##t3) | (1u << ITER_##t4) | (1u << ITER_##t5) | \
>          (1u << ITER_##t6) | (1u << ITER_##t7) | (1u << ITER_##t8)))
> #define ITER_IS_ONE_OF(iter, t, ...) \
>      _ITER_IS_ONE_OF(iter, t, ## __VA_ARGS__, t, t, t, t, t, t, t)

We definitely don't want that, using them directly would've been
much cleaner.

if (get_type_mask(i) & (TYPE1 | TYPE2)) ...

-- 
Pavel Begunkov

