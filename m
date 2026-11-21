Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.82
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244493;
	b=zsGxrBpw1xrx/IrcEu/MLnlNwm1yybRh1TgDLNTm014a8Xazj6xzDABNHd0SItn1dpyK
	 sWPBHwUuHWRPvJdzpJYQw1IY5aVrTZPejBvKWi7SF4STOyssTm6MWcPucJVcow4YmcAOz
	 0WkvgVaI91o/n1wJlQqnCv6E873mj3I72l2VyG56qS0PqtucnOkJ5bzjTxqVTS5Ffivfa
	 ZeE+o+/9kTTmaQEAKeVX/n4X6AvGdRypRPuZllu+3x0NvFnKDmNFgInPSgFYObSmzhtD0
	 0HGpgtaMyu/lraGYRZXoNnHC0Zt/5sBmgF9toZXcDXRe9Pq2BgB6yiZMtVD67ry1eFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244493;
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
	bh=D6FvhZ5+At1ZrRQr11bWTfcW5PI/WkQqodL9x0y200M=;
	b=NGhB2oZTKe7lGMBQFnElJe6rLeGi6h9Z3OrPsmMMETtsGMZScRgEMjvPonqKI2nR5sJn
	 pS3PS1aDSfE5z+yT3R3SGGuUMCsKD7NcjpCW2iOvJg3iFe9A7IpTOYCKB9VoG5Ikzlsie
	 SNugr2F/CljW/VDIJyyFQTwlZsXv1ymgqm4Y4MRRQ2tRT4OoismOrLeirMLykJSpWq4ml
	 30Zr0vPsQ4FTNin1TK9NZh/qv7gYsFO2ImnGd6VyYV6SPKxI/b8d7LgFFmM+3paCC9rEg
	 uf9ppMXpLsfDsolHwYaxIryph6GZ59hpE2ssmVy1MBTp+tOSRfXq/CN371HP1muvWIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.82
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021082.outbound.protection.outlook.com [40.107.57.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9012B606A331;
	Sat, 21 Nov 2026 07:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9012B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9ptl3bl0fny9p6ooaeIbp92UmRZNFGZeZkYeJsrW3rrWJj7AASto8SvuFJBuKQrZLjuBdegyIRonliB3dCoC+5lCja/lhxs19L0Zw4YvbUN55gWsEqBjwzihSwz98ZQLKK64FnIxmZtTucftWWMbKdLp7LOJbm/DWNLQHOnbvd/gZ+ciWmVzCFY626r0wIrsY2Wh4bfnPlErJO4Uv2ubyGVzstXI2mqo6J1LhbWPl2h4+7/QglPfPsxvCw4ceQQMNPrDoGAWF5baeUdkFAsWUfVCgS/PjN4O4ThpwOEf1TfBxsJsusgFGjN/fN3Y4H69AstbCg01z2jc6cflrvHNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6FvhZ5+At1ZrRQr11bWTfcW5PI/WkQqodL9x0y200M=;
 b=WtZtqhdMKTe4YqvzpIDXUMwOJb8pnWMxAvqJcoC8CCBWTkc1qoArdM4ouNKUUxPjk8m+NHE7AVnCT6enr05CIHrFe6cn7zyPhdXpgu8XW3ZudmMil7ohB+7KumovP+bdWHnq0tpFAvMaAe08gS//xJ0MYTk4zc+VnIVjuw7AufeRsr9UrWZK+lwduKPaOgE0srwq6H+iqRXsRoUDRDwNJiINrG9FqlUuSMggciC6uSLlz1tnv4ihqGDiIis4GxCL3eHzMyFepptAMPOWXBr/6rFoy+a/gAk6kff6HrtRyQaScuEKeeJo6j4lU2Cf32EKblc6gj4W1UDv0A8c4JeMaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB1492.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:01:29 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:01:29 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 01/15] media: i2c: os05b10: drop unused group-hold programming
Date: Sat, 21 Nov 2026 12:30:51 +0530
Message-Id: <20261121070107.1768-2-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN3P287MB1492:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d0c083e-680c-4a61-1169-08df479d445d
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|22082099003|18002099003|56012099006|10067099003|261028144727099003|261026140227099003|261021123027099003|261022075727099003|261022105027099003|261009223027099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 zySLXcvIJUX7TQuBNErvKVAU1v8TL5ThXBLq+JO0peHEihuhvir5Je/AbhzrxkBsZ0u8ggXfEhE6bibLpN+ReggJMb4LRruGrzbp8OaTvIhgWRw3o5MgE6egNDbPdhv1GeIerl2FnKQP4VbrwOy4vCVavpNBVj0zjjnysqjlGeNsjyvuHQMx2SX949HfKhN7+Qf3lYUxdChX4wIhgCSUXuBXXbfyleB4YJVgKngOLNvtC/S8qEb0Dlg0YrpU4d/yJoDmFTVnAsbuKnS0N2VSFlTKWtf/sFBHqN+4oMfZ9fAQehaSNhYC0h8+xoE361MTsLI6C4HF0lqnjFdiFIVaMMwSw0H8tAGmKX987oZRFfd30j/+hiK0fn+5TdDBJLhXy+Ahu7JAlHzR+cMpChqMVyNHKAsDJvKOOxEUn5GYO0rCHDJHVY/E56JqES/lB1I0zB0LK5BxelS0BsdVgFoBU6eRgiXbrbRww0TY0mYk95mqP8BfmuP38hx2DoqEQvvZyaNr+hTwaX4Vhw89SwoVxZRYHfBHNCQG0Frk3axU/BEsNivvUkbyuxTFDgt9DWqXyUbQJCHpjPT7mJjOv05u/k+V1fo6xFCzO6FzYMashguuR844EUqPiaI98KivmzMujm9icOuZ6u62eGaiTq/KGAbeT64y9EtGhD+thXSPfWwjelLF8mGewU7GNrA6QDyfH2ESGsguBzP+T/jabquy6XWdm3oMjpX3Zk4PGVdOfD0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022075727099003)(261022105027099003)(261009223027099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?dikEC97riqG8BmCDKuQ5BIQpJNnIJS05DKRNTZ5RJBLpBS7SSeLGqUPOmx0m?=
 =?us-ascii?Q?7t0T8CTOEArQlwTXxRRax/trl2jBVwvjonTNUNkjq7d3QsI+Fs3+2qlXMNhY?=
 =?us-ascii?Q?Nnc7hX0foJvC32XH12G4OoLQOwk37LgevuHGiUn/2JmqVo83AYEq72xNaHgO?=
 =?us-ascii?Q?r7OsfVb0lOgDl19/fs41CxXz+EynCcLA6x+8Shno8h9HvYlko+4l6jT1Y3Xf?=
 =?us-ascii?Q?37++/VGr81wOjf7hD6DcydmclfCAMCPqZGiaoJJ2ZmainqUNFkxJkMwPMkBo?=
 =?us-ascii?Q?Bma7dHDO/yEIUhG6Ahyo6odCm22ruwpjlr6i3i5vU7GcM7Q6uFaSpIDdJx8A?=
 =?us-ascii?Q?knIGubCjbomy2J079PAz/gbJdi/wPBkowzF2TTHDXI5LEu6RGJq3rLpn9e5E?=
 =?us-ascii?Q?APN9e7rWbUTtLxh9OcZkBG07qYn/xFIBD+KnXU+Vyd5f72Njgn9mi1lTNGTc?=
 =?us-ascii?Q?fG0s0IpjqjdRwcFppZcPV/BxRju8cMOTBrfJTn8G6mCwNWo7nCca9gaVqDyj?=
 =?us-ascii?Q?TfwbLy0gLyWNzOxVqWkxkTKW+2zbE2UC2I8DUDqLsa/Pnxrx8Lj7xsNraciL?=
 =?us-ascii?Q?dPjmSuoCfPnyAvD1a0bn9T2lUdF57VvChck3/LMNTknA9L8B+YgqHnw3eN+z?=
 =?us-ascii?Q?ptQ1DH9/GspjsdUaKPRNHvzi8dsA1gOnkNfr/iQq8m3FWmD31UJX/Paw/QDM?=
 =?us-ascii?Q?qmejKByvFKa/YCKH/GRMCO0ONfQqyjgv01s4MqhTHVXwVkZyfCJb5YffuzeF?=
 =?us-ascii?Q?eivIRIpfv0viurVGSAFhqym2l8sDGNWmvU99BMZynfmLE/O64vAgGGHErGQ5?=
 =?us-ascii?Q?D6Tl/Qngd5X5smpnSubAQv0Cjf/TR+QyEAHM38JUSCOXCiu//JUSEhduE8M4?=
 =?us-ascii?Q?DnT+IIb2UTF9ONg+x+USunjBMVz3WLP8eYyUnoiqCgYNEZWEVrkmy3CBgG3j?=
 =?us-ascii?Q?k4ODAH5myf2CReKOdzXgOu5jC3Ht0dU5snZPGIxNjwskV92dIwFjhlUg0uUR?=
 =?us-ascii?Q?SUDOlexHaZsNb023peAKH7JoHZqNSrUXLtGeQrmxfQovI956IYNLgyhgXSww?=
 =?us-ascii?Q?4JKhy1ULQB2Pzddja9JJPWmOogxlrAzJm8lI+qznfga1klTcgUPv3e5AR5O1?=
 =?us-ascii?Q?zbpY+r7exfRjKgqocfJ2HUmgOba937pFJL8i/ImI3KubFECkmecPlCDfK7pA?=
 =?us-ascii?Q?YLbvegNp1NaY3sU5LqisH6ZvCRfAaDW2oknznu6uB6HVUTkI1SG9RYaxNUxz?=
 =?us-ascii?Q?qrdrwLAmfUyntseH01q9hbTqxPUhsVTQXJfTcAo2d/QvspiU8N/W9y7IU+Vn?=
 =?us-ascii?Q?618PQojNI9X4O9HRp8kV2eBf6zkNgPgU9fok2SUmKLt+0EnqSAVtYa0lz1iT?=
 =?us-ascii?Q?w2UdBya/T5/X17g1in0O0wihppsuk3LyZ7ZFS8K4ZaWl3xnzul7iWSG3crYE?=
 =?us-ascii?Q?jg5Hl9Qk3Rf9xEXPOgNBlW5EiTc9q7O1kWhSRHiZ48+SjHwsIV1DL9pAfKPI?=
 =?us-ascii?Q?Q34ady8HD0pa6/INO+WisBE3zP+7BS3hLtcj8wgTpHyNq6712LFs+rE2xgxZ?=
 =?us-ascii?Q?r7DrgI6CSNU9xSKNWgWZSJ5zClA0ZWS5GQ0b/ka9EGDd3SjmkYbyT3AOOFwx?=
 =?us-ascii?Q?zup2elHFCqiIntBbOaU5t1IAmeXSVgfLIBFuBJiMmJ0D8fQbWB85tObkJWpK?=
 =?us-ascii?Q?7iiDSov0pcyEbGtWm878bVO5nekdErmeJ84DqO5Eq2PDfotyDekII5h+00RI?=
 =?us-ascii?Q?zGC4Fwia569hsHKXLh0heSLbSF9MWeo=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0c083e-680c-4a61-1169-08df479d445d
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:01:29.3453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OWZVNpoxr6eN74g5UPkE7FmIrg4WXmXQq5hd696yW6YAAdCrhUnC4S/8b3zEopvw/KZ6Zw1/fj6XIXf0C9/jpanSyhzdmz9glt+rPAzeb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1492

Register table included group-hold (0x3208) sequences for
groups 6/7/8/9 that only stage alternative tuning values in SRAM but are
never launched by the driver. Remove these group-hold blocks.

Also remove a duplicate register entry for 0x37bf.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/os05b10.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index a46cfa513e98..d5f573b1614a 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -250,7 +250,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37ab), 0x0e },
 	{ CCI_REG8(0x37ac), 0xa0 },
 	{ CCI_REG8(0x37be), 0x0a },
-	{ CCI_REG8(0x37bf), 0x05 },
 	{ CCI_REG8(0x37bb), 0x02 },
 	{ CCI_REG8(0x37bf), 0x05 },
 	{ CCI_REG8(0x37c2), 0x04 },
@@ -415,42 +414,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x5820), 0x00 },
 	{ CCI_REG8(0x5821), 0x00 },
 	{ CCI_REG8(0x3222), 0x03 },
-	{ CCI_REG8(0x3208), 0x06 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x01 },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x1c },
-	{ CCI_REG8(0x3610), 0x37 },
-	{ CCI_REG8(0x3208), 0x16 },
-	{ CCI_REG8(0x3208), 0x07 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x17 },
-	{ CCI_REG8(0x3208), 0x08 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x18 },
-	{ CCI_REG8(0x3208), 0x09 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x28 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x63 },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x19 },
 };
 
 struct os05b10 {
-- 
2.34.1

