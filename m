Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021104.outbound.protection.outlook.com [40.107.57.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A8B471277;
	Thu,  6 Aug 2026 12:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017788; cv=fail; b=MRPA3ZbAxnyRC0+dES9MNKjdGATwnhk8ttQo8geaQq/YNnpHOFPKbb0AmEfFDh3z4aCBJlpz1KjqtvDvBSx2F/twqvWX9xyFiRlrtwee6Onkh+3X8iMJedAiM8fGnfewrraI/o8Kwdl4jlWbwBLXB/Qyxqv2IogvNW/EhYJVKjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017788; c=relaxed/simple;
	bh=KjNn5B2E5gyyMFLnQxv+IOoYxhjPABtFU9FlMj+3elE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EXKiCXvT5bsYz5CKOPoynvkc0qhV6J/uo2i0Aqe3EnUkCoBc74KSNYogXmdSyYj8J0oh7D2iO/tJo6FmucKYggVeJKoa8me6dsa1RDuJ4rKXj8CF9bRhHP6Cjr/NykyOS3C7FBb+FXGkRzZ129lsBxkIvWPW3w3XbOTVXBq38ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Z1XeFgbg reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Z1XeFgbg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWSkIM3Pe5Dty+va9c2XFTPtCU/FTgwvXH3vnuYHn2a4sWQyEwfukrWqZaNcNgc2F6MZnYcXCMlgSr6yxDZ1geGkiVb++TYNmw02kuFQVPARRBreZacT9P5OUfnaXfQUlNZhPT4zL3Gx8dIlUtJ/fn3MM3o/7tv5dljtb8Quezc4g+g4KiUZSQEhmOPT1/YUkckl1cwkdYIJGyTEZjzcY03K0mtDw9lwPA6Q2PzJpReGHSChJz+mL9r6Wqj/+mxzF9TDvdemr6NVAeAmkyaNN2zcaz65w2SRklQ2Pis2yZzTKWEBjd+4dSwgTeUAVBG+Q+VmGR/x6ykDal/WD4AGbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ML7kGbF7SCzxJHfC16iCrlYkZKqAHBfeGvNTDVe2VU=;
 b=hyvaAH8wArAP7WAMFqOFmn6h16Q1LNEvX1Oow97Th/Qa/RqMccs8Lqhmxe4wWvzgRcr+7UprBhvEZA4jtjR9iw9Ay0XqGLi5o5iYJBGyOUinoyBxkpY7pwDDvZAkJzgoEJT16sKAbbVgNrUk54VTnEH8DSlr4TRqVQohR8TTBnoTBc0BHNVRsKUfTqrw02M2OdAEQWeW3kCSd7aIBPZ4KdD2anrcrX77Kdiz36sBjvgnXFlAWSRIOYZafCTrjBouq8e1IK4VVvD3W+Q1bYzggz8Mevz9yW5pkWyx9MCTm15I6efKvx43ETeAO5KvTCuKRm+Upyel0gOz6JMNhWL0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ML7kGbF7SCzxJHfC16iCrlYkZKqAHBfeGvNTDVe2VU=;
 b=Z1XeFgbgweeGnOaR6RbTK0XD+tPvjjrMMpJ18OBXYHXG5tRB53zSar9/ImWi8qfLd4zdv4uYS1k/vGzuHmblIEKvS8pZnFCVkKEw0lG+HfPef9b3dBgwf5VpBIAMvUv92QYqkjmIvkQ1lrCw7JEawYcHV6EvzYHKA5vVkdmSVGCZ771q3aGFRAkx4hwzBcXyMixMotzuLTuIdEid1oJ/MwF80R9KO19cxhuNE/hbhDo2kzPV9rFzldrrz6suBaaoG5UDSikDsKkymkwTGnBU5CMcF1aQlSZV9kqSXJURVbirjkaL6qGzdU0GtGhwT/JoCQnPHf/1x1sfspcDctEluw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PNWP287MB6109.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:345::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:03:02 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 12:03:02 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Kate Hsuan <hpa@redhat.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 2/3] media: i2c: add imx576 image sensor driver
Date: Thu,  6 Aug 2026 17:32:08 +0530
Message-Id: <20260806120216.24145-3-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io>
References: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0246.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::16) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PNWP287MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bef0e94-d0cd-43f1-43cc-08def3b2aa71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|23010399003|56012099006|10067099003|6133799003|3023799007|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	pmBh6wrBRbTnLXz1JlPm1bezewtVP8cyYfpL0TeQbGzPydEUQ3m+lVLXDm8i9whI8EPyvPMQupg5oIW/dNtCsKp2CExEZf+/dIn3vSsYC74u2qOEOqmdcEQxDrD0S4O2CQAH/AEv8im6bPd1XQQjzJ/brfeHhbsKMjgMXPO+xvmu1rVtMlDpkMIOzJ5DuuO4APD2Nn2HsrGERsZEZlAcEwhv5511dtZEDdt92iBalxVwRUIgcaa17GRyozAGDxMJdTSGLqVduvHs8R4veuxRa/lTetwBbutsrd4XwKhi5oCzJTXAqfK1IhyeyHxMSG7GZp3FEzhMWRBjuXrGYeZCpJ0O7Ov5uzz3VCo9WKfuZeqogclCUiOf2+1leNSjzL94X0rZfTesOcadzc72fV8YOKE5XxTxTj+PNYNBXrERMGfK9kUbPTOTIX99ZoKty8xOpl1r42cvsMcLNui+K2e70LvvA5GNT5/Qxdlf0K1hEtnndimpkE/9ntDshOlsd0vXEJFGjmfMQRNMDZnbnhyYiQBxGClvvzfu9O9drfn70M3KbJ/A7FWU7uZ4kdISe58K9Sl8/UaQ1jPVEqjNWxJut5d0BuNyK2kF1jKiqtAaPG05urv8hQjZjskjGaw6Z6Za3VCMvoU4ugcNredXKRzILmtNWvqut2xMoND6Xqb6QMyBnpqDrgW6yl93M7dyTm7gMHrRy9jA0kXfMVbQ63Y+YAoE6117aE/wi2+6Job0Fow=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(23010399003)(56012099006)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nqMWOC0cf/JRo/iA+44sIfOPeB79UWs1Us7JasKk6cyTQ3GZQgHpz81+RJKu?=
 =?us-ascii?Q?xbV9ekU9ZIfe5k9zvIW55BJVjWqnKGYPslF3HAy8kZGihYBFCdww3DcPIUvW?=
 =?us-ascii?Q?Rmc927Nd6whGOESoQxd+tU7g/bwbeqtTDC3ZcGNIf+gTqh1mnUggBz27+nC0?=
 =?us-ascii?Q?XzafuYBjwmzTMsU4QAxTGn7+WLC2cu/yDEe1HTtGnMm2s9U4os+D51riHJl2?=
 =?us-ascii?Q?Y4m34NDTZtYs2/DUMbWbrdLuDEbDaTyduW9ZvWl0VIQNgVSHa7rvYfXkvxqd?=
 =?us-ascii?Q?qZN3JdiKOLDhiCySV4NiTmzdOEpORfiU3nUuZo25PUC7FAwFHgWJux/6thC3?=
 =?us-ascii?Q?+PldFHyVjoELxGIEpWRV8bTtVvT/1ArGYrV2dBm5UkyRu+vYrhm9wBXqC+F1?=
 =?us-ascii?Q?pYofBP+5AK1suTw+oWNvVqaAfJaMQ0QzjybhjqEOjlCDNes898ehBptoDCWB?=
 =?us-ascii?Q?vBLhD0DHRgK+6LsZ6fwDJ5hvw0QThdJBoYmFWnAVSkkA4PfSRnM8ZEkd0o0H?=
 =?us-ascii?Q?sGzWLxLAg9ajKPW3k0rLtoGARGY4C9NvG55qDRnjVxXpKCAtB3nE0n0dG86c?=
 =?us-ascii?Q?vehoLWmfhsuEq5tvA8hzbOj6Ny82TUDQ8yxHoMW3cgrGwQTzL2vj+F4UeA4L?=
 =?us-ascii?Q?4n2AveYu6/iv+IEqp+XtY0AGRMpqOIgskAB6M3eZA4Q9xauoUAI4nMc0dVLB?=
 =?us-ascii?Q?+mrXcIcOSpOxDBS3/YExOM5iNs6RIklepaJyUYzJxZwKwLtr8z4q/ockRYdH?=
 =?us-ascii?Q?semglQJaXTsbd5TxeubMd71iK4AuEP1k60pQzLUmBfD/VzgSIadM7T7Srb2W?=
 =?us-ascii?Q?op8pmlcvHq3rZMutLiC0dtlPaoWE/Cnvm501aRZFKFzThlAt2tHWUlw3F+NS?=
 =?us-ascii?Q?b0/3BDA+mjEprN3bEbpdMByCgS476yNynNxTRFHj/VqKWhO84WdvAAH3blNS?=
 =?us-ascii?Q?TQ8XB9Sn98G44vNyG9z6hExYiQHVMp4+7QoxmHuuvEcVikjidnC+GRzbqeR3?=
 =?us-ascii?Q?Qe6x9PR6d9O8/TTLg3/421EVbM6NZvf3QqIP5BvO8t7pAjYeabcdeAZPn1aO?=
 =?us-ascii?Q?DJWrWR21hErmv8yrVXWchRkIvoLN6bUKxqk4tUtjD8cs+iJpyuREnudejIoJ?=
 =?us-ascii?Q?d/QlnzPkBeW1AtHq4wjJb5qH2lE9tsT5rZ+1g19LVquA17Xt348AeVPmMwY5?=
 =?us-ascii?Q?BITNW+CunC9z9qvPS7fqW1WLNSTMWLhxsB4yuRJHfBrd1IKyDilqVhmnMBEx?=
 =?us-ascii?Q?dS4cz5HHOeArN/0ClVA5D1Eas2NhgXHRwT8XKu7uaqHQemJjddvuit5+0nfH?=
 =?us-ascii?Q?s+xYQ7XI/U1BWTGJNf0iwJl5P5FqPhcp6g01b764aDaLRuiP0z+IcKLBcttj?=
 =?us-ascii?Q?iVRoBzfv59PE4KXdh8j8vcO5bpsmQN0syZdC79TcCtHyEUQ61UoLBqPge5VN?=
 =?us-ascii?Q?l08e5uIin1EGSkXA3+D4S8d7u+ayo7nMnqTSkeCvbHQf9VWSXCcs17e4TJrJ?=
 =?us-ascii?Q?Bobqy1yTmpSuAzB/4CrWM0HapVk1VVOZWeCglEksIWZ1V+mzkJlS5oNv6I0S?=
 =?us-ascii?Q?+nuhOeMER64q8SbvDFZWvKYAnqpKdThObdORiYlXDv9CZJTeTmBOQlfoXAcv?=
 =?us-ascii?Q?FC2SBqJzFmXasC8G78DJ5E9CXnWXPL5tD8NI1F+zt5x4os7iDYtArrnnBFcd?=
 =?us-ascii?Q?ZV8R1vFIPGvziNXzL3BMoYDIW+S0M/viu45/M0i583q+2j21zpGqSX+umzNE?=
 =?us-ascii?Q?cAm0n3Yj4wpq//ZVG+eIru9wPnGkoZ7LkFvi2KMLKXQjoOjbdcHC?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bef0e94-d0cd-43f1-43cc-08def3b2aa71
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:03:02.3958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHYCN7Va7hyLrmyjJBudDJ6QsFp1UxHdOwVbUR0HWitaFJtDYbCs7j82+2bQXBRu1NEXsIEZ9VyVUyLFKapAwL4OKKOWGvSBINQaTci4wrRi55eKH/y3vv+5H8XK/UAn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNWP287MB6109

Add a v4l2 subdevice driver for the Sony imx576 sensor.

The Sony IMX576 image sensor with an active
array size of 5760 x 4312

The following features are supported:
- Manual exposure an gain control support
- vblank/hblank control support
- Supported resolution: 5760 x 4312 30fps (SRGGB10)

Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---
 MAINTAINERS                |    1 +
 drivers/media/i2c/Kconfig  |   10 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/imx576.c | 1054 ++++++++++++++++++++++++++++++++++++
 4 files changed, 1066 insertions(+)
 create mode 100644 drivers/media/i2c/imx576.c

diff --git a/MAINTAINERS b/MAINTAINERS
index faf5753be337..81f25c74be8b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25443,6 +25443,7 @@ M:	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
+F:	drivers/media/i2c/imx576.c

 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index fc2954098eaf..05d1e69c2f33 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -288,6 +288,16 @@ config VIDEO_IMX415
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx415.

+config VIDEO_IMX576
+        tristate "Sony IMX576 sensor support"
+        select V4L2_CCI_I2C
+        help
+          This is a Video4Linux2 sensor driver for the Sony
+          IMX576 camera.
+
+          To compile this driver as a module, choose M here: the
+          module will be called imx576.
+
 config VIDEO_MAX9271_LIB
 	tristate

diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index d04bd5724552..57cf6a169441 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_IMX412) += imx412.o
 obj-$(CONFIG_VIDEO_IMX415) += imx415.o
 obj-$(CONFIG_VIDEO_IMX678) += imx678.o
 obj-$(CONFIG_VIDEO_IMX471) += imx471.o
+obj-$(CONFIG_VIDEO_IMX576) += imx576.o
 obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
 obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
 obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
diff --git a/drivers/media/i2c/imx576.c b/drivers/media/i2c/imx576.c
new file mode 100644
index 000000000000..24ed60ffe234
--- /dev/null
+++ b/drivers/media/i2c/imx576.c
@@ -0,0 +1,1054 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * V4L2 Support for the IMX576
+ *
+ * Copyright (C) 2026 Silicon Signals Pvt. Ltd.
+ *
+ * Copyright (C) 2024 Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/device/devres.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/types.h>
+#include <linux/time.h>
+#include <linux/units.h>
+
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mediabus.h>
+
+#define IMX576_INCLK_RATE		(24 * HZ_PER_MHZ)
+
+#define IMX576_REG_CHIP_ID		CCI_REG16(0x0016)
+#define IMX576_CHIP_ID			0x0576
+
+#define IMX576_REG_MODE_SELECT		CCI_REG8(0x0100)
+#define IMX576_MODE_STANDBY		0x00
+#define IMX576_MODE_STREAMING		0x01
+
+#define IMX576_REG_HOLD			CCI_REG8(0x0104)
+
+#define IMX576_REG_EXPOSURE		CCI_REG16(0x0202)
+#define IMX576_EXPOSURE_MIN		8
+#define IMX576_EXPOSURE_OFFSET		22
+#define IMX576_EXPOSURE_STEP		1
+#define IMX576_EXPOSURE_DEFAULT		0x0648
+
+#define IMX576_REG_ANALOG_GAIN		CCI_REG16(0x0204)
+#define IMX576_ANA_GAIN_MIN		0
+#define IMX576_ANA_GAIN_MAX		978
+#define IMX576_ANA_GAIN_STEP		1
+#define IMX576_ANA_GAIN_DEFAULT		0
+
+#define IMX576_REG_IVT_PXCK_DIV		CCI_REG8(0x0301)
+#define IMX576_REG_IVT_SYCK_DIV		CCI_REG8(0x0303)
+#define IMX576_REG_IVT_PREPLLCK_DIV	CCI_REG8(0x0305)
+#define IMX576_REG_IVT_PLL_MPY		CCI_REG16(0x0306)
+#define IMX576_REG_IOP_SYCK_DIV		CCI_REG8(0x030b)
+#define IMX576_REG_IOP_PREPLLCK_DIV	CCI_REG8(0x030d)
+#define IMX576_REG_IOP_PLL_MPY		CCI_REG16(0x030e)
+#define IMX576_REG_PLL_MULT_DRIV	CCI_REG8(0x0310)
+
+#define IMX576_REG_FRM_LENGTH_LINES	CCI_REG16(0x0340)
+#define IMX576_REG_LINE_LENGTH_PCK	CCI_REG16(0x0342)
+#define IMX576_LINE_LENGTH		6144
+#define IMX576_VBLANK_DEF		4387
+
+/* FIXME: Exact VBLANK limit unknown (no datasheet). */
+#define IMX576_VBLANK_MAX		32420
+
+#define IMX576_REG_X_ADD_STA		CCI_REG16(0x0344)
+#define IMX576_REG_Y_ADD_STA		CCI_REG16(0x0346)
+#define IMX576_REG_X_ADD_END		CCI_REG16(0x0348)
+#define IMX576_REG_Y_ADD_END		CCI_REG16(0x034a)
+#define IMX576_REG_X_OUTPUT_SIZE	CCI_REG16(0x034c)
+#define IMX576_REG_Y_OUTPUT_SIZE	CCI_REG16(0x034e)
+
+#define IMX576_REG_DIG_CROP_X_OFFSET	CCI_REG16(0x0408)
+#define IMX576_REG_DIG_CROP_Y_OFFSET	CCI_REG16(0x040a)
+#define IMX576_REG_DIG_CROP_WIDTH	CCI_REG16(0x040c)
+#define IMX576_REG_DIG_CROP_HEIGHT	CCI_REG16(0x040e)
+
+#define IMX576_REG_BINNING_MODE		CCI_REG8(0x0900)
+#define IMX576_REG_BINNING_TYPE		CCI_REG8(0x0901)
+#define IMX576_REG_BINNING_WEIGHT	CCI_REG8(0x0902)
+
+#define IMX576_PIXEL_RATE		813600000
+#define IMX576_NUM_DATA_LANES		4
+
+/* IMX576 native and active pixel array size */
+static const struct v4l2_rect imx576_native_area = {
+	.top = 0,
+	.left = 0,
+	.width = 5792,
+	.height = 4464,
+};
+
+static const struct v4l2_rect imx576_active_area = {
+	.top = 136,
+	.left = 16,
+	.width = 5760,
+	.height = 4312,
+};
+
+static const char * const imx576_supply_names[] = {
+	"vana",		/* Analog Power */
+	"vif",		/* Interface Power */
+	"vdig",		/* Digital Power */
+};
+
+static const struct cci_reg_sequence imx576_common_regs[] = {
+	{ CCI_REG8(0x0136), 0x18 },
+	{ CCI_REG8(0x0137), 0x00 },
+	{ CCI_REG8(0x3c7e), 0x05 },
+	{ CCI_REG8(0x3c7f), 0x07 },
+	{ CCI_REG8(0x380d), 0x80 },
+	{ CCI_REG8(0x3c00), 0x1a },
+	{ CCI_REG8(0x3c01), 0x1a },
+	{ CCI_REG8(0x3c02), 0x1a },
+	{ CCI_REG8(0x3c03), 0x1a },
+	{ CCI_REG8(0x3c04), 0x1a },
+	{ CCI_REG8(0x3c05), 0x01 },
+	{ CCI_REG8(0x3c08), 0xff },
+	{ CCI_REG8(0x3c09), 0xff },
+	{ CCI_REG8(0x3c0a), 0x01 },
+	{ CCI_REG8(0x3c0d), 0xff },
+	{ CCI_REG8(0x3c0e), 0xff },
+	{ CCI_REG8(0x3c0f), 0x20 },
+	{ CCI_REG8(0x3f89), 0x01 },
+	{ CCI_REG8(0x4b8e), 0x18 },
+	{ CCI_REG8(0x4b8f), 0x10 },
+	{ CCI_REG8(0x4ba8), 0x08 },
+	{ CCI_REG8(0x4baa), 0x08 },
+	{ CCI_REG8(0x4bab), 0x08 },
+	{ CCI_REG8(0x4bc9), 0x10 },
+	{ CCI_REG8(0x5511), 0x01 },
+	{ CCI_REG8(0x560b), 0x5b },
+	{ CCI_REG8(0x56a7), 0x60 },
+	{ CCI_REG8(0x5b3b), 0x60 },
+	{ CCI_REG8(0x5ba7), 0x60 },
+	{ CCI_REG8(0x6002), 0x00 },
+	{ CCI_REG8(0x6014), 0x01 },
+	{ CCI_REG8(0x6118), 0x0a },
+	{ CCI_REG8(0x6122), 0x0a },
+	{ CCI_REG8(0x6128), 0x0a },
+	{ CCI_REG8(0x6132), 0x0a },
+	{ CCI_REG8(0x6138), 0x0a },
+	{ CCI_REG8(0x6142), 0x0a },
+	{ CCI_REG8(0x6148), 0x0a },
+	{ CCI_REG8(0x6152), 0x0a },
+	{ CCI_REG8(0x617b), 0x04 },
+	{ CCI_REG8(0x617e), 0x04 },
+	{ CCI_REG8(0x6187), 0x04 },
+	{ CCI_REG8(0x618a), 0x04 },
+	{ CCI_REG8(0x6193), 0x04 },
+	{ CCI_REG8(0x6196), 0x04 },
+	{ CCI_REG8(0x619f), 0x04 },
+	{ CCI_REG8(0x61a2), 0x04 },
+	{ CCI_REG8(0x61ab), 0x04 },
+	{ CCI_REG8(0x61ae), 0x04 },
+	{ CCI_REG8(0x61b7), 0x04 },
+	{ CCI_REG8(0x61ba), 0x04 },
+	{ CCI_REG8(0x61c3), 0x04 },
+	{ CCI_REG8(0x61c6), 0x04 },
+	{ CCI_REG8(0x61cf), 0x04 },
+	{ CCI_REG8(0x61d2), 0x04 },
+	{ CCI_REG8(0x61db), 0x04 },
+	{ CCI_REG8(0x61de), 0x04 },
+	{ CCI_REG8(0x61e7), 0x04 },
+	{ CCI_REG8(0x61ea), 0x04 },
+	{ CCI_REG8(0x61f3), 0x04 },
+	{ CCI_REG8(0x61f6), 0x04 },
+	{ CCI_REG8(0x61ff), 0x04 },
+	{ CCI_REG8(0x6202), 0x04 },
+	{ CCI_REG8(0x620b), 0x04 },
+	{ CCI_REG8(0x620e), 0x04 },
+	{ CCI_REG8(0x6217), 0x04 },
+	{ CCI_REG8(0x621a), 0x04 },
+	{ CCI_REG8(0x6223), 0x04 },
+	{ CCI_REG8(0x6226), 0x04 },
+	{ CCI_REG8(0x6b0b), 0x02 },
+	{ CCI_REG8(0x6b0c), 0x01 },
+	{ CCI_REG8(0x6b0d), 0x05 },
+	{ CCI_REG8(0x6b0f), 0x04 },
+	{ CCI_REG8(0x6b10), 0x02 },
+	{ CCI_REG8(0x6b11), 0x06 },
+	{ CCI_REG8(0x6b12), 0x03 },
+	{ CCI_REG8(0x6b13), 0x07 },
+	{ CCI_REG8(0x6b14), 0x0d },
+	{ CCI_REG8(0x6b15), 0x09 },
+	{ CCI_REG8(0x6b16), 0x0c },
+	{ CCI_REG8(0x6b17), 0x08 },
+	{ CCI_REG8(0x6b18), 0x0e },
+	{ CCI_REG8(0x6b19), 0x0a },
+	{ CCI_REG8(0x6b1a), 0x0f },
+	{ CCI_REG8(0x6b1b), 0x0b },
+	{ CCI_REG8(0x6b1c), 0x01 },
+	{ CCI_REG8(0x6b1d), 0x05 },
+	{ CCI_REG8(0x6b1f), 0x04 },
+	{ CCI_REG8(0x6b20), 0x02 },
+	{ CCI_REG8(0x6b21), 0x06 },
+	{ CCI_REG8(0x6b22), 0x03 },
+	{ CCI_REG8(0x6b23), 0x07 },
+	{ CCI_REG8(0x6b24), 0x0d },
+	{ CCI_REG8(0x6b25), 0x09 },
+	{ CCI_REG8(0x6b26), 0x0c },
+	{ CCI_REG8(0x6b27), 0x08 },
+	{ CCI_REG8(0x6b28), 0x0e },
+	{ CCI_REG8(0x6b29), 0x0a },
+	{ CCI_REG8(0x6b2a), 0x0f },
+	{ CCI_REG8(0x6b2b), 0x0b },
+	{ CCI_REG8(0x7948), 0x01 },
+	{ CCI_REG8(0x7949), 0x06 },
+	{ CCI_REG8(0x794b), 0x04 },
+	{ CCI_REG8(0x794c), 0x04 },
+	{ CCI_REG8(0x794d), 0x3a },
+	{ CCI_REG8(0x7951), 0x00 },
+	{ CCI_REG8(0x7952), 0x01 },
+	{ CCI_REG8(0x7955), 0x00 },
+	{ CCI_REG8(0x9004), 0x10 },
+	{ CCI_REG8(0x9200), 0xa0 },
+	{ CCI_REG8(0x9201), 0xa7 },
+	{ CCI_REG8(0x9202), 0xa0 },
+	{ CCI_REG8(0x9203), 0xaa },
+	{ CCI_REG8(0x9204), 0xa0 },
+	{ CCI_REG8(0x9205), 0xad },
+	{ CCI_REG8(0x9206), 0xa0 },
+	{ CCI_REG8(0x9207), 0xb0 },
+	{ CCI_REG8(0x9208), 0xa0 },
+	{ CCI_REG8(0x9209), 0xb3 },
+	{ CCI_REG8(0x920a), 0xb7 },
+	{ CCI_REG8(0x920b), 0x34 },
+	{ CCI_REG8(0x920c), 0xb7 },
+	{ CCI_REG8(0x920d), 0x36 },
+	{ CCI_REG8(0x920e), 0xb7 },
+	{ CCI_REG8(0x920f), 0x37 },
+	{ CCI_REG8(0x9210), 0xb7 },
+	{ CCI_REG8(0x9211), 0x38 },
+	{ CCI_REG8(0x9212), 0xb7 },
+	{ CCI_REG8(0x9213), 0x39 },
+	{ CCI_REG8(0x9214), 0xb7 },
+	{ CCI_REG8(0x9215), 0x3a },
+	{ CCI_REG8(0x9216), 0xb7 },
+	{ CCI_REG8(0x9217), 0x3c },
+	{ CCI_REG8(0x9218), 0xb7 },
+	{ CCI_REG8(0x9219), 0x3d },
+	{ CCI_REG8(0x921a), 0xb7 },
+	{ CCI_REG8(0x921b), 0x3e },
+	{ CCI_REG8(0x921c), 0xb7 },
+	{ CCI_REG8(0x921d), 0x3f },
+	{ CCI_REG8(0x921e), 0x7f },
+	{ CCI_REG8(0x921f), 0x77 },
+	{ CCI_REG8(0x99af), 0x0f },
+	{ CCI_REG8(0x99b0), 0x0f },
+	{ CCI_REG8(0x99b1), 0x0f },
+	{ CCI_REG8(0x99b2), 0x0f },
+	{ CCI_REG8(0x99b3), 0x0f },
+	{ CCI_REG8(0x99e1), 0x0f },
+	{ CCI_REG8(0x99e2), 0x0f },
+	{ CCI_REG8(0x99e3), 0x0f },
+	{ CCI_REG8(0x99e4), 0x0f },
+	{ CCI_REG8(0x99e5), 0x0f },
+	{ CCI_REG8(0x99e6), 0x0f },
+	{ CCI_REG8(0x99e7), 0x0f },
+	{ CCI_REG8(0x99e8), 0x0f },
+	{ CCI_REG8(0x99e9), 0x0f },
+	{ CCI_REG8(0x99ea), 0x0f },
+	{ CCI_REG8(0xe286), 0x31 },
+	{ CCI_REG8(0xe2a6), 0x32 },
+	{ CCI_REG8(0xe2c6), 0x33 },
+	{ CCI_REG8(0x4038), 0x00 },
+	{ CCI_REG8(0x9856), 0xa0 },
+	{ CCI_REG8(0x9857), 0x78 },
+	{ CCI_REG8(0x9858), 0x64 },
+	{ CCI_REG8(0x986e), 0x64 },
+	{ CCI_REG8(0x9870), 0x3c },
+	{ CCI_REG8(0x993a), 0x0e },
+	{ CCI_REG8(0x993b), 0x0e },
+	{ CCI_REG8(0x9953), 0x08 },
+	{ CCI_REG8(0x9954), 0x08 },
+	{ CCI_REG8(0x996b), 0x0f },
+	{ CCI_REG8(0x996d), 0x0f },
+	{ CCI_REG8(0x996f), 0x0f },
+	{ CCI_REG8(0x998e), 0x0f },
+	{ CCI_REG8(0xa101), 0x01 },
+	{ CCI_REG8(0xa103), 0x01 },
+	{ CCI_REG8(0xa105), 0x01 },
+	{ CCI_REG8(0xa107), 0x01 },
+	{ CCI_REG8(0xa109), 0x01 },
+	{ CCI_REG8(0xa10b), 0x01 },
+	{ CCI_REG8(0xa10d), 0x01 },
+	{ CCI_REG8(0xa10f), 0x01 },
+	{ CCI_REG8(0xa111), 0x01 },
+	{ CCI_REG8(0xa113), 0x01 },
+	{ CCI_REG8(0xa115), 0x01 },
+	{ CCI_REG8(0xa117), 0x01 },
+	{ CCI_REG8(0xa119), 0x01 },
+	{ CCI_REG8(0xa11b), 0x01 },
+	{ CCI_REG8(0xa11d), 0x01 },
+	{ CCI_REG8(0xaa58), 0x00 },
+	{ CCI_REG8(0xaa59), 0x01 },
+	{ CCI_REG8(0xab03), 0x10 },
+	{ CCI_REG8(0xab04), 0x10 },
+	{ CCI_REG8(0xab05), 0x10 },
+	{ CCI_REG8(0xad6a), 0x03 },
+	{ CCI_REG8(0xad6b), 0xff },
+	{ CCI_REG8(0xad77), 0x00 },
+	{ CCI_REG8(0xad82), 0x03 },
+	{ CCI_REG8(0xad83), 0xff },
+	{ CCI_REG8(0xae06), 0x04 },
+	{ CCI_REG8(0xae07), 0x16 },
+	{ CCI_REG8(0xae08), 0xff },
+	{ CCI_REG8(0xae09), 0x04 },
+	{ CCI_REG8(0xae0a), 0x16 },
+	{ CCI_REG8(0xae0b), 0xff },
+	{ CCI_REG8(0xaf01), 0x04 },
+	{ CCI_REG8(0xaf03), 0x0a },
+	{ CCI_REG8(0xaf05), 0x18 },
+	{ CCI_REG8(0xb048), 0x0a },
+	{ CCI_REG8(0x0112), 0x0a },
+	{ CCI_REG8(0x0113), 0x0a },
+	{ CCI_REG8(0x0114), 0x03 },
+	{ CCI_REG8(0x0342), 0x18 },
+	{ CCI_REG8(0x0343), 0x00 },
+	{ CCI_REG8(0x0220), 0x00 },
+	{ CCI_REG8(0x3140), 0x00 },
+	{ CCI_REG8(0x3246), 0x01 },
+	{ CCI_REG8(0x3247), 0x01 },
+	{ CCI_REG8(0x0401), 0x00 },
+	{ CCI_REG8(0x0404), 0x00 },
+	{ CCI_REG8(0x0405), 0x10 },
+	{ IMX576_REG_IVT_PXCK_DIV, 0x05 },
+	{ IMX576_REG_IVT_SYCK_DIV, 0x02 },
+	{ IMX576_REG_IVT_PREPLLCK_DIV, 0x04 },
+	{ IMX576_REG_IVT_PLL_MPY, 0x0154 },
+	{ IMX576_REG_IOP_SYCK_DIV, 0x01 },
+	{ IMX576_REG_IOP_PREPLLCK_DIV, 0x04 },
+	{ IMX576_REG_PLL_MULT_DRIV, 0x01 },
+	{ CCI_REG8(0x0b06), 0x01 },
+	{ CCI_REG8(0x3620), 0x01 },
+	{ CCI_REG8(0x3f0c), 0x00 },
+};
+
+struct imx576 {
+	struct device *dev;
+	struct regmap *regmap;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct gpio_desc *reset_gpio;
+	struct clk *inclk;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(imx576_supply_names)];
+
+	/* V4L2 Controls */
+	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *gain;
+
+	u32 link_freq_index;
+
+	unsigned long link_freq_bitmap;
+};
+
+struct imx576_reg_list {
+	u32 num_of_regs;
+	const struct cci_reg_sequence *regs;
+};
+
+enum {
+	IMX576_LINK_FREQ_1017MHZ,
+};
+
+static const s64 link_freqs[] = {
+	[IMX576_LINK_FREQ_1017MHZ] = 1017000000,
+};
+
+static const struct cci_reg_sequence link_1017Mhz_regs[] = {
+	{ IMX576_REG_IOP_PLL_MPY, 0x0153 },
+};
+
+static const struct imx576_reg_list link_freq_regs[] = {
+	[IMX576_LINK_FREQ_1017MHZ] = {
+		.regs = link_1017Mhz_regs,
+		.num_of_regs = ARRAY_SIZE(link_1017Mhz_regs)
+	},
+};
+
+static const u32 imx576_mbus_codes[] = {
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+};
+
+static inline struct imx576 *to_imx576(struct v4l2_subdev *sd)
+{
+	return container_of_const(sd, struct imx576, sd);
+}
+
+static int imx576_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct imx576 *imx576 = container_of_const(ctrl->handler,
+						   struct imx576, handler);
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
+
+	state = v4l2_subdev_get_locked_active_state(&imx576->sd);
+	fmt = v4l2_subdev_state_get_format(state, 0);
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		/* Honour the VBLANK limits when setting exposure */
+		ret = __v4l2_ctrl_modify_range(imx576->exposure,
+					       IMX576_EXPOSURE_MIN,
+					       fmt->height + ctrl->val -
+					       IMX576_EXPOSURE_OFFSET,
+					       IMX576_EXPOSURE_STEP,
+					       IMX576_EXPOSURE_DEFAULT);
+		if (ret)
+			return ret;
+	}
+
+	if (pm_runtime_get_if_active(imx576->dev) == 0)
+		return 0;
+
+	cci_write(imx576->regmap, IMX576_REG_HOLD, 1, &ret);
+
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK: {
+		u64 vmax = fmt->height + ctrl->val;
+
+		cci_write(imx576->regmap, IMX576_REG_FRM_LENGTH_LINES, vmax, &ret);
+		break;
+	}
+	case V4L2_CID_EXPOSURE:
+		cci_write(imx576->regmap, IMX576_REG_EXPOSURE, ctrl->val, &ret);
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		cci_write(imx576->regmap, IMX576_REG_ANALOG_GAIN,
+			  ctrl->val, &ret);
+		break;
+	default:
+		dev_err(imx576->dev, "Invalid control %d\n", ctrl->id);
+		ret = -EINVAL;
+		break;
+	}
+
+	cci_write(imx576->regmap, IMX576_REG_HOLD, 0, &ret);
+
+	pm_runtime_put(imx576->dev);
+
+	return ret;
+}
+
+static int imx576_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(imx576_mbus_codes))
+		return -EINVAL;
+
+	code->code = imx576_mbus_codes[code->index];
+
+	return 0;
+}
+
+static int imx576_set_pad_format(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct imx576 *imx576 = to_imx576(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
+	int ret;
+
+	fmt->format.width = imx576_active_area.width;
+	fmt->format.height = imx576_active_area.height;
+	fmt->format.code = imx576_mbus_codes[0];
+	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	fmt->format.quantization = V4L2_QUANTIZATION_DEFAULT;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
+
+	format = v4l2_subdev_state_get_format(sd_state, 0);
+
+	*format = fmt->format;
+
+	crop = v4l2_subdev_state_get_crop(sd_state, 0);
+	*crop = imx576_active_area;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		u32 vblank_def = IMX576_VBLANK_DEF - imx576_active_area.height;
+
+		ret = __v4l2_ctrl_modify_range(imx576->vblank, vblank_def,
+					       IMX576_VBLANK_MAX, 1, vblank_def);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int imx576_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r = imx576_native_area;
+		return 0;
+	case V4L2_SEL_TGT_CROP: {
+		struct v4l2_rect *crop;
+
+		crop = v4l2_subdev_state_get_crop(sd_state, sel->pad);
+		sel->r = *crop;
+
+		return 0;
+	}
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r = imx576_active_area;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int imx576_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_size_enum *fsize)
+{
+	if (fsize->index > 0)
+		return -EINVAL;
+
+	if (fsize->code != imx576_mbus_codes[0])
+		return -EINVAL;
+
+	fsize->min_width = imx576_active_area.width;
+	fsize->max_width = fsize->min_width;
+	fsize->min_height = imx576_active_area.height;
+	fsize->max_height = fsize->min_height;
+
+	return 0;
+}
+
+static int imx576_program_window(struct imx576 *imx576,
+				 struct v4l2_subdev_state *state)
+{
+	const struct v4l2_rect *crop;
+	const struct v4l2_mbus_framefmt *format;
+	int ret = 0;
+	s32 x_start, y_start;
+
+	crop = v4l2_subdev_state_get_crop(state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
+
+	/* Line length */
+	cci_write(imx576->regmap, IMX576_REG_LINE_LENGTH_PCK, IMX576_LINE_LENGTH,
+		  &ret);
+
+	/* Imaging area */
+	x_start = crop->left - imx576_active_area.left;
+	y_start = crop->top - imx576_active_area.top;
+	cci_write(imx576->regmap, IMX576_REG_X_ADD_STA, x_start, &ret);
+	cci_write(imx576->regmap, IMX576_REG_Y_ADD_STA, y_start, &ret);
+	cci_write(imx576->regmap, IMX576_REG_X_ADD_END, x_start + crop->width - 1,
+		  &ret);
+	cci_write(imx576->regmap, IMX576_REG_Y_ADD_END, y_start + crop->height - 1,
+		  &ret);
+
+	/* Binning */
+	cci_write(imx576->regmap, IMX576_REG_BINNING_MODE, 0x00, &ret);
+	cci_write(imx576->regmap, IMX576_REG_BINNING_TYPE, 0x11, &ret);
+	cci_write(imx576->regmap, IMX576_REG_BINNING_WEIGHT, 0x0a, &ret);
+
+	/* Digital crop */
+	cci_write(imx576->regmap, IMX576_REG_DIG_CROP_X_OFFSET, 0, &ret);
+	cci_write(imx576->regmap, IMX576_REG_DIG_CROP_Y_OFFSET, 0, &ret);
+	cci_write(imx576->regmap, IMX576_REG_DIG_CROP_WIDTH, format->width, &ret);
+	cci_write(imx576->regmap, IMX576_REG_DIG_CROP_HEIGHT, format->height, &ret);
+
+	/* Output size */
+	cci_write(imx576->regmap, IMX576_REG_X_OUTPUT_SIZE, format->width, &ret);
+	cci_write(imx576->regmap, IMX576_REG_Y_OUTPUT_SIZE, format->height, &ret);
+
+	return ret;
+}
+
+static int imx576_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 u32 pad, u64 streams_mask)
+{
+	const struct imx576_reg_list *link_freq_reg;
+	struct imx576 *imx576 = to_imx576(sd);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(imx576->dev);
+	if (ret < 0)
+		return ret;
+
+	/* Write common registers */
+	ret = cci_multi_reg_write(imx576->regmap, imx576_common_regs,
+				  ARRAY_SIZE(imx576_common_regs), NULL);
+	if (ret) {
+		dev_err(imx576->dev, "failed to write common registers\n");
+		goto err_rpm_put;
+	}
+
+	/* Program window registers */
+	ret = imx576_program_window(imx576, state);
+	if (ret) {
+		dev_err(imx576->dev, "failed to program window\n");
+		goto err_rpm_put;
+	}
+
+	/* Set link frequency registers */
+	link_freq_reg = &link_freq_regs[__ffs(imx576->link_freq_bitmap)];
+	cci_multi_reg_write(imx576->regmap, link_freq_reg->regs,
+			    link_freq_reg->num_of_regs, &ret);
+	if (ret) {
+		dev_err(imx576->dev, "failed to set link frequency registers\n");
+		goto err_rpm_put;
+	}
+
+	/* Apply customized user controls */
+	ret =  __v4l2_ctrl_handler_setup(imx576->sd.ctrl_handler);
+	if (ret) {
+		dev_err(imx576->dev, "fail to setup handler\n");
+		goto err_rpm_put;
+	}
+
+	/* T7: delay before sending stream command */
+	usleep_range(8000, 9000);
+
+	/* Start streaming */
+	ret = cci_write(imx576->regmap, IMX576_REG_MODE_SELECT,
+			IMX576_MODE_STREAMING, NULL);
+	if (ret) {
+		dev_err(imx576->dev, "fail to start streaming\n");
+		goto err_rpm_put;
+	}
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(imx576->dev);
+
+	return ret;
+}
+
+static int imx576_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	struct imx576 *imx576 = to_imx576(sd);
+	int ret;
+
+	ret = cci_write(imx576->regmap, IMX576_REG_MODE_SELECT,
+			IMX576_MODE_STANDBY, NULL);
+	if (ret)
+		dev_err(imx576->dev, "failed to set stream off\n");
+
+	pm_runtime_put(imx576->dev);
+
+	return 0;
+}
+
+static int imx576_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.pad = 0,
+		.format = {
+			.code = imx576_mbus_codes[0],
+			.width = imx576_active_area.width,
+			.height = imx576_active_area.height,
+		},
+	};
+
+	return imx576_set_pad_format(sd, sd_state, &fmt);
+}
+
+static const struct v4l2_subdev_video_ops imx576_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops imx576_pad_ops = {
+	.enum_mbus_code = imx576_enum_mbus_code,
+	.enum_frame_size = imx576_enum_frame_size,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = imx576_set_pad_format,
+	.get_selection = imx576_get_selection,
+	.enable_streams = imx576_enable_streams,
+	.disable_streams = imx576_disable_streams,
+};
+
+static const struct v4l2_subdev_internal_ops imx576_internal_ops = {
+	.init_state = imx576_init_state,
+};
+
+static const struct v4l2_subdev_ops imx576_subdev_ops = {
+	.video = &imx576_video_ops,
+	.pad = &imx576_pad_ops,
+};
+
+static const struct v4l2_ctrl_ops imx576_ctrl_ops = {
+	.s_ctrl = imx576_set_ctrl,
+};
+
+static int imx576_detect(struct imx576 *imx576)
+{
+	int ret;
+	u64 val;
+
+	ret = cci_read(imx576->regmap, IMX576_REG_CHIP_ID, &val, NULL);
+	if (ret)
+		return dev_err_probe(imx576->dev, ret,
+				     "failed to read chip id %x\n",
+				     IMX576_CHIP_ID);
+
+	if (val != IMX576_CHIP_ID)
+		return dev_err_probe(imx576->dev, -EIO,
+				     "chip id mismatch: %x!=%llx\n",
+				     IMX576_CHIP_ID, val);
+
+	return 0;
+}
+
+static int imx576_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct imx576 *imx576 = to_imx576(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(imx576_supply_names),
+				    imx576->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(imx576->inclk);
+	if (ret) {
+		dev_err(imx576->dev, "fail to enable inclk\n");
+		goto err_regulator_off;
+	}
+
+	gpiod_set_value_cansleep(imx576->reset_gpio, 0);
+
+	/* T6: Wait for internal init before CCI access */
+	usleep_range(1000, 1200);
+
+	return 0;
+
+err_regulator_off:
+	regulator_bulk_disable(ARRAY_SIZE(imx576_supply_names),
+			       imx576->supplies);
+
+	return ret;
+}
+
+static int imx576_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct imx576 *imx576 = to_imx576(sd);
+
+	clk_disable_unprepare(imx576->inclk);
+
+	gpiod_set_value_cansleep(imx576->reset_gpio, 1);
+
+	regulator_bulk_disable(ARRAY_SIZE(imx576_supply_names),
+			       imx576->supplies);
+
+	return 0;
+}
+
+static int imx576_parse_endpoint(struct imx576 *imx576)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct fwnode_handle *ep;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(imx576->dev), 0, 0, 0);
+	if (!ep)
+		return dev_err_probe(imx576->dev, -ENXIO,
+				     "Failed to get next endpoint\n");
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX576_NUM_DATA_LANES) {
+		ret = dev_err_probe(imx576->dev, -EINVAL,
+				    "only 4 data lanes are supported\n");
+		goto error_out;
+	}
+
+	ret = v4l2_link_freq_to_bitmap(imx576->dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_freqs, ARRAY_SIZE(link_freqs),
+				       &imx576->link_freq_bitmap);
+	if (ret) {
+		ret = dev_err_probe(imx576->dev, -EINVAL,
+				    "only 1017MHz frequency is available\n");
+		goto error_out;
+	}
+
+	imx576->link_freq_index = __ffs(imx576->link_freq_bitmap);
+
+error_out:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
+static int imx576_init_controls(struct imx576 *imx576)
+{
+	struct v4l2_fwnode_device_properties props;
+	u64 vblank_def, hblank_def;
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	u32 lpfr;
+	int ret;
+
+	ret = v4l2_fwnode_device_parse(imx576->dev, &props);
+	if (ret)
+		return ret;
+
+	ctrl_hdlr = &imx576->handler;
+	v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+
+	vblank_def = IMX576_VBLANK_DEF - imx576_active_area.height;
+	lpfr = vblank_def + imx576_active_area.height;
+	imx576->exposure = v4l2_ctrl_new_std(ctrl_hdlr,
+					     &imx576_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     IMX576_EXPOSURE_MIN,
+					     lpfr - IMX576_EXPOSURE_OFFSET,
+					     IMX576_EXPOSURE_STEP,
+					     IMX576_EXPOSURE_DEFAULT);
+
+	imx576->gain = v4l2_ctrl_new_std(ctrl_hdlr, &imx576_ctrl_ops,
+					 V4L2_CID_ANALOGUE_GAIN,
+					 IMX576_ANA_GAIN_MIN,
+					 IMX576_ANA_GAIN_MAX,
+					 IMX576_ANA_GAIN_STEP,
+					 IMX576_ANA_GAIN_DEFAULT);
+
+	imx576->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx576_ctrl_ops,
+					   V4L2_CID_VBLANK, vblank_def,
+					   IMX576_VBLANK_MAX, 1,
+					   vblank_def);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx576_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  IMX576_PIXEL_RATE, IMX576_PIXEL_RATE, 1, IMX576_PIXEL_RATE);
+
+	imx576->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx576_ctrl_ops,
+						   V4L2_CID_LINK_FREQ,
+						   ARRAY_SIZE(link_freqs) - 1,
+						   imx576->link_freq_index,
+						   link_freqs);
+
+	hblank_def =  IMX576_LINE_LENGTH - imx576_active_area.width;
+	imx576->hblank = v4l2_ctrl_new_std(ctrl_hdlr,
+					   &imx576_ctrl_ops,
+					   V4L2_CID_HBLANK,
+					   hblank_def,
+					   hblank_def,
+					   1, hblank_def);
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx576_ctrl_ops, &props);
+	if (ret)
+		goto err_handler_free;
+
+	if (ctrl_hdlr->error) {
+		ret = ctrl_hdlr->error;
+		goto err_handler_free;
+	}
+
+	imx576->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	imx576->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	imx576->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+
+err_handler_free:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static int imx576_probe(struct i2c_client *client)
+{
+	struct imx576 *imx576;
+	unsigned int inclk_freq;
+	int ret;
+
+	imx576 = devm_kzalloc(&client->dev, sizeof(*imx576), GFP_KERNEL);
+	if (!imx576)
+		return -ENOMEM;
+
+	imx576->dev = &client->dev;
+
+	/* Initialize subdev */
+	v4l2_i2c_subdev_init(&imx576->sd, client, &imx576_subdev_ops);
+	imx576->sd.internal_ops = &imx576_internal_ops;
+
+	imx576->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(imx576->regmap))
+		return dev_err_probe(imx576->dev, PTR_ERR(imx576->regmap),
+				     "failed to initialize CCI\n");
+
+	ret = imx576_parse_endpoint(imx576);
+	if (ret)
+		return dev_err_probe(imx576->dev, ret,
+				     "failed to parse endpoint configuration\n");
+
+	/* Get sensor input clock */
+	imx576->inclk = devm_v4l2_sensor_clk_get(imx576->dev, NULL);
+	if (IS_ERR(imx576->inclk))
+		return dev_err_probe(imx576->dev, PTR_ERR(imx576->inclk),
+				     "failed to get inclk\n");
+
+	inclk_freq = clk_get_rate(imx576->inclk);
+	if (inclk_freq != IMX576_INCLK_RATE)
+		return dev_err_probe(imx576->dev, -EINVAL,
+				     "inclk frequency not supported: %u Hz\n",
+				     inclk_freq);
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(imx576_supply_names); i++)
+		imx576->supplies[i].supply = imx576_supply_names[i];
+
+	ret = devm_regulator_bulk_get(imx576->dev,
+				      ARRAY_SIZE(imx576_supply_names),
+				      imx576->supplies);
+	if (ret)
+		return dev_err_probe(imx576->dev, ret,
+				     "failed to get regulators\n");
+
+	imx576->reset_gpio = devm_gpiod_get_optional(imx576->dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(imx576->reset_gpio))
+		return dev_err_probe(imx576->dev, PTR_ERR(imx576->reset_gpio),
+				     "failed to get reset GPIO\n");
+
+	ret = imx576_power_on(imx576->dev);
+	if (ret)
+		return ret;
+
+	ret = imx576_detect(imx576);
+	if (ret)
+		goto error_power_off;
+
+	ret = imx576_init_controls(imx576);
+	if (ret) {
+		dev_err_probe(imx576->dev, ret, "failed to init controls");
+		goto error_power_off;
+	}
+
+	/* Initialize subdev */
+	imx576->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	imx576->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	imx576->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&imx576->sd.entity, 1, &imx576->pad);
+	if (ret) {
+		dev_err_probe(imx576->dev, ret, "failed to init entity pads");
+		goto error_handler_free;
+	}
+
+	imx576->sd.state_lock = imx576->handler.lock;
+	ret = v4l2_subdev_init_finalize(&imx576->sd);
+	if (ret < 0) {
+		dev_err_probe(imx576->dev, ret, "subdev init error\n");
+		goto error_media_entity;
+	}
+
+	pm_runtime_set_active(imx576->dev);
+	pm_runtime_enable(imx576->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&imx576->sd);
+	if (ret < 0) {
+		dev_err_probe(imx576->dev, ret,
+			      "failed to register imx576 sub-device\n");
+		goto error_subdev_cleanup;
+	}
+
+	pm_runtime_idle(imx576->dev);
+
+	return 0;
+
+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&imx576->sd);
+	pm_runtime_disable(imx576->dev);
+	pm_runtime_set_suspended(imx576->dev);
+
+error_media_entity:
+	media_entity_cleanup(&imx576->sd.entity);
+
+error_handler_free:
+	v4l2_ctrl_handler_free(imx576->sd.ctrl_handler);
+
+error_power_off:
+	imx576_power_off(imx576->dev);
+
+	return ret;
+}
+
+static void imx576_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx576 *imx576 = to_imx576(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(&imx576->sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(imx576->sd.ctrl_handler);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		imx576_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(imx576_pm_ops,
+				 imx576_power_off, imx576_power_on, NULL);
+
+static const struct of_device_id imx576_of_match[] = {
+	{ .compatible = "sony,imx576" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx576_of_match);
+
+static struct i2c_driver imx576_driver = {
+	.driver = {
+		.name = "imx576",
+		.pm = &imx576_pm_ops,
+		.of_match_table = imx576_of_match,
+	},
+	.probe = imx576_probe,
+	.remove = imx576_remove,
+};
+module_i2c_driver(imx576_driver);
+
+MODULE_DESCRIPTION("IMX576 Camera Sensor Driver");
+MODULE_AUTHOR("Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>");
+MODULE_AUTHOR("Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>");
+MODULE_LICENSE("GPL");
--
2.34.1

