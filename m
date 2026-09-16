Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A06388E4F
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 15:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571661; cv=none; b=QBCgeFN+8PBV50xwCamZje7Ktp0kxVZBHE/PB0K3XNmXMWsnPTGK90bNjsjGRWLGS5D1TMtYQ/agJBNxh0Uoa25mEYDmaymS9qu8CWPZiS4Y4sPnh7zqZkb06s4MF4Zc7cvKhIZVN6OXlVjINxks34hNg10lqknzlBHidzReoVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571661; c=relaxed/simple;
	bh=I1mUBpETXIszOJUI+4PfxF9aL9vUcBmsZqAXr03BHWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jMe73zJKeQQHyYTNqMEY/rtyBcAuTUX2kCyeRoWzm+jXNyOMZy10CIk4uMCK6oO97aIsxf8Tfd5hnYntE8Op23YoRHMQyMoWgCcAyG9MrQQO4z/+YxwTqBbPKXwtm1O3xztacfpioLTd+Cq0uxyJ+IJ7WHPjVhVxjyJJaQN5TJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xapfVJko; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xapfVJko"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a9ab2a135dso1760814a12.1
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 08:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789571655; x=1790176455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EGiTz7ecYRQ3R9tZPodslfq/Xnj5pm8tXpwlFqHcud4=;
        b=xapfVJkoYBobjp8XjptcdXGEtHvKOADHSRHD94vwtUKg/bWGND9iUlmGIz2ltM1WQL
         l2Ck+yJIGOflplDkKbFoADzz4zBA5u36MaWxg4SczCUjMa+YoOv6ZXY5obQbDbqvyNxA
         prRuMDlyzSk6G0wg7frPgzPd/7FBGet+sf1Hkt/KpqcifO2Snbl3Bls8k6K/wZz9vsmq
         P7d7ZF5QnUdmo7UkuHQj+dVt+6l9oWqIUIYJUokGnYbKnubcpO/8AEnKu4bytYFvJqdz
         22Gm+by7e0RP+ToXct3mX7gJHosrj1idA6K52xpsktToH4M36EwhReJt1EfjeA4XrjtU
         sLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789571655; x=1790176455;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EGiTz7ecYRQ3R9tZPodslfq/Xnj5pm8tXpwlFqHcud4=;
        b=xGglWO4mOnYoFuaiRE0PurrAKfOfpMpxYSk7pjIu6EgCdgppvTELHU8pJNRKLhmG0W
         eW1hQbQfNT+bUTMqrSvBSlX8Y61AFPPnwySIWNP8kvSJZ7r94q9573GBnoA5UkNE2xuM
         E9mdxUTKCNmKHRsoD2JYMxHgrsYCtKqtMw6KOjtx85hiI+XpFhaw2MUHJRLhnnVYBl4v
         gX8+fAsYYOOcq85dfoKum13wLH40yxUY0YzeF4sh/ylDG+YzCThYmsSKBMNuU1B2hojE
         P8HVZXE75ysoQC9moh3m32/WJDb6+dXSKUDSqn5Y/Yr8UEaOoRnp7La19F9WNIRciLsm
         BCfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWdE9R/xlyhUc5yjO+nyJU+a8YqjRV8lP4ucvhOPKQGLnDxkp1jrO+iiUm/EjBXZ5jRJuSyg8MDV9kSA==@vger.kernel.org
X-Gm-Message-State: AFuF++lnWjCbKG/KRefGvODdOnoUQVqKzoJfbeaDvjojs5znXKEVS8v1
	p6SYvGgPIpYmswPS3QNFO+BXVy2xLwT7cwIjQCkhviBJS8utTJjlmvaVIPuWWu7f8+E=
X-Gm-Gg: AYBFou3nLNmPZF9kVQMBKdq0k/LosMK7xCahPMFe8WjMbA+qZi4VtAIqoeZ8vk1chJY
	cyU6cckSbKOy2rOMfB9qXdLdDCQN35eNabu6MZLhxUoe+pkMzqM5cC4A+ZlQ1W9rpqHOOrbfioX
	g6Ero8GPJV9vmOVgVEHYtBPKvrIrWEB14kRDx+wbew3x3Qq5JB1Z6Z8LnB6MUf+xC6jTBojVqEm
	AfmmYOJbpSPlovAWlPS1NFdiPZcCNALEVUMEobnTWEngecyCmlCm2jOqo9bxINRp5h10eHCJNr8
	7lldFQM31hteg8HLCqUJKruqlLgihqShLgXFZya/xIiGRMP1pv1INmJ6efvobsix8z1pCQ1CsOx
	nZ51mlK/eiE2CN8W/EgOgo4fqUnNGEaHlt8v/UTXqhJdrqsuZlEI/1GSKeoPxBKUoS3FQ7K/J+U
	LMZeKMQdll+1GXru5DeTsIoJbLo/f8kjVZnQP5KMetc8aM3gU/lHLcIJSb+96kVVxMJlLSJdMXz
	7Vr/CSWuwYk
X-Received: by 2002:a05:6402:548d:b0:6a9:a33b:bb8f with SMTP id 4fb4d7f45d1cf-6aa2245f519mr2317168a12.41.1789571654700;
        Wed, 16 Sep 2026 08:14:14 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.116.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2ab4ebsm2002234a12.30.2026.09.16.08.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:14:13 -0700 (PDT)
Message-ID: <6c084416-39bf-4715-908e-14cb7e89b7d9@linaro.org>
Date: Wed, 16 Sep 2026 16:14:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-7-067f2ecc4630@linaro.org>
 <EcOn_d45L85SEZXEL9tJYp8j2B3-IIn5Ao1OiDaZsoJZOhfDjo04cEbn_YvY3I0eidZYm2PvZNw0K2e9D62CGQ==@protonmail.internalid>
 <2f950735-91ef-4e43-a5e3-1375585dc43d@oss.qualcomm.com>
 <8c82ffbe-748a-49f2-aa52-eb7a56165c03@kernel.org>
 <6dcb0b11-3490-4254-b86c-a1afbcd3b863@oss.qualcomm.com>
 <510e12e9-fa79-456b-8215-9f613d6d6e7b@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <510e12e9-fa79-456b-8215-9f613d6d6e7b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/09/2026 16:06, Bryan O'Donoghue wrote:
> On 16/09/2026 16:04, Konrad Dybcio wrote:
>> Perhaps moving the endpoint label and definition there too would
>> make sense, i.e.
>>
>> -- hamoa.dtsi
>> ports {
>>     #address-cells = <1>;
>>     #size-cells = <0>;
>>
>>     port@0 {
>>         reg = <0>;
>>
>>         camss_csiphy4_inep: endpoint {
>>         };
>>     };
>>
>>     ...
>> };
>>
>>
>> -- x1-crd.dtsi
>> &camss_csiphy4_inep {
>>     ...
>> };
> 
> I don't think I can add the endpoint, my memory is I tried that and the 
> dtbs_checker spat it back out at me.
> 
> I'll retry though since I may be mis-remembering.
> 
> ---
> bod

qcom,x1e80100-camss.yaml

^port@[0-3]$ → endpoint

required:
   - data-lanes

So I'll have to leave endpoints out.

---
bod
