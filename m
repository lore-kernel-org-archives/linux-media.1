Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012070.outbound.protection.outlook.com [52.101.66.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270AA3B9DA9;
	Thu, 20 Aug 2026 07:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210607; cv=fail; b=uqgWUEQ6uoJG+MiPID9qIJtk3uYGeqTrEJcz1czvKmU+X++7Uup3RhaF7W7RFT/s55zLHQK0XX0JgseIQ19CzCWUzsOdISL+0s2ITSk51V4Q4+LuOEnyr5ob60ogCnSp3wzwf6kNBTxaMGsMihpMoVyh+yx75eoHQuwycte7pcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210607; c=relaxed/simple;
	bh=m8Blg47mHPflpkeRVFuegeVIkWqR52pV9UcoCxwE0vY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eFvtbTBUZ7d85ECzEBj3nUUS0Ol0Xe9UTT9wKuum9yPxrYtJS/onaH0pi/5g+teHHR4C9DK+l17hdncc7To/7LM7HLO/yXBRLML5nGsZDgnsD8KgF0j6HBLBVCjlQylUZQXS78AlikGtJ9nCTN4Gpx5tcBduiZ0PwxNlD1OUHpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=GBOXnbpy; arc=fail smtp.client-ip=52.101.66.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="GBOXnbpy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZL7xW6HHgADfOQ7VM86HLUNA59/5TJ7lNTUhlOY4t3sOV9QTiTuaj6oAdO+dDE2gjfuEMdxzq1gC/NHjFUpHvXKFigpAxAc2GxzgLpx2TVsdU6EePIGEpUDKKlzBr6BpzjKGkjZ9JPZ5XpcFM4HyWoi88eAsA4T3QWQY/0K2eh8af46UxV/02xhMMaZCOE4yFBNe3UViX40NEcaO4i9TLrBbULeX/zbR+Bfnam8GXwLkbcfExPKY9Vit34XZhhSpyPZCOeFx3G3pdoKdxhtyyuO4/Dcl2XMSpSDx7JPmyfZVDrlw7gfybPxTydYnmy+UMaVTqN+5EIxbNySoODMQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LmeL+982op9zwQyxXV55mQNr+0edg3c1bJHq9H/hoY=;
 b=D49L/Wo2qEwP5HRA8FbYn4+kJizn9LbOESJXqp6Zl78pwzWYPWt7MPgpT93KSlRyt0BDh4JHVeV2dotusRw967BW6CtW0pj0U+4fHd3QCt0V0TEu15FoM7BRUsjmb0DQ1EP3YXHCblA2+tOwtkQ2uEFxNTAT7flfn6Ymqzl6NphUPxYxgEUXILogpXmslwqMujQKH4U6Qo3D1YgHliL3R8f/Aiw3IRc1sbenLbpLwn2hN6VxZouJ0hVwsF7Km85huxx4q8dM/y1h7Oy/PmoDLaUGZ6IkWBsNxFzZErYo2UYzkJhX9wE1HxBoPhDk25P0LCI2Xxbb99rf7j0tIkFhhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LmeL+982op9zwQyxXV55mQNr+0edg3c1bJHq9H/hoY=;
 b=GBOXnbpyWNOTTFe2zyUt3gS3bFzE88uEbNi3d/HV4haGsGts0/7xbFiM3gD7sCFu7nPxyyIPQGnfxd+IP8WDPI8WDel97Q6R6SELrRsRcf8j5Uhxp9s4NUvCxuxhR4u7upt7G6ODRCGygb0N4DE8nb+NrMoNUadL0RkAHYdGoVBFUWIyMZYGXnS7mBn/OkZTHGkiqrz2pLvO0a13I5yM9G1OJikbd9Y31H/iqMeLaJYkbDj066sPt+fdIxN9jm29NMueGHLijb8rfAUDWVw1CQcxxYghl3M6Qfn+feX11SJN4OEWZ2+3wrY+vV4A/w1V9enE8XxDrDbCUK9Bn2SvJQ==
Received: from AM0P309CA0008.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:28f::8)
 by GV2PR10MB6455.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Thu, 20 Aug
 2026 07:23:13 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:28f:cafe::7f) by AM0P309CA0008.outlook.office365.com
 (2603:10a6:20b:28f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3 via Frontend Transport; Thu, 20
 Aug 2026 07:23:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 07:23:11 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:28:11 +0200
Received: from localhost (10.252.29.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:23:11 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 20 Aug 2026 09:22:32 +0200
Subject: [PATCH v4 04/14] media: stm32: dcmipp: move common structures in
 dcmipp-common.h
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-stm32-dcmipp-pixel-pipes-support-v4-4-d212eb4e3792@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|GV2PR10MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: 94bc2f56-5ad7-4a54-54c7-08defe8be475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|56012099006|6133799003|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pyf6wOKFxkcWbBYmEuUKOGwEGc4bylQdXlrGi7nO1sPApbG+8tEY4vHfbHbAjukpcGXqWyk2VpKtJ6uGv+XRz+iFAOrmkRkSWz+rM89mf2r57mWdGcX4owp04PmLDYBRZcMyA9FoEL1pWylKNjepNJRLXntaknsWVPd1xmWzUg+tEmzhRVwHHpqxxOu04lBReyV5L6nis48m3VH3BUbtv6dhZGzubQQYHuP79MIsZ5Lh/djZ+rWcnwueAqX7r7KgSEQrKu0xdbMc1BHQAfivGotwjqxvS3HwBN9i+H0urBVDVO235ZI0dXa2pi87ut6tBQYNkbfi/G2BksouGckXx+IED7WnUnzG6qxNDpbBYoGYVn6O22SPU6VmM7NTMQKAhOLpKmnng4MiYw6sbe1QW8zofBi5+DjQ2Sgc9Wqqzmu6n/pIIJ5kueJaRn0n7Q6iQqU5ClOcFSmkivz2nrZoG1Sgnm/vtks9Z7u41PM6TwqPTSVtMpRY4AczzDmBVi97LIHYii1hrGT2Mk2t7mVG1TNJVb33T3GZouZ99qYo+uA2xLRiDJiUGPZil403i5U9s6/bG8VO+BxM7we2SSZc/hVGIgWMBfUFgi6Hzl25gz8teecG5m5HEjpZXBJW3R9vFAaH6nPEiqS5Ve76/dzSyL6IQAQ3OdjI27K3kdLmvWMKYPn3rQKru+6zYWlb2ZLwQDlv11iY+Mb2XzH79i6MDg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(56012099006)(6133799003)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lb19/tvnJV2jZuHKy5+5bHNgcoIvF7bHZnHiBX+Y62mkQvF60xvLBXSK+QIs77pRLIhaPEdCOqlFN/g+tLHAvIPj7XiLfaRHNSD5/LTTMAsyLURiJUDKFHGys4gLWbesm/mIVXjz2GUEDJEiwvIQHOEPWr+2747Yb4n2boX+tjHssd/azXLILgVvjVppEIX52fV2qw8Q6mt6Yc1vXWRd7hP+mzgNjUMEGwYTR3OKq9q6pytUL+i1YSxi4V4/FVShsQWvuv1fk6JJxeGHnprlxATajTqg9WCaXhaC/w4n17y5E6/PmBQcUlz84lgWIG16rfKXrq+VHE1A1A05FuJlchS0CMNu6FT+iNduFY60SUYjDrICJXCyiiD60+vqLKGtnAVyNt9YQG8SwpzcagSD2KXTApwIlJDizPU5TbAEuNwXBUImXF2RtXowv5YDpXRV
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:23:11.9117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94bc2f56-5ad7-4a54-54c7-08defe8be475
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6455

Move the structure dcmipp_pipeline_config into dcmipp-common.h
so that all subdeves can have access to the information of
capabilities.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h | 37 ++++++++++++++++++++++
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 37 ----------------------
 2 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index 3c3996472e03e..9e7b2434200a1 100644
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

