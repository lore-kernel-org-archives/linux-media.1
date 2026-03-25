Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B972304BB3;
	Wed, 25 Mar 2026 08:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425902; cv=none; b=KjJGYIEtJPfxmUx+UNHM45/ohnd04Wu5roZ3JMbPsMi1zS4pvexmw1+AGNhELPVP4+ea1woiRN73eEGTPIqpUQnNlIbE+Sfbd/qDSy4AbvycsHXt0bH86HX5WUmjv96AivROFe9XuADRW9WiWwBcmRBqvJy7xUTQH+a+fGd5BX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425902; c=relaxed/simple;
	bh=JfkhMwj5pX3vzkYeKIXrU9wJqRr8s1NLWxQWQGgaA3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iCvmF/upOUChJKbVrcw1ajwUvROs1bdkonNLHEjZjoapizsjS5vOfNq2CNct88L1OAwScCSVXMPtLhYwVCKDp6lr0ymOuyOvKian9PguqnD6zxxo+Pf0oNs87nbNZYP0R8fY+O0wXG6ER1Zv3YqaO4fvQVfb+QtM0pn48497J14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dicqqR9k; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dicqqR9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774425899;
	bh=JfkhMwj5pX3vzkYeKIXrU9wJqRr8s1NLWxQWQGgaA3Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dicqqR9komLroysF/R/Cg1U6o5kKFlIGa08ve6xEUpswfU5mDNivsoIierLmjWdUC
	 LoaqQ8AFzE337FNZHwRul2gDUsuEyP7RA/14aAu46Dh9qEG+JaTQZxVd16DS9pSy+O
	 kWAJfSD5iyB9admQAOYSvz3FqRb9qjBCczYH+JWdPHRwhDhj9F0CXu3P4ZSs/vmuri
	 5jP4ST8Z74hMyhx7DAYCPe+IrJnj/rHirp++AU3QIZXkeHp0WOxDFgJDZCNXPUUfTH
	 XTDKew95WoDuIF4PdHP1mmnaCDIRmksi82NqRTxPCYHmgX8XpVoSQ1AtjCMh8TzDxi
	 dsR1zJ/hf1HpA==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE57A17E3E69;
	Wed, 25 Mar 2026 09:04:58 +0100 (CET)
Message-ID: <d97b05cb-396b-4189-8b96-88eab6f85f24@collabora.com>
Date: Wed, 25 Mar 2026 09:04:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] media: rockchip: rkcif: add support for rk3588
 vicap mipi capture
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?=
 <mai.kuznetsov.misha@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-3-77de5ee9048e@collabora.com>
 <ablRBViDR996euua@mdjait-mobl>
 <e894fe10-3780-465a-984d-01f5e8f4c97e@collabora.com>
 <ablWdjlrPLGhDJi4@mdjait-mobl>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <ablWdjlrPLGhDJi4@mdjait-mobl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mehdi,

On 3/17/26 14:28, Mehdi Djait wrote:
> Hi Michael,
> 
> On Tue, Mar 17, 2026 at 02:21:20PM +0100, Michael Riesch wrote:
>> Hi Mehdi,
>>
>> On 3/17/26 14:08, Mehdi Djait wrote:
>>> Hi Michael,
>>>
>>> Thank you for this nice patch!
>>>
>>> On Tue, Mar 17, 2026 at 10:32:21AM +0100, Michael Riesch via B4 Relay wrote:
>>>> From: Michael Riesch <michael.riesch@collabora.com>
>>>>
>>>> The RK3588 Video Capture (VICAP) unit features a Digital Video Port
>>>> (DVP) and six MIPI CSI-2 capture interfaces. Add initial support
>>>> for this variant to the rkcif driver and enable the MIPI CSI-2
>>>> capture interfaces.
>>>>
>>>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>>>
>>> [...]
>>>
>>>>  static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
>>>>  					      unsigned int index)
>>>>  {
>>>> @@ -631,6 +765,8 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
>>>>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
>>>>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
>>>>  
>>>> +	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL, RKCIF_MIPI_CTRL_CAP_EN);
>>>> +
>>>
>>> while this is the correct solution for rk3588, for the rk3568 vicap this
>>> will write 0x1 to the VICAP_MIPI_CTRL : 0x00A0 which will enable the water line.
>>
>> nice catch ;-) However, the TRM (at least my version) claims that this
>> bit has a reset value of 0x1, so the bit in question should be already
>> set in the first place. Thus I decided to *not* make variant specific
>> code paths.
> 
> Yes, the reset value is indeed 0x1
> 
>>
>> Do you see problems in your setup?
>>
> 
> No problems, it works as expected, I was just confused to see the
> mipi capture enable added with this rk3588 patch and not before.
> 
> I just find it a bit confusing but if a nicer solution is too much
> hassle we can leave it like this.

I agree that this is (while correct) not the nicest way. I am still
bringing up the remaining features of the RK3588 VICAP (MUX + TOISP +
SCALER) and it looks like I need to do some refactoring anyway to
support them. When I do that, I shall rewrite this part. For the time
being it would be great to have this merged in order to provide initial
mainline support for this unit.

Best regards,
Michael

