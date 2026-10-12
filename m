Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04F9415B6C
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802817; cv=none; b=WaK87C4P5xS64oSePburAHdO1F1oxHsZXq1XaRqijL/mreWAZEdNUdVcDfVGKqBirf/Ojod6p2NDwX6K5lneaA3px//xjjMEpMn5JI15KlYvpu39nj82xkH782QzdaCtt5D7KrJBuEFWSHKGQiesKZVr09UqOESEISt8tuGgCyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802817; c=relaxed/simple;
	bh=DKB0ohoPA10rd8CeWgiyPBcjWXLvhFCdAkImmHd/e2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJ4pNTUv8RkUOeFMZDJaxYnV3YhJ2msYE9H2n0JggAEmIppE45TMrChb5dro4CSIiyODIGJU4AJ4fHN3BCetUnpXztsOOqbO3VTadu8m3RRAsTnX5p05Cz8E4a8pa672Zj6A9UxaR/ReZw5ga7G5WuoOhDJhBSKH8uGg5eoxsQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cb6v/xeA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J9C69BbP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cb6v/xeA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J9C69BbP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CA3iH72527341
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wp5gPy4tGE+q8jY/VvWfZar9XTPjTFwwWnXVis7hZnU=; b=cb6v/xeAjBl1pi4b
	okzUfBrU0Ns3Y/cr+AP0fgVa/yycGpLLp6YN8Ogc/PYU2HX5TQ1Wn/AgsZW5mBc5
	yRVajyX2RXeqcjh/D8QuYv9pAH9FvJN0afqVjuGCQMMtFyIK/tcEj5qBRLp8BUGi
	Y3Mr32p6aDMuy9SYX8NN6Qzh3eGBx6KyDW6ffYBcPHjy+94v5N/WATlUWjje0goT
	eWhLA3IR4A8PBKbhjXH0+xNioQ5wkjopxcko+ROwbiY3BPmIl5z9wJgHZ5UnZP/8
	loZIRpCvBHGIxuynDcZ5WS+L6JfQby9Lo1FFuU9qIRHi+rBj+rH4WTeTuggvyn5Q
	t74KfQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffg9g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:00:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b861c0618so10782166d6.0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791802814; x=1792407614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wp5gPy4tGE+q8jY/VvWfZar9XTPjTFwwWnXVis7hZnU=;
        b=J9C69BbPfABuqn7cMgc8jqillbj3FlyKRnrq3HyOlzBEqVzDCn0C33vHn3UEpQZ49O
         DI+gfp+KztNf5grxFasNNr8lf87Zzb8kX/HlAEyvUIc10gkrz8iX5xMoVG2U1UtorISg
         kr9sA2RaNmudJq5JaAuAwJjTQVjrOoYpyiZ7A+TBYTLhjKSgxOh9PLvz8y1DOpYTj5O3
         7K5o59gBIVV5pNzokIAuJmN3G2xsoNpe6YoRmipC9XeUFequ6UEUq1KjCO2RrrJJej22
         7oMlYMzJxo2x4hCCBq85zTi6L9KRYWzrxqPpnbzWiWbF3Xa7d8+uk53PVzL/r68fSCFs
         Xreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802814; x=1792407614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wp5gPy4tGE+q8jY/VvWfZar9XTPjTFwwWnXVis7hZnU=;
        b=otkFaF32QCC6tbr/mn+qTkaiVlfHgmGcB/dLLYruoZacteh69g2zbfydzGvNvdzkap
         tJSIqifj0mssYJ1OQkOaEmguXuJGGLAgT7ZoECLPs/XixXYaTS2U9zlndHJ/MIvHH1MU
         7ClQWCAzUGmx6e4ttkk+8O2kdoHubqzbZxmuxC4X9KQCVBLceTPq0jrP3P9Lc9NUxh8n
         jxc5b/MJNAY8yBxQwx6Vgxz2Rr98MV9KKAM6IJ10X9K23ALZd58+cKUcUzG3JuGo4fG1
         pGPzSolKl0e0oz+ESCU4BlolL0Z1WKYwPOi/7dAq51zufopju/3ZP3Bwz1R0nJmIDYxw
         Y1Kw==
X-Forwarded-Encrypted: i=1; AKwUvByA0zoEtiZppbmioEoOPdQFVD1Totqq80Sdv2lqB1bO8gAIu4VQpeVmwgyScZoR9EGib5w3BPDeOJ7KKQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIv9fEhqpTJNh3EcjquPSuc1swa4DRvwuV+gsmeoR6F4s+dv8Fd
	WC5Hk5EjwrAZ1zs/+mZt6ffcRrcp3OQ2bXka79zmgGWX7g8oNF0g8G6MvvzuNm197FlwSdgRD3W
	fB/bk9y+oZ5A6wtcX33b1zsR9OQlI8foHx/VRKF5ym5pKPhQNZtBeI/Pp0pNaZkZxBQ==
X-Gm-Gg: AYBFou1nUdb4hgrv8eAl2NoNpRBEGDaY1xoah6hprUKYN0d4fxeGeay4DO9ES6MJhdg
	kWxp9mwV4vT/CNjxjeXam+ZgHwNd7WwBaVbBDs/7iKqAHcIaeTv9mgWlKgoJCvZD13tVGYrSoCU
	P+dnzOQJ+f2FROIkPdMEAk6LajhV+I/tCiJJnRyzxsv+cLY8c2c+30h0SuAEW/O3hjt92EKiE9F
	q50ukIV9MMi0wmx39QuMeHALrke4gDaN460B7GnY240KiijlFuv4xSmghaNY/xR/1ujjvaN8B1J
	+hI9gvPsH1rqSOUQ2lOt4AvUtohVkhzW38vvId7NNGOPEviZptGZecAzoKBu/GnQRijeKWe7paF
	nmGFZ3ps7rD9tHm5pxUERgHeQkqnABBb3/QU1UPA=
X-Received: by 2002:a05:620a:1786:b0:939:6de6:9518 with SMTP id af79cd13be357-93ebd2607damr1427531685a.47.1791802814296;
        Mon, 12 Oct 2026 04:00:14 -0700 (PDT)
X-Received: by 2002:a05:620a:1786:b0:939:6de6:9518 with SMTP id af79cd13be357-93ebd2607damr1427521685a.47.1791802813324;
        Mon, 12 Oct 2026 04:00:13 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm19330608f8f.43.2026.10.12.04.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 04:00:12 -0700 (PDT)
Message-ID: <c8c648d6-03c2-4af6-99fa-4e20362db34c@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:00:09 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Enable the streams API on
 SC7280
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915121536.19207-1-hitesh@ebytelogic.com>
 <20260916065422.819512-1-hitesh@ebytelogic.com>
 <20260916065422.819512-3-hitesh@ebytelogic.com>
 <f2f42426-16b8-41f5-8501-a01a1c33dc01@oss.qualcomm.com>
 <20261012092328.120984-1-hitesh@ebytelogic.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261012092328.120984-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MyBTYWx0ZWRfXzpBdJvIy9bzp
 BXJGbHQnJFjCziS2xyRJ3mITpQGBKT/V/RrM202OVqZWiLCi6L0Q+JZoEh3G3XZ/pw+RcOhd9Gq
 5oLNhdNDS9uo2U42AeRxCJnnTqSJofuyYWhOo264M8h6/6JxmIaQ4PeB9wERBicD8F0GmfSk+Lv
 iiHMv9ihyNuTLTshwOvrgLCFKIgblKro0FZAlFfhGahPce8xE6if+E44ilj7XOwsnycRDI1Mt4w
 J9eFjE1aiQa2P5CSgQhy9rkGu3tGkLKBcSfaQUFhZXI9wsDa2OUMXgC93Ic2xHUFILXa1a37URS
 4uQsvtjFW8f61tYH8fM5z3wUDw1u5XYk/8iqkOpXtqI/+zvIcbU+PzfCIetdqf0msggJS0Q1aKe
 TMqJpNnUJTZehrkGE7hN4wQo6tEbjXwAvsFV0lX7kn0YlotMwFClay23inxQfPnvVPmoDi8RREe
 chDIgUIEy3UAAKCJ+tA==
X-Proofpoint-GUID: Z6kMtoyaoHHf6UHfiooEV3PZ1U9iq_vu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MyBTYWx0ZWRfX/f0rRLewa66G
 I7yRw3//qWSJRAUET6mIii35euAtJCVNuP+1L0Pk0WU8AyKK6U1wiij0uhwhdpj1ZJZZQpe9LGU
 l+nZbyodLI9iUOHx1njiU+j9gzVt7L4=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6accbdbf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=yLbyE3pZHTCQhcmTjJEA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Z6kMtoyaoHHf6UHfiooEV3PZ1U9iq_vu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120043

Hi Hitesh,

On 10/12/2026 12:23 PM, Hitesh Patel wrote:
> On 12/10/2026 10:27, Gjorgji Rosikopulos (Consultant) wrote:
>> Thanks i will try to include your changes in my next series,
>> it will need verification from your side as well.
> 
> Please do carry it in v2 - that is the right way round, since the patch
> does not build without your series and there is no point in it going
> separately.
> 
> Two things to make v2 easier:
> 
> 1) streams_enable at SoC level, per Bryan's comment. struct camss_resources
>    already has legacy_phy set once per SoC, so putting streams_enable
>    next to it keeps the two consistent and drops the 15 per-subdev
>    assignments my patch was adding. Happy to prepare that hunk if useful.
> 
> 2) The CSIPHY legacy-PHY conflict Bryan reported on 1/8 yesterday. I
>    already resolved that when porting to qcom-next v7.2; details in my
>    reply on that thread. Reusing it should let v2 apply to current
>    linux-next without you needing the hardware to test the legacy path.

Thanks please share what you have done it will make my life easier,
I will include all your changes in v2 patchset.

> 
> The SER/DES setup is up and running here, so send v2 whenever it is ready
> and I will verify on RB3 Gen2 (QCS6490 / SC7280) with two GMSL cameras
> behind a MAX9296A, one per CSI-2 port. I will run it against current
> linux-next rather than our vendor branch this time, so the Tested-by
> applies to the tree you are actually submitting against.

Thanks that is noted.

~Gjorgji
