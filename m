Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020142.outbound.protection.outlook.com [52.101.225.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7466A36E47F;
	Sat, 18 Jul 2026 20:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405455; cv=fail; b=MyqCFYT9tv12YlprYyAx6M7wFQSL75mT2PyyHvne1KpOfVD2Lvm128TSMmqUEOVqTZFESJuAe876bo0JND1af09+yOYrn6H49AhKdN1w9Aed6xm/D8hJkdbwJqUO8EtWqJNpHASvzNOSRPnKmvwZVMeShU+iDESCTvPGPbo7AVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405455; c=relaxed/simple;
	bh=hwnCnPsUnIQqYp9EnGZ1aeZDDaq/xdYMNdDUb//gUkI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S3M+y7gq/AoUwmHn1lw0Hef+aMdXx+RRpPK8RGBhBzI0iH3dXvZrWi67hzOA9F1Vn1m6PrbZ6DY1ZXEVp8t2CBO2aXfbKK66viRb4YKdFpUmaxk1YewmBcthvAEOQkF/1TX9Xy69DDdx6OStE4STUtTOZIgPTpSc8IfUsnJF4uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=QT9r8kAw reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="QT9r8kAw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTDd7ox4LZdEHU3cUQv8yz3GDhaW/2ncFJWi1uzb8et9i3VyHwZwe59ayV+Uw5P/mNUD/r+F/V/+oF0x/8eqoYfMdza2GWOjh7Dsxif/ZJHgxecw0yh8r9vK+6n9wZi+n1ARFxQEWJ7Lg3tng3Or92YEYY2wZ1Z2AhOzjduProVVRvvLkBvMPeqRX37iJPZUoto+JueXcSqeDRYLOb2pfKLuT8aJSk/f3j+cs9Uru7w09dAYYE4F1BqGEv52hG9hclsZJlF4y/w8aegq4fLHxz7ijT5sZQI8DqeYWiD8vHJDexuLA/09+btlb28v2YJJ64VuSIoAYt9RcYgt5joaKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZayPR4m6i3n1r+tgHtOcU8g2OmE7F4DmJdIVnkP/w8=;
 b=w2usz5EpngvBdi4H7g23/AwK+NwjbQqilbFOsKQDxXP8VYahcsPa1mtlY6gTSDGi0EtmOI6f2NFaFPcohaTbLWhVvMZY2LrcrRJmKZs/ufxoP3lwVciec0HBmU73mbwbog3TIc83VG+kPHOYQ9o8ec4WAU3bgEPORg9qB/PvDuQFqrNZH2swO1QefIUCi7WOPi50FS2RSvTsA6/44zvXZZYa51wHq1PkQ53Y/cGDhTJHPFdSDkUObKYprL4xu+nPWdRFtoRASubvyv8kdXiEDGSEu1n60HpQ70fBOzXu/MZ77s6jSY37ibiQZHbu/lxejHvVk4pp/MGXc08iPUSjZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZayPR4m6i3n1r+tgHtOcU8g2OmE7F4DmJdIVnkP/w8=;
 b=QT9r8kAwEogxoNzyOkuQz7wcaMdOthcSQXHVzPWUew2b6RVbCNCYfYGs9ccXgYAm5pCFsFXoDTFD1IVCbEwOw6IvwGzGAESW6EldjzphCw/93urgUHUV/sI6h65bWrMEUJvbS0bN4JyTjf8mM7xyEfOGo1A1+DbghhStBz7yquznq289XaUpZUpPh6QFIlRRxrvJnVYNfOKsyCVBCbyTl4fhyypgX5r7c07xDNfpSg1p5NLSTkE2DWfQ5VwQQZofXGABeAg0PSkQB7VtgUuVt7+zuVpXR4OUJmzl8vAOSTmc/eqQibOJ/CNWPTjZBRZ/b6aHJb8kLTAMjGznVKBvIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0774.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:131::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.14; Sat, 18 Jul
 2026 20:10:51 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:10:51 +0000
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
Subject: [PATCH v3 09/17] media: i2c: os05b10: update pixel rate on 10/12-bit mode switch
Date: Sun, 19 Jul 2026 01:39:00 +0530
Message-Id: <20260718200912.16001-10-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: d28a3ef1-bc31-4abf-b693-08dee508a9fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|10070799003|1800799024|376014|23010399003|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	FRlTeWLVx9eg94u8TfYeZ0AFfoNhJ6DL7PfCXhbRMbs/ytKHevBNJMRc84k28xsrF97vo8w/sbCQ8WtpI6VBp50f/0xSnuPixauSv3C3AChZ4Lh6OJgGt65LWTBuGdC9fS78mQt8uxfTvZpwWzJKUMUsIhhMvtaUYRgdyuUL8QItXQd3oPd+hFEvGgKs6c07/jr2zXHNdBr+ga0/Wza5f/sZpMx72FTvaB6mi7hdj2P/4qDE04tKiCi3bxUMagGMYS55hssH5g+uOEOT9iF2ayBonWOQHIpVVywpSdOlUfhWl/iTDoCqRL5qxKn1PRRIXLqvi4FXjMreT3W7tFxhMntmVIzW7gphygro6mdtN1KMRf6zobI/lrTe8v+LDJ7I3bb6lS4ppy15766KGPRG2z7y6OTXNurE9t6DpyzEYZIYVTlmNnWhaG7D39fybGbUtUQ36Z4ju8Iezk2E2N7tZtpgakiLg8FBHz5xrtQ6TeHHQ559nzAXUqkYpr8tIl+0ZW1I7762ZelBctk8ckzKLxvhqsyKmhowRoPi2VoEEoQliHoW7ahDpztpnzOlR6Lzp3DC9F8bQKtb1I8tLEzuTe4Fuxuoqs2NAokwpH16TyZHqN98UD/bLJIa2jQbQ8BFVzVE2aPsMGd9Nm934Nqhp+BRK1vNYBP6HKeu/4vq+jU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(10070799003)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9hNhn2OJo/uvv7kOGq4sZaKN+M3ndFsyP/AMC/EH0qNwEs/sQi2uoBM59Xii?=
 =?us-ascii?Q?kUV1eoxObbNEBe7cDt2yL359tMZCTb/0iVBzrjOAUhcgOZ+s7fBC+ejw6vW6?=
 =?us-ascii?Q?SGLr7/hblZFoGO75L0+c4mhcJQZ0gdx/c708o8gZ26rldkhLlvn4839a2nw1?=
 =?us-ascii?Q?mjh7j5FclS4QKQbMZxufBwXSEHfJDFz+ZvRllxIhKORM4LYLWay0zUzTwMid?=
 =?us-ascii?Q?MKdp3l/5ZMMfIHX9IoExB6D5pHKzI0fMVh7js3QpES77E8yj1oU4j8BDtTlx?=
 =?us-ascii?Q?o3XkY8Us/VvRWh82tCOmXr+PXRLPDw2lfUl/PHWa26fyRSofA2X7Drkj/GQQ?=
 =?us-ascii?Q?SHenazH1ZriVy27euOzpgPshr6Taw70fODjPLjxfVyRiwua/FcyLoHmZt/Vy?=
 =?us-ascii?Q?va/5CBRKoSEmQplRWyYWQxTTWX2xv/c/xT/BAJS1vKyNzwxDBK7LWwqJHQTM?=
 =?us-ascii?Q?GEBaBo7B/9jOx9Zr7kRZ9HDy15OEkWnGHMhhQ4bDKEKNMHfCJEn/I5gfQx2o?=
 =?us-ascii?Q?5a0uqMUgors9Z0sxDpLUkI8X7jtfXHML91NC/TaK4jNFxpBfygixKCNc7AFH?=
 =?us-ascii?Q?O/YpQ3cR9/hvR43F1NgEIuGulgz+bTqejsO09HFFGac/+LRARGDDt3ai1vE+?=
 =?us-ascii?Q?MviMQQheYuilYrDuXWY1p0bOP96cDf3D+ozHWKI+wPIZl/miuYWusbnOolCv?=
 =?us-ascii?Q?kwcY2ehunBxtl288HMyza62MUq95Mp0UBeX2t2dQTEBPXMPgXWPFndc+g6Ft?=
 =?us-ascii?Q?VYV083NzQvX7YjWJdbi3czjErqw2zV/WIUWVtiqUJfuD8Q2zOtGW5ggsc2W0?=
 =?us-ascii?Q?5bAR5EURWjyptfT3CM6E02NhTETUJk+v1Hve+opxFyPXRDhGM0q9yMgBlcBM?=
 =?us-ascii?Q?T9sxpBNEN1cz9XEouq9QpG/uNYjZXZHYOnFKnaXBV58n1ue69SgXU3lkYvMY?=
 =?us-ascii?Q?Q0afVsc/9jBKW7Hzix2VSgTNet2jjfcRnsZL5P6opb0t+2+SgOY3GPEIofID?=
 =?us-ascii?Q?24OIqnB1kIOF362rjqd5rtIBr4qT/aueRNdhXqlGy9mDpL8wjNYTiVRKxz4M?=
 =?us-ascii?Q?mJFfeBgU+YNhZK4MMViBJqVZfyXUPkYroUw+bC9Bi9hqj91n/8+b1jd2d63z?=
 =?us-ascii?Q?NjNbu4Cvr95wjHdVS2BjuO4L8swzFLtU+lorFvz6D6W8w0zsyz2wvXsctH2E?=
 =?us-ascii?Q?d5QmvkVrb/BtiRy7wXMZil7SzTiPHG6NWdAtWByjSiXOaL60hxiWv1j6clU2?=
 =?us-ascii?Q?XbKzefceWP5s3Yr+uAr+OkSv/O8Gz5by9PoP8fiFCGsanCxy+UiO2UPfhbhJ?=
 =?us-ascii?Q?O0aIbivJzmqRlE//n450ryd9YkKO3tZDKL2Z26so3RmW/S+C2FBXa15tXSpx?=
 =?us-ascii?Q?M3VXDaNr6umcrvyrSsdtAXpgcu8k8o/+WFwsYVIDlAaQq3luj5st9YuOFloM?=
 =?us-ascii?Q?7VlILAb9uFVyFQT7PjiVboyS9ARybZL97GO9CfcRgUuU3iejahj5fjKsnAja?=
 =?us-ascii?Q?pSymkjVHg5vFT8ibTNbHqBZsihgd6aGxzDWmHjr3jailBo6MIuXEX11MlcEl?=
 =?us-ascii?Q?wwsFaxRyKo10DDeaS6+h1KbSWEp0to9OAtu4DB/pPB1OFKMeucUAUds08dLb?=
 =?us-ascii?Q?Zf8Wt2Rb95+jxyiiQUtW3kFJu776TuRl2qx79qlu5m7JC4ypaNmMRHdTH5kD?=
 =?us-ascii?Q?xWM6ecpt82W4Pz4m6SRezoub+cnJ2SOVOgtPwJHXZ9nsTvFNGdmfuibh05s0?=
 =?us-ascii?Q?lxepxOm+04gjebQsYSfKLvfnqNwK+3bJS746xwB5m8q+6YYwakSKDHuPce7k?=
X-MS-Exchange-AntiSpam-MessageData-1: JC10zvTTt5TrG4VNSxKVjxpm8DGwXUmF4jM=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: d28a3ef1-bc31-4abf-b693-08dee508a9fc
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:10:51.0291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDu0xPlQ9MPeRFC+6JC4U4Dl2yV44i7ZpeU+1rS9Z7RWQ+dbUJrkP7PFgbJfrgLvgOhWw6PIQzP3SEa67Nqk53wgrf8hIdnE93+vGjVVmns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0774

After adding 12-bit RAW support, the pixel rate depends on the selected
mode bpp. Store the V4L2_CID_PIXEL_RATE control pointer and update its
range/value when the mode changes so 10/12-bit switching reports the
correct pixel rate.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 41 ++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index e11a3c308299..3fd788bd8b20 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -473,6 +473,7 @@ struct os05b10 {
 	/* V4L2 Controls */
 	struct v4l2_ctrl_handler handler;
 	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *gain;
@@ -704,12 +705,35 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
+			      const struct os05b10_mode *mode)
+{
+	u64 link_freq = link_frequencies[os05b10->link_freq_index];
+	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
+
+	dev_dbg(os05b10->dev,
+		"link_freq=%llu bpp=%u lanes=%u pixel_rate=%llu\n",
+		link_freq, mode->bpp, os05b10->data_lanes, pixel_rate);
+
+	return pixel_rate;
+}
+
 static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 				      const struct os05b10_mode *mode)
 {
+	u64 pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	u32 hblank, vblank, vblank_max, max_exp;
 	int ret;
 
+	ret = __v4l2_ctrl_modify_range(os05b10->pixel_rate, pixel_rate,
+				       pixel_rate, 1, pixel_rate);
+	if (ret)
+		return ret;
+
+	ret = __v4l2_ctrl_s_ctrl_int64(os05b10->pixel_rate, pixel_rate);
+	if (ret)
+		return ret;
+
 	hblank = mode->hts - mode->width;
 	ret = __v4l2_ctrl_modify_range(os05b10->hblank, hblank, hblank, 1,
 				       hblank);
@@ -1070,18 +1094,6 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 	return ret;
 }
 
-static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
-			      const struct os05b10_mode *mode)
-{
-	u64 link_freq = link_frequencies[os05b10->link_freq_index];
-	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
-
-	dev_dbg(os05b10->dev,
-		"link_freq=%llu bpp=%u lanes=%u pixel_rate=%llu\n",
-		link_freq, mode->bpp, os05b10->data_lanes, pixel_rate);
-
-	return pixel_rate;
-}
 
 static int os05b10_init_controls(struct os05b10 *os05b10)
 {
@@ -1095,8 +1107,9 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
-	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
-			  pixel_rate, pixel_rate, 1, pixel_rate);
+	os05b10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+						V4L2_CID_PIXEL_RATE, pixel_rate,
+						pixel_rate, 1, pixel_rate);
 
 	os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
 						    V4L2_CID_LINK_FREQ,
-- 
2.34.1

