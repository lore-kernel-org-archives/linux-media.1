Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7025228CF6F
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 09:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898382; cv=none; b=oflOESYz+erIE4fLrzJUUxWaFPVs1dL47oTGN/3YOty+i7+QHFJ30gEonWIGC6Xjk+bAlBTEv8hG7it1kDAxV9dYOH/AyefeqAHXhg9qbCYEc7V7Wr1P3sUSDuV9+BWQyWj3b0d3jDa9fdS2j6vHwC2ql0SqsMlN5o4B77AjWIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898382; c=relaxed/simple;
	bh=9a7xC+sXlochPyC5zgUbvWrHcRVdRCW4pBtcZHxIsFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/Y1f5kMwu/gdfz31y4B0CNfD2cbapGJW6PicH32azmVpJfmKzzLkst3JEiH2sc4qD2y3eQqyTp8HaSMcr4TW5B0mW9Ez0x7ng6EK9rzPo/VlmVM3/kNltT5OENVMXpc03CAwohFl8x9nBiaVuQ37P5b4w58eCwc2qXUKBpXiNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=KX/VdJNn; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="KX/VdJNn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lm2Lg0hziBPY14rNCyh+OlmQO8mTF2pGDV9lHYkkkSw=; b=KX/VdJNnQ0IWoRI8RlRbfGpInE
	7aC6wxDtZNSnwF/1iEyDH21N5CMR/+Lpco0mzVAxxyAOBBdE8iw37SEydgRNK3oKLduLsALL/wxZx
	oHTBJvg+O10p1V9TRuSBA7NMUPmwJgA6zkVbvp7DuZuidR1m8qMMXz+/OwfnhJIbMXZtEpVCn6iwy
	IrmQCM5E73J5lqw4jBUcoWkNXxMbDZ3S6CohGeds2sYw4UUvMcKWMNHEbpzMnN7myb0wvoiBDa+Sy
	x+MiRQi9NWST2pKnShCfvcG0fANhBmcsoDQ4nmX3p6RrPRLzLvrdZXuPc3Leuc65SFLlqK6AwEUms
	LuOUNcgA==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1werJM-007Udi-K1; Wed, 01 Jul 2026 11:32:52 +0200
Message-ID: <2c80b1d3-88f1-414d-a401-29ba56a6132b@igalia.com>
Date: Wed, 1 Jul 2026 10:32:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] dma-buf: remove dma_fence_is_signaled_locked()
To: christian.koenig@amd.com, phasta@kernel.org, simona@ffwll.ch,
 sumit.semwal@linaro.org, dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260624122917.2483-1-christian.koenig@amd.com>
 <20260624122917.2483-8-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260624122917.2483-8-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 24/06/2026 12:13, Christian König wrote:
> Finally remove one of the biggest trouble makers in the dma_fence
> handling.
> 
> The signaled callback is now consistently called without holding the
> dma_fence lock.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   include/linux/dma-fence.h | 36 ------------------------------------
>   1 file changed, 36 deletions(-)
> 
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 803e10ca76e3..ad69acbea218 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -493,40 +493,6 @@ dma_fence_test_signaled_flag(struct dma_fence *fence)
>   	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
>   }
>   
> -/**
> - * dma_fence_is_signaled_locked - Return an indication if the fence
> - *                                is signaled yet.
> - * @fence: the fence to check
> - *
> - * Returns true if the fence was already signaled, false if not. Since this
> - * function doesn't enable signaling, it is not guaranteed to ever return
> - * true if dma_fence_add_callback(), dma_fence_wait() or
> - * dma_fence_enable_sw_signaling() haven't been called before.
> - *
> - * This function requires &dma_fence.lock to be held.
> - *
> - * See also dma_fence_is_signaled().
> - */
> -static inline bool
> -dma_fence_is_signaled_locked(struct dma_fence *fence)
> -{
> -	const struct dma_fence_ops *ops;
> -
> -	if (dma_fence_test_signaled_flag(fence))
> -		return true;
> -
> -	rcu_read_lock();
> -	ops = rcu_dereference(fence->ops);
> -	if (ops && ops->signaled && ops->signaled(fence)) {
> -		rcu_read_unlock();
> -		dma_fence_signal_locked(fence);
> -		return true;
> -	}
> -	rcu_read_unlock();
> -
> -	return false;
> -}
> -
>   /**
>    * dma_fence_is_signaled - Return an indication if the fence is signaled yet.
>    * @fence: the fence to check
> @@ -540,8 +506,6 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>    * operation is complete, it makes it possible to prevent issues from
>    * wraparound between time of issue and time of use by checking the return
>    * value of this function before calling hardware-specific wait instructions.
> - *
> - * See also dma_fence_is_signaled_locked().
>    */
>   static inline bool
>   dma_fence_is_signaled(struct dma_fence *fence)

Assuming the rest of the series plays out to this point:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

