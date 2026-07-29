Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011011.outbound.protection.outlook.com [52.101.57.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A743B42E3;
	Wed, 29 Jul 2026 10:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320299; cv=fail; b=paAmE1XSQ4qZoj2GEgoAZLqI0pU3TWRn3LS9oTptStw3bRvIBBcut4W9yzj5BxHEgtY+3Uyo8FH5jN1rtfvsm+FhvCr8Ho+0oVkQKOz3+gy0J18Y/yWl5aEEF+IKjbk8UCvNZaF2Sl+NHgSzRUvzMFOZXUU0oUjGwtk9dXn+8HY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320299; c=relaxed/simple;
	bh=4BvxnpypQYrevlfBq7x/j8fL4o2QPcrbBx6LVcwoK84=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IufaYGgWmeBncpIk9dQa/8Qw0zr3I/rf2vIoRT3ejyr6vNRAJqk9ChFZxXy401/fgBX5PwavKqkon7o3MbBff/VcnFQZIreyqvNH7dzbWQ04AnrPfdXFWd0oRRp71Mw/oK8q8uN7YWtJVNRwEYRuQpMImvswEglPvzYhPRoe41I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uOFIN5Cy; arc=fail smtp.client-ip=52.101.57.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uOFIN5Cy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cw8K+PCkscQKneeyhLXbQMWSuz+hcfLH7n1YD5sVfxRM5JXujPscy8YIRD7sxO1Q0fNwEzagDuf2KRzBaokR8ozn8hD/nm3V2mXpSw4OLhJw8lQ/d7gg/YvIielDeCMn6Lkl/RWPC92mybZQ6yuX9+d/nJBBQojMCPHbI4AjNtrjBoS5H5Zd+98Q/J265D2G75AvYdzM9FvKMM5r8QF1qgUmC/LfTvFrbRISrFHncBZGLkuxfPT4OCTsCW7/SpjEVL0iRZG75QxtTwZ7t3d0GN2Gzlchhrdy74vJpsbtWSdqgiZbOL7MxLrlGamcrs9+LGLIS0ylAadyblKskRjGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnH+ZSEhlCd4rHV81aslMU0DtNzllincRE46KqIsoI8=;
 b=dwURToChGxCl/wxq0W95ecx+SyC5XRY58VAYiXP670+KbEkuh5yvDU8O05Q01znRLo73gWJzmU7h8j1396c8843ZtMcEj4jtDu07VdIONuVtyDTBvvdAI8+nSSoWtMhFpH2vueyNGfwIaHTdh3Q20Fv9jXVQ2a+XJ3lQ8Yk/UONKSTNk3n7O8bZIQd702fYerAt+7X00eKYnEwozRunowAdwp7vJKO5Mc7YaMz17fHID8wREU5WdauW+HBk1+qT+xPoCcMlEtPEE+bq2Dx1QtxKdYeOZd3lQmANohNoZU5+pjXWPhsuufEQeyfGl4vqxh6SmlmQ4AYZbxlPDCtgS0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnH+ZSEhlCd4rHV81aslMU0DtNzllincRE46KqIsoI8=;
 b=uOFIN5CyHH5+ykBnPeLXgq3LLAzYcpLKePkB6MEUdfNclRagYmayKG32fv3xel0YNPoms7H9lvFBN+DfVJUvEtaZZAb8/8aYH6VUu41lwjes/qdCxqg2RFYR+oTcA23MQevzvjDIbeOne7MqUXfdJCv96QmmjSd8ATbe+T3lrBA=
Received: from SJ0PR03CA0261.namprd03.prod.outlook.com (2603:10b6:a03:3a0::26)
 by DM3PR12MB9413.namprd12.prod.outlook.com (2603:10b6:8:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 10:18:13 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::14) by SJ0PR03CA0261.outlook.office365.com
 (2603:10b6:a03:3a0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 10:18:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 10:18:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 05:18:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 05:18:11 -0500
Received: from xhdrdevl202.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 29 Jul 2026 05:18:09 -0500
From: Rajesh Gugulothu <rajesh.gugulothu@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, Michal Simek <michal.simek@amd.com>
CC: <rajesh.gugulothu@amd.com>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: xilinx: vtc: Dynamically calculate pixel clock
Date: Wed, 29 Jul 2026 15:48:08 +0530
Message-ID: <20260729101808.3904212-1-rajesh.gugulothu@amd.com>
X-Mailer: git-send-email 2.44.4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|DM3PR12MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: 881049b6-84a8-4210-4e51-08deed5ab248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|6133799003|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	NDMX7YPshkuLLVGFUWFHW+nGZhUn4xZrB+X5YzqDYBnSUwh5AyEFj78fzh76PK2V9qJfdjI5Rdldl3n7gmOgyvXxgt4OEAxzSCwKBjn3upEI+A2hQp2ougOohF65Sp4Lblacr1+urWvVehu07NNqhAWVt2kOcgT1/umfaLIaMMR/xA50GPsE4x7ZIDGIT3NW31nJQRKvvBAUDTv9wsZVZAXTNcXCQCJPj9hjKOm2KgJ7CDFHw+R0IXs+LsSMRZRYC+uDQhCb5opDBi6tEkM00P3zXtgB6xfuxLiBcWYMACVGctV+ChsX5S8ZzmqsCKyN1vIFCUs7NVaCRfmCMZqAhB+BMlj7v2XcdMfg4iCEgNbSUiM+EC+ekhm4vVTCh6blui38TsmzcM6bC4oVqtj0S+tsoccTM4hxldnyIY/5F4f9sNAU9L5CLRWNqqlKPXX1w0/1/WBjCM5GX5jEtG8moX283k38quk3j0lpMM71y4SherXmEOkg9Cb+NUq9twSBP/9TehyuDYlhRhoDtHjZs8l+RpOnh5SVEbkiLkLKvvkpVpRNMk/XLz5vIMPf5QwGXAuvIbl3JgTJANHmFp1lVeyWWB+E8jQFZlmnmrkaJGy3Rt0CPEM4/CFSGjDMgv74UVK0xVMFbbp5rhB4fGCgaVZHLzSgv2lG8A2OKUoVrIPxwUdb3j/UPgY6lBAl2Qs3LhptWuSi4zsdghoOxXnqNA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(6133799003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t+jDlNRpx95usllQ1krvvS4Ks9I1/3BoKI3F2rANg85DBudkjvgM0K8mmX7B0ZH93GhqgXKQsjbGpAn2iKSTB2UHGUNvLHqt0Qwa0lQ+bsiYdZRtFO1rEjn2Iim+ltmLHJJE5zoZSRARjIhygrcy3XtGEULtiQNypwMttdoIw6ITfyfbUqu6sBBaS29ayiNPXjr+iMky82FuPkVnzq7PRqqsrdpQpwjqiMe8cczHbFi3polB3EOXCCkIoTampQQH2BCl2R9hmG+42mrzl3Zdwlt3l7IqPKszgEA1NyIkACv0TWo31QTs+cJ69z5QRQT25G5k9TYXFrgy7DyDt2aQH5gI2BCN9DMnGIsCqK4U9aoiOPwmtRwReAa14qrUytLerr3Yek8pHYsXlngj0OCY8jwfh1QzieMG0lfC9ruxP2YI9l0HfdCTyt2NgCBIREKH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 10:18:12.5761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 881049b6-84a8-4210-4e51-08deed5ab248
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9413

This update enables the vtc to set the pixel clock based on the
specified timing parameters. A new fps field is added to struct
xvtc_config and the pixel rate is computed as fps * hsize * vsize.
After setting the rate, the actual clock rate is read back and a
warning is emitted if it deviates beyond a small tolerance.

The pixel rate is computed in unsigned long arithmetic to avoid a 32-bit
overflow in the fps * hsize * vsize product.

Signed-off-by: Rajesh Gugulothu <rajesh.gugulothu@amd.com>
---
 drivers/media/platform/xilinx/xilinx-vtc.c | 19 +++++++++++++++++++
 drivers/media/platform/xilinx/xilinx-vtc.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/platform/xilinx/xilinx-vtc.c b/drivers/media/platform/xilinx/xilinx-vtc.c
index 92fec7bb4..695eb2a46 100644
--- a/drivers/media/platform/xilinx/xilinx-vtc.c
+++ b/drivers/media/platform/xilinx/xilinx-vtc.c
@@ -141,6 +141,9 @@
 
 #define XVTC_GENERATOR_GLOBAL_DELAY		0x0104
 
+/* Value of 1 = .01% */
+#define XVTC_CLK_MAX_PCT_ERR			1
+
 /**
  * struct xvtc_device - Xilinx Video Timing Controller device structure
  * @xvip: Xilinx Video IP device
@@ -175,10 +178,26 @@ int xvtc_generator_start(struct xvtc_device *xvtc,
 			 const struct xvtc_config *config)
 {
 	int ret;
+	unsigned long s_rate;
+	unsigned long g_rate;
+	unsigned long clk_err;
 
 	if (!xvtc->has_generator)
 		return -ENXIO;
 
+	s_rate = (unsigned long)config->fps * config->hsize * config->vsize;
+	ret = clk_set_rate(xvtc->xvip.clk, s_rate);
+	if (ret < 0)
+		return ret;
+
+	/* Verify that the clock is within a reasonable tolerance. */
+	g_rate = clk_get_rate(xvtc->xvip.clk);
+	clk_err = (abs(g_rate - s_rate) * 10000) / (s_rate);
+	if (clk_err > XVTC_CLK_MAX_PCT_ERR)
+		dev_warn(xvtc->xvip.dev,
+			 "Failed to set clk rate: %lu, actual rate: %lu\n",
+			 s_rate, g_rate);
+
 	ret = clk_prepare_enable(xvtc->xvip.clk);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/media/platform/xilinx/xilinx-vtc.h b/drivers/media/platform/xilinx/xilinx-vtc.h
index 855845911..0f360ed55 100644
--- a/drivers/media/platform/xilinx/xilinx-vtc.h
+++ b/drivers/media/platform/xilinx/xilinx-vtc.h
@@ -27,6 +27,7 @@ struct xvtc_config {
 	unsigned int vsync_start;
 	unsigned int vsync_end;
 	unsigned int vsize;
+	unsigned int fps;
 };
 
 struct xvtc_device *xvtc_of_get(struct device_node *np);
-- 
2.34.1

