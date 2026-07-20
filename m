Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A1D38B14B;
	Mon, 20 Jul 2026 10:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542810; cv=none; b=HDcBO3GQ8HPfDBuDtcWloscU5m2KtctlVqgXHe0XACZRs7tRT1Hn4cv1/tzQJrmz1U9DdQirGsiXZ4d3orBlGcv0wdi+350IATJlI5Qdc1QhIy76JShoejDyAS++CwYxt4rtRQD0oCXfRTbkfPXaOf4Kj1QwcRMCB3iZ1TlXQc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542810; c=relaxed/simple;
	bh=oGWuaUcOL1QmbI115PJtc7Rq/OQIc2BCMnv8syUh49A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZi66yiUOp/zQJtTs+CnTU6b+PyZ+GkWnHWwYx6hp8fqMT0Ap/qn4wVK2ksRZj7ZA9vgzBBTzYVAJ4DxjNksYW2pwXo92qRnub5ZdtlJzZZj7Ch1eocIhDtFhMhMPgjXqiL0h6Wl3Um4pGdRX0eWoYDhZWum0RFMcSZg90k+pZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqKRpsmt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqKRpsmt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7224E1F00A3A;
	Mon, 20 Jul 2026 10:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784542809;
	bh=QhxqxqkUf68mxrkHLa1v5JFt/ORLQtC9CzYU1BcJNqI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AqKRpsmtrQk0H58JCK+0kvgGhS3oC80MBD4w8wKtNf2ahNmVG8rda7GPMDAJfwBBB
	 Mmefqf/ZBB7aDtBYk/EJ/JcfVphQdcBVW/H2jXDrh4f/y/oEvFBqAGuefrP+PwWNfa
	 kwKeMrX37x3WwvxH738EBxFX9ogJTxjfNoisit9Xwzey4abuROP50uM0Q3KpvJ40W6
	 Fj1U5Bna/ZYj9r/ZHr0egi+JEBkHHKx8v9JqpmlHfP/dH6WbIQXTTi0I1ZSyEdvF7/
	 QRBIAskUrOySgzcCxbNCjmtv3n39YrSXU9dmX1+GCttu2Ows/0KFsHFKALlMZ2/JoE
	 jXSJzgSFFiKpA==
Message-ID: <8558035b-d825-4e56-bfd2-551cff51f73f@kernel.org>
Date: Mon, 20 Jul 2026 12:19:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
To: =?UTF-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "fanwu01@zju.edu.cn" <fanwu01@zju.edu.cn>,
 "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
 "haoxiang_li2024@163.com" <haoxiang_li2024@163.com>,
 "tfiga@chromium.org" <tfiga@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
 <Andrew-CT.Chen@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "ribalda@chromium.org" <ribalda@chromium.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kees@kernel.org" <kees@kernel.org>,
 "rongqianfeng@vivo.com" <rongqianfeng@vivo.com>,
 =?UTF-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
 "hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
 <20260720012056.1026551-9-kyrie.wu@mediatek.com>
 <20260720-gregarious-satisfied-shrew-f71cba@quoll>
 <f499f2c3-f31d-4c2c-84fb-d1d9d95fc868@kernel.org>
 <a9123dce5ae7ef184f5640b12e3e9427084ec542.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <a9123dce5ae7ef184f5640b12e3e9427084ec542.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/07/2026 08:26, Kyrie Wu (吴晗) wrote:
> On Mon, 2026-07-20 at 07:49 +0200, Krzysztof Kozlowski wrote:
>> On 20/07/2026 07:46, Krzysztof Kozlowski wrote:
>>> On Mon, Jul 20, 2026 at 09:20:50AM +0800, Kyrie Wu wrote:
>>>> Add the MT8196 compatible string to the MediaTek vcodec subdev
>>>> decoder binding.
>>>>
>>>> Compared to previous ICs, the MT8196 supports a 10-bit decoder
>>>> and has a decoding capability of 4K@120fps. It also supports
>>>> 36-bit DRAM IOVA address and Video Power Control to optimize
>>>> bandwidth and voltage usage.
>>>
>>> Please wrap commit message according to Linux coding style /
>>> submission
>>> process (neither too early nor over the limit):
>>> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst*L597__;Iw!!CTRNKA9wMg0ARbw!gDjbq0EZNkhLTzuJM_w5PopnDFej1mG4qnkRFgyoiU7Dvhm7tj3MeG5eZYNGA0L0G_61j-cmdIxORA$
>>>  
>>>
>>>>
>>>> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
>>>> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>>> ---
>>>>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml          
>>>> | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>
>>> Acked-by: Krzysztof Kozlowski
>>> <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> Actually no. I checked previous comments and you received feedback
>> which
>> you basically ignored, so explain why this model has flexible number
>> of
>> clocks
>>
>> Best regards,
>> Krzysztof
> 
> Dear Krzysztof,
> 
> As mentioned in the previous version of the communication, the
> information regarding clk was incorrect, and I have corrected it in
> this version. 
> 
> Thank you for your attention and reminder.

Read my message carefully instead of responding whatever necessary to
make me go away.

NAK

Where did you explain that device has flexible number of clocks?

Best regards,
Krzysztof
