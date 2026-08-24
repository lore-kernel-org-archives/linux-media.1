Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011034.outbound.protection.outlook.com [40.107.130.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C028F246781
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 21:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787605678; cv=fail; b=lXgLY1ZM64pPjqyhzqjP3vhQGUlfJkhvdi9T7RavdLzpvJHvq9ZnfoQndEqXSnM2csWQcQAHbNPvcYhEKApEN5OLSOgP/ziTNgl5w972Sz6fVFoHC9wR3ZpgdSOdiS3rwpGer/Yz7xgEUTSm4Fr7xuznpNFjrDDJOq9B0n1tsIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787605678; c=relaxed/simple;
	bh=VWQgdfw9753dST+o/l1WBYHNwcFEKZXzYYp9KuPQ+bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k1ftgybqStvi6nUn0wYudB5jiarHBHxWJSPdUwC63qAZXZyK3VAmboEN08qSibl/z2fpPWQov4X8W6p90W19UQwBOYWxXyo88vMD5Y6irq4rHAvhs3mkXN30rBvVxtPXYyZimnIpoODpIzIIp86m7FHhWCJSBlDFXjzHbyvU9hY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=H5mgo6+O; arc=fail smtp.client-ip=40.107.130.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="H5mgo6+O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jg25mWkE/+aRlV/+uv3nbDREC5ouyWl4zMk2acYF7NrI0nsPCct3LuvnBox7Vz9Nml4J1TVoxnJcx4r4p0wUUw6UzxQE0m+jZONQKZ7pEwJ5MI8Kjs0i7u637E2fFCBhUEKXzN6KufkLADZ/fXQRKqUmQ/OJW/O/eXopYkDV1PKOvwxivJAh80flhnnYQv/bKClRHGNKHXm+xtzlFM4wCvokQ6Zs6a4vDwBSjDwDmPplHMo+TftZ4ntXEoAuKDLl6S370uBU38lpuInUJBCZKvi2GdRMRYwBZyrKilM/gk0bqqU7+Z27+YOiltbbgPx0wXQUWt51SpSikaxZbBwIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqeKeM64QL7VRlbxwH65GpyQc3VXoRjfC2dCehRRoCY=;
 b=ulVBW9Bk6SKQR6V8gDgQ7t8wTHEYVpjQ/I6DMGJYcDg/8egG7Fsv5i7D5ZM/UluYlLy55TxRjoMvGcYAzWyQzQaySBTOqvlygqL62LhhRs+brR7cRtsu/Y8wLCdmRXoO3AD45PuCduYNIAqUjO0urFIvT3oKLcD1lvwWGhwwzwGs47cAM/wFz6rPikuLVTroM//QYRvpx542TwH+4ltowP4S6v9Jgia9gDxuJjTmwPcUFNphzf0HJg2MtYHFNmPWZGNcx6YV5wh6XC5EFFIlMwhQd81WLiTnPuhCXCCZ6GKr99tHm0+lfb0KfBhBIa8psoOy/n92JpqRjthVe+Rm3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqeKeM64QL7VRlbxwH65GpyQc3VXoRjfC2dCehRRoCY=;
 b=H5mgo6+OoCDmPQg2+zId8M8fYrbYb+SNRFnjrqKh48UINZLoOHPh76rsA9GqDOFdCOxYI/ggyeDMKjPapyZWdRXcvG+7jSlxCHpsI0djuSCkVKEdirJldZ4JB8upb+oCfvE9powj1D+7eBQ1IXBrmZu1HxezEVKHQK6OrTdBGGZeuibDhQGoWQGj/oXmRzCYl0S35LOR1JSJWCAomwoAc9w4GzT0CzNNfdvbkT/ekWhBha3h7+C8MKD6Syrw7URycJMSAvYjTGUxDzWXMcLJtOaSNvDg/O86pnnFpWA94WjaeZmQY/NRClHwtMlhgPd6cVOpFwXVV/Mobd9mq6tLQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8962.eurprd04.prod.outlook.com (2603:10a6:20b:42d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 21:07:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 21:07:53 +0000
Date: Mon, 24 Aug 2026 17:07:46 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 17/29] media: bcm2835-unicam: Use
 v4l2_subdev_get_frame_desc()
Message-ID: <aoyyogifML-mDfYJ@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-18-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-18-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SA1PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: f21fce1c-8846-46ee-2151-08df0223c2da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|366016|1800799024|10067099003|11063799006|4143699003|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Sg1RsYTkKqEuqr+hVnvZCMfiFtFTTaz6NgoQwh/BCLWes8aDXLIrt6CdvpA6YI4DCzQXVxRYnAJaALItyCYnsqJN+UZY3Kan2F1iZwBm0elmwkyzqAmoL+kRJZivAZuMY3FRvQUNigDgSD7DG+r3KCYla9XntFG8O9jDv13m7zaIWMjcVMbTfjc4RJgCBCfIjDh8UUTB3F28kgKbiD4If867URdYvBe6Lkhh/qNMBgF/SYesleEwRGyWkWP6Y+uIPLLGU/I2AZfLGDYpCFbOvHpros77Dthp5c9gxxApzn6+91Lxz6VrBJMTvjFayB+8N2hUeBsOZYMP5Z+XaAIWIyd2LNnMynzNjNFQbO9oDG1nZtZK+jv+z8Y42Mbm4FFnFeZrZ2nSilexJfiqAGzykHV9zjtdf2gOKJy1MEDrwDQoYuEEAIEAmmKh9L6D4SdY5HbpSdewdn5em3Go4w9FmR5FpcAz/ncvEwriPqEUUkcVlxdcBfccGZyfGdlwRJZzWT13NTvlYKS4AaXlM9tLIyNep0L2qSy2eEK3/T25VhorW4KPY0maGqoJRHXmOOUv9zEyGd9tN/SgvKCEKnws1FMMcpQrV6zdVu3Xn8mWQHE5p2alhwV9bO3RCgYEDjU/mWELrp8npaxOdyPWljw+jG7ql/9xQdqq1obu6lShkTE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZQEEqPmDkiIppOw6diJzEqmG8PhAIe/0ShWOidW5BBLukoZ8V1i4XG/h/zbg?=
 =?us-ascii?Q?+prO6CwmTF9k0/rgaFIKfrqEBEFz1ndM0Ul9uPLwhrGO3LfAvcDsrhtear35?=
 =?us-ascii?Q?pmtfXzgIxZvWC8bf8HRz3HVfPSe2Hv97Uhi1eeT6qh3aUYIuRHbD88knJOu3?=
 =?us-ascii?Q?lUWun2PdjOLvbp5Tun8BrB5m+pZRHerH3t8jkoshzOz1wAQp+B3Urliit4RT?=
 =?us-ascii?Q?YrxhRpft4XOaue8RxIrQQ0YjG5ohhbHfuGMCSTRKU3/3ySkvkV3x5QxqfMNX?=
 =?us-ascii?Q?hAOxDfTrCKyzbyetWmJvRTGBIM4/hpQf0lV9aYMmp+ND6L9zVAoLLSuhJkeu?=
 =?us-ascii?Q?5pFW3iQzhPfaENxCbJp9i1Pdfz3ZTj6EpeuQyUCRpNlxDu7smx4a1Jw7Siq/?=
 =?us-ascii?Q?NPqtetLqPPOQVhYXQcAbbXnTFDKoaM+caNwIIwpWG4u7tXGE3EDM9znWpnXV?=
 =?us-ascii?Q?q4VI+HNv3r9Lai6T9kKoTlGAv71b8vALgqqns7MVfMyJr3MENiO7Ovs4Pcsc?=
 =?us-ascii?Q?lzlHPNEnkhll3mxKGLAPDgFdUfINgQ9Ul8yTwJqeffd9pSr4pNTi0/zF74M7?=
 =?us-ascii?Q?kYmpOgGi4umdkX7BYkY4bVOfpPeqnf2nwefq2JS9PnpL0NNhF6WYJ0eleer8?=
 =?us-ascii?Q?+s0eY0n+y/9MAwZd70wdxEXZw4DzpJ8JO1xYNkW+0QfSyckGIgM8paegbP+S?=
 =?us-ascii?Q?M9wlolF7YIQuMHp7wXGV/tjD6HRIH738RD3uJMEAFlbFfY0PjrMmv22CUyqY?=
 =?us-ascii?Q?MswbJQ4Xum3gYPVwWT2uBW9ifwv6zBWmFsvr+avddvXghSe4MsPKme7EwKpj?=
 =?us-ascii?Q?CHxgxA9r7I48c38Pv1Sjn2KYiCQAuwF5Uke0C6dKABS474E9qZMJOhrI5msI?=
 =?us-ascii?Q?7gbngpB/VzVYWPcmo22e9iKU25ot0R4vyO59PDHil404EJHjkTl82Hm4vLnr?=
 =?us-ascii?Q?epRzNCAvelDq+223VomULZEXppK9O0VGzzPDm5/k0s3qXwvhdkAwClCUSDJ7?=
 =?us-ascii?Q?xPbLzEFtAdfjUWWa9KIjzAr5baNBDUahR0IjrannARPb+rYYgqe/jTWxFTnG?=
 =?us-ascii?Q?Y81od/lwUMh2niYWw1E8EKnSjzuQ+PTEBlvtTA+BoG4KG+VayKvdI336wdQI?=
 =?us-ascii?Q?IYZyiDQJo9rokzSHfPLP3X6MXgtt0gfNSJRCtbqFvSbTdIYW8W6dctj/3cIo?=
 =?us-ascii?Q?/90AX/jGM/XaKsRLsD7q7ct3K+VZb47zRlilDTqeBLe2a5d4hE0sZq9bXYjn?=
 =?us-ascii?Q?OfRFCmyVfnNjTuZVyVJ3eMSLV9QViYZ3g/0DXs8FKZG/T9YHUKShYsPJYGar?=
 =?us-ascii?Q?RmvyX0Zj4EJXbyefQtwmkeFp8mtkR87CFXnxYHq93eS9T02s6ZNOWhTjFrxZ?=
 =?us-ascii?Q?xQLSim1UhNQSF6cCMygnZxyBPTSkavfgdBvFAhq6dKZv4sw2Qqdbp+1r/OtI?=
 =?us-ascii?Q?a+xI9EMqOUst5IdWpa0octyHxwcYdBp49CBCzQTD+KXujI7T6bFmB+3qFCNL?=
 =?us-ascii?Q?Xn8K05prkUBl7oSHRZs/2/Q0/TKWjVG7F8n4m4bxiEoaVPPQB9zWFzTmu8Rx?=
 =?us-ascii?Q?p/WNBseNErCCYYyfqR4ley2icrz1W8w1J240YuM2YJakN8qxBSLidAU/1kQ2?=
 =?us-ascii?Q?bERrMP2xiWNzSMoC9P3Z4iqiKQ8Xrqu3thhQqFhebD+CsvyQxOWfrukKE7ia?=
 =?us-ascii?Q?WIXxv9zYfb07yycUoVwC8MrdW6tajGdsL7V4IyDrfG6r/t6vU0SLg2SjAHJs?=
 =?us-ascii?Q?m1xmXSNwE3eUdAw4vnm21uEUDFUDjep0fFuuMwsGPKFsHDLPEM8w?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21fce1c-8846-46ee-2151-08df0223c2da
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 21:07:52.9351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OkSGDNkEWF5mDR/V2xlDP00S34AEE+qaVKAvTLFdwa0TZppIrCgI5qWNX3n/DOX6I3lUOHMHRLoSAAfr39JDLvbCF153WkFiPLKcGTTZhmIs4fkL1uCWwFE/6Yj3BXdj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8962

On Mon, Aug 24, 2026 at 03:14:39PM +0300, Sakari Ailus wrote:
> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/platform/broadcom/bcm2835-unicam.c  | 22 +++++++++----------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 14bb916dd7b1..2322d3df3915 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -27,6 +27,7 @@
>   * output interface and V4L2 subdevice driver.
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> @@ -888,7 +889,6 @@ static int unicam_get_image_vc_dt(struct unicam_device *unicam,
>  				  struct v4l2_subdev_state *state,
>  				  u8 *vc, u8 *dt)
>  {
> -	struct v4l2_mbus_frame_desc fd;
>  	u32 stream;
>  	int ret;
>
> @@ -898,17 +898,15 @@ static int unicam_get_image_vc_dt(struct unicam_device *unicam,
>  	if (ret)
>  		return ret;
>
> -	ret = v4l2_subdev_call(unicam->sensor.subdev, pad, get_frame_desc,
> -			       unicam->sensor.pad->index, &fd);
> -	if (ret)
> -		return ret;
> -
> -	/* Only CSI-2 supports DTs. */
> -	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> -		return -EINVAL;
> +	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
> +		v4l2_subdev_get_frame_desc(unicam->sensor.subdev,
> +					   unicam->sensor.pad->index,
> +					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
> +	if (IS_ERR(fd))
> +		return PTR_ERR(fd);
>
> -	for (unsigned int i = 0; i < fd.num_entries; ++i) {
> -		const struct v4l2_mbus_frame_desc_entry *fde = &fd.entry[i];
> +	for (unsigned int i = 0; i < fd->num_entries; ++i) {
> +		const struct v4l2_mbus_frame_desc_entry *fde = &fd->entry[i];
>
>  		if (fde->stream == stream) {
>  			*vc = fde->bus.csi2.vc;
> @@ -927,7 +925,7 @@ static void unicam_start_rx(struct unicam_device *unicam,
>  	const struct unicam_format_info *fmtinfo;
>  	const struct v4l2_mbus_framefmt *fmt;
>  	unsigned int line_int_freq;
> -	u8 vc, dt;
> +	u8 vc = 0, dt = 0;

not sure why need here,

if unicam_get_image_vc_dt() return failure, vc will be set to 0
if unicam_get_image_vc_dt() return success, vc will be expected value.

Frank

>  	u32 val;
>  	int ret;
>
> --
> 2.47.3
>
