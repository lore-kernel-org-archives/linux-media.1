Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011032.outbound.protection.outlook.com [52.101.65.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85CF37EFE3
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 21:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787606774; cv=fail; b=YLRDkwn82pFgd4sDXlYVDQr63mDWAmEZBZg0Epz46Wxh1FfCR8sDJIfJQQJsRcqQ4VHjzTcDy1nJMVPT2DDx+H38MCncfAAdbcQ53pPl597YngczGmaygyGvxsZWF/iTkOc+hdibLbE6MOhDaV0mhWh+QVLVRjAd6fzNnJ2ZnoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787606774; c=relaxed/simple;
	bh=dO8WXy2amrH1FTDceJj/frMp7btSmwLN9O1ImJYt8OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qYToLAeVUyZKHY1EUe3vd0qMKbQAlURtFL+IScLXbFoXBgEjCid9IA9AEfoIEmnXD6ETY9bCAdhSKco/0YDR/nmkTZtHGs8fPjvxoDoi57DFBYKXPqwOQi97FYdyhyZ1hL70fdVgqYbIDllvjWEN9kH2fOQC1TkrgWttM6tfbPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Tsd7cyu8; arc=fail smtp.client-ip=52.101.65.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Tsd7cyu8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDTjVsl5bF7DzzetVgryn/83NI9fBWaS92YYISukXBokGu+o+yn3T5G+hxam2hABeXsDLcPnrY545K6AjWfSNrigufdcsdBnYTLj5tKe4BAVwfjXM4C6d9yzPyVUL1HZ+IpKQCs64d4MnxrYDj/HnKEeeDgNzCZyabmYoz/hDOUEVSrF3BBbpIku+oGZAwyoWKpXHh+kPdN1+QdG1nVsUi7kSuReW0TOgRLJwp8meWnmtEg4JczqM7bFlBMJcStyr8AyQ2XJODDAoq4UbNdauIt3fWQvXvNVfCiaxt7Z+mySvyA0XLXnerg4aaKOQV028NCBvH3Ej7cm9yYz26+EHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPD8w3Xj2CRh/npGRTLtZ6Jhu58luo3cpBWPfMrtncQ=;
 b=DsxdG8LRVvzNSJuzaE5NQOdRxr/T4FvHvfuOAWWXRB0vg4zVCSOi5Z8lmDZR9+IgR++HOvX0du8vVRyTU26Zy7bh3+IqnfsgH2FRKHAtFuM25NrGj6Eyimx+qrHpLK1J8klFssMY7iu1ktM91//FX4gZoBEeyfOE7huIyKF6iht1Y2VAAMtOb99sfQxUg4yTGzQ3DeQaEfy/3dQsXwVNc3dSkgDuik942Ces5Elu2kcQOlrUt4GQrdY5QDQCh1XRakcGYRUrt/4crTCs2cMPLYbe37CAKUFU93xI6CtWUrdjLiP5S1qk4u1fnNKzvwNqrS+4sWqmjL3IQ4CQjsKTcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPD8w3Xj2CRh/npGRTLtZ6Jhu58luo3cpBWPfMrtncQ=;
 b=Tsd7cyu8ZR7SdiirI+1Mhjd+2WboAM35d4dToYKMVlCf5LQLxMHX0UJazBLhK9eoRLs+y6ZrAX2S81YrmVoqv4ZsTG5sLuqnl5JjnLjLxCzD2w3wfMF4OPB6qm/vYbQSRIuTNDQboKvF0aCypIkG7WlcB9ksx8+BotO2dv9MWR+dDbgrR9z2NUHxOLAX2NzcnSe7dfgxOsV3meFGC95lnQMXVVC9lgftNfIBloKabVwRnBSBJf3cwr0rH0DLJ6PllEcfS6Xxnkknhai2VSHQJHd7xi0GY6V/dlKMF2yI9U83dsle3unfmBig1a/ZDI5lEkr6P+6iUNxRyvmGzzT9VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10873.eurprd04.prod.outlook.com (2603:10a6:150:224::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 21:26:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 21:26:09 +0000
Date: Mon, 24 Aug 2026 17:26:04 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 24/29] media: ti: cal: Use v4l2_subdev_get_frame_desc()
Message-ID: <aoy27PL0_Ispirl4@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-25-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-25-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SA1P222CA0021.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10873:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4e03e3-4152-4fe0-3f2e-08df022650c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|23010399003|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QGIhuRzln6dp6SEgaPKR7VPQRPaKBq7/GNmxbXm0PJMHRd2kaFHjTHNSOPZZckplpvkZUcFGq6408/qctZHW9vAoocg3moaYVSzOwA0sbYi1rDqf0BKNdQy4AvQU4kdCgCbrwxnqWwY/iVz9jFKTKkAE18HW59hxL/faNt+Fw0j7PZntipNEifNTvmC6kvNk8rOV7To2enLfIwoNuO0iPGdVxtcrvqUr8HkLkTuhPlgRUin7chGOAX8BjjO3PkTyCugXd1T+4huUVPwJB9A7DJdfRDHjEEel8xqZoKfJafoIOpT/+B76flYtOlUDu2ipTrZaVCD2E0JTl4Nrxd2219ZQZL1gSq1b7ltgTNpxSvheIYbiusPRNnmPTiRYKLZJAxZFvv6aMpoZ5UR+7EiuxiCwOkWCPfHK4iY7kgdsR15mTU5rS1Ic3SDHqsAtCmJvsfFuNRpZHtIfE05X3shT6Y/GJg092VSfKML9eoZEPVy6bIwH5ckp8gZ8Bmfb8UtiK1H6ily2uGUm2+rgMiR4vuWfx7jXc+e/7PChIKpMq+Kn+5xZuwSvgB1AQUrsDpxBWaIcFTohoSeCxJ9lDCOjbiqAAdsR1bCzDMBBno36VapXezT4TuvvRODKtZq4Mnn1wm6jTcaD6/Q7DEEVw7BYNKrmKtwNYd9ckUdlfTkTXNk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TEB3qmic5aZhxQtyMwAJD4gbHJVhozFdxrbb3QhONWlWDUfWJPTupYEYQ7M/?=
 =?us-ascii?Q?SBAOQP53WIDJb9VmTyxP/XmFOVy+tBfDGLEAgu4JNBGlw/Iyv1VLECDwxj9B?=
 =?us-ascii?Q?R7vyXk+PgTNyr6w8fyjVyYOzCLhnBdNcaLOof1XGV/qDRxcyGPJWpYdEtAuG?=
 =?us-ascii?Q?6uMpRlJCgeaPqpBffEZ1vcadYU3I84PbPHpwtCHFribO5soZciEBTGQjswO/?=
 =?us-ascii?Q?fSDxQSThXUoOZrumrhve8lJ8eDhEBlTosa4vGynz1YE2FSjDGS/iYA/NV5/2?=
 =?us-ascii?Q?SQg4cJadxzmRnfD1BURVT6uIVN/3hNPwTHUnOEMofH22Q3o1o6aF61q2kw1t?=
 =?us-ascii?Q?vmBXbIdZpG8gBmx5fl2/Twv7k7MjV33GWD6uapRNolUzm7dnbE+0qFtQ4qER?=
 =?us-ascii?Q?aMj4ZQOADcS2630hvWkabINYCcN1kZ9X+PF+Pr2dxoSB9/B9jfpikC+JCx8c?=
 =?us-ascii?Q?ndxFHIzMYBx1gZ8P4cd+XpeWbQIw5uFDJV73yh4mxilYtkN0SxwBiuITcG6H?=
 =?us-ascii?Q?aUXnd9faIIM41UM0CTTlWUqHPVMkvBUNn9ctwh40+EWAd/P/5LAR9dtjMBAB?=
 =?us-ascii?Q?Zu06S/XnF822V9Kpdr9Yjj+j9ViAEBSpsHjT8RrU/ZdKQoM+lJOao0MwYb+s?=
 =?us-ascii?Q?lRWVrS2LsEJMn7Zm6hsRAyEdHUXUZbmTMKhlxw/kFK4jbbs5XhXqdj7vRhcZ?=
 =?us-ascii?Q?AbLJ99pSCLpD5r1oIZ7+e2J9INlXbLdWWuyLoi6mB902xm7sqDQs/k2zeo5y?=
 =?us-ascii?Q?b20c0gQNiLSEe29Gwfvm//CHZkgwJzU2HM9nTvN0vgnXIMLv33uvdhNbNtfQ?=
 =?us-ascii?Q?mBrifs7tpKDLk+Srz6aJmkxRGIhkElI4m2lgd7hmN+5OkkjBXNZRU1EPPNNu?=
 =?us-ascii?Q?aY3j15esGnpgl6KkyQbhGvK8PCxE+3ndyrkvdQ027Q7M9lu16E2Fm2O0CsCI?=
 =?us-ascii?Q?FQ2+RvpfByU/N0h1kz1Cj1Yp4y1ZKP8fE8eYupj0fanh9CnXWAMdEUxyQork?=
 =?us-ascii?Q?w+JuQzy/ye7VKg4tpFuRetNcJB6Rhw4pqUproAFPDjS9ZTdLE0bnipWD3P+Y?=
 =?us-ascii?Q?RrDnoNf+VoK3EM9FQE751hhzVRlAGrQS8wFnB1cyRrBA1cDmbZGwexOedRoV?=
 =?us-ascii?Q?+m96C0Qr0acYgsNRF5bbRSzOyuKZ9W/C6A5wB/i8cjwvVb3HnmqOqdz/wZSS?=
 =?us-ascii?Q?zBvWW2xW7aRGPH4kppo1I+RhOjTIXxL0HeaOad3TSDbLdBTwAOOXBU97MrpQ?=
 =?us-ascii?Q?jcB9nxI81DT719CPPdVABpu329p7c4w7saHokA56FiFXZMGjAzHsgyB1aHtF?=
 =?us-ascii?Q?rscOdGB0HDx7+8TXK4WjjUphJjRWet/YxoifE4StPihVUy5KGfrzmgrdPl7I?=
 =?us-ascii?Q?L8GhGGSBsgDHsrhKcFxzDVy1NkhefFnioLMGpL0ZMJiuV/sJ5hlHs+dkj2AY?=
 =?us-ascii?Q?BqyuMQTbdoO0fC9W/1yeSWjQvrmBxuaY6BT1A74b4galp0uyCn8/udifteI3?=
 =?us-ascii?Q?IdC62hNo9LSlQ0Lk4d19A8NAJOJ73JO3F/kNiT22UrK/jNbeXXkBjf9kWKUG?=
 =?us-ascii?Q?4cVzGJ14dtsKVGCM3CDpXnBFnqtPC2RaRvCTiv7fRjy4rmy8NUo24hWMFHDb?=
 =?us-ascii?Q?DareXf8vAzGfpWiAAKjTNA12ehsDibN+MNT/2823IfpiiTWGMyaL9HMr6F2J?=
 =?us-ascii?Q?jDQWLvit6R1C+NCRKwdwZR231vZIrxDrCSWXWTNeonbog1PMkcngnI8V5ZIb?=
 =?us-ascii?Q?I/OKmWke13C8knjDPtHgmeI+y1kmlCs7hblJyRif4lGr1XqlhOZ5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4e03e3-4152-4fe0-3f2e-08df022650c4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 21:26:09.8777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8sjxaJjw4zDMyUxKLEgjKXHVOy+qGjuLpnOlecsXsw7Vgbbday9IRatk/hjYuM5pyoF9BRKXsEc7V4eXhMncYlbI24R54WL5qfE5W1j4Us6x0ss2mROuQ4BUOsr1yxeq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10873

On Mon, Aug 24, 2026 at 03:14:46PM +0300, Sakari Ailus wrote:
> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/platform/ti/cal/cal-camerarx.c | 26 +++++------
>  drivers/media/platform/ti/cal/cal.c          | 49 ++++++--------------
>  2 files changed, 27 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
> index 00a71dac0ff4..9ea1f3551d22 100644
> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
> @@ -9,6 +9,7 @@
>   *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/mfd/syscon.h>
> @@ -872,7 +873,8 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  				       struct v4l2_mbus_frame_desc *fd)
>  {
>  	struct cal_camerarx *phy = to_cal_camerarx(sd);
> -	struct v4l2_mbus_frame_desc remote_desc;
> +	struct v4l2_mbus_frame_desc *remote_desc
> +		__free(v4l2_subdev_free_frame_desc) = NULL;
>  	const struct media_pad *remote_pad;
>  	struct v4l2_subdev_state *state;
>  	u32 sink_stream;
> @@ -893,24 +895,20 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  		goto out_unlock;
>  	}
>
> -	ret = v4l2_subdev_call(phy->source, pad, get_frame_desc,
> -			       remote_pad->index, &remote_desc);
> -	if (ret)
> -		goto out_unlock;
> -
> -	if (remote_desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> -		cal_err(phy->cal,
> -			"Frame descriptor does not describe CSI-2 link");
> -		ret = -EINVAL;
> +	remote_desc =

cleanup prefer declean variable here
	struct v4l2_mbus_frame_desc *remote_desc __free(v4l2_subdev_free_frame_desc)
		=

Frank
> +		v4l2_subdev_get_frame_desc(phy->source, remote_pad->index,
> +					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
> +	if (IS_ERR(remote_desc)) {
> +		ret = PTR_ERR(remote_desc);
>  		goto out_unlock;
>  	}
>
> -	for (i = 0; i < remote_desc.num_entries; i++) {
> -		if (remote_desc.entry[i].stream == sink_stream)
> +	for (i = 0; i < remote_desc->num_entries; i++) {
> +		if (remote_desc->entry[i].stream == sink_stream)
>  			break;
>  	}
>
> -	if (i == remote_desc.num_entries) {
> +	if (i == remote_desc->num_entries) {
>  		cal_err(phy->cal, "Stream %u not found in remote frame desc\n",
>  			sink_stream);
>  		ret = -EINVAL;
> @@ -919,7 +917,7 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>
>  	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>  	fd->num_entries = 1;
> -	fd->entry[0] = remote_desc.entry[i];
> +	fd->entry[0] = remote_desc->entry[i];
>
>  out_unlock:
>  	v4l2_subdev_unlock_state(state);
> diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
> index b7e77b6b8950..20192f90d5b3 100644
> --- a/drivers/media/platform/ti/cal/cal.c
> +++ b/drivers/media/platform/ti/cal/cal.c
> @@ -445,55 +445,36 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
>  	return stopped;
>  }
>
> -static int
> -cal_get_remote_frame_desc_entry(struct cal_ctx *ctx,
> -				struct v4l2_mbus_frame_desc_entry *entry)
> +int cal_ctx_prepare(struct cal_ctx *ctx)
>  {
> -	struct v4l2_mbus_frame_desc fd;
>  	struct media_pad *phy_source_pad;
> -	int ret;
>
>  	phy_source_pad = media_pad_remote_pad_first(&ctx->pad);
>  	if (!phy_source_pad)
>  		return -ENODEV;
>
> -	ret = v4l2_subdev_call(&ctx->phy->subdev, pad, get_frame_desc,
> -			       phy_source_pad->index, &fd);
> -	if (ret)
> -		return ret;
> +	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
> +		v4l2_subdev_get_frame_desc(&ctx->phy->subdev,
> +					   phy_source_pad->index,
> +					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
> +	if (IS_ERR(fd))
> +		return PTR_ERR(fd);
>
> -	if (fd.num_entries != 1)
> +	if (fd->num_entries != 1)
>  		return -EINVAL;
>
> -	*entry = fd.entry[0];
> +	ctx_dbg(2, ctx, "Framedesc: stream %u, len %u, vc %u, dt %#x\n",
> +		fd->entry[0].stream, fd->entry[0].length,
> +		fd->entry[0].bus.csi2.vc, fd->entry[0].bus.csi2.dt);
>
> -	return 0;
> -}
> -
> -int cal_ctx_prepare(struct cal_ctx *ctx)
> -{
> -	struct v4l2_mbus_frame_desc_entry entry;
> -	int ret;
> -
> -	ret = cal_get_remote_frame_desc_entry(ctx, &entry);
> -
> -	if (ret == -ENOIOCTLCMD) {
> -		ctx->vc = 0;
> -		ctx->datatype = CAL_CSI2_CTX_DT_ANY;
> -	} else if (!ret) {
> -		ctx_dbg(2, ctx, "Framedesc: stream %u, len %u, vc %u, dt %#x\n",
> -			entry.stream, entry.length, entry.bus.csi2.vc,
> -			entry.bus.csi2.dt);
> -
> -		ctx->vc = entry.bus.csi2.vc;
> -		ctx->datatype = entry.bus.csi2.dt;
> -	} else {
> -		return ret;
> -	}
> +	ctx->vc = fd->entry[0].bus.csi2.vc;
> +	ctx->datatype = fd->entry[0].bus.csi2.dt;
>
>  	ctx->use_pix_proc = ctx->vb_vidq.type == V4L2_BUF_TYPE_VIDEO_CAPTURE;
>
>  	if (ctx->use_pix_proc) {
> +		int ret;
> +
>  		ret = cal_reserve_pix_proc(ctx->cal);
>  		if (ret < 0) {
>  			ctx_err(ctx, "Failed to reserve pix proc: %d\n", ret);
> --
> 2.47.3
>
