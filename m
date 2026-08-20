Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3428A3C9456;
	Thu, 20 Aug 2026 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210608; cv=fail; b=Tog1WjP7XhorvO5gg1PkQNtMG4N6kPn0jgtUBLMbhWcky56Udsm3Qlw5fCH3UrhSZflmStWUcpIUDAWV+QOGemi2CkxsBc/eCQkEjhaU/OiUrPu4meBjQ6PIjq1YPlcqIGnC5Pb9jpyYR8Re3B4APmAX7a3GzS8dghb7CHFWj04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210608; c=relaxed/simple;
	bh=jzRc/wWOottg7uEWjl6eURl2KjBCUpbboJyNxiVCM8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iBNO1un/PWCwSDsiBOTAvpgqO6G0lMy9kqIRb9LP5DYJ42E6c75ZSEvE6HVq08MwwGzgYr1XF8UGo+S76CsqkAVsY0GvsJN4vn6dAnIRV1fvjd+Vb2HeGASZWU7XrYAtiqan4sRm+GyZPvnw879yp9K3uYOxPfw6f2HzINIg51A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=DzSt9qtn; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="DzSt9qtn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8e5eVuBanRzikQaeJYCVc8cdSLxzqdYwaeBhB6mWrlK/L5c9Tu7xYe6ahDDGOSs9SQW/F6OypngPD8lc1r9doEkp36/esANLslDiZKPvYeBEaEgSmKfGQc7FgNa5aHWBGWpoLgZXRAlrxUvgsEKCqF3cF2epZlRRg5yvlJJYF4KYPxbcd4otaGCU/vh8rC9X5GBYoLYFyzCPVKLH51d3Wt1tMv4Af/OSbKvJKMdgfLsnEN/zZMQQUmnO2+2EwcR+ZTBNiEnBzKkN3yK6PLQEYdw7jptX9Hk1aGfI3Qg2OAQZKmPa9r1h2ZgfA7pPN/BgnjTwYpPtT5srqOiNXBqOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQvtEtuiF+uLwjQNJCXPhxECCGDPcGIks8lQpPi3d6M=;
 b=eL0/plt5fuPbSoOEsG+aoobXyvYRrcvQbzmki4wdGXthDrnCwcBce+4XXJA9iJ3wy4MJcfCNZ+ipZ3SZTpDD1SQRZxuegPvdQHjVRB9mDZ6ISlxl5fBMGOXAZ8rqjN5QUZeJpE8Al1EXqXpA+l2snI40x2YvwfSd9Avh73VO4Ydd4fPQ0NgzHqdedJTsB9q9MSER8XU+BiKiwJF9sCII+SwZNIthNFjzylRTZjDAGv0UMIrvvJ6jph1sypzL0seAW0Eg24ScAL7aX/beXQBbiW5Y253UaDCGP9sPkeYi2bOtIgBSD0aaG3RgURP2l0YwSnKcAsioUild7HYxr/j53w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQvtEtuiF+uLwjQNJCXPhxECCGDPcGIks8lQpPi3d6M=;
 b=DzSt9qtnSaxM0OTDoAYBuDbaEEeXbk+582aSCeunlrwSUq2CQShVsSQ0ZvacVzpB76n2PPO1GmD9YCBn3TXRWKG7JyilswmGYpjO/YNYQ/NCj4GN3Eb47/XN2YUBmkXhVJBsJQMnMfCrL5TZTqi3b5o6ach7xIxcRnnbSUCSZXekbqRQRRSjaj47WtU5zVCKnxXWPiSiaXw2q0MTVPADT/pNLY1iqDED9S+Lfue3FLldd0xvApN9PO88F/MKJDuylnEx6oEGP5wOxwEYcjrbXTtzZ+YfE8nYBHaPqPYB3sFufOU3/BUkjJa7eIZeo9QA6v9K6MrnYUhwz2S2HQi8Gw==
Received: from AS4P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::9)
 by DBAPR10MB4012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 07:23:13 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::15) by AS4P191CA0011.outlook.office365.com
 (2603:10a6:20b:5d5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 07:23:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 07:23:12 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:28:47 +0200
Received: from localhost (10.252.29.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:23:12 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 20 Aug 2026 09:22:33 +0200
Subject: [PATCH v4 05/14] media: stm32: dcmipp: correct swap in YUYV data
 with parallel input
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-stm32-dcmipp-pixel-pipes-support-v4-5-d212eb4e3792@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|DBAPR10MB4012:EE_
X-MS-Office365-Filtering-Correlation-Id: 7faf51de-79b7-457f-e272-08defe8be515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|22082099003|18002099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	XYJ0Ka4rxvEO7JM3FeOodgwXcNyoWuXolJ7A7ibexD20kJe57VOzXyVxOd0rybVcBayfX1janeZkBW+DraLg+HUDuYHfqeR1y7YjfRBK/oLf9wznPFTCNEMae+ngHibRvUOrB5wh44dwuwMUnH5ZuSZ5jAjfebhVkaRIyTNOEK4dedmhBatjS+mhTidcqB88mCBCyHBkzn2Go701mquFV2gBGKR9AqXI2LR83GdgCYH0N28w0YVPHvPjJ92+UhCTRMvIgIJCopiaOl+wlKJXnDFKf+W7ePUsnZlzjzYNbvBjpLLqVfGNO8v2CP5Lba59RA9KG3v1sOgcPqw2QXLEL4u4AO7h4JkCl3kwnEeyBdFmyciSolNefvKtKYDRm7kdKmRN6hpNLum7AhbtaMAycdoD7WtiDu9n3PlxQiiGE6DHr4BqX45AsVcC+rKddaf3wLtgiWUTIrw4esUaY280tH+VbIKr2VNScRQy+IB/b8dAWTPioRkr+dhZ7f4F6qoTw0sl9WVeI7Ga14n0TLmbKWxyopPdqTDTlnJ4nN8pknPryXt+HVHawIbKiydTKZmX9KvvMi79Sko0PDn1qR5TbxEOFF02w1AHYyGKp7bSRJ1CX6q9yRRf9tUzfMzu6IGQCkNhoahNmLqF6v7ZLqvAk19SxZw/JJPZiHxPQ6IkJ2Tm332VzTMqSUBWR1Vj4HxNu8JC6aTzhHFFOnr10LqmIg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V1ZjyQLeb0N6mj46DWKk6tE1MeLgjOmgBMowwbdHDr9nmU6AvyRv2h6uQluaI1pKJsX0mSVp87FLtHDvD5PJUixR7Sc7fpnIcm7esdPuAFsBoDuX2/4Q1Y87RrmjWi7bPm18SU+eUzx4Y9YdKfIHNngun5qTalO9h/4aVPc6VTOnRLsLKN7luqWUnKwgMP6P07PhwqhzVzX0IJ5V0dnDdSVMC89ckZtiDMMdq+aEG9424gxyN0Bx08tzgtRNnhL/BwO+hA/MhydLVsm1ObPpaMBVrlvakBk0RrM1ELWpij3U3173PdYUFa+J8Pav6dh/VE3Uz8CGzUTDdtP8uZQsAKYxZAFlWnvpJInTya/BPTSJrH+I8ng4dNByP+R+kArujk/w776RMNvP2yJoWExZqwHOV+FV/k246gzIyMfOGPDlR3egg1GRDmXTSV7ch7sM
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:23:12.9278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7faf51de-79b7-457f-e272-08defe8be515
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4012

When used with parallel input, the DCMIPP is expecting data to come
in YUYV order (for all DUMP/MAIN and AUX pipes).  Not doing so will
lead to bad color generated by the pipes when processing is done.
The DUMP pipe is also doing by default a swap since, while it accepts
YUYV data, it will by default generate UYVY data.

Current implementation is not correct for parallel input since it is
performing a cycle swap on the input side and since the dump pipe is
also internally doing a swap, the data captured from the dump pipe are
correct, while the data captured from the main / aux pipes are not.

To correct this, only perform cycle swap when it is necessary, hence
changing from YUYV to UYVY for example, and for all parallel YUV MBUS,
add the P0PPCR based SWAPYUV to put back the data into the ordering of
the input.

Keep previous behavior when the SWAPYUV is not available (such as
stm32mp13).

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        | 16 ++++++++++++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |  1 +
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  3 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 28 +++++++++++++++-------
 4 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index 5fcd5123136f8..f61618e123224 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -25,6 +25,7 @@
 #define DCMIPP_P0SCSZR_HSIZE_SHIFT	0
 #define DCMIPP_P0SCSZR_VSIZE_SHIFT	16
 #define DCMIPP_P0PPCR	0x5c0
+#define DCMIPP_P0PPCR_SWAPYUV		BIT(0)
 #define DCMIPP_P0PPCR_BSM_1_2		0x1
 #define DCMIPP_P0PPCR_BSM_1_4		0x2
 #define DCMIPP_P0PPCR_BSM_2_4		0x3
@@ -428,9 +429,11 @@ static int dcmipp_byteproc_configure_scale_crop
 	if (!vpix)
 		return -EINVAL;
 
-	/* clear decimation/crop */
+	/* clear decimation/crop/swap yuv */
 	reg_clear(byteproc, DCMIPP_P0PPCR, DCMIPP_P0PPCR_BSM_MASK);
 	reg_clear(byteproc, DCMIPP_P0PPCR, DCMIPP_P0PPCR_LSM);
+	if (byteproc->ved.dcmipp->pipe_cfg->has_swapyuv)
+		reg_clear(byteproc, DCMIPP_P0PPCR, DCMIPP_P0PPCR_SWAPYUV);
 	reg_write(byteproc, DCMIPP_P0SCSTR, 0);
 	reg_write(byteproc, DCMIPP_P0SCSZR, 0);
 
@@ -451,6 +454,17 @@ static int dcmipp_byteproc_configure_scale_crop
 	if (vprediv == 2)
 		val |= DCMIPP_P0PPCR_LSM | DCMIPP_P0PPCR_OELS;
 
+	/*
+	 * Perform a SWAP YUV if input is parallel since in this mode
+	 * the DCMIPP will swap YUV by default
+	 */
+	if (byteproc->ved.dcmipp->pipe_cfg->has_swapyuv &&
+	    (sink_fmt->code == MEDIA_BUS_FMT_YUYV8_2X8 ||
+	     sink_fmt->code == MEDIA_BUS_FMT_YVYU8_2X8 ||
+	     sink_fmt->code == MEDIA_BUS_FMT_UYVY8_2X8 ||
+	     sink_fmt->code == MEDIA_BUS_FMT_VYUY8_2X8))
+		val |= DCMIPP_P0PPCR_SWAPYUV;
+
 	/* decimate using bytes and lines skipping */
 	if (val) {
 		reg_set(byteproc, DCMIPP_P0PPCR, val);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index 9e7b2434200a1..2d26425b0b0fb 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -118,6 +118,7 @@ struct dcmipp_pipeline_config {
 	u32 hw_revision;
 	bool has_csi2;
 	bool needs_mclk;
+	bool has_swapyuv;
 };
 
 /**
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 3a0a4df410d8a..9aba16096d289 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -108,7 +108,8 @@ static const struct dcmipp_pipeline_config stm32mp25_pipe_cfg = {
 	.num_links	= ARRAY_SIZE(stm32mp25_ent_links),
 	.hw_revision    = DCMIPP_STM32MP25_VERR,
 	.has_csi2	= true,
-	.needs_mclk	= true
+	.needs_mclk	= true,
+	.has_swapyuv	= true
 };
 
 #define LINK_FLAG_TO_STR(f) ((f) == 0 ? "" :\
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
index 564f37e2e1dd4..75421035cfad5 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
@@ -80,15 +80,15 @@ static const struct dcmipp_inp_pix_map dcmipp_inp_pix_map_list[] = {
 	PIXMAP_SINK_SRC_PRCR_SWAP(RGB888_3X8, RGB888_3X8, RGB888, 0, MIPI_CSI2_DT_RGB888),
 	PIXMAP_SINK_SRC_PRCR_SWAP(RGB888_1X24, RGB888_1X24, RGB888, 0, MIPI_CSI2_DT_RGB888),
 	/* YUV422 */
-	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, YUYV8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, YUYV8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_1X16, YUYV8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
-	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, UYVY8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
-	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, UYVY8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, UYVY8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, UYVY8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_1X16, UYVY8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
-	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, YUYV8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
-	PIXMAP_SINK_SRC_PRCR_SWAP(YVYU8_2X8, YVYU8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, YUYV8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YVYU8_2X8, YVYU8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	PIXMAP_SINK_SRC_PRCR_SWAP(YVYU8_1X16, YVYU8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
-	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_2X8, VYUY8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_2X8, VYUY8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_1X16, VYUY8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	/* GREY */
 	PIXMAP_SINK_SRC_PRCR_SWAP(Y8_1X8, Y8_1X8, G8, 0, MIPI_CSI2_DT_RAW8),
@@ -356,8 +356,20 @@ static int dcmipp_inp_configure_parallel(struct dcmipp_inp_device *inp,
 	val |= vpix->prcr_format << DCMIPP_PRCR_FORMAT_SHIFT;
 
 	/* swap cycles */
-	if (vpix->prcr_swapcycles)
-		val |= DCMIPP_PRCR_SWAPCYCLES;
+	/*
+	 * Table dcmipp_inp_pix_map_list take into consideration that SWAPYUV
+	 * bit is available when dealing with 16bit YUV formats. If it is not
+	 * available (such as on stm32mp13), swapcycle setting should be
+	 * reversed
+	 */
+	if (!inp->ved.dcmipp->pipe_cfg->has_swapyuv &&
+	    (src_fmt->code == MEDIA_BUS_FMT_YUYV8_2X8 ||
+	     src_fmt->code == MEDIA_BUS_FMT_YVYU8_2X8 ||
+	     src_fmt->code == MEDIA_BUS_FMT_UYVY8_2X8 ||
+	     src_fmt->code == MEDIA_BUS_FMT_VYUY8_2X8))
+		val |= (!vpix->prcr_swapcycles ? DCMIPP_PRCR_SWAPCYCLES : 0);
+	else
+		val |= (vpix->prcr_swapcycles ? DCMIPP_PRCR_SWAPCYCLES : 0);
 
 	reg_write(inp, DCMIPP_PRCR, val);
 

-- 
2.34.1

