Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4D0367291
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782223232; cv=none; b=eP6GxyCj2yhyt6kZT/XXsB3A6ZbHpjjLClAiBc0d9KY5FmvzqkMWxmfx1v/IUt7OaEm0vFMlJ97fmEB1alBGktaJaPmfCPi1KOtaT6enbpOzycg4wvjknDRuQHBQj6aJ/jyRaIbouhCyAdtv61RNc4gvc9PFrhc7xkdz51O3lVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782223232; c=relaxed/simple;
	bh=Ay/mB47Hn9ZW/6TSLb5knqiEUspAYhF6FxM8TEZi4m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=svasE6ooUeM8RM54R5RLStk+uvFYt5smuppVzEYLNPbOd9pYMydL5ubZl254BRu/6pYxeXyaCnAUugFgmaxHDfJVKrWVU326fDfewxqE55gkJcdrIi+wt+fBGZSbV+zexrDE2w/l4j9fhlh2XWLyIpOsySacXndDPwwvAAzYGnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=fneF5NrL; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="fneF5NrL"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso7637876a12.2
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 07:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1782223229; x=1782828029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pW2T0l7vNC7YUbJOOE1maSFRjhJC2eie7o0FsVV1LoQ=;
        b=fneF5NrLnPAog92MNijC0DH0DcsPS+dLTXl62ePj3ngYz6NmOnkhtS2qQ0IK9z+dVT
         KQainB5xFEmiyfKAVyLX6gfR4wRc8wxm9dkwuhUIOxHT15XxpoxQYMxppYTi+GctTQ9k
         mn1Nw5bd/eoiXWm8bukh7+Z3zXxXKrLtYmy/9uqDG3n3NNFqTfPu+BomUa45V+90FRLA
         T2Db7/xcEqQOPPE01Ft5IpRpxw5gB/qTIe6qn6zyCk4nUPjR6MMwCDPXUfe1VEIrAWt6
         WdfF2pOd9R+5vkZDAFial4ySD46chpJ6PcBspO0zRiBw5FsoxamQ3+MIEL6moGFwbuOT
         SQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782223229; x=1782828029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pW2T0l7vNC7YUbJOOE1maSFRjhJC2eie7o0FsVV1LoQ=;
        b=RDscbxbekO0pilcpekGjbYnAfMwSsCwq9cwjvtSgKpxYaNb1hpI0+tugN7F1LpuNdK
         lImy1sXWCIv8cugElpiMdI7AnLItb81trWbzBzWXZqa+hCpeNkWovSh6zhJdF9bly4Ur
         PHmIT595RYjR3SG6t6cgQEOxwZq+4dypg3rSizkirL1Taryx3Ydf4hPfCwXyAVWCSTV2
         Sh6AZ0LML7MhBBQACfqJNVrDyOQya3THLlccZ4XPGyDBH0N3mCCDji+hsaj+Qmag4dq3
         Kznz/YSiuuhY3C43+kXLhzNs6+f43mq8pfRWOO7GXCmn1wtZRFgYf2LuSQp4WV+ujOMD
         4Xlg==
X-Gm-Message-State: AOJu0YzYPKvqnduG/joUNS/0HxpxZPkEJevJi4v4biDMUuJ066KU5WYU
	cZTZWKPHmMuypZLmKP692lR8ZG5tB7xaWyHc/ru+bOcOVQJW4DpaC7yBwRBmU+cOiww3jDKR5XP
	1uo3c0v4=
X-Gm-Gg: AfdE7cmA5TjBqp+bRESQUhT9IkIoBA6PgJXiQuC2qwht7Nbw9h2jAQp0LGBWpxJm+Kt
	KOf4OFfqTSIWDBGuVC8DjJF3B1mlOyWiYA9kCLCyScZptsBKfyl463bSF85w3H69QqPcMvBFRG2
	aKL+ss1fovJWW63bR8Av3O2B/muCXQ8jkaCPoEg0D769gBhIr9b8XnPguHhV1DR08VKYjzU5h+Z
	uLsKFuvLP4OhK9CIwAhreZlE6B+mghmtagOErqx2wNi7eCINbWALvjtlO3BcEv8qZPntHHwdbFS
	F7TYLtOU08vMCgIsAYmND25BM/NAlqnSb9hlCwAb+RLXxEmwJ8SfRphmDCQ7Ts6SBZJBJPXYdFK
	Wu3COIWUNqPC8ibmsufxQ+jOHDhZQ9TwKJyHyQja2+FM3ZYozryADv4yRHSLaEEohtXNaCi4bUl
	kBrm1iDFVMomhCWX/K6KGEbh1ZNLkr0nDj0A==
X-Received: by 2002:a05:6402:3218:b0:697:b10a:35ce with SMTP id 4fb4d7f45d1cf-697dba620e2mr1527552a12.1.1782223229172;
        Tue, 23 Jun 2026 07:00:29 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697d3c7dc3fsm1544454a12.13.2026.06.23.07.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 07:00:28 -0700 (PDT)
Message-ID: <5a0d7111-c765-43c7-9bf1-6eb055b6784c@ursulin.net>
Date: Tue, 23 Jun 2026 15:00:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf/dma-fence: Set better string for
 dma_fence_driver_name()
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igallia.net>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20260623133457.1029880-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260623133457.1029880-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 23/06/2026 14:34, Philipp Stanner wrote:
> dma_fence_driver_name() reports that a driver whose fence is already
> signaled is a "detached-driver". This is incorrect, the driver might
> still be loaded and running.
> 
> Rename that string to something more descriptive.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Just compile-tested.
> ---
>   drivers/dma-buf/dma-fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index c7ea1e75d38a..9c3dfa7b0066 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -1173,7 +1173,7 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>   	if (!dma_fence_test_signaled_flag(fence))
>   		return (const char __rcu *)ops->get_driver_name(fence);
>   	else
> -		return (const char __rcu *)"detached-driver";
> +		return (const char __rcu *)"driver-whose-fence-is-signaled";

My logic was "driver detached from the fence". :)

Anyway, no strong opinion apart to be mindful on whether some output 
becomes overly verbose.

Regards,

Tvrtko

>   }
>   EXPORT_SYMBOL(dma_fence_driver_name);
>   

