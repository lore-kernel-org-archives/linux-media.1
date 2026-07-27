Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9D73B27DE
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167753; cv=fail; b=nHXxe4thSq3PzXRyVepf+K+xaRG8vzaJBpnXpHqjpNJwvtM1yNMaWn7SZRFMo1FXNOUpdWp8iIojRALHvxjMuNAtMSytazRGwe19tlluEMUDRN6k46uEIpqCwyQUeZQRqSD9guHAufj7hdQubpsjhbPP411GeFDfWTtA13TyhMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167753; c=relaxed/simple;
	bh=AqgI2OBd3ya+LCZRERDp4CnfcieEbs9TIbwuiTdk1KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qKoJ2PY+qSRL76xitJHrZPMyjkGVnjR93EgtBHS+4MYsZfIQ59ehiWC62064gu4kzE1MxF80jbaFJqbVhoYShU3an0kn2nfzXwCb/oj8hyNKl9xXOpxR/cNAPvW1xaZ2SHlZ34lS8vHn8jBPDZw00LS+fIZHTdA7Cwv66F6wj80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZjuQ47HH; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZjuQ47HH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFusC/EqMG4ylz4L66dmMoOh5HfjL8lY8+BzyWWqxbm1HJsT9gz7CWgE8XUeBC6tIJBCn5IpOfw2iTfYT/TP2l8WDpxxE3hWQuXyYrAU51qTHEA2UQct53mmiL61dhYmFqh47j3+fDPq4BI+fsci8NloT949JqnfWIu4VjnUqEfucJ+D2A6TxjLtJubrGocqw9r2dm/zMxK/RhGVZ20fC6OUrK0/LWeitoR8WR0bhZSJ0tGTvBlkyLl1UtDqsQHT/G1O075kw3l7dEmlm9rA0JUPyvl7M5jTdj6v9zcg0wdcFqRfVbwLBRIL4goFilZguexmTWW7VSgF6RfSKNvVjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kc3oE4UBbHh2qKuK6THNIo7wcp5Vz8IZ4GQjrbhaZBs=;
 b=lEWOP+oLVQohpNuNMUefqLdBlnn+50ZzlMN926xdSj964Wx0ccu7dbVtqkwOaQECFGn4Bzqz540fPXZx6983iSHFLLhR/U9vmpRBsqKyQyVyLTHTADDgjSB5WXPDMbKz+PUglw6hWSX/DDk6cRR15ih5VUZpJeyVq9wUkvXcPu3g/0tGVUWJul1DT8KO1AInuGybuQEs+0FgeATJdUKjN7i6kMSiyBv4A0XGHwk4aobbjgWMao/N1m5YxH/kbI52K3OMLJS/r1mJpDQ0k394eUFTUB0trTkedFSzAisVlXLn4cy2hpQvrePvaQy0SA1Xl4ZPo6hP25ZIugzphEBYUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kc3oE4UBbHh2qKuK6THNIo7wcp5Vz8IZ4GQjrbhaZBs=;
 b=ZjuQ47HHd/iyhVosC23JVKSiiWEQwM/zI1XU6L1wqttVp8p6cJPAaNouVZuTsVecXJFRov9dIgbABe+9euRoei46T+kmGE4Ilm7myp6eIh8QvikDD88y6tEeMhKKn6OPC1cZtQt9J/1hU392qQRg3FNywONddzDZ2EkOMqfIdhBIVduN5TM8S9QfZDYyUqNxBFnN4N9qxm/WisVPowOSDrQgbhO9ejXlCeKdX8W1rGLiCe+SieAriOfIUyYqaRlLSI039eq390QGA1o1eeuuPZwKXjgFsZzu/4Q11R0QxEoSnmHJp71L621W2mjiw/juec60l3raKeMoP1pOTmgJYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11950.eurprd04.prod.outlook.com (2603:10a6:102:516::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 15:55:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 15:55:47 +0000
Date: Mon, 27 Jul 2026 11:55:40 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCHv2 17/19] staging: media: imx: drop vb2_queue_release call
Message-ID: <amd_fO0s9zC38s4j@lizhi-Precision-Tower-5810>
References: <cover.1785157986.git.hverkuil+cisco@kernel.org>
 <21af94d0f48c540359e7909d74e687c7bb998b2b.1785157986.git.hverkuil+cisco@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21af94d0f48c540359e7909d74e687c7bb998b2b.1785157986.git.hverkuil+cisco@kernel.org>
X-ClientProxiedBy: SA9PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:806:21::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11950:EE_
X-MS-Office365-Filtering-Correlation-Id: f4dd8437-1d44-4323-bf55-08deebf78656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|6133799003|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tACvB6TUohS5kDC7zDig1B1PuHQUkgwJP2LVZhEtTCzFPbOX85OxQ+1As0+wRGmD14he1JqUHLSZXyLEr5QIm1NSrjlSVH5VeTJ72siSXZdg7n4YsdoW/U8WFoH+u7eUuYvAPmvR38djHMHZEUb3fzEbjPzfh9RFM7v30XFiUQUYzjAXuk2AbFrlic5B1hNPZB7SRy6GKuCc09A0RR0o1lvCbKdvR/pI2oH41zVapgGBuuQS2/zNKI3wQ284ZQxN09XrWqVWmoEmNjyKhpuawTUK2p2HhBFyhXYCCHu8OF2+/KpNzrT291uIguCAyq76lcJcg/xMdFml59r8+vml6eBG8Y+l6KpNZ70dGrGuP1+MLBAbP23a7cV5KPFU23XfWNE7jvRbHTCVTK51YyVba3u+Uc3QE8QZeTwjZTrjNQIVNGP2IdaxD8wgqaaSCB3pkl8CrWEDtNfxYnCOQOZ2XCE+5SUCv2tnxCz3gLbd4eHxtvX7wGr/aqxv8s7i6+ErGFUArJjAGLw8E/WzgBnHhga3mNeNgaso/Kdd6zmBGUT8WiA4lTj7u27uOfsanaBb21IKuEoX++nHyjXgO3FGJ2CNB5iVTpEg5hB1AcSbpXoVod7yIMDHy4EK02eH3+rJ+UVuvlGHQu2SEI4mRTorcNH3xG7wPkJU2UC/fvecXoo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(6133799003)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IgOwQorISfbLqSw6pL4HFY7FyHSK2VnhBjrbH3TMl5ewCWoe8Qte+7y59Wi1?=
 =?us-ascii?Q?BvQgN2Xgg6zX9nxeAGgiGglgD7eRZnVxxLwnGMMorKVLd2XUyifRSNkarofb?=
 =?us-ascii?Q?DZ3uzyENqaTxYrKEUclq639B8tKS/mQblBlPuwm7S57KhNs9OSzZP+VNhUBf?=
 =?us-ascii?Q?AHob6NqUnyPE7SqDA0lwBAAaME6sDJBzPfRtjQJfx7f3D4Ckhal/w01t/Ps9?=
 =?us-ascii?Q?bK5Xaagt+4+rxi5Z78KZMcRAPuO75CY2Q+xIncG885Eg6kslHsG+VqBjIN6z?=
 =?us-ascii?Q?jzdEoWv8KEAGmVa6UnoZ9b8Hh96vChN/aw4gPDeuQt6yYXa0yJB2H4L9fWGZ?=
 =?us-ascii?Q?TGqXZhXHr6d+scu/a3Iy74F96/otRkyuN1eKAfFzDBfRZO7A9/qjc5Rm6mOL?=
 =?us-ascii?Q?t2+lEpZx5LoTScepHQ4LWfOWVBBw2CaifLiegFKbmBql3wEIMiLg0GjXgZMw?=
 =?us-ascii?Q?P1LqEvVVfFy31N/8Z0hi30kuRoZ8K7UMFM3VPOiyFrZ+cA06TBD1pYoQGlgf?=
 =?us-ascii?Q?zWMntFHPkucc4nSb8jeHkPGA1TH9/puPGXdQyOWGw2i+738dvj6lTYVFRNe8?=
 =?us-ascii?Q?wv82gsw/D/h0wWl7ir2XiLXnypgcMb5pdI6JSYXFc3HUUGN0tJxHd34UY9Hz?=
 =?us-ascii?Q?9tfi2mZgotaoWrQcth6/YKUKg6jErdJe9JgHSUYJk+vmkAq8IgJlMa4n4dqG?=
 =?us-ascii?Q?mFt3apQwgsN7GGDu0mS1n9Bi2t9MT3wVVHssv//Z4cAUbCA6KBrIw7M0reQ8?=
 =?us-ascii?Q?5R/rA+lUeC6ogtjvqVi9+RgPflfP95xLagFFBgNWGV7jv4YaNYqfQhobCayI?=
 =?us-ascii?Q?/gIrwgJjgTx8U58U7mBC1827dGLY1Y6F9POZ8aVwuL1sPfcrgj21a+yWoI6X?=
 =?us-ascii?Q?b8YOz42NYiIqFdngZvftPelfKjUcStgU+iHKgbYpVufBHMSGNl5IHK2jAPoi?=
 =?us-ascii?Q?bwHjR3nQBsKO2UMPdCTwhuYZjzGjnnLImk6IlBUDub7S+Uvbr7VZg+I8gKkL?=
 =?us-ascii?Q?H5PKlja0I596mBX5Kq1H6rfTy+VwVP+MWfgn0Bdk5fUcWmHfHwRaX37Bzh76?=
 =?us-ascii?Q?38nwjI6oonJYTQlNxSZ0IjwAWhxO3VqlJc2nCYcwyC7O8yMrl2ye7Te1WTwu?=
 =?us-ascii?Q?5CPT+hBWvXwuGB+AdM90woN8njnkEOzPBOec4nPUJ8GnUeehlqTC3JqlLAEw?=
 =?us-ascii?Q?S+j5JkHsOzAF9m5Y6j1lqx+dT1+xEN9p/VgxZ8xocvo62vbmfc3RgaOfR5l8?=
 =?us-ascii?Q?aM1ZbjYka3vnV5jFuOkqdatowf8IOtzLRIq01Kgm81Gc4Szx5m1SgjSx6pUS?=
 =?us-ascii?Q?t98tWo6lT7McOCryTCff2unqBop+oMjCU+E4YlAu08KTEla44llFW2nlX22c?=
 =?us-ascii?Q?G/7ugquhivVR3eKTGe50pFcKulrw1c06hU2+J+bWH8u+TtCFvKwjgLR83asQ?=
 =?us-ascii?Q?qOc5y5AUtK1UrScjxjQG3ZvIe4RSs1SVCl6TS+cpSDIBeoR8x5wO0I33Vh4O?=
 =?us-ascii?Q?pi0MQZm3YVy8Pp+fPKu/mVGS6ymbxpvq31dk4TrnFfEMOz9EDW92XUIaBSkr?=
 =?us-ascii?Q?8yNwyeD2yqda+22cQuv//wmPJXlj1bVAHCpj61Igq8sBfnSzj/azj9IHQ3l6?=
 =?us-ascii?Q?IOxLxfJ6nXrhOov3RVzVQZ0UnWylIcirELBD4yMatTBg5qS/piSVw16r4886?=
 =?us-ascii?Q?nVQYzUDxjzYHf8D7sm0ie+CpdcHPn2TRycLkOvvh7H6MPGcbePqkLfYXw2tX?=
 =?us-ascii?Q?gAQwvYzvPflQiBe4A3/+jn51tvlEUGw3AFoy6odlxXFXiuiaJzGN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4dd8437-1d44-4323-bf55-08deebf78656
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 15:55:47.9222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NO8cd6f58tO0U5hyEHUwOiFcy/mNcH+Bdw4CisLzpNavy5yjWjeqdQTPjczKzn1Q2Vx+EUqnIK/hg8ArwbODcHcYJqSdx10QbEP/GYuH8sk454H9pMADh1l700BwvRvI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11950

On Mon, Jul 27, 2026 at 03:13:04PM +0200, Hans Verkuil wrote:
> The vb2_queue_release() function should not be called directly from a
> driver. Leave that to the helper functions.
>
> Replace vb2_queue_release/v4l2_fh_release by _vb2_fop_release.
>
> Replace video_unregister_device by vb2_video_unregister_device to
> ensure vb2_queue_release is called from vb2_video_unregister_device.
>
> Call media_entity_cleanup after unregistering the device instead of
> before to ensure that the queue release code can still access the
> media entity if needed.
>
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Cc: Steve Longerbeam <slongerbeam@gmail.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Frank Li <Frank.Li@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/staging/media/imx/imx-media-capture.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index bfd71d25facc..85ec8f11fc62 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -804,18 +804,13 @@ static int capture_release(struct file *file)
>  {
>  	struct capture_priv *priv = video_drvdata(file);
>  	struct video_device *vfd = priv->vdev.vfd;
> -	struct vb2_queue *vq = &priv->q;
>
>  	mutex_lock(&priv->mutex);
>
> -	if (file->private_data == vq->owner) {
> -		vb2_queue_release(vq);
> -		vq->owner = NULL;
> -	}
> +	_vb2_fop_release(file, NULL);
>
>  	v4l2_pipeline_pm_put(&vfd->entity);
>
> -	v4l2_fh_release(file);
>  	mutex_unlock(&priv->mutex);
>  	return 0;
>  }
> @@ -938,7 +933,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
>  				    &vfd->entity, 0, link_flags);
>  	if (ret) {
>  		dev_err(priv->dev, "failed to create link to device node\n");
> -		video_unregister_device(vfd);
> +		vb2_video_unregister_device(vfd);
>  		return ret;
>  	}
>
> @@ -954,8 +949,8 @@ void imx_media_capture_device_unregister(struct imx_media_video_dev *vdev)
>  	struct capture_priv *priv = to_capture_priv(vdev);
>  	struct video_device *vfd = priv->vdev.vfd;
>
> +	vb2_video_unregister_device(vfd);
>  	media_entity_cleanup(&vfd->entity);
> -	video_unregister_device(vfd);
>  }
>  EXPORT_SYMBOL_GPL(imx_media_capture_device_unregister);
>
> --
> 2.53.0
>
