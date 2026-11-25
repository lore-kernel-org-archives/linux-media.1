Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608418;
	b=4DJgVTAkjgswtNADsKO/f8068iQCw9kBpOaxIbRrx0Yu+ZgpiTbmm95bxiEg9BYYSpyo
	 jcymNqO8X3VutyfDFS/xnEidu3rGaMfjkborVh7yjlY43XRGeSTKVXPjr+1m1spmv4WKF
	 QP8TH42tyCIxTwx9G3yMHFIs/IIv0HetHg4lhdXAvWzTyLP4rIlclMAxQM07U9TCyU1X7
	 /f0+qzGu4J4M9RClMmkDJMhsN+vBa36Kq16zWDWPFX4qhglFKw+GwjuiPv+MYHSn0DI4R
	 7kUuhWHMEFWduN87mU4yMuF/lDJaHVDyfucTZ8OgS0nvlDko8XHW++mcxHm/Wx5qLWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608418;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZGmtiss+37jmH+iF3YqbwmD4+9FY1uTsN9kR+qeAjgg=;
	b=h8Y2EqF00Kx544IBFLNQiiHV2mJy+CHf2XpAM7I9yuWCE+GNDFdEa9WDAXfaSBHuRJLW
	 JhDt89ylhT9aK3XSxGsdIBaMrH4ZSdWSlDDUcbS7hpL8OojZBC/qlh9DGYCYzCq8Pl/il
	 MFLizIMPYxvknXjHdaXWikyP39q95p7zJrJIE9pQU02cmwln9HNtQ42vasnT0EJqg2hsx
	 P3sNev/npPcLsslOMeebHlbqKLhUgegsrWTjyvmg/fnh039kvgwMUrLk+AvSDzELvBoju
	 CK0FhVk/ThocRs5sFrFyvZwa+RWSkI+KEZLRawwNk4/Wc+lUYZ3S/tLxe9F1lCwASkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="c33gkj/k";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JBelHp8P;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0843606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0843606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c33gkj/k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JBelHp8P
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mi2D3642223
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGmtiss+37jmH+iF3YqbwmD4+9FY1uTsN9kR+qeAjgg=; b=c33gkj/k+xAEBid9
	cfhgRNxHmvmdPnEq4qHSgM9+ksQzj4QTwJXo5Gb3+tuH2AdvABDNf2ReNSrx11BX
	ZvdpJpMdIzJO/r0xRfzYNai16w1ncvLhqanYSJYKEXfleFCzeGyryHkliEifQP+f
	4lXToPQZTfaCwwXbABBr+FvRKF2407zO8Mes+dOLOYb0xY3FJZqTHIwrHpeR6mef
	uX8v6iOwM6zb5T2brTgYzdwdvF9Qh92De+cm2Azq+yPaXKRz/1own6DQ+R9Nno+u
	PSn6w27GkD+e1tWGjtgBcEJMvIHgmKGgwWh3u816mACC7tKBbUwCLZ1hwz3ZBjbU
	oyU99A==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2ar9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:06:56 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-71ae9b6983eso2804599eaf.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 04:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795608416; x=1796213216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGmtiss+37jmH+iF3YqbwmD4+9FY1uTsN9kR+qeAjgg=;
        b=JBelHp8PYeYvJWv5yXwp76t1+psSz3hHYlxvr8gpegVtPVZHfCthYR/5s84HsX6l4+
         WkSGlLz4IBhlLK0CQVY8AT3I4VCXWwBBBDq2z2R6JnT3snSCPrPcw3VIODUaXkjEtusK
         5Zi9C+iR18AMshObC8sYCHl2iDqCdhAQJiTgy6Mde/joZcmKhmzNhOmQONXsg1y/x8G8
         vzFXbvuWggRVpETibif4eE7NSSMyV0/kjmRnW+NzHCnFqqUCo02GUgN5dfJEQEctY5N0
         jvNLT8SIg/eG80HXGhTCl6j2lpWbSvaKPVzAhZdMYG+t0kmx550WYdA5rZ3X++PKMEZq
         47wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608416; x=1796213216;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGmtiss+37jmH+iF3YqbwmD4+9FY1uTsN9kR+qeAjgg=;
        b=V3nC6fUKTJhIUp9LsbptbANmIj2ZAMzIrm4vMuc2mJQz639KQuOT5GplpINT867DF0
         cggj3c+bdQKBxa/Ut5xtUyH+GHHt3DtGOlADwZyTv+dLVbe57FIfez89z0fd44NzzA16
         TbmJZ73D7YV8O71cRy//5heSsz2Tx5VGNlodu2WwwajtplzIS5cpPzStUz4BBGCgg41S
         U2zYmKPYp8lskkohKwYUnlTYJe+16bM61esOxdg6hzhKyl4wqFDtadE+v/kEUYaRM3LE
         ewOEOxKeUmMLnLzqeg7FpJ1MWP/Dq1sx+7PuT6HwmR+lsVRFYZjbeviqMDGLJpGQGbMc
         MBlQ==
X-Forwarded-Encrypted: i=1; AL+hErGTzEdLdNzqjDcdiaCcf4zwav9vRvmPsrCzzK38l8UtE/i0+4TNannhvVJpLIQuCIRpy5THhXmjlsGPOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZZMs60XBg7FT7nNem5iCE7Oo3mqCvL0+BlSWROPPRXCgrkVpg
	7D43etKTEXbLBAZlSaMaAsv8zIdpwvA02duigJ0R1WJmijsZD07jozL2x9iF65IZNe3IjJo7HfZ
	cgBOh3BiEDAmHwAamvP7/sayuWbakiwIdX/NvTGNgB/4C62NiS0dJcmHjT1o7OQQPNVi3CthbEg
	==
X-Gm-Gg: AZFdTZfWV3H7Aje2MvLNUSaHq+xedAYTO6Yi4htyHsk0wGOGM88PyxifVA0nyuSxuUE
	i+iO36RNNDGEfY9FMklAS/fy5hOqjYQATItCsPbdSL6WxlpxPnA0HDE3c10E22lKxIqskTQ8Wip
	4s01fFKhk7gmcHEerQ1gqjkKG2IA83k1jZuF55zDFslKb++AVVS6/tD4pNLeh951wD8U4YC1r5j
	9/ZRVagHJhk/SUukCscIfIpvPwyVkGGpRvV4lbjycNjKlzyu1e24en6M/0zUQh5KO7oZUkxykN9
	aYQpF3DIv5SZ4w1gCfu1geB8yr7cO1/OVR30F1izZHrupQuHOF7q9/5ZUNgNNhlW8RSGZJqZWxR
	EF3Uw9vZ+ZdM/w3+rKt17b6soE82KR+aaRKVS2A5nC5CM9xqFctwortXfm3A7AQufWFi3qAj71d
	95EA==
X-Received: by 2002:a05:6820:1504:b0:71b:8238:4e19 with SMTP id 006d021491bc7-71b82385426mr387381eaf.5.1795608415795;
        Wed, 25 Nov 2026 04:06:55 -0800 (PST)
X-Received: by 2002:a05:6a00:1817:b0:8a0:5f63:5521 with SMTP id d2e1a72fcca58-8c8792bef60mr15376338b3a.8.1795608034103;
        Wed, 25 Nov 2026 04:00:34 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm9045190b3a.7.2026.11.25.04.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:00:33 -0800 (PST)
Message-ID: <e93eee16-df8d-4d49-ae56-3e6ba9c31167@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 17:30:26 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] phy: qcom-mipi-csi2: Add Hawi support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
References: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
 <20261125-hawi-maili-camss-v5-3-1483b7f68dce@oss.qualcomm.com>
 <15cde6af-0b9f-4a0f-9d21-4e5ca9107a67@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <15cde6af-0b9f-4a0f-9d21-4e5ca9107a67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06cf60 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=zU3wpra9rdAe81a_7icA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: cwYzkq3lBrExCJjVDtKAMREtjskaVQDr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0OCBTYWx0ZWRfX6LnIWnt76dex
 V+ioRyD/EdihrGxXw2EDeuhCvs2uY7RsvNX2x4LWDbRA8QqUHoE0Idt9LpTAqjrWDfj4686RHu5
 shkGBlHBEXsGtsLNCfw6X5XnUHnNhcR5wgt56bHcSymQXq9ur6Q/eyThx1+aBn9Ljtu0C2L5IUN
 1gZDwEgGBK/yn2vFcRFlgUgH+JIg2qVmWmkjbySCQdZXsEvnaC/bf0R+3A1vfVygdwKtOHzGGUV
 xDTFH3ZsPpOkzWkJSAeWFmq1bDgz+bHxYb7c0cl7rdltijZXGhTDdrkoD+CFMjUEt40g/8ecwBv
 syKih/zWNjbB19iAeAWZNapHXYXytShcosudjktCxpqzvSYg2QQTAmznuPcJY4Qjl96HwiuZtaM
 iFi0rBu/LTgkmPNCEWikyk57T5Sw8hJaU64jmWszelf33G+lEXRbwDj6lPjWg0FNrKZFZNYZdSy
 oK/Nr3ZPK1ppDFxHSpA==
X-Proofpoint-ORIG-GUID: cwYzkq3lBrExCJjVDtKAMREtjskaVQDr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0OCBTYWx0ZWRfXzUqBmY+8LJSj
 x9MvzONse5ymT9CgYEI/Ll0LSayEQnDWBPUFJCifO/BF3AbDfSrDVGTKcGIij/fb+khlpl7QtqL
 iq9bRhSczmA0W956T3e0q+h4FRP7XaE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250048

Hi Konrad,

On 25-11-2026 16:23, Konrad Dybcio wrote:
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> index ed40934d67eaeba0c6ac7ac75324ac6292fe7d9e..5d91303e0df2e8c5bca3ea8fa2bb831429a8f1ff 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> @@ -162,6 +162,126 @@ mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
>>  	{.reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
>>  };
>>  
>> +/* 2nm 2PH 2p5Gbps 4 lane DPHY mode, Kaanapali table with data-lane CTRL0 0x8c */
> nit: 2ph and DPHY are synonymous, if you rename the struct to something
> like lane_regs_hawi_dphy, we no longer need this comment.
ACK

> 
> As for the override, if its meaning is well-known (the difference is bit1
> being set or not), we can add some sort of a booelan override instead of
> duplicating the table, maybe
This is not a boolean difference. Bit 7 enables PGM delay in both
values. The difference is the programmed delay value:
X1E uses 0x0e, Hawi uses 0x0c.

Since this may vary with other PHY tuning values, I would keep the
SoC-specific table.

-- 
Regards,
Nihal Kumar Gupta

