Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011024.outbound.protection.outlook.com [52.101.70.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62600415F01;
	Fri, 21 Aug 2026 06:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294315; cv=fail; b=BgPH1luvpP46zaq2MWV+OpO/1KAjgUc4v7HWwEPeo4Xct60ibKdXw353EsMxRzmnPqP/8WIxevVSk4hMdofdI3JrLozP9iWNp74LYXFISMUKjspWjqmZkUpxIocbcLtJTcXIIkk0jhaH5oqsxJ865DBwHqFxJP4U/rZhqIcacPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294315; c=relaxed/simple;
	bh=VJNghmOUIDsiMxDL+UUiaD7jqWiCrvhPuPrrYXONGfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Y1nM0YkmzT5ol4mXZUFl6G5BNtAiAiKeFZdKUI2uc1xH8uFjXaA0r0yxTNAfH4F7lPDQwp6uXuXbq6LSfFIaVPTpap6Lt0wmdcoojeidb3YOGJoNxgwIMuS7E+k8XCFNscAwc0k3etHmnJMsAi2NLjoCt1qlDeupPgV1JqtgxTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=bbaUl10T; arc=fail smtp.client-ip=52.101.70.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="bbaUl10T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEU+HsQVcHarU8wszQanGOM8OaR3i84NB3FjhEaxVZKFAk76ZXu0RQ7F1gvUOzJ1yQjBuIcQ3CqBaUTLn1Judmb8o03qsX631xs/vLdx66wCVM8b7dHm39ESzeIgg68sFPpo7mKkeW3KSq7QqdootMwNHbMSiFFzFX9/YBkwtnVahpH3ReKas6FARNPixMa+u1fWNLWJCJ9kg/FdL0uCwMVGdH0Jfw97OE7CAOWkp7yvwg3o52h3IX0snc0qRkRYahGiqKzu2cqpzmhsYzgnNd8559q+TJ/nuxVF7t4C582uikGbrAoxcPFRv5eZHq82jQzNNM32TGv9t3f2EzGdAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqkuI746oXPdPnrek59eVyr9+0fFaxDqzE6u3QjvO2k=;
 b=h+PKCEkD1fBhv+kRfUvjwgsmCVXj8Lf4qg8v/K/YH2FCDCOWc12T8JhcYe8na7PVxJ0XQl7cUJ5e08uXaygrxncnhLXySXeCS6/bZvQDPsEQxRwOPIIWpkreRpPqzebcBJf2j7RZCus8/ctKz6+3bjssR3KNCZEzu6/7YpfYIvuwQYcc5LrCH9YVWE2RZeVbGuWialiMPC0Coh0bZNAirxBbc0MKxRMP3tEWOoappJxEUAsKNuR6IgrSiSG2Tz3cHTmmOjXuYPl9rQ0PpVroReUmtSQp6ds/31BU6TqEZ4V0sVAit8fvKscLANbutrWAnNV+cECO9TLoLNkF7lWmkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqkuI746oXPdPnrek59eVyr9+0fFaxDqzE6u3QjvO2k=;
 b=bbaUl10TIMEnvsBblcnsciLrzfTAFuXrSrFi7EU/Sl6D1a2kU/fcbOHguXZKaQ7W5mhjOAwtpcoymk9E4IRhmktLmYJbos1PtUAwltosiVWzCx9JUlGCE+vJz1Fa+KcbqIb8oMxKIFofC6KjKyJzDnBqYE9IetOUClIhHurvHSKFDlyqgR8Vi8re4AztxYr66f1Xmxia60Rx8vJWwSeFbt985McVPnCdNpSeRP6SrDjXZJux9F3mBN2YMuwma6Ijst1c9wN7OMSGLg4AIvOnkbkPXLVMB9RYdv5VI1IVHf46LAVc34ycKu+hBHxvxBQGtHXuU6nR9ipWFyTvk/lUhA==
Received: from AS4P191CA0042.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::19)
 by AS8PR10MB6841.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 06:38:29 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:20b:657:cafe::81) by AS4P191CA0042.outlook.office365.com
 (2603:10a6:20b:657::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 06:38:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Fri, 21 Aug 2026 06:38:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:44:04 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:38:28 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 21 Aug 2026 08:38:12 +0200
Subject: [PATCH v5 10/14] media: uapi: Add controls for ST DCMIPP Driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-stm32-dcmipp-pixel-pipes-support-v5-10-d140efb61d72@foss.st.com>
References: <20260821-stm32-dcmipp-pixel-pipes-support-v5-0-d140efb61d72@foss.st.com>
In-Reply-To: <20260821-stm32-dcmipp-pixel-pipes-support-v5-0-d140efb61d72@foss.st.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Hugues Fruchet
	<hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F98:EE_|AS8PR10MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a9aab17-e4c9-4e32-1388-08deff4ecfaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3Mwh7HN+kuZ/45ruhiu6riTN0so+x7yUd4CcZG3EC+j/vtZVHvfVG8QVr2OxW6BeO2vLN2HfS6gm6edrhFFgAUg3vubMATp2URUgXvYzhadQWr8QhNtargD4oe71Eh+9iRpfisPq6xolQYo9skKhz+aF5cuDsrOpNqHp5ROcCir9I8aoMMi7mmya1jgWcF68uuFmuPwJVfF6h7NJgAEiPVqW4BPDJVqKagoI5i7YIWiGDl+cZFEc3NUi9dkqSkVkzmCigp7Nso4mTZSsWENz2E90iZG/bK494ijIKfHiyEL7O7tkL83CarUxRhVQw0n8Zb617QIsTPvfGfr+321szTA3EQFeEMGJubL8t/Yv2hsWkjIalDahfJz7u1ZPY1pCwbFObdvwC5wi5PlCdj9M61hN39Qp9GpG58jr6TV3ASw+O3VzTjlgXzz6W1YJV1PfElR+joy6kW5q00zocpToFYkDaRBuy86Gf+bb+nDO9nkxYPwO1OAX2tpiH/6BltUz26nch0/2/9lvc4JK9hKlfLLLqBgmF4TpEwQ8LL6Kubofr4U81fXMAz92f7I6dkTJIxXaPH4DHcWq1yFhLCxjwIOjC4NLRmA8UnLqFEkhriBlMtNYXf7zuYy4rhLTK/nkLiX/UGL2kEx6YYkw7/moxmcfuwV/T1ITalmQfg5SbBHaiUecXNvhAwiCCLwL+xvq5OH53ostlf99Tb1zuvKVTQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fzpc0FbEOIUBB9TcfxjlprNYz9bbyw/5kEsNja+w1ikP+5RK70+kpmwuc6TEM7fle5jJhDUssdZNajsyrSJc2lfDtZzTh5gsD426s7vyEPabo93/sE8Xb1SK8d+G0gDBC5rBjg8Vl4bLrgW6sLiLq+SkiGyL5uiP+rJswRKyndXos1miIOTrTadQyJg/CiuvU2VkK6UcXFZs/GkmyGlkfNzN1T1LwLJvKLIkNfABidF5WgJ6tp1ojNmLlhhMMidGDx5X+UqlhI+oqeEUil4/HX0fNyd63kPcOMtVOrP56ufV4mPY99pGuFiji2SsqFUgAxAabGXUSdjnvxBugSJ8bNa2mevT2Y16b2ejVV08lU8OwQXbTY0M0W1sn+tb3odENnQN+wWm9GVW0fz2J6xwj7FqqJIXSIj8fOfux6nbSuRinCm+K+oMhSuXJWXdQ0DO
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 06:38:28.9223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9aab17-e4c9-4e32-1388-08deff4ecfaf
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6841

Add definitions and documentation for the custom control provided
by the DCMIPP driver in order to control the pixelproc gamma
correction.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 Documentation/userspace-api/media/drivers/dcmipp.rst | 14 ++++++++++++++
 Documentation/userspace-api/media/drivers/index.rst  |  1 +
 include/uapi/linux/media/st/dcmipp_config.h          | 16 ++++++++++++++++
 include/uapi/linux/v4l2-controls.h                   |  6 ++++++
 4 files changed, 37 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/dcmipp.rst b/Documentation/userspace-api/media/drivers/dcmipp.rst
new file mode 100644
index 0000000000000..ed4272da4b68b
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/dcmipp.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+ST DCMIPP driver
+================
+
+The ST DCMIPP driver implements a driver specific control as part of its
+pixelproc subdev.
+
+``V4L2_CID_DCMIPP_PIXELPROC_GAMMA_CORRECTION_ENABLE (boolean)``
+    Enable / disable the gamma correction block.
+
+    The DCMIPP PixelProc stage implements a gamma compression on each R, G, B
+    component, using a static gamma exponent 2.2.
+    The gamma is implemented as a 7-segment linear curve.
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 02967c9b18d6e..8d2c489b8453e 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -30,6 +30,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	camera-sensor
 	ccs
 	cx2341x-uapi
+	dcmipp
 	dw100
 	imx-uapi
 	mali-c55
diff --git a/include/uapi/linux/media/st/dcmipp_config.h b/include/uapi/linux/media/st/dcmipp_config.h
new file mode 100644
index 0000000000000..ad8d146820eab
--- /dev/null
+++ b/include/uapi/linux/media/st/dcmipp_config.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * ST DCMIPP Driver - Userspace API
+ *
+ * Copyright (C) STMicroelectronics SA 2026
+ */
+
+#ifndef __UAPI_DCMIPP_CONFIG_H
+#define __UAPI_DCMIPP_CONFIG_H
+
+#include <linux/types.h>
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_DCMIPP_PIXELPROC_GAMMA_CORRECTION_ENABLE	(V4L2_CID_USER_DCMIPP_BASE + 0x0)
+
+#endif /* __UAPI_DCMIPP_CONFIG_H */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index affec0ab47815..42b4f82afeb8c 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -234,6 +234,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
 
+/*
+ * The base for the ST DCMIPP driver controls.
+ * We reserve 16 controls for this driver
+ */
+#define V4L2_CID_USER_DCMIPP_BASE		(V4L2_CID_USER_BASE + 0x1240)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */

-- 
2.34.1

