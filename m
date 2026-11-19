Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088780;
	b=hZRbRouHFEzrJEK2Uq6IGsHqlNIHeGuvvtFsCMSIMRN/Wlyl7AutE3pu0BZghvgSiX85
	 W/IzG4lOaJMFaNu/ReS3W1VdnXndF09OkdZInGyhRhBxOJ6Scy6ZuSvglgteCnilQ0OAD
	 PMP34pZsif6cM/LcPLAk/TZ79GGI2exTIvaEQYMsBF/U/tSEmfH3TAcVgkV/G2GjX8pWY
	 rJtn+oxsX45U9CQGSAXUze3b2K9wmrfFLID4xRpGZHGdIVAY1dpvLMXGYUvc8me8nuCSZ
	 GXDcIHg8x6NrzgdwFO9xRzBoyHJ8Dv5KBuccJo3vfMTrga9miNbyZn0r4t4Ilus0xPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=P5hRMCbh8zeA7xTvrHto2CFQeRiZsjYuDhpYld4hdUY=;
	b=n36UqI8dL4STlSZbUNeWZCQEeRAEeuo0wyQLP99yjtlFPM9vhneD9+8mYP5HuKYap7aQ
	 P2YN5vCykGB1aBpZbkD/rRzjo9CUPKICDjgwUxaflVuNuJH03bj80WpA/VVXEF3PPzjrr
	 XtFG7MJOaKX105o+q7S+ta+V7Z5IiQ+Cbs+4XltATmlRvb+6q4wH0mV/tMUsMnyyILOgC
	 bdF48uv5Qa1Gjcjmw9Q5Uk2tIJ5URSBgt4UGsc9hae3PvepJShzPfIJi6002/5drjI3qG
	 l/IIbiP8aFUqjp1iwfm6SWtmSg/eeOxgtgD68IquYrBNJcotutN+UX0Y5QaboOes24w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dPIVgrO1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FIdvR4Ib;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31799606A331
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31799606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dPIVgrO1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FIdvR4Ib
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBk1F5976604
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P5hRMCbh8zeA7xTvrHto2CFQeRiZsjYuDhpYld4hdUY=; b=dPIVgrO1Xdu3l5b2
	HBz8pH1615O6QtJgdsI7jixd7HZgPbzPLdf9csX6r5pGByflcyMAzeqNmtTmTY5S
	r/nz+7eoFQY5+2+qhWjAqSkVyRutDY7Tydm+EK73hzmy6+AtsyJTQxtq82sD5002
	lMPFmgLoq6vO3g2yhMaNUzSEGVcyuCgVS9WhsJnE7cmBcYTJfbc4J8lJ9q+1aUV/
	r1hOzBeG66Dk5+f8WUTPpZ5iN1/fM/yMSEEy7wepBpVdfDHHUjuSpJQxXX1QRr+k
	mKH5M9rXCZej16NCrBVHwA+l3/1pzoOy6c+m7eWw+MKthNbcXAZm5FQWxMVest9F
	KqSjnQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnmbhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:46:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so1540139a12.3
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 03:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088778; x=1795693578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5hRMCbh8zeA7xTvrHto2CFQeRiZsjYuDhpYld4hdUY=;
        b=FIdvR4Ib/rEtFYRFPlJZFEi9E5ssrwPSr8tOtbCbj6u0dw3Q8BJwLBpXfOXyCiPWRn
         PqndUveRFWLUsrZVc6cYos6XzH5hUWxnkk6PdhryichZD6Xr/jAkkYg0I78idrnL5+eL
         +w6ChVwNRwywTUiWcYj89RhhsuCmTjyUPqIgS3zibT8/U/41WdZt30D+kvBikHYXjMMM
         Fq0UaYoJuYaSn5dmHt9pkkX7HeJEVxb+o3fCl8kiGe1VkiMHyVEXDr1GVkkVNdekTdAc
         7uXS9C5jqdgnM4QMjXPq2fMGmpqGhW8G4gpK68rjE4IHpI9xlrUneski2L3udH0Sso61
         +jMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088778; x=1795693578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5hRMCbh8zeA7xTvrHto2CFQeRiZsjYuDhpYld4hdUY=;
        b=Ct4SWpwEHGNDFuB6b/QmHhvqr3nig/ZQyrduhbgVhGiz4muOOmlV/Vj3i5ZNN8xFBJ
         onbekkmHoCjI79hWmPY4EWZLciHE4bxN0hN3h0lVwldE6WVj6538hfYrFfs7636HdCLE
         7E4CyI/bPtksj0b+I1V3GuHH37siXwZIaGryHyHPn6kKmOsibQS0C6bkblJSk1m0lRBp
         qqfJg+8iMj8ZmJz7bHKqCnlIBVnVzLH5ha3pow4KJoG7KEw3cJOjVpMRq6wAPfSMa7/8
         CdMFCC3YR5UgJnuI6Y3vzTEaw98zItGs8ByS7VEAiqodWJ6b/ROrZD3/9nCVIWZHmRu4
         mHsg==
X-Gm-Message-State: APuU4Z/hvhwP0e/hID0kemSkbaK2Of9BxV1s0cr6kYXHyMyBZ9WOoJNI
	BuY3JZ2cPzDnshNPioYbcESECW6Xvgt6c8CDbsataw52famNo4fd6wLy/9w+DkKSrcdBJuK3wp6
	beWrh3fmplrFt+QMU6LUnI8XbH6pKgM4DP370K7ZtQONpSKX48bSXKWMc4WETFAgveA==
X-Gm-Gg: AZFdTZe1mZrTs+iooSJ5+OBAoQXxMY1KACnzBHdSpfURkaGd7wHIrdrhkgRrk9AJ8nt
	R8XSaBML3U0na4+H+NvyJUKQ3d+g/FzCma2lXi10AzV4QX/V6y05lKyMlQfZePeI9rO5ObeaC33
	h2iOKwXv5fiYEw1uRJdo++zxGIY2dtiUC6fDERjUed3jdMDxO+et4bjq3T65kaW1OXmIdL/FluQ
	pRvhfzUNqTjeD7CYtWie33chD9XfWausc2gYxQW6bM8rxYBPVKqW9qmaL1LOVwbn6+7qjdu0pg7
	TB2SRd0m7D1SYZYLfHXm9aH8ZJG56JmalqDd/GPGXkA4ThkmeqqkDAKQuLVdr6gQkS/7t27EraT
	f5ROclP+8fKTWJdc4qz50Dc+RGTynfYvX5XExrc66/JnqT3D6+DrquP65FyxIevfA4MbrUrgEHX
	N8MZILvnA=
X-Received: by 2002:a17:90a:d2d0:b0:3b3:b621:4026 with SMTP id 98e67ed59e1d1-3b3d04d00e7mr5729449a91.0.1795088777746;
        Thu, 19 Nov 2026 03:46:17 -0800 (PST)
X-Received: by 2002:a17:90a:d2d0:b0:3b3:b621:4026 with SMTP id 98e67ed59e1d1-3b3d04d00e7mr5729427a91.0.1795088777243;
        Thu, 19 Nov 2026 03:46:17 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm2397030a91.15.2026.11.19.03.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:46:16 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:15:33 +0530
Subject: [PATCH v3 4/4] media: iris: Wake up blocked clients when the
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
Message-Id: <20261119-iris-handle-unbind-v3-4-52d467a13907@oss.qualcomm.com>
References: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
In-Reply-To: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088753; l=3688;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=HKcMkuZKb6s+vqIE767BoluWCKDfeOxDrf3OBQqzR6Y=;
 b=QgFtPD4XYcIztd2kVwil4os1V8xEgdiu6qpuQ8nVUgzKCmc7NK3my50qeIaKF2SZWgMaX+gFi
 fCph+HWf0MzC052bjPuFmnPAQMllGpoYyXRG5JMHJn0kuxfgPbiW9Jb
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: qR3u8_qSrHq328mqA2b3qq4-5ARV3LDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX9lVsOeu47+Nx
 iElwXLFnIgqleNeXuLnFjFo+Wlhhpz6hkIB8Ayz9pswJ88Q7OY0LpAJOI5tcfGOoZ25wClCmQOm
 fo19G1laz9Gbif3mqqsQl5F7YPtuQGnUAtSFg3nFaTRCfDzydwmV+qHMWwweOowlAlHD8T853Ta
 wxHHlon29gFihKDwiPY2k/Lref1EOqyVpIzQqjkwo8Y/7+BJB8O6X10xJ6YhP7U9Cxca1cKV3Nn
 +H+eZbUdugIvaYl1B1cEXRfMyRSNTWuH8MwMXRqUTkaYn2yB3dFnJrvI/G66uo97qPeNpDfTyqb
 N4OdwQ2/cBJu3Pk5NJ3OCqiwYHV/8n2Hcix2sPztJ2qKf92BCdY8srV0lICtgyrydt7uybzibvC
 Cp7D4f3bN/QHqyDnCsYJzqdqf6sXH6S3A8lkJ6bWOU+sDxHgFz7yu7VICeytdeWW3vzz8Vz7PSc
 3rEJxaJDg64wIFvLSVg==
X-Proofpoint-ORIG-GUID: qR3u8_qSrHq328mqA2b3qq4-5ARV3LDI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX3aKgpWCt6ZDk
 Rw8Nb3fbAnToNLRHSQ81SGiq5HJgkgXrFP6hhQB5eOD3P0AVOrlrTfOUjPCFLkDYP6BTaz7DuOO
 7vi45ShZd3dxmU2g7Ymz1f/MKqgQq+Q=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afee18a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OLikLUY__WNYvvbHpiEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046

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
index 57185dc432eb..a086e519a55f 100644
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
@@ -281,6 +295,8 @@ static void iris_remove(struct platform_device *pdev)
 
 	iris_core_deinit(core);
 
+	iris_instances_vb2_queue_error(core);
+
 	pm_runtime_dont_use_autosuspend(core->dev);
 	pm_runtime_disable(core->dev);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 4c9961206f9b..19d1583c20a7 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -322,6 +322,11 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
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

