Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789537;
	b=WSZOmJFsSnfzDacivF9eiZxP/qeIqXA8228iJosalCjmKgjlECCcgMwKps/GaYA4rM2h
	 JKy93IsYDdbjrhiRgBMmZU5ntDHdmoPvtt1GgYhSIlbAF0HF9wqcf6ETqEnwJIkhok8LX
	 3CQ2wUWtAOSDVDx2h499Gq18hs1UN3rTuZfL6E1wXnnWHsK4cVgdFunZ4VcyyXBh3g2eZ
	 3r5TpVCXk3ABOggk0u7GT/RKdYZB09SIOk3Qa5RiYo+k5GybwDnlG0xIHfqP/y/oVhoQ5
	 MuN2igCVY1nNLHXPrYt8utzxk96I3TzqTRM2993rNk+GmEBj4g1V/RQx0kggpT1b0Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789537;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=t0LqT5w+izgEbYxz6PH+/Po+iDL6T8IFcLOSgldKdU0=;
	b=HgHmxerZRbVVaCRq+PfxKc8nipQo98qo4nY/jGRn6V1a/9hsYXgnqwWYs4zSqRlgrbt7
	 8osUSaHxMJsxH9dsHpEBlTaztXDXXzvyo3rGf+CrnDc0hzsm4rSkJG369zqfcLEFHcujx
	 7nr875BJGB3GR56FO7JoLxKv9YsLuTg/RjlTBwq4XJW3ocQX5Jnv3QQPZOgwc99GKkZoN
	 C+Yy9jVlrt7UD+kh32EDbV7gKeoXUiO+S6Isy70Ur27RcBLvDFzKKB5kU9+lstrjGLdf6
	 rdWJDBnHXq3sumO5pSKYPA5tz27PnWoGkz2NP12eZ8gE9jHH0U4AmQcgrNOPAJYVxxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ueg12IHl;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96075606C2FE;
	Fri, 27 Nov 2026 14:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96075606C2FE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ueg12IHl
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3B1A169E;
	Fri, 27 Nov 2026 06:25:32 -0800 (PST)
Received: from [10.57.32.178] (unknown [10.57.32.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26CA53F86C;
	Fri, 27 Nov 2026 06:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795789535; bh=O8jYR5KANQCIvSrIeG5OfriFdRVmVqQWfvrqkrYXvuo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ueg12IHlHHEZDlpOEoQvXC8ub3PsNq27pV+dWH2iERx1Q/qPVP7uMjlCI1vkzX+yC
	 zoOtmpZ3zDbfQzXoh8lRMp+U244/KhLZMghOR7hOcjSSI0vrWM56/11SlNh4R2wufl
	 fsapQtPd6gtq13Ncc2KWl8TU4QYP0DzGJewEsj4g=
Message-ID: <6f52dbad-f3c6-4f62-862a-bed34c2d5922@arm.com>
Date: Fri, 27 Nov 2026 14:25:31 +0000
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
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nayden Kanchev <nayden.kanchev@arm.com>,
 Konstantin Babin <konstantin.babin@arm.com>,
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com,
 kieran.bingham@ideasonboard.com, dan.scally@ideasonboard.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-2-0cb9bde1bd30@arm.com>
 <179559671799.14607.10622707622371448283.b4-reply@b4>
 <0543d134-04d3-4e51-acd1-4fc39a0e522b@arm.com>
 <4e8ecbe0-35bd-41d0-8546-4d99832e662b@kernel.org>
 <9bb113e7-f88f-4616-b20a-74065cd755cf@arm.com>
 <20261127124951.GC85756@killaraus.ideasonboard.com>
Content-Language: en-GB
From: Anthony McGivern <anthony.mcgivern@arm.com>
In-Reply-To: <20261127124951.GC85756@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 27/11/2026 12:49, Laurent Pinchart wrote:
> On Fri, Nov 27, 2026 at 12:32:32PM +0000, Anthony McGivern wrote:
>> On 26/11/2026 15:12, Krzysztof Kozlowski wrote:
>>> On 26/11/2026 15:55, Anthony McGivern wrote:
>>>>>> +
>>>>>> +  interrupts:
>>>>>> +    minItems: 1
>>>>>
>>>>> Why is this flexible?
>>>>
>>>> The ISP has two interrupts - Main and fault. Currently the driver only
>>>
>>> If only writing bindings covered exactly such example. :/
>>>
>>> Hardware has two, so you need here to.
>>
>> Ok, understood on the part about driver support being independent here,
>> I should clarify what I meant to say. This fault interrupt is only
>> required for safety applications, and as such some integrations can
>> leave this interrupt physically unconnected.
>>
>> That being said, it looks like in such case the device tree entry can
>> use 'interrupts-extended' and set the phandle to <0> for those cases.
>> So I will remove minItems here and for 'interrupt-names'.
>> Apologies for the confusion on my side.
> 
> If SoC can integrate the ISP without the fault interrupt being wired to
> the interrupt controller, then "minItems: 1" is correct.
> 

Makes sense, I will leave it as-is but add a small description so this
is clearer.

>> As a side note, there are some extra signals for a system timer clock
>> and video output ports that should be added to these bindings also.
>> I will address these in V2.
>>
>>>> uses the main interrupt, though we may wish to enable the fault
>>>> interrupt in the future to detect errors on HW side. I will update
>>>> this in V2 to use descriptions for each interrupt.
>>>>
>>>>>> +    items:
>>>>>> +      - description: ISP main interrupt
>>>>>> +      - description: ISP fault interrupt
>>>>>> +
>>>>>> +  interrupt-names:
>>>>>> +    minItems: 1
>>>
>>> And please drop minItems here as well
>>
>> Agreed
>>
>>>>>> +    items:
>>>>>> +      - const: isp
>>>>>> +      - const: fault
>>>>>> +
> 

Thanks,
Anthony
