Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D38146D2A0;
	Tue, 21 Jul 2026 16:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651151; cv=fail; b=hkKuMPQI0fiwtnxNUvw9n/blprC67IbK5UZ2wOipqVGls7uwxarSXKTflNufX1G2pVpcZU+ioGa8da7MB8lbI5gLAy1nX5J1IgM68he6h4bsrm35xhjA8KudnwoWc8F2099KPjG8qq7eQ5GbjVOpqmxAZ72V4pFCxV5Pto1Nut8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651151; c=relaxed/simple;
	bh=E9aWrYCpLSiDGTDes1ypZe44Qs7OSnwttqDrv+MjTR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=atwigByoCE5Kugr2qceWrEG35LVilMIVdt0tXEn+9nZd9hKgKJMoZovISCtpiFsYkNMbG3tkG0MN14XKUIQddi1uO6g6YgOe/ElCY1vQgd7WraLo5vyRo164H9ETnWAOYPQM5WtiLJCBYtcYvMCHFk6n5R29wUJxMNw7oHP0fzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iqKros4M; arc=fail smtp.client-ip=52.101.65.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iqKros4M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cxd7YyDgQfzGvzDH4mS5p3WyMXpHJWVcedFcmkGbisk15+eQ0DgZg7HEcsZZ6idqnImWBtuwwd8YCtbDq4kKJBp5NbaYzMowtW1JaJDPkJ4Tj5GDlw1Fdo1jYsQDZ70I/9Rs38tPaFUFbJHPI/8pZsfGeMwMCtlFPByGq8262vBdegIhXAz5EISJh3g/GNp+kVbErU+lu+Yl9HHvASn4ZXQyRCJBr+ZgSccBiJwYChSBV+Q1sTEhkXY30mGekwiZHfLngJyU7xjJFdlaO28NtcepJzUm0gLCpmbn0IFaqY3GLPdJFSrf8VsObTUhpOTQbpl1SgFCRaOc8EbYnDfgxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=238xwrj+3rUXbbiE1ez/Q0tBT8TeKECIePBXVGCLnXk=;
 b=mD6ezyMVvXCbVqjtI/jkbVFmVrUZuAvWscVKu45zxlR8taCmObSadBvjh8CINlEYDDYJpKKNQ5+MVMljHoyrLhLRmWEaUKMheBxDz6ySnlLg+29vXJ7VQBDJ8HYUIONn8lmOQbwsFTecKPosZJZZv9NyqsA2XgWnvKV3V/+9U+e1lttJCoqhn4AJ9mL4WKy2d7Zx3SUAWFJb9qqM/+816lta5j/kk8B5l7LEIno4NvV3XzNk6y1NbCZGkDUfo4kvq6I8zUeW4ft9BDmioaIKFYHkXcdAfRORf5J1gjvpt0d9otyxo8EhrUxU0A+l4+MmCDKMSODenAwnQXaVyYqYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=238xwrj+3rUXbbiE1ez/Q0tBT8TeKECIePBXVGCLnXk=;
 b=iqKros4MPAktfRGilLO4nNrztLtEOlAfuLUNOEW0IFMIxf2PLbQ6R6VehF7Sjj361HvJzfZveOhbV2Aq6Uo1LNgP0v+SCBSMjR8CKUNZr0uRhwbRSyzK4+ZVKqgHoK3BF+M7/k3Gt3/fEMpq2JNfsuBYAvuY1x4j5vWfPPYk1gM9L5qEc9tNkduQaJoPi1198O1ZxUvgOMiT7g7CMgItOKJ6W3hjcACzJm/E9rNyiuTPwo8Y/NG3fH+FPe5ewhTWPqlHP4RmYDHcalD/wwG7oxaclZLUTAFLD6VHwLlbDinj5VN7jt1a4ZameIt+jxaC1WxwKp/E2LVumsXFYkfh5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8889.eurprd04.prod.outlook.com (2603:10a6:20b:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 16:25:47 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 16:25:47 +0000
Date: Tue, 21 Jul 2026 12:25:39 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] media: qcom: camss: Drop top_ahb/ahb/axi from
 QCM2290 subdevice clocks
Message-ID: <al-dg97g9wfkDFLM@lizhi-Precision-Tower-5810>
References: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
 <20260721-camss-version-v2-3-b2440d99085a@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-camss-version-v2-3-b2440d99085a@oss.qualcomm.com>
X-ClientProxiedBy: PH7P221CA0073.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: f29c7699-2250-4cea-5f49-08dee744b836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	V3rZxBs2PvUNZvKdkyf+KpOd73IuJ17NqkBskf530T3VlsdaAA3EubzVhby/nGFtWQFNTcGFzU4P99pgy3hGVYEh/cfzcNig+0u1KjILh6i48g1n+achznGsOfs/oBZOBJIASyktCAR1EPaIuXaJwK/J/cskyHppQVWYFNyWU7330q3ZC8h6lb60ypyNbCLV0joeuvST2tWMNz9eWjWh+1wxeinXzWOsPZC8FnExcHqFSHDM1YsLhgA8Y9zHpDG7I7FSILsEk89NbB0HNLxC0g/5MQgwxEpbJyNzpyHWMTFSJC3Zm4UMlo09rJP+Ozp5RuIzADPiWk857CrP+iIc3b/2PDVB9Shttgf+nkngohbGoWp3cjwv9nIFu7wogiU3JrRa7qYrGb+gawB0IZleVzbPji5kDi+Qksg9LHSEHZ7fA741QYHwUx2Nq1OD+DCDO8qde2S6um12BdjrXCMf23r8IUyci/2TiuXu3j+Fr5AS6EmRUolp1/Og3mzGlgEWYGvH0gI8A/u+WjJT5SYCxEydtI25VWmHCJJGZNRxv/Fv03Ys1pk35xvhWnOOx5xv58xEv9KnEsSIJsSHcmNMMrXuS6gyGTh5bMA37NMITOosElSpnrzOycLQfY+y8WJYKQpgBzXqRGslcqbSNQ/bCzp33aY+Gcnr1EkUGFUlaxY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4zvxae0ZAyB1GP9kmMOOcn8kuWKuV6C4l9MIbettZDcAR8gpNJrgmcImRG+9?=
 =?us-ascii?Q?k68un4UNBLar5qIj49cpGBwW8BxRCL5n4wLuHiomZogt7pGn2tmNQDcu7A40?=
 =?us-ascii?Q?kONwr9v2jx6SC5NJDMCSsVgUm4a6EtNYkX1+Eg0HTGwmnjZ9BW/UgrI8pcF+?=
 =?us-ascii?Q?01jpJeeTrjpO1af5JonG1zTjC1Orw8j4Lmn3YbLG1ysHYA6EZnP+1VkHtvMr?=
 =?us-ascii?Q?HqEjpdwqTw8oPAsc5vD0qKvcjd6uSus5x0J0ASL/4SR+KOABEXZ7D1XgzHvX?=
 =?us-ascii?Q?oCRZU6vSSJgIWG+ogo0zixbF+ZO2eR7n+lbyP7XJ8jRDLOgXySQKg6LGU+qD?=
 =?us-ascii?Q?STcMfhF3bQ08eRaa8FlXZ0OpW5jn4Pu9lWr/qoPPrRXQncRAMuL6nunpAkor?=
 =?us-ascii?Q?nXvMAITb0HXbt50yJAY2GSrUwxWa14VATwy/quLvIKrwQyv22xZhgCB2D0+m?=
 =?us-ascii?Q?BUKM6DxN6Sh1/M2Jqgm/wHaXZqXl3bgix6oi4vlyChYS+nWyGwVEwkBTh75Z?=
 =?us-ascii?Q?QlQq2oSR9bRCAXPnc2UBtC29Km+OfeMu3JKabELFDv8QMNpX/ZWSeanW+eXO?=
 =?us-ascii?Q?juj9GzieMKzBubO/h1BeTePUl7E8/O8BvdSQjk05c+rSWVR23jHHKb6dtAhM?=
 =?us-ascii?Q?6So5LHSjNDJYyqSf4bpR0ZGCnFBwfDu/VTgIFxEGD8t5mssBLeARBn584pX1?=
 =?us-ascii?Q?rk3CTaZpMvpgtdxpRx/UAeS4NsRgUBIj2t7dKJp5HrwVMBlF5Q8XZ4SbS92J?=
 =?us-ascii?Q?23GEmXJ3pchCEXCiEfqkpJKTLHeOH3Ze1ob816YlFnu+yEV6JG8wsm7zoM20?=
 =?us-ascii?Q?9zl+hzr+B8F4tPLdJje6AKg75xte5Hr1X0Sq0wcBhgnf4Z5SGJhK9xKbNDA6?=
 =?us-ascii?Q?iMgboqZuDDMibMqBnIPqnhAW5zK5ZrFRrcjbfcHjB1G+kwvL/xNUAvrAvaIq?=
 =?us-ascii?Q?Bol6pxUpgPYRz6fB4rOzyzmUO5qY3A5K2pAP/wFZFmPcPd/uTz4JQhXgh93h?=
 =?us-ascii?Q?Qnc7X3nq3MKQ2asXVREZq43NE/rIhB/sAie9ebvB6GTCjlLBt8I07WMVCpZn?=
 =?us-ascii?Q?JXDpcbiRoTV4OovXdW+sL9SdE0o0zL6aJx+bsb8MsFz+dB5/CNgXF+Djwmpo?=
 =?us-ascii?Q?NugCha7KhZc330i3f+b+BUmYpl3G1Sl4IUZu1dhvUpGUHLPFoubqxj/GPO5I?=
 =?us-ascii?Q?BRudvIhI9TkQrfR1pbnOsxQ6AW8QoZAX0DZwQq+w1r/H7W5oZBZO4PG7jLwo?=
 =?us-ascii?Q?nILgJAO8CDYUOjzEjhrIpxuXRcav2zfvkJWCQGvPc1v4mEfg9Lzv2y2I+/J5?=
 =?us-ascii?Q?SSivdR73/H9cKFMEhxxLJlCN1f3WE8pvGfmJkj9mve4BzVOjPzYTy4uayQVA?=
 =?us-ascii?Q?iEl9kCjR38/938BO1KNlovm3GfVZhkKNvb3uXrp8bJy33zOxF5KM9ZtNVLTL?=
 =?us-ascii?Q?WAMyO4SV+rWsjG7JpSKfSDGxFdn57DwqTRfTnFFstv8TYjbWDYvYx/Zs4+9u?=
 =?us-ascii?Q?DdtsRI+6rkZTC3iK6wpfDMKr69kk5P5BrzieeOvryQgRMHIrRcAkOJKchoIa?=
 =?us-ascii?Q?7FiD9dYf1FxmCgzUM1aCWCx5oJ1sDW0GPax3fXFBNDOzijCfS6vz0zEiDNq2?=
 =?us-ascii?Q?xawCMqcSlJRKlfhHkYwmDYlVmgRnq7Qq9xavGG5tuOJruh0DB0KpGEU1klVf?=
 =?us-ascii?Q?btD/7oT4SB+JW5uD2XZkCLkMtip4fMdjUVqk2agbK1iJUzRM6WT0oWgG7IZC?=
 =?us-ascii?Q?4lPyikAuP3+PJAwFHd6hZwvzfm/NN3Vsxj4inTm3kbbd+fKkVt/K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29c7699-2250-4cea-5f49-08dee744b836
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 16:25:46.9325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8hRoseW9FpOp5xyFYsJYyrjJ88zxyKHTU+QZrPxciVLHWFQ2Wad7bVa7HMToj3vZmm3iMt/DGLn31qZK4018BKbEmpgoh2U9/PbyyQFBmeJtIGT3DRR8IfLUyi3d4pJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8889

On Tue, Jul 21, 2026 at 03:21:10PM +0200, Loic Poulain wrote:
> Remove the top_ahb, ahb and axi clocks from QCM2290 subdevice clock
> lists. These clocks are now handled centrally as global CAMSS PM clocks
> and are automatically enabled when CAMSS is runtime resumed.
>
> This avoids redundant clock references in individual subdevices and
> ensures consistent clock management across the CAMSS pipeline.
>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 38 ++++++++++---------------------
>  1 file changed, 12 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index a87161f3d5524a6e40a7281e28787538613dd9cd..1f691b8940a9b3d8a9c03cb3159ed711d0d18e77 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -688,10 +688,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
>  			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
>  			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
>  		},
> -		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
> -		.clock_rate = { { 0 },
> -				{ 0 },
> -				{ 240000000, 341330000, 384000000 },
> +		.clock = { "csiphy0", "csiphy0_timer" },
> +		.clock_rate = { { 240000000, 341330000, 384000000 },
>  				{ 100000000, 200000000, 268800000 }  },

If can't eliminate these list, looks like not big benefit by pm-clk.
Anyways, it also works.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  		.reg = { "csiphy0" },
>  		.interrupt = { "csiphy0" },
> @@ -708,10 +706,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
>  			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
>  			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
>  		},
> -		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
> -		.clock_rate = { { 0 },
> -				{ 0 },
> -				{ 240000000, 341330000, 384000000 },
> +		.clock = { "csiphy1", "csiphy1_timer" },
> +		.clock_rate = { { 240000000, 341330000, 384000000 },
>  				{ 100000000, 200000000, 268800000 }  },
>  		.reg = { "csiphy1" },
>  		.interrupt = { "csiphy1" },
> @@ -727,10 +723,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
>  	/* CSID0 */
>  	{
>  		.regulators = {},
> -		.clock = { "top_ahb", "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
> -		.clock_rate = { { 0 },
> -				{ 0 },
> -				{ 192000000, 240000000, 384000000, 426400000 },
> +		.clock = { "csi0", "vfe0_cphy_rx", "vfe0" },
> +		.clock_rate = { { 192000000, 240000000, 384000000, 426400000 },
>  				{ 0 },
>  				{ 0 } },
>  		.reg = { "csid0" },
> @@ -745,10 +739,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
>  	/* CSID1 */
>  	{
>  		.regulators = {},
> -		.clock = { "top_ahb", "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
> -		.clock_rate = { { 0 },
> -				{ 0 },
> -				{ 192000000, 240000000, 384000000, 426400000 },
> +		.clock = { "csi1", "vfe1_cphy_rx", "vfe1" },
> +		.clock_rate = { { 192000000, 240000000, 384000000, 426400000 },
>  				{ 0 },
>  				{ 0 } },
>  		.reg = { "csid1" },
> @@ -765,11 +757,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
>  	/* VFE0 */
>  	{
>  		.regulators = {},
> -		.clock = { "top_ahb", "ahb", "axi", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
> -		.clock_rate = { { 0 },
> -				{ 0 },
> -				{ 0 },
> -				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
> +		.clock = { "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
> +		.clock_rate = { { 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
>  				{ 0 },
>  				{ 0 }, },
>  		.reg = { "vfe0" },
> @@ -785,11 +774,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
>  	/* VFE1 */
>  	{
>  		.regulators = {},
> -		.clock = { "top_ahb", "ahb", "axi", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
> -		.clock_rate = { { 0 },
> -				{ 0 },
> -				{ 0 },
> -				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
> +		.clock = { "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
> +		.clock_rate = { { 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
>  				{ 0 },
>  				{ 0 }, },
>  		.reg = { "vfe1" },
>
> --
> 2.34.1
>
