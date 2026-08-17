Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7572C3261
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786942121; cv=none; b=OtWxQUpapgAHfFP/+uC+hKMIY8W/NK5EKNzfRNzTB50yyIXlAxAgjGZ6QXMu148tif2OaNvf5Iq+MydOz/B2BIZAohAWSfpQzGRIpjelNNnyb96oUDI9LMgXZMbRqphEUL/pNdCMFC/JuJwyxM+Jtsk60kI3z6aqiBI1dq2ob/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786942121; c=relaxed/simple;
	bh=vyyAKW+sDxkJvnWkRtGMDfJQbird7CY22fXpG75dfI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U6SGJ86mWNHupTibQVB5ObcehqztMEAh1xaxRrjm8/ZBHlj9tmHIXPNLeYmlLmeuKdXti3HbnDDgsmxFISTUokzT4fQYRN60ndY7ajqovat6+II2g16QmQuKbdm2PhLbNkoDzo4SyuEcGuA2lq+xSVkDpjSNqksKn+gcjLVlwi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jBMwGdK9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rq21t6/X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBMwGdK9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rq21t6/X"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLCVU7855182
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnJNXuCmyusrhVQ5qCCdytU60hZXzPi/toGazcunr3U=; b=jBMwGdK9HwDpevJ+
	rux7M8rbogOqak+z1h8o0F/65/2ZWH1ceAO30uzQBJUSrdJXjjM4Rn15gqkkwBfx
	2KNRpNz8UDNVWf67s5UhXkTS+lauL2K3oI++tWL6uGOynfDxyzG477686ru+x27J
	X3To5VgsZehwbqBVQHiwd5DFmyF2uE+2OkF/unhanTD1bPSuID4fuqqnG5lp7s2N
	haqkZmFX8ATkcodAvMgIrXLtfdt7vjm4xQtI5/y4uJVuYWgODthskV7DKDGI6z9b
	iy5pmHWIS7c8miVAMaqcWfHjYzAQTnUCHT+54C/fOceqcRZ1JbMNgprII9qEFbKZ
	h8Bthw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghwn559-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:48:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484ba00601so2913097b3a.1
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 21:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786942119; x=1787546919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnJNXuCmyusrhVQ5qCCdytU60hZXzPi/toGazcunr3U=;
        b=Rq21t6/XBunQPzpQXMU436910dE1ZI2LLam8oIRhIva7UiUcO4yu1SYbmFpbZN6Uij
         jPk8yWsEipuX+BedbBwuEIrLIWd7pzZsGECguCfaNjOSgjScOcarLtJ1WOBn8cKSC766
         /m8d+XjmmbImb4BaXHnv9GKG9fNnTb9ZRZ+ZLtDrV7mVm9+7ZS9+8kKcy2nygwELAuSY
         cO/i71CIOkDmCW6sItw+P12CfQiFKuQBdO84RYKhND07Ct6O6XTmYge3OqPZ3BVHD1jv
         sHCd/Gm4tctQilCX7YCU74wHnk4QcgLhgT5tzUxCZEVHOx/VAslL/BuDFRSYQF+o8ujP
         UDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786942119; x=1787546919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnJNXuCmyusrhVQ5qCCdytU60hZXzPi/toGazcunr3U=;
        b=aqCtVUlP3DPTGURHm2lAUKtQYrWTvyubPqTRuAYLQlyQjKjnDUZliXTLBSOp7iGWR2
         qnSPqwSLxP3VXbiRY4ZcG2fkuACWZXHPEIgXbsjvU/4HBrnVWPY3sPyGrKLKgmU0V22q
         iAkItra2t7mIrbD6i2HacGlHV2sBEx1JUu5PQGmIqfPKVsJvSJUvqK6bQUfK2R+UFJ/5
         pXQqoQnuRhW+rdvXNAc0GUysxLXic7KuGYQMrHKwSaqsN83xbEsQj5Di34TWVptde7tO
         CECqXPNPojJguD2JoxbqDX9wDdjjuhO8ED2MsR3dFQRHVrejJttZo7yWrVd2Xrwi/mO+
         uxXg==
X-Forwarded-Encrypted: i=1; AHgh+Rrn0IcVEmscjnX84a1NVPM6bkUvamR3jjMcW2pxalw2tdvvo/5WS/Vdubi9XPxwJJGC1vYX+8wnv/8Kig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPVZG33jwNE0SE3f5FmoYBXQcEMj6Ws5H4IY0WhSgE0fYY9gdx
	02FQYTwoC+ngPyCJIw4Jk5W15/rhG26bViW6xb/+2TrjyXZ1fpdf8K+Fvgh2XLwL59wBycYWTz3
	WpOG3Xmx4eTrwNZo8epMWLEf9C4Kld5+YZoX38icXw8fls0aaPR96GDUqMDdKGWDYtA==
X-Gm-Gg: AR+sD1038itkq0gWz27wWwiCK7dvlzEtt0wZ7xCrB/mD+z6A4FzgeeRPaVUciVMb85q
	+ZWuAGzPzP1jeMUTsHBUCZ3ulIm+x2kXbNuHwDdRgr48gWAji1+bvB4KUvSvRCzIflpBAPnUSld
	BxYSZOys2ZmTHzn3n30fRrOdNKRzgAfT41zvQCb1e9YnK1g0nZYPnqy7AJvszf4MSo4DVPtRZ9Z
	mLDrM5fJWUmVo+9TuZ76CMpAvrbc3IwWv27MQgWMrhQLMg8yQZ6JZVy0Y0aVGhwZE3W37DOJrBF
	Nuw6GEU1e152DnrjrcdF7+acj4OJgSgCqxUMg1HVo7x3kiBAMqJLsCk+8Wp3KFi6lMH4Mz1NSKO
	qLsFLUjqF9VJ+l9ICUwxJPtBwyM54ieWr
X-Received: by 2002:a05:6a00:32c3:b0:847:881c:7026 with SMTP id d2e1a72fcca58-84fde1501cemr21344768b3a.3.1786942118795;
        Sun, 16 Aug 2026 21:48:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:32c3:b0:847:881c:7026 with SMTP id d2e1a72fcca58-84fde1501cemr21344741b3a.3.1786942118322;
        Sun, 16 Aug 2026 21:48:38 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d046638sm2149250b3a.27.2026.08.16.21.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:48:37 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:17:41 +0530
Subject: [PATCH v2 06/15] accel/qda: Create compute context bank devices on
 QDA compute bus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-qda-v2-v2-6-69a02e9090d4@oss.qualcomm.com>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
In-Reply-To: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786942058; l=7659;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=vyyAKW+sDxkJvnWkRtGMDfJQbird7CY22fXpG75dfI8=;
 b=9iSkBuK0+IvRZzeuUuxCA3txvr7RXBv9HocPubw7VSQhNZIb23asi+VU2A7GF556vKccuuFT5
 CEcv2JEnaPyDLM5cvWl2HDbdbG6+lkEv61S+iefHgPM0Vj8R3WH6BDD
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: y2SE3phLAutZlssoWqCesf-j_gRAlxaT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX1/mL59cjuWwo
 9jraSHiV4sUIMw9qBpeCrosbJU0uIvat+VwQFk21qc91BhpQj72QC4NeQJQ3nCxczbpmtHIoOnr
 6V+D9T/OjQx97hsNPdsJ0kWCIx9+hkJzekWJLMXNOBg0kmn5l0LMYkoTg6kg/DyzIDYDwU9G7Ac
 vPtX0uFvAFQlLrNMykDJOZDLZ/VnHshZeXY+avLuYZgz6y40OoDsWhdxvtftOxThRHA5Qgj6r9L
 MFU4ze45RqCfHoH1GoXndDSrLyLW4f2suwEh340+0zRxKhlaozNmkdfB/kwJT5n2fZ9BrLV/KRv
 r2PPtXGcl3QCUEwxJTariHEr1SaAJscbD8uaazy92mxSHoZKr5rG7fb9zGBIc3ADFpRBDicjmol
 P4IEYZXupSt/RX7kbSTOfQulbGNg5J1BgvWrSsRpX6Tm7ZKdAhlWQQoHnUCmA0he3A4hM2zAiWh
 F/XVULAQ/hfK03rctnw==
X-Proofpoint-GUID: y2SE3phLAutZlssoWqCesf-j_gRAlxaT
X-Authority-Analysis: v=2.4 cv=DdknbPtW c=1 sm=1 tr=0 ts=6a8292a7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_bi6IaUD7rjJwiY1G1oA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfXw2dfDV9i79xx
 B8hZAt2Ko+1e8Adiqsdiex3u1L64aecKU/x2hYucLqchfMBXcKjD0h9/p/NFbFvaW31gINbXaKz
 hU//Yh7mqogrkjqB0BgztZaTXMAzxZE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170033

Introduce the CB (compute context bank) device management layer. Each
DSP domain node in the device tree may contain child nodes with
compatible "qcom,fastrpc-compute-cb", each representing one IOMMU
context bank. Enumerate those child nodes during RPMsg probe and create
a corresponding device on the qda-compute-cb bus for each one, so that
the IOMMU subsystem assigns each of them its own domain and DSP buffer
mappings are isolated per session.

qda_cb_populate() walks the child nodes and creates one CB device each,
unwinding everything it created if any single creation fails.
qda_destroy_cb_device() removes a device from its IOMMU group before
unregistering it so the domain is released cleanly.

CB devices are created before the DRM device is registered and destroyed
after it is unplugged, so user space cannot reach a CB that does not
exist yet, and no ioctl can be in flight while one is torn down.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v2:
- Use qda_cb_device_create() and pass the name as a format string
  instead of formatting into a stack buffer (Dmitry Baryshkov)
- Fail probe on the first CB creation error and unwind, instead of
  counting successes and continuing (Dmitry Baryshkov)
- Drop the impossible NULL check in qda_destroy_cb_device()
  (Dmitry Baryshkov)
- Use drm_*() logging consistently instead of mixing with dev_*()
  (Dmitry Baryshkov)
---
 drivers/accel/qda/Makefile    |  1 +
 drivers/accel/qda/qda_cb.c    | 86 +++++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_cb.h    | 32 ++++++++++++++++
 drivers/accel/qda/qda_drv.c   |  1 +
 drivers/accel/qda/qda_drv.h   |  3 ++
 drivers/accel/qda/qda_rpmsg.c | 16 +++++++-
 6 files changed, 138 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 424176f652a5..143c9e4e789e 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -6,6 +6,7 @@
 obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 
 qda-y := \
+	qda_cb.o \
 	qda_drv.o \
 	qda_rpmsg.o
 
diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
new file mode 100644
index 000000000000..9c5ef32f351e
--- /dev/null
+++ b/drivers/accel/qda/qda_cb.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/dma-mapping.h>
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/iommu.h>
+#include <linux/qda_compute_bus.h>
+#include <linux/slab.h>
+#include <drm/drm_print.h>
+#include "qda_drv.h"
+#include "qda_cb.h"
+
+int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
+{
+	struct qda_cb_dev *entry;
+	struct device *cb_dev;
+	u32 sid = 0;
+
+	if (of_property_read_u32(cb_node, "reg", &sid))
+		drm_info(&qdev->drm_dev, "No stream ID in DT node %pOFn, using 0\n", cb_node);
+
+	cb_dev = qda_cb_device_create(qdev->dev, DMA_BIT_MASK(32), cb_node,
+				      "qda-cb-%s-%u", qdev->dsp_name, sid);
+	if (IS_ERR(cb_dev)) {
+		drm_err(&qdev->drm_dev, "Failed to create CB device for SID %u: %ld\n",
+			sid, PTR_ERR(cb_dev));
+		return PTR_ERR(cb_dev);
+	}
+
+	entry = kzalloc_obj(*entry);
+	if (!entry) {
+		qda_destroy_cb_device(cb_dev);
+		return -ENOMEM;
+	}
+
+	entry->dev = cb_dev;
+	list_add_tail(&entry->node, &qdev->cb_devs);
+
+	return 0;
+}
+
+void qda_cb_unpopulate(struct qda_dev *qdev)
+{
+	struct qda_cb_dev *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &qdev->cb_devs, node) {
+		list_del(&entry->node);
+		qda_destroy_cb_device(entry->dev);
+		kfree(entry);
+	}
+}
+
+int qda_cb_populate(struct qda_dev *qdev, struct device_node *parent_node)
+{
+	struct device_node *child;
+	int ret;
+
+	for_each_child_of_node(parent_node, child) {
+		if (!of_device_is_compatible(child, "qcom,fastrpc-compute-cb"))
+			continue;
+
+		ret = qda_create_cb_device(qdev, child);
+		if (ret) {
+			drm_err(&qdev->drm_dev, "Failed to create CB device for: %s\n",
+				child->name);
+			of_node_put(child);
+			qda_cb_unpopulate(qdev);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+void qda_destroy_cb_device(struct device *cb_dev)
+{
+	struct iommu_group *group;
+
+	group = iommu_group_get(cb_dev);
+	if (group) {
+		iommu_group_remove_device(cb_dev);
+		iommu_group_put(group);
+	}
+
+	device_unregister(cb_dev);
+}
diff --git a/drivers/accel/qda/qda_cb.h b/drivers/accel/qda/qda_cb.h
new file mode 100644
index 000000000000..bd83d64fa425
--- /dev/null
+++ b/drivers/accel/qda/qda_cb.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_CB_H__
+#define __QDA_CB_H__
+
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/of.h>
+#include "qda_drv.h"
+
+struct qda_cb_dev {
+	struct list_head node;
+	struct device *dev;
+};
+
+/*
+ * Compute bus (CB) device management
+ */
+int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node);
+void qda_destroy_cb_device(struct device *cb_dev);
+
+/*
+ * Transport-agnostic CB device population/teardown.
+ * Called by any transport layer (RPMsg, etc.) during probe/remove.
+ */
+int qda_cb_populate(struct qda_dev *qdev, struct device_node *parent_node);
+void qda_cb_unpopulate(struct qda_dev *qdev);
+
+#endif /* __QDA_CB_H__ */
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 9a64f7dfcb6e..09b6d5ac390b 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -52,6 +52,7 @@ struct qda_dev *qda_alloc_device(struct device *dev)
 	if (IS_ERR(qdev))
 		return ERR_CAST(qdev);
 
+	INIT_LIST_HEAD(&qdev->cb_devs);
 	return qdev;
 }
 
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index 4a27fb40c280..3bd41b9593fa 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -7,6 +7,7 @@
 #define __QDA_DRV_H__
 
 #include <linux/device.h>
+#include <linux/list.h>
 #include <linux/rpmsg.h>
 #include <linux/types.h>
 #include <drm/drm_device.h>
@@ -37,6 +38,8 @@ struct qda_dev {
 	struct rpmsg_device *rpdev;
 	/** @dev: Underlying Linux device */
 	struct device *dev;
+	/** @cb_devs: Compute context-bank (CB) child devices */
+	struct list_head cb_devs;
 	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
 	const char *dsp_name;
 };
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
index 6a6e58333a68..723b3e61bf0a 100644
--- a/drivers/accel/qda/qda_rpmsg.c
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -5,6 +5,7 @@
 #include <linux/rpmsg.h>
 #include <drm/drm_print.h>
 
+#include "qda_cb.h"
 #include "qda_drv.h"
 
 static struct qda_dev *qda_rpmsg_alloc_and_init_qdev(struct rpmsg_device *rpdev)
@@ -40,6 +41,7 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
 	 */
 	drm_dev_unplug(&qdev->drm_dev);
 	qdev->rpdev = NULL;
+	qda_cb_unpopulate(qdev);
 }
 
 static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
@@ -57,7 +59,19 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
 		return ret;
 	}
 
-	return qda_register_device(qdev);
+	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
+	if (ret)
+		return ret;
+
+	ret = qda_register_device(qdev);
+	if (ret)
+		goto err_unpopulate;
+
+	return 0;
+
+err_unpopulate:
+	qda_cb_unpopulate(qdev);
+	return ret;
 }
 
 static const struct of_device_id qda_rpmsg_id_table[] = {

-- 
2.34.1

