Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011065.outbound.protection.outlook.com [40.107.130.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DE2318BB5;
	Thu, 20 Aug 2026 07:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210596; cv=fail; b=KB5p3fMaQ8mNQw1/Iwk2L8+B7CiyfvpI+bCy7ayCLus/eVyhVx4SKpE7EdmjfabujWf4Q5J5rhyvl7D9lwNfA6LYi2kn+Bv59IZ+xCYpAqHuUsdPsimZzTpJhrUO07wALUriJwuyYI2VY0nVcmFNPLZGYjhFRrQg1duKJGLiK54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210596; c=relaxed/simple;
	bh=2a8DH+F9DDybi/2yzT1ywInygEw3qje6sna/0W1EcoY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Wfqp30XmFhW6UwX/J/ef2wNRowQsKxACmKv2EimFwMDjxt/sTHKaclpk9AxnqynypJ5KqZ1L4RtCr1mR6XkD1Zz7VL840Zxs45SqX3SAdgX7Q5OhE7oNUsU6XJvh9ufzZ46zqDeC3B5UQfLlFFdOV1wfK6kJEPcjtMqqV7CtLxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=LKQgNKrS; arc=fail smtp.client-ip=40.107.130.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="LKQgNKrS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pS7Y/pyVWm83aJ4WIMZ8bqyUackR/detg91x1LJVCP+9JZWXPTfs3OqWZkIKNmnjELhidyA8P1Xd8efU8zYYlT2U55kx01f8P5Xw5hGVYifD/ki88ge+IcrnzCIg3wsZOVA7ChjrHbDtEb+WaLuLjD1Zia4IyHMjEwox4TrntwSNTvFUO2DlJubNklhgltkO+RuZbO9ei7EJ15hnavptV5lnmQhsBXZ3S2+W6O3HYnPs3vIUix7Xv/x1fORBQD4IXXNPs8xcOcq7hTG33PJr6Y4WJthDi8CDlkPK3BYvbeMukxwmRXTWq6zq/oxZTnNXjVpMcZoiWWS+ZC4Nh9nNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZR/qvLvQ59j7nvaUFSvcGnN6XKMHlfkor4YTg2VxvM=;
 b=BEO5k2E5k1UtBQfDpyiJ7Klp5+KOJW/qGWDs4dwKLAAj8EyGAMsK2O/1Pl9aNoPQLG/AknrEn65F+pHrFOiCRKdi8EdlnN2edVMXUrUPPJmDY616sDoHoMZMWMhXYdLolMk1OG0rzxJ8EvU4tAt0WSA8UTIa2cU6/X4p8LQLIT4qsdY/C4MMdSeeFUgIIP8B6R31C4qCBvBPQw+V98cOQTQzYMgZsJ+EO7pi+3PJB0kGiVwR8UbzEKo0fQD3Ypcd8BQsA6/ml4GhwCrBUwS01pZ9/T/gCs7BE2m0awCyPt1L2NGevsd8ybxiD2tmLGzkFPdPwHrfVown1pyCGaem8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZR/qvLvQ59j7nvaUFSvcGnN6XKMHlfkor4YTg2VxvM=;
 b=LKQgNKrSJwNDlKPi1XMkkgFMxf9BNf22XuGfBS07lmvsVpUlRlZZ/6N3jJ44oHGDZjVrPltFDvyQbUeb+o9D1iMhPYZ2tPPh3mgwQdW2PRAI2mwFHmhdtzBSdByGq7ADVFsJ468kHPZZodpkBR6rYT/8b1mCIVgQvy3Eruo3wFjB/ZJYDSov+a9MwQlLCQ9FAHzHe672xCQ8cPkeXA+YkVzfb8tPLxCvt5q3p6icoxoCkeHyVxWen0M/DI2AAOVXfa5hC90q98rcjkLlorb12FmxoLnib2iJvdIr8QHGlBAC07O6FOqIrbl76hSEF77epUKx+yejOT7WlMjxV9SpuQ==
Received: from AS4P189CA0007.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::18)
 by DB8PR10MB3178.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 07:23:08 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::8c) by AS4P189CA0007.outlook.office365.com
 (2603:10a6:20b:5d7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 07:23:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 07:23:08 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:28:07 +0200
Received: from localhost (10.252.29.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:23:07 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v4 00/14] media: stm32: dcmipp: add support for MP2x pixel
 pipes
Date: Thu, 20 Aug 2026 09:22:28 +0200
Message-ID: <20260820-stm32-dcmipp-pixel-pipes-support-v4-0-d212eb4e3792@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADSrhmoC/43OwW7DIAwG4FepOI8KDISmp77HtEMDZkVaCsU0a
 lXl3Uu2QzTtsF4s/Zb1/X4wwhKR2H7zYAWnSDGdW9BvG+ZOx/Mn8uhbZiDASJA9pzoq4N6NMWe
 e4w2/2sxInK45p1L5oKEH7cSg0bDG5IKhnS0V7x8/ueDl2prqujxFqqncv9+Y5LJdGjvRxv+Nk
 +SC7/zOGxkMCqkPIRFtqW5dGtnCT7CS3UskNFI52w0m9Eoa+5dUK2lBv0CqRgZrA1q0oHz/m5z
 n+QmAAYv8jQEAAA==
X-Change-ID: 20251219-stm32-dcmipp-pixel-pipes-support-b42924c0b4e5
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A2:EE_|DB8PR10MB3178:EE_
X-MS-Office365-Filtering-Correlation-Id: eb193285-7916-4f7b-4999-08defe8be22b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|30052699003|13003099007|6133799003|3023799007|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	D7q9ZXlgcB3/Y/tzgb1H0za/GUygQpj6m4x/qGnrb4vOzao+vaxStBQAMDzGlELhYfZsK33fB8Cqm4tTs8SfG+bj8LERaiDYq0n53zQDmrd0DMMNwtCSS0HcNayT0UTkOkZOO8VGe9dsNLegUs8sMeCk2l4Z66unecCrwgALkIJnUqQROmSlSJq05Bh3EdD8AmixN2HCY0jP51Aa1pOml8KqlyrIqKkFgoPTjau//5r6HFv8qu8GORoODF7zte2WekBgcoAqM+taEl/1UwxvdjzbSNC3yXogs789405rJ3BFxtbYSfqg5Apb+s0hcz0e+0GEm6HlCzQDMg+PIGZI2zNU+gEy5l2zEbEgEYwwh1M73Tt45JsML3I0b5PFSFM0FMlPESLb1TdLrpdC8JBOhc8Y2YUwpS92wcVm0Z6hHKpaeYvU3hAl6jvQYCWDqDvqnYAYiCIljr3BahKs/78lWivnJD9G+R+BhSDLEa+yomzeTJBzupgcYzLXp3wws/NdEdJE4cxay9g9d4JACxCtaRe9ofkKC1QH2Dpdo0h98THQ6RPGumVMzy/4IaVTgZR38FUexMTvt8+A5BcOSnVYirnLS6LKRpwKCAR7eorhnWoVOoCPPBXTaLE/p4c4eNG/c0+OX73nb1NnV/G3mAvd7JD95xMP71HIURhoM7M9f54=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(30052699003)(13003099007)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1GPlxGUCyB4slreEHcZuY1WY8h1FhTob5k46tQS4fJ3BvMEPJzxl5sLxTABpXSwrKe2JnWeNo16EFuxTpZFPS08j5yEWFMuxMwwBMUTp2eQ8vz9q1mg+VfE2mLKBQjaa5A9UXJPdlU/cd5pc7GFTXI2EkR1O7Si82XW5zz2U83VdpiN/R/WVtoTWCBvF/1vB5MAgfJh87kQrzOFX/YahGRqaPOAJdmjs9nhrj475+RLaz9eiG2/GjwovFQX2bWmfpcgzUKpugVuKAIZSun8EmzYO99YVXY1QyuIrc4c5Alil7UwYx6iu8g/qsYUIEM0LsnywlyBEmlIxcOFU2cSfPqAQ7G8LoS2EVOQPhdbSUGTYZ/JD2i2ixhQr+FM3FyxaR1gFNmGFsATYVxicyxQRHY54SXReFFRUGLyM00su2KTpCx+edZNoMkovCGLSlgJC
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:23:08.0778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb193285-7916-4f7b-4999-08defe8be22b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3178

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
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |  98 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 124 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 124 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-isp.c    | 491 +++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c     | 180 ++++
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h     |  41 +
 .../st/stm32/stm32-dcmipp/dcmipp-pixelproc.c       | 940 +++++++++++++++++++++
 include/uapi/linux/media/st/dcmipp_config.h        |  16 +
 include/uapi/linux/v4l2-controls.h                 |   6 +
 14 files changed, 2380 insertions(+), 285 deletions(-)
---
base-commit: 48a5a7ab8d6ab7090564339e039c421f315de912
change-id: 20251219-stm32-dcmipp-pixel-pipes-support-b42924c0b4e5

Best regards,
--  
Alain Volmat <alain.volmat@foss.st.com>

