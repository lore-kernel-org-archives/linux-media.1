Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8682EBB8C;
	Mon,  3 Aug 2026 07:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740691; cv=none; b=oqfwQADlt7R+1EETpYBTOO4PSGp2KJ/baPDGcjXZH4hCbZZpQIXKlscUJgaytl1TbPuyAi/6dDCnYKWi/2wbYbPK/v8MYnMlKcFPXY2BBBC31LPqFSXRUR8xVGUc97Qxxx8oixbS5SzwO8qNOZvnmYg6kFDzvQCX10Ki+2v/SwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740691; c=relaxed/simple;
	bh=UQf41+8YqZMJxfaKyfezDK8Pjej7YfOMeS1/pcjTyHQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VenNgJmHGa2XhrC/6AzN3xqwqg4erqSQRvIyBQCKsrhjFGHFZrRlAdNNtfAYurLR0ISTV0De4bggz1ygiKkQIdv8TiH34SVGAL1B2TVHbjoAIQqLuWCHv7Cl+TdDF0zITk5gp91dU5F6sVc3qIpqIaoHXAoBIMQpUJ7L4UHfpQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lgl474UE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lgl474UE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAD91F000E9;
	Mon,  3 Aug 2026 07:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785740690;
	bh=Jey7ksM5AHMQT75aqh+gc944S/xCbXOVvELxnbtYjnM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=lgl474UE/f6AX+ZtfGxs2Ks/5rvqbv56FQc6XBzuKe1ugE9wKOcb0qt8yo8SOPdiN
	 bZSNDhB7Wztj6FZpz5gGA+3hAKhqZOJlyCbIDzAFENdphEGMuR8Kbf/AfYwMvzfZDk
	 jxnke6aoUidcSNvcVqv99gQlIF+mjoim4rjnq3FCmLfC8nyPVE2YgZUuVtPemkBUdU
	 KEZT1T2KbX3kA+Gn++03PQAv4kKlG5vTYCtDUAYPpwfgD7stxwjxLFMuYtkRsRDviB
	 /J7TlpcBtkxHC5CaTbcVeFaP3ESYeSdhvbuCYsJQ0g1U0/oFj9muD1c85/PjUprvoD
	 zg9fZb9iaU4JA==
Message-ID: <01dab9ea-d57b-430d-b235-2d927ee5f5d2@kernel.org>
Date: Mon, 3 Aug 2026 09:04:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [RFC] Discussion: VIDEO_NUM_DEVICES limit in v4l2-dev.c
To: Ali Nasrolahi <a.nasrolahi01@gmail.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 mchehab@kernel.org
References: <am7LpodognguIZN5@zephyr> <20260802125734.198631b5@foz.lan>
 <am-KtTBaHCshGpeb@zephyr>
Content-Language: en-US, nl
In-Reply-To: <am-KtTBaHCshGpeb@zephyr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/08/2026 20:25, Ali Nasrolahi wrote:
> On 26/08/02 12:57PM, Mauro Carvalho Chehab wrote:
>> On Sun, 2 Aug 2026 08:24:29 +0330
>> Ali Nasrolahi <a.nasrolahi01@gmail.com> wrote:
>>> I'm working on a project involving high density video processing on a
>>> single server using a large number of v4l2 loopback devices to route
>>> virtual video streams to tenants.
>>>
>>> While doing so, I ran into the hard limit imposed by `VIDEO_NUM_DEVICES`
>>> (currently 256) in `drivers/media/v4l2-core/v4l2-dev.c`. Looking through
>>> the code and git history, this limit has been there for quite a long time.
>>> However, after searching the mailing list archives, I couldn't find any
>>> previous discussion regarding this limitation.
>>>
>>> May I ask:
>>>
>>> 1. Is there any internal design constraint that requires limiting the
>>>    number of V4L2 devices to 256 on modern kernels?
>>
>> There was a constraint at the very beginning due to the way minors
>> were generated. If I'm not mistaken, this was long gone.
>>
>> Still, having a maximum limit is desirable as there is a hard limit
>> in terms of the memory.
>>
>>> 2. Has this limit been discussed previously, or is there any relevant
>>>    discussion that I may have missed?
>>
>> Probably, but likely very years ago. I can't recall last time we
>> discussed this particular limit.
>>
>>> If the current limit is no longer intentional and there's no historical
>>> context that I might've missed, I'd be happy to work on a patch series to
>>> address it, and I would appreciate any guidance on the preferred direction.
>>
>> What is the maximum limit your hardware has? Can you provide some
>> documentation related to it?
> 
> Assuming I understood your question correctly, because the workloads run
> on a server, theoretically, there is no fixed limit on the number of
> virtual video devices that could be used. As long as there is enough cpu
> power, memory, and i/o bandwidth available, it is beneficial to be able
> to add devices and, consequently, run more workloads.
> 
> That being said, to give some rough numbers, I think supporting at least
> 1000 to 2000 devices would likely cover most practical cases.
> 
> This is why I was wondering whether making this limit dynamically
> allocated or at least configurable might be beneficial, so, for example,
> mahcines with limited memory would not have to reserve an unnecessarily
> large array, while systems with more resources could scale accordingly.

It shouldn't be too hard to add a module option to set the max number of
devices. Minimum and default value would be 256, max 4096 (it can go higher: the
minor number has 20 bits, but I'd cap it to 4096 for now).

This module option is only available if CONFIG_VIDEO_FIXED_MINOR_RANGES is
not set, as that would cause problems (and perhaps it is time to retire
CONFIG_VIDEO_FIXED_MINOR_RANGES).

You're the first in my 20+ years of V4L experience who needed more than 256
devices, so this is not a common request :-)

Regards,

	Hans

> 
> For some additional context, the video streams are received over the
> network from various sources such as cameras and WebRTC. These streams
> are then routed to v4l2loopback devices, which are used by the workloads
> for processing.
> 
> Regards,
> -Ali
> 

