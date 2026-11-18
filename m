Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794994353;
	b=SD4KY1xvPdPpcEJqvmqowld9DilgDYPcuiJsJmSH/Q4rlGU6kZokP9aiEyuXYoykstOX
	 zAtCUPIWbjEt4ruYRZgiX0FcskapEZkrKd84qSdwiJaX4cQUXD5XH1qanoa/DWfIV5qx3
	 O4X3EENcq843KV934pOVZA0BRjQJyk/cooaBuf/cAFkkJbbf1nkbd0tEvKAREVoM2cW0o
	 eOfJ42v8+LO41n9ynA12D1PvGIWcqTmpQ1tfgA4Nxd5DO1Ir9GEo4DQUoupuXgBmf7tKQ
	 EMESAw3k+5jz+hn1wk/HvDthRLQFVO2Ellltu/YQ0cMdtuqpKngm70NAB1MM7ojF4Og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994353;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=I/6mm1o7qjQIUn6gsPTWrGOhPJjBiJCqIIybSRFefDc=;
	b=bGJuKGzF2+jkYOF14N2RcfDO8e9ZDGiRi1XV7biH4r+8D6qbDedr2T3wb80wxt2YNaK7
	 vwKkVVYSSlmTLu4/3sxN4mD4fpFWR5MaiOwkC8DVyNA/aLCMI7bdjrGyhxCSSpInW0x1t
	 CrNbN+yldaMs53ze0+vtRVgQaVIV/jAng5FrGKpsjDDRqbReYjlWkd6OXAR5fvddx8TpS
	 DFrXIZiXa5R/3nnV29qGqE3Q9xZWCLrxhz/1BtZGJUKdxMne6xvDYDxZ5PzMhbPv+G1+m
	 ulqdun3vUDXoGUYN9YSaqx9m/fQKNC/8Li7LRR41QEOe/u2btiddKKQjd82OiGXpRJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5nZGPYqY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.44
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011044.outbound.protection.outlook.com [40.93.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF667606A31C;
	Wed, 18 Nov 2026 09:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF667606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5nZGPYqY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UStRO4LvnBDTaB+DPgytsM47cSw5Cn0jZ9VedIEcDlqME6ZB7hBvHLalmWEu6QD3QFJWNVP/OnyE3lucx6hxzNj9njvH+u9HugdUMBi3r2tVnmScGHjUTZLLiDEJJ4V1+XeUlp+YxCJ4GJ3VJYUw5mTvTktYSV8N5DTuu2HjoxluHnnsirvOYMGiPBU51LpvOrB36aL+MKf6/7gyh+m/i+9KIwRYNdlj8EyOpuur8vmvJwxNu2ZtOu5CCbjY1aCFgaSbdywCDI0lepQvymlnp/sHOtW7YrroDWUjsWqgHTkUpeUMBcs54S+C31/2pLsGE4d55UkEIAt8Du8RpGNAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/6mm1o7qjQIUn6gsPTWrGOhPJjBiJCqIIybSRFefDc=;
 b=FDsLnj1bQOAJzD+DkLgG/WUcaAa/qcf4h0zMoelaBKtOf9jsQ6Wc2JAl12Xth7hB7qIMuCFNbF+T8/iPROL/Sx0JBX+l35GdGTRTRUTjBg/HVigBevtoyOJfA4zROEE0F/rl59CcA5ux5rr0T5+RJgFGPyJb/xmiY1L0Y0cOYQcZXC2l9WrdQfkz7V9ZloIPedZNdBCqkyLuDx1yRgF0IGpBziRBcTos4quQna1+C6ySxuX5uhLC6m2zktieCKvGe+q9C6ysmUXtCzOvBMWMNi8SGgjzhs+c5TEIM4YmTw519a3hFQhuCJj1rorvKLv8k9FV02RQQItWljk7VS1wkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/6mm1o7qjQIUn6gsPTWrGOhPJjBiJCqIIybSRFefDc=;
 b=5nZGPYqYoarjoH8zu8sHg0174D3Hu3MO9H1Nk1Ffo65CAtTEIRRuPmfPxpD09/MNkFB99jBjReuFdIXYXjYYTI8nFLVkjMopV2yiB/5njTm1R/kMUx7CXAds/2s3rjCZY9rxTDet9ez93PxqwuSll4baXpo6JGDkepZUw6BYgNk=
Received: from BN9PR03CA0471.namprd03.prod.outlook.com (2603:10b6:408:139::26)
 by PH7PR12MB6468.namprd12.prod.outlook.com (2603:10b6:510:1f4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 09:32:21 +0000
Received: from BN7PEPF000000A8.namprd05.prod.outlook.com
 (2603:10b6:408:139:cafe::4b) by BN9PR03CA0471.outlook.office365.com
 (2603:10b6:408:139::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 09:32:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF000000A8.mail.protection.outlook.com (10.167.245.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 09:32:20 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 03:32:00 -0600
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 03:31:58 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, "open list:XILINX VIDEO IP CORES"
	<linux-media@vger.kernel.org>
Subject: [PATCH] media: xilinx: vip: Make use of the devm_clk_get_enabled()
Date: Wed, 18 Nov 2026 10:31:32 +0100
Message-ID: <abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079; i=michal.simek@amd.com; h=from:subject:message-id; bh=qnkFrtFK2uCKIF4TN99wCvhwAHaOrhfl+HFx0m3diYY=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9LagP/Kswf+tUjsf/JNU7rmycLWdy9o3X+vnSb22TK tTq7u6o6yhlYRDjYJAVU2SZzqTjsObbtaViyyPzYeawMoEMYeDiFICJ5K9jZDiZscU92J/p9izj A9PddrPqfSx4YZi81GnvjIUHjDY7XrzC8L8mTWFFE9sfLb/9vw657xFTFS5+2u70MXxOx6TSBzP FL/ADAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A8:EE_|PH7PR12MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f1fa80a-7bb2-4c0b-c97c-08df4556d7f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|18002099003|11063799006|56012099006|261021121427099003|10067099003|261021123027099003|261102130727099003|261009223027099003|261102123227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	oBzjrXQI+Bvx8rxYxGm+kSYs01B8NE1/aiJ5tHGCNMA3j2zk0JdDSyX2HDK1F8yWC17HLuJA6EYY1+92NYFWHsvmMHy15fnSc7pSJ+SnBiEzyBqARVeEtVkVP6RTCcGOdf20FcK3G0ozygZ17U5SSSTK87LKn13ChmSN60PPgFhF4lkoacat1xj9h7j2Kn219IFkm1bEr0reLMuE5PCL6FoYoUaKl4RDcTr3eTStWBoDIylouSe1rZA1hjP5X7MatBS6UP2kpltUWGGIQ8sgnCthU8sE1EmbFgpawTCyIUgx8OCQNfM43E/ZsgYj0mKxv38R0NR+BJQAm45WBiFC02bL2lHMHoXbqYXn0SLzQarHOuSXpVTGb9Ey1afmpmgcbvJMzA/3sR/uG5Py41Nm2tAkYClyqlhaTB8mwSEY8wnpKUy8nhGJuONk1dlZyJ18JnvgG/3A9DaiJg95cy8/hC1bttLF2DQOitCAhQKumi65ZKciSi09WIsxQIOnSQ3cuahTo2Q3W4ke3VOL/pQkLsW43L0FSvze902pKLOTej4Kg//Su27wZJN6wxqWa1/48dvM6QBVVt9c0yrHIf5jSm+kveq2U9y2l7WfnCXluQh0oocnEUbku4kQ9JHTTX/SEEXIw21YVJef9rnQHsuGwbZjRf9WlqvmzgwhFa/ItYF87X0yadWv240MJziG4at7zi2Lvt4hDOXth8KeO+7gcw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(11063799006)(56012099006)(261021121427099003)(10067099003)(261021123027099003)(261102130727099003)(261009223027099003)(261102123227099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BhFIKlz8limnEBRRPwv2r5MwYevuyhk5+dlSx09wdSVY7sEVIH6ThNFm0vpM08UvfifPN3su+5IkBF3jU1ela+hsd4EUxEBFKrW7RsjZutWkS1kL5dMCQztqzyGEA4zsbjhsxwzkCI3MZ1XOtwZD0/yKFVXqvJKD8QP6HIaXqcZXyZuhAZgDcBWruFVctpz5yoPJ5dD6LegMT2DKBZE5CjNQS0mcYDzSfcwd30QvQ7bp8ISVsDrM2YRbG1ghR38hTCyH6VuEFVZZuZN9vMd2JbcG3c5x9UpDK5KhG4X0O5Zv/zYRhDMOVKhjycu1f9mWdd2r04wU3L4QPif6aDT3uqSVBR6ie9hJscpcrwnwateQBVXyJnqwcvcpj923RdmYhIp7dvstuWMz0GciwLc3dOf6+OiUGAbT6Mlq9gsnvqzbwKW0FRhAYaU789KXQt9a
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 09:32:20.2452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1fa80a-7bb2-4c0b-c97c-08df4556d7f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6468

There is missing return value check from clk_prepare_enable(). Fix it by
using devm_clk_get_enabled() macro.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 drivers/media/platform/xilinx/xilinx-vip.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vip.c b/drivers/media/platform/xilinx/xilinx-vip.c
index f1574edd2b43..b8a06328b8bb 100644
--- a/drivers/media/platform/xilinx/xilinx-vip.c
+++ b/drivers/media/platform/xilinx/xilinx-vip.c
@@ -212,18 +212,16 @@ int xvip_init_resources(struct xvip_device *xvip)
 	if (IS_ERR(xvip->iomem))
 		return PTR_ERR(xvip->iomem);
 
-	xvip->clk = devm_clk_get(xvip->dev, NULL);
+	xvip->clk = devm_clk_get_enable(xvip->dev, NULL);
 	if (IS_ERR(xvip->clk))
 		return PTR_ERR(xvip->clk);
 
-	clk_prepare_enable(xvip->clk);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xvip_init_resources);
 
 void xvip_cleanup_resources(struct xvip_device *xvip)
 {
-	clk_disable_unprepare(xvip->clk);
 }
 EXPORT_SYMBOL_GPL(xvip_cleanup_resources);
 
---
-- 
2.43.0

