Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3D53ABD80;
	Thu, 20 Aug 2026 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210064; cv=fail; b=a4gBUT8H0DDfkFr0bFjxUHtOwmP9U/lF8VWb9+mWQaaaO8EHtZPmA9PndYtgKtLMuV4qH9D2TAtKqv/l6EHUyJCxkqIh4PCP6iPz5HxrJ8aof/pWWXRLPOd5CBLeX1NdOd3leDqQCnr/kcurtUm/7nqMkA0Ldqc7ZFoEVS8Lk3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210064; c=relaxed/simple;
	bh=6g6t5LW/NwCHRSffxAlR+e6//Wc80HHPmx/qw+0byis=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukSr5ryt/Aj/+DtxomyNBeCbecUM6oDrxxCzQtYZKRurCCPRgkFf2NYAFnJzOxbAJ8bPY3JqYQ6AyPwWp8G+8POubWMpAoYZeOntBBVK4sZKu7ZH4oQp4Q35q9/FR0X0r13WYJs4YrLxVHTzAI7Bw6C9/Ab0eAvZ+ifYA4VHR0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Safkyj9S; arc=fail smtp.client-ip=52.101.84.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Safkyj9S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h96x9D46NWmORwizqgRQAdX5qXjJ45sjdq7pAaFTfNUDDe35+D28QsXol53Ye73vjuv2R3A+YuZYHNb3oH/yT6AO2vkfa3VTQUYRw9ui4vi/sdMkCx5s31nqzl3N4hntF2oKAnPakctUVnXHYhF2jYFvT8PdDdI/JXP7VHOOiymHLbv4llrXWQQCoLKJeQ+M6mfwlpu3F2IqX2d/AivsY3bQdrUPFK/VpPgylrTVrwsogaIgi5yXsW61PhfbR9sblCgJN5BSC401CPqWqJa6xi5gFIxGUTHnebpLxwSvtHBctCcksmlgdbHoJwoUhWw+od9firCsWWiUh5rfJzuApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VE2OR/fENMq1te0oRCAS/8zqk6SELLzF/Zd8RVnxMjE=;
 b=HhtBUBUrKF30/Lcq1UmrFKzlJGSC0JccK2BTVEwFu3sFQpZJYsjcbixBODF+T45Kb7QL25bn+seocWckgYTgRHxuM0KlePfw7psGzakFQMsv/FN51KHHc1txw3fHEadwEO8PTqonqxqqIvn+1KEEMqMtgPwT1NQ2r3rjmh57c0r/ertSAGx8c22UrXU3foCw6uR2WthL55IAZzVIL+6Iw3+uXyQYHI/93McV8VC2zNalMEkSMbMLSB2p22IXggCgorHX4CIAEiogfhHG10/6LU/vTbQSGYfNTMzjNyV3BJPtBruliZAH4RY5pdw6FO35EUEZ8WM6RleX7xWrQ9CI4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VE2OR/fENMq1te0oRCAS/8zqk6SELLzF/Zd8RVnxMjE=;
 b=Safkyj9SMXC2qdkT3R6KSIMlLrAjhIVAGUIxJuuiZbKGv6bIyo4QF9ev4FQ2lkeA0SH2LegbqQM2mqi4FHjYeiB5F89P3QOh9ymwGUyzImpvayyg4MNBR7q1iMrxiDqKsK6G+/Sumqiyk9ubUODXPXKSGmlWZQre7EdX2paANQYGkbss6brBp8qr/meZ/kRcSXIY3+4ILaTut8f7UtHrjtYZapeVnFDCNIkk1TwsWByNoY5mxuWXCUXlobNyzfUKjabvOJn9kNf3pB0V2pPDJhhgXO1XmnSmg5GqKwSGsapcHAnos/FAgPUaKByFhtv6XWiKJVTB2FezTMS8CllWUw==
Received: from DU2PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:10:3b::21)
 by GVXPR10MB8782.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 07:14:17 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::63) by DU2PR04CA0016.outlook.office365.com
 (2603:10a6:10:3b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 07:14:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 07:14:17 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:19:51 +0200
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:14:16 +0200
Date: Thu, 20 Aug 2026 09:14:14 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, <linux-media@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 00/13] media: stm32: dcmipp: add support for MP2x
 pixel pipes
Message-ID: <aoapRlYnvDdWYcee@gnbcxd0016.gnb.st.com>
References: <20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com>
 <6decf51d-137c-4230-b823-64e61d76d0b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6decf51d-137c-4230-b823-64e61d76d0b8@kernel.org>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8E:EE_|GVXPR10MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: afe854f1-d818-4ece-c97c-08defe8aa5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|6133799003|3023799007|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hdO3iDjk6vqDHUOfg5VsghkhEPCHwA5/+25OcNDaDwDdo1gSeBTaKRfrfhVOZGx9b/otdVJE2s+iaKNmvb4rt+3thqoHNC8rExuV8ejRmlBdo1MybAsewjkZldDRBtw/OewUdY62FAF5JgRmDNP47kj7jCL1xEgpiYCKtdnBZ8CvQV0t5WMWwOIZJ3QoNN8DMfE0lQ97bRfpnt0wNMWoqRzbPxf5udRaWYiHEXQEMpJyGDhD1kCX4yyCwrAttMHRKvdHQpedgnWcqX8/IVjJ7890zwhWX4NdReo8ez1C94qWXqoSGTZBZ0hnW+Obmsb3YLEL7V943II9CZ6h30JVNL8KnWlQvgPDcWql7VltVza4KjQhMxMvp4IrSqYJyu7OhjYMJLwtEM4WgIcRNF5k/LNtCjOBiBpeSYKxHFdhBIbX6eI8wz2lTcUGMJ6eSPEA0cF44+gbzsgEsR0gJLdZ75UnSnt9Vu3DH7kGqK8iTk+E2TzYaJtkp8vtxYy4nhvv5Rdf2RYRaeFHvIEqGG9FBP/77zwneYb+WD0amAz3VP/wIE5M4psMiDCqy+nv5Ea8HGGGgiP+UHWahSzGVsOmsJM8yZ3esZAur6iwEowWyAWxb+3RIiSx54+5GMO60vRm1qgOLlD7KkJKhbXT9R3zdW2AL0nVpVD3iMMm78CQk0708OgzWags+xWQKOZ8JceozIzVpXpUn7b6LTHLqmJjrA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(6133799003)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LOo9zF2MMagXbX7Zh8vTRNQ3nOPs5yUpii3WrvBysBCg8JbQT2Ne3oFjHov9HOWJxPxZyZfpege+JNaqVj4S9YAluvuefdbPQ8Ovu9uiUCZnHUD7GyXNoYSmwBt7qcUo8nWzfZ3thgHr/aCRZlsF6H0c1eJ2FtnqBfJPQGbHlMi8wL6MJesuaYNkYqZJ1xdYqe7u5KHrteVIu6o4lxhzzBcSWFYvOVtU1G0ZOlYed4gZMlB6iVIyrXVPiB8rc284sMYQDr5/VGcNxG5RK1/OUQy7AEzTJ0MbfCj6AoxhhmVbNdythvIB9UPFSzZVANwrwVw5R4zxJ8N5MZx83nCo1HSpmYnDHvqXK1Y0xcKcwIJlMCbChOS9+eXqcH0vyEq4T/R++Lxm+TzGWjFUkbiJVW9QpVm6wle3wjoDF+ZTLJg8dVSvDlMtLiLo6uWz18ee
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:14:17.1642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afe854f1-d818-4ece-c97c-08defe8aa5be
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8782

Hi Hans,

On Mon, Jul 27, 2026 at 03:53:11PM +0200, Hans Verkuil wrote:
> Hi Alain,
> 
> On 24/07/2026 18:13, Alain Volmat wrote:
> > This series add support for the main & aux pixel pipes
> > available on the MP2x. In addition to the byte pipe
> > already available, the DCMIPP is able to process two
> > other streams in parallel, including ISP operations
> > such as demosaicing, exposure etc, post-processing operations
> > such as cropping, downscaling and various pixel formats
> > output.
> > 
> > This series introduces the whole DCMIPP pipelines including
> > static configuration of the ISP part (such as demosaicing).
> > Dynamic control of the ISP as well as statistic extraction
> > part will be added on top of this serie via usage of 2 other
> > video devices (input & output) for statistics extraction and
> > dynamic ISP parameter injection.
> 
> Since this adds a new subdev, can you post the output of
> 'v4l2-compliance -s' for the MP2x?

Sure, will post that as a reply to the v4 submission, for all 3 video
devices.

> 
> Just to be certain all corner cases have been handled.
> 
> Regards,
> 
> 	Hans
> 
> > 
> > Changes in v3:
> > - Rebased on top of kernel v7.2-rc4
> > - Fixed most of Sashiko review points
> > - Link to v2: https://lore.kernel.org/r/20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com
> > 
> > Changes in v2:
> > - Rebased on top of kernel v7.1-rc6
> > - check-patch minor fixes
> > - replaced kzalloc(.., sizeof(..),) with kzalloc_obj
> > - Link to v1: https://lore.kernel.org/r/20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com
> > 
> > ---
> > Alain Volmat (13):
> >       media: stm32: dcmipp: share struct dcmipp_device among subdevs
> >       media: stm32: dcmipp: make dcmipp_state & cmsr2 read common
> >       media: stm32: dcmipp: bytecap: protect CMIER register access
> >       media: stm32: dcmipp: move common structures in dcmipp-common.h
> >       media: stm32: dcmipp: correct swap in YUYV data with parallel input
> >       media: stm32: dcmipp: configure csi input of all pipes on stm32mp25
> >       media: stm32: dcmipp: introduce a dcmipp global media_pipeline
> >       media: stm32: dcmipp: add pixel pipes helper functions
> >       media: stm32: dcmipp: addition of a dcmipp-isp subdev
> >       media: stm32: dcmipp: pixelproc: addition of dcmipp-pixelproc subdev
> >       media: stm32: dcmipp: add pixel-pipe support in bytecap
> >       media: stm32: dcmipp: rename bytecap into capture
> >       media: stm32: dcmipp: instantiate & link stm32mp25 subdevs
> > 
> >  .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   3 +-
> >  .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  27 +-
> >  .../{dcmipp-bytecap.c => dcmipp-capture.c}         | 600 +++++++++----
> >  .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |  98 ++-
> >  .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 124 ++-
> >  .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 124 ++-
> >  .../platform/st/stm32/stm32-dcmipp/dcmipp-isp.c    | 491 +++++++++++
> >  .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c     | 180 ++++
> >  .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h     |  41 +
> >  .../st/stm32/stm32-dcmipp/dcmipp-pixelproc.c       | 941 +++++++++++++++++++++
> >  10 files changed, 2344 insertions(+), 285 deletions(-)
> > ---
> > base-commit: 48a5a7ab8d6ab7090564339e039c421f315de912
> > change-id: 20251219-stm32-dcmipp-pixel-pipes-support-b42924c0b4e5
> > 
> > Best regards,
> > --  
> > Alain Volmat <alain.volmat@foss.st.com>
> > 
> > 
> 
