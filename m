Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012050.outbound.protection.outlook.com [52.101.66.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BE0314D35;
	Thu, 20 Aug 2026 07:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210608; cv=fail; b=oeDEt/tfgGKiSxp/FAwwyFf96iJOK7QwlKho+1MwAJiSIYsObaI6+a7PcM2Q5oxWeDZjfzSpQJSjqUvqKK7d+WcmngOtxWVVEOjZyMZEpDhe0LpuLB2adFLQGGTIu9UHod2ddZzh6SmWKK8M6pW6zTK7Xz9aqbz5Fev4+swYt3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210608; c=relaxed/simple;
	bh=VJNghmOUIDsiMxDL+UUiaD7jqWiCrvhPuPrrYXONGfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gowCKQL/UAcldqEO4S0rNobOJNN+j72fouzpF3fgLIUFfTFq2cQZWRDtakceC/IRVP0OVI6/dPtdai7cWxojJnR3Mdrhs8mIpCcoKWusN2vBafduGdkcV0MtkW4PwSSbc4e7SrWPLbvxDrC1SRNEZjWtngBiAVAsv/3hW1dO3G8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=IKCuMmp8; arc=fail smtp.client-ip=52.101.66.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="IKCuMmp8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1zoADxKnGeWQWWqjOUoCJyDbH41lYS682m/vupCi97R17Unt+/dHyVjWyqR/l08rDLT9qiFNWZPWO58vKiL7+dOVLN/bHDXgLc1LwykzB+FZ7FW8AbHhxxuvgeadknr+KTyXHAiX9xbKWuYEipmuT1RUc5oaAMvwtZ5H+5I64lrGKNVre5IOpuoQJTm0/F0yGh4Nlm8WVSrvFmLGxTNo9pvXxX8aOQTINkCEgdaObGwzYfXc4xtqB0iG9xHmoVaLYXI2v5z3iigYdzuH2X8S2vL8tUZ/9DLYyWtwi2PKp74YrtyCoixV23pSvGcdGI6Fit3Aqe0SRWYOfrM2s6BzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqkuI746oXPdPnrek59eVyr9+0fFaxDqzE6u3QjvO2k=;
 b=lCqimRB0L7Hdu2wC3HN6D42e3qm5IzaGBPTUHcvlBsycaWEMFiLWtP0Kzi9ZtJNit98GeY3T0GAH8c2qAPKAaJBwlQ/DhHflcpTPG+aK3KxYKzUYfKJtkjgkMTm0QFqRDQHohhHqjiB+MG4S74fOXkER9eQ+mzMLE5+94uMDnqSBaRHSnCQElsqMp4F4cgOebk6NxJNCgIU3ca+nadbt0L1ZfhPRTZ5lemP5g1eoFIHxnNyTd9o5f6DN2HJ3/hPa4dv7BpPJbWXeaPGCiSNabziMsUa1ZNwuiTgozcfS1ZWpAw2Yc2+dxiRdtqYRBuZcrzBaY2LyQ8/rR8eeeR46ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqkuI746oXPdPnrek59eVyr9+0fFaxDqzE6u3QjvO2k=;
 b=IKCuMmp8e/qmFBR/Ue7sMqDk0Erv5+SRdwyqevA+kgO+w01GgZ2StD7WPx7P2zJBKqAnnsdL0xm1HyNJnyMUrgE2MSFi/AxjpBJ5n1RQtF1bQETpeWm9wNTcxZuyZBrQQp8tTEVUzbs9ZffpfW0IUlyHIKG3/MCrUiwy4dPhz6/SP2sS6bprvGVGg7bcfPO44LEd/QLN7nyeHf+CfVIMlzdQlFHC8O/btAVsXsQG3kNv/WIXbgQFJIQlr+slAL6vNbhsHFuSRmPlKdqI8ytDmFueR2vCoeegOrbge6fnL5nsgl1CRI/43DhIbHN0a9j4e4qHngZEZAp5noj2pXsQYA==
Received: from DUZPR01CA0321.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::15) by GV2PR10MB6188.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:7a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 07:23:18 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::1) by DUZPR01CA0321.outlook.office365.com
 (2603:10a6:10:4ba::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 07:23:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 07:23:18 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:28:53 +0200
Received: from localhost (10.252.29.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:23:17 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 20 Aug 2026 09:22:38 +0200
Subject: [PATCH v4 10/14] media: uapi: Add controls for ST DCMIPP Driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-stm32-dcmipp-pixel-pipes-support-v4-10-d212eb4e3792@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B92:EE_|GV2PR10MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c7eb184-d0af-438c-637f-08defe8be85b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	HqfveexXCsg1ljvywfO8ocat/2zIBTaqtFHNUYRhUvlidn2jbOjdZSdsUthPRCZGdtmVHOG6GsZaPm4TISZhnl158clUoGL4IiIIjRtZJoiaamP7tOO9+P48osWl1rZqtsvgAnZqvxbGGgQAAdgqVbml0wq0/KMjiJP6S8+a7bYfQyNc3+sSJHFa3/KtT9dnHLrGvH3j0Qr/jH7+D04FZWkZ7etwPXuzzj1TXGw4+5EaHJScaRJW5rzIjq7wdEbgz3MebTD3dwlh59B27W4Tc8h8ttKav/H8woBRMaEHmF+FaHU0ewGPW/W73MTpS3R3tLGRxXNRV7ZZbjBzWZPNXxYV13IbW3ati5y4ZPcWmpaxkZ7KdxF8lWKL103D0sJfLo5OOpPH9hHBMRq2OdEWKPLw39IyNpBMYK+S5zuy+zzFa5pV+IQRMjtOYfmNYAPojXuhsjwtgDBvnPHUCQ8k/kUSlCdH8FgcrcSLuMMKgI6It7X3bttH/3QLzYJ0iR7jV8/1EsTNWrW1WWVE3SRYSFzUScrtHWaHdZ1/pR+tzVIanSWkzS4YuteReA8xN8RionuVZH87OceF6M6x848JC00c/PtNFxnog8oIXl6ZW8Qd5N55XjmWCMIsT1gzpe2X4Xrogqqfc3Qzyrk/criVOdHpVNY98sMaVRM+T0DG2eWV68Fc5VuseMezEoqRFwxrhK6twg1MC2NTHoq5omBdNg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	47IBvJRRxhxTOBsqhVhihAItxDtIYB5SvScHiBmjK0jInntWACdHCH71ZHbnGk1cHB/p/pHpD0Zro5sWUGE6oNkqhx1Z8YpgjHudxLdzmMV+e6iy8bgQQ7KwNgTj+8B0hccJSQl/FWupd89wbMHvagBT5TjEd8ieZ+2o3TWVbNADXNGcpSA87acqLZymHLSl4pxNQ6otjalOYvaexolcK5bm4A1lWI6ItXV5MKr+Rebukg3FNygILn9Bsf2TJ+K1L0aU+sHBZnB/xGTIeuBZ+BQ46IrRC/bUk/wn0wFZg+cLVenDir1oZDWWojHiae/zFR8yTHA/rBKIBMx0hRRwvQbyLlEwDiBZwjlYYhX0Sgm8agrWuskFRCqbXRclYs7B4KoKX0uGFqyw6LsnkfkQ6Gyjy3SMT7t7MfkKAYjZXQjT+yxUZ3L9tyWtfVyqJ9HN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:23:18.4271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7eb184-d0af-438c-637f-08defe8be85b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6188

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

