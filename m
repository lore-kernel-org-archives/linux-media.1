Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7955140FD9B
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 10:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454759; cv=none; b=D1l0SuFJ3beoc2jg7EmkFKbVWaReGh2H5oqsiMqaTDPZULKpKaujMEzADIuqRk2Iry25eVJ7zaGdOTqpocJ3jdjQR1EMGcrfVCNkcQ65jjtTLRP8s8L7GE66NCrKfuyP00Ezi9V3E3lTrNfZ59VVy86fgXVf+bWmT3EOi1I/Npk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454759; c=relaxed/simple;
	bh=S03LwFerT/ooRJg62vlbHpT5llQgKvhDDZxiJuNZIBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/xP3KuB99CVju73aQq9ZbT+FUHx9p5jMrqevAhc1uqCU5jJ6O174DuIYIraaLauaC3d5ecl74B1PJTx/+lc5j9HOmozEaq6WhV7MNpHFIrbfmTcjmtVIOtBLbD5a7ZIROO/eirs10Ft2u+KMKl3eTUe771wqcrrXruKX06GA4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+3VWlVK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kqcij+ns; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+3VWlVK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kqcij+ns"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KLkX1845627
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 10:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g4FJlDdpi5DxKcM79pJauxat
	KMVB0hxE7B8PqzHViqg=; b=C+3VWlVKU8pC8aZKI2i/yFCj6wao/v7/U1raJzw3
	R2mf3ukU29ZVVludR0ZAtvmWK7u8YiV6vuZKoz30dMu0QbpwZ69jUFOBSXs2CI1s
	lZ+51hWpfOgiSeGLmY+Ie8mVP3AlB351/ozRiOTOeV1dx0P4tCSyeDH+rsuRF6vk
	YQz8XIg1CyAV8HPkHSr9L8IUISWfSq2asL2es3cXxg5pW2t6+dUouijLHDymk2AH
	5M3sZSz/Ww0Ja13znYoDX+BmNkcp2jSppLh82NDNS0lBY1wDdGlfFuiQc9YaPh4K
	tgF6JJriwAJw0n09SkhwdPiflZHPHhsxuJKHIwX3VYp4yw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jgv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 10:19:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf08dc2fc8so696659137.0
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791454756; x=1792059556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g4FJlDdpi5DxKcM79pJauxatKMVB0hxE7B8PqzHViqg=;
        b=Kqcij+nsoXvWhag9DarYO/Kq2D8aF/3afY+NUI6tIJvq0LchV7yvBNX8hj0cY027ov
         s8wOCR0T0ddfZHP72GdN83fFvgGrwTujkRB2G3HMdn8DU/NNihgOuP+jG4iC4AGlwds3
         wQl00yKSAXSctj4Vs42tT95gth5JISra2M1bHzc8jUHoSJur8LVh+kjuaKH6rdKh5zMY
         yg/1jkLxJoed/CrIGykMQwq43rEZ9XrXRm60Q7dW/t9pK/yHkiyNNeenByWPYV60AfmE
         KqHnsztAaRdOfLCLF1f+dQDeExOO8Oo8YGt51rGlCfdhUiUWWGkt+3FEx8UnpHXg6iPm
         RJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454756; x=1792059556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4FJlDdpi5DxKcM79pJauxatKMVB0hxE7B8PqzHViqg=;
        b=R52Nxp5nDgqlCrAVRkvHpr+LdMgyRmBgCDgantHCaRlEUWupzrReWEPjhyq81mJQPn
         9+qHEbGVccyzZlR32/t9Gps32285PZ0RwYDOwsFTrS1wMHUuVoGQaVTGABijknefjFQT
         pBVQ6Mmzbpon4aCkyQKVj9f/khbigiy8OxUntFdHuYiMBP3ziEhRy+CfvLYmdMgs5I8g
         M/oZmul4Mjnts1V054TkCo3SSYeG7xq/PqBWeFY8PVRcYo6NHuXp9vqmw8fbvbw/V4fV
         eKPF1OJ33e1FmzUACQvBtl9UZH+jqcqWQfsT5CqJuibmFQxC1fFSqjhH7kQCMG3zZ5RO
         YYRg==
X-Forwarded-Encrypted: i=1; AKwUvByshQuAkjTbaTy9NJq6rmwhwvgfe5zWG4hLBD9r2wxaXCbwFvOB59q9NZMBniKyUc1kBTNV/ump2zRzYQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIDhm0SpJsEB3+FK2qNAqm1JyDVZ/QL4q5noF2P0LPAoK0VEtKm
	UfzqXavGlDvvhjrm1XNWOiM9GomZQnLKZrndqfUS7Eop0KHul+y3FuGo3DasiIXhbNK3oV5l4IF
	cmOfOa2lbtM9CzsXIOiCMbRv7+bFX18dmEkyhnzhHIfjWJH3cUXUtXYu3l+0Foh0Y8g==
X-Gm-Gg: AYBFou12UpZm6Q0BQ1p5y37PZ500FQUIMwwjoRpKibqwdZg4IacosWw6Ohpb7ro/AIY
	gqk4zVFDE+qmUE25iBe61JtQESwhiLYyp4879hKFUaPpyFIszQR5WU8MeHGjDy+cB39PR/3Rdqj
	CI109Wb3I2eYH3bb4WCAPWxJqd7kFxuCzeifx+/e15T1E/4c7A6vF8VILmJHypUx4JGUw3VrRIt
	AzJNXZZ8a59R8A8BrbZQI8hnsjKQdanMpfyv4/dxPa4KQ8p/YO8CbbTwZZv64vKVz1X68h3RnVM
	GnnZ0jVZU4nQIIlQ3HNr0/1JlsDfV3CqWCLnBQoMI1mUs4vxyCt83xaWqKbr3vzqoLB5i9POKfy
	ZM5fPOSrLNb62b8zC3o2H+l9M/D14nisiamM4uUxIeLmnyZoNRmIqEriBRhJTfo8vbckF0nVo6F
	LRNaqWUHi0aXhA
X-Received: by 2002:a05:6102:2a5a:b0:7ca:e2c1:9a0f with SMTP id ada2fe7eead31-7cae2c1a9demr135536137.17.1791454756321;
        Thu, 08 Oct 2026 03:19:16 -0700 (PDT)
X-Received: by 2002:a05:6102:2a5a:b0:7ca:e2c1:9a0f with SMTP id ada2fe7eead31-7cae2c1a9demr135521137.17.1791454755764;
        Thu, 08 Oct 2026 03:19:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d65daesm15254111fa.20.2026.10.08.03.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:19:14 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:19:12 +0300
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 10/13] arm64: dts: qcom: lemans: Add Iris context bank
 subnodes
Message-ID: <4l4rq6uz5f5tfdajn6k2rhbbrnkj34rjezxbhgyttvs6yqeqiu@ok7s5hzitxnl>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-10-0322ca5dc10c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-10-0322ca5dc10c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfXwqgoha1Z2N6n
 TNmw0nbGMyrTFgrsrsQJmZIWVk/TjKIZ2Z4s5FjO3fC1+2EiTOcrS+8l/nJj0SCdyzicCA9Bncq
 TwqAuldNIekjL6VWeUmkv9doYA9yf2k=
X-Proofpoint-ORIG-GUID: nXMhjohIe3HLYPMbYmE5aQTlK_M0fhdB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfX3GlDlOs0jWib
 bcAq4UvOlXQqR0pvNF7BKtIHRCjqFlRUZ8kHPXasV1vMEqQvL/rSzXgWvpMV2GL249jlIJX1MBq
 ANSjPZ7SFyIOT/QNuT9Zl1P7ogjzty5dIweeU6NiHrd1Hi9SAbFlS4ziJQxEgYGZP4LoBzEFsgI
 Ktq+huFUE+h4cDn7EMUPN3U9QyeRKYhlbxTtV4n3CZWt5czm9IXBEWHIVaQq3+SLVUvC+UKjxGH
 5ou+yXYvlCzPtwkdD6iX4Q9wmuqyYJpbZvxGtkbQnCZI8opAZ5HvTInniwnW4X7kxNI0JaG9DOA
 fKD59/P6QSzh1/PRhtq4G2L5LKuCCKzLzHz2h1rWmzDFqfnZYbnUi8UCdYSfniq6lWaeiQjdpBS
 VcfFDp8O7Sfnc59EOqjopZiq7xVegMxkCeLgf3SPvlEaggTtgcElwG/l7UpFuS1I8JGICiUhAii
 DlRBBRFuSrg4klM618A==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac76e25 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G2U8quZLHxfXJRKprjwA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: nXMhjohIe3HLYPMbYmE5aQTlK_M0fhdB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080040

On Sat, Sep 26, 2026 at 12:04:09PM +0530, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> Given that the address range restriction is for specific VPU stream, it
> should be ideally be moved to that stream. To achieve the same, a subset
> of streams is now represented as subnodes, so that each can be
> associated with its respective addressable range. The design was discussed
> and agreed by mainatiners here
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
> 
> In the past, this limitation was addressed with an iommu-map approach,
> with the iris driver dynamically creating the devices. That approach
> was later concluded to be a hack to avoid having subnodes, and was NAKed
> by the iommu maintainers. It was discussed in detail here:
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> The video-codec node includes address-cells, size-cells and dma-ranges
> to declare 1:1 mapping for DMA translation to the parent.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
