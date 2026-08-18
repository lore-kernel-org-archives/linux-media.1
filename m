Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E76471D13
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 12:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056742; cv=none; b=VPZ8MUqfvRDKIguhJE7iR4pSoLSMm0JnWVsQpFErUmqQwCb8xw1h36au/cqX2aHvAgN8VRbyM/j95M6y/YDHDEI8GnT9XfMS0pZ1oAq/Q72LLFF7L/KjT6eA2v3UiBiWhzGpPmVOyGSXvXDQmwi8Meklng5+JMioZ99hvhLaazk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056742; c=relaxed/simple;
	bh=JVqqgVO28aOmPNQFjfEieBCzpBdmr1OcYzrDUvDwpXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8OIz/Otm9cT6xQywA1hJgLOJ0/ZTrFkzFPsFexARBR4Prcatkgh3/VP709Zn2+ykyLo9on5Lq+mdxNVNjAzWFXp8004uXKQ4UALmivgm1lQh44kvUIzsP6yQCTwFaCtHgkDpWu7nejvpd0E125PrtRSv30EJQ1NmoAuq5VK+ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3+R9c3p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bqJ45ws6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3+R9c3p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bqJ45ws6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABM9j515012
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 12:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p6i3uJtqtqkxWQopaYM06xFCbfQzXPOkukAmrYq7gRM=; b=m3+R9c3p8mKNQ2Fm
	TnHVYQc6bq5sU5ClRHH4jmdZZSIG/xJG4f10mNF7pzmVtmWM+4p5n4peOSfNgiMi
	swXmToRF25mh7miP/zG0unML7w4nXRQLxoA027/eguBq3Ph8IBqD/9i7mgDbuUt1
	O5BuIhFj7GYejMD1OavhKepJs180610OnzmoS8WWrMPpE8RIO2R9H32rwo+XprSH
	1rZS6Ll7REscxbvaV/jYyXy/Fb+ZAbyNQi8UI+nYs9jRUaQuWmuCiQR0T6WJahBe
	qfwQhGqZmIyHCnd6GrcwDhj+YWLgPolhP7JsVTLtoBbvVb2MH7tT3K8m4lz0iDq+
	Jgb//g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2jg3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 12:38:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9349ba88188so118163885a.2
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056734; x=1787661534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6i3uJtqtqkxWQopaYM06xFCbfQzXPOkukAmrYq7gRM=;
        b=bqJ45ws60yMinPTvRt3R57N75UC1n94j2Vm70llnx4Vi1wo9f9KrmiqSI7Y1kIKo9G
         CfC6OI4wZVMTbEimFhz7VSV4m4AMRcDduT5M9fvFDsn1Uefu1IssS5JVENSACnXSPOr7
         NBl06mIM9Y5wt+7nXRHUHhBuZI2yRjxQhWSnhQYE09XoZz9hDLwujfdCt0fdI39QxDCS
         P3kt7bi8w71nCHgwRrI6+0z+f0f6HQSh0iAqt8x0f52bdschBgf1/ehdQybzirwOtGjH
         CdBJ3nWsqHHMX/BJ0X/GdfyDqhW/lV+0z/jwqh8JTJT5dVNZFVZOLIwgTEXpJNdrJ+Zx
         xHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056734; x=1787661534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6i3uJtqtqkxWQopaYM06xFCbfQzXPOkukAmrYq7gRM=;
        b=oHTl2GZhV8YC+K+xisICSANiCgmYsmp8x5rIZadXGqxMHSVOTFPXOIt86EFsvJOHhp
         VG1ZgDCBU6yB2m5hk5MmXYeskIlpjwdGiTZvgc851PBl92rlFTRZCrYsvcUHTkrbLX87
         n8Th6IGQ1gM95pNUDFyDCFpkR3zaNnHAm6/Fov5t0TwsSMbEcgt6EKfO+CIgEvgK/WpS
         eEwWz+ldiEwGNkXhEw39c4o5StNiwtyqbQkYaeuh1MeYF++DaSHGycYd84+ACBx6xZsW
         t6jUWPgXQYXyQW/odIb8FBxi3YfYTZMvu7bcbjyqZGAkUFM3CoLxHKkRt8qQGS/ERviD
         9GkA==
X-Gm-Message-State: AOJu0YxgdZFaA0pTFUP+y8Dmtb1UG3BFoKbRsihep0fQOTxcNFauE8kS
	2iXWFb/r3mokbYCcw2QEYUeCIxPiUx1nyfkibqXnfKsxMed3KHvK9Jex+CGj68eGXfH2DBrTYHf
	dtBcHfKLMXvw0LnydO2JBJoh+CQhjej2jcPO1O6sLY/lWLdtj9Wyyvy/KfxAaMxPMPg==
X-Gm-Gg: AR+sD13U8MpO34Pl2wpGFf+BqxsY0iFnuQsHQHz7uZM46R1qOie2BAI5+AupV2+kuHk
	CCVvMCAlyw85/cIfk87ghNgRIeQ1+PWsiG7AL8FNQBY+X7zYEGvpC9+exuZkBcL2gczy85HVn/C
	d4B3I0uHZNkM0aXiNrU4gbYLGsoxxee24jhTbUAm5ocrJmEcsrF9YHyf5DqH3LQoxPkXP8RvfHG
	EiYICLVA0rS/eYY74ErrCJqe6tglJimWllMOt/pbeLKMg01eOl3sG0pJaWXYVq6tAuCjzNfh9gU
	HgexjZ+ZsUZ2gx3CaSti9bN8V/1lJASOEr2cer+5alXnlJF0/0khxGLqnNcTb6uOi+ZDoKWGrZW
	ln8rKiVDmx5EgA0aDzUrfwkPX
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr242361541cf.1.1787056733757;
        Tue, 18 Aug 2026 05:38:53 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr242361131cf.1.1787056733290;
        Tue, 18 Aug 2026 05:38:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d859b274sm1687339a12.25.2026.08.18.05.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:38:52 -0700 (PDT)
Message-ID: <d6c0ac1a-11d0-4179-be33-7a6a4da7ef22@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:38:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7325-nothing-spacewar: Add front
 camera support
To: Danila Tikhonov <danila@mainlining.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>, Vasiliy Doylov <neko@altlinux.org>,
        Achill Gilgenast <achill@achill.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260805-imx471-v1-0-7be79f539ed8@mainlining.org>
 <20260805-imx471-v1-4-7be79f539ed8@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260805-imx471-v1-4-7be79f539ed8@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX4K8TdnaDnTUt
 UD9sv1dFdL8e3tIpKznJ5UyfQX2V3p6gs8Z1sTA+ztcsChLOoaUOYS6PDUUrFMG4BwGzlKUQIeM
 o/CzWYFKZUajAMpkt+/AqdToJR5tt6uzpLb0Rh/hM+CYJCb6aK3MIp/BXDkCpsLeKwdxCMc5bU6
 qgsqTWiomRwulPumfesTLXeb8bcLLDcwSLRmXjJFtnhYkTjLoAE6PSsnTMFSuzvYM5KUKM3y3vS
 EogUQiC4vucjN4GxaGlP+dXZIuPeuUpX4R4nRXZYdiV6bwXEqQ2ifwmSzTOdVOx+RKM1B7DO0ER
 K/DiTV5R3UGZ+Z7dMmYsTv/s2DJP/vcJwWNQe5SbOPgd51fCwxOHBTegMNDaO1qIFhCJ3N6N5rP
 4+0Opmj28z6L8cAk0/ExUAlHj9B3ibRxGVPZsflyq5N3I0o0Mgh+SfinyA8koGA0F5h4CL4YYlM
 HOtkcAAMwYjZ2PTup/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX1slUzoSNjtB5
 1QSnpwg+zFhuzzDO5CvLXCBDbciEWAfaWz+5qawyi29FB1twQHaxQHoFtfmAmSKVnDeBwnYTehi
 52mBIjrLtCV7fdec4MFraY/h9tSqtVo=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a84525e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=OuZLqq7tAAAA:8 a=3plRurMU6km3PuHKtsYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=D0XLA9XvdZm18NrgonBM:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: bVL8N5Iwdk6e_6hF_R78Hm3QA04uHcmY
X-Proofpoint-GUID: bVL8N5Iwdk6e_6hF_R78Hm3QA04uHcmY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180093

On 8/5/26 9:54 PM, Danila Tikhonov wrote:
> Add and configure the necessary nodes to enable the front camera
> (Sony IMX471), connected to CSIPHY 0.
> 
> Signed-off-by: Danila Tikhonov <danila@mainlining.org>
> ---

[...]

>  &cci0_i2c0 {
> -	/* D-PHY sony,imx471 (Front) @ 0x1a */
> +	camf_imx471: camera@1a {
> +		compatible = "sony,imx471";
> +		reg = <0x1a>;
> +
> +		vana-supply = <&vreg_camf_vana_2p8>;
> +		vdig-supply = <&vreg_camf_vdig_1p1>;
> +		vif-supply = <&vreg_cam_vio_1p8>;
> +
> +		clocks = <&camcc CAM_CC_MCLK0_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK0_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		reset-gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_mclk0_default>;
> +		pinctrl-names = "default";

Don't you want to also configure the reset pinmux/cfg?

> +
> +		orientation = <0>; /* Front facing */

Please incorporate

https://lore.kernel.org/lkml/20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com/

Konrad
