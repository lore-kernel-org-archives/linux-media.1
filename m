Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7991402B8E
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 20:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519336; cv=none; b=H2xNeVJo5Q9eSEIaHhhCdUa9FoltK/+jAwwn+UBSGFMW6wcCoWPu4/5jpqCSXFHp1xmOiuXOfELLyBf47lf8bMDeY4MGWTJFRySeoCeTd3ZXyeyJQjTp2PgWB5Th5ppf1uXOdEyPHVSdPR2O/vNTCP9G1Z2qMG8wOlm2tRx75Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519336; c=relaxed/simple;
	bh=NL5LlForqYlh+fcRsfduuGF8C586rzxAZDzcova+u04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mblH72tdEcpnjM3dieBxm/qINdewJKZhZOvdJL7WhLKkZQkTVcMvVhsul51+75AT8SsCB9EYa/AZEGpIFGRhkzabBPEMCai896CQo3QyiubLhR+M7hUIWK64PqL6Bz9FfxhY1oPgGEijhkT2aqOi4YRyI+bilGhpeqafig36lrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jo+wIgNB; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jo+wIgNB"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39677519c05so5653141fa.3
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 13:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780519334; x=1781124134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKtbINASkuxxe/pYPg2E1h0L+MT79XjrtpjoA45kS4I=;
        b=jo+wIgNBbxyAecLYjcLmeKFAHMwp7tZugXinVwPPjFXlJ8ADVk/TA9UClregWIkD+F
         UFYuwert/plUxkp52MeC9UUvfOa1fzGvU95BNmqGSOTIa3j7WOlnliShjREdRmo3wlK6
         vIv7xqRrrFKp6ejK1HrqAVgEO8w4n0VE4X2Zmv0QaGj0FsvzHZkOmJv/ZPqOmzlTGcBY
         rb6CobN6fo63BYNNFzW244wTqdPZ/L3B0Vu1bhPLA5B4hNvcu52/05UXOn0O6rmAP/dQ
         QmJGg0Oe7f231yhvG29hdx2lPd1nROJSeb6uRnpW9NBnytK0o9SxtxpDm513mHCADfJE
         KAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519334; x=1781124134;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZKtbINASkuxxe/pYPg2E1h0L+MT79XjrtpjoA45kS4I=;
        b=danGpzOmXykfuZjuQ5XSd/RTx6WiHCGlP9mBQlJwRfG0Dw34cxIkg/emTfwKVEJB15
         nxaj23rkftZYT5bRA/yXrOFRd09mPwjVr7YPYawJHJ5EHsVFhtmclmHHwAiGPpSGGnd/
         Hi0QdKlCcDAg40op34dWiUdrn5GTepP6vFaNuH0ZT8fG0L1QhkYPelrM5So/zQ1H05Vw
         XT+CJym9VJptNUEGbgdz5XW2BL4YgU5vTzLSBmQV07saLKa8TRxaoxILMK2A2aBJ0KR8
         nWp//EfXZwe8FjBNu+e85Oz2I1KtqmV0MVmgwpxoJMwCK9w5pX+vktnyHrs8GYQAesiQ
         T7ZA==
X-Forwarded-Encrypted: i=1; AFNElJ8eyE9sjOQT0cpZCYlHQlL2Sqq+WQERcbLPQ3ceprwl2lXitRRwZeeWnr9xfhpTnzCOUKPVdq8vzgOgZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP/hCWFa4aen06F18kWYS3FJZ5WymUOGf7iOgDZfofKy6T0j1E
	tV9KdjJjTkmJ8tbXPK1wHGB/I5vOIx1H36wl0AUVPXL4aMPgJnhqk3p58BqnzU4J5aE=
X-Gm-Gg: Acq92OG7dUF5MGyy3S4CWtKyx0VCMcar8l54H7wO2uj3Wos3LP7lzbW9uDMSmQ/Mznd
	Fst2cI+mRJpUo8i8vyzi5GGg8DZETwIexuHYuLkVpMtLZ1r6J25+xBi36lBZCYYSz5XnFpro+iV
	uHPWh/uD3ZtvLCoJh3BLelEkacf6/jhcb+lqBZXtTLj83qEzonYYg+norouhIk21M/E5cs8MZx6
	xutvffTsAgGCQQl1Ww7gS8LNANmgpV48GiE2tHgWjyx7MdDvHQMZLeR94BE4oc4wQ3EnNNtkoS4
	ADtLZaiYdFBN00scktZCL4JUV7XSJ2KtDk2kBR1tFFR9JPVo9YOP6r5t9ApV/vfbeEeqHQ3VolB
	3a0SDRBU7Iz2cpK8MaZZo7xl3diV/sWXXF8JhRL5o3acr8jdWwPkd+LzaVhFwbdiL4BdrD2Wbgq
	Ox8rqtP9Wu18NM3We17hg1rl/hp2xVvhIdMraeanRi4OnwpDBKrYvjYg+B9G+UaEF0CybpR5PxH
	ZhxJBEB2XRGKdum
X-Received: by 2002:a05:6512:6c4:b0:5a8:6f01:e1a0 with SMTP id 2adb3069b0e04-5aa81edc1c6mr4375e87.3.1780519333830;
        Wed, 03 Jun 2026 13:42:13 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b907269sm837408e87.34.2026.06.03.13.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 13:42:13 -0700 (PDT)
Message-ID: <6e962010-8097-4b52-9369-0727c0d5a31a@linaro.org>
Date: Wed, 3 Jun 2026 23:42:12 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
 <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
 <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/26 15:57, Bryan O'Donoghue wrote:
> On 03/06/2026 13:40, Dmitry Baryshkov wrote:
>>> Are you sure about that ?
>> Yes.
>>
>>> ipcat I thought designated lane 7 specifically as clk-lane i.e. named it
>>> CLK_LN of some description.
>> Split configurations explicitly use other lanes for clocks. E.g. check
>> the RB5 Navigation schematics, CAM0B connector.
> 
> Can you please check:
> 
> CSI_3PHASE_COMMON.CSI_COMMON_CTRL5
> 
> 0 LN0_PWRDN_B Lane 0
> ...
> 7 LNCK_PWRDN_B Clock Lane

Please note that media devices have a numeration scheme of lanes starting
from 1 (it'd be easy to check/confirm it), for instance today CAMSS has
lane numeration starting from 0 is out of the accepted scheme, and here
it'd be better to correct it and not enter the same pit.

I don't have access to the IP spec, anyway I do not grasp it, where are
8 lanes on the CSIPHY found? Each CSIPHY IP has 4+1 D-PHY lanes, not 8.

> 
> ... just a badly name field
> 
> CSI_2PHASE_CTRL10
> 
> Bit[2] = IS_CLKLANE
> 
> Right so CSI_2PHASE_CTRL10 controls lane mode, indeed. Thanks for checking.
> 

-- 
Best wishes,
Vladimir
