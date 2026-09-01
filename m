Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5664946AA7F
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 07:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248097; cv=none; b=oMjTyzRrl4v5tVwqme+8DF6RvGJtFM8gtEQDcVEXEf/NoODAw5VBV8fx/BIjF6VCUXVuLyKkUTVn4cmXsqLb7EeZTBfqZl8QRQ6scW1+Ihf6CWEZkCkPa6xlpT4mzw7z4qj0gocRPAnq5/C0YY696uAtvQE2MUZQEc5dhL2p8LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248097; c=relaxed/simple;
	bh=MFEYPaTZXGidEsGjbCjg0usm3Cutb8p7bOkDBGDOfkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Puc9jpnWvxP8RycxjD824b7o2BXvj/0hf7WTayGcQUiSrkDan/nG/TmFxTjCONkCm165KTlTR9cViwzOQRqCYbriNmhabh8V9LleXMTEyOrWLTkVFbwI81iZ6BmivKDSDQIEN/x2+tuqQjSqlIinPLQtOAHuWnB33b9H1Pjpy/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMw/nX9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HtNr/Yiv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMw/nX9B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HtNr/Yiv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179PCT1282911
	for <linux-media@vger.kernel.org>; Tue, 1 Sep 2026 07:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rGlFBkKXrHiR0rsOfALM3d2LLsNECGveEfEeOj5vR2Q=; b=aMw/nX9BJ+vV+icv
	dhQa63ToSLO3yECZlNZ1fGj9czLy7r1tK9aq5+OfXLw845Y7xhlRiONklvIcNtbb
	sNo10YHZ9XBJE6rtjZRATEmIQxdgG8uwZSIG9HG/psp7xnmGI+DtzQgrIeouh+/9
	chIKu5PmaVenFbnizFKDguWIshNSJLlhWJG4J8xPcL2LVNi4UCrbSiv1/l6fMJdH
	cOMHzJ95am8hUxuwGKgDSGPqX546TWUYzuX/I+ipwcbeFf+CSiPlmBj9MR6iKglv
	KKAr11oi/dOdFLr79vjGhTHbH3iS6NCfARrW1g1W7t63YhEKDZtJceuBBkgYdI7+
	bUeGzw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx984x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 07:34:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e96bdbbdaso5748686d6.2
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 00:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788248094; x=1788852894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rGlFBkKXrHiR0rsOfALM3d2LLsNECGveEfEeOj5vR2Q=;
        b=HtNr/YivhpvQcDmvQsmprzi6HN8Rn+iPCudDDOBHLJJsxu3kBlJH2FQV3WgQ3g5uKx
         N0OSR9Xz5ehQ5boPsDCI5oXXmZhPhpJnzBGjFdCGoWrlWfwuPaZkBJreT8/X25UOEx6z
         NlRksNJf2rTy5CH2fF47fUjXLJ0jqTr+J+p6gi2XP9bUCGZoJBIRCUu6TYdTDvRJvKpp
         zgP37GoaAAt+xo8/uXcUC9jvRqmMzhk+OAuP8yAZAaN208YVRPryqIs5TNGTHKMsFqO+
         ee2hpSHsF4K8ZqXr4bkO1R+QOO0xmBKcf/yGEgwHXCynhL+p3fTzFb8nI0/nB8qJeOzx
         Aviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248094; x=1788852894;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGlFBkKXrHiR0rsOfALM3d2LLsNECGveEfEeOj5vR2Q=;
        b=VfBEXkw1G/qdR4rcDe92s/1ToedO9QSeYhuN08uOGu7sI7JjPKhLfvgYqoiqLqJD73
         jvebjJd3CG8DpjOyapBe7XTYDKuGQT1EmW0zhwoH7q2hFsajoeIHWrhVkXfTqxyO2XAx
         p6sqZ0OoL/KbznSXDdxvZDyqrRUBtiLmvH17qTNRaZf63grRhO8EGCvNE3XJU7jFeglr
         C0Uc0FHXSGbJ8jRcTqBaFtRSV4fCcCcAW8srdhKPns7I5hN4WNI0qgyoepSY4vYWgLE8
         RQ6ZrkALasMTyYAoyC4ye7pIIKW98YVS2a/ESKHH6TWU4ItCbN2i/czJNl+nFrcuamhp
         orgg==
X-Gm-Message-State: AFuF++kGMQ4eqPpM+3R4BjDdJY/6Ngfh37hCAOWs97aKtqh+/DDPJNN9
	aJqy37L3Cy78zOB7/naCGnPmmPLfl/tDHXgY6ua+L3IZB//fIYSgDmB6soADRf59i3p5JzDBJjn
	ySy0zfL6ULNX+8qJ+qEICsYC+7RTNOT5jQRtHp6B6UJ7vBvdrjWYGs0jO+te8Ti4rgw==
X-Gm-Gg: AYBFou0CNM1FGSIzzDv3ZXi7fUL6MeOEqMa9MFKqIkRgQKF8mg4+oEg1iYmYFhB0vfI
	SY0tECnHxtnxaF7cVI7UuvzjOscfVK+GjjsbnQAp+MJGFxGQMfiSzy9x+MR2RoU/6T3lWwvIR5t
	3dpl6yCr+lAr0d3MQ0mFbpJ50ERCaYV076/Wd8tfkUq+xOuKBRF7fmMqYtVyczeKM/yfujeDZhB
	c0q+CmKEf8kcuJt5cBrrTXpvGKEDXoellSZDTNztWuG8rHgMlOyGU0w8HTsw6XgyY0Hc5VSyDsW
	T/vyQ2UOCVN3KI0lTCC/Xo0ZYYutULGOx70LRSEnRLRx460DEnTziL4BgVvtrgh25KnX7lryIYK
	bd0mPx6DHNnjKFUoo+BqNUqDvue7nrkuRmy6vDNVjCYC6Ln7VrsNBTDyS2WrrZ8Yy
X-Received: by 2002:a05:6214:450b:b0:90e:921a:f62e with SMTP id 6a1803df08f44-90e921af821mr111500936d6.15.1788248094436;
        Tue, 01 Sep 2026 00:34:54 -0700 (PDT)
X-Received: by 2002:a05:6214:450b:b0:90e:921a:f62e with SMTP id 6a1803df08f44-90e921af821mr111500396d6.15.1788248094028;
        Tue, 01 Sep 2026 00:34:54 -0700 (PDT)
Received: from [10.111.163.121] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce44f5695sm102949146d6.26.2026.09.01.00.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:34:53 -0700 (PDT)
Message-ID: <324ee2ef-f95d-4a78-945d-12d6b2f191be@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:34:47 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 0/4] media: i2c: Add OmniVision OG0VA1B camera
 sensor driver
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
References: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LNeAq74WzcdJZoa1jwFwbWfoN-GwDBEO
X-Proofpoint-ORIG-GUID: LNeAq74WzcdJZoa1jwFwbWfoN-GwDBEO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX2axOg6lSYUZe
 FSTCuiGKjqa1jVumjoHUi7Vr7c718bDHm9m4zYN/9vT8Y7SED9wHZr2se1r7J4+VgWGYwPaLwRz
 JkvsrC4lM+xwoajqVEuGVfTWHsLAYAE=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96801e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fdB5lo3k29YZU0rLWzsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfXzYzA4y+phELj
 PEoXV7/+P6nzvbfbJfkjQg22q5QnYYV+hIJy9qtJMH+0ZfmX1Pp0EpEFjNIjnSQ1dh3BB6Udpva
 a1puvWxQu25ryqyrj9BYiDxuJmRnEOinFfzLatwygoH4Du1YabqooskR14VWnCkPFfDwrk1SoS1
 TV+IJ3jEiVsQ4PLq66HICqsvaYUh6qhjguCafRHHs//3Qlrk0ipNhC3KujZjAntQrDRQ8fzImb5
 7djemyw4MiLxKOCV7pioJbkonwRzQLbca0bbhJFYi6JgEHDiN3oMv9OgRYDjPkab4Mx/gN4lbUr
 WX7jrY92ide0/JX33k7u5yguibnF++THsdzZ1A/hc4hKJrKNjDrcmT4KIZkWXpYnb5l3pfvRLXS
 vyruJomaAOOSnNBVzOsrfRs7AlNim9io2/wEIen2rNA3ewPFQjCg0wwyISGiduN79inSd7Z9/36
 lhyCmoYC1HMZSC1PRsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010066



On 9/1/2026 3:31 PM, Wenmeng Liu wrote:
> Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
> 1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y10)
> frames at up to 640x480 resolution over a single-lane MIPI CSI-2
> interface and is controlled via an I2C-compatible SCCB bus.
> 
> This driver has been verified(include tpg) on the Purwa EVK.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
> Changes in v5:
> - Use div_u64() for pixel rate calculation to avoid 64-bit division
> helpers on 32-bit architectures. -- sashiko-bot, kernel test robot
> - Link to v4: https://lore.kernel.org/r/20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com
> 
> Changes in v4:
> - Rename the OG0VA1B and OG0VE1B test pattern menu entries to make them
> more accurate. -- Vladimir
> - Link to v3: https://lore.kernel.org/r/20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com
> 
> Changes in v3:
> - Generalise the binding title and description for both sensors. -- Vladimir
> - Keep the cached pre_isp read so the OG0VE1B test pattern still works,
> select it via a per-sensor callback. -- Bryan, Vladimir
> - Rename the "sensor" field to "data", drop bpp (derive from code) and
> add og0ve1b_pixel_rate(). -- Vladimir
> - Sort defines, rename the shared CHIP_ID reg to OG0V_ and order
> og0va1b_data first. -- Vladimir
> - Expose all four OG0VA1B test patterns instead of one.
> - Link to v2: https://lore.kernel.org/r/20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com
> 
> Changes in v2:
> - Integrate OG0VA1B into the existing og0ve1b driver and binding
> instead. -- Vladimir
> - Link to v1: https://lore.kernel.org/r/20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com
> 
> ---
> Wenmeng Liu (4):
>        dt-bindings: media: i2c: og0ve1b: Add OmniVision OG0VA1B camera sensor
>        media: i2c: og0ve1b: Use monochrome-appropriate test pattern name
>        media: i2c: og0ve1b: Introduce per-sensor data structure
>        media: i2c: og0ve1b: Add support for OmniVision OG0VA1B
> 
>   .../bindings/media/i2c/ovti,og0ve1b.yaml           |  15 +-
>   drivers/media/i2c/og0ve1b.c                        | 378 ++++++++++++++++++---
>   2 files changed, 346 insertions(+), 47 deletions(-)
> ---
> base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
> change-id: 20260618-og0va1b-55bbf3cabb0e
> 
> Best regards,

Patch 2 is missing Vladimir's Reviewed-by tag. I'll update it in v6 for 
tag collection.
