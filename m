Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020119.outbound.protection.outlook.com [52.101.225.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0378A2FDC53;
	Sat, 18 Jul 2026 20:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405517; cv=fail; b=jq3GCOGIEf6fnaBOUEcuw7D26UM2+hqiuLly2ld2LxezHtoqTmED4T8OPR/hc4U1/yGVLVfwyK+GFagQDNNDfyoZKYMzlAngloy3lSiIqZQd/wh3hUjw7z6PTFY9WUpsChoJQO3zQagQ3NMtoRJKqy77gUrEys/zgQdBtFxdIdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405517; c=relaxed/simple;
	bh=67tQ3Hr5m3yF4yJ2O3ZQ/MmzVQudU6Sj2P+3nyYHdWE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=czkV4aewCUE7l5vMXm8ag2fcxmbJ4LHb3KlJEU7wPGHMo7GkMUdA+rskc0/sXjqAaWI3+iZY1tlbVp/plRMeopSxXSDDmZw94EUMQLQjRUV8rdMD9+rICRZW2GjgtnOxmIeX+xHm5dD2Qx/uzNALKACp7qA4zIG0HRZ5vqmecnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=IK6u7ubm reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="IK6u7ubm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gU/TU/+H5R4zQA7b1ksG4ZMWEpiWxUI740tF4J2fPXYNM0mQIcbI5+RBYhPDU/c+ntWtpmZV1guMk9gxSJc+4VgYnryShVyHNz1Uywxm88ZNgN/eYaDz4NFHhq3yk6ygZ5i5DpkLTOHQDb5D3uVGl8tHHSB+6WMKbc8ShRj6eebFRVhIcVB+4laXtYqOvUpwegUi3zeZUegM7rcYMs8vg+I+dIoY7HTHYaLNicUqN5raA95fb+M1POuAlimult20nDRJY0eQTWaGp53WlydX8vrxk3Pov15KEulIxSpfYvC+vPZngmGhk4DG9FjrCXE6hg7WXpNmGK+lClP8g7DAlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PflYzfzrCl5/JCCSCDtDtLWWlWynimrdFaNNhgKfm8c=;
 b=OGcUIn3sP8lY2MOoaKSOcZNQNWUC3Rx/1XhadGLFlPaqRFKdEYdd20wk4MBbhj4F0c0z4J+rpBoeLytfl5PzasxkpjymMIbdKHWU/lqSLNx6KtIiVUaBe2I6CcduK7ExlPtJBv9s7KB2v2mleTKyhUcGndoaWHV77l9TwwSQsxo65jySTVt6gGTUUW2Wt08dRNJAYxrXJiiiLhxHPPCwJJHTVkySwYXyp6RkBwOSbsLJ+Mag9OYigh1lB+9ocRRBhHSlkNrnutXM2PMvVkW9jnJRiRNS55AocypBLf9Cca9TIk9/XST1XjpqBix7IQ+VRSxjYjIs/xky5qJgCas+gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PflYzfzrCl5/JCCSCDtDtLWWlWynimrdFaNNhgKfm8c=;
 b=IK6u7ubmZ7ussyrdN2F/U//kr627e6J1PfQEe79CDjBzA4fD+GfuVgOh3kiqDus1L+mONPkWXOu4/basot3lFrQIerDSl4KvgR9PegzZN8VZCQovPrj2u0H+sVWH9p1Bv2/fSjCtljiWm2F6oawN/DJdmm4D3oYHKb4Z3XirhdWv3bFtbZs16hZo1hjR6nz1vssSLUwWsaHAXJASU1b9fmcrBNDy0LPF8uNlaPf9UNyl3Nf/DClex0sR9R+actWVBVcmvCdXuoyZq+/dIcUz8A0B9Wy9uWJQWl1Jgx7SNUl02R1AH9V24WsQnGLSlryYB+iGCjDdNuPgki6atN5o4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB2078.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.14; Sat, 18 Jul
 2026 20:11:53 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:11:52 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 17/17] media: i2c: os05b10: remove unused control fields, simplify error handling
Date: Sun, 19 Jul 2026 01:39:08 +0530
Message-Id: <20260718200912.16001-18-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 0c7680c1-8366-4ec4-f429-08dee508cef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|10070799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tdXWpqdg6khxo+7NkjZwJW0jj0UTnnQkHBRz20EoCdysJEyBpjceIZB+D5xbn/cPO3+XuQIH0uAvGS3zlJCO+vM0aV+KwxMGjUGpKF23TbpLtkn2gYH2ulg9ho1UgOM9AT3upikaLKpBC9rZrh6mH4ewBToF70kmzm/YB/yDPoYT9TF6z0Dyjh9IZ+l9h6z+k4nl2U+CbQu2FdpkQMpq08TqkK+4R95nEAzfXW0btEZOpo8W+5JabxM1xRKqeX8UOdwp2WYoqUU6Tj/syI7qh3M5vFDQYyqPUNMiqQpHRr728iwiSC7TUsLU0GSWex8+yzxz+6wXjzz1dWdJgll0unEHe2q4PI9fXjgd4gg0lMgYmxRi2i4rmOyIvECW4v1qpWDaPoW33/eyQek8H6Osw66y73gc6bYs5DzWVvMR6Lz3EGIbWavFsz2LaDGvslEIDeSqV+E2Fpo45/I9ASPbbnKdXiih0lAjgpssU2HqDvyBrNOwBb4Tl3dyurKzpl/fqK5ZgSN1iWRtZkBgTzFt6S9tLDB8tcDScSYTaSSKSUQy4km8oG993GvxcB9dlcNqrFpZ2vcPR4u3kvelzL59MCBvbXph9TE9J23+lwjze0SXMpyDu5avJ1HlHVbFixraJr/TUH9dmcH3J1Fs5uABiKW3ml2ZarWfcjebxH0sxU8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(10070799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LchqtoJO1JIMXlmPQm7wy1gxTsoVOsFwM7upnIxnpbZdzTv+u0SAumyXLhEb?=
 =?us-ascii?Q?tkeGg5J/gUJd7KNL8zdEdaVoOM0svzYwfI353bmrXm1+fCuky8NXq/dW0Mic?=
 =?us-ascii?Q?6ux04+4sxc142ZIZqfCqxHvD5X7JLdaFzHVK8mIFDjQLKx2hGCwwMREOIwpQ?=
 =?us-ascii?Q?O/ZeauEjnC9MXvmmdKMpJzg2V8GdxSyWnW7ISlTnicvuDM6DcDzKMM9pmvPO?=
 =?us-ascii?Q?aO15OQ7+gB2c/PFPUnca3NuKGZTWmLEdrygICvg0ssnXyk1qTsh01qouPvGi?=
 =?us-ascii?Q?XHBXvAfGf+hsG6yqxPbuOKzRU8SKooxbI+sJdqisSGXkWKLrC2zmXToZUEtq?=
 =?us-ascii?Q?O3bxTVFaUxYVBIte5rA+7BjtZLz/HgCx7FsXnbx3UIMON/QTHuSs67JD988l?=
 =?us-ascii?Q?tHGkhY+h/ZiTSqoQEZh5X+WRf4qHzk4OryMYPWemo4W5rXIpPiNgLt7DhWh3?=
 =?us-ascii?Q?eKAHsBLswY8l35Vb09Kudpzc3x+N4k7ogWiCN45112GVYmpWMrHj2VOccbG7?=
 =?us-ascii?Q?KgqplgNT2odqKHSTfu9zFN/2dw4L+DorJ8nTIQYIzyv7hDUErrNeIuBd4LCo?=
 =?us-ascii?Q?1S63OWIMYuZoOioO4vm7TuerkcIfnyrz2q9Br+Fo+fow9TPxxNQ8Iv9NPqRo?=
 =?us-ascii?Q?G8GNqtSyUnnk2XcFoouZLWK6XrQ1znJ9ZPpvN0nX6N2baBuUOJDfkxRTESJd?=
 =?us-ascii?Q?3U/emAA6FK2Bfmad97bKQ3d3e0pVnE/K0/0rVKVv4WmmDxngsOf3uyx5VG5t?=
 =?us-ascii?Q?9Sri7vbaUZ21z/nOcM0fyFb46pSP6Etl4W2bKCwpl2porbOcdn0iW0/EaDBr?=
 =?us-ascii?Q?fpuyyzWUEqAxht0Y9dvcvFJnmLiDCmPgEBq8yxRnTebfiFZkTAJOyx8rbIcI?=
 =?us-ascii?Q?bd+dgoQTMEqZWoVFNsTsGmhnFyjMUDVgBDeFu6BwxFLCCbxLq5pMe/ROgB6T?=
 =?us-ascii?Q?triXGzS2wIZF+I/o+HfppxANmTFjCvSTBmJrRdVKMk3lcI0HWEaei7tND53X?=
 =?us-ascii?Q?YSlnQUKKhN6uX3j81RyuLKlKIVG8y07rpEqkxkD6sIYgzuVdBUnGHUjDHZb8?=
 =?us-ascii?Q?t/NNECcf/gDMtawhgyEx2+Vxttq1NYxibaM51fUWYQHgkyEsEgv2DmwMqN07?=
 =?us-ascii?Q?DVSHUI7lLSieXlIsroiL8/5KyetrZtLW4lCjmzdlNl4ANkCl//iCXsas0LUL?=
 =?us-ascii?Q?xeUsgYxoKtZMS/6AAW/WDOjvAc4frY7wSErmsIiMrWgBVhVMaANTb883NvNo?=
 =?us-ascii?Q?idUr5AITmNINoHqYjH3OeFcwKxFSpg5Hq2nhIeiUFTT+ywIaVApPlvIQc1S1?=
 =?us-ascii?Q?1iX0NDMwYub5zkyOv1P7LoSro2vUiHc/i6bdux06bh8+XRUu2VNgqf/aFmXF?=
 =?us-ascii?Q?s/coTYWPhZ+mrdiaDVUUd5zrMBVmCPsX2JRUFHgEfmccEe33fPLAFL+uSEdR?=
 =?us-ascii?Q?6Z17rXjaa20y3mht13hEEej9RQnqw0z1UlGITJUj+Exqun7nrcpFc5xGHjEo?=
 =?us-ascii?Q?wqBmRDvmHpE4IFE5QjGZ3njt/oPwZpFT+/jKq6SkEGqqGKfYoWCBXz+i7IhO?=
 =?us-ascii?Q?pyFBG3WqicQBZ3ILoN2YjCERXYEwWD10SN7W68PnXUoSVoDpm81zB+EztbZX?=
 =?us-ascii?Q?TPbYK3jJTP7e2KGqLNfTzjm9li4wFjud4YQD+NQhzB/wq4uMBbz2FFr/vUAj?=
 =?us-ascii?Q?OQMnTPEdXmOHT68AU/K8xAaotKe/kJljbbrfz18Hc1Mb05pV2tpp3oh1xpQ3?=
 =?us-ascii?Q?dEagGKW209/FtKerssgRJJUx0jKabCimlVbrrR5KHCsRHSTJZ5Z96JTArW0/?=
X-MS-Exchange-AntiSpam-MessageData-1: xO6r3IpDT161S+7dVuWiq1fKitdfPqqK1ao=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7680c1-8366-4ec4-f429-08dee508cef7
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:11:52.9158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jIyN6ysS0hmz5lZFjY/4f+igcK0oeqfTXJJ1UtAY8a30CT/p3wlT1ropOH24WNMVS87yb/Dx3LYHmzX9jLeSHZndljiQabPW8A1zZctlNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2078

link_freq and gain don't need to be stored in struct os05b10; make
them local.

Parse the fwnode properties up front and register them before the
single ctrl_hdlr->error check, so all controls are covered by one
check and the per-control NULL guards before setting flags can be
dropped.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 55 +++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index b4dd3137ad5c..c355ac197eb2 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -557,11 +557,9 @@ struct os05b10 {
 
 	/* V4L2 Controls */
 	struct v4l2_ctrl_handler handler;
-	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
-	struct v4l2_ctrl *gain;
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *vflip;
 	struct v4l2_ctrl *hflip;
@@ -1276,9 +1274,14 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	u64 vblank_def, exp_max, pixel_rate;
+	struct v4l2_ctrl *link_freq;
 	s64 hblank_def;
 	int ret;
 
+	ret = v4l2_fwnode_device_parse(os05b10->dev, &props);
+	if (ret)
+		return ret;
+
 	ctrl_hdlr = &os05b10->handler;
 	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 
@@ -1287,22 +1290,18 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 						V4L2_CID_PIXEL_RATE, pixel_rate,
 						pixel_rate, 1, pixel_rate);
 
-	os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
-						    V4L2_CID_LINK_FREQ,
-						    ARRAY_SIZE(link_frequencies_4lane) - 1,
-						    os05b10->link_freq_index,
-						    (os05b10->data_lanes == 2) ?
-						    link_frequencies_2lane :
-						    link_frequencies_4lane);
-	if (os05b10->link_freq)
-		os05b10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
+					   V4L2_CID_LINK_FREQ,
+					   ARRAY_SIZE(link_frequencies_4lane) - 1,
+					   os05b10->link_freq_index,
+					   (os05b10->data_lanes == 2) ?
+					   link_frequencies_2lane :
+					   link_frequencies_4lane);
 
 	hblank_def = (s64)mode->hts -(s64)mode->width;
 	os05b10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
 					    hblank_def, hblank_def,
 					    1, hblank_def);
-	if (os05b10->hblank)
-		os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	vblank_def = mode->vts - mode->height;
 	os05b10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
@@ -1317,12 +1316,10 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 					      exp_max, OS05B10_EXPOSURE_STEP,
 					      mode->exp);
 
-	os05b10->gain = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
-					  V4L2_CID_ANALOGUE_GAIN,
-					  OS05B10_ANALOG_GAIN_MIN,
-					  OS05B10_ANALOG_GAIN_MAX,
-					  OS05B10_ANALOG_GAIN_STEP,
-					  OS05B10_ANALOG_GAIN_DEFAULT);
+	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+			  V4L2_CID_ANALOGUE_GAIN, OS05B10_ANALOG_GAIN_MIN,
+			  OS05B10_ANALOG_GAIN_MAX, OS05B10_ANALOG_GAIN_STEP,
+			  OS05B10_ANALOG_GAIN_DEFAULT);
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
 			  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
@@ -1330,33 +1327,31 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 
 	os05b10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
 					   V4L2_CID_HFLIP, 0, 1, 1, 0);
-	if (os05b10->hflip)
-		os05b10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	os05b10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
 					   V4L2_CID_VFLIP, 0, 1, 1, 0);
-	if (os05b10->vflip)
-		os05b10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &os05b10_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
 				     ARRAY_SIZE(os05b10_test_pattern_menu) - 1,
 				     0, 0, os05b10_test_pattern_menu);
 
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error;
+
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
 		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
 		goto error;
 	}
 
-	ret = v4l2_fwnode_device_parse(os05b10->dev, &props);
-	if (ret)
-		goto error;
 
-	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
-					      &props);
-	if (ret)
-		goto error;
+	link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	os05b10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+	os05b10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	os05b10->sd.ctrl_handler = ctrl_hdlr;
 
-- 
2.34.1

