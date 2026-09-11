Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F812EEE67
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 02:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789094411; cv=none; b=V+Ed+0dK/Jxsl3UKEHLxcwTN29Jn9fxrnAxD1HQGGWu6S82aQ+NsX+XHgM5+rLDmRBmLZRov/1Zm9860CjKHffEsSS3PeBvc8mlbQxURl0iIjrHWxFjBj/aJ75OQS/Dx3Ci+Tn/idjbCGUuk8z0yn6do94+98HFNcNV6SWEzr8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789094411; c=relaxed/simple;
	bh=o4SF+Ujcn8311JxBR+4dA7oZjLzIGoPNLBRjQdYwuVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xg5pNUhooaevoLv/lddKpOjTugFo/zXmdf6Yeb57j4AFlPhxcuU8wsyGwll57M4pzZ4nai1iMLxoOOvrYDM8sWwxMWE7UAhInkndQuLaMKsMtiqlWzX3qOcEUvnz2GqhluBXK4T09CtNxPglkIXYsVpFmMOufU1gjbLhUDCNyu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYOFquW/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DtMy3Qp7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYOFquW/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DtMy3Qp7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B12RuY2796843
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 02:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wYPxD3VB4QfnpVS1pTlBgJtHNIWG89tX8L1/uM/KgW0=; b=TYOFquW/5OCD0Gor
	u3CpBwlRYqnRyi/PpRDfdA/LhUQz0252xwVHaYCfsHC2hX6LjsT5QSKpjO1hELdi
	y4F/mq1Rs825GeMNp1mMjTxF6UcQwFy5vbM86yQfp1sc29R2X5vtt5TPWrn6DeJ4
	MikGDh45qIHIyKUNJGnwkO+24DCTcpyXndvF5kGzsYKVyJvEcLECpCuk2/YJq5p6
	4g05kDFNDomYDB9Qw0GBy136cRDHlOqZn8yxY24AQnkBp0IayRmVtsIhgfsvu0RH
	t/rpzLNPih8AXLaCoLd1AlYdDKzgxmS8Awa1kDMhy8PARY1hrsugiruNnOJlp38Q
	Lw/wmQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwx9u5jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 02:40:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc2229450b4so416254a12.1
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 19:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789094407; x=1789699207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYPxD3VB4QfnpVS1pTlBgJtHNIWG89tX8L1/uM/KgW0=;
        b=DtMy3Qp707DqX7PDaz5RfKs18q7QtfPidkP7gkaKmS4OXW9wzKX9pz0mSax+U6WSlF
         rEJgkRV3Qyf1jaMyxc3BnJiCzi5eI+fLG0ohoDWk7o5oYSpcuYoqz2ThAms6VPLzTx1Z
         Di/II3xncRqwIHZ+ID+qRgcO5XBCcQq/93bjlFvRs5FuzPYkYgoAwWOVPvRYsqtRamNo
         IZ+qMEeNAkaJieJitvpYlgUxqJ22usvZuYuljC64i4WpoHb7SME4s68Nfn3PQ0DKsd6U
         fgxUNLO7PgPFmREKd5MqwiCs8JkhYrIPxJQW6+qXwbZKkSCYtbNtZkve7ILGlhNicysu
         hipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789094407; x=1789699207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wYPxD3VB4QfnpVS1pTlBgJtHNIWG89tX8L1/uM/KgW0=;
        b=hSXkRvg1L9xtCQUWg05eX39ke7e0zF11+xIqOA91t7H/2EgvAxLMI9CGue8jE2FhXf
         WYfEyzyUcG3woOHyZxBfW8X16TCTySy1F1QtqtKV4UyG53BRgHHKjEyGrKebsntOgwaa
         kKIVGbKOwG6hoyOqeQf80JHaZcv4psQp+aEiD3AuD5LLQE2N0XLmF4oYOumYm27R1aMV
         65q9THu6qJXM7OUPuCP1hC3D5bvpM6quyb+WD1KWzEJnemH7wHfWIjfYvdZCAypUN3WY
         sB53R0LJcf/4cnPDxaKr9aF+fjDjzUeT3n3eb2wA/02qkyhlXXQrLs+sYORkZSgUVsc/
         BOCQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8ZincikEbp15GGughX38Qdoy7FwcH5APtODzBF8KZK8LEDnSmKDleIRDXpWkz1zW1EQ8wln0BDZQxBg==@vger.kernel.org
X-Gm-Message-State: AFuF++lFjczNZ53/t/B1D5QmSGUed0PsuX0Y022TrWLtz2m2O6QgbYbO
	CX9nYYViAZ2bDGly56kAaMDdaW4Ot/x1TA594pNCqB5V68g51k0xbD+SpSsLBCBCsoqjvRt7ZNI
	4WfaT8i8YqKyTQYjKk28Zo8hTKOH7xklYQpi2AGuN2a5M/6gCq/qdrlEQhfGJqI/8/g==
X-Gm-Gg: AYBFou2PcbwyszybS/TC6QJ/F+koFkc1jkaYtxpYMucbn9n1tLQw13DUkIKB0hxLNOh
	33deZcCg8+qj19QUL0lsWHluj8o+id6PmE67BR3lV1CnQzvDAmapzvJ2rfJJBIdXlS9xO5mGcpD
	cH8JHj9NRJuL8P5Imi//O18ZPaf9GCTHMJz1ov7p9TST7CpH+IrvydsDLYlJUDLDU9bift6Vp2F
	TcpCcTZ++iwoh7RDF3ZWGB2FkYGOX8cy2LAUwgazOJh6OijDaAfh/uPFIIsJtXTyP9jJ2EwwPnL
	O3MeyRwGB5DVatJmZEfBT4W74BfIIlYQI7YRNAWjKe+lcL6M+/H/PEKr3WoF4EMjVd5Cqfc1a82
	4gxOuq78emz/BIVGbLFEFyrfucNbIYWU=
X-Received: by 2002:a05:6a20:7f96:b0:3cd:9dea:2be1 with SMTP id adf61e73a8af0-3daecb20df1mr3623467637.0.1789094406619;
        Thu, 10 Sep 2026 19:40:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f96:b0:3cd:9dea:2be1 with SMTP id adf61e73a8af0-3daecb20df1mr3623410637.0.1789094406029;
        Thu, 10 Sep 2026 19:40:06 -0700 (PDT)
Received: from hu-renjiang-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e95075sm2094481eec.11.2026.09.10.19.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:40:05 -0700 (PDT)
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 08:09:49 +0530
Subject: [PATCH v2 1/2] media: qcom: iris: add firmware debug logging
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-media-qcom-iris-fw-log-v2-1-6c46288f3ffb@oss.qualcomm.com>
References: <20260911-media-qcom-iris-fw-log-v2-0-6c46288f3ffb@oss.qualcomm.com>
In-Reply-To: <20260911-media-qcom-iris-fw-log-v2-0-6c46288f3ffb@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789094397; l=21967;
 i=renjiang.han@oss.qualcomm.com; s=20241001; h=from:subject:message-id;
 bh=o4SF+Ujcn8311JxBR+4dA7oZjLzIGoPNLBRjQdYwuVw=;
 b=JsacP/07Vtj1xOE6DiI1u5j5mFVZmCAx6Tjo7B6k2060eL/hW9+KhbYD32NttLIV29pUA5GDT
 T6lYGzufVm+Bc/qa94cw0MWUVHd0WdNmWPZCTW5f2ADHfPUhdY2Xy3E
X-Developer-Key: i=renjiang.han@oss.qualcomm.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDAzMyBTYWx0ZWRfX7ESSjgSy0o0Q
 +8jGhMzRA/144/0f0RB/ZpucQwJq+11LIm0W8153rt0QDcNaAyg9c+F2AOmfq4UGpDdofs9CxWt
 S+ye2+NRSex/DHzbKH0iNi43Q2Q6uFfQPQzmwQoGjyLOqh/MeLZbEnRSwN6yDH55OJ1vyagtCcs
 8I/SBLyttsaVYxEdN9mds+iJuEsYdb0DCniWmh3QVujGdVJ4uUP2AYUh0hDZkTQekYH2BQx40UL
 +zGTTDWsMXsqEsiFCO25V4jJ3Um65p4TRZbvr3Pzeyt11dVPi+DApY/2K2LcxXMMf/h/h/Rrs/o
 +2qLNLsn3g9LyxjEgI9BpJaKjr7UyvYjrXiYiQMTXpsmYZzxo4yT/zscLdLhLgB0Tjw3Axszlz6
 Mjp4iIdx2LdU9MyTpmB3bU6YZ5tkYwqo3ZrIwf+rU7H0xvvKzuCSHJwKLvFobYXFQrz5KZqnEou
 Y7kAbCltBmwFQjCXGZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDAzMyBTYWx0ZWRfXy2sJU/pvmhOT
 yy3Yd3zeI4YKXYfex0h1MtKYw8VXQj/XZfZnXC+E1yV1gxbueeGB/u3p/ZIlfj4wEQVG+moHstC
 s6NT9+cDuIs7egzpMbEF/NWQN+fx91g=
X-Proofpoint-GUID: b04zRscoGoj7vsf6W9cEsEV6vL-PhUmD
X-Authority-Analysis: v=2.4 cv=TupzFzXh c=1 sm=1 tr=0 ts=6aa36a08 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=LL-4VRp1aN1YgPNzIe8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: b04zRscoGoj7vsf6W9cEsEV6vL-PhUmD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110033

Iris does not provide runtime control for firmware debug logging, which
makes firmware-side failures harder to diagnose without rebuilding or
reloading the driver.

Add a debugfs fw_level file under the Iris debugfs directory so the
firmware debug log mask can be configured at runtime. Keep the default
mask limited to firmware error and fatal messages to avoid enabling
verbose logging by default.

Store the mask per Iris core and normalize values written through
debugfs so userspace reads back the same mask that is sent to firmware.
Program the firmware debug configuration during core initialization,
runtime resume, and before opening a new session. This allows a
fw_level value written before session start to take effect without
requiring a driver reload, and preserves the setting after firmware is
reinitialized.

Add HFI Gen1 and Gen2 support for sending the firmware debug
configuration, and flush firmware debug messages from the debug queue.
Emit firmware error and fatal messages with dev_err_ratelimited(), and
use dev_dbg() for other firmware debug messages. Bound firmware log
printing by the packet size so messages do not need to be NUL
terminated by firmware.

Treat failures to configure firmware debug logging as non-fatal, since
they should not prevent video sessions from running.

Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 drivers/media/platform/qcom/iris/iris_core.h       |  7 +++-
 drivers/media/platform/qcom/iris/iris_debugfs.c    | 42 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_debugfs.h    | 14 +++++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 43 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_common.h | 10 +++++
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 30 +++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  8 ++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 31 +++++++++++++---
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 21 +++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  3 ++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 29 +++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 12 ++++--
 drivers/media/platform/qcom/iris/iris_probe.c      |  6 +++
 drivers/media/platform/qcom/iris/iris_vb2.c        |  7 +++-
 16 files changed, 253 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc4390bc596f6239fefa2a2ad2cd3a2bb..105a66e1b0af44f010730a899be26cae23d76c73 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -2,6 +2,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_common.o \
              iris_core.o \
              iris_ctrls.o \
+             iris_debugfs.o \
              iris_firmware.o \
              iris_hfi_common.o \
              iris_hfi_gen1.o \
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 24da60448cf24820af7947b85eb7208555ab7786..a8e34c456ce3f3f178ca66a278d06d1ab50dafc4 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -31,6 +31,7 @@ enum domain_type {
 };
 
 struct qcom_ubwc_cfg_data;
+struct dentry;
 
 /**
  * struct iris_core - holds core parameters valid for all instances
@@ -65,7 +66,9 @@ struct qcom_ubwc_cfg_data;
  * @command_queue: shared interface queue to send commands to firmware
  * @message_queue: shared interface queue to receive responses from firmware
  * @debug_queue: shared interface queue to receive debug info from firmware
- * @lock: a lock for this strucure
+ * @root: debugfs root directory
+ * @fw_debug: firmware debug log mask
+ * @lock: a lock for this structure
  * @response_packet: a pointer to response packet from fw to driver
  * @header_id: id of packet header
  * @packet_id: id of packet
@@ -110,6 +113,8 @@ struct iris_core {
 	struct iris_iface_q_info		command_queue;
 	struct iris_iface_q_info		message_queue;
 	struct iris_iface_q_info		debug_queue;
+	struct dentry				*root;
+	u32					fw_debug;
 	struct mutex				lock; /* lock for core related operations */
 	u8					*response_packet;
 	u32					header_id;
diff --git a/drivers/media/platform/qcom/iris/iris_debugfs.c b/drivers/media/platform/qcom/iris/iris_debugfs.c
new file mode 100644
index 0000000000000000000000000000000000000000..6122b994ad0aa70c0c4f26ea4ce076f1b025f810
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_debugfs.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/debugfs.h>
+
+#include "iris_core.h"
+#include "iris_debugfs.h"
+
+static int iris_fw_level_get(void *data, u64 *val)
+{
+	struct iris_core *core = data;
+
+	*val = READ_ONCE(core->fw_debug);
+
+	return 0;
+}
+
+static int iris_fw_level_set(void *data, u64 val)
+{
+	struct iris_core *core = data;
+
+	WRITE_ONCE(core->fw_debug, (u32)val & IRIS_FW_DEBUG_LOGMASK);
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(iris_fw_level_fops, iris_fw_level_get,
+			 iris_fw_level_set, "0x%08llx\n");
+
+void iris_debugfs_init(struct iris_core *core)
+{
+	core->root = debugfs_create_dir("iris", NULL);
+	debugfs_create_file("fw_level", 0600, core->root, core,
+			    &iris_fw_level_fops);
+}
+
+void iris_debugfs_deinit(struct iris_core *core)
+{
+	debugfs_remove(core->root);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_debugfs.h b/drivers/media/platform/qcom/iris/iris_debugfs.h
new file mode 100644
index 0000000000000000000000000000000000000000..aa3cb97eb2b2e71dfe6a0db6ccfd430256cdb6fa
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_debugfs.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_DEBUGFS_H__
+#define __IRIS_DEBUGFS_H__
+
+struct iris_core;
+
+void iris_debugfs_init(struct iris_core *core);
+void iris_debugfs_deinit(struct iris_core *core);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 8769ec61f11769e004945063381d9baddb302b06..706a4d321ee2899aadc9f650d0d9a864fdc6769b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -87,9 +87,44 @@ int iris_hfi_core_init(struct iris_core *core)
 	if (ret)
 		return ret;
 
+	if (hfi_ops->sys_set_debug) {
+		ret = hfi_ops->sys_set_debug(core);
+		if (ret)
+			dev_warn(core->dev,
+				 "failed to configure firmware debug logging: %d\n",
+				 ret);
+	}
+
 	return hfi_ops->sys_interframe_powercollapse(core);
 }
 
+int iris_hfi_set_debug(struct iris_core *core)
+{
+	const struct iris_hfi_sys_ops *hfi_ops = core->hfi_sys_ops;
+	int ret = 0;
+
+	if (!hfi_ops->sys_set_debug)
+		return 0;
+
+	ret = pm_runtime_resume_and_get(core->dev);
+	if (ret < 0)
+		return ret;
+
+	mutex_lock(&core->lock);
+	if (core->state != IRIS_CORE_INIT) {
+		ret = 0;
+		goto unlock;
+	}
+
+	ret = hfi_ops->sys_set_debug(core);
+
+unlock:
+	mutex_unlock(&core->lock);
+	pm_runtime_put_autosuspend(core->dev);
+
+	return ret;
+}
+
 irqreturn_t iris_hfi_isr(int irq, void *data)
 {
 	disable_irq_nosync(irq);
@@ -163,6 +198,14 @@ int iris_hfi_pm_resume(struct iris_core *core)
 	if (ret)
 		goto err_suspend_hw;
 
+	if (ops->sys_set_debug) {
+		ret = ops->sys_set_debug(core);
+		if (ret)
+			dev_warn(core->dev,
+				 "failed to configure firmware debug logging: %d\n",
+				 ret);
+	}
+
 	ret = ops->sys_interframe_powercollapse(core);
 	if (ret)
 		goto err_suspend_hw;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519962cb958b0e330a6d018310c3450..d8bc0862c54bd229d575113752526d51e863e303 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -105,9 +105,18 @@ struct iris_hfi_prop_type_handle {
 	int (*handle)(struct iris_inst *inst, u32 plane);
 };
 
+#define IRIS_FW_DEBUG_LOW	0x00000001
+#define IRIS_FW_DEBUG_MEDIUM	0x00000002
+#define IRIS_FW_DEBUG_HIGH	0x00000004
+#define IRIS_FW_DEBUG_ERROR	0x00000008
+#define IRIS_FW_DEBUG_FATAL	0x00000010
+#define IRIS_FW_DEBUG_PERF	0x00000020
+#define IRIS_FW_DEBUG_LOGMASK	0x0fffffff
+
 struct iris_hfi_sys_ops {
 	int (*sys_init)(struct iris_core *core);
 	int (*sys_image_version)(struct iris_core *core);
+	int (*sys_set_debug)(struct iris_core *core);
 	int (*sys_interframe_powercollapse)(struct iris_core *core);
 	int (*sys_pc_prep)(struct iris_core *core);
 
@@ -153,6 +162,7 @@ u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries);
 u32 iris_hfi_get_v4l2_transfer_char(u32 hfi_characterstics);
 u32 iris_hfi_get_v4l2_matrix_coefficients(u32 hfi_coefficients);
 int iris_hfi_core_init(struct iris_core *core);
+int iris_hfi_set_debug(struct iris_core *core);
 int iris_hfi_pm_suspend(struct iris_core *core);
 int iris_hfi_pm_resume(struct iris_core *core);
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index f6e9cbfccd09e4013e842c92c8272ddeb1b166d3..55e2fade62e0450b8ce5e5c928b746dcb6ef8387 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -53,6 +53,35 @@ static int iris_hfi_gen1_sys_image_version(struct iris_core *core)
 	return iris_hfi_queue_cmd_write_locked(core, &packet, packet.hdr.size);
 }
 
+static int iris_hfi_gen1_sys_set_debug(struct iris_core *core)
+{
+	struct hfi_sys_set_property_pkt *pkt;
+	struct hfi_debug_config *hfi;
+	u32 fw_debug;
+	u32 packet_size;
+	int ret;
+
+	packet_size = struct_size(pkt, data, 1) + sizeof(*hfi);
+	pkt = kzalloc(packet_size, GFP_KERNEL);
+	if (!pkt)
+		return -ENOMEM;
+
+	hfi = (struct hfi_debug_config *)&pkt->data[1];
+
+	pkt->hdr.size = packet_size;
+	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
+	pkt->num_properties = 1;
+	pkt->data[0] = HFI_PROPERTY_SYS_DEBUG_CONFIG;
+	fw_debug = READ_ONCE(core->fw_debug) & IRIS_FW_DEBUG_LOGMASK;
+	hfi->config = fw_debug;
+	hfi->mode = fw_debug ? HFI_DEBUG_MODE_QUEUE : 0;
+
+	ret = iris_hfi_queue_cmd_write_locked(core, pkt, pkt->hdr.size);
+	kfree(pkt);
+
+	return ret;
+}
+
 static int iris_hfi_gen1_sys_interframe_powercollapse(struct iris_core *core)
 {
 	struct hfi_sys_set_property_pkt *pkt;
@@ -1149,6 +1178,7 @@ static struct iris_inst *iris_hfi_gen1_get_instance(void)
 static const struct iris_hfi_sys_ops iris_hfi_gen1_sys_ops = {
 	.sys_init = iris_hfi_gen1_sys_init,
 	.sys_image_version = iris_hfi_gen1_sys_image_version,
+	.sys_set_debug = iris_hfi_gen1_sys_set_debug,
 	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
 	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 275f3fea3d2aabe26a2a0498c78c09ec28765b24..887f96c5623809beb1c8e911949b314b9bd029da 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -80,6 +80,14 @@
 #define HFI_BUFFER_INTERNAL_SCRATCH_1			0x7
 #define HFI_BUFFER_INTERNAL_SCRATCH_2			0x8
 
+#define HFI_DEBUG_MODE_QUEUE				0x01
+
+struct hfi_debug_config {
+	u32 config;
+	u32 mode;
+};
+
+#define HFI_PROPERTY_SYS_DEBUG_CONFIG			0x1
 #define HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL		0x5
 #define HFI_PROPERTY_SYS_IMAGE_VERSION			0x6
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index bfd7495bf44f064091afb3245ec53cd18d323068..903b60a7380559f4711b0907fb1de405fe1707f3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -674,16 +674,35 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 
 static void iris_hfi_gen1_flush_debug_queue(struct iris_core *core, u8 *packet)
 {
-	struct hfi_msg_sys_coverage_pkt *pkt;
+	struct hfi_msg_sys_debug_pkt *pkt;
+	struct hfi_pkt_hdr *hdr;
+	u32 log_size;
+	u8 *log;
 
 	while (!iris_hfi_queue_dbg_read(core, packet)) {
-		pkt = (struct hfi_msg_sys_coverage_pkt *)packet;
+		hdr = (struct hfi_pkt_hdr *)packet;
 
-		if (pkt->hdr.pkt_type != HFI_MSG_SYS_COV) {
-			struct hfi_msg_sys_debug_pkt *pkt =
-				(struct hfi_msg_sys_debug_pkt *)packet;
+		if (hdr->size <= sizeof(*hdr))
+			continue;
+
+		if (hdr->size > IFACEQ_CORE_PKT_SIZE)
+			continue;
+
+		if (hdr->pkt_type != HFI_MSG_SYS_COV) {
+			pkt = (struct hfi_msg_sys_debug_pkt *)packet;
+
+			if (hdr->size <= sizeof(*pkt))
+				continue;
+
+			log = pkt->msg_data;
+			log_size = hdr->size - sizeof(*pkt);
+			if (pkt->msg_size < log_size)
+				log_size = pkt->msg_size;
 
-			dev_dbg(core->dev, "%s", pkt->msg_data);
+			if (pkt->msg_type & (IRIS_FW_DEBUG_ERROR | IRIS_FW_DEBUG_FATAL))
+				dev_err_ratelimited(core->dev, "%.*s", (int)log_size, log);
+			else
+				dev_dbg(core->dev, "%.*s", (int)log_size, log);
 		}
 	}
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07b7bcd8db21d4345bc900356b4ec3..cca3c2e8668802d45ff309928a731b04a78a1bcc 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -17,6 +17,9 @@
 #define SYS_IFPC_PKT_SIZE (sizeof(struct iris_hfi_header) + \
 	sizeof(struct iris_hfi_packet) + sizeof(u32))
 
+#define SYS_DEBUG_PKT_SIZE (sizeof(struct iris_hfi_header) + \
+	2 * (sizeof(struct iris_hfi_packet) + sizeof(u32)))
+
 #define SYS_NO_PAYLOAD_PKT_SIZE (sizeof(struct iris_hfi_header) + \
 	sizeof(struct iris_hfi_packet))
 
@@ -54,6 +57,23 @@ static int iris_hfi_gen2_sys_image_version(struct iris_core *core)
 	return ret;
 }
 
+static int iris_hfi_gen2_sys_set_debug(struct iris_core *core)
+{
+	struct iris_hfi_header *hdr;
+	int ret;
+
+	hdr = kzalloc(SYS_DEBUG_PKT_SIZE, GFP_KERNEL);
+	if (!hdr)
+		return -ENOMEM;
+
+	iris_hfi_gen2_packet_set_debug(core, hdr);
+	ret = iris_hfi_queue_cmd_write_locked(core, hdr, hdr->size);
+
+	kfree(hdr);
+
+	return ret;
+}
+
 static int iris_hfi_gen2_sys_interframe_powercollapse(struct iris_core *core)
 {
 	struct iris_hfi_header *hdr;
@@ -1391,6 +1411,7 @@ static struct iris_inst *iris_hfi_gen2_get_instance(void)
 static const struct iris_hfi_sys_ops iris_hfi_gen2_sys_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
+	.sys_set_debug = iris_hfi_gen2_sys_set_debug,
 	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
 	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index f43aea10090d8f1d6ae5c20547e5f6321b2ca203..1d4ded82ecdac6e4af9fdd11460158682d27fbf3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -39,6 +39,9 @@
 #define HFI_PROP_UBWC_BANK_SWZL_LEVEL2		0x03000007
 #define HFI_PROP_UBWC_BANK_SWZL_LEVEL3		0x03000008
 #define HFI_PROP_UBWC_BANK_SPREADING		0x03000009
+#define HFI_PROP_DEBUG_CONFIG			0x0300000a
+#define HFI_PROP_DEBUG_LOG_LEVEL		0x0300000b
+#define HFI_DEBUG_CONFIG_DEFAULT		0x00000000
 #define HFI_PROP_CODEC				0x03000100
 #define HFI_PROP_COLOR_FORMAT			0x03000101
 #define HFI_PROP_BITSTREAM_RESOLUTION		0x03000103
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07d830cc8502ab5f28001312991ba8..2dbe57b87fd3c3198d183c32be912797cf36de39 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -226,6 +226,35 @@ void iris_hfi_gen2_packet_image_version(struct iris_core *core, struct iris_hfi_
 				    NULL, 0);
 }
 
+void iris_hfi_gen2_packet_set_debug(struct iris_core *core, struct iris_hfi_header *hdr)
+{
+	u32 fw_debug;
+	u32 payload;
+
+	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
+
+	payload = HFI_DEBUG_CONFIG_DEFAULT;
+	iris_hfi_gen2_create_packet(hdr,
+				    HFI_PROP_DEBUG_CONFIG,
+				    HFI_HOST_FLAGS_NONE,
+				    HFI_PAYLOAD_U32_ENUM,
+				    HFI_PORT_NONE,
+				    core->packet_id++,
+				    &payload,
+				    sizeof(u32));
+
+	fw_debug = READ_ONCE(core->fw_debug) & IRIS_FW_DEBUG_LOGMASK;
+	payload = fw_debug;
+	iris_hfi_gen2_create_packet(hdr,
+				    HFI_PROP_DEBUG_LOG_LEVEL,
+				    HFI_HOST_FLAGS_NONE,
+				    HFI_PAYLOAD_U32_ENUM,
+				    HFI_PORT_NONE,
+				    core->packet_id++,
+				    &payload,
+				    sizeof(u32));
+}
+
 void iris_hfi_gen2_packet_session_command(struct iris_inst *inst, u32 pkt_type,
 					  u32 flags, u32 port, u32 session_id,
 					  u32 payload_type, void *payload,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
index 25b9582349ca1a0ce6efc0b146a3abb798485c45..aff025fbf5eadbedbf0108b41b6f9bf418d4f779 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
@@ -111,6 +111,7 @@ u32 iris_hfi_gen2_get_color_info(u32 matrix_coeff, u32 transfer_char, u32 primar
 
 void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr);
 void iris_hfi_gen2_packet_image_version(struct iris_core *core, struct iris_hfi_header *hdr);
+void iris_hfi_gen2_packet_set_debug(struct iris_core *core, struct iris_hfi_header *hdr);
 void iris_hfi_gen2_packet_session_command(struct iris_inst *inst, u32 pkt_type,
 					  u32 flags, u32 port, u32 session_id,
 					  u32 payload_type, void *payload,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8c2644c7f6e85983d7ad7584fc0cb570e4813ae4..e8dc8751ea939bd544699f464a831736fcc10b7f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -991,20 +991,24 @@ static int iris_hfi_gen2_handle_response(struct iris_core *core, void *response)
 static void iris_hfi_gen2_flush_debug_queue(struct iris_core *core, u8 *packet)
 {
 	struct hfi_debug_header *pkt;
+	u32 log_size;
 	u8 *log;
 
 	while (!iris_hfi_queue_dbg_read(core, packet)) {
 		pkt = (struct hfi_debug_header *)packet;
 
-		if (pkt->size < sizeof(*pkt))
+		if (pkt->size <= sizeof(*pkt) + 1)
 			continue;
 
-		if (pkt->size >= IFACEQ_CORE_PKT_SIZE)
+		if (pkt->size > IFACEQ_CORE_PKT_SIZE)
 			continue;
 
-		packet[pkt->size] = '\0';
 		log = (u8 *)packet + sizeof(*pkt) + 1;
-		dev_dbg(core->dev, "%s", log);
+		log_size = pkt->size - sizeof(*pkt) - 1;
+		if (pkt->debug_level & (IRIS_FW_DEBUG_ERROR | IRIS_FW_DEBUG_FATAL))
+			dev_err_ratelimited(core->dev, "%.*s", (int)log_size, log);
+		else
+			dev_dbg(core->dev, "%.*s", (int)log_size, log);
 	}
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index e4acf4a74f944bcae83089ef5489f204d4b0078e..8bc94acc4f58ce7792ddaeaad036475c476d5c36 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -12,6 +12,7 @@
 #include <linux/reset.h>
 #include <linux/soc/qcom/ubwc.h>
 
+#include "iris_debugfs.h"
 #include "iris_core.h"
 #include "iris_ctrls.h"
 #include "iris_vidc.h"
@@ -207,6 +208,8 @@ static void iris_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
+	iris_debugfs_deinit(core);
+
 	mutex_destroy(&core->lock);
 }
 
@@ -230,6 +233,7 @@ static int iris_probe(struct platform_device *pdev)
 	if (!core)
 		return -ENOMEM;
 	core->dev = dev;
+	core->fw_debug = IRIS_FW_DEBUG_ERROR | IRIS_FW_DEBUG_FATAL;
 
 	core->state = IRIS_CORE_DEINIT;
 	mutex_init(&core->lock);
@@ -298,6 +302,8 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_vdev_unreg_enc;
 
+	iris_debugfs_init(core);
+
 	return 0;
 
 err_vdev_unreg_enc:
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index a2ea2d67f60d05bc0dceb097f94a4f80199b0618..3761987a62e1daabc02a0fd28342c108eec02a19 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -127,7 +127,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 		goto unlock;
 
 	if (!inst->once_per_session_set) {
-		inst->once_per_session_set = true;
+		ret = iris_hfi_set_debug(core);
+		if (ret)
+			dev_dbg(core->dev,
+				"failed to set firmware debug level: %d\n", ret);
 
 		ret = inst->hfi_session_ops->session_open(inst);
 		if (ret) {
@@ -136,6 +139,8 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 			goto unlock;
 		}
 
+		inst->once_per_session_set = true;
+
 		ret = iris_inst_change_state(inst, IRIS_INST_INIT);
 		if (ret)
 			goto unlock;

-- 
2.34.1

