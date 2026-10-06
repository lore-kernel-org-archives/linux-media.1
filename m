Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728AA3B9D86
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 22:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326536; cv=none; b=uiclFW2v7ba3mlPcH/fqxx3/CHYfO0nv4OSQHM0aljaS+1Vqa1Veg6hRFESfZ6QP9QlP0O23U/VSrTiJoQz7ZhBKuNwvIly4eiT0iCVgHQ+squpHwnF+ifQ31rSvb9PpEXXmV+JCEXKmcb2qVN2/Dg3vOuqJBupHSwtG5AJfq0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326536; c=relaxed/simple;
	bh=lH4Dk2jUsrmvthhfZiZ0Ao970UqLUmubW6NDdn2S5Nw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qoGBQXiQ6TruOeXZrnLraTxVJNhVJpeTVMPc1lHbRgbOOcKZy5D3g4ug6w+MLEzmgmcLaY/M9drp3DAXaisySlcBcig3erFnZOFHf1s2P/2f1BqEHLh9tCwpJTlTT5DBMiI75yILLyEgHbwgcYhRYU99nyJFtYmL/48wTTyTOmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVdkdy63 reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVdkdy63"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeRHZ3050170
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4odIBw3SYrq
	cKKY8cmEiG/WthNCuYS8FURjXQy5DTCs=; b=gVdkdy63Zk3hC7EYAR4WwluoHgm
	XRO6UBUQ/PDs8KthTK0LAxfGX9wC3HW3S/ZNyQqGV4uiRin/UiHikvgttdcwtB7H
	+NJun8hNJ1GhpwJ8rdUTxWr6RY7wUlW+MLirj+GS6URb/vbLOv94x50yp5H5UUSF
	RIfgo5t2WvazLwwA8DJrDuATfOst1mrgC15qEaAPtrAqEK9vTJeI1A7FWblQnUaZ
	REUphr+G0LVXXnt8X2uzez+VkuXcJR6PDatMi10QkpSCwZwl/r9rHRO3DVOq1yg8
	pHsxh0UhCDd4YbqKGessg1jjm4nGXJNf5RmR/mS5M2budMgBMSQkT8JjXbQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc531bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:41:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso185585285a.0
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326485; x=1791931285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4odIBw3SYrqcKKY8cmEiG/WthNCuYS8FURjXQy5DTCs=;
        b=2frmMBUIqY07VxhiD0rf6ji9ABOhQWw8a+pFxDSL8CgC5LNg4rE0TXXytHRzq15rBK
         9Z9i+0wv4gT9FibNYLAoTsCCjL3JX0ZEkT84iQYe/czM7hIem0l3uM+9qQE6N2SeTKjS
         +RVybTd8auNMbVlL0EA6jgbAwS01S+W0diZ9h4G5FXhLqxHVIaQKBnzyC5ICeAbb3lKO
         So71lqksxQ75H6GT9iROMWgsk4BgO5zhiw7pYCroBTgcWXYD12tvJWVK2E3mt2ZEG+TU
         RO7idUfbjgW9JNX2UPQErUMJc4WsT44y06xeQR7Xnv6CWsnAVhYXkDpy3S7WCWUgRuiQ
         eEQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVcbj686qIkTxr6BFGWTIk+Ip/1U/HttTzMKnP0m31iJX48w40LsLZ/n5sEp6IKd0YUc5YPAL/9nfAjQ==@vger.kernel.org
X-Gm-Message-State: AFuF++muEmJewRMAieKbWeKJCBSHKbS4krP8ZLkuQgkO+ZpOfD7GPPV3
	UwnLf2mYZMRjAFBVnu97CYImKuV9abDnxet7hPu1trJnWqJy2SJiBnLV27zWMTO+mwIJmga09kb
	hSkZi5oCmyjLoN3PbSInUon/R2sH1CsqI15hJ5dXjKdMS0BULVLLRpbzgwNel89ArpQ==
X-Gm-Gg: AYBFou17bkuXGB6JzuvPP5yipS6HP+7k04xT5ZY+241BVAH35ZWQaLzaVpOVpcEo7RT
	f7OFq2cvxfaxhRWvAXy8Raj8K7IMpnUeHU/2OvL02AA+4BBMXwlRxL5kblaAqO15qa/1HlqzWiH
	Vu0p2bnGilFi7Ajs4XxttOk93CdpBB1148fdjXrrpCcKEHWfuBaLJuvvykW3ewLS2maFT/PPSb7
	Hxx0nE+3nx7/ZpcalzNmtnPdyNXjh/jTw20+srONShxvIN7AR3CshLX+oH32OJt6e2U1hdmgpEB
	Ck1mNpVvpdQcn7XwYjoUlAMKHH37uHbyd/w0t5Bzfa/iUSVYUeLJCXFI44I=
X-Received: by 2002:a05:620a:25c8:b0:93e:84e5:3c66 with SMTP id af79cd13be357-93e9b77d0bamr78647385a.40.1791326484728;
        Tue, 06 Oct 2026 15:41:24 -0700 (PDT)
X-Received: by 2002:a05:620a:25c8:b0:93e:84e5:3c66 with SMTP id af79cd13be357-93e9b77d0bamr78640985a.40.1791326484171;
        Tue, 06 Oct 2026 15:41:24 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:23 -0700 (PDT)
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
Subject: [PATCH 30/45] media: qcom: camss: sa8775p: add IFE lite top v3.0x
Date: Wed,  7 Oct 2026 01:39:38 +0300
Message-Id: <20261006223953.3382273-31-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X5THu2Te c=1 sm=1 tr=0 ts=6ac57915 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=jn2dZJ0VxpFUWOv3xz4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX/WRV2Q80TVEV
 5ELoz97sUNwVcyDvFhFXVHSYK0qfE22oDH1XscpqmOurGrDvaHxU2+jo+TyYyZLThRD8wjC52YT
 XtzUBKrL1gXr02uXkJ7/vq2gH/EPuYo=
X-Proofpoint-GUID: DIOS_0Ifb6mO2_Vr8caIZTvxwrR9JSWy
X-Proofpoint-ORIG-GUID: DIOS_0Ifb6mO2_Vr8caIZTvxwrR9JSWy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX2543UTVWbx83
 qM4tTy4iR2WPNeInLlUVA8zbal1kpEmG/H7gAuGJUfxwp+wUTDfOw94sHqTuJ8k3MDy9Cn1+p2A
 Jwh3C6Xz+WbM0y09NRbxKUir5aStu90AfL7xjbDS3wwi8XFRoTCV8v23CZf+TB4ioJDaLUKfgey
 /mylLmCwOBq0riD5l0lnhTZgUVQjCH0L60Sx4VXRbDkyykHjWeYc+kODfQMdIUlHz3qgw2wmHeW
 WwZgvfIF2/H0Q7Rzs7FvzYPHCvsXDoRCyyYGjE2g+yD+zhQlgarkXtqpfBYHQfu9fQwMjSI4oKN
 68fMO2E6JzI7o1JFqbnLhq5nijDnv9BhCa55ZWdBUYsrwMby+GlBsXpTRDxwQBJ2lHVnUfagflg
 YVPfWq0GECwqNyKg0gakGo2X/tPV/x4+uwtPR4fA9SRCwDUmlOF9P84cVYVJibT2B2YkK0wAtN3
 ftv8MEA16TZSLBygSJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the IFE lite top v3.0x engine used by the SA8775P RDI paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../qcom/camss/camss-ife-lite-top-v30x.c      | 265 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   1 +
 3 files changed, 267 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-lite-top-v30x.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 479ab17f3bdb..695924e0c03b 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -17,6 +17,7 @@ qcom-camss-objs += \
 		camss-ife.o \
 		camss-ife-bus-v20x.o \
 		camss-ife-bus-v31x.o \
+		camss-ife-lite-top-v30x.o \
 		camss-ife-camif-v10x.o \
 		camss-ife-lite-top-v10x.o \
 		camss-ife-mod-v10x.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-lite-top-v30x.c b/drivers/media/platform/qcom/camss/camss-ife-lite-top-v30x.c
new file mode 100644
index 000000000000..c3c182e4c895
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-lite-top-v30x.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#include "camss-ife.h"
+#include "camss.h"
+
+#define IFE_LT_V30X_TOP_OFFS		0x0000
+
+/* CSID register update command */
+#define IFE_LT_V30X_CSID_RUP_AUP_CMD	0x00000018
+#define IFE_LT_V30X_CSID_RUP_RDI0	BIT(4)
+#define IFE_LT_V30X_CSID_RUP_RDI1	BIT(5)
+#define IFE_LT_V30X_CSID_RUP_RDI2	BIT(6)
+#define IFE_LT_V30X_CSID_RUP_RDI3	BIT(7)
+#define IFE_LT_V30X_CSID_AUP_RDI0	BIT(20)
+#define IFE_LT_V30X_CSID_AUP_RDI1	BIT(21)
+#define IFE_LT_V30X_CSID_AUP_RDI2	BIT(22)
+#define IFE_LT_V30X_CSID_AUP_RDI3	BIT(23)
+
+#define IFE_LT_V30X_MOD_VER_GEN		GENMASK(31, 28)
+#define IFE_LT_V30X_MOD_VER_REV		GENMASK(27, 16)
+#define IFE_LT_V30X_MOD_VER_STEP	GENMASK(15, 0)
+#define IFE_LT_V30X_MOD_GEN(val)	FIELD_GET(IFE_LT_V30X_MOD_VER_GEN, val)
+#define IFE_LT_V30X_MOD_REV(val)	FIELD_GET(IFE_LT_V30X_MOD_VER_REV, val)
+#define IFE_LT_V30X_MOD_STEP(val)	FIELD_GET(IFE_LT_V30X_MOD_VER_STEP, val)
+
+/* TOP functional IRQ registers */
+#define IFE_LT_V30X_FUNC_IRQ_CMD	0x00000064
+#define IFE_LT_V30X_FUNC_IRQ_CMD_CLEAR	BIT(0)
+#define IFE_LT_V30X_FUNC_IRQ_MASK_0	0x00000068
+#define IFE_LT_V30X_FUNC_IRQ_MASK_1	0x0000006c
+#define IFE_LT_V30X_FUNC_IRQ_CLEAR_0	0x00000070
+#define IFE_LT_V30X_FUNC_IRQ_CLEAR_1	0x00000074
+#define IFE_LT_V30X_FUNC_IRQ_STATUS_0	0x00000078
+#define IFE_LT_V30X_FUNC_IRQ_STATUS_1	0x0000007c
+
+/* IRQ_STATUS_0 bits */
+#define IFE_LT_V30X_IRQ0_DIAG_VIOLATION	BIT(1)
+#define IFE_LT_V30X_IRQ0_BUSWR		BIT(0)
+#define IFE_LT_V30X_IRQ0_ERRORS_MASK \
+	(IFE_LT_V30X_IRQ0_DIAG_VIOLATION)
+
+/* IRQ_STATUS_1 bits - per-RDI SOF/EOF */
+#define IFE_LT_V30X_IRQ1_RDI3_EOF	BIT(7)
+#define IFE_LT_V30X_IRQ1_RDI3_SOF	BIT(6)
+#define IFE_LT_V30X_IRQ1_RDI2_EOF	BIT(5)
+#define IFE_LT_V30X_IRQ1_RDI2_SOF	BIT(4)
+#define IFE_LT_V30X_IRQ1_RDI1_EOF	BIT(3)
+#define IFE_LT_V30X_IRQ1_RDI1_SOF	BIT(2)
+#define IFE_LT_V30X_IRQ1_RDI0_EOF	BIT(1)
+#define IFE_LT_V30X_IRQ1_RDI0_SOF	BIT(0)
+
+#define IFE_LT_V30X_IRQ1_RDI0 \
+	(IFE_LT_V30X_IRQ1_RDI0_SOF | IFE_LT_V30X_IRQ1_RDI0_EOF)
+#define IFE_LT_V30X_IRQ1_RDI1 \
+	(IFE_LT_V30X_IRQ1_RDI1_SOF | IFE_LT_V30X_IRQ1_RDI1_EOF)
+#define IFE_LT_V30X_IRQ1_RDI2 \
+	(IFE_LT_V30X_IRQ1_RDI2_SOF | IFE_LT_V30X_IRQ1_RDI2_EOF)
+#define IFE_LT_V30X_IRQ1_RDI3 \
+	(IFE_LT_V30X_IRQ1_RDI3_SOF | IFE_LT_V30X_IRQ1_RDI3_EOF)
+
+#define IFE_LT_V30X_HW_VERSION		0x00000000
+
+static int ife_lite_top_30x_acquire(struct ife_device *ife, void __iomem *base,
+				    void __iomem *csid_base)
+{
+	struct ife_top_ctx *ctx = &ife->top_ctx;
+
+	if (!csid_base)
+		return -EINVAL;
+
+	ctx->base	= base + IFE_LT_V30X_TOP_OFFS;
+	ctx->dev	= ife->camss->dev;
+	ctx->csid_base	= csid_base;
+
+	return 0;
+}
+
+static void ife_lite_top_30x_release(struct ife_top_ctx *ctx)
+{
+	ctx->base      = NULL;
+	ctx->csid_base = NULL;
+}
+
+static u32 ife_lite_top_30x_version(struct ife_top_ctx *ctx)
+{
+	struct camss_hw_version hw_ver;
+	u32 reg = readl_relaxed(ctx->base + IFE_LT_V30X_HW_VERSION);
+
+	hw_ver.ids.major = IFE_LT_V30X_MOD_GEN(reg);
+	hw_ver.ids.minor = IFE_LT_V30X_MOD_REV(reg);
+	hw_ver.ids.steps = IFE_LT_V30X_MOD_STEP(reg);
+
+	return hw_ver.hw_version;
+}
+
+static void ife_lite_top_30x_reset(struct ife_top_ctx *ctx)
+{
+	void __iomem *top = ctx->base;
+
+	writel_relaxed(~0, top + IFE_LT_V30X_FUNC_IRQ_CLEAR_0);
+	writel_relaxed(~0, top + IFE_LT_V30X_FUNC_IRQ_CLEAR_1);
+	writel_relaxed(IFE_LT_V30X_FUNC_IRQ_CMD_CLEAR, top + IFE_LT_V30X_FUNC_IRQ_CMD);
+}
+
+static void ife_lite_top_30x_reg_update(struct ife_top_ctx *ctx,
+					const struct ife_pad_desc *dsc)
+{
+	void __iomem *csid = ctx->csid_base;
+	u32 rval;
+
+	switch (dsc->hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		rval = IFE_LT_V30X_CSID_RUP_RDI0 | IFE_LT_V30X_CSID_AUP_RDI0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		rval = IFE_LT_V30X_CSID_RUP_RDI1 | IFE_LT_V30X_CSID_AUP_RDI1;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		rval = IFE_LT_V30X_CSID_RUP_RDI2 | IFE_LT_V30X_CSID_AUP_RDI2;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI3:
+		rval = IFE_LT_V30X_CSID_RUP_RDI3 | IFE_LT_V30X_CSID_AUP_RDI3;
+		break;
+	default:
+		dev_warn(ctx->dev, "Invalid RUP pipe: 0x%x\n", dsc->hw_pipe);
+		return;
+	}
+
+	writel_relaxed(rval, csid + IFE_LT_V30X_CSID_RUP_AUP_CMD);
+}
+
+static int ife_lite_top_30x_pipe_config(struct ife_top_ctx *ctx,
+					const struct ife_pad_desc *desc,
+					const struct camss_ife_pipeline_cfg *pipeline_cfg,
+					const struct camss_ife_wm_config *wm_cfg)
+{
+	return 0;
+}
+
+static int ife_lite_top_30x_pipe_enable(struct ife_top_ctx *ctx,
+					const struct ife_pad_desc *desc)
+{
+	return 0;
+}
+
+static int ife_lite_top_30x_pipe_disable(struct ife_top_ctx *ctx,
+					 const struct ife_pad_desc *desc)
+{
+	return 0;
+}
+
+static void ife_lite_top_30x_prepare(struct ife_top_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+	u32 rval;
+
+	writel_relaxed(~0, base + IFE_LT_V30X_FUNC_IRQ_CLEAR_0);
+	writel_relaxed(~0, base + IFE_LT_V30X_FUNC_IRQ_CLEAR_1);
+	writel_relaxed(IFE_LT_V30X_FUNC_IRQ_CMD_CLEAR, base + IFE_LT_V30X_FUNC_IRQ_CMD);
+
+	rval = IFE_LT_V30X_IRQ0_BUSWR | IFE_LT_V30X_IRQ0_ERRORS_MASK;
+	writel_relaxed(rval, base + IFE_LT_V30X_FUNC_IRQ_MASK_0);
+}
+
+static void ife_lite_top_30x_enable(struct ife_top_ctx *ctx, enum camss_ife_hw_pipe hw_pipe)
+{
+	void __iomem *base = ctx->base;
+	u32 rval = readl_relaxed(base + IFE_LT_V30X_FUNC_IRQ_MASK_1);
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		rval |= IFE_LT_V30X_IRQ1_RDI0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		rval |= IFE_LT_V30X_IRQ1_RDI1;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		rval |= IFE_LT_V30X_IRQ1_RDI2;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI3:
+		rval |= IFE_LT_V30X_IRQ1_RDI3;
+		break;
+	default:
+		return;
+	}
+
+	writel_relaxed(rval, base + IFE_LT_V30X_FUNC_IRQ_MASK_1);
+}
+
+static void ife_lite_top_30x_disable(struct ife_top_ctx *ctx, enum camss_ife_hw_pipe hw_pipe)
+{
+	void __iomem *base = ctx->base;
+	u32 rval = readl_relaxed(base + IFE_LT_V30X_FUNC_IRQ_MASK_1);
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		rval &= ~IFE_LT_V30X_IRQ1_RDI0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		rval &= ~IFE_LT_V30X_IRQ1_RDI1;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		rval &= ~IFE_LT_V30X_IRQ1_RDI2;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI3:
+		rval &= ~IFE_LT_V30X_IRQ1_RDI3;
+		break;
+	default:
+		dev_warn(ctx->dev, "Invalid HW pipeline identifier: 0x%x\n", hw_pipe);
+		return;
+	}
+
+	writel_relaxed(rval, base + IFE_LT_V30X_FUNC_IRQ_MASK_1);
+}
+
+static void ife_lite_top_30x_irq_status(struct ife_top_ctx *ctx, u32 isr_stat[IFE_TOP_STATUS_MAX])
+{
+	void __iomem *base = ctx->base;
+	u32 stat0;
+	u32 stat1;
+
+	stat0 = readl_relaxed(base + IFE_LT_V30X_FUNC_IRQ_STATUS_0);
+	stat1 = readl_relaxed(base + IFE_LT_V30X_FUNC_IRQ_STATUS_1);
+
+	writel_relaxed(stat0, base + IFE_LT_V30X_FUNC_IRQ_CLEAR_0);
+	writel_relaxed(stat1, base + IFE_LT_V30X_FUNC_IRQ_CLEAR_1);
+	writel_relaxed(IFE_LT_V30X_FUNC_IRQ_CMD_CLEAR, base + IFE_LT_V30X_FUNC_IRQ_CMD);
+
+	isr_stat[IFE_TOP_STATUS_ID0] = 0;
+	isr_stat[IFE_TOP_STATUS_ID1] = 0;
+	isr_stat[IFE_TOP_STATUS_ID2] = stat0 & IFE_LT_V30X_IRQ0_ERRORS_MASK;
+
+	if (stat0 & IFE_LT_V30X_IRQ0_BUSWR)
+		isr_stat[IFE_TOP_STATUS_ID0] |= IFE_HW_TOP_IRQ0_BUSWR;
+
+	if (stat1 & IFE_LT_V30X_IRQ1_RDI0_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI0_SOF;
+
+	if (stat1 & IFE_LT_V30X_IRQ1_RDI1_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI1_SOF;
+
+	if (stat1 & IFE_LT_V30X_IRQ1_RDI2_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI2_SOF;
+
+	if (stat1 & IFE_LT_V30X_IRQ1_RDI3_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI3_SOF;
+}
+
+const struct ife_hw_top_ops ife_lite_top_30x_ops = {
+	.acquire	= ife_lite_top_30x_acquire,
+	.release	= ife_lite_top_30x_release,
+	.version	= ife_lite_top_30x_version,
+	.prepare	= ife_lite_top_30x_prepare,
+	.enable		= ife_lite_top_30x_enable,
+	.disable	= ife_lite_top_30x_disable,
+	.pipe_config	= ife_lite_top_30x_pipe_config,
+	.pipe_enable	= ife_lite_top_30x_pipe_enable,
+	.pipe_disable	= ife_lite_top_30x_pipe_disable,
+	.reg_update	= ife_lite_top_30x_reg_update,
+	.reset		= ife_lite_top_30x_reset,
+	.irq_status	= ife_lite_top_30x_irq_status,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index 31d9c83767a5..eff4ab4bd1c9 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -403,5 +403,6 @@ extern const struct camss_mod_ops ife_mod_v10x_ops;
 
 extern const struct ife_pads_descriptors ife_lite_pads_v20x;
 extern const struct ife_hw_top_ops ife_lite_top_10x_ops;
+extern const struct ife_hw_top_ops ife_lite_top_30x_ops;
 
 #endif /* CAMSS_IFE_SUB_DEV_H */
-- 
2.34.1

