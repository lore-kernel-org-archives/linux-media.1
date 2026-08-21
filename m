Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013025.outbound.protection.outlook.com [52.101.72.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA0D415B66;
	Fri, 21 Aug 2026 06:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294315; cv=fail; b=kEjVbjw2r8x4YCdzadAcRLyadNUtABrCcQchpSXtRPjjvod3G0h0FT1OUEheHdqApOyUNFFw0RK929ieddpFkNGhITtTD7wgVGsL/oNTWLnbMnoNOC2vlDupf0TiGoNOG8vej87LajM2I73uIrT1POJ329j51NwXyXHAS3K0uVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294315; c=relaxed/simple;
	bh=G3UEG61iXLFvb777s+ENygOwwK+wdD5VfeQaPWn9Qqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=myANh3GxzpFegbiKtU05iUGopvOUt8LnQjUUoU0z/yWzTgnBmZcqPnNibIxh+Cl2bKA8mCTBYWyOHr5M7Gzfs7q4dBl29n48t0I3AFxLBArwGmhgyMnhzkK5N31UexfegZfxrL12oqD3/88urRW1MDUObERXM2znyfKBcYjjJbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=PGpcGtvJ; arc=fail smtp.client-ip=52.101.72.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="PGpcGtvJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPYglYf4aHzdt5H+An3JiwSVjnKr23R/IWZZ++sBJ00CC+eFfPD6uD9tXJxs6TmFTKKGW9m60/ht3No/ci1timBhiZry0RZhXF9d08A7ZXhL21jZn1NSpxLg0kYNZV7HAiV5s4gwDpkueHuRsbjH08o0095UQfwI8MtpHmJRCjAmdRqAXfoDdiQJUm91r2Kf0vbPa6XLhquNqGfoG8PKswBpfdAQDvzcQsoIYc8ToObUrfQOco6p1GiFpEqvNlRyvTmYJD/1oI2rZSQaDRcsR8/zFZUn2UBSi8m2vxfC12FS2GagU2OWCWzpC/r+3qWuINk9/cV+cLkfVGwU9LQ76g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmfomjlf/mYSqU4Cx7H/3V1HW6lQZIMcbi2OlYO8BHk=;
 b=MEBgakA8AtrHIirg0XcYdzKkBGbjZF2XaoLn4r6sDte8NAZHyqPQdCwEp/i3VIEZ0XSNkm0k+IcMca58jI+/JB8BGLLZWQyXLIcrn7VTWUVemRDRUyQ7vpPcwTauktCcsMWoxgs4EgsIvLXZGWyP1TS31cZ6GMpy/7oHlhlSRJXmUAW39NwOvaXrhBuWwb4sHSww5leSaoP7WilgIKxkxdX9zjmRYqYjOzqzhClQhpdkoXq2BmwTzdnnWNxl5AMypCRcbwdjPOzZljLiMAuq4WRbvnmSu+byVvYSfXbT5PyZzQ2s488yUO7X750s0D4XHE32pZjIo1O+UY3JeBfWiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmfomjlf/mYSqU4Cx7H/3V1HW6lQZIMcbi2OlYO8BHk=;
 b=PGpcGtvJKhcWwyHYNTrFg/E+LYq8avfRtiGao8qINxADk+FF5wftwfo4FSuxosOEsLYSm0srHXNsjjZn9KJQVClAvkwitBlWZj1T0l7OaIa4Wqus/LlVtO/1wq7oWtqujTG7K0LsVO6mZ8RUWRbVWsi0DkdTxTurzCf1PZIWWfhgz3VF+udyJj5I7Ez+35A5PRic16WkaGxpco6iYFRN314lS0VmuNubvSsnXG6gDh0K4ZapGlmN4IEdxhXIEMCfYbRX8PjoEdzn3PvlFUmn+HjZfG7xI9V6NNFqGPb8AnPd1xdieFTWtxN2T/tzXoXKn3C0M7+0ens6HiY1W9mrfw==
Received: from PR1P264CA0070.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cc::10)
 by DB8PR10MB3209.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:115::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 06:38:25 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:2cc:cafe::3b) by PR1P264CA0070.outlook.office365.com
 (2603:10a6:102:2cc::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 06:38:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Fri, 21 Aug 2026 06:38:25 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:44:00 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:38:24 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 21 Aug 2026 08:38:06 +0200
Subject: [PATCH v5 04/14] media: stm32: dcmipp: move common structures in
 dcmipp-common.h
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-stm32-dcmipp-pixel-pipes-support-v5-4-d140efb61d72@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|DB8PR10MB3209:EE_
X-MS-Office365-Filtering-Correlation-Id: bb266963-1c35-475b-6886-08deff4ecd85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	TKosuVceWm9+/awPpP4LQQY7YjnFbYPOtHCFrsGKKJk4UNMEMpxgJFSW7+Hrh4eOUJaRNM5STgMA1E7wyF3QpnsjV/pwdGx9u0iFDYXKUwOwEtBh7SNSTvh36ZR0ZMrtVJvwyGdd18n+F5pqV3Xm7tD/PANYk6o7s5G/3NZDCcomefbmmN/Mr4zK0zy74K19jdJ11LAk+JuO7U4vUIAtSlKggrBLsA6L8jg3i7kTmcCdAAircNTz6Ksbq1Y+sm3BXpeHdDA68UTSrRBtQJUr1f36LG/iDbJ7D4wfo4y37k7ac8BkgUkly9ghQz0JCUG6k1mmZIY+xIyZL8WAmSPrpMRHPZ05/M4aZbyQJzA0dC/zKmNXnwO7imOyPiy+rl5XUQ4oRg04WhjuMK783TityOD6Xq6J1Mjmy4ZbkpQV08r6JTLz45P7kCeGSxdiKfsw1Olg+2BVam2fcLUl3cktMLuflertfujrhHo6arSTUczaWCvaeLJGEAr/vNDar3Mni9zpeZCkEx9AaHhkUhW6kC7wmP7XUjWhaZo/d1j1qtQ3Yp/GCaDAQrsre7McydiDMLaTbPFzldL9LvBlYbgGQBwxwiEOa0Kg3QUMZ+Mlk0fJK8yJmZNjp0ahjaB8hzpF8zXFsxK0SG8bLG+JFW6+4mOwkHQCG8hrmYV+VeMgeBAd9a1o/HLvVd2pg4vUrx60PeF4B+oPm9nPLYXl1rzlew==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FXNHSUQkBpaR19XpOhnvGlcEgC9nRryLZydMYaP76uJxFZkbezbT71Vphv0UTX0dPimn8d9t1dnGaGo5rFch1QR2+oScEoYCKOZi1c3/3z8S0gszVsR0RSzct+5Xt/91WiJl2z2/duL6p98f/aIfJHRlPvC1wjag2A9qjbBFaNY6CMlxdMZmV9jv02dSBMtWnQfHiRyyqztJLJwGB8wjZ6r8gDnBY1Jhqw2Nq2hjF8ipYwjdSMBWaa/3tUWWnOJt4450FV8fU+g8qxcZYM/eMkqRatzJvNKa3b837HSkGV6NBlF0VHy8R9zzcw34r/VpX6Td8efE14IUcrEkxAWXG1cCxe3pwCxI9YjYWSJemlrZQMm67BVYAQTJvbHmZLREQxP3uKdPwX5SfMYCP1RFgkEUfuN6DneVXF5M2kD+JdygD7fB/HYKuE1z/oxeUTOI
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 06:38:25.2894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb266963-1c35-475b-6886-08deff4ecd85
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3209

Move the structure dcmipp_pipeline_config into dcmipp-common.h
so that all subdeves can have access to the information of
capabilities.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h | 37 ++++++++++++++++++++++
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 37 ----------------------
 2 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index adcd16664cf5d..b94a9c87f56e2 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -83,6 +83,43 @@ struct dcmipp_device {
 	struct v4l2_async_notifier	notifier;
 };
 
+#define DCMIPP_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {	\
+	.src_ent = src,						\
+	.src_pad = srcpad,					\
+	.sink_ent = sink,					\
+	.sink_pad = sinkpad,					\
+	.flags = link_flags,					\
+}
+
+/* Structure which describes individual configuration for each entity */
+struct dcmipp_ent_config {
+	const char *name;
+	struct dcmipp_ent_device *(*init)
+		(const char *entity_name,
+		 struct dcmipp_device *dcmipp);
+	void (*release)(struct dcmipp_ent_device *ved);
+};
+
+/* Structure which describes links between entities */
+struct dcmipp_ent_link {
+	unsigned int src_ent;
+	u16 src_pad;
+	unsigned int sink_ent;
+	u16 sink_pad;
+	u32 flags;
+};
+
+/* Structure which describes the whole topology */
+struct dcmipp_pipeline_config {
+	const struct dcmipp_ent_config *ents;
+	size_t num_ents;
+	const struct dcmipp_ent_link *links;
+	size_t num_links;
+	u32 hw_revision;
+	bool has_csi2;
+	bool needs_mclk;
+};
+
 /**
  * struct dcmipp_ent_device - core struct that represents a node in the topology
  *
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index b06a4931ae951..3a0a4df410d8a 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -25,14 +25,6 @@
 
 #define DCMIPP_MDEV_MODEL_NAME "DCMIPP MDEV"
 
-#define DCMIPP_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {	\
-	.src_ent = src,						\
-	.src_pad = srcpad,					\
-	.sink_ent = sink,					\
-	.sink_pad = sinkpad,					\
-	.flags = link_flags,					\
-}
-
 #define DCMIPP_CMSR2	0x3f8
 
 static inline struct dcmipp_device *
@@ -41,35 +33,6 @@ notifier_to_dcmipp(struct v4l2_async_notifier *n)
 	return container_of(n, struct dcmipp_device, notifier);
 }
 
-/* Structure which describes individual configuration for each entity */
-struct dcmipp_ent_config {
-	const char *name;
-	struct dcmipp_ent_device *(*init)
-		(const char *entity_name,
-		 struct dcmipp_device *dcmipp);
-	void (*release)(struct dcmipp_ent_device *ved);
-};
-
-/* Structure which describes links between entities */
-struct dcmipp_ent_link {
-	unsigned int src_ent;
-	u16 src_pad;
-	unsigned int sink_ent;
-	u16 sink_pad;
-	u32 flags;
-};
-
-/* Structure which describes the whole topology */
-struct dcmipp_pipeline_config {
-	const struct dcmipp_ent_config *ents;
-	size_t num_ents;
-	const struct dcmipp_ent_link *links;
-	size_t num_links;
-	u32 hw_revision;
-	bool has_csi2;
-	bool needs_mclk;
-};
-
 /* --------------------------------------------------------------------------
  * Topology Configuration
  */

-- 
2.34.1

