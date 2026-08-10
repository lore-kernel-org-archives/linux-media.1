Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092C1331EDD;
	Mon, 10 Aug 2026 15:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786377307; cv=fail; b=GURouzZAob7fCciD0VZtjM2Rcbw/dxxl/bvWyQoGsVuOEUTfkB3BlSq1CgdT17F8/0HkGEQ0JOB/P/s8CMRT8+WY4tFfymsguGBi1vorgHtWE69poV1udgLsXrC+qHJX0zTicQCQo43NyJSv8tUfgUt4rJQLrNDWMoON7TZGjVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786377307; c=relaxed/simple;
	bh=fvDb0djv+gJ52uYC8mlypVv45iuktfOfv5Khg67djnQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X4SMyiahsigsnkHxD6ESCZJTVuNwMp64vf+rshUOZrL+ZNV+xqeXxvhwq7dL7y6o6FixW+ovfKm+PCoShwpjagssfFpgEEPj3lqFrVCjsowRUCkM3YmjGvrUDMfVgM3Fg1DaGiEzOrACA3sT06JfzAjjlAXeZzO7ybYKDkEGLRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=oB/Gle43; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tr0I07YR; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="oB/Gle43";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tr0I07YR"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67AFZCDp3208530;
	Mon, 10 Aug 2026 10:55:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=i8CaSroUXhj428IGcQnUj2v2k41wk99aszkY167gv
	3s=; b=oB/Gle43LukhIQ7/WBDmG+iyQ+XazenyeGovaAH+SKnOsxcTeI3MB1+44
	jkQDwAsGK5uY/SyX8Onxia3wb9t3ud+XmdR7gtLQlw/dMjC7hDLJjnUkM3ZYf6Z1
	0QMRoRBqRh+Y3QRVRJgyrexOkVucThXaTztxBTB/rtfdS8kWqGBvU/6EmMpu90sG
	EmFzy9PcLlWqC324hcLhtBT+D8VJ5VxZfcRlRbmIzG6VetmtERVa5WBklXVrY/a5
	HPQGRdRxnioRUGM0O3fUuVswAE6zC0YkQEEH8EFPWZ2R2vlcE1M/BZzFXn22yx1N
	HwhzrZCkA0k/eZn18FAW2FMCZOh/A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011029.outbound.protection.outlook.com [52.101.62.29])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fydkwstyh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:55:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByeLsNpEqPWiD/VXaAEdx5XAZ7ZzeAwIN5T/Q+c7ELW0LSl+KOiwiOjjYONNIywCFVRL43I5DeT7VR04KQNefw5E9umHm3ROV6JFdUx2puwmKsf5jrsepw+IJDH5cafHP7FzWR7l/c3IU2ft8QdA1fAKNZ2tRnOZZS36cMVWgqThB6M3ngddH2HloPV/hWxe8miEmnBiBKH6pRnLSkKMld7nmdR7m2vxb1qJ/pzkN0tyVtZag2eAv5qsmw2+OV7LF/R1zvpdPOsmC7iMlmE8mlckzfVwpp2WFJVHa1yO3gX0nrz5rk8NIvqsF7K1+qV8aJAwA9GLB/418Dw4j96PYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8CaSroUXhj428IGcQnUj2v2k41wk99aszkY167gv3s=;
 b=Pwei60WbV+8PRR9fITkkDg/ikBaCEiRAnUmIiw3GSjgHAZXUoIEVvSBAerwjqT31QewuV1aoPTGGiXCSc8mRVL9s6pqE/U9gR4UXa40J6JfgsGzlE3zJL36jKyLyc/CtITT5YnEmNNWDo3hBgu2jaisEEjV2kznqQPJbP8ixy1/Zy6AIEhoohO19bwxZeHSvk7eMvrsCJHGkzLEbYKKHWan16Fj56oqksdg5jperalIXGhmDYVhEH8JPdzRP4MkY33r5E/5hCov1MsumI/929ceTLs/GLm7328Jz/Aas3J8vaPmc+UQRZAWImt8qkYJZUQI2u70A1vnRFCaTSYDdsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8CaSroUXhj428IGcQnUj2v2k41wk99aszkY167gv3s=;
 b=tr0I07YRT07Y7rvenDMqFjFzh+PAiwU6y4umOar+G3zo5cCv5V2DJfVI+pv7nxuwU3A42MXfNgEhb2bs9KJ5/yr/Ocub+6cUEI8ecttRmnoP7qs1vbetbuia9GJXmexqk5Yf3MwE5KpQccjP0RlkcsgiE7o9/4RoRE1Ts8z8Os8=
Received: from CY5PR15CA0142.namprd15.prod.outlook.com (2603:10b6:930:67::8)
 by PH8PR10MB997928.namprd10.prod.outlook.com (2603:10b6:510:3d1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:54:59 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:930:67:cafe::a7) by CY5PR15CA0142.outlook.office365.com
 (2603:10b6:930:67::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 15:54:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:54:58 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:54:58 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:54:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:54:58 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFsrGR3441469;
	Mon, 10 Aug 2026 10:54:57 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
        <benjamin.gaignard@collabora.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jai.luthra@ideasonboard.com>, <k-willis@ti.com>, <b-brnich@ti.com>
Subject: [PATCH v3 2/2] media: imagination: e5010: Enable autosuspend for runtime PM
Date: Mon, 10 Aug 2026 10:54:48 -0500
Message-ID: <20260810155448.3628054-2-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810155448.3628054-1-b-brnich@ti.com>
References: <20260810155448.3628054-1-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|PH8PR10MB997928:EE_
X-MS-Office365-Filtering-Correlation-Id: d0755b41-47cf-4294-6f5c-08def6f7bb08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VPB9bkRw5u7GpQpjRStU31Rwf9Rb3/rgFnEsZvJisArSmiZ+4mD2ZrYo68QB5GsSTlr6Llno+zip2WLZEtU72iXKRstsne6xwfWfSejYIICw/P4eICc1unFXk7q12cFg+z/Ydsf+jnnHothsl/7OC8KB6X+nr7oSu5ulazbZLFiHehT0/qnMEvBGcQ0oPTxmEjJ/3uFtaeaGWydtoDAmEWA8S3YflxOXAkg0Zx1fdI4vVsreFbRmwSDTU+AEJ4G6m6vgfPSVY0szesVX1fIr1gXSZwRnO7J6bM3gIRpAO8q5LSGGJWqlwj1dVcR+ZUX3K8f/Mm7MUAmkfISivW0vyFPGDimzYhUx6AewFBe9QuxJ6AhhRybmJa9/Ck5syzyxyKFir9dZpsMRWxudwARN/TXC4IIj1uk0mnhvJS5y91R6FwOAbAJGRMPTKLSM7ekUhxHILMaegARb5WcVf4LZLHUSHFL3oLwTOgig0kZIqMsZ/Qrq+cSpD1/FCaz3CNISnjO2s3uUqkjXgjRTjuyp+NOdKDIBJKkrTGjGr1B0AfVDnuekB0V/3g2XJdM0UN9g9Qq7ZVVFN+M0k/Hce0CT0XFur496A/ezWr754EH0j0dr+AaUMqXyl0dTTug/TmRdksXKF3vRn4zn8QsVytW2L00iXcRlE5JAd3nPwy5bmrtE3QRKrh5TKcituWEveWLD/fxdBAcq92njht+yMpqWlA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FhbXlknE2lXATecWxdWMUV88Nq52UdBx5pPg5eS8rf36F56d1wM2NYSC8u0SIlQQ1SmoMDC5zekwobOfihMRZ+DhlrhRtx6iEQ278RYGJtrYmA/lwSxPSnE1T2xcHvaYe5YWTtFtHJ6lKJI7bB/9Xao4gS5aCNz34IilFzW3NNrLtpBt5qHN/nH5BWj5P/NrGeOr8F8u36jA+X7+QaWt7PMLIX+/ah9MHre0NrZO05luzldGR9Fa8gcjBh260A7MEBKia+FnfMOizcm7RRWUnZsuFGZ79iIpf7srzZPOw1agNXJqw9MprTFOweBHy22fw2CIOiPmEM/KbKJtL1FKoI+YG3+ewW7DEb3cWAQy9RfcJVgHk6AHR5OUTuAlYw8WLYHD7QLenu0nAqeXLhZ2z0Me/MePKwNXeMh7X1WuvTpdRJFNx6T/MVpU17VxHuy7
X-Exchange-RoutingPolicyChecked:
	AQKhYdyFf1Pg/jTZ8p2RmmTz2LOki4xEPW5A8iFaCsD8Qlb2TfwPHCo2591yJkM/QOBrd67/Pyt8TXCbqORbvb5t54/hMFekeZavf7at04mcwEnIskLivpHch4XJW6imciW402SJxe7ModNOztTyJcadh57zOPOUZ07zI75mon5gJN4uvcEFA0JYqu0ELL/ZRSKwKOx3tbDbSgG3OesRZr3yONyLQGdk0NcGfYRwjG1+O+VI2DK3hqjKQni7TkSCTPmoI1OM2w1O20QYizCk5ZjXR5hNec2XmxqoVTiMqe0F7L41zXQdkJ0vFqZB0L6kTmIfhuaWgBMeug0jVfgRaQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:54:58.7384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0755b41-47cf-4294-6f5c-08def6f7bb08
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB997928
X-Proofpoint-GUID: OnKriu7a6J9PXnSW4pEBXfsfzf2DfaN0
X-Proofpoint-ORIG-GUID: OnKriu7a6J9PXnSW4pEBXfsfzf2DfaN0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNyBTYWx0ZWRfX4dty+1lPqkWZ
 N2AZlsrD2fUmAA+qIBkA6pGRthqncvUDV/bNKhc2dvZTts/aWSXy+n1uqMmYxzpJ0Ugkv2XOXjQ
 kJ9U9s8q6LCpuCKODxZ1YR4rAhXan9wHTt60HiG+VVm90jzALTOIR/r+j6nmRGg/KPssL+2ECx0
 2QZLQQdbiNG+GjqJWHrCH4N8yA4A+q+jzyh9P5mO2SVBYmiJlNuXku8s9F5lBjBd3h9xaHSh1BS
 MxjdtpsABuQnsVpg9mEgv2Nx1/66WjmzjebcYaKp2c9O/ghRjS8zll8xmH5Z2GXaH9DpZgVIjJZ
 cK9g/m4nHwovQ2p0Ic9dYxhviySgFIFC/NSb9iQRvpX/uaSoqPgbTL/UVgHNRZEvPaKzXsIeDEa
 qOIsUNo5GMSBvLz7Wv5XKQrmwUTRlsbaAoReVzXA4qsxbU5qcCWrbKOeHxEtpgG9zOWGK2w6mrT
 ufJRX3Gm+N7yQYE+BYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNyBTYWx0ZWRfX3reaDQX+4l2N
 s8gZhomdGD+DmZZaDlAW7kFHwadqMhhxUabGoLiklyavMe7qAJ2nfJ41Z7FSwvmoMZsKGfCKKh2
 aQT9jclxdmJL4obQujzGEzM2YKADV4I=
X-Authority-Analysis: v=2.4 cv=F8FnsKhN c=1 sm=1 tr=0 ts=6a79f455 cx=c_pps
 a=KPt2yGXPmw0TDFl7M7pFkw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=P2FezZL9-y6F-MOhGTEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100137

Current implementation only has one call to turn the device on -
start_streaming. This can waste power of device as the device can be in
STREAM_ON state, but no buffers are actually being submitted.

Reset last_context_run on resume so the next device_run always reprograms
the QP tables.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---

v3 udpates:
  - address sashiko feedback. set last_context_run to null to ensure
    that next device_run will always update QP table values after
    autosuspend resume.

 .../platform/imagination/e5010-jpeg-enc.c     | 34 ++++++++-----------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 2b98d230429d1..42fd6373e6e7d 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -976,6 +976,7 @@ static irqreturn_t e5010_irq(int irq, void *data)
 
 	v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
 	dprintk(e5010, 3, "ctx: 0x%p Finish job\n", ctx);
+	pm_runtime_put_autosuspend(e5010->dev);
 
 job_unlock:
 	spin_unlock(&e5010->hw_lock);
@@ -1099,6 +1100,8 @@ static int e5010_probe(struct platform_device *pdev)
 		goto fail_after_v4l2_register;
 	}
 
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	ret = video_register_device(e5010->vdev, VFL_TYPE_VIDEO, 0);
@@ -1289,31 +1292,13 @@ static int e5010_encoder_cmd(struct file *file, void *priv,
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
@@ -1329,8 +1314,6 @@ static void e5010_stop_streaming(struct vb2_queue *q)
 	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx)) {
 		v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
 	}
-
-	pm_runtime_put_sync(ctx->e5010->dev);
 }
 
 static void e5010_device_run(void *priv)
@@ -1343,7 +1326,15 @@ static void e5010_device_run(void *priv)
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
@@ -1474,6 +1465,7 @@ static void e5010_device_run(void *priv)
 	e5010_reset(e5010->dev, e5010->core_base, e5010->mmu_base);
 
 no_ready_buf_err:
+	pm_runtime_put_autosuspend(e5010->dev);
 	if (s_vb) {
 		v4l2_m2m_src_buf_remove_by_buf(ctx->fh.m2m_ctx, s_vb);
 		v4l2_m2m_buf_done(s_vb, VB2_BUF_STATE_ERROR);
@@ -1508,6 +1500,8 @@ static int e5010_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	e5010->last_context_run = NULL;
+
 	return 0;
 }
 
-- 
2.43.0

