Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319921;
	b=b5ejS8nlakz+pkft3QCVDVCPq/Fu61iWKEpHYBJJoYpkI9YicNBvqMm8MoNFL2iABHZ3
	 j9bW8wwFjOfZFOpSB9HwXmlUr+PHreMAEt9HOFVRHJtpdAJjjitStIcqHmRMjkbhkXD8/
	 hldPvVm1jMi7XZgmDCS02uGHJmaiQeSkNLytcacniQ6HtmjV/9LwH6Nco0DnwwEKB1/E2
	 VT1B4Z9wY3OwRvevkJ3gh7aDGsifeuFROcbwU9yGuPgNlq6LXoeIijfwMPlVuIuIJ4zrw
	 nWXqJo2ohA0lzzbC6V4bLBjoN7s49YpOkyRSRGITnkyIZpD++8+1g+ZF42QLnQlVQnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319921;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yA5vX9qeRETjTGDhFHRbt/eU0bx3os+jUpLOPDfLilM=;
	b=kHPvHmN9i7cr4v3Dr9LdnGj/hy2at+UwUgUgwFGkpxCN5Wh6hU/io7qyfD0Mvd7uPpL0
	 +ziCayJWfHOrZ6pB2ZjLj6lLg/mAjWr67XjelYciKcRO5qJDNIRIpEnJg4M1ZHGXiqSlt
	 70djvh1AwgvZ+51HXFtuXI2T+Ti9h4CZ4SdQD8giSYgmw0PPg/MQkP/3xwzmtgR8j1xhc
	 cS/se3RXr5CUWPyuPCmP+8gIrrsovUPz8EdgfvtKsvxLXKZR4Rw2rHvc/tZRqRDV0cL7N
	 BE4v97+7PkGp+tvyc7jDz8gcI32ZubK2Ey/4VsdD6b+SAkzZ2gwjmEFSQyXcHf3jmaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPbDPbbO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UYjgk7eG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B4560A381A
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 14:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1B4560A381A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPbDPbbO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UYjgk7eG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA6bD3217038
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 14:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yA5vX9qeRETjTGDhFHRbt/eU0bx3os+jUpLOPDfLilM=; b=LPbDPbbOP9fP28+0
	FbsJJLXydj54lFnKGF1psb43s0LwUkFHKzC1V/QJPbX1yaZVM1ppYVChRuh+Hcsf
	oJzsqb6QrI/wdhblL6wTpb5ShbDXtzBNylOa9gi7zzf7vWEF68qVIE6TP5lArGVw
	uE7XnoDGQkG/YA4fSm8/LQdW7eDEHop/OEePqYW6amsiHZllo7PGOGmtKtsbBq5N
	BgIQirao8F8QOveb6Wj62Kbokxi8MRc9sMVBM38GixZnb3NsIDw1ubLKd2dwSwA+
	At6kLUZQ+h786ckdg+Nu1rk5SpMV/+T8lQtPQO3toBdiCVGug0iLQDwaK6i4ucqM
	H+1nwA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtda071-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 14:11:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37549877380so1173287eec.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 06:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319919; x=1794924719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yA5vX9qeRETjTGDhFHRbt/eU0bx3os+jUpLOPDfLilM=;
        b=UYjgk7eGcxq95gKGMTA3a9ddHXRCRAgr4FYunZ2OlsBhsW44Yy0I0o8BB4HvqCJXrZ
         xD25qaRb1MpROe8e+k4dpkHlJKBf5+rw98M8zlvNJl6jzfFqCF5Om3thVbrpbbLKDTSV
         aV/L98DxKSbm16Wgob4YLzKFTPzeQdKR+Zk/FtrGdsuUAUhtwEf/rPnjyTz6vrHquy0r
         mbseds9PwlzO6vUUHgDwRozC+ynAQXTTEvvNjAXxFSPLUUqVPdLS3wtljcuY0brpG8PY
         z5DPrnyKB2UIWKkCozBG7lbDyut0MI708IWzyhJ1eHT87KsL0tK8tbPVLPjuiHVgld9v
         NkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319919; x=1794924719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yA5vX9qeRETjTGDhFHRbt/eU0bx3os+jUpLOPDfLilM=;
        b=Z8u6P5qJL0SE83mX1+xp0sUnzRxZUoSqnVRP0YdCewEUZt98EJ2oWE0lo6wFBE4kA9
         9hCeczuPwl2UaqnydG9m6OeYa+NjsO0VLwX8GjmeEOBtntrYG7Y/JIGESp8481DiwXfF
         HjWabWHztka0vi6RzUdMkdGuSWW1AndUqv8k2Xnj3mfWfjuUe1+shEPuXMB60eJHG1iV
         DvFb44j8TfgAm1d7p16hV70Dt2Paie50C+TrR4T+C7X682zwIvANNPIO7AGMJCEOxVp0
         UpdioG/kYxRbR39FVMTvAQoAeoiu4w59sWrQ9F4gdMejSddnPHOMMhkUQLUi68hefRha
         einw==
X-Gm-Message-State: APuU4Z9loV5XIgkHV0RLNfSBrkBOlMEponFbT5d2zRxoVznPj4n0wOYL
	t93WjmBysyga899NavuzZyfZR0rcmteyA1MIY4IB0nsGxoHrwptJCAVzijXwE2F7CBISIo3NZ7n
	N8eST0SKS3lfHKz7BUuXpy2S+ZTk8v8B2BgcIyE4OQMfEFIgb0zHTFTvOKZuZwZux1A==
X-Gm-Gg: AYBFou1JaEibhAef79LO/BJxAzF6LaohZq6wXZQIqEWNlnFI0EqSJ5Y+u9mYX7SAaBf
	pFA/bAreec55aGcigadIPT+DwH0kCm2tOK89OgkFpfqaO2IhiqIzk8+A3gcpoeRP7nUK+Ye+OKa
	/Upqm7KHD2XGh8DS8hgf4USnuSvUcI0pwgSbMV82Vt12hJ8gzsRrkNvbVBEf6vvuTKE9ZKHEc5n
	HhWZ6apkqV5yi2B2qio7eP6t9o5GUeusoTcrMjz85+OrXC3rSsrvQhGsghyWW64x3fWR4QQYBI8
	HgQY1wnYOL9AbIkrdkk2R56Iwsi0c716phY/I6LMB7LsenCZhtf0bQFTvHZBvDPJBLaVD8VZy8h
	7twFfYZtkoqpMp7Fr93Euhyocnja8mvG9o6u/TseRy5m22yrPBhx3dIpP1JSbcMipIF4hafhoit
	bMQ68BiV8=
X-Received: by 2002:a05:693c:394b:b0:36c:49a7:86ac with SMTP id 5a478bee46e88-37520713cbamr4276287eec.37.1794319918334;
        Tue, 10 Nov 2026 06:11:58 -0800 (PST)
X-Received: by 2002:a05:693c:394b:b0:36c:49a7:86ac with SMTP id 5a478bee46e88-37520713cbamr4276232eec.37.1794319917540;
        Tue, 10 Nov 2026 06:11:57 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm8059128eec.27.2026.11.10.06.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:11:57 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 19:39:52 +0530
Subject: [PATCH v2 4/5] media: iris: Wake up blocked clients when the
 driver is removed
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
Message-Id: <20261110-iris-handle-unbind-v2-4-86d5f6f1dea8@oss.qualcomm.com>
References: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
In-Reply-To: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794319890; l=3688;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=p29h8OBXt3F9xRaxGiuMS+CHBCIAi6zq9MGnLRFIvd0=;
 b=vaPc6dJN89IQWMT5PNXwtXQaSRSLYKjRFXub4X8WJJ1lqkgjB+x+fhyNZFZFb3LflnFtcULr+
 NparqXkVY3rB9W4O8bkiQXc2XVAAVYUchtvuLb6Q85g8Ay6jDeiNn+a
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 2ODL8L1E5_3I9JXbOL0aW4q24otZMD_K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX86iGMqDoiqkP
 iZ7AbMUAG6RsRF5WriIkPjE1q8YyJPedMYhERAmKTfFn9rs5vOU6Y1HXtSv4lOEUYAWk1XlJLJg
 V6Xzy/g7wO40LmB7GicI/jOiPFo7lzg=
X-Proofpoint-ORIG-GUID: 2ODL8L1E5_3I9JXbOL0aW4q24otZMD_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX/1GTDxZBBdNV
 luhcAfUIj7WLIf9XPNkT14Lz0PtXi0r0oBNNh6lrud4UmQU8TTZ9nQxuYj2V1IPwdpoQmAcMP+5
 8PfpWmSCYO05zTfYDu3TiaykdHfCdBi3aNxQL4wPATs8AwMhdgMI7tVD1qgrow18Rtsra8I7SKv
 V4a8ttZ78WLtd7FOdy73z0zWBdW5MR6imOHWWfaFbBVQZGEwSVl9TWbLzrkmV2xYu6cYQNtihEy
 4kMeYCLjzTfseggyLQGnTMtSwNUJY2zozvacQ5XdSHu/GZUwHl6suKbR95aF8zfLp9JFpAnggo2
 WQACj/ZWbFhFQwFgVjEyJSPPpJzxh1A3S0xPT3pko3x/AtC3pAQDq0ObsCrnayFOSVZoRaNWtk3
 hjNgMGfV0g8Mg2TfE6zfuzp78tb1lgNUIiuSXOs0zokgbavGgsRd9N0CeBgVUTa7EAx2ZAiYmqq
 f6GSDisgr9O81v5RHGA==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af3262f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OLikLUY__WNYvvbHpiEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100056

iris_remove() does not wake up a client that is blocked in
VIDIOC_DQBUF or poll() on an open session. The client stays blocked and
keeps its file descriptor open.

Flag the vb2 queues of all open instances as errored after the core is
shut down. This wakes up the blocked clients, which fail with an error
and can close the file descriptor. Skip the instances that are already
closing, as iris_close() releases their queues.

Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_instance.h |  2 ++
 drivers/media/platform/qcom/iris/iris_probe.c    | 16 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vidc.c     |  5 +++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 771269e705d9..cb84753e4f91 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -50,6 +50,7 @@ struct iris_hfi_session_ops;
  * @icc_data: structure of interconnect data
  * @m2m_dev:	a reference to m2m device structure
  * @m2m_ctx:	a reference to m2m context structure
+ * @closing: set on close, skips the queue error during removal
  * @sequence_cap: a sequence counter for capture queue
  * @sequence_out: a sequence counter for output queue
  * @tss: timestamp metadata
@@ -98,6 +99,7 @@ struct iris_inst {
 	struct icc_vote_data		icc_data;
 	struct v4l2_m2m_dev		*m2m_dev;
 	struct v4l2_m2m_ctx		*m2m_ctx;
+	bool				closing;
 	u32				sequence_cap;
 	u32				sequence_out;
 	struct iris_ts_metadata		tss[VIDEO_MAX_FRAME];
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index dc83daccea5f..51054862bc64 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -12,8 +12,10 @@
 #include <linux/reset.h>
 #include <linux/soc/qcom/ubwc.h>
 
+#include "iris_buffer.h"
 #include "iris_core.h"
 #include "iris_ctrls.h"
+#include "iris_instance.h"
 #include "iris_vidc.h"
 
 static int iris_init_icc(struct iris_core *core)
@@ -259,6 +261,18 @@ static void iris_core_put(void *data)
 	v4l2_device_put(&core->v4l2_dev);
 }
 
+static void iris_instances_vb2_queue_error(struct iris_core *core)
+{
+	struct iris_inst *inst;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(inst, &core->instances, list) {
+		if (!inst->closing)
+			iris_vb2_queue_error(inst);
+	}
+	mutex_unlock(&core->lock);
+}
+
 static void iris_remove(struct platform_device *pdev)
 {
 	struct iris_core *core;
@@ -278,6 +292,8 @@ static void iris_remove(struct platform_device *pdev)
 
 	iris_core_deinit(core);
 
+	iris_instances_vb2_queue_error(core);
+
 	pm_runtime_dont_use_autosuspend(core->dev);
 	pm_runtime_disable(core->dev);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 04bd37b93445..bb3519eff3b1 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -312,6 +312,11 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
 int iris_close(struct file *filp)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
+	struct iris_core *core = inst->core;
+
+	mutex_lock(&core->lock);
+	inst->closing = true;
+	mutex_unlock(&core->lock);
 
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 	v4l2_m2m_ctx_release(inst->m2m_ctx);

-- 
2.34.1

