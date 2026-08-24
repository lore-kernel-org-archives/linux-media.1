Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013045.outbound.protection.outlook.com [52.101.83.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEED382381
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 21:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787605828; cv=fail; b=BBBqjyxh/rzu1yniNbGz8aiK71t1wLb90jLcdqznTjj0A7Z92H2gEFLcZbWcVXD9OMcOs8rxZYSHWHUmQ6JbZ6lB7Ddr4FkY8UdmJhsu5UmY5VLj4YuLg6K3GtQsywIhZLKs//+3pBESTb53C3tE83oVlGG98JgCBueLH1JhJ5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787605828; c=relaxed/simple;
	bh=0JyG0xQ4BKcunMAwm8qO92ONQhfAbBhX4Fx2aDIA2X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RHr0nOMiPvqRYDKfSg9alUAcgiOhbqYjmED/3Z2F3DwM1G65kyZgFvhICVGrQIipyCSkBIOOXpaSJSO7b1sGqJ7+XeF6qmhSEHnRcCpj4YPgGmrlZMzgxWFiUHIyTcGaPqpztpNdsjeVNkYhVli6L8calyJCzXz8rDx/AxKBUrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=s8lYKgdT; arc=fail smtp.client-ip=52.101.83.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="s8lYKgdT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0KGGC8tSP0k4iRi9m3zm9SZ6RGwFMIZJo7CD52mahpmeS5bWthXcEKmbcLsfw9sdhTakRDR7tpAYOrXTCn9H+sPOwcCSpboPQgAKAYW/zGsgNk4fzRf+0rMJzDYV7t0bjWycLNn3JMTNh/2e5Gd5sst8x+7DRE0SHjHu+nJIA5/X6rYBTsaokD8G+bMoiyDF0wqG+hMCosedRZ1nqMepiseXzu6nLpke8+uYHyskASpBT/9vI1rYm5Apc4HVQM0z0xt/xx8vdQsS96UTWc41ttVAVoTCOpTS2kXlNvEKuPyqlJxc/z9vsXIQU6Q5cGicPinD5k3iP7Lno6Sr5zvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jy+WS4USKJRJDFtZznnqzE+4O+LKSvQruH8LNRLXoMI=;
 b=PUi4q9aT4T6GTGRW34S2fJmd/Lit8SDVGIdyMQ8zBJcRITlqP9OieCF9whzl6Iv6F6JvF9ndsOoGVvHANYzGgCflnoEe+UH7L8OP1uOUFYoE9bRhvuA1AJ4zbTWfUEVDlUa314Hxu4EgA1pDD8Wexr2XNe0C+vMKj6LM09R8TyI+Ak8ZJXPoeVfPu+4qZCWxXupg06HJzv8kyoV/07j39tdugrrrG2MY8IC5XGH8snNxmJbeBJ6+CalOdLQtZU5/GnGLNWpq2YcjbgR3JxutDiEKvzrUNXKWmakgKbUILRnKY52HQsKRYhLFUg2Tc7dJkXnlKM8YwhBRZIaeEgulQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jy+WS4USKJRJDFtZznnqzE+4O+LKSvQruH8LNRLXoMI=;
 b=s8lYKgdT8caqI489ccd3c0NIuGmo7ec/0g7nk7+LVkCOZAqLxUUbSCDLuCsL2L16hK8M8V0aJtLAsur5m7aE4g40BuH4U7xf5KqlhJgpSlOh0RF5TAtkTMzdJ39kvWGyPpmCUKgGYZ5LP9auYr5xJmsGij7prPMVDkXnk+IgR0tn5Hi36jFpC17LdmNF9DPzkqfxJoySj3V6wn7qM063zfkz5azZpkc6svHZ4//pZT322O0HogrJuRbeFr4cszki4L/SCXIjDBa6ccuV/lP5GghMeBCffzfaxu3Ff9ayMgP4KA6b8VkAoKSPD/bo1Fdab/x+JlIxuGgJ3Ztiof9liQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8962.eurprd04.prod.outlook.com (2603:10a6:20b:42d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 21:10:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 21:10:21 +0000
Date: Mon, 24 Aug 2026 17:10:13 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 18/29] media: bcm2835-unicam: Remove frame descriptor
 workaround
Message-ID: <aoyzNT-ILKHt8Vw0@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-19-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-19-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH3PEPF000040A0.namprd05.prod.outlook.com
 (2603:10b6:518:1::51) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf2df51-f44b-48ca-616a-08df02241b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|366016|1800799024|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2x0grdfvrcWrRkGm130IU8ejD4R0T5Uhwn+wzYwar5EYWTGJWIKjA5h8aIsZ9myccp2YSD7uAEzaGgafRfcPYhzAljR+PTX2lKTeY1rRItm9R3ugdBbZtVlzoUqnAL4WZWBAP2uuB4mFzrCsx/BpD1L+xi7qTql92uGV363DtH2rwHL91Dt9R7Z8KDfZbkZDZXf2zUG7BGgCuzS2+TM01CiYdTN+2J3fJSyRl7vqGaHFr2SCBvbCUiUDuUwYbyGeCeoY0hmRKKtZDrgLaYl512Tc6zrEgFBN1Drnb4o8bast+bSKngizliJOjWaNZGD8dVTF3nNAgUrRwh3/BbRIfVmomkoocncIQnAnVAAwt0K0BwL1wIx5ti2eYau+Yf6h+rZr4esgSLlQtf0tur0af72OiktjxIqppbeDlzX7xJrlVn5Liq0p7G8zpP5qhfSpmeT7jC0bntWXHg8jWcwVznmNu1LukxdpOzeC62ca/u1oOV2oo++qsKd5f0bvD76+hKESS4qZZGBSadOyfK5N2vohKtj0mUZrJzg019JCyBNlltmsQUMKFacsHkg/8nn/yqQinaKZ3TzkUsx9tBEehEULLX4maPUx6TLqxT88Rv4qBZ5FXpkuOvPRaK2MuL/SIZS6lfmmnoeCAjdRBQviixizetfZ5uQvxRNl50YZYv8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z8I9ipX3EBzX405nbjAHH1FS9owN3tLGNBW7CL32NgMsFtl2F8JrbdUA6lCg?=
 =?us-ascii?Q?LY5qDpbKXorDmK2+u+X91LpctqP7r/TvdlngdKCSs6NDREj86rXy2tW6OCGC?=
 =?us-ascii?Q?SGEwvDehp2y26tQPq383oom4UB1ElLmuXLjTmBaGhtmBsI7cl9VhMS3IAXzg?=
 =?us-ascii?Q?k6DjuNZolguxiX4cBw1rgSdJLzqaPyqrdI2vJ1oeP59NoePeh8RcJwVTIEls?=
 =?us-ascii?Q?4nEZthDWCbChGQekSVG1/DJJFRY2xa2+4V/RZLFAypk0+RlBN60yYZDXJtfV?=
 =?us-ascii?Q?aG5ilcCqObyjAVAN7aWvLLoQCBi8L7+b9v585AK6QfsCU2k5YBUyT0JVAhac?=
 =?us-ascii?Q?HieO3PTYWOrY2D31wWjduUJEuhCbv3OlJD9sUWP7BNfaMqPAUykn7L9G5JT7?=
 =?us-ascii?Q?/1oMQ030PlljISuIRceiy0wLSZGoEAuk4+IeEQSrG2XbLrEuqp29WHGb8rAv?=
 =?us-ascii?Q?h5vC2FTZJeq4k3sZ3Em+rrBAN1pwxaBw01N3eikiLMVTEiKoNjPwkqXKWWnI?=
 =?us-ascii?Q?vqrPg79eeOSHs91x2VajNOQfiNLPArGrn3tpmxhGuI0DmfuntCnOyEgip8s/?=
 =?us-ascii?Q?vUxw8LOpcyUUSpJKJ217n97Pet10fWtisy8GxKcfunzhRsmLLifIHcp0lbr+?=
 =?us-ascii?Q?9E90tXjUTIkVGSvXu7gMGtU9igF24TI65EPFe+5BC7/9iFxVHkq22dToxKIu?=
 =?us-ascii?Q?z2uhL95QKuXn+B4g8Zrv/QCOVJ6ehbFy6qGfdccCFbDOHjLuMwKVMZFph/RU?=
 =?us-ascii?Q?oJOAUdAytkfUqzijms6fulQkkiUmCdcY6TGN+8CRtDtD6s8TIeVOsPweAhCc?=
 =?us-ascii?Q?Zo+qPWF19zqFcmTHFDuZyxT7Wk7s71OQ+8XrYG/+wdeBE/0SdHdlWlcYzedY?=
 =?us-ascii?Q?zDoHGRzDTG4KtdXnx7ZkAiJRVWBhAmum86YWctb7sTULA8DKIlRx/rQNgLcf?=
 =?us-ascii?Q?s3nwiV0RUevWAcz+UezY3IbAYGrc/D8MY5Z0OjncbLx2BYqvwWA6EH/Fq8WP?=
 =?us-ascii?Q?cWVEbbCJTHgkJDyXlTJVb2LSXvDkUEzmqvKHwVeCmcf6rpmtkkuNoWS+4Y02?=
 =?us-ascii?Q?R1w1fIJwKQ411vjkykED1t9Wc/Kj0LWnA/MuAP4c628ji+qaUyqjM7XUUJRQ?=
 =?us-ascii?Q?SeznuDVIOG9FHH5I+ImceCfD1ZSMNpMp5kjA3n/bY/TrRHz6pJ1jXfuHjDWy?=
 =?us-ascii?Q?Gm8o0TcrXPSkuOQfCNI8ochSG3hqZ2A+mpGnco71QBE2VOGsTBdbeJ42jaVU?=
 =?us-ascii?Q?kUh3u4H5HO9hIFmpruGj2FrdlVnmifEUrKH89iwyQ9Mqd7HgA+eIu0LLYVeR?=
 =?us-ascii?Q?RPtTK86qYKF3so2LnrN6plHEWnsWO6rRyfPSozhrQyxWgpW64G5LNMHEnzFF?=
 =?us-ascii?Q?Z9WJa9bm9RO0UIuovuvXCcF147hBcWBTMSlsW2eWfN/Bov2Qionhpi+c1RC1?=
 =?us-ascii?Q?wKN1+i5m0I9b+MyCiUm1UCIfBQBERMpk9VY2eBXh9BQRS/LKdnCpOGRzfDSO?=
 =?us-ascii?Q?nPmCRnw7bwpO9eScQkMqE8ozyNpkprTBXnRGceOtVqrmr/S5jYDTFKjL2How?=
 =?us-ascii?Q?SlAE2N5Dof2X1GdVaRTXM471reQYmy9aZMm8GeS+4oRXR4OJHNn+4nax7Nza?=
 =?us-ascii?Q?cfJ2jY80+tiSJ2IaoNOnhxgTQwML0lQtpZbZ7fXtIi1MBh+DTcHeG0OtI8J0?=
 =?us-ascii?Q?eh0FZibZ9KQ6+M2V7wusxPR918KJv0cMMaulRmtFUTQNzjB2MqFQUJIT5gxu?=
 =?us-ascii?Q?vVcsN1P72vV3oxDyQCdHaWgsSSbg+FJ/77+7zZDymBrlzznOO6oI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf2df51-f44b-48ca-616a-08df02241b37
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 21:10:21.0197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVfgXfyJv2B5ERW+s18vwo+IqZTcQdTnqLQE8BNQKyeSbm6YOBtCc1jP/N3BjjX5qv8l6jzaWHEhzOdZO3bQuWsNmjLZqwHkdGSrW6D0hCDzh/gKu0dqnigEX83w56ta
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8962

On Mon, Aug 24, 2026 at 03:14:40PM +0300, Sakari Ailus wrote:
> As the v4l2_subdev_get_frame_desc() either returns a frame descriptor or
> returns an error, remove the workaround for drivers that didn't implement
> the get_frame_desc() pad op. Also handle v4l2_subdev_get_frame_desc()
> errors.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/platform/broadcom/bcm2835-unicam.c  | 26 +++++++++----------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 2322d3df3915..ba613966c333 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -918,8 +918,8 @@ static int unicam_get_image_vc_dt(struct unicam_device *unicam,
>  	return -EINVAL;
>  }
>
> -static void unicam_start_rx(struct unicam_device *unicam,
> -			    struct v4l2_subdev_state *state)
> +static int unicam_start_rx(struct unicam_device *unicam,
> +			   struct v4l2_subdev_state *state)
>  {
>  	struct unicam_node *node = &unicam->node[UNICAM_IMAGE_NODE];
>  	const struct unicam_format_info *fmtinfo;
> @@ -933,7 +933,11 @@ static void unicam_start_rx(struct unicam_device *unicam,
>  	fmtinfo = unicam_find_format_by_code(fmt->code,
>  					     UNICAM_SD_PAD_SOURCE_IMAGE);
>  	if (WARN_ON(!fmtinfo))
> -		return;
> +		return -EINVAL;
> +
> +	ret = unicam_get_image_vc_dt(unicam, state, &vc, &dt);
> +	if (ret)
> +		return ret;
>
>  	/*
>  	 * Enable lane clocks. The register is structured as follows:
> @@ -1090,16 +1094,6 @@ static void unicam_start_rx(struct unicam_device *unicam,
>  	unicam_wr_dma_addr(node, node->cur_frm);
>  	unicam_set_packing_config(unicam, fmtinfo);
>
> -	ret = unicam_get_image_vc_dt(unicam, state, &vc, &dt);
> -	if (ret) {
> -		/*
> -		 * If the source doesn't support frame descriptors, default to
> -		 * VC 0 and use the DT corresponding to the format.
> -		 */
> -		vc = 0;
> -		dt = fmtinfo->csi_dt;
> -	}
> -

look likes vc=0, dt=0 change in patch 17 should be in this patch?

Frank

>  	unicam_cfg_image_id(unicam, vc, dt);
>
>  	val = unicam_reg_read(unicam, UNICAM_MISC);
> @@ -1118,6 +1112,8 @@ static void unicam_start_rx(struct unicam_device *unicam,
>  	 * sync correctly to the FS from the source.
>  	 */
>  	unicam_reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_TFC);
> +
> +	return 0;
>  }
>
>  static void unicam_start_metadata(struct unicam_device *unicam)
> @@ -1427,7 +1423,9 @@ static int unicam_sd_enable_streams(struct v4l2_subdev *sd,
>  			unicam_start_metadata(unicam);
>
>  		unicam->frame_started = false;
> -		unicam_start_rx(unicam, state);
> +		ret = unicam_start_rx(unicam, state);
> +		if (ret)
> +			return ret;
>  	}
>
>  	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
> --
> 2.47.3
>
