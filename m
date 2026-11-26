Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672795;
	b=dMxbea2Pqy9/QIkKZloeZ1gGztquyWSnPZnBobcV3q9tEihr923hojUgAxewX27bEV+o
	 uA1XUtLTiqXVpk+IrHMBtx8NYpmLEMkoy2Azd8528xFf1xvAN06nwduU0NQN4nBnCC/9f
	 kAMZSDRns9wQdX1kfVRCTZKkTZw9/q76Yt1IcxByE5Erk+Po3+NalHI2WrEP5MQa7SPjQ
	 87GgWAyFHJPI68rYUcr+LiytMSO0cZjnFBQnem1HN9b6wqFVQD9N5HGmQi8uHs7ubZAcS
	 FbN7ON9sROzmQEWpy4J9JyVEom8viocJvSWcQPCcckLwl7TOV/b2u1fu0H7tdiWLWgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=k2IRBl9gY5e2oSUNrEWY6jjQeC8ZZ1pQO6bdpjOXj2I=;
	b=HGND1dXgzYdExJI2rf0tTPMqwLqOhcbE28SEjVI9jNpEq09aK4EtJ5E/1JEPZXAniS5I
	 4KlM+dKPB2BJJuz5UbFidA3OWfgnIQjLIb8wcvSTTPL9d2oqCiBYnJIXpJNSRFnW5HhRL
	 AMJRcdyYSwxFLaLaC3FwGB8pGmi5h/fQOEnZYoufP0uUaRBWwAiQY2wqcMg7jGxM9jViv
	 X+KBGvS+Ze2MopG7UnDPLCI9H/LkcusPXQi/zEHJZnK9pjgqhdy7YXrF59Pq+G4nJWMKR
	 fgq1AhAvU26ipAWu6Etqd/W0VpVf6xKBOV3UdqpQcjGUULZb9W0NrLsLQG9qrPTiQZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eXnfkOdx;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AC1606A31E
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 05:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8AC1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eXnfkOdx
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c00c727a21so543201e87.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 21:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795672793; x=1796277593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k2IRBl9gY5e2oSUNrEWY6jjQeC8ZZ1pQO6bdpjOXj2I=;
        b=eXnfkOdxJc0Gj7vmJ8rNyjwrixGiB80YcEjr3kfxXXWycGgRixJo8zxbnIzNFq3yNc
         2mMdoAgIIepQ2rgKnIcqF0K8Ll9eeCF+H+HCXTEzWIn2DGA2jL4fMrPxUFQy3HCk3Xho
         YM+CEtXOh/+YQemc6c8XUTfwL7cc73Wxn5BAxKVko7gF0qH8FaoP1GFQFthtGnYhYhj4
         v/6KADYgbLYCA3z2UPDOvPzdlYW2TEnWANnnfLA9bWYQTYBGWmyjVSZkSQtsixl6N+8z
         7fuqCjnuZdhE5DFOtA9to/FYLZvKfJdwZDx64/SawBHM+x+VrPGbavm2BWt0jy8yf4eq
         00cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672793; x=1796277593;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2IRBl9gY5e2oSUNrEWY6jjQeC8ZZ1pQO6bdpjOXj2I=;
        b=rYS61JEOpZXJ2ZwwDSDfWKPSBk1ODGu7+SCRLqgXwSooyZ/+hj/n1yheAYbFUxzk6X
         roPw9QsxFfDVMEHATrVEANMLeTis9mfMPGkWzlNx86clw+tW0TPqp95m1skvpJOkKmCE
         eS5wr5Ijq1jP22ARIIE+oc5B+mG3YtnSA0vKkQJQnopkkvEaVX++H7YdOztcEdAl4T2b
         VS1Lw1pJvEzALMDxXZ2FAJz2oRAbqPEnoVfIwhshfaQNIXNnHIjYpRxSKrZhu8Pg993z
         m7Cj/Z6414F9E/O84iaobo4246Sec5g4iui4mcktkvLu5pGUS/m/uayGuKnhzYYe84vX
         Mm5Q==
X-Forwarded-Encrypted: i=1; AL+hErGNZVrrRpj60b9mzAgFsrsOY99Mn85+6/wCucdFmiYAiRYpUlSxz5cYiN5aLpekQXGxoZMw5MUl3V/GGg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ewRh0gyJkpO9sHXszgXk7Ywv2dt8u7Umq3LW6VCv/+LiZVguw
	64llhTGxNRK7ur6i3w5mhMvgsrvScC467PIvVHY9JVoEZslGwD2yHU0IOpUz8IMHgQY=
X-Gm-Gg: AZFdTZcGUME0DrotdganACzkgXou6IpMljVovXniGsVMREwFjpHGwcZATnXILzwueIp
	Sq3rn8EiOr1dcslb1LuAa1g4BKC4kychBet3tadlzVKiuMQgAUB5UJcmFt6vJIdFGm4mizJ+1Gz
	44/ONfUhWiEPZjqDGuyewSukMxdGtbnegoj+JpytGIvdlp2WXj7G6GMdhIk0lUvgXyQRGW5yHyO
	Tn7I5RkYeBAnXQQJSYkL0mPl0A17+cJFHvZHb195sbMAcUSv5uO88mkfKAVt28tTMvlrueCmrFz
	2E7XivN7z2yTBEfrDSXsWW3HhCufCxHVeVOA61BsqjTuJf8toNn/nGRlDQdhqb09ccJBTR7MOIN
	FwMxj5xT7l9bL8UOAKgoixk3YWaT1p44j78MWaagt4w4mK+gg4ie9b/XkL/vrutDiOGcbF3utf1
	JUW7Tfw2hm+uoAfe5Wwxy+TF8pV8KLc2823YDvDj56WvdxyTbUUCaffhyidEupXH48K/jkqfqX3
	1OB6kgY+H0vzojGgOBmH6nANhRENBt6HeVUxLRTA+bovtl76hv/SEfAXaX6WoBYWe6Hy2GTYL/H
	n1WXI7bseBiNbt2S4Bp8eUEs7Jis502YGlYMmdMZWT36Fuz9XBj5QEvGZA0zvndYY7mOd1ygG04
	c4kTjACI=
X-Received: by 2002:a05:6512:12c7:b0:5bf:a48b:7827 with SMTP id 2adb3069b0e04-5c1bc6bf385mr6662753e87.2.1795672792982;
        Wed, 25 Nov 2026 21:59:52 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01b3eesm5192662e87.42.2026.11.25.21.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:59:52 -0800 (PST)
Message-ID: <6d7257a7-92dd-4a1a-a598-9a4cd2be6e2e@linaro.org>
Date: Thu, 26 Nov 2026 07:59:51 +0200
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
Subject: Re: [PATCH v4 2/2] media: qcom: camss: Add Glymur-specific resources
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
 <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 13:36, Nihal Kumar Gupta wrote:
> Glymur has three CSIPHY instances while X1E80100 has four. Reusing the
> X1E80100 CSIPHY resources also exposes CSIPHY2, which is not present on
> Glymur.
> 
> Add Glymur-specific CSIPHY resources for the three available PHYs while
> continuing to reuse the common X1E80100 CAMSS resources.
> 
> Fixes: 09d6c30d3fae ("media: qcom: camss: Add Glymur compatible")
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 42 ++++++++++++++++++++++++++++++-
>   1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..f3cab9ecef04273e09b81ee0cd4e31ca45d1c915 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_glymur[] = {
> +	/* CSIPHY0 */
> +	{
> +		.csiphy = {
> +			.id = 0,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.csiphy = {
> +			.id = 1,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.csiphy = {
> +			.id = 4,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -5572,6 +5596,22 @@ static void camss_remove(struct platform_device *pdev)
>   	camss_genpd_cleanup(camss);
>   }
>   
> +static const struct camss_resources glymur_resources = {
> +	.version = CAMSS_X1E80100,
> +	.pd_name = "top",
> +	.csiphy_res = csiphy_res_glymur,
> +	.tpg_res = tpg_res_x1e80100,
> +	.csid_res = csid_res_x1e80100,
> +	.vfe_res = vfe_res_x1e80100,
> +	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
> +	.icc_res = icc_res_x1e80100,
> +	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_glymur),
> +	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
> +	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
> +	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
> +};
> +
>   static const struct camss_resources msm8916_resources = {
>   	.version = CAMSS_8x16,
>   	.csiphy_res = csiphy_res_8x16,
> @@ -5806,6 +5846,7 @@ static const struct camss_resources x1e80100_resources = {
>   };
>   
>   static const struct of_device_id camss_dt_match[] = {
> +	{ .compatible = "qcom,glymur-camss", .data = &glymur_resources },
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
> @@ -5824,7 +5865,6 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
> -	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>   	{ }
>   };
>   
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
