Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3244756CE
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364040; cv=none; b=jEhQ0y54vu7fN9q+dvhRaj1E1aWyPMIXODY6Ldp0DVULzmApLb3LjTOtSjD72wtLD+ShirlXbyfGoT329nqn0Kudsc5EZnfZIPOkDm/Gm5tPbJGMNdcpt5kZAVQ25wT2L2JezQe787DFfmnNB5FeYleMJZeEGbXHi19EzfqgxWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364040; c=relaxed/simple;
	bh=2J6dHb7nTSk0Fjk8jYYd1d3mbdbzx4z1EymaSNGZE0E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bm4rpCjxE+LX/Jjc3A+Y4m+g4k2531ghDluHRgt6s+kMn9WgkFr7Dp5Hw6AFhDJBtHeo5d735aQGknyhhI8I6tn6ONYrnA6efAx7vAWzzjPoHIDIyLFW3pynQCWH9GQuvw8IQ9KRbqnIVMeXhzOkHq65BYpgFALqF4pH+iG35w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RC4pox86 reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RC4pox86"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jWjK118889
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MngPzCaoDfK
	htOea1AzSjCROnKky9IK26Mu/aY+gMwI=; b=RC4pox86ZWmQGV4PQUKj/mKBAvN
	REcdhnFaos1i38OBzrWhzo+7eop4VQcMdXaEgn4GoxaUVGhmuI29bZzeyKHnvjgX
	wYYM73ljGWVqClTDFY7QhhgaMEwLZhNCTzvRfIlMmabSAWXYo6m22JO30lQ2s71z
	TjzNC2gil5Z6XXkMTOhR4+xkWzrzmEw/uKSzWm3IyxxRKQt/ikfTDzNtBuoH7AHf
	VVN5edTMGy2R+ve/DsrTtFDLeZ7lO/fep9sqhqNHY6eCbHRy7INReG0uCVc/VNj7
	u3KYjzQrBnhYIliVtSssKEQ3JT9ARsRsFc6zQKsXdIOxnpypwxHXHg3MUNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc58r5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:02:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939c30aa9a0so443546085a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363738; x=1791968538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MngPzCaoDfKhtOea1AzSjCROnKky9IK26Mu/aY+gMwI=;
        b=lldkcrbaDHh1XeZgW5SnL+RTUr0Jtc5RfpraVE0WIGfGsR3jadZJu+Q0KrfWv8sa/G
         4RKG5Ej7gY2abO+kkJxd+JIwdbyumih8MExlhoA7CTg7n8hBwtgxTDjZkQtqMG7bJksk
         x6uS+TW1G7ZEcmrKLIjV0G7wzrCtDLliOKe9C0h6sbDijg/kYWkiA/hoDuWozfjHqYOu
         tvkbpTexJWkcRdpZvW5IkNf2lSVg9/tVDS2Nut2fWMdM7/tVbR4FYDaPrDJ/qBeaYsFw
         ZgVl18+1OEK+6SfpDdlVXU0Npi7o0uo8Gp391/3lEa3r3I41uyGqdZKRNfbbf0prWNxG
         7MHw==
X-Forwarded-Encrypted: i=1; AKwUvBwRIqlNmppW0ZZZAHFqfV5AWgTK0/Q1bWBXxoiVG21+JVejmAoFnsNYKnIloLOgRTaCSpmbde04w49idQ==@vger.kernel.org
X-Gm-Message-State: AFuF++la5X+UvMH547hLnG8M9vdxI896LZ7xjgkXQeKbihMjVHzpUqAq
	qX3SkZKADoc46FuyCIvIjqXFRd2xgTSoE3TqvKnuLTiGzcZheV9kJKZPxTHR6WPJoJnyFWuNrWZ
	NI/wfBhePWfgWHiLlIL286nNSd7brHQ7cOqUOgd71BMlx0dq3pkm9rQC78wQFUWL1vg==
X-Gm-Gg: AYBFou0srzcTzsCWISIYQrrOopFaGoKYui/DHmzRae1WhSP/tKdRNniP2njhVzWZ4y/
	5PXyehGE6SpfrDIxyWYdRNCy8WqVGpnUNVxH7YQTTc4+p5Ap+JyHi5cHHRJsz1EDbEG2McfssAo
	FtheRV79ueWMbEtGcpLvIE2igAzoaGeUG/tZ4wyAWai5CDlTC5NgQOe38IeLCmFfS958WO+cHIi
	F6ohXk5weUp8WaCIGxxS4vDxIbsDEQhK7Mv2+fxPleplfF7uijRLVG2mpiOvF5B0wffQFEbyDeA
	/9Lh40a4C+KF167+n5bcqElCTNJK5FD+zJ6luOfB3u2RaMB455sxGtbP1PE=
X-Received: by 2002:a05:620a:3903:b0:937:675e:2903 with SMTP id af79cd13be357-93e9b721a60mr282313585a.14.1791363738169;
        Wed, 07 Oct 2026 02:02:18 -0700 (PDT)
X-Received: by 2002:a05:620a:3903:b0:937:675e:2903 with SMTP id af79cd13be357-93e9b721a60mr282308285a.14.1791363737589;
        Wed, 07 Oct 2026 02:02:17 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:16 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 26/45] media: qcom: camss: sa8775p: add IFE BUS v3.1x
Date: Wed,  7 Oct 2026 12:00:22 +0300
Message-Id: <20261007090041.3732717-27-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX+cPpr0hOmTHE
 K5n3bqhfLmE611ApfSbXA5y585iTCZolnD2dqHhvWfojZTBbln6ZoQynLLmgdvTq9VuEHSdlyi3
 k8gJSk5su8mkGOxkz9x4pUy5KtknLdg=
X-Proofpoint-GUID: RkaFpgrR5WW93ENXKEJO_f3GlKAcKfXp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX4AM97ttld7rr
 4jhreyk9gdGVEGAmNU4mLYGs8xrqyDBy6wVM4YhOwCRzHGeLlFnNFOBrz4ep5uGrpkpQJrRloo7
 4vhkAY7TTjRdTJL4CPfUH3vMbrn5l/7yhQKjhqLknAyiclbSFc2RWcfK6o2xX6PLw9bTN4Jlpp1
 wLhB7rywuaR+H19J6kPW7kZywjY8ap8HV441aTyivpHppcUfjs+9q/ywVC5XNHajzhe7EjkmwA0
 gQbkixACWVsfA9tW+AveRTbe4tN08UFZKLvmwBpd/x5ETD4zaxBjs/GUkiNc8gxUbOIuR96bzeX
 ca1usvWIsoA4kG7v5s32fYcP8AZIJqmFdOf7zKRSoe3xJgoFgnEjxNwVKD8XWvdF2UR+vCiXttF
 vY4KKoIqL3tin/jBZxkQNkISdYDZmAnSU/JaeYWueR+Pb6hb0t4kYlOgk5iKyi1ZvqXX+83DwOz
 q+B1wdAnqroU43L4AFw==
X-Proofpoint-ORIG-GUID: RkaFpgrR5WW93ENXKEJO_f3GlKAcKfXp
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac60a9b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=m-RkIwnzgGneSlHtjuwA:9
 a=UPhfUc_oUKe9iv7q:21 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the IFE BUS v3.1x write engine used by the SA8775P full and lite
pixel paths.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-ife-bus-v31x.c  | 267 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   1 +
 3 files changed, 269 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 500b056a906c..2251b57ba38b 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -16,6 +16,7 @@ qcom-camss-objs += \
 		camss-format.o \
 		camss-ife.o \
 		camss-ife-bus-v20x.o \
+		camss-ife-bus-v31x.o \
 		camss-ife-camif-v10x.o \
 		camss-ife-lite-top-v10x.o \
 		camss-ife-mod-v10x.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c b/drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c
new file mode 100644
index 000000000000..c3a99bd0f75e
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/bitfield.h>
+
+#include "camss.h"
+#include "camss-ife.h"
+
+/* Block base offsets */
+#define BUSWR_V31X_OFFS		0x400
+#define BUSWR_V31X_LITE_OFFS	0x480
+
+/* Per-client register offset */
+#define BUSWR_V31X_CLIENT_OFFS(n)	((n) * 0x100)
+
+/* Interface interrupt and violation status bits */
+#define BUSWR_V31X_IIF_IRQ_CMD_CLEAR			BIT(0)
+#define BUSWR_V31X_OVERFLOW_ERR_MASK			GENMASK(25, 0)
+#define IS_BUSWR_V31X_OVERFLOW_ERR(s)	\
+	((s) & BUSWR_V31X_OVERFLOW_ERR_MASK)
+#define BUSWR_V31X_VIOLATION_ERR_MASK			GENMASK(25, 0)
+#define IS_BUSWR_V31X_VIOLATION_ERR(s)	\
+	((s) & BUSWR_V31X_VIOLATION_ERR_MASK)
+#define BUSWR_V31X_IMG_SIZE_VIOLATION_ERR_MASK		GENMASK(25, 0)
+#define IS_BUSWR_V31X_IMG_SIZE_VIOLATION_ERR(s)	\
+	((s) & BUSWR_V31X_IMG_SIZE_VIOLATION_ERR_MASK)
+#define BUSWR_V31X_IIF_IRQ_S0_IMG_SIZE_VIOLATION	BIT(31)
+#define IS_BUSWR_V31X_IIF_IRQ_S0_IMG_SIZE_VIOLATION(s)	\
+	((s) & BUSWR_V31X_IIF_IRQ_S0_IMG_SIZE_VIOLATION)
+#define BUSWR_V31X_IIF_IRQ_S0_VIOLATION			BIT(30)
+#define IS_BUSWR_V31X_IIF_IRQ_S0_VIOLATION(s)	\
+	((s) & BUSWR_V31X_IIF_IRQ_S0_VIOLATION)
+
+/* Client configuration field values */
+#define BUSWR_V31X_IIF_CGC_OVERRIDE			GENMASK(26, 0)
+#define BUSWR_V31X_CLIENT_CFG_MODE			GENMASK(17, 16)
+#define BUSWR_V31X_CLIENT_CFG_AUTO_RECOVERY_EN		BIT(4)
+#define BUSWR_V31X_CLIENT_CFG_EN			BIT(0)
+#define BUSWR_V31X_CLIENT_IMG_CFG0_HEIGHT		GENMASK(31, 16)
+#define BUSWR_V31X_CLIENT_IMG_CFG0_WIDTH		GENMASK(15, 0)
+#define BUSWR_V31X_CLIENT_IMG_CFG2_STRIDE		GENMASK(23, 0)
+#define BUSWR_V31X_CLIENT_PACKER_CFG_ALIGN		BIT(5)
+#define BUSWR_V31X_CLIENT_PACKER_CFG_FORMAT		GENMASK(4, 0)
+#define BUSWR_V31X_PACKER_FMT_PLAIN16_10_BPP		0x5
+#define BUSWR_V31X_PACKER_FMT_PLAIN16_16_BPP		0x8
+#define BUSWR_V31X_CLIENT_IRQ_SUBSAMPLE_CFG0_PERIOD	GENMASK(4, 0)
+#define BUSWR_V31X_CLIENT_IRQ_SUBSAMPLE_CFG1_PATTERN	GENMASK(31, 0)
+#define BUSWR_V31X_CLIENT_FRAMEDROP_CFG0_PERIOD		GENMASK(4, 0)
+#define BUSWR_V31X_CLIENT_FRAMEDROP_CFG1_PATTERN	GENMASK(31, 0)
+
+/* FIFO limit and frame-based RDI defaults */
+#define BUSWR_V31X_IMG_ADDR_FIFO_MAX_DEPTH		2
+#define BUSWR_V31X_RDI_DEFAULT_WIDTH			0xffff
+#define BUSWR_V31X_RDI_DEFAULT_STRIDE			0xffff
+#define BUSWR_V31X_CLIENT_ADDR_STATUS_2_IMAGE_ADDR_FIFO_WORD_CNT	GENMASK(2, 0)
+
+/* Common registers */
+#define BUSWR_V31X_IIF_CGC_OVERRIDE_REG		0x00000008
+#define BUSWR_V31X_WM_TEST_BUS_CTRL_REG		0x000000fc
+#define BUSWR_V31X_IIF_IRQ_MASK_S0		0x00000018
+#define BUSWR_V31X_IIF_IRQ_CLEAR_S0		0x00000020
+#define BUSWR_V31X_IIF_IRQ_STATUS_S0		0x00000028
+#define BUSWR_V31X_IIF_IRQ_CMD_REG		0x00000030
+#define BUSWR_V31X_STATUS_CLEAR_REG		0x00000060
+#define BUSWR_V31X_VIOLATION_STATUS_REG		0x00000064
+#define BUSWR_V31X_OVERFLOW_STATUS_REG		0x00000068
+#define BUSWR_V31X_IMG_SIZE_VIOLATION_REG	0x00000070
+
+/* Per-client registers (relative to client base = module_base + CLIENT_OFFS(n)) */
+#define BUSWR_V31X_CLIENT_CFG_REG		0x00000200
+#define BUSWR_V31X_CLIENT_ADDR_IMAGE_REG	0x00000204
+#define BUSWR_V31X_CLIENT_IMG_CFG0_REG		0x0000020c
+#define BUSWR_V31X_CLIENT_IMG_CFG2_REG		0x00000214
+#define BUSWR_V31X_CLIENT_PACKER_CFG_REG	0x00000218
+#define BUSWR_V31X_CLIENT_IRQ_SS_CFG0_REG	0x00000230
+#define BUSWR_V31X_CLIENT_IRQ_SS_CFG1_REG	0x00000234
+#define BUSWR_V31X_CLIENT_FRAMEDROP_CFG0_REG	0x00000238
+#define BUSWR_V31X_CLIENT_FRAMEDROP_CFG1_REG	0x0000023c
+#define BUSWR_V31X_CLIENT_ADDR_STATUS_0_REG	0x00000270
+#define BUSWR_V31X_CLIENT_ADDR_STATUS_2_REG	0x00000278
+
+static void ife_buswr_31x_acquire(struct ife_device *ife, void __iomem *base)
+{
+	struct ife_buswr_ctx *ctx = &ife->buswr_ctx;
+
+	if (ife->res->type == CAMSS_IFE_SUBDEV_TYPE_IFE_LITE)
+		ctx->base = base + BUSWR_V31X_LITE_OFFS;
+	else
+		ctx->base = base + BUSWR_V31X_OFFS;
+
+	ctx->dev = ife->camss->dev;
+}
+
+static void ife_buswr_31x_release(struct ife_buswr_ctx *ctx)
+{
+	ctx->base = NULL;
+}
+
+static void ife_buswr_31x_wm_config(struct ife_buswr_ctx *ctx, const u8 wm,
+				    const struct camss_ife_wm_config *cfg)
+{
+	void __iomem *base = ctx->base;
+	bool align = cfg->packing_fmt >= BUSWR_V31X_PACKER_FMT_PLAIN16_10_BPP &&
+		     cfg->packing_fmt <= BUSWR_V31X_PACKER_FMT_PLAIN16_16_BPP;
+	u32 pattern = 1;
+	u32 period = 0;
+	u32 bytes = cfg->bytes;
+	u32 stride = cfg->stride;
+	u32 lines = cfg->lines;
+	u32 rval;
+
+	if (cfg->mode_config == BUSWR_CLIENT_CFG_MODE_FRAME_BASED) {
+		bytes = BUSWR_V31X_RDI_DEFAULT_WIDTH;
+		lines = 0;
+		stride = BUSWR_V31X_RDI_DEFAULT_STRIDE;
+	}
+
+	writel_relaxed(BUSWR_V31X_IIF_CGC_OVERRIDE,
+		       base + BUSWR_V31X_IIF_CGC_OVERRIDE_REG);
+	writel_relaxed(0, base + BUSWR_V31X_WM_TEST_BUS_CTRL_REG);
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_CFG_MODE, cfg->mode_config);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_PACKER_CFG_FORMAT, cfg->packing_fmt) |
+	       FIELD_PREP(BUSWR_V31X_CLIENT_PACKER_CFG_ALIGN, align);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_PACKER_CFG_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_IMG_CFG0_WIDTH, bytes) |
+	       FIELD_PREP(BUSWR_V31X_CLIENT_IMG_CFG0_HEIGHT, lines);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_IMG_CFG0_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_IMG_CFG2_STRIDE, stride);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_IMG_CFG2_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_IRQ_SUBSAMPLE_CFG0_PERIOD, period);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_IRQ_SS_CFG0_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_IRQ_SUBSAMPLE_CFG1_PATTERN, pattern);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_IRQ_SS_CFG1_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_FRAMEDROP_CFG0_PERIOD, period);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_FRAMEDROP_CFG0_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_FRAMEDROP_CFG1_PATTERN, pattern);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_FRAMEDROP_CFG1_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+}
+
+static void ife_buswr_31x_wm_enable(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	void __iomem *base = ctx->base;
+	u32 rval;
+
+	rval = readl_relaxed(base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
+	rval |= BUSWR_V31X_CLIENT_CFG_EN | BUSWR_V31X_CLIENT_CFG_AUTO_RECOVERY_EN;
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
+}
+
+static void ife_buswr_31x_wm_disable(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	void __iomem *base = ctx->base;
+	u32 rval;
+
+	rval = readl_relaxed(base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
+	rval &= ~(BUSWR_V31X_CLIENT_CFG_EN | BUSWR_V31X_CLIENT_CFG_AUTO_RECOVERY_EN);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
+}
+
+static bool ife_buswr_31x_is_fifo_full(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	u32 rval = readl_relaxed(ctx->base + BUSWR_V31X_CLIENT_OFFS(wm) +
+				 BUSWR_V31X_CLIENT_ADDR_STATUS_2_REG);
+
+	rval = FIELD_GET(BUSWR_V31X_CLIENT_ADDR_STATUS_2_IMAGE_ADDR_FIFO_WORD_CNT, rval);
+
+	return rval >= BUSWR_V31X_IMG_ADDR_FIFO_MAX_DEPTH;
+}
+
+static void ife_buswr_31x_queue_buf(struct ife_buswr_ctx *ctx, const u8 num_wms, const u8 *wm,
+				    dma_addr_t *addr)
+{
+	int i;
+
+	for (i = 0; i < num_wms; i++) {
+		if (addr[i])
+			writel_relaxed(addr[i], ctx->base + BUSWR_V31X_CLIENT_ADDR_IMAGE_REG +
+				       BUSWR_V31X_CLIENT_OFFS(wm[i]));
+	}
+}
+
+static u32 ife_buswr_31x_consumed_addr(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	return readl_relaxed(ctx->base + BUSWR_V31X_CLIENT_ADDR_STATUS_0_REG +
+			     BUSWR_V31X_CLIENT_OFFS(wm));
+}
+
+static u32 ife_buswr_31x_irq_status(struct ife_buswr_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+	u32 bus_stat;
+	u32 iif_stat;
+
+	bus_stat = readl_relaxed(base + BUSWR_V31X_OVERFLOW_STATUS_REG);
+	writel_relaxed(BIT(0), base + BUSWR_V31X_STATUS_CLEAR_REG);
+	if (IS_BUSWR_V31X_OVERFLOW_ERR(bus_stat)) {
+		writel_relaxed(bus_stat, base + BUSWR_V31X_STATUS_CLEAR_REG);
+		pr_warn("BUSWR common overflow: 0x%x\n", bus_stat);
+	}
+
+	bus_stat = readl_relaxed(base + BUSWR_V31X_VIOLATION_STATUS_REG);
+	if (IS_BUSWR_V31X_VIOLATION_ERR(bus_stat))
+		pr_warn("BUSWR common violation: 0x%x\n", bus_stat);
+
+	bus_stat = readl_relaxed(base + BUSWR_V31X_IMG_SIZE_VIOLATION_REG);
+	if (IS_BUSWR_V31X_IMG_SIZE_VIOLATION_ERR(bus_stat))
+		pr_warn("BUSWR common image size violation: 0x%x\n", bus_stat);
+
+	iif_stat = readl_relaxed(base + BUSWR_V31X_IIF_IRQ_STATUS_S0);
+	writel_relaxed(iif_stat, base + BUSWR_V31X_IIF_IRQ_CLEAR_S0);
+	if (iif_stat) {
+		if (IS_BUSWR_V31X_IIF_IRQ_S0_IMG_SIZE_VIOLATION(iif_stat))
+			pr_warn("BUSWR image size violation from CCIF: 0x%x\n", iif_stat);
+		if (IS_BUSWR_V31X_IIF_IRQ_S0_VIOLATION(iif_stat))
+			pr_warn("BUSWR violation from CCIF: 0x%x\n", iif_stat);
+	}
+
+	writel_relaxed(BUSWR_V31X_IIF_IRQ_CMD_CLEAR, base + BUSWR_V31X_IIF_IRQ_CMD_REG);
+
+	return iif_stat;
+}
+
+static void ife_buswr_31x_irq_enable(struct ife_buswr_ctx *ctx)
+{
+	writel_relaxed(~0, ctx->base + BUSWR_V31X_IIF_IRQ_MASK_S0);
+}
+
+static void ife_buswr_31x_irq_disable(struct ife_buswr_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+
+	writel_relaxed(0, base + BUSWR_V31X_IIF_IRQ_MASK_S0);
+	writel_relaxed(~0, base + BUSWR_V31X_IIF_IRQ_CLEAR_S0);
+	writel_relaxed(BUSWR_V31X_IIF_IRQ_CMD_CLEAR, base + BUSWR_V31X_IIF_IRQ_CMD_REG);
+}
+
+const struct ife_hw_buswr_ops ife_buswr_31x_ops = {
+	.acquire	= ife_buswr_31x_acquire,
+	.release	= ife_buswr_31x_release,
+	.irq_enable	= ife_buswr_31x_irq_enable,
+	.irq_disable	= ife_buswr_31x_irq_disable,
+	.wm_config	= ife_buswr_31x_wm_config,
+	.wm_enable	= ife_buswr_31x_wm_enable,
+	.wm_disable	= ife_buswr_31x_wm_disable,
+	.queue_buf	= ife_buswr_31x_queue_buf,
+	.consumed_addr	= ife_buswr_31x_consumed_addr,
+	.irq_status	= ife_buswr_31x_irq_status,
+	.is_fifo_full	= ife_buswr_31x_is_fifo_full,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index c163c336fcc3..efbb1e75d550 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -397,6 +397,7 @@ camss_ife_pipe_for_stream_id(int nstreams,
 extern const struct ife_pads_descriptors ife_pads_v20x;
 extern const struct ife_hw_top_ops ife_top_20x_ops;
 extern const struct ife_hw_buswr_ops ife_buswr_20x_ops;
+extern const struct ife_hw_buswr_ops ife_buswr_31x_ops;
 extern const struct camss_mod_ops ife_mod_v10x_ops;
 
 extern const struct ife_pads_descriptors ife_lite_pads_v20x;
-- 
2.34.1

