Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7789B4DDB5F
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081996; cv=none; b=SRbQPHIKM9gQp6D+b7sa885QjIv+SI16TILxYH9ha1ajTxoXlqkRTn4bb4ALuQiHHrsJy/fdNt5rHs5ePV7LcE7Mp7wQO7mqXcDaZ5MwYS2m44Vq6dfZButo5t6XkCph82EBcVGFkrwFQVt0UPP4ZjfiRObISvZfkBfLJPxRxjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081996; c=relaxed/simple;
	bh=8GgRFTvdkZTLwU8sEzbVj60ny4PaVMNkfY2LkfBn7gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gi/ddCh+wYbRG7w9f98+p1apA163f4vvbj+Xh1XytNYclsL+KwzjhpOkjREA5LxVUuwjZESZBniYnI2xkixfisNKwCGpdAUx+mn71zafzn9R2ibGF+Esp0RBwOlUtpM54u+elJPQKqRrpRoJrhX70mPF5roEwh9q7KpbUzRpTsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GcKRdATF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dk/CYH8V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GcKRdATF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dk/CYH8V"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPDRP620047
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=24nvX1TJGWoOIXKdPCihYhYy
	Gf+Fdgo4j/yi1DrWoEQ=; b=GcKRdATFNSz2dDkn3chhXt4IugWSiezzYmaNOZ+6
	6QzKlZZcCJ6tNk7aYB7++k08PTuxb7vb5biZXw68eCUckJ8XPjtv83lJ6OaTTO4L
	STOxhBzZHZxAPzz+EBQzFwr+m56mSQ7I8JkghZQhS6hGlL9TikjWlSvGoCxmbvs1
	0pwbFx0A6roUxuCtSByyGDrTiPrCd/avq9BpPc5DdVzhLSmfe8Ekzb95eZwl8pYZ
	MOkO+UhY/GB7W3od+BE5mV1u8SnPEGkY41iFPAnRtdHxzkvbjrykXHJurrnj4SKa
	Qzbb7cvbBpCL/VGhvaYMVEeLXcc+hU6DzRrUqT2s1VuLZw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5tbpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:59:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-912054a1c29so59801886d6.2
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 05:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081991; x=1790686791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=24nvX1TJGWoOIXKdPCihYhYyGf+Fdgo4j/yi1DrWoEQ=;
        b=dk/CYH8VP6m8TbGZ/mobUXqiJ1PBUKchk4xS8YbhyabYfAqKlABgM8x33T+J7lgi4l
         6MPOS5EIsQIOzn7y7fW4eCPP7PjEyUWsQXVJD+A0zrey16oRABX4XU9MHcpg4itkory0
         XuL669oc8tBN99yVoQoWDTIpXts0L7szmYnOC9tq+sGPFuFZWvC9/CDi2w8D85IST7sX
         18JSXCtaO/gLO8kS+LHd6MDse2GtturVTi5FNHKBnypOO963PhEkrr8FnBFA/nKzAmiH
         +nEKzyRjsw1KVneME6lpVRLUa2kJIakOYA+zGowgHRRkL05s7kux0pBAUDPk/kwydQSu
         CdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081991; x=1790686791;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24nvX1TJGWoOIXKdPCihYhYyGf+Fdgo4j/yi1DrWoEQ=;
        b=UKES1o/lWLdd/KayhGnSk9NEzPMW4D+iZ9B0kV7LCE6RsZIJYED+RWNdhl5KQ1T9YF
         UnB+aGb2yW4wiHVRJkUpAmIsfeA3TM/GTQEBcduj+o2/1ywTlCKnMwVfrtubaMoIG+Py
         RvvaS+XzRhJUMk5Hz9/xbMaUiB0LNRY8VPUU+UyhC8jXciwYq1bxgZtlSV6xAxPGsHHb
         tYDZzX4SYzjqmoEooOW10StXPNrSvzA5NWGNHEu0bDcTSxqAXzbs7pnGsgA3TVty7BK3
         +9iM8l3AjBIAlTHwDFvlLmDTbxESgoNDBl941g3xhRDjdPT9J3FZZv5hOHWP7cL3Yr15
         PVGg==
X-Forwarded-Encrypted: i=1; AKwUvByblYsOiW8A2FYsCfivM/XjnDSVlzjvwnhcQ/mwgJ7PeX35MTHDPKyascioa7rH72/e/ypmcGNI5wOXxA==@vger.kernel.org
X-Gm-Message-State: AFuF++nHxyqDnmWnQdRZXEfEUCL5BZQ30UWmvH8XyuyL+Go1eIAbPWaL
	6OXFRfD8xJ/GNjaZa2OLXYZBLkNquHrN/OSDUPbp2EZNRwL2YFd9wVtXBE0KUMnFZVX9hLaDbA2
	yXFr8gdq6t8x2V+xAVcf/qGvOnHeeSzh62HIfitDsU4jEGmg26jPC+PGLbl+4k4vTyA==
X-Gm-Gg: AYBFou14eLb4j+2fprnccDvwu7zsFNBm80clVrU+5Sxmp5xkbeplbEiExpO5KMgE0DP
	bPjF9v9/oOivK1d/Y1br2kp4BijbNUl9MRhg6QNWRNkegvgPqz4k2RqWHnTpz2CwwUTqubvZjo8
	34co+hqrP9hxBBnPCDjXhy67k5wclJSXQUK/S8mxYCAauz3t2fD7PaNM4Dl1YJGzUQRRxiEazJv
	1zwpmmWD4nT550revlOr3pK4j2MwyNBZoCxtVEhJl+M9QIvFxveNurxWDUh9+u0E3DCrXA+skgl
	ymLJY4zjm5QP1HVXf2x0dAEozdMk2OK4o2/7R9SwjhOeYQ6WbEcldPjoYm81ZnOHfevXKh1ws+Q
	XKlTbw23pL9r03I4qYxDVHVn9nf6Ez5jdCOQEOyWkyHvPSiguzO+CVLFI1XNUfX2bPTrOFyGd68
	UlGqeflT13uQ+e
X-Received: by 2002:a05:620a:29cb:b0:93b:fe5c:e6f with SMTP id af79cd13be357-93c15d91370mr579610285a.23.1790081991045;
        Tue, 22 Sep 2026 05:59:51 -0700 (PDT)
X-Received: by 2002:a05:620a:29cb:b0:93b:fe5c:e6f with SMTP id af79cd13be357-93c15d91370mr579605885a.23.1790081990524;
        Tue, 22 Sep 2026 05:59:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a627d779aasm5197741fa.28.2026.09.22.05.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:59:49 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:59:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/9] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Message-ID: <pk5j7gr5m23eocsliy2rtqcwbtzonzxidxdon7w3doysgehiiy@yxtjrrp337ex>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-1-e0c8bc914742@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-glymur-v11-1-e0c8bc914742@oss.qualcomm.com>
X-Proofpoint-GUID: sxiHcSIJszMv2DrJCDmIsEOOmozrELns
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4OSBTYWx0ZWRfX6xZ3ffiVFyHu
 x7iKFjIsRVw5G/fkcQjdrrCgT995T+X6n9XHsRXVoqFnS/fmzK4+8ASfmDpvQBJsk8/YE+o3MGe
 GqKAy2cigxou+AO/8AGh662dWCZuAqc=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab27bc8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=wWFq8rog9-yQDf1E76wA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: sxiHcSIJszMv2DrJCDmIsEOOmozrELns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4OSBTYWx0ZWRfX47xt1LcUNx41
 rK8zLhXE8sgPTcfmZBYhZbdh9aLIZv6snyoOJ6BBrO2nxKIf/WH7MS3kLG1/nC2HmgI116bHDgx
 yBDc6Lg7MqFE/bmDk31EnEgJ9YRufSFv6it6blORGLD3vpi9zZnStJPdL5sefxVtEjVVZQtHCxJ
 1xaQH/FZCW4z0X6wUGksfd1HA2ZjgUgxLxXw9/OzMR0WdUhFUBF8MaoogvoN8Ef41PYSiUei/O+
 VwJRasZqas/66rf/ir0MI6WW8J6xfdjfNHp403o49oT19UpxDEEupwt51joGiBerfsXGQj7dgmC
 W27iM8g4FBXcB4VMtgfMv9p/ZLM5XQTYClobEik1Z3pApWePNmkylW/Cbm3Su3C3DEXxCoa5kKw
 l1ey4re3SolDns8jMfc+S6vFBBg8VzirJ/98zhQGRT2TJjr9J6SahmCCVbK9B3gZPUg9P0eWtTn
 RYfMcQOwSEivqq8t8Og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220189

On Thu, Sep 17, 2026 at 10:30:20AM +0530, Vishnu Reddy wrote:
> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
> is a new generation of video IP that introduces a dual-core architecture.
> The second core brings its own power domain, clocks, and reset lines,
> requiring additional power domains and clocks in the power sequence. The
> current maxItems constraints for clocks, power-domains and non-pixel
> iommus in the common venus schema were sized for platforms available at
> the time of authoring. The glymur platform introduces a dual core
> architecture that requires more clocks and power domains, exceeding these
> limits. Raise maxItems for clocks, clock-names, power-domains,
> power-domain-names and non-pixel iommus to accommodate glymur platform.
> The glymur platform specific schema have fixed constraints for these
> properties, so the common schema only acts as an upper bound. Since the
> common schema now only acts as an upper bound, add explicit maxItems
> overrides for the non-pixel iommus in the qcom,sm8550-iris and
> qcom,sm8750-iris schemas to keep the fixed constraints as before.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,glymur-iris.yaml           | 218 +++++++++++++++++++++
>  .../bindings/media/qcom,sm8550-iris.yaml           |   6 +
>  .../bindings/media/qcom,sm8750-iris.yaml           |   6 +
>  .../bindings/media/qcom,venus-common.yaml          |  11 +-
>  4 files changed, 236 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> new file mode 100644
> index 000000000000..de4792f3b658
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> @@ -0,0 +1,218 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Glymur SoC Iris video encoder and decoder
> +
> +maintainers:
> +  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> +
> +description:
> +  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
> +  decode accelerator.
> +
> +properties:
> +  compatible:
> +    const: qcom,glymur-iris
> +
> +  clocks:
> +    maxItems: 9
> +
> +  clock-names:
> +    items:
> +      - const: core_iface
> +      - const: core
> +      - const: vcodec0_core
> +      - const: vcodec0_iface
> +      - const: core_freerun
> +      - const: vcodec0_core_freerun
> +      - const: vcodec1_iface
> +      - const: vcodec1_core

Nit: is there any logic in the order of the clocks? Why vcodec0_core
comes before vcodec0_iface, but vcodec1_core comes after vcodec1_iface?

> +      - const: vcodec1_core_freerun
> +
> +  dma-coherent: true
> +
> +  interconnects:
> +    maxItems: 2


-- 
With best wishes
Dmitry
