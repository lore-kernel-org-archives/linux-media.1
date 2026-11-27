Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782758;
	b=02B6Bc6GSaFa05/14jsqZYOC2JhIRLj2+3/bQj8c4c4Ty0JlsQvnhbIBr9Xpe2wqVQDE
	 Z5lU/tPfWz20uGpDZLxqVD/D9vyc+dTdeg1Cpp1oyGSj1X6cRSO/2ex3rmOvsWJJnXzPJ
	 JY/32y9nH72WNVNOdljmFMicpwfdgEGEdaMe15QOJ01HRtVKAhUClShiqhiQ1w+gtIss3
	 Ul+KuNjsquxlOm0JnDT99TutYVf0R/yx/55WcuIB5pTSMEKDx3qo2m0piYY6dtZc9jB47
	 R2OsV7NWK5ZI3FZATHrLbNa7UoIudm1fWMBqb3/wLwrA5V/8apWhzUdfYG9A4xr76Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782758;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ej0FH4NWIRLSaxrgsRdTXvAFtYwC+QYLBQG6bKf1ckU=;
	b=tVEHtv8kPkEwOEJkgTYgfzG+UrPweol3sTPdPfKVjRJjSYv17sGHoYJmZCLjXVafMVCf
	 ycHThL1UakecAiQ9FAl3b5XxKsc3RKt+VOyC4mCZ9Atb2D8huNqZcUYfyQsQjjfC0oiuP
	 UpXGyWKCX24gdLUN7EUcrYxb5HrbuGMyfaHaKEu+iYlDF/TIbQgYw5nIU2THwOwNTL6oi
	 X+XK6ucLXLEZUnbnDO/Z3wcwVSyQzrjKEt1D3VC0vJuYpwDjGesBsDKeVcy3z6DuHD3Sl
	 4EeLkSzqIsO2D07VvQQUzyoFAYK6MXqvTLcl7eN0npRYM7R8wOhiElp5tdkLJT/KL8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QG2Lxgr2;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6466606A31C;
	Fri, 27 Nov 2026 12:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6466606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QG2Lxgr2
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD3351756;
	Fri, 27 Nov 2026 04:32:33 -0800 (PST)
Received: from [10.57.32.178] (unknown [10.57.32.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 084743F86C;
	Fri, 27 Nov 2026 04:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795782756; bh=7bxvcukx/HgGtBxdFzeSnUBArw9JAb7dnNLFLXl2pOM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QG2Lxgr2jw/xOKLl706hxPPfXma5Wb9zMWMsA56S+efWBrE2ChR/lOdzi71a2Htvb
	 U6yBDCqpjpGnW0xH1oYqibMASC20A8twiUiqgDksVubdESrjxj3RFZAPMIXr4Not/N
	 IYg9gM9RdxBwTBOHEDntIOEj/kMiNhyHAqn+zmJ8=
Message-ID: <9bb113e7-f88f-4616-b20a-74065cd755cf@arm.com>
Date: Fri, 27 Nov 2026 12:32:32 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/24] dt-bindings: media: Add bindings for Arm Mali-C720
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nayden Kanchev <nayden.kanchev@arm.com>,
 Konstantin Babin <konstantin.babin@arm.com>,
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-2-0cb9bde1bd30@arm.com>
 <179559671799.14607.10622707622371448283.b4-reply@b4>
 <0543d134-04d3-4e51-acd1-4fc39a0e522b@arm.com>
 <4e8ecbe0-35bd-41d0-8546-4d99832e662b@kernel.org>
Content-Language: en-GB
From: Anthony McGivern <anthony.mcgivern@arm.com>
In-Reply-To: <4e8ecbe0-35bd-41d0-8546-4d99832e662b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26/11/2026 15:12, Krzysztof Kozlowski wrote:
> On 26/11/2026 15:55, Anthony McGivern wrote:
>>>> +
>>>> +  interrupts:
>>>> +    minItems: 1
>>>
>>> Why is this flexible?
>>
>> The ISP has two interrupts - Main and fault. Currently the driver only
> 
> If only writing bindings covered exactly such example. :/
> 
> Hardware has two, so you need here to.

Ok, understood on the part about driver support being independent here,
I should clarify what I meant to say. This fault interrupt is only
required for safety applications, and as such some integrations can
leave this interrupt physically unconnected.

That being said, it looks like in such case the device tree entry can
use 'interrupts-extended' and set the phandle to <0> for those cases.
So I will remove minItems here and for 'interrupt-names'.
Apologies for the confusion on my side.

As a side note, there are some extra signals for a system timer clock
and video output ports that should be added to these bindings also.
I will address these in V2.

> 
>> uses the main interrupt, though we may wish to enable the fault
>> interrupt in the future to detect errors on HW side. I will update
>> this in V2 to use descriptions for each interrupt.
>>
>>>
>>>> +    items:
>>>> +      - description: ISP main interrupt
>>>> +      - description: ISP fault interrupt
>>>> +
>>>> +  interrupt-names:
>>>> +    minItems: 1
> 
> And please drop minItems here as well

Agreed

> 
> 
>>>> +    items:
>>>> +      - const: isp
>>>> +      - const: fault
>>>> +
> 
> 
> 
> Best regards,
> Krzysztof

Thanks,
Anthony
