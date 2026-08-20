Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013031.outbound.protection.outlook.com [52.101.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E955B376BE8;
	Thu, 20 Aug 2026 07:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210608; cv=fail; b=dREhkuhi7YXxBg4nT1y+o/0GZo4V54Zea+tIHE7RzntTE5Agl01B1DW32hvIkqIMBeC5OQCqx2Rj+GZquCdGH8HYQpvvTTHDZJyiZAUF7YjiAQLR0CRS/0Itd4sO3xEj2VCAM6YOkvY7Qcfn1p3muGHSMJmoq1hopZI2gEMJuH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210608; c=relaxed/simple;
	bh=Pq2mEv/ISGag57hE0DfkbIrVRfPmfPaMhVApYplTv9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IwBKJMXFlyW0tVY4DLlvHZp2Swoke53wmVITRzFUmPf2D2++S9SySfDCI2ApGcjHoDh7OBxklT5T4O5+NFf1ObIehpVOyf+6x2uMN8G7KlnO2pdaR56v/FXPlcZK6WTo5P337GDT1+2aM9YY3D6AuCRgVvDWW3FoCbHWo9svd6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=AZEw6LDH; arc=fail smtp.client-ip=52.101.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="AZEw6LDH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJCRp1E66hrDz9cokNvwfVGacf+xFbPzmwVaOYM41vdpDkXF67lcdCYjY4lzjajCVNE/ZJUxSTsvq/8Qph5o0YbYGCCQjAoTjb/hLns/JCJ4yTIFg1TY6PwDOw7DEHrL6pJkFcmz0ZCh3S8nXXIiAL01YkXVpf+HvTVoitpy+DgW+EJW0PCLf2pXKj/j6oIVvBljbJ7eQAZRV0hDSeBD1/wB9ZGavjy1nZi8ZDLbFraRC4Riw4QN2KMsGnbkmx+0bAMMtj8LhI8J/4zV9SyPwb7S3HeDDAdLSaPK5yblCkC8TMNsr88z+CmQfTHnVeZWl48lt/gfFe5xXWIBG1eotg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3gtnsrz/6HAoZspZUg9M8ZJWC6bmzmlydxL6z/xP2Y=;
 b=FmN/Q0d9DwBvI09sNzqDQs+3cAU5vhvDnoak14G7R2xvqnAvA+ewvX4wWexhyMuGJls+CkRco+qZLdAKmWwKeyK3B1ghhCy3k/0zhJVTX829XWQHYhtxQZ9yVzg8iJTjwxZgLhDe9uqGzWu4ibMxkzwZeUDbXQcrrD82VhTqCa+cgYSoIF5mQEE7v7gq5dcpKGruD/0f0Uu2Gy0DvCkeF/5W/kJNJvkTRTQl0Z3tQJsybKTMawxApzJJuSVy/AFVAjG9cV47z1efUAtcFFu898B4Znp+dietQKjXNPxS2L2czbbqntlI7ptKlYLy+kuWg3dN+OdRjZHNaSBCpWGStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3gtnsrz/6HAoZspZUg9M8ZJWC6bmzmlydxL6z/xP2Y=;
 b=AZEw6LDHtzvfeKOXe6yB6WEQ5MpohOkRgeqtUnzpdehfrAW38MWKuPJExxd6zLNSFaW//BaHrZ22g1+WGsu1IE0OjwG3mkzVryJReTV81B57AgNPXw8PNHDZGKbIj/eDcjv9WwbPq/IJgDNX/5ZxuxfxI3n+ZcWpXVPYYExvzm1ffKdLcX0LBi9B47/ksKVhqLyOtsP6FVPLEDBF6wgeCxciOgH4AwahyVOaO2gm+jZOUpxQSvFnPhWwk3z07euOADJOUSKiwVeelrr4TCj7doum3L/KgYaw+TP4DC3f5mbdpSIEeAyknvusk1en7SIGbcbf+NlosDWQUcND8mZfdA==
Received: from AS4PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::10)
 by GV2PR10MB7055.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:e2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 07:23:15 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::7e) by AS4PR09CA0019.outlook.office365.com
 (2603:10a6:20b:5d4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 07:23:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 07:23:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:28:49 +0200
Received: from localhost (10.252.29.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:23:14 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 20 Aug 2026 09:22:35 +0200
Subject: [PATCH v4 07/14] media: stm32: dcmipp: introduce a dcmipp global
 media_pipeline
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-stm32-dcmipp-pixel-pipes-support-v4-7-d212eb4e3792@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B95:EE_|GV2PR10MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: f0677ac0-e4cd-4715-cfbf-08defe8be668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	co75OEvTXHei41ncL6EShXfiNlvqnBy8IQDpWZu2W7TwJo2mA2oUNinrE3Y6JIaO7eMkzRpxBBE4Zq9/0UgFHkdeoUkqxTZGaWfvhu9pN+luEh9AygGv3g7NhVPRwO/4lhhX182FmhEF0BL9TmGU5k9D4BTFLpo/PZlaKkyYdKfg2w3MMewtugW7ci3vDH2a3qQSlN4TfassL5GNZH5kq20PAxYYxqKC1gkI5br4683n1BfqBw2O8hN2URrRki9Y+fZyc3y0khweSWkoqJJFEo+lQ01Cy8MGnr05n8B74IIi2kKXTv1C98+l+5//HO7H9xp1sWkoEm77fDWX6aRD+66QHH0UWE4AGEN2L7dMXy3QFPayI/BEMlZRG1+pwQit6LXrPJXAjEsMCDtIvaC+UxF/cltFBhbhI9t0mTDOImHUsLfXjUm5ZHuVMAFcb+YJVswKe4oQJIpyLQTmIuQ6//ouVVEV+1I2/9gvIW8XlJSr03isruOU60udPfhTI1ZgxymPFRWlR8q/eDXwrSco1xZkJj6AWah6pnjAIm8neZaNhuohbL0coLRoUjZszwBin8fKUU+wP7lOsFrmNk1obyW7NtVv5qGPVLB/aWY78ljRvZCbd0gL8B6cXUa8t7SJUzjr9oqC7TdCY5G15b9TrGXIVJ1JwieUT6yku+X4u5tInjS9FNDY/lA+zcyKrVsXd1zFutBuHm6EPm/s/OcUyg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eLVEX0q9bmjZhdZwAEpxl40Ih7jZrIjYwFeqBB6DymY+iFhUNbi/HBl84Fl+ahFgUGiq5IZCvu4otOm/xvTCvsmw50gRydKB/oA2u3uu6KapDYiOlTOQ3Qz63r6+hagrdlDjIWkN087I9ufOPQVKPdusGOEvLlRtU5n26TQn6zo4J0zFVzEN7i6q/M+TZ1fucFomHgPAfbs5tQ9bukL0J9W2IG75GkhoS7rq8QDkZjc5f/aRlhuC806f167lWFDiWKQpg9FZZ/uNpffxEd3sGDVhX+hkLFieiPDzAY/3nzMIOs1+RZUy0YsQOFg3IXKSxqIkawCiwvrqJA1JCMy7i+SyXWN3mxODx1LQYjRPjRwG4L+Srj20ui6vkH1jwsS4y+AqUuWaD7CPguFyvJY7MRfgIiqVIYJdrSxjd2MqvWDWbcX4x8UwyY/oiMdcAQ1q
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:23:15.1474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0677ac0-e4cd-4715-cfbf-08defe8be668
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7055

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
index 2d26425b0b0fb..ee9f36268e646 100644
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

