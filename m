Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADED4457B9;
	Fri, 24 Jul 2026 16:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909753; cv=fail; b=htayukaWQJjRBjmrRJtEUoE5qeZPTTrjmC2Ls9LZcO+oaW2UVo7UMqacN90rfi1x8dKc0XRRa1A+dAD/OXK7wZO79FPOI0fQPgK4Nciy9CXUch/GD5zT5IeBMBcOyHYBeA9GekCwCyEc2VryPH1opNBEC8osfUDPHLRcqkKh6ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909753; c=relaxed/simple;
	bh=zGVWxJDwPCyXTIQNztca/LeB2vwKgYTv9DXtSAntAnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=f49AYDwtF5fM018V8iJ6djaicdihpO8sPzRzhDPlO+GjoI+sjiUn4jLVjfyoBUxNkYLPIbtvm6khZGAhd5VSOTjc7TuBSvfpjH9oK6cEteyEC9p4jJqoPjO3W42tT36/5t8EHjL1cC3SVajTHTHfK9SJMZCeff4ZIeaZiWzE09k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Yhcj0vkV; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Yhcj0vkV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZ/A09Eu4E/QqYPQk0LRCrblhtMJehQ6BWLS5eM3iiNkKwkSgbun0/5CxmSYS2ZuzAD7TreQ5wIBuXlrBQId1yQ+nsXAAbr52mKiiEygkm9ACcDyWH2lIsmcwIbxzhet9658geZFnXU/O6dj1ETe2z2nNniV6bJ4rKh7IDywMmYn125Hw0Mfx+8eok7+dlsmu6s3dL+jXW6pRSM/Dw5i9tbEys4wKi/T/Y/ZaTqsJjUORiVKa7zUi6qIZZh5dcXXqxqwnrrPeOr2LHnzGaCjZprCtoHZ+bK4+gHvWHpLnyoWtnsYzEx5rV7FXGD1Ce0j11hCF9NoaYEkHR7ZRBiSCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbgQP9IB1qeuWabyyqhjfhhNYDDooC2janKkqTj0xfI=;
 b=AjS7ID3gSp+xLkdoAvSkLC8GPrm2jMLKbWDueYA220L5VV+RV/HKO0B15N4syCJzEXV8zMnmnkgzw99+ae564sQQxaKUpH5+ZUfUWWurg1otGMsa7l80GYSz4vNOq2kwe/oo2XFsymLUgs/WZLEDkRcsM0gKav2QuXqYO/btZtopvFGrElbi4+uypJ96FwUqZYcFQ+rdk8mh87ihJrqcVpKMTG3CKZ6z8ilp2ctZTFLuRCPmEhkF644z7kUbTlDFAUVN2ufT1MFpph9yYrcspP6jysdJr/KkJwR4Z5CzUE0BcRY8T18ewtnuaRL/WG/n0VKOQhiJi1DeMFZWUEPz4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbgQP9IB1qeuWabyyqhjfhhNYDDooC2janKkqTj0xfI=;
 b=Yhcj0vkVYKeNo54S2+pMWJpzNbgOIc6RwoSaZLf78gAAUJe4mjeeS7Mpyy4b4F6JmJmlLRSyOUuldmpF2rsWFZL8F58Kunx8+0FNks2cyGvFx2Ev4JcJ2Jt4allk7VKT3RJ774hNS3zpHFfMU75mBNoa973IIMbfZ/G5Ns86Ne3FfuNonz75Fu+VtIdDIj/oxrwX7Hd6+89Qw56OBZXVy+rVjzkF52uq7g3hPeEJbJj3qlICvRtHxcKUiVnSoDf4uEmHWOHrC8o7BbvyICXDoyi+ddGfVZvZSbnn+8FVeZbHwfNIip9JYcwbBpMJCn3T7dAtpxRZd05WRPTz+i0ugQ==
Received: from DU2PR04CA0054.eurprd04.prod.outlook.com (2603:10a6:10:234::29)
 by DU0PR10MB6897.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:464::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 16:14:17 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::7) by DU2PR04CA0054.outlook.office365.com
 (2603:10a6:10:234::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 16:14:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 24 Jul 2026 16:14:17 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:19:31 +0200
Received: from localhost (10.252.22.128) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:14:16 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 24 Jul 2026 18:13:47 +0200
Subject: [PATCH v3 06/13] media: stm32: dcmipp: configure csi input of all
 pipes on stm32mp25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260724-stm32-dcmipp-pixel-pipes-support-v3-6-f77fe7e723d9@foss.st.com>
References: <20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com>
In-Reply-To: <20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EE:EE_|DU0PR10MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 4af94f9c-11d8-4acf-92d4-08dee99e9c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|6133799003|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	HROkX9JqsNMzMy17Y3YpWEMl8vm/iuVkiYRP1gTEMXtXggZsYvqv8JnG5X9hKsBkOQeoe7XE/+Z+V3Ob00xEbWF2GPGUGO9w+vPIPRcIwRCVj7XUv31t4u/581FR0LGbT2BO4Qj+vt2KNdQqLlz3s7HYKGNb15USnqs4g/9sLP+0wlWj08pSv21Og92QToKm1bPJnintleDlFn2At4YltRrxaCVGI7n23jAsfACqqc8JB85jOP7cyqERzMpq+QmxC1JyUdOmnYZRHCqVfMKeSG5K1YoGU1OEI46j5brdHSu0mV+kMCEwkOCCeQZUZf8Ut84zKLVKfejKBrFnp9DePOufVpW9P3WHZf2vxAJQTVbe57hoeZ03d69kJIGBSGiVM9edna4b8eiqtXb84JzhMqKjBzqW6oIRiTmd0+0MSUz5HnnzISc4B1YGPhyiiWOzsmT7ORfGWZAk1H13tYhISQtkw1ML2bl+PYBqxjx4aT7aFGHmg2iYCefr2duN0PVQ/I3FpW0uO+MWFBuMJ4xOO2bI5V1/Ztg9eRDUvOK+ZBnn6fecNuKViYZtp5lqKTrEiPAZnB016llwO9nNin3szuGmZQw2PYWzzakaA7/uhEgMcBFFSRlrHgZVX9sJv7Algyq7v/XHlEtcTiTKN8Ps7T9YKkYmz8InKikqISIc45/4DlWl7Yybzhz8a6Pr6mIIrmGgrPTb8qxgaPBvkoSUKA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4E+J9gEbqgwFIhN2PB6ofM4JEeBxQ7puFfBJTWSj4nDeUKaNJXZfleYZ2kBrOKm4aTqAo5zjqd7xWUD4tuv3dpGvXPUKtyhDrjpNpsvOg1+j5Ju/etkGHMOWWBVZVPQXZklimt19h5sUqZPMQ9z5ckKc86bSfhW92tW+PQ294p3Q5zOxzEVQfv/BZ84TUUDdLKvErj0Z7g7jOagM939bvOxgkiDGIuc9wcuJm5xoo5pVX/fgfngex5rLIzYCxF5ZFSjsYLheW9wTJAiDf4uTetTs6PI6guf91L+LeWTQUc0N1rkyLSuQAMRVY6cQpWgxL1EG9sgFjqN2sXVH+HC6mEiZuhejZnmyJzQ5HQa5wERYShEsLnPcaW3mTZbMaptcRX6YrQVgsVIMgX340DELZNoR2Bc085/9UakyEScTtq7AStJSWHLSa3tvz6armg+4
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 16:14:17.2972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af94f9c-11d8-4acf-92d4-08dee99e9c93
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6897

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

