Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DB24A8FC2
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360872; cv=fail; b=Fq0zTVyzND085NibKrVuottDXfFsk/Ja2pfrY209kmSHxb5eoukNDcu6UEPLDQsaOeTt+sJlAB4IYvwrbzJfegJk+5gb8vPBaNQ80pahWHrk5qxBecKAMEJuGXuiSFkGgo7Bl6PmtPmyz4epH9ONbztDQ3xdnem5nEPttL/csvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360872; c=relaxed/simple;
	bh=EoG6jJ2VHFzhToUfR/JJRc9Cp7pthxg2VEVP8FAz204=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OeQyHUDRxeIQUlz1oq9/FHMCdj61Ogxa8AQCUt8KfYWEXIvAcJKIj0OKfPivBwA/d3LF36MP1WX4uXZ1Q0iVuxzgXDac4ILEn3pVfwQbwm7eihYhWXGEj03hFbe75WbdCXDBZxYAsctAoQVlareMzSYT0ZH5bkX7rMi32UJOwoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=B1/pcCQA; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=m8nzCZiN; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="B1/pcCQA";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="m8nzCZiN"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 682CV2uW974125;
	Wed, 2 Sep 2026 09:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=9DH58ctxu43fmgQ8RhDi+GRZGa2C6CLa+KXvvoqkY
	do=; b=B1/pcCQA7ikWrKhwn0l2QFtyCLqmvOYqOWiUqDoTpolrkszUa37kA/oKx
	wtkjBQgG6NIBZR/KKwu2mqabLs/+mjCre0oxQDZIjnQhoVH2pM0jaUNNR1VaKbnG
	6sGMVuMUImPi4RXpb/WVaHZIKsBWD09JoeZkAk50lSLSFV/awnL8BQO8o1CkL/bS
	XPpHlDX55xHvlsfvDPDIU8078mGxu5jjyDR0pj1p44AzuaqxHETs0V0jsrUTA6JH
	0ulZ7Q+/IHxmCWGJGzWoaru9imk3IF04ukzuqHCDWXcmofE1Cu/0XCtvqynRxJK1
	AWRGIr4gbLt8IGasJJZq++75s9bgg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010064.outbound.protection.outlook.com [52.101.56.64])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ge7cgcu1u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 09:54:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qd3uigEp6c4GLXe0nznblsG5pvZ6IH4XLv6vKm/nVMrSd8at8h+C5sZv1JuvJ9TxaXzQUNwCycHCEehdKGMLGswgE1H/o+vU+6E8EE0aX2OvZqHyN75klZm+4+3ZdoeY+r0d4xneSKJ8XG/8bIttTmvzAw+SqqubSzFLr1gHh0W+XhBLxAT7XpaZidEvcehzy5NTAcidYO6CVvFdLcbWnUYWaeYFLx3AJaK4/sN7FO6fh90BxOnET+1Lhv9bxYIo5iRmRc+7Tn/wa/SEWMbC+ra7CdAFBJXNBOhGCPHZlTURCrJcmr+8zilscM8dcJbIMFCIVMBQgYdBSsJjJmbS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DH58ctxu43fmgQ8RhDi+GRZGa2C6CLa+KXvvoqkYdo=;
 b=aKwoUVMAitAnQgAatam5fRCWPqjUSF4cDFXxLtfFIB0hT5dfxsk72saCohvWk6c+/MxZP9RCG6CX0dSaVSnLs8bwaEuRy6bF6jE1IErhTmoqZhCZQGQE7N0Lxz6KFwJ010UB8hp6zpZePybwCfeyUdWzZeUgJdv0XLIEKmPNIq8tcDJD2KJkbLNibtUR8s+2QwXChJ5qtibmhfpNZW79n/SWt32qFfInm/XF6o91ckdoEjkEdhMVAqsArlyDeQ1ICuw9GsuL/eI+jydHXFh73JSWXoGSaM3QlJHvBUL0Hr5eNbZNcKWKzX9AZxBaZfwemyjUGUJXATJSmI5JL0xmRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=iki.fi smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DH58ctxu43fmgQ8RhDi+GRZGa2C6CLa+KXvvoqkYdo=;
 b=m8nzCZiNvDZxji79p9VsNXnZ/AZnzYVu5oVLzjwACycoFRByz1Cvu609Zlg9JYC6ekrCFByyi3ZjFjO8ASSpCLuy6TdyKp0d9LfEh7PX0rg0abmNBEWUcikZzRPuh5mUlX6Fu/7mOPWB4wgdnzoaRzbGBE2k721Vd1x0pHbG7w0=
Received: from SA9PR13CA0126.namprd13.prod.outlook.com (2603:10b6:806:27::11)
 by MW4PR10MB5750.namprd10.prod.outlook.com (2603:10b6:303:18e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 14:54:12 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:27:cafe::93) by SA9PR13CA0126.outlook.office365.com
 (2603:10b6:806:27::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 14:54:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 14:54:10 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 09:53:20 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 09:53:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 09:53:20 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682ErI29804962;
	Wed, 2 Sep 2026 09:53:19 -0500
Message-ID: <561ff30f-6119-4698-a719-139bf279ea10@ti.com>
Date: Wed, 2 Sep 2026 20:23:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] media: ti: cal: Deprecate non-MC API usage
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>
References: <20260723111903.742283-1-laurent.pinchart@ideasonboard.com>
 <2d3f854c-0731-4405-b77e-13929049ca67@ideasonboard.com>
 <20260902122454.GA335893@killaraus.ideasonboard.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20260902122454.GA335893@killaraus.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|MW4PR10MB5750:EE_
X-MS-Office365-Filtering-Correlation-Id: 919eae3a-4fa5-41ab-9d77-08df09020bf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|22082099003|18002099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	0ALrpKQ3BhcYmfSBhITdgmukEZEMYpP00IJQFLiLlXyHizFNo+Ug0yD1ow2IYP/wmaXA9SiajA6HhPX20xY0HWKRX188pEO2R3M4xlasS54Q4IWNfeaG5AnOK1mS10BlrtWTKch3bFQKy5SihNgy9CLvG0nPRirojKx+MUNS1htLr9/6DtSBXhDWqtqYl4qygAsU1EbOzuboDN8IM/NSRoJBlamXEfSGKyJewTJtUdD5q5OvOwGmxkZEdOHJT9DqUKnrmmGY0mZIlCCcWvh+TdWo55lwqSG8HFqXSHPanYVZ3RLqtxRBhi65ZNw9ClsDnp1a4NdYNoI2FzXJ63IvirooicHENBR0bTt4s0SKARrZzQR2cOErolXq6sJg/mxjjKgBykgfMYyPYiV62Lfgdi6dBPL5k6BwgU9fsI1hh6IYGqj7EvAOSp9R0qKK7ttIJ/LYRmIa7DKftDZhyCCW65mr+gY+6DVVa5zU4q/PDAE379zA3deyyHtOS3pFg5iJSITV9gB+vCUXR3FjIPqxezqFjkhEbGa/Oh9gJTLjtjTloXKyzL/jfQjWJI+FAR80ZV8YmB81YIAI0udJO3aKnpoDKmMPe7ApautlBPUqI+xdbLgqnh8MczagAbBdiLTKiFRVRtQtr179AkY3swwVlDn6l1HW44btget+m6M6aRzMGtl85lCBVwzybTA822KrJM7geVOi3urv3ANpBzGpHQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6Pcf8h6kg7M/vhO2a9atQj0n/mGD7mYP/RERN/tq0xcGpN10vtNi5eeatJCdZtIfXhX07sDjyS2rmSl3AsS4FIZC1wcQ2XZAcw/YLb8LXPpbpkLUZUGmqoKYaNCa5fzj1H/aeoMf5hJT8+ZMxKgmS0KIosIv4fjsqywuQNJB5thnEmBmVrl6TuCl6txk1VpT9GXcjUKIap1JCHNLyYhXlo9NmX82qBh/cCgH5A0bZbvQjl3YpZlOIl17BE7M418hIEi6p5ImgilS87eBipls+MUexGvoQRfdhapRS6sPfgH6J9awKtmOEC226Jq5pbtDcxtbTnKI7nTnoT2v0gjyxmK068E2TksSVPLYemdSTkTi+sKxb33HOnp3dJiYTXy1TQtwxkquJJU7/18gbmbEGD6Rvr6FdAtZMl47Pl9F4OI1R+07fSbsabB1O3OjR8/e
X-Exchange-RoutingPolicyChecked:
	Jl3sfKVDPoFUVV68F5ZRtBR0tUAk5+F80HlbiqeTFodx7uNBjBHpK3AM60IWZJ9oPTf8nEBIzFBs3EbVGgyHMUNLl+j3xA6GDu77hCqDvJgQ/4oqqrQHS6vD76kYVI+u2djsuybbOKKdCKPnkglF3HRo/MCWkLiawfSMLPIMS/KU8sIh1ntLmG/WJJYD8md2wmKkdUQULtPM1g6oU236XS433EajdVoVoJEe2pJp30PHi3CT6B+9O4ogWVmzVAE5tYdiHE3PSivxNpEl+baddGJ3NvVNNG4IvPE74ecPJIM0CxS7Q2AfGZJcKnpRJoQJJ5IFRlM5Vr9akeY2eZ3Wfw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:54:10.4660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 919eae3a-4fa5-41ab-9d77-08df09020bf8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5750
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzMSBTYWx0ZWRfX5cDGj4J9vOcZ
 CQOwpezlH5tGSqb1gFeLzODs2/8GlidYSWdKpF3/5nP1VHm09WKgQnqDgpgjYkWp+cPwF7chQg/
 O3E5XNN0qLYa4dI6diuzZVeRY6n5YmA=
X-Authority-Analysis: v=2.4 cv=Ka3idwYD c=1 sm=1 tr=0 ts=6a983899 cx=c_pps
 a=tGbvjRCxuxMasaU8K2d5rg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=P1BnusSwAAAA:8
 a=dmJo-NLSnNaHqi9qzLkA:9 a=QEXdDO2ut3YA:10 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: o5tVszkjHU81W6RTnObGfPGHEX9jTNK-
X-Proofpoint-GUID: o5tVszkjHU81W6RTnObGfPGHEX9jTNK-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzMSBTYWx0ZWRfX6lXBUyeaFXOy
 kwt2fflu+nTd7mcrw+YDm1jZX99R0CLEckXC3TyaYosXXujOHH198wFCxlS/PSIGOsujl3tK4nh
 WqV1t0jk2ISbptcyJVHVI2KTTQMdyretCpY0SroDNa9wR5PeXwbYIl8yY4e5RLLpW4Hxtmzv9oc
 PNsXMYvPGrL8nNaRwBwaYqphekqy8nM9Jl8GcXafbfPbJUQgPdm1fUYIlXjF/WUMJ6aUUYpgfET
 +n93BVw3lVoOQGzs4V3hS/hEj8WO6J+L5tnV9ZbTAeZbVQfIdnTjay/QIH0uAJZMmbabGLZK1cR
 xF2gROq4Cc5yhheJH9jXLnR9puafvvfHBp2463YVKlJ5uyN1e/q1Q0OuvYGDaCDIgpge7iBT4qU
 SuJcph39vU+wcHOes3t/9pY2M+fLeFAb54Ge8WQOa3nSAV8RYGyJdLu0TQ3ikKxbQnaJ2zJeNgF
 gd3z/h7S+d38UR1E5iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020131

Hi Laurent,
Thanks for the patch.

On 02/09/26 17:54, Laurent Pinchart wrote:
> Yemike, are you fine with this patch ?
> 

Yes, I apologize for missing this.

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

Thanks and regards,
Yemike Abhilash Chandra

> On Tue, Jul 28, 2026 at 03:26:47PM +0300, Tomi Valkeinen wrote:
>> On 23/07/2026 14:19, Laurent Pinchart wrote:
>>> The MC API was introduced in the CAL driver more than five years ago in
>>> commit 38e89e790fe2 ("media: ti-vpe: cal: Implement media controller
>>> centric API") as a disabled by default option. Five years later, it's
>>> time to give users another nudge to move to the MC API. Deprecate non-MC
>>> API usage by printing a warning at probe time, and defaulting to the MC
>>> API. The legacy API can still be selected through the mc_api module
>>> parameter.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>>    drivers/media/platform/ti/Kconfig   | 11 -----------
>>>    drivers/media/platform/ti/cal/cal.c | 10 +++-------
>>>    2 files changed, 3 insertions(+), 18 deletions(-)
>>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 

