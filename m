Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020083.outbound.protection.outlook.com [52.101.225.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F331373BF2;
	Sat, 18 Jul 2026 20:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405444; cv=fail; b=ku6MPuLQmR6sKXOQQe7MU1/ggxcjmullJdG5srhA09NOk6qb17D5hrtyyjbShNqQxY6nGKU3FuWsE1ooDQC8cO8Lcm8Db/gQIxArzEjh6K51wreCZPDjvfCfOeo4wWCd4O5DT1IXOb9LZFBti1IIg9opJ/q221E9QVOh0D1Wfag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405444; c=relaxed/simple;
	bh=C5LaAEgXjg4/jXueYjIJuMIaWA6/Meqsmax4MeZIzOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s5oFyEpyRH5GPzUOsDDPpiuhdvxBfd0ePEAG1ntVMb5rbyxQKuCps8Fq8LTzp0WSGXJwyU24UgzZsHUwzxkwHYS7T8J3RdiqNC/96nAtwZ+8YNyEI6eZiw0FuA9ZMz0/qMBy4cpDDAFMnVyNuIpnuFzn+wb6B6FY32ALQt9kAbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=VZCtn6n7 reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="VZCtn6n7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBndydUfOtKTM/XHAkSn0v5Jv9yI+xqdiCtc3L3pOPYudZ90k3JEMwI1odd3dXmArHBAngBl0nhWP43ixZiAmBEuvJ9UnSalYN1FI91RRX+Yvm865BjSw0XUNWzMgQwn3wfYsn1VXf72YmjEv/cT6wwfL/OieHvIbgklBAYEaj6cI3W+5P9raTTgMhGn1GJvx1XJ8A0ITAvi1yU8xt/B4UWxK+BqNGeDyLomiObyAFrZjRr5lLEufe6hMFM36ZCFQV1s30aEk3FEcBT/EjjuVKJHFXwVJS4FQpdqhQUxWn4mw7L0K9X6W1xlwY/RbtQtzxhflkZ5UmzPjWtE0oAgIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rb83TLv7EiIElqVGF82Xi+8rIVwJRj1ESdhfAG37KOw=;
 b=Ua2DfiucuSNF5PC+zla1yvGJIJzPQGZO/qQCWpPzWBDjyz6mcUBjYHlKSOTr1VLCRZDQ3XLtmafoqss/G1A2pHtE/8bdNWORfo3+63D+qOg2pWvR5egtYbPeq9V4jgT0aH/sVi/ESGl+6oGNLvW0tVXphHDpvWeLuZNrn5PA18Z4krbrhNUtHwm6c/MWkqhSYOQRSz2codE2VZi7SKwBb+gwWXoCL65KVPMceU/qsN+kN0oiEHw0/bGJ+a9sRFqAotAzJiUSztwTT79/WdJoGVcBFFprZyFe9w9DYe3UUQIlvRNjwUq0h0sm6Vgy6R/v3YkgmF2P0S6/aMhRw4AOOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rb83TLv7EiIElqVGF82Xi+8rIVwJRj1ESdhfAG37KOw=;
 b=VZCtn6n7OHVGIiVNBWsK02g4XSoSTmnLCZDCwi2itGBvBYAu3QHdSYEgbMduFP3GeI147s+JJ03j1z+DEWLTxVO2IqL1BLeGQFX8iXnvyKE0nOcEz0iRcM0dCnWdQ+//7wKxXop9bCluReb0KSlhtNjuP9O5r/SGDXOJU1pdVJ2itOfIjQbDkkTGMsCvHo2HkiTFAWjf6bl3ZngbtMPaHzeFCIfEpgQPvQUqI++p3zOfLIi/0XFYAVRuxyFRS/NrFeamAE9MmuFfdme6+mgxb4oZlc9xgkQqFw15M6krmm3LNyy7z0HXaGdmGmfTqlRtgO9TgbaDBkUgqzfyxtqnIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0774.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:131::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.14; Sat, 18 Jul
 2026 20:10:40 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:10:40 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/17] media: i2c: os05b10: add 12-bit RAW mode support
Date: Sun, 19 Jul 2026 01:38:59 +0530
Message-Id: <20260718200912.16001-9-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB0774:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e7b7d3-0bb7-4869-42cd-08dee508a364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|10070799003|1800799024|376014|23010399003|18002099003|22082099003|3023799007|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	4n1N8TEjqdfya8sX/7XrcJkBPXGA5XBaaNd2kAzbu/tjUaOQyfgG+D977MTA+nW+VAt/hEluSpxChFlCgIzfouBO7wvwM0l+cZcbQMAi5OIADuNdmFlGacbX/MQkzOx0QoaKFcY2F9a7DYV94+ecerp2w3MLkT/Qfw0vlD0bFPcDWHKExo3/9n1ITL9AhP1OTNawGgEH6ITot/0jrRhe+88o/k1b4cj/iz35Sns1pT0jk2pGHzwXgM3SxE0P7mPJBvdue/6JzCPjSDCVKOJQf9U3ZgRFoHPQXq+37QMPAioepu04DBcOA4qjTl2IISKzS5R0dauBQ6wAW0DNZQyW6JYo2TNte3ptkByzuL6DOmngHmDJa3Yg+qQ2YzJZB8u8Rhqu/jv3SET99vho/cenRbmEvSDKBwoOn94J/eHTVzmFaP+xCtIraaMSiOBP7JMB9hkJze6tpXt026PtbCbsFGbiEfN4JViDERw4UKtdrlO5gvX1ZW/11VfYADtYokcEESKhejc417LNRf52qJKaOfAK2JZyLsLXJ6nK2e3a4ZRaRcIdV78LoBsFTlZvBB1ceXw1I7+ZKVRoEMJdrBnlfeQKnF4C3PTsRD46p+tDIslvoau5PyuH2F/J5zPQBpcImSNmgLGJikAMdQmyuyYhh1az/S0+XHC+t4v0rf1dhoY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(10070799003)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ggVRWyvbHBUs48K+vgCHXjrVscJYcbS9qv/+asdA4ng+G3KvpqB2LFc1eBTe?=
 =?us-ascii?Q?pMT/1mj41gddT3+15Z81SBEjZGBLrZNqnaOtHbey2YpW4wnK4uPjIDwrdI4d?=
 =?us-ascii?Q?5dAf3k/tYjtxs4z1W6EYKblAOXI8lixfJE4icbc5S+57YSJw8LGvnWe5nFiV?=
 =?us-ascii?Q?KSJIZCmtfzOPjcw5SdLviTaQt+zdsu5y/y8bQ38oHhodtCSl8rPxWL9DwiHK?=
 =?us-ascii?Q?I3PT45EJvg61r8CDNTuUqwbkG9MCOYFPgIJFov8ikIHyqXsUkXbIIVwhuMii?=
 =?us-ascii?Q?9GIQa9UmSPxG/x2b+eVgopkr1aFKsMdDBvY6rV0a2p/Viud+qahZbNQxaOkK?=
 =?us-ascii?Q?nUWSkM9gzoM7Vo8fK4Hlhvrqmoopz0OUP0dPhU/Q0Pa8GGsi8rp8qqA1VCKz?=
 =?us-ascii?Q?doZYpAPEcJrKl3KIh5fOavosJWwaNDD94eAZyKnIGLD43ss0VrNxFncdfsh+?=
 =?us-ascii?Q?uo8l3ViPpo5N/aKTVl8MRM4M52mit6F/fekq0aLCtEmCZAv9RSjMoa5QlI/Q?=
 =?us-ascii?Q?51n3/vQk3WAVGKiiCkBuVxHaauIK6q6TJInku6ONqtPkBi6ACSfnSGv9m31L?=
 =?us-ascii?Q?O44iIJKCWLGRv1KpGS0zxgjBBAUn3awrh97Q45MkzAdCTWVvK2mcC6tvspWc?=
 =?us-ascii?Q?II/7Rknc9pK8IN40DAFAH7JcXOOytQiXe6dGkiKgbxzG/V3G6tBQnMcrTzAu?=
 =?us-ascii?Q?cZOeDevwc5EkKAE2ExjqwUKkTdtqm02Wuy3nKl3PFHEU/1XV0LkQhmot9c7f?=
 =?us-ascii?Q?MkYDSBlb8BW71Tbu5CxWC+pTUN1ckMhGuSzx/M6X0R6fBKfzzF1ukvk14yTI?=
 =?us-ascii?Q?YWccaaVZtrG27sn9oKyIzw87NH8V70gqDQ4YmPfjgT24aNFVzR5XPCmA3XxQ?=
 =?us-ascii?Q?Z6i5wyKfsDLk8N5eEb62sor//CTsBv5seRX+b0jVWr4h7uRfE1qJxJw7RwLM?=
 =?us-ascii?Q?rRmdH/VDKUOYqZa8EjtpYji/8q1MjOcPS7TRvn64vZfD33mx+iOvcL/fyQ2O?=
 =?us-ascii?Q?RUfu9hRouXveYXAd9AsVEwbbFz1e5QUbCwoyqKSDMt0i+uZCNMPtS+KnD5GI?=
 =?us-ascii?Q?5cWntC4VS/GtTYd2jY3BIfyzqFFv5ATioU829rPncsYodpXDeMeI2sgOt4e3?=
 =?us-ascii?Q?sm7plRgCuafI9rRw3AisACFpmDYbEKUUdG0Bs0emXIHDOSOM4f++H2dcePZu?=
 =?us-ascii?Q?wex8vxhj1zUenlIve86nJKdTjaXq0yY7Ov6lRR0wTqlL4ThCTmQGvcwu1Ckj?=
 =?us-ascii?Q?yREF5zNfiIIsR7WY68S7Gyj3VKu+roA8hLkGG0W8t5GaylPUS87xUuEtHlea?=
 =?us-ascii?Q?KZDRuiePL4bRlmTFeibPx+vvlwr7tmtjP6pUX4KiDFAyWDuoT58UGXJFLh3B?=
 =?us-ascii?Q?ecaMgcshXkutvkt0b+zDwK3Fpv2PZbi7a/YOUviiFF0hMTvkgvHnsrxx1dWs?=
 =?us-ascii?Q?z/BWsl8FJvAII4igeFLm8dSInvSdtMa2qI/BNx0Uck9+kbUoMLpK0NuygHnE?=
 =?us-ascii?Q?pcdZKBEmTqo+0NMR7jJXXV2OehcrGeIsImkZ7FWrfKFjU0G13/xxaISd+FcU?=
 =?us-ascii?Q?cfmDR+EeBQHl0hU+VyoQd42UErHBgh42fOu1ELkallC+k6zOg9lm9OKEPB5u?=
 =?us-ascii?Q?e+KKPKqPvaaeqN7TKyzF4Vi2lV1Na3KFl6p+a2YW/NDQdyDE14vqw7Q7PxEj?=
 =?us-ascii?Q?0G/7Gjx1FgtcPErs0GQSe5kCvYnuWOcTMjzscdbZQlByhL2VfoxctpoKN79V?=
 =?us-ascii?Q?//mSE+ggt3xSDNNcc3IV6EJ8Qy3DxhB8F32DpWMDK+4N9GdsfhyHfdv3m3HG?=
X-MS-Exchange-AntiSpam-MessageData-1: PEmDB8T3uNpjOO9AJpgg0Exfuw6Xc3r8Hkc=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e7b7d3-0bb7-4869-42cd-08dee508a364
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:10:39.9799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdCtdt/WXXe+ycniz0sSMA9FWkE8qLicpqruo0ySmaRMgonm6jysJnjplJ+ZQap3hCpPdWUufFFrnjjAy86KwBbAQx1mDPU+DidfbKI+6lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0774

Expose a 12-bit Bayer output option in the OS05B10 V4L2 sub-device driver.

Add a 12-bit mode table alongside the existing 10-bit mode, extend the
enumerated mbus codes to include RAW12, and select the correct mode table
based on the requested mbus format in enum_frame_size and stream enable.

Also move OS05B10_REG_MIPI_SC_CTRL_1 programming out of the common register
list and program it at stream-on depending on the selected mode bpp (10/12).

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 112 ++++++++++++++++++++++++++++++------
 1 file changed, 96 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 4e177eacc815..e11a3c308299 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -146,7 +146,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x301e), 0xb4 },
 	{ CCI_REG8(0x301f), 0xd0 },
 	{ CCI_REG8(0x3021), 0x03 },
-	{ OS05B10_REG_MIPI_SC_CTRL_1, 0x01 },
 	{ CCI_REG8(0x3107), 0xa1 },
 	{ CCI_REG8(0x3108), 0x7d },
 	{ CCI_REG8(0x3109), 0xfc },
@@ -500,6 +499,21 @@ struct os05b10_mode {
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
@@ -521,6 +535,7 @@ static const s64 link_frequencies[] = {
 
 static const u32 os05b10_mbus_codes[] = {
 	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
 };
 
 static const char * const os05b10_test_pattern_menu[] = {
@@ -552,14 +567,20 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 	return container_of_const(sd, struct os05b10, sd);
 };
 
-static u32 os05b10_get_format_code(struct os05b10 *os05b10)
+static u32 os05b10_get_format_code(struct os05b10 *os05b10, u8 bpp)
 {
-	static const u32 codes[2][2] = {
-		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
-		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
+	static const u32 codes[2][2][2] = {
+		{	/* 10 bpp */
+			{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10 },
+			{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10 },
+		},
+		{	/* 12 bpp */
+			{ MEDIA_BUS_FMT_SBGGR12_1X12, MEDIA_BUS_FMT_SGBRG12_1X12 },
+			{ MEDIA_BUS_FMT_SGRBG12_1X12, MEDIA_BUS_FMT_SRGGB12_1X12 },
+		},
 	};
 
-	return codes[os05b10->vflip->val][os05b10->hflip->val];
+	return codes[bpp == 12][os05b10->vflip->val][os05b10->hflip->val];
 }
 
 static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
@@ -571,6 +592,34 @@ static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
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
@@ -650,8 +699,8 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
 		return -EINVAL;
 
-	code->code = os05b10_get_format_code(os05b10);
-
+	code->code = os05b10_get_format_code(os05b10,
+					     (code->index == 1) ? 12 : 10);
 	return 0;
 }
 
@@ -684,11 +733,20 @@ static int os05b10_set_pad_format(struct v4l2_subdev *sd,
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
@@ -731,12 +789,21 @@ static int os05b10_enum_frame_size(struct v4l2_subdev *sd,
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
@@ -749,13 +816,18 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
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
@@ -769,6 +841,14 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
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
@@ -831,7 +911,7 @@ static int os05b10_init_state(struct v4l2_subdev *sd,
 	format = v4l2_subdev_state_get_format(state, 0);
 
 	mode = &supported_modes_10bit[0];
-	format->code = os05b10_get_format_code(os05b10);
+	format->code = os05b10_get_format_code(os05b10, 10);
 
 	/* Update image pad formate */
 	format->width = mode->width;
-- 
2.34.1

