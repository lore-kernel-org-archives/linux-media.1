Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1651D331EA9
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 14:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781188584; cv=none; b=FUcp3XSpMLh2N4B0SXnDoIEnoWffYDQuCuflDHn5homrHpgWG8FqEofTJqqydMpsfajyOZ2qenLgFGjSprUJARTMq1BXl7qK3ASU2K3tiSLu4i+RnvbHVOjqqcj8M68md3eDUGPnPWg+lawnoKlFjcUoSfTeNNtes4XyKa5ew1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781188584; c=relaxed/simple;
	bh=qnv1fAGXCtLVIjll5OZjfkQjjlkL/oatmHWaQJUPthU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSpXWBlQzU0+a3g2ugJEQUeqk3/MbGa8LtxURzw1FJPEHxLhC8FHUXGpMxK9f1dNu1LwuyxF2y9nVMoPQcqT3ZhZTb1KMEGFZS2xL4Crh96npQeR8qOJO0cJLd1BleCIQNCYwgazu3zBN3btQr3yXGdI76cBNMcJPN8uHrOBOdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xYQzB2DW; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xYQzB2DW"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bec449cf976so1103652566b.2
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 07:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781188579; x=1781793379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sr3m8r/i7ovHfjfbNC82N3Y0eijmiJMV+xkhP6DvT20=;
        b=xYQzB2DWHdtUO2kVszPWBJnsDsb83mivWggIjMOTuCYejfnCtOM0ysSmqmjgJUsfve
         mUOnxWryQCZEfGjcF16Hk+UKfDYR8UeTW9HUlHSn691NDGwUlJR+cp/Wl8ut+jurud9z
         CjzhL41ePAlgMNeGOhTDLHcbPYhGqr8c0SxiuqFl5sDJDWxeMRcLRoE1Qduic85+MfXU
         19jCHwkHzTxt4HzZuI6bnIyWq5VXcUIc5p6X4I2bfyZ5unS6L0LwCoTJuQKb/tYhPyeo
         9tqNxrCUhjKacMZrS46E/+jncAvZrx1GO1tXdgFgb9d1eKLX7E5hxysklo14JLLJXqY8
         IrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781188579; x=1781793379;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sr3m8r/i7ovHfjfbNC82N3Y0eijmiJMV+xkhP6DvT20=;
        b=M0obcmvxyXkQRZIUDez2soE452F1jKZFVkzUb6FASTG43QDUse1GU7PJb1kqNfFgYw
         4k3cFCCGOEs+Fu0gQTIs2BZlEQ3CO0wzR76XqIU0fvNB81K+wUNqcKBR9mGcfJOVU0bh
         ciXXy5MtpNzr4lkzonbWBcpMpqP/RNEfh4SBc8zaw5m+f8ThMGLRZMc1jRrKspMsVdma
         lcU8Wa93+vsrBIit4VQ3lu8K9FrqrWd6GrVsH7Zwk8rIPf0c3jeLdifsJeU1wG+/W/+b
         bhbAIiyhq8G70cKvtOEpLMgK1zY7BRVCafxXSOEetlPKYaz5/oEv2vq98wffh4uvclYX
         BqCg==
X-Forwarded-Encrypted: i=1; AFNElJ8iodon3ZtLoKU77d61Ep/vj6+HFn4s2/Np1fmwRnYIUnUbOWnK0bMM4psvmPXwtbneX2ux3S5IqtrimA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm+L+Zky2MRHnBJV2gNy7Ej4OQ9uCwS2JE0m5X/vpAHaa8f+bd
	neiGDMFpEDlAKIF21hi2zq2hOLZSmSfZ+FpOKJLFsnZ13UYKD7nrf68K4npKFf2W2dc=
X-Gm-Gg: Acq92OGa44gj1mlkX/AhxABS2ZtncH70iyhf2c9mJFwt+gxSDB82msL1IZp0sFrggEv
	KwLYeq9mWpoa1WlnJ8wXRdRL5ScvcsGCAKtwnndRGMDGa1PMUmwdyUPfMZomdk/S7Lo261JKx2L
	4C8nxzRxJwlh90GvpGn+lT7qUXkZHEhUBjpQXfAwBLn5ovwpc1+yBid83z0aG2U+PjTPaBn758D
	ARpWd/NNU53cWhc4XL4YtsgTlt7bgdN8R0k9EXvYNBzW6XYJl0NfHfUqrhWN5irx05Bw1+mmQ7Q
	EFPXGdzlE37mXcyQbufOZyhRXw7G0mnOMd/aW/xBO1b3DM2oPS5TwFE/FilgPoHG5osASccGYGU
	gOey9ww8425hzpaJCNeju+zx+6RAo5l6pPoeoYXncOrAaJlwohVZyBBdmyM2SfS4prlg/YAj5tv
	5wIJfbKfHtL3pgR4/PQk9rRKF1rYA95Mss1DtpGbNX9KOfzg==
X-Received: by 2002:a17:906:6a05:b0:bda:8e57:5639 with SMTP id a640c23a62f3a-bfc85e9049dmr144570566b.20.1781188578927;
        Thu, 11 Jun 2026 07:36:18 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6914f3b583bsm7011436a12.29.2026.06.11.07.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 07:36:18 -0700 (PDT)
Message-ID: <ab1055a2-6916-4083-a360-62eb15171fe3@linaro.org>
Date: Thu, 11 Jun 2026 15:36:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
 <20260608-reliable-vivid-stork-f4ea6c@quoll>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-reliable-vivid-stork-f4ea6c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2026 21:46, Krzysztof Kozlowski wrote:
> On Mon, Jun 08, 2026 at 07:36:38PM +0530, Nihal Kumar Gupta wrote:
>> Shikra contains the same Camera Subsystem IP as QCM2290. Document the
>> platform-specific compatible string, using qcom,qcm2290-camss as
>> fallback.
>>
>> Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
>> single IOMMU context bank instead of four.
>>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/media/qcom,qcm2290-camss.yaml    | 16 +++++++++++++---
>>   1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
>> index 391d0f6f67ef5fdfea31dd3683477561516b1556..4f39eefb4898ebc22117407f26cfb4f41deb111b 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
>> @@ -14,8 +14,11 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,qcm2290-camss
>> -
> 
> Do not remove blank lines.
> 
>> +    oneOf:
>> +      - items:
>> +          - const: qcom,shikra-camss
>> +          - const: qcom,qcm2290-camss
>> +      - const: qcom,qcm2290-camss
>>     reg:
> 
> With this fixed:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

@Nihal.

If this is the only change you get asked to make, I will just fix this 
up on application for you. There's no need to v3 the series for this.

---
bod
