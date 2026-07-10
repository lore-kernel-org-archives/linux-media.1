Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52905405C3E
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678809; cv=none; b=Vo6aSaL7zLPqAhMDzBwiVed2fG9DvxVHOMojyg3OsmIqP5L99XY9qQfCyRVLvFj6N6zffn8zny/azaLWG1IxCgAsHIL/prs1cE8TBLcN5Q3Agn52f+NrRnJJ/B4/p5EpwvczKcVbPI6+JjvqHu8NIEhiRoJ6/j4NCyo2gG9vk/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678809; c=relaxed/simple;
	bh=1dzTBexqxGti69sqvBwGnRyvqeh7Lyvxce7lH4TfQ/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tO2+b+fYXlyqBOw1FbZTkjzgI673jBLp5zN2XTS5+1fd+RsYAlRhiYh8xBlFXcOX2FJQ2ULhaLpPxcxvawMcBqy476s21X+5Trs1qgLOzFcMwYtfXq9arzSf52+3rmZ4BScyGIrCsdokQx4jU7jR22ICSUnKjfOXSjXiFEOlBy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o4z+NOca; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o4z+NOca"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso5718485e9.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 03:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783678806; x=1784283606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1wsFkUbAtuG6pFWmJltsHSUWbIpvemvXO5QB3k7ZUl4=;
        b=o4z+NOcavdngiaT3I5g2DPgoylzGVWdYWbIpFvl+jFrcGALtsOZQKb76hNqCU27/sg
         pjjnOJfKDhVYV+la3wWRpOjw2n1oYShSG8b+r48hr51Dh/OxsoOJst7Uemoap3AYuxSD
         43tQ1SjlCPIOHxwUAGMWYV+0dPxPfC6IEWAcw99UxmHfYfqD+ReIHZqCVCv+x3VCrSo9
         wUBt13JM9nmdqbajQ8k5WbUQEodAgq7GT/44OVulbY5T+vZQozETkqq5foVwR+Be8QWR
         ThWSCMTiuiJRC7b7ViU+gzktI5Et0T3RxNAeGnQDdZJx4SiD9x2PzS/D6kT5riaf6NwU
         WNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678806; x=1784283606;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1wsFkUbAtuG6pFWmJltsHSUWbIpvemvXO5QB3k7ZUl4=;
        b=jSSpUTRp7Y4dXhDlPsJR/rH2jNdkmZA4lOcDypKWgI9haTwBU7cUQiYWe4omTfsAk5
         LNROkkTlBM3bqqGSHjvexHL5lgIqY4qsrOXa03Bid1ck0xblET1iOnQ4zgQNFbjSOfuy
         5TH4A2fQeIg09sVkhWzYeKKZf9r4jkv9QPW4+ztc6PDNm1Z9csB/7YLfKCZJtWypXZZj
         mieso6SaozmzNGawx7OwCaVNoigro7Kz0D8ktin1hDCDvV0KYQfgkOsEEwT5qBKLZRRr
         3zEGnJs8O3/CTHWGthUVfA2LID1elIDenixQSu+Wkvn+MmTTt/RTukmyP45JflfSS9Zj
         fwFw==
X-Forwarded-Encrypted: i=1; AHgh+Rrucn0/XZ+weA/nlKNsf1R79zgGQACzdqYqm53EY8OVNLI0JsyLOzk7an4W0gaNKaAAj5IG6UR+u8tAbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiMre9nBdSFESUzJ/rIKak+V5FeyfPtmGPJP0v5OeRAIueM7Xe
	JrgAgXhLFK3soUV7kK9zQTkI3ArK19d7qcI3LdNomithQt/TUKyb1ncrlqxLFR26DrY=
X-Gm-Gg: AfdE7ckxr0H6S/SPKP7+qlt++IKOasYVuw2nP2g0jTwMHyzCbQpUWhhA7lU+6+5n9Nh
	90nJMAi/4kl+jIK6T++m2rC2a9AXv9fCMW16eVdAfN837l+0d1eezItSiI9RaU4lhhVTOLoKcTK
	+yCZWt+LDPr/tTOT7Dg4WXf7iIJWVuGoNiuBqXBNlqdPPcYmy/5iUyzvJrN+nCLVJFPU58bJDGU
	tZOfxxUJAX1uTBH0uUKqxxegspuiOWGzfxDc08gozmy+rmaCwQXMSpGfkeldse3oOvMPDkLXqJa
	usmcxnZc503BuQpC3YUX6j9upf6lKvTkfvi+nVJriqOO9x9lCczGeT1gIvyqq25FIpnFcnSbxMj
	poEfckEkD5UhIJOK16XZBHV9pGRBdRemXgxRdy+Va3RWUbApDySLRdG4HsRxGxW4YKAIxjAdwoM
	sbW8S8sn0BJIy/m3kv529+/VFS
X-Received: by 2002:a05:600c:a0d:b0:493:c389:d434 with SMTP id 5b1f17b1804b1-493e684a968mr116415905e9.15.1783678805526;
        Fri, 10 Jul 2026 03:20:05 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.243.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d53absm125534085e9.6.2026.07.10.03.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:20:05 -0700 (PDT)
Message-ID: <d5475ff0-1296-437a-89f4-1d3d6e9ac637@linaro.org>
Date: Fri, 10 Jul 2026 11:20:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-4-51207a0319d8@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260710-camss-isp-ope-v4-4-51207a0319d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/07/2026 10:04, Loic Poulain wrote:
> +        reg = <0x5c42400 0x200>,
> +              <0x5c42600 0x200>,
> +              <0x5c42800 0x4400>,
> +              <0x5c46c00 0x190>,
> +              <0x5c46d90 0xa00>;
> +        reg-names = "top", "qos", "pipeline",
> +                    "bus_read", "bus_write";
> +

Does this register space cover the entire OPE i.e. where are the CDM 
registers ?

We should map those upfront even if they are not included in your first 
drop, we map CDM regs in the IFE even when not used.

Also, I looks as though you're missing CDM S1 SID entries in your iommu 
definition.

---
bod
