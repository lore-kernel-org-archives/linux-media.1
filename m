Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6C0448CE6;
	Fri, 24 Jul 2026 16:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909706; cv=fail; b=d0Nk51yAnPSyTDvnr36ZosYhH8FVqpQMzUNp+wSAWzN03f89njUtcFUy8oZL5+VqFVl2HQxhLWjjH5XG11Ukll/xRavtBZ4nvQq6HHkRPZyhET111jUMLhxFNDICFn+RhvSO8tWs6NvsTSQToOTIi7e08udqTFQVQQUDBiZzTwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909706; c=relaxed/simple;
	bh=8znmzNkagkqGefpa6EmGQRUVpa6JPmRtdND5KmqHaCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UVodXA7S4q96evov0Tr5OLK1VIxwoZXz3BfkmRWe3gTH2bjFcot2wEg5Ac8TAOLbmpqJUfKdZfsOzPfgnnJGyhhxeF9fO+oKwx1ew/vDtsYOB0Mxb8jT1dt/VIwUsRbvZQ95XKyTdTpHSdm/BmfTYI+vt0BcHWa5W9HHO+rsR/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=VVDOzLye; arc=fail smtp.client-ip=40.107.162.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="VVDOzLye"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjjefI1g8+xJNxemfIS40BPrGKQLuDTa2YMSttZNv5wZF7FvK8Qlm/2CIehKRoGqCSZ91AeluogHGGqdi7Y1KyLeAmGzrvaqJLXM5xIt3smDvP3Kwkw0gBZEncR6+fVXTcNCjuG5I8afpn+NQ0l6wHmkBflX2o1yy+ueSMipwIdhUcNofYd3zTtUjQfs38o4fT8XQbujUhNvtwMHgxnQvjbjsQuopTXlTvhVZeWTWIOXt3eNJkk+9k3z5TQyhjfZ13xtpIo468zBQt0V1CKckURMuFD5nAYLCuuS0A8ki8+AJTR39bmG8q00jH7bUdgDF3zJdl30+qGJQ/fmfmieLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACqGbKrUZt2WmQJeMKWsHcv5ZC8zxBztFnJ+SPScPJE=;
 b=x6qT5SAmAy2+mqJ0znCUoapanJw2qR17RW+rwO3Bz8vrXcKbHD/edBL/lbA7HhPsCTQ+b2AcHd76BY39Xp4YtB/RV0FQdBwzZEw8I1YOL94gtKQCuF30THhgJblZDS93fvhSYjltdmyE15tVxzWbmku5hXnTon3fPT45kHK3FVsZThMEecy6zZ1sSfpsJC/+TieWxt1v5bB2eORsvbh6i2DticMqGwHZ+Mlytz5OTI6ChiNW32T2UcShbFOn+nBbTXJbT12AU/bVr7j/uJK0CPRI0D6p+EA2RORkMiefNYstkQzHl/WhIq6/lyg4DI0ubvegwy6pE5AWcGCWkAKtlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACqGbKrUZt2WmQJeMKWsHcv5ZC8zxBztFnJ+SPScPJE=;
 b=VVDOzLyej9T2af8kKl/OW3Qb0yLHKG3hk4oO5stPGDxc8lOdxekZ3Lza7if483jk09fpiF6ZmX3Knmna5j/b2RA5HyUxh/KNgwxumqFPpBAUifdNyDs/Lu2agKne7BnlOlENaYfGHYN2xM4R6zLOtxBBMaTTOa2DMHL8P2CAd1AaKEiyaYGgwPqV8z+ETI5KP08PIFrjX2NLDeoYbF0q39R67rH5wkc2aLB4Xt2jVywHx0sSRPvFd5AXrb9y0Qqq5F1is6zCHtckHiTbzmZgNgmvYIzdTqMbj2uGcsltMx/M07SsskCAwtbkQFRzLpyakT8teEtk0ue/9q3K5u7UZQ==
Received: from DUZPR01CA0129.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::12) by VE1PR10MB3837.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:164::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 16:14:20 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::16) by DUZPR01CA0129.outlook.office365.com
 (2603:10a6:10:4bc::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 16:14:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 16:14:20 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:18:57 +0200
Received: from localhost (10.252.22.128) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:14:19 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 24 Jul 2026 18:13:50 +0200
Subject: [PATCH v3 09/13] media: stm32: dcmipp: addition of a dcmipp-isp
 subdev
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260724-stm32-dcmipp-pixel-pipes-support-v3-9-f77fe7e723d9@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|VE1PR10MB3837:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa93adb-c3de-4cee-c37b-08dee99e9e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|56012099006|10067099003|18002099003|22082099003|6133799003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	hbhFu2H1yFFYY0OV/y+JnRCp+ZH1OSONC87bsp2ek8A95/C98p++lnMSnbh9yYqWto30/0cRV6SfOa9FH7rCnfhWVAVHmTmv3Z1iaaLEOlubcIS9TcBsW+GUgAj/XPjUPaitfHN6dz2aRV+yobo9K9C6j1+Hy/ygloh+JcplZArC9M4J92EPp9Qic8FlcgYL+XjDzZSpoakb7kGFRmDnZ9jy7sjg24kOHQD6i/OAk9VZRVZJfrnoly8T6mCchFiEGkTOxptGiwew0P2GmDt4HQp4Gx+kKANh/p7Rcej6RTfFvg3Z1cOik4xsnRIkml09E+fX9ONy+FLm0WByhBIwWKfW27bdyqLJC5XRfzr0qN6ep/rw7YhsZFIFLgAPxXnpI466hq8KiPKqLPw8g95GTEwqgMLxNfZmI0JCtVq4kwvYOSb6ljM+roLsoP3K2/746Jn8bCjOBLfvApH7l64ncJ+90D1xwQNooQ1+ec/gMSXhYhXcEeXdp+KV9b4qXB7ReASSv37Z6XtrRKRfiFT7+kfIIx8DmUZTrgYPUR7Gs/zrEv+cw9ottG7OfnrLZ9FztWQD3KL2PC6V0ycvnLzfLQLBXgDsjX6oohiOkIez7UwKBRYoo8/r3Waun87GwfLkweVkuX0AzfuXjE5JhiQvDcff9KpdLvOYdF3iQQ/Wa+aOrz/2MzECk9P2/qAJe4o0Be8BbSlf1aHVRGWemR8a9g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m//A/GTGjHxsYcOXd3dRdRdNYTGkviAKRdk/TKvfy2N0gx8L4KvJqO5iH3OOUEhJjoHZL8SNNUB8TPFdp528xk2OpU/TZxLPbGQa0LQGR53EJQvf4uxI3G91OLW3vUO9L/MAQn+WQ8nnYWG3hpVBtkEs2m0k57u+2sFg3rV8nGOMShhxyduw90tFigBj1xcMzLLCIy4bfotI6YnnxPbgHb4H8ORAdyoqSxVDrqftbjwhUKnc8by5sbyTXq6zzbMOKVlsNIWyi0K38Xt7WC/KvTxo7X6BqJ4NqWAmNHC6GG7Rw/GrhDffz7iM50f+7y7vEaDero0MJCna+BlARMgslnSgAbBZIuuRagrQM6cLPO7cQtBsvkWf2UiAT3vDrgPZ39LkrEK1QzGzo643X9CUqADdHq/I10lEaKe5JkK4BHHjOirFsxBzKi8YQXXSc7PV
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 16:14:20.3110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa93adb-c3de-4cee-c37b-08dee99e9e5d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3837

The ISP subdev is the first element after input of the main pipeline.
Part (static configuration) of this block is done via this subdev while
other configuration done on a per-frame basis will be done via a output
metadata device attached to this subdev.
This subdev handled the following features of the ISP block:
  - statistic removal (top / bottom of the frame)
  - decimation
  - demosaicing
  - control of frame export to the aux pipeline

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   2 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |   3 +
 .../platform/st/stm32/stm32-dcmipp/dcmipp-isp.c    | 491 +++++++++++++++++++++
 3 files changed, 495 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
index 54231569ed6fe..a708534a51af4 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-bytecap.o
-stm32-dcmipp-y += dcmipp-pixelcommon.o
+stm32-dcmipp-y += dcmipp-pixelcommon.o dcmipp-isp.o
 
 obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index ee9f36268e646..e04fde86550a5 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -282,5 +282,8 @@ void dcmipp_byteproc_ent_release(struct dcmipp_ent_device *ved);
 struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 						  struct dcmipp_device *dcmipp);
 void dcmipp_bytecap_ent_release(struct dcmipp_ent_device *ved);
+struct dcmipp_ent_device *dcmipp_isp_ent_init(const char *entity_name,
+					      struct dcmipp_device *dcmipp);
+void dcmipp_isp_ent_release(struct dcmipp_ent_device *ved);
 
 #endif
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-isp.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-isp.c
new file mode 100644
index 0000000000000..1586cc9c59a6b
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-isp.c
@@ -0,0 +1,491 @@
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
+#define DCMIPP_P1FSCR	0x804
+#define DCMIPP_P1FSCR_PIPEDIFF BIT(18)
+
+#define DCMIPP_P1SRCR	0x820
+#define DCMIPP_P1SRCR_LASTLINE_SHIFT	0
+#define DCMIPP_P1SRCR_FIRSTLINEDEL_SHIFT	12
+#define DCMIPP_P1SRCR_CROPEN		BIT(15)
+
+#define DCMIPP_P1DECR	0x830
+#define DCMIPP_P1DECR_ENABLE		BIT(0)
+#define DCMIPP_P1DECR_HDEC_SHIFT	1
+#define DCMIPP_P1DECR_VDEC_SHIFT	3
+
+#define DCMIPP_P1DMCR	0x870
+#define DCMIPP_P1DMCR_ENABLE		BIT(0)
+#define DCMIPP_P1DMCR_TYPE_SHIFT	1
+#define DCMIPP_P1DMCR_TYPE_MASK		GENMASK(2, 1)
+#define DCMIPP_P1DMCR_TYPE_RGGB		0x0
+#define DCMIPP_P1DMCR_TYPE_GRBG		0x1
+#define DCMIPP_P1DMCR_TYPE_GBRG		0x2
+#define DCMIPP_P1DMCR_TYPE_BGGR		0x3
+
+#define ISP_MEDIA_BUS_SINK_FMT_DEFAULT MEDIA_BUS_FMT_RGB565_1X16
+#define ISP_MEDIA_BUS_SRC_FMT_DEFAULT MEDIA_BUS_FMT_RGB888_1X24
+
+struct dcmipp_isp_device {
+	struct dcmipp_ent_device ved;
+	struct v4l2_subdev sd;
+	struct device *dev;
+
+	void __iomem *regs;
+};
+
+static const struct v4l2_mbus_framefmt fmt_default = {
+	.width = DCMIPP_FMT_WIDTH_DEFAULT,
+	.height = DCMIPP_FMT_HEIGHT_DEFAULT,
+	.code = ISP_MEDIA_BUS_SINK_FMT_DEFAULT,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = DCMIPP_COLORSPACE_DEFAULT,
+	.ycbcr_enc = DCMIPP_YCBCR_ENC_DEFAULT,
+	.quantization = DCMIPP_QUANTIZATION_DEFAULT,
+	.xfer_func = DCMIPP_XFER_FUNC_DEFAULT,
+};
+
+static inline unsigned int dcmipp_isp_set_compose(__u32 size, __u32 req)
+{
+	unsigned int i = 0;
+
+	if (req > size)
+		return size;
+
+	/* Maximum decimation factor is 8 */
+	while (size > req && i++ < 3)
+		size /= 2;
+
+	return size;
+}
+
+static void dcmipp_isp_adjust_fmt(struct v4l2_mbus_framefmt *fmt, u32 pad)
+{
+	/* Only accept code in the pix map table */
+	if (!dcmipp_pixelpipe_pix_map_by_code(fmt->code, DCMIPP_ISP, pad))
+		fmt->code = IS_SRC(pad) ? ISP_MEDIA_BUS_SRC_FMT_DEFAULT :
+					  ISP_MEDIA_BUS_SINK_FMT_DEFAULT;
+
+	fmt->width = clamp_t(u32, fmt->width, DCMIPP_FRAME_MIN_WIDTH,
+			     DCMIPP_FRAME_MAX_WIDTH) & ~1;
+	fmt->height = clamp_t(u32, fmt->height, DCMIPP_FRAME_MIN_HEIGHT,
+			      DCMIPP_FRAME_MAX_HEIGHT);
+
+	if (fmt->field == V4L2_FIELD_ANY || fmt->field == V4L2_FIELD_ALTERNATE)
+		fmt->field = V4L2_FIELD_NONE;
+
+	dcmipp_colorimetry_clamp(fmt);
+}
+
+static int dcmipp_isp_init_state(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state)
+{
+	for (unsigned int i = 0; i < sd->entity.num_pads; i++) {
+		struct v4l2_mbus_framefmt *mf;
+
+		mf = v4l2_subdev_state_get_format(state, i);
+		*mf = fmt_default;
+		mf->code = IS_SRC(i) ? ISP_MEDIA_BUS_SRC_FMT_DEFAULT :
+				       ISP_MEDIA_BUS_SINK_FMT_DEFAULT;
+
+		if (IS_SINK(i)) {
+			struct v4l2_rect r = {
+				.top = 0,
+				.left = 0,
+				.width = DCMIPP_FMT_WIDTH_DEFAULT,
+				.height = DCMIPP_FMT_HEIGHT_DEFAULT,
+			};
+
+			*v4l2_subdev_state_get_crop(state, i) = r;
+			*v4l2_subdev_state_get_compose(state, i) = r;
+		}
+	}
+
+	return 0;
+}
+
+static int dcmipp_isp_enum_mbus_code(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_mbus_code_enum *code)
+{
+	return dcmipp_pixelpipe_enum_mbus_code(DCMIPP_ISP, code);
+}
+
+static int dcmipp_isp_enum_frame_size(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_frame_size_enum *fse)
+{
+	return dcmipp_pixelpipe_enum_frame_size(DCMIPP_ISP, fse);
+}
+
+static int dcmipp_isp_set_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      struct v4l2_subdev_format *fmt)
+{
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    v4l2_subdev_is_streaming(sd))
+		return -EBUSY;
+
+	dcmipp_isp_adjust_fmt(&fmt->format, fmt->pad);
+
+	if (IS_SINK(fmt->pad)) {
+		struct v4l2_mbus_framefmt *src_fmt =
+			v4l2_subdev_state_get_format(state, 1);
+		struct v4l2_rect r = {
+			.top = 0,
+			.left = 0,
+			.width = fmt->format.width,
+			.height = fmt->format.height,
+		};
+
+		/* Adjust SINK pad crop/compose */
+		*v4l2_subdev_state_get_crop(state, 0) = r;
+		*v4l2_subdev_state_get_compose(state, 0) = r;
+
+		/* Forward format to SRC pads */
+		*src_fmt = fmt->format;
+		src_fmt->code = dcmipp_pixelpipe_src_format(fmt->format.code);
+		*v4l2_subdev_state_get_format(state, 2) = *src_fmt;
+	} else {
+		struct v4l2_mbus_framefmt *sink_fmt =
+			v4l2_subdev_state_get_format(state, 0);
+		struct v4l2_rect *compose =
+			v4l2_subdev_state_get_compose(state, 0);
+
+		fmt->format = *sink_fmt;
+		fmt->format.code = dcmipp_pixelpipe_src_format(sink_fmt->code);
+		if (compose->width && compose->height) {
+			fmt->format.width = compose->width;
+			fmt->format.height = compose->height;
+		}
+		/* Set to the 2nd SRC pad */
+		*v4l2_subdev_state_get_format(state, fmt->pad == 1 ? 2 : 1) =
+			fmt->format;
+	}
+
+	/* Update the selected pad format */
+	*v4l2_subdev_state_get_format(state, fmt->pad) = fmt->format;
+
+	return 0;
+}
+
+static void dcmipp_isp_adjust_crop(struct v4l2_rect *r,
+				   const struct v4l2_mbus_framefmt *fmt)
+{
+	struct v4l2_rect crop_min = {
+		.width = fmt->width,
+		.height = DCMIPP_FRAME_MIN_HEIGHT,
+	};
+
+	/*
+	 * Crop is related here to the statistics removal, that is
+	 * firsts and/or lasts lines of the frame. Up to the first
+	 * 7 lines can be skipped
+	 */
+#define DCMIPP_ISP_MAX_TOP_CROP	7
+	v4l2_rect_set_min_size(r, &crop_min);
+	if (r->top > DCMIPP_ISP_MAX_TOP_CROP)
+		r->top = DCMIPP_ISP_MAX_TOP_CROP;
+	if ((r->height + r->top) > fmt->height)
+		r->height = fmt->height - r->top;
+}
+
+static int dcmipp_isp_set_selection(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_selection *s)
+{
+	struct dcmipp_isp_device *isp = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	struct v4l2_rect *crop, *compose;
+	__u32 pad;
+
+	if (IS_SRC(s->pad))
+		return -EINVAL;
+
+	if (s->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    v4l2_subdev_is_streaming(sd))
+		return -EBUSY;
+
+	crop = v4l2_subdev_state_get_crop(state, s->pad);
+	compose = v4l2_subdev_state_get_compose(state, s->pad);
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		sink_fmt = v4l2_subdev_state_get_format(state, s->pad);
+		dcmipp_isp_adjust_crop(&s->r, sink_fmt);
+
+		*crop = s->r;
+		*compose = s->r;
+
+		dev_dbg(isp->dev, "s_selection: crop (%d,%d)/%ux%u\n",
+			crop->left, crop->top, crop->width, crop->height);
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		s->r.top = 0;
+		s->r.left = 0;
+		if (s->r.width < DCMIPP_FRAME_MIN_WIDTH)
+			s->r.width = DCMIPP_FRAME_MIN_WIDTH;
+		s->r.width = dcmipp_isp_set_compose(crop->width, s->r.width);
+		if (s->r.height < DCMIPP_FRAME_MIN_HEIGHT)
+			s->r.height = DCMIPP_FRAME_MIN_HEIGHT;
+		s->r.height = dcmipp_isp_set_compose(crop->height, s->r.height);
+		*compose = s->r;
+
+		dev_dbg(isp->dev, "s_selection: compose (%d,%d)/%ux%u\n",
+			compose->left, compose->top,
+			compose->width, compose->height);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Update the source pad size */
+	for (pad = 1; pad < sd->entity.num_pads; pad++) {
+		src_fmt = v4l2_subdev_state_get_format(state, pad);
+		src_fmt->width = s->r.width;
+		src_fmt->height = s->r.height;
+	}
+
+	return 0;
+}
+
+#define STM32_DCMIPP_IS_BAYER_VARIANT(code, variant)	\
+	((code) == MEDIA_BUS_FMT_S##variant##8_1X8 ||	\
+	 (code) == MEDIA_BUS_FMT_S##variant##10_1X10 ||	\
+	 (code) == MEDIA_BUS_FMT_S##variant##12_1X12 ||	\
+	 (code) == MEDIA_BUS_FMT_S##variant##14_1X14 ||	\
+	 (code) == MEDIA_BUS_FMT_S##variant##16_1X16)
+static void dcmipp_isp_config_demosaicing(struct dcmipp_isp_device *isp,
+					  struct v4l2_subdev_state *state)
+{
+	__u32 code = v4l2_subdev_state_get_format(state, 0)->code;
+	unsigned int val = 0;
+
+	/* Disable demosaicing */
+	reg_clear(isp, DCMIPP_P1DMCR,
+		  DCMIPP_P1DMCR_ENABLE | DCMIPP_P1DMCR_TYPE_MASK);
+
+	/* Only perform demosaicing if format is bayer */
+	if (code < MEDIA_BUS_FMT_SBGGR8_1X8 || code >= MEDIA_BUS_FMT_JPEG_1X8)
+		return;
+
+	dev_dbg(isp->dev, "Input is RawBayer, enable Demosaicing\n");
+
+	if (STM32_DCMIPP_IS_BAYER_VARIANT(code, BGGR))
+		val = DCMIPP_P1DMCR_TYPE_BGGR << DCMIPP_P1DMCR_TYPE_SHIFT;
+	else if (STM32_DCMIPP_IS_BAYER_VARIANT(code, GBRG))
+		val = DCMIPP_P1DMCR_TYPE_GBRG << DCMIPP_P1DMCR_TYPE_SHIFT;
+	else if (STM32_DCMIPP_IS_BAYER_VARIANT(code, GRBG))
+		val = DCMIPP_P1DMCR_TYPE_GRBG << DCMIPP_P1DMCR_TYPE_SHIFT;
+	else if (STM32_DCMIPP_IS_BAYER_VARIANT(code, RGGB))
+		val = DCMIPP_P1DMCR_TYPE_RGGB << DCMIPP_P1DMCR_TYPE_SHIFT;
+
+	val |= DCMIPP_P1DMCR_ENABLE;
+
+	reg_set(isp, DCMIPP_P1DMCR, val);
+}
+
+static bool dcmipp_isp_is_aux_output_enabled(struct dcmipp_isp_device *isp)
+{
+	struct media_link *link;
+
+	for_each_media_entity_data_link(isp->ved.ent, link) {
+		if (link->source != &isp->ved.pads[2])
+			continue;
+
+		if (!(link->flags & MEDIA_LNK_FL_ENABLED))
+			continue;
+
+		if (!strcmp(link->sink->entity->name, "dcmipp_aux_postproc"))
+			return true;
+	}
+
+	return false;
+}
+
+static void dcmipp_isp_config_decimation(struct dcmipp_isp_device *isp,
+					 struct v4l2_subdev_state *state)
+{
+	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+	struct v4l2_rect *compose = v4l2_subdev_state_get_compose(state, 0);
+	u32 decr;
+
+	decr = (fls(crop->width / compose->width) - 1) << DCMIPP_P1DECR_HDEC_SHIFT |
+	       (fls(crop->height / compose->height) - 1) << DCMIPP_P1DECR_VDEC_SHIFT;
+	if (decr)
+		decr |= DCMIPP_P1DECR_ENABLE;
+
+	reg_write(isp, DCMIPP_P1DECR, decr);
+}
+
+static int dcmipp_isp_enable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     u32 pad, u64 streams_mask)
+{
+	struct dcmipp_isp_device *isp = v4l2_get_subdevdata(sd);
+	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+	struct v4l2_subdev *s_subdev;
+	struct media_pad *s_pad;
+	int ret;
+
+	/* Perform configuration only if no other pad is enabled */
+	if (sd->enabled_pads)
+		return 0;
+
+	/* Get source subdev */
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
+		return -EINVAL;
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
+	/* Check if link between ISP & Pipe2 postproc is enabled */
+	if (dcmipp_isp_is_aux_output_enabled(isp))
+		reg_clear(isp, DCMIPP_P1FSCR, DCMIPP_P1FSCR_PIPEDIFF);
+	else
+		reg_set(isp, DCMIPP_P1FSCR, DCMIPP_P1FSCR_PIPEDIFF);
+
+	/* Configure Statistic Removal */
+	crop = v4l2_subdev_state_get_crop(state, 0);
+	reg_write(isp, DCMIPP_P1SRCR,
+		  ((crop->top << DCMIPP_P1SRCR_FIRSTLINEDEL_SHIFT) |
+		   (crop->height << DCMIPP_P1SRCR_LASTLINE_SHIFT) |
+		   DCMIPP_P1SRCR_CROPEN));
+
+	/* Configure Decimation */
+	dcmipp_isp_config_decimation(isp, state);
+
+	/* Configure Demosaicing */
+	dcmipp_isp_config_demosaicing(isp, state);
+
+	ret = v4l2_subdev_enable_streams(s_subdev, s_pad->index, BIT_ULL(0));
+	if (ret < 0) {
+		dev_err(isp->dev,
+			"failed to start source subdev streaming (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dcmipp_isp_disable_streams(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      u32 pad, u64 streams_mask)
+{
+	struct dcmipp_isp_device *isp = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev *s_subdev;
+	struct media_pad *s_pad;
+	int ret;
+
+	/* Don't do anything if there are still other pads enabled */
+	if ((sd->enabled_pads & ~BIT(pad)))
+		return 0;
+
+	/* Get source subdev */
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
+		return -EINVAL;
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
+	/* Disable all blocks */
+	reg_write(isp, DCMIPP_P1SRCR, 0);
+	reg_write(isp, DCMIPP_P1DECR, 0);
+	reg_write(isp, DCMIPP_P1DMCR, 0);
+
+	ret = v4l2_subdev_disable_streams(s_subdev, s_pad->index, BIT_ULL(0));
+	if (ret < 0) {
+		dev_err(isp->dev,
+			"failed to disable source subdev streaming (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops dcmipp_isp_pad_ops = {
+	.enum_mbus_code		= dcmipp_isp_enum_mbus_code,
+	.enum_frame_size	= dcmipp_isp_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= dcmipp_isp_set_fmt,
+	.get_selection		= dcmipp_pixelpipe_get_selection,
+	.set_selection		= dcmipp_isp_set_selection,
+	.enable_streams		= dcmipp_isp_enable_streams,
+	.disable_streams	= dcmipp_isp_disable_streams,
+};
+
+static const struct v4l2_subdev_video_ops dcmipp_isp_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_ops dcmipp_isp_ops = {
+	.pad = &dcmipp_isp_pad_ops,
+	.video = &dcmipp_isp_video_ops,
+};
+
+static void dcmipp_isp_release(struct v4l2_subdev *sd)
+{
+	struct dcmipp_isp_device *isp = v4l2_get_subdevdata(sd);
+
+	kfree(isp);
+}
+
+static const struct v4l2_subdev_internal_ops dcmipp_isp_int_ops = {
+	.init_state = dcmipp_isp_init_state,
+	.release = dcmipp_isp_release,
+};
+
+void dcmipp_isp_ent_release(struct dcmipp_ent_device *ved)
+{
+	struct dcmipp_isp_device *isp =
+			container_of(ved, struct dcmipp_isp_device, ved);
+
+	dcmipp_ent_sd_unregister(ved, &isp->sd);
+}
+
+struct dcmipp_ent_device *dcmipp_isp_ent_init(const char *entity_name,
+					      struct dcmipp_device *dcmipp)
+{
+	struct dcmipp_isp_device *isp;
+	const unsigned long pads_flag[] = {
+		MEDIA_PAD_FL_SINK, MEDIA_PAD_FL_SOURCE,
+		MEDIA_PAD_FL_SOURCE,
+	};
+	int ret;
+
+	/* Allocate the isp struct */
+	isp = kzalloc_obj(*isp);
+	if (!isp)
+		return ERR_PTR(-ENOMEM);
+
+	isp->regs = dcmipp->regs;
+
+	/* Initialize ved and sd */
+	ret = dcmipp_ent_sd_register(&isp->ved, &isp->sd,
+				     &dcmipp->v4l2_dev, entity_name,
+				     MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER,
+				     ARRAY_SIZE(pads_flag), pads_flag,
+				     &dcmipp_isp_int_ops, &dcmipp_isp_ops,
+				     NULL, NULL);
+	if (ret) {
+		kfree(isp);
+		return ERR_PTR(ret);
+	}
+
+	isp->ved.dcmipp = dcmipp;
+	isp->dev = dcmipp->dev;
+
+	return &isp->ved;
+}

-- 
2.34.1

