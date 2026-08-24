Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013067.outbound.protection.outlook.com [40.107.159.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512603909B3
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 21:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787606048; cv=fail; b=fgUBHFwa5NzY/zFWGDvSFL/ea3DTf9nukhT7NlU+EiQsU726q2Sl9ENCyvGOmO2Y2Bl7yqDZXTb3cYN3SSr/coJkV7UaqI/8s1f09yzUylfsySeBL1HT/VNWmxJnrZZkHqjNOJlMBws37Z8bWdQaZWW1En9AM4jfNabyGQeZzI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787606048; c=relaxed/simple;
	bh=H9nzEn1T/OsZbE/Mfj/aJ8fzsRqTx3spRP7OEWZkJS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B8mSLP9WGV3Qu9V8xwgObWwMLNRbF/dQV1lar6XFn2CoaJN6qxOn2Klryv1y8unmeIe9wPq9IyDc4Bj1HW4CvjGOrTXNtDmfc+E0hoYgBhVuuhO9YmJnbhjLt+4CA/hKpXINK+CAbryg2RVZ7NXYc361GloEuvxGPkXasnVATO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wBdbrUgB; arc=fail smtp.client-ip=40.107.159.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wBdbrUgB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUy1sVJcWGmA2qJ2bwJAeOd7hyCNJnYfO7aghNduwcZOXb6ijqDcAv+o4HF/GS87oX1naH66DtBXSLP19fOqTEfnGNeBbJ9qTeXxQK0QJ1NcisKMr2P53ivFLZTqtamXi96jZ90veByNKX67rTp5ZIwbPheE9CnsliWlo5TKdP2BaBbNTZLRWOTBwZoDwsN/BJyMNC1oWJMD8H/uV1j4QYNqzjSQJWGEWzEoKuYPUPCcN46YXe42BGwP5AqPFbL6hDePNIrkPLWR6Mbk6G1KH0L5EFnUBqj5lAudNv2ArTke3etnqtbyplkO7SFTZBkuIRgAcvhwFiXYQiTn+iUlsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/BnSwMOTmGJPwChwGb+uHOMQpqEXxHt4wjYAxk8vVs=;
 b=bwv2DpmG2Mlltgg9RgbrorJ7VLwqYwgvVm7Ku7L3SrB4ATuHxvoobfGdOEhkY33W8rtwlRESbyJzVAdYvWEe98raKoDhAYkDQqWhAWIgN8tTMF3/ZNvz665d5CMafMqglfT8N575IBu0iT2gUE2YMiZf6vwbWhTHUrZCN3Bs9AwT9TAIJwjc5058+bVV0LolMmm44m8LA1eqtHtAF2kL+gljLUrCX+/m5OqSArEnf6dFZuRB029EYGJe6+yi3I+LrXrkv8iRyKeBsmZaXHh/LEfxz5Ww65ZkwxTYIMqgwVWV8Y44MzC1ztgVwTA+uCMx2krSOs+Tq+DhkRHZRMgE6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/BnSwMOTmGJPwChwGb+uHOMQpqEXxHt4wjYAxk8vVs=;
 b=wBdbrUgBVPlH/I9TgmHDBNHVBv4O/KR3mA/EIY44CVnoSoQ7iasOu9uXBONHME4N6DZxvmR9E0m6RUToR7+SjE3m3dV9hir9M4Mc4O+J+4mTOL+lcoFMbi4VoRQIh4lJcurxMcN9ptadhGXO8RSGXOwuaqQPzGDiXNaHbq4KNEak6q81JmeNHEIXRjCce3N+IONay1IwyZKmqgTfWlB9fqqMW9oN1Lv8mNyaf4L32uqpkPqz/4oz0d327vpstmbRuk1je93rtcbd+Qm5X5rUvwV0mmgXFdAqTJh+WBnISlUlHSxSBXeHbLRMMF46SOCB6aClgcqv3SAFlPE1wb/B6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8085.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 21:14:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 21:14:04 +0000
Date: Mon, 24 Aug 2026 17:13:51 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 22/29] media: rkisp1: Use v4l2_subdev_get_frame_desc()
Message-ID: <aoy0D4eZ1PIj3RKQ@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-23-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-23-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SA1P222CA0080.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d06344e-9b6e-4b8a-6402-08df0224a065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	leX89cPfsXKpgH915yCmK5chZzdomKVTUYr37YbOVMN6DxM7xwcBP2gBJpBfAyfnorUs3Ncs9Nk9NDDZdRBJrdw5/odLzQ7UvTIT4Oi7mXpQYhXJODj8BVPmsuuTGB/LO27xnVieZTVUrr/ZFqTuu53/swoR/IoKYGEhtcWWzPcENhVglpmxWupcBgUc7qwIDMHAX45kwecgnpWt0+KusQlynqBD41ygaqqNa/EMlTza3P7zAni33XWbzW8YZTJvk6YbvkR++wvt5I3UmuqGFM8x/acERbnf0wIo+E0uf0oZoIU6RmNj1UICUM4khk7KXWJb0JnaJj3JLANPrc1YXcfcz6prmCcUbStPYgP0wIFvIdK0vdvSmMwVJ2UO6kEtKtiXaA8r0DWWaQWXISnej2EmXfwMscp5c0krKdZJcDRVELVOnKgFHlbGRp9B/5hejZbk6xXNeMd74GSz7oYUQITYlkXNYt3kXJzuiijSslA6MZYINIy2F69KokbdV3bOIFojJXIs8v0/cg9ZcPfU6YF1e9HgHtsYGPXmkLfRhbuw00nvjZSngmXWk9/ENdzzib2K+SB6OFfyehkg/38etRP9umAz4m2l5lN0mChvL2KeCTHd8gw6MLv2o6hXBWLsLJPCffJhYBSWZlrEES3RZa8zbOi01Vn3dVuvhme+2l0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wnh0u5lqSeIZKIl5NFXHAPj6t/HYjCL4cDcRrKe+27ffbqyWd730Rjg6sYqE?=
 =?us-ascii?Q?A6Xw59f4oEaIB2ZtYZoyWG99+SuUcNRgoaYavsJnsCMIfBroJHBxKkbTp/ez?=
 =?us-ascii?Q?2sPz35GD+nDClVuQ/rL/Ret5806XecAGyBiFgU6F/n4PUSzc4aftVTn6tO0I?=
 =?us-ascii?Q?izDB3OnRPjHzt95RYsy3fnU8U7Z5YEJC8n0P3t3u6hKjukhbIWCNYvYUe7zw?=
 =?us-ascii?Q?MY2bMqO1MpqrNHEYShEnP03I2ltNQhtg7u/nZGdviYgwg92unHTWG712xXSQ?=
 =?us-ascii?Q?+IkIEwo1kZxpVIQGKCAMv6YIwywdlIkfA6Nz8QALOdYIgI6EayP9lWOXrXs6?=
 =?us-ascii?Q?zIfrFcZlzHTXDA/e/Tef5l5jWh28BUjB8v64dGtl1tMESqZ95oNqyXFxyu0o?=
 =?us-ascii?Q?nCbwgb6uuaonpZwj0SZAua1aIvBnLTVhx5xLUYiy4qxTruoJ0IXszul7Fac5?=
 =?us-ascii?Q?x0BrswGtbCNOr5kkI0Sz0szPNsBKAvHPnEC0ffSV2FDr+cSDJYEv7QLUQO1V?=
 =?us-ascii?Q?hzXRn++TjI+cworoE8O+2V3aoU2JqSo0ynAF+/AkKz+BszZtGvHfruTOVJ/O?=
 =?us-ascii?Q?Fu0DhlaVj5ruo2U7n4dUh8tBOpDXXPYWwyyJE1B14jFWF8AV44Xxze9myUD6?=
 =?us-ascii?Q?TdGqP0G1DgFD2GsmEWwM2R0F9iAbp9WIK/1dwTrz5LVwkfahuwZsa6euuwJg?=
 =?us-ascii?Q?ziLdddqYaknNkZw4eJ5eXLaAvE5K5L6z4DSTb0Ebj5jBpZn4MvFOvPU6tqY2?=
 =?us-ascii?Q?VxSyOQ8ISCXuV1qNHOOZK0CdpxorzTpjmwwSuhZarbl9Sr1fh45dJVE4ycbV?=
 =?us-ascii?Q?rTqcuKGZ5Yn7psEN5HRJ2ZmeC3KemNQn+2Ba71RwgoxbqVoMqypx+zZ6iWOy?=
 =?us-ascii?Q?xqkv6OMbQzT84A6uMXYi+q864axLKvowuHLTq3pFzpnbEn6VQdDVzAJr5ZLU?=
 =?us-ascii?Q?I09UbPedU0UZqor2gY12oPxbH9x5uJgA6DnuJxA2MZbluEWk5XUmSa7W+HJd?=
 =?us-ascii?Q?mIlR6k+aFBj1613JASvn6+vNT39+y5L1UyVzMVv5CqKZzleRRD1Zi6f2Makg?=
 =?us-ascii?Q?s3ozbvSx/zayqKd+BxfpkuqKeu3a+eA0CIfjzdgTTT7RtuD4iVUhtKiwfhbi?=
 =?us-ascii?Q?tCzGYElkq1HJsAERG6CkM8D1fmXhE/SZ8fMMqk94jXQ+HJYO7+nhPM/EJ6NB?=
 =?us-ascii?Q?w6qMSB844MRZGjrXQ/Tn6pbeUMinrI7hy4z3H5/41JGs5svYPjll/Y1LSBhI?=
 =?us-ascii?Q?yBr3E63cmpkBMhtW+3zwsa47Y0x7tYcFoa0kMy1tNB2T+KmvIShbuyBgewrT?=
 =?us-ascii?Q?u/9WClPmZWOPh7spFh1VOjy7B10JHtSjFxkamCc3TnOQ5yQp5eQqAJLP9ykz?=
 =?us-ascii?Q?vRPxuak4cD9paa6i2WpASjcJr3xDnwHNwm0q+tsbVss2/WUYkkanhF8u0DyF?=
 =?us-ascii?Q?hpLhRjcrgpd8QUkk4OyW+53BPQjHBw0LLstlrjLM37qOhsBnpbAx+hlJw/O4?=
 =?us-ascii?Q?i/N2qC6XY47sOGpTlf6U2I7Aqr0stoDBREeZ6RwGffGbPe28hutg3vjXm6Ai?=
 =?us-ascii?Q?A7zRQ7tj/rX0O58qfJxvwVXxb51lWYQbamEZt+4ZHYs7qC96Tg+jhU1Sdd9j?=
 =?us-ascii?Q?pgphrSdyys+7abkxgMlu/ZiwZzEr3fgV2klTskIbcvIq5RyoO7TXGgunVoAr?=
 =?us-ascii?Q?QAOGppIquPJWOdGN8/5juU9NBEIdqF1FErsxKDyuhpHWxth/Gv57pfyagjj2?=
 =?us-ascii?Q?3tay2Xc8UN9UINnUlVMyvE0RLf073C8xIPIMtQ5KlT0lil0QR0aw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d06344e-9b6e-4b8a-6402-08df0224a065
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 21:14:04.5543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmYaxBHtvIY5VzzuHit1/n5KOHg1xkbSAT+EgSRhgkuDLgOYJJhx/3rmSC0YmSmOMLYEnJtjdXOQNByTpgmYcEBQtuJyMI4lb9pQ+dKs8vHpXsCiYjfQlDya/MDan1pk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8085

On Mon, Aug 24, 2026 at 03:14:44PM +0300, Sakari Ailus wrote:
> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 21 ++++++++++---------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 2311672cedb1..eb8e881759f7 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -8,6 +8,7 @@
>   * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/iopoll.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> @@ -87,11 +88,9 @@ static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
>  				struct media_pad *source)
>  {
>  	struct v4l2_subdev *source_sd;
> -	struct v4l2_mbus_frame_desc fd;
>  	unsigned int dt;
>  	u32 mask;
>  	u32 val;
> -	int ret;
>
>  	/*
>  	 * Configure and enable the gasket with the CSI-2 data type. Set the
> @@ -101,22 +100,24 @@ static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
>  	 */
>
>  	source_sd = media_entity_to_v4l2_subdev(source->entity);
> -	ret = v4l2_subdev_call(source_sd, pad, get_frame_desc,
> -			       source->index, &fd);
> -	if (ret) {
> +
> +	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
> +		v4l2_subdev_get_frame_desc(source_sd, source->index,
> +					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
> +	if (IS_ERR(fd)) {
>  		dev_err(rkisp1->dev,
> -			"failed to get frame descriptor from '%s':%u: %d\n",
> -			source_sd->name, 0, ret);
> -		return ret;
> +			"failed to get frame descriptor from '%s':%u: %pe\n",
> +			source_sd->name, 0, fd);
> +		return PTR_ERR(fd);
>  	}
>
> -	if (fd.num_entries != 1) {
> +	if (fd->num_entries != 1) {
>  		dev_err(rkisp1->dev, "invalid frame descriptor for '%s':%u\n",
>  			source_sd->name, 0);
>  		return -EINVAL;
>  	}
>
> -	dt = fd.entry[0].bus.csi2.dt;
> +	dt = fd->entry[0].bus.csi2.dt;
>
>  	if (rkisp1->gasket_id == 0) {
>  		mask = ISP_DEWARP_CONTROL_MIPI_CSI1_HS_POLARITY
> --
> 2.47.3
>
