Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA29447ECF3
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791200601; cv=none; b=pRVoQz68m8Ydfl+wzz+E75ZCjdTPgQpe3YO4v267oxibUg1/uzUsBvQcGmjWiAw89M0xBES9qwHUbLimK+jnPibl+MDb4WFMZ5VgOlLrXJe93kN2fwLLjbhqO60K3FW/RASMgNuoTswGoo79fg5Bautvwodalu9uHN1WJSh8ePY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791200601; c=relaxed/simple;
	bh=GDkG/OW+aHwhFfekfJ1LFx1PPwGsHQVlhAiMqfGU5IE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P1h+fzTIS3efl5uRFOTRU69LlEnK9alWVRD3bOtKgC5Bo4mkCAiSK4g1hzx2jnnBRd9ovWN9PNcNVMsGuolw4qYoEcFxzdxXjYXgqAAL7bh5ITgL705Q/qwNIWfex72zyxSCTMe10AD5U5WMkjQZmmCNgDQ0CDCtIc3/6rDK1n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvIJ1x4s; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvIJ1x4s"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488811c9ebaso838957f8f.2
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 04:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791200598; x=1791805398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25uBlo4GDqcGkj4VAPKdolkwb50w3Is4u8TLMjz2GGs=;
        b=BvIJ1x4s6MUzWWR9XYmDbGyghJnknXMQvG8Nno4rdsD7Cb6nEIbjkk5Hg8WCqMOpbP
         hE3M6K/r6KpjTo/jqvUir1UuTOeawd4UKnnrPcmmc5eDgp+7APCvvMv4CdBS9XnxYwm6
         zDtlV4515obtGUL+0Dbr17KuUdQmfLVwnUm3XaDDCG2bSTbzVPtfuQ2Tcf/NAYiecz8f
         zkv3q42Ua+gBUrQcZgFzj8lmDFKwglIkBBY6yOm3DPxUq5GOegS56io+rlV7Ok0i3NeH
         9o8uj1d4Ui2TxddURIsf6l6bvzO12YI06MBBjne4UC4AA0NrC2RGtBkhcqC/wnI3Cqus
         S4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791200598; x=1791805398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25uBlo4GDqcGkj4VAPKdolkwb50w3Is4u8TLMjz2GGs=;
        b=r74vgp4Tl2kQ/Ug3uMRLCv6PqsefpwbE4RHra77zUtA+zIq+z373xy+kwsd9xBhBB3
         B0KTrVfbuqleTOXGRyAmmea/6sqDVFk+rWx3bh/XN4CkzWjwJcWu3RVkXeDlJq1RsiJt
         mZ1NVEEDgPXIW5CzyEjWfDk7kwa5+5xB0j6t9zSDqe7hSOWlU2UcOx4T21uEVyaZdEqk
         l5rO3rM/9I+tVZfjJKkcrdyFPW5Fi1637PF8A2tlcZKgx0nz5hw9DwsUYo/liq49yJD3
         aHaA2tYglDjjpt79CZhg0XrlL8m4z7k4aixJnIPPxPHcqgFpDSml1PJwPr0g+dmmkwfs
         1D3w==
X-Forwarded-Encrypted: i=1; AKwUvBzmcha0ciYDcc8Kfc3G7HJZMFcIx1PtaC9oyptqgPVVeHuP9muGoqnCzYyLZxOMWb46yoc5wWd43lZuZw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJs9bDb2L4ioVJ0q+RRpoLobPetmy5GELc+dsHmfp8LEnIVBpk3
	HQgkj+PjGqW9fomhcvBf8hXT6NP1Ebe5Iq+io4hmyicKyATqI48cuIYY
X-Gm-Gg: AYBFou1l83+02cpbT+h5/QHAPIIQISfDFLvaIYepsaAhRsAJiLSGSscMq5bKH7N7+eL
	uomZYNDUzZ+D0D1+XfPqcAIldWlY5iVr9FEeQpmwf0EGqIGaq1Ajl+O6zz+DhvYbVm2jXvfVC8J
	yvwBDiPod/2nZK+369ach6j4nmzoRHIv2T86MMZBtdcB0ViSPin2VBc3g9rM6lfdmxpvPgY5ff0
	7nLT1IvnSbPQ/if7Cb4ncZ8QlMbvRXz0R6klQqo8jCyjFm2BMGWkFeb/Rip5CqIMvhLdrcyo7oa
	j5zVnPl/wV9UiMTb5cAX6SrEfFE0eFiJbF2rsa8BfKKcbw6NjI5/lzoFRT1ehNjxKQdPKIbTUNG
	mulJ/RMe+t7A/9tMD2T3811CUpE9PmYiYH1yz8/+ETHqDIX1YLvj4VNLaCvt+SKA8UeYgbm8A6M
	qU80eh3rNpniFJvsaKZJSUr0p3bWJZHxXPJ6gj0KJ1GfsQySYGDbs+m0AhZQ7GcTIxwCUaVBE5c
	5o8kYm0Sl4VK2uByPBXBUvUJfNE7bPzCN7buDdUI88hzjuRiTBE4Apff+OwPq/PJ+0YocD5wus=
X-Received: by 2002:a05:6000:40de:b0:48b:d2d:2fcc with SMTP id ffacd0b85a97d-48b1272d0c6mr17543670f8f.9.1791200597696;
        Mon, 05 Oct 2026 04:43:17 -0700 (PDT)
Received: from [10.41.30.1] ([161.12.45.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622704a5sm6943895f8f.15.2026.10.05.04.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 04:43:17 -0700 (PDT)
Message-ID: <be0012e5-872f-42f3-bace-5066a09cd9e6@gmail.com>
Date: Mon, 5 Oct 2026 12:43:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/13] block: add dma-buf support for raw bdev
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
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1790602223.git.asml.silence@gmail.com>
 <a6b81e65b1f09b6ed1f71f294e5a94896ea1ead7.1790602223.git.asml.silence@gmail.com>
 <20261005091111.GB10727@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261005091111.GB10727@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 10:11, Christoph Hellwig wrote:
> On Mon, Sep 28, 2026 at 02:32:21PM +0100, Pavel Begunkov wrote:
>> Add a simple proxy implementation of init_dma_buf_io_ctx() forwarding
>> the call to a new struct block_device_operations operation. Also reject
>> dma-buf backed iterators for buffered IO.
>>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> [pavel: reject dma-buf without O_DIRECT]
>> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
> 
> The Sashiko report about the errno on fallback here looks real,
> and is probably easily fixed by setting a proper errno.

I'm going to move the check into blkdev_buffered_write(),
this should cover both paths. direct_write_fallback() will
see -EOPNOTSUPP and fail appropriately.

-- 
Pavel Begunkov

