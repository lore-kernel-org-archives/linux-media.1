Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8015A471438
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 13:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330693; cv=none; b=jgXOcxAB8SzUvzJffVMwXz1oiaw0gwcxqXDu2knigp9ily0ftAgvrQNHYNpD3Wc2mH7cRnKpSpHx/gZODEEX+yfIcOO5bj4mQMC5W5NqzGQ833moGruAXUyQq8hUy+lY07VIPn7Zq4jbCIB/ikAYGF9VZdQB7gnkiZ5X6U3ibwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330693; c=relaxed/simple;
	bh=iCKby9e1qhvE8ns2sICVS+CCbRWmXfOjz3bB7l8ahOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHH13oW/JYlPRPwIp2gZ1ZJK48JRYN45pWc6O1l6c+Brk4zyuil8C2USDWYqrlS6Bl4vER4LXX0k8kR+37CJxqIgbdaQHXw+v88fUkZAiuaQV6cnDugQ8a9EJ3O5HnpvLb/bjYww7CayVRLYDO8rDKPqSt7igK16lH3DTsVHuhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jti4ijP6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jti4ijP6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so9691105e9.2
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785330690; x=1785935490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlPatibx3g8XfK6S5eprVRseiFbSJCNNQ3hXCye36cc=;
        b=Jti4ijP6nIE18iAiAjCvzk7mtWD9uz6VNgJit+2+WuC97b8pScL9tVa28/B7KhF1e6
         6qBRiH4ncAICQI6XhK5XOV/2qsaxwo/f/oJmnCgNx2vo09a6sQtcBSS7pRXnSqxFDJGY
         INpBceOL/EqOodFVGAxNBVghwit1FrKOGVvhaUoDsKfB2I0x5a5hNYhSotMKW3frkoQI
         Un8BtM07xXis4VfUBUjrapU6CSGh2KhiceUEN6HRqsuTPC4pRlQEN7UnWjKm8NIESBvv
         YUAAYlsGBXioHmaXaAYAQZe4TvPo8pV8I6t24ZujjdUL+tNRxbyyQRntMzULHkrAclbQ
         8QRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330690; x=1785935490;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlPatibx3g8XfK6S5eprVRseiFbSJCNNQ3hXCye36cc=;
        b=dmJXQBA5ltECIsG7fC5DbOOSwZusk4nj+SVD+GUwiaT/LzQuuPOgL9yg9VEShW4TZE
         I76HMCXjapQnDpqMJ8Zr178YkIrPmWvVfb3gFsbDDTvEVXodG7T4qaOh7fGJDTqu9lPn
         fcz1S3j1z3c2GH1SMHP0i6EVn1eRODmAgva8FpETMGOPExYrFKZwyoS7XcepVzLeW/JC
         2gmbby/UGaURwJII7x5OZKlGs0Qm025U5Fmxx67bP6SjU4OSMpqZHKvE+BZdsNuvrwai
         O/h7JfyHqKbJggpE2RJ47Q5b6VlzT4dwdT0yStPxyN23aqcLxuQc6i/L9SOwJIlnxxQc
         4CSg==
X-Forwarded-Encrypted: i=1; AHgh+RpgJLc39bOjUip6pNSqmlwz6gqDz41vr6wMOFu1rNcrBQsKmvfWPrQ1k8aFjdY23Rcqe6uR61sOZ5toYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIJzpoLuRVXoANhivKo0D5XnF3wPbUQXFe1LvzN4AzN/m7gOJy
	GaG8+KRU1yU41YVtIjfAqfOpyFCPFJZzC3QjiPClZUUByqhb3M8MbfIv
X-Gm-Gg: AR+sD11D3pKye+7Rfa6HG2et17wA2iBO6f0WXBeHjGD4ry+eUx3kt2/UTqfTsCCqCEZ
	IOQ4YLq92A9KShzrUD9q0Z4XMtZPjK4kOoul/RfasVDEtuR3Z7/1sb0z/N/ujTVwChJBeeRuMt3
	dg7lv9NmGfSmXTVZ8hO+G95HPO2xQl4975RPA8+zV9Pj1vCF6PcE4z2bv2vK7JMtaccvhKMk81f
	sJQEgKDAW1SbO2D/PYeOmJ9yvm9Bs4hyTded4difV4CNTjo3qrVFdV/jng+WvuWuF6vb53i44yj
	uM85e4Bo9srpsMIILp80RRcmCBLRnwdG4WwAomFfaWiOHfS0E6rTVCvsYnd+eO3YHew4bSVI1tD
	24Fcx1tH/7TzsK8pvi4c86f/eiSMpPPyF6bkqdEfZoPuMtEagWjgieeKivdrShL23kUSKVLHnfK
	q/alpOIBXx7llfVuDTNxmUzNgmZZkIMXxLptckDo8SsjxhgSRgKTGW5FU1OS9CYNswl+j3GTGPD
	0GX4ki1Qb7u0YM82We7E6N4XXM974qdtpVcvkyoesiTJ6S0Nr7dkK+1YYSwV6fSpqmwX69c425j
	zbDNzoLmvex/w1Y/In0=
X-Received: by 2002:a05:600c:3485:b0:493:b243:8ffc with SMTP id 5b1f17b1804b1-496c6586bbcmr69846215e9.35.1785330689440;
        Wed, 29 Jul 2026 06:11:29 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45c338fsm157280305e9.8.2026.07.29.06.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:11:28 -0700 (PDT)
Message-ID: <60df6af0-3bf0-4954-8181-a0acca7c21c4@gmail.com>
Date: Wed, 29 Jul 2026 14:11:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/14] dma-buf: introduce initial file I/O
 infrastructure
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
 <bc20381e8daf85ac58811c344325d8192cde9d1e.1785274111.git.asml.silence@gmail.com>
 <20260729065927.GA9534@lst.de>
 <340dd033-2a45-49e7-afd6-95dbbbf624da@gmail.com>
 <20260729112808.GA30851@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260729112808.GA30851@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 12:28, Christoph Hellwig wrote:
> On Wed, Jul 29, 2026 at 11:37:19AM +0100, Pavel Begunkov wrote:
>> On 7/29/26 07:59, Christoph Hellwig wrote:
>>> The method name feels a bit convoluted, but given all the
>>> previous discussions I don't care too strongly.  I'll leave
>>> the dma-buf side review to those who understand it.
>>
>> I assume you mean this:
> 
> Yes.
> 
>>
>> +	int (*init_dma_buf_io_ctx)(struct file *, struct dma_buf_io_ctx *);
>>
>> I agree, and all dma_buf_io_[ctx,map] look clunky, but I don't
>> see what I can drop out of the name. Suggestions? Maybe I at least
>> should make the fs op sth like "register_dma_buf".
> 
> I just remember scares from the last discussion :)
> 
> register_dma_buf sounds fine to be, but unless I misremember there
> were objections to that before.
I'm going to respin the set in a couple of days, just going to
leave it as is unless we find better options.

-- 
Pavel Begunkov

