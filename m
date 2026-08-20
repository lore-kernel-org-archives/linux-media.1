Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A446F30D405;
	Thu, 20 Aug 2026 07:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210611; cv=fail; b=XAUSNMNPi/NoTtKm5m46ET2tm6MJs0NBnef6FxQF7f+GRl9e71IwoIBTudErpMG3giTIa25r5MVht+X9L984mtNg+RTHe2uB9AqHR6QW3lU0un+YfjfVxIi92OJvaIACQLl3flPkIGDXh3QQdQDfT205GJLStBSnh//uQSx3Brs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210611; c=relaxed/simple;
	bh=HoJw+2nXqHElSyJE0nwpGp2lj3SjAfrafVNhz0CS9mY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bGNfZtABh3hTnRCojsycDZMSZAYpDdjdIZZ/CcmG/vb1etxjYk+qwrGJuRMCFikZhPS4nE4pCUPWZEddTsd5S1okJ7PhDecQCOa3cVkQCPtUNAWuBQ+C72xXyNSHdoUKwjPa9tvk954ChwfBw4IJcX6P8ZxzLCWm2T7JMYViDng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Lamkqpa+; arc=fail smtp.client-ip=52.101.84.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Lamkqpa+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRHVzl2+0GzLB1KO02aR0rCLumP/+v7eWqrYxrH9PlOFIlB+Q0KOcNPUVB6/2/jfYpJpecjkgcc3pwjxoBfy3iHBtCfeeWa83d5NEs39F6h5dpdIPkb4V9k8EGq0N08+xruOhHB3HS6cPpaASU0NfYegOh8Al9t7iq1OqqvGLBdnq+P3zQC4QxF4bC8eKHrIkgD9+P6gMgbz165+BcFryShY1l4xtOfu6s8wXFUi/yQxXYRupbk2uZ+yTAVUAaWrw24gTrOOVlwLhn5nh1zKVOq2jsP4XKBY8mwzZy77Mxw0xOyCodK7COocUoNTCzK+vQZwv6mCciG6vZKuV3x++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=151dHFu9ZrcZ2Ze7eRCmAzTAkfmW+Sjlen+Umdf0J4k=;
 b=tw0W3/iryHOSQFDnPVf0+8o/Y62ocXdtSKfCBSQoAwyHg8SINVw4dBNzIM6lRwRVd6kUknpWD39GruPRaRgVLGnK/yEbNA+auZXx+07k2O9B/X2628lcdyps/k9fLR3k2VwfTsDlK2JerbKwq8RDqGrJt1yHI+tMDgtPpqQ/BM3UA/KIaGP6jpwyWorZjD+ktP5p/1KrjIQaFwD1tGMaPijSf3iQtrJ8TfYX0yCG0pA2etJgomDf6ifOgAKH6Ll0tSu111Kckwp+jw6T5m+3pCYZ939LsQUPn6cHBc+B+rGOvSYgYtCrFZrKpM2Xbi8KB44IZobG4V9A2fsMZTWkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=151dHFu9ZrcZ2Ze7eRCmAzTAkfmW+Sjlen+Umdf0J4k=;
 b=Lamkqpa+4Lfa5v2lqMoBWOS1Lavqt/wKPSI377A9XLHfSDuDjzl9ciBmcymZaZEps70gshQHavMZl/nDGz+p6Jt/jw4pYGV8bnNQKQio7Rao15o2BlonY3HO1qXRBjFWzs8p0HNoOcgFJVYNYrymC1btmhIBuBIBhcgwHr/JjjTpliuAxkDFz2PrqEVpDNYo/ue/UA3KIZohyQ2T0CzWlb7W5ErqPZJZSompv68iYfjhxhhLWUz++T9OSaBRqZu9e9Ri1QZ3Q+tKneqHPkvzv/JBuSGbV1jQDod8VsVkRoq/BP1LtyJXTFcu3re9D3o7dDpLG1kLpEfbXOw5miY9Vg==
Received: from AS4P192CA0044.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::8)
 by GV1PR10MB5796.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:63::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 07:23:18 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:658:cafe::a6) by AS4P192CA0044.outlook.office365.com
 (2603:10a6:20b:658::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.9 via Frontend Transport; Thu, 20
 Aug 2026 07:23:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 07:23:17 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:28:15 +0200
Received: from localhost (10.252.29.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:23:15 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 20 Aug 2026 09:22:36 +0200
Subject: [PATCH v4 08/14] media: stm32: dcmipp: add pixel pipes helper
 functions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-stm32-dcmipp-pixel-pipes-support-v4-8-d212eb4e3792@foss.st.com>
References: <20260820-stm32-dcmipp-pixel-pipes-support-v4-0-d212eb4e3792@foss.st.com>
In-Reply-To: <20260820-stm32-dcmipp-pixel-pipes-support-v4-0-d212eb4e3792@foss.st.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Hugues Fruchet
	<hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A0:EE_|GV1PR10MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa3b288-ee5f-408d-fe58-08defe8be7e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KFnUNivMiASRNuYlpc+Ynl4NEi9ow910GzIAzDAoRyMoUIr+QvuFWqq+Shjzn6vIHAaXb1B47BfF4VWN7ogJ7Pz3xUUeSI951tvNXHAoS3eaeOtVU6hJIJJpeazx7kCTEuhskG/qdHCBs+L/j/E4IN5UDzyaE3WnmodmeU0s9j7UnltoQiwE+LB8siPQNYeIgIjyGVrBkCo+UGQPOOEpOA8bV7u6j+LGe+AyLiNrX5TWGwGIq1KPD8dlaA+4t+yZe6uLWPXDIxBd7N8myKw+/pczQgRQ19OChAmcMO90IkbIG1qLDwthkiZdQFGfozroGWq3hHBfKrv569Sh08sHb7iez8KryeADXHdOV+zpoB+8IWzmQ5GeEdQvWLcbrY2xVWRl+uVoG0Q72hUqBkJbCy5xHeMmH2/KRvn902JzbINFy16JNwfNJpe1TrPYGUg4J6l5GnvVA27bkH3dArINPZn10sgD3gnLI3AyNCA1PnMRvLG8HinqWytaqW7bygD5PNCYzKYCdJzpjhizoJRWTlw8JbkmwG/bZlDkLq3d/8Fj6SLbmvguVE7tsR3axulKWSa3MpOJlUgojttAKVk97ZxFHaTQuwC1uQLfqShn8D+Xrb18KGRV53pFljhUHHTzkh3XoIY3S5/ypCxokPeuuaFGugGSVUqX5XDZuy8UoZ4C+/wUGddQ134RJP5rBd7vOVt+EaNMGE7A1bsbK2mNaQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pZRqpcZLglJr5NPPMWxqw+dw7J29kLECBexvQdOAnLBLMdU9/bkGPqKLpMPyDeOF2+hQ9rjDfoCl6BxwkT3c1LLvzWigeu4UkOb7MV6No/rb7S6HPBBBdxEkRk12+EQYhcnTaHYYl3wrrVPPxG/75O3D65x6rchB0b7zzJ5q0tGecYzF/kIxriPz+m9yvFoFVOyyUCfp+5SRLjKHKkGHckeXnBHpDD2cqGGtJ8jyVivKMmeHZXTS/r28CP1m1808u5u9a46F2WN8W4GC5wberBXNBYMonuBuJr6wniOv6/Rt36l1OXnPdWguHHef1z8OFdtzdxiyACF+nC5ubHOIARFVpxqfS6sdRDpMUDiIWzOJVAUMwYQ0kbIJi2ZF0vZWubyv/H78RML6T4tg01yxC/smVb6YGWgB1WvD3BXsenT+NSXiFqhnr2y1u6OoP4Z3
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:23:17.7183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa3b288-ee5f-408d-fe58-08defe8be7e9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5796

Pixel pipes are made of an isp subdev (only main pipe) and a
postproc subdev. This commit add a helper functions common to
those 2 subdevs such as for handling format enumeration,
set_selection handling, so that they do not have to be
duplicated in the two subdeves.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   1 +
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c     | 180 +++++++++++++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h     |  41 +++++
 3 files changed, 222 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
index 159105fb40b88..54231569ed6fe 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-bytecap.o
+stm32-dcmipp-y += dcmipp-pixelcommon.o
 
 obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c
new file mode 100644
index 0000000000000..8b0699e870ef6
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for STM32 Digital Camera Memory Interface Pixel Processor
+ *
+ * Copyright (C) STMicroelectronics SA 2026
+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
+ *          Alain Volmat <alain.volmat@foss.st.com>
+ *          for STMicroelectronics.
+ */
+
+#include <linux/v4l2-mediabus.h>
+#include <media/v4l2-rect.h>
+#include <media/v4l2-subdev.h>
+
+#include "dcmipp-common.h"
+#include "dcmipp-pixelcommon.h"
+
+#define DCMIPP_ENT(id, pad) (1 << (2 * (id) + (pad)))
+#define DCMIPP_ISP_SINK			(DCMIPP_ENT(DCMIPP_ISP, 0))
+#define DCMIPP_ISP_SRC			(DCMIPP_ENT(DCMIPP_ISP, 1))
+#define DCMIPP_ISP_INOUT		(DCMIPP_ISP_SINK | DCMIPP_ISP_SRC)
+#define DCMIPP_MAIN_POSTPROC_SINK	(DCMIPP_ENT(DCMIPP_MAIN, 0))
+#define DCMIPP_MAIN_POSTPROC_SRC	(DCMIPP_ENT(DCMIPP_MAIN, 1))
+#define DCMIPP_MAIN_POSTPROC_INOUT					\
+	(DCMIPP_MAIN_POSTPROC_SINK | DCMIPP_MAIN_POSTPROC_SRC)
+#define DCMIPP_AUX_POSTPROC_SINK	(DCMIPP_ENT(DCMIPP_AUX, 0))
+#define DCMIPP_AUX_POSTPROC_SRC	(DCMIPP_ENT(DCMIPP_AUX, 1))
+#define DCMIPP_AUX_POSTPROC_INOUT					\
+	(DCMIPP_AUX_POSTPROC_SINK | DCMIPP_AUX_POSTPROC_SRC)
+#define DCMIPP_ALL_POSTPROC_SINK					\
+	(DCMIPP_MAIN_POSTPROC_SINK | DCMIPP_AUX_POSTPROC_SINK)
+#define DCMIPP_ALL_POSTPROC_INOUT					\
+	(DCMIPP_MAIN_POSTPROC_INOUT | DCMIPP_AUX_POSTPROC_INOUT)
+
+#define PIXMAP_MBUS(mbus, applicable_pipes)		\
+	{						\
+		.code = MEDIA_BUS_FMT_##mbus,		\
+		.pipes = applicable_pipes,		\
+	}
+static const struct dcmipp_pixelpipe_pix_map
+dcmipp_pixel_formats_list[] = {
+	/* RGB formats */
+	/* RGB565 / RGB888 */
+	PIXMAP_MBUS(RGB565_2X8_LE, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(RGB565_1X16, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(RGB888_3X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(RGB888_1X24, DCMIPP_ALL_POSTPROC_INOUT | DCMIPP_ISP_INOUT),
+	/* YUV formats */
+	PIXMAP_MBUS(YUYV8_2X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(UYVY8_1X16, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(YUV8_1X24, DCMIPP_ALL_POSTPROC_INOUT | DCMIPP_ISP_SRC),
+	/* GREY */
+	PIXMAP_MBUS(Y8_1X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(Y10_1X10, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(Y12_1X12, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(Y14_1X14, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	/* Raw Bayer */
+	/* Raw 8 */
+	PIXMAP_MBUS(SBGGR8_1X8, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGBRG8_1X8, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGRBG8_1X8, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SRGGB8_1X8, DCMIPP_ISP_SINK),
+	/* Raw 10 */
+	PIXMAP_MBUS(SBGGR10_1X10, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGBRG10_1X10, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGRBG10_1X10, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SRGGB10_1X10, DCMIPP_ISP_SINK),
+	/* Raw 12 */
+	PIXMAP_MBUS(SBGGR12_1X12, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGBRG12_1X12, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGRBG12_1X12, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SRGGB12_1X12, DCMIPP_ISP_SINK),
+	/* Raw 14 */
+	PIXMAP_MBUS(SBGGR14_1X14, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGBRG14_1X14, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGRBG14_1X14, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SRGGB14_1X14, DCMIPP_ISP_SINK),
+};
+
+const struct dcmipp_pixelpipe_pix_map *
+dcmipp_pixelpipe_pix_map_by_code(__u32 code, unsigned int id, unsigned int pad)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(dcmipp_pixel_formats_list); i++) {
+		if (dcmipp_pixel_formats_list[i].code == code &&
+		    dcmipp_pixel_formats_list[i].pipes & DCMIPP_ENT(id, pad))
+			return &dcmipp_pixel_formats_list[i];
+	}
+
+	return NULL;
+}
+
+int dcmipp_pixelpipe_enum_mbus_code(unsigned int id,
+				    struct v4l2_subdev_mbus_code_enum *code)
+{
+	unsigned int index = code->index;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(dcmipp_pixel_formats_list); i++) {
+		if (!(dcmipp_pixel_formats_list[i].pipes &
+		      DCMIPP_ENT(id, code->pad)))
+			continue;
+
+		if (index == 0)
+			break;
+
+		index--;
+	}
+
+	if (i == ARRAY_SIZE(dcmipp_pixel_formats_list))
+		return -EINVAL;
+
+	code->code = dcmipp_pixel_formats_list[i].code;
+
+	return 0;
+}
+
+int dcmipp_pixelpipe_enum_frame_size(unsigned int id,
+				     struct v4l2_subdev_frame_size_enum *fse)
+{
+	const struct dcmipp_pixelpipe_pix_map *vpix;
+
+	if (fse->index)
+		return -EINVAL;
+
+	/* Only accept code in the pix map table */
+	vpix = dcmipp_pixelpipe_pix_map_by_code(fse->code, id, fse->pad);
+	if (!vpix)
+		return -EINVAL;
+
+	fse->min_width = DCMIPP_FRAME_MIN_WIDTH;
+	fse->max_width = DCMIPP_FRAME_MAX_WIDTH;
+	fse->min_height = DCMIPP_FRAME_MIN_HEIGHT;
+	fse->max_height = DCMIPP_FRAME_MAX_HEIGHT;
+
+	return 0;
+}
+
+int dcmipp_pixelpipe_get_selection(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_selection *s)
+{
+	struct v4l2_mbus_framefmt *sink_fmt;
+
+	if (IS_SRC(s->pad))
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+		s->r = *v4l2_subdev_state_get_crop(state, s->pad);
+		break;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sink_fmt = v4l2_subdev_state_get_format(state, s->pad);
+		s->r.top = 0;
+		s->r.left = 0;
+		s->r.width = sink_fmt->width;
+		s->r.height = sink_fmt->height;
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		s->r = *v4l2_subdev_state_get_compose(state, s->pad);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+__u32 dcmipp_pixelpipe_src_format(__u32 input_format)
+{
+	if (input_format >= MEDIA_BUS_FMT_Y8_1X8 &&
+	    input_format < MEDIA_BUS_FMT_SBGGR8_1X8)
+		return MEDIA_BUS_FMT_YUV8_1X24;
+
+	return MEDIA_BUS_FMT_RGB888_1X24;
+}
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h
new file mode 100644
index 0000000000000..db29e1fe939e3
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Driver for STM32 Digital Camera Memory Interface Pixel Processor
+ *
+ * Copyright (C) STMicroelectronics SA 2026
+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
+ *          Alain Volmat <alain.volmat@foss.st.com>
+ *          for STMicroelectronics.
+ */
+
+#ifndef _DCMIPP_PIXELCOMMON_H
+#define _DCMIPP_PIXELCOMMON_H
+
+#define IS_SINK(pad) (!(pad))
+#define IS_SRC(pad)  ((pad))
+
+#define DCMIPP_ISP		0
+#define DCMIPP_MAIN		1
+#define DCMIPP_AUX		2
+
+struct dcmipp_pixelpipe_pix_map {
+	__u32 code;
+	__u32 pipes;
+};
+
+const struct dcmipp_pixelpipe_pix_map *
+dcmipp_pixelpipe_pix_map_by_code(__u32 code, unsigned int id, unsigned int pad);
+
+int dcmipp_pixelpipe_enum_mbus_code(unsigned int id,
+				    struct v4l2_subdev_mbus_code_enum *code);
+
+int dcmipp_pixelpipe_enum_frame_size(unsigned int id,
+				     struct v4l2_subdev_frame_size_enum *fse);
+
+int dcmipp_pixelpipe_get_selection(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_selection *s);
+
+__u32 dcmipp_pixelpipe_src_format(__u32 input_format);
+
+#endif

-- 
2.34.1

