Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020097.outbound.protection.outlook.com [52.101.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB4F35E923;
	Sat, 18 Jul 2026 20:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405397; cv=fail; b=BRwVnK9gc1DG/avkdXSyDdDpcr3HsvBfV30ABiEVAhsUfouC70zHNQqKbUuckHnbB3VrGyRA7RdeTBLpQ9Q9XZA+9uwlz/eyqU+nFGyLXxiZZAAOsskYQ0/zff4RDbI0l/r2ayCqQ3hwTcgm3h4mFcPT+iST8PDm1uJQtF2+E2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405397; c=relaxed/simple;
	bh=SXoFkxLLQk6HIVYO9veUxT9HrP9cGooE/H8rHRI4meY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h5Oedy1E71QHx8h08Z9dFxISx/dUm/9EwI2z9JQAJYux20B/J9m+ArKgFRafYiDqMeXNMVJLqDUfG48aTbv0s5nb1JIAa7VlLVwLmjo4r8PbdfqGv1ho3B24Is+02cCCY69rKa8rh/WwAoRzl976zaV/Yn8n3S/qrM+tQ7f2UNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=RIT/K7aT reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="RIT/K7aT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkrLjuEYx1OzEh5jgm7dfn4O92umF3ct8q0aVMkIvNmbjWoA5PoJ8xqtQ/vbx+BnSFiAlU5VyQKiGj0MSvinQyfKjbOEL6I8QxBoQOUy7O9mxnUvkAvlY8AUMzm9OUvkRGGd1dvz4/91GGiVSQ7Ed5xMqvy/zfOzJ5Nfr/sF1KD5var1KSvnoPMUbmWuO5ImxklY9GZO0f07sZjfllNlXF4ZPZ6zExuNR6d3NOhKLnn9McEkVjRZiSR0Ti7iYOM1L9ZAd+IOebST3saon8HUcYEwxbXIKMztaW7S0FfExKOTkXeh1waedbtPRLPXBqvPm8O30A+05+/n7Uf6yChcVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9bDRWzcIdwXL7DQbAFtsTEcGNurp130vgj2aNgSAA0=;
 b=XfGGK4bNeT+1S1O4DH32kG1PpvO5TS55hU8ddoEvrm2/Fo04ryfg2RHNpinP8Is+dAMEYDWo8SKIheiCyqQ9GF+TMbsiC1r5RhBTfOQ/QpOwESMtDAPYsAodiOuKE8E2GluROn7JMgmtNEfbQhpXMd+aQ+wmQsHH6/DkFdjPsrlMP55FmtYf69Fm32R1uU53rfvLyfMFOMHj35OixQkvW2J3zjUMMWR6ecUy0XhrERrEiX33ErbZCbcXWMyOLIfHIRknwHSZPhe5INd1NEFcJFenJJVeMybFz9lsP7/apRnp1UAzy0w0QCDroEpBaLZydfMuuXfMUDM97KSIdsG2fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9bDRWzcIdwXL7DQbAFtsTEcGNurp130vgj2aNgSAA0=;
 b=RIT/K7aT4aDbK9YawHWORspDSOaCjlU1ONBk+X5sMr/IR7DdgM8cU08GshGo0PRop3Wtd4Sm3+VqmbvSHsDvJymqZ1MsDnhOtU/2TNM0hGlM1DC+d/EZifkRDPqqGiZZbquY561dOnjsWAVQrRynJmOoxZuhRCS32xd/NR8m5Emu1KhhRbLn6rVER5qeX6zwbMa8bWMdUrESMfsuG25pnG+JYoqOY2hIZLyflT7SIb8Rr6bpa7fude2fhbP98tIiC46jOHT0wdxj5RZqlcvLwGPO67Mq+nB4WRIa8ofSZ97TbNWOQ8P4FrPPripX6C7BiEEz6rMe7pkCZmgbyty9gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1343.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Sat, 18 Jul
 2026 20:09:53 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:09:52 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/17] media: i2c: os05b10: drop unused group-hold programming
Date: Sun, 19 Jul 2026 01:38:53 +0530
Message-Id: <20260718200912.16001-3-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::23) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB1343:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e8b678-ae8a-4d71-ace8-08dee5088767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|52116014|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ibTL2G6TFNNts9H16Jeq8xApjVIyYcxlL2nAZkIr70+FDB3hyL7xFSl1tbFMSMnBTNprrrm4p3m5ZqMJZKRkWjteGrUSnJW595VvNWt4fGXNIVugl/SeDjTyZ+K8at2TslsbIrVawfVBycXtweUX16CBXTuIzl3C+e4lElkO14x+uJyWdnrNHskCWycrNFAeWGvWCDte6zXfc1Tc64veX5UxMEGnpnr4rQOwkACJBTKDXyrj0qG4xhPu5rG5WqidrNfq5a0go6N0e0IJdSl2VZCTWbld1G4P19smjqNmWW9vrniSwkO+xU6Pklyw7guLYqmO1mHP4ov+RZs0EZ2kSM6N6GawgEfpVvtzoK+H4P0a0IOsc0uGrzH5qefhIyvcCoHFXLmf5J2PkvzBalfQzIjeSunKuyjhQrhXs8rSyQB1sveq7GqwYjH13kRSc+7D/eVYahEQ+GxNyy8bvfaxjI0XaB/XRF3UF7upYXKJfWFcH+J4ljbz0S5MX/7ZEJVNK+08CpCxaCqICPc5ztZKc4RjzfOCrOXbb0UvePMd5/ydj8pSTSnXV7kreYtwFmRwFr8BrtWJUhYRvAEJrPjDUzxCKye5pxvLFOf4EWsa+QiVQk5ztmO/fTjex0pyKuy/sB4ynECTrObAf38Cmdd48hzdGr6oDkcfr/pOj4l83I0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(52116014)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XWi/Pz1K+W1nwYIUjik15Pe5HWsK11axFeohHXK+I66icUKImhgrdIdyECfP?=
 =?us-ascii?Q?YGXEt9gpxpVJY3Rd3WKTL7SJZZ0qrsGxueD7TeXSc6hNMak4c6/9xHKMcLjp?=
 =?us-ascii?Q?uzJZbikpKcuOCGY91mKkH/iYZAHmNnVPaANPdiqXrUBwFkqawegThBk1ydIL?=
 =?us-ascii?Q?JdP7FRZ2SiKs6rwJsFyNZrc9zYsDgCNfzsfqKpn24s4Unyvo2DCzl+jTsl4+?=
 =?us-ascii?Q?+QVj7RRbxwod2X9X2mNG9ow2e4YR4yS5Gx9mVORUV80f8GH2bwa+iXCkHsKS?=
 =?us-ascii?Q?WLx1W93QrfHxld+U7Yq6QBFj14JJqY4v0y4q8qPq5xoZOVa88wDZy4hJNSHO?=
 =?us-ascii?Q?L94WYfAVgbS1SBQ1FphewBTKDE6e3s3GTH5nRLapYoPX9lP2IT6CJ1XTFHgK?=
 =?us-ascii?Q?+Dr/GjesjObnwtnwW9O62TC//o24CbapFmCQQx7AS+aAzlgdEGcmrMBzZOX4?=
 =?us-ascii?Q?Y+K+CrWy/3WCSvfe13MEsz28pVxuVXChRaQRDaOVSmhLOxxJVJxmcS2qd2Au?=
 =?us-ascii?Q?9Q3FMWaJZxSmSFv4kMe/BXRAtLQAexvlNZs1TscWCdqxhi9SKj2T75djWRBj?=
 =?us-ascii?Q?TLSZhW4YN4seNZxXCvDnYA0KQPc1PCKX33Bbx1+FsegXHA2kNsfvTPe+NKt6?=
 =?us-ascii?Q?d53pWAifVXB7HDS6zVqZC35efJ5VYVPrnjTM0hXcISTQ9F832ceVqi7Y0Piy?=
 =?us-ascii?Q?SG+8EtMEy8loL/QlzdAYC+Q4wigEClqUk9Y8DofF/AGOaRnYHDzYAjySciXq?=
 =?us-ascii?Q?7vlwNrQIbGtTUXCQlly3qTZjLxWwlNZABn6n7PzvWSOwZT8NqtaHjttw/UFL?=
 =?us-ascii?Q?CrNKx/CcJNiHUV70JxU3WMs4SljaUxQJ2H0fWdfBkjoB9ABORX6yoshhZ6Cl?=
 =?us-ascii?Q?C0NRZa8MZWda43uejEsPNEZLTWMfhsCw/55xqMQzpQlS7NBQSlac61mXH753?=
 =?us-ascii?Q?T7ZP7+RJ5kkXT7Fz6E13h6/1+z6KTolKl8sHYD/23QC922un0GOGFKz49qRD?=
 =?us-ascii?Q?Yd1w4P0waiLbtvPvxSaO43tr8GntyRL0mWVzI4vVQFy2eaRvzWijHmEcpaIp?=
 =?us-ascii?Q?A5OFmSp7ffjIgEXzwz/97/HX4zyD1av08A6JwOh+ROVyk78sF1J3sIFdPFnW?=
 =?us-ascii?Q?rEZoJ/iFw5y+l7Mg9e0oxC9LEcEWBwBYzPlowu/WH8dMlvqDdfeVkpa01e7C?=
 =?us-ascii?Q?3BVD5QfV2zquKXHkVrZLzxzgGz6By89/+W7Yn4kT5t3QqcubfJLleAMVoYLc?=
 =?us-ascii?Q?imjLmcL3uiv1Y3Q6PGXvBCsErVOAxc6bca13pavNvksiBCZ0A9hsYT2JoqYG?=
 =?us-ascii?Q?7jn5+rZMOe5HltGSEMrTil6UFnYuaS6iEqfO99OqxKTZmZ9V/RjEj6ULVcVL?=
 =?us-ascii?Q?C0qxfNCwnjmKXAknTrSerlx09iqSl50g6E9PUd82aKrj6ifseg8zLZFk4lJX?=
 =?us-ascii?Q?iUAtdn8Y/Nf68ijWB18QM1OUlY4kPINnp+dXTTe5XhYX6pWpXmBnM87OtbFv?=
 =?us-ascii?Q?VOzyorq9KJetBnzdqIw2W/3ZALGcGTyTW/WzQcN6Iryf765+akAUoqoByLMs?=
 =?us-ascii?Q?tzV1EJxhw/LACbGHVVm0mQN6zUCBgftCKyrd1RMVupnhAyjpyae28C9PgSGt?=
 =?us-ascii?Q?NmBScoXKNFxA+e+L9pL4lAQ4443pPzqvI5dOD3xBKAHQY2L/+3XuZWxjO5PN?=
 =?us-ascii?Q?XI6dy5kTekrcQ04H0QLYrcT0zSxsaz9RuQOxonv56zPs4ZWV37g/2Fuxe1ke?=
 =?us-ascii?Q?hC+yDiWwBCQBeQWeMawVpa4w3xY3ExuppB1I9j+3vYOTuAbE100RflgIZnXy?=
X-MS-Exchange-AntiSpam-MessageData-1: JJGe3WSJPlkuKV0KTI17Zpf4ptKUJik1NDI=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e8b678-ae8a-4d71-ace8-08dee5088767
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:09:52.9312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BdhiGcA3qaL21R5x8hzWFUaAOtR0nL9zohOpx34MWHscZh/jGkKL2+9aEj++pa6I2CIi0CeJ1roVP/N/STM0mfUYQ1PjYe5oZkKsXzpJ2R0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1343

Register table included group-hold (0x3208) sequences for
groups 6/7/8/9 that only stage alternative tuning values in SRAM but are
never launched by the driver. Remove these group-hold blocks.

Also remove a duplicate register entry for 0x37bf.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/os05b10.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 3e0440220c07..84621370d1da 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -250,7 +250,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37ab), 0x0e },
 	{ CCI_REG8(0x37ac), 0xa0 },
 	{ CCI_REG8(0x37be), 0x0a },
-	{ CCI_REG8(0x37bf), 0x05 },
 	{ CCI_REG8(0x37bb), 0x02 },
 	{ CCI_REG8(0x37bf), 0x05 },
 	{ CCI_REG8(0x37c2), 0x04 },
@@ -415,42 +414,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x5820), 0x00 },
 	{ CCI_REG8(0x5821), 0x00 },
 	{ CCI_REG8(0x3222), 0x03 },
-	{ CCI_REG8(0x3208), 0x06 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x01 },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x1c },
-	{ CCI_REG8(0x3610), 0x37 },
-	{ CCI_REG8(0x3208), 0x16 },
-	{ CCI_REG8(0x3208), 0x07 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x17 },
-	{ CCI_REG8(0x3208), 0x08 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x18 },
-	{ CCI_REG8(0x3208), 0x09 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x28 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x63 },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x19 },
 };
 
 struct os05b10 {
-- 
2.34.1

