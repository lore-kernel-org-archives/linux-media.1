Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6644E0212
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 13:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069607; cv=none; b=B/wbcD6rUKgTKsASdBpTsh2Tmv4B8oPF2jOj9Z5CFQ88t/7CAUXmCmGwuvkLvCGYYLK5+ATILhxYlFZTRz6QGdhs/XYKZrkXHPyHp78YobStZ1zxFpxvEyJDCUI4lXC1S8YW/xHUOzqwRJAP77JrZEHoQV7z8dN2ZPeLGCuLuB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069607; c=relaxed/simple;
	bh=FgYjLtr7lTVOy3hpwD0+k8mP1nayW9MiiKQC/xlWnPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idEBAVjwFP0AhPk530q3WpHCgCQbCfEQbRChOsZa1tzEJw3c6C+ak8/gZJoDJ4MO8ozpCJmwAOOLYaRMlK3vTa/3avtZqUS7ITHujOb13GxHYh3li/S5ejux5nII6nhPDumDGSwXRIeWM1zYx3MROW1Xr44nacfjjI9Af4nb568=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVICmAu1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1fQcviC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVICmAu1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1fQcviC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jn483408842
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 13:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nUrRKow716VLDkdUtBEZdLpuUza6F3nodlWQImDHgE8=; b=iVICmAu1oWEE9d4y
	4Z7NDQdxANtuzADVuyeyyMY0KPy5nkDV/E0rDMZLSv2xKWCPSyeo5vYZCYFTeZo1
	1V3/gylNDFX9MJLxijPOVsZrxvM6pKK2Xb9dBCURhSOKrDbZ79Ih+EaiYRLINkpM
	rJPnD73nNu7SflcV/zMNvwrOSqA6Az/q5ZPORDnwJDJWCSnb5ucyWDf4vwRIq0xa
	GXSfWDnlK6Q+XJJXyMmw2BRkWray+HDnm2kVVpsit2QFTMSTwoYPmdT3oSyCzaEW
	fAFCUTjekoHYTuawJQZIQ8pU0KG+hy9nVDaunAbNQw98zQ9mITuR6+uh7wUx0dS8
	AxqkVA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn2vmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 13:06:43 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e9b3a3b849so780150e0c.0
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 06:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792069603; x=1792674403; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nUrRKow716VLDkdUtBEZdLpuUza6F3nodlWQImDHgE8=;
        b=K1fQcviCZt3pJoXxKWWODCMDuCq1XAJcgg6yBewqVd3ZEYVSW17twJomH1CT36wQ3j
         cfklJlkjQ+zAS9Wnz+GmHr/S96djee/WoKN3YSwzvpKZkAdLz1c14t4zoGktw/calefM
         fkwRAAnCsliRvdxClhDWb7tsxbbarbWCea3TZT5faV1BKX6FdwbFMR2T2KliDg5oJ1ct
         Wtb5Ixq46XH8XO9HfQOjg3Dy+RQruxcFhqEpzVCwH2eAdwhk56BrV1L2TWWPGv2hu0Vp
         nDuxwTXW1+dsJjWU92O7iVPZA1nU+rpfUp3i+nigi3bCy4eiZNX5dCd7QSw2qcvq1hfm
         10JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069603; x=1792674403;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nUrRKow716VLDkdUtBEZdLpuUza6F3nodlWQImDHgE8=;
        b=z0hOPJS3eFc91mdA53cDV5827iiRTG7xzprlUrZxesQrvkJVxeiOthpUZlla3tJuNG
         1FiMsm9cOBMKLcQf56U6MW8Fb5LsO3lPg8jWDpzglfjfldG/bfN9edTs/YqE8c+3DL3/
         f7KrQk5zHRqNhqt9uRcJBqCrZmkYzg7ha3eJ3R/jc6ywUPB6SVfnhk3Q7VqBVYJomPf4
         hz002wdelsJpb3+/t9iPtGEqanRoELVR2mAXcYZxN7kpLa8COrSTh2vGoK6IVCofzV3L
         cp1mZIlUVwQjAZYfpbtYqvoT+CxdgE5vzgYq0LGb0IPIcOuZ+cwY7wCV/KKMRWdSOpPL
         w5Mw==
X-Forwarded-Encrypted: i=1; AKwUvBy3DzJREtN6HxkdnUsHNOsvW3HsSULKbyHs9BrRgBKAO+ZVL7UrkMFzCTYGvHYPODDayZ5X+IDmRCDOgA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK5FQoFA+VPCqQ3wFND4pGx/OmBEMuEnOgQPk/0YRVw5DWgnjI/
	HfqtsE6DPBubJ7OmqnlBPjQEgBVB4zbX7r72I67jleV/fKSTjEZU+Yxbvyr5HVGpPwBmkXFH2pF
	jJtvo3JWQ7qH7R008ZnK6INFqQwTtzKBJRgTur4FN6/IUSscMuSBb5D8074eH5L7Ucg==
X-Gm-Gg: AYBFou1+NT12mfziW5qVx9jPpZr18zJsf8BwHr4pzTicP68h/wQf8ZQMZiBCet1oIxg
	onptPm+7eTChcRZdI1z42jfYgWZiWdJFXuQzu9Z4KK5XyPq3MFPaUGKfhyDnpN6c9TfcvFI/E9T
	rVJe99X37rQPw0KPuJpJAu+awZdNriUGV2nj5iCcHOnxbXwFQbgyy2SI0+irNmloi9BqXbnJx4b
	iQPf3ZY9ONNc1q14DnhZ9mQZ4gEJYPnfzPzcC/okly0oQ0xK7MPSpmvlyZnvT3/54cVNvpAZ/gP
	t9Vi+CS3cmypxTX2EeTLsmVuWoaDsGxkqAjmkzsRd4EcvGNuLPywNBtW2XaMLe5EWhPluCwxL0c
	h92LaEf6+dAfwpSYoMAajdhqK6fnbDGiVqYKkevbEi0uCcTxdZzV5ajVtb9DelV2cOXs3qo20zk
	nCWlbYVnCY+642
X-Received: by 2002:a05:6122:180c:b0:5ea:8f37:3063 with SMTP id 71dfb90a1353d-5ea8f37349dmr372344e0c.17.1792069602925;
        Thu, 15 Oct 2026 06:06:42 -0700 (PDT)
X-Received: by 2002:a05:6122:180c:b0:5ea:8f37:3063 with SMTP id 71dfb90a1353d-5ea8f37349dmr372301e0c.17.1792069602282;
        Thu, 15 Oct 2026 06:06:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be420bbbf0sm225187e87.79.2026.10.15.06.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:06:40 -0700 (PDT)
Date: Thu, 15 Oct 2026 16:06:38 +0300
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
Subject: Re: [PATCH 10/13] drm/msm/dcp: Add VirtIO transport and platform
 driver
Message-ID: <gegmh2qb7odywjesxlvrm6knjjwsx6g2xfif2s6wq5zn7y33q4@gpdwz2ajlm4i>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-10-48aad0fe4f72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015-jshekhar-drm-msm-dcp-v1-v1-10-48aad0fe4f72@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MiBTYWx0ZWRfX9K81Cgnucj/+
 +ghSOm9+XklZr6S2uSqOCTBDFi3PIlEqZvB9Mib0q5PDY0TiswvKRq+wLVHDMr/q72+q+9Hywtf
 QESHBa65akJpJdJpxAssEZHTvVyC+zshOGK1kSVp2nRfNmq4Xlim2S2umsQBl29ZqRDrqON1spS
 GrePMS0RwG85rbnsc8xSz1bXOThcJx+LBKCaC2+rWepuBp95vpGibHEsr12yHxE61/jqc47kZ64
 8YDjEUeB9Q6tG8FWtrNO/8SMJGqRdjNNGpRXbkFA1dh4vA4wcpeWXlWZlJ1IVBhud4o63Oev7CN
 DFnyW+6I7fIhfd8qKhOOucI4678wJEsrh2OsXhUsWSq8K82poAcGHbJ7/fJOdnk/PrOTzOxQYTQ
 TuZjHmswQEop5C9Z/3zAI3ahHAAt229axtTQ1DSmBQb169CHTViug3U17H8T2iPUvYKmohuhDMt
 Qxya8wGtw6HAalF+Yqw==
X-Proofpoint-GUID: V54GUvM24KnQyxwmCGG5TXKdLf3n7XAI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MiBTYWx0ZWRfX2yv8H4hLE/Ri
 JM+SRxNV0BBGF7yNV3PV8NzxSQiMgCWO2fCIQrItbiAosl8FTTe23MsoeiR/dK4TKg3+CXAuyKh
 26kLaXkOSg3A+ayfULkBcQw5cRftmYk=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0cfe3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=8UvxyRjR-zxYBsYGV0wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: V54GUvM24KnQyxwmCGG5TXKdLf3n7XAI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150052

On Thu, Oct 15, 2026 at 01:08:30PM +0530, Jayant Shekhar wrote:
> DCP display hardware is controlled by firmware and exposed to Linux as a
> VirtIO function. The MSM DRM driver needs a platform driver to establish
> the transport, DMA/IOMMU address spaces, power-notify path, and display
> component.
> 
> Add the VirtIO-MMIO transport and DCP platform-function driver. Set up the
> DMA/IOMMU identity, IPCC client, VirtIO queues, HFI transport, firmware
> capability handling, and MSM DRM registration. Synchronize suspend, resume,
> remove, and shutdown with in-flight HFI activity.
> 
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> Assisted-by: LLM
> ---
>  drivers/gpu/drm/msm/Makefile         |   2 +
>  drivers/gpu/drm/msm/dcp/dcp_drv.c    | 245 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dcp/dcp_drv.h    |  19 +++
>  drivers/gpu/drm/msm/dcp/dcp_virtio.c | 302 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dcp/dcp_virtio.h |  22 +++
>  5 files changed, 590 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 9910bd4f306d..e57aee483137 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -83,6 +83,8 @@ msm-display-$(CONFIG_DRM_MSM_DCP) += \
>  	dcp/dcp_ipcc.o \
>  	dcp/dcp_plane.o \
>  	dcp/dcp_encoder.o \
> +	dcp/dcp_drv.o \
> +	dcp/dcp_virtio.o \
>  	dcp/hfi/hfi_packer.o \
>  	dcp/hfi/hfi_unpacker.o \
>  	dcp/hfi/hfi_utils.o
> diff --git a/drivers/gpu/drm/msm/dcp/dcp_drv.c b/drivers/gpu/drm/msm/dcp/dcp_drv.c
> new file mode 100644
> index 000000000000..e7016937a028
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/dcp_drv.c
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + * DCP VirtIO driver.
> + */
> +
> +#include <linux/component.h>
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/panic_notifier.h>
> +#include <linux/pm_runtime.h>
> +
> +#define DCP_DPU_AUTOSUSPEND_DELAY_MS	5000
> +
> +#include "dcp_drv.h"
> +#include "dcp_hfi.h"
> +#include "dcp_ipcc.h"
> +#include "dcp_virtio.h"
> +#include "msm_drv.h"
> +#include "msm_kms.h"
> +
> +int dcp_subsystem_dev_init(struct dcp_drv *drv)
> +{
> +	struct virtio_device *vdev = drv->vdev;
> +	struct device_node *dcp_subsystem_node;
> +	struct platform_device *pdev;
> +	struct device *dev;
> +	char busid[32];
> +	int ret;
> +
> +	dcp_subsystem_node = of_get_child_by_name(vdev->dev.parent->of_node,
> +						  "dcp-subsystem");
> +	if (!dcp_subsystem_node) {
> +		dev_err(&vdev->dev, "no dcp-subsystem DT node\n");
> +		return -ENODEV;
> +	}
> +
> +	snprintf(busid, sizeof(busid), "dcp-subsystem.%s", dev_name(vdev->dev.parent));
> +
> +	/*
> +	 * DCP is discovered through VirtIO, but display/HFI buffers must be
> +	 * mapped through the dcp-subsystem node's DMA/IOMMU identity. Create a
> +	 * platform device for that DT node so DMA API and msm_kms_init_vm() use
> +	 * the display function's IOMMU domain.
> +	 */
> +	pdev = of_platform_device_create(dcp_subsystem_node, busid, vdev->dev.parent);
> +	if (!pdev) {
> +		dev_err(&vdev->dev, "dcp_subsystem_dev creation failed\n");
> +		of_node_put(dcp_subsystem_node);
> +		return -ENODEV;
> +	}
> +	dev = &pdev->dev;
> +
> +	dev->dma_parms = &drv->dcp_subsystem_dma_parms;
> +	dma_set_max_seg_size(dev, UINT_MAX);
> +
> +	ret = of_dma_configure_id(dev, dcp_subsystem_node, true, NULL);
> +	if (ret) {
> +		dev_err(dev, "of_dma_configure_id failed: %d\n", ret);
> +		goto err_destroy;
> +	}
> +
> +	if (!device_iommu_mapped(dev)) {
> +		dev_err(dev, "no IOMMU group attached\n");
> +		ret = -ENODEV;
> +		goto err_destroy;
> +	}
> +
> +	dev_dbg(dev, "dcp-subsystem: iommu_mapped=%d iommu_group=%d\n",
> +		device_iommu_mapped(dev),
> +		 dev->iommu_group ? iommu_group_id(dev->iommu_group) : -1);
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_set_autosuspend_delay(dev, DCP_DPU_AUTOSUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	drv->dcp_subsystem_dev = pdev;
> +	drv->dcp_subsystem_node = dcp_subsystem_node;
> +
> +	return 0;
> +
> +err_destroy:
> +	of_platform_device_destroy(dev, NULL);
> +	of_node_put(dcp_subsystem_node);
> +	return ret;
> +}
> +
> +void dcp_subsystem_dev_deinit(struct dcp_drv *drv)
> +{
> +	if (!drv->dcp_subsystem_dev)
> +		return;
> +
> +	pm_runtime_disable(&drv->dcp_subsystem_dev->dev);
> +	of_platform_device_destroy(&drv->dcp_subsystem_dev->dev, NULL);
> +	of_node_put(drv->dcp_subsystem_node);
> +	drv->dcp_subsystem_dev = NULL;
> +}
> +
> +int dcp_pm_prepare(struct device *vdev_dev)
> +{
> +	struct dcp_drv *drv = vdev_dev ? ((struct virtio_device *)
> +					  dev_to_virtio(vdev_dev))->priv : NULL;
> +
> +	if (!drv || !drv->dcp_subsystem_dev)
> +		return 0;
> +
> +	return msm_kms_pm_prepare(&drv->dcp_subsystem_dev->dev);
> +}
> +
> +void dcp_pm_complete(struct device *vdev_dev)
> +{
> +	struct dcp_drv *drv = vdev_dev ? ((struct virtio_device *)
> +					  dev_to_virtio(vdev_dev))->priv : NULL;
> +
> +	if (!drv || !drv->dcp_subsystem_dev)
> +		return;
> +
> +	msm_kms_pm_complete(&drv->dcp_subsystem_dev->dev);
> +}
> +
> +static int dcp_pm_ipcc_notify(struct dcp_drv *drv)
> +{
> +	int ret;
> +
> +	if (!drv->ipcc_valid)
> +		return 0;
> +
> +	ret = dcp_ipcc_send_power_notify(&drv->ipcc);

An indirection just for the sake of indirection? Can we drop one-line
wrappers?

> +	if (ret)
> +		dev_warn(&drv->vdev->dev,
> +			 "IPCC power notification failed during PM: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +int dcp_pm_suspend(struct device *vdev_dev)
> +{
> +	struct dcp_drv *drv = vdev_dev ? ((struct virtio_device *)
> +					  dev_to_virtio(vdev_dev))->priv : NULL;
> +
> +	if (!drv || !drv->dcp_subsystem_dev)
> +		return 0;
> +
> +	return dcp_pm_ipcc_notify(drv);
> +}
> +
> +int dcp_pm_resume(struct device *vdev_dev)
> +{
> +	struct dcp_drv *drv = vdev_dev ? ((struct virtio_device *)
> +					  dev_to_virtio(vdev_dev))->priv : NULL;
> +
> +	if (!drv || !drv->dcp_subsystem_dev)
> +		return 0;
> +
> +	return dcp_pm_ipcc_notify(drv);
> +}
> +
> +static int dcp_self_bind(struct device *master, struct device *dev, void *data)
> +{
> +	return 0;
> +}
> +
> +static void dcp_self_unbind(struct device *master, struct device *dev,
> +			    void *data)
> +{
> +}
> +
> +static const struct component_ops dcp_self_ops = {
> +	.bind   = dcp_self_bind,
> +	.unbind = dcp_self_unbind,
> +};
> +
> +int dcp_component_register(struct dcp_drv *drv)
> +{
> +	struct device *dev = &drv->dcp_subsystem_dev->dev;
> +	struct component_match *match = NULL;
> +	int ret;
> +
> +	/*
> +	 * DCP has no host-visible display subcomponents: firmware owns the
> +	 * underlying display blocks. The self component is only the minimal shim
> +	 * needed to enter the existing MSM DRM component-master init path without
> +	 * adding a DCP-specific entry point to common MSM DRM code.
> +	 */

And how does that work with the DSI probing sequences? The panel driver
might be not (yet) available when you probe the DCP. The driver should
register the DSI host, create DSI devices, but the DRM device
registration is only possible when the panel / bridge has attached to
the DSI host. See how it's handled by the mdp4/mdp5/dpu drivers.

> +	ret = component_add(dev, &dcp_self_ops);
> +	if (ret) {
> +		dev_err(dev, "component_add failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	component_match_add(dev, &match, component_compare_dev, dev);

Missing optional GPU match. I think I wrote that before...

> +
> +	ret = component_master_add_with_match(dev, &msm_drm_ops, match);
> +	if (ret) {
> +		dev_err(dev, "component_master_add_with_match failed: %d\n",
> +			ret);
> +		component_del(dev, &dcp_self_ops);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +void dcp_component_unregister(struct dcp_drv *drv)
> +{
> +	struct device *dev = &drv->dcp_subsystem_dev->dev;
> +
> +	component_master_del(dev, &msm_drm_ops);
> +	component_del(dev, &dcp_self_ops);
> +}
> +
> +static int dcp_panic_notifier_cb(struct notifier_block *nb,
> +				 unsigned long action, void *data)
> +{
> +	struct dcp_drv *drv = container_of(nb, struct dcp_drv, panic_notifier);
> +
> +	if (drv->hfi)
> +		atomic_set(&drv->hfi->shutdown_in_progress, 1);
> +
> +	return NOTIFY_OK;
> +}
> +
> +void dcp_panic_notifier_register(struct dcp_drv *drv)
> +{
> +	drv->panic_notifier.notifier_call = dcp_panic_notifier_cb;
> +	atomic_notifier_chain_register(&panic_notifier_list, &drv->panic_notifier);
> +}
> +
> +void dcp_panic_notifier_unregister(struct dcp_drv *drv)
> +{
> +	atomic_notifier_chain_unregister(&panic_notifier_list, &drv->panic_notifier);
> +}
> +
> +void __init msm_dcp_register(void)
> +{
> +	dcp_virtio_register();
> +}
> +
> +void __exit msm_dcp_unregister(void)
> +{
> +	dcp_virtio_unregister();
> +}
> diff --git a/drivers/gpu/drm/msm/dcp/dcp_drv.h b/drivers/gpu/drm/msm/dcp/dcp_drv.h
> index af2db3cf9066..ca8e5bd284e0 100644
> --- a/drivers/gpu/drm/msm/dcp/dcp_drv.h
> +++ b/drivers/gpu/drm/msm/dcp/dcp_drv.h
> @@ -26,6 +26,25 @@ struct dcp_drv {
>  	struct dcp_dpu_kms	*kms;
>  	struct dcp_caps		 caps;
>  	struct notifier_block	 panic_notifier;
> +	struct dcp_ipcc		 ipcc;
> +	bool			 ipcc_valid;
>  };
>  
> +int dcp_subsystem_dev_init(struct dcp_drv *drv);
> +void dcp_subsystem_dev_deinit(struct dcp_drv *drv);
> +
> +int dcp_component_register(struct dcp_drv *drv);
> +void dcp_component_unregister(struct dcp_drv *drv);
> +
> +int dcp_pm_prepare(struct device *vdev_dev);
> +void dcp_pm_complete(struct device *vdev_dev);
> +int dcp_pm_suspend(struct device *vdev_dev);
> +int dcp_pm_resume(struct device *vdev_dev);
> +
> +void dcp_panic_notifier_register(struct dcp_drv *drv);
> +void dcp_panic_notifier_unregister(struct dcp_drv *drv);
> +
> +void __init msm_dcp_register(void);
> +void __exit msm_dcp_unregister(void);
> +
>  #endif /* __DCP_DRV_H__ */
> diff --git a/drivers/gpu/drm/msm/dcp/dcp_virtio.c b/drivers/gpu/drm/msm/dcp/dcp_virtio.c
> new file mode 100644
> index 000000000000..b2aeb03688c9
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/dcp_virtio.c
> @@ -0,0 +1,302 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + * DCP VirtIO device driver.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/err.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/virtio.h>
> +#include <linux/virtio_config.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +
> +#include "dcp_drv.h"
> +#include "dcp_dpu_kms.h"
> +#include "dcp_hfi.h"
> +#include "dcp_ipcc.h"
> +#include "dcp_virtio.h"
> +#include "msm_drv.h"
> +#include "msm_kms.h"
> +
> +static void dcp_virtio_hfi_cleanup(struct dcp_drv *drv);
> +
> +static const unsigned int dcp_virtio_features[] = {
> +	VIRTIO_F_VERSION_1,
> +	VIRTIO_F_NOTIFICATION_DATA,
> +	VIRTIO_F_RING_RESET,
> +	VIRTIO_F_ACCESS_PLATFORM,
> +};
> +
> +/*
> + * The VirtIO core owns transport discovery. This driver owns HFI setup and
> + * creates the DRM component only after firmware capabilities are available.
> + */
> +static int dcp_virtio_probe(struct virtio_device *vdev)
> +{
> +	struct dcp_drv *drv;
> +	struct virtqueue *vqs[DCP_NUM_VQS];
> +	struct virtqueue_info vqs_info[DCP_NUM_VQS] = {
> +		[DCP_VQ_CMD]  = { .name = "cmd",  .callback = dcp_hfi_cmd_callback },
> +		[DCP_VQ_RESP] = { .name = "resp", .callback = dcp_hfi_resp_callback },
> +	};
> +	struct dcp_dpu_kms *dpu_kms;
> +	struct msm_drm_private *priv;
> +	int ret;
> +
> +	dev_dbg(&vdev->dev, "DCP VirtIO probe started\n");
> +
> +	drv = devm_kzalloc(&vdev->dev, sizeof(*drv), GFP_KERNEL);
> +	if (!drv)
> +		return -ENOMEM;
> +
> +	drv->vdev = vdev;
> +	vdev->priv = drv;
> +
> +	if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> +		dev_err(&vdev->dev, "VIRTIO_F_VERSION_1 not negotiated\n");
> +		return -ENODEV;
> +	}
> +	/* Access-platform is required for the firmware-visible IOVA mappings. */
> +	if (!virtio_has_feature(vdev, VIRTIO_F_ACCESS_PLATFORM)) {
> +		dev_err(&vdev->dev, "VIRTIO_F_ACCESS_PLATFORM not negotiated\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = dcp_subsystem_dev_init(drv);
> +	if (ret)
> +		return ret;
> +
> +	ret = dcp_ipcc_init(&drv->ipcc, vdev->dev.parent);
> +	if (ret) {
> +		if (ret == -EPROBE_DEFER)
> +			dev_err_probe(&vdev->dev, ret,
> +				      "IPCC not ready, deferring probe\n");
> +		else
> +			dev_err(&vdev->dev, "IPCC init failed: %d\n", ret);
> +		goto err_fn_dev;
> +	}
> +	drv->ipcc_valid = !!drv->ipcc.power_chan;
> +
> +	ret = virtio_find_vqs(vdev, DCP_NUM_VQS, vqs, vqs_info, NULL);
> +	if (ret) {
> +		dev_err(&vdev->dev, "virtqueue allocation failed: %d\n", ret);
> +		goto err_ipcc;
> +	}
> +
> +	ret = dcp_hfi_init(drv, vdev, vqs[DCP_VQ_CMD], vqs[DCP_VQ_RESP],
> +			   vdev->dev.parent);
> +	if (ret) {
> +		dev_err(&vdev->dev, "HFI init failed: %d\n", ret);
> +		goto err_del_vqs;
> +	}
> +
> +	if (drv->ipcc_valid)
> +		dcp_ipcc_set_resp_vq(&drv->ipcc, vqs[DCP_VQ_RESP]);
> +
> +	/*
> +	 * Keep the device unready until HFI state and virtqueues are initialized.
> +	 * KMS registration below depends on synchronous firmware initialization.
> +	 */
> +	virtio_device_ready(vdev);
> +	virtqueue_kick(drv->hfi->resp_vq);
> +
> +	ret = dcp_hfi_send_device_init(drv->hfi);
> +	if (ret) {
> +		dev_err(&vdev->dev, "HFI DEVICE_INIT failed: %d\n", ret);
> +		goto err_hfi_deinit;
> +	}
> +
> +	ret = dcp_hfi_get_capabilities(drv->hfi, &drv->caps);
> +	if (ret) {
> +		dev_err(&vdev->dev, "HFI GET_CAPS failed: %d\n", ret);
> +		goto err_hfi_deinit;
> +	}
> +
> +	/* Register the display resources before exposing the DRM component. */
> +	ret = dcp_hfi_send_resource_register(drv->hfi);
> +	if (ret) {
> +		dev_err(&vdev->dev, "HFI RESOURCE_REGISTER failed: %d\n", ret);
> +		goto err_hfi_deinit;
> +	}
> +
> +	dev_dbg(&vdev->dev,
> +		"DCP caps: %u displays, max %ux%u, %u planes, features=0x%x\n",
> +		 drv->caps.num_crtcs, drv->caps.max_width, drv->caps.max_height,
> +		 drv->caps.max_planes, drv->caps.features);
> +
> +	dpu_kms = devm_kzalloc(&drv->dcp_subsystem_dev->dev, sizeof(*dpu_kms), GFP_KERNEL);
> +	if (!dpu_kms) {
> +		ret = -ENOMEM;
> +		goto err_hfi_deinit;
> +	}
> +
> +	dpu_kms->drv       = drv;
> +	dpu_kms->pm_dev    = &drv->dcp_subsystem_dev->dev;
> +	dpu_kms->hfi       = drv->hfi;
> +	dpu_kms->caps      = &drv->caps;
> +	dpu_kms->dpus_np   = drv->dcp_subsystem_node;
> +	dpu_kms->iommu_dev = &drv->dcp_subsystem_dev->dev;
> +
> +	ret = msm_kms_init(&dpu_kms->base, &dcp_dpu_kms_funcs);
> +	if (ret) {
> +		dev_err(&vdev->dev, "msm_kms_init failed: %d\n", ret);
> +		goto err_hfi_deinit;
> +	}
> +
> +	priv = devm_kzalloc(&drv->dcp_subsystem_dev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv) {
> +		ret = -ENOMEM;
> +		goto err_hfi_deinit;
> +	}
> +
> +	priv->kms      = &dpu_kms->base;
> +	priv->kms_init = dcp_kms_init;
> +	dev_set_drvdata(&drv->dcp_subsystem_dev->dev, priv);
> +	dpu_kms->rpm_enabled = true;
> +
> +	/* Component binding now sees initialized HFI, capabilities, and IOMMU state. */
> +	ret = dcp_component_register(drv);
> +	if (ret) {
> +		dev_err(&vdev->dev, "component register failed: %d\n", ret);
> +		goto err_hfi_deinit;
> +	}
> +
> +	dcp_panic_notifier_register(drv);
> +
> +	dev_dbg(&vdev->dev, "DCP VirtIO probe complete\n");
> +	return 0;
> +
> +err_hfi_deinit:
> +	dcp_virtio_hfi_cleanup(drv);
> +	goto err_ipcc;
> +err_del_vqs:
> +	virtio_reset_device(vdev);
> +	vdev->config->del_vqs(vdev);
> +err_ipcc:
> +	if (drv->ipcc_valid) {
> +		dcp_ipcc_deinit(&drv->ipcc);
> +		drv->ipcc_valid = false;
> +	}
> +err_fn_dev:
> +	dcp_subsystem_dev_deinit(drv);
> +	return ret;
> +}
> +
> +static void dcp_virtio_hfi_cleanup(struct dcp_drv *drv)
> +{
> +	struct virtio_device *vdev = drv->vdev;
> +
> +	if (!drv->hfi)
> +		return;
> +
> +	dcp_hfi_stop(drv->hfi);
> +	virtio_reset_device(vdev);
> +	virtio_synchronize_cbs(vdev);
> +	vdev->priv = NULL;
> +	dcp_hfi_quiesce_queues(drv->hfi);
> +	vdev->config->del_vqs(vdev);
> +	dcp_hfi_deinit(drv->hfi);
> +	drv->hfi = NULL;

What's the point of setting pointers to NULL? Won't this memory be
kfree()'d soon?

> +}
> +
> +/*
> + * Remove DRM users before tearing down HFI, IPCC, or the VirtIO queues.
> + */
> +static void dcp_virtio_remove(struct virtio_device *vdev)
> +{
> +	struct dcp_drv *drv = vdev->priv;
> +
> +	dev_dbg(&vdev->dev, "DCP VirtIO remove\n");
> +
> +	if (!drv)
> +		return;
> +
> +	dcp_component_unregister(drv);
> +	dcp_panic_notifier_unregister(drv);
> +
> +	dcp_virtio_hfi_cleanup(drv);
> +
> +	if (drv->ipcc_valid) {
> +		dcp_ipcc_deinit(&drv->ipcc);
> +		drv->ipcc_valid = false;
> +	}
> +
> +	dcp_subsystem_dev_deinit(drv);
> +}
> +
> +/* KMS shutdown must complete while the firmware transport is available. */
> +static void dcp_virtio_shutdown(struct virtio_device *vdev)
> +{
> +	struct dcp_drv *drv = vdev->priv;
> +
> +	if (!drv || !drv->dcp_subsystem_dev)
> +		return;
> +
> +	pm_runtime_get_sync(&drv->dcp_subsystem_dev->dev);
> +	msm_kms_shutdown(drv->dcp_subsystem_dev);
> +	pm_runtime_put_noidle(&drv->dcp_subsystem_dev->dev);
> +}
> +
> +/*
> + * Firmware capabilities may change independently of the VirtIO transport;
> + * refresh them without rebuilding the DRM device.

And what does that mean? How can they change?

> + */
> +static void dcp_virtio_config_changed(struct virtio_device *vdev)
> +{
> +	struct dcp_drv *drv = vdev->priv;
> +	int ret;
> +
> +	dev_dbg(&vdev->dev, "VirtIO config changed — re-querying DCP capabilities\n");
> +
> +	if (!drv || !drv->hfi)
> +		return;
> +
> +	ret = dcp_hfi_get_capabilities(drv->hfi, &drv->caps);
> +	if (ret)
> +		dev_err(&vdev->dev,
> +			"config_changed: capability re-query failed: %d\n", ret);
> +	else
> +		dev_dbg(&vdev->dev,
> +			"config_changed: DCP caps updated: %u displays, features=0x%x\n",
> +			 drv->caps.num_crtcs, drv->caps.features);
> +}
> +

[...]

> diff --git a/drivers/gpu/drm/msm/dcp/dcp_virtio.h b/drivers/gpu/drm/msm/dcp/dcp_virtio.h
> new file mode 100644
> index 000000000000..fe244bc5b51a
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/dcp_virtio.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + * DCP VirtIO driver interface.
> + */
> +
> +#ifndef __DCP_VIRTIO_H__
> +#define __DCP_VIRTIO_H__
> +
> +#include <linux/device.h>
> +#include <linux/virtio.h>
> +#include <linux/virtio_ids.h>
> +
> +struct dcp_drv;
> +
> +#define VIRTIO_ID_QPSFI		                52
> +#define VIRTIO_VENDOR_ID_DCP_HFI		    1

I think this was questioned by Bjorn. Is it described somewhere? Is it a
part of the VirtIO spec? If so, add these ids to the VirtIO headers. If
not... then it's squatting. We can't just randomly settle on the ID.

> +
> +int dcp_virtio_register(void);
> +void dcp_virtio_unregister(void);
> +
> +#endif /* __DCP_VIRTIO_H__ */
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
