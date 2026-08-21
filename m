Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA85E415F3F;
	Fri, 21 Aug 2026 06:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294320; cv=fail; b=TkFtMO6fM6p9XL3+zl5MDaY9h0iSREspaAeArG0hDIqTEOHE2Oukmdjhu8UjtlPS+N5oCeFReIgqD90IfEKnN2IssjnCbthkgE2T9Bj2+QDgwBe+H4kOlIrIAMPYb/UY06n2nCKQxxfHRd/zU3x0bzV777pAoZQAQjfmXFHHLMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294320; c=relaxed/simple;
	bh=Z4sWH4OJwE92KvTcWjmM8ixWbHV12lQg9XTjkFhoJXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ej9pyGUn5SrBBkvL4GlHXowpbVUxWSAg7hSfXGw7awjWzMcaGTYXKj1v1pSV5bu7RR35XZJEjyZ/oqRHDkdfSEf8UroopCr/p10Dj8umJX+7zq8ZWj4twh3BzAv7kYP6kkAPA7OXJaGKqtKSe7aLRVwyFjETrlG2zJsOQU5Xm1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=XhImZHc0; arc=fail smtp.client-ip=52.101.66.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="XhImZHc0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+dmdMM3ASBm6ttHQpYZtmeUm+u5Io0+ek+MbJ+L87NDqPSfeyQ+SqaL426Qs/l1jSJhpi7ngm9ZW1v67Fin13ts6yvqjPH6qlDpXjSZ2gpForoIgqKcAGzhgbj7SXmrcWKHCpypyS93slY4yFN5W/G7FjldtsQkVdVDI6auIZDVM3YrxoD90vEHUwUe9VGQSCfky0geBS2AYzrjAYP/nQXhpLt/HB/N0iVUZcQYoFOSpqHsmdsnDf04Zq8DqTLrQxAVN5c5zfTt3DbJ8QO00FjXZjLU0nBxip0UUE13iAu7oNrrsfS2XH3NzRdw3MQj13wn/4MMzgRdV1Z2rrFl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yF85aJgSMXtw3n5D7Dt1dmtFN+YP3OBd0/9wnXR66JU=;
 b=XFCY2LYlQT6/EPfqI2gMnmMwkojQglvqcLtq6zJh//F0zwy4bPUSg2WIsC6vogydamtXARa0VQxJu/Tq5hj7Dcl5su3VOzUk5h5JzOQKeRH3G4lIsmmTOxB8jeIxP1aGjVhBHs+rJPQIqPzx/56OhWVGk8iyg0EUHAHLnj1CReUCVFEIo7Mv+8MQCvW5xg8ATzkZhYRMbT7rXBmsc+Rfzr0Stpp4Dy5g7B+q6MJM0ijLhO0P9xcvksj+c73cL711AWi6QAIPqZB6rxysXeiF+0IP5rWcHByR7uY/Dgje49mQmhckbVe40v+tzvRytj9s/Lm/nbf4JgwLxBXY8lvkdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yF85aJgSMXtw3n5D7Dt1dmtFN+YP3OBd0/9wnXR66JU=;
 b=XhImZHc069Z3iICH+kLX9lRCMmghVByYL9qDqcILxSuR1FPmc4xjr4nLu8Z3nCSC3C1JNJcvdGDcKCG8yfAcQGylfZC1TKxIb7Sf6XvHUubFMxUecHX+WAUX2roek0B/eNKKDj2I1YNOS6aDnU8VJPpj3R3Ha+VTJ0MhSBSVbHTuIQL0zNmO/2P9SrD9JOm2nliRjBxZHOZnTPaOexnD0e6277wQvkjrH63ryWiDerUZUlNBcSX/klQvRbRqzcmJoqpkyNxh+h6yCBfOtUbTei4uCy+y6CEQr99fLh88Z//uuP+fkppnw1pCjRw2WQpyi8NxoV15YDBw+k+n7Ibe0A==
Received: from AS4P191CA0047.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::22)
 by PA4PR10MB5539.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:260::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 06:38:31 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:20b:657:cafe::5a) by AS4P191CA0047.outlook.office365.com
 (2603:10a6:20b:657::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 06:38:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Fri, 21 Aug 2026 06:38:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:44:06 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:38:30 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 21 Aug 2026 08:38:16 +0200
Subject: [PATCH v5 14/14] media: stm32: dcmipp: instantiate & link
 stm32mp25 subdevs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-stm32-dcmipp-pixel-pipes-support-v5-14-d140efb61d72@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F98:EE_|PA4PR10MB5539:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1a9499-4245-442e-36a5-08deff4ed13d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|22082099003|18002099003|6133799003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	1+NM+3DMUPKq+1IFAKO/crX6par6mFyXpGkBZdXRmPw4sE9UdyOd9MOb4eMx8YFBAfxECu5NzxnhSJ+ts4RxHSKE7eXWWKxkfjV4nAx8oRqC6kIzObyiM4Er434mY1qCfOJ/B7QyHnBlhqHN2+WtOZjnfPuNhh6PPqN9dLsy+Oho8RsYUWw+E9ht2SzpibpYGnJf+HMidNvLTi/fbWqDH8ewEg9n5acKBbPhC6rwAQNm5jSyu5TjnPCGKCdUs786luUNqdo6pGE8GPs7jkAnj8DDYukFUiSQlVo2hugd8gIC7VEf61mcQ4J69z7f2rhIoqpofbTvVpaznT1YyZjy8OXkDtrRUsCpTYhZlut/O4a88dCTI/vxzzK4yRIuhdC8K71INryXZe3c3AfwpCi5fvAyLka7yA89ekPapVid8xOa3CAku9RIFDhwFMfGOdRV5qa/WYpXaYU3FzOhYeRozKyHrJT034pMh4KN1i5w9gIHMSo+f9RJRNiycgUCpglglnyUkIyb+7ZQ18e+E6hy5zvNxPbHpnSVpEbUvSvySzy8qNYxIp4x/lzuazKJMEM7hsbrEvRXFwQr8RwoPBLahFD6sDJ9M9ZjNGJ7gvxFBpjBH8Qj/2f1AICZHu+sS6eL20SioQ36TFfePb0idKcB4WbFLo7sjK1MLjKnCsgMdsY5SsNmQo33jCaFHAotIA+Nnxr8/XXZkSio8p4Vjl5nLA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WddynnkTOoBef8YaO2WR43/fA4vvndlIoLYsvBpYQ16vuYU/XQA3s7+9GGhAVNc+jC1wFg8cifPaC3aplGcOHu4ucMPEC6cBBY7svEHibBjMUtx7MDZzGpgUFmvTvl03dFap1O55xxiQpuelWklQGuFREUX3S98bXox5x7AMl52Gk26BtkB6LqFh52dSzWooDQm25oI4b9YdkHuO3SrAfqubTLw+6YglbZQQL0lEdaz04Iqij2XXYZVQ0ZCx3RA9f5x/KFFxNWYTm2Xl/bFS47eoylJA9frWCqpwL0Mk/yD+HzNMqymyXNgbx2Ag3bDVVghTLOpeLl+LyHM708kT7GBPOZyc8yuN5nNH7KMQTWksrjqxCDpvnCoHXypyDG08kgB59fBbXyozrVyRmUkl5yIoAXrM//XFsuwboacXMmHDqDZumuiKw/5VzwPMrmY9
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 06:38:31.5299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1a9499-4245-442e-36a5-08deff4ed13d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5539

Add topology of the two pixel pipes (main & aux) of the stm32mp25.
Do not make the link from dcmipp_input immutable and enabled by
default since not all pipes are always used together so when a pipeline
is not being used its link should be disconnected to allow proper
pipeline check.
Not doing this would most probably lead to pipeline start failure due
to incompatible pads configurations on the unused pipe.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 42 ++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index a52b3b0e3c375..4b6b42fd148fd 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -75,6 +75,11 @@ static const struct dcmipp_pipeline_config stm32mp13_pipe_cfg = {
 	.hw_revision	= DCMIPP_STM32MP13_VERR
 };
 
+#define	ID_MAIN_ISP 3
+#define	ID_MAIN_POSTPROC 4
+#define	ID_MAIN_CAPTURE	5
+#define	ID_AUX_POSTPROC 6
+#define	ID_AUX_CAPTURE 7
 static const struct dcmipp_ent_config stm32mp25_ent_config[] = {
 	{
 		.name = "dcmipp_input",
@@ -91,13 +96,46 @@ static const struct dcmipp_ent_config stm32mp25_ent_config[] = {
 		.init = dcmipp_capture_ent_init,
 		.release = dcmipp_capture_ent_release,
 	},
+	{
+		.name = "dcmipp_main_isp",
+		.init = dcmipp_isp_ent_init,
+		.release = dcmipp_isp_ent_release,
+	},
+	{
+		.name = "dcmipp_main_postproc",
+		.init = dcmipp_pixelproc_ent_init,
+		.release = dcmipp_pixelproc_ent_release,
+	},
+	{
+		.name = "dcmipp_main_capture",
+		.init = dcmipp_capture_ent_init,
+		.release = dcmipp_capture_ent_release,
+	},
+	{
+		.name = "dcmipp_aux_postproc",
+		.init = dcmipp_pixelproc_ent_init,
+		.release = dcmipp_pixelproc_ent_release,
+	},
+	{
+		.name = "dcmipp_aux_capture",
+		.init = dcmipp_capture_ent_init,
+		.release = dcmipp_capture_ent_release,
+	},
 };
 
 static const struct dcmipp_ent_link stm32mp25_ent_links[] = {
-	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0,
-			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0, MEDIA_LNK_FL_ENABLED),
 	DCMIPP_ENT_LINK(ID_DUMP_BYTEPROC, 1, ID_DUMP_CAPTURE,  0,
 			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_INPUT,	2, ID_MAIN_ISP,  0, 0),
+	DCMIPP_ENT_LINK(ID_MAIN_ISP,	1, ID_MAIN_POSTPROC,  0,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_MAIN_ISP,	2, ID_AUX_POSTPROC,  0, 0),
+	DCMIPP_ENT_LINK(ID_MAIN_POSTPROC,	1, ID_MAIN_CAPTURE,  0,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_INPUT,	3, ID_AUX_POSTPROC,  0, 0),
+	DCMIPP_ENT_LINK(ID_AUX_POSTPROC,	1, ID_AUX_CAPTURE,  0,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 };
 
 #define DCMIPP_STM32MP25_VERR  0x30

-- 
2.34.1

