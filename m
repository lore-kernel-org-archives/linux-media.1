Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704947;
	b=EQ2ARWRUr7QdtYbpt0Rcg1z6JvsR1+jg+8naFolQONpdBV6KRTLKGRdoZtzMXXrnsmS8
	 82MhfluXW9Vkd/fGVvBGMFpnhHb3FCc0Baokp3F2Gzvw9QwEVY6jXXvMY3484mnhfkc4w
	 LtJecMsw9Z4l9mXxf+YboigTP3e6J1D3AVuiJNKjFiB6oz67nDtnNnCIfgKZ5EoJj/G9r
	 Gw3JT75fA7KOHnyKek8SYE0OMr9bD/Y9eLD1QAewVvaxO9cZFp12al9IqXhv7j2TJGOQv
	 9yelEeSOxvhIRzWePtJDBWNo6KQcqxIitGrM6Vn6GyfDkVxeU0otkjmSQck+f44gB0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704947;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=m1EK5Kg1DHSLtMSU2tHQsWHX71zGSAKbIU1tLCzsNOs=;
	b=5GfJjk9sKOSj+l+UDLhDZv75IbZTKZfryx82DJR+dKFIDF5nn3VTSubadYASh+3AZRig
	 qOai74rnztEwjg8yNTiXVLho4MCS7wWgMc93IwZPn0S5cpG0EuZ3PRV33iJ8Il9KFMU34
	 tUBPEydRvBTw8Zb0e4k2CceYD7CW3jMhnf1g1mXHK+FEQElSzZo8xFDAzS8DUcH/eclOI
	 ks4mC+xAv2GHSlCZfteQIqp+5rP1eCVMPowhPps2gwr7av227edBfclaXTtKS++Qzabs/
	 QerFDBJLbVTcAiLN6w8siW5+paw3VtjmuBWnSYxuGDivRoIMgUspOG5Mj/NaADAG2VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TmlDV4Fi;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FA5606A326;
	Thu, 26 Nov 2026 14:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76FA5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TmlDV4Fi
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB1D01BA8;
	Thu, 26 Nov 2026 06:55:42 -0800 (PST)
Received: from [10.33.48.93] (GM14V85S.arm.com [10.33.48.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9091E3F86F;
	Thu, 26 Nov 2026 06:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795704945; bh=SvlCtrr/3AS4+5pYzT1k9dDLoH3VLB5hGYKVGoOtsN0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TmlDV4FiQUtQv962BjjuYR9pnZajoHuThd6FyEr+tHqwPGNjq8WLAciv0R0sVn6Iq
	 7Cbpv0qOqyu4PqDxJrJ129vi9CYr+47Hia/CnX5K+hYcXCp/2fynBHWXiUDcqy9QJw
	 gXWwO7C6piEaX5LzzH7Q8ilOBfWGp0FXmQzpUwBU=
Message-ID: <0543d134-04d3-4e51-acd1-4fc39a0e522b@arm.com>
Date: Thu, 26 Nov 2026 14:55:40 +0000
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
Content-Language: en-GB
From: Anthony McGivern <anthony.mcgivern@arm.com>
In-Reply-To: <179559671799.14607.10622707622371448283.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, thanks for the review.

On 25/11/2026 08:51, Krzysztof Kozlowski wrote:
> On 2026-11-24 17:07 +0000, Anthony McGivern wrote:
>> From: Anthony McGivern <Anthony.McGivern@arm.com>
>>
>> Add the device tree binding for the Arm Mali-C720 Image Signal
>> Processor.
>>
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 

Yeah my mistake, I will update this in a V2 series.

>> Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
>> ---
>>  .../devicetree/bindings/media/arm,mali-c720.yaml   | 134 +++++++++++++++++++++
>>  1 file changed, 134 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c720.yaml b/Documentation/devicetree/bindings/media/arm,mali-c720.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..3bd261bcefbe371b7b4610afdde8e556b2a2ae22
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/arm,mali-c720.yaml
>> @@ -0,0 +1,134 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/arm,mali-c720.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: ARM Mali-C720 Image Signal Processor
>> +
>> +maintainers:
>> +  - Anthony McGivern <anthony.mcgivern@arm.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: arm,mali-c720
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    minItems: 1
> 
> Why is this flexible?

The ISP has two interrupts - Main and fault. Currently the driver only
uses the main interrupt, though we may wish to enable the fault
interrupt in the future to detect errors on HW side. I will update
this in V2 to use descriptions for each interrupt.

> 
>> +    items:
>> +      - description: ISP main interrupt
>> +      - description: ISP fault interrupt
>> +
>> +  interrupt-names:
>> +    minItems: 1
>> +    items:
>> +      - const: isp
>> +      - const: fault
>> +
>> +  iommus:
>> +    minItems: 1
>> +    maxItems: 3
> 
> Same question. List items with description instead.

The ISP has three AXI masters which may be connected to different
IOMMU ports. Initially I made this flexible since those masters
could be merged onto the same port, but better to be explicit here
and just define all three. In V2 I will remove the flexibility and
add a description for each port.

> 
>> +
>> +  clocks:
>> +    items:
>> +      - description: ISP main processing clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: vclk
>> +
>> +  resets:
>> +    items:
>> +      - description: ISP main processing clock domain reset
>> +
>> +  reset-names:
>> +    items:
>> +      - const: reset
> 
> Drop names

Will do

> 
>> +
>> +  memory-region:
>> +    maxItems: 1
>> +    description: Reserved memory pool for ISP DMA allocations.
>> +
>> +  power-domains:
>> +    description: Power domain containing the ISP.
> 
> Drop description

Same here

> 
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description: Parallel video input ports.
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input port 0
>> +
>> +        properties:
>> +          reg:
>> +            const: 0
> 
> Drop properties, should not be needed, same in places below.

Ditto

> 
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input port 1
>> +
>> +        properties:
>> +          reg:
>> +            const: 1
>> +
>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input port 2
>> +
>> +        properties:
>> +          reg:
>> +            const: 2
>> +
>> +      port@3:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input port 3
>> +
>> +        properties:
>> +          reg:
>> +            const: 3
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    mali_c720: isp@400000 {
> 
> Drop unused label

Ditto

> 
> Best regards,
> Krzysztof
> 

Thanks,
Anthony

