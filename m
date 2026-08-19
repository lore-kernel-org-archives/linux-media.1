Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467453BFAEF;
	Wed, 19 Aug 2026 16:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158613; cv=fail; b=gmUCERYiKa3AWAFJ4pBZgNLlXZfUhadUpW68rPZ7qnHpqlpQ7kM8uWzkKQZyFoQcgEyt5VG9Zqn5xtl2mEiFJRzT3e8FKvtxclVScORBDwzesySUxvd0ZX9NgxekuyCuHPKBO3Dcc56Kx5kfoDhmqSdY313Vu5Vm9XkhdRHW7DY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158613; c=relaxed/simple;
	bh=NH1T+KHzRSqBZgk1T/XRmsli4kL5Kv0proYRe14gLgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O7Pvvv7KL6bGFtM/1hxGQ3/7hY65Ru8vn2uEjIoY5LOWQqimkgtkdkpl03oAsfR/f3z1Z4Z5xvj6ekll8LGxuvPQRMB0LQqftAnLrr+Q7XeDehpHtKhD9chgs+EXZJ1RSPSzg0p2R5HQDjK7ufI4FH4mCaCVqX28X7wZFSdUCIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=k0GdovvC; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="k0GdovvC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrOP2KFXg/u70/Lj9HQbzH2Orct3yzeGy3FIkWqAAx/UowBoJgylKct/04PcH3BfY9RPr6SBAkMGU5xTxNfM0rSw9M5S1b27IaTzq4zBnvqWNt8F30vRqqPmdGccGiw6fk7fua7iP1kxocsd/C1YyaxoYbCuZwAd0GWIk1uqUGlYiuVTxudfH0/YmFB2pqsn3OJLBuW84tnh4symZL85llLEDYeknho9LLwG8CNI2ioGq4lS/3OBdqtGTjO/IxuoKIv/ZdjllWtsldxWymM197PBpZUYZI7/30znAaGsZT2092//bGPHZ80GlmMFWAe2Bivvbo7lPCLE/VKMrZ78MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efDIOIf3mjthHTHBODGrvUNWG+m7dB76U/PWuFmMTzY=;
 b=MDeGN8cqOb20LrMUDjBbhiTAJtfm/CtTllegAqFa/kB68kbu9LqjS3SA4LZuGF9QcE1W5CPpa79bZfVVxxwu5CQKYYmjseSrCrPS1G8mzDuCk2S722ajoApWqe+et1cYwnGJwSShUDfObx5wO0STbxNASf6NR0jVxpbfbh1jFiIunWjcuwvOmKKjE3+t7zUN3vWS3+3T2qHlgiw0v7iEFx8KI0YkldQo3EMYDf880JYcBgacZPhlZPbinmbB9j9s3999/dEkLi4hZE756eFPVernOTvYw6fXmNt/jbDkW5fQswif54KTYff8Xo7KN3TI727zl1J4dLtTynPIcF73wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efDIOIf3mjthHTHBODGrvUNWG+m7dB76U/PWuFmMTzY=;
 b=k0GdovvCzFBP809aBbsVDdX6MDlSqtycgHAhAPpy+isqIhFVCuMVPrwO4iTcR7ti0b4HP10p4R7OgEB4MoY8EpNvckGzkpDMUSKQrQsa1G+VSl9P4wYeo81OuVTfW6r3JKQmZI5cxdBbD5Om7td+9h++spxQG++/U3gU0IVbWsZNJOIb0QEUA0brHIKTjifAWjAIvz/+tEwOFL4XRS+Pw3FBuU6gtByHy7TqFsExxIX5jtgr3H4dny0myVcpwVVtP5zbSYLKtwoNCzdE4Z7WcdaZqpTPJKoW3Z//01lSgZtcIpFDr4V2CsOjT1zNLCAhqFatnkgfAy0c/uOCcKtVMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB6888.eurprd04.prod.outlook.com (2603:10a6:20b:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 16:56:47 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 16:56:47 +0000
Date: Wed, 19 Aug 2026 12:56:40 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Michail Tatas <michail.tatas@gmail.com>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: verisilicon: rockchip: Fix leaks in init
Message-ID: <aoXgSKnkbWZVKRui@lizhi-Precision-Tower-5810>
References: <aoV3LLy5hSoKL4QP@michalis-linux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoV3LLy5hSoKL4QP@michalis-linux>
X-ClientProxiedBy: PH7P221CA0010.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2dc087-2639-4088-cdcc-08defe12db57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|19092799006|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oZ8Xud8rVigVYvJ3SlTMJi7a4PMgCgDKuxSOH1ymlQUYcvF790RE+kN5nj7Q/56yCt7MHg5XEQiMG6YJKUWjiRK+TkL62FIHeJGLry80P8jM3m55i75Jcs1pxKyiV4+Seo/KJ/SzlY9CEcrm3Bxv94eanqjF1l5Fpot+3mbkkjZkt29hvYimz1XuNhSrbmXV8wLBYuJPwm1AnLiPizwYu9HN56ADSqdyO+bkdviOEXb3ilq8Lr4WVrU1+KvH3QUfbDgsGxhNOujoQGXN7oL9Ki021eQ+Iw/6i/tYz/O11yKXcJATSCTeFM+nC26gC3xevFagMhBbLzArFex7Mquh3tM7zEOdXjXin6LZj+e5B2AmFae8/imODE5XFAq3ldo4c+ia7fS/t73fwSu0gXwZfH4GCTp2YfovZaISevYk8ySM/lgRo9Ojtz+NJ8Ii5vhvcv2vP8jYGdXyxolduYg95Ue/Ih7DWkEntX5UzSIQ4AyXW7zBFd2fUOT0a1WX6VA+iKtr6TzbOn/4rD8s1H1LMl3wctSz0XzbFfp0KHmVD5plJe0d53vhEMRYX6b4IW0nZ9nPNa7MeZLjMrJeeebOSSyKZI+OzCPovRnOI3r8We19WD/K+tG54JDyyk2CHWeotq+dkwxU3bJbcDEzxYFGU63IFtb0NQQFvHy3YThfLrQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(19092799006)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?78ySZUOBqKiUzR9wxKUhYY8fjpCtIAYMwKoYqU/ezpUEUc6zmmSFFIkwZIkb?=
 =?us-ascii?Q?bL4K2EQW0TYQ/HKl6e2LsAzw0L0UW83yV6TwMC433j/duw9dBAClcl+a+ycG?=
 =?us-ascii?Q?VGBDjOdabiBCzqxGVKReks7nI7610CUoYrc9VEeCO363LAOyYEsWB3Zo8tKK?=
 =?us-ascii?Q?SNCKXtP7x+3Y0BoYzrzJqIsqwLb5uehR+z1fECnugYvR0ybEHH/EDfgGcmB9?=
 =?us-ascii?Q?dLIexCnFRn2AKesZwNnXzTO36tk7CRI/sTCWu8VAoeaOyKYI7+DWHRXrLCLu?=
 =?us-ascii?Q?kdiKR2dCrG/fgmlYNsTSRlsMvwATFfTtKWIng4cAxyVRjA2TS/0hfhXhZyMV?=
 =?us-ascii?Q?aqiTZt6IovHoHt1j3ySEHl8Gw/G2ospw3RVcC/hYJHpXHhXAoOeImSd7E+zT?=
 =?us-ascii?Q?IwMX8uqRRVhSg10kcU9TLADv7GetvJzJucocPM2nZfo1PdiIWatXfPZw2Rme?=
 =?us-ascii?Q?Pi20bpOHdWnRWz7CdTje9Kptkhn5zq8vQDixBUQwwu2z4k7zGkjUzI4kTQOb?=
 =?us-ascii?Q?P88h362Z4DzlgOkErLhgIH5FqYGG7LxdKIuwsTVCikXDiqumf2c0A81n5NUz?=
 =?us-ascii?Q?9jrXIpmrMPlmipT/2h/wsPyv8pSflnx8kUdGhCNtqVqVbUvaExPxYcPY4rUY?=
 =?us-ascii?Q?b1WwEDujPC+3hElIbRQoo7JVgMATEhAQ0DQOU95sOI07ZfeS3BB9G6O7F1ns?=
 =?us-ascii?Q?zM6h14LM5dzBn0glHvr4lASFB01t2vPQTZIy0GWE5YwI5mIY+lAlHDFl7gNU?=
 =?us-ascii?Q?3rVV6Gtjr46NrLkRGpdkYdToU4viV8cVB0+wMRqAGvoQTM9p/qw0cAuCWYJ8?=
 =?us-ascii?Q?ay7KfVKENVgs8gfbOnAv4dYHzgRTD7CTeOHNz1RBx/iDwBqo+vO1cq8eBY5u?=
 =?us-ascii?Q?9QAGZOSMQwfIKpsaj03tnCuJQQNv18uQv9YhgYhL+TYOMg4y1yTkravgj7LX?=
 =?us-ascii?Q?dNptSv+n9zcr2jI8XorlZ9fwb2K09set3GQiJLudnhUPGcZ0+AeiBhhDjbuI?=
 =?us-ascii?Q?zXheuY2Tke6Krv+HQ0k7fYwpC5EXlZf/Bd3KGFFSd9Uy5MqrMU4xhX/INCqG?=
 =?us-ascii?Q?00r+EFMMr9Y8vtUPe0JbwnYmwRWQIY+wF23FS8dlChkHgqfMTjo5E78wfXj7?=
 =?us-ascii?Q?wrwbAMhrBBtdbZcSCM5E8EdWbw8CvzYkeHH0Yoy9jYVVAAf0Q7SEkpylZmfG?=
 =?us-ascii?Q?jI/LhM409CKvv7FSa4k5TUb/SXgMP7bhKyujSxgVoQ/z7FQjrjcYecVx6Pg3?=
 =?us-ascii?Q?O97uKFTTL9d0bC6Z0AT3V5ZxrRCqU0Edaanmb4QbZ01fDVtAdjTudnGoqjFd?=
 =?us-ascii?Q?7S6OGYMMfUjgLxycY8np1w7VAKqBPY2jAQ23XpMg0hnA2FGRHrAmeA8LVl5q?=
 =?us-ascii?Q?ake9xYVP+2B0cnzSpLN2mjSUPAKMUO2RdwIKWxqjz4YJ1ULVEAf2WKdTeihb?=
 =?us-ascii?Q?KZc57AmncoPxXXmMiqVDszi9r5WyniwREiSRtKgSWJ37fyZK+Lv3ylvE7oJZ?=
 =?us-ascii?Q?Z8OW0Atmm/KKNAC8hK4HMdl3ZN1BeDgKiXKhDlpTJSM3fSRg2VEs0wx9UMEe?=
 =?us-ascii?Q?7Ro26r7gpjAeWYjgkoYixkW+7g9URan9zPEY9xp8sEQBl/RHUeaHjG9RHP0m?=
 =?us-ascii?Q?4qeLQd449G3WpKn5nst7zyE3859x1zopR7B36xKKMfqGFPoTSpn4ZDUjRhlx?=
 =?us-ascii?Q?IxhUt2Ic1OmxloUOL7o2k73v8D2uej2PLaBN+hF18MmeK91AbLwr0krDpljL?=
 =?us-ascii?Q?uX2Ud23HdoE5EYTbvUIPDiTjda1qd3RFViWsIinH9NHlqErdbKB1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2dc087-2639-4088-cdcc-08defe12db57
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 16:56:47.7657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mq0oY8C0XcuxRxKY32onYPxYBseNlUueCjlXKJk3vb524DJytLzUSm9cxRSbe6w+TZ99n070VYMytvkWqYXwIYhmJ/bRuSGaUcTuJAsSZwiuCnoPymgzGEH8xSK+K8DH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6888

On Wed, Aug 19, 2026 at 12:28:12PM +0300, Michail Tatas wrote:
> if one of the dma_alloc_coherent in the init fucntion fails then
> the previously allocated ones leak.
>
> Fix by freeing them in the error path.
>
> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
> ---
>  .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 68 +++++++++++++++----
>  1 file changed, 55 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index e4e21ad37323..fa77fd402412 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -369,6 +369,7 @@ void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx)
>
>  int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
>  {
> +	int ret = 0;
>  	struct hantro_dev *vpu = ctx->dev;
>  	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
>
> @@ -377,39 +378,54 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
>  	av1_dec->global_model.cpu = dma_alloc_coherent(vpu->dev, GLOBAL_MODEL_SIZE,
>  						       &av1_dec->global_model.dma,
>  						       GFP_KERNEL);
> -	if (!av1_dec->global_model.cpu)
> -		return -ENOMEM;
> +	if (!av1_dec->global_model.cpu) {
> +		ret = -ENOMEM;
> +		goto global_model_cpu_err;
> +	}
> +
>  	av1_dec->global_model.size = GLOBAL_MODEL_SIZE;
>
>  	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_SIZE,
>  						    &av1_dec->tile_info.dma,
>  						    GFP_KERNEL);
> -	if (!av1_dec->tile_info.cpu)
> -		return -ENOMEM;
> +	if (!av1_dec->tile_info.cpu) {
> +		ret = -ENOMEM;
> +		goto tile_info_cpu_err;
> +	}
> +

This function is called by hantro_probe() if I am correct

there are dmam_alloc_coherent(), use dmam_alloc_coherent() will simple
error handle and tear down.

Frank

>  	av1_dec->tile_info.size = AV1_TILE_INFO_SIZE;
>
>  	av1_dec->film_grain.cpu = dma_alloc_coherent(vpu->dev,
>  						     ALIGN(sizeof(struct rockchip_av1_film_grain), 2048),
>  						     &av1_dec->film_grain.dma,
>  						     GFP_KERNEL);
> -	if (!av1_dec->film_grain.cpu)
> -		return -ENOMEM;
> +	if (!av1_dec->film_grain.cpu) {
> +		ret = -ENOMEM;
> +		goto film_grain_cpu_err;
> +	}
> +
>  	av1_dec->film_grain.size = ALIGN(sizeof(struct rockchip_av1_film_grain), 2048);
>
>  	av1_dec->prob_tbl.cpu = dma_alloc_coherent(vpu->dev,
>  						   ALIGN(sizeof(struct av1cdfs), 2048),
>  						   &av1_dec->prob_tbl.dma,
>  						   GFP_KERNEL);
> -	if (!av1_dec->prob_tbl.cpu)
> -		return -ENOMEM;
> +	if (!av1_dec->prob_tbl.cpu) {
> +		ret = -ENOMEM;
> +		goto prob_tbl_cpu_err;
> +	}
> +
>  	av1_dec->prob_tbl.size = ALIGN(sizeof(struct av1cdfs), 2048);
>
>  	av1_dec->prob_tbl_out.cpu = dma_alloc_coherent(vpu->dev,
>  						       ALIGN(sizeof(struct av1cdfs), 2048),
>  						       &av1_dec->prob_tbl_out.dma,
>  						       GFP_KERNEL);
> -	if (!av1_dec->prob_tbl_out.cpu)
> -		return -ENOMEM;
> +	if (!av1_dec->prob_tbl_out.cpu) {
> +		ret = -ENOMEM;
> +		goto prob_tbl_out_cpu_err;
> +	}
> +
>  	av1_dec->prob_tbl_out.size = ALIGN(sizeof(struct av1cdfs), 2048);
>  	av1_dec->cdfs = &av1_dec->default_cdfs;
>  	av1_dec->cdfs_ndvc = &av1_dec->default_cdfs_ndvc;
> @@ -420,11 +436,37 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
>  						   AV1_TILE_SIZE,
>  						   &av1_dec->tile_buf.dma,
>  						   GFP_KERNEL);
> -	if (!av1_dec->tile_buf.cpu)
> -		return -ENOMEM;
> +	if (!av1_dec->tile_buf.cpu) {
> +		ret = -ENOMEM;
> +		goto tile_buf_cpu_err;
> +	}
> +
>  	av1_dec->tile_buf.size = AV1_TILE_SIZE;
>
> -	return 0;
> +	return ret;
> +
> +tile_buf_cpu_err:
> +	dma_free_coherent(vpu->dev, av1_dec->prob_tbl_out.size,
> +			  av1_dec->prob_tbl_out.cpu,
> +			  av1_dec->prob_tbl_out.dma);
> +prob_tbl_out_cpu_err:
> +	dma_free_coherent(vpu->dev, av1_dec->prob_tbl.size,
> +			  av1_dec->prob_tbl.cpu,
> +			  av1_dec->prob_tbl.dma);
> +prob_tbl_cpu_err:
> +	dma_free_coherent(vpu->dev, av1_dec->film_grain.size,
> +			  av1_dec->film_grain.cpu,
> +			  av1_dec->film_grain.dma);
> +film_grain_cpu_err:
> +	dma_free_coherent(vpu->dev, av1_dec->tile_info.size,
> +			  av1_dec->tile_info.cpu,
> +			  av1_dec->tile_info.dma);
> +tile_info_cpu_err:
> +	dma_free_coherent(vpu->dev, av1_dec->global_model.size,
> +			  av1_dec->global_model.cpu,
> +			  av1_dec->global_model.dma);
> +global_model_cpu_err:
> +	return ret;
>  }
>
>  static int rockchip_vpu981_av1_dec_prepare_run(struct hantro_ctx *ctx)
> --
> 2.43.0
>
