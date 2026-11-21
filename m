Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244527;
	b=y0kEL3+6GPonZMweN64v8SxHseJFZ6Z29aGove4KiDfRKpz0yIPxkBOZkbu8QiHJPXZx
	 ZOCGqGX5vxUSeg//eMv7MDaA9RfPpcGYW1O9/iwsLNILos5MRhmvtOOiD1npLxy9DKjMi
	 nCH9v+S6RcmB5aBON/xPNmMtcjcwhLVYQcC5E+MKoeRyzga/5TmKGNHySEpC79b9kiEoH
	 HN4In9AnRRfS2fwN9t6WwhGQpIGMdeEY5wVw/HigLcYnI0voZiGqTWFpRzC/ixOzpwmOP
	 91+48kX6LnmTmQMLXXICV42fI+ot0SyoXM2OxolquDY+3FuerT18w/KflIu6lbpt90Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244527;
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
	bh=vVtOGavooyjKNhOtGIV2IKb29ZbCRr7Elg3xkKP8MCg=;
	b=hZv91+czdtM05EQLv37qjRuziF6yXA6M2MGch5B58jh2nvCS/rmq3TEN2eXLX5bGstbp
	 mFWr6Th0zukJLuR6ncrQf35DtdSV0/wAR85I/gJPofm3KsdbqvWZ8jHEK/0oI3/FRuf9Q
	 32xgGfuuRkYrJxxoQUv47spkPpBocmc2ATaBz9j61mJgZ9t/6SR1if2m7NZr658mreZAh
	 T5vaf7TshH4UPN0b77VbYOKEa0rJD5Wa8trA/kZ+2yvCEmXb2Og6awNDT+7FCR9/nEp3+
	 SJnoBMfka9x33SbFlTbThk5CmlyItlfag8uRLbhZhjGzUiNZwS47hvzRVjJM9HaPDLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.123
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021123.outbound.protection.outlook.com [40.107.51.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BE9606A68D;
	Sat, 21 Nov 2026 07:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77BE9606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9oqZpVHjmOeQaLImqS2Gx1UoAx7ynl/cuUsRH3m2jtCOf5q42pAcwCpyM5Q16O8+P5gJAqKHk6JiyfFz48vigPfk/fvrQCNGGUzGFnMEwaX3PC6SfaH7fd7ywyy3iRXRgcQspESwFe6PZXGDencUffrI/xeF6WWaBTKtdWvl2LZ2HV1QRb7KAlLKhwVLcest2Zp3KYpPKdeBk2KQK3uS0YLO9T2wgea6O51VSl6MFqtgp0GQQK40OIi7DcJPUu4DJmYwxhfGFhHJ4NUqmep7shdJBMZvmLcaipHYk/be+hwjoeFoqdLDhdN3LZvJPGhav+oTIgOaNPCjaZqihTxjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVtOGavooyjKNhOtGIV2IKb29ZbCRr7Elg3xkKP8MCg=;
 b=tKdMoF90+8JUzC0R1iTWBpQPe6iwYL95RLFK4qi/Cr4G6noi/0R35Oab+vcgeGhO1iipU/hyvMCLpfRhfg0H1JDOFVf08v8Txprlvjl9T4zWP66lk1QrYdsJe5qKhoNJpQEBYXbU9eZdvt1nMyYcbcZIlRCZ8Ap5AhknjEy1LGb0h5Lh2doi96f3FxeOPCEDHVisgrbPXN5ctPMZ+zeI2p8FG4WPNUsCqZlXmEayympquc1KxAwjLM60txroOyrDTPsI3VxQaWqY36a7KpmrVYOWtDnvPxGmVcQSYC9Di6t+2Id4PjBLLTIVCU6Sr/n71lXz3QWT9KAZYZiaPSgdzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1768.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:02:01 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:02:01 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 15/15] media: i2c: os05b10: fix horizontal blanking calculation
Date: Sat, 21 Nov 2026 12:31:05 +0530
Message-Id: <20261121070107.1768-16-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: d2a74894-ba96-401a-cd41-08df479d5754
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|38350700014|10067099003|56012099006|261021123027099003|261021121427099003|261022075727099003|261022115727099003|261022105027099003|261009223027099003|261028144727099003|261026121527099003|261026140227099003|261102123227099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
 fmT2mchpxJfMxJhjnK4SDstaXfNWp/qtwnYhP2L5QcUZnlEf/EmC671tJMr6/f8yHZv53KX9zEy5WHK+EWaRPD60t0xXcJ1iljmEkNTMJgECVelH/yNSnZ1CWbh6lXz6sB93JBe/yHtq7AxaWNuHQsh+xsAwUHcQT46FFkM9qCxjgWwjFWlCHgqn1AX6CHsQQD6Wz3FacGOYgbmHY0TG4KNEnz0VGhNGxxGV4E4IeCT/p6ey59GuWt0GDF54BZj+tQ+JLXqB+Jn8U58xirNQFB8cW2q7492I53dytl36nir21PGbJN9VaoaMyAeq5CHamww38ZmgaubLHH9yVpBU68E1KCmrahh0+DYNHGWKV7E3/LMbQUkrxD5WLVOrAoyDTUaIknV4472441CBGGo7PkKljjXkrNR8K671mNty0nqjnEWT3NveaNqjNgTMS/tyXAxoj8qJy8mgibbcQCRlQHFGgkHnkfCqbE42FVcWOrVBpFvwqipa54l0y3F5/8DTxjK3SF0JWz1P10uhC8B6X2dCpsCBwA8fzTqr4S/x3QMJ2NAXRSWwKaeRTvhi/Rh1xrsbNeEHJy6zrZvv3KXrObagIm67i88MsXoDAc5YRHLInhyb2rZCx/+JSfS3KEYGcBFrwKXCd+6ArDX0Wx47m64G0M/zjU3TdYFEWFndj7bBCl2cf9cZtbQrGuxuDjnb+lTJ1Alcqz2N6k0acrXkXbDw4re4G4PMGvRbMKr7Izo=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(38350700014)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022115727099003)(261022105027099003)(261009223027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?SPKyvc8HpJmq0RQAys5ZaVp5/DW7rDwbW/vQvliDnFHXwiiCI0I7yfaBDtVv?=
 =?us-ascii?Q?MlYE48Qugph6sJ4mj0gykKexYoJSGrR29aIdukdZs9bKdG+TuhJYL5mpitbU?=
 =?us-ascii?Q?pz1NFuVJ64D6if4388w8PMWMKe36Kqm2+V9t964+rOn4Yvn3REu3YooO4bSi?=
 =?us-ascii?Q?MJPlboj1E1KGZvvRD+sJQcvgD1GoDyQ6wknPch9t3zJi4QpaLFchr8mK6S2c?=
 =?us-ascii?Q?x2iLSJo1B/Sx2lGJ6g0fVuKOrxa7EmH74a57L29wizcQ5yC0ArnLxk0aQ4gH?=
 =?us-ascii?Q?Ir13f1ow5WS4IcX/11UDmXZD7BW+OQAO/MuXuYEWSSWRxssmJRWWQFAFNWB4?=
 =?us-ascii?Q?z/torniE12lwHjWwKBsMsDA0CmaxEhuFq4WfWiBPutcRL3wzJXkjweFtr4nd?=
 =?us-ascii?Q?Dcngr+56ww3z7crpqBqKoo17vYSaVcW7faauLJHsRo3Ns3G1u0DxIQy5ukeo?=
 =?us-ascii?Q?AF0myy3j/DYmPRpOIOIZuDvLhhDawY8aTnC38976eup3l7UMuZPmpzfvOa3v?=
 =?us-ascii?Q?6MMBOauukNAAZ8zAJivfg12UZpnXJal4WZL2b3kphbhOne8M99FZgLjM3es8?=
 =?us-ascii?Q?TxfVY7C6Kfej7+H7KPUHlHCuQhGN7YwmUVbXNI+BZADYv3RO8pONC3Fm7r07?=
 =?us-ascii?Q?A0AEi4pDiwBrekABEnzO3uG7Fphy8nG6AOE2/am5UGium5msLNdHZziH3jkK?=
 =?us-ascii?Q?fue00pZsSflxo3Rx6PPqg4P1crGDE82ohqRm9E2Jro0fb1AbSJnPW4kp9E5S?=
 =?us-ascii?Q?3LgYBrhihRLmXl/UyXSRs7Nw9ag1jaKIJMw0a8wVf0m9xJfWkHF6Zh3rRJ6o?=
 =?us-ascii?Q?rPqz+54DhSDa7XM8PNDYehIGiayRP9HQ2Q2BJWC5U6J5cPRDEzAjj38ZXGMS?=
 =?us-ascii?Q?rpYroUd9Dr9XB4PQRSJSKA7QdxU+/q6+xr4qZe2MGpTaC/3NU/1CC3SwcZ3t?=
 =?us-ascii?Q?L6ffnDw/SU7FSJaZyCp05cEhVcIJKP1wW800Ni6TdLOAbzlMiRbm2f/V/MQN?=
 =?us-ascii?Q?pZViE1HKLuUfKeX4lBYhhvfuMNPrjJTXWWtj9JgCfNg3tFyDoYRspiG2RZH3?=
 =?us-ascii?Q?UT3Zw+Su3nCGZ//ufADIV0QHWbNJNtGmEo2ws9njgmbz7G1ypSFylkUrc1ZT?=
 =?us-ascii?Q?tn6P07LTSnJqS/CButgURmKC2AyF64EbnxSWWrR3Q0/q7x9sab5v0NJpD+b8?=
 =?us-ascii?Q?ORLruIR5RsNzkae6v0moVmA4JBqV/8IZqw6AtnfSD/6tQyoaQCt6sYXG6tvn?=
 =?us-ascii?Q?V9nTh0n8550BkwtleMcpK8y1K3hpCGQRqnolnVBPaNyNnufIYYi9hwYBh8kY?=
 =?us-ascii?Q?udw6FVjsSztwxLls/b0/COqz1J9RU6/xsg+UhrO+YTjug9jXEiTEBN/Gi6Cr?=
 =?us-ascii?Q?eZUwOsWjLQLfb4fIAGd6IvUeAq4PpWzPtPMrVObH87it/CGXfU3wMer2xmCU?=
 =?us-ascii?Q?DUDM/dddX1wEkmnOeXWE5bRRHC4WenUL+cKrJ5ZDXwCeD/t6A8MWYrFDmCpo?=
 =?us-ascii?Q?F3cAw6ImwHlvTP/ZfVJXP5LfPamcN0j6uCr6YGQGl2RaZDCvtrVXFWIlvAo5?=
 =?us-ascii?Q?v6sEqlhSxHK15n0DNOStVNV2+oOy74pkaC0cNS8/a+lgfVNisMb5NpGZI8rV?=
 =?us-ascii?Q?rc0TFIT55EC2PNyuYe654RNrm7DyTaOlQw7Lw7WR1bpYDDXLYzu/qTl+67gL?=
 =?us-ascii?Q?EoTQTEWpM+CGB0G3Pt7VnOXpU/dXR+FclF5hMaON2e7KRODQ6put0ejxcQOe?=
 =?us-ascii?Q?4Vs82YYh0LXRkSYLvM9ZmWF6UqtZ9vM=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a74894-ba96-401a-cd41-08df479d5754
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:02:01.1610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DelMnaM0TY3CCLnGtDnX5iKhZMDZmK+SIoUsl6xkKk6O+VB5RbWvkIInDl3kr4IhODlsoRFk08BEGiWyBTEOTI6etUUdh5zAl8BF2bCN3ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1768

The HTS register is not counted in output pixels, so "hts - width" is
meaningless: for every mode hts < width (e.g. 1744 vs 2592 for
2592x1944) and the u32 subtraction wraps. v4l2-compliance flags the
resulting HBLANK range:

    fail: v4l2-test-controls.cpp(413): returned control value out of range

The timing generator counts lines in internal clock cycles that cover
several pixels. At 30 fps in the 2592x1944 mode (HTS 1744, VTS 2006) the
line timing is

    HTS * VTS * fps = 1744 * 2006 * 30.01 ~= 105 MHz

which is half of the 210 MHz system clock. Use 4 pixels per cycle, which
gives an internal pixel rate of 105 MHz * 4 = 420 MPix/s.

Compute HBLANK as HTS * 4 - width, with a step of 4 pixels, and report
the fixed 420 MPix/s as PIXEL_RATE so that
fps = PIXEL_RATE / ((width + HBLANK) * (height + VBLANK)) holds. This
rate does not depend on the bit depth or the number of MIPI lanes, so
stop deriving it from the link frequency.

Fixes: 3aa9296a23ec4 ("media: i2c: add os05b10 image sensor driver")
Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 38 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 0d248d3bf0c5..4bcf9e354694 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -113,6 +113,15 @@
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
 #define OS05B10_LINK_FREQ_750MHZ	(750 * HZ_PER_MHZ)
 
+/*
+ * HTS is not counted in output pixels: the timing generator runs at half of
+ * the 210 MHz system clock and handles 4 pixels per cycle, giving an
+ * internal pixel rate of 105 MHz * 4 = 420 MPix/s. This is independent of
+ * the bit depth and of the number of MIPI lanes.
+ */
+#define OS05B10_PIXEL_RATE		(420 * HZ_PER_MHZ)
+#define OS05B10_PIX_PER_CLK		4
+
 static const struct v4l2_rect os05b10_native_area = {
 	.top = 0,
 	.left = 0,
@@ -872,9 +881,9 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 	u32 hblank, vblank, vblank_max, max_exp;
 	int ret;
 
-	hblank = mode->hts - mode->width;
-	ret = __v4l2_ctrl_modify_range(os05b10->hblank, hblank, hblank, 1,
-				       hblank);
+	hblank = mode->hts * OS05B10_PIX_PER_CLK - mode->width;
+	ret = __v4l2_ctrl_modify_range(os05b10->hblank, hblank, hblank,
+				       OS05B10_PIX_PER_CLK, hblank);
 	if (ret)
 		return ret;
 
@@ -1260,23 +1269,10 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 	return ret;
 }
 
-static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
-			      const struct os05b10_mode *mode)
-{
-	u64 link_freq = os05b10->link_frequencies[os05b10->link_freq_index];
-	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
-
-	dev_dbg(os05b10->dev,
-		"link_freq=%llu bpp=%u lanes=%u pixel_rate=%llu\n",
-		link_freq, mode->bpp, os05b10->data_lanes, pixel_rate);
-
-	return pixel_rate;
-}
-
 static int os05b10_init_controls(struct os05b10 *os05b10)
 {
 	const struct os05b10_mode *mode = &supported_modes_10bit[0];
-	u64 hblank_def, vblank_def, exp_max, pixel_rate;
+	u64 hblank_def, vblank_def, exp_max;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	struct v4l2_ctrl *link_freq;
@@ -1289,9 +1285,9 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	ctrl_hdlr = &os05b10->handler;
 	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 
-	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
-			  pixel_rate, pixel_rate, 1, pixel_rate);
+			  OS05B10_PIXEL_RATE, OS05B10_PIXEL_RATE, 1,
+			  OS05B10_PIXEL_RATE);
 
 	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
 					   V4L2_CID_LINK_FREQ,
@@ -1299,10 +1295,10 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 					   os05b10->link_freq_index,
 					   os05b10->link_frequencies);
 
-	hblank_def = mode->hts - mode->width;
+	hblank_def = mode->hts * OS05B10_PIX_PER_CLK - mode->width;
 	os05b10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
 					    hblank_def, hblank_def,
-					    1, hblank_def);
+					    OS05B10_PIX_PER_CLK, hblank_def);
 
 	vblank_def = mode->vts - mode->height;
 	os05b10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
-- 
2.34.1

