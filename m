Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9303ABDB3
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787146005; cv=none; b=hYKSU48zV6mIdCKJOSDqTKIAe4fM4cI/ez/qEdZXW12DmMPbyD+GG/Xx6l4IOhkRKSu6nDXIAgnmbVwGFnzD5bvV5TE1kMoxsGrhmxS/ax3ihFIWsHOdwJGavV/KYBMATVXJYkKzxyD5NSs0fSbtMp3SW3I7w3KjDkl4Te8J4XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787146005; c=relaxed/simple;
	bh=6HzawwOxkusOjOPeE6/oX/1EaAdxQaxMxK9EQzXaZDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fnsh1ac5CCPztTg6D1BLJRZyP6MlslMvqe5Ykk1oVmWmYdw7mGijZXqlj9m+f7SJ1B3FdEiOo5EpOLFJrH3/6BQVb/iJ+6x8ZkCcQmNyKz1FDjyPvDN/ln+whXzOSoDCppS7Tf78bfvKxLFZydrjMWWYqTMNqfZMrbF+WmyL7OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G4hE9RKH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGIifDAN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G4hE9RKH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGIifDAN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0Cdi901374
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 13:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RC/u9yMGeHLFDrjdoHnolPqZvFBp4AVSt0SyCBdL7ug=; b=G4hE9RKHpv1cHu7k
	VrLrbNQo/EAdJunCWDrxmKNhWRYHX2pb2l26AEVKrsFVirbZVNgywCKQhmReIlaG
	JhEDxoUIoo89ZnoSKAq4GdcwQ0kJLGSe7yfC+5g+ZKuOkYYdzq8cfsILYgag2x50
	DuWJ2+DbC4syzjVucQdBGDM42esXb10fNgDNTg004ivwBBVonqBA+X5zJFOg8rcS
	rxIrqhtGuvXPFGbFJ7o3gDrbkjCCjr7lqQlLzJlKOg0G1yukAv5uAHA6uT2YE+Qj
	rFF8ld744Q3PkrsOQUDb49WfVYuhG7ukFW1Z6wj/SIOIE3Hk03B8EwsbQLgOsOvH
	szXX5A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpubv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 13:26:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso2802564b3a.1
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787145995; x=1787750795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RC/u9yMGeHLFDrjdoHnolPqZvFBp4AVSt0SyCBdL7ug=;
        b=fGIifDANWJQQzO2PxEWxbFvrobrA0lb2ycFHSJX86+dJ0BaXcxQy/+eFIlQFJD6QpD
         HiWMcG/scrE6ckkicVJYOVCEBijCITIGTXaFya8TdxRTxH/yydPPZw5Wc3c8oUPTSaax
         ljsnaqy+5eW3fq8PK/haf1zUjHuiYPtvkCLFfcF6lZcir+cQlpmYgS1o81yFgs/yQxj1
         gHqGXfrvSquqXTW5I49dqs+1Bm8aysIR5JjZe1ReD9u+EYoZmDO0Ye+xhsDTPW5BsYY+
         aX0rTIwSiZJX5LRMZ/bihJd2fZclKF+qEhsSNh1EoWTKPz2TLCezoRu/ciUlnA8i/zxh
         Mjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787145995; x=1787750795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RC/u9yMGeHLFDrjdoHnolPqZvFBp4AVSt0SyCBdL7ug=;
        b=jEXbStqj3NVY6/F/vL/ACEU6iF3BrMqaIH9TI2MZ43lOeL1ZHt6qUa83oMHhg2ulTX
         SC5u4wAdR7i37VsrzqCrTleU98ul/yFvQjZDFC/P7vyhImjqrtSAhl1Jg/gfyGRaEJdo
         7dpzRP69HVr71vvjnXFaz8KnwagWK7LyGd1XdF+vh33Ir1jkc+wf8eqelTyKyE13mh8y
         BjhXGa6Ief1akrjd0fn+jNrEVkXKjAp+PErvqbl/YBZLOMZ49YnpcpCq+y/SomSDZ7M+
         vZlOMnSOfP+lJwIFGIEtxOM7OY1oPfaSfGA8qB4BNzx9ZNNAaUeNPkdeGynycsbuHWYY
         FBaA==
X-Forwarded-Encrypted: i=1; AHgh+RqZAOyZQYCR4aOoLy+kBrcwZq0fNFx8WSXsHCpuoWY05MVd35hQlEvqjH8Ce6M9RzOfUiJfxL/SeZsPoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzsKSy6x1iQicGXN7Au8uuEOxU+jmNBzuyYclo1z0lbxeuKuBe
	wPsnt/nXWwYfovdV8UuDoy1SNKobWGLuzpryoRFN89JJa5OALcKC/63xUkFuPy1k9TTuS6WNlBT
	EPSsJwGHKeDP0dPPikJ8qYZ4cgmXBtySC5o03QkzNUKagvbzKlum5hvLy12aVFzNeWw==
X-Gm-Gg: AR+sD13FProz+XwfBylz/NJcthP6NYZpWV5wN0P96P1EDZjrVokiiaTQ8LC69FuJrFf
	1tTIdfoQy8Z7xjFiViIQQJUbUi0mv4qQn1qdaqEuNQdBSWMDUo4rQ2VOa/jYLRalc9K4+mxgJD6
	HUCFLeLvYDi+WDf0GugBtHwyUFgDmzcRLcBiDWpj5ag+fdd3u/gs5FOmr4PtS6up1WIwzqW1Y8k
	ezO/u9dc8gXjqnCrXnEjgo4BS5yR8+q5xch215dLH65b+XbrRYIC6toKHq8m6gfEgyhR1XKPksQ
	RYdtjR5fuYuUE9n2aXq3OuQw85HFATpc90Q3jenOB5zVy5CKd489802NEVaG3GmYUc/OlFztO0M
	LLf4hv9CQpatUyDAC+u2YdBkBjs1diQ==
X-Received: by 2002:a05:6a21:110:b0:3b4:661d:8405 with SMTP id adf61e73a8af0-3cd00c6d745mr6160100637.4.1787145994365;
        Wed, 19 Aug 2026 06:26:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:110:b0:3b4:661d:8405 with SMTP id adf61e73a8af0-3cd00c6d745mr6159988637.4.1787145993729;
        Wed, 19 Aug 2026 06:26:33 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc155689110sm598347a12.22.2026.08.19.06.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:26:33 -0700 (PDT)
Message-ID: <10349e29-b583-403f-a89a-9a00c73666bc@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:56:23 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
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
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <3322b42b-3755-45ec-ad55-345125f0d488@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <3322b42b-3755-45ec-ad55-345125f0d488@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -dfUkvp7aOoqT-VvRhgdIZW3NVhChQbi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX1JEdGeBPPp0A
 3fU62pnxfQGxOnaaPzPDzXHq40Fp8GXhmLQt4YFs0eICB3t+pGZPHxuSeG16bdVKYxgpjlhpJYZ
 MCbvdSveDCJpKOTZa4dr9N3hviZTodWiOAprwTq6079856a53DFQqG2S4VM4bmofVnT0R3nvmZN
 15YVfy5BzHWn6lE6X8mo9yssN4sAu7WGDNvSYeSIfg6OiB4eJMV5Y36VBjDGvT1RRs5CYzi7Tf0
 ttwcSYI4FHCplP2Huvm6OheKbjPlKAk42GTb2Sy/qd7FjjOo4VkwuNBpVkh7mDCAH9ehm3VQ4N7
 Dbtzvt00wwiEHBDCC0pPsjNLyx+zaW/1GyGufpbihFbTb/GczKh0VEKP36B7UdyqD3H8ihuL4Kf
 LjeKkI/cWvuyde79RU/8xh77/8LoxdepuRjn6/zYC3CHUlhgyGPBdlJ0igNJ4XbBfcIV4t28fbF
 C72fPTw2sIWS1Tncq4w==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a85af0b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=1aprj6cQADeN8GqOYRYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: -dfUkvp7aOoqT-VvRhgdIZW3NVhChQbi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX9nqQI5G7PJTH
 Jr6bbYWnx2g91uDHSI4NcIa6gjZ3ta3N02EAmQGotVyX9EInNGy1KIdvo/yrpwxBd703LTE7pg+
 GIv+n7Vw6/z+RU+//g4cEIvkdAU9RKM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190104

On 19-08-2026 00:43, Krzysztof Kozlowski wrote:
> On 17/08/2026 06:47, Ekansh Gupta wrote:
>> This patch series introduces the Qualcomm DSP Accelerator (QDA) driver,
>> a DRM-based accelerator driver for Qualcomm DSPs. The driver provides a
>> standardized interface for offloading computational tasks to DSPs found
>> on Qualcomm SoCs, supporting all DSP domains.
>>
>> The QDA driver implements the FastRPC protocol over the DRM accel
>> subsystem. It uses the same device-tree node structure as the existing
>> fastrpc driver in drivers/misc/. The approach for binding the QDA driver
>> to device-tree nodes while coexisting with the fastrpc driver is an open
>> item described below.
> 
> No. Grow/replace/improve existing driver instead of coming with a duplicate.
> 
> That's a standard upstream requirement, basically given on every
> upstreaming guide.
> 
> Please watch old talk from Greg - "I Don’t Want Your Code!".
Posted discussion threads here[1]. Would seek comments from Dmitry,
Srini as well.

[1]
https://lore.kernel.org/all/3476b5c3-7983-4994-a901-3d7d8bd75255@oss.qualcomm.com/

> 
>>
>> v1: https://lore.kernel.org/all/20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com/
>> RFC: https://lore.kernel.org/dri-devel/20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com/T/
>>
>> Changes since v1
>> ================
>>
>> The v1 review raised two architectural objections and one correctness
>> issue; all three are resolved in v2:
>>
>> * Christian König (dma-buf maintainer) pointed out that the imported-
>>   buffer path silently assumed the IOMMU maps every buffer as a single
>>   contiguous range, which is not guaranteed. v2 walks the scatterlist
>>   and cleanly rejects non-contiguous imports; contiguous imports (e.g.
>>   CMA DMA-buf heap) are accepted. (patch 11)
>>
>> * Dmitry Baryshkov objected to three different buffer-passing formats
>>   in the invoke IOCTL (DMA-BUF fd, direct/inline, DMA handle). v2
>>   passes only GEM handles; userspace imports any fd to a GEM handle
>>   with DRM_IOCTL_PRIME_FD_TO_HANDLE before invoking. Packing and
>>   overlap handling are left to userspace. (patch 12)
>>
>> * The memory manager (patch 07) used a fixed 16-entry array without
>>   justification and leaked the device descriptor on teardown. v2
>>   allocates the array from the DT context-bank count (as Dmitry
>>   suggested) and frees it correctly.
>>
>> User-space staging branch
>> =========================
>> https://github.com/qualcomm/fastrpc/tree/accel/staging
>>
>> Key Features
>> ============
>>
>> * Standard DRM accelerator interface via /dev/accel/accelN
>> * GEM-based buffer management with DMA-BUF import (PRIME)
>> * IOMMU-based memory isolation using per-process context banks
>> * FastRPC protocol implementation for DSP communication
>> * RPMsg transport layer for reliable message passing
>> * Support for all DSP domains (ADSP, CDSP, SDSP, GDSP)
>> * DRM IOCTL interface for DSP session management, buffer allocation,
>>   and remote procedure invocation
>>
>> Architecture
>> ============
>>
>> 1. DRM Accelerator Framework Integration
>>    The driver registers as a DRM accel device, exposing a standard
>>    /dev/accel/accelN character device node. This provides established
>>    DRM infrastructure for device management, file operations, and
>>    IOCTL dispatch.
>>
>> 2. Memory Management
>>    Buffers are managed as GEM objects with PRIME support for DMA-BUF
>>    import. This enables buffer sharing with other DRM drivers (GPU,
>>    camera, video) using standard kernel mechanisms. Only contiguous
>>    imports are accepted; the driver verifies contiguity at import time
>>    rather than assuming it.
>>
>> 3. IOMMU Context Bank Management
>>    IOMMU context banks (CBs) are represented as proper struct device
>>    instances on a custom virtual bus (qda-compute-cb). Each CB device
>>    is registered with the IOMMU subsystem and receives its own IOMMU
>>    domain, enabling per-session address space isolation. The custom
>>    bus was introduced because IOMMU context banks are synthetic
>>    constructs — not real platform devices — and to ensure CB device
>>    lifetime is strictly subordinate to the parent QDA device.
>>    See also: https://lore.kernel.org/all/245d602f-3037-4ae3-9af9-d98f37258aae@oss.qualcomm.com/
>>
>> 4. Memory Manager Architecture
>>    The memory manager maintains a registry of IOMMU devices in an
>>    array sized to the number of context banks described in the device
>>    tree, and coordinates per-process device assignment with reference-
>>    counted lifetime management. The DMA-coherent backend allocates
>>    buffers with SID-prefixed DMA addresses for DSP firmware
>>    compatibility.
>>
>> 5. Transport Layer
>>    RPMsg communication is handled in a dedicated transport layer
>>    (qda_rpmsg.c), separate from the core DRM driver logic.
>>
>> 6. Code Organization
>>    The driver is organized across multiple files (~4800 lines total):
>>    * qda_drv.c:            Core driver and DRM integration
>>    * qda_rpmsg.c:          RPMsg transport layer
>>    * qda_cb.c:             Context bank device management
>>    * qda_compute_bus.c:    Custom virtual bus for CB devices
>>    * qda_gem.c:            GEM object management
>>    * qda_prime.c:          DMA-BUF import (PRIME)
>>    * qda_memory_manager.c: IOMMU device registry and allocation
>>    * qda_memory_dma.c:     DMA-coherent allocation backend
>>    * qda_fastrpc.c:        FastRPC protocol implementation
>>    * qda_ioctl.c:          IOCTL dispatch
>>
>> 7. UAPI Design
>>    The driver exposes DRM-style IOCTLs defined in
>>    include/uapi/drm/qda_accel.h, following DRM UAPI conventions
>>    (__u32/__u64 types, C++ guard, GPL-2.0-only WITH Linux-syscall-note).
>>    Buffer arguments are identified by GEM handles; the driver never
>>    accepts DMA-BUF fds directly in any IOCTL.
>>
>> Patch Series Organization
>> ==========================
>>
>> Patch 01:      MAINTAINERS entry
>> Patch 02:      Driver documentation (Documentation/accel/qda/)
>> Patches 03-04: Core driver skeleton and compute bus
>> Patch 05:      iommu: Register qda-compute-cb bus with IOMMU subsystem
>> Patches 06-07: CB device enumeration and memory manager
>> Patch 08:      QUERY IOCTL and UAPI header
>> Patches 09-11: GEM buffer management and PRIME import
>> Patches 12-15: FastRPC protocol (invoke, session create/release,
>>                map/unmap)
>>
>> Open Items
>> ===========
>>
>> 1. Device-Tree Compatible String
>>    The QDA driver uses the same device-tree node structure and
>>    properties as the existing fastrpc driver in drivers/misc/. A
>>    mechanism is needed to allow the QDA driver to bind to its device
>>    node independently of the fastrpc driver.
>>
>>    The intended coexistence model is: platforms that require the
>>    complete fastrpc feature set continue to use "qcom,fastrpc"; new
>>    platforms where QDA's feature set is sufficient use a QDA-specific
>>    compatible string. New feature development is directed toward QDA.
>>
>>    The options under consideration are:
>>
>>    a) Add a new "qcom,qda" compatible string to the existing
>>       qcom,fastrpc.yaml binding, since the DT node structure and
>>       properties are identical.
> No
> 
>>
>>    b) Introduce a separate qcom,qda.yaml binding that references or
>>       inherits the fastrpc binding properties.
> 
> No
> 
>>
>>    Seeking guidance from DT binding maintainers on the preferred
>>    approach.
> 
> Grow existing driver. You do not get new driver, you do not get new
> bindings.
> 
> 
> Best regards,
> Krzysztof

