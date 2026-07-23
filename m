Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012054.outbound.protection.outlook.com [52.101.126.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DD0431E74;
	Thu, 23 Jul 2026 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800521; cv=fail; b=d6pS0RnMQg8j2EiRSoV1W6K9N8k9KLKJ7kiV/ynPNNadTdORDCXkq0syvCr7ZuFp1fyR8n7VzTLUE1kD9+G4k9wTz04gIgjXAbDr3s9aiKltzFRvcImCDPys4877Hlv5l6HyHmJoeVrUFG+2FZYEom7orv7Pb/gtUUJj7+3a2lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800521; c=relaxed/simple;
	bh=vJ1sIh6rQwaDVizwgESZlTKjKeQ01qLW9kjTiazffaI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qXmCVwHrWE9ier0/3vnyCKE0P0X8jqQfDsAOzG3DhXG7/nzC1YlvNQzfcgrEeX66MzEbj1Cxa/C052jLmkm3cw8dkt6Xt46Z2ed50oFq/uJM6jGl8zlyi7nIb5NIgDZRj+i5vS1utBAjPJEyNoIjDS2FBl16gt/lXEGpWVGsvEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=HwzJAsvp; arc=fail smtp.client-ip=52.101.126.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="HwzJAsvp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSAecKfDRkyZSLo3ZUwjBbBKcFlNkku9a4VAib8QS9Uh71EBG5YzfzrjjZ3nnnDO/JDkWwLyMD1drAuMW1nUTlCg7alE1+iXN8sKa+rHHnyyFkj+NEMx16H67GbFLWqyW3P1neCn7Ogy2uXEHuzqGheAYJ0pTS4oOLXgm7ZWiD5KdIxUuNJbpifAbqaBpZu84l6gSNwNQwk7rIC/RlQDlon8hmcqPO50rI8T6DiypO+v0STSNtVu4nmlWYrr5LHDqLnD/SAQZB+uy3woOlJqFqJsoEy4fT19st0nOmQgQoLe9kqUTjuqsNggUf76ChmyP9TZyUZgnFReZNf5aH9eOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2uFjyxhgiAURQoaY6WMKAikydekSsaYJWnop7XW7So=;
 b=EYWBxgPl6PjQnycdw98aim55CcHZd9OD8tciKEO+S0fYpT+99KYGW8gYACyDBM4gLjRFZmzcoUbv/XT4UCCLeG3JqmIuvC6kXisNDdGB+hGl+4bI+uYQTAxMGS7B5NzRpLM9ltABReABJ8uPRAuY8OsawI1QaVOfwQM2ueWXvHYnpaC20k/gsOm2RUM8l55DpiiT6WsI+wasz19V6RM9+YASLi7ZmkeQvYO9X6GcVxGHaeDcyaJeHO4583GDDPCDO0uD/RZgVCsMO/kjlZBQx4OZDssYfNMXdMTnX2UuaT5ueIttadPgkZzspmTLIREdPRDLUTsxnzcOBBjh8Y1jYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2uFjyxhgiAURQoaY6WMKAikydekSsaYJWnop7XW7So=;
 b=HwzJAsvpZyFg2xjrTItyjVc/C1/ZA5ymChWtrEmM3Uu2mDTDjNF3O/nL7UNypgQpd0chmzTqOQqEXptZ/6wQXFYrDlirjc0fGeIFgb+qggMSDAWfUFhgg7/yw6U1QC8Zi7pdCv8e9E7ga7Lsa5P6tljIzkLvPsuSfWhEUbQ7ZdJmoFIL/NzYfE0purKuEDqRy5bWdfsgbs2ifsQeXsil1ECAyfauij8YM0qLKUEEPRhPUd3pGAYWseMf7RG3hB6bxwe7vPndKAy6mybKIq9WEc7EEDKkj68ncxhE0ZXirWFUSH7j9hF9BjqOwGzNkK3GO4NrCD42NZDUVpeJnyBfUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI4PR06MB8778.apcprd06.prod.outlook.com (2603:1096:4:2ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:55:15 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 09:55:15 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org (open list:MESON AO CEC DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON AO CEC DRIVER FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 1/3] media: cec: ao-cec: Remove redundant dev_err()
Date: Thu, 23 Jul 2026 17:54:57 +0800
Message-Id: <20260723095500.523448-2-panchuang@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SI4PR06MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a85579-8020-4494-ec9b-08dee8a07eb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|7416014|376014|1800799024|366016|921020|38350700014|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	PvONCoh6nDCoOhTkUBLSdSZ1yKeR0bdrAKQND4ce/lOV1gRjVNY3lfVUs+YiCTdLwhdYb27yiV55NRNcqfP71xVtEmVnNadYjNNI6kF0Z2lXsB4xNy0t3AM7AcMoLhU23xZLnUE3qYQpHWkUDqjZs8QwsCyXm/bIpP23ZVR1INCBydyFhbHIkVQh5ivKhwKckRMs5+2Uagm8WlgUfLFSdfnyXzB5c2TswLPN/sSB47dENaEpFyX0McC3h04YSYAhl3yzqkX+o6Tgd3QjNFaPjSto+rj4ZqnO58fCtG8xhbhvSKmLDO1CXbMPuSe8znnXrGPH/bb0qBpi9053jYWMStR0gTljj4dtTDekT5oeAcop9ZGjGBVRWp552GCRPbqsNj6rRxCUlwj/msJyiATYePZcQ3BDg27xpDWsrv3P3Hglz4V7B8F3y2GWwjC7OAA6r3BMUWT4PWXgho3n1V2lZ241WmGtd0JiYkK5QFsNyDSnNkyoRx59ETU6fBdyG8d2c9oXvPzs/oTxrwCgZp8IEGVWR+au/iMr8amp7dnPzGNSdRB35bYY7s+9jXFRaFesT707Mk7QbZwaWkybrcxCyy/eFi64SGfc3M/BOWMbA3MKl2j1XuFJQJwdyFK9ka7BEojHdmquJoEA2BB78VHpZQJUPkTsS20f2816hHs0vVd+/KazeS+OVagMbyx2RMr7705U6iXtOOgnEWHUo+TK769R0PaRsKp5dFx5eMxq3MPgnfGGRA8lDM1tJk7Mv88E
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PmlDYhv5ZXZk/wFYBp30pou2f/ClKHF22MK52ftu3TLJ7m+mIQQbLZmiXR8B?=
 =?us-ascii?Q?KLOn50SjXafio1FpQdSXCwdflykqvQOmTywCbp5FeGPAhARj/TfYQ7tYvJTt?=
 =?us-ascii?Q?Wcf/19Cl3shRlJN4pQPvhfmiQ0KqlO35y78UkDGLZh2wusENZ56qzP0cvYLc?=
 =?us-ascii?Q?9MjvtLMe9467Tm6Kko7W6XY2u7pNYm7tyMLHkON8ks0Y8+RXL7Az3R0sIDha?=
 =?us-ascii?Q?9ne5e3g61EpBnT6120RTJIJT7fA7dd45stl+tso0yZdxvAhT+971pSt2sXhF?=
 =?us-ascii?Q?AnZ2dsfa6mmYf46FxHnwrZyeOdR8vAmf91b+e6DLbRoVbHbBtTAsl+TSd4el?=
 =?us-ascii?Q?kEFUEz0c7JRcq0vzSCwSe0z57ilTYGJih/lCjhUKgoYNl60J7tJWy7+uUZNS?=
 =?us-ascii?Q?mUcPrB0PVW4qtT1mHo+tbpt9htln/xGiDHke+LrvrRocbZkw2TIlX0clUM+4?=
 =?us-ascii?Q?6k42VfTU0SOiPMs9gd4NwSMIOnBbmL4imsGMKx8sYrsAipTHuSOh63TaK+rv?=
 =?us-ascii?Q?wBx+6nsD1shKghAQ5a7C5hoNv1RvPil7bv5pPLssiyvjsBNDcvLK+sIluB8M?=
 =?us-ascii?Q?AzRV2hrZrNiLj0yxV9Sp1QuWR1TQh9CMpY0uba2iEZ5bWlshCc5guVhcBOsZ?=
 =?us-ascii?Q?Ws3sohUyk6jMhIf8TnfrudONV0WivR3un58+70Qb7u1PKS/STd/tUgHfY/Js?=
 =?us-ascii?Q?uqtlI9jm9tm7xl5vWUWfdzngKjSJwLZZ4gikysJBjrhiF9/6pdGJ7+ps29gA?=
 =?us-ascii?Q?/TAWgfFFoY31eu6akz0u8fkNIfyKj1H5cwiNTIm8mvB3odITSS2BLzaUON1k?=
 =?us-ascii?Q?DCnDCJo6j+QapKSD+czgNDyZUgb3b8jnlv2Q/Jkn6xKINyigV0kMh6ezy7wg?=
 =?us-ascii?Q?1x8AhkQuCEpJlR675/B5ZM6CISpPh9IGJ+TFVsqwPD8ixgM6LGYNkA3H36g8?=
 =?us-ascii?Q?KvtbPnDOHhFGj1E+5Lu6Tw9gZIy51+33XqNkD0vOpHEHa4DoOqjEoteG0RyI?=
 =?us-ascii?Q?kftBKoVSmInK54XnjG+clHU6o3Y+jxW3PadRqJt1gPod3iLMX9UmvOVaOCd3?=
 =?us-ascii?Q?eSGWSMUzK5M9kLJdhyglYWUqBmSGuxVtDy4UoPqwWoKefFQhlaXNK1BUsEtW?=
 =?us-ascii?Q?4XyyatN4S2hzMk9c0tOMYAmGZPEK3nkHp4Y9+se7mwzPtkbnphjXHYY1jF1r?=
 =?us-ascii?Q?UCpmz7UG3SG0P28eNm1b3QBFJszyXUf6qS+fNAcJXfx9AWYJ0xmYcjzT1p8s?=
 =?us-ascii?Q?bWSYSxaEpnu3ssqp0HG9tim0m5T/gGjbB/D/Sj865mWqr5Gq2ADbL2dqkR6d?=
 =?us-ascii?Q?fIUor86qoI5yj3wb4sTyP5hsMwbuLeFaypORdXpottYYvo9nkGO/zt/s73Uh?=
 =?us-ascii?Q?XZ6DX58QJkJp/z1WE4XBCzqiqtr5g6QgTTqpzw5yNrCQdJxTU2Vhq634RC+j?=
 =?us-ascii?Q?zUnP6AHdsETGRGrna0wxD5Hcjrzd0MIrYiz3mCPEs8A3qiGWsNvgXG1tjfWd?=
 =?us-ascii?Q?JH1Hcr7fc2pik/eXW33aP8ygmFLjzXtLMSnd2f9Ukd6cq/y7J8AHVJDkj2RW?=
 =?us-ascii?Q?QXFMGzi1K/uyDBlSEt/MUTunoIQI/NqQHtgRtqpTLex1ogUlMFUUDvlkuJiR?=
 =?us-ascii?Q?3ZimZ/srLlPgiwZDQf8DTHJpoh3Az+7Q+60aMYZW3dqYasK28vz2oWEqk7wK?=
 =?us-ascii?Q?O4Zks4irMT1m7IwhaklkCHAVbUO5KCD9lvpkK8nXodXzbV/LwXd0e2AtrfUw?=
 =?us-ascii?Q?puSwplwVoQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a85579-8020-4494-ec9b-08dee8a07eb5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:55:15.3808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOkZ9H6TcFFwM1h4lNNl4zer6O1aNZhEWx8l3WdqWOCuBJub75gB17BPFQiNxQcSLO3ZCBVJRrEqge5jd6eyxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR06MB8778

Since commit
55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()"),
devm_request_threaded_irq() automatically logs detailed error messages on
failure. Remove the now-redundant driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/media/cec/platform/meson/ao-cec-g12a.c | 4 +---
 drivers/media/cec/platform/meson/ao-cec.c      | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/cec/platform/meson/ao-cec-g12a.c b/drivers/media/cec/platform/meson/ao-cec-g12a.c
index 2c914f0008b5..b175be3f2bf4 100644
--- a/drivers/media/cec/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/cec/platform/meson/ao-cec-g12a.c
@@ -689,10 +689,8 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 					meson_ao_cec_g12a_irq,
 					meson_ao_cec_g12a_irq_thread,
 					0, NULL, ao_cec);
-	if (ret) {
-		dev_err(&pdev->dev, "irq request failed\n");
+	if (ret)
 		goto out_probe_adapter;
-	}
 
 	ao_cec->oscin = devm_clk_get(&pdev->dev, "oscin");
 	if (IS_ERR(ao_cec->oscin)) {
diff --git a/drivers/media/cec/platform/meson/ao-cec.c b/drivers/media/cec/platform/meson/ao-cec.c
index 145efd9af6ac..2df0d3743077 100644
--- a/drivers/media/cec/platform/meson/ao-cec.c
+++ b/drivers/media/cec/platform/meson/ao-cec.c
@@ -636,10 +636,8 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 					meson_ao_cec_irq,
 					meson_ao_cec_irq_thread,
 					0, NULL, ao_cec);
-	if (ret) {
-		dev_err(&pdev->dev, "irq request failed\n");
+	if (ret)
 		goto out_probe_adapter;
-	}
 
 	ao_cec->core = devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(ao_cec->core)) {
-- 
2.34.1

