Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013032.outbound.protection.outlook.com [40.107.162.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12160448BBD;
	Fri, 24 Jul 2026 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909692; cv=fail; b=e3MMDM8twbNPg5RR/breb6zP7TSp4MOm8Cq9bYzLWFP1wsKtFtqzwjRcQluTxbTUFOZ8w7F/zkbcIhfalO/UPHjiHXPYHiDHcFtG118jpTAMKhgQ7lnkR7sYTfQ2WfVI9ax2xBI/yOIrLJKKRcv8RSIgjf8vSF2TVzWvo+rTHHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909692; c=relaxed/simple;
	bh=c7IAn0pxpAYIQ7o2osPWXU/a1iBEKxtt37wKiM62lC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fifdteCsfe/yfcgEFT6MxdpON9KBSLGvDFpkKrm1A9w9TD1+ViCg1ndIRe9y9eGy3l9Hpn+i8ZLGR3aWFI8M5xYRkvxjs498unMWQw2jCrjDPIRx4IIQXHKcPBL8u2BV0reRzoYUKpYYAo88eUbgK9KC566Q2WSUJot3xgjsqnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NFvEsIts; arc=fail smtp.client-ip=40.107.162.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NFvEsIts"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgHsUidVpIsX+khAZWEE3f/tsWmHt39XjkMlUvUEbY3lPSdmZnxiFATQ/4aB/E6DKR1erJwwzd0mO6F7M1jjLE4BPyzFJUfvVIwXqUTYA2E6bmPx/q1sUxDPY4AzHNZBS09/GjF8UBKKG9EUeWl4JglB8tvthCCykZf7rebIz0GjwHGXsa2aV0RGuuMxdc6pfjl0we38lshg2uMYaUcLa3QccY5Dh0pn0OOlsFsr/fevlqYQd5MbykEElpVUwy00irL6jLYPfR6L+Hg9CZ29OREXBQyNB6hqn1txnsXImlU2Vcm2Svv8MPBQyxY9g3emTGsgYMvUcfk+sz4z0j1UCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yKhFj6Jv0bJZgLOm9hZtusw1gz74T4jOjET5lrA2bQ=;
 b=pA39hh/75ZiU53kJTymlbzWhehSMTUvN9B0wVdv0er6xqdWt3jQMru1bfsOBOX7vA8z5pKLCtiTxkOxYf2kKuxSLrzAcutn7Nox3LiBjONG2YSMHgaT5TTn944PcTt1N46pK0weYMVyiAckecrvioe5noLajqx2pVy1R2q4CeVtfOwSujfk1W/A+PBK8jBSbbbh2jpU4MRM2SH48dtM436e1Kpj+JfgC9Uzzmd/Colx4FjSmYDKnZiacKRth1uMkYAYBCrVuSs2+s/u8Zrym35gYc5uPzBwcEA3P6gvqzdE3Gpe3i24M+5diyhwbVub2/3/cYKwZmsc2R7cLowUFmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yKhFj6Jv0bJZgLOm9hZtusw1gz74T4jOjET5lrA2bQ=;
 b=NFvEsItsfX38SCgURiXXW8Um5BvfOpF6ZIIm8yqiE4/sCAQAuXt5rbMwXOjKFN9m99zKbvv5vp4BLs0FTHmT4eUrb/QaHK5OP5aOEcENvF3g257frlR+mV6Ssn3hdD5ofO+RIVMQ1aQENP4LtyGlk95tkGU97nLQ1cWjEUFkQn795pKI2iFrJ8HCFVMj29U47K1wyEE7POJ6dqNiURbsGCzCUklEDxWHk6v7SGIPD9YEuBVtsJtfLnJjfPt4v0j7Qm3DnIbBZOsawjfV4FeIKJGlhv8WpmfGHZxq0TJMnUwUlb0iGmBz0hGfkEt40PUV6v7sP9EIpwXjA/IZ5YaoUQ==
Received: from DUZPR01CA0136.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::24) by AS8PR10MB7706.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:63f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 16:14:14 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::78) by DUZPR01CA0136.outlook.office365.com
 (2603:10a6:10:4bc::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 16:14:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 16:14:12 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:18:49 +0200
Received: from localhost (10.252.22.128) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:14:11 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 24 Jul 2026 18:13:42 +0200
Subject: [PATCH v3 01/13] media: stm32: dcmipp: share struct dcmipp_device
 among subdevs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260724-stm32-dcmipp-pixel-pipes-support-v3-1-f77fe7e723d9@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|AS8PR10MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b1cb78-26f3-4806-2187-08dee99e999e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|10067099003|11063799006|6133799003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	3t7n1ouUzf4+4/kM+15teWNV8CgYHBh1D3XVUtBsT+WdejlR9In9SkcKB04Qylv7D/JEZxUaZnHJvfaasX1aLF89C0NjPz3BvUC3b6yFRQZb5VPl4twnSQzW/C4JTYaQtWwegNPNgTGh36a7VEJd9bU4J/MWpHwRxBb8CleYCF9YCM0ipCv0H8MMnPw5DQQUj9oPZ44LGuNStchFR/iP1DPNEfDZsjocKPbqDyT/5lUgtSW77L0lIfVeD+srFyY8J1Abi+OiFSv3jDvPjnhQ2H4N78jSsgeKsPzGpQWZ+7cdk6XXYGAaJyvmQanPMgxVXnwMoeZQQojkUKxBCJ6ICxy5dKxA1vfwRqA50Y6kdVnExMK6bU53OaGrx79QxLedmf2PhfPNC+5tkQInStIBaLHp5XnfZGR3F5udc6GBvcIEqYZdWritCMvZod7yNkJDVj4UV2n6XhVYOKCv28btySYWQSbNsPcjSKGCmsZYbJ8bbKjbiGn9wG7JLy5D+28nL9Vq3D95BgNpYLVNaIeUM9yKqSwhQifsFp4mIKlRZUhZ5kpNz98yvqE71WPtW9dtZvwbutuc/uWSeL5/k3Dm/skyurzrnhlc2RYX7qsm4WuqMlAglxc35cjnB3l4F1lOlz8NyEDFeZPdMS+EaDmK9heoKCeqwsjL2u89kin9C/AQFlDjRAezfJf/jev268nmA41XfDcqKTfDVSadYMf1wA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(10067099003)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PXGK28RY6yYoI6R7adGPkaFxUMvxWzDAfuxm1Z4njchT8fL8vAa4z24z77OFBevDt/d1Y2cptMOGDZca9IKkJSJKrFvMAzgIRqvLto10oOTowPi6s/TvmG6bnF6O8K6i8U8xoq4GgEwNra0ZQM+fElDwCFRj78K6hHAyFL2UnTgy+SqSVHCb9/qCdURlWFYezSibnQ1s0YOambNibO1qT09AhYxoQt3IwwY5lf62DSM/FmIwWI4YWjaAx4SWZMCoJ3G6uhZ++TtfNmZitKHP65rZFbygJwYmvcMtnjKJUCQuLb+pEcLmBBZBC1kwtzZEXOchoNmeyavuuyBsH4156DdSFic2OPt/0c6BmU7ZsC1tiJitZMloxljHF7se3d0sl6nXqw/QonNdg40lL858vNRxdkYrX7x2xnqK/Pwh9T1BrfAfxdqNSkerovPM5oEK
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 16:14:12.3437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b1cb78-26f3-4806-2187-08dee99e999e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7706

In preparation of need for sharing of data between subdevices,
make the struct dcmipp_device structure part of dcmipp_common.h
and share it with subdevs at init time. This allows for simplifying
parameters of each subdev init function as well.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         | 13 ++++---
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        | 11 +++---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h | 43 +++++++++++++++++-----
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 33 ++---------------
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 12 +++---
 5 files changed, 55 insertions(+), 57 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index f0e809458489f..483af0f39f0d9 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -857,12 +857,11 @@ static const struct media_entity_operations dcmipp_bytecap_entity_ops = {
 	.link_validate = dcmipp_bytecap_link_validate,
 };
 
-struct dcmipp_ent_device *dcmipp_bytecap_ent_init(struct device *dev,
-						  const char *entity_name,
-						  struct v4l2_device *v4l2_dev,
-						  void __iomem *regs)
+struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
+						  struct dcmipp_device *dcmipp)
 {
 	struct dcmipp_bytecap_device *vcap;
+	struct device *dev = dcmipp->dev;
 	struct video_device *vdev;
 	struct vb2_queue *q;
 	const unsigned long pad_flag = MEDIA_PAD_FL_SINK;
@@ -880,6 +879,8 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(struct device *dev,
 		goto err_free_vcap;
 	}
 
+	vcap->ved.dcmipp = dcmipp;
+
 	/* Initialize the media entity */
 	vcap->vdev.entity.name = entity_name;
 	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
@@ -930,7 +931,7 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(struct device *dev,
 	vcap->ved.handler = dcmipp_bytecap_irq_callback;
 	vcap->ved.thread_fn = dcmipp_bytecap_irq_thread;
 	vcap->dev = dev;
-	vcap->regs = regs;
+	vcap->regs = dcmipp->regs;
 
 	/* Initialize the video_device struct */
 	vdev = &vcap->vdev;
@@ -941,7 +942,7 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(struct device *dev,
 	vdev->ioctl_ops = &dcmipp_bytecap_ioctl_ops;
 	vdev->lock = &vcap->lock;
 	vdev->queue = q;
-	vdev->v4l2_dev = v4l2_dev;
+	vdev->v4l2_dev = &dcmipp->v4l2_dev;
 	strscpy(vdev->name, entity_name, sizeof(vdev->name));
 	video_set_drvdata(vdev, &vcap->ved);
 
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index 0c7aeb0888f66..5fcd5123136f8 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -571,8 +571,8 @@ void dcmipp_byteproc_ent_release(struct dcmipp_ent_device *ved)
 }
 
 struct dcmipp_ent_device *
-dcmipp_byteproc_ent_init(struct device *dev, const char *entity_name,
-			 struct v4l2_device *v4l2_dev, void __iomem *regs)
+dcmipp_byteproc_ent_init(const char *entity_name,
+			 struct dcmipp_device *dcmipp)
 {
 	struct dcmipp_byteproc_device *byteproc;
 	const unsigned long pads_flag[] = {
@@ -585,11 +585,11 @@ dcmipp_byteproc_ent_init(struct device *dev, const char *entity_name,
 	if (!byteproc)
 		return ERR_PTR(-ENOMEM);
 
-	byteproc->regs = regs;
+	byteproc->regs = dcmipp->regs;
 
 	/* Initialize ved and sd */
 	ret = dcmipp_ent_sd_register(&byteproc->ved, &byteproc->sd,
-				     v4l2_dev, entity_name,
+				     &dcmipp->v4l2_dev, entity_name,
 				     MEDIA_ENT_F_PROC_VIDEO_SCALER,
 				     ARRAY_SIZE(pads_flag), pads_flag,
 				     &dcmipp_byteproc_int_ops,
@@ -600,7 +600,8 @@ dcmipp_byteproc_ent_init(struct device *dev, const char *entity_name,
 		return ERR_PTR(ret);
 	}
 
-	byteproc->dev = dev;
+	byteproc->ved.dcmipp = dcmipp;
+	byteproc->dev = dcmipp->dev;
 
 	return &byteproc->ved;
 }
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index fe5f97233f5e8..e5c0eda8b18af 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -58,10 +58,36 @@ do {									\
 		(fmt)->xfer_func = DCMIPP_XFER_FUNC_DEFAULT;		\
 } while (0)
 
+struct dcmipp_device {
+	/* The platform device */
+	struct platform_device		pdev;
+	struct device			*dev;
+
+	/* Hardware resources */
+	void __iomem			*regs;
+	struct clk			*mclk;
+	struct clk			*kclk;
+
+	/* The pipeline configuration */
+	const struct dcmipp_pipeline_config	*pipe_cfg;
+
+	/* The Associated media_device parent */
+	struct media_device		mdev;
+
+	/* Internal v4l2 parent device*/
+	struct v4l2_device		v4l2_dev;
+
+	/* Entities */
+	struct dcmipp_ent_device	**entity;
+
+	struct v4l2_async_notifier	notifier;
+};
+
 /**
  * struct dcmipp_ent_device - core struct that represents a node in the topology
  *
  * @ent:		the pointer to struct media_entity for the node
+ * @dcmipp:		the pointer to the parent dcmipp_device
  * @pads:		the list of pads of the node
  * @bus:		struct v4l2_mbus_config_parallel describing input bus
  * @bus_type:		type of input bus (parallel or BT656)
@@ -84,6 +110,7 @@ do {									\
  */
 struct dcmipp_ent_device {
 	struct media_entity *ent;
+	struct dcmipp_device *dcmipp;
 	struct media_pad *pads;
 
 	/* Parallel input device */
@@ -199,19 +226,15 @@ static inline void __reg_clear(struct device *dev, void __iomem *base, u32 reg,
 }
 
 /* DCMIPP subdev init / release entry points */
-struct dcmipp_ent_device *dcmipp_inp_ent_init(struct device *dev,
-					      const char *entity_name,
-					      struct v4l2_device *v4l2_dev,
-					      void __iomem *regs);
+struct dcmipp_ent_device *dcmipp_inp_ent_init(const char *entity_name,
+					      struct dcmipp_device *dcmipp);
 void dcmipp_inp_ent_release(struct dcmipp_ent_device *ved);
 struct dcmipp_ent_device *
-dcmipp_byteproc_ent_init(struct device *dev, const char *entity_name,
-			 struct v4l2_device *v4l2_dev, void __iomem *regs);
+dcmipp_byteproc_ent_init(const char *entity_name,
+			 struct dcmipp_device *dcmipp);
 void dcmipp_byteproc_ent_release(struct dcmipp_ent_device *ved);
-struct dcmipp_ent_device *dcmipp_bytecap_ent_init(struct device *dev,
-						  const char *entity_name,
-						  struct v4l2_device *v4l2_dev,
-						  void __iomem *regs);
+struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
+						  struct dcmipp_device *dcmipp);
 void dcmipp_bytecap_ent_release(struct dcmipp_ent_device *ved);
 
 #endif
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 49398d0777646..dd784cfcaac82 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -33,31 +33,6 @@
 	.flags = link_flags,					\
 }
 
-struct dcmipp_device {
-	/* The platform device */
-	struct platform_device		pdev;
-	struct device			*dev;
-
-	/* Hardware resources */
-	void __iomem			*regs;
-	struct clk			*mclk;
-	struct clk			*kclk;
-
-	/* The pipeline configuration */
-	const struct dcmipp_pipeline_config	*pipe_cfg;
-
-	/* The Associated media_device parent */
-	struct media_device		mdev;
-
-	/* Internal v4l2 parent device*/
-	struct v4l2_device		v4l2_dev;
-
-	/* Entities */
-	struct dcmipp_ent_device	**entity;
-
-	struct v4l2_async_notifier	notifier;
-};
-
 static inline struct dcmipp_device *
 notifier_to_dcmipp(struct v4l2_async_notifier *n)
 {
@@ -68,8 +43,8 @@ notifier_to_dcmipp(struct v4l2_async_notifier *n)
 struct dcmipp_ent_config {
 	const char *name;
 	struct dcmipp_ent_device *(*init)
-		(struct device *dev, const char *entity_name,
-		 struct v4l2_device *v4l2_dev, void __iomem *regs);
+		(const char *entity_name,
+		 struct dcmipp_device *dcmipp);
 	void (*release)(struct dcmipp_ent_device *ved);
 };
 
@@ -221,9 +196,7 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
 
 		dev_dbg(dcmipp->dev, "add subdev %s\n", name);
 		dcmipp->entity[i] =
-			dcmipp->pipe_cfg->ents[i].init(dcmipp->dev, name,
-						       &dcmipp->v4l2_dev,
-						       dcmipp->regs);
+			dcmipp->pipe_cfg->ents[i].init(name, dcmipp);
 		if (IS_ERR(dcmipp->entity[i])) {
 			dev_err(dcmipp->dev, "failed to init subdev %s\n",
 				name);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
index 7d3f5857cbfe8..564f37e2e1dd4 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
@@ -515,15 +515,14 @@ void dcmipp_inp_ent_release(struct dcmipp_ent_device *ved)
 	dcmipp_ent_sd_unregister(ved, &inp->sd);
 }
 
-struct dcmipp_ent_device *dcmipp_inp_ent_init(struct device *dev,
-					      const char *entity_name,
-					      struct v4l2_device *v4l2_dev,
-					      void __iomem *regs)
+struct dcmipp_ent_device *dcmipp_inp_ent_init(const char *entity_name,
+					      struct dcmipp_device *dcmipp)
 {
 	struct dcmipp_inp_device *inp;
 	const unsigned long pads_flag[] = {
 		MEDIA_PAD_FL_SINK, MEDIA_PAD_FL_SOURCE,
 	};
+	struct device *dev = dcmipp->dev;
 	int ret;
 
 	/* Allocate the inp struct */
@@ -531,10 +530,10 @@ struct dcmipp_ent_device *dcmipp_inp_ent_init(struct device *dev,
 	if (!inp)
 		return ERR_PTR(-ENOMEM);
 
-	inp->regs = regs;
+	inp->regs = dcmipp->regs;
 
 	/* Initialize ved and sd */
-	ret = dcmipp_ent_sd_register(&inp->ved, &inp->sd, v4l2_dev,
+	ret = dcmipp_ent_sd_register(&inp->ved, &inp->sd, &dcmipp->v4l2_dev,
 				     entity_name, MEDIA_ENT_F_VID_IF_BRIDGE,
 				     ARRAY_SIZE(pads_flag), pads_flag,
 				     &dcmipp_inp_int_ops, &dcmipp_inp_ops,
@@ -543,6 +542,7 @@ struct dcmipp_ent_device *dcmipp_inp_ent_init(struct device *dev,
 		kfree(inp);
 		return ERR_PTR(ret);
 	}
+	inp->ved.dcmipp = dcmipp;
 
 	inp->dev = dev;
 

-- 
2.34.1

