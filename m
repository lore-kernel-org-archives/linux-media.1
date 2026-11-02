Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632901;
	b=oZiQg9FdGOK0kWo78gurrwfjAUQdcClrlG2fgeFgaEmo8Q5V5Zco0aPnGUHDPB2vkNXP
	 EF+I100sl5zlAZKfv7JoVrJ9iWFn6j1uiiE+NpjqgtvuBCz0XY/8TMChGFcsrf+p4pOBH
	 wz1hdI5c6o80nRJfpdqzknVWarukAVTDGWcW421b9a62cxpk4O7u7eO/l4+FIpF6aqVuz
	 iIDlkQvCCKvp/EmHaHaLnbLeI33hNwsoOASuH/8orjhiETjBlilbY34XVn1qITWzB4ZW7
	 lFQ+ldrsSg/eRYWitnWs5I9o4OeHZy2cJ2H6hvrs6zUDnDxLKozDyT8hAON0Gu8W0SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=oPKZdFeFL57f1TYzik5gLu6fyy7lP0pCyy5vLRZzH0Y=;
	b=hrStZfo7eP4tT8U5kn5/iiLOJDSEGETRcvcON3T4e6OVjyQgpJwVwLC0JqTV1NVlmxtF
	 AjtptryEE3dQ7EYmLEIgv9nSTy7pDdqj6p9WoY+kQtb1tZLFT41wDzeYO1b788GEEpAda
	 d7Ql1t0CHwaSV/gYb0bpDudpNsK7hWCTShvOYhi22t4EM5AURg2JsF3IP0843Oy3FYFB/
	 29lead2v8es/Yzs6KvFPQ5PacXF3S2S2/XcLIsQZnf/dV1f9RNwaTC8jriDG8Q9bDph8R
	 eLu4hFbp5C2UvF9eWQ+aq9rAOIHMQLdQu9LMBNAkNFn/0pESeT/NWFT4BqmtqlipESw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uEVFVyOG;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9329F60C310C
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 15:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9329F60C310C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uEVFVyOG
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab1cb6eb70so5899951fa.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 07:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793632899; x=1794237699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oPKZdFeFL57f1TYzik5gLu6fyy7lP0pCyy5vLRZzH0Y=;
        b=uEVFVyOGIk0RY/9ot+HcRUWU+sMnWpraEVUWLacZqldj9h3U0yqpgZ8kfQ7KPPueqf
         aCOCbp1q9sXfE2ihFbP+tNydspojLemsi9rcrLRaqR9a4jKZTMsB7E1/nhUoQDghuXlv
         wJJv+wMQk+3a079G6WDqsoCPRPPQTf+bn7k+Xfj5LMRGo3yk3EPjJabwILude8er/7DA
         jJslthkiqcG4HH9l7AsQlttGor2TcJby6XW0y42sIYkkewlrLryHR3S7EFAQwNJ8iNBX
         /NuaRtuPTXDHQNJDiLUL2q5ilk0ruaESjpUoXU2c+1rzsm8Hz7dxao7XUsl7f6knc9GH
         gJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632899; x=1794237699;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPKZdFeFL57f1TYzik5gLu6fyy7lP0pCyy5vLRZzH0Y=;
        b=yxNRXp35rHk4/yJ01Dz3Gbf5m/4OW+4uAVYGAN43ped7vjakpXynkNJY0Cu4pMfxw7
         Du6918NqXXFO++24dZebZ6za1CyYQF4BvS9ICkhPD09N1YsezvkvB990MFHkIaH8IJSX
         DZ5aKpVZeo13raXXz1D146CYWZmUODEu9aahlAfN2SPas/321XlG4tOfADtiZyXD5TBT
         zzOLeP7Y17BNRqunjikyzm0RST8tb3tZ7x6AyTxF4WK3RyCVo7SExZ1mrr1HK7rDc1eN
         prBBlrDgTGq3GEnUD4TGtFsqyKGCSqvSGGYPrwpiJqj2TlxjjiBxj+FhBUOuLiBlRyGC
         MnQg==
X-Forwarded-Encrypted: i=1; AKwUvBx5vbN08GNK1DuVwBvN5W0hofRIa6ryhs/S6JmNYscDaYe+iTI/sWKarzCOi4XOqF25vAtLJ0rsb2NXmg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8YYIGcaH17QfULhiK07iAuHdTb4dRAdy3TaUTJ5fm9T1bEiCfH
	pl5jxGLbWzB8wdNrStiPpduXDNM0Apd3O6zgSdGTMVi9dQJ+LrdR0rogfk/8NdO+qkY=
X-Gm-Gg: AYBFou1yfsPiGFHupeaxoPy+dHTCXmHh2LpDFb/SFRQKflTPSLS+WnwccrJL2iKsSnu
	4W5B5bF+xGDq6M59HowURNUzFMRBM4R2O3mmzhiGN6YayaPOv7k7Q3miEcUe6X+LxXrAmGo2NmN
	IsjNyM6JWxOJZ3wiwDrb6i/zuVv8O6ys/hd5Vu1gNA2Vrywo8ThKyNLt/XQEQ/SzOfZ2zgVZlVc
	fKqS/3v10r3vQebNSLDnKtgylS9TabzkrhRw9mQa6EAM09doUbZk39mzW6Yr6S6GfhXdexoWK2c
	Yke+gq43NjgkxrVt0ATSIRCxJO01pgv1ylmqUrmd/1JoGYS762kMIFp8q4dRVewOCRvARpdGdYS
	/hzvOCwbihgHNuIzonNklnj+ontZ7gkxeyLyArW1tmgIJGGdJTAIhrIPKSH6NL+RRvZ4hVUm4ZH
	Yq38wLWQDrUBJ4f/nUKthAFT7sbo3JUxtaV5k7PrXVop0PrhYwGUW47lHzUuG8uqnEu4bIbpxVB
	xm0h7P62jB09mKRQcBpQKHK7vT0S/R27lcQ+2EfsgfiiFoULujRYsceE/TJtfqCKM0TJye0A8Xk
	5EcHfpnQnr1zhnZFvaZDwiBtq4Cx/RgWeUso40Uf34JxFdjhKeoYyh6b+Y9afFTobHtKt7tWp9S
	/iY/18g==
X-Received: by 2002:a05:6512:4041:b0:5bf:ce24:38c8 with SMTP id 2adb3069b0e04-5bfd95add38mr3190968e87.4.1793632898656;
        Mon, 02 Nov 2026 07:21:38 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072c0ccsm1724070e87.30.2026.11.02.07.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:21:38 -0800 (PST)
Message-ID: <7523d9ae-85ff-4e4e-ba52-dbe04c943534@linaro.org>
Date: Mon, 2 Nov 2026 17:21:37 +0200
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
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <cb4fbc79-d72b-48d4-962c-479e4ebc7e51@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <cb4fbc79-d72b-48d4-962c-479e4ebc7e51@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 14:22, Bryan O'Donoghue wrote:
> On 31/10/2026 11:22, Vladimir Zapolskiy wrote:
>> Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks
>> of hardware version 2.2.0, add their resources.
>>
>> CAMSS TPG on SM8650 needs the non-real time CAMNOC AXI clock to be enabled,
>> otherwise VFE receives the frame start event, but no data is written.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>    drivers/media/platform/qcom/camss/camss.c | 53 +++++++++++++++++++++++
>>    1 file changed, 53 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index cf4687a20dba..9eeb7e4a7315 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -3423,6 +3423,57 @@ static const struct camss_subdev_resources csiphy_res_sm8650[] = {
>>    	},
>>    };
>>    
>> +static const struct camss_subdev_resources tpg_res_sm8650[] = {
>> +	/* TPG0 */
>> +	{
>> +		.regulators = {},
>> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
>> +		.clock_rate = {
>> +			{ 0 },
>> +			{ 400000000 },
>> +			{ 0 },
>> +		},
>> +		.reg = { "tpg0" },
>> +		.tpg = {
>> +			.lane_cnt = 4,
>> +			.formats = &tpg_formats_gen1,
>> +			.hw_ops = &tpg_ops_gen1
>> +		}
>> +	},
>> +	/* TPG1 */
>> +	{
>> +		.regulators = {},
>> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
>> +		.clock_rate = {
>> +			{ 0 },
>> +			{ 400000000 },
>> +			{ 0 },
>> +		},
>> +		.reg = { "tpg1" },
>> +		.tpg = {
>> +			.lane_cnt = 4,
>> +			.formats = &tpg_formats_gen1,
>> +			.hw_ops = &tpg_ops_gen1
>> +		}
>> +	},
>> +	/* TPG2 */
>> +	{
>> +		.regulators = {},
>> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
>> +		.clock_rate = {
>> +			{ 0 },
>> +			{ 400000000 },
>> +			{ 0 },
>> +		},
>> +		.reg = { "tpg2" },
>> +		.tpg = {
>> +			.lane_cnt = 4,
>> +			.formats = &tpg_formats_gen1,
>> +			.hw_ops = &tpg_ops_gen1
>> +		}
>> +	},
>> +};
>> +
>>    static const struct camss_subdev_resources csid_res_sm8650[] = {
>>    	/* CSID0 */
>>    	{
>> @@ -5786,12 +5837,14 @@ static const struct camss_resources sm8650_resources = {
>>    	.version = CAMSS_8650,
>>    	.pd_name = "top",
>>    	.csiphy_res = csiphy_res_sm8650,
>> +	.tpg_res = tpg_res_sm8650,
>>    	.csid_res = csid_res_sm8650,
>>    	.csid_wrapper_res = &csid_wrapper_res_sm8550,
>>    	.vfe_res = vfe_res_sm8650,
>>    	.icc_res = icc_res_sm8650,
>>    	.icc_path_num = ARRAY_SIZE(icc_res_sm8650),
>>    	.csiphy_num = ARRAY_SIZE(csiphy_res_sm8650),
>> +	.tpg_num = ARRAY_SIZE(tpg_res_sm8650),
>>    	.csid_num = ARRAY_SIZE(csid_res_sm8650),
>>    	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
>>    };
> 
> What happens if we apply patches 1-5 but not patch #6 i.e. if we have an
> old DTB ?

It's expected that nothing terrible will happen in runtime, and TPG registration
is skipped, since patch 2 from the series is on the list of the applied changes.

-- 
Best wishes,
Vladimir
