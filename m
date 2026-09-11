Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C922DE6E6
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136671; cv=none; b=To978Y1GYdO5+ZCM/uvtbZ4Ymgg9PA4GfmhEJoTuL58nIzuMcCwpOVdByrw9j6/Ni2r2xV1LjFy2W/fYs6LuMETuOdc5XKKtqWhOp3gftLEawuJH2LQXk/WOFqvZ/NvNK2649mNnyGtm1mAIfHNP304EewqvrTapXQESanBkEi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136671; c=relaxed/simple;
	bh=3msMrQhv6m1bdBA5H8ZWW2oE2chS9aPy3EzkwaGuRX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OQon9Xzihca/XRBLJyhooDEl6mjNnWWDbXstlXrx0Ml4MLg5OMGMybQGs5BC9fEO8eDIKBhLfCRnO97brt8M0UuIytvSwAXkvEJC2B1WU+02XSQaQ6t6iDEIEYjY65QPQpjHc1laekgQsHwlTZwwaJ+hoqhayHMhbJs7y7qtipI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nWzNW695; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8eskd6G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWzNW695";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8eskd6G"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiXNl815374
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 14:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7EzS41kG7kgi4E2ZuNT8R4Gi5YfYGMlXLxSCKkeP4Ds=; b=nWzNW695KRi71ZHB
	f38GmdrHvR8vUMx41vtBoEdm1FFBExp74/IEt9kCMDyEo3fznwQeiZ8v2+xOE5DS
	9H8pSbPMCQbpYTLkjAkS1vFK7Ku1af549bnRmcTT4Zm2tWfxbI0GYwwJocRPm681
	ntI9kUWEMo50QF0pDbGCn6x9oN/uaOeI79qEDBQWJ8G4t7vMdywkeGpHz2lFc+V/
	wZDzFGqvmM5bZEBs9U0Vi2aE3fFBqRFYCRc234D60dTa3TEQdV+AAFNz91EIE1MI
	v4nMXfq1pFUuaRqyqgKNrziEwJLTGRe7DeOSf1s8WRNwlpNxoqxEAvn5ywkGlZHl
	6FEUgw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd3a5qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 14:24:27 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c665139c92so46310e0c.1
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136667; x=1789741467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EzS41kG7kgi4E2ZuNT8R4Gi5YfYGMlXLxSCKkeP4Ds=;
        b=W8eskd6GRMOb4K6v6URtLQf+teCDs1ZmUxYQwwZmxSRdHTvO8JLyVC2jLSO3Rx5hx5
         unkkndTfWT2k24XwHJwksbIKOU0TAk0XqgVAdrVC35rUMkT7H599ua0uvGsJD76q/opZ
         OgiZ/Tt6O1Rg22WcFWOOzhrCZT4WE2SDi3DW9CaENl+XQPtxxVWdc9vjy9cxzEO9iIR7
         MuEP3+g1kC74dsBmZzgz0OuOYa+IsrgMYcAb21oE8ZQmWoR5BpkHdZOiI2yD7OxvL9oC
         L6bvVHZUNDCzGfx1Nh44XWoQuDqKLp64RrPmW1lWitDfahyPPrpcFj78b0362f+lIlaT
         lu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136667; x=1789741467;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EzS41kG7kgi4E2ZuNT8R4Gi5YfYGMlXLxSCKkeP4Ds=;
        b=dt0lVXaKka7v18+m5HZxPyzk9iPRQsxx9IqLB4vsnnj6Cawimkb3cykB9SAv8THevP
         Xm5SdIztWR+hmrK9DbkUsm+oJPrlsP6Ev5R8xXM/Ne8IxkfXv3AJdQg9jqJXTO9NAyXe
         Ey6pDm1nJTnl74E9aiaPTWZAHle7sUwdyimjP5V9RO6BLWZBEl4BrMilBN68iDfA4Zap
         XNUtwqlSBW0VPZbuBZadmTd7it3iYSP8SOolY9dRZq5xM8Dzm6+OZatx3cbb9Y/wyf6R
         hkOLBJ/4DD08RLfTnnQA0NSZRPCNDlAZkSgWJvnBDQ/fELD8ipkUsaEaaSYSrE40aqsh
         PfJw==
X-Forwarded-Encrypted: i=1; AKwUvBxB6pbTM3JYFOwT/gSDjBIuEhRfbc4oAf5LtYvFpbAb0YDqRdQggdIhFACKrqhlI3UTmykiYxsPTatyvA==@vger.kernel.org
X-Gm-Message-State: AFuF++ktOzM5A0etfv9Y93dAQnABsr6Z0bFrTvDb0QC2OgxM+IBGUxC4
	4yVwz6bUIEeW7I/GSR5OLpBFL6kopEoI4agQ8gNBLgDC3KGYzEoWsz6gD7FKBS2o7ygeiCN5Iw3
	cJZCzxmjLVwPIYOrPzRbetCdUyoC4gLRLs6waZbTiEBb6NBXjyZKqIx5ALN9HBoTd7g==
X-Gm-Gg: AYBFou0TXhDBNIOMNKNIDqDEX+ZxRildmlPdVAUZw3lzVvg2MJnSBxuDIhqTF/ZSY6g
	+kAwrvHXq2t8pga1y+zL/aiHmjFENGn3PR1T426Gj/zniO2fHo3//A0bnaXt571mv0Md1d3u/NS
	AFB3HvQuCB8fUJajNj8SOSaUqYplofWAROOGFVFFX9D4krgXEl9khp9E8VuciKaPWTXpR077vYO
	tCmo8PJCWY3rBUUxKT/eQW8YlJTAel32Ho3ArwD4TnEuyTA+EeIqsK8GKa+e56koGGV3PSsxvOP
	5zP4sRHy0qY27ZfPACgGO39tsF3DiKRssacPQzYcze9ii1Nj3DCsQFOc7gzYuBvX/RyBviJ6pig
	ey+3dIdJb5bkLhiuGbWgRUQ==
X-Received: by 2002:a05:6102:2913:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-792a6b46388mr1542140137.1.1789136666559;
        Fri, 11 Sep 2026 07:24:26 -0700 (PDT)
X-Received: by 2002:a05:6102:2913:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-792a6b46388mr1542092137.1.1789136666147;
        Fri, 11 Sep 2026 07:24:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966067117sm84047166b.33.2026.09.11.07.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:24:24 -0700 (PDT)
Message-ID: <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 16:24:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: iris: Skip SCM call for non-SCM PAS backend
To: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
 <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa40f1b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=ixnSeaJBEYg3FVGQqKgA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: 7GxuCIDtyXe6H2t7fKcX6tzkYFua305B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfX2Fc2fefSOIH1
 XvsgCqtNGbuu45+1wt17aAjP/ZKW1wh+vn942TIIZQC4qLCqPbZpu3kM6iNkpc+eDNp5FZP0HWH
 c8E3ezvz+jbPnQGG4qYu2qBXpAxF4Fs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfXyQrxkgbQhKKh
 Xp0Eqg7bFZ6S+Lg1TVEeaZE6k0Z8ICaIw6OR9YAsoVNWI0bkdNP8HLXIYTooHsWHS/XlWD1FEzC
 Q+oVy0tEL4XL+G0NngjCDzHOHB76KHCUjXi74gFRB9N+Dv6ziRGbKSNeZuuGfn2FWBqNQ08LG3f
 39YZMcX4JycIDVoZlr5ptmrf+g5WBatoSSTlVfuYqFKnjeBua7mGsMdVuppVgO/LYVqM+6S3dje
 gDJu1HjhcHL2+UookpCLCwN3IKTLgNlxWWAeRPWPifIgUPrUifVIkZgppG2dXDiOXH4EM1fC2jt
 I9UfuDq4mu9S370umH/b/6vsmCCtKyd+oNft0CdauYBYebgwjf93PcIKu0N0SRbdZdGDZZc3mb9
 g81L3dg+YQwIwUFxAlPB8719Q+KDrPGeyr6Sj1T4d/QFqDYZATyQKbmDAkp3KrHC1nOfYB1X9GT
 vkfw7y17TWj6PFwDyDA==
X-Proofpoint-ORIG-GUID: 7GxuCIDtyXe6H2t7fKcX6tzkYFua305B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110201

On 9/11/26 2:38 PM, Sumit Garg wrote:
> From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> 
> qcom_scm_mem_protect_video_var() is only serviced by the SCM backend;
> with OP-TEE the TEE owns secure memory protection. Use
> qcom_pas_get_backend() to issue the SCM call only for the SCM backend.
> 
> Assisted-by: Copilot:claude-opus-4.8
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

[...]

> +	/*
> +	 * qcom_scm_mem_protect_video_var() only applies to the SCM backend;
> +	 * other backends (e.g. OP-TEE) own secure memory protection and do
> +	 * not service this call.

Can you not just stub it out in TF-A then?

Konrad
