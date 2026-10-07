Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A4946EF75
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 11:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371266; cv=none; b=ILv7tOMOgkbRLbkWuv8t7gXxE3Qndk4L/CNnNtSn1brchyT3zyctyq3J0DmEs+odJREqLyfUNGwLIIG+m38fT/F88jcYBjwCG/c7s7jhMLRTiGOtmgNsLaZOiN/oeqXS1+NNPVHw9zmbYK9gL4zT+XJMc3tvjhlkPPAAH1lwWpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371266; c=relaxed/simple;
	bh=TlBausZj7paEpSo2OCG+1/hcAa2g/DP2/0Ysy19OtmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEjNiaScu7epovl62bMntPFdnhbuIeQJu9ZaL0QSnhcx1Yb1cxx2fSGb2KMeXeYNTfsHf5o6RU5KSWs4z1YYLahw7ORdxLmHSbOCTkUObf/PhRlGLGhYgPnej1xIG1cXzhmWz+HUGrzInG+CisNll1eF+cwdRLxi1+xAlE2Y6b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nk/qRXh8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0Q2ajj4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nk/qRXh8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0Q2ajj4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977ji3f2970119
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 11:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OVylAlNGDwx+g4PVQ8xpoFzVdG/4fpU7iJCZjezlUGY=; b=nk/qRXh8EF9OtEni
	KcUHsL09xhTtGtOQfctwkUVYYcD2K5oLWDxbBjLktAEAowbb8EuLLVFhNBTFPpa/
	L4qguJGrVTm7yIsfBzpjThAUhtJbO4UsyZhxQOWc1eFOlcZNQ3E0SNGV05R3D3i6
	iv3WdCCIItCp5aPO5mZs9S9+aXYDPT+eACk/LIRsUKedAFltreHV6kwRX9WYdQo0
	Vypoo7lyvsYVzVDguNa2WtvxliwD/c4p0RA+yyJWU69W3qjZJANaHwvXDWH8lCFm
	dzLYaVcCoiKyBjbRU0EzHHJeg8snYjx0aOYoB3QKi1aufk74iEKXTzs42tIiivYN
	5bIGsQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c679rm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 11:07:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so672633085a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 04:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791371243; x=1791976043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVylAlNGDwx+g4PVQ8xpoFzVdG/4fpU7iJCZjezlUGY=;
        b=e0Q2ajj4dqhg2hF09hTniEAdrxG0Vbw523aoRtIXWj2GBaYsU4u6hguFgLw/DU5cIc
         su4EI/dD5SADq/j+OYZdgtc4yipWpVWCpuJyMzK3Qw/bF6ydj3+xmIK0l/sbuC4URCAS
         XqcWXpf6yOcOG1mgyD4ZWE9mDkivsIK9yuh6/Kjz+hR29qvZOHQpa470AkHKDvNLD6NF
         XHIg725MhidicN/qZVFO0u3yqas18DvPs+S3KcMnitcb6S7u/EMrjL/qa3mfIF3jGFEA
         ODkSECZwJQP6hfXPqbyxXYWU8F/C2+sYMcho5URJqItoiIRNDHqSFT9ZPA2fBt0wdHvN
         kU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371243; x=1791976043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVylAlNGDwx+g4PVQ8xpoFzVdG/4fpU7iJCZjezlUGY=;
        b=ETZ1gyVLYSZYvLdoEf6MIew48ROBhPfYl6ATrWyGJv//BTEJCN8BnXjCmHsp+YGqi2
         gU2Zg2Q+WFA+tm3hWGvMtdJ44G0ltwHK50/w/aqMnSpNq6bje/Dm/5KSNLxJeDKIfI4t
         WxUVOhsyXjYWqIGKj9whScjTM7Up3gOhWWOYP4EhcEZXqIBNgAG1xPuEy9DoeqZO1QsH
         1R8GbwysZUr6qm6f46xiuWdypB99tmopuGL1pwNUPaBqzG+SaWyPMfK0fvInta0AaFc6
         iR6gVdONwfNhI7cl5amGlrOzKEV4KOffFN4rW5FRM9ug3Jp2xZ2UN4jb/kDuPC7Sgp8b
         nToA==
X-Gm-Message-State: AFuF++kTjSfOQbvo8hpaClia5oPocSRhHpD5isJVI8Fx4/WaQLO8Cn6F
	PoS4Ua5qJPUhZrtbEcXKemMEvod1KaGjQ/cjNsAOHu/Pu/UMgLLsEeazRjuPWfqNbYE7Xk3Hgb4
	WWL6jbbc6Rl7A3Z7HMItFoH0o90Rwnw4xTvl7HhhLBsOetR0UvClrXLeGmtkJuflvMg==
X-Gm-Gg: AYBFou0/ZLoHATb+6TkKqSYSVHpqooCtd9KPN4zVOC04Rj/sh1OCybwjT9TlSHXNyD7
	bj4lRgLl4iyKkIJmG+8QW9V/D4YOk04ennWYTZVhL0T24ARyQGxqdCqRCYsnQrt82cqeG2MWteE
	9dAw26UtNELznxVYLw64iWww4u7T9gZJI+9GLsgQNYDGwfgTMIygcrOJTH8f214P76SOQkZp3oz
	GJLGV2HpVvqHzgaD8fIwAuNcvPGCuAbWssa65N4KdsGfgQK/JcPfWeBD92LdHR5gryKrEelc3qS
	xC9QZC89soIvb0X9VsPbuErlyQAytScsZ1Hzr3UPOIC0wrMKKY41igmbtNuD+BJJkCUMZpa2ng+
	4B07JBLrqGc9R7oVukuNHH4cUNKJ2wHern+SPuJVi
X-Received: by 2002:a05:620a:470b:b0:93c:29b3:3525 with SMTP id af79cd13be357-93e9b7e072bmr326351685a.36.1791371242809;
        Wed, 07 Oct 2026 04:07:22 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93c:29b3:3525 with SMTP id af79cd13be357-93e9b7e072bmr326345885a.36.1791371242174;
        Wed, 07 Oct 2026 04:07:22 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f558028sm69510025e9.10.2026.10.07.04.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 04:07:20 -0700 (PDT)
Message-ID: <59a79ee2-1cc4-409e-bf42-c2e375b51af6@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 14:07:19 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/74] media: qcom: camss: vfe: Separate VFE 690 from VFE
 780/880
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-2-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-2-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NCBTYWx0ZWRfXwzsZMeUDPxkU
 lnBQkcZ5aqwYvTrGp5oSpFzHVn3Vo4RPpCRG1vDwZcLQ2nLa9H01FNcq5BhtiXXIJPV61fn1t0O
 znctrWnjMt3B//jNcCL4qWQaEKivcZM=
X-Proofpoint-ORIG-GUID: 1-DSeLAgg7pa8je2vI44zfqdVWZpVSst
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NCBTYWx0ZWRfX0IIIBsVlg0AX
 l3glb4Xsq9hIqnH5u+V7PLulOy3FMrOOU5C7wGsHO0twNdAXjM100dlmonFNeoZBsMU2bf5OHDF
 UKRRrlMxA0geUN3JPibGCjrnboPHi/W2niDJwCR8dyLZabgBKMUuZoJNXI4owHh4KasmVQSwph0
 EF/c/a7oHNBNvnoVU0dD7kVaWEr0M9MJlMOBcJYJ/dfZN3YwwUvQ6TJ276Tr9er1wD0Y3eCZ8QR
 egXdTlC6sfO7ig8nltHdnGti6n5BaO9f39Ckb2HRnUGBQxIPDpzf/v9AhJaQ3a8Fo1rWUUC949i
 JR1WwfbtlSpnHqEFNTP3pe5T/xEMg0VdhHd3QjYTrdLkP/i4RYae1+ZBmi5//xbzj6LvSVqwF3S
 EMU4KZIoMTQkeng2D6dwP/JjOC3vjfF71I15VgTTl2FmTpQscLBlzMmnxUFOVZ5J4QGfEw10tnE
 Jm5nqYZ4lZONEI0PhOg==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac627eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=9BHYvpX70SqsbJ8ECAEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 1-DSeLAgg7pa8je2vI44zfqdVWZpVSst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070044

Hi Bryan,

On 10/5/2026 8:13 PM, Bryan O'Donoghue wrote:
> Looking at the write-master index for VFE 690 and VFE 780/880 we can see a
> discontinuity between 690 and 780/880. Extending out the functionality in
> these files will result in spaghettification of the code for no good
> purpose.
> 
> The WM index difference is indication enough that the silicon should live
> in separate files.
> 
> Disjoin now.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/Makefile        |   1 +
>  drivers/media/platform/qcom/camss/camss-vfe-690.c | 168 ++++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-vfe-780.c |  53 ++-----
>  drivers/media/platform/qcom/camss/camss-vfe.h     |   1 +
>  drivers/media/platform/qcom/camss/camss.c         |  14 +-
>  5 files changed, 187 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index e82bc8141c241..4dcb08a0e25aa 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -25,6 +25,7 @@ qcom-camss-objs += \
>  		camss-vfe-340.o \
>  		camss-vfe-480.o \
>  		camss-vfe-680.o \
> +		camss-vfe-690.o \
>  		camss-vfe-780.o \
>  		camss-vfe-gen1.o \
>  		camss-vfe-vbif.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-690.c b/drivers/media/platform/qcom/camss/camss-vfe-690.c
> new file mode 100644
> index 0000000000000..6f90134d5ed64
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-690.c
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module 690
> + *
> + * Copyright (c) 2024 Qualcomm Technologies, Inc.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +
> +#include "camss.h"
> +#include "camss-vfe.h"
> +
> +#define BUS_REG_BASE (vfe_is_lite(vfe) ? 0x480 : 0x400)
> +
> +#define VFE_TOP_CORE_CFG (0x24)
> +#define VFE_DISABLE_DSCALING_DS4  BIT(21)
> +#define VFE_DISABLE_DSCALING_DS16 BIT(22)
> +
> +#define VFE_BUS_WM_TEST_BUS_CTRL (BUS_REG_BASE + 0xFC)
> +/*
> + * Bus client mapping:
> + *
> + * Full VFE:
> + * VFE_690: 16 = RDI0, 17 = RDI1, 18 = RDI2
> + *
> + * VFE LITE:
> + * VFE_690 : 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4, 5 = RDI5
> + */
> +#define RDI_WM(n)	((vfe_is_lite(vfe) ? 0x0 : 0x10) + (n))
> +
> +#define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + 0x08)
> +#define		WM_CGC_OVERRIDE_ALL		(0x7FFFFFF)
> +
> +#define VFE_BUS_WM_CFG(n)		(BUS_REG_BASE + 0x200 + (n) * 0x100)
> +#define		WM_CFG_EN			BIT(0)
> +#define		WM_VIR_FRM_EN			BIT(1)
> +#define		WM_CFG_MODE			BIT(16)
> +#define VFE_BUS_WM_IMAGE_ADDR(n)	(BUS_REG_BASE + 0x204 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAME_INCR(n)	(BUS_REG_BASE + 0x208 + (n) * 0x100)
> +#define VFE_BUS_WM_IMAGE_CFG_0(n)	(BUS_REG_BASE + 0x20c + (n) * 0x100)
> +#define		WM_IMAGE_CFG_0_DEFAULT_WIDTH	(0xFFFF)
> +#define VFE_BUS_WM_IMAGE_CFG_2(n)	(BUS_REG_BASE + 0x214 + (n) * 0x100)
> +#define		WM_IMAGE_CFG_2_DEFAULT_STRIDE	(0xFFFF)
> +#define VFE_BUS_WM_PACKER_CFG(n)	(BUS_REG_BASE + 0x218 + (n) * 0x100)
> +
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x230 + (n) * 0x100)
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x234 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x238 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x23c + (n) * 0x100)
> +
> +#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x260 + (n) * 0x100)
> +#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x264 + (n) * 0x100)

So copy paste entire file just to get different wm indexes i dont think is good to have.
You can look in the series posted for pixel path enablement we have different
bus version implementations and different descriptors for wm indexes. I think
that fits better and it is more extensible.

Different isp versions share same modules (some of them are different) but the idea
to have sub-module abstraction is to address those issues. That was main reason
to go with new implementation.

Just speaking to technical debt new ife sub-device vs duplication of the code
for each version, is still matter of choice.

~Gjorgji 
