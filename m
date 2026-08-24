Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7215F2BEC52
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 20:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787604440; cv=fail; b=jqfakuTA8dwQT9H2B/ewXvW8rRHVer17XHO3yrUmgQ1PsqKtQ3NXP4XCndYK1QV2ScaqIPzEvp+rT3MyDooO9Eq+IsLxiXiwDq9bGh/4hYtwzoBdUaVnKnd3twE0nhJH+vCN1XDxMc++bKKtDJK7QsmHH//XxbxarHC956WirIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787604440; c=relaxed/simple;
	bh=IDkPnyXCyJMhHCu6SZS3dl6kJIbUmH5MzR+gG6gi09A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eVsTlykcYPL8gRWO+y15Rt/dhw6w2oGx8XCkOeW0BQpNscZbiJwbQtbVAF/h1U6cvMsj7eHVXLt7m8c9+3Zye+QSLLj6+JuFA5SNwzwWcJAGm99j++hqlfhIz7LWUfkzpFAPdguAoe6jNQivmpwNARI31e6X7xHFyZOh8VXIWPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NH6rJI8P; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NH6rJI8P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFnFGpveAFEvDhdrAEDqCwAxjS1jDfEPOnQhathCkHW7lZrZHFr+cIdGMA0oz+9ZVVOifOfkJwWRpb8OCe0W7MLv1AJ1ffZs4ctescAjQHwXRctuFDsVInNMTzA1iTmPPSzQZhv1wjAR7H32eckEE7ZxxdeM/GGqSZdw2wDM0Fx6V14dfAzQAUq/1IG1v5+buyD7CJPvNq8OUy1T8aSj6eR57A8ITiM1X2y3zgz6IM3PE9KzFDRsu44O4tYUsRnAlJ/J82bHF+0Nm5+l28ixg3FIA56f9D9u4BHzGRNm01yQIhDkmTKO/LOep827mho8ptX/bKDShhk/nj5qUBpQOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/0u2ReyJspS3gLNh792m3V1pX3YLBaku+7aPZDrSGk=;
 b=fvOUIwWHb9fQbyugcLa2A3BUEQugBeEBwbTACXC+zwKPumttNL82P7P0yYrAgl1pwf5Zqs3hSZh7sCkajENKiJYaSR0/L3ShiExsUEP7A+0FivhjiXMUG7A3RTJ4CsjMLyAmYNXkg2M7xIdUnTOt9IqeQb1iGYq0goEnT979FSUCZKSm8CrejydMwbkgFuBtPhwPlvEWTLKfrpuvDlfKGnLJcE48jSoXfkRe0kuXslFzFLLtJgO8Xgai6DuNNIb92QaId1Vex+JzmR7Xy8Cz+cnnDcXN9y0JrdHoNhVmysX5mvgj1cK+bteLwRQhiDFkyDdmBfsHhNy3oKdm8qEkrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/0u2ReyJspS3gLNh792m3V1pX3YLBaku+7aPZDrSGk=;
 b=NH6rJI8PUXjEicBoY3oI0HK/TqTcSip9kc/TkojM/1KlmCwQ13RMIm5oHFvj2ItpC9kZiWUhGlUmkpWNjcH1GwsYKjyQyrNtJScazbDCUxoeJWEG3LDvBpMttLpKYW6nwTYzPuborFsR2QywtsKv2und7KerFV6SDe7hZhBWigL2tUzwkF7+BNXJuRwLeXjKeqpNTqWPG3d0GxPr6LEbbWMycaXS/aQMaR5fEjFuuKxlV5c0a6T2CiCBi8vrhAkVhlooIJAO/xCl6VMi3uD7oqr0t030pGvsFtEe/LpWYI36hnbVaYMw00uINuciMjU8NcVDDucx2UmsxYvzfdGPnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9695.eurprd04.prod.outlook.com (2603:10a6:10:321::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 20:47:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 20:47:16 +0000
Date: Mon, 24 Aug 2026 16:47:08 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 13/29] media: cdn-csi2rc: media: Use
 v4l2_subdev_get_frame_desc_passthrough_csi2()
Message-ID: <aoytzAQpGBAhDsWp@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-14-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-14-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH7P220CA0129.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9695:EE_
X-MS-Office365-Filtering-Correlation-Id: b20a42fa-b500-4bda-4d2c-08df0220e1af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|1800799024|10067099003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	DGWQ1MpDkRBanXoY53VybDWmFtWeasdinAXfX3tWVK5pNzBXWv7sDWBy0/D4kIzEqlOtSeIbVQw5drQK7K1Pzrf6zuD+SYGPUJrYwyuch1tzJh2hpGrpluMHj0ZQiq7tUdNYiP9H5ejrrpDKNSLJDMRAUTrHCL35b/7gUj/Q1BGUkUHJPxQ5TcmTltBsrnLbVLygP6r5vhL0x2y90MhZd3Gt/dwywUSULXrZdkndQVFP2MLW7JPfU/KZWxVn22eDcgexmBsRlk0xiec6PYsSrR9iQrfJxcpNaizYcgQLgWkwSHfgs4k9h1U7OOiY+T8fkvw8h2Z9UtEAgrm6QK3pyTpg7GXa8QRJdYzdC2tadLIMj/1DTGKxgynjVEsoaxooYGj+LX2FfT0uyU/IeD9w+EP7L5ed9jbjozreXJEuHJ7YFvx1NQWTqVFuzBy6I5+9FV95ofN3uj6aDeBPZvCy8kav+U/H32WCZuRD6U99HtxvMee8Egzy8+ruJf1RnpjFjIcvbfyRJuH+FjLhapXBP7lhHnxBLMo6/sYNzzYOuAXgTdGTpSDDiSaXrBKwVRQDpJVpvlGvQRN4euKkmgPbjsOtATiIHFh9Ift6SKZuvNJhNfELtLf+UlBcVJy0kZp6lY6bElviQB5RTRliMyfhHSf1KIFMwygcJZ+0gmzn3kk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VYgjX5FBuWKWRZ8YnZWnoy3hyfppa71mWsDbBsHBW0UxpDU25u0bQp9nlPAR?=
 =?us-ascii?Q?85ERZjnD0/iOZcW4Sp8HIdql/jOogRNDKim9Ea+5uGt13Uoc5EfJ4/lux19s?=
 =?us-ascii?Q?M9SvH1WEjxNkD528oO5D72dYqe9zjNWQS8396VEkdyManj7p28ppPYWtrosn?=
 =?us-ascii?Q?PUq9p8cUMHhdoL7XpwWEOVFw2IY5fYOPavPJWTLs49RS/uBfVja+45JREoxw?=
 =?us-ascii?Q?sXhIU/FPbxNRrARXMi1G3wPqiUuJNWPmHpKYCeNowudIqAzFS9zPa0Z4gFdb?=
 =?us-ascii?Q?QTW5to2RjvIv6JTE+VdWFaFQWmsr+D5jR4o9+jllXLSbsn1L+zmtY8q7YPK1?=
 =?us-ascii?Q?p9OoKqjTItE6XoCUD7KyYI1CyOm2JucS+SEeKdGhb1hhM6lGESqWSgH73o/l?=
 =?us-ascii?Q?Ua+wvny654VBTSelnZRkzaehcYR8LdbZMjY294E8dQGqjf/7UfaiEnJYlVLl?=
 =?us-ascii?Q?KToOWeWdtgW9iGzY+vwPdI5dx0l8DLl8WAnVQvgrE4tTaW9EjlLbZGdXKppM?=
 =?us-ascii?Q?PFVZfFI237LclpJe+NKZh41SxODt6YHcRgFryneaLKrzOK2MuK9tFDUTo7dI?=
 =?us-ascii?Q?h4URG5k++/RDCkyzWOw7iZTpi++13tfBR37La4Cd7a/lUarbpUomcn29cKtM?=
 =?us-ascii?Q?Xro2yuy4+aLcKKPr+4c+ysOKs+Dr3+A1OnZCnqeos/9QIYutXyXemkSdwBTc?=
 =?us-ascii?Q?Z/AwjqlC8Kf3lkIGn2vsh8gqk8S3Eh92WiY4CeS2c7DxlyEZkavznyt5d9Zj?=
 =?us-ascii?Q?+QTDDquSa/Ps3YdXxM/59m+IrAIT/LD1eRtgpB3Emhoqsw25tQwdUCH5nnH6?=
 =?us-ascii?Q?z2/DzBLKj2zZOaV3PyLRPz2w7Bajq9VZdPcC8xA5glE81+XY2hJTdIqE/Pix?=
 =?us-ascii?Q?2JbsBxdgUv8wGP0EM348rsR3/tG3d3deFxezLJ6OJm4gxauccYlJH/DW1qFE?=
 =?us-ascii?Q?+zMUvA9PmC/Oca5lbxI2sRHSGVi7S7d3o3mDPMRf2/pwvw5vjdAkXQeQ/pzD?=
 =?us-ascii?Q?NoT5jf9VNvwvpjp8HSjrcuA9kcQtV4Xw7LOQcDa6aukuKsfLD9vR4Df1aHxc?=
 =?us-ascii?Q?06IlFAbPFqPLCpdxgzVk9RpcdSNBLgX6jUjIWNHBVZMAD/3bUMUDT+l5aqjV?=
 =?us-ascii?Q?boF9jG6pcIc4ppwdw2zGFfZZ2mPvIFubJYxJD90t+iO/i6I62IoJAN85XHd8?=
 =?us-ascii?Q?R+RsWZ+BJH/JtmIc87krjwmuUteolMMlZK8ZbXQv+cpv7q2hyZ3p9C/Xr9pb?=
 =?us-ascii?Q?o2nuWcyLKvGsV+rAjC1N9hB13s4giIX3F871YDMsQ1iL3g6DiKMfmVk0CEdy?=
 =?us-ascii?Q?QlD6ZN4oxZXDpek7Eln78m++cOO+KrOIiNpvZJXCY6uiINbvJKZHCdc3H5Xh?=
 =?us-ascii?Q?Jpy53aPt4O4OmbVGCAmh3HasJGb1gVaRSsWmnULHSWt43tU4Bc0fWtNfNYTd?=
 =?us-ascii?Q?aeBJamOZMzpaGDCaJdq2Med1NnpuUQmRkSPqhdDK7pr0IGRIR4qluV9rMRun?=
 =?us-ascii?Q?RUUE79xA6dpdoA2wM9zzTj4jk1fhibF5irbLf/kp8zaUFFG03ATQf9XGwyzq?=
 =?us-ascii?Q?yp3n7ZuugC0piaupHCfA2VhMg4O33MHUGAAUwx3L1TqyT5+j/+DczuyLLIzk?=
 =?us-ascii?Q?+vEkyA0TmNzeemPBKEazhyD04kFhtGA/WEU7/yOpgBOre5Yqf52wYLQUoNM+?=
 =?us-ascii?Q?959VAheDidG/Wp6QJt75DtPNk9ax+5dvUHQKIB5nacv+d/6OREbc+J7oFzn3?=
 =?us-ascii?Q?pnwrGwe+nooBK85qM29kogq8M2tHosYypRdxQkqTaDPIwUzh3fK9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20a42fa-b500-4bda-4d2c-08df0220e1af
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 20:47:15.9916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEwIPtdT37KlKndXM3uEfCVS0ZzYx/YMApJC4qarJiseQzhBAC5Ik/QZuPakAPbXapbk1n0SkBRBScYOWP2KbE+rOR34tfIhLpr/5CDFnVhAAGYak43xBvNr+Kqedxpq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9695

On Mon, Aug 24, 2026 at 03:14:35PM +0300, Sakari Ailus wrote:
> Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to allow
> compatibility with drivers that do not implement get_frame_desc() pad op.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/cadence/cdns-csi2rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 1ff2d8f78d5b..e31cdcd9ce8e 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -722,7 +722,7 @@ static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
>  	.enum_mbus_code		= csi2rx_enum_mbus_code,
>  	.get_fmt		= v4l2_subdev_get_fmt,
>  	.set_fmt		= csi2rx_set_fmt,
> -	.get_frame_desc		= v4l2_subdev_get_frame_desc_passthrough,
> +	.get_frame_desc		= v4l2_subdev_get_frame_desc_passthrough_csi2,
>  	.set_routing		= csi2rx_set_routing,
>  	.enable_streams		= csi2rx_enable_streams,
>  	.disable_streams	= csi2rx_disable_streams,
> --
> 2.47.3
>
