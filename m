Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD754379993
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 17:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149213; cv=none; b=baliZzDi335ppJdh8FsZdWuK8xS2lJA9B71nUfFV3QJSgmvRfVJo4OF6J3/DzP3/zo6xT64oDX4VxC7CeDdoGJ6Y554HsmO0ZMCv/qgmzYRjcHDUquJQoIVpPgqaN/qGyGP/qOs3B9/TrQSPokDQsnhU1P5iwrk+3iOE44hUQmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149213; c=relaxed/simple;
	bh=8eo278yP0UbiWY/1X6osihtpgSnzn78n6QOTLg1L1GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mUc1o8pFhyeSqI3SmQkOQGsXaGV51ihkIHspPxF2u8p+FWgpsvJc35wbI2iHW686xT2jA3xuuBAe7OODYIgzdjSex6Z+AGchZOMMU8lTNqEm00EOE/8k5kmztBE66L/yvB8OsDTRoaACcm4fUpNY7hp4zKTnq5hHyoQISL+fDag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCa5p4Jk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rla0F4yY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCa5p4Jk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rla0F4yY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWg9D3621809
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 17:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4OoQhFEnhOfNhViKEsSDPMJo9+bfekumVfJ9cT1RTvU=; b=cCa5p4JkND7TYbm4
	5hjEtneqcApAFC6sxeONvum747FQrypYk57CFtTWfgAU+wcYuA4/FoU9ynMfeGmy
	51uUoQJSRxw63U50bCVSSuj60+IT7oqA+fxQxxeCZZuKaAs6FtwzQkHZoH3nzvCc
	a/LqDhy4gtAvJEw5riiYarlYrXwI0w7r21AD97o7dfz6NQ5Os+N2FrqGEuubKTCP
	yfPaBSFjpNLkBBZ569wJJzv9q9mLKj0q3pfLdCFetQGaI6U6wryHIrR3nlN+6RG2
	XTwrf2CwUD8m/yo7CDxPdo9EjW88sQ4+RiL/60xlUoXw+JxnD3W/0okDiDur1/47
	uD92nA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmmubre8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 17:53:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so16190465ad.1
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 10:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789149210; x=1789754010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4OoQhFEnhOfNhViKEsSDPMJo9+bfekumVfJ9cT1RTvU=;
        b=Rla0F4yYCR5fRdm4whp1jOd4B0C7xaadFT46Mr8VgYhMXvKn9P4FttX1bJUWn+N/6L
         0cTcDL9Hy+h5gsMzW85oY3oYh8akye42Gg1WktXEtBfdToqRzuWyk8ZN5MSp0OgkwApf
         NDt4660YzdITJukJgWu6awvyUz5NCL/y9+mLq8wgGldGeFbCqYpUSk1ZWTRvNMljY5K0
         7u6BOKjRLJo9Pw6hiQ21Btp/w68tVpra8QfhUlmHMgjs45QlcKdS1rm3wRp1I/hactMc
         qDczT2v6sjBbf5lVIscC4lKLSydJPKbph1boxFsaZ9Nar0dAy3vg2dsZSMyX01PfrHHk
         zGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789149210; x=1789754010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OoQhFEnhOfNhViKEsSDPMJo9+bfekumVfJ9cT1RTvU=;
        b=N6q5jUmaw59haRfajkClKhUCRfEOoUw1zI00yr+ffKom9rhAYR93vzzJpI17/bCraY
         vmIbpkdm0rE1M4A88/eEUlvKfsQZ1qx6WIiKxkOpaJcbG7VOfuO3esqCdoOXwSjeKjD7
         y/7nyWH35TqrwR0JMRSbJyfWA0KXsvJG+hJbltgpMVaBvs+86ULIo2yY+YjmpdNcg0S0
         Nlo5dpsLZINvEjMAPkneDl0PvmaRs4Srkb9OaC5NcaeYBM9PWeGBuiMQTPZadEkUDxj3
         WhHa9lc+VaaTvyYcJjVPlfrzmdaPSHect6nSXF9B2XNA1aPYIU0aIl/VjZxPPDhCDxy6
         pS1A==
X-Forwarded-Encrypted: i=1; AKwUvBx5nRjq0ElipmEggp3ryTtt40U1ZRZ3Z9hhTUyYaWKH/IPgFon7emhMhSHmkSnD5hM9Lb9RLvWDevT2ZQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mKQXRbKazm1sti76eSRCZmZ0kwr4VPHmlCJlEdH+XG3F4+nqyh
	BLReFjIMlPAMfWJQc9P93AgLnpYlnBVKr747guiuEXvKIyXoWcxHPyXZxbKXrHr85iev/rlgjKH
	/RAaJ44p+g9ZnfGK42bDKe4/hJnyc/o7kxpklH8ztRQpzvQtjkxcEVDfcskQkHeOwJQ==
X-Gm-Gg: AYBFou0efFghO8SJ4X5pGm36+r4V8XWdTVRfAZ7OiOjPr7ljTMnoh+AM6fJNTafnycx
	3dwy7WT6wjS+YKgt48XqYgCfro8zLR6szobd1fFEXRXltdN1r8GSVyzG3vciAUjn9rqKPfNRVIl
	rPw9x8Iwzl64lSfFqdpkKdZiNInODd+rxNS//v+BvYOPS1B8n8fYbGsB7PbRquMDKnB8NaBSF43
	FRWWr7eQaB5WeMt5ytaeUP5FEdEQ8ZoEmM4CxY8l7jXYWRplBFCh72WGC90v5gMOEADyIfE0hvZ
	iOWLT30gyG39ACvydVWLrTfAi7GQjaB266xyDwR9L4t72w73RifQMoKCUINgMBAm1KWYs6dNji6
	b2eETTgJmHs2J99HQxIKquWPwWOJkQoS5dDQ=
X-Received: by 2002:a17:90b:1d45:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39d9c215be0mr9518604a91.20.1789149209928;
        Fri, 11 Sep 2026 10:53:29 -0700 (PDT)
X-Received: by 2002:a17:90b:1d45:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39d9c215be0mr9518526a91.20.1789149209152;
        Fri, 11 Sep 2026 10:53:29 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.137.104])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm9168666eec.16.2026.09.11.10.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 10:53:28 -0700 (PDT)
Message-ID: <d1cd7692-6cb7-47f4-a086-c9ae4a826171@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 23:23:18 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] arm64: dts: qcom: monaco: Add Iris context bank
 subnodes
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
 <20260909-vpu_iommu_iova_handling-v3-11-2fe43ae45495@oss.qualcomm.com>
 <20260910-mottled-tody-of-discussion-2ed66c@quoll>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260910-mottled-tody-of-discussion-2ed66c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q5PXrv085VNxxr2dahpnd-JeOQXmCgDD
X-Proofpoint-ORIG-GUID: q5PXrv085VNxxr2dahpnd-JeOQXmCgDD
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6aa4401a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=TwCXObd+TJU0JWB7kQOUgw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=t9ty7G3lAAAA:8 a=K3eY9hOJoobCHU9vVZQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI1MCBTYWx0ZWRfX/PdKRjTUqc01
 pVtDHJq4ZD0RbS/ggQRQkgCeFrnAYaTTYhcBb3Dt3q98FYzVnO7Um7noiJlIol4BrzlmZ/fVeJC
 ws3a70ERFeJjuehE1e+iiJOHKOLWFgYeZPtYHdYEfYcXXnqbYcqQM856xMvEbNhg3cwXd5LAbNY
 HxiIyXZMqif1aQf530SGJQle8TVQ/M15zO/wTSsmG6dfHqKt4DKdCUhz+12DqRtLmn9Qv7enW2s
 xTSW6Z/gFwDr8Zd3My0p0b7SrFD036Kn6W/r/oor8JCQnfIKrtasoJ7vhcdFZa1bLq2SAkAtfoy
 wXN233NDB0MEv1pAhQeabgsWnEauC49nuU4w7lqpP4e/cJ+bPlGSL+9Efs9OXb1PDh/dIHxv52+
 q6jwfrOZQ18Viimbm5Z8GgJ7nV8OeW+lm7PQLIZSsB+7axSzKNYwstDzeQ12fAMWwcVh2duODBi
 k8+b1S0OIXMEEiO6aLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI1MCBTYWx0ZWRfX6g0WBzFs1T/x
 DBY1vOLHZPA+a22iBBCw6rcSVyg/ZTp9inlh0LNW1SsP+nCvM3pMy0q0V/uD5TH97Xi6nOHa9PF
 LV1WJo46I6Nn2Uj+i1aj5qKo6Y8gnlY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110250



On 9/10/2026 12:33 PM, Krzysztof Kozlowski wrote:
> On Wed, Sep 09, 2026 at 08:27:18PM +0530, Vikash Garodia wrote:
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
>> associated with its respective addressable range. The design was discussed
>> and agreed by mainatiners here
>> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
>>
>> In the past, this limitation was addressed with an iommu-map approach,
>> with the iris driver dynamically creating the devices. That approach
>> was later concluded to be a hack to avoid having subnodes, and was NAKed
>> by the iommu maintainers. It was discussed in detail here:
>> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
>>
>> The video-codec node includes address-cells, size-cells and dma-ranges
>> to declare 1:1 mapping for DMA translation to the parent.
>>
>> Tested-by: Daniel J Blueman <daniel@quora.org>
> 
> I do not believe the testing actually occured, except some case, so
> please apply it ONLY to the commits where applicable.
> 
> I already asked this at v2.
> 
> If Daniel did not confirm where this was tested, then the tag DOES NOT
> apply to any of the DTS patches.

you are right, it was not clearly confirmed where it was tested. I would 
drop the tag.

> 
> Best regards,
> Krzysztof

