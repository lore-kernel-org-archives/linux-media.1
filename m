Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013003.outbound.protection.outlook.com [52.101.72.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325A03115BD;
	Thu, 20 Aug 2026 07:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210595; cv=fail; b=Tri4EQgLdWhIAJBJoWMxBzeMc1NwjqLnw9PwTTy48CGWAuaoMhR/njGCiOWPr4WPeBbrMFWdYBxNl/+GlJ9bj5dQPiFS6+/+GwALBHjmwKsT/rFwuwhDH2OY5ER0EkJvEqxxsJtcQcm0THJFNILqY2L0lGVzhYAQu+wWIu9RLKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210595; c=relaxed/simple;
	bh=c7IAn0pxpAYIQ7o2osPWXU/a1iBEKxtt37wKiM62lC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=F7Z0BvjQZzSZ3IxTtqeEJeLy9vVqfR4IGz3FbXJNW9kI1k0s3uwoV0KSeGmC5+BigEkmrV2d0+QcDF3g5i+EGIbYATAWLlWNmYv2P+r4Pxy5favKCVcqWlA1/K+SJfxYrN+GZACkJJmxMdb1rMNfjkGwoO6w0DK0Jx6GkeJVvZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Eayopi1U; arc=fail smtp.client-ip=52.101.72.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Eayopi1U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UshaFyIvGWzI7OVs+q7UXbbPqsXje5cbg1sAluDcAESdRzkmCwTuL0laT7VlvtY+exx+2MwsKl6057xO71a91gOvFovMyn2dinhcl1yeaIes3SeeuHBxBV63vZNT/DbgYUJvqbLjaO0cH+bULJ852Ng+gNEraoAulGkg9mJ141M0y4GDvKzGA/INfgk5A0+l7Ii0/J4VD+WERpkaubwaxxBpd+BY7kHVedJxElbgm0ujmyOJ0fmBAeDXfawcEVlIqXek1BPlFDYRnXXQTrM30KMFCKJbNCGAEGFiyECE78IGkat1Vs+pE6jnN6fufb8lz36a9lFTZe72LWb2b5khCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yKhFj6Jv0bJZgLOm9hZtusw1gz74T4jOjET5lrA2bQ=;
 b=gfZg18IYMpDej1+D5poXs3JRUw0MacqB2yf7Y0jRbWOJJajP3t3BzdX7GBzYHxvevcp4SLJfIPnu6mjxqUe9VzIscP9QpIQoM7hKO6L5d1uhIlbwu+m6auv29kAKL+lzgFZEk5txZw/w3CLQBzYh2oa1S4AOkztRXfrR9tkz/YgUGvOb73TrADmpjoRnf/B4zYlMx1kAsZWfX5MBn/rrTkehOQS0qjNQOV0QvxKgoY8K+EB8aN829FuaJlE/SbTaGJQ3Jbz0+bY+2KNs9XYzD/Pj1lWs419NGIzFi3//N63xrn8WrVCBWeJ2Swc98lpTIHndcVFpuJie9Of0RSiqGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yKhFj6Jv0bJZgLOm9hZtusw1gz74T4jOjET5lrA2bQ=;
 b=Eayopi1U/4LV9/10Q6swFZJ8iMngwmzg019Dd93m8/tn7F/TBvVScu3FulYiZYmvY7wc9TtSQw9EqbWYnnVMou2P18Yl5OhyIAXzLEXyYZNot6IRjNVMWpWJYnbTdyqaDqxfEpJ6vJGvslcPV4eNuGXSQd6WQkHRq2LlkhzvatQ2d1ey5ZPGpdcPe4bmvxMviWsuvNjjJgMMlw5lV7qOc1J6RcHi0xfDcMopiGWY41TRx6J88K6EwfE9hKS/EVVB1D+I5T2yPy6vnMN6OXCSOnPbVa4xCN5lKgytLIsaQ7lphNGxl4GO0pixJhlVhxjXltwhTO0V/uhDr197SHYWOA==
Received: from DUZPR01CA0328.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::13) by AS2PR10MB7602.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:545::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 07:23:09 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::9d) by DUZPR01CA0328.outlook.office365.com
 (2603:10a6:10:4ba::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 07:23:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 07:23:09 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:28:43 +0200
Received: from localhost (10.252.29.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:23:08 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 20 Aug 2026 09:22:29 +0200
Subject: [PATCH v4 01/14] media: stm32: dcmipp: share struct dcmipp_device
 among subdevs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-stm32-dcmipp-pixel-pipes-support-v4-1-d212eb4e3792@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B92:EE_|AS2PR10MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de2c65c-3d76-4bf5-a9ee-08defe8be2d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|3023799007|56012099006|10067099003|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0KO8FPbM5hNbwfL9Kx97DOR4bNi3MZoMPh4wJZP4xUd+YqIOnYJLYhFZLvxToTkzx45GYh5Q8UADI65Ii1LbbU55GHYeAY4LCUrS4ACeCt4VPyOrB+OgDhLP+oEfiyPT7d60xg6YQ9P+zrIB5fjTR2LORtROSrsYm+C5doGlxrMslzLTZ8Xq4qqbWs0YVBcc/KYRdcjTf5GWp5SmiC7lEJBaSnG2A6QgIuuTz5CGfWGh15WJAdwnF7k9Nn19vB5urDVSyXLh+IQ2dXzBDuAzX1y2Fb3e90TbIFGAvliNhgn6IFFSH3GIxeoyU8dHYfStVpkOLQQSf0yzOlzIgNqBAh2e7jfxWp4X77hp6HsnAwV1xTFOUacMHoZBauiqOCRrhLnuOD6jx1x5mIKqYM5aIIu6OOoiInKp+pLE9DVAHTkkQMoUgEBH0PM9SCmqPhyjg4RwZgVsiVFeHmUh2utz3cUXK84Bh5a+btXrwj3RxUcJHSE/v0+ZEBrUYy/bKAGC2BYCej2varVXsiAOiQkyJsjVann6AY23X7s8QVyWFTvzjt4XOwbXtrDb1WyHjU/bUw7ssbSFLWV0Biw1JvMZRDhEFqN9aBv4tWflliIrdCSXQiIIdBYi7x+bSqDxM1EP1qITnbzp9cG4vZeWTr2aYDL0gfgKnYsuEZTivpm5WwkKFxFj1xC1iPRMtfaS3wdB+v+oR/BWJOahe4Q2UNLqSA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(3023799007)(56012099006)(10067099003)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sHGKb7K54HGyJ15mEUcMfNWbrP9dVV3lLCV6/EmQZClgaqp7KCv+jMJVHjpCUWZp3B59ff/mM3LvsPWBKeNs5lq24RYodG292TZF6P9g6vSKUUqVvLBK7KwrBiyYLNuwfF6mxSE+S/ykXOJYF+ATbNjX5Xz8xQPv3hH4dbs3IXiE/lV9U8lz28e0IRSa3Un2u+wqymsBTeQ7p7xi1iJUo2vLRxUYKXlHjdC6p07drYU4g6LXZbdmfH7oPCAGjQegwAJrD2nGGA7k1nh1lgaqSSw9DpW+ra+FnLkdVplTeqFsOSm8FhPo709ma5YG3BfHztTdejk8ElG6RDrz3ZeTz5esPbQtr1lgL+nmkK399wJ0kAHZf46GvpbCGDx/1dy+Ej58WXgC68H/j7EKfCOK2Jej3Fm4FJGMlX6L2ia2h9oro0twjOBwCD5Z0pI41p0e
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:23:09.1435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de2c65c-3d76-4bf5-a9ee-08defe8be2d3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7602

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

