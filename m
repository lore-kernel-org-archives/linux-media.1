Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.91
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244519;
	b=a6MabX/NRWKkgIB+RVfzyI74laO5AtSpguI5lYXm2yZJ2v0gkRWH3WJpxf2cyFqQOluw
	 IZCc7imzSD4TVcp/tl0eceRrqwRAQO0AaUQUcV190z6AYOv1b1qIn24j9NXgN2XTXrZjF
	 riOtPeNjfmBjejswtmtnAA+oIKXxZoBYSte8baGTthX3CGIFCR9uD1qNgAWbKyhIQ/SqS
	 aQqLRoB0YTloDpKbUOplwcizSmcSLQve/icptrHqT+z+64vRjj3leMF23/GoUNtxZZBV5
	 AAqKsoN+zzMVd+soCMgMc3RTIWJMXPHP4pmKQovEKo6vkzgIfNi2cEREelsNgpye5Tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244519;
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
	bh=1/MdYqNUzoNkAxiE+8dZK3RpgXWnxQ2FTgmFohfneio=;
	b=fFUBAEk/C9qmWZYM05cFARNisTErCeFV095LONSt7z1Qu59AmRLYNY/wvbSVF8JPf602
	 uzJeArZ5O1Xt7ynsM7H7tNQEd1FLs+wcnMOkK8f0P1ufqJtF3WrjCAjnLZv1v4ggnqh3g
	 bHQuXf3S8UfOWfJ++r28zWm+sFi/RwC9NsYAyPVZNz2s23O3wCJfDPzTZSKW6asntk827
	 YKPhIwb4hEGwG4w0ArBAdJxw4MYJCzjXm3yeXhA4MmyWe0SpMmbPci1gwW3KRRUE6gyqW
	 lB/YQLXc30QLtVh2x2l/jxv0bTxVJ5ArUOjNG2N+eMRssE8KziLVZBI8whUpM1GEusQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.91
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021091.outbound.protection.outlook.com [40.107.57.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F46606A68C;
	Sat, 21 Nov 2026 07:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F46606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XfMkLb7UdiRCHB60ZUwdc0HNam8Nob0yEyeoNykyMBp18FRtWl9BRLwISMzkGcoeoDrMowymov2ZPpnrOQaJpZjWAkNU9dZh82z8HLpnNcvBmYzc5gm2xuqVPuGkF1SM2mfqTGViQrEBBV8ggEPCy8PcNzGyvFw2TEeNuAvtwbhwLBVwFl3DX1LIBj7YMv7SnW+9Wz6SDtqPx6onTHB3qNtyBZuid6QbIU5aBTwvsZ32wiekH8OrZdfbZS+2cV81sxXG19jE4LnZP2U4dAqOt7bKFRWryokdSw7gGdrn2itsMuOZm5mvmmPnkDHozy3G+s9k37a9vkgHP9ZDz+MVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/MdYqNUzoNkAxiE+8dZK3RpgXWnxQ2FTgmFohfneio=;
 b=Jxe7Gf14UP1l8DVgAqt+pElfOn+Eo1ZJ/38jBsBkiNHAjZ5A7tdaVKDx+gFYrFnb68zNp2e7xjZIINu6u4FfukTK8e7gXxCPv1q3of37XexHI+UnQjWkA8V09LpE8uBCwN7mIkHYlSmfjWkqSV/+Y2hneJwuVZcoEjC32jW39/aPigPXmopw2H3B+AQTKmj/8aj1WUHIbUxbzK6ufCRqN/y4rLrSyMgLURqg5tNgAC8pdR4Z4LQnilmmqM9awNqJVkWbs6SV7xaiHhbA/VXaOgm6xb7WlhE28IlGAH9A93M8iEVzbFFdaIat6iUJCIKCV/fc5HywmjtJ8iN8majw3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1768.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:01:55 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:01:54 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 12/15] media: i2c: os05b10: Add 1080p and 2x2 binning 720p modes
Date: Sat, 21 Nov 2026 12:31:02 +0530
Message-Id: <20261121070107.1768-13-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: cf6f41c3-87cc-4ca7-427a-08df479d5361
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|38350700014|10067099003|56012099006|261021121427099003|261009223027099003|261102123227099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 /kwigiiQ9uAo1lg4ENf8l6JIx+x0VZhNhJBBip3yzQQZ1IGdvV58XdogxZKOBCq1sP2t5GT2tlS0Nk8y7a81pByw27BFkt6p68Em+4PM7ma4WSn3LhTDwjYgO6wlDMjSkomB+IDaLC3WM50591Ae0QPFvf0Xk+IVCWedM5oiBzCl3imTx7a6K0knle03addixImbrSV3sPPXxAL3iFLMVznI5EcQlAz201Wqwxi0nZkbmEjbXbb1vegVaklJAmhwgKl9Myinqxk2v8NFfP10lxPgkQYQYIoHYRRfofcKWgEP3XezUqgln8VIxMyie3bceJawNNfnpTX6wVQMiUiGbnNAGqNUkZjuiJdwPFFMgPMVfqulvJoO+9J7zGlC1b2vD5Z2aDRZXttEWikni8PJ8Y9JpsjMeWA+PyLfUB3lhyJy+i+9E+iripnovIpuHQWdw3xLoPo/LyROMXdu/PumgVaj7JVpmpQytq/3h8K2aQlI+SmY5pThLmzfa0NYW4wL1zcqJoXZdp+C1zfaJW+V2edu1SRo+eKIiIUJU7h1IakFuY/EHEpyc1250ZgphBGOoKoGAjmoysQ95yg1mY6DTCam3ppPLHuhhCLmZccx4qzbtS0yPTLit/3UX+3h2HnKcTBK6bEowVEsrG0Km03kZseMcBv1DTJefMZjbywto9UDsha1ohS8eD8RokAgQTbUGW9fOawfSB6a/wL1jdhrAyMI5pX1NW2kYhDT/KeRcs4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(38350700014)(10067099003)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?cLz7mAeHdEPoT0Kq151XaST6Q/biro8ybN70/LW4Dh1VOtISTm3IDBTi6YBt?=
 =?us-ascii?Q?kyEVwR9qRRBYrrFz9eAIZ/I3re4ILAwLbfLLnPYFiOGoztrYp5TYQr4hTMtM?=
 =?us-ascii?Q?np3cW2oETNSaMCRtj0lJRhGA9QR589f/S+H3u2CcqZ6AM6VKhfKMGZwPu5dH?=
 =?us-ascii?Q?LAGBBh9suBjaxaXuHPRDKt+uoRizwExamQtBoUp4HCyQ8QYrX/Nl1WhLqJoZ?=
 =?us-ascii?Q?TAzjvpvm1f1pic0Lfh7nh2TCCBlH8KfGXkjCxr4gfYue4FiTEaub/suksATS?=
 =?us-ascii?Q?qL9pQniuxPYZQCRjbts8Zc1MhSB0QCmsg30KV/J9GukOOhjJQMGjpJSkoIV2?=
 =?us-ascii?Q?TdEaPTlXc8yOx573TTAZaUXI5TKMiFxscKV4LRsiBa5/Y0Y9EefMDYhcp1ux?=
 =?us-ascii?Q?LhrGFh0Nh7gANgpfTzvtw83C+exgqgEAw28h2VS05whNZPoxY/dCCVCVUTKT?=
 =?us-ascii?Q?zS26df3veIhTXbjU2ykOXbkbzpTVnworRrbOKcMPGjKdjm8iRLXJHAS71YgD?=
 =?us-ascii?Q?pQtQHHcL0BaDgE6dGfeDOFkYB3msQ4d1odgSidxhNgv/za7Sl544mJdmGG2k?=
 =?us-ascii?Q?rAD/52ezyS2s0+C5enG1nO799Xwr3b8LtKpDf70oXHKZGZ0i1Gvg03WHLq7K?=
 =?us-ascii?Q?LCPXIQviN8guN+k/CrSLP9trv3PTr03oodGhOhS2VU3WL7iHLpHp+e85GQMQ?=
 =?us-ascii?Q?ETLKVKmjRg5BEIs64AQhy4NacV/pdiSmu9V/EL1BOGKE8G1b/3pOi/93zUTS?=
 =?us-ascii?Q?XjvRGJNUXbgGQCWG+F/EMkil4kVD47kNA0FXT2lPfxvc49IrssucZjYkhDPe?=
 =?us-ascii?Q?zQ2t2DQyH9TmjbAaGh79nWORgmUh7SHKDbih6Cy4BExiWrOckPl2Lra9nXCy?=
 =?us-ascii?Q?Piywmb+y+r+/ZbjqU+jxWSBSNP4IOoSBR9f2E2OlvyDG+5kKUiaZHxOmxgmA?=
 =?us-ascii?Q?b6m8t0Q4Mgc/h/XicYi/yjhhN3SeVCEs5BqWaOKR1OOF9Vlf+nAKYNTKDbur?=
 =?us-ascii?Q?U2l83JeV4VIgUrwNt9kDgPWs3YchxfCSpjcyj1kIY7Xvkt2E7/K0XqGWbmw1?=
 =?us-ascii?Q?rHK/i+TmQulS55JcoAoYlmKuX65yPHgp8KBeNqiz/D/rob0oIPbcHyv6zP0d?=
 =?us-ascii?Q?toY8nYS+PHyLF8kF1RAjpBWBR1xy4vaFR/ypGrssgw92adJkCHIta53X2tFZ?=
 =?us-ascii?Q?x4oHrboq8UOHMMLiwxXTwrYCrUBdGLgzPqA4ytTFNTgx4GCEwz7Y6bUh211E?=
 =?us-ascii?Q?Gjtb7gvKg6WsIdH4J+gqTp2P6KIXPHrpVuKozaEzmIiGbd6TyxFwG/GmARVg?=
 =?us-ascii?Q?kIop94VwdaNCXcNwNzxCSVKu1MfORrQwapTLvB/w1rfM2KcG3wSeSTi82rnK?=
 =?us-ascii?Q?pV/CfZgye2wNgcpntq5HXlcZfEFlYYnswmqJJJwde5pObUz8Dqs6gIOzFI6T?=
 =?us-ascii?Q?9x4SFTCbseuuLBPf1lGquDRmFp8wZo9cffc9SYzHCYifQl0nMUSr3ojZeFJ1?=
 =?us-ascii?Q?12/vLFFQEVebw6+6RcF3HY/sWdAleQ6TLvfSUXB/gV+XFrZrBdRtY29SDSfL?=
 =?us-ascii?Q?Fg7dRI/+HeY0pShqSzhQmb1hPjcwOfrsT/jzntXJRXuVhzGp5EtE/+o5nwgJ?=
 =?us-ascii?Q?p7B5Umn2fbQDoBrv4b86yQyJqZ+fq6oIBtcKc/L2K+iz95FDOJGUbpfiWBgi?=
 =?us-ascii?Q?UI1eNS6KAHHDzm5NY4qg/hz9dmli13nwzIvZUOxTTjuNlyO02G+RTX6qMYVv?=
 =?us-ascii?Q?ZXJGzqEcWCcO4gvTHFcN7Fsa/IxY6Bc=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6f41c3-87cc-4ca7-427a-08df479d5361
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:01:54.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgFhdcUUM6j38+vCucxabFjks6LOOhsvvrKK4lhEFHYvFr74cbxWK5YTmmidv6De89g5/oeKfCfBMZd3mNgh62pBQ9HEZcLuSMeK+7E77iQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1768

Add support for 1920x1080 and 1280x720 resolutions.
The 1280x720 mode uses 2x2 binning.

Both 10-bit and 12-bit pixel formats are supported.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 120 ++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index b1b1cc2d8fc7..895acfa04c7d 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -456,6 +456,78 @@ static const struct cci_reg_sequence mode_2592_1944_regs[] = {
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
@@ -506,6 +578,30 @@ static const struct os05b10_mode supported_modes_12bit[] = {
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
@@ -521,6 +617,30 @@ static const struct os05b10_mode supported_modes_10bit[] = {
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

