Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FD737B002
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 13:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812668; cv=none; b=k6jUb5uHeFfzon+arye+EUT9wRcM3xh7zPANc9Dr8dtjMgNlZuTi5zW600U9ll/RAON+Dpem/3HUMPUAzsYgNGyo31PBcLNpsnieK1sltDho0sqXfT6rBlYttleA/NquLQuDQKfsSgA4JjWAh+e1cRgFz0FnBFIjSK/nbVU8V7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812668; c=relaxed/simple;
	bh=PHhDicVkoiLyHRl6HYWXDp7oB3gEBNszce5FCbtHAFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oujZSnKZvxIhm/IeTKtL/+fO1ZZNSSgek83ixoeXjV+GO09j6TrpaFN5h7vUE78Aa1O9iQBn1OnYYIAkKk3Nmuc6VUYbUMpq54/9TjnnmRQj5HyxrgbRdbwVMAuvxYF92BGjH5G1yXPMl0qu1Sv2TEvVPi1v1+oe40YVlCtG+Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oyDKFw/t; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oyDKFw/t"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6acbdbc1725so2290174a12.3
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791812665; x=1792417465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=slJcaotleR//bI8CYz8vjAiqPihT3cE676B1O6tN4xI=;
        b=oyDKFw/tFWYLHKy00Bhmr5nZQefjgmSCcDBntbbeV5QnuNAECc87/cthHJLmSBDJW0
         al17WVXGdzdeK0TyXuxwU/YcCvO6g2GkTKMsNScJbkAPQoUQAiKZ1ZOkDxNH5djh4i+C
         54VokihF3z1Kyx9Mqrd/YuNvfEJBZjbmKoXhIMmMvTq3KFzaDaT9rMztHXA3NmXwUzo8
         d33u5xy9QtnwwslPI/hBN2QfK9MPgZf26zkiaFtjsnhqN41SGeNqrKroHxmqhY0T6Af+
         D1cPb0LRv9yrMNIE0ToX9/RAgU0WN7pm1lOMqJxVusKU9H0dOndexzqBx+DA/3GiezxU
         VgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812665; x=1792417465;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slJcaotleR//bI8CYz8vjAiqPihT3cE676B1O6tN4xI=;
        b=ffVL1VjNOEbIPRXh2osITSpeAV1RnYaSdHraMPHSk5bUtZ+VxdnY8RU/tWMpQw3knT
         IpWWw0tKkVMIvZXpudL0oMZYa9Wyws7ypgAJNAqvhQ+atVeEHSfJhQvqnF73xZIOYODq
         9IKvSd35mysLNkA2z/bCv/UvC5OWhqK8iikdanIV0HHImL5EmB9AMOcTJQMktp08dI/0
         ODxDevv4Xv1xtIVzfxwMjAs5vPsoXkX5Nqa5vvji4mAzvmYOLNR11rC2/RP7Wg3V4IR1
         k3Hg8q+B2Po+IlR4V8H9c91apc1/ONzjunnkZCXgc9LrOUXC032P7ee8Tj6yzz5t8eIb
         KGyg==
X-Gm-Message-State: AFq9FYI3mrD9yVlt55TkdkaSnLAzte5YdsrZMNq2P6Hok/Jt7Q4s088Z
	MxaRz/u4G15w9VrmAuYa3l6RkbR7NS7lJvmlZCIjySyXCcg65NWw4BBD6md6fKsIZzPQH23I63K
	7bsAnbZY=
X-Gm-Gg: AYBFou27Vxvd0Uzak2X3cRzrdZwIMZddX0OrsQkGaVy/wjsGAr7fBfwLGKGUGQRiYpF
	XGw5l0jrzU/nK8Cn03i8wvYdZNoZH8RQeX43vNG1Sab+YKxtzu56vAnAJz2UPMx84RJAdWlP9PJ
	mETdMMHrULXS89oSFbIzNmafp1TgIspAHmLPXH69ip4jBW113uU+e6uZJqIYTAi4bFEZ8DuCVEo
	sSwPGYg47vPusLcPKt2SIc/WMq6zzoXYFBpz6gAkKMFBpmtL/ptpK3+oT5KcO5g2lX9k4nJFPrC
	4iP9FcLBAWUZk1P7KCDDKlj7c2YDo2o6zrBAVntExnj3oiND7wH6PE1BRwdhZLm21kmXOWbFoat
	haKM3UsfRx9TX6LdnPvKRi1VbiGG0PTUdDXiE6QPeItha0uhPIewp92FkEo3A7iD3JnuSoND4vM
	rEiNuQrtHPxGEa9jmzJu9zEod+csejSUWaAB317+Fina/KEJXTeVwwXtKgvXGCiCREFsPFH6wzF
	dKPkC8hTG2c
X-Received: by 2002:a05:6402:529a:b0:6af:a270:b2b2 with SMTP id 4fb4d7f45d1cf-6b17c163ac1mr9457773a12.0.1791812664516;
        Mon, 12 Oct 2026 06:44:24 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.202.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1b3387932sm1931375a12.12.2026.10.12.06.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:44:24 -0700 (PDT)
Message-ID: <4b0c7760-ea60-49ec-a21e-7aff07f8130e@linaro.org>
Date: Mon, 12 Oct 2026 14:44:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: Add the SM8550 CSI TPGs
To: William Bright <william.bright@imd-tec.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
 <20261012-sm8550-camss-tpg-v1-2-620ab6f151dd@imd-tec.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261012-sm8550-camss-tpg-v1-2-620ab6f151dd@imd-tec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2026 14:03, William Bright wrote:
> The SM8550 TPGs are hardware version 2.1.0, the same as x1e80100,
> so describe them with the gen1 TPG ops.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 50 +++++++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 5128dae79103..70f327484503 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3553,6 +3553,54 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>   	}
>   };
>   
> +static const struct camss_subdev_resources tpg_res_8550[] = {
> +	/* TPG0 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csitpg0" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +	/* TPG1 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csitpg1" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +	/* TPG2 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csitpg2" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +};
> +
>   static const struct camss_subdev_resources vfe_res_8550[] = {
>   	/* VFE0 */
>   	{
> @@ -7245,12 +7293,14 @@ static const struct camss_resources sm8550_resources = {
>   	.legacy_phy = true,
>   	.csiphy_res = csiphy_res_8550,
>   	.csid_res = csid_res_8550,
> +	.tpg_res = tpg_res_8550,
>   	.vfe_res = vfe_res_8550,
>   	.csid_wrapper_res = &csid_wrapper_res_sm8550,
>   	.icc_res = icc_res_sm8550,
>   	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
>   	.csid_num = ARRAY_SIZE(csid_res_8550),
> +	.tpg_num = ARRAY_SIZE(tpg_res_8550),
>   	.vfe_num = ARRAY_SIZE(vfe_res_8550),
>   };
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
