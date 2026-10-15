Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33292517BA7
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 12:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067779; cv=none; b=ZWv54sc+fB7TfB0dsXEr7GHR5TL2CeINbIcexwBoB65hfroB9cGucTlCvM3AYQHhtof0uPE7m7mV2X4HsGISrWetB4epo8FetdNTMXrlUurRXz6/aRB7P/O266WGiYKg3XEKSmdTjskJsYMVHHlPPTyTU8mjKyN9Qp4NN01oRXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067779; c=relaxed/simple;
	bh=+GWXjO++bt445maJ7KXzjm7w6wD7rI3S41xAtt7oM+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwlDrpsgoPdZRxPpPEEO7FoFDCGbAzsDi9Wi4skTh2iDmXaeu+MitOvkemDfRZ4sh8spbekV2DyD8VRT1pL6PBvpjDCd5gzVJwSI/xMgZB3QL27r+ngtfH352OOWBxnD00RKVVORDjoZwZdVSJtcO/SbfDHD2uEcwWIMZI9UpP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9ppO3g0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXzXpQAc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9ppO3g0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXzXpQAc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOvd2114165
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 12:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RRJYuqx0ug7Hndpab8ssF0q5Hh2eCFFk991vP6yPy4s=; b=f9ppO3g0mrHdBgBo
	ooYckRIy+5fP91edAV5+PiqYRnUEmF4ipmNqlhz6UCNCsqJ9dGdUkbjziJefUwj1
	EbGDoJhmduH7Xx0VGSka41zv1+jwJVeo4JYN0oUy2gJrG2e25mD5gnwgguMMaMAx
	8nn5SIDXr1B9kgG/Ey9MxyNTHgiulS0y3s0eBJ3m2xkr4FlAwQeHzNc+lcq9Xi+L
	nu+YdCQ4OeIxsfiS59kE+H5t7LCh0jEvtkkVYsuizh5ZLA5Ygd7e65f3Xdtqbgqo
	FTxvBaYo3pifnwLh3/QPISDTxVgzQcGLnSnsYJkboBjqMuy3H4jVzE2+Op9mdlqh
	6vCZxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyb1x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 12:36:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so193350585a.3
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 05:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792067776; x=1792672576; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRJYuqx0ug7Hndpab8ssF0q5Hh2eCFFk991vP6yPy4s=;
        b=YXzXpQAcCUcNNqF8TWwqs5Hc3ewvo3NmVAeAZkNmnoqeZuwAtegngU/ENsf/gs7Jeh
         5rlZ3WmEtjTctJb5MngX56HcMeG7lA8oVV6W9rUYDLeOPK2kvZccX0LeyfSjarGezLwf
         nJCqRLKC7SPkL8IEb2ugR/pxDNRVBe+D7fX/B9x7f7mAjeB7FxCwaeLD+Ze4704GXVLu
         yDic0P/wgsPo1Qzw3dCMJN4/44Qmt6xIV+XBVs/D1WdUJf36HjE+pPMdaH6nrpl+xpK1
         bZ8FukCet+RyUrNcgIo4teKDSZDp8/HzORFbWgaBaQTWEAFP1s67D/9wU7Tk/hYoC4GX
         kSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792067776; x=1792672576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RRJYuqx0ug7Hndpab8ssF0q5Hh2eCFFk991vP6yPy4s=;
        b=MrXF6uH68l6UqYP9HfmCeMBFt9Ynih8HjN6mHPOKLNO/v77mM1/Je9dsnMwCJahOYL
         wqtofrkoZbtaZ+V135Ck+zr2qOlofnHXIyPVg969JTOjOuCT0SypZ2digOwIgPdOu9Nd
         q0O/cr7vy32df3O7EnfQDGGbK/FwiQEfRvuQUr0KlT4M3/fNNpagoX28zizdnFQS+Vl7
         O8nBzAUqCQy2as7Ste7AP4SwsQm7W3P5iqvsjV9W9O/LJDXRgER6Lq9o04DCCOVFkdSr
         QTAcrtIXPzTtK6N5o1XvsIJcYO9WY6idSX33Oi0ggQMOfSqndplWeKyEB+SELOf8BxaN
         akCA==
X-Forwarded-Encrypted: i=1; AKwUvBzKrRB+YhfEoi/poqAdyNXtYrL96r9ovUOLqwgpuVswHLGhBmn9GFNf/mVOq2Pj5b6UxoqcdDCPzW1qhw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJsK0BNWftmzVMpgBCPK3gcK1cE0dAZY9yK9A1WpF7/LUne+vD/
	3XeXcsROZmKMkCW74rvEYq4rtfl4jnEx56bF+jrFlY8mSydRZhWdmaH4XScz9ZNN2dhGu73kQmu
	Um4lsd+IdSq4OB3pN2yztqUkesg+GY3XSaGuZ7QtVg4NTgpowGtGUqiKT6Lc6pVz5OQ==
X-Gm-Gg: AYBFou1o7WG/+tWfBnsR1lCJKQC2yNE8dem3Q9EOg+JleWN+G0SKa6t32imZIthH//y
	73LWzZMFREy0YCh2vRa02qKEKSxGpWn0Jcj7oRUkFPfC+ReIcjR6coKsOFa0DOWweXMgAfAXT+Y
	9gOazta+VCH1zSiRRrHGb99aIuIy2Mk3T4uFd7cEZgkdd8F1i+PN3xHM05eC1KvVA1K1xDGLOt3
	gY2pK+A2zdfTDV348rYS3bq/rlFr0jkxGu37qaEFzec3MQypFQ+LsP8w/BAuqg31fgWYSmZtCG1
	DmV6uZ87apns2gqaku16Vpqr2PK0O262O7Ih/TUr0JXJE9cu6LL0JsM/y3AvIfw+P0IXdtwmD2T
	tj5rbu/4SKXD+BpzB0axAGO7PIpERn+LgczCFt/5nvnUfYKvHW/ZBNjhsue8Dgc0TC4A1fs+3xU
	J/+cYV8N3sxfEu
X-Received: by 2002:a05:620a:178d:b0:93d:f7ac:4706 with SMTP id af79cd13be357-93ebd0bd260mr3010922685a.9.1792067776066;
        Thu, 15 Oct 2026 05:36:16 -0700 (PDT)
X-Received: by 2002:a05:620a:178d:b0:93d:f7ac:4706 with SMTP id af79cd13be357-93ebd0bd260mr3010913485a.9.1792067775224;
        Thu, 15 Oct 2026 05:36:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d704c1sm1293904e87.25.2026.10.15.05.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:36:13 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:36:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 03/13] drm/msm/dcp: Add HFI transport over VirtIO
Message-ID: <i2wnkjvzds5wqpvf6svghcwmg4l3muddf7ksieeadran2xd7jd@pvs7cavr3x5g>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-3-48aad0fe4f72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015-jshekhar-drm-msm-dcp-v1-v1-3-48aad0fe4f72@oss.qualcomm.com>
X-Proofpoint-GUID: ZA_--SGGqjyyj3SEhHv0Inr6unYfu1vv
X-Proofpoint-ORIG-GUID: ZA_--SGGqjyyj3SEhHv0Inr6unYfu1vv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfXwgBi+GqyLQT2
 Dej1DbiGYNicK2PfJdc3pgwzCXvnUPWlJavmrjxgymbCZPgGUOLJnKBZSN2qMbhAk+2ZRixVVoB
 G+UFeGJ7AB9BSqf4DG138muOiLBn2CU=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0c8c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=76646x4wTrqYLC7QdToA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfX3jA0j3YS2LOu
 mkofOjATsHpk8L/F39RgSw8cJctJgqWblXTVSdRhHqH6Q8TZBb2h65hM3UKiqpGhZlUH+UfV3k2
 mwdkP+AUXzcNGwTF1qU55DWp9sBNJ1V0S7h2mEkDQACvb7cC85SjGeoUZJfWmRgoKKUi90mnCJ0
 f9sib7eQJirNl70YqBd5dUEXfAWzYrZdHUaIBtaPkmxMppEMx491rxdK5HBVz73VplCi0mU1Xys
 9n2XJPQUtngqkuR0LZLwsKFyvJS7EJAtlfEkKWlvgsPweGDtj8tNGTZwnIyGAhZ0deMFDv3zMYV
 WxR+MJP92qwSzrhSleWyJ94LngeX9kvPNtsws1ZSoEgknYP7jMnSjMRVknfJ55tQKM8suf7JdAa
 xuIfeZ7h+WrWvaRwNgyT1C6n+r0cJwuS2q8ns0VLAbPwOkgyOHBAY9B9+cb8zVnmGY+rty38IpP
 Qd3ahRVPdtZWAUYNqPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150050

On Thu, Oct 15, 2026 at 01:08:23PM +0530, Jayant Shekhar wrote:
> DCP firmware owns the display hardware, so the MSM DRM driver needs a
> transport for HFI commands, responses, and asynchronous display events.
> 
> Add the VirtIO command and response queues used to communicate with DCP.
> Allocate command, response, and capability buffers through the DMA API
> using the firmware-visible IOVA window. Track synchronous commands and
> asynchronous responses, dispatch HFI callbacks, and synchronize queue
> teardown with in-flight transactions.
> 
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> Assisted-by: LLM

You haven't read Documentation/process/. Sad.

> diff --git a/drivers/gpu/drm/msm/dcp/dcp_drv.h b/drivers/gpu/drm/msm/dcp/dcp_drv.h
> new file mode 100644
> index 000000000000..bf6c34af43a0
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/dcp_drv.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __DCP_DRV_H__
> +#define __DCP_DRV_H__
> +
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_device.h>
> +#include <linux/virtio.h>

Are all these headers required for this header?

> +
> +#include "dcp_hfi.h"
> +
> +struct dcp_dpu_kms;
> +
> +struct dcp_drv {
> +	struct virtio_device	*vdev;
> +	struct platform_device	*dcp_subsystem_dev;
> +	struct device_dma_parameters dcp_subsystem_dma_parms;
> +	struct device_node	*dcp_subsystem_node;
> +	struct dcp_hfi		*hfi;
> +	struct dcp_dpu_kms	*kms;
> +	struct dcp_caps		 caps;
> +	struct notifier_block	 panic_notifier;
> +};
> +
> +#endif /* __DCP_DRV_H__ */



> +
> +#define DCP_MAX_DISPLAYS	4
> +
> +#define DCP_FEAT_DSC		BIT(0)
> +#define DCP_FEAT_HDR		BIT(1)
> +#define DCP_FEAT_SRC_SPLIT	BIT(3)
> +#define DCP_FEAT_CURSOR		BIT(4)

What kind of features are those?

> +
> +#define DCP_MAX_SSPP_COUNT	16
> +#define DCP_MAX_VIG_PIPES	DCP_MAX_SSPP_COUNT
> +#define DCP_MAX_DMA_PIPES	DCP_MAX_SSPP_COUNT
> +
> +#define DCP_MAX_BLOCKS			8
> +
> +/* Pipe indices encode the rectangle ID in bits 31:24. */
> +#define DCP_REC_ID(x)		(((x) & 0xff000000) >> 24)
> +
> +/* Capabilities parsed from DEVICE_INIT responses. */
> +struct dcp_caps {
> +	u32 dcp_hw_rev;
> +	u32 hw_rev;
> +	u32 fw_rev;
> +
> +	u32 num_vig_pipes;
> +	u32 vig_pipe_ids[DCP_MAX_SSPP_COUNT];
> +	u32 virt_vig_count;
> +	u32 vig_r1_indices[DCP_MAX_SSPP_COUNT];
> +
> +	u32 num_dma_pipes;
> +	u32 dma_pipe_ids[DCP_MAX_SSPP_COUNT];
> +	u32 virt_dma_count;
> +	u32 dma_r1_indices[DCP_MAX_SSPP_COUNT];
> +
> +	u32 num_crtcs;

CRTCs? Or mixers?

> +
> +	u32 dsi_count;
> +	u32 dsi_indices[DCP_MAX_BLOCKS];
> +	u32 max_dsi_resolution;

If these are parsed, why is it still u32 rather than two resolutions?

> +
> +	u32 dp_count;
> +	u32 dp_indices[DCP_MAX_BLOCKS];

Unused, drop

> +
> +	u32 active_pipes_mask[DCP_MAX_DISPLAYS];

Unused. Drop all unused fields.

> +
> +	u32 max_width;
> +	u32 max_height;

max width/height of... what?

> +	u32 max_planes;
> +	u32 features;
> +	bool valid;

How can it be invalid?

> +
> +	bool dyn_clk_support;

??

> +};
> +
> +struct dcp_hfi_buf {
> +	void *data;
> +	dma_addr_t dma_addr;
> +	size_t size;
> +	struct scatterlist sg;
> +	struct dcp_hfi_completion *comp;
> +	struct list_head node;
> +};
> +
> +struct dcp_hfi_completion {
> +	struct completion done;
> +	int status;
> +	void *resp_data;
> +	size_t resp_len;
> +	u32 packet_id;
> +};
> +
> +#define DCP_HFI_RESOURCE_VOTE_BUF_SIZE	256
> +
> +/* Wire-format resource vote entry. */
> +struct dcp_resource_vote_pair {
> +	u32 key;
> +	u64 value;
> +};
> +
> +struct dcp_resource_vote_wire {
> +	__le32 key;
> +	__le64 value;
> +} __packed;
> +
> +struct dcp_hfi {
> +	struct device *dev;
> +	struct dcp_drv *drv;
> +
> +	struct device *dma_dev;
> +
> +	struct virtqueue *cmd_vq;
> +	struct virtqueue *resp_vq;
> +
> +	struct dcp_hfi_buf *cmd_pool;
> +	struct list_head cmd_free_list;
> +	/* Protects cmd_free_list and command buffer ownership. */
> +	spinlock_t cmd_lock;
> +
> +	struct dcp_hfi_buf *resp_pool;
> +	/* Protects response queue draining and power callback publication. */
> +	spinlock_t resp_drain_lock;
> +	struct list_head resp_repost_list;
> +	struct delayed_work resp_repost_work;
> +	struct xarray pending_xa;
> +	/* Protects pending_xa. */
> +	spinlock_t pending_lock;
> +	atomic_t packet_id;
> +	atomic_t shutdown_in_progress;

This all demands at least some description or kernel docs.

> +
> +	struct work_struct resource_vote_work;
> +	/* Protects resource_vote_buf, resource_vote_len, and callback state. */
> +	spinlock_t resource_vote_lock;
> +	u8 resource_vote_buf[DCP_HFI_RESOURCE_VOTE_BUF_SIZE];
> +	u32 resource_vote_len;
> +	u32 resource_vote_generation;
> +	void (*resource_vote_cb)(struct dcp_drv *drv,
> +				 const struct dcp_resource_vote_pair *pairs,
> +				 u32 count);
> +
> +	/* Protects caps_cache pointer and its lifetime. */
> +	spinlock_t caps_lock;
> +	/* Serializes capability transactions and cache detach/free. */
> +	struct mutex caps_cache_lock;
> +	struct dcp_hfi_caps_cache *caps_cache;

What's the point of keeping it as a pointer? Just embed it here and drop
the locks. Read the caps while the devices is not visible so that there
are no concurrent users.

> +
> +	void (*hotplug_cb)(struct dcp_drv *drv, u32 intf_idx, bool connected);

Why do we need these callbacks? Can you call the functions directly?

> +	void (*error_cb)(struct dcp_drv *drv, u32 display_id, u32 error_code);
> +
> +	void *power_control_priv;
> +	void (*power_control_cb)(void *priv, u32 display_id,
> +				 u32 power_mask, bool enable, u32 packet_id);
> +};
> +
> +int dcp_hfi_init(struct dcp_drv *drv, struct virtio_device *vdev,
> +		 struct virtqueue *cmd_vq, struct virtqueue *resp_vq,
> +		 struct device *dma_dev);
> +void dcp_hfi_set_power_control_cb(struct dcp_hfi *hfi, void *priv,
> +				  void (*cb)(void *priv, u32 display_id,
> +					     u32 power_mask, bool enable,
> +					     u32 packet_id));
> +void dcp_hfi_clear_power_control_cb(struct dcp_hfi *hfi, void *priv);
> +void dcp_hfi_stop(struct dcp_hfi *hfi);
> +void dcp_hfi_quiesce_queues(struct dcp_hfi *hfi);
> +void dcp_hfi_deinit(struct dcp_hfi *hfi);
> +
> +void dcp_hfi_resp_callback(struct virtqueue *vq);
> +void dcp_hfi_cmd_callback(struct virtqueue *vq);
> +
> +int dcp_hfi_send_sync(struct dcp_hfi *hfi, u32 cmd,
> +		      enum hfi_cmd_buff_type cmd_type, u32 object_id,
> +		      enum hfi_packet_payload_type payload_type, void *payload,
> +		      u32 payload_size, u32 tx_flags, void *resp_data,
> +		      size_t resp_len, unsigned int timeout_ms);
> +
> +int dcp_hfi_send_no_wait(struct dcp_hfi *hfi, u32 cmd,
> +			 enum hfi_cmd_buff_type cmd_type, u32 object_id,
> +			 enum hfi_packet_payload_type payload_type, void *payload,
> +			 u32 payload_size);
> +
> +int dcp_hfi_send_no_wait_flags(struct dcp_hfi *hfi, u32 cmd,
> +			       enum hfi_cmd_buff_type cmd_type, u32 object_id,
> +			       enum hfi_packet_payload_type payload_type,
> +			       void *payload, u32 payload_size, u32 tx_flags);
> +int dcp_hfi_send_no_wait_atomic_flags(struct dcp_hfi *hfi, u32 cmd,
> +				      enum hfi_cmd_buff_type cmd_type, u32 object_id,
> +				       enum hfi_packet_payload_type payload_type,
> +				       void *payload, u32 payload_size, u32 tx_flags);

You haven't really followed the internal review feedback. You have been
asked to review the indentation. You didnt.

> +#endif /* __DCP_HFI_H__ */
> diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
> new file mode 100644
> index 000000000000..bf27cbf9b8a4
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
> @@ -0,0 +1,1198 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * DCP HFI core transport.
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/unaligned.h>
> +#include <linux/slab.h>
> +#include <linux/scatterlist.h>
> +#include <linux/spinlock.h>
> +#include <linux/virtio.h>
> +#include <linux/workqueue.h>
> +#include <uapi/linux/virtio_mmio.h>
> +
> +#include "dcp_hfi.h"
> +#include "dcp_hfi_priv.h"
> +#include "dcp_drv.h"
> +#include "hfi/hfi_packet.h"
> +#include "hfi/hfi_packer.h"
> +#include "hfi/hfi_unpacker.h"
> +#include "hfi/hfi_commands_device.h"
> +#include "hfi/hfi_commands_display.h"
> +#include "hfi/hfi_commands_display_events.h"
> +#include "hfi/hfi_defs_common.h"
> +#include "hfi/hfi_defs_display.h"
> +
> +static void dcp_hfi_resource_vote_work(struct work_struct *work);
> +static int dcp_hfi_prepost_resp_bufs(struct dcp_hfi *hfi);
> +
> +u32 dcp_hfi_next_packet_id(struct dcp_hfi *hfi)
> +{
> +	u32 id;
> +
> +	id = (u32)atomic_inc_return(&hfi->packet_id);
> +	if (id == 0)
> +		id = (u32)atomic_inc_return(&hfi->packet_id);

What if something looks at your counter inbetween? Two atomic operations
aren't atomic.

> +	return id;
> +}
> +
> +#define DCP_HFI_BUF_ALLOC_RETRIES	3	/* Bound command-path stalls. */
> +#define DCP_HFI_BUF_ALLOC_SLEEP_US_MIN	30000
> +#define DCP_HFI_BUF_ALLOC_SLEEP_US_MAX	40000
> +
> +static struct dcp_hfi_buf *_dcp_hfi_buf_alloc(struct dcp_hfi *hfi,
> +					      struct list_head *free_list,
> +					       spinlock_t *lock,
> +					       const char *pool_name)
> +{
> +	struct dcp_hfi_buf *buf = NULL;
> +	unsigned long flags;
> +	int retry;
> +
> +	if (atomic_read(&hfi->shutdown_in_progress)) {

This is called drm_dev_get().

> +		dev_dbg(hfi->dev,
> +			"HFI shutdown in progress — refusing %s buffer allocation\n",
> +			pool_name);
> +		return NULL;
> +	}
> +
> +	for (retry = 0; retry <= DCP_HFI_BUF_ALLOC_RETRIES; retry++) {
> +		if (atomic_read(&hfi->shutdown_in_progress))
> +			return NULL;
> +
> +		spin_lock_irqsave(lock, flags);
> +		if (!list_empty(free_list)) {
> +			buf = list_first_entry(free_list,
> +					       struct dcp_hfi_buf, node);
> +			list_del(&buf->node);
> +		}
> +		spin_unlock_irqrestore(lock, flags);
> +
> +		if (buf)
> +			return buf;
> +
> +		if (retry < DCP_HFI_BUF_ALLOC_RETRIES)
> +			usleep_range(DCP_HFI_BUF_ALLOC_SLEEP_US_MIN,
> +				     DCP_HFI_BUF_ALLOC_SLEEP_US_MAX);
> +	}
> +
> +	dev_warn_ratelimited(hfi->dev,
> +			     "HFI %s TX pool exhausted after %d retries — command dropped\n",
> +			     pool_name, DCP_HFI_BUF_ALLOC_RETRIES);
> +	return NULL;
> +}
> +
> +static void _dcp_hfi_buf_free(struct dcp_hfi *hfi, struct dcp_hfi_buf *buf,
> +			      struct list_head *free_list, spinlock_t *lock)
> +{
> +	unsigned long flags;
> +
> +	buf->comp = NULL;
> +	spin_lock_irqsave(lock, flags);
> +	list_add_tail(&buf->node, free_list);
> +	spin_unlock_irqrestore(lock, flags);

Just call _dcp_hfi_buf_free_locked() under the lock.

> +}
> +
> +static void _dcp_hfi_buf_free_locked(struct dcp_hfi_buf *buf,
> +				     struct list_head *free_list)
> +{
> +	buf->comp = NULL;
> +	list_add_tail(&buf->node, free_list);
> +}
> +

[..]

> +
> +	case HFI_COMMAND_DISPLAY_EVENT_HPD_STATUS: {
> +		u32 intf_idx = pkt_info->id & 0xFFFF;
> +		bool connected = false;
> +
> +		if (pkt_info->payload_ptr &&
> +		    pkt_info->payload_size >=
> +		    sizeof(struct hfi_display_hpd_status)) {
> +			struct hfi_display_hpd_status *hpd =
> +				pkt_info->payload_ptr;
> +			connected = (hpd->dp_state ==
> +				     HFI_DP_STATE_CONNECTED);
> +		}
> +		if (hfi->hotplug_cb)
> +			hfi->hotplug_cb(hfi->drv, intf_idx, connected);
> +		return true;
> +	}
> +
> +	case HFI_COMMAND_DISPLAY_EVENT_PANEL_DEAD:
> +		dev_err(hfi->dev,
> +			"DCP: panel dead display %u\n",
> +			pkt_info->id & 0xFFFF);
> +		if (hfi->error_cb)
> +			hfi->error_cb(hfi->drv, pkt_info->id & 0xFFFF, 0);
> +		return true;
> +
> +	case HFI_COMMAND_DISPLAY_EVENT_HW_RECOVERY:
> +		dev_err(hfi->dev,
> +			"DCP: HW recovery display %u\n",
> +			pkt_info->id & 0xFFFF);
> +		if (hfi->error_cb)
> +			hfi->error_cb(hfi->drv, pkt_info->id & 0xFFFF, 1);

Yep... Drop the callbacks. I think it was also a part of the review.

> +		return true;
> +

Can you split the patches? It really becomes troublesome to review.

-- 
With best wishes
Dmitry
