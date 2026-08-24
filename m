Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011023.outbound.protection.outlook.com [40.107.130.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D695837B018
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 20:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787604499; cv=fail; b=pZnFiun3Qwipi0j+O30Kx+jIi1bh7lQgYzwgJ0RYJpTBgwZEowsymocykORD/Jt0ASEHJdn+NWZS+JelGB+vOCPSIY9KQ9/l4NIHMEz0iqf8QXZrN/okMmRqfZeXXnNz5FE+hgefL9Yuc+LJ1rnZv76cI9evZrXUmpkmKX/ttHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787604499; c=relaxed/simple;
	bh=luxQSPMIEByiWZDKFx8sLZUQuV3HK6kqDu+tfq+UYOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bPUTmLqUBLcLgh1mPIymTSzCyyHUOQwqi00rsi5Uc5jl5zuctE+ObUDy5UkKqM7H+Nga+s5YafUhlcuabiU9ZsAA4jnX+PmqsfuJoEHRQaKvYpCOweGukvCLfw/VZZzlzghad6wjY0s3wZHiiKoydCBMcmwGR8AwP0IckUmP0/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dOZ5fcxZ; arc=fail smtp.client-ip=40.107.130.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dOZ5fcxZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbAUY6SwoDYR+ls51Tpq/jvaUWWhubCpCqzF04A1pAQwt2KSzj+x1BGz0+G2+fseJg4TZB5vkcLhs7YYfs4X9IXZGUlCbIuHStXOrExujPJl4pcD1QZN4bWna+vOcnTqtIsAsVdQBDs4GKYduYzT0iWV/3Cyt9MIOQSaqo9YSaMp0eyBpIopmb+aQaxZ5zwL27RjwOeXQIA5U+Cuyjg55Y6tTVV4nZJfMXWWIjKqLQQQFuyH/2USoG4NIvl+O69D50DkdaCfQRAcTVHFopddA40IYUTq+xmVS+ba0vpz8pri8I1LZxOnkkmx8N9w1Gl7yySgdVLOunig/qx/eQrEnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2RQUdQ9iwEH4bnnI8m8jx8rMiXhQEZ7nckcopdHmUk=;
 b=ytmf8qN6d7Mu78I7itcZSXhJR90cjduEh4YV28eADKYmU3RmT71qNWZzSj29pTRN8JF/7DJmmgkWwtpk+kyAl+SE9DZQgLt6gWZaOF/QHymPg/hW2myOzEz7HLwSQpvBLr3uszHF1YW9x7hnP1cnar8LeYYLF5bwpEjBsnqD0hKKUa7tF12v4jnZf4w4sYHYjRZ75XPaVoyS2XDY4767QKno97tTN4orwoBvG+3uKMD0D0mWtQ96eAF1lwSNQav7xtpLkU2FpcMMNoCrURWB/fmfXhkEJ1O9wyOtCOIJk4Vt/2utX5xRF1uGQmFrH5Jb9oW0vDUvGxfEQvpD9TBeFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2RQUdQ9iwEH4bnnI8m8jx8rMiXhQEZ7nckcopdHmUk=;
 b=dOZ5fcxZurBBI+otUeDKo5T8gFocW+ieszEhYsufhTAJ3/O9NXn2AWoOZmfd95GPijFH7Qtf6ziPgcWHvJaO+HnRdH3ImYQLC2TR+hgIsLrLTwrV7SqsJXxaRUVrx2LHwBVRA2zqX5+U9qWOPGKCvv6CLJqcsWLIYOPPXhTYrigx8qMUjGmGXSCZmju5C5GLkKoDin38jaYj1avBl84okx6a/7jZlkDiF+bCTMU34h4+3rg+Gdi1uL7l/XQVMgCvsh++lTZK7U0EKN6gv/Wd0ZxAz56lRG/+j5eE3eyCbMW1wD41Jw+/MEuJ6oRqQDjKU0mGBaah0WhleZulOP+crQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB11001.eurprd04.prod.outlook.com (2603:10a6:800:27d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 20:48:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 20:48:13 +0000
Date: Mon, 24 Aug 2026 16:48:05 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 14/29] media: v4l2-subdev: Make
 v4l2_subdev_get_frame_desc_passthrough() static
Message-ID: <aoyuBbwxIaXgzHc1@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-15-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-15-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH7P222CA0013.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB11001:EE_
X-MS-Office365-Filtering-Correlation-Id: bd69433a-7c94-46a1-accf-08df022103be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|1800799024|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	e9AN+/Ldk+yTytrB6SybkhDYf1T6enkJIVKhGSh/GfuFpqdIuyUnH54fp4eaI9qoB9MVO60kYq0/h2V8LIHSfs7NHfu9H+WerHz+oSy/ZJKQxXoHqOXeH7Dr7i+EFVj8RxdGAMU6MirtLeG7gUODf6ciKqXhKkLixfghq2w8fTKHBw8OGXwahuPPgVH+kI9FBXTPWrSzZ8bZ6a03l6cHKA+14N7E4b4ofZ2+EVOQBMSLDRMg6oX/tEHE4BLd5yXYTfVQQIC9UtScGsqp7nH5KzK9TrC4mh+5neyYx8H2yv7wRh8qxqie/MbVNAy+fk7Qx7Rd4jmS14Cq4nE8NgudiETuVXNkBQ90RMIB7DU0sXf0Ac9OMT+0c0Osdit/NFbWUJADzl6wc3IV34lyHWVZq9OMK5EfEWr4U+4pXaNCfwItA18AvO8v31wUS4dblIQpuELI9HHpQNU4wkMRlC0r7EO5nYHyhj5f/Ec8imm8/1PtOs2rKdkib4SboahBDInA8mLOShxtgCY6mWdNSKtMU/AFADxXVoxhqgh6uHdDWoD1+LDw7DgUA3LMa/1v3R4mPibuygD6SMtvvi8LrjV4wmm1sy0IZlT4SoW2d/WRNJFiC+hoIb6Vr6cY1BauTPs8gZbMZBVDXqiemWX9TiuZPwYXLI5xUxnjneMwv3IQeWA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y8IZVwhXazb7vMT33ZK0TfjbjZu0k1dOh2RAIzBQLkwWG/BC4lDt6Arq9ziu?=
 =?us-ascii?Q?7Qe8RffVLYR+0GCu+j/JM0E9tz9eTyHxVM99C20pHMYi0c+u3sqCdUKlA0yR?=
 =?us-ascii?Q?JILfnZoIYPOeCDsRZE8ttR3NoKtZT+/F2HQxIyKRPfHkFb+nxdRDgZ1IDywy?=
 =?us-ascii?Q?jO5BYPBz9mwvArFkgxRs62pNeq0kZywe4Tj18CtXvgEosC90rUtwxOAk6ojg?=
 =?us-ascii?Q?ZQhHFnZDv8mQMGpTSR2Jm/Q8q8N6gmQiShIkqe+k/f6J35a/sM5FA4Ce2qC8?=
 =?us-ascii?Q?MqTSWlQTe2A68KWQbj5oCAktQr8LZcj0NYkMI0VTmFL9omW+YTnn0bmS9DCp?=
 =?us-ascii?Q?ltHTlpnnpg6fECwSQooE1tWFgApFHv3RJzsoJp02uy3FeM2sNiHkeuWzxYtw?=
 =?us-ascii?Q?d8pvs1gfnY3dTjNpdleZq6k1ZoDYkc35Rn1P17DAHmytEq1JGwIHZjfBSsf3?=
 =?us-ascii?Q?p5WFz/q2UWo7Lkyr40Tyl7x6Ldp362sSAobIy9swJ0ZUPHwhjprPOe2/ufnL?=
 =?us-ascii?Q?bFvX5FJKMRu17uucEyAJBNWt/9k1oJOwIliZ4qPxzgqMy2mEv4Zu5HGWMjG5?=
 =?us-ascii?Q?6SOvh1YngafDHlARwo2IBn6CEJHX7V+3P2FTj52G4BmbSqSTZ33tLoXnYBNk?=
 =?us-ascii?Q?G0rq1L9BrSdXQ/JeKZQJ9nqhfMaETOesUoAcD6iW6hhSKcToED9aOvvEsELD?=
 =?us-ascii?Q?QpfqNkJnXa+Rt3zf9eXvn6icjkVjrLGOyunMx44ZT2HA3Q8akhOT1hh4acAQ?=
 =?us-ascii?Q?9/Zq8FJtZSarzzPiA0d0PyQagGRJO/oBEmtWwWBZcA/8n6QwYAZWDCDTvPV+?=
 =?us-ascii?Q?7GqlD2Rfd3eHsZqrjp3DMxgwlWnP68GzY89lx0hrerGYuCXoVyoUXqBuRUAP?=
 =?us-ascii?Q?88jbV1WNJd/1lc36sFEG8Hk6wyoRN1YcF+XJFACBN9raYy6xYMeXU27WIcoF?=
 =?us-ascii?Q?0xkDUH9FzXK4PH1zCFLN25f8WsZHRGdkCY7jrBnFlfywoZthZHPpLsiae5ki?=
 =?us-ascii?Q?ppo8mWHWyB5zMTs9VwESg1PQ7RKzAtMu7nqVUKS4us8nb+P/gjjCxst+Ca1Q?=
 =?us-ascii?Q?2gDOA5Ytw8tZTc8n5oM7N9YjF5QwCEy7yycX0xw0wLh7FO6FOiiqQlOdm0O2?=
 =?us-ascii?Q?MSpRFeuDjuk7BUuDEw7IE4WJZR1ljg7UhfKbjQCQzCnd1pPy6jX9mdwrBGO+?=
 =?us-ascii?Q?tk3YhK2tLL1iW6OoWBgFPRWNjZCADrN8jLp81lGdd4tfhBsxUQQXzUHEhbkC?=
 =?us-ascii?Q?CdvwYZmvdJgDP9oyu1Mymcy1V/+cUAU26sUcHJ9l4wcanpx6E1ZoVSeijdHd?=
 =?us-ascii?Q?aqciA4Y0EE+PSkETQvNp0Du6We1UxDE3+mKwJN6aYKUcY+fHRAtpsYpcfwtK?=
 =?us-ascii?Q?q2zxkx010N9ZALerk/Ec4OBhK4AE6cYQTHJRkSIBjpQuPfY+aoVjv+nbp9WM?=
 =?us-ascii?Q?/JVPXpkBZKZQKVV924/81ite34kFyANpR9kvaf+f9Zk3fuoA2Ul0kKMhNEOG?=
 =?us-ascii?Q?Ah1Ty4iQ/UNBnRtJq7jI6COefpM7VNaHUkkbDc0RF9m7guIy93BH8U6d41yg?=
 =?us-ascii?Q?ZLBO0Pz3j7i3OjuL3A58uS/Z2gSC56tphCkbdPwJhjUmT6Hyy2QW/S8F42AS?=
 =?us-ascii?Q?s4MiXwkfp76XIoipBTiOrMpoqWmukQOBl01YxuFunO9bqVf7pKd+kdtP/elA?=
 =?us-ascii?Q?nsGXyGP96j4fX5OIyCQLa/E0UdKwqLYoKXdf/NsH2H7dYU2rexSsZRJ+PQn2?=
 =?us-ascii?Q?zzvt12WRLqjvTINcTH5iF+Yedx7czirNqHQwetT8r1Qm1oQJQigV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd69433a-7c94-46a1-accf-08df022103be
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 20:48:13.1408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8oVesdjMKbwn+L2Kj+E075l+zfjoC5o4IlsDI+2nwhKWKHZ9wF2jFMQLbrs3SdNZGdhY9YuaYxnLnwpYwnjzTFt6Lm+9C7d5EX1yoUY2dl/Yjer+R9scI/suBFKo4VZC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11001

On Mon, Aug 24, 2026 at 03:14:36PM +0300, Sakari Ailus wrote:
> No driver uses (nor should use) v4l2_subdev_get_frame_desc_passthrough()
> anymore, make it static.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/v4l2-core/v4l2-subdev.c |  8 ++++----
>  include/media/v4l2-subdev.h           | 22 ----------------------
>  2 files changed, 4 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index f5fa62038754..c9f38b0313eb 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2655,9 +2655,10 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  }
>  EXPORT_SYMBOL_GPL(__v4l2_subdev_get_frame_desc_passthrough);
>
> -int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> -					   unsigned int pad,
> -					   struct v4l2_mbus_frame_desc *fd)
> +static int
> +v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> +				       unsigned int pad,
> +				       struct v4l2_mbus_frame_desc *fd)
>  {
>  	struct v4l2_subdev_state *state;
>  	int ret;
> @@ -2670,7 +2671,6 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough);
>
>  int v4l2_subdev_get_frame_desc_passthrough_dvp(struct v4l2_subdev *sd,
>  					       unsigned int pad,
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 80ae7649f5c7..cfe285f44f57 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1773,28 +1773,6 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  					     unsigned int pad,
>  					     struct v4l2_mbus_frame_desc *fd);
>
> -/**
> - * v4l2_subdev_get_frame_desc_passthrough() - Helper to implement the subdev
> - *	get_frame_desc operation in simple passthrough cases
> - * @sd: The subdevice
> - * @pad: The source pad index
> - * @fd: The mbus frame desc
> - *
> - * This function locks the subdevice's active state, calls
> - * __v4l2_subdev_get_frame_desc_passthrough(), and unlocks the state.
> - *
> - * This function can be assigned directly as the .get_frame_desc callback in
> - * &v4l2_subdev_pad_ops for subdevices that pass streams through without
> - * modification. Drivers that need to perform additional work should use
> - * __v4l2_subdev_get_frame_desc_passthrough() in their custom
> - * .get_frame_desc implementation instead.
> - *
> - * Return: 0 on success, or a negative error code otherwise.
> - */
> -int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> -					   unsigned int pad,
> -					   struct v4l2_mbus_frame_desc *fd);
> -
>  /**
>   * v4l2_subdev_get_frame_desc_passthrough_dvp() - Helper to implement the subdev
>   *	get_frame_desc operation in simple passthrough cases for DVP
> --
> 2.47.3
>
