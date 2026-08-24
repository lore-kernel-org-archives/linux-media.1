Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011030.outbound.protection.outlook.com [40.107.130.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3512F33C518
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 21:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787607542; cv=fail; b=gpe0ehEQp14KPRmZW0jSL/KBDqvS7IFn3xumr7zNa00cidY6+AGWbqCf2EhLDix0V07uIWlB75gRt4gT/iR+720jDPtDXTYGQjZqRjflBbp5lMt2GuqcKTDL63Hm3Q0DH02ggMztEBaVZ17MX1a4O9Equ0VXdurcynqcwCb9SpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787607542; c=relaxed/simple;
	bh=OBWtmuVQjzLRSdmzN7UUBy3M+SLpW6gmN4jGXYnL8CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P8zKb3cL+0Hfmpr0kxL3JEJpsrMklEn++J9pn9dkZP+z+yJzWoXkicBQhCv6/KuZD/M/Yoq+Dl73dJWqzVUr+xHWbVWkxyt8PIaumOLOk8f+4HAeo8two09GdLkykUGsKGa+tx1fSmlZf0wfb/tQkSZG/8KbwGFT79LGpeVx9ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nxa6onEl; arc=fail smtp.client-ip=40.107.130.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nxa6onEl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctRyXYxETVflRmg1gDqao34l4Rs2S71V7A6s0c0LFwVeOct4VmSC7zCpeolVBFJLF3vyRVJ7reG1gU+XlpdBHAu+SlS04dVB6Emv8SVsK9z3c3kbrJFK+/btIVfmMoV2umZUTW+4f5jOfNQFZ+g4gqwFD+QY8CiQ1tEk9dYYU4Y7kftrvTpxg1l/u59YxwbnjfUzM2NDMu99y+k86CoEXp142voeh0cgsQbBoN8jcsPg0h5mhhRFd1QFyTkvD8kDO24nc/1HWhAIJWGptdpfvvk+0IaDbwREb6J890wPGwYP3uqmz+lso7OuQJV/QioVzxkUqXTM+RDuae016P5kyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxDaovc9mfcLszDYaqiQeqgkwarZRo/d343sIxg/PGo=;
 b=IRYGv63zkiV+CARQQkrfjoew+4eCvOYYEFuz1fov4TIBTeTEj9MElOIpKK7g+LZGQJQ/JoI9I+zjAS/DeRV8DOZRQ40wowCtI+jipFW/cPNovuo/jogFKiWRAxm6sinwc9nCwSG92VYbktv3Dl25w3Z78kJeJG3WHRw9DCm1z9rmhHs4B7g8O+a2/BLhBa9KweNsRv4b34R6f1JUDVaK53XG2tTnNnjdqb13haN4uPmQ+ZZdGVG6nOyBZZ5fcLNhcESF6skaWIo3AQnorlmsvwOU5i+ozz5sr0pFFhCuBbrZSOGCv7hDSWS6kM6Tigi2LdMq7D3lzPB4E8S/aaJwKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxDaovc9mfcLszDYaqiQeqgkwarZRo/d343sIxg/PGo=;
 b=nxa6onElGI875mRK+zSJIyZBFZuGpgnRU6Uizp2Z2vGKdeQFmz61qLz7f6f+narPBMrNnVO5VZOg0tyeT1Hybumzh1mMd46iUTzLMmDvb/GMrZRBCM144kaebP7cgG2rS5mFFCt1csB3O6TFK92nJ27LHmXy3V7WyyFKeMQa3WCC/dl0YUfOVf58xoj4CwFoTk5O5+QMIGP4VIEg2OM6/02ygim0TWJRmExOavbJb7G4yAtDTTjCfNnokTJYshC/nXIsrnppA0DMpN2QQPmLPiW2ERTzyFyRIcOnhRotrYGgG+yP2brvxkZ8BKfmctCNwX6o3hvaRqIgzha27+rUAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8335.eurprd04.prod.outlook.com (2603:10a6:102:1c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 21:38:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 21:38:58 +0000
Date: Mon, 24 Aug 2026 17:38:51 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 29/29] media: j721e-csi2rx: Use
 v4l2_subdev_get_frame_desc()
Message-ID: <aoy567WH1kYn_n6Z@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-30-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-30-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SN7PR04CA0212.namprd04.prod.outlook.com
 (2603:10b6:806:127::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ab8415-b77a-41a2-bde9-08df02281ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fL/+UUg3J6NUqofWh1Crd6DpQfTquZSCVNokh0ABRSWcWAdPU+PKAfxa49EfzgTTETboU2rhdrdbbYTMeZC5QqslhzXo9JQ34s1a9R/9kHl8lxXtQmMu93qhOQmsgjQOXZveDEvXhaZoSCvCYeu5vzPQfKtIqIY45OoO/4zxSn5Ej4La7IUfNJ499QQGpjBLYgaHwOMch414M7WH6XzcsQ8lORNwn5AzOt1MPsmHUsrzjeP6p0jQfqjdVp0+soA1DsJqojX95bCuqwANVOr7dkBzMEn84U8b0kfY010P/ewfxfSRqVDj0c/zwAhY7o0bu1Oqccb8WAsYkRy34gCvuF+/8r6gUQAZ4tuzOcyhm0vv5vm4UgXBtpK8+6X7gId3Rr+6acht3R5pQw3j7/Q64cPjmScZb1HQzsD4L5UZ/uuC+UbQnv5+RlHd2+BaoP0V/1rWNMm6WWKO4oA31cgKXQ6L4aEZSZ4ZhBs3hPec6VI21WEvym5WWoIKp/++iZwbLw9vE3t7p9/UsxH9sGL3hpU0NN9gJ3v1+uXQEqeSUGXshk8L3OkSuOdYWHioRQUUPc0pq8b+PFBoU2yjcQbQJzkQ4ZBcKCa0g6QAV/izNkjFNZzcrGEb8N3pfFrMprl+xLadGuGyhZl8PHXUa7GaynK2H13BHEp0eGYiW7FP0d8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rWvyeSClH4nxoa95eKmhl8Pg9T5k8MIeDIAoVkinklhkiVtV541+rTyPfE4i?=
 =?us-ascii?Q?yeLZrnsvsyRgLa/Z1o4XEg6RtzryGSj2wwdl9EyfvJ/ksF5RiBsIK/Kqm1Y6?=
 =?us-ascii?Q?5482y5Ug5Fslvc2LvV4lKEkPHtCDGLS36HZz5rxfE2N/MDcGOVnN3yAJPbLf?=
 =?us-ascii?Q?6ugGJ282PneDTvzONybgHAenxtTtnedTMWAvoZn6266wehNwfRIE79U/ghaP?=
 =?us-ascii?Q?tYxTf4bXA79ZtT57sjavv//yMzXD7/Q5kY0/AvhCMn8sVcPyCxKGNIuUBdDR?=
 =?us-ascii?Q?22niy7EXT0J+tCc3VYiKfyS/aAZnrGmrFx5s8M7ou4C17GqUnZr6w5JO+IyN?=
 =?us-ascii?Q?pN+BwibFsR47OsS+CDcnXjWlNKoLGLs5H3y4F7YFKWZ/97AtKDbkXdPB+txb?=
 =?us-ascii?Q?HT4TvO4V9BrpPhtVvqaZhhArigGaWFIdNeA4jkYSvuXYDwuANiissdpp9GsS?=
 =?us-ascii?Q?4X37NuuVvHa7lxzYYqi2luu4ELp7y+uTeN40J8kQZCeeppiHwOIqFNbCxysr?=
 =?us-ascii?Q?H9JrXcjhL7idvilJRYRCpsGZOnIEDFGSjZkzIK8t4aLyw50tkmXKwqvV+mPe?=
 =?us-ascii?Q?E7obWcmBkYjnh5NCj0njkiYeeZDFeVJpDT1iDZJWceqelV50XlFbQPxqOBgS?=
 =?us-ascii?Q?LiqkJRi77fh94JmXNKgOUxU2AMyML8aPm8h6KkpKAwxWyuj5CmnyQnpelYcV?=
 =?us-ascii?Q?uNBixkEfuJgKTfvtZ0Gks50NHQZuVeKSbgUjcxh0RpcOoXgvjhdVfnDgTVfZ?=
 =?us-ascii?Q?u5VmYd8hamXU99pSU8l4qjpJAWCPUSj+8JtbmoPlTINMv2Qb45ebNOMp5+tK?=
 =?us-ascii?Q?wZp64SNNcazilUtl96eCC4kjTMpAX6v0Fv3NlCblvtOfC4AGAOuT3V+ntyzs?=
 =?us-ascii?Q?GjO2YeWoqWSCVr1V7pxSn2HkJA3CxO3ILg4hlptqEaXmyiBB8SDvXUCyWmlA?=
 =?us-ascii?Q?uSI59Irnl4AbUX7+XUAXl0TCaQUY8wpdIobUPOQWlHu3a+thXZbqjAVlixFB?=
 =?us-ascii?Q?SZdcLmiYm3gQ+h1McoTitCLcyWzNwjgp1AYB9fD1ELD8Ni18P0RrmRdmTwAx?=
 =?us-ascii?Q?Hmmesip7qz06nAxwKpOHhNZRqQGRahYnJRBUXCiV70leegUjj9KmKyRAGTv4?=
 =?us-ascii?Q?rIlYcdxebiLWyUav7pxuNlyhgKYqTPJuTO2fdjOH3JgeaZb7xaZXXE0etNm/?=
 =?us-ascii?Q?q3BeWRHm4msYcufVVPM+zdDnLaFlRJwrH+rY4YhUtGSEJndW69hjRvOIBIRr?=
 =?us-ascii?Q?x7uqX159iJGNOgZhzSAiXGHGWLR3JTBAIYzLwEBBUE/1F9zCMKIPaOMIMBXi?=
 =?us-ascii?Q?UFQSwrcAS7l77f/Mj8/xKSs7a/c1cMyo2R9dLqB82G0IUI7YOI2OEOfnLad+?=
 =?us-ascii?Q?rrR5kZBrtTc5TS7ltBU9Bka9qviTfwx2L3K8TyXzJpruSUstXDMQl19DrWwZ?=
 =?us-ascii?Q?djZR9hSTnCkGjFOGrmXDDw8cuFYwYQxIIEgR1lhnhN9AD4RMJAXhqvRIcukw?=
 =?us-ascii?Q?8qtbzVPcNc3sSHTa0rnf3l/5MYrzv+UbQ++lf2B1xqb5BOzTB5ZsI2caTTct?=
 =?us-ascii?Q?8SOJM3XIPmxwSrtN0INW5ewbowygHPhUQxb5iZACIjPjU8nmuzQITXAi9Nxg?=
 =?us-ascii?Q?mWrnObsA9BNgT9UV2UZE4ZJjHi4RknTrPY4UjSrRMyVN4xdRv+0H7jD6ePQH?=
 =?us-ascii?Q?ONtnqx0o1LTtJs69t4YE60Rbcd04ay1kIKjCl+SBu4yo/myIlXTlDXZbwITQ?=
 =?us-ascii?Q?cBjlPLh1b6tud19BdzkDpj1dAfTrRuqnfgiJedhdtNsjsTF3Rouh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ab8415-b77a-41a2-bde9-08df02281ada
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 21:38:58.3725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JubYrENh2l1Dxr4Z36b+2Loq74SJJ199g0EA7x0brq25Pq8qVjS32/piA63Rp1OIArGv6m20Yp/y2NQfC8O+Kgmtd+mZJmDi5z8FotNgZhAP9dSABCnBsiapkFDebA+I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8335

On Mon, Aug 24, 2026 at 03:14:51PM +0300, Sakari Ailus wrote:
> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 32 +++++++------------
>  1 file changed, 12 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 4769931b1930..9152f6ba6d7d 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -909,10 +909,7 @@ static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
>  {
>  	struct ti_csi2rx_dev *csi = ctx->csi;
>  	struct ti_csi2rx_ctx *curr_ctx;
> -	struct v4l2_mbus_frame_desc fd;
>  	struct media_pad *source_pad;
> -	const struct ti_csi2rx_fmt *fmt;
> -	int ret;
>  	unsigned int i, j;
>
>  	/* Get the frame desc from source */
> @@ -920,20 +917,15 @@ static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
>  	if (IS_ERR(source_pad))
>  		return PTR_ERR(source_pad);
>
> -	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, source_pad->index, &fd);
> -	if (ret) {
> -		if (ret == -ENOIOCTLCMD) {
> -			ctx->vc = 0;
> -			fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
> -			ctx->dt = fmt->csi_dt;
> -		}
> -		return ret;
> -	}
> -
> -	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> -		return -EINVAL;
> +	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
> +		v4l2_subdev_get_frame_desc(csi->source, source_pad->index,
> +					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
> +	if (IS_ERR(fd))
> +		return PTR_ERR(fd);
>
>  	for (i = 0; i < csi->num_ctx; i++) {
> +		int ret;
> +
>  		curr_ctx = &csi->ctx[i];
>
>  		/* Capture VC 0 by default */
> @@ -943,15 +935,15 @@ static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
>  		if (ret)
>  			continue;
>
> -		for (j = 0; j < fd.num_entries; j++) {
> -			if (curr_ctx->stream == fd.entry[j].stream) {
> -				curr_ctx->vc = fd.entry[j].bus.csi2.vc;
> -				curr_ctx->dt = fd.entry[j].bus.csi2.dt;
> +		for (j = 0; j < fd->num_entries; j++) {
> +			if (curr_ctx->stream == fd->entry[j].stream) {
> +				curr_ctx->vc = fd->entry[j].bus.csi2.vc;
> +				curr_ctx->dt = fd->entry[j].bus.csi2.dt;
>  				break;
>  			}
>
>  			/* Return error if no matching stream found */
> -			if (j == fd.num_entries)
> +			if (j == fd->num_entries)
>  				return -EINVAL;
>  		}
>  	}
> --
> 2.47.3
>
