Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAE14FB9CD
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955941; cv=none; b=h1SaJnxqjgrJkvpTvfg80JCyppbKQP60+zsSp/LBNQORypSHjAoa1KzaufWsPFjLQ+FN9XVezQFJuAWo7ncQHFCC+kh31588srhXyguuDOMOvAli/NQjPAv32aL8MRowWEzUN5TQ20K9dF9smOyeBTr0v8QvGlgp4C5fWw4Af2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955941; c=relaxed/simple;
	bh=OOvwZParqGAsBd0+Bjsmro0tSxp3TRLEWaSyLRmhjHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExRPKC5M5Mh2mlVsilsmBgPcluJU1dCDmTIpRcVYH+eu4nKAKpbsm20zmM4Zmz3pXkRF0+79neYthDQc1yH4fsXYrlMOR0C3xs+KejJMMN+hyC1vunT3NvxO1eSYqRoFdVSRdJZcpIMpg1FVb8sevQISl6b4aNLS4IKLmDXbcXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FOHZYra7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DtcCMHCD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FOHZYra7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DtcCMHCD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGdRV1646265
	for <linux-media@vger.kernel.org>; Fri, 2 Oct 2026 15:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5lvh9wMD5tjLVC95TXkUAYAr
	tmVzd4nSgEQHrshpnPM=; b=FOHZYra7URt1IC2prh26XZ6+dNjopQCM6sBwUgFj
	wmcYLmmmfb7ERZLbHNS6dhaETtGJ45Kufcnph3ng2Oke8D1swMRVpnNsRVYLekce
	iyRqrcPMOBEhNKPcsAlKtxc46bjiRbmcgAnKXX7jTv8XzoglTxzeT08/MyNqnBXf
	w3JsF0QjL7RTdAsoMnnLrp4lGKZb8VyzVnd39KfKcr+rutLEOqywo5JtPYP100ax
	Z2CO9whPnDr3g8ITjmNukS2MeN4w89xW7JmEBEZKfvQAb7K7NY56tjf3v0pDNvpG
	astu92g+/gJA0QZxlmP0P/IUK7Kre8XZ5CvzTvCCTeGlYg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ec989sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 15:45:37 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso5949704241.2
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790955937; x=1791560737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5lvh9wMD5tjLVC95TXkUAYArtmVzd4nSgEQHrshpnPM=;
        b=DtcCMHCDODOn9srKqUjJJn9Vqe6OQPXbMLHy4j60Z+q271/XwWhRivL7PYDapwf6B8
         CkDjqN45UFKqiwz6Jv8+vOPsSEFld+UHDxClYicgbkZYTOq62p5tQjNLK5Kajy5bJ4tV
         oFAzna1AqUE2EZWmbb720jSOVjoddoE59OpnNS4JT2X7y+Ye3k7150htwYGlAx1HioLU
         9mhrcm0qecI+3ZSCz6L5PL0e4rynFIysqrk/mYIfj9jg3hGCamakIIaZ3AF2ph9PBYCy
         CaGN7xtwB1MDRc15bynIMJ2LItBA7XIEbzeW4T2U+z/wQ3Ddey0yeH1rH+nQHMEpINt1
         LPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955937; x=1791560737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lvh9wMD5tjLVC95TXkUAYArtmVzd4nSgEQHrshpnPM=;
        b=W54kYBXRiDRGYTWg8dvyS0EbRKzwDHqo4RQcmWKfu7WoH0vorC0kanv/wh0GipQW0L
         o7EXj5NofWF5OkqVJ9omRAubAQbTNbtm0kzQ3RAnQ7bEtrrKVZ+ojQTCORWnocVtzfSi
         Bb4rrQ2gR8q4RzL5OuMPh+r7Wv3CNGSh6ffOOdf6ZN4QW7figeMq1d53Dwu+VzVcx3Ny
         B35VSDZ8v15e+gT9H85HtuyktV5736deuaxNQVH+nJZIJeRkz0F6rQc+c4rXHyKsVcKe
         MAV74He+I6xRTEZgNnrqiJorsXBdhqmfYH+21d7Da9U+TVcoumdcIhvaztZAFEDA7/+R
         6CRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMTF0iIC12LntkJGJVLAOD6PFX3DBfOue9s9SWCRy51N5iXP7Jk5C5hu1E7H/k8trFvBsgovOYXmYJQQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK7WXPrSvXUES/5WH8LfHjA2ewSYeWuUGN4ZjIY0Gm0fLJtRuMW
	echE87QSLJSoPrRFIR35V0lImeq38+gWosZfzYpI62tkfwJMGwRqFrqAP2Kk04iddmw6q7s44Ur
	w9ENfdMtFFEQcyoriwMEzkz5wcdrLrCH5L/HItfWBlwHLOWh7FNttRfPT8cMELoPy7Q==
X-Gm-Gg: AYBFou1EHaQKtzwszwJu5+3JB+oXVOYCyUd8yCt2PFothL+qLbvLMgYQgKAGgFxRyZx
	aMV03aNP4Qc9mjDbiA7Tl0I3iQRPqYEjsib7mS5+GQ8GzHiEOHsEsPpHiRI+YEbtttiLqqsnLvC
	UgTPOtaLJ+lXCjCPwFgjjmQ5KKHui41BRK6v/Rav/rG2vfFhagAghYw+fm0A2kEmZxobI84lO5P
	BJVHGTncQfiPUkif+xr5Wr74q9F/gZYOAhIthWZzJ0Ql7jgS+10eJ0EQ9AtjLbTtDyr0rEqzkyo
	LJ7GYztS8mW4aSDahkLEKAcZ2GrIYuBFQNwspA6m0DuNR/Glu+nGwPvcZKkqyOSeuxMjyABmX15
	sJzs67jPFKuwOKmRj5HqwVs6NpTHAr0wr3Ow9DUYl8kBg5BRpxP0eprTGaafX3HJjkRDwO+TjQ2
	lLJLmavW31qXh1
X-Received: by 2002:a05:6102:688f:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7c0f3d4e99bmr935138137.8.1790955936569;
        Fri, 02 Oct 2026 08:45:36 -0700 (PDT)
X-Received: by 2002:a05:6102:688f:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7c0f3d4e99bmr935117137.8.1790955935994;
        Fri, 02 Oct 2026 08:45:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303896sm10673821fa.19.2026.10.02.08.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:45:34 -0700 (PDT)
Date: Fri, 2 Oct 2026 18:45:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] media: iris: move shared APV PM helpers to
 iris_vpu_common
Message-ID: <ozfbnjyxg3aeeyrgegw5ljzl5w5fzxo6al5yiovmsbv67t3exh@varn7bs3kqdr>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
 <20260923-add_iris_for_hawi-v2-2-016ec3d24b79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-add_iris_for_hawi-v2-2-016ec3d24b79@oss.qualcomm.com>
X-Proofpoint-GUID: yuGh4Rb-vV4Z9r5DgOvm7Lk4xsXcZ5Lw
X-Authority-Analysis: v=2.4 cv=Ie8Symqa c=1 sm=1 tr=0 ts=6abfd1a1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=cacEoe5upwBGUwrNK8IA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MiBTYWx0ZWRfX40rnA/pxrB64
 cw+IyjmwR2QM+NO60A+UBEnNPE102NkBrAOWmwKuqq+8NGFZEuBljXiLOMGoEql4styEMXYM/4+
 yBNDV2iCjeGLQ4nbECOh+WNpvCKPVw4=
X-Proofpoint-ORIG-GUID: yuGh4Rb-vV4Z9r5DgOvm7Lk4xsXcZ5Lw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MiBTYWx0ZWRfXxAGNpcyErKz4
 V9dfP1Q4gbgI5g6tQB8VNwfP1LSbisHU8DB6TNGyff7Jn3s0cb7/aB6wj21AYfCgtdRNX56mnGi
 9czD88a09sa4pIDpT2tbpamIZKs+btXfRGtubsh9Kvrxl/5NIGwI6JNbwVcMienRbZMd6DpdM5g
 t1lCSnxKV39BBHmnbiHliXDqjO/eRT4u1H4mapYHIqu3zltvWPyqV6OSfB5gtU7YaJECFJZI/qx
 WEqo4hxoDi8RJ8IOF3b/Cv93no4FMPjzSJFYYLVJvWH46tCrQyjBIClP0oMZhyFdw0AWwSvItqM
 Ig67STnwcj7Y3iiu5B3riwGeox3LnyElWdyhe25p6Ke4/oJZ7Iq/d9OeuRF24QrF6G9hPvykTh2
 PKRzQiZNHYcmN02eDQdfQK48DJuVchjkofMexhhJLTM36CH9690GtLSwquipe1FjRbaQo1iG5Xs
 XJEES+qrWomRK8/rcEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020062

On Wed, Sep 23, 2026 at 11:27:52AM +0800, Wangao Wang wrote:
> The APV power on/off sequences and AHB bridge sync reset helpers are
> currently local to iris_vpu4x.c. VPU5x uses the same sequences, so keeping
> them in the VPU4x implementation would either prevent reuse or require
> duplicating the code.
> 
> Move the helpers to iris_vpu_common.c and rename them with a vpu4x_vpu5x
> prefix to reflect their shared usage.
> 
> Move the associated register constants, including APV_CLK_HALT, the efuse
> control bits, CPU_CS_APV_BRIDGE_SYNC_RESET, WRAPPER_EFUSE_MONITOR, and
> AON_WRAPPER_MVP_NOC_RESET_SYNCRST, to iris_vpu_register_defines.h so both
> implementations can use them.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 105 +--------------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c |  91 ++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   4 +
>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
>  4 files changed, 109 insertions(+), 101 deletions(-)
> 
> @@ -249,7 +152,7 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
>  		goto disable_vpp1_power_domain;
>  
>  	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
> -		ret = iris_vpu4x_power_on_apv(core);
> +		ret = iris_vpu4x_vpu5x_power_on_apv(core);

I think it's fine to keep the vpu4x in the names, even if they apply to
the later generations. If (just an imagination) they also apply to vpu6x
(or worse, only to some of vpu6x), we definitely don't need another
rename to (again, imagination), iris_vpu4x_vpu5x_vpu62_vpu64_power_on_apv()

>  		if (ret)
>  			goto disable_hw_clocks;
>  	}

-- 
With best wishes
Dmitry
