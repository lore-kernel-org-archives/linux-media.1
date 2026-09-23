Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52424439F87
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 05:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142116; cv=none; b=u8QzHPaQAv+yuIWB76EhHBLJLNFxp5orY+5otUh+BDU8zuutVyFQy04hW28/uMdbrHnTICTAd7uw6azAYIeFc3eKDOF7wYtzeqVTuxhDDgV4ABRgjl2snu7zmyl0m1UGvgwRF8tpKeumJAKQXy+i6Y/45avez4d9xNqq8jEy5mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142116; c=relaxed/simple;
	bh=UIAx05CZrvM8N5t8BucuFcjpo4iq7isDMnPF5+mhZsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f5KrBGEPDljLs/ECUIGfG55NY98ONIK0DFalbhfPJzJ2/RMrgTq6gqEaSggTdxoq+VI0pY9kMEmaGATOUN8u3FAwKWb07R5q6Km9nmkuwKX6XpyJ1Fbi6hysKx+e+zPamoVR67GjX0IO9QoynMrV1E7uyLYtWqwQ52QxQ+UFoPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxKFFDsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZOumyeZg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxKFFDsB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZOumyeZg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iV3S3095889
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 05:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/aKOtHIofqNw5/DRlGI2QTk8pCfM57nPrUMsZyHrh4=; b=jxKFFDsBPSA38++5
	WNRY7oUGBrf7pXW+w8jns5gCg7oMJf1eOsGgCAG2O9O69HB6zn5B8Iw4SpArKzyV
	9nCxPYSnlYarNwO4WcM/o0jDT0vcJgjMKSqVLYrzA3FBOpMrEf4xJUFHCTdYup7C
	QQjlOrIrbPvorCFvHJrgO7+FaTMeTxyEY41/OgulmmDx0f2mVP9g62P4Kgh9JJao
	ZKtMv241Md2x2swRm8JzOjpVboawXUNbGc0zpGmicNmeREIYRYAyBGa8XNzgqZPw
	4lrNNlK4X8OkvgSOqP5cx9QDMU1kUg/+vqYwf+J8BMsnLVBHeFifscBqwnq9hZlG
	mjHXrA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428s0y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 05:41:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3284bbaa89dso2075283eec.0
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 22:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790142109; x=1790746909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/aKOtHIofqNw5/DRlGI2QTk8pCfM57nPrUMsZyHrh4=;
        b=ZOumyeZgLS1QN4FKFaSHhVVDwslLn/7oFQfBpqylLhBEFrTGr4FT6b00UugXWFmVfj
         pLqYNgzWHfGYlL3wFuHiXFOJBX/Sgwnq7/+6EMSXbNhNaUeVbRYeL9sULIBShXMd7zva
         duoX3DQ72rQaVoUBIOcDkhKqaXR2qzf3xxOSerN2haPl9OwsGhxAivws0ZclJY+yqbhl
         Jn0kSusGzXgkVe9hnD3X9jcrjWOha4IhibM8qXuxTsOtYfkTCUdPUieZnddcdPJQbC3R
         cWNUMMbiDE6E92ZCqjN9GkKC3BwS45KqEF7Kuv4CPTHX1ShruNnQmBcM/eqfeOGxv/Eo
         LKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142109; x=1790746909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/aKOtHIofqNw5/DRlGI2QTk8pCfM57nPrUMsZyHrh4=;
        b=I0g0mJOwKFyhpPoMlDRcbjPXAgbFt3D2nSmGQqq8n4vYkTVrlXddkpB55P/JXtPHk6
         vk4QqMOZu4B3Z6IaF17rvLUh65lROIAbnygWCuTImKDYiFQkDz+OAgS1IvtI3FnChQ0R
         9hepNEMnWBhfnpugzzCN7O4S46Pa+69z5oQc3i61xRdTiVQPMx0AJx9ESnw1Yf5Yyh+T
         l3o4awz5FhPt+kz5ajmz3nqq40MX93PUivSYoZJiMh1kdeTaeyEMu4Ly5tS0vEX3LvOa
         FDpYuzwGqmCElAO7G0CuEFn1Xi1aXVJ9ICLKgJkm9C3tQEI7m1hjGF41g6gme8JwSF7l
         1Mig==
X-Forwarded-Encrypted: i=1; AKwUvByCkEwM5MmodF+7rkZ0u3FJtnDqbhKNC5VdrphxZXn+zaprS/uGRR9DRz7uGv9hceaLLujIFU4aFMPHdg==@vger.kernel.org
X-Gm-Message-State: AFuF++ldZ/v1+iCUerEnQu9TUd59QFPcW+4nrnSKKfN7kxfIJihQRslT
	4sbloKtAOzfwU+vr/GSdTGKw1JHwyVzY36DXmM1Kbc77pZKrPPq0zYeAeTOCeA6x50TPG3R56hU
	seRL14ZOKGTADMd+XySp+rq8PsvdDSHkL1Hu3k1pSRMtzySUYeMvJ+1DiKk1bIpeCsw==
X-Gm-Gg: AYBFou2fWlJItOnxe1i5evKYWr9isbbYQdwsRpfsJoU0B1rZFECDZQ7USYdwe+Ma1j3
	5GSZC0TKSZYRT7j76ugm/pvGY3uATdW8E1lmyMXAjR6t3TUTtM31mNLT5P7VYajii6aScNagfBM
	0a1NJRJTnkHQwyUKKZmYkJJ2+Tb80aiUMpuuePCDVnCx0YXUlWkJM4KCgIPf7K1bIPzQBEx9pQB
	pyBc7xOEnZmz8qd/tG8RMB6492pOdFsSdnXSc/hJ3+FhSS6oQNuGAJt9NaroAVHlmPqGebm2gk7
	q/RZx6p6iEDPgQFz2TG7x5M1K9CkpRDSCYWHWrodGsF5q9LZXcx8lIDxuumT5YsPVBTzg/j1Rej
	p6rFOzryI4G0znxUKqkYOHV2HfH4OViQ=
X-Received: by 2002:a05:7300:b291:b0:33b:e21e:4a3a with SMTP id 5a478bee46e88-33e8e69cb4bmr1709626eec.40.1790142108733;
        Tue, 22 Sep 2026 22:41:48 -0700 (PDT)
X-Received: by 2002:a05:7300:b291:b0:33b:e21e:4a3a with SMTP id 5a478bee46e88-33e8e69cb4bmr1709602eec.40.1790142108165;
        Tue, 22 Sep 2026 22:41:48 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258351sm3193280eec.12.2026.09.22.22.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 22:41:47 -0700 (PDT)
Message-ID: <335528fa-72b1-b61c-a2f2-aa1e15c8f3ec@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:11:39 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 1/9] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-1-e0c8bc914742@oss.qualcomm.com>
 <pk5j7gr5m23eocsliy2rtqcwbtzonzxidxdon7w3doysgehiiy@yxtjrrp337ex>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <pk5j7gr5m23eocsliy2rtqcwbtzonzxidxdon7w3doysgehiiy@yxtjrrp337ex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab366a2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=6X4DAO4X2HBH6bcfxsAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: rpDhuql528nYy0o03ip-7rQ8uWJA3tvm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyMiBTYWx0ZWRfX6bbj1oSJ764j
 zdDzUgr+13d3cwVHyIb/VQJ8tZS2g7Op9sbSEUo4WGBFtffjuoz/pxhwultZLYFGK5QYK4SN4jX
 h3mSCWXFfNP/EfVLtO8wkxOwKKUzchMdaLb8PREGmzMk0pjryESZvp/fv3GtOe97nwtZzEmWFZe
 3FCGd8tBU5/ylzUxAFAlk71fGf6ropCKB7ogFHeXlF62UwmGPSuVKrTavRn7AFIJsYltIZD0nuP
 7k0UEBeQ25XEoymexANsD9SPe3PNKdku8rCpdBff0SuhNThCBJibwibtexACEiD5Fy/pKc3ykKI
 CnXeszi73R1bygbtPccJ+HHbqioZ0DDtLYMlDSuXeGTNwOIjVUhcX0HC+aOzD7WArJ3MnGCYfZy
 tFQ52FEuzZYClXDy3ZMylIPeau5+Vc0TGrFx2fB1rripg+fFmoEWp2lpV587IETmYd+C8vJhr8T
 inqTwTt7N+Qk7xflTgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyMiBTYWx0ZWRfXyJvHBRwetGsU
 uWINcCa26RP4y1eUgjHFuGCm7Zk2zSOzz8CI25yHW4jrOlhHDzlP8+ZBiW+y7oK1j/nyTYKIpO2
 1ecOMOGzP0oCLmJkAVcXnIWlmhiVK7s=
X-Proofpoint-GUID: rpDhuql528nYy0o03ip-7rQ8uWJA3tvm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230022


On 9/22/2026 6:29 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 17, 2026 at 10:30:20AM +0530, Vishnu Reddy wrote:
>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>> is a new generation of video IP that introduces a dual-core architecture.
>> The second core brings its own power domain, clocks, and reset lines,
>> requiring additional power domains and clocks in the power sequence. The
>> current maxItems constraints for clocks, power-domains and non-pixel
>> iommus in the common venus schema were sized for platforms available at
>> the time of authoring. The glymur platform introduces a dual core
>> architecture that requires more clocks and power domains, exceeding these
>> limits. Raise maxItems for clocks, clock-names, power-domains,
>> power-domain-names and non-pixel iommus to accommodate glymur platform.
>> The glymur platform specific schema have fixed constraints for these
>> properties, so the common schema only acts as an upper bound. Since the
>> common schema now only acts as an upper bound, add explicit maxItems
>> overrides for the non-pixel iommus in the qcom,sm8550-iris and
>> qcom,sm8750-iris schemas to keep the fixed constraints as before.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  .../bindings/media/qcom,glymur-iris.yaml           | 218 +++++++++++++++++++++
>>  .../bindings/media/qcom,sm8550-iris.yaml           |   6 +
>>  .../bindings/media/qcom,sm8750-iris.yaml           |   6 +
>>  .../bindings/media/qcom,venus-common.yaml          |  11 +-
>>  4 files changed, 236 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>> new file mode 100644
>> index 000000000000..de4792f3b658
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>> @@ -0,0 +1,218 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Glymur SoC Iris video encoder and decoder
>> +
>> +maintainers:
>> +  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> +
>> +description:
>> +  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
>> +  decode accelerator.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,glymur-iris
>> +
>> +  clocks:
>> +    maxItems: 9
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core_iface
>> +      - const: core
>> +      - const: vcodec0_core
>> +      - const: vcodec0_iface
>> +      - const: core_freerun
>> +      - const: vcodec0_core_freerun
>> +      - const: vcodec1_iface
>> +      - const: vcodec1_core
> Nit: is there any logic in the order of the clocks? Why vcodec0_core
> comes before vcodec0_iface, but vcodec1_core comes after vcodec1_iface?

I followed the clock ordering from the SM8750 binding for the existing entries.
For the additional glymur clocks, I appended them at the end and kept the new
pair in the same interface-before-core style as the inherited clock list. That
is why vcodec1_iface appears before vcodec1_core. There was no specific
functional dependency intended by this ordering. Let me know if you have any
preference on reordering.

>> +      - const: vcodec1_core_freerun
>> +
>> +  dma-coherent: true
>> +
>> +  interconnects:
>> +    maxItems: 2
>
