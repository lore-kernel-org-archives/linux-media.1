Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794999936;
	b=lZaY7IBjqVCyW6s96dWUfZa1Y+OH4VkJ9J1zgSv9wetjA6lgWXMSNxu/dTABVNE0gXTz
	 1ZXlj0dvqJQ4XqTUSWaHo5GYqTJ3+EcfPBS1+voHZawrjHKyzdH7csTHYzMrQrf81TnqW
	 BJtUBdkQ3RgsNz98IYKflCbciK+z66/JIlUGyr5QZuSO28ehOgB5QADojBxgMrjwxUqmp
	 chSE2N9nccdqF17DrNOTR4pbTzzlrfuQEvuuVcFLwFi1q+sCYeIjsgBM4oLfSUzXWEIj8
	 BL7l8oT5EGTkSsCyULrQpliTB3AjC9R8reQU/W4TlWMxzTUj9BIUI3s33N6fJn+3Q4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999936;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=57OqLOtd0Xhl80XzTnq7CaSkz6krDD79i9AODx5Rmtw=;
	b=ffeNtpC342coO0uXPviSYXKLdgHKya37XHqQYDSkI0NwqC6wU5Bc9MhugF4MGyTekb0D
	 vp+KFbB1WwMLoZ6Bdk6mBhqU56K5g4wccKuNmwzOJQITX9NSo5FjVDAqBmSAR1GKqRXT8
	 yvuDJ0ov5QuE3K70NbvqAroZHUPatt60pUzJwLXdp6D/ocuh+c7nhmRF2YuK0mbRIdwJe
	 hiJKpNgNB86zCBlK1ZL4f4+E5dyxbCX5iMTlBkmhh9DwlMiKsOTDG+FDnnpf4te3b3JSI
	 Aaurbgw6a0x177YzgSNcr9nI/RRxJuQgpev9G1aVeFcwhbVhelkqUNqwNxZN+Jc6uSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=v9rwVvUi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.54
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010054.outbound.protection.outlook.com [52.101.201.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76CA606A31C;
	Wed, 18 Nov 2026 11:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A76CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=v9rwVvUi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHazaAWt+XGQ5Qgy3TGkSAUfJIN0qd9PK0aKOBQjhrqIA2ka/3REmrlEKUmuwKp3BX/wSqBIAxGTiZxL/5e8dEYAXtFyTJV0Bp9fImMcyUahnAUeGM8GGtVKsXXmcKHRzBZgRIR9J2xJ7x+CnL7Y9SelBaCXtgA7by0vFemMDuXHI4bkYqtGKYGQ9jAMzdm8VFkW+rqNWkLVQGo5Ht+K+XtqGuxVGX4MlJ5pCMxzvYTUmknokRnPmSfSOdEMe+XADss+qZiZzWToOtia38j11qbhPkuLwHt4fc0bIPNXMCMGUJGs2Zx2ihHVIrwIZfiCbA1nkBHAK3E35v0fTRixHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57OqLOtd0Xhl80XzTnq7CaSkz6krDD79i9AODx5Rmtw=;
 b=LGucC5NEztySTmZCdVlOp5KbLDZrrANrYj11T+CmvQD+sMZFMQNZsWEeKBkWkazh3DGmWhYeJH4POOja+1XIi3wyFjg120EtiL1n6uptPm8OwiOYrXJi572fYTkMLKXZLAs4baoJPhuELjITQzz3TBaxW2Z1zZxAcWscHQ6W8o3A4FbwMWr0j0LoTLBgkvdxVwBUbd0prqyxWZi9hiIV4iNLDlfOS6Y3aSuaTSYn8TOwM5QU4LBfM2n72wc1OCvaHuhIH3JvcLN8CNRKjuudMSKVsEnQMTXKgR2bgbd/Uf/Hfqep76qGKavGKKxWeEOau6FRIgcd5X/ZVAuOZwH4xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57OqLOtd0Xhl80XzTnq7CaSkz6krDD79i9AODx5Rmtw=;
 b=v9rwVvUiPiyPgWgrGkS2NxoV+PXYbExkhrKTX6pqqjyzTluA53yLXIYVZPEDE17hEl5WRBimtM51Bc/Sy912zCE565z0FeF/vo9Vo8mPxJE4EXQDjgSvvFWZpYMf2WKVJDe+sYToiPOav/0MNi7LIgiCu/7oWbv3IwHfSo372B8=
Received: from MW4PR03CA0246.namprd03.prod.outlook.com (2603:10b6:303:b4::11)
 by SJ2PR12MB8927.namprd12.prod.outlook.com (2603:10b6:a03:547::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 11:03:28 +0000
Received: from CO1PEPF00012E66.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::13) by MW4PR03CA0246.outlook.office365.com
 (2603:10b6:303:b4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 11:03:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E66.mail.protection.outlook.com (10.167.249.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 11:03:28 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 05:03:22 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 05:03:18 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 05:03:17 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, "open list:XILINX VIDEO IP CORES"
	<linux-media@vger.kernel.org>
Subject: [PATCH v2] media: xilinx: vip: Make use of the devm_clk_get_enabled()
Date: Wed, 18 Nov 2026 12:03:04 +0100
Message-ID: <8c5500e70fcd2b4da35e985b9f8a976afa1991b0.1794999782.git.michal.simek@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=michal.simek@amd.com; h=from:subject:message-id; bh=Yn8LPnFAVU2UyyKw/e63cP3tiXYjAa3QXl5Y4oXTBzE=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9bX2XN8Vivpr2DY0z98w/chbJ7lB8EHb9/msFhsi0o yn79N0lO0pZGMQ4GGTFFFmmM+k4rPl2banY8sh8mDmsTCBDGLg4BWAii3oY/pmdtYqVE1VdkOq6 TXmHRwGD7BSWVbW3o45Fi/ZOznuw7CgjQ4Pt5TR3Ls3OqzO1H7UfDnOrK2q+79xwM5dvxQLxv23 z+QA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E66:EE_|SJ2PR12MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: 999fd497-e37e-4231-d40a-08df45639313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|18002099003|261009223027099003|11063799006|56012099006|261102123227099003|10067099003|261021123027099003|261021121427099003|261026121527099003|261102130727099003;
X-Microsoft-Antispam-Message-Info:
	cz+InQSsJhGtjtKsee4/teCSC26NwZK2n0yXu5yLMkw6hX5IQOPQLaK15sKFE9axXh114iz6PFngiaFLKib3tmxjYZG9XqfXqQHXxHaJ35Kl0AaiWZhMzKp6rynJLwh4AeaKmbt/Z+KwTM4mf00yqFPf3TI5FchsvrmDhr5oxHOz6BZAnt6v9Bx4C0iJdv+BfQcQ6MXBjuSSEpf3nvuMlM6hkr3oorkUt1o83ebM7buuthfywxh2t83RSxpIRp+UIModG7V6FMLAh+mmtx8BBPbzkATXrfTWP/UxMkKRjlVD98i3eXMp99TmoA0nj1Dvp7QV7dDziVSaFduBWOsb96iUgaAnkrTRwxuda4Ca0HcCIA2irDh1GCFyK4/PAF1NDZGNpISwwymWfBFDi2lBNL0qPHNziHWc7ujehRa3OW+s0p9ib/72q8/TX8bBRRa2T5YE0AgxWHfjlAiVEYXnYbBhFS6KsLOx09VEbSXyfwpomvDWSg45yErhgBO7X7ywBvsMxj1PWwnGglcA2cm8PZD+h3dHRr+mkIoS03BrB+oyjgvpdljwzZkpd6Fl1JhfLY59wkMXk3F5MPiY4RdcShH7MB1j9PNJZG426c0XcliIDQIva54EA0By3VMKDNeMaOjRvtTYLOS7G1iGa5VwVTRJ92sjL358xBOZZkbpwCqrBsOLCwawrGAR0gj9utFb2jGbFN7pFhfwAgJygVN/VQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(18002099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(10067099003)(261021123027099003)(261021121427099003)(261026121527099003)(261102130727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e8BS8KR5wrempUT5J4YhrakJQ86mULo30GlDR05gf9HI4DM4DnnqJR+WxISzMCdZ1KUaYIsEvKLqMw4p4yirckj/5WGAtRM5MJxOZ9HMWXrUtetCpTq52/5cz4v20sRUAQO4S7H5YP63Oqg3CdWEoz5H/EB/4f/or9+boCBF1If74lKUGuPfiGeY4if5/c1K1+WWUsXY3dydRAcPwSZySUv7jLF7gRZR8p1fqnvidPVE5AExgHVEGekL8HRJOqomD0s46J8UCIhBpvWDRdHKYwNtVm7YKUa177BW2bZ5LnPxmemviTsKad8pb/TXDptX6WVG+DgRpqdF1Z0h74lrmuQ+PfGQwCRnoWVEYGT8YmixdZw6YvfvZGPewNxbiBwIe7SgrUm3yXEJPy3M33aOlTciXmE3dE/ncn9g6znyWzeRNRUWWz3M/iR9FgRtcReb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:03:28.0837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 999fd497-e37e-4231-d40a-08df45639313
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E66.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8927

There is missing return value check from clk_prepare_enable(). Fix it by
using devm_clk_get_enabled() macro.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

Changes in v2:
- s/devm_clk_get_enable/devm_clk_get_enabled

 drivers/media/platform/xilinx/xilinx-vip.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vip.c b/drivers/media/platform/xilinx/xilinx-vip.c
index f1574edd2b43..537702ace760 100644
--- a/drivers/media/platform/xilinx/xilinx-vip.c
+++ b/drivers/media/platform/xilinx/xilinx-vip.c
@@ -212,18 +212,16 @@ int xvip_init_resources(struct xvip_device *xvip)
 	if (IS_ERR(xvip->iomem))
 		return PTR_ERR(xvip->iomem);
 
-	xvip->clk = devm_clk_get(xvip->dev, NULL);
+	xvip->clk = devm_clk_get_enabled(xvip->dev, NULL);
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

