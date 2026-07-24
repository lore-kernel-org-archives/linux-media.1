Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC283EAC74
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891721; cv=none; b=B+BZQAv+L1kOuPY0U9vxXB6CV3m3e/sEZIq85vBsEHfWdk38vKoVzU8mX4wa19rYzBeBQ2V7P+aoTruF9yvACBtWK0AWKaXXj/UNA9n2HlBXSUUBTSEg2ojeApzkvhU8Ib8wbYNudyTHMFmHyBXWhnrlkuSx5hm7XBUCvXCZLwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891721; c=relaxed/simple;
	bh=NLsfiK/bjz993utqebyrcPcVbe9fcrRODRXzucOr8/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnsp2Lowr4kIdTBWNQ6SKO6K36xjUy1fEwJrtgkrwhQvtfweakizp6Yj4olQvgdjvPFgu0cMigg/KVtdv6UFfVgFTfQhLAzsnVGA4db2GRhEPYxh5T3oGtGCPECm3FiviveJlQW9BNEIytfPmTvRiR7HTqIZ3pdfzY8Y9cwSj/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ci0mhrQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TndGFe69; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ci0mhrQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TndGFe69"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAE5fg2256702
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 11:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pWBEjqDwcWAFORTeA0+h9sqF
	40WLlT+TSIZr2L/YESQ=; b=ci0mhrQhzqUOrtdkU0hKBEFGKQD9WW4LFmglLHid
	Qz+yCYJQBjHXeAl+D+BeAJHzoAPwYJkCVe1JnOEDFxd48ZC7jiYAglKgHzFzb1vG
	rBHY0hPb4NihtR00VtW5Cq9CnwSWazAAslCzunwAyQEBc1QytSZ4oxvvQF9QXmS8
	0gScIHmBx0IuWjcCRMhXnMlRQVurpFr/N67GKUn28Dn01EiPMHv2iSNeMTh97PNC
	358kTq4dnwT612Op0dAlOOqPfJK1G0mDqzlrx/OMUxScLAuWtnmKS07Qd9ExlB/Y
	khJ3OpPNzt3PCIkhYH7KiG1TFPj+bqW4DyoszQSxV/zY6g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkusrtd8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 11:15:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so5890141cf.1
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 04:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784891714; x=1785496514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pWBEjqDwcWAFORTeA0+h9sqF40WLlT+TSIZr2L/YESQ=;
        b=TndGFe69RpcF+Mmjttc4jihnKLW8JkkBC6TyZJ/VTXzk1nWKyhIrvwr97+gcjjt9rD
         R1xBbskJLO9IAa1cUc+3eLYzfowLhDKAOevgIkBLFK+i+SWBz8rd/S/+W/sk5rzN6vgt
         pce/+BeZhnvgcelXLpcT89aamHv8rTihJeU1ZRonB9yX6ihbLzLt2MzLWgcHvRLbZy/C
         V2ux60T9Rm33+TW/E04p1romo1YUfFROPMOCo2u4KeX+Cz2nVU2ivKpw7NiyNAjtTdfx
         TkXk9hPt7OaGTaYgou1bhhxVFX2yhHkRazANQOztnPaIRUDmd70EHuXY12jKGa5WOweZ
         3qcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784891714; x=1785496514;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWBEjqDwcWAFORTeA0+h9sqF40WLlT+TSIZr2L/YESQ=;
        b=BinlUX0dj0H1FcP29xPfB0sLhEarZwdaRY0yaiDsY8X9+Bo5j5QnuszI6wVghI9tlz
         LJX/zkDlz89hb8lsOfJQa+YKqROVemtzAnkN+xc5ospQx5Im29LJBm0aaeET/et/+OH0
         1lqpOH8YdlW0zkRkibeeVICaiEEvGtyqAyNe36neV7e+MB5mpS+uWP1YNYu3IeZvhqBg
         eal4vxmd2N0Bex+xzSJIyI8n7VExSZ18gBxDue5ETFlGnm+C4wBm3haImt5PNiSjCjoJ
         KXGW/31TeoPeUbyw9CPJ7rzKqpgWeD+mc4U7SaDnvltn8fZ3M1n73zlTgHpmqndKcsjX
         ybcA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6zl17EBqQwk5gHWAL/1wrYKhrC+xoKnuB/fKAcGbX14ALfghBssY1eiemkBe+HyCRQqJ9pn2MicjPlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YykzEcLZy4176XJBHpnq9g+Z5V2q+YKJ2UGbh7ibAkXGvB1Z5Zp
	DBTDjCUV1edq8PQvwbT2KousTA4I8lXh2dUydnooUC/5jY5uSs6qmvHxS2SVEmOMI2pPR/2bqzv
	VnH/ey3/g+YIopPKAXXm9aKeOIcCnctjh19ZFIYZTegF7YXc/a+jGCeJoV2vJgSrZ2g==
X-Gm-Gg: AR+sD10UGihmXe30pnouUAZKx+fQ9J2mTZcyj6FBaJf0iSXyWvNAtlSos7+r/PIAXzp
	gQgOVX1unknnL7z3IKjJdnPqvdxnbHDNyR7fctCgU0v2FnURG2jqPo+j1kyKvtx6OgjQ0JQwr/g
	WkEawMiWiQQ6zwfVgG9Jma0Eqh69vZqRNORlghk+40PehbBhpGNqFCPsbeo+8TMHVRNJENMQSkN
	D5CR/qhjQo8T4fZQLlnvMa4Z6Ei6+zt2QaO4EMvO+XfUMN49fD9kBBgb6aqTeDoHJPqdZU0sbJ9
	ko8YM2fobu58IUEa/QHYdJDK1mcieRg9N4fs2ByTG/nVO7Xyc4Xx3LtLp4C9gqHuzN+17n7CWcf
	6EAlUm3HW9Unzn+CxgTpoiLYUqYJGzvSp6S6RuoqEqGEqaV68/a5vf+YfzHCw76fxhc4R/KxDm5
	Y8EKW6TOYM2/bofg==
X-Received: by 2002:ac8:5941:0:b0:51b:efbb:fbf with SMTP id d75a77b69052e-5283ddb06dfmr69298701cf.18.1784891714352;
        Fri, 24 Jul 2026 04:15:14 -0700 (PDT)
X-Received: by 2002:ac8:5941:0:b0:51b:efbb:fbf with SMTP id d75a77b69052e-5283ddb06dfmr69298111cf.18.1784891713842;
        Fri, 24 Jul 2026 04:15:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68883dbsm13547251fa.2.2026.07.24.04.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 04:15:12 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:15:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 01/11] dt-bindings: media: qcom,sm8550-iris: Add vpu
 sub nodes
Message-ID: <em7loyijdpav6chk7pslmz3u7cifqbopyoutwbuhjjhs4whmmc@zg5o22m2xrej>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwMSBTYWx0ZWRfX2lrZ1R3Iz/pN
 3wOZYUa9D53X637zNnrIvh9PJEy0OmnNBV6C6pNRzGpfSPpUnU2KrSqHqcWZeAfGvXDD2OjOSBO
 yhP6xGdVg6jONrWIxthue4yz+hAa+R4=
X-Proofpoint-ORIG-GUID: 7ysRxQAxa1TWV88yIV7alCs3ihoMJ986
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwMSBTYWx0ZWRfX2ydn4rZkmrKO
 bia16CRvOM6DAUm9mRNi2oclOFNfXNra2KJHlHn3Z99fbSnNGBG/UTIP8SzWDf1o2DvfSHbruFy
 euH63LsN6AyYaSVQEnT35zct/xCf/UvmdESUenKhQfZosLV3zInCnFVSi8472S1yCRhB1wv2qyO
 4y0ypuJjNQhprjouhMiJ6GQ4denXJxQhClq0nw26okKDclGOgF/elkens52ZAfsPcF+dXKPvIep
 SFCsQAqJKM/CezLD5xA2c0Y3tFLbOZaTgc16lmXdxz0sLibyiXvbZGfwPwPevkAgYPXiGfIfYcF
 za5YmBGdfD1xTF+5ruoNTpxTKwbNrKOYBKnde/QrZ1oVvzF0h2ikNlSRzpcGNGVjN5gpcMklUD9
 aJUZ5RPry2uzCuiILk3vw0FS5sSxufxqbvDOAW+6yethSDIIAUfssdvyQA+DofWGYjjzx0LjHoO
 NtX7OeQo46RD6ekW4tQ==
X-Authority-Analysis: v=2.4 cv=PtejqQM3 c=1 sm=1 tr=0 ts=6a634943 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=Myr9REOcfyVB5ZbP5wAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 7ysRxQAxa1TWV88yIV7alCs3ihoMJ986
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240101

On Thu, Jul 09, 2026 at 06:05:47PM +0530, Vikash Garodia wrote:
> VPU hardwares have a limitation where VPU streams are associated with
> dedicated addressable address range, as illustrated below
> 
>     +-----------------------------------------------------------+
>     | Stream A reserved region (600 MB)                         |
>     | 0x00000000 - 0x25800000                                   |
>     +-----------------------------------------------------------+
>     | Stream B reserved region (3.5 GB)                         |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | Other reserved regions                                    |
>     +-----------------------------------------------------------+
> 
> Mapping a stream outside its expected range can cause unintended
> behavior, including device crashes, as reported at:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> To address this limitation, the subset of stream/s are now represented as
> sub nodes, so that they can be associated to the respective addressable
> range.
> The limitation could be exposed when running usecase like concurrent
> video sessions. The binding have been validated with higher concurrent
> sessions across the SOCs supported under this schema.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8550-iris.yaml           | 66 +++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 3 deletions(-)
> 
> +
> +  firmware:

Venus devices have been using 'video-firmware' here. Can we please use
that name? Or I'd ask differently: what is the reason for deviating from
the name that has already been used?

> +    type: object
> +    description:
> +      Firmware context bank represents the firmware processing domain of the VPU. Required to boot
> +      VPU when no hypervisor is present.
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +    additionalProperties: false
> +

-- 
With best wishes
Dmitry
