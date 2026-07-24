Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013031.outbound.protection.outlook.com [52.101.83.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CA7322B8C;
	Fri, 24 Jul 2026 16:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909694; cv=fail; b=KmTesQ1TtOHi4wLbWO9bdpTngbfKzyxvlGvkdX2sJTEAlBiThgvS5YXi2f6M3MLe0hP/LOP8lL0NcOxAfZ7CH+hJPXYfKBen+Pmk6iokRdwj6M9waP3/JurCUUvulUbzKmn/9u9IY5lIQyWgnfJiKHA19eFpRlzsKugHPrSJV78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909694; c=relaxed/simple;
	bh=jzRc/wWOottg7uEWjl6eURl2KjBCUpbboJyNxiVCM8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hHY45RN7Mw/Xox2j35D7R29ak+MNwEOLGd92wAV458ILFtlVz2tqOCp/2F+/RzTbVK7iPR6Cjd8Aw6N5FFrfy1MKluL5stht931iihiuwx4vOzw/ed5vF9xMekB8rYLss3w/DX01JeOWGTU3Pyrl6BND+7Th9sYl757JznPA3Sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=YohGnTFv; arc=fail smtp.client-ip=52.101.83.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="YohGnTFv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2HipkoYxcAa5c0LpN0f+LkxiMKj4X/CkOp1okUmubkKxZF3aUWlSGHTenEt3VedPKe1baI2MDVh114cu0ITu48W51YV0K0iLzKcEoTcACitmfpctYiH4yDTKrW+kcCQal4vo8OuKaOb+vHIEUVzgSJy0SEdxGXc33xSw6L5spKOxWAWA0IdsKHvU8o21ka4yzJlfRjMXPjxlr5nja59f6p+OcbshSSqBJvt9dgNc1vjbKonRjC+UtS9lKHqjGXLljGTHcRbSF/upkIrQnxA76hAtHpFZmFtPHqWvHn7IYqKxR0yHjMrqyp5k5Ujl1Z0BNGKMbOuzDtZ2GTnsVk/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQvtEtuiF+uLwjQNJCXPhxECCGDPcGIks8lQpPi3d6M=;
 b=JqAMGsfx+GR28rXrA6jCfsfkerg6bjJebiVtXRhR7RSloqXKoZiotOUUPKX1DCRuqNxuLTDcSTZczm31rGmKMznMcm7Fiku9Jn/a5iUpEbxP2SRp9kpeBmwiMx21lQlaACN9h1nXdT23+hZIPA6S3RQcwnAdTO4bttnUQQD+APNHYAlJRWwT5QfChuT35cy8MJunGlwhLrgrwMPJCu6rQdYqODN6t/UFJrd0QQeHHuJj0a9mMtzHoqMTtpmqwPiEgf++8l1KPzZU9sjBXulKhl31v8kPMimjAUZLGk1x6C+QjL/dL34PzJxK8Nj8mB8wiofR68qopCtaNY64RJhRDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQvtEtuiF+uLwjQNJCXPhxECCGDPcGIks8lQpPi3d6M=;
 b=YohGnTFvyIMmfbyUoxLhtHOClAxV5uoNb6oIc6R8vq+g665d6FZ06fVyzrMXcWtz7Dn+X2LzRjV/KNpGg+ATE8OJv/dvq6jtstqGH1w9N9KS5Xcca+PbnEBzB9NZDnsoLezEmMG5pV5TXJwYJgIBQxKa/+ANadhm9/ziMRJBL28I50yMswENa/4o1kW5v69u7o9W4bp9oWH07Sz16UNlO5//XBCEdCVLwCI9Bg0kpmhjyj79qehQ/W9mXu3s2AtWENndqQpx2fWfqNHYQeRwDcNoUwIccXrLte0VCblsrt/El19Z4rSoKih6+d1voq1DTh7UvaPxPVe8PSW5EF6BtA==
Received: from DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) by DB4PR10MB6143.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:389::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 16:14:16 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::1f) by DUZPR01CA0055.outlook.office365.com
 (2603:10a6:10:469::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Fri,
 24 Jul 2026 16:14:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 16:14:16 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:18:53 +0200
Received: from localhost (10.252.22.128) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:14:15 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 24 Jul 2026 18:13:46 +0200
Subject: [PATCH v3 05/13] media: stm32: dcmipp: correct swap in YUYV data
 with parallel input
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260724-stm32-dcmipp-pixel-pipes-support-v3-5-f77fe7e723d9@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|DB4PR10MB6143:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f80aa1-6b2a-4588-7d63-08dee99e9c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|6133799003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bly0a7qUzAw1fmW3XfkQZYkTIBQQOtkNgGq4xflRyHrzLTgGfxO5N2HgM53c955buP/jC3pBRHKbFYM/LRghRbdxiT3kb4xsK90Z8J7BjU2FZhr6Eu4kKXXw2R0NyRMyb3K2Ad9FdQyxA4tyOyLs9Kc2yuki4WpgHZvyZ5VnfrYWhzurq3r1wITuxKBxDraThNs86JN08/vHOdV1AuxT2DUNEmgistSzs4q1cmWxZFQXPbn42I8flZMCffElv5yL0E4nvGh/oDzfy9AkjiPtK+u7YogvDEkTBUOZm95rVpKWNryFpa0OJinea2F5mvCrDj+nVndxzm4LeEIyeTMUvwEQ5Zh45xIOAA83vkNpQF9p5sdyAzMyVUfVUOnlbyM9rgSwzCu6W2NBboxMlzcH7Sduv60k1LGA/hLI+ZEv4SpimNVuHZL0ZdM06uozddjwRzgEha+rLkEMZoqIbzQPZk0k8vkI2zbV99rQNZJf449+kbtz8KoytA06BquCe7jOty8j3u4IxNIUgVVS117AXfnQYrcx5AdbJBdhGoR7xTp+RyOKiTieb0E8H/0tb9na26aB0Zm1JR+3snA0j4+ars8pmY8c53Emmuk5NKlB+VyXjoDVwNEb5g8p9XKjoAuRdqBUxRdB9SbwUvRG0J9fQoXHGS9w0Cp2WzXJ3C1E3gqoctPQnA5ImxDWzj+SakwCiWkQ096jYiBbp+7dk61E/w==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(6133799003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IdB4JpwIulR0Um6K/Aw3vQ4m7B5hU3ZAGsdrSUnzSfurF8OleDy9l0lBXWuXjnLAft8FRVoXiFP1+Q53S8zHXs++dnLc+U6XtpkLy3rfAD4bRRarqVE32KJ8aISSJ4OJ+8b8OluxJ1LkxBrA31WZNEv75jOVkZ6qlL93JdKCO1JLhXPEdzDQhtIpiwTLIoukdBo/27DxIHe6Fn60HjH/BwcfFVxncbasW+lb3exx0vUUsW2oQ3FtoXkbgtZOwbI5tHaNNZJz/qp+vdlkVu3BbYn+vzr7jxzcPeP6cSNMM+RcA+031gPS9DX727/YgS5bjpiWR1WBQvblN4UocOZ0P3XNvyQBCDoN84VXiyKboCXx5xOzaY6WhdPmMpsSkWa8c44PGlGYue49J101bFcZ321LZvYEB1KRtOLvC3p0Tp+39i44+cV8lTyHXBzcuwnj
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 16:14:16.3683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f80aa1-6b2a-4588-7d63-08dee99e9c05
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6143

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

