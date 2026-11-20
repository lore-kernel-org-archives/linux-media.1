Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160569;
	b=epcEvR7FlA4oRXtPZmfLM83t2kGymLQMRi5Vunls+c3fkIUYKmH/0Vruo7uVaqWTQbYd
	 RDVhyHFWI5auoe7sUZAOeSegnDpl+XLwtDti9dmajZRKj9RfhpUcupxJ6PH2H+W4eWdbD
	 vM6BYpWXVb4CiV1obtEcqkAcHtd+4tSp0BjgPGm6eHKKNB1KuRjSZ55AgMhoopdFbD2Ql
	 x50gHyvwmiSmzFNMqtXNOzWtIhYgipavtZGD9hM5vGPtTuZVM39CZi8Ub7qiK+N87l41I
	 X+CYhKQ8U4Kd4FGpcj5LfCu4yc+D767+kMT5hQhc6CeTOEfGl34epfMFrojkglsr3DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3P3TooIy4YwC/bRKTvp92lrYDHs8AxA9i4f4CNemL4U=;
	b=YTGbxBzJvrG2LXB2x+nT122+wcpnXAgK3enVNyfJ7VARVZI7J3wK5pa9eNjHNMsztGEe
	 7T16TnGHGqApmAG4gtD+11VZp87ZuIDosTo3xoDaCMSfZV9Yo8JggXHl5JR3QtFZ7Nd+u
	 Byuqm/WvtajlPEf0IzLGcKWYmeM94S63W2GeRIqKsRHzTtnmnu8K+TyN6kn/mcgB5R03D
	 MpkpqRPpaKICLRR03zJcpAE8q+5VN6IC8re3XWy30rasn9emRNoQpEfuSvZmyTVlG/4rD
	 VTwMM2X/5zcqUhKMuAN7kosSTgI2BTq1SA2Eqe6iHIAlQt+ivz17pfPNwAz8O4Jc1YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pEPfKawD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Zn/CSdY2";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8488A60A262A
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 07:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8488A60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pEPfKawD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zn/CSdY2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fFPR3320756
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 07:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3P3TooIy4YwC/bRKTvp92lrYDHs8AxA9i4f4CNemL4U=; b=pEPfKawDG7fq90N5
	w4DnlJwKZNzf1oYKZLvKfZ/69TrOVh6/aOzyDAjfQUEBzh8TVC5ZRWXArcQgeNWf
	ay1JAWa4NhxqcoVzbGCK4DauWnh5ELVyzCB894yA5hjX9OE0jZtllYTTTmlu9KkC
	cZ5hEtKbBPknbi+6NmybKtXtQiGm4w1fhYcYG+STBj/2OvmCx8QycmnLKB8ovWLt
	KEdozHda5nRFd43Z+U9ycfFAIUctnfS/JrfupL8J9vcGIbbhbBFfoqGJ0vsxnmec
	LoboY6I/HW3ZjFkTCnWE5y7A3Iqm9GTaBK38cvuj1ydFjwqPsfYAXxsiJXUY7aUR
	J2+slw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2frhrm1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 07:42:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b4139b7abcso792928a91.3
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 23:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795160566; x=1795765366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3P3TooIy4YwC/bRKTvp92lrYDHs8AxA9i4f4CNemL4U=;
        b=Zn/CSdY2rRD33exT2i0GuJ9euLTlMZEheBzHzR2kK3wLzDcYYHc5i2my6fX5lnAINH
         o8Q+GztoHnTAFPBEkTp4Uyy5ySxf/dXLaraSefET1WHNw/XMUbQfB/118hUr+FJFeftj
         28hvJxwfp310QBVlWnsGFlUKOHaIegijB11RzhomayOl2ctAvzS91Yx+YKm3FkcKLZ+Z
         8FBISkCbrDMpfo6CbGxiNiqZx7BlkGZHvNKzJuzGr2Tz1PSCsUihVamycPNf0GqhgFn5
         qyTtrDWp6HfiUXhZQWUAdCLgemBFHGmO0dVxqL3Fq6IHgQMCSXfoPkIx4nfY6U3LrBlp
         6VDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160566; x=1795765366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3P3TooIy4YwC/bRKTvp92lrYDHs8AxA9i4f4CNemL4U=;
        b=X1H5IVW9xOr9NRKkaOeoM/mMGLMMZJ8btYrGHRzfwhSKzB+p4mYOGaontrJGCpQu+q
         mz9ymGFVFL2siLLvge5t9N9+bTSsP4GAXFYksN7RU8wsIMUhrOFqEhFnnn5B3tOil1Kj
         OXbUgpRELrOPT3Namn7Ur2sWS3bspIb1hSFWuSCRMACmHIQioJQpaNu+cXYwMXMs/yiT
         4jQrXt6jy85zcnC89HWmtPL0Uym5fbGLwnzVJp5PqKUuFUNOFAR+2GMo3AYY9UL4kka2
         VOuAeshgCcD3C09HokWwjSLQYhBVCZybBfkrHz9tsuxFhgBY+QaxDaVwb0SknmjS0n4W
         sFcA==
X-Forwarded-Encrypted: i=1; AL+hErEY7upLcFAdVFg6zFL4a8VYmCeaOdf//IQd87OP6cJFHK9Cmmd1qfMrRNLpkZyMuOwq8Wq466QogWlMuQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+yIM5cYiAW+4OYmUOczrvo/usMsI0y6rvSq9UhPl1NBh1gBnWA
	8hvKjN4d3s/zoTvLNTMQwZEtauPQUgVeA7gJuB4bOWYxhZEf0U3V+g819TGnBxvbbbA4GpUA2NK
	zGF0ps6fmBYJIA7EwowAM7l05LjSOiBu+/bKzsjOWM0g9Y5Ps+1QLDsD6E6nMmVfQ6w==
X-Gm-Gg: AZFdTZfAISG2kqzpFgFjrOTmsvkKXiVMrR23dAOvYOkKAGTp3jAza4lHPxCawndHxiS
	PThpS/Gfiq89ot9G3eMBBldGdt9jmL0mjMwDPEqvNdiX2EaW5zXbTCv7sp/AJlAVxx5Cd/nc+q4
	712RJQ4W/I+KQf5wdKphHNSWo6ZwZ6QgpNa/fAbzY2spt0BLOF+Bhp06sjDKmOMK0WatvjuUatk
	kMZpLKcvklt2WIFf3zlHzNkjTxEJZ28ThRxZvF4Jtd5cdjPHmDQPWOZKGao1gjOKJ/dzg6V5gFG
	bqoOTrR3f0jah5y+xNG3e9/PyT+VCjLwJUXZpgqlh1Sq3iew54L4PxreaTz4GhIw7nLw5g5Rzxp
	0sQpz9BMUc0RgLz09ugOiCpwFWZAU98W23sNY8sFrvION++mwoLQwOH4IxfrfX6ZwxgerAMFx1v
	NokhTn2CE=
X-Received: by 2002:a17:90b:4a48:b0:3b3:c675:d923 with SMTP id 98e67ed59e1d1-3b41c908109mr1955447a91.28.1795160566274;
        Thu, 19 Nov 2026 23:42:46 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b3:c675:d923 with SMTP id 98e67ed59e1d1-3b41c908109mr1955410a91.28.1795160565766;
        Thu, 19 Nov 2026 23:42:45 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4323bda5esm119935a91.3.2026.11.19.23.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:42:45 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:12:06 +0530
Subject: [PATCH v3 3/3] media: qcom: iris: Skip register access in IRQ
 handler after power-off
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
Message-Id: <20261120-fix-disable-irq-safely-v3-3-82f9561394cb@oss.qualcomm.com>
References: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
In-Reply-To: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795160546; l=3824;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=iXUOI58v6kMBfsFr8HiiRVJVTLJdxn/a84melQWTXhA=;
 b=HbLLiFbKrXMtrwVZkPPtoPJGi1LMi/4DLPd6HugzGcTU1AZORkd2TKLtQvMLMwjC4ObdWw4qU
 COXsa4UV4DbCZ7QTI/Q3LqUY5vFzGMdO2MBLa0j5zQI+pewmUnvLUyE
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMCBTYWx0ZWRfX6G1O2qnjJ/Oc
 JdW7iyaahUpqZq/0STpR607+0z1gBJCNanyQxrx2KDMZCslDJyJTXctCW0kojMbN/Mku/qWQAjo
 fJv1Qy6jVYIgv3RhpIfSNyfukDJWl7E=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6afff9f7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=acxGgeGPnh0hIPSWkr0A:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: eI7qvIg6x6kSg45S3vX9fCYHyYLV3mkp
X-Proofpoint-ORIG-GUID: eI7qvIg6x6kSg45S3vX9fCYHyYLV3mkp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMCBTYWx0ZWRfX8U/ESmBWSl5E
 9VimlC7kfPwHm4/f9djDMQPrDwrrE+ijvf5Sh0TuDAIaD0bcpoB5IwFfmiapiQzAINR3tKTOhYl
 8S74UvnMUWADniRrFJ9xyOZY1zjl2zfveZBxHKE+RFWQICVIom2rBX7kx7oOL8YjJRd09TMnLkU
 6+TMj63T9WV7JGJ9CrkKNEqloJYagdqt1Zh71k8E0fxGxEhN/nsb9bYWNwuLizuSnIQRZANgKso
 XrOPJRBJdUR7Mj2OGeUjDjTD0ftMJsdvc7s8R8NcmidnJweYCdY0pmNU+UF1HN6i2Zd2p7hB0cy
 lgFPoeUD5kJLP2vxcmo3FWA5Kmi93oGCci7Hi1rBWEjPmaExScDQzcf9tfIR6ucAOlIHrnHXBJt
 MNi2KVCoGbvp88T5cZ69JO8h8E5yRC0o1iJKv1NqKju2xRunN0spmE9tJ9HES3aVzbQBc/59eik
 QqjXn0fqxtdkiC2a1JA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200030

The threaded IRQ handler reads and clears the interrupt registers
under core->lock. Power-off disables the IRQ without waiting for a
queued handler. If the handler is woken and queued around the same
time power-off is entered, it runs after the VPU is powered down and
accesses the registers of powered-off hardware.

disable_irq() cannot be used to wait for the handler. The caller of
power-off holds core->lock and blocks in disable_irq() waiting for the
handler, while the handler blocks waiting for core->lock.

Track the power state in core->powered, which power-on and power-off
change under core->lock. The handler checks it after taking the lock
and returns without touching the hardware when the VPU is off.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h       | 2 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 468ccb551ec3..ca1a55bec334 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -70,6 +70,7 @@ struct qcom_ubwc_cfg_data;
  * @message_queue: shared interface queue to receive responses from firmware
  * @debug_queue: shared interface queue to receive debug info from firmware
  * @lock: a lock for this strucure
+ * @powered: VPU is powered on, protected by @lock
  * @wdt_irq_disabled: IRQ was disabled by the handler on a watchdog interrupt
  * @response_packet: a pointer to response packet from fw to driver
  * @header_id: id of packet header
@@ -117,6 +118,7 @@ struct iris_core {
 	struct iris_iface_q_info		message_queue;
 	struct iris_iface_q_info		debug_queue;
 	struct mutex				lock; /* lock for core related operations */
+	bool					powered;
 	bool					wdt_irq_disabled;
 	u8					*response_packet;
 	u32					header_id;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index a27c543e75bc..b7be3ccf499a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -98,6 +98,11 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 		return IRQ_NONE;
 
 	mutex_lock(&core->lock);
+	if (!core->powered) {
+		mutex_unlock(&core->lock);
+		goto exit;
+	}
+
 	pm_runtime_mark_last_busy(core->dev);
 	iris_vpu_clear_interrupt(core);
 	if (iris_vpu_watchdog(core, core->intr_status)) {
@@ -109,6 +114,7 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 	if (core->hfi_sys_ops)
 		core->hfi_sys_ops->sys_hfi_response_handler(core);
 
+exit:
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 54ee7a671ef8..73ac63376b91 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -234,6 +234,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 
 void iris_vpu_power_off(struct iris_core *core)
 {
+	core->powered = false;
 	iris_opp_set_rate(core->dev, 0);
 	core->iris_platform_data->vpu_ops->power_off_hw(core);
 	core->iris_platform_data->vpu_ops->power_off_controller(core);
@@ -520,6 +521,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	core->iris_platform_data->vpu_ops->interrupt_init(core);
 	core->intr_status = 0;
+	core->powered = true;
 	if (core->wdt_irq_disabled) {
 		core->wdt_irq_disabled = false;
 		enable_irq(core->irq);

-- 
2.34.1

