Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865194718DE
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148853; cv=none; b=msftEKRdGRlDrOE8jQXnWiu+tRrbn/Zr3FzBnIi/FuzozDZzAYSchJZ7QR8Pmog/ZlgsFRG02J/ict0TYG6glbjSu7fwrbdx84DV9BB469Js9DZkM/7GfadhBknui16NO7d2QYgT2AHr+U6iQ4WZCBNDqpMrLN4PDfa/W1FIBf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148853; c=relaxed/simple;
	bh=ZDcMunxd98cuO0F7FMu7fkkixoxvBN1tgMVTeIp/JyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ls3v2QG6mcwy13EdR6wm6kqy9R7LWTTYO0CxuqzMAR+u9oGxruGYhKJiJsCJ9BYB3WYTLb+AcH4LuXzrD8SoL83z9VJuGtyXA+K09hZQ4BFTgQS4Wz88FWGu4iAZ0Li99NO1ZTmBwnhEDfpfHlQ8LNUl3xUeNcihvM0SIWMHzCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TEI93Gb2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TEI93Gb2"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so681274f8f.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 04:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792148847; x=1792753647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJqf2rITdCzziip2V1CcQ4gA2chUDN+IaUybbZl++MI=;
        b=TEI93Gb2ZyoBvpdGFTOblgsStFhAC3JSuO97n0HpNO3ASPk97RzKADz1fxDZMZjSwy
         oXajyXzKpXsvMoDo9X2smFfQDWnqOHsZcYB8BuNlD6AUonngN+ogpKKmhAbMq/gkA1e0
         kK5LUn2U/rnz3ItwL7QYKna+6PkvH+eSzBEL4D0WczrHs8jnA9Uwfk+qPbtBte7KH6lp
         9LvRkS1V0tzOjX3WHtj4pegDx4fDF+xo6axfPp5UjkvfCLriBAb39Fj9k1Zp7Xm43O2J
         S+Vwzaf9yLluE1ML4v9cY3hnj/T7mXw24h7+eZJZHr0rh7FHlitUBWOLwhFxo/3NYr+u
         UdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792148847; x=1792753647;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJqf2rITdCzziip2V1CcQ4gA2chUDN+IaUybbZl++MI=;
        b=Pv/tzLMK2HIFkpkKtuUWgqyjAREuqARGs4lW3Sd4t+cplZNk+zn9GMnFVloHhDR2on
         u15KAc2s5sjsOR+/eV+tkhuyACfSIRD99/cXus93m3rv9ktnSwYw+bTAziP4ySyIM1UA
         ECss58xckMPOKpjeEkNENCoURTcrp81R9enpbNX9oriwFz/Kvb8YuT3y1MBfWhEfHsy0
         21a/bKgL7QySJZOlor9Je8NgTJ683cEkFvnpR4rjsAb5mLCT6C1kDWyvm6Z+jzHQ5YYo
         81WhoF50AK4YeIwARz+ZVxhLG2zrtGZU2jvc5I9do/RdQPGcIWtp2onTzN6PolDcEOJY
         h3dw==
X-Forwarded-Encrypted: i=1; AKwUvBxlUBa8gLy5CoBh1kaIGt1iTOTOvdO1ZctpHbH/XKLeXyFm6hwRO7qoY4ExkG8ZzZnLudmxR6ryYf3yiA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKbb1jNTU1URz2+FF5xeghj43q+ZsRH1X06iXPnBsWLzIkLJMKn
	2n3Bf130In7/fA8tr4SgUwnxFu8hvoxO512XM/AuxZ4WFk5GZhGe7GkaeQjPRj4w3to=
X-Gm-Gg: AYBFou1PMk2tooEnYTcY5eH/qpcBY54FG3rtNAX2nkum6yTomAn9KcRkICYLOfjL1bw
	ySNuYkDRHcEIMsDGQTms8Le3cuTNjbzuOBWMjOVg6fKmSygcEKzeLqjYT6vn68cDM7Ag+iYHrvy
	KpZV2qsHLWGoU+9y6wvvhPFVOUaa3fFRWBlGUe2emZv6/8bYxZEsUkE/dnreDAmS4m1aDQoNfWE
	rsVm5qHai8cYvV41FGtTr3RT2DCzKVi84MAjdnZDF9Maa33XARdZw7LsxG34a1P/oNJLnS937n5
	n7S3i57c9CAjnKwy2jn3/3GxwSFAZDnRg/dQTBhlZIm1pB6FGBiaTT+jkv7mbRG3BYN1cz8zlBr
	7HOvPIZfbll/QbgLXl9Oq7Ozq4ZWvxqkdQFAVGuIxiWSoky69Wq3w3LX+1+m60eLwchxuyXXmBc
	2XijO5LKvgerP9d3xCLe1O4DlC1foKnL5f3I2f/s/CaVQiouA+soAUFM6gkQLE80ukqjbiWUfox
	UyL5aQNlE0=
X-Received: by 2002:a5d:6750:0:b0:48d:ed2e:6f3a with SMTP id ffacd0b85a97d-48dfacf53edmr4363835f8f.5.1792148847254;
        Fri, 16 Oct 2026 04:07:27 -0700 (PDT)
Received: from [192.168.0.167] ([109.78.92.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm4468353f8f.47.2026.10.16.04.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 04:07:26 -0700 (PDT)
Message-ID: <27382104-14f0-4721-8d76-03fe9f2c1ba5@linaro.org>
Date: Fri, 16 Oct 2026 12:07:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/4] phy: qcom-mipi-csi2: Rename the D-PHY init
 sequence
To: geocausa@gmail.com, Vinod Koul <vkoul@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
 <0mIVMmu2iTCn5IeBYzGgIAH1kG2MFMNadT3axJ3D5fX-n2f-sXxmZeicphrhRwRt4YUTZBY-4uEATZz7IiQEGQ==@protonmail.internalid>
 <20261016-x1e-cphy-rfc-v2-3-377654253193@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261016-x1e-cphy-rfc-v2-3-377654253193@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 11:57, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> The init sequence and its size describe the D-PHY mode only. Call them
> dphy_init_seq and dphy_lane_array_size, so that a C-PHY sequence can sit
> next to them under matching names.
> 
> No functional change.
> 
> Suggested-by: Bryan O'Donoghue <bod@kernel.org>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 8 ++++----
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 966d79c98..b2d4ec3e8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -246,8 +246,8 @@ phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
>   				     u8 settle_cnt)
>   {
>   	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> -	const struct mipi_csi2phy_lane_regs *r = regs->init_seq;
> -	int i, array_size = regs->lane_array_size;
> +	const struct mipi_csi2phy_lane_regs *r = regs->dphy_init_seq;
> +	int i, array_size = regs->dphy_lane_array_size;
>   	u32 val;
> 
>   	for (i = 0; i < array_size; i++, r++) {
> @@ -372,8 +372,8 @@ static struct mipi_csi2_genpd x1e_genpds[] = {
>   const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>   	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
>   	.reg_info = {
> -		.init_seq = lane_regs_x1e80100,
> -		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
> +		.dphy_init_seq = lane_regs_x1e80100,
> +		.dphy_lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
>   		.common_regs_offset = 0x1000,
>   	},
>   	.supply_names = (const char **)x1e_supplies,
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> index 7e55ae007..0d6031a4d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> @@ -48,8 +48,8 @@ struct mipi_csi2phy_lane_regs {
>   };
> 
>   struct mipi_csi2phy_device_regs {
> -	const struct mipi_csi2phy_lane_regs *init_seq;
> -	const int lane_array_size;
> +	const struct mipi_csi2phy_lane_regs *dphy_init_seq;
> +	const int dphy_lane_array_size;
>   	const u32 common_regs_offset;
>   };
> 
> 
> --
> 2.53.0
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
