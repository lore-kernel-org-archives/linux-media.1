Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010011.outbound.protection.outlook.com [52.101.69.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD52D331A65;
	Wed, 29 Jul 2026 17:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345434; cv=fail; b=gVYY+scpQwCgrIBGPJWXDoSIHI+l5KdMGwTsroW5VRUQLDCB1CCqqhz0HN4JlSBnIW2gnRpbB6djNCUQSiF94jEfmaLa0fVcEI828XzWWhqB3LN44nO1z9mLyYeaRxiuc9yN33Aylwp+ZgoJr0oaBHKA/bosq2p8WVr1jLw+xNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345434; c=relaxed/simple;
	bh=k7DrOLh5F1ahJ2kzdzscku8nIUGmrFOdSKi2VaAP4lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D2wg/x949jmXuw0ZaTCxdDI36UxoIaZI+On9mhwVqVK5Tv+gcTbG1C8b2d2UvmZlK/IDdxZMZ3FLD9ySfE0mgYDL8B/pVA9jI8dj477Lrhzj4EjsYLOcpcXS+r1AmiVKdkybfC4sQkMftu3j0glyfbTDc79qGSf3RjxZBSIW3XQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bKoc6QIk; arc=fail smtp.client-ip=52.101.69.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bKoc6QIk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOiGwlYZ0xSZQGi3hFbrpL82U/i7Ph2pkxl8ga1YVvIg0KKLEhfnCmoJXSN78seL0JJeBgFjrimk8z3rKRhvGk/X2YPojkeuGVNz2OJ5mkB8ViNSAQ5F8cZeyMRpbCL9kEVTreiF7vC9WR0L9BDB4nmEJhVMcA+2KLHxAazC6klGTMQ449jdcI0Ca0bs3F4hSKhg/xaEHYqdfMcH6ohMBTW5VzoGzcNnb2gGUu3F7SztQemkO6HonypFqvu8bXjU0p8FARmbYNZqEMwHMy4sFreGbQlqAJ8yJn5hXAKtJipGi3bsYKHDS0ZxZ2Lhp4XtzzdNMq3L/myxxzyMvp1WHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m42b06DRNIT92VCPKzc1Z3XsFaEtIBi8AdVp2BiP0N4=;
 b=eI+3m23vi10pyz9z/X4xIBlH5ZhfCHh8P1s7RZeXjYaWa2aARYI+7Nnr10Gd5A/YtlWSOddZib6f5KFLL88XQtb5auV1MOZ15phm3A1Ml7VJLxuir3Do0V6aHnmiscWdUd3GPuTE071Dev682E6vDUORgFYQE27FvD2E2DcuZK6CdRQL2XJ6h4TAfmiu27vYFrmQ9ACNEq8P+uOFKh79wLB9drmM6HDR44HrLW22hBmwOq1aHtIhgZVboPQy37WXHKE0O7rFsXZQhuGRjrZWaJY9JJD/ciJGsc/TxjijHT2vxEzs3xqgAPYIW0cDZgrVX+dE5f5bqGyxoJdtYwSgiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m42b06DRNIT92VCPKzc1Z3XsFaEtIBi8AdVp2BiP0N4=;
 b=bKoc6QIkmaanE8MqHAW6UlCMgMOOJVok6U08WUjaaLjdiru6wVUOnNm/d3AzbKg+G2q8XjvvPwby+s0QN6Li9xckGiTJPgsLme0h3W99X864HpepIvVTf7NdRyzfy7hXDjEkzo5gT4qu4VKxRWIIhIWjldDXOY4HdQKJGI+zoqYpVFchVVHSGSQDPer4fvL0hmE6V5ptWXxDl4/c0dcDV4X1LfVuchgrodT9I8gDNxCEPGT9Ov6R//NNZ08UequO9WInfIGHYmZvcVdlDyy3USttY1qo/P10gwnU1yiEoyIBpl4UWpS4md771jFhxBR1MhRUvTfDoiSDTvQneLJodw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB11629.eurprd04.prod.outlook.com (2603:10a6:150:2c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 17:17:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 17:17:09 +0000
Date: Wed, 29 Jul 2026 12:16:59 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Subject: Re: [PATCH v5 2/2] media: hantro: use DEFINE_RUNTIME_DEV_PM_OPS
Message-ID: <amo1i5iEfwGZLuui@SMW015318>
References: <20260729060440.2092-1-tharitt97@gmail.com>
 <20260729060440.2092-3-tharitt97@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729060440.2092-3-tharitt97@gmail.com>
X-ClientProxiedBy: PH7PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:510:23d::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB11629:EE_
X-MS-Office365-Filtering-Correlation-Id: 34525b69-0677-4c25-2dcf-08deed9538d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DlRzohkl73E5wrDH7940sYXDJxLdELmvKHdSafXeKinktAtY/eQ3BWh49PXP2BTyb2xWr3M/Vw+CtZ2FWL/qdSAN/WrKHqBvlxWyRH/hmLz1HSCqNtdBWAqInoxFOaf8ig4jp7j7XqdqElYtdv/OqUU4mhZJl6da0jgjhiC62A7OQtR0vMU3fN5vnaZmDNwbfitnHFQC2qjQ4BJ7RIQrGwjBZlzGvsz0zFSVwiTX3zJIpqysr6ZuiURbItDnwVefL+srXqf7V8lqFTSky3eOjQjGJMLhOc2JLnDNpTiJB0aiRX0hvn1UsPgCKpWT/WzgrtY8qxl2ZtNUmwqX1yfaH0ScqO43m+kYeYLIJHOKEslidu0kGPoNGKDfrUM33zRXEk2gGp2CXxmHpviXX8nrULXB6Sn9F8WQr7BnCe6x7VYSOELJw9HwsPW5GvuiWxLv9YFJz1u5pYxKI0Dq2pzAUra7s93O60JAEPdyIlTXn5maFzOWInOP+bpH1XisFn7YcY3VVt/f5t5cWtEfpnBTbCZVzVUpH+OoA8Ae8b1KXifsnlYoiBeCAWhQPa61KEmwStMdPGfq9oD+7oIQEv2FOQIxyELMhQl6+nSTVaGrXBUPFCcmYaJEPLxdvfMBREKZUwj0283HdUtQHnDfSWloN0Ny5tx7iHVjKFBV7LDwjQE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K2XDnq1ktc5fbuIHwXRA2LRz+BbtwwY6ZUaxzGDDl+FJbUru1qBNHDOIyAp1?=
 =?us-ascii?Q?tJUpLx6eLJARj5Y0Id8XZ48dXdt/sf6JVIB1aTL7em5kBtqcw/ex0g+l4a0B?=
 =?us-ascii?Q?KgU6iPnUZVMJFs8E/vqAxsIkdMsTTez2oAUKM+319ceL++wM/667/U8eSTi8?=
 =?us-ascii?Q?O8E0mSF3nxfrSO7lCVux9f+tgd2g1CIHxrkXWopMnr3VaQwM5mOUmfqMpNMT?=
 =?us-ascii?Q?OPuFQ1iH31Eri6fKvFyuMBb3XVkNV9k0dAwemo1yyx8hPjs20qLY6aHsFGz/?=
 =?us-ascii?Q?TQuSyFD3+KBkXERRMHw+TXmiszS28mdROiGh6cVE7BiTA7kj40bKKNHoCW3J?=
 =?us-ascii?Q?uLYtt5PE0wZp994FzpfQVdBFr5aT0QwqyCs1UCH1xA+QLIB1gR1+6AwyFjPi?=
 =?us-ascii?Q?rZch9KTehG+599ZRb4alovzwN/exXj/c3uC2sxs8W3oUoBie62AH+POJtzrS?=
 =?us-ascii?Q?//hfLHSEvJQbfu6aSxpi3emu59BaTA6+mUkT0xokR07Kv4LsSF7SYun+0Knv?=
 =?us-ascii?Q?gg055hGpQBHIecbtK+E7B4zQ5eBHhvQX6ozBFFmH9GAdX4l2pQuHw89UgTeC?=
 =?us-ascii?Q?Sb79y5gnpQEe3exVcUx9wnPxVZRiX6/xLo1HF2SUgEK06eUAzRlX9v7Wx9U3?=
 =?us-ascii?Q?Jk4QiGUfZsR5sSTu7BPrEoGaWM01NrvHG5dm7/vUPRG+ZK9bFQqrc4qgMDVw?=
 =?us-ascii?Q?K4H+19+eZnimLuoYzI0SNEOjWWm5MkUNuONke2uKCPgkUQr1Tru0vAO9QJCR?=
 =?us-ascii?Q?bDxIiUivUlGYJvtx8oOdP8L66JkkgPwHuB28DgUTe7YwoEKqNqIAGyXS1zsL?=
 =?us-ascii?Q?XnYZtZleTbdQdxSJg3o3Gl0Xq0K39tIfaLJSav4eXKMIGJqtdqPnUVtU4Onl?=
 =?us-ascii?Q?oZ08p5W5WBqCOLsq0iIlSsUK/JIIikTLD7/5hvpzKZjnA3XbO4EfBbV+ghuo?=
 =?us-ascii?Q?pXq54+As7gR+OGjFbk5J+tH3yJntwcjDQwhrPaHCtKLvPfaLExLqx5ZnubG9?=
 =?us-ascii?Q?mR3jqgk+GKUFVDCeXKQTEuJsl4xVDFghrpWBRWXaMq9nPt5QiKDemKu9xy/P?=
 =?us-ascii?Q?rrJ9uBdYNk5UySK+lMCg6QZlE3R9FJGYx6f89pMRXnqmLfb4AqF61M/6p/yQ?=
 =?us-ascii?Q?X33NKSB9awjPZI2KzWJJSwUXDtLOXlqEOkpbA1WjuUji6Q6wo8HMOHah0deZ?=
 =?us-ascii?Q?GTnQVM9rG/PCoal63057GjXbFC30soMD9F7hyjiR7WVPSrhQbdy+S4KADUZB?=
 =?us-ascii?Q?elt89Km9/SGQIf0EDQTCGPrBtKRdW74nu2E7FgKkop8c8Y6aAlUd5R0nfpoA?=
 =?us-ascii?Q?nS4B1zghZpROnJRg3FfoeJN0NkescjHQnQBpKy+RJOXZUOZfEWH5IollEsXZ?=
 =?us-ascii?Q?RQ1bdlXuFWEHm7Ha3Sa5MkdFyRMX1Is+Lb9cHVvFz/9M6XwhaSnCR7jFkcSD?=
 =?us-ascii?Q?vbb24B7nGgY9WPIoVUl4zZsv6/bDeL07STunqIwuCD1/Spy7LXb3btAyPiHQ?=
 =?us-ascii?Q?ufE+pDukBTG3TYZjoenGh1AiX2iZNz1r8a7eApxQ+z5Dd9EIfpDHeX+5412s?=
 =?us-ascii?Q?k5kUo7D+zxUpXC3K0bZsV9pASfGfa8KtqjaPsitzWUrgewYoASpYxdZEnkgp?=
 =?us-ascii?Q?mGzcOGA5Qz0jiAUb2d82Ptgt6pmwFKZt92lp+Kt3ljKStPy6Rp8si+KQ8LFO?=
 =?us-ascii?Q?0c2ymEl5im0PEZh8D4S2fwXTJlS3hnigb/RrZhrN01Farry9tfaExTKST1c6?=
 =?us-ascii?Q?ufErLvKFVMYvcewZ60YxWrWXmS5KYMCYocLxWKwB0f7oQRZWSaWX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34525b69-0677-4c25-2dcf-08deed9538d1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 17:17:09.5420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7Prk6kQHywCB2PFflNPzbOS44Kyyo+Nc40HieWFQ6rUuPYwCuPpove22EpUyZliE8uDS2nEnvAjL2pwVMEqhOP4DyyiejWNGoUZD9vBpm/5qsNyOZOELrGK9MVq11mZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11629

On Wed, Jul 29, 2026 at 06:04:40AM +0000, Tharit Tangkijwanichakul wrote:
> The runtime suspend and resume callbacks are currently guarded by
> CONFIG_PM. Removing the guard directly would leave the callbacks unused
> when CONFIG_PM is disabled.
>
> Define the PM operations with DEFINE_RUNTIME_DEV_PM_OPS() and use
> pm_ptr() when assigning them to the platform driver. This keeps the PM
> callbacks available when needed while avoiding unused-function warnings
> for CONFIG_PM=n builds.
>
> Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/verisilicon/hantro_drv.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index d6fcd4f7f9da..35302cf9f233 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -1284,7 +1284,6 @@ static void hantro_remove(struct platform_device *pdev)
>  	pm_runtime_disable(vpu->dev);
>  }
>
> -#ifdef CONFIG_PM
>  static int hantro_runtime_resume(struct device *dev)
>  {
>  	struct hantro_dev *vpu = dev_get_drvdata(dev);
> @@ -1314,13 +1313,9 @@ static int hantro_runtime_suspend(struct device *dev)
>  	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
>  	return 0;
>  }
> -#endif
>
> -static const struct dev_pm_ops hantro_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -				pm_runtime_force_resume)
> -	SET_RUNTIME_PM_OPS(hantro_runtime_suspend, hantro_runtime_resume, NULL)
> -};
> +static DEFINE_RUNTIME_DEV_PM_OPS(hantro_pm_ops, hantro_runtime_suspend,
> +				hantro_runtime_resume, NULL);
>
>  static struct platform_driver hantro_driver = {
>  	.probe = hantro_probe,
> @@ -1328,7 +1323,7 @@ static struct platform_driver hantro_driver = {
>  	.driver = {
>  		   .name = DRIVER_NAME,
>  		   .of_match_table = of_hantro_match,
> -		   .pm = &hantro_pm_ops,
> +		   .pm = pm_ptr(&hantro_pm_ops),
>  	},
>  };
>  module_platform_driver(hantro_driver);
> --
> 2.47.3
>
