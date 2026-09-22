Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA1846EF9B
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100571; cv=none; b=O2iqVdqj/XdAQeGZERx28srH04/0+cdxOyXKqRd0u3u4SHn4izT+GSWoCOIotI84dg+PQ1Bh8b/epYSncubziItSvGDi/UZUAttc2jwHAbrPi+XPFzXRyFY05DG94N1ukRUWaf29rzidcJ7mbz2ddtrBcbEsUr676Am23XXigjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100571; c=relaxed/simple;
	bh=VqkBZkDaJiRDdADJ8Lxaecq3PYa0YExXfSjFPd9R/Fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ttbDe0TkpNlCEpNxbEu8n1IpCIkv7ynqL1uJzxvJvVBrc8cDvyG2R7voMd4NUp+oRLxn6dpk8/YZwTgg+mYPkBVmq7tiTqh7C2FMIHggDEehFfvPaS4pPegaIcMkQyDZspCWKDyWKHTfYYwzWL6LebTWXghyYkzarl6eYv3eaz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqQowyh+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WQZ0oCER; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqQowyh+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WQZ0oCER"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6qLc178635
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OUYfzTv8ACTsYRs+CfRzQrQLm7ATPQuahpCau7u+jJY=; b=UqQowyh+tpao22yu
	zk+Hbc1nl42ZY+WUJb/SGORwpESizUkz3N+XG2KEzcX6eaOMt1tJvML51Ko55FOs
	/oOrL7lOStXMJs4yt9b+GQEMSS16oHP05MwmEUn2H7NoiY/bnrJ0SdCrTLm1tq1b
	t7qToka4SmSnFTkNJSzNT3DctekjReYyEOcPcJKGnA3+rpDYSKKorkJEIwxVTdGF
	pOtlIItLEXEvDPqXTikKK3tRek9UqsqTUCmWRwr6dntck5Ki9gBmBoHc2DYJ3OmD
	5xuu9yENPmZ1PEkatFJOZLPYIZnGFRu2JY7Qq1KD9hg3xeR291HxsPmDHm8IwHsY
	5xMuMw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec1740-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:09:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-334f782d1abso260079eec.0
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 11:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790100568; x=1790705368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OUYfzTv8ACTsYRs+CfRzQrQLm7ATPQuahpCau7u+jJY=;
        b=WQZ0oCERpJ1O604L2O7E9QT+t6G0jjZEP7tAlWU2Dpgz25QZnni4xqqkrGCzgFkEG2
         JOweJpDmvHpz+UWUGM1wfFSl6qSPaWnz1Q9xVk/QJZKlKfWnbTSbMiosq5dV5SJtWg8b
         ooSuQgLTq3SMV6pYca38cbMcqZkfuuQro7eOkB242AaP2+9lhjauwKM8wtjGz1WM78kW
         61N6qJs3+DgyshkV1CcR7SH9U7uh+TH5fkSD6mNczgoqSNSQ2PyndneBTzazlYTzsSqa
         CyWguXs2P0zPY5RdSbdTRuowm1K5WfNt1537bdNxy9knFqNvu3+l0UUFiEOLdZUtKl1c
         2Wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790100568; x=1790705368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OUYfzTv8ACTsYRs+CfRzQrQLm7ATPQuahpCau7u+jJY=;
        b=etitSQ8Ii+i50wJqgN2EUuqbp/RGkG/QYk97fyLJ/TYJXsi0lIXUiy8omiI7NsEInv
         bCResz4mLnMDoMzTUO1wvBsAMddPPf0DI50i1dw4NOO4gMCF9RqWTisBmQd0L2MPGKtG
         /tl1lPbdY0muwvrnkX+POpskN6fkG7cjMfIwjmio2xmibxkPRElP5pcXKKg5i+9uPuYI
         cG7it+2w9VcLUWEnUYRJXlqfLYDmoqdfLqektTD9n1FEyrB8O/5knMhtcNqWuVRceouG
         87hHlbn1QUxJb8R9nId1qDiCQ9cu+4j3TILRuNyc9wD20TPzlAlVTm4Ol6RuBFYu2TAA
         by8A==
X-Forwarded-Encrypted: i=1; AKwUvByhTXt2HkYs1htIwRgjTNqWHW/HlMJCtMvLPs3jtraQuRsYrEiN97T+j+ee5E/ktE0TTFR+w9HhCWcLBA==@vger.kernel.org
X-Gm-Message-State: AFuF++ktmk2JU1j84PkDPh4M+PvDI95heZpXQZmeeqxipfl6T/d96QDE
	/d45vvk9YLNI6vtxzuiPRUiKuAQkp2QANBekzZLy9kPiEnJcnlpHtvGoOrJGjdOfq5Fls6izCsB
	9X6p2ZOTxmKfbNG58MevOv+HD9R2TCfgCZ/dsHB3dO3Zdj+A9YIq1rMOopEu/JbhvKg==
X-Gm-Gg: AYBFou1GjDiZcOKgNKdvxs0CwJorWPKjAacqNtBnUIEU2JQI4kid3cTzxzAb0DuHeXA
	lrNUao+Ee8tDuwPYtrCqVQNhKtZIvt4Kn9euT/IEF2TIWBRzEwD9qam7eCJyW8g7YS9CUbfEkmM
	GGFSso+46iFv2RPv9efkT+4B+aUeP6c6llVwzSw8ze2g/SUANirwGZlqygT0/bWBeJJQDqpcTrH
	cz5UGza9oj1OofqPT36cEao664yP9ah8ygAtMHX/0iAqZ+w7P4kbKGHWuxjGKc1Ewd9hleDsE9E
	el9HFVA7D4Dwn8BbEDD79CgTjN26z55HK9GZKMdM08zbjE7vyu+uI4onTeARC2stR+Prm1WwLhG
	+j3FNXtTaat6Pp7KgnXWV8B6lCcW7Nc43RQ==
X-Received: by 2002:a05:7301:2e34:b0:33e:6812:29d7 with SMTP id 5a478bee46e88-33e8d9ce170mr70664eec.19.1790100568465;
        Tue, 22 Sep 2026 11:09:28 -0700 (PDT)
X-Received: by 2002:a05:7301:2e34:b0:33e:6812:29d7 with SMTP id 5a478bee46e88-33e8d9ce170mr70631eec.19.1790100567834;
        Tue, 22 Sep 2026 11:09:27 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7d003sm7215eec.9.2026.09.22.11.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:09:27 -0700 (PDT)
Message-ID: <0eea448d-da5c-434a-909f-b50cc7c57754@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:39:17 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/9] media: iris: Replace enum-indexed clock and power
 domain tables with per-block structures
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
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
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-3-e0c8bc914742@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260917-glymur-v11-3-e0c8bc914742@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX3MDzm1FMlidI
 5wm1Q6Kyst5blqrtogzO5RWb2TuiImK78xZ7mTVbPCB36moJYWHH0EaFbslnx/8RvAACDYogvpk
 QeBzXA5SmJKHRuHj24fxWY9hntCv/4od9qKrv1yzshMuX+BVMQdyYg3oXrP60esI4tsNGjTDUPt
 i0Gvln4QBE9CBd2aKQmd15Ax6cyM1n7FcW1OTz/3VDBbGjxwsdX/V4oTio9bhIHx0oFkGWE49sf
 /FuMnW32Y21EvWfTwvCBA4gdkoOR1YxGDQyCzvuYLo7hnLs6+B80wLWFWMhzxufkKIUOnOPfl0k
 mqx7i170H9uvUF47hCUU3NaN1TnmokMhUFapoXUQqDKRQA0ob6aIvoU9f90vXz3oyY9gDRgKEif
 xcFQ3wdE+lMb4+Oya4qLvSk5B3VQ/i8D/Hj2IlD2Hj+bw7JftoGyVDKkv53NF0ylwGTp5JXEaYP
 GMg3oy8VbHDobgqWt0A==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2c459 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cQsnMm6kD37X6GfbhGIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: G32mUfivkE07V36wVc0H-2Glcw45JLbO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX28KkW838Fst3
 xM8C4zzHe6TJ2B/u8qksyPK7eb05IBnsBzywFgRLBSR0iJa0ciY5zWU/ygqxURv/BYW5cTUmQbJ
 OMgFLe9K2TerYLipM/QL8dHWpeqDuXE=
X-Proofpoint-ORIG-GUID: G32mUfivkE07V36wVc0H-2Glcw45JLbO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220265



On 9/17/2026 10:30 AM, Vishnu Reddy wrote:
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
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.h       |  23 +++-
>   .../platform/qcom/iris/iris_platform_common.h      |  41 ++----
>   .../platform/qcom/iris/iris_platform_sc7280.h      |  28 ++++-
>   .../platform/qcom/iris/iris_platform_sm8250.h      |  26 +++-
>   .../platform/qcom/iris/iris_platform_sm8550.h      |  26 +++-
>   .../platform/qcom/iris/iris_platform_sm8750.h      |  29 +++--
>   .../media/platform/qcom/iris/iris_platform_vpu2.c  |  20 +--
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c |  32 ++---
>   .../platform/qcom/iris/iris_platform_x1p42100.h    |  27 +++-
>   drivers/media/platform/qcom/iris/iris_probe.c      | 137 +++++++++++++++++++--
>   drivers/media/platform/qcom/iris/iris_resources.c  |  81 ++++++------
>   drivers/media/platform/qcom/iris/iris_resources.h  |   8 +-
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      |  37 +-----
>   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 137 +++------------------
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  98 ++-------------
>   15 files changed, 347 insertions(+), 403 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

