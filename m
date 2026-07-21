Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA0246DFEF;
	Tue, 21 Jul 2026 16:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650606; cv=fail; b=Hv/V03W+wjJJ/tNmPmy+nfdBrwT7rQ5YH1wUwtMo69y9NhZAbVkzU2mf9mgfjjS4Rm2olCJVlYIfP8GMSAqEM/jOh/BMVR8JHknizePRKIPST/KgvBf/N06msRFHD1FVlF0A6fxmo6P4djpr0Af7HHOFSN7PHJa+B1wPZF5kjLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650606; c=relaxed/simple;
	bh=rvDyNMavamD1EtAPoSeF7LQfT2wKWs2A/KTMIhqsRAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WLFXD6KVViqBjacU6/M+qre7DI5Q6XeGH3K5VRb+TBi18cAxEOHDsE/iuvfB4X8/uJvQQ+XJGHkdIwY/pRw9jLuyhDoHEtl8R4bjbQibw5f+qIj6B38eHqh6pyaoISNlfYQlnp0V2Lbg1jSR/KYlJ4H/f6Ti1SZw/FY0/KkIQ3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OSmRTk65; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OSmRTk65"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keI4KFaPBzLrzugenaRmqqEuRQj2qTraPeTQGRt9s3jKTpw8F9ublwTufUTyOj+i1azUiqsG7djykEQacu0ftSaMjKXK0iBVV9s33kg/mahKRxRMraBprAJlAnr18Fk0t3PhZVwf2xJPoHNTPsCGRCrj4JhkNxFTBlTDwejpfut0E8Xlkk0XzbFu8Om0GAwH695fnFnw95zKWZ7sWRrDs+fya8xl9BumCvQV6A5iq3kWKaWLQlJNIFdjwrbM64cx/Q9NyDQ64QXVNmeuKjzajTaw6DQYqInX+Jl2/OS709wEWMOkQDODZU1X2gpNBu2AXh9Aa7iT6atvpgayqYQqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAQ41JjSwVHYUc6JmJWeQiaHoQPmISKPML9DR1h3OxM=;
 b=P3/9QMoco0ACgB0Nzf0L0VJXO4YOKnFkk8PAZUlLjJluq8PZjNhBPFBa83LRklqfmMK6lXpJuqsG8VFVeNYlwn/sYz5UMBEuzSw4Zb43MZ9QOOSjOntJJCptUWYVtQDliNaxpe4cTnufSK901eduetSt8H4ZUw7DRAAXkM/EusVA3XtwkE/QcHI0zqkdClZDOmlV+ikwepiYdojXvYYUC8EdRFCqNAA46reGQT5LseaNFEwNpef9v0UqpoSbZOD8pJbMSF7Mr3KovDC9/z5cm8o1LbG5eZ6rDZEXiJ0jyPQfoYkgwrXsreNqb+rA+GCK7H8WrSVjtgJPMmSLeOtHjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAQ41JjSwVHYUc6JmJWeQiaHoQPmISKPML9DR1h3OxM=;
 b=OSmRTk65mxMp6NClGrrTDL3Hw6kF7r1EHl7zBbBFe9fojZdVEW4+deDXO1TdhEvKyRzdo1EEodNMu2A34CYA/f5mGC/+Xfswc69Rpw6c3VXvVTCQM66cnTEgQrV+FwfsSgGTuPOcGVhzFSDjn1M3+ZRLHjaWWNImBmNmb4zgNRjVIH0UY9WwsMDhv7ynkGbiK/pahVpcZqCoQkuyiW62kgLaEhmFFMgvAyJQ1AdWBp+7RTMxUEJoYDfSuN8WwxQ8kiJBVy81WZV24E74bO9MkJHpt+78n6FfGLKIXYaBSHv2AVz4WgYPMO8Lhb3iNgSA3x3L8ORNf9CkOnnm9jBVuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10904.eurprd04.prod.outlook.com (2603:10a6:800:269::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 16:16:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 16:16:41 +0000
Date: Tue, 21 Jul 2026 12:16:35 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
Message-ID: <al-bYwS0_oEBGJq2@lizhi-Precision-Tower-5810>
References: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
 <20260721-camss-version-v2-1-b2440d99085a@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-camss-version-v2-1-b2440d99085a@oss.qualcomm.com>
X-ClientProxiedBy: SA9PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:806:27::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10904:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a563122-a34a-4356-d604-08dee74372f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ad+a8dkCx4qDHmYufoyWIQKlKvWTyiF1TN4W4NV1ERClmeKyBCNHGLFCn+KDePhSGoBEZuQj9OoeIzkG510ugwl4XHxs5IZuRPKLlw4KjFbZTn4Z+m2rRXuRiavU2bXOYRP48LwgeaiYtQ8Vpm3I5yqhv8QWwiOsvfKFbvzh/LFIh88NBBiuYTyMPimAt7pAWnyRy8DQ8Muryi8WSwFSQDW5klLY2vr935Bw/l6elQhhAQCJhQseaMyLgsF7GTn50Nc5BOburit8RylDchOvHdjeLC+YNxqvfg3W2P6TnIJf5LUovjB5etZRDS84mIe+2dToSHB7bVNYXrSOErVSgECkI+5vg9VEL65l4C0zrzDbL5220TcpV674VpnKmH8kJ2hzw0MQAUf+Fd9LYmoCJcA9WtqXwtx/GktjDWvosKU1+xKAtvQmQS3vrvaXgNwxlP8HULXfrpthQxeGVC26h6dCbss8f5gfkMOe98RF/4lPSPUByY/63npg+pcUFi5no2Y4wZwrFU0sYV6sgv75wrmxsLVhDyUCBKdVv8KPe1hkYFlXCtVptAaDq331dHQV6JzyOYf5tJsTx5bLoPMRJWklCE8n8HAma0Vesg4UbmiVGQpMpk3enP5btwKEdSYVbdjDdGzZ8+uOTDohQ1ELv1YstDAbN/HC7yw4Nvw9RRs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1GKfhCD+wyUiKmq/WquJMggemgPJw5dIs0c87OZ1fjsxOvucOQKZOm0VuN+M?=
 =?us-ascii?Q?rnZEMR3lZ5HQ/ASWqXQEC1PjQxLuuGpPFDXOP1qrluVRvKty1sb5c/aBUmGJ?=
 =?us-ascii?Q?+t/F6DgqLoV65siabVApA7mNp+zZo9giIWmqgQxsSVrfRsY2811qAzpq3hGA?=
 =?us-ascii?Q?MayA9r4Jbud/TQQljq5x5skKclwAvdVMkXcFVfVFFpFGo2cPtMHLdxCT3YMK?=
 =?us-ascii?Q?YbKJCi0+gxmDgesCaZbLE2BRZrMxjOpPOmgl5f8oSyy5oWBBg2RZRIVCtAL1?=
 =?us-ascii?Q?Z5HtKrwttw7FeFrsrdc/6gbXAJ1mIUgh0F9OAlFwcyTILg6Wh/Hy10waz7mZ?=
 =?us-ascii?Q?nQGdZ40AATWNsH7mH2Mis6BAae5JCzlAADr7LLifbRlbVdkvzjU1WNWlwRFB?=
 =?us-ascii?Q?dMLuxZoGgR78xrl+pvf9I2lF6ylaFZemrFRvwPfcn2TJq9RqkSWTRiMMa4P2?=
 =?us-ascii?Q?Pj8Fu+V0AR1iK0MsxVIl4R07czkjjtfEGjdiDIyVKMY0ZiitWsoHehwrtg9w?=
 =?us-ascii?Q?ZVjkAOMsuFqmeuTG0GkshC2ngotlKX1QmzhMT0rfRsqVqGRGCx7G4+zZ9MRN?=
 =?us-ascii?Q?nFjLPvm0JX0OT8abO3YzbcVPJ9Kv5vGg9Yqj1OJ6qxL7Sf1LGJpJ4GkMYC3X?=
 =?us-ascii?Q?wLHKQJADd6WLs+AhMVVSChspF1TjGFkzjPxqU1kfv3cwOJboeK3wbd/nqtkG?=
 =?us-ascii?Q?LCvsVWmPrVBiS3HzwWMW3Or3SmLbGkOMic6nHH+4ryDcyrCvUw6CtIlqfVx9?=
 =?us-ascii?Q?d1M9ppc4LMyPHVtnsdlHGJWbGwWesyxZDKEAuHP/+oOcfleSFk/FZj1cGlmP?=
 =?us-ascii?Q?D477s+n6ix5AVMjBm1Z9fk2rT1vEPDJyoABsLi7XYk9jhikQ/jUW5ReYUwEV?=
 =?us-ascii?Q?CxGW8ljSQhbXk/HmTQOxKCr7o/SkS6WVNlEIZMicDvL69MGAYy+/A/uZ4Q2D?=
 =?us-ascii?Q?8jj4tQW0PFNivyNdI1thw4CK1x82QvdJXqo3eTgyB17ufPm20mq2T2dzz3J9?=
 =?us-ascii?Q?rHBYpre2xHNnU3+FUu5FDUousKdtnyuLSODORsItqExLHIX2tm/b0dDCBQOD?=
 =?us-ascii?Q?mM1/MVxEWJu1MdBECzYGA2tf2RjeOMgijiIDBOQtdn2X6BCPK5JYs7xVIziZ?=
 =?us-ascii?Q?ZXU5wqAwDgcJOMq/GfzUzS0x1Ypa0xILEfXSk5wm9XIerSEQF3FKcK/cgNb/?=
 =?us-ascii?Q?21sOpHlZwNWCDWr5v5tnLyaKLrO0joUPOTCNo4ysjp5A4FtzQUnYTbFqfjvF?=
 =?us-ascii?Q?NSU6YYreHHeGkgzzcSQ9VPn4Grx9r96CXnRDkYj55NUU8hk7ZUJ2qP84/yUx?=
 =?us-ascii?Q?J5xmgX6JhNxtismOvQvuDakVB1tBgCoeKZ0mbrG9x987Uo+rijTQJJ13PRL+?=
 =?us-ascii?Q?4C74kw5hGnpiAlVi0ZqafQFb9lHZQqPV4TPzWk5PzvR3ytrg5LQzxMNS+/cw?=
 =?us-ascii?Q?NMgM4Z5y6OFsA5V864b4sxQifV3E8L/aV441AY9/0WaBy4HA6+a/rAuyl4nk?=
 =?us-ascii?Q?imMGuVFL/fnbUnMpNrq1vTR0L7fcgivo7ecIExUUaylegh7LODBQSG7Fck5H?=
 =?us-ascii?Q?Eqq3d4pkBrYNNPvoCwvxsXXHfZxW6gwBXWdGmsnC2ZIUi98cWrFcrKyQRqoG?=
 =?us-ascii?Q?nF/KqYK1iWWyLZd0AZFspL17r3qszjfbVGOEDgO+kC0XYmEnBmV8nnpyGItv?=
 =?us-ascii?Q?S9kq2MWBS60eSrZ+0L2/CWX5+68/bZNM/imAJ72eFRG7tUNTkCYykUJc7lIw?=
 =?us-ascii?Q?Yjnczs5pggx25luleMf79QUR/5YMdIc=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a563122-a34a-4356-d604-08dee74372f7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 16:16:41.3362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OMw/r9pWXfWoCo2Lrg4KTAcLlAUm8sl6jFO1XRAHLdac8yNItPuWlDLzDAKhxwsCWReeLQu+AsGqNA65RUHG4epWPTAR4Gn2KuNp+odTc94KeNvJFI1l8UYXFD+kZO9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10904

On Tue, Jul 21, 2026 at 03:21:08PM +0200, Loic Poulain wrote:
> Add optional PM clock support to the CAMSS driver using the PM clock
> framework. This allows CAMSS clocks to be registered once and
> automatically managed during runtime suspend and resume.
>
> This is especially useful for global CAMSS clocks that are shared across
> multiple CAMSS subblocks.
>
> This avoids the need for each subblock to reference and manage the
> shared clocks individually. A typical example is the set of clocks in
> the top_group, which may be used by CSID, PHY, CCI, and other CAMSS
> blocks.
>
> Introduce a small PM clock descriptor table in the CAMSS resources
> structure to describe clocks and their optional rates. Initialize
> these clocks at probe time and delegate clock ownership to the PM
> core.
>
> Hook PM clock handling into the runtime PM callbacks to ensure clocks
> are properly suspended and resumed alongside power domains and ICC
> paths.
>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>


>  drivers/media/platform/qcom/camss/camss.c | 42 ++++++++++++++++++++++++++++++-
>  drivers/media/platform/qcom/camss/camss.h |  1 +
>  2 files changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..01a9d4f780fbe130554601481bed50eac5978bed 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -18,6 +18,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_clock.h>
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
>
> @@ -5346,6 +5347,37 @@ static void camss_genpd_cleanup(struct camss *camss)
>  	dev_pm_domain_detach(camss->genpd, true);
>  }
>
> +/*
> + * camss_init_pm_clks - register shared CAMSS clocks with the PM clock framework
> + *
> + * Clocks listed in res->pm_clks are shared across all CAMSS sub-devices (e.g.
> + * top_ahb, axi). They are managed automatically by the PM framework.
> + */
> +static int camss_init_pm_clks(struct camss *camss)
> +{
> +	struct device *dev = camss->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!camss->res->pm_clks[0])
> +		return 0;
> +
> +	ret = devm_pm_clk_create(dev);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i]; i++) {
> +		ret = pm_clk_add(dev, camss->res->pm_clks[i]);
> +		if (ret) {
> +			dev_err(dev, "failed to add pm_clk %s: %d\n",
> +				camss->res->pm_clks[i], ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * camss_probe - Probe CAMSS platform device
>   * @pdev: Pointer to CAMSS platform device
> @@ -5434,6 +5466,10 @@ static int camss_probe(struct platform_device *pdev)
>
>  	pm_runtime_enable(dev);
>
> +	ret = camss_init_pm_clks(camss);
> +	if (ret)
> +		goto err_v4l2_device_unregister;
> +
>  	ret = camss_parse_ports(camss);
>  	if (ret < 0)
>  		goto err_v4l2_device_unregister;
> @@ -5775,7 +5811,7 @@ static int __maybe_unused camss_runtime_suspend(struct device *dev)
>  			return ret;
>  	}
>
> -	return 0;
> +	return pm_clk_suspend(dev);
>  }
>
>  static int __maybe_unused camss_runtime_resume(struct device *dev)
> @@ -5785,6 +5821,10 @@ static int __maybe_unused camss_runtime_resume(struct device *dev)
>  	int i;
>  	int ret;
>
> +	ret = pm_clk_resume(dev);
> +	if (ret)
> +		return ret;
> +
>  	for (i = 0; i < camss->res->icc_path_num; i++) {
>  		ret = icc_set_bw(camss->icc_path[i],
>  				 icc_res[i].icc_bw_tbl.avg,
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 93d691c8ac63b2a47dbb234856b627d8911a1851..fe5fe25d5f18d8a3ce35b48077a975f1453c341f 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -107,6 +107,7 @@ enum icc_count {
>  struct camss_resources {
>  	enum camss_version version;
>  	const char *pd_name;
> +	const char *pm_clks[CAMSS_RES_MAX];
>  	const struct camss_subdev_resources *csiphy_res;
>  	const struct camss_subdev_resources *tpg_res;
>  	const struct camss_subdev_resources *csid_res;
>
> --
> 2.34.1
>
