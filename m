Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E99434E33;
	Fri, 24 Jul 2026 16:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909692; cv=fail; b=qvqXVwUnNmbrSmLCsn+tZeDDLu+0zcCOPsv5H7o5E12hzwrcCQRhNQtNVl5xaDmhDVOcHqdq0sYHNOVFTV8L4r2wrmDV+fKtOEyqqYy1vgqXSBDYRWR/lksoALu8GxuH1NJVJIJBJaNR6dciPeRUYv2kPCnlex/C9ht4efJ8szQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909692; c=relaxed/simple;
	bh=PeTQHpu49KwO+NlNS89PktziKxtOS2Kj0jbJKQZjDHs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=LEfKAGdj3qaCRPnPCwtTcy4JOxc/vUYs+psEsKkh9SbiN/UozWN3jRssCHysPyQw2pIPbs07b/dkOTsRRjElEfu3narCJ8Hwc3fBxzEOBxS+/BQWAjozbSFfyi4Py5B+kpHX2GIWHpmS4NzVdS+MdK/b3KmzXKJo/F2tcBr3xFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HI1q/O7m; arc=fail smtp.client-ip=52.101.66.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HI1q/O7m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfH4nuYQyWmJ97wg2aGOlZ+AOfLOAVCX3sOtfb3UpVAltAZZkItz6j2Nobga6xaeRe6XglPDFt3cm0ZhJhNstjs9e4ysTYtAOecvc+xl9ropwuz3AigL+xnTqVpoOd9q8s1RpdhKuOwLMeTs0MQuHuFzbcsDHe5XGpFb5ItqzpqQo1yklETeLaS0+hnVEoAMgBBI9MLsx3qPcBHbzeJiPHOcowln6Ri+o0F80BxQCG4QuYnjtDJnyFrFn1i9e8BsKiI2nZU8R7A/CBOZlwGTnmKo7Rn4G8HOKLQeC+8UNUGt6iHqnNugdx1nu+Qo4ZSvGS5czA0Nv5IfXXBoJV6oSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVI+fdeA8ql3siJUMSZcOL5IYoKX03K7PYPOGmPMilI=;
 b=Lu6ya/yBUz2TdEZbnkIEqx6fNZa/vcqi3qUnTRJj49qDZTpBgDlLEzeZoAcV6vHRq6sjn/s6fp6maVWwRv5XUehPT6MLJC88uKRKEinu5Mwt+2VwLkMUo4Kqzzs6CYHbVCersfnpnlJnhoSiADNz5ZJ4WW1E/ig6OF2fRdux9D8Hgjs6/yDNEOO2hy+PXcjO7vtsVTjfgJaT5fW1FRPUOyp2McY5zV//a4Py9pU0ZHqtV9pNPkXlYdSfh2bAQuEPYnX44PYOgKL7KQz9Mn5fsEn1nM+WXPphn8kqQ2MXCdfZM9jo761V83SCd2RFFT1gMp4GjXNjuDo0szdszVZsaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVI+fdeA8ql3siJUMSZcOL5IYoKX03K7PYPOGmPMilI=;
 b=HI1q/O7mF1Kzm361WQyGv7C/emwp96wRU4PgqfZsDvOKY1k4ytWOgGMdW/xLbQ1d0T1xnoCX83Bpc5C/aKxHlXc1uXb2xRXJX77f6HIiBm8IuLYWDE1mqTq+Xd8NvievySn0QfBXk2P6QiA0PI+u0Q/So3lfMfpT5p7fr6Ga5O7O3G8FErnqclXZOrvyrXEViszy3OxobDi5q4rXDNo4fXlx2SOkYu7JkPdOgputX1NhLCaj4hJNV2vP0OlX5vFwA2OLODccfbAW9/KsrBhVqIqv4hy3hgj1ENO7khXNrKMSqgn0JDMNTRjo/wscTqn79oa+gPZ3BtA2L5xn5A7ZDQ==
Received: from DU2PR04CA0041.eurprd04.prod.outlook.com (2603:10a6:10:234::16)
 by AS4PR10MB6279.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:58e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 16:14:11 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::31) by DU2PR04CA0041.outlook.office365.com
 (2603:10a6:10:234::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 16:14:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 24 Jul 2026 16:14:11 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:19:25 +0200
Received: from localhost (10.252.22.128) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:14:10 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v3 00/13] media: stm32: dcmipp: add support for MP2x pixel
 pipes
Date: Fri, 24 Jul 2026 18:13:41 +0200
Message-ID: <20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADWPY2oC/42Oyw7CIBBFf8WwlgZo6cOV/2FcWDpYEluQoUTT9
 N+lumhc6eYm92ZyzswEwRtActjNxEM0aOyYSr7fEdVfxitQ06VOBBOSC95QDEMuaKcG4xx15gG
 3lA6Q4uSc9YG2hWhEoVhbgCQJ4zzodLYqTudP93CfkilsY28wWP98vxH5uq7GkqX4bYycMlp3d
 Se5lsB4cdQWMcOQKTuQFR/Fhiz/QoqEzFVVtlI3OZfVN3JZlhcWAn46OgEAAA==
X-Change-ID: 20251219-stm32-dcmipp-pixel-pipes-support-b42924c0b4e5
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EE:EE_|AS4PR10MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ef93df-b349-4619-a463-08dee99e9909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|30052699003|376014|36860700016|1800799024|82310400026|13003099007|6133799003|56012099006|11063799006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Ats3PYHqYZqRRAToUNH3aa6Qy7dmAgzP8ogsSbWHS0WzGj0WT9Y6+HvELb89BnHs4O3ZvyPDjJjpvpRxBdOT9TPQBW9naL2hL3AcXjc3orHWPeuRvrejmIYvWBxHmq5Y5x3pWcJ283Z4R26C6Q+5kfdKwPLd7BL5ysgxwqzRJNy8kQwHlRlE7g+dsGkLNuf1zOAQFkILC6N2l5QzRX5w1kqpnzkonGzzCnaDfVJMufcBxELr/RO6uprA6p46DzOCC8iZxA4I12xl3xXFPRslIEl0D69TZZHmo4L5x0LsvUGzuFF02gwoOXCu0k8p8fPUGpMXAMfNQ8CI+ZDAhteuU9HmUFf7padmbPuhc5Y2oLskk2kIXbXybwo0XFug8FwmJl+aZg2YmseVL9wrMQ+sA5eZadqDucE1+kgHfn9VdWpSfhkFyZ7IVxXo2dXBx1A1WobAUuyOT3wCQO4Zw3ynGUZlWhSCE9EsMk7TNVbeBUxzdi/AmLrhkjxRSo81pe5sRJ4V9zPPPLcj8LfDfoCwfCKneEtxLttCmXhkwWFNWkq8RsKGHrdSiw3+9aWlRQRkcLl1wYOzCPf3fLTLjAjh5lnqpDwJDtgucMBAOWtK6Bv6FJ0MnnMvwR+epRLDnRMp+QL9Yhwrjweoa6cJUlVTTSWZ75taccj2N+b5cvDvc9GmwOcI9Fcip+g1nYAuEq+AD1FA8np4B26cIXnZXXQhRA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(30052699003)(376014)(36860700016)(1800799024)(82310400026)(13003099007)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2dJ0UR9Y1A/EXORnyamyB+ak1RPC0INq1MVaRfQzsvVIDWwjnJ3xWV/9vEZqM+nZ+v4zyOwhk6Eht4NznaF/HfxU9jMVTUzpF8nmdeNq/DPC7WABCrFSZN2QDkMICEoFqY4HZcHMsUegj+u3cLMxDMG5JBfjESLeTRC8KlwZ1KZVvykwB3QMNky4iDXfVY8kM4cOpD1Uz4XDrxlqbTZkI9rwL1vpri+SLY4ouVhoLQU6i1tQUyYcV11QOzjTF1uPCD2GGKfeVdsP6lRGuRQm+Ic27h0bTe70QfTHvXoSp/M6qiv3S3nnBXlQOhqOwCFcBjNel1uWe/mZ/cmhTxCQkSVmlmYl7P0uPMOh+PUeoEm02OmtFosgRqrVxnTfzu0qvE+Mry3+770mRxLIua31ym2yCDSlU+2i42lr57XuBAUuyiCsMqlw05V1g35Vr0a8
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 16:14:11.3592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ef93df-b349-4619-a463-08dee99e9909
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6279

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
Alain Volmat (13):
      media: stm32: dcmipp: share struct dcmipp_device among subdevs
      media: stm32: dcmipp: make dcmipp_state & cmsr2 read common
      media: stm32: dcmipp: bytecap: protect CMIER register access
      media: stm32: dcmipp: move common structures in dcmipp-common.h
      media: stm32: dcmipp: correct swap in YUYV data with parallel input
      media: stm32: dcmipp: configure csi input of all pipes on stm32mp25
      media: stm32: dcmipp: introduce a dcmipp global media_pipeline
      media: stm32: dcmipp: add pixel pipes helper functions
      media: stm32: dcmipp: addition of a dcmipp-isp subdev
      media: stm32: dcmipp: pixelproc: addition of dcmipp-pixelproc subdev
      media: stm32: dcmipp: add pixel-pipe support in bytecap
      media: stm32: dcmipp: rename bytecap into capture
      media: stm32: dcmipp: instantiate & link stm32mp25 subdevs

 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   3 +-
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  27 +-
 .../{dcmipp-bytecap.c => dcmipp-capture.c}         | 600 +++++++++----
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |  98 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 124 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 124 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-isp.c    | 491 +++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c     | 180 ++++
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h     |  41 +
 .../st/stm32/stm32-dcmipp/dcmipp-pixelproc.c       | 941 +++++++++++++++++++++
 10 files changed, 2344 insertions(+), 285 deletions(-)
---
base-commit: 48a5a7ab8d6ab7090564339e039c421f315de912
change-id: 20251219-stm32-dcmipp-pixel-pipes-support-b42924c0b4e5

Best regards,
--  
Alain Volmat <alain.volmat@foss.st.com>

