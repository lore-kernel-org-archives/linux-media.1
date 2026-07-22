Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F356D4399D7;
	Wed, 22 Jul 2026 21:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754577; cv=fail; b=Xuk/373VQzILQHmdC3Jsej4uhnVV9rQJkdUfufIS8txRo5Tvz+gmDD1ABllu/ySANqVh/LC+2zvWp6po8xAAkYbligVKZLXgaPh3y07mz7gF8wqHthhXcSt2mMZP/FXtG7R0XCdaQyS8rY6fFUmr+798GxAz9+rz+HM9VzC9YDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754577; c=relaxed/simple;
	bh=yaQkBfzp5h4Tgs8wxGyZzzgJ4jeWHkRaIGzVwXnOprA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DBpt3C/RqM2GXU4bBaXnxWLun41KgHck7cvVnnVcp4lNiWzAJKTXJYepac3rEYSSBoaQjbIm2C4fYQ1+HltemxqbPLiTp8/S/I6/caspD6FIGMkUo5eewmiXm/5ZUzIkqn4hqk+yeUYSHJ2yHTlrucb00o33onVDtL2NVscb+0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=aJVmMiFz; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=A2KfOGq6; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="aJVmMiFz";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="A2KfOGq6"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MHnTIp156790;
	Wed, 22 Jul 2026 16:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=q0kqmyA+O7hJA
	wG2X3KG+teWDIYEemllsPPZAb5bNjY=; b=aJVmMiFzDLyMDmqgT/Tz+DlkGllD9
	14b4GL6RrRDFmJ2hZyPTs74tJUOEG92tnxyCKGgUBPDQmbz03x1E8KgDvKxlt+hv
	zb87zO3guwIkVy4ScXiQsW4mcFbLbGTq7zcb9TSYUyzGj7Df12FNyABXvmfWvxX0
	XnvJaNnjv7d1E7+AyGKAggytT/XDuSISi49WOSZTUHs32Q6HPsjQiDHOfGnKDrL5
	a5i96lRAfLh/XfuMoWV8UZHMpCa32NGVwKZPld0CRX0ML5Zu6LOv6tiajuvvy4G4
	uwqrENZXK2uLoug47SazzT2iP1jPgEiBE6HLtm2Q8PT+p2GRdIG6KIHtg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010050.outbound.protection.outlook.com [52.101.193.50])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fjwjv37ky-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 16:09:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5MZqJDYSNnQYeV2McdcX2YXa/ZNMymGvQy2+d5t32pj3OzZEE1U3otgU2fcK9dntxPBm+fE3dTkYo0eRgW9wPUsUXmydEvzEGyYG4BmBdTmincsOjmKYlTO5IZ1ZAVeYzcdI4YUxoN5Sv7WyyScOF6tQlBpkmjCJ8yVmRUKNoppgeNMbQv7GGTxJ8tUCSo6MqnLf59u7EUA8+3xGY92Gg0QQ2/5Kb72gVJsEEJFF6EXU/3YnNq/0Vm0ELC9oIUD3du/C0ojr5hS0w7G/HFA1ypo/yGTV8ustkicknFBDy77/5ex2bxCpKJ88hN0SxVwGu2Qp9C4SdRl5+iUlAukJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0kqmyA+O7hJAwG2X3KG+teWDIYEemllsPPZAb5bNjY=;
 b=LGlHPKHReLvPFyXmlSum45uPmXzxqgWrVMcncVqeQnIEeOb3zlzMo+drpYzzYF3h8ZA8CYRGSL3DqJLkDWmEcxR9TqcXWFnpC/7my7DXqsI/byR17jLLww0viRTEo/yI7FKY5nj2r8Wrl5wrtAW6Fr/0P43FJ9T8lmBJYUrp9V6wEiXnSPDabfbiBQwb/7bwckEpUmi3RNQEEXshQa5KouGpka10PON8ZTDvDpKUvBbuekZPtZs1CgUu/+htRdOLvmoyg7dpXAqxjkhws6MhBITAQvmQ2+ObyLUxEBTDnCH2+ZEA/x7O/KmZSOSxXckk/3ielbR01WK5yeBE24S6Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0kqmyA+O7hJAwG2X3KG+teWDIYEemllsPPZAb5bNjY=;
 b=A2KfOGq6euG5rtsJRaMj3wocaqeDlFedQjKJItjxhxPWvV650sgTBekpOh91zTT+eNIs7Ojbh48P8IXLkB7CVJZ7a9lJsQuiWveQvBc6e7RynxhEMgeCuF3oC+ezYXpp7VM8HULmgn78fs4hrrndXZcYVFEKqW1O0rbO5mX0mwQ=
Received: from MW4PR03CA0133.namprd03.prod.outlook.com (2603:10b6:303:8c::18)
 by BL3PR10MB6209.namprd10.prod.outlook.com (2603:10b6:208:3bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 21:09:27 +0000
Received: from CO1PEPF00012E65.namprd05.prod.outlook.com
 (2603:10b6:303:8c:cafe::a6) by MW4PR03CA0133.outlook.office365.com
 (2603:10b6:303:8c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 21:09:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF00012E65.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 21:09:25 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 22 Jul
 2026 16:09:08 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 22 Jul
 2026 16:09:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 22 Jul 2026 16:09:08 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66ML97Lo348890;
	Wed, 22 Jul 2026 16:09:07 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <b-brnich@ti.com>, <k-willis@ti.com>
Subject: [PATCH] media: imagination: e5010: Enable autosuspend for runtime PM
Date: Wed, 22 Jul 2026 16:08:45 -0500
Message-ID: <20260722210845.723864-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E65:EE_|BL3PR10MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: e95948a1-3130-4082-a7a1-08dee83582b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	MoFzcMWZ/cycY3auTLgSQHUFXhHts57SZ4lumm2cp97I+SORMc2CULn02nXagmSjGBcxf5E5VXJ0/R+vfvpkqvDJvQl47tHVVU98UCdTfRcWoJamdUykiYiXK3Wz4DDopWWWkQ94QXoxH/iSqniyFBeARTs7va+icoL1l+YFq31OTc70KvyfqKzu5TN8P03GARRHRCv/WjL4mEDHkgGs2wDIaioJ2YeKeRU8PZdU2Mkkv67PTA6S+BKfBP18lUjt7G5K+//H0Qawft+NBTbFbfZINxVjPCNWXH+XzZRxtOVyZxTgHQxJjyiv9W+lCuoUYJ2zJ8/avE2U1GdorzQo92nPmyuU2QufMRNI+fqJnx/Vl/+YafH0atJu4jMfXU1Ak5slCk2krWC5qUDPei9G+dErr3hQo8BjACllnqydsCkTVDJ8daRXEMLCiAZtx2oXn/PWNv4907QbKTTq17ViN88D0cbUSl5sZ4AmhiI4w3sWtIsycQJCzF6px074VDBK9t7DXA26QYHbjvCfmz1KtyQL25v+1rNqYLO2yJNA7FirR6gQkCeH+VoiADszuLYpSn8jlomt8qF8PhU4LlGjInvYCczs54/Ji1n5woiH9NVJSAQjO3Zk4NFFUrQHc5UCm7EXL1PgZpZU/d9cmjQvrjPOpnnb7QTygVM9P/3rQvfVTCuQJ8d7PL7hNAqMk1JVunHGAxfQzkySpba+0RkHfw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0BAnRrxm/2bmU4jYwD0P1DN7euNzieQTWpmSOeHIlXndLp2Kdb+lSTADKBLB/nilKG+zMwbFU7zS3C8/9J+j+1X1kOv0bAn/gTLakmOOnTY2/TMKNiXMY5O40UKXyX3S9O0/a+N4si5hil/dL6rd4SyHcJG/oKN2lh0RFCvfBJ2Sp9/ovpO88HPiJ6vG+RtgUsOONARgpNh1OYzQk3c3RoywYV92mc+foK8vq5qQDMsQdDivWKkdOTWTxhBt+YB29SbvTrB1qxs7yT5yTVkVJZpIV4mcQ38lxQtu+jCWw+87M7Age3QVIHD3DJKZmGfsgBwDjDRyabwTJxf+3JQIyp2cQ28qOQvM4jfI0lzpSQAaA2s7zwd77/BQ5cUbgQJ5U4lyMv/yZAAzl4bApqh4utgPcgc+QvnbximZVvnkpCZBzqJOaHSi24GSR0H3NnXI
X-Exchange-RoutingPolicyChecked:
	OPFrkaIlooCel/BECVFVa3lVstkQfbyqA9UZkzOhDckqfhgh/+lm8aRduActh/J2KXbtQmoNbMeONOSCwGOF/UYuIPFJtWGDI3R1uNdMciquaCCe7JLHDnXCuXKHxDngfZnKqYN2uJjmUqotPzTVen0sT23MjjhxKXEtNAXvB7b2etU2sz7y2fb/T9pZiNEABjcP3hksPBR1o3bh9Jv1JOfnFUFmMCKGpmPYpgcbeeMKGPcEjC+ODkxzjCnAIU0QeAXN/sMHfJI0ucDV9f/i3NCgu4go+G2z0Sl2223ClvfM2cf2oMGut3shgTuRHFWca/nj2flse0a1RmNhw1wFgA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 21:09:25.5637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e95948a1-3130-4082-a7a1-08dee83582b4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E65.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6209
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIwOCBTYWx0ZWRfX0qyvQ6UNrnO0
 OfLo5Hop/YuKfsiVYo/fTUFdRAN+f7+3O2Wp+V54r82jMO4/Xn1qsiKZ3j271eg5Q54mdlMHID4
 7j0b0ypxgqDD3rP4O1H3qFOYlGKw6jI=
X-Proofpoint-ORIG-GUID: Jh8SlvEwD-EVKn2iyzjPPwlyYije6vzC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIwOCBTYWx0ZWRfX+qb5RIpGtLBE
 HrNkPhwqFg6eX1gkfIzNqrhcjiCH1mwxWXHvwph88RrdPGZpMZmTphqlOER6aHr806PHs37n0Xt
 1nMIilnkJh+JRJeICk86e9f8Y628QoMbvzBW57yD+kkTdhXR1VmBvPZz43KwLG3CcDqmCC/pajs
 Gw11lO/e6Vq/lrjlgRVGia+Mxn6K/LEjJrX9CFlBxycjOU/2JJBovuWvb1k7opqgkUl4tjbraOx
 T8Nv92Ybex8xEOMcikLP79qF+rrizjZFRPqyt8BFshzT5SphsgAr3JoVNVx+MbXIqxAy2MCL1m1
 yQv3S3b4qb97ITRSalRsNiwNHqKIBG1iwJVGIF7mIkWpSbAO2EYGoxkVEdzS7ucCiyCmBgxNEWN
 +o7A4Pr+pWrtOPukIXVFlxfZK1tRY8hoKfFWCMeK2WApKlA66ZIpop8DcksLaM4z90PfRkj/zdh
 7AyffAA5Ebu43WPCY8g==
X-Proofpoint-GUID: Jh8SlvEwD-EVKn2iyzjPPwlyYije6vzC
X-Authority-Analysis: v=2.4 cv=PsyjqQM3 c=1 sm=1 tr=0 ts=6a61318c cx=c_pps
 a=sZdM9mINdKJOQAUOT6RFRA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=T6ULCQTmkrOtmfDzwM0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220208

Current implementation only has one call to turn the device on -
start_streaming. This can waste power of device as the device can be in
STREAM_ON state, but no buffers are actually being submitted.

e5010_init_device needs to be moved to the resume hook to ensure
register state is correct during any power on. This also fixes an issue
when device was never powered on, but system resumes from deep sleep.
The PM framework skips the runtime resume hook since device was never on
in the first place. This causes e5010_init_device to be called for a
powered off device leading to invalid write and system crash.

Fixes: a1e2940458853 ("media: imagination: Add E5010 JPEG Encoder driver")
Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 .../platform/imagination/e5010-jpeg-enc.c     | 47 +++++++++----------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 42ad9ee3993b4..189c147cb9705 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -976,6 +976,8 @@ static irqreturn_t e5010_irq(int irq, void *data)
 
 	v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
 	dprintk(e5010, 3, "ctx: 0x%p Finish job\n", ctx);
+	pm_runtime_mark_last_busy(e5010->dev);
+	pm_runtime_put_autosuspend(e5010->dev);
 
 job_unlock:
 	spin_unlock(&e5010->hw_lock);
@@ -1099,6 +1101,8 @@ static int e5010_probe(struct platform_device *pdev)
 		goto fail_after_v4l2_register;
 	}
 
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	ret = video_register_device(e5010->vdev, VFL_TYPE_VIDEO, 0);
@@ -1289,31 +1293,13 @@ static int e5010_encoder_cmd(struct file *file, void *priv,
 static int e5010_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct e5010_context *ctx = vb2_get_drv_priv(q);
-	int ret;
 
 	struct e5010_q_data *queue = get_queue(ctx, q->type);
 
 	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
 	queue->sequence = 0;
 
-	ret = pm_runtime_resume_and_get(ctx->e5010->dev);
-	if (ret < 0) {
-		v4l2_err(&ctx->e5010->v4l2_dev, "failed to power up jpeg\n");
-		goto fail;
-	}
-
-	ret = e5010_init_device(ctx->e5010);
-	if (ret) {
-		v4l2_err(&ctx->e5010->v4l2_dev, "failed to Enable e5010 device\n");
-		goto fail;
-	}
-
 	return 0;
-
-fail:
-	e5010_vb2_buffers_return(q, VB2_BUF_STATE_QUEUED);
-
-	return ret;
 }
 
 static void e5010_stop_streaming(struct vb2_queue *q)
@@ -1329,8 +1315,6 @@ static void e5010_stop_streaming(struct vb2_queue *q)
 	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx)) {
 		v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
 	}
-
-	pm_runtime_put_sync(ctx->e5010->dev);
 }
 
 static void e5010_device_run(void *priv)
@@ -1343,7 +1327,15 @@ static void e5010_device_run(void *priv)
 	unsigned long flags;
 	int num_planes = ctx->out_queue.fmt->num_planes;
 
+	ret = pm_runtime_resume_and_get(e5010->dev);
+	if (ret < 0) {
+		dev_err(e5010->dev, "Device failed to turn on\n");
+		v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
+		return;
+	}
+
 	spin_lock_irqsave(&e5010->hw_lock, flags);
+
 	s_vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	WARN_ON(!s_vb);
 	d_vb = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
@@ -1474,6 +1466,8 @@ static void e5010_device_run(void *priv)
 	e5010_reset(e5010->dev, e5010->core_base, e5010->mmu_base);
 
 no_ready_buf_err:
+	pm_runtime_mark_last_busy(e5010->dev);
+	pm_runtime_put_autosuspend(e5010->dev);
 	if (s_vb) {
 		v4l2_m2m_src_buf_remove_by_buf(ctx->fh.m2m_ctx, s_vb);
 		v4l2_m2m_buf_done(s_vb, VB2_BUF_STATE_ERROR);
@@ -1501,6 +1495,13 @@ static int e5010_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	ret = e5010_init_device(e5010);
+	if (ret) {
+		dev_err(dev, "Failed to re-enable e5010 device\n");
+		clk_disable_unprepare(e5010->clk);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -1533,12 +1534,6 @@ static int e5010_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	ret = e5010_init_device(e5010);
-	if (ret) {
-		dev_err(dev, "Failed to re-enable e5010 device\n");
-		return ret;
-	}
-
 	v4l2_m2m_resume(e5010->m2m_dev);
 
 	return ret;
-- 
2.43.0

