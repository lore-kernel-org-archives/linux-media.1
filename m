Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9252324B31;
	Wed, 29 Jul 2026 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345376; cv=fail; b=S/GzO8as7B8c5XE0fRK5JsuMztoG38EFqUbcQ6mdqqC2xYsaKIf2KIPeaCmyKxMJQUDkCBfClJYq0Su8THmW7X42kQ74Cg9US2BcXydOmNWLnlIuSavehixSXAmLIL13xH9lrnJwmrKw70OTyd0M5GHIXXIFznOc9sdIJxCqTC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345376; c=relaxed/simple;
	bh=EUZQl7j+NfxbfuYHvZjBnQVwRf5xM8Ba9/xmVxFGPOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Mn/kGlvfrY+37INidhboS7Mme9FaLSH3e/71KKlhrTem9Vt3jZlYkYG2FkfHcPWfXUry5ky3EFcu5byBVt0erCSLf0GbvrY6n8VNS3k5YKhK3/oE1Q67aXFl73uQ6aLR7t/gPP1Ctqes6VNyjA0jwI8RvpABwrMj4zL7P9eMeWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TNEdhk4C; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TNEdhk4C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIBherG5i5l296rnwA0kaoGiWVkzmXoawVAHsaW6Ia17F8uQ1V+ss68qodzUeTr6ofhcsOpAYKw8HhcLl9gWrMJ8XJn34ONIGYOsxHwRemhTcQyuYy13JvWxLpBqFryol5+tYsj+YNSCL/IYEZj7K7AtMKQQCS/PFsofVB3hmz5wk9Mz2bhWYpz+8IjfZfpdolxbmhBI4GV0veeGmZfD7PVy5Z1rYd2764zqbzsdJ/1BgZ+PLJqrI+ogFSTLa6N0TJIGBqreOzyBCqslR7IhCRMpA7lYrd211XAQy+lLTzxTV5uuggIJINGQ0Xxezxrk5Tti2B94Xv0XhZoFYGBMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Y/0IZ/WvgQdldR9p5cQAzIN+4YZPDAQzO3KPmuLRUk=;
 b=KYePsVCK+aQZd6a6lJJvvg62om0Hawgecpa0w7tHNh+C4BULymKdIVPsX1SdVvPpVe7yzO6YxqmTcQ6oA+539TTXj8LqL9DvPSOG9bi6E8cMC6L6iUPutvx7qSsXvcr45S5E8TMdSUK4tRc1lvds64R4c5SBI2j4mZOqw/aecbUlkytIgcNFkuZ/Kn5SkzNWDH5L+kFxM5H7wzdEy8/u71qpNIpDOO/CE0VwyvlSXkca5pXidgAQVNuWGwSU3gDxrK/PU4ZW3cFJXnngF7r0fU+0o2vyuflXWmqpCxUEnApcJ8hhN9m6MjUSMWxQxhvO7OCNK3EuhFb7eO/jjerEXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Y/0IZ/WvgQdldR9p5cQAzIN+4YZPDAQzO3KPmuLRUk=;
 b=TNEdhk4C78/jp786N5V0QzIN7gY2OdUskt1JS8pT/ZWUQLKOPOwJ31DUqV6lHs6iftMJtI/1IHpkKO5hNv3mg2YBHtdfoF/ZDDAHfjf/mkKYHdNYK1p9+tTAwvvRownayBjMVXqbmX9PTqkunl5ORlDss2SwAgsRiOZi1P6V7ExTBVjOQSFOxGsCJ6tCEcouY7ClCdp1MpMAxSqLTmCFqkyKjZeVPNl2wRGOpotI4dDYoZPYLJCaMURtYnIxpGL6PKdqJVFbQE63H9LFxkukPNicvaEOgkHMZbL1vLfBqRKwinD0dci+BUurJNMP9KUviiCwtVbDW+lM4730XCwdJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB11629.eurprd04.prod.outlook.com (2603:10a6:150:2c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 17:16:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 17:16:04 +0000
Date: Wed, 29 Jul 2026 12:15:54 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Subject: Re: [PATCH v5 1/2] media: hantro: release runtime resources when
 device_run fails
Message-ID: <amo1Sn3qz17uycX2@SMW015318>
References: <20260729060440.2092-1-tharitt97@gmail.com>
 <20260729060440.2092-2-tharitt97@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729060440.2092-2-tharitt97@gmail.com>
X-ClientProxiedBy: PH2PEPF0000384F.namprd17.prod.outlook.com
 (2603:10b6:518:1::71) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB11629:EE_
X-MS-Office365-Filtering-Correlation-Id: d3463f54-e2a4-4deb-7b7b-08deed951228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ddKjcYiyqjrDzAT2q8U2P/t7FvJz8ZLOAn/h44RFaoVMnZU1+zXYvVDZ1kZvW+a9elXu/ZUiXFKiso56nc1Ew3ONz0/y4hOADyjpYL/UjNxy1hG60keZfx4gdDJ4re1wVuG+0fbv+8cyZkZmEj+v0Q+dG62C/iZBHtRowteIF0TF+RjNo37ANtgkqHUpyZvOPNPlgN9Wa65I12qBk4xInQoa7VkpYrwUoZRAu812yaW43NNm9N8rTZaScz8Glv7QdaQL7OWCau9tO2B2HgXRGhi1l7MR7ykZTdgvEkGFb/x7f7Iw5Q7MfZ7uPmsSqjJYdwf56Or08fM4Z3li8h4hdoa3a9bsRkqq6xW2nLyOCdfag9c7VUC0LoriH4BFammxwN4bBLSOU8kPhlI0/t+Uyrajc5Svc8zaHpZynDN9bc2HGxajeI8Cqjcyqm0pK1Vk0J8PFs0IIYH0HtkfrJCNkavnCxVhdiLvc6Zbjp9iH3bAnlYGosNFLrudDXQIJwBAb/vIw0nD8Ee3nZzS+GcAgJwflRhXXdkboE3cFV6PIfRbqpbx5wVI1ut9ZSMYStUJEC/0W0PN/xJSoISbZlftzBGxCcj4UQiAj6ED+ZBBnYb6lXRvP3214y/K7JptMoaL0vB0t0PezFlwWsOTyw7N5hO0SZe1kQpatiJ9ne2KgbM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RFt06QgfgJ0AvoNKDvml8jU59QNyMhXAGoSyQ/xc4nk3WHT836/ftlDAQIT6?=
 =?us-ascii?Q?Ov2EWmU3TPcLmXRvadnbgktOchziBPGwjDG8CDDQy4qjKuFJWCv5SQ9hDUxv?=
 =?us-ascii?Q?iSA1wBcQyTSKAf52DgUXYrslyVggo7s8sJttKIFYCRoj4jMznuuwPmz+bUrw?=
 =?us-ascii?Q?X7Sz4V4RCMp/VGNSlhaa+tzqzMq/6jzv9rbDZnvWykkMkpldDqS5RiGyxw9o?=
 =?us-ascii?Q?AtKrt2Vt8RQ/D09zuick//x8wMJ62iCOCOyGYUQJ4M1t+lAW3n7hgFE2z1bn?=
 =?us-ascii?Q?ijDZjtPusKjPsYirsoBv4vIdy85grGguThdmZ8QMYkdXDCrjWG9w7dunwu6Z?=
 =?us-ascii?Q?E5zMeT9EAH6W/rGowveNJsi54bc4wHxCYo+nwGGy7chWH1s0QPV2W6Ll5fWb?=
 =?us-ascii?Q?QzTOmw5UIL/E7gg8vqseHgMMTxwwhF/Tfp+wfk54CcLMGJY2XZe1HiDVA7cY?=
 =?us-ascii?Q?XZ6/X3Gss0VAg5fkj0cyvEtVfsnePaQPeld+NbAkSYAuxuoYuAgk/RuzS6pO?=
 =?us-ascii?Q?BZrQktB0KROmOm5ke+Op2kVrzyytqHqEQZBbpnkw1wEhjCRX7F+7c8ekAPxF?=
 =?us-ascii?Q?nJDhQ0coLqANkTNnTWmI7UVP0DS/djODdI0VzGgSLadTiWHJUGsL5ZnhNfEp?=
 =?us-ascii?Q?+50NLKq7KHz0n/OkRxI2wB1l1LMlRR3Kibeg2NLP0x9F+LahjqeQd/L4UumK?=
 =?us-ascii?Q?/q0c/Vx7AKSHQ9sSQzo2Ddr/78iF35tCOTebjX0JUosbBu7Y+VKoD90cIAep?=
 =?us-ascii?Q?tPKA0k2yzAfhWLFR284g/8wa7FQKu/kEmPNMyDj0dt8GzAjZoSZLj9AZWJNP?=
 =?us-ascii?Q?X/yuqn5UD15OPnXePmrOHjybVYOeVLjTXIKpUcphn7+WuJ89CPijpSQvgCyj?=
 =?us-ascii?Q?7Xg98qqKJR23ybDoXXXj9Iqav7XczFZVO86J9ljq280fzw7I7dJI185GPlVZ?=
 =?us-ascii?Q?Gbzu5vuKRp5qaT7PeJlUVrW+2cJxRBJLN+t9JNvmOHG1kgSpe9ZyqJQsR1ni?=
 =?us-ascii?Q?uB/Q7GxjC6PhhhqkBPCTeXZOQyRwUj2XlatwW41MLyZp0iK6nkFn4fB1KkUW?=
 =?us-ascii?Q?xO6RSc8O26tYOl/SfDb7eheizfjgAmxXs/Elo1J/9pQNfTzKUjqq+MP8+PLG?=
 =?us-ascii?Q?YzqR6du7UDQ9SQGFl5/H+Rk9kIGGZeD4YFts//AJ8iLyJpt3RO/BHD809Fy4?=
 =?us-ascii?Q?+GKYrAnfp52oa6shdWjGUITvaFsTv72ci8jMjcIqnMGgtK6cD+tLhyGteQyU?=
 =?us-ascii?Q?XEI9cO7nQ9oJLKWvv9UjnT1FG403dqEVvoYLYzHo6D+wafCDtde7mnaafWXt?=
 =?us-ascii?Q?ibLYh+by5KAJz/Blz3wD7pMCxNKFwISahrMDhvDTJziobjMaoPuYquwkdR3t?=
 =?us-ascii?Q?qK9UompKncnFPPO+7ChJwigc/xq5S+1BdczXv8xEYQSVyd5+PJv/Hp4819LD?=
 =?us-ascii?Q?+sP83mbe95HRpOe9fATTf5R/4gBfJWAWTQqS9WPboia3B3mfV1IGBBQwTeq4?=
 =?us-ascii?Q?wLYVVCVPdgl9goWLwbpY9EDdENv2kj2mXB69kotgSoGWW0dggmFjBo80g0Ld?=
 =?us-ascii?Q?5J6On7Bwvl0e4KNqMiBpxqnKrD+I9M7cn9Ve8YyDk6pMvtKzZMvA5zZliSN4?=
 =?us-ascii?Q?Im23A3a7F7EQ3D/UN+HZIg3EvOGVjcmJZodFiAd1TLYiie4gJV7STYhsccwS?=
 =?us-ascii?Q?znFGLAlZvbNgLMFPTBT7XohsOrHyX0rbs1sUDd8GMZ5IW7J0BPcZ54CGat7O?=
 =?us-ascii?Q?t4NWhsZamZ8kS6fScdVttRRCMoFFcegqfKuxCFR8R5dTA/ACZamf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3463f54-e2a4-4deb-7b7b-08deed951228
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 17:16:04.7406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +V+Wj1o3ulTDPImlCcjpJ5iHQmvNr2k6fxwLzLdUlZJ+Gvdrs+FCK6aFSllRnCMBCeM63HXzitYaYc72z3Ix5vTPdkJgd6F3GPYWzLh94CapyX0x78iNTtyUjZvf7f79
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11629

On Wed, Jul 29, 2026 at 06:04:39AM +0000, Tharit Tangkijwanichakul wrote:
> device_run() acquires a runtime PM reference and enables the VPU clocks
> before invoking the codec-specific run callback.
>
> If clk_bulk_enable() fails, the runtime PM reference is left held. If
> the codec-specific run callback fails, both the enabled clocks and the
> runtime PM reference are left held.
>
> Make the clocks part of the device's runtime PM state by enabling them
> from the runtime-resume callback and disabling them from the
> runtime-suspend callback.
>
> Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../media/platform/verisilicon/hantro_drv.c   | 66 +++++++++++--------
>  1 file changed, 39 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 2e81877f640f..d6fcd4f7f9da 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -59,8 +59,7 @@ static const struct v4l2_event hantro_eos_event = {
>  	.type = V4L2_EVENT_EOS
>  };
>
> -static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
> -				    struct hantro_ctx *ctx,
> +static void hantro_job_finish_no_pm(struct hantro_ctx *ctx,
>  				    enum vb2_buffer_state result)
>  {
>  	struct vb2_v4l2_buffer *src, *dst;
> @@ -86,15 +85,13 @@ static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
>  					 result);
>  }
>
> -static void hantro_job_finish(struct hantro_dev *vpu,
> -			      struct hantro_ctx *ctx,
> +static void hantro_job_finish(struct hantro_ctx *ctx,
>  			      enum vb2_buffer_state result)
>  {
> -	pm_runtime_put_autosuspend(vpu->dev);
> -
> -	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
> +	struct hantro_dev *vpu = ctx->dev;
>
> -	hantro_job_finish_no_pm(vpu, ctx, result);
> +	pm_runtime_put_autosuspend(vpu->dev);
> +	hantro_job_finish_no_pm(ctx, result);
>  }
>
>  void hantro_irq_done(struct hantro_dev *vpu,
> @@ -111,7 +108,7 @@ void hantro_irq_done(struct hantro_dev *vpu,
>  	if (cancel_delayed_work(&vpu->watchdog_work)) {
>  		if (result == VB2_BUF_STATE_DONE && ctx->codec_ops->done)
>  			ctx->codec_ops->done(ctx);
> -		hantro_job_finish(vpu, ctx, result);
> +		hantro_job_finish(ctx, result);
>  	}
>  }
>
> @@ -127,7 +124,7 @@ void hantro_watchdog(struct work_struct *work)
>  		vpu_err("frame processing timed out!\n");
>  		if (ctx->codec_ops->reset)
>  			ctx->codec_ops->reset(ctx);
> -		hantro_job_finish(vpu, ctx, VB2_BUF_STATE_ERROR);
> +		hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
>  	}
>  }
>
> @@ -170,29 +167,24 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
>  static void device_run(void *priv)
>  {
>  	struct hantro_ctx *ctx = priv;
> +	struct hantro_dev *vpu = ctx->dev;
>  	struct vb2_v4l2_buffer *src, *dst;
>  	int ret;
>
>  	src = hantro_get_src_buf(ctx);
>  	dst = hantro_get_dst_buf(ctx);
>
> -	ret = pm_runtime_resume_and_get(ctx->dev->dev);
> -	if (ret < 0)
> -		goto err_cancel_job;
> -
> -	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
> -	if (ret)
> -		goto err_cancel_job;
> +	ret = pm_runtime_resume_and_get(vpu->dev);
> +	if (ret < 0) {
> +		hantro_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
> +		return;
> +	}
>
>  	v4l2_m2m_buf_copy_metadata(src, dst);
>
> -	if (ctx->codec_ops->run(ctx))
> -		goto err_cancel_job;
> -
> -	return;
> -
> -err_cancel_job:
> -	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
> +	ret = ctx->codec_ops->run(ctx);
> +	if (ret)
> +		hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
>  }
>
>  static const struct v4l2_m2m_ops vpu_m2m_ops = {
> @@ -1296,10 +1288,30 @@ static void hantro_remove(struct platform_device *pdev)
>  static int hantro_runtime_resume(struct device *dev)
>  {
>  	struct hantro_dev *vpu = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_bulk_enable(vpu->variant->num_clocks, vpu->clocks);
> +	if (ret)
> +		return ret;
> +
> +	if (vpu->variant->runtime_resume) {
> +		ret = vpu->variant->runtime_resume(vpu);
> +		if (ret)
> +			goto err_disable_clocks;
> +	}
> +
> +	return 0;
>
> -	if (vpu->variant->runtime_resume)
> -		return vpu->variant->runtime_resume(vpu);
> +err_disable_clocks:
> +	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
> +	return ret;
> +}
>
> +static int hantro_runtime_suspend(struct device *dev)
> +{
> +	struct hantro_dev *vpu = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
>  	return 0;
>  }
>  #endif
> @@ -1307,7 +1319,7 @@ static int hantro_runtime_resume(struct device *dev)
>  static const struct dev_pm_ops hantro_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>  				pm_runtime_force_resume)
> -	SET_RUNTIME_PM_OPS(NULL, hantro_runtime_resume, NULL)
> +	SET_RUNTIME_PM_OPS(hantro_runtime_suspend, hantro_runtime_resume, NULL)
>  };
>
>  static struct platform_driver hantro_driver = {
> --
> 2.47.3
>
