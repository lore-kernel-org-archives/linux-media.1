Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828BE3AE1A3
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066043; cv=none; b=JgwqKhnrG5nwF+OLgYeh+PIMLRXRrXdZPQIyMazTf+USqjZ+6Ug7YDecYwuoY6nB37OxxZnI83AL0iTE4HpI+uhWE1PbDOQM2UgSUfuh7KKibWmv58J7TBCi5+Eu0u/bxhAEX4y+nWK9zY4I+dqhw6OwTRpF9DPekrAfnCuMlbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066043; c=relaxed/simple;
	bh=D2to+qdFUJIyRn0gO0bPSz/9KSto6nc1kDi6S4cQSCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E1jt/w9UYqXeOGUeATIu6/7Uub9GEA4g6ebVP8osqIVIzD8tnZk/NsqTxcR4fHMn7gLAf/CxhW9XvAhHIvYdrZVViw3fgZyljmguYT9nGgJhf5+SOPy3GP5eH59JLtxH32DmZGE8I6GnWeWX4T/ZXZA72ICf9/hngmE7tyvPH4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3fiog3g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmexIi81; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3fiog3g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmexIi81"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE12so1084936
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wCtpXxUQCEA8WhSXbgymO2TVAaU6id4xxMyC/S5YYf4=; b=Z3fiog3gpR5J63/e
	7CCWAel77dlY9WkrBJ+wpdtWVpbQEyxFPQBS7AlcOKqsQnzrb0VTKpVQRCOXx6Ja
	K0BiGsqhouF5lBpY1Vq84i5y9xfjf73D6YirN3nMwgXEsb47IBhj5J0PU1uOImQ/
	S+ic7msXJsBNo/4F4aGJvMc2LHNKMVx8phj5zTXIgCzv0js9KNuS2DGSJwUVkPsQ
	6BhrOqQJEvoMJfIjYJc4pcn4OTV2Op3KgJfX3uKzw7ziIWf5nnTJD092lhFw/V5j
	8/JXzjk82bl28WYDIep2rXpg5mUeB+J6YhxUABqC7KWwG8GxzDA88F7ZN9yPukVx
	huKIZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fbab069-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:14:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930a098ea19so663928985a.1
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 08:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787066039; x=1787670839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCtpXxUQCEA8WhSXbgymO2TVAaU6id4xxMyC/S5YYf4=;
        b=bmexIi81xSeEPhKngnOQsFHhTLLCE/jcYOvLwXd0RWQu1o2blqL/0zIV3TSjXVttQW
         6I4ktV8sBOr+6fqoIpIrly49/kVa39ujWJqmKsYRSZBThz//dEMzLxZfRi8altcDsYjM
         WN1pbaxEt6dphGRaClcSa5xGw5ANZKYEPykijgXlC81xqXGLMgkRGqnUxHq8/6xtjVLw
         5RorqDHFwC3Cv8VPioSuxwMoYLFBIsm2rub77cdjzEtnQBemY5Ri7TIn3Eo7d6jR1nVN
         MuPOSHHI8wg1/PE+BTRbFUpz8ZIWI116/dVGSj6cEtrbbtmDzaWQxXeGE8YOKyx7ZdHp
         DbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787066039; x=1787670839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wCtpXxUQCEA8WhSXbgymO2TVAaU6id4xxMyC/S5YYf4=;
        b=nGnfCtoU7xgLrwkrQU9FZaRVQGO2nY/+x4Coh75lAp/xw01l9RrSs1bCGpy730gjjj
         ZLdMCXkpRs5zTjH/AFM6TOaqMM7//Tfic5YbQo4AxIqn8Cg88xksV34/pVdDRaxMImqN
         qEGQzb3YPsHTQz+HYrex+iiMaD09V+90NLzt0mTDmYWZgDiWVhUd9bybZLVrKgihOMRi
         //CvL8al1Ym76BaQfVlRq1NXLnOVyBeDA1sSE6K+fYUMzqhvKAlep6U9nXW3l/BsuqCH
         9bFe888arK5kXDvhsQoLuKlx8oSQbIeSBBkCkz4Za3VkXrLR3mMezhlNNBUH5OlHYq0W
         vc2g==
X-Gm-Message-State: AOJu0Yx+ggUyOT+4qJEYtcixVjgmZ57Yl4xKc8vJ7VJhFmnQr5aiJ3w/
	EbpvoIVmsmV6CCftoeAh/fwbRqMVoXp037R22PqD+bPDIJBvdpwCcPZhJ8rdzFQ14b+BETXztRK
	M6fSOcVe0hA94Q2fm0syXMzMSR4wf0dZKG4sNoUJfQU0PvCw9Bsia0b1H3B8pB7oA7w==
X-Gm-Gg: AR+sD10U0lJ7rIoEV/JMsmuDy4c6wulbz4X+OLQT4RbIvgjVbRC8JuQqigcdgPk/Xe7
	t6AlnFSyfI5ZzmEjGD4DBtGLG5VveAksduVyhxKh6WZgKBXnjP4lLvCYcyKBrL6eASGjgwacp0+
	6+tET3gn2m1heMk1DgGgfiEtBJIYZmkzDYX8Cfh2kT4lobbKWfjpNoBp6rlPNbni5jjMFm9yZsn
	wbu8Lxc1c36hveon1RRNGLQrFeJwIDyvuxqiYxD2L/bMhSym20QgvKHDi4gAozcU8FnaVu5xJ3N
	aKG45ztcpBECT8Jk84WulxCrSpxtaxV75yTjo4oiXdVt5zvbaFZe5Q70m6+QOuejY77EHNhNJFm
	GtGrqtRJvAPpCaZedNqAkRkt3BsCf0S9Zzg==
X-Received: by 2002:a05:620a:72b4:b0:936:cae6:5869 with SMTP id af79cd13be357-936d23607b3mr2667722385a.46.1787066039413;
        Tue, 18 Aug 2026 08:13:59 -0700 (PDT)
X-Received: by 2002:a05:620a:72b4:b0:936:cae6:5869 with SMTP id af79cd13be357-936d23607b3mr2667716085a.46.1787066038938;
        Tue, 18 Aug 2026 08:13:58 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3158asm13111105f8f.7.2026.08.18.08.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:13:58 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 20:43:23 +0530
Subject: [PATCH v2 2/2] media: venus: Fix iova allocation from restrict
 region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-reserve_iova_in_driver-v2-2-5005a1154408@oss.qualcomm.com>
References: <20260818-reserve_iova_in_driver-v2-0-5005a1154408@oss.qualcomm.com>
In-Reply-To: <20260818-reserve_iova_in_driver-v2-0-5005a1154408@oss.qualcomm.com>
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787066016; l=6186;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=D2to+qdFUJIyRn0gO0bPSz/9KSto6nc1kDi6S4cQSCE=;
 b=cyF1gI48/ejxw8jwVxPUy8tI2Ux5AK3JwWjAy26p2TYMCW0mMm9/FvQMBKK8/xEypMGQL5emd
 12WCyoQ1hpzCOtGk6jBKOWbDfOiq49P2gCIEThD+m9GwEPN7No7nqNc
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExMiBTYWx0ZWRfX3wa9HzCltP55
 Z6RrBDKH4kayphoBMRIDpsP7cY2tXd9gNzsdEBtMepc7jghtRJA1FWE0srCMTuno+HEp1L3Qnj9
 5wPDZp5FrDDIF1FipoChj+OvQBOIS1U=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a8476b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qCMCQjtVS-vTbDhzrxIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: JKgkpzw3WJGdOp1tHjHFkedORv8b-ei2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExMiBTYWx0ZWRfX74vyEs8J8eDv
 chBhVhK4VOg5oEa+6ShmTodG6W8byR5ns3mVpT+qajwvvPM0upz2ynj3xBP50YWLCnIfHfmpMC6
 2rOIWElc9XWa97GbG/sT9V4r4lyJ8UsEc7sWvMvyJIJYj204bJ3e39O2iRDMsGtqOaN0KAiWCpR
 L9YzVII19+bF9hACBVhyjcte5C0sTiS5+Q6JS+xaZpRqO44xzlAz6aoxOzQN3lpRRlqpSyS46z+
 qEdfc5e4vcVpD/Gz7cJv0rhreOhJLztkagi17vxvbaFXfLLggH3hMXOMai1XeT8tSFM12jEFRGv
 JOa6xqC5+6U1p9UwatYCLN0LboYQJzXv8Lyfx9yeP19NCzs7av4XA2txVDPBNAPos6F+lLARRRk
 ozA9o6GBr7juTFe8fkUhfKxQeBngudWhBMnDPcbfhnpiK1AqaPBQmpi2zU5NlhmlRH9da0qHGmn
 l/M/GgVR5EdXf16WXYQ==
X-Proofpoint-GUID: JKgkpzw3WJGdOp1tHjHFkedORv8b-ei2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180112

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
in one IOMMU domain sharing one IOVA space, so nothing stops a
non-pixel buffer from landing below 600MB. Once an allocation lands
below that boundary the hardware faults, which shows up as unhandled
SMMU page faults and spontaneous reboots.
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Fix this by reserving the 0-600MB range, below the boundary the
non-pixel stream cannot address, using dma_iova_try_alloc() so the
IOMMU-DMA core never hands that range out to a real DMA mapping. This
reserves only IOVA space, it does not allocate any physical memory.

Since sub-nodes for non-pixel, pixel, and secure streams do not exist
yet and only a single device is available, the restriction is applied
to both non-pixel and pixel stream IDs.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 66 ++++++++++++++++++++++++++++++--
 drivers/media/platform/qcom/venus/core.h |  5 +++
 2 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..2a0ab553c451 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -377,6 +377,57 @@ static int venus_add_dynamic_nodes(struct venus_core *core)
 static void venus_remove_dynamic_nodes(struct venus_core *core) {}
 #endif
 
+static void venus_unreserve_iova_region(struct device *dev, struct dma_iova_state *state)
+{
+	unsigned int i;
+
+	for (i = 0; dma_iova_size(&state[i]); i++)
+		dma_iova_free(dev, &state[i]);
+}
+
+static int venus_reserve_iova_region(struct device *dev, struct dma_iova_state **iova_state,
+				     unsigned long start, unsigned long size)
+{
+	unsigned long dma_limit = dev->bus_dma_limit;
+	unsigned long end, rem, chunk;
+	struct dma_iova_state *state;
+	unsigned int count = 0;
+	int ret = -ENOMEM;
+
+	state = devm_kcalloc(dev, BITS_PER_TYPE(dma_addr_t) + 1, sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return ret;
+
+	end = start + size;
+	rem = end - max(start, PAGE_SIZE);
+	dev->bus_dma_limit = end - 1;
+
+	while (rem) {
+		chunk = min(end & -end, (u64)1 << (fls64(rem) - 1));
+
+		if (!dma_iova_try_alloc(dev, &state[count], 0, chunk))
+			goto err_free_iova;
+
+		if (state[count].addr != end - chunk || state[count].__size != chunk)
+			goto err_free_iova;
+
+		rem -= chunk;
+		end -= chunk;
+		count++;
+	}
+
+	*iova_state = state;
+	dev->bus_dma_limit = dma_limit;
+
+	return 0;
+
+err_free_iova:
+	venus_unreserve_iova_region(dev, state);
+	dev->bus_dma_limit = dma_limit;
+
+	return ret;
+}
+
 static int venus_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -421,10 +472,15 @@ static int venus_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
+	ret = venus_reserve_iova_region(dev, &core->iova_state, VENUS_NP_RESERVE_IOVA_START,
+					VENUS_NP_RESERVE_IOVA_SIZE);
 	if (ret)
 		goto err_core_put;
 
+	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
+	if (ret)
+		goto err_unresv_iova_region;
+
 	dma_set_max_seg_size(dev, UINT_MAX);
 
 	INIT_LIST_HEAD(&core->instances);
@@ -434,13 +490,13 @@ static int venus_probe(struct platform_device *pdev)
 
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
 
@@ -525,6 +581,8 @@ static int venus_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&core->v4l2_dev);
 err_hfi_destroy:
 	hfi_destroy(core);
+err_unresv_iova_region:
+	venus_unreserve_iova_region(dev, core->iova_state);
 err_core_put:
 	if (core->pm_ops->core_put)
 		core->pm_ops->core_put(core);
@@ -562,6 +620,8 @@ static void venus_remove(struct platform_device *pdev)
 
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

