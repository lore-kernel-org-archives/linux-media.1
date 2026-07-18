Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021099.outbound.protection.outlook.com [40.107.57.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F31736CDF2;
	Sat, 18 Jul 2026 20:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405420; cv=fail; b=mbag9grtPQFeVtd7HlR1sGfQDehGSndbTwAcFZEjyPLZ3cGsz0wqCB4rvNl0rBddu2CvPpoUCoJ9dgaqvhp/KBmkORqhBS0CHJPUHM8VGJgQl/hqekiVKjijy0zNWddblEiBU2wmIOlHa8TfM2HhAAIHJK5qILsA2tlng+FsWHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405420; c=relaxed/simple;
	bh=++Ic+8fkjRV/UWeRKwi1zgwyvxWphN9giOcvkpXNIks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VAhPd5ka0dB9AIAhi6XYvMKykYLNlqepYteHLskUD3ZrJV7ahoNdLkeVkz1NXatzWvCyur0X6/MeHxOF1y/ZPhGC/XPQZMqabiH6ECm1zsNq3qXBZoSsux5RGQUMnwOic8SeIGgmw8zuAtgc+dRAo27+vogQUvKqWks0oNouTms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=V4weB8kn reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="V4weB8kn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRMY5YTve2VJlWjNtySeJgPpyduqyRZv8ew0ckNM2srJjKyhduqua0JCTB+ixUFhzz1bTN7bGLOEnZqGMWm91AtI8MSz8fW6y2z/tlSDgxRlkfWI0eTogw4sWrllAcxjN3gn53YSY2gpuhRMJeHj/PuW1OGGWitl/pyabUOjL6/Ayp9PW7Ha21dwH6CeUviW60JILgGOYa9yXQr4OZt1EA/86Aeu2FJY18G2eZayNHBlL8GT+KV87HzW7m0bnfiXoM0zrAGcVf/gHtuahuJUGn1jZsx9We8aqwUtsQO7cG0gHoadb+aKUJq/8jtPH07Ai0ibzFI7CogdiEBZeVuMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnmkqzwVgtmBm3+EMyIcRbkONMsAF6bi/iibxyMEqd0=;
 b=sLM3uLieyQhkxlvMqd4BKfJn/60Go/nQw4gt7pjYtJs1GezOCFKFRVBtPQ0zdLytUkDm5AE7eGb19qSNBHZnsGAHv6A2i186YGM+iGclsv5F5IOO2l69NQMqdcfbfFz57/4R8ItOVqcGZZNCthfFsKxSjsJX69Pj5mhf+j4lqXARXQm9TEUvbtJzYDzS+bOgireC5LWOuVVgTXsEW7G0oYA9fHFjJv7rCnBspLk4KrmJ2xPesPvnESXoZ44C+wBgUIx421mxU+d9PFvAfNqAhuIZNywPBO9au1C3r3q7xOcgZhlf/pDFCgOpAJ3DNskyUacDbZhESbDUwAz0y4Blgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnmkqzwVgtmBm3+EMyIcRbkONMsAF6bi/iibxyMEqd0=;
 b=V4weB8knOXL2HEQVFiJOfDakMSU8T1CduxJrBMX2WJIcxpfCqfY6LLWsnDqCZ72GgJjejYCL75lczcSaiReee8A4h3TUpHfzi/nLX5jEIO9EDlyzlF5b2Wum4m3QLXqmaG96tS678vhcQtBbflMXrzoF7uwPizaJCGsPOZNyCAkB5SVufvd4oFa3N6/l+FdsBRL932uObOxXPEBF4HqjqE2NVh42lXLI/Geuq1WwmocGtv91qWRSmrHOAGOGgSwOs/fyAUlldJUoAWrMxhVMxv27tbWsMbI1dfnuDhcfBgQ+5sq+kvXiIp7HpWFfH0cfKCggWzDv380V17ZoNg2qaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1343.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Sat, 18 Jul
 2026 20:10:16 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:10:16 +0000
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
Subject: [PATCH v3 05/17] media: i2c: os05b10: add V4L2 digital gain control
Date: Sun, 19 Jul 2026 01:38:56 +0530
Message-Id: <20260718200912.16001-6-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 5121c606-8f89-4ba8-fd61-08dee508953c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|52116014|22082099003|18002099003|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	kUps6FnCW2/yteeAanx+P7MBa6jcx6ClEzReAped8ZAwQTbUgnMK0NesUt7JU+A/T/K2ZvAOZkWhCVpCwVOwkhWXWNUjOlOegW3N8VbeK87/PS/Ih1rlFYQRNcM884OCKmcvO1QaSkrY+hfZ8eF1LjYIkpnrmMhw4yXNJK7o6uLBPypBp67PSaZt2hba8YA0F8kJqVsds0m+sSQnHE7rBdVlnD+L3O5WS/GYbEQ1UMsJcpX0OWFttk4jj3CTzkFkEreZX//jr2JgbPdqCV5pDwSxoAOLZMKrFx3s5G/bKFjZaaazbVlfrFA05tFARQQZCONQ8VOjbcG61ca7teIHM487kBc3bGuQe+eNpDfE/mVEox1UpXYC3xzXJVICU2xh2uennJSrnjhWX0LctarZ6Me9I5xI0+hARoxdda/8axRyg9CM8iKaEbOUZcW7W2F5Ms/uj7tZ20vuYk+eMkE3rIrRXkJ8n4bjgGCmOSCEGPR0Axe1ie8GxR9Dkq8x7SSpTWSvCjRmEh6aoUYfzzXcv8xYf5wFmpT4Vln3Ii35sOeH5/wFW1zwkBNDsrJzD42G0lAPDkPuKlJrl53N9QukAL5n5upbEP1Xpfk39BafHqB3AgctQhHG6G1j2fvidC3F7aJF2aF4gUW47i7XlGNVQVXgw5wYCJJkte+S6ZZNz+U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(52116014)(22082099003)(18002099003)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aPdm2GAnw2rUnB8KrOY4mvVCgAJq/fyhChW+daWL0CGi7FML1AmvTQ5LyHvT?=
 =?us-ascii?Q?vosQa1S3F+rYdgWNZAqBe09svNTvqgyu/MkE8Uc+WZ9Ni498Y2mc+Yj0cZzQ?=
 =?us-ascii?Q?g8eOM4rAjcNtWVktNNKTCcY9Unj6ZmAN+V7sSGWwz4S1VvXFxR/j7aTA0gm1?=
 =?us-ascii?Q?iS/b0YNe4y1JCTL0MeCRDF2L6gwKnptj5X+xoKowOi1aaN1JLxRe+KEYNYDB?=
 =?us-ascii?Q?EIzK7FvJvNPBe1meo4c0MEnSOPCmd4jZpgDYBhnObBz+IBGQSS7IdEV2PBG7?=
 =?us-ascii?Q?9szr52H1TJ4gFIdnl1Xam8rJc21ocAgxGQXt5KI9DXZXIf9bpbwsaBJCVNdT?=
 =?us-ascii?Q?JIZHlgGFT+mfu6g8dk2N51EG/C7ijjnT9Z3alApfhjJKW26j9MUhm2nT+Jkl?=
 =?us-ascii?Q?TqHXMlAcOOSPlFB/SWBGx4UP2yyp5L7P4UX+s4x3dk77lgVgvHaKZbrdM+Z9?=
 =?us-ascii?Q?/hp2hlETqYqZW4i7u3KCt/lZ/LWLq1tMFyyVqIQD3Ioru2kwgKN4WmyRoymX?=
 =?us-ascii?Q?q9VaEHOE3gcEiaVd2milFLdK923H6lyyc4VWLopwxcnueDDKzXkJZijVmhGz?=
 =?us-ascii?Q?/s+O9bz5UPPWKCFtDnVXjbUvp2cI655X94MN4jowDI1/sklVSZorNJB5N2dZ?=
 =?us-ascii?Q?KDAgBDfUo4Sx9CMqsgx8DreZbOaD8gIVQl0i+i5KaL2D9FYisT7tAQingBzs?=
 =?us-ascii?Q?SOnXCah8ViSBE3dzztw7Jnpqfw5X+NsUfRrSj3aHhh/T4UlSafB/u8Bu1vKX?=
 =?us-ascii?Q?z5VCpNIOj6jH3b0n8ZDWjswoK/a0n+4U1POsJvriV3ynfys3V9jkyQGq9e5z?=
 =?us-ascii?Q?/G1VSDdpgopq4bxFCrc18+rZcVk1V46ne+cELGnkzziZjf4Iii7iAIJ4jQAI?=
 =?us-ascii?Q?m5RW9hbB658PMh4hxY2eFGL/Ru7G+D0N1lHxZGwu96YGnAUzwwuDG0TmXxPa?=
 =?us-ascii?Q?R8PTA+W3Vq925bbMjaNl3bS9K58Vm+D2JvqWfTgQ5ypyyxzon8UsBrQKwpkz?=
 =?us-ascii?Q?SvvmJZmMq1gc1/zM+VCjqqsUBYucwt3DbNE+FB5zaWzzP7k1PWmJEw/GsQhE?=
 =?us-ascii?Q?DxzpR16p/6CnHEBV5kfTU08D80NrVtyvdm7KS6nGKJTGjuDuW4m3zMjBGiJQ?=
 =?us-ascii?Q?/gyIMGrxKdSAl8D1N/GxzZERuW0SiwCMp6RPNNOJ46c5AvBwQz1+FZMhcPMs?=
 =?us-ascii?Q?ytI74Am6pmaWwsyV12XTRR+dMY8x/xfePfeISXrid6WYKStAGhQkhR7nVEQS?=
 =?us-ascii?Q?IbZx/nhmJ3Ra072Yv75jAG/vuj5FBZ8+/14sxc5oJ0h4wgH/55aURembVOjE?=
 =?us-ascii?Q?KKKlf5cDHDiuVBnObQmD/YmvE5vM+Ugh6pPQQkrrd7NoYyWMgACvriSazt/S?=
 =?us-ascii?Q?Z0xQTiud+oM5a2Au4vE1lKT1plyLfHIXBz0el01X+OH8LASaczLLq9SVyM78?=
 =?us-ascii?Q?fOXe3RrYveNbcWn7weOK8mfgXeiMtf6zCMVVyb3P53MQ4gKX/jf3iJlZEVa6?=
 =?us-ascii?Q?SKUvZPOOIna4FR5wRhjG3gv5AegFbX/vqA28bWObKr1khYVgVrbAX51SQozV?=
 =?us-ascii?Q?fLaCqYsCQFklfMeCWxJ851sybbLrQL86R65EYbQQmUjtLOZ4ZSC4hdeKkM72?=
 =?us-ascii?Q?FHQf6LzEFvMIGMkKKN/FBGl/FZWY36Af9oO+m8gcYIkPKiMkoAB5NTcSNp5V?=
 =?us-ascii?Q?H8HnY3cElq7/gLGNon3FeFO5OjCKul7lRb+wtuZXYPoryw7ic27pJlN/fCRg?=
 =?us-ascii?Q?wN2sdehYV4RX4lIBl1MaCOUrC1+PiK3+O9CuhHCE1UDSIoGUmqUHGv0OkQJr?=
X-MS-Exchange-AntiSpam-MessageData-1: /yBjB2YWms6VgD/GaVE8nofuvwnxB5KRiyY=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 5121c606-8f89-4ba8-fd61-08dee508953c
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:10:16.1489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ACoKInEAlx/07etCa6CGxCaoTi4csNCykTQ4UzGp04vmH97PfpNxXDYbIdpmg/3ydM135m3HqZYAri/53vg2JqQIcyI2tUnt736JChDKv70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1343

Stop programming digital gain in the common register sequence and expose it as
a V4L2_CID_DIGITAL_GAIN control. Initialize the new control and handle writes
in the ctrl callback.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/os05b10.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 12c4e2610d6f..abf3d2970900 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -138,7 +138,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3503), 0x88 },
 	{ OS05B10_REG_DIGITAL_GAIN, 0x0400 },
 	{ OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },
-	{ OS05B10_REG_DIGITAL_GAIN_SHORT, OS05B10_DIGITAL_GAIN_DEFAULT },
 	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
 	{ CCI_REG8(0x3600), 0x4d },
 	{ CCI_REG8(0x3601), 0x08 },
@@ -549,6 +548,10 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_GAIN,
 				ctrl->val, NULL);
 		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		ret = cci_write(os05b10->cci, OS05B10_REG_DIGITAL_GAIN,
+				ctrl->val, NULL);
+		break;
 	case V4L2_CID_EXPOSURE:
 		ret = cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
 				ctrl->val, NULL);
@@ -925,7 +928,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	int ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -967,6 +970,10 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 					  OS05B10_ANALOG_GAIN_STEP,
 					  OS05B10_ANALOG_GAIN_DEFAULT);
 
+	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+			  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
+			  OS05B10_DIGITAL_GAIN_STEP, OS05B10_DIGITAL_GAIN_DEFAULT);
+
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
 		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
-- 
2.34.1

