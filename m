Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A74368D50
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 04:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787027651; cv=none; b=JkPjyVuvxbICo4AdQ6iaAvblGrmOm/7HtL+LPusrr6gCeUsJN6wti3frRXSxQgnWYhWcumb0RBnOWNHWjpnhOOaYIpzC3jQFwWL7XXcpPSO912x8ipCna5lM6YP7e8Nd0IJfHNQIxzFYnkzjFxR5E1HGwLqPLUDT/Pr/6hZu+jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787027651; c=relaxed/simple;
	bh=/hJtsdnsv5EJPnRGUb5xU97bda3+Jc6dfFQIor9N9Qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQNgjPWYPjjYLDh3mW1+PmMcQunuIQ0Lfv8jvN5hDUsF7nWiqcNRanAjGmDS9IuJPUH3DI0yvsZRau1pHzoHC5B0q1LVsfb+QbasTwTj5N7UVzFU4XZKp647p2xFjOkSyq0sopjw7EG8FtSQ/AlN4eijrSOYynDnKNSrm5L0Ito=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRWMczQ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZWbKiA4l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRWMczQ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZWbKiA4l"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I3G0a93833617
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 04:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FvN5/OloD/Fmp8QtjbtPM01MGFAJJiFT/3YnVeIo5HU=; b=SRWMczQ06B4oXnPk
	3tIwlt8AqhcLxC4JWIvUMGLjGBxqhhiijO+Lg411rn+H6K/nkCGpgHXiOymYv5tb
	yAyS3KQGPm7oMfQUzERKA7yd/k+a6PjDTCcG5ElhmJSEMQPJa2b405h/VcIvBGwg
	ZtVci6+vG+u3gTA8cAqiSWMi7fMFdXz09tW19DfPCP3K4IHYIhrAsUhP+wd1szht
	+KTJjfEWRfUc4P6WwoMW/UoL3y5f8HBKKGoTzQSOTHa5WQUUhH3DTpU5EAgtWHPT
	xAefdlwZEAaSDdsCngJB9aZtLyIhi6EtQQf+K5FOqEg3xz3KO6A3FIX1cqahB0XV
	R5JCAg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba88du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 04:34:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so67884375ad.3
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 21:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787027647; x=1787632447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvN5/OloD/Fmp8QtjbtPM01MGFAJJiFT/3YnVeIo5HU=;
        b=ZWbKiA4lTDFi7kZbWlYTEH92YFbzfGrvbR7/Ssv3pLGXl1qeyGyIgy7QDvG5pt2xtY
         BVsl4MG67PI6x0AOgoM5kFDz03Dbmth6BiyM9HvQFsDvKHI0V8TpxVmn5iLH+6ZRaYha
         R14XUZiywwpGmMjFk+MQNEqnSzPv54LZ8OLaFn6+jmfl4uN8mE8EXfcder6U3fdDRpIf
         YIO3WjueXL2i9dPugKC7t1xPo34AhyhPpuTKLz1Fm2/pt2XsUwRHe0Mqc/O48N/Z+Dyd
         xFVihX3/a+7amFBCQNxP+piubwIr1JzJIeYfC4iFmqJZklaDOqsjz0KUVOmvZSgWT3la
         co8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787027647; x=1787632447;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FvN5/OloD/Fmp8QtjbtPM01MGFAJJiFT/3YnVeIo5HU=;
        b=ZXkPB1tl0YG9NONsxxE9Anw/zxLs/8/0G+CA43O3ggqN7sAftTssUp0H/rGBnumZmL
         xsIYORuIcSK090n1sKIa/jbFmozfPHn+9OTNPDU8R2uW0ZZwqqQf+L4VaaUNJpQ3vcFS
         SiwwQutFZznXlSA90p7EGBLIsfB+t4ZmEdgWHUE8zmckOGiBSkZUZ8nVpyVs5w6dTIsG
         WmSg+tibO+tr7aWJakGk8cuaBVQQOWMuiFXwgzg0CsUst8WRIp2qOAVVgQfDQMi6KfG3
         P8e+XhPm4DvlsoHrn7prfQ7bpXWmDLQ8Psz3IhBqu1zzk9vC+XUNy9b0jRrgCREFaLK6
         gdtA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3V6l2YMiX80PJ69+cTgFxb1jZ3jjbcvRpJbdEF8WM9khEdwr8vmEOlMQwlievD3vRUMu81L8UUlVXbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx752BD+gdPd8kGI9LoRp/Z3WQx+BzIG320RwgGMRuH40pfZLJo
	rCaaO1j22o64ahGcK2YdV3Kx3kPH+DpgYZuDpfyC94aCX2FE5UDWC0BRhNO7ldWaB5u4lLuWrT2
	TfGCMP7JJb3+1A7drlzlkXJZ5ywjdIZ1moq7/tQa3NpmQ36eLm4kGb+QXUDHRGI6IEw==
X-Gm-Gg: AR+sD11NxDz9PBDEfEQ2lcw5GMJ9+3U1GSWfZsqHphUdUgnbk5pJl+k9ZKHTuCm9Jb3
	ea2mCwBoe8fjmCA3FjMvM/8RWwpaHey9VeLh3+Tk8VGqn8tsv9DoU9Hz6bhy+SUFSr6qLY8kTMP
	B1i+8t2+5g1So661kDhwS+nU5eiXOhePlxrZN9uyZSPvDEj1URqFt/JMn9Lh/kyLcouB1qQsl+t
	c5VXRq5R5MXg+is4KPeNuhqbpPbrtjqp27i6P8bcNTTCYppHI9fvd1c3a438E6RXikDlLHHHLet
	+aFQPQKfJi02P2KrSJUbjwGeUfXPddsmeZCethV5ErPvr6X6QHxOsFj7elO8uBIvrTNREQ5BY97
	whnfvaM1WzwEbbAi30ENnGH1k34u7+A==
X-Received: by 2002:a17:903:360c:b0:2ca:b8fd:f31 with SMTP id d9443c01a7336-2d3b0d5e37amr333048925ad.15.1787027647078;
        Mon, 17 Aug 2026 21:34:07 -0700 (PDT)
X-Received: by 2002:a17:903:360c:b0:2ca:b8fd:f31 with SMTP id d9443c01a7336-2d3b0d5e37amr333047625ad.15.1787027646465;
        Mon, 17 Aug 2026 21:34:06 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb4ea3a4sm12288325ad.24.2026.08.17.21.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 21:34:05 -0700 (PDT)
Message-ID: <c4820424-eff0-4c28-ba77-5b595ed09a4e@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 10:03:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] accel/qda: Add memory manager for CB devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-7-69a02e9090d4@oss.qualcomm.com>
 <wt2pdo3m3nlhvyofuvbsqnvggywx75ucs65vjt3dzrxkrpgztz@xwwlhq2iuiun>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <wt2pdo3m3nlhvyofuvbsqnvggywx75ucs65vjt3dzrxkrpgztz@xwwlhq2iuiun>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAzMSBTYWx0ZWRfX1yaep0wQm+bA
 FASufUuCwLxzhoIk6YwNR/Tk8P9blwk+wfP2jclU+eglmtxt8T681jSy19cBpN4k3QLx7mDPdOZ
 t/iNQQGn3K3fTkf/4jmjtHv0fyfgMqY=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a83e0c0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=F8gUvEXnVjwIBCcNVQsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: yU9kZaLlKcpFbi78C3eJVm7_FlExnH1q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAzMSBTYWx0ZWRfX3WZ432k9/rAX
 meF8nsUYnzWSp2sohq+Eyg6EkwaLsIr8MFgCBCRjPIdmbGtvOptyNqZ3XveVokVo3C5hcbFoOdE
 ozQ1Tq6MJ26OPUsqqSgKVLHGAf/Q4j62+3bHBzHNjFD9bv0piOuHQIl2UBWufDJESK1x7G5ynOz
 KNXfGkWfv5xXNJqcsHMlZ8CbiWodrY5hDYl2KojSndkH0wBPmWE+FLKDMaj3T/vtHaV9Jbo02tA
 lCFVwoA8rrmyawQcFjsjlnP9lM4E6qr2Lz3xX+DJ9Siremq2ZLFvnnqztXLG5R+4cipLCW1ISn5
 PPpjEyGmR71aHawNcndTy5ck262xdb8TXxD9HfKmfCc3WPxRld/s8NgKo7jptlP33TSccC8MWWn
 ULo32ko407H2iy5gauqMgyEXwcXXFxrawkA7Z/nWitCfrsDbrgO7UVYGDOdFnLUPxXhMMH2vgDd
 MFE7NcpaqjhCWw3O0Nw==
X-Proofpoint-GUID: yU9kZaLlKcpFbi78C3eJVm7_FlExnH1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180031

On 17-08-2026 12:22, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 10:17:42AM +0530, Ekansh Gupta wrote:
>> Introduce the QDA memory manager (qda_memory_manager) to track the
>> IOMMU devices that back each compute context bank (CB).
>>
>> Each CB device registered on the qda-compute-cb bus is wrapped in a
>> qda_iommu_device descriptor recording the device pointer and its stream
>> ID, and stored in the memory manager's registry. Later patches use this
>> registry to resolve the IOMMU device a session should allocate from.
>>
>> The registry is a plain array sized to the number of
>> "qcom,fastrpc-compute-cb" nodes present in the device tree: the RPMsg
>> probe counts those nodes and passes the count to qda_init_device(),
>> which allocates the array in qda_memory_manager_init(). The memory
>> manager is created before CB devices are populated and destroyed after
>> they are torn down, so no dangling descriptors remain.
>>
>> qda_cb_setup_device() is called immediately after a CB device is
>> registered on the bus: it allocates the descriptor, registers it with
>> the memory manager, and stores it as the CB device's driver data so
>> that qda_destroy_cb_device() can unregister and free it during teardown.
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Replace the XArray with a plain array sized to the device tree's CB
>>   node count instead of a fixed 16-entry table (Dmitry Baryshkov)
>> - Fold the init_memory_manager()/cleanup_memory_manager() wrappers into
>>   qda_init_device()/qda_deinit_device() (Dmitry Baryshkov)
>> - Drop the pr_debug() calls (Dmitry Baryshkov)
>> - Use goto labels to unwind probe failures instead of open-coding the
>>   cleanup at each error site (Dmitry Baryshkov)
>> ---
>>  drivers/accel/qda/Makefile             |  1 +
>>  drivers/accel/qda/qda_cb.c             | 39 ++++++++++++++
>>  drivers/accel/qda/qda_drv.c            | 26 +++++++++
>>  drivers/accel/qda/qda_drv.h            |  5 ++
>>  drivers/accel/qda/qda_memory_manager.c | 98 ++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_memory_manager.h | 55 +++++++++++++++++++
>>  drivers/accel/qda/qda_rpmsg.c          | 23 +++++++-
>>  7 files changed, 246 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
>> index 143c9e4e789e..701fad5ffb50 100644
>> --- a/drivers/accel/qda/Makefile
>> +++ b/drivers/accel/qda/Makefile
>> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>>  qda-y := \
>>  	qda_cb.o \
>>  	qda_drv.o \
>> +	qda_memory_manager.o \
>>  	qda_rpmsg.o
>>  
>>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
>> diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
>> index 9c5ef32f351e..cd32d6df6318 100644
>> --- a/drivers/accel/qda/qda_cb.c
>> +++ b/drivers/accel/qda/qda_cb.c
>> @@ -8,13 +8,40 @@
>>  #include <linux/slab.h>
>>  #include <drm/drm_print.h>
>>  #include "qda_drv.h"
>> +#include "qda_memory_manager.h"
>>  #include "qda_cb.h"
>>  
>> +static int qda_cb_setup_device(struct qda_dev *qdev, struct device *cb_dev, u32 sid)
>> +{
>> +	struct qda_iommu_device *iommu_dev;
>> +	int ret;
>> +
>> +	iommu_dev = kzalloc_obj(*iommu_dev);
>> +	if (!iommu_dev)
>> +		return -ENOMEM;
>> +
>> +	iommu_dev->dev = cb_dev;
>> +	iommu_dev->qdev = qdev;
>> +	iommu_dev->sid = sid;
>> +
>> +	ret = qda_memory_manager_register_device(qdev->iommu_mgr, iommu_dev);
>> +	if (ret) {
>> +		drm_err(&qdev->drm_dev, "Failed to register IOMMU device: %d\n", ret);
>> +		kfree(iommu_dev);
>> +		return ret;
>> +	}
>> +
>> +	dev_set_drvdata(cb_dev, iommu_dev);
>> +
>> +	return 0;
>> +}
>> +
>>  int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
>>  {
>>  	struct qda_cb_dev *entry;
>>  	struct device *cb_dev;
>>  	u32 sid = 0;
>> +	int ret;
>>  
>>  	if (of_property_read_u32(cb_node, "reg", &sid))
>>  		drm_info(&qdev->drm_dev, "No stream ID in DT node %pOFn, using 0\n", cb_node);
>> @@ -27,6 +54,12 @@ int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
>>  		return PTR_ERR(cb_dev);
>>  	}
>>  
>> +	ret = qda_cb_setup_device(qdev, cb_dev, sid);
>> +	if (ret) {
>> +		device_unregister(cb_dev);
>> +		return ret;
>> +	}
>> +
>>  	entry = kzalloc_obj(*entry);
>>  	if (!entry) {
>>  		qda_destroy_cb_device(cb_dev);
>> @@ -74,8 +107,14 @@ int qda_cb_populate(struct qda_dev *qdev, struct device_node *parent_node)
>>  
>>  void qda_destroy_cb_device(struct device *cb_dev)
>>  {
>> +	struct qda_iommu_device *iommu_dev;
>>  	struct iommu_group *group;
>>  
>> +	iommu_dev = dev_get_drvdata(cb_dev);
>> +	if (iommu_dev && iommu_dev->qdev->iommu_mgr)
> 
> Can either of them be NULL?
it's only called from qda_cb_unpopulate() so it can't be NULL. I'll
remove all the unnecessary non-NULL check like it was done for GEM.>
>> +		qda_memory_manager_unregister_device(iommu_dev->qdev->iommu_mgr,
>> +						     iommu_dev);
>> +
>>  	group = iommu_group_get(cb_dev);
>>  	if (group) {
>>  		iommu_group_remove_device(cb_dev);
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index 09b6d5ac390b..fdc909facd95 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -56,6 +56,32 @@ struct qda_dev *qda_alloc_device(struct device *dev)
>>  	return qdev;
>>  }
>>  
>> +void qda_deinit_device(struct qda_dev *qdev)
>> +{
>> +	if (qdev->iommu_mgr) {
> 
> Why?
> 
>> +		qda_memory_manager_exit(qdev->iommu_mgr);
>> +		kfree(qdev->iommu_mgr);
>> +		qdev->iommu_mgr = NULL;
> 
> What for? If it's a teardown path, qdev will be destroyed soon.
ack, will remove it.>
>> +	}
>> +}
>> +
>> +int qda_init_device(struct qda_dev *qdev, int num_cbs)
>> +{
>> +	int ret;
>> +
>> +	qdev->iommu_mgr = kzalloc_obj(*qdev->iommu_mgr);
> 
> devm_kzalloc_obj()?
I'll check on how this impacts the exit path. Will implement with this
if it make the logic cleaner, thanks for the suggestion.>
>> +	if (!qdev->iommu_mgr)
>> +		return -ENOMEM;
>> +	ret = qda_memory_manager_init(qdev->iommu_mgr, num_cbs);
>> +	if (ret) {
>> +		drm_err(&qdev->drm_dev, "Failed to initialize memory manager: %d\n", ret);
>> +		kfree(qdev->iommu_mgr);
>> +		qdev->iommu_mgr = NULL;
> 
> And what is going to read this NULL?
won't be used, will remove this.>
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>  int qda_register_device(struct qda_dev *qdev)
>>  {
>>  	int ret;
>> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
>> index 3bd41b9593fa..690a833d732b 100644
>> --- a/drivers/accel/qda/qda_drv.h
>> +++ b/drivers/accel/qda/qda_drv.h
>> @@ -13,6 +13,7 @@
>>  #include <drm/drm_device.h>
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_file.h>
>> +#include "qda_memory_manager.h"
>>  
>>  /* Driver identification */
>>  #define QDA_DRIVER_NAME "qda"
>> @@ -40,6 +41,8 @@ struct qda_dev {
>>  	struct device *dev;
>>  	/** @cb_devs: Compute context-bank (CB) child devices */
>>  	struct list_head cb_devs;
>> +	/** @iommu_mgr: IOMMU/memory manager instance */
>> +	struct qda_memory_manager *iommu_mgr;
>>  	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
>>  	const char *dsp_name;
>>  };
>> @@ -59,6 +62,8 @@ static inline struct qda_dev *qda_dev_from_drm(struct drm_device *dev)
>>  struct qda_dev *qda_alloc_device(struct device *dev);
>>  
>>  /* Core device lifecycle */
>> +int qda_init_device(struct qda_dev *qdev, int num_cbs);
>> +void qda_deinit_device(struct qda_dev *qdev);
>>  int qda_register_device(struct qda_dev *qdev);
>>  
>>  #endif /* __QDA_DRV_H__ */
>> diff --git a/drivers/accel/qda/qda_memory_manager.c b/drivers/accel/qda/qda_memory_manager.c
>> new file mode 100644
>> index 000000000000..b1a80ee77c35
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_memory_manager.c
>> @@ -0,0 +1,98 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +
>> +#include <linux/slab.h>
>> +#include "qda_drv.h"
>> +#include "qda_memory_manager.h"
>> +
>> +static void cleanup_all_memory_devices(struct qda_memory_manager *mem_mgr)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < mem_mgr->num_devices; i++) {
>> +		struct qda_iommu_device *iommu_dev = mem_mgr->devices[i];
>> +
>> +		if (!iommu_dev)
>> +			continue;
>> +
>> +		mem_mgr->devices[i] = NULL;
>> +		kfree(iommu_dev);
>> +	}
>> +	mem_mgr->num_devices = 0;
> 
> What for?
not needed. I'll remove this.>
>> +}
>> +
>> +/**
>> + * qda_memory_manager_register_device() - Register an IOMMU device
>> + * @mem_mgr: Pointer to memory manager
>> + * @iommu_dev: Pointer to IOMMU device to register
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
>> +				       struct qda_iommu_device *iommu_dev)
>> +{
>> +	if (mem_mgr->num_devices >= mem_mgr->max_devices)
>> +		return -ENOSPC;
>> +
>> +	iommu_dev->id = mem_mgr->num_devices;
>> +	mem_mgr->devices[mem_mgr->num_devices++] = iommu_dev;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * qda_memory_manager_unregister_device() - Unregister an IOMMU device
>> + * @mem_mgr: Pointer to memory manager
>> + * @iommu_dev: Pointer to IOMMU device to unregister
>> + *
>> + * Removes the device from the registry and frees it.
>> + */
>> +void qda_memory_manager_unregister_device(struct qda_memory_manager *mem_mgr,
>> +					  struct qda_iommu_device *iommu_dev)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < mem_mgr->num_devices; i++) {
>> +		if (mem_mgr->devices[i] == iommu_dev) {
>> +			mem_mgr->devices[i] = NULL;
>> +			break;
>> +		}
>> +	}
>> +
>> +	kfree(iommu_dev);
>> +}
>> +
>> +/**
>> + * qda_memory_manager_init() - Initialize the memory manager
>> + * @mem_mgr: Pointer to memory manager structure to initialize
>> + * @max_devices: Number of IOMMU context bank devices to make room for
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int qda_memory_manager_init(struct qda_memory_manager *mem_mgr, int max_devices)
>> +{
>> +	if (max_devices <= 0)
>> +		return -EINVAL;
>> +
>> +	mem_mgr->devices = kcalloc(max_devices, sizeof(*mem_mgr->devices), GFP_KERNEL);
>> +	if (!mem_mgr->devices)
>> +		return -ENOMEM;
>> +
>> +	mem_mgr->num_devices = 0;
>> +	mem_mgr->max_devices = max_devices;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * qda_memory_manager_exit() - Clean up the memory manager
>> + * @mem_mgr: Pointer to memory manager structure to clean up
>> + */
>> +void qda_memory_manager_exit(struct qda_memory_manager *mem_mgr)
>> +{
>> +	cleanup_all_memory_devices(mem_mgr);
>> +
>> +	kfree(mem_mgr->devices);
>> +	mem_mgr->devices = NULL;
>> +	mem_mgr->max_devices = 0;
>> +}
>> diff --git a/drivers/accel/qda/qda_memory_manager.h b/drivers/accel/qda/qda_memory_manager.h
>> new file mode 100644
>> index 000000000000..7e38c8a18284
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_memory_manager.h
>> @@ -0,0 +1,55 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_MEMORY_MANAGER_H__
>> +#define __QDA_MEMORY_MANAGER_H__
>> +
>> +#include <linux/device.h>
>> +
>> +/* Forward declarations */
>> +struct qda_dev;
>> +
>> +/**
>> + * struct qda_iommu_device - IOMMU device instance for memory management
>> + *
>> + * Represents a single IOMMU-enabled device managed by the memory manager.
>> + * Each device can be assigned to a specific process session.
>> + */
>> +struct qda_iommu_device {
>> +	/** @dev: Pointer to the underlying device */
>> +	struct device *dev;
>> +	/** @qdev: Back-pointer to the parent QDA device */
>> +	struct qda_dev *qdev;
>> +	/** @id: Unique identifier assigned by the memory manager */
>> +	u32 id;
> 
> What kind of identifier? What is going to use it? I don't see any
> readers in this patch, please don't add useless data.
I'll move this to the patch where it's actually used.>
>> +	/** @sid: Stream ID for IOMMU transactions */
>> +	u32 sid;
> 
> Do you need to store it?
will move it to later patch where it's actually used.>
>> +};
>> +
>> +/**
>> + * struct qda_memory_manager - Central memory management coordinator
>> + *
>> + * Coordinates memory management across multiple IOMMU devices. Maintains
>> + * a registry of devices in an array sized to the number of context banks
>> + * described in the device tree.
>> + */
>> +struct qda_memory_manager {
>> +	/** @devices: Array storing registered IOMMU devices */
>> +	struct qda_iommu_device **devices;
>> +	/** @num_devices: Number of registered IOMMU devices */
>> +	int num_devices;
> 
> What for? Is devices array to be looped up to num_devices or
> max_devices?
num_devices is to trace device registry with manager, it grows on
register operation. I'll improve the comment.
> 
>> +	/** @max_devices: Capacity of the @devices array */
>> +	int max_devices;
>> +};
>> +
>> +int qda_memory_manager_init(struct qda_memory_manager *mem_mgr, int max_devices);
>> +void qda_memory_manager_exit(struct qda_memory_manager *mem_mgr);
>> +
>> +int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
>> +				       struct qda_iommu_device *iommu_dev);
>> +void qda_memory_manager_unregister_device(struct qda_memory_manager *mem_mgr,
>> +					  struct qda_iommu_device *iommu_dev);
>> +
>> +#endif /* __QDA_MEMORY_MANAGER_H__ */
>> diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
>> index 723b3e61bf0a..64bf503106d9 100644
>> --- a/drivers/accel/qda/qda_rpmsg.c
>> +++ b/drivers/accel/qda/qda_rpmsg.c
>> @@ -42,11 +42,25 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
>>  	drm_dev_unplug(&qdev->drm_dev);
>>  	qdev->rpdev = NULL;
>>  	qda_cb_unpopulate(qdev);
>> +	qda_deinit_device(qdev);
>> +}
>> +
>> +static int qda_count_cb_nodes(struct device_node *parent_node)
>> +{
>> +	struct device_node *child;
>> +	int count = 0;
>> +
>> +	for_each_child_of_node(parent_node, child)
>> +		if (of_device_is_compatible(child, "qcom,fastrpc-compute-cb"))
>> +			count++;
>> +
>> +	return count;
>>  }
>>  
>>  static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>>  {
>>  	struct qda_dev *qdev;
>> +	int num_cbs;
>>  	int ret;
>>  
>>  	qdev = qda_rpmsg_alloc_and_init_qdev(rpdev);
>> @@ -59,10 +73,15 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>>  		return ret;
>>  	}
>>  
>> -	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
>> +	num_cbs = qda_count_cb_nodes(rpdev->dev.of_node);
>> +	ret = qda_init_device(qdev, num_cbs);
>>  	if (ret)
>>  		return ret;
>>  
>> +	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
>> +	if (ret)
>> +		goto err_deinit;
>> +
>>  	ret = qda_register_device(qdev);
>>  	if (ret)
>>  		goto err_unpopulate;
>> @@ -71,6 +90,8 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>>  
>>  err_unpopulate:
>>  	qda_cb_unpopulate(qdev);
>> +err_deinit:
>> +	qda_deinit_device(qdev);
>>  	return ret;
>>  }
>>  
>>
>> -- 
>> 2.34.1
>>
> 

