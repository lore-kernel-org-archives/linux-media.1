Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD4437648F
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 20:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783713709; cv=none; b=CZP67NZdX8nqZjdEKji9ZhqJFL1GKTnK6zxey8TKR+mtqTH1urohSg4XzHSXaiOmURpZTBh4UOtZ3U0AVrpUlKPmf/7SCWdcYsRRfMGX89RWe6u77gqs8sVS9hujyQjdgl9kpzUjW65beTPT2risVGhBcSL0o6se5rODp3B72r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783713709; c=relaxed/simple;
	bh=Wpj7biINABXruyl7S8E64d6S+aIPAP+SvchHl1VAxwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q3N+lAqaSv/b70BNhHjIbaov+vP8Itb0xaGg+5cIOoQ7LsCtcxIqCZkmnB1VLjt9ezbIqYnaDj0L1dn1hkK9d1j1a3R/dHsLU/RJ+NgC+EbxKA27Gg8Gr88DzOOpqrUH3CPWmjbtumN5NE1Z3F5FLB/NRtKlaf4dKbuoNhReGrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekx/Ir9K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtJLyEIg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekx/Ir9K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtJLyEIg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3W031501981
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 20:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TauvJkutb2hiYeXYH72NLc7gaplt5eyXb6hMmwHelw=; b=ekx/Ir9KisQqT+sO
	S+dKYkRjkjB89OmCaMF97bUAQTE4ze415+U13BgRp71chl9J8OEjUDfECg6839Yc
	nrHU8OXQkaA3HRIHSAsV8zu4b9FSDGXSVoYE3+JqrgU63WAXQo7Y+LXc0Qn2dbNZ
	212MK8O2wSik+3XE3fyIz8kqOILZi9bFNmrGti4fH90kNAuOWbthXc1f5nzxXi3Z
	i3SUAjXVjvtmqxsJsvxaQjH7BE46ROkkYC942Ci3GUBi7ZxKgprf/NNh+C4N9Moi
	KcwsOwgJ4eWEKmHL0/2w+8WpmOwVO7wPVFc8npsdtlae8mdoAPVb52lzhb7gw2wn
	ZmWaaw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb3xvrt02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 20:01:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca3673560so20856875ad.1
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 13:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783713702; x=1784318502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6TauvJkutb2hiYeXYH72NLc7gaplt5eyXb6hMmwHelw=;
        b=RtJLyEIgqnNad7be2CYn6VXWOjk31k/W+zXl/1132uS53TFuElau2+U6ngDlo4KaZ8
         uBN4fCmesPQuIVvtrS+WM8jO2dwESugErk01lemvx/YGw6h8/5NMFMlCMArVCnU7vl/X
         SNtyIVMKi0aILFHbu/HJxHOzAKQhHpPf/4ae75o+ftIPvT0ivva9q3D3O4N8kWTczWoP
         SPfLBDMyKp82zDYtRrcBgFuAWfLcI5ZwIVXTaIBSlGcghnBL5UJzynavxmKwq2sn1ZPQ
         XBX+ksYWuEgB62UteUjZNDrMGuVFstdETycwYrN8AHRdtjzHyhDxjHizobuqcVNw8tJ/
         Cpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783713702; x=1784318502;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TauvJkutb2hiYeXYH72NLc7gaplt5eyXb6hMmwHelw=;
        b=kVoEbbYlHwJBAGZ2XbaSnuwyE4MkWZaPzES5iB38jL0XgtZMZDosbVb4EU2gBADYNL
         t8E4r5OKViEVgAzS8Nr3a4QW0Lcljh7Ai+L64HywIK1W9dloNJfUMNn2zVkpHwjLUkG/
         Cg2ktFYbD7L/WDJ336GSC6IESZdDoHESV8FAqkvryDm+by4YPFd6CTvXSzrD/5LAysFj
         KYC01Hv2LxHPlKE2iyCoPjJCkeoMj+flSEuKGCNdfdPqWl1r4Ko0AFqd9O9RGk0vmGme
         OylaThvPvwlsnRVr+HUuW6jkgesI5Pbkq7sBc9ssbc7W3BmbXS5hOoj44hvL/h8D18hD
         iNAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFBF9Zk8k7hiQ6nui3cXOlftE94JPmhKHiGBw6PeROV+RnfLD5TL3hHLtSVpu1FM299rOAXz1trMwLgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlIN+p0MHRL7D0Mggn3N02IQ07yHjaE6KR7ef4eG79k5b88Fw0
	IrGjjdbo3jtrCdQV2iuBTOYqms8vJY38aRHpfBJlcZB62rWFDxP4t+Ru2VmzsZAaLoxy6BiZGQK
	EzqBQPWN18K55xXr7GyGPqqkqqiLDWOz+U/SMYyoWWbDET5Hte2SsEwwU6UBMLfzPgw==
X-Gm-Gg: AfdE7cmxrKkKGB2qSUVDuUPcSNUsMMdco3nKAT/fy05dz/bqM610D56v1XloBbMJA4K
	LMTgBw7gLg9RuYvOcoouFS0ugqQLcvbvcb7yVnmjQDm0rWPMyXH+oe6vVbpC/fD12lSPOXHgsWj
	JAisCi7IzlpZMwTIHxzl8c55PCqi8pjLsCM1k2SKSjceo78H6rCtonEsKYjipP+PBV169sAZlPV
	TyWOUq6LKRptU6z9h/kY9DFQndaPKLDWYfLXKUh3FIPCKOHDF3hW42PqmF37/BYLrd735XA0fjZ
	pps1jhRapOCtrPawq9lF2R0OhcXp5bBTY1RYVqqkEQfnCmJ+0TR9vTMvbj+hlxdt9rAxBfdanJn
	TN0cxobvdxRxDvjR/ApZQivMhrA8DnZy2A5vRPm3PY2q5n4KE4+YuPICuvCiMULaGbFfa
X-Received: by 2002:a05:6a20:258e:b0:3c0:42c0:702e with SMTP id adf61e73a8af0-3c110ba2a31mr439271637.52.1783713702133;
        Fri, 10 Jul 2026 13:01:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:258e:b0:3c0:42c0:702e with SMTP id adf61e73a8af0-3c110ba2a31mr439205637.52.1783713701649;
        Fri, 10 Jul 2026 13:01:41 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm50819545c88.7.2026.07.10.13.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 13:01:40 -0700 (PDT)
Message-ID: <3f399cac-d82d-4d52-8a52-45cd9a0e31d8@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 13:01:37 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v9 00/14] firmware: qcom: Add OP-TEE PAS service
 support
To: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
        Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <178362521364.2422497.1305957434056184382.b4-ty@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <178362521364.2422497.1305957434056184382.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wz7TEe6xXa9lNWzCPD_T9BIbKnBZ7v0H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIwMCBTYWx0ZWRfX0DoGjvHneSCm
 kd6XpfvKAFl5J/lSzZHtYODfzDytwPNgnY0UrrS1S7so88Q2RoOPQqpp+Aj2t5dz3mHGnXTbNwW
 yYlM09X4yBRx7h8F64+JhZSUUs1rtTgBewUBFv6NTGCb25T3ogJkAwAKJd+nQQQwDh0YWsM7qfW
 bZJXoqUeOSx+DP5ECiiH53oEAtMfS/KsIsdzR3bqRhbJOcZIv5iurVnPaF7P7kWaXJjm8uB4aB+
 n82DrlEQZXvsD1wZd4Y9wZDhTdDDGhsHJ1K0DceiCr9Z1rgovJ3PGyBCd0lAR/4CuRr/vO3Dgf5
 aq7v99N5YqslhaHVNB0QuOnjQ0ixeMVS8nE4FqJIGT8EHvFgXntSa1EiVzVKKOEWzzaU0dUTvRa
 jtcJcZgkzutTxpd8cV8nklheUPrBuMtDHBldD/XWbGlEh2s8MA4WAmnOeEGlV9DT6MMIfSTXmpn
 jHYt1zzLOLfVG1AOqTg==
X-Proofpoint-GUID: wz7TEe6xXa9lNWzCPD_T9BIbKnBZ7v0H
X-Authority-Analysis: v=2.4 cv=HInz0Itv c=1 sm=1 tr=0 ts=6a514fab cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G7o58nB-JDmhE5M--eMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIwMCBTYWx0ZWRfX+kXLHdXj/pvG
 c2/hm3H9JGJKw1bvEI+Wi2ocBTqVkQ+jLQ2ygmv5tyVih+brU44S7X+UQbCtphPlatu6r5h/0i+
 rHGQeoxuTbhJ8JCF+TCd7joiHib4t2c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100200

On 7/9/2026 12:32 PM, Bjorn Andersson wrote:
> 
> On Thu, 02 Jul 2026 17:28:16 +0530, Sumit Garg wrote:
>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>
>> Qcom platforms has the legacy of using non-standard SCM calls
>> splintered over the various kernel drivers. These SCM calls aren't
>> compliant with the standard SMC calling conventions which is a
>> prerequisite to enable migration to the FF-A specifications from Arm.
>>
>> [...]
> 
> Applied, thanks!
> 
> [01/14] firmware: qcom: Add a generic PAS service
>         commit: 08314e7c2c38b9ae6a5e01c58ed10a950859404d
> [02/14] firmware: qcom_scm: Migrate to generic PAS service
>         commit: 5c1a2975d23c51c01aca51945d0f10a4ee4c9020
> [03/14] firmware: qcom: Add a PAS TEE service
>         commit: b6f7978da0c4d26fe465aa6634f5a0b48f900de0
> [14/14] MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
>         commit: 6701259025d49139131a0eb2257659a066dcca22
> 
> This is available as an immutable branch, for other subsystems to pull at:
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260702115835.167602-2-sumit.garg@kernel.org

I've merged this branch into ath/ath-next so it is available for ongoing
ath12k support.

/jeff
