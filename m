Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77F64C8FFE;
	Fri, 21 Aug 2026 15:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325350; cv=fail; b=oRDH/RPgoxwvuf9E/tGS409jwBfbmUZiaGGVBu3UVCfbyL8PnfISpCpSKx+WbwgY/yqg/sQUVJ0P7ndLkzSuXtcjtTjMUdkBNurTHZmow1MVlCWpiIbrPNZUntsBJ/jCnieOrCd5zyy+RN+PFpNyS3/LxXH0p3wgyVkElNJj3uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325350; c=relaxed/simple;
	bh=vspJoBRlHtg6PSIC1gqGJxQHO1OLFnS+x/wy6rkgpj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HDPSuCh/GLEskCEwKm8sSq6oLFTWcyzewA2GKsDScOBoAr5+EfOrOPx90tDafmrHhTvo1604f0tePy+2Lwi3DqvcwyXyQxx8CiIotOUOkPgIsHnVhKlYzaViVUTZPkft/xPSXuPiNYWosWF7tVMngbGkkp7kX1551I6AZnyD7SI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Tzs0mUK6; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Tzs0mUK6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIEYrWnKynLLrQGdKCWB4JOfNRorCrG9hkNj74NQMUCGV8M+N8XFOcon3Yzu6ILtTg2aCg829r9KWMygzHwgit3dR5XkGcXhHm5hxlBtxauTJ4dcIQ/6PPAmicGUaE9iAu1xEb/ykEuwnZQj3HGVFnz/oIA8ISB4c/b24MO4WvzrmW/yqLaYWIZatfodrBjh1yfDyEqgQUOfQCtPvYXQXJx8U2tXauMEFMiH+Y8Po6fLrdk5gmuIJBatjc9L/jkzbbAd4u0yrcx6Ne6LjzsFfo74o/EWBmj//wetliXoC+Pu51vwXN5r/U9iAbGc3xIiwHgh6SG+KOZ57OmYgV58cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fudzCWYZCqhWnyRX8VAhAx9Pe9K2t+yDgpDseW7BBmU=;
 b=hpqeCDOaoCv1QpwPEbPC4cWQxp3fvsoWCLpSfgN7r+UlqtmpQpXLgqSX4y4t2FUBskrgU0kGCnSUD+nNUEyFG+50V3nsXOhbzWkdbiwwd6IUMrdhAON3H4O0jIFphmn9r2zgrFKbuMFKh/qqTFwjB5Xn4bQCeg9dXbrxiGK0o+40guoJ0BPPM3SNiNCgBWKxVLvLKjTFDpk47KfV+Pv0p78D/NdOjIwOCkAjo9YicbmS2lgCihRBjNq1gugnn87DtORvif6PLXsAynzhZDmVRYcIGrdDNudJ/EWMeVJJ11yEdX6qgEO9wKuiRL740xjVokEaHM+eiY+uYWezgsRW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fudzCWYZCqhWnyRX8VAhAx9Pe9K2t+yDgpDseW7BBmU=;
 b=Tzs0mUK6caHD5OQdzvpdFAJLaQG9nmCwr2YLzHXgwZtDq0jIQ5o3b/CgyVMegyyqiqK7xrxG09k+JJjtQB4wGSUNwdON/4DNi1FxbmTQSm+INeKlTORV0BCI2SNT6ptN5pDjC/sCN14/2lr5eIQy7Vys8jNRH+6DOCjlH4SoqESwNa9g8BMyws4PSljFvkhEobui9hXGhAu+MQqk5vxwxpimJicXMoQQyYB7PN19J6vKzxfrEOKckhrD/7sCUxh2AZQPjf+TF7b3pby/HVY10+rjezy3e1d9A3vshjhDg8G84mCWaBxPwPHEbGiKanjln6rpkEHXIvBEh1J0r8cOJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 15:15:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 15:15:45 +0000
Date: Fri, 21 Aug 2026 10:15:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Michail Tatas <michail.tatas@gmail.com>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: verisilicon: rockchip: Fix leaks in init
Message-ID: <aohrmDgzhRxC6M_D@SMW015318>
References: <aoV3LLy5hSoKL4QP@michalis-linux>
 <aoXgSKnkbWZVKRui@lizhi-Precision-Tower-5810>
 <aodup3TleCfdxcF3@michalis-linux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aodup3TleCfdxcF3@michalis-linux>
X-ClientProxiedBy: SA1P222CA0185.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8897:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd5efcd-29fc-46b5-2dc5-08deff9712c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|23010399003|1800799024|366016|56012099006|11063799006|4143699003|6133799003|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mfMk5TSqaHGFIc+ww0X3iQx3ClujRsgX2COWP8xoQn2O/sHFeJSYd++NEjb8mPwF1HukC39e+FpHrxbA3SEerkwxYfeZNmw904vztG2ST04Zx7Wb9IQc79o01DypAAR+fdjjXDxkIPGlWwF71ERCKgYOe2SFs0Be8uWd/8f2NO1XuaJdgxRsSb+ELXjtv9TGvAAEMdnzsSVCXU4fBL2nQsXS90f4fOSI87DgZYGUnVbouLsUV1Q/lPwdXFXnafyD5cIKJULWxXfJCeq7AcZL3Rh5bDjwdQDP7/iM95aaCgr2LLhJKHxW4jM2UeC3LudDGG1rzG1Akd5F7/t8N4EEMtE4XHLdSvJm/XjA1Ue/zuzsr8do/xEUP7K6cX8tqLlpVHykjQrO9Y7ylFlJG3kAkryXVwNbverl0cTdtVvH5MYSivk2wBqUaNAxPdekgsfb9WP0hQmqmNv4oMK6uoFlBYv/+WQjByw+z3Za9N7OnCxz9DbzgFvuABzTGHTm8CbL2bQYEgMetyjtpyMINAPqNdVp/gDpSZ0UR2s7kEYUHdIRhDh9RbkSBrp9SbMmYYvIFYsCqwaye9A/Y6MkySONhRAi5MZvSlA/mbWXZedUvRZaK2ULCl/hsMBnarCdgKpi7W3aXQIChG2fgY0dPPlyiznDNOQhxpP5538MSabW70w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ov7/fZNTH9g+bkQbN1XySq0j8HQsDE5LG7imEJAYihvfrksOnS7cVn5AKmbm?=
 =?us-ascii?Q?92sNpjttALOHNz2KUHJu0kocJPkP0pFIGiBXTdXCasochzBE/6zqmB985mET?=
 =?us-ascii?Q?FYlgpwmhoOn94+NU7s+E34Fw1FfWZEk5orlrSLR3kVlcE5aNGvCGtNKT+eJV?=
 =?us-ascii?Q?YPlWrbHt1YehRFkmcAs3xLE5NhJlUxNuJv4y8kmD05AfkrygaXLXMGzXgn92?=
 =?us-ascii?Q?k17AbfEbfDSKOF7gHc1EcqRlpl2Jmp6P0F2OqdC3GSUYPaZzO6jP/jYfYdIC?=
 =?us-ascii?Q?KCI+tF79zJHZb7fKAHz0szHr1dZUaty6o+i4dDcZ/z5AFt7mp0U423QUpvOT?=
 =?us-ascii?Q?hcuRd28y0dGH5P1PI2t8Ti/Lcl/YXtbS++8kKzhkO42pl6CjWqR7mDt0oS1P?=
 =?us-ascii?Q?QaDfz2D1pvC2yb85YVdnDBgoC2lsD8NfroOQrJjhi2Jc2IwQqvK+HH1HlQSY?=
 =?us-ascii?Q?qbicXMqvHwrR3ok+0bAE8P6b5ss+6i3fun6bnnZpO5e8VZjUN0dE03GQh0Ol?=
 =?us-ascii?Q?VZkkPpT220zb4BVGbL54ZZms45FLppeE3s3+zCj3gunA5es5/2P0a3CJhACY?=
 =?us-ascii?Q?bJELUGoa6fP4ZK8ms5WHZtmR9b8LqJ0pFyKyveYCB0X1rTs+lTSEA+lG3cY4?=
 =?us-ascii?Q?rakOas2dTpMOWBBukUU349iSi7ORfhW2J1eRw9eHnpfSHCqVGd2J9687qvd8?=
 =?us-ascii?Q?/bULvO0LON6C018fm2oxmxj7YxoqIxyTjI49HLj7yvbD/rohTjKGdO5vVpbN?=
 =?us-ascii?Q?KlhTx94fuqF5GanHW8nhi1XbI24lhmZE10u1e8DekFV4YWMuvUv2B+fH7oBx?=
 =?us-ascii?Q?cUf5Ew19ig7vxCDYjmZR9SAbIIZqglKOAcCWz6rOdb2g3NuNLG6LGby+CBKR?=
 =?us-ascii?Q?hI7G8ZJ1fkwkDIzRKXgixxUXVLUFyceF4+/3hqON2/uniVDuGugvTL9Exd4P?=
 =?us-ascii?Q?BHPX4TLALbbBg0KH1aHEcwR8mvnj3Pqs0sbKiceF2r+8s9BsgUxFs4i1Ey+t?=
 =?us-ascii?Q?ITBli1+zTLLDdbzzzGOyZiiFOtBTCaj8Z3jxP/QPO8FjVpIQn2GNcb0OpCIR?=
 =?us-ascii?Q?KMy5qYYhmg1Thjv2Yv6U2oZBFEiC5xzePzv1XbwahPkryAcsaqMFowEm1Ek6?=
 =?us-ascii?Q?ghjE5BGPs13WLe5HM6by5TkH2SZlYZswCcovQgnmZ/wTf+wOv2bdGOFaiJi/?=
 =?us-ascii?Q?/smWFrzNPKjCGGQI1c9KkGAFemC9JvWMO0d3cEUbjKkkMLq6GXO9vIzMrgNK?=
 =?us-ascii?Q?49unwWB3rPvnHYU8ZxEhvUxNSWR/cGbIdGOymM8fexF6T5FQkWSmx+dEE6rs?=
 =?us-ascii?Q?wNNG1MxUjWdLju8j9CMnx59dg5Qf4B1437sGwSUZbzcJxFS8CIiKa6pTVb3y?=
 =?us-ascii?Q?06ILYNkxjcEoXAofPNT/bp/VGtegtKJZsURJwiCqRfPbhRaRDlqYG6KI2AEt?=
 =?us-ascii?Q?QLbpVkqClzwD/8/0qBstnPw33w5K9+5XHIrxOmGbc3SnXggsfQqg7OUw2fMd?=
 =?us-ascii?Q?2GngZEbeZuqKFgw1JtOd3UPz7bsBHModtv/lXMsNjgmffiMCP3h8uDkgQWgL?=
 =?us-ascii?Q?cL8db8eOwN6Mkdj+ZKz7OSPiD/oBlxHPTwZgY0HoJ6p6xreNcyPLGe4yRetL?=
 =?us-ascii?Q?FWxz37Vhr2lQPiA52KLlUjX9KucW2Txu/wwFC4ZtomMGi2Zex5wIZrouGtIm?=
 =?us-ascii?Q?eBoRDn00CRyVeyUZdPpTnFsvSLWfv0FmS23n4wwRQsmmQuxhw7xVxqGGd7IS?=
 =?us-ascii?Q?kv/GsbEXTliDzYsxP6y/miuH6txoY/fcqwV5cTnubcVtQwxEJQ1d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd5efcd-29fc-46b5-2dc5-08deff9712c7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:15:45.6265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKN68Tpbo7UzczTkD2ro9rXYNhJ4uV7KiaETNJpdOa184ZjhIykrxgW0Rd9CGgtBJQQ1hiKvYQDy4FBbVQpdSYjFl5VzUjhKE2Brh2W4cBUkxUJ/9OfiAqp8klLBko3f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8897

On Fri, Aug 21, 2026 at 12:16:23AM +0300, Michail Tatas wrote:
> On Wed, Aug 19, 2026 at 12:56:40PM -0400, Frank Li wrote:
> > On Wed, Aug 19, 2026 at 12:28:12PM +0300, Michail Tatas wrote:
> > > if one of the dma_alloc_coherent in the init fucntion fails then
> > > the previously allocated ones leak.
> > >
> > > Fix by freeing them in the error path.
> > >
> > > Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> > > Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
> > > ---
> > >  .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 68 +++++++++++++++----
> > >  1 file changed, 55 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > > index e4e21ad37323..fa77fd402412 100644
> > > --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > > +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > > @@ -369,6 +369,7 @@ void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx)
> > >
> > >  int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
> > >  {
> > > +	int ret = 0;
> > >  	struct hantro_dev *vpu = ctx->dev;
> > >  	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> > >
> > > @@ -377,39 +378,54 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
> > >  	av1_dec->global_model.cpu = dma_alloc_coherent(vpu->dev, GLOBAL_MODEL_SIZE,
> > >  						       &av1_dec->global_model.dma,
> > >  						       GFP_KERNEL);
> > > -	if (!av1_dec->global_model.cpu)
> > > -		return -ENOMEM;
> > > +	if (!av1_dec->global_model.cpu) {
> > > +		ret = -ENOMEM;
> > > +		goto global_model_cpu_err;
> > > +	}
> > > +
> > >  	av1_dec->global_model.size = GLOBAL_MODEL_SIZE;
> > >
> > >  	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_SIZE,
> > >  						    &av1_dec->tile_info.dma,
> > >  						    GFP_KERNEL);
> > > -	if (!av1_dec->tile_info.cpu)
> > > -		return -ENOMEM;
> > > +	if (!av1_dec->tile_info.cpu) {
> > > +		ret = -ENOMEM;
> > > +		goto tile_info_cpu_err;
> > > +	}
> > > +
> >
> > This function is called by hantro_probe() if I am correct
> >
> > there are dmam_alloc_coherent(), use dmam_alloc_coherent() will simple
> > error handle and tear down.
> >
> > Frank
>
> Hello Frank,
>
> I did not know about the dmam* functions thanks for letting me know.
> I read some of the docs about them and they seem to not apply to
> this particular case since this code is not called from the probe
> function but rather the hantro_start_streaming function. Since
> dmam_alloc_coherent() only releases memory at device removal,
> it wouldn't free them when the stream ends and a new stream would
> re-allocate while the old buffers lingered until detach.
> So I think manual dma_free_coherent() error path is the correct
> fit here.

Okay, make sense.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

Frank

>
> Best regards,
> Michail
