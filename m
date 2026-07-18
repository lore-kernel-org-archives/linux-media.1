Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020101.outbound.protection.outlook.com [52.101.227.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0239F35E923;
	Sat, 18 Jul 2026 20:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405405; cv=fail; b=lfGKA2LZk915sv63PwJzFpC9UHF8e19pXqwGgsHV1Rekbj4C9pn1yEAT9AICtH1Qd7/b9hWeVyGiGwDDKrKx5wmxnbx4w66MhQ2g9JrQZhLH85XiI9YeDRpMlUXW/x1X6Hw1Tj/+F2rwo34w3PRGe9qdR5lmt6pZZRy0IccYMhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405405; c=relaxed/simple;
	bh=TpDvPAkqCvmr21oJgP1tuH/u02yTVNQv2hxDOv1+Kak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GO9QCgAhoKLV2Ax3r5SFpxT9FjxBJ1OtYEJfi71vYtNcO78/6JZtUSmc2THrh4UsoLMTWDFzKnXFbrhoEbhTZY0lYejGnKAIrLbqy4KFNyFo7Ia1XhmOuTXvWQLtgEEWo9YUM8Zimtdkm3thOrU1R9wCUzuWrxTVYeKhkeLYNUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=VFLjMLmD reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.227.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="VFLjMLmD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPzVqRYeCXIaX5iq3aMoPbh0Ptxm3tYOPuU3j/JdkNZHQLCrWWaM5ay2X6IOdbcWGqLgQ8CyDUQAnfPopW18P7+fmNKs6cbFYXLJsaEtc27H/4rM10505rIotXzn+dxdFjGsIRCn/EnAow50cx5sPvRT0VJBhK7Utzbpqh8W2R7S/c6RGnvGP0zxAX6k5DyzyzuoG/GF3K8VbH4ULM20zmPO4bauSi5GNIH673zEAvMOFJ1viQZHDLMRsN0h3jfB2bMIH7i3P3dcpWc9TEb3YyA5KCqPNXvEYP20RVcSAy5/uvJHRuSm1pQqSQPGB77AiIxLGg8uW91cdTik5xwfyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XejteLcS0LsvZEvhM3MXo/pQwgT3qCcdx5mO3Xjlk8M=;
 b=FoRUT8/ThYG/yMbwcR+BltXEPOXyeth5b2zAmLGjfzFgHANp4djAGMg/X+9eL4HydSwg9jFS3NMhibeSGXR1nfTG+MjzYO7UcTeq5hmDw03FoPXgISL4opDak91aV2ykelI21t8BLgJPF3CJnFtb96IRuX8R8LrPuPiX3YYvEg0COU2nKTfwwtEcCeQEs96K5shxD+kaGU0G3Yn/sOP4EcnxbGHejCuh77ZQZbFS2lJiJxSw4mtC7VF4Z8v2bTSCqErseEP6K7Vz3Nx8iLQb7sU+zmlbrpPa4o5OLKx1HLyQBJgrZzWxDrLqmZi33etKnQSkgxolieVNsC27Phf+Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XejteLcS0LsvZEvhM3MXo/pQwgT3qCcdx5mO3Xjlk8M=;
 b=VFLjMLmDoVHO85R+TPWPQXBHAQ5ANi1tTH6+QV1ghTh4urQHcWJSABT2E8OtZsjn6NgQXu5JvZ267zN0lwuXLWkJKclGdty+057qrVn9VrBa0Y1TZyLZvPOOGZuqkfDr/1I1nu/hAYdveqRj0kE68jChGslXPXgg6HHuKZRemc8OF+vG1zu5l7AO1xupgm7waQStuRfiLq0DQJAmqQbykANDd7/NoZ6Iu8uKRo5Xj610Gz70zRA1krzP33C6keZhv5FOrjCGzqhURa9fJwkUxmND2ylr0e0xxh3ndOxQMYtM2DbUoA9oy9oQ2LKpWFRLz/Z2+eQGPLfqmpS9BkrI4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1343.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Sat, 18 Jul
 2026 20:10:00 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:10:00 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/17] media: i2c: os05b10: add register definitions and use them in init table
Date: Sun, 19 Jul 2026 01:38:54 +0530
Message-Id: <20260718200912.16001-4-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 6ca34436-fdf9-402e-73ff-08dee5088bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|52116014|22082099003|18002099003|3023799007|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	UpwuXFvaL5DNHYGvdtC5T3T2kZs+RAgZqwyv1XGt2GnqNGnCl2NEKce7n1yYKxyFKPLwMUPJG6yT5w6hx6HQ1yrQkmrl9YfDksojinmaLdgLNr38rCxthsdxP8wvu63NUe1sAML9WeyT66Fjs2DSaKeuOXebIdlNKiywJvcVzS5g9jrRgLeAe8vOuI5Oz/C2MCHGlCtJ+iI7wL5iMQe8lIgzWPPUMQxuGSyxhhtTt/MxAt9u/nbL/cMuN31H3B5jYU20SGuTxg12C91Z2OlzfBQv3v8yWXc+GOTxsqNxPxp36tG0NUBmtCnWXwQcn2Za00JGtqEOHVSMy9AHbTzUg0fXFTn1n3EVcvXXvEzYRiB0g9mdVcynMD0Pzme88W8Q6gBvbKolVmTmv9c3nyWulVretpfqAcB6c1Um09vgMmIIKAi2H+juXjeUsEuM9pMpSGBMh47WRPNZeDdn1cU/DS6kc26g32rgSoJN9R/Fq28H7WOLdeTJtxhx629CreX2Q7WHa1z6vKuhQQWdIxs2NeXni6+AoX8iUtp3ASzHUJk9o6Fu6FhlXeerlvLLsLsniluG1pBD3nJx+lVNCO+itKYHyL/sPbLOllg9jIT70ZwPI4bMqJUDyNVsfes0w/y5cp9y56DOJEDGgHe5ACqut568HQEm9GfOXlF4DI/fvqA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(52116014)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A5T8SbpVuN8J22VLTbMD++EMHIeydM0PezJRsPMG4BT1ysAJD04qTGi2NfZ1?=
 =?us-ascii?Q?7SmNrjkPcJ3tyYaQ2y0CEHDpVdanM3B7ZGv3szSfQqlMFyQ7N726alZCQUXT?=
 =?us-ascii?Q?b2wPBEWcj2+Fg2WpSqymUb0p5flAj315A4zVmJcYEAkH4Md4EjPJHg0oazDK?=
 =?us-ascii?Q?7lbgjcZaAU3yotaLOmmS0960O5M/R8e9NejYX6s5QEuf8dR9Rt9ufDelWhu3?=
 =?us-ascii?Q?b1KYVtC2wCB3hOtfcDFMOjXawmfzekBsVggw+GmCLBxqBxpHI/7i924aWUh0?=
 =?us-ascii?Q?O2Ibih6cRcSBEwv3oURfei0GKyrm0fqoLfJOxFOjz+trP3TYX81TeLwjGodZ?=
 =?us-ascii?Q?tIS5d3GhA8zDeUquOYFJwN7dOmB9AH9/tw/o9RryXarByCoQC3Q8+DpUUN2n?=
 =?us-ascii?Q?kkGB+Gc8r864tubLXAZWBV69/nl16JOas3beVuwFzgP/GVCvH1+YJ9qPX9lh?=
 =?us-ascii?Q?z38o7lN2r4ygndDiEl7M/EasEjmhpJGNJhb5FinHkdklxoIOLVJ6LE6QEqRA?=
 =?us-ascii?Q?gMPcgY9GTs+l+pdmFd27Fr3lU4VHGznBEy7dvqdC14CGDJKigLS8a2k490iC?=
 =?us-ascii?Q?E8T8HGZse4m8tbapK9gRzp4dz+o8p8pBMPFft/qrnC8+EskszkX6M2UBQxXM?=
 =?us-ascii?Q?5cAuRZtthJMLAzKMB4/Z4YxsI106cYOJ3PYVYjO/iZtOksszKLMQKqkN7pGN?=
 =?us-ascii?Q?94my8cOnkAqw6KukOF/uv/rQEeSguMEFeQik5c++PDeHD+QxyrMZfwfHgWCw?=
 =?us-ascii?Q?Mk96PeMOaY81Jz1cqeoFpLaP5o+rNq5iJ6jqDSOh8450dcA2g8DOBDFwAqTb?=
 =?us-ascii?Q?4OfW2uMHCUl6zYuWcVTVcglnDDxEBGbk3tAbF5XrYvXyxf3y0/5R/60G0ldQ?=
 =?us-ascii?Q?QfxHX92K6vk8PkWJm/NsOfJqyaA6Xi0rn5W6/h8+C94V3EW6RPiLXsGb6ESx?=
 =?us-ascii?Q?qC605TEeXgJQYGOfwK5J21gEz+MZYSvmrItA3bsVSD+MhqldKu0mZowARkl3?=
 =?us-ascii?Q?kBR2S1BnWSwLZn8CzJCTXZbDDZoMdf+FWzlPWXW+weHdVLgpCL8l5t5ja2vh?=
 =?us-ascii?Q?x11jWSJ0Ngk5bMwZQqu1OOXEJA4ppwNLTajcV9TuwgaoDeT3S+mOov+0CMzy?=
 =?us-ascii?Q?aygA3zGlFnHepgvJZ3pH2RA5owDxKd0G6Mh1tB35rb9FJ9U/x2lOl2xQxXSf?=
 =?us-ascii?Q?PBsX0Ev5usgmYEsRqC6cK5RUeZlPvyaC3pjF16LR/RZXe2jGUVRlHHNXRLgc?=
 =?us-ascii?Q?5mm0JKH5EmtJJJqD41+ChEhYKNhdJ/9/5eA8jZ7feJn17ScJa7bhLJDuafRw?=
 =?us-ascii?Q?Y2g4C4ms/NJ561wohROnFAblEkwO720xS+bRsYwowz0V3I3vUnkZjiUJUbcq?=
 =?us-ascii?Q?2mgL/kFOoWKN93+WbbYQdQpgDKm9ZAnJ4aQ6WB9H+rQmEgPQGNpHUqnIf0wl?=
 =?us-ascii?Q?qSdliqkTh3tUxR8GhEbNoKWycWdXedFRZVzfQ4HaT/zFYqSDk3qRovrrWq0k?=
 =?us-ascii?Q?6yUIDuq7Hbd6eMqB6xdDm3CB5HTe24tZQGnl3GSJJO4oNp1gZfk3Gk+E1+Zq?=
 =?us-ascii?Q?i3cNTk4sgRCp7j8g5oB5dxHloE/ulkm6eKVBMPnTP9WZsaghRZkkKswzRVtm?=
 =?us-ascii?Q?39KgKBB/nAGm9LMbsE+n0ybRJP6ckF/X52eNswn7T8W722I94XvYC1vUx4Q2?=
 =?us-ascii?Q?8F7JelkQgfKy3s5JXmOrvxoP5RCQesK4dh0yn1r2PPU56wzVi8KB3nf5lRpC?=
 =?us-ascii?Q?CzvAn2g7puXE6whu3WLLrGUS4Oe2TiHo5vGkYuKwtc+p/7NKQCOng19JUUnR?=
X-MS-Exchange-AntiSpam-MessageData-1: obQVvO0l0p3mQtfkdPN/4kXcnosh7j/lMBw=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca34436-fdf9-402e-73ff-08dee5088bf4
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:10:00.6486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cbr/7H5m/4uPReokswfyGNS6hNbVqamJxYLqhnQOBlbglLIj3wt/QvdpXqwr8hxbdvi80Y+tPDObOEes9NlypPIcm0fncskK3itLetTjifw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1343

Define named register macros for OS05B10 and replace raw register
addresses in the common initialization array with the new definitions.
This improves readability and maintainability without changing
functionality.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 110 +++++++++++++++++++++++-------------
 1 file changed, 70 insertions(+), 40 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 84621370d1da..96395cd7a2ca 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -38,6 +38,20 @@
 #define OS05B10_MODE_STANDBY		0x00
 #define OS05B10_MODE_STREAMING		0x01
 
+#define OS05B10_REG_PLL_CTRL_01		CCI_REG8(0x0301)
+#define OS05B10_REG_PLL_CTRL_03		CCI_REG8(0x0303)
+#define OS05B10_REG_PLL_CTRL_05		CCI_REG8(0x0305)
+#define OS05B10_REG_PLL_CTRL_06		CCI_REG8(0x0306)
+#define OS05B10_REG_PLL_CTRL_25		CCI_REG8(0x0325)
+
+#define OS05B10_REG_MIPI_SC_CTRL	CCI_REG8(0x3016)
+#define OS05B10_4_LANE_MODE		0x72
+#define OS05B10_2_LANE_MODE		0x32
+
+#define OS05B10_REG_MIPI_SC_CTRL_1	CCI_REG8(0x3022)
+#define OS05B10_10BIT_MODE		0x01
+#define OS05B10_12BIT_MODE		0x61
+
 #define OS05B10_REG_EXPOSURE		CCI_REG24(0x3500)
 #define OS05B10_EXPOSURE_MIN		2
 #define OS05B10_EXPOSURE_STEP		1
@@ -49,11 +63,41 @@
 #define OS05B10_ANALOG_GAIN_STEP	1
 #define OS05B10_ANALOG_GAIN_DEFAULT	0x80
 
+#define OS05B10_REG_DIGITAL_GAIN	CCI_REG16(0x350a)
+#define OS05B10_DIGITAL_GAIN_MIN	0x400
+#define OS05B10_DIGITAL_GAIN_MAX	0x3fff
+#define OS05B10_DIGITAL_GAIN_STEP	1
+#define OS05B10_DIGITAL_GAIN_DEFAULT	0x400
+
+#define OS05B10_REG_ANALOG_GAIN_SHORT	CCI_REG16(0x350c)
+#define OS05B10_REG_DIGITAL_GAIN_SHORT	CCI_REG16(0x350e)
+#define OS05B10_REG_EXPOSURE_SHORT	CCI_REG24(0x3510)
+
+#define OS05B10_REG_X_ADDR_START	CCI_REG16(0x3800)
+#define OS05B10_REG_Y_ADDR_START	CCI_REG16(0x3802)
+#define OS05B10_REG_X_ADDR_END		CCI_REG16(0x3804)
+#define OS05B10_REG_Y_ADDR_END		CCI_REG16(0x3806)
+#define OS05B10_REG_X_OUTPUT_SIZE	CCI_REG16(0x3808)
+#define OS05B10_REG_Y_OUTPUT_SIZE	CCI_REG16(0x380a)
+
 #define OS05B10_REG_HTS			CCI_REG16(0x380c)
 
 #define OS05B10_REG_VTS			CCI_REG16(0x380e)
 #define OS05B10_VTS_MAX			0x7fff
 
+#define OS05B10_REG_ISP_X_WIN		CCI_REG16(0x3810)
+#define OS05B10_REG_ISP_Y_WIN		CCI_REG16(0x3812)
+#define OS05B10_REG_X_INC_ODD		CCI_REG8(0x3814)
+#define OS05B10_REG_X_INC_EVEN		CCI_REG8(0x3815)
+#define OS05B10_REG_Y_INC_ODD		CCI_REG8(0x3816)
+#define OS05B10_REG_Y_INC_EVEN		CCI_REG8(0x3817)
+
+#define OS05B10_REG_FORMAT1		CCI_REG8(0x3820)
+#define OS05B10_MIRROR			BIT(3)
+#define OS05B10_FLIP			GENMASK(5, 4)
+
+#define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
+
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
@@ -77,30 +121,25 @@ static const char * const os05b10_supply_name[] = {
 };
 
 static const struct cci_reg_sequence os05b10_common_regs[] = {
-	{ CCI_REG8(0x0301), 0x44 },
-	{ CCI_REG8(0x0303), 0x02 },
-	{ CCI_REG8(0x0305), 0x32 },
-	{ CCI_REG8(0x0306), 0x00 },
-	{ CCI_REG8(0x0325), 0x3b },
+	{ OS05B10_REG_PLL_CTRL_01, 0x44 },
+	{ OS05B10_REG_PLL_CTRL_03, 0x02 },
+	{ OS05B10_REG_PLL_CTRL_05, 0x32 },
+	{ OS05B10_REG_PLL_CTRL_06, 0x00 },
+	{ OS05B10_REG_PLL_CTRL_25, 0x3b },
 	{ CCI_REG8(0x3002), 0x21 },
-	{ CCI_REG8(0x3016), 0x72 },
+	{ OS05B10_REG_MIPI_SC_CTRL, 0x72 },
 	{ CCI_REG8(0x301e), 0xb4 },
 	{ CCI_REG8(0x301f), 0xd0 },
 	{ CCI_REG8(0x3021), 0x03 },
-	{ CCI_REG8(0x3022), 0x01 },
+	{ OS05B10_REG_MIPI_SC_CTRL_1, 0x01 },
 	{ CCI_REG8(0x3107), 0xa1 },
 	{ CCI_REG8(0x3108), 0x7d },
 	{ CCI_REG8(0x3109), 0xfc },
 	{ CCI_REG8(0x3503), 0x88 },
-	{ CCI_REG8(0x350a), 0x04 },
-	{ CCI_REG8(0x350b), 0x00 },
-	{ CCI_REG8(0x350c), 0x00 },
-	{ CCI_REG8(0x350d), 0x80 },
-	{ CCI_REG8(0x350e), 0x04 },
-	{ CCI_REG8(0x350f), 0x00 },
-	{ CCI_REG8(0x3510), 0x00 },
-	{ CCI_REG8(0x3511), 0x00 },
-	{ CCI_REG8(0x3512), 0x20 },
+	{ OS05B10_REG_DIGITAL_GAIN, 0x0400 },
+	{ OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },
+	{ OS05B10_REG_DIGITAL_GAIN_SHORT, OS05B10_DIGITAL_GAIN_DEFAULT },
+	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
 	{ CCI_REG8(0x3600), 0x4d },
 	{ CCI_REG8(0x3601), 0x08 },
 	{ CCI_REG8(0x3610), 0x87 },
@@ -274,34 +313,25 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37f5), 0x00 },
 	{ CCI_REG8(0x37f6), 0x00 },
 	{ CCI_REG8(0x37f7), 0x00 },
-	{ CCI_REG8(0x3800), 0x01 },
-	{ CCI_REG8(0x3801), 0x30 },
-	{ CCI_REG8(0x3802), 0x00 },
-	{ CCI_REG8(0x3803), 0x00 },
-	{ CCI_REG8(0x3804), 0x0b },
-	{ CCI_REG8(0x3805), 0x5f },
-	{ CCI_REG8(0x3806), 0x07 },
-	{ CCI_REG8(0x3807), 0xa7 },
-	{ CCI_REG8(0x3808), 0x0a },
-	{ CCI_REG8(0x3809), 0x20 },
-	{ CCI_REG8(0x380a), 0x07 },
-	{ CCI_REG8(0x380b), 0x98 },
-	{ CCI_REG8(0x380c), 0x06 },
-	{ CCI_REG8(0x380d), 0xd0 },
-	{ CCI_REG8(0x3810), 0x00 },
-	{ CCI_REG8(0x3811), 0x08 },
-	{ CCI_REG8(0x3812), 0x00 },
-	{ CCI_REG8(0x3813), 0x08 },
-	{ CCI_REG8(0x3814), 0x01 },
-	{ CCI_REG8(0x3815), 0x01 },
-	{ CCI_REG8(0x3816), 0x01 },
-	{ CCI_REG8(0x3817), 0x01 },
+	{ OS05B10_REG_X_ADDR_START, 0x0130 },
+	{ OS05B10_REG_Y_ADDR_START, 0x0000 },
+	{ OS05B10_REG_X_ADDR_END, 0x0b5f },
+	{ OS05B10_REG_Y_ADDR_END, 0x07a7 },
+	{ OS05B10_REG_X_OUTPUT_SIZE, 0x0a20 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE, 0x0798 },
+	{ OS05B10_REG_HTS, 0x06d0 },
+	{ OS05B10_REG_ISP_X_WIN, 0x0008 },
+	{ OS05B10_REG_ISP_Y_WIN, 0x0008 },
+	{ OS05B10_REG_X_INC_ODD, 0x01 },
+	{ OS05B10_REG_X_INC_EVEN, 0x01 },
+	{ OS05B10_REG_Y_INC_ODD, 0x01 },
+	{ OS05B10_REG_Y_INC_EVEN, 0x01 },
 	{ CCI_REG8(0x3818), 0x00 },
 	{ CCI_REG8(0x3819), 0x00 },
 	{ CCI_REG8(0x381a), 0x00 },
 	{ CCI_REG8(0x381b), 0x01 },
-	{ CCI_REG8(0x3820), 0x88 },
-	{ CCI_REG8(0x3821), 0x00 },
+	{ OS05B10_REG_FORMAT1, 0x88 },
+	{ OS05B10_REG_FORMAT2, 0x00 },
 	{ CCI_REG8(0x3822), 0x12 },
 	{ CCI_REG8(0x3823), 0x08 },
 	{ CCI_REG8(0x3824), 0x00 },
-- 
2.34.1

