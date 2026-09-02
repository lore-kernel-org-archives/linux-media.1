Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7264045C6EB
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 10:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345431; cv=none; b=BGX6OmB6xWsLlFDb7kB+f2hk+36laP4HRKovvxCSGNc5SGhQ9VnTg8ANsGbVF0OqsTGFBwjVKzeNuoJqQ1RaV5i2X6rfMfe/PZ4tHY2sdCOkPXTFc89u9w7NdEKlsSpeA1Ei1/NMCwkJX+a9gGlGcpY+eXO1BP+4fqTA4VuTCa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345431; c=relaxed/simple;
	bh=d4/NsPaTI3caLZnCww4br3Gt5hf40dmy9YvA9NdaCvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oy84rmciiMpgiQ4i8F8glPRkxwN7FEhs4I3oYuSaNJ9RmEVpiGOEiUxeQKPeAMBPxgzA5ZW7eLeFCDZ35efyPVyy1MJAf9qqKsAf/lnJkI96JLA23Z/GMsZtU8o7ZuyBZy8ddzdEHBRLSbQsMeLqJTaKTztMOnQoqHzmahAELmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRdDjXmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+yZ51SE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRdDjXmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+yZ51SE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NUra1349330
	for <linux-media@vger.kernel.org>; Wed, 2 Sep 2026 10:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3uyQqoBoas0/92LGGm3nVSusdAnQvyayTIQGFu4GaPY=; b=XRdDjXmxNs72I6N0
	XJhJDOdqRdyQ5Zcb/MVLlzU0hLpM9BNBZgH0cJE5iuMMZ5EXOhvjnl2uGlFiMDfy
	RtKLfqWrURQhDDvSkUt4qhWA1EBUON+zPZoEPGMVYRyXSFrN8VP4588wOGApEMlU
	VNqvBOCnNBHUVaRiTW91HVqU/qSCXJqP6Bt82r1P67lG+obJr7extaPLN2emOpBa
	aJkM5CdpMqy9ECu1xBobCOOqdnMYr8Ghx77/l/dAGneAnpzWYdGRxPNPfC+rn2Gx
	/LM5dt0E8WW/Ztfeq6rC3U83MHwmdmKBnbdfdXuoxOhAKE7S3WFk1v+c5ohyymNR
	02z5IA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge3n0ufcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 10:37:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390890ae83so24669985a.3
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 03:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345428; x=1788950228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3uyQqoBoas0/92LGGm3nVSusdAnQvyayTIQGFu4GaPY=;
        b=I+yZ51SENHgMqUkuBNs2++zAiT+AiLhvL4LGR/v9HYGWHxraCoDaaWl5wDNbZBPyTI
         3ulZCyTX9MActTfJFXZF2gnb3mGzKaRYRZ7CW3/jN84NmVx+j5tbjiNBiYz3mfz/wpw1
         tWpwVeW8CTSJQlqdI2M1RU70aPJJ+8UndsLoYr2HfFBVrK4nPOniHN554PK0+iz6N6KJ
         cH426qe5Ph+G+4ijw4vCYlQjC+h83WlmKTxcA8JNeLadRr2cWAPD+HfK1YkuRUF6iDQw
         NNIAvfZu0P0zlTQ+f9ECd5WxDdbMTK/A8dMMcaD5sGzpzZtdGDVRKvS43Xt3ZjBhCDVZ
         zijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345428; x=1788950228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uyQqoBoas0/92LGGm3nVSusdAnQvyayTIQGFu4GaPY=;
        b=BdNl4cCrPsKJcxDz1gYN7FdzHrZE2HIiHjrBIKM/O/RIP32NXNW7v985eU4Gqbcx++
         4RleByKmsj5EGeqDE0kHkrnd9hMBEidSJzuLCvcG0/2Rz/zOoWw2QtYaZdasT9tPEEJs
         h760XwHzr/QXegRBDNM3r0H1AB736kIAWwcCVEq7jgJFpEprk09dFT7HdRgTe8CxSyRC
         vWkkf5NEjajiYpF22hnSiNMBd6rgb2G5OfQiQmKWu6NOFyDCSbHClOibhcIG1AknNkC+
         I3wPLm0IwtAsVCfH62gyQpY1yaGaTai3KdkoJMfpMcJpJWai8rGUruykGyU7mDzLUkSE
         fD3g==
X-Forwarded-Encrypted: i=1; AHgh+RpAot2kPdEZkG6jL/XUkC5wBDcnJNcB/KcseVrYgSLIB0OCaekk9YiP82Ic96yrQj8JzC9v6+RwbET56Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mkZhU+bH8gG56ZvAvSKFMrLv5yXYJgOUs/E2uQobHDq6ZhE3di
	vFFIF+91NbvymEaAIcfRDA6rs6c9cEJdIewizX1o8+7R9ya+mWyUuaHmudpsHYsVdsNVMw3h6ry
	/xot5HfjsUcxpAuNn3kz02ibiMDU7Od5RULLF7cWLSq+n6fxP6LdABSQA0pYg5DM22Q==
X-Gm-Gg: AR+sD11oN7TGm3WvI/dWw2isRgv8Ckq6mli5p0e3nv/nzrvODAavwegu10RjvY2HOw+
	Y3P6SIXmcMPTfGFHiQvNuJz+aCAOi3lN/k6RjXTgBU+K4fITo/7fs52TOFRqXZdhJYSTLiJoAiD
	r9q/rYSl+3yE/XNCQfMxISCPbY0WqJerHKMb5IAa7v4yqgvSp/3MOFQzH9/SYlOPS1dZH5zGoUV
	V1n+g5Isb33+iv+gkewTbiylsD/HdO/evftACDJOzvk6SFQXao2+SPWksuEA6zj/txKFNGdCMia
	N3xM6zs+z9HcKcF8wEba58GT/wWVnMygD1C5C9oj8+DVabkvSZOK81ZH/A8WrmnHjyn7X0LPuA2
	amtIACEf03PzJHla4olyHPQ==
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr236835885a.4.1788345427702;
        Wed, 02 Sep 2026 03:37:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr236832785a.4.1788345427214;
        Wed, 02 Sep 2026 03:37:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc5d85sm109338866b.1.2026.09.02.03.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:37:06 -0700 (PDT)
Message-ID: <f80683a2-40fc-4c1c-b66e-bcdf90869dfe@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:37:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sdm845/670: Raise CSIPHY timer clock
 limit
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260822-csiphy-sdm845-limits-v1-1-d360bf7cd38f@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260822-csiphy-sdm845-limits-v1-1-d360bf7cd38f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MyBTYWx0ZWRfX59xpUEsBDqTH
 Qi++Ec45EWlJZ8JNKu3af1u2Fn55raUIS99Qnpsr0wELk4dxYlT51o41/BTw1ndibjtE7vMerHD
 9B9IoO4mf25vdxJ7iMQubUECdvC0jet52KLDuk7+Vw1lRf1U9PWQslxajltv0KUdp8h87ZWFsum
 EYTTmfij62WkAwuVN9DICfdf23lzOe6KxojsRQ2erqHo4KI1SXz37WOyqlj0+aml27+yFr4Nl4K
 831cQpKKufOeuh7KsOAnyYZp52j6r2szZDv/oiXfNNtgXNEY/sc4IR6MnPWiELsUsbl/rUfCX70
 V03nMfes0gS7+PT4tfif6rvHTEIJ7jEJZtcYGnm5+udiEXTGbC7JeOwQ1Nt+f9s1P1UrtaiH6IO
 ULe9w/7welKKwtAyJMt55iDlupaKNSWAqEWY3PocRdc2d7eobZE02yLX/fovcC42OAgL6NAcgnZ
 BG5/eRb50QLCCVgI+Ow==
X-Proofpoint-GUID: hpOYx1xk43UY-wAH4vnAGwt1-rOjUhEN
X-Proofpoint-ORIG-GUID: hpOYx1xk43UY-wAH4vnAGwt1-rOjUhEN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MyBTYWx0ZWRfX2qvCT/22GrXG
 p2y7cs1SjemB/BVGxvERzHt7WCus4IEGRm3YtJprnE86/3+ofFrOXHPYnDtR0YK1B1Kjho44D8s
 Bm1KYztM8eM4kvhcTicSSVuzJ4fkzFc=
X-Authority-Analysis: v=2.4 cv=R9oz39RX c=1 sm=1 tr=0 ts=6a97fc54 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=9zb2tplEqV-KQ8uyg_IA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020093

On 8/22/26 4:25 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The sdm845 CSIPHY timer clock only listed up to 269.33 MHz, capping the
> supported CSI link frequency at roughly 1.07 GHz
> (CSIPHY timer = link_freq / 4). The Samsung S5K2X7SP camera runs at a
> 1.15 GHz link frequency, so camss rejected powering up the
> pipeline with 'Pixel clock is too high for CSIPHY'.
> 
> Add a 288 MHz entry to the shared camcc CSIPHY timer frequency table
> (PLL1 VCO 1152 MHz, well within range) and add a 400 MHz entry to the
> sdm845 CSIPHY timer clock_rate tables. The camss min_rate check now
> passes and the timer clock rounds to 288 MHz, matching the ~287.5 MHz
> required by the 1.15 GHz link.
> 
> Assisted-by: tencent:hy3
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Tested on SHIFT 6MQ with next-20260820.

Is that what happens on downstream for this device too? Is there a
chance the sensor link frequency can be lowered?

Generally the latest clock plan for SDM845 says that 269.333 MHz is
a maximum, with the RPMHPD running at TURBO.. I would assume that
while the PLL rate stays the same, the downstream branches and RCGs
may not have been validated to properly function at these freqs

Konrad
