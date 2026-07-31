Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0180033F36D
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 07:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481587; cv=none; b=K1AhUf7m4FVbwEt/p6N7LJAcTVfoa95I8hjRjMKDtBUDLqhDCzIowjhAYWRA7P79ZVOKyLh0NQU55xWHZL5/OoaDk93nme0DLOAcNCKq7JWv451oS0ZJalwXsysYwv91stdzs5mGmTCYfURHM7Vpw5xTuOMlmDwHzT5hp2Py7ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481587; c=relaxed/simple;
	bh=DqPJsez3oDMKsZIBRVeZjgbhuCl9u3Ut9LncqS3hcgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2ewzLnMPsGPbJalsaHhuLaBCghcbKR7x37qydY57BGc9Q4J5kX5r3/EKM3/JV7S2HiOVL95h649zEfA7+VDp0D8sy9lgNGxYWmVbuzs1yKnB8O5x5zB3p/yQdlFwLf79O0y3amyEw0NAlxguK/T46g6Dsg1fFaijNtGPFTRZlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qIy2U4l0; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qIy2U4l0"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b2a73d5fc3so77283e87.1
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785481584; x=1786086384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DuK52cb3iUr/KtXlMS7D6VCrJzWBxUsmvWGSducPbHE=;
        b=qIy2U4l0838hp/fXQyVv0Od68dqQUKbW1rr/+HFl8yVSZggsHerHzSk2Z0Vmb6DxHa
         OhlG9GRGpdDOBhdRb0t6HrS7EZAE7TY4MT+U5lvFYyqWJtUqH/eJAa7wQxdnigh6fhhe
         dMKSi+8YUwCsC+kI0vxUxzeuQNWd9zEtAQaYz+CgkhhNhYby3VrA/TI7p4yA7t5e8K4L
         x7MW9/q2/ie3A6apv2YL3UcZTNei/KKSvAj4l3d4Fks02dB1zx3VMoJkrIeadIXS3Sdq
         ZB7XYkvm1j3WDPcHei0rw24GKvRzFDfG9xI0riPn096sAwfsnznT7JG7wOOHk9pOOW93
         ZqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785481584; x=1786086384;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DuK52cb3iUr/KtXlMS7D6VCrJzWBxUsmvWGSducPbHE=;
        b=eQH7k3LfTupd1q6+PiZRchF9cRt5upKSC/sm+v2ktSFNW16izBrSf15HenD4w73gP7
         0wEEkhe0p5JxSUah404KSNI4R4hpkRpBpl04z/yGE3H6mxkiRnPmoOnlpeWUq+kfqsrn
         rfPrfcuPCwhwSAeoRQ4DOxQe4Usx34Ej6C+6bG+Z8Kwgsl9o7j1gk9hfk86ExQG6BYEZ
         Iyca/R+VujVa3WBKvpwQUIEZKV1ETwkLRS/SMWYrRmKmWmxukvTma1DXgtFpJJhtO83N
         MSbxb5OKZzp9NDWrGknPkcktjU5yJA9SmXCymMAXb0WgOUBMkLaK8StLpw4zH0nwgjTJ
         vVrw==
X-Gm-Message-State: AOJu0YzxsN21y8bICcYVrS2ort6W3yp0j1awcnco2UjUip0sXv9YJYtg
	hIW3g3pR+7BFKgixnVEP6SXzd5tJcWoqUvYmXEeX7wow4YNiAMUzhzPagroH/I1T43zpSb8hL50
	fY2Unopy9ug==
X-Gm-Gg: AR+sD12QS+ZWW2lgZL7G8eaTc1rAj0LXelZJEbSWFEQMkF0mMZWY1QNPdpJSAu4xX/x
	D9+QtEQQqnCFKYpfTs2C6tAvS2tJMfhdweYF15yCmu1ECkLlbu/ppwrprkBHXf13eSRDf0XUOYs
	2K43nFLrbUq8J86yzBcA2HGSjPwQoGndnWClPHIWm+cQeR3kg6AVeI2+W6KqHeqJvOD8Y8uYHiv
	rHSMIkkyh+ZGSQfGaJs6br4CrMCNdEPufm0mXbF/0vMsPs5iTqMrEiplcwFs+eORlBVgm4UV2ZP
	1Aj2ieHPQ9LnQMZM/cxFmxzsuxub2K+jadfdnCSuXyv/HluG6BjchAuzpSf1X//cENZHmeWh4PP
	Z8VT5r0soA6NniyzTd1efX5CZjhsLnnLH7BJxngMZ12CJvXK6gTHHI3EIcP7qpw7Rx+zLl0XVZY
	v3KmGKtKDznotPH40ef4T1RqeVlGImB/bmLtzLoBI6Ov6UjlzwmvP3oVcWhZ24ZPSJo89GnAeGR
	kwscpxCHD3RsrfEkTwnfXVmcqVGRRJJraDY0FB3zqQQKNkXW8miYg==
X-Received: by 2002:a05:6512:234e:b0:5ae:cf48:bd37 with SMTP id 2adb3069b0e04-5b2e1fc0847mr243683e87.1.1785481583928;
        Fri, 31 Jul 2026 00:06:23 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e245c091sm120554e87.79.2026.07.31.00.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 00:06:22 -0700 (PDT)
Message-ID: <fd168d45-fec8-468f-a9ae-39d17f020e41@linaro.org>
Date: Fri, 31 Jul 2026 10:06:22 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] media: i2c: og0ve1b: Use monochrome-appropriate
 test pattern name
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260731-og0va1b-v5-0-c2b90b601241@oss.qualcomm.com>
 <20260731-og0va1b-v5-2-c2b90b601241@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260731-og0va1b-v5-2-c2b90b601241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/26 09:44, Wenmeng Liu wrote:
> OG0VE1B is a monochrome sensor and cannot produce coloured test
> patterns, so the "Vertical Colour Bars" test pattern name is misleading.
> Rename it to "Standard Test Bar" to match the OG0VA1B naming.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/i2c/og0ve1b.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
> index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..da5c8e49d4a811f55736bd89c6922856f2e7391c 100644
> --- a/drivers/media/i2c/og0ve1b.c
> +++ b/drivers/media/i2c/og0ve1b.c
> @@ -72,7 +72,7 @@ struct og0ve1b_mode {
>   
>   static const char * const og0ve1b_test_pattern_menu[] = {
>   	"Disabled",
> -	"Vertical Colour Bars",
> +	"Standard Test Bar",
>   };
>   
>   static const char * const og0ve1b_supply_names[] = {
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Thank you for the change!

-- 
Best wishes,
Vladimir
