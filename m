Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF5C2F49F6;
	Mon,  3 Aug 2026 06:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738494; cv=none; b=IWoJrEQ8zL485PgkEELJ3ZvePbpOP/ZvTbaUr7Zb/B6wJ0glsgpomC5RVe+TZm/+ue00pAWkludaazYoW5PniZIN+mjh+3Pq3vF1M+sPL6/X/wZt4gvUqHTX+B9RlZrWre4RGQU5nXTVkhfNI5yOj3YrcTUPosyXBpiAvtClTx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738494; c=relaxed/simple;
	bh=XbW7OOAiebTvnzcbfHlZ4hBAcb7Wtwkk1AKePnS5apQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJs6h/uS56DhMLfC0ogq7UH+L3BM3qoxXe5ihBvDb1nUbKgRrf3PdcNy63qtdDv1QsZn+DjJSg8IfrTpOZZ8VssmcFX0wx99bte/WQFolOTVFxfwGwzgHDDMfan+gMPH/xtWXqOHVER5odBtcBpT4zs4KccO8JGeYQc7z7+y0rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqaIdnqn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqaIdnqn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF40E1F000E9;
	Mon,  3 Aug 2026 06:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785738492;
	bh=VJnBpSbqBnN56SuhlrVTljcEvdywgtKAS3fDvd5Ssa4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fqaIdnqnVWZ27PrcDDQGFPRNS8cl5KXdO9qfOnQPWn+IqX5o0zeM/jhDLv3wN5MVy
	 K2VZF0kx8O9LAj9TR+V3n9C8OlGjamYFxo8R3qRMC9G1IOqEk1HwGPGTn25TSfat0e
	 RNbFFfCwGYD2pmJs3v0ibO8DqFwNqcG2ts1kK1dX2boRVQgnOkDxtJRLlc7RBj6xR/
	 dekOI046ovMnKGgvhtYDrI1ZxZlf3mXTskx55wBtH7URKMBlLNARaRHk9HT3yKk3FN
	 LR0u2C/fDOjqrCW0kweaqlTSWwffrIv6PyGIrKTkx9SGUDxMCZXcS7q4ItSN6iTqFx
	 HW4DVOYwZAJnA==
Message-ID: <9f689436-04c6-48d6-8342-7fac998f3910@kernel.org>
Date: Mon, 3 Aug 2026 08:28:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: add axiado,ax3000-video
To: Tzu-Hao Wei <twei@axiado.com>, Shubhangini G <shubhangini@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20260730-ax3000-display-driver-v1-0-4fbd4d0c85d3@axiado.com>
 <20260730-ax3000-display-driver-v1-1-4fbd4d0c85d3@axiado.com>
 <ed8ca066-bb8b-4476-be96-37a2b6e022ab@kernel.org>
 <a8383bd7-802b-41b0-897b-812b4a8fca33@axiado.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <a8383bd7-802b-41b0-897b-812b4a8fca33@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/08/2026 07:29, Tzu-Hao Wei wrote:
> On 7/30/2026 4:12 PM, Krzysztof Kozlowski wrote:
>> On 30/07/2026 09:26, Tzu-Hao Wei wrote:
>>> Add a Device Tree binding for the Axiado AX3000 and AX3005 video
>>> capture path. There is no local register interface to describe: frames
>>> arrive asynchronously into a reserved memory region written by the
>>> host's display engine over PCIe, and this node only identifies that
>>> region.
>>>
>>> memory-region accepts an optional second entry for a host-written
>>> control mailbox, letting the driver detect the mode the host is
>>> actually driving instead of only echoing back the configured capture
>>> format.
>>>
>>> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
>>> ---
>>>   .../bindings/media/axiado,ax3000-video.yaml        | 44 ++++++++++++++++++++++
>>>   MAINTAINERS                                        |  8 ++++
>>>   2 files changed, 52 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml b/Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..c6d8d1843aac9f42869ff90a550b92d0bed7c16f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml
>>> @@ -0,0 +1,44 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/axiado,ax3000-video.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Axiado AX3000 Video Controller
>>> +
>>> +maintainers:
>>> +  - Shubhangini G <shubhangini@axiado.com>
>>> +  - Tzu-Hao Wei <twei@axiado.com>
>>> +  - Prasad Bolisetty <pbolisetty@axiado.com>
>>> +
>>> +description:
>>> +  Axiado AX3000 video capture controller. Reads frames written by the
>>> +  display engine into a shared reserved memory region and exposes them
>>> +  as a V4L2 capture device.
>>
>> This is really incomplete. You need at least way to power things on,
>> reset them, provide clocks, sensors, data paths. Or at the very minimal:
>> START capturing the frames after configuring the resolution.
>>
>> It seems you described driver or just a piece of entire video pipeline.
>>
> 
> Thanks for your feedback.
> 
> The Axiado AX3000 and AX3005 SoCs expose a display capture path that
> delivers frames into a shared reserved memory region and exposes them
> as a standard V4L2 capture device via the videobuf2 framework.
> 
> There is no local register interface for this driver to program: frame
> delivery is controlled entirely by the host-side display engine and
> the PCIe endpoint mapping that feeds the shared region, both external
> to this driver. A software polling timer schedules a workqueue item at
> the configured framerate, which copies frames from the WC-mapped
> shared region into vmalloc-backed vb2 buffers. Running the copy in a
> work item rather than directly in the timer callback keeps potentially
> multi-megabyte memcpy and per-pixel conversion work out of softirq
> context.

Then this is not a separate device. You just described a Linux driver.

I still wait for answers of my question above. You described getting
buffers only.

> 
> To provide more context, this hardware path is designed for BMC iKVM
> applications. The physical data flow is:
> Host Display Engine -> PCIe -> BMC Shared Memory -> v4l2 (video0).

Great, not a device. Linux driver.

> 
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - const: axiado,ax3000-video
>>> +      - items:
>>> +          - const: axiado,ax3005-video
>>> +          - const: axiado,ax3000-video
>>> +
>>> +  memory-region:
>>> +    minItems: 1
>>> +    items:
>>> +      - description: video frame buffer, shared with the display engine
>>> +      - description: optional control mailbox, shared with the host
>>
>> Why is it optional?
>>
> 
> The second memory region is optional because it is not available on all
> supported hardware configurations or use cases.
> 
> For instance, another supported use case has the following data flow:
> vtconsole -> framebuffer -> Shared Memory -> v4l2 (video0).

Use case is irrelevant to actual hardware.


Best regards,
Krzysztof
