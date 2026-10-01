Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953F44825B8
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 06:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790835584; cv=fail; b=qqrgxp8mbHPz+zV6U63ma36lSxgOhy4KIZI6yqQdE4zDBY1uRZLQJw6D2wmFLej6RKhgP/1gwWj/qhRUCOTAz8AbVOoYRMNCDfq3YLQpSNkPLmFWf6Z4KwafqUlfkPtvuNdQkc7Ch5e71DnepD27X6++2D8Z9NkatF+rX/PfdWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790835584; c=relaxed/simple;
	bh=O0Sqq7Gz4IKsZOzU/kKH/z5ItXiq8WZ7ZMlf2rlVMI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=syiLG7N2aJ6ArJPHOY9Efdc76RfmyzwsPrJXilmoVPpP+W1bZD3TMs1+aKh6ZpPDQjq99UNLM7nQh3AochMjG7aO5e1O4+yLZXSS9ygW6AhSLjXto9FiA5+0/CIUfRkn14JJbCwOMC54TJjPibCt9JpRq9Ih1CEOVh991hUIFLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=gN+0JmjO; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=AUf7iHC3; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="gN+0JmjO";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="AUf7iHC3"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gqXL411876;
	Thu, 1 Oct 2026 01:19:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=t1kVmG7Oah0Xxj3SwIs/DuIAq3bTXT+Q7XIZPf9Wd
	RE=; b=gN+0JmjOXrYSW+T6P6+hletOxdrz0A+YWrE9J08ewzZB1nnmq8GcaRayI
	rDoAeDRUDi3ltM2NXvG5LTrallWBzeiKC0N30OJfhRvaDuwwYIcXtweMuT9DYZTo
	74qQnSrjOfTdjGhTSp7b3pSQgwlf4gPw4dSHnsgM9xGGr7t+WFVX9r4xiGA5TvEj
	V6PZf21/xqmgH/PGXzGn9ANVLjzzFSe0TNWuLsJOuDsZmTOFyanwFUyURp2Kdy4J
	lkGIHVfV6jiL8H1EPGHv7M/u5+AMnPDENQnAPMG7ERzI/UaQXa3c6ok6Xvc3xV/F
	SXekn7AK+14TrT+y+3wno60bqc5ew==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013029.outbound.protection.outlook.com [40.93.196.29])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h17djucuk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 01:19:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=km+wuzDO1UCsd3oO9psoa3E056+wdkVzia41jlqKhHvl9mRgPSZf7L3NdjenWENVyrRdGNft+eAsq8IHu5YGIWXAUU+2wiVCnio+1wI7gWeAp6F2ws6+6Egf/9B+NjJYbOfmqderNbyyds7fK6R5NBVdR/F13cCwl/MFK8mtEqtvi1OV+v8Q5aKlsgv8wmYUomNEEEpuJVnK8gfqJr86UHJ9aQABcPIR75c7Z2XADyXj6dzAi9oh6tXUxdZ9MhfA703ZgJTALg98pvlEzJunDDPVpKdh6jEQLSEbUlRJdqVqLYle53PEeWaOVHxMQKBFlK4BpOWC05KBHFB0jBmiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1kVmG7Oah0Xxj3SwIs/DuIAq3bTXT+Q7XIZPf9WdRE=;
 b=zMeLcoDCpyuc2OiT3QG+TDGODeXXB6QIqUS8EKEtAF7CzxItn8NGySODW0IWn3P0gDCV/nhn0Xq8w8lxOWn++RVzaA3nppAufFUjH4wPzCSoIiSGKTI0OKe68DQGBiRJ/rlomy79Y7BjEtFRI9+eMrN8JlB4OMpM1c8v80C2MYvRpPlNzjCyan1vKHnGxr/dUifSsd5Y7QROBLt6MWudFMd0f/jst7t8vS0WBNeY8L9+tghYaka0LZlw8SSUkqGWcM2fnEr1TH+dX7Rp4Q0VAY953Gk6GZSd7ERQ2dEr9B8N3VWiVdic0OGrU1BiUDJjcFnANgZx8xwnV6tJ9smOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1kVmG7Oah0Xxj3SwIs/DuIAq3bTXT+Q7XIZPf9WdRE=;
 b=AUf7iHC3zmMxkjNGZ2N7opQBVXvYyIK+PUKRJclbgrXEn2amX/I6XsYTIxmUsSYEg5L83sqkLkM5bf4HytPlpH/IzVJncQRX2tQaUFl/XbPj8A1ASiyekAMhzTqPPGdy0MhB73raldyXs9rVyPUpbjs+cKmhov0kcUqlcHYjOj4=
Received: from BN9PR03CA0091.namprd03.prod.outlook.com (2603:10b6:408:fd::6)
 by SJ0PR10MB5768.namprd10.prod.outlook.com (2603:10b6:a03:421::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Thu, 1 Oct 2026
 06:19:32 +0000
Received: from LV8PEPF0000005D.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::51) by BN9PR03CA0091.outlook.office365.com
 (2603:10b6:408:fd::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Thu, 1
 Oct 2026 06:19:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 LV8PEPF0000005D.mail.protection.outlook.com (10.167.245.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 06:19:31 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 01:19:20 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 01:19:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 01:19:19 -0500
Received: from [10.24.52.125] (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6916JIGG1356820;
	Thu, 1 Oct 2026 01:19:18 -0500
Message-ID: <22a0424b-c67d-4dcc-a31c-26acd764c653@ti.com>
Date: Thu, 1 Oct 2026 11:49:17 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <libcamera-devel@lists.libcamera.org>, <linux-media@vger.kernel.org>
References: <20260914233810.GA2796257@killaraus.ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <20260914233810.GA2796257@killaraus.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005D:EE_|SJ0PR10MB5768:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f9c035-0cce-4896-92a9-08df1f83f4bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|10067099003|56012099006|22082099003|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	NrxcKukIf38WvrCNevVZDCvSar0JFBwMQsnKdM+Ajv9ne4UTu14g3dbNjpK7KHIeVNYfbrl8I2Ymn0Omrq94b2tc/7le7BzCwHi8qOhdsbDoIPGU9gDcKDyJe5aK8eJ6CKRZGc3CiXoSDMIskxPTyhyRPUv8hrFQY4lSiZkBGraLfR5NM0B19WjZC8l+Hzmjab4S5nbtloXxpf81FrO7QHFoFT0/nqdZDV9ZIgIe8U/Gtfkr7EkruY4sxOGL01f9UZivaqr2OAQPd/f2OTTbkf8hB/2jxdC+CHahFG/U356zQwBSOuwvh3jBjPMeMBd/fKLwKrr3VUwmZZW4JwIXyh8GcJEE4mK/XCC7qRDbkRdp+1ECGeuzHVebdHY+FLl2wk3HFwEzcP61JGDFuTGzdJ0yycNQHuoGjljdn3aWC7wLCx897SzgrXyi1cQkBt/591KNv37qM9OXVidVJdLzEd62rrpeOkWfykFX3qz/OCjE0DbZRjnSjh++M557p4pzlCFq0/bZxn/b3G+Az4qa+2mwGzq+krk2jqdkkYNfz9884DD8QEsdrH26o0kPYPdlqt9qYoe4BQLaMHrw0M9LAS5Ylaqobm2bp3gBrdp74eggbA97wyMsQKY49gVvP+Z/i2sZMyKLUBfeihchJevJqw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lvvrIgfkLDk2bCUJHjogm9jv3Fsxfa3iCT5tMJl/ZuNsjBATIN0IFaUv8aU4AqFh4OklzXAbpSTagIoq0GKwpMdpIfmtD7mc5eohUoUEsW1YswIg1dBo/gl1Yq3jD5df55tDTNXu4SGDTg0GARQpbCQrHjKnI6JT4+0052eWw3GuAI+1zM5la1NMVT0pW08jaBBzJl4hgh/vslKu5psaXBQrOP/Hs6Yw+cJFEivgR65SVzYC77O0KgzyLsb5HEfpJXg/qHBDQSraZkQJaHX+DqB/E9XM0vC22H1hdTtUzNvLe25wAST61TmbMDgMlZQNXiKsX3y8nXIm2LQ1Dd7PnmXI3MRTnoWaQ6vfpveyukU9xnGV4V7MP+/KQRLKLhevQJaUalZJkqk01C9F13yIwZEYy1WKeRLPebJCGc2yTZPv2p4YEZmbjk/GpuSDOOG4
X-Exchange-RoutingPolicyChecked:
	1r4Y/aM8ffLTPKTYtCzZkUkxRRuv/d7HBIWYA+ABZcuD4hXSGGS+6fgk8Q3ULHhS9tW/lYWokmykmKJ2n6l1FJCLrDzZ1gFCbpG/SZtOMF0S2g4tVsgqllLipLXovQJIkGE4h8BHN4DA1dnijCR2vcj2wIyYvNCbPhgVya5Btij1vnfOymPabfnaPJWudPa+iZBWu/tBgd/9yW57bJR40px6v7wPD5r23exD6ZBNnUZkwcU+d1yvQwKBZhIOjtWDt+60GI44tutUZui64nGd6HquupPet6gWeAsFAacBeC5cXTehPLPFISTuq6IZ5SG/6OAVbSwgJ1jcR5xalbcRhg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 06:19:31.5929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f9c035-0cce-4896-92a9-08df1f83f4bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5768
X-Proofpoint-GUID: RIqD5fjUC-CiW1F2qi-Rhwe19Wb8Ah_o
X-Authority-Analysis: v=2.4 cv=aswnmiZV c=1 sm=1 tr=0 ts=6abdfb78 cx=c_pps
 a=y599upwrfiZ3HV94zaFOUg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=OGjWj8McAAAA:8 a=vugxpd_pAAAA:8 a=Y8D-c1sSk6SiytA-WIoA:9
 a=QEXdDO2ut3YA:10 a=UYjydHh6ynBBc6_pBLvz:22 a=dlIDbnWlQMEhdIxAeUMX:22
X-Proofpoint-ORIG-GUID: RIqD5fjUC-CiW1F2qi-Rhwe19Wb8Ah_o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyNCBTYWx0ZWRfX0uX82SiNu5lU
 J0zQhQZLro/t2GmiNr8MtvySMrjK5VjBpfrYosMZkgW8fhzr0KmtgsIXx6TvfFDDqkkVLVNeboO
 /dSBNYQZx7BitzOtPjERRIRMJCOHGd0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyNCBTYWx0ZWRfXwu0l9cjje/mr
 0zq8aG3Vv2OxAcvm0dnWTb2oX5XB2eT8ivZlYEpVOHZSsLdwNayhULzaZhGatRpTuNh6iCBFj7h
 hbo5SbP9GdUopqK1HTl31yIkAOGU7X0cZHmfY3n/C6XZC39stZZBcuuAycbksXoGThdBdnBPB22
 Z4Q5qf/lma+JLR12cxyiiCbp/U3rBnYNSTSU5e9LoD/XxdWeWdm63mrxenzkDrQ2k2bs8WtoX8i
 U+NDT0yvy828foOuNPBfGqBwZ0/tsQ3DCMIddmYj1saQnvfrqZjoZjIzZMDyKx2AdOfmFDjHdnX
 oeb44AqBZ7x3TucfbRgko49SIfXj8LX/FPcxu/i5yt/Mdxm3lOBYrJRtN5VJI88D7szmzSdFhPS
 hb7LtOy4LK9tOWMGABy6/3mFMCA2+A4y2qzy8J4MBsi2n5q+SqAixBYu608HTpM3FbJEULpEEPH
 B4npCWmkObZyUTvTSUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010024



On 15/09/26 05:08, Laurent Pinchart wrote:
> Hello,
> 
> As most of you already know, the Linux Plumbers Conference will host a
> Camera & ISP BoF in Prague in three weeks ([1]).
> 
> The initial proposal for a microconference has unfortunately been
> downgraded by the program committee to a 45 minutes BoF. We have
> therefore decided to limit the discussion to three topics at most. Two
> topics have been approved so far:
> 
> - RGB-IR support in V4L2 and libcamera
> 
>    by Rishikesh Donadkar and Devarsh Thakkar, Texas Instruments
> 
>    The Linux kernel V4L2 API does not support RGB-IR image sensors.
>    While building blocks necessary to handle those devices are slowly
>    being merged, RGB-IR support itself hasn't been tackled yet.
> 
>    Rishikesh and Devarsh will also present this topic at the OSS Europe
>    conference ([2]).

Hello everyone,

I have submitted an RFC for the OV2312 camera sensor driver[1]. This 
patch series proposes the use of array controls to facilitate setting 
controls for both the RGB and IR streams coming out of the camera 
subdevice.

I would greatly appreciate your feedback and thoughts on this approach.

[1] 
https://lore.kernel.org/all/20260925133001.2780868-1-r-donadkar@ti.com/#t

Regards,
Rishikesh

> 
> - Camera module identification
> 
>    by Stefan Klug, Ideas on Board
> 
>    Camera tuning and calibration depend not only on the image sensor, but
>    also on the lens and other characteristics of camera modules. While
>    Linux supports identifying image sensors, it completely lacks the
>    concept of camera modules.
> 
>    Identification of camera modules requires coordination between
>    platform firmware (DT or ACPI), the kernel and userspace. Discussions
>    will benefit from the presence of DT maintainers.
> 
> We can consider scheduling a third topic. Proposals are welcome.
> 
> Due to the 45 minutes BoF format, we will focus on discussions and won't
> be able to afford presentations. All topic leads are expected to
> circulate discussion materials on public mailing lists at least a week
> before the event to give attendees time to read through proposals. The
> materials should summarize the issue at hand and the ongoing work, and
> clearly state the questions that will be discussed during the BoF.
> Slides that support the discussions, if any, should also be submitted
> prior to the event.
> 
> If there is enough interest, I am considering booking a meeting room on
> Wednesday morning (location to be determined, likely outside of the LPC
> venue) to extend the BoF. We could continue discussions on the topics
> listed above, as well as schedule additional topics. We would overlap
> with the following LPC microconferences:
> 
> - Networking Track
> - Containers and checkpoint/restore MC
> - Rust MC
> - Scheduler and Real-Time MC
> - Build Systems MC
> 
> Please let me know if you would be interested in attending a Wednesday
> morning session by replying to this e-mail (publicly or privately). If
> you would like to propose additional topics, please do so publicly.
> 
> 
> [1] https://lpc.events/event/20/contributions/2364/
> [2] https://osselceu2026.sched.com/event/2RaZj/enabling-multi-stream-camera-sensors-in-linux-rgb+ir-streams-and-embedded-metadata-rishikesh-donadkar-devarsh-thakkar-texas-instruments
> 

