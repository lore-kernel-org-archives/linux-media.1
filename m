Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4996247A870
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101701; cv=none; b=j7PurQJr/2qo61AnoNlVYp72hqDRCmYOPpB5EC8TVV27V/MTC71anz8emXeCoiTjt5Ul4DoKMDxBfa0wtFtjVerbsdqUdfmW5s7P4Q1WFl7SaIJfWkaa4MHFgNmu96vBOAyNszIIk6gjsJ3mcnI5xCgr5ESUfW3PUZDhaPxRD0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101701; c=relaxed/simple;
	bh=nHouAfMbcTuW3k5oZdMP4hN0VK3YJ5ZLtN/ur7LPOao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3wQnTIckApN0+6ySZ6Qpjl8a11QfijbeBOTO0Aw1bpeTqZLD7Rh+PLW1+yFZBFdicGm02oGoc+xR5VmKEwHQjx69i4yIxkjQMLABsQN7WahYuOUbPmj3z7TiHU2BeVT8+CaV5c5yfXpYs48vnfyLLVuiY7CPrkTcaCvHVIqbyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCSE6rA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyT+ypkN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCSE6rA5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyT+ypkN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI77DK1348925
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F+mZemlg7hGgvRVaZjdVd9HS1E7W5qsywvUfhDPy7DM=; b=MCSE6rA5pdBLqI3t
	4GiByLWhJTg933+RqV6ERhtIm4BC9eKNNnhuw4i20qC5lApfWW2k59hL2bANr7XW
	zmX1iVE4LMEsfh4Gb9hMV5JWIZfDGfNr05baLhL8GCqxYbYL9k4jy2MEbg78zuFk
	klLgYlpmgz8hNbdFelp4V9+C4XfYbkgsMCzcOwW7mPAV7x3WOelOwYvVGbw8cV21
	3SdV0i5Br4UyLik1zy/O2sEevGrf0rX6C6bIPij++ok+/DnEhlUji4zEYiR4DABz
	cNHFn1e4ySc0e3pmLl1SxEpEPw7Xb1E+vigjb/pJi7rh6a/O+nywvOkFKq6Zpzd9
	MS/syg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux86087h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:28:19 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-144d4ba280aso32109c88.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 11:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790101698; x=1790706498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+mZemlg7hGgvRVaZjdVd9HS1E7W5qsywvUfhDPy7DM=;
        b=GyT+ypkNpYC12vM8RBGhfloC8ngIG+IcJEWYgFuu0DLOABPNQadzlYRsbc8RfavH02
         3UAfgqGAH1YjgpFO8i1xRiznr37mouB/6o8ssFOInUPi0JARKk/H9L6Te0JXux49BrT8
         7eYR8ddjyoIBkeEow/FA1A5V45r4TDX9KtU/R4SsK3jX32KhdiL1es7+fPui+YJIJ80N
         R4S1vqJoEZq2XQWM/wJ1i32oSlyvziwXDl0lUTR1CVY815JkkMURZf7uE115zrZcxO1Q
         TADDgRVZZT3zgB/pKPHKFwkhM2eP01cg8DStnAF+D5k11fhlG2UNI2VOWsiHKD/W9vbu
         kCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101698; x=1790706498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+mZemlg7hGgvRVaZjdVd9HS1E7W5qsywvUfhDPy7DM=;
        b=NkQQtNCYxI/LddvCXZ++A79O7AcXhQwl8couVCAqt/lGmltVZYsa0iRTK8gMJqpN02
         163uvtrRPy3PhvELaGhw+sW7XuwSYBYaRDATLuVrAwSf4ZR8FUnWJxOZ95Etbk4oyjyy
         44jGHt+24I4MaLRCd5t55vwQ18QzxLj61Tf8iSaok4EpLrHdK3szzsFOkC5XS41d5GMR
         WOyiKijI3JaveuKLYtkfV7NTWi7SAweDVnVRr0s4C9jben9RZgtYv18Kxf0wcNdRyoZI
         F0gL+Kb5YqrN7IBOge6Gc78MtHe1GI5ti1x8c2aJN8amCoh5+14gJGUSniNqnPJFpWNO
         hk1g==
X-Forwarded-Encrypted: i=1; AKwUvBzCaQqRKiHg5b6W0L9zw71MUimHROr0nIjrptgPyOaGw0nJJJ4tJqUYB2POeNz3ynM0Mt/Oe+9Evhk0UQ==@vger.kernel.org
X-Gm-Message-State: AFuF++naOY/LaYrdeCa/C/I4U9URmO4OqZ/hZZSQqh9Wb+03JIDkIkiC
	IlY7nPeI6tDQuqD3Gpe/++k4LKh0H1uhcTjEg9wZfrRFK2bz8gN0AvHP0m+E1UFpZ+vLg0OF/sM
	YMmatjk3l0AvG3+L9PGRgwAXrCAdqSG+H8+8/7bhuPQieEkvShDNAnEgHBugcaR/PHg==
X-Gm-Gg: AYBFou0g4jSO6dvmCCwuGKvKWBrbGd3tMlcCHemHy687/9Wyr+b7hkmTDWYYf9d0fY7
	hWcH5j+NCqOE6C6Tf+OkdZcH4PLR42NEQ7moYc5hwLUdfkYj2g9Qx942/5XheGZoOLTHVHyFUfl
	auBxVcD97PyyK0wH72iuq6UD3XPw/5tYDWpOLwNMgXlu8e7ixGJ5IpI2NxcWR4va//oO6dp9C5t
	w3YgU3iCVjsYb9dbY/Nz7lg/t42nNAdoJPY7pbqG0uKXiiQKpm3HW1U2tUick3BjdA4dmrbnJyD
	J7pWSj9jeJg7T+uQhMGjvhZmN3qwzVG5DwRl0hA/43+kFaBES1u1q3iC0qknPBRcVEg2I9OwlNM
	PbmordM4Yqdnw7d5ioOaNK4yBonKOCSIVGEJy5jlz6H60
X-Received: by 2002:a05:7022:b88d:b0:143:37b8:5007 with SMTP id a92af1059eb24-144f8d4c260mr319908c88.2.1790101697787;
        Tue, 22 Sep 2026 11:28:17 -0700 (PDT)
X-Received: by 2002:a05:7022:b88d:b0:143:37b8:5007 with SMTP id a92af1059eb24-144f8d4c260mr319878c88.2.1790101697163;
        Tue, 22 Sep 2026 11:28:17 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f949e51asm215796c88.1.2026.09.22.11.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:28:16 -0700 (PDT)
Message-ID: <b62758d9-1d7e-4a48-89b9-eec6f6e951da@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:58:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] media: iris: Add support for Eliza
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
 <20260921-add_iris_for_eliza-v2-2-5fe7be8c0230@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-2-5fe7be8c0230@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gbAgis28eoyvReRjSt8WRl2snVkyP_Jg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3MCBTYWx0ZWRfX5K6U8pKk0esa
 JVkzhEPCRDd9Rit39y7NCihDZdP25e85zlm3obew5+J20zKQKu4bJyyX/qS8TkhYXleQUZdlJIc
 s7jXHLd/THNZ1wjQyeUgmCHKl8WoOz4=
X-Proofpoint-ORIG-GUID: gbAgis28eoyvReRjSt8WRl2snVkyP_Jg
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab2c8c3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UnPPif1LvG_pJMLD7TsA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3MCBTYWx0ZWRfX5XxzKZ0vJXiw
 5XPu0kN7WR45HfDyqDWQh3JMYMP2N0BT2jEE0o4zeFAOty3ovJDaWPJx6LyH7GI/FsPO0UBkpgH
 f7+TJyBDffNskOorpu0eOiaJtP0EKDb1I44IU1bIYZr95RGgAdYhlVAiwE4XiXsM3Jn3Izu69rt
 RCMbtmkec6E/oNG7og28dyzJFjxFQlYHwLW+AcUaS7nZ7MTaQVWEQGVZPtYzHFddupFPM3QPzYL
 f9zg4wYlJ3EkH9U6WXn8NBnYdn2pmCUjkrPMFLkb7QAJLkIDMzFrAptAqUwCwWnPgnXCgfbXLeR
 MZdD9yBCUKGp/NoRKFWO8H7gQwA+cC60w4lRL9uolz4BZD27ODgE2unlBdXBZrhqxKQH3WQOJje
 tYVMZUQHGjoioqmtLYQFwIGnVhb80A2h9n8Sr8k8NFEsg16kNYlLh4pyY/2zQ3kTSb8C9v1r2EJ
 pW8HW8awEFqZNUHqFjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220270


On 9/21/2026 3:21 PM, Wangao Wang wrote:
> Add support for the Eliza Iris video codec. Eliza uses the VPU3.3 hardware
> with a dedicated vpu33_p2_s7 firmware variant and SM8650-compatible
> clock/reset tables. Key differences from SM8550:
> 
> - firmware_desc_gen2: vpu33_p2_s7 (SM8550 uses vpu30_p4)
> - vpu_ops: iris_vpu33_ops
> - clk_rst_tbl: sm8650_clk_reset_table
> - controller_rst_tbl: sm8650_controller_reset_table
> - inst_caps: platform_inst_cap_qcs8300 (4K capable, 2 VPP pipes)
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c | 45 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>   3 files changed, 50 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

