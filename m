Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912933CB562;
	Tue,  4 Aug 2026 15:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785858733; cv=fail; b=c35qlSMk/EBCKToUjJ1ZW1kiv4FEMCyzDrzqQaPaRf8Zs3pZ3CXMjzHz4egsBmmV3S+7gzt69Ik+MLl1t7CFBhfZTp0PCbTh3he5Onj2ecfEocchrWB3h6Lz7+TIvTIp3yN0xL3XRoE+SVMTmJ+2zcA7c3athQWDsHOFNbZkg6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785858733; c=relaxed/simple;
	bh=IAaf/0ALMEE9cFZzI3/UUbtlFUkqihTXCoYvhwT8yHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=biGBPtkSVAatSfSYUmoS2hsmA5aJGpGbFD/R2YZco+0TVsEagc45J8XO2Sh3wu1R7aMMWvziLmQbsTKeulehpqtTbxVUScsu3V9f3gNQoiBxCzS2rC1dLNd2CwG62ziTrwJIF6bltem+BiLxkPQOgEiP2mvSJMO2mHjbJoHfPyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=IrNQauir; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wnHhiEb1; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="IrNQauir";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wnHhiEb1"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FerjB2858411;
	Tue, 4 Aug 2026 10:52:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=yVUG7Hy7qV9moE07GHiHfVnJqKLtdAlJMD7PUejR1
	OA=; b=IrNQauirW87tyqNIrIUsGpkcJ3tzzi5uEvSFe6nkMjRwUDpoYU6arB3Gb
	JYyUcf6BI9b1L6FQfV6GtiLJpykIBW/oQkFIzJcLnHJoDxTuVOhXTQf92KREE285
	J9GA//BIkHUM3uHfuE051lhqRWiEd5hrczg0022VOVbL03xnLdSL0pPUJsKoSx/s
	mMAarEoDRjQ1vfIwen0fSBta6YmTq4MmHCTvPddNEW8jTf9dUaCvOLItGBLYb90N
	LmN7zoFf/ETjDte2XKqzB2DZX+oredIxvvLAELAh01JM9LtWFHqsHEsPMuetRcqK
	15WVbhv5lqyZwF/0bKYGU7tLCYA/A==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012030.outbound.protection.outlook.com [40.93.195.30])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fufc6suw5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 10:52:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4aeJe9FyzJ6eKoFZWLHqOSx+bYTXujmPmWL5spx/QWLtEyCx2gSCF3NcytExogcJQj0BP04B96qu6shs+oDh+ZhU/mj/J72zlAsYsalSYsScYpKy6yZDSKg57IHEsBkVoSCZ3swve5nkrOLCDyE/ghX/RRL5M7svhbDmVnyYyJKffXzdDnVmjvGAbf3D3DOVnfkD8wqLJr2fuTdV05aB8SpWJqHM35xQYEiGq7us6HhK6c0i0ePiPmRMSfB3IrgvV9lm9LeN+0gHBDq4NRqWQEIcEZLPfSJINU/+wmJfSMS1WwKgZfvqrrLr7C11UE6ObkitTjVieIPCCKvYV+ZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVUG7Hy7qV9moE07GHiHfVnJqKLtdAlJMD7PUejR1OA=;
 b=h4GBkgLuR/IQOiau9aU60RqubMh1Eb8WUlJUtTA48NkvvmgowiQRExaktwxyBJX1NVD70Hczo85MuDicHZb26O7Ddg8p2WjAQmTy8iqiZ4rq6vi5659BfYxvcHSNN94iX9JwnMFjj4w7WnBUoCz5l+rZdFJCU0EunRMf3E3gyXRJMXeY1YKYPp2cefx2Bsz8KbwPDoasVSbaFcs+aaz59jVyasfvszrJlaGfPloWTDgk9swLCRH/feE+qPogIZU4K2aKLXV5Z7G6Oeaq7ICs8asc9ONLY5gihXFZjgbG1LOOHQAt6AfNT5y4Y7eLsekVUh0//A1JFebYJxF2jV66wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVUG7Hy7qV9moE07GHiHfVnJqKLtdAlJMD7PUejR1OA=;
 b=wnHhiEb1XmgDTfNKvswlpS1ThJQaaaxZkwmgdN3vd3HdYFdkCu1SVxHSAAS23QUKkuaj+asXkXEhLkrpzFdrHlZm55zlrZn5q5Prxzp9txFARsyEjNK9rmLayRFubTJPzPl0ljPHQ6P1lrwiZjkLviRAT2kaH3VM8CPDvr1t/yE=
Received: from PH7P221CA0063.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::11)
 by MW4PR10MB6584.namprd10.prod.outlook.com (2603:10b6:303:226::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 15:51:58 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:328:cafe::48) by PH7P221CA0063.outlook.office365.com
 (2603:10b6:510:328::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Tue, 4
 Aug 2026 15:51:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 15:51:58 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 10:51:51 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 10:51:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 10:51:51 -0500
Received: from [10.24.52.125] (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 674Fpmqr3949823;
	Tue, 4 Aug 2026 10:51:49 -0500
Message-ID: <d66a81dc-3919-4ddc-88c5-85dd1853b93d@ti.com>
Date: Tue, 4 Aug 2026 21:21:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Support RAW12 bayer formats
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <mchehab@kernel.org>,
        <mripard@kernel.org>, <jai.luthra@linux.dev>,
        <sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20260625151756.221096-1-y-abhilashchandra@ti.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <20260625151756.221096-1-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|MW4PR10MB6584:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c3e3d9-f07b-43a6-6d90-08def24050ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0fhqUWuNtrK2VdAhtWHV2MEd0pCQGwpDuFRCY0eLx1bSpI+5DVtMNegpa6eCfzylJvYl6ytMRp2ykmE3G1Ujczzl/jG0+k3sNMqus66r6c/UxQB3ALksIUUoXBnDtgrR8bv5s1tmp4fZCk31JbhTHo4WaueZsvhdcEVtTAvjywbyC+vaaOPlHzvbERVXG46ELqV3mCtfrLj0O8Ug1Je+75os8V1+hEVPVzxrG3ucIbQVAWkjwiD0rJXXehAl+bYvTdVKxXjCf5R6aFKa3/vAAkn3CphbSOoIGKFvWvp138o3XmnxryiMFrHI4/pK0ikZv5MuOmTAFGKAJWWOZAAJH+DBYKNhfzoNPnPfWliUaZ+G4o1KN0aKCopkV9MTqZEYQhbZDtWKqeYRXyJ37fMtRh6gpaJP/nRKvser4XDbSItHuEMCAtRRF4J69HLYbRr8BVofF2tYfbkANW1ciKtBT2hd71JZjRd5jjxmVb/TSX1kDty5/mVVjAbytu/3UJdun12BGP+1w2aIa1/vPPBP3lFmkXAJGLFmjovrN6JhmFAhvKAjbtCXc3RIMCYrtPH+Lf5NLU+5npHojK7DaCNqRVuyRO3uHO57p7QnV78s9HEKioq45ASA4eclX0z7TIdEzxRgYtdSlx7v0wuiaCnLTCBsQT2poKSX/wHypvOYoxEhIL5QpJ3ji98F/mObS3l4foSm0IxN1A3Qj8trYtu8Mg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KUP2++vFhVj+ZIxaBxI3xghTNxUWJeHeE80D7GcOe/1AZcQsQYh7trQuyrNO3l+NsNHl3Fe1sxFfDIgRw4/kyIJgnw35xW/LngfPH1Fp6J46D1qhnSOOl7GdmPZz67ZkvcPVFVxVscx4xOA1pVmXyAqWFxyMLgNYKsEexcwfa4emgX5kDPxVaHNvIFfQvpIGDfQIrYfkLzYLhloIcT5/OELtDeDF8JVN3OiGuOvs27gOi7ZyeUzaXa7BpHgptr3I6kPZzF/K7CJbcy6uTTK9LZvVD32RgWRaIsICgQYuy4noVnugGqdh/iAxsykEzPeFqZMoBLvxd5Tb1QaKKM3rSrP+D2WroTH2T9RA2lFzW/udcbLLcSQ5Oa1qLXUJZup7UhsISyagL+pg4+qtKKpqD4kFYgQ59GEmfg8FU8DzJMv05ynuaQfrThgo8raWX+PQ
X-Exchange-RoutingPolicyChecked:
	l9f0eCz7DHNoWEOobv3u3bPNq4sAo1zdsrqR/vdGinIbxoyl/T4VRjy78eqgJKqXvp8qnVh+aiyByJZ8xJjIQMeWkWtc/e5AE/JTCNAiiRTS12QOKFHEsO5r8z97WZXgRz0VAb4kStSiPHlYyCXdgH0MuHlzNOd4bVQJzXSbB/nmw6i6X9GgDlBWpAcyxHiTP2a8UjXay9A3Iu2YCRntFrmpze0HNBNmc/8VzOi+YQqONRprbh98nZU39PB6kF/7JWVud6k71GQSafLayI5QUXRhNUo2Ac69AB4/YEmHKH/HU2AASnfuvq8gob26X4+cJxmLWD1AcPieGa+BeoS50w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 15:51:58.2063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c3e3d9-f07b-43a6-6d90-08def24050ee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6584
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEyNyBTYWx0ZWRfX+osYx78DKX1R
 UpD4AZpgPamBcYAmVV0BsmJhcUKpT3pWdLyw6b5lsSHcaVUPwMpO1OSYknhv+bvu6S4FUriogrY
 UGXHE3AF3BH8ix0COVm8HyVih9KJn5cufQn3HP1ditO6GX0KNlowUpFU9I0Q4IT9sGIyy9A9tuh
 1UnV1czEe9KUoXUfo4XFGePIXdJQJ2hhSu2D+rNfojZjT08l9VE2vVfORPYlk94OOHco8gGoGbP
 Zso6o/Vb/4EstZimcRRJWYJJINVgYiP0/06l2s1fj/p5R25O48cX54geahokIAe7W72eje1ts7m
 EsFM3NgUsCjV2499cHD5o6lqdib/IK4jn5TQusnOMHavQ9K7uUE6Ny16lVAYo/UTfUWsLvJdJl5
 D4cAdsqQJgEvoHE0UFHf5OkC+T7f998GROOv56FOyr9LYwYXMZBBJ+AAkQzwoufllb8JL9J6SLo
 k3h7kFH+k+axLgQ9yow==
X-Proofpoint-GUID: 8mGYoLXBF453EVM31bXv9h-mZbMV_YPG
X-Proofpoint-ORIG-GUID: 8mGYoLXBF453EVM31bXv9h-mZbMV_YPG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEyNyBTYWx0ZWRfX3iab1Lk2+qXI
 KDbqiPySwUMgzDBospfSxIbytlvI/gnNviuPn5y5gDp9jV2uTx36NKfqUJ6k15uEYrfSXiWyCCT
 cqtDCfl9KWVjk26CpQsfwAwy3O1SBtQ=
X-Authority-Analysis: v=2.4 cv=Va3H+lp9 c=1 sm=1 tr=0 ts=6a720aa3 cx=c_pps
 a=3pdFJ6cSxbCDruMc3dgxYA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=NEAV23lmAAAA:8
 a=sozttTNsAAAA:8 a=RJaHbvJJA5o1k_-59LkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 spamscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040127



On 25/06/26 20:47, Yemike Abhilash Chandra wrote:
> Hi,
> 
> This small series adds support for RAW12 bayer formats in the j721e-csi2rx
> and cdns-csi2rx.

Hi Abhilash,

Thank you for the patches

For the entire series,

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>

Rishikesh
> 
> Testing details: Tested on j722s-evm with v3link + IMX390 downstream driver
> Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/805ec4662b60ad925e979d55a9515f89
> Testing Branch: https://github.com/Yemike-Abhilash-Chandra/linux/tree/RAW12
> 
> Jai Luthra (2):
>    media: ti: j721e-csi2rx: Support RAW12 bayer formats
>    media: cadence: csi2rx: Support RAW12 bayer formats
> 
>   drivers/media/platform/cadence/cdns-csi2rx.c  |  4 ++++
>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 24 +++++++++++++++++++
>   2 files changed, 28 insertions(+)
> 

