Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622169;
	b=g5kLU9f3m5e0PqZknxS+wUapxegcwQa6RC5z9v412JTnKwKUehu20DyVAX++D/2STYZD
	 ypCnGj5Sn3P7j7tZmRNk9V2GNpKS2WQ6kvcOvr91xkxUe+wVHMjWsz8ovgQXkgT4IoRzI
	 j6sppLejwMelfMX2RoIeUXGrNXIlACtowgXfgIbVJbLejh1zYiqhVFMcTAink68MAoFva
	 ECpZjnKpQokilisVvpXmmmLmk5KaTY7Mu232/b7S6bWiN2eD7SNg9LxdVuP27lcX7azPI
	 a9C3BOyiWZyvM3yRXYQDoAk921AVzTvPK30mrjoLyYjocqi1tBbkVX8VI1xcWI2keww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kmQzGUYJq8GyqElmnF+m9lGa7P1/BodBcOMVYUFmNvw=;
	b=IHgOIeXELqvDNiMS5FKohSpFx61YQxO3EaCzfqqzj3rUBsxqncXg94WOXAqWTPksHwCq
	 Gt1FeipD/MT+6Hmwfnci/sUHySHZZadZ+WJsqk1zDxkv1Q5fN8QSrTSY0wQvE1JXQ+vGS
	 VdXamV0Lo8G2lsdDiSSACPCBITA8NQplCinH5yaD6Luzal6LDbXEfxsv0VP1rxbfy34i6
	 Yzgvke54/1R/7R7dxrMJZ2JPUkl8d7uMo4xjCF1NIbwODU7+0nyknIYtkoA6hij+nzthh
	 qiN5Smqwmo0qD9fBzJOu+jD7jQbQDpfUVvwoUb6lp6qgHJeKvNC+q+1xbXg4EgoMGOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="hD/qB7WJ";
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BB5606A336
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 12:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BB5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hD/qB7WJ
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4395d31228so450052866b.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 04:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793622167; x=1794226967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kmQzGUYJq8GyqElmnF+m9lGa7P1/BodBcOMVYUFmNvw=;
        b=hD/qB7WJtkPSzakBjBrg0ErLrQbefMeN50hPSmPc4DKcYcJYvddKvLdIEpAyKkA6zU
         ZnSw79AKQKyL9hZ26uuMsJRLlRUYP7+uoRG6f0DtD/D94HWijt4yN1hxkR29rhYaG0E9
         3HNwIij6hjEnZ6teA6Nyc+Ng1oQ0MwGwFAK2RlXjGxEJdXZeM0ubnC9b4rAlBiwTVyDh
         ZkocKd/uKbHmcQZnb/aB19Sd3MdfyQFLktM7R1jfsRUXyq0LLPa0d1IeM20C7BJEZMA8
         bpTRQMW9dtw9SkvGNyVFd9h2FA+D3h81o2LVSoNbGQd5pxzHE28FYlBPal1IIrFs8h0L
         IjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622167; x=1794226967;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmQzGUYJq8GyqElmnF+m9lGa7P1/BodBcOMVYUFmNvw=;
        b=05gLc090/RL7Xod80IuT6xwJVLFkEYNHMkp2wKpFuRT/fT59N9CgZIuLrLgvZ56ZgX
         Ayy99YSNkh+tnQr0ANmiD/2XurtfT97Dv8LANwfRt0w6q2KIUGKIk7KiRdkeLA9zeI9H
         2UUES6WiaXhojYJSvvv+wRLW9siLjq111kRUPZOUw66MewE12lGcQ0ckFkgT9Po0GlS5
         zB9qCyFe03aaa0R84+AaS3Ng+ZPrSU1kbuknipAHZ9G8EGcLIH9R8zp3AmrrzsMGETm3
         CCNO/6Ym6FNk5xG4eBAmejLK/Y5sbulTQ8AvtenfewSxrHOSE6R0/Q8gTOl/GXO1ViNC
         cT3w==
X-Forwarded-Encrypted: i=1; AKwUvBwKobA1rN6A1lWIfp6MaLzmHPs92J8iNFcryn2vEuHcdxg7knLuQNvYNsrfPjuyrc0MbPh/rEng07eJ1g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJul8ffsFg1ZtmS92uwAioP/OONQRkENGSyZMgIsrMv0dhTNHyV
	+rrGiP16JIKFE0G45X5nUmBt3fG1/fMv6IJHC6DLitytbEyHulM4g6UbnuZMxuPI2Zc=
X-Gm-Gg: AYBFou35RdfCi5EtnwSmjs05mI2wxdqjoPPjD5/3+wiLdC9WEiWJTMpgOMRnMAZnFg2
	VajC4MWJJecduVP/O/HCFWRZjzOfDiLHjt4kklNPyRHxGMJFYrGU41NaxzoVpaDKC4WB2A4p5AI
	2MiDm106i2rFvLot87lwmabFgVe4nHNn1pF5g2ulsywXp6sEXLpq03mon2Rwih0sJ56bR5n83Tg
	w0XHpvyXePAMCxz84EwT7aYLcasVmKPO1lksgUMxWIdmApF7owvjORuvYx8UK+foNC4fnA3XcFj
	g3NF7fX4qah012ixZxMmBxWXYoG1pVXXIUS3dtL5vuGot+rFh/w5vQ1MBXsJGeyAVegRWn6Nlvx
	gz/TnL80Cs9qIuW64bNcydGAiM1xK8vnPU3jc6OKWqxSubpCcLXOR6Me1FZIILF0Tv1PdD3qOF7
	ZI2GMNY5TMKCdeuIt8uqkqIIlyIrkDznL6DkriAlyCkMrtmF50j6KrhszKLPxZD9E3NZR4kz/0P
	2pOcqpq07rpB6CcIesGLfaB7VsriWsy2Zn5zzVTPojctfIl/Httnz3JKHd4BQISLU1WimigINcJ
	RmXTew9uBZBQCDKPiMawYFNSLMXPdZtXlOFmwA==
X-Received: by 2002:a17:906:9f92:b0:c29:4915:83cb with SMTP id a640c23a62f3a-c4ca7ab09dbmr821664466b.39.1793622167110;
        Mon, 02 Nov 2026 04:22:47 -0800 (PST)
Received: from [192.168.0.167] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc19167sm384387266b.10.2026.11.02.04.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:22:46 -0800 (PST)
Message-ID: <cb4fbc79-d72b-48d4-962c-479e4ebc7e51@linaro.org>
Date: Mon, 2 Nov 2026 12:22:45 +0000
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
Subject: Re: [PATCH 5/6] media: qcom: camss: Add SM8650 TPG support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-6-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261031112203.545319-6-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/10/2026 11:22, Vladimir Zapolskiy wrote:
> Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks
> of hardware version 2.2.0, add their resources.
> 
> CAMSS TPG on SM8650 needs the non-real time CAMNOC AXI clock to be enabled,
> otherwise VFE receives the frame start event, but no data is written.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 53 +++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index cf4687a20dba..9eeb7e4a7315 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3423,6 +3423,57 @@ static const struct camss_subdev_resources csiphy_res_sm8650[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources tpg_res_sm8650[] = {
> +	/* TPG0 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +			{ 0 },
> +		},
> +		.reg = { "tpg0" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +	/* TPG1 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +			{ 0 },
> +		},
> +		.reg = { "tpg1" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +	/* TPG2 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +			{ 0 },
> +		},
> +		.reg = { "tpg2" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +};
> +
>   static const struct camss_subdev_resources csid_res_sm8650[] = {
>   	/* CSID0 */
>   	{
> @@ -5786,12 +5837,14 @@ static const struct camss_resources sm8650_resources = {
>   	.version = CAMSS_8650,
>   	.pd_name = "top",
>   	.csiphy_res = csiphy_res_sm8650,
> +	.tpg_res = tpg_res_sm8650,
>   	.csid_res = csid_res_sm8650,
>   	.csid_wrapper_res = &csid_wrapper_res_sm8550,
>   	.vfe_res = vfe_res_sm8650,
>   	.icc_res = icc_res_sm8650,
>   	.icc_path_num = ARRAY_SIZE(icc_res_sm8650),
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_sm8650),
> +	.tpg_num = ARRAY_SIZE(tpg_res_sm8650),
>   	.csid_num = ARRAY_SIZE(csid_res_sm8650),
>   	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
>   };

What happens if we apply patches 1-5 but not patch #6 i.e. if we have an 
old DTB ?

---
bod
