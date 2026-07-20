Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD4A3F39F3;
	Mon, 20 Jul 2026 11:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784545786; cv=fail; b=sBn7pT+AP/uWvkBARXI01oKfbU9csllhf7hyM5obp7pH2iChnFc8a8c47Ifnwj0RJNezChHNKMH2ebs3ZIkAno02lt9pgqond84Cy2zYnS8GnZ9SI8GwfSmcvj1U5EfKELY0igU5kI1WgmZnKVpfyOYWB/Yc3BuVS4ARIxf5CdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784545786; c=relaxed/simple;
	bh=ihIjYekTERBLXDwYon1aMsAPVM1SpXG3A+jrxK+6bnc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gc42wUTsGFVSgUqa3eFmbmrLaHSudU68AXYIFlehrh+14FWpb8oDG3FX1vWIuDaOBDcOFnpVzuzEWzHYF5M5GZZSsHi3Cmn9oK8b92NnVC+8Q8EnQ1onffmDlnRasS3oAguwd1Vezb7yB9HnQkZy0W3MWIpyhV7FrdUCmtrUKMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=K6w/vDPA; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YIUJKn3K; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="K6w/vDPA";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YIUJKn3K"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66KAsheL111060;
	Mon, 20 Jul 2026 06:09:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5nsypIxkl3wh1TwYFLY4riDZ82BhRN8v+O6aZOPmQ
	kE=; b=K6w/vDPArVJpQiLwmLzUPoXTwTFowHcU+ScnmM4SOchNMCdrB6bPSDtkZ
	scXrsQtT2E0QQMqbpnwV+BG/pXTPKPllhIzBzSTiSmJlZERFvQX8SbjP907hh1jz
	nH4UZgu7Yqd+fgsFM82OU30ZYWxFoumxQpaTJoAN4khet6ROdFeCD7Wq9PxY4prb
	qksVyhhpxYpWV6NP/pbIAh+bLTlmNvNaFzx+19cU3hF1oREFlCRbnYya9poU/X6H
	TqwOVPEEV3Zc2NyZGqkG1e6Qk3hJKbTsW1BpMoP67mAgDkk1YngNAmGVX5fd+QmO
	ahfuqsq07oG836kzVuwQdJyyD6rWg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012028.outbound.protection.outlook.com [40.93.195.28])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fguemnap5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 06:09:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ET90Kqrzq6+kk7t24oS0RXmDNYBH2SGbKoyPhWcCTpf9WCan+dT7N0xQI+1IzPxOQUKm9fVX9QJNpQEUzTlbI5gqfYeFwTbcws3+4dBDu5KqfmWOp7uPmEN+q0eAKRjG98UrFuYIvH9sFUVZ/H6aPCVLMvK7OYcsKIHisGnMZ4jfYShWclv5KjKho8DDi7fZ6BJfVNlHRJgos5XLesnvMpDN74qweJB1Trb3NeFQ0HxbB1K7NMwVqEHqG7vLnyKCNuua2d44243Vl5o/3Cy2wO9zNurIgTQzPE0Mi3yA6LPueb/FVNNWi4wQKT/0dXsLU61CCOLoC0r2ngcal1O+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nsypIxkl3wh1TwYFLY4riDZ82BhRN8v+O6aZOPmQkE=;
 b=AZAJTWz8mLjBe1UzKh7JJ1G6VhhrXox1Hrcywmc3tzV/r9g2ayEovd24vDpR+kB5H0KumE+cAUqhWNFNCzQcM/bpVARcASp7V3qCS3JHLTK3GRNwNF3BI+lHqvuLo3xAPDeCdKx0cGxYDRww/55GFB3gnOTruFqku+jHdkBdI3oMOW2HBBOPIjnEFwwxXqIGpcem3kUduxBPwGmfuxAdQLNq/C/PsVn0PazxPPUq8Fbu5kLO2aWyLo9S3XuYZN5vSGwIt1tmugkxfngRHAzxThkC3RQnmfXL3zZZRQ073BrF0wv2+g/6K8CjJcDsSahJJEah9wHWuwZp2WPzDQjbcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nsypIxkl3wh1TwYFLY4riDZ82BhRN8v+O6aZOPmQkE=;
 b=YIUJKn3KmAddwGse4qXGY+p0iw91iTR+naLR72XFXB3VG241nw0PwdNzZP8rq2jSqXvd8VDQVOL1OtamwuaXUrgDAj9u/kgSYHHP0jL2w8ljy1e8iWESPsWdRvNipAnvmf2nZZ/TkCCQNcCu7WoiktdYY9s8SGSrg6kov7b/PEw=
Received: from SJ0PR13CA0150.namprd13.prod.outlook.com (2603:10b6:a03:2c6::35)
 by SA1PR10MB5865.namprd10.prod.outlook.com (2603:10b6:806:231::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 20 Jul
 2026 11:09:34 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::d3) by SJ0PR13CA0150.outlook.office365.com
 (2603:10b6:a03:2c6::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Mon,
 20 Jul 2026 11:09:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Mon, 20 Jul 2026 11:09:33 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 06:09:33 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 06:09:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 20 Jul 2026 06:09:33 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66KB9SD92823611;
	Mon, 20 Jul 2026 06:09:31 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <mchehab@kernel.org>, <jai.luthra@ideasonboard.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH v2 1/2] media: i2c: ds90ub960: Enable CSI TX1 port
Date: Mon, 20 Jul 2026 16:39:26 +0530
Message-ID: <20260720110927.3570235-2-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720110927.3570235-1-r-donadkar@ti.com>
References: <20260720110927.3570235-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|SA1PR10MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 49977525-0588-494a-c86f-08dee64f612f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|13003099007|6133799003|56012099006|10067099003|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	e4xwW6Q3oxhCEp4hlW8fNkK8X3Ri/suq2YHIaZEKiQnu3Z8B+yjozIRwDk+zxit3voa2zGRQSvCIuhk2viPS6BfvgPi1X4Q6190A9g+BvwBfLrvhptHRpGpmb5NuH0YUqRHZLiMkzRPNHdZnWfNX03t0PUdifYv4OL/6bxY2hMXXV2PyZgR85KyuHN268xAYhGqrb5wVH7hFTbvj1Ki22Zbwig/1Qsm1/g8Ut84aYkIajjNaLLPRosvSnOPTwfO0BFuADGK8OlXWM5snnEdOD6cjVGTqxLBciw/qMJW3vyiS6RdrUackPUCFw+D4E+T9uLNGIzKyv5hbQW50H6+uAyWzue1BYsuhVG/Dolhzmt/MuqlB6Q2FhAEPU9USfETWK0SE5RMbrQMdDQxXu1Q24ad776Ifx73xOtpzJ+b/YE0LjuEK+cixoULNANvnqdKYBZedWgSrYNprKKDt6uu9J5cR9byiigglmwEgQHUAb3yufqxT4neHLIPDPHmd7HPboLmPc2GyAYKVVkFw4wchkrd+avMrkp660UJLpI4p83RduDTljVj7rYtoGEq+CYNqVUqMCxvOBZYNVFrY+XXOck8q8IWwbq628/vBYiUyxzk52V6I3lMgTGikmxA2QKs1ZHQr7ZFDJMCJEW2+PtU7kQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(13003099007)(6133799003)(56012099006)(10067099003)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bttQwtytFBtiU1ohaD9NIktPcgh07+so4mGL68a2UXWGujaB4PIIqYg8QvjKZHIdiilZpYxczRC8tNZ/tRSTFrGZ685+RzdFBofV2OxqjV7ucoM8n2kmBfh6CxTSHis1BzEKAiLf1BevZULbPPNOb6+7iJ3mhyNDTBMQB6MWEQO9Lz7QWMj5Ussa/Rd2e5nGOlK2wu4vvHpq3omvMtNt6IhMu6sO7lXEW4uRW38Skpp1whyOGtuJGAkcEZzKlzwILGmhpZ9UDvH1O1HMCGDqZAVXPmkKSTmYLQl+bllpi4Fr8B5kHRXr4Hh7zvFyYkZ+r26RoSBgIQ3kzsgAQzRKt4YxK4vNGeE9wGBtnCZAL7Zj/P8fuhzT1881q0N1NxDCJ2fhdVbPbCJEAWhP1gi4u/c0QNjZ4kMtRBCvSu8qKuZRiTk31bYvGpmC/zXSkLpD
X-Exchange-RoutingPolicyChecked:
	RV0ocfSXqIoSQeUDxyced3QuGWGJbp98TkazmnkPUTGnYrbDodoQdJ8BzsHMJmvktin2oqwvCMqfiKDULlEp5935BpjHZ0t/Iw6s2l2dvwgUG266bmTjdv+Pvdw9Zy6nMYYzBZi5q62iNj6ftwzgnSxhgcEmsuO56WOcBuuwQlE9m5AUVXPrihfEiMjlheBbIRk7WYk+w4C4w2woZFK31TNU62/tAuraoWQp9nd5FEo6Zvvv60yEXBg0Iz3JdDJfILqHT+CDl0nDibLqCqrYssxQY05k9TH7TwTrQkNDnvsG9a8YndTiW2QU+hG6EulRa5fRwQPuH7UoGKEtOJNUOg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 11:09:33.9249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49977525-0588-494a-c86f-08dee64f612f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5865
X-Authority-Analysis: v=2.4 cv=N4QZ0W9B c=1 sm=1 tr=0 ts=6a5e01f4 cx=c_pps
 a=ueqEiCdEPg/1B0HMGLd3rg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=qQhfavAqTGy3mrGoeLkA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyNCBTYWx0ZWRfXzuqjqhNVMCCF
 ZotFfn9xNb88B29YA0yZj7h9cTSNLPXJE9RsmSS/SGP2xXwqqIvRdS3nQljrxdvA0Lahb4KX0KF
 3z56z8C6mjyjCogLgoFl55Lfk2mj24M=
X-Proofpoint-ORIG-GUID: 5FzsdFE8d_Q9lAeQjtXJ1cGUbBu5oLFJ
X-Proofpoint-GUID: 5FzsdFE8d_Q9lAeQjtXJ1cGUbBu5oLFJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyNCBTYWx0ZWRfXwBPu6I1fcRV3
 B/uF5K1QxpBTcyrONjjHuHO8TFAs+USL+7uSltOTNc0WM3OmcafYdokmEzyEVAtCsOYCmESE03M
 2BXf3e9JefVmt3rkYtRuJOxzc1CEuilyGSIJ30Eec1hbnkSqCu0ah62H+dNpTuGR698i14ybqvG
 Psf5Q7Wi6xvLE2txpWiOXjJAJ3IvgKGuVa/rKFrw+oeIxQzFHmpFfR6K1XE/FXd8EZlJPWPz3Xi
 Vkd/g4+oQ0LqqacqqA3y2mSI9JBycGbfBTSEn6Lh0z4fnRnnuiAOfpyFdrVCSjwhrmNI0gZeAci
 7SWkHbZaprWzNMENEzeSXpH/gdJqX8qu0aPbf3EUtNS7xAzMCyIZ9+42vXGiUFz+b//6VsXycwh
 1IOznYCcXjQ5tHaPjXQrEwcoSrfACFWRPjJ+e3Eh11HKSnLgT861RcGEWdTyCAn5BBz2oxWdZjc
 SXd3yRyplI+fTMGTOSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 clxscore=1011 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200124

From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

The DS90UB960 chip has two CSI-2 transmit ports (TX0 and TX1), but the
current driver implementation only utilizes TX0. To enable TX1 as the
active output port, the I2C Bidirectional Control Channel (BCC) mapping in
the RX_PORT_CTL register must be configured to use I2C Slave Port 1.

This patch adds a new function, ub960_parse_active_ports(), which is
called during driver initialization to scan the device tree and identify
which RX and TX ports are enabled. The function creates bitmasks
representing the active ports and uses these masks to correctly configure
the RX_PORT_CTL register, ensuring proper port routing for whichever TX
port is in use.

DS90UB960 data sheet: https://www.ti.com/lit/ds/symlink/ds90ub960-q1.pdf
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/i2c/ds90ub960.c | 46 ++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 15a9797b47ac..653dc7a4eee5 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -26,6 +26,7 @@
  * - i2c-atr could be made embeddable instead of allocatable.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
@@ -76,6 +77,8 @@
 
 #define UB960_NUM_BC_GPIOS		4
 
+#define UB960_CSI_TX0			BIT(4)
+
 /*
  * Register map
  *
@@ -114,6 +117,7 @@
 #define UB960_SR_SCL_HIGH_TIME			0x0a
 #define UB960_SR_SCL_LOW_TIME			0x0b
 #define UB960_SR_RX_PORT_CTL			0x0c
+#define UB960_SR_RX_PORT_CTL_BCC_MAP		GENMASK(7, 4)
 #define UB960_SR_IO_CTL				0x0d
 #define UB960_SR_GPIO_PIN_STS			0x0e
 #define UB960_SR_GPIO_INPUT_CTL			0x0f
@@ -589,6 +593,9 @@ struct ub960_data {
 	u32 tx_data_rate;		/* Nominal data rate (Gb/s) */
 	s64 tx_link_freq[1];
 
+	u8 rx_mask;
+	u8 tx_mask;
+
 	struct i2c_atr *atr;
 
 	struct {
@@ -2538,7 +2545,18 @@ static int ub960_init_rx_ports_ub960(struct ub960_data *priv)
 	struct device *dev = &priv->client->dev;
 	unsigned int port_lock_mask;
 	unsigned int port_mask;
-	int ret;
+	u8 enabled_rxports_mask;
+	u8 enabled_rxports;
+	int ret = 0;
+
+	/* Configure I2C interface for RX ports */
+	enabled_rxports_mask = FIELD_PREP(UB960_SR_RX_PORT_CTL_BCC_MAP, priv->rx_mask);
+	enabled_rxports = (priv->tx_mask & UB960_CSI_TX0)  ? 0x00 : enabled_rxports_mask;
+
+	ret = ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, enabled_rxports_mask,
+				enabled_rxports, &ret);
+	if (ret)
+		return ret;
 
 	for_each_active_rxport(priv, it) {
 		ret = ub960_init_rx_port_ub960(priv, it.rxport);
@@ -4789,6 +4807,30 @@ static int ub960_parse_dt_txports(struct ub960_data *priv)
 	return 0;
 }
 
+static void ub960_parse_active_ports(struct ub960_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	int nport;
+
+	priv->rx_mask = 0;
+	priv->tx_mask = 0;
+
+	for (nport = 0; nport < priv->hw_data->num_rxports + priv->hw_data->num_txports; nport++) {
+		struct fwnode_handle *ep_fwnode;
+
+		ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), nport, 0, 0);
+		if (!ep_fwnode)
+			continue;
+
+		if (nport < priv->hw_data->num_rxports)
+			priv->rx_mask |= BIT(nport);
+		else
+			priv->tx_mask |= BIT(nport);
+
+		fwnode_handle_put(ep_fwnode);
+	}
+}
+
 static int ub960_parse_dt(struct ub960_data *priv)
 {
 	int ret;
@@ -5162,6 +5204,8 @@ static int ub960_probe(struct i2c_client *client)
 	if (ret)
 		goto err_mutex_destroy;
 
+	ub960_parse_active_ports(priv);
+
 	ret = ub960_parse_dt(priv);
 	if (ret)
 		goto err_disable_core_hw;
-- 
2.34.1

