Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795769298;
	b=vZZX2pDT1gu1k/aPzNW5YUewOfWie7beFHzKcUJWo+37aY0VF0WlyhhO+y/iX+gSsXCv
	 a2IHQA2jfMXG6Gpf3H9Nux4cg6bGthnRwfjk1bstnFhs7IOKxetvtDj3rQtc6XK6BpAPF
	 +3Q7t4wOLWGMHcmXT8InDM6R1n8KdiyyzCwy4qQFjW7BDAQQvlV1Dj75K4WT6qWJbAKm8
	 91gUy48Iwn2OeXfSrq+X6JpGrdh6H9dJbF5TyE0namNN/UWmV7CqX/k2YgepAye8kJ02Q
	 t8/y5FqT1KAPUnHSR8fpBEXvtSoVDx3p5NI5lfxsNjukvOVBlqo1rrWfhQpUOogTI0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769298;
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
	bh=TQs8+9J4HGo9/oLFvKBMW8wBCMW5NHbZjhVR8RosCIM=;
	b=RTzVG+GDiDgRS+D8IvhKLJqhsebCxIzeaowsNt/PT9M2YyxvrDYz4rg8+R7JOLIh61EE
	 LyTSyKJMRJ/QPEz9NyYq53toHxapZRinZc4/s2nj2hTMq1m6gC8nFoHS/g+BLr7BYx7De
	 dNLn1wkbOr83ak0outyURxH4hfzM6eChclLYyAj2JqyI1qucxt9Vf9Z2nnP4D5xr6M0uP
	 K5qmfFrK3R46GrvhtvO0L//OAye1/BYyVUZrOiK+NSTXPn1B4G9DPF6v7lnIeITYDEGHS
	 E5ih581LWXiFtCX5oNv+DXnGQejkBNRXm+XYck1+VZ3xIaM9+8995WLjnMPkZoNnYOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=AQ8LLo6n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.70
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013070.outbound.protection.outlook.com [52.101.83.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D20B606A324;
	Fri, 27 Nov 2026 08:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D20B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=AQ8LLo6n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGd6ULNCZieW51Tmm87vGDsLWS97lDDDYWfyoxdiZiYTyp4TeYla6z/ZM2oPBN2bVjFmPcjxUupU34sM9qDP6uEwPpICR20AZK1va6FQCjbZsuwuw9IHFLPd0Y6i9uTFH90y6TTeHy4hMVRwGViILrIFD7h2qGxw+MPvyYM3TWhZ2bjj3xPhuCdb7S7GPNFsxQAs6cERRbcQus538GmBZEeY1ejwmZQN57YXHvF8JVJ6sBfzgdBuc+3/RD6dbF5XpWq7fx4D/WJjkuc58uPsTQWx83kCo7HJSjI9NCRe/elGWx1u4Td0rVTgm8GP1UcaM5maCEF1/nHPJMeknj/KdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQs8+9J4HGo9/oLFvKBMW8wBCMW5NHbZjhVR8RosCIM=;
 b=opkB/R4MwSgA6Y21boaSgbvrnNaGciQuwkT2Img+tgxd/P6lFWbwpo9Jc4ceNWKPR8jpfHE9Opi+jQVA+Xp5pou0Kdi79Hlm2Yn5s3VCcaEe3LDEKNVz7/yUvtQOY1wRtxfqyImvmXflIBI7yoh5qlftkF7jNmLAxXbBqxw81dyxS0uk8MZtEE2BSImI+myyBuk2N0UjyVY8DiiQdEtN3NWksUIzRunzlnIciYqSXNmECxZpxSzRsdXPjoifgK1PnnAEzkolKFYjVZo9O8EX4h29L7MeqNoXDRBUEQSDwA0AwfgRoA5kQsGubfTdTBaZCXRwIKvxq0b6Gujc7PerPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQs8+9J4HGo9/oLFvKBMW8wBCMW5NHbZjhVR8RosCIM=;
 b=AQ8LLo6nTGD/rQLW/goajbQ5mGI/l+cqrugVTJjz9wu68eQnyd65JsRs23JaaDdS5QG4VrnY6dpWcmnWnOPV8A+zDpUZU+GeVnhaI9av6v5HT8rIkIRBQsJisI++YqIKMuGprBqa4L0fEVYPPFvZ/wB05aCA3XrymLgDUZnzxt7c97XK6xOc7Tlhq1XCCF8zG5CvbRTz9WXWi9jdZxns0AnuqMpNITxb7tvX1wakqXYCsCqiyjTWlr5GFV5EeBGsuYUUjpR8AGf1h0gomNdgSiHgd+5lMrD5GopS2suR6cN5H7W3efJIOGVD0kM+aA4xr93+zVM/kANpSLJ7qheMGw==
Received: from AM6PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:20b:56::15)
 by AM5PR10MB592851.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:7d1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Fri, 27 Nov
 2026 08:47:59 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:20b:56:cafe::57) by AM6PR05CA0024.outlook.office365.com
 (2603:10a6:20b:56::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 08:47:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 08:47:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 27 Nov
 2026 09:48:28 +0100
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 27 Nov
 2026 09:47:31 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 27 Nov 2026 09:47:11 +0100
Subject: [PATCH v2] arm64: defconfig: enable STM32 camera drivers
 (CSI/DCMIPP)
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
Message-ID: <20261127-stm32-enable-arm64-csi-dcmi-dcmipp-v2-1-07e837968466@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAI5DCWsC/5WNQQ6CMBBFr0Jm7RBaLUVW3sOwKO0gTSwlHUI0h
 Ltb8QRufvL+4r0NmJInhrbYINHq2ccpgzwVYEczPQi9ywyykrUQskZewlkiTaZ/EpoU6gta9uh
 s+M08o3Za9YNWlZQCsmhONPjXEbl3mUfPS0zvo7mK7/uXfhUo0Jmr6Y3SjaLmNkTmkpfSxgDdv
 u8fDTE8o9YAAAA=
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F4:EE_|AM5PR10MB592851:EE_
X-MS-Office365-Filtering-Correlation-Id: 764a3a0a-94ff-4084-fb41-08df4c632371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|30052699003|18002099003|56012099006|11063799006|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261021121427099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	udc7dv1m18Bvy35LVd85qGiTT7Kt96UDXSnEmTytHW9NBHFgcN7OppNHayFeXGWfXR6YsS1pG+k54O976pUvF67+fnpNEWCJl8xXc1yKT0y0EuQRrZmo5UHM0Gv4Kl5DnKWljE0eVrPmOvipCEbuB1pNKN2R7CdKZwjR9cdJwHq6oMpm6ctompom8pDAVJxyMumC5Q6iKfURbhGkrk4l3etHc0vBleNlKZ37pv/qZ6zKT9MvVUG/tu6aj59htUDdkjFQeTEuUAMcTrkOhGuCxpJBIsnz+S0k4lwMS4lhQIaD/yYxsAl+xuUP/Ub0P3mcZtMnC+wA2rP23hdFSohTAnXgcAUSumAZ2txdICzYjk59brx3MQwa1Q0UAbLHu2N674MDkFhCtwlEjjFYt6U8LAFfNt8aikc8+onFW96rwpO6KJ4J3hV4nkJYNxf94N4F2OxSZ6SZCxuYeWO6/DkHVmaTXgGWliNKgcniJfFJa+yG4A/kZYdea/47psguPxFK5iIMQdT+C1hhHFhhwiXB40q1nXqR9CbU1JbGqu/bRbO0JKNmCvOGGw1r81Vwk398TlvJmY7hxadXFwRWkji78ex8hdmhG4t1glSThd8ObE8g+NEu/LbR3/clkhaX80+czBkkb32P8WQ+A6jXKPBQXQj/IXbajDRSg4T5UfEYMdc=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(30052699003)(18002099003)(56012099006)(11063799006)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PV1FgLWS7LYP4v1NLOsUXVhUcbBnms0TyxUm10t8dAxYeHeZycoti/ojnfDGjwdlxBtCl2pKXf5ZJSpVhHw2MLwbsVDfDtV5uDLWJbD6b5U1RoiGRKFVLFzqP3T/eijcCjSQSexJAP93fcuI2fbQLxDzkOat0ce6hIFJ9q4qHiv3IcX8VI0Ovz5vS9KYo8IAVL08BgaAeNvC/KwJiYQv5bi076oaOMmfQdvoBUVXmn4tBUGqxzqQSQcxaTwFnVzgwFAOfUNcvZ0AykiduHI9pSj7sUM0xvr/ykXlpCPQhG2F6fV5RPSf2Xu1oITP2CMhIBTdGMfPFpGXZwCc9slcQq1b6SYkdd9L6gmhgYrrKyXkP7hUcfbKZq8fZF5GONPgk0MKRIB44m8UsSX2cKVw1qqKCClvrXLmIQ7GvCALYldwFYjKc00p0YSNNO74RBwx
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 08:47:58.8949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 764a3a0a-94ff-4084-fb41-08df4c632371
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR10MB592851

Enable STM32 camera drivers (CSI and DCMIPP) as modules being
used on stm32mp2x based boards such as stm32mp257f-dk and
stm32mp257f-ev1.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Changes in v2:
- Update commit log to mention boards
- Only enable CSI and DCMIPP
- Link to v1: https://patch.msgid.link/20261126-stm32-enable-arm64-csi-dcmi-dcmipp-v1-1-da9aba5785e8@foss.st.com
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c..608eb9fc51d70 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -958,6 +958,8 @@ CONFIG_VIDEO_ROCKCHIP_CIF=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
+CONFIG_VIDEO_STM32_CSI=m
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

