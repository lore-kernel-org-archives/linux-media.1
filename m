Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160564;
	b=wzKXr21Bl3aOIbM7pkj7RPxy2dsqnZE9wtf5li5VFixTOZ7evdSpG0tarpuK/GfEJ6wl
	 b0n4H9Qi/quaA9gy6EVh0lggtOmqH8SVnsFng41l1ICVYy1XTssOGhkWG+CugJKBAJxKs
	 EsXvHYMG5jPRwgylqQrUUH4U8GZ6RN1FbAt57nENHjnB4s0PpE4twAZEeEh1ZReouHhyo
	 6+eLmYTnKsEZ0F6ZZCfjjhAFSJUyfGrO/Gk5gjeM8IiiEAthAU0CUBPVMlpcP1uHUI3ys
	 frl019MBnlWzOOn+EYx6AlsIdLTjR4YgRmEy9jt9hx2TTTfWri8wEx9RC/4pggGOrbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160564;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bO+5h3pUzT673sUfWD3vvl2mmFCi713KGxBpQv+PfLY=;
	b=Jq9p4IjiZ2O9bdQkxTD/RYTW7NOepRDINSwi70jMIrZsG9MBXPgohhEudSN8kpv24LdF
	 HAFgrogD2ZLGLNK85UcY/S5KO5ldkjro+VGJKaZSqbI72ZZFaIvYg0HMrFj55fG9XkVP8
	 THrdcAOKies97CR7gMUYwNKaNbwb2Pc++cn7l8RQfac8a12+vNcg44BFdeHyeE9jX0YAv
	 hhmXnUMiF1qXrHWt9YjxxPUBk57udJBhwa9RXJ2D/M1uxy97rY2s1DhHv5TIwIh+Ird6Z
	 c6qkIVaQLGp165V6DUFwXwrjM5fCTj14OroYbLiMeTPuMAB1nrNMAdEH0a6sfthfvkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZOKkY3Lm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PuKRBhf1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC6F606A338
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 07:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC6F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZOKkY3Lm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PuKRBhf1
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f2TU1112288
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 07:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bO+5h3pUzT673sUfWD3vvl2mmFCi713KGxBpQv+PfLY=; b=ZOKkY3Lmuvuh3l+q
	QrrfMDRXVpC0S5qy2ISqd1b9utqshfALMzxu797Gcq3E/dViOCY0nZCFloKsz5zd
	oaxZuLGVJRyXtVzjUduVtXZ+vhqTgHG8AXiv1Npp5z4Wod/Vk96vgqIlnLdyGbnG
	IvQlR+3jAhxj2azbIuY1CU/2v2lKUvGQHqe7iBAnZVijR6Xm5HpAByiDWhP3ScAK
	IDwpuIX9G9T+OQrS5RZkAbCy3TcdXvrKSG+LvqVQy+KUr29b92cZaJcNAwnzAJBJ
	lYLRMq+3nbJ9CnzzUa94xGdr+t7Cv7nO9z3we5zj9O0PjD7my4QALTu6UeVMoo29
	Dowwiw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtrn11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 07:42:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b4232374d6so728451a91.2
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 23:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795160561; x=1795765361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bO+5h3pUzT673sUfWD3vvl2mmFCi713KGxBpQv+PfLY=;
        b=PuKRBhf1gxRRIvXLs3R/9XzDMdFvyrJ0yX/OpZF02cmQAlATE3H8GTbXlzee6o8jvG
         tOYSgAaDWa8BOTgjmGNcc7ADAGfK+VFGsOAbDlVLq2KQn3XrryB2qGoJxeRTA+CYBMmQ
         oZMaOkBJ3NotmKw2sVoTcIQ29wpI9cTjmDeZMVB667uTCazlLFhpYai9bXJJ26b3PCwv
         i4F6m00cYHpiN92T9nP+7Byks0K3MZvYGO51qyddXtCVCfhaXNHrNNPI2ussNLsj9KPe
         G8yVReqIC3HVplRmo5jkW3/ZjnJYUswUSgb0EMxpPytwWiJd+SiFn8zA1KR7lVb0gtoU
         0ayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160561; x=1795765361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bO+5h3pUzT673sUfWD3vvl2mmFCi713KGxBpQv+PfLY=;
        b=ZLw8/Fkq1lkPhAPIqJZZgJAFbCebTyQPW6kQ8zUUmc4l+jbtAwwIWB2j8udaZuoLDH
         iuDjmDqIh2S+nVnQeb2KTFkuKYnUkhJMq5iPf1tXbi1a1Md/bD1x4VTgnknzmHfx2+Jv
         Iowu5Me4kCMmDf9zITb37t6+NRWz/zCGbv85J0ZppBPArKbt6CURnXmxODWUPvBtoAtu
         fdCNAMZcTJBzxj3+nwNnvfg3OlTYXBKq37zSuQHqv4xH4ahyGHBcaPVhS0lDtUktQbUu
         WCE0Xa86Oi7Kiq35Ic9zzp/JNSnDSPYLCK67Joof9rRs8MJCRHI2vn/04aY2AyqbjHrr
         dxeg==
X-Forwarded-Encrypted: i=1; AL+hErFAgQguqYXBPZM3J6TQ55yEHzAl2ppJtKcGwGl/TYOor9GFFXlZhrkhMjLRiFsal4Bn2YklCAtzIgXLkg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9RB3bQ2hJaMPms9mNV7b0rq9bINz5B9lW7VEZWf/TwIhrlSogJ
	oXLTLojLahs2ks7XfEKgWceq44DgcmicpQGDfmHFUySKxu/3TSakvwcij7dOyJtPZ9fzURzDsnh
	IL8NMrBzYPEjOw6zxtbQFJND9vBfou70O8SvONnvs9Mic0pwmhYtVDr7xYa+PXo1Dgg==
X-Gm-Gg: AZFdTZc7I0c43YNBYnSjjZrhAYnao34RMGJGbdTPo5krNIQMhsDZHd9k9KxwJOpjiN7
	Ww12MRHRKiN7auNeIAEDVAOE/DGmdFTv8JGao2vddoQEUGkBPjOXiiQz3vhNPmKZMdFXVYOFtUI
	/EqOX1vT2QGNR2huOgg7Glj1P8KkVyfQTAnV+P0aQIP/TJ/yHvdQLB/03lNZzRGApv0suW0jHsx
	VrpvD/zsM6O68dE/veiUZmLNKJwkgMqFPFbXoqH3MHALPnwuu5HEUMdwwurxgYpufxfT4L6TpCM
	SAeEo7oQjMQQyYEzXNPEaO6JuAmS4AlcyhnmcLXF0HguHBEjWgqIZ/YTropJ9RE43V5XlXOizfp
	9OtatbiKoXtczz1wx8ImMPyxZSmAjSMFNy9SQJAENniZgFvgJ5d2go15jJRYGuTuj5oi0JsWYwK
	s+JvMt9wM=
X-Received: by 2002:a17:90b:4d10:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3b41c8d9bedmr2142749a91.23.1795160561378;
        Thu, 19 Nov 2026 23:42:41 -0800 (PST)
X-Received: by 2002:a17:90b:4d10:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3b41c8d9bedmr2142732a91.23.1795160560923;
        Thu, 19 Nov 2026 23:42:40 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4323bda5esm119935a91.3.2026.11.19.23.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:42:40 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:12:05 +0530
Subject: [PATCH v3 2/3] media: qcom: iris: Fix IRQ disable depth imbalance
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
Message-Id: <20261120-fix-disable-irq-safely-v3-2-82f9561394cb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795160546; l=5737;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=jL/rsl0+6+SlvQB04um7Rgb1J/JNey12+a0JxUfshMQ=;
 b=9Gd5QA3fMAPjPkZSlGleJ5TnURRs6HmmhJhNKK4xZ8y8IvhEq0ZFy3lZiyBv7kM4iDKrNsT2C
 SpdekXKgKh3CyhAqO23eYm6fgDbcXRKJbV5JyyqhylRM83aFAefUai/
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: MQZ3i8hRD1vgivjpaWqdcF_qCPyCEieI
X-Proofpoint-GUID: MQZ3i8hRD1vgivjpaWqdcF_qCPyCEieI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMCBTYWx0ZWRfX+Z8z44NSNd+s
 JDmqDs7qvfT7UgPEjUcaQpSWvU4/4bWU04eqarXUYHENEVaGi5a82aewfOHfaFFSbs0yxjyU6S3
 j/zjg1+gJ+f4oI2PnEEvoSeagrV+x2SJtAXHiLlWLQt3SKYP9UHPc0g0Aq20Hj4LJcx1pqq1+ZZ
 ccUgJlc/x5Uh/yP8WsT2QnkQksQiEdyWNnrKelFDtBKJjOLhN2i2LRz40jPOUbo++fvhr54fStp
 JVsr0Px39oBH0XHmKpW8oOHRJRS1zlwnUO/y8bUCZBZKzrmZcg+JD3UVrWcOV9JkOHEwL/EjlUb
 Sjjrl6T4eYNrvhrgqHHhu8fnNhmIK3mQITI4qjDsjrpultyFrgG0NOcPm/jE7j/avHcmqmdQ9XW
 JztAw9DXkoZ041zIPeElUVcoEPKuYuIXt84V4BsQOPep7TTFgVYGwQdz2IfCQmP6NcYdQFzg7b3
 JXuhR4yiKkK08KFbAPg==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6afff9f2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kDI4m3mkCzHl_6bmBGsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMCBTYWx0ZWRfX4pCDgWEV7SeN
 fGVVRs3HuHUd5NGEBYJlaw2NRJkZgUzwPPzi/DvmsR3OpbDImSa3Frjkr+sTa7yAp2tbsVcXMIP
 ULvLafJoRW2eYwkGdiA2uvkQji1+pcA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200030

The hard IRQ handler disables the IRQ for every interrupt, and the
threaded handler re-enables it for non-watchdog interrupts. This
duplicates the masking and unmasking provided by IRQF_ONESHOT.

If power-off runs after the hard handler disables the IRQ but before
the threaded handler updates core->intr_status, and the stale status
indicates a non-watchdog interrupt, power-off disables the IRQ again.
The watchdog handler does not re-enable the IRQ, so the two disables
are not balanced by the single enable in power-on.

Request the IRQ with IRQF_ONESHOT and remove the hard IRQ handler.
Explicitly disable the IRQ in the threaded handler for watchdog
interrupts to prevent repeated triggering. Power-off always disables
the IRQ once, and power-on balances that disable and any additional
watchdog disable.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h       |  2 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 14 ++++----------
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 -
 drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++--
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  7 +++++--
 5 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 3e4cf652bf39..468ccb551ec3 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -70,6 +70,7 @@ struct qcom_ubwc_cfg_data;
  * @message_queue: shared interface queue to receive responses from firmware
  * @debug_queue: shared interface queue to receive debug info from firmware
  * @lock: a lock for this strucure
+ * @wdt_irq_disabled: IRQ was disabled by the handler on a watchdog interrupt
  * @response_packet: a pointer to response packet from fw to driver
  * @header_id: id of packet header
  * @packet_id: id of packet
@@ -116,6 +117,7 @@ struct iris_core {
 	struct iris_iface_q_info		message_queue;
 	struct iris_iface_q_info		debug_queue;
 	struct mutex				lock; /* lock for core related operations */
+	bool					wdt_irq_disabled;
 	u8					*response_packet;
 	u32					header_id;
 	u32					packet_id;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index dad906d03fdc..a27c543e75bc 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -90,13 +90,6 @@ int iris_hfi_core_init(struct iris_core *core)
 	return hfi_ops->sys_interframe_powercollapse(core);
 }
 
-irqreturn_t iris_hfi_isr(int irq, void *data)
-{
-	disable_irq_nosync(irq);
-
-	return IRQ_WAKE_THREAD;
-}
-
 irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 {
 	struct iris_core *core = data;
@@ -107,14 +100,15 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 	mutex_lock(&core->lock);
 	pm_runtime_mark_last_busy(core->dev);
 	iris_vpu_clear_interrupt(core);
+	if (iris_vpu_watchdog(core, core->intr_status)) {
+		disable_irq_nosync(irq);
+		core->wdt_irq_disabled = true;
+	}
 	mutex_unlock(&core->lock);
 
 	if (core->hfi_sys_ops)
 		core->hfi_sys_ops->sys_hfi_response_handler(core);
 
-	if (!iris_vpu_watchdog(core, core->intr_status))
-		enable_irq(irq);
-
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 16099f9a25b6..366c9b81675c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -157,7 +157,6 @@ int iris_hfi_core_init(struct iris_core *core);
 int iris_hfi_pm_suspend(struct iris_core *core);
 int iris_hfi_pm_resume(struct iris_core *core);
 
-irqreturn_t iris_hfi_isr(int irq, void *data);
 irqreturn_t iris_hfi_isr_handler(int irq, void *data);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 343e44c6b9c4..cecd2282e29c 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -311,9 +311,10 @@ static int iris_probe(struct platform_device *pdev)
 	if (IS_ERR(core->ubwc_cfg))
 		return PTR_ERR(core->ubwc_cfg);
 
-	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
+	ret = devm_request_threaded_irq(core->dev, core->irq, NULL,
 					iris_hfi_isr_handler,
-					IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
+					IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN |
+					IRQF_ONESHOT,
 					"iris", core);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 1e183fc4e58c..54ee7a671ef8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -239,8 +239,7 @@ void iris_vpu_power_off(struct iris_core *core)
 	core->iris_platform_data->vpu_ops->power_off_controller(core);
 	iris_unset_icc_bw(core);
 
-	if (!iris_vpu_watchdog(core, core->intr_status))
-		disable_irq_nosync(core->irq);
+	disable_irq_nosync(core->irq);
 }
 
 int iris_vpu_power_on_controller(struct iris_core *core)
@@ -521,6 +520,10 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	core->iris_platform_data->vpu_ops->interrupt_init(core);
 	core->intr_status = 0;
+	if (core->wdt_irq_disabled) {
+		core->wdt_irq_disabled = false;
+		enable_irq(core->irq);
+	}
 	enable_irq(core->irq);
 
 	return 0;

-- 
2.34.1

