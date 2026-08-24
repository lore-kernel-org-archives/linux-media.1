Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010018.outbound.protection.outlook.com [52.101.84.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2458833A9FE
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 21:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787605920; cv=fail; b=egkchauhH75Vtsm7NCME0EiaVhF1XOTeOOPIjCfTMwKryDb2QAi/M0NCBYDTffiLomF3MPSKKyxYVngJI3gJnC/BthLjIBoXdA/5fj+kCvD101hrqfM6spnfVwu5ZysDpFt7H6361nhctAdGSpGiHIqLoCJopbegIZvYiC7zaCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787605920; c=relaxed/simple;
	bh=WrYTmJXZY/LW+7kJnO9zLhl/JaDN+eSd2g6UrAnW2NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y9NaV3DfJQah+cPAJse9v0+Aj8UWFwHM5kFnbnagjn7P0oZn1+EymbCDLtTC8cmspF2UXlGsA2P/KBwyvjiZKOgEPb/gEuCi6b1lD2Wa0cXK9rig2o28wR32/AEsxxv+eKvMJrl87Vy1ANf2GAon0oDc3hee4418sFQDn9YaXXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ku2VJ4fo; arc=fail smtp.client-ip=52.101.84.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ku2VJ4fo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNKB0QnyVSQVSGDlYx4rOO+XmQ1DkWINfeJ/NWK/PMEq81cEyhLTBxns7Xlr3IXakh4QsZY6s4frhBorQYN4ssmo1CL1ZIbEPk6oGPFCFEk5zj5Y4MUbD09V+/X3Sznt/hAVhu8Rw00cPa3FvOoC8WM0LGqYMa3hFCR89LhpRJjnHyfBdG+6Oq9BF94SqLAE0IzaZouOcJcvNFOFGsR32s9LKrGyXa15F2+FR9hfPNmYKusZ5qczRWvH0i5UG7c+GvDTND198uaoRQv6sGwua1FXArQu6MgTw2PqL2bRPd1H0MpU5yWmGwFesv1Fmiksw7XBIpFE2ymIVTnaja3tOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxVhynxwitgj8illijCZwmfpChYRGtLfnm02kcJb1ww=;
 b=Yz7wn7MxsXnjZBaUkNUigDsrM8JrF2dui185w+KJBk0gBhwS1GZ/T+auBrYlWH3iTiMucjawOQHIOG98JYCrfS/wwraJgpLdqAUojLTaTJDT4oGL3a19T6ncimAHWwu7sOfeK9O3K0UvbwBP8TrvnGjtEwmgxboH2fSnCyPAP2XkBgzvfS4aiAxXA4G2tnkKsSKL471IPA4MVMfZtJI2eQEZsQ2B8cDn/s4qkPDQsK1B5orEsNOPlk4Otyo0UYpGrmeHQmnVG2FUalZhgeXf1L50pCX+YYoAojn/zU7FjDKGKJfFvMawjMONtLkXypBNvNivtKf477PUH9JNIcfltA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxVhynxwitgj8illijCZwmfpChYRGtLfnm02kcJb1ww=;
 b=Ku2VJ4fo3CxfwE1RBvTlrzVbAeutDRFaxPd/JE7KWaXSnug9j6iC8iMid0vvmhqageJLwIgAKZO/kjBJLpGe9ddIuph3wiEsHbS+Gu1H/0PQrdaPNY5KCXgnzY5NvyA6P9ch+GnHBplOlxYh6S+ZY3CG97wF9tFkqDHGDpvtORjkXE9nKNP7wmhSJR4O7HiRlpKB+pk4UDibDwkbO8FP/YqvbiGt2EDJhVjE+mCgouwDZdzd8uEKs2VdLemk8Sn06yRWpqd+HI/81dDv6jfmgCVAmVsvL5rtROdvW4e8ZwxnULfNxA15lMS8BuiaPr2eOcsYe7HZwSCb9Tleu6jyuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB12143.eurprd04.prod.outlook.com (2603:10a6:20b:744::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Mon, 24 Aug
 2026 21:11:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 21:11:56 +0000
Date: Mon, 24 Aug 2026 17:11:49 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 20/29] media: raspberrypi: cfe: Use
 v4l2_subdev_get_frame_desc()
Message-ID: <aoyzlU7d9a-yfbVl@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-21-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-21-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SN7PR04CA0233.namprd04.prod.outlook.com
 (2603:10b6:806:127::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB12143:EE_
X-MS-Office365-Filtering-Correlation-Id: a474049f-771b-4a6d-a963-08df022453ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|23010399003|1800799024|366016|10067099003|18002099003|11063799006|56012099006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ENLQmYVTPjFw2RJFmFfBNgVaLVEMfihIXP3oLiaJDfrnKQdNpvGzolP/J7fsG/ULd3hGb5BBiCbfVHOBvTiDZFhI/Fxv74nhb4t9t548RL9AUQSA6QpfgR94mKN9eC4IedQy/MpCz9rqLfcIV/xSTrfiZFrGBgmydTmuenBF6HXd26dsbJmXOL+pAtqE8LTteIW3gckqrWEtJYxNxJ+Mw61oQwx9VmIotWzPm1fHcl6Kre50jDCwvF90SByJanrE768dsKFtBV0mNW0STOaVBOIYFTHX1Zcx8+XOMpviyepLHGIdJy3Otp/277BRYxvGKzc09+BBVMAoXwUS3dS2ZWfN8gUcCI77+g33e16BZ83MvIZs6BQ7xDdf4qnhUh1bCjPkeFsHwo8r3atTdX57NRPvU5dUG8YvWJMDWMJhBkzpMdSGjkR34TRER8MN3Eqnbl1bEFvgnfagzZPwkxa2/wYSVkajwm6ydrUNdOYS1yWMWGzCivG13bZa+OcRC9lT2FbzS6Y6Davi2qYOLZj2diGWZwApUGero1QkD2NpmR67G4OwFej46UsPWjdT5uYCHkbnqb0WhrWdJNAn08e/CQECu+tJGOOxhOuPXJUQv3V1hjPPqclcWhn0aMAKAElZADpCNCJo+e3G8nj83lOumXlK8ERjbGBAcGZyhjDx3Dc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(1800799024)(366016)(10067099003)(18002099003)(11063799006)(56012099006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vhyJKVd1R0S33IM++Pyrw4we/s3VDiw9H7gC+3q0Tv65j7seHXuBoLBpGrCg?=
 =?us-ascii?Q?SFX4OpLS9/TQ4Ary6YhiR3KPnsI/bn2Oc39ljWy++4xof0LuUpK4LBkRkiAf?=
 =?us-ascii?Q?u9p8zIl+1gMvQtwJfTHAdFPfm24nhqJElFbgRq8nEtMMyMtpKrLzrqwfuw05?=
 =?us-ascii?Q?XQXTwFTOQdLTeSrfu/6h0X/o9/QnDL3FovH2FgvyV3yN0vhBXECRWl4ngQ9H?=
 =?us-ascii?Q?xIHBxYnBBRYHWkfJ+3h8eRj6fntnnwEw+NLE4CUNxzn92D1vYvKJ+4pgTzhu?=
 =?us-ascii?Q?+XOZGWGdjPGa26rmUsMCm4SdKAi9aYXgeh/RLyk+7i+juGN+7YwWETHKC20K?=
 =?us-ascii?Q?oaOmSFjFp5UqP5H/gtu78U48rz5aaAu5YxaaH7WC94HKANP2+Yt/y05BtRqI?=
 =?us-ascii?Q?nYBobZorLlaMPVuk7tzNerYvh9OwvR/XxUA4ipQiMqjwznBbucuTAlQKluWD?=
 =?us-ascii?Q?1GuQQxQ2rTvwCR7b+R1pguKnzVfVCbahAuIMLD29sGG/qdsVaOQvgb2Naa2D?=
 =?us-ascii?Q?9UlCgB7ddUb/YJzi9o5lnvoaC4/jaZj7uzSAG2OVQxm0nDrJwp1Z1kdlhShg?=
 =?us-ascii?Q?UjV44I+ciNPTNm6U3oy2nW4gofEjrbnIUWh8SzwIMrs3fmOBXPQvRmspuW/S?=
 =?us-ascii?Q?zLcroPf0TNIQdbAmi5gSes29VppupemCGPTAqJlCs3jSs/jRs3ozuFIg0+Q6?=
 =?us-ascii?Q?wO3yeZdr5tHCfBtOh8tw95XcvCceEtKtk0Ka2tAq5jbdTLieIST9aXBg4fNv?=
 =?us-ascii?Q?I3UgHAYTDkHX5GJQZ2yd6qtOvskly4O9h8J3CbgBPdnPuUGy0tBuYZ6N/gq+?=
 =?us-ascii?Q?OBW74NoP3xqix2XDbIdGC1PxyKa/f4Zm7HLjFlayPFNFPZScsJsgB0ADTolS?=
 =?us-ascii?Q?oedGE/gRhGP+oSD1J8BhLLVNIgUPD2ux9KmqnE3+oopQI3PndKP/ryhDK8bj?=
 =?us-ascii?Q?FjYoTdBB51Dr0HcEpzrz9aDOrYzvzOMLRaAFf9yy3rjWuF38S1pNfyFDLLid?=
 =?us-ascii?Q?dwwo7MRbHYLga+tbB4guHTL87em/8rFSG09f2ln1xFSTbQdhuTDVAwquFDGb?=
 =?us-ascii?Q?rwbVWalxv+Id7psgs4lsx8pn+zQVFt+zmElXl2/8XPVXIyLOcOcbj5MH3DAl?=
 =?us-ascii?Q?8/A+nPNd6biAcQA0JovgKUCO/Pu9ulwcCE1FvVs0CA8k5KsZenGFhQjyavSB?=
 =?us-ascii?Q?UGM9gw10mHAYc4g77CiPEIfUzGvOcBReDhAvlm06XlXNYi0yBX1vN50S5DID?=
 =?us-ascii?Q?NE5T2NBBBaFKPgdsdCsuRDJYwKVDlOeHhD4GceW620Y+oILo7chBLIxnxzXi?=
 =?us-ascii?Q?4mZU9DLvM81RSYITwIXNpdIh3K/rWan1s6K61u/xxroh/nS8QuBHFo+yQ4Ew?=
 =?us-ascii?Q?MNoq1GiJvNjReDQ+cy1/+dg7lpSNNlFuTA8X76GMgQcacskmyI7+UPNtB+0z?=
 =?us-ascii?Q?TQNpNgTwfuJqGCOfwka+qqpw2HeHNRMusCDzu7kLigpCoUFnk/WnU8PrAy0t?=
 =?us-ascii?Q?eomd3EaBjtFi6LACk4vnufZH5JlieG9eeEfME2e9Ou8PYDFmQWLuHOZPya6P?=
 =?us-ascii?Q?3QpRFvk+DYtRVstLFzlHvIlAntvqIrvegbRURlqlSNwSa3CavJAlbjtVolu7?=
 =?us-ascii?Q?zGC+GBpdn0sCjHeG7Ts2L30x6W5YDTO+LCUsOfJ9NakTOvwp8tjjo2xIcc+s?=
 =?us-ascii?Q?mWDQR3lwDOsklQRJ+52CRoeURe8BOqR7C3uRJ5VyCJJkQ/SmolOO+g0Gq/pd?=
 =?us-ascii?Q?MxES2E+87ZeV33MSV5FdaBthC4crZzexuzDmEuWYbKu29kV6uyH8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a474049f-771b-4a6d-a963-08df022453ee
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 21:11:56.1490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDWsZubghKN7xvcClKLsGM9ept42dND0q5EbicLHKzwyVZHOv9T1yAByl0MCLs24Z0bEMdUhIOopVMpe2Zi11EgPlSh7SxxKVFsWa8ktCpW/xyGw9lS9rRx9ShyQ6hPV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12143

On Mon, Aug 24, 2026 at 03:14:42PM +0300, Sakari Ailus wrote:
> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly. Also
> remove the workaround for drivers not implementing the get_frame_desc()
> pad op.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../media/platform/raspberrypi/rp1-cfe/cfe.c  | 51 ++++---------------
>  1 file changed, 11 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> index 8375ed3e97b9..e99a77e0878e 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -6,6 +6,7 @@
>   * Copyright (c) 2023-2024 Ideas on Board Oy
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
> @@ -778,32 +779,9 @@ static irqreturn_t cfe_isr(int irq, void *dev)
>   * Stream helpers
>   */
>
> -static int cfe_get_vc_dt_fallback(struct cfe_device *cfe, u8 *vc, u8 *dt)
> -{
> -	struct v4l2_subdev_state *state;
> -	struct v4l2_mbus_framefmt *fmt;
> -	const struct cfe_fmt *cfe_fmt;
> -
> -	state = v4l2_subdev_get_locked_active_state(&cfe->csi2.sd);
> -
> -	fmt = v4l2_subdev_state_get_format(state, CSI2_PAD_SINK, 0);
> -	if (!fmt)
> -		return -EINVAL;
> -
> -	cfe_fmt = find_format_by_code(fmt->code);
> -	if (!cfe_fmt)
> -		return -EINVAL;
> -
> -	*vc = 0;
> -	*dt = cfe_fmt->csi_dt;
> -
> -	return 0;
> -}
> -
>  static int cfe_get_vc_dt(struct cfe_device *cfe, unsigned int channel, u8 *vc,
>  			 u8 *dt)
>  {
> -	struct v4l2_mbus_frame_desc remote_desc;
>  	struct v4l2_subdev_state *state;
>  	u32 sink_stream;
>  	unsigned int i;
> @@ -816,34 +794,27 @@ static int cfe_get_vc_dt(struct cfe_device *cfe, unsigned int channel, u8 *vc,
>  	if (ret)
>  		return ret;
>
> -	ret = v4l2_subdev_call(cfe->source_sd, pad, get_frame_desc,
> -			       cfe->source_pad, &remote_desc);
> -	if (ret == -ENOIOCTLCMD) {
> -		cfe_dbg(cfe, "source does not support get_frame_desc, use fallback\n");
> -		return cfe_get_vc_dt_fallback(cfe, vc, dt);
> -	} else if (ret) {
> +	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
> +		v4l2_subdev_get_frame_desc(cfe->source_sd, cfe->source_pad,
> +					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
> +	if (IS_ERR(fd)) {
>  		cfe_err(cfe, "Failed to get frame descriptor\n");
> -		return ret;
> -	}
> -
> -	if (remote_desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> -		cfe_err(cfe, "Frame descriptor does not describe CSI-2 link");
> -		return -EINVAL;
> +		return PTR_ERR(fd);
>  	}
>
> -	for (i = 0; i < remote_desc.num_entries; i++) {
> -		if (remote_desc.entry[i].stream == sink_stream)
> +	for (i = 0; i < fd->num_entries; i++) {
> +		if (fd->entry[i].stream == sink_stream)
>  			break;
>  	}
>
> -	if (i == remote_desc.num_entries) {
> +	if (i == fd->num_entries) {
>  		cfe_err(cfe, "Stream %u not found in remote frame desc\n",
>  			sink_stream);
>  		return -EINVAL;
>  	}
>
> -	*vc = remote_desc.entry[i].bus.csi2.vc;
> -	*dt = remote_desc.entry[i].bus.csi2.dt;
> +	*vc = fd->entry[i].bus.csi2.vc;
> +	*dt = fd->entry[i].bus.csi2.dt;
>
>  	return 0;
>  }
> --
> 2.47.3
>
