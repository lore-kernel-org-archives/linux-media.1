Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.42.129.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456556;
	b=gkiVEFqIy7WEiYbFkJtBN6m7gDtLcPoXxEf9OtSmD7rBdGDazYgmuBnEImTDWA91MtCE
	 4mg5uG/WZUJxF8lDupWa2WgXafplmBwTBdUC1d43uI/x77PYIkOkzys5urf3jSGRkGMAC
	 CXR40Tw/OMtDKl4YOSrjjk6NoyDr9J5OphSABWBNLdVbSrXG76lPy38ccHbbVZShFmJNX
	 H1BF6z9hUEfNAK50r4056Ugej32g1BQToYdG8P7ZhW7a56sYmJvYff31niPwcR/Cy1VIT
	 Yj7rxKolvaaTuhgkqYwFqJL8otimL0/WauyPF0rCjSZ4C2QGABpszDVYLssgB6b17cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456556;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=N0i5iHQrYOWaYU33b56COxc9yNv8Im1x7F2EeoyEDH4=;
	b=P2USSz5ch7dKQ6on6CNomgLF8RGDwRbS7FHmNzgED7xnzZ5UImjFCFhkgRHO84/0bApY
	 87/QT8n/oY0FPaIuGNmsEDf2tVNYll85c2jOln967yjc7tl1AY2413eddgAkIqsqP0ZX5
	 C9tLmATQrahEm/LJU0q2xlAbJf7+pJtTqItDUXHi7K+Xbeo7NgVoXjuPwMOY9Zfna+/6E
	 qJKEdKP+QNZWNix1hYURzDZG0pJC5HUpZZXixC/K9E72BMqYHu9W5g/IiYqwe4rOfFCzQ
	 j2T4tyhVnRzRGM7C+xATEfh9oLTwrY2m5M9qK0OoWQQ4FSJYdPXgiavuFXFxjchTIwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ixit.cz;
	spf=pass smtp.mailfrom=ixit.cz;
	dkim=pass header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b="CA3F3gt/";
	arc=none smtp.remote-ip=84.42.129.46
Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B5C606A31E
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05B5C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=CA3F3gt/
Received: from [IPV6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e] (unknown [IPv6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id B59705340237;
	Mon, 23 Nov 2026 18:55:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1795456553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=N0i5iHQrYOWaYU33b56COxc9yNv8Im1x7F2EeoyEDH4=;
	b=CA3F3gt/cDAOnE4KB5o5KoPSla/SxnKdQcMPZfOEF31F8DeRx/wG8Za0vZKf3SqXOSL/lg
	5R+BNxjk/sTEAh7JW1FcQLsuMtlJsgbliFomWmuTipVgGHAhpFS7BcNS1/V3oAZDrETbNa
	sClcwk+9lnei2wWVlCnu9IQ0EY/So2k=
Message-ID: <dc8bcacc-d743-4108-87e7-3c6715b23f4a@ixit.cz>
Date: Mon, 23 Nov 2026 18:55:53 +0100
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
Subject: Re: [PATCH 0/4] Various CCS fixes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org
References: <20261123-ccs-clanked-fixes-v1-0-fb2bcc87a517@ixit.cz>
 <20261123165549.GE2959742@killaraus.ideasonboard.com>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20261123165549.GE2959742@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 17:55, Laurent Pinchart wrote:
> On Mon, Nov 23, 2026 at 01:02:38PM +0100, David Heidelberg via B4 Relay wrote:
>> First two seems to be no-brainers. Next two seems to be correct too.
> 
> What exactly do you mean by "seems to be correct" ? Are you sending
> LLM-generated patches that you're not even sure about ? That's a
> complete no-go.

Hello Laurent.

While I'm aware of your antipathy against LLM models, current situations doesn't 
look like there are lining people to fix it and make sensors work with the MIPI 
CCS drivers (introduced 2012).
This leads to endless forks of imxXXX sensors across hundreds of trees + people 
clanking this stuff over and over. Let's establish that first.

When I see opportunity to improve the generic driver, I'm taking it.

change-id: 20261123-ccs-clanked-fixes-609bb0754028

As you can see the change-id, I didn't make it somehow hidden. I reviewed the 
changes which LLM found when helping me figuring out why I have black/white 
output from the sensor which sequences seemed to be correct to me.

My logical thinking would be evaluate quality and review the code, which leads 
to my brain marked:

patch 1 + 2 as pretty confident it's correct and
patch 3 + 4 as looking reasonable to me.
patch 5 + 6 I haven't send because of unnecessary complexity and likely wrong 
approach (still in the backlog to analyze)

I would believe it's better to at least report in this form, thus my comment 
inside the cover, that last two patches may be useful. And yes, I understand 
there is infinite amount of randomly clanked patches coming in your direction 
and I understand it's huge time-waster and pain.

For v2 I'll drop patch 3 and 4. Hopefully that makes more sense to you, because 
as I'm working on getting Linux mobile phones in a good shape, I have not 
ability to split myself into developer highly specialized in every field 
(subsystem).

David

> 
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>> David Heidelberg (4):
>>        media: ccs: Use dev_dbg() instead of dev_err() in ccs_enum_mbus_code()
>>        media: ccs: Fix sub-device index in ccs_cleanup()
>>        media: ccs: Update PLL and blanking limits when pixel_array crop changes
>>        media: ccs: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flip controls
>>
>>   drivers/media/i2c/ccs/ccs-core.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>> ---
>> base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
>> change-id: 20261123-ccs-clanked-fixes-609bb0754028
> 

