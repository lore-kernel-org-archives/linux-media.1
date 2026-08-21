Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011034.outbound.protection.outlook.com [52.101.70.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6FA40F74A;
	Fri, 21 Aug 2026 06:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294313; cv=fail; b=hCwJKCc/LWvGTuaaAUH66NWkIuxFsylGlKpX08lArJaGRXvS3stk/zPvLYYp2jTj77nLohtssnzIyaosSE7SM/2aQ4VaoXvMYKMPhCK6PruI+/Ej6o3Jm1nS5RSSniD9TtIDYK+dFNmQggPr7lzvsMVzuF2oSQ9EO1UpEaMCvYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294313; c=relaxed/simple;
	bh=Mj6Ai2Db9y4sXCdtSyKs10iR+Yc4UWpQkpMjBNzXJR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sd7igXE/H9nJ+DRfyi/vmr90k4KtrCftF1jNc8VKYVtg+RgkeBb+zvrCJ4JZupZcN+mIrz+YsGkORUvEDkRG9KQZj9z6oQcldhdWRPA+XI0nSq0JV1shmH71mK3SubMBSEf0pEWzzSnjsZqIHDB2dMJpglU6J1TRNOrOSKs2kQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=UbSc/u/x; arc=fail smtp.client-ip=52.101.70.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="UbSc/u/x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7DmnQUZ8V1wD1RSlsYRG0tn170Pe6C0eclwaVetQGHeYoX+Myd7yJkkn8JE+8R6Zu/06iIOJIf0DIKFpcc7+jJ7SpnzT8H+1ASoP4JLqtWjVticItcwDqkrGgak4pswJOliSTou1RZER9piY5Ti00k1mk+B0C6Z/Q3r6U9LjaNLot1WlA3DYAVyOVE0FgFtFh0rTaCR6Sff21UJYFYQaf1xNlV9kz4eO8awhmSz6oVT80LyTWywsvPhol7x/fhgTtXywcYva8e7Bs909dHWe8+QFB6SVqrijHb1jKVbdhQ2bfsghlvYivWE5fjswaq/9Xq/2qRxmtFQb2B8r1UrfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awWDoA2v6+cFxczNSJAnXgiAIlB01pUEuSfnd8Yczi4=;
 b=PRG6IEn64gZicZcR1iS1ApiGIrZF8drU0i6oQEi4+zTprjfwNkDUwObqhD4jWaXorvP2iTowhmrDhR3AJWE7F85ab2MHid46CdbXhBJJsIPkfGRqmH+1X8trMUFkaiz/E0jpMBZ31cermiJPPzRONRnDIQpQ+dOXljtklLUB2Yx9ta2AIiRbfij8oPS40NL9Pki1BunNHqTjLzUxZJfxZ6PQfWpHp/VXaH5WnFuI55M4rZ5/YjZiLhgw9/jd8lhT9L3AFs0MsBoKU8KB95WZGB2BG4rI1DveVJt3R07k9YQ3H00h+//7e917nlaSWKgsHIwJw4FwtftAc6Wp5FQsdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awWDoA2v6+cFxczNSJAnXgiAIlB01pUEuSfnd8Yczi4=;
 b=UbSc/u/xO+L+WEso0QmfY/hyTXeV8ie1vDT5y6xrgEg0FHL+3+8KGcy+gfLlawCak6u1ly6SDk1F7pV3dehSMncBQniOHWmud9kNwytfqJvLiF1bJtGsEAJUIYpkWe6S7t0gXL1vXpHVnAg59AFn1ZO5fYkpqKjuncJTbPu34P76HmlidwY6xy7tBayK+JXKpNVfyRqPThL8pPqbdNXb7TxPj2RnGUTq1nrGQ4hdrnAxKW1wUMlt4agcl8KHRi7nbDrOClasOw65ZPZ7uStNtKv1H5KJxslydWZ54UXfp+GLQMe4MaSp0yp2fcVpD0rDio98qxk0JMT5ssszFEeU7w==
Received: from AS4P190CA0017.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::7)
 by PA4PR10MB5657.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:262::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 06:38:26 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::8b) by AS4P190CA0017.outlook.office365.com
 (2603:10a6:20b:5d0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 06:38:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 06:38:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:43:25 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:38:25 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 21 Aug 2026 08:38:07 +0200
Subject: [PATCH v5 05/14] media: stm32: dcmipp: correct swap in YUYV data
 with parallel input
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-stm32-dcmipp-pixel-pipes-support-v5-5-d140efb61d72@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000044:EE_|PA4PR10MB5657:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b5ec3b-dea6-4502-f71b-08deff4ece05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	H/TLU0aX782ufYkKuKT7uLz1mLnUbnwakE6AIAZ2PLO/uFYi77t0G/JwC6VbZ2e4Ix+3dm1KNl2qPLiEVQsnizu1kHAzJpMGH7k9KQrUnRazlu9k+8TLv1Y1QOkjvGMSxsAX3H+SxRdfyj4LJsUJai35QgCK6Ly0UHa2aQeC4aGyoaD3syn5QHt3nf6F8FSi7+qfn/xsklsTaVad/SOwgvNhLjPVdq1xllE1+eIOpv2f+eeHHTY9cZKEHnvgP5Taa2ND8ngRRQrm0W3WJiBFqHJ6WrvHTiSDtZOy8fc2cj9T7vdS2/0hSnolJKrZOIsp4hQVzGsEWceEZFfCUyHVmz1umAIwqGJ+mUYupPQ+1hdqJZK7WQhGOcNmDfxj8icV/R8fmFtFLwaxpjeEUeTSpCkcx6qs81hgGzgF5vvh8SsK3+4xMitehKobM0S7JMx7JoJZNfM07w9o4+KDh6FizoMjKwzOq8n5vABNfYggOaEVLAZWmmVyhWFofIYn86Le6Scl1tcMNzzjHyvxntNctThmkirtBbJcpRjqOlF1Ol3akrIkh7mgo6BllsMGz24egGPZXE/bwUi/ptS3ZRWQRTmG5eRDMYcLOvlnsL+nC3h1RBQtMuO7HfZrvtCE6g7yQChnWxqWDAJY9XWQ1mCZiHajpITuiP+Zxx3QvrHAuhjskrasgRNrV856STeSiGPx/oYRX9Xt/EHxh04Tz6CadQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P2Q5qs24niua4I9uOtHuM/X4NdcWyx1j4YBJWZ65l8SEsfdK0rYSbt/E6qoLD/MJKt9LVMaoOY5Rq8edTF9OD1z2bH/Bj8p0XdJwfTR7ehBv4jotHTYqLL4W1CajdKeL/xmqOwOl/RJiuDulrp7qm91JX00kO7GLqDtR3a3Z1DyPg7g7cuxLRQ0Jp7aq0ywiEuewcJ/3s4lqTfTXJuruV0OPoMsAP/vkb5LSPGBvKkuzqlT4UhR1AFvbVVkXPnDHykQLNZlIpVJS4Bk1HONCgS8fq11GYDbDJYugqKH9InhP7ws0luoBXCnizMwKoHrm+zJiCOT8K2xS+avwteU7pqwPuHkkfsXd3xl5Q1cpysyd5XLCvhCc6nI3CPD+xmyNZnVpF3QXtL4oS3W2oS6SDX0bnXANSzDu312JcEQAE1lMEz5GoTD6n9BMGGYA0KXl
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 06:38:26.1289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b5ec3b-dea6-4502-f71b-08deff4ece05
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5657

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
index b94a9c87f56e2..b491ce00c6562 100644
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

