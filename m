Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011070.outbound.protection.outlook.com [52.101.70.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDF3391838
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 21:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787606820; cv=fail; b=G1QPKY/fdaIzRf/PcUKDvgk+SxWx1sOj6nw4OpSqmtNuVUWpG/HBRWlDHguWX5Yx+AR13N40PU8Wnf1VIpoWscR9xgJwnRN4q/e9m7D2WELt14CFhs07MMtdJCRwSe4wBQwu4YdDK9gypJsyZrykdvNu9UgECIsaQmhWR57g3Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787606820; c=relaxed/simple;
	bh=2RLkc+xdh7q7E9Pwbd6l9BY3/+BuX+jOfWrzZ048Sv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LKXHyvG7fgd3N9bpv2ZPWLlVs83whFOjjOHt9cJ8Ky7mZKK9nqCSP4VJ+Y5TboF0E3tKhCiTDl3dPV+EhCC34MSIsnNIIlKZUJhKmVRyZ/+6YxeUHm+q6Gxh0sC6q/OWS7Fc/FK6rVdIbbpHvjKF1UWV0ZQ4WqQ7oZhcGG47qvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CDsuulC5; arc=fail smtp.client-ip=52.101.70.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CDsuulC5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kjrvre9cM1o25MZDHmCHYscDfs4rf8vPZLE41u4z8ODiHMbmkD0KiZv/qCqT5s62LwyggpYEwfLZ+2prEQBwOE6j4FHllWN1Owia1fM2KwNOvboolATlUWUMy9Kt3bqZEbJYe6LOMLHwaazQUOa+oBOPahxqEWxGqqFaN8LGDteSUqhQEYuXWRchBIlqT4Q3ATcYBQ3zhnZTBvwWxEZSfCGKUcb0MWa8uJhKSvX0tDffbwsfUExDZAwMOBRj1BCLuObqnqUfLHmg5iX4FC0rMhqIyFIzzcVfsQgMq6yxmpXOb+6nvu5auLCZe0A4cmDFpHkjwvJdwIo6MrIOrWucpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsQzW5Q4yWvlMlNZIXjgC9CCUyMNduXa0oBqJpx30bQ=;
 b=PAFed0o74LJCn+GtNyAg+MzNHA8FyHi2OmLLnLNEH/vAZHinruuZF7XV8wotqE0aEGeujAuRV8Ob9tj1iiIt5QqIZp06f3gWnjF5x/UwjrP640LHC1gM7SkCVXA+uNAtB/vV4k0SGumVyMTQCd3P1t33CcyIWskidRpjjyPKazg14pZxNBor6/5CmAifmaPGZmD6epP5OY8tWeecVK1Ew19aVZbN0KezqqwAGJ8GCZKyfoLd/hvvq+91QAXZ6Ik3ra4Q+zRwgR9k0ZdUiF1AnIm/KadaX+Dw2AN91ZE2F22sXpMUOVfdoQontnIQlB0ma/0nK4biJNwq21zG1l2k2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsQzW5Q4yWvlMlNZIXjgC9CCUyMNduXa0oBqJpx30bQ=;
 b=CDsuulC5fHuCoJCsFRpAoE4kOu0B9TjDe/NR0jB/+yjtxc47ZSyZ89yQutKtoFdcsht2fKPTrgFK/SCm6LVrq0WraUxXz9NoFRqRYRz1LyX2KuY34ELZxGAa4jVvEZ1voPkxP7JNvID+5VeM+zzBpJ82zFrjCYxoWbJdRoeml7ecb9wKeXY8QYTK+SGYeU8pMSEA/FiUJeTY/qLpX9oFGcbwz2d1O5BNYlWUvrmwpKC/vUFV/gyiHhtyurOq/T8haC8Ivs1S/BsV2tpclqJ+1iEgNERPFhOurO9D+WMS/DAbXH+FimwGX22UVxCopzMl/tmEbRVYIIi74cLW9MrluA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10873.eurprd04.prod.outlook.com (2603:10a6:150:224::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 21:26:55 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 21:26:55 +0000
Date: Mon, 24 Aug 2026 17:26:48 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 25/29] media: ipu6: Use v4l2_subdev_get_frame_desc()
Message-ID: <aoy3GMcEVfD26veb@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-26-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-26-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SA1PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10873:EE_
X-MS-Office365-Filtering-Correlation-Id: 26595dbb-88fc-4fc1-b570-08df02266c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|23010399003|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4ElOg0m0Z6Zoix6xbRIHKGGZyn27Fcd9/QSVXPD6LriT73VmCj257re5z7PDWSsjnYjhyFxavTJfcwM6A9Vb38XQl8rsLO356p02hdv8GHBmGDOf3/zlPspG1BMp0GSKbA0EHTnlTvo37WzoCSkPvzUzrQOeRjr+JKmc3mHStilwx8WsCBa4hOXp993eTkSEcbhvoEaz4RdZ3SS9nBhhOtlS56s6SoQcNegNKfi3/wNhMN/3f9t2ReCMicp5Sjh+YAyyYjO57o4VKtd1NGmFxUNc1o5SEc2sA6pEPYLGiHewAgrwdgjjgeFGvO98AL5VmCm6pklnD28rakoHmGZBRaWxy209D/Nkjl8Q+Zdk9E5crdRhJ9gidjVQvdYMTn94V+x5QNO/Vs/gltqKDBceHDp9ZoqX2yFE/QjrxCmNp/wAWsFS9IlPznOevmyrO41IZMuIp8ddBbxGQh14kfAWl7Jjzv5S1L4tNCPiv0lCEiFIJoL33q9PRJlQ9h3vjRyw6eBhkWpRgM4Qym/J8cIG0ugfsFkqLBFCKRa2QfZ43J+JHok6Uscz8ZMxLT9SQ4KVa4qwk+ajMyIHewpmRhIgHUS2wTCYrGojG432VAX1WASbjUt3ijdT1OWm1Kh5aCzA9xFFqecdBts4CyNhs1E7xhJHeDhLBAX03jFNfvJnN/o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zkHXXPDhQUyLmL1mHS6S3oErbQBDKMj89FBRhTbM82ez2goDcCkZzFx8ksEl?=
 =?us-ascii?Q?u/OCu+nSf4n4WLQc64Ivi+YeZfqrmpNl90jR9+XqjPNU5tWtUVDj8ciPi6W6?=
 =?us-ascii?Q?+dCW8r/9OAcSodfqF2XTUtc6E8lt85L+uTm5crkANIptq8LTT+MIto4JUXuF?=
 =?us-ascii?Q?nTpzxhh939nfKxKLava2/WCtfXrUYQGNuYJhmlDWhAVfCHZPdn2/olkWZ1XU?=
 =?us-ascii?Q?IrjUYIg+dgkQ112hLfBxtId2hR4KSCD/IXAUcyF2lrZdkLd4b5FWCZuYQsX6?=
 =?us-ascii?Q?ga6utsnFnKgl0uRSVzIRTRSDDfxKzFSlCq1e4Zttmr2GRkUYV8qF7aEkkptr?=
 =?us-ascii?Q?Lkc3dXsDWmz4QkIv/CzPr42VXzRq5c8JTUu3TqbD/28YOdJTJdOxd7wmXQmH?=
 =?us-ascii?Q?CXzvGJa4ei32KOg9rukDfMlpZ0TGTF5mFSMLGHWiB73Ly2lcakINlVSPcT+t?=
 =?us-ascii?Q?snz13pY/XnTYtLLRaoDcwg/lekhUb+DITzczTdgad14qJh1olAsXrMdHKJjg?=
 =?us-ascii?Q?r59o0sIw87EQiUQUYZ9UYonWh40knogLwIPLdxSN27q/iFtFSvjW6zFp1sKs?=
 =?us-ascii?Q?adTUQhfhnaWjDg4oeBC96cxzwEkrnh6DBRbZ06GfqAJDzoYUfb+Kwjc7lhTZ?=
 =?us-ascii?Q?eSl+TujAUYVszud2zWRTmT7hhtOvV65G21Uj8CiDxTrjq7ftpuKwKzuJm90l?=
 =?us-ascii?Q?Nd0cYxiIusmGyH64sHkvQWkOesosTz+rkKA7iiA1PIH7v6CFYDOIKkSNIiWZ?=
 =?us-ascii?Q?tIpQPM6NiaHa5jEBJMJ8yQ+TlcfEK3V6q6xxzLLtJyMYGElycl2BObl//lUR?=
 =?us-ascii?Q?hLwK6T92iWZzBQA2m/vpgvJs6pKNL1CRSGuiV7bwQ1+at3yC6GSZKTmvd2Si?=
 =?us-ascii?Q?rtJtiseVBlkU1sdPxZgCWYEi5vYHTSrRYBpbRduPywKgG3fuYP7xz/iUDuRr?=
 =?us-ascii?Q?e88qrHDBxBvVkbUW9bVXD95mSs82STZq0X2I9clLCkYLAXyamJYKAucPOOJV?=
 =?us-ascii?Q?2vNGkTH69F21fpOlLzHwXex2Stu7M4EfYB5wjnHidp2KMzegx7X/araS8iZf?=
 =?us-ascii?Q?94XEI0Keu8By5nJ38Cm6d4LeVjirJ/t/jNONH5xRn6uTS8ck5oqrYoHyT7pL?=
 =?us-ascii?Q?NtVJbdnTVMvKKsbqDl0fAU5Kl3hO3YKsZjWlzVWLXPrYvHdNrPBBBYoTfG9P?=
 =?us-ascii?Q?7Som1MLmJp6csucsV1iVMLtosuJPKsiB1IAFfU6POR+uLtlqD+DjRUy7KdTy?=
 =?us-ascii?Q?HrZTWvepwh0G+iHfcMR6p0Oa3a4D99nfEVY8cdUEpf0CObWWZYH3zfugMoyA?=
 =?us-ascii?Q?Zt/aNsYATwuQspTC0amHVAodNmIG/PcYJB/pA2qPtH/jtG1pKBphJBV6jfVK?=
 =?us-ascii?Q?/emkhOb64bvo6g0A8xcUjKQlDPyEDqKllrG157EAtd9D0XlSseOl/04Id8TV?=
 =?us-ascii?Q?zNAsp5e7hCF3o2l2gMOE3CgT4pFl7452Adnh420Qnp0vvasXrEZvc4YwQX4f?=
 =?us-ascii?Q?sd9C44C1cy2k+ptEaPKXLKSJrrARg02A6/aFmTDJ9vkF9tBA0WrOnlyulQlE?=
 =?us-ascii?Q?ozueWwHQEL1ceILZBDfubKJAgkO9UtebuVEPN1jxMKMurrGLwmyWqCFPg4lK?=
 =?us-ascii?Q?1MrDAChO8MV67nMCFlc+b0PymlAkBRmimNvFVimmt7oYpeNky4u7kfHeE6IS?=
 =?us-ascii?Q?NnyPkm2orPL2ogmandd82Un9AiIRldZtUNXKN4HEfVZsl7lJl3q0rSr5fwlL?=
 =?us-ascii?Q?7SBJp+TWVkMOg82Qwu43DY2UJZjkjDv8sMWVvxCUIQeua76PykS4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26595dbb-88fc-4fc1-b570-08df02266c33
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 21:26:55.8651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I07OCM0c0fbzEG9KdZ0jtJ1gwLO626G82rlX2jKlUR3W60puhWXyMzNYWghYXa/fFxRWJiwgb7TdHyGcZsxospK1e/hqSHsFECwBg/Kcm4u9qPKX0UNJ9M9rbb49+SQf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10873

On Mon, Aug 24, 2026 at 03:14:47PM +0300, Sakari Ailus wrote:
> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 22 ++++++++-----------
>  1 file changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> index 7e539a0c6c92..5317b01935a3 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> @@ -6,6 +6,7 @@
>  #include <linux/atomic.h>
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> @@ -600,11 +601,9 @@ int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
>  {
>  	struct v4l2_mbus_frame_desc_entry *desc_entry = NULL;
>  	struct device *dev = &csi2->isys->adev->auxdev.dev;
> -	struct v4l2_mbus_frame_desc desc;
>  	struct v4l2_subdev *source;
>  	struct media_pad *pad;
>  	unsigned int i;
> -	int ret;
>
>  	source = media_entity_to_v4l2_subdev(source_entity);
>  	if (!source)
> @@ -614,18 +613,15 @@ int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
>  	if (!pad)
>  		return -EPIPE;
>
> -	ret = v4l2_subdev_call(source, pad, get_frame_desc, pad->index, &desc);
> -	if (ret)
> -		return ret;
> -
> -	if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> -		dev_err(dev, "Unsupported frame descriptor type\n");
> -		return -EINVAL;
> -	}
> +	struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
> +		v4l2_subdev_get_frame_desc(source, pad->index,
> +					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
> +	if (IS_ERR(desc))
> +		return PTR_ERR(desc);
>
> -	for (i = 0; i < desc.num_entries; i++) {
> -		if (source_stream == desc.entry[i].stream) {
> -			desc_entry = &desc.entry[i];
> +	for (i = 0; i < desc->num_entries; i++) {
> +		if (source_stream == desc->entry[i].stream) {
> +			desc_entry = &desc->entry[i];
>  			break;
>  		}
>  	}
> --
> 2.47.3
>
