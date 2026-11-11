Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387974;
	b=wJt8AOlpZzZDw9LZmhdNdGhppClM8tf2ljPbMqD5pniD5vWl4Q49JBPC8Ct6vYJR64cw
	 J23QYIuPXz9jumB1d8xRvrgdVB1DnHf11u3YSmiZa28lt12OJ8FRPKSa+Qp+gnnd3UMoV
	 dPpWYLpfcn0sP5hutJpY0ua0wXrAQRf5IZ8mUECAXHJqODvKDf2FZbqcLRxFuX1OxAeh8
	 NBxV9aNkcXWbB88KWIa/csmkclBcqBIhy5+V+Nyln8E6eTm0+RQyQDLBsiQ3GMwF8pRxJ
	 Q+NgmydqoU9VChW2m5h4rt5kf3S6GVeRBs6Qqv/CIyUVa6hn2ERz1JVacDN6WyUVikA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387974;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jJ1JsynB2e3MSVjtmDprF6rlf5Tt+xzmdqIVfoB7kqw=;
	b=4j7SCtDxLLV5DKTvRf8ueetr6YPWNSRbun8HcOTwbHkiGasrNi6QsUcf6ZJlSJir1DQF
	 ep6dHrJf0GABZOWXWz6godZATo9/FooIMC9UxClD34ZrfE5ZjJ362HfKzNuwmWVjnf2Vg
	 ciTAV3rqzx1TfE+T/B+jDTGeE6lObK1PBd90V+EPwb69Uh2xyZIJDaf2LzG9dv7qGLX8G
	 zAE0S7VBGMZGjM+h9BToM2wQ2fUuialvUbbaCnZL1chaD5a2gZiTAR5Q392IqSFH2dLsG
	 hHgFlAv9JUVRI/vn1kx3kQPbLUu5JixPSRdE9XDkIuOntxO/3iCCkhPnujDZhLMAgAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XihccjtE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adj0M2qh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6658C606A332
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 09:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6658C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XihccjtE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adj0M2qh
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5Khc9300734
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 09:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jJ1JsynB2e3MSVjtmDprF6rlf5Tt+xzmdqIVfoB7kqw=; b=XihccjtEIN4XtxKD
	vRMPl+urY7YMWjchT//9LjOj3TLDp6PLFq0YFha1dzaWMPFP9CRiyRDgtpd/gAnB
	1GLPru7S83xGrutuFDuVy8hCC+pfCWpxj7oNTkbQFxVT7ZqrbtL16PemAk/htuOl
	nNx8wKWwaren12IBtH0zD70Vwa9IotEFHctnKf2DEunE6KlM9bxGqiTj9dL+KBUv
	xiv18RWaI6hbmZ1Yvzg3x6w+htZfl31HMIo0BMb0V66EsOxoGTrP8NOwQ6l1KL5N
	1WWk489iMkHxik0aIq9dgW97tGqoukzwnRMpetLtX6s2SvGGMPmnmAGZ3bTM5s+x
	+6SUmw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5kewb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 09:06:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5901571eec.1
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 01:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794387972; x=1794992772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jJ1JsynB2e3MSVjtmDprF6rlf5Tt+xzmdqIVfoB7kqw=;
        b=adj0M2qhmEUYtVevODaBhqBffFSEcvVPJzlbMmwWTRl+SbMDG7T0eaYwZTVxf5vzET
         8UfccmIoDM5BG9CwlWTCZBUGKB3iauGk+rCqAwC53DQH70pmBVNwesZn9fksj11ftM//
         kOGF3YtgI+LhgF5Y2/B+ZCIdHoHpAaPLybKAQO3OAQucGA3HRlx4lTdTOBmqmvize6sG
         /cB59DyEY9MoDXX2fYIDSju1Nr9IMmypXl6Uaw2q/kN5IfI8ugxxTrzib8jgQ0u3hOUO
         BKuJcZKIfGjacs+NlA9UiyU5Pkw/T9oSIw2BlTUMrhKUnPKA7z/TpqD+qqbxC12zVgH3
         9CDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387972; x=1794992772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJ1JsynB2e3MSVjtmDprF6rlf5Tt+xzmdqIVfoB7kqw=;
        b=fOM3L+gjj7E6zQFy0DRMXnkETWsPMaDz2Ny2xIacLpTnEaRXrEMVh8xUmUvornymwu
         laU+1h1CpQIWr2nzNVnEjDStciTBvBVgYMTmITHjwVKpcYrcVawQTA6Awb/dSMX7dYrE
         0enfTpNryPnoQPcnyN0CdIGI1WXBtfUCqDYc0Hi7/oHxBoeZIiEf1T0gRATh21D6K28f
         qpV6TIw+qmvW9LO07fxRIlPH4W3O4zLNGWIs1r6xG23GWy38GcZgBthZTOHz6M+FSpsC
         muAPuqFsRvRVkzI4D5wxPJeEHpSTxzIi0/w5pS7p4Xn92UaVyQ5vAMg2hhrDgjxcWpKo
         wy2g==
X-Forwarded-Encrypted: i=1; AL+hErGA/FnA4GZ4Vr3tdwONFfmD7EHh0u9Pef0cdUlA9wlgSBtv7MTQ1TM0Kp/c2hvEHPJxCa5rvkzIcLOp/A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9bqngLf0ebtWGEsLNXRp2aQ3DxAlWFBpK5I8xkjD0gztJadFej
	tj80+KADOAtfGDWZkdITtqkBi++WWIDZP/BrB7ZRM48wtCcf8+0prlzjpwI90YoUtOqGuzETQiw
	wSzoT4wXTrWceVcxMUAO4v+i3dTf9RdL3uXQwMAK7fJbRhXLipAIg7f5o2f/hcA13ag==
X-Gm-Gg: AYBFou2RRQTPZaeEUJrHnDY5usADEF1358MLGrKN7Q78Qy6fzeRFk2AlQhwC9GeXtmb
	E2In5m7jnEIY3yjFo890evQW34ghdYYIF3nhPLsMjTbT51Z8lF51jJKUI7i2CVMJOvLVCAngP6o
	7I1IIG+8/yHEey0tkXc0B2RO4x3omRuTyGv2kEAlmszzOceKfXat04ZrJsgKUBIFE6q43ctNvLX
	hKZr+afAdUxOj3LWcWrkHmXwCHR5F4gmy1AOM+7eyyMEJKxLffvRN/LFlUjLcr/Nd3lNY/mpALH
	heTvf4yWOeW73qcuNbe89wNIIZPzkoBHAKyTb6tiELK0y2eie3cFwmFN8trj6oZWnNeDXCR8bMj
	P/xiEk6I6i8AQQhI6hAOQjZ0uAekKkmqG4MMeU23NbYtSa0+UtMuSEfKHTb9io9ywaDGe4LMl99
	292D9vUw==
X-Received: by 2002:a05:7022:3c81:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1b3c03804e0mr1486656c88.47.1794387971729;
        Wed, 11 Nov 2026 01:06:11 -0800 (PST)
X-Received: by 2002:a05:7022:3c81:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1b3c03804e0mr1486634c88.47.1794387970925;
        Wed, 11 Nov 2026 01:06:10 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2ff3bsm16915277c88.11.2026.11.11.01.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:06:10 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:35:16 +0530
Subject: [PATCH v2 3/3] media: qcom: iris: Fix IRQ disable depth imbalance
 on watchdog interrupt
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
Message-Id: <20261111-fix-disable-irq-safely-v2-3-8e13f68c2ef9@oss.qualcomm.com>
References: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
In-Reply-To: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794387948; l=4319;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Pn+BycdBF2lPz8nDDl76Efbp4QHBy13sSbzbrGaycsQ=;
 b=L+P6AIaTos40tTr5PAhIMgkr6l6HSfbthXp0pc4dep8UZVV4lNLPCMS2Q1qSUDYztGXT8bSj0
 sY901x5DMTbBKhC+8JpiO4BMQ8WKUvECnND6WIZVlLWMhHBLmioyFMY
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfXyu2dY94cao1g
 /qKkWcOkD5iR0L7SoFTSU/SZciTzM4N2CWL1mcJ6b8EnbeFyclGUDVLagDOjfw+2eD8DpodL0k1
 MUaRN3EUF1gq4xTsEXFhFEqOtpsWfG0o1GroJlLh2bwi4EGudrw/m1Xdh9If3o1l29pxPf1rGkm
 8YHIbvqaDSj6tGabFQ1G4GpHJ7YjufxTcWAMcz4M9Lve6WOxs5IciExMZcunx+77AI0e6yMq9Xq
 1lstzkfU3SBvzJoUbfjOdtPns5ikorR04L5VhCxIXiBmrVKgByXVm1IPgyyO840D61UrRiRR/Zx
 TUKm14hZVm/Fp0SBSa3AtIMyJhxRf8RbCUN6qKishVZl8uTtkSr2kPQ/k8oEQ2TQjhGcQQ8QcSH
 TdJ5aZO1+EUj2E8RZ+kwVPtseI0/j2GAfY5h2niudHwm+zn2527sk/O5pJLQJAZS9bLBc2qUhwc
 W9w7A3XIsEH8JDWBYxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfXwql5I3DzEary
 D4u2n+O6qE0RYIZrNSlItVymKgWevU0S+5qGCgboAOKEd5FwoJiI+CivYicK29aonSs3Tg2o0GN
 F9OBTOXNM40a+f/HtxErEYG31hBKcnc=
X-Proofpoint-ORIG-GUID: mIFN2AmYSbtW4Kw4cil4b4VrjRRECfuS
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af43005 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Np8CHIPbezt7dn0wI3IA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: mIFN2AmYSbtW4Kw4cil4b4VrjRRECfuS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110036

iris_hfi_isr() disables the IRQ for every interrupt and the threaded
handler enables it again, except for a watchdog interrupt, which is left
masked until the firmware is reset. iris_vpu_power_off() decides whether
to add its own disable from core->intr_status, but that is only updated
by the threaded handler. If a watchdog interrupt is still pending when
power-off checks it, power-off adds a disable and the handler then skips
its enable, leaving the depth one higher than the single enable_irq() in
iris_vpu_power_on() can undo. The IRQ then stays disabled after the
reset and the firmware can no longer be reached.

Make the depth independent of when intr_status is read. Power-off now
always takes one disable, paired with the enable in power-on. The
threaded handler evaluates the watchdog status once under core->lock and
sets core->wdt_irq_enable_pending when it skips its enable. Power-on
drops that extra disable together with its own.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h       | 2 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 6 +++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 7 +++++--
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 0b1b9721e6f9..1909b91deab7 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -73,6 +73,7 @@ struct qcom_ubwc_cfg_data;
  * @lock: a lock for this strucure
  * @irq_disabling: flag to indicate an IRQ-disable is in-progress
  * @irq_disable_waitqueue: waitqueue to wait for the IRQ-disable to complete
+ * @wdt_irq_enable_pending: enable_irq skipped on wdt in isr, done on power-on
  * @response_packet: a pointer to response packet from fw to driver
  * @header_id: id of packet header
  * @packet_id: id of packet
@@ -121,6 +122,7 @@ struct iris_core {
 	struct mutex				lock; /* lock for core related operations */
 	bool					irq_disabling;
 	wait_queue_head_t			irq_disable_waitqueue;
+	bool					wdt_irq_enable_pending;
 	u8					*response_packet;
 	u32					header_id;
 	u32					packet_id;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index dad906d03fdc..7a2969579697 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -100,6 +100,7 @@ irqreturn_t iris_hfi_isr(int irq, void *data)
 irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 {
 	struct iris_core *core = data;
+	int wdt_irq;
 
 	if (!core)
 		return IRQ_NONE;
@@ -107,12 +108,15 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 	mutex_lock(&core->lock);
 	pm_runtime_mark_last_busy(core->dev);
 	iris_vpu_clear_interrupt(core);
+	wdt_irq = iris_vpu_watchdog(core, core->intr_status);
+	if (wdt_irq)
+		core->wdt_irq_enable_pending = true;
 	mutex_unlock(&core->lock);
 
 	if (core->hfi_sys_ops)
 		core->hfi_sys_ops->sys_hfi_response_handler(core);
 
-	if (!iris_vpu_watchdog(core, core->intr_status))
+	if (!wdt_irq)
 		enable_irq(irq);
 
 	return IRQ_HANDLED;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index fcf060a72c4c..0ce5094c0bb9 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -244,8 +244,7 @@ static void iris_vpu_disable_irq(struct iris_core *core)
 
 void iris_vpu_power_off(struct iris_core *core)
 {
-	if (!iris_vpu_watchdog(core, core->intr_status))
-		iris_vpu_disable_irq(core);
+	iris_vpu_disable_irq(core);
 
 	iris_opp_set_rate(core->dev, 0);
 	core->iris_platform_data->vpu_ops->power_off_hw(core);
@@ -531,6 +530,10 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	core->iris_platform_data->vpu_ops->interrupt_init(core);
 	core->intr_status = 0;
+	if (core->wdt_irq_enable_pending) {
+		core->wdt_irq_enable_pending = false;
+		enable_irq(core->irq);
+	}
 	enable_irq(core->irq);
 
 	return 0;

-- 
2.34.1

