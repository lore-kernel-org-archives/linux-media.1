Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1800745199A
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522185; cv=none; b=ftn6Tr2TapJSMY55zqQbk7XKvHI32dyt9G2YD4tSK2SVtQZV0kDXiUPFBWJGfu88w5VrU9WtCiSApWxlOInN5nVnhKD+sJJDOkfc+Lc5Ym/ZemACbveN8EhxOEoJJjXYUf0bdzglYvPkwHT/d4pkAuLJqM+xGpLplYOmxKxvMf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522185; c=relaxed/simple;
	bh=EHGU0Yf1WUtVRKStV8fl8Seyo6tWdqScKQ66rTB8fDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VCuvh0wZWOlW73RhdAT6KfSO+032cY7tuh4WWfutWtvv/pJjSPe/NP+z8ucLLKybd7rte4rxqXmHo9U80pdzygHuHt09ZJ2PGkt2NHVx69m6B+vFOWWJRE4ICTjZW79ibKw3MWUU7bCT+6iPMKindqibAop02DKc2MBe5pj7yrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eO+RwTsr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BH7BltHI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eO+RwTsr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BH7BltHI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFO608070877
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DDjR57mjhr8E0tzUbcmM7MaObxWSfosuNuWhSaXFulI=; b=eO+RwTsrtr/C0lTk
	xq1r6UGIAsO4T4kDiXTahxw9sJGkiGs1KQZcCn4Vt63unhgyHwnF/F5q7qsIHpX5
	i2Gl30HBzXFtMT9f+eS9K3ulMTGGYaNVd3mU+5d1iCwIQ1vSbRfVXakUE9qo531f
	Twk3KqgmIKRZcWG4fGt7XaCuAJKD2/eMNmBQkuawD0jJ5MprwO6Ycm9/WTgyZUUo
	AHaJpV56Akv0MRELMX1IA1zX6C359HZ3igdNoEZIPcogLhEmewwcDkiZ6Ejl0E5b
	+B5cRhYyII8AwejHo9iLnq4R6QQNT8buIWbuaxlBWQpekQ2YR1e+AbOuGClolaDS
	SboUow==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtyqhw05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso1518900a91.0
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785522181; x=1786126981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDjR57mjhr8E0tzUbcmM7MaObxWSfosuNuWhSaXFulI=;
        b=BH7BltHIPYl/bsvQ6V3hufTdnA6n1J+xP1vYRYSFp/jDURtqUhWuMMvS5wFszdPvbP
         XR9Pcfe2Qz2FZpFatiRWkHW8/qp3wyxeI8T+Gha8V0G6iHPezGbZzxck8fpOUquOMGwu
         eGB+gALT/iVShzsEj3o7/vhz5bby+wO9Wi7AGgE9798VsCK6xjdSzhO6HE+aHbcT2PEZ
         up/bzsXQa879fMlucNtmO2EzZHOHpnH3IKyH/v4RpLgI9uLchk5/aW4Gk47M+O6fvp8w
         YDyNyyXkTTBbEKmYmf/OVVMNNsKzoxIFuL253bYxP3l3T6VGZpG0BGLQs999Tr0uR/9B
         YpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522181; x=1786126981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDjR57mjhr8E0tzUbcmM7MaObxWSfosuNuWhSaXFulI=;
        b=Rk6uv9ESTMyzRh2pP0gb6HVBl9RaGFFI2zY5wCxdZ70+qB7dk2+USGLLV4nRHWeXeS
         OeBiuxjTor8JgCIHfOEXcC4mdu7FUNfPhqo+eIlTMSPeNGGw4Pv3o6D1/qXL65+qMYeP
         3t3F/FS9bAED4Zwau1bO2nAGXw2p8eMSidUaUv3NhwkT1ab4vSRFtC5rslZJx+Ebiujn
         YLwujWofQJW13fMQBsWPgM1YlCyyPt6RzDUDG/aze6CDwnv/3PIKJJdaZk3Em5+2M4XL
         m3EFTrhSqk5vPg8Jz/n/vPfuKCY2i/5oqoMkAYxzQYng78NsB25bvPTd7HJRzxkF3AX/
         qBpQ==
X-Gm-Message-State: AOJu0Ywv8i87opoyvgVg1hbLR2SrTDnBUohuJXJLcFIE7uMYqNYX4Ip9
	2cgt3RjVhHmUAXqD0KHaJrYTtxWN1gdH5Ei4O6lZTMR+Bkp2AlGfWUYOqbwx1U/A207fzKnpy/Y
	KnCBO5V8Dm6h7AHRM/ScSv40g/j/VEL0FBA5+/z9SmRLkzREMQSIuwiRAIDaWHYwkvg==
X-Gm-Gg: AR+sD13hBmfXKxFAAiVwEZW6IM9l//KqB2kIY9DniLr9CiihJlZW3z7qyacwLuxyO+K
	8IHa09T48WRC0vfqGgST/vtoen+P2An+HV+g6NXBtczpXvvJTq59VQXWXh3bJiGLMjO6HOJ3vxP
	l59mkhiXM0cfIfjBuUHQsfh9saATFcb4+6wLkGDy4yhn3V6rV93GvOqoKw3U7J/lA5lr8TIdChp
	hR2puvsI0CgNSoENxjMJnTdPPHAHMXAB+EFTH5f9/KWFPGaybXBleceDsfqgDNMgcBgUvoH0yjT
	ZgWsUa1igkWsuCDmV4PPz/MR3uv7hhgVH1Gq8j/Qsg/3PLCXQnNcFfMYlPq1NFpuPqA3rIkWAwG
	Zd/nokByHv7K0V0AHP6A1NaS3TWa7fjyXc24=
X-Received: by 2002:a17:90b:2b50:b0:37f:e326:6559 with SMTP id 98e67ed59e1d1-38fbc51a361mr850959a91.22.1785522180704;
        Fri, 31 Jul 2026 11:23:00 -0700 (PDT)
X-Received: by 2002:a17:90b:2b50:b0:37f:e326:6559 with SMTP id 98e67ed59e1d1-38fbc51a361mr850930a91.22.1785522180177;
        Fri, 31 Jul 2026 11:23:00 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04456dsm7203089eec.14.2026.07.31.11.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:22:59 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 23:52:20 +0530
Subject: [PATCH v2 05/12] media: iris: Route buffers to the matching
 context bank device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-vpu_iommu_iova_handling-v2-5-da52b5228dbd@oss.qualcomm.com>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
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
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785522138; l=10862;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=EHGU0Yf1WUtVRKStV8fl8Seyo6tWdqScKQ66rTB8fDs=;
 b=sflYNcXhtXRKPVi22xHA2EZ42RtdZ5K/zs+3RQ0VLA5pibLVxM7Sl7biykfe0/uF9c7aY7cwG
 VokjMv1TbIODzi2ESrr8zdT4S3EiGpK26i3DDPKRv/2cC4SB3N7WsNV
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfX0LfNKDJPpKRf
 sQjUDaXWdnrETGd/2SUpf5DPsCKTg6LlxyNnOB4KQ5H3eiBkRLWHXMvOoeGA+KfEblbpXRgCSS0
 y9I8ogASoDH6X8cpvaOnxPcaP6ndllRgJ36wXKf1iIttt1qHWQe0DqbC6vRmtnmGEVYVyhsz2Ke
 HOQC2k1Ic2QrdyCo+3CsRNEonxmn7AjtMrb4qmkhXkY1JEmUwZKUYpsqnuFq4Xpa7wa6uQyilEI
 HJjWJ90W3mzcLZ0aBEespA0Bl4cyxFchMjLI7AxmHxn2jolOWMa3knEMghRLwwl2AXu2HdCxdq4
 coldDSEXJAHxn5YIbc/e8N36Zy/UaDTyh9pSJJzrSKxRf1T3BVvbe0LaudUbvL646+AQ3PhW479
 IpKNApJPakNIdCBi7iDaw2tHPJisgVaLVFKFna0veMU5HxuURSyZOXxxejfJokhL/tn4QLzwRVZ
 WkK7AtZC2Xi14gFgTOw==
X-Proofpoint-ORIG-GUID: nxKfv_oS0zSJuefyyH5nV2ZyGiQL7w1f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfX/r9elOxt0LIV
 Sn2+2K42CSSs+NaMIp2IBhfCr4xdrRqYL2hQZW6XB/t1Lidp7Xu0z/OnHs0LnkvFjLJXaUEqT8v
 YBtp9UV2kdXpIaRNtGcFKo6iDB+Vx9c=
X-Authority-Analysis: v=2.4 cv=YaGNIQRf c=1 sm=1 tr=0 ts=6a6ce805 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=d198fMeA-dxmDJFqFJQA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: nxKfv_oS0zSJuefyyH5nV2ZyGiQL7w1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310141

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
is restricted to use 0-600MB of IOVA space, while the pixel stream can
address the full range. With a context bank device per stream, every
allocation has to be made against the device whose IOMMU domain can
address it: allocating a non-pixel buffer against the pixel device, or
against the parent, places it in a domain that carries no restriction and
the VPU faults when it later accesses that address.

Add iris_get_cb_dev(), which maps a buffer type to the owning context
bank device. Bitstream and internal buffers (BIN, ARP, COMV, LINE,
NON_COMV, PERSIST) belong to the non-pixel device, and uncompressed
buffers (DPB, PARTIAL, SCRATCH_1, SCRATCH_2, VPSS) to the pixel device.
BUF_INPUT and BUF_OUTPUT depend on direction and are resolved from
inst->domain: for a decoder the input is non-pixel and the output pixel,
and the other way round for an encoder.

Use it for internal buffer alloc and free, for the vb2 queue devices, and
for the HFI queue and SFR allocations, which are non-pixel.

Fall back to core->dev whenever the relevant context bank device is
absent, so platforms still describing "iommus" on the parent iris node
behave exactly as before and can be converted one at a time.

Backports are intended since the first DTS of 8550 binding schema.

Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
Cc: stable@vger.kernel.org
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c    |  8 ++---
 drivers/media/platform/qcom/iris/iris_core.h      |  4 +++
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 16 +++++----
 drivers/media/platform/qcom/iris/iris_resources.c | 41 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c      |  4 +--
 6 files changed, 61 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 246ad0abbac3510113e1f760406c81b1461377a3..249c9f1d0d5dadb391f269e9aee5181fe408cd3b 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -529,7 +529,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 				       enum iris_buffer_type buffer_type, u32 index)
 {
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
-	struct iris_core *core = inst->core;
+	struct device *dev = iris_get_cb_dev(inst, buffer_type);
 	struct iris_buffer *buffer;
 
 	if (!buffers->size)
@@ -545,7 +545,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 	buffer->buffer_size = buffers->size;
 	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
 
-	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
+	buffer->kvaddr = dma_alloc_attrs(dev, buffer->buffer_size,
 					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
 	if (!buffer->kvaddr) {
 		kfree(buffer);
@@ -682,10 +682,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 
 int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
-	struct iris_core *core = inst->core;
+	struct device *dev = iris_get_cb_dev(inst, buffer->type);
 
 	list_del(&buffer->list);
-	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
+	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
 		       buffer->device_addr, buffer->dma_attrs);
 	kfree(buffer);
 
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 24da60448cf24820af7947b85eb7208555ab7786..3c96f46cf567b2802148b2a7cedb8488b6b9468b 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -36,6 +36,8 @@ struct qcom_ubwc_cfg_data;
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @np_dev: reference to non-pixel device structure
+ * @p_dev: reference to pixel device structure
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -81,6 +83,8 @@ struct qcom_ubwc_cfg_data;
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*np_dev;
+	struct device				*p_dev;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
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
index 9e02a92baae75803c2c12a2ca994006987c69596..fbbe529c74216cd476f06c6d0a5dd6f72b98d3e6 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -13,6 +13,7 @@
 #include <linux/reset.h>
 
 #include "iris_core.h"
+#include "iris_instance.h"
 #include "iris_resources.h"
 
 #define BW_THRESHOLD 50000
@@ -165,3 +166,43 @@ struct device *iris_create_cb_dev(struct iris_core *core, const char *name)
 
 	return &pdev->dev;
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
index ca53c01f60aef2040002f526b8f1b6a9094d1518..2eef0676a146f1836fc7445a715e43185c645099 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -16,5 +16,6 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
 int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
 struct device *iris_create_cb_dev(struct iris_core *core, const char *name);
+struct device *iris_get_cb_dev(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 14d63dc76c9bacbed3533147cd5325410f9c94bd..26df872fb4fa1cc6b2aacebb7453256864b1462a 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -107,7 +107,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct iris_buffer);
 	src_vq->min_reqbufs_allocation = MIN_BUFFERS;
-	src_vq->dev = inst->core->dev;
+	src_vq->dev = iris_get_cb_dev(inst, BUF_INPUT);
 	src_vq->lock = &inst->ctx_q_lock;
 	ret = vb2_queue_init(src_vq);
 	if (ret)
@@ -121,7 +121,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
 	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
-	dst_vq->dev = inst->core->dev;
+	dst_vq->dev = iris_get_cb_dev(inst, BUF_OUTPUT);
 	dst_vq->lock = &inst->ctx_q_lock;
 
 	return vb2_queue_init(dst_vq);

-- 
2.34.1

