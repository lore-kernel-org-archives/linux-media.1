Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B031FA859
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152652; cv=none; b=UfmJvebJtPE7OiRw7s49ZuzwCKsyO4FO0+GPZDOiGSeikow9oRzQ8vTOD1mV/mZgrQYtMMObw0v3MiK94dSuluTCYWOZKt0yXsqD+vAAHOG9e5SpkNOKJeSNKOjf10Auu1xkbgKFK8dsIPxMHrK9c0N0Jk6u9IQbK+DfyNrbTLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152652; c=relaxed/simple;
	bh=m99GuxVXE9umlJK+/T48syp0wAdn/eLbtTWT1uH/Pxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PkrpOX7Im4DhMiQl5Kt0VuzXfxdjsBAdy/Gpne+lnzPzAASHj9LQzV4jXsPbncN6dkBe//mIHUpgSM1hHlFGVoYRXaeLG+BCfdCFm//KXItTqtYQk3hSKJeh7IYGVPjhhtvfVxTlbkAZ/UVEVmPVnapIbNevxa1GjEGVf4kJGIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from [192.168.2.104] (91.78.35.251) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 19 Aug
 2026 18:17:22 +0300
Message-ID: <70b2ba72-649d-4ef0-b5f1-367eb47f6f12@auroraos.dev>
Date: Wed, 19 Aug 2026 18:17:22 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rc: rc-ir-raw: drop useless decrements in
 ir_raw_gen_{manchester,pl}()
To: Sean Young <sean@mess.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>
References: <20260818203832.46030-1-s.shtylyov@auroraos.dev>
 <aoVbzp0cn1euNa_h@extorris.mess.org>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <aoVbzp0cn1euNa_h@extorris.mess.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

On 8/19/26 10:31 AM, Sean Young wrote:
[...]

>> In ir_raw_gen_{manchester,pl}(), the paremeter max is usually decremented
>> while checking it for 0 but sometimes that action seems fruitless as max
>> isn't used afterwards -- drop the useless decrement operators...
>>
>> Found by Linux Verification Center (linuxtesting.org) with the Svace static
>> analysis tool.
>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
>> ---
>> The patch is against the next branch of the linuxtv.org/media.git repo...
>>
>>  drivers/media/rc/rc-ir-raw.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/rc/rc-ir-raw.c b/drivers/media/rc/rc-ir-raw.c
>> index ba24c2f22d39..ed494be8896f 100644
>> --- a/drivers/media/rc/rc-ir-raw.c
>> +++ b/drivers/media/rc/rc-ir-raw.c
>> @@ -362,7 +362,7 @@ int ir_raw_gen_manchester(struct ir_raw_event **ev, unsigned int max,
>>       if (timings->trailer_space) {
>>               if (!(*ev)->pulse)
>>                       (*ev)->duration += timings->trailer_space;
>> -             else if (!max--)
>> +             else if (!max)
>>                       goto nobufs;
>>               else
>>                       init_ir_raw_event_duration(++(*ev), 0,
>> @@ -491,7 +491,7 @@ int ir_raw_gen_pl(struct ir_raw_event **ev, unsigned int max,
>>               }
>>       }
>>
>> -     if (!max--)
>> +     if (!max)
> 
> This patch is technically correct, but won't make any difference to
> generated code. The decremented value of max will have zero users in the

   After looking at the .lst file (that wasn't easy), you're correct...

> SSA tree, and will be droppped.

    Had to google SSA tree... :-)

> Changing this is purely cosmetic change to the code.

   Makes the code a bit clearer, no? 
> Sean
[...]

MBR, Sergey

