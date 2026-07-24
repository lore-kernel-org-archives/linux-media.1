Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013054.outbound.protection.outlook.com [40.107.159.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A272442FA5;
	Fri, 24 Jul 2026 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909690; cv=fail; b=JFwnXPMZosNe9eOSxxcXJ0XQo+W7acxJ0+L1U/k+H8SNO0VOr7bdnykBdLgOoX3pmQDxZjwtuMsnJixbszInAQARNyt5QTkacxZDy+awwxcSdxoXgBRw0s6m290rjalz8k3pv0sd+dzgkbQ0f6VH6Cc4zUa/J1tFmoc7xkffPiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909690; c=relaxed/simple;
	bh=bTFjx1CXAX2ZnvRzXFahfnajodCYKvmSsALE95PxZeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BpLGwlZeX3dNgoUWHPmlUhF7i4zjv5OTxVZU+qClpXS67w7pFNOa8aDxK1kvFuXLLts98s2w3RA4SoBfepbmcA/KIifNchRDvuIWSAM2kCI3WTOLVvuaAp+8Bbz6gzBpn6/4zaL129t51x+CbH3QOtM9LfVYUFXqOsc7DME2ES0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Q/8qCt5j; arc=fail smtp.client-ip=40.107.159.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Q/8qCt5j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajhyYpr75Dptw3f8w+HA386SbDbPOPUuhYMoxBCafBAFbSZ7M/y8qTlEaxt/QW/F83ZzBb+Fh8YDqruejAwuNLJS4MDZefSqZslnfxmNfIXCh2swIFEe1SVF/hc+t6Jw56gd2dPTLPGaGyrX0IuCM3pIa6ZcRNDYNnc8ANIdJDgfSFQudCHMA4BzF6e3QJSA+us5CQ1nChBmYf36R2xgSgdWnCBGWhzYxcmi5wkM6FfBbuAnRgw6R6jfqT2+x+eExIDpEILrlIsqk1js1zTC5kxgU0BC8eyCLywdVt2msYEP1YhHZMUY+sRZRyj8WCN/7brGfaX98gZ/2jtnekSoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEjYLylXJF/q29NFKj7OUUasMxvnUE+N8UUFRk+cDW8=;
 b=XO9XDds6F7SNQ6nGFt+DJjQhIjOsrXn2w8659QKiwg21Nquulq8Vyh21Uc9EEV0h0/tAixGJfSrSvWvfCqSl/7F576G2X/fpEF00UdlqZplQiIfiAdRlmEbYN0eukrBz+bFUgw5LwhhGdYlWVjHnNbxdEhZpKwXwpfJ/yBs6KCSm3758ZbSYJmu9c3n4bQHO12d2ZHJ60sLz712d7iYITw5cqMOoIV1d0Bd9lgLWwnAwzVGbm6XYkfj7iwK2FkiiNCIaROAeHjrXIyJ1Sutrzf/f8+ne5voVQUtblAjfyALM4aJPxLARtq+/smbXGrZJEujaJUKqyAqpzJhUjJ0HLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEjYLylXJF/q29NFKj7OUUasMxvnUE+N8UUFRk+cDW8=;
 b=Q/8qCt5jEpYg5HI7eRqN5RgvlzyVnU/F1F7XhOzKYmQUNrNLslDFI6Rjy7VzBs/4Z1jWu1ynijFrdTAFe6f8QqaBQGtMEH6ukQmHzuifeL/DftzMCcgDQ5HHi8dM6LzkUpr5kH+4wNKOk8WEy3VRjCLoCvUtvX/P1Dbmz95pXDGkrGCiJD9h3/jy4vNj5TOdELjiJFZls3V56C6aDexPnSgR5FkMdbqKUV2TNB2o0O77LZUU3noMzPuuA0S4tCV7X0/VcDJ7iDNyDyH31JEegqowAOoOfE2Yj6+QoYEQpKc77Rmpn/Kd4cK4J+JFnocJE6jMAPc6sCeHj7SCXgN82w==
Received: from DUZPR01CA0129.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::12) by PAWPR10MB6904.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:340::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 16:14:14 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::95) by DUZPR01CA0129.outlook.office365.com
 (2603:10a6:10:4bc::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 16:14:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 16:14:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:18:51 +0200
Received: from localhost (10.252.22.128) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 18:14:13 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 24 Jul 2026 18:13:44 +0200
Subject: [PATCH v3 03/13] media: stm32: dcmipp: bytecap: protect CMIER
 register access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260724-stm32-dcmipp-pixel-pipes-support-v3-3-f77fe7e723d9@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|PAWPR10MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: ccb0ff5e-31de-4607-1dae-08dee99e9ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kaI70gqP7NdYSY4FGYG6KhAr8AUk1GWS91biYWnd/W3E7QkbiP3Plj+8xxS+xG3xXajDocLxyVxhFgoek2RVW9CPTFhjiKXVm0jg9WcYXdf62Cj5qQ2BeqeV52zwAjbV3RxpCvtfvAUnOmn1i5NdJW03YatEzU5ohnn46sYMZHwDlRSpHYV44I2nrPEwin9ulA3zPyf9TB3O/x0FQDNdG30kYTz+M2VZvM6HGJXTF3N8PuEZki1hctMvxgGtr605ZYpaPue+Qo/kX3VO4woYWWlyW1zkqXWVOX91MsTTWrVEC6B9uYvo07ZPIJqsGy4TZ13N/Sfkik47V1FpRNGe8t95DoZGFABGIZNCG01RvLedwwqno8JTep3rFgMToVNxc1G8bQIpFFl48UFtNx8ZiUgQdlsi/bxXb+/DUwuOHZQGPC9EmmM2U+rj/najdHvXdE4E/hxqTvPMjKbteM7nGSlEXH1Qcs0Kuc/x8DBCl6AD0cX7pG+0hJFxG8Ar1plLXrGTBeslcLqIt04mDMTXocZRXyCeqSY46MqFGEqciv2qYCTzCJsHna6qLsQJOpCJhwAmMIKdhMviaXyiXWa4FV3l4TxerPpUsSreB+T+k45f6DtHjY4sqc3JKTx6v7f//1yXmHRCUj1qhcHcNsbqFDEqR0eAhugx/94e6WoLGEJLsSi1H2Wds0bGI0+7QignZa38aGnWIGHUNhIejB8Lpg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TFo887HkbICqqSEzbUPYIjp+WIyfZwWHqLCrsR3wz53G+7l4Fm58rQi/n1yzbMIGk4YZFhuaRckjQkCbglJmnMVIR7iB7d3AFKbPca7+s4EcDuLKo2XNi7FIbqm2PVmfShSTlrInkghl82vyY3Gal8E++Qb74PLs1X1qNAsAZKeywVgqqdc+mVOIc+mJbGkqgwdH10W0QefrFf1IbVC7q914Gx/U3oGA3eREzkkEo149tYAMN+vJ4Y3OZrKS5ZbmC9eWtoq0oDAuuFi/lnyFiNTsLE45AHhNfPaH0i8xGitwhr62kiX6MUGBnT63KiEXYvkazavSzrHGFmOJ8h/OWt0VePsNXbmMMpjlDoBQmgdw0k6+BsYXfFIwDU4AG3abL4MkUQTS35VCsCXdl2+7SqRdZs+M8DelrvG22wru3XYAxDt2/t+LbpYt67WsGkBZ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 16:14:14.2861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb0ff5e-31de-4607-1dae-08dee99e9ac8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6904

CMIER register is common between all pipes and thus needs to be
protected from concurrent access.  The struct v4l2_device structure,
unique to the whole driver embeds a spin_lock which can also be used
by the driver itself as explained in its description.  Rely on this
spin_lock to protect from concurrent access to the CMIER register.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 0e789bbd1198b..f6011b42203c7 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -438,7 +438,9 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 	dcmipp_start_capture(vcap, vcap->next);
 
 	/* Enable interruptions */
+	spin_lock(&vcap->vdev.v4l2_dev->lock);
 	reg_set(vcap, DCMIPP_CMIER, DCMIPP_CMIER_P0ALL);
+	spin_unlock(&vcap->vdev.v4l2_dev->lock);
 
 	vcap->state = DCMIPP_RUNNING;
 
@@ -494,7 +496,9 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 	media_pipeline_stop(vcap->vdev.entity.pads);
 
 	/* Disable interruptions */
+	spin_lock(&vcap->vdev.v4l2_dev->lock);
 	reg_clear(vcap, DCMIPP_CMIER, DCMIPP_CMIER_P0ALL);
+	spin_unlock(&vcap->vdev.v4l2_dev->lock);
 
 	/* Stop capture */
 	reg_clear(vcap, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_CPTREQ);

-- 
2.34.1

