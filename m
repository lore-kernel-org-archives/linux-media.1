Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013057.outbound.protection.outlook.com [40.107.162.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC67140F72E;
	Fri, 21 Aug 2026 06:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294311; cv=fail; b=vFZf40RonNonijK1rPrJEW8xMAN4CTp7DjS/TIGul6eU2s4Ox0tVrX0t0tDZ7D7Szs6H4PinZLsM6UC22rXHIR/CenfW3NtGCIT+NMMYG7OQKViX9RqYfPEjm4wCAybHfxkSCO+/cV+Lff6bHZ8pDJkJeN/YIVEAigfkGVVNF2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294311; c=relaxed/simple;
	bh=c7IAn0pxpAYIQ7o2osPWXU/a1iBEKxtt37wKiM62lC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nbf94XDaSpS7OKmYLORuDUsfXhPQ9h+KUZsVAK68ARS78h2g3SG76S7VYmIlVKCSBIHnWwMdgiEIEshG+UTQ9egJbW78Moku4EimOJIRmiZ/RRtDgXcciKkL9TdUtktWNgIxqPS56VjkTe5a0gbKf5sapm5srTediuHGWsQ5uR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=MYDX7WXR; arc=fail smtp.client-ip=40.107.162.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="MYDX7WXR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hyc4yf04BhFOy6ibXAN6ZJnd0f7XkxGfpOxq6SCURX32UEZCmpqRmrVKGQVgojUHETymgeWH1gLmcODyj7a32tSY9TR0eaupneznYBIcNADQ/plRkKi7de+fm7N6GaMdAEWCtnQRhPfLJzAPQwvsJUEsovS9Rb9znNyvmf74pJY0NgaE5rjwgdY38qeqWBna1EO0ofKBn2tD/dbsPI3YFdJGCdlwM9qOUeUY8i62HzmdXT8yuzb5nrdLvVw5rmrJ2ZoKgo2oBQkg8CaZucC99pQ7EcCR528TTitF6bbz1Ofl+y8iiflxJidHHjp6sH44QfynvENZptvWugxEnjgINA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yKhFj6Jv0bJZgLOm9hZtusw1gz74T4jOjET5lrA2bQ=;
 b=tLQPETEvCGyujAqjkT4SfvQUHX7C3TECtpUGi6ahEFsaBdEWqFiWB9FSFCay/1+nuLpfrhGuRhumGogUfuK24epwfNiLZo2XNZJ5b33wjGebZSNlSTjqRir7QRhvc5hTM6oYPYbTDYtBfvV6eHuBWqLKGuTbZCLdDBFWYBKXgNbbPdF7dYtmzZANBw5sRKtfeKJhwHaWsFRyUa69e2x8E0AN+8+tjBls7nPE1NbBrxG65FervsI7UakRGGkgpIorL1LXhGhATGH+z0gnQ9K62gAWZbZNVDK/mQnUR6+kZyuhlw09C8iPuZ4rOajA0pclPRuLZip3E0fNPgKAj9f3Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yKhFj6Jv0bJZgLOm9hZtusw1gz74T4jOjET5lrA2bQ=;
 b=MYDX7WXR2Wc4k4BjDMtmMlGJ3yV7Ycopn7OUwzKV9s5kQNAEFMej/fDSnvuP4bw+xNFR+qdT8yDfNhO+8ze17X34IAkPNTZP1+ZxM9IyMTKUgMkQmknPc9QI35SeWZ3m2aOrjK39KVvpyvKoY/tKIDJuBMtmFJxBm4QaIP0lxejbtXhaUbpzji+K2uzNRP8kpIxXjw0Frb0Cf0hNrB9pa6752iMzksmtWs1WGbTHHdAbw9rU1s4f7aNPk9j/1aqFMgXQclc1ZS9oSNx5Ai6nXSTR7hIhZ81eWcx9pE8mxDfGo/x6H3r6ZWH6ZRo9FjgPuLtCEymf2DEj6D/xrJHARw==
Received: from PA7P264CA0310.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:395::7)
 by DBAPR10MB4108.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 06:38:24 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:102:395:cafe::9d) by PA7P264CA0310.outlook.office365.com
 (2603:10a6:102:395::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 06:38:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Fri, 21 Aug 2026 06:38:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:43:59 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:38:23 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 21 Aug 2026 08:38:03 +0200
Subject: [PATCH v5 01/14] media: stm32: dcmipp: share struct dcmipp_device
 among subdevs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-stm32-dcmipp-pixel-pipes-support-v5-1-d140efb61d72@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F97:EE_|DBAPR10MB4108:EE_
X-MS-Office365-Filtering-Correlation-Id: 7817f85b-10d4-4e85-a202-08deff4ecc9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|18002099003|22082099003|56012099006|3023799007|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	4KsAU0xoRc8ewpfc7/a1oLueyYnemrZpzLAGhgk+zfxpTsCUAPjSWNwLKVmwGzdzAx9O6sA4fKcAewPijxA4du7uIHDo56fxoC1gIJ/CbA4UXR4pq1g5DDFTVjAHo1rjewkDc5P3HJAwW13V9glo8khJusJkXRoDRqzH/NeBLP5YsXQ3damknSLXhbJgLuCbCf+itysydQ6fS31jEV4K7HWaowLg4ktqYpUqCw/p8ZdBKfDuUsIXfxIVykgVgYtJATXWdSFxoXT4E9X+wb1soXgyEPm/O/8D0zoMwQE11jCWcz5YQ3aI0CcR+koEZ9hmJ9/mTB8vDr0D37CHZTA809D76/QlGDHA51pULY/mm/n8imIsg8gRNVYV2U5iVUAVq+rr0lqGoNrWjy+5a5sWiKoec/VhrADxwsd9YrGAdZDozIJcwuiJoQxhTLyY2lW+8t3EhJqU7Hm+TlxXQwcu5a1aKIC3+jeXrOhGDdMG1XMcn4lz1z7kjEJC6xr/FFYg4SW6XjRSzuUqyM8NURi23zF9Tsuw7G0llS2Nb+8CFsiG3mhKqLAIprgU4wgjm+D/Z2z9NsOIRHdGnRhmDkLYVdJLpEPUekam5v+9t0qRDfd1oh4dCzSVnyhUNr4j+tD9mjsww9FR0aRDl+1ptFHVaSMSczsJdzfwFu26OVAeC9dbOCdonslwr+MSZlfloMDhTHMV173o9nBruYmnlvvW/g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kw/dYi6eJSwpBOhGe2pSs7ObTlyBbdLKDfjY+edf8vrhzzbXuu4prgX5gA/6kcCoFwMxVxEP3e0091SZ49pUxkZEhRH5wbARj70G+BQZkzXFsSHkma41nGZvjFyQfanbCDZBW/1bMFTgwTmgPSa3RFRoCnmdwG7GQajgvIjW4CCoL6mxejrnUIkx3lZDroFJ1JmgyEfJdvMO3hz1RA84shqMO7Ox2mt/3iSKGuYnezyDUT2NV7nISmYWdlTUSIYA3PlbOk0AOpgtvkoUpktd3g9XGJNc/zEDdZXI2B+LzoPQTKpPNMEYwzsk3KuVnN8jT6sz0UAuS9EdW8UOx2cfjJLTqNYtAEp1Lj0YGzT0buoWvKUrm3tq3HoHB8K8Wi8yRG7DJ3IZQqf3KJf1pOH6EhpKSP6ILeqGIe7nAHjAq5myOnVspAPUhPpbcvil1UGR
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 06:38:23.7738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7817f85b-10d4-4e85-a202-08deff4ecc9c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4108

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

