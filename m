Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914B240F757
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 10:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717862; cv=none; b=sBlzfXlqaA1m+RJttsGKiXSXakx9cKe2RN6Wb6ixswssG49lYS2NKs3LVJysaZtM1kCHDTb9Med7C6CFIyGHqswR7QMONLe22PVwvnZehZZFHDFyMyYs1x9L9U/Nl5fLgcDvDTvCgcvZna78UwaHq88svxlKh21obcK77uFa5c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717862; c=relaxed/simple;
	bh=QiqrnBFrCvZUnptW7XlcwHn5QfWSr5rCEk5a5HPz7Ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ax//llVCuragCspQ5D9WQsbOEqqT6NfvnTiWW0lQbUq9jbUvRmoOv/yKyG6uls60okaJ/MRjYwDh7E5567wKdngykJnBbTd8FUQiO8mg8piZbvvocNpvOyAlYW25TxNy/jeWE0MhxYgfcYPwHacCze4sMb9Pn/riEw/0G2VJk/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KX3Ketxz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N0cjKq85; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KX3Ketxz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N0cjKq85"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xKvn237625
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 10:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdElDgr0A6I5Ago58sw99HOz++aFFA5p06ZnufGOKLM=; b=KX3KetxzRk+DsMfN
	UdxPmJCcJ7hU6OMV02fGz/W6tKLUSUg2e9K5KFAYOI7ExrC4WPErjMaA+cXCyxd7
	qRjKk4Uvbx9g667+LyVI6X8IThHbXZ8nvyqD00ziA1BDWkhqVxqSBi5rlJ5pN1VN
	kHg3iUGOS+3I4H1iioV8YiysCAlaHGK4sBuMvDQ+TMpZfMsgEmGkOEiHH5PklQ0m
	908j3MfMbShHrLqVg+LjlhudUlFd8BdZodjZ0tgP+PkghtC3Y6Fq58xcWiPupxiJ
	kBK0qIbXFN5bQaRtp0mKaqPyOn4K1oFTaxo4GHXcr6uFwSaAkASeRuh94zgazNaM
	ICyJPg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn1rju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 10:57:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so4888682a12.1
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 03:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717858; x=1785322658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MdElDgr0A6I5Ago58sw99HOz++aFFA5p06ZnufGOKLM=;
        b=N0cjKq85NEnGQ3WndyZckDRaMlWPaF7XZxIqCQrAKD/QySRHQkcs8l25m7hXW0V0BC
         hG5eCwHZXqiSU/f8s+koOfqxIW0qBnLzOiHsRvvUgWjg6UjKZAducB0i4jPIPIk2MrMJ
         mpyNmaLlCPC5avtkrJ87tIvDDJp4OK08LNT8vpJj0axYcPK3lPT1Bp/HJLUHro9V3qqz
         gJ+hNLxRt/ZXLQbq7Ttcv2cqbO2OQ8emWNkDdG1BBDfCdjcRxQ+/VYaiT86e7UDbMaZW
         OKIFUp/w/IBB4PoulQRMp+KHZUssu813Yrml1v3SRmBk4eV27t03+xaQETnjU4vGRG0J
         LvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717858; x=1785322658;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdElDgr0A6I5Ago58sw99HOz++aFFA5p06ZnufGOKLM=;
        b=XMVmVt3sH4FDzmvGVFg2G19ldaEMw06qslmR1vqaQu12/WdzaAk8bEDS/I6oxOAe8v
         n+c5gDk1CF+3+K/GRG+ccZv1EjPqPtJ20BjG5gRT13gujYsoaeRcIfHAJuR87p0k00nP
         XGx4X8nQCIQB6p61APjvkeZwe+wQbRJXui1azgEsh24Q3+1fRQCAJh+CHjhe806xlQN1
         mI5V2AZgiNztLikZPfRi8IRvpRngEGE4Huu8FWQfvUN2LY0c22NgTMpViM3+KHWr8zCp
         Nr2oWzU4ta+x3CQjV17My/0nxt5f3p2nB4AKzf8rYPLJpIFewR6L7SrrX19QReg8IxPa
         ckYg==
X-Forwarded-Encrypted: i=1; AHgh+RoNtqxkggyiWOgpTW4V5+0UnRVQJ3FxCFaLxXdQEbtylHw4JWlPl5IOZM8G3U+QwJF8DhDxSruxb+c4YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYirwjlNU45sl9sUBbqGWLR+88T5mNbwIWkxXuaDBxGoQc0wwy
	bTX02NGRQIwHQtoBgjV1Slo+ToKq6ZrEIu/S9fYbnmOqfuecTsRTSth4OYx1AftdAVqrvcMCaBn
	Auy9ITpYt528oFyBl7iZA7W05g3LiQ99MW4dXNso5XQasRr53+7l2vI/nq3WuMPBcDw==
X-Gm-Gg: AR+sD12Pm3pqEv65RvjuPMpjDz/d0jkamyGQ7jB5/WKJHOVVgCfDf2m9aWDCGUAkCnc
	j8oHFJe0OW1P/HWvRnKcDXNJUJm0cF+jx/iwWFRr81YyK315ci7YNRnKN+E/HwOGQXeQHReocdJ
	tEtDtWhxy+GjSYNGKiZHc4CZCDyecUAS6/+7B1pjNd3gWLT2V8dqu1rqu3EOf7Nuj6zOKDGnuI+
	JHJfGdsQ+gk8DqVL/QWo5BmYeu0ZKM1EoCk7uXBAwLy+wYDXuyiaSjILmEA/oXnmNFkZbCJk0Gi
	JF41d2m2pK3r9my4shz+iIXi3eEnHUyhKoClD/OjH9Ng2QWfK3tVP6X1+QqE+eZaz+jujo13qLI
	JuRBcyzeo9MwlO3/LlnSPtXGXXLZ8WF23
X-Received: by 2002:a05:6300:95:b0:3ba:cd5b:3dc8 with SMTP id adf61e73a8af0-3c3ad7a31eemr23581353637.31.1784717853296;
        Wed, 22 Jul 2026 03:57:33 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:3ba:cd5b:3dc8 with SMTP id adf61e73a8af0-3c3ad7a31eemr23581317637.31.1784717852784;
        Wed, 22 Jul 2026 03:57:32 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a689sm9074959eec.4.2026.07.22.03.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 03:57:32 -0700 (PDT)
Message-ID: <c8fd7746-7568-453e-ba00-3d5e6a9dc74e@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:27:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
 <20260721-shikra_vpu-v4-1-6dc5a8999b73@oss.qualcomm.com>
 <20260722-rainbow-sapphire-leech-e3debe@quoll>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260722-rainbow-sapphire-leech-e3debe@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60a223 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Bf9jZRNvZzbIE5bmIgIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: m9RolDP79rnIQiX9ptIzIiUa88qoG3Rx
X-Proofpoint-ORIG-GUID: m9RolDP79rnIQiX9ptIzIiUa88qoG3Rx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX6P5AcBaxM+cD
 zqmoTvo7fiv74JWKUDLdFAA/oSKDsbtYg7ECOnkhnz3nFoSBpMEX34CcB23jmbA1+86wG+aMVWR
 CtFVuGStW3Ti/hBZpiuyYiE4SseOb10=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX9vKkULBh9tPT
 qnxSipyukAtQu/bd11VYRZQdDjhedHTQMmtkSPw4f+AvKsjfjFvXRpIOVylHYZZrKTFdSKJjhP3
 iMUdpfSjx/Y5yWcUWMhvltwN7LV5jG+AvRNBIDdkf3+DteJOOhpLYDOmUES3OtZtcPowQRCMkZP
 b0FTuwNt8x7KPAqPJXcQFdrpcxEEwpx+idBzuj/xVQVBOmRx6p9yRIrZCPAYF9tYahefUlxa3PT
 ahjHdmRX7U7xuc4vRdP3xwguOFwVI4nb08irTPyRFpujZBxJ+rfG02dX690h2QR2fM5i6im2JWR
 kwz8iJPJgm7YoeRp+dKIM3Xd3mTeJw5+2XxnVM9eRtEAQgenCDThG6RA8mnIayxIxbjvbTglamA
 XvD7RiLzgfkP6zIaQ3W4mW3i3yZGa7pw/mSKj6XQNBXm6aklV+1IQPD+nhFHNlV52tudb0sdG1T
 U7uNWvEavrG8Yfgw24A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220106


On 7/22/2026 12:45 PM, Krzysztof Kozlowski wrote:
> On Tue, Jul 21, 2026 at 11:02:25PM +0530, Vikash Garodia wrote:
>> Document the iris video accelerator used on shikra platforms by adding
>> the qcom,shikra-iris compatible.
> 
> iris here, venus in the compatible. Please decide which one.

Ack. Should fix the commit here to mention it as qcom,shikra-venus.

> 
>>
>> Although QCM2290 and shikra share the same video hardware and overall
>> integration, their SMMU programming differs. QCM2290 exposes separate
>> stream IDs for the video hardware and the Xtensa path, requiring two
>> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
>> equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
>> and Xtensa isolation requirements, such SMR masking is not applicable on
>> QCM2290 platforms.
> 
> This paragraph suggests devices are not compatible. Will Shikra Iris
> work fine when driver matches with qcom,qcm2290-venus?
> 

Validated shikra with qcom,shikra-venus as fallback compatible to 
qcom,qcm2290-venus.

>> Since shikra uses the same video hardware as QCM2290 and shares the same
>> programming model and capabilities, it is added as a fallback compatible
>> to qcom,qcm2290-venus, with conditional handling to allow either one or
>> two IOMMU entries.
>> Common schema is updated to accommodate the iova restriction of 600MB.
>> VPU restricts usage of 600MB for specific streams, which could otherwise
>> lead to device crash.
>>
>> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++++++++++++------
>>   .../bindings/media/qcom,venus-common.yaml          |  5 ++++-
>>   2 files changed, 23 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>> index 5977e7d0a71b4fb5681f1c2094439c251366f01f..b27899ebf164229ceff1ca5cda50ee30d875e953 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>> @@ -13,14 +13,13 @@ description:
>>     The Venus AR50_LITE IP is a video encode and decode accelerator present
>>     on Qualcomm platforms.
>>   
>> -allOf:
>> -  - $ref: qcom,venus-common.yaml#
>> -
>>   properties:
>>     compatible:
>>       oneOf:
>>         - items:
>> -          - const: qcom,sm6115-venus
>> +          - enum:
>> +              - qcom,shikra-venus
>> +              - qcom,sm6115-venus
>>             - const: qcom,qcm2290-venus
>>         - const: qcom,qcm2290-venus
>>   
>> @@ -45,9 +44,6 @@ properties:
>>         - const: vcodec0_core
>>         - const: vcodec0_bus
>>   
>> -  iommus:
>> -    maxItems: 2
>> -
>>     interconnects:
>>       maxItems: 2
>>   
>> @@ -65,6 +61,22 @@ required:
>>     - power-domain-names
>>     - iommus
>>   
>> +allOf:
>> +  - $ref: qcom,venus-common.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,shikra-venus
>> +    then:
>> +      properties:
>> +        iommus:
>> +          maxItems: 1
>> +    else:
>> +      properties:
>> +        iommus:
>> +          maxItems: 2
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
>> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> index 59a3fde846d2196ab1e4588eb396012ba6860712..0be2f9119e78233928d23af86836ac294aa769ee 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> @@ -37,7 +37,10 @@ properties:
>>       maxItems: 20
>>   
>>     memory-region:
>> -    maxItems: 1
>> +    minItems: 1
>> +    items:
>> +      - description: Firmware-loaded codec carveout
>> +      - description: IOMMU IOVA reservation region
> 
> This adds second region to several other devices using
> qcom,venus-common.yaml, thus should be its own commit with its own
> rationale why all devices take the IOMMU IOVA region now.
> 

Sure, i can split the common yaml as a separate preceding commit with 
justification on need of separate IOVA region.

Regards,
Vikash

>>   
>>     power-domains:
>>       minItems: 1
>>
>> -- 
>> 2.34.1
>>

