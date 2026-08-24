Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA5E381EA8
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 20:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787604377; cv=fail; b=Zy5KgufklAyY/VqOyxgg+96SZ7OCRj8fzB5ylrKP/mdVHKBCOCKdlnzGz8X8fI8qFSBpApfKsssZ1wYYHH1tA/Tkjgo1iRoRiywe+k4O1TOZuEHg71hjQPldoCZ6iLvW3VbfvveOoHDK2M6j0fQFij281mUNGjrwh5if81TgFzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787604377; c=relaxed/simple;
	bh=XhFeXCytYXWooBz33kT2zXLdxY100sY88Se/Nbf0Ofs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L0l8Wj4i8CPdjH1yxEShih/n17UnMionYH4xbbETbm4/gfAfD/QPsm7NVKMNCXR1aof+GubO7NMpDri0BdAZ9pe9GjAADCOAjDbL8JDK43t/eJur1dt3ZQgZg/X+VkbVsRdfILPyJx2GU31kWnmBMyuTLcg92OLEbISfjcBFwuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MECArL6p; arc=fail smtp.client-ip=40.107.162.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MECArL6p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNLi/ZtdI5JubNYzR3Icix+tmsb6Ao4nNc/0jxv3eHP/shSuaymzOomed3ziN8f7tqbotsFoHpnPtsQheVGaRuEgfuVTACKoQT7x7RZSPxVz09gP6DQu1cUI4UQY0u0k4O6JHBbeaB20Zu276d9UGKkhzEApYa/PGAoAB1tvsG+2JHy1TCCrg7QSM+FoEDrPr0ChMFCKOi6UIdo8stq3IuchaQl1QvAkqL3opQ7LUocswlUH+dpoHo6UqTJ2vNFG0idPqmE7AFZnX2EnDa28CegBqKFo0WVV9FJ9F0zaYvpekyBopJR8RixUY4lKJsz7RyzMJ+j3+NXgjMIDBR/1Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3yjyo7tZVLRuQKOwqSJK5YXwgksdaxOczj54QIF9Tc=;
 b=e8my76i7Bh1zMZ9a7eczy3V6CZs39qnXtRT7aOHV3seNkTG5mSSDkeutwsgGSkOSE8Ve31GoE8QZdZt30toJi8CqVJ9BWnwQUt2ddJZZLyzYRGjdVP79zScld/x2zj2POlLEIwTDm4usbQ6rS26tTm0B0lfxj2Jqjyd4f5PvP2AlGla6pwSN/9YlrJxv+BDfk18miMotHusw72QhXnfcNxbn0g55HR5dg/0DSOj28QbtmstNpup2H/wyAYbaQmGqX6v7HcGq5RMQXDkOMYteii3PChy4gezKtLJdTOtbv+Lt4tVJkYNo1UOGRaKHPwsowm917tLm5Q62JHm4y4Mshw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3yjyo7tZVLRuQKOwqSJK5YXwgksdaxOczj54QIF9Tc=;
 b=MECArL6pg+AVprW/KJpRaO0XJs2yMS+iUo+RpjFDPmWezlJEQIfE8shQFuuWFSQN1WzCZs/s+VBVsCWeoosd8LPbcUJXSfdgURJNSCL9lhsnKPEnu3c1u0/qG2oH0MVMmkOcFAMMaq7YTIDD9z9WJM/DCMgGPClnI1iyJ8Q0ioicTQ6j7tn+LwhKWJLvNlTB424EZ9TqytvEMUmp9p0AOISJ1UYx/AZREgbnSiDMAX+tfby3byll6lYR++vnfOXEtT43pq+jyaFKB/qFGd1+v8OnDquc+UI5/+1RuwgaKrzSRExNbu0trYIT99EVrYnbmMowdgRuqZIAEiCmpz5D0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10268.eurprd04.prod.outlook.com (2603:10a6:800:21f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 20:46:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 20:46:12 +0000
Date: Mon, 24 Aug 2026 16:46:04 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 12/29] media: dw-mipi-csi2rx: Use
 v4l2_subdev_get_frame_desc_passthrough_csi2()
Message-ID: <aoytjJ5pngu7cIRk@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-13-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-13-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH8P221CA0043.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10268:EE_
X-MS-Office365-Filtering-Correlation-Id: db891b61-7d0b-40a0-ae75-08df0220bc10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|56012099006|10067099003|22082099003|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/5Lr7bfZjIPaEV4kgunS75tQKrsfnl6blJsI2C3ZmtII66v/wbUn9izvsunEjds7BygdJxAAI3WifKMz28KDqr1IjwZLTxDjYa3K5QAjq/vEdop50gHnVj4aDPKX3pxtSCneTx4eB+Yz3Zmu2QIFE5ZrZX9XVCLInC33rYI6E2iMLt9N49StZr0SbzkIHtiTrAqGr0ZiQqAGIoAuMs5sfCd3+ZAOOnQdjZ4mrk7DZp6gFFoGXCbYI2iYXuASVBsa5dIlqtGJ5rAOU6exCNoiSNkg/fjJk3OLYqz2p+8kuasDjgrkaeGs12iZzOId0BcFCvR7mSY5KqCHivQocmh8DXFFwIN3G8aQSMLlkQGbFME6KvHTZjjft0o/VfsNJbwwHD2w5Wu+4aHMNSrOVY54usm1mM/YAESM6Q+f91p4EY2azVVdlyZtLeSrTcnajQNIIL6Rr1yhhbgVrZ/N/39aiXMNBUHW5IQ0RPDYBFo3pzstFvZLCAOVSy6Dz/Y1uNGJXwpydN9bRtet2hT7tEFKOmtkZU88hkFhgkpc4AGeAEmqTzJBuCCCo624SCukQNYDvhH4H2eV6sxEmefAjlw/zuSXKzIlHDLYYwUPj/cnM22avkD0gzV5ofaifOsbsH1qo8Bk5Mv3V3hO4NvomvAY36b3ixr2038lFHzNGl9ZQLQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(22082099003)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QE2I/unGdrn/7p2OzDTHZ8L2zURNVd5EgBzGPlTz2LZ9eKKM7BthzDPEF9VQ?=
 =?us-ascii?Q?uRgDTsdOA7NTrwau5H1rewooi7DfZ0jggbIpCE8qooQgtW4KgFuzo0FS8/Oc?=
 =?us-ascii?Q?Mt0ZlBoSttZXKz5/RCObsrUO5bDkTzvTMsM4FnR3AFucW6OmjYlFi/lz4aJO?=
 =?us-ascii?Q?P2GLkUtWCLD+cVqOJVBWER2er93UVaNoj2k2mf9zcfC3zsqiYGuKCP3f7vq1?=
 =?us-ascii?Q?ZdlsYKI0HDFyoXfH4kG7o+yv68K/sDlL350XaLnvwBfzbObUPzAYs1jr0mX3?=
 =?us-ascii?Q?3tqXoTBDuYPXX05DPCCfuZy43bj3eUWvL1e4hWai++kLDxPcDl6BXrjRRLG3?=
 =?us-ascii?Q?DidYNFLscS1d++tJeQv30n8Z3hQmefjTsbt1Hmhntu0CFIMgfBAyUWtPpKl2?=
 =?us-ascii?Q?/zrtmXDUiqCWd6r15RCS1gaosH9hgMl43R0NbbZueXNeFfQW2G4cDQjLPUre?=
 =?us-ascii?Q?ThyV+vflxdLTIXlqM3Ro8Vp7vfSmbgfhVFB/KQJwx8gvou4or1CDYXIDMM1E?=
 =?us-ascii?Q?njOTQq9quaDGv+z7LQlMjkeQen6+O+doq1wH8g0O7oWYNoCbu9PQuhbc3bnO?=
 =?us-ascii?Q?7PxMrl4xrWjFhGJs7tUdMn84SoC3L5zQphFoLMDBBdiv+ficIDgLGFjwUCxX?=
 =?us-ascii?Q?tezXTOmpu6h6LfBcG4BV3PShJgAcTWLoFJa6iOCstRqi2xRK9BgH/7xs6UCX?=
 =?us-ascii?Q?O7jutGeUtrmouXqugHB8HS20CR9f36NmsuXacngFSmNikft+umSbD9nkeZxZ?=
 =?us-ascii?Q?95WbffAY62WMO50g44Tqhj3hkpd0QANHBxP9zs9uo9h7mpE34W6UskQmWRTt?=
 =?us-ascii?Q?jmePCxt1kF7Dx+412yE4URsUv/6awZ+ChAvi6ahe0/4Y5R0MI7BjpPGM0vfb?=
 =?us-ascii?Q?9lWYu96Cw3ZM9yy4BQ0rbHqVS9u8hFfjNOM0sY/UjFVPBInL3rOp5y1jY9fE?=
 =?us-ascii?Q?Lx3GnPI/ALWIVcloONoo5bn1mopIo+Xe6/CbhlO3LXE0H6tn3B+lUIKy5fpS?=
 =?us-ascii?Q?lzFqpflGcOq0iLFmd/Zdky0zS6RDSJ7K7KEW4F4INaTybInPi2P9ksv6TvOg?=
 =?us-ascii?Q?ERkSvpf+kNnmHjhvG6azEMlXVY0bAUg9o+LlR50vY0Kd99m52xCm6zQtcEOJ?=
 =?us-ascii?Q?spb9qQnP14pADn+6NAtOJlkge0w5I9Z7VyeG3PJ+RAqEVXNHqhyInblRU1fJ?=
 =?us-ascii?Q?xPcxmuzd7srGbM4/0t0YUKOvYCxDgwmd4ZzHfrWoeVM7BLNtIm+EKXkqB5cU?=
 =?us-ascii?Q?80xIQ1dQUNYP515N4tV6hNdg6Vd78sS/SGUvyZYXenaKDWcYD+QLuLsUg/PC?=
 =?us-ascii?Q?m8HTOQRb1nc0u9fY77FiptBRefTt5xdsxl+O6uKmWB7Zdav2Ivka1FlV37GW?=
 =?us-ascii?Q?BbKqKlkNNthvPMtRcQXT9OTf73BcPIbzC5eHNAWk6gwi5fG+gu0IYa8cyzue?=
 =?us-ascii?Q?Z2UUEoCB0+Qwn7eXrfXPlNrFv0NVpb+FWt6qOLVfKoGQmOfUdYSTHJT/FK5z?=
 =?us-ascii?Q?BWa8KHSsFo9mtdhs1apFqJb1FAZAWwJYeVDE6LB1l+h+SN6PUOJ0Y3J6hrWn?=
 =?us-ascii?Q?5IirxfW9i3exGdL7IK1RLE5H6RYAEpkZlh/P2hMiYNLmOQ/5asPNke0H7tcw?=
 =?us-ascii?Q?X8EeTCBi4pJftotcu+hOQnOwrzrwcTdrC0AZD5oiOHc6/pxgQ0l6TpKAfrHY?=
 =?us-ascii?Q?8k3lHVM7pe7cuNWj74TmXtaoCTBM+1rxF4lfwix6qkC0pO4nNDHS+FWBCp8s?=
 =?us-ascii?Q?GVoucloFVyGIFmXZo8OfpUC22UBnUVjbDxhlRreFo8GVsV6uaVCi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db891b61-7d0b-40a0-ae75-08df0220bc10
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 20:46:12.9043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLUqN0MQ/XRhcY0BXDC95jny4PtvYhhiWsSGuY3sFSkxjU8J5FzOQtvZOwxt5kxPUp9tTH5jkpWNMoC1XNu2V0AQQyp1ketZ9BxHu7U2Bg3MylLF0m3pqwNdLNDqk7AS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10268

On Mon, Aug 24, 2026 at 03:14:34PM +0300, Sakari Ailus wrote:
> Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to set
> the frame descriptor type in the get_frame_desc() callback.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../media/platform/synopsys/dw-mipi-csi2rx.c  | 22 +------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
>
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 41e48365167e..9e3c97f9cad5 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -630,31 +630,11 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
>  	return ret;
>  }
>
> -static int
> -dw_mipi_csi2rx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> -			      struct v4l2_mbus_frame_desc *fd)
> -{
> -	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
> -	struct v4l2_subdev *remote_sd;
> -	struct media_pad *remote_pad;
> -
> -	remote_pad = media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
> -	if (IS_ERR(remote_pad)) {
> -		dev_err(csi2->dev, "can't get remote source pad\n");
> -		return PTR_ERR(remote_pad);
> -	}
> -
> -	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> -
> -	return v4l2_subdev_call(remote_sd, pad, get_frame_desc,
> -				remote_pad->index, fd);
> -}
> -
>  static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
>  	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = dw_mipi_csi2rx_set_fmt,
> -	.get_frame_desc = dw_mipi_csi2rx_get_frame_desc,
> +	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough_csi2,
>  	.set_routing = dw_mipi_csi2rx_set_routing,
>  	.enable_streams = dw_mipi_csi2rx_enable_streams,
>  	.disable_streams = dw_mipi_csi2rx_disable_streams,
> --
> 2.47.3
>
