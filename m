Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013027.outbound.protection.outlook.com [40.107.162.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F0B33DEFD
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 15:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167815; cv=fail; b=dW/xjWVjBmez7+bxCSsj+ncO+hq1eXOxdcV4SgP93DKwVaHwof3mPYcvr5lBxIjs0GifE3UWWtQmE9/PHfrcNJHBuQKqFVNJxPkicBY0UclWInI94jq1psWxob/pFeBfrQz3WbBj6qTCs2ImGRgVCWQ1xytIa6tDXR7D0In1608=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167815; c=relaxed/simple;
	bh=fSB9/NShPVq3+1QtRTDfhoR1gjYK1hQb/l19RPtDKiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rlYb50hAnbr60vFMHHyEDc32RrcI42oGqA1/gew4B3y/4x2ZFF7XYIqNWh4NFKx8qu4y9ZxPwSYNTJ4MARNbUthzs2FUm88IEksixeMICs5owhc8QlU6BJGO2UIK/zHddRwmwv+j43kPNLhvmCgcrkNnxG+nzWtWV/FK8LcRoV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=go2FBZ7F; arc=fail smtp.client-ip=40.107.162.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="go2FBZ7F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1S6udoS+OeN3m/UT6DHjHj8YuyNmiP/4P9KLjV4iAfWACgwI4Zh0otr7mES4/tgk/oCG033iD6Lmh+yf27ZQ1XIb5Aa43gGYsffwOg3J9DXvb9IV0BOAv5LmXXIO8ukqe0aOEMIAGVd0mGrtq5ZqDZZVgKhrYb/v4pBEa1B7nk0hMVH1+fl4JvhS25kAOkKDFEH9Fd2ABEzW5UL1QpSwQnFZvkwug1qnXHMnwVvEF+Chv0lg5vmHDG6JKc0Q1Pmnov3ujrmevr215ueEVvZOA4rCw59jXns4daHUFfqv4vNE+/p1lzOGfhMbuFmF9XAo5U+FvT1FpwHQB7d2FIuxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aEEWdDlCM5wC5F+xOhbxt8HnpnvPni54kEf5zXZ4qM=;
 b=L/jhS6Lf+PNIQc4pZuSepB8ECGAKYDf/kpKbZejwvBCHGT7beo/gJOrtZl4kjcK05VNQiY21zLNSQF9DJOIX2f6n4v2dYF9nhAjephM4faMum3GOFLENXElqgIeZ9Y2WidwLXAgdoekdKomSbmFljjHyJq46Bssth0zSwDrW/h3lS1ExHF5C79rQGmkgm6knGwRGxQ6C72MCx7lNolPzb7T60wl7tQ8WDVaqVr0tKq1kutS48s3IflS9q35XPsxuqJI4zl/IWhcU6ILchWJi0BOorSjPrex09r7AKycS0GN9R0iMsQfLQFcI12xrtwBsnopBNCrvY7UNeGzB7KA4Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aEEWdDlCM5wC5F+xOhbxt8HnpnvPni54kEf5zXZ4qM=;
 b=go2FBZ7FQrEjTuCAt+EAa3arLEzyHmqwU6uBmNJKuvfIrNja9llbTaslrPmHW8r2wQEnDQGox1U8/YzJh4/D5cFKyGFa0f3KLrfaHtTvugx25C5ub65CjfdWmWCXvRYfqW9fKJaVbvmEvnkyCqYm3AjD39Fmdlr3sJCQAvCkQmabJ2f7syo5grDEq6gIFxWFzduwtW2VqUK2Ywn6O4eccUCWiv/eGPCfuJcECrBvyvwi4ETOPruINnixirMcGhm20enkv7LlPgOFuqZ/Nc0NV61pvj+QLkGb1A58M3Q1FHWJr4Iv7IY0BjII9JOwz13DMQb7z6YyiQ7CuueOqnzutQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9886.eurprd04.prod.outlook.com (2603:10a6:102:37f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 15:56:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 15:56:48 +0000
Date: Mon, 27 Jul 2026 11:56:42 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCHv2 11/19] media: nxp: imx7-media-csi: use
 _vb2_fop_release/vb2_video_unregister_device
Message-ID: <amd_unOM_csZqJgV@lizhi-Precision-Tower-5810>
References: <cover.1785157986.git.hverkuil+cisco@kernel.org>
 <e6523ce61991b99869301ab78c2f055343e28014.1785157986.git.hverkuil+cisco@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6523ce61991b99869301ab78c2f055343e28014.1785157986.git.hverkuil+cisco@kernel.org>
X-ClientProxiedBy: PH0PR07CA0054.namprd07.prod.outlook.com
 (2603:10b6:510:e::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9886:EE_
X-MS-Office365-Filtering-Correlation-Id: f53743a7-9638-4e10-e7a1-08deebf7aac6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|18002099003|10067099003|22082099003|56012099006|4143699003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
 v5zC7Coc3ERg2qlrnYGvD8yUBIuMtV0wmK4ufLAaFd03mP+UmZuw6NafkqwRC65EMxTfyoFDpmMUAqQScXXiYXToj8qhqW7mtbi+Owjve++sW3iY1+9mx0qAoZ4T4z+3aXiHmZ+00rcokLQMPePOqd8v9kUupG3qevhEnLAKCZF8Ie+DNVBdxEz5kG70mV570TKjXxrmDl3MO7yoFoH9pneIEOhWg1S1NhAs7flx/cg5btJPlJG0S7PophUr4512+woNkNPW0AsoqXAHx03TH3TFNxw0RtMvsSXwX0JJqRe6FaNmadNB29zkDe3Qk6WZeSwZGrOUTgdb6BgHxmEgRTjGx47KYlXeA+1gzuzuwuCwr6O4xJbRB/u37KHzZdFFmTUKvIAQjv/FJmvhtVMwvIEVyPUVrgEDQO2OCPRVdbQF60wj5CloHez8wj5oJzrekfG+24Um12gsZZYOK63+8IqPufbN+CpYxiWZJhY//5k2PgOGz/NdFFLbouoxJll3XUya8dkZ9gsZCCaVVCGxsmYPY6vKtma6zSK6Q0wwDglZsSv26zsEnyqC8ZdT9VNFzG3sc1OjLmew2TMteUF5qH6qCy/E9pI126mlXWoR1c+b0s8hL12WsmfSErRyEVNYLs3BlEfLWoiMgcDp1GQpAvm0AzIsm2lxqiZWGSojXFE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(18002099003)(10067099003)(22082099003)(56012099006)(4143699003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?n+lQRt+uj0ekpobRWwekOXz6KYuD4PIQCSD6bxD9KW8Nl5cRbsiXhZZFhA4i?=
 =?us-ascii?Q?K8l1plmJ7+F+T68pWb0skvxWvX5bCfKBmi+zw166P63xYmYwrQ95zCgNHJQ0?=
 =?us-ascii?Q?o9j/gTo/xiy5eBDeBq6UCpc2GFRQZfqorLd+9ir/KsmaB+1j+bv2e7vezxTh?=
 =?us-ascii?Q?ufsTWsXTdxKOYcdw2MtYbHl2ZBZklxe+Ug7Gy+3zZGhtHYP3mGPCiFJ2UOmc?=
 =?us-ascii?Q?HpG/+pwC+hCTIOceqBCansZxwNLWXLsy0DZglNy+SOcxD8vocmVDi53pzUYf?=
 =?us-ascii?Q?hV2GB2Dm+OmX2RvxwB+w5g/T27yGbScVNN38jmAJ++kupScYAPrKfifg8qil?=
 =?us-ascii?Q?wkhmU/if29fK1p7nkhGvAZ8jDkJncPvK8QnewpUnPikx+S3nrJlKevXYDhcb?=
 =?us-ascii?Q?1CqsmzlbE8JynudO+aBCdC11Z0TpwRy74KXR4lMicstz+QLc8IGF8Nv++kdd?=
 =?us-ascii?Q?e7FhQPmTQihFiTTKinAhcs/Pc/TuuJBJJKfg6VAShwWLQhJUEVZZkLxKkz7A?=
 =?us-ascii?Q?A7ppffDD+uDPhDTjbjVfclzt7vSunJfr+SHbRi4SXITQhuFIAksbA65JeAMD?=
 =?us-ascii?Q?ni77AIiFFB0iF1Bp4iut0kEkdSelK4Co5etSq0bGu93pLHS3qOFttnufEDd+?=
 =?us-ascii?Q?B9wSP2q9v5y2msaloDcoD8AnnRYy4hRqyogKl5Wcn02eJJ6NOD3DAupv33i7?=
 =?us-ascii?Q?6mtXb82vA/zLCRopgVleNyWrWsMc6k/I0z94myDwmJHGsRam4ik7+c28KbR3?=
 =?us-ascii?Q?vWOgR9JKo5LFC1NSDJ/ehhlH4aHvm4l/5l2Bu6S5V769Wziv8UgB1N7gmwND?=
 =?us-ascii?Q?opa+SG0bh9wfKtN+dQ9jwo1CssDAq80oR3Tdn8VYyYMea2aupEvpXP7xXC3B?=
 =?us-ascii?Q?85o6wrhrxcAVJTTUD3TyGBPwIxz/s+Qan4POmudcQRsVoLnAS31VGrWy98vu?=
 =?us-ascii?Q?86yIkQyYGxYz/1qs2en4k1bfnNX1gxhPxj7DTKeeDzci0zFr9mfuppMBJvWy?=
 =?us-ascii?Q?GhWyuSJEI3bxnt7Oo9dIXeW+sQKBleBPBJfvq4dQhVz0mZkJI/49tzKOVYIX?=
 =?us-ascii?Q?bqgUEMttYlZE7srgZ/575CDQOxPn99P7mWbLkRljfkluO7Y9o0CoN4UW0waa?=
 =?us-ascii?Q?EqtBNCP9iDYJo4iLTBdeLuNtdkmNwuCeiSYFBk1Xy1I1Mc7nqDlV+0UnjHpR?=
 =?us-ascii?Q?699qPwIkRnLhIzdIhU50T0ILuT2rPegPZ50Kz+DzSVJop277mQyl4hbOb80y?=
 =?us-ascii?Q?xmNXyMr1DASWuAgqNo5pY5PTBhOzdzn8Q24PKUjtHQgGq7dKh109JP6QYKJb?=
 =?us-ascii?Q?PY5L33JZEVHcIB4ro5B/WbPqgEhKeol7PwlrBEqWKekui+WIODUuthX9Q+uv?=
 =?us-ascii?Q?PsAqKmbNviu7FKeV0POGRhAxWOOalXUMgiATEdZ5/2pWQ3C0w0Cr2LrSitjx?=
 =?us-ascii?Q?QlA4GNEoaNRkCEUp6AQMyYBVMfZJbS+PWuw2XjmULvZwpSwAeVg/Jk/zVxYJ?=
 =?us-ascii?Q?bu4m1d32h8FVQbHKvWR4KvLFVMOIkMZlmyTSqLbPUYzyqUIFR9G7zi2icLHE?=
 =?us-ascii?Q?z4noDfV4jyR1YFiUXmAi4BKk0k9S9NGOyEIH6NB4kh5ffB/iQ9CzTAxGPh/p?=
 =?us-ascii?Q?IPpaLYF4al74HR0KP2tDolVaCHukiHZXW0FHwN3ok+L5246bazt9Z73wrERY?=
 =?us-ascii?Q?Vb3uO0QVlsY6ata8WfrnM4Qt45JHbfmqGqpn5vynouIFra2sTd9uaxoUX45d?=
 =?us-ascii?Q?u3bdWfjF2VkcQwKdYhBn2G6zID32gFfCgLPvIsYVyQ2+nFqy5mDt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53743a7-9638-4e10-e7a1-08deebf7aac6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 15:56:48.9371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qNvUK7oL+Hs2918s5oREb4uwaieAXw/lYfeKC4BuIeXN9UBzNBw+MuN4jCEr5SUjTX0w/OhXwr5n2GlemBpv3PWxnY5qUM3spFDVU7r62GWCgWRU3ewjYUMpK9c7JEl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9886

On Mon, Jul 27, 2026 at 03:12:58PM +0200, Hans Verkuil wrote:
> The vb2_queue_release() function should not be called directly from a
> driver. Leave that to the helper functions.
>
> Use _vb2_fop_release instead of manually calling vb2_queue_release
> and v4l2_fh_release.
>
> Note that with this change the v4l2_fh is released before
> v4l2_pipeline_pm_put is called, but v4l2_pipeline_pm_put does not
> use the v4l2_fh information.
>
> Use vb2_video_unregister_device instead of video_unregister_device
> to ensure vb2_queue_release is called inside vb2_video_unregister_device
> when streaming. That way streaming is guaranteed to be stopped when
> the device is unregistered.
>
> Call media_entity_cleanup after unregistering the device instead of
> before to ensure that the queue release code can still access the
> media entity if needed.
>
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx7-media-csi.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 7ddc7ba06e3d..cb7a198a2ccf 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1541,18 +1541,13 @@ static int imx7_csi_video_open(struct file *file)
>  static int imx7_csi_video_release(struct file *file)
>  {
>  	struct imx7_csi *csi = video_drvdata(file);
> -	struct vb2_queue *vq = &csi->q;
>
>  	mutex_lock(&csi->vdev_mutex);
>
> -	if (file->private_data == vq->owner) {
> -		vb2_queue_release(vq);
> -		vq->owner = NULL;
> -	}
> +	_vb2_fop_release(file, NULL);
>
>  	v4l2_pipeline_pm_put(&csi->vdev->entity);
>
> -	v4l2_fh_release(file);
>  	mutex_unlock(&csi->vdev_mutex);
>  	return 0;
>  }
> @@ -1627,7 +1622,7 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
>  				    MEDIA_LNK_FL_ENABLED);
>  	if (ret) {
>  		dev_err(csi->dev, "failed to create link to device node\n");
> -		video_unregister_device(vdev);
> +		vb2_video_unregister_device(vdev);
>  		return ret;
>  	}
>
> @@ -1636,8 +1631,8 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
>
>  static void imx7_csi_video_unregister(struct imx7_csi *csi)
>  {
> +	vb2_video_unregister_device(csi->vdev);
>  	media_entity_cleanup(&csi->vdev->entity);
> -	video_unregister_device(csi->vdev);
>  }
>
>  static int imx7_csi_video_init(struct imx7_csi *csi)
> --
> 2.53.0
>
