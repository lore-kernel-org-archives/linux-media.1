Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D93F314D35;
	Thu, 20 Aug 2026 07:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210595; cv=fail; b=LBiv7ab7cwW/epVKZGedzXmPEPtw0ltzb9+G3UsQqbyPH4x66guGtGUkMKET+/pFnvLgfJBAk+Qxrl5o7K9oLE0i9b+tFE4uFGypodMysGukenBZwSkHySwOvaK2cKpPqML6Ucmy47PXjWraC5vZkqOVnj0yhDBPPu60o2dfpZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210595; c=relaxed/simple;
	bh=wNg59tFrGCE/R30qW6K1jZWzguqyXlaLv7Xwvx3KCYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VfPR4i9VgHAInfe1CcyzwnUSTZ7yWz9oLFa03SDWu9gwFX7qMWpbuwPuAX20a4qk+ujV1j3505VZQYK04HfHZuo6cYuHFuTRfconpF/JrXrko1EAfW/EOo9voGIJPrtEwBm671f2MSPSc18/1D19eXyoR7C68ChrF3FCCv5xYDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=cnbBx4ay; arc=fail smtp.client-ip=52.101.70.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="cnbBx4ay"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ke1aQxHh4OBtK8fk5HQkc97VUHj60dIDdrIse1FcsjRShFMUqVYrWDA5XS2g8ZPrq+e/75URel+bPuN/J/nIDPI3KQRxkjSTL1iXCwAn4zP7PCiIIeutCBr2c8frJglHsq7oNh24ZY48x7TcVJJT5tFo6wF/iDbYQLSP+FTaUAIp2XZL20e74RBJTTcDcRDjAKx+QCEWc3UeudZQEKGdvz1XeSCZrC8q1JbkPA7nUrI0TtKD+ocDuwqkJtpAszfb36aYBS40ie04uK62fjiTuazHI+tdcVLe/J4T+Twtd+Nej3UzmEz/Msy/qXs3euUlzuhfyDJUUepUJOxEsac8pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UoINnPYsF+FQnikn9lxVCj9hZ1VakoybLuuTST3zWdg=;
 b=lpZ4OXepQ98mHhRTu9dDSeDAaAIXNUQ6+YmZHPCvRjZSZ8gpiUkD/N0QBzuj0UYidJB2cScuCAmNVlyrBMkMQL2eRhVGKKiXuRR1VM/qLkDpbT/YWvAh3xm5DadiskZv5OXysrMOnzwCb5PG7cMYnxHbxY8Fz+IoZe0inAbk/xhe8CZ0BfADC4y9MeZbceS9a3snZS1IFzGgyuxkzewok/pYma5SryVu3RFPHU803NgS2DBfc2S7yDAoK6lKJkcjP8qZ9MAfOTbqQqKXU00U6FKBTPiUYLXS0ZDyUOrJVgG95j5+sTm4VeM+kvdfJmVwIJcJz9UG488oHXdXHZSxuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UoINnPYsF+FQnikn9lxVCj9hZ1VakoybLuuTST3zWdg=;
 b=cnbBx4ayV02gVcbiOORLd5b+cPHJ6sV+g7HnY6GLp2d2xyVNpL1stHlRilg/9uDTQKQEdfurARYsgVYneLNwlAyBkzYv6jvRH7EXaEld/DJIWEuOmkuN+TPeFsCai5IznZ3+TKkcIkVtWfTBMUjl50/m0MAGnTn3bb66lo8P8qYeWLNpvcEfJxib/ABecnuOTmA+ACWGWhuo4Pp4tFAjnBqcpNfCUYbZ38yFsjbRLdGNstDhVD69Kure1qGnbpiLaSMUSnRckXWjtf7QYW4UVxDZLXTwdt57twqwKxZ3bbwZcWos5CnEuDsLyvLYAVUym2ZjAEYNzMWI+9bJDB0nzg==
Received: from AM0PR10CA0040.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::20)
 by GV1PR10MB8386.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 07:23:10 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:150:cafe::47) by AM0PR10CA0040.outlook.office365.com
 (2603:10a6:20b:150::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 07:23:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 07:23:10 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:28:09 +0200
Received: from localhost (10.252.29.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:23:09 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 20 Aug 2026 09:22:30 +0200
Subject: [PATCH v4 02/14] media: stm32: dcmipp: make dcmipp_state & cmsr2
 read common
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-stm32-dcmipp-pixel-pipes-support-v4-2-d212eb4e3792@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|GV1PR10MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba42f9f-53f1-457e-fa49-08defe8be359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	lmS94Qt77L2tLCN04pIaYgfUFK39+sAabtggYZEp+BpoG4Dg1WiYPB5SNNvr999h9UjOpG2+cQYcUWr2TIK/va/QMXVkDpqpwWDtdSF9h3+QX1i+5pAGnPqkUAxzuPm3s8KNpCpTnUmIZVm4NWzlON7GHvZCfQRcT/dPTMD+T+CMVqdl2XNyjJCERQoGDz3aWt+jWKk8zLwafYFgdhUgUp4JcTum9CiZy6cMVHYCb+HpU50BkgGlZqCOvVvGtJwXvdjPUVRNXDK3gcELYOXABUm3j0vCg3sE5dvB4Cf/3UBwcN75NKDOfgwiSIBctynWtjO20UfxJx6eYDBr9UxT7iE37kWNPGX9tw6zgTHx8IvwhCc4MngVGZoKVhFHZThdGJISxnPIgKS6O3slQba3e0mhqVhqgA91IItrQidfz4ngr6U93s9LUUIMRa/XGi97TQKkT0S8ho1Yeo70Z+4XrlamrrlTnMB8barGz3ec5tAhBqHls20RzdoRFY157SW8JING8AhihSVw69/Sk8n0/Qrm/O6Kyy80r3rcVnMZb72j4hQ/MzNeuNeNLZnV2ERaZx/h+FXDcim5IgDYVBzGtGfi/f/O3m6GC4bh4QW7h07bt/rWqFWLWVTnNd38o4vl4Zv4X2hC9cjrrhZ1+TRQ5kSks7hXp7RYD4mbU25VQoH6v12soq4HGJd343tBCt1nHWGO1TBSI/YWBWTS5ddzsw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/DnBEA0H7xC8dLnlHD+yRFspg9rY6z68TSMHWOVn6Cv+GnMe7oeXQjtK9MVfwXuzata24bngD9BJVbxEull1qoYjFrFRAfdx6RdaYndewsn+LMCi3au2Bp7MT6v7inAat+OiCJf8/eBgnuo/7/OdZLGmdF0N9YFwLQ8FmjEd+AzmjeZgL5yhQoy1k92cy2VoWleU/+XKHv78syrRButXrPP0xaX5QL8v6YpXfoDqOWWui/9XhvSPe158XJmXjGpAvskTfC2GV7alP0s8mpBtorc0QI8L0+yBe1bJn6WLU1g53DXNB5Alu5etFtw66wmXtUn0uY6rvjevL87rySbXMJTY6zWAhOUtJCieJwRxasmTAsB6s1VeYf4MMIS88lO/Ibs2BeC1DCDibLgRS01vpEnZ8do60v8Lptx3O3ucqkA/Uo30CiCS0GYHXevq3NfT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:23:10.0550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba42f9f-53f1-457e-fa49-08defe8be359
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8386

In preparation of the introduction of the pixel pipes capture devices,
move struct dcmipp_state into common header and perform
interrupt status register CMSR2 into the core interrupt handler and
share the value with each subdevs.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 11 ++++-------
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h  |  7 +++++++
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c    |  7 +++++++
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 483af0f39f0d9..0e789bbd1198b 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -110,12 +110,6 @@ struct dcmipp_buf {
 	struct list_head	list;
 };
 
-enum dcmipp_state {
-	DCMIPP_STOPPED = 0,
-	DCMIPP_WAIT_FOR_BUFFER,
-	DCMIPP_RUNNING,
-};
-
 struct dcmipp_bytecap_device {
 	struct dcmipp_ent_device ved;
 	struct video_device vdev;
@@ -799,9 +793,12 @@ static irqreturn_t dcmipp_bytecap_irq_callback(int irq, void *arg)
 {
 	struct dcmipp_bytecap_device *vcap =
 			container_of(arg, struct dcmipp_bytecap_device, ved);
+	struct dcmipp_ent_device *ved = arg;
 
 	/* Store interrupt status register */
-	vcap->cmsr2 = reg_read(vcap, DCMIPP_CMSR2) & DCMIPP_CMIER_P0ALL;
+	vcap->cmsr2 = ved->cmsr2 & DCMIPP_CMIER_P0ALL;
+	if (!vcap->cmsr2)
+		return IRQ_HANDLED;
 	vcap->count.it++;
 
 	/* Clear interrupt */
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index e5c0eda8b18af..3c3996472e03e 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -119,6 +119,13 @@ struct dcmipp_ent_device {
 	irq_handler_t handler;
 	irqreturn_t handler_ret;
 	irq_handler_t thread_fn;
+	u32 cmsr2;
+};
+
+enum dcmipp_state {
+	DCMIPP_STOPPED = 0,
+	DCMIPP_WAIT_FOR_BUFFER,
+	DCMIPP_RUNNING,
 };
 
 /**
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index dd784cfcaac82..b06a4931ae951 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -33,6 +33,8 @@
 	.flags = link_flags,					\
 }
 
+#define DCMIPP_CMSR2	0x3f8
+
 static inline struct dcmipp_device *
 notifier_to_dcmipp(struct v4l2_async_notifier *n)
 {
@@ -251,10 +253,15 @@ static irqreturn_t dcmipp_irq_callback(int irq, void *arg)
 	struct dcmipp_ent_device *ved;
 	irqreturn_t ret = IRQ_HANDLED;
 	unsigned int i;
+	u32 cmsr2;
+
+	/* Centralized read of CMSR2 */
+	cmsr2 = reg_read(dcmipp, DCMIPP_CMSR2);
 
 	/* Call irq handler of each entities of pipeline */
 	for (i = 0; i < dcmipp->pipe_cfg->num_ents; i++) {
 		ved = dcmipp->entity[i];
+		ved->cmsr2 = cmsr2;
 		if (ved->handler)
 			ved->handler_ret = ved->handler(irq, ved);
 		else if (ved->thread_fn)

-- 
2.34.1

