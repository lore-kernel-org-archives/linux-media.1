Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC93B415B85;
	Fri, 21 Aug 2026 06:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294315; cv=fail; b=Jor9LCAwZF7lPURQ+maNGevZx/IpSOTmJ9V+grhYHpQ25Jnw3yUyx6l4NYfPaIjmCo5i9uj8EYlHnb2KoKf5OfV5BXSzVtEArsrnu+hFwS/yxny/I8D4s+ZFPFpQxpRUs9YJOfngS86zE+qtZUmoW/t8SZegxIl+kZEHod9/NGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294315; c=relaxed/simple;
	bh=zGVWxJDwPCyXTIQNztca/LeB2vwKgYTv9DXtSAntAnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UHWCPnjKCsQhpKtMYuK1NJxNd+Jlwji4jGPjEBmtgI2MqNceY+h0l2UrXxQuUsYuGsncSdQXSy+YrLG9D+rerWze44Mkr/4dIfUJHlOQa/70jivZhlXQbjOxvYiHCgl6W0WdnCjmYuk9mQJhINi+t89iYpPWbU9nlUqg40nzD/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=G0L04efF; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="G0L04efF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TW5FjenXaQ0q47IrHAdBi3HGMsOQPZhYyuyMiVrSfFijEj7fdJdPA9XWdpVw05WfPeqEWCShMNqqJgAIiWmMdijXo5RywrMT5Q716Qln2v2ehXeqqZKS+KScflG48khGtMTXyE5++gAvw81FnEQFshThbKqqZgNkXZocu7bZB80WH6CI1qJlHLa+qjV8qFUdRxDyP4i+kvCRPtKadU8U7f5w6YsSOIkrndcPD50BAkPsn2unrS9JLVY6w1iG9tAtTfzmwCDruUSl1GIaZHi9gI+UWiRyAYv8fBRKaR7xurjS7KLVFlsOsBstiSKVhYazQbvWzrAd7wxnYZXRwu85sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbgQP9IB1qeuWabyyqhjfhhNYDDooC2janKkqTj0xfI=;
 b=W8MMmZgbiImgZPueTnBbY6h0IjdGQ17sodhXdHUbd6xfFCFKUhbHR9mBtHTEQDyWwHwYIGAD+kQtsSVtUGolSec35gNrIAIsOMQdNEqv5kJnREF8ug+ufIxxT3Blg/MV2YOz8iK75baE2WJy5z71VVWAbSBHTmfb2yZoZxh4xnrWrXubIucvXx3QEdDNuI/e2sxICYA5ApF4kGygRxNV7AGuMHCQzLU+iSo4pdODgymLWZSxvGJZAjwJJkXrGLaMqEFNEimtD1AALl29o75Ip27rNlbSBrmZ6ZdS+85gfhdSRS1MFnhbKnhrwPNp/kEPjDDnkX34uj+wplcDuNtwcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbgQP9IB1qeuWabyyqhjfhhNYDDooC2janKkqTj0xfI=;
 b=G0L04efFD5p+EIW/d+8p/OTmbkTtArSaN7ZUg9igSEqlHkwyB8Nl+bSVZDiklmVNSXuAdAikmIRUNZ5uhkLCTBKd45yD6Q4uL525dyDOwCG5uaIOYbqoejYSxboUZRHGl7gp8Ww7mTWibweeEZp0neS+7xHkWmOrpl4PhQuqDxHpNl4XCELDVRVF6g/nnVvYmgrvQAAv75VXj7e0bKvLNgw1RoerGILwjWTCiwc9wh4+KrPav3LWIVzS+RQHJs6Tb7LkUyrvNv5Q1yBQqnBZ78tstLKcVzEbnaWQ2BLmtGE2rWt48u4aBaPgj0xUbhBlU1GXvLVGf559ouJKL7kUfg==
Received: from AS4PR10CA0003.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::16)
 by DB5PR10MB7773.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:48c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Fri, 21 Aug
 2026 06:38:27 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::3) by AS4PR10CA0003.outlook.office365.com
 (2603:10a6:20b:5dc::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 06:38:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Fri, 21 Aug 2026 06:38:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:44:02 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:38:26 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 21 Aug 2026 08:38:08 +0200
Subject: [PATCH v5 06/14] media: stm32: dcmipp: configure csi input of all
 pipes on stm32mp25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-stm32-dcmipp-pixel-pipes-support-v5-6-d140efb61d72@foss.st.com>
References: <20260821-stm32-dcmipp-pixel-pipes-support-v5-0-d140efb61d72@foss.st.com>
In-Reply-To: <20260821-stm32-dcmipp-pixel-pipes-support-v5-0-d140efb61d72@foss.st.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Hugues Fruchet
	<hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9B:EE_|DB5PR10MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 602f88e7-0d2a-44f2-1632-08deff4ece5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	U89J+Ql+lkbqJAbRtnTzo346RaPWnQ7CuZXMhMmzH65CYkSSF6b2dZkhPb9b51QOZrv23y5CIlM82PvJyLvI2PaNlRq/1U1zXVFt+adF5FZRhl/yFfUPWbYXExaEvPt11juOgvPPSXU6uuk+Xyei/uk48mJW+Pr2WSulFqk3fgM6MqB+1l5Po2Gkv0FasBXPTol3ooL6/7XVa0ZBHSj8/VeNPWPie/FhfDZAXQIL4X6Eks0ts0FEMQfy4CPeWe8fKwELGAT0yYBQhtKsRDovbbOHnf8hCM9pwJcA6u2eeuFA85mNy3xEjQagVe4oscivY2x+VH+nL51mw4JdGL4jJyT19a+eC1lnZWiisQFk6gkeYCoBvV0pARDHU5ieB2ZhO0VMLxXktt/9/ZsHX6TKlhK5RfHZNTM3NocyurjpI6uTFaB9r9er1jb0mfJMM4qnEVb5Mg+otb+jQZMXClrs0lnx92Hg80g0eIfsbUIJ/GiV2/J0i81xeTSazmBrYYshRU/ljXYRo/VFtgIKwAa+5c0Sb0uj1MrQmKe5dybx/jvRMee2wZeHaRoya25G19LVS4NMubza9kZKrEyMyt+hP/76cmAb/gf9+17KHT4p3lBB+6ZyRx5z71BXR2FBBfuNdse8q/PqmUYX9gFynLWFcsWa1toHCoGt4PNAZIvgN6TjWv8dPLlE4XT6dgOBWZrTKcZajjMPunUbVtFKQyToHA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DTFpn9RzkiRV9Fa69NHZNUblvFqyIzEiv13mI7nUUWN9gP3F/SjkI56Ao6eSbOHjEi+a9UDTedda0372CnyvFVc7kbgcUeZ1MFch6ipz4qQRb0b2/aXaHRD/A+65j2rtrCUU8ky6+TxCmQ2OgM3p+z2McigcP5tm5N4fWZpa/GUgH3b5OLkXihbvFqi5Ir307ILyqYBN1qZTxS0vWsWrEyeoWoGYyD970xyaqH7siHDJm5a8WzFTtzJ/t05ncpSpZ2gsbPwAteqodZ+6///+cWza0IvgK2kLmEm++NX2QBhXUqxe1uDjHbaWRU1W86DIt06zezzrYk3d9E5hk4PZR12EyrML4O9rSSOIb1N4NGLHpLVVz/opEo1lULc+a0zJsIPHfUFPvEbKRVvkFDCy4BD5Ymd/WdZKH5BsSuO03dHgaEqhYlQ2KElxc8vYTsZA
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 06:38:26.7204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 602f88e7-0d2a-44f2-1632-08deff4ece5f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7773

The STM32MP25 has CSI input and 2 additional pixel pipes in addition
to the byte pipe. Each pipe can select which data to receive based
on CSI VC/DT selection.
The multi-stream support of DCMIPP will be added in a future commit,
however, to start putting proper control method, the input subset
has now 3 SRC pads, one per pipe available.
Currently, and until multi-stream support is added, same data is
sent to all pipes.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 86 +++++++++++++++-------
 1 file changed, 58 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
index 75421035cfad5..220e03ea38aae 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
@@ -43,12 +43,18 @@
 #define DCMIPP_CMCR_INSEL	BIT(0)
 
 #define DCMIPP_P0FSCR	0x404
-#define DCMIPP_P0FSCR_DTMODE_MASK	GENMASK(17, 16)
-#define DCMIPP_P0FSCR_DTMODE_SHIFT	16
-#define DCMIPP_P0FSCR_DTMODE_DTIDA	0x00
+#define DCMIPP_P1FSCR	0x804
+#define DCMIPP_P2FSCR	0xC04
+#define DCMIPP_PXFSCR_DTMODE_MASK	GENMASK(17, 16)
+#define DCMIPP_PXFSCR_DTMODE_SHIFT	16
+#define DCMIPP_PXFSCR_DTMODE_DTIDA	0x00
 #define DCMIPP_P0FSCR_DTMODE_ALLDT	0x03
-#define DCMIPP_P0FSCR_DTIDA_MASK	GENMASK(5, 0)
-#define DCMIPP_P0FSCR_DTIDA_SHIFT	0
+#define DCMIPP_PXFSCR_DTIDA_MASK	GENMASK(5, 0)
+#define DCMIPP_PXFSCR_DTIDA_SHIFT	0
+
+#define DCMIPP_PXFSCR(a) (((a) == 0) ? DCMIPP_P0FSCR :\
+			  ((a) == 1) ? DCMIPP_P1FSCR :\
+			   DCMIPP_P2FSCR)
 
 #define IS_SINK(pad) (!(pad))
 #define IS_SRC(pad)  ((pad))
@@ -274,6 +280,7 @@ static int dcmipp_inp_set_fmt(struct v4l2_subdev *sd,
 {
 	struct dcmipp_inp_device *inp = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *mf;
+	int pad;
 
 	if (v4l2_subdev_is_streaming(sd))
 		return -EBUSY;
@@ -298,9 +305,11 @@ static int dcmipp_inp_set_fmt(struct v4l2_subdev *sd,
 
 	/* When setting the sink format, report that format on the src pad */
 	if (IS_SINK(fmt->pad)) {
-		mf = v4l2_subdev_state_get_format(sd_state, 1);
-		*mf = fmt->format;
-		dcmipp_inp_adjust_fmt(inp, mf, 1);
+		for (pad = 1; pad < sd->entity.num_pads; pad++) {
+			mf = v4l2_subdev_state_get_format(sd_state, pad);
+			*mf = fmt->format;
+			dcmipp_inp_adjust_fmt(inp, mf, pad);
+		}
 	}
 
 	return 0;
@@ -383,7 +392,8 @@ static int dcmipp_inp_configure_parallel(struct dcmipp_inp_device *inp,
 }
 
 static int dcmipp_inp_configure_csi(struct dcmipp_inp_device *inp,
-				    struct v4l2_subdev_state *state)
+				    struct v4l2_subdev_state *state,
+				    u32 pad)
 {
 	const struct dcmipp_inp_pix_map *vpix;
 	struct v4l2_mbus_framefmt *sink_fmt;
@@ -391,7 +401,7 @@ static int dcmipp_inp_configure_csi(struct dcmipp_inp_device *inp,
 
 	/* Get format information */
 	sink_fmt = v4l2_subdev_state_get_format(state, 0);
-	src_fmt = v4l2_subdev_state_get_format(state, 1);
+	src_fmt = v4l2_subdev_state_get_format(state, pad);
 
 	vpix = dcmipp_inp_pix_map_by_code(sink_fmt->code, src_fmt->code);
 	if (!vpix) {
@@ -399,22 +409,28 @@ static int dcmipp_inp_configure_csi(struct dcmipp_inp_device *inp,
 		return -EINVAL;
 	}
 
-	/* Apply configuration on each input pipe */
-	reg_clear(inp, DCMIPP_P0FSCR,
-		  DCMIPP_P0FSCR_DTMODE_MASK | DCMIPP_P0FSCR_DTIDA_MASK);
+	/* Perform the configuration on the related pad/pipe */
+	reg_clear(inp, DCMIPP_PXFSCR(pad - 1),
+		  DCMIPP_PXFSCR_DTMODE_MASK | DCMIPP_PXFSCR_DTIDA_MASK);
 
 	/* In case of JPEG we don't know the DT so we allow all data */
 	/*
 	 * TODO - check instead dt == 0 for the time being to allow other
 	 * unknown data-type
 	 */
-	if (!vpix->dt)
-		reg_set(inp, DCMIPP_P0FSCR,
-			DCMIPP_P0FSCR_DTMODE_ALLDT << DCMIPP_P0FSCR_DTMODE_SHIFT);
-	else
+	if (!vpix->dt) {
+		if (pad != 1) {
+			dev_err(inp->dev, "JPEG only available on pipe 0\n");
+			return -EINVAL;
+		}
+		/* Only available on Pipe #0 */
 		reg_set(inp, DCMIPP_P0FSCR,
-			vpix->dt << DCMIPP_P0FSCR_DTIDA_SHIFT |
-			DCMIPP_P0FSCR_DTMODE_DTIDA);
+			DCMIPP_P0FSCR_DTMODE_ALLDT << DCMIPP_PXFSCR_DTMODE_SHIFT);
+	} else {
+		reg_set(inp, DCMIPP_PXFSCR(pad - 1),
+			vpix->dt << DCMIPP_PXFSCR_DTIDA_SHIFT |
+			DCMIPP_PXFSCR_DTMODE_DTIDA);
+	}
 
 	/* Select the DCMIPP CSI interface */
 	reg_write(inp, DCMIPP_CMCR, DCMIPP_CMCR_INSEL);
@@ -432,20 +448,24 @@ static int dcmipp_inp_enable_streams(struct v4l2_subdev *sd,
 	struct media_pad *s_pad;
 	int ret = 0;
 
-	/* Get source subdev */
-	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
-	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
-		return -EINVAL;
-	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
-
 	if (inp->ved.bus_type == V4L2_MBUS_PARALLEL ||
 	    inp->ved.bus_type == V4L2_MBUS_BT656)
 		ret = dcmipp_inp_configure_parallel(inp, state);
 	else if (inp->ved.bus_type == V4L2_MBUS_CSI2_DPHY)
-		ret = dcmipp_inp_configure_csi(inp, state);
+		ret = dcmipp_inp_configure_csi(inp, state, pad);
 	if (ret)
 		return ret;
 
+	/* If there where no other pad enabled, then enable the source subdev */
+	if (sd->enabled_pads)
+		return 0;
+
+	/* Get source subdev */
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
+		return -EINVAL;
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
 	ret = v4l2_subdev_enable_streams(s_subdev, s_pad->index, BIT_ULL(0));
 	if (ret < 0) {
 		dev_err(inp->dev,
@@ -466,6 +486,10 @@ static int dcmipp_inp_disable_streams(struct v4l2_subdev *sd,
 	struct media_pad *s_pad;
 	int ret;
 
+	/* Don't do anything if there are still other pads enabled */
+	if ((sd->enabled_pads & ~BIT(pad)))
+		return 0;
+
 	/* Get source subdev */
 	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
 	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
@@ -533,8 +557,10 @@ struct dcmipp_ent_device *dcmipp_inp_ent_init(const char *entity_name,
 	struct dcmipp_inp_device *inp;
 	const unsigned long pads_flag[] = {
 		MEDIA_PAD_FL_SINK, MEDIA_PAD_FL_SOURCE,
+		MEDIA_PAD_FL_SOURCE, MEDIA_PAD_FL_SOURCE,
 	};
 	struct device *dev = dcmipp->dev;
+	u16 num_pads = ARRAY_SIZE(pads_flag);
 	int ret;
 
 	/* Allocate the inp struct */
@@ -543,18 +569,22 @@ struct dcmipp_ent_device *dcmipp_inp_ent_init(const char *entity_name,
 		return ERR_PTR(-ENOMEM);
 
 	inp->regs = dcmipp->regs;
+	inp->ved.dcmipp = dcmipp;
+
+	/* For DCMIPP without CSI2, there is only a single pipe hence 2 pads */
+	if (!inp->ved.dcmipp->pipe_cfg->has_csi2)
+		num_pads = 2;
 
 	/* Initialize ved and sd */
 	ret = dcmipp_ent_sd_register(&inp->ved, &inp->sd, &dcmipp->v4l2_dev,
 				     entity_name, MEDIA_ENT_F_VID_IF_BRIDGE,
-				     ARRAY_SIZE(pads_flag), pads_flag,
+				     num_pads, pads_flag,
 				     &dcmipp_inp_int_ops, &dcmipp_inp_ops,
 				     NULL, NULL);
 	if (ret) {
 		kfree(inp);
 		return ERR_PTR(ret);
 	}
-	inp->ved.dcmipp = dcmipp;
 
 	inp->dev = dev;
 

-- 
2.34.1

