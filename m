Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9752E3FF893
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784548761; cv=fail; b=ToWuvYCKoWaMoK6Q6430bqpfr3GHeL2XKpqYc/168WoLBbGhBU3aLHyx4r7+9qbLMNA7c4mdM70CSujJJr4Z1+Ld/Y9s3pOYYuEQDY/8KuuVSRkx/VRSmBLOG9A4cieJks4oCbKn0NITA2JtKj5ynG+qFvqgjTvWSNASj+C3TA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784548761; c=relaxed/simple;
	bh=Ba01K5dDrEv6yuAfhObMYiJlqJUOZ4U5mFKOWKm+ndE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Z+vAOVERnrT3yNZgbWcQegX9Ftc6HQe7oeEDcImFgJqKjPW4RiknfVFFEOyiMTTxCz4+NBK405WWY7k3l3odl63GcZ2daNcgpcSKe3xJEZDwzgpLRkBxWPemgogS7kx03hZ+dDy0CFkMSBfJAy21Azlm3WMiNbfowrO0Rg0z60k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=AwnVlgEl; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vnPB9m5X; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="AwnVlgEl";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vnPB9m5X"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66KAsXdc1997989;
	Mon, 20 Jul 2026 06:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=BoS0G9U1bmRMU0VZhyZkmDabGrsnmptj+8VwLxFwH
	K4=; b=AwnVlgElONug0AKxULJ6v+un8ps+0cn0pvg9ewmXh/XraMxNm8iaw/JnP
	0r4p4Ez1QK/FtEYpdmBJJdYLKuSNVTfcsvqGBrbDsxiOmqvkFCO/JhaWftmk0kTl
	BFzSdc/0oKieRtsseB6WUZR7PrCFpohjVR4Umcp8ERJo/9tEbGgG6p/wAtpiJr09
	UG57M7ohRXaejkFnugTS3P5F49F/BaMDGex63EZ21gUdcaba7Zoo5AC4hIihN4Tg
	0CCvoWK6dmQZb1fVrAjbO835eTa1hJf62Z1oKnOvO9fp3DsYgCnNKplsLtDIGV6U
	py3dAOEadO38HEEjWXXwWN5tTWuhw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010029.outbound.protection.outlook.com [40.93.198.29])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fgtgh5kym-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 06:59:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBvAbz6h63LmEk5f11EH78lBOWmVlG+CUTHy3Ee4/Mit4fKHPXeF+q3U+pJnx8N0CoGsYIRocdXvJUe8S6ZZdK/KJnfYanj7EEWBX8QEaRIXFKAt7TDSNqKrel9wqP/EiDyr9MvIKZk+PHIaIqeT0bFq3l+VWsWo79XvopbLTTM6PvEC4FSOt+HmO79XpArHSg9vBmTibBzDJS7+u5Yy9t7PxB21Moe6qkBoyiMA0bIakdTAP9GnQxiNA5WOEOSYoSteaGvzkTYKFiz4QBDbae/0BtxSJxuggz0EugVwjKpEWvEXmLO7otYfjBK7lpUlEdNxa5wsH8DGayBUh+s7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoS0G9U1bmRMU0VZhyZkmDabGrsnmptj+8VwLxFwHK4=;
 b=fN2EgdxjxFxMg6MAJJH+kuNUDKYSKErwgIlneqP7WKJk3L1WVBQFVfzxm7qss+gN33cpCYz/GABinvs93J0coqN45/aYqO/YN+kQVLQq8VISkia3HHORG8iSlFx5/NZdKAFWLxfFKgUDZJfg41C8TWIoK/iSFrYUln+zW5PtwrXMgxcN2y0K81OuNvWThHJxtILdsJJmmIQjh6uv8/FBIPGXTD1odMEU8MZqcZpI0BSUfO/n77czOTCPi+YegVH1aMbYVRWLgS6aWUb15OmjnFeaAQE5Ou0sA8DxUXvcgUeRqEHIao9wfFyXc6nYTRqFgc83KDw7L1o5XHtgTe9yAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoS0G9U1bmRMU0VZhyZkmDabGrsnmptj+8VwLxFwHK4=;
 b=vnPB9m5XC//NTZpFphf7y5rV0R+B68th95s5u7z3zYQVuRGXCmVlGgSs+3hslb9nVBFZ0togfZTZPEy04T2+4geH5wuBfNAxSL/7nJCVKe/iSAL7UVi0k3WFWeY+/dGnO8HIQRUY76Y44RIAZ3eqABR46E7H+kFHqD3odOwioog=
Received: from SA9PR13CA0116.namprd13.prod.outlook.com (2603:10b6:806:24::31)
 by LV3PR10MB7964.namprd10.prod.outlook.com (2603:10b6:408:215::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Mon, 20 Jul
 2026 11:59:14 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:24:cafe::62) by SA9PR13CA0116.outlook.office365.com
 (2603:10b6:806:24::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Mon,
 20 Jul 2026 11:59:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Mon, 20 Jul 2026 11:59:13 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 06:59:09 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 06:59:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 20 Jul 2026 06:59:09 -0500
Received: from [10.249.145.103] ([10.249.145.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66KBx7HA2286845;
	Mon, 20 Jul 2026 06:59:08 -0500
Message-ID: <632bb86d-d41f-4ca0-8141-352884445b2a@ti.com>
Date: Mon, 20 Jul 2026 17:29:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] media: imagination: e5010-jpeg-enc: drop
 vb2_queue_release
To: Hans Verkuil <hverkuil+cisco@kernel.org>, <linux-media@vger.kernel.org>
References: <cover.1784276382.git.hverkuil+cisco@kernel.org>
 <f6eb47e6bad9f0f5d961aa92c23005b6768adcf2.1784276382.git.hverkuil+cisco@kernel.org>
Content-Language: en-US
From: devarsh <devarsht@ti.com>
In-Reply-To: <f6eb47e6bad9f0f5d961aa92c23005b6768adcf2.1784276382.git.hverkuil+cisco@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|LV3PR10MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e6e4f90-1fc0-4ce8-d2f9-08dee6565100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|4143699003|18002099003|10067099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	mE152YJjnC9l8DjF4wVFuSFlq03h2uF4HXaka8Lnd+55queohREAWwqq1PFyO5ggvGAyKOY4Dh0lvBv/2k8ykx6jMBh1gKBoq5MLBIIMNY2tOfx2Ks3ijeEP50COMeZ6CqgULGeHQIZKctQSf1f+zEcJqTlljpqcqv/Gl/ItkBlypldBoPUcpQTZWGgRfVikHmkIOY5DBK7mVqxJOCqVv8mhdkdRAUJrq+eOIZvVaeaJaeWRoHy9v0W7hdhybbxxAwyeSPUwjI6nBOgUGXPzFNoEiir3kecqMiChBhd8o+D1ktah0/f8Guk8QYAsbhmeB+zRfZICD+ujsyvqB2Jubb+JNekqRihXeFAPdJAtB18htAxVNsw32o2pQCXRF9OMWHSzaBSfc64Y5+5ekUX0HfIZfNZEgcX8VMnMW8NrCPkCdv8oLEV8K8YfHx+IWp1Jt+/YTn267dXSopzkiQPJTxlWyka1ldsNCVIy6SB69nPCD8M+8NHX6bsIoa50HX/CHNqpzscqt+x9cYTNUB7hj49Xtiu+GdCTqUBGo8ZFHR6XE51yW/ECUDKyXSyTDxpt8mMbK3sIacZGKZBj8wku6MWknsOA5rlqdZzguN8ub1Ss+STsU1+Z8evyvextzudciTAIdJwhYtgk1NW8zCXNKbMLNUkwjbk9IRCUgcU6KW4eNoQmGipaZyF4SuXxrOUHYNien8Tyh+fuCSFwiY5JyA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(4143699003)(18002099003)(10067099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AlNZJOskDjMA38RybfHtuJfpuZxs3VUtzRSkX7VAMp+PmnajyLW15mjuKVCyIEWEKnU7StFqIXDOdByRDgJYTdmHT6T3xQPC70fTK2HsSFge67bZ0Q6TOQENS0icdiOjQKeKsv2uvU3Mg8R38+gUToDmkxoXcDGbUcRXurzXU1JxHUlnCBKjrrD25hFIRAy1xbQItOR+oiwA3INoXwqnVYPALFyrwLRK9MwExlEeOse/IzfBIGO4ffpXDjfKe1+QN68P7HCu18vGWfhml/f3226JFdT9iPblMyf0S8rNlnRvtl7+AtPtrgV9zV34YOINcy+aQ4o8RhMw3CyitfvjC6yDz8SAEU/k/ms6KoEYYKChLwSg9qtCRYuDKIo7Ah4pdSrZa++uMvSHtwWC5ZJ4nl8FsIoDYYDOjl9ZveEtp7xHbtqI0BF69kjFA7X5ojiE
X-Exchange-RoutingPolicyChecked:
	IY+JEVcEIY9Bfd5Q5zya+Gas4QREd+x8joEEcUHbRLCFzJJbVrXMq1xlv2jgF5RggH+dXKWQSC8S0V7B5IWlwDUYrQLbUXJzP6qTBiil8tZW+XFZttuaEnWan6uiQKR+AGcGuQDnpGbUiA8nsvM1mbTukMxDHrFyoA5DbzruomQSAmgYgL4UPBRT+nMBmUh+J/Hj8NxXeQwlI/As0zwNkNquT3T3MYWJMqzhOgp8Ir6RJxatOw6Fs3itpY22L097J5i7dDdRD+ztObrMEmA5CotI8PqLZek/K83KEtZgBhnr/vC89hSW/PgId5eHPGR6m+OpDtL9ZKlf+Lz59+4iRQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 11:59:13.2948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6e4f90-1fc0-4ce8-d2f9-08dee6565100
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7964
X-Proofpoint-GUID: BkAzBDsYGdPBS9cF0jraGeRxw9vVdzIA
X-Authority-Analysis: v=2.4 cv=LtiiDHdc c=1 sm=1 tr=0 ts=6a5e0d95 cx=c_pps
 a=KMP5/9L46olBb+slh8+hsQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=YvkoDstj3-JjmO_mdj0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEzNCBTYWx0ZWRfX8bX7r2j+eyiz
 93veXCkmcKroo4NFd1JFYiyJbOVdyWcaEKgUVbtqcqQSZj/XM23SsF9MfnqHkS+JWN+uza9ftBO
 OZF8lsIncmFFJ/5I+TDaYCwZr4kGOm4ul9umvdWChYr4VDJY0nkahCt6wC5HqXYU0zSe17WU+qX
 zO+pICtAuM/xWp3tYZcKAnZgE4mFY5PUiMj4ZxGjMxwO2fp8Oka7CaJ7iYlfiU4i2qreGg6DPud
 gjJqCYf4e6SNsfPGq6222Krnb+YFlI3hY8K5uVEVVhrfCLmzYDiUvkHIur/l71nOxjjB4mqN1ie
 qtP6d4e5sfaTSCSsRw9YNK32XwKQCW8RL3Km2zjal6AYn7QiQwEUjbRv2lreMzZcdvLzkV4K6UN
 f/ZlAREt7zNOMfvefQge+n+ZnEn51zVs79+wycAJ7DUS8VTnYIozx75sx/tKQ1MSIUN0YebRRio
 eNYZGlKhX0r3zpSFgUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEzNCBTYWx0ZWRfX/IXASZKY5cq7
 PwXyVovoy7ysHngLtGUPN7eCse6nqmAzX1dt/DP2peHj0TcXuDjAPgVaOUB7R3dF2jMZctrkiNg
 otX+40wpyeq3/2Y+Fn+Hz7xb2eouk+c=
X-Proofpoint-ORIG-GUID: BkAzBDsYGdPBS9cF0jraGeRxw9vVdzIA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200134

On 17/07/26 13:49, Hans Verkuil wrote:
> No need to call vb2_queue_release after a failed vb2_queue_init.
> Drop that call and simplify the code.
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Cc: Devarsh Thakkar <devarsht@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh

> ---
>  drivers/media/platform/imagination/e5010-jpeg-enc.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
> index 42ad9ee3993b..2676bb25b5e2 100644
> --- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
> +++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
> @@ -606,13 +606,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *ds
>  	dst_vq->lock = &e5010->mutex;
>  	dst_vq->dev = e5010->v4l2_dev.dev;
>  
> -	ret = vb2_queue_init(dst_vq);
> -	if (ret) {
> -		vb2_queue_release(src_vq);
> -		return ret;
> -	}
> -
> -	return 0;
> +	return vb2_queue_init(dst_vq);
>  }
>  
>  static int e5010_s_ctrl(struct v4l2_ctrl *ctrl)

