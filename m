Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB6C38F922
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 03:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134117; cv=none; b=Zx/2Y15XRSa4qESFUtWcKoTuFHS0z/aqT1pVxbcTmpv4zBzt6X6QUNSFbK7WF0O3FMGTa/AU+n5zo2GJrUSY2Xf4xCbUOmgSbQhb/aUHUg3xUPBOY+HiWZzvXgtuLtofUYpk94kvdnj0sLnZ1q+isacTfo5bnhIyhFBl5VIVHOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134117; c=relaxed/simple;
	bh=Ptc3EuPrDTASPXr8oNRgvpAkz6mIXFcuDPjCgIfXwsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nwo2GwPa6Bk2HGRKOdUQJoSKptzlwNfYq4m/6WRahl3mH6wno/clHIjAiAmSOlpw4fqJDy2XGHtfztZ0eu+eyeR0mmG1rDzv8fCuo+d6i5CnQ+2xY1ue3H2a4fWm7rQT5qHLCVILXPsH33wzUgIXUGziGmMMimMhfazkM4Y+61U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7F2Hv2W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3d6Sne3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7F2Hv2W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3d6Sne3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N0Ebxa2645821
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 03:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ozeTsszPxdoMfL7hIKed899S49zq7nlTcGptv2hcNGc=; b=D7F2Hv2WnFfO7IyZ
	NiwAZ8AeGMdVDjH4/3+o/91yS/+HALTrBCUpZoLC0Uk8Kj+pAIagy0ZKlkkMHOXV
	ne1UCCOcm6UMudEZEWDENLaSYQ7JRrbC+9FFkaxrlSQOQ1EnO+3uYxqc9WQqqsR6
	GvEgiC0zGphnrMIvmpHP/maUNIAZat3wZ+ACBY18h+Armw80V2hjq0UVnstKRM05
	erjjrgxmHzB07IFUI+jatEBwBgtkAqV2C4f9Ie245ltGWHaJAMKo0L+rblSQJpd5
	Pn7O/8WGNx2P+UoKlhnmbjs/lhAnnl9gT2ZPFAqqDI2ePr6u22Yr2R1cfoxIQ2nZ
	Qz0GXw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428rkjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 03:28:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb687f82eso3227265ad.3
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 20:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790134114; x=1790738914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozeTsszPxdoMfL7hIKed899S49zq7nlTcGptv2hcNGc=;
        b=P3d6Sne3UdyH/apDAkbvIhFlVjQfRVfSexGgX3vN21QHvUYTRwq5NXfzvUKjgkH5Ih
         NoQd3yZ4j+zI1dAJOVnCSNm21yiUEaIUaglj6fPndQKTFiEhPDyKIJuxj3fz46JLZ/CX
         ARKMd0PmfKSN5WCVT7EJbYAXHUiefuGYmZrMArM4YB8NTg2X60UAMRH5OHUgXwmgzVPu
         aIgjorEW9ccwpwOXiOPGKTnJUOp5i3qcToDt032lEENlCOJHKisfsmg2ln/FS8pCWegS
         tqwisLvhoY3phMsniAX5tsvQcHam4MZADntbVensnZTJTYmQ/7J/ANgZtvOKVzLvjRXl
         6plA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134114; x=1790738914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozeTsszPxdoMfL7hIKed899S49zq7nlTcGptv2hcNGc=;
        b=PTHc1booYTDKZx64JjBDo+OgsfKsNtSJhPKN8GQGgeGbu90B1xWOw1uAiCFKry8V0Q
         wJRjuTl9Jm0sUgjgKZ2AMsJcMCoHvsAxXjGQ2vJbAejx8b5KFoj+lMyMx0Z38d0vH5JC
         WuUbY06mDrraz6PzVzE3HD+Xwo9RE1HXBwnsqZ02JUYfy/CrAUhEcnyoU5UYZ+XV6SXJ
         6jfyMQimCI5jiWj8O3bpJsWHmLI4ya5fKyylwupwQUvOv0Q7aShlZ1U/QJzW+HIB3L/3
         bxzZ4T3707f6lD7sKXbbmm19MbyNBkYAbli5HTmjNMAbIEynxTKTZky9Fy3S+9fJURpB
         Vqsg==
X-Forwarded-Encrypted: i=1; AKwUvBwQFIo7hAzTRaUzMlcUrtBwBj7Ohqebh1l5TvtSPCkrTUu1wpDDXO24vxjD47rJ2POm0/cq87uX7Gn6SA==@vger.kernel.org
X-Gm-Message-State: AFuF++ka4J5dPMKq3Ntl3BVyc1Mo6x05mWKTLqT+iGN5+u2FxA2muMJD
	MEtOVR86twu6CeICpYcT2rE5AmR5fcBefPZ0ONBz2ubsCPrlZmu/FljNu74uf5nfMU4fiRWbvxk
	C9drGR8dm2XpSAHOwQ/2sBBZlP/t0zG5iFgL8bWH/XDN0UTFqAOMQ4CiGWU12FEgf7Q==
X-Gm-Gg: AYBFou1CDzyvDU/rEbdeZGOcGLkGYz0cWWEcQAvaWrQZzCCzYPdpmeZexYBocvwQrdX
	d2fAef31HDR8C+4mfZwbksdvHJ5UpZj/bfRgzouwvOgtQvMP83rooJPk6Wh6/oO5JBUB6GqAJlx
	a2QFLDM6tFCnjt2umMbG6cjrHtlAotNlflxOCBzdSkMrXek/gFzBxhgy1ICwQ8Y+0y9PbZ3U7Z4
	L29Od57A97ugtFYS86wt372Sz9I1vhcrOF6SwtpRhjo0dNSjFMUjGjR15vk4WgwL0Y5BG9ngJON
	dqLSS2QLj2RhHbKYKJ+NwAqFxrdv9XgoIZWUWo+YIjX+/NG1QbDT1TZ5DtbFJRi/2djrGWLiPkK
	zk6WWqYY5P00i5zAPGPIMkf01ZxiufjQZLklAgalSqeQ2FQj040kPpgdJ4H1+yk1uM77nKMq032
	0LjcpGyn6f
X-Received: by 2002:a17:903:3c43:b0:2dd:c100:b2c1 with SMTP id d9443c01a7336-2df69e01671mr12352275ad.44.1790134113490;
        Tue, 22 Sep 2026 20:28:33 -0700 (PDT)
X-Received: by 2002:a17:903:3c43:b0:2dd:c100:b2c1 with SMTP id d9443c01a7336-2df69e01671mr12352055ad.44.1790134112922;
        Tue, 22 Sep 2026 20:28:32 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3733sm3603525ad.41.2026.09.22.20.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:28:32 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:27:53 +0800
Subject: [PATCH v2 3/7] media: iris: add VPU5x hardware ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-add_iris_for_hawi-v2-3-016ec3d24b79@oss.qualcomm.com>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790134092; l=24148;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Ptc3EuPrDTASPXr8oNRgvpAkz6mIXFcuDPjCgIfXwsY=;
 b=tGaI2PnQ6ZSy4pGVgp+KuU4jroqpUacoabb7pv3wPfKSK33W6aZZzpJbE7BdiKsM29U+6GoPe
 MAP/a+8TUr9DU9vNFG2ZCokJxGrPxWsX2CHMBSO2LsW7wbW4Ola3uhI
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab34762 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4L-smajPeleGBe0zsKoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 7m1EDjEJ56E3dUcG7y-L_ODGlwTlyzd4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX8sgxkh0QEXWB
 ygzwdmuYPJ43uAPfwxkVZtEKBURMT2f5d9SN/Juoi3XA+cw00tiU6e/O2XDipwpvuGbkD8M7DhL
 YT2E7Zm4Lz3hshgIK/QVzasX9DLo8V84VOTJ7hBByf0w8asVBDqEhwFoihWmI3j/S2Y6FPJCu9P
 MQMtoQWLveWrBK7CMc5tF7rTlenTKGxqIrI3VgBGknWOIUGzyxH1PgdVGfUfQci1PUU5IJuWImt
 JyMEAlxjzH68T+tnd+TjDOJq6j0FBaUsWF1zNMalQfWjoirCq/N+M55gEfs0nfI594xnonJg1us
 emwHLrRDPqjUd3/3m6BFSsf4bJWf3Cm7VsmQBtbbXOZ05p0CucPQh1pEn2VvHsQp62NE/Wa3MzP
 89IkNdKjaYAZzjEGGrFIJLDzsUx1UWaa3gwf2FFaXxHttyoxd9oLAQP7Jg1iPT0HFiLrEEvuKZ1
 272umhKc9cvl0oMXXrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX/E5bBCu6B44u
 XbfJ4TlAWhwm+dD4rcc13pY162dRAHFyzUYLbPKnqboHAQdZdsUuXx8osk8gfTZbdXRVI7W0X3N
 DxfU7ry3FQIHBoKHFhgJjVEEc31H1bE=
X-Proofpoint-GUID: 7m1EDjEJ56E3dUcG7y-L_ODGlwTlyzd4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230013

The Hawi SoC uses the VPU5x generation of the Iris video hardware, which
requires handling for two new power domains — mm-int for the internal
memory interconnect and cx-int for the CX domain AXI interface — as well
as additional generation-specific clocks. Without a VPU5x vpu_ops
implementation the Iris driver cannot power on or off the hardware on
Hawi.

Move the shared idle and core power status definitions to the common
register header so they can be used by both VPU4x and VPU5x code.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   6 +
 drivers/media/platform/qcom/iris/iris_vpu4x.c      |   4 -
 drivers/media/platform/qcom/iris/iris_vpu5x.c      | 588 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |   4 +
 6 files changed, 600 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index f8a017d878d620fe1d82708624595583aa2ffd99..adaf2f4ab08984bcf10b8ca7ed424a21635eafbe 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -27,6 +27,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu2.o \
              iris_vpu3x.o \
              iris_vpu4x.o \
+             iris_vpu5x.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 61639d72bdcc9917983096e5b8f5905936784623..4529f52a30d7f2ef82ec846bced6f9b5aef16558 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -80,6 +80,10 @@ enum platform_clk_type {
 	IRIS_VPP0_HW_CLK,
 	IRIS_VPP1_HW_CLK,
 	IRIS_APV_HW_CLK,
+	IRIS_AXIC_CLK,
+	IRIS_CTRL_DEBUG_CLK,
+	IRIS_VPP_GATING_CLK,
+	IRIS_CX_AXI_CLK,
 };
 
 struct platform_clk_data {
@@ -241,6 +245,8 @@ enum platform_pm_domain_type {
 	IRIS_VPP0_HW_POWER_DOMAIN,
 	IRIS_VPP1_HW_POWER_DOMAIN,
 	IRIS_APV_HW_POWER_DOMAIN,
+	IRIS_MM_INT_POWER_DOMAIN,
+	IRIS_CX_INT_POWER_DOMAIN,
 };
 
 struct iris_firmware_data {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 93acbfa0f471fdec1cb75db732f37ef6c6ef5cbf..267139a732d923b8e4939bc7d2932d06fac7a006 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -11,10 +11,6 @@
 #include "iris_vpu_register_defines.h"
 
 #define MVP_NOC_RESET_REQ_MASK			0x70103
-#define VPU_IDLE_BITS				0x7103
-
-#define CORE_CLK_HALT		BIT(0)
-#define CORE_PWR_ON		BIT(1)
 
 static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32 efuse_value)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu5x.c b/drivers/media/platform/qcom/iris/iris_vpu5x.c
new file mode 100644
index 0000000000000000000000000000000000000000..726c3f35ece4dd1abe4fd3916a5db699029d154e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu5x.c
@@ -0,0 +1,588 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/iopoll.h>
+#include <linux/pm_opp.h>
+#include <linux/reset.h>
+
+#include "iris_instance.h"
+#include "iris_vpu_common.h"
+#include "iris_vpu_register_defines.h"
+
+/*
+ * iris5 specific register defines.
+ * Many base offsets are shared with prior generations:
+ *   WRAPPER_BASE_OFFS = 0x000B0000
+ *   AON_BASE_OFFS     = 0x000E0000
+ *   AON_MVP_NOC_RESET = 0x0001F000
+ *   CPU_BASE_OFFS     = 0x000A0000
+ */
+
+#define WRAPPER_MVP_NOC_LPI_CONTROL		(WRAPPER_BASE_OFFS + 0x110)
+#define WRAPPER_MVP_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x114)
+#define WRAPPER_MVP_NOC_CX_LPI_CONTROL		(WRAPPER_BASE_OFFS + 0x118)
+#define WRAPPER_MVP_NOC_CX_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x11C)
+
+#define AON_WRAPPER_MVP_NOC_ARCG_CONTROL	(AON_BASE_OFFS + 0x10)
+
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL	(AON_BASE_OFFS + 0x2C)
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x30)
+
+#define CPU_NOC_BASE_OFFS			0x000D0000
+#define CPU_NOC_ERRORLOGGER_MAINCTL_LOW		(CPU_NOC_BASE_OFFS + 0x08)
+#define CPU_NOC_SBM_FAULTINEN0_LOW		(CPU_NOC_BASE_OFFS + 0x240)
+
+#define NOC_BASE_OFFS				0x00010000
+#define NOC_ERL_ERRORLOGGER_MAINCTL_LOW		(NOC_BASE_OFFS + 0xA008)
+#define NOC_ERL_ERRORLOGGER_ERRCLR_LOW		(NOC_BASE_OFFS + 0xA018)
+#define NOC_SBM_FAULTINEN0_LOW			(NOC_BASE_OFFS + 0x7040)
+
+#define NOC5_RESET_VPP0_ONLY_DISABLED		0x36010E
+#define NOC5_RESET_VPP1_DISABLED		0x35000F
+#define NOC5_RESET_ALL_VPP_ENABLED		0x37010F
+
+#define NOC_LPI_PD_QREQ				BIT(0)
+#define NOC_SBM_FAULTINEN0_PORT0		BIT(0)
+#define NOC_ERRORLOGGER_MAINCTL_FAULTEN		BIT(0)
+#define NOC_ERL_ERRORLOGGER_ERRCLR		BIT(0)
+#define AON_MVP_NOC_ARCG_OVERRIDE		BIT(0)
+
+#define WRAPPER_INTR_MASK_SS_CPU_NOC		BIT(6)
+#define WRAPPER_INTR_MASK_SS_NOC		BIT(5)
+
+static bool iris_vpu5x_hw_power_collapsed(struct iris_core *core)
+{
+	u32 value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
+
+	return !(value & CORE_PWR_ON);
+}
+
+static int iris_vpu5x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32 efuse_value)
+{
+	int ret;
+
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], hw_mode);
+	if (ret)
+		return ret;
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
+		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
+					      [IRIS_VPP0_HW_POWER_DOMAIN], hw_mode);
+		if (ret)
+			goto restore_hw_domain_mode;
+	}
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
+		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
+					      [IRIS_VPP1_HW_POWER_DOMAIN], hw_mode);
+		if (ret)
+			goto restore_vpp0_domain_mode;
+	}
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
+		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
+					      [IRIS_APV_HW_POWER_DOMAIN], hw_mode);
+		if (ret)
+			goto restore_vpp1_domain_mode;
+	}
+
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_MM_INT_POWER_DOMAIN],
+				      hw_mode);
+	if (ret)
+		goto restore_apv_domain_mode;
+
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_CX_INT_POWER_DOMAIN],
+				      hw_mode);
+	if (ret)
+		goto restore_mm_int_domain_mode;
+
+	return 0;
+
+restore_mm_int_domain_mode:
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_MM_INT_POWER_DOMAIN], !hw_mode);
+
+restore_apv_domain_mode:
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
+		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN],
+					!hw_mode);
+restore_vpp1_domain_mode:
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP1_HW_POWER_DOMAIN],
+					!hw_mode);
+restore_vpp0_domain_mode:
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP0_HW_POWER_DOMAIN],
+					!hw_mode);
+restore_hw_domain_mode:
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], !hw_mode);
+
+	return ret;
+}
+
+static int iris_vpu5x_set_hwmode(struct iris_core *core)
+{
+	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
+		iris_vpu4x_vpu5x_ahb_sync_reset_apv(core);
+
+	iris_vpu4x_vpu5x_ahb_sync_reset_hardware(core);
+
+	return iris_vpu5x_genpd_set_hwmode(core, true, efuse_value);
+}
+
+/*
+ * Perform an LPI power-down handshake on a single NOC interface.
+ *
+ * Sets QREQ and polls for the status DONE bit. On a busy response the request
+ * is toggled and, when @errclr_offs is non-zero, the NOC error-log clear
+ * register at that offset is written between retries to unblock the fabric.
+ * Pass @errclr_offs = 0 for interfaces that do not require error clearing.
+ */
+static void iris_vpu5x_noc_lpi_handshake(struct iris_core *core,
+					 u32 ctrl_offs, u32 status_offs,
+					 u32 busy_mask, u32 errclr_offs,
+					 const char *name)
+{
+	bool handshake_done, handshake_busy;
+	u32 value, count = 0;
+	int ret;
+
+	do {
+		if (errclr_offs) {
+			value = readl(core->reg_base + errclr_offs);
+			value |= NOC_ERL_ERRORLOGGER_ERRCLR;
+			writel(value, core->reg_base + errclr_offs);
+		}
+
+		value = readl(core->reg_base + ctrl_offs);
+		value |= NOC_LPI_PD_QREQ;
+		writel(value, core->reg_base + ctrl_offs);
+		usleep_range(10, 20);
+
+		value = readl(core->reg_base + status_offs);
+		handshake_done = value & NOC_LPI_STATUS_DONE;
+		handshake_busy = value & busy_mask;
+
+		if (handshake_done || !handshake_busy)
+			break;
+
+		value = readl(core->reg_base + ctrl_offs);
+		value &= ~NOC_LPI_PD_QREQ;
+		writel(value, core->reg_base + ctrl_offs);
+		usleep_range(10, 20);
+
+	} while (++count < 1000);
+
+	if (!handshake_done && handshake_busy)
+		dev_err(core->dev, "%s NOC LPI handshake timeout\n", name);
+
+	ret = readl_poll_timeout(core->reg_base + status_offs,
+				 value, value & NOC_LPI_STATUS_DONE, 200, 2000);
+	if (ret)
+		dev_err(core->dev, "%s NOC LPI status timeout\n", name);
+
+	value = readl(core->reg_base + ctrl_offs);
+	value &= ~NOC_LPI_PD_QREQ;
+	writel(value, core->reg_base + ctrl_offs);
+}
+
+static int iris_vpu5x_power_on_cx_int(struct iris_core *core)
+{
+	u32 value;
+	int ret;
+
+	ret = iris_enable_power_domains(core,
+					core->pmdomain_tbl->pd_devs[IRIS_CX_INT_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CX_AXI_CLK);
+	if (ret)
+		goto err_disable_cx_int_power;
+
+	value = readl(core->reg_base + WRAPPER_MVP_NOC_CX_LPI_CONTROL);
+	value &= ~NOC_LPI_PD_QREQ;
+	writel(value, core->reg_base + WRAPPER_MVP_NOC_CX_LPI_CONTROL);
+
+	readl_poll_timeout(core->reg_base + WRAPPER_MVP_NOC_CX_LPI_STATUS,
+			   value, !(value & NOC_LPI_STATUS_DONE), 200, 2000);
+
+	return 0;
+
+err_disable_cx_int_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CX_INT_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static void iris_vpu5x_power_off_cx_int(struct iris_core *core)
+{
+	iris_vpu5x_noc_lpi_handshake(core,
+				     WRAPPER_MVP_NOC_CX_LPI_CONTROL,
+				     WRAPPER_MVP_NOC_CX_LPI_STATUS,
+				     NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE,
+				     NOC_ERL_ERRORLOGGER_ERRCLR_LOW, "CX");
+
+	iris_disable_unprepare_clock(core, IRIS_CX_AXI_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CX_INT_POWER_DOMAIN]);
+}
+
+static int iris_vpu5x_power_on_mm_int(struct iris_core *core)
+{
+	u32 value;
+	int ret;
+
+	ret = iris_enable_power_domains(core,
+					core->pmdomain_tbl->pd_devs[IRIS_MM_INT_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
+	if (ret)
+		goto err_disable_mm_int_power;
+
+	value = readl(core->reg_base + WRAPPER_MVP_NOC_LPI_CONTROL);
+	value &= ~NOC_LPI_PD_QREQ;
+	writel(value, core->reg_base + WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	readl_poll_timeout(core->reg_base + WRAPPER_MVP_NOC_LPI_STATUS,
+			   value, !(value & NOC_LPI_STATUS_DONE), 200, 2000);
+
+	return 0;
+
+err_disable_mm_int_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_MM_INT_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static void iris_vpu5x_power_off_mm_int(struct iris_core *core)
+{
+	u32 value;
+
+	value = readl(core->reg_base + WRAPPER_MVP_NOC_LPI_CONTROL);
+	value &= ~NOC_LPI_PD_QREQ;
+	writel(value, core->reg_base + WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	value = readl(core->reg_base + WRAPPER_MVP_NOC_CX_LPI_CONTROL);
+	value &= ~NOC_LPI_PD_QREQ;
+	writel(value, core->reg_base + WRAPPER_MVP_NOC_CX_LPI_CONTROL);
+
+	iris_vpu5x_noc_lpi_handshake(core,
+				     WRAPPER_MVP_NOC_LPI_CONTROL,
+				     WRAPPER_MVP_NOC_LPI_STATUS,
+				     NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE,
+				     NOC_ERL_ERRORLOGGER_ERRCLR_LOW, "MM");
+
+	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_MM_INT_POWER_DOMAIN]);
+}
+
+static int iris_vpu5x_enable_hw_clocks(struct iris_core *core, u32 efuse_value)
+{
+	int ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_axi_clk;
+
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret)
+		goto err_disable_hw_clk;
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
+		ret = iris_prepare_enable_clock(core, IRIS_VPP0_HW_CLK);
+		if (ret)
+			goto err_disable_bse_clk;
+	}
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
+		ret = iris_prepare_enable_clock(core, IRIS_VPP1_HW_CLK);
+		if (ret)
+			goto err_disable_vpp0_clk;
+	}
+
+	ret = iris_prepare_enable_clock(core, IRIS_VPP_GATING_CLK);
+	if (ret)
+		goto err_disable_vpp1_clk;
+
+	return 0;
+
+err_disable_vpp1_clk:
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		iris_disable_unprepare_clock(core, IRIS_VPP1_HW_CLK);
+err_disable_vpp0_clk:
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		iris_disable_unprepare_clock(core, IRIS_VPP0_HW_CLK);
+err_disable_bse_clk:
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
+err_disable_hw_clk:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_axi_clk:
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+
+	return ret;
+}
+
+static void iris_vpu5x_disable_hw_clocks(struct iris_core *core, u32 efuse_value)
+{
+	iris_disable_unprepare_clock(core, IRIS_VPP_GATING_CLK);
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		iris_disable_unprepare_clock(core, IRIS_VPP1_HW_CLK);
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		iris_disable_unprepare_clock(core, IRIS_VPP0_HW_CLK);
+
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+}
+
+static int iris_vpu5x_power_on_hardware(struct iris_core *core)
+{
+	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
+	int ret;
+
+	ret = iris_vpu5x_power_on_cx_int(core);
+	if (ret)
+		return ret;
+
+	ret = iris_vpu5x_power_on_mm_int(core);
+	if (ret)
+		goto err_disable_cx_int;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		goto err_disable_mm_int;
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
+		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
+						[IRIS_VPP0_HW_POWER_DOMAIN]);
+		if (ret)
+			goto err_disable_hw_power;
+	}
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
+		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
+						[IRIS_VPP1_HW_POWER_DOMAIN]);
+		if (ret)
+			goto err_disable_vpp0_power;
+	}
+
+	ret = iris_vpu5x_enable_hw_clocks(core, efuse_value);
+	if (ret)
+		goto err_disable_vpp1_power;
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
+		ret = iris_vpu4x_vpu5x_power_on_apv(core);
+		if (ret)
+			goto err_disable_hw_clocks;
+	}
+
+	return 0;
+
+err_disable_hw_clocks:
+	iris_vpu5x_disable_hw_clocks(core, efuse_value);
+err_disable_vpp1_power:
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
+					   [IRIS_VPP1_HW_POWER_DOMAIN]);
+err_disable_vpp0_power:
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
+					   [IRIS_VPP0_HW_POWER_DOMAIN]);
+err_disable_hw_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+err_disable_mm_int:
+	iris_vpu5x_power_off_mm_int(core);
+err_disable_cx_int:
+	iris_vpu5x_power_off_cx_int(core);
+
+	return ret;
+}
+
+static void iris_vpu5x_power_off_hardware(struct iris_core *core)
+{
+	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
+	u32 noc_reset_mask;
+	u32 value;
+	int ret;
+
+	iris_vpu5x_genpd_set_hwmode(core, false, efuse_value);
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
+		iris_vpu4x_vpu5x_power_off_apv(core);
+
+	if (iris_vpu5x_hw_power_collapsed(core))
+		goto disable_clocks_and_power;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+	if (value & CORE_CLK_HALT)
+		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN,
+			   value, (value & VPU_IDLE_BITS) == VPU_IDLE_BITS, 2000, 20000);
+
+	if (efuse_value & DISABLE_VIDEO_VPP0_BIT)
+		noc_reset_mask = NOC5_RESET_VPP0_ONLY_DISABLED;
+	else if (efuse_value & DISABLE_VIDEO_VPP1_BIT)
+		noc_reset_mask = NOC5_RESET_VPP1_DISABLED;
+	else
+		noc_reset_mask = NOC5_RESET_ALL_VPP_ENABLED;
+
+	writel(noc_reset_mask, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 value, (value & noc_reset_mask) == noc_reset_mask, 200, 2000);
+	if (ret)
+		dev_err(core->dev, "MVP NOC reset ack timeout\n");
+
+	writel(noc_reset_mask, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 value, value == 0x0, 200, 2000);
+	if (ret)
+		dev_err(core->dev, "MVP NOC reset deassert timeout\n");
+
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
+	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
+disable_clocks_and_power:
+	iris_vpu5x_disable_hw_clocks(core, efuse_value);
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
+					   [IRIS_VPP1_HW_POWER_DOMAIN]);
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
+					   [IRIS_VPP0_HW_POWER_DOMAIN]);
+
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_vpu5x_power_off_mm_int(core);
+	iris_vpu5x_power_off_cx_int(core);
+}
+
+static int iris_vpu5x_power_on_controller(struct iris_core *core)
+{
+	u32 mask_val;
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
+	if (ret)
+		goto err_disable_ctrl_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXIC_CLK);
+	if (ret)
+		goto err_disable_ctrl_clk;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_FREERUN_CLK);
+	if (ret)
+		goto err_disable_axic_clk;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_DEBUG_CLK);
+	if (ret)
+		goto err_disable_ctrl_freerun_clk;
+
+	mask_val = readl(core->reg_base + CPU_NOC_SBM_FAULTINEN0_LOW);
+	mask_val |= NOC_SBM_FAULTINEN0_PORT0;
+	writel(mask_val, core->reg_base + CPU_NOC_SBM_FAULTINEN0_LOW);
+
+	mask_val = readl(core->reg_base + CPU_NOC_ERRORLOGGER_MAINCTL_LOW);
+	mask_val |= NOC_ERRORLOGGER_MAINCTL_FAULTEN;
+	writel(mask_val, core->reg_base + CPU_NOC_ERRORLOGGER_MAINCTL_LOW);
+
+	mask_val = readl(core->reg_base + WRAPPER_INTR_MASK);
+	mask_val &= ~WRAPPER_INTR_MASK_SS_CPU_NOC;
+	writel(mask_val, core->reg_base + WRAPPER_INTR_MASK);
+
+	mask_val = readl(core->reg_base + NOC_SBM_FAULTINEN0_LOW);
+	mask_val |= NOC_SBM_FAULTINEN0_PORT0;
+	writel(mask_val, core->reg_base + NOC_SBM_FAULTINEN0_LOW);
+
+	mask_val = readl(core->reg_base + NOC_ERL_ERRORLOGGER_MAINCTL_LOW);
+	mask_val |= NOC_ERRORLOGGER_MAINCTL_FAULTEN;
+	writel(mask_val, core->reg_base + NOC_ERL_ERRORLOGGER_MAINCTL_LOW);
+
+	mask_val = readl(core->reg_base + WRAPPER_INTR_MASK);
+	mask_val &= ~WRAPPER_INTR_MASK_SS_NOC;
+	writel(mask_val, core->reg_base + WRAPPER_INTR_MASK);
+
+	return 0;
+
+err_disable_ctrl_freerun_clk:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
+err_disable_axic_clk:
+	iris_disable_unprepare_clock(core, IRIS_AXIC_CLK);
+err_disable_ctrl_clk:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+err_disable_ctrl_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static int iris_vpu5x_power_off_controller(struct iris_core *core)
+{
+	u32 ctrl_rst_tbl_size = core->iris_platform_data->controller_rst_tbl_size;
+	u32 value;
+
+	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON,
+	       core->reg_base + CPU_CS_X2RPMH);
+
+	iris_vpu5x_noc_lpi_handshake(core,
+				     WRAPPER_IRIS_CPU_NOC_LPI_CONTROL,
+				     WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
+				     NOC_LPI_STATUS_DENY, 0, "CPU");
+
+	iris_vpu5x_noc_lpi_handshake(core,
+				     AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL,
+				     AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
+				     NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE, 0, "Video CTL");
+
+	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
+	readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
+			   value, value == 0x0, 200, 2000);
+
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_ARCG_CONTROL);
+	value |= AON_MVP_NOC_ARCG_OVERRIDE;
+	writel(value, core->reg_base + AON_WRAPPER_MVP_NOC_ARCG_CONTROL);
+
+	iris_disable_unprepare_clock(core, IRIS_CTRL_DEBUG_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXIC_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+
+	reset_control_bulk_assert(ctrl_rst_tbl_size, core->controller_resets);
+	usleep_range(400, 500);
+	reset_control_bulk_deassert(ctrl_rst_tbl_size, core->controller_resets);
+
+	return 0;
+}
+
+const struct vpu_ops iris_vpu5x_ops = {
+	.power_off_hw		  = iris_vpu5x_power_off_hardware,
+	.power_on_hw		  = iris_vpu5x_power_on_hardware,
+	.power_off_controller	  = iris_vpu5x_power_off_controller,
+	.power_on_controller	  = iris_vpu5x_power_on_controller,
+	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
+	.calc_freq		  = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode		  = iris_vpu5x_set_hwmode,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index cc22c7459c4b77fdcb95b546fb8a55eea522bfb8..888b4b9407d0e0c7222448fe61bf8a41b669d2d6 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
+extern const struct vpu_ops iris_vpu5x_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 33f3d01cf79d763a62a2be9eac910a462bcd479b..3d08ea15eacb7ababaefd6e233b6232ce39f2cb5 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -85,4 +85,8 @@
 #define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
 #define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
 
+#define VPU_IDLE_BITS				0x7103
+#define CORE_CLK_HALT				BIT(0)
+#define CORE_PWR_ON				BIT(1)
+
 #endif

-- 
2.43.0

