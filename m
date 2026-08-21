Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD8341169B;
	Fri, 21 Aug 2026 06:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294311; cv=fail; b=UwMeB8IoySr/Y7AOnHBnaf1KT00/MIkr2RzEIRGJsOoG1D0ouxxP4dR/i26t1ijSJyhy2lLif6010RYtcSm8unGgCM8wyfKE+Rr9D6/88CdX27+2RFsZ0E3GCFxADW/HtSm+oUGyyQZv/K1QbB+13GHxFlHCvLLOrSmEVsz2ib8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294311; c=relaxed/simple;
	bh=IDojyrTaMnlwWAFdgrC3iDALLQtZF7xU0mwelogF1MU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=hB9AuMNVG+KahUDRfbYG4w4uYuNSqpTYJ61tCbGDbBSBgP0+hmnFBC5rjVT/hbOtkXa5Lf73sI6p9tRwdQqA8qdGekk5Pj7UB+FIZiTkh2AmN6P3SPFTX68TYgO9aoObOu73BUgH5UMoOkD/rqXMIOEEMSVIJc1ICApndRl6krU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ZKdLEiXo; arc=fail smtp.client-ip=52.101.66.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ZKdLEiXo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1lzp3jzwsfEBPCYhs2hY6OoVXXa7OgR76ak7R/ycYsG1qMrTqpmi4/1IWBQWW1KsfQmeT308aG/ekNvUojI5/StIIFJA5Bb+lmfCIYCGBmjixzr0VdPANcybGnunq1hoYC3qfU2cS1YF4dAmTTFvEnJOShocOL8qE/9XfA3zH0aVQOiEgaEZMhoeKiLmXWCJeNo7KiwqqCBtIVnLiLJdv+vGELk/AqHCx9uTuWf57+JQRp0/ASVqChyXkLRhgaymCh+EtEpEHxcd2b4vZdR+fOShVyV6Z7XdDAK97yY/kVUNEyPfKXeJQgVkjGivOvoCSVT2QzZ1CaeWdhAGavgtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+LAaH3uFermA3W3zg1/AZPPDbWDhAExek+T/34iBUM=;
 b=CU5pDiIqVA99ip/rZqlwLzFlVXcakpW4xECAwiRW9zhtQVv25V/gsGFygQEbrRpWcJz/63bymIvV9RV4q1Kayr+VNRWVgBETK78JI9n2Nqcln15ZR+vggX9PAenljXx4pwuNmnuNAXcX4s8oVnk/oSKOQqSpITO6UJDJniBKgjstNSMpoRndjSLeIAKBzQMZ9UmRNoE5D2iqmvr+d7rnMSWsva73GSJSvzPr71kouBCtFtR5jkaIwxSJcpBz2em/BMoXsullq9tV4DWS/nz/13k0IPZHlmD5AqmLuASZ+6jDHFjw0ybxwEpPQLhB7JZzci3JLPPh8DHBBO4kpaZIRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+LAaH3uFermA3W3zg1/AZPPDbWDhAExek+T/34iBUM=;
 b=ZKdLEiXoJ02dz5wG58bVEV8tUC0YA8rFJpuaVnGi79GBJW52E4LBsPZ5qt+ZHxGzjD7rB7JyQyUqxvLkntxRSAnFKnywYuGyGPk+QeAmJbk5QFpgneNRFZS1u7YAT88oFeuAcKb7Oxm5eMDuiQarCMNbdtqJ9lJp7q+ev7rWQZf/r1WA7mlK04yBF8TyUbzqHBrOO7w/FflZZ1Wr7y+n9YKKWeA5n2wJVp4UsozGzlLWcle5uSNueOJKELwqW/q/WES6TtUA5iYKzponrPgKivVl66yxtFdIZnclUkk7r/pY2JRIN7CC/nwjXezP3Krq1EEgvytzP5aVuiURqu7Azg==
Received: from AS4P190CA0038.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::17)
 by DB9PR10MB5642.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:30d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 06:38:23 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::63) by AS4P190CA0038.outlook.office365.com
 (2603:10a6:20b:5d1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 06:38:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 06:38:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:43:22 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:38:22 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v5 00/14] media: stm32: dcmipp: add support for MP2x pixel
 pipes
Date: Fri, 21 Aug 2026 08:38:02 +0200
Message-ID: <20260821-stm32-dcmipp-pixel-pipes-support-v5-0-d140efb61d72@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEryh2oC/43QQW7DIBAF0KtErEsEAxi7q96jyqKGoUGqAwVip
 Yp8947bhVVlUW9G+iP0Ppo7q1giVvZ8uLOCc6wxXSiYpwNz57fLO/LoKTMQYCTIgdc2KeDeTTF
 nnuMNP2hmrLxec06l8VHDANqJUaNhxOSCgZ6tFa+n31zw80pNbVueY22pfP18Y5brdm3sBI3/G
 2fJBe99740MBoXULyHVeqzt6NLEVn6Gjex2kUCkcrYbTRiUNPaRVBtpQe8gFZHB2oAWLSg/PJJ
 6I3sQO0hNpAcJSMdWdoC/5LIs39JPxU3gAQAA
X-Change-ID: 20251219-stm32-dcmipp-pixel-pipes-support-b42924c0b4e5
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000043:EE_|DB9PR10MB5642:EE_
X-MS-Office365-Filtering-Correlation-Id: e96f466d-1e8d-4f63-fb3c-08deff4ecc49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|30052699003|82310400026|1800799024|376014|23010399003|18002099003|56012099006|3023799007|13003099007|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	1xe5R2iTivGxERaLHTWu/H4kAXPOG7b2BdXqGvF8PNhcHurvIAoT424iOeLjFZE8KhM4nkCnyA9Gq/7y8kV1S2BJ+vDwXfVuQ8JnseLuuTmk40Pxphc4LM81qWg0+GzrWIVfnnlIZ/WfGf6lKEU7h10g7xwtZSKOhE2szcAChOdkbu4V9es9gThXWWapDFXh4iXNAzTZBX/hYDswi96PoJJD8rTGVwQrB+LFyk71P6A4ga9DZy3wuE0ZETEO5jshZ1uin8BhI91uFRB0GyFeJyKwtXIHXQVUkL89t/NFiXE4gqNK6JpHmBa0x6OZ7CoFZcnVtXW9BXCJXWw7bW8y6jteUKpN8gP+dHlbvqDE8ru8PuQLVdGhYawZ4Ne9o3UozArhjBw+mNlmScZ6BRTfZxgN/hb1qcjXiVuNXFO4Btzy99HGXxkWNmOlJLeprK4m7hCaVM9QS2BaLIVVrq1H/HKopgzIIvqh6nELZY9EAypIMyKuUokeUXiI/cuEVpKKr13tvw4tBZCkgvLTijnT4wFV+fYKhjQ+Yg4qbue/kfkJzRKn/Dv9ZNk31uRc0Lgew48jUB9dUilYtOs8MmWJ/zbuLB7da/XXy0v/61PXgzR6uSlAwzYDG36Z2tLp9lEvzDirsZqSI9lmTVH7lSqjzXrOdUSgduECzM7Q8jaCbHM=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(30052699003)(82310400026)(1800799024)(376014)(23010399003)(18002099003)(56012099006)(3023799007)(13003099007)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OwQ32ylY2iaOYGMgXkjkLpPW/98ff2ibYKEUGCA4M9spjNWtkCw5un6TiB8AjuXgH/iXfmLy9O9M3/Lq5eG0xyVyVjQPZQ9WMXTj5GV0M4p261ESaK8MKgpyukgwgp0VV0aoBNyI+nUQJ1sYNtSfQLJiJmJCN9ZZEpphvHkAcct8xDOr73J1sBeeSSroZOvozreAsLK9Ql6V2kBWOC8kk0Jn/CK56gqS1adGRIKv1rOIOEzxtpupSqFBXdeCTR+qB+6+TKtNTK+ZHhqfmgC85/+Kc4iqgoeLJtadsHRKSnWxNo0HWs+Z/VLf2dM3htYa8S2TLFg6MQwP4cEz5FunofJY55dZPRuSk6vyWFCIdmp7JVf8Of0s8ouY6fon6AiYkW7jkbFshdftyTiUyvgZqfUTKoS9db6bXIiiKji3QpFpu0hkxv9Q3fpQ3D3coEdC
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 06:38:23.1527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e96f466d-1e8d-4f63-fb3c-08deff4ecc49
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5642

This series add support for the main & aux pixel pipes
available on the MP2x. In addition to the byte pipe
already available, the DCMIPP is able to process two
other streams in parallel, including ISP operations
such as demosaicing, exposure etc, post-processing operations
such as cropping, downscaling and various pixel formats
output.

This series introduces the whole DCMIPP pipelines including
static configuration of the ISP part (such as demosaicing).
Dynamic control of the ISP as well as statistic extraction
part will be added on top of this serie via usage of 2 other
video devices (input & output) for statistics extraction and
dynamic ISP parameter injection.

Changes in v5:
- Add dcmipp_ent_device struct cmsr2 new variable description
  to correct doc generation warning
- Link to v4: https://patch.msgid.link/20260820-stm32-dcmipp-pixel-pipes-support-v4-0-d212eb4e3792@foss.st.com

Changes in v4:
- Allocation of a ST DCMIPP specific user defined CID range
- Rename of the pixelproc control into V4L2_CID_DCMIPP_PIXELPROC_GAMMA_CORRECTION_ENABLE
- Rename of the pixelproc control as "Gamme Correction Enable"
- Addition of a new header file include/uapi/linux/media/st/dcmipp_config.h
- Link to v3: https://patch.msgid.link/20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com

Changes in v3:
- Rebased on top of kernel v7.2-rc4
- Fixed most of Sashiko review points
- Link to v2: https://lore.kernel.org/r/20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com

Changes in v2:
- Rebased on top of kernel v7.1-rc6
- check-patch minor fixes
- replaced kzalloc(.., sizeof(..),) with kzalloc_obj
- Link to v1: https://lore.kernel.org/r/20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com

---
Alain Volmat (14):
      media: stm32: dcmipp: share struct dcmipp_device among subdevs
      media: stm32: dcmipp: make dcmipp_state & cmsr2 read common
      media: stm32: dcmipp: bytecap: protect CMIER register access
      media: stm32: dcmipp: move common structures in dcmipp-common.h
      media: stm32: dcmipp: correct swap in YUYV data with parallel input
      media: stm32: dcmipp: configure csi input of all pipes on stm32mp25
      media: stm32: dcmipp: introduce a dcmipp global media_pipeline
      media: stm32: dcmipp: add pixel pipes helper functions
      media: stm32: dcmipp: addition of a dcmipp-isp subdev
      media: uapi: Add controls for ST DCMIPP Driver
      media: stm32: dcmipp: pixelproc: addition of dcmipp-pixelproc subdev
      media: stm32: dcmipp: add pixel-pipe support in bytecap
      media: stm32: dcmipp: rename bytecap into capture
      media: stm32: dcmipp: instantiate & link stm32mp25 subdevs

 .../userspace-api/media/drivers/dcmipp.rst         |  14 +
 .../userspace-api/media/drivers/index.rst          |   1 +
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   3 +-
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  27 +-
 .../{dcmipp-bytecap.c => dcmipp-capture.c}         | 600 +++++++++----
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |  99 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 124 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 124 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-isp.c    | 491 +++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c     | 180 ++++
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h     |  41 +
 .../st/stm32/stm32-dcmipp/dcmipp-pixelproc.c       | 940 +++++++++++++++++++++
 include/uapi/linux/media/st/dcmipp_config.h        |  16 +
 include/uapi/linux/v4l2-controls.h                 |   6 +
 14 files changed, 2381 insertions(+), 285 deletions(-)
---
base-commit: 48a5a7ab8d6ab7090564339e039c421f315de912
change-id: 20251219-stm32-dcmipp-pixel-pipes-support-b42924c0b4e5

Best regards,
--  
Alain Volmat <alain.volmat@foss.st.com>

