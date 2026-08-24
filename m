Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6938135C193
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 20:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787604256; cv=fail; b=EL1dx6HgGjaxzw25AVI0lEEToxrEnrqFzJun6DOIkYWIcmftEoCtrNW5ssTtlLj/Z+0nLSacTNnNW93LiHO89lC4yD+LDQq+Pa/8JD3xejSPV7/puatJnB0aYRg7kuKG8g1hFnTnP5X0yPVCwK/fG6qXDxM0S621mq5KJbIqFcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787604256; c=relaxed/simple;
	bh=XhkgVUP9ELXMbZo8wL6WsH7sbRCueym4Bzn6wCqx+ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rDASivayUPNGv8Tl8LgPT/ebR1LNLodtJ7mozxkAwDRxUIpcJrG30JN/k5g8TYbrzJNbBYIi4sv+/TRDTo3e4ePrTF1L4n947AZNU+xY63o+GExB4P61uI4Ok7JJV9DSiZH2LYf23n9/mFOlf1KP8dLSqZGPpjpz3MrWqDaokQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RFCNs7gZ; arc=fail smtp.client-ip=52.101.72.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RFCNs7gZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPttHJuItKRaPIqu8TaNDHnNwiaZTz/VTaLW10VAlGHWIItTPD5ONH0K/UfGzPu/uyDskbKmwG51k+1mXAipioyvrODiOazPBfrPxlXCfFgElQzfNblUkAqN5NanhU2blOHL4VMOHryX6V6mAoG4IPodCEws7uGq3ZL91RqL1rSXC/nIwiy3oBHRWQhF2ny/TqjK6wlBg6QdCedGjb11zS/p9hgxUYmHSP3EO/uCfXjLYsUarcFF6so/Ws2Aq+ZCxeGmpoMZDLozr491q1wFd5rICliK20qOp/tbXh5BY3n6RX2G1948wJAv8Nv4HrjQiI7TrJsZYZXVjfaXUi8gmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kt1cniW+Ml+PzdE0qdfVd0ktXvVQtnPPvnc9Bl/s570=;
 b=fha49RN/5VrzPtJAkavllSlP9MnhRpKzglz15hwu+wvw3PF1HvLncffiryQQ7Rec7rvnltbA/uY3MpCAJQXWzmVfgeat6ILWHjZF3jesj1NMkhTwju0J4iGfiu4YwbJIUsG7uPEvlQEXwjhNtuiIVGOGcrgGrfUSUWspvfec8KXTPKxCCKFpJoMwYO0rSyEiyjcXBUwjJTLE/ZHdZguQvyVpYx2jCVYwXn2EKbSZNlzO3rKNTOT51zkxj6EtW/mRrY5rIyWTTuqpnRr1Pq29dgmeaGU5HngBcJzfO9OwgiOTcYnULDPe4vCPdriTPIOiKwSRuzmBA1QFMLLxrV+Nig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kt1cniW+Ml+PzdE0qdfVd0ktXvVQtnPPvnc9Bl/s570=;
 b=RFCNs7gZt0izGMz1+tKFuPkPOhGcaXJWmKuRLgHOcZ+5NUPTY4Vfn3ZINYHhgwOzottfx+9rwXBfGt1TFtJLUNA/k3sWZRcjHbehdSYana23LhqHmFSkVxda7LFutUxA2MfUwxWc27z1ZqnPkiArMvLxJeRDxDMqDAwJ0RdwPaCsz6TOituY1CtDC4ui5FueApRahCpzWdUQVQ0GWPWuCKgmFIzphw+UOChRAydU/NokOef6IALW+rzC+hDGByjmumlU9IsDoYL4zuOUbD5lArJ1RIz/qlkDCVdlcsBanNO6jn3T+ilYF6OGOmisS16RALpLQP688RWgNAEhvKGxyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9695.eurprd04.prod.outlook.com (2603:10a6:10:321::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 20:44:12 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 20:44:12 +0000
Date: Mon, 24 Aug 2026 16:44:04 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 08/29] media: ds90ub913: Use
 v4l2_subdev_get_frame_desc_passthrough_csi2()
Message-ID: <aoytFIFrYLliDjog@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-9-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-9-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH0PR07CA0113.namprd07.prod.outlook.com
 (2603:10b6:510:4::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9695:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f96d8af-c337-4eb7-6db6-08df02207446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|1800799024|10067099003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	FKofIOd4c96H8MRw1y8PH8IFys2YmBqYE9ek2TvFV4F89wCCKl0eBqwGBMn5GvLWXqLxkSqTUaObQd+Mw4LbiHJtdyWLWq6BZIWkwuIYQDFx9qE6cdXCLl3CzlaP/3LaJ1nvzwhlVfT+ivlBbIQ2WOoOHUP5F+Ow4wOXJiZcgXj1ewft8g3MnJwuV/9N4tu7ytVa4AuyOQ4xP8mDrpetU/wrxOygjh4n84wpBVpoHnVnNwhA2nNSZ8gbQuOT1Y9uSA9tKOEUg4uPmjpq5F1ssIv82de//PAYD5Yk6UfGIrZ115eYogSeGl2jcbfh+OFkuIKoLqoA2DfjUFipFT6HF0Dk3lt1kLeJ8wKMABtriYd4oC36s2KwkYvWRag8Q0eCPPnNtVAa2fUxQQZqefBVwYmyJi9e+qXDL4TAPzffIXvKxfAOds0KHPQW6nME9+iWnqh1xube4NVfDQnW/62YBVSBBGB2x8CJTXd8Ls8TjtzU9njqU0BWt3EvF52HWZGG+gqSfk4tSAU4w9anPT0yP/jrIDQHWKq0VOti9ZHHZvs9F9EUb5d7BILvZuodIb+pW6v0XN4c0rnFav251aezEGTriHb07Bmw3M0yx0TeJWXbfjEGFkF2TcBZ3UGgxdblMLaDn/WqiRLodDhq8dd8I6YFWH7quT6T3k/Nl5OVVx0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3Q4b5s+p0KZHSuiyol1Tn0ng2NerD3asFJ7fHssdDsH3i4uo4QQry0/ZeQin?=
 =?us-ascii?Q?oUyzYvBWAp6CHFmV9avGtU/joxWEbBjZnne1MufsG9IRvAqCTaNOiCpTc9fn?=
 =?us-ascii?Q?FpwmxknVcO54472A8Wou6p3gIHbRARPK6co74Lh66q4N2eIyEfN32YveadEh?=
 =?us-ascii?Q?FemRwqtrNUmfH+o17E3BIAzcLeJsfOezDIzcl/pfoyhyQ/81FTzZKqCmICTJ?=
 =?us-ascii?Q?OZUhE6+puJVA6o3dy3Ep18JSkPGfUhkVICtAD/d8VXGfC/ZggXC6IYaMk26i?=
 =?us-ascii?Q?xoUwOYVjs3Qh7ij+THLHlms5xI0RuxkfjfkoIfQ/HMTjIxe4Bu68aH00BWHJ?=
 =?us-ascii?Q?UycS9eRoRn9osmzmMsCBOuYLxzaU4nXh+6J11IojYs0eSWPfghf+tMxoE73D?=
 =?us-ascii?Q?NeRgyLX1494cA3PIeSvs3fvPzO6wWxCP1f2/r/DowRJRRWAX17XOqeeuBoVe?=
 =?us-ascii?Q?5nyhZIeen7QzYf+XeVBhI9O7XN66IruDccQW2ueLKFA36JS+ILVhPSivxVJk?=
 =?us-ascii?Q?FlWoEVC8kHNXWnnEMIdVqpLn48V3jaly1o0xnx4zz2a9WEm3cWUrcHy/em4B?=
 =?us-ascii?Q?m14URe0gb92xT5t3ptqpRoJQzrNPTJFMi+HNPuAixcVJ6AquCLxR/5xQI9U5?=
 =?us-ascii?Q?IjS9iBxCgklXO7kEmz0byfOm6Y6HOfO9CD+VwNnZ82CdriqYO1VT/iBqwor2?=
 =?us-ascii?Q?thZk6iIlcBAycIVa5GFcH3F9OSl3Fp+7+3OopwHcEsFcQq/lOuWG+Ouy0rP7?=
 =?us-ascii?Q?uUqx0uPMnqfSbiaU9fipa7DlyvVN7Fd2HZxNQh6n4CSE+B1QQnqoYwOcXUE6?=
 =?us-ascii?Q?c1ZO4vWvQAZygYbBdK3EC0phAY3vTZRs7hDb0T1UjXmnGgoGFu4KRVgSplTg?=
 =?us-ascii?Q?mxbVJCSSL2UFakhi7dk1iOlR4mvsztvQyJSqQKkOODapKPzy5X3xet6ssRLd?=
 =?us-ascii?Q?3Xf7S8YcRLbBF+bxIRhWaz5OZc7tnVQjiw8YG1NVMZkRkwTiG6FsAvaEfCts?=
 =?us-ascii?Q?dAaDbcS5/NiOAtryAum3u+qKE1IEZIW3zaWZY6iBRSMeMQTpyYQ112WiGMKk?=
 =?us-ascii?Q?s3WaKBsvkffxi96VtXFVYNqcnvyeIHa+z6NkoGir15G/+9KagYgRTtkT5H0N?=
 =?us-ascii?Q?yiQecFnwyqfM2GoM46aTZxV0g8Sx1K3HDdExnlY/YreuTIJL+KCHCGkLna8T?=
 =?us-ascii?Q?szjPpcD3dejHrgIKcUaHlcBHhKOXiJpsDeWRSsAoaEsP9cmkbufHRVrafVx1?=
 =?us-ascii?Q?+hady+zaG5jahlk40keEVVBxQHfoM/8zS1YGG678+0o2jUU5GpQJAmvMWyiO?=
 =?us-ascii?Q?7v5OhfCrN7OExSuog+saXQcKAt9CWAyx09AcvaQH+icR4ymHFooxaviUSr+o?=
 =?us-ascii?Q?3HbaMSFg/ftOkJ7uC753VOq2Pz7b6PeqqRsC0LEQc6n3QyAY2gFoEuyQuA7j?=
 =?us-ascii?Q?dDoeTj6v+5e0vRA336N9yg0lQFyY3Ee2GZiJkz33tpk6qUwzSuHqvE+CazgC?=
 =?us-ascii?Q?HJRHXVcGtYZLYiqgNAimBq4ZIgT54kVzpHrFmqxIOf5X8VSeQbXLaV7W+7wX?=
 =?us-ascii?Q?Xh7aZrDLFxrhrRZQNYAYM7kDEwmjRW/teAxxdGKfijijld+a71j0tEj4ZCLW?=
 =?us-ascii?Q?d7cpasEklDTpj3W8A+pk2iLIgONbnTV+NI8FjV3/hN1zKPTRy74gugirP1YX?=
 =?us-ascii?Q?R3dUprb5x4q/J1OG6vV0ue/unGM1v+92lid07tTsY3PS2zafsGM+jImTRegE?=
 =?us-ascii?Q?hQU8CK/o2ALzKmCqyrXLUGOZ6R4D7AJUb2gV5mamkAHD92foYR7z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f96d8af-c337-4eb7-6db6-08df02207446
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 20:44:12.5752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jdx5d3wIiL3YbNCyTomafyD+KlK5fGr+buowCSRvJ+uFujG1oln2jMf7VaZ4chTl/LIXu/TIprtumf1Kaxj0+MQSYUYiU2xc94E/jMh2pPy/3Q5ugpuRAQJtACQdI77P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9695

On Mon, Aug 24, 2026 at 03:14:30PM +0300, Sakari Ailus wrote:
> Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to set
> the frame descriptor type in the get_frame_desc() callback.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/i2c/ds90ub913.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
> index 6abb5e324ae1..922865f03d37 100644
> --- a/drivers/media/i2c/ds90ub913.c
> +++ b/drivers/media/i2c/ds90ub913.c
> @@ -487,7 +487,7 @@ static const struct v4l2_subdev_pad_ops ub913_pad_ops = {
>  	.enable_streams = ub913_enable_streams,
>  	.disable_streams = ub913_disable_streams,
>  	.set_routing = ub913_set_routing,
> -	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
> +	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough_csi2,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = ub913_set_fmt,
>  };
> --
> 2.47.3
>
