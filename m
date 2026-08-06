Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A1E435AB4
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 10:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010835; cv=none; b=Iz9A8c3O0xxU1v5aGcU+lJjS+MyG0c16ycdZuWBCSK4S2O6GjYX9/NTt0qvApKb3r7kDM2ki4unVrlxXcx04cDHPyLpoVNmKrc6txwvMxEtsdfPZmzdbr5Bd2TgPdQLSsFabfKI2cBakZZoLSYQHefmRKugnDQl4e8Bf60SnlfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010835; c=relaxed/simple;
	bh=vrlxjkRqJBr/96nA4lP0Rhr7mW/oLwAWnS7msdSZRyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KZ/ysmQICxFad1lpfzc4up5O+yc2PuwA8KpitRMGA+PGT7GHKq6UeHQ4CMN+abMrUGnbRN/KijmFCYSkOV1U+ktW0bjvVnYHpxZp4+MjCTzHu7lVEIU2dfR9yDwaoPUWe4gWxQdRyiwEliKFfRKoSruMZSaRXYqUr2J9glxUXCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dmja6bcW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dmja6bcW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4955158f26aso12980055e9.3
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 03:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786010825; x=1786615625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EJsvtNqHDCxAmT1UUowASSNNS2LeJPAA9Hw6UmnAiyg=;
        b=dmja6bcWpZwgNlmaQrjxHCUzjudMSki9DdKWsIE2Udvo6EnzglJ4MgmSj/w9d6hhRJ
         WJyL9W0UVotddnwWYdh/2XiWxo+1fc79QNyaWZAX5ixIrGyIAw3UvxvBtrMORYKMzkgn
         41j4CD5S84LTGvzvu+QEoyWcKQ7vhNl0XokgyLvIRj6qB/izajBNNOvVI4XGfHInPSd1
         l93DA0wGQIEK8OfAS6chaGJluhytzNyZBhQh3v8/3IJVb6WVFuHtAaiWwHlEtPV/Pl0L
         pVbPgpG8fHpKfBgBi/NsL0TdLnJyj2akXtz44V8/65vGqIVZCp5ts0fmVnOaFlsrA+JL
         JZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010825; x=1786615625;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJsvtNqHDCxAmT1UUowASSNNS2LeJPAA9Hw6UmnAiyg=;
        b=Ue87INh99w87IylZN7GfeNRhUuqviKJbYsG6GUoF9W6d5gK7BElzpuRiSO0yvPJMC6
         SiwdrwARGOyaMPSfGTRyfXjFe6bIwyVQHhIDCG1iPTOExpmDfOvbx74ntGYHNBNikKMA
         URywEz0E1R93w2nOEkc8cwlwA7eeJnuHW5LskXPNg12m6I8AFojo7U/9h6V+JG9jIo5m
         rPMGo/kwa3j7YnM5e0GPe3kYDpYSiTGA8O1S93psJ4vGNeNzpmoQI5hIoQnfGxEHdllg
         zZdT6CDvhxuGGBQfoy/im+R1tTfSf4t8Wn/WwxOAIAXC5OxzH+81cPkumssKYnDZCSUd
         lMZg==
X-Gm-Message-State: AOJu0YwnnycePGSp0gzvzxC/qrkvDI5fb5VGJjnGEqYiDMn3mc4445UQ
	H28lEQluh+WabhrfDRiZWZwCytcTykD3/vQ319cVbNuP31b6TR8YJuGOMy8kiemqlLU=
X-Gm-Gg: AR+sD10wZmup3PQnLYMFR1kEgM3aYk+OthLnJWYPWU+FSuqbf7SoCvzjGFP7KEenKXM
	VwPAZWuOVdOMs5tkpWdisv2RCiRln+jPzpgFfkN3XNsI+upBAVdbIgR57GVNfPEABhw6bNQTYJ6
	DDne+VBwJycqx4XZuMFzRMAntzPU30IKbSEPknK5XP5o/bpVDR2vXaMUBPh8A3TJw6HJDYu+rHV
	5H8lmC8R+SBwaKIgJHEUaL/AbR/pveGNgLqp/P+waMefJc6iLNB2fBYAfeQvIDfK8lCUBdP8+iA
	L8tMua8eeuZpENcwS3RPBCfJvmqWSSxPe5z9DXaEf2rdcF2/GgxYWf5trGAOvm3dHcA5vSrPyAI
	StpoWNjE3sDmAsb1rJU061GrEnTZomBwW4LkF7rCysCc7oaMo/N2aR9tC637sXciPBLivjdg/Ds
	UflaCVzAILtjB1w9mZyvwM8GKmooxVWJ9FjF4V8PUxkBfjlJjZFT2RfBcWL7MyGEKzTT3hSoinL
	BI2napR38yp
X-Received: by 2002:a05:600c:1f96:b0:496:c249:dd9a with SMTP id 5b1f17b1804b1-4994e71364fmr167132715e9.3.1786010825341;
        Thu, 06 Aug 2026 03:07:05 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.115.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49954213479sm48108625e9.6.2026.08.06.03.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:07:04 -0700 (PDT)
Message-ID: <ea0f1777-4615-415c-86d2-2a792ea42b3e@linaro.org>
Date: Thu, 6 Aug 2026 11:07:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
 Daniel J Blueman <daniel@quora.org>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <futJwsC0VjGSkjrB5PP9T0jBOVgWADaDAYyRRp-OZifaKPNtjcnnA59QJaQTdqYTeayZk9jY6e1jOfun71Yp5Q==@protonmail.internalid>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
 <689580d1-8169-41cf-a954-927e10135700@kernel.org>
 <d0983bf7-a708-46ff-9f86-f94fb6a92ba7@oss.qualcomm.com>
 <d6ffacaf-7f83-42be-a3cf-40ce00810ca9@linaro.org>
 <Ia82wa4IJDPkQZpTCt4MDMqtq1VGZ7DqIaJFNvV0MjaT3jjWrbD_iBs8RU7pqrIz-ZTMSK2irncUv7-PZ-fvkg==@protonmail.internalid>
 <8130900b-c9f2-4f5a-80f1-1e8567ee1b72@oss.qualcomm.com>
 <f252d83f-e0e7-4061-8da8-d2650f1beadf@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <f252d83f-e0e7-4061-8da8-d2650f1beadf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2026 10:40, Bryan O'Donoghue wrote:
> On 06/08/2026 08:57, Vikash Garodia wrote:
>> On 8/6/2026 1:24 PM, Bryan O'Donoghue wrote:
>>> On 06/08/2026 06:21, Vikash Garodia wrote:
>>>> On 8/1/2026 3:36 PM, Bryan O'Donoghue wrote:
>>>>> On 31/07/2026 19:22, Vikash Garodia wrote:
>>>>>> Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
>>>>>> Cc:stable@vger.kernel.org
>>>>>> Tested-by: Daniel J Blueman<daniel@quora.org>
>>>>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>>> What about venus ?
>>>> Plan is to get the reviews for IRIS3 family SOCs, once we have a go
>>>> ahead from binding/DT maintainers, i can either bring in few series
>>>> for remaining venus and iris SOC family OR do all of them in one
>>>> single series. My preference would be to add in multiple series.
>>> I still don't see why we can't just set
>>>
>>> minItems: 1 for the memory nodes - implement a fix for stable and then
>>> iterate around this new way at leisure.
>> you can follow the guidance from binding maintainer [1] and continue to
>> discuss in the same thread if you have any question.
>>
>> [1]
>> https://lore.kernel.org/linux-media/2b0ea2a2-c3ef-4147-801b- 
>> af41733fba7b@kernel.org/
> 
> LoL seriously - system resetting bug.
> 
> How long exactly is this going to take - do you have buy in for sub- 
> nodes and when will that get merged.
> 
> For reference I do not care what happens my concern is an unspecified 
> window where stuff remains broken and we take our leisurely time about 
> doing something about it.
> 
> If we can't target something for -stable then this driver and venus 
> should be marked as BROKEN.
> 
> ---
> bod

I'd just like to be clear.

As far as I understand it a bug that can reset the system has been known 
about for months on the qcom side with little action to remediate in 
-stable.

That's entirely unacceptable. Litigating DT bindings is _not_ addressing 
the fact of life, that a system resetting bug has been sat on for 
months, unaddressed.

Daniel proposed a fix that will stop that reset which is being rejected? 
Arguments are being made to not mark this stuff as broken. And the 
debate about how a DT change should land is still ongoing in this thread.

I tend to think - absent an obvious an immediately applicable fix these 
two drivers must be marked BROKEN, the alternative is to apply Daniel's 
fix and then live with the results for the bindings.

Since the DT schema change is still under debate - what alternative is 
there ?

I'm not far off sending that patch now myself because I'm not seeing 
urgency on fixing this and TBH that's pissing me off.

As a user of a system, I expect resonsible and honest behaviour wrt to 
bugs, not architecture astronauty while my system can still reset 
despite perfectly functional fixes being available.

Great you want to do sub-nodes in DT. Not great, that's not agreed yet, 
even more not great - the venus stuff isn't even on the list.

Please indicate what should be done for -stable this week else both of 
these drivers need to be marked BROKEN.

---
bod
