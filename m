Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013027.outbound.protection.outlook.com [40.93.196.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20AA3ACA59
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278433; cv=fail; b=l5Z7SL3bi4apq3mdlUfFyiFFAJle950F9plNF9FRhErg6sGWhy90WVuWS6OsGDT9f167S21g9DDR32ualEi14L3GXyd0+pOktuNe2H/0Y/ue22LWwmcAZTCjRSDdxY+soFj15h1EfNVgLwQg0fj3A2dZ8EXfQl6oF7Qii63asTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278433; c=relaxed/simple;
	bh=8J2GaXIKNttkrUUzPqIibNRn1QdahdRRjuPfnzP/p7U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XNKxsbonwJmccfq3IfcCX1+VL6bn3bQ+9PGbfmotccWZuQZxvE7woalN9oogQ2nb8sLciASJXBt02DqaU8IX4WDzblp2izW9C+Nx3JbLT4uMo+CWTN1IOmFq6fb4MKH5olopkwWddoG8AYOzi1T3f8aIj4ueg3iLZxhm1BZrZOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aLxGmdcL; arc=fail smtp.client-ip=40.93.196.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aLxGmdcL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+QGkpaue2lp1RKiUNFhvgMSragnIGlPx7w2RC0dvDMSEJjwCs4Q4qmvUVucdDTQhw07Q4WPu3UJyOSF0AVVVgpo6ULjcicOCA+2scwGrHZBjLZZgEKwIwxKdFYkvdDywMgoeXceA976SRwWiPKytUDTqxIC03kznPSqBo9sb5WLDTpDxVz4RZHu3zABx8WVsqzGNHu3aABwb15Wd5MShO+gipjPZzvxXkHhN0zi8Ggaan+jIx/auRlKdWbbEa3z+S2z2DehuFMCqxJgCsJZlBxdotNu+eWI63jnhXUx2RlRcZEwG2hQ20IEgnazzI4VfZk7s8yjnHLEqo4T81pkgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hlmWrxA7WlnLMuZekUQU25d8WBaF5JWe07855moWjE=;
 b=tBHwGvejex6e33D3PLhO92L6eD2IG/IpqlujeTRMzlQPttlyD8LdcDtgJ+V9FOQcEcRvf67Zs5KcoxHxF8hbd/PjzQajsMNiRXc32VzbuI27bKkVH7OVcFagwKiRgdnVxROt881BNuONkpECjER8Jqm3OqipQrhDgu8WXHz53F64egraY8GktoAU79qmSTyHHzBacU4s2MKDBAY0GPlOMp1eEbscRI/i4dtl1iQd1mdcjDs/Js+ipQmk6sYwHj9Pi7lDsGDXGr61JHS+5ffdQXpZMCQhVRhaX0t/6hKak9zlgI05UbT44e68L0nwncUeIbB38ujjTnaCsYtocmcB9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hlmWrxA7WlnLMuZekUQU25d8WBaF5JWe07855moWjE=;
 b=aLxGmdcL3eLUkEqvhHyr45ZpUCCRGWcso2ujJXKMGuwudcmh+JVQv2MXmJShU4ECUEfRgNsyeS/a9TZ7F4IYV1x/Q6ayl8GMDsEnvJOD0mpu0JTw60gsYo0WV6hNhEAfHYKPpMpUBlj6Cpjo1AYZ9cGgi0K0JAX5bcE+Xq6uU7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20)
 by DM4PR12MB5724.namprd12.prod.outlook.com (2603:10b6:8:5f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.13; Fri, 17 Jul 2026 08:53:47 +0000
Received: from DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589]) by DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 08:53:47 +0000
Message-ID: <f36981d2-798f-47b2-b2d5-53c3988d79fc@amd.com>
Date: Fri, 17 Jul 2026 16:53:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/19] media: platform: amd: isp4: drop vb2_queue_release
 calls
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org
Cc: Nirujogi Pratap <pratap.nirujogi@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <cover.1784276382.git.hverkuil+cisco@kernel.org>
 <78b9e1f607f16526b9f69ec32a4b89b65e77b163.1784276382.git.hverkuil+cisco@kernel.org>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <78b9e1f607f16526b9f69ec32a4b89b65e77b163.1784276382.git.hverkuil+cisco@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::17) To DS0PR12MB7747.namprd12.prod.outlook.com
 (2603:10b6:8:138::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7747:EE_|DM4PR12MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: 19f3afde-fc85-4ff5-7cdd-08dee3e0e9e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ZYUoTwDX5e/QqXJV91e5xZ1WBnlAS046V3G8ztjt+DPw8gvuKyEsvuayPGywJ2vAskSn6QqBf8ZeUxMXcxriKPW7+NicUqmZ4Bbo54OY/ZP7dUOKts8iau6ldnZYtqOvlgt+3r/gBxI8waC5fCTaL/LLDz7aDsfDjKu3HJPnTXIjxJ4gK8U3PrAJMkBZ2vjSYK2pUeAnP35zUJFV6npvBLB2jAUNt0TE7x7zXQ0wxRnTYkIZ1K9tx6oJEfYaYizKlTRRsZHYJcYPOvM6g2bLefwnseIuiUm58Per92j/WnrdFm5313GgMJKytjmNU9NxVy0ADQ86jZszLIibl0IVSwvpd2lzlJ7cy/6n5sYBDKZrNKJ7Fcij1DjEciPt1GSri8ZZ9BkcuBwvFqPvgoXDhfgMkw2cw8MglShkezv34+0ZQk+aIQaGe0TOzaSn4oFKXpzgupSWA9ux/zGeBUVXu/oYQMPg77rxmWNyzl2PUfT6si7gUe/z+YSPqQEQ1rg+b+hHI5NyKOKGSZ09CC2+rqTEdIrDFXinHZpGkC2MI9QyqsEMePhCyuP523egsqBimcaROXgJ8wWwshozBiZNf0EBWXo6QAuKwad0hD08dc6WBI0hFtsiuiOCYP+/kha1kD3y4e84MlZpRgXvCPlqGrjaQDTyW+YIg4iNiKjGBMA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7747.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGt4aGsrQU9id3V4TDJBWjlNTEVGNmJVOVllVG1sdVdaYS81QXloNXBuVjBo?=
 =?utf-8?B?bEdrbnRXeWRGaHhQL3ZwYU10bHVaRlE4YXd6eU1pQ3RLN0phaFlsQVdtUlJK?=
 =?utf-8?B?c0o0WnhqMmpRR2lkL3pmT1RISCtxaGg0MGlLNks3MlpndEN1eGwxeUUxcFBE?=
 =?utf-8?B?aStqcnBoSUxQR0x2YkR0RGlLbnkzUko4S2NhbGtiSzByU2toWnFIakJHUUlM?=
 =?utf-8?B?dG9MaFgvYmpPYllUWTU4dThJRVVQQ1JQYXl2K0cvVTROWG9BdzJqdzQ1MVNn?=
 =?utf-8?B?RFU0ZmZFYXhuSC9PTGdTNlNPUWl2dklpQlc1MXBrVnBRTUdnRWxzdU9NcXR1?=
 =?utf-8?B?b3dldTV0MlRZSUZRSGdkS3NNdGNIM0g2RjNHZGJZQ2dDKzhoaXNNMlR3YUlm?=
 =?utf-8?B?Q0FhVjFkK2dDenAyVXltS2ZBUnkrYXlQazZyN1lLNDdVOE1FTldQcWYwTGxj?=
 =?utf-8?B?TkNjeGV6dmdPc0E3OTVyNDBqbUNCblRsQUc5bFAvSk9GSm1vLzBhcjZmMWVT?=
 =?utf-8?B?dTJXNXlnQW1RTDRtRU1ERmN0YTF2Q2o3QUl0Q25NRlB0RkQwTFl5ZjdzVTdi?=
 =?utf-8?B?V3JKT2RQREs1NnJuOCtYeXhrcnNKL2lEK25FREJsbjVNNWMxb3h0cGY1eEFv?=
 =?utf-8?B?OXYwWnV5bHlNckVzVTJsMVhSOHdyTitsbmF4d2MxWDNMUk81bjZNN3J5MEJh?=
 =?utf-8?B?MkdGZTUwaElzck8zUUxmYVNJU1c5ZmR4bURvSThCMExRem1Kc20zV2wrdldF?=
 =?utf-8?B?ejNBRUNUQ2diWmFYK2hxeFlrWG1obWkvWTZReU9DenpHaWkrNnN3OWJoOWJ0?=
 =?utf-8?B?YnJkWXZQRUhpVExUT2tUeEEzV3VzSll2TjJwVUNycGYyN1RSUEgya2w0SDNZ?=
 =?utf-8?B?Rit0ODdFbFVHVGF4OUlyKzBrT1d3Y01kSXdFdzQ3am5FczdqeXdhaE5IUEVl?=
 =?utf-8?B?T2Jyc2lBOEZUMkQ1WEhTZ3d2d21OalJTMlJwWmNzQXA2akZ2YWF1RmtGMWdw?=
 =?utf-8?B?TFV4eGpSQUZPczk1Wk54dGtGUSs5Z2duN1BzNGxUZVRKcmJtUFRaUDVUV3lz?=
 =?utf-8?B?ZXZaSnhmZ0U0blMwMXJPR2J3Rmc0ak9MZGRKYThuOG1GN2dKcnFTRXg5TmpO?=
 =?utf-8?B?TkIyd3Y0RUFoU3FhOGoxL0E2TFovMXVqMHh3RGV3MmpCMWZFa0ZYMG90Z3Qz?=
 =?utf-8?B?dW82dHkvQTJiSEd3R2xRQ3VEbGZ4OGFQSGMvQkhiOVM4QWVqQW82d2g2QUg0?=
 =?utf-8?B?YUx5aENJTnNWU3JiZzY0bkVtWk5kNVBGUTRtMTRkR3VIeWZFUXdFelZKUFN2?=
 =?utf-8?B?bWdkZHN2NXBxQlI0OHl3eDZYdC9vY1kxZExBaVdtV1lnU0E0MjVUSTJXbWcy?=
 =?utf-8?B?eHdrSnh1L2RtQXljODc5VHpOUlpUYWJUL3YwOG5hRG9abldlOHVkT3diUEtJ?=
 =?utf-8?B?Y08wRFVmZ1NndnhMUThtUnFRdjFzVVF3K1YvamMrVHJhOVcxN2VQTXprd1lq?=
 =?utf-8?B?a05UV3F0ZCt4MitDQ055dTNFaTlVVlpBRVMySnhialpNaVhKVFhEZ2VncFRF?=
 =?utf-8?B?eitpNk5aK2hKeFV3K3VxLzBBMHpEQ0o3czg0MTREanhxcjdpZGtrQ1EwT2w0?=
 =?utf-8?B?TEVZUTBqbWg2dmhIZjlkS2hXYzFNQWdPeWF5WEwyMC9NR0E2ZFpGQ0d1ZDg4?=
 =?utf-8?B?NXl0Z01meWpyOWR2NXdOUnY2Rm5QWUtWODlFZXFGWUtoNTdoNmlHWW1MSjlD?=
 =?utf-8?B?Ri9mQWlsU2t5N3M3NEFCMVh6V1V0RXhRelVJMk5qMDRYMSs0d2RpRThGY2w1?=
 =?utf-8?B?WmJmVWhZbjFUKzVTUzdCeE1kV1Q1bC9MMWtQbUVOR0htRnVaTUVSTGN3WTJN?=
 =?utf-8?B?TzlwamNpUTJJVTNOcEpQMG9UUkszWnpNcURXMG1HVERnaEVCWTNnM0FKeTJO?=
 =?utf-8?B?ay9CQ1NJQ245b1VqRW9ONnA5UTJZZjJJQW1BSzZTam1QWXl0SlJpZS93b0ZG?=
 =?utf-8?B?cHZxVmZ6a1VnTXl5c0RrODRaRko3VXZwSlBEZlZaYldHbkxMak9wdmkvbEVq?=
 =?utf-8?B?dWREeDdoVnp2TEI2N3Bpa0tXaytrTTl3bWVRd1ZQWWVhQWkyUXNjd2VmR3Fo?=
 =?utf-8?B?R1lhdGlRV2FZRG5UMytpa3loak1keEFrWk53VnVIeDdDTDBCem5xanoyTDVT?=
 =?utf-8?B?SlFRZkw3Ryt5clkvcmlBUDJ4TW9nZjNXSDhvRkRMR21USXkyTVVJUkJubnZU?=
 =?utf-8?B?UE1ScUhza0FHa3JWWFFRdlRiRSs4Ym5kbjBFY3YwaEQwMFBST3pSQ2UrZ3hI?=
 =?utf-8?Q?tnyl+wm/tqLUcs5b+V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f3afde-fc85-4ff5-7cdd-08dee3e0e9e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7747.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 08:53:47.2993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYUciFsuOmZrqqrQdyZB8X1jhlZnuIaQoh6q8zrhVFQmwI/nWMBfQsnyOm4sKShm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5724



On 7/17/2026 4:19 PM, Hans Verkuil wrote:
> [You don't often get email from hverkuil+cisco@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> These calls are not needed since the video device was never
> registered.
> 

Would it be better to say:

"Drop the unnecessary vb2_queue_release() calls from failure
paths before the video device is registered."

> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Cc: Bin Du <bin.du@amd.com>
> Cc: Nirujogi Pratap <pratap.nirujogi@amd.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/amd/isp4/isp4_video.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
> index 0cebb39f98e1..0e702add6144 100644
> --- a/drivers/media/platform/amd/isp4/isp4_video.c
> +++ b/drivers/media/platform/amd/isp4/isp4_video.c
> @@ -742,13 +742,13 @@ int isp4vid_dev_init(struct isp4vid_dev *isp_vdev, struct v4l2_subdev *isp_sd)
>         ret = isp4vid_fill_buffer_size(&isp_vdev->format);
>         if (ret) {
>                 dev_err(v4l2_dev->dev, "fail to fill buffer size: %d\n", ret);
> -               goto err_release_vb2_queue;
> +               return ret;
>         }
> 
>         ret = isp4vid_set_fmt_2_isp(isp_sd, &isp_vdev->format);
>         if (ret) {
>                 dev_err(v4l2_dev->dev, "fail init format :%d\n", ret);
> -               goto err_release_vb2_queue;
> +               return ret;
>         }
> 
>         /* Initialize the video_device struct */
> @@ -760,7 +760,7 @@ int isp4vid_dev_init(struct isp4vid_dev *isp_vdev, struct v4l2_subdev *isp_sd)
> 
>         if (ret) {
>                 dev_err(v4l2_dev->dev, "init media entity pad fail:%d\n", ret);
> -               goto err_release_vb2_queue;
> +               return ret;
>         }
> 
>         vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE |
> @@ -786,8 +786,6 @@ int isp4vid_dev_init(struct isp4vid_dev *isp_vdev, struct v4l2_subdev *isp_sd)
> 
>  err_entity_cleanup:
>         media_entity_cleanup(&isp_vdev->vdev.entity);
> -err_release_vb2_queue:
> -       vb2_queue_release(q);
>         return ret;
>  }
> 
> --
> 2.53.0
>


Acked-by: Bin Du <bin.du@amd.com>

