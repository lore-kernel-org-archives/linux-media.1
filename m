Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742971;
	b=dKEYUGOH10cpIvMKfj+9/9fJvA4hPFk9hR/i2njxlewf7dpOyE3FdZxsRLjA2D8Q3/82
	 FUqOIn/jHY2ARMrtvmY5f8Uc4ch1fDuGfTVTgpfWqtBJGZlc1k18x3gSSWdVF7+fKJ6zI
	 zuIB9lxOUobjz38akVQ8PxuoKHOwwc+qVcXvtqdz3Cg1Teya5VTOtR7PQI4IGY7JQyTY9
	 aPwElFK5M4B9sqOBwaNbE1/g9nyUX1lDF9hpOHwZwq0p3YaZNqsMp47X/uLUuPxHBEy0p
	 9Kje3eA1fTz4fz1iflPnHj/ZUhZTwWOA/wVHHY7YKS9yYnr3tgK6gxtWIMMbiek4b0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CQ2YyH4++3exGu8Dsbj56zfhqJFgMR7Ojx8rJjCB2pU=;
	b=WL9MlMlkQimcLcTDDcIL6TER5Pu/hKCW0oXvCZ8xzJfYJ/MqMkKtWl0DYC/UDUiGK7m7
	 jCJmw1qGDcXmu0PJqYUfZshz2xmczHjtx5+8UyCcpJ/Zf47SZ5G626P719ady4cf9qQwD
	 1XQqEAPFfwIucuCFJ64sId0r8dOPIZQjB7sObTf0clZpDMVwqZcCwRw1PcuzLXOHPBb90
	 WF/P0QNRhvHJ8s7LPHNnkyoG89bnFgvMOb88WeErbKju+GNQ5VmOGg6E9HEApTYy8V6UZ
	 KQjmImSMUtYHAVFnoHZ0bQS6HlelqUfRWohsXY6jHJXpEwttJeRxsOA79VvJbHX9rxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cNcprOtw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iGK+P1jL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D873E606A31F
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D873E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cNcprOtw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iGK+P1jL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F6fT1200748
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CQ2YyH4++3exGu8Dsbj56zfhqJFgMR7Ojx8rJjCB2pU=; b=cNcprOtwMNh5Oi4h
	r3L66XeDSgSmfw/FUnVOAv+B1nuzcciIZBrqAwIhbBqT/42G8t3fianzwYY4Sf9e
	macp0YR1D5KGxxUdvchfH+L1xzAnboF9YT2Cpz7V7ZtrcL9jsYd0tiqH+A+DLrFb
	IPvrNn2ungTZUwLId6ohquj79Dz47wr+R//3FRreEDcYOFmZzzDY8r0CfCs+azBy
	ubR9r8z0ip4ERf2fZGQjak5vSoab0LWEHEhZyx0KJOqpzCUuC7mZihq7NODcy56d
	4niHaV0S0cIU2pORGL9Qe0kANfWbtzUQak4qV/izDkKySV+KDWVcmYO7Kbf47LyB
	BNhHXQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms2mcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:09:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df8d1e91c9so10900025ad.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 01:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792742969; x=1793347769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQ2YyH4++3exGu8Dsbj56zfhqJFgMR7Ojx8rJjCB2pU=;
        b=iGK+P1jLoZJWFPJCVY56cmCV4IpT1RsHJOnlPRF1vgJ1VlnX3iXzL+DrPHBZ5v2dVX
         4mJkZTVfNwcOdsN43Hvm8GtosgS1QINpiehh143OFsLmKmMd6MbUWKYkq2K46wgDVi/E
         bEvK1a7pmsZdhy7nRtOgHo+pQf0E3tEX2dJk+IUWsKsKZ1iRZZZqZ2U5rv98dAW01jxj
         KwqkGnLCrxysp+UpgU2HOeyYsBc6mvHOC2ppuCPQvRY+lUyQpZbF00zJw+0ZlNz+N40t
         e86WvwI23Xok2GrsBiF1E9sjSCVdFdvUhMbhCNmt3pfXezN7TS0rLya1BuhMjuPyLZlC
         NXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742969; x=1793347769;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CQ2YyH4++3exGu8Dsbj56zfhqJFgMR7Ojx8rJjCB2pU=;
        b=KR/PX+O1dre7RYVNZ6cZypbRdPkHp72hbUw053C7J5ARk8w4hQRLrhvFNGXtHeL/Uz
         b+QT1wp5J23cTW6m953r9KY17+Md13ZTCp2tyL1DkhwB84Pl2OU86vnGrSmNxgy3ez5W
         8CCNI3cl+xnu1DFwIKF3yzfIwP8xZTPSsVO04wrEU36PPM7Mmd/oq1C2NE4SoMLIl5iX
         dS6wib474L4xNhCsuFOJlFwWu69Xm9iFTU6aPJc9TqsZ5syiMiLs5V5pfuS/hFC8uLfy
         SDN3WcRzb6fNJoBUpEgoKBIz/qRRGW89ARi5St3EkwAaDxQmG8v+pg1KV1zQ3DHlf7OE
         2pRA==
X-Forwarded-Encrypted: i=1; AKwUvBwGucwGfcxgeSsFHBk/53JCrl/SyEZBbb1dd9jcgCOkRjkGh2SqFLL5kEN2OPw0vuQdZLTZjQ8SR3A8WA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIz6vpNCbG0UPYbv5Dyd36I5YH+wh6VnKInMfUcyIZfzAbAGP3G
	quOX88gJhDM7aLdxcSy0s0JtuhjYX3+pnm86+ljH64X73TDCxX25K/szkhWKF9cLG74USje8nT6
	22SShEujj4amkXeXWKch/8r0+WaDfg9e9gTqAgvymZ9Y8cOoyyi/DwX9AxT38I351Sg==
X-Gm-Gg: AYBFou1J8wxzDqZ0O9LE6CtHO/QtQb2Lg2G6hIxq4QHOV82I3/UHXqpwg3bhj0uUkgM
	eeVodwqIt2+E3r3Er9lYE8oguSmNZvSZ6H5zzIJuzNM4jclSev9ClPsMA4m/PeyQ8koRD8MsjTu
	oSyb6+bZq5IM3RGmLvFyvHkSxygTOiyy8pXnJFK++dd6FKUsD7H0ZjXNGcRukrPkSQt8/6IyW88
	MnkAZ7CjSutUIqLhPcvfnIgRQ9tNYgyzYgAXqOU9uj+z+oOKGwENHoOYSLFf7JH003h7R03RIsV
	OohILBI4s0cKpTDl3lUJIrsxvp1AIDWn3P9SOlKCp/pkNcZRpUH5+MA6uVXaQpwhqmnXIFdTOH0
	54cL6pt4j/vgj+mqLatgjwoV+fqccEsICjw==
X-Received: by 2002:a17:903:2f8e:b0:2e9:776c:d52e with SMTP id d9443c01a7336-2ea7d12b226mr15285855ad.52.1792742968600;
        Fri, 23 Oct 2026 01:09:28 -0700 (PDT)
X-Received: by 2002:a17:903:2f8e:b0:2e9:776c:d52e with SMTP id d9443c01a7336-2ea7d12b226mr15285435ad.52.1792742967925;
        Fri, 23 Oct 2026 01:09:27 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b350f59sm7089615ad.18.2026.10.23.01.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:09:27 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <524d5dfc-c6fe-4346-9264-c5ec98850b23@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:39:17 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] drm/msm/dcp: Add VirtIO transport and platform
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
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
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-10-48aad0fe4f72@oss.qualcomm.com>
 <gegmh2qb7odywjesxlvrm6knjjwsx6g2xfif2s6wq5zn7y33q4@gpdwz2ajlm4i>
Content-Language: en-US
In-Reply-To: <gegmh2qb7odywjesxlvrm6knjjwsx6g2xfif2s6wq5zn7y33q4@gpdwz2ajlm4i>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX51RP/kJPNYbq
 wD/glycy/jvN7weTy9sQnWlIWEpr6hdxXrTA+ZJpf+dzlEh606lX/Riu7ncIyGaILb78z2SCbvE
 J+BPbIvOvPG559Y4XQUTzxy/9DtKuSEk1KCbCHkABudtQPdfoiHzmP+xOr+XxuRTnxf77O9Hyux
 ChWRcRDqk4Ts/HbnWg5WVT6qvzHQenBloPch84H2z/ZO728XvC/VF4RxmTCFBn8vhs7Y4DF09If
 pbG3zkB1+EMvY4XNWJngH+Q+6jbqbmII3aTwG1rVfOH0TeQQRmdmHr5fgZskCVEvhLjxVb/K9MJ
 8zXW8t3gzfVE8ik9hjP+eRA3nSGrcfsqJCl8pNn4qKt4AiJju2crxW3dB0wR+hisHqe2y1TfbM5
 G37Lyh/mMYhiEEt2t6bL6RfSqN8UO4etDhe7CH//e7PoQ+PVJ+SL5nA/6Em3whdIF0l9R+6XYSo
 NkFA/Dj0quheVc5ai9A==
X-Proofpoint-GUID: AI4VS7MdkC2zYI2msWnJDlw5Z0ok6g_U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXzh8kc6PuDaY7
 rbaJ5Xb7gZdTlvkGZGdPP0jvr2YAtyn2EbV9O/2cmu6rOerFcGKN4628N/fnnzGN1cL5erxZRHR
 bGCqlM64v7mn3AS+MzhFA1DbZqnzKLI=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb1639 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=5Ai3m9dWi82lR06rT2wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: AI4VS7MdkC2zYI2msWnJDlw5Z0ok6g_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230032


On 15-10-2026 18:36, Dmitry Baryshkov wrote:
> On Thu, Oct 15, 2026 at 01:08:30PM +0530, Jayant Shekhar wrote:
>> DCP display hardware is controlled by firmware and exposed to Linux as a
>> VirtIO function. The MSM DRM driver needs a platform driver to establish
>> the transport, DMA/IOMMU address spaces, power-notify path, and display
>> component.
>>
>> Add the VirtIO-MMIO transport and DCP platform-function driver. Set up the
>> DMA/IOMMU identity, IPCC client, VirtIO queues, HFI transport, firmware
>> capability handling, and MSM DRM registration. Synchronize suspend, resume,
>> remove, and shutdown with in-flight HFI activity.
>>
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> Assisted-by: LLM
>> ---
>>   drivers/gpu/drm/msm/Makefile         |   2 +
>>   drivers/gpu/drm/msm/dcp/dcp_drv.c    | 245 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dcp/dcp_drv.h    |  19 +++
>>   drivers/gpu/drm/msm/dcp/dcp_virtio.c | 302 +++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dcp/dcp_virtio.h |  22 +++
>>   5 files changed, 590 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>> index 9910bd4f306d..e57aee483137 100644
>> --- a/drivers/gpu/drm/msm/Makefile
>> +++ b/drivers/gpu/drm/msm/Makefile
>> @@ -83,6 +83,8 @@ msm-display-$(CONFIG_DRM_MSM_DCP) += \
>>   	dcp/dcp_ipcc.o \
>>   	dcp/dcp_plane.o \
>>   	dcp/dcp_encoder.o \
>> +	dcp/dcp_drv.o \
>> +	dcp/dcp_virtio.o \
>>   	dcp/hfi/hfi_packer.o \
>>   	dcp/hfi/hfi_unpacker.o \
>>   	dcp/hfi/hfi_utils.o
>> diff --git a/drivers/gpu/drm/msm/dcp/dcp_drv.c b/drivers/gpu/drm/msm/dcp/dcp_drv.c
>> new file mode 100644
>> index 000000000000..e7016937a028
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/dcp/dcp_drv.c
>> @@ -0,0 +1,245 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + * DCP VirtIO driver.
>> + */
>> +
>> +#include <linux/component.h>
>> +#include <linux/device.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/panic_notifier.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#define DCP_DPU_AUTOSUSPEND_DELAY_MS	5000
>> +
>> +#include "dcp_drv.h"
>> +#include "dcp_hfi.h"
>> +#include "dcp_ipcc.h"
>> +#include "dcp_virtio.h"
>> +#include "msm_drv.h"
>> +#include "msm_kms.h"
>> +
>> +int dcp_subsystem_dev_init(struct dcp_drv *drv)
>> +{
>> +	struct virtio_device *vdev = drv->vdev;
>> +	struct device_node *dcp_subsystem_node;
>> +	struct platform_device *pdev;
>> +	struct device *dev;
>> +	char busid[32];
>> +	int ret;
>> +
>> +	dcp_subsystem_node = of_get_child_by_name(vdev->dev.parent->of_node,
>> +						  "dcp-subsystem");
>> +	if (!dcp_subsystem_node) {
>> +		dev_err(&vdev->dev, "no dcp-subsystem DT node\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	snprintf(busid, sizeof(busid), "dcp-subsystem.%s", dev_name(vdev->dev.parent));
>> +
>> +	/*
>> +	 * DCP is discovered through VirtIO, but display/HFI buffers must be
>> +	 * mapped through the dcp-subsystem node's DMA/IOMMU identity. Create a
>> +	 * platform device for that DT node so DMA API and msm_kms_init_vm() use
>> +	 * the display function's IOMMU domain.
>> +	 */
>> +	pdev = of_platform_device_create(dcp_subsystem_node, busid, vdev->dev.parent);
>> +	if (!pdev) {
>> +		dev_err(&vdev->dev, "dcp_subsystem_dev creation failed\n");
>> +		of_node_put(dcp_subsystem_node);
>> +		return -ENODEV;
>> +	}
>> +	dev = &pdev->dev;
>> +
>> +	dev->dma_parms = &drv->dcp_subsystem_dma_parms;
>> +	dma_set_max_seg_size(dev, UINT_MAX);
>> +
>> +	ret = of_dma_configure_id(dev, dcp_subsystem_node, true, NULL);
>> +	if (ret) {
>> +		dev_err(dev, "of_dma_configure_id failed: %d\n", ret);
>> +		goto err_destroy;
>> +	}
>> +
>> +	if (!device_iommu_mapped(dev)) {
>> +		dev_err(dev, "no IOMMU group attached\n");
>> +		ret = -ENODEV;
>> +		goto err_destroy;
>> +	}
>> +
>> +	dev_dbg(dev, "dcp-subsystem: iommu_mapped=%d iommu_group=%d\n",
>> +		device_iommu_mapped(dev),
>> +		 dev->iommu_group ? iommu_group_id(dev->iommu_group) : -1);
>> +
>> +	pm_runtime_set_active(dev);
>> +	pm_runtime_enable(dev);
>> +	pm_runtime_set_autosuspend_delay(dev, DCP_DPU_AUTOSUSPEND_DELAY_MS);
>> +	pm_runtime_use_autosuspend(dev);
>> +
>> +	drv->dcp_subsystem_dev = pdev;
>> +	drv->dcp_subsystem_node = dcp_subsystem_node;
>> +
>> +	return 0;
>> +
>> +err_destroy:
>> +	of_platform_device_destroy(dev, NULL);
>> +	of_node_put(dcp_subsystem_node);
>> +	return ret;
>> +}
>> +
>> +void dcp_subsystem_dev_deinit(struct dcp_drv *drv)
>> +{
>> +	if (!drv->dcp_subsystem_dev)
>> +		return;
>> +
>> +	pm_runtime_disable(&drv->dcp_subsystem_dev->dev);
>> +	of_platform_device_destroy(&drv->dcp_subsystem_dev->dev, NULL);
>> +	of_node_put(drv->dcp_subsystem_node);
>> +	drv->dcp_subsystem_dev = NULL;
>> +}
>> +
>> +int dcp_pm_prepare(struct device *vdev_dev)
>> +{
>> +	struct dcp_drv *drv = vdev_dev ? ((struct virtio_device *)
>> +					  dev_to_virtio(vdev_dev))->priv : NULL;
>> +
>> +	if (!drv || !drv->dcp_subsystem_dev)
>> +		return 0;
>> +
>> +	return msm_kms_pm_prepare(&drv->dcp_subsystem_dev->dev);
>> +}
>> +
>> +void dcp_pm_complete(struct device *vdev_dev)
>> +{
>> +	struct dcp_drv *drv = vdev_dev ? ((struct virtio_device *)
>> +					  dev_to_virtio(vdev_dev))->priv : NULL;
>> +
>> +	if (!drv || !drv->dcp_subsystem_dev)
>> +		return;
>> +
>> +	msm_kms_pm_complete(&drv->dcp_subsystem_dev->dev);
>> +}
>> +
>> +static int dcp_pm_ipcc_notify(struct dcp_drv *drv)
>> +{
>> +	int ret;
>> +
>> +	if (!drv->ipcc_valid)
>> +		return 0;
>> +
>> +	ret = dcp_ipcc_send_power_notify(&drv->ipcc);
> An indirection just for the sake of indirection? Can we drop one-line
> wrappers?
>

Will fix this in v2


>> +	if (ret)
>> +		dev_warn(&drv->vdev->dev,
>> +			 "IPCC power notification failed during PM: %d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +int dcp_pm_suspend(struct device *vdev_dev)
>> +{
>> +	struct dcp_drv *drv = vdev_dev ? ((struct virtio_device *)
>> +					  dev_to_virtio(vdev_dev))->priv : NULL;
>> +
>> +	if (!drv || !drv->dcp_subsystem_dev)
>> +		return 0;
>> +
>> +	return dcp_pm_ipcc_notify(drv);
>> +}
>> +
>> +int dcp_pm_resume(struct device *vdev_dev)
>> +{
>> +	struct dcp_drv *drv = vdev_dev ? ((struct virtio_device *)
>> +					  dev_to_virtio(vdev_dev))->priv : NULL;
>> +
>> +	if (!drv || !drv->dcp_subsystem_dev)
>> +		return 0;
>> +
>> +	return dcp_pm_ipcc_notify(drv);
>> +}
>> +
>> +static int dcp_self_bind(struct device *master, struct device *dev, void *data)
>> +{
>> +	return 0;
>> +}
>> +
>> +static void dcp_self_unbind(struct device *master, struct device *dev,
>> +			    void *data)
>> +{
>> +}
>> +
>> +static const struct component_ops dcp_self_ops = {
>> +	.bind   = dcp_self_bind,
>> +	.unbind = dcp_self_unbind,
>> +};
>> +
>> +int dcp_component_register(struct dcp_drv *drv)
>> +{
>> +	struct device *dev = &drv->dcp_subsystem_dev->dev;
>> +	struct component_match *match = NULL;
>> +	int ret;
>> +
>> +	/*
>> +	 * DCP has no host-visible display subcomponents: firmware owns the
>> +	 * underlying display blocks. The self component is only the minimal shim
>> +	 * needed to enter the existing MSM DRM component-master init path without
>> +	 * adding a DCP-specific entry point to common MSM DRM code.
>> +	 */
> And how does that work with the DSI probing sequences? The panel driver
> might be not (yet) available when you probe the DCP. The driver should
> register the DSI host, create DSI devices, but the DRM device
> registration is only possible when the panel / bridge has attached to
> the DSI host. See how it's handled by the mdp4/mdp5/dpu drivers.
>

I will add dsi component binding in v2.


>> +	ret = component_add(dev, &dcp_self_ops);
>> +	if (ret) {
>> +		dev_err(dev, "component_add failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	component_match_add(dev, &match, component_compare_dev, dev);
> Missing optional GPU match. I think I wrote that before...
>

Will add in v2.


>> +
>> +	ret = component_master_add_with_match(dev, &msm_drm_ops, match);
>> +	if (ret) {
>> +		dev_err(dev, "component_master_add_with_match failed: %d\n",
>> +			ret);
>> +		component_del(dev, &dcp_self_ops);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +void dcp_component_unregister(struct dcp_drv *drv)
>> +{
>> +	struct device *dev = &drv->dcp_subsystem_dev->dev;
>> +
>> +	component_master_del(dev, &msm_drm_ops);
>> +	component_del(dev, &dcp_self_ops);
>> +}
>> +
>> +static int dcp_panic_notifier_cb(struct notifier_block *nb,
>> +				 unsigned long action, void *data)
>> +{
>> +	struct dcp_drv *drv = container_of(nb, struct dcp_drv, panic_notifier);
>> +
>> +	if (drv->hfi)
>> +		atomic_set(&drv->hfi->shutdown_in_progress, 1);
>> +
>> +	return NOTIFY_OK;
>> +}
>> +
>> +void dcp_panic_notifier_register(struct dcp_drv *drv)
>> +{
>> +	drv->panic_notifier.notifier_call = dcp_panic_notifier_cb;
>> +	atomic_notifier_chain_register(&panic_notifier_list, &drv->panic_notifier);
>> +}
>> +
>> +void dcp_panic_notifier_unregister(struct dcp_drv *drv)
>> +{
>> +	atomic_notifier_chain_unregister(&panic_notifier_list, &drv->panic_notifier);
>> +}
>> +
>> +void __init msm_dcp_register(void)
>> +{
>> +	dcp_virtio_register();
>> +}
>> +
>> +void __exit msm_dcp_unregister(void)
>> +{
>> +	dcp_virtio_unregister();
>> +}
>> diff --git a/drivers/gpu/drm/msm/dcp/dcp_drv.h b/drivers/gpu/drm/msm/dcp/dcp_drv.h
>> index af2db3cf9066..ca8e5bd284e0 100644
>> --- a/drivers/gpu/drm/msm/dcp/dcp_drv.h
>> +++ b/drivers/gpu/drm/msm/dcp/dcp_drv.h
>> @@ -26,6 +26,25 @@ struct dcp_drv {
>>   	struct dcp_dpu_kms	*kms;
>>   	struct dcp_caps		 caps;
>>   	struct notifier_block	 panic_notifier;
>> +	struct dcp_ipcc		 ipcc;
>> +	bool			 ipcc_valid;
>>   };
>>   
>> +int dcp_subsystem_dev_init(struct dcp_drv *drv);
>> +void dcp_subsystem_dev_deinit(struct dcp_drv *drv);
>> +
>> +int dcp_component_register(struct dcp_drv *drv);
>> +void dcp_component_unregister(struct dcp_drv *drv);
>> +
>> +int dcp_pm_prepare(struct device *vdev_dev);
>> +void dcp_pm_complete(struct device *vdev_dev);
>> +int dcp_pm_suspend(struct device *vdev_dev);
>> +int dcp_pm_resume(struct device *vdev_dev);
>> +
>> +void dcp_panic_notifier_register(struct dcp_drv *drv);
>> +void dcp_panic_notifier_unregister(struct dcp_drv *drv);
>> +
>> +void __init msm_dcp_register(void);
>> +void __exit msm_dcp_unregister(void);
>> +
>>   #endif /* __DCP_DRV_H__ */
>> diff --git a/drivers/gpu/drm/msm/dcp/dcp_virtio.c b/drivers/gpu/drm/msm/dcp/dcp_virtio.c
>> new file mode 100644
>> index 000000000000..b2aeb03688c9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/dcp/dcp_virtio.c
>> @@ -0,0 +1,302 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + * DCP VirtIO device driver.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/err.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/virtio.h>
>> +#include <linux/virtio_config.h>
>> +#include <linux/scatterlist.h>
>> +#include <linux/slab.h>
>> +
>> +#include "dcp_drv.h"
>> +#include "dcp_dpu_kms.h"
>> +#include "dcp_hfi.h"
>> +#include "dcp_ipcc.h"
>> +#include "dcp_virtio.h"
>> +#include "msm_drv.h"
>> +#include "msm_kms.h"
>> +
>> +static void dcp_virtio_hfi_cleanup(struct dcp_drv *drv);
>> +
>> +static const unsigned int dcp_virtio_features[] = {
>> +	VIRTIO_F_VERSION_1,
>> +	VIRTIO_F_NOTIFICATION_DATA,
>> +	VIRTIO_F_RING_RESET,
>> +	VIRTIO_F_ACCESS_PLATFORM,
>> +};
>> +
>> +/*
>> + * The VirtIO core owns transport discovery. This driver owns HFI setup and
>> + * creates the DRM component only after firmware capabilities are available.
>> + */
>> +static int dcp_virtio_probe(struct virtio_device *vdev)
>> +{
>> +	struct dcp_drv *drv;
>> +	struct virtqueue *vqs[DCP_NUM_VQS];
>> +	struct virtqueue_info vqs_info[DCP_NUM_VQS] = {
>> +		[DCP_VQ_CMD]  = { .name = "cmd",  .callback = dcp_hfi_cmd_callback },
>> +		[DCP_VQ_RESP] = { .name = "resp", .callback = dcp_hfi_resp_callback },
>> +	};
>> +	struct dcp_dpu_kms *dpu_kms;
>> +	struct msm_drm_private *priv;
>> +	int ret;
>> +
>> +	dev_dbg(&vdev->dev, "DCP VirtIO probe started\n");
>> +
>> +	drv = devm_kzalloc(&vdev->dev, sizeof(*drv), GFP_KERNEL);
>> +	if (!drv)
>> +		return -ENOMEM;
>> +
>> +	drv->vdev = vdev;
>> +	vdev->priv = drv;
>> +
>> +	if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1)) {
>> +		dev_err(&vdev->dev, "VIRTIO_F_VERSION_1 not negotiated\n");
>> +		return -ENODEV;
>> +	}
>> +	/* Access-platform is required for the firmware-visible IOVA mappings. */
>> +	if (!virtio_has_feature(vdev, VIRTIO_F_ACCESS_PLATFORM)) {
>> +		dev_err(&vdev->dev, "VIRTIO_F_ACCESS_PLATFORM not negotiated\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	ret = dcp_subsystem_dev_init(drv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = dcp_ipcc_init(&drv->ipcc, vdev->dev.parent);
>> +	if (ret) {
>> +		if (ret == -EPROBE_DEFER)
>> +			dev_err_probe(&vdev->dev, ret,
>> +				      "IPCC not ready, deferring probe\n");
>> +		else
>> +			dev_err(&vdev->dev, "IPCC init failed: %d\n", ret);
>> +		goto err_fn_dev;
>> +	}
>> +	drv->ipcc_valid = !!drv->ipcc.power_chan;
>> +
>> +	ret = virtio_find_vqs(vdev, DCP_NUM_VQS, vqs, vqs_info, NULL);
>> +	if (ret) {
>> +		dev_err(&vdev->dev, "virtqueue allocation failed: %d\n", ret);
>> +		goto err_ipcc;
>> +	}
>> +
>> +	ret = dcp_hfi_init(drv, vdev, vqs[DCP_VQ_CMD], vqs[DCP_VQ_RESP],
>> +			   vdev->dev.parent);
>> +	if (ret) {
>> +		dev_err(&vdev->dev, "HFI init failed: %d\n", ret);
>> +		goto err_del_vqs;
>> +	}
>> +
>> +	if (drv->ipcc_valid)
>> +		dcp_ipcc_set_resp_vq(&drv->ipcc, vqs[DCP_VQ_RESP]);
>> +
>> +	/*
>> +	 * Keep the device unready until HFI state and virtqueues are initialized.
>> +	 * KMS registration below depends on synchronous firmware initialization.
>> +	 */
>> +	virtio_device_ready(vdev);
>> +	virtqueue_kick(drv->hfi->resp_vq);
>> +
>> +	ret = dcp_hfi_send_device_init(drv->hfi);
>> +	if (ret) {
>> +		dev_err(&vdev->dev, "HFI DEVICE_INIT failed: %d\n", ret);
>> +		goto err_hfi_deinit;
>> +	}
>> +
>> +	ret = dcp_hfi_get_capabilities(drv->hfi, &drv->caps);
>> +	if (ret) {
>> +		dev_err(&vdev->dev, "HFI GET_CAPS failed: %d\n", ret);
>> +		goto err_hfi_deinit;
>> +	}
>> +
>> +	/* Register the display resources before exposing the DRM component. */
>> +	ret = dcp_hfi_send_resource_register(drv->hfi);
>> +	if (ret) {
>> +		dev_err(&vdev->dev, "HFI RESOURCE_REGISTER failed: %d\n", ret);
>> +		goto err_hfi_deinit;
>> +	}
>> +
>> +	dev_dbg(&vdev->dev,
>> +		"DCP caps: %u displays, max %ux%u, %u planes, features=0x%x\n",
>> +		 drv->caps.num_crtcs, drv->caps.max_width, drv->caps.max_height,
>> +		 drv->caps.max_planes, drv->caps.features);
>> +
>> +	dpu_kms = devm_kzalloc(&drv->dcp_subsystem_dev->dev, sizeof(*dpu_kms), GFP_KERNEL);
>> +	if (!dpu_kms) {
>> +		ret = -ENOMEM;
>> +		goto err_hfi_deinit;
>> +	}
>> +
>> +	dpu_kms->drv       = drv;
>> +	dpu_kms->pm_dev    = &drv->dcp_subsystem_dev->dev;
>> +	dpu_kms->hfi       = drv->hfi;
>> +	dpu_kms->caps      = &drv->caps;
>> +	dpu_kms->dpus_np   = drv->dcp_subsystem_node;
>> +	dpu_kms->iommu_dev = &drv->dcp_subsystem_dev->dev;
>> +
>> +	ret = msm_kms_init(&dpu_kms->base, &dcp_dpu_kms_funcs);
>> +	if (ret) {
>> +		dev_err(&vdev->dev, "msm_kms_init failed: %d\n", ret);
>> +		goto err_hfi_deinit;
>> +	}
>> +
>> +	priv = devm_kzalloc(&drv->dcp_subsystem_dev->dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv) {
>> +		ret = -ENOMEM;
>> +		goto err_hfi_deinit;
>> +	}
>> +
>> +	priv->kms      = &dpu_kms->base;
>> +	priv->kms_init = dcp_kms_init;
>> +	dev_set_drvdata(&drv->dcp_subsystem_dev->dev, priv);
>> +	dpu_kms->rpm_enabled = true;
>> +
>> +	/* Component binding now sees initialized HFI, capabilities, and IOMMU state. */
>> +	ret = dcp_component_register(drv);
>> +	if (ret) {
>> +		dev_err(&vdev->dev, "component register failed: %d\n", ret);
>> +		goto err_hfi_deinit;
>> +	}
>> +
>> +	dcp_panic_notifier_register(drv);
>> +
>> +	dev_dbg(&vdev->dev, "DCP VirtIO probe complete\n");
>> +	return 0;
>> +
>> +err_hfi_deinit:
>> +	dcp_virtio_hfi_cleanup(drv);
>> +	goto err_ipcc;
>> +err_del_vqs:
>> +	virtio_reset_device(vdev);
>> +	vdev->config->del_vqs(vdev);
>> +err_ipcc:
>> +	if (drv->ipcc_valid) {
>> +		dcp_ipcc_deinit(&drv->ipcc);
>> +		drv->ipcc_valid = false;
>> +	}
>> +err_fn_dev:
>> +	dcp_subsystem_dev_deinit(drv);
>> +	return ret;
>> +}
>> +
>> +static void dcp_virtio_hfi_cleanup(struct dcp_drv *drv)
>> +{
>> +	struct virtio_device *vdev = drv->vdev;
>> +
>> +	if (!drv->hfi)
>> +		return;
>> +
>> +	dcp_hfi_stop(drv->hfi);
>> +	virtio_reset_device(vdev);
>> +	virtio_synchronize_cbs(vdev);
>> +	vdev->priv = NULL;
>> +	dcp_hfi_quiesce_queues(drv->hfi);
>> +	vdev->config->del_vqs(vdev);
>> +	dcp_hfi_deinit(drv->hfi);
>> +	drv->hfi = NULL;
> What's the point of setting pointers to NULL? Won't this memory be
> kfree()'d soon?
>

Will be removed in v2.


>> +}
>> +
>> +/*
>> + * Remove DRM users before tearing down HFI, IPCC, or the VirtIO queues.
>> + */
>> +static void dcp_virtio_remove(struct virtio_device *vdev)
>> +{
>> +	struct dcp_drv *drv = vdev->priv;
>> +
>> +	dev_dbg(&vdev->dev, "DCP VirtIO remove\n");
>> +
>> +	if (!drv)
>> +		return;
>> +
>> +	dcp_component_unregister(drv);
>> +	dcp_panic_notifier_unregister(drv);
>> +
>> +	dcp_virtio_hfi_cleanup(drv);
>> +
>> +	if (drv->ipcc_valid) {
>> +		dcp_ipcc_deinit(&drv->ipcc);
>> +		drv->ipcc_valid = false;
>> +	}
>> +
>> +	dcp_subsystem_dev_deinit(drv);
>> +}
>> +
>> +/* KMS shutdown must complete while the firmware transport is available. */
>> +static void dcp_virtio_shutdown(struct virtio_device *vdev)
>> +{
>> +	struct dcp_drv *drv = vdev->priv;
>> +
>> +	if (!drv || !drv->dcp_subsystem_dev)
>> +		return;
>> +
>> +	pm_runtime_get_sync(&drv->dcp_subsystem_dev->dev);
>> +	msm_kms_shutdown(drv->dcp_subsystem_dev);
>> +	pm_runtime_put_noidle(&drv->dcp_subsystem_dev->dev);
>> +}
>> +
>> +/*
>> + * Firmware capabilities may change independently of the VirtIO transport;
>> + * refresh them without rebuilding the DRM device.
> And what does that mean? How can they change?
>

Will be removed.


>> + */
>> +static void dcp_virtio_config_changed(struct virtio_device *vdev)
>> +{
>> +	struct dcp_drv *drv = vdev->priv;
>> +	int ret;
>> +
>> +	dev_dbg(&vdev->dev, "VirtIO config changed — re-querying DCP capabilities\n");
>> +
>> +	if (!drv || !drv->hfi)
>> +		return;
>> +
>> +	ret = dcp_hfi_get_capabilities(drv->hfi, &drv->caps);
>> +	if (ret)
>> +		dev_err(&vdev->dev,
>> +			"config_changed: capability re-query failed: %d\n", ret);
>> +	else
>> +		dev_dbg(&vdev->dev,
>> +			"config_changed: DCP caps updated: %u displays, features=0x%x\n",
>> +			 drv->caps.num_crtcs, drv->caps.features);
>> +}
>> +
> [...]
>
>> diff --git a/drivers/gpu/drm/msm/dcp/dcp_virtio.h b/drivers/gpu/drm/msm/dcp/dcp_virtio.h
>> new file mode 100644
>> index 000000000000..fe244bc5b51a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/dcp/dcp_virtio.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + * DCP VirtIO driver interface.
>> + */
>> +
>> +#ifndef __DCP_VIRTIO_H__
>> +#define __DCP_VIRTIO_H__
>> +
>> +#include <linux/device.h>
>> +#include <linux/virtio.h>
>> +#include <linux/virtio_ids.h>
>> +
>> +struct dcp_drv;
>> +
>> +#define VIRTIO_ID_QPSFI		                52
>> +#define VIRTIO_VENDOR_ID_DCP_HFI		    1
> I think this was questioned by Bjorn. Is it described somewhere? Is it a
> part of the VirtIO spec? If so, add these ids to the VirtIO headers. If
> not... then it's squatting. We can't just randomly settle on the ID.
>

I will add patch to move VIRTIO_ID_QPSFI to virtio_ids.h


>> +
>> +int dcp_virtio_register(void);
>> +void dcp_virtio_unregister(void);
>> +
>> +#endif /* __DCP_VIRTIO_H__ */
>>
>> -- 
>> 2.43.0
>>
