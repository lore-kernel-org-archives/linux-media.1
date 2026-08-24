Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010038.outbound.protection.outlook.com [52.101.84.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D760391832
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 21:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787606869; cv=fail; b=ZTeDHBpRDZAfryFXgcXcRFx9Q5yAmkp/emCEwDdM5BEi35cJtIlv3pgjyambPB6g5N9r/mxs9/XWrm76EDWfTtgZsmJ3wcC/OuFHHprs7TSWVTc2oCXjp5QWzq+0yTF0EGvzz0SpcnMS1kfPzdYUqvuonztfnDKy9sJVlwcyYgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787606869; c=relaxed/simple;
	bh=y1Z9cTwHW5iQWRCvTAr41CbZKsEmdyx+OoWoFYqYrIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aGhTzK9tY/64BJUdIcsFfjh1EudeCBaAyA+vrRHMzidtvOoNMpq0KEBa87zbkuvz3KCfclsXqE4T6fx6j5h/RSZN2s2T+Cyz2DQza9SwCeqs1jW5tnNDkQjtkZT5umHX9lb6AARa8YrJqhcbT0i1Vk2qU8y/CadcjhMQmeGJgjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cSeWqvyP; arc=fail smtp.client-ip=52.101.84.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cSeWqvyP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cK8eNttpfD0E/GgydHsRu/xd2QBdgOnUxiz9LfRQ7Uh56OUPRVi7/TdjpsjNL3bxbM6M8NA52hiYKKuz4EAM2hQ/yVBhGcL4qoglHV8pQK/FytrYU3UPxGyAtPR16PtK6R9b/pCDX3ML/GWlwZszVMWfGwTR4WcnR1Aal3pHRK5Dsi3subG3OF8gPH47dL13YdAISdw3TPH3W5rhKNpzvrQ4A5HoduRdWGuQqKe9NF4OvCaULIc4FFpZKEqprXj1uSOgMH6ah6tVw3P2o5qni8cN4Ns1U541P/tdJsaBJkIq3e1zlTaBxhp+0heUkgnZyMIEL3KouyUktbv9r12rfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZjMcZeB+HsXxO8/Ww+6EDB5nqNt7+Gk63T6hKLZYhI=;
 b=p9j/Wy/0jy4HmpNdivR4c7dfwAf9RxdzFag1aWlTpAnNe35BuwXJ37aso9CSKUfyO+mUwC6VmIxhqTlmfrXpdQfDUllVcCCJmPnNMpUiQWmw4eaJPQrgRfzGqY1+JGANrGfLrP0vZFwmWKDk2mption956aohQut854/mMyJi6VcZ+ATMoKW7P7bZMulmrtK2rHOKgQjTnTz/ZkqxhNaaUL+WWho4SJ5uA8j/6rYrZWkeFcd3GWqWircblIDx7CNJSaCgjrt/pia8PXbieJQbcQ46vnPAB5I8UgLoCe21GnjQBpDAdEZO/1trNIylUMpHcmH7mDwBaWivAZEUqFlJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZjMcZeB+HsXxO8/Ww+6EDB5nqNt7+Gk63T6hKLZYhI=;
 b=cSeWqvyPipKxzc4JqMYuOCNDgbFyRjVlnkjNuAsxnMRSno86uD4W+4pGBAaXER2Qoxv7nC64mUBFGyzUDVqWntdolch52uVI0i/zpM6ee095a2okTb5+Sd139QgFtAXRfy79nR4dMJQGNcQwBOnfaEJy1uErS1DcNbYif3mTdHSdcc619N6TQnt4vLvIF+Ru1gmJZwhPSKcbJFjNZvTokkextZTPtmre8Zgs79RKlacg7fLm66F6JXoprQfBhoslkC+iuW8uO8cvl3YTe++2cP2AuvP5nhkGk0Zldkh84aQqovpFe76o3ue0FhqW6ijKNxVMYV1nHXEi8iTa5ec1vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10813.eurprd04.prod.outlook.com (2603:10a6:10:586::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 21:27:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 21:27:44 +0000
Date: Mon, 24 Aug 2026 17:27:37 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 26/29] staging: media: ipu7: Use
 v4l2_subdev_get_frame_desc()
Message-ID: <aoy3Sb7tZgqtPgAo@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-27-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-27-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH3PEPF00004099.namprd05.prod.outlook.com
 (2603:10b6:518:1::45) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10813:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f2881b-74d2-4710-92b0-08df02268925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Yiim0BjNqJR16M+/k6vrqccFrYSZd4UtO6iOB6MszSm26LZ7ixtQRpaN5BafcBGiml0Po2hG+jSKwJ0ORr+aZMdcB/n2CIk5JDTILxiP9xGP7fTUDBDG2EVR/W2jmVsmD8UL6Kmyte/gfAJUTPmyRp1uaKJbI/1pBqmauVFlRoay5eRJgOHEkqy7dBGm3oMFhC9xLzYaTkE/ZWLTAbMWttKxdfJ8D6YsYPMJpo/ScVqy7nipYQu9cGWLjA7/X1LhfAhzVUnMrfMnA8gOfa6yOjasby+pDz5QWPeiIRtJJk5cH2F2enalzuOdxpnr6q3ZC47qMFPK4rocrbssWpKUxKJd4WwdrjrbAtcsVcyble5UFnUPXX51q5a7sLy+YS6Y/3pWTb7NUVt1BZJoDmVRmdblAn6S12eQuXcMUcrvbD2sIYcYFE/BF9msP6nS8LUV6qpTx4efUDrOBqvvTB5EfVlb2Ws5UD3ekL+oE2gnPtgrseGleYmqevZyYVO7d/vtlTNgWoFiiYcOdthdofcEUr3EkqvrszDpn48b34VkQilgNqlU06/q4QI7Bxww0BhzcAu1iGDPLs6D9sAC1fG69NDKztKIPcVNKhmyKia1/0GY845VxxL5P4DJiWJJeSisrfnyE3KNjRCdE/8STOEU6dwy8yylNmQS6j/CvuP6Mo0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?riHW7YKgfSVoYNC43JfGoTVTk9tin7iiJFHSmXAZNJhwP/dx/aLWSqPDVeCv?=
 =?us-ascii?Q?rDbmiXAGccNIB/LfWzwYZklB3IM5fmhXESlrDP99YqlwUZSen4FW2RlS26O5?=
 =?us-ascii?Q?7PRNCg3BCW1m6+0uoVW4DY9lRHD+vNkOqhjmR07OyKwEe+iBWXbWsQV0jWZC?=
 =?us-ascii?Q?SNrzf2w2wlIPrYYSF0QNqmuiUuKuCaE8lB2bmKhBrQcThFRzpO8B5jvRgDQG?=
 =?us-ascii?Q?RXdgbLhMso0KspJPrmcxKxlH7BHabTkLJA7skT51PNNZlmKQZZqkOcGpY6KJ?=
 =?us-ascii?Q?sWPkyzt094Q1ld/X3dudeR4ZBVxupUMe0D/KDfi4uxj1EwDkLhkReycMGdcU?=
 =?us-ascii?Q?rNdajFLBmP5MkYiASrSBp/rAIFNW5uzoTn2XhL3cQZBMzlwFlArpaxd4kSvk?=
 =?us-ascii?Q?uVEJDrlSlVB+OSZwp2SHLZwtf2BPz+6uUc20PZr9jjN3o6Es4sesZk97qlHO?=
 =?us-ascii?Q?P+diyy0ezNqNm5OoE6J2IgtPU6Hxz2dTt78krhnvJR+JWgYk+R5TL8NFMEej?=
 =?us-ascii?Q?oM7ZwX1mOVBPBKsvnmbC4l+wL5sU6Nph7Ps2O9Bu46+Y1CHPGUrgRt/TEo+K?=
 =?us-ascii?Q?vwXWyi/jPvh/5MZ9xCjaJ+6z2GIKEsVKtLIfX9svSPmGrAixAJP8zdkanmyn?=
 =?us-ascii?Q?h1vOd3X/i19NHU1lV+Nk+slZikKOuJzaYpZoDEqqBOKPcfiF/xWi8Zh1ndOJ?=
 =?us-ascii?Q?bGOocGnT1UduHuxtyrlf9g5Vh+euNLurdH9a8kV23W/jBKSeoaH3vyomIxeR?=
 =?us-ascii?Q?TpwyiXo9NOrXsEYy5PWgU4L6WDWW6MjSr+LTfjSR4GFGd3ttvgvu1EZMCyd4?=
 =?us-ascii?Q?WBD4u/9/tEMmq56QTPQO9Qncj046S4l8dId1tTHPwakvLmrCTSfmtNYD7Kwa?=
 =?us-ascii?Q?IUHq19yQpJaAj8rTwcbEL8kVeHDWn6wP0a29j8rHYxtVekJdWVVfWXnRJGG5?=
 =?us-ascii?Q?mhWmdI3MTyPkWu0JgfzYHHqcMxWs42WDemmGrryjaCdQgHE8fZOLoMDjTsz+?=
 =?us-ascii?Q?WIKRy6Ek3ZBAFyMN1R9RcBJhSJ9BQzQlsOMyncETlOdUuuP4D4v0Z/zGiLUh?=
 =?us-ascii?Q?LToZVv+hZY/KE9i/+YivH88NwYsR/zea6IH88M6wZ0CQSZbQK8sa8bPrlaFi?=
 =?us-ascii?Q?1YVPExR0c2W4D9rkPpUaEiNA623hog4IXdSJSZQFPNSXA45WA7M9BRCR/HU9?=
 =?us-ascii?Q?/OqsKCNQIJS5p+b6zd/YHkTDn10SS198ky36ABJJ4wvCXlZgOHnMUxjzdGFR?=
 =?us-ascii?Q?mWhVH+CAup3wXmUGKJiB3mdKxopDvo6j5M1JM4Iu8i96iL89lzsFhYhH4wyS?=
 =?us-ascii?Q?pigOYE1M7plON+oVW/rtreQWHyLkTzPAf2qfPPumagFfEMRf4K3rNXnA/Zu3?=
 =?us-ascii?Q?R4POOuOxIt5a7aomh+ldk/J2gmp4kaIGakiqrYdE5hfg1/lS9cHxvWz3qWvx?=
 =?us-ascii?Q?Bj5hK4GueFmWvUZ+uugNUmkeuf2wDr8qAorUy3z1IhCwG28yYhcbokTt5Wi/?=
 =?us-ascii?Q?8EBcaZwGyYyQPMIqB81+UEDz7Mi0qON2S8Hsg6Fvjz89LZDl0s4X02yqXkQs?=
 =?us-ascii?Q?a5Echi9zQ+gY+/6n4QlLMk4tG+Z0HjxmoYciD+IjSbMJw/qUYB8A0rKIpLgo?=
 =?us-ascii?Q?yTsZkF3XIyc1/WgBh8qoIprPqHkwHUs+Q9BlAGHVgvsmWiS9yRGeLSEb3UR5?=
 =?us-ascii?Q?UWPqHvrHDXMjg2vGKy6+vr98rOYqJb/qa2UALUrntv1r3jT4vwKitW9Pm879?=
 =?us-ascii?Q?0kJZ2YFNokyYCTKHJsGurAIbqROewFBU0co5uAP60QVXRApHoJzy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f2881b-74d2-4710-92b0-08df02268925
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 21:27:44.4308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzEWOO9GtQGPNp31fsK7BJncJbGloeoepWmkBNTM/9D8xn7WF/V+VGn7taQKNImQ7eZgDTV3l7H4Is7S7vAk5TbEmf+NHo+fq0DDU7YYSmx7470ai7T5j0bJDqpDYFa9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10813

On Mon, Aug 24, 2026 at 03:14:48PM +0300, Sakari Ailus wrote:
> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../staging/media/ipu7/ipu7-isys-csi-phy.c    | 19 ++++++--------
>  drivers/staging/media/ipu7/ipu7-isys-csi2.c   | 26 ++++++++-----------
>  2 files changed, 19 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> index 3f15af3b4c79..70f8a55e3bce 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> +++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> @@ -5,6 +5,7 @@
>
>  #include <linux/bitmap.h>
>  #include <linux/bug.h>
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/iopoll.h>
> @@ -300,7 +301,6 @@ static int ipu7_isys_csi_ctrl_dids_config(struct ipu7_isys_csi2 *csi2, u32 id)
>  {
>  	struct v4l2_mbus_frame_desc_entry *desc_entry = NULL;
>  	struct device *dev = &csi2->isys->adev->auxdev.dev;
> -	struct v4l2_mbus_frame_desc desc;
>  	struct v4l2_subdev *ext_sd;
>  	struct media_pad *pad;
>  	unsigned int i;
> @@ -318,17 +318,14 @@ static int ipu7_isys_csi_ctrl_dids_config(struct ipu7_isys_csi2 *csi2, u32 id)
>  		 pad->entity->name))
>  		return -ENODEV;
>
> -	ret = v4l2_subdev_call(ext_sd, pad, get_frame_desc, pad->index, &desc);
> -	if (ret)
> -		return ret;
> -
> -	if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> -		dev_warn(dev, "Unsupported frame descriptor type\n");
> -		return -EINVAL;
> -	}
> +	struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
> +		v4l2_subdev_get_frame_desc(ext_sd, pad->index,
> +					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
> +	if (IS_ERR(desc))
> +		return PTR_ERR(desc);
>
> -	for (i = 0; i < desc.num_entries; i++) {
> -		desc_entry = &desc.entry[i];
> +	for (i = 0; i < desc->num_entries; i++) {
> +		desc_entry = &desc->entry[i];
>  		if (desc_entry->bus.csi2.vc < IPU7_NR_OF_CSI2_VC) {
>  			ret = __dids_config(csi2, id, desc_entry->bus.csi2.vc,
>  					    desc_entry->bus.csi2.dt);
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.c b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
> index f34eabfe8a98..08f4ca1e0289 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-csi2.c
> +++ b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
> @@ -6,6 +6,7 @@
>  #include <linux/atomic.h>
>  #include <linux/bits.h>
>  #include <linux/bug.h>
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> @@ -491,11 +492,9 @@ int ipu7_isys_csi2_get_remote_desc(u32 source_stream,
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
> @@ -505,18 +504,15 @@ int ipu7_isys_csi2_get_remote_desc(u32 source_stream,
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
> @@ -534,8 +530,8 @@ int ipu7_isys_csi2_get_remote_desc(u32 source_stream,
>
>  	*entry = *desc_entry;
>
> -	for (i = 0; i < desc.num_entries; i++) {
> -		if (desc_entry->bus.csi2.vc == desc.entry[i].bus.csi2.vc)
> +	for (i = 0; i < desc->num_entries; i++) {
> +		if (desc_entry->bus.csi2.vc == desc->entry[i].bus.csi2.vc)
>  			(*nr_queues)++;
>  	}
>
> --
> 2.47.3
>
