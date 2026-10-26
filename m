Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009264;
	b=jbYBB/fO2x618on932c/wVOuGqzcDtKWVeJW2HsWEavAY3ED/0P0limeGmGMX0G1pV23
	 ZmeFla0cXIu6s9aOAUzEPUTk2Y7SrlZbNqNnUgY0NYn+0G8LepB4jgSDSvsXPz+TuglCG
	 JpF2M8kmekns6L+U5Qc3/SFT1SCVnPZ5gsrVfRrU8BuD5ntvVuwZKHTLP6648lqXuctHz
	 8PnTMOYJgBqq+tPe8/c0ctn4abk8rM45GMAnY+5YbnTMJOqbsYwg+r9xkuCxAmaP/m2a7
	 YeUrRd0nbeoXJMExLGf+gugMMOkOczho5XPJyowJq4i2PYmsxj59OQi0m1qtiqkGLjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GnGg3CwhR38uGbReDQYTDKY/Dc4Njz+sxG9mC0bWH/s=;
	b=uJhsdvCgzPtQoMxvvAETegTH10oER/IvzFX95HQR6SaHxZiz6mQma39hCpayZJQjChjp
	 YtEmWtKeVyOCLOa5q/H8waXe7L6JQc8iL+thIStG2OUffuFskEeeB42nIuVdSGJEraC5t
	 UdK1TwMDhmqhJGh+x8DGNSJ4qOAwLOAik2iNeJOthSCbTRuYr1C/PdiYz3oOG2DKOL/Fi
	 ilEBCWNfEHtdNTfYDt+5Ev3SsdFeN34pVAwePDuLdbklz8Y/rdRFzmOMEnwjj+Xnk309t
	 SKYlnyukhbLTWiKBc45N2IJ12RuYoqeOK3tkHMNzT098NEhl2mmY9Dwr0j1WXm3L0uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RermaiNu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mvs0brTc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DD8606A31E
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79DD8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RermaiNu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mvs0brTc
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QA3sgN3521878
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GnGg3CwhR38uGbReDQYTDKY/
	Dc4Njz+sxG9mC0bWH/s=; b=RermaiNumI6rQUJ4BUBComPJBEVniwoJh0VMlc6L
	zi8lY4wo4UkHn1tu94EH1c2wE/7KGgmysAno4bo/lleCg63U8CmjHFLWK9QouH1O
	YqwLJQKjvKHHKyn/QDBQvxD5RMNH0RRPk6f+b541i3J5cDRx23yunhFNdcOJHUUl
	BhjjLC2wqsPkZ9lXYJ1SeV8LnyOWq1ZuuK7KZxf7xu6Qbq0HPN6yrB5I3LHs44Qs
	WSwK9lOVPsbzYhLFRb50iRgeRrew+XmBUFPw5vrkxUpcwTSJD5B5l5qNHtlXx13d
	GE4mUhKllt4PYqyf5veLfeemSRlQ7vWnM9rW8wlISiPNfA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf00h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:07:42 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988b86c66e5so3206812241.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 03:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793009262; x=1793614062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GnGg3CwhR38uGbReDQYTDKY/Dc4Njz+sxG9mC0bWH/s=;
        b=Mvs0brTc2Om9zMc0haaxWbSyHQiaJzV5W0cTi5GIjVqDI0jHNEGdtJDd1JTedDvpv9
         2gPzT6QkUeqDW3dcO/nWIE13LHtglL2bwg2uDGmq07hzDh0+uadTRhO81L4Ocd5p3wJm
         Vpl0Bz9CnEUijlzh+8391R0X/7ZS/29j9fwLfBBoEbF6NxvO74qIPYCkSF7d1RahOfU3
         J7ddSWmUCRCjOvOaw1ZI259y/FGAgh55loMC/PY+I89soHZPLKVEyEbhE2op0Kk2gwa3
         IOf30PBt18fyBbaevO2OAVTZycUrNvJwWiCEgWO2taU82PHxgkLYl+z+e6m+OUAfiNxQ
         0Pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009262; x=1793614062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnGg3CwhR38uGbReDQYTDKY/Dc4Njz+sxG9mC0bWH/s=;
        b=ABsIETnGnEzFF8R2y5Ge79q23k8W/YXUrOItTm/SpJ6UUgPBB+T2Rc+4MyLQu6P4ep
         ATf84YC7nE/9MYaOEozdRvxuhZg8KNRO6qO0h5JQcsZZUXRKbwegpPZdIgMLaujgBgJX
         cs3CGvZpjpOt6Hj9DOkNzVj/55YtQayJRFql2Q+cgu52xx+8XSrKdo3kEdefmPhRRmkv
         ozdjYCLPUqWB8HK2OF3BN//JRUkksVrn+k64b1xu2E/EQ9N3cHd7OYTc1JCIdskQd92E
         N1JPQTYxIOYlfLiB09+hNeV3HEL6Sj90fnJdx41G4s/fgYcJIPzYQrh6M4dzL+I/6/ny
         /IQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsJ2SXx1ChelbkdKcAZOuBlI+goOoXDlYLxCFakRpx69gsfxmJHjDIDQH1aOrMKvRdm4ynZRyvgZfxoA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI2iWDXLDShLx2V777oMROfHrr6w+dYQ4TX46CTcWb7XnDTK2vl
	RT+TZAcOGrr46GHxWM6PU/UKfL1QkGNQG+HORw2ZlquhpQ3yFNkUZwT5LyZaZ390wn7Rbz9GAGw
	6oIzEr+nHb5SOvd16fIyb+r0DVVkxIoYzpCL2uVeqV/0PeohqbK3IBWo12+h2axzq2w==
X-Gm-Gg: AYBFou2OAuvQmksBAPim2t+XBCUEdz1fOr+K73Mu5D97e1mdgufdPEE9vevlTxzOaWp
	HxMmjONVhG6vzyQ06CPEZwD14+j9bj6FO4bRwMYbTFnvc4f1zg84lIxUe981ETbwADvMH0o843I
	ThFWbL69q5nGjYZur1XJ5Phr01Yel6/2k/IXTu1+w6dmfO+5BM2AEJDr9dgoX/ahn0GApQ3gS+I
	Ir38PD7K/fppIVd8p3kb3pRXKX+AXOOYs4N7z8fHHM19ORj6/1GHoo230INwfc8FHdrg7oaLI/Q
	PMLt7+bSbX3Jgq9WcqogMOuJxJ/qeKeGFB6HGroHR3B6XIJZY47OzixsPHbcxOeaoaVXZS265ys
	vBayxJ3nKCQJholMD3g7AltJCW6ByRxBTUKwfI1M4sx6qopFoFmniLtj2vqeeGf3nbOmMkpHQyG
	fibUiJnNGllmWK
X-Received: by 2002:a05:6102:2ad2:b0:7cc:148f:c531 with SMTP id ada2fe7eead31-7ce5cd9e89cmr1435463137.26.1793009261597;
        Mon, 26 Oct 2026 03:07:41 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad2:b0:7cc:148f:c531 with SMTP id ada2fe7eead31-7ce5cd9e89cmr1435438137.26.1793009261000;
        Mon, 26 Oct 2026 03:07:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a463f5sm16498211fa.36.2026.10.26.03.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:07:39 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:07:38 +0200
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
Subject: Re: [PATCH v2 19/23] drm/msm/dcp: Add Qualcomm VirtIO transport
 wrapper
Message-ID: <ib5ts37i4f7qx4wqoscawrwnpeld3pcnarb4w7y3z4b3kolgkf@5avoy2fyp22l>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-19-7cf014efdee1@oss.qualcomm.com>
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
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-19-7cf014efdee1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX+4L5ZuKrGpX3
 RDFqt0UogJL69EG6nTXvTW3F56GvV5/eoW0mKT5uyoOVJVZ8JlBPqf0IOJm+ohQspF1E1MGN4uJ
 kU6avuHNxYOrgcs181MdoObC/YjFP6A=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf266e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=zJVDlABOU36UOg3UFKQA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 6P2zijcfD8U9Ks3Xb6AkDHHLl20tveet
X-Proofpoint-ORIG-GUID: 6P2zijcfD8U9Ks3Xb6AkDHHLl20tveet
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfXwySIlFkWMNYu
 4jiRlWOCkTxRtD6Gpc8iroezNmqjQ9hvYEviGa2S6RzUbhiEcThh7bvaAbetA8jzd03HFUIuxwx
 SNDdpkt+gYoIQ6RRDY3VbFSQR7ZhOCaTE6oeRu4oi2o6ax0DtOe45beA9DpYhZzAS6LmxpSJlho
 gdgqDx1Ag6ME+RDdPCtJx7bHxluyIsShu1R9eF7flLZluquZiK+Pp7E+XvIUnP6XjBpCRYLV0T0
 Krxk/NxLSLvW+6QU/nemTov7VfXg0QhQnoRIXu35XnblaBdnsvytGw+bF7kU5CSW0p1vi5ouUj9
 uhacAjXBHri+xa5to7AA8ot3Fkk/TFFrx8sGsLK7G1hPdVSZQtche9qnWPh0LYgC+QKlrA470YU
 /b4VPA+yeEBHkvKMrjPYicYhapVmfQubAkerkMQCnCcw7cmoqIdNYsZ29WkTgw3f+NwDxSHFy84
 DUdmXvx++0bh/IKvOeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260039

On Mon, Oct 26, 2026 at 11:51:29AM +0530, Jayant Shekhar wrote:
> Add the Qualcomm-specific VirtIO transport required by DCP firmware.
> 
> The transport sends an IPCC power notification before accessing the
> VirtIO MMIO registers, then registers a VirtIO device directly.
> 
> Implement MMIO configuration access, feature negotiation, virtqueue
> setup, interrupt handling, reset, DMA setup, and suspend/resume
> sequencing in the transport. Keep power-management ordering in the
> transport so VirtIO queues are quiesced before DCP power changes.
> 
> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile                   |   1 +
>  drivers/gpu/drm/msm/dcp/dcp_virtio.h           |  23 +
>  drivers/gpu/drm/msm/dcp/dcp_virtio_transport.c | 643 +++++++++++++++++++++++++

This is a separate VirtIO host driver. Please move it to drivers/virtio
like the rest of the VirtIO hosts. It has nothing to do with the drm
subsystem now.

>  3 files changed, 667 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 9f0a9bfeb2a7..e1a995a8c980 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -85,6 +85,7 @@ msm-display-$(CONFIG_DRM_MSM_DCP) += \
>  	dcp/dcp_hfi_plane.o \
>  	dcp/dcp_ipcc.o \
>  	dcp/dcp_encoder.o \
> +	dcp/dcp_virtio_transport.o \
>  	dcp/hfi/hfi_packer.o \
>  	dcp/hfi/hfi_unpacker.o \
>  	dcp/hfi/hfi_utils.o
> diff --git a/drivers/gpu/drm/msm/dcp/dcp_virtio.h b/drivers/gpu/drm/msm/dcp/dcp_virtio.h
> new file mode 100644
> index 000000000000..a9c3b9aff61d
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/dcp_virtio.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __DCP_VIRTIO_H__
> +#define __DCP_VIRTIO_H__
> +
> +#include <linux/device.h>
> +#include <linux/virtio.h>
> +
> +struct dcp_drv;
> +struct dcp_ipcc;
> +
> +struct dcp_ipcc *dcp_virtio_get_ipcc(struct virtio_device *vdev);

What is the use for it? The DCP driver should not communicate to the
IPCC, it's a part of the underlying VirtIO mechanism. If we export DCP
to the VM there will be no IPCC anymore.

> +
> +int dcp_virtio_transport_register(void);
> +void dcp_virtio_transport_unregister(void);
> +
> +int dcp_virtio_register(void);
> +void dcp_virtio_unregister(void);

Unused, remove these two.

> +
> +#endif /* __DCP_VIRTIO_H__ */
> diff --git a/drivers/gpu/drm/msm/dcp/dcp_virtio_transport.c b/drivers/gpu/drm/msm/dcp/dcp_virtio_transport.c
> new file mode 100644
> index 000000000000..02c0e2a9fafe
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/dcp_virtio_transport.c
> @@ -0,0 +1,643 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Qualcomm DCP VirtIO transport.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/highmem.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/virtio.h>
> +#include <linux/virtio_config.h>
> +#include <uapi/linux/virtio_mmio.h>
> +#include <linux/virtio_ring.h>
> +
> +#include "dcp_ipcc.h"
> +#include "dcp_virtio.h"
> +
> +#define VIRTIO_MMIO_VRING_ALIGN		PAGE_SIZE
> +
> +#define to_dcp_virtio_transport(_plat_dev) \
> +	container_of(_plat_dev, struct dcp_virtio_transport, vdev)
> +
> +struct dcp_virtio_transport {
> +	struct virtio_device vdev;
> +	struct platform_device *pdev;
> +
> +	void __iomem *base;
> +	unsigned long version;
> +
> +	bool wake_irq_enabled;
> +	struct dcp_ipcc ipcc;
> +};
> +
> +static u64 dcp_virtio_get_features(struct virtio_device *vdev)
> +{
> +	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vdev);
> +	u64 features;
> +
> +	writel(1, transport->base + VIRTIO_MMIO_DEVICE_FEATURES_SEL);
> +	features = readl(transport->base + VIRTIO_MMIO_DEVICE_FEATURES);
> +	features <<= 32;
> +
> +	writel(0, transport->base + VIRTIO_MMIO_DEVICE_FEATURES_SEL);
> +	features |= readl(transport->base + VIRTIO_MMIO_DEVICE_FEATURES);

Can we turn virtio-mmio into the library code instead of copy-pasting
everything here?

> +
> +	return features;
> +}
> +

[...]

> +
> +	magic = readl(transport->base + VIRTIO_MMIO_MAGIC_VALUE);
> +	if (magic != ('v' | 'i' << 8 | 'r' << 16 | 't' << 24)) {

Is it really a correct magic here? should it be a different magic as you
are not just a virtio-mmio?

> +		dev_warn(&pdev->dev, "Wrong magic value 0x%08lx!\n", magic);
> +		ret = -ENODEV;
> +		goto err_node;
> +	}
> +
> +	transport->version = readl(transport->base + VIRTIO_MMIO_VERSION);
> +	if (transport->version < 1 || transport->version > 3) {

Isn't transport version fixed for the DCP purposes? Why do we need to
determine it again at the runtime?

> +		dev_err(&pdev->dev, "Version %ld not supported!\n",
> +			transport->version);
> +		ret = -ENXIO;
> +		goto err_node;
> +	}
> +
> +	transport->vdev.id.device =
> +		readl(transport->base + VIRTIO_MMIO_DEVICE_ID);
> +	if (!transport->vdev.id.device) {
> +		ret = -ENODEV;
> +		goto err_node;
> +	}
> +	transport->vdev.id.vendor =
> +		readl(transport->base + VIRTIO_MMIO_VENDOR_ID);
> +
> +	if (transport->version == 1) {
> +		writel(PAGE_SIZE,
> +		       transport->base + VIRTIO_MMIO_GUEST_PAGE_SIZE);
> +		ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
> +		if (!ret)
> +			ret = dma_set_coherent_mask(&pdev->dev,
> +						    DMA_BIT_MASK(32 + PAGE_SHIFT));
> +	} else {
> +		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> +	}
> +	if (ret)
> +		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		dev_warn(&pdev->dev,
> +			 "Failed to enable 64-bit or 32-bit DMA. Trying to continue, but this might not work.\n");
> +
> +	ret = register_virtio_device(&transport->vdev);
> +	if (ret) {
> +		put_device(&transport->vdev.dev);
> +		dcp_ipcc_deinit(&transport->ipcc);
> +		platform_set_drvdata(pdev, NULL);
> +		return ret;
> +	}
> +
> +	return 0;
> +
> +err_node:
> +err_ipcc:
> +	dcp_ipcc_deinit(&transport->ipcc);
> +err_free:
> +	platform_set_drvdata(pdev, NULL);
> +	return ret;
> +}
> +
> +static void dcp_virtio_transport_remove(struct platform_device *pdev)
> +{
> +	struct dcp_virtio_transport *transport = platform_get_drvdata(pdev);
> +
> +	unregister_virtio_device(&transport->vdev);
> +	platform_set_drvdata(pdev, NULL);
> +	dcp_ipcc_deinit(&transport->ipcc);
> +}
> +
> +static int dcp_virtio_transport_suspend(struct device *dev)
> +{
> +	struct dcp_virtio_transport *transport = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = virtio_device_freeze(&transport->vdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = dcp_ipcc_enable_irq_wake(&transport->ipcc);
> +	if (ret)
> +		goto err_restore;
> +
> +	ret = dcp_ipcc_send_power_notify(&transport->ipcc);
> +	if (ret) {
> +		dcp_ipcc_disable_irq_wake(&transport->ipcc);
> +		goto err_restore;
> +	}
> +
> +	return 0;
> +
> +err_restore:
> +	virtio_device_restore(&transport->vdev);
> +	return ret;
> +}
> +
> +static int dcp_virtio_transport_resume(struct device *dev)
> +{
> +	struct dcp_virtio_transport *transport = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = dcp_ipcc_send_power_notify(&transport->ipcc);
> +	if (ret)
> +		return ret;
> +
> +	dcp_ipcc_disable_irq_wake(&transport->ipcc);
> +	if (transport->version == 1)
> +		writel(PAGE_SIZE,
> +		       transport->base + VIRTIO_MMIO_GUEST_PAGE_SIZE);
> +
> +	return virtio_device_restore(&transport->vdev);
> +}
> +
> +static const struct dev_pm_ops dcp_virtio_transport_pm_ops = {
> +	.suspend = dcp_virtio_transport_suspend,
> +	.resume = dcp_virtio_transport_resume,
> +};
> +
> +static const struct of_device_id dcp_virtio_transport_of_match[] = {
> +	{ .compatible = "qcom,dcp-virtio" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, dcp_virtio_transport_of_match);
> +
> +static struct platform_driver dcp_virtio_transport_driver = {
> +	.probe = dcp_virtio_transport_probe,
> +	.remove = dcp_virtio_transport_remove,
> +	.driver = {
> +		.name = "qcom-dcp-virtio",
> +		.of_match_table = dcp_virtio_transport_of_match,
> +		.pm = &dcp_virtio_transport_pm_ops,
> +	},
> +};
> +
> +int dcp_virtio_transport_register(void)
> +{
> +	return platform_driver_register(&dcp_virtio_transport_driver);
> +}
> +
> +void dcp_virtio_transport_unregister(void)
> +{
> +	platform_driver_unregister(&dcp_virtio_transport_driver);
> +}

Turn it into a separate driver, use module_platform_driver().

-- 
With best wishes
Dmitry
