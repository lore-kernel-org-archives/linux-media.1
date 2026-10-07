Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCE8493623
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 11:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372724; cv=none; b=IzDuj22zjitomkafkLAn0CW0f2Mx1cmNHIOilqRZiMBV3DiWDPGgQHd0SUspvGZS88bvQ8X6QptHjfy0z3RSW9g0VjJkD/jwf8+ViVJeOAF7EQe5IzXaTUk61x/qeliPcGtMZeP+t/st+NF2teNxhQkUfzYQ0HbceyMgC+irVYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372724; c=relaxed/simple;
	bh=ZMiiaGyDYTCxz97Sz+PlnJpX40AY+IuV2cS3lwByG+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U6FZ7/kCnJpSUngw6arnL4f89qvDpRBlYoYBlc2yLb1B8qP+6moRC6rLMaQzAMceuem7emgL9PuH+YvWwpWSFIsNwCMMIwzMErwFzgL20dc57cfoLnGl8RBt0rCSuegzfBbAVhkMnZgfLnpCpPRyaNPSX8WscxRHf+cv0Wf6o0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JvyTIzPl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L2EZ3ARE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JvyTIzPl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L2EZ3ARE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV6Hx609831
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 11:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HmYaoe+lJGtCYKh/EC4wIHB7K0XcNmCPYjiXJ8nhW0A=; b=JvyTIzPlCDI4/IC0
	aSsOzIZCMmdbzM0M77i0zVmy3gmvNgfAB/594YXaRMzV+jmETQCWZY94EAMHC2dY
	ulTB2ESJ5d57i3zhFA0DedLCjlyPQbuoaIw9giokX6Lo4ohJcKNw+M80beFFR6E1
	TPBog61WSdSCxzI2Qpx4+ZpSOQk7yyrOBvbceBd4soP+ROhwJ1XaaC05ebDu5ujz
	IQK9tfomyc0gKSoFq5rOJpDTwriykwqIWejMZw6WL6NLcfN6Em7QCfeqrmTHj11o
	1inW6jE1SyRPFDxMk9PoketnvxqpPnBWyGeCyPZS8r4WKTUiU2eDpOFOt15C9VCI
	3DTDGA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc597bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 11:31:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2d4a8623bso38497515ad.1
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 04:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791372703; x=1791977503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmYaoe+lJGtCYKh/EC4wIHB7K0XcNmCPYjiXJ8nhW0A=;
        b=L2EZ3AREGZkA4Xzp2vQ0Y9QKdHnMk+RbOnQqsoOc448EMJ43CRdljbqOSawhav8PeJ
         V3zNDfSogeXRNayyociUn5WO2qr7wCD9kLGWsNk3BvymcopjS3aKNczKtefBnaWo8aie
         ki5InXgDOwko+jDgjbbpSQiVj+N19MXRqb+mtG8o3VqnuZdOmBSu4belJyiMdvvOD6Ac
         cbjD8LiA502Zsom3T1TGKTq82LxzWXj9WwXLuQDEkb3mfIa+YuJnsnjjKltgQvvuWlbD
         eVjzm/Pn+u0rh0CuGEz6exKdSfdRIJAkn+c1nirdRJcwYlcgJ3rWvVFwU1xdTKdeoqGL
         zWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372703; x=1791977503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmYaoe+lJGtCYKh/EC4wIHB7K0XcNmCPYjiXJ8nhW0A=;
        b=W7I6NrokH8/GaO2n/+Ny2AgUiWZpVvyom78Ypt+hEUqXRfscUl5RuwAYuYicNwbDDF
         33+BgQ2pzEbEONKOJkWz4Jm8famWkHMSuOPxN1fbwRhMHBQcft/m2yqdmIlCjSOkW5BG
         Iqm6EAMLDRpA2vn1zWKyvAoPAIBiOsmD9+om87yvIgnupfqG1rx3Ah1fro/ABK/BReV8
         nrfunzzbuG/Q4yn3obQuPoX5llzGYpjfy662++akhElsV78zaFi4hL/5T/MiMNlZfQfA
         BcEhgxPcofbdP3MfuSAYHwxhb/Ew2dgkN3Nr0VE/Ha/NsxRFGNZNyZdinhw0gw8mEIqT
         R6ww==
X-Forwarded-Encrypted: i=1; AKwUvBw4dRdicJLvIGz9KHTcyrXT8Ux84fWXIaWTMjBt16OOpyVvPda2D5dkYgL1/d6lj3ktBMVip4GD/1QImg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI7QJ2OtDQJbqWwZ6eR4xyEt0eNeFug33rHP8SyfW+PHmsSkiLQ
	9XOw6DteUfYDJ8+TNrsS3leIczdkh6kY/n01PygQT5PZ1KC1K1HQnvBj4R5YyVXMbOJFP+NYt9o
	89opkoYoquGpr7m4DB3x4kFRnmRdTLfVoP34iX/jZSpqgxC9GuHPnJpiVysyNgTK0TQ==
X-Gm-Gg: AYBFou063nE1FmJmIhI62LV4gJ2811Q/eSaiJYYo+E/wVPh5HBAeCxxRdO9yK9pLjag
	cGQn8mj0XjtjKKYsulEnep7q6fDPc0pKt8Rnu+8z6MOqR8KmDJNIakgnfrtcwyXrw5b95+kW2rm
	Ep14ohO/HK1OV8SDbYn5RKkNgEPJyGIkXykspg69p0SB75BRmHCoWXImBOfkNFQ4HRK6dzTht8f
	/TErpe+86a6twAUmCypNB6un77ol+Uw4HP4AvNehZQAgIVYF6fpWdisb4kEOBgp4pbTBk0ajQvq
	GRIsYISPeaymp7+OsHhy1mC4qczF+1HiainWjslqohYAq3BP+kULlE/2s827F8gB5GXizHMdol/
	aXpdjF1AQrz73hLPIAWYHuGn+/1cv6LNMmA==
X-Received: by 2002:a17:902:e74d:b0:2e6:13b1:e196 with SMTP id d9443c01a7336-2e613b1f621mr8732405ad.74.1791372702637;
        Wed, 07 Oct 2026 04:31:42 -0700 (PDT)
X-Received: by 2002:a17:902:e74d:b0:2e6:13b1:e196 with SMTP id d9443c01a7336-2e613b1f621mr8732155ad.74.1791372702041;
        Wed, 07 Oct 2026 04:31:42 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0d9sm8388515ad.20.2026.10.07.04.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:31:41 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 17:01:06 +0530
Subject: [PATCH 2/2] media: qcom: iris: Wait for threaded IRQ completion
 during power-off
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
References: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
In-Reply-To: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791372685; l=8327;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ZMiiaGyDYTCxz97Sz+PlnJpX40AY+IuV2cS3lwByG+o=;
 b=nS5ubLhwDSaEH3cKb1JICyOHeJzyDQQqyrYEnMmFlHEBsO+XsonEGwIZ6pWuu+uXDOlGArcWj
 liq3Uox8McTBxlhGheq2tsmrhsFLB9fwMwEA6vgDf9ZTSOv1yfWIR/S
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX691Iz8eYCbDn
 E0vrGLphtk5+rvYyR1GSliecOloIEPnpnFo9sk6fWeZzboy9285WeJhi4oFLg4YRuXrtlEcaIxm
 l4H+eX7Wnzz4CTV8Zpk7a8+r8j+lQrI=
X-Proofpoint-GUID: CD24dz3NJbzAadWa-_aoBdvAK1uhR7Ux
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX9sJzQrLKSa31
 Dg6DmRU8jgIRT9CjRT6fWc5W0f+IQtLdIJemUSTh/c+rmCyFSZXqRBiWoRK9VG7DdCMG1gT+0FF
 XrBGve+Hy5hcGHASXFQrGnFDtePHaUoQ01phf666L03PdlkU5GzkvVrp8scMFsWqhQqnbg22Xmf
 3N8npNtlojtw1M4PuCZZkbeIwZfZSl91mR6Ts/iiQ7oTzZZIb9JaC5nyGsSONV/7XTBdUbQCw1f
 8YQvENRBs/EPn8OQQ0uWkrm1FgNAJsgVW105TRdLo0QEsnFNVI14oxRrYShlCnFT0x1MeYrY76h
 5TqOtW6FWgFiK/iCVF0lLwmBK0rsJRLNA8WrLU3qvQMQtAMpoorvSXTnuZDZUtSs+DEMMxGYAzB
 R4rNgG/fIw62FM+VM7/GZv0iZRoILpVo9JFGqFiY9+vlmJYPQImSFOoHBwKhKLLcUe+L0GzuUDY
 pWR8TMZJliHWrjEnHvw==
X-Proofpoint-ORIG-GUID: CD24dz3NJbzAadWa-_aoBdvAK1uhR7Ux
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac62d9f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m_RbpQ2zxIAPIIsuggwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070045

The VPU power-off path calls disable_irq_nosync() after powering down the
hardware, allowing a pending threaded IRQ handler to access powered-off
hardware. Switch to disable_irq() so that any in-flight threaded IRQ
handler completes before power is removed.

However, disable_irq() waits for the threaded IRQ handler to complete,
while the handler requires core->lock to proceed. Since the caller of
iris_vpu_power_off() holds core->lock, calling disable_irq() directly can
deadlock if the IRQ handler is queued and waiting for the same lock.
Release core->lock before calling disable_irq() and reacquire it after the
handler completes. Introduce an irq_disabling flag and waitqueue to
serialize concurrent power management operations while the core->lock is
released.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       | 10 +++++-----
 drivers/media/platform/qcom/iris/iris_core.h       |  5 +++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  9 +++++----
 drivers/media/platform/qcom/iris/iris_resources.c  | 16 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |  2 ++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 +++++++++++++---
 6 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index d558475986ff0..f81fb6d42557d 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -17,7 +17,7 @@ void iris_core_deinit(struct iris_core *core)
 
 	ret = pm_runtime_resume_and_get(core->dev);
 
-	mutex_lock(&core->lock);
+	iris_acquire_core_lock(core);
 	if (core->state != IRIS_CORE_DEINIT) {
 		iris_fw_unload(core);
 
@@ -27,7 +27,7 @@ void iris_core_deinit(struct iris_core *core)
 		iris_hfi_queues_deinit(core);
 		core->state = IRIS_CORE_DEINIT;
 	}
-	mutex_unlock(&core->lock);
+	iris_release_core_lock(core);
 
 	if (!ret)
 		pm_runtime_put_sync(core->dev);
@@ -55,7 +55,7 @@ int iris_core_init(struct iris_core *core)
 	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	int ret;
 
-	mutex_lock(&core->lock);
+	iris_acquire_core_lock(core);
 	if (core->state == IRIS_CORE_INIT) {
 		ret = 0;
 		goto exit;
@@ -96,7 +96,7 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
-	mutex_unlock(&core->lock);
+	iris_release_core_lock(core);
 
 	return iris_wait_for_system_response(core);
 
@@ -109,7 +109,7 @@ int iris_core_init(struct iris_core *core)
 error:
 	core->state = IRIS_CORE_DEINIT;
 exit:
-	mutex_unlock(&core->lock);
+	iris_release_core_lock(core);
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 3e4cf652bf39a..0b1b9721e6f9a 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -10,6 +10,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/pm_domain.h>
 #include <media/v4l2-device.h>
+#include <linux/wait.h>
 
 #include "iris_hfi_common.h"
 #include "iris_hfi_queue.h"
@@ -70,6 +71,8 @@ struct qcom_ubwc_cfg_data;
  * @message_queue: shared interface queue to receive responses from firmware
  * @debug_queue: shared interface queue to receive debug info from firmware
  * @lock: a lock for this strucure
+ * @irq_disabling: flag to indicate an IRQ-disable is in-progress
+ * @irq_disable_waitqueue: waitqueue to wait for the IRQ-disable to complete
  * @response_packet: a pointer to response packet from fw to driver
  * @header_id: id of packet header
  * @packet_id: id of packet
@@ -116,6 +119,8 @@ struct iris_core {
 	struct iris_iface_q_info		message_queue;
 	struct iris_iface_q_info		debug_queue;
 	struct mutex				lock; /* lock for core related operations */
+	bool					irq_disabling;
+	wait_queue_head_t			irq_disable_waitqueue;
 	u8					*response_packet;
 	u32					header_id;
 	u32					packet_id;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 41dec90f3e2be..d207d5757648c 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -288,6 +288,7 @@ static int iris_probe(struct platform_device *pdev)
 
 	core->state = IRIS_CORE_DEINIT;
 	mutex_init(&core->lock);
+	init_waitqueue_head(&core->irq_disable_waitqueue);
 	init_completion(&core->core_init_done);
 
 	core->response_packet = devm_kzalloc(core->dev, IFACEQ_CORE_PKT_SIZE, GFP_KERNEL);
@@ -379,14 +380,14 @@ static int __maybe_unused iris_pm_suspend(struct device *dev)
 
 	core = dev_get_drvdata(dev);
 
-	mutex_lock(&core->lock);
+	iris_acquire_core_lock(core);
 	if (core->state != IRIS_CORE_INIT)
 		goto exit;
 
 	ret = iris_hfi_pm_suspend(core);
 
 exit:
-	mutex_unlock(&core->lock);
+	iris_release_core_lock(core);
 
 	return ret;
 }
@@ -398,7 +399,7 @@ static int __maybe_unused iris_pm_resume(struct device *dev)
 
 	core = dev_get_drvdata(dev);
 
-	mutex_lock(&core->lock);
+	iris_acquire_core_lock(core);
 	if (core->state != IRIS_CORE_INIT)
 		goto exit;
 
@@ -406,7 +407,7 @@ static int __maybe_unused iris_pm_resume(struct device *dev)
 	pm_runtime_mark_last_busy(core->dev);
 
 exit:
-	mutex_unlock(&core->lock);
+	iris_release_core_lock(core);
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 883ef7e752915..6c92857a6b8eb 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -16,6 +16,22 @@
 
 #define BW_THRESHOLD 50000
 
+void iris_acquire_core_lock(struct iris_core *core)
+{
+	mutex_lock(&core->lock);
+
+	while (READ_ONCE(core->irq_disabling)) {
+		mutex_unlock(&core->lock);
+		wait_event(core->irq_disable_waitqueue, !READ_ONCE(core->irq_disabling));
+		mutex_lock(&core->lock);
+	}
+}
+
+void iris_release_core_lock(struct iris_core *core)
+{
+	mutex_unlock(&core->lock);
+}
+
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 {
 	u32 icc_ib_multiplier = core->iris_platform_data->icc_ib_multiplier;
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index 6bfbd2dc6db09..6e1a5e734925f 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -8,6 +8,8 @@
 
 struct iris_core;
 
+void iris_acquire_core_lock(struct iris_core *core);
+void iris_release_core_lock(struct iris_core *core);
 int iris_opp_set_rate(struct device *dev, unsigned long freq);
 int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev);
 int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 1e183fc4e58ce..fcf060a72c4cf 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -232,15 +232,25 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
 }
 
+static void iris_vpu_disable_irq(struct iris_core *core)
+{
+	WRITE_ONCE(core->irq_disabling, true);
+	mutex_unlock(&core->lock);
+	disable_irq(core->irq);
+	mutex_lock(&core->lock);
+	WRITE_ONCE(core->irq_disabling, false);
+	wake_up_all(&core->irq_disable_waitqueue);
+}
+
 void iris_vpu_power_off(struct iris_core *core)
 {
+	if (!iris_vpu_watchdog(core, core->intr_status))
+		iris_vpu_disable_irq(core);
+
 	iris_opp_set_rate(core->dev, 0);
 	core->iris_platform_data->vpu_ops->power_off_hw(core);
 	core->iris_platform_data->vpu_ops->power_off_controller(core);
 	iris_unset_icc_bw(core);
-
-	if (!iris_vpu_watchdog(core, core->intr_status))
-		disable_irq_nosync(core->irq);
 }
 
 int iris_vpu_power_on_controller(struct iris_core *core)

-- 
2.34.1

