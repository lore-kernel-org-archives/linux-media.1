Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010022.outbound.protection.outlook.com [52.101.193.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3673ACF17;
	Tue, 28 Jul 2026 10:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233843; cv=fail; b=aBjhqTXB0H3CpB7kQJJd6kEKMSg5v3AmCfPEW/8xqyXcUx11rxY7EyN3GI+n5z/OivBEUzq3sxRhgXdUhGcyQrelIkOhvU26VH8rhm2/8325bWNr27bxhEhHlInejNbNHA8rC/17MRsRWRJrYq+QyGn6B0JylWdfiNQZRJyKRqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233843; c=relaxed/simple;
	bh=i5RVWAeARkvamWWZ6JC3vH6fTIX9P1RBMX/MlDWma6Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EWNvj+snowsQlR9iha7XABxBWn8wT5GPrgc7OMYRv8L57pph2at4qbvh7OLIIJaJcFplEFPjCQ1q/WsZ1v2Qy+6eS2srsEsapRx+gs3nzTQHdnR/QveazUVrpj4SpdCBXUGd0bU6BwByQS8Jg6s111d2ITbB2ceZQH6FamE4gmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BiReZliz; arc=fail smtp.client-ip=52.101.193.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BiReZliz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOm81IFqyFzlXmshxtXtnjZ8flZJ2+obUcv0rBCMLiN/Ikl9RXWCDLlDJVsCgi8mRrCTsXX23+mp5cgp4vaXE2nNH5EJzDiEjN7I5ctchv/bmMpUYdhWAxeNhHjZcbIUHcWyweEb2JvcY0hlnMXDmcqAphtlG87A1bJxvt+l4MpSgg2BU0PcjqFgea5PbYWLls0W9/+hOeeYn7mjw0xcczzoNVG2MFWCGWtl5A5UXAU7qdyZTphWwNCEoTOJFzrX7e0ZpADefD03R5Oe/EDWDy0mbWx9aFT84N8gT+9MZj7/+4KzYhiQol4j+jHHllBpzYCJhPJIy74NUu8b5NKtjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1kezuyv6CxxrbVtvEJ7NTZqMMlifVZwBoLf9O8xgIc=;
 b=SwT9XJ9IOxxOqbKN8jrEzQRimOntwwxZgwg2xL+h0PAw0gIih+g9w91SneSLgwCxHqgVNVpCjtnwM0mTwSEhbSJaM3UfT3ReW44saPU0wI57hRkAsi25JRBEbBvwdCc3o2QCiboqAM8dNk/eOkNgZUv/hyzDzT7gj5MHD5zNiFFTwnNump1kg7Y55JfxX/GcIEaHwKLVR4UH7FQFH+6YWpFuJigB2xOHiW46LOOh9FCFAl0MBspXmIWz1NHvVwE6h6f9ZRRBoX+7OtCsQRzUPWzRe+eIQpgdJ+QHJOVFpwjHXEdr8ymgF6Ct1Q5kNvK5P36d4rFfYUVDhyCynbuFlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1kezuyv6CxxrbVtvEJ7NTZqMMlifVZwBoLf9O8xgIc=;
 b=BiReZliz6HP5s7CtMdrjnkor3TB2K+GLVJvGFf7Nrq3X2iVHmtCY75TOt19FlcW9SfrueaOmywjNDHnUHQWBg3RyomINKUM7MvO2GAnfIFJu8HggwNjCK1P0MdVRDS93Sjd1ztXeYpwIyrU4lVANx/a+mCB6QtvJet1Q3jLdJUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 10:17:19 +0000
Received: from DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589]) by DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 10:17:19 +0000
Message-ID: <33e2af62-7585-44d8-9eb7-b7326d1d3987@amd.com>
Date: Tue, 28 Jul 2026 18:17:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: amd: isp4: fix self-deadlock in
 isp4sd_pwron_and_init() error path
To: Yifei Gao <gyf161023@gmail.com>, Nirujogi Pratap
 <pratap.nirujogi@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
 "Li, King" <King.Li@amd.com>
References: <20260725203640.915626-1-gyf161023@gmail.com>
 <20260727183500.298036-1-gyf161023@gmail.com>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <20260727183500.298036-1-gyf161023@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI3PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::19) To DS0PR12MB7747.namprd12.prod.outlook.com
 (2603:10b6:8:138::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7747:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: e858638d-5d0d-4132-7f09-08deec9167cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PaAQB8D3teejRiNS8YL8O6fpk1HvKotg1+oTgjwfZtzPsrwXjp7eWkEnIRKSTKzCGT7/PiRiZRtInwNmVgdJVyrU2yXntB2PtglL8ChmLTq60IXrelImYasMVi5QR2/uJ4oaDtZorzQ4HuEKUaiqjkIOdbYJUdJl108Vz0hpKhRbgWsfSAqGIia0Kw+R4vyI4/F5zdyNM9S5IgwdKjg+ZWd6xyNCHVx2MF+TvSilGt4rGk/CwPH0h09CIX245+wkx22LZpESIgjJ3WIVu0aJdYHZlDAeWLaaDgdfh5hmgpV8xZJCLpHSWMEyabIs9j+nkx3w30cSmUPJDt4M7NgbKaI46n66sj7iTVH9Xfio37eg+994vH/OXPcSvaiEiLRbf0pbpcOXgbVVI9sRQ2xh+2LZmrFUaB1GUKH8N5k/D+gNKp3dFChtL23bPN5ymuOB1MdV6BxnK6IVjJEVnl+77EmPzZ0C29RjHkj8PM4WvaYW/zj8Bd86e7wCYs6jhpyM/YlRPIet4XSAf7w6v5rDRAfRvQbaNJ07u7ACoqV/KyqavCyUyvS3qAntX4tq694vLad4C+eyo4nBzPcp76jS4WPwGzCMamv3VHKLdIg9wQIPJ/Lw/ikY7O90L+8mylJ3SLZNRYkctHEuRKRPb+Ir7nhVkLhuuqpcv1Yohg+NRfM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7747.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3pCOHZlektpb2VqaGtjZlVaVHhLeGt1anRoWm1XbTZZM0dDTUhSaTRmNFM2?=
 =?utf-8?B?aEpwYThtTVNtSWlROXlWajdiRUVBTnRVQmcvSmZxTmRVdTR3aXo1bWoreFhX?=
 =?utf-8?B?eXFTZWhNK3czY2dubVFlMXh1YjVlQmNreTZxaE9zMks1blN1bkNuMkZaSVQz?=
 =?utf-8?B?K2hLY2RYdFplSUd1Nkp1YVhJekE2cy9DUlVZSkIxdGtuNzdiZFhwQVFQOCti?=
 =?utf-8?B?NjBDZERYRGI2dWVLVjVNWnViVk0rZVlrWlhqL0tyWFJ0d0hCWGM1RHdsQ2xR?=
 =?utf-8?B?U1F3ejJSUmt0UHkrdytwSEFDZkN2bEk5bitZV1EvVzJRVExrV3ZQVHNXNW02?=
 =?utf-8?B?V1dNVmNrNEU4TVlWVHpKb3p5Nk1uZS8yb0pVWmxJNjhpTDNVZVhYQ0lwc01z?=
 =?utf-8?B?dXVTNTZRVFhRcEgzY1RabTE2RmNnU3U4VUJFRGJlNURWNXhHTXQxOFYwNnFT?=
 =?utf-8?B?eFd5bmZQSVpVUiszNVIwVVRFRllSUTBseHhNNDBTQThKVHhDeVlTZW82YWNa?=
 =?utf-8?B?NFd1ZEYvVGpNdFZMbWpYUVZKVGxsTzRuRWY5aktZYTB3Vlg1YUZ5Zk05aGh1?=
 =?utf-8?B?Ui9wa2JoTXBYTWxLd2pVNzk5RnVmbHNhMHhDRVFqY2xJSU85NGFXRllmdDVR?=
 =?utf-8?B?YmFzUWpnYlMrbm8xa3FRM1RyS1d0ODBWdmtaeklBZzFsbWhkcURWZVFob3Ev?=
 =?utf-8?B?WkhVY2E1VTZDQWtJcnZBMzB3VS9ZNFNkRDdISnJ0WERFVUZVL2grRStYSEZv?=
 =?utf-8?B?aG5mMCtRYWs2QTZMQkRaWjdMb1BQc3lMMWNza0ZMSGw4U1VIU1NqOStRZi9B?=
 =?utf-8?B?aE9BRDlBV0NnQmdMMTFGZDhScXZMeFNzQ21kcXhnLzZETkNOaTVTNnFuQXE4?=
 =?utf-8?B?RHJLRG8ydjJ1MHJqTVZsakdKRVZHbVNXS283MWtNWE4xNjZ5OWhWd3ppS0lM?=
 =?utf-8?B?Y3ZWTW00Wi9XaE9JNnZ5VFJsVXgxbHcxcjlYaUxlRFY5K25admNrK3JDZjIw?=
 =?utf-8?B?Z3lWN1ZkU2ZuTVg3QTM5bjgyWHFpRWVKY3ZTVSt0RU1lZTdhN3o1MGhWc0pR?=
 =?utf-8?B?cXdlSkpPQ1VuL01BVytQMUFHU1YwNFljUW5mVkR3OHU1SytrWjgxOE1hZzJG?=
 =?utf-8?B?SGxPd09ZNldQWktRUDhTZ2JqWjR1eDNOdEJZd3RRL01wZTNZM0tHN2RmT3c4?=
 =?utf-8?B?b2laREMxRm4vS1RCRVJZay9Od2J3a2VRUkZML3RTSXVTZ0o4MXJkQUtteCtm?=
 =?utf-8?B?cmRFU0JFVzVFWU50Qm5QbU5PaEZ6UDc1bDFaaU1mZEkxdEhwdGU3Nm5LeXR1?=
 =?utf-8?B?NHRucEt2ZzdDVGgwTTR3UFpiN0lwNGFBekFEbTEvNWQxZHdxSktzd2JRMEQz?=
 =?utf-8?B?eUlmSUNJRmlOZTB4VW0rVjN5cHpXOTY1YlJmS09WQjNVemRPYjg4TmRPY01o?=
 =?utf-8?B?Uy9hNnhaSlBoVDRhK0dwTlJrU1dDTTJCWlBzOUJwVWR2eU4xN3QvaWUwaVRt?=
 =?utf-8?B?cUdTa3hla2l4TG1DcmEyZ0hiNVJ2NExZa2V4Q3Y5V3hUZlZLdUhSRGJBZ1VV?=
 =?utf-8?B?cUlmTFd0M0F3S3FJSDJoQ2RkVkJGMDRkaitCK3c0amN0bnoyZm9veTBnb09y?=
 =?utf-8?B?S3NrcVY0Q2hldVBsU3BNNjdnalJ4RE5vWjRtTGUvclloZGowWTNBbjM2UWRx?=
 =?utf-8?B?cWFIeElDQ0kzUFowazdvODlYWit6N3dyMVNRUzMwNyt0dXlobGFVN1NVeVhq?=
 =?utf-8?B?c0NEQi9hVE13RkZ0NzZMejE0M0hyUW45MTB3enlwRm1pM1loWFRYd2ZyaWpx?=
 =?utf-8?B?NTZQaUtwekRNbEFhN3orUTMwQnZVWXU5cG1oQkxBTzFqc1JQc3c0R0pIUFM2?=
 =?utf-8?B?THRzZFgxSzVkNkUrZGQxeXpzckhQekNGUjNlbTdNb3hjL1JHTmhoL2JFMk53?=
 =?utf-8?B?WDhHeHdiNnJlWEd5TUtBUHJ5YTlOM29EdXZjZk1UR2IrR0dENFU0WjRsdEV4?=
 =?utf-8?B?d3hRMVlSckJ5WktBVUkzWXUxUThFNzh4aGpYWTJJMi9kck0vR0hOa0xldTZC?=
 =?utf-8?B?aWs5di9TclNnV0l6L2FsL29QTnpHUXc5enJoWjRzMWRlZ21LUUpqTHZxa0ZU?=
 =?utf-8?B?aFVlRllpRm8yZUlzY0xMRnFQMmZISTFEOC8rMGRBbzc0aUJqSE1kL0VjOEUr?=
 =?utf-8?B?UU1meGg5MXFmY0J1d1oxOVJURVVwNTR6UkY1ZlBKNzV6cTR0b1FEN3RsV2ha?=
 =?utf-8?B?TUk3MjRpSzRkZEZjbjBlNEQwVElmbjZHVnhBMmdVenM5ZmVueDZkYVppVUM5?=
 =?utf-8?Q?oj8ZW2soaVIi+EP1tx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e858638d-5d0d-4132-7f09-08deec9167cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7747.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 10:17:19.2538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d18qwlvsJ095qDjUHl1PNOe4EA/d6uFNGpBra6ECUCQDY+57qWrg720iFc1zwNqR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754

Thanks, Yifei. v2 addresses the runtime-PM imbalance and unpowered MMIO
access from v1.

On 7/28/2026 2:34 AM, Yifei Gao wrote:
> isp4sd_pwron_and_init() holds ops_mutex through guard(mutex) for the
> whole function. On any initialization failure it jumps to the err_deinit
> label and calls isp4sd_pwroff_and_deinit(), which takes the same
> ops_mutex through its own guard(mutex). Because the guard in
> isp4sd_pwron_and_init() still holds the lock at err_deinit, the call
> re-acquires a non-recursive mutex held by the same thread and deadlocks
> on any initialization failure.
> 
> The error path cannot simply drop the lock and keep calling the full
> teardown, because that teardown is not valid at the earlier failure
> points. In particular, pm_runtime_resume_and_get() drops the usage
> counter again on failure (via pm_runtime_put_noidle()), so no PM
> reference is held when it returns an error; calling pm_runtime_put_sync()
> unconditionally would underflow the usage count, and the teardown would
> also touch ISP MMIO while the device is not powered. This was previously
> masked by the deadlock, since the thread never reached the teardown body.
> 
> Replace the single teardown call with staged labels that unwind only the
> resources actually acquired at each failure point. The error path no
> longer calls the locked isp4sd_pwroff_and_deinit(), which removes the
> deadlock, and each failure now skips the steps it never reached, keeping
> the runtime-PM count balanced and not accessing MMIO while unpowered.
> isp4if_start() and isp4sd_start_resp_proc_threads() already clean up
> after themselves on failure, so their resources are not unwound again.
> 
> Fixes: 4e5e7a7ddb4a ("media: platform: amd: isp4 subdev and firmware loading handling added")
> Assisted-by: Claude:claude-opus-4-8 smatch
> Signed-off-by: Yifei Gao <gyf161023@gmail.com>
> ---
> v2:
> - Reworked the fix from splitting the lock into staged error-path
>   cleanup, so that each failure unwinds only the resources it acquired.
>   This addresses the runtime-PM imbalance and the MMIO-while-unpowered
>   access that Bin Du pointed out on v1, while still removing the
>   self-deadlock (the error path no longer calls the locked
>   isp4sd_pwroff_and_deinit()).
> 
> Link to v1: https://lore.kernel.org/all/20260725203640.915626-1-gyf161023@gmail.com/
> 
>  drivers/media/platform/amd/isp4/isp4_subdev.c | 28 +++++++++++++++----
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> index 48deea79ce6c..868d1c74d35e 100644
> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> @@ -687,7 +687,7 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
>                 if (ret) {
>                         dev_err(dev, "fail to power on isp_subdev ret %d\n",
>                                 ret);
> -                       goto err_deinit;
> +                       goto err_module_disable;
>                 }
> 
>                 /* ISPPG ISP Power Status */
> @@ -697,7 +697,7 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
>                         dev_err(dev,
>                                 "fail to set performance state %u, ret %d\n",
>                                 perf_state, ret);
> -                       goto err_deinit;
> +                       goto err_power_off;
>                 }
> 
>                 ispif->status = ISP4IF_STATUS_PWR_ON;
> @@ -709,12 +709,12 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
>         ret = isp4if_start(ispif);
>         if (ret) {
>                 dev_err(dev, "fail to start isp_subdev interface\n");
> -               goto err_deinit;
> +               goto err_perf_restore;

One issue remains: isp4if_start() cleans up after an isp4if_fw_boot()
failure, but not after an isp4if_alloc_fw_gpumem() failure. If
allocation fails after some buffers have already been allocated,
error_no_memory returns -ENOMEM without releasing them. Since this new
error path skips isp4if_stop(), those allocations leak. Could
error_no_memory call isp4if_dealloc_fw_gpumem() before returning?

>         }
> 
>         if (isp4sd_start_resp_proc_threads(isp_subdev)) {
>                 dev_err(dev, "isp_start_resp_proc_threads fail\n");
> -               goto err_deinit;
> +               goto err_stop_interface;
>         }
> 
>         dev_dbg(dev, "create resp threads ok\n");
> @@ -724,8 +724,24 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
>         isp_subdev->irq_enabled = true;
> 
>         return 0;
> -err_deinit:
> -       isp4sd_pwroff_and_deinit(sd);
> +
> +err_stop_interface:
> +       isp4if_stop(ispif);
> +err_perf_restore:
> +       ret = dev_pm_genpd_set_performance_state(dev, ISP4SD_PERFORMANCE_STATE_LOW);
> +       if (ret)
> +               dev_err(dev, "fail to set performance state %u, ret %d\n",
> +                       ISP4SD_PERFORMANCE_STATE_LOW, ret);
> +err_power_off:
> +       isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0);
> +       isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
> +       ret = pm_runtime_put_sync(dev);
> +       if (ret)
> +               dev_err(dev, "power off isp_subdev fail %d\n", ret);
> +       ispif->status = ISP4IF_STATUS_PWR_OFF;
> +err_module_disable:
> +       isp4sd_module_enable(isp_subdev, false);
> +       msleep(20);
>         return -EINVAL;
>  }
> 
> --
> 2.43.0
> 

