Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013067.outbound.protection.outlook.com [40.107.162.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606DC445AD0;
	Fri, 24 Jul 2026 16:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909696; cv=fail; b=vCjPpkGivTlJY5RRicGPYE30Dvsj6k79jrEdDwWfswq9+nxzvOyvv8ro5wTayJOfpz0RxAKtiWzWii7lIoK/RW7p2ZVYKB5mj9Wa01Qzh3n/fP5qbmGp3xNwXT26KqA0iC7pEp4/1uBcigsCzgCtBPo/8JOlhed06ViZA+vB524=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909696; c=relaxed/simple;
	bh=m8Blg47mHPflpkeRVFuegeVIkWqR52pV9UcoCxwE0vY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YeA5dhmKQj8QFG3SWp+dbXeHbbxfTIPnTWycZDcRWVxhd23hqzpX7nCnHgsClQOeJ8PWw35VRzJFpgPLmBBV9UnnsrwR6RfSyOtFJB2DncJpo6BonAoVA/Qv6RkBXIFAQTjyAx0jeCyEMKd7+OcqGHPeU34RKVByeV2x8+F3DKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=MmTd4L8o; arc=fail smtp.client-ip=40.107.162.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="MmTd4L8o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHP6YO+ISBteV9JPv+4gSCbLkZoR9HvNnZvdA1fu0MRYbdmz8biIyMFEZQJ7E9k6jZYWoxsFCtWk804UuqtO6vNDWDX1SkO3Z8Latb8ReHGaNSTYAC4zaRawCCBLUrjIupMEUbrjTT4PaIaGbaWuSs3VmkcVcFOj2DMRd+/6zBoj+XQ6AoPVWfCrGlhFd8Q0fBXwOjncOJ5jrW6nZxqZAvjSTwvd7Fe89VwTWCrJ1fP+ALU2hD5Goj40cMjBPzOtBhk8gwkSDIOxk7s/9UQppnOKjvjWmpPB+/1hpYlWDcauz6AHeHKmNxsadgb78hwfDucbqn4liT2nMTtNOSiW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LmeL+982op9zwQyxXV55mQNr+0edg3c1bJHq9H/hoY=;
 b=vNCjAFFDGBUD3X99z0Pd33KHnOwZLYCLpl44JQDfpi7dTcr6e7rFaei+AO6TfnUuWK7dpF3OFfYMEI/p1FqF/tfLjGx8MtzsLOepa/384qmMaq2UtqH4+YliE6JraRHZltmf7qO0Yk5wJaSnSVZm0yPCKMJKS4Vkv06yYoRWc2LFcWW9goKTpHanXStn5wXp0rqOIFf9S2bunFOVOouWQODl18j+N+EK9pLyfdKXViNcEfL1Th10jhV7YZDKk6gM9MAxLUEO/jeXHMpe3/GBjqsiZ0ENaST0hMYaPeTZn0RXITDc1LvZW5JZQ0nWmsAIDKfCTdzBqihLqyCX9/CJsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LmeL+982op9zwQyxXV55mQNr+0edg3c1bJHq9H/hoY=;
 b=MmTd4L8ocx1RBmnZJ61pAPQOkjcCnkweX6KxYtNKmF8ZEQSoLWyqWMbNcaeiLg1dlZZ6FSmeQYmvF0En1v/HtakShNdczF54TiTp11+KwzFlNUX+uZnVYCtoJ+B7E08WtwoKarJbt7xKW5E6fq4Eavtb9Uxtj7suQnkwjxn0GjK3s3uzddPgdwrmu7zJhn2ao0tlGaZbjj20AyJISg++/b6xxvgF2Vb3Q6D4Y3u1enGeRHScg0Xvl1srxalF92xhiD0Ing97VuN3oVvB6ZlgcXeJNOk/exeQ10fHF6/uINrCss1l9GPp48HX7lZ24jssQpcj4tKtIigXtKUiaH1dQg==
Received: from DUZPR01CA0235.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::19) by DB9PR10MB6003.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:39e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 16:14:15 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::43) by DUZPR01CA0235.outlook.office365.com
 (2603:10a6:10:4b5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 16:14:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 24 Jul 2026 16:14:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:19:29 +0200
Received: from localhost (10.252.22.128) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:14:14 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 24 Jul 2026 18:13:45 +0200
Subject: [PATCH v3 04/13] media: stm32: dcmipp: move common structures in
 dcmipp-common.h
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260724-stm32-dcmipp-pixel-pipes-support-v3-4-f77fe7e723d9@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|DB9PR10MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: 860f278f-2ea0-4265-d9b0-08dee99e9b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|6133799003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	JwcEp+Gar3k8tztAGtGLjF+luVKgG4W8Lmt8LG1+ZY0VRGE755AhIKvUoEGmfC21RARCzsyJ9x4ui9Cx5/K9weAPVBJwtjluEVEVttnlGbEAKLx5BEOmtayQ3LykqE/OtrCjynlHJ+0FVJnDd+tuFBIzVlEyIqxzoYpH7nFw0959TO1/U0ORnTWQk3lQKyJ1fGjSK8BPfhfpNxU89Jxj+GftsUYGUFY/Q8mW2qSzMdLZGiuJi8YBLqZZZAquLruEr5yRegMBLDyoFKDKWYjZVSJ8h/AzgSbHyh8OTOvPdq3hlYC4tz8OQWX4ul3+KbzRNNps2wyAyn8yq5Lz0cSFF5RTI5Cd0I6PpaySpXVxM2HkCvNrp71Y+yLWJHe9zOwTBTNgdMP0/MlsBeoB2ZNXOhBQhi/MKqZUdTRJZGOFeKFUVOhEemYAaMReCFNfteHZWFe2Acwgm8SZ72ZACceJRRJzC1EY8PpX42i7vQj/xRDsD3vvpMZ9v/361SCFGqnL5DARziXTC3EwDE/N0LVbXtfS8vyhvt0tch6u7rVRfKaEAMV/RaKHPjI46Dy2eETXnL+CEHPx3OXJZN4di1hDkfVJEVxF1jaZ3zrVsIVxSGNXikYxCVEyTFnWRGDgl9woNO4y7z9N7E6JgDRhC8uW9U/QOUEOOk1HI8kuiMJ1ZvTtOb2RBirbtcpOPuzuZAikx0S/RdeHkh3WAksVA4A8FA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PN+w8e7drY56QFz/puYDTMQ08y4s+tAPyYauP/AVszUY+eSL6uCAfMiuSZrHAOIfWUBipW6jTSG/S57GAHNR01enRphdGdS0LuFxg90eVv+NhxxqkSQGGHOXJk1n6IjsfaN/8pD8YqhZ2wvpdCOVvgLMcqWePPw/12rB/RMDJQgIGLbBgeQ5te27uXS4IygD5pQrxEpWocSzlmxJHHFMFuzg+kHIUksTGI3n0ImS8k7ser1sA9Q2p7kHX3f8R+IxoUcOhWwjVQf29Bye0wjgTr4Z9FwdkyA1w2uM8czk7HG6ER5hTHWdZHdH/vpLFzKBulnTHdi2IJaSvoi6i272ytMht8vc8X/WT7wW6/nQFTqHoStDDwqa0tVZGSpwpea4oYodHQnnoTc8XWpvAo+gLNy+aBipCY8EIZFM5KFsPhzLR7FD0lg+KmSvAbOv+yDE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 16:14:15.4497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 860f278f-2ea0-4265-d9b0-08dee99e9b77
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6003

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

