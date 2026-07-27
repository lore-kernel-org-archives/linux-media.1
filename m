Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012063.outbound.protection.outlook.com [40.107.209.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0B3F9E8;
	Mon, 27 Jul 2026 03:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785123149; cv=fail; b=Gh3Lu6HbYyxWuNMbrpVOXIAmKSOb+P1sk/OurXgVWUAcWWJqrRjMvfUiHC/HesxD/YpPOAvT+GJRjW3C6vTLIZ8vSx4LtPGWZvpaWvjOeEq4Re8JiKknnvdbisNt8M/caSOq0gS4nAo1rzftOk4Q1sQdUBEYEH0vb0xbnFTbq3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785123149; c=relaxed/simple;
	bh=oa94Qs14MnQPtHxszCuuvL80jTOYL7dbC6o52iTQ5Cg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pSFC2gRoM5B4hI2qL1GiMb/rZ4GniY3n6UaUI2S1fM+dqnqi5YIjluzBIu7k1GDXZuW5RA43V56qWgn0pwke83yzPw0+dOdIhx5qcezAV/g6TyixqFYEqS+ArNt38Ca9qBvh1QUPJPpcdHF+Xt1XlabaXzbbzn/Qrlq4Zq+AmSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=48AB9lkm; arc=fail smtp.client-ip=40.107.209.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="48AB9lkm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9g23PV+nXyYb7E1ZnqQjE3yEDVWR6uhfCUNa2aE2Aupu6x63tmMBq003g2kR3cc9sUi6GvOMQLznoeSxOWQlRBzUa9XHLljlpmRqparrCn6wSxS/oJJOmyEo28ClAS7Mxby0fz3kX0S8Pyy2TcWczSDbwpV7w/yu8e9eJ3fFoUPQwkOH2K97UgUz+B0g2AVKZXQZJigJLBY7Ne15+Fb7bVA0rkt1w2HPQtyMNcRfUuq6Dm1T34ZLlRf6p/q3MrGkS9Ujsb7vxD5FOPlyIjAXKCDL2Cc0PVWp4IT/kYdQF+0VOHR32JdPyYI7CLCLkd8NiBZ6ZID+T4E3dNrn3DYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pa265mXuD930o6WfyGTl0PNP3K+K6CRjQoX6DcV8pWA=;
 b=v9UHHs2pIOugiFMbwWYoci5xaHHQuxvwrq3bdYVsbIadJQm+Ap8sXrdra8TW1+qCi9emmJVm9Ue9VXd0Nh77TF+5372bAjzIaHcu2Utawm1lIDo8OgnRxmNsCdywAoh5y1+up9rhI21OfVML2EzsVDTyuGcTqgUSYysMO+VrFpkWX4SfsantwN97Xr9P9dhtukIVIa7cg/SkndEOlrGW9+wZmbapbmaKGpW5Y0/7EWR9cSBPDMQ6r72IcCer4ION+98v/OCz4qMGdHrU8KJYZxekf5uAqATA+N3IXhk0V+jXhPoyDZoVuhBK4v0tVch3rHSJmctGmDSOVs28ewjVTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pa265mXuD930o6WfyGTl0PNP3K+K6CRjQoX6DcV8pWA=;
 b=48AB9lkm/mI1spwd3mqV0lQrIC3iDJetYPD0p2eR0AdtGZ9DTQbDNpS//xgoz8AGtBR078jOgjmk3HMxtRkdkrAOdRBqyyG83H5DkGbmRWQhf31u15f13xxeRpf3qjiHP22dVWPxzouatnQXVDBfnKnbPQv7gD8Bi2Nxps2gKHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20)
 by LV3PR12MB9266.namprd12.prod.outlook.com (2603:10b6:408:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 03:32:24 +0000
Received: from DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589]) by DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 03:32:24 +0000
Message-ID: <81936907-d5d2-4058-a056-bfdb5a9d5d87@amd.com>
Date: Mon, 27 Jul 2026 11:32:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: amd: isp4: fix self-deadlock in power-on error
 path
To: Yifei Gao <gyf161023@gmail.com>, Nirujogi Pratap
 <pratap.nirujogi@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
 "Li, King" <King.Li@amd.com>
References: <20260725203640.915626-1-gyf161023@gmail.com>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <20260725203640.915626-1-gyf161023@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0034.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::14) To DS0PR12MB7747.namprd12.prod.outlook.com
 (2603:10b6:8:138::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7747:EE_|LV3PR12MB9266:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5f56ec-f55c-484c-7d02-08deeb8fac8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ttHR+RLIrOVe8wZtrDGGHxp/5oayNzoaIHWC5+DNStS5epmRY/SSriOkuObCcdqm//BMDe4w1BZi5Q2r+oUQWphoKCpfy8MYVhKHvhhH7RqnrWN1rj7HcyCK8gizyYZLmhfsU3uVrHiBWwxS74J0aBX3KW4lFB599z4UEhXg3KH8RlDK/EHEqnYFWNhTArR7JPNd3vj0aUmxGzMhaL7HoVYMJwRSCbinHJxftNOVwMKePx5sZpYDcxxQjWtrmWiukE/6/tQrpJ6Chrb1nNo4cbtP474d/yV6fBCsZ15QfrGsJ24vpTU+RVkh847mds7ZCsxHGN80M7czT/ZAhpjWQ0sYjL72f+USs+5W7sXl3D3m9YX1KTlkCpbFBgXK3V5hyXUElddD4/7/48iDxc1BnNmkLymsNten3Vg0EckSOu6Tf8dFqzoJok3VjT2A2kGmF7uIO0bkvSq7Sl/m35XMuzU3W9xyOz3WV7yZpESIS1+wn+0MponTnUDqUlLsTA7xf14G1zLlhm40i9pp3gjJuaU9lM3eO+oZNF4j/kMQYWYQCGqkO5r9Jaq0QT//MdHBTy1Rz7cHeJqjnx/X4S2NSSLdBbZ0qVQQCVY1VJ679cntOVpN2ywBMJO35fEVKgZ3ioC2SNBT3mcu2Yni0HkGNPv3H0a/RXNwPodVqRa32MI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7747.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0FXN3ZaUHhEUnZXRTJjcDVvS3BjOTRuQStWdjFxdkdJaFNZUkdyalR5Z2Fv?=
 =?utf-8?B?TThLeTRhSjlaaWdLQ1dCQUh3QmprRUV1YzZoRmxCUWJNdlo3c0NLY2VBU2ZX?=
 =?utf-8?B?UzZnZGF5RGJBR2E3Z3IzTk5CYWloS0Y3VmVjNEVpbGZoNkdsWHVwRGdId285?=
 =?utf-8?B?eWtXODcyTm1UT21OM2tZeUlpTC9NL3hRVEJ2dUEweFJuNThIZzNoRGFMS25o?=
 =?utf-8?B?UnVGYVJhQlNvd29ockNGK0hXRUJXdmpXSTdCSDJCSUVDMkMyNTRYT1h6dUJa?=
 =?utf-8?B?ZVFIVEFxbmRxbW1kbHV5N0RoSTZEVXFEZ3E1bm4yOFo1My9sR1E4YUc3dlBB?=
 =?utf-8?B?d1lQSnZLM1VVRHBmMjNOZDU0MXIxRkVSd1pmbFA4KzRqeTQxS0RSR290YTk0?=
 =?utf-8?B?ejdjSElGVWRtTkJPMVZHU2lWTVhDTDJENGVJdlg1eDFrM3F1MmVkNVVGTXRY?=
 =?utf-8?B?MmlGMDVsaUxNQTRWTStLT2M1WEZaNmE2bjMrRWZnWjRiYVZSeFQydHA3YnMw?=
 =?utf-8?B?Rmdsb3pZQzMxNWduMTJFVTNTSzJHQlhpdTlDa01SdDlCWmxvQXI2NzIrQjVJ?=
 =?utf-8?B?eXpYRlBZRUZla2FqbDR4Q1RGNjBUQzY4RDdjRmE5QXoyTytTc1F4VmxGdS9F?=
 =?utf-8?B?c0MyanNmTnI2K0hKWnlsUDZyRHplVVZjb1ZBR01xRW1QRGJxVFkxbm5QSE8x?=
 =?utf-8?B?YTJIZzNxS01ZTExNUGEzSTg2YTh1MFY2UnZDbi9NUW94VnNCWXlrWmJYWmpw?=
 =?utf-8?B?K0dZaHJwSmpLbk9obElSTm8vWVhwV0JDTlMyNnpvc280dnBhcGRaRitNWUxk?=
 =?utf-8?B?VU9aRkxSOWJNNVVBRTBYaW4xR1pNSkJkUi85U0MwT21aekFaa1NJSzJ1dDl1?=
 =?utf-8?B?UWRkTW9XY2N4NjQ3dGl3M282NEd4bmVjVjBzbStrNHpGdWlZa1dGQkF4Vy8y?=
 =?utf-8?B?ejQwbmFaSWNkRCtTYjVNTVdFc3I4NEFwa3FURFducXFNMTdvaWl4MDlRTEZo?=
 =?utf-8?B?WFM1R05aeU9VZklVbXdxc21qTEZSVk1CNWJjQWdmcE93UEcwWUNsTDUxeDRP?=
 =?utf-8?B?UW5nQXJsQW5xRkVZSytSMjhmTXZBUGhXUXpVVVFUWldFSnhsNXUvTVQ0N1RI?=
 =?utf-8?B?OGtMdzlLYTkzU096Z2FDL25JYmFRd1VrZlpIdnlWMjJGUWQ0RTVUYXp6anlk?=
 =?utf-8?B?WWFCaUhHbysxV21idmpyRzJ0SnJMd3ZYL0ptcVVob1JLZEN0MmJqU01xYy9D?=
 =?utf-8?B?RTE0ZWp4UkhuZUdBQUZieEZpZEN0d21NR2xXd3BOaWdBVldIQ0NSZWJmWW9Q?=
 =?utf-8?B?OCtFWnpPNGhaNytKcXpZOUZyKzQyeVdBbFJiVVRHWmZpU25iT2JvSks1SjNz?=
 =?utf-8?B?UUxUNzBoOVZoT2orOE56Vm42TXpIZlRJU29QbXRIZlZVOHBQTjNrcVhuRkky?=
 =?utf-8?B?MUVCUVFKNDJCK0o2ajlEZE53VENmZlRyQU9QVjd4WThVd0NHa3ZTMm9HeGV6?=
 =?utf-8?B?MHRTY0NWN0I2UFFxRGFtZE9FNlVTOTE1UGt2WHZPcmhtZTMyYjBwcDltWVQz?=
 =?utf-8?B?akZVSXNEUHhwQmlQMDkvdEZNZUEzcVQ3Z2dxenkyQ1cwbzRrYWxvNnRiUGdO?=
 =?utf-8?B?eUtDeUxhY3RtZHp4Vml3MDlqdkRXSWRSSElBb2krVW91LzI5VVk0MkFudHo3?=
 =?utf-8?B?d1ZZNExwOWJra1pra1U2SzVNMzhOTWFmZk9WZ0k5ZWVsYkxXM2ZiODJPNkY0?=
 =?utf-8?B?QmNLZ2VTY0dqeFBjZ3l0RG4zQ2JCOVdLclRaT1lSa1RSMlFCYkxGSitPTjB3?=
 =?utf-8?B?a1hkMlBnQ1B3UUhQY3FlS21UODlPaXcyMHR1NEVSZENGdUpja3p4Q0o4OW5N?=
 =?utf-8?B?V2Y1WXFHbEJxTFptT0p1NGxmd2NIS0pZYTdyYm43VmZsYjBIZ00xMTl4Yk9u?=
 =?utf-8?B?L0YzM1ZNZ3NKcjdyS0xpeDB6MEx6cklMVy91cTBuV3lRK0IxWERVK1Y4WTZk?=
 =?utf-8?B?VmI5b2NvQkFJeEYxQ21YZVNEWURxVzJTbmJLWWtTRWozclVUSGl1QWJuVG9N?=
 =?utf-8?B?UmYyRS85TVUzbTJ5Q2xuSjQvOUs3YUpJRFpCUmtGdThQZUNMZW5XdzBPaXdY?=
 =?utf-8?B?dFlyU3BYdTBHOFl4S0ZDd0VmMDZFUWFhUEtPVXpqaytWZVpvU0M5U0RIS1Fy?=
 =?utf-8?B?S29KVk42UTlHejFQckN4UnV0RGpHSkdHRVM4MGVhcm1ZN3dLT2xMVk4rNHJi?=
 =?utf-8?B?RVVBbnU5UnhoYjFnK3o5aU1FSXBSSzZTQjY0WGwvbGM2OElKNU5xajZRSzhm?=
 =?utf-8?Q?cvEw4zBAeNbgZxmtWu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5f56ec-f55c-484c-7d02-08deeb8fac8b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7747.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 03:32:24.3872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LzkPMSjaait3CaPPwggaxQsKm6zfO2F5BSmiwZZNJUy6/2PVIgLH3at9EDSVT/1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9266

Many thanks, Yifei, for catching the deadlock in the failure path.

On 7/26/2026 4:36 AM, Yifei Gao wrote:
> [You don't often get email from gyf161023@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> isp4sd_pwron_and_init() holds ops_mutex via guard(mutex) for the entire
> function. On any initialization failure it jumps to the err_deinit label
> and calls isp4sd_pwroff_and_deinit(), which acquires the same ops_mutex
> through its own guard(mutex). Since the guard in isp4sd_pwron_and_init()
> still holds the lock at err_deinit, this re-acquires a non-recursive
> mutex already held by the current thread and deadlocks.
> 
> Every failure path in isp4sd_pwron_and_init() reaches this: a failed
> pm_runtime_resume_and_get(), a failed dev_pm_genpd_set_performance_state(),
> a firmware start failure in isp4if_start(), or a response-thread creation
> failure.
> 
> Move the cleanup logic into a new lockless __isp4sd_pwroff_and_deinit()
> and have isp4sd_pwroff_and_deinit() call it under the lock. The
> err_deinit path, which already holds ops_mutex, now calls the lockless
> helper directly.
> 
> The "stream still running" check remains in the locked wrapper: it guards
> external close requests, and the power-on rollback path never reaches the
> STARTED state. The cleanup steps are safe on a partially initialized
> device: response-thread stop is guarded per-thread, and gpu memory pools
> are released through isp4if_gpu_mem_free(), which is a no-op on
> unallocated pools.
> 
> Fixes: 4e5e7a7ddb4a ("media: platform: amd: isp4 subdev and firmware loading handling added")
> Assisted-by: Claude:claude-opus-4-8 smatch
> Signed-off-by: Yifei Gao <gyf161023@gmail.com>
> ---
>  drivers/media/platform/amd/isp4/isp4_subdev.c | 31 ++++++++++---------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> index 48deea79ce6c..eabb6b36705f 100644
> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> @@ -607,7 +607,8 @@ static int isp4sd_start_resp_proc_threads(struct isp4_subdev *isp_subdev)
>         return 0;
>  }
> 
> -int isp4sd_pwroff_and_deinit(struct v4l2_subdev *sd)
> +/* Caller must hold isp_subdev->ops_mutex. */
> +static void __isp4sd_pwroff_and_deinit(struct v4l2_subdev *sd)
>  {
>         struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
>         struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> @@ -616,31 +617,20 @@ int isp4sd_pwroff_and_deinit(struct v4l2_subdev *sd)
>         struct device *dev = isp_subdev->dev;
>         int ret;
> 
> -       guard(mutex)(&isp_subdev->ops_mutex);
> -       if (sensor_info->status == ISP4SD_START_STATUS_STARTED) {
> -               dev_err(dev, "fail for stream still running\n");
> -               return -EINVAL;
> -       }
> -
>         sensor_info->status = ISP4SD_START_STATUS_OFF;
> -
>         if (isp_subdev->irq_enabled) {
>                 for (unsigned int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>                         disable_irq(isp_subdev->irq[i]);
>                 isp_subdev->irq_enabled = false;
>         }
> -
>         isp4sd_stop_resp_proc_threads(isp_subdev);
>         dev_dbg(dev, "isp_subdev stop resp proc threads suc\n");
> -
>         isp4if_stop(ispif);
> -
>         ret = dev_pm_genpd_set_performance_state(dev, perf_state);
>         if (ret)
>                 dev_err(dev,
>                         "fail to set isp_subdev performance state %u,ret %d\n",
>                         perf_state, ret);
> -
>         /* hold ccpu reset */
>         isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0);
>         isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
> @@ -649,11 +639,9 @@ int isp4sd_pwroff_and_deinit(struct v4l2_subdev *sd)
>                 dev_err(dev, "power off isp_subdev fail %d\n", ret);
>         else
>                 dev_dbg(dev, "power off isp_subdev suc\n");
> -
>         ispif->status = ISP4IF_STATUS_PWR_OFF;
>         isp4if_clear_cmdq(ispif);
>         isp4sd_module_enable(isp_subdev, false);
> -
>         /*
>          * When opening the camera, isp4sd_module_enable(isp_subdev, true) is
>          * called. Hardware requires at least a 20ms delay between disabling
> @@ -661,7 +649,20 @@ int isp4sd_pwroff_and_deinit(struct v4l2_subdev *sd)
>          * during quick reopen scenarios.
>          */
>         msleep(20);
> +}
> 
> +int isp4sd_pwroff_and_deinit(struct v4l2_subdev *sd)
> +{
> +       struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
> +       struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> +       struct device *dev = isp_subdev->dev;
> +
> +       guard(mutex)(&isp_subdev->ops_mutex);
> +       if (sensor_info->status == ISP4SD_START_STATUS_STARTED) {
> +               dev_err(dev, "fail for stream still running\n");
> +               return -EINVAL;
> +       }
> +       __isp4sd_pwroff_and_deinit(sd);
>         return 0;
>  }
> 
> @@ -725,7 +726,7 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
> 
>         return 0;
>  err_deinit:
> -       isp4sd_pwroff_and_deinit(sd);
> +       __isp4sd_pwroff_and_deinit(sd);

However, if pm_runtime_resume_and_get() fails, the patch calls
__isp4sd_pwroff_and_deinit(), which unconditionally accesses ISP MMIO
while the hardware may be powered off and calls pm_runtime_put_sync()
without a corresponding acquired runtime-PM reference. Therefore, the
error paths need staged cleanup.

>         return -EINVAL;
>  }
> 
> --
> 2.43.0
> 

