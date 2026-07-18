Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020141.outbound.protection.outlook.com [52.101.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC1836F429;
	Sat, 18 Jul 2026 20:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405430; cv=fail; b=XnZ+3NV6oSFeBU4+aNVpdAPNo05YBGMwngCyJCdwrejbCPk6D2+yEyA+O1bJ8eXDBUEhKdHsaIT0dhJ+BMgWNNkpNlOu0HoL37W8n/yWaIfQMUiSGox2Zzy5Hb30r6iIsY5aE/hKESkEvMzbO5md1a03wcQc8rjXW8v/hGojmuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405430; c=relaxed/simple;
	bh=Z1jBAuLYs/OR8rlHSGDT4x7omaMB7ydihKK+5UkJuJU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JqnxP3U6POFrorXo1i6azyUTHasFDBZvVGwdaq7E8rNJHwrbGJsNch9jFqv/9z/OKARGysoWAJof+JUAoJkmNblFjAuVUWWsVdxfJkAOQqMdW/Y/8h0CDAdUB0V9qptegupnH8ii7gvChwvzlJI77d3EUcCCN4YIMtfT6uEzK4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=lc0td0lV reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="lc0td0lV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEEEOChVlpv/L8kXWvcn4MAYj0+e6Qjp26yjynoGlitNhwAw8ghib6khCqiobbdDhmcfBjajbfNeRyavwcXx1Qj1EWfQl0TKaP8TD24cFW4BxG8ekdBU5kDl5RnChd8tyH58a3zttHNm9EzaSwfosNC/IzQ9Jbq8Zsj/wVtwyUUCuK+/IqWofd44N61X4mYhkD5aHcqNTUJ31JMCD9UnJnjstkFYaprd8pxaF4ZPx/J2aBRMbqdrf0M7FRwD6FE4Sk9W2UDIvLCNz3q46pn3G4ITC+FPHE3sP1F9RdcGM5dTCzgj8NgqRL4SCRXR+DtWyqt4HXJ//03JoNBfhwMrOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utkcQEoix0OQGFKZxY0TVQPRz0lmn6kOp5F7s7Rqcqc=;
 b=OME3Rl3zYrobWY+nUgGNeFekqaOlbV/vfNe2L8nOMIob87Twz0SFyw3/nGSEmxFV1DdVxIYy3wWlfu3KxRIekTOr2S375tfd7VO088a6SX5MIq32SkBpN4IHBlZCiPWBDLTG0fKNg7JsD6fOD4puh7TZ07HiHh4jj3pXq2N4Z+yoWGoyDyIqFFLBkQH4SysfmC//5Hjqm1/cpXbWTA7N0Clkdp5UAHpc9bPE9NdinoN2BufLxsqkXjVqT8zkZB0wiXMX8KxsxNzlWNiZKNQSve06Hzxmo1QRAb1fSXhcKtZ04qVGtC6hwSjSTXWS/g6/yBPaKIyi0MWoTCuuvoH24Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utkcQEoix0OQGFKZxY0TVQPRz0lmn6kOp5F7s7Rqcqc=;
 b=lc0td0lV3laa/nLMB5HC2vt5I/8X31wdchbIzjwavWoLLPovY65P/e2zpqR6VJ8jsV4Fc4LvoVKODiYaXu9DxfISp3sTyDUN8HjEQY/4AwltEPJkGNLpl6ITdKetXYJMTZlbZuGX5vz7460YbpX+/3OpGTC2J3jSeMxDhiYEWf8YnGra89NYcyqAy/zdUEt/iJHNENWbzdBkAv/mCLdp9BeaNUvcemvsRxYHOiRCxzuZiG7kD8xiknXseIBA0Bar+DMXbFCjeQO/LplWeQa8WJjcydZ/v8PCKPOqitEuKiKJ/5nEMg5+jn3RTBN1nKPtLlL/w+LaDWqa8Si2rqAkYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0774.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:131::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.14; Sat, 18 Jul
 2026 20:10:24 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:10:24 +0000
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
Subject: [PATCH v3 06/17] media: i2c: os05b10: Add H/V flip support
Date: Sun, 19 Jul 2026 01:38:57 +0530
Message-Id: <20260718200912.16001-7-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: c50157de-b497-47e4-97dd-08dee50899ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|10070799003|1800799024|376014|23010399003|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	S/dSVZU0m2Z/gmf9e8BqLPBie5BaBRNsqRBDODd/K+EuxAxL8qv+d1S0xN5KWqz5NlWY5lq77vww/I80vG2XbLSRnpvmS4eFmF/Z4BixiU39oUPRfPfBz9a0b/zWezsXuOtlCiHPmnxVVF/Zs04VuTOs246HTdzUmOEFHMB93bZcbyQ2C8+4jODO4Qn8KRYXnU9v9TVPf9bELWPJ0WxkwnCgZO+mx+XnDrDOuYAnzqFoTmJgMC6Fe0U8C4gUQ8XO+0izYICKuCPcTTlSe72qizVNquIg4/vk38n96kDEYQdI0bmyqjNBXFagBJMJ6TcJIx+BKZkSrYqrB3hA3dFONVkRo4vTLM00YvP5uej2PA7rpYUqowzJMASYl7fZszICBZ7GVrF3LzWJrEyNM8eGHDpHD8eEK96BN/kWBEeuflbOSAe0kQi2Miet4SAvPa1x3xplmgV+hJpMlcofyXHTE4dSKbgektiedeZOq1WOjr6TdOdb5gKMhEAvk4ubvHO1i/C9osLCF9+KigWzu3bbXZ8dkrcp1kSP4ECsleQjCCd7XX76684N81vBb1BoS8oFNeQwXDUUwTLST21sal+YYf7nONfRvuNsW97oGLFyn6zKRA4NBNDdAnqqjPm+JLax/0KOGXUX3T4e9T+G6FjnBPHhmf2mPV6ud73BsOn66mw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(10070799003)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UlK+kS4+62ZV2ng3Tuh0bSAY6rDbc7kxnJRxRASJTH3M3xYW6+Di0lXj9X0s?=
 =?us-ascii?Q?PG3/SDTP7noMTuvOg0WgYUyqK4eacddrt1SBp3WHIysrI6pHxLhax68gp1n7?=
 =?us-ascii?Q?L0dMpm8D7adJRky+lWtKW1U+OAf4FAvRKRnQmEoQLMfx8HqRc5tGdhGHFZ+j?=
 =?us-ascii?Q?CI7YZ83QFt81sC5pMgkCq7rbnevOMxJEmJ6gjbsipHSAkA7kkchcVat1FzB3?=
 =?us-ascii?Q?W+eM6yv2H3Sxn5lWR7yhxBDqV4S+I6NMbqoSGth5M07NVTRaUB/R8IR948Ew?=
 =?us-ascii?Q?L7b/ijspq8Ti2YWc3SNq0ev0mWGPIrL3tjc9R9ZwPeYeUg4xetUw3ufvVWaj?=
 =?us-ascii?Q?Wdlsxc46PBOh/iU3CYGbtbsEquLYEY5KWC135jFa0D5vNFlIDe+R0T109lUw?=
 =?us-ascii?Q?1HbfkvDh0o1cSVESqL8rSNFSn9RJ/4evbaVKRBK/RyRp9/RPCR6yhhB2M0Dq?=
 =?us-ascii?Q?hYLJT9HwVGcfJWfrLlc9rkzUEOKFaBpo3GstFDjMy4/Jc3X8xpWSl1Ah0VcB?=
 =?us-ascii?Q?xeTwuel5Tp5hwKJ/0xJ7hjXqEx2Y1evPCsRS99H+GaneWCO+pvBS6zqlvRgf?=
 =?us-ascii?Q?i2jeYN/OsSJc3XQXuMx0YWJmUI6+4EGBKkGTQzrQRmCMWDweSeACgJnPyoXo?=
 =?us-ascii?Q?juOb43xZBvDrK+N/xMbxj2pOy7hCmGWTPbMFDQ1KU4AvBnsRO3F7+Db81vmD?=
 =?us-ascii?Q?etmPEFjlVUZzPfnYg6TxRDY0oXdA8EUYTSUqJ138Uw0tg6+2si1s6sPFVlVy?=
 =?us-ascii?Q?t7LxMFYUzAsWAfXkHP5aTcxP+gdgWHfrnxEeAQPXg7fvkJsoXI1sz7rKZilq?=
 =?us-ascii?Q?4BFZDxfmWLr9EFPMaxQUPnkeM4GPl21N2bOkat5uyWnNiKY+NR11nw4ATJJp?=
 =?us-ascii?Q?u/sqq96TeOSdELKPfp2ZQGoHmm/83EhElS7VKdEwAsxYwpZpzT+dm6CNMM4e?=
 =?us-ascii?Q?NC0zMYUbMB/SRfMiM0r3ftmn1hCevQdtKJveTb2EkI1GCHFMFNZ/T+ZYmS8z?=
 =?us-ascii?Q?8K8QX9MpHCaj0cExL+y1AiyH29Rq94Tw/LeYJ3kvZzep4ATtYRUq0AcPkP1F?=
 =?us-ascii?Q?xIhcvNl4DPC6SLLxt07IHXO4RQFq8B5bcThv9Ixp0mLohl9bYjqaG2r74coe?=
 =?us-ascii?Q?b0FlM1qOXzwqSWNwzFBUg9z0vEZa5ZS3BnF5TP/EB1sOfwbXIHECShVsbNGq?=
 =?us-ascii?Q?bLuG9FIFYVRd8b++PzVZHZQ9ll0Xkb6HCvtIrBlEtBtkjU4u3rytbbI6A/bD?=
 =?us-ascii?Q?j716g/16+JSXV5YH3D3VZyxgh+ZzszLECqgiD2DoIgmViPrihJHBJcDRmOUj?=
 =?us-ascii?Q?h7IH9uO8FxCUfkNZpwU9NQd61lonI3ZFH5wEel3vQfnlTplvhHtdwzDB216O?=
 =?us-ascii?Q?n0NBNbtmZtusX+nPQUxsFdRQegfI64zETdWW3Z6eHvaPjsHyAbPb4B505zSM?=
 =?us-ascii?Q?GH441x5wKiCQtQgVZoIfNXFp0GihOwFdarslFK7k1kGFQGotB9cFBVZlryqb?=
 =?us-ascii?Q?QpoZKXHExhyf8ZC7BQJj9lyw9vTmV4kjLUsH3sBlkfgedbNyHN2dQaxcspd8?=
 =?us-ascii?Q?rQBBVXDB/4c3fY1FNcN3y8jNH2/okx2ucDuSWfhqlm188rh3/vSvGqw5RziE?=
 =?us-ascii?Q?iZym76n2zWSV8q7+l4Rq2ofJm0fqJ84N2qLT934PRbX1uIqR5J7txARlcRCw?=
 =?us-ascii?Q?e6arb25OknssUulba/m0pIKk/zxDLV9XQ9b0djbVMiJkBXHvuxtxtuq/sac3?=
 =?us-ascii?Q?Jn24DKiE+GtjWGjf+ps4ph4+SeZ3+wORvL5BSyEZN5YrQnN8BV/sO4r5Npx2?=
X-MS-Exchange-AntiSpam-MessageData-1: NqtTWWnvB9sHQIzb7kLpDr5Uahe+MZi3d5M=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c50157de-b497-47e4-97dd-08dee50899ff
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:10:24.1330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkHibRJeWwCxgPLgCECWC7SPwhwPI+1npDtzzBAATcNCGJzGQoW/6D2Nep6efEFDmqIudYzNyM6y3ik4qTJEQycOrEA+z7zwli/XG+8TRwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0774

Add HFLIP and VFLIP controls, lock them while streaming,
and update the reported Bayer format based on the flip state.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 56 ++++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index abf3d2970900..61c51844a91e 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -96,6 +96,10 @@
 #define OS05B10_MIRROR			BIT(3)
 #define OS05B10_FLIP			GENMASK(5, 4)
 
+#define OS05B10_REG_ANALOG_FLIP         CCI_REG8(0x3716)
+#define OS05B10_FLIP_ENABLE             0x04
+#define OS05B10_FLIP_DISABLE            0x24
+
 #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
 
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
@@ -231,7 +235,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x370f), 0x1c },
 	{ CCI_REG8(0x3710), 0x00 },
 	{ CCI_REG8(0x3713), 0x00 },
-	{ CCI_REG8(0x3716), 0x24 },
 	{ CCI_REG8(0x371a), 0x1e },
 	{ CCI_REG8(0x3724), 0x09 },
 	{ CCI_REG8(0x3725), 0xb2 },
@@ -465,6 +468,8 @@ struct os05b10 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *gain;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *hflip;
 
 	u32 link_freq_index;
 	u32 data_lanes;
@@ -513,6 +518,16 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 	return container_of_const(sd, struct os05b10, sd);
 };
 
+static u32 os05b10_get_format_code(struct os05b10 *os05b10)
+{
+	static const u32 codes[2][2] = {
+		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
+		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
+	};
+
+	return codes[os05b10->vflip->val][os05b10->hflip->val];
+}
+
 static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
@@ -556,6 +571,20 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
 				ctrl->val, NULL);
 		break;
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+		ret = cci_update_bits(os05b10->cci, OS05B10_REG_FORMAT1,
+				      OS05B10_MIRROR | OS05B10_FLIP,
+				      (!os05b10->hflip->val ?
+				       OS05B10_MIRROR : 0) |
+				      (os05b10->vflip->val ?
+				       OS05B10_FLIP : 0), NULL);
+
+		ret |= cci_write(os05b10->cci, OS05B10_REG_ANALOG_FLIP,
+				 (os05b10->vflip->val == 1) ?
+				 OS05B10_FLIP_ENABLE : OS05B10_FLIP_DISABLE,
+				 NULL);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -570,10 +599,12 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
+	struct os05b10 *os05b10 = to_os05b10(sd);
+
 	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
 		return -EINVAL;
 
-	code->code = os05b10_mbus_codes[code->index];
+	code->code = os05b10_get_format_code(os05b10);
 
 	return 0;
 }
@@ -712,6 +743,9 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto err_rpm_put;
 
+	__v4l2_ctrl_grab(os05b10->vflip, true);
+	__v4l2_ctrl_grab(os05b10->hflip, true);
+
 	return 0;
 
 err_rpm_put:
@@ -732,6 +766,9 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(os05b10->dev, "failed to set stream off\n");
 
+	__v4l2_ctrl_grab(os05b10->vflip, false);
+	__v4l2_ctrl_grab(os05b10->hflip, false);
+
 	pm_runtime_put(os05b10->dev);
 
 	return 0;
@@ -740,6 +777,7 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
 static int os05b10_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state)
 {
+	struct os05b10 *os05b10 = to_os05b10(sd);
 	struct v4l2_mbus_framefmt *format;
 	const struct os05b10_mode *mode;
 
@@ -747,7 +785,7 @@ static int os05b10_init_state(struct v4l2_subdev *sd,
 	format = v4l2_subdev_state_get_format(state, 0);
 
 	mode = &supported_modes_10bit[0];
-	format->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	format->code = os05b10_get_format_code(os05b10);
 
 	/* Update image pad formate */
 	format->width = mode->width;
@@ -928,7 +966,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	int ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -974,6 +1012,16 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 			  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
 			  OS05B10_DIGITAL_GAIN_STEP, OS05B10_DIGITAL_GAIN_DEFAULT);
 
+	os05b10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					   V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (os05b10->hflip)
+		os05b10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	os05b10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					   V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (os05b10->vflip)
+		os05b10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
 		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
-- 
2.34.1

