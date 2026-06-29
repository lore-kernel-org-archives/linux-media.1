Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096AF419303;
	Mon, 29 Jun 2026 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739062; cv=none; b=uH+W8ni8nn83FjKiznICMYsWWtDL7RkymPRoVpvbj85yLFR7qktRrDY0PlnWVoOEbuDeBEDklLCIQpyoGGVQburxRxY94ncnAoCr9NXztaYnJIg33+uzBjQ2/sXDHKCiZ2EFJlsV25IOQj9e52gDrcXWwzEyDm3DGB8dJKdu3KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739062; c=relaxed/simple;
	bh=xpiMn6d5fPo0qaTfPNweL2YOBZhGryyOb3EET/1QEVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePPp11ZSWLRCZ9xKVtWIKTX8QuEgwLDYxM05j1b0a7gRXXsaTG0Zw5DDdZZJqsooFygyPTyhvCsl+c5AAx2RgFgTf/7Px1G64yIoO9Xz5AysuoBPY6aZPPorzfSbdlN+MwWmiorIMMx5UHkwizuK/Defsuumn0UbHUdB79ohbCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QM92N+o6; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QM92N+o6"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B08101692;
	Mon, 29 Jun 2026 06:17:35 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF58A3F85F;
	Mon, 29 Jun 2026 06:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782739060; bh=xpiMn6d5fPo0qaTfPNweL2YOBZhGryyOb3EET/1QEVg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QM92N+o6dtt/9SuaWUaeBTF81oHVxRvf9KhYoxqQg+UrwQeABpnUf3zNQ8qJA1x7F
	 g7fNcKX8FhdwsL78EXZqqiNSvOXk1JU43jdMGrK5qq3dZ2fc0ENlAhei4KjlokKRqT
	 YSl9lDGp1kVMIdCDmXFkuewOMiBk2aMsb96ZFbhk=
Message-ID: <f4380f3d-8e75-4c9c-8e56-599b4b203369@arm.com>
Date: Mon, 29 Jun 2026 14:17:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: mali-c55: Implement CCM block validation
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden.Kanchev@arm.com,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>, linus.walleij@arm.com,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
References: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
 <20260627-mali-c55-ccm-gamma-v3-2-113584c05174@ideasonboard.com>
 <20260629095732.GC3054459@killaraus.ideasonboard.com>
 <34de3262-3e3a-4b93-90a0-bf662162dd10@arm.com>
 <20260629120552.GE3054459@killaraus.ideasonboard.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260629120552.GE3054459@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

Thank you for your answer.

On 29/06/2026 13:05, Laurent Pinchart wrote:
> On Mon, Jun 29, 2026 at 12:08:08PM +0100, Vincenzo Frascino wrote:
>> On 29/06/2026 10:57, Laurent Pinchart wrote:
>>> On Sat, Jun 27, 2026 at 04:29:14PM +0200, Jacopo Mondi wrote:
>>>> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>>>>
>>>> Implement validation of CCM block parameters.
>>>>
>>>> CCM coefficients are expressed as 13 bits signed Q4.8 format and their
>>>> raw value cannot be higher than 8191 (BIT(13) - 1).
>>>>
>>>> CCM gains are expressed as unsigned 12 bits Q4.8 format and their raw
>>>> value cannot be higher than 4095 (BIT(12) - 1).
>>>>
>>>> CCM offsets are 12 bits unsigned integers and their value cannot be
>>>> higher than 4095 (BIT(12) - 1).
>>>>
>>>> Validate the parameters provided by userspace using the .block_validate
>>>> callback of struct v4l2_isp_params_block_type_info.
>>> I don't think this is needed.
>>>
>>> We need to validate parameters that can cause the ISP to malfunction in
>>> ways that requires a system reset, or in ways that cause malfunction of
>>> other system components (e.g. buffer overflows, memory bus lock ups,
>>> ...). The rest doesn't need to be validated.
>>>
>>> If you want to be cautious, you can just mask the value when writing to
>>> registers, which I think you're doing in patch 1/4.
>>
>> According to me here is not a matter of being cautious, but of honouring the
>> contract with the userspace.
>>
>> If the userspace is doing something wrong it should be notified. The only
>> reasonable argument against this would be if this code is on a critical path and
>> the validations have a performance impact.
> 
> I don't agree with this. As long as it doesn't have an impact on other
> parts of the system, there's no need to notify userspace. It's purely a
> userspace issue, it's pointless to waste CPU cycles every frame.

I don't think it's only about protecting the hardware from invalid values.

The userspace API defines the valid range for these parameters. If userspace
provides values outside that range, returning an error makes the issue visible
immediately instead of silently changing the requested configuration by masking
or clamping the values. From userspace's perspective, silently accepting invalid
input can make debugging harder, as the configuration that gets applied is no
longer the one that was requested.

This also matches the documented behaviour of the V4L2 extended controls ioctl,
which specifies that EINVAL should be returned when the value of a control is
invalid:
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-g-ext-ctrls.html

The validation also isn't on the critical per-frame path. It's only performed
when userspace updates the parameters, so the CPU cost is negligible.

That said, if the expectation for the V4L2 ISP API is that drivers should only
validate values that could affect system stability or security, and silently
mask everything else, I'm happy to follow that approach for consistency.

> 
>> @Jacopo, can you please confirm if this is the case?
> 

-- 
Regards,
Vincenzo

