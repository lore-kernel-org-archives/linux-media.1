Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFFD4EF15C
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970814; cv=none; b=ZVv03Spyol3xO2xpxKx54b2SawbgwJ/+0700ms92G45Lg9UCsyfqsZYzSTRZPrYFVWx7jwFyjpvZmwHEcR7XksOxn3TxDchz1GnyoV7TSxMkzgBMZWUmnIPUuSj3Yjggxd81W0NbkwiK7mSL6jQzw1TpmRNeWmcwaJshQT7vOmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970814; c=relaxed/simple;
	bh=/MIV5f10+7si6CVmjQsZhF4fNwIUhkUhxJFAlQ1gCSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z6UiAF/pR4RqO55okbQz8IwWSqYcT5yg3QU5JmfOuK4oqaptjSg2EJYt+sT7PNkoZs7eTM4H9bSmIUl8UYPLOJlmBi4pYl1E1Bki70c8k67FbMzI48QbIDOsJFP2RnEUfEAnNsG73qJ73IrvMxkpCN854gUanyGVZ0tT0vr9Ey4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AlsBh/T8; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AlsBh/T8"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so4636648a12.0
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 02:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791970811; x=1792575611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJTdB+tkmfzXQ0j0gtaqlX8LAfgF2qu6ASSbm0x0pyA=;
        b=AlsBh/T8mEJYcCtJJfVVK9fzj2vAhhn4NPFD7gA/5/RXVY9wOrIfgr1kLwawS5ChCy
         YxFVOmhcdtfe4nfQVaSaYb3OBwlqSZdGhkOXAsD2fa5yTXSEV8pELOgSdlMUFNtr2A8G
         qHvHHYE47fODY8BF3ketgX81e90H6dMPmBYfpXCnRezFWjTNKYbmWTqExINue8moZKsA
         3kc8sOHBDAWpHNcJUjh2KvzAZuVuyjwGG+M63juA3GIFckoUKM3D+vaiMhEtAJcqRJAb
         MxOl++vvy/dasou6Qy3U+EMFto23P6QQgz4IOJwcYTCj6cXUSpdLGYkjUMhgKCZEBt1n
         1w+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970811; x=1792575611;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJTdB+tkmfzXQ0j0gtaqlX8LAfgF2qu6ASSbm0x0pyA=;
        b=vRNs3EUwO5F0ycouX7Ke4GLfTKNKNmT0ZgH3myJmXWIKKJO9noIo7/7bmZ/8DYByZY
         +aYBg99PyIINr7stfP/D2zMmIKMGZ0YRSteSjuzxEtbcV8qdPMPC8kjvs9mW9uYx3tCR
         aLIJIk3gcgu4INJmKXmYqsgCnP0C0FnF99dGowjTaLdq5uEMmrGGrZOqS5+9P1ZaokTj
         waAhwJiky1LZ6huw1R2nRM+6dk5u5px1N0aFfihKjRyyZIouhTV6ayxbMbE+BS+SIgR7
         bKm03NnYu+5KGmMD6bDF59dFLYUiClxmpWYwGcM05Zt7A5Wc55SKJnKI/FPJ3jWFciDn
         rN3A==
X-Forwarded-Encrypted: i=1; AKwUvByvgl7N7KJ1jQwV8JTdR205xysj7HSQekmrtcICqX2PEEJaeezd56KqTuWB1XwaXBG1m3THh0nJun8MrA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKpdGuKJZ5qx/iKHU4peE/sWT3Moij13x0hVrv5Op52HBlq05Y3
	Q8ipM90ZZZg/a0njIkz5r3KZbxI06mO5FJHi0rF0VdPHxyo9GoND0WdShdCPZWK42OE=
X-Gm-Gg: AYBFou1jTSj22c69P9b8VMdRPY8aOOI9GIMQUVSI6MDOghSX7r6y4Eq8jsDCV1sMcQ/
	zZ1zCRRVwmjj2iXfWktj66QCMNqkxK5wavheLb9tbMLcyvCFcgooj3B2vUsGNXRX2hruKCup+GV
	mUHPY+tknAc8oJKnXNHKPYMRL/O6Qxzff2P8pTZeoPgFLZtHWawsOxlYmtDkh47UoaDaXqPaYj0
	6ZrWnSKjs8LOTXEs3m/ifRTfLJB7jI7YS+AcOAvAmNKOk4xKHjUgSvZafaEtOELN8cMha+Bz7Rb
	AJMqvzgbp7XRyk/4A4JVwGVKIpuCICGYKJQ3azGym+rwXXun3SE3XAyIcOiu3mj43E0K8GkbJ+i
	xxRJLOjlda04ThqE6QPAtjIjq2HjWcG8f46tDEuqmvxP7E6XI+Q28EvSkhqCUEtZYjo6eljBeL4
	UWl1SEaHTjB6RzL88ilzoqIv2GeydEmVON4yPMsaxklF7gtzxxfa9Xzm7Zvh9wpTduy7D2QTWWw
	xQdly92Y8L2
X-Received: by 2002:a17:906:f586:b0:c2e:4742:4c91 with SMTP id a640c23a62f3a-c31aa08e8a5mr1307707966b.35.1791970810963;
        Wed, 14 Oct 2026 02:40:10 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.126.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae6f8asm691140366b.85.2026.10.14.02.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:40:10 -0700 (PDT)
Message-ID: <570f378f-3798-4a20-947c-d97d946f94cb@linaro.org>
Date: Wed, 14 Oct 2026 10:40:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] media: qcom: camss: Add Hawi compatible camss
 driver
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-6-fc93222da89c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261013-hawi-maili-camss-v2-6-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2026 12:02, Nihal Kumar Gupta wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Add support for Hawi in the camss driver. Hawi reuses the CSIPHY
> resource table from Kaanapali and the TPG resource table from
> X1E80100.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 25 +++++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 5db7e12a6f86973df372c0428c15c286d9f7e60a..664237ad5ce60be64806c5386ce88ed2133f0552 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4381,6 +4381,19 @@ static const struct resources_icc icc_res_sa8775p[] = {
>   	},
>   };
>   
> +static const struct resources_icc icc_res_hawi[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 38400,
> +		.icc_bw_tbl.peak = 76800,
> +	},
> +	{
> +		.name = "hf_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -6086,6 +6099,17 @@ static const struct camss_resources sm8650_resources = {
>   	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
>   };
>   
> +static const struct camss_resources hawi_resources = {
> +	.version = CAMSS_HAWI,
> +	.pd_name = "top",
> +	.csiphy_res = csiphy_res_kaanapali,
> +	.tpg_res = tpg_res_x1e80100,
> +	.icc_res = icc_res_hawi,
> +	.icc_path_num = ARRAY_SIZE(icc_res_hawi),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
> +	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
> +};
> +
>   static const struct camss_resources x1e80100_resources = {
>   	.version = CAMSS_X1E80100,
>   	.pd_name = "top",
> @@ -6121,6 +6145,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
> +	{ .compatible = "qcom,hawi-camss", .data = &hawi_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
>   	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>   	{ }
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 0551211f7948190a7cc2a2e7971e6c549f92ff60..2b0990b95a1fbca8cbc06628223437c24bceb792 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -96,6 +96,7 @@ enum camss_version {
>   	CAMSS_8550,
>   	CAMSS_8650,
>   	CAMSS_8775P,
> +	CAMSS_HAWI,
>   	CAMSS_KAANAPALI,
>   	CAMSS_X1E80100,
>   };
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
