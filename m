Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01224DD3DB
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648683; cv=none; b=uIpIzYi8OOSZFm/NVbWYQI0i+P5F8oO7b/PReRqQuS3mGMi1YQAqQf7Y3+oCNjj15sgsuUeZNEY5+NfX2gGWFy7PrQDw2JQcmgZnG/5lEqXxic9LTfU+yIPgiuaJwLuEhqz+uIS2UJ94VgwToyog7XgJqyEojbYav3p/B1nxNvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648683; c=relaxed/simple;
	bh=SnMHYeXiWguGfxVXceu+bBQETBsAqvaJWpMi6JFepAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Syns2XB2Dx0YmnZWxCQMEudPy3KkHHIIqV7b/0M4ykraedRIjbtph+yhpdxLPnxfBB1eslxuIBIkigRr86ESZYKjYBuhU6A0ZBooTGgtVi1OW5QsZdRfVTth4EeJbqry2RxfmjTsmw4qii+xQsbsoCFsHmB9YpZ81cf9Kq3NH2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TUb6sH19; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=al0pQ+FK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TUb6sH19";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="al0pQ+FK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZoE91862871
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 12:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OjSRMZDcecv5N4PzfaSL6P3SNko4UxD+X15iRKhspJs=; b=TUb6sH19bLlZlDwy
	Mwo5Lv56rfGtp7Vmhcfe2xXoPNZgfJXpcJjNC8VbYcVVL4Smb6JqSC3AUSPIgGoA
	mxPBZYWKv1cTvHKwGmlEAiw/kh1OFz3PQefDJTJe+Dq6QxmV+/BW133xZcWGdqxV
	rxPRTF7P8eunvg4hYfT4xwf7bwSahkJwxRazLuIZx4BFFu3SQTbABJAd1rgzo+Yp
	xwIJaZkA/C6VLaUcCQ5zGonN2GpOUOIB4cGWbGj+aIwdDfJKxphFWFcAjDi8Ucj7
	tqfSmAeoj/PCvURBsQq9t6kAepbTbXtDIqitLc81aiSzRpjteMN88xL8rxmwtOa9
	e7iygw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6av7mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 12:37:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9104ba8bf51so21280476d6.3
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 05:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789648670; x=1790253470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OjSRMZDcecv5N4PzfaSL6P3SNko4UxD+X15iRKhspJs=;
        b=al0pQ+FK3kfp2OdVVXBUJ6uIcUbYCv2OFJ66PY9E9mW04S7clBmgBNqShJO5bawNmD
         8myT08Ejx1A1dBudf6RnoYxQB2VMD9lOUfe6j1TjHvJ7YwJCOuxVGElW3tIztPTi2mZ+
         Lb9/mN7eW1yFTZDle58drJAe92cHwyBenpNGTQz7Qn6No+jzmyx/eCKto/FNx3lVbUuT
         +kjU/h3iSE9KmLRSb72KtlYBJRoeoTc/fSrgERv5xEowgSKUjQwDdkVrPllRWavV9DwN
         K7X3NADR5J4Jnt/aVhyxK1Kq4l5kzY/fPXyKcaQJJASH3X/YoUngbEh3/J4Q22vujq3j
         9AGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648670; x=1790253470;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OjSRMZDcecv5N4PzfaSL6P3SNko4UxD+X15iRKhspJs=;
        b=jlSb34OH1+czOHOYE6xStcjCnnTM1SW1emhJJLEjhxlil50ld66cb+5dBFsQ1newFs
         82NhrM97OxQ+cuVc5sU8e9epp4IYuzAZadEBjIZhuoKwrDcAQfyGL8IULXIqeCaIO62t
         ch2kEpkwnOTdHd5wn1SvmThSumaalkcWB16grdKUGBEQS4cJwaOiCGh6SLHZtXwTCtFF
         7BlN1Sse3DQXHRHp7xU6TogfZbMHo6HAmoDjvpP4QBJfh4hN4tfU1jmjH4KzogNkLFhM
         8NFfGc2X3TI49BuO8qByDTiyaKQE3k/BnfHpsz9Qe8gLZwPDatv40ErQyxmK97q+Z/EH
         vsrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwL5T9vZiLgjSEBo35fLUUCAQK8Esd/uFTk7SiTH9HT6r8kMtxAFisKU/y+bmQ0WCWQ7iAApxkdm24xDg==@vger.kernel.org
X-Gm-Message-State: AFuF++m148ZGgvU6OUP4kM2LMZy96X1bcNJnpIjJVrmhUjQJ2cj3igbm
	a18D6HExb+QH500F6DxC52yxe+sHbcQAY6wXlLu69FcRnm2JRELLLkbsOgFlNv9PLVCOVYPLgyf
	8Ctgm95xss/0Pd2LpB/oYkD4fAFykhGJcPgiMe0S9w4mfz5dFEJtYo2rS9u341C0/wQ==
X-Gm-Gg: AYBFou2qk08Pa7u5hM4975i/n3X1lTz1Xi7jOyLeKqlZAC7NU7gPs/QZnI700FsDGnX
	4pw8t/CjdpSiStz+0x2l31SxwZY9gtNIYLHJt0861cyHnHu/YGuqumjhB1s9fLY94vvkmZ/v9PF
	64ZATBbTKT1hwMZKKm8uiKSCL9sACvSk8iq5YUNMFDoTtTC7+SceeVLX2lcHIzVouQ4wjU3iIwc
	+RdrX0tEt2ucRTfLvtfm/P3S4xXybOeKfyVN7W4EZn3/r2NX/rPEo+7tf7YMcnDGS43kc8hbMSc
	9/AW0LRozrdA6re9CX5ajSacNX2vTQ0vDUDY9rAnkBoXpsepCtxSNc4J8GdS6h52M2tMKY946Fi
	HeYkkmRw0NK428EG9a5GSSL2G/s34WaGj6tyVdcdbv4A/yBK5vlqf0gKG7DDcjd4=
X-Received: by 2002:ad4:5ec9:0:b0:90c:5947:7e64 with SMTP id 6a1803df08f44-9123d703456mr137304976d6.3.1789648670062;
        Thu, 17 Sep 2026 05:37:50 -0700 (PDT)
X-Received: by 2002:ad4:5ec9:0:b0:90c:5947:7e64 with SMTP id 6a1803df08f44-9123d703456mr137304136d6.3.1789648669428;
        Thu, 17 Sep 2026 05:37:49 -0700 (PDT)
Received: from [10.38.246.218] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be5fcb5sm49155906d6.11.2026.09.17.05.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:37:48 -0700 (PDT)
Message-ID: <d89a7376-ffab-405a-a3b6-d3633cddd063@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 20:37:42 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: media: Add bindings for qcom,nord-camss
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-1-20db41a7f1ff@oss.qualcomm.com>
 <20260917-active-strong-emu-bf8fbd@quoll>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260917-active-strong-emu-bf8fbd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Mxpd85faPkysXcYDCVE81hOqnFwbVObq
X-Proofpoint-ORIG-GUID: Mxpd85faPkysXcYDCVE81hOqnFwbVObq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NiBTYWx0ZWRfX2d4yEWobiC6h
 OmRuDuFVwUutJA/F5WvxGyYyMKwoorLspHak+xz2Z6WmuNWEeVKbYa6cYZbRSpwbLMmpFhgGYwE
 MW5oVVhdP2cgZvp1rBcgCRDQOXSdpmjIaFcceui0ccpxrty3hVMKqiAmPOAs62C0GiBCcer1QsG
 64JXPGAT7II8bsvnEbvtPQegaSCTx2ysjeBBiI7z3FGm39yoxympsus2NtOKHQ7DyiRK5xEpHAc
 jdi8iBNZ5LLYO+59scYweZ+9r2nOXp7TIulAhXROfdvSP4Gf7u1bFaCNCK1pOz//ZCHknBC2+QS
 p1zZDCvZ2qNXZpHH6aE5buZe7kfLGsROYm0pj9QEo3M0k82cswb+ubBxdpZtz2Kth6uguIshLj8
 7Wn/cvSLwj4VBsKPjodX9K2L8eXPuyQ2JArf+4YbTSReNpQGAvHxrXW9cZF95MWTuHGiMgOk1q7
 WquVIJhtFI7Opt22wkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NiBTYWx0ZWRfX40unjtWzL+r6
 N0j65Jjrqnp80FF/R/5ZImCc96ntTvV8/YtlxwEgVYehb7/bz9ct21k40bPVS6615BULaWJeoQe
 SDdFy572Yi9Wxe8qylhN/yrOkDkMd0A=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabdf1e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=yKxla6SPEuOvPVJYePEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170176

Hi Krzysztof,

On 9/17/2026 6:13 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 15, 2026 at 05:34:11PM +0800, Wenmeng Liu wrote:
>> Add bindings for the camera subsystem (CAMSS) on the Qualcomm Nord
>> platform.
>>
>> The Nord platform provides:
>> - 3 x TPG (Test Pattern Generator)
>> - 3 x CSID (CSI Decoder)
>> - 10 x CSID Lite
>> - 3 x VFE (Video Front End)
>> - 10 x VFE Lite
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/media/qcom,nord-camss.yaml | 393 +++++++++++++++++++++
>>   1 file changed, 393 insertions(+)
> 
> A nit, subject: drop second/last, redundant "bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 
ACK

> ...
> 
>> +        description:
>> +          Input port for receiving CSI data.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +              bus-type:
>> +                enum:
>> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>> +            required:
>> +              - data-lanes
>> +
> 
> Missing supplies, altough maybe this is related to some other ongoing
> work, so would be useful to see explanation in commit msg.

At the moment, the Nord platform only supports TPG. Perhaps I should 
remove this part of the change for now and reintroduce it later when 
CSIPHY support is available, once the EVK board is ready.

Anyway, I will explanation in commit msg next version.

Thanks,
Wenmeng

