Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020100.outbound.protection.outlook.com [52.101.225.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B4236F902;
	Sat, 18 Jul 2026 20:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405464; cv=fail; b=Ft/UuKl8JHu93K6ahsrUqZzsXoHmstI25jXVl4rKg8wNvwj5wh8t9UrOAZIGDeeJ13moPzmTqBcAi+lGlfYhOinsfR43wQqvHF94DXLocvkCWwyHcAB+O7uMP9GuUh7aP5MIg3JCovoV400iI2vC6iK4vOxk0/gputYTXAzh9hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405464; c=relaxed/simple;
	bh=TxSwgzPW7fAsHkvyDkFVt/kk08b+bgNdrOP5U+N8i9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=obuzMj/LjUyrPf/HsaMiAG3ZELuyOAdhR7hwZ5JT3r+pr9ncnLh0TaKUABN2ngNmNWRe1YAsww7qgQTG9if08XH+mt8l9eKAH4BZXJoyYJkKcwRhBi/zmttdbygN+d3UxWAWsEVePRCCPJCmLOT1lysGn8gj0Xv6+bAtE41Sxms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=QaF6q2xi reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="QaF6q2xi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4zD3kLv7vcYPr4p1nVzUlZIgwx4BiPGBQ3XSmkqXsKdH91N5O9bbym/XIMuniZqzBY159LftHM+H4TK8u6ibfKUCycbQYzrhpPeB2o1U1GwZcXMBTlrd88+Swi53usSYNG8Ii6F8wpDqAsLrdDZgL490SFKUd4nxackp7SwRqm/HX+lluSRfiCg2QFoHZVxW28hIpMmVsszE+9v3ho7CkaiiI25UsmCA4Tvu+L8iql/wwpaZX6sw/GZDI45qhUVw8JgEwuI3KmdwrFYOIZCykQShD1jkFTW1zLwYoOkMISsLwu8xA5WEGeRmjIk2GV9lrvscHT7A2hiPK0smjfCPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SulYllcxhxEMXg5K9mQ8wG00pQBEAsU/Hsb0umBScMU=;
 b=H9Fk7iS8Y87QO3r7wtcV3UfBB6bOTdD+EVVUUaa3Yh8weoyBhwUd3eL/FcwTFch9vVKVqyP5rnotiwAA5RdhPjFKbp5B9OkXZsdm2jDJr07b2kUKvz8kMB0IRAPm6EaPIirAjfo54nYoNY4X7qj/LMhQgPSb7yKcUB3Ymn77e551kiPpOIgQDjtldtJmSk5JjTcet/rnmc32sGbXSfuzKJ2selcBsO6+X/efY0gVeHF7iyqzmI7xoY9ilLBaYc666IEymMvgpG67jPJ74C00xFrqqW7J5tZxjdanIrF43fWBu3X3PpNTnk8Q9Vyba2l2m75dVezKeLwN1062QYg3Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SulYllcxhxEMXg5K9mQ8wG00pQBEAsU/Hsb0umBScMU=;
 b=QaF6q2xiWNVOqWG4roWctF5JK5tYR7UEPf5OpaqUFlm+SFIKVdGHKTO2LWxgEXugGEw4+b81XdUALD0Lfk0hpYP4iKFqyn/eUMDZMqxpVRXRxQ8btLPTOtbrvpcr/iYAQyH6K1bpUL2Dv+NWsWWb1J3qJX2zOdGPZ7bR3Z0ie9THYp9qZNcZHvuiN5VzpniBQloLPlgNHc1Gv/L0a8QB83FGxUpBCmqU4BAoMs4ffHprPI/1n2GKzryvKvthjWKY2ItCVFn9XDgy4GVZaYLtwrwE9rhM/5WKvCM4VzIR91Aq3zztkgs0lkEmeSLJYviUrfjNnVPb4um8M9bm+PFjZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0774.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:131::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.14; Sat, 18 Jul
 2026 20:10:59 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:10:59 +0000
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
Subject: [PATCH v3 10/17] media: i2c: os05b10: Add 1080p and 2x2 binning 720p modes
Date: Sun, 19 Jul 2026 01:39:01 +0530
Message-Id: <20260718200912.16001-11-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 3aa04865-8d06-4853-5147-08dee508aec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|10070799003|1800799024|376014|23010399003|18002099003|22082099003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	UqPh2Sp4vxWHxeeH7tZ1rKVVd3m6joNiwvB9r6LsvV/+jx2fujIYBP6+qrpkXWLSvRQW7T/iKGYGkMemfIL3D078DuWV5t7QVGGMxX4jaDqSqVtUc2lhF7HnBmv8vJYd63MJutDF9bbpRIVrlOrYsuG67uVXeL0Hkrh4ezzH1Uv+Zm2C9MBBGloqaOdwSN6OT8XIeL27Exqam96K7bgjxHKDFolBgse4Dif/ZGSWoBTp7fcp9fCpcw8E7SVYUl3BK3E5q4d7C+2rj16yBS+0/rDZISMl7UObu406Vn4cXbwF4X3BxXwp6Jm/ScLGi+Gz9UgvAynRdWTmFcRJfkOqYm2+ys7xexOMmRJpM5AJpK6kOTJrKadjRXhvI8y7ToccGcllgnb+vzp55oDQT5qiy80eXDmW9z5k4JBZGR/7Dc6ewngodsNX6Tn+ddDdEIoow2ULWbZnwOvEqmm3NL1Wij8ud4zHcS15iIjsnJ+80osKBt4fZOkzxbpmSTXTwXO5ApiLpxxyuzbAparsjQKqBoBD6nrDrNAV93iAnZAekyPT29N8lmg83OR/OIKLWqluRUkDKhWK57Ox7YWF7O8piXzqDPQkcQNHaCt96etezJvu4ecYDbv0MISj9qc0sWDOhKNFp2Kw30F45aFQa3OCMvb9xhY8roWJr5IEuwNSRS0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(10070799003)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QkTNzF2nrHFI+jf0kl/vSiJLexvgmMtVeXkKxutf2SAI+t1X8KWSuvx/cdxB?=
 =?us-ascii?Q?kaHo24zrbeDlLGlVcLljINFi5K9HmSjJaahJ0UJmv097Sa/pTdnZLWNRx4Ur?=
 =?us-ascii?Q?L43P3/7uTu6hXTxZ1WvSktBAuaouAtkl43psNa9F6+wFmhYKtvUvMQVHiED+?=
 =?us-ascii?Q?/MDhCJs/8TtuZln7qjnuRVepkwh9ISzHkt9fMlvPwe1D7c+QQRbtPaF0ZIW7?=
 =?us-ascii?Q?3okggLrrl3ctjjg9o873zEThmUKmWWFz1fpDPmOf+we/FRtaOhe/8pms7Reg?=
 =?us-ascii?Q?fQ35An9wRpwluH3nVH+qOAukmglLS4xqCXOVh4fOLF+hCQq4cQShTWJrN/af?=
 =?us-ascii?Q?j4JPJwGRDtB+5SZyg921sAJk4K0AO2GHV02LpO0ytWZtlCzCuPpMZcP2XQfZ?=
 =?us-ascii?Q?1knTkLTLUfjp8JNL5R02w6s7vv7a2yygd3c40U6HM/xSl88cJ+u2uWmhGUph?=
 =?us-ascii?Q?4e/Q7MxK0/IuX4HpKl8A7NfMlyBgc+Ueldnhr76zcsLwjQh0HFiRP45VfzoU?=
 =?us-ascii?Q?5eA223k50YZAH+78aY5kDw/E3ARj7gc/jVOSxBV05QuxcaAV3BZ8da5TyVsS?=
 =?us-ascii?Q?3u/SQyuxJ1/8ecMFadIUB++aKRFGmLZCc+B1jRDFE5sMK57AXPjquuSn8/Yd?=
 =?us-ascii?Q?FsqjkONCa75sgBJVTZPLIOWGAPEflrQ4YC7vdVjYMzf9KFreG3wTLMBva2Uy?=
 =?us-ascii?Q?fjgsI7hoe0o43CeixVHS9P3ClM2UdZ/laTyxVeKXmGHCvTi2QbbQKMc2pt4S?=
 =?us-ascii?Q?OpNtC7pGsQ+eAhPUcxzdpX3phHvSugrDpNFNI4P0se9VgDLA28bX+FWnpNYF?=
 =?us-ascii?Q?eYhPO1TMxPNzXNbdjxNR6oFjmtAtiDQm+eOV00ASmCyASP9ibCdfR3kiRIla?=
 =?us-ascii?Q?ikLpaWYCYXZKU/qsJ+2LjdEWSMm9oxGkXiaTJwU/BNlvWBxaFIaIHMe22gJw?=
 =?us-ascii?Q?tsDhworYpNW/M3/PpIpP37GEISEUs341HWT8vQjk3o5XEeG/o/c/GLVEDpiX?=
 =?us-ascii?Q?0SCepup9ilDdxppRypMYyrFpQ0bTXGnLgADcZ2D+MdbzTIxppE9BMQr6IaMq?=
 =?us-ascii?Q?73I0cw3V34G2l93YDsHX5+4LfYK6/HfucJbIMOgkWF4fnNqU8D3VqxlnNCKR?=
 =?us-ascii?Q?pF9GLTi1qBFnV/2vuEQZckBPGEW88GqoaNQ32fFh5cC9Y9xEK02sPCNwynX0?=
 =?us-ascii?Q?bXYOv71n31AT1U9UyY6vfcIEyLbTskJN2LslvyeXVa2Os3fkieAzBFdw8yk4?=
 =?us-ascii?Q?6CZk/eGdQO1A28YyWT1sPZYorlO+l6PDOaZAyHxm2MhxRYxdYvi+Z39TfpZU?=
 =?us-ascii?Q?MaUJ729P7o54w0+Qzhg3zkB0COjyqYt+u8yuS9QVdWYLo9iXJ69xuUCUWvTl?=
 =?us-ascii?Q?YaMRLecmHB6IYWVqh1AlS7q5fBr+v+BUHUu3Toc6FikQo1OyrpxrO2rG2NhS?=
 =?us-ascii?Q?3AkPCJfO7K/ZKWPwWJfOfwOM0XVJiWISeApdUDQKFYWAFyEod2PTsDC8Pl5m?=
 =?us-ascii?Q?NcRvFJySUdv3ptqE1cqLiwofd4YryfvrEJ4SX1ZBNn6VXngfN9cevEcePVKU?=
 =?us-ascii?Q?3r+kImq2AYggp/6fs1I9lK+8EoX7ShDlSG2IhiuT6LARUkcFUpmNpf51Y+l3?=
 =?us-ascii?Q?b6CocUuAItqtGpnsk06rLx+caQqJNNTZYzuv2Htikh0VWMg1lNZO63ghtSpb?=
 =?us-ascii?Q?s0hzwOslf2j22ArvBYICZtFagpd7kHSeZEe7f8am4e8qju+ZyBe7/QUoFHg7?=
 =?us-ascii?Q?aZaX+oFQOJqb5niy5d7VCF2OKI9yFaNSP9ZBdxwvOylp8Org1ljwnRLSpsSG?=
X-MS-Exchange-AntiSpam-MessageData-1: jx+snrHPzOA587JOhGuUIEfCkHQiyLTiupg=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa04865-8d06-4853-5147-08dee508aec0
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:10:59.0918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qz887X/PPTSjeshDvnGmDoCFOzmzZSqGwOo+xmDAX6q0w5QnbGA+AIM+fJCJ2dbkW5wqzT7K4SDTlj/6scgx3vaTSHzL3mQB3omgVdhzDc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0774

Add support for 1920x1080 and 1280x720 resolutions.
The 1280x720 mode uses 2x2 binning.

Both 10-bit and 12-bit pixel formats are supported.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 120 ++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 3fd788bd8b20..c54b466656aa 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -460,6 +460,78 @@ static const struct cci_reg_sequence mode_2592_1944_regs[] = {
 	{ CCI_REG8(0x4837), 0x12 },
 };
 
+static const struct cci_reg_sequence mode_1920_1080_regs[] = {
+	{ OS05B10_REG_X_ADDR_START,	0x0280 },
+	{ OS05B10_REG_Y_ADDR_START,	0x01b4 },
+	{ OS05B10_REG_X_ADDR_END,	0x0a0f },
+	{ OS05B10_REG_Y_ADDR_END,	0x05f3 },
+	{ OS05B10_REG_X_OUTPUT_SIZE,	0x0780 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE,	0x0438 },
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
+	{ CCI_REG8(0x3c86), 0x03 },
+	{ CCI_REG8(0x3d8c), 0x71 },
+	{ CCI_REG8(0x3f03), 0x08 },
+	{ CCI_REG8(0x4008), 0x02 },
+	{ CCI_REG8(0x4009), 0x0d },
+	{ CCI_REG8(0x400a), 0x02 },
+	{ CCI_REG8(0x4041), 0x07 },
+	{ CCI_REG8(0x4505), 0xc4 },
+	{ CCI_REG8(0x4837), 0x0d },
+};
+
+static const struct cci_reg_sequence mode_1280_720_regs[] = {
+	{ OS05B10_REG_X_ADDR_START,	0x0140 },
+	{ OS05B10_REG_Y_ADDR_START,	0x00fc },
+	{ OS05B10_REG_X_ADDR_END,	0x0b4f },
+	{ OS05B10_REG_Y_ADDR_END,	0x06ab },
+	{ OS05B10_REG_X_OUTPUT_SIZE,	0x0500 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE,	0x02d0 },
+	{ OS05B10_REG_HTS,		0x0368 },
+	{ OS05B10_REG_ISP_X_WIN,	0x0004 },
+	{ OS05B10_REG_ISP_Y_WIN,	0x0004 },
+	{ OS05B10_REG_X_INC_ODD,	0x03 },
+	{ OS05B10_REG_X_INC_EVEN,	0x01 },
+	{ OS05B10_REG_Y_INC_ODD,	0x03 },
+	{ OS05B10_REG_Y_INC_EVEN,	0x01 },
+	{ OS05B10_REG_FORMAT1,		0x8b },
+	{ OS05B10_REG_FORMAT2,		0x00 },
+	{ CCI_REG8(0x3610), 0x57 },
+	{ CCI_REG8(0x3620), 0x01 },
+	{ CCI_REG8(0x3662), 0x08 },
+	{ CCI_REG8(0x3714), 0x28 },
+	{ CCI_REG8(0x373f), 0xa0 },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37c2), 0x14 },
+	{ CCI_REG8(0x37d9), 0x04 },
+	{ CCI_REG8(0x3832), 0x00 },
+	{ CCI_REG8(0x3c86), 0x03 },
+	{ CCI_REG8(0x3d8c), 0x71 },
+	{ CCI_REG8(0x3f03), 0x1d },
+	{ CCI_REG8(0x4008), 0x01 },
+	{ CCI_REG8(0x4009), 0x06 },
+	{ CCI_REG8(0x400a), 0x02 },
+	{ CCI_REG8(0x4041), 0x03 },
+	{ CCI_REG8(0x4505), 0xe4 },
+	{ CCI_REG8(0x4837), 0x0d },
+};
+
 struct os05b10 {
 	struct device *dev;
 	struct regmap *cci;
@@ -513,6 +585,30 @@ static const struct os05b10_mode supported_modes_12bit[] = {
 			.regs = mode_2592_1944_regs,
 		},
 	},
+	{	/* 40 fps */
+		.width = 1920,
+		.height = 1080,
+		.vts = 1504,
+		.hts = 1744,
+		.exp = 1472,
+		.bpp = 12,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
+			.regs = mode_1920_1080_regs,
+		},
+	},
+	{	/* 2x2 binning 120 fps */
+		.width = 1280,
+		.height = 720,
+		.vts = 1003,
+		.hts = 872,
+		.exp = 970,
+		.bpp = 12,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1280_720_regs),
+			.regs = mode_1280_720_regs,
+		},
+	},
 };
 
 static const struct os05b10_mode supported_modes_10bit[] = {
@@ -528,6 +624,30 @@ static const struct os05b10_mode supported_modes_10bit[] = {
 			.regs = mode_2592_1944_regs,
 		},
 	},
+	{	/* 40 fps */
+		.width = 1920,
+		.height = 1080,
+		.vts = 1504,
+		.hts = 1744,
+		.exp = 1472,
+		.bpp = 10,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
+			.regs = mode_1920_1080_regs,
+		},
+	},
+	{	/* 2x2 binning 120 fps */
+		.width = 1280,
+		.height = 720,
+		.vts = 1003,
+		.hts = 872,
+		.exp = 970,
+		.bpp = 10,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1280_720_regs),
+			.regs = mode_1280_720_regs,
+		},
+	},
 };
 
 static const s64 link_frequencies[] = {
-- 
2.34.1

