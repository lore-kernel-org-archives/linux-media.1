Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010002.outbound.protection.outlook.com [52.101.46.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436313D903C;
	Thu, 30 Jul 2026 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405438; cv=fail; b=KSFnbQtklHVOOfPNAL8FIS72i3z3Ab6K7KBaTu17Ar+wiMigxgMziXhdr9K3Ms0veIzEg96GejYkzq8TOQYct8y1gMOlWHqrZpIDTR5voO/2TrBcjGbMaeq8CwUYR2m8akXbkjIEUB7dg/3Uh4R4tyscq1FdL2dvuxmg8MKeXv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405438; c=relaxed/simple;
	bh=iZTS5VrOmP/qWUI2wtLLcUT42fIh4HWcx4/ZOBUiX2I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bUPowHmWDfMHIXRjLXlScalH/6yZDs1RM4t1bxENwyUwvH/We/K+duBfaeVnRYhADy9YSmopDuKk9JF/sJ8Pft+mbd0fOpPDlBP2FHysQmoIDA0Bx68BS1dOnoklyDYKpsgDyJA+fOJ4Ck3+Jogv1qvUj/wc5rkSUhg7o+x5cO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tFL1drWz; arc=fail smtp.client-ip=52.101.46.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tFL1drWz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZgDe9mYQvhVuzxTDfXDzNoUS+6C7MyE8MlNlyWkAr8NqBfq0CQUIE0FdmXd9lPA/fnxTw3yjVHY/OcJKjwWKXfu8ApeoD3UeGWmc5x/Y3aLg1LNp9MmHvzffEtE3RG/bvkipUdtAEhsx0jvrIocZm21vTwx/acWGzydxNGCJtLkcyxQtNNBBuP/BlKWLRgeX7dE3EfnIsHszZMdntw9LGnF9QhcDNIoyzR+0lcKmY7Q5CJWsHneFcoy77RLPMHgmE2OJLq68I+2JZQOrOAIWwIE2EfLmwdK5LNQIiE6CQe5JSTDXjOMnuu6I/yxWPfy1jT2bCsEVlSQRZzRI3HOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXIJ4qFhxGjANOIoHTeh6hLLNjI+CJkg5vuUU+EbU4U=;
 b=aAhzS7Kgm96EgdVzZz565am5fDLEqQPCAtnblnJXmbE+GtGGntHscBPM4NjUGgHwpojs6rBcNxVdkrXidL0HLh85QaGdkiGh+Kwpams4MtZOKqgLQXHL7ZxsOXV9oDIMkTpZnczf2le5u0dfSPRG8HfmpqLuqpIJg03vT9Ao8G74B9uIjYq5a623PJ07qvQ1YRIB4dETv2QlxrCx2gkDgQvwEFopbxEWKJ+er9nIB4Gny7tKaMzKngV3t0sfB1JIvFHi3eV/WEK3MYVap3wfu+AuEWYNN9UH1mxvaOHNi4mXdyQpEkqdHcah2VTyV7+TT3h4lPQNWVZlmQMAkgOBbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXIJ4qFhxGjANOIoHTeh6hLLNjI+CJkg5vuUU+EbU4U=;
 b=tFL1drWzolCaYD+eWRFUjNR5iX4Bbwau4ngNUNgPqgikiF8SAOPBblYzDc7Vx4ro9iSVGnAZ942gyQ8powNSXkrbKMnRmEaafFPrlZxPyTYU92cJNoIL+IcInuVjEGoaEWhC8VVJHgzDPLwH9gQCHdkXIDnIaxgrupAC4VSChmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20)
 by SA1PR12MB6920.namprd12.prod.outlook.com (2603:10b6:806:258::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 09:57:13 +0000
Received: from DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589]) by DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 09:57:11 +0000
Message-ID: <6d9eeb5d-eb25-40b2-8ad4-25e185ac8591@amd.com>
Date: Thu, 30 Jul 2026 17:57:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] media: amd: isp4: release partial allocations in
 isp4if_alloc_fw_gpumem()
To: Yifei Gao <gyf161023@gmail.com>, Nirujogi Pratap
 <pratap.nirujogi@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
 "Li, King" <King.Li@amd.com>
References: <20260728141659.62310-1-gyf161023@gmail.com>
 <20260728190754.363464-1-gyf161023@gmail.com>
 <20260728190754.363464-2-gyf161023@gmail.com>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <20260728190754.363464-2-gyf161023@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To DS0PR12MB7747.namprd12.prod.outlook.com
 (2603:10b6:8:138::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7747:EE_|SA1PR12MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 23495636-02cf-42ee-0575-08deee20eccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DLk+B6Y9UVFSb3O8Pa2LtkP7FrLvQM9bVTlHMoqaTeL3CypSWUhlJdFD6A43tlkJRIMvzQO27075jEdL7IpkixaomIu6pIkha1tLRsGSNB8K8GSiSjAWtnPELhDkHmsOTj3kG28siHHC91PccyFQ12hpuvm2YluEsEW3fXmXofPoJqcB2eqTT5gxu6JNrjgNmvr9sAoY5iA7GpSEbQ/NKLy78ofUtCp7iIj3SO4XGVluc7giXY0uCvc9H5EyityUU/rxANU5XcvJcei9NCz9jNK8EwvlZjdPDHwk4y5RogXCJFKNUDR5BI9P1KD6dJo5lSXDYeX3AcNNkkVqSPSodxJhL4sL6j9+VlG0MLMGbRsnNpeZV9J+R7CN62S/vJSWPmdRZ/4WXte9b0RC75/ks7oi71P6rcv1BxyHBZ+2CCM5Cv1hMAU5rbUa6gGd9oMFQoQeHzug5sI30pA/o+XyrTaZIriEfeftOMahJMGABtq3++icjWnW0iEhwEe5nALQ4Zk+GVwubkcrd9MddbBcFIpTDj8Z7zjnwaTjr2QBZQeM77jlGj538osa4+aoj4unphBw7+4huSO4kJ5ATT8TRBBUwcj1iEGuiAu10ZcME8vMmYaTCi97llTbrlgtCoqSM00LLff0RqHYQSOYXOH7qcaDCQPhEcrQYeQ1dTnHUrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7747.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjFRVmxaQkQzaTNRSjRIOEFzeTNOU013Tkpvc2pjaGlPaW5USEF4QXBRWHhK?=
 =?utf-8?B?TTBJdittS3lxaGdKbXRIdklmS0ZTOVBXekk3WnUyY3BQTnZEMHVINHFMcnRr?=
 =?utf-8?B?c1pCSWpZd01qOS9ndEpnRXBrb0s4bUZab0UzOGJyZkQzaklsOStocml0clRs?=
 =?utf-8?B?Q243YmloOVdwcjBxMVVWTk9OcmhqL2w3TGFNcGE4OEZ2SEY3dERlOUkyWGVo?=
 =?utf-8?B?bEoxV3lzbGY4V0NOZU85bk9mZmpEY2RpNm5hcHlVaHdVYTZBTlRMdHdPdG40?=
 =?utf-8?B?c0xSS3Jxa0pJY0p3WjF4R2E5K3ZobEtVR2NXVk5vcGlwVEFZSWhaV1A4OFE4?=
 =?utf-8?B?TjY5K3ZsS0JPbkF2Z2tKSlU2OGgrMUxpRTc5MWpWMndhMmU3dnJOem5FTDAw?=
 =?utf-8?B?OFYxTHM4dFJ2SDM1cURXUE93OVVYcW1NOWpYcHlrWGRMWWJkYnp0QVlJKzgw?=
 =?utf-8?B?YmhOMU1VTEpmbHZ5Nm92SENFbWl2UW9ob3pzRk16LzRBeUZCSUNudzRSeDJ6?=
 =?utf-8?B?ZmZXcFhVYmhiWUs4eGVWMjV1aVZxdlZ6MGIzVkFUWGw0WFBtRE43aGpoV1di?=
 =?utf-8?B?WG9DMWRnSndLTnFtaHkxa1E3VEJwOXIxOG81WTVPeGIza0JKemVjVGVOTDZI?=
 =?utf-8?B?dGxiS1JvcFJkbWNKeHV6b1pWMUxjU2lYVDJmVjVrUktaWlhsNnhvYnNTZVpq?=
 =?utf-8?B?Y1JVWHRDTk1CdUNIVjNLcWY3TE1zM1NmNWlHSDRTdHF1TFVxV2ZnUjhGR0h1?=
 =?utf-8?B?YWh0L0owNkxFa3d3Q3VyVFVJZytDRGNiWjIyTzh4SXlBUWYxZlFwS3htalRn?=
 =?utf-8?B?QUFhN0dtR0VXV3ZqY2VVN2t2ZHZ2dmpOdzcwZXZxYWtWSkUwUDVMdXltbVBZ?=
 =?utf-8?B?VUh0VTRKb2xSY3VobjROb1BKcUhkbm5VYks4ZXpKV0R5VE5JQlYyWlMyYk4v?=
 =?utf-8?B?VE9OSXVRUjBoMGliT3ZweGROWmZxUmorZXhOdENTekhndS9WY0o4MGROMHha?=
 =?utf-8?B?SkY4Z25uV2dwVTBsWEpVZVp1bmJDV2lZRkhyTGxuUzNQYU1Nb3l4ZHR1SGJR?=
 =?utf-8?B?NGg5eWlWZTVXdTB0VWRmTDZoMXpBQjZyR2ExeTJVMGlsMjRVemVGc2hPTTVu?=
 =?utf-8?B?aHJQTmNlQ0VvOWNrRk9NYkZQMmVwcWs3N1NOUENyK1o0cXFZVDJCSitNVnRN?=
 =?utf-8?B?R3dMdVdUcGNqeDdxUG1US2ZxU0VhdDFMWDd3bm42N1Q1K0JrYjE5QUhWQm5p?=
 =?utf-8?B?NjBPK2hzMEdxY1JadG1nSTVFN0kzeEJHbFM2cDVkeC92WkpUS3JvUUFvZWtx?=
 =?utf-8?B?MGFyOWdQSERtRW5zUG1HejI4Tk1iVTJTNzRvbUgzeHZva1k5WmNVRHZEcW03?=
 =?utf-8?B?WWZQYTJPanZCMUlRWHZhL0kzV2ZieXlReE40dzUzYXdQMTJQSnJsWWFpZkY3?=
 =?utf-8?B?NnQ1dSsyMjlYL2paMUpDMHZ5TlllK3RVKzluVXQ4QnFnUjQxdFhEcDQzY2FC?=
 =?utf-8?B?WjFiVm1nbWVZYXlYQiswNmt5dXZjeE01T3ZITDRsc0Vyc29oR0VjWDhPU05u?=
 =?utf-8?B?TXkvbC9SaUJjbkp4d3BzeEIxWGljWWFLRUhIOWJ3d1h0Tm5rZE12Q0JvR1dQ?=
 =?utf-8?B?djhwa1l5ZjNjMDYzSkdMU2Z4WVptVzN5UGJTckZqM1dIdXpwUURtTjd5ZXBU?=
 =?utf-8?B?YXlFckQ0R2JlWml6Zk5SaXFIOHFZalA5NktjMXFORXIvdHFTN0hBbFQ1VGsw?=
 =?utf-8?B?bGw0dmVqclEydlRWL1FDQnNIcnpKQnpDWlZvSWJOR0RPaXcwNTNhd3ZPNk1y?=
 =?utf-8?B?NUp6aW5jMHFYV1RiclRHQkVSRXVDOGhGeGV3K1VURnBtSHZZUHh6b1hZbkRs?=
 =?utf-8?B?dm94MGw5RmhKQnBqenJ0eFpaR2dVeFFack1SclpQTndmd3lubFlyWEZmL1ZV?=
 =?utf-8?B?N1FaZGI4Q2o1ZVBaVDZoM3Fma1RZc0txZlVGbU1GUmdzTDFjcThZR3NXdzly?=
 =?utf-8?B?NVprcEhoRk51RHJjRGFvZHhhS0JENjA2ZHlFTVo2bk5BTXpJZTJoN2ZwdUFB?=
 =?utf-8?B?OGZ1dzBVZEY2TUtxVkI3TWNKcDcwOWVOOUlWWE1aMExGSXIvQ1NBUFNVdGxz?=
 =?utf-8?B?elQzRS9aUm1HckVBQmxRM1hEbmQ3T3ovYmFUMldrWDY4TnJpQWQ1dXNMNHN1?=
 =?utf-8?B?MzFOMnpyNXRYNUVlcmNIN3d6bFNjTkRoQUVVOFUvMmh4UHRydCtkMkkrNjlG?=
 =?utf-8?B?c3ZpWFd6TXNKVE5HTXVKMS9rblJvOGZveXkyUWNsUDRYOGw4RDMxRVBsSUdF?=
 =?utf-8?Q?NetYn3EefkIifQtX2o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23495636-02cf-42ee-0575-08deee20eccc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7747.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 09:57:11.6054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFlZAkpBAvIvwi3F6FgoZ/QpOWtwt0RBKN60WUEie6Jnsjh2tRZP6Tn/0ewpt8D7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6920



On 7/29/2026 3:07 AM, Yifei Gao wrote:
> isp4if_alloc_fw_gpumem() allocates several GPU memory pools in sequence.
> If one of them fails, it jumps to error_no_memory and returns -ENOMEM
> without releasing the pools that were already allocated, leaking them.
> 
> Release the already-allocated pools before returning. isp4if_gpu_mem_free()
> is a no-op on pools that were not allocated, so calling
> isp4if_dealloc_fw_gpumem() here safely frees exactly the pools that
> succeeded.
> 
> Fixes: 4c5feef6a62c ("media: platform: amd: Add isp4 fw and hw interface")
> Signed-off-by: Yifei Gao <gyf161023@gmail.com>
> ---
>  drivers/media/platform/amd/isp4/isp4_interface.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
> index 8d73f66bb42c..8e3616cce479 100644
> --- a/drivers/media/platform/amd/isp4/isp4_interface.c
> +++ b/drivers/media/platform/amd/isp4/isp4_interface.c
> @@ -201,6 +201,7 @@ static int isp4if_alloc_fw_gpumem(struct isp4_interface *ispif)
>  
>  error_no_memory:
>  	dev_err(dev, "failed to allocate gpu memory\n");
> +	isp4if_dealloc_fw_gpumem(ispif);

The cleanup is needed, but isp4if_gpu_mem_free() currently logs
"invalid mem_info" at error level for every NULL entry. NULL entries are
expected during partial-allocation cleanup, so an early failure can
generate multiple misleading errors.

Please make the NULL case silent or call isp4if_gpu_mem_free() only for
allocated entries. With that fixed, the patch looks good to me.

>  	return -ENOMEM;
>  }
>  

