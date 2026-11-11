Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403080;
	b=QqcF8o6tLwbU5jc68UxNke/5GvxdoeiP6B2B6QoBHnNJrKDQT5tRz/pG8zQOjV+Rzu08
	 Xfv6+24j+2dMdEFAUiweOMMffDLbNoNfhYpFIbFwe97vhssviefFCGWjNv4aQ9woss4xp
	 7rVHu/wq16z8BZhXBFggCYxyVvc3w+bm/ObuSo+nGBsSFIrQ8G8oO7D1rplSTYCR8krjo
	 sHw5q8H9dDp1mcFiNjbG2Y3MSjtEeEuLOLtQplRNdFs1nlto0jkg9cI/N1ohrYOLQuJDV
	 sDJyz7dIZpl8nqTO8ylrNgKEwas3+FQHOYMFJvFxwzaLjXQZ5QLw5VEZnIK8kDPZ0Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rJPCHE8Tetc6T6Zx5wds0tJANIOD/gQ8/VVy3tOE6x0=;
	b=Xtr3+OYBJ0Bye/MPTfAXwXACNLSIRLYt787V/SxbDTrAlr6FNHTXGXrVAWuulg+SKa8f
	 /B30eU6NWcWHaO0a1sqCw+l28LMgMGEN2ywtoEKnvVl1hPc8vBPcvf/wZxpaEe5BGYjYx
	 5q0G98Tb2OX526O+vRPcvRBB5byR2oux59JSm17I9gvpcNmJE0DfD5WIM4iowBOo/NdFp
	 NjWj5EbKALrxnFHUSac+pPoLbfdNcpfGlaNwpjE4ea3JvXve7jpQc9N4oCiLH4CD3yLS6
	 n+WPMkiP2/uChhAp1oP/Lg4g45RUEEf7WeiKAXh6tSdH7VwgEd14ge4lDHtvsapNxHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LG7PUXik;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aURViFfN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F948606A33D
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F948606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LG7PUXik;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aURViFfN
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZEh62001872
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rJPCHE8Tetc6T6Zx5wds0tJA
	NIOD/gQ8/VVy3tOE6x0=; b=LG7PUXikLDPaAgezLLNNCNrPtW9zK3iCE1T8LagM
	7/oWUez+nMSLKYJmTZQ3FdCiE3ePS+DmXvuiGd3u6r0P8YbBRo4arqZJNZTEsBGl
	UUl5Fe5A4QAztxLviTgE4KNPdqI5sEi7uIo4uuw8hG0cI/Ohmtq6QGUl3H9wCGLx
	fF57U2cBuYVm2Mh2neOr7SChJFOYWZXVBx+eVkxplTHMvPei1FeLbYuoV9PT4Pma
	9xJdO3jmhhgKvevKQvDYoSwvz8KCl0kYk2zHzRgOEQybZ3uUX33VeLIOtJxlJWZ5
	TqQv2hwKv+TEm+zhmTPtsZgM7YypuzmwWyIGzC5wkRucQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh2rrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:17:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso635806785a.0
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 05:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794403078; x=1795007878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rJPCHE8Tetc6T6Zx5wds0tJANIOD/gQ8/VVy3tOE6x0=;
        b=aURViFfNAZtsojK4Qbwlbj9yjKG+uxQ1/mEDFfHrWjD1x30roFfnbCeH6p8lQXRT+V
         2OTYV76EPkLjrOiLt5F/uIs0biUy5ZHNzH4RPZOayvgzDKB9Nbb4SBRXtFxNUJyD61Y6
         rxRzdlONfFwFqGweDas4bR9SbkUmRRrNU9n4733FlYu09mig1H1d6yEmrlRiGUglrKJX
         vszvUg66TexC/rEegClhxYwSi/kjj7OaS9zStlPax3chbq78R7XYL5r3dxE31NgWILuZ
         GIduPZd3HXIMs7Du1UIcp0LwrYPxsK0wNKvMjAHnlt3XFOxvSCYqwKuTlN5tMpxQd3Sy
         C7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403078; x=1795007878;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJPCHE8Tetc6T6Zx5wds0tJANIOD/gQ8/VVy3tOE6x0=;
        b=LzDxZLbez0Vl8SRL/tvSZLFV1RXcQI6rA9rV2kCqgwEn51IoU92haY//FqJ9G6Gpk9
         Yo02k3TKCqd3atfyGpvfUwE1Iw9cDUtlCdp2bmQjk64qmxXOTbxKZWRvN6qHwoh/KPag
         WgcyiWV7y2Ige5v7caIU4qWKPswIvscpOcV+bJUYf4VunY0/X4v+m5KXNwfBw6Eq7pov
         5QeORSXsUl5vwel8YJskeu5of3oi5pxRnBt3UHMswrTVvq/Dn1//g5fr0+hzBSL+zcFf
         kbNYYSPvYV+jaNsoyBnqrMsuQKmP0g+pYKbkty/JDRCylhZRNTPkHKfYU1CfbFPMQBR5
         U5BQ==
X-Gm-Message-State: APuU4Z9/zV8T1nLNjURIqQ7GuKoD41zrVdQyJQvSvi45hjvKVZA1aI60
	fYkVlbEqC5iNDKPEfzCHIB+5UWkjcUrluNXJJpEdTWgZsSvV+q4lSxRBgN9hRmFNYY7i1Zyucu6
	L0wnSdZu5ZjJd+LVsPKiURkVwixUW/jxAU+CqS4c3eDnNigse4HWhJ+IshcwYD29y02lPvG3aMQ
	==
X-Gm-Gg: AYBFou2deaPrA4koMJUVyc279c284Ao9MmiktB+7OCwdmZjIej1joKpvJbFJNdpxJMn
	22/STuQPwCfW4DA+Liu3tJ9psA4r/pJltDPimUt9mVaV+O1C5R6i3rDnJu/Ql2yV+R1nr6eJGsx
	9CyGjYoztHqVM93/z/jpXGEfZEQSIveiJ7/mY14xedTN/rl826+HtZh3z1UGIGEYtTxJiba8Bqn
	A5XczH3Z7yMPalj6vjglt/iFwZqVh44LE+OjbkDN4djGzetfzqgKwqizfompRwfsLckaQg5FS3v
	sZJ10bY9SCzR0JDfOIWK9znPIq84svwTc8taANGO8Qn/sYbfGOwJFfGYywnNWtAQvMefmp6v69q
	5jov9MMPZsutOWxF/l2LF3mBzFAEUPwV4wt5ApwMrmHVUsZl58rDQjyYZrFK9oQk82kT8sg/l1u
	Gumxrag4nNlpX5CZcV/aaKewePzpbASxCKN/bqzdq7bF7Af1RwZ+h4YDLepd7rhQ==
X-Received: by 2002:a05:620a:198d:b0:93f:231:9ff with SMTP id af79cd13be357-947ae87a080mr421669185a.27.1794403077801;
        Wed, 11 Nov 2026 05:17:57 -0800 (PST)
X-Received: by 2002:a05:620a:198d:b0:93f:231:9ff with SMTP id af79cd13be357-947ae87a080mr421664885a.27.1794403077349;
        Wed, 11 Nov 2026 05:17:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15b8890bfsm563193e87.15.2026.11.11.05.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:17:56 -0800 (PST)
Date: Wed, 11 Nov 2026 15:17:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 7/8] arm64: dts: qcom: kodiak: Add JPEG encoder node
Message-ID: <dvahgos7b47kdbv4wxec46lxvrfny5wounhxgnzdo3uxqlwkds@22fjhubli4tc>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
 <20261110163909.78085-8-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110163909.78085-8-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX6hXx1BZOhmrz
 qOwSZMZgUriaUwvRVujNamAK2E/VGc/+Iku5PuBPQAePnBEoP8/7LkPuyhkr4lclQ2MMjRTT2nu
 fAqZ86GSYrGVOUzioWrzmTk9+H+vG8Y=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af46b06 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=iS208GUargVqoEZNhgwA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: gcC_komVOxuLOPTYLi3APDQ7qqlMQ3Gl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX1vve/uWZNCP7
 vR6ZIMkGyoC5TuO8x5xtZCVE3aelkbUAH2QeEUP6MDZPPGnskmcNoP/d9KkoBeDcctgVcUZBQDL
 R0mQ10XUCEpUW/whw06RWfJpBdZ7YvQEE3MzMn2VvlM6/ktSrlcJpJ0qwMful+YHQdZ1Lrh01t7
 koGLk3daygjamO33nGxJNODDeT8VWV5rk1ILGfI+aOUNU4/L6M3Npy+qfpbrv0ULlEiHvGD/5DG
 LMy0zT/4w2tcnNyy64tiHgUcmsBXNSYGxVOzOVMxB+ZlYG+Ddooh2Ob2f2DIF5tCJQXD2Of2BN3
 vBt/uIq1TMdvQMahOMEOEUkBR/HL2m0cV2lN/bYZf1NoFZEPWU28xrWMQGUqLHQ0X3XcOcvurdk
 XrUBu4vk1gJmj/EYHPhpHiP1pDRlQrHdRkdC6N5Dvp/UK2tNUnPOkEXw2992RE0DhYyO1bEi/0X
 MjxBmsn8KauucfUbSJQ==
X-Proofpoint-ORIG-GUID: gcC_komVOxuLOPTYLi3APDQ7qqlMQ3Gl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110052

On Tue, Nov 10, 2026 at 06:39:08PM +0200, Atanas Filipov wrote:
> Add the JPEG encoder hardware node to the SC7280 (Kodiak) device tree
> so the qcom-jpeg V4L2 encoder driver can bind and operate on this
> platform. The node is disabled by default.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 67 ++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 8c7523602d271..b46fbf5ebbeed 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5164,6 +5164,73 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		jpeg_enc: jpeg-encoder@ac4e000 {
> +			compatible = "qcom,sc7280-jpeg-enc";
> +			status = "disabled";

Same comment. Enable it by default.

> +
> +			reg = <0x0 0x0ac4e000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd SC7280_CX>;
> +			power-domain-names = "titan_top", "cx";

The same, drop cx. Also the PLLs on Kodiak are clocked by MX domain, so
MX should be listed here (and used to cast required votes on the MX
rail).

-- 
With best wishes
Dmitry
