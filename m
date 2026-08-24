Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C82391838
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 21:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787606982; cv=fail; b=h7z+sSA0/75tO8bvIJ+vMKGlvH36WfXVfsSzg6wN/0iy7uCoN8EBySHua3Rbnn2tZJv0RnoBC/GzwfgvUmEWX+FD0aNSO9WBieZkKjy1TFuD1HRLSMEfBxEhYw2sEdgXCmlNa0icz/dD0yKjse5/KTDVjthCkYpCnzBfgnj9/V4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787606982; c=relaxed/simple;
	bh=RhNuHPrjopoLWHc004nVVhIa8XlsHl0K3VPlJk0EVQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KOzz+umvbY1HxLFX5Pl9ZdcwfW7OeALZKdgNO/dsFI9rk4M2G6x3vRalCqdkq6b8ZSbEqs93edo+zvnCt463YaMo2P1dmflwOo6j+xVTX85L5rwxoEh3d19WpABZm+UZd0CyH0OUFy7HqvZiThoe1POc+Mghbop8xd3kt0dkYNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MOPapxxB; arc=fail smtp.client-ip=52.101.72.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MOPapxxB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AC7bpojUednMGkfA6Iv5tjhKC22iaJZ0yuZgMclExaDb2R8AhtHeO03Zi36eLt+ejzx8p1Joo1DsYbng4V5z46Y/x/sv4B3gkQ7IgBVT9kcJgc8XTtDXRyWa7Fu5j+udQwgrd6rD/ICmP4SZ2gk1frwXQTD8n5dMSyIE3cH6uvkLIW98N5K0/k62OXtPdHQgtCqSyCOgaK2Ey5vV7yWRFMmYbyOAx139Q0c8+dM4CKsFWMaMh4y7cupdBmgufPb771AXoq6uER//q5Wzvl4PYPtFiA0d+kEimUlAE9tq4gfkim70j4clKIN9a1RwRLrEDVPHeLWKA/Lo5iqUA3WBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnBOU768xF9YKVd8V2FWwWEb3C9LvWv78iHohjMWnuY=;
 b=CIgcJqzU5swsUYIMBCVzJ1awmHc+cgQ+6VXIxMEIcP+2Dm6PijXeeTmXKWuzXMzJPcPJp0CGFVBJYNpqC+hUpgJZHQC5DL71srvjY5fe50BR79oc/pIu/xhXMwOhWTFShdwnzS9KLZdwpfz8Y6ITP2h4Vms+IZ4q9/T61RvEGPVh13tkjwhT4e/aAtAFaBFIC5MHrfOgN8Y52q5UGSsWX3Lrog10ZXOqvqzUcLiFGRRmGVrA7rmAifJuJfJyl1W/76euopaikx7Ogb3kiss8tk+cRj2P18bTFm570pQjrjhxARijh27oR5glFn8ShHG/gde9SpeEzcplHCNi/mTddA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnBOU768xF9YKVd8V2FWwWEb3C9LvWv78iHohjMWnuY=;
 b=MOPapxxB035wUSSa5OcDOI8L5W9Sb1RJlyYQ3melq4sJ5nQUU8QZAsncbH1TMbavB2XDDGne9S0JAUGkgw4lAewgYNjMw33LQovCAT0I7RvGvZDWWBu7aGpqc+9W73VncdYMZ+v6bkZ35EXrWYjYsMRCP37ex1wZnMlAZPa/+tX8lFOJrGtH/VyaM/l4iEU64Sw2i0HYnN87bz/VqRwgBAQAVFXJsyhmmvnr9fxpOIFmQr69CDaZXXz2pr4FhsBjT4Iwjyb2duRvdOT7mptLCFAxFoTf7kub/o3cfYh5L6CQntKWZpKlYmuM+DrpY7z8GGsspN2Sc8TRoed9jX4mUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10813.eurprd04.prod.outlook.com (2603:10a6:10:586::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 21:29:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 21:29:38 +0000
Date: Mon, 24 Aug 2026 17:29:31 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 27/29] media: cdns-csi2rc: Use
 v4l2_subdev_get_frame_desc()
Message-ID: <aoy3u1aWO0FSFMUn@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-28-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-28-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SA1P222CA0148.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10813:EE_
X-MS-Office365-Filtering-Correlation-Id: 330dd0d1-2736-46fc-9f6d-08df0226cd21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JfAE7hfjpRq2OG21RM1Hrhy+F1pM0q/ESF9QDUrxMGxN6qKi2VrSZJ7OfcF3nS59vx59FjhjkNU6s6VuBZNa96ntY+tK09WmEzVmHut3InyFSawDvzuvIjlvsT8Vhu0YTsbkl2BduY5zxoVIVaO2DjIFP6AVS/O9MBrc91b0R2RGTHwt+eqEZTijeU4t08TEWlNurzTjdA5oEasMxsbg1nNuz+62vhIR4yXjeppF7e1K8sIHh0QNFTuGITzRtXjNDSxjdPwjS+TsHSCJTVL07V2eQ/UNiDcoxwwmBv8BoR9UA/okrYNIHDUOCctcRxZOw4Oa4Wsvt8Jfc63StI3T74rY4VtZtrRDg4T2lj/IEypTr3+g9V5wz7Wd1c2fhtBv5PSP+L0haVjMzjr+z3IbBmIrMmYF50/YH55HmLXnEDMKUs3PEwe6L30qeqQLK6dqYlF8rLt80ira4rpWHXuHR497eV+tka+52ELDE/3XleZduTakrYj4hOF9MiyZHPOhAdvQgbWRIpqaSwA4U5KdwCVDGR4AZIwT4J8ALLSjTb0iHEPuijCtqxprr4iLsv+3um8FSA7sLwbFRQ/u6T/QRFG0a7L21ka+Y/LumN6blIgNGBMf9kq6Ms1FWmAJ2uCoj7tedi3g4mfv5N8+C23BUb67kkN27uBQMSTRqUSlBg0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HQd8vn/lnRy8IdB6UKDX3AyOJ7uH7+fK1qw0SPrjTIhAWFqSl6Q0UQw7SZAc?=
 =?us-ascii?Q?sGs6Fc7cYiLJP5hiZe4cljeB4+zKvndM3QsCtdEjurMlTbW+zqxLqUPHVl2x?=
 =?us-ascii?Q?t9NjrFy3fxiqdHPNMEbzBgZM6cPzBvTXZUqOE2hgYlPR0vitzx+5C103P1QI?=
 =?us-ascii?Q?XYGiucSeOgF8gD5Z9cQBXqHHihP5c3XR2HsW9Ya0GdromnCv3CVjCtFH3+T7?=
 =?us-ascii?Q?j8EGvI0zB2VLQnGcBWP+48B4Q2eGJywmnYi88m6lUsjJtS9eYATrPlMIO472?=
 =?us-ascii?Q?1o7grSY57m///rI95SkxDNC+6LtQTFXzAmw5ONo9RLVqHsWr4nw9iJzWw0zD?=
 =?us-ascii?Q?DXBzyAXKhaDdAvC4t7JtCr32uhEvhM8z7uDHKnFLohc6F/wFkW4t4+VE3Y4B?=
 =?us-ascii?Q?ApVYFLJQlhkg32ElWL+iND6meZjd59/QG6x/uiFKM+hAPA0RRSjcVqAho4cw?=
 =?us-ascii?Q?1IEEoxUgMIBVqnLhF/USP0SndfoYhThoU2JKcP4Azps8MOKxs+i8D7lowe4O?=
 =?us-ascii?Q?ziWJLIUwS264CMoLBEMcOPYoor2XJwcKo4aaiOTL1ywcaqMIWc5T03YHHoYr?=
 =?us-ascii?Q?a1ZpeUDPWIu07MhbChnMT7VrE5lylyyrqbiR1Ja45fTI/Bjy8NDZtJyPMgV4?=
 =?us-ascii?Q?/RvWrrhL3jegkPEuxr/P37MqTVkowF2+/s1/v6cs1UYzoYClfv07ZXf1niVn?=
 =?us-ascii?Q?Susb3xAXthQkImbpbpUQwf67IXWom92czdj0/Vc/W+TEQDU0Njq2HRPl/8VY?=
 =?us-ascii?Q?jqFS60TUbAjOuiuGJRcDTf8tO/5MKYa/7KilazreB4petG0UEbelhPz2ehNt?=
 =?us-ascii?Q?r2XJ/hFiOYf/COrFNgU7HVR2M/BYV5Pf7IYnOUhncLH90ScU+reABRjPRrUv?=
 =?us-ascii?Q?GUVSFXV36pcOZ7FVsa0+p6Q1uNZks+6IZIktWt53i2iDYfmEwVYYO8ciznz8?=
 =?us-ascii?Q?wgCvQe/Zm+2zR1enrcDEUDYKHiI2Wk7zC7zxeZhuugaED43a0rPt8Pu+cEu/?=
 =?us-ascii?Q?cR5s9Movtug1/WE9MfnYDEReigmog8JIXBP2PHmnG/FuRhl+xTmYU5VI2WI6?=
 =?us-ascii?Q?7ZxaOHNFV6bOHL8pBgSHx+dtLYWMG5e2Ry51aFG68DbcXfsBMI/x5Kwp2nle?=
 =?us-ascii?Q?gGh5vnKtpICFKQJmavsrNZTNFsbDogx/Uvqpu7jAuh9X+opB+j3K20dfmnfx?=
 =?us-ascii?Q?K5XA+AgDOWfzDAN+sFSt0+0snxfvOL4p48xCm7Y0xZ94iMTFeJrizZDZcr5e?=
 =?us-ascii?Q?vEcf14n0TJ0Yyhfzi9TM/c7obk5uBHQXdqvaQ96j26xyJ272cAWStFhpKPVi?=
 =?us-ascii?Q?MB7OazZ6A9R0M4LIW6Oq0+y36FFAbkpJLPKmjHlO9wGvoftLcW6MBRi+5daT?=
 =?us-ascii?Q?618AqOC+pAmHVVDRNTRJ/MsFljL+2A19m5IlCvhN/RTaA5jqOBGMwshFgL45?=
 =?us-ascii?Q?nZfoOa9OVbGsMXSNNtyGBY73PZQQHNJBdWkYExnH62cVEoDR/Y0vTvZoQUYk?=
 =?us-ascii?Q?fMtfQgN2LTyhyRno3kKaNZCBM7IBes6MGktY/5/+cF/ehWRBaIOmYeXYb2uV?=
 =?us-ascii?Q?Oinkd8IFpQkkeX3Y/48KM7YwN81D2p4PTxs5tDmom4AyB4swHOx463O2OMv+?=
 =?us-ascii?Q?H7FJhUvNr89BgQahI16kqTV2kxlGyBLZhPmfPw8XYlrNARnO7TVPPeIMiyGR?=
 =?us-ascii?Q?XZejfGORO95C4bkGFe/jL7GgDYXADBaoKaL7UFChtslBeesl7GvS4qDraKM9?=
 =?us-ascii?Q?UyPSvrcBlqXSxahq+e234HjtrAVxoJtWHLpm20o/mj3+XagKmf5E?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 330dd0d1-2736-46fc-9f6d-08df0226cd21
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 21:29:38.5094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/49fUcEnC13IIOccf1oKVTkHy9BFabUnPmIo5+DGqJUdM7DUayjUA/KugYGAPAOhA6z26UmrOeVtVZVEi9WnQUYhrtZoQqJwYDmpWl6wfO1rPaPhVjkfK7H0KIW1A+3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10813

On Mon, Aug 24, 2026 at 03:14:49PM +0300, Sakari Ailus wrote:
> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/cadence/cdns-csi2rx.c | 24 ++++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index e31cdcd9ce8e..a1f4bf5fbc93 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -230,19 +230,20 @@ static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
>  	return NULL;
>  }
>
> -static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx,
> -					     struct v4l2_mbus_frame_desc *fd)
> +static struct v4l2_mbus_frame_desc *
> +csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx)
>  {
>  	struct media_pad *remote_pad;
>
>  	remote_pad = media_entity_remote_source_pad_unique(&csi2rx->subdev.entity);
>  	if (IS_ERR(remote_pad)) {
>  		dev_err(csi2rx->dev, "No remote pad found for sink\n");
> -		return PTR_ERR(remote_pad);
> +		return ERR_CAST(remote_pad);
>  	}
>
> -	return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
> -				remote_pad->index, fd);
> +	return v4l2_subdev_get_frame_desc(csi2rx->source_subdev,
> +					  remote_pad->index,
> +					  V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
>  }
>
>  static inline
> @@ -459,13 +460,12 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
>  static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
>  				    struct v4l2_subdev_state *state)
>  {
> -	struct v4l2_mbus_frame_desc fd = {0};
>  	struct v4l2_subdev_route *route;
>  	unsigned int i;
> -	int ret;
>
> -	ret = csi2rx_get_frame_desc_from_source(csi2rx, &fd);
> -	if (ret || fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> +	struct v4l2_mbus_frame_desc __free(v4l2_subdev_free_frame_desc) *fd =
> +		csi2rx_get_frame_desc_from_source(csi2rx);
> +	if (IS_ERR(fd) || fd->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
>  		dev_dbg(csi2rx->dev,
>  			"Failed to get source frame desc, allowing only VC=0\n");
>  		for (i = 0; i < CSI2RX_STREAMS_MAX; i++)
> @@ -479,12 +479,12 @@ static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
>  	for_each_active_route(&state->routing, route) {
>  		u32 cdns_stream = route->source_pad - CSI2RX_PAD_SOURCE_STREAM0;
>
> -		for (i = 0; i < fd.num_entries; i++) {
> -			if (fd.entry[i].stream != route->sink_stream)
> +		for (i = 0; i < fd->num_entries; i++) {
> +			if (fd->entry[i].stream != route->sink_stream)
>  				continue;
>
>  			csi2rx->vc_select[cdns_stream] |=
> -				CSI2RX_STREAM_DATA_CFG_VC_SELECT(fd.entry[i].bus.csi2.vc);
> +				CSI2RX_STREAM_DATA_CFG_VC_SELECT(fd->entry[i].bus.csi2.vc);
>  		}
>  	}
>  }
> --
> 2.47.3
>
