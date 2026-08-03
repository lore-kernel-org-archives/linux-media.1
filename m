Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011029.outbound.protection.outlook.com [52.101.52.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EE338422F;
	Mon,  3 Aug 2026 07:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785741756; cv=fail; b=EOO7TtkNj1B9jGmj9Cx5fdovB6F2EdCo8RdhM4f4FRB20d3HnvC2iml62cr8bIaHUeOzKHQu+hExIAqmJDCiEvTYpLCD8aE/EePKfnj2WR4RlUxQNChlI+PzLBB8fnQ11uofOZ6GOiopZa5tDXiTePEeOoxivjHst0Rqk0IjTOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785741756; c=relaxed/simple;
	bh=B3iWtWRZfnLEMzAfMrcc+LnQyLo9KSoEPfJ7X7cxLO0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TAHW9f7LdBUihvh2sJbMSpbK+FkUEqEO6ba9nbL85alI+UZTvjox+zGr3iDBJ25si292+xPaUC2KxHWyG9ykkbWCBGyErtXHYktZp5wQBL+ESrc5OshFnQIA9WidSexBrYflBJZqLrtiwK15gxrvK8qqRLOnw+m7DvDfi02xsR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kug54GYB; arc=fail smtp.client-ip=52.101.52.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kug54GYB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttpBl/xO9+nLbB946nanSm16MqIL+7LFBNI3UD6CnyutSFgrB5UXrriGW8TXWpCs/9p0sdIzj9oZISwJS7TVsLDQj57nseARTeTLBXBo7FjzKyPBP0M3cDXhXw7IGk8506Jdx6IMZQ2dvNSLst8QgCOFBgilQqC6MZiZtkuuWUHlIODB5FMZTQM470tL4aOZhT9cIwCbrIQsZo340Afvz0Wplaaf2roNmgeHdymWxZYWyeR4hCOC6uLV8VkH4qDlTBPf0D3P9U/zCBD1Gs8Z0YknGgt/k7F87Vig6mm/hO4h5eAzuvzKUjaDCHzxSfX0Apt84xiLzprTA7y7B+ReSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7omJitspzsWfftYxi7EGSeHkxuHobq+VpBMSes8dtr8=;
 b=MHeIcFwtHqppv1En993zDCtSILlyEklchlm+NIMcAG24rxLsWLi5FZoSnkCbJLAfhi+4frF3dW02QCEMPMpvk3wZIsIJ8VdIWWPg/10icJEZrZYTXklOKkachp9rzw3gt87gnyNcJE76qSfDuYmzRH5bcrq1erSj5KiIV852Nubgq1Nag/qfOG+BlhwCgp35UzNvq5ku6G31TSkLtK03M+SEXdkGz/qd5gaMgg7I2JrCjIMtkhXmFnMM7Kt02bKtOQe5FkHf/Nc9eZuT0fB4fPHH6LpLKpQlb5srSoXhTtukVvhTnn5D036WXu6DR1Hxa1h7MV61SwTQyeAzzYEiFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7omJitspzsWfftYxi7EGSeHkxuHobq+VpBMSes8dtr8=;
 b=kug54GYBMwtcTewkx6Fi52NDAzpDGdaFKzX7dsspJTlLQdQu97FdaLe2mHDRPj2NvrQ3flexWPy680bYNI0NKwCqb9D0vxYrljs2XllEyHvLVgFsYvDmmWd0qhcX0lR9VyN5sngYifcV183LrA2Qr2QoXxUSoFB9S2yroApYZwg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20)
 by IA0PR12MB8085.namprd12.prod.outlook.com (2603:10b6:208:400::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 07:22:30 +0000
Received: from DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589]) by DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589%6]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 07:22:29 +0000
Message-ID: <baf0db6f-0e68-4d35-a141-a9a3f5caef0d@amd.com>
Date: Mon, 3 Aug 2026 15:22:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] media: amd: isp4: release partial allocations in
 isp4if_alloc_fw_gpumem()
To: Yifei Gao <gyf161023@gmail.com>, Nirujogi Pratap
 <pratap.nirujogi@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
 "Li, King" <King.Li@amd.com>
References: <20260728190754.363464-1-gyf161023@gmail.com>
 <20260730141413.4136502-1-gyf161023@gmail.com>
 <20260730141413.4136502-2-gyf161023@gmail.com>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <20260730141413.4136502-2-gyf161023@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0005.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::8) To DS0PR12MB7747.namprd12.prod.outlook.com
 (2603:10b6:8:138::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7747:EE_|IA0PR12MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: c15a46c1-f174-4472-1503-08def12ffa0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Z48IwrBclmkTNPF3E0vbepT9sVM5w+bhEgG1qR5s02eSPFXt8eE69sytrttrwIjAl1FfQmTFveWRfwe9r6fBA0ILK3djeBN4c8/0ig9oIXT/yKijxRU4qK2eZM1qwlXnIO2hY8+e2iGMff7A/yJ0B4SoV/E+08ao4RYC8/d0+Pt1RhZlKAZ6palfG+4jL/YD8UibiArSmwEWFnx/ZAs4ls81VW0JLQvqzIjZHwhrPs7DW2xMTcsFh3cEKRntS5j3peoYIvmfC4IVuYgE6BFEuczjBN1dRRgOPBugQgwFCevWD2/jE3qg35dI5Lo07vGy9LNSJESgGZLsfuEXyoSUBQRTUDuj47H0xiaWbmDWBR8sC502DgnP//YfeZ/v2JprdlBvRem0K3o3NDFei9MLZI+KHNwOHOdlAA2tsrVIQlk3dyNAjhCW6N2UFMv78upgUGRxCbSEbiQrZBEk3jv3RqaebYzRJEw85K4kYA2Vr07ylX9BT7FldvEDIwWwq1LNJd3VnSOqyiV/ErFsMWPqgaeIV1iv3vWL8AV6Cy6tWLO2wLEl2kCug7vTjTbEv8SXUbTd/0zzDU4YQFz33AgK34kxLpIM4nIML5zA+uVt7g4wvr+8eQdS6z1Ri7Rv0y3zXDMubjwHfJPz1Vj1F1PXwDSHCHHWlDgUQklDlDAeKME=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7747.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUJGcTVjcE5rVUcyYjZ1NndpZmVRL0tkdGEvN1BkYTVJUG1PZGg5WWFHZFps?=
 =?utf-8?B?QzNRc1dxK2pVY3QwWk9GZnJqUnNXSmRPRy9aLzQyekF1UFRVWnpITGZvZUx3?=
 =?utf-8?B?V1JSVzhHVVhzYUNrWlN3Y05Yd0hvcDZRVzNJKzVMbytDMW5taDRDeE5CUDJG?=
 =?utf-8?B?VDFacmdpV0Q3M1pBempnRDFSNEdtMUZjZnQzNHM2amt2UmpGNktZNGJ3bVAr?=
 =?utf-8?B?QW9FRDJmVHoyMjlQYmd6dmc5RS9saHQrcjMrRWZVbVZCSURvNlJENGtPeG1C?=
 =?utf-8?B?dWhEMWNTZkZyMElqc2FrMzBVUHpJRE4veS81ejdGTHFic1ZpNU1xYXN6cHVD?=
 =?utf-8?B?aWVxY25aVFF5T3RsZm5vODJpZkVXQTEyVUJVMGR6dEU3bUpKN0Y1ZElETkxD?=
 =?utf-8?B?MU5ZbEZseXo2MDRUSEF2NzhaUDBnd3VYdHRUd0RPS2pTUFFQNm1mU1p6QUxz?=
 =?utf-8?B?TXUwVDZmZGd5emp0dEVBVStoRzk5MGRxLzJ0OWFNcnRTM3ZDUzFURktzOGtE?=
 =?utf-8?B?Y1k2TzdFOW91WkJSR2dZSGw1UFRHNG82RnNybXoydThieitRK21mMVh4UEdP?=
 =?utf-8?B?aUNRbjRjUDA4U1RVai9jY0xmK0lZMXdaSTEzNU1vNHUzeEg2K3U1QXY3Znho?=
 =?utf-8?B?blJROTY3Wlo2ZjBScCtXU0xEa2VMeXd2VjRnZ1RyZmNFcHJiVkZJRVloRWZC?=
 =?utf-8?B?NnZpSEgzczJaSzlKNTRXUndsVnlZMUlQd1Y0a3MyMDkvYTFEZ2FVeDAzaTho?=
 =?utf-8?B?c3owYmcwcEhLMEhKWC9IM0ZrNjNrbElXYXhWclRuMEJEdVJOUVpvcG9aeW8r?=
 =?utf-8?B?eXNLZnhZR3lORlZhb2dvQ0ozNk0ydnZ0Y2NYWkROMTVPVHF4bEtyVUJvb2VK?=
 =?utf-8?B?NjZCeCtidkw5cGNEd0FmQXBYUkNQSlplYjhkQ3R5TmFMRS81bk5VWEoydHk2?=
 =?utf-8?B?YU9XNnowMkZhbXgvSGxxZ0s4bXJpb2k4UW9Dek1oWEpiNTBHWWtBdXpKd0NU?=
 =?utf-8?B?aDhxVGI5dlBYSEFZV2NvMnlPSG9SVjluSWg1THlSMHFiS1dJUTlkNE0weng4?=
 =?utf-8?B?aEQweGFtbjdlU1FRSzJQZFVYRTlMWVZaRzRSVk45bzlpT0lsMGs1STF2aTUr?=
 =?utf-8?B?b1ZiWC92aHJWbXlzdGhYQ1JlUWF2NGpRd1lKdTh4dm1ONldIMC9vNTFwQWNG?=
 =?utf-8?B?dW1EeFRHOWFzcXl1QVBwLzdGM1FKWlAwZTROZEtrdUNTQ2FQM0wwc0RWSEtG?=
 =?utf-8?B?RVVvTEtkdzR0enc5WGo1UVpVK1BQOVNHZEh4NmZBbE9oTjZGdjlId3hBL3VY?=
 =?utf-8?B?dEttTEpXaytPdW83Z1YvMHg2WjhJYmhLdG85a0gyRWNRK2I0emMyVE9kWFpV?=
 =?utf-8?B?VVZGcGxycnVLMGVURDRHdHFCLzRSWlMwVnRFT2l5Q2dSektEMEExMmttUGpk?=
 =?utf-8?B?S2Q3VnJDVi92bmJoWE9CZ29SaGZtWkdFL2s3aHhEblUzSmdZeXFQdTRodFZM?=
 =?utf-8?B?VDU3QWxZMUtNUzhVTFMyNG5qTkd6dHNIem41V0ExcHBVYWx6MGhpWnpiRGNI?=
 =?utf-8?B?Nlhjd1orWUkrUGRsUVd4cllrdDFQZExtZ0xWZmh0VmlCSm1mclNxZUxCb0ZG?=
 =?utf-8?B?TW9TYXZYcUQyN3IxQUl6bDUrdTZIK1hiOHFwTU5kOHduNDdlMVpFNVlGa3c2?=
 =?utf-8?B?NjlIRWE5OTFqUWJKWWF2dUV3OGUwTnY4TU1BN3pnZjByYnFzVjlyM1cxYnF1?=
 =?utf-8?B?SjJ2U29jRi94S0IxMERaRVhrS2hVRk13L2UrQjU2YkdyRThhSGJHR05xdlBr?=
 =?utf-8?B?ZHQ4akEvZ0hYejJGNC9LcjcwczZLTmF0K0x3QnZaYkoybHppMGZvTEZHR041?=
 =?utf-8?B?MGNKNERkREFGMFZhL2MwdzkxTHFqRFFUN2xYRk8vVTRVZnJTcm56S0M3dmhx?=
 =?utf-8?B?Ymx2SFMzTnBNZ0FXeFV0NWZuRTNaYTUyV3JBWlJ5Qkd5S3lBTG5pUG5EaExx?=
 =?utf-8?B?eDcrblRBb3pudmJzbjhUTlFCUTZXeDZyT1JCaGN4Y3FadGdQUGJHaHdVMzM5?=
 =?utf-8?B?amFZOXAzZzEyRk9nZmlHSGg5YktheDFWTi9kWHFITDFpYjFVWi9oWk13cGdK?=
 =?utf-8?B?VVl2WFpiVkR3RTBwSEJkZGtZZHltMUw2dThaNnBraUx0MGJXaEVKMGs3Q1dQ?=
 =?utf-8?B?emE2SSthNEVrZ3llYXh4WjhibzdkYlgwcXF5djhHWHU0V1ZubGpKTkd6ZUpy?=
 =?utf-8?B?Mkc5akh3UnllNThGMkYvSVI3S2x6ek5rRU90THVZblZnTi9rR3Q0NWk2Q2No?=
 =?utf-8?Q?YAmtVV/XbJaCzKnmpB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15a46c1-f174-4472-1503-08def12ffa0a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7747.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 07:22:29.7091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpdUMe0QJYdvrSlmVZkDGHiNPIeixWY53HyaP7InYZE4B489XvoN5aMvVvq4Zdve
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8085



On 7/30/2026 10:14 PM, Yifei Gao wrote:
> isp4if_alloc_fw_gpumem() allocates several GPU memory pools in sequence.
> If one of them fails, it jumps to error_no_memory and returns -ENOMEM
> without releasing the pools that were already allocated, leaking them.
> 
> Release the already-allocated pools before returning. isp4if_gpu_mem_free()
> is a no-op on pools that were not allocated, so calling
> isp4if_dealloc_fw_gpumem() here safely frees exactly the pools that
> succeeded.
> 
> isp4if_gpu_mem_free() previously logged an error for a NULL entry, which
> is a normal case during partial-allocation cleanup, so make it silent.
> 
> Fixes: 4c5feef6a62c ("media: platform: amd: Add isp4 fw and hw interface")
> Signed-off-by: Yifei Gao <gyf161023@gmail.com>
> ---
>  drivers/media/platform/amd/isp4/isp4_interface.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
> index 8d73f66bb42c..4fefd0f7fbab 100644
> --- a/drivers/media/platform/amd/isp4/isp4_interface.c
> +++ b/drivers/media/platform/amd/isp4/isp4_interface.c
> @@ -148,12 +148,9 @@ static void isp4if_gpu_mem_free(struct isp4_interface *ispif,
>  				struct isp4if_gpu_mem_info **mem_info_ptr)
>  {
>  	struct isp4if_gpu_mem_info *mem_info = *mem_info_ptr;
> -	struct device *dev = ispif->dev;
>  
> -	if (!mem_info) {
> -		dev_err(dev, "invalid mem_info\n");
> +	if (!mem_info)
>  		return;
> -	}
>  
>  	*mem_info_ptr = NULL;
>  	isp_kernel_buffer_free(&mem_info->mem_handle, &mem_info->gpu_mc_addr,
> @@ -201,6 +198,7 @@ static int isp4if_alloc_fw_gpumem(struct isp4_interface *ispif)
>  
>  error_no_memory:
>  	dev_err(dev, "failed to allocate gpu memory\n");
> +	isp4if_dealloc_fw_gpumem(ispif);
>  	return -ENOMEM;
>  }
>  

Reviewed-by: Bin Du <bin.du@amd.com>

