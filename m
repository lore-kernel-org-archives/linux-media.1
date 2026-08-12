Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D618E4156EB
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532258; cv=none; b=FVRrwxpFCs0cbrH/NszjHZZDMcQCYyg9/jSnuPvdZ0iTXAhvM7oEx/NROQw7WFLFVOQc0VdbgoVmLwQdLxhEjHKqFJqFqNSS4ixLGjfbRZzLUvJBNdm7wgI1pKRwYSFhrZlAtbOam5OSVkyWu7WFI8s5NNX6h6nfU8/CXnGZFmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532258; c=relaxed/simple;
	bh=8ZB9oC0BYPYr0KW4jSRGQUpa8L9wo72omlw1zjhy3Kc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ga0ZRvDMKR/lwgexW3pX8seDbYnYMY878gv4ZvA1t2m1DTM3VHaPu4mPSXWYY3nXK0hsE0FQsf5Sj0CWmJ9rPN+2IXi+FCul99UKuTTqHPkxYq80nG2UXxxhMm8W0p4jUqu8siQGeRaYlOPDanftUxh+KhB9HksTv3x5foZ1ypI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mjU2jtsD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTkCT23x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mjU2jtsD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iTkCT23x"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9frRk2677279
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 10:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RtUEIMWHjJys3xVIM8NtzsQlE2aU/YyF8MJBv+cSiR0=; b=mjU2jtsDChKxemqR
	lmetKjLKehXufJyb75N3PqRoQ1jToHyfkiQ9DeM9HRQ5aztmTEi3Iqjbb0DOAfYq
	B3g3EHgfgy5CUnFZmBcOFEUbK8M1Mac7NMn57lF+pFBvDU3It3A2lbREiSOMorRK
	Rr+BlKAX6O/HmCXzaeFXG7jbgCzKAgzLAGZjFYqwon1IaAu2VKC0nhZg5sd81ov5
	WbnrIbtEaJrwsK1BDCbKqX07v7EJduHEIX9VII00Kc+xlxPjIJiy4qJmFN3M2+Yx
	m2yFMem7bHPdWH0BV2YiDe5YJfy5YVwlnBtAfI6QXRxQ9L/k4zD9YapDfT8eMgMG
	MytXdw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0mnd8qdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 10:57:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8488ac68185so2035725b3a.2
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 03:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786532251; x=1787137051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtUEIMWHjJys3xVIM8NtzsQlE2aU/YyF8MJBv+cSiR0=;
        b=iTkCT23xbqtXcPV5Z9zExR2vUHWPNzpU6jiqoo37ytWPvWu8h5WtD6FLJZ2YIgIHs5
         sEMux4bL5zbqqTWje+teydoHrDEd/2GYTCCyR+Fw327UbyTfoCpPyvvzxzHnS1h5TX1l
         Gt49quGrvUg3Ycq6rHAgOTRCNLZ6SkhS6Dq0/Z05/Be+nFHQvhUisWsFQBGw2LjacLm3
         O8OI5xkEiI36VuZcIbShOt8wUY8j4HAhGYUQL+1oBdXyMhAy+TrXivJnKHUnd4DgFGv6
         lUssfNHELUed7pL/y6oksnPc4w09uWW2+Bk6yLdiYY5on0VXBW34kPOHs4Zi0f5Urd4n
         oFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786532251; x=1787137051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RtUEIMWHjJys3xVIM8NtzsQlE2aU/YyF8MJBv+cSiR0=;
        b=nbylKwIGl8KFvMCvH2QtIQkg/MrtJudKKBfNCk/0MxiAE0Ot3eEJdgMzhSsUcaJIa/
         3t5TjptN0Gfap7TsIlSfURwoMrx3PTSHenmoCTX2gOSZHHtFPjRYcoWJdn6iuKqWl7FL
         zNtsGwDGXL3fjjIUXubFO6xjlButl6JNjHZIubVOxa9huq3BnW/R46gl3L5YOwe07gF3
         w+DE2wtact6b9hSwP9pI94LpeXVbAU0ZCVD7ykmcFc4j9ABkesKNOM1Hdt+mvRPg3ae8
         pmGF50o/fTO32JK0tHp7cNAsUXwJIHpLjxbfQZN9nyE4Ap85Pw4he0xmLBpEh3/RTpCS
         vXlQ==
X-Gm-Message-State: AOJu0YxeORYM/QC7wQj/OpY0+icIqF77mBybPqoTANai43fXYM/GCb8P
	3L/WgEw1Q3dmsEOC+onaHY7DVXDrNiC81zn6GBx+5keOqxMdueW3sVAtG5zeeRu9eXCFf9wQIlp
	iSOzfD9ayydbSMKPdzstodHRFe7Hr3TDYPI9nYpeKPsTjErS5cIq7DdGhrdHeWockrBAG3IJTsw
	==
X-Gm-Gg: AR+sD11L4xZHIQ7nnniiosIjaWPjuVjVLWgVZu9iJL/X/naHD6jsgw4SBTCUzOcgxZt
	0LGnjJ5Yxh1ZEI0DuqWDkXYuQnDWFu8VnMrKzt2zCJL4jVEIgP8vQo9bunwfdGlFezfQp+1UgLk
	jzds/hQmiOMCBBVzhvAJDYFxZpKcfVrxiQq0ABCUnubukJiI7GtbRKGnPruXUWQK7G3lZjAIcfX
	s+7wlEi9jLieVJoEoNX9lChOEcD/SfdFBHAw50jFDAv9IGezyxUMVkytUlp+pL3T3PqZxEN0OUD
	SNY9x3Svfg7mvUD5vj4yqaFgiyzNhzxguXwzdh38/gT1IzpgnB1JAESTbNdq/KC20yqNOFoMuUR
	8q+rAooV0gLbdJ/DpgRWyrZmbFY9KgaeFjg==
X-Received: by 2002:a05:6a00:2994:b0:848:75a1:a0fe with SMTP id d2e1a72fcca58-84fb54e1b6bmr4568440b3a.18.1786532251336;
        Wed, 12 Aug 2026 03:57:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:2994:b0:848:75a1:a0fe with SMTP id d2e1a72fcca58-84fb54e1b6bmr4568404b3a.18.1786532250868;
        Wed, 12 Aug 2026 03:57:30 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1d22247sm884301b3a.15.2026.08.12.03.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:57:29 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 16:25:59 +0530
Subject: [PATCH 2/2] media: venus: Fix iova allocation from restrict region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-reserve_iova_in_driver-v1-2-ed62f801275c@oss.qualcomm.com>
References: <20260812-reserve_iova_in_driver-v1-0-ed62f801275c@oss.qualcomm.com>
In-Reply-To: <20260812-reserve_iova_in_driver-v1-0-ed62f801275c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786532236; l=6620;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=8ZB9oC0BYPYr0KW4jSRGQUpa8L9wo72omlw1zjhy3Kc=;
 b=e9+nzr30bUPUEH095WBn5jUl/U+gLamanqQ4ZLhfQcYtMR/6EPEyLTOmCZqbHrpgTMAhNWfya
 zs8kZpuQ4tFDsmnSX5L8Oppe22lPItk6sFaK6jxQYjp6dUFmDw1aaMR
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4OCBTYWx0ZWRfX5Y2Rg3I8asVO
 5b4UXZ5Vb7XyTNdqjKXhog56XxIhnPoMzk7sAGwlZ8dB9iZOOY//j/TY8Y/uPz62r/s4b7h1SHL
 fleK1I+OV7bBET4fzjgDxo5+cXjykFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4OCBTYWx0ZWRfXzqKzd1TNSJeh
 qDcaRtncwtOyKfUguGaTLFYqaR3yIykRTkxDKHJHKvbTeWaZdoonBSLgXc0+MI4Ne6Plv+bdbbC
 Xhhutki6yV2v6TMCjYh3tEU7or0ebSomWGlTbjGT6/BU59mY5WLy/yaN//98VUwKd3o5BM5nlNg
 5iefsZCL7FL5m855xSjVjESeqFWMepgnLKSY+bYyL24VbN4kMnmcExsg7kBZEJ/vMt/9R72UT0T
 YS52xMbutSqamiBQ12W/lOmCxjj4woYIU8KSnp7sRSZUMtoogtvViJ83l1+bj36yYdNzo1zocLD
 gw7xJknG+MXoMdgAB+/5qGvhKGSQB0T+RyZlFsXRwApYa3QdnniCr0wreGTBzc9aY/UGLDWdk7s
 9oodX9UK8Pxj1ONiHjWVhmuWDCzrBSt5urC+t4sibo+eAKJR2Rj7vTJ5OZAUBcKzyZQogWqsMmi
 ZLXWpJdkU1uJQduEF5w==
X-Proofpoint-GUID: Yqfu5OXZtwEj_6PInDr79JxtJ4Bc4PjG
X-Authority-Analysis: v=2.4 cv=C87ZDwP+ c=1 sm=1 tr=0 ts=6a7c519c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dm53AvHgw1VIgxztvNkA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: Yqfu5OXZtwEj_6PInDr79JxtJ4Bc4PjG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120088

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream
in one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below that
boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots.
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

A series to reserve the 0-600MB IOVA range via "iommu-addresses" was
already posted here:
https://lore.kernel.org/all/20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com

Those changes involve DT binding and DT node changes, and discussion is
still ongoing on how to handle those for stable and for the upcoming
sub-node design, with no conclusion reached yet. Thereby a critical reset
issue is still open.

This is an alternate solution to fix the unhandled SMMU page fault
by restricting the IOVA range in the video driver, which also makes it
easier and faster to land on mainline and stable kernels. At the same
time the patch only reserves in the IOVA space without allocating
any physical memory.

Currently sub-nodes are not yet present, and only a single device is
available, so the restriction is applied to both non-pixel and pixel
stream IDs. This makes the solution unoptimal while fixing the issue
considering all scenarios.
Once sub-nodes for non-pixel, pixel, and secure streams become available,
the restriction can be made stream specific.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 71 +++++++++++++++++++++++++++++++-
 drivers/media/platform/qcom/venus/core.h |  5 +++
 2 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..d70f7c3325b4 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -377,6 +377,64 @@ static int venus_add_dynamic_nodes(struct venus_core *core)
 static void venus_remove_dynamic_nodes(struct venus_core *core) {}
 #endif
 
+static int venus_reserve_iova_region(struct device *dev, struct dma_iova_state **iova_state,
+				     unsigned long start, unsigned long size)
+{
+	struct dma_iova_state *state;
+	unsigned long mask = dma_get_mask(dev);
+	unsigned long end, rem, chunk;
+	unsigned int count = 0;
+	int ret;
+
+	state = kcalloc(BITS_PER_TYPE(dma_addr_t) + 1, sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	end = start + size;
+	rem = end - max(start, PAGE_SIZE);
+
+	ret = dma_set_mask_and_coherent(dev, end - 1);
+	if (ret)
+		goto err_free_mem;
+
+	while (rem) {
+		chunk = min(end & -end, (u64)1 << (fls64(rem) - 1));
+
+		if (!dma_iova_try_alloc(dev, &state[count], 0, chunk)) {
+			ret = -ENOMEM;
+			goto err_free_iova;
+		}
+
+		rem -= chunk;
+		end -= chunk;
+		count++;
+	}
+
+	*iova_state = state;
+	dma_set_mask_and_coherent(dev, mask);
+
+	return 0;
+
+err_free_iova:
+	while (count--)
+		dma_iova_free(dev, &state[count]);
+	dma_set_mask_and_coherent(dev, mask);
+err_free_mem:
+	kfree(state);
+
+	return ret;
+}
+
+static void venus_unreserve_iova_region(struct device *dev, struct dma_iova_state *state)
+{
+	unsigned int i;
+
+	for (i = 0; dma_iova_size(&state[i]); i++)
+		dma_iova_free(dev, &state[i]);
+
+	kfree(state);
+}
+
 static int venus_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -427,6 +485,11 @@ static int venus_probe(struct platform_device *pdev)
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
+	ret = venus_reserve_iova_region(dev, &core->iova_state, VENUS_NP_RESERVE_IOVA_START,
+					VENUS_NP_RESERVE_IOVA_SIZE);
+	if (ret)
+		goto err_core_put;
+
 	INIT_LIST_HEAD(&core->instances);
 	mutex_init(&core->lock);
 	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
@@ -434,13 +497,13 @@ static int venus_probe(struct platform_device *pdev)
 
 	ret = hfi_create(core, &venus_core_ops);
 	if (ret)
-		goto err_core_put;
+		goto err_unresv_iova_region;
 
 	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 					"venus", core);
 	if (ret)
-		goto err_core_put;
+		goto err_unresv_iova_region;
 
 	venus_assign_register_offsets(core);
 
@@ -525,6 +588,8 @@ static int venus_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&core->v4l2_dev);
 err_hfi_destroy:
 	hfi_destroy(core);
+err_unresv_iova_region:
+	venus_unreserve_iova_region(dev, core->iova_state);
 err_core_put:
 	if (core->pm_ops->core_put)
 		core->pm_ops->core_put(core);
@@ -562,6 +627,8 @@ static void venus_remove(struct platform_device *pdev)
 
 	hfi_destroy(core);
 
+	venus_unreserve_iova_region(dev, core->iova_state);
+
 	mutex_destroy(&core->pm_lock);
 	mutex_destroy(&core->lock);
 	venus_dbgfs_deinit(core);
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 46705a666776..30b8cababe86 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -8,6 +8,7 @@
 #define __VENUS_CORE_H_
 
 #include <linux/bitops.h>
+#include <linux/dma-mapping.h>
 #include <linux/list.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
@@ -30,6 +31,9 @@
 
 #define VENUS_MAX_FPS			240
 
+#define VENUS_NP_RESERVE_IOVA_START	0x0
+#define VENUS_NP_RESERVE_IOVA_SIZE	0x25800000
+
 extern int venus_fw_debug;
 
 struct freq_tbl {
@@ -250,6 +254,7 @@ struct venus_core {
 	unsigned long dump_core;
 	struct of_changeset *ocs;
 	bool hwmode_dev;
+	struct dma_iova_state *iova_state;
 };
 
 struct vdec_controls {

-- 
2.34.1

