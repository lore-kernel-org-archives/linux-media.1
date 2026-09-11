Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210DD4A92FE
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 17:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148823; cv=none; b=H0v5WOV6+r8GQd4tfmPl8XA591Vf1tfAxhp0i62Up/NiDCLS7epy/Lo44G5IiWx5jyn7Ktda2YCgCbrAyAdhbsQtEPXNLggUVpRJmYTbpKWb8l7TwMHBT0iy547KCsuPTBu7YkPxN/sqEkCv+6lrhp/5Mt2A+ci6EeKKa9zcf6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148823; c=relaxed/simple;
	bh=8I8OglRCEAVJH2OPdrvFUHnij1NfmtFjfc83aLX5lcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QYPvgQRGcSkHdQu16ksqlKkb1KAgIR1nSiODNo53BLfOpM91w04zqrGgOvVDZaFHPDjzFrOeaOEDzM/2QO1w53xcAUPmzFGVPU+r3uoX/HVY0ClckJZpAwUze0helSbY4ITrC1SyUUlwTQgxXWiofSfwC3NJAeR5987+thQNn44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMEf0DKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aStyQNVe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMEf0DKg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aStyQNVe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWWVq972063
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 17:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fsgmAPw6yBdhTP5tdUXY2KIVjFb7ZoZOJkT3weJPqcg=; b=hMEf0DKgaxDLZHie
	OQN47RZMrFw779TQBk80AIqOD7gShUZcM6LuGVYVYAA4VtcEJiHzyGddDcBg/Ddj
	v2YS5fwDp6oYrrWwFcE6d0D+00mLZFJh/tj3F5orftjGseMWWq97HhL67aMpFjw5
	EcVpOGoHdHpDcEWTmvddvRGY3MrQBRVXqCdalF9O/bcY8S82IHvSXsyP0oGBUtmq
	UW+Xb5ZmposUlivB2+JJnyCE7G0HT52sKdkOC+g7mHAvdWjps5wXr/gtIOF36QuM
	zcS4ZvTHWJDT+uoYQVSghvWfgMU2F38zCLXejEuLd93NIhtpmSh2OQY8SfEHEujD
	9LdOCg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm22rm3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 17:46:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc39363cc88so1274084a12.0
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 10:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789148819; x=1789753619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsgmAPw6yBdhTP5tdUXY2KIVjFb7ZoZOJkT3weJPqcg=;
        b=aStyQNVeSTnIGFcJvuCnU1P4KKqg7FIai6Xvm1e+GF7Cn4IgkXfuf4spLogwEsxKM+
         y+7pkGfkWsAKA1Xinnl0Hz/4pvACK4rrOjMo52iDpyaNPLsDWQaPxkdccbHHQRlN5H/f
         TiNT2uPQ13CgySKJIkHC3fdVY8xYUVH727iR6/Kv+1HFx7Zc5Toe8r5rHcIkk9KiNsuI
         EMnCXCdaNPuQoDwSN2Zmg0YCVpkf8J285GlHjxYedzbQYEK+PnXU50BL3V+v/vkeW1E9
         rI+agDZOCnpJGs3CLiz5JJ+sjeVvtoi39QAHqIQ1W3EtoFFflyO5IoxNEuNpdYt7BnCr
         nVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789148819; x=1789753619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsgmAPw6yBdhTP5tdUXY2KIVjFb7ZoZOJkT3weJPqcg=;
        b=IjUwc8tJm9G06lFBAUwqpDnGTr+AVRRAp1QQKz2pdQ7WGaXDs9zGNyET3pK+hXIQbF
         su7s7yTztCewTDfdS33+foorHEXzw8rfAEdva8AH5+qa2RyM90j5HFD3WTXmUIM4eNfJ
         MMR0HCrmN1o8iMVj5o6UMEw3rfKW4pacCXsKZNmQMM1DnQzYIGHDyNRMm+LIirgXV2sp
         0C05+Rry2QnrEgMfvzm1sYkylQQ1N54/oI1hpJdltgDY829ZCXsi8Nf5Rkkn4brlm1Ne
         U1zgQG8MlSg//tz4785qsvswoA+n/hKX7PwVHtM9+FiA+nscXcFFi0RMJk86jch0cgjM
         F56Q==
X-Forwarded-Encrypted: i=1; AKwUvBzeMbOesIsWFMZVTNdH2FkTLYzrTTaStVc+px/1ozJ+B6jwNGhlRwsddEbv6vY4z/Zgvme2g+vGioh4eQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lJcdIJrpK/F844CwibZBGmWxtNM1CuXajiGdVHg64moVVn4awY
	ldvPAIw7pcWevaAHfGw/gkM5XGhhLgqdr7n36fih99iP4+W0iwiTmMgjaUrzxnBnySM7uICjY4s
	txsvgMLYgA7D2cZSHgvFJ1COV6ECsa63MlGAb2ZVvW9PPnpYcu1DzALEm7XsAlKQqYw==
X-Gm-Gg: AYBFou0yQQJ24FNnVWAkErqHTciOBdgcE9aO552i08ZuRKsSIj9EDlUqZA7Xhcny/Fw
	tFZ61yP26AC4DIXYYgNoU6lrV7lHXJhdq1JyxvE2AmBFpjQzvucBXRqTS3GD9DKtv2Nv+ZldRaV
	xIrG7ypVjaBt6YIXxlUMaIfvR5RbxvIfgXBX2oQU2ywvRzIkYRhSeXwyZjc6bAJB1n5XSsriwcy
	omDnP+/87DQPdQs4nRT9WqMkUMADjiHWNEMUIcSwcGkXFrq427ki8iqL2AL0LxxisPVJA2LKCMz
	mdnH59k+gFymRrxucGqPFRqmvxrQUdq8YlN5Nd5B43Yl70P8DxM6/A1K/lu8ck/4OeFuUq417ZJ
	SQajfb1ordLqT/f9muB35g6T/nA1ctU48RXs=
X-Received: by 2002:a17:90b:2f10:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39d9becda16mr9589996a91.11.1789148818592;
        Fri, 11 Sep 2026 10:46:58 -0700 (PDT)
X-Received: by 2002:a17:90b:2f10:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39d9becda16mr9589942a91.11.1789148818123;
        Fri, 11 Sep 2026 10:46:58 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.137.104])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e5182fsm7928959eec.9.2026.09.11.10.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 10:46:57 -0700 (PDT)
Message-ID: <fb559fe7-2e63-4d20-b0be-ff788e742cfb@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 23:16:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] dt-bindings: media: qcom,sm8550-iris: Add
 context bank subnodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, iommu@lists.linux.dev,
        Daniel J Blueman <daniel@quora.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
 <20260909-vpu_iommu_iova_handling-v3-2-2fe43ae45495@oss.qualcomm.com>
 <20260910-gracious-angelic-frogmouth-bcddc1@quoll>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260910-gracious-angelic-frogmouth-bcddc1@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI0OSBTYWx0ZWRfX9WBOAhda07D6
 4JCautLstw+Djw/jJJWg1/2UvIWyLCpGTJIJ6Ibm3KEFnEx38AaMNBIDpnVtBj8AGubafWq9mlh
 0WcrFbj3OBJLagn2tglulR4sIEsEL5An/6AUqWl1HFmBPVIdQideVMcpyxmVCdPScLXQghOW/Md
 gQWWW2wPVW77N84oYMrswJvQZ6IlyYYolnZFTX6jPsiZiTCV3WeLqAatl0KUrRR0OjQScHDnkSn
 y0vspqE26QRMWlCXOAQ30DriMCC0YEzj2UUWM8MdVY14pPjOpUHBcHgXvbDDR5qQel8DnlmUdO8
 dHZD3niuSuwGONy4pSJ3BL+zswArNR7zPEzyYa/9emt2mNbuKh3RlCOdCZbQtvvQWisJGrMlKc+
 3g3TA6CB6V2ipXadA6kGEhK1MwuqQPghS6XCUWCpFYm+Lbg8jExzBOCAuI0avKcNKEVg4gBNVsi
 RwnINctQmOJ8M4RlwlA==
X-Authority-Analysis: v=2.4 cv=LPDz05W9 c=1 sm=1 tr=0 ts=6aa43e93 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=TwCXObd+TJU0JWB7kQOUgw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=t9ty7G3lAAAA:8
 a=K3eY9hOJoobCHU9vVZQA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: TBbYdi4ciBY75qgBRonUQnzBBFXmJzGQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI0OSBTYWx0ZWRfX+eVk4ARAOZyx
 b/z4IOJXskTlKc/LN7txLhfGkkqKpkv05YzTLmpCMOHgCWfKoXKTkCJ9Pges41JNqdttsjhc1AS
 pVRmkrvw3dBqhpxN1e8CZrV9n3MhYZo=
X-Proofpoint-GUID: TBbYdi4ciBY75qgBRonUQnzBBFXmJzGQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110249


On 9/10/2026 12:30 PM, Krzysztof Kozlowski wrote:
> On Wed, Sep 09, 2026 at 08:27:09PM +0530, Vikash Garodia wrote:
>> The VPU issues DMA through several SMMU streams, and the hardware does
>> not give every stream the same addressable range. The non-pixel stream
>> cannot address the low 600MB of IOVA space, while the pixel stream can
>> address the full range:
>>      +-----------------------------------------------------------+
>>      | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>>      | 0x25800000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>>      | pixel stream addressable range (0 - 3.5 GB)               |
>>      | 0x00000000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>> A single "iommus" property on the video-codec node puts every stream in
>> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
>> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
>> that boundary the hardware faults, which shows up as unhandled SMMU page
>> faults and spontaneous reboots:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>
>> Given that the address range restriction is for specific VPU stream, it
>> should be ideally be moved to that stream. To achieve the same, a subset
>> of streams is now represented as subnodes, so that each can be
>> associated with its respective addressable range. The design was
>> discussed and agreed by mainatiners here
>> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
>>
>> In the past, this limitation was addressed with an iommu-map approach,
>> with the iris driver dynamically creating the devices. That approach was
>> later concluded to be a hack to avoid having subnodes, and was NAKed by
>> the iommu maintainers. It was discussed in detail here:
>> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
>>
>> Update example to the subnode form. Doing so, it picks up the supporting
>> properties needed on the video-codec node, address-cells, size-cells and
>> dma-ranges to declare 1:1 DMA translation into the parent. Given a soc
>> with address-cells and size-cells as 2, update the video-codec "reg"
>> accordingly.
>>
>> This patch depends-on:
>> https://github.com/devicetree-org/dt-schema/pull/207
>>
>> Tested-by: Daniel J Blueman <daniel@quora.org>
> 
> I already asked at v2.

Sure, will drop the tag and dependency PR will be added to changelog.

> 
> Best regards,
> Krzysztof

