Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013011.outbound.protection.outlook.com [52.101.83.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6CF3246EC;
	Thu, 20 Aug 2026 07:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210609; cv=fail; b=YVInzIundJoCVODFCLXo/mVDWcua4SyZTwpbLKyCGooPojjM2YIDO+6hvUw7HKTI8UNnb3ChkCsUUNZczbXq5M/DRWJgz6uU/QkrAY//18jd7OssIVmxF42ZzC/t+5yD5At3p+yGUiLzhk4f6y2arL6bbN89t9vYBrFUzHz2KNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210609; c=relaxed/simple;
	bh=zGVWxJDwPCyXTIQNztca/LeB2vwKgYTv9DXtSAntAnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UGZmrh8OWoLdbHTquslzkISfggR8IkerD8vkYpDks36I4PQMHjOYGxyvGQKgofHTdyjMngFEGx0tWnRdH8W9qcRIpDuZ1WBd9zj7f24GHr8IgKtPX+D5W6ZnIiZCQKhNTpBa83oBu8sC7QzyNgFYLp7L8pwzbaUUCZr0E1JgBmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=P4lGLMFl; arc=fail smtp.client-ip=52.101.83.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="P4lGLMFl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1tWnTmsG3jyEHuy31XPoUXDFV4NA892X5m55kNk0NI0tDt/UF5UgVYj5YGG9PNnMU0mJJAEHxtN3VIUXxMcBQ56QlFqCMp6KcsBZIEtL6X2zrYEesm1E+SzwtFyytZJueC8YMuDLfKYZm91qWRy1cXDpdpBnrMRelr8j5Fb1zcahoknAu+qiBitqhub74LyBdnhdRhcLm2nFwIAmUDOJt1xTGVAG26B6pztEs9Pt1qdqi4WOruS3WwgTDJmJXv8qvYvUGO0+nJ+sr7amze2jw2nAH9hkWWFqguAGl3MzfknbVTSQFxSvaJDqzOPRIrWxQY2GY7VPV/DVcqrxADnRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbgQP9IB1qeuWabyyqhjfhhNYDDooC2janKkqTj0xfI=;
 b=i/iYhC+Vwj6tptr3J+WCaq5QmR8rXrPt8Q+Q/yChdAcFQnqWIFDyUqVse8h4c07DWw9yMxYnI5qj+eWXpmIdUEPKKhhtcAbmHBGKF3Y6f6LCHP4sT2e9rF5GPR8rNPxCakuhqljZ9w4g88sg51VQqwyV9P927At3LSMqGJ27JkfC8FmaTB12Wr/m0c0wD/G4N9Tc6LkGvZRA/nArmMxNwNE/NrCK7O4Fdpc7MhuhrSNXRaERalBH7bXR+V6qnp5PIM+9KQasaw99zzEcbRR6cr650Hd/j+IOzMvIdqRznO+ZyHC8u/ENquoJKyxIiIoQ5Xl4vbfqpH/KsbXSdXGnfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbgQP9IB1qeuWabyyqhjfhhNYDDooC2janKkqTj0xfI=;
 b=P4lGLMFlVWrm1O7auU8yjeoumpA+MC0/UQ8Q6+Iv2IoVd6pWlCyca2q2ew51IzYBio3F5kmwxjDmaGz4VhPSdO49968Jpd+EE4LrM8mr6ze+o/T4eXwHhwOk10pBsnFKvDArCKqtnBzTCQ650NTXNDAFPf16grFPgEfLfITO+u8bGEH+C+1yazhLO+/RhHBE5BuAD60eJx+B73KQ+DBugCn+8sonkrfn8we9RRuGPIJP3fFpCBU7UoUT4G6b5m+V3cqt1ykI0Pe6L0PQkVfWkAijspmGIecACIGSUPiKCMaiWOhbuBfk7gyMEEO4pf/x/cU7bG3bWuztxitfaVbmqg==
Received: from AS4P190CA0044.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::8)
 by VI0PR10MB9336.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 07:23:14 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::50) by AS4P190CA0044.outlook.office365.com
 (2603:10a6:20b:5d1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 07:23:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 07:23:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:28:13 +0200
Received: from localhost (10.252.29.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:23:13 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 20 Aug 2026 09:22:34 +0200
Subject: [PATCH v4 06/14] media: stm32: dcmipp: configure csi input of all
 pipes on stm32mp25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-stm32-dcmipp-pixel-pipes-support-v4-6-d212eb4e3792@foss.st.com>
References: <20260820-stm32-dcmipp-pixel-pipes-support-v4-0-d212eb4e3792@foss.st.com>
In-Reply-To: <20260820-stm32-dcmipp-pixel-pipes-support-v4-0-d212eb4e3792@foss.st.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Hugues Fruchet
	<hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A7:EE_|VI0PR10MB9336:EE_
X-MS-Office365-Filtering-Correlation-Id: e0a885fe-1a50-47e3-7510-08defe8be5c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|10067099003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	E3+dvI5FFtZ/ClGAdahKp856qT3Y4k86uHR+qrSbb7tGgB8xZuWlgMGALBPCcfg6gnVI/JGPobGacac0PaLMoFE6CbBkfgotw+r0CmoMGRrfKBJYiGc1qjMNcQzQp6+xhDeq7iBWNUNvIe8/aSIhbRAlYj5JGxB80+XHYh9KB36XYV72xw9dYmIMoWKEummyI0DZ87AXLeG6uQZaPdRVPTABxI1udZwDCsi+IxP882nMw7v4TdEBXyBYdM4WKlAHEJFnL4YN2Lo7v/N5feWjcWGU2sWYEmu+ZJPi0+ytodNrjW+8NNg08dY43nBCfUyAd/+dbp+Eh9IMFRiO26shd943F2ieGCzYPjQUvL3GuGsblmhJvYyVW5oC5yJ/lFGcKai/VuswMqEEbX6QqsqdBNNl7TvklGQ9sfbkLqH/fQF4niDaWdj+lFn/FOwdexgIXgIboX7672uAUIO2E+eG9czIj9fQlRDgVE/705c46/uIZoStrGSUBkpQJ6911JWJP33z9wD364/fNXmqz4340KDX5U8fxS2PBE2HNhaXHcUbqna4mt0OAWqXhlYJHRLSMEGOUnDFhB5D5EHAgDTTVPR1mntvqyFpfzRA0gdd0OAS71s74EWEY+aLCehZqL3czlFJ5DuZNt/4SlDxzdUr3WW2CJS6w5+uVQAkHN1+irs9YSWrQkNI/2P1gbZmcqBfIz1projdL00CcYfgnIEgPA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Hq7gAzlp58lEu0Po5k1fHLammZDu6JH2UPJjR8gy5d7hFQnWZ0dcn02kcA7G0AJ16yaMod6Ls9PF3sd57ZLvy80d064GoEkYyaoabcvswWITgkUvf4F2uKx3jYYpRJskI5rER5jY7B2ulvam6rArJ6qxeTgUloFcYtAloq+2WqEpdm2GSdaEAnQupwCU3fa5RhJhDQeGvJDx2Vp5tHXKf3wwF3yQF8PvME6KdsLT6cm2kfLm+bnQGo+YWEtT5SOLMGZehSZMOnOWK0KjymyA1/bv4/ppFcDrkOHE/5mo3FySDWrzo7ZAV9jyGunwnz2e8b0ZGf640igXZhPr6+MCNuaY1f9AOXd+rtzwZhoKHlEvMpj58sNWKt4Ky7fmrW8Mbv2Szd/Byz8sgF/xKKnYySsyL1d3oWdbJDxWhD0wVDxTHjmQOWQXME/vESagcJKb
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:23:14.1047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a885fe-1a50-47e3-7510-08defe8be5c5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9336

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

