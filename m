Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013055.outbound.protection.outlook.com [40.107.159.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32361FC110
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 21:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787606001; cv=fail; b=GgLkzzkBbf40GKF81F/ftNsSGjrYcGsbQQXywrMy55S6gK13bEQl4Vk/hsCdp83SN8hfXROZt9Rf0bVjE/tIFoDqwCLN34A1D3KDjGYxQiztR6USRc4OnEZmucFQFQKQhNE83mik7I9n/Fi+7FeuZ18HN9VXmc2YmV5U3OEIxyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787606001; c=relaxed/simple;
	bh=jGBKsEflJNfIwjzSzYPxhg0+lTt/RVyN7XuUf1hveZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YObhRaLubSDJXvq4Y7fVCLjojQIOV5XLS8Oon6CJixaRF584Tct+QwpFNMZiKDm7xXVBy4911CQDy54ni9FWR+h6sanJodi2F8nYDaLmO6YCU70tNd4HXbSaeX2EUN3CPJ5zYUtJo0SFwJkXReIl+N16Of7iHLN4xSnjmS2XvlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hdAVa1KT; arc=fail smtp.client-ip=40.107.159.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hdAVa1KT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9Xbg68OZbaCINaep6mm1ZBv+0yFV1CFAGdDVV5yhrfjXzWMHT6EC+xHNcKTbQku0Hr6JQZZm6WhU/AqJaU8BZ/Rh/XjPHEy7tO0elD8F3/xj7ftHBLRIrxuRyuuQC2dDhbvgVscr2ivQqPnZ0LMSoC2QqyhW2pZoB3rb0kQvOHwxTuDC0OXJY9l9XoLR+4ko9ZWZPWSz7L4oPFp5qoNXVq7dtOwNs9JDVDdT5edrUxyXBd7LQNKwG1ZRC3wrd839/bf0tPkioX7LYv9zb+dgeSrQiWfloRu5b19zv8eEg7ISnCqX51cKbiY2Y9p9C8dF9SjjizQgRgxH13keudImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKxwn0EylrnHoZl52wpJ9QikHYbVdU/6pqwMjoMvwNc=;
 b=mntTVT7bXLOjz2mKkZ6NYOXAJjlo2oH5ysclg5N6kROdCTCdbrdHywnjA0U0dGEGhRZg3C3JKX/8at4JrOZcSNv2ZOkT+ORkqCk71IkPro4O8ewNUnfDDlTdryQxNwSncK3Exw5T+Z9Nea0Bc0/pUwvHqhoqud5WpZEdhLgd8I6+Y6wYehu1nQio5sFsjsrNLY2B7eYVT+tAiXKgJCZ0DyO2rwrhzRGo+PBHQogwTfR/K5W3e5RcSeyOC9Id9xbtBp4KAYfl8g2TnvRO1zDs8fj5+513b/IZ81IQcORCJKtCmTE0nb+orECOitPSFg23OgXonUeFNLXDPrNujkynCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKxwn0EylrnHoZl52wpJ9QikHYbVdU/6pqwMjoMvwNc=;
 b=hdAVa1KTkQUCQnAygrx5VUPwC4QMj7QodT/3/nvbIxLN7ZHgcKmjJmg1rb4v8gq+vsNYBw5+FiBuAbO4EwFmWdTUPtzIvTLQqOn0XtVwXAErBuuC4W4fLShABIMmjnS7EP8hjZgcZYPc2JWhor8l6JbVUZt0Az9iLQZMD9da7RdKGKJtfFCIJwkKbYU3bk34W5lAtYGNxM80srlOGNLM+JB1IRnZtW7uNGH0KCGfrZII5uz1ftYhbFGYEVzZUUYpfD1CUfg/vEFtocp/14b6JBBhfSPLS+qX3kDcEVgQxLjPBLt+IsWr2FiYZGPRQt9842rpgMkNQxOLqUBg5V2rZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8085.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 21:13:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 21:13:16 +0000
Date: Mon, 24 Aug 2026 17:13:09 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 21/29] media: rzg2l-cru: Use
 v4l2_subdev_get_frame_desc()
Message-ID: <aoyz5ReiQVeKRU7b@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-22-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-22-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SA1P222CA0052.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: 976f8741-1d8c-41f9-402e-08df0224839e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6ujpnhMnxuKt3dD6Y1xDMqQS5nYPbVP9eGhsbPRKVVNIg65zr5W/FkiCFOQTiZat04EzeguV3Gs2E9M9tXy+/zBDfSMV3LbBnCRgFDd0AgGK3YSrFp5WK22rFagg6Q1Z+OvCjg+VWm6jKHN9/CkMIVsPGqZ6r/9Yss853+e1RmwI6Y6Xteid+fWKwm2dIZ7W5PUE1ZGZwQijEDvl8iQc6KvYBLvR8Wjq1NOFifXHr8nqA+xnxay04AzKxNK2j836ShaxVFUHseJCPfxI0X6mgLnvZpnjxNRudIk2EBN7sntvCuL3hCD/DQA6sgYH4Ain7jaQB4e/SpRlfh+tMlmqcpAyywdoHBgNeBMVG4OS2bu+jf969qsNKHYXGw06hz1tDp/Hbm5OJElZ/JvKb+kF+GSJmVkbiRBBCix0v2M8d8LLXe8CWqLAIe5HbQLUfe4udbwYxBxndt4lWGI+3kvRNvMj07adELTd+xjKPubJC0NGoEhdMfYfUBNuuI65c1BFRt7ocC5ZGzx8rdnITCO7qK6PlxKo2g2oCLNEakSmd8IEqzVYj5sV78doNX0T8h43BbvUgyleL8yOe6JAKrvw7Pw2sPZhjvSxFPK/Ikuz4BcWzY41dLjQ3xVmbtSLEa2GvFXNhIdAOSwFVgrOGPFyvgaM6+u/tx91U57gxotUFRQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?se8McVxf/BTQwwQcRrVx4EjXMNl0u6pOi08UqXY+Dkcf0k2KaQT6g36ZXwg2?=
 =?us-ascii?Q?oJoTwej1sXbVmG37xrda2P/C+8JdXx8n7kfCdHLYoI7TjqRc/82esF6XkKZz?=
 =?us-ascii?Q?QBGGoamk8Leh8NBm+oMZmKyxS7+RF6loDOnJuWchrsKrHTq90n9hI1GgmcS5?=
 =?us-ascii?Q?aCnzvJgkwG79lrkIYt+ilNcbz/iZhKDLbVPoYojOP9i5tYJrxUjHvSu2kDSL?=
 =?us-ascii?Q?pYuqaHZHp8ej/S8LVWYrqctUl6jpN93Sp+qvqJtHkCx+iWyJr9zgeFms84k+?=
 =?us-ascii?Q?nYsNzzRO4XcMBat7fhKHqn3ru7/sRpWNAcIUCx1Si/jVzXB8l+7IJlHN8ymX?=
 =?us-ascii?Q?X/IKwsQ41OcdXv4GAJ3w6a5356PrJ+GNO9yLmIAXa8rywM650DvZB5meVl3t?=
 =?us-ascii?Q?5bAlz+CStFczlKQPOUQCIS1jwH1U1oVCRJsstAZAKO3ov7OiCdI9yyjMvfP6?=
 =?us-ascii?Q?JJL9h0GIc1MKDwpbi6busFZ3En5T0PIpcJ7USyZJwVOk0/iN4UTuph8fPuXl?=
 =?us-ascii?Q?h3n+BwM91OGA5JAwk1/kwvXUHdxEFY9sP8z2Tmv9EJr/hGx9nxNpkzCMK/9h?=
 =?us-ascii?Q?wH+0rR8Wt5kjRB3FB9Lim/hy/0OylA2y9BB33tlDCC2iC4+Nwm7WRINJUIAx?=
 =?us-ascii?Q?E+Jahf+5BfE4a62jXPGmd+YRf9Ik6qamgRyNKyuhOJCWwNZJa9k0Ctvksdu1?=
 =?us-ascii?Q?JbovmJdcnteZnmylLLyKXADfmtLwloqlZnjAnD7L5P4ZmaYGDJSmK/1B7qJO?=
 =?us-ascii?Q?j5iEuWZ78SQHsi4TIMWz7E5yebE0VDFU44MwDuAh2Io0iITbatiGjs6jIPnU?=
 =?us-ascii?Q?CRwqlTo1D0QsPysP6mI9q3zNJE4P72URJg/ZzYNpYhc1oDdtXNYbFNh7bcnZ?=
 =?us-ascii?Q?bSM8wPL0ImyD8IS2RCki4+YqOdJuKdoLEw6ZzNbAy93gCPUW6dJUxCzMWIA5?=
 =?us-ascii?Q?tmSO4daS0rHrtNR4duVCHi0jtg28qx+ciLGmzxVkqBpXkJxbonMG1OrlzOHx?=
 =?us-ascii?Q?ZQWq+OZu+XN45EHi6SWcPqRRlBzRPydxUezkZ2Bh1CtyiGWlNpiyCVMgzuSV?=
 =?us-ascii?Q?24o6ZWFNejpo1GxSZvorErVaCj+aHn8MSGqUALdzojyDFQ+CP+0QZChqZ3C6?=
 =?us-ascii?Q?e95U9OuBzoF/Tb7T0kLC7ug+kO/Mg+56Jp9rU74Now4ReotdLKsWCHUxmwDt?=
 =?us-ascii?Q?ZrLS8GLfxywDW6anKAvNPpBNZ87czwA7QT4CAOGi1k4JpowYV4CZTyVCcJNb?=
 =?us-ascii?Q?pfCfyJZmPtq9IPdsjWZryuG4VPYBOc70ZjMLv/gbW+p88Spna9Vk8dJ4OCp+?=
 =?us-ascii?Q?hyiUn26fHiNQbWcp8QUq693V5MEOKV8Ad3bxoJxZuj9WBceGk428Yc9hzvre?=
 =?us-ascii?Q?3K7wddJp7+Netdq38j9+H9T7Z6sRwxvXbYjgXNmnIK2deiyibf8TZ58kg/6V?=
 =?us-ascii?Q?rSLFcEHpB0ACpkr8BEQQOzM26pC+Pan166A5ooN8edbJKcWalLwacbVVZnqH?=
 =?us-ascii?Q?RQvHVrIfw+8nR+V7z3gH+0My/090UoLykX935CIC01TVke9Iw5XhAwlJ1Ntz?=
 =?us-ascii?Q?4itZx0rXRi2iPGF9hHAjL6JbE/fKlSc0oaWm7CJvhCDeE3jH3DugVKYE+1sH?=
 =?us-ascii?Q?oi1lnn9lx2KezUAWmjKzSPVOjwPNqBaiFNOfohmLEDuC/3r3To9fqek5m03M?=
 =?us-ascii?Q?HU6Gu9DJUdkUj2POKAh19KoRn/2M5sg3HOzBpS6qSZbTk9sbhSSopyrYBAk1?=
 =?us-ascii?Q?yFi7C+Xd6SX/1ixQK3ofFYMJCrAChRr/mgwYbrjsMI/qkx3MZwsb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 976f8741-1d8c-41f9-402e-08df0224839e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 21:13:16.1603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hzR8UHrJDucvoULIhozt6l/xWjjhfDq7oXeV9c5FFH3lPJOGhUBQ2a33ZO3eNCpHL2TAO/dYmD8yV9RKo2s0qFBj+lGw0DqlefaesrSUmeMDNkp5g834tqnrlcF+Uek
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8085

On Mon, Aug 24, 2026 at 03:14:43PM +0300, Sakari Ailus wrote:
> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 27 +++++--------------
>  1 file changed, 7 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 91eda5034248..90c074527e01 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -11,6 +11,7 @@
>   * Copyright (C) 2008 Magnus Damm
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/pm_runtime.h>
> @@ -438,31 +439,17 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
>
>  static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
>  {
> -	struct v4l2_mbus_frame_desc fd = { };
>  	struct media_pad *remote_pad;
> -	int ret;
>
>  	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
> -	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
> -	if (ret < 0 && ret != -ENOIOCTLCMD) {
> -		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");
> -		return ret;
> -	}
> -	/* If remote subdev does not implement .get_frame_desc default to VC0. */
> -	if (ret == -ENOIOCTLCMD)
> -		return 0;
>
> -	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> -		dev_err(cru->dev, "get_frame_desc returned invalid bus type %d\n", fd.type);
> -		return -EINVAL;
> -	}
> -
> -	if (!fd.num_entries) {
> -		dev_err(cru->dev, "get_frame_desc returned zero entries\n");
> -		return -EINVAL;
> -	}
> +	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
> +		v4l2_subdev_get_frame_desc(cru->ip.remote, remote_pad->index,
> +					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
> +	if (IS_ERR(fd))
> +		return PTR_ERR(fd);
>
> -	return fd.entry[0].bus.csi2.vc;
> +	return fd->entry[0].bus.csi2.vc;
>  }
>
>  void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
> --
> 2.47.3
>
