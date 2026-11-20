Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173101;
	b=WSIarMy26q82hhsjPmoZbl7NiojQdRwOIgJtCFw5Se8sGOeinUsafHLQzyWLFOFycPWH
	 uxe36uL711ulVNWLQR4UkbZZ9TukttTAa7NjT9+SqpVyqDLFYEO5z1UP5gmDKUBlK4Jm8
	 gpW9khj07tefzlywauIh3gEvwJy0V2P3F1YtKdK0m+RnbUfYyyleQTJ5Jf1SfuqGyswAp
	 e67hxE3S2nIasGQJFCKmv9vV/y8lb00DTVfBXglP0z9DXsyHz6ybqg+gANGSC8lH7i+7n
	 XIkmVL35qClb08k3QFYU6e/AX4kZ00KS70fKWyHFaFC+geW6470ui7xk79eU/45AHZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AFA0X0cFheVipCck181mRNcheGfg4Ds3+zguEJ/tZ7c=;
	b=c5RzPC4+RIubiZKJAPyQRN5kDwwrzbr6aEAcLJg0Jp2UFo5yPNSVGwB5SIqEplZcB+Dv
	 vP80E8YDVecdKuPtbav+aOgjL2NEsRAnmTt7b32JP/ZH8RG72gDMBFWfzV7T1t4ujyeqJ
	 nPe/4Fhb1HMtkD4rYsvUH4j8kd8d0dEs20gmQwrtWrUQsJFAMPue2VNHX0DQqJoGkVkyD
	 vF/Kh9x2n8jmBbgrxUiaYW5hlhx38CxC9kloWtMqSKaofZtqDbebqzQ7YaOdSLR/g2dK7
	 7I/f1ZGw5mTlUAWg79NBN/U9w3YRJI1HzE2Tx8CWg5+mVTDMgTBESKJ+O3k1kYQseRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h8L95QHU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nu2RndcS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAE360A381C
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EAE360A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h8L95QHU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nu2RndcS
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjvSs1060458
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFA0X0cFheVipCck181mRNcheGfg4Ds3+zguEJ/tZ7c=; b=h8L95QHUZMeTIwqx
	YGu+3oz26qMXoEMTSylvT8pSO1mqAKnQMUj30t3mqKmwsuFao0QsnKXjE6PuYpi6
	azL73uw3PwIPcTuKm5NnpuI8ANMlseOeDnbCgC3cKrmcuxhER0EOBkgMuii70k4R
	4gP3JaBBpBg39VX1S2UN9SJfETGkNK5VdigTQ+UbaY1qa3LiZPbxUWAZAnf//Dxs
	Pji7cEOKuSFI+nWQrAaI0CxNq31cxBtPwndPw0fIMdKiozt8dCkBasaYNmYsC1uJ
	CieOrWL9E9UfQBmgjsBGWb0USG9iIO5hIa5jaMO24BV+d+VCJCeqbPDxiOR7c5ja
	vzkx/w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykbu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3817a0ffd5eso1797043eec.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 03:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173098; x=1795777898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFA0X0cFheVipCck181mRNcheGfg4Ds3+zguEJ/tZ7c=;
        b=Nu2RndcSGDPHEZMpgGilkDNadYkrHVSD/UAGOTzDYjMt8AkT/+ALoVh+Y2iqFqaipS
         j3OcT6vAHGzOn63TdOsC0oZdLvnkIUO9XBRNWWIBXqfk99mkv1m7uw5ZdKVkohbEJcAp
         w0iH8U0mM2+9i1r1uMJER1F6dIahoxHlAp7c8OmmGXstx5wGSev7/QIn3dQR1GcLfVxc
         UI9/qflgX0g0C8P+sX6WOvNBUGC5Hbhzm/vsFSmRIK81xHH4xYpO0stWWdYX2Qlb7a03
         O4R0C/bxkObO0FxZBhQSfH+FEFcTL3gKY0SHMTRkTPCGgIe+cJ1y+3SK+nGdbq1Nv14D
         uGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173098; x=1795777898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFA0X0cFheVipCck181mRNcheGfg4Ds3+zguEJ/tZ7c=;
        b=pvWFD97OoxiznFtbWb100zciI5T1+f+70/PoQcTn3hcHnBEq2NFZSvZuE41DZJm9TS
         MVVMvqsTQZqk0amxTvmQECqMnbhLLpauiLTnZAxO+DP6A3jbuBy6pgT69EGByKvCNAVy
         vU3rozYFAxCkSH+WlmoG7wZXuxXZ8bQc0rHjfL8yuH6bKLeWTqfODSd6FIOVVWv920LK
         BJdrV/BTWIPu7YuCqwLPNjm7X1nghmN+jsYgsRmAmnLDWvpPmt9d3VorKGRZlI7YbCJw
         158mXMmhSneC1RKzZlo2CYU0mlK0503QeWaNQ6zzuT1BzNOmLuASjusW40GMayp6qLQa
         J1cQ==
X-Gm-Message-State: APuU4Z898J3Pws8VynfeA0+dYCu9vS735KOCu2pIgBgLaVwV1jTHEOZg
	p7m5l4JEDkwfJHV6pLV73YS0dWoms/bZKPy4ljk1tzV8eacf92d6Zq2kxjdtdOyJYrzRySjFSaL
	anJZCi/VKJSmBB3YK23mSyl6d9+WcZBkMcnPbfe+LMEoD9rJFZu/jnlSFxoTMqK0p6Q==
X-Gm-Gg: AYBFou2weL3h+7OmH5HthBYez3UeQL/m3b/kTrrEwdq/aK+LTZZF/Tl2i5e7MsXzpXA
	PP23nEwUaEyw7AcAt5RoUhql0fqu1SOrpevCqwrYaTlSs79b4eI+r6N4BAFn80jaeUQNIExcY6z
	J/LhMdgSnkS/KrWRkfqOY5t0MDriqmLdWHlFp2D44w3aDstU8SHS02edmVc0atiqbmz6FXdrx1T
	iDAQXPp/3Cq6nU98ULQ9/B96MFbGMX4RFJXafNwrTCHk2Xo5MQe+lMqmy7uPslZGRbjYp5mwPtz
	vlY4WEk/bPV6mY/OK3rr8ywuCZQY+Mc6U6T2iNV3UFNaRdT4rEvojzX49Niq/7GSrR1wSK2JhT3
	rB4b3Iyb/vGTpLTLivvH3O/n53Frjrro4LPFuf/SSpQw8Xvg3ah5V6AcTepCCJRsImlY/sdzKYA
	fCYh/kAU46
X-Received: by 2002:a05:701b:4346:b0:14b:1ef8:698d with SMTP id a92af1059eb24-1b556900481mr2505948c88.15.1795173097903;
        Fri, 20 Nov 2026 03:11:37 -0800 (PST)
X-Received: by 2002:a05:701b:4346:b0:14b:1ef8:698d with SMTP id a92af1059eb24-1b556900481mr2505911c88.15.1795173097321;
        Fri, 20 Nov 2026 03:11:37 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:37 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:55 +0530
Subject: [PATCH v7 05/12] media: iris: Route buffers to the matching
 context bank device
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-vpu_iommu_iova_handling-v7-5-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=9250;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Z0+tCbAosQIYHYDxlt7wqZB5TuQvWYXTmexnidOijx8=;
 b=xSvTmoLjhQtVZ3b/ZQbLYAJRdAmxMdeqWCBkLVVzd0iYRQhPbxChodpOEYeiFKDU0pN9D5ARU
 YnmQ0NlKBi1C1vhll4g48lQTAqyb08iXrF8q9iFNegtZOkSVnAFC6GZ
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXwR2VeJrpBY3y
 3Qv09Ng5+xAJ8OxnXp3JJON0oBMfW/sQzlYSUb0KxDQXGGEKHByi1jPEtXPIk+UX4ZGMkkA+yvC
 N2bz1NDnGlC7LgJrNDcFn80uGc2CBkE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX0A7j33+m0u/X
 9uSlg4U0HUi8b/Y6iZpbsv2R5aISJqit6peyq3dHST78hwoVoCooCJ/WOZKefaE62tSXZZvaUoQ
 72kDHx2nOQiLx8MCwovsxLlo8lte+a4bCxViQbHFd1ZyneshUNZ5nGF56q8Xf9xXbFT6E7h2I5N
 jzTX+MhW03ur/Dl8qW+rjbearQhy4bz7pFHI5yX7piRNzpJa7oBwiy2Pcyf6MKAivJ7OcP0Rnil
 rp06REASoGDrkfdzs+vy+cKMLs78ULhMTSyP8RdIKLj95664/NYCkSXd3Xdb4lNAKMjD7pUghdS
 HOqcowpiRkCE72cbQQaT35+U5DrW/HH2RTNF4V25UpD9FHcp9pkDU+YEpDbTdMmV7tyijL1qjge
 62xfi/DieW9C2dPKxA8VjQKcWjlQyd3p28iUFBtVlm/ZmTtgHCNYRdA7Q7Pi8y6gt0W2uOqmfBg
 HLoFXlv+ydOCoW1lqNw==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b002aeb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=SZqhrWYoK4F_mH7x4yMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: XXHlp_oG0SAnHu9r-aoqpNG245RN6JJo
X-Proofpoint-GUID: XXHlp_oG0SAnHu9r-aoqpNG245RN6JJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

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
index 482369f5fe037d52f8081b7e847f64df50f339e1..fa7a972ef94cf36ad25cd7f3300187f00c45599f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -261,25 +261,26 @@ static void iris_hfi_queue_deinit(struct iris_iface_q_info *iface_q)
 
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
@@ -307,6 +308,7 @@ int iris_hfi_queues_init(struct iris_core *core)
 
 void iris_hfi_queues_deinit(struct iris_core *core)
 {
+	struct device *dev = core->np_dev ? core->np_dev : core->dev;
 	u32 queue_size;
 
 	if (!core->iface_q_table_vaddr)
@@ -316,7 +318,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
 	iris_hfi_queue_deinit(&core->message_queue);
 	iris_hfi_queue_deinit(&core->command_queue);
 
-	dma_free_attrs(core->dev, SFR_SIZE, core->sfr_vaddr,
+	dma_free_attrs(dev, SFR_SIZE, core->sfr_vaddr,
 		       core->sfr_daddr, DMA_ATTR_WRITE_COMBINE);
 
 	core->sfr_vaddr = NULL;
@@ -325,7 +327,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
 	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
 		(IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ), SZ_4K);
 
-	dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
+	dma_free_attrs(dev, queue_size, core->iface_q_table_vaddr,
 		       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 
 	core->iface_q_table_vaddr = NULL;
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 883ef7e752915243e6a2cbf0b459cc83762f4c5a..6a87f8eecdd1fe17525e5ce8484794909b89624b 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -12,6 +12,7 @@
 #include <linux/reset.h>
 
 #include "iris_core.h"
+#include "iris_instance.h"
 #include "iris_resources.h"
 
 #define BW_THRESHOLD 50000
@@ -140,3 +141,43 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
 
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
+	case BUF_SCRATCH_1:
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
index 19d1583c20a738fe5a26bbbb2754a9155dbc4ffc..0d673139a75682db81efb50aab6466eb9a1d1552 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -129,7 +129,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct iris_buffer);
 	src_vq->min_reqbufs_allocation = MIN_BUFFERS;
-	src_vq->dev = inst->core->dev;
+	src_vq->dev = iris_get_cb_dev(inst, BUF_INPUT);
 	src_vq->lock = &inst->ctx_q_lock;
 	ret = vb2_queue_init(src_vq);
 	if (ret)
@@ -143,7 +143,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
 	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
-	dst_vq->dev = inst->core->dev;
+	dst_vq->dev = iris_get_cb_dev(inst, BUF_OUTPUT);
 	dst_vq->lock = &inst->ctx_q_lock;
 
 	return vb2_queue_init(dst_vq);

-- 
2.34.1

