Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1124A541E60
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 13:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085101; cv=none; b=QV/wU0l1C7DPXgXUr/OreFPILec8QhdIH5ojMDWFH+s/xTrFKJEcTznt2k9CBLicKep6tnqqpnRiaoKAD+fsFqtR6mzcWcMHPqMrdRCibq2HRp/rfsAVfIZO+vj2p9YIJk6sccZKKowhsx3Dr4ecUNlSW0bFmhjFNrEbHonxPPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085101; c=relaxed/simple;
	bh=exbDvCW6zscOSTFrNqipgAyryDy+MLtmidYj8IbQmq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLyoAQo8P4sYf3hAb2zSkCVT0gicgXF/SxcMynF6GGWZT1IvEcim62raPCYyUEhMIzb5fscmfzFZZsrpTCNKH9+k/QRXK2C7rzyFuzIli/64ktjLh5VFAZ9rbIPhdTqD2DYyjlAmta92ptICWUfnpgtBi41XxyWpFny5ZZHtzyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c3vxQMTh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVlizu1Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c3vxQMTh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hVlizu1Y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPZQm2869443
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 13:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSrlbnrND0MefPgcyWNpCB43rB6rNnrLVEDeeWiIRsg=; b=c3vxQMTh0N8lp2XV
	0w8PJs6Z/IhJxCovX4k7jwcXzyLnP/p+1sG7S4scSBvVPvvVxbUfL7HsZ+R8jTji
	3LaxYzkm89Fu5znDyL6oAPLUQsKPInaDS9acnHmsyt+HBpJIdHF6+s7f30/BTG42
	ZWqJh4G/5IJgEgxCxNdEHGpAJSx2pTRGTVLxLKVJz7CplvXB7BmgvQsljJbNZEos
	n5PacQxpzF3m9diQjrcluDp/3WxcBDCDSBcnwVClBNgu6eupIR8oQUcoP6yKdR0/
	W57ucSDVM65bNG0AZXTJJgO+jEKJJ4k3GqtTcfGTsrg6eFUDMZBZ1ls04cHv9ULh
	AbRY5Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj112c1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 13:51:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so7474072a91.2
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 06:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790085099; x=1790689899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSrlbnrND0MefPgcyWNpCB43rB6rNnrLVEDeeWiIRsg=;
        b=hVlizu1YvG9Zub1ax9ZECwTVSpo/q/s49f0JxMAUqje0rjKop+6LeAyTj1GU7zu+2K
         c1mz8r0Bs8CK8ebFeXDT1EHLHDqNtvLfcDus3muu012ViTRSAtdrECHpsos4XCKi2WdJ
         wNTt4+6QbNeLX0oUN9VN+Vd46lz7+uUYum5ElNr/Yxohb1hfadH/aQkeeQsdoj+vUIYr
         Tb88eP6pCVAc8cpZEqlvVnmA5LxSmf6g4IYaSEee26aiPXb6TXES6B4b8mdleKFZj1FM
         dI5WJsOLeGVlItg188caTwvGtqWsxGIyp82l92FPpBlRBeDsNFQaEzLNDUFBew2tQTPQ
         LlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085099; x=1790689899;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSrlbnrND0MefPgcyWNpCB43rB6rNnrLVEDeeWiIRsg=;
        b=jWdpLNk5HY+ah01yYkyOtcYf2NxX4UZVLvHPPTvtlqH8kufR4ezLYR1d4nJBPoIU2j
         bO8u/52cLjPgJhhQklUzQuW69LdGHwG/B+uSyCuWxoailwsElL4YXi3E57BCpl60nvsC
         BBmlgFhO1jVZQg/6h0TQCOp7q0aLDlWs6LJgCayVxbeuVPBc/MQr4i5P9ERqynPwuulK
         tc3namSd4u4XIcWqDlWMqPueznxGe0oxjqXOsDLF/7gSpFLsEqK1hHZjuqxDbsrpWHyO
         VzuuTm+ts2J2kf60mXRX34Dq8Wp/zE47tUo0uQ8pTGNrymwMzapx5ETKYmmXAYkEBLZX
         5VZw==
X-Gm-Message-State: AFuF++l0Z20DbxSptD1DOB6Wj8Uz0Otq/4c4hSAAktC2k3+ev7n7wU09
	K++dj1Lw+VFZzEzUQyfjrZJ19jsrnuq1cdWJtdj6RY89L7c0ew/KC0gYLWwGJCwmxXilS4mQxB7
	tKi+9afyUD2smQ75C4dPu41vKbTHjQFZgAKsaSrn1MaPhZU+C08y064lf84eg62s1STPivXalDQ
	==
X-Gm-Gg: AYBFou1OkIx5L7RSGHktTWsRLkkVIxf3M+989fevGW81VaIwrEW91WQC+gERmlUGPoS
	u7fH3aMBkVpKK04/RQ7jhdigELBXDOQ7Uc5WUBhaM8+wupXjItu/EbYb+BjjyFVc7rkXC4jB2S4
	AxHZrki0AWqU2HsmhUKxpaK9cGII+o+NTgvrGOu0CfMjnanOOoV4fnP9FrCRnLXBdeeuILjEu4T
	BcZpQY6AErdgJhoedUvY76gSnRG0lOgbdCnj5IxsaFFdYVpkvYirgfNo7vaZDuo2LvznqVTqytR
	+a8Ndra0oSc+QNTNvco9ORk3xopH6uphLmztAgPOqBcORrAe749P6mjYmwkTBcbOprWtZ3Aqrkc
	e31VHDIs4ih8zBfLDgdzmZXu90ie3Gq4=
X-Received: by 2002:a17:90b:1f81:b0:39e:6c6a:6574 with SMTP id 98e67ed59e1d1-3a073226d6emr1443335a91.55.1790085098569;
        Tue, 22 Sep 2026 06:51:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1f81:b0:39e:6c6a:6574 with SMTP id 98e67ed59e1d1-3a073226d6emr1443260a91.55.1790085097761;
        Tue, 22 Sep 2026 06:51:37 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06741d485sm5032091a91.8.2026.09.22.06.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:51:37 -0700 (PDT)
Message-ID: <8cc02f82-43b2-4ef4-9110-ccc775de0e7f@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 19:21:32 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: add support for vbv delay
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730-iris_vbv_delay-v1-0-7b5a7953bcdf@oss.qualcomm.com>
 <20260730-iris_vbv_delay-v1-2-7b5a7953bcdf@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260730-iris_vbv_delay-v1-2-7b5a7953bcdf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3bQwmsrOs6PblkLrJ-69nqcfslzD_jEd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIwMSBTYWx0ZWRfX7tJ/qvuSrPh3
 Lo5cf/xlh8yc2QqGiBhvLcOgn/3JN8+/jyyxbLDfylLspSTYLWnJmZlYRgsA2s7XwGgwk+/k+jy
 0DgE8hfhQFPt3YLoJ2yj3lYUw9dmpYw=
X-Proofpoint-ORIG-GUID: 3bQwmsrOs6PblkLrJ-69nqcfslzD_jEd
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab287eb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=oKMEzaGHhaSyBDVYNLEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIwMSBTYWx0ZWRfX0voVOsIU0yGv
 ATnvvFhpC5UIUfEhsvRJSM2BpugDk/olGtXFmAbvd6bMQesx5/IyqN//bke1nkRlN900Be6995O
 ZtbczfokfoK+jydTL8eGhTt7upU5RMWBPT3fnAJWS0PGFqHwbvciWHlAxpJUczidWFI6OcHWpMV
 hXdad6GNowvxPhNZkD80uw6xwlpYV5XazDbMcEBCa+fv3B9GgnZuSQVcuUOU0DL5nAAQFSkVUtq
 64oH+1vidpNQGpWXmRYiogABXHK686dSiTfJ7zV5bI7Mt/ouqVb9hlZuZcQdIGattMGWM6RJ0WU
 h6N5VgDzOPuVNqKAvOADcYizYQVEYvqB8LQqrwiVLKr/kLWRCCanqrwXhIoUTjLxmDVqUKezAAM
 ca8A6gRc9FMYc4aH3c7RUpVwcPpdu/nnLes1ZL2yAvH9N1bKpUHzJsEgeR9CUJ0REfr3VvzXgiV
 k86AgMOo0TVHKIcNfzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220201


On 7/30/2026 8:25 PM, Sachin Kumar Garg wrote:
> Add the VBV_DELAY instance capability for the HFI Gen2 encoder,
> exposed to userspace via V4L2_CID_MPEG_VIDEO_VBV_DELAY and mapped to
> HFI_PROP_VBV_DELAY through a new iris_set_vbv_delay(). The property
> is only meaningful for CBR rate-control modes.
> 
> Low VBV delay values (34-100 ms) require the encoder to run
> with a single video pipe, so extend iris_set_pipe() to force
> work_route to 1 whenever the configured VBV_DELAY falls in that
> range.
> 
> Signed-off-by: Sachin Kumar Garg<sachin.garg@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 31 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 ++++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   5 files changed, 45 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

