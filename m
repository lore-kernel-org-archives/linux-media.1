Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013052.outbound.protection.outlook.com [40.107.162.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ED7235C01;
	Fri, 24 Jul 2026 16:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909696; cv=fail; b=tBw7qv5QnGW7zTA2feuAcpBN2qexrIXe2nAFtb3vyYNFCAjJ1xhe4UFwu8b2s7CjDjzRtlL7eiF0qEbl/9SrmCWE+QqkSQzaDvq39n99lBrgkXG3O16ESeIfd7M9UZ4FvpRDClbtVqFfavStSfVR0cEYYdqYcFj/uvioD/GiXzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909696; c=relaxed/simple;
	bh=Pq2mEv/ISGag57hE0DfkbIrVRfPmfPaMhVApYplTv9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=imgRQQN0uvmqGiCOMgmLezIsGrzIMch9/mYlg78ZifC5GvtclWQ4Lhhg6pGQjzGsH5hcQGB2O4cMmKceXG1jbKkJNzpPlpW6RI9dHgzXxiaYe6XO7RM0/HyYIX89eVrQQN9GHb/R8gf5yiSEWXR76TWwGzp+nle9g4FxWIRVNEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ipIzZFD+; arc=fail smtp.client-ip=40.107.162.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ipIzZFD+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSC6xCmNg9EWUHF6WRYidfIcP4i2YjDla6pyFcuIaE6j74CSkKSbveq32XVtmmmqZpQMHkBKFiYkcnvzLMMWYWhyVvQTWTL9MxpyByQcDvsI+ADEbqAQlexxS2aldcaq7KnGb8YLnHOEYdxeXDOJkW3V3MrZp2cHocyEcOPo8H3UhI9ZkYgXsMpHGGqaiV9g9Dty4Sdov1uQImtsmvdEtS8Tk4pfg7XlfrFsByVq142ndLk+xcyPntRu3GiJLRBnaSaQ4sfTaAgJa33PF7Vznd3SnWTHIKniMLoaz/QO8py3/cr4Od+O6v45dJnF7VAzD+DQ96QjGE3JJ8iJ2DzSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3gtnsrz/6HAoZspZUg9M8ZJWC6bmzmlydxL6z/xP2Y=;
 b=LQG6xt2c69z3CwVQ5kScs2LDs7Hcvob439ArmY2Igs7EsyCrTOwEPlPDl6k6mj0I5JrZ6ekY7jS8nF7v2VKfkEfRSlFTqEx6P7tY7y/hUXIh4MxBOhh0PXPEF/oWdN4Vo/5Cyb+lFM3kyU7qynYHqW1vcpDf3cAQUNBmL80GQNuVm3yrOatBciBRV+sBzd1niftlHsphhfyDEm+y5pJ6qxAUlHD1QdkLGHNk3IYnKwJFlpv4kD6fPnc7hUhqXXmmTfXTZCWXslw3sLuJ4qxgL+ehy9Q2gOC1V9mCh1QxOWCvPHtH4Gk3apO1X1Bxlo7fOvIRqqoZF7kDAKeThwbhVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3gtnsrz/6HAoZspZUg9M8ZJWC6bmzmlydxL6z/xP2Y=;
 b=ipIzZFD+1XjBn6Tsxs/ElrYXZ9N5kfMrW74LsY0Dt6sJtnqgqjVo7isbX7kahDqGqdoxe8WjdxjO21biJpiWIhaW5OKBIwobPpGAeJry9TVLt1ZHWoF4f+GwU8XH9IIyC7jumMBsUCaVCvHx6LoM+h527yKhmpFQYaljbZrDVu07etxVXKpyYuQ5dkgqeqK+2wzTeCuJWNHndDYBGhEP78nsW5pg74ZWxWCztkIwSpbpVUekpuUUGg/SEMwZmQSeFzi3vGWTG4IEJ8SleConJ3Qr/FgCdjcKaUosiJ+TcI2BfYZULUGxSqkR/vmqhgb3GKl1EsCnhyKsm+0jYgZocw==
Received: from DU7P190CA0029.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::23)
 by AM0PR10MB3281.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 16:14:18 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::8) by DU7P190CA0029.outlook.office365.com
 (2603:10a6:10:550::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 16:14:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 16:14:18 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:18:55 +0200
Received: from localhost (10.252.22.128) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:14:17 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 24 Jul 2026 18:13:48 +0200
Subject: [PATCH v3 07/13] media: stm32: dcmipp: introduce a dcmipp global
 media_pipeline
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260724-stm32-dcmipp-pixel-pipes-support-v3-7-f77fe7e723d9@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009527:EE_|AM0PR10MB3281:EE_
X-MS-Office365-Filtering-Correlation-Id: ec78b0b5-d0c3-4eb4-aabd-08dee99e9d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	89+KpYgbDls6OuvndTETQdCoZWLxgqwRVpHxzJSWgJq6Z3hIRpBAAeSaW705+XnLUkNb0YZoiJnd0YAC705ncbgjbZIP1nD+sIdcI76y51fqzEYg+0GVAOvgq0VUZ1kpqHxiDXXSv1pZ5lcvdvp24zJ1d2nKkUgIIB62muUbvNytVPTLboK+XHmPd1hnHZ7WkewkG40A4Muymu1DaniFS68nujG51TsXq5pkQSt8lR3rnp6mpsGFk85/8dbBTTAAcnTy7IfwYQeN420q2jaXSL4fSyllPUipFTQKUYRe5BdawYr8whm88QRuPysuUes/yfHuTf6JfUTwiR6ATGYgumr6Gqs1SCAxc+z0ZQiPt2hB4G+BraNM/YJsPnvty9oXwRBACBQfU4uqU9wHpzQL+y1JOSd4oO5Iik43Euzopzp4GqWWFAWsTJt9C4k3uqj0Lyp72uNWsGjSIyLYjp+82wuBfruM1Cbd9G8Xa0IbAoWhn9AtnxOJXKBK46x2nPxAUwR2kcWmIMTFJOyZBofeaauaIfCzaeVd0AMAQw26tMoRSPeCougiYVZrHM/1WuN7MuWC2gqf864y+thcVPte0BoZVByh3l/FcyVwa1U1IfQarzIZOKrrE8jzgbfaFtqKfj8OBEHU+7XtawdJ+wanSfCPjrJ1IS+P6gN8KvsGmzrihUp3cyTiT3ukpZH7eVDfc7DM+BtcGq2bFtbcf5tGTg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GSKm1Kev7JJ0U8f1Of43WaiHiE4SzToZRacOAdB/V9Sqg/FoBq3OQfzUpL1vJWoKtTfo4ZkN1MlQSNjiFOk+C0ODA8PTQBFNkdlkN7/o6oPjCeDK/zG3O1Zi4IN2saDEtT9AYj+QaKy+Ff0Zk/xq7RoTcTAUyyx6YuEcttX5EpGNkDiznk3ToEX+f8xyMM9vwL4N0C/U3GeUxPK+qJypxKJx/EpUtTjut8m94mKR3GxKDZUifN6g9MdOrf4+fLKGI6z3pfv6VWEY55E/5FdwAopcAtroE0TO3cGpDsb6U8lh2wFvVJ0elpWzGxQGiSZp5yG1uK2sSRcXDcww8hVfEQPmaSHaTEtBM/pMeK4v72eq5gjMWbb7CVn2qYc0YYgwbwg+wRSZ+H8xxQLtMFfeeQgXYrjbgGtL1VAwvprTOSaPEU7t6PmCD0Cbx88iIB8H
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 16:14:18.4089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec78b0b5-d0c3-4eb4-aabd-08dee99e9d3b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3281

With the introduction of stm32mp25 containing several capture
devices, it becomes necessary to share the media_pipeline
structure among all capture devices since subdev pads can be
shared between several capture devices.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 3 +--
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h  | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index f6011b42203c7..53341b7984579 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -125,7 +125,6 @@ struct dcmipp_bytecap_device {
 	/* mutex used as vdev and queue lock */
 	struct mutex lock;
 	u32 sequence;
-	struct media_pipeline pipe;
 	struct v4l2_subdev *s_subdev;
 	u32 s_subdev_pad_nb;
 
@@ -410,7 +409,7 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 		goto err_buffer_done;
 	}
 
-	ret = media_pipeline_start(entity->pads, &vcap->pipe);
+	ret = media_pipeline_start(entity->pads, &vcap->ved.dcmipp->pipe);
 	if (ret) {
 		dev_dbg(vcap->dev, "%s: Failed to start streaming, media pipeline start error (%d)\n",
 			__func__, ret);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index 2d26425b0b0fb..ee9f36268e646 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -73,6 +73,7 @@ struct dcmipp_device {
 
 	/* The Associated media_device parent */
 	struct media_device		mdev;
+	struct media_pipeline		pipe;
 
 	/* Internal v4l2 parent device*/
 	struct v4l2_device		v4l2_dev;

-- 
2.34.1

