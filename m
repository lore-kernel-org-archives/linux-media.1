Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A979E5476E4
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 13:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082222; cv=none; b=bEJKKke4LtMQV21w5HrHdPHHCfTlF8DvtYEfSJhgImEG6Nqwbkre56YmjebB7ocEqvhlZCbJ73dMC4JA3bocZ+tO3swOzmwEqTTE9l0p2FWz4QqccjZ3UNtSdACfLL3rlMub0bhI77HVSTe+l2am77FI2SgnMK/BYrYZYxoyDbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082222; c=relaxed/simple;
	bh=bxddnFMM40rZJyomJz2B+9UVeiJC1/Kposg8e7UdqeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmGAPVl/vFsTR9BSbzXKR1ezF9HxSjsuAHPRr+HotPAlGYbAn//VPrZwGmH4hP3kuY7Yx/io0frGD36WKnvr+DaQAO1hmbuwrI4I/FJjmZR1Gx/Gysw6+MoSuMew0EkloABHBMap/+A8KUEp8Pd/s0FW7VoMVfgWJlneTRaj3m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajAwFPjs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDUTDep5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajAwFPjs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDUTDep5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBOtcF1145879
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 13:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8/QTObLMZagqKCMz1L71lAYH
	9ufZSbJaeEUf+dsnNk0=; b=ajAwFPjsQRe4rAVQcqrY6nP4OItBpLYKICHCIbfm
	QLhshKjxnxKRRnuJgjQZEEEbYZ97koOLodlsL1Iiz8wXbdY7xwfuR+w8xmedu+qZ
	h2vINZK7Jed0op0dBHIvDEoCmNw6Rbjd/WE53WkzPqNbHc2Bq3fIV3/eHTkFUGBt
	LKMYbZQ61hzxibu494ftwJCE3hxMFFcprdHwM1X18LXfPDxN1+WD6NuscQdjLzSV
	IpYUc17QjgIVy3IClqhlNC48+jHHzLvPbIIn0Zj4DDSZW9YOCTJhIsrYg5LdWSD7
	eQYtvCeO6JXyQI4eHmCKp81yiiDUD+Z80/o1aKdVCuTVhg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqycrmpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 13:03:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82f879767so5921805e0c.3
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 06:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790082215; x=1790687015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8/QTObLMZagqKCMz1L71lAYH9ufZSbJaeEUf+dsnNk0=;
        b=EDUTDep5EwK5igK4NsQRjjB6L+m2LKGiiuQvhtBI3uKAjPEiDeSDCYLY0bCkln4pVe
         DOn9VZvj/+IL2ZtOcDpAx+9a9gvyv/qv9pCMaTDeJy079D0tMmf/dWooZgwxqvbWHsXm
         EStViEPnOopYs60vXuQc8/gsjJGKdOPAfQD7dtp9lyLliccacWJnX00S4RHT4g0N8XIv
         Ro+5zbx0PVh2RvhrDBu739h+rroLNa5ConP+xzTwBig0Igogh7HY+Keth9sriSxmV30O
         YWSiXMsWjWaGu67yOcTzWZ1l2OXxY0D6TaeL86q9hsKj68ZjyaxcluVsopishpSuo/+7
         nYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082215; x=1790687015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/QTObLMZagqKCMz1L71lAYH9ufZSbJaeEUf+dsnNk0=;
        b=imweYeoYrNAjMY1FJ8khHBmP/Nd0UamQ04sa8xZYapjXgVUWF7rUPPPh3ITpWNzS6N
         wGSN2mp7A9sUh1m/2IyQ4wKgIlmrDAQphUPVuh2p8oI3EbSIR4512xrXiuqms+9ma4zE
         rVMBcwVXycut99JhDHI5ksqaVaRVbg8Y0/PuYmOOKQzyiTjGe6Vy9e7y+kLq6iuRULlq
         AxDRuNQJWuFJXj5CHPCbbCLWSt5S4B/+7J8hftWSHEnS/ZdHyEPcaZBpWvEJ0ubVEx4Y
         iQTqHCExf2E6GaqkBeBuf3bc3hhQp1PJRePm7AGd4Xdh+6SiNTKnJuoYlV1cyIziLUvp
         cWvw==
X-Forwarded-Encrypted: i=1; AKwUvBwt/PkFMx7Utvczo0s+R74OFuTXwOXOeIUV0jrnd21y5E+9ZNVcrHNk83Bivt1uODcfDBygC3+B7dsXfw==@vger.kernel.org
X-Gm-Message-State: AFuF++mXFj1AIUV2IIV/epoZa1mZDNR5HkEHlmuOSUCEL6uRy1bWW5Fi
	0HRIIt13HGNRI4MIzHuDNZq1Z1xozU/htPxMilCrkNlhDKkQetlthUv3sLv39YmebZX5bVms9eM
	abWKEV6jfSomTw30da54R9zHhv03rPD6Ui3afCz8c4GDyjIJ6MnPuA/jpjvBMdsJvDA==
X-Gm-Gg: AYBFou3BIqXbQEbeXF5VTU45KHgAzfALp2/2cOu0XH1Y3Y4mPZ0wZQv4YBQjaybZm4K
	Vdg8CBJR+Pe3lC0485yIIJoKOckvcDU7AilLUNewiHbGZ0tbi1ZMPrutEsJUOrrKIftNuGVKccZ
	UJ19Z2arJ9wz1hRFC9MDiCx3zFb/FIOUCWQOOk22wQmUZe+PSdKjROZo6Sb4QUAHO1KC4OumzAE
	tNisZzLVWHL9pec1xxnQWrZLRGq5E8L87Q38E2mEe1rTvgCOmdHCpn2yBGQQf0OONCtbaTNss0s
	xoUxfAAgRDCwY0g2o6ORgqE5RxwWCfrVUn6i7V2T9veLKQas2hTGCJDbQAqFzU1izSEKjue43wk
	uyORkvNV+pve3btRU1b4ogKx1XAOgT92idPkbji6n5UIcSAsIyXkZq0bIefWpfbnHfOVQUULY60
	6Hl60Smut7YGf5
X-Received: by 2002:a05:6122:1b8c:b0:5c9:a60b:e5b8 with SMTP id 71dfb90a1353d-5c9b599c8c3mr8828598e0c.17.1790082215415;
        Tue, 22 Sep 2026 06:03:35 -0700 (PDT)
X-Received: by 2002:a05:6122:1b8c:b0:5c9:a60b:e5b8 with SMTP id 71dfb90a1353d-5c9b599c8c3mr8828507e0c.17.1790082214701;
        Tue, 22 Sep 2026 06:03:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46dfd50sm470532e87.45.2026.09.22.06.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:03:33 -0700 (PDT)
Date: Tue, 22 Sep 2026 16:03:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 3/9] media: iris: Replace enum-indexed clock and
 power domain tables with per-block structures
Message-ID: <zwqr6biua7ft6fkcgloqucthevvtp4viupyhrloc35lkqo7azh@4o722xibsjmk>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-3-e0c8bc914742@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-glymur-v11-3-e0c8bc914742@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4OSBTYWx0ZWRfX3JEe26YCWQaz
 1tmMEvxTYnFedplTWBD6mzFLgH90AXI9/fWbLrbw7gvF3/+p634Q+1OJp//7yGA1ZcL7rZ5GPTe
 fQk86qodVgvmW7DWG4cNC86k6gC/BqY=
X-Proofpoint-GUID: sHejJZqHMRwvSITKkmBJEz0a6-EThZf1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4OSBTYWx0ZWRfXytPUdZqHkd0s
 BaAVhyiq6tTfLy1yI12QEqotR6Ty6MmlffqFbiB3pwnI6TcbLyC1UrJW/xbal9IbeLUyp/2zQrX
 r6vknV3jv5MX1nQXL5tKhIyejPEz36pmghhqhVtnJij7QeKbLB8+cWiReNPMCmkRGcjq+Wmd0vT
 QghF9fiqvbC/lkXVaOMPNzbbnx3+yX/3Ho+xr9gWh1vFx33fAhLEKpGt6EX7Tzrdb54hQFYl9Pr
 tDIeaPAPNSY3BSE755ZcJyv6STO3Z5cKqnO358RHaM2Pt/a8mAkikKfzHzOpIxICDlisFBn6dT1
 RD4fA75zBw1jVkwi+LuWcECaPgqK2jU+cKxtQEsm49JioZtUBAOE407sOLN0Wdvq1TGTS4eeBnt
 ONdP8Mf7r38G1sRKrWi86k+sbGs4hw==
X-Authority-Analysis: v=2.4 cv=c8I+0h9l c=1 sm=1 tr=0 ts=6ab27ca8 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=cQsnMm6kD37X6GfbhGIA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: sHejJZqHMRwvSITKkmBJEz0a6-EThZf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220189

On Thu, Sep 17, 2026 at 10:30:22AM +0530, Vishnu Reddy wrote:
> As new platforms are added, the platform_clk_type and
> platform_pm_domain_type enums keep growing. Every new clock or
> power domain requires a new enum entry, and every enable/disable
> path has to loop through the clock table to find the right clock
> by enum value, adding overhead and boilerplate on each path.
> The enum index space is also shared across all hardware blocks.
> On the Glymur platform, the VPP0 index for VPU4x and the VCODEC1
> index clash, making it error-prone to extend support without
> breaking existing platforms.
> Replace the flat tables and enum-based lookups with
> iris_power_domain, which bundles a power domain device and its
> associated clocks together per hardware block. Platform data
> describes each block via iris_power_domain_data, and the enable
> and disable helpers operate directly on an iris_power_domain
> instance, removing the need for any index lookup at runtime.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h       |  23 +++-
>  .../platform/qcom/iris/iris_platform_common.h      |  41 ++----
>  .../platform/qcom/iris/iris_platform_sc7280.h      |  28 ++++-
>  .../platform/qcom/iris/iris_platform_sm8250.h      |  26 +++-
>  .../platform/qcom/iris/iris_platform_sm8550.h      |  26 +++-
>  .../platform/qcom/iris/iris_platform_sm8750.h      |  29 +++--
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  20 +--
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c |  32 ++---
>  .../platform/qcom/iris/iris_platform_x1p42100.h    |  27 +++-
>  drivers/media/platform/qcom/iris/iris_probe.c      | 137 +++++++++++++++++++--
>  drivers/media/platform/qcom/iris/iris_resources.c  |  81 ++++++------
>  drivers/media/platform/qcom/iris/iris_resources.h  |   8 +-
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      |  37 +-----
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 137 +++------------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c |  98 ++-------------
>  15 files changed, 347 insertions(+), 403 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
