Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F3A3033E6;
	Tue,  1 Sep 2026 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270840; cv=none; b=Ki2NMBDVDCHMhjIK3pnuQSgPsMSOzP+0sBrhNxlH1eexhc2jjuzQrOxtoJ2f0ycSgVi8sbv2vON3Vt8EQQa5YfRZ946Rsf48p+le5AW8ATvZLfDO45fVmYAYzlKgbKbQd2IEV0S7lh89Poe7StmM5J3t0wH/79FIj3qNXMWr/fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270840; c=relaxed/simple;
	bh=tMJHcnwDScnHmW9CG6EUz08AlpSD0KBDMdOFTUetDwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9EYAUKiNxUOcdqdNvnkm5bV8U8ENChXJVf6ZEEy7/8ICTBTAvx8+4KKcoapduylSzZdMoNSbViQxWTP9ETyUk2VnPcHi4TB4y+16UQrhivTh54pH93ViKXjjN2eowMO7HMQ1TERUnkVHXDhRlZAWOZtonsOT7MoW3F6/D1F/zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrA5ZPzt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrA5ZPzt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23721F000E9;
	Tue,  1 Sep 2026 13:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788270838;
	bh=s2RSyKciexkA8E25dmTG+inyL2i+ULysjoze3NDhoIg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FrA5ZPztvNnseMHC208ivqlR7JLk0vHCZ0uQov3l0iq6SCRwtKGQkItbyTpNJ9nrr
	 rfJYtZAyeDuoIkQmRXYHBq+ukBxm5LpkrwyPByPpiFJJFiCDouPoKAVOzGU4edJxdm
	 +Ujn7mu5VIcFu1MpjeKzmf7qeBcr82QJ11e/Nq0T2oTV/Xl3oumPQroit7f10CJm8n
	 kVB0rHMft+WdRwleWZClNrb6/Plom4VOekrozI341FeXXKgWVQSWmFN9hE6ixKAe7G
	 UQpIA7uSB7eK7W1Nii+VA0tLkIhoV7G/yOcLlVCVZNDuIJlyeT5jnhH1d8QlFPDeIj
	 CSqh00BINZ1dQ==
Message-ID: <58c0d082-b527-4fd1-9f7a-74b58b4db54d@kernel.org>
Date: Tue, 1 Sep 2026 15:53:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image
 sensor binding
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Quentin Freimanis <quentin@q-lab.dev>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20260820075524.2056029-1-eagle.alexander923@gmail.com>
 <20260820075524.2056029-2-eagle.alexander923@gmail.com>
 <20260827-legendary-viridian-tamarin-4e56e5@quoll>
 <CAP1tNvSg4yWHCJW6UNZ4yQv5FCjz9u5ZLpuW5Z9skkjQYbS9AA@mail.gmail.com>
 <21dec355-0cd7-4250-a7f4-e93f3e446504@kernel.org>
 <CAP1tNvT2+uNvcHf9=c_ysaM=gKrnz+5ZMTOq-8n_V+Ryx=yxLA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CAP1tNvT2+uNvcHf9=c_ysaM=gKrnz+5ZMTOq-8n_V+Ryx=yxLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/09/2026 12:32, Alexander Shiyan wrote:
> Hello.
> 
>>>> On Thu, Aug 20, 2026 at 10:55:23AM +0300, Alexander Shiyan wrote:
>>>>> Add devicetree binding for the onsemi AR0234 CMOS image sensor.
>>>>> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ...
>>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
>>> ...
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - onnn,ar0234cssc
>>>>> +      - onnn,ar0234cssm
>>>>> +      - onnn,ar0234cs
>>>>> +    description:
>>>>> +      The AR0234 sensor exists in two different models, a colour variant
>>>>> +      (AR0234CSSC) and a monochrome variant (AR0234CSSM). The device exposes
>>>>> +      the model through registers, allowing for auto-detection with a common
>>>>> +      "onnn,ar0234cs" compatible string.
>>>>
>>>> So all devices are compatible? Then why compatibility is not expressed?
>>>> What are the actual programming differences between sc, sm and "none"
>>>> variants?
>>>
>>> Perhaps I need to revert to the compatibility strings that were used
>>> in version 2
>>> (https://patchwork.kernel.org/project/linux-media/patch/20260807102847.1813059-2-eagle.alexander923@gmail.com/).
>>>
>>> From a programming standpoint, it makes almost no difference which
>>> sensor is used
>>> - the only differences are in the output format and the format count.
>>> Either way, the driver always uses the sensor model determined via
>>> register reads.
>>> If the specified type does not match the detected one, only a warning
>>> will be printed.
>>
>> Devices should be made compatible with the fallback or even the color
>> and mono variants could be dropped. That depends on the difference
>> between color/mono.
> 
> Removing the separation would result in a regression.

What regression? You just proposed these compatibles, they are not
accepted, so how and what possible could ever regress?


Best regards,
Krzysztof
