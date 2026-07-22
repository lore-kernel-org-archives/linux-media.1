Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7095B4399CB
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 21:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784755239; cv=none; b=iOHFNFKrWbME+mpaZY5NcvcBusiqJCzSptZuC0edUY8/9tEv/XGPCWtTJEZQFTCMq76Lg56HvrgKgFda8jZgbWDzzjY3ATV2IIBNt2NhTUMDUrDmW+EoZ2sp09afWeXCslepw9x41ezuHQXOHs53Lu/PGe/oYSoSUnLCAOK2lGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784755239; c=relaxed/simple;
	bh=3zcQRDku687b9GexCCiJ2+XMGu4iVB7m02pg7jXFy0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gVZAiwk7rEy/2lcLd30hSqHruiUHRsu5a70Qv7365vYmR1mQPxZFw7s8TdLub+x7yZh7VhmNLxaR8f/VxlHra3R9HMCB20DN0N2Q6KSTg41KPCOD0QnU3a9abew1E5yuLRF7/PYtiokSg8WTE5m5Zw8kYrWApKiUuu/1WPMu25Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G5qeH8Mr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G5qeH8Mr"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so1737977f8f.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 14:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784755236; x=1785360036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xRjAKOb+mPkA8VAuf7Xdr2FlWpi0y8QOoReI50/TJ6g=;
        b=G5qeH8MrhsgMEKuPyoHpfm+E/Efc++lGnmSrDdnjoYjUHPFDJ4mEI2bop87+zIeCTg
         +GvCw2EvhNAW2OEusHsrteZY0FnSTCWknFxf4fi4AmWkcH+vlH4JVe6jWK2kzbKtYAQq
         59ILYA2vS1ePTyDJVGlbIkM6yfwGd3RvsUudEvzFT0w/PszSLpmYnUhB/JRIvMxXtIp7
         3H2dpYKoFKQNTIYqbaZO47hwjm4L/nVc0ccFTfWIMUXD9+01l8EL6I+MkqrClOlpG0Y6
         fPSCsUIZsvmy+olwej2m3KxLnCxNwW2WxTRhoOZnbWI6YV2DhEU5H0h9wG34pnRtpEQx
         PnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784755236; x=1785360036;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRjAKOb+mPkA8VAuf7Xdr2FlWpi0y8QOoReI50/TJ6g=;
        b=fXLcxgpmdRo+AXlZmuWp/lWo5n9eePEfAl82TpE9ie0VRpoyNvUGVsgMWc1Rz3UOE4
         QZwuxV5KZScakL2SrrnxoPZJQf8vKa9cyi7aMeVzt8J312Puf8rbaJRqE5XhvTFQmzYV
         /+CU7kiWrZtUMoFE2qjPWTc989b0jo/8XpxtXM8TXFuNccpzxYptDI+Qy/ZcqHWN5/1A
         KSqA3NxIIJNSmKm/YGjODabHu4o63l3aTvJl7vQ7PGiPjNqzLS7tFzWEC4N1t+i0GdV4
         +6lj2/J6dqpHrLbTNcRlfsdkQnnPCl0fdV1tV9fzb1S3X3HAgnIpLcSv5TItZlRYGFLH
         9psg==
X-Forwarded-Encrypted: i=1; AHgh+RqX5mnR+Ra6IEmtIWyufCnGpPHYYAKeXpS+e/UAwx6UUGfiJkZgO+7Tdnqt63fbsrR8pbYa6MZk/gExYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFuVvXkGhvbVYETzhSrHNZVVO45Q/lHvBzCuGeasi4z9F3sUMa
	MrgrsdvLJXTPTPUHPB2bAalLOTfW8bVorRO3y30T8Oq32oeolYCNQpv974b9rwe0XZg=
X-Gm-Gg: AR+sD12TQXRL4yVNEzf1iB3Mz9x8WFleFeXDJTNqL1BckDwCJAXgZnmXSfOAQ4y2wDd
	oDHzkhV+A++QXzwAxQZ/4ArVItU83jjHOiAkC6Mv218pWlo9Q01Pz4poLFwkJxXqQfYz4NUKMy+
	hucRPwsMfLUbHmFcNI5vEDjYF8XLtqQB8KT0SCzPAk/K8Cif9RKbT1awWnjVdWMkdfcDokGAER6
	D9Lu5/ekOrPi8DW/rY1dLWXv/Hd2INSpoZuuFYAaeFUp1mnoIGg56fDepv6DElVQc+/1JoWT0BI
	wWnilqkds1q7BY+uO+e5Tp6uA5MYn9PUU5tdat5XzhiFezRyMvDSdzoWpxYMhCl8grYvNbioTLp
	ShfOPzfvGVZCyorSz3wnCw3SmsUPX5bZSLdNpH6c0Ccfyhqp3HBaghJWbrH8hcDi4DDDR8N6FFk
	Kv/xneV9ssuTlyjw==
X-Received: by 2002:a05:6000:230e:b0:47f:7b85:b883 with SMTP id ffacd0b85a97d-47f8d761973mr533687f8f.47.1784755235652;
        Wed, 22 Jul 2026 14:20:35 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.14.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f864305f5sm8820431f8f.17.2026.07.22.14.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 14:20:35 -0700 (PDT)
Message-ID: <382f3a2e-4493-4c14-b402-a98b12d4c1f8@linaro.org>
Date: Wed, 22 Jul 2026 22:20:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: Drop icc_res_qcs8300 resource
 table
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
 <20260722163658.409872-2-johannes.goede@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260722163658.409872-2-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/07/2026 17:36, Hans de Goede wrote:
> The icc_res_qcs8300 icc resource table is identical to the icc_res_sa8775p
> icc resource table and qcs8300_resources already uses the sa8775p resources
> for most things.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 17 ++---------------
>   1 file changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 3efbf2fb4472..477358dd39fc 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4161,19 +4161,6 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>   	},
>   };
>   
> -static const struct resources_icc icc_res_qcs8300[] = {
> -	{
> -		.name = "ahb",
> -		.icc_bw_tbl.avg = 38400,
> -		.icc_bw_tbl.peak = 76800,
> -	},
> -	{
> -		.name = "hf_0",
> -		.icc_bw_tbl.avg = 2097152,
> -		.icc_bw_tbl.peak = 2097152,
> -	},
> -};
> -
>   static const struct resources_icc icc_res_sa8775p[] = {
>   	{
>   		.name = "ahb",
> @@ -5573,12 +5560,12 @@ static const struct camss_resources qcs8300_resources = {
>   	.csid_res = csid_res_8775p,
>   	.csid_wrapper_res = &csid_wrapper_res_sm8550,
>   	.vfe_res = vfe_res_8775p,
> -	.icc_res = icc_res_qcs8300,
> +	.icc_res = icc_res_sa8775p,
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
>   	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
>   	.csid_num = ARRAY_SIZE(csid_res_8775p),
>   	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
> -	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
> +	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
>   };
>   
>   static const struct camss_resources sa8775p_resources = {

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
