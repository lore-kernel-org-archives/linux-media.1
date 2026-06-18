Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A11C3FBB6C;
	Thu, 18 Jun 2026 18:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781807458; cv=none; b=BpSv2cdFgO5j0CttBCyw6vnYZ5p77eq7UqRXTMPKAIK3p9V3eZF3wFAY/6oXv20WMFnQKPTPlxEKczBrBAWBG/odTc6BDygjSza1lZvIsIIlqEoc/pL3Hs4RUfs7E6/LTfAB9J7sRjCINiJkLA5rlv1rqP8yV6K/9mqyB1Sn0lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781807458; c=relaxed/simple;
	bh=440hs61604sFljYJvOITeE0GJJvnMbjOOCKHWld8y38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UN5YE6CdKQa6NkrlWI2FZEV01/wHj2a3WuzD+RgDaq803M941xW3F0kQgxGY6vz7xf/GugdlRe/tuxJ5/GhvHdHmuBQdvlLw3o2RDxmmWbeEnwUQ7uPD6lQkuGSzcfbeUjOE056ojuWRkgv6CaJQWofjB4hv8TzFe+hmjsdXNFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=d8gUgG2V; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="d8gUgG2V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uLhabi92uESEf5CbIvCLvsknhXB/GOnAq3LQWEaLDYo=; b=d8gUgG2V7AXxtEPsjukDFsErlu
	ut4scQRKTbLBrqCV4UHQyt8dFGInJ8sQ0DiGmEd7VR7p3OqQuT2ZVLD/1LSUQdfw7hPyr5LWZYX3n
	8c9i6hsOZC1BGfQU7NcVUAW/2/m5fwggli4+ABsmd+hsB/o9ClaXG9GC0qwWqo6oDpZEjHzuAWfC+
	tTOe1cMRIz1qL0EDf2RSQQzW9NXef3V26Qfd6MK698xsHBPcKB4jP2sTobJUt+GvLAd+XfY3BxQta
	8NsM6/OrXw3TC8sgBTDpvQJZGGZQp1Pq+dPCjnivljRWXdNRxdXfynF0PONB9uVpcFq/Dt/kTZqgJ
	WN8vciRA==;
Received: from [37.209.163.134] (helo=[172.16.30.123])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1waHVb-00230t-8X; Thu, 18 Jun 2026 20:30:35 +0200
Message-ID: <27f54324-94ac-4bbc-ba58-642a314197d7@igalia.com>
Date: Thu, 18 Jun 2026 20:30:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: use correct callback in
 dma_fence_timeline_name()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>,
 kernel-team@android.com
References: <20260618-linux-drm_crtc_fix-v1-1-801f29c9853d@linaro.org>
 <099959fa-3a41-4166-8c10-4e5c2b9fdf19@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@igalia.com>
In-Reply-To: <099959fa-3a41-4166-8c10-4e5c2b9fdf19@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18/06/2026 14:46, Christian König wrote:
> On 6/18/26 14:00, André Draszik wrote:
>> dma_fence_timeline_name() is a wrapper around
>> dma_fence_ops::get_timeline_name(). Since the blamed commit below, it
>> calls an incorrect callback.
>>
>> Update it to restore functionality by calling the intended callback.
>>
>> Fixes: 62918542b7bf ("dma-fence: Fix sparse warnings due __rcu annotations")
>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> I'm like 99% sure we had that already fixed weeks ago, but somehow it looks like that was never merged to drm-misc-fixes.
>
> Anyway Reviewed-by: Christian König <christian.koenig@amd.com>

I was also perplexed and took me some digging to realise what had happened.

The copy-and-paste bug was indeed originally fixed in:

commit 033559473dd3b55558b535aa37b8848c207b5cbb
Author:     Akash Goel <akash.goel@arm.com>
AuthorDate: Tue Oct 21 17:09:51 2025 +0100
Commit:     Tvrtko Ursulin <tursulin@ursulin.net>
CommitDate: Fri Oct 24 16:56:37 2025 +0100

     dma-fence: Fix safe access wrapper to call timeline name method


But waaay before that I sent a fix for something else which touched 
those lines not noticing the copy-and-paste, fixing a different issue. 
That one however was not merged until earlier this year:

commit 62918542b7bf08860a60ebbde7654486e0ac0776
Author:     Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
AuthorDate: Mon Jun 16 16:59:52 2025 +0100
Commit:     Christian König <christian.koenig@amd.com>
CommitDate: Mon Feb 9 14:05:20 2026 +0100

     dma-fence: Fix sparse warnings due __rcu annotations

Notice the authored vs commited dates.

I guess it was a silent conflict which overwrote the earlier fix and 
restore the copy-and-paste bug.

Regards,

Tvrtko

>
>> ---
>>   drivers/dma-buf/dma-fence.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index b3bfa6943a8e..5292d714419b 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -1202,7 +1202,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>>          /* RCU protection is required for safe access to returned string */
>>          ops = rcu_dereference(fence->ops);
>>          if (!dma_fence_test_signaled_flag(fence))
>> -               return (const char __rcu *)ops->get_driver_name(fence);
>> +               return (const char __rcu *)ops->get_timeline_name(fence);
>>          else
>>                  return (const char __rcu *)"signaled-timeline";
>>   }
>>
>> ---
>> base-commit: e2cae00c05d196491c318196792297f2dfbaa02c
>> change-id: 20260618-linux-drm_crtc_fix-267655a1c89f
>>
>> Best regards,
>> --
>> André Draszik <andre.draszik@linaro.org>
>>

