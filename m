Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D4B38AC88
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 11:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457908; cv=none; b=FeUPWoi2n0ZzPhPdBPbtURqaYUvihdiPnLjJSrOhKZ/AjsCpIyPEd0RcpFt4WXxzwGerDWQ7o2ghZ/38rr9Ovc0v7FT8UmCezczI80tnwK3crZnpC72mXnVoahbj/WzT9gtXepd4cQf3CHbKuaveCy5g+sTb4Z3797YTj0gtFX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457908; c=relaxed/simple;
	bh=09yRFoZuygdD45EUDMQtl/Q4C8O2MyJRR3brstd97FU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFBHXDgs3UXdYTWBGJDxTJV9VPVdg9DEV5AooWOHj/+qhN6yYkM7S5+OMoDU2EXm13RMKjMceg2Wslw2YzI+PWkQfWq9xaP3jmeM9GNLtkUzssoxZB52ef9uYYUjxC4EHz6p48OEBM6HYJeOBXaZwlnovQERsfsGhoxLY317Uhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CzwByk7D; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CzwByk7D"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6aa9164072cso2332174a12.2
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 04:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791457905; x=1792062705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7xXvsj66wQM38M1X8uFAHXI+21qnaIAFX1qmFu6hhD0=;
        b=CzwByk7DDSa6l/Fe7qcB309ljXIGtSjAIH79TqFh3EDLGT0qpOmsKsWaB4J3Fsy3JJ
         kGtZMJ+rvDVe6J4vXP+a/d/QqY5NE2vd4YxLLVv9na6fkzMQ1D7Rn4blk+M1YjH3+RWv
         4Ln2/Io1kIc6pRzRRusJIBhHRkQ2vgQrbrX/3gPwdXtzTQoLGGgOuZ3faJ6u/HLQucGt
         aYl0RMHN4QCNjMWxWPAmirq3ZOuCOXXgvzlmayj/fsBAjb5D1cGixDCX2WslmRZ/w7aZ
         oxD/cPhq4+qmJdiP409IC4DXRJk7N00cNoR9UoglyIRkrqT390lzLm42ZDOlxGER4ktk
         vhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457905; x=1792062705;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7xXvsj66wQM38M1X8uFAHXI+21qnaIAFX1qmFu6hhD0=;
        b=Q3FpydJPaKSGtOx0VVvo+mf78UpkKyEfBKpSO/OdUTqrtCNDGVLMKOFNprfoo6s27T
         NTkmaZ6wCVgk4AWcJeweVrO0uAYz4RhE/btN5M419Se03HQIEeVbZEJk+24voy0mjIPp
         uUUluz6Cu6K9fgdjSUOacXvD47bbbIF2A35c3EOqY60gXnCfxfUhMUlFwsEe5JI4E5m4
         uxv1CUnn3o6cd4Mw1aOCHtNP0NvwO4sjlA32pfmPnh82cuipS4eQk1pZxaEdT67Eq+hp
         15TtWIKyeSUMEWgfMcpFzo4eb9jtcq+lZlWK+ru5xlEWVNYyYrZJDy3niQ9hjzWE2Goe
         kBbw==
X-Gm-Message-State: AFq9FYJItCTBaX0rgj1/LSf3nMwNoHfJP9WFQo1N3xDHu/ccRjFsAw0F
	Pvp8xwvopu9/QdGIPdbpoKu8VXfydAeen+QDHnTNIokWyyoao29KcyPZXFfu/aGYWL0=
X-Gm-Gg: AYBFou2/VbElI4QrQPClrz1nmvhxOYOJeLbJhHeub1CGmmvCWIz9Fhflx3o//ruGpsW
	6Wtl0UyPnXbi4W9z2VlrRuovHoc5GH8UqwmTlVYfo59POkRFgctdLOyiSpots+CSrpZrSVaGaz4
	eErDoslGvwLnHDGUm6cjUj3IxzBOWOPRL6NeWfqGQNIOXl4TYsudG0pUQF6WWFAgI2oxqaF34QY
	kYXwFL3M3/YLfKyHpgbYlREnWGZqeuO9AA57i6nw/drEWnIlixwzP26cgQljKVo9ocO+O1j6E0V
	Jfddv78pD4isHLIL2MN2UNM/Qmqp8U/YDiiopwhL+Zwcrx5sgsAlsCw/mY4T6KNpRjgaQD+jluQ
	muMY39gB3HiQmcoV61ZF9ACTPp9f9Wvl5HuNe/dZmRw0rtBc9UQ/0QlK791eFZqhXHqEl9Vf6aC
	0vvKrvyblOe/R31qCbaor6sn3APrCuRE81YRk2T/REhNKN6PiSQIetLNgekM5Hadb/mNqxa4eKh
	hOa6/4olWO7
X-Received: by 2002:a05:6402:46cc:b0:6ac:bdb6:f245 with SMTP id 4fb4d7f45d1cf-6aff47b4913mr4165062a12.24.1791457905432;
        Thu, 08 Oct 2026 04:11:45 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.203.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b00aa492d2sm1245502a12.32.2026.10.08.04.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:11:44 -0700 (PDT)
Message-ID: <5d4ac08f-b525-49ca-8715-b4c2fae1c11a@linaro.org>
Date: Thu, 8 Oct 2026 12:11:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add support for X1P42100 CAMSS
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com>
 <20261008-purwa_camss-v4-3-bcf11bf2c650@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261008-purwa_camss-v4-3-bcf11bf2c650@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2026 09:27, Wenmeng Liu wrote:
> +static const struct camss_subdev_resources vfe_res_x1p42100[] = {
> +	/* IFE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_rt_axi", "cpas_ahb", "cpas_fast_ahb",
> +			   "cpas_vfe0", "vfe0_fast_ahb", "vfe0" },
> +		.clock_rate = { { 400000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 345600000, 432000000, 594000000, 675000000,
> +				  727000000 }, },
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 4,

.line_num = 3 until we merge PIX support please.
> +			.pd_name = "ife0",
> +			.hw_ops = &vfe_ops_680,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* IFE_LITE_0 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
> +			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
> +		.clock_rate = { { 400000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 266666667, 400000000, 480000000 },
> +				{ 266666667, 400000000, 480000000 }, },
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe_lite0" },
> +		.vfe = {
> +			.is_lite = true,
> +			.line_num = 4,
> +			.hw_ops = &vfe_ops_680,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* IFE_LITE_1 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
> +			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
> +		.clock_rate = { { 400000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 266666667, 400000000, 480000000 },
> +				{ 266666667, 400000000, 480000000 }, },
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe_lite1" },
> +		.vfe = {
> +			.is_lite = true,
> +			.line_num = 4,

VFE lite has four RDIs so this stays @ 4.

> +			.hw_ops = &vfe_ops_680,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +};

---
bod
