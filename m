Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010033.outbound.protection.outlook.com [52.101.56.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26753352036;
	Mon,  3 Aug 2026 07:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785741784; cv=fail; b=hWjfkVu67/9ciqTj0NXt4aXO9NdokyDc9NqP8RvV1waaF+BqLh3UOrNSiMd8hTRKk/7bRnN69ADfek575r3owub5Afxna3xi1dWnGlJHCHtvPy45ynT+kTtfQgbpvxhSNL1aRrYPW9bWkPr/OittsQ3Z4uoMUIpGlgdNpKpPk/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785741784; c=relaxed/simple;
	bh=c/5M+pUynzYrunXpRctS0xgJhuopxRxs3eIVp7vtGmI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gyZkkN0L8/nL4Ssg3gOvmPebNg6ZZL6doNT2hjnrjg+dseYY90qX7vtFHsBXNHH3yKxffNCagiCtXbJupdYa+q15I7pYMTxArYsRKwI9v0NdMFksq/AG3sPhdDoBfC1x1gLoBjPF7sspYGi0+BDH1Jn3zP1OinyAchEdfHHbXu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jIk5up9q; arc=fail smtp.client-ip=52.101.56.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jIk5up9q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RoGddA7nX7YLQeEsLXeJGMfu0/oQTdBcsfvutqrk2FgaWRCjhXqCdNJ6E4wLXKhujpJEqo+I4vuPxjbcK1o6T9vApeEYFpd9JmiDru7XkxD46yhS8PtkHBqqucdZF3oH0M35+gBtBja7gTo0A403C+pPZel95XNVxq6ZAoXIZwyuUqbuKrV6+j1JCHoO/mcNUCxwMv8NZXq+pfgICbUqK93Q0MKq5Rs/wQ9atCdMBqnSv0+uEdhlSUGGPjGZw1lMDvGpc0rS7hXdHOGn4+X5bbMhSgdp7oj3vNGMJkev5i5M9lHI3Oq0KuhOFeu0YT4zv9zRZqu0rpFLrQrOWcE8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eW8XgeLMPNkdwNwjGd4XbbsrWE5+wdftOnHnIlutT4=;
 b=TgoWo7lO1XaRpAE36rpLre+zynl6w8btHmSooFLqozBrNPYc1PQg99JFdB4K5Bgd0zsbcdB1BGb49wW9IcuKb3vRUPTInqECFJW+393ue/TvdUSO+eMMBwZtHEWK5fTZt4xFShadWWYN9DW4Qk4ysGkeZC5TekqP/EJIORXjmz17VwIHGz8ExOWUaKCwdGfd+0zRd44kLrugONJzIbw0j/mHKFwT2TrXS0GByassVNu4GCT/HyDSfNmWEiuMgDPCTqa/DFyWqpQ6qldyGvJ+0BR/NHXWbcQVSaBbvs4sRiFhoI/tztAgClygrE/zZmLCnILktbjtAuwbFiWmeC4atQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eW8XgeLMPNkdwNwjGd4XbbsrWE5+wdftOnHnIlutT4=;
 b=jIk5up9qI85SuGlDISmbf2ge2tzD0o2eP4p2VpJEKX3H/Hesi6LMfnE0DK1je/wRCL3BWksTaTY9EvTNYN5Ot4HiMnYXyLVbpE9221U4nNd+SooJ+kA5s32dlDP+tWKSlNgCI9WbTZULvOC6N8R4EL9YuSZveVhTGganPpoqqqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20)
 by IA0PR12MB8085.namprd12.prod.outlook.com (2603:10b6:208:400::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 07:23:00 +0000
Received: from DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589]) by DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589%6]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 07:23:00 +0000
Message-ID: <dd8eeff2-bb9a-4985-b6d8-f56a46a07a50@amd.com>
Date: Mon, 3 Aug 2026 15:22:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] media: amd: isp4: fix self-deadlock in
 isp4sd_pwron_and_init() error path
To: Yifei Gao <gyf161023@gmail.com>, Nirujogi Pratap
 <pratap.nirujogi@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
 "Li, King" <King.Li@amd.com>
References: <20260728190754.363464-1-gyf161023@gmail.com>
 <20260730141413.4136502-1-gyf161023@gmail.com>
 <20260730141413.4136502-3-gyf161023@gmail.com>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <20260730141413.4136502-3-gyf161023@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0010.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::18) To DS0PR12MB7747.namprd12.prod.outlook.com
 (2603:10b6:8:138::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7747:EE_|IA0PR12MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fea53b0-0199-4590-207d-08def1300c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pOUeET7N3V6cvrpmYYTZg+r8Rh20U6Pf1L9VZiuCQgp9ODspC+qLP8GL3gMiBi85sRldeTd6kkUnYzi4VVe/9IRgFS4wF/jhjOpt+EBUDkcyE4dzpc6APmTASfnwFvl/8RN1SZKS0l55MCQxxsplow680knw492FupeDIM74pBlTWFne5BDxHHh0JJrkyiS9bk1U7OG/Vp6IYtCj6NM4mIW4OlsQw+8RXZkw7nTGzKYOLB7gFYDqthF6vp89OE6g+zh1Tf4l7vS7yfQ6RTojZA0bhCtdPzuCTPw6dZfSlWX+S0p0i8izi4cZgNJ3XPk+w6XRy9o2EFccEnLbyr62V5ScyjbYkEiQQF3Qfgwg379autPIL+D/J89rnr71sYtQNg30goqhALUY+0gQiIFPeVapnuf0x3PGnyG4GSJ92HscFOLjYXCGO8nAYs1PlVmWNgZWPMkrfCgeC2yVpadLkhiPkuMfGUm5MT4AoYbQdA5jgYAqLibwdczRTf9n67NVGNT2zPEgwu7p5Xwf0odq7VPS7vhzM4LaRjT234lP7rEsUwODlSoWAStcN2XqYGDMZmfpc8wsBX/1U4mSLSklzq4jfLSYN+e7uK5UyARk3x+qNGYiTu0nEN2fmDcJ8DqAy1PcWWzVTB6nTCHjX46irtuJwt5pCbCK1jYJEBDl1+s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7747.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHowWmNhbzZZRVBnSGtnWGdqTzlzeVQ3dVlTT0tZVEVqa1d0eG5LbVo5WWdv?=
 =?utf-8?B?Q3oxRC8raFFJUDdrcjA0Z1dCNVNuZWZtVnExY1VwSlJGQmRUSkZqYmgvZUtD?=
 =?utf-8?B?WDlSYUhnaE5PUHRSb3paYWc5dUhlaG9MRmJ5MFZyVXJteWRyVkpEaXBrOHFZ?=
 =?utf-8?B?M3FIZXlIL0xEdEVLOEdsSExSL0RoY1M0YlFDTEZ5Wk8ySHN5MmlsdW5vektv?=
 =?utf-8?B?VVcwd1dmS2phaU9YWXRVNEpqSk5lKy90ajk3bXhibFByMkdKcFl3VnhlbTJ5?=
 =?utf-8?B?eElQc3hJYzV0bHAzY2RUbkdKUzZOVitXd21rUGJIb2RDMjBRRHVCNXRLT2lv?=
 =?utf-8?B?U1JYeHJIS1JjTmdlcld3RFhhYWxxQ3NQSUJtdlZPOGZsOWxJdWF1TWZwcmtj?=
 =?utf-8?B?TkZ5d1lnMG1MWW9RR3NIWlkrU2toUFFxUXY0dHZrY0VrMFE5bG1IRHFsa3E1?=
 =?utf-8?B?UEdoRHJ0eGJFRTlhUlhXVGc4WXZWcWZ2dDJMYTdQTHozS1puYjF0Y3VWVldv?=
 =?utf-8?B?SjhsMC85ZE5QUm1iOVJ4SnZ5dGNycDBMZzFRalU2TEg1V3cvcXdYekc3dzZG?=
 =?utf-8?B?WTFVb1lzNklaN0N1Z0pyeEgzTUJHejh2ZHlqZ2pLOWxJLytzeUUySnd3TUho?=
 =?utf-8?B?SUJVRGJWZ1ZoWENFQWRJcTlJUjUwcEtKZFFDbk92akZ4VUR2Wjh4QVExK2hm?=
 =?utf-8?B?ODQzZXJkQzhtTTVJQ2ZqRXBNU0ltSzZubW1XV0xZaHNMNjZuUXhmQ0xlT2cv?=
 =?utf-8?B?bzhpYm42c1BJVWFNQWJYb3cybVR6N3lEUVZzVWZkWUR3dXh5VmZaOUFZeUZP?=
 =?utf-8?B?MGRJRDVTd3lwWnVvZnRhbVMvOXZDNy9Da2FNT3RSbFZWTGlmK0k3ajRFS0Va?=
 =?utf-8?B?NTBUbnh4eENLY3NkbUJPb3NrNXZtVnY1ekpCbnRubkV3YXl5c1FjeG5XZkxU?=
 =?utf-8?B?THVqc0licXgraWp3WmtkK2JZZURWbVdvajNTRUNjTGRlZmhRRkdiTlRydXpB?=
 =?utf-8?B?anNLUVNJYjRPVm9iYTRlTkMwNlM1bHQrMmhlSXc5SmpkQTE0SkpTWTNlSVBQ?=
 =?utf-8?B?OEp1d3JUbW1FN1lTSGZDRFkrUlNMM0o2d2tOVCtJakdFeU8xNmhCdGtoaUxm?=
 =?utf-8?B?Nk5UME1neXpLZlI5NXVydU9pR29SV1BJZkJXKzdHaDNkWWE4LzA1Rm85czcw?=
 =?utf-8?B?NFNtN2t1QkNrSWE0TDNycTVVVlhKQXBPbTloK1FKZDZmN2xoN2JyK2owcXl4?=
 =?utf-8?B?dTZGSTJVaWpyeEFnOElHYmg4dGtQUkRycEVaVG9lSjRIQ0p0L3VTajduUlVy?=
 =?utf-8?B?Sld6ZC9TQStHTk5XYkIyMHlES05BWVZKRE9oV3oweG9Bak81bHVld0pBM0FW?=
 =?utf-8?B?K2dkMEx1L0Y4RGlJUWhWa0xZMTg0Y3oyVEc0R3ZWcWNiYWNQZ3hUK2NGcytD?=
 =?utf-8?B?V2lzNjhGY0pXRGlhaklWWEVTM01MNk5zekVOME02RE51bkhGQXQzY0RNSE9R?=
 =?utf-8?B?Tlg5SVRiMkZhMU8wUDRVMWJtbzBJYkVCa05Mekl1SlVZRGk4MitXbG1DQ3pU?=
 =?utf-8?B?Ym1NcTNUUWRlSVcrNTdZYmR2WEZDV1dVK2E1R050U1FKMGswSUF5blpaVCtB?=
 =?utf-8?B?V2dOellNUWIxblJuVXd3SGdBaWN1YUNXaFlTeDlyVlVuZjh4d2d3RmhXMjBz?=
 =?utf-8?B?Z041eTk0WGZ0N1IvaFNHeEh1d2Zac3RQL0ZaSmIxUnhIVnkzZ1BCeVVWbjF2?=
 =?utf-8?B?eVlxakdiY0R3K2I5VUFxdW5BWjBaNHF1R2pqTG12K1FueVNUTXBDblNWMzVU?=
 =?utf-8?B?dzJlVmV5ZS96SmNnK2hneEFoNDJhc3o4MUZZeFJRV2VpQ0hYZE1iUXk4ZU9F?=
 =?utf-8?B?czZqQlp5KzdLaWJkRUc5VWU0YkxaMmJjeG02QVU3bzY4MEU2d3dnaXdFQVly?=
 =?utf-8?B?TFZoS0M1ais1bmpZTUt3b3dFVmIvdFpTcTR6QlNNeU9yL3RRTDd2VEpOZnR3?=
 =?utf-8?B?TzBCQWtZUnFick5OS294bzNzMFd5NEpkQTdLREVYL25tQzhyQ0lSMG9CWmJV?=
 =?utf-8?B?YXRsMTlwSlIyNHBZeXFQamZDeFc5VitZbGVnbEVvR2g4TXRpYVRyNFk5QUJw?=
 =?utf-8?B?RUhaNGtVQW5yRDNKQUtMQVNObGVUZk10WGVUSWhQNmUrOTJNRW1jWGRPRjg0?=
 =?utf-8?B?bTJPaDhmL1FGa0FySXZLTHRLT0VWS3VTZHc0WDNxUXNtaGpqdm4vUWcrYzJy?=
 =?utf-8?B?WHR2OWhnZlFWSGo0N051UWtTZWJPb3BscHNkaTgzNUl3NU1STnVlZ1BZdVlr?=
 =?utf-8?Q?WmX4GoF9ZWOayO3vSF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fea53b0-0199-4590-207d-08def1300c2c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7747.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 07:23:00.0843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3t5zDDdgBLnaVvpcvyXp0laO1khPld5CEfpfuc7S2Nhy6jMgbnEXeU8pGFw1yQVP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8085



On 7/30/2026 10:14 PM, Yifei Gao wrote:
> isp4sd_pwron_and_init() holds ops_mutex via guard(mutex) and, on any
> init failure, jumps to err_deinit and calls isp4sd_pwroff_and_deinit().
> That helper takes the same ops_mutex, re-acquiring a non-recursive mutex
> already held by the current thread, so any init failure deadlocks.
> 
> Unwind the error path in stages instead, releasing only what each
> failure point acquired. This also avoids the issues that an
> unconditional teardown would hit at the earlier failures, such as a
> runtime-PM underflow from pm_runtime_resume_and_get() and MMIO access
> while the device is unpowered.
> 
> Fixes: 4e5e7a7ddb4a ("media: platform: amd: isp4 subdev and firmware loading handling added")
> Assisted-by: Claude:claude-opus-4-8 smatch
> Signed-off-by: Yifei Gao <gyf161023@gmail.com>
> ---
>  drivers/media/platform/amd/isp4/isp4_subdev.c | 28 +++++++++++++++----
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> index 48deea79ce6c..868d1c74d35e 100644
> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> @@ -687,7 +687,7 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
>  		if (ret) {
>  			dev_err(dev, "fail to power on isp_subdev ret %d\n",
>  				ret);
> -			goto err_deinit;
> +			goto err_module_disable;
>  		}
>  
>  		/* ISPPG ISP Power Status */
> @@ -697,7 +697,7 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
>  			dev_err(dev,
>  				"fail to set performance state %u, ret %d\n",
>  				perf_state, ret);
> -			goto err_deinit;
> +			goto err_power_off;
>  		}
>  
>  		ispif->status = ISP4IF_STATUS_PWR_ON;
> @@ -709,12 +709,12 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
>  	ret = isp4if_start(ispif);
>  	if (ret) {
>  		dev_err(dev, "fail to start isp_subdev interface\n");
> -		goto err_deinit;
> +		goto err_perf_restore;
>  	}
>  
>  	if (isp4sd_start_resp_proc_threads(isp_subdev)) {
>  		dev_err(dev, "isp_start_resp_proc_threads fail\n");
> -		goto err_deinit;
> +		goto err_stop_interface;
>  	}
>  
>  	dev_dbg(dev, "create resp threads ok\n");
> @@ -724,8 +724,24 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
>  	isp_subdev->irq_enabled = true;
>  
>  	return 0;
> -err_deinit:
> -	isp4sd_pwroff_and_deinit(sd);
> +
> +err_stop_interface:
> +	isp4if_stop(ispif);
> +err_perf_restore:
> +	ret = dev_pm_genpd_set_performance_state(dev, ISP4SD_PERFORMANCE_STATE_LOW);
> +	if (ret)
> +		dev_err(dev, "fail to set performance state %u, ret %d\n",
> +			ISP4SD_PERFORMANCE_STATE_LOW, ret);
> +err_power_off:
> +	isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0);
> +	isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
> +	ret = pm_runtime_put_sync(dev);
> +	if (ret)
> +		dev_err(dev, "power off isp_subdev fail %d\n", ret);
> +	ispif->status = ISP4IF_STATUS_PWR_OFF;
> +err_module_disable:
> +	isp4sd_module_enable(isp_subdev, false);
> +	msleep(20);
>  	return -EINVAL;
>  }
>  

Reviewed-by: Bin Du <bin.du@amd.com>


