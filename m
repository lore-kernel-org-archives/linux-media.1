Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD733C1D41;
	Tue, 18 Aug 2026 09:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044159; cv=none; b=uoYULxTzmdzqEIdwy1ls9ljxZSzAghNuSG6GYZ1J7kleJfR54mLEby2oT6RNgRVoBwUUziZrBBeQbiqjBq+AZp/H4sO5+4Dy4grefCXJo2ssNG/iNwCLBMKQA+eR9Moxb4S1wQqhEuSkF+jntLHZAfkC9w7UNDtWISaKHsFWnyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044159; c=relaxed/simple;
	bh=TcVoMCfqowydII8/L2F81uJLsfAvyJfj3O3dAlIEy1U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G7GqUzxhoaAe7mCRgKifGpA1i20TyN/VueX9lnyBkT6DWUH3HvfxY4+lRaf9MVRIBB+orttH48UsM+OajvIWb03lizheig1qePSvROuvOiVevqVDvd7ptkRJUE6XddrNbnBHACmx6a7WKI/gAdSkGJydbcPee/IXiRPQyOUnVHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDwCqLtz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDwCqLtz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81BF1F000E9;
	Tue, 18 Aug 2026 09:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787044157;
	bh=a5PlctKUQhvKPHPR+/BH5eu212FMH1J7B0aR+vXeud8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=KDwCqLtzlUSLZQVWWupx9lzQTpAamx72ITHbN6Ih4lPm/rWwoT/bEAHXMndmz6c4+
	 76qNuNc3njCblYSOIig9zpMdf5jCzb1/AcC96ECQ4/1p5uRaHpLpo/kpISMPwMMuzC
	 epJp+M59Ma/Km+nB7ctTMbJ7F+oIUPUDfexXIpPAfg2s4lruEwxNm/1snjN2e6gPdX
	 3sPvkAvM/244jYzg0PXT9xQqJvgF6xYkpNW/qG0pc73ZXULiQjiC2hh0c8KFUdMqOx
	 6vK6nxpLr75ETPtAB8al5aA9kLXMmmSLdw3MhkeJ+A+wO/xp1ciXpqFXB4uqsdnmMr
	 bzspnSKNYLNUQ==
Message-ID: <e98dc1dc-fdf6-405a-b92f-fa4570df90d6@kernel.org>
Date: Tue, 18 Aug 2026 11:09:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 05/17] media: v4l2-mem2mem: support running multiple jobs
 in parallel
To: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>,
 Michael Tretter <m.tretter@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
 <20260606-spu-rga3multicore-v1-5-3ec2b15675f7@pengutronix.de>
 <aae16dbfb26c8ee7e54247ca4d123b15748d623f.camel@ndufresne.ca>
 <e89fd487-ea3f-42fd-8647-6fa74ac991e8@pengutronix.de>
Content-Language: en-US, nl
In-Reply-To: <e89fd487-ea3f-42fd-8647-6fa74ac991e8@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sven,

On 15/07/2026 11:44, Sven Püschel wrote:
> Hi,
> 
> On 7/10/26 11:18 PM, Nicolas Dufresne wrote:
>> Hi,
>>
>> Le samedi 06 juin 2026 à 00:06 +0200, Sven Püschel a écrit :
>>> Add support for running multiple jobs in parallel for SoCs containing
>>> multiple identical devices. An example is the Rockchip RK3588 SoC,
>>> which contains two identical RGA3 devices. Therefore it is desirable to
>>> have the kernel schedule the work across all available devices and only
>>> expose one video device to the userspace.
>>>
>>> Previously the curr_ctx member of a v4l2_m2m_dev was used to track the
>>> currently running context. But the currently running context will always
>>> be at the top of the job_queue. As the TRANS_RUNNING flag can be used to
>>> check if the queue head is already running, the curr_ctx member can be
>>> completely dropped
>>>
>>> To avoid queueing too many parallel jobs, the
>>> v4l2_m2m_set_max_parallel_jobs method is added. It allows a driver
>>> to set the number of parallel jobs and avoids calling device_run when
>>> the given number of jobs is already running. This is set to 1 by default
>>> to prevent parallel job runs. Drivers with the need and support for
>>> scheduling jobs can adjust this value accordingly.
>>>
>>> Note that this change doesn't allow a context to be used multiple times
>>> in parallel. So a single stream won't be able to utilize multiple devices
>>> at once, but N streams can utilize up to N devices. This is caused by the
>>> fact that a context is not added multiple times to the job_list and also
>>> holds the job_flags to distinguish if it's currently running.
>> I do prefer this over Detlev proposal, so let's move toward this. Would be it
>> cleaner though to first remove curr_ctx and then add
>> max_parallel_jobs ?
> 
> Nice idea. I could move the max_parallel_jobs variable and the new 
> function to a new small commit.

Yes, please split it up in two patches.

> I could also move the whole looping and counting of running jobs over 
> the jobs to the new commit. But this would cause replacing the curr_ctx 
> variable with a `list_first_entry(...)->job_flags & TRANS_RUNNING` and 
> drop it in the commit afterwards to replace it with loops.

That's fine. For core framework code it is good to see in the second patch
what is actually involved in adding parallel support.

> While the commits would look a bit nicer in the latter example (as the 
> removal of curr_ctx wouldn't also prepare for parallel jobs), I think 
> the addition and direct removal style is frowned upon and therefore I 
> tend towards the first option. On the other side I'm unsure if a 10 line 
> patch to just add max_parallel_jobs variable and function with 
> everything done in a (removal) patch provides benefit or harms to get to 
> the related changes.
> 
>>> @@ -252,13 +266,11 @@ EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
>>>   static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
>>>   {
>>>   	unsigned long flags;
>>> +	struct v4l2_m2m_ctx *ctx;
>>> +	struct v4l2_m2m_ctx *chosen_ctx = NULL;
>>> +	u32 running_jobs = 0;
>>>   
>>>   	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
>>> -	if (NULL != m2m_dev->curr_ctx) {
>>> -		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>>> -		dprintk("Another instance is running, won't run now\n");
>>> -		return;
>>> -	}
>>>   
>>>   	if (list_empty(&m2m_dev->job_queue)) {
>>>   		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>>> @@ -272,13 +284,30 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev
>>> *m2m_dev)
>>>   		return;
>>>   	}
>>>   
>>> -	m2m_dev->curr_ctx = list_first_entry(&m2m_dev->job_queue,
>>> -				   struct v4l2_m2m_ctx, queue);
>>> -	m2m_dev->curr_ctx->job_flags |= TRANS_RUNNING;
>>> +	list_for_each_entry(ctx, &m2m_dev->job_queue, queue) {
>>> +		if (!(ctx->job_flags & TRANS_RUNNING)) {
>>> +			chosen_ctx = ctx;
>>> +			break;
>>> +		}
>>> +
>>> +		running_jobs++;
>>> +	}
>>> +	if (running_jobs >= m2m_dev->max_parallel_jobs) {
>>> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>>> +		dprintk("Maximum number of parallel jobs reached\n");
>>> +		return;
>>> +	}
>>> +	if (!chosen_ctx) {
>>> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>>> +		dprintk("All jobs already running\n");
>>> +		return;
>>> +	}
>>> +
>>> +	chosen_ctx->job_flags |= TRANS_RUNNING;
>>>   	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> 
> This is the most prominent example on how to split it up. E.g. either 
> keep everything in the curr_ctx removal commit (and just use 1 for 
> max_parallel_jobs) or use list_first_head to check if we have a curr_ctx 
> and drop it afterwards for the counting logic.

The second option is best. The first patch just drops curr_ctx, the
second patch adds max_parallel_jobs and related changes.

It's easier to review as well: the first patch must make no functional
changes. Instead those go all into the second patch.

Regards,

	Hans
> 
> 
> Sincerely
>      Sven
> 
> 

