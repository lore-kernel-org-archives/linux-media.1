Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.137
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244502;
	b=iEDLfNWBXtafPmYwt1prJElIFY4FByxeVVFTSjQHXwsgLzevhV3FXeGXY6nty87i8tw4
	 q6s3IGi8x+Aeuw1v2HjLf63gNEo1jFFyZ7Ezu4Tmg1oqoHoHqG61HrAHyvEfSyGgmHrk2
	 GzeaSCwmuclDWv8xgEf5QE7wcZ4aGRUNAE9Fc84wKqHA6eIxedvv7Hj0rUkX80zydY0S/
	 sqDyDVvW3qkByomk2viLsBQvDq2oR22kNYm+2Tjfdem89V5+70L0wid4GVrlHBgXoyBW/
	 xFfEqk7Z9evfkD4KbQ8NDyDM0Mub7XLpVmOEQdcMJwa+o/2gV+VOI4pTcVvyOt6CHEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244502;
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
	bh=EFa9H0DOJfAGUAuUI/NEV1TFJF/b8DmJzU/Ou2CZuNA=;
	b=2zzKIqlwgRGVKisgFqH89T3u+QTO/H0dCbPQXsclkmRvA9W2ER9F+RsPkDS/0i676TZg
	 r2u+5+fLCm+PfOIoniTdDbgxdUimMDMoDonDqU1KLzx8KkCylaF1MjEHDNEOC82C3jpDN
	 +JdXG8ngFS5bfntD3UWmrsH8Fdv8JXf/y5FgkkdfghGaJzO1Tmwd6Rzd407Sa5wHpEIWW
	 4Y+TXM6F2oRZFFSZrzKo1wSY/PJmvOjVEVh6R9RgBvy54VfvOrDTYRN7RcCB2VGiV9O03
	 9t8C3iQr95cF3MfjIh+06CKvR5CyOlTbxLEEJx76uqEvIlj0WpMUON6B3Va4NDu7t2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.137
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021137.outbound.protection.outlook.com [40.107.51.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4962D606A334;
	Sat, 21 Nov 2026 07:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4962D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EfAeIqz99OVgtKLuaU0utKd3/83MNbUv8c8i3zNKsUhsW5mvfObwnbu648Woc1Zs5Cn6bdAiNjXo8DDd9A30+Oh2FCJ4fGyyZsJ9qVzcM77gBiNcnPu7ER3tbV86VSbIcav6V6uyFi2cjb2MMTAOIOaIli7SzibR3tjuw6namyeV/4JLmqmpU/CtXgFpZnNyL8HVX/3OWODvmcKYje0CSh0oCxgJh7X/BYmLs+OwXldfFTzy9LodySJgQdw8InPlXEaTVRFdZcstGiXlEChIToBZ7kMgvtCKqm4ow6T89HE6iq2c/XTFOselRWQywrmQvm3c4GVZ/mHNhSj8QxM0Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFa9H0DOJfAGUAuUI/NEV1TFJF/b8DmJzU/Ou2CZuNA=;
 b=g8GDCJPaXSSWpK/G6dq6WeX3g7yV8q1GIjOBc1EYBye5eUytk0vXrP3oh7D5z0cd1E8JhQ13LjyoktEj2hCV2dO8SFXC0cFlZQ9sqYuxsyRGu2u2VQ8aFrYOc8cjfQEuDMqffN1MXypLTNe5j80P7uQys+MXlvoE003wFIszFC0xjem75yEL0FJwI89Acn13WvR5WVo7ulXlUg+4r/feNBrH24sVIRJO0fE0u8fxe/789ducQNYYv3+7UBR7xRG2kKm82UMYSnTeuRgBe56ubXYRPwfqXFHcWe5SeQD5FQyy48PD9Ci+7Alx+LgkVAaeBKQev4rxTXrtebGJjANb0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1768.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:01:37 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:01:37 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 05/15] media: i2c: os05b10: add register definitions and use them in init table
Date: Sat, 21 Nov 2026 12:30:55 +0530
Message-Id: <20261121070107.1768-6-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 88ae7c19-ed3b-4438-7733-08df479d4907
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|38350700014|10067099003|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261028144727099003|261026140227099003|261102123227099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
 9FDmF/QWsdjQXf/z6bMRz4byy/ReofxUytG3xMUfvxurjnPEjkNARoB5XWzpznWedM8O69fmOv+5dGPvr9nEwycXfLZRmyHoOWh20O8MzhcEz0mt+CBudwwdSax92oAfDihlKghK8cONwaqKd8meiI1zySgJineYG+ljuxtt9qTtt68jy9UXfRrq+2+qSo6zUUght5l8V0cp0cyda+4RHMyYOvLIOBnD+nBqZINPJRgQxMw+oK0/SQn3JTYWg6fu5/etWTo/+xVivaR6gCeSPMaWyYZN23udEIbIhc+NF8A1eXitfRjGS8FPYrA9L23YeYwlnrsOeRXI6MS1HIxN82Y//qhQ6KqHWXmxeCg4ibCmlg2i5QeeuMGAaN7e82w7scMa4T6kk/9i8An8/fGYriYl9cAcduBsGjD9dhNXyyT7J3jazT7sRDhdqxT3QtQHDCvspeuBzKjwELd1nrS55vjKPtuc63C4AjLCJcpLTepuUxanqL9tdr5aceIOg7DhVwsCV5YTLFhC4RmZZysKHofkDEOazMhWM7dtNRWpnOXQOocLnDFZeGzIqu1PTcVgLkdTwNjP6l2LIyg7aGXTf3nZxwV8o1kVAxFgUWxGPPSJ+VzUXSLsdUVAxck/Gn/ayT8M4bhhj5rzPsHu+CVuecxfj1ePZtFQhDIZ/p4p2exOjwhswp1UzkNnui3XinIgWWN8HnwrsJinmtcQHCVf+eS3Iq74JC57lBlLgdLkL1A=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(38350700014)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?CIg3LLLOt8jKb/c2v4VGPevdYosZEp/5NKy7bwEsc1hbuNen6yn9KS5EO8if?=
 =?us-ascii?Q?Wut8TZ7IuD4CA/552i+4KzWyyTiexs8yXtyfJYzD8MrfrgZaDYLDDiH+HShR?=
 =?us-ascii?Q?ZzM6peXzjhbw17b/iOCJehHK6AMUSvAo0cFrpdFrTqi7aCa+njNnkt7yc2k6?=
 =?us-ascii?Q?uAlLpuLBjmhf+W9y2FN+LsL3JXKbN07eZ0ZA0b7lkBxInSydpFCrJhB7RK3W?=
 =?us-ascii?Q?GhvKWJzRU/6SXAGweiU5Xjbv1BdyDpSTbNkSUGo7JkkLV0lwLCmW1Hz+rnyU?=
 =?us-ascii?Q?LAiBgacc0N9xCmrWbQuGJnPTlozegz4KV1mgjfrEYqj8Cup0ChQ1ol8nvz/9?=
 =?us-ascii?Q?3ZjZZeY0qGNVWEwwr5PvybhLN7iELpxL2V8+HoOZAvLaWINN+5raeaqePIQW?=
 =?us-ascii?Q?iRF3Mii8zYydt/n+m9oND2uwXQK0MSr5SceC+bUTDgM8TFqKhBomoPCwGkmx?=
 =?us-ascii?Q?g9u84f4yXZei1pQom8FQC98wwO8jJTjZ3lnSETiWE2IAcKwrMCXRmfeuv0rR?=
 =?us-ascii?Q?pjmZjAT5fT9xgTEA1wdBFQR7m9pGcFryMSP4Wwv5klZU6sf0E1GqeARAYcc9?=
 =?us-ascii?Q?Bj5h9QR3vnXHd+qHexEvYWoCM5HSdq8gTAiT0NumtMnafPJKdTDE49OZ04DZ?=
 =?us-ascii?Q?VQdIoAdZMZSc9ot3N12wcpKoCzT8h/ynErOQ5EvRpX8CFGml5PRyssqKyCPx?=
 =?us-ascii?Q?mteZWR9/1u+4PzV1850RzkC0VVSGBy6JvMd5kJITD9SYRf0+V1jt7IAu0xPk?=
 =?us-ascii?Q?fqg6yJw1gLZWL4dtORfxlcSJg4xnJJuA3aaJWyMJNCg6yBsBSHBn/BGEivQL?=
 =?us-ascii?Q?AL92dxjlTo4z/fiolEW1bPS1kISfgryCgPD3y/G9jiwXZ88Hn8tDztMJKv+O?=
 =?us-ascii?Q?7Jmung+443QMFPhMGylkQXwAJxddMWpYHbpfOSMrRJzUOp/IILN6jcuNnt+U?=
 =?us-ascii?Q?OMfjz4fCYXx+IIWNtUoCUJ0Cf+s8I34ADfo843VPY/t54CEMLTSPo88ytqMx?=
 =?us-ascii?Q?qRkcPC5ysRPul1fWa68GMyBSvLXqCkpk72u1jQol+/adGkdozPIL99ntz7q2?=
 =?us-ascii?Q?wifpkJld8dLxTck0+yRA7FEWGbgAIb3WQ40uuNed9TP1gqRe2fcH2SBPuenG?=
 =?us-ascii?Q?YBpthQnobl/YVwzOox8Irx/ls1nfLvwlJi9MCZ4RVVrR8T6pbLS4+Fj/Ey9U?=
 =?us-ascii?Q?ScY8hirQto+ThffpbiqOwkuQCcg3l29ADNFhnsx48R/7nq5BB7EM9T6gO3TY?=
 =?us-ascii?Q?OmqQhS/NHhfeOSLDY6jCqfQs9jXh4I+KJdLrFxI7O+twwEgLit+FqICIELlt?=
 =?us-ascii?Q?87TNSXsftWudh4BcIMTinB9jgZdh7RPIGoIcRxaOIG70S/1lBlDk9dveliCb?=
 =?us-ascii?Q?Oqt0qG2HqkkncCYrlwbNCVX3uPK4S6IzKU/LE6qIwrHh4eQD2g/BEUop7cEG?=
 =?us-ascii?Q?wqHeaZNAiOvsC4y6z3eYKFq7+zWkVve8eQa4jsR559/FFsZpzFnatTAGIC9a?=
 =?us-ascii?Q?CBgvzW1KqXi/CvZ+xQ38aeKoG33S06RqCcOALOV49wzAaev7fnc1E/RUpIC5?=
 =?us-ascii?Q?qVahHv2lCy2LccJjc25wOHiBNaeBLDIwECrvN++qHs6+0xfpLhOkRJGiV6Hn?=
 =?us-ascii?Q?bMIAaDb6UCyjjlUowm8feMjzj4jQcwkiLIttZ+DyycFeumGi2D71msEq5CG5?=
 =?us-ascii?Q?hnME8bu6//96IyotgGBLNK3wM9alDhAhFOcBfzIUWvithQxuSsRwIrfmEXCQ?=
 =?us-ascii?Q?1XG5DvQCLYoa5kgeFXx4ABCjQlxoTTw=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ae7c19-ed3b-4438-7733-08df479d4907
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:01:37.2110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyI/3TuYQAngExdKoO7myHFXV85P1Pd9mC+otlYizSQFWLiMYecWxDsjh3lkxPm9LAKoSO3+L+FhA7yoZRvS+bEPKaHuiY4c7lcDI+j1WmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1768

Define named register macros for OS05B10 and replace raw register
addresses in the common initialization array with the new definitions.
This improves readability and maintainability without changing
functionality.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 108 ++++++++++++++++++++++--------------
 1 file changed, 67 insertions(+), 41 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 7f6cb4c7edc8..3f478bad1fbc 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -38,6 +38,16 @@
 #define OS05B10_MODE_STANDBY		0x00
 #define OS05B10_MODE_STREAMING		0x01
 
+#define OS05B10_REG_PLL_CTRL(n)		CCI_REG8(0x0300 + (n))
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
@@ -47,13 +57,43 @@
 #define OS05B10_ANALOG_GAIN_MIN		0x80
 #define OS05B10_ANALOG_GAIN_MAX		0x7C0
 #define OS05B10_ANALOG_GAIN_STEP	1
-#define OS05B10_ANALOG_GAIN_DEFAULT	0x80
+#define OS05B10_ANALOG_GAIN_DEFAULT	OS05B10_ANALOG_GAIN_MIN
+
+#define OS05B10_REG_DIGITAL_GAIN	CCI_REG16(0x350a)
+#define OS05B10_DIGITAL_GAIN_MIN	0x400
+#define OS05B10_DIGITAL_GAIN_MAX	0x3fff
+#define OS05B10_DIGITAL_GAIN_STEP	1
+#define OS05B10_DIGITAL_GAIN_DEFAULT	OS05B10_DIGITAL_GAIN_MIN
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
@@ -77,30 +117,25 @@ static const char * const os05b10_supply_name[] = {
 };
 
 static const struct cci_reg_sequence os05b10_common_regs[] = {
-	{ CCI_REG8(0x0301), 0x44 },
-	{ CCI_REG8(0x0303), 0x02 },
-	{ CCI_REG8(0x0305), 0x32 },
-	{ CCI_REG8(0x0306), 0x00 },
-	{ CCI_REG8(0x0325), 0x3b },
+	{ OS05B10_REG_PLL_CTRL(0x01), 0x44 },
+	{ OS05B10_REG_PLL_CTRL(0x03), 0x02 },
+	{ OS05B10_REG_PLL_CTRL(0x05), 0x32 },
+	{ OS05B10_REG_PLL_CTRL(0x06), 0x00 },
+	{ OS05B10_REG_PLL_CTRL(0x25), 0x3b },
 	{ CCI_REG8(0x3002), 0x21 },
-	{ CCI_REG8(0x3016), 0x72 },
+	{ OS05B10_REG_MIPI_SC_CTRL, OS05B10_4_LANE_MODE },
 	{ CCI_REG8(0x301e), 0xb4 },
 	{ CCI_REG8(0x301f), 0xd0 },
 	{ CCI_REG8(0x3021), 0x03 },
-	{ CCI_REG8(0x3022), 0x01 },
+	{ OS05B10_REG_MIPI_SC_CTRL_1, OS05B10_10BIT_MODE },
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
+	{ OS05B10_REG_DIGITAL_GAIN, OS05B10_DIGITAL_GAIN_DEFAULT },
+	{ OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },
+	{ OS05B10_REG_DIGITAL_GAIN_SHORT, 0x0400 },
+	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
 	{ CCI_REG8(0x3600), 0x4d },
 	{ CCI_REG8(0x3601), 0x08 },
 	{ CCI_REG8(0x3610), 0x87 },
@@ -274,34 +309,25 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
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

