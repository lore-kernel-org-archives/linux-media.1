Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872043;
	b=Yg5qN+A3X5z5wGuQ0w/EKd1mlK4m+MK418RlTaN6mc2aCqlqCRBBvyZ0dq03k8sYAW1B
	 Gwfdvsv2E1bVqPSnhByqppSfr76BwB8kt4QKlOsuNV551zNOxNTFVjaYPIRYJzucKs3cU
	 sThzJQVwaMLdOTXjnL2dZ8dxtr6wsa0+3Uj6FIOZqWxpQ5p1Y/BSuv3i63FSuGSSkYaMI
	 wkOv//baClU36+BuDB2HApIIG64SzLRZrRNjKyYGfDu0U4NV2SmY65m+0HLpbN3RNRZjt
	 JnSJyRx1mt0phgSLinXQsRTHXZz5wA78tDWh/cn2rMB+5iFAlBosBGMjrn2d3MpVhxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jyLL8ZmxrAARfweF0V8YGIXZS1Pegf4tg2ZATRaSJHc=;
	b=IlE1Bb6l5ssoiJAzMmpFgrJJnzaHFXMlgm9baiINZekPnyNlW3EBLa7VVsHxv3fU6lYT
	 TJrOdMEy75SFdJMOXMfU52prPxcDbfUhLdLRgvc58ggRgsNQ48sJAMwe/004JPtkU615s
	 C3OXOmZSWeZuD3ZM5RCqTx0JyMdPd57xTWyOAEBRIb576e/KfYkG85wzeCEXqdQhL8xdP
	 SAqQ6jzMyHIUm3I1aMf1jlgAyvKflUMkLpMvTNbZ8az4BewrP6YWyqCQHDpEZM/9SOTV5
	 vMqSoHe3oxQs26CfqYZVnwJZzv7ZjtZuwrzp+ZnkyN3nx+FJx/2vIE8xmQ1Q+YHYk8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RASG78SQ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A33C606A331
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 09:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A33C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RASG78SQ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a208d93758so18465505e9.3
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 01:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872041; x=1794476841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jyLL8ZmxrAARfweF0V8YGIXZS1Pegf4tg2ZATRaSJHc=;
        b=RASG78SQJZb7zly3rDtTUgyOxzbegHId3oxXTHrgcPPTO7wKUsm28sWnWodJU6lGHj
         Xl4lgSwi6T8p8iO48+EYJyut2DlkqBgDidTj54wXHNwFYg81frFZE8Q7apcHbehGyfUA
         oEBrf2dIpQtOCwWHURtTzf2Dzmg0FgcsA/tVffLX9VOTMSbrVTczidrPCVBSUmPfF8xr
         VdCf7x+UzAcuXIV8ZgZ7/IHSey42eTXQt/qVDbQZL/NKaCBoqsLCKXtWNZ4qjue5YjS9
         3KNNVGfvWsr5ovwtxywRvbMkqZpXcjcM2JDvQJQyfSpzT0jiqJ0bYD4srOLe6uto7P4W
         fyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872041; x=1794476841;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jyLL8ZmxrAARfweF0V8YGIXZS1Pegf4tg2ZATRaSJHc=;
        b=qfkldOOc6tOgfwX/VrF+vOf3H+XKQH5v5QFCjV15HeAuaJdqZjjdlnPNnLKoKj5ajE
         G6XD1vTN6d0FQr1HCj+P5TixA7H11xY0ffiYXL7EU8/2efgmxIXs5ctKHjUObRGX+52L
         pwdSIhPmyCEFJC7+u6rc57unUzK+Vr9Zw/Zfj6lN5uy3kNpt+ZdxK9Dev8OIQXKGVx7D
         nd5AW1N4yPxeuOVueNGxz6dDLYQ10+NNI7bWYVuUIP2tH123Mlk8io2VLINIyeg/L/F7
         xrH5Ka5QwhbfwnNsFKfIJ7Sq+hkxJ9pGURYQF+6IE3nLYvBP7t4nLDAWjHBpBsVX/GBp
         oD+g==
X-Forwarded-Encrypted: i=1; AKwUvByMSCqtKA8hIonyTM0FEu1U6QFTqq1hM8lg7cLFf05NQY9MInKDiEkjVOADBvSLD4+f1RbbVdUPe1bEbQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8hjUvFnVea7IjEeyswS6Yh+W6NPDPOBMPAB6fs1w6JIaanrfFa
	Hmk67K6MYt3jaSly4GQpZprqcxeQgi1W1WDumVo5imQ05bwS4j4pE2v2z494ft4NjsM=
X-Gm-Gg: AYBFou1OdkxI0Z1o1Bg7EbH1zXlffL+DDrzEkJj35Q4gdzVwecqcvP4C3GQG7xHEsH/
	+SCKvcm/MKs8z5ZObUcoPX3AFGdOskbW1ld7AFeLd2eJcpYuxP8thRWhH7rL/q7XBZmR3g/2Sj6
	VbZMMwXzsjHS36+DirHFeoG4tNkruBKXVuYdJupM5G5hyIy571jt+UkAGnR4PWZybC77aI/uAS4
	WKvIeQXqKlL2tSU4JrGO7VwQX/M8Bk7Etgk07DomUJ+i43aOXBUxQCetOIVlleEebAK1a25yr3N
	6p39GSCK3ncOM37uDboneoWmFMkwvoazWUTLa8uRFeuATkoNlMrmQxjhEuezEguXQcOtaEq+Q15
	WQyxDCTB1Px0jCPQrttiTQpQxe5bHpE66eQ2fY1eQFl6NfpYBCso+8WMgdrBo/z5C2ZySsVfaiY
	VZ/a4u9Cni1QFbu+eux+cjQqGoVPFmzm6zCEPqkGYvWm6SjZk5ogMSt9THSe0kqwX2pdnOEDb5x
	mnTJPpJGocqM5idAtHj6ZlhdRUOVCSFJkoRgQ6jLVwW+zi1gb7KP2EUOEcvPSNc+K/iido/yxSu
	Y++pJoec3YrFr/Iq4ePnq0pYGn6yWl175PL4/nn5
X-Received: by 2002:a05:600c:4f86:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4ac18b7df2cmr429163325e9.23.1793872041405;
        Thu, 05 Nov 2026 01:47:21 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d71dsm8886594f8f.36.2026.11.05.01.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:47:20 -0800 (PST)
Message-ID: <5ba03b8e-1d51-4e66-a802-37e63814f5d5@linaro.org>
Date: Thu, 5 Nov 2026 09:47:19 +0000
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
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
 <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2026 23:16, Vladimir Zapolskiy wrote:
>> +maintainers:
>> +  - Andrew Gigena <mail@andrewgigena.dev>
>> +
>> +description: |
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm8150-camss
>> +
>> +  clocks:
>> +    minItems: 42
>> +    maxItems: 42
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camnoc_axi
>> +      - const: camnoc_axi_src
>> +      - const: cpas_ahb
>> +      - const: cphy_rx_src
>> +      - const: csiphy0
>> +      - const: csiphy0_timer
>> +      - const: csiphy0_timer_src
>> +      - const: csiphy1
>> +      - const: csiphy1_timer
>> +      - const: csiphy1_timer_src
>> +      - const: csiphy2
>> +      - const: csiphy2_timer
>> +      - const: csiphy2_timer_src
>> +      - const: csiphy3
>> +      - const: csiphy3_timer
>> +      - const: csiphy3_timer_src
> 
> Please switch to the new model of describing and exploiting
> the stand-alone CSI2 PHY devices.
> 
> Any CAMSS drivers based on the legacy description of CSIPHYs
> should not be accepted into the upstream.

I mean we are just adding a new define for a SoC here - not a new init 
sequence.

We could move all of sc8280xp, sm8150 and sm8250 to a new driver 
topology but, I don't think that's a reasonable ask for a small change 
like this from a new contributor.

Certainly would welcome the transition given above as a defined and neat 
series but, I don't think there's a need for that to include this SoC in 
100% existing infrastructure.

---
bod
