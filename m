Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2FF46D551
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363686; cv=none; b=rp/AYsk7yRXUkyXsfLHxswukQZ18IFuFh94sff57bzzQjO7lKCqvasiBAkmmNU74A1P3BHuNPPGlJnXSnLiEX+PXf3klxqBfFfmNpN4U/s7JN1eKnuwenvQ/1dHFtdZB0pzQ0fY3PpoVEZuB4OhnV24RHrSBLf4/W2S8/dv5ErY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363686; c=relaxed/simple;
	bh=WGgtkWXk/4OTyIrCdnNYpcbvJuJSEwslMqxmHE6lnuM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RlbMxz4pW/3gyc9LH3Xi4sa6TAwIkPwlkOtCxG0W+JSglhv8tHAJTDcl4G7QA898tfWZSPWVGy5G6j21F19tnfylYH9cUKUpI1mukoT3Ac1GGfQdzXJokG1uPL4UiqMMeWSDcsK3BCA5o82RFaL2kkJz8cBnUTpmj08WDfslAqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgMReqNd reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgMReqNd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jpxk2711530
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zQtfPnn1PTG
	pnbnSjBfizU0bftFTFsUaBnQIlBDG8yE=; b=LgMReqNdEcLsslVab2h78FsNmjb
	BcinyXxzrGI3qpy/EIsNulJUTc8ArBb/2LNdPkKSoGDfO/3CwTC08cd/5LbiOMcx
	S8N0GmFR8tJsJPIyz4zNSYlE1l5YdpLFrOxy9bupvhpmSOI7PEa8KGBzG4ZIAOgu
	2jdhhQbdaAMNGb0z5YGobuGFI9lpF7iXE3IA4MRUPlpVgsq0m/y7e8X3cLmtbJT3
	Ni9jEGtTIRjPFeHhqzgZbOQHC6kY1GBKjRUYVxYY1OG13yvAKh1pnIlh/315Lu82
	DUV77tl/G7h6Ip2Nl+R6Cnw/YZk+BS8F519nChSyqZVKe1vleaAH5xWNAeg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1d05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:01:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so645810685a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363670; x=1791968470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQtfPnn1PTGpnbnSjBfizU0bftFTFsUaBnQIlBDG8yE=;
        b=AW1yD/MZZzMvkIbpuNw4575iodGj1QFwPstAna46iQPS/ouMUs31Ybj6C3IW2dNX5R
         WRQFvKx0kfzpBhxKETuaLy08VvKY7CAQC0VvHjfM+TWoIYIGbPL3f+iayPatYon2MUl5
         2ofbBJhZ0qQiqb23bhUXyJg+lCkt7fNcGYyt94HUQhLZvLtzlswlHauXVs+zGKh/t4BL
         QT7qXS62QGs4EUjUzn4LRWCVOY5ZeVLy2K7doeOyBlGo0+QEQAeAktV5qff36EzA3CGN
         q9TbsWqNGPNlWMRCV5Fpbos/ZVS+ij+tAXHsvS3VS5UlPdvirDt7qGixdO78ONtHQm39
         23Cw==
X-Forwarded-Encrypted: i=1; AKwUvBxZVL3ZXNQjXP1y5ZPePfPAm6HYQHt5WaIK2FzgUzFk23DN6gMAvWok1lZkhtG9nHLk+RhuS4Ec6gMyFQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kOW62w4jLXDuCtNakDUayycFhX3wYkCMhYqTb9Tvrtw4te0vfW
	zwVthCgH9OUQ12e33Bcnml3VG2H08yGpzg7eEC1t12ic9uu2uY2KtwMmkfa+KgUGfYpXnWIsI2o
	IHEE6nPbWuaPU82tP9ZozJpUL9UKcbtrT2BspSTKDRqhirxIjayx1VjnHOOa5JwG3Jw==
X-Gm-Gg: AYBFou090pp886cgXe6RcLfnzRcq35fRS4ZVkHm+VBbHeZgg12JiI/hIoLkG84qyqmW
	KZvE9JvkScXQMFAsDkfOOG56Nv2zHdrmcdZmRoSEofmVgAy57ZX/Gp1ENJfrNmas5cXsDQn6kJK
	NIWnNjZhcZ8mA6RCcmPvZziXJM+OosaMNP7kV3hdIvV0829ra3oSCww0eQelZZCPjrn40S55d5r
	NOWcAMK2VxtqcZJnOscQ4MEJyzp16Ane5IYdC+HUE9Rt/vTP0fmiuOtu47o8uBg+TJR9Ez0PWF/
	KtwJrGkTkX/rPg05fSyI8Zo1oLtznzqz026d9yGB32/u92bQjDl2cKj5p3w=
X-Received: by 2002:a05:620a:1725:b0:93e:9809:dbf3 with SMTP id af79cd13be357-93e9b8a1b85mr289588985a.70.1791363669876;
        Wed, 07 Oct 2026 02:01:09 -0700 (PDT)
X-Received: by 2002:a05:620a:1725:b0:93e:9809:dbf3 with SMTP id af79cd13be357-93e9b8a1b85mr289580885a.70.1791363669122;
        Wed, 07 Oct 2026 02:01:09 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:08 -0700 (PDT)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 06/45] media: qcom: camss: sm8250: add IFE CamIF v10x
Date: Wed,  7 Oct 2026 12:00:02 +0300
Message-Id: <20261007090041.3732717-7-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ODAktO3P6Yul-RbfE9wDUVD93V60dyA6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX5tU8tuUujXjY
 N/hQt5mPKi/XCA13YB4z6kEDCV7rOyybZalD+/YkztSp6r7NWW3PJYTsGpUXHuloYbJgtwjKO3G
 THFfWA+pYCsUBZYwNyvk7cbc8/PceIs7Ty2k4QoBlsmgofX13B4BC0Fx6J2sM8PxJ66S5be5lwU
 QoJPiWY3W7ej0SNxaV/aLrTxf38EgKxDCsX4j+hu29DVh2TPymVeU24PiRcoLXRWN7UmZEQyDjJ
 zBalnTolsY6pVzbfrWnPTzbQMaYNUnuOKCWR1fIkHeqvAG4nBDrj9yxU7VL9M3MO3XwhfA+NNf8
 X43CeFh4PDjG5PAv8+edT/UHvkvK1KRClT01XuTCZLecUYXUSTDwZYTG2iRS5BV65Y4ayMXVGO9
 TbvJEhcO2t1/5eQZuX/bjYJ2hPqyjaV9qSlruLaR2VNPqFrvutiq7i9NxiCscFGpSAFSxkXRVXf
 WebzyK0+476rcMmEEjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXyFl71DmquGIH
 O4IyCLrmDHycgifOxBiAEPJkeeNjkaa6P1NRRql2Pg8zj+oi3IXmtk6OR44qJhUBBHfdhe97rxD
 bj6CdzyazbYujtvDTbtvveKmcKEPmr4=
X-Proofpoint-GUID: ODAktO3P6Yul-RbfE9wDUVD93V60dyA6
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac60a57 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=WmRFchFSvUI5OYwuZKUA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the IFE camera input interface used by the SM8250 pixel path.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |  1 +
 .../qcom/camss/camss-ife-camif-v10x.c         | 59 +++++++++++++++++++
 .../qcom/camss/camss-ife-camif-v10x.h         | 42 +++++++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-camif-v10x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-camif-v10x.h

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index e30fe07b16f4..2da998444554 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -15,6 +15,7 @@ qcom-camss-objs += \
 		camss-csiphy-3ph-1-0.o \
 		camss-format.o \
 		camss-ife-bus-v20x.o \
+		camss-ife-camif-v10x.o \
 		camss-ispif.o \
 		camss-tpg.o \
 		camss-tpg-gen1.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.c b/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.c
new file mode 100644
index 000000000000..c89caf38fb8c
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#include "camss.h"
+#include "camss-ife.h"
+#include "camss-ife-camif-v10x.h"
+
+static int camif_v10x_config(void __iomem *camif_base, enum camss_ife_hw_pipe hw_pipe,
+			     const struct camss_ife_pipeline_cfg *sink_cfg)
+{
+	u32 period = 0, pattern = 1, epoch;
+
+	epoch = FIELD_PREP(CAMIF_V10X_CFG_EPOCH0_LINE, sink_cfg->in_height / 3) |
+		FIELD_PREP(CAMIF_V10X_CFG_EPOCH1_LINE, sink_cfg->in_height / 2);
+
+	if (hw_pipe == CAMSS_IFE_HW_PIPE_PP) {
+		writel_relaxed(period, camif_base + CAMIF_V10X_PP_PERIOD_CFG);
+		writel_relaxed(pattern, camif_base + CAMIF_V10X_PP_PATTERN_CFG);
+		writel_relaxed(epoch, camif_base + CAMIF_V10X_PP_EPOCH_IRQ_CFG);
+	} else {
+		writel_relaxed(epoch, camif_base + CAMIF_V10X_RDI_EPOCH_IRQ_CFG);
+		writel_relaxed(period, camif_base + CAMIF_V10X_RDI_PERIOD_CFG);
+		writel_relaxed(pattern, camif_base + CAMIF_V10X_RDI_PATTERN_CFG);
+	}
+
+	return 0;
+}
+
+static void camif_v10x_enable(void __iomem *camif_base, enum camss_ife_hw_pipe hw_pipe)
+{
+	u32 rval = readl_relaxed(camif_base + CAMIF_V10X_MODULE_CFG);
+
+	if (hw_pipe == CAMSS_IFE_HW_PIPE_PP)
+		rval |= CAMIF_V10X_PP_CFG_EN | CAMIF_V10X_PP_CFG_OUTPUT_EN;
+	else
+		rval |= CAMIF_V10X_RDI_CFG_EN;
+
+	writel_relaxed(rval, camif_base + CAMIF_V10X_MODULE_CFG);
+}
+
+static void camif_v10x_disable(void __iomem *camif_base, enum camss_ife_hw_pipe hw_pipe)
+{
+	u32 rval = readl_relaxed(camif_base + CAMIF_V10X_MODULE_CFG);
+
+	if (hw_pipe == CAMSS_IFE_HW_PIPE_PP)
+		rval &= ~(CAMIF_V10X_PP_CFG_EN | CAMIF_V10X_PP_CFG_OUTPUT_EN);
+	else
+		rval &= ~CAMIF_V10X_RDI_CFG_EN;
+
+	writel_relaxed(rval, camif_base + CAMIF_V10X_MODULE_CFG);
+}
+
+const struct ife_hw_camif_ops ife_camif_v10x_ops = {
+	.config  = camif_v10x_config,
+	.enable  = camif_v10x_enable,
+	.disable = camif_v10x_disable,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.h b/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.h
new file mode 100644
index 000000000000..87faa5776c31
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#ifndef _CAMSS_IFE_CAMIF_V10X_H_
+#define _CAMSS_IFE_CAMIF_V10X_H_
+
+#include <linux/bits.h>
+
+#include "camss-ife.h"
+
+/* Per-RDI register offset */
+#define IFE_CAMIF_V10X_RDIX_OFFS(n) ((n) * 0x200)
+
+/* PP config bits */
+#define CAMIF_V10X_PP_CFG_EN		BIT(0)
+#define CAMIF_V10X_PP_CFG_OUTPUT_EN	BIT(8)
+
+/* RDI config bit */
+#define CAMIF_V10X_RDI_CFG_EN		BIT(0)
+
+/* EPOCH line fields */
+#define CAMIF_V10X_CFG_EPOCH0_LINE		GENMASK(13, 0)
+#define CAMIF_V10X_CFG_EPOCH1_LINE		GENMASK(29, 16)
+
+/* Module config register offset */
+#define CAMIF_V10X_MODULE_CFG		0x00000060
+
+/* RDI register offsets */
+#define CAMIF_V10X_RDI_PERIOD_CFG	0x00000068
+#define CAMIF_V10X_RDI_PATTERN_CFG	0x0000006c
+#define CAMIF_V10X_RDI_EPOCH_IRQ_CFG	0x00000070
+
+/* PP (pixel path) register offsets */
+#define CAMIF_V10X_PP_PERIOD_CFG	0x00000078
+#define CAMIF_V10X_PP_PATTERN_CFG	0x0000007c
+#define CAMIF_V10X_PP_EPOCH_IRQ_CFG	0x00000080
+
+extern const struct ife_hw_camif_ops ife_camif_v10x_ops;
+
+#endif /* _CAMSS_IFE_CAMIF_V10X_H_ */
-- 
2.34.1

