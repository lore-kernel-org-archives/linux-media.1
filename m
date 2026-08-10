Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F61A377545;
	Mon, 10 Aug 2026 07:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345743; cv=none; b=swzv+B8iW0PKpoXxDECiNlPUoU8n/+z3RpNSpN2r5FH5zWs5oPt7CM2ZqmKR2qPUA13aeqTEm+z6iMifnlEm1o4s5umBWgQGX2z2J6kuWAIvAkSPxiA6mW9Y4ALLWWh8B6P52S9Eg6RCeif/lOd+Kow/1F+fb/By/QXKdvQzXtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345743; c=relaxed/simple;
	bh=QLUQKYMfYgEpdJjY9IVN7RNODru23MvmShMWGFGPIYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GhzCKHp9pFwaEpuaWdmG+TOvLbnfYZ+14alc5LI05V8IsRMaaZRLQ0ZLwL7jDb2V/RyIYB7I2UxJ4XpuI/UeO4Z4Rzd9xcTTNJaIeb5H5MZv7hD9Jqwoi9I1K87EYQ3QPwtDawoSe6jQxtVMF0idiCT38dY2K9Zztm2eKVvDOaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hk3ZuOtr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hk3ZuOtr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8399B1F000E9;
	Mon, 10 Aug 2026 07:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786345742;
	bh=c2EOGS8DYmqZJF/Z5+8kYQQuEQuYPxby8DsQEXtUYIU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hk3ZuOtrQSR7utnupgQRC/ImuPCZsaAf4ygcX68Y5ip4N8TALf9HQWu/McLXoRPIw
	 T86GlZXPwPCz9+FaZ7UH+D5AnRZk3j7Doz7l81X7Kt4sqS981tlk+TggJ6H8FFp6KO
	 wT7o1QIrJEcQdrczwZBJP44LjKb+5rqxHLrTgR9bpS272+pMSZ+iILiTzIEwK4Dmak
	 AwUbzpB51DNXrCVn0Q3QsEwXuhLUcW1coWYE697Kunha7TRRZqB82lFoIEU7QEnDe8
	 dgb/KfZoehFquov+abe9fz/Mh5oEr0J7qxd0y3o2Da0ljuQ7n6JDvrduB6C5gnK0ij
	 efTEaeeoUlQvg==
Message-ID: <0b2f43f2-5c89-481a-9472-999331aa3b3c@kernel.org>
Date: Mon, 10 Aug 2026 09:08:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: add axiado,ax3000-video
To: Tzu-Hao Wei <twei@axiado.com>
Cc: Shubhangini G <shubhangini@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Karthikeyan Mitran <kmitran@axiado.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20260730-ax3000-display-driver-v1-0-4fbd4d0c85d3@axiado.com>
 <20260730-ax3000-display-driver-v1-1-4fbd4d0c85d3@axiado.com>
 <ed8ca066-bb8b-4476-be96-37a2b6e022ab@kernel.org>
 <a8383bd7-802b-41b0-897b-812b4a8fca33@axiado.com>
 <9f689436-04c6-48d6-8342-7fac998f3910@kernel.org>
 <b585130e-710a-434d-bf06-cc06f9bffc33@axiado.com>
 <20260804-healthy-versatile-barnacle-b58db9@quoll>
 <5d2a80ed-6c74-4ad7-8d18-c05e38bd8208@axiado.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <5d2a80ed-6c74-4ad7-8d18-c05e38bd8208@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/08/2026 10:20, Tzu-Hao Wei wrote:
> On 8/4/2026 3:55 PM, Krzysztof Kozlowski wrote:
>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>>
>> On Tue, Aug 04, 2026 at 07:31:25AM +0800, Tzu-Hao Wei wrote:
>>>>> There is no local register interface for this driver to program: frame
>>>>> delivery is controlled entirely by the host-side display engine and
>>>>> the PCIe endpoint mapping that feeds the shared region, both external
>>>>> to this driver. A software polling timer schedules a workqueue item at
>>>>> the configured framerate, which copies frames from the WC-mapped
>>>>> shared region into vmalloc-backed vb2 buffers. Running the copy in a
>>>>> work item rather than directly in the timer callback keeps potentially
>>>>> multi-megabyte memcpy and per-pixel conversion work out of softirq
>>>>> context.
>>>>
>>>> Then this is not a separate device. You just described a Linux driver.
>>>>
>>>> I still wait for answers of my question above. You described getting
>>>> buffers only.
>>>>
>>>
>>> Thank you for the continued review.
>>>
>>> To correctly represent this in device tree without describing a
>>> software driver as a hardware device, would moving the schema into
>>> /reserved-memory be the preferred approach for v2?
>>>
>>> Specifically, we are considering moving it to:
>>> Documentation/devicetree/bindings/reserved-memory/axiado,ax3000-video-mem.yaml
>>
>> I would rather suggest this should be part of the device handling the
>> host side of the device. Or is there none?
>>
>> Again, how do you configure the frame parameters or start capturing the
>> data?
>>
> 
> Thank you for the review.
> 
> Regarding frame parameters and capture:
> 1. Frame parameters: The remote host writes the active resolution and
>     format into the control mailbox (the second memory region).
> 2. Starting capture: There is no hardware "start" register. The remote
>     host continuously writes frames into the VRAM asynchronously. Our
>     driver simply starts reading from the VRAM in software when requested.
> 
> We did consider making this a child node of the PCIe Endpoint. However,
> that does not fit our architecture because this memory acts as a shared
> VRAM across multiple subsystems.

Just because you decided to split drivers into multiple subsystems does
not warrant designing bindings one or another way. IOW, number of your
drivers does not matter here.

Trivial answer to your problem is to combine the drivers so you have one
place of allocation which you pass to sub drivers.

Having this static in DTB is quite a limitation and constraint.



> 
> Currently, we are preparing two other drivers for upstream: PCIe EP and
> DRM/HDMI. In our primary use case, a remote host writes frames via PCIe
> directly into this VRAM. Our DRM driver concurrently reads this same
> VRAM to drive a physical monitor, while this V4L2 driver captures the
> frames for userspace (e.g., obmc-ikvm).
> 
> Because this memory is shared simultaneously by PCIe hardware,
> the DRM, and V4L2, no single software driver can simply allocate it
> dynamically. So, I think it should be defined at the system level as a
> shared reserved-memory region.
> 
> Given this hardware topology, do you have a recommended devicetree
> pattern for representing this shared VRAM? We are open to your
> suggestions on the best way to model this upstream.

How does the host receive the address/size of this memory (from host
side)? How does it know where to write the frames?

Best regards,
Krzysztof
