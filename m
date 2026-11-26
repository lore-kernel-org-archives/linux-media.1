Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.94
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795673014;
	b=EMxvbQAvUuyhkGndQ6g/lNDwemhlpaUsRUwcUF1a5jJStkGW6I/EEQFnqE18ujjKR3AV
	 WbSaURS8FSi1sHq/XIF7tgEzM6G44Mn1X46vQIa5H/Y5RbM/uygnDN0CJ0Y/r5C0XTD+6
	 IikdL1V5SwW9AiT2FT6nbmGRoBArwYjCX9sOCJMOblVw8iaFutRfUndyFEP5TBxeZsk4I
	 msHEJ27ton5TpVSJ8z9K5nBekwNTnb9Sy3jRE1LCje/x7b+ZStVM7IhtUcrHZiEE7AeI1
	 xVgnoI/7eJX2EYy0vKUQKrbnQW0nsYNtjybOyyTmm+bx+09C6HF+KS3ofLB3d1Ez3nQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673014;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Jy3e3jq4VAzlJAzKkf4w6BvE1tGzL1O9eNC+XPVp5rA=;
	b=a45X3NG/St2J7PuNy4ItAB+fVOmT/sZkTRjGFQBLZ2mCbnmNZG5rbr0c9ijtuJeTKWWH
	 xSwm7rxZfOHXOmBdbnq2r5kzmdiyi7t5E9k3f7ocP2sPYdSdCdT7v4q9ZwrSwjpzoFpvE
	 cxhsrXoOO/+bxilkV+ptDd1a4/2G7NkDzzvOJzpn+9Z20PBbARcV7OFsMdOqeONRBO25i
	 tq3eTzvxPozqzNau96NfMcgWhxEg1p4Wc34AAq/AyCGQ+bABgjCI5osziSfGmrtJ8JEa3
	 FyHmX+gIflKQrmPkG90+vY1YLgYwbp3htpr0oEjx9/A4u1aSozOlv3y9vTrSd7R1Tfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ebytelogic.com;
	spf=pass smtp.mailfrom=ebytelogic.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.94
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020094.outbound.protection.outlook.com [52.101.227.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1591606A334;
	Thu, 26 Nov 2026 06:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1591606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+DW/hMVuzmO6BZ9I5ZCCW8muiomhfl6am/Ore1I2Ih9UPEtZQhQMM0Ua+LInPfPCv+FfdcHD/iYHtLUX2/6laWlHloZ0k1fb/xG8oE9DtqnaO/pOe86inXefOty89VHcNsfBMHMIUGKU3xJQ3+W/ApgSpM8mj+iTiJ324dQ+2rgsOPrlRmRP7RXnz5EQv7eJiPugPqh5A9FbaHBN0kxZ0N9g/dqDPdwFsCzp6a1gLPonxZ0HOQsWkcErU+a5ZA+vTeFgRTzcE7V7ZLzsHX+MMZr0SDETwg+lXqwyEQ9dKSWlwawLfF2d5NzdJmkb/xt2GYRgc+EeH0zUZLzTsgRAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jy3e3jq4VAzlJAzKkf4w6BvE1tGzL1O9eNC+XPVp5rA=;
 b=ZBM3ZHLufKZfH2XZAmgx5CXg570TT50kJrGO9MN+OsoRMmRejzrvieo2T1cPljee/nSli6brwLdtGTsEYceJRr2bEX7drAnmQNFwPU1ssVoXdg432nCb1GOI6CGGVWgEKLUfecF39roTY8go5dvvC6J1JsAabaRc33BTDI3XOP1S4p9y9GZm+WCMsSyAlWe+xAgJVfnyqnc7hiA4TeM7DR7D65JVowBIy3YZMvC+hfVAKOpon1aykBlWsqtxEjb1wVKrnSPMnPAy7JT+UPV/dYzg6FTwnTvFTe/B/ZSSkRhWkHMjGrcpQX/+y5c1GNDYl7Gx77oVTHV7RVfutoNx4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN3P287MB0070.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 06:03:31 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8%8]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 06:03:30 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	linux-media@vger.kernel.org,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 0/11] Add SOF sequence logic
Date: Thu, 26 Nov 2026 11:33:16 +0530
Message-ID: <20261126060317.3696384-3-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0050.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::16) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PN3P287MB0070:EE_
X-MS-Office365-Filtering-Correlation-Id: f058499d-f56f-4e36-1633-08df4b82fef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|23010399003|10070799003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	zXd6GvuUvkx4LPq2Ll/gDPoq7gEi/z2NDSfOBmNKw8L3wDqGiWSWRt07vqT6C3ZihfNie0Y7xvZeKrmlKHn6Hqu6o1msl3mEftSrba3WI6c/H+pVFZQr6wAh01slrepzluvuRrGJE0YmkbWnE91ExXQ1kOLq+JJH1gsGfYKexaO6TY7BHxk97zwQBfDAo1omah8APFm80XRxHuKxN6IsN3cqWQZWxD6c+F6ITzbWqhyGSRCF1MzOih5uod/n6R60uu9a0xo9j31i9cRV4EPZ4+H2gQU4aImdOE96vgH3m9BQq+9DBKzslrOqifjrQwvDK4BojS1pWKieTcY09ne9Dmw/ZRpcg+iyHj1hmqfJvWGC9Ts2CFUCFwGQAylHA+5BdLbcIArMdfMD12ePtG+fcMpVabgb9Qcg7ZSN9gWZ5ibF+7KsG+eZhG1HnEiWdAsSXtylQbQ7vN7S1OEkdwEodmlPIf262in6+iUIxtaeLMzIGloRBcvOaUGkax7bkhbYQSpRLfUxHXpo9QOsnoC1uQjLwG5YrVBlRU4w35VZmxEhtBxSF3AP1+glkuG7r0XLYrbQSZ2rT/sS2St5tS2L9CBpk1FuUuOdeOftxzmutAoTRDirdh17tPfBPkSGftOhgzR4duXJEEO7U9k256lNRm7yCC35VZYDMSbXqkpPzh0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tzRvV+8dQ9VijaFj9NHztkGgC0qnqhV2T2lBBYgUa6eEm7aAQ4cVs/raVy1L?=
 =?us-ascii?Q?6kp3vLagwBFR1AkRCVY+JCLdLehLHxPsfmOqQqPZDKSuHvZr9gZ5ULXgwoTk?=
 =?us-ascii?Q?T96ovqxtYvotToZ+2SIG23qw2GLinCGP43e0mnM5dM1KWTRuE1SKqXhuAw5V?=
 =?us-ascii?Q?9B656o7vnIPRCnR5B5Gc4eCxBfgtyiyRbzbuzNunIaCceiFEO6UMTCXwjSib?=
 =?us-ascii?Q?vE816eHBaDRmtgzvR6HfvJgZn5Pq5+ex8w5HZzFoRsSjOx8PDloe4hJRGrpL?=
 =?us-ascii?Q?IYFghUknAtU0tmG5C9FDjgiPv2xrcnQUlJ9UdKTwx/j39cf2WiB/bPCoCDWi?=
 =?us-ascii?Q?zRzco59BdRABH46al16NIbdg3dgj97XEFCoxUuWPLlJtQ+jX6kbgQBkyHN0E?=
 =?us-ascii?Q?QT3HzAXQNe5MSrZBj9Wh6i4KwZsCe+3OLGZCnHnjk5Sbt4xZwbo1tO0a4jm2?=
 =?us-ascii?Q?40ZzykmUs6SYmLWVAY1zjhLC3EGhAkdUADVKD1uBypxqSCHPyuQe6DVh0e3d?=
 =?us-ascii?Q?yYpBnB/CHUNUNBzIs4wbUQxZpLV3RIGzBdbr5cXKgN9PlgOSXDZwHeMnnk0e?=
 =?us-ascii?Q?EMucRYi2SXUEe+Z4fQmPy9MX3J/uX+KO54y6HrtXg0krNabhmR/ie7N9258I?=
 =?us-ascii?Q?t296tRjKfveMQ9EgM9P9fkSvjub2yY4vt5xpU+8fW4AuBhivLRlP4WDPhODG?=
 =?us-ascii?Q?yET3uQo+9mgwrQRTWv/ZrdTqCcpKxGlVnyBIHr/WZDR83P7WfeiLShHN4UsC?=
 =?us-ascii?Q?QNrpqPPXDqXVBGVa525EhtE/VZVuVCje+oklmMM8FAC+qPnBY2wTjrUwr7a2?=
 =?us-ascii?Q?OhgDCpz2HgXnLPgWCm3QarF9F2nlFbwKGmwznT7K/KfBazZQnPzEmglaq/ZN?=
 =?us-ascii?Q?eyDg0g5hxZZ+5u2OE4U6UKQ1w2zNqCWJs2ghdFQ1sQwhvuQfda0XT518DWKy?=
 =?us-ascii?Q?d2q3tftbxF9gBSNPXnfpADpXL9sTQ0GJIWq1nS4lQw3D6WJzzaQ7h0VuOjKC?=
 =?us-ascii?Q?ZUZZFoqH01srO2Fi0c+drod53be/iFvjgSjXTz0/ha+GeXBtNUseHrnhPT8i?=
 =?us-ascii?Q?vgfw9ML1cbHsd5XUr1T7bDMbDBKQFOiKe40wv27MToBhlRc/4QFU0HHKLwzB?=
 =?us-ascii?Q?AByLUu+Hm2Yjqp6pKsubH98VbHk077mvLTWwYsGR7a43Wc30a65gNiqLxJaf?=
 =?us-ascii?Q?lLmHKlqZux4jL5yewAUQOC1SKHSg43CjzqNN8G2DOUeWh8sh1PglNY+XU9VE?=
 =?us-ascii?Q?rraK/m5Hrwy1XVNIn8KuuM5eIqvERXWW/lf4xwduUKPHNHpVGM+LEATRDrFK?=
 =?us-ascii?Q?8GLvOdt3GH7GNBZSu7HKOQNSBidw2WqgzNJr9fw7pqBIelrMr0xWEicIEICm?=
 =?us-ascii?Q?ikatg36eIm0vvrqW4DTFnGx+VpkW8aXOydxmFYmBhqyrKmTQzwR0AY4ttYlU?=
 =?us-ascii?Q?7vnOsLUdvPstPFPdFpaifm2aO50/lIslbgRBZ/uxOO0rvAHYqXE2FPR65p6s?=
 =?us-ascii?Q?uS9s+6d5PKuh5loOIdlSA+GwCxl0jFsY2vjFcAmL8uGxmEWT8lV6anTlVcOQ?=
 =?us-ascii?Q?CL1WBILPca8YY4iIJAFzlnwKo3R6gmF8w5nOKyn1V5KdGme48C+xXBv3V1xr?=
 =?us-ascii?Q?kQ3Xr4lSrkQtsElSyvYQmgUL5IkJOARyjg2dTWpTAbW9vxeRbmDm2MsfsbvN?=
 =?us-ascii?Q?jGoNNDuA/2WZk+OVJ+0yDoncBrlL2xKmDwVmjpOtNSliHv88xkAAVL3XJ1S6?=
 =?us-ascii?Q?NRT7mU80o4Y88fa48LH1JVxFvzOQWPS4ZbkwYQGKxMZ4WFmZp6RD8ADLeN96?=
X-MS-Exchange-AntiSpam-MessageData-1: bucJzvLY06PE9Q==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f058499d-f56f-4e36-1633-08df4b82fef7
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 06:03:30.9244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8f+qXlzKoU2d3hsH1A80RFTE0JqNWcVAri4Xgu1aORCPttMDz9wmh6R5fe7iUyEjCFoQR9sDBdl7K8D8XPMsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0070

Hi Bryan,

Ran this under Gjorgji's streams v2 on SC7280, RB3 Gen 2 core kit, two
GMSL2 cameras behind a MAX9296A. Gjorgji covered RB8, so this is csid gen2
with real sensors rather than the TPG.

Tested-by: Hitesh Patel <hitesh@ebytelogic.com>   # SC7280, csid gen2

  imx900 SRGGB10 2048x1536, 10 frames -> 39321600 bytes
  ar0234 SGRBG10 1280x960,  10 frames -> 15360000 bytes

dmesg clean.

Hitesh
