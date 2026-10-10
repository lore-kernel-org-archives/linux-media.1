Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF3D4A7C8C
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648096; cv=none; b=PpftXRhZoC1f8L5twQvqL3aBu6OBgY1brGsl9xOpxBxzY9zLeOUYKkkz6vKiIr4gfoldIt3i5UGrpZoWT1gcoONwa5TBE3OBx2g9NKIk+EAAjsiLwUHqHj5dERrJjuX73Vo5cAH0nsXtZj1aLDFb3zAxrMOmAfZw5/kTn/r6n14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648096; c=relaxed/simple;
	bh=nw7yk/XvhduzqxVq18Q0re7+9dm05HNID7+UDuhSrSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nl39UTJb070kGfoCW0BQZvouW/A7D74653J454jxV1EyoqhR2MFG+jVo47gSfg4uFbyChyIh73Q5w/VN6XdWCseQRgnIilTD8Kg3EKvUIy8amWrFsxX6kC9Ftpa/XieczF9ltaO5fyNrELoM8XGjzmaYH719qbW2N1n8hS90aWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mSASV4JN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VVOeaZnF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mSASV4JN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VVOeaZnF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPxID796741
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EodJfOEbQbP8v80lUa29zt/d3xZBTGMoPI3Tbs9IrLs=; b=mSASV4JNHKvoxwCE
	tIz52gtEkon8Cfo/1gGivbbbV95F725EpCm8iHfDdp2B/d8PggGSSkonedsqlU/r
	WkViwKfTb52GGVasRocMaCAd1JrL+P17aZ/zYu+cq0Pcx0eikETaj9eifFXus+5L
	eD4i5MR/hJSga1dY8X7blAa5jkrKCTj64+cvGXEzMdm2xPbt911JHprR5NkYtZ4z
	iAj14DrDy9WbVFuOxv0mx2OolVCz1q2vPTUH4mAhhNpbmn48ND9rh6JW/TSweTS6
	Guxuovc6v5THtYPrXyS5yA1Uy1jlNbffvAstFRv638QbRV6rvSgm8y7cZ52vfQ2+
	tlB6ig==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7aqmsr1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d49d8dee1so1188168eec.0
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 09:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648091; x=1792252891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EodJfOEbQbP8v80lUa29zt/d3xZBTGMoPI3Tbs9IrLs=;
        b=VVOeaZnF2ekI4YwNCxAphA4cOa6lK1jpD1ZaJ8xw2yd3sr/2sltTr9lMImU5ursZDS
         Y7fOIQ0boOflykfKDBxn/Y2p6ADNC96ZQ+HX3vm225j60s09No8aUTUrG2e15jilyTPl
         vmKZ+PETPVD6YF6GdhmfZOTl+o1FoTd4L0hXMGHETDq6aZmzTkz2uy3LlBhIN879v5RK
         JHG4QJClNCnAtdwPUBQ1Ok65utfNWkJLO81ThR5/XWOTFUoAdQni0qxusP0xJ15g503J
         kPV+JKd/02CuZ+fWee4whXa61JTrdXrnUpSgZI7ghZrhG/SDbYrEVgL2/isLSg2FVjcP
         MNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648091; x=1792252891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EodJfOEbQbP8v80lUa29zt/d3xZBTGMoPI3Tbs9IrLs=;
        b=EWZU5H+t9vcY5ePH4ZESfRL1Z+kk1DSMFRwNd32TZn+OuI4bWq+c8iwCH/Za3BBLyl
         Ichu/nJmDKcD0uazxv1NYmw3yBZA60+ph4fNiZ8zzjQxf4jggdC7AneUl42FC5m7Wb8/
         meRSaOR0xZ+W60xa0G0VhNZJRzUW3dmUkljvmSfkyRu0mXAjPBfS96W6MqGt7ZGUBT+Z
         C+VEAEFPHeF7NCLqZDD80Z1deSheDHYruUjdKgHUO84kSGK4ewlvABhzNMiLxw6AOGf3
         KiNRS7VdWkRPb3wqDBVlS6Mg6Roym3LmEiuNf5n7L5DdctJFtCS67ASJ20wQkwB/C2mM
         TnCg==
X-Forwarded-Encrypted: i=1; AKwUvBykiEEO1PLDvFS79BmNfFowadi2bS3wa2IRsht3RwAVrlR8O5pl0g5m2GUySrTDYmUyEXbXlDeq7TlJpA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKNMkIxesPNy7HmJ2uPQqrasDu9BUBOzpC1GZ+vKB3o9DxEY2Dh
	mQaztWvqb+beGu3ATh3cAovblz8/TRJJnyYC3iTVH+EeBgoU7zKg2AHsUT573b4PwWQzuHYQsnn
	Gd/jXVkpQL4PrBYkLeD0nyfHnw2NHDyBWEKQmnuej6lwW/YpZy0m/SpkO2X2flh/xVQ==
X-Gm-Gg: AYBFou2bNBnDFZq7hr8UOHnvB5JhtvRI6dnp/xdYhhV9qtghgwTcQpUK1Y15U2kPAqQ
	IsBRLtyHVlbLRfiGMinqDvWbzf6NXz+OQzCUpgSg/x/JeRLxV4UfcXpQD6SfjvDA8OEbJjodcBG
	xWqcHeE0m9UOpIW8LezJVRSUee3CoTkOKU5Bw+Am5H+ffNXJnKILdCoa1dz50k6TWCSR6L5QeOR
	JzDIEG4L027Zex/NKuIWITka7V+rS6V6aMAaWNJXOrwQ7TFhFKWW4QlwX148BLKMkQBK5R0j7WT
	5Ued8xhJnboipkqwy6SN+eaZxguUBIxkkpJbHEOEJzd9RM+STWoIHa3ShrxTmkckJLzGa4qy1EI
	jLIlqPc/vnScJGNV8EfgBPMdoC59MJsixDWVegjPXdWca+vdYSN8VtvpIpVQ9Dy+2aqX84hAoVw
	A8GrVRW6ieDQ==
X-Received: by 2002:a05:701b:21c5:b0:158:7ea9:4a92 with SMTP id a92af1059eb24-16a5e968c3emr6174526c88.17.1791648091048;
        Sat, 10 Oct 2026 09:01:31 -0700 (PDT)
X-Received: by 2002:a05:701b:21c5:b0:158:7ea9:4a92 with SMTP id a92af1059eb24-16a5e968c3emr6174477c88.17.1791648090288;
        Sat, 10 Oct 2026 09:01:30 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:29 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:13 -0700
Subject: [PATCH v20 08/13] media: qcom: camss: vfe: Add support for VFE
 1080
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-8-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfXxd23bx8HkOKA
 WFAQmF1o4rbLa3vIe7GwspbnbMtIz6H5262Cwo5lIigIZYklZSg/Fd+w/6vb0N1ama4HTrvEDHV
 BdciGJgDOo8aBiguundIrq8dtj+4iD4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfXxSH25Gzd2bh8
 AGoF+G8ArhPljY+FL8tdXlNYeViQtexZUK7FWmAPaYIFsto1TfRW/dfFGh+i5p8h8PoryKPaESt
 dk/pHpccDPjML+hSEi15YFBmQ9Vqq7TJ5Xx+e9DnBXtimxNkM/FTl3wYzu8d+dZWWwy7igGkxf2
 rKj9wVxUhegpFWlL7SuQUAk8roDpmZgPRa3u0uDNPI7BBD2ApzJSZ7uRco4wzxbzfyY4cjU9U1V
 lk7R/ULR6XZnP1eI8/l0ANIkOeXbi1LkCLhFDA18DcRAAYe3mcYHPD3CyHvk9aoCmRJm9/6h04B
 BxfUuCNJH5jKQSosIkhCEn/gH9/iGmpm9pj0VzSSo4IYquuo8shmvwCaHMJWosoXqwWKzdkBndY
 De3DX3P6dWI5HVQx/TPVz308huXkYe4o5PSoL0L7B2woUESwVekuOA6RuzR5eAlG0Sv4odH3tdY
 QDNdyRPpOxP+OgjiGzg==
X-Authority-Analysis: v=2.4 cv=Uq32pOwB c=1 sm=1 tr=0 ts=6aca615c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1ZGTSUkntXfq-hYXLBIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: BeL_7GEFbs3sR9O5hhM1MT9Ar_IS1U9O
X-Proofpoint-GUID: BeL_7GEFbs3sR9O5hhM1MT9Ar_IS1U9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100063

Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.

In the Kaanapali camera subsystem, the front-end blocks are referred to
as TFEs (Thin Front Ends). This driver continues to use the VFE naming
in some places to preserve consistency with the existing code and avoid
unnecessary renaming. Support is currently limited to three output lines,
matching the constraints of the CAMSS framework.

Kaanapali requires REG_UPDATE and AUP_UPDATE to be issued only after all
CSID configuration has completed. In addition, the number of AUP_UPDATE
requests must match the number of buffers queued to the write master
while it is being enabled.

Although real-time TFE traffic is routed through RT_CAMNOC, both
camnoc_rt_axi and camnoc_nrt_axi clocks must be enabled. This ensures
that the PDX_NOC, which sits downstream of both RT and NRT NOCs, exits
reset in a fully idle state.

Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 197 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   6 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 153 ++++++++++++++++
 5 files changed, 358 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 218ba3a95939..42a14e8fe1b7 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -26,6 +26,7 @@ qcom-camss-objs += \
 		camss-vfe-340.o \
 		camss-vfe-480.o \
 		camss-vfe-680.o \
+		camss-vfe-1080.o \
 		camss-vfe-gen1.o \
 		camss-vfe-gen3.o \
 		camss-vfe-vbif.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1080.c b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
new file mode 100644
index 000000000000..016857cd1025
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-vfe-1080.c
+ *
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module 1080
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+
+#include "camss.h"
+#include "camss-vfe.h"
+
+/* VFE-1080 Bus Register Base Addresses */
+#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+
+#define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
+#define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
+
+#define VFE_BUS_WM_TEST_BUS_CTRL		(BUS_REG_BASE + 0x128)
+
+#define VFE_BUS_WM_CFG(n)			(BUS_REG_BASE + 0x500 + (n) * 0x100)
+#define		WM_CFG_EN				BIT(0)
+#define		WM_VIR_FRM_EN				BIT(1)
+#define		WM_CFG_MODE				BIT(16)
+#define VFE_BUS_WM_IMAGE_ADDR(n)		(BUS_REG_BASE + 0x504 + (n) * 0x100)
+#define VFE_BUS_WM_FRAME_INCR(n)		(BUS_REG_BASE + 0x508 + (n) * 0x100)
+#define VFE_BUS_WM_IMAGE_CFG_0(n)		(BUS_REG_BASE + 0x50C + (n) * 0x100)
+#define		WM_IMAGE_CFG_0_DEFAULT_WIDTH		(0xFFFF)
+#define VFE_BUS_WM_IMAGE_CFG_2(n)		(BUS_REG_BASE + 0x514 + (n) * 0x100)
+#define		WM_IMAGE_CFG_2_DEFAULT_STRIDE		(0xFFFF)
+#define VFE_BUS_WM_PACKER_CFG(n)		(BUS_REG_BASE + 0x518 + (n) * 0x100)
+
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x530 + (n) * 0x100)
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x534 + (n) * 0x100)
+
+/* VFE lite has no such registers */
+#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x538 + (n) * 0x100)
+#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x53C + (n) * 0x100)
+
+#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x560 + (n) * 0x100)
+#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x564 + (n) * 0x100)
+
+/*
+ * IFE write master client IDs
+ *
+ * VIDEO_FULL			0
+ * VIDEO_DC4_Y			1
+ * VIDEO_DC4_C			2
+ * VIDEO_DC16_Y			3
+ * VIDEO_DC16_C			4
+ * DISPLAY_DS2_Y		5
+ * DISPLAY_DS2_C		6
+ * FD_Y				7
+ * FD_C				8
+ * PIXEL_RAW			9
+ * STATS_AEC_BG			10
+ * STATS_AEC_BHIST		11
+ * STATS_TINTLESS_BG		12
+ * STATS_AWB_BG			13
+ * STATS_AWB_BFW		14
+ * STATS_AF_BHIST		15
+ * STATS_ALSC_BG		16
+ * STATS_FLICKER_BAYERRS	17
+ * STATS_TMC_BHIST		18
+ * PDAF_0			19
+ * PDAF_1			20
+ * PDAF_2			21
+ * PDAF_3			22
+ * RDI0				23
+ * RDI1				24
+ * RDI2				25
+ * RDI3				26
+ * RDI4				27
+ *
+ * IFE Lite write master client IDs
+ *
+ * RDI0			0
+ * RDI1			1
+ * RDI2			2
+ * RDI3			3
+ * GAMMA		4
+ * STATES_BE		5
+ */
+#define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
+
+static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
+{
+	struct v4l2_pix_format_mplane *pix =
+		&line->video_out.active_fmt.fmt.pix_mp;
+
+	wm = RDI_WM(wm);
+
+	/* no clock gating at bus input */
+	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
+
+	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
+
+	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
+	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
+	writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
+	       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
+	writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
+	       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
+	writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
+
+	/* no dropped frames, one irq per frame */
+	if (!vfe_is_lite(vfe)) {
+		writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
+		writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
+	}
+
+	writel(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
+	writel(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
+
+	writel(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
+	writel(0xFFFFFFFF, vfe->base + VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(wm));
+
+	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
+}
+
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
+{
+	wm = RDI_WM(wm);
+	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
+}
+
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
+			  struct vfe_line *line)
+{
+	wm = RDI_WM(wm);
+	writel(addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
+
+	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n", wm, addr);
+}
+
+static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	int port_id = line_id;
+
+	camss_reg_update(vfe->camss, vfe->id, port_id, false);
+}
+
+static inline void vfe_reg_update_clear(struct vfe_device *vfe,
+					enum vfe_line_id line_id)
+{
+	int port_id = line_id;
+
+	camss_reg_update(vfe->camss, vfe->id, port_id, true);
+}
+
+static const struct camss_video_ops vfe_video_ops_1080 = {
+	.queue_buffer = vfe_queue_buffer_v2,
+	.flush_buffers = vfe_flush_buffers,
+};
+
+static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
+{
+	vfe->video_ops = vfe_video_ops_1080;
+}
+
+static void vfe_global_reset(struct vfe_device *vfe)
+{
+	vfe_isr_reset_ack(vfe);
+}
+
+static irqreturn_t vfe_isr(int irq, void *dev)
+{
+	/* nop */
+	return IRQ_HANDLED;
+}
+
+static int vfe_halt(struct vfe_device *vfe)
+{
+	/* rely on vfe_disable_output() to stop the VFE */
+	return 0;
+}
+
+const struct vfe_hw_ops vfe_ops_1080 = {
+	.global_reset = vfe_global_reset,
+	.hw_version = vfe_hw_version,
+	.isr = vfe_isr,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
+	.reg_update = vfe_reg_update,
+	.reg_update_clear = vfe_reg_update_clear,
+	.subdev_init = vfe_subdev_init,
+	.vfe_disable = vfe_disable,
+	.vfe_enable = vfe_enable_v2,
+	.vfe_halt = vfe_halt,
+	.vfe_wm_start = vfe_wm_start,
+	.vfe_wm_stop = vfe_wm_stop,
+	.vfe_buf_done = vfe_buf_done,
+	.vfe_wm_update = vfe_wm_update,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..5710fdbe41b3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -353,6 +353,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
@@ -552,7 +553,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		ops->reg_update(vfe, line->id);
+
+		if (!vfe->res->reg_update_after_csid_config)
+			ops->reg_update(vfe, line->id);
 	}
 
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
@@ -2013,6 +2016,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		ret = 16;
 		break;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a37..118cac5daf37 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -133,6 +133,7 @@ struct vfe_isr_ops {
 
 struct vfe_subdev_resources {
 	bool is_lite;
+	bool reg_update_after_csid_config;
 	u8 line_num;
 	bool has_pd;
 	char *pd_name;
@@ -248,6 +249,7 @@ extern const struct vfe_hw_ops vfe_ops_170;
 extern const struct vfe_hw_ops vfe_ops_340;
 extern const struct vfe_hw_ops vfe_ops_480;
 extern const struct vfe_hw_ops vfe_ops_680;
+extern const struct vfe_hw_ops vfe_ops_1080;
 extern const struct vfe_hw_ops vfe_ops_gen3;
 
 int vfe_get(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 261e6c837dd4..5cd9641fea94 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -156,6 +156,157 @@ static const struct camss_subdev_resources csid_res_kaanapali[] = {
 	}
 };
 
+/* In Kaanapali, CAMNOC requires all CPAS_TFEX clocks
+ * to operate on any TFE Full.
+ */
+static const struct camss_subdev_resources vfe_res_kaanapali[] = {
+	/* VFE0 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe0_fast_ahb", "vfe0",
+			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_1080,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe1_fast_ahb", "vfe1",
+			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_1080,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe2_fast_ahb", "vfe2",
+			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_1080,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe_lite_ahb", "vfe_lite",
+			   "cpas_vfe_lite", "camnoc_rt_axi",
+			   "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_1080,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE4 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe_lite_ahb", "vfe_lite",
+			   "cpas_vfe_lite", "camnoc_rt_axi",
+			   "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_1080,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5713,10 +5864,12 @@ static const struct camss_resources kaanapali_resources = {
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_kaanapali,
 	.csid_res = csid_res_kaanapali,
+	.vfe_res = vfe_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
+	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1

