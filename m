Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486FD4A1DE6
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 14:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533741; cv=none; b=dDFmUUhxwPYE7JJniGsc8Nn8+SQRbI/QeGGKiyjKY8nbGGmTWdr8FhoH5aMuT/I8X91YpBB2uITB7uBWJFmM5Fib+dADKgn1RzTIn7douYnDjaq8FI2PWWe+P9rEZ76W9t6z6RZygRkMtCRo4JOxuXU2BT0YwgMtDa/0g8KcyU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533741; c=relaxed/simple;
	bh=f/vLRZtkEwUREGIURpCCb3dB3cPovTJngOtCjk6W9AY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MLAgN4uK8JeOj8LSStk8IYHvuOPpoMnLg3P0gx4NGOa/F+WsIy6eAjGchUFGp7zFqgfYcrHZ4pDnN2QEKpz6el2L9JkD0u1Uaz7jc7vwWpAUCl4p61xaVX7m63rjD4r3vUzmjNd8OqjYaXpwKYRJ0rTuchrfJ7WZu7JzkXr33lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T+zbNPUs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T+zbNPUs"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5469B24BD;
	Fri,  4 Sep 2026 16:54:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788533644;
	bh=f/vLRZtkEwUREGIURpCCb3dB3cPovTJngOtCjk6W9AY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T+zbNPUsGiZVk9VCtP6cOrMV/21pC2bWdZHanthpJSqvbt7q8thjSI4mAOWjxTHNV
	 keb2rlJwqd5NJ7BtoFoIlEIkYDwTPlYNNgwbJMGwT78+1gd+H+dycuocZWic7X8tXV
	 xkUWK2xDgQ/pugniNqOV8uYz9axmpj5w+Nb+1TLg=
Message-ID: <212497db-5578-4316-957a-c1a3f22ad45b@ideasonboard.com>
Date: Fri, 4 Sep 2026 15:55:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mali-c55: free IRQ when remove while
 runtime-active
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Linus Walleij <linusw@kernel.org>
Cc: Li Youhong <dayou5941@163.com>, mchehab@kernel.org,
 linux-media@vger.kernel.org, Li Youhong <liyouhong@kylinos.cn>
References: <20260903025526.2657105-1-dayou5941@163.com>
 <CAD++jLnVf8-o2XBWonLStH33+GfkFCbqORisM9JMZOhhbNxX6w@mail.gmail.com>
 <apqfTZnUOMcb6xw3@zed>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <apqfTZnUOMcb6xw3@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all

On 04/09/2026 11:40, Jacopo Mondi wrote:
> Hi Linus
> 
> On Fri, Sep 04, 2026 at 12:12:20PM +0200, Linus Walleij wrote:
>> On Thu, Sep 3, 2026 at 4:55 AM Li Youhong <dayou5941@163.com> wrote:
>>
>>> @@ -861,6 +861,8 @@ static void mali_c55_remove(struct platform_device *pdev)
>>>
>>>          mali_c55_media_frameworks_deinit(mali_c55);
>>>          if (!pm_runtime_suspended(&pdev->dev)) {
>>> +               if (irq_has_action(mali_c55->irqnum))
>>> +                       free_irq(mali_c55->irqnum, &pdev->dev);
>>>                  __mali_c55_power_off(mali_c55);
>>>                  pm_runtime_set_suspended(&pdev->dev);
>>
>> This whole runtime suspend/resume looks a bit odd to me.
>>
>> Normally you keep the IRQ requested perpetually in a driver,
>> this looks like some really odd workaround to explicitly deal with
>> wakeup capable/non-wakeup capable IRQs.
>>
>> I tried to see if this was addressed during review of the driver
>> and whether there was a reason for doing things like this.
>> But there are too many threads on lore.
> 
> Indeed it's weird.

It's my bad; and there's no specific reason for doing it that way to workaround anything, I was just 
mistaken in what best practice was. I think I got the impression that this was the proper way to do 
it from a misreading of the Interrupt Handling chapter in Linux Device Drivers. I don't think it was 
really discussed during review of this driver, but for the rzv2h-ivc driver it was picked up and we 
corrected it there.

Dan
> 
> I've a branch that I started that tried to fix that, but the issue I
> was hitting was due the fact the ISP starts with all ISP unmasked, and
> I get very bad races between the power-up routine and the IRQ.
> 
> I run out of time and gave up, but if you're interested I can provide
> you references to that work
> 
>>
>> I think the proper fix is to keep the IRQ requested during
>> suspend/resume and *not* mark it as wakeup-source; in the
>> device tree for the SoC.
>>
>> Support code is needed in the driver, something along the line
>> of this:
>>
>> suspend():
>>                  if (device_may_wakeup(dev))
>>                          enable_irq_wake(irq);
>>
>> resume():
>>                  if (device_may_wakeup(dev))
>>                          disable_irq_wake(irq);
>>
>> Do you want to make the patch or should I?
> 
> That's something I didn't consider maybe :)
> 
>>
>> Yours,
>> Linus Walleij

