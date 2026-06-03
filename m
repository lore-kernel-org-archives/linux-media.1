Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53E83D3D01
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 12:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489338; cv=none; b=lhmrLfNwaepryuDEvTB72pYVoChQ+M19hSYIg9E3BwO0k7Aj/PnaSuutViNbinwWYIr6qI+fcAjgQzeWTbnVEPFnCIZwXSrA31u9IKiZh6iCiW5iTnxLgAUH9DZeS9Lanpvr5dGl2RpEw9joAuA6+UdCqHST9+3Hznv4qNZLKUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489338; c=relaxed/simple;
	bh=Oj1OP5B0k7dqDDl5yO9rCbKPUffT1+gV4fG7tK/igTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWVlXuCHjFKR+dlIiO+ZJoAXNgKnQVWIHCAphkAqhfZHfyW9JORA3IhZURIg8yzC5iQcPg1fCtAvE/ekoV56rYmxcsDyWU3o2YRfkMWd9iJGGm9XLMMCDV4jFjqzG25yPrC/8aAk6/Gf/AvsS/dT8tCzkqtDcw+67WZBgIlGoy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WoOVKHkc; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WoOVKHkc"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68bd167797dso308925a12.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 05:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780489334; x=1781094134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LR+NPsTQNV2+0FxZsktMoZucngyJOnTRFU/6OwaVMIY=;
        b=WoOVKHkcQGpRVrTCg87fLUidTriCeQ6ESGeQoToDmsC0AwOL5K2gX6HIK2K+yzUD6u
         mhklh5fiVrTXQrv0zTOZC9KtMFc5WXnuidsNtkppqoffSXJytFsIURmPvuw+FHEn3KFP
         +yucxIjO9ZxN4sce+1G6YzEBFwbTBn0pKC+a/h3O0IwSG/TQ+5KdW8/Sni8lIxtKSes+
         gTV5Ud1znpur+lJAcUhuj55TmYcBBW1xrwPULBTOyBWKPUqJcfWxwXXOi0kTmloZ0a4B
         dftnovvabnl6GRocCFMP4dcQqdDCTnGlwUcrnnrLT2LkrI3F34a3LuI/C6xdhV4nUbXG
         S3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489334; x=1781094134;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LR+NPsTQNV2+0FxZsktMoZucngyJOnTRFU/6OwaVMIY=;
        b=Bf0Xlez6JmPwJfjBCCHLEnw5/pPt9dvkIr5d+yUKbiPiH3bjR4o5IWswiyvzU22TPR
         4H+l2qUIzOFDbO0v/x3RG2dwkPYsZsyOgh+KUjhfIgwIrOoG0WEPNjBZiWDQ3nhQCgZX
         L5QoAj7JGHFBsp0K3PSCm+RNP/oCTOtOTZwyUQi2Mk+Iq7od526cJQX4T4lf/DN16jq1
         k8Fktsn3/OyJIlS8zLLvZniYWNdES1S0sCQWxbhHuEb13Jj4+TSMIgiI7siS3YDVPdsg
         Wi9Xv9chp0LB2qH+PIjqk9NRsT4R26qv72TT4GKJxl6I3joKk0gho6KQp0cC5RHU621K
         M8pw==
X-Forwarded-Encrypted: i=1; AFNElJ9CsRkoIlXn3j4sBMF8iTyfJ4vMWg+T59xPYdNoV8wDal5LXgOzCcIRECynfVO+Fm2qqq3eVq2TqDxcAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2uviRvWfY987XM4rVg3NBz/rLvdMA/M6nxmlN5kbcAoJiM7q+
	Z4sLZBz9bgM+keU/QxOQYuFe2zHoxenn1JwPN2c656R1Uh9bN8RuP4dJvEot+QDYymI=
X-Gm-Gg: Acq92OENRMze/FDS1ruYXJPEFA3mhkMT916webQmAoGlc/1YGYh1EPRlJdpaR0rw2JZ
	/3yDbXwF/JoJO62cwN5JRkSxzEWyCz965TiQxiSmoKYlZYQMLxaEOrtDhR3idoMDSlTQ188PpVo
	uz3HEjq//57I3jYEFz0Pv5RMYZPqIhq7CiPhi4NF/q0KD9x0HExVIPweHI+H7ol4WswyzRWUMyn
	Z4za13oYsJitHQ0ngF6DTnDLHzt3jPl/PfuEEQ+9e8J9Du/NOs/WQWszXemo2fe+TjUKiTYBEBW
	xE+kgdh3M+RvpQMmKhU/TZOHtbSDZd37OohnqopHHE5ittgQvvqzZhxiuF2p08WRs3Y9f0DlxW8
	PwdReFaVUEM/0fU75N9gVC4/X2W4mKmnn842UHjRp7V58sdqc39fXWVKhGi/GLREQizfAQLEoTX
	JdWuoNdKKZZr4Lk5jP/NvPeGYZinSVUnuxqlHeeKn2+LvbyQ==
X-Received: by 2002:a05:6402:348e:b0:689:816a:5367 with SMTP id 4fb4d7f45d1cf-68e6be91165mr1508878a12.0.1780489333977;
        Wed, 03 Jun 2026 05:22:13 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851786sm1064884a12.17.2026.06.03.05.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:22:12 -0700 (PDT)
Message-ID: <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
Date: Wed, 3 Jun 2026 13:22:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2026 13:10, Dmitry Baryshkov wrote:
>> Documentation shows clock lane at lane 7.
>>
>> Truthfully it makes no sense that the clock lane would genuinely be locked
>> to lane 7 but the documentation does seem to suggest it.
>>
>> Yes in fact I agree. clock-lanes can be reintroduced if someone can show
>> hardware that supports/depends on it.
> Konrad and I checked, Hamoa supports using other lanes as a clock lane.

Are you sure about that ?

ipcat I thought designated lane 7 specifically as clk-lane i.e. named it 
CLK_LN of some description.

---
bod
