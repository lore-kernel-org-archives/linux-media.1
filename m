Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013066.outbound.protection.outlook.com [52.101.72.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9049017BCA
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 21:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787606571; cv=fail; b=XSRCk7oIWoZOHkwJy4F6EPTobIP3YDOdppJjvVcaooaZeM7LLBdODKnestp2LzhfYN5aRtb+kMMu8PVPpqQVzEqnUrSuGXAJQu0EQpcYhGEIjXatHnlYf6d1NwyLcKstPkEdvSDCNnXw5DCa2btrhWMpwFMxSaacGIq5iuOUywE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787606571; c=relaxed/simple;
	bh=INwt7ap86be5EiFHrlB1GhtZS5nKB0dHTbC7aLyrK8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aVDEdlkv6GGSe41IwqhbL45II/2Btb4HD/b3b40nbkdmjSq58hMybLCgPKeZ8diteSovStElzb+YlxCl5K/0PslO6etojy3A3ag28kmi/KrPvNq/o/IbOYmhZq+GD4/98oC1IkhIw2E4yPETggZ2diLFfXNxXMV9eyPJAr2JqIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R3Esi/4P; arc=fail smtp.client-ip=52.101.72.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R3Esi/4P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hi9Gz6mjefY91LczhuBHerEvYxV6/gu9j3Rr7+yg4CczAq3+PT6oy6Y1uvwjuNvUbX6BLLmadpBCALvB8UKpID4DlKm7B4cjD9h7QaIKTweCbow0ahwplhNmdrOoVgFzCH36p0TFM/VU3LMkPkStQ0R93WEIPD4qa5ADCdxu7YZF9yMUVkGI+gMQk0V+M3P2LaryhLPJ1aWkW/1/ZZHhW64Da0YOYJypj+qbkjOdCahqbwa42B7PtY6uUzr28AN06h/tqyieMpWgWIWMd65CURxe4qd5kbL0996Q+gF2whqqXWDjQlzKpWWLUZWzKqbZwKrH7TUZQkd2R7Qc73hjtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyUZs72gmCSQW1viqzdAGVvdDPApFg/rLTL/R0fEoyA=;
 b=la3N5jnzZkCa2uixPJB6iwA1SBWSf7DB5JfxMkz+tlHDWz4RXdEYNxiFok09YEAxUclV/df4dGW7DLq3O8hNrjPt1ZeFlUaF31zfBPtf/TUCUhWpiG+u92brLFWx5tNP2RWQbJWtwwSsvBVOmC+V0xTtL0PDXI4xRa9fo/F/U1SUc08bts825lJKQNmbaMEL2pV4pJlz+gtQPU0iUK1AZWgEmw4Xy/7N4mIirEaxtc8I3Y7P0zjBHOafu/bCgy/vPbMYLQ4Zr30PdVlDtn+hoD+tmAIb1r33y0J7YfYM+lP1vk5BlEIPaq8BZr5viIc0zyd3XLbc/ck5reSehWCXQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyUZs72gmCSQW1viqzdAGVvdDPApFg/rLTL/R0fEoyA=;
 b=R3Esi/4P2gBlB3926ipQl9vLBzmxxWunuDqycQiRdqoLudTBxzmStagt5hxl6EwaZgcT/DaZMxEYSWeit4GOWZwEwq0m1emrsUvVIlx9Y3dw/zcXDlvbJEFOim06xuwz29yOwbMSxy+crw9ARe8ld5kzf9M6xPf3od3dzYakW6x7b6iD9ZN2gUATv6iGknWDBsSN5gCGX/mYlSdLusgTazKaoyk9+0ICmefYChd+995NkRMD0rZZ9A9gtybeBzEuSzKbBLnKblsmL9mSQiFB+3F+evWqVw9m5Bt28OyaJleIhK0TIAwQQQQFJ6oCCDyDWDPmCzITKypg6SeOhL5ncQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10873.eurprd04.prod.outlook.com (2603:10a6:150:224::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 21:22:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 21:22:44 +0000
Date: Mon, 24 Aug 2026 17:22:36 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 23/29] media: exynos4-is: Use
 v4l2_subdev_get_frame_desc()
Message-ID: <aoy2HIkC4WmMEnHM@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-24-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-24-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH8PR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10873:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fee64b4-e06c-4c53-0bb9-08df0225d63f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|10067099003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	iDJza93a6BBlsPmHhc9fhbWQlHK905rKheq9ch3pQi0AoHLM8K+wh4xpl86sqd0jsVPqDnK4OHt/CQFTdtS8KvTPr/91ptH7zh26NpDJVGwFjFS93bGZuv3ZPirQ0J/B9n4bmztgcjHta3O7H3CrgiUsebiC7D6sVnbDsW5APA57VjxqVAfAf6/Xr+C4tqowYm4qOxVPkUGBafw/DXFemnE9uXhDYbf8+KuF8GeMtG/LERs0v5LRya81ZTaUQWvUrf1qUmCjM7HUB8xqminuYxvAbV7xbB/fcDt7QBoIrNPeVdSc1OgAIfV5F/AyDMgQ2TYQKnUDeFuGyXKyjei0KV5rrTU1YgKACQOLHxcPWmdkLmHM9DguURalbJsvGg/+PdN/A+93UBMiuScCdGhuUtl2d10C9CrMip04SnlEsc//oLEMBdBGEeGwgzDA4II5+qcBsWsodLnhGQZScxPlRF6y4nlEK97+YFPeoRDW6Uw4NxHoPukOF52s+DdOguYwHogkvSYnYOlyff4VYGHG2LsIQ5scESWm3dchJ9gLfGAU2F+KEKumqWzdmuFpPJPq+JPpNSVEoOWMQg2Y6X7nzkSHBGwioGJpBZI7eT98DDufuEEIxw4JHMoy3qKW3yccOx56Z5ggq5liq+9J+4b/CykyO/6vEupjn2dDhgkNcuw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2f/8Qop00ceAgZZ85+3YT5HkBzpXpCGHaCTFCkYdN/ETiezVHa7NLywt/jY3?=
 =?us-ascii?Q?Ic39KKH6r7CH5Zc+mPR6gAL9W+VyjVa9QYDyvufj6nxqHbelDhMTZUi0Myw8?=
 =?us-ascii?Q?AZBn76hxtep4mey9alCFGMiCeK26Q0T/HBtFZ+2RQJX+qg14HFoToIBRwdyG?=
 =?us-ascii?Q?xgiO5y3Nqqsm3rqgqsbPk/oz0aI8sY6kg0BA3NLofXfg4ZHqNkOuDGrJ0E5o?=
 =?us-ascii?Q?er/4UZ/7QJ/THxHeDjOMrsnjvOUkMg4NgFCPmpXWSZE5bGzr0Kmamx2YG8GS?=
 =?us-ascii?Q?TCaUrWwCOBoATXWaUGXL1kFdDC3WSLva8PJy+Rrv2UsANd6LEzX/KuAd+bsP?=
 =?us-ascii?Q?rf85GNPhhfS8d0GAbMgLja8Unu8ZQSLtVGNMQLxUUfUMN+/sUTQs52GQbm6W?=
 =?us-ascii?Q?nAPDd6MIPMuJDjd5/EAduSC8qtv1sL7DyImJD2geSWvDJQgoVWvLH/2z4L0f?=
 =?us-ascii?Q?8zOT2ecphsiAspEoKU3PaomxXCi+VmkuTAP2zsBbo8bkxTzC8q4t3yMGrgbs?=
 =?us-ascii?Q?dKwmEA1AZCN8KW24AmDRvs8DmRgvoNXAJAi6oPOlVK7yp8dSAsuqRCvwH51C?=
 =?us-ascii?Q?9O0TXZLX0n3pOJYGqHmQnDLcjF5J4kQcXEFGF1WSTmGua3YgCqILKV91geG+?=
 =?us-ascii?Q?nEG5a01Eoys2lUnVyYRYhOXAnoAWG5mwVxPz9ezl09PjR5gswU/wJzwa38UQ?=
 =?us-ascii?Q?qIPhcDTBGi7eUeQ5iNM9axjcMdjIvffehJpGHAaraDB10RIi0xmk8nTYD6TZ?=
 =?us-ascii?Q?Lz53nNbJBtLhwa7Od8Xt73oZhqaaBU9p09vHJ5su2xmQl9+UoiWKKLSxIgd5?=
 =?us-ascii?Q?skt6KO9W+0VQF5hL6WI6CtJPJ9IbbcgQYB9gw3/HOzOhiYzMXr0HW/WoJkRd?=
 =?us-ascii?Q?Kn703fHkHVctAjZWsChwdShFh07uXQ73qrRSwHslt+RyWXHwcfI/mOUApvQ/?=
 =?us-ascii?Q?jM/K4b3pk1EJFtudZr0Yf1VAgLyxcjcft5vi9ekTiUEIZb5I9T4SPuMN2xUp?=
 =?us-ascii?Q?nuSe1gWmNpQ04zBnA8AZIUWF6LZplbFmpH2t70oMFXZpI7z3owG8S/Wxjq+k?=
 =?us-ascii?Q?Xit+nU2Nza5jGx9UWWF9GfOnE0oeSXLlPxOFOQQD7x7ecW6BLuX5U6bYUaDV?=
 =?us-ascii?Q?1F+u1wyY5ROTs63TGHC1WaT0TsOVbFVatymr008NCVadQTns92jJQERdioE8?=
 =?us-ascii?Q?odp6o5e/Ij511JuXAayGQgWmDWhnjLXRvKVN89BHSF7Wfs66Y3jOpyUrV/cp?=
 =?us-ascii?Q?bAhq07nWuZE8VfEKLVG3AUUryoegGIYISfDcsGAhLgFYGBr8ic1ZqU26Zr9D?=
 =?us-ascii?Q?rOlNPOcsqpQ+Nlv3UaOWCvz9YyP6uRjCHCP/XmFr4QBxIHshIR7yyyds95zX?=
 =?us-ascii?Q?cloqqWiDOcFT5A+jhL5KkQ2+1eWUA1vMqEPEfWwa6Y4gdEqdBb91R4Sf8K09?=
 =?us-ascii?Q?5dnd1E6mtr70a+s1zIZS58al2D+Z2aFuUPONYebiJ+QJEXjsfY9B8wW389ed?=
 =?us-ascii?Q?8EngsTTvtFEaWYxMbpM7b8ba7Eqsi76FYZb1wYU4/YbO5Mn1QIq39vTPt8DL?=
 =?us-ascii?Q?ITkWX60OeVXhsbr8AgDWeLfKQOsMe8Wg3+/WAl2zi2brwrWqqYQCgTCwQd9Z?=
 =?us-ascii?Q?GX99vItg5s2K7ieZMQ9lwwX25HtQFq+3MrCwIUB8LkA3sCcFZH8baqnIY4GT?=
 =?us-ascii?Q?L4q0B0XAiw54WbH97+t+9zps5p/90K5CGSb3fvbpmO6V8sH84/Fhkt8SJeqx?=
 =?us-ascii?Q?SNYtCNTSE+5fuH+9IW4xDyxNEgp0uvnmTQXU0x+F4B1E1cmrmH61?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fee64b4-e06c-4c53-0bb9-08df0225d63f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 21:22:44.3281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGQq9rrtDslBRJasvITSCux5230/AjZmyac35DlWjHGs9ALnhYDXVrVUrI+wQFretofKHGg/gxe9zw0UCGYvayvucUzI7LUOYeCffmsUF6AYgXN6kn+sdbuxr1xxun3n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10873

On Mon, Aug 24, 2026 at 03:14:45PM +0300, Sakari Ailus wrote:
> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../platform/samsung/exynos4-is/fimc-capture.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
> index d85811f4b8c5..b5749f9cba39 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
> @@ -6,6 +6,7 @@
>   * Sylwester Nawrocki <s.nawrocki@samsung.com>
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/types.h>
> @@ -853,7 +854,8 @@ static int fimc_get_sensor_frame_desc(struct v4l2_subdev *sensor,
>  				      struct v4l2_plane_pix_format *plane_fmt,
>  				      unsigned int num_planes, bool try)
>  {
> -	struct v4l2_mbus_frame_desc fd = { };
> +	struct v4l2_mbus_frame_desc *alloc_fd
> +		__free(v4l2_subdev_free_frame_desc) = NULL, fd = { };
>  	int i, ret;
>  	int pad;
>
> @@ -861,10 +863,18 @@ static int fimc_get_sensor_frame_desc(struct v4l2_subdev *sensor,
>  		fd.entry[i].length = plane_fmt[i].sizeimage;
>
>  	pad = sensor->entity.num_pads - 1;
> -	if (try)
> +	if (try) {
>  		ret = v4l2_subdev_call(sensor, pad, set_frame_desc, pad, &fd);
> -	else
> -		ret = v4l2_subdev_call(sensor, pad, get_frame_desc, pad, &fd);
> +	} else {
> +		alloc_fd = v4l2_subdev_get_frame_desc(sensor, pad,
> +						      V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
> +		if (IS_ERR(alloc_fd)) {
> +			ret = PTR_ERR(alloc_fd);
> +		} else {
> +			fd = *alloc_fd;
> +			ret = 0;
> +		}
> +	}
>
>  	if (ret < 0)
>  		return ret;
> --
> 2.47.3
>
