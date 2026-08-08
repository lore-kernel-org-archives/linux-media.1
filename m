Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB1240FD86;
	Sat,  8 Aug 2026 12:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786192969; cv=none; b=c9wTgK35Uy20hoxuscjKOhhr/4/0xVNZXzQLXVfLwmo0LjNF55KGaWP5oLG1kfDMpSOSfiuX13H2NwfuxO74oxzkw7dKX5Kq5Xq20t+hBWOlhxRdE0jbE8V62X+jLTLXbN5nMBrkrNdYMArLKjvPl6mmmWVk+0bFs/RLH7caigU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786192969; c=relaxed/simple;
	bh=mUoCsQbdGafhK4yw2jR4QnJOvGmcxW/iciqw7nDsy4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q3nToAFvyTxSPkNmp16SnRKPvUI5oWuTwhKahCmqjxAor0rA/eS/jhCjw3FGesX1ckbqzU5O79O9YriAsbzduk9UwXFrFjowmQg40zeJKcdZ0JiRhPLfdsKAOj2P/RpvZlQum1mHdTbXa9otVwILk0kZmoItsCUyJJ3ltTJ4QhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=p8HnxdkJ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=YogH5M5s; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="p8HnxdkJ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="YogH5M5s"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1786192936; bh=TjAyu7WMvcZuDZqJUV1+hYw
	J+wJ5yyIqrRwvxBioKoY=; b=p8HnxdkJZuyhBMDuOM4SHLcKMWv7MMm9U9+onZ5spIGd/5+Dzh
	rj6bF6NJ7pVtVMPCWuhkgIi00Nfb2Wu/fDtHERkQK7VbKDywsNRbpCw1mh+ADevpjpqqpO9+iCC
	ir5/omBAKAhQlJM0S0z3Tg2ctfkLyFRX4UWK98CPTz6ZA8cpSzhM5yG5GnRjTsnU3PmPSL5BA+0
	+7LoR5jUU9wBD3jg+yZfivjogpmzja5UFvKWTHwbNxp1X/kXmhWGtBWuq6cc1lNTYK1oOvVx4aF
	UfyTiBV7zLXy5W0+eVzHWjuiNpXkiR1StvmiwMdysZDKIJVbIdnwAl+u0a1Fec8qTGA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1786192936; bh=TjAyu7WMvcZuDZqJUV1+hYw
	J+wJ5yyIqrRwvxBioKoY=; b=YogH5M5sluQPKiHkxYCk2luSzfxl7vez0uESXE+opRQNm1l9Th
	JUmKPJyj+ym/5lEQQ3SKlJt8rWdEOwEWooBA==;
Message-ID: <dc1040f9-0ffc-4e64-a154-ece99b16eea5@mainlining.org>
Date: Sat, 8 Aug 2026 15:42:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] media: i2c: dw9719: Add DW9800W support
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Daniel Scally <dan.scally@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>,
 Vasiliy Doylov <neko@altlinux.org>, Achill Gilgenast <achill@achill.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
 <20260801-dw9800w-clean-v1-2-38978de67963@mainlining.org>
 <anGlY_kwp_I-fRnz@kekkonen.localdomain>
 <f7cae569-0c51-41fe-92ab-f29311a22761@mainlining.org>
 <anMeoKP6rUlgtKyR@kekkonen.localdomain>
 <3554d8d1-65f7-4556-8b99-1c03e0cdca53@fairphone.com>
Content-Language: en-US
From: Danila Tikhonov <danila@mainlining.org>
In-Reply-To: <3554d8d1-65f7-4556-8b99-1c03e0cdca53@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Griffin, Sakari,

Thank you for the clarification.

On 07/08/2026 17:30, Griffin Kroah-Hartman wrote:
> Hello Sakari, Danilla,
>
> On 05/08/2026 13:29, Sakari Ailus wrote:
>> Hi Danila, Griffin,
>>
>> On Tue, Aug 04, 2026 at 09:27:01PM +0300, Danila Tikhonov wrote:
>>> Hi Sakari,
>>>
>>> Thank you for your comment.
>>>
>>> On 04/08/2026 11:40, Sakari Ailus wrote:
>>>> Hi Danila,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> On Sat, Aug 01, 2026 at 09:04:15PM +0300, Danila Tikhonov wrote:
>>>>> The DW9800W uses the same chip ID and register layout as the DW9800K,
>>>>> but requires different default VCM frequency value.
>>>> Is this a real difference between the two models or what fits for the
>>>> attached lens? Too bad the datasheet isn't publicly available. :-(
>>>>
>>>> At least the differing default and constraints for 
>>>> dongwoon,vcm-prescale
>>>> needs to be documented in bindings.
>>> I share your skepticism and have essentially the same concerns. Since I
>>> do not have the DW9800K datasheet, I cannot say with certainty how it
>>> differs from the DW9800W.
>> Indeed. The limits should have been added for dw9800k, too, but I 
>> guess I
>> missed this in review. :-\
>>
>>> In particular, the parameter referred to as the VCM frequency in the
>>> driver is used to derive the SACT value. For the DW9800W, SACT[5:0]
>>> defines the actuator resonance period in SAC mode and the one-step
>>> period in LSC mode. The datasheet gives the corresponding formulas as:
>>> - tVIB = 6.3 ms + SACT * 0.1 ms
>>> - LSC 1-step period = 252 µs + SACT * 4 µs
>>>
>>> Therefore, the default value may differ between the DW9800K and DW9800W
>>> if the formulas or timing characteristics used to calculate SACT are
>>> different.
>> Griffin, would you be able to comment this?
>
> After checking on my side, DW9800W and K are almost identical in both 
> structure
> and register values, including how tVIB and tLSC are calculated, 
> DW9800K has an extra
> register that can change the output current to 130mA but we don't ever 
> use that.
>
> We didn't have a datasheet when working on the DW9800k so we had to go 
> off of
> the downstream driver during runtime to get our register values. The 
> datasheet is a
> much more reliable source to be using for this instead.
>
> My colleague has already identified ways to fix the bindings, which we 
> will
> tackle ourselves.
>
I'm glad you were able to clarify the situation, as this should help us
handle both IC variants correctly.
>> Another matter: the comment on dw9800k says there's no device ID. So is
>> there a device ID that wasn't just checked earlier or is there really no
>> device ID?
>
> Indeed, it turns out the DW9800K DOES have an info register, which 
> should be
> 0xEB, that's on us for not updating it after we received more 
> documentation.
>
Given this, and assuming everyone agrees, I think it would make sense
for me to leave the DW9800K untouched in the next version of this patch
series. Since it turns out that the DW9800K has a different Chip ID, you
can fix the Chip ID check for it separately based on the information you
have.

One point is still unclear to me, though: is the default VCM frequency
the same for both ICs, or does it differ between them?

> Thanks for drawing our attention to this! Nice patch.
>
> Griffin
>
---
Best regards,
Danila
