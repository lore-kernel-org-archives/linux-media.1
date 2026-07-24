Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011004.outbound.protection.outlook.com [52.101.65.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5751F448B82;
	Fri, 24 Jul 2026 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909667; cv=fail; b=Glkhik0b5euC1TVgs0WMwj19dGhgOqtvCwvMD0bsTHpV9QUUz/fKc3S6//KJQKQ7tDKEaN4/XD+Y2rlRIsp9Ywy/pcPSsOzIvtnv6JC4tIzqWz1a1z4KzfgB+MjNhBBaYYJmclQPgxQirokcUfEFeR1jgNmj5f1x+8wOa5sVC5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909667; c=relaxed/simple;
	bh=wNg59tFrGCE/R30qW6K1jZWzguqyXlaLv7Xwvx3KCYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AJl0rdv5hhLymE1hrzlqO6WesbEl4whvdB5MAJ5cxDXIpWaQ+PTFY7GHdZTQSraclc1O5jNKOoLo6+U3WshrW1aXqGJmzFKoU5b47vzSwydcuEooUZchX9HwiHsruatIJgyBnTVD66jDsoascAUAxKeBrTfGcxm8IQ45680YR4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=PDgTiGKa; arc=fail smtp.client-ip=52.101.65.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="PDgTiGKa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=El2omv9vShE2IeUcal8QWVmcXViUylG4WLGqI6ZUXbYHowfe8kjPeB5LN2bLJg6IIRxqonFOlzvRA8O97R82eeHDFgQr76yM4N1OVsJmsYDCcwoubaDYEMK+RhmSTE42BfOYNU877VkGgBWQdLvWV2qaDpUIzCRiXGkg3hB93zx6+RBPpxgS/UJUg0pJGNUaSi3FBSi/NGGyKzBArhSLYqzu2iNl/T9RHL7z/xve9bai1ZYC6Foivwc9npESafWHjAbYSkwEixUO92kqjaOSB6EMi8pnpknDEXPRXD1mlYuj+aHuOY20c5gUoh64pb7fhDvvnrScGAQsfNxTMRMXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UoINnPYsF+FQnikn9lxVCj9hZ1VakoybLuuTST3zWdg=;
 b=h6p9Bo+haehA/WdL5DXyUppeU/6FijPkeIgNeyErr+dKHg7HwU8t+X1/iv5h91LF5z6fA3ivodxsYBUL4Vjm1i7Eu4W5+CC28I7QnmMt3W0RR5sCmXnGvNNGbHo2Lx2tpCmW5gu5tdgEt3G6s+J7tOhzZ9oLUEKqEqWQn3hh00ODiuHrGMGW1/C0qnTV8j7HpGdA6dCVwGkrT0gQb7PmMAMwfgvCPruUmUpiqW7a8kyhnArW31OV24cPFIm1HxIzq+bvdGer0jJu6W/BGjBJVLq21QS3RhhZz5K6uw54RB029qsNu24MTREffiGVSYqemVvVF+XbH+RDkEM0cT2DKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UoINnPYsF+FQnikn9lxVCj9hZ1VakoybLuuTST3zWdg=;
 b=PDgTiGKaR9ImpFGd2IRPtgqvjU2RT+QjVJeTtotYgudsunMV90RXsyx3gRMGtnG8Wfv0/r/UxiQtbJKDxn8TtwHYYc249nC/fmAlPFzt6n5ELvZOL0S0v22/fFEZfE9jxubxnKXXQPufPQqS5RsKoDYGLEANNe8rOej3VKBzh3nELPyf/mEdkkBmQ20WWooa4Ot28hAoHfvVGHDZfKksxHOIN0Qxp9W39mATpzWj4E4Pj2C64dzhznbKLCx76E5ZeZEvGX4q1ALWl3QHrI+vR7Z0iAt5+8//t7ezEsZBYyqgIUR4ecvxJBtfTgQ4qmlUig2skb7j8wn7gRXhYyzf5Q==
Received: from DUZPR01CA0348.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::7) by AS5PR10MB8217.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:67d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 16:14:13 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::35) by DUZPR01CA0348.outlook.office365.com
 (2603:10a6:10:4b8::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 16:14:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 24 Jul 2026 16:14:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:19:27 +0200
Received: from localhost (10.252.22.128) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:14:12 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 24 Jul 2026 18:13:43 +0200
Subject: [PATCH v3 02/13] media: stm32: dcmipp: make dcmipp_state & cmsr2
 read common
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260724-stm32-dcmipp-pixel-pipes-support-v3-2-f77fe7e723d9@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|AS5PR10MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f3c5172-fa9f-488d-2376-08dee99e9a49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	j0VtWRf3TLGBMe17/FPVy+cwtHXh4CaeEx2M6Hju2LuuM/f5alRRC9DNS8s3+7X7iy69ycH48IDlmPLZuEyO6ngsp5RAXBZG8SlSReUXjdjW6voEMv1s+QusdjNPRL+KkascFhzA//j17jE3tdeQDJTffSAk96KgPHj3Xt2xV888t20OHTNuJwx4Gj0sMslOM/bwO25tg6n5kbxPRCbvtCgODb7dMvjuOsDqyWOQfXwlaCY1Ypl8DgHGdorBgJJIU2x+EQWLBtR4gl8JkiEFZQp4JbZcxWWRUvYUOsucogQEQrYC0LvqLUBGHJQkOjiHtMNNTUSkmZmtMV6CvQmffaeHC7eOoeYjfBnv4BZz37L6y/onKGQhiY5TMl7hJjOThmuHV1Bk5SbMjbngaJEq6a1Lj8F3vPBv1z/4AfRsxWnW+WYuebIudqcQ3p5CCAAg0GtLHAkr1EdlQQf+T1jxVDAM/lyce9lkaGnkHVHPS5Rl6JYbaAcnrlCeowLuB0ta+nSsmDgOhKSFlaTAovMP+BeG2jDeNOO6sDtjLhzsJuNDsQPNLLAo1M/8xnxrFgVHGgsS2LJ/A8lQ1BcKCN86NHJftZ97HxV5VlbGnAMR8upAQzIqq+sqrwOgL/tSrgyM9Xy0lAeUGDt0fZGXNPPLJjSBsDcyXbE/xySElstB7eaAyHnvrjg7ywTdgs2OWORakrpnYhwae9XfEiGQ/TM+mw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oBblcnHvTX/JY54jm8OBtRigYOD46N4p0PNP2CFzEkPuelulTRCqzHaskaGMDymHM8t17KjLjQ0XYdwcdavuaSv8ZZQN2EhwLH9z4oMpsEgxuMA8R/SBLd/OeJKQLDG/7CrQsMK+wuiinOZPrlWKBHEP3A0EgXuyveXx2Ys+393kff9MioufeMexHQ/bEaspzXstvWwGIMWsJNlKFEFpUYrGy7y2OMw/Jik7UR+NW43PPK/gBlgUq6JCOVHQn+/phQxEcXxnw5hR57U3cspdgljfByQbfWjTFJ2llHhZYKKPcKwZPLmixbrqTi2eBjN+FaP317RysieDvYhuwhqBgiAKFyIat7RnLyddRi1ieWvZyhrlHXKohyIaZVL8LL4GSyZclWC0CEL4qqecayxBcfpVtVMz7eFoUp3WrBbvI57+VkQh98IawPRwOoLbUSPU
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 16:14:13.4576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3c5172-fa9f-488d-2376-08dee99e9a49
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8217

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

