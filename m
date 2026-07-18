Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021104.outbound.protection.outlook.com [40.107.57.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679EF36D4E1;
	Sat, 18 Jul 2026 20:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405414; cv=fail; b=YM/CtpJZj+tsYvPJFmk21ucsx8JGw98IgXs7YCMGY94NfYTneDfr70gkRWh2M1fOp2xKx997SOXaKNyWEfZv4Zz4/89XS5BZtGWa22wyO6C1DLM7lP7dDlXd3c+GgB2344m9yL14PnQ+iraEQoSEkBUR38MRLAEqqRxvy/Qt2xM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405414; c=relaxed/simple;
	bh=CAdXsa4A7U4Zz1ydmzyBcLEnNbfoOlRFEgjN3PSgYTI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GjLmUUTxbQf+Y98NuiiOjH4YqL/b9vr/MVtrswvY9grj2Gd8oi2FXT1ZjPlbBnQ+Of0R8gKiZMUKnr0OpGRWJ61XtkO0lPO5fwwAlmqbHUUNdl+c1IvCN6ngDPHsNsGzH9jUzxBtvh1d0i8D/VzQkE95MiO3uh0cXA124BCjt5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=LSZTB9X3 reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="LSZTB9X3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuVweA7UBiTCayEZmXAustZ0BVc2OgxPxxQNZZJnqUXaSO/QdZJaDcaBp7uJcwMruyGx8jzp2cNwXjYxqUi3S5n301QyOx1ZGgK6tlGPlXVcttDN52iu93y3tYKIr+tzT36NGiBkB2fgP78U4Y09d4Dlw3HvAuDRyUyhFXetrkIjMoIW+y8NfhkboU5D6OgoD6BcNBdelnfrtMluvRPp45ZVSpssCmacD14o7c4YjWE5458DgWVT/J5AI+VITk/foSgg851//WXa9pO6Q04sP1IdjhQ7T/0RKB6d05nw/xJyDJr4PG3NRmxZUkIfWK7j1+oJQ6elvbVbhN91z+OEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GO7Ex4g2ZXaBhFTFxAcuBIN/P2fGIB7Z1VRRsjLbJc=;
 b=xm4/7nxqauwNU/m86cLrIlyN6n0Eew7SylfAe4X6BCWEIr41/uCqXfrOJHPmHaRXNZKGpWwtvY4E7KqdA1F3GMEZizYr2etxjR7qECnfyVNLBmFaI16s/WzUTP9D8jSSK6MnigYH4+dyb/6dyfXFlc8ldsVOmK4GWqFkGNhexTPBS6MxnGU/tN4MQRMOYRK8hBGXbiyaHBxMwjnBmDEtoF8nW5ujWKb6BI8Xhe01vx5D3VLt1FKdsx1lCbOxb3ejSkQhsYy6sbVJ6MQMZ4NL2jQHFKLCIrG2qyduBjGZqpOW2fFrPG2HpEuH75M1EGI3raQ87karwR7k7Q5urqUoJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GO7Ex4g2ZXaBhFTFxAcuBIN/P2fGIB7Z1VRRsjLbJc=;
 b=LSZTB9X39L9fddTBCGxTbk7OwLwLI4LPgYYGCwSN+0m+/cYgVv8dplSSygy7u0PO9ft13txoSlKhvcYH+emnQibNKLWoxt0Xh/u0RaJi/z3qqmXY08yhbz7r02PA4/UrB+2y9owo0A1VAFdxxL0MUAbTmdIIyj+y3zied0ALrdRfAe0MgZ+tWMcuSWc1gkB/imRsp95iYUjWuD6WXP3avbs4m7t0GD+EkCcMgPEooXPI6VUAViiiTZkGMBphm17nhm9WzgQNIeda0Zob9wo2SUeUADTRJKv7N0XKw9sj7Gh5p8pxry4jFNLbHNjUkWmJ2TQqOEfXsbn3OpOERH4Sow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1343.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Sat, 18 Jul
 2026 20:10:08 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:10:08 +0000
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
Subject: [PATCH v3 04/17] media: i2c: os05b10: split common and mode-specific init registers
Date: Sun, 19 Jul 2026 01:38:55 +0530
Message-Id: <20260718200912.16001-5-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: d5b825a0-5ddc-441f-5e58-08dee50890d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|52116014|22082099003|18002099003|3023799007|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	jPhcD6qVzom/zf3iRS0flDG4BllXbstgSmEj4V9CTW+rksgcZaupKWF71HVrDxcbEyuDPtNagVp6nQtWQJfPtQ2fZFf3cxkJHy+pPhmBGWE19d+7Dcb1q1loG7nYkv9r+b0WRUylkFXCx1iTHH6pmL9SOG6NmB65IHt+44Bo0YtX1DffAk1O9KI83bH8eaDYR2YudjdFIdX1Fq2ReSrlE0GfryopBk4/CG2vzV053c5maerHVdu+Xo6Qf85uPW+pmSImal2xx+8hGsTYUKzudVEoybbcvyRRO19eABwp/PYFrGjdwRPZCBn86AZL7dk5ynTuaPlVlTmSqYdFnd1Uq9FNu2PqZxx2XlPnl0JpqZzH3l9VoC+BWe0Cep0akCuaBKnKs+hWA0GZ8PE8OFf5kC2iwdR70GjvGOmVUKVp2VjlvQUx7n3lSEkFzUSxC3Q7T8rR/sI20uBDa6tU9E1CgF7YZ4f24tu/YlcqBNC0Wv0BMWYvwyed2tsQwmeJ6Btv4vwjRCxQSqLaMrq+K5CuSZ9OPOAzjezACdMQsjcdmqyAY38RR6jMh8Nw5VYX9TxIUn/zWOWe4482qjpDDjQ3w2nM1iVq+/IcYzRr7x2PTyVf9ZqFsMP6sKMHMPdPXRpcSlxl2hAw0N1tUdxJn5zYOPwyHzlsmcCZ0RYtB5CtYy4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(52116014)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p6IBsoR4X0lH6w0uTssimHHiFzE8w5iZVA7bP2gm4hH1bozzzftq1Xq1PwmE?=
 =?us-ascii?Q?O+cJMMmzLagn5n/ji7jLPx37heWkl1kNLMb0qZeun52LDOrDFJ67zQ09E3H6?=
 =?us-ascii?Q?PnYKexTeAeux7i8ynuMZ/Kgfd7fiJ/pb1Hne1K/tpiJ5l9pUJ0a+2rMSLb0c?=
 =?us-ascii?Q?BYY0EOIKe7tD3pj//PfNKjegTYA0ER0s+qUUEE+Lh0WYF222pfSYd3LMjeWU?=
 =?us-ascii?Q?KGg0FhE4OPNZVpGElj2BVn4RywDkxQhPqo3eaYnKODhULUqlkJWI/3ZKFIuJ?=
 =?us-ascii?Q?C701HZ8B/RqZ/W5IobSTXUWJK++GdxHrbWfxoEySrvKgda7a8LoNiMBhc6E+?=
 =?us-ascii?Q?RuHvXEH/REVSVpCqt98uHffPv29Y34HTyF46MyLR5DPH6vEYO7w18yxO32rB?=
 =?us-ascii?Q?JYb/NwFb8MOSKynPIwVbb1GoSBghWAw9xTgkrE5qxyWjQNe5kH4/QU6EnAmD?=
 =?us-ascii?Q?D9jWAJ0TSsYcqTtXn6iXk+s/0SeXn2OOxF+uSewgJ3ySIlD7JN+Eji3ZeOuf?=
 =?us-ascii?Q?Dyx6xcxLHQ8GxkA4vikpECpdAqm3y+o5QgCjQ00nkZxcXqWniZGu1eT1TB9x?=
 =?us-ascii?Q?jnBfUF3t0uRm/qqmsTnuVlRpMWzszxGCyjsOdvEev7C3j5BFhqC6cC/71iSA?=
 =?us-ascii?Q?SAnJJPNnv+EqUsd3KBFtiaaqS8kfsoQvZgOetIgYs+FXdUBGh2HRYpv7t6RE?=
 =?us-ascii?Q?5aJTx3cs6Vp7pEdt6cPpSRRS+NEC5CgfeWyJKqSSzmLlDWDPTFUHS6raPOuC?=
 =?us-ascii?Q?YFzesLijAL2mZ+pKxY3NSqHQxKf+RryeRotzft7if2QAT3Bg3t4l742SvP/C?=
 =?us-ascii?Q?76xLGC7PfqUBewjPZEy2ebPtQUaCrHtSOFLQLqVyUEFrMLl9SujkVCDI0V0P?=
 =?us-ascii?Q?bsCvPdr50O5jWiFCClgu0QjdkaHDufNb225yGGUjLPpt3IhGGXHqlblHnZjp?=
 =?us-ascii?Q?8dRZtcRSxHaW4TBKIbubPvo3H74DRrKk8cie0Hyfx/p14t/cee6bdt8fTxpq?=
 =?us-ascii?Q?mbMK54SB9bZoD2nTDJ8p65d8ZgXDz+FFeg6dh+0vK8PhC9x+1jDk1q2Vfdu6?=
 =?us-ascii?Q?FQwhuYbUMjbuNJPBZ9XfRf+KMQxE1s8qzWNh4n2OR8lLupOQEBOUbX27vvnp?=
 =?us-ascii?Q?rwK9dHIRnB54m38drhBcLkZFqhERb+5N2GDVGz5t42kQUt/KXvEsnwLXc+Gg?=
 =?us-ascii?Q?eISWdvAzauWlJvz8Guvu/nLEY6g6Drp1LU0IK3/H85pE9IZ6WcsD9LEhb9NJ?=
 =?us-ascii?Q?y24RUy1UQXf487Q2Ji/F7D6AtqAPa4DbQqe1ybI54zvmKbGFxJ53334A7un1?=
 =?us-ascii?Q?/N8ETV2CiUlkzwBUmiH4k7ZyP9S9w0WJWMqFiJKp86OmlvF4otxAljRx/Em1?=
 =?us-ascii?Q?qZCkQekRKcfkPy3QRDpgI4MgODClAqx8F0kdXaSJ60A6mMlxYTVSWpjJo6eV?=
 =?us-ascii?Q?+vjf+Ul4wqi9M9uAEy53doJqu5UglE/ix64YGnR0QvnK6qVF4KnMcw5j6eMc?=
 =?us-ascii?Q?Qa9SEW0I1BvAZglOdl/LYL8k6wwVtxcTCzKmX+IXmbiUBINYRMx/pxoK47kW?=
 =?us-ascii?Q?2332li30f5YGenvM6tVE1bJQKXjO6gft0Q7Gyc4KkkhDcqKvswiBtQNRSG11?=
 =?us-ascii?Q?lqrXD44hYeLTgxAwTnzzeB1dk1PQEFtCzV97fUc/8mlcv2Yfg2VAodByVUEW?=
 =?us-ascii?Q?v1omO2Lhhz7NeEaRvjCgFD4LFZhwQChIdTgnrnhB4GoeV2E16GquDTBLcnk0?=
 =?us-ascii?Q?WKucGSUsLcimJHWZvxgY2pfr71+YuY1rM8kdULGPfQjFxlVmyko/f7Ohs/qa?=
X-MS-Exchange-AntiSpam-MessageData-1: D5a+LnsCWZrm2dKUia1qWmKlNfvtNVl2xXE=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b825a0-5ddc-441f-5e58-08dee50890d5
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:10:08.8210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7UdgVriTn9uSfy0zw9FntsXqxUgauSzIqQc5lT4I+mxSSiMrPib/x4Sbu4dge7ssquux0PIFMmV6hqafnlX+i3D6XfJlxPI8n8FRPME9DE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1343

Separate common initialization registers from mode-specific settings.
Move resolution-dependent registers into a per-mode register list and
program them during stream enable.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 96 ++++++++++++++++++++++++-------------
 1 file changed, 63 insertions(+), 33 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 96395cd7a2ca..12c4e2610d6f 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -142,16 +142,13 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
 	{ CCI_REG8(0x3600), 0x4d },
 	{ CCI_REG8(0x3601), 0x08 },
-	{ CCI_REG8(0x3610), 0x87 },
 	{ CCI_REG8(0x3611), 0x24 },
 	{ CCI_REG8(0x3614), 0x4c },
-	{ CCI_REG8(0x3620), 0x0c },
 	{ CCI_REG8(0x3632), 0x80 },
 	{ CCI_REG8(0x3633), 0x00 },
 	{ CCI_REG8(0x3636), 0xcc },
 	{ CCI_REG8(0x3637), 0x27 },
 	{ CCI_REG8(0x3660), 0x00 },
-	{ CCI_REG8(0x3662), 0x10 },
 	{ CCI_REG8(0x3665), 0x00 },
 	{ CCI_REG8(0x3666), 0x00 },
 	{ CCI_REG8(0x366a), 0x14 },
@@ -235,7 +232,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x370f), 0x1c },
 	{ CCI_REG8(0x3710), 0x00 },
 	{ CCI_REG8(0x3713), 0x00 },
-	{ CCI_REG8(0x3714), 0x24 },
 	{ CCI_REG8(0x3716), 0x24 },
 	{ CCI_REG8(0x371a), 0x1e },
 	{ CCI_REG8(0x3724), 0x09 },
@@ -244,7 +240,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3730), 0xe1 },
 	{ CCI_REG8(0x3735), 0x80 },
 	{ CCI_REG8(0x3739), 0x10 },
-	{ CCI_REG8(0x373f), 0xb0 },
 	{ CCI_REG8(0x3740), 0x28 },
 	{ CCI_REG8(0x3741), 0x21 },
 	{ CCI_REG8(0x3742), 0x21 },
@@ -290,8 +285,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37ac), 0xa0 },
 	{ CCI_REG8(0x37be), 0x0a },
 	{ CCI_REG8(0x37bb), 0x02 },
-	{ CCI_REG8(0x37bf), 0x05 },
-	{ CCI_REG8(0x37c2), 0x04 },
 	{ CCI_REG8(0x37c4), 0x11 },
 	{ CCI_REG8(0x37c5), 0x80 },
 	{ CCI_REG8(0x37c6), 0x14 },
@@ -300,7 +293,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37cd), 0x17 },
 	{ CCI_REG8(0x37ce), 0x01 },
 	{ CCI_REG8(0x37d8), 0x02 },
-	{ CCI_REG8(0x37d9), 0x08 },
 	{ CCI_REG8(0x37dc), 0x01 },
 	{ CCI_REG8(0x37e0), 0x0c },
 	{ CCI_REG8(0x37e1), 0x20 },
@@ -313,25 +305,10 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37f5), 0x00 },
 	{ CCI_REG8(0x37f6), 0x00 },
 	{ CCI_REG8(0x37f7), 0x00 },
-	{ OS05B10_REG_X_ADDR_START, 0x0130 },
-	{ OS05B10_REG_Y_ADDR_START, 0x0000 },
-	{ OS05B10_REG_X_ADDR_END, 0x0b5f },
-	{ OS05B10_REG_Y_ADDR_END, 0x07a7 },
-	{ OS05B10_REG_X_OUTPUT_SIZE, 0x0a20 },
-	{ OS05B10_REG_Y_OUTPUT_SIZE, 0x0798 },
-	{ OS05B10_REG_HTS, 0x06d0 },
-	{ OS05B10_REG_ISP_X_WIN, 0x0008 },
-	{ OS05B10_REG_ISP_Y_WIN, 0x0008 },
-	{ OS05B10_REG_X_INC_ODD, 0x01 },
-	{ OS05B10_REG_X_INC_EVEN, 0x01 },
-	{ OS05B10_REG_Y_INC_ODD, 0x01 },
-	{ OS05B10_REG_Y_INC_EVEN, 0x01 },
 	{ CCI_REG8(0x3818), 0x00 },
 	{ CCI_REG8(0x3819), 0x00 },
 	{ CCI_REG8(0x381a), 0x00 },
 	{ CCI_REG8(0x381b), 0x01 },
-	{ OS05B10_REG_FORMAT1, 0x88 },
-	{ OS05B10_REG_FORMAT2, 0x00 },
 	{ CCI_REG8(0x3822), 0x12 },
 	{ CCI_REG8(0x3823), 0x08 },
 	{ CCI_REG8(0x3824), 0x00 },
@@ -341,7 +318,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3829), 0x03 },
 	{ CCI_REG8(0x382a), 0x00 },
 	{ CCI_REG8(0x382b), 0x00 },
-	{ CCI_REG8(0x3832), 0x08 },
 	{ CCI_REG8(0x3838), 0x00 },
 	{ CCI_REG8(0x3839), 0x00 },
 	{ CCI_REG8(0x383a), 0x00 },
@@ -362,26 +338,19 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x38a7), 0x04 },
 	{ CCI_REG8(0x38b8), 0x02 },
 	{ CCI_REG8(0x3c80), 0x3e },
-	{ CCI_REG8(0x3c86), 0x01 },
 	{ CCI_REG8(0x3c87), 0x02 },
 	{ CCI_REG8(0x389c), 0x00 },
 	{ CCI_REG8(0x3ca2), 0x0c },
 	{ CCI_REG8(0x3d85), 0x1b },
-	{ CCI_REG8(0x3d8c), 0x01 },
 	{ CCI_REG8(0x3d8d), 0xe2 },
 	{ CCI_REG8(0x3f00), 0xcb },
-	{ CCI_REG8(0x3f03), 0x08 },
 	{ CCI_REG8(0x3f9e), 0x07 },
 	{ CCI_REG8(0x3f9f), 0x04 },
 	{ CCI_REG8(0x4000), 0xf3 },
 	{ CCI_REG8(0x4002), 0x00 },
 	{ CCI_REG8(0x4003), 0x40 },
-	{ CCI_REG8(0x4008), 0x02 },
-	{ CCI_REG8(0x4009), 0x0d },
-	{ CCI_REG8(0x400a), 0x01 },
 	{ CCI_REG8(0x400b), 0x00 },
 	{ CCI_REG8(0x4040), 0x00 },
-	{ CCI_REG8(0x4041), 0x07 },
 	{ CCI_REG8(0x4090), 0x14 },
 	{ CCI_REG8(0x40b0), 0x01 },
 	{ CCI_REG8(0x40b1), 0x01 },
@@ -401,7 +370,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x4305), 0x83 },
 	{ CCI_REG8(0x4306), 0x21 },
 	{ CCI_REG8(0x430d), 0x00 },
-	{ CCI_REG8(0x4505), 0xc4 },
 	{ CCI_REG8(0x4506), 0x00 },
 	{ CCI_REG8(0x4507), 0x60 },
 	{ CCI_REG8(0x4803), 0x00 },
@@ -413,7 +381,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x481f), 0x30 },
 	{ CCI_REG8(0x4825), 0x34 },
 	{ CCI_REG8(0x4829), 0x64 },
-	{ CCI_REG8(0x4837), 0x12 },
 	{ CCI_REG8(0x484b), 0x07 },
 	{ CCI_REG8(0x4883), 0x36 },
 	{ CCI_REG8(0x4885), 0x03 },
@@ -446,6 +413,42 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3222), 0x03 },
 };
 
+static const struct cci_reg_sequence mode_2592_1944_regs[] = {
+	{ OS05B10_REG_X_ADDR_START,	0x0130 },
+	{ OS05B10_REG_Y_ADDR_START,	0x0000 },
+	{ OS05B10_REG_X_ADDR_END,	0x0b5f },
+	{ OS05B10_REG_Y_ADDR_END,	0x07a7 },
+	{ OS05B10_REG_X_OUTPUT_SIZE,	0x0a20 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE,	0x0798 },
+	{ OS05B10_REG_HTS,		0x06d0 },
+	{ OS05B10_REG_ISP_X_WIN,	0x0008 },
+	{ OS05B10_REG_ISP_Y_WIN,	0x0008 },
+	{ OS05B10_REG_X_INC_ODD,	0x01 },
+	{ OS05B10_REG_X_INC_EVEN,	0x01 },
+	{ OS05B10_REG_Y_INC_ODD,	0x01 },
+	{ OS05B10_REG_Y_INC_EVEN,	0x01 },
+	{ OS05B10_REG_FORMAT1,		0x88 },
+	{ OS05B10_REG_FORMAT2,		0x00 },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3620), 0x0c },
+	{ CCI_REG8(0x3662), 0x10 },
+	{ CCI_REG8(0x3714), 0x24 },
+	{ CCI_REG8(0x373f), 0xb0 },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37c2), 0x04 },
+	{ CCI_REG8(0x37d9), 0x08 },
+	{ CCI_REG8(0x3832), 0x08 },
+	{ CCI_REG8(0x3c86), 0x01 },
+	{ CCI_REG8(0x3d8c), 0x01 },
+	{ CCI_REG8(0x3f03), 0x08 },
+	{ CCI_REG8(0x4008), 0x02 },
+	{ CCI_REG8(0x4009), 0x0d },
+	{ CCI_REG8(0x400a), 0x01 },
+	{ CCI_REG8(0x4041), 0x07 },
+	{ CCI_REG8(0x4505), 0xc4 },
+	{ CCI_REG8(0x4837), 0x12 },
+};
+
 struct os05b10 {
 	struct device *dev;
 	struct regmap *cci;
@@ -468,6 +471,11 @@ struct os05b10 {
 	u32 data_lanes;
 };
 
+struct os05b10_reg_list {
+	u32 num_of_regs;
+	const struct cci_reg_sequence *regs;
+};
+
 struct os05b10_mode {
 	u32 width;
 	u32 height;
@@ -475,6 +483,7 @@ struct os05b10_mode {
 	u32 hts;
 	u32 exp;
 	u8 bpp;
+	struct os05b10_reg_list reg_list;
 };
 
 static const struct os05b10_mode supported_modes_10bit[] = {
@@ -485,6 +494,10 @@ static const struct os05b10_mode supported_modes_10bit[] = {
 		.hts = 1744,
 		.exp = 1944,
 		.bpp = 10,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_2592_1944_regs),
+			.regs = mode_2592_1944_regs,
+		},
 	},
 };
 
@@ -654,8 +667,16 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 				  u32 pad, u64 streams_mask)
 {
 	struct os05b10 *os05b10 = to_os05b10(sd);
+	const struct os05b10_reg_list *reg_list;
+	const struct v4l2_mbus_framefmt *fmt;
+	const struct os05b10_mode *mode;
 	int ret;
 
+	fmt = v4l2_subdev_state_get_format(state, 0);
+	mode = v4l2_find_nearest_size(supported_modes_10bit,
+				      ARRAY_SIZE(supported_modes_10bit), width,
+				      height, fmt->width, fmt->height);
+
 	ret = pm_runtime_resume_and_get(os05b10->dev);
 	if (ret < 0)
 		return ret;
@@ -668,6 +689,15 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	/* Write sensor mode registers */
+	reg_list = &mode->reg_list;
+	ret = cci_multi_reg_write(os05b10->cci, reg_list->regs,
+				  reg_list->num_of_regs, NULL);
+	if (ret) {
+		dev_err(os05b10->dev, "fail to write initial registers\n");
+		goto err_rpm_put;
+	}
+
 	/* Apply customized user controls */
 	ret = __v4l2_ctrl_handler_setup(os05b10->sd.ctrl_handler);
 	if (ret)
-- 
2.34.1

