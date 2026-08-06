Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9653DD51D
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 07:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786003090; cv=none; b=nvZXIWXjrtyG5a5lIM/KZtvDokqx1OvlTU8SQuO3NACcSqzOaUXwUCYtkpx1eypxC2YWHjqMFkfQhZveo/ovloqdLhzuv/dDgdhT4P5pYnjyIcnCS7JJsItad+c17NRF+/ujCezQY/ZC1cq2j6/NdOGFwveQilm4YoSfZXwnsMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786003090; c=relaxed/simple;
	bh=tI+N0a0wfxMdNBRKZGb2ZGPqHO4OtAB40aOT08pkdww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c57/vTf1aEQrsSiRPzpFLKwkUF5X1vaqgG+94tAw89UXYU643ix0nhtgIX8v1QkSpjJPHXbmzb8LXyzPx9cagkOGE6tt53MmCzMDbDPJdn0ZBHyz21SO3HZ3wtIgMTJe2GBzSqg0D7UaWo6gDsxee23uc8k55EapnjiQSZcgoa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipS8Rkui; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbiaunKH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipS8Rkui";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbiaunKH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763x12U482620
	for <linux-media@vger.kernel.org>; Thu, 6 Aug 2026 07:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ldzWFN9pHQYJUN2j5inoFoN/0RcHqULrphDDtK0FC0=; b=ipS8RkuioOY9xwWH
	4sFrahfgboYEzxphcn8IxtOyCNNIWKj0qjabRUqPp4kn7UJT3wva/aaPUhKk/yVN
	zOVBMz8WY1sUnO7WGG7NUbbc5eQ2JqBguLg5xztTc6iyvLFSmy4QFXEf+yBXXe76
	6is3FjIs4VRZHhAvpsfEjEnzgV6dDPwRFaVDID3L1JhR00/vShaHyGjrTsruZCvi
	V6kXiiMRkqPeDa4A6nAVAJmN9Q+8tusm07afZjpCBgXsoMEBMUm+hEKtg04bmewV
	g0CCo5SOkr8+C32/DeK53Ai8k9lIWj0hV+GRyrxHdvUG5cXNpLkzB4AfDGEDnmga
	rzEdQg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuegvtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 07:58:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso2103937a12.2
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 00:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786003086; x=1786607886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ldzWFN9pHQYJUN2j5inoFoN/0RcHqULrphDDtK0FC0=;
        b=YbiaunKHBk6D5cTu9ZcJjZOI5djRxM10Lg6w7iQsNfcPjpFVzJ6PMfwc7+vCpdmF3i
         nKUmwcZChG1EwZXXHEzzfc1lk21NNs7buc3SWGW4YbdNtoWvCTXu018ZkCZ7XXLErdFM
         YrZAHhZzE7Fznk1YTUYP6P55AJLap3JLW/KriqjE0BdTapCuxuZ/o4P00u+NvHq+z8QH
         Wl6DNm76tmWD4oRnNtcMS3PQo2bLj/5EJ2+8H04wwFMpnXhDrxp+zxkjnIYITvxEybCT
         jw45yzw3Vu8hst9WSYpsGsZmIRYPl92J+hvuqUu7+Op7GsrUWAAkttEAnY5qxO/xUzxI
         8zhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786003086; x=1786607886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ldzWFN9pHQYJUN2j5inoFoN/0RcHqULrphDDtK0FC0=;
        b=QOHphgh3kcJELajg7LgeXeiXpVM6jxR8b4rbmryqshZS+ALLOQhasnLmi6NQoL1Ryf
         TIMuznw/lbzAGWGCcFxmfbQEeYBd7T6hPmpkLC5ZRazIjCoISx5vntNqtin8AOnGGxOl
         EgJNkfWRCyTKi5hpZggapBTks2t83w1FgUDc0wuMVpeUqSPiYvejx9C5qjUiiSevLWNd
         NEbphuMqgh5/7zFe50Wk3six+vL6y8I9uPoeBbxdid0YW3X6nwXSdsiAXW+ro2IdPOP6
         O77VNto2OYnZ5EiKiEgfkP8RbLVWSaJbyfVwYlV2Hs3CzB9ZnHDV1xF0vGiULj/yevA1
         2LWg==
X-Gm-Message-State: AOJu0YxlrCCsisJz3WvbIdFBPzUHYH6Ja5VN2e1fGYhXtKdq95xE+EWc
	vAzd5d9ubtYaS0wvNv3mDWsDzVOSrWLkz6gf2sZSKV/YJk+zoinjo3clNJz+oEKEX9nHvErZPe7
	OM9ZPoI83Qqx3RHBm0yfjlHFLpUwVDIlniWXPFFh/SQeoXN1PMvH3TwGRgl0MV0jseg==
X-Gm-Gg: AR+sD125EIxGLK9k8zaTMpvsYZzzZ7Y0LHe/iLlSHKmLvfIVrtoK11F8HH7nhzB7rMJ
	W5bBizbaZZWRUhHavKh8hgJ+Si4vyeCqujfih9aNC9I7ngLNQoZKM2jvTwqQ9qhCRGykFOBWxUn
	UgUD2F6W6dOTBsXaVhK+6NdHqvD85D5iV3IhKX1rn47SUXb4H80JLGwZIciM0wLcG7AdFp3ipk0
	TJYvo00Tt8W+sLEFgsRNaXh+N/pxrr5Dlb5gRGSu/gyAz1+nuL0u6+Pf8b15Y82PUbUi1aNlcRj
	RwMmapHhARk+4z7TJm0yTgeKJxgfIr7QdjnHhH9QGqpmrULsB0wxi0yuRjNHFhZhEBr5FTN8oHr
	Ns6dut/LyxgxIFchXd6PZR4t1Bq7qILvqaQ==
X-Received: by 2002:a05:6a21:687:b0:3cb:7b9d:9869 with SMTP id adf61e73a8af0-3cb85f4a600mr16700035637.35.1786003085840;
        Thu, 06 Aug 2026 00:58:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:687:b0:3cb:7b9d:9869 with SMTP id adf61e73a8af0-3cb85f4a600mr16699976637.35.1786003085420;
        Thu, 06 Aug 2026 00:58:05 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.140.67])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca660e66sm21728887c88.8.2026.08.06.00.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 00:58:05 -0700 (PDT)
Message-ID: <8130900b-c9f2-4f5a-80f1-1e8567ee1b72@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 13:27:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Daniel J Blueman <daniel@quora.org>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <futJwsC0VjGSkjrB5PP9T0jBOVgWADaDAYyRRp-OZifaKPNtjcnnA59QJaQTdqYTeayZk9jY6e1jOfun71Yp5Q==@protonmail.internalid>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
 <689580d1-8169-41cf-a954-927e10135700@kernel.org>
 <d0983bf7-a708-46ff-9f86-f94fb6a92ba7@oss.qualcomm.com>
 <d6ffacaf-7f83-42be-a3cf-40ce00810ca9@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <d6ffacaf-7f83-42be-a3cf-40ce00810ca9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a743e8e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=kGzeRs6aa4G/VYrSuZk26Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=KDX8qB4gCLF3aDKb5rsA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: 92flqAuU9d9tIWm-8_HyfBMzGKvB2Ryj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2MCBTYWx0ZWRfX10CANBXLR6uv
 gi+HjcsGttQ8ouuUXW0WexyV7FUmDf3Gs01Cp2lHXTPCvuo/q0FlvrirQVOCi9WsyLCVDuyGrz3
 OFtpDxDj8a74opHt0skYZY+W8Bo8YwYWN2AQDcNL/aEeCZp2Dtu0Gm+EwcGmrKAcjjq/eobuE10
 kcnN+ZgNCUrUQjHicHf2K0cUFW0grx2guf/BzkiqUBfZ/wiyBDXrDFTLIdJ8dSvbR9G7BEpStwi
 nFPZxbdNEnU1JRrI85kbrTve2YojMjuZwSXISet/yORAlIUXnjnayoPYmDMb2LLDS984ppE66+S
 h3WAP0GE4HQfaxNg6PhDbvZUjc1NGcMQx/QoNKvkAzQGvI1HH4fsmmsmDIbePv4Qj4F7EAdtjSJ
 1SmzOAwrX8uoukhAgxFBSW3RP5hgXAba0FH1Yg4zIgzOg4NEstoHyMLe7KsSuttFNJBk16QIpiB
 24N5NLUpkbqS3bCjuxw==
X-Proofpoint-ORIG-GUID: 92flqAuU9d9tIWm-8_HyfBMzGKvB2Ryj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2MCBTYWx0ZWRfX2cQJJ6L2cPAH
 cT6D6jT9uAaSR9pbQDrP0KeQEvikCXf5toYOK8/gJK/I5arsELCH09SlutHxhS+3C47gJHk3g//
 8EPvhUMVLCGN4u7vKkKU6vJBHWQVtrc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060060


On 8/6/2026 1:24 PM, Bryan O'Donoghue wrote:
> On 06/08/2026 06:21, Vikash Garodia wrote:
>>
>> On 8/1/2026 3:36 PM, Bryan O'Donoghue wrote:
>>> On 31/07/2026 19:22, Vikash Garodia wrote:
>>>> Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
>>>> Cc:stable@vger.kernel.org
>>>> Tested-by: Daniel J Blueman<daniel@quora.org>
>>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>
>>> What about venus ?
>>
>> Plan is to get the reviews for IRIS3 family SOCs, once we have a go 
>> ahead from binding/DT maintainers, i can either bring in few series 
>> for remaining venus and iris SOC family OR do all of them in one 
>> single series. My preference would be to add in multiple series.
> 
> I still don't see why we can't just set
> 
> minItems: 1 for the memory nodes - implement a fix for stable and then 
> iterate around this new way at leisure.

you can follow the guidance from binding maintainer [1] and continue to 
discuss in the same thread if you have any question.

[1] 
https://lore.kernel.org/linux-media/2b0ea2a2-c3ef-4147-801b-af41733fba7b@kernel.org/

> 
> There is a festering - system resetting bug.
> 
> ---
> bod

