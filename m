Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4585849DBA8
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 07:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049981; cv=none; b=PNZfglmBV+vNEh04C1reY3CzZAOv8Y8wXfbH8PnXA375h19u/eXjixVJvEJrnvjFT6cL01qxhfp+RKSBqgL0sDlN/BTQh0h4bBgmyVX7Nww5RExS1ZMEKOQU3eseJKU0DwpX5BaIeFxHKhm6dK8Amu5AGodDsGwNyFkqZ4B64W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049981; c=relaxed/simple;
	bh=fPkloJWnW4jV120+QwsLlNH62jL8JVRfsRHI42AR5Sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iBBimmTiDBXqpzENUC9Wgnce8QdHTmP5bnGtZx6aMy36Sza/VGY2WAQ4g9rV9+5cQtIDn6gOQTM+ecK/mWveKkhorveCCMQYjBVaolaLNYu5mRXxHzRVOKEcCEkGJXls6etg9ObJqtd6W5f+K8paG9hNO4N57LILePWtiE7pLZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQ6PgKt2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VszqrKZN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQ6PgKt2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VszqrKZN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6ANtt644584
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 07:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PqjS4FnlYuc+QaADcRNw4g0dlRCNnsRiksJdOqt/jSQ=; b=NQ6PgKt2IaBAI5NL
	2VCBxDSDPWCCie6LwiHYSLsoG5YJXPDyU0//DKNLhhWmipYCseiH7rg7yDkylJXm
	ANeonRfJ7G61JPgabZc/7vorkejauHDE21CX0mYJZTs+q8e1dQoWe/REKCUw1KY+
	Xp/98T+B2scW7FvpAe4vipCGPz7RhU7Hnk9PTBGwPh7K7Kj1quBJsZkneerVldxy
	/nBGBse+rkx6b4Du+0MAB8iQio8SseAOC00XITCDbCknDRGnihR6PPY5+JB5YLWi
	N+/nBwTZlOw4EPfpUZE26A9h7F00QBGiEtPgAljx52knEp7v9awEf3yaqTWONmL1
	DuC4hw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmy9rv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 07:39:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e6188d1e51so55839415ad.0
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 00:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792049972; x=1792654772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqjS4FnlYuc+QaADcRNw4g0dlRCNnsRiksJdOqt/jSQ=;
        b=VszqrKZN8o8UnHHiViK5Z/BbxAd52jtMdD2w+bb5W1Sy3WxC3ZGI1mgYxIYNUI1MlG
         6cKOqE/M07gsDGWVqh2fLLqLTSdunDr5qHaDHoEiZkdndkr2Jp3IAAvtyUdPeh5sfO6V
         /16jDQ4YnUoDKhtLmP103DMuMmlsV1A666G9M8dDAWev2UV857JmZExHSK98EDt1KYGK
         UcWNnEs2QBIY6AD3wBQb7ho8cj4gGxKcczXIHbrgCkdrmDOmFXLNIzFf3KFL0DD0+KWb
         iw7FXdF2OdvqOe+EJ6Gr2YNrqvRrrcCyAd032VBa7Vg2IA+9iodJHcHc0UlTXQXdEzBX
         AcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049972; x=1792654772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqjS4FnlYuc+QaADcRNw4g0dlRCNnsRiksJdOqt/jSQ=;
        b=Qs3V0ZTzKjzLahbYgTxd7llA7taQyzW1SaAB0h9q2EkJtpQzp4BZSGZUhz03Tfgzk/
         U9o2awH494EnMRCGXhDa4vsrY7zJXy/0U5e+8O2mS0W4wcMEIwS1DFaocszqqVkDpP10
         uEmBKPeM+Lw0ZdR6eOMqDZFrV9ZvPX5OQhtqbNsYlAZkR2/bu4vw/WarHyCxOUppAqJV
         AXbn2WNvb+SNfD2HoR5I9O3htT0WZqCvG5eAdlaOxdOC8fq2ZiVl9SEKWDyY5NINRfoi
         /t+Sqcjm9keCpoSxM9DjnhGzbdZ2x0RLe4tmbnMU203O700ixhRJEyzldY/CoA9Us5PC
         BiyA==
X-Forwarded-Encrypted: i=1; AKwUvBzafa3mf7ZUogf+n1vpx8xLcPsC4OSNndijrsfJHKmeaPAZTRRvISTXM0rrO2NdhDTQpBhU9YNH+AagTA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIE1WUFCFwxK6hS3psqjT5vAMMkzK9qDhpACf0G/XmzleR5De6M
	s8evmqyMprT+9LN9M3hoo3scA+rhke3lhJBEbH2icxXIiqqRA/iGadzHZwCb++/naCI6yinATpL
	BjjT/9Cl3yjWLTR2pJK1IQYysz5xs3/nsB6PK4udNLBzV3mG2/r6gdyPU70Bg7urf7Q==
X-Gm-Gg: AYBFou29GcSilvDAnUxar8XKE1pnk/PsRtXW+dsoZ/zok/oArzwp3wbYNDvMrRMSvha
	3IZ1tatFbNH1Cz370jnLLovVuq2KeuHCdkZvQ0yBX+ljXJvrHzwXG+ENRxsmSM/dwhPg5UaaYKB
	Lu+AZhvWM4FR19/V8g0taAEVWQ/wOTdSRQQkQIpL0piVLBQURCI1qQC/lr/73p6tdtcblJukCPJ
	rMs+2jT3HbkyqbsEMrCfCNcaDxNCiTekIYhKQ9Vtr6/NOtOUTNSpfnGQQCUBLuvSghMStzw9AwI
	hYhGvFKXXjezosRWVeAYDTD1efyZXxSHa3C/d7PTxdmXFRM3Jpcj3qv5FHig1QT+dbGiKXrdKPW
	KEawm4Ago4Rur2mLf0LHiniT2w04yu5vom74=
X-Received: by 2002:a17:902:f547:b0:2e9:3f5a:de9b with SMTP id d9443c01a7336-2e93f5ae5b1mr39673755ad.9.1792049971865;
        Thu, 15 Oct 2026 00:39:31 -0700 (PDT)
X-Received: by 2002:a17:902:f547:b0:2e9:3f5a:de9b with SMTP id d9443c01a7336-2e93f5ae5b1mr39673395ad.9.1792049971322;
        Thu, 15 Oct 2026 00:39:31 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e944c23f17sm14014825ad.27.2026.10.15.00.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:39:31 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:08:24 +0530
Subject: [PATCH 04/13] drm/msm/dcp: Add IPCC power notification
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-jshekhar-drm-msm-dcp-v1-v1-4-48aad0fe4f72@oss.qualcomm.com>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
In-Reply-To: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792049920; l=9608;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=fPkloJWnW4jV120+QwsLlNH62jL8JVRfsRHI42AR5Sc=;
 b=hLSb4f+MiglFU3ZSmaynK1+PrO9Dkgllq5GgyVkExX9RRYtwbvodQBAzJdYhlB1ZrCeF58j8F
 b1eVgsH6GffBrR/AnT4Evi9v58omKtaDUHplptOcqeZ99HIDQsMHaiS
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-GUID: iBuUSE8_KwmXPiqupf4cKqD_wh88Isd9
X-Proofpoint-ORIG-GUID: iBuUSE8_KwmXPiqupf4cKqD_wh88Isd9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfX+D6k+hXr2KwZ
 Qw8Csso9Y1YXUc+UuRBI7olKTlei79zhmUsAJ+kSDOG/Z7lYqzud4FF4hp794XkA6VN/Btv/qia
 /uMmIsqU1HltfYxAO6y157Pgp8gFN4U=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad08334 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HYBqBNDG3rqcJ-mQvmoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfX/IHDvkPkBfuf
 iqr8H8zwlhVCQr291elGU9+QWxge9E7K31TO4V+FnIAwh5i6cjeeKtqqNRchdIHuwX0kXNkN5fi
 WfoTXhLRWuN5/wExQH2cutI0ex6xyjT8S6gE9iB011kItqn0CcVp7F0+fz3AMHmK12XwGTE9uIf
 g+f3EWQt/sKe/ekp7J+C9kT57Cnp9JH1xnmzqdIExBWejAmiKhFqQEZlSNrLQdw2rigc2/eRcZG
 n7HhIrzmw9lryAbL4/nRDdRVoc5aKkBfIRCh5Qcp8G6qosOJcTbJLb6f6hQcX43TBkxyi+GHpje
 dny5D5ndDJDhCDZb/lQ9BB4xm759rSwwtfe77VGeN6A16fXHvK/0EczV8+pWgk5hjtze1halgoo
 gyRWzM0L2202a2/ApaCGQaG+bNVb0wfo5aR9S2cpITtzkjA6pzNEdhguYK4nL3PjyVk0z0uuuVY
 6YsP+B5AoEZTTlKayxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150030

DCP may be power-collapsed while the VirtIO transport remains available.
The host therefore needs the platform IPCC channel to wake the firmware and
to receive notification that it can service HFI queues.

Add the IPCC mailbox client and power-notify interrupt handling. Wake DCP
before VirtIO queue activity, wait for the firmware acknowledgment, and
notify the response queue when the IPCC receive path completes.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Assisted-by: LLM
---
 drivers/gpu/drm/msm/Makefile       |   1 +
 drivers/gpu/drm/msm/dcp/dcp_drv.h  |   1 +
 drivers/gpu/drm/msm/dcp/dcp_ipcc.c | 212 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_ipcc.h |  56 ++++++++++
 4 files changed, 270 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index bdc34babfc21..4195bc0e1fc9 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -71,6 +71,7 @@ msm-display-$(CONFIG_DRM_MSM_MDP5) += \
 
 msm-display-$(CONFIG_DRM_MSM_DCP) += \
 	dcp/dcp_hfi_core.o \
+	dcp/dcp_ipcc.o \
 	dcp/hfi/hfi_packer.o \
 	dcp/hfi/hfi_unpacker.o \
 	dcp/hfi/hfi_utils.o
diff --git a/drivers/gpu/drm/msm/dcp/dcp_drv.h b/drivers/gpu/drm/msm/dcp/dcp_drv.h
index bf6c34af43a0..af2db3cf9066 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_drv.h
+++ b/drivers/gpu/drm/msm/dcp/dcp_drv.h
@@ -13,6 +13,7 @@
 #include <linux/virtio.h>
 
 #include "dcp_hfi.h"
+#include "dcp_ipcc.h"
 
 struct dcp_dpu_kms;
 
diff --git a/drivers/gpu/drm/msm/dcp/dcp_ipcc.c b/drivers/gpu/drm/msm/dcp/dcp_ipcc.c
new file mode 100644
index 000000000000..e60a3ecbe3d8
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_ipcc.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * DCP IPCC power-notify mailbox client.
+ *
+ * The APSS-to-DCP channel must be signaled before a VirtIO queue kick.
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/jiffies.h>
+#include <linux/interrupt.h>
+#include <linux/mailbox_client.h>
+#include <linux/mutex.h>
+#include <linux/of_irq.h>
+#include <linux/string.h>
+#include <linux/virtio.h>
+
+#include "dcp_ipcc.h"
+
+#define DCP_IPCC_POWER_NOTIFY_TIMEOUT_MS	10000
+
+static void dcp_ipcc_handle_rx(struct dcp_ipcc *ipcc)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&ipcc->state_lock, flags);
+	if (ipcc->shutting_down) {
+		spin_unlock_irqrestore(&ipcc->state_lock, flags);
+		return;
+	}
+
+	if (atomic_xchg(&ipcc->power_notify_pending, 0))
+		complete(&ipcc->power_notify_done);
+
+	if (ipcc->resp_vq && virtqueue_kick_prepare(ipcc->resp_vq))
+		virtqueue_notify(ipcc->resp_vq);
+	spin_unlock_irqrestore(&ipcc->state_lock, flags);
+}
+
+static irqreturn_t dcp_ipcc_power_notify_irq(int irq, void *data)
+{
+	struct dcp_ipcc *ipcc = data;
+
+	dcp_ipcc_handle_rx(ipcc);
+
+	return IRQ_HANDLED;
+}
+
+static void dcp_ipcc_rx_callback(struct mbox_client *cl, void *data)
+{
+	struct dcp_ipcc *ipcc = container_of(cl, struct dcp_ipcc, client);
+
+	dcp_ipcc_handle_rx(ipcc);
+}
+
+int dcp_ipcc_init(struct dcp_ipcc *ipcc, struct device *dev)
+{
+	int irq, ret;
+
+	if (!ipcc || !dev)
+		return -EINVAL;
+
+	memset(ipcc, 0, sizeof(*ipcc));
+	init_completion(&ipcc->power_notify_done);
+	mutex_init(&ipcc->power_notify_lock);
+	spin_lock_init(&ipcc->state_lock);
+	atomic_set(&ipcc->power_notify_pending, 0);
+
+	ipcc->client.dev          = dev;
+	ipcc->client.tx_block     = false;
+	ipcc->client.tx_tout      = 0;
+	ipcc->client.knows_txdone = true;
+	ipcc->client.rx_callback  = dcp_ipcc_rx_callback;
+
+	ipcc->power_chan = mbox_request_channel_byname(&ipcc->client,
+						       "dcp-power-tx");
+	if (IS_ERR(ipcc->power_chan)) {
+		ret = PTR_ERR(ipcc->power_chan);
+		ipcc->power_chan = NULL;
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "IPCC: failed to get 'dcp-power-tx': %d\n", ret);
+		return ret;
+	}
+
+	irq = of_irq_get_byname(dev->of_node, "dcp_power_notify_irq");
+	if (irq <= 0) {
+		ret = irq ? irq : -EINVAL;
+		ret = dev_err_probe(dev, ret,
+				    "failed to get required power notify IRQ\n");
+		goto err_free_channel;
+	}
+
+	ret = request_irq(irq, dcp_ipcc_power_notify_irq,
+			  0, "dcp-power-notify", ipcc);
+	if (ret) {
+		ret = dev_err_probe(dev, ret,
+				    "failed to request power notify IRQ %d\n", irq);
+		goto err_free_channel;
+	}
+	ipcc->power_notify_irq = irq;
+
+	ret = enable_irq_wake(irq);
+	if (ret) {
+		dev_err(dev, "failed to enable power notify IRQ wake: %d\n", ret);
+		goto err_free_irq;
+	}
+	ipcc->power_notify_irq_wake = true;
+
+	return 0;
+
+err_free_irq:
+	free_irq(irq, ipcc);
+	ipcc->power_notify_irq = 0;
+err_free_channel:
+	mbox_free_channel(ipcc->power_chan);
+	ipcc->power_chan = NULL;
+	return ret;
+}
+
+void dcp_ipcc_set_resp_vq(struct dcp_ipcc *ipcc, struct virtqueue *resp_vq)
+{
+	unsigned long flags;
+
+	if (!ipcc)
+		return;
+
+	spin_lock_irqsave(&ipcc->state_lock, flags);
+	if (!ipcc->shutting_down)
+		ipcc->resp_vq = resp_vq;
+	spin_unlock_irqrestore(&ipcc->state_lock, flags);
+}
+
+void dcp_ipcc_deinit(struct dcp_ipcc *ipcc)
+{
+	struct mbox_chan *power_chan;
+	int irq;
+	bool irq_wake;
+	unsigned long flags;
+
+	if (!ipcc)
+		return;
+
+	mutex_lock(&ipcc->power_notify_lock);
+	spin_lock_irqsave(&ipcc->state_lock, flags);
+	ipcc->shutting_down = true;
+	ipcc->resp_vq = NULL;
+	irq = ipcc->power_notify_irq;
+	ipcc->power_notify_irq = 0;
+	irq_wake = ipcc->power_notify_irq_wake;
+	ipcc->power_notify_irq_wake = false;
+	power_chan = ipcc->power_chan;
+	ipcc->power_chan = NULL;
+	spin_unlock_irqrestore(&ipcc->state_lock, flags);
+
+	if (irq > 0) {
+		disable_irq(irq);
+		if (irq_wake)
+			disable_irq_wake(irq);
+		free_irq(irq, ipcc);
+	}
+	if (power_chan)
+		mbox_free_channel(power_chan);
+	mutex_unlock(&ipcc->power_notify_lock);
+}
+
+int dcp_ipcc_send_power_notify(struct dcp_ipcc *ipcc)
+{
+	unsigned long flags, timeout;
+	int ret;
+
+	if (!ipcc)
+		return -ENODEV;
+
+	/* Wait for the doorbell acknowledgment before returning to VirtIO. */
+	mutex_lock(&ipcc->power_notify_lock);
+	spin_lock_irqsave(&ipcc->state_lock, flags);
+	if (ipcc->shutting_down || !ipcc->power_chan) {
+		spin_unlock_irqrestore(&ipcc->state_lock, flags);
+		ret = -ENODEV;
+		goto out_unlock;
+	}
+	spin_unlock_irqrestore(&ipcc->state_lock, flags);
+
+	reinit_completion(&ipcc->power_notify_done);
+	atomic_set(&ipcc->power_notify_pending, 1);
+
+	ret = mbox_send_message(ipcc->power_chan, NULL);
+	mbox_client_txdone(ipcc->power_chan, ret);
+	if (ret < 0) {
+		atomic_set(&ipcc->power_notify_pending, 0);
+		dev_err(ipcc->client.dev,
+			"IPCC TX: power notify failed: %d\n", ret);
+		goto out_unlock;
+	}
+
+	timeout = wait_for_completion_timeout(&ipcc->power_notify_done,
+					      msecs_to_jiffies(DCP_IPCC_POWER_NOTIFY_TIMEOUT_MS));
+	atomic_set(&ipcc->power_notify_pending, 0);
+	if (!timeout) {
+		dev_err(ipcc->client.dev,
+			"IPCC power notify acknowledgment timed out\n");
+		ret = -ETIMEDOUT;
+	} else {
+		ret = 0;
+	}
+
+out_unlock:
+	mutex_unlock(&ipcc->power_notify_lock);
+	return ret;
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_ipcc.h b/drivers/gpu/drm/msm/dcp/dcp_ipcc.h
new file mode 100644
index 000000000000..a3430e5cbe72
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_ipcc.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * IPCC power-notify mailbox interface for DCP firmware.
+ *
+ * Channel 5 carries APSS-to-DCP wake notifications; responses arrive through
+ * the mailbox client's RX callback.
+ */
+
+#ifndef __DCP_IPCC_H__
+#define __DCP_IPCC_H__
+
+#include <linux/atomic.h>
+#include <linux/completion.h>
+#include <linux/mailbox_client.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+
+struct device;
+struct virtqueue;
+
+/**
+ * struct dcp_ipcc - DCP IPCC power-notification state
+ * @client: Mailbox client used for APSS-to-DCP notifications.
+ * @power_chan: Mailbox channel carrying power notifications.
+ * @resp_vq: VirtIO response queue notified by the IPCC receive path.
+ * @power_notify_done: Completion for the firmware acknowledgment.
+ * @power_notify_lock: Serializes power notifications and teardown.
+ * @power_notify_pending: Indicates an outstanding acknowledgment.
+ * @state_lock: Protects shutdown state and response queue access.
+ * @shutting_down: Prevents callbacks from accessing teardown state.
+ * @power_notify_irq_wake: Whether IRQ wake was enabled.
+ * @power_notify_irq: Power-notify acknowledgment IRQ number.
+ */
+struct dcp_ipcc {
+	struct mbox_client client;
+	struct mbox_chan *power_chan;
+	struct virtqueue *resp_vq;
+	struct completion power_notify_done;
+	/* Serializes power notifications and teardown. */
+	struct mutex power_notify_lock;
+	atomic_t power_notify_pending;
+	/* Protects shutdown state and response queue access. */
+	spinlock_t state_lock;
+	bool shutting_down;
+	bool power_notify_irq_wake;
+	int power_notify_irq;
+};
+
+int dcp_ipcc_init(struct dcp_ipcc *ipcc, struct device *dev);
+void dcp_ipcc_set_resp_vq(struct dcp_ipcc *ipcc, struct virtqueue *resp_vq);
+void dcp_ipcc_deinit(struct dcp_ipcc *ipcc);
+int dcp_ipcc_send_power_notify(struct dcp_ipcc *ipcc);
+
+#endif /* __DCP_IPCC_H__ */

-- 
2.43.0

