Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B5D3A6B7F
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691951; cv=none; b=brugmSLWiBCoFO1G0fZZ8jBvnc8cj4+P1SkestaAvAytiXDHcHw5IieZVv3uRwqBHNIngFmE8J/arFrjxFzJV3u0LjCkTQsI8M/sC0Hxc73C/JSJzpLLwJC5n9KhkkCnqYreMGuGAKFOUOGigY1N8dDtZOAwwBacQE98hepdyuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691951; c=relaxed/simple;
	bh=brc+A0ZIhTay0t/sHPzw8jnQ9tHzPTFC3j7PL+67w8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ewlw5186jSznEF8OX4KZjKSWJ1CSu2BSydUqReSRSiOE3Q2pa3befkW/uCFtLEaz5SO1Wq/F5x0NrAVnEV8btYIGcUs6IQvraLuYNWbkpL1tLp/HtrsLD9heiy31TSBo9D3QKz1T1OJIqDtD0kbcM61NH8kwQFrcqPz+WjDctP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from [192.168.2.104] (91.79.39.53) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 29 Sep
 2026 17:25:35 +0300
Message-ID: <9459e152-e7b3-4d00-b511-089ff7ec70ce@auroraos.dev>
Date: Tue, 29 Sep 2026 17:25:35 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: drop useless assignment in
 uvc_parse_format()
To: Hans de Goede <hansg@kernel.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>
References: <20260820201128.35669-1-s.shtylyov@auroraos.dev>
 <CANiDSCuWc8oUhFgqVMH+4+nzStuPfA5b2Vz+2woXqEu6ob1yOA@mail.gmail.com>
 <20260928202948.GI4406@killaraus.ideasonboard.com>
 <206c3a0e-013c-4350-aa70-eac96e045784@kernel.org>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <206c3a0e-013c-4350-aa70-eac96e045784@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

On 9/29/26 12:16 PM, Hans de Goede wrote:

[...]

>>>> Close to the end of uvc_parse_format(), the parameter buflen is decremented
>>>> (again) but that statement seems pointless as buflen isn't used afterwards.
>>>> Drop the useless assignment (gcc doesn't generate any code for it anyways).
>>>
>>> The patch is correct, although I do not see a great benefit in
>>> removing it. As you say, the compiler will remove it anyway. If we
>>> modify the function to add logging or continue parsing the left over
>>> buffer, it is going to come back to haunt us....
>>>
>>> I leave it to Laurent or HansG to decide if they want to merge it.
>>
>> I'd rather keep the buflen update in place for the reasons explained by
>> Ricardo.
>>
>> /me wishes for std::span<> in C
> 
> Ack, I've dropped this patch from patchwork.

   OK, but why "Not Applicable" and not "Rejected"? :-)

> Regards,
> 
> Hans
[...]

MBR, Sergey

