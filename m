Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6270D37C91E
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 11:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633078; cv=none; b=Jg2vb2JI4FYW58r1z0GQlABQRsXWUaoCbqSyNccI+s51/ep5inK4R4mQNCze5Z3aFFijd417dRVlv5Ep4BTWp7NIrTlNVeSKoMzXCcxzFWiwAzLs9xny+tiI4JZb5DvZNy+gPPEtSRrgIy8+Vp9eQ5IhNBSiUpFNoNJ7LIsyFsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633078; c=relaxed/simple;
	bh=fd19FTaGMVVzqTaQITPuDOdWwIOUoTiZOmIW9e1KBr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hToEtqE+X3Hr+h/qX1IDuE+kqyDGEx4OYLM15mi60bhaKgURJuYQPgtkYU9yBHEnRE3UunLoMzMFiLOdQezdwSSaCkW0z2PNOrmCW525HlQoqffWSzEicrleOhuZ8JJp2In7J1PWttvhiJH8K+iKOHj3ECTs8Ch+Uqc8tjxxWfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZBGNFeXP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZBGNFeXP"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4798bea72f9so5870159f8f.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784633075; x=1785237875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yeqi4I9sEox7f/jFm6z55uRHVPVe9hY0Yq9/CkVLr7w=;
        b=ZBGNFeXPeUkGfJWVkfL0ADvSXiVPb1OMzvZbtLUfraG+Ls5uoGoq9+zAmt4GPRBZTS
         O6pG6bcFJlwI7mswqiAXwRtIB+HvNW6XNvaPU5wYJfGMzalIIRhwHJ+uWVzjebPPiUvB
         nTCgnBM1z0ma8ZyZ+u96+AD7Yd3I/Not0/MmWsLgDsvw8n6kRhU03/VEmlOdEtrNlh84
         gc8qooMFocAEYetWUYHmuJ7fF7QKLHBCbvZTFTjdHdI5A8B+2oxzrIOIeQ7oEg4g0/Na
         J6UxHleVcXOqHJXP/wyxwhMLA6ZTMeO7OYrTDLc/Etb2wFmMB1hQcKGKmqvVObc+OTJa
         Hxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784633075; x=1785237875;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yeqi4I9sEox7f/jFm6z55uRHVPVe9hY0Yq9/CkVLr7w=;
        b=OOOftbZ+xkLRWjtSb2ffqfSh9oxA+4bQP/NupD7N+CNTYwC7lPhZcvUpDOgJ/hV5i3
         e9pgGKNyZmRbDmg4qmsxQu2g+U3LSfF8m8VYneV4wBn1ujleazIoqcFlhqMz71IP9IR9
         GS7vEqN+n5nRh63GLNdr+L8yUsNd+f3duj9fgoKgDiiyvN+pUY+f7T21PZM+xaNRStz8
         TcyFw/M/9dFqRcEJ0sK8xEaxA8lbGI1pbzgn4zk2QnK0+mFCf197sLnYAH+HFcg/XtFM
         q5Wc/trfy9ZhvFwOdAPhUt4ijbBVGA3QThCe9oKmjFRI009lkA49wcdF2XNZNc4uw21c
         rxfw==
X-Forwarded-Encrypted: i=1; AHgh+RpCLV9QSWVhePCdIOrQYQVYkwVS/CZBuvHSCVk6Fk5bhrNTFJO3OASzARX7B5e116jhM1Ntltm59U4GGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXvZrLciC6m2tV8mtE8GeWuC928iVLZJNI/pt1J5dBy96AjHaE
	V/fg3z8lo8zAFZzl9rPGJ8jY2OZdQxE0+Qi7+NOj3p/7a8otGIGrHcy0ywFz9NbB8fw=
X-Gm-Gg: AR+sD119K9a4wznNoEKMvSA+nA8jAz5ohDwOweEN7anl4q5DZDCzfaPva2Z2YCk41al
	y/VE1OI2pL7X7wpQTMvZETZZFANrFmqWuQePVZtwCdyxCFKVhf784yx2etlws/ux18+cxPAvp0o
	KGN4t9LaPf+xlneZJEtU8xBXElf8FIjy4lDf0uMnmf/Z3juqHAQcvKLvPiNR32sSUZkaUQ+xVNS
	F3LxuPg2DeLSXcz+bLPq+5JGgnb+v4sHvOl/SjF9MYgMRdjdbZpcrI4JaVzy5WD50fX5JiCrBpn
	+tbtnBjWPOY5M198fYs2BbziKMmSGngZaKphhcFzq+vL3zoBk/7ye6nKSWXAUSiDl05x+DF9Js0
	SR3L4zvJXD3d1vXa3wiXSJ0LZbnLPz7+8K2Q66r1CpqzX1apWn6HJ8t7iFl9IPCiJbmEgG2zf/x
	ENQqFH9N+GruSN6BY=
X-Received: by 2002:a05:6000:188f:b0:475:f0c2:5afe with SMTP id ffacd0b85a97d-47f6233b1c9mr22668066f8f.52.1784633074549;
        Tue, 21 Jul 2026 04:24:34 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.186.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e51c33sm32793828f8f.12.2026.07.21.04.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 04:24:33 -0700 (PDT)
Message-ID: <ec3d6035-d4de-4e38-8c72-b29a04b263ae@linaro.org>
Date: Tue, 21 Jul 2026 12:24:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <e8bc8ade-d699-497e-8c4a-fbdc03fcc549@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/07/2026 12:05, Vladimir Zapolskiy wrote:
> On 7/21/26 13:47, Bryan O'Donoghue wrote:
>> On 21/07/2026 10:56, Vladimir Zapolskiy wrote:
>>> On 7/21/26 12:39, Bryan O'Donoghue wrote:
>>>> On 21/07/2026 09:17, Vladimir Zapolskiy wrote:
>>>>>> +  "#phy-cells":
>>>>>> +    const: 1
>>>>>> +    description:
>>>>>> +      The single cell specifies the PHY operating mode.
>>>>> This has been reported before, #phy-cells shall be 0, the operation
>>>>> mode is selected by bus-type of endpoints as it is described in
>>>>> video-interfaces.yaml
>>>>>
>>>>> Two competing values are redundant and it opens a door to a wrong
>>>>> hardware description, the technical discussion has not been started 
>>>>> yet.
>>>> So as I said before, I'm following Rob Herring's input on this and
>>>> Krzysztof has given RB for this binding. At this stage, I don't see
>>>> scope to change it.
>>>>
>>>> Adding endpoints was already a compromise to address your feedback,
>>>> which I hoped would bring you on board with the design.
>>> That's my comment dated March 27, 2026, and it says moving phy type
>>> from phy cell to the endpoint property excludes the need to set any
>>> phy cells:
>>>
>>> https://lore.kernel.org/linux-arm-msm/e37ce438-12c7-462d-
>>> b2bc-1351be62b806@linaro.org/
>>>
>>> The technical comment is left unresponded so far since then.
>>>
>>> Since there is no expected phy cells to get on consumer's side, and
>>> since there is another link between CSIPHY and CSID described in
>>> video-interfaces.yaml, any kind of dependency of this IP on phy can
>>> be just removed, which serves the purpose of hardware description
>>> simplification.
>>
>> Rob's v1 feedback was consumer-decides-mode via the cell; Krzysztof has
>> R-b'd the binding with cells=1.
> 
> Unfortunately this is not a technical discussion to move forward
> a better hardware description.
> 
>> I'm happy to lock down this binding as-is on that basis.
>>
>> Are you arguing about phy-cells or are you actually arguing the entire
>> instantiation of Qualcomm MIPI CSI2 as a standalone generic driver in
>> drivers/phy ? Its not the same debate at all.
> 
> So far I don't review the driver, only CSIPHY IP hardware description.
> 
> In the current version of the hardware description one may find that
> the exploited 'video-intefaces' interface completely covers the 'phys'
> interface between CSIPHY and CSID, quite probably both are not needed
> at the same time, and the simpler 'phys' can be removed without any
> losses. But if it is kept, then its cell value is anyway redundant.
> 
>> As the CAMSS maintainer, I'm fully against adding more inline monolithic
>> CSIPHY init sequences. That could be represented as a separate
>> linux-media driver but, then that implies that _all_ upstream CSIPHY
>> drivers in drivers/phy are wrong, and I just don't accept that.
> 
> Other two drivers are different and should be excluded as good
> references, both of them links exactly one sensor to exactly one
> CSI-2 decoder, it's not the case here. Also one of these two drivers
> has no upstream users.
> 
>> The bindings have DT maintainer RB, and the driver has Qcom engineer
>> tested-by, review-by.
>>
>> Vinod, Kishon - Again, I'd request this merges as-is.
>>
> 

The graph and phys are different layers, endpoints describe the
media topology, phys is how CSID controls the PHY through the PHY
framework (phy_get/configure/power_on).

Removing phys doesn't simplify the description, it removes the control 
interface which is the monolith again.

We have multiple examples of this model upstream, cdns-dphy-rx + 
ti-csi2rx in-tree, with users.

I'm still kicking this up to Vinod, Kishon, request stands.

Multiple DT and driver users are RB/Tested-by on the schema and driver, 
lots of other work is gated.

It is time to merge.

Please adjudicate.

---
bod
