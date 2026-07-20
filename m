Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69C83EF648;
	Mon, 20 Jul 2026 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784545826; cv=fail; b=UIeuZZED9EmDm8majQizXBLMLtataWuhFHG8+icxWbixcCmK+/kQnMl2bIwSU6aypWAAoVwu8/MngweJYL8gALkCEttguJ66aIJ0Af6B49rvScQ+g6Q8Zo+KeDT/IVyJUKIfUkhr55VY28/dTO2V1inahlrAgI3vgU9rw8YWe/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784545826; c=relaxed/simple;
	bh=cb0lbwr/7x0YSBN+g9as7U3XYv86C1GuHpLZP8gNwmk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RUb79blShJ2dl+0EVoRzr0/FQjBZTsxSaF/e9nx7yA4g9KtBgB4Nd0hyKuWCb0XHPKNFa2Cy7zFlvX+h9kX5xVmzAmT4+Hm/tT3IpfAarFSW2W9/M69LEX2SSMiL4Bnz82kyGFw1whVtdksCjGqt6V7jHMrFUll6r+NfwTa/b9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Az6FuDH5; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aGmiNzYj; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Az6FuDH5";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aGmiNzYj"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAsiNJ1969487;
	Mon, 20 Jul 2026 06:10:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=gLaC+J2fc5GN+UbG9pS2/DwYB+1s8IGcM9N1CVZFs
	CE=; b=Az6FuDH5C7g+MX6phv8AuV4n3Aj9t+8y/D5Q8nMOuXdn5DjS4ISSttleK
	Zprzbg/PBcMyYYqOMFVzXt7g4bZEBTgvRJzb0lPe0bewi5g7YpxloZze2sR5MGV8
	E/Mo04QmpeazV2ktytf4iRUVaYCaDrBCkMDPp22lmR+5tInBgz91h0r8jMBHS3NL
	H9ibnZzfpupIb7sxjWrfjxaQ0cXzZdnnVVv+F+2n/B4rb8fGOjl+PIUYKEA+S1YH
	fgnIyuXnvVTuxfKLQG5D4SOFqlGRspaOqG2aWltWJ6SLKDXh5wWhtswswN8E75LY
	al51SVnuBP2WGMz07fMPto/uHF3aQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013006.outbound.protection.outlook.com [40.93.201.6])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fgrmkwnwx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 06:10:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsXWy/+PT6TH1OBkxLFUYNEUcTtCf7p6WFB2ufZ/uPHlTXx7kC2zpU4M7sOsvl/D5ouk+G3LF8XDDPzsJ3zy3p4+Io5ocfxyBUoeMc1ceemvfIkEnUYjU0oXF2J7A/TEZKMf3KEQpMrkxRYR9nYDTVv70D3ZQp7lFCfdBzzOD2+FtCCI0DN3QM97M1zTH4Vru2gR4XeH0Rn4aQvZznjnRSHx+3MfAGljUUnj5mzhtGXw03btC1x09i7DFa32AWDE/KnHV0qqNum4OtbFd+t/dNlsrbf4yRneDkVlK7lYtjHZv2s9WHNEa+O0uGCCL/sQQCsSDkj368DnMabFOKsu9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLaC+J2fc5GN+UbG9pS2/DwYB+1s8IGcM9N1CVZFsCE=;
 b=HVnsPwnvWjoaRaV11G1SuySx3j2Lgm/HRIjKhVcJSr8tUYzzfT9mjugI564JGZiZh47yr5FZJIQarpMRwWm/CIveP4Ys4XfQDt5aCYSk3hJL2E7boNvMzg+yCcq+4wrJf63iYkd6OUGd11VbFCgJcpWK2YSOn6q3KcgXjSWehQH5Pwz2iIS9itZZLrQHU0t7gT6ITRENRo2rXzBrI09n/LQXDEzQlc+Vp+G+9VduUtxbvAa/JrHELw5mZNttIZ3iq2jSzVlNpXEnwKXeAfXEvP7keINxs9jGThl2/DYPT/8G5kqR5B68Q+8DPmI1LQEif7DhjhOPpnCp5A+qKxcxbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLaC+J2fc5GN+UbG9pS2/DwYB+1s8IGcM9N1CVZFsCE=;
 b=aGmiNzYjDri41A9Rf1hJ8Hf1mcysvgPdncChpCub5mUJgEPwdtpiLm+8PFnX+/SOz0P7ETtpqDCYbTtH9S+bs6vdh0KHuw9vINsUecns67CEZDY1fWGkhiRWoGIeo1SU6OaAT9x2Jvc8NbLar8q4TMruAXxBThwPVcejiND8N9I=
Received: from SJ0PR13CA0124.namprd13.prod.outlook.com (2603:10b6:a03:2c6::9)
 by DS0PR10MB7222.namprd10.prod.outlook.com (2603:10b6:8:f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 11:09:38 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::46) by SJ0PR13CA0124.outlook.office365.com
 (2603:10b6:a03:2c6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Mon,
 20 Jul 2026 11:09:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Mon, 20 Jul 2026 11:09:38 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 06:09:35 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 06:09:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 20 Jul 2026 06:09:35 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66KB9SDA2823611;
	Mon, 20 Jul 2026 06:09:33 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <mchehab@kernel.org>, <jai.luthra@ideasonboard.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH v2 2/2] media: i2c: ds90ub960: Support multi-channel sensors
Date: Mon, 20 Jul 2026 16:39:27 +0530
Message-ID: <20260720110927.3570235-3-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|DS0PR10MB7222:EE_
X-MS-Office365-Filtering-Correlation-Id: 592d7610-4fab-4f71-0c60-08dee64f63e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|3023799007|56012099006|5023799004|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ThLQVcCRnBNIG6ON6BeZlCtK55NdURAuIMBW2oWaJR4OquQWXD8wdSqyDRCOp7DDgANxeQGN+8cREbnIKubC/lL1kNm+jlkneBqT1BINurTZJSRZ8LH28DewuMADN2GySXKvlIKl66j4GXwyY6ZyYeCkoUiNg0HvMdCa/P/bnjS1hcbFFhV+cITSHjbwcWbvvcZZZhn7gYRetbrEHh5PKO7P5f2H4ObmtGesm1pwaE/34JpTbQ0EKaM6DyJTM/FIGlxJiyBIYU9q1gpcSWEio9NvKVdN3SR7UuL7mzU6nUevs34Zt4z/MSWxZrKU3zu2OzbC10vwRWGEtDccL+TbIbaRn8Q/gHdOkQaph8Ip8VBjPD7T4eUVJjXMgKpA0VCt3ybhatPGLUICE6+GM8G4KV5txFVc1OdksRG2gG4bXy3TXi3F1bk7/VKtD/DVxtrz+lypnWjDrqHrzRKcEe/FPLsrUZfAmU/bLXVUAsqtTX7vgshZ5xx+tncdz27sVkSmnTw6o803RxjWb09cKeZXsntRXcEHJ29vpvt50mQzNbxkxiI1HmtXXOASlL8APAk8Xv7wdNeYk0FvK6C003AZx9e/DFBl5lr8s+sbkIgDn10ZVD/eqmwuqM4aLjE3RMWdfsSx5tNmipsGmU1oO7KJ3KiHHEzF6l7WsGV7WdcWRv+fUIsFiDkPArpC38zVDkzUXidmqXE+lhEbbM05Z4QPug==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(3023799007)(56012099006)(5023799004)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mAG/1Ky/QeGqZmVj1/iPsUOu4mJlNAdefjc4q36YGj1dP0WGWYfudgU3UsO3aHE5cElDt7CFU9fYTvE6H/r1tIA4BnnAImL4vA+FY+hBhaJaXW1wNkuuPtgKIB+rs6NEJcSuOpVnqVzWsaLtpfobFpo+aFWarw8xTzcN8X7CVcNDbvR9gL0H4oxh/qCMOR4UInZQRLxHN6JYUo0EHjEwWXMonNTj7VvjshXNio/Mi1TNis6SxyBECPcAifGzwGW5rMKaVaGhdMMD9CEpAuO7S1tdNpB8pNdgK0kox8UYdDWvK/DtTjHEbyVNx0kIfIwOdb+L/p2ii37UoqJFCpWD6qJXjluW8u47UICZOxBGJ84D+jcvR3jyhFWOQSi8qKhyYmm2t8sAIamLQPpoaYWhZ1a3XLIkG+XClHqK9Vs3VMhXVa1gXUhQ0ovTxJNbV65q
X-Exchange-RoutingPolicyChecked:
	nfIV0d74UUw/CZCTLKNk8CsNOm6197AKmNR+sj6D8bVIoybPUGAVl6IYFrnRlBzAFgu3HRDdDx50uFkFwMlaPcoN9O6UilGZ1diza0TFWECWHb8qusSfKpSYBW08rh7ObkHQFCTB2j56jV6D28YtyaYAoJ1N2+heyt59Nhar6XZ/cAgWqa6MbLDtSnksgsci+o7JC0XI6XbxWIhz2KBxH1iofxUljTZoYEYVk7BsZbWuEfTo1xbK0ljBGCp7f0lLkfBgjM9hA/g5gXSuxliqfduvrCl1fjHTaLgGxQuxwuN3nEDPr48N2iVMcoZ1E8/5BMWx8w63L4JHed7iRfRtSw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 11:09:38.4381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 592d7610-4fab-4f71-0c60-08dee64f63e1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7222
X-Proofpoint-GUID: m6DCuNaLsxPytBCyUMTbeu40AkYlPPTX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyNCBTYWx0ZWRfX17K1llFk1fiP
 03Y3Eb4UY9ZxHXtSgaVu6xt98/DpwZrgtTHzv7sk21NZiqa68cc42uPodnPqDj0bh1qZdy+/Lfi
 C0sKq07BAZrHfYQ4J0DiSurAbyfvAlk=
X-Proofpoint-ORIG-GUID: m6DCuNaLsxPytBCyUMTbeu40AkYlPPTX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyNCBTYWx0ZWRfX0IlKq0tRARWO
 +zx+6SETSM95V+4CD29xemJKiLanhYYLuflevj99s2aQOmuA+1wxpzwoZXbxKaQSvEi64EBmzWX
 Vw8HkGz10fUcfH/Zjy6Hbj1Jf9l/fYFA9ebB8Yt/VsVpL97ACK79fFDud339UrDasWc+HF1lITL
 iDnvipuSZa+Q1LVxUYVO8+3oX0KiFovCCELT71gNoG/7nTI9lFeJDNgkgs2kBxZG6uYgDSQMxYt
 ge68LS19I02eUiqqpWlyIJOVOWm2zoY0jsGNRerGyBQkNHA/d03uTFrFjBJtfDV8soFQiEuhhTk
 ut79okb/eM8dAiwkgjKBYcZJ81JJ7lXiY/6l3YyusxfodasKvEMLn2pk18jV917HmaOJ4i0BwTw
 VW7LXAcAt5LZqZDjBselqXl4Xbjw20NDcI0F/K9bQ2Ef40WMV+ADCzdmmgevzLS1vDsBzJt79nR
 oJnISAmSmcwlbtDJr+g==
X-Authority-Analysis: v=2.4 cv=KIJqylFo c=1 sm=1 tr=0 ts=6a5e021b cx=c_pps
 a=/+xYJgQt7uUW31a/4HdwMg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=b9NraOpvF2LdFZi3UlIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1011 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200124

From: Jai Luthra <j-luthra@ti.com>

Before this, the deserializer would ignore the virtual channel (VC) ID
set in the incoming CSI packets, and set the ID to the RX port number in
the outgoing packets. This was done to support multiple single-channel
cameras, all sending packets with the same default VC ID = 0.

Now we check which (and how many) channels are under use on any incoming
FPDLink port, and map it to available channels on the outgoing CSI port.

Add a dedicated virtual channel mapping for ub9702 deserializers which
require different VC configuration compared to ub960. Update the
configuration logic to select the appropriate map based on the
deserializer type.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/i2c/ds90ub960.c | 194 +++++++++++++++++++---------------
 1 file changed, 109 insertions(+), 85 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 653dc7a4eee5..9ce6d9e6e3e8 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -72,6 +72,7 @@
 #define UB960_MAX_RX_NPORTS	4
 #define UB960_MAX_TX_NPORTS	2
 #define UB960_MAX_NPORTS	(UB960_MAX_RX_NPORTS + UB960_MAX_TX_NPORTS)
+#define UB960_MAX_VC		4
 
 #define UB960_MAX_PORT_ALIASES	8
 
@@ -3471,40 +3472,100 @@ static int ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
  */
 
 /*
- * The current implementation only supports a simple VC mapping, where all VCs
- * from a one RX port will be mapped to the same VC. Also, the hardware
- * dictates that all streams from an RX port must go to a single TX port.
+ * Map incoming streams with different virtual channels from 1-4 sensors to
+ * unique VCs on CSI TX0. Sensors using multiple VCs will work, but due to
+ * limited total channels (4) this will reduce the total number of sensors that
+ * can work simultaneously.
  *
- * This function decides the target VC numbers for each RX port with a simple
- * algorithm, so that for each TX port, we get VC numbers starting from 0,
- * and counting up.
+ * The current implementation is limited to using a single CSI TX port
+ * at a time (either TX0 or TX1 and not both simultaneously),
+ * as that is the most common HW configuration found on boards with DS90UB960.
+ * For using both CSI TX0 & TX1 the below method will need significant changes.
  *
- * E.g. if all four RX ports are in use, of which the first two go to the
- * first TX port and the secont two go to the second TX port, we would get
- * the following VCs for the four RX ports: 0, 1, 0, 1.
+ * VC mapping differs between ub960 and ub9702 deserializers:
+ * For ub960:
+ *		- Each VC uses 2 bits in the mapping register
+ *		- Supports up to 4 virtual channels (VC0-VC3)
+ * For ub9702:
+ *		- Each VC uses 4 bits in the mapping register
+ *		- Currently uses only 2 virtual channels (VC0, VC1)
  *
- * TODO: implement a more sophisticated VC mapping. As the driver cannot know
- * what VCs the sinks expect (say, an FPGA with hardcoded VC routing), this
- * probably needs to be somehow configurable. Device tree?
+ * The mapping registers determine which output VC a given input VC
+ * will be mapped to when forwarding data from the deserializer.
  */
-static void ub960_get_vc_maps(struct ub960_data *priv,
-			      struct v4l2_subdev_state *state, u8 *vc)
+
+static void ub960_get_vc_maps(struct ub960_data *priv, u8 *vc_map)
 {
-	u8 cur_vc[UB960_MAX_TX_NPORTS] = {};
-	struct v4l2_subdev_route *route;
-	u8 handled_mask = 0;
+	struct device *dev = &priv->client->dev;
+	u8 nport, available_vc = 0;
 
-	for_each_active_route(&state->routing, route) {
-		unsigned int rx, tx;
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+		struct v4l2_mbus_frame_desc source_fd;
+		bool used_vc[UB960_MAX_VC] = {false};
+		u8 vc, cur_vc = available_vc;
+		int j, ret;
+		u8 map;
 
-		rx = ub960_pad_to_port(priv, route->sink_pad);
-		if (BIT(rx) & handled_mask)
+		if (!priv->rxports[nport])
 			continue;
 
-		tx = ub960_pad_to_port(priv, route->source_pad);
+		ret = v4l2_subdev_call(priv->rxports[nport]->source.sd, pad,
+				       get_frame_desc,
+				       priv->rxports[nport]->source.pad,
+				       &source_fd);
+		/* Mark channels used in source in used_vc[] */
+		if (!ret) {
+			for (j = 0; j < source_fd.num_entries; ++j) {
+				u8 source_vc = source_fd.entry[j].bus.csi2.vc;
+
+				if (source_vc < UB960_MAX_VC)
+					used_vc[source_vc] = true;
+			}
+		} else if (ret == -ENOIOCTLCMD) {
+			/* assume VC=0 is used if sensor driver doesn't provide info */
+			used_vc[0] = true;
+		} else {
+			continue;
+		}
+
+		/* Start with all channels mapped to first free output */
 
-		vc[rx] = cur_vc[tx]++;
-		handled_mask |= BIT(rx);
+		if (priv->hw_data->chip_type == UB960) {
+			map = (cur_vc << 6) | (cur_vc << 4) | (cur_vc << 2) |
+				(cur_vc << 0);
+		} else {
+			map = (cur_vc << 4) | (cur_vc << 0);
+		}
+
+		/* Map actually used to channels to distinct free outputs */
+		for (vc = 0; vc < UB960_MAX_VC; ++vc) {
+			if (used_vc[vc]) {
+				if (priv->hw_data->chip_type == UB960) {
+					/* For ub960: 2 bits per VC */
+					map &= ~(0x03 << (2 * vc));
+					map |= (cur_vc << (2 * vc));
+				} else {
+					/* For ub9702: 4 bits per VC */
+					map &= ~(0x0f << (4 * vc));
+					map |= (cur_vc << (4 * vc));
+				}
+				++cur_vc;
+			}
+		}
+
+		/* Don't enable port if we ran out of available channels */
+		if (cur_vc > UB960_MAX_VC) {
+			dev_err(dev,
+				"No VCs available for RX port %d\n",
+				nport);
+			continue;
+		}
+
+		/* Enable port and update map */
+		vc_map[nport] = map;
+		available_vc = cur_vc;
+		dev_dbg(dev, "%s: VC map for port %d is 0x%02x",
+			__func__, nport, map);
 	}
 }
 
@@ -3552,45 +3613,6 @@ static int ub960_disable_rx_port(struct ub960_data *priv, unsigned int nport)
 				 UB960_SR_FWD_CTL1_PORT_DIS(nport), NULL);
 }
 
-/*
- * The driver only supports using a single VC for each source. This function
- * checks that each source only provides streams using a single VC.
- */
-static int ub960_validate_stream_vcs(struct ub960_data *priv)
-{
-	for_each_active_rxport(priv, it) {
-		struct v4l2_mbus_frame_desc desc;
-		int ret;
-		u8 vc;
-
-		ret = v4l2_subdev_call(it.rxport->source.sd, pad,
-				       get_frame_desc, it.rxport->source.pad,
-				       &desc);
-		if (ret)
-			return ret;
-
-		if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
-			continue;
-
-		if (desc.num_entries == 0)
-			continue;
-
-		vc = desc.entry[0].bus.csi2.vc;
-
-		for (unsigned int i = 1; i < desc.num_entries; i++) {
-			if (vc == desc.entry[i].bus.csi2.vc)
-				continue;
-
-			dev_err(&priv->client->dev,
-				"rx%u: source with multiple virtual-channels is not supported\n",
-				it.nport);
-			return -ENODEV;
-		}
-	}
-
-	return 0;
-}
-
 static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 					       struct v4l2_subdev_state *state)
 {
@@ -3606,11 +3628,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 	struct v4l2_subdev_route *route;
 	int ret;
 
-	ret = ub960_validate_stream_vcs(priv);
-	if (ret)
-		return ret;
-
-	ub960_get_vc_maps(priv, state, vc_map);
+	ub960_get_vc_maps(priv, vc_map);
 
 	for_each_active_route(&state->routing, route) {
 		struct ub960_rxport *rxport;
@@ -3676,16 +3694,14 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 	for_each_active_rxport(priv, it) {
 		unsigned long nport = it.nport;
 
-		u8 vc = vc_map[nport];
-
 		if (rx_data[nport].num_streams == 0)
 			continue;
 
 		switch (it.rxport->rx_mode) {
 		case RXPORT_MODE_RAW10:
 			ub960_rxport_write(priv, nport, UB960_RR_RAW10_ID,
-				rx_data[nport].pixel_dt | (vc << UB960_RR_RAW10_ID_VC_SHIFT),
-				&ret);
+				rx_data[nport].pixel_dt | (nport << UB960_RR_RAW10_ID_VC_SHIFT),
+					&ret);
 
 			ub960_rxport_write(priv, nport,
 				UB960_RR_RAW_EMBED_DTYPE,
@@ -3701,15 +3717,10 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 
 		case RXPORT_MODE_CSI2_SYNC:
 		case RXPORT_MODE_CSI2_NONSYNC:
-			if (priv->hw_data->chip_type == UB960 ||
-			    priv->hw_data->chip_type == UB954) {
-				/* Map all VCs from this port to the same VC */
-				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
-						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
-						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(2)) |
-						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(1)) |
-						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(0)),
-						   &ret);
+			if (priv->hw_data->chip_type == UB960) {
+				ub960_rxport_write(priv, nport,
+						   UB960_RR_CSI_VC_MAP,
+						   vc_map[nport], &ret);
 			} else {
 				unsigned int i;
 
@@ -3717,8 +3728,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 				for (i = 0; i < 8; i++)
 					ub960_rxport_write(priv, nport,
 							   UB9702_RR_VC_ID_MAP(i),
-							   (nport << 4) | nport,
-							   &ret);
+							   vc_map[nport], &ret);
 			}
 
 			break;
@@ -3965,6 +3975,11 @@ static int ub960_set_routing(struct v4l2_subdev *sd,
 	return _ub960_set_routing(sd, state, routing);
 }
 
+static inline u8 ub960_get_output_vc(u8 map, u8 input_vc)
+{
+	return (map >> (2 * input_vc)) & 0x03;
+}
+
 static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				struct v4l2_mbus_frame_desc *fd)
 {
@@ -3982,7 +3997,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	state = v4l2_subdev_lock_and_get_active_state(&priv->sd);
 
-	ub960_get_vc_maps(priv, state, vc_map);
+	ub960_get_vc_maps(priv, vc_map);
 
 	for_each_active_route(&state->routing, route) {
 		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
@@ -4025,7 +4040,16 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		fd->entry[fd->num_entries].length = source_entry->length;
 		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
 
-		fd->entry[fd->num_entries].bus.csi2.vc = vc_map[nport];
+		if (priv->hw_data->chip_type == UB960)
+			fd->entry[fd->num_entries].bus.csi2.vc =
+				(vc_map[nport] >> (2 * source_entry->bus.csi2.vc)) & 0x03;
+		else
+			fd->entry[fd->num_entries].bus.csi2.vc =
+				(vc_map[nport] >> (4 * source_entry->bus.csi2.vc)) & 0x0f;
+
+		dev_dbg(dev, "Mapping sink %d/%d to output VC %d",
+			route->sink_pad, route->sink_stream,
+			fd->entry[fd->num_entries].bus.csi2.vc);
 
 		if (source_fd.type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
 			fd->entry[fd->num_entries].bus.csi2.dt =
-- 
2.34.1

