Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C5041F5D9
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 08:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006174; cv=none; b=UK8ajCqwu8TLQfc2FzCbgy/gWAW24GKs1KH1hqhScbbQPZFEX2hVOzRqdf1OAmMlTlcZypx4dwiuXVQ/t9bgrT4aeX+fETF4EXAWkjESFsEQpJu5hT+LQ5RpccckF+yb3/QMSTigLJf0HIIJEM/nbwAVATa9u5mR4biY0+Wu57o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006174; c=relaxed/simple;
	bh=KhzSMHpkl+T0k3/D4bj/TXm71L2GvbGLt9WmQapRokg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryr7cALt4o5K1FjBOweJ05TlXu5zzVFZ53GgEhaIVwRH3SR5rvRKXUFgjREfY1izdwaWs0gJZu+GnJTouIRKmJmgpUbhyPdepeHGOO3QoxKUqc/4y6FQ843jxeoleoC7pnQqJ3XrSt9bXPweCD79Zcor+CpYq+6tAX/p6rETEdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTpkEE+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDqJklcd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTpkEE+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDqJklcd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6767OEnv3702143
	for <linux-media@vger.kernel.org>; Thu, 6 Aug 2026 08:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fXWx2kJuD1txleNLiOTk7MZh
	NagWXN9ujUDiGfg4Op4=; b=hTpkEE+QLyetKxFDc7Z1I1UwO5H/bsHl+/Zj+H6w
	SNlZ7T7LuE0PuXG+sLgLbbWV1bScdilkE5ru8hg+niCNThaA0u7pv08eBEQBe8jy
	3VWpnssSwdSXO+flBX1G3DbZO8W7UZIIKCNTpkTTPP133Mki19FDAKlLe3o9qa7h
	9OJ/mos/LyYPYIsPuDutRkmJIlLKyVyCCB2/cTLAeV39GpoAyYNktNAC3s4FhsDQ
	nsWYMAuEKVpgJpTwaiDYE10X4yGHVTYkdM1h5gLUN2Kp/FrgRgWt+oTHgSNtunEo
	Dem99xo+SjV7L/O+ZbBKgxk0+H4FWwZosjk8xXmIKluuXg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9f5b8pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 08:49:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8fc92c5373bso19893396d6.1
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 01:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786006171; x=1786610971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fXWx2kJuD1txleNLiOTk7MZhNagWXN9ujUDiGfg4Op4=;
        b=CDqJklcd9itEv4dd4CyZz1w7+lIkSb011DXhlzaINBC3m1LTAlTBB99rZTOrbphhrj
         Sux6n3hFk5mluIUS1lYBuooVo4Og7DoLLKaie48KblsTMzUzyMd8XqKifvhSeuT+3Qx3
         EdxclpIgr4483edKjtqy4vmZKUqo1L7YfWrM8Q16U31nEoeDgxbog7NexOW5geYaHwkj
         g4r0yVX1/J34uQ/um0TUHvawVGSgtnZTCFTLZX/H9TSba4STrZ9YgWYJKewOCJpHbzHq
         kCChIZLF6/sGgl1r8dXUJ03p38eqVopRXPzEqAxfcgGYPTERcM4bBXZ5/VpW4QKW3mN4
         AaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006171; x=1786610971;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fXWx2kJuD1txleNLiOTk7MZhNagWXN9ujUDiGfg4Op4=;
        b=SudbudKzef05rnCCVEa8xouclSMYlybCzn8c5brkJ+H7c9EOiPumoekGo3jIPphgPc
         iWzcjvRAw9gneQg8zpyqMzXv9tgu/WUV+wTYlZADdCgVeIerCZPVNCmaE03QxAOs+aKC
         o4Cr0R7vvtej6p3yXMD3+JSLSCvMWU9R2s7EAMWw923BVRli+MC8sxLJSYTWzHl/J0DS
         M86ycmCEi0H9sU4URU/eBjSkuYZ4tmO/3OW1OxfoDF1TX5HZWaK07zSOpiOdqceS8vcJ
         gNWWWx0gUc6ZbGCya71DAZRneoRzEiKaEWlLTJ+EgusF2Fjt+2qM+vGQpBhpOhAHlaOt
         bvqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+iBogdUcj35WuI5eIHGSI9159nZJZK3ka2EuNy1ON8XQ3m9AtOwClx+jZ3PNELn9nY6K4plVNOrLX6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr5DZUg2DPjLfnYiu/5gIwWO+4emIEccDJa1Ol3gkBpcpn/oJ0
	O9vdR0AuWSgJ7IriCTkTn7L+TNMUr6N3ZXPM8ZdIzV1rCM19YGoPiq1uAUadRm2MH/+dsz2mKL9
	H3Jk6LsRz8b7NJXSCqvmbV0lvF5i89UssEMJ06PwqNaNeYy/NzODEhBonSF5ol9LllA==
X-Gm-Gg: AR+sD105QO92kzZSCizQ/7hL74DoroXpaXe3YVrmf0E4YfAusz/5MNynDDRZ1OwQs0F
	CaR+8EOFsZft26qdTKDXryzzuHLusqn0fCJZgSQy1Me+vA3TgaPq12Q42OQ0EZe2kWi8Y3oq131
	hL54HbV4plTO2cA2tjPPvKL7LH1VMQ25Y2l8INoSN5OAY8gzk1H65eiPATzjfh+NuNt2sFLR0sh
	QX9iCVUEaGpaWmTg0kS746/huveKWbp/7n2xEZQk8LFRPKK96tX36KJH9x42/ggwFbW7ZdQ9PK0
	339822DS8zKpqUjQJ5O1qOY+p8hoVMG7mmrFLRvgNjMn0GvG+kXY1IYbseM+xZ/4VefPNVQOuBz
	bio5Wh2ncdhX1kbYUNd+hzfucVPH/2GlR+isdH4kpE+0MaHQGMtXUL5V4zwOAWEZQEC6EpFKQAP
	rFM+EG9ihJJsaj2w==
X-Received: by 2002:a05:622a:587:b0:528:38b1:b54b with SMTP id d75a77b69052e-52ce61016ebmr130093641cf.20.1786006170715;
        Thu, 06 Aug 2026 01:49:30 -0700 (PDT)
X-Received: by 2002:a05:622a:587:b0:528:38b1:b54b with SMTP id d75a77b69052e-52ce61016ebmr130093181cf.20.1786006170210;
        Thu, 06 Aug 2026 01:49:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f6235e88sm588382e87.11.2026.08.06.01.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:49:29 -0700 (PDT)
Date: Thu, 6 Aug 2026 11:49:27 +0300
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
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context
 bank subnodes to common schema
Message-ID: <xusr4efn5dmsvcs2hl5vg3t7ctqbbchnbdx3mx6km5s7s3se23@mzzqs54lp46l>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
X-Proofpoint-GUID: 6qevZ_cY8YQr0w_Ica30KEzuofxzAw4O
X-Proofpoint-ORIG-GUID: 6qevZ_cY8YQr0w_Ica30KEzuofxzAw4O
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2NyBTYWx0ZWRfX/MnU+Kvzq4hu
 SXXLhxypteA83lElk1sjm7JAK0viQ5cum3/DdRTthjAs4fPGw4EgNx619fBZPVRQRNXn5HW/n5R
 Pu4n1xo/uZUQMXruR7BufrosyGdUfg8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2NyBTYWx0ZWRfXxCs8eqWZHAKc
 peKQg4iJLxgzR5pttT7hBKGHcY9CQN2KNeTo7aVgE1ZWWwcsWmH+hlh6ilcea8lUI9bXCT5R28o
 JqBFEpJoWcHDv9QpkulA4hgLuwgtwHrEk3XgwHBhHVgoHhDRAN2+zepmp+QeaMaWxtlDlLIr8JU
 W9UrUBb0qXx0qyxFrfC04U4RUUFVqltuKPXt/s0bIUS/iWvNeEBlaWtfJMb4BCyB+CSZtfXH5XT
 dmjQCLRzbQocKDIsf9YSrh2ryTbMok4cG3Rk8mv+qHbgjDXeIc1RGMBvBEn8S93I8o/BeWnJPuF
 jHIYjf8drHNIqug58TOyXDiFhL5zk+hizCv2ECgbGPU6O8HQtDTYTvMDLCtTlVP9cYB9RZLlQ0c
 L+HQJ2US7VpIp2msirPuVPcIzf24v/3KDRTZnwct1UtfV+6lLh2JPf8DnPQcKMMvY7j/McBXo3b
 JHTa734sL6zLdAYP0ow==
X-Authority-Analysis: v=2.4 cv=d4bFDxjE c=1 sm=1 tr=0 ts=6a744a9b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=jXNH7nskYnz8vVHi7d0A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060067

On Fri, Jul 31, 2026 at 11:52:16PM +0530, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> is restricted to use 0-600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing keeps a
> non-pixel buffer inside the low 600 MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
>  
> +  dma-ranges: true
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2

This would conflict with the 32-bit addressed Venus nodes (and it will
also break examples). So both should be just 'true'

>  
> +oneOf:
> +  - required:
> +      - iommus
> +  - required:
> +      - non-pixel
> +      - pixel

- #address-cells
- #size-cells
- dma-ranges

> +
>  additionalProperties: true
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
