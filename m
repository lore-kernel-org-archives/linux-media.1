Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA003F8EC3
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332366; cv=none; b=V7XiwGKjyz3Y9EoWUgyDF+GzptKOoSL71Kr/Y2ZRrkMOUIYEYp+t2ap6ENvs3YMMolSahrJSXW8CkplAnrId1i11SHmYT+14LQGJP/3WNtFjtAm4QKTqr61ckyRCTs3wCWFyB812Pt8W7puB4Z+kIzNgxx7u3hhWE7J+OeCbSyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332366; c=relaxed/simple;
	bh=uY3sUepmqssMOr1jNQvyXWE6qqQrkaRqI5lsNd3E8OM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXewnyWWKN1md3OJnrfVHTyXUCrw/k6Uztju6QjVbUumUTkeRAw3vsxpzn24EYxHvwpnVd0f73LlpKwa8a2ehWc/WM8Np7zlumQ/3EPE7gI/Gyom6NHC3/mkGIEmA2AWtQdJWpzGvrjSc9jKPvnsIZWuN0FyquzNPedZrpFQ9I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGVPcDzP; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGVPcDzP"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1f5208b38dso182342066b.0
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 06:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785332352; x=1785937152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3aN3udKBcENjBD5UHxw3XhgPgHCGso1JhkYTFHwhTGI=;
        b=KGVPcDzP8wQ2SyiaYgiEB/4+DEBMYVALsc3jCB2ht0eAjAMxzC7NXELzSBNNQc9MON
         d+5UWFqymcPii4NKyLLs61jvxSrgM4urA7UkU2HBYDgPFjDRMUOonbQMxjRRz2fM1A1G
         0KQEeIhH9kn1nef3qZipqo46Ff4aokfZS8yASW93kTavs5E/4t210s8/nqPmRCI2xWmQ
         cfiUS6RP81gBjK/rG275PimVCBEjZw1hM2fIi52JuSxl+y5ssYS80UyMSVQF+j+qwWAN
         5FmGmrGXBoIq6mhUzjQD+AoBX6TSFQp9EuI2mNAYYE4/W/exMXsXk9Ptt68mGWbQptup
         dcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332352; x=1785937152;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3aN3udKBcENjBD5UHxw3XhgPgHCGso1JhkYTFHwhTGI=;
        b=rlErQFguLLmTfAe4Rf7h2Xl1OpPjS5eJC1btQSBxbaXH1S6eVFPFIeFi894Cg7XaEM
         t4cYQajSnbmRo8g8iHbGPsp1yjz5mHtYPFZxmUQmgZDT2qa8bDcg+Huash16Erz/2Has
         pSUyu0ylEAEPTWTNPmXSJPrH9aVxMcS6jiLiffJ5WTmG3Xa/qXhdS+iIbEGsck3VHDdD
         Jn+C78RoavP7kZDMNVJ7ePBum/nyr5u3PixHloTBdGfV3DLfx7YbQEHkv4Es1luxadC2
         hVaID7vJBC4WRcneDMdhsSoNeHfiyTVcWJlPACuMnlx6CbN8BZRh6nBa3QV4juji+B8y
         VmwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+oWr2yg4euFt7dEuYIjBxyg/Dg/9AbkP98c0m6cKDlDxYaRwbbUVYELLBC1NvShhYAtF5GjeUkfdoSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcXjo/F4R0NY0uJHu96YSVsTmTX2Nq3MccK6You+I2CBYa2sed
	mlMCIoEID26e4VzJdKhkZAhAX/Kz+RliRLUOZE0Kddk9tjlUjkNTkIPv
X-Gm-Gg: AR+sD13Evr+AsJRKrvP19qPr3m7opTh4bvuiqVIw/+KCiY2UY+LlqhPo5kPgag48E+J
	ViHx5BYNg5F67JbpnlrvYiSGCt10pkc5SjWOJ4MJc53v3NY+RujEIkSXqWIuBUbTkj2bTWgyGW7
	3JWAaJJF55A9DSkU75S2zozHfIC0wBXBNh7aPrV8vJUr2jlERLOrbonWEMk3cw3FF+cq0edwI3V
	XErAN6Ye/J8NtMNGY/KBKtlfvPaLLrIKFrcQvmbfJTsk3m4yUjjY7J/ltl70q3vXdA1HMRcIA+q
	7ow1szYbvqWPSnxuqxIeOJWEoLooXrKcfe2KzkZQcEa/ckKjxE4Kth0Cv0NTBmqK3UxZ3R+r1Ra
	a9IeYjvU2vngedD5wSWkcPYN+0iytZQ+4r0usjmk6ia3EvhqIZnSuxx9q9IHJjqVk+fV+/w0Tkc
	JLGa8fq9HibaHakHgGCmSiczTeA4C1+7yP4Zl7hnMe9lG4lg1pIx6whbqHzThcP+i0QySjKDp+y
	AtFsR4TQ/Q/XnA8VBwbPDrPvJ1OEhgJJdMc2tamFDn6oXvoijI8Zm6CLEyWUx4RI4pG30hRpEyD
	FCrFsLnK8BjA5AP881M=
X-Received: by 2002:a17:906:f598:b0:c16:7b66:4932 with SMTP id a640c23a62f3a-c1f721bf58emr374209166b.64.1785332351629;
        Wed, 29 Jul 2026 06:39:11 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:640])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83f4de5bsm118685466b.29.2026.07.29.06.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:39:10 -0700 (PDT)
Message-ID: <dc72d46b-7b45-4beb-8e36-d810d2a94c28@gmail.com>
Date: Wed, 29 Jul 2026 14:39:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/14] io_uring/rsrc: extend buffer update
To: Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>, Jens Axboe
 <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Damien Le Moal <dlemoal@kernel.org>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, David Sterba <dsterba@suse.com>,
 Ilya Dryomov <idryomov@gmail.com>, dm-devel@lists.linux.dev,
 nvdimm@lists.linux.dev, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org
References: <cover.1785274111.git.asml.silence@gmail.com>
 <CGME20260728213008epcas5p418dfc10b7ef786e162ade86d14430475@epcas5p4.samsung.com>
 <633d33d8e278999f55126794fce948343403494a.1785274111.git.asml.silence@gmail.com>
 <73317bf9-f7df-43f9-abc2-daa25a675485@samsung.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <73317bf9-f7df-43f9-abc2-daa25a675485@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 14:31, Anuj Gupta/Anuj Gupta wrote:
> On 7/29/2026 2:59 AM, Pavel Begunkov wrote:
>> @@ -882,8 +894,13 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
>>    	struct io_imu_folio_data data;
>>    	bool coalesced = false;
>>    
>> -	if (!uaddr) {
>> -		if (size)
>> +	if (desc->type >= __IO_REGBUF_TYPE_MAX)
>> +		return ERR_PTR(-EINVAL);
>> +	if (!mem_is_zero(&desc->__resv, sizeof(desc->__resv)))
>> +		return ERR_PTR(-EINVAL);
> 
> desc->flags  isn't validated here, unlike __resv. nonzero flags should
> be rejected too?

good catch

-- 
Pavel Begunkov

