Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3487633BBBD
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 04:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788322534; cv=none; b=BDDPYC1mS+0HSKIJ5oDdO2vVdSIRo/N39KFR3CDcmfQzeAbZQZ+RaxRZitLFKUhgJBR4bbVXUXBaY7Zu1dH8z0qzdhsYspJAE6F7eXeOpZCWZE0Em/nsraYAy0yDENgvVbunkzB6TLL7JN3r/kAA/nzELq+gts+xeAtM0a9zHP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788322534; c=relaxed/simple;
	bh=l5OuSovWW2R5VEYb4S773mhEFSG2I+gBnh2xu07zQqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPBQl+TgU0KlHxQ4uDWGNXOSuJhpVXJQ8VIKlWYlEnROf04dfiuCna0CMJfSEtu/3gB0RPTqsX5Rcz50j8RAGmA+Q2Qar+9r+T0J5+pJu9P8uSyqa8w64XmwunJGJtMwhzgvvul6If8a3RVstRI5NiP+JuU/THi6bnVP5KSp8bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THN4Bsv0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjtUDyeK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="THN4Bsv0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjtUDyeK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KTdtH3849592
	for <linux-media@vger.kernel.org>; Wed, 2 Sep 2026 04:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5OuSovWW2R5VEYb4S773mhEFSG2I+gBnh2xu07zQqo=; b=THN4Bsv0J8gsx/yH
	GbdS5EW4kw0BSNhhd/FOJ7+SoqYtMdSWnNhmvCY4x6PpokQInuO7zO7RbD+nyOMC
	ZmE9ZU0jD+QtL2lRxJWRZLnSxvalmOG3ewnQxv6zFNwXIQaEduoJxGhpu4GmChaN
	688A6RfEbbh7ty3ZVYHDXyehew9oYizTCKnj21qsjAwXtyombUvJsLOQBN4wD+Vv
	8Du1b16qPIgiNhIQOqKyFQ+ZoydLzZVO8eYbIPCTttC8PaWXVe/U6AhUJOJCVgEB
	SqJ3fx/2AxrF7c61U2uukMGSl9qkYFt6LhJofqFYFTW11/JhwV36M/g4l1bZZfTb
	Z+9+1g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge3n0t20v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 04:15:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso1149044a91.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 21:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788322531; x=1788927331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l5OuSovWW2R5VEYb4S773mhEFSG2I+gBnh2xu07zQqo=;
        b=LjtUDyeK/E9gZlLI7ZC4bSeQLYWigickkDeGjK7fSgAR+Lg/dgoPCyT4u/8up8ol4P
         hpbpQVNcSLHfGrx/UEZNEm/Dc+E/w2It24Xu4iWKYBSm8Aa6nWqqm86Hb2jYaqc+Tzbd
         kPPeoRC1qBITRXiZL9h56JAu35LdDo2fcxK1/Ia4jX2I+sMNx4REYu9Iry0DuTKZQRhx
         AlU7FslwvxurHJxK6XR2iYlsOSULxGsdLvi/I30k4/aEyyfnyQjfHRHZSgUvQQBgrApy
         p22RNs7yDz5tw1yinYGK0FDNOWrLt19ICeA4l4sUXv4rBtsOw/L1xU+UjLCRDqMUWEnC
         VNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788322531; x=1788927331;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l5OuSovWW2R5VEYb4S773mhEFSG2I+gBnh2xu07zQqo=;
        b=qHjkBrSrin5E+xiOVXLfseHL7chmKKIYmpB8nik1Gjzsg3QIn2LnaPaik6q5ItrDp+
         TlYcBlSdninqAkfWUn5zNs3X1XRe2TrHPFc7XYC7ZZXlXheuiJ6Q/hteZNS/ukIav0bs
         A8rQ0kslCwmBF5q3gMgSOwXZHwMTOg3L/i1TalXT92auKC4BRuk9LuwjD6dVPPRgVosP
         7sqzOnIrvCE656bh89cQqmQSUv/sb+F+YiUSptgE0746gBMhx5VcS9Pn/8nZYEX75gVD
         U3an8oHETYsSiYFa9VEq7rZkwRbvNBhbdg10kauUHORq24oiwgO0xPXZF3qCLDda66vO
         7jbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPb16pq4exsWCajHvfVF/rfq+bN6Yeq/gCMF0MXyXlrC3+mUE3m+3Mfuj598gzasUE4jObKfUuaPTxCw==@vger.kernel.org
X-Gm-Message-State: AFuF++mkiUXA2hPD4TxgBARa0/3jrTwIpwT+/JY0Nzh56O8a1+osX8p5
	JDjsung3mLyXgh6yD/kHbv5v2HAFld6RK0GU7N4yWwitQJ7dLoSOzuFBVvUFqJBXKavFsxl6ZcH
	DW4ndRte2uJ+vyDpzWobLmtjdgxq44aLT+iKxoAgSuhOaF6NPJ/snsglzrVEv0jZoTQ==
X-Gm-Gg: AYBFou0eipf3YYe0n33sOBU0jDYo/Oht3D5DKQgAABZp0mfgI6Bz1svh88Aq1JN/e9y
	Cifd9BfOPiGnd99Pby0Z5Qz3gIkdLjS30O11g+w3V+SwTlCSQGlA1ZCoEOOu5q5EOF49GRVGoXC
	NUlt/0PExOSqQ7OxhaxCGOVJlgMTNMuLTwi8v2yXGdLH5yz9oLNFNe9aZVfAR5aeanFGNt9HsNt
	itvYlIUw8HEoHlmiVgbMcrs2V5XBmY7uN7tHWJ/Yu+gCyOiUoH9bt/BCNAFWwfwAeOMQ9ZrqMUi
	JSYl4POpy1L/Gyr6sBcv1pH6XQTWArgH1B9j50DXbcTlNwpmAQ9kPtsAS6Qd0FUvF3jLgAzNih3
	qTGPbihyHPKNraCxZIGDt3pDsEy8TUrmC
X-Received: by 2002:a17:90a:da8f:b0:398:c8ef:3644 with SMTP id 98e67ed59e1d1-39aee156f4amr2902827a91.15.1788322531031;
        Tue, 01 Sep 2026 21:15:31 -0700 (PDT)
X-Received: by 2002:a17:90a:da8f:b0:398:c8ef:3644 with SMTP id 98e67ed59e1d1-39aee156f4amr2902754a91.15.1788322530535;
        Tue, 01 Sep 2026 21:15:30 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea2e175sm2422630c88.7.2026.09.01.21.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 21:15:29 -0700 (PDT)
Message-ID: <594345ef-4e64-4932-590f-02dfd6d96349@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 09:45:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: qcom: iris: add firmware debug logging support
Content-Language: en-US
To: Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <20260815-media-qcom-iris-fw-log-v1-1-c8a70eb08849@oss.qualcomm.com>
 <80a8ce4c-cebe-154e-71f3-d12fa88c9de6@oss.qualcomm.com>
 <c169738e-33b0-4e06-8c9f-587f5c1afc46@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <c169738e-33b0-4e06-8c9f-587f5c1afc46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAzNCBTYWx0ZWRfX2W7DNiUZ0V5v
 k8CAZor01u+yvOaVPRIUZAbDE5xhR2/8HKL2tpmtiQH12mJPzm2gWDL3ObPYycz9Du4z4qf6NZ4
 glKoD0Z5kL11rI+fPi/ILu6lRspmnpAXN2dg862gyWpu1wbT69UV6nwQPZc5Ww0UmbVihsormrp
 VvIB4fO6t7AuG7qSS6J/U+orvorpaqBgSrdVf+CX+RtH+tjT50PlygdTV6gx5ZHJwOqOaESMhwL
 W0QaTgSa18kd9XvMpB7ec5FDIYzxP3T5h28UX5r7ldsuUJTdjk8ih0nSHjgH8Keq2OnQOZw0w/4
 4IzjOJ5uK3t0+lCwsaiSggw9bN/voo2O5oh24oQ6aCPNisuVOI04xPsp0ri9GYYodqIM3mYQDcJ
 2jXX8BzKugb8/RHsQB6HM2vVVpam2HkJxAdfSyY8CR8cDWQ2AD3wysJqV7I7SvyQ+on/VDBMV/b
 wtKbg4C+O2TvImi/eyQ==
X-Proofpoint-GUID: K5d7yZGVkzF-vjKwnBtgDHOOxJG2TGHx
X-Proofpoint-ORIG-GUID: K5d7yZGVkzF-vjKwnBtgDHOOxJG2TGHx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAzNCBTYWx0ZWRfX4Ckn5PYzVnUZ
 kJCdYHLo13XTjx0b7a7lr3s46nk9pqumiEZpHGFK+qDds5A0RH+PzloWLVLxZVFx9sP3U6OrmLT
 dVvL7hmgogAetbS9ng0T/xoXaoe5beQ=
X-Authority-Analysis: v=2.4 cv=R9oz39RX c=1 sm=1 tr=0 ts=6a97a2e4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=y2p0JO2t6SGPmjSrTqgA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020034


On 9/2/2026 9:32 AM, Renjiang Han wrote:
>
> On 9/1/2026 12:13 PM, Vishnu Reddy wrote:
>> Setting the firmware log level to 0x0000003f may cause hardware response
>> timeouts due to excessive serial logging. HW_RESPONSE_TIMEOUT_VALUE should
>> be increased accordingly.
> Yes, but this patch is for fw log feature, response timeout value is
> performance issue.
> I think we'd better use another patch to fix it. What do you think of it?
>

It's better to include it in this patch, since this change can directly trigger
response timeouts when high FW log levels are enabled.

