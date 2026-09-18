Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE92490C04
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 06:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789714654; cv=none; b=tZafUA/sEfXM/uYqr+6fabVxgYcZShUveU1k8IaTQ26mZ0rXbBM6wkn+08CG9YRTeyvnfSJjJZRp4WEsl4HSNo/vkMcQWisBYl1IkC2/ak1tJ12QgFUjUHM2rye8OAXWh0L11muWhAoQb/Vq3H/cPPQNZXZK34lznAZ9GfhYh1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789714654; c=relaxed/simple;
	bh=WmfAZW7sVXMa/GOifNO3h2xf0LgQ8zx7piA8+FgMS9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=owaYq8VvmJsfhG4RiSc9Szgy4+cfqKmtfuPGfH5yz8rYbJQU80qm7zyiyqLN1SRDIc59ZPrId/S/SSp2A3eSDBu9gb7NStLw+D2zU6W8dTwzTRDxqIDGvGt9MhwAB0T8x7QV8RFmnKCtUmwEOFhzvlQA3SRZmpcu+zGhHt9DbBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SuPsA3fL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DimG7rkO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SuPsA3fL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DimG7rkO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I60Vn7021396
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 06:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o1FLM+CkV68zd/McNTCIwsQNIBUX6pTcu5N0rHLOGSs=; b=SuPsA3fL4KFS4RdR
	SGRtCc2ecCPNmAl9AWeFSBpXmeVYcikNvk7EcCtwcSYh241UaFUII7FsHpfhtTSS
	aNAEXoCaKortPpQe0Ib/E2cDFVeU/E5Bk3oL35M+t4gLPvEdR89FP6SnjNG8QDgZ
	WgAK2nWRZ1KjWc4hA4Lnpu+P/q2Ek4n4tZoGrxXpamsfN3Q072DT6DmHerVW4BkG
	nqtfVujj/xMYz2p14oe/+kbsBjxQk3lAxeKx6PZ8vKFz+6eg2eoQH83sUay2Ibsv
	RiCWhsrst/etTZuLrRRaLoK9PMNTB2JysXNF7/lbNHamqZXTR4Ai5j1SF3rMY79T
	JCLVgQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqeakrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 06:57:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so6598155ad.3
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 23:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789714648; x=1790319448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o1FLM+CkV68zd/McNTCIwsQNIBUX6pTcu5N0rHLOGSs=;
        b=DimG7rkOKVktwCJ4cUHgxE62EmheUBKdhhvIEYBnWNE5Chp8s6PHljuY3yLGmKBWD1
         y3zPFPhBLXiM6MpJTPFhC5MuRRgTnHsk5O7j/5DKIl7CT6rTQpljvrZq5LnIJ/Ky+h86
         vuaCIz2uWizyFKoJHd5CeO4xsUz+SFYi+Ne2TqjV7WRF3uL/P4xJ+80dB3xrJf9OaI/B
         K9viaU35IDKH0Ds04zZoGJSP7C4qNVGl91Qj/bgNDQwB7Bd0LTEjTqebgbFVwBbkU+Fj
         AEvKXjPWZHSg7aaFOIcxOuplChtMHyR6Nju0E5g6ADWWOkbLiRdJyky7iubNuYA4ZxVr
         DcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789714648; x=1790319448;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1FLM+CkV68zd/McNTCIwsQNIBUX6pTcu5N0rHLOGSs=;
        b=IJ2agQ6B7gzFjDvtAYgapXXaCcOhKldWfC9F1fKklWORM+upYfHLEpQEdD/krAtQku
         2ShavXl93fXgamj8AGyBIRhQ73i+DqsDK4UA3TfBIY5/cEBTZ/ki4PRhMp5HoOlBUQa5
         omLLwJZ1MEOdfAqSBNAX5BryjwMZVhg9Kpm24UPEeRRZEOxGeryS7ig/Mg6j9Sep45Zu
         /OCC+OZr7S8gW9tCuRf/aiJoXsQMTZI9jYvuFZ0NMNo86UzD8jGLRzEj4A4D4rEAQK9e
         cCa/nMdY4S3R1rH2lXUcr8PozBBlfTwy5FYqGceNs0ZOmO7tewn8ZjsTab+ZQPI/I6IQ
         8YQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSVftJ5Rkb6tUejIHKMfOed33AadtAcNTpvR5VD7mN24v+dQna4pvsGU6eevbLbwsVZE0VT68DF4yFhw==@vger.kernel.org
X-Gm-Message-State: AFuF++l78OgUn+zRtV6fqaWDjxV+l2nzO5KiiIYAyV12HyNF605ej54r
	SmyX6a6TKWx0IhyFh+7dJFfBfnurqOQ4ZcdDSZhfTCGtbWz3beUZxCKG0EILd2lzbna5bQB66tF
	R0wRkngPdhZWuVUjT86WxU4aYeNBb4xnTme3WqoLK65ff2NLIi7lzX1115y73kSlkWQ==
X-Gm-Gg: AYBFou1zbhQU4nJOY/zeyMgGJHCjIv7X6f8eUTH05wkq54tctTy0uNkECElyqxLc6O7
	2xHkR+vs5KdF5cZ4a8SZ/g0TlORMx0a8MIQ/IWtOTMFPp4glXIR0Afr2EvwPHtNWZ2KfrYpGXhd
	SqTH2QvgL247ovr9MAmfL/HEeTqxFYpOM4hDmOB7QShk2oHntMcT+66/5AiG7bkITK0Mdlbetqj
	LZNaTgF48ETQ68giMqzatqtkLQluWs8YvAOWAS0U+Dqf6SjsO3qpCWjuX+NblYajlj0JHhQyUB/
	OPifZFpN7NY+4G3xAlhQDqufFYWI2UhpMFxBOj/RgTT4MSn8cfjGTPHzd7ytSLNppvZv/h6Lk/a
	f88rnsMLf1kZlgAy3q+V1BKE1eylUrtI5
X-Received: by 2002:a17:903:19ed:b0:2dd:319:c9ef with SMTP id d9443c01a7336-2ddb1ab3349mr35050915ad.3.1789714647511;
        Thu, 17 Sep 2026 23:57:27 -0700 (PDT)
X-Received: by 2002:a17:903:19ed:b0:2dd:319:c9ef with SMTP id d9443c01a7336-2ddb1ab3349mr35050555ad.3.1789714647078;
        Thu, 17 Sep 2026 23:57:27 -0700 (PDT)
Received: from [10.171.1.18] ([106.221.176.116])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2890b915sm1950432eec.30.2026.09.17.23.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 23:57:25 -0700 (PDT)
Message-ID: <ad600338-dc87-dcc4-f1c9-8cbd53a1dc46@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:27:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 0/9] media: iris: Add support for glymur platform
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-dangerous-illegal-honeybee-cf479a@quoll>
 <ad32f584-ea27-4da9-9397-147b887a7d68@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <ad32f584-ea27-4da9-9397-147b887a7d68@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qSjTlKZKob5ikQk4V8S4nM4GpKKv15ug
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aace0d8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=LX4K7wk6A3+k0W4S2WE0Kw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7bky9te5nA2tsC3mpIgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: qSjTlKZKob5ikQk4V8S4nM4GpKKv15ug
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA5MSBTYWx0ZWRfXwul6o/lHVcE1
 +WD2K9arozVTnMxTRoYv51o+Tk6oUK+WldJWBL1U4Uth+igh28eaVadMho8sHS8EzgrirDSqDQF
 Cgee7pXlVVDO8umw5UNB2CNXdXKC242HnkJaymAn5FrTM9ljQA3i3U1XiQtaj+nTGCQskJdkWfR
 oiMU2SyqqjN8LysjPz2e5a2wUYkN6m/1pCLOf3m+D+j5eWrcBvKT5NmAKtNi24i6WTGxiZq9RSo
 NDbtpjOdAw08WeuJ/gHFEsyFrhD+OQ7z0B3kSKgIwx9SX4JaE77eLMHrDubeCChmErVX2CgdILr
 rfeKVdYkTFAGn3cXMRsVvTLf2Z3hfKVfgUpzds5XsrRx/LZHxJ4GFFi5W26YpNPhnGPlRBDhbDb
 vNxgeaiTWqQ96BIezVrHdZtCvocSKv3EdeazsHOdaxOnrogYYUBYaCC+RG0m5uB99L4cfWXs4L4
 npKsVsBDQGFeDJOxznQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA5MSBTYWx0ZWRfX093uhg2H+DbL
 TSOqOG+R0fDRD5vzIQJ8bLwrZZdaMZgF+B7xiwRZuJi0CGUvnlXCsGWef7jw85tiCN3AR0xuGHV
 r+HWP/uDNXPv9cyNFjjLzZVEuIEfl88=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180091


On 9/17/2026 12:41 PM, Krzysztof Kozlowski wrote:
> On 17/09/2026 09:09, Krzysztof Kozlowski wrote:
>> On Thu, Sep 17, 2026 at 10:30:19AM +0530, Vishnu Reddy wrote:
>>> ---
>>> Mukesh Ojha (1):
>>>       media: iris: Enable Secure PAS support with IOMMU managed by Linux
>>>
>>> Vishnu Reddy (8):
>>>       dt-bindings: media: qcom,glymur-iris: Add glymur video codec
>>>       media: iris: Replace enum-indexed clock and power domain tables with per-block structures
>>>       media: iris: Add power sequence for glymur
>>>       media: iris: Handle CPU_CS_SCIACMDARG3 register write via program bootup registers hook
>>>       media: iris: Add support to select core for dual core platforms
>>>       media: iris: Add platform data for glymur
>>>       arm64: dts: qcom: glymur: Add iris video node
>>>       arm64: dts: qcom: glymur-crd: Enable iris video codec node
>>>
>>>  .../bindings/media/qcom,glymur-iris.yaml           | 218 +++++++++++++++++++++
>>>  .../bindings/media/qcom,sm8550-iris.yaml           |   6 +
>>>  .../bindings/media/qcom,sm8750-iris.yaml           |   6 +
>>>  .../bindings/media/qcom,venus-common.yaml          |  11 +-
>>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  10 +
>>>  arch/arm64/boot/dts/qcom/glymur.dtsi               | 120 ++++++++++++
>>>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>>>  drivers/media/platform/qcom/iris/iris_common.c     |  10 +
>>>  drivers/media/platform/qcom/iris/iris_common.h     |   1 +
>>>  drivers/media/platform/qcom/iris/iris_core.h       |  32 ++-
>>>  drivers/media/platform/qcom/iris/iris_firmware.c   |  69 +++++--
>>>  drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
>>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  19 ++
>>>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
>>>  drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
>>>  .../platform/qcom/iris/iris_platform_common.h      |  46 ++---
>>>  .../platform/qcom/iris/iris_platform_glymur.c      |  78 ++++++++
>>>  .../platform/qcom/iris/iris_platform_glymur.h      |  15 ++
>>>  .../platform/qcom/iris/iris_platform_sc7280.h      |  28 ++-
>>>  .../platform/qcom/iris/iris_platform_sm8250.h      |  26 ++-
>>>  .../platform/qcom/iris/iris_platform_sm8550.h      |  26 ++-
>>>  .../platform/qcom/iris/iris_platform_sm8750.h      |  29 ++-
>>>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  20 +-
>>>  .../media/platform/qcom/iris/iris_platform_vpu3x.c |  67 ++++---
>>>  .../platform/qcom/iris/iris_platform_x1p42100.h    |  27 ++-
>>>  drivers/media/platform/qcom/iris/iris_power.c      |  20 +-
>>>  drivers/media/platform/qcom/iris/iris_probe.c      | 153 +++++++++++++--
>>>  drivers/media/platform/qcom/iris/iris_resources.c  |  81 ++++----
>>>  drivers/media/platform/qcom/iris/iris_resources.h  |   8 +-
>>>  drivers/media/platform/qcom/iris/iris_utils.c      |  58 ++++--
>>>  drivers/media/platform/qcom/iris/iris_utils.h      |   3 +-
>>>  drivers/media/platform/qcom/iris/iris_vb2.c        |   4 +
>>>  drivers/media/platform/qcom/iris/iris_vidc.c       |   6 +-
>>>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 216 +++++++++++++++++---
>>>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 137 ++-----------
>>>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 102 ++--------
>>>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
>>>  .../platform/qcom/iris/iris_vpu_register_defines.h |  13 ++
>>>  38 files changed, 1229 insertions(+), 444 deletions(-)
>>> ---
>>> base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
>>> change-id: 20260917-glymur-627d049900e0
>> Look here:
>> https://lore.kernel.org/all/20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com/
>> change-id: 20260601-glymur-4fcd4d832ecc
>>
>> so now does this work?
>> 	b4 diff '20260917-glymur-v11-1-e0c8bc914742@oss.qualcomm.com'
>>
>> No, it does not. You are sending bigger work, multi-version one, part of
>> even bigger work, so please get the process working correct to make
>> reviews easier.
>>
> And it is getting even better:
> v6 change id was:
> 	change-id: 20260515-glymur-6e69bc258fb0
>
> https://lore.kernel.org/all/20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com/
>
> ???

Thank you for pointing this out. I lost my original workspace and had to
recreate it, which unintentionally changed the Change-ID. I'll make sure
to preserve the same Change-ID in further revisions.

> Best regards,
> Krzysztof
>
