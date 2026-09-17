Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC92526AA8
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 13:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651684; cv=none; b=QPZScDIUhwZDvDu8DrIn8mVc5UekyKdggYWTWhOVzTFYMQUAzrn4N6GoX+dRS7qSGCeyny+T68wnnTXb7X93WCXTqlaYTHPMX8k2t+lArkX6Uu4+WDibzCnAU8PfmPenHA/vNtS3fcL6W/pAKdPAGy3YCeIHqXDDvqkW+Z8gGlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651684; c=relaxed/simple;
	bh=TX6xhS4Vhis/cVqkO7iD2bmIOPGH7N8MJNCWfFGrVr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mTdRLj7AISWH/W39hedn7brJTmpFXAoAcsU97iIb7GbqSUcfs6d9x8+K7d8KCpC3uYf9iCS5epm0u2bRVzx8oXvcEMvugYHG371I4YOR4+j21F1c5Ur65LH+wmfyIQJYxHJuigfilkFMmpKPLUGuYl6QbIwEOd+TVCIrGqLhETk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OJPx/VkR; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OJPx/VkR"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98604f6b4so1315182a12.2
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 06:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651676; x=1790256476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rajuo6bzngXrBhLYotQd0SgbFpshLprnWII6O4/hths=;
        b=OJPx/VkRtQ1fIdASIxegqFHT0i3xYB+awFm099+ZIEeVsYTarq+xHv0polyYdj22JM
         BHvYD3HpW5LLY1/Aq8nBlVzmuN57UM6PNT5gIDypU8XJwCcRqvqCmU7RAddDDNNjgdrS
         l+cZxshTdscz6asGb3tqJaQeBOYVFwmuFO0GPKGphIrO9LfQv81y+dlfRDREHa1+jy1Y
         ALBFDSqNVCwkuWI7zjO2/kwMmxKRnYoe+9z+Ugs8VuwC6HHpsOkYI48vRu0NwfJ1pk75
         M/AG25D3IuNO7Ftmcd8Oo0IgT18PvFy/PPpoj833Kj7kh8Eil9yogKdpr9WEo8d+BaXY
         8DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651676; x=1790256476;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rajuo6bzngXrBhLYotQd0SgbFpshLprnWII6O4/hths=;
        b=itQ6tmKcsN/5SQzzA29/AbONW7yXh6ZyzArqMgO+WVBfo/zUp4/O+Su8WqP+6HPosu
         orxA5zlQOmeA4yj19nyXGRPmANUuQVI7rHh26KI7FeC1QkSu2+bLukyf+feEvUZERkFG
         3v+n4iEsSDi+EQBdyazQ4sv9bWhp6YtBNyJJLBkFDH+IJnATIWJ5dxrlzP+5HFbJfMnX
         F7i3npYqCrkCxdwMbIec2GawxfE1t5gAiTHAATqdUM943rHugaHfPSUVnzygpdm9OzC8
         6PjvEKSbXzZnZMjQdJ1IBlXrbhirIinvS+7S80SRbmnriqM+Nyq6zhXFRBL7MDBftxwC
         qNng==
X-Forwarded-Encrypted: i=1; AKwUvBw36GmLOFcxsysHJZM2SPA5vWqJ122udWLldXIxYqkSKjErrssA2/vndWzPgWf6msGJOu/HYcf7ufimSQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lIQTVqw9ZoJRhp5zymcoYy6yAEqeu3Q3ZJl0B26qJfRCcBkHuq
	cPcxjSOj7PAHvrnY64EepAGUa4U5/2U6GXUAoKr5yaVypSJvUCK0aZeEzZCMzngU61g=
X-Gm-Gg: AYBFou2Xq7kqWlPRsIIOZzKIOl8jSSZ4uVt0pIaCON2XUQYEjuodw1fJrJ6WmeWQu2k
	yxrwqR1NOOtLws5BXEA1+jGvOchVs2E+unr7xQktYDjSH8xk/enphUDrecYjLuL3K+cN0Jzk3dy
	VpJ02/ZIsVc+4sk71625t/g2MrMG9VZxMx360Ztmxxmud+BdVQH6s+6Zv/A4E6c8h80Brx9Nrzc
	1uBZ0wxaeGpEzjddwslRG8V/QdwZkwdAL9DTWsS0aUE8fvLlE9vbsQlF9XiIwsDbDtO9ndAGU4a
	KJadp45BU5GPKZ5si1DwojD9FJAEMYZfMVdnENtcM18cNs6GHvbFnL430BKnlYKIkWRAgVFMo1k
	UcGXsP3vrr3OiDsLOlcwgbjRNhux2gGbT4jW3wCGUUtzhDr0vPfJOB2z+8J2+yKH5o36zXI9+7L
	32OL4QEzzcnKWvGoNsWOpCFBY1xPKEqUiUEdafkiB4JtlsTj1Ey5+CUbMMLD/l0+sRJrAl6+BgB
	oSu10vn5fU=
X-Received: by 2002:a17:907:d0b:b0:c26:19de:9acd with SMTP id a640c23a62f3a-c29e5308381mr463526666b.37.1789651676039;
        Thu, 17 Sep 2026 06:27:56 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de453f04sm293940366b.15.2026.09.17.06.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:27:55 -0700 (PDT)
Message-ID: <37f182ad-a137-4066-9e94-b06be2cd03da@linaro.org>
Date: Thu, 17 Sep 2026 14:27:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 3/5] phy: core: Add devm_phy_get_by_of_node()
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-3-f85c9103177e@linaro.org>
 <9e8ae55f-6d95-48a9-bef1-ab653d0f1c7d@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <9e8ae55f-6d95-48a9-bef1-ab653d0f1c7d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/09/2026 13:32, Neil Armstrong wrote:
>> -        dev_dbg(dev, "failed to create device link to %s\n",
>> +        dev_err(dev, "failed to create device link to %s\n",
>>               dev_name(phy->dev.parent));
> 
> This change belongs in another patch.

Doh Frank gave me a comment on this and I just changed it without 
realising this isn't in my series at all.

I'll drop this altogether

---
bod
