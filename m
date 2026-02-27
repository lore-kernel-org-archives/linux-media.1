Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851EE1F92E;
	Fri, 27 Feb 2026 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772192241; cv=none; b=s2n9TglxElEmfA8DjYy12nNxb35Or+A17kUBQ2JQTlYsM0n0GKBHcqFzPzMPqqrlb0luznUlwGknWR8S035SFUjg2yjf6fFDPqFenV/xQD5Jocy9gySrRiJ0WpsCZjoRQas7z9BIUpxN2lUrJLwBVaROneY5PG+3+lTkS+rQ2AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772192241; c=relaxed/simple;
	bh=ENbjWJF9SiuxxSiikXhZ3ftmZA+6ZUt7yDgzAKSZBiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OUreYeUNKC67s19O1LJiMYbI9gAnzWCnIPDsPY0nHiITob5iF6XTbP5bFEkhP2HGzmDhC4ji8n6fO1GE3Li4wqYHEEpYKe2Ryoy/FNS4RfOuowlKlLvMoelE3q9utwr4i5DKVL9NqsAeQ90JOgv5b0iFj75oDOGvjP/67Gm7MK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JOydFz/J; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JOydFz/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772192238;
	bh=ENbjWJF9SiuxxSiikXhZ3ftmZA+6ZUt7yDgzAKSZBiY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JOydFz/JmMwj4/f2OOR1ovhDA8+gWpkodHpir9ToEkNlhPTp86LncwbfBwVC1stlk
	 Jb+xwkuYjMmF58t6jCDclDKCNitTe8VuIUuKb5rIXyH5X1tO9KvjbsiDTkcnYev4Fe
	 K9pmxHiqhxpF4NGe5dLPyr5Z4rSTwNVvHKZIxbzB98xAaeCFGjxG4D36YUhf6KAVAS
	 wjIcgJtVJehQ8y+GiN1nkzTn29jQYvTL6t1F5gq42Q8B8FWkfdUwVx9MgKngXpoUDw
	 AjHMFLHV5EUKeZlAHBufY3LykFOVpH8X4FoO6U/OxEj4aWPk9oN0myPl05TxI7di4L
	 89FgTQz5xEkow==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1424017E00A3;
	Fri, 27 Feb 2026 12:37:18 +0100 (CET)
Message-ID: <adbbdbb1-b126-4807-821c-c9850befd695@collabora.com>
Date: Fri, 27 Feb 2026 13:37:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260227-observant-roaring-ara-ef7eb0@quoll>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260227-observant-roaring-ara-ef7eb0@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof, Conor,

On 2/27/26 9:46 AM, Krzysztof Kozlowski wrote:
> On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
>> With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
>> register blocks have been provided for the video decoder unit.
>>
>> However, the binding does not properly describe the new hardware layout,
> 
> As you shown me last time with excerpt of address spaces from
> datasheet/manual, the binding correctly describes the hardware and above
> sentence is not true.
> 
>> as it breaks the convention expecting the unit address to indicate the
>> start of the first register range, i.e. 'function' block is listed
> 
> Imprecise wording. "start of the main or primary register range"
> 
> (if you have 0x1000 with one reg and 0x20000000 with everything, the
> unit address will be 0x20000000).
> 
>> before 'link' instead of the opposite.
>>
>> Since the binding changes have been already released and a fix would
>> bring up an ABI break, mark the current 'reg-names' ordering as
>> deprecated and introduce an alternative 'link,function,cache' listing
>> which follows the address-based ordering according to the TRM.
>>
>> Additionally, drop the 'reg' description items as the order is not fixed
>> anymore, while the information they offer is not very relevant anyway.
> 
> This is fine for me.

Thanks for the additional feedback!

If I'm not mistaken (please correct me), the only remaining (hard)
blocker for the series would be to improve this commit message.

How about the following:

    With the introduction of the RK3588 SoC, and RK3576 afterwards, three
    register blocks have been provided for the video decoder unit instead of
    just one, which are further referenced in the datasheet by 'link table',
    'function' and 'cache'.  The former is present at the top of the
    listing, starting at video decoder unit base address.

    However, while documenting RK3588, the binding broke the convention
    expecting the unit address to indicate the start of the primary register
    range, i.e. the 'function' block got listed before the 'link' one.

    Since the binding changes have been already released and a fix would
    bring up an ABI break, mark the current 'reg-names' ordering as
    deprecated and introduce an alternative 'link,function,cache' listing
    which follows the address-based ordering according to the TRM.

    Additionally, drop the 'reg' description items as the order is not fixed
    anymore, while the information they offer is not very relevant anyway.

Regards,
Cristian
