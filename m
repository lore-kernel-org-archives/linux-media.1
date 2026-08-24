Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011024.outbound.protection.outlook.com [52.101.65.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5108E3749FD
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 21:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787607470; cv=fail; b=XZJ5vDhfzSlPUtfBMdPSPXSFMpQl2qXXPNB0ALWrpX2ipTrLLOFy/MPNIXCIbPStcJkxg8N8hgd/qGZRaFjQFlP9/ULQgCVtBxgrVI62QMC5YE/WPTNLbQwBS0NU1p6Tn2IZQdHCQyNQ0pn0AN0aQNB5dxmSDW/bmIVMoho/+N8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787607470; c=relaxed/simple;
	bh=681bAFJ2l27j2+sCHc7aMLE5djtWafRzG1yalI8/lv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Xm38pDjOwofaxA6aWH/1460FWod6FkZGH5w/tV8YBYFon+3OZ5Lzs39CBntLwwjjbYq8MDdoKXTDBvDkNW7hQy+UpcOGsMmneM32SsoxlfoaZVSo4t5AiBGZbdb3pWddHRfoLl0SfUhy5tA9xpOvvVJc9tjJNLKgIC0iZxzVTf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=f1iLMmQJ; arc=fail smtp.client-ip=52.101.65.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="f1iLMmQJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qG/rkeHlzzvXfYdXdLQlE6C8YLY86WOLfEq9x1NYasB327SL9xb923v2eC5W4vvlr0tPnIG9mhTs96wm9ZUUvqfOXHLrXeyLT2ID7ZcGK2oI155Cg4MMKAAW5tLzQJjuRyCpki3nKWfJfl1zCtULmxdjPXsnCWrpgS/oozDsYqntdf/UJnL97u9zKpjJ9gifZjxfU6ZoFRR81zevL+ia0ZG/0RdyBTEVmOafUcwFcsIOPCkAuIhrVGEjsDrZ7Qp1pIfdoJHGX7KwvpiRPimkjH3nDny3mMVgPToT/sLmaJLOhwAPTR+lapIUF+RSCKrewub/F2wzhZhlAbKoWWypNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26lQ2lfb8nnB+BWg7kqzJOXdi6BFJLiOzWVlCh5CPys=;
 b=d42ouUZXGTMBFLbiukjm+bimdNF0G2PwYPePobjKicASONJYk8QZySlgYQ5N/k6/NG/j3bsRc8YfAg4h7KAm7U/HafKi1+AO2fkY5ls6b4oyTIt02qLp3/ED65xE8jMwD67FXSczPk7KaClCso6kOTy9IHo+eDWTa77pzXnwdgKZQr5ApEPBW/nOqSq9aUEd4lx14RzxU+zjpdVD2HgwV/R7Ro0i5NIU0Z1ABjKQeZ9yl4jokDbjWixGkFTxRVmjqJDIV8EuCE9pQjAgbJB1dvReqOc8ivAml3Pap0eN7WSVvO8pZgAz6yIxwOamKbynAi1gFbliU4dQ41rmbPxYZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26lQ2lfb8nnB+BWg7kqzJOXdi6BFJLiOzWVlCh5CPys=;
 b=f1iLMmQJV8Enyw0hWKLt18fqhUjdCnCVX2TmwW0jZtvP84UQGfuIc0njsHInJlJewxMXE6N3nNxA/jFrT5m/adTCq+SeknCmTV8OxbGhsOzbehl8WAokp03Ch8fFdHeEwrcm2qNSH1XWD8Tkmt/FzTX//Xwm/0lfuR5E/N3owzSEVIt+mgfFB+e/kujrw2LeOLbvYiLcagv3UhkKRtnptLNUzIyXw6XJsDVbAyNSkIyzPnXTWoMVKEzBwGfqZxnsFuKX+JBkNSjAlY4R9M8Cr5Tw/XjqGxV6RULEQHynpveQo8kml2Vttb2uUOljH7C7mvvUys67K9QKtUXg1nxY+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8335.eurprd04.prod.outlook.com (2603:10a6:102:1c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 21:37:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 21:37:44 +0000
Date: Mon, 24 Aug 2026 17:37:36 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 28/29] media: v4l2-subdev: Use
 v4l2_subdev_get_frame_desc() for passthrough
Message-ID: <aoy5oEnNS7z_Dcby@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-29-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-29-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH8PR22CA0009.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec16a42-b94e-47e7-1c14-08df0227eee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	pZQcZglt9922pHOZik7yfYsKmlYgtbIlm5qGEJp6f4GE5GCcwk41M/uH3wRXeXw+sprmd/lCKkxzcgkTDRwIqP0uVelkp+lLogqzMXdirkBHORoemYvlFziXZsYukElQjoXiTSefu4m8T4TMJgON4hPOfUSJkTyrdAi+N9eaTmuvEavPrpuLxU4804A5NUfle/vtPIS5eN6zV7NBZ1tQtTvd/fZw4tY1fk3aTr/tvd/5H683Q8JeCOUI1LyEu5jSTs71QiTq526GGTYqx5iQ+7QQkquv1KWYoE+oxsrgQT0s+PnVGwpptydGYUQgjsPUE+pNjMjxIpR1MdXezeOW5OkyT7ds2HCfkv1JRQbCRU5DH+24F9DiQmN5rM/e6+vt0Xb8pvXMugnCm6YkmipMlZ+/SPue35T4nxdFchyaQTNIbosRclQO1RQPDD4pl+WdvGFg4uasBXcEqtedA8Y6csLTCznViqrDGxskmeF1JBc/1V5tJgU06LDcnAlV4hI6NfdKqnem+iL/2fsGGu7J/fQfZ2qcfeU9g2iQSD+qorbTFK3qDcVMnf80swO9DC7Ojk38vRTn/NxWK56ZOP2Pc9T5Ip3MZ65RdwmZHRpP2YAZVufFOcst9nrXubVMhYJouKtpyEpAxyOjJmPJU8vWTjH+GDyATDNf9f9UDPxD83k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eYf8ahnCLWZGIzCoKworA24xcjvq00fFqDPtDEwTqYaNxyju9JU8G3NE0mTZ?=
 =?us-ascii?Q?9H6Q/SuWw0IvXvfB6SPvhxZsvzhgdT9vWfgyt+JUnXBh1ffivrDE/g4CpCWV?=
 =?us-ascii?Q?apczGFzV9XWeAVQ1PnmkNQQyEUSNhJQ+g+dpDbiGpdehEIKKprgWXn+OcQJZ?=
 =?us-ascii?Q?0RZBOWL7dGoI4LupnjLYlagdhmYhVpK5035ffGs3SVyv9bMzoXZvvBq/Fwx5?=
 =?us-ascii?Q?5j9t0qNN9apn7UZAzLQnJrcwNmBbRrHL9nvO2/+qp8daiJi7xTYsEl3xkb8V?=
 =?us-ascii?Q?U7ICJmGsHnHQNo5E+BdyZJUMiAGh1mcFXS5hIXPkS2YRzzWTHdWyfDOKim6q?=
 =?us-ascii?Q?1QxrV15ZA0nvFcnvsHUTEM+vMVh4vnWhKvGOhOR4NJdWbvgrkSylyGGhbh4C?=
 =?us-ascii?Q?vQSa9Ojty4cZ2YWeAq9CcImuALpnRmoEQrwjhm6eiJRB3xAAW+HTga7HxkFK?=
 =?us-ascii?Q?xdbn7BuebU7DRZ84/pQxHhSaMQl0eor3rvTa2+s9Fxzo/EMYEZP0kTZ+aqEK?=
 =?us-ascii?Q?yp7z5DhrjqJFB3kO3xwPe/a8P5WVr6Gm3dVPCFBjP/ddCP0w+4EYnTeoI194?=
 =?us-ascii?Q?LuW8attL8m6ERH4Z9Qc+FXXFQtp9kmVJLRFF5fjjF75CrCTXcGAEj/G3u3fA?=
 =?us-ascii?Q?oTEyZsYJ+3FT+1YfOtchbt6ol8CMdfVRzJ8i2Xly447F4bMU/vmvTLJbnajO?=
 =?us-ascii?Q?+NxcKslqYaFdJyi0Ct1vCMQBIXqv80A26rTtKCXXfth0KbB6b6Ri/1w9z8kl?=
 =?us-ascii?Q?pidsa04GYfrzli+NUEXURbQPelHpDKWVGXOr5pO1p+Ul0HEHAJDNPxQ9Nn7O?=
 =?us-ascii?Q?WfOE9dM7vsnSO+49pIFMEjP93OQCQJK1sTIbvVwmf7I3+AEhBeDN9MengfeL?=
 =?us-ascii?Q?fi3QJEdt5mURsFea63i9QXgtZXEI0I0tUXzbWWqIVm6K87QfDO+NfdVZMW7k?=
 =?us-ascii?Q?CzaQUj2XOcr5AeCrtO031T2vd0J8zwdPn6rQ80dmIH2qFJ2IhVedEN90Mo+u?=
 =?us-ascii?Q?kGPJGJ/rUEsMDe4qlm4Lv8OfcnzsbFg7or5/ddbkRyxWV+3yM2jWcBaV/72N?=
 =?us-ascii?Q?DlV/tnVaNUoi0x03yth8jCepkCCGy87c4kJRLWOD5oEMcgWAgB5RfRkMG1Xh?=
 =?us-ascii?Q?X77qmP4q1AtWuab+666NxE00I9554vF+GZuhMU9QsQwBas39WQfsN3IWYEiA?=
 =?us-ascii?Q?t0214dWwTe7Fu3Jq4DQ3F+JRENOtwv1eawX4X4M7HWHzLFLXeViVgsS3enL9?=
 =?us-ascii?Q?ekuRrJ59sTt8D8f1Vn1cJQhfjY9ddRS4844hNerO0Jm/ra5xZJysRijPEaGZ?=
 =?us-ascii?Q?4AsulDR5nxGd7SWtBOoFwbSWCRzYUZCG4Fg7l1jOFDYAVvHgIBZSA6BHkNOz?=
 =?us-ascii?Q?8/tmKX4LCH+lfqwoxTC2yMpdgP8v7214Q95WmI3V/7zDewPKXyQnJZtZY5l7?=
 =?us-ascii?Q?wjusQhn7tuUm9URR2bWM3gkC6t8SLOWRnKvZtlOSrd31LDSLxIBzdfmbkX3o?=
 =?us-ascii?Q?lt7mPzSv8rXNZMX5DsFtBGIxBIqEOBsiwzIfZFxav+cEjHDpkrGY5H4mf3wU?=
 =?us-ascii?Q?wLyJTlG4hw6HEGprSah9ymhdN14ElnGd9AYcB8r90SmYZL3Sk4sBe9RzCdTW?=
 =?us-ascii?Q?DDGpDmiO3cKL9c4uGvXu+QBy0QmfHqvrLtWNVQjA/xFAKCaWHfj1Q7G8jpUi?=
 =?us-ascii?Q?1Oz/ETvfHSMhEVJmdMXc4MwLs4hp3TxrT+dkgho7vQZ9R/Px06jIqtWypnv0?=
 =?us-ascii?Q?HypKuXOkc1WZtp2IZVKO15uCWwHPeaeKs9XLj7TZ2XtnByrz85XK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec16a42-b94e-47e7-1c14-08df0227eee0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 21:37:44.6303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rs6F56+MKjJqId1cuEGjGtwJzCZomzI4GchWePPPNE7rS0w+/sLz+GlYxoM2aSoFRve1WCwaacfmMF0PXsWVyLiaEiNFJYfzV1MV16wPUGj9ybiCsg3bdB/u/9hJMUHg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8335

On Mon, Aug 24, 2026 at 03:14:50PM +0300, Sakari Ailus wrote:
> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor in
> __v4l2_subdev_get_frame_desc_passthrough(). This is preferred over calling
> the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 34 +++++++++++++--------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 8c3c5b6e4ee8..2172bb8313ec 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2558,6 +2558,7 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  					     unsigned int pad,
>  					     struct v4l2_mbus_frame_desc *fd)
>  {
> +	struct v4l2_mbus_frame_desc *source_fd = NULL;

why not use auto cleanup like other patches? look like only use in loop
media_entity_for_each_pad()

Frank
>  	struct media_pad *local_sink_pad;
>  	struct v4l2_subdev_route *route;
>  	struct device *dev = sd->dev;
> @@ -2599,9 +2600,6 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>
>  	/* Iterate over sink pads */
>  	media_entity_for_each_pad(&sd->entity, local_sink_pad) {
> -		struct v4l2_mbus_frame_desc source_fd;
> -		bool have_source_fd = false;
> -
>  		if (!(local_sink_pad->flags & MEDIA_PAD_FL_SINK))
>  			continue;
>
> @@ -2618,7 +2616,7 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  			    route->sink_pad != local_sink_pad->index)
>  				continue;
>
> -			if (!have_source_fd) {
> +			if (!source_fd) {
>  				remote_source_pad = media_pad_remote_pad_unique(local_sink_pad);
>  				if (IS_ERR(remote_source_pad)) {
>  					dev_dbg(dev, "Failed to find remote pad for sink pad %u\n",
> @@ -2633,33 +2631,31 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  					goto err_free;
>  				}
>
> -				ret = v4l2_subdev_call(remote_sd, pad,
> -						       get_frame_desc,
> -						       remote_source_pad->index,
> -						       &source_fd);
> -				if (ret) {
> +				source_fd = v4l2_subdev_get_frame_desc(remote_sd,
> +								       remote_source_pad->index,
> +								       fd->type);
> +				if (IS_ERR(source_fd)) {
> +					ret = PTR_ERR(source_fd);
>  					dev_err(dev,
>  						"Failed to get frame desc from remote subdev %s\n",
>  						remote_sd->name);
>  					goto err_free;
>  				}
>
> -				have_source_fd = true;
> -
>  				if (fd->num_entries == 0) {
> -					fd->type = source_fd.type;
> -				} else if (fd->type != source_fd.type) {
> +					fd->type = source_fd->type;
> +				} else if (fd->type != source_fd->type) {
>  					dev_err(dev,
>  						"Frame desc type mismatch: %u != %u\n",
> -						fd->type, source_fd.type);
> +						fd->type, source_fd->type);
>  					ret = -EPIPE;
>  					goto err_free;
>  				}
>  			}
>
> -			for (unsigned int i = 0; i < source_fd.num_entries; i++) {
> -				if (source_fd.entry[i].stream == route->sink_stream) {
> -					source_entry = &source_fd.entry[i];
> +			for (unsigned int i = 0; i < source_fd->num_entries; i++) {
> +				if (source_fd->entry[i].stream == route->sink_stream) {
> +					source_entry = &source_fd->entry[i];
>  					break;
>  				}
>  			}
> @@ -2684,11 +2680,15 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>
>  			fd->num_entries++;
>  		}
> +
> +		v4l2_subdev_free_frame_desc(source_fd);
> +		source_fd = NULL;
>  	}
>
>  	return 0;
>
>  err_free:
> +	v4l2_subdev_free_frame_desc(source_fd);
>  	kfree(fd->entry);
>  	fd->entry = fd->entry_mem;
>  	fd->num_entries = 0;
> --
> 2.47.3
>
