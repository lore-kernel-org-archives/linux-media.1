Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013045.outbound.protection.outlook.com [52.101.127.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42A6439F6E;
	Thu, 23 Jul 2026 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800523; cv=fail; b=kglmLu8z52e8PRJOPpxOX+hzXtn6Y+pknV1BRS4fG3568wQ+X6BnhtnwRP52lA/P3Dbbna24z14bvEDh51iVDFSFPG4BWGB/aL+t6q/SQdHEkHu0YOVsxxrPSY6hgNV9jFhU90fGyRiZcVAQcYxe3ydbk0jFITeItcDVNFOGGkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800523; c=relaxed/simple;
	bh=sQzNdFzop6aOfNFzVqScn+VyhQgxPriI1NZ/LwHfivI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c4tko1d4N+a4wvApZdrZ1H427rbBwhLliPQVnhb3UeLqAXaEeR6E/c2jyq1h/txthjslRmTRkquhKQBM9pv4AqbNbBsfO3bdbkf9QgNDZuwjviNirB9tm40lFvHMMX86nKDJnzgCeRWETdqRkwtLo284jWeTubG6/xqnGxSZ5wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=dMEq6456; arc=fail smtp.client-ip=52.101.127.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="dMEq6456"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHi6Dw/XwR/xV+cEJo/irFWczUpicqcoCWOZE1pJXB+oyq1AXHElWYSA9rY5MMr0iUTr+rnQTgxdZwAs4PWgaEtkgH6HyiKvlSBHyMwOD0+Mk15wjpT+tVv8EqcLKi6kHxI5cCC0/9wD8izjNgxPagDRjv5bYJ8Aahad2Iv2Un69hgY+epGxvznks5x+IeJ69ZYdQkpumYlEUTKiy3EcqWThPCIZepz+4DdQcvgZRtbowmPlL8y6UAG/u+vzEBLMl4AplkDCcS5GvjZAj0+7tHistamKTn7gcStyJHUP4kcKr5ST0+rOTCCtXQgKnzE/xom/KN3NcWIRW/B+xqUJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoDr+8vvtzqen80dtECBFVQAZVn8/MinyxtadDwkw1Y=;
 b=dSQtR+NNjHSIGQse1hHWlT3WN1flRH9aojeq4n654wPaY89MDUgmGKix6a1DZx4qTG+c4ADG8HryH5VBhouMmGqIs+rGYHulE5BCW56UmDoFWrNiT7EJonS85e95FaMhtwdKDxP+wnGgIUrMIA6yCnty3hDgCkOqGNkWcQl+8DesqPIDI3O7A3aqMJ9zZZD+UphAHfQdRYgq+8o+GhsofEh0RzXTLKYellnv2HciYS29jMWu1V2P7LqBpL6UkX/04VcFcnlMQwUVJ1taXN2fgMhD9c1KH2ig2z4uB2hvAim3H8YQyQYypX8Pqtf19MBawMLbGkyo1sNdUcaFBkPHlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoDr+8vvtzqen80dtECBFVQAZVn8/MinyxtadDwkw1Y=;
 b=dMEq6456nlo8TY21/wqoMSh4nFg4RdzhIm5I2UpgzUs5kcqzVxkzURDpFSw1n57ftNL2F+aF7px/WehvBvPhw1HoRNoF5kxu3AvQwttcz+LA0FVJqqyHKE3OkMZiwr4+pyK/KZ6Re5Y4kssT/mAJF8BzH3FtH+BcrlC9ooQXBjYFJ7hkMTwwUSwrDb/1T4WWaq/3kqO78Dk2oDzo+/zxZXP4DYMPdsH+RWeZrs+BBFg4y9OE7YSPRIiZiXSNJwFgu+OjCeoYLWmw/EW1cprBZnimoMU7eu6Rf6mIhNNQ2AVf6V/FV2F9MHuQoT4g10KyWZb5SdZUo5E20n1Wag0Aww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SE3PR06MB8500.apcprd06.prod.outlook.com (2603:1096:101:332::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:55:17 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 09:55:17 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Ettore Chimenti <ek5.chimenti@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org (open list:CEC FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 2/3] media: cec: seco: Remove redundant dev_err()
Date: Thu, 23 Jul 2026 17:54:58 +0800
Message-Id: <20260723095500.523448-3-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723095500.523448-1-panchuang@vivo.com>
References: <20260723095500.523448-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SE3PR06MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e2283c8-660a-4c6c-6335-08dee8a07fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|38350700014|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	vqToQQmB+OWuUaiaA9Sca353ni9uzWWvn3FvIhh/4GWXP19spL2O1+42mPggbBME7SfyOj00IydsVuNrjw4Fv2xIJqvOqAER0vMpAv4szYtiwNt+8A0rfRDiJ5i+pGjY2+v/hsBxYx//g6ER2+BKUMb50ekrl2pqpVr6jB4GoKSDbyVNAN86tPJjsQ4ijszvoXN271mijAhqNJ+YOmnB+XpfPzooR0+2k54M2BF3xleRdo7i2WGUDoIznoZaNa7p5AyyP4tycxMrAiKgUm02K7i6vkdq/9ImZ/1AM0MfHcbL+OpUv7C5yh3wiW9vzdXa2SdwlxH7MVeFFyx6M/mIGomeBZcwu2qde8/PMzYh6xDsO/e9WaWxDosJ2MHWXzYmmUrByg3aJ7R0hir0eXCK2gJNJeQ98TB0fS+Tn9XBVDUWDzJ36zwRDGYz3q+3AjCygwbAwTgACaSMXSx14DTZrbcsuad5/1+yEfPsaX3f9tzZEvcJDz4Mim7FnVD50czlPtBi0/xEcWsPydO3C5oS0PK/OBIO7FdKx53lRX9Ffpjac7DQxLeWwyYzwE+kRfqRx0iYY1mwc9f0FiCLzmcuuLBX1KM0GlqvWbWyFohPqOeWjfsneciQX22NRET228lXlk8Gid9E4URvJExYtY4P57ITE56imq6UatT/j/bbN8CfNez/3Qp53BL3J0L/42gdnh9NxzfDy8ju/eBABiI9n7VD+u9nnzIsc/EsTdXWD88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(38350700014)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N9EVVVdI4MsTc4eJ0kCH3AfkIAKau0Q01zHDmkKqamkN3pk5Z36p34LMcx/K?=
 =?us-ascii?Q?uNtrsT6qRHASfU+525uFb1ye/EAHKZe+eXLe8BcDzpxNKRKmzY8wKofAhVen?=
 =?us-ascii?Q?pvpgtYZ2BbXEWYXv1jAOZHRAV95Vy/WLO7k37i8V+eg547o9wj8x9G7xKnaZ?=
 =?us-ascii?Q?6idOFIUzSq++TayWNB4C+XOr6BlQgSBbMibDLIqBdvzmD7ny5RYDLm6nksqi?=
 =?us-ascii?Q?s2fzOdcfmWCHxMwri2vbPup6bEN6XBn1xKuJzQF3JEJwOKGO12bxQ+FUbgFT?=
 =?us-ascii?Q?tiEBdySLggXecomerBm9M9SfjKyE4RVRyVcQGtHB3so9N51qopArfeVLLsRd?=
 =?us-ascii?Q?anbl8aTS3sFiiJT/mLQ2coG/o+dDQ0q6VE6AbTDi7NsKQ8KOwP7SupOgGGDJ?=
 =?us-ascii?Q?WhL/cZklSqv1MR7wKQNWH9fcrVIuu2jcStrrkQKRCdyWjKLSF/q5Ha7N/cdf?=
 =?us-ascii?Q?qXKFsqyGaJXEKeXdCAOHDGRyBIUoUqsiN2XZjYPbPCMZn6Rl0NngEBQXulJF?=
 =?us-ascii?Q?zsaojon0pLpqy5KdnNWybMkWCnlJUqoRixFbmQq04h5ZCJwtPwU2u9XUdXRD?=
 =?us-ascii?Q?xOWnmkAzIP5csQNLRQXAnIFiUwfed8b36n0eSY9tPctUg4EFB3Vn/KqIC8KG?=
 =?us-ascii?Q?Pb1FAVcG8OAODFDxMBm/nE5d3Vp+g38E8RBJ90+FQXKbYuD0u05VPVXPQeSl?=
 =?us-ascii?Q?rM/3neYV5xTGBDNJlkSO+vScujV7AkIcW1yp885oc1IwRZJk8PdwIEcFB229?=
 =?us-ascii?Q?B0CPbIsDqviH9QeIri0UuWPf6/Op2lKrqIfxYrLK4dbatKCc1EazQBUp7SfP?=
 =?us-ascii?Q?P9pmgy3ocT/kXkcDwgP4Ulpn65P2fC837QbKg1tfBiazWxC6OKsax6xbNHP9?=
 =?us-ascii?Q?9U4mbfQ0i7WCkX0brculvwA7extXmf2Iaf6yRcsDcg/CMOAcsg3h9jxNVpMT?=
 =?us-ascii?Q?lpFWB1QVK9AJkchu2HEvUuokDBk8e1m0W0iBtWeO8Cw8t6LIkcgDGgzwmFEA?=
 =?us-ascii?Q?IKMmq7qaQHPv45updN4ISCMc5EsHwCIqHJVRBZPxDicNU+lw6db1DKiS6xcc?=
 =?us-ascii?Q?1a4QDd+glKx34s/YbU6ZnaEVRxRX40SttbauJIHK0hcoPelQnoKHdUuBjN4A?=
 =?us-ascii?Q?7ywfS2yZl7Fkj6rgzVrc2vrnkMmBvcEvukWB9bR74Tgc9bZ5lthGlB0hgPIz?=
 =?us-ascii?Q?tcAUhqdxUqfup99zN1/zwguebPO6nTLSYmITys4sIzdnpy8PtBONWAUlPTcC?=
 =?us-ascii?Q?RBUn5gxTSymuU0KFqEQt2IufEqWBucUCdZYh+ff9Wd9pH5Qb1jGz0Q/zYytA?=
 =?us-ascii?Q?0yqcjTKRMmfpF8hY3vnIwsvXzfQNaobK1XB9WrQFp1/swT4nGlODhQtVsmqZ?=
 =?us-ascii?Q?o5cDkruL4gep1PBVXDgK0ZXITRaZeDsdsDW+SVRPV/pDQG1Ay2gHJPDlbzdB?=
 =?us-ascii?Q?VNwkQ9Z4g1MTK7vB3tC8ulMUC7YQ0d4SrEzlODnVbEPpDqogtNJDe0Ap9AiT?=
 =?us-ascii?Q?5OhU7ZR2VPiuXFJ5rOlIZWZ0EpfklZC600N13BHNHM6MXuGZ4Id7QoQIImB5?=
 =?us-ascii?Q?BLHCLEkEiWMD7XLDZTnIIm0wBp0aJGc1EOKOHTKQcGaqCtTdXf8WMMRJ3R/Q?=
 =?us-ascii?Q?TIqO0WVKZJTr2XQTk3lb/sCikwxGNKD4rHZakl4ODqxg4mLARQFHrpNP04/D?=
 =?us-ascii?Q?Nhsylf38Wye1tRZU8yZbVJmyq0UstFRbX5+eeLskvP0m6NgpwjK1frpl7JqK?=
 =?us-ascii?Q?KLOhxERzBg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2283c8-660a-4c6c-6335-08dee8a07fb2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:55:17.0765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdk21XfKx+LxUfdunld7a3avfStVNXR2BsSt7IiAFPqL8za0G5J+hAZwY3ECi+K/BQI7baSyXqOyAdazV4kKKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8500

Since commit
55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()"),
devm_request_threaded_irq() automatically logs detailed error messages on
failure. Remove the now-redundant driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/media/cec/platform/seco/seco-cec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/cec/platform/seco/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
index 654c70503dd5..12db6dca602b 100644
--- a/drivers/media/cec/platform/seco/seco-cec.c
+++ b/drivers/media/cec/platform/seco/seco-cec.c
@@ -619,7 +619,6 @@ static int secocec_probe(struct platform_device *pdev)
 					dev_name(&pdev->dev), secocec);
 
 	if (ret) {
-		dev_err(dev, "Cannot request IRQ %d\n", secocec->irq);
 		ret = -EIO;
 		goto err;
 	}
-- 
2.34.1

