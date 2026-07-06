Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D5839D3DA
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 12:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341534; cv=none; b=JcX8JIm5XA74SgwZz3bFLtRqAXBriJeP+sWbpFVD3DpsQcy5ZhuuBh7PVYAp4pUv8m4l/UiWT7JNQGRZ1Ap2ZcNG7JiVqa+E86oIiAEz1WT7WUdEO+Jn83FFWOl+mMHGm4xUZk/pBBQ3NWTkJy9nhJo+wCFo+mwaOkl0S5c4t+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341534; c=relaxed/simple;
	bh=ZB9qw/FoktltYDTtZmKGAiHusi7djsQuc9QrlOagD8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yp+uuRfbuqvz6J2yFx8KRIsTLwb1eBxYmJ8XRC6tXjHbEnaaHYNWvqhGney72QL49LY3wyHZ5jyv6rFmdhmILVf2+BwbW79FuSJwZSg9JO0UXXHBykBWPWwuuBfd2cY7cDm5xHNLhbpRYndnxxZDEeRDuMFbmYfX5hyG5FNKbMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uB6RGujH; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uB6RGujH"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-698562f10e7so3808846a12.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 05:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783341531; x=1783946331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0R72pD2mExeKC5AJxZ73S5fYO6zCf9Lqx8bTZyttVKQ=;
        b=uB6RGujHOqaoyr1ZQLJR8lNbPuqVYIMxKuNZHXqZjk8NZlCUYDMJUnCAbLcbSQeIa/
         o8ks4Tl4cjn0P+nwbfJtzhN7AQ/5SeNYMeI+BdgiyZoqRbC1h+QpxyPK800bwOASTHdt
         3Uem8zZIdN/vUAyoyz36ZisCSR3bLl9uw3IZB/a5/abNqk6eV5NJuwvKtaZk4EjZ9heY
         ZxRSeg1o9sXDycgx258mz3coZFEDMQ+3xuS698RHR6LYjsOn4+Ikco75SBgKnnF8pxGv
         LDmE6lco517tZYZWL2m0gJfPJur9XNbHTAIZDWSCgYjwZ5TLhkXt3iGPhi+hiJCHvg67
         XDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341531; x=1783946331;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0R72pD2mExeKC5AJxZ73S5fYO6zCf9Lqx8bTZyttVKQ=;
        b=JWY5P7Z3uwWII+o4EU9sin6m41l7E2SJO8tLlOZjTpAUKVfaBDbRYGaRRsubv2+tyI
         AiOWfdoWf83RJXS6BMuOEuaFwWOY3ETG0aRXL7q+1BrmsbIFcCFSVhDkpkBZ+kCAttEj
         3icAyT5vfVXXpEK3VgjGRFMEQy9a5NtDyFnlSmjPbw5VFIfK2NqQKy4129oE5Bj+vlxv
         US5FzlRKgtVYkfxUVNgb4xWCuVAmwAEk7v3698uiskrnf8BCf8MtXwhBLO+mjUy2Eerq
         XuqSc1rWmF4et/kLR95wb3/yMeCDOYwUiomxWif1t/owbhKqa/fRBg5R9sr+V+KWGxF1
         8Qow==
X-Forwarded-Encrypted: i=1; AHgh+Rpxa9ImLey/3cSEwgr0ESBH++AH45X5kwQ+ixt4LRpsLBMOg9mIiOM0OrrriirX6g0xwgrvvfythCS1Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS15Y9EBetQqJOcZGJnEc2BkaGR1Z1TLcxEpqcecVRuvjbVbOr
	zSh4BH0Fzg6MDKa3pDO0hSK7z6c3zttydlktF9TtHWZrf9/l4strgBGKEEtgU2BJsV0=
X-Gm-Gg: AfdE7cmCEAn9qQ2ZcDycYUXe6+sv/TMspVL8YUPvXyhvHytYPKqtxpcmkj0w5jDGD/s
	wmJ6Lzs2B55Ivc9WpGj5yQDNZ/IEoDgvZD/rUcjoNIvxW5C9grXmo8XuUAPsNI84Q5fcsSHuuKl
	f+BmJbMHZkYw5mmCTIn/dF0bIP8EBDOOmENrufiuxrY/iQ+XhZpqiXKB95oWApjne1V7NriMqDc
	MAPL5xXiJ0hEZHOmo6tYPq/v8i2x0ZAXIpHDToz5jndnT9G9YIhsv6A3WmaURJhzOHm1NViKTr1
	fbbRvPnUQ5qbVrzUdhmlbG7w3leczDC4ewEk97Qm6krQQhvDIlu48kVuL9bTEY9tGtN7i6Xyfd7
	3HkMsFZl1+QjBfVIUWujssucNPHEus+VwGiQoVlTfzSCUpusi1n429muHdIXPfKsoiBGqC5d2pr
	EwBUnJI9oDN9vtzmYLZrVMWvJYvQ==
X-Received: by 2002:a17:906:3199:b0:c12:8c27:e2de with SMTP id a640c23a62f3a-c15a67c0b70mr18101966b.42.1783341530615;
        Mon, 06 Jul 2026 05:38:50 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d9d1c7sm4068863a12.20.2026.07.06.05.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:38:50 -0700 (PDT)
Message-ID: <bf24e5b9-3407-4e81-a458-f365b89867ed@linaro.org>
Date: Mon, 6 Jul 2026 13:38:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
 <389ff33a-b319-4f2e-9410-8ae962f2e844@kernel.org>
 <8871f6d6-6102-49bd-9758-faebbd9fa19c@linaro.org>
 <612730a9-8d5a-4c3f-8e04-6a248258e51a@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <612730a9-8d5a-4c3f-8e04-6a248258e51a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 13:36, Krzysztof Kozlowski wrote:
> On 06/07/2026 14:27, Bryan O'Donoghue wrote:
>> On 06/07/2026 13:09, Krzysztof Kozlowski wrote:
>>> On 06/07/2026 09:11, Atanas Filipov wrote:
>>>> From: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>>>>
>>>> Use devm_of_platform_populate() so that child nodes declared under the
>>>> CAMSS device tree node (e.g. OPE) are automatically instantiated as
>>>> platform devices. This is required now that CAMSS is modelled as a
>>>> simple-bus and ISP blocks such as OPE are described as child nodes.
>>> I do not understand this rationale. How is this required now? Are
>>> existing DTS broken and do not work? Then this needs to be explained.
>> Required is wrong, true. Existing DT is not broken no.
>>
>> Should read something like:
>>
>> "Use devm_of_platform_populate() so that child nodes declared under the
>> CAMSS device tree node (e.g. OPE) are automatically instantiated as
>> platform devices."
> This patch then makes no sense before the binding defines such children.
> 
> If you carry this patch outside of this work, you do not need to keep
> the Nacked-by tag. Only constant ignoring of review here is the reason
> of Nacked-by.
> 
> However if you carry this patch separately, you still need to fix the
> lack of sense of doing this at this point.
> 
> Best regards,
> Krzysztof

No I agree. It only makes sense to propose this patch after adding a DT 
that cares about it.

The ordering here doesn't make sense.

---
bod
