Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833963;
	b=cwdhKPjIXcRGkVdl3wC5CvUgssr6voKkfNBKaWb3l53U4OF/LY7BsfdsZb4TqpXpBwau
	 547KFPvU1u/sCKPS8yvLwNmD2RuB63cqcfGdKC8xcbU2Rv4y6XLRRJrmM8nPxXwl5/Ctv
	 V1YAOlKvLSZpN02hUzKOeZmwjvRo5WhZWPX2aBnleKBm1zH6z7dg9PTbc7WEsxHP8bos7
	 Q280SoK4NEjz5BCjVRiA1MK+j8UIglzgYmi4edmAll0VquXPNxmUcjbt4xhXAp+TD+kS3
	 UsjqNUErfQ4iqmryn8JS9EqzrRIKnjVn+BiF1+42H8xr/F/qKfFqAGNoU50r9FdWSYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4lBfIR/LafX25Og3OCJQ1wVKuVTFo8wSNFYi96ni0r8=;
	b=nz3st++b7t2urynktAU7LCpPSUG32r+E2GtCBee3h6iWJTz8VdGjwQpEpBE2ORPpT9Qz
	 CySLaQjA8y5mxy//pWASa/oQLi0JkDpSdydTPh5zZhpcIEDc7VKeYDgjgAwosqP6g2BrD
	 8xqd/cQ/u0lScgxusXLnBxKLbSMkDOwlv8GyHM+sALlc06lrAW2lweKX4ika7NZO8zFB1
	 1jn7gbHoX6Cey8EP/p6QOsIahN5TihOL2ZT9esbzKYgG70npwM0B0+hmvKwg+G/8UZT/6
	 l9yGjiRDXbTxM6M//ORaAOhQwCPJ24EywTJAmG3vSVBAP/nYcK6/YBqjkOUwiyneUXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gs9pV5e5;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFE0606A31B
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 23:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EFE0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gs9pV5e5
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcef474680so126506e87.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 15:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793833961; x=1794438761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4lBfIR/LafX25Og3OCJQ1wVKuVTFo8wSNFYi96ni0r8=;
        b=gs9pV5e5Um20Qgo2XDi0crgyXVOH8hndAHDdS9S8n+43dJaechcABgzMF3gj9EfEey
         KIuAT3G2FtKH/EJj1mtS1PFBWAxdRZmTdwvvqANPzSJZLEqsmxrOY60co79CiqVHLgpx
         I5T962ziyuGsNoMsE2hTh7U2V4DLW3/oe5rwcxjoSHX2o/K8U5u3Pu1/gKksHc1W0OKf
         j0ZwfHiBu3eoKoUKeSfBMPHKlJO2yCbPHSem0oghIS/EpeGTfPWJpe7jR/8Mqq43IY7T
         sNQkzUZWyy7FKByarHD1qsabOlRFUrBvwsAgNUPm7mHBowzx/reelAmpt3hqobysshdX
         V8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833961; x=1794438761;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lBfIR/LafX25Og3OCJQ1wVKuVTFo8wSNFYi96ni0r8=;
        b=0XaozS+QxJDQ0IVTtFJ9s0e/Mrwk7/9pvRZik406K3dKy32rLZtOpGkh8NQJxqt3Rs
         j5dVtS72rt9W8nq6vgWa4/xxuk6RhfsHfEUm94pkUWau/zLbddKqXQNkjQVZD2aM4/9x
         2hdX4zSfmt/mAE0LqwzRQrjnyK/40+GmT1GascaSWOzusbDhBfVA1Vd8tcqI+akL9doV
         8lqsGnaDv+mqJDZMTzWrMQOQrRXG9jXEWL1qGymf4coOzMl6dAYD+CuyK3k726yWhnG9
         TnghPIbuFXzK5HftLBwsxNTzrvdqs7HviK1W9U0pa5JJVxd4zastEB1ZpdDXp5v4XR1K
         dryg==
X-Forwarded-Encrypted: i=1; AKwUvBy84EaGt2/4svAtfjrXQBglXCDodu51X0eTeySVz991mHnoRzTj4JoTdwaGvjZ6Nci/sMbLXenzyOdCeg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8j2mvphF9TIP9ajfsGGqI5ZJKqkD/03QZJEnY+qWb4i6KZbjl6
	sSJq8/y9qK3up+V3G5g9fu/f0eYx6EMDA7GEA2aBr9LnSkV9CJlJdGqy6isrX7hWHLw=
X-Gm-Gg: AYBFou1lJD0Nrzu6jLLVdDY/Mc+XDeMYoS326qGZ3BtvejPJWHK8p1SFHBp0GwiKJ5k
	erztl0PIm9+DYqjBJAt2zbAe8H3THBax9G20fmaqgwrFo32Y3Zp8Wizy94zwppaY7JiyUmzmMWY
	HLBvw+Cm/Pac3uXufMr2+5/6JkLAGFuGh9eLk7A9LrZXLCY1uKJJi5vu70arAlAaHEhKdrxFaC5
	Rb+cPJJ/ZL/YcKOB1+sTE+9i0zXI0bo/3lzDyKfjDSto5SI7SVLUOms73aWmiqAxFiNFl2+nV/d
	cdBmVy2jV4vMuk0cTdYdibEDhne8Q693dDHsBoNUoGcwsK+vo00JfcnY+qWOIhTVDaZ24ySbNtC
	6nhlZ/mNzO93Opb+cAe5US7LKeIUEnyIx7MzRU50t7hOm/SmGwXwUA0IPVW/8E7tG/ovEOFxYLP
	RLu50RpzgmIiKupxw+h1tg4ex/ypvw20ATRWbHYgis0883RBST539ILRYHMe65BR0Zd+IEs1dFT
	OkaEdSJYGYv3jgSzIPNkvGuR67obXQLQrlqX5j3Y+k1MLVkEJRy4mGTSEjZr4a4N4znDMkblwV5
	CssBfvZoiT/uBEiQU6TY/fl8q3qtjI6s1v847lWZf8LdKwlBBYPdTynF/8EW9ht0WeMRePFyBl/
	0N3syAg4=
X-Received: by 2002:a05:6512:3a89:b0:5bf:f642:bb43 with SMTP id 2adb3069b0e04-5bff642bd0emr1119881e87.3.1793833960601;
        Wed, 04 Nov 2026 15:12:40 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38cf7bcsm540327e87.71.2026.11.04.15.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:12:40 -0800 (PST)
Message-ID: <ec559f1d-0ecd-4de8-9baa-a0a6d5aac5b8@linaro.org>
Date: Thu, 5 Nov 2026 01:12:39 +0200
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
Subject: Re: [PATCH 1/4] dt-bindings: i2c: qcom-cci: Document SM8150
 compatible
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 22:54, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add qcom,sm8150-cci as a CCI v2 compatible, with qcom,msm8996-cci as
> the fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0e..b545fd2378da 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -39,6 +39,7 @@ properties:
>                 - qcom,shikra-cci
>                 - qcom,sm6150-cci
>                 - qcom,sm6350-cci
> +              - qcom,sm8150-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
>                 - qcom,sm8550-cci
> 

Apart of the update to the list of compatibles it's expected to document
the clocks.

-- 
Best wishes,
Vladimir
