Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B758310620
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 20:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780862926; cv=none; b=TEsmT2ZsHCvn0xCZnLDxYK+1QNKW/0YemCLJXcAoL8hRUgu7VLIcygmIdB5ewgaVaLj4VZ/+KDuvidVSIuiXwGS8NHivZW1lQPlBKS1365lD/bh0qO8MG8JZZ4sGSp/jsaVcgqPaP4YSh1MGdqdg14UhmWcqUHRyTZHRZUoGIJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780862926; c=relaxed/simple;
	bh=qzLzWGP9HuDRMM6ea6QxhwfJ92WImSxG1EGx7TEbb20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/mIz7dtWV6vEMYhEEjdnfs9BmXBErbInOEtANJat1qi63UNhMsWfBWHa4TQLxL4c9RdPgeNajeMRmxzU0DlYgF0tSJi4j99FdS0zjg2RVKHXtaxrgRt9Mg/PAMuEzaSUtUOzRlGTzbJYsQiQ0G8wUINpWvx8CKrMVpGEOTkRfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EeSf8JHL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Duk42Ey/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EeSf8JHL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Duk42Ey/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElPdj887115
	for <linux-media@vger.kernel.org>; Sun, 7 Jun 2026 20:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iFcW9UHS68mSqlmGCliD70Ys
	nB3Zs+FG+TvxvsOMESE=; b=EeSf8JHLi3YfF5SsQHVHrRwGVu6l98VMf3dBRkj2
	Rd1MH/p6v4lmDi/rgpD0la4vBh9aD9DxhefvPRluk5oDAfDLyFz54MjLLTdXsl64
	e0COl9FcDNDEYsR1CohGgTZUjG+xojM/7LcUcAD1mET85WRWSkxNuqehfhkhkNsA
	J8PoDhiN2fRFnyUj+DUsCO/ewfCiY5AO0zLKpjTUejoHn1/eIHvZ8jzUmNEimjFp
	uxcfTCBpEYoKJxT4/mI3L69pn6VCjzNx4f7oV7yR7uuX1xViyzBlJH4+GNxvxnII
	a0v+hjqd+M9Q7YB4m7m7cylaEBexWlzqZ3MI+LOw+ZU1Lg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrcqmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 20:08:44 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963a96abbb3so4410694241.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 13:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780862924; x=1781467724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iFcW9UHS68mSqlmGCliD70YsnB3Zs+FG+TvxvsOMESE=;
        b=Duk42Ey/BYyyjzHaYFdrlXi872Ly2v9kNfyskrg47GFN41Tr0+/qWNVAVsILNxPRpc
         YVXVn+75r1/HUF+enRG//PbRdEZDokpIh2qVGZhTuM7x+kY63pO9vWkcEoldfkClcDta
         UXVOQeWX1TCaC90izjoOPDLN57kL99FU9HJ1xaqsPGjMdjwhehyqXNYt9ZbMTu4eY9Qw
         4Twh4WpXjwq0bZOlTLTbm8rl2qu6RuEGgZnl6nEwP7FF9W89HkoxGfVerqTwY4JhSAlC
         bYYIJ2jRpaU3Uzi2DMTGlNSxHqh/PHqT0FDvf7msoFH2+oxT/RLXr+W9QZEIqtUdch4m
         vdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780862924; x=1781467724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFcW9UHS68mSqlmGCliD70YsnB3Zs+FG+TvxvsOMESE=;
        b=h7Zx+7u56a2hiNU7DNzdmdTxkyehZ1OdpPlREAZD+0DW4vRzWtBJNzdE0oVMxoGF4R
         PWhu9up1sHfXu8yGPzN/VSbx5tJSXn10daIXhVpbVbgc4eC/8RYnUti1lwGY39bBz3D9
         +5ZKs5VniMIIwHCCj35ek/MByWqe4lHO/UE35hHU3HwRPxf1YnW1aTd5CjBcO853RORu
         nu3S0sRNh3bX+jt5AGNuQ6t229MGOFNuKSzGPA5t5x2zY5sFpQBehTbkFCQ3jjl3Kiw0
         N7jKtCiykcaMv5qvwAfA3xMo3e5zTgad1ZlsRGNW8N6Z7LcqVB0ql2t0CCweo3HQVGG6
         rdJA==
X-Gm-Message-State: AOJu0YwI+AOcs4R0OO78MsRPrQw9a4dTg/3W9C60rjw8JXppM3tqEl7G
	uih574ZkPwQHzoSmM7ZtYeHr0aLfE8jElQEoE7erJ5HtO10wkvR7ss9cOEt94hUZhhNcFwPU36G
	Hjr/VafZaqpTKMeFkfLvUZpFQnDXxYLXH1jOxysZfL5gaTF34AZGdUXnRG08gc0wYvg==
X-Gm-Gg: Acq92OHIiO7YrgFe/VbJNn5lUDK18tZI3tlDYzgIeDqfih6B0QjEIq7HEAzIpjdC6+F
	kXcDLOIlqKaKhbqbtcl98ZZ3ZkAi0zcIGmGUjO3kkbx3VmCJiFDFGGUG5fEO9tC4pF6BYTut8xD
	BdQEO/k8FxTl/YQx5LXvtd3pqTE8ZNg0Th2OU+mVG5fdNqxv1MefZso5PzUUJAXXkH+PE2GGsKJ
	+0mOnWnoCTC/xwQbsNK1RtM34IAd9Re70TxVBpEfiT97joCGjt/l4isgEBwORqmeYQTO8L6dPuC
	cd8k4YDFMzMxPww92pfdu5GgHuPVOJ6mL8axesKRFtHIhjubNff0DNJvDLOyUGB8MqAJ4qX0aU/
	JP+IdeduxjUpiyk1TsAEJ5cZvgWKFL78QagnVFWqmvvQdvsmcJDFrL2RGS56oB6i9KmfJUuN+Nd
	ufr7mlzjiLZMs/YYn/eInHhyaWp7wtnxQ5MuLOHVZDMQs0JA==
X-Received: by 2002:a05:6102:370f:b0:631:4e9a:ba3 with SMTP id ada2fe7eead31-6fefb0a73c3mr5674130137.21.1780862924069;
        Sun, 07 Jun 2026 13:08:44 -0700 (PDT)
X-Received: by 2002:a05:6102:370f:b0:631:4e9a:ba3 with SMTP id ada2fe7eead31-6fefb0a73c3mr5674113137.21.1780862923653;
        Sun, 07 Jun 2026 13:08:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9903e9sm3239345e87.69.2026.06.07.13.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:08:41 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:08:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
        stefan.schmidt@linaro.org
Subject: Re: [PATCH v3 2/2] media: qcom: iris: rollback OPP vote on PM resume
 failure
Message-ID: <i56ir2zcypgfyiqcorsbzqbk63y2nutvxvs3e3vdl74c26foio@hvi6ifirifs4>
References: <20260604090059.46355-1-dennylin0707@gmail.com>
 <20260604090059.46355-3-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604090059.46355-3-dennylin0707@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwMiBTYWx0ZWRfX8na0qCCSOsM5
 r0bEmLluF44c0WIQbb5Hyb7rEaoXFcmwDz/8JVykU0PvRI5omQt4mlAu7Cz1vlLHwu4iNBqAjJ4
 lPIvqbiC519h2YEmYsqlmZLBXTwV1Kgj4cTUX1dj4TkB36QDpS9p+V/ZAc+io89mwrxRroCCDYz
 93bzKFb2RTMCS88p85CfqePsMh46Ack1nGEx8qwT49eH68e1pcdvXiAswRY5ofR62ud4S/FTR6q
 xBWWAEa87dt0NfBLQmBKUVFy/R0IBnwesfSwFYJQ1DkCYuP3ug0FfUXy8ykf4Y3vIDiuiXXkN8n
 7fjZdjs0Vvf5x+MUhCMhSFVe4/So7DVU418hAFYtCQsh0OipWNBW/6Nf4r83ugvyXPCzs8diNqM
 BH8Ml+O5/9yM70vnn4LoqiUJuymwWZ2hy+uVMzL+0JhHo5Fc00FtkUGSwfTREIFpq2tQVnscZex
 6siVCWNudDCbZ1RcV1w==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a25cfcc cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=yux4S2Ae747FxQivS5cA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: lNRhNSw06AHdclzzKBmn8olt6IqSMj67
X-Proofpoint-ORIG-GUID: lNRhNSw06AHdclzzKBmn8olt6IqSMj67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070202

On Thu, Jun 04, 2026 at 09:00:59AM +0000, Hungyu Lin wrote:
> Rollback the maximum OPP vote when
> pm_runtime_resume_and_get() fails in
> iris_enable_power_domains().
> 
> This ensures the performance state vote is released when
> power domain enablement does not complete successfully.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_resources.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Please implement standard rollback code, using goto's.

> 
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index f5e3341e1430..a7d25f7a201a 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -79,8 +79,10 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>  		return ret;
>  
>  	ret = pm_runtime_resume_and_get(pd_dev);
> -	if (ret)
> +	if (ret) {
> +		iris_opp_set_rate(core->dev, 0);
>  		return ret;
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
