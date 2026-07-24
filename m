Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013035.outbound.protection.outlook.com [52.101.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ED5446842;
	Fri, 24 Jul 2026 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909697; cv=fail; b=Bk0Y7xy0w7/dxa3ylUk7UGfbWUfhJouM531ZeSuyCpk5JQGGz1y+6+uSnNq7zxojRWvXUY5d99humJGpt++IFGHkmkvlRpPjJ1Y2JKchktdN7GJc6VLTfBBE2T7FX/rjxRtnXvB3FaZtB1L3wTh2UTlMGSr/BXgAYNgNzuhheKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909697; c=relaxed/simple;
	bh=HoJw+2nXqHElSyJE0nwpGp2lj3SjAfrafVNhz0CS9mY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KB8ZMego9TdV4jNDFBVr+p8+AU0NJ9nxvlIgbnX2bKbank79dgufC/z1nA+8AIXKscOtTu4gq2qvPLoLpeQiZ8P6OYdaMKeciO+MWuq+U+Pam/uS5alFICpqMH3mQVrN7BNPxl57/2GElVu8sXlXEzTw1OZMlGv86uXtroHvLOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lLazvowP; arc=fail smtp.client-ip=52.101.72.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lLazvowP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8xY+o6FisEtxfRiO5INTrTSsX2+p7MtMfnIilqNGQeKm0c4NHs7C2nSOE06sUZjIevxdP27e0J7FMdwacLqdDya5C8gVeKmM5TJI7UQPVeSOzT0ThGmdA+3+iW8F3xKcYM5JkeVMC4lybrxOc5C2iDCMBHl6Rx+SgGB7vlzRiep3l+pz9Zg8+YNZ1ZN7cMQ6cai8xHbROSNPIFJK/5InaHhBw/ioC0Gh530iWSna6YBCht0tZuRuPeC21QwuWDx1Ow2DRuamzjEoMr7BTa/8hmZvBiGwavL/Z4oORbmHk47oNCYqbF4sGzlJIFOmSd9E69rTgZMPy+AQY+s0OrGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=151dHFu9ZrcZ2Ze7eRCmAzTAkfmW+Sjlen+Umdf0J4k=;
 b=VnDX659DinXfYDvQL+Ol3LwBojexRXtUBcWT9FiC8S9/ndQj0V+WIPRlpwSa2xEXgL3PCqXVKuLCt2alEsic2o8feeWXNtAIrTEdvMAScAONnNGXV7OoVeQ8nfZUlLhUVxRgW2VwICIohsPv5daOy4/6QQSsm0ZunhTja+cf5U6E2lRdq07DAzT06TjoNhThOBk3BwVsgoLlXfeZ028mTyBCrX/b9u426omGJyhrtxPN1Cw9WJoZTynwHxyVrksU+u9vASzgqR27c8Odt4SC3QRrYFz6K18FHq4/Ut6exyRMiEWR1k2bgXp8m+ETym0bITLRfbRLok5XGBkHlIuUqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=151dHFu9ZrcZ2Ze7eRCmAzTAkfmW+Sjlen+Umdf0J4k=;
 b=lLazvowPp7PlcPEHTyxXfRdddVIhoIpnvn66jH9gDLjgIv35hLnvCpT8pd1LZNqcK6uSo2V+VIZ6/290ON0nhbrCVYVgR49vVO1EjOhXCgT03a9E2C3cjdJIjOhyyG4l0YRDDmVAqGVaES/oTBc4bt6xziGJ91+9pTgILsy56HFi/OckJzjgFcjc56JqMcXUqU/RVnnv84s7Wk3GNmeSm2C63q4f+lAEbBmdJFIbVZjxuo6kHgywUQh+3UbwhC28/zJL9eUw5qWZmBg/EIAk4FNoaQVDJM2pH+lN6YdBmligfbXbUi3FEe4xJEhvYlPl/fB/SXyi0LNQRAa74pJcgw==
Received: from DB8P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::18)
 by DB8PR10MB3864.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:165::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 16:14:19 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::42) by DB8P191CA0008.outlook.office365.com
 (2603:10a6:10:130::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 16:14:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 16:14:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:19:33 +0200
Received: from localhost (10.252.22.128) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:14:18 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 24 Jul 2026 18:13:49 +0200
Subject: [PATCH v3 08/13] media: stm32: dcmipp: add pixel pipes helper
 functions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260724-stm32-dcmipp-pixel-pipes-support-v3-8-f77fe7e723d9@foss.st.com>
References: <20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com>
In-Reply-To: <20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EA:EE_|DB8PR10MB3864:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c6614c7-ec24-48be-611b-08dee99e9ddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	woLpMH5n9DRnzNErtqZEBNeBdh1m11RR1lwSEzWlA92EK4TS20Yvy0BYkGv3phINyMvCl0ZN46gtadaaKedYBFWc4szhS9GaFi1f43lvGfPLQEKk4c373BMzxaREsEVPSMzyqjPU3BSoDr8G7l9IntJi/Q41eMj78cqrd6vd3FvMnLW/osra/V1uic617jq41FhYN1qdSPqJ7nNLhKJr4CLEe8akBUAl7PeGMNx9+R+GWeujSfHcDOE49/WrF70eeAXG1OEzz7UaERWWjyo0Iw6pYQ2N1owhWHuDMWXzk4vJZmrLSDJpeCpxSzgjlFuoPu8tbd+FDVFSVLKAxslexOTMt2fJsYSng1BBgfHd7yM3KXKabIwr/Wt2VV0W+DSm7Wn4Ve7iLxGO722cgiqW59kA5BkeHjHGG/6dlFfnsSMVyMbNF001lHGP+Z6xrUhEBoQAKzC2w0zk09WsvLdNlM6pcaqvYhlpHnc96+XMUd+JFnwKYK7X8197TDTTjE6lU38yfeMc31n4xpVgGkKFWE+EyC+v+8hSX1ZIv65/3VxabWg4Wq+kdQNLh8w40v64MWcfEUXUxTHvb5sXMT2k8Rt95Xbt+MH48z0EpMacfWYofN9Twag5xY/qzHjVvsrj4wKGHKSGgdMrWBLbUVYEc+bLcfcXK2eaFIPWkUz/abt59CKnKW0BotUgiDurdTtvK0rMujU4/pwdZ9uFIDdBDA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	arrz2x6UOVCYJlOAT7Kt5oiQvDKktd7Vilu78vJfOF5NiJiK/0Pg0JRMc2W4/WLMUUqgQjSxwp2g+w96EB3QEGBrfwo5s5dXjC3VWtssV2+D+X25Ep2XpOohdCERKGlxMa7eSwnybYvOMFuYCQh6iApg8V8xRySDtnp0U0FVmoWMcVeZCpv8HEZtr3SeMH/rPiGbutS2nYAnMa8B1F3avuAk1przklemSrgJTr3fhqoU5rxw/QtR1ctj3GQyK7UY+5ePhHLLv4qMaWSnyHkyncjpEDstgcAc4b9U7YuOWFaE8aFkDzjXQqVaLfLN0mEeRpWnb1whFC0aYGztVHJe6YOuCCQsPMK83K8BLEUuNkL8j+05y1OLJbNXkWAC+IF8AeWIcXbA9aShozY00rPwUClmPALttC4huJHAeHbQKodRzcTdVdc6M0ldFBSZVrP8
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 16:14:19.4439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6614c7-ec24-48be-611b-08dee99e9ddb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3864

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

