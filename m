Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA6F41229C;
	Fri, 21 Aug 2026 06:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294313; cv=fail; b=FUo3/dqVFg9UO+KG+kBZvdcCvO/reogW3r1h3jfYnHq3G56w31lieI+ncyuKZ8R1ATM9+ZOf4j2+sF1ikCJ0D+2hsyLoJ4EtD7Ab4H9BTJm9vu4UVVOGNy4Jb/anVO796mfKtt6RNO/i9VYjVR0eXozva/1fjkUTzPlouSWTc+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294313; c=relaxed/simple;
	bh=PMlsz+45x7c4FOiRVJ5qlPlnCt1+59ZGrZfdSArAqS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iIv2ue3fsBFems5NeXKxw8PziGQ/uxD0nMmhpig5272QZX8hSnS9zP4V767Dja4wUfXN64Im033be8lZ+0XO+IBWo1vq4hUdxq6ggmvokC/NBYxEP4q4Ag2w9jTAbo8bg4pGKXGYXQyTSSr55vqveou+eIiWkTBTfUxA6/bZnvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=hNJ4R+Pw; arc=fail smtp.client-ip=40.107.159.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="hNJ4R+Pw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5CzXCfAxAlRyCbjZYjmP4fjuIHoDI1KggNxq9Ems60B2UAceNJUrvlBea4oouAIBmHX2pdcQVP72cKyc59J+CuxR2YZass7ILDRpznPCxUxQ84yUm0LEbVs/UrQpCEIIgnf4/N2Pg0ZNXYE/kz/mcsCZHKTOvqk/FXYMVwEWsh2h6oi2q+h4vydfesV1zAQq7Gs6JTzY+DLoSJSfqIabyVEQbGC3n8CEE02bdOBEr2ljN37urwR2XW3+GyYHbtSNLIXKZyjneiCBSvGpO1T6iZ9VQar//lSgMsmpvGLHl1fFfftKwmtWVJL5h8PC4v6upo43Pj22SZQvVTj/bSNXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNwZyVWhOaibz0u4wfPel2IOX9zO0k3IwSQ+9S74W8A=;
 b=iT4ijNsyrMWWraUWII7GJTvo/VyA/77H86ipXEFEVUyJIcialIEzE3T49T58JLzGFICu0zL21a8W72gOcNz31QviRtJCj5aBWlmzALnCxMZ1gMrRANP6/hOxEOxRul0A/jTxCJ7EzGiMW3UnQkvcLi+6e3RKrGFk++KJyVSiHVCPUuBP6v1U8gB7qxRALiMTgmEwDLaLUNE84OSwv3rC+sj5GJXuxvYsWBKOuuWjTem5L7El1OuwOvXUWGv62bfcX7kvTCVec9YvOKcdvG615YEkCrqicP90hI1u1TJ2Je0JIIJ6m3lRRrXm1+SNm6iLne1adxMov+C2Y+M8P16UUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNwZyVWhOaibz0u4wfPel2IOX9zO0k3IwSQ+9S74W8A=;
 b=hNJ4R+PwXRoCSOUnVYTzgQC53UPmdhqEb94SvbEQpj5HvyuSp/x55teAukO4zk7dcDFOBR4ndOL4xeKhlQ4WxKAgDKlpdcaFYzVgwl2yMbKRehTU7+Q5EcEeGhwn8apOvCuEcvub/MDVw30NGKeK0EfDbHAfKOgA+Z2ZjFDVFiRFX+UKbfgc/6dS3WlUHEX61M9H8ObOckLBQdoezklzDD+PLe6tPRCuXuCYEHHB+APr1hjESB/yCxr4YruCFR6gCEsLf1EoZ0PeGR4jDZdz7v2Ps5QSFQIYb9KdP6BpgBxVwslZ4Ocr6c66i5ep362pWhp00ZuDh18iKmbd4ml4jw==
Received: from AS4P190CA0022.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::14)
 by DU0PR10MB6081.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 06:38:25 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::31) by AS4P190CA0022.outlook.office365.com
 (2603:10a6:20b:5d0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 06:38:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 06:38:25 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:43:23 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:38:23 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 21 Aug 2026 08:38:04 +0200
Subject: [PATCH v5 02/14] media: stm32: dcmipp: make dcmipp_state & cmsr2
 read common
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-stm32-dcmipp-pixel-pipes-support-v5-2-d140efb61d72@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000044:EE_|DU0PR10MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 77df84d3-ca32-46ee-3b36-08deff4ecd66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Wk3jAi7nB6RmQHycWwiBmec28NY+ijyQ+ARiifvQ5cDvLfIpbTXhpkfiPoC3kxGm/2dU+YM5uMK/J2FQF88jnM+kxj4WbT+YmENV/IhdGWgFb6YQ8QFfS5djpXmIgseV66c7VCIVHTvWhY7VttSn258tyCHUZf+r2GOIMFzPoaAXcjMab4BsXGpi+bXPRV7gke2kxA4Nom/VfaboMhEiG54R1ZQ8pn+r85MDtqAHHwjeRJLhfnG2EQ/zCnF14ODwuo8x/WGG4KRqV2yQ3WDYpRkOqR18ajCWjXoK8LT3TjosU59oSTP5QaQ5mRCxqkEq+36sLuVv4x+2/KIjWn3Kks4guSTFPQeh0OtXD+zcCvAB9r9v1bmgIuxQV2KJBTyl4oQYpWOhCEXuYdE1xXIhY92FY7A2pdLHxlMI2XxeoxpOwpRdwMFCOEymj/CZ1hZrTdqOyhrY6Gp8UUiTNfJInBL9uFAbCk/0ASROCpzrZ0CGV15Y+REcBU9LGEUCVA1+tbBnQhfR1o3ZkyNlP+f+5r3yd/r8rC+GykhtB5Z9PWWgitVdPSC7SOF8vN52kPV/0dtzzWoOFc3JfNnoxoXbbp2s6ZoYU3X7c0FRSXZeStLN82kHkG6vv6j4dpiJ0G32O9lDxODFmWOzU1omU9IVi1E/SkfoqBf9cbhjn4ONTRo++0zjbV4JGAltgPqhHVDkMhfQvGjXvVsy8oTeY/f/NA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tAUrHQHdJPjJN9L+O++x6uFXx2fOmai3bl97i32cfdboOLwWaZGP4ZSA8DdlXgSHdX+0CPSoNDWu9et52fDo1hutnPWZ4gcyk90eRW3F64epedM0uwX2voGQOU7MSC5y/axh5qnstJbm3fqP6HYsfh7Du2WYJbPqQxtSgqDrO+qHkUfHCoGhMurFuSeGyU4Yk83yuvDUODBkH+mfg+tmV+5qRiXaNwTrFQTinjwe+T6tcDyfPW1RYo62udqMht3pTll2/QJX8O7Qg5zz04KTm34+lXcya6o2CupB61vSkzrWF9lwoSoRreKGMIV6qs8zMCHmF9g2yvnRkJ82hRHow1zWbpujiURfvzeNZ6fyXfnUBmWvl1wFQuElbQ3XiV6xbRIoghLQeTi9WeWeFHEHrt10V3mzqU3Fg/eNbPuK1JUAz4tKejJiTeXOHLTZbO04
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 06:38:25.0951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77df84d3-ca32-46ee-3b36-08deff4ecd66
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6081

In preparation of the introduction of the pixel pipes capture devices,
move struct dcmipp_state into common header and perform
interrupt status register CMSR2 into the core interrupt handler and
share the value with each subdevs.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 11 ++++-------
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h  |  8 ++++++++
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c    |  7 +++++++
 3 files changed, 19 insertions(+), 7 deletions(-)

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
index e5c0eda8b18af..adcd16664cf5d 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -94,6 +94,7 @@ struct dcmipp_device {
  * @handler:		irq handler dedicated to the subdev
  * @handler_ret:	value returned by the irq handler
  * @thread_fn:		threaded irq handler
+ * @cmsr2:		dcmipp status reg value captured upon an interrupt
  *
  * The DCMIPP provides a single IRQ line and a IRQ status registers for all
  * subdevs, hence once the main irq handler (registered at probe time) is
@@ -119,6 +120,13 @@ struct dcmipp_ent_device {
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

