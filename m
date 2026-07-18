Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020077.outbound.protection.outlook.com [52.101.225.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2C837187B;
	Sat, 18 Jul 2026 20:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405437; cv=fail; b=UuRpZ0iI6ilgZstWEbnbGgVpWLfd4kF+97k6pJzxfqme5AfbO5sK5Cvzxy63AKHC21zQMB44eLCbFo/vmfypbAqOfRwZo/lqZQFwmLfUEKeKVcwlOt9vQIsZwBg/spSgySWO+N6adwm1HkBnSZMjcIxvPLY88this8L4yrOQmeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405437; c=relaxed/simple;
	bh=BeT+w++g0TdOMGjfC3PvGXJCHpFvCHD1DFZwMOq653s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PpDBWK6IDfD1JHcUPQfPCI6yqvXTYVJj1fHfgd/muw1kMKagc/RZOVUE610Hz4rM7KWPyFPVTOK/49K2+0vIo4B8W1Tc3ByQIqNTClMBCab9D8BMTL5GG0yooHwcCIdm0MyxkLpOmP4R2Ox+Ym+5Vnay8UA6J7xWXBxJnZ7NDAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=JtCg8cma reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="JtCg8cma"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgDK85g/gsW/ONpo/MB1xWn7pbNP89Oz1gg5NTN0DtwWZs2/4dCs/d+9+GoKbJB2B7ceU47qHf1h6G9h3zIcGUQ17VPXxoyZYlbmcHd+jEHHhJpxOC2J/pUYDPDAamQfiwf4Gqj2XP5GPPzDxN9hm8HCa9NTOpkirj40nouIOTTIKi0qqarI4liFD8rq0hruIaAUhAiy5FEingz3xbODAoHs1d8PwplGGb2PKSqAcvXNvdeYg53mRxQkyv781eBSJQaj1+xHMCEmhGcKq+7h1nB+wuFa/z9U9IAjw9EJEd7b4H1eVwyAHIJQVeAroaZw1hQ2Ha0zFWCAtxy/yIbE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7+XU4whYSK6BWYbgj1egk5+CMNLCeL+A7N9fx7q15k=;
 b=aAlne8fd6rGuiwtFJm2GooWsWBbhG8t+cYlAVT8KNsSRRC2Yzdm7x4GYSY2kujORaFQ77kdfHbhMbJzhCPo7Uja4U5PEdZG7Al1pdHyldTNkXvEEW7j9CAEBAzaGwlKpdzBSPMP2F9ASOdzaHi2Sh/+H7SCQXq5+PTlvqNgw2GdgmMdjGX1ZqsKZXTWWU34L7a9BQf2ce/DJGdJa+pmhHMKWyfnaFpqEUhTlQbl+GE1P7LTrFoi5Tm5iZOZQeqtsvAW/aFY6+7FxBnKfPJ5RSuMLItRHTsgeo/KMMHKbmMUBcIudg1aTgx8/cbzPmKU3j37Xx1Rojnctlw4mS+MFRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7+XU4whYSK6BWYbgj1egk5+CMNLCeL+A7N9fx7q15k=;
 b=JtCg8cmanfxC7897Z7AaQ62enUvcjNoQTQ9gfmtGGmfxfRbQlzTjKlf6q+Y4MmdngSCoBv8RdvbYmMHNsUIBnhdSNzfaM42+BLMz9SKeUbFewjPI/9g8dvBlbPaOitnMnG0Fk5us8RkwJJ7+d/MOtCnPnkogLz8FPnNYiLnyHqRtwW3Y2UyIXmfdo5XdjJlUlVh8PYtkP7KXUidphsjK/srv6QkPstx2OlT8HOcN/IO1dSpluES9F6x71voIPUycKU39jrvKYnEmPaVIchanhubmtDG9+ZqhUdCqW1L2anoEZQ6XwPRxQL6KlAfYiEWda0dWWsQbS8GHHWea3/GV3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1343.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Sat, 18 Jul
 2026 20:10:32 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:10:32 +0000
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
Subject: [PATCH v3 07/17] media: i2c: os05b10: Add test pattern options
Date: Sun, 19 Jul 2026 01:38:58 +0530
Message-Id: <20260718200912.16001-8-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 2ba41bd7-9817-4bff-8d72-08dee5089ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|52116014|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	IelIQSreS5Y0JFCscT1ExV7xBhlCw1uPlx4A1WqAPXYaHH1Hi1gAYCYNDTboMoxO/MZcBo7F5VB6Dw2tpGx55UgGE6O0VR0++0NDJB1p5kbVzXzRHaPniB94bZ5jafsfrT7gTvkTQZ3qBWEZrsR3nF+cgC9ErXQwOQ12SYwhGhLKy3AxZ8/1ngYyNJbQ4Dbw71Q2XEENkDtQaZvihQXesIi3Xy+W0xLip1JBOibYDQRXpT9QNnjQehNzk9/3dtLngaDIMx/pltTqWG83/EbC7m++PGZRo1S4bH6n5zKhnEQKyRqHAABAEUk1mMAwMdU1HIzMFwKSGKOzm7PGt05JXeR55viASgojJLJaLgbMeqtkWDI1M2AP+XbaGZQLSlD6ti0+h9qgKY7zYXpCGHS7RPBUYcETzdQ8K3bJQuHcAdoayqhziEwYc09EyynI+LcVWCdxCnm1VQWuDSK7cb0YqSUAMt2EszAvvAN/59pKJaNcxZh/BX8IEoREvQ+2rT1X7a14pPLWcELmxg+iEfF3/oAExLxTqKzoBvpAaHyUKqa/U6VOa6ll2CKtNs+Jeq5xfVE+c3Ei0QFM3sSsDww9STVT64G7kGj9dFZN1m5+1ecDf1rT54hmhgItpNFUWlvhiwi0AZUKRsaQUzkFeqIO9LF7SY1B1DD2DqvxpqpB20E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(52116014)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NG0gsOCQXQR7uDx33TvETklUcjmpnwC2ehbmcaYU9SKwNRlv1ZjTVbroY06i?=
 =?us-ascii?Q?xKEtTp5wyUwSrYs+yInR3pudWHW8ehPjKjnrp4sQFRT0NJ7CFc1aJ4HTBrby?=
 =?us-ascii?Q?9T1EVxxjy+Ej2hoArid8zdJnib/Vn9mUmpmH8OqxZEeHejoE7qtfgoCATscI?=
 =?us-ascii?Q?0llH7ZqcPxPb5Ye8T5ZCxrxs+IAmN9zRJS/DYDdPKjyiTzQEF/mpv9n5EPmv?=
 =?us-ascii?Q?9jx9A680OKLAXwRVIlK9+M1g07D2fAuunSwtpAGj2HywZdDyG6E49+502Y5L?=
 =?us-ascii?Q?3YnDZPbXmRN9SwVIarXImNw8E2LEKB0oczz2b5Dc138i/++VKQJjPmbq0HQY?=
 =?us-ascii?Q?5Kts1clCMLx+IsSeNosRkLm6ZLbga5op+ilrOXYHh35rQVV8Xtz8yfoTk2zg?=
 =?us-ascii?Q?2UUaDSW2bU7ETEjEfGITg8defhg2dvuzQESo8LOFxbczMonmCjO4DPPJ6NkH?=
 =?us-ascii?Q?94X9lrstg2l0DUcTaThQbLBk2Fy5+nMRaiJ76wwznxYy8u6s6yQNB4N5p9O0?=
 =?us-ascii?Q?sH+VXTLfzgBeLgfPgJW0n7o2WV/XQJ3prCwH5xcJPh09BYg77VSIW/dj+/sd?=
 =?us-ascii?Q?iZLQhIoes4KgW21kdGU+8R+MhcOoXOdkj1gRWDNsfdwa3wuXRw4KlBPhduif?=
 =?us-ascii?Q?SLTLF7wX+Re567va2GKB/3+1fNIbV9diePZ414zis9V0tx5VP8FFGzJeQRMX?=
 =?us-ascii?Q?egIxmnDa5xnfXJWxVXhAg/HhYox3KFe2c3EYn/u7Epge0cASztCECqK7wZTH?=
 =?us-ascii?Q?9+/Vj2j+jBEIrQUHH4umW+LFYn1QJiDC+EbscuTKju8othWZY5vWJVtO3F0j?=
 =?us-ascii?Q?SbtEkFeJEn+FPZioU5SXbMUNzd57uX2PQ+c5n77fiYvIz3pB3zVryQYkdmtH?=
 =?us-ascii?Q?cajg7UWhSKaWr5VCakVGIeqzzXj8m8t2nXKpaS6mYRSCQQc3JOkfCRa5WSZt?=
 =?us-ascii?Q?NdW6C8fYeTxCa8CS76WmunzxZykMVchkOWwsDs9kIr6fajxhGgizVnH1RPMP?=
 =?us-ascii?Q?u4dvDNJS+Opt9jiP7+cvKN7tvdndlzLiFMRcUnFYzr/ujYdEJ+08UjXZ9u+W?=
 =?us-ascii?Q?YVUs4Cik8XYeooBfwo4Rj5f69XexG1wLGl7mth/R/A5oZ0IOPcDKLqfQSaid?=
 =?us-ascii?Q?4W9JsBU1frHVked5x3VCcMm+sQKGf9B+IrvCpaAfwW/VoqP03VB3a24olPmP?=
 =?us-ascii?Q?PbCbwKT31poYhQs1dxZBeIWm3kk3haFFrywZTYf+orVsoIqz5NmSxunEjv+2?=
 =?us-ascii?Q?Iz8zmq8ll2Ws2K7Vo+Irkwj2oGipixStBN+p4H/Ffd1fOmtaqSHXG8ZJaVtz?=
 =?us-ascii?Q?OhhcPYYlK6pQi9BikuZvuhrRa5PDIa6RYNqx4BmW8pTpYPtEaYyZ3dURwOeo?=
 =?us-ascii?Q?vh7oC4weTIhl5osY1BjT4L0L98pM+FojzQzDZYVdIAfTkWqKwoOI7Cs3GAiu?=
 =?us-ascii?Q?7MoHk31jftcWxR8wE5fvMq5xBY/mIFahZCVuZKMY3jQoMypqnfXQUF48ZmCO?=
 =?us-ascii?Q?9uv4dzGsoCS92dLIdhvOQ+ukQfRAMnxXAMBxCTa5134ixgbW1CaunWEbLIRi?=
 =?us-ascii?Q?KRlUMm2mosJ1ttEdLq6leK+uCKXRnahGWO98Wcyv+zBSn4aGHp9YYECsjXJJ?=
 =?us-ascii?Q?xzNllbGr4AK6gxrFkLg8d0X0GoasPWNhQ81Os36IVFsyWdojjSAjgn7jTb0f?=
 =?us-ascii?Q?iBfCS4mFb9zGNgvKrceZrgOqIiWofOIiZX1Z4bVfF9/4eoI1/ErI2CYrikYZ?=
 =?us-ascii?Q?fS2hCRtzzH3UumxP2RI/pZ2j1t0cchJ/izeQ5qB3IWCQ/NQAgVQuhGt1MtzF?=
X-MS-Exchange-AntiSpam-MessageData-1: NVLXxbpWLffYdn5SD1s2njTENnCJWlHC4hs=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba41bd7-9817-4bff-8d72-08dee5089ea2
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:10:32.0104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIRQak6hRsBWnbV8f5PIMxwZVsfBbJefOzIq1K8YkkJWe2xgdRE159IpjbueHK5n2esXLvAiNL600r+AW+SFa21QjbmF84/D+WTHgNcBfqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1343

Add V4L2_CID_TEST_PATTERN support with multiple sensor test-pattern modes
and program them via register 0x5080. Drop the fixed 0x5080 setting from
the common register sequence so the pattern is selected only through the
control.

Removing the default write of 0x04 to register 0x5080 does not change the
sensor's default behaviour. The value 0x04 leaves the test pattern enable
bit (bit 7) cleared, so the sensor remains in normal streaming mode. It
only programs the color bar style field, which is ignored unless a test
pattern is enabled.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 55 +++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 61c51844a91e..4e177eacc815 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -102,6 +102,17 @@
 
 #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
 
+#define OS05B10_REG_PRE_ISP_20_0       CCI_REG8(0x5080)
+#define OS05B10_DISABLED               0x00
+#define OS05B10_COLOR_BAR_1            0x80
+#define OS05B10_COLOR_BAR_2            0x84
+#define OS05B10_COLOR_BAR_3            0x88
+#define OS05B10_COLOR_BAR_4            0x8c
+#define OS05B10_COLOR_SQUARE           0x82
+#define OS05B10_BW_SQUARE              0x92
+#define OS05B10_TRANSPARENT_EFFECT     0xa0
+#define OS05B10_ROLLING_BAR_EFFECT     0xc0
+
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
@@ -395,7 +406,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x5004), 0x00 },
 	{ CCI_REG8(0x5005), 0x0e },
 	{ CCI_REG8(0x5036), 0x00 },
-	{ CCI_REG8(0x5080), 0x04 },
 	{ CCI_REG8(0x5082), 0x00 },
 	{ CCI_REG8(0x5180), 0x00 },
 	{ CCI_REG8(0x5181), 0x10 },
@@ -513,6 +523,30 @@ static const u32 os05b10_mbus_codes[] = {
 	MEDIA_BUS_FMT_SBGGR10_1X10,
 };
 
+static const char * const os05b10_test_pattern_menu[] = {
+	"Disabled",
+	"Colour bar type 1",
+	"Colour bar type 2",
+	"Colour bar type 3",
+	"Colour bar type 4",
+	"Colour square",
+	"Black-white square",
+	"Transparent effect",
+	"Rolling bar effect",
+};
+
+static const int os05b10_tp_val[] = {
+	OS05B10_DISABLED,
+	OS05B10_COLOR_BAR_1,
+	OS05B10_COLOR_BAR_2,
+	OS05B10_COLOR_BAR_3,
+	OS05B10_COLOR_BAR_4,
+	OS05B10_COLOR_SQUARE,
+	OS05B10_BW_SQUARE,
+	OS05B10_TRANSPARENT_EFFECT,
+	OS05B10_ROLLING_BAR_EFFECT,
+};
+
 static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 {
 	return container_of_const(sd, struct os05b10, sd);
@@ -528,6 +562,15 @@ static u32 os05b10_get_format_code(struct os05b10 *os05b10)
 	return codes[os05b10->vflip->val][os05b10->hflip->val];
 }
 
+static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
+{
+       if (pattern >= ARRAY_SIZE(os05b10_test_pattern_menu))
+               return -EINVAL;
+
+       return cci_write(os05b10->cci, OS05B10_REG_PRE_ISP_20_0,
+                        os05b10_tp_val[pattern], NULL);
+}
+
 static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
@@ -585,6 +628,9 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 				 OS05B10_FLIP_ENABLE : OS05B10_FLIP_DISABLE,
 				 NULL);
 		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = os05b10_update_test_pattern(os05b10, ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -966,7 +1012,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	int ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -1022,6 +1068,11 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	if (os05b10->vflip)
 		os05b10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &os05b10_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(os05b10_test_pattern_menu) - 1,
+				     0, 0, os05b10_test_pattern_menu);
+
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
 		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
-- 
2.34.1

