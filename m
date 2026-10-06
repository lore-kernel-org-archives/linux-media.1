Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FEB3A75A2
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 22:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326470; cv=none; b=WCSw4gbQeRastOOL677Z41TqAr0i5Sa01tRyUgV0eyUok8DouWg8zB2Lgr6dls5IWR5BgmvRoJym+4/u4cicoUX/8wBx4KVwzjEvMzk7/6mXYxzXeGb+A068d2VH+i/+JxMMcBP3WgDpXgK1sPMKfiRRsReeLZ1LwvT3Obr2n4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326470; c=relaxed/simple;
	bh=WGgtkWXk/4OTyIrCdnNYpcbvJuJSEwslMqxmHE6lnuM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NAacX+VcgRFgd41VmQhb3AEnY1KCAQitglsj5WbtscDxhCUTYYgWlQSagpJCgM1/xFza3zl0DyzywtMZEc/ZjU5vXRTCLa/EZ7cMEsaruB1xxftvlG1n3OqZ38UKkvLdQCD9KLwkpV/HnXzfhTzHjDGCOxNdjkCfp6hXqVpVAEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OxWAOxWw reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OxWAOxWw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeLOF1029557
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zQtfPnn1PTG
	pnbnSjBfizU0bftFTFsUaBnQIlBDG8yE=; b=OxWAOxWwxq20Ab4jEJG/Lfe8T+f
	J/Ppi0tZq5Fs6vXuCbQx2wprC1u6j41LyOQQtW60dk8RnRJ0uw9daluJxzPiXlZ6
	j2Rpr8+FuVo2/a/VLcpHGetTEbpD9XIfVCzC3+ar+Qv3HWEXKlCF9S9n+NgIKvIW
	ZjAyTrXKIU9M21j9CyXvaLqN1jSACLpaI6yGGyiSXX0+Sm8oTMKES9aTQoGPGHKz
	IWgws/quIyacxldYPv0a3dvGobS6zniWkBGH1DiWqTjP6IMQRZDvqlRmyrJs8BI4
	OMyshi58/eTJ9dFRybWAhtPHlo8J4gpolEjhH720xkNoSATozp5BZSfPqSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53ashu01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:40:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so550418185a.3
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326435; x=1791931235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQtfPnn1PTGpnbnSjBfizU0bftFTFsUaBnQIlBDG8yE=;
        b=e5SbNhFQircvJYrBe3BAZ2RyQPNcI/UaIWwYTsvtKg1Utf8h6nvi3jtF0V018Ia2lU
         s3It3VtVgPP/4dbEG1UrPyDxH6pGXUkgB9H40Nvuj6tsRy9VCtKh6OAh/gjmoTCfvmC9
         C5UZzFfSbDawikYJu8g9Su62BtjgNWGAVu6oZOQ/Knc4q59ymPb8sWfH//6IWb3ow1lv
         GF0h6P+pd7a83kZO0Bj/pndCWAaY3NwzqRdVscIDqBrG0kJrQ82P2MxJqOkmmaEmMI98
         OegHKDBClebJ7qSKly0rCv+VqW2RxHINSCMj4DXdnmSPUmLkIZjGAn6ILW8vgeHOwwdB
         XkSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkB9Z/OVCLU5HTtyIXcgI5LV7sM98sUsY9E/TiVHo/bfoFJ2cIhYF5X1V80kFfA7SCdAZyuAvn+LmZpQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mzZx52u5+UH2tU0/GjDqkoDiEtxQiEEPIPOFjfH2V3/flK7GI1
	qOZXTmtuUxUvxVZX6CMtOqsKQVQYo51OjS5abFwISzjUFCahBz6t2OmrvwLKCQoNwxDAlg+dfgF
	dVVCV22PeXNt1NiPK6Aihs2Gg/MiCFPUKSx/aV4F7cEhessXLuaHQ8+JOND+EC0DFbA==
X-Gm-Gg: AYBFou2jHsGxRo3n7pVOHxi7Vi6bBSA48HsZXZSknJmS/Z8J3U03SxYPVV864qnSalV
	cALrm+jLSCbGVTw3vc9fbRBMJCqJGbdecETUeYjgVwh5sge61fGmZXp9UQb52nU8DlG50Tbipmb
	K79b4xM8O2zDrWoDn2q39bv+VGCfUSvGF67+ZP7rRlhsch6NIb49Wjy7ZVY/HjSBxckDSwFuGLu
	xyKVAMsQrerTwNtaQpwl6miqGeFKKDzSWKHQUdoKcpjkOpVHNsMaaMCtO47LPOjERwIUUM4Xtbs
	YG7B7qss4Ln8jRFCHaf30yZJsUIqPUIZ6ksjiX/iSdOMVraqGNg+yhOZhZQ=
X-Received: by 2002:a05:620a:3956:b0:93e:920c:bfcd with SMTP id af79cd13be357-93e9b8071afmr76142885a.57.1791326435173;
        Tue, 06 Oct 2026 15:40:35 -0700 (PDT)
X-Received: by 2002:a05:620a:3956:b0:93e:920c:bfcd with SMTP id af79cd13be357-93e9b8071afmr76136285a.57.1791326434504;
        Tue, 06 Oct 2026 15:40:34 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:31 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 08/45] media: qcom: camss: sm8250: add IFE CamIF v10x
Date: Wed,  7 Oct 2026 01:39:16 +0300
Message-Id: <20261006223953.3382273-9-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ly1bTdKAS0N0m9y3QWdtG0Zn8YX1TXMX
X-Proofpoint-GUID: ly1bTdKAS0N0m9y3QWdtG0Zn8YX1TXMX
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac578e3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=WmRFchFSvUI5OYwuZKUA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX4ti60OFeGoQC
 9lFVDBRlTd86ptfIyT5+9twtcTrH1hL2QzrPhben7pFH9RJf19RT81Ck315Xop/4NKbk6rUnx8R
 DErya3K9vhVWL9FncXLFOfADEFdOqxkwVlJIfejIxWvpiFkATFsnhT9SeziRI7BN6AVYivP94MQ
 zAwDRKBmV8PEWX8Z0WCVSrmcwktaoKcfUyN04xLh1ONOlzwtRauimQK2xk0jtF8XheM+gQH9++n
 9kBEfHCHTNWjVbB7H0pirpoeBC/9lMif9EK8KGowRPFkL//aXZu79Onu5rkAEoMtJlj2wRyat/6
 dBtYt6UJ9n35AoMkMUDbJYCMGcNV5Xz1GDAASELGi2An58acb0fOhpPu1YjlyDOoXJC4wZPH6DA
 UMpnpZAGNfQajbB96xvWpb/Miu/HD4spbSRjaPjChmL4+1/OOLMNagYVsOmUwQgOJC/evVSbaMQ
 yxOa8LDtdW382BA9pdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX+32HbPxmdNj8
 zpIIgzwERlO0J+D5Em4iHKeep9s2R9pEPdLMLaZ0jy6VWG70Bj1vNQl8XmKrWSOgZF7F96gvMhD
 mQhoDVzr9T8PQVwOonZ1oqYbnkN5ViI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

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

