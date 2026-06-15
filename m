Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487D13AB285
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 06:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503878; cv=none; b=UiRLXJAZ7vLOf9btWRq310K0hg6Tn5J29Y9/b0oAXUoyxZep00NnlX6bv44fcARH49KZP8sOx7mS/7QWdb9IjeDnbWl/DbYYJ3D3msQ0NRyM8VQB9p8b3qCK9k2b4bPCGuQHzOIqb3ls9QVJaBYcumAUBWWJ7oMgEOAPW+UBEX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503878; c=relaxed/simple;
	bh=fzjJzwjz485Saj6HPlarx9ASscbSys4xUoYsx+i0r2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a5EXXxCQfYE15ovltIg3ekeylvd10pE6itULXFdX+roYKLDsqnogrO2uiwcddzEyneDxLpnW4LXF/RA8YtQE4FT13KHSdon2MwoxbRx1TfBXwuj8aeA64zZDPz9piPh1YGMvG6yQIzfCE2i15Tt5x79JKGPY0+WIGAJzDdRcnXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SPj+BG/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJ4jjg1a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SPj+BG/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJ4jjg1a"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kAn13307873
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 06:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a4+w07/l4/bmAUktfokBZha649b6R1Y9vFgu2axoyDs=; b=SPj+BG/larudEZzU
	5vnucjaKmg36z2vXouXE2woNUU5bl+KJGjwFEQeLWbhD2N0bEp/3Wmvskp69RhQw
	DQfTWWUu1fGWAuOl8EnjN3b5nNyVCS4hXAWt+iSATUOwwc+FTcElDf/tgNX3OQOU
	lC7pU+67u5inNugb5NzkiFUnYTWTFOnBUoLoDaX5oeeUfWi99weQBANvCpjTEdhK
	GQ0vFwpnLFPWpvxFIHk7KMaoOxaZjn4j1tliv2juY67vkG74WaOfettF7HMGnwsl
	sPBCkF0V8WIU1mGK3tYa3y9LqBqzxqB20DyhCmACPPX2k6Y92BJMuuYs7lGKIWJW
	irfsQw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6wufs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 06:11:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9158f2c4b55so496627885a.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 23:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781503876; x=1782108676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a4+w07/l4/bmAUktfokBZha649b6R1Y9vFgu2axoyDs=;
        b=EJ4jjg1atOLbxfQuO87dpWpmXhp8YKI/IhzKTOWPmEyjpFWJXlz3hZdWt0MONncvxZ
         PNKZebqcmhZs8vRlrYQ3sLAhoNi4CJVNUdtNZFvAhP7ZU87/2v7bFIebCRwvC/mzif+t
         cXqU12RvgK5aH0IQPyal/Ghd0a5Xb6ds/0/jfFGqQt//x0u8IOvTrbUArtTCXPTDMg9u
         8k8tW4I/sNuZmPipdALjEvQdbG5/AyOdHNreFM4nSxeubmatwRLN3o7M+tA9hS8++RF8
         AxPz/TSQngVJWB/DEzFMg8wBK6Vss4V4lM/jtkH0N2jR88cqOxJ0lgRxWnaC4F0oOICf
         rC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781503876; x=1782108676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4+w07/l4/bmAUktfokBZha649b6R1Y9vFgu2axoyDs=;
        b=JY27RRPMV37ZN2oy4+lTD79Dlek3QI1VSuciHQW/CnYP4pl2o1j6ZKEfhZod/Nlijk
         Uoj7P4dOEfWXC5hVXe+wMJ66GFvADaI8InfBrZ5RKsjNecVz/AWJuaf5UFlVG3BGMfsl
         p5BqKIk4C8HP7w1ztWmrn+x7I+MzguGmjdB6J2+1kYwOcWfQ92ClSG9Cq+6OYsyCrs32
         N/8xAiycnG6Il5/0npgYrvRWT+2EkykWBBtgbS+XE9cCmmPFLF5c3wHxfRS28L6u21Vy
         86XjaQHqNq9r4gIOJPaYnLLYroPHfLgkoALRE3ml/KSuxM99fCdAoE26/eLnuHxp3FIt
         voRg==
X-Gm-Message-State: AOJu0YzrQJ5p9Ic/u6jR4lDVP1u3AbpF+FS9pgJlieYC3GCaTCfzqkUb
	ysmozj4woQFgz9zV5MJtKo9a1bHq2bcCRBbO9JOCGZV/WRVsNkuw12p7+3MexfW3ZGl7MJzn/Xp
	qrWLp7scyZe/JG3o1RNQzxdABo/HUEewqZGWienxrg/c64IrhYv/Jn3Slbw3uIO+iTA==
X-Gm-Gg: Acq92OGGwuB2ENpyC4paXezz+Pxwu47c6e/BoNH2ibBGojBdY1P3hVFmlW4RfhVx/Uk
	XhQ2CwRWTFSSUIPA8bgrhE5EIckr2XhwAXR2OCJgyy37aZI9bOclPXKeFKEnTgYHX74FDJVnxlk
	YD8VCgO2myywO1e3nSw0oRY9JDalvlOOtnlnSZ0QYG3RRM6X3yJncN9ozP7U2SJM6X4X2HX6LJ+
	Zc7Se9qOncWStN1XCiyO9MnqJHwlRGZQidpOoVgMWXzSDiku5eDBzjTDpzFeS3dMTqGFs8sbG/x
	8A4LDyum3LpSzFzf4dEhTgKn6/rrwbocyaFsEmKQhxnsKCBvWyzXyjgrfPvWXIXj37YfCVqoUwp
	+xIcmDDCHeUfzcTa5FkSy6NMAbdJoOw90KTYxB6GE3rXaYFSFgRnfBMVB
X-Received: by 2002:a05:620a:440c:b0:915:9de3:226b with SMTP id af79cd13be357-9161baf7dc6mr2006476185a.18.1781503875487;
        Sun, 14 Jun 2026 23:11:15 -0700 (PDT)
X-Received: by 2002:a05:620a:440c:b0:915:9de3:226b with SMTP id af79cd13be357-9161baf7dc6mr2006472885a.18.1781503875073;
        Sun, 14 Jun 2026 23:11:15 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919b556sm2791009a12.4.2026.06.14.23.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 23:11:12 -0700 (PDT)
Message-ID: <a0a74410-e729-4e82-9fef-d72115bdd801@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:41:02 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/16] media: iris: Add platform data field for
 watchdog interrupt mask
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
 <20260612-iris-ar50lt-v4-6-0abfb74d5b3c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-6-0abfb74d5b3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA2MSBTYWx0ZWRfX1YazocfgXU4I
 Y17Er9E5Y4Z/xLB/WbPnb+C4zNoTbepWVarMpB4o7kU9yJFIE5cOlXhzw4zpwLWoUbKXNGhpO8+
 oB0O4mmUXuoTvhrDrXNb7la9o1bEBTc=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2f9784 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=1BxbLvcILuCGMxPr/bnfdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sQl9ibgnB-ql-ZCiWtgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: zjbPMHnahRufeEu2eKzXu0vmh01kf8ZN
X-Proofpoint-ORIG-GUID: zjbPMHnahRufeEu2eKzXu0vmh01kf8ZN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA2MSBTYWx0ZWRfXzrnJ8E81wC5r
 lbBsftNetEOAA25KPprgbgubcj96d/yiwJDT4dyx0f0IrKrthCaZrhkqpRVR2zb6fKSmPFbbAt8
 eTGEZkgCH55C9m7NqDEamDxcg+y1kdF4YRM0zCQcqeqp8GQe/079iqRTyP44gGGUNUwYU/GN+wq
 UNqWkla92n8rq/YAJpic8wRWMV81/lVCKaGuuBQL5JuYOqdW+l3UEbObb1G3+AwWfOu8Sz6t4YI
 SvD+nBX14Q71HEKa42CQIwttYHMXi8RVMgwUHPg34FrZ76i4KMZzrvSNNtHA7A+qkbm2Nq5umVn
 VLQkCPtNZ6mEtmfKJAip442zTpa6kdMWl9yQvpjcuHn+iA72KzneGTOcjuXp2VRtRKJWqaBWuPK
 DPsV4xm0ri+mURGymc2qIV2lJZFODZlLxj28CKQaB7SSIhmoKl7f4xSi8LdZR7bFEptl0+zIdMU
 2WnLFEiw9crL3s2EQ+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150061


On 6/12/2026 2:55 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
> from the currently supported VPUs. In preparation for adding AR50LT
> support in subsequent patches, introduce a platform data field,
> wd_intr_mask, to capture the watchdog interrupt bitmask per platform.
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
>   drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
>   drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 6 ++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
>   drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
>   5 files changed, 16 insertions(+), 4 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
