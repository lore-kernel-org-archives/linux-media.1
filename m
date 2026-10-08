Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC7C54704A
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 06:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439979; cv=none; b=j7PKiecP010/80ZIQIae/d8/devau28lP/SBy6/cAESSRNZM8TOl8hxj+V7PxCx5KNPhP3NoTrjqpalgXbugrHnkAyaiVX+fNEFw2bwNvh+A88kxGy2+/EtSHuRFiAKRni7qbqGZLdBwfNW8sGayTnJf7n6xxelc1KYkfdxpx9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439979; c=relaxed/simple;
	bh=waeWroeP4xKtFKOgISd7hpP9YrbNnTVkhGw0oIV3/fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XtnZ2QZJTJZEaITnDrwrrxdJYEcpzy+XBnWJOo9hbhJgmL9bboNWDe3RiCqRHIN6YW+KYf71CsCTSr0WSffY7seHk/YiJrRhXtIsMrEQZTfZd0XyLE162kdSGhh7sgBpo9V+Tv8/3LiKu0WZQ7vWvUbCb5AcOuvRReTyYUlsDx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtR08Tba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLUOKf1L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtR08Tba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLUOKf1L"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BTCA928469
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 06:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0f3SYb/QaHvXkN8gz/IfSSHe6Mh2Mxm/hOMkaVJ0nM=; b=VtR08Tba7WqHucVJ
	U+8Piw0OWr+jbsezrQNyIh+WTA8mRVuCxJKaCAnhZaW7jDJZjS9zb8aYltomoOjB
	f1TRxxShskiEx7Y7pO8QBE9CNOsDIKyIPjZ2OsDPE9M14lTX6y7pmKvdpd1gneNb
	n3peM54vp25KmPCBwuOUt4S0ipcKYwPVjSwtvSM+BVaahFh2H7fK+cydpoWHJevR
	5j3HLah8P72wZ31tdbKUfFInHCOLHV9oSh3v7dlvjfr4r+gdGtlTi4cAkdw8mxze
	IaeWTNCzKodKhMCk3nHrxxds76tD/diHUVPrVsvHKVeIM7OCowGBglaTH7ku6e5z
	nf4QIg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2sdbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 06:12:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179d9cde17so53010556d6.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 23:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439975; x=1792044775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0f3SYb/QaHvXkN8gz/IfSSHe6Mh2Mxm/hOMkaVJ0nM=;
        b=jLUOKf1L97xPrK/9oVhVKoMC9r8VAjY5yJXrKLros3qaRSiY0goNcb4lTYzuXVZh47
         hCrKV66U/sqORdDqlpc5iB9ChrVc9V4SOcuJ3XG8Ly8Ar3GblVN8kIH7Xv48tmbiktS4
         Vh06alZim2HnHcPQX/kLuFpdqNpmqKC9Nyt82vyyKHBhPu8Qg6Tp3CcC1O9KpSChqpBq
         O18495dvCf0cTuiIqBLVYh1Cf/Lm2yQPdSNq80ZJO+hw5PWLFYgP/sJKhw17MsoiRBPS
         m/TMCjxeLKr27cEXi1yO7pGJUG7SUuaoMcY8kmHvyI6srPfnFvPkrImGa9JiPrik7cwz
         x2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439975; x=1792044775;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0f3SYb/QaHvXkN8gz/IfSSHe6Mh2Mxm/hOMkaVJ0nM=;
        b=xZBCTft75fbhRlrmkAJ5hKxCZwO4NXUyWf22Lh4S0UQIWxyFCCT93T6REAsgKS9t9a
         tkDwvS+7TGtQWL/PpR5lBO2nlbK5q/1OJJOkCVZPcOc8O5ZMgve4A7YXgE5vSiNJY+CJ
         fltGajoYHIPU9Lt0oFR7a1rBkFYTZHp8SBHmRq2G5rbUl/LZ00cEAk6X23MbGnzjEoqJ
         3iW/bZPCE1g24AqOQMfOF64dyG7rxR8tAEeV/6mMdncmFnKH1C9KrchD9TPCYdkVItOD
         hKxegk4RUpIcHXC+JKQBtUdUyBZtPriXwBMthRyGCgnPXXJkf4FcRFOoB0nWXV/hmqlR
         7UtQ==
X-Gm-Message-State: AFuF++mkqY95JNm7XB1ZGYqzsxBsnZU5At9bQUdxDnpJ2mO4mL/3+0KB
	+WfG9su3So0sx3q2/6kXC8dVv3ntVxGrLiiY3d21JsihHRz0sOStJ+3+t2i3BUilAX2tblxJIog
	zGyDc4sf0CLASf942MQFe4vf9Xtz8BqMnG1X0MVecCbZZBKwT8sfmB4pPGR2W3fWWfQ==
X-Gm-Gg: AYBFou24ddTmAzQkk8Sd1c5eRQC+qHn6McMOM3C4qm8i2RcWyImlODcaAGDWuhW2bfc
	/9tJFexxZW1Sp3gca3qdoM7DJ8ui8BjgsGmgUk9V9gJNBqSSzavsr7+V2Iw+rxLCByd4us3/SXw
	HpjwV3oCNr/PpBT1Jp1sW6Zwuce8aJ/FMC/coz3DLZnuvB367w3w7+dfXm8bQ6mx9ROetpZ3jzH
	vbdLlcd0ED2/c33BZfG0hVAfnwItMINVDpVkTk8iRq3oIHZ+WcdYXy4NG5KijkYV1iJ2JYH0SYI
	kOb+lxWw8hg/5TxlGtR/AaVFTJ/zuySMt1e+t4zAUzomi4Tr1Ij9L8/lvB9E8taceeqfbSZ8g3x
	ySGryj6r7oJYNKlYj9qz4sB7KX8+J3MkwuErr0GE=
X-Received: by 2002:a05:620a:1d0d:b0:939:93a1:1383 with SMTP id af79cd13be357-93e9b75cba8mr846473585a.32.1791439974575;
        Wed, 07 Oct 2026 23:12:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0d:b0:939:93a1:1383 with SMTP id af79cd13be357-93e9b75cba8mr846468785a.32.1791439974060;
        Wed, 07 Oct 2026 23:12:54 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c75b4e399sm8112748f8f.56.2026.10.07.23.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:12:53 -0700 (PDT)
Message-ID: <2b5c6895-58df-4fae-8d65-24806cea35c3@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 09:12:50 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 35/74] media: qcom: camss: vfe: Add helper
 __vfe_pix_format_is_raw
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-35-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-35-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXxQk6RMrLYtRy
 85nyy/eMQuQ7CesSi7DCJ4gjoxHWV40mPQ6bNfEsgfthOVbCyNSoLZoFaW2pIm0jOgvXuacdcq3
 S2dC983H77DqNq949NFemzRf84+werg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX+dZLtiz0xWoC
 VeRALj27nCJgn+/tKZEDZs7vWtyC0JJ8Ksh8czmkj5eQ/hEXlray1jl17tB6ocN6Ahn1rQhaebD
 imGB9xgC9BXvIrXjfZohtA50oTzf5FCVL72H/vKGoRBttKd/fG9PY8sNAZT70BGiXpwPO/3Dv3d
 JdGmcfPZImZy1gUYR/NNP+0Q007LVK5W0NIn/7WmGsy18IyfU2/8uGOaYHSuzGg7DteZTw0skJw
 VmMldeL1tuHjKnGCzMalEUaG8t7DcEmFa+ccMhTzdFa1BAc+xbjifdDMh05Ae1xaneSt0QadZCd
 UW6rczu6Wp7Oq20mauQn68+jlWdJJb0hBymst58/mhlNJFid4SgJWajdiEPlPmOvYuGEG/Wq+98
 cqIQ9HxptdiyLJFVgjACrI5sAIVitjUG1frxfjl6FwZsjIX9aq6mN1Xbq7+lYnFpmtiANcjLXLb
 RwTihHgjHKY/b3lo1jw==
X-Proofpoint-ORIG-GUID: vmz_RrMwKmSvVAN5LG1Y_ZCDp7JGqgsB
X-Proofpoint-GUID: vmz_RrMwKmSvVAN5LG1Y_ZCDp7JGqgsB
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac73469 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=STDLOB1srjojY5QKT3EA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024

Hi Bryan,

On 10/5/2026 8:14 PM, Bryan O'Donoghue wrote:
> It does exactly what it says on the tin.

I dont think it does exact what it says, my comments inline,

> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 9793df66b4149..43c91ec8db494 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -340,6 +340,18 @@ static const struct camss_format_info formats_pix_8x96[] = {
>  	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
>  };
>  
> +static bool __vfe_pix_fmt_is_raw(const struct camss_formats *fmts, u32 code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < fmts->nformats; i++) {
> +		if (fmts->formats[i].code == code)
> +			return true;
> +	}

This function checks whether there is code present in the formats, it can be raw/yuv anything
why is called is_raw? Can it be is_mbus_code_supported? Or something similar?

~Gjorgji


