Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3202D582B8D
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965902; cv=none; b=FnUDzRw3kD+Lhzjla3EyZLZcD8R5soXy9Gssg+NO7nU6fWF+SYXZWPWF18mOyxlwcThTMIIJAzDJDkJ02cK3c5XSXY6vVy5rPIMMclHcfCXMizbB6hwdy995kW0yySWFJhmIDsxgJK53xIfxi4RatAid3UjjxkeZ9Rodvl2s0GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965902; c=relaxed/simple;
	bh=fqABz+QRgPQSuehU4mHZGuHjcg1K8k452p65GQ8Wh5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQfOeqFR6qWyMbAaoP3PmENCMshiRxhC8FeT2cayQnUM3e6oBKnfLjX6w5IFwFY/yn+qyV4i2bBdH+OZhR77x+mw/w6yBC+HAg5FJWfI3fsgTg7+Mc34Jps2aBcN3j2AnNXURlsX1OQ5K9tpdBb9BnZc942sIzDCgXLvplyrQT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3VbZmSd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xe3QZ4NU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3VbZmSd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xe3QZ4NU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU3gw1183629
	for <linux-media@vger.kernel.org>; Wed, 9 Sep 2026 14:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3FXSLpfX1uuKQ48PVTJAV5lMhV6YqUrz9fFUADq20lE=; b=C3VbZmSdKULWga1P
	FJDHhtXTxE5Qr6AGkjiZ4mrtP6xHQzYbYv8v/pJqCLg7dDzhXn4YrOC8Pce1ZK4G
	4s68dp0hc8xZGGgHUzTu0Ii5uA/AqGUloMFwKVd4bcDrcXAdQdq/KuFEUcLSe6+N
	L43XrEyZXpyP6dk4/hMp7quxw5ppZTTObdmkjV0WTLEUnNnB5PKWJONPMcSU5hdZ
	2e1Deu1TL1SsHZ8WFYHn8XtD5eiLxFnVPyUqhjbEvPB1bbmZuOTLGsZI6U5GWQw0
	D2y1TEVfBCgARU4ADJ331JIfl9suH3AgQ8J+PCsSS6hCCqLJkJsZMfEmL2Cn2ch3
	mfwKjA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559s8hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 14:58:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-85321e37104so6296520b3a.3
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 07:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965898; x=1789570698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FXSLpfX1uuKQ48PVTJAV5lMhV6YqUrz9fFUADq20lE=;
        b=Xe3QZ4NUyHGKFyzyThRjUw+ZKNpEQel0olwyeb1XpqX2LxIHTm0enJXvF3fofpwU9I
         IlxYfu/fPC63FRceiRbpsDM5rUapSHV6lQjjo0g7LwRGP+mn1nsVDAJTYweFdHBwkyUv
         bjA4ePjXQ+8OcH05R2hFjzJk7jZUaplzmOf0v3i7TOPrMjGl8xtES9H8Gh7+icvPBvN7
         3B1XphyFvdVHVwjxuWR5Pa4nal7FmpwH0tMWXQrtFy0w26r62llhZaJ4OZcLzKqRzBpJ
         4TfcKfAMHCgpz5/FaEgoMcUXNd4EulVlsuOTts3R0zvEuESolmDU1W/E98wBSX5ouT2k
         gJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965898; x=1789570698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FXSLpfX1uuKQ48PVTJAV5lMhV6YqUrz9fFUADq20lE=;
        b=Y/9oqmUnlkxrq4iCLU/xOLy2rGadh8wzyY43frW9XpoR59XHAKIZeeHfDKw8WOCSL0
         raYGr75MdiYaV/MX/mD/JUsbjW3z89S30PlnUWnhuXiOI6C+en23baT7j5UNQBg1aeyZ
         sdB7MeFACMf+VKPkeZi+wecrAXfCgsoJjXknSCQtVdfTLtSLG16NXD+WZ65YxDwRwL58
         rLHeA5BL76W1Z+OXF2aYdLP4/bhxDn3g3UaEHSTy7MQ5yNF/TKtLFFuUFcK4L9ARWaUP
         fZqQvhlXeQHuKtnr720XPotUqLp+q2NcO1OADh9J+EjfRvR00H1MzFQ0bfWOQowKr5gr
         11jw==
X-Gm-Message-State: AFuF++khvijBy+P1NNEGBwtX5DS7d/NVN/CfIC3go7olnBcLIGCosPD2
	579ZFm2pXkYWWD0WCjIN8Dvbzp9C5e2+mL9JIt0tFfqqGSz/iLK/y+wgk5/AtTDlbb6cQCgGqMM
	PTdMdfn1hA5R6/o/hEEtfErcuz5NzFPQj9GYT706/P6mERMLfTGnk1jtHfQs4/sjldg==
X-Gm-Gg: AYBFou0lSROpGisyBGIFw6NVJbTEVfZlpKuKdNdeJ0tPgrPU4/3+hICmUAqpPFhvVY6
	aTZsgmRZLMOSJUahaqbh6pEZmVCpotdf6HFBV7wMD0T7yK7mkAbVcDRjvjiZ4WpCF5P7veAR3Tq
	rDblnQdFxnK0jRraMrLmUOK/V1S6cMmV9JM1R9zCcbBYhCg3upx7HbL0uXLDKmAXgq5imHV6s0P
	cMfCHMN2R40jOgxd1e2GGVQjkGR/Hm+4jnpvnL1hAL6LEBjxKWFvNRKFl/H7BcEuLU338Lhn05k
	bOeYOcLF+yL7n2UXgWTQgQjahwDhC7kU9ZF2oLk7oGM9TNTR3+wRN5ucx095LQVmA9SkZkyaCRN
	64lF7kSNl6/qnGF2Nr788VRAbf1o71unv2/k=
X-Received: by 2002:a05:6a21:6b02:b0:3da:3492:83d0 with SMTP id adf61e73a8af0-3da3a173d6cmr58825892637.23.1788965897713;
        Wed, 09 Sep 2026 07:58:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b02:b0:3da:3492:83d0 with SMTP id adf61e73a8af0-3da3a173d6cmr58825809637.23.1788965897160;
        Wed, 09 Sep 2026 07:58:17 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm51270766eec.21.2026.09.09.07.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:58:16 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 20:27:13 +0530
Subject: [PATCH v3 06/13] media: iris: Route buffers to the matching
 context bank device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-vpu_iommu_iova_handling-v3-6-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788965840; l=9298;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=fqABz+QRgPQSuehU4mHZGuHjcg1K8k452p65GQ8Wh5k=;
 b=nSkMGkc7UUvqzbrcKlJfJdOn3dhj9vie5jQrrGbRglKj1HkcAnyhx1n2VTK6r6psJSxkH0jlt
 GfptyPTI650D1uDjfEttc9RA6Q+ICqZOWn7kl4yKVgDSrT/rl38esWy
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa1740a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=XoEKZCkTUFqVY0t_PIAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: jhXFjplATEXtX859PPIzLOGIFOpsK5Qr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfXyj1KRE6dXvfC
 VjH1+WVafbY2KXDNKfMvqOSQKIofw8lYQmoKEXZqoWEekkNqWcF+tn/WfB2nbNDzdJwInZJfxTI
 LhLKoUb4e7ZaCCCH6er7Teq/Q4PhYWE=
X-Proofpoint-GUID: jhXFjplATEXtX859PPIzLOGIFOpsK5Qr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfXxzxcB2/eIj93
 Lxt58JZRGafAJxEZ15TyMEuH7XLgxOqitA6nfh/5ohLo4wWPO7nNvvuRjxNM4c/+QLEd9sOTFbf
 J6KUre4S0zkl5Unk/PFbdItRD3tNaZQ4aVFVPjQRh9ebBGNdmlO0Wvj3T48WVC1n0fwgEGRC6oq
 m8Ezmep67C537kYHZ2C7bArNy3LJABfhPamdk9QPzmqtOhyFWcyZ2P1P/6UDYRkPFqi88W24cMZ
 ZO5bqDfLEaWIuimhVw7r6ET3P9QsCErKp/KrJvZn13n0cJLOahWLeraP6S/HQG7bnq4eSUqBwMl
 /cXqU2UD3SJV1BYBHyCialUeGDu5Wg5A03htpGjRplsvaei/QE9qo5Up0cDueDGM2iWNIiAeXK7
 3B0Yf6LpzWXrxV/AhpwuHZHjJRmTE/atv3yUfPcLyExWu+mC27UDMR3HOsll6cdQWWuoZ9x8wtR
 b0dMWnagsLm26SR+IXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range.
Add iris_get_cb_dev(), which maps a buffer type to the owning context
bank device. Bitstream and internal buffers (BIN, ARP, COMV, LINE,
NON_COMV, PERSIST) belong to the non-pixel device, and uncompressed
buffers (DPB, PARTIAL, SCRATCH_1, SCRATCH_2, VPSS) to the pixel device.
BUF_INPUT and BUF_OUTPUT depend on direction and are resolved from
inst->domain: for a decoder the input is non-pixel and the output pixel,
and the other way round for an encoder.
Fall back to core->dev whenever the relevant context bank device is
absent, so platforms still describing "iommus" on the parent iris node
behave exactly as before to maintain backward compatibility.

Tested-by: Daniel J Blueman <daniel@quora.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c    |  8 ++---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 16 +++++----
 drivers/media/platform/qcom/iris/iris_resources.c | 41 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c      |  4 +--
 5 files changed, 57 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177f5e1ab83b90a3c8c80e0b4d1f02e..6e03d13ac1a792c539bf8fe6d26354aa29d7b3a2 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -531,7 +531,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 				       enum iris_buffer_type buffer_type, u32 index)
 {
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
-	struct iris_core *core = inst->core;
+	struct device *dev = iris_get_cb_dev(inst, buffer_type);
 	struct iris_buffer *buffer;
 
 	if (!buffers->size)
@@ -547,7 +547,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 	buffer->buffer_size = buffers->size;
 	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
 
-	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
+	buffer->kvaddr = dma_alloc_attrs(dev, buffer->buffer_size,
 					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
 	if (!buffer->kvaddr) {
 		kfree(buffer);
@@ -650,10 +650,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 
 void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
-	struct iris_core *core = inst->core;
+	struct device *dev = iris_get_cb_dev(inst, buffer->type);
 
 	list_del(&buffer->list);
-	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
+	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
 		       buffer->device_addr, buffer->dma_attrs);
 	kfree(buffer);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index bf6db23b53e2106c08f2139b643f8626af8bc40a..ce6a682b0f9ada79f9fae26289db298855d777c2 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -245,25 +245,26 @@ static void iris_hfi_queue_deinit(struct iris_iface_q_info *iface_q)
 
 int iris_hfi_queues_init(struct iris_core *core)
 {
+	struct device *dev = core->np_dev ? core->np_dev : core->dev;
 	struct iris_hfi_queue_table_header *q_tbl_hdr;
 	u32 queue_size;
 
 	/* Iris hardware requires 4K queue alignment */
 	queue_size = ALIGN((sizeof(*q_tbl_hdr) + (IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ)), SZ_4K);
-	core->iface_q_table_vaddr = dma_alloc_attrs(core->dev, queue_size,
+	core->iface_q_table_vaddr = dma_alloc_attrs(dev, queue_size,
 						    &core->iface_q_table_daddr,
 						    GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
 	if (!core->iface_q_table_vaddr) {
-		dev_err(core->dev, "queues alloc and map failed\n");
+		dev_err(dev, "queues alloc and map failed\n");
 		return -ENOMEM;
 	}
 
-	core->sfr_vaddr = dma_alloc_attrs(core->dev, SFR_SIZE,
+	core->sfr_vaddr = dma_alloc_attrs(dev, SFR_SIZE,
 					  &core->sfr_daddr,
 					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
 	if (!core->sfr_vaddr) {
-		dev_err(core->dev, "sfr alloc and map failed\n");
-		dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
+		dev_err(dev, "sfr alloc and map failed\n");
+		dma_free_attrs(dev, queue_size, core->iface_q_table_vaddr,
 			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 		return -ENOMEM;
 	}
@@ -291,6 +292,7 @@ int iris_hfi_queues_init(struct iris_core *core)
 
 void iris_hfi_queues_deinit(struct iris_core *core)
 {
+	struct device *dev = core->np_dev ? core->np_dev : core->dev;
 	u32 queue_size;
 
 	if (!core->iface_q_table_vaddr)
@@ -300,7 +302,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
 	iris_hfi_queue_deinit(&core->message_queue);
 	iris_hfi_queue_deinit(&core->command_queue);
 
-	dma_free_attrs(core->dev, SFR_SIZE, core->sfr_vaddr,
+	dma_free_attrs(dev, SFR_SIZE, core->sfr_vaddr,
 		       core->sfr_daddr, DMA_ATTR_WRITE_COMBINE);
 
 	core->sfr_vaddr = NULL;
@@ -309,7 +311,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
 	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
 		(IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ), SZ_4K);
 
-	dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
+	dma_free_attrs(dev, queue_size, core->iface_q_table_vaddr,
 		       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 
 	core->iface_q_table_vaddr = NULL;
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 2c4d34c7bd77d1f78d3572f659da656eb3b12113..a6c3df892ca9888d82414ca6b48c80efbf7b06d0 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -12,6 +12,7 @@
 #include <linux/reset.h>
 
 #include "iris_core.h"
+#include "iris_instance.h"
 #include "iris_resources.h"
 
 #define BW_THRESHOLD 50000
@@ -138,3 +139,43 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
 
 	return 0;
 }
+
+struct device *iris_get_cb_dev(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	struct iris_core *core = inst->core;
+	struct device *dev = NULL;
+
+	switch (buffer_type) {
+	case BUF_INPUT:
+		if (inst->domain == DECODER)
+			dev = core->np_dev;
+		else
+			dev = core->p_dev;
+		break;
+	case BUF_OUTPUT:
+		if (inst->domain == DECODER)
+			dev = core->p_dev;
+		else
+			dev = core->np_dev;
+		break;
+	case BUF_DPB:
+	case BUF_PARTIAL:
+	case BUF_SCRATCH_1:
+	case BUF_SCRATCH_2:
+	case BUF_VPSS:
+		dev = core->p_dev;
+		break;
+	case BUF_BIN:
+	case BUF_ARP:
+	case BUF_COMV:
+	case BUF_LINE:
+	case BUF_NON_COMV:
+	case BUF_PERSIST:
+		dev = core->np_dev;
+		break;
+	default:
+		dev_err(core->dev, "invalid buffer type: %d\n", buffer_type);
+	}
+
+	return dev ? dev : core->dev;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index 6bfbd2dc6db095ec05e53c894e048285f82446c6..a9a5bddb19c24917de4c5dba52567934b77e5c59 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
 int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
+struct device *iris_get_cb_dev(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index fcbc60016beec693f2ce27927a09a2d51494bc38..064cf0a80748dab1be0515c4c2b6688aeb2b7022 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -108,7 +108,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct iris_buffer);
 	src_vq->min_reqbufs_allocation = MIN_BUFFERS;
-	src_vq->dev = inst->core->dev;
+	src_vq->dev = iris_get_cb_dev(inst, BUF_INPUT);
 	src_vq->lock = &inst->ctx_q_lock;
 	ret = vb2_queue_init(src_vq);
 	if (ret)
@@ -122,7 +122,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
 	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
-	dst_vq->dev = inst->core->dev;
+	dst_vq->dev = iris_get_cb_dev(inst, BUF_OUTPUT);
 	dst_vq->lock = &inst->ctx_q_lock;
 
 	return vb2_queue_init(dst_vq);

-- 
2.34.1

