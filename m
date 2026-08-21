Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012042.outbound.protection.outlook.com [52.101.66.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E4941D129;
	Fri, 21 Aug 2026 06:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294322; cv=fail; b=MUjk0hjAwI8TiExOa4lpHsWV+CtveP6IfMwceTIZhOzPQke6y7VAtsxyO/g7b+LqYeV9rSpmKyjfFsW5MHEJwRQA0kyV7DGGreNnt3WDWtXbbS9uyOTJtxlUZfE2qSe6rDEKuIQLLCtNXz795GzjC9GY097/a2Uw4CKRi8oKTwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294322; c=relaxed/simple;
	bh=2vqsuWI7+m1QxE+f2H/I11leeaeDI96p4iQOg+Y585A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iyvQ3SCoSpM+i8Y8mBwxRvWpZubC2P1KNF7f5EZLQPapy6Fit5r1X6nKoaAN/Gn3imJue1pGeBWuqgtlF/nTK6CKiFa9UaTddZi9bYjgogQ9Q9+DK/PlcO/bLpvoVrEp3NopS07aVd95cgEX0y2wRv6AO113NlYUeaAek7FlMDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Fnlo11P/; arc=fail smtp.client-ip=52.101.66.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Fnlo11P/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEy9mSRG0KPSpyAm65teMu6edXVoAWhZ4zIGPXMatFHCGm66RID70qLnGaJgvpz7Q1c7v89QIeNZUdwhns9P7Fwd+slM3jVvGhJTaQ6e/ftdGTRhrS47qFPR82c4AYfRcdUVvojEgRuMoPenjL3qnz67dcL1M3XL7u9bsZXcOXdy07UcA67DpRhFYwdjIrg/6R9UpNJ6BOWEqQLgOu+3Og7SaMlrydt91hwQzzcho4IWIAMxMgpO8CIA3acv6U5sd/3mCTxvOfjYYvJxS+QtPucE5NctuAv7Ld1akI9yN4uFfVPnFeyeWUwH/Oj2mtKERV8yf+YOWP29i3KnD2Cd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sL3mybwD8iwAhhFwx93bpSUy0vpP8I9PlCE8Q7OvOOA=;
 b=dw5DvjR8Vql56XXvLoBGTqia8iSUE/0aNorDGKM7q395gpTwcDLs8AmVKdcyEHogHft8V0bzAIpGRPTcE94IZTpGI8GNFskkR00bU6VDdDa423d7y5O8HXqb34X6LmVkhqDnjvAXceeHMIPfsjZOAgmABJNidtBb7mWMrXtH4TbT+GCaAmW4sARBZHWPUDUO+6w8tarbWkFyawjXoIBPlindc4F7VkhpjQNJUhmkNxrMhSjszs8Svw+V4SbfzTOo6mTYatYIjLbJwqjFQNb/Pw3k4RwSR77461QI9e6f0h0Mb88pgWmD29H7ZU546qImuQ/DhE1ZamJVUUydC3GExQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sL3mybwD8iwAhhFwx93bpSUy0vpP8I9PlCE8Q7OvOOA=;
 b=Fnlo11P/nXzF9mJnO3VLcIx3hpCKb8sLrCZo/z/FuDVrV9DipBBC7H9evShQ/Z/CVw54muZFedPArbrL3w8Q4rpPJqJl7XMos0GYAl+HTALJfoxe4jVJxIGJVvVo2U/7KRmTmMHmw4Ty7LA4D6nBKk96HS8Aj4w6VvLD7v1LzOLcoxnM+MC4kQsEPdrQxG04/OIk0rAO+ug35eOu0VOFOLtdVqD7mvux308vrvFEPRZ9pwdSIPmJdjOMqE9UEHvpIDcRa7Ci/TXYAw5yZbjH533l7/CnJztjxDjazYitFXVaGkMSjv3y6dTv8EuGuRfYoNcXsBRq6UkeYF9blJBObQ==
Received: from AS4P189CA0062.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::9)
 by PR3PR10MB4000.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 06:38:31 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::6d) by AS4P189CA0062.outlook.office365.com
 (2603:10a6:20b:659::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 06:38:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 06:38:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:43:30 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:38:30 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 21 Aug 2026 08:38:15 +0200
Subject: [PATCH v5 13/14] media: stm32: dcmipp: rename bytecap into capture
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-stm32-dcmipp-pixel-pipes-support-v5-13-d140efb61d72@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|PR3PR10MB4000:EE_
X-MS-Office365-Filtering-Correlation-Id: c87c76ff-ac8d-4637-1bd2-08deff4ed0d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|6133799003|56012099006|10067099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	K6hUVoWGhdHbKr5mIXbX/zEO4PsexWSKg97pDhMEHQcCKIgHJVswzUMcq+CLJTgPgCCevuIC6nPGhdq4kNoeRKe1HgrzuUQfqCEPHLv5QBjdN/nHmtPYpN9wvBWOqQr7MTdqJvqEPNTw2I8zohFgMohlh2h07q6k8M2IZ73HTCsKwSzCnBA8vRBLwarn58W5Isos4zK7jJ4aK2bOq6T4PEqZnkXXxIsywD1ANrfa4tYj9njtm0eU82XM9hhlXuzY4YbsRb60DftZxwFbkBrVj+seyRDBnkSBeTIKVUFCf8Ly7AuH4nh4YMYc0rdvS0CPR3JlY4gMdpevNNOvnHWHkecVu2cGvl7yaZCzg7XfzeQ1KXdFl3pGnava4cRozcPjF1rzccSh63Vx9AgNbRaSySStsDfTNGWLUbgcBTeC9b2uPcZ24qLWEDE7C8EJOBgdZ/CH9EPPUxT2J2VzwM4Fu7jkfvQEOxf2l7mFjF0qN6cV1VTsNhtp15D36gU9W4FaUOqnPRIXApbF4QKArzt1ndJ731HLiNGp1SndQ3MRhCrK6fg9G1URyO45ksUDhaKS2F3zPHTvdW/7JJOz1MSJprIJl8mE/S8BfrtpYxqgRrVXwYXsVqVginBFAQKJVPJfyK3PUT9OZeGZKatGTb1Q3xIesPdn3LlZfiAaDrDRHRzXPPESXkRjxh4FZYYb/DDwsvZXg0mYGAWLxlDsA/bzOw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m8cTpc4mDX8guqFBrMJO469PydsUfqvnjdSgrqQXIvoL8S8g+i7qPS7tpSAtJVvTi/jjXbnkCQoVPkKIDhQtFh+YCSvvwfx2hdbW6zWgeUc8kiGD9k8KOkk73Wy9rdrfm37eF8cBFE8WNzPvsM3CbGEW1B2UGriT3ddn6DeqVqiRj/eWOmvgA2FY0vI902MjUECkbbU1qRsp+Omd7SpDCqQdTpPbhwoQ2OqLpLipNqwkJQCWL8toukrQCZSeXzlJEpBgUAkVMinfPbIOq4guyV93fbiGE75He+dafG/RPAZiiey2Pr1iQnZU7VsyUUzHL5jjj19MuAqeI/wNMb9Y82yDJXt+2UA9lCaIj/dcL5UuduHgAbWrxsV1p8fE1ReiEiQZMUycHyu5n8mu5UKP/pLujXmzSSHjveCxPwAx0KRdGNNZZiZN1I+TjDza0aIN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 06:38:30.8262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c87c76ff-ac8d-4637-1bd2-08deff4ed0d2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4000

Since the bytecap video driver is now handling all
capture (byte & pixel), rename the file and structs
*into capture. This is done by:
  - renaming of dcmipp-bytecap.c into dcmipp-capture.c
  - replace of dcmipp_bytecap strings into dcmipp_capture

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   2 +-
 .../{dcmipp-bytecap.c => dcmipp-capture.c}         | 188 ++++++++++-----------
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |   4 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |   8 +-
 4 files changed, 101 insertions(+), 101 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
index 7178934bb116b..e35d45a0aca23 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-bytecap.o
+stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-capture.o
 stm32-dcmipp-y += dcmipp-pixelcommon.o dcmipp-isp.o dcmipp-pixelproc.o
 
 obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c
similarity index 85%
rename from drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
rename to drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c
index 4a8976da576af..fe7767f908b7c 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c
@@ -94,7 +94,7 @@
 
 #define DCMIPP_PxPPCR_SWAPRB		BIT(4)
 
-struct dcmipp_bytecap_pix_map {
+struct dcmipp_capture_pix_map {
 	unsigned int code;
 	u32 pixelformat;
 	u32 plane_nb;
@@ -108,7 +108,7 @@ struct dcmipp_bytecap_pix_map {
 		.pixelformat = V4L2_PIX_FMT_##fmt	\
 	}
 
-static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_dump_pix_map_list[] = {
+static const struct dcmipp_capture_pix_map dcmipp_capture_dump_pix_map_list[] = {
 	PIXMAP_MBUS_PFMT(RGB565_2X8_LE, RGB565),
 	PIXMAP_MBUS_PFMT(RGB565_1X16, RGB565),
 	PIXMAP_MBUS_PFMT(RGB888_1X24, RGB24),
@@ -152,7 +152,7 @@ static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_dump_pix_map_list[] =
 		.swap_uv = swap,			\
 	}
 
-static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pixel_pix_map_list[] = {
+static const struct dcmipp_capture_pix_map dcmipp_capture_pixel_pix_map_list[] = {
 	/* Coplanar formats are supported on main & aux pipe */
 	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, RGB565, 1, DCMIPP_PxPPCR_FORMAT_RGB565, 0),
 	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, YUYV, 1, DCMIPP_PxPPCR_FORMAT_YUYV, 0),
@@ -187,7 +187,7 @@ struct dcmipp_buf {
 	struct list_head	list;
 };
 
-struct dcmipp_bytecap_device {
+struct dcmipp_capture_device {
 	struct dcmipp_ent_device ved;
 	struct video_device vdev;
 	struct device *dev;
@@ -219,7 +219,7 @@ struct dcmipp_bytecap_device {
 
 	int pipe_id;
 
-	const struct dcmipp_bytecap_pix_map *pix_map;
+	const struct dcmipp_capture_pix_map *pix_map;
 	unsigned int pix_map_array_size;
 
 	u32 cmsr2;
@@ -237,8 +237,8 @@ struct dcmipp_bytecap_device {
 	} count;
 };
 
-static const struct dcmipp_bytecap_pix_map *
-dcmipp_bytecap_pix_map_by_pixelformat(struct dcmipp_bytecap_device *vcap,
+static const struct dcmipp_capture_pix_map *
+dcmipp_capture_pix_map_by_pixelformat(struct dcmipp_capture_device *vcap,
 				      u32 pixelformat)
 {
 	for (unsigned int i = 0; i < vcap->pix_map_array_size; i++) {
@@ -249,11 +249,11 @@ dcmipp_bytecap_pix_map_by_pixelformat(struct dcmipp_bytecap_device *vcap,
 	return NULL;
 }
 
-static bool dcmipp_bytecap_is_format_valid(struct dcmipp_bytecap_device *vcap,
+static bool dcmipp_capture_is_format_valid(struct dcmipp_capture_device *vcap,
 					   unsigned int pixelformat)
 {
-	const struct dcmipp_bytecap_pix_map *vpix =
-		dcmipp_bytecap_pix_map_by_pixelformat(vcap, pixelformat);
+	const struct dcmipp_capture_pix_map *vpix =
+		dcmipp_capture_pix_map_by_pixelformat(vcap, pixelformat);
 
 	if (!vpix || (vpix->plane_nb > 1 && vcap->pipe_id != 1))
 		return false;
@@ -341,7 +341,7 @@ static inline int frame_planes(dma_addr_t base_addr, dma_addr_t addrs[],
 	return 0;
 }
 
-static int dcmipp_bytecap_querycap(struct file *file, void *priv,
+static int dcmipp_capture_querycap(struct file *file, void *priv,
 				   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, DCMIPP_PDEV_NAME, sizeof(cap->driver));
@@ -350,25 +350,25 @@ static int dcmipp_bytecap_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_g_fmt_vid_cap(struct file *file, void *priv,
+static int dcmipp_capture_g_fmt_vid_cap(struct file *file, void *priv,
 					struct v4l2_format *f)
 {
-	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	struct dcmipp_capture_device *vcap = video_drvdata(file);
 
 	f->fmt.pix = vcap->format;
 
 	return 0;
 }
 
-static int dcmipp_bytecap_try_fmt_vid_cap(struct file *file, void *priv,
+static int dcmipp_capture_try_fmt_vid_cap(struct file *file, void *priv,
 					  struct v4l2_format *f)
 {
-	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	struct dcmipp_capture_device *vcap = video_drvdata(file);
 	struct v4l2_pix_format *format = &f->fmt.pix;
 	u32 in_w, in_h;
 
 	/* Don't accept a pixelformat that is not on the table */
-	if (!dcmipp_bytecap_is_format_valid(vcap, format->pixelformat))
+	if (!dcmipp_capture_is_format_valid(vcap, format->pixelformat))
 		format->pixelformat = fmt_default.pixelformat;
 
 	/* Adjust width & height */
@@ -403,17 +403,17 @@ static int dcmipp_bytecap_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_s_fmt_vid_cap(struct file *file, void *priv,
+static int dcmipp_capture_s_fmt_vid_cap(struct file *file, void *priv,
 					struct v4l2_format *f)
 {
-	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	struct dcmipp_capture_device *vcap = video_drvdata(file);
 	int ret;
 
 	/* Do not change the format while stream is on */
 	if (vb2_is_busy(&vcap->queue))
 		return -EBUSY;
 
-	ret = dcmipp_bytecap_try_fmt_vid_cap(file, priv, f);
+	ret = dcmipp_capture_try_fmt_vid_cap(file, priv, f);
 	if (ret)
 		return ret;
 
@@ -435,10 +435,10 @@ static int dcmipp_bytecap_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
+static int dcmipp_capture_enum_fmt_vid_cap(struct file *file, void *priv,
 					   struct v4l2_fmtdesc *f)
 {
-	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	struct dcmipp_capture_device *vcap = video_drvdata(file);
 	unsigned int index = f->index;
 	unsigned int i, prev_pixelformat = 0;
 
@@ -476,17 +476,17 @@ static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_enum_framesizes(struct file *file, void *fh,
+static int dcmipp_capture_enum_framesizes(struct file *file, void *fh,
 					  struct v4l2_frmsizeenum *fsize)
 {
-	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	struct dcmipp_capture_device *vcap = video_drvdata(file);
 
 
 	if (fsize->index)
 		return -EINVAL;
 
 	/* Only accept code in the pix map table */
-	if (!dcmipp_bytecap_is_format_valid(vcap, fsize->pixel_format))
+	if (!dcmipp_capture_is_format_valid(vcap, fsize->pixel_format))
 		return -EINVAL;
 
 	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
@@ -500,7 +500,7 @@ static int dcmipp_bytecap_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static const struct v4l2_file_operations dcmipp_bytecap_fops = {
+static const struct v4l2_file_operations dcmipp_capture_fops = {
 	.owner		= THIS_MODULE,
 	.open		= v4l2_fh_open,
 	.release	= vb2_fop_release,
@@ -510,14 +510,14 @@ static const struct v4l2_file_operations dcmipp_bytecap_fops = {
 	.mmap           = vb2_fop_mmap,
 };
 
-static const struct v4l2_ioctl_ops dcmipp_bytecap_ioctl_ops = {
-	.vidioc_querycap = dcmipp_bytecap_querycap,
+static const struct v4l2_ioctl_ops dcmipp_capture_ioctl_ops = {
+	.vidioc_querycap = dcmipp_capture_querycap,
 
-	.vidioc_g_fmt_vid_cap = dcmipp_bytecap_g_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap = dcmipp_bytecap_s_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap = dcmipp_bytecap_try_fmt_vid_cap,
-	.vidioc_enum_fmt_vid_cap = dcmipp_bytecap_enum_fmt_vid_cap,
-	.vidioc_enum_framesizes = dcmipp_bytecap_enum_framesizes,
+	.vidioc_g_fmt_vid_cap = dcmipp_capture_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap = dcmipp_capture_s_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap = dcmipp_capture_try_fmt_vid_cap,
+	.vidioc_enum_fmt_vid_cap = dcmipp_capture_enum_fmt_vid_cap,
+	.vidioc_enum_framesizes = dcmipp_capture_enum_framesizes,
 
 	.vidioc_reqbufs = vb2_ioctl_reqbufs,
 	.vidioc_create_bufs = vb2_ioctl_create_bufs,
@@ -530,7 +530,7 @@ static const struct v4l2_ioctl_ops dcmipp_bytecap_ioctl_ops = {
 	.vidioc_streamoff = vb2_ioctl_streamoff,
 };
 
-static void dcmipp_start_capture(struct dcmipp_bytecap_device *vcap,
+static void dcmipp_start_capture(struct dcmipp_capture_device *vcap,
 				 struct dcmipp_buf *buf)
 {
 	/* Set buffer address */
@@ -557,7 +557,7 @@ static void dcmipp_start_capture(struct dcmipp_bytecap_device *vcap,
 	reg_set(vcap, DCMIPP_PxFCTCR(vcap->pipe_id), DCMIPP_PxFCTCR_CPTREQ);
 }
 
-static void dcmipp_bytecap_all_buffers_done(struct dcmipp_bytecap_device *vcap,
+static void dcmipp_capture_all_buffers_done(struct dcmipp_capture_device *vcap,
 					    enum vb2_buffer_state state)
 {
 	struct dcmipp_buf *buf, *node;
@@ -568,10 +568,10 @@ static void dcmipp_bytecap_all_buffers_done(struct dcmipp_bytecap_device *vcap,
 	}
 }
 
-static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
+static int dcmipp_capture_start_streaming(struct vb2_queue *vq,
 					  unsigned int count)
 {
-	struct dcmipp_bytecap_device *vcap = vb2_get_drv_priv(vq);
+	struct dcmipp_capture_device *vcap = vb2_get_drv_priv(vq);
 	struct media_entity *entity = &vcap->vdev.entity;
 	struct dcmipp_buf *buf;
 	struct media_pad *pad;
@@ -582,7 +582,7 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 
 	/*
 	 * Get source subdev - since link is IMMUTABLE, pointer is cached
-	 * within the dcmipp_bytecap_device structure
+	 * within the dcmipp_capture_device structure
 	 */
 	if (!vcap->s_subdev) {
 		pad = media_pad_remote_pad_first(&vcap->vdev.entity.pads[0]);
@@ -616,8 +616,8 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 	spin_lock_irq(&vcap->irqlock);
 
 	if (vcap->pipe_id != 0) {
-		const struct dcmipp_bytecap_pix_map *vpix =
-			dcmipp_bytecap_pix_map_by_pixelformat(vcap, vcap->format.pixelformat);
+		const struct dcmipp_capture_pix_map *vpix =
+			dcmipp_capture_pix_map_by_pixelformat(vcap, vcap->format.pixelformat);
 		unsigned int ppcr = 0;
 
 		/*
@@ -666,14 +666,14 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 	 * Return all buffers to vb2 in QUEUED state.
 	 * This will give ownership back to userspace
 	 */
-	dcmipp_bytecap_all_buffers_done(vcap, VB2_BUF_STATE_QUEUED);
+	dcmipp_capture_all_buffers_done(vcap, VB2_BUF_STATE_QUEUED);
 	vcap->active = NULL;
 	spin_unlock_irq(&vcap->irqlock);
 
 	return ret;
 }
 
-static void dcmipp_dump_status(struct dcmipp_bytecap_device *vcap)
+static void dcmipp_dump_status(struct dcmipp_capture_device *vcap)
 {
 	struct device *dev = vcap->dev;
 
@@ -689,9 +689,9 @@ static void dcmipp_dump_status(struct dcmipp_bytecap_device *vcap)
  * Stop the stream engine. Any remaining buffers in the stream queue are
  * dequeued and passed on to the vb2 framework marked as STATE_ERROR.
  */
-static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
+static void dcmipp_capture_stop_streaming(struct vb2_queue *vq)
 {
-	struct dcmipp_bytecap_device *vcap = vb2_get_drv_priv(vq);
+	struct dcmipp_capture_device *vcap = vb2_get_drv_priv(vq);
 	int ret;
 	u32 status;
 
@@ -729,7 +729,7 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 	spin_lock_irq(&vcap->irqlock);
 
 	/* Return all queued buffers to vb2 in ERROR state */
-	dcmipp_bytecap_all_buffers_done(vcap, VB2_BUF_STATE_ERROR);
+	dcmipp_capture_all_buffers_done(vcap, VB2_BUF_STATE_ERROR);
 	INIT_LIST_HEAD(&vcap->buffers);
 
 	vcap->active = NULL;
@@ -749,9 +749,9 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 			 vcap->count.underrun, vcap->count.buffers);
 }
 
-static int dcmipp_bytecap_buf_prepare(struct vb2_buffer *vb)
+static int dcmipp_capture_buf_prepare(struct vb2_buffer *vb)
 {
-	struct dcmipp_bytecap_device *vcap =  vb2_get_drv_priv(vb->vb2_queue);
+	struct dcmipp_capture_device *vcap =  vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct dcmipp_buf *buf = container_of(vbuf, struct dcmipp_buf, vb);
 	struct v4l2_pix_format *format = &vcap->format;
@@ -803,9 +803,9 @@ static int dcmipp_bytecap_buf_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
-static void dcmipp_bytecap_buf_queue(struct vb2_buffer *vb2_buf)
+static void dcmipp_capture_buf_queue(struct vb2_buffer *vb2_buf)
 {
-	struct dcmipp_bytecap_device *vcap =
+	struct dcmipp_capture_device *vcap =
 		vb2_get_drv_priv(vb2_buf->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb2_buf);
 	struct dcmipp_buf *buf = container_of(vbuf, struct dcmipp_buf, vb);
@@ -829,13 +829,13 @@ static void dcmipp_bytecap_buf_queue(struct vb2_buffer *vb2_buf)
 	spin_unlock_irq(&vcap->irqlock);
 }
 
-static int dcmipp_bytecap_queue_setup(struct vb2_queue *vq,
+static int dcmipp_capture_queue_setup(struct vb2_queue *vq,
 				      unsigned int *nbuffers,
 				      unsigned int *nplanes,
 				      unsigned int sizes[],
 				      struct device *alloc_devs[])
 {
-	struct dcmipp_bytecap_device *vcap = vb2_get_drv_priv(vq);
+	struct dcmipp_capture_device *vcap = vb2_get_drv_priv(vq);
 	unsigned int size;
 
 	size = vcap->format.sizeimage;
@@ -853,7 +853,7 @@ static int dcmipp_bytecap_queue_setup(struct vb2_queue *vq,
 	return 0;
 }
 
-static int dcmipp_bytecap_buf_init(struct vb2_buffer *vb)
+static int dcmipp_capture_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct dcmipp_buf *buf = container_of(vbuf, struct dcmipp_buf, vb);
@@ -863,19 +863,19 @@ static int dcmipp_bytecap_buf_init(struct vb2_buffer *vb)
 	return 0;
 }
 
-static const struct vb2_ops dcmipp_bytecap_qops = {
-	.start_streaming	= dcmipp_bytecap_start_streaming,
-	.stop_streaming		= dcmipp_bytecap_stop_streaming,
-	.buf_init		= dcmipp_bytecap_buf_init,
-	.buf_prepare		= dcmipp_bytecap_buf_prepare,
-	.buf_queue		= dcmipp_bytecap_buf_queue,
-	.queue_setup		= dcmipp_bytecap_queue_setup,
+static const struct vb2_ops dcmipp_capture_qops = {
+	.start_streaming	= dcmipp_capture_start_streaming,
+	.stop_streaming		= dcmipp_capture_stop_streaming,
+	.buf_init		= dcmipp_capture_buf_init,
+	.buf_prepare		= dcmipp_capture_buf_prepare,
+	.buf_queue		= dcmipp_capture_buf_queue,
+	.queue_setup		= dcmipp_capture_queue_setup,
 };
 
-static void dcmipp_bytecap_release(struct video_device *vdev)
+static void dcmipp_capture_release(struct video_device *vdev)
 {
-	struct dcmipp_bytecap_device *vcap =
-		container_of(vdev, struct dcmipp_bytecap_device, vdev);
+	struct dcmipp_capture_device *vcap =
+		container_of(vdev, struct dcmipp_capture_device, vdev);
 
 	dcmipp_pads_cleanup(vcap->ved.pads);
 	mutex_destroy(&vcap->lock);
@@ -883,16 +883,16 @@ static void dcmipp_bytecap_release(struct video_device *vdev)
 	kfree(vcap);
 }
 
-void dcmipp_bytecap_ent_release(struct dcmipp_ent_device *ved)
+void dcmipp_capture_ent_release(struct dcmipp_ent_device *ved)
 {
-	struct dcmipp_bytecap_device *vcap =
-		container_of(ved, struct dcmipp_bytecap_device, ved);
+	struct dcmipp_capture_device *vcap =
+		container_of(ved, struct dcmipp_capture_device, ved);
 
 	media_entity_cleanup(ved->ent);
 	vb2_video_unregister_device(&vcap->vdev);
 }
 
-static void dcmipp_buffer_done(struct dcmipp_bytecap_device *vcap,
+static void dcmipp_buffer_done(struct dcmipp_capture_device *vcap,
 			       struct dcmipp_buf *buf,
 			       size_t bytesused,
 			       int err)
@@ -916,7 +916,7 @@ static void dcmipp_buffer_done(struct dcmipp_bytecap_device *vcap,
 
 /* irqlock must be held */
 static void
-dcmipp_bytecap_set_next_frame_or_stop(struct dcmipp_bytecap_device *vcap)
+dcmipp_capture_set_next_frame_or_stop(struct dcmipp_capture_device *vcap)
 {
 	if (!vcap->next && list_is_singular(&vcap->buffers)) {
 		/*
@@ -954,7 +954,7 @@ dcmipp_bytecap_set_next_frame_or_stop(struct dcmipp_bytecap_device *vcap)
 }
 
 /* irqlock must be held */
-static void dcmipp_bytecap_process_frame(struct dcmipp_bytecap_device *vcap,
+static void dcmipp_capture_process_frame(struct dcmipp_capture_device *vcap,
 					 size_t bytesused)
 {
 	int err = 0;
@@ -980,10 +980,10 @@ static void dcmipp_bytecap_process_frame(struct dcmipp_bytecap_device *vcap,
 	vcap->active = NULL;
 }
 
-static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
+static irqreturn_t dcmipp_capture_irq_thread(int irq, void *arg)
 {
-	struct dcmipp_bytecap_device *vcap =
-			container_of(arg, struct dcmipp_bytecap_device, ved);
+	struct dcmipp_capture_device *vcap =
+			container_of(arg, struct dcmipp_capture_device, ved);
 	u32 cmsr2_pxframef;
 	u32 cmsr2_pxvsyncf;
 	u32 cmsr2_pxovrf;
@@ -1013,7 +1013,7 @@ static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
 			bytesused = reg_read(vcap, DCMIPP_P0DCCNTR);
 		else
 			bytesused = vcap->format.sizeimage;
-		dcmipp_bytecap_process_frame(vcap, bytesused);
+		dcmipp_capture_process_frame(vcap, bytesused);
 	}
 
 	if (vcap->cmsr2 & cmsr2_pxvsyncf) {
@@ -1033,7 +1033,7 @@ static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
 		 * active (but not used) buffer and put it back into next.
 		 */
 		swap(vcap->active, vcap->next);
-		dcmipp_bytecap_set_next_frame_or_stop(vcap);
+		dcmipp_capture_set_next_frame_or_stop(vcap);
 	}
 
 out:
@@ -1041,10 +1041,10 @@ static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t dcmipp_bytecap_irq_callback(int irq, void *arg)
+static irqreturn_t dcmipp_capture_irq_callback(int irq, void *arg)
 {
-	struct dcmipp_bytecap_device *vcap =
-			container_of(arg, struct dcmipp_bytecap_device, ved);
+	struct dcmipp_capture_device *vcap =
+			container_of(arg, struct dcmipp_capture_device, ved);
 	struct dcmipp_ent_device *ved = arg;
 
 	/* Store interrupt status register */
@@ -1059,12 +1059,12 @@ static irqreturn_t dcmipp_bytecap_irq_callback(int irq, void *arg)
 	return IRQ_WAKE_THREAD;
 }
 
-static int dcmipp_bytecap_link_validate(struct media_link *link)
+static int dcmipp_capture_link_validate(struct media_link *link)
 {
 	struct media_entity *entity = link->sink->entity;
 	struct video_device *vd = media_entity_to_video_device(entity);
-	struct dcmipp_bytecap_device *vcap = container_of(vd,
-					struct dcmipp_bytecap_device, vdev);
+	struct dcmipp_capture_device *vcap = container_of(vd,
+					struct dcmipp_capture_device, vdev);
 	struct v4l2_subdev *source_sd =
 		media_entity_to_v4l2_subdev(link->source->entity);
 	struct v4l2_subdev_format source_fmt = {
@@ -1113,8 +1113,8 @@ static int dcmipp_bytecap_link_validate(struct media_link *link)
 	return 0;
 }
 
-static const struct media_entity_operations dcmipp_bytecap_entity_ops = {
-	.link_validate = dcmipp_bytecap_link_validate,
+static const struct media_entity_operations dcmipp_capture_entity_ops = {
+	.link_validate = dcmipp_capture_link_validate,
 };
 
 static int dcmipp_name_to_pipe_id(const char *name)
@@ -1129,17 +1129,17 @@ static int dcmipp_name_to_pipe_id(const char *name)
 		return -EINVAL;
 }
 
-struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
+struct dcmipp_ent_device *dcmipp_capture_ent_init(const char *entity_name,
 						  struct dcmipp_device *dcmipp)
 {
-	struct dcmipp_bytecap_device *vcap;
+	struct dcmipp_capture_device *vcap;
 	struct device *dev = dcmipp->dev;
 	struct video_device *vdev;
 	struct vb2_queue *q;
 	const unsigned long pad_flag = MEDIA_PAD_FL_SINK;
 	int ret = 0;
 
-	/* Allocate the dcmipp_bytecap_device struct */
+	/* Allocate the dcmipp_capture_device struct */
 	vcap = kzalloc_obj(*vcap);
 	if (!vcap)
 		return ERR_PTR(-ENOMEM);
@@ -1154,11 +1154,11 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 
 	/* Initialize supported format table format */
 	if (vcap->pipe_id == 0) {
-		vcap->pix_map = dcmipp_bytecap_dump_pix_map_list;
-		vcap->pix_map_array_size = ARRAY_SIZE(dcmipp_bytecap_dump_pix_map_list);
+		vcap->pix_map = dcmipp_capture_dump_pix_map_list;
+		vcap->pix_map_array_size = ARRAY_SIZE(dcmipp_capture_dump_pix_map_list);
 	} else {
-		vcap->pix_map = dcmipp_bytecap_pixel_pix_map_list;
-		vcap->pix_map_array_size = ARRAY_SIZE(dcmipp_bytecap_pixel_pix_map_list);
+		vcap->pix_map = dcmipp_capture_pixel_pix_map_list;
+		vcap->pix_map_array_size = ARRAY_SIZE(dcmipp_capture_pixel_pix_map_list);
 	}
 
 	/* Allocate the pads */
@@ -1173,7 +1173,7 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 	/* Initialize the media entity */
 	vcap->vdev.entity.name = entity_name;
 	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
-	vcap->vdev.entity.ops = &dcmipp_bytecap_entity_ops;
+	vcap->vdev.entity.ops = &dcmipp_capture_entity_ops;
 	ret = media_entity_pads_init(&vcap->vdev.entity, 1, vcap->ved.pads);
 	if (ret)
 		goto err_clean_pads;
@@ -1188,7 +1188,7 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 	q->lock = &vcap->lock;
 	q->drv_priv = vcap;
 	q->buf_struct_size = sizeof(struct dcmipp_buf);
-	q->ops = &dcmipp_bytecap_qops;
+	q->ops = &dcmipp_capture_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->min_queued_buffers = 1;
@@ -1217,8 +1217,8 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 
 	/* Fill the dcmipp_ent_device struct */
 	vcap->ved.ent = &vcap->vdev.entity;
-	vcap->ved.handler = dcmipp_bytecap_irq_callback;
-	vcap->ved.thread_fn = dcmipp_bytecap_irq_thread;
+	vcap->ved.handler = dcmipp_capture_irq_callback;
+	vcap->ved.thread_fn = dcmipp_capture_irq_thread;
 	vcap->dev = dev;
 	vcap->regs = dcmipp->regs;
 
@@ -1226,9 +1226,9 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 	vdev = &vcap->vdev;
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
 			    V4L2_CAP_IO_MC;
-	vdev->release = dcmipp_bytecap_release;
-	vdev->fops = &dcmipp_bytecap_fops;
-	vdev->ioctl_ops = &dcmipp_bytecap_ioctl_ops;
+	vdev->release = dcmipp_capture_release;
+	vdev->fops = &dcmipp_capture_fops;
+	vdev->ioctl_ops = &dcmipp_capture_ioctl_ops;
 	vdev->lock = &vcap->lock;
 	vdev->queue = q;
 	vdev->v4l2_dev = &dcmipp->v4l2_dev;
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index 68766145d543c..007912c3a7f8e 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -280,9 +280,9 @@ struct dcmipp_ent_device *
 dcmipp_byteproc_ent_init(const char *entity_name,
 			 struct dcmipp_device *dcmipp);
 void dcmipp_byteproc_ent_release(struct dcmipp_ent_device *ved);
-struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
+struct dcmipp_ent_device *dcmipp_capture_ent_init(const char *entity_name,
 						  struct dcmipp_device *dcmipp);
-void dcmipp_bytecap_ent_release(struct dcmipp_ent_device *ved);
+void dcmipp_capture_ent_release(struct dcmipp_ent_device *ved);
 struct dcmipp_ent_device *dcmipp_isp_ent_init(const char *entity_name,
 					      struct dcmipp_device *dcmipp);
 void dcmipp_isp_ent_release(struct dcmipp_ent_device *ved);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 9aba16096d289..a52b3b0e3c375 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -50,8 +50,8 @@ static const struct dcmipp_ent_config stm32mp13_ent_config[] = {
 	},
 	{
 		.name = "dcmipp_dump_capture",
-		.init = dcmipp_bytecap_ent_init,
-		.release = dcmipp_bytecap_ent_release,
+		.init = dcmipp_capture_ent_init,
+		.release = dcmipp_capture_ent_release,
 	},
 };
 
@@ -88,8 +88,8 @@ static const struct dcmipp_ent_config stm32mp25_ent_config[] = {
 	},
 	{
 		.name = "dcmipp_dump_capture",
-		.init = dcmipp_bytecap_ent_init,
-		.release = dcmipp_bytecap_ent_release,
+		.init = dcmipp_capture_ent_init,
+		.release = dcmipp_capture_ent_release,
 	},
 };
 

-- 
2.34.1

