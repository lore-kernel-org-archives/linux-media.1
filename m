Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012043.outbound.protection.outlook.com [52.101.53.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B4E21D3F3;
	Tue, 24 Mar 2026 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774383874; cv=fail; b=UHKPBYHmel/Zu+TRCqt7STQOeuPwiHyGgPprbxeWVxkA2gxcpkHfWLKuoXD8x66jiueIJ2MFV/oo74dMZzKDEMqDDhgiNhVWYwvmHgFaNzcQ+5jci2jieBLzrEkxCpVwt+cmoK/iVrKD5r1nNjJsHlNYaR7uZEHBWX6eNoEQq7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774383874; c=relaxed/simple;
	bh=lLs76wHffB9dD3CuI/r1mMs0eKCusWykGZlSSmiaYuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YRfJ7Zo1Tdg9EMJYVYV/hLxrxrJ4dRRz6Z6Id5+LFpqncTTnGNnLp3wYSR7B4WBAw+fUKrzm0UYWb18XjZH3T2df+Vwg1PvAA6IUP//UKqQZw7Drv8zPUR/4s8a5PxOFMPaMi0ukQncs0BobL9gzQ2/keICO1WRWvEjmgSCoTck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YrZybF/p; arc=fail smtp.client-ip=52.101.53.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YrZybF/p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmqkfmKwJckLbJzgpteKl3kBklbFvIY0StWShnxTvmBtV9gaeltZDmITjVEx9IjUFdyoF0bwfg/8a4YjVl0p1a9vbfp4eRJlQvLwvKilhFA0oHYMl5wf8tLbmS0TBuHwy7uWT0v6taWfwQ/rwaN5XU0B3EQi6Zs6n7uims4kB+r/WIw8jXUzPw3je46TuAYBjL1q+vvx70jwJxROU/ihJd0p05lqBZceVFl/WJ06V+/ViOW/8m3D9pMlLai1/cXSjMCOoqXUGLn7A6yJXQFHlTXGpe5tZTnTtY7wqLytpJU/9paYu4olYAjlIwt6comZJFeYyTKpWJzBfSlQ43ShBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0pJm/ysvh2qawqFHpRi68Vnj0kSgb+gIHLZ1cv3KlE=;
 b=tiBvybnv4n/J6bMHsFX8gH2wuD7Qz7rUnVRyM265yoVPcY95Obynxk9vSdzOJt7Le8xUu9ikFWmQUZyt74+tyXcMbfQSIREXCy6tsAFuAobhAiRIl8dTmk9n/fyocKLkCtsxUJcKgDsXxnqudjUFe4dqBGTC2sPNSvp/z6DqSOcJ60s4s31vo0lrvrbr9Sv5ibBdRHRBOGD9uLXuANsfBeXyWaZoFoFDOzSL2r0yx1CgNEd1iSmtnSU00MhAb1/KO4/Omu9gX8QFGZ0WM+FapxrtCxuOhPBgNmQ4QyI77MboU1JzP33VQqgri9Sru1lyjB/KoxjgCOQQEaKqDE4qgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=collabora.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0pJm/ysvh2qawqFHpRi68Vnj0kSgb+gIHLZ1cv3KlE=;
 b=YrZybF/pxeVNQVSvLcB/sOBmuhOurDrE4L6A/xkih8RvRgMWwtjjpriFeRPNdZ1Pgy9jmlwTNYhnNdPYn0ndDBVVJgZEAgRPD6Bwbz5rHqIBtY40f8X73LkI/2YLCPrLVxRVj5uG8Bg2v6MojWCQMVlNdbhMUMA2eg49Rxe+Qes=
Received: from CY5PR22CA0099.namprd22.prod.outlook.com (2603:10b6:930:65::24)
 by BN0PR10MB4998.namprd10.prod.outlook.com (2603:10b6:408:120::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 20:24:29 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:65:cafe::2b) by CY5PR22CA0099.outlook.office365.com
 (2603:10b6:930:65::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 20:24:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 20:24:28 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 15:24:28 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 15:24:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 15:24:28 -0500
Received: from [128.247.81.76] (b-brnich.dhcp.ti.com [128.247.81.76])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62OKOSFn2772152;
	Tue, 24 Mar 2026 15:24:28 -0500
Message-ID: <0fc8749b-8472-4914-8315-17453bdd2390@ti.com>
Date: Tue, 24 Mar 2026 15:24:28 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] media: chips-media: wave5: Add Support for Packed
 YUV422 Formats
To: Jackson.lee <jackson.lee@chipsnmedia.com>, <mchehab@kernel.org>,
	<nicolas@ndufresne.ca>, <sebastian.fricke@collabora.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<hverkuil@xs4all.nl>, <nas.chung@chipsnmedia.com>,
	<lafley.kim@chipsnmedia.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>
References: <20260324050400.218-1-jackson.lee@chipsnmedia.com>
 <20260324050400.218-5-jackson.lee@chipsnmedia.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <20260324050400.218-5-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|BN0PR10MB4998:EE_
X-MS-Office365-Filtering-Correlation-Id: f39b88db-de96-41e1-9cdc-08de89e359bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|82310400026|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	huSSDuxe1wPL7ovBteA7zoWZhi9UN+g1y+BDRXnnJgbDl1M7v6mjENrJZs54ZWBkXMiD71bqXrXMa2VG55dsFpD6oILl6KdmqPCyDqnzUVUHLWPanih1MJJJDAkV3GNtKf0U8R3wWtVJ7j2CNkksEWX/TBfYgq1TeMZYqW9xqMsG04IpbRhrLseBoUI53A8VNYLrqw/6eIqI6Ulb2GXczScbAmyBcctSqxdqHakg5GOJZu051Gvh7Jf3R4zdL3KenJVEF2akWmgASLfGGSBmqhcvnjURKTBJmz4SRZKk0wOLFqNGSZ+EZ7vfEASzs4YFauF4lZP40Ype78heDbf189tyuCHfQ8AaBgbd5BJ3mWA2SuJMRMs8TDcxj92jrN2IaQDjsbQGL2IkbGRF9pa6V5nuvrJYLrmyUhCT8Tgxgq+s9oMWDJx4ucfORR3BNw1eqo+AB3Vrq8v9l4YIcxVzeyZeK0iAnQJNjAicfAJZTZXmmbQeiA8coqYJO8lGzT5WxzT5k7V/0IJ2jtTpxR67wXlBbzUP9lSWu5sClSF/qjF2yjLfHJEDwBvLGRIkkIHIvM6TnaiWFPZOKtgl++8OH0Ns+TlF9CPDAK1pkxitezW2TfUCIPj8X2xF1OixANBRNx+PcX9egO2O1t/6Pvb1UlOv7iBYPm+VR6kHX6U3GalL6T5EkVhSSgyeIGZ8Ybai/vUUhj7XufT5qVxSJT6Zi3EqzSYtjkY/3orRtcJsBSTNQWfKM/5By1uAg28gipI1uBU3cGLZ1oSTg5WFArdKJQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(82310400026)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9ZQ6e5FzZ/timiV8DA0rULWlvWMYFYsecagYZA9kPo3YbROlBrf2yQeaTNAMOaZ6m90EctfHzBqv/RcjAkDZk4jgs+VWXZmUwb/KMkBriBB3rXE11GqnehGjLxjOBwP/xADp53x+MJzZVy0WieVgQqpPqaj6dGjz6hCJPS0gRNquRkuNZuIRgsysDWE6k77NiKzVTUv4RBI7nKII8CvQQwdYb2lGiaXVVxvellwLewn+LTwUTXjoT1DclhSgA/CvK4y9X2hQ1Ik207Ac0jXQEbmAbXClb6FVoZGj+tXPRX3CrMRWKgoTd8ghQflxmlsGZ0+XIME92rBZmjQL81B4+dP6tJynlx7HWqsOo+oBFyzrQ+bxztV1b8Xc4vIU8pdLXG7u4vnjGN3ofI9oTzYq8ihfkUOXLNkLD/oWTmn8HUHq2N4PG8TKtXWSpvuPn3af
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 20:24:28.8493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f39b88db-de96-41e1-9cdc-08de89e359bd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4998

Hi Jackson

On 3/24/26 00:04, Jackson.lee wrote:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
> 
> Wave5 encoder is capable of reading in numerous raw pixel formats.
> Expose these formats and properly configure encoder if selected.
> 
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Even though this already has Nicolas's review, wanted to add my tested 
by as I have validated this with latest kernel and gstreamer version 
1.26.9. Encoder is properly reading these raw formats!

Tested-by: Brandon Brnich <b-brnich@ti.com>

> ---
>   .../platform/chips-media/wave5/wave5-helper.h |  2 +-
>   .../chips-media/wave5/wave5-vpu-enc.c         | 32 +++++++++++++++++++
>   2 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.h b/drivers/media/platform/chips-media/wave5/wave5-helper.h
> index d61fdbda359d..e6f241012c3b 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-helper.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.h
> @@ -11,7 +11,7 @@
>   #include "wave5-vpu.h"
>   
>   #define FMT_TYPES	2
> -#define MAX_FMTS	12
> +#define MAX_FMTS	16
>   
>   const char *state_to_str(enum vpu_instance_state state);
>   void wave5_cleanup_instance(struct vpu_instance *inst, struct file *filp);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 775beeb10fd4..ad63609cbe83 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -90,6 +90,22 @@ static const struct vpu_format enc_fmt_list[FMT_TYPES][MAX_FMTS] = {
>   			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61M,
>   			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
>   		},
> +		{
> +			.v4l2_pix_fmt = V4L2_PIX_FMT_YUYV,
> +			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
> +		},
> +		{
> +			.v4l2_pix_fmt = V4L2_PIX_FMT_YVYU,
> +			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
> +		},
> +		{
> +			.v4l2_pix_fmt = V4L2_PIX_FMT_UYVY,
> +			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
> +		},
> +		{
> +			.v4l2_pix_fmt = V4L2_PIX_FMT_VYUY,
> +			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
> +		},
>   	}
>   };
>   
> @@ -1161,6 +1177,22 @@ static int wave5_set_enc_openparam(struct enc_open_param *open_param,
>   	else
>   		open_param->src_format = FORMAT_420;
>   
> +	switch (info->format) {
> +	case V4L2_PIX_FMT_YUYV:
> +		open_param->packed_format = PACKED_YUYV;
> +		break;
> +	case V4L2_PIX_FMT_YVYU:
> +		open_param->packed_format = PACKED_YVYU;
> +		break;
> +	case V4L2_PIX_FMT_UYVY:
> +		open_param->packed_format = PACKED_UYVY;
> +		break;
> +	case V4L2_PIX_FMT_VYUY:
> +		open_param->packed_format = PACKED_VYUY;
> +		break;
> +	default:
> +		break;
> +	}
>   	open_param->wave_param.gop_preset_idx = PRESET_IDX_IPP_SINGLE;
>   	open_param->wave_param.hvs_qp_scale = 2;
>   	open_param->wave_param.hvs_max_delta_qp = 10;

