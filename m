Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1EC44A72C
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 10:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322195; cv=none; b=m+i/fAu1Cw8se5JuCggjZlDhKujjhoBc8/qNCpDVXS1w6tR/ZTQm2xpA3XG3yVyo8/kQ3QugSWBJHX8xc/zuNmpPRII4RV+9tU2m/mL+DuXYWYYgQRlKQAPI8e07JTdT4xylF6NCqMJh7eLx7z1ex/GVbnZ1sHiT8K/PUc6temM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322195; c=relaxed/simple;
	bh=iNi2nFSA8g81W+/HnLXlWmnLlyUILEZvQTRGox6oYII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Brfamh+w0vibd9GE/ia1nZLFJ6YSpWNjPPW1+WB4OU8cgDsKsj4cX2cX+hkZ3EVJ9X7NtKA+j8OPSs2dulNdyrMMHiHqWLP0Xqs+azkqn3+Y2P9m9xyMb0b28KiUR6mtLLONS8hG7BkGcCcfg/q3RhZd93BC7W5Rv+LNFglOi7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6f7Plz8; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6f7Plz8"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69e2266b07fso1049819a12.2
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 03:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785322187; x=1785926987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3xVEH4RvIZup14rRYV4Zvxl83sd+HTGGj/jXhd9ySH0=;
        b=s6f7Plz8hCZXfh5yIrDR0xQ3OAAJW6lfJ2nNCx9b0/4iAG0GjMrmw0T2rVHZYMI3hC
         ogOq+pzXWmy0m4piruY/4MCQ6T5/GjyfZFStJ+gYah5OmM+m1d++9jRz/weyos5l098f
         FKfMfTpcSM/RQ4KFk7bZuZtsZrdsse0K1beCRAdbe3KejCBQse+RNHSN7A/poayBldUY
         qHhGuPV6sNvmWF3VcHF0EaKge4A0A3Ypobo1f3LEr7c7xqOluLhscdDkMdcrVLONA7yh
         GeN3q6i/ptpHpfZ3AghdpxRH9Iqg/z4mdXe7W5VY1LoT6bi8nFV5VNT3iV8ElLNkLJbG
         UoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785322187; x=1785926987;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xVEH4RvIZup14rRYV4Zvxl83sd+HTGGj/jXhd9ySH0=;
        b=HEgOmZpBwrgsmPkyHJF0YICJzWRg9qpzr7nv9YQyrwTNu/3qdezSX5OZmNMClnR2v9
         nsIFJJPhbSRtR82be6ujuKygArqNVRlizptAtf93rk1BHIhLYgky/yS7ZnHhp/uH0dvf
         4X4AqTMNvkK3rjOpe1mZS8tFTc4GH2/QBBzwzxaEb1HfKhLUtzT9c22Gc9SdGUlrRqqb
         omD7ycj5kYO8RiGxuuxKXHMsjP32ciFp5d+1NAS8gWZrXyWtlbczm2sM6031xxVidC3B
         JVuxwqnLgl0xu5RLbQ92ppHdEORm4YSJswA4iKY0cQZw2yyuIY76mfLQ1elMq7BvR0+R
         6GZA==
X-Forwarded-Encrypted: i=1; AHgh+RqM8ACJBT5F9VNQ36M1iwlE1nLNrD7BbLlVYbJNmgU248EAxExip534L4MHwpV4qq4Wi59u1tQj18xY8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLmleu1f6sfL1CeVJKUVL8fP0u5yUIo2Bq/BBNmuwYSNXPZEGp
	ZTcvPCQ1BGh+IECxUneaNqxlgr/0qv6vsM/6ojswP6+HJGLbbs89P3i9
X-Gm-Gg: AR+sD11yPbeJlgub71sK+/9wx0fQUND8eQuLsn9XG5KfgYyCb1iGREXo0AR2j2zNLd7
	RXj3vHI37GfyTwBi27FqxWpHoaI4hen5L4mhrQTGv4lb+FH/3vjPcf4rNJExNS+k5RGRQPWcijc
	FFpdkK5+MSbkgkH4zGhuCxln3s5ZWkXVU253K40bV8saF/OSS7KZOF4cGG8vxzNaJVrZAY32ygX
	bq7m1ppiuJM5BxczJAF097sIKj9tLIVZEzh4kClZ+iPliuq+yZgdJouK2G9MrZw5AoQrEe1dZgq
	SnKfhsRin5hInxDoXmSc5UkX91PSgD+GX7qet88ZltH/f6xS3RafySLdmhjZ2AvH12dlJ/7fVLO
	IVGT9warIsrO+hstzgu17d7P2EQkxtbhovetpuhyV4FvCk2znvU1i0eYL6nMSzPcIY4hVNShv71
	NuKgZ83e6eWWL8YP0rGTiKZx820kWlZw1p7wQWEMLgnj/+PHDY/dLW+XAODjsqHltkXoVTKvKTO
	leW53nRuQXxBp0tTtUj1qpH5oMuNjKsJMjwTx5uwzB97NmDSMqDPnqkW6QnwMaf00mNZ+h0qyAZ
	p1BsgwUi4ZmTSjrpHViuvXIy5wcu9Q==
X-Received: by 2002:a17:906:fe47:b0:c15:bea2:d209 with SMTP id a640c23a62f3a-c1f7215dee1mr299738366b.4.1785322187169;
        Wed, 29 Jul 2026 03:49:47 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:640])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83d27f47sm97965566b.26.2026.07.29.03.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:49:46 -0700 (PDT)
Message-ID: <c81be43c-2fe3-4403-b8a9-dd19855eeb58@gmail.com>
Date: Wed, 29 Jul 2026 11:49:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/14] nvme-pci: implement dma_token backed requests
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
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
 <19e5c945ea8114320c10f7951d19197d48b59249.1785274111.git.asml.silence@gmail.com>
 <20260729071048.GH9534@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260729071048.GH9534@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 08:10, Christoph Hellwig wrote:
>> +static int nvme_init_dma_buf_io_ctx(struct block_device *bdev,
>> +				    struct dma_buf_io_ctx *ctx)
> 
> Please stick to two-tab indents for function declaration continuation
> for the nvme code to keep the code easy to maintain.
> 
>> +#if defined(CONFIG_DMA_SHARED_BUFFER)
> 
> This should be good old #ifdef.  Same in a few other places over
> the series.

Going to apply both for v5, thanks.

> Modulo these minor nits the patch looks good.

-- 
Pavel Begunkov

