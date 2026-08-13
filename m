Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FCD48F835;
	Thu, 13 Aug 2026 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635755; cv=fail; b=rO6pPeRBeoETkdtkLnwSG/mYFTl7jFdfMWsehAR59rEovCslyEneYP/vwyjw+/lJ81TKjuTCjeBFDEIKdhB6DDyb2TWtZHiuX4/VOJh8QDWpLFrqslORIPbYuPbWGPY3DOBUN/c012jhNBV1+DSgKzFxlIOiRsrXU1NBI3E7OH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635755; c=relaxed/simple;
	bh=oeZxIulS+hX4mTfJRo3a22mh2iL1XywN+8NhGTBOGC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JrvLdk4OARyO5sW2RRp7dH1YMEbZJMBEj1lMYPRaUq7S0aWreiPhkMAkJE4enx/wecZuqWwUYcZ4dtdFqFC1vr4PupAYAf2DF0/x+ffPbybYhiW+09bTLLY6Bkpix9uYqrHk5HHrWw+yJhJ/c5dtnlxUN1yGFfOPUHT8IISePSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=FY/YeI02; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=swwT2pya; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="FY/YeI02";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="swwT2pya"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFV6ot3455089;
	Thu, 13 Aug 2026 10:42:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=zR3k2Jx2oiWLyiJIll3HU0qT4z9F4Y1+NW5bylNvv
	WU=; b=FY/YeI02nzVJQbWLHS14tgjenYnLgkGujVGHwLw2fvESgJP0RmuGCDokA
	AC3Vm6fxXgD0oxLd0fBrvBVAwI/39WIZtyecXXu5tKL2BmJbDrW4CjSob0vNgUH3
	vnH728cCTv/99/axCTiNpDzySPHwnRrFBn05TG51QW7dinOySyrsFSu4+wSCj5zm
	B+/5rqtxUsDpkI/4736rhVMkGQcJq7bW1+jYVrVNlJYq2jPouCWX93u081x93leu
	SSA4Sonzxrpxe77wOrsg8eg9nK0odo2ejdFT+7sBY6dx6j+J+DcPjsyx061pZl54
	D2JzE0+YSafssTwhjvay17+MCV91g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010050.outbound.protection.outlook.com [52.101.85.50])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g1bb4a5kp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 10:42:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoZZQhvmM/ylG+5qO5QjAHuUqpaoHkJkw2LzMpA8NwWC6bz0Rr9/v9g9aALSk/qL3r8oA2b9oR2sS2IIM43ZStC/8IcFd65DEmR61MuZvkCzn1gBefpeHk7TcRJQ3h+GxZB8yJZHQKHSgpyvCFL2NOMmQ7O4Y/2ZZ6HuKSdeFv/puzpqEpblLFlGjPQ/aAkwzoFX+QqG375aa4CQjeSqvF8d/50jvlOUIGnwjVqz/Ov5JX68p9l3Ln0jIDvUj1KDhske9OP0582ZAILff/Q/nPt/V4qgEI32uROBvPS5zzTUnXJfLRpmehiE65IPRnjzIv25d80kQYODtrvBighVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zR3k2Jx2oiWLyiJIll3HU0qT4z9F4Y1+NW5bylNvvWU=;
 b=Z5i9+mhQklDNYHcpX0u95dt17tbAxe18+W73lT0Q8RTxqFk1ADeAS8nFNNo1nu8yczrEe84s0VPo2TVR+dBLyxCCxvtPvW96hf+twZswdFsLfFfpSthlka/0TBU7/9UVb0vPhBX/hkJKuADFuiEVTT6YPxVGCtkbu3hGPWOGgvlZ+kc4LAExR0+6CXo0MWiFzSIKhEjDOykgeZ5WoAMOrCzQxwSWy42ufX/xEmRgLvwb01rvZfxHC+TbeYLY3f8Nj2aQhR3m1BqBYorsN1IOwZ2m2cBurtoIcCqJJv7gahF8kGTlKR86ijUq7TDdqQ+1+l26uzoDRRzPQb54ARYeNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zR3k2Jx2oiWLyiJIll3HU0qT4z9F4Y1+NW5bylNvvWU=;
 b=swwT2pyaQ/htesbrMLvyP69ogSkoyc6Kzxj8ZAy4CXrhcj/UaT7D8U32FD0QL22L4Tpmx3K3EjfiXbtlxyywH75Ox4MD2VZzLtNIfmfvdWkrfe2yG29Xcm6A1KO7yV3+wRryEAOUr61k9CIfHM+zLtHBRxKSpmnJeHVWped8M1s=
Received: from PH7P221CA0048.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::8)
 by SN7PR10MB6362.namprd10.prod.outlook.com (2603:10b6:806:26e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 13 Aug
 2026 15:42:09 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:510:33c:cafe::a2) by PH7P221CA0048.outlook.office365.com
 (2603:10b6:510:33c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Thu,
 13 Aug 2026 15:42:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 15:42:08 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 10:42:08 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 10:42:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 10:42:08 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67DFg3K11100418;
	Thu, 13 Aug 2026 10:42:04 -0500
Message-ID: <892b7261-16b3-40f7-ae31-af9bb483a27a@ti.com>
Date: Thu, 13 Aug 2026 21:12:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: imx219: Implement .get_frame_desc()
To: Mattijs Korpershoek <mkorpershoek@kernel.org>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Dave Stevenson
	<dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Jai Luthra <jai.luthra@ideasonboard.com>,
        Vaishnav Achath
	<vaishnav.a@ti.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jai Luthra <jai.luthra@linux.dev>,
        "Kumar,
 Udit" <u-kumar1@ti.com>
References: <20260813-imx219-frame-desc-v1-1-2a22488a0535@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20260813-imx219-frame-desc-v1-1-2a22488a0535@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|SN7PR10MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d5748c-2326-4df2-2d5c-08def9516f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|13003099007|22082099003|18002099003|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	WAALx9ktY/o+c0Brt3dDVA/LXJvCj8/YRPZG7WqYEp97p/e4WUC5WJtTDTVLxytY4OjUNven5wkxpb9bWKex/NmM7bs2phGIVXwWI+Q4SjBajgYkFN3bU3XlGbaSXhVEQ4XI2l2hehctWG7BmYDz9QifFcxcdTKNqT2r8k9UQfd3ujXcVW5YqvxopfKsmTAqcFaZrc7u7U1upu+V5OV59XtrsZ5CpSgu/oIIt1oHz3LJkpKmAyt6ocXGIBwOjzOS18WlMs9LbH9tjybvjL7K014aqk2oOVShskwEyqhrw7HDPCqu/REh9K1aHDUv5kdvkuIXLSAo3s1oc2X5crX3+SRmq5hPwAagEW0P/iC6JQ6qgnJUz2u3/yPkfOddM8XRsXIfoPNhV6lO30e7XkIKX1Buk1WFgtBSTK/IvKR/bxaS6NeecSMJPyXsPBsffV8tD1rF5Mz6F1NZ87Xu1RQ+5rLNFubLOUJKBnsqEOBebjKdF0xbo1XYrzHk4BH6AI8FOc6qgT/iPkCKwBslHB7jt4oTq6HMByjWrh8XapQMtiM3VPkKkaDl+BtB06TahBQ+3/MR4bg/6pGfDpayH1qWAF6+Mp+Zf6g0/8cU9Rml+iMSZCQykoQ9g+fNMU4EX4ylsEElwmHVNx8zM8VGQR/U3A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(13003099007)(22082099003)(18002099003)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+UvULWNIQeSAgwJr8xJvlN5kmSIWe7S6WQn7Wv+VudOmvcDbgZx8PPM5xJ8jsWYRiHXDImibGTHv/N/u/qgZ2NdjP6CRNNo8G/YlKl3Ti5M2E7t6OqbdJt9orM8XMIvQGhTMp6RI5T0uaKj4YUiVxj1g50ivJ1A8tTRgQiEDOMaMDdElklDlXGGBkYCXRJn7EmNCyT2+j1WRjPVKMEeXqJhPhNiHpyHhHyNo2/zWvCqeFfKwV+0kL7DdmzjN4C6aEqwbV2LbnuKASexvJQ1reaBMFfih89ZRJk1Jgdx/uXFmQosafUiot9ynxcxyZVFSQsLV4CgegEOfQ54SvsaLW02bZ91xWFZT8qUTQv04gCp0lx04o+gomIAvAplLdO3vzAUqCH4FIdO4NEE7LG/VA+iRUiDsCYDKvqrzcV1710BfxkmYO93AOWWmrhCJ8+xd
X-Exchange-RoutingPolicyChecked:
	pbYR/lmN9RbDSNFmA9dh2GhlwoiE8U1Izi7xk1XW9QXUTUHa/gbJV7VYg6eDGWffW0HPlM3Lh5WUDUiA3sSugVHOR701AL+CQUnMi99I2mAYuK6ufVIMAM09PvBHNaqhHcgd6X5+7sJnioNSYinkhbl61Ift60ZC6kt1og3cxiuMlwezc9aJ4/58LhW3tQynZwYfW3in21KG1YRkSQNmb82UZh+RVOmD8Jo3Q1vc0pjGoDcFO07bLSOMtX2RnUxw5GELpupjNVhi7JF6UhBEctf1edYCoWWTDix0HNcxGXVn2d7Gd96diJ2c4Lprh1G84LmRfFLoOKb79gBMDgGXkA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 15:42:08.6716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d5748c-2326-4df2-2d5c-08def9516f42
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6362
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExMiBTYWx0ZWRfX+j3aV8JAiPy1
 dX9graHl079/2PavaErwYFMVodn9B2Mct8hZFr94t6CheDBGQp/8Py3td1Te65LZWd6SYKJLsPP
 R6Yts7N6xbN8wVuRs203SzqJ41Yw0eA=
X-Authority-Analysis: v=2.4 cv=W5sIkxWk c=1 sm=1 tr=0 ts=6a7de5dc cx=c_pps
 a=vP1tzVmpfESUBmWdx33jDA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=P1BnusSwAAAA:8 a=KtRVGM7OAAAA:8 a=sozttTNsAAAA:8
 a=vblSlnISN0L5amwe8LsA:9 a=QEXdDO2ut3YA:10 a=D0XLA9XvdZm18NrgonBM:22
 a=fO9at-cOa0qPyS5aOM0m:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExMiBTYWx0ZWRfX/ENOHpuFlsYQ
 ZKsZQC2061RQCgmmwVem2xcYGWY5Ir/tngthoPePNk1iD+ljUHFD0edYgznsewTZzx9rRidZHrP
 Ji42ik8GGVaw/GnGzetBQJSYhJ44x88VQtpVT4WXsQVREzxj70zPm0w0p4O8b7/6HJO+HrLdzjA
 BJwSkSIeobqZanQpy1lpDfNYKXSaspy3v5XNRARrWR2yuudvKZHELZauGSIvE/1Z+vZgtXCx6N/
 omB9IqUcVh0oyLciKiWQMp0xJpJPaETWfoL62FWi/Pow65D/E/Oxk9KpqFNavh0pJ27uvMj3mmH
 otdPCearodqSZUA27nH6jLdbnDaMJMJaaOaisWdbFp8L8i2u0bfr7Ejoaph3F8kd3iWEKhLEwcR
 fbDW9N6yRAw7Fn9HZi3+LGMCuDhpTd/iEXj/GF8tEz+vTpohsinyOH1sJOOFcps1piKPAtLkbpi
 y4xBMd6dfx8bO0Df3lw==
X-Proofpoint-GUID: kXDhucIkT7lg1se6NfSj4o3R4V1MgVMe
X-Proofpoint-ORIG-GUID: kXDhucIkT7lg1se6NfSj4o3R4V1MgVMe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130112

Hi Mattijs,
Thanks for the patch.

On 13/08/26 20:41, Mattijs Korpershoek wrote:
> From: Vaishnav Achath <vaishnav.a@ti.com>
> 
> The next subdev in the media graph may want to enquire information such
> as bus format, virtual channel, bus data type to route the stream from
> this sensor correctly.
> 
> Add support for sharing this information using the .get_frame_desc()
> callback.
> 
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> ---

FYI, similar variant of this is already posted by Tomi recently [1].

On that patch, quoting Sakari [2]:

"I've been recently working on
<URL:https://lore.kernel.org/linux-media/20260518164318.3367888-1-sakari.ailus@linux.intel.com/>.
In other words, drivers that have a single stream don't need this. We could
probably extend that further by making use of the routing information but I
think that should be left for later."

I don't really know the status of that series. I will let Sakari to comment.

Thanks and Regards,
Yemike Abhilash Chandra


[1]: 
https://lore.kernel.org/all/20260611-imx219-frame-desc-v1-1-fe7e975bca6e@ideasonboard.com/
[2]: https://lore.kernel.org/all/aip-xwYlKT1d3N0S@kekkonen.localdomain/#t


> This has been tested on top of linus/master based on commit
> 3d6d817622b0 ("Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi")
> 
> I used a AM69-SK with the Arducam FPD V3Link[1] using
> the following device tree overlays:
>    ti/k3-am68-sk-v3link-fusion.dtbo ti/k3-v3link-imx219-0-0.dtbo
> 
> See TI's documentation about this [2]
> 
> This is based on a patch [3] from TI's public vendor tree.
> 
> I've tried to polish the patch a bit with the following changes:
> * Use existing imx219_get_format_bpp() instead of open coding it
> * Use MIPI_CSI2_DT_RAW{,10} instead of magic numbers
> * Don't memset(*fd) since already handled by the core
> * Simplify frame_desc entries by removing fd->num_entries++
> * Add new imx219_get_data_type_by_code() helper and use it
> * Add error handling for v4l2_subdev_state_get_format()
> * Don't hard-code pad number (is always 0)
> * Remove 'ret' variable
> 
> [1] https://www.arducam.com/arducam-v3link-camera-kit-for-ti-development-boards.html
> [2] https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-am69/11_00_10_01/exports/docs/linux/Foundational_Components/Kernel/Kernel_Drivers/Camera/CSI2RX.html
> [3] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit?id=4268e58970c119e8dda8ad951f329d267eacc7a7&dt=2
> ---
>   drivers/media/i2c/imx219.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 223d3753cc93..fc237a2dba60 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -23,11 +23,13 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/regulator/consumer.h>
>   
> +#include <media/mipi-csi2.h>
>   #include <media/v4l2-cci.h>
>   #include <media/v4l2-ctrls.h>
>   #include <media/v4l2-device.h>
>   #include <media/v4l2-fwnode.h>
>   #include <media/v4l2-mediabus.h>
> +#include <media/v4l2-subdev.h>
>   
>   /* Chip ID */
>   #define IMX219_REG_CHIP_ID		CCI_REG16(0x0000)
> @@ -429,6 +431,24 @@ static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state)
>   	return (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ? 2 : 1;
>   }
>   
> +static u8 imx219_get_data_type_by_code(__u32 code)
> +{
> +	switch (code) {
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +		return MIPI_CSI2_DT_RAW8;
> +
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	default:
> +		return MIPI_CSI2_DT_RAW10;
> +	}
> +}
> +
>   /* -----------------------------------------------------------------------------
>    * Controls
>    */
> @@ -539,6 +559,37 @@ static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
>   	return (imx219->lanes == 2) ? IMX219_PIXEL_RATE : IMX219_PIXEL_RATE_4LANE;
>   }
>   
> +static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct v4l2_mbus_framefmt *format;
> +	struct v4l2_subdev_state *state;
> +	u32 bpp;
> +
> +	if (pad != 0)
> +		return -EINVAL;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +	if (!state)
> +		return -EINVAL;
> +
> +	format = v4l2_subdev_state_get_format(state, pad);
> +	bpp = imx219_get_format_bpp(format);
> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->num_entries = 1;
> +	fd->entry[0].pixelcode = format->code;
> +	fd->entry[0].stream = 0;
> +	fd->entry[0].flags = V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
> +	fd->entry[0].length = (format->width * format->height * bpp) / 8;
> +	fd->entry[0].bus.csi2.vc = 0;
> +	fd->entry[0].bus.csi2.dt = imx219_get_data_type_by_code(format->code);
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	return 0;
> +}
> +
>   /* Initialize control handlers */
>   static int imx219_init_controls(struct imx219 *imx219)
>   {
> @@ -994,6 +1045,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
>   	.get_fmt = v4l2_subdev_get_fmt,
>   	.set_fmt = imx219_set_pad_format,
>   	.get_selection = imx219_get_selection,
> +	.get_frame_desc = imx219_get_frame_desc,
>   	.enum_frame_size = imx219_enum_frame_size,
>   	.enable_streams = imx219_enable_streams,
>   	.disable_streams = imx219_disable_streams,
> 
> ---
> base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
> change-id: 20260813-imx219-frame-desc-35e9cbb004cd
> 
> Best regards,
> --
> Mattijs Korpershoek <mkorpershoek@kernel.org>
> 

