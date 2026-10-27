Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101127;
	b=LPNbE65f+D3OzdSrBtt3eUWi6Kb8ievsYbBow6Cl5tfjJl0PJFFdFXfLY7KYiKIDTEcM
	 hD1e1JmMWX8zz2OsaE6vnoKB+xkFN8YlbPKZ9MdqPAnTpSoH+SWqQXvETAdFYycv6FIPE
	 iJ9A9BElMgjrEtL3A/9ABq8QH6BQyY7FLcaVO83hngqDBzFLCGVB2Y53bZcKSpXu87C/I
	 S665XRd224ojkRAs7SyhjQhFL8kksxdHem6UgDjNo6IugOl7KNOyD4ATITzYeZ1/KEFiX
	 +aVusrk61ce1kNZD7H67xLNTTS+6rkkBZ5193jFdoi7ApLQR3jxLF2ojbf9+4r7/LkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101127;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t8KeJqXYQPr8zutUgjnJ6yEQLnjHNNZkSiiSYzj+XfU=;
	b=unXNcZZr3dVYmuMFrzo7YxhrttkgazXVHmveABTAK/5LaxujWTLZBo+mvAvUrQ25oHuG
	 /P58B7RUv7jVU3QUqUusWSLZ2CmuXYW3HDsjd/YSKrnAA5h8uv15l/1aGjUmCOUKqzVWI
	 1ks1QFYm7ygZvwKq6K7qF/G+Sd9kAYQyZ7uwfuPFsfX5ELENioIveQAcyWJyNWydsmMRp
	 1Gr1m8Z1FZCUlqQesS46eOa/ySSY/sDqofbAsjqg6y5Gdug+t4cvX/cTmrhDTdelYrn8Q
	 eg6kLSPkVZ9qx9mFs1nLB+TZ9YXsqC7pqV2tp+xgpG68XJO2zCF8Vc0mGJpPfrjHffw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="d8A1SGU/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2l3y2gl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB1960A262D
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB1960A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d8A1SGU/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2l3y2gl
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdwPO2458090
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t8KeJqXYQPr8zutUgjnJ6yEQ
	LnjHNNZkSiiSYzj+XfU=; b=d8A1SGU/3lNieXhNKzh78QX8sIvtyhoggCDvkjo2
	ZooNqFjFtRxIPsA+xBHGhEwUfOys1kTG07Iff1x+bBTZFVWToPjzxT9N8EnOkrNx
	IEGxQb2KI8RaKfi6IZ19cdymyNOTdoCHQeQYQLCMNTK9oZwDvYY148nlQMyElYrH
	nDvOEUPoI5cM1gKNxhj7N7mZKOPMRLIrN6j0HBwaYQi86++6BI0mVQNoQLmdXzQ9
	wKMW0uM4oJNn608zdT4wH+3YUkoQIer3xZf8YVZLZru2N3Hx6hdqAnijFoHnd9sT
	w6PcNVLoGn9P/kyfRan8jZasQplHO5ZXeiRXOVeR9WFG9Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbta2f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:38:45 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso952273241.2
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101125; x=1793705925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t8KeJqXYQPr8zutUgjnJ6yEQLnjHNNZkSiiSYzj+XfU=;
        b=Z2l3y2gl8efDAcKPmx9asGDaPwrkEVgMxaadFXzkcQ29PiAAQ33AYJIFNUpZ7pfna6
         bPA7/SmpEQ6e5JgFXQVokPSAn72P4zixpAiV7eidruSoAyE32tFIqVU+2Q/KCwz7vryt
         1KSe5VQxCrNDjMBU4GAYDIV5uq8V+0Lw6puWV9D4e7VCChWMPskJ1YrDEuS1UNt1RIf9
         aUcpb7Sin+YwYVS4+/5Y3PkL68D4oyZMtM0C+DTT2TaPQhU2dk+lyN0FrB2EzLCoaHhn
         bMAC+UCpC6E9CNRPStjZNGb2zkL/TcDwYczV0COzyn/9+/bEKQlzQCWLqYgqB0DPNUHx
         JCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101125; x=1793705925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8KeJqXYQPr8zutUgjnJ6yEQLnjHNNZkSiiSYzj+XfU=;
        b=pzgR5zONbLWJoaF9g+Wsn1eR7t9JXmfNhdqHBs6NMSUDHVQVUSH/R09WYTIxpDqqrj
         zeie6MP3qG05VWVVjMEFkdyrE0l4Wt2G1UrbcpWIfdphhTZ5kmrMR5oOLByEwZLmYXg6
         s1CAGvfRuxg/9C4mgQrifjIkJub3um348+1O6A0VGLP8aUNLVkMqFYYX+nvLHN3PV5ex
         sxs6TVyc5TWwMQhyO2/N+jfQKRQbAL7EANVTVb500qR60z1md9+UaewFgfVxWm6fQGko
         lRbnULQeMW6C7B9mI1R2gC5rHVv24/6cMy9VQdpUsKOIwRtMo5PYj7vTR1/AdVR9Ugmm
         JJiw==
X-Forwarded-Encrypted: i=1; AKwUvBxiM447zyaBbGixnDCCLm8UK9B1b37ts68pKdKEKnjKYy2IYfpZNp+iCJnFOliJSChHGB3+8ZMLDlyhpw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLY3It8r+iibEtnBWmAgwv9rUPZnxZvBYWbSNAMYTQoPvpFhvhQ
	BFuaY1vinZgFFJ4B4ok3lyNxnGYuCvGsa8j9ngYLHUSw+RwZz65yRfyG2m+OH7ylQuXrFfUEOWQ
	AB57tIF/U1qScC1RMdzs0psDG15zXbIsrNLrbNxRobQjRiHuFK9Bwew/zrqAJ+CRTqg==
X-Gm-Gg: AYBFou2hHugDmeWQTTp72iyzo2gOMU7/asfzuEC3yaNWIw00ptA3zVM2w0Fd0KgPAhC
	FprwmexHnSlHrbwddx1CI3hdeLsV6kQ0yTyLAGYTbGExFUKmfDGfhtmuFjCsEocAf2wgPzpSHwt
	2rPusduMxPUdZWzXmHyee7Ja2fGOOjh5fTbn9ZbAJLig8adaiWEBZewOB1x0S/4+a+eQQOXnTTf
	jmK55ASR0jry4dqlTbwQDd+GjUxfCEW6cL1n5UDejT6izp/ISZBcYcs6toyS+ODpkumoXQpgCXq
	tOWQJKiQv1rrDvIATUD7al0k96j83hrOopikYYMfl0/g1JxD1p2PYnq0pUgBS4B5SMdvYeecR1Q
	D/I+CK1ngzovRp6sbl9r0p1qvWf5zuQ6E1I0eZ3S/Qs7gwUIs4Cv1g3jsQ4HXBUtMLadVAmE7/S
	rP8M6FCWqiy998
X-Received: by 2002:a05:6102:ca:b0:7ce:6474:7216 with SMTP id ada2fe7eead31-7ce647480demr2158200137.36.1793101124446;
        Tue, 27 Oct 2026 04:38:44 -0700 (PDT)
X-Received: by 2002:a05:6102:ca:b0:7ce:6474:7216 with SMTP id ada2fe7eead31-7ce647480demr2158168137.36.1793101123899;
        Tue, 27 Oct 2026 04:38:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a27a03sm24389741fa.29.2026.10.27.04.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:38:41 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:38:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 22/23] drm/msm: Register the DCP backend
Message-ID: <m7zuu3txmzw4xemqrdtemccmvc4g6l3fsqk6xyxz5zzdbltptd@oqubuxwbukeg>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-22-7cf014efdee1@oss.qualcomm.com>
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
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-22-7cf014efdee1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX4zauZvsYOJln
 wHketJ2JdlzDYtEUgEdK1+UkzJlfR1usrPIEUtMdd5m70e8TAsrmYkJy5AkM+gm3I01Pvsymudo
 xTWjGVtpzWNaoQCzFgkVGIKHE+QFu+Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfXw9eM82OHcNfr
 /Nwe2nu4u4PETig9DTXpvL2Q3+7N2CBOjPNbyfLWoPwPZ72GeBzIZYykuRpZv/5UE2Uwu3R5Zdq
 L8e9fdWXaaNPYf9NvBseNkNpcYrtXG+T0xqVf6KEM2bVYlO4rPXeStSV+2gPGJYQfRyEvUhrJTI
 AWC5mfzhioPvmAGC8eyRd/BZnrYW/69bI2ytjIB6DjuxbJwmNq4dHZ8vwdqtFAyNfljS0c2vea4
 j5N0O1iguXpk4F9ylpo6JLisnh7uaVg8rjqllm8sQZHpzRM1iScNR0CoVEz3MfaR5Vc+jEremge
 wZSq4b6N6NiHcAICGDRbA7LCGAR5sQ0sObB+TobPLj/CjI3HxVy1mBhW8LrMXc8CWjcagvbgvLZ
 eBhe+rT0PW4HSu3zPyeGBjKvW9xHG421jmr0FbXbKRYtyGUhRBPuvDGKOA5IF3QTYhzft72cVmv
 pYz7j+oaRDrKjBjzzOw==
X-Proofpoint-ORIG-GUID: c-vmgsv78ndlYsoRX4-wFi4efAzvgr3u
X-Proofpoint-GUID: c-vmgsv78ndlYsoRX4-wFi4efAzvgr3u
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae08d45 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=5ffiRAJw0Nfj9fulafYA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270046

On Mon, Oct 26, 2026 at 11:51:32AM +0530, Jayant Shekhar wrote:
> The DCP platform driver provides an MSM KMS backend. Register it from the
> MSM DRM driver init and exit paths so the VirtIO driver can use the backend
> when the DCP function is discovered.
> 
> Add DCP registration hooks with no-op stubs when CONFIG_DRM_MSM_DCP is
> disabled. This keeps backend registration consistent with the other MSM
> display backends while allowing DCP support to remain optional.

There is no need to describe patch contents. Please update the prompts
you pass to your AI.

> 
> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 ++
>  drivers/gpu/drm/msm/msm_drv.h | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 5816c64d7ce7..d413c361c442 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1208,6 +1208,7 @@ static int __init msm_drm_register(void)
>  	DBG("init");
>  	msm_mdp_register();
>  	msm_dpu_register();
> +	msm_dcp_register();
>  	msm_dsi_register();
>  	msm_hdmi_register();
>  	msm_dp_register();
> @@ -1229,6 +1230,7 @@ static void __exit msm_drm_unregister(void)
>  	msm_dsi_unregister();
>  	msm_mdp_unregister();
>  	msm_dpu_unregister();
> +	msm_dcp_unregister();
>  }
>  
>  module_init(msm_drm_register);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index aa5dfd82ac6f..befaa9f2cb5c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -417,6 +417,14 @@ static inline void msm_dpu_register(void) {}
>  static inline void msm_dpu_unregister(void) {}
>  #endif
>  
> +#ifdef CONFIG_DRM_MSM_DCP
> +void msm_dcp_register(void);
> +void msm_dcp_unregister(void);

This means that the earlier patches generate "function without
prototype" warnings. Please fix that. The prototypes must come together
with the function definition.

> +#else
> +static inline void msm_dcp_register(void) {}
> +static inline void msm_dcp_unregister(void) {}
> +#endif
> +
>  #ifdef CONFIG_DRM_MSM_MDSS
>  void msm_mdss_register(void);
>  void msm_mdss_unregister(void);
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
