Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.137
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244506;
	b=KCtHNuVqUNPf93m20xBs5XLLMjdrCUeRSIFIdxRz9kl93Jr3EJ4T6Pb7MxwnLuhWhu/4
	 nQvn4JgN0P7U2KdIOGMXXfEbdjPzVFsXyJ29mZGAsG+s7zYaPQEhVfwgaFCiu+hirrPlb
	 5CVX9ULFxAgpmzDVX7a5616p6PpTrvwvjTBSa7Ax0Iu3sWuyfzDlZv9fgrBWujG0SEByN
	 g+iz7kiGaUBDaRgHZDDoCZAbxyW2EZuoRDWEilhdBJLnzOg2Zojf6/4lHcPMNyarqxU0G
	 cmDhg6Sk7Yu/W2ur45OixT8r3gmEz8RAZor+M9yI38/mmTBf50BOjILhbCitOUieeig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244506;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ICgWWywauF7jNA7531RZHSOsVExrer8px1HakVu8gTM=;
	b=lci2arLB+r5n0Vt9pbv86G1uvtuPYS8C3282cw64RnVHeUcXbsDKTrTkWzcCJQUmNFWd
	 risBJjjdw9LFusS6E22YAqW6/0c8HDIJ3aw1ruvcx8YJttC2zWjdMVdzlhccEvW/EKvDn
	 nVg9lWVCeZKDsUw5phFMPfca2+pwxhNFosZq2omgkiSXy2PwAYS91mLtDu8EMNXAtJmM0
	 TxQe25fojly7GH0vC9YXRiBhWCOQFS6k6zEjlRuhduXaJBLUZer4FyEAI1WhvVvsrpEEs
	 JWrXYSdRTIKELkMvJO3jPLNb7KhVkpi3PJ5oHYuUkNUsd3J4KAbiY76YBB1xyHzgJbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.137
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020137.outbound.protection.outlook.com [52.101.227.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEB9606A32A;
	Sat, 21 Nov 2026 07:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAEB9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N840C5FvaiD2NU5Fvq4cGutY5yCPYWuIOuUKiTOMDL14jpz6XdqVmmpQ5ZALQi9LuqOklZIEEi2u6EKkBhBnplfQ5I3jNOcXVOUlcg/HUTqjA6TbFgWwKVj0V+m2kQDhpAw8I5OycM4KTIxkRfmDPUZm9fi7HmrvqpPq5RAVv1ScLf4ZoLXz9nxzrEWwf8iW32TZrLnnPA+VafeiFsaU8+zkXwAsHizytU/4LqJrRSS8U++CUgrHIowJXG/aKyrTdaPTVOcaySkdlcs1wDla1elbiTudd1c2QUeKL2Ez5EYtdMS7CuDRHyWKMeYANWe8pbC0dPmWi2OKZiDYRF4Xcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICgWWywauF7jNA7531RZHSOsVExrer8px1HakVu8gTM=;
 b=mWSIBugumNtftPEfi/g8/t2r7GJlYiDXQZNaAWYUVvkjenPsFJmG6UkWS9n2+/GqlO22tCPK0YqTRpd7UXZZ1p6gvcdRHTKNR+LAiSQ2XQzlEnLEJCvlkxUI4fxk2pyNAeT+426YwlGFMiXRnhrRAouK4Eqkbs0LCn68sDT5LtG23KKhpJxnNDU33NkHEXYRKvjFD6vYXcyPWyA8pJUzwy5PJs57hRC/oLLvidaAY1HtipAFkj178bjjMCW05V8utTP3vX8VJi5CSTWD7Fcsfo0G9cJMIEcXXQuqo32NELOzhzZcZCm96bm6jaW46cSZUdaatHeyhXSQuok8DziOcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1768.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:01:40 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:01:40 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 06/15] media: i2c: os05b10: split common and mode-specific init registers
Date: Sat, 21 Nov 2026 12:30:56 +0530
Message-Id: <20261121070107.1768-7-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121070107.1768-1-tarang.raval@siliconsignals.io>
References: <20261121070107.1768-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:269::13) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB1768:EE_
X-MS-Office365-Filtering-Correlation-Id: 56db2eb0-4e49-4c3b-ddb3-08df479d4b2b
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|38350700014|10067099003|56012099006|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261028144727099003|261026140227099003|261102123227099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
 LFAlyJK/h+N2etMeEUFMFiRXSUrfmIRlTvD6gknKPAqgTT95migByJaDLWFKxzGxR1DVtLq0I2E1dN7sscE6yFnzP9VFAy1e6yC1doRQfWK9uT4ECixW3/O/CUflr9yRX783ytCNHyPGlNyLUM3Na2D3bf3Cib0Y3Gu4gUbP3VNAouFXAThFUaphYC0CXs/zIQ6FORMTiNt8lf3n+AaHZ9wKMFVuebImAgHneyg3f57fA9kBlwq7szjlpFxCmIEk89cIN9uZBMXcjOBbkB9M/8N/00kaj4P0ehx8pVpuHRf+0ZmG7mmawYRBOMrv+7TKYCUgapuGjY4G6uIY8RlWE8ITiX5D+WasBaX2IjhMdw1n3+0b01h6gQkEOrhQOwAqVOl9JkyZKJ8JQ8Uc5/XnKSMV0Sm0Dlw+0dAWwW55M94tSnQl/syQ+3tUCzZHV00RYhY7jVd8+cAuKk0fIRPD7JZa0x4ULaL/1K7nJw5uDH2Cno5G/bgZQprIzueDMW3UwvMeAB5npwjxsthmR/wP5wxkrDCfF5qZvLinckxFZr8IMjUY8sC37T0J2UUo0McxLXs0yiyazWDjkz/zXdzygvN5y2mGX2ECoJCb60B2UKy3NA+00B5LSGi2grkWLFGylfbCI8HQ6StiyTOCoIEPL9Ag0FtznSr9R+ABAT9o319CI0ROAxJ3tfOKf7LhVROUFwycg+qiwnYhSyrQLCu+cP39CzEEEU+eNXrqpEsyiuY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(38350700014)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261028144727099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?+0l6qcveAXHmWNZtzhx7FpG8Ba2Q9pFRYrrXoTzM3BVlBDJiiM4W0uY4msVx?=
 =?us-ascii?Q?624b5MrI+GzTcJ4PDa53iTDw3p9+QbgFRJcIWTXSh9WX6GiyYUA4k8pgknW/?=
 =?us-ascii?Q?huG2U09O+7C29RYH8zbV5FgDlEID1HKlCKB5OgKFfUkquYVFxVhfX/Fm7KJD?=
 =?us-ascii?Q?Ajugyw8inDt8jkheXUW2rC55r63BmHm0Xcx4ysINPZpjbsyjGh9GofaS0ieo?=
 =?us-ascii?Q?FAnwbKy91kRqXnuZNzQfwevcJzKAMMz+SNAR8arR5Iq28m6hifvAUT9GRZ6M?=
 =?us-ascii?Q?hfB2rkfDeyj3oUWJTYo+2vmiPyNc4F23npCGKshjm+fBaxHqG14OGT/nir/C?=
 =?us-ascii?Q?UkjPSjblGvpPjp5/BkohG0YDAQ9O0RvCVzMSDVE67NA9p3TQ85W606o59+BK?=
 =?us-ascii?Q?wf8g8E04F1dhXMLf3uWjPqdVPYH+yL5YOeiaJte2PRFmJGO5GW70ZZERHflX?=
 =?us-ascii?Q?f+9ar4GKTlmyimLrky8KBowAxo3Z/AGlpsldmcWJI8+fMchzfcwXUVPdzxrr?=
 =?us-ascii?Q?ZJf6UMhMEN8Umy5pTz94JgGBLl2MgqZ/VJTa4NUDbpTB6uymdDd1N9sLzSC4?=
 =?us-ascii?Q?6O1LolRu/W69qbjp7BFx1lNtYzxemAHPqtzuQYxLmuAOgz1f08t077XLtmbu?=
 =?us-ascii?Q?PGoJxs0khN2QVQLFSe2yKkHmR4MB3tmv1dZRCwR7lV6U7tZkD58BFzfH+/M3?=
 =?us-ascii?Q?ofJJIghU10ajIjKRpABtBuNxK/zETRMhcK9vfDaALblAtBLescpm8oaYXrd9?=
 =?us-ascii?Q?+7ervYuvscq0x62G7AfzLodt+dbe0PwmT09jxIexcGezfQm5RvvF8hN/SFor?=
 =?us-ascii?Q?2nRmiK3Q14UDOdOvQYK29E1nEb44ljGwlEvkgQX3r9qH0GqJQA4L3DHYST7t?=
 =?us-ascii?Q?ojlJZ7DDrW78Nr/3zUsRXjmKOAho1ZK2eNyyR16maZp7tb1dfjmUvTMegAnP?=
 =?us-ascii?Q?5FmLY3nIpdvxHbcuH0XoGSVzaTKoIbgGKAtlE8WF9vJ2hPQY7xaXnHGaY8u9?=
 =?us-ascii?Q?HB5LavPD0wzusxsRdSRx48fuk3YzznMovmJdv8NV020QTVnShqT211oi+605?=
 =?us-ascii?Q?VBoZDAhxeOnXVUaZuJZJRI9jTQZenI7sSjDChWZa96rOUxnG4leMhbAuF09e?=
 =?us-ascii?Q?qhaxUHHdTFw884y6m4LGAWLtFI6y5jCScv6b2dLC4hQ5Dy5hhYXz6ELIhagG?=
 =?us-ascii?Q?GnfyP7Xm59RM12FVKnuwpVx6Mp2fbifjUeXxKBdKHY/Y7A79PSy9Q5HYtdk7?=
 =?us-ascii?Q?15QJbsqauoF9XdYjqm3iCjhzMS5WGYic6ZgmRhW9zP3lfS2uRHp83b/lpZeh?=
 =?us-ascii?Q?rMHH6XVsyWiu4i2mbPuSQW4v8u4yaLnnUKNTqFWCi0HHHBybHJwSoXLsfZpF?=
 =?us-ascii?Q?3ZiQEMI7kmXd1UKkItmKotonposPJ5Rqb5H5qjQwliLr3wYGCfrvp2Vz5Pt5?=
 =?us-ascii?Q?L3sbsu2ZizG8995IZf2qK8h3HMAtVSF7gO8uJhJhvHkdLz9paE8ApktbXxby?=
 =?us-ascii?Q?BudAsByTE7Lk+pLVtyUSHTYowPg4oQ9QLYhZHf6krAOa3qB/YFo+vTxeEa+H?=
 =?us-ascii?Q?VZ0XLLg5EKTaR2CRNzOFNuVEiAQd1IyAuaSbarBX5UePm6mZlln4asK9xCJP?=
 =?us-ascii?Q?ng+rbYE4XPtKiEO9TuYpSNVr40vQRNyiFVwVQpyLIG15fweHR6tCgpJVqs7l?=
 =?us-ascii?Q?6GM6NZVV2LieJTeHisYKOPUDbKvRQzT98t4CjW1+J2S81d+ezvYpuSqUzoHo?=
 =?us-ascii?Q?lW2CjLgd3PfTfhj/7sfvn9fimKrrKzE=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 56db2eb0-4e49-4c3b-ddb3-08df479d4b2b
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:01:40.7605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJ7p1C/jNvTmvd+Tbc5gmP27oLe+z9n2sX5Tki2LhK+2hLmSYqeZ3m20OHywsh0mqi3Kv1E5lYPI8LeNkSc2xtWaI9KkMfaUjhAw00BfqHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1768

Separate common initialization registers from mode-specific settings.
Move resolution-dependent registers into a per-mode register list and
program them during stream enable.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 96 ++++++++++++++++++++++++-------------
 1 file changed, 63 insertions(+), 33 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 3f478bad1fbc..46d514d2a479 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -138,16 +138,13 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
 	{ CCI_REG8(0x3600), 0x4d },
 	{ CCI_REG8(0x3601), 0x08 },
-	{ CCI_REG8(0x3610), 0x87 },
 	{ CCI_REG8(0x3611), 0x24 },
 	{ CCI_REG8(0x3614), 0x4c },
-	{ CCI_REG8(0x3620), 0x0c },
 	{ CCI_REG8(0x3632), 0x80 },
 	{ CCI_REG8(0x3633), 0x00 },
 	{ CCI_REG8(0x3636), 0xcc },
 	{ CCI_REG8(0x3637), 0x27 },
 	{ CCI_REG8(0x3660), 0x00 },
-	{ CCI_REG8(0x3662), 0x10 },
 	{ CCI_REG8(0x3665), 0x00 },
 	{ CCI_REG8(0x3666), 0x00 },
 	{ CCI_REG8(0x366a), 0x14 },
@@ -231,7 +228,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x370f), 0x1c },
 	{ CCI_REG8(0x3710), 0x00 },
 	{ CCI_REG8(0x3713), 0x00 },
-	{ CCI_REG8(0x3714), 0x24 },
 	{ CCI_REG8(0x3716), 0x24 },
 	{ CCI_REG8(0x371a), 0x1e },
 	{ CCI_REG8(0x3724), 0x09 },
@@ -240,7 +236,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3730), 0xe1 },
 	{ CCI_REG8(0x3735), 0x80 },
 	{ CCI_REG8(0x3739), 0x10 },
-	{ CCI_REG8(0x373f), 0xb0 },
 	{ CCI_REG8(0x3740), 0x28 },
 	{ CCI_REG8(0x3741), 0x21 },
 	{ CCI_REG8(0x3742), 0x21 },
@@ -286,8 +281,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37ac), 0xa0 },
 	{ CCI_REG8(0x37be), 0x0a },
 	{ CCI_REG8(0x37bb), 0x02 },
-	{ CCI_REG8(0x37bf), 0x05 },
-	{ CCI_REG8(0x37c2), 0x04 },
 	{ CCI_REG8(0x37c4), 0x11 },
 	{ CCI_REG8(0x37c5), 0x80 },
 	{ CCI_REG8(0x37c6), 0x14 },
@@ -296,7 +289,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37cd), 0x17 },
 	{ CCI_REG8(0x37ce), 0x01 },
 	{ CCI_REG8(0x37d8), 0x02 },
-	{ CCI_REG8(0x37d9), 0x08 },
 	{ CCI_REG8(0x37dc), 0x01 },
 	{ CCI_REG8(0x37e0), 0x0c },
 	{ CCI_REG8(0x37e1), 0x20 },
@@ -309,25 +301,10 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37f5), 0x00 },
 	{ CCI_REG8(0x37f6), 0x00 },
 	{ CCI_REG8(0x37f7), 0x00 },
-	{ OS05B10_REG_X_ADDR_START, 0x0130 },
-	{ OS05B10_REG_Y_ADDR_START, 0x0000 },
-	{ OS05B10_REG_X_ADDR_END, 0x0b5f },
-	{ OS05B10_REG_Y_ADDR_END, 0x07a7 },
-	{ OS05B10_REG_X_OUTPUT_SIZE, 0x0a20 },
-	{ OS05B10_REG_Y_OUTPUT_SIZE, 0x0798 },
-	{ OS05B10_REG_HTS, 0x06d0 },
-	{ OS05B10_REG_ISP_X_WIN, 0x0008 },
-	{ OS05B10_REG_ISP_Y_WIN, 0x0008 },
-	{ OS05B10_REG_X_INC_ODD, 0x01 },
-	{ OS05B10_REG_X_INC_EVEN, 0x01 },
-	{ OS05B10_REG_Y_INC_ODD, 0x01 },
-	{ OS05B10_REG_Y_INC_EVEN, 0x01 },
 	{ CCI_REG8(0x3818), 0x00 },
 	{ CCI_REG8(0x3819), 0x00 },
 	{ CCI_REG8(0x381a), 0x00 },
 	{ CCI_REG8(0x381b), 0x01 },
-	{ OS05B10_REG_FORMAT1, 0x88 },
-	{ OS05B10_REG_FORMAT2, 0x00 },
 	{ CCI_REG8(0x3822), 0x12 },
 	{ CCI_REG8(0x3823), 0x08 },
 	{ CCI_REG8(0x3824), 0x00 },
@@ -337,7 +314,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3829), 0x03 },
 	{ CCI_REG8(0x382a), 0x00 },
 	{ CCI_REG8(0x382b), 0x00 },
-	{ CCI_REG8(0x3832), 0x08 },
 	{ CCI_REG8(0x3838), 0x00 },
 	{ CCI_REG8(0x3839), 0x00 },
 	{ CCI_REG8(0x383a), 0x00 },
@@ -358,26 +334,19 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x38a7), 0x04 },
 	{ CCI_REG8(0x38b8), 0x02 },
 	{ CCI_REG8(0x3c80), 0x3e },
-	{ CCI_REG8(0x3c86), 0x01 },
 	{ CCI_REG8(0x3c87), 0x02 },
 	{ CCI_REG8(0x389c), 0x00 },
 	{ CCI_REG8(0x3ca2), 0x0c },
 	{ CCI_REG8(0x3d85), 0x1b },
-	{ CCI_REG8(0x3d8c), 0x01 },
 	{ CCI_REG8(0x3d8d), 0xe2 },
 	{ CCI_REG8(0x3f00), 0xcb },
-	{ CCI_REG8(0x3f03), 0x08 },
 	{ CCI_REG8(0x3f9e), 0x07 },
 	{ CCI_REG8(0x3f9f), 0x04 },
 	{ CCI_REG8(0x4000), 0xf3 },
 	{ CCI_REG8(0x4002), 0x00 },
 	{ CCI_REG8(0x4003), 0x40 },
-	{ CCI_REG8(0x4008), 0x02 },
-	{ CCI_REG8(0x4009), 0x0d },
-	{ CCI_REG8(0x400a), 0x01 },
 	{ CCI_REG8(0x400b), 0x00 },
 	{ CCI_REG8(0x4040), 0x00 },
-	{ CCI_REG8(0x4041), 0x07 },
 	{ CCI_REG8(0x4090), 0x14 },
 	{ CCI_REG8(0x40b0), 0x01 },
 	{ CCI_REG8(0x40b1), 0x01 },
@@ -397,7 +366,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x4305), 0x83 },
 	{ CCI_REG8(0x4306), 0x21 },
 	{ CCI_REG8(0x430d), 0x00 },
-	{ CCI_REG8(0x4505), 0xc4 },
 	{ CCI_REG8(0x4506), 0x00 },
 	{ CCI_REG8(0x4507), 0x60 },
 	{ CCI_REG8(0x4803), 0x00 },
@@ -409,7 +377,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x481f), 0x30 },
 	{ CCI_REG8(0x4825), 0x34 },
 	{ CCI_REG8(0x4829), 0x64 },
-	{ CCI_REG8(0x4837), 0x12 },
 	{ CCI_REG8(0x484b), 0x07 },
 	{ CCI_REG8(0x4883), 0x36 },
 	{ CCI_REG8(0x4885), 0x03 },
@@ -442,6 +409,42 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3222), 0x03 },
 };
 
+static const struct cci_reg_sequence mode_2592_1944_regs[] = {
+	{ OS05B10_REG_X_ADDR_START,	0x0130 },
+	{ OS05B10_REG_Y_ADDR_START,	0x0000 },
+	{ OS05B10_REG_X_ADDR_END,	0x0b5f },
+	{ OS05B10_REG_Y_ADDR_END,	0x07a7 },
+	{ OS05B10_REG_X_OUTPUT_SIZE,	0x0a20 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE,	0x0798 },
+	{ OS05B10_REG_HTS,		0x06d0 },
+	{ OS05B10_REG_ISP_X_WIN,	0x0008 },
+	{ OS05B10_REG_ISP_Y_WIN,	0x0008 },
+	{ OS05B10_REG_X_INC_ODD,	0x01 },
+	{ OS05B10_REG_X_INC_EVEN,	0x01 },
+	{ OS05B10_REG_Y_INC_ODD,	0x01 },
+	{ OS05B10_REG_Y_INC_EVEN,	0x01 },
+	{ OS05B10_REG_FORMAT1,		0x88 },
+	{ OS05B10_REG_FORMAT2,		0x00 },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3620), 0x0c },
+	{ CCI_REG8(0x3662), 0x10 },
+	{ CCI_REG8(0x3714), 0x24 },
+	{ CCI_REG8(0x373f), 0xb0 },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37c2), 0x04 },
+	{ CCI_REG8(0x37d9), 0x08 },
+	{ CCI_REG8(0x3832), 0x08 },
+	{ CCI_REG8(0x3c86), 0x01 },
+	{ CCI_REG8(0x3d8c), 0x01 },
+	{ CCI_REG8(0x3f03), 0x08 },
+	{ CCI_REG8(0x4008), 0x02 },
+	{ CCI_REG8(0x4009), 0x0d },
+	{ CCI_REG8(0x400a), 0x01 },
+	{ CCI_REG8(0x4041), 0x07 },
+	{ CCI_REG8(0x4505), 0xc4 },
+	{ CCI_REG8(0x4837), 0x12 },
+};
+
 struct os05b10 {
 	struct device *dev;
 	struct regmap *cci;
@@ -464,6 +467,11 @@ struct os05b10 {
 	u32 data_lanes;
 };
 
+struct os05b10_reg_list {
+	u32 num_of_regs;
+	const struct cci_reg_sequence *regs;
+};
+
 struct os05b10_mode {
 	u32 width;
 	u32 height;
@@ -471,6 +479,7 @@ struct os05b10_mode {
 	u32 hts;
 	u32 exp;
 	u8 bpp;
+	struct os05b10_reg_list reg_list;
 };
 
 static const struct os05b10_mode supported_modes_10bit[] = {
@@ -481,6 +490,10 @@ static const struct os05b10_mode supported_modes_10bit[] = {
 		.hts = 1744,
 		.exp = 1944,
 		.bpp = 10,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_2592_1944_regs),
+			.regs = mode_2592_1944_regs,
+		},
 	},
 };
 
@@ -652,8 +665,16 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 				  u32 pad, u64 streams_mask)
 {
 	struct os05b10 *os05b10 = to_os05b10(sd);
+	const struct os05b10_reg_list *reg_list;
+	const struct v4l2_mbus_framefmt *fmt;
+	const struct os05b10_mode *mode;
 	int ret;
 
+	fmt = v4l2_subdev_state_get_format(state, 0);
+	mode = v4l2_find_nearest_size(supported_modes_10bit,
+				      ARRAY_SIZE(supported_modes_10bit), width,
+				      height, fmt->width, fmt->height);
+
 	ret = pm_runtime_resume_and_get(os05b10->dev);
 	if (ret < 0)
 		return ret;
@@ -666,6 +687,15 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	/* Write sensor mode registers */
+	reg_list = &mode->reg_list;
+	ret = cci_multi_reg_write(os05b10->cci, reg_list->regs,
+				  reg_list->num_of_regs, NULL);
+	if (ret) {
+		dev_err(os05b10->dev, "fail to write initial registers\n");
+		goto err_rpm_put;
+	}
+
 	/* Apply customized user controls */
 	ret = __v4l2_ctrl_handler_setup(os05b10->sd.ctrl_handler);
 	if (ret)
-- 
2.34.1

