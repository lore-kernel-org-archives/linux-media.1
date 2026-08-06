Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A714D438024
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009964; cv=none; b=ZEo+sf7MGth88naus4qUHGOEhh94NevM0a5QiMLR5T2NxwM9x0A/DBsGZkFqTXpNxX9WbkACDtW0X/NlWloMI3ovOq3c3zwIX9uFFOBUh8xQmxsR93tXGpOPK4Xou+aql+RcdbMJjB1g1POGJgJeD0fCGEkS8vLEXIgdPskJB1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009964; c=relaxed/simple;
	bh=gRUha24JKDyYXQuYod1ckbZURT/+JZRsMXtQhQkCg9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZjbWojwP2qDIT9d4cPxxcLqXFVH2Ymnk2I/Ek6VvxvOMInU1OTr6pyzVZb+owFKsAsVd/4Of2vBRIHwrpfu5eZcxCv913LqMeMeuzdkbW8qGuCY+OS5A5tKhcOOj6o1XvVIWgqIxqpSJtaCRPXCIknsNxOfoqCMEJ2kW3S0wIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6jMlumV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYD88+ek; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6jMlumV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JYD88+ek"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769njwc1876537
	for <linux-media@vger.kernel.org>; Thu, 6 Aug 2026 09:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIidbOLK7YUH8s7JFWhLKurGYVJCaqUu4CJdXBld3+8=; b=E6jMlumVYbMKyvpr
	Bt+kkZWLKXs74BeVc1MMiS+OGhLn/hGQ2+DE5t64a78ohB+YXaJKd34UszQXqVb6
	pWvFJCiCQwCpyFzr9nQjLXs+bI7NwZFJzLnBOriPaBrspqNnUeBlsjt4LHvvzAtt
	cKUkpx4BwOfe9VyVOdZjWU319Zt6ZZ4QddJ1NXo2TT9t6pehELXDj7pBAjAhtGUf
	H1CYBKabn0z73M7SDJvGq361TkfH1DfMqeZv6GSlgCWsaaetkRExFyj7PI6W/xTB
	qqF7edmtv5NCe2r6ZWX8KxtZR2EZohOL8G/hHZRUIK7kCapszHxRqWAu4wEGeaxx
	K7N7lg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuchdhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 09:52:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso2513163a91.2
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 02:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786009956; x=1786614756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIidbOLK7YUH8s7JFWhLKurGYVJCaqUu4CJdXBld3+8=;
        b=JYD88+ekvcKX6ZzRiZFyS6P1KYI+EgxzHKSnW9vEnwUcmWAwWqR5zcf/NvBJJFOyP7
         Qj61NzboFI8A5+zWjrbe+smEblGmbyq9Di2kLH+MDSbJ871JfsVwihOSHh1ZEMKX6HtM
         jeSsQK39atYUQ/VxihLPvYYsgFRG7nW1AbtMy0QGQqjrTM9VhXMnY+BRd3AO9ZLkFDYe
         liXYtLNOxivOp2v5ngaKAoloBaDlR0WfUNXTZUr6rCLFRCR7TI0CviJDisFAIRhDW7EO
         +LAEyOXMOnOlwilCkPJxohl0brFt8PHNL4W8QdAsO4yJ2VqD4r12OhsVQ6PVDfQXS0Qc
         FjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009956; x=1786614756;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIidbOLK7YUH8s7JFWhLKurGYVJCaqUu4CJdXBld3+8=;
        b=SQFrxtp/FopjcdXzlEkj8beKUJw/SZhSlmsd7XVueCxc4rrdh3+q+gThX/SYPGDYyx
         kgI60jezZoTUWna51cMhzEu5LF2kLdYqdKdECVJUVOup/6/pL5t204i+CSyevPhrV6d6
         5/0wMr/w3O/mV7imW+raoS0H8MobGJcD6E43TsSjJktc9lWMKQBP6e1/xe4dBAjEwu9y
         0Z+1ilvfvaYC9/yF2j0Xf0gSCNASEVDlgO8/T8GqXJW0es1GO+318v0fpN4dJRwtWxwz
         Dz43DrsnvdTuKEUg2+1vEaUFwrPOWEpfRZWg5qh9faca+kfiLdfiH0p9vbXiPBJeBvqp
         p7bg==
X-Forwarded-Encrypted: i=1; AHgh+RqMo99c+iI7rBLpB/U8OjTTv9C9b05NuHo11oOT4vNU7h9CoNt2xH4KG5OB9NreC3DL/t11Z3bMfxHTBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCEFlHeVEOjscnT0w/33Mb9K/Wi5fP4bvXud2sD+xAc3YzVshx
	joU2svGIJ/oZrIQR6gnwQNHpGuOj3QC8a6rWl0lUFsfC8B29X/Khh083W+7Zvyaw5hjRl7DWWpY
	/ZX4T+zY9tUCQ5XW10zXdUT8DMWbkwXyC5DzeARsPLSw+e4qNwOdyCt1bhqIPOdq6FQ==
X-Gm-Gg: AR+sD10wGRxKfDX03WIfics9SMTsmxRHs066kf7n1iN5erC7X1poOUrdqD/He1C8c5c
	Yf87bx3cuWFUgtIjbC7Ey+ewiizNJpjryXcNHtRIvZlOtd8j8/aq6rbyh9SUHAmKqlm+0WEZ0ii
	8ZOttgQXLetjo1UzvuFBcjkv53TX+HPeD68cNzAVPKYIX2cez1T0EoN9N/BaH55BTf4f4UgyNbj
	b06hU9nmJQSFjAvU3kAsQUU3v+ryD908Z9WkbjvHEm1GWWityFRcD0vYZ2xuIppKBBfAqlIRUci
	e2Hw5vsPNOHvNWybep22NQUINl3VRH4Kfwd5CVspAQv0V8ZbZxCtRu8uWMBPxl6RVKlSRMlK1iO
	r//OiIE7gmFdv1wskR4scHUQh0fbLbFyAMUI=
X-Received: by 2002:a17:90b:264b:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-3903c5b2c25mr14455531a91.15.1786009956054;
        Thu, 06 Aug 2026 02:52:36 -0700 (PDT)
X-Received: by 2002:a17:90b:264b:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-3903c5b2c25mr14455492a91.15.1786009955604;
        Thu, 06 Aug 2026 02:52:35 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.142.146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca6482e7sm23033859c88.6.2026.08.06.02.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 02:52:35 -0700 (PDT)
Message-ID: <d6207874-630f-445d-8d1d-3a30ba8f41dd@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 15:22:26 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        stable@vger.kernel.org, Daniel J Blueman <daniel@quora.org>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
 <xusr4efn5dmsvcs2hl5vg3t7ctqbbchnbdx3mx6km5s7s3se23@mzzqs54lp46l>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <xusr4efn5dmsvcs2hl5vg3t7ctqbbchnbdx3mx6km5s7s3se23@mzzqs54lp46l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3NiBTYWx0ZWRfXySImY1ODMQih
 9scTW71z5IFaJWkO4wmNwnMUK32bL4NWqizwdMOv07WP+KHwWBcN24RYr8umDk6NkTRiniQBMyC
 tM7nlWxpd2IRJJ+YGeuKTFFbjg7j/tc=
X-Proofpoint-GUID: 5xiUIACLELKr9wdeTTl3wRbbNFaXpeVN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3NiBTYWx0ZWRfXzFp5aV7gvLKY
 6MZMYrcF2D06ofUZu9L0lMsIgWoFclMU2SHLv1cQ/Q+a25gCFj9iFsg8/OuNBmGSbyFfVsBzcUy
 NlBzMsN8kGvKd1Qdrv3/uLlrwJfkvnRE9NTm4g5wtyUuBbhH5fG77XnvrCP4R0dl80ytmSqLAWv
 EgMNe3xQ7K0oWjtjbrwjhREmCExO81VI6vVogTbJMxQkCtU+zlcoLZLE5vRzdShLLAsFEEqKNC5
 V+UqKeuA8hLi9X/SeoOFPbuaLY2nyE6zgosRaDyXSvkLLHW19tU7qpFJiFqQQaBiiPwZ4yzArvk
 2ZcLsSShdTHzqPYVc0CTBZj6F8ovrNAeldBD0EsBcsNl851RRtHLg8dSyr1G8f7DEtlw0jYUqJY
 x9tUuojnjOW1RjT6HO1owhYntnJumOksnaLTdvRKzK3ZM0E7Kp5E7KiEz/8W68eMnxx0GQXC0K4
 lrtjNYhftOtxsLeRQdw==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a745965 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=eVbXwf39F0J6/s7D6zfB/A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=LxpaqNrMlFw5iMcKExUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 5xiUIACLELKr9wdeTTl3wRbbNFaXpeVN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060076



On 8/6/2026 2:19 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 31, 2026 at 11:52:16PM +0530, Vikash Garodia wrote:
>> The VPU issues DMA through several SMMU streams, and the hardware does
>> not give every stream the same addressable range. The non-pixel stream
>> is restricted to use 0-600MB of IOVA space, while the pixel stream can
>> address the full range:
>>      +-----------------------------------------------------------+
>>      | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>>      | 0x25800000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>>      | pixel stream addressable range (0 - 3.5 GB)               |
>>      | 0x00000000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>> A single "iommus" property on the video-codec node puts every stream in
>> one IOMMU domain sharing one IOVA allocator, so nothing keeps a
>> non-pixel buffer inside the low 600 MB. Once an allocation lands below
>> that boundary the hardware faults, which shows up as unhandled SMMU page
>> faults and spontaneous reboots:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>
>>   
>> +  dma-ranges: true
>> +
>> +  '#address-cells':
>> +    const: 2
>> +
>> +  '#size-cells':
>> +    const: 2
> 
> This would conflict with the 32-bit addressed Venus nodes (and it will
> also break examples). So both should be just 'true'

With "true", i see following comment from sashiko (when ran locally)

Without a const constraint, a device tree could specify #address-cells = 
<1> or a non-empty dma-ranges, and it would silently pass schema 
validation. The DT bindings guidelines also recommend that cell-count 
properties have a const constraint matching the hardware.

> 
>>   
>> +oneOf:
>> +  - required:
>> +      - iommus
>> +  - required:
>> +      - non-pixel
>> +      - pixel
> 
> - #address-cells
> - #size-cells
> - dma-ranges
> 
>> +
>>   additionalProperties: true
>>
>> -- 
>> 2.34.1
>>
> 

