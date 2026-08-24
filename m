Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013003.outbound.protection.outlook.com [52.101.72.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE45C33A9FE
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 21:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787605229; cv=fail; b=JnmQL6TOJBsdJGoyjZztmDqeMIhJOlh0qKRE3sVT6VAtOFiSJbpt+GLhxz/4hdTHUQfDgAReuKSscng/VOPUHkl+1+FwtBWMgqlY1VqDz13Pg6kMBSWNe0R8tlY5ritHXBVQv7HDbMcXcS57t4A8ON/BYT8/xrnY2bjf4XqypY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787605229; c=relaxed/simple;
	bh=n0crmm26AKwdRKSyerRRSBFNuFvlLltXQRygNQP7w+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rhzh1Ksxx4Ajo7CP9eJ1hjFfac8MBrNNIJBO6gkTHqd+ltAxbs4XltRPvC2YmPd/vkLOLZoW/vlwJ9x/y2ZGOXFFeNcoVJekXXOEJdEd5H2RRlgj7+lxMgJn2+twv7IREXZzMwnsmK0HiP/yplRPKgJ5PgteVb5XHIaMn5eNBrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EZLqbD3s; arc=fail smtp.client-ip=52.101.72.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EZLqbD3s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwX+JCCjoHLF7R7nt+l7PjKOpoBT0wLyfktZ366m7tHnxtmE1X5XnrazCl5yNojTB6mkCepTkqGUfOQiLTcJj6vL+65NcYAj3TFzarmJY6jDxHGF9GzsFx9PY505xtt36KRRK3bS4xkzzGHxtYVCfBoF6EFsMWPC/90KWIFv74OiZDQjbzS6btLVjb2SRWLHGd244A86p37M8uFitZE9x/IMSbs33tffc8ieqkBhoE2RvtxGN5KxudoZpMIeAGePz2W54tNCCmfP6zUzXFRO3+w2P1msoekNsy6K51RD7/XiE5iikvdwcbIlsbuJpIovBF8pZjWdgh8IMNX7YkM0Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cc10RPBZ+V91jgpzCtks0KItk9trV5bY19R6PandySo=;
 b=nXrS+RUQwsL6zKdb/JD+qLLn40EhSSiXy3gkUuCW58gmh4OWVjgFcRXb1RlDVHTo7TkkmccpDyzNBBiBzkDzhmzAFLzwUcQ6/V8ksZu3YO7pz8s3HoQ8hc4hyFlpDGl9KnyaY/JSVdW8PYURoMnJcf0EU2O5DA8PuVSD0R80ScCsE1mwFPczMpMe9rpTZCYOlFozsYuCxHsrZ6LsIR3IRg9LMGN7mRTihxyiKTih+kVXeLISHOXzT0KKrj5nq0hLv69vbTQDY1BsTwWfVBB1p7mqdZHH+YlTutVjEadkCO8LlYKd0TtZixWyT2E5c9QR7hV+ASVmqW6MEf9lOQEszA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cc10RPBZ+V91jgpzCtks0KItk9trV5bY19R6PandySo=;
 b=EZLqbD3sAg+F3aMDYvQWYTNaTe6aNuVHWk82J/Q74RRwLgMwLzkfL7YrrfIEnUkU301xeJk0bXWEi1daZ5EzVqZnLnkeG/YwlmYO6GMV8qmK80lh1nYg9gMPU23CJCCMayDBh9sE2Ogr17ABkCLLI/lpFylQ1VxHF2pBc02qltt6aJ7yBfYgeVGOjo8nOysiApOG6Cl3YA8kLpXu+2xGvIVMJAbiQZ9D208f3Q0RMuCntkgHukoZzilezfDgsEc63OrQYeRB6tqnjsrMxmncackzLEVwcI5/AfJp7+YJ1E/SUulE1tVhPh7dX291mO4qr0HRRYQViFQ2tsihQ8NMFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7607.eurprd04.prod.outlook.com (2603:10a6:20b:294::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 21:00:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 21:00:24 +0000
Date: Mon, 24 Aug 2026 17:00:16 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 15/29] media: v4l2-subdev: Return dynamically
 allocated pass-through routes
Message-ID: <aoyw4BDB21IgUc3V@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-16-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-16-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH7PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:510:23d::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a4951e-1db6-4a84-cd6c-08df0222b75f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|10067099003|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	+MNglnymCJBveTuLQmdOiTKlBoHEKttbnKJgHkaEDZNoPc14vKdaKAF4ZnB7b0mkvHznGZ+c2JoJSY2x/xdB3NyMEfzpfFqle8yhAoQSDrvuw0K2RL2cW2Wq63UbqXLFI7UtYNAjNiVgtqKzHL3iPUxbjAjl36nMFq55PX4iUKFKmyJLL2M6VlZlrsHJBREXIYkI/Ars2HH/8Pcg8wFxc93ugRR3rxihoW4Y6WrDzAbuN87w4xLlCavIvDtqYIyR9ELFADjHk9KmD5QJgpAIolzKmO4AvgVZbvKLUbYihn+mMJPXSaY5OnXIYfFHUtB4nSd5xmCHA2kcgCaDeOHLdzeafGVDRIvPdT23acY/i1X8rGJcj699D5w2qQhmg6gxUxOxcp5u40QTE0AC/fdgmKbDGygDi1KWGduKu2X6rzcLQhfrw0RUkTCSlLFM0lAykvrTtECerHcKfXCRvEKEaGMuwIX8BiF9AOifIir+67sRyRgsPd2XCxpGNjoNQgW/POOrr0YWvtMWBxzHkRct2J8cSfIFYaz1T6JKi6vEPeMsn8SHWuy+tTm8fB+xWhbCgEoYxyQu626Q1crO46u5bi5qLiWcwAtkWh/1ndpLMUlpR0D+1G4wHznjQToqo+j+xRb9RVinngMkTASbvpacNFWNMJiXJY87wKaZIgK1p+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ghG/jz6JEoT9sEr+e6wPBvpsGGzHZOBvC6G+bt0PEFFdwKFn1ruHXrFWt6G3?=
 =?us-ascii?Q?PAr2fCIAnNKmXmPkrMhEsTDS8o+mQ1zLXoY0IxTekRyhVuIvDjLJKJukTWsr?=
 =?us-ascii?Q?zEb48jnsir04O2pIWlLcSD7dImXBk1ELsZllreojwnO9mX8Md2n17QqyUuYw?=
 =?us-ascii?Q?wf1SXS8AVqOm2QHrnjWYXF/j1zLNNctqN+vgiDQw5G8xRoO1o8/kv4GUz+Ej?=
 =?us-ascii?Q?6q1b2sLaoWZnBkJJlVvsHZ7z+a8I5Kb8pGvZ8jXvcN0K3L7X0fioea9T6r0z?=
 =?us-ascii?Q?SQPsqNF5Trc18w8KhEFB+Gb20Fy2LzDquT+OoqMfJAVKPBVnxJd7Rn62V6qZ?=
 =?us-ascii?Q?ZW/oDKk6FFLlqQfwXc1hvx6TWrqcXtK+EhUG7VNUuCjkYJd83BdGr2D6RABn?=
 =?us-ascii?Q?1xewtq4GPaWRo8nX6umUd/PCuszGdBwlCKnzjd9YP2trUeNqEu9YjSm2pQ7A?=
 =?us-ascii?Q?qITG9JXQFraJ+Qsz0m7Egu6ZyYR3H/QG0RBp7uMz2c6o7YDwUsJNjvMBWJiu?=
 =?us-ascii?Q?dcWCmkh6+QJrTbE/0jTDh2J82+luFWe10fz+QAo68IOdOBUdkQrnd/WqDaDr?=
 =?us-ascii?Q?0WttyVPrzsv5sphe2ftzLATTE6fuV/NSbyOzayEqz8hs4fkh4QuKBvo8V3mf?=
 =?us-ascii?Q?qb3CRLIR3eUY/hQ3+lHvZOf4JV8fN36H4vckIE3Mcztk8QPH0J5G9hSYe4i9?=
 =?us-ascii?Q?1dxaHXKxxvZ4qv0gVKDsRHoezj0gjLwLa0CCMKDq7i+KIUZVibWf0x6YNIZl?=
 =?us-ascii?Q?uAOfF9xaT1BQg3NW0DBSZJyjWv7h6HSC3MfrtVf+13BvIkLHZ+mu51+sNhlT?=
 =?us-ascii?Q?S9OWo9sWViVegN+PIy/FsQqA1ixV+5sbnXZ5LHD7g55vB8M+7H6f24ClZitT?=
 =?us-ascii?Q?IwcwFdQuPihHiCdonrrU6J0vIQv064sAQLoqxdmLLnhx/CZ5axsg0jjIRAY/?=
 =?us-ascii?Q?PFEO/pr2MY2/1WLJBR+/qdbOBy92WzMlIkWnZOeHAq83UJBLfo886Gw9L4O/?=
 =?us-ascii?Q?LOmxvIMZ1dzvqjb8wtVLKHTgl+tYgpoUckzAhZ0HBMFtnqD4xwpGXkH5nQ4l?=
 =?us-ascii?Q?4yyYtRv+M4NA58Km4SHcIOTa4R4yrkO5llMKQnhsHYU03qD31vMD68JByxMa?=
 =?us-ascii?Q?mXfRIOoxA7H/ox0nhlML59iuShIC85WRlOMRvrDTtpk0iip2LMiSoG1IndwJ?=
 =?us-ascii?Q?Yy540WDtXvORJGxphyNbJn8upPx75cDl3gHYfBP5IknjWIzcW/YToeHA3aIB?=
 =?us-ascii?Q?xE4CpzwB4YNa310bxmtzHW/xNhUF7zcMCnBaDIgbWIc+7NnpeCVCgggDtHoB?=
 =?us-ascii?Q?V1lfNmF92T+9yHBVEIvsvJ/kP3q6Mrig/wud7NCkTkF+2Kjp4qT301DXDSma?=
 =?us-ascii?Q?RjKgiCDL7NHrxZemaW5bqI8FCi+/81qSBIR8WwPHkidtdcaemLgxs8NSo0QU?=
 =?us-ascii?Q?zNoFA8BfSW6xe6IaE/4OPs1leoouQp42rRhwh9IZHTO7E418EX66Js7pwg0x?=
 =?us-ascii?Q?PES41V3JcMA3OJLo2XiClSCfxIDVUuatkAOkv60zeX5gWfJGY2xUx5HCz4rt?=
 =?us-ascii?Q?wkvAxEYGWIL9mzWwByUvg+1H6wCGqWF6A01FdFPBfvZYCz3B5NkKtfgSmeWG?=
 =?us-ascii?Q?tngBV4937yV9CazJtS0Ju5SNfHHRFnNMbsKHrhXYWev+Kan/fkfaDezS4Z54?=
 =?us-ascii?Q?3DR9XxUShuzFXqrhY0cv9+GL3kOvstLMGZ9dz/BmLUg/C3A2ov04cCEFea2y?=
 =?us-ascii?Q?GtEOJP1m0//zBTyejtTQGtjoP2iviuBJYp8QzntagQbojORXaz3u?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a4951e-1db6-4a84-cd6c-08df0222b75f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 21:00:24.0135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSFYcameXQ1u7AHZCYJa4lPVEzbL08f1igHbqUgT0u8A33866Q7NaB7zLhRqOsZOtv/rtF4K+GnAgmQjIjiyMb9H8AXynxPbU3zRvtTsZtc9oWVp3E1s+tcWc0YfBMMt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7607

On Mon, Aug 24, 2026 at 03:14:37PM +0300, Sakari Ailus wrote:
> Count the number of pass-through routes, allocate memory and then return
> the full table to the caller.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 61 +++++++++++++++++++++++----
>  1 file changed, 52 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index c9f38b0313eb..d34704aad88e 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2561,13 +2561,42 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  	struct media_pad *local_sink_pad;
>  	struct v4l2_subdev_route *route;
>  	struct device *dev = sd->dev;
> -	int ret = 0;
> +	unsigned int num_entries = 0;
> +	int ret;
>
>  	lockdep_assert_held(state->lock);
>
>  	if (WARN_ON(!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
>  		return -EINVAL;
>
> +	/* Count the number of entries first */
> +	media_entity_for_each_pad(&sd->entity, local_sink_pad) {
> +		if (!(local_sink_pad->flags & MEDIA_PAD_FL_SINK))
> +			continue;
> +
> +		for_each_active_route(&state->routing, route) {
> +			if (route->source_pad != pad ||
> +			    route->sink_pad != local_sink_pad->index)
> +				continue;
> +
> +			num_entries++;
> +
> +			if (num_entries > V4L2_FRAME_DESC_ENTRY_MAX)
> +				return -E2BIG;
> +		}
> +	}
> +
> +	if (num_entries > V4L2_FRAME_DESC_ENTRY_MAX)
> +		return -E2BIG;
> +
> +	if (num_entries > V4L2_FRAME_DESC_ENTRY_PREALLOC) {
> +		fd->entry = kzalloc_objs(*fd->entry, num_entries, GFP_KERNEL);

nit: Default should be GFP_KERNEL, needn't GFP_KERNEL when call kzalloc_objs()

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> +		if (!fd->entry)
> +			return -ENOMEM;
> +
> +		fd->len_entries = num_entries;
> +	}
> +
>  	/* Iterate over sink pads */
>  	media_entity_for_each_pad(&sd->entity, local_sink_pad) {
>  		struct v4l2_mbus_frame_desc source_fd;
> @@ -2594,12 +2623,15 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  				if (IS_ERR(remote_source_pad)) {
>  					dev_dbg(dev, "Failed to find remote pad for sink pad %u\n",
>  						local_sink_pad->index);
> -					return PTR_ERR(remote_source_pad);
> +					ret = PTR_ERR(remote_source_pad);
> +					goto err_free;
>  				}
>
>  				remote_sd = media_entity_to_v4l2_subdev(remote_source_pad->entity);
> -				if (!remote_sd)
> -					return -EINVAL;
> +				if (!remote_sd) {
> +					ret = -EINVAL;
> +					goto err_free;
> +				}
>
>  				ret = v4l2_subdev_call(remote_sd, pad,
>  						       get_frame_desc,
> @@ -2609,7 +2641,7 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  					dev_err(dev,
>  						"Failed to get frame desc from remote subdev %s\n",
>  						remote_sd->name);
> -					return ret;
> +					goto err_free;
>  				}
>
>  				have_source_fd = true;
> @@ -2620,7 +2652,8 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  					dev_err(dev,
>  						"Frame desc type mismatch: %u != %u\n",
>  						fd->type, source_fd.type);
> -					return -EPIPE;
> +					ret = -EPIPE;
> +					goto err_free;
>  				}
>  			}
>
> @@ -2635,12 +2668,14 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  				dev_dbg(dev,
>  					"Failed to find stream %u from source frame desc\n",
>  					route->sink_stream);
> -				return -EPIPE;
> +				ret = -EPIPE;
> +				goto err_free;
>  			}
>
> -			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_PREALLOC) {
> +			if (fd->num_entries >= fd->len_entries) {
>  				dev_dbg(dev, "Frame desc entry limit reached\n");
> -				return -E2BIG;
> +				ret = -E2BIG;
> +				goto err_free;
>  			}
>
>  			fd->entry[fd->num_entries] = *source_entry;
> @@ -2652,6 +2687,14 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  	}

Is it simpler if

	__free(kfree) *p = kzalloc_objs(*fd->entry, num_entries);

	fd->entry = no_free_ptr(p);
	fd->num_entries =
>
>  	return 0;
> +
> +err_free:
> +	kfree(fd->entry);
> +	fd->entry = fd->entry_mem;
> +	fd->num_entries = 0;
> +	fd->len_entries = V4L2_FRAME_DESC_ENTRY_PREALLOC;
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(__v4l2_subdev_get_frame_desc_passthrough);
>
> --
> 2.47.3
>
