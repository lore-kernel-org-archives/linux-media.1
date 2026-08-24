Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013021.outbound.protection.outlook.com [52.101.83.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8890C38239C
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 20:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787604345; cv=fail; b=YZPSQE9/hQEJlG++vPpWVn1+T4VG9xKSR4cJEx1+W6jLaC+4CeKLNWe+OxOuh8A2hRIoPuhCKvzOEOoO2ouq3/UejSupaw26wC9E3rnZgHwPCpnZlzznJz21NilHEQR80DfYMEvCB7vhq9YgfMznWgGDgmXgT4dCN1YXbNPxPLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787604345; c=relaxed/simple;
	bh=xtEjdy/bgQE3RiyW92OfWNt9RGf3DBPtsI/+4hXim4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UQGSRWBkHYdQc8aeZIpROxa/BVy0M/Sp1eYsDpOSLUMw6fj0tr6r4yMEIPiMuqTSM0v+sQJ7n2zkJIrK89KbmFoyIKU5Ffgou8pzl6wNE0YKLrlj3JSPuXWX+6xpAo2vlVEd9aKpaTe5dJ2GO82q+iy5iZDh4oFSm9yEQFmI+/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sNuapAHC; arc=fail smtp.client-ip=52.101.83.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sNuapAHC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRw/0CDvymZeRHa1Jr3FYRJ9VEDmoz37PUYi4hNeI5AuswDert2ABfxAzczCAxSBPiKPxsqmSSX8c3T1+xqT7KA78Evd2f+7RuqTr8K3EK3EDlUaF5g0fdlB/mL+Cv0TeiqthT22rilXBmNWTvYUlE7c3WedqjkockLr+gkogUyu7kae6XrPTeI2Z/p3CjxoCygD6jjJnEen/U/q8QxFOZSXcXn7wTQHTAWV7dTHi2QPttI2iPTrbLI9NMiOGGCI8hl4ixYo8VOfAjM2oX1qO37yHc8pjbUpI2+OSBPph3uhtuRoyPbAJIFodox1K55fzOoFssYaqCL3K+eqmwZNCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzeyC1Bt6+WMyY38/2V7auHgVgRFmlJndXttcE2PJaU=;
 b=NIoWwKjxfSphLh+zLXd2QhGf/rzAFDLnqOaTNXE5iIdf4QukhQPcR0o4Zd+eQGmcxhO9/yahAQXpPmKDV6gPNsY64C+XeGxEKbIcD8sU9L8WMS53czHHEY2J1DCEMKx1wTWeLSwEoAV19efxvNwouBd4ZUOLmkP6vAdlrTrkzBl4/NT2UMjdrDt0Q3dvv9Ca/RCMpoFlgbRGMyZYFc2RK88odlJDFEcJFmYEHkG4DE1cgNZmc0pfwqLj01ieE31kbmTwftwkrg6qyUKc+Uoify9vrrdtHBnSPrcX4NavB6r7nbEJ4MOJP0nBOC/kkPWyhJOhijGjXMbNP7a8iBCdzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzeyC1Bt6+WMyY38/2V7auHgVgRFmlJndXttcE2PJaU=;
 b=sNuapAHCDFnORVrroYEYxiaolfZ5pvO+Ax4TQIz5+YJG4yL6nTBjOv1ahfehROW1gsdk+2+AYQmhbEbfMpdOOhHTa4Uh6/zkaVtdpAUHw3WgjmQoWwLQh9DJXP74XonLFTUmgbkxSXB32qco7NnOO7Kfs15vr0e7Evg7tArBYeNwP5RA31+GQG8K9tJnhcAkNeooGZ6YmZBldZfypHyKkiTvKXq6NTTDScKgoqSW7dmUbZdLPrNbEQPSUA3lZhNrUGPcNGUrxzcggdeTXNwH99tE9bcdbdp/i+6uKVVQFmxKMxyc+NCnIXcKmjtzs5jHGxDScLBDePtu0uBwSkjMRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10268.eurprd04.prod.outlook.com (2603:10a6:800:21f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 20:45:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 20:45:40 +0000
Date: Mon, 24 Aug 2026 16:45:32 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 11/29] media: rzg2l-cru: Use
 v4l2_subdev_get_frame_desc_passthrough_csi2()
Message-ID: <aoytbGJlwlMlMIlx@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-12-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-12-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH1PEPF000132E4.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10268:EE_
X-MS-Office365-Filtering-Correlation-Id: 039fa0b8-5f4a-4b27-a59f-08df0220a869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|56012099006|10067099003|22082099003|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UmHwfSjt+RXIWtkFebPS608eu/AGPiR7S5ypbtU97DRBO2l0W5TLKVhgS21CthFvBEXmgD7s04SdsaPVuTkF9ogrdbGL8aLu8ryuqdWLet3z0gGvgmW+scdk9iWW+QJIIgCFqiXan79tb/YwjEGkT2UMle/9d8YzYoutcKXgqcVySyMcOsO64WXttX+nfbO3OSOvpvmEDI623WRnwi1rq+/mXVMB1vVyZ7Pi2c46X8GHvi7Bt9ru1YPQ62rvvLlHSts19A+WfecBaswtPWLB7J90Eyr8FOhFvwNHI62TfY9ccRBrPzCBqjPYeRkOAmSc7x7Np1FXmiHCfvciHzlF58HsyltT/5kHJCUVu/eFR6are021KTSGXZdbK7tIxVCt9YxD0f9uYQZjbd8yiojwcJLscyuyesSWeRkiPa/Elm97xlX3x8ig0DwbaK1Scfeo3zlNTrEnbc0wq7vJ0nLXOQT8Ld1EkxjuGesrQtknWiAjRSWum7Fn6n7+8WIl92oxsJr+BWAT6uR9zw9pGyBc33g5a4glbZsfqh7FrTKQ85nfL3g7Ur3/pwPnutDFDmts20ZCx+qNXq9ynxW8gsdH2mxRLLdvP57U69H2g38zwbsjbhjA7zoZzjvgwLhAZuHzUpNjtEnbuVUWRDDXM7M0bMbVODotr5eOWCGPEj3ZOXw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(22082099003)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?34Ff3LJlSWs1Nmrb6TgP9qLZ773Dgnzlb0fl9Mith3EvV0t6VKNv5+EvjbQa?=
 =?us-ascii?Q?YW0y7tHNLrz3Z1GWcG4FX8FDxUGFCjWvZm+t5DqFWopPmXDA/wtw/yFEGvWf?=
 =?us-ascii?Q?IZld9duI4wKIZXEw+dFpzf7RoI/s6urVz1wLRGDCwV8B4tCKK1cG2JTcoES9?=
 =?us-ascii?Q?D4ALiH0AxRyB8A7uUcoYhSXS0BEMv0T4P96aZPhQt0b2yzV4zQJ34Izi8Bad?=
 =?us-ascii?Q?0C1WoqV4bARXPgloqPOwpOTtH7CPBt6IewNgXBdPlEdnELi4+xm38StXHNzc?=
 =?us-ascii?Q?Ndt/jhpp+8WX8lkBLbQgbzB1eJSueNfCmNtKxsBa5YqSQByLmgjsS4EO1hjK?=
 =?us-ascii?Q?Ev1h3F0Lwgxuiiad05oozVriQCyLH5WL1rQH1e7cXQOMhJIsEUBgbK3ZxNwO?=
 =?us-ascii?Q?QgUY92INdYjo3oiuNik3pRBP8MJBisMzlSt+djNQ43qVXnMNGi+GcHFE0H+G?=
 =?us-ascii?Q?cM2pWh64kd3q8vgsOGCnH+IVxLe4RGZ5SLFdfeBFZDECPwt9p+QuXTNIFxd9?=
 =?us-ascii?Q?HtGUdi2gy6pyz5qPI8DR53AmdOacYCfcuttUJhbBBn34i0FllG5jbHW75xm7?=
 =?us-ascii?Q?3Oj5X+jMpiYESfItwQ1RQ0wbohyRSB3tJAPRcXXpTM+OX7jtKHmxqI61cvci?=
 =?us-ascii?Q?13iSgyL2RHQDxeRhU5JtThzJkxrQHFfu8RvWLc3E72ZhbJ/tJge25B1Rus0b?=
 =?us-ascii?Q?6j20zEojMegXsEwN+Yhf8heNEScKP7Wn6c+LrjlNBwILxIK9cRl/AhQ5TTZ7?=
 =?us-ascii?Q?/jdEyx2A5tzRNZ1EXrfUpHv88a1huGEykgeLnvq2OY2znvQDKePXA+HBHW20?=
 =?us-ascii?Q?wx/t/N21GMGJJZvdLe47x5g+1U51ZYABVQcTiJ7tsZQEL0yetssW12VF7dgC?=
 =?us-ascii?Q?EEvI+4H9Y+DyuWL+T/vpgY9fG68J9aBbcCHU2hEhouPGKa6VIdzuKXtIMC/U?=
 =?us-ascii?Q?CTmtxhsNm9hjQMYC/YGFDMtcXTiUqm4/LHbjtYSvW7l4eBsDUbWjvL0Yc+9v?=
 =?us-ascii?Q?NvWQgnPtjFW6MjJ6YeTX2J1pvHu8GxM6SvP5lW5CT94S1prDNVESXnsQ5PI8?=
 =?us-ascii?Q?xA/UhLn+2Gj1UnrtK9b/cp55sHInTPiCbEy3+yqnKYe+TpUYZFxlbdjFdiGo?=
 =?us-ascii?Q?GQfbXek/4q3pouo1TZgyRy+bTPIQjadv+f2EKpznsGgbSkvvU8CEOkizwUPM?=
 =?us-ascii?Q?8jpSMcDB63aY/sf6QQ6bXeTQXM7k68QigNmPsVdvvxA4tE34vt5ZsOeEOxu/?=
 =?us-ascii?Q?O8snUUvLLm3D2Q+06pYBjGeC3brDy4YJliiakYtowg8H3vnEb0wwegPKCLh/?=
 =?us-ascii?Q?/TAN/1HclGBrqC1v4oIuxF1PKIdS8eA+YBS7b46AOu9DbPeEi1t05fre0GGD?=
 =?us-ascii?Q?kxA3GSDFv0O4+d25oPwyU5C3Y/kS7QpdWGsfSZEZL659hk8yWCZRVCFaMyGh?=
 =?us-ascii?Q?OI82kxBQv1ZoqHfjXc8YrSEMhqINdZtbMNnIDmb8c6au6MFWAf50ldKQPVwS?=
 =?us-ascii?Q?rmdd0Alq6gvPezyfQEGUKHqZ+PlW8S68gUI1qow1pjU7LwEW0LdBTjgmiNLO?=
 =?us-ascii?Q?9GD9T+Wk5npA+FnKHFPeVkUG1DACydCX32Kr4zJySv4wx3m2RPFslL3QxjCX?=
 =?us-ascii?Q?oSDXo8nXcsxSSp2pjmVmVBxM5z5++37OUpeDEIr1CGg2peQbG05ab//SoJgQ?=
 =?us-ascii?Q?9TjrQvqxLNpBHQL/CMQjraBebqQwtkS1hbGVMyDd9EjHhrE8npgZm57l8QSL?=
 =?us-ascii?Q?JxJ7lfyWWF+o8aa0TMAlEKqts8cwsQF356J3M1Gaz65uTl+CBMuD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 039fa0b8-5f4a-4b27-a59f-08df0220a869
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 20:45:40.1284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTa6w90BbbYFiUO4tYjAIldxVTbddopHw0ynZpFog2SPrYSVSqxjSKmExDQltfanEPQUMWXgkQkpLg4jSiWKSTCgAWNR2k4RK1y+9Xd1zh8tojWb+zJlJJste8f0Cg/m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10268

On Mon, Aug 24, 2026 at 03:14:33PM +0300, Sakari Ailus wrote:
> Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to set
> the frame descriptor type in the get_frame_desc() callback.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 21 +------------------
>  1 file changed, 1 insertion(+), 20 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 6dc4b53607b4..472154c5ca9e 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -722,25 +722,6 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
>  	return 0;
>  }
>
> -static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> -				     struct v4l2_mbus_frame_desc *fd)
> -{
> -	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
> -	struct media_pad *remote_pad;
> -
> -	if (!csi2->remote_source)
> -		return -ENODEV;
> -
> -	remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
> -	if (IS_ERR(remote_pad)) {
> -		dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
> -			csi2->remote_source->name, remote_pad);
> -		return PTR_ERR(remote_pad);
> -	}
> -	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
> -				remote_pad->index, fd);
> -}
> -
>  static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops = {
>  	.s_stream = rzg2l_csi2_s_stream,
>  	.pre_streamon = rzg2l_csi2_pre_streamon,
> @@ -752,7 +733,7 @@ static const struct v4l2_subdev_pad_ops rzg2l_csi2_pad_ops = {
>  	.enum_frame_size = rzg2l_csi2_enum_frame_size,
>  	.set_fmt = rzg2l_csi2_set_format,
>  	.get_fmt = v4l2_subdev_get_fmt,
> -	.get_frame_desc = rzg2l_csi2_get_frame_desc,
> +	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough_csi2,
>  };
>
>  static const struct v4l2_subdev_ops rzg2l_csi2_subdev_ops = {
> --
> 2.47.3
>
