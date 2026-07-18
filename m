Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021079.outbound.protection.outlook.com [40.107.57.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A4B2FDC53;
	Sat, 18 Jul 2026 20:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405494; cv=fail; b=pRB360LRMHZ91aAOIByumivjg7SsoBL+iF6LPWLPCGyuYILUip/smT6PQedjbUD41tzcsBDOGbguEsPin+fphgHq+Y+KvMMYSG5VRJChgo8RCuXiNY4eL+xLybT0DmtjlI2QejhQgZ7hBXJqrEYHTCcin8zvtLnHWpJrCjX7txY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405494; c=relaxed/simple;
	bh=R6igej2sY32PZKfEW7CfKcCECo2KcHBINFR0sZQnucg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UPFptJG2RpC7/GUJkUuAbkQSAQ6SGHxWTufUNC8/LjVy5sMjHoDUt58+KlQRg0MbZyUVEp9m3dEEJUGerzFw3RoN5v0K9vtC9/L19W6fGCwlPeXavYj9Eyit6mj41droP4tV2LtiW8lFbRbxGRi8/l0XbyzmbX3FyIakVpRv9Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=VEBZ7xGB reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="VEBZ7xGB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrbxmjFcHPAJC6NLq+p05Yu+r2pdJdNMA7Zkbi+flCl6hLJVkEMCqe/PsPwa7w/U+WIgEqIOLmiho/B0rlR18QqqDTnn/ERvbNsOwQKksr5QdODFYH2rlefgt41WIqoCcdQyhh5z6TJf+XwO5+fq/Ud49W+FSlAnM6xV0/t2Y1WtaYdlJH4/jfvG4flS7Sd65Sv9J8sK/AtCszqHCVSMF8HsJM6nSdqffC2yoJGUr5hPfKFOLpP/+4SrWkOG0xTZJCKDzOjYyDucauua9dx0lT2oxR6p9ScuZbYr2UtBW06yAOjZhqs1cHpgzMbsqCNTbx4maXY1Xv+SZTZt4Knp0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8cNfUd3jTaeRtDPxa8VW9gFntfPtsUZq2aQpDVoJrs=;
 b=kMvcb7pe8zkvo0bnahPw2OVEdBY7ukny+8qRl/06IpQz8YJvBRap3kOvd9Qd6EG9oY66KoxRvR+bCEky1Xap60tIDE/7hlZUGI75jpqWFxzU7E47k4wIcGTalIk+U9NQKvk0w1cYT+5zmIbcyrZLK0MDiKwMJKeJgNn3jQboEw1M8uMtOEELKb5cjR0bHnw+GEi4b2uifUtzqYsv6atI/eVW5uY4V+76/QkYFrX09ijGrj52Qy84Jr5Dw7cIGzqCziPEW4kvrnx87a863W7R3Fp94jMBohfyUslpRwW3WCcmbr6kKzrCF7wbeEWFzqvtBXqEtX4eNL0QP65uRx6wzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8cNfUd3jTaeRtDPxa8VW9gFntfPtsUZq2aQpDVoJrs=;
 b=VEBZ7xGBedKO7H0sKxdUs74tEO/H0LLxk/CjVVpiqLuzA49ahN80Jui+ca6u0E4AjlPdogY4ZZm/CENZv7qBMWtSTqwDnI4EcQk6IioulIhvjAlaaq5IvHm3+gpeQCVa8fLMMEKYpZn58Ovbr017psOolDAlhb0VoNo7wJyGj8ffeNnmT6rRZyJ1TIE1fyjGs7BAp8If+XFTDw0n0Fd3bUBUT/V87txdxKdm9+Ma53rHzuV29aZY8nWi0Za0oZRmhQEFoMZBhACAhJSGAp4Cn620s2Ujb6olNOUjFhwD9a7+bvqIMbFGwfL9inyf87iYJyL0Ny1z24cJi3+wQ9qzjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB2078.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.14; Sat, 18 Jul
 2026 20:11:29 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:11:29 +0000
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
Subject: [PATCH v3 14/17] media: i2c: os05b10: add 2-lane support
Date: Sun, 19 Jul 2026 01:39:05 +0530
Message-Id: <20260718200912.16001-15-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB2078:EE_
X-MS-Office365-Filtering-Correlation-Id: fa11a358-329b-4a93-7020-08dee508c09b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|10070799003|56012099006|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZqP2l6CYSb0TZrpZ6/qeUn5zmj1yLG9J7v4Y54WjsxiD7OsjYqTHSZy+UEpc09ms1tKwjvgZezUHutQWzf/mheAqMVCRxsMHI8unxPGFEOFsIFbRXIYyyapDjkTktrS1hJFm81XOvgtPAfvG0wcohx2MtWeGFHZLOwxv4CZSe9u/vuVEUvmZzqLyJGGJpemdM8TLr/QHS4Dm7IwW71uExi9E3FoeioL3SN3y9/V8OW/6+NEpDjvfWuOwUGmgezc/Q122gy32G8nykRzDVxNnjC3ezvUQ/327fk3jd53sgihHjKqIzP6Y1MTg7feFml38khgw1oXBTxfClfLThaV5Vf12NJnAYyZBjM6i0pKmTCfTTS9GoO17jgQgz/5UGUl8HHFvZfy4GFr+Wa/H2HzgokL3Ymr/l9xiKX44hT6mnoEu29seMzSfN1Nxnl7/F5m5zoWgpXYL0RbnWtAALluDUVcLyzike9pfteIuV9b+v+xhUPTTXqfrJYN5lLNRyRj69oT5q8jr3U2PxDOXA766v9pYMBR+b4sJUpVLt+nQAMODNkqoi9kDJiUaS//fE7Jx22okoxa5X3iIoIzNCAc4KtZq32Cp2Z0R83kts+HaOZ+0Q8WGklOJGXTrmmlQAyB+2snQ3IdvZ7IDpT0Eb/mpiLthcBqWmp4X/bNvp47eiWY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(10070799003)(56012099006)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xDGl6yRxg8E9yBDQV13L++VCk4dA0NiL9G+IUaeR8iRwqawEvNkdijHbfBqY?=
 =?us-ascii?Q?PDbHuS57O7Mi+S4W/+zBxQwjuWVVlNn29skOv2zvLc8Q8McKU4WnSuBv4QPz?=
 =?us-ascii?Q?WcKKqEPmnB8SvHBDT/Co4rzE0ICDw3QJ11ssTCQ7xfocJ7xS+RoPEjnxZqwV?=
 =?us-ascii?Q?0wGi24dfCy53QPoxZv+VwsGHlZpsBoUSqHujth6cKRPZjzYOK93a4p8ERg1Z?=
 =?us-ascii?Q?Hs5prkGIGW7Pdcu25bF2mMFglZO4t27amvqWrnJuMXuFZSQLa7KmnxmmCTzE?=
 =?us-ascii?Q?DvlLigAQdB+I/rZoShB4mSCYjpYhuZwDw94ZrsuspapvPBMa8IPXL4ljmgbE?=
 =?us-ascii?Q?XJV0EED1JQj3dKIB8RHGxvSVdeHAtvQLclxQ74ODpP+ANYcMWvsSKJV4yfY6?=
 =?us-ascii?Q?E7NBQXJQLx0/CDutieb1OtEZtFCvFiTbb9outypB7YsLkeS/jYqmvH/VBuP4?=
 =?us-ascii?Q?I4lImo2Tdmbv8urudFqaghCTvkGk00iXIsORx5jQ7I2zEEKl/i63YcIKFgHZ?=
 =?us-ascii?Q?DFGxcIZt5tViRRKKAl3OqY41MV3grePsK6psWYgl3TLKD+Ola5alNQp2XAbt?=
 =?us-ascii?Q?y3QJZ33IjK+ZtEL7nZhfZJCY7UK9jZMivl0fFOu5a6W6CHWRdWi4npCn3M8P?=
 =?us-ascii?Q?y1F7uw7qE1euBVLbQ/4GfPFBvCGgteAZ0/tFcAKab2IzzD5h4dkZp0LrIQ/0?=
 =?us-ascii?Q?WHkNGqNGc0cnjsyK4KVGYnTOKtFsHCrIMMzO9k5Bz3pvJuB0umCiikBZkDK/?=
 =?us-ascii?Q?tUk7DOUaBZsmqApoubeP0Q3o/jirFO6CN/IBNXGcxP5bZQD4wxbnhpZpdYjs?=
 =?us-ascii?Q?VM2qEh9zL5BmfdG/qsvd3Fdz2qzee+WbNhPwFFRWg7AcvDwf+/idM5nW98Ir?=
 =?us-ascii?Q?Ra90enQotBIY6cOxdfVe6PxBDO1zILk2+aJ1V5vw52z+WJPP/IGXwk9LaNi1?=
 =?us-ascii?Q?53a2s/axErJdTCipPiRp2NP/PeW/aDA7s1ouRqEwLg1vpSwNulNiAkgImT/c?=
 =?us-ascii?Q?XhydI8cVL04PO1pSSlcXjkdXjqLBH1sVf6FdfhrxlDsa6m7NKXb6T7PVsFKa?=
 =?us-ascii?Q?wPae42B2oexGLLJfDKn0dZKw7YrnQbQMbw4vK2MBhUUsLGMAjCcr+tWNI+Uh?=
 =?us-ascii?Q?P5bJBpiQjsBWwzhKsYZFmVb0FNLziQMY5sNXrZr129IwNO5zZfUgBanfzvLy?=
 =?us-ascii?Q?0PG0v2Zcu6uy6T0cO42gS4O35tNVCfR73czgiCMLDjTG5XMC8Rv7DqQzUOx+?=
 =?us-ascii?Q?nCB/qjdqzgE9qpE4G9JGDiEBWT7wKvgdHWD9hGhwmc0AgQK5m2lD1HN4YSG6?=
 =?us-ascii?Q?aX8R5KF0F7bKv/wktro3BgWHvsa7cVc0Bi0+KfR4ZKNIo62l/ksZ/BUAHF2g?=
 =?us-ascii?Q?FrmTdr/k3MODNMZtVLCL3XII/iPtNLDr7inOloRy9WMX61LB+0jgvKq32vwk?=
 =?us-ascii?Q?PQSnLZiJoHF0/MjktaBTpLuMHZpR700yyAbwJ6s3MCL+kUhjcAAzHT2DFar3?=
 =?us-ascii?Q?XKagOe4rwecCA2VQy1q5XyCXPRBTgH1DMFRs9KucqlF72iavhHvxoYdCLvGF?=
 =?us-ascii?Q?65T9qAcsprAlS+EWKUV2cLTWSxki57nqrW8VF/IXp5uqLAvEeRltV3DMOLDq?=
 =?us-ascii?Q?Wxlc0CMGdMhmxiMDic68um22tCmsShweYxEhttK6n3w0TJagowM5/ALzoSyi?=
 =?us-ascii?Q?AGS4Nhx2ELLI24Z61xVD0ZJKVCSuN+FW+o0A78GnUQYl1kVVXpoBz15A6Amf?=
 =?us-ascii?Q?NcuIB8RFZhntpmzOYmYQZdg24ZY8jgJ47WN9+MGpYkef2G3M4Keh3RhqiW01?=
X-MS-Exchange-AntiSpam-MessageData-1: hutNh/1pdYRQzhHqpBVIyJFKwCyohPUlUwI=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: fa11a358-329b-4a93-7020-08dee508c09b
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:11:29.1390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZnlu6USnds7R5rjmEpZoGZ6CjZpMh0VbPa9wzAk+HqsJseZfm+koC1Mimi0DTap9bu+iTlYvBNI77Z0U+O10BN0q0n28vrbYbpEUjpOynk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2078

Add support for 2-lane.

Update link-frequency handling to select 750 MHz for 2-lane and 600 MHz for
4-lane, and adjust pixel rate computation accordingly. Extend endpoint
parsing to accept 2 or 4 data lanes.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 94 ++++++++++++++++++++++++++++---------
 1 file changed, 71 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 876186b22f5f..6d91a9660660 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -113,7 +113,8 @@
 #define OS05B10_TRANSPARENT_EFFECT     0xa0
 #define OS05B10_ROLLING_BAR_EFFECT     0xc0
 
-#define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
+#define OS05B10_LINK_FREQ_4LANE                (600 * HZ_PER_MHZ)
+#define OS05B10_LINK_FREQ_2LANE                (750 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
 	.top = 0,
@@ -136,13 +137,7 @@ static const char * const os05b10_supply_name[] = {
 };
 
 static const struct cci_reg_sequence os05b10_common_regs[] = {
-	{ OS05B10_REG_PLL_CTRL_01, 0x44 },
-	{ OS05B10_REG_PLL_CTRL_03, 0x02 },
-	{ OS05B10_REG_PLL_CTRL_05, 0x32 },
-	{ OS05B10_REG_PLL_CTRL_06, 0x00 },
-	{ OS05B10_REG_PLL_CTRL_25, 0x3b },
 	{ CCI_REG8(0x3002), 0x21 },
-	{ OS05B10_REG_MIPI_SC_CTRL, 0x72 },
 	{ CCI_REG8(0x301e), 0xb4 },
 	{ CCI_REG8(0x301f), 0xd0 },
 	{ CCI_REG8(0x3021), 0x03 },
@@ -532,6 +527,24 @@ static const struct cci_reg_sequence mode_1280_720_regs[] = {
 	{ CCI_REG8(0x4837), 0x0d },
 };
 
+static const struct cci_reg_sequence os05b10_2lane_regs[] = {
+	{ OS05B10_REG_PLL_CTRL_01,	0x44 },
+	{ OS05B10_REG_PLL_CTRL_03,	0x02 },
+	{ OS05B10_REG_PLL_CTRL_05,	0x64 },
+	{ OS05B10_REG_PLL_CTRL_06,	0x00 },
+	{ OS05B10_REG_PLL_CTRL_25,	0x3b },
+	{ OS05B10_REG_MIPI_SC_CTRL,	OS05B10_2_LANE_MODE },
+};
+
+static const struct cci_reg_sequence os05b10_4lane_regs[] = {
+	{ OS05B10_REG_PLL_CTRL_01,	0x44 },
+	{ OS05B10_REG_PLL_CTRL_03,	0x02 },
+	{ OS05B10_REG_PLL_CTRL_05,	0x32 },
+	{ OS05B10_REG_PLL_CTRL_06,	0x00 },
+	{ OS05B10_REG_PLL_CTRL_25,	0x3b },
+	{ OS05B10_REG_MIPI_SC_CTRL,	OS05B10_4_LANE_MODE },
+};
+
 struct os05b10 {
 	struct device *dev;
 	struct regmap *cci;
@@ -650,8 +663,12 @@ static const struct os05b10_mode supported_modes_10bit[] = {
 	},
 };
 
-static const s64 link_frequencies[] = {
-	OS05B10_LINK_FREQ_600MHZ,
+static const s64 link_frequencies_4lane[] = {
+	OS05B10_LINK_FREQ_4LANE,
+};
+
+static const s64 link_frequencies_2lane[] = {
+	OS05B10_LINK_FREQ_2LANE,
 };
 
 static const u32 os05b10_mbus_codes[] = {
@@ -838,7 +855,9 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
 			      const struct os05b10_mode *mode)
 {
-	u64 link_freq = link_frequencies[os05b10->link_freq_index];
+	u64 link_freq = (os05b10->data_lanes == 2) ?
+			link_frequencies_2lane[os05b10->link_freq_index] :
+			link_frequencies_4lane[os05b10->link_freq_index];
 	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
 
 	dev_dbg(os05b10->dev,
@@ -983,6 +1002,17 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	ret = pm_runtime_resume_and_get(os05b10->dev);
 	if (ret < 0)
 		return ret;
+	/* Set pll & mipi lane configuration */
+	if (os05b10->data_lanes == 2)
+		cci_multi_reg_write(os05b10->cci, os05b10_2lane_regs,
+				    ARRAY_SIZE(os05b10_2lane_regs), &ret);
+	else
+		cci_multi_reg_write(os05b10->cci, os05b10_4lane_regs,
+				    ARRAY_SIZE(os05b10_4lane_regs), &ret);
+	if (ret) {
+		dev_err(os05b10->dev, "failed to write pll & mipi lane registers\n");
+		goto err_rpm_put;
+	}
 
 	/* Write common registers */
 	ret = cci_multi_reg_write(os05b10->cci, os05b10_common_regs,
@@ -1195,22 +1225,39 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 	if (ret)
 		return ret;
 
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4 &&
+	    bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
 		ret = dev_err_probe(os05b10->dev, -EINVAL,
-				    "only 4 data lanes are supported\n");
+				    "4 and 2 data lanes are supported\n");
 		goto error_out;
 	}
 
 	os05b10->data_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
 
-	ret = v4l2_link_freq_to_bitmap(os05b10->dev, bus_cfg.link_frequencies,
-				       bus_cfg.nr_of_link_frequencies,
-				       link_frequencies,
-				       ARRAY_SIZE(link_frequencies),
-				       &link_freq_bitmap);
-	if (ret) {
-		dev_err(os05b10->dev, "only 600MHz frequency is available\n");
-		goto error_out;
+	if (os05b10->data_lanes == 2) {
+		ret = v4l2_link_freq_to_bitmap(os05b10->dev,
+					       bus_cfg.link_frequencies,
+					       bus_cfg.nr_of_link_frequencies,
+					       link_frequencies_2lane,
+					       ARRAY_SIZE(link_frequencies_2lane),
+					       &link_freq_bitmap);
+		if (ret) {
+			dev_err(os05b10->dev,
+				"For 2 lane 750MHz frequency is available\n");
+			goto error_out;
+		}
+	} else {
+		ret = v4l2_link_freq_to_bitmap(os05b10->dev,
+					       bus_cfg.link_frequencies,
+					       bus_cfg.nr_of_link_frequencies,
+					       link_frequencies_4lane,
+					       ARRAY_SIZE(link_frequencies_4lane),
+					       &link_freq_bitmap);
+		if (ret) {
+			dev_err(os05b10->dev,
+				"For 4 lane 600MHz frequency is available\n");
+			goto error_out;
+		}
 	}
 
 	os05b10->link_freq_index = __ffs(link_freq_bitmap);
@@ -1240,10 +1287,11 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 
 	os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
 						    V4L2_CID_LINK_FREQ,
-						    ARRAY_SIZE(link_frequencies) - 1,
+						    ARRAY_SIZE(link_frequencies_4lane) - 1,
 						    os05b10->link_freq_index,
-						    link_frequencies);
-
+						    (os05b10->data_lanes == 2) ?
+						    link_frequencies_2lane :
+						    link_frequencies_4lane);
 	if (os05b10->link_freq)
 		os05b10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-- 
2.34.1

