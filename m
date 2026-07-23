Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279BD47A898;
	Thu, 23 Jul 2026 15:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821342; cv=fail; b=pM5linLw9S39IW8z5uB3jU0QIVokqXbqs0eOuGwB5CUFDTCObp+3LLj2f2N2n1xYykJGHOjJb4gtxtUhHQBJPtbT3r5/XKqPYrjAsBcQ/Wta7BYB447G7PDIcKQSCytlRkajL9PRBmZ3nv9pqANeeirmbOnuRmhmoFCb9b5eLRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821342; c=relaxed/simple;
	bh=JKH28GPaPk4YxHO/6dza2Z0WycBypLyDYDW42kXOgUE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dgBsOtbNsfQsMAbRrpYzaq8Ci/0K+tzxNzqdYVV9Y6zc/vN9Qhz84OUXSfZFv9wqrZ8Ajys5u7psXFAp5psfZW4VTJowaZLyDIg4oVJNkgZ2mZzb7rk1aiF1/0/CaBve0NRLDuNAv+nHNDpZEBftcyOVELYoMvNepOQ7ftH2MXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=HoZaXf5E; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sUzH1ib1; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="HoZaXf5E";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sUzH1ib1"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NF3wJN2707596;
	Thu, 23 Jul 2026 10:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4+Wzh4Dx23+Iz15u+C4AeAXOyCALzAHdSiGZ/V3ft
	lg=; b=HoZaXf5E6h5Avgm/dlYsiuld6sE/FK7uRfSWyYQn9gmh0YNPKGWJdYfAS
	x1UL8Kjys622UUPn/0eKzJwl8cAF4lhpTswVP1eLBSH1xC74NCNe6730KdXISZi2
	zhS+4ImkwHNXtVMM7h4lTOUZw+/ySPM1gGNKung4+lc9Ra4/Pw0/iK3ir9c8F6Bt
	dDOISaccjYPY1R64JZsTng1MDKEh0HgWPBB+wfV5cHh6Kj04jdkUpO1OTBJ+KyOv
	gq82Oo0gNoSKqcgWSj2bH7TQOaxayA9BEsYwwHvtfHHQTOgPg+WBgm1DlsZ7KhRM
	e2jThRrfyhvfbuUXaUrC+PXPopprQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012059.outbound.protection.outlook.com [52.101.43.59])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fkhux1vry-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 10:42:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMtawqoh7AGQXWk5aKXtJ+v98TwolKt/xNw9YOM19JQ72VXXgYTQDGkOmIAtJROQZYs2fJk9BTI5KMbQxKJfE2e4fs4GwypS4+pa03to3f0p0Wv2PH1Qev66v2ptbrvqZ3VxnPZC8VpXev3mjSWV0Zh41+dz3UISmHd8GEwBsGHZKW3FYsuJAIHVyXFd0V2Q5HRhr1uI1gbq25LCbzRPm7APsyqpsHBvmr6qqPHCh+kJHztE7lFwfAIpKKfZjqdFkBSID4PMqve8llgMo3FM+t0CXwc5SbxtNeBF68mX1dtdLkb+aRaVbhf+YmtRi8qsri285FZsoq0Et5Hrn258GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+Wzh4Dx23+Iz15u+C4AeAXOyCALzAHdSiGZ/V3ftlg=;
 b=I4oirdEyGhZp7EfNZkTN+9RJPZ8NEdNerUHO4qiIzbU4msdDaB+tTJEYo5DGhMSmEL2HLrIJU3pxYORcmVIgP7XzcGI/DW0/+A4fqwfkAqyyxQTkdHJwi1qG+B5pS9BLnXrgIs+P2yQz9cVZ8JWj2LII/B782Jy75M0S9KknU4ggZTeNv9/LCNnkXQ2b0cAIClM2aVyiMcuVAgUbHQYEt9v9UrRkSsg/nhAxCOQq3C1iyrPHWdpALWD4/msDkB2BF2QUxqVIh50zAmHhCztR97MnLaMUZAE3KhJnOd108nZ7dyc4wxgEduJkn1Bt5vv2gsPFY3qAqvYiXRmEYyXhpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+Wzh4Dx23+Iz15u+C4AeAXOyCALzAHdSiGZ/V3ftlg=;
 b=sUzH1ib1xFZv4om4Ajp/fpbFBpg83oq6uHcMhbFCNElMpxEysP/3P0aRKq9BNtfZXoViQd8T3PoKml6ewaa4Jl7p4SFbkVoCHoK5GzDxmS32R6GsBrobe/P1c77AJKarsX7pSoG4hikfY3P74XVf2GgaJ1faupjxFbY1C1jMZF8=
Received: from SJ0PR13CA0083.namprd13.prod.outlook.com (2603:10b6:a03:2c4::28)
 by IA0PR10MB7134.namprd10.prod.outlook.com (2603:10b6:208:403::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 15:42:03 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::cd) by SJ0PR13CA0083.outlook.office365.com
 (2603:10b6:a03:2c4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via Frontend Transport; Thu, 23
 Jul 2026 15:42:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 15:42:01 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 10:41:29 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 10:41:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 23 Jul 2026 10:41:29 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66NFfQ9v2002945;
	Thu, 23 Jul 2026 10:41:29 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
        <benjamin.gaignard@collabora.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jai.luthra@ideasonboard.com>, <k-willis@ti.com>, <b-brnich@ti.com>
Subject: [PATCH v2 2/2] media: imagination: e5010: Enable autosuspend for runtime PM
Date: Thu, 23 Jul 2026 10:41:17 -0500
Message-ID: <20260723154117.1917644-2-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723154117.1917644-1-b-brnich@ti.com>
References: <20260723154117.1917644-1-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|IA0PR10MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: a93eebf2-7574-4f22-d449-08dee8d0f01a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	A2rbMSQ/Q4zlt5TSMAC2oRb0zmmzhAOu2FfctqXazKQtpg6gO/qVNdlwyMKQziiwIS6u/k2PyLLlfM4wHn44byFAYzRYNe6/M1K9qDulIotuibSXyOpGT0h+meA/bgq91YJuhiYhnnW4LguuOMXkRpg7ns/O/yEoak1nmhKCB4ednfF1xnUe6wtntCCSD5yqjlZDFuXJ+OTPMiZM1orsxAAzXy0DwZ19gxG8ULkPdOBNaUAF5zJOdPCFKpxBU/Evx1DT+w9GuMLcZFd9s2JBqSFIkrLnZ3VF1vQ0sgmXNyfsCAZppKo/GXI/eq/j7GQeEc9yuOacxnmJt+3rEswmgN2zRTxWmp9XKEJJDpEt0YaSwjOitACSrwjuTeplrVrD4zWS+m+jy3ewOt2gZ2JR/9mwCLGIwCzntvzhnaqOjek24Qrgk1nNoTvRXRIS5mmExPbHWu4dWetEaZXzu3hDbJ7FOg73tBEcsMsmf/6iA/73tPVDOTRwdf2jxQ5BQGG2yz2bGFo6+Zxk+i6GsWsYmjjS7H4lKMIZRNNB1mzwtOwRHmBYdGs1C6pZUA7TacsyNRPMhwGO5D/6fo2F56NcDNZUFYxQ3gGyLAiVhoBhhO8DRWCjbf2pAjQdzwPfStz0J8Uy3rNETvx9k79QaoNEClUCRoaAAdeLMfW6ZLgPKabfFPsLy/MQzCw2DEObTYfz7S8VJsrmyeAxkh72EQC43w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W0sCQGUxq6saCaRbaBglmGlQz4oH+9fuY1oC6HxE5/XUivd6P8EFJDP5a93Mw3zv8zY/ciVytA7MuMbsjZbMcx25/9FFx3xq+b98n/d/mQ8TDaWJ7QFtl7YB3GuZzWXadb0WiGAau+9OxMDDObFjX3ArYjipx65b5qf+kAzkFOdoxgW0RxwjBd17NDL+CZQe75GLJY/Zke0iuw87kEUQ9etaCezwdE4URVtmm1tpiz3AU4yor3STPAqhu9yP8hzTRDsPD3FJH4NvpRS3hgMOXn1povwTknZH3s8nIaxvneyWwNgp+mRxARYIW/fVNyIABdc6Vz/SMH7Z3PUgcPyj3xCkHPxjhPuadsG4nalVVaV7/LNhkjTWc9uowRxPmxIw1ohOgQbPW97XNY2+U7qI+u5fZwqtT8eTEzXfNMOGbM7L9EnMkWDJyFR6YcgDni8a
X-Exchange-RoutingPolicyChecked:
	QLXgzVEkjAhocMxUxxCMMYcBg3vbzfXFmkyEUwz1nMSsFWIKVpY4tVP2p3SVHRs+YyquT1pE8HqtNxkro2X7DUUic7rdcWrg5TQGsypcVzj1HBqXOMCvzz0FLe/qrPGpi6NoVRlNTNf2RIoDVOjSryup1E492s8UhEKOd1vMc5ZYkhbVpTut8Bo2O7+vqw2GGpwftScCQAqerJD4X6AUgUSxLopjHBeMmvx1Ybt/4oVOxwFx1LrnW86KE52b/M+MeZIuVIgtjar/B/NK1nEW+XZv8utS2uOBePHKTba809sgM/X4UPoerrh1a/4S9vLyDztw64EwpPtHS2pYROwBPA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 15:42:01.0997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a93eebf2-7574-4f22-d449-08dee8d0f01a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7134
X-Authority-Analysis: v=2.4 cv=c+abhx9l c=1 sm=1 tr=0 ts=6a62364e cx=c_pps
 a=tVU0SsWZS/EEg8/MReKahA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=z4JaahNfH7QgrJIjwK8A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1NCBTYWx0ZWRfX+QnCawLAj/T6
 zdgiipBzbUrJv/XClVQU6JZEuXLWoeDxinKD1yCsaJmElPQ4S/+ON3qbbk2Rh+lVhuZW55wD3kV
 Bk486GQC6bvFZdxF3u0FWwcznrm7kCo=
X-Proofpoint-ORIG-GUID: UsUF85ukzJkqNWTNFrEbMLmAixWV8LrA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1NCBTYWx0ZWRfX6aweGvv957oa
 uJccWqNuS66OlGHAMdAjLq334t2nHFhPwTJcr34p5Cooa/Qp+w3sqxKE1Ga2lR8xNalcU0PKFW3
 gYX5bjExFxRqbetj9tbbp1+X4+tLbsToPCVi03Ah1AElGdo3bMwVw4VpW+b8UNYghPPqRLPSeaE
 ZCZCCWDPj+Il1pP2mBzaz/rjxsqe2JMuwNqhjR+Slks5yD/43NHvU1bVCzl6oLr/zpjxJSvOrS2
 FO7z+CEev08PM60exA/lKJ6iiOMCOa3pLAOsaqDHBFupmyv4LdpmNazgsnzwxItB91iV0ZJUC1T
 Av9vnS4v9I9L59GIZXF6Z/GW3nfEavg8L7guVjgmIgsjhhZ09LjQth8JRT04qbubsNLS/Xp8Al4
 ARWVFjnkjJA8q+PS4dbBdunh5mABW8281tgt+Cj6xQSJiCpxdJs6poxd3VUDZ6U2Ch57n3dg/WZ
 FyQgqxIwccWFusHlCDA==
X-Proofpoint-GUID: UsUF85ukzJkqNWTNFrEbMLmAixWV8LrA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230154

Current implementation only has one call to turn the device on -
start_streaming. This can waste power of device as the device can be in
STREAM_ON state, but no buffers are actually being submitted.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 .../platform/imagination/e5010-jpeg-enc.c     | 32 +++++++------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 2b98d230429d1..580490d1a0f45 100644
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
-- 
2.43.0

