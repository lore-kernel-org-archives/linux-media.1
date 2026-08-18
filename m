Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5C1353A6A
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 03:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787024909; cv=none; b=XQOwslAsIyVXDbSlLJgZA8fTsprmv6aKClbJgP9FD0U7o5dOL3m2qPFF5oNPZF5cDXwXvm3qM9lkmV9gIa+Ex0D9b6f48TfPFnqCjJu2oeCvnv/CDsAqWAwfbkRl/JSQJLReKbMlvfsb7KX/K7OjUeDem+n22SQxmbSxfhbFg7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787024909; c=relaxed/simple;
	bh=274ubsZNFLQDldOL5Eiz3Zl72Xl4ZQjrmRgtjTkbP/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jv7NbRljESUEqYFsJwACCYmf4zkzTK+N0mczSpgW6Iq5l9FszehhfdWZGeGmpE3Yrz/eI7t3O2ZFbx5eN88CxaCZy3Oy5uKfEE8CV9DedFdFPEuV8CtAWaVNEVH+C14sENBCKmpS+zolRpHMrUWtJayKkYZdmIqU/CJz8Ej2nC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jrJR1hkk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jV49QLQo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jrJR1hkk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jV49QLQo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkfmZ3566444
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 03:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bXRS5rh9jAJP3tYbTw91AwAt
	64eiYAnV5pL1NFBS+kw=; b=jrJR1hkkjxicDvKwYQNE2jU5RTmV0lIIVKelab3P
	UfYbP+Y4otWMjtQPr2NntdzTvuK8Z0twLgKCUklVQZiblZ87nW7yLziXFSAyg1Mc
	SB7i/7uF9kKZC9CeCbbGn50T+BC8BqHuNHiQzEpnFvI/TFbdhP5S84SutqyeQKrq
	qOtTeOZF2GsTpUVy5MH15pluhblIgj2phoVDZypSKrgUgq3FOXSznXWMTgeD/uhR
	T8+JqIt31HrqiPF47XL99in9izUGbiJhINLMAdWJ2X18ysQof9b9HHqpMnsKFdBm
	kmdIBexMbo64W9BhFfWxjX93EwR0BNWYKcOWbN2hjF9kHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0smhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 03:48:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so406529085a.2
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 20:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787024906; x=1787629706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bXRS5rh9jAJP3tYbTw91AwAt64eiYAnV5pL1NFBS+kw=;
        b=jV49QLQoxtDW3wC8w8K8gRCXYt6KWuYWATqPwtlIqqkIA+CcDVwCyuVgR3xkILXS+H
         XbnAdMjt6OWwIVyRIbAMFcrhFty/vLanhb7kgs/bu3tMkEx1Czq2ZIFzxshWrD2aVAh9
         OFlzJTxgx35yftS0GY3me9F/xYXJD7WyekmSucsKChrX/Dx0vHAMfCHHHdJ/t+7VXWny
         o+gPBDIjHxH9TYuasmJYhb/fxKiQJxW7BBTtiikSGSN3zHBaTMFoKGvD1qsTsTQ88UwP
         w/5BDHP7X1/p0yQDTu8tUeWUM+mmwKzBOpglPxYcNhyh5BLMtmJwDsgSDwyPwedRVjL2
         +qEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787024906; x=1787629706;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXRS5rh9jAJP3tYbTw91AwAt64eiYAnV5pL1NFBS+kw=;
        b=pklXI33sTuKgSY+NKqtrs+G4enqd21/u7Zl9/Q+qBp1jBPz+ENIOf+FAkNdqaaQ3Fq
         bnpSL3K7T6SiXyYxRWS7iZgdBixeSuVo7Q3aLBR+v4JT1aTb1R9XZf772D2Zhp0RSp1O
         5aGmY42lOekRuILWGt5JDrVNpN+Nb5A7y4GUCC6RyHKA+7KGP1C0CRnxYw6fjEL0PH4B
         tnU1QvGH06hqrV/QpVLNDvu+7ZUfrpAuBhDYGeGnHiCoJZA7H0vFvX2/s8p25hkIMmrL
         dsPfFcQ+rzV/FcqwO69zIqfWvSMplWOjP4p+HMxkWe7pMxRjLsuvZ1hIAy37xDJGenfS
         9C6g==
X-Forwarded-Encrypted: i=1; AHgh+RrPIikD7WcfrHaW9kbnqo5dL92/05aj5tjfLzAFIzl+Z2wB/IrkbBgmPiUtba4C3Vr2HQ3AldTgA1s54Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4P2oAEd59/w6qB13kE/Nx2IjMu0QaeP29stv4zUslewm0/9LQ
	6wg0WGWIwXorCAWkwzeLGAEEtOeiZExK/Ll4UJC6wxZzcM6BEYli4ubDwvxsVM08jqWfPSel/Bp
	nytWUQHBIxAzczSfJy2UzEctevFQ1mP5lEPVhzeUfOPPTcK7wxAaphbE2j4y956a+lg==
X-Gm-Gg: AR+sD11rrN+c22YhxDL0r+zA8QUbFrlhymZh70Et9zPamVH7plqO5I6Ziv5YRARs9Bo
	LNmrOSZO2Wrer3ZCQ8OJ3A3RjAEEPjhP22A8OhcgJRKSkggD+aB8zYCqwNolu1Y5WoXa6DuWKBx
	r/X09YYqwz6rKh8lleCAYKDAlCXnOdu5rBm9OUO8c1iL9qPHp8Lgru5oNSBo+KetOVJM2yvINQJ
	+I+mkL7j3RhfXpqGO/w80g1zzMnl0xFDqtsd3cBSsrbbrGlHYHA3f6sVi8dpvY4hnAGD7pHQO6e
	v4BuuPmExbiRgDU3sZ2hpLJdWunJsJxDJP/B5ZksyjPGM3b8wfApyZ1i5J6GTnQrpzRf26F8v0u
	zCFH5+uVHVCsL9Hbuit9VjiKe+W/9FuV2YDqcNqxLAQXa1cqUmM5ONd729CPcf5LxWPDopRD3mC
	tmQdfQbb2KCwOs
X-Received: by 2002:a05:620a:4153:b0:930:fad2:fd with SMTP id af79cd13be357-93704b523fbmr526538785a.17.1787024906271;
        Mon, 17 Aug 2026 20:48:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:930:fad2:fd with SMTP id af79cd13be357-93704b523fbmr526535185a.17.1787024905805;
        Mon, 17 Aug 2026 20:48:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa0e5esm861092e87.25.2026.08.17.20.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:48:23 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:48:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 09/15] accel/qda: Add DMA-backed GEM objects and
 memory manager integration
Message-ID: <pm5yr7fovkav4cuat5zqn3ngf2fxzrqutsgyaobwp5djv4xkuv@in7n4o3x3x6y>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-9-69a02e9090d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-qda-v2-v2-9-69a02e9090d4@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyNSBTYWx0ZWRfX+O4RrVHyjQbD
 Y2TbIkng/2H96Ugs4PJuKxL9kGU9UC8q6woly+0cwZTki1PlHNi1uJWWtzftkB+3qL1Frta4qH9
 s6RsiD8SViSpuQMS77mIl6+xLCpz35M=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a83d60a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=biWI9kQzUyu7Ho-RK_UA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: zP_CBrj4UEHEObAqDfTZFa6x6fT7Wf77
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyNSBTYWx0ZWRfX5ALxcSJcf69h
 TF4TC2RR44EeRKjDqr1Az1RyMa8i980nWkMEztL7gmqWYO8Xlrvw0cCw3g8gHDiIEu6hQVT7WBx
 HPxGG3DujQBNZVvD+Me0ee3cvHv1F2psy5Ze7kElu1vrMwU70mu4YyGPXh+xlGGMRyAPp2FP5ZG
 8zQvGoNzGD6fRpbLWqgs8Sy06iTUFJDo3es4BIigfpLT9YiItgJvOobnUJtOQukWvn74bdkwKfS
 0iGyuOyHtOWraUA7dn9b36vBAnvz3ubrNvFUciRsA0qujwWNNju2GapbWxW5qWNxkpoodsH7C8Y
 1AdQhf2sQFN0v1gCoKBZ/EhGKBnf2nlyEBWpOHqzrDeiUYNgSWwkoEuxhrJVuSCsI3ywdyr417n
 u3cjbBQjFflqgprFdQ/D5nV7psOTLsYPvGCPA7ZchpxDpeBAjXBuaYk89DKlN43oou0AFwBnqX3
 L6jOt+I4zZKx29inqjw==
X-Proofpoint-ORIG-GUID: zP_CBrj4UEHEObAqDfTZFa6x6fT7Wf77
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180025

On Mon, Aug 17, 2026 at 10:17:44AM +0530, Ekansh Gupta wrote:
> Introduce DMA-coherent buffer management for the QDA driver, wiring
> together the GEM subsystem, the IOMMU memory manager, and a DMA
> allocation backend.
> 
> +
> +/*
> + * The DSP identifies the IOMMU context bank from the upper bits of the address,
> + * so the stream ID is folded into every address handed to it. The DMA API only
> + * ever sees the plain 32-bit address, which is why the context bank devices are
> + * created with a 32-bit DMA mask.
> + */
> +static dma_addr_t get_actual_dma_addr(struct qda_gem_obj *gem_obj)

Let me propose a very simple rule for you. Unless you know what you are
doing, all function, struct and macro names should start with qda_. The
to_qda_foo(), I think, is the only example up to now where you don't need
to have the prefix.

> +{
> +	return gem_obj->dma_addr - ((u64)gem_obj->iommu_dev->sid << 32);
> +}
> +
> +static void setup_gem_object(struct qda_gem_obj *gem_obj, void *virt,
> +			     dma_addr_t dma_addr, struct qda_iommu_device *iommu_dev)
> +{
> +	gem_obj->virt = virt;
> +	gem_obj->dma_addr = dma_addr;
> +	gem_obj->iommu_dev = iommu_dev;
> +}
> +
> +static void cleanup_gem_object_fields(struct qda_gem_obj *gem_obj)
> +{
> +	gem_obj->virt = NULL;
> +	gem_obj->dma_addr = 0;
> +	gem_obj->iommu_dev = NULL;
> +}

These functions are called only once. Inline them.

> +

-- 
With best wishes
Dmitry
