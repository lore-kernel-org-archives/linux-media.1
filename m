Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.99
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244516;
	b=GQ1LzqDR7RtyQcVAj6rd+Bq/Q3w3+Of6GHu45CYMJDX7ZPXaX4o9MU4tai5knaigk33m
	 zh4uz/bBgn9R56vGFPqx9/gpUPudL/RRHfoC+KbXIgdGsBHLZ2YdWaM+Wp3bJgrYB7tT0
	 HUh3lB/XsCo6pzTUj+asXlh9NCSh0LFjwCY+FoVAPu/Yd2gjwc6rGYTedGt8ZH56MwJcl
	 Km2lSpenuddj8kcRm0tEqgamrZlmDah5gBHeymaL9gaCn38Aip0/mKNlodIi2LZbbv04R
	 ETB6lTyjyNX/MmG27w1QmqTBeAMyu3O+pudIJTl8X1/3Ytw12q3yRnud/Lhgg6afjLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244516;
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
	bh=qwpegY5gO3T3zamXBonwL8ekgsDCkAjpfn7dxlf67x4=;
	b=kG1+lFILanfhVmx0BJT2uV+ZZlgKkDkUWWybYffNVKm6aq5G099MVDRG2xGA5FXzLFFr
	 ewRREl+lQ3ksUs9Xnxm3ly8eHKKVjeNrPodO2W/f2Ke4T8OrD3nd8gocyGFEACHGa4jdg
	 9bR5Ozg29gQJ0t0YpONTZkFVwrxFSjuc+hkymuENFwgK4Q15ty6bJNBErBzczgi5A2kEs
	 ti2FUkDrk8Q5OTMilFul2l1KLeA4DppksQb5EMW9aFma3KxM7/heJwm3Rx6On5QacFjZX
	 ThqbUFObMZqaFXqDbt2B0UA/Mk1lf8EAuH/VPiNCO5BhXxnJfzyOI4bqiqZzG4KhTQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.99
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021099.outbound.protection.outlook.com [40.107.51.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCB1606A698;
	Sat, 21 Nov 2026 07:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BCB1606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSFgjVOuA5soKqGKcMvP+j47SgcR89y+cuEi8Me7EstY3P2xmpwwCD96J3Yvejd05+JwZZjlm9Xc2uT7eyIMefj1AbBhLos56VEEP1gzH3ZyIGQFgY61oad9uGdcgrA9pRLUIP+fATovTLZlJMYDwl/gdoSC0Fv/Ul2mcjT7+bRAYTikfWBYo+Jkz+rDxpzVVDHzdi2+WdLyIwIBlq1z50z8u/XvtkUsEZ2FmZYEiad6VsYZIfH9UTv+F64VGUhfubLp5k+ViXojOwND5JRTKzXoxgOUZGNei9P/N7LFe1FwrDBKN3uNM3yFSkdUbA9kYxHxmT3J22zBNRZ13l5o1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwpegY5gO3T3zamXBonwL8ekgsDCkAjpfn7dxlf67x4=;
 b=e7smudsHMhseBwRsLpMWwilDQgLZID3kMZaQ298+WmSdaHJLG9cBw3EdUeD4hrbTGw+LqnGI+AEVTlVs/5jkU09b0va/tSBP5oJSkI61r0nAJNIzRu+1E9KHVF0w+0qcxiOQOcSPE0Mdn1i/D2cHSQFT2uDdAcw6z5Q93bshaNlP8vXdqh2oyDkI26iVsZYOCUD6vqWO2bbIViIl+P9vWO5c3ODp1JgA+/bJ5Hp0FlSg3DZdzJOk/U1sIaSkujMTrIqT859+3XVg5+PJpmp//0PW3Oe5oKiuRh/2H8W31vLmgU6v8Xa4RFiNJqtIAGqzUxGvfAAOP5ElMxN9Zq2TMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1768.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:01:52 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:01:52 +0000
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
Subject: [PATCH v6 11/15] media: i2c: os05b10: add 12-bit RAW mode support
Date: Sat, 21 Nov 2026 12:31:01 +0530
Message-Id: <20261121070107.1768-12-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 68e473f4-6c59-4128-5eab-08df479d51ec
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|38350700014|10067099003|56012099006|261021123027099003|261021121427099003|261022075727099003|261022115727099003|261022105027099003|261009223027099003|261028144727099003|261026140227099003|261102123227099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
 qFGNYmBc+KDK3EvFt73xWYkgugeAJGWomYOQONvJLQq1osmYwPXoJivpcCMFBndUlEh2vzdbRHy44M5OUUCU74W0NJTkw9qvuGOsf59iXW0g6Iio2bTOdNM02zwYNtHE0TSsq35Q5KR8c5gGXTtQh8hPrV0YYIH8G7hr8DftEbWe6xbU+21X5In3LELEufXTdHiqYxW8c8HWPhXQsJsrCmgKYIqedjHoIynd5XHX03NLxh45JgBOL5/1/KET4nfJsQchde3wpiv/T45WOlj+SCsQ5xhmgk2RNh9sscl7zRahRNI4PI93mPCwb1rxqtRj2f8jYNM1bT4bc9sza3q9XZm9T09KwSroEmdV1jIIf0uB6nM9DFYb//OYLrBdIL1Nq2Lzg41ybjm1QoKSgcvxh9I6Po9pknKBm8t5s3pQ5wZHEnFIq5Ljk8JAG39LSNLWrsm8iI2w11fnPfh+dcbyws2u5l9Ttrc06cMgaC9elLXxmtQ7CZOmRRtyGvMQxaca2CcY/2XnBAs4WJa5yFMjO9EluZjG/a2JhLhuTqMyoPuXwlxQfdmSDkz7CWcTg+QMQLMWD9mLM0eg/oxuGIHxauzGiS2dUxUh+5X8yom4P462CEroLmyXQGYXH0gPJ0R/gKS4d64kEF8kK+6eBN7Rzjgb0411PU72qCX6tS1x16oaavWDYvd/cgveFy5ctqQtp51TOBGTi+E+GJmyn35L6YNH/VrtT4gAX05culvj3pI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(38350700014)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022115727099003)(261022105027099003)(261009223027099003)(261028144727099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?OESWmoWPYhRDcok9+lVSIyae2PfKjL10s6qGB1IcE/c9eDIlul2MgkLf0AQe?=
 =?us-ascii?Q?DDQI1mcLTVMOkg834uVSERTE8xp85DOoLN3WhX2JPh7bjr/Dz16w/rhFwDf0?=
 =?us-ascii?Q?dfg570nJsp/PFLyuJ+5mdf2hTEDXPhwS9eT6Axe+GPOUW7IqgnlyqfzYahuJ?=
 =?us-ascii?Q?ulDGX1vl//vmtPezws/A0p907WAgDSK3DMFiyt84ND/vvtCH64E108WC6Iq1?=
 =?us-ascii?Q?PxNFfVYjyME5ILcCdTd4yt+iP0OJN2DeVGYAW+iakUoOUyJ7TyU07vY30GJT?=
 =?us-ascii?Q?QjritiM5ZMG3nvbq3G7KD4U++XtMeHYefUBS9zcw5zLmz2YuEWMzqx+mORJv?=
 =?us-ascii?Q?pB9VOenKFhRs4ALttB3BvdALgsXyGerRCtBviF3G4NvUQjS+OYlukDIucZBb?=
 =?us-ascii?Q?MjgaDwd6xrv2cHSEdigS2FJkvUJaJ84WLIz+J2//2/nDOGz7FLtfv3SOD4Zf?=
 =?us-ascii?Q?1ZSY2aqF81vnnh8Vvbs3cPo6mKH6Tp2zRsMXDbNNJDY9bZ5ndyo+DT+ZU1Cr?=
 =?us-ascii?Q?qnOsiRfUs3Y13uhLKvtd1Kp1prkmusOKXJ5eiWdRWgkDgAgPJiY0xgS3q4OF?=
 =?us-ascii?Q?9YuSVxXRLJ/XL412Cw5odoegLtBL2LEGQS+KyZDyl+kaDUBtQBQpvzScIge5?=
 =?us-ascii?Q?rP8DoBjhfzc/K+rLHBvCGf5QvsG8u0ApeWoJy74Bbvju88R40rr4hFqyQW5l?=
 =?us-ascii?Q?rw/Q0OrvJLcL5fbseuhAon1ALAeDjHeSxwJDK+R2k7wx8dGYFDp8OQ6QVTVT?=
 =?us-ascii?Q?HMjDQuXOOx+6EfajqPxJuHnyHeGtf7ckDKSD2G3pTY/EP40iRm1oGrqTganM?=
 =?us-ascii?Q?E6XkYZkMA0Y2B+iGt4ES+vJd8Z4Lk+4HZaXTgYMgkAuWRBahOAMFfblZoXPK?=
 =?us-ascii?Q?Rjj37u7JBu7jV5zEs8F6bTqxv1H5hsMYTuuq7ON3s6g7tlkFG5u4f3Qvy3ad?=
 =?us-ascii?Q?ej+93lEZ16F1CTaCW/t7W1VJuZE9fjVI1LC0OQAbTmsJsyHKOHKXF3gBE4IC?=
 =?us-ascii?Q?70t/hu24kjkDjyvF+2eX028E8WQBGNGqK2IGeiDK+E+73TqK3/iPfaeZShEM?=
 =?us-ascii?Q?zohRjl+BAi/keSiq3s/LLCpxiIZftcF2uVWCmBtw6uY71pQ0hVRTz9rZ9UV8?=
 =?us-ascii?Q?UbO3qtszE7cIoiz5jIYOhHtAqGBsz4mnDcX0t1eH/r5TPXm99eG3JauDhAqh?=
 =?us-ascii?Q?Ts/VFYlqUgm+mn4ZPHdoFb7nbxR5sNA9wBt0krYPlRnyPfQhChbTMJSwWXDF?=
 =?us-ascii?Q?tUTsNTynbwQqezNr1SDGQJUBve79irGpQiaAC5XT6qVQa+2CCZVhyHhYVfeD?=
 =?us-ascii?Q?r7e7jZTvCdOMZiImbmzOerTYh/YgFLP8PzOl7A9A4+UU0p8dW2mtLcVwW4nB?=
 =?us-ascii?Q?xnS7257ZIl6pD6UynKBInCtNcNXhmKRdRe6cyAtQXqa7sVmhE4GSe+0fRYTa?=
 =?us-ascii?Q?UsIB7JCuYqGvSY6JOrSc/aLuF5iLFEBtf3qhsuXGN9s/SYWVOR9x8zudgSv8?=
 =?us-ascii?Q?E5yB9AkKNjr6tDjSATbxs54DV37smVnJC8lIl8P3sah5ArGKD+oX2He+YVi7?=
 =?us-ascii?Q?OGrLW+hxe3crlw9BaK22NAmt7D/VF5MJZIV8NN+YaElWVLRX0wYGH3R4/DAH?=
 =?us-ascii?Q?AYEavsIv3/3tF78Mq8TlCz4IYja70NGO95dP9qFxVvlYvYGT02Gylngj63+Y?=
 =?us-ascii?Q?8vLKIpSRnYmDQgsXrBP94Bjoj5h+gcqO1VzR6ZLsF22x48OgnHGOcDYVMwtD?=
 =?us-ascii?Q?WzzItogNmK0TdAnl1oHSYOBZkuI4qNI=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e473f4-6c59-4128-5eab-08df479d51ec
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:01:52.0778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Fft25AqSWXljBIuNfX3GYrdnYvqxpqY/wgjPIxvtklV1w//UGRuq+fJ9gBo2NKwxjBw29mkxGSvUgO9dZrYhdQeyX4CKwfHTAREVhoTDSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1768

Expose a 12-bit Bayer output option in the OS05B10 V4L2 sub-device driver.

Add a 12-bit mode table alongside the existing 10-bit mode, extend the
enumerated mbus codes to include RAW12, and select the correct mode table
based on the requested mbus format in enum_frame_size and stream enable.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 128 +++++++++++++++++++++++++++++++-----
 1 file changed, 111 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 79d497e6c1c5..b1b1cc2d8fc7 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -142,7 +142,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x301e), 0xb4 },
 	{ CCI_REG8(0x301f), 0xd0 },
 	{ CCI_REG8(0x3021), 0x03 },
-	{ OS05B10_REG_MIPI_SC_CTRL_1, OS05B10_10BIT_MODE },
 	{ CCI_REG8(0x3107), 0xa1 },
 	{ CCI_REG8(0x3108), 0x7d },
 	{ CCI_REG8(0x3109), 0xfc },
@@ -494,6 +493,21 @@ struct os05b10_mode {
 	struct os05b10_reg_list reg_list;
 };
 
+static const struct os05b10_mode supported_modes_12bit[] = {
+	{
+		.width = 2592,
+		.height = 1944,
+		.vts = 2007,
+		.hts = 1744,
+		.exp = 1900,
+		.bpp = 12,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_2592_1944_regs),
+			.regs = mode_2592_1944_regs,
+		},
+	},
+};
+
 static const struct os05b10_mode supported_modes_10bit[] = {
 	{
 		.width = 2592,
@@ -515,6 +529,7 @@ static const s64 link_frequencies[] = {
 
 static const u32 os05b10_mbus_codes[] = {
 	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
 };
 
 static const char * const os05b10_test_pattern_menu[] = {
@@ -546,14 +561,33 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 	return container_of_const(sd, struct os05b10, sd);
 };
 
-static u32 os05b10_get_format_code(struct os05b10 *os05b10)
+static u32 os05b10_get_format_code(struct os05b10 *os05b10, u32 code)
 {
-	static const u32 codes[2][2] = {
-		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
-		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
+	static const u32 codes[2][2][2] = {
+		{ /* 10 bpp */
+			{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10 },
+			{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10 },
+		},
+		{ /* 12 bpp */
+			{ MEDIA_BUS_FMT_SBGGR12_1X12, MEDIA_BUS_FMT_SGBRG12_1X12 },
+			{ MEDIA_BUS_FMT_SGRBG12_1X12, MEDIA_BUS_FMT_SRGGB12_1X12 },
+		},
 	};
+	unsigned int is_12bit;
+
+	switch (code) {
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		is_12bit = 1;
+		break;
+	default:
+		is_12bit = 0;
+		break;
+	}
 
-	return codes[os05b10->vflip->val][os05b10->hflip->val];
+	return codes[is_12bit][os05b10->vflip->val][os05b10->hflip->val];
 }
 
 static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
@@ -565,6 +599,34 @@ static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
 			 os05b10_tp_val[pattern], NULL);
 }
 
+static int get_mode_table(struct os05b10 *os05b10, unsigned int code,
+			  const struct os05b10_mode **mode_list,
+			  unsigned int *num_modes)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		*mode_list = supported_modes_12bit;
+		*num_modes = ARRAY_SIZE(supported_modes_12bit);
+		return 0;
+
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		*mode_list = supported_modes_10bit;
+		*num_modes = ARRAY_SIZE(supported_modes_10bit);
+		return 0;
+
+	default:
+		dev_err(os05b10->dev,
+			"Unsupported media bus format: %#x\n", code);
+		return -EINVAL;
+	}
+}
+
 static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
@@ -625,7 +687,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		if (ret)
 			break;
 
-		fmt->code = os05b10_get_format_code(os05b10);
+		fmt->code = os05b10_get_format_code(os05b10, fmt->code);
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = os05b10_update_test_pattern(os05b10, ctrl->val);
@@ -646,10 +708,11 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 {
 	struct os05b10 *os05b10 = to_os05b10(sd);
 
-	if (code->index)
+	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
 		return -EINVAL;
 
-	code->code = os05b10_get_format_code(os05b10);
+	code->code = os05b10_get_format_code(os05b10,
+					     os05b10_mbus_codes[code->index]);
 
 	return 0;
 }
@@ -684,11 +747,20 @@ static int os05b10_set_pad_format(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
-	const struct os05b10_mode *mode = &supported_modes_10bit[0];
 	struct os05b10 *os05b10 = to_os05b10(sd);
+	const struct os05b10_mode *mode_list;
 	struct v4l2_mbus_framefmt *format;
+	const struct os05b10_mode *mode;
+	unsigned int num_modes;
 	int ret;
 
+	ret = get_mode_table(os05b10, fmt->format.code, &mode_list, &num_modes);
+	if (ret)
+		return ret;
+
+	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
+				      fmt->format.width, fmt->format.height);
+
 	fmt->format.width = mode->width;
 	fmt->format.height = mode->height;
 	fmt->format.field = V4L2_FIELD_NONE;
@@ -732,12 +804,21 @@ static int os05b10_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes_10bit))
+	struct os05b10 *os05b10 = to_os05b10(sd);
+	const struct os05b10_mode *mode_list;
+	unsigned int num_modes;
+	int ret;
+
+	ret = get_mode_table(os05b10, fse->code, &mode_list, &num_modes);
+	if (ret)
+		return ret;
+
+	if (fse->index >= num_modes)
 		return -EINVAL;
 
-	fse->min_width = supported_modes_10bit[fse->index].width;
+	fse->min_width = mode_list[fse->index].width;
 	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes_10bit[fse->index].height;
+	fse->min_height = mode_list[fse->index].height;
 	fse->max_height = fse->min_height;
 
 	return 0;
@@ -750,13 +831,18 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	struct os05b10 *os05b10 = to_os05b10(sd);
 	const struct os05b10_reg_list *reg_list;
 	const struct v4l2_mbus_framefmt *fmt;
+	const struct os05b10_mode *mode_list;
 	const struct os05b10_mode *mode;
+	unsigned int num_modes;
 	int ret;
 
 	fmt = v4l2_subdev_state_get_format(state, 0);
-	mode = v4l2_find_nearest_size(supported_modes_10bit,
-				      ARRAY_SIZE(supported_modes_10bit), width,
-				      height, fmt->width, fmt->height);
+	ret = get_mode_table(os05b10, fmt->code, &mode_list, &num_modes);
+	if (ret)
+		return ret;
+
+	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
+				      fmt->width, fmt->height);
 
 	ret = pm_runtime_resume_and_get(os05b10->dev);
 	if (ret < 0)
@@ -770,6 +856,14 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	ret = cci_write(os05b10->cci, OS05B10_REG_MIPI_SC_CTRL_1,
+			(mode->bpp == 12) ? OS05B10_12BIT_MODE :
+			OS05B10_10BIT_MODE, NULL);
+	if (ret) {
+		dev_err(os05b10->dev, "failed to write pixel bit registers\n");
+		goto err_rpm_put;
+	}
+
 	/* Write sensor mode registers */
 	reg_list = &mode->reg_list;
 	ret = cci_multi_reg_write(os05b10->cci, reg_list->regs,
@@ -832,7 +926,7 @@ static int os05b10_init_state(struct v4l2_subdev *sd,
 	format = v4l2_subdev_state_get_format(state, 0);
 
 	mode = &supported_modes_10bit[0];
-	format->code = os05b10_get_format_code(os05b10);
+	format->code = os05b10_get_format_code(os05b10, os05b10_mbus_codes[0]);
 
 	/* Update image pad formate */
 	format->width = mode->width;
-- 
2.34.1

