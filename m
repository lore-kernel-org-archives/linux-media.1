Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EF347013E;
	Tue, 21 Jul 2026 19:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784660521; cv=fail; b=b839Icjsxz3IOEkK8aJZyLa08L/eKws7gfwraJ5wY5XkCdAfl/6W+n6ka9DNIdYhCHlalXJrhVkLnp7MHIwStMW3zWsa3+uWvU5h4Qah44iVz+Y7sPbjkkD6CAZGQPCeJJnNkJs4gWuM+1DvcMBJDM40hoyakmaija6HITmEsMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784660521; c=relaxed/simple;
	bh=9UTA2Ovhtdu73b5zWyR5HcP5JstziDhP1QfjPU6DfQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=j3998viTao4gLWF2iWoa0hcE9eTCaHb3lgV+j6v0AMkQmX90s4Ezf1zMNq1JyiMDPpOfjOovcAOwhi4tGCBjhZpSjkLvnyf9lLMndpDLiog9lMA1ORm+PN2qVcYbKQA0I8aJ0DqPvi1LT0Ec+aM/96XTECzoDiFOnqNaVgspKNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=d7QLh1Y3; arc=fail smtp.client-ip=52.101.84.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="d7QLh1Y3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxaN7qePyyLlD6L2gKQ27y0x8XC/IgKRKDVwSB5ofHh+25xloAzJ8x4ukehmjZfBHjXRcZ8Qhc6VVfRcPDepfVpdB1mGsVZ9hm7A7rOHc18kYWEuNLEFhK7s4CNGQ+FNdnLMteozq9Q9oblVrjGJO+9yvnl+t7PvzRWbx8/+CfDUes+UgUR4O0+NNkij5FLeXvCwSNiBN7BtCRzUeti0N8NybCAQq8KxXjDAG8OIA+hpiLZzRmpkm86Wagw+E4VL18Hg+K6T2kTLWIiTM+dDSJT71IPR1I3NDZYvVthadS4rPgyq40yetGXD2epY6tGQ62gm6l6lfGsfuk5SNlZJUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsSdFWrvnU8+hnpLrFzBw0ASMcOHG8sKyU3KYkP1HIE=;
 b=QQccNYcNpYwv+YU3YOQvHIHJRIqjuhcV+shmNeIHU8I4s5NAIbeqiUmowL/jDl3yOS+x8CQIjzvZnSBLxAdpWbC4Cw7tR/hRVHqef51DBDS9kqtEE8SYw2ios2gok9tjaPfPyjii4enBLsDRnvOfGW9J2ndmXCz61C9xr7H0Bs0ZuEt8fzpd3K4/dcsL3z+38/Er/C5i4fDWqdJzQvO2N9XPV4giwqcVbuYNJMdmeNNx1gJBXRNioSHurv+MSUxF44fhrqN+1pDFCkpDXXQiuhEqcQxPN/53+crrEBInE8jdJGprYUpQhiHBxrHHLzvgAgyB/zxsF4XFtu/8mxAi2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsSdFWrvnU8+hnpLrFzBw0ASMcOHG8sKyU3KYkP1HIE=;
 b=d7QLh1Y3kQxwVsIvjvJgDf1wfqoBqCNFFDl/H7sJKNOHKYeq43TT2hO1PV6x/mmLKZQ4S+uKI4w/sgLXBBp9sawlpN3Y0eeROq9FOStHCcv9heGlLvbFYq8xZ2DTVUbnbsMmNEiDJ6+5iDPwagZHJkZcCq5z/HQ82Ih3h2ub3EuqDjEFczC9l/CP3tNkrTK+OrlpZzaos8dN/vsgl3ExbxSenVu5JVcJh4OldAx0XqB7qOQbUsH2byyf4HugHawkwtgsn4/dyVg0u3zFhVccj+rqLBvuNvF+HE1HSbPgk9X6+USE9Zy10y6bct9HF3W8c5p/XIjqVcwDWfCR4DU/NA==
Received: from DU2PR04CA0350.eurprd04.prod.outlook.com (2603:10a6:10:2b4::22)
 by AS1PR10MB5316.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 19:01:53 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::1d) by DU2PR04CA0350.outlook.office365.com
 (2603:10a6:10:2b4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 19:01:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 19:01:53 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 21 Jul
 2026 21:07:05 +0200
Received: from localhost (10.252.29.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 21 Jul
 2026 21:01:52 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 21 Jul 2026 21:01:19 +0200
Subject: [PATCH] media: stm32: csi: correct remote pad retrieval
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260721-stm32-csi-pad-retrieval-fix-v1-1-7f88d6072949@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAP7BX2oC/x2NywqDQAxFf0WybmAygmJ/pXQxaKyB+iAZRJH5d
 9Muz4F77gXGKmzwrC5Q3sVkXRzoUUE/peXDKIMzxBCbEInQ8lxH7E1wSwMqZ5/v6YujHFgnCoG
 blsauBS9syq7/9dfbeRLLq56/s1LKDfhi+c18AAAA
X-Change-ID: 20260211-stm32-csi-pad-retrieval-fix-3a100e671f97
To: Alain Volmat <alain.volmat@foss.st.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@kernel.org>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E0:EE_|AS1PR10MB5316:EE_
X-MS-Office365-Filtering-Correlation-Id: bce56c1a-9a34-4bac-6ca5-08dee75a8715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|56012099006|11063799006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	rANCQdwwHItXo5qYjOwGg9QHF2wVnj2qcTDAVPDCPS4JEX09TUPF2niQWUtg91EY5Q11nkMyNZJyjbRdjVPngtuf2I5gh5Q0IP/96SeVrrTZ1DVh4wmdb8sWyVf22OUYwsXFO01opH3xKAor++LJPupYusU6emHyUdZ1T1u45oTGMxMoSIGlNc5cTUhJJgMsyUswJmYRGYwqYHq8EEo+1NIvjZhQ5DG+HVC/78YH281QYJAvI6jPE58OOvjG+UpGUGqyb39rlqqSNTS/aF/YNASOnPuRF9+2eIwMvrje7vwXsypNKVPuGAi+Ev6zdsv3nBOwMdA6tz5kQ8Lz4CVAljRPAczrhplLT2NasjLE/FxjQmjFImiF0wqOUUNi7buxdhU0+R1TWua8M/vB2KpWMbKBkfUou+Diw20nf7CJoL+p+YXOxkvQkFsQHdvmqNWqe8mtvP840Nvf3gmuAHXIQwa/dlC/5tCVqWDqIVSYM8qZycmpi2qsZGlhb0dxfsOre3E8gobuq8Mw5v7VYWA87DiUiuHKNUDsn7NjI1aDQPjJZfcZOZ1ix3MnhKiozpTz9aoxLCbjS/kxwj6pOVKd1fA1dYNlz3TbAzKuhDcHtwkBhsFwAfXiRP407UgiOSqokFhs78v2xeVFNmgAftKo7k9jhpY63qclkZ5Y67b4YIXhop2bC/q0R+AKLK6MyUEev90UorNnDngbo00oO28MYw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(56012099006)(11063799006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wDsPmbnTxHlSPS6hdK7/og3No+ewMugmcRl978ZBFHk76YXr7T1WNUpnh9ICGJ04EaLQcbN/HXbrC0Fl4oRWWdt8XKjHV0FWFghqXQ/2tn6RoWFT11lp7Led5mZz8YVfPIOkV8TD2ny1NrDRVvNX4qywfuWu6UEzmtgycZMVC8e8gAq60/l+ydmKS7b6SPGRXk/Kxd+JXL3UaYHUo2qf1Q3a2Zfpb/gwmQwM30o9pJCVZktRAoQNiUBdhdeFjIhfUOeGgFw3jkEncY1QSdgsP3Fv49egK9sE6/Kc/jdW8445uHGUtMKlzEbn8aUhmS/mRrVtfVI8mOKxBEqqKru6EEpRJi17/07TdifIsR4Uu4AOQt1xZHHZD5uTCQrNo2Ktmt5nVaEpZn+ppMuh+ecpE3ISjuV1ej9ibPwIucF4liE3k+oszr2bvAX1Zd4+bFxA
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 19:01:53.1345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bce56c1a-9a34-4bac-6ca5-08dee75a8715
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5316

The function media_entity_get_fwnode_pad is called in order to
retrieve the remote pad, which is the source of the CSI.
However this function is expecting the sensor endpoint fwnode
and not sensor device fwnode as it is currently given.
Correct this by properly relying on the notified matched fwnode
data instead of the subdev entity fwnode.

Cc: stable@kernel.org
Fixes: dcb0f4c16be5 ("media: stm32: csi: addition of the STM32 CSI driver")
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index fd2b6dfbd44c5..ecd0ed8e76b59 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -825,7 +825,7 @@ static int stm32_csi_async_bound(struct v4l2_async_notifier *notifier,
 	int remote_pad;
 
 	remote_pad = media_entity_get_fwnode_pad(&s_subdev->entity,
-						 s_subdev->fwnode,
+						 asd->match.fwnode,
 						 MEDIA_PAD_FL_SOURCE);
 	if (remote_pad < 0) {
 		dev_err(csidev->dev, "Couldn't find output pad for subdev %s\n",

---
base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
change-id: 20260211-stm32-csi-pad-retrieval-fix-3a100e671f97

Best regards,
--  
Alain Volmat <alain.volmat@foss.st.com>

