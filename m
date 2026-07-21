Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C662C31F999;
	Tue, 21 Jul 2026 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784639995; cv=none; b=IngXvOkdNnwmOVuFbtAFyW9md2VrLZ7x+JGwLVynZ7B3XofKF9W1X3ffI0fwb3zfWqXlahiIm3ro8UKxwXEe/3jITur+POpHZ3+lP/8351VQTZu9XsTYvZuDEEWJnghHNyrSo8RkfBvXlBT5WJ7gNKQpUTPYvfvAxadiKD5W3c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784639995; c=relaxed/simple;
	bh=Tv9wpRV0eedsjEJJpl1BhaeSjPz58Ru/YSsNOKrR+u4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fKsNhB4laBM6qTv8QdTJeRZt+VXHMYkrX3SsKd3SHOeqtZAppAcXOF/2+6LZz5qruvLv7tj3/nuhPgVltEgGCYLh1e4OYpmfv6PGhGokf2Ra62yxb2vstpnGh0NeePjUDhp+bvJc6VGlLxv6Z8bZPOOlMAs7UrOgKIOvtPQW60M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DATqEc5+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DATqEc5+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F8D1F000E9;
	Tue, 21 Jul 2026 13:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784639994;
	bh=6mRC81lpYWqjArUJfT8WHzdSYdH8busT9c5Y72tL6L0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DATqEc5+6t07PN5kJO74T0PfktLb2rqMqdO08KQ4hl/kBClpvjM7v5yDcEIxIE76/
	 bUz9YKJC3J4IeNAR27vOwzRqVsQvMYi3OWYHuQl4JyqXW18bc2ZX0PlaivbXbVK/rN
	 uJeX2mdJIDsZ1yTYuJSgItjuuyqGYr3ulU7B4LIcAHwjzT3ynpW0h52CxkyqBnsths
	 FZo2NL5vS5MApW0qjD6aV4W0wr2pgaaXHVvyYrro4YbvrXqnyzBLeyAAmqJ8ECl+3C
	 4OmjZOft2h/8QwCUt3vwUU+tUCIiOqlaeW+J+pOL0Kmo1mZTPEL0+TIWWCuL9z6DyZ
	 8Vo2OYkSrAV+w==
Message-ID: <1f128571-ed46-4a60-9594-74fdd5f440d0@kernel.org>
Date: Tue, 21 Jul 2026 14:19:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
 <LyWJAb2qKsAFTMHNJUce9VqoqbkFKUQanb6z8ziA63RYZ1P9jj1XpA83uGPvz9m4QnWvEjJFK8dGD_8EtioHVQ==@protonmail.internalid>
 <0da6d314-bfa9-493a-bcc6-8c3b75751d0c@linaro.org>
 <88ae6662-cb85-4e3a-bbb5-1b536348df34@kernel.org>
 <_t1jiMTX3iIXhUkTDz0Cbh_uZhdUK_Y8vlIwxt1VNRbuKuRnpVCWabal-b4AuFrVaKrDnQSFOWtDn6-VCbS3DA==@protonmail.internalid>
 <345ca98e-09f6-4965-87bb-e64dac096498@linaro.org>
 <c236cf94-a775-4158-88db-9a337c7fa862@kernel.org>
 <e8bc8ade-d699-497e-8c4a-fbdc03fcc549@linaro.org>
 <wzsAes-UM4_r8scRyy_yhd39ZdxvT8W9VroVPOGWABLsw7MqR05o_z2MwhgiC1gTSBgfVHpXWADbsqoIOsR0Uw==@protonmail.internalid>
 <ec3d6035-d4de-4e38-8c72-b29a04b263ae@linaro.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <ec3d6035-d4de-4e38-8c72-b29a04b263ae@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/07/2026 12:24, Bryan O'Donoghue wrote:
> On 21/07/2026 12:05, Vladimir Zapolskiy wrote:
>> On 7/21/26 13:47, Bryan O'Donoghue wrote:
>>> On 21/07/2026 10:56, Vladimir Zapolskiy wrote:
>>>> On 7/21/26 12:39, Bryan O'Donoghue wrote:
>>>>> On 21/07/2026 09:17, Vladimir Zapolskiy wrote:
>>>>>>> +  "#phy-cells":
>>>>>>> +    const: 1
>>>>>>> +    description:
>>>>>>> +      The single cell specifies the PHY operating mode.
>>>>>> This has been reported before, #phy-cells shall be 0, the operation
>>>>>> mode is selected by bus-type of endpoints as it is described in
>>>>>> video-interfaces.yaml
>>>>>>
>>>>>> Two competing values are redundant and it opens a door to a wrong
>>>>>> hardware description, the technical discussion has not been started
>>>>>> yet.
>>>>> So as I said before, I'm following Rob Herring's input on this and
>>>>> Krzysztof has given RB for this binding. At this stage, I don't see
>>>>> scope to change it.
>>>>>
>>>>> Adding endpoints was already a compromise to address your feedback,
>>>>> which I hoped would bring you on board with the design.
>>>> That's my comment dated March 27, 2026, and it says moving phy type
>>>> from phy cell to the endpoint property excludes the need to set any
>>>> phy cells:
>>>>
>>>> https://lore.kernel.org/linux-arm-msm/e37ce438-12c7-462d-
>>>> b2bc-1351be62b806@linaro.org/
>>>>
>>>> The technical comment is left unresponded so far since then.
>>>>
>>>> Since there is no expected phy cells to get on consumer's side, and
>>>> since there is another link between CSIPHY and CSID described in
>>>> video-interfaces.yaml, any kind of dependency of this IP on phy can
>>>> be just removed, which serves the purpose of hardware description
>>>> simplification.
>>>
>>> Rob's v1 feedback was consumer-decides-mode via the cell; Krzysztof has
>>> R-b'd the binding with cells=1.
>>
>> Unfortunately this is not a technical discussion to move forward
>> a better hardware description.
>>
>>> I'm happy to lock down this binding as-is on that basis.
>>>
>>> Are you arguing about phy-cells or are you actually arguing the entire
>>> instantiation of Qualcomm MIPI CSI2 as a standalone generic driver in
>>> drivers/phy ? Its not the same debate at all.
>>
>> So far I don't review the driver, only CSIPHY IP hardware description.
>>
>> In the current version of the hardware description one may find that
>> the exploited 'video-intefaces' interface completely covers the 'phys'
>> interface between CSIPHY and CSID, quite probably both are not needed
>> at the same time, and the simpler 'phys' can be removed without any
>> losses. But if it is kept, then its cell value is anyway redundant.
>>
>>> As the CAMSS maintainer, I'm fully against adding more inline monolithic
>>> CSIPHY init sequences. That could be represented as a separate
>>> linux-media driver but, then that implies that _all_ upstream CSIPHY
>>> drivers in drivers/phy are wrong, and I just don't accept that.
>>
>> Other two drivers are different and should be excluded as good
>> references, both of them links exactly one sensor to exactly one
>> CSI-2 decoder, it's not the case here. Also one of these two drivers
>> has no upstream users.
>>
>>> The bindings have DT maintainer RB, and the driver has Qcom engineer
>>> tested-by, review-by.
>>>
>>> Vinod, Kishon - Again, I'd request this merges as-is.
>>>
>>
> 
> The graph and phys are different layers, endpoints describe the
> media topology, phys is how CSID controls the PHY through the PHY
> framework (phy_get/configure/power_on).
> 
> Removing phys doesn't simplify the description, it removes the control
> interface which is the monolith again.
> 
> We have multiple examples of this model upstream, cdns-dphy-rx +
> ti-csi2rx in-tree, with users.
> 
> I'm still kicking this up to Vinod, Kishon, request stands.
> 
> Multiple DT and driver users are RB/Tested-by on the schema and driver,
> lots of other work is gated.
> 
> It is time to merge.
> 
> Please adjudicate.
> 
> ---
> bod

Had a brief discussion with Vlad, Neil and Vinod

Resolution:

- phys = <> retained
- phy-cells = <0>
- bus-type from the media-controller
   Already specified with camss still aligns with Rob's declaration
   "the consumer defines the mode" so I'm comfortable with this
   compromise position.
   This will still facilitate CPHY work/mode-selection via
   phy_ops->configure() with how to define the CPHY part TBD.
- data-lanes = <0 1 2 3> valid
- MAX_LANES 8 instead of MAX_DATA_LANES 7

- v14 with these changes shortly.

---
bod
