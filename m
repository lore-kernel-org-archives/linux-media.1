Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EE13655E0
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 16:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996209; cv=none; b=LeBuWg3jm2sfmpjW8yQT3NMb/q7mHcz1cg1/VHwh7NW1o8yoR3b3g5jn7x73sICXhGe7KJz6IDUo2rherHaABAFlvGWlgl0zCw1UViC89gT9WX1kGYQczqXnt87OrrcYU6GSQVKyXGoHK1mvyrlXm1ta2RLbVESow6RvBpMQ9Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996209; c=relaxed/simple;
	bh=inWFXH/4gvwDDJShSxb1UbDeXwomoSCtPfVrGbG9V30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ScijUS4pPvoiPIlzianb2mq31+7Cr7l5p/QouAqbYQnDhbnVV8VrS6DvBsZNaciDRrmWbkB3sLve8815I4i7SjOByWmIxPw5GgLa1lpluccpC4eVkxc3yAEwIVy4azMP8yda+FLoTL2a2b2I5QfjwjfjC/gyg+OV5mv30wb8m2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1NM3HAv; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1NM3HAv"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso33440095e9.0
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 09:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996207; x=1792601007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MprqRVTku8rnnoqrNidogE79Hh/sbjcVtJHMk6QO0CA=;
        b=E1NM3HAvhNi9WchZCxi00OWvzNXWTS2u9u46iCZ3ECQeHnpGaWCZkd2cly+63fqf9N
         vCRSfhbNX4pSk9hS9CdsqxtJ9Ct3kD9jrt77wBkSBXF+cbMZ9YyJCbxsApFjfxGwVHkQ
         9mI97SUREXrgYZjUWhNcorUK/AhUkfbW+kAiYYRCscCCfVyE99IvI5Lvc+isggf0hntX
         ILRq77IJjxILg2lW57G4jEGwEYrprjfZgboCuATbf849dHnvs/BT/5NTChKw9SrVwSYC
         ojaj/o0+U59n8OjEQVffo6tw80KC9ygURz8nKf7xjhnzzmTKJzZNJFGetkIgcLFaC/NG
         GqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996207; x=1792601007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MprqRVTku8rnnoqrNidogE79Hh/sbjcVtJHMk6QO0CA=;
        b=XdP6TjSJVto6jR57Lx/nmkUQFeU9Z9tjl7eoQP2zseQbLqGfUcpcH/L7N7lIC4moVx
         aGV2HxH7WjhBQZYcuvyjc/yC5+X1GeXjzN13e27XzesWMgEc5QjlpphyA69Qux4kuHtP
         16YoCQut+UWldIF7DM2k4/5PUQNPZHdM8nV9/nkMQgJowzLrO/bbw1KNaxZE4bQY7e9C
         4Gi61MUXD+hdBrD6VN2/0/4Q2rVpiQ6IIve8Hm9D0Kmb5ZJJlW34pdtaQ4yC6nYdHZNx
         am5ThQu9R+nLf0I/EmBKI6Nc8eyjvEb1rObEu67S9L6f4QofIbO0EjpvJjZ9h/CKdqo7
         JD9w==
X-Forwarded-Encrypted: i=1; AKwUvBxoVyONO8563gdPCGClJcxz64VYrWR4k7/i1yiSSPTIChZLWn0+DUl74LW7HxTqNoP7BJfjlHJW2+xmDw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIbSyFdE22KftTjHjDJF8pp57CCDUh9ByGJnNQr//Dzn4Z3mecG
	fm070mz6fJ3ZSruRx2B+H5GBGbL0cMeV3alwx3Rc4GunKdpfDipMaDeV
X-Gm-Gg: AYBFou1UoRUyODkvwT2H3w9IslBk3EwePQkRVpqobxeUx/cbCug5Glad+Ggk+gLfpnf
	ou1BOU8ZLqcY58CmkGZri9sLAGsqlNt0puDsokdjigTJJPfqsrS/7NLUU0hRNThUVQhan3tofa/
	EggMB0TxDO0BbNLWTAvl4cNVWin+tscRs6cMBDEB2FWgSAnyLDEd6LFMHq2d+CpFwDtHo1gZMTb
	TrD+7pGhFgGIP3IeA3Fsd2KYQAunbOd/9KAlibR7GuUAWyxRItBT0wl5UTTonos6ICcKYPeSuHZ
	dSwd0QDr9fCtDpLSKK5LA+y/JNczzlv7Pwo2VErAj+PcxQhqfjNiU9VCMRh4piVub3p1XbiidY7
	x3DLsZxY+BJd+PZ2YGufUAV+IlQGmLrtRdsVLrEPQtdmdxzpETWWgRzjKxsz+Ubv8mnZgj3mM6T
	1IL+XhUGhQLYxbA+PRLQfeSPPC5lspiDUmPceHGHZqSidS7VOGCjrkzlfIy0KlkoPU4aqvx7+/U
	2ENqnibHGZKgzs38olBE0RY+5xiKKVIP/xGQ+MDjVnZy6iS2aqhELfX2a6qvSqfVKvom7CxqXuL
	Lm8j9+KoQ8/HzymBkrJ0GkxHQyq+xeEHZdGDf2LKcsi9KTm/
X-Received: by 2002:a05:600c:83cf:b0:4a1:ac66:604b with SMTP id 5b1f17b1804b1-4a1ac666a65mr120408565e9.1.1791996206748;
        Wed, 14 Oct 2026 09:43:26 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd640be0sm4751135e9.1.2026.10.14.09.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:43:24 -0700 (PDT)
Message-ID: <7d3c3cc3-5c7b-4d28-82d8-2cdb5e010c29@gmail.com>
Date: Wed, 14 Oct 2026 17:43:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 04/13] block: introduce dma map backed bio type
To: Christoph Hellwig <hch@lst.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1791975048.git.asml.silence@gmail.com>
 <39b964cf7510f42755188563da63d3d5acaf2aa9.1791975048.git.asml.silence@gmail.com>
 <20261014131554.GA16467@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261014131554.GA16467@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 14:15, Christoph Hellwig wrote:
> On Wed, Oct 14, 2026 at 12:02:02PM +0100, Pavel Begunkov wrote:
...>>   	case REQ_OP_DISCARD:
>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>> index e929f94b25c7..1b7f8cbbda8b 100644
>> --- a/block/blk-mq.c
>> +++ b/block/blk-mq.c
>> @@ -3150,6 +3150,12 @@ void blk_mq_submit_bio(struct bio *bio)
>>   		goto queue_exit;
>>   	}
>>   
>> +	if (unlikely(op_is_dmabuf(bio->bi_opf) &&
>> +		bdev_has_integrity_csum(bio->bi_bdev))) {
>> +		bio_endio_status(bio, BLK_STS_NOTSUPP);
> 
> Wrong indentation, conditions are never indented the same level as
> the following code block, even with the weirdest preferences.
> 
> /me note the patch from Anuj on the list actually got this right..

I had to split Anuj's patch in two, should've butchered it
while hand applying. I'll follow up on that unless Jens
already applied the change.

> Otherwise looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

-- 
Pavel Begunkov

