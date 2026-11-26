Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795683341;
	b=Dwm7m7Oq2VdFsf14d2k5o+ZkPnvRG1xOtKhRv3NecCViOypST6A8Ki42v802T2n1fynO
	 pkp5fna6o5eGwUROJ9vaYJ5KBVf202xJ51GpHuNNXRbLrGnqnAjUKHLGhvDKCJnP9k07T
	 ebhhjKHXXluuj/o8RD75qnrH5syj4auS+FcmKJVgOHNq+6yimYWLtVGXfGK7DU34V2UpY
	 TZa2SjKiCzuRl+yYWknh4E0xN7SEJFAvG3URH41tqeXCoFRPk+5/yHaK0Bg3YXJ8iNavG
	 pcX0g1FmaXUf2WVZxD+xRyq95zWtCrGmlfUaSG5qahPBKwpZGA/KCoPU6YFidvDWA0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683341;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:X-B4-Tracking:X-Change-ID:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=s02NMwu1/OPgrs2cX4aaMQkMUQ0/yRHPlZCpcNaPiBc=;
	b=qF4+EmCLTnBfBoKVGwxxToT1DZrKbVsd/wTa1xns0JHC+IH1ZdusdYRS1OV9XK3icktw
	 j4BH67kuK2V19AfxL/rilqa6vzzwViY2aRZx8SrPjuCXLOBRpTEplaNGMNBdizfTKh/gt
	 cVb5/bdXxpZqx4ZScdcm3sMJEnCfwlz4wfCYkxQuGGSNShU/ikQ/3IDeFEPupbvqnMrUC
	 L6zByknnRGmTSKUwUL83OdQ/0Qr3llUSkHWgooQjwqi8JP30UAE95dx2VG6DFos1ZTmJI
	 5a0Gpuuo5m90EVPVgm7WTFlMmIv5hir+sSAwe+jtv850JlFYjtLzHPnvwfFin1cLbVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=SdpYogQM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.16
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011016.outbound.protection.outlook.com [40.107.130.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B24D606A683;
	Thu, 26 Nov 2026 08:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B24D606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=SdpYogQM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lwg9u6lPI+y1IVhxuYNqAgTl24FuLR8u7V/f1yz3WpKMMX/PwFOJ/ifkbjsu6pVPhjoz0bOW3UqG2n9bTKegmnhpA3XolThkNT7JwtAQ8IOoI8EfZ6WsHvVmnZ3RyPvD3dkKOdxj/T/lFFmRJcjExuybtEM7JF1APT2QuUrL7fWZUi++dQol9yEwH6bNU44kM431ljSHeufqGzyXYyqIUVRCYfTXFPP7m5OA869ykp3Ce3KpHrcyZD/MUHD0QcWiaJVX8QoeTCPujAE+vaQY+QICNCLRpFwhYZUcYW47uHFiUK6rSiVyuUHNdCpJwtruL1OwMmV4c25ZomfqIGN9YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s02NMwu1/OPgrs2cX4aaMQkMUQ0/yRHPlZCpcNaPiBc=;
 b=V7Kg+TnvKCV3Hb5AFG47vpIbiwAPTzaaX1OD19fojnixyHY2qIX3bqHoJYpWeU9M/2EQCSKEWRC3Pccwt1yqoxZFgQkalk4il6RisFm0bBiP4InkZSYAaVSgjxkwgVUqtCaavZAYLqeVZRjuf0IhDb5+a60EFQOvXKNttjI2o/kqw29TOCtzFCu9dYIz10Nrb5sZ1m6abZJyzzrEi4r1itppuNklZSd6YxQh7tc6nmVHqoNjTkWoJPNGSueA/OmaGBXWdA0sQlNvDMyFScHd6Pfm3Joed4K6ktjZk2V5qhsMfgm6mT4F8T+1X6y/G28q8kXmPs4RKemf98e90uJqKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s02NMwu1/OPgrs2cX4aaMQkMUQ0/yRHPlZCpcNaPiBc=;
 b=SdpYogQM5jUzbPVUXtL+dWZKMZAY2TqwOPO7JJj9vho6KWfgMjBKm26cv8UNZ2e6WHh5hsZSCSmBFfmXQLht6QHYv95GxuH4QFjoErgnrivVzqtx9DzKLOSsSrU4HpKrN3kkoXv4ZrT6WqIlhfAvUIXWKzgzDB+4Cjfw78fR6V2zyIb7IJLPTIhJ+nApX3nUNQudKjb4SGodHyz9o+LK7TrDO6DktnhoZ+1/Hr66zP+C/4MUyUDE9+4jlfN9Vv+qPXzmCXS8NYQ31HYwFsg7tP48e3q/0HJcZymBPuVCbJsmstzNzlC9gIXOGZx91nvOJbEtnDVtRkAD9/gjcLpIcw==
Received: from DUZPR01CA0276.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::25) by DB3PR10MB6860.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:43d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Thu, 26 Nov
 2026 08:55:34 +0000
Received: from MAD0EPF000008B0.eurprd04.prod.outlook.com
 (2603:10a6:10:4b9:cafe::13) by DUZPR01CA0276.outlook.office365.com
 (2603:10a6:10:4b9::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 08:55:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008B0.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 08:55:33 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 26 Nov
 2026 09:56:38 +0100
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 26 Nov
 2026 09:55:32 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 26 Nov 2026 09:55:16 +0100
Subject: [PATCH] arm64: defconfig: enable STM32 camera drivers
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261126-stm32-enable-arm64-csi-dcmi-dcmipp-v1-1-da9aba5785e8@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAPPzB2sC/yWNQQqDMBAAvyJ77oLZagJ+pfQQk7VdMGnIllIQ/
 27Qy8BcZjZQrsIKU7dB5Z+ofHITc+sgvH1+MUpsDtSTNYYs6jfdCTn7eWX0NdkBgwrGkC6Ugi6
 6cV7c2BMZaKFSeZH/OXk89/0AJ37mFnQAAAA=
X-Change-ID: 20261126-stm32-enable-arm64-csi-dcmi-dcmipp-7d75bf750221
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B0:EE_|DB3PR10MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: cffdf435-82a7-4fc0-3130-08df4b9b0802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|30052699003|36860700016|82310400026|376014|1800799024|56012099006|261102123227099003|11063799006|261028144727099003|261026140227099003|261022105027099003|10067099003|261022075727099003|261021121427099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	lk2ejPEZd5Pp0cpsUlWOKRtpLpLj2ap3gvIYru/CmLpmJw2McydkXeP3zywFS7eEJlSDLARet6OBi+OlC5cC1yNOH8CUIP+uxUfcngGf3wZ+E9k4/KSgEAYpmu7/7usUF2RlTWJgqQqpTt8gJ3xgTRMDzqyn5js39XdDqPX+8Z8tjM8BWFW5cTMTvk0LYSgKK6HXktjP8A6Gwv1dDIxLQ6rSwdfQJX05QHv4uXVGSLUBsafQQbJTTT0dDlGj9wEFXUx/OOcbPUvI27ZocMYQN0zP0BR9EoeZ9UQwCs+qbm2yVezls7ENODYpqRLkD1v512/OtFkdG7r10Dqd6kEbjxKz3t1CARA8a+JWF+QQ9Cjiabwzh4g+gMxBFr2WlQKpSxphySy47JeC01a0FHxCU9Q+hki5N8sG6+rDT2eKjjybjKAyyoY2U7cCV4BPRW5+NaCPRZFXdNBtQQnK35JLwMwgZP1vvihjWLmQT+Wwyp9+vtC0lJaeIuiaBqWtncgpeulH1e2SoXTmUZYOWn8XXBm5ikI8eZHJS7wX82zhEkuA+pi7oU6R85TWrN0ZwxEaj4G7njMkdTZmbgM/AezUPYXN0esgijU0WZ/1ZZZbubA+O+r+d16dQnGZpLfaHyNKy0GmsCBuV3KWXoj2TxGONrm6hRZNkitCEje44cmVLDgnFeLqkJk1Ogdjat7ReJc4+Pju2VsSdC9zHQeKLgkUSw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(30052699003)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(261102123227099003)(11063799006)(261028144727099003)(261026140227099003)(261022105027099003)(10067099003)(261022075727099003)(261021121427099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QgIwuCcxteX0hlnnyl4kJPCsL/2yrxSsBzhjXuvt0VZIIvnmeg0Nwr5eGGd5xSls/X4yyFG0BH/wioA2ES/39/FPGLZEY1E+LEEvwlDO8wWndsXt55kslQBaUKJaJzXTofmKPT+f5kSHj9NzeZT/Kfqm8YxclklO9GqH5x5mdfHlZjQC+JLd29nHS7k51SYQEauPywK8K/Fz5ksX1L3AtQnM4+n2n4uupOg5lqtOWwNpHwbdZA1235eAJRLnBsR786dJKFrZE3HndZhRNfzkT1lf5bmQmLbPHpRQZWLUp11VBIUrrCVS5P/H/hYjTeQr5S/P0nv0Zb2Hi9ffozYBGdcU6+olURVxB4SwNVWqS1B/5Q3ZkpLpYKo45t7sdiZ496U2X28lhCS4RaECU79o2JTfWACJVIGSiZqitAwBGJTPyG0DcxKqMLN0Xw2VCYy3
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 08:55:33.5225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cffdf435-82a7-4fc0-3130-08df4b9b0802
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6860

Enable all STM32 camera drivers (CSI, DCMI and DCMIPP) as modules.
Those are being used on stm32mp2x platforms.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c..cecb6fec95f39 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -958,6 +958,9 @@ CONFIG_VIDEO_ROCKCHIP_CIF=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
+CONFIG_VIDEO_STM32_CSI=m
+CONFIG_VIDEO_STM32_DCMI=m
+CONFIG_VIDEO_STM32_DCMIPP=m
 CONFIG_VIDEO_SUN6I_CSI=m
 CONFIG_VIDEO_SYNOPSYS_HDMIRX=m
 CONFIG_VIDEO_SYNOPSYS_HDMIRX_LOAD_DEFAULT_EDID=y

---
base-commit: 25faec9ce61c01fb45abf812a222c5b43c3cd5c5
change-id: 20261126-stm32-enable-arm64-csi-dcmi-dcmipp-7d75bf750221

Best regards,
--  
Alain Volmat <alain.volmat@foss.st.com>

