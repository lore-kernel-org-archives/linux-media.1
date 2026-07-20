Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6650D3F39C4;
	Mon, 20 Jul 2026 11:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784545784; cv=fail; b=RLLqbROXXg6pJCSzZwejJSiymvZIUhFe5nuvLP80JrzrJhf8Z2TJIFc9/eO5EixNPJhtAJ8vSnJFuPWUyrfH3ENviB3a44W9+drXcwrq3jLSuwPDNKw0wiZaY83R+EATmaELkhFQbZwfqzcGxoFlEEEPtL0RAaYCcsF7Jvz0ZHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784545784; c=relaxed/simple;
	bh=PGWmBRwXohSBm1k7zNZeM6fsiq9XPIc49vsTdTQIal4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TXt+ORN19gh/Ph6v8phIWFTaQbNAenQqcvBjOvNWQEjku+dqckSMPYbklXGVdDp4/xkpkjsCFR4rC2qBWxgFvTCh2rs1HRLhDpVehr2eAPtcbHNBiRK1fYetxHvKkXp05fZRtlBVzpQG5U39BMEE67BbvzsoiHv1+EfvALWWWek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=p85r3yDA; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=k5x37dQh; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="p85r3yDA";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="k5x37dQh"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAsXxg1969173;
	Mon, 20 Jul 2026 06:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=jNcI/WUp/ea3E
	mO+/aLN9/E3IpoKKdIrvbTp+j9McKg=; b=p85r3yDAog47cABnf9+Fr7lJzBjtb
	VMFzUugveYgFshV3knp9lYXsOt3RVwBSFipKVfeQTv9FlLV3+pz7TPjdzFngVIxT
	xgKIZHjJdenEtE1GmVnDzT6FuMCF+VBaYfaI9Viq9O4TsHiK0nKUqmBg50ntQmKT
	tzGRFZm8sYzpck5nGVDtfBUPpNYY/Dq3Qj3LRsdceln8tep7+hUU/LePW3l6T5F5
	KPboNxLHHwf5KSIEREuJdhs0QArdglYwogbFkfoCfoGW2XUmq+3j0C5SYtVi7VwT
	QWAghNoumU96qvPaqdS+2CU2pvcPxyMwHyM9+2B8gGReeyAPKRb4MQXwg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fgrmkwnw8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 06:09:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAOp3zqZIAQKW4RWKu29NbhCExN6cVSgnmLsER4rVigmDvIg2avkRyzlRR/D8JsDQIUYrz1CuFmTKfig7hKqZr8xGFyNlcPTVAHUC699BGs93dh1Bpmsf4z32ubWyK75yZqk1zQdZWIgBdDCcB29/Zno2hUAX9yMjjNvBbBPCXX8sJMzb/3SoBSYn84H+ojhXw4w220VvXr7j5GnFjdiIZfTwZazQRw9OHtZiNgrmkrgpazCzBG4bcu/ln44MLq4l3vy7QGLG2y3m6Npdmw0/B9CXjC3cYluRZ4gGlWm61+30x1wSsZY+CQT530j8J3sxLR3S0wEo3bddn9ZLAiuIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNcI/WUp/ea3EmO+/aLN9/E3IpoKKdIrvbTp+j9McKg=;
 b=kD5GkrnjqpHWbeZV9NrEQLMtHshcwDjGDw2qEND+J+msHjG2zMzuDcOuxRrIB3ipmphILAtgnw3OtrgQcosOZxVEwtXc7gXdYl7ykpgcxaCyZsGTjPuJ5xcOU+Pyb3QP/1MxmW0cCRQ+oR5CPQsTxpBYY3IzVQ94JOH2oKwahNOZAzokeouqoCTgV0J4+sTxGiKr9FT8rJbEF78n92SKoo25SxjzFXvuP7c7TWCnpbMYeU2+hHW0Uc8cDvF2wCRCNm6+V4ajKrOoQq1J0SCH0nO85X91lKlQfP5UO7jTNvvIhbcpmyGH4tyhdmKRzVFYCuV+63mGd423r7MbhsH+bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNcI/WUp/ea3EmO+/aLN9/E3IpoKKdIrvbTp+j9McKg=;
 b=k5x37dQhXZugCLox1iogjMDbLG0m8HE5j8NV/1FltkeSaIsF0uovWzOc1wjPZOUpTOsHOwckE1yROs6A0WWECr/r4FaW+z6xVwGorHR331ORDrjI5cHNjwpVMeGYKip3/xyl2Bl732eOAOdYtKX+P/Zktb5GnusutPcU1mn1Xvk=
Received: from MW4PR04CA0283.namprd04.prod.outlook.com (2603:10b6:303:89::18)
 by CO1PR10MB4785.namprd10.prod.outlook.com (2603:10b6:303:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 11:09:32 +0000
Received: from MW1PEPF0001615C.namprd21.prod.outlook.com
 (2603:10b6:303:89:cafe::6) by MW4PR04CA0283.outlook.office365.com
 (2603:10b6:303:89::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Mon,
 20 Jul 2026 11:09:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MW1PEPF0001615C.mail.protection.outlook.com (10.167.249.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.0 via Frontend Transport; Mon, 20 Jul 2026 11:09:31 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 06:09:31 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 06:09:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 20 Jul 2026 06:09:30 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66KB9SD82823611;
	Mon, 20 Jul 2026 06:09:28 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <mchehab@kernel.org>, <jai.luthra@ideasonboard.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH v2 0/2] media: i2c: ds90ub960: VC mapping improvements and TX1 support
Date: Mon, 20 Jul 2026 16:39:25 +0530
Message-ID: <20260720110927.3570235-1-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615C:EE_|CO1PR10MB4785:EE_
X-MS-Office365-Filtering-Correlation-Id: afc1d920-cdd9-4eba-e451-08dee64f5fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|18002099003|56012099006|13003099007|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Hv9TcoE5PHcGaT7wLzmMQi/OQXTamiLRqK9T1qkrZwvQTB4/plXM87KYawJTRyE+FNCbM4si90edH+Xcw9QNtURtInSM2Vfkw8aj5VpO3h8+k+pvMDUh65Ne39XkPCz3L4Xp30VcKUpwG0ir9nzkjyOFG+PkV4GtYc8wls9Rxlfw1m7lxq7v2yxm0MnM4R71oHFZ4nGdf92Y8nuPPe//x5M+Z2XDbJJhbDagYWM4GN5S/UmyUQtMnCu8IMK5bkD4FYg0aeecuRYzN+GNFqq7SJZAxke+zZMepqb/aBWFNSQxVkbd/MRtyN35RsMABAorTE0QBZRTc4YU1Af09mwZ7OT2tpqmhYYCgB+fuP7lc13be5T7KZnIuInuHkHQhme5TCT05M35c+V30oRBnsWKlILcLVV08L/tsFxmBBeS0CYra8vwmjVYeEK/5ucZIU2RvRYxZn3KcMpkDUAwSSXmMbLLLBGd3QgB/MJ/PGGyT80XKEO8lKBi6Zk1Q8r3NeL2pxsH9XypEB20QeuUUiy79X2nOYY7s8/ClHdma8tDgg8yAP2SiXGpweLba8oFkVYER3gXCgqZDCIlEoH8a7ZUFlwSZT5iyRKIrABofbrPYGHbiH2x8krrzzkqRvqMH0QIRY/pB5/vvA2b+Zte+kDOyhS3CSTB9jfWksRLs93S5VtmN9v76p7GB0tIwMyIV8wjb+Yft9GNXFekm5TppBJZGw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099006)(13003099007)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KkMquqUd7uan5hX6FNGErn2dpqRvaWgdlMh82oP1utsIMrgKwSo1yXFAvnPnNMn/uUO5kTMzussOriHxJf3Oj1q8jLFSRn3RmK2BgHykDh9RUH49hOxzomYUys6XAZbbDKV6PfZQOXoxaFjlLD7sO1vjjciPYafG+d5urXrQkkZul96Jcocbp+MqnUrJLCx2Pkcw4XjUmCVpmJDfDQWKOia9S0ntB+7dxR7fzUUCipuWjWTrUxd4XSaykFDaW+rxiyJBKHyfDcqhT+LWSEWsIfoZDK1ttHnBBgRLdcKjKeW6EtaHebnl5LnAJY0p/loQwty8vRLK5KVVrgDspazx+EQps3Y8uIqBPt0+0bSUDnRo47klDO7oXT2tfB+6e6JnZsdGOYfJHFQEJDbCRiRhRC5990hJ+e8pKOE9EB/XfwBAX8LcFmT/8mpb0Cq/IzXs
X-Exchange-RoutingPolicyChecked:
	n6FeZPU4kMrSGtm3FlkjkxgR7FR7qQ52r8O/W1wj+cJM2xhtBklA5jp/BC8nXYQbnxj3pqAzW2Wbus5o/eOfXmnr+e/6G0+SKrV0JTUtbmi+aOs1FCYivAk5WDaqBQeS2Duk6zUwSqpZJtiNaxRuQU8TLs2dg8OlaVD20Skky5dOsyhFLNAv1dQ1MSFXT4TlKWBT8TETZZ3W7IMyoyRXyR//0IrhwQSXZaAfClSj93nplxTXAolU3tuxLPOkWmqLh6hiIJpzuNcmTauVodowhZGbLGGY5nd04scvX7ZfGy49wVgNp14vLjqVemkz+aL77grXEdqag31nDd1NuAh5pw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 11:09:31.5248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afc1d920-cdd9-4eba-e451-08dee64f5fc1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4785
X-Proofpoint-GUID: yBMw4gdRfubUECGL-XoJKTTYZT6LUeTm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyNCBTYWx0ZWRfX6p+T8lY7ohzp
 JnIRKYulkEcP36Ibf9/qZoqsMvpY78G40vYYoYSjIXkCbKyLdGRX5ZukX3ZKa5p3nFpL5ENkfWB
 WbmgbhVUDa2FOc8FpvkLwIGF+w9UoFI=
X-Proofpoint-ORIG-GUID: yBMw4gdRfubUECGL-XoJKTTYZT6LUeTm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyNCBTYWx0ZWRfXy85eprKuk8fs
 wCLGJQ8KJvkZYJOTmtZPxgXOS+3JoLhXrOhCXPFJVwm2wsJuLO3TCezhAXJJ/qmpm84GKiFC3Ce
 k7TVm9BeTqOEY5W3zqsgYm8nKt7F5PBpRlkBg9Yi9EV60m3+OVDhknHjrckFqs6Ssfm3lAocPMS
 mjiahTVYIXBe4t8DHud2SvyPdmUGdf9xGsp6hKDqNTREbnzKqEKNyi0T5cLfj96M+jV6jIddHNw
 Ams8xpWeUUUQQdS2lLbJ+YSBj0K1gjI94BJm9OX649cNj1TWrJ8Oeu2uB5Cb/YL7Vorq3R32bdI
 WfuOF90GRD9ZwtHsolTSbIverDD3DMSy3DuJqw1fi/hdNeQtfHv/Mq/LtZUyiWJaiEIFtf7kyd8
 MvZiWQ+RZTfJCOWGiWnvkG7mH5duDKvPhVi7Rw0oqrQvTkvkrjPgfzQ7XuDl6TUuvuUrZrIC8r8
 4nV4lOAnGwPpJUZLt9A==
X-Authority-Analysis: v=2.4 cv=KIJqylFo c=1 sm=1 tr=0 ts=6a5e01f0 cx=c_pps
 a=ht+bKkBNmLq2ln/DE6MnYA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=NEAV23lmAAAA:8 a=cRlOGKi5M2D07kzFVtgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1011 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200124

This series improves virtual channel (VC) handling and adds TX1 port
support to the DS90UB960/UB9702 deserializer driver.

PATCH 01:    Enable CSI TX1 port by parsing active RX/TX ports from
             device tree and configuring RX_PORT_CTL BCC mapping
PATCH 02:    Replace hardcoded VC-to-port-number assignment with a
             proper per-port VC map built from source frame descriptors,
             fix loop termination bug in ub960_get_vc_maps() that caused
             ports after the first unconnected RX port to be skipped, and
             add UB9702-specific VC mapping (4 bits/VC, 2 VCs per port)
             instead of incorrectly reusing the UB960 layout

Tested streaming with the following configurations:
1. IMX219 + v3link on AM62A
2. ov2312 + v3link on AM62A
3. ov2312 + fusion2 on AM62A

Overlay and defconfig changes for the same can be found below:
https://github.com/RISHI27-dot/linux/commits/u/ds90ub960_mcs_v2/

---
Changes in v2:
- Squash PATCH 2/4, 3/4 and 4/4 into PATCH 2/2
- Update Jai's depricated email address
- Add Co-developed-by tag

Jai Luthra (1):
  media: i2c: ds90ub960: Support multi-channel sensors

Yemike Abhilash Chandra (1):
  media: i2c: ds90ub960: Enable CSI TX1 port

 drivers/media/i2c/ds90ub960.c | 240 ++++++++++++++++++++++------------
 1 file changed, 154 insertions(+), 86 deletions(-)

-- 
2.34.1

