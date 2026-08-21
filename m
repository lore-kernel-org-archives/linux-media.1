Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013071.outbound.protection.outlook.com [52.101.83.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465ED411661;
	Fri, 21 Aug 2026 06:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294313; cv=fail; b=dPUTR2zItixP3ltznFNUbfvOReFqbqY064fzVmuckcixts6kmcv8oQBQjRHZK+DObAudzy1vIqkf4TiVyoI569rIzq+U1I1lqQxTFz3T+uD8aou9540xqVXmxa0s/3pyZBT3NxRJVykA2msZbkGU03j9cUqYE8mVjTAMPw7AbBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294313; c=relaxed/simple;
	bh=rqQwiTjLavN83DKmCZyf8WPEGR4J5w8CDfHEXjxsq0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KkqxY8aCjy0GVQXZcre783c/6Fof8fW7JY9SlAeqxFwtoisYQRxlrNKFHGizcY8hlYvKkqtp0p8aKJ2XsHQP5h9rSeGLcVMneIjNL/ukGmyzWsAv7ugiorylyIMwMo9GTwQiMz2KlSQZqmkZtv2t9pZgxpPp00O8BvsQ2Ay9jGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=bjV+BeRp; arc=fail smtp.client-ip=52.101.83.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="bjV+BeRp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWiOYUpjUg6iNVckdhKlZh7D3+q7jMy5HGa/A4cgK4v/4fBstklHbKwjMyRxCIzycFzgPnGG+2CJ9R2wCDVLWk13Zmh1Dc9RB6a1Of67o9LvjYHZhSJRc4EkH+td3v07M/EvDU+d5tsZKgKZYw0MhthhTFZP+vWAdUSV2gcsYNGcDUy52CsBiG8xwed1vRF7H2oymUoVB0XIkqqM0fRd+bsxi2eMus8oDPINlbZD66QzW7VTRGd6Z0/5V5ij/MVm3ZYNLR0Fu4hfEasOSPoEk3kaf83lmOAikSZOAtHBiOJ0DZpmwtzCP0YPLE4nxa5UU/+1GdgBV+XxbeSm3Soz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPkp7Qti+b6gTWAiV8IRyJrBzvSDsIQUO1y6UfBsKVo=;
 b=dFS4E0DfLem/o9iS82Xc5l2ofaia0VEQrPS+8nGUz8iw2KN534uQQ9DPpAFz8+e2BpBn95unwTjAw11VmHypErqCND22DZChJvb4IYlQWbERTeGJu7F76FpJrNHeH/lFUcaTqx1j57y4/qrx7wle+wxSxeaHpypdzSmX/zqcoYiw1eoM6KqGB92l2iSaLhMfxSVHf6IpKERPmjAf1zsCv13a9jfXWawcBwSmtd06mxXHgXnfLINd8tM0Sl0GeZ0KjGfabjxka9s20X+Wsel+AzTPN9anAAfvywokBirUmnOJdVL10B3r3A4LTTMMbjBLomwymy9/leecSjDvfTXHjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPkp7Qti+b6gTWAiV8IRyJrBzvSDsIQUO1y6UfBsKVo=;
 b=bjV+BeRpy9VLAwNgUusQCy+qVyrcnYK8L7UWED4P8Vjb5h0VOF+wUlhTrTkJ8Udor3JqHNVrnASbsCy64dyL16J1gyjbMZELbpoDYia71BK4ojqt6jxT7EtEh6gKKP63Aea9Eervn+rGja0VYMNb1MXbkirXxsdUfRuEBuyYfiMJn4Oao4IpfbX9NHps+2ge8LYkszyXIGm/yV59kDNudvHyQH0/onmFVSMyxeWKWNis+JKsO1yqGRST5GYMM4kdRyrbWyKC8XMJQF1cT8/4XU3KurAtzY128BDBHbuoQNZb50GEY68kJKRAEkH3HWkeQYWU4+6dW5HRKZpvmnTfnA==
Received: from AS4P190CA0041.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::15)
 by VE1PR10MB3935.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:160::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 06:38:27 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::af) by AS4P190CA0041.outlook.office365.com
 (2603:10a6:20b:5d1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 06:38:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 06:38:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:43:26 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 08:38:26 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 21 Aug 2026 08:38:09 +0200
Subject: [PATCH v5 07/14] media: stm32: dcmipp: introduce a dcmipp global
 media_pipeline
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-stm32-dcmipp-pixel-pipes-support-v5-7-d140efb61d72@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF0000003F:EE_|VE1PR10MB3935:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e01a72-c226-4930-b789-08deff4ecec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C1ryR23MPALhlrOKn9ZQIbNA6LBgtnv8NqGPuTSL8ww0yfK4PYkvCzTnrfye6xc/tzmUng04kMuRBOIpupQaDhZMfRNN/qJvSxkSYPBCswNgyGOAjzNGZSJjDi0H7LPEyF+3G9o8N4O+fPR6gVB09YH+yrLFAzAOtqvxpy8mAYVZLUN/ZW9P+pKMjv3Ymy6BS2g3ingCCj90f57ybpomWJ122JNZd3+oB+ZzX/Eut/BrFRS2nI/2BP9Q2t11P2w35Ou8mb96C1ggVZTSG4wCLugaWu2IfwpmZalFixKu/1i287J39CbnztwoCwHHUopkNMmCG/t5pXm4uVJAJhmGMjdfAWAqu4qiNo7pBkrlFcixpyzQwftuJGpHbfWla1Qa3EnaR6HhxsYCAD5HgLqOVB4LQVoCxI8v3a2FE60J8gwZ99GNaqGdCO8cB9h69LydCd+9iLb+YM2Jd5zaRhXlsigxFyoB4VZ2AY5anohz7btITIMeps69mc2GlU67jAXiQuuFjLFO7I1HmdtJ5xXk6KiajPYx2Ln+V4TPIa5g93qSd1If+UpIziBUrlAh71qhom9fRrGR6Bc6MI82VqwWxPWOStZNn2ZGZPMuxswXO81Ar/kyiuUSUuvCoj11shhsQJdqcSgfUPN4G0RtLJawDlSNTLam8j3cp+iaQQOQcSmPGr7ccISB8+25Sv1ZyY9aJK7Y7FoHboWB23rw+cikMQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RwszJgX2Bw3yP97NO+a0JZn6Ha6YZMwZy1l/M/8UK1f593z0jYTcHjlXlvTPe3cBCoEdvjVr7wjYVg5crcqaW9gPf7lEeZlIWjOrCRUmxPgjsTbplvxo7I7oDVC+liwVxzOloe7qgihel+hKV7nelvpUmssB4PLiP+cRLtEw6aaQLd048TzzmmV5TpXUiaScPsEfo49vC+veL/dUcKPaGoSFpxRaT76vIfxArn5bJ7ajWxkxX83V495dACN/i1FMz0OwJe0mP06ogajfT5LbQo+sH8DVpJxMMN79H0DyVYFmfhWamh1WoGPDTKdVgIEovWSteiBuN4N4K9Yx9qhE8L88HB5Mg5wgTyKYtrQ5MM7vE5VfU7eJ+RvRBp1wajkNPRn8XbDd7B1UYe4/afrkIkoXu3ez2IQie8oeOr+p332dlYv6R91RJPRYJmlL1ZS8
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 06:38:27.3680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e01a72-c226-4930-b789-08deff4ecec1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3935

With the introduction of stm32mp25 containing several capture
devices, it becomes necessary to share the media_pipeline
structure among all capture devices since subdev pads can be
shared between several capture devices.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 3 +--
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h  | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index f6011b42203c7..53341b7984579 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -125,7 +125,6 @@ struct dcmipp_bytecap_device {
 	/* mutex used as vdev and queue lock */
 	struct mutex lock;
 	u32 sequence;
-	struct media_pipeline pipe;
 	struct v4l2_subdev *s_subdev;
 	u32 s_subdev_pad_nb;
 
@@ -410,7 +409,7 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 		goto err_buffer_done;
 	}
 
-	ret = media_pipeline_start(entity->pads, &vcap->pipe);
+	ret = media_pipeline_start(entity->pads, &vcap->ved.dcmipp->pipe);
 	if (ret) {
 		dev_dbg(vcap->dev, "%s: Failed to start streaming, media pipeline start error (%d)\n",
 			__func__, ret);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index b491ce00c6562..9ec6d589b5036 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -73,6 +73,7 @@ struct dcmipp_device {
 
 	/* The Associated media_device parent */
 	struct media_device		mdev;
+	struct media_pipeline		pipe;
 
 	/* Internal v4l2 parent device*/
 	struct v4l2_device		v4l2_dev;

-- 
2.34.1

