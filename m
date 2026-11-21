Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.91
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244522;
	b=niTCTYfRIP+SsZ98xHRPMx1542wcnzOvDt5JmSS5N6E82x4nb1Yiig2WI1pjk/1nVmW7
	 WKRMfTZfBq6WLKPEGhuWmEIr5xF9R2F1UO5OniSWsGHUsXurgq//zqFAQldJiLQQpzqTs
	 zN9kCYelx+OOu8fqJE3lnPbepI0eatfFXNHVz6PJyL85JCRChfbPfNqEIfJmY8jQ0UGv4
	 S1cAZYEAOjZ8PvaFrIBrMcUYI3QpAESSba2wOHLD/8LWj23aKdz+xcsG+azrqobyIisO2
	 PkM8d/AR3A6OyBQyNbRovdg6ZemM5fTj1xlKPSquxSYvkZmMJDBMkVUzRjNb7BH43UA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244522;
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
	bh=ynF/pD9hrRMyciCfKr3ww4F6lv0lnbnzxZPrmV1nMRQ=;
	b=XyyXVCS94zhvsbt3Qi8JKbpc1mbI2vt3sRdPnPmNOnVUZ0usvcMAw0GmwJ+6LS2wXDah
	 VwLWAcO3kbwhFaLh62CjUMYIPEnNglyiZCuDXBRB6peunJKTEQo7gpUx2aZt9oC3QRwKB
	 oc75hI0Wp6Y/mXo+/h17wGh6Wy5WCWoeA3SBJx2JVNa2J/0PBtOvQrFTRbnegO4iErPqf
	 CROXjuozzAXin7v5AmcGB6I1heoJmb80HIHFgo0k5S5Xcreffb3xcV8kRBNpVbs67cK6f
	 RH0MGys1WP/E/xUTzqO0m8E3lsoPahVVOqbJZR+LyZgtcAOMcm+7dvSsdlHMqharAMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.91
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021091.outbound.protection.outlook.com [40.107.57.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB83560A260A;
	Sat, 21 Nov 2026 07:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB83560A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaQK+MSDfys11gHq9FWLSyySyQon5VvClhrI//Nudi28x8xCXd83sIqU2lxwlhHBw3pWnM09/S7TmQHMzllqyuhiJlFl45oUp2ufJoXIWukLNSe3jOtcupt6yyk2HWpDT3cNAQlVUW9qGtD4cklbMcT3bVwUj6qTj3h9INrHTj2FifIzyyUg53yrw8pbAmAsL/MTOkKIQUfWMA+H6/z6fhA/ZwBiES/uCM1FnHrhcT9IOG1rIx29WC1ZrZ9dnpoQbVjy0cFMKWu1fNaW4PeDR2B8aQJ0VhMo7UM1CwWOJrXEPsmHYPDpdLet3gUXw/K9yoNLSUqXTwbYO2sZ89uEjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynF/pD9hrRMyciCfKr3ww4F6lv0lnbnzxZPrmV1nMRQ=;
 b=PYB+eVhzZ5sXMIYFvtZ2br2JFgjCvw4BCQ1VRE5oI5TecTYT8pSY8Z6IP8aLVxkXADtNnYsfvjEziScr3ktlpFSUw5+EpzeLQgNJ9EhtZwxyiR6p0PgS0Z3stPs1BRzTBy6mWud44wyvo8co3VOMAC1DO9TrgKI00FPG/0V6J4u0gw18iY/HEnam7TBNnNiQi8fxCZOcKcAEfxsA63jNt0zx2yKgXpj7c+blqNZuOYNAJe1/QQ+yjGHH9jxB9sx5qW8t5kBQf+2abYfvapS8Er6bVKNyb2VDriTiJr2RDtSBiU12HkKALYY56mdIJra6aSvgHqqNUFfZRIWAWMr+Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1768.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:01:59 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:01:59 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 14/15] media: i2c: os05b10: add 2-lane support
Date: Sat, 21 Nov 2026 12:31:04 +0530
Message-Id: <20261121070107.1768-15-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: ff9b405e-8b92-48cc-33ff-08df479d5616
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|38350700014|10067099003|56012099006|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261028144727099003|261026140227099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
 82jD0vjrWvLEv5Q2bx0Y8SfICflA5lRwOs44R15L+FIy7OpoKvwRIG7wzrnlXfJeZHrfJNBfoPjjiEUhIW2DfkHC0WFCsy1CZ8Xm2hK+O0XDBfLmlkIeTfNgDURllYKi9I/GqorctZKsVESVjThIfiA2iWR4HUwPk8JkPNmYpByaJ2cYvbQZZJwJUanrx/7lesJ/+RnXQSEntH+/rhpFFXPugceZ2tmgxMC2TokjWnf41jWPyDeE0vKAkQqREP72tnBCr1njiEsao5g6xvUW6gN7E+9aJ0999DqFSDHVCUc8EjP2RE3QSzENCpGFweVNyQOEW5X91sOEQLY+X85FkX7XN7DS3oOX5eEbe0bPHCatiTDaraXwOP0hgOIlntU2/BHNh9KmFdbq/Gi5tzdmGqdgMA28xbO0u6KqKO8gdd65mfx8tvUNz9k0P5fxkReJ9wq87LiMPRObvcWEs9Ut+M5OLnf4SmM4pyBFFt51UioF6WJnBfsp8jZgxjSijUmRWjoxMn4k/uC9R+eVo9FBSgpa6jiETq8lqYi1IXMFYBv2L2+x8BJmDCIkrtfz8iwEY62hcxiB5fuzVQxtLLn3VCPHQwihgv8Z2o/nRdIccIJttKklvEEiUHUcfmhTB1GP9jWbhmW7ONMM/6ZkNtGmuG04dgpm4v38BM2bQEKLA9PNCf/83WSUfJ/3TYp7ciQjsPVYwXagaZp5YM0oqYix91ttab6e/nrm6d0bOxqcwrg=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(38350700014)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261028144727099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?zY0gl7gO1+9DpVkNUEFq2FnOvuWx/shPFFIpbUO78BNMSYlrj3BzgvN2PzBv?=
 =?us-ascii?Q?26a5gVcOMO8A/Z89n9ZICVvRwz5YReZfMXFWG0v4ySYicMtujMJwJNXpfCT2?=
 =?us-ascii?Q?Pi+x5ufyQMaVw3V0N99ch7Fy1ktJ7t2EQKK8goX7g2GBY/+SOv6OZEIEqfk/?=
 =?us-ascii?Q?cevkhyBXM+ha8UL9vd8E4FbPfFxkJaDST/YkGmPsZkPJCfZi+ugJLqGlAlAO?=
 =?us-ascii?Q?4TDhiqcMSaa1FkUmOgdBPd/cEzSpuPmovg32RHuipV3Nb3JESynp3gC4d3iD?=
 =?us-ascii?Q?659qGoTYvXyptqULicymPw5N1NVrbgwIbp8L7iSJbY79xg7AM2M+Ypy2iX4Z?=
 =?us-ascii?Q?unWrMAeSqnE7mytO+LFlHMQzvOvDWuNeq1RJBtBMVDFs9QuIyvLSuvE9uO17?=
 =?us-ascii?Q?iRTGX712xsrjxamc9CJMoXI+VKMfwMirjkRWxjQtyfycLe95hGftKOvxVTi7?=
 =?us-ascii?Q?Lp04mRfPvEwScj5g1vJN7FLxqjhe0+xJVxivcGXYOgrA78eMbr9bv/a3jIXw?=
 =?us-ascii?Q?1BeAgHpS3jDj24xFEHBeJw5GyBSQ27b44CnvLYEV1nSrMilR/AGF3h1KX3/K?=
 =?us-ascii?Q?vsKz6mJMf0cSTD9ZIgr6z+EMchu1X84S7Z683SsCaxSWIN3O8ekjYCX0Faz0?=
 =?us-ascii?Q?uGocq5nSpgPvYg9CcZVRNJkJE0vlmG1Cmjl7UqzfPnjAempSywdq30G/iMH+?=
 =?us-ascii?Q?jhA6LU/GCWLCtWxqQ5zHVTekwdDxbZhQRteqakX5UQahO4+A9zQR7TFSecNq?=
 =?us-ascii?Q?nMHzgC5C6o7C/YcE9pMP34ODIioaLkRbpIiadBboqRE/ddWKoVitwS+KiSpI?=
 =?us-ascii?Q?LY0S/R2SmGxAduX4wVAc78FrYDDFZlzY4Uict7ARDu6xDFTpzXyRY6N/1huH?=
 =?us-ascii?Q?Yp6ndQeoSei2ldINwxS0x2vDyDncp+KlQoO4W46oh9M8oGvMgKGPORoY4kqN?=
 =?us-ascii?Q?CliyV5PPeb4iUd58X6eyyC06OLdRJj7KQ67nCIatR9DP/jQ9WNcRsA4wkB42?=
 =?us-ascii?Q?YUv5XmYR3U84LEnwlSqaIBe5LNbDKw7HeWAWmHX2U5NTQ6qRje6PHZmuxQzk?=
 =?us-ascii?Q?w9YgUSanXRfXqs6hbEjHYVjxB7V9VP2gwSN6yGVmD2jD8U5gToQHOgRKC1re?=
 =?us-ascii?Q?aflmZDC+2tRL6jWmoytmu2m4e00DVYUdPDSy0AjBMhfyhzYY+t6FCJM4HdaO?=
 =?us-ascii?Q?IoYzTC1foDbm/fSNj05KhL8B5TGHqPxRnuF3sZmFvcvpXpgqQoPR8Jt6Rm8N?=
 =?us-ascii?Q?/XUiqxfITtnlDKnZnsADItQ3hBABCrGJHKu8myJl/+5gSLWLF1q1wx3d0lEQ?=
 =?us-ascii?Q?tJDcCt7h7SLcPgfog2Lqn4q97UVbq7PuMjyunRDqjVFLeLz0EgdPvNksLfPB?=
 =?us-ascii?Q?P637bYDBkQaF6mIo0zMQpkpnKMkk/x4lEwGc7qzhZkiX2ToxFtI9aAAlAhTP?=
 =?us-ascii?Q?p9B8b8uwBqnltCuWyahe93KoIeHEmMCnlBbeSh/sOBh7LXEOmt46YWC61EMs?=
 =?us-ascii?Q?cjPeA9TFg99UYYh84x6flkwTK14o/ey12uTGSTl40k4b2+HK469l0qnD7y18?=
 =?us-ascii?Q?MMeOKb4yhk+/Fdkvh055SRZYZZYkyEF7zmqc8YD/NGy53hIHa0nT/DGspc/c?=
 =?us-ascii?Q?VvSKn+qnk06c7y0U6rVwvqVGQT34XpIrhsvi9r+y5dSp+NrbawZmDH+i4H1f?=
 =?us-ascii?Q?d/plkEm405NGp/b2+UGxAdi9ogBvBL13hybGmKSapvMcT1fNJtT3pRRne25+?=
 =?us-ascii?Q?+0qYZpBuLzIVt2cD5mGa59Tfx1tWqqs=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9b405e-8b92-48cc-33ff-08df479d5616
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:01:59.0622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EsN6vMR9F9M2mq+XBOCqIJjWiZ1Stbvnrul8WJbiZ7yUbriAmVIttylSG6OSJqb2S/TB/cLDNmKRMnJ5wRHgJtpVfOe1KWU5Gs0g0BChQ5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1768

Add support for 2-lane operation.

The link frequency depends on the number of data lanes: 750 MHz for
2-lane and 600 MHz for 4-lane. Select the matching frequency table while
parsing the endpoint and use it for the LINK_FREQ control and the pixel
rate computation. Accept 2 or 4 data lanes in the endpoint.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 70 +++++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index c03738d20a2b..0d248d3bf0c5 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -111,6 +111,7 @@
 #define OS05B10_ROLLING_BAR_EFFECT	0xc0
 
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
+#define OS05B10_LINK_FREQ_750MHZ	(750 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
 	.top = 0,
@@ -133,13 +134,7 @@ static const char * const os05b10_supply_name[] = {
 };
 
 static const struct cci_reg_sequence os05b10_common_regs[] = {
-	{ OS05B10_REG_PLL_CTRL(0x01), 0x44 },
-	{ OS05B10_REG_PLL_CTRL(0x03), 0x02 },
-	{ OS05B10_REG_PLL_CTRL(0x05), 0x32 },
-	{ OS05B10_REG_PLL_CTRL(0x06), 0x00 },
-	{ OS05B10_REG_PLL_CTRL(0x25), 0x3b },
 	{ CCI_REG8(0x3002), 0x21 },
-	{ OS05B10_REG_MIPI_SC_CTRL, OS05B10_4_LANE_MODE },
 	{ CCI_REG8(0x301e), 0xb4 },
 	{ CCI_REG8(0x301f), 0xd0 },
 	{ CCI_REG8(0x3021), 0x03 },
@@ -529,6 +524,24 @@ static const struct cci_reg_sequence mode_1280_720_regs[] = {
 	{ CCI_REG8(0x4837), 0x0d },
 };
 
+static const struct cci_reg_sequence os05b10_2lane_regs[] = {
+	{ OS05B10_REG_PLL_CTRL(0x01), 0x44 },
+	{ OS05B10_REG_PLL_CTRL(0x03), 0x02 },
+	{ OS05B10_REG_PLL_CTRL(0x05), 0x64 },
+	{ OS05B10_REG_PLL_CTRL(0x06), 0x00 },
+	{ OS05B10_REG_PLL_CTRL(0x25), 0x3b },
+	{ OS05B10_REG_MIPI_SC_CTRL, OS05B10_2_LANE_MODE },
+};
+
+static const struct cci_reg_sequence os05b10_4lane_regs[] = {
+	{ OS05B10_REG_PLL_CTRL(0x01), 0x44 },
+	{ OS05B10_REG_PLL_CTRL(0x03), 0x02 },
+	{ OS05B10_REG_PLL_CTRL(0x05), 0x32 },
+	{ OS05B10_REG_PLL_CTRL(0x06), 0x00 },
+	{ OS05B10_REG_PLL_CTRL(0x25), 0x3b },
+	{ OS05B10_REG_MIPI_SC_CTRL, OS05B10_4_LANE_MODE },
+};
+
 struct os05b10 {
 	struct device *dev;
 	struct regmap *cci;
@@ -547,6 +560,7 @@ struct os05b10 {
 	struct v4l2_ctrl *vflip;
 	struct v4l2_ctrl *hflip;
 
+	const s64 *link_frequencies;
 	u32 link_freq_index;
 	u32 data_lanes;
 };
@@ -644,10 +658,14 @@ static const struct os05b10_mode supported_modes_10bit[] = {
 	},
 };
 
-static const s64 link_frequencies[] = {
+static const s64 link_frequencies_4lane[] = {
 	OS05B10_LINK_FREQ_600MHZ,
 };
 
+static const s64 link_frequencies_2lane[] = {
+	OS05B10_LINK_FREQ_750MHZ,
+};
+
 static const u32 os05b10_mbus_codes[] = {
 	MEDIA_BUS_FMT_SBGGR10_1X10,
 	MEDIA_BUS_FMT_SBGGR12_1X12,
@@ -983,6 +1001,19 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	if (ret < 0)
 		return ret;
 
+	/* Write PLL and MIPI lane configuration */
+	if (os05b10->data_lanes == 2)
+		ret = cci_multi_reg_write(os05b10->cci, os05b10_2lane_regs,
+					  ARRAY_SIZE(os05b10_2lane_regs), NULL);
+	else
+		ret = cci_multi_reg_write(os05b10->cci, os05b10_4lane_regs,
+					  ARRAY_SIZE(os05b10_4lane_regs), NULL);
+	if (ret) {
+		dev_err(os05b10->dev,
+			"failed to write PLL and MIPI lane registers\n");
+		goto err_rpm_put;
+	}
+
 	/* Write common registers */
 	ret = cci_multi_reg_write(os05b10->cci, os05b10_common_regs,
 				  ARRAY_SIZE(os05b10_common_regs), NULL);
@@ -1194,9 +1225,16 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 	if (ret)
 		return ret;
 
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
+	switch (bus_cfg.bus.mipi_csi2.num_data_lanes) {
+	case 2:
+		os05b10->link_frequencies = link_frequencies_2lane;
+		break;
+	case 4:
+		os05b10->link_frequencies = link_frequencies_4lane;
+		break;
+	default:
 		ret = dev_err_probe(os05b10->dev, -EINVAL,
-				    "only 4 data lanes are supported\n");
+				    "only 2 or 4 data lanes are supported\n");
 		goto error_out;
 	}
 
@@ -1204,11 +1242,13 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 
 	ret = v4l2_link_freq_to_bitmap(os05b10->dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
-				       link_frequencies,
-				       ARRAY_SIZE(link_frequencies),
+				       os05b10->link_frequencies,
+				       ARRAY_SIZE(link_frequencies_4lane),
 				       &link_freq_bitmap);
 	if (ret) {
-		dev_err(os05b10->dev, "only 600MHz frequency is available\n");
+		dev_err(os05b10->dev, "%lld Hz link frequency required for %u lanes\n",
+			os05b10->link_frequencies[0],
+			os05b10->data_lanes);
 		goto error_out;
 	}
 
@@ -1223,7 +1263,7 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
 			      const struct os05b10_mode *mode)
 {
-	u64 link_freq = link_frequencies[os05b10->link_freq_index];
+	u64 link_freq = os05b10->link_frequencies[os05b10->link_freq_index];
 	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
 
 	dev_dbg(os05b10->dev,
@@ -1255,9 +1295,9 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 
 	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
 					   V4L2_CID_LINK_FREQ,
-					   ARRAY_SIZE(link_frequencies) - 1,
+					   ARRAY_SIZE(link_frequencies_4lane) - 1,
 					   os05b10->link_freq_index,
-					   link_frequencies);
+					   os05b10->link_frequencies);
 
 	hblank_def = mode->hts - mode->width;
 	os05b10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
-- 
2.34.1

