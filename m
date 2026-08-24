Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79B8377EBA
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 20:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787604218; cv=fail; b=nd8ntuT5gDGihIy1147msl6PTGi3M778vDLWXEFweTQVcJJFp/q4pmza2oyi9QDwUT5MCdgY0uXFdBTNbLLiDqbDI1pm0Iel93BLbM5ONhvn/gJmvUJ7basrXdfXzLkMQOY2PVgZUJ2B4BKPO29l2YzhI394m/n7WQnfh90pUT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787604218; c=relaxed/simple;
	bh=mwHjWJluH7P0mlEm9uvIFchC7A/+jIX8bEQV1nlDLgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VAD4+xNeSjNqx+ocUU9OgI1ZdWn4Yx52hMi5tHIL6LNOfPcUEEQCz/S2VvfidzeT73p55LnzObLR2Cv01rWsmpk6Q7wfhLgxe4LmvAul6LrF24UKvotnheluIh8if6xHqUYJkk3rKDIH3CaGPhYTN9b99pMX1e9fx1Goh7dozow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VwgbiOAK; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VwgbiOAK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWxLA9auoibUQoTfw97G3obx2rHWjJoszjani9d4eoSRx04oIfM0aJ3kARpFiKgijdNayOtF14aIQUha5iqYSC536CeBPtOL3rn3sCHI5AUDaaEFn64ayKyhV6wo2xVGJDKOvGeGAeAF7TUo7FHMMsxoH/BnjI9nlActwPEaSISajSKBrKjCKc5cfWpXyMYhBRjK0cg5pTsCqVPqPevZE6Y51EIfIjuWgGabXYn3IV6ohSqHol+1ChlCmQncT/W3+SMhLSeoC9YPdMMlW/teBqDn/U+Ad008jEo+au2P7W2Zi7rOw6uxFU5ucgs1RYFpbJkDr7QvfaZnXfjW1Oym1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GENV/S/dsZ6UmHP2skRXzrLpVHKqIcomUbG2RZ+7uf8=;
 b=C9oUrsNf/awXhjMAMxLpfml7WzXQDf7SmnLHeo3YhT59+3y+jmougJhWgi7v7mTdaX/y4cpJBRq+hkjJ4dOZMlev5ttGtpCQltUFnt3UDypbW7TQVpAHpzHz4yiBCtyXkTpgx4mK8WpZPKmionbmmlFrbr1T3nyoJo1bO5D+yWCifp2Y0SFxM2iuAZEfoSiy5UX7kk/kbtF3YmXEO0a6ZiXpGhQ5XxlowiVmOayE0FZaqpblZgFN+uG0IbFdcSg8w6jdYiLTB4GpBBlgBnP50ySDJuk1d8deci7nWDDMzZp37ZWvuEMeCY9t3FrmDcpoQsjAOyTWegneP9+fz905fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GENV/S/dsZ6UmHP2skRXzrLpVHKqIcomUbG2RZ+7uf8=;
 b=VwgbiOAKl/arE1DEF2/+LmF1ZaYz2i/5f4TkeLjUoxDF22yjN0H3Zly1od6g4H/pJRfnBznc0pLFlo136KKRKJp4mBxV+ihy5W2h4B0j5QVxSn+O0XEW+BEtfvkY6oeC1XD2NhZHf7N7isv2c7opWAybHk6uwUzA7dfkjRQgZ/cGij8owWQm6ekxGUgI374Npl+Bx2NP9La+c/C5uKew0pB/EAw2H/eLJsEOMsggUDw5KDcDomKqrX6/XqOmHGrfMbDN9l8kd6zjdQYz0WiijaSrvhIDhVm123Wyq+s+NNNqotRmu7h/3bxWaGD2od+xOm/6M4NpTeFFibqHl3WHEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9695.eurprd04.prod.outlook.com (2603:10a6:10:321::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 20:43:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 20:43:33 +0000
Date: Mon, 24 Aug 2026 16:43:25 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 07/29] media: v4l2-subdev: Add frame descriptor
 passthrough for CSI-2 and DVP
Message-ID: <aoys7bVbhQ1UkdYo@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-8-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-8-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH8P220CA0066.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9695:EE_
X-MS-Office365-Filtering-Correlation-Id: a6909bcd-0301-4396-fc92-08df02205cba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|1800799024|10067099003|6133799003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	baUcsHs+M7NdQAOK4HiSjpmA+F/SmiOofSHg9UTXGj3UyJ5dY6oW98dIWQi/BbOgArTj3hGN4F6SBJ5NlOENa9tN9j3FcqGGN6s6Kr4INzZKdj1pKBx7ujJX/AVGpGfksBH7CoeBFt+EyTSItioYZKkIAanzh8/JUxpwEOIFXcXL/mpZKvJ3SetNd1Gw/duCMczqlf9uGGCiYzT/EeCEzAvZeeo+Trs5ooESg7iuDv9TuglyQGRNaR/Oyg7L4z2Y1j3GdrJV5axQ0SdY7tU+6oREM/o9Qp3c+K+XyaGX+qdLMiPde3N4KQdXd1ZD9hkDnmuwuzhFBGc60Igbfh5nxQ2WF5PijsdMZUPCq+o5AWzDAGYLYbf0rPh+m0n3Hid/m4lOfSjgNQzsVEhUaL577ZLzv3y9qSCWkMkFIGhyZRinnzbi6UZrLEUfPXUMmvJef7wqg7Ys/QAHOZoLNeeCKzK2Eb+GWM3jt0aDFYRFxWRP96N3JpQeHkkT7wUSXOH5fc1HKT7GZYbGMc3gjVaCM7ssQ1fdbFTs3W8+xS3ex1vn7JOV1iHHVl5yGHGY+AFQXaWJaG1dAmQrsnUHyjeoamolwhRFalbGJnXT5zlHy4ieEf0COFigXckEToqCoYC/7kNwqricXA68za78Wi3JQPZUD6XyZISDDdIQY8ZzvWk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(1800799024)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nigZusxNpKE/Ae0131tJqxiLjBpTY0RO9f9wd9ChKslwFlaZ8SNN1cGh1TXH?=
 =?us-ascii?Q?JVgXnpW/A/+eHE2eO0fS8OmCb4oh1ZhXE1vPTbUtfSyPeTtYlYfIKdbU3l9l?=
 =?us-ascii?Q?KZy6FKX2iTOwJS2jblrbewOodOUv43n3v1XmUALnTacxFgWXK3ahDr17uK3s?=
 =?us-ascii?Q?O1clX1wvZkpXnBTAu5ckitcZtJbwvF+blil+PuEb+FsiC+NcVKmL92GUNqf+?=
 =?us-ascii?Q?Nu9hb4dyoScNzZNeH6V218UhZ7A8TID9NUUMlB73T7TV6wYwC28Z8Da9aWQV?=
 =?us-ascii?Q?K8XNBsG23CdBJOa2PiQXpjGmyo5tybCJpkvhlT6rEOw3jQ8MSH0clptLiNeT?=
 =?us-ascii?Q?SWxLe9ZnBhd7C1IEXEKGuuaLm82Lq6iG6YPZf4lEhtGMEpSWI/WVmWaeVXEe?=
 =?us-ascii?Q?aDQdQTxdeHhYpMLQjKpPnMvJP3kUFNTGPChl7ncHKkQGJeOgGNvPkCdz2tuH?=
 =?us-ascii?Q?oKvVd0nSY18GWjK9zfoOwldmkG+yed3O7UkpEPkCLUbNDJk6P100rZk73b9J?=
 =?us-ascii?Q?TwzAaTRkmE90IWvqrBPAeDqJHHUTCtpHxhKzp1azAcg9XEAZpPWrf/aQdHjg?=
 =?us-ascii?Q?6ei8WuPGBbQqISjXv2RVL5CiYlptbkn5igSf+RiuScDkGSTolhH0/32M0K3A?=
 =?us-ascii?Q?ZbYzPIK26Rb2kwEwdIyIS3mv9vykq1g2XSARx9LFKUhJ04clpr6q3MLXhXx7?=
 =?us-ascii?Q?HtF4eyzkF/6vS+UIYzrNUGvy2dWI1G4tZnNi6COE3HtGWQSZ2AavU6aCMUFM?=
 =?us-ascii?Q?XCneWQNLFjYltlAcAkgKB0IAzigLZDPjvyoldxVTvXHHHzymHBIIQXoFfx2A?=
 =?us-ascii?Q?K5zWesmlnWomRx67fCanBj+ixOtQMDIkf/+llFfer+FJeHnbytG8DSYtcVHe?=
 =?us-ascii?Q?XDIo31+sy60ebBmUJnUnR+AAKAc2Z0JfngF1Bv5/B0s12M9Xh4LGTm19WXw0?=
 =?us-ascii?Q?Rcv68oVPGAPcGeyF4U27lZQnTIv1I1xYyVIo65ingeNN95l0FJDIBt6WehIl?=
 =?us-ascii?Q?C4KEIouiQX7iA2LSuuRPAtx6Sbi6Qd2C6RWr5DT4k4Fos+gsa//hcG33iZUn?=
 =?us-ascii?Q?x9AWHqrNVXXznhItsAdwweNalvCRoraWepRkqFpchwbqmJWO3+2xOLTE+/FJ?=
 =?us-ascii?Q?cCrPd2RRadArWMht4fvgtqiNtYi7rd8KT6QtwYhWnJAjTSfLVOTMINPpTUmI?=
 =?us-ascii?Q?F6RYWNd2dWG5LBULogsTe8Pbfnj3SpQ2+H4As5mdFU7A+VaOuhG7IL+y+g9b?=
 =?us-ascii?Q?/JUxcIJ8G3hC3ucT0Gdl3zolXsgOP6CdgISlDQ642zUbbZSg4Q7OWagGJNYY?=
 =?us-ascii?Q?VMh2gYo5TAXkohmu7jKb1njjhSyKCQEQuvNYENXxNJ4YYmywPpXk5wqn1+1b?=
 =?us-ascii?Q?nTkEQAN99C8tjCMEkJ87wybdbm1FEprStyzPxzn87pRHPBJa/WT/gPR04mDm?=
 =?us-ascii?Q?cUIOAaz8jr8hDWC5Ny92KSDfxc1frQjGSzDolhUwhcRDQ2rfW1jxLPd8F+zx?=
 =?us-ascii?Q?+ypFTGtNvu0r7mZ/oj6cc7GxtlVVfxjC5iZu78uNQDdnVJiGHK+gzNr+y8Jn?=
 =?us-ascii?Q?eO5M76SBXzl7iTNxE5YjVieuA7WrdslMqPCC1e55OF3TSpwlgvOUmF5LhZKS?=
 =?us-ascii?Q?SbqQEgw8zmXNqRxFbRt5fStGfb0JuVIXCrehRkoEI5/BaeWOGdwJIhlC2K5l?=
 =?us-ascii?Q?FR7wLsliA5AI21npU3JuuFoeidn10GLZ/8hH1lUao32/inMAxvu/1ikYGdDZ?=
 =?us-ascii?Q?eeIDJwY08ofI8xE3QW23S9GeGXkzv5ct6OOadcf8jO3B0KY2WYry?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6909bcd-0301-4396-fc92-08df02205cba
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 20:43:32.9640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75YYmuALlYKSY0tgWhbMkn5gRKOFO1axnALGIKCCutgAu1YQfo2uB0KuQotH7R+5vKjVTeS2zHUHpjQYIfWC9hvTaKo/vFGJOw3bKxvrWzzUHm2FPZb3pJshFTBuOsJq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9695

On Mon, Aug 24, 2026 at 03:14:29PM +0300, Sakari Ailus wrote:
> Add frame descriptor pass-through functions specific to MIPI CSI-2 and DVP
> (parallel) interfaces. The two new functions are needed in order to
> support frame descriptor-less sub-device drivers.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/v4l2-core/v4l2-subdev.c | 20 +++++++++++
>  include/media/v4l2-subdev.h           | 49 +++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 071657459202..f5fa62038754 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2672,6 +2672,26 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough);
>
> +int v4l2_subdev_get_frame_desc_passthrough_dvp(struct v4l2_subdev *sd,
> +					       unsigned int pad,
> +					       struct v4l2_mbus_frame_desc *fd)
> +{
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
> +
> +	return v4l2_subdev_get_frame_desc_passthrough(sd, pad, fd);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough_dvp);
> +
> +int v4l2_subdev_get_frame_desc_passthrough_csi2(struct v4l2_subdev *sd,
> +						unsigned int pad,
> +						struct v4l2_mbus_frame_desc *fd)
> +{
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +
> +	return v4l2_subdev_get_frame_desc_passthrough(sd, pad, fd);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough_csi2);
> +
>  struct v4l2_mbus_frame_desc *
>  v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  			   enum v4l2_mbus_frame_desc_type type)
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index daebf8982c43..80ae7649f5c7 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1795,6 +1795,55 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  					   unsigned int pad,
>  					   struct v4l2_mbus_frame_desc *fd);
>
> +/**
> + * v4l2_subdev_get_frame_desc_passthrough_dvp() - Helper to implement the subdev
> + *	get_frame_desc operation in simple passthrough cases for DVP
> + * @sd: The subdevice
> + * @pad: The source pad index
> + * @fd: The mbus frame desc
> + *
> + * This function locks the subdevice's active state, calls
> + * __v4l2_subdev_get_frame_desc_passthrough(), and unlocks the state.
> + *
> + * This function can be assigned directly as the .get_frame_desc callback in
> + * &v4l2_subdev_pad_ops for subdevices that pass streams through without
> + * modification. Drivers that need to perform additional work should use
> + * __v4l2_subdev_get_frame_desc_passthrough() in their custom
> + * .get_frame_desc implementation instead.
> + *
> + * This callback can be used for the DVP (Digital Video Port), also often called
> + * simply the "parallel interface".
> + *
> + * Return: 0 on success, or a negative error code otherwise.
> + */
> +int v4l2_subdev_get_frame_desc_passthrough_dvp(struct v4l2_subdev *sd,
> +					       unsigned int pad,
> +					       struct v4l2_mbus_frame_desc *fd);
> +
> +/**
> + * v4l2_subdev_get_frame_desc_passthrough_csi2() - Helper to implement the subdev
> + *	get_frame_desc operation in simple passthrough cases for MIPI CSI-2
> + * @sd: The subdevice
> + * @pad: The source pad index
> + * @fd: The mbus frame desc
> + *
> + * This function locks the subdevice's active state, calls
> + * __v4l2_subdev_get_frame_desc_passthrough(), and unlocks the state.
> + *
> + * This function can be assigned directly as the .get_frame_desc callback in
> + * &v4l2_subdev_pad_ops for subdevices that pass streams through without
> + * modification. Drivers that need to perform additional work should use
> + * __v4l2_subdev_get_frame_desc_passthrough() in their custom
> + * .get_frame_desc implementation instead.
> + *
> + * This callback can be used for the MIPI CSI-2 interface.
> + *
> + * Return: 0 on success, or a negative error code otherwise.
> + */
> +int v4l2_subdev_get_frame_desc_passthrough_csi2(struct v4l2_subdev *sd,
> +						unsigned int pad,
> +						struct v4l2_mbus_frame_desc *fd);
> +
>  /**
>   * v4l2_subdev_get_frame_desc() - Get a frame descriptor for a pad
>   * @sd: The sub-device
> --
> 2.47.3
>
