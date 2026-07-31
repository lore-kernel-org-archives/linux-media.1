Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270634052DC
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 12:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785499996; cv=none; b=G/2NWjGWFuPucQW3OMrWGtztDYnieMNxtXoHcoNpTv+MFQcuBU4TK/I7WVVuCuAy3GUzUgeOUa0DPwS8lfL+kOW+UavaT1J1uFuCl+e+NlNU/zVSHNMd0at4XOMhFeHjG49Dae+744nrjli2g+eU+VjQE8+fwXdG1ipghU/0xME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785499996; c=relaxed/simple;
	bh=2lgMSr3Kd8iqkNgBFBm9uhKQPq3np+GySL8xY0y5YxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/TwpK3Dr3EWa5eqdX5exUS+1hsoIQC7EwbykuV/TkgofmnBYjIthnK6w4/9kwi5Jbs8LSpjED+SaHtdgVXu4NpISxgC8Dw7MdFP35sfrs6bBPYWY7Ygn+/RP5Bufn//wCMq309cdJ/bj4yFBg5xYwXMNWK4jkDp4TXYjkStLtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWXzfA3f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a0aZMLE+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWXzfA3f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a0aZMLE+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBdAUU3371039
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 12:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rh54GB6Vgywir2EVvnKxHpid
	qpzqdcjyybbV2fe6ZtM=; b=AWXzfA3f6MTCW27Jbf4vgHXWvLXSboN7ZhvbyuAP
	UytlNAj9R5vHL+mm6H0WBww2LOz0Yxa157XjHASfAon/pWH1swU7n/ig7wkierXd
	ewGx+7X6TQjiGG4/TQPMxzYqIcgVrqSs4IXlZgHGdko0Hm3aUPZ8UA4LDjKFZvhC
	qm+96stgSWy4oTD9h//nR3aT4W984y8HXMk4ZbqqHfRXDPynHgPD35o8So6Gmg9J
	Jsw6GCwRumOMMXDvnjri3co7lYKS27RQ49NUwFVc56S7g6uM61SERLFOVzRR0D19
	8wxBR+L77DZoFsLW8woE2svsQ8Le/YAdmxi9g30tuL/Agg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru0y03nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 12:13:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso8070711cf.1
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 05:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785499989; x=1786104789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rh54GB6Vgywir2EVvnKxHpidqpzqdcjyybbV2fe6ZtM=;
        b=a0aZMLE+PcTsBY3qjCD5c7GttvEbxLAxP/4DonjBfWa/9EGElGrwbGgfe/VKOtIxlC
         riVft8P3ByQ47ZBmcBqhC7ycsCQJKm8N6Ya1Z3ui6nuaOqqBHKUE3LBXRJFtDlG5Y8p8
         NuIeU5fl+qFSBjXbaaqG6kIycMxXPv/GPwKAzdORw0LeEJlqwoQns7suReekC3reIBcX
         H49f4bF2nKzML6u6mdMXGgIQ2ycg1kqCO6dEW7RB8o1JsdB6Fujmh/GYiYm+sTMV6BMA
         Ei9amFGdsbM7wJhMQe9Hu3sh+VTavkFj8IPhDVQY2UzxGL9yvPIs5+FHeVTOJ4R6tv2k
         4x3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785499989; x=1786104789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rh54GB6Vgywir2EVvnKxHpidqpzqdcjyybbV2fe6ZtM=;
        b=mHUuIH/TjcNGgeevHvMOuTVD/NLgDhulmcfHXqdMtlZlQ30UU/r5cAcXI8Rns8wuu7
         XWzOt3wS27YoPXw1wZKokBe8s2K0LCHr8EypTrZkRvjvf4eO/eKeJPRWFZhN+xMl6Rhy
         E0cOHK2DziR8x5pICwH+XWmifqjbTzlTpasjJd/40SSnVXUUOWl3NuvqVXdsqARVUbjN
         C4ZXom3IMKf6QKoR7HNo1usGmqAYySG0b3+oFj7jdO3N7p7V/UAfKs0fEUpEs0sflGe7
         Ecd7NUzbdwmZlvUyyNPFiuKkh/lTY5GMVOlcaivKcu0ni1wbZwbEFlEU3kgTVY/DSNhG
         W1PA==
X-Forwarded-Encrypted: i=1; AHgh+RpqtrSUaFnAv6ZHff/OGutnOGz5QEk4Nd935dIpviF4LfgBfIDJcPkrL+aOSD7VOG5/jl7yWE0TxgKguw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmOlC5usQ732tt+/6WgakC92vyngglSAGM0nfhKlFtBEW4Pgxv
	1S3EbuY73CuUliIPVjyw5qoHDpCMGzuhClmtcHDDwEOQtx+EpWguBDDfm3i52q+gBd6z2185n2c
	Gq3sPUJYHXpzSWjtw2l/HerUIA19TGLrcpT+/ZvG6hH3PUm6hgVrQBdrX+QK6hC6jCw==
X-Gm-Gg: AR+sD11OqCIDRQ8x+/IdhpOrs2OrSuwC+gGXNVkrWEDbpFR3y/R+6u4BOp9XVNtM1ys
	L5A5TcavfcUgzGfDrnlbXeBguy1gwY7dh8NImZvnLruVxRH7VP9ijcl4Fiwn4Rjq8GQhDey2Ra9
	2yY3y0uIfxkYMufqu4kUn4oubHyu1eB/rUOESmd+9dM+qd2rnq9oeksolsn5K3Rq6x7kHTYcLC5
	P3zEep5EY4rPtigHft1UZm/oAlEgm661c4bE05Fv3X2M/UEo1jPaCWMv8Xblb5XAseUtdiyEx8g
	KrhkxB9lxy3TzdHk7xkMFTQDhW+F3gC83X/lf2HrAE757Qh8hfq/yP67jM7urUItUY4qs+xMwrH
	i0zd9uC+b1YcYTRjGfnKWC56A2vsS57sGcHQzGhzSYIR/9GTNnZinaMmOu2OQG9r1rIqrb4RF8O
	4IEtmGEe76AsVzlw==
X-Received: by 2002:a05:622a:292:b0:51c:1241:3b09 with SMTP id d75a77b69052e-52b4af4ee67mr24260451cf.39.1785499989287;
        Fri, 31 Jul 2026 05:13:09 -0700 (PDT)
X-Received: by 2002:a05:622a:292:b0:51c:1241:3b09 with SMTP id d75a77b69052e-52b4af4ee67mr24259511cf.39.1785499988626;
        Fri, 31 Jul 2026 05:13:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e2441deasm268672e87.38.2026.07.31.05.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:13:07 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:13:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v10 01/14] dt-bindings: media: qcom,glymur-iris: Add
 glymur video codec
Message-ID: <5r4rqy6vb6taad2eglxx7ihta6sk6axfheoxl7vhlzycgmpmw5@zasxwrq3hy2y>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-1-de451559e88b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726-glymur-v10-1-de451559e88b@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MyBTYWx0ZWRfX5YdgLt/Zrmvr
 XmAcTFf7RO3vtg09hOA5o/4ieTuPGA5pAYXm9Ja9NC0fOHIifKxbbDiAIdVhl/fonAQ7N+rEy9i
 Eiw8F1DhfGUjHTFXj25tcEaLtLGSfeY=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a6c9156 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=vQe_Sn1lod5mhkmiIsQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MyBTYWx0ZWRfXymHlkWssue9H
 C2M/QCvM9LYEJLpQN1uS+HjqAwxiw5L2JOmrcpJP+vbmzBNPhJ8PYkZw4Vru2hMNYO7fkWIS060
 xDSlFoH3/vvrMXavJt5q/bhpy2x4vVhei7O6pjjwCbuKOj33CBIOQE6D44xVbeFCaAHyttXSOVz
 UWBcMycOe+1/eIPQMGFWkeEqdRxQIYqnIPUmwYTvTYLkQ57XECWBhu+WzbhpybWI1D+nZMZgSld
 7pFmdh3dL6kl5AElJ+2cujdjYXew574+YBrSaKjGscDgIxQ+q6r8hyC6bDrJ8HrjW3AJ6YCQraq
 KYJaYy54+7f5ECr2J6L9Pn/oFZAsdTkOn61KGBHkscV1GdnuZBdPwBPQRI5P3XuGWJcBZuPSq6Q
 Kmxf31kNkhgslLO7eskdJHkrIcnjRvBkcAlksMcQXnhqCuFsN4l3CFSA56M47n2drD4pxpkCh7s
 O5IXQNGpzosff3T3Jug==
X-Proofpoint-ORIG-GUID: XV1UNw0xUrugCnwF_J9JmR68nNwYxfTh
X-Proofpoint-GUID: XV1UNw0xUrugCnwF_J9JmR68nNwYxfTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310093

On Sun, Jul 26, 2026 at 11:19:31AM +0530, Vishnu Reddy wrote:
> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
> is a new generation of video IP that introduces a dual-core architecture.
> The second core brings its own power domain, clocks, and reset lines,
> requiring additional power domains and clocks in the power sequence.
> The current maxItems constraints for clocks and power-domains in the
> common venus schema were sized for platforms available at the time of
> authoring. The glymur platform introduces a dual core architecture
> that requires more clocks and power domains, exceeding these limits.
> Raise maxItems for clocks, clock-names, power-domains and
> power-domain-names to accommodate the glymur platform.
> The glymur platform-specific schema have fixed constraints for these
> properties, so the common schema only acts as an upper bound.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,glymur-iris.yaml           | 257 +++++++++++++++++++++
>  .../bindings/media/qcom,venus-common.yaml          |   8 +-
>  2 files changed, 261 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> new file mode 100644
> index 000000000000..1bb16206d859
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> @@ -0,0 +1,257 @@
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
> +      - const: vcodec1_core_freerun
> +
> +  dma-coherent: true
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  non-pixel:
> +    type: object
> +    description:
> +      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
> +    properties:
> +      iommus:
> +        maxItems: 3
> +      memory-region:
> +        maxItems: 1
> +    required:
> +      - iommus
> +      - memory-region
> +    additionalProperties: false
> +
> +  pixel:
> +    type: object
> +    description:
> +      Context bank for VPU pixel buffers containing uncompressed video data.
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +    additionalProperties: false
> +
> +  video-firmware:
> +    type: object
> +    description:
> +      Context bank for the VPU firmware processing domain.
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +    additionalProperties: false


All these subnodes are going to be common to _ALL_ Venus and Iris
devices. Don't define them in the Glymur-specific schema. Please post
the non-RFC for subnodes first and make Glymur use that schema and that
code.

-- 
With best wishes
Dmitry
