Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013058.outbound.protection.outlook.com [40.107.162.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A60369D4D;
	Tue, 21 Jul 2026 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641131; cv=fail; b=HqA8iSun/twWv5lycElYIz7AMthmTE9xwGWDQOiIDLY1k3/Dc0gAQlZ5GQ/xFaQ647cgp4lJfEtLvZXga1xk2HF5kEICZoO1zsLQML0PiykFmNdKvnZfOG5zhrdin/VWznTD9hV5eE7WM8yi4GK4D5iuP3czVOs9y1maPU7rvls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641131; c=relaxed/simple;
	bh=5jV9hvzysz69+r57FGW8FIls/foZeoOet12tajmckW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=JJ7I97wagpI/OCVrvQH+159ua/pHjhGSukLIiKAdsqAsZnzXyQpbc6kQmV6kodyqBzfvgCuQcWVm6mDqlGBnRLLdfDQa+UmV6xb6OSAxAKKI5KregYU5t6oArSxUYq4aLu/HjkmeuvuHZUs27ZEnmT34Bwyu3EtaR5zfkpk6TkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KcMiSESN; arc=fail smtp.client-ip=40.107.162.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KcMiSESN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgowAjRrOPbSG7Lh1I4JQAJ5LMkKUm8I47ckEp+h2S2qCr7HcVQzp09MFSvjOsF08IdPiL6idFN8mY4n+uyUKhx+719KYiRWHPH0PN1rk2+y68Rai454fe2UtV679OA3Sp1SDjZxIbexszZwRkeRNhA9F2vPwts9eWhHj6Yt4bljlzoFchF3FYN2E5YPm2F262EMnwhDdWt1ICm3H6YCa8oS6pi/x645HqHAFleyH89EOgZa4gznDpy/Hh1l+gOCHyL0I2i+KGOJ1WGmi50GsckE0svlxe3YKuANphOYr0nSBfBgPA0Yg7IjvxgMHDxsVJgqxZGt+bthZWUCqXWQJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hikvRBJwaY4RQh8mCfWMZ/r5ty0ogVOw85+yOgeLtxk=;
 b=exnotidEKz4n+9o13mJdu2Ms4TjFnzH3I/qScbQbsWLcbbIIc1GuAr1svxdt7Tksl8yeMdYSVEhDge9UgLNOwMHlQhGgS0aQVQJXTvjMYw80aI8Km70quwWku8yeZ6ohQMPhYC1EupPukijT9vU+xdj9qSsuAt7cVHbb61ryNsSTTFyk4Jt5NeM75l4PZ9GHQ+s0MhDZ18WsOP2e7t/pziqtanufRaD5457f2a/U5LePo60AFjyTu7GdAo0PafMEEAFOe1wNVRP6HT5iqUt3VxNrb1W+xeQw3A1uBhgAkdoufpO3kuxHBV+04Ln4I3fLHKHzF928Lc6iZ9QyhIVBiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hikvRBJwaY4RQh8mCfWMZ/r5ty0ogVOw85+yOgeLtxk=;
 b=KcMiSESNw3PQtpvvhoCPYEf5MHcdP33Oc1kMRIkCOIpKiHZStImTSdPDBPopIi6cgVKl/vsMdHnQP1f+W5W8056UDcu4foOLOAJ1GsDIDCD1GxexIZbPVbC5NVmppsNfia3Y9j4haQqS30MdazuHl+PfyksN25w5oXC+3fV/Fy7wufYK/cUbps5aqslAzV3aDtNVSrZTSOJXgZmR+So0cEslVWSoaHTs8/LM3ySKSiltUkkGpdbYkCPQrlU3juOWwioUyNtzMMPWjWATeCjs7v5ZPxuEL5lZ6imItN2rAFHwHMIZYGP2QZph+A5wmgmKWWONhuaOjjmY9sjDcf5udA==
Received: from DU7PR01CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::18) by DU4PR10MB8482.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:56d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 13:38:45 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::95) by DU7PR01CA0045.outlook.office365.com
 (2603:10a6:10:50e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 13:38:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 13:38:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 21 Jul
 2026 15:43:20 +0200
Received: from localhost (10.252.29.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 21 Jul
 2026 15:38:43 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 21 Jul 2026 15:38:37 +0200
Subject: [PATCH] media: stm32: dcmi: fix error handling on MDMA pool alloc
 failure
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260721-dcmi-mdma-alloc-failure-v1-1-64a620f948d0@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAFx2X2oC/yXMywqDMBCF4VeRWXdAA17qq0gX42RspyQqSS2C+
 O5GXX4czr9BlKASoc02CPLXqNOYUDwy4A+Nb0G1yWByU+W1KdCyV/TWE5JzE+NA6pYgeK5Pbnq
 yZQPpPQcZdL3K3et2XPqv8O/Mwb4fkDupMXsAAAA=
X-Change-ID: 20260721-dcmi-mdma-alloc-failure-60729c8bad58
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	<linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8A:EE_|DU4PR10MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 82826f60-72c7-42c0-cd77-08dee72d6279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	3Zsoar5sK9Js6REkaQqTtymzoAngbRwxshXszf8fOomI7QSy9rz74O0csz+xC4JoKtWddO71+w65kYV0ReLE6x6f23uBlCrJ/33nkO2rHrjIGSkLLXQ4Rr1HSporl9NpLDx7UVOxcwNSRaSKi6955fZXY6+zAirMmzYKr6kNt5+3Fjwy1CowKbrou6L8KEBDQ0vNkcs9wspw+9XVZz40DZelchTrogzgW0dg+RDgx6T1WgoM6amiWtGjLY9UhvuY2RouBQmY7Rz5i8EsDeQBUKl1WLLAoeYsC8u9ZNeCVZ9JGougKOhI8qk2DkpG9LkJey+NdKnGErnsjZFM9it/6uw4zVIyI3x4091NVSkJjj7tcTYDZVWZ31GiEft0WydHRbLp8R8OUEyJSVoOeK4YoVAODDQ5TjpZCsHjI+AMeT6ipSxQiPOCuiPJ8iVfr5GCW48Z/785Sgcae0p9z+PUj/atIrdWauY8MADR8lCEbrCmMj1a0S1BL1Z3/acztqFMg0C157Ze6VmVD8gXtzC2pPvVCdrqZUv6VTxaZFOjEpqp1xMTVp6V3XctIh9sqUor0nqw1hW22F/YrblFrYTB5V49U2HyHpxtErckKK2055TeVrpj62LWVi04XbPPqrSjWHd2hq6t0OqTGrtEcRUMD4jka3LDLdmtGjKuuUzfyxMlBdYh257QOszExjT/7BSpaaOLtly9+MRX9W1C/3iW4A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6nA02Lr3ONCTlGeuswOSKe4zGH4YMkuCNmOGf4Yf4NomDFkExcnOHntrMYVXInfl/KLkoKu1TRiUQcNii0fI10s+eX/2GohV6Tw/Y0GHx/m6EA2qcGQxjHwEq9g3mHJRGSkg5L7HvhYvMuw6yUZjQGGcRLoRt87D5vVQ2ELsf84X1G+gIg9tuUk2NWApZC8k99PeLiH+V19YpNqnNJBF50QgcSiTmh085epBs/8G0pXDGoFH1ahzOcmeY4NmRSdzXSHAEVJkU1EHucd5Z+F3KvZPct/0AxRQAGqTIJjB1qgQV4XM3nDT6/IN+GJXLyojKs5Sy8I/ak8YtRpI3y4H1REkLPGj5RBA0yqHQM+/YvugVF5VYvFd8J6piRMk7BJuKq8IVc8qYeV6o8b8L+zTrMcj1eg67SH5HGGzIC3pw7OBwQ/sTTryEkYBM6hFAyt1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 13:38:44.3716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82826f60-72c7-42c0-cd77-08dee72d6279
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8482

Properly return an error if of_gen_pool_get or gen_pool_dma_zalloc
fails during the chained DMA probing.

Fixes: 87ebce19aa03 ("media: stm32: dcmi: addition of DMA-MDMA chaining support")
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index b1f9af8edf6e..ad716cf0633e 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -2050,6 +2050,7 @@ static int dcmi_probe(struct platform_device *pdev)
 		dcmi->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
 		if (!dcmi->sram_pool) {
 			dev_info(&pdev->dev, "No SRAM pool, can't use MDMA chaining\n");
+			ret = -ENOMEM;
 			goto err_dma_slave_config;
 		}
 
@@ -2061,6 +2062,7 @@ static int dcmi_probe(struct platform_device *pdev)
 						     &dcmi->sram_dma_buf);
 		if (!dcmi->sram_buf) {
 			dev_err(dcmi->dev, "Failed to allocate from SRAM\n");
+			ret = -ENOMEM;
 			goto err_dma_slave_config;
 		}
 

---
base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
change-id: 20260721-dcmi-mdma-alloc-failure-60729c8bad58

Best regards,
--  
Alain Volmat <alain.volmat@foss.st.com>

