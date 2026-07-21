Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013022.outbound.protection.outlook.com [40.107.162.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AED82D3A7C;
	Tue, 21 Jul 2026 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784652058; cv=fail; b=UMMvXT0YFTCqvmVxyDVFWGvTZO2ED0OJzV8sEun1JRsT5hQmTjbWXnYhH8HwvL7m4tPU7Gi33k4LQmtDIM6IBIesB+7nmVVDew+/wyT8myII1iS37oYxh4s5BGRCXfTx6RqT1ezX1UWw5ZCSeDpnmPjcrkRemxYQvgaqY5yl4r4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784652058; c=relaxed/simple;
	bh=2SOPaeHDE2AHlxiOukLqrmcx5csZwzXUBB5UVxXPrdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Xcb5JC2sLc2hXkkeKlr3BWDijJ7XiVoGgO77SvJghjz+PJxB1mFxO+OWftuIDLiFKpgoxCq9FLpq65bEkyDR98w/wO+j6gX42EV0/QR5BBsootUyPSeDooG/uZLnz5En0TvL5swp7Utsv6wN0QCd3Qhyh5dbidQfch4FDEp0G34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GzRi7fcV; arc=fail smtp.client-ip=40.107.162.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GzRi7fcV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bT1RW+tQZ/9L7U+8DWRnqP5vQDk8gJXVkww8MTsujiyasN2Y92KIwqUIKTGcvk7PSpYgz5g8gdXtrkhsp0LgfdNBR+SdHgDPQrsotLaM33iCyM7Dg2kkq+pYob3V8i9YEd3wGLgDcArPM1eKnr+FTq0cnP2iOj98VrAJBAbqVUIs0o2NTOGriReaYD2ck3YbHDs9zsFE81DQaYkNw2CEHPDfmth//oT6QZ6YFkUkVaSMHdJdk9IfkhoGfNE90bNGR3O/ZV/WQU/D0okY68/LYRUTXDuOiyBhDtxFzKMjQFYhdUWIjwzWU6lhc28SWYW7i2sDGPjCUThUtQqCXPmewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qzaQwc7tquaBN0muVICV4uywte8536+bei7VLfImYA=;
 b=qIFAziaMZJcl2iS2eSx6OeJ1jNVMcUWeCDkj8a1XqiFpYeiX2RNMOojKBee0ht2HFmL3Xsb1FW/IMTnn8fGuO7VkDNPd9Qv/ovnHxk4ofIOyp243RM0yCAbfKzmcKFm7S5wLJezOoLsanWzdVPlG3TgWmhfZdT8L3OHW76IdmhNlX07R//OgG9iNtZATlC42SPCTP9JMGxMDmH5iYR1J0qV8+NQQOuGT/E1wVjevu2+1LCl0GzR0Y+mgLGCnyGO3ev3IuabDxZmlvLMHU0bJcCgvOsPUeTIGX7xMK+1dSikSP40NsZSlMlcjSKiAodG0qGlNABs4XojH6g+RUiI/wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qzaQwc7tquaBN0muVICV4uywte8536+bei7VLfImYA=;
 b=GzRi7fcV+/lloYbiipFmDRZhyp0T6EVwUIxv5F5Jqv43t2O458aUTeu/J15ICEJjTSO1RCnna+k7wYj6cW9lTx1DU2AFIQ51z88vSeiRWv13kYJjrPTTtlVDDi9xPyEM2uXo9Y4ODV+SjtlRVjV1ZMyrv6i1FXF/tsP6shpof/NVjoaeCnJyyJtXhz+aKAw2oO2xGHKp/aVpm8mmlSAfWf4f1dU09QyX127c7PcYbiA8dPcmRpTld71AcokLimJMVGcJ/f5x+QcqNKU1Eb8Rh5wbC28pCLn34t2wytHMxajlzzcR48d6cVV1n+rlwtjdIvtsVmhKCreQ3B1VKQV6GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB9739.eurprd04.prod.outlook.com (2603:10a6:800:1df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 16:40:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 16:40:51 +0000
Date: Tue, 21 Jul 2026 12:40:45 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] media: qcom: camss: Report hardware version via
 media controller
Message-ID: <al-hDbrCMH9peHLV@lizhi-Precision-Tower-5810>
References: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
 <20260721-camss-version-v2-4-b2440d99085a@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-camss-version-v2-4-b2440d99085a@oss.qualcomm.com>
X-ClientProxiedBy: SN6PR2101CA0016.namprd21.prod.outlook.com
 (2603:10b6:805:106::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB9739:EE_
X-MS-Office365-Filtering-Correlation-Id: c9595a04-35dd-4d52-4bcb-08dee746d387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	f26rLE6dTiZPfrQZ8N67YTW1Hk+Ynkj39V0T8K1KincnNcSo0VMqUDydnf+18G691xvhob75GeUNYIdINuK/72ey+R6OpgbiFUB6wTrGdLMT1vG2g/UH5hpxrUOQu94XdakIdrK/3pdjrpNf4GJPF9/OqWwnRTt7HG80l3pwJ9+EaG2PfBSMGwxc2az5LAsaANpAKHPtLI6Y/S5pWp7rtOaUwgG9U5LfQIdWrbdbCVlCTcAY5xv8/G3cYcEE6SmIFYttnhlOOk5ejcYWar71pjtOJvT5IBrHLuWC0ZWRT2HF3RM74aSablKa5emwZIzvJFFPxHG03xNUztBkIR+UAB/jkUbjbzJ1uUGxHgpdnMLONGHSXxC3eNzfFyOFMXZzu2IBDQ1jmTqY21H3zzXcbTPUauzASPjDJf1aeHcWbYTP8SxHx/rhYIk/+BsfplJJfyUxAbVXWEAFHA/GltBi2+tD7zMHLc/ANA1Terk5fL+QY97+vCWu8le8H9rP/XxLMTV4U6tHsyKyt/8aOubEZMtbSVDx8z1xYN6b9Ddq8O6GTbAVCqrBelVKac1q+hem+gNSGeO66m+BMHtH3WkTxt6VT+3jcfzUZ6RqAopjSvg3yXru3GN+08ZYThLuYyDxeYKD5wnUk8cwlrqJakXRB+k+FwZC+79kdYIQQZd5P+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9WmhNYCioV209R4hGkD8nNwehHbDKdTl8b2eSi76sMmnEixEBqtjJuIhOPoA?=
 =?us-ascii?Q?kjiFkJ9ubQ8/HEZOM7ZqMNp8TaXDR7xaNGXYBu2bhxEefQth5xoVREhsO/tw?=
 =?us-ascii?Q?GY5vZyIQWMza1b55fh5tRQBUKL4ocVd1aSyxL28C4wIPCxB1qCCuXVMGBUNP?=
 =?us-ascii?Q?a4NZwiW1D1QuiELdZ3AXXipWgX6wOsjE+2qMpWrapy3i7VG/78AO81iscF96?=
 =?us-ascii?Q?VLd7VWyts5/3fZ6yxDFaG8RWg4MZ2U0sJX+0whSXiWE6W7fk8Eca+p5/YpeI?=
 =?us-ascii?Q?0fh0pxIlFUypPUE4iF/lW+WmlCbsh2IuzqZ3u7LSgT9065GvdkOP9hdpW4Xm?=
 =?us-ascii?Q?sGLWnZ0JKMYIsxYSjt9ePOwQ60YijF3vj2Q1UdgJhhO+1oVZFJG+QYOJ4A/A?=
 =?us-ascii?Q?c2Za66GjhfDt1ljH68u3RZyIe7adtYglH2VFjnZ/jSq6Zhm0rLZo0rF1GmET?=
 =?us-ascii?Q?lcE6XvAyHv9NVg0GrZRYMXbwKsO07aC6Ey4XFClzcnBKS/Q/lDHnAKX+tnBi?=
 =?us-ascii?Q?pyFxdpddSg+8n5bwLLOgvje7J0im2hgw48m0FM95bOvC5m7AIAqFRr1DRHmp?=
 =?us-ascii?Q?k9vOLr97ltEYvAFJMPv7WPOpRENqpGb7LV8+vAAdD4IAnTRg+wWUxK9UTyYf?=
 =?us-ascii?Q?ui8TgxDi/o820UzAH0uRm1lMkycBRwh7wz0EEij5vKUyasKe3e0i5hXdlt+u?=
 =?us-ascii?Q?230ArSMheIbhAKMclg2wNo0lnYr0hAbtGsdSbTMoxuK2UlwG3ovEoXNBbZed?=
 =?us-ascii?Q?pryOWqKt626t6p2ijK7mFa+n+iaBPvc60sgzUh22dwXGOo6b+jr2FDccM1P3?=
 =?us-ascii?Q?BuQloNXdMfzxDnLMtvNggy8B7nQ/qV/AtucocgpYN0gmIBKggs9wu8KvdpN/?=
 =?us-ascii?Q?1yknXRZm6XPjSPFuRNTVeFMJyIWtGwME1dlWIBrVLWdCDloN3a2tlAGrWiM8?=
 =?us-ascii?Q?tlwnb+0qPtdKlF/ycUb7YGOIY+4sn7CDUWT68BQtikYIwJ9zNuAzgyxSCTHy?=
 =?us-ascii?Q?OS8qad/EBFmqKyNlVxuDzTAgI3L93BwXskxwPSt37eZjvECrUUgSf/+TxpSF?=
 =?us-ascii?Q?KYiSi4sy7lFGqDSwEH+rrrBVHcAQg1kxPoTkSMhzg1LenV15cooGJVOBRzoR?=
 =?us-ascii?Q?SOYRGg0DJrc4JMDg9iC3gWP5ClC6jeaA11acdUjjEocLpJv2/Y2W/EAjGVV+?=
 =?us-ascii?Q?ArrKz2PGv+7NFaeAmahW+/5iTsdsj6pC0vOmN6blYBJQ4dJddMAxaAjTh1AU?=
 =?us-ascii?Q?6r2cJdUyDvExZCY/KoiI713epyOsm3Wceolldy4oSm2F2aqnwGBABGvPojQG?=
 =?us-ascii?Q?G+Aa9MmWL/DHra5U/5Qq2zrMjslGMeLz3IG/tHFvX85uXRFNfKW7tJRpuyvI?=
 =?us-ascii?Q?tAw9+IWKZioUUhY2buHTIpyVH5wnlBRhqimZMAs4SjE/zMg0iaDKbHOL8ixK?=
 =?us-ascii?Q?UPv5floVYGi+kJn5zmoenDO7bSX035O494audd6k+IWimSch+dI9L51m2u6Z?=
 =?us-ascii?Q?Sl8bGacKyaeHQ09oNlhcvXjY+ypFeqX1Fz7BhHJ+htN3Fk9kZxQTy9hNu9Vy?=
 =?us-ascii?Q?qqvkgqknJ3drkVvCD3/EaucU16s/0HP2rNgOHLl7R5180GyXbPEv8A0PqVHF?=
 =?us-ascii?Q?+yZpuDedCsJ/IWLBmYE72fxDYnBGpaFRQoul/xwaeotimrrvwZ9FBkOq0UDF?=
 =?us-ascii?Q?UpqBIF1t7M/pUevSQwV4ajhZC8Meg81IwBnmtsj1XASzc8DuSKH/KuxT2xP7?=
 =?us-ascii?Q?ve1Cj0zjfYaBqmKhTZqxr8RWap8mK7m3lFx/tkAQFXObUh9zbhAk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9595a04-35dd-4d52-4bcb-08dee746d387
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 16:40:51.7524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajOIFBCfN0SHU1Si6RJP3KE04o6ZdvbvzYlYJJhhXmRXAEUtP9Bk3n+Qp8EfE9nrOrFyDmFpdJ2HxhacTYOya0DB5ox4aQ/lT9UrdjnDAWFaoOzkCOkW/Np1wuXlcNwP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9739

On Tue, Jul 21, 2026 at 03:21:11PM +0200, Loic Poulain wrote:
> Populate media_dev.hw_revision with the top-level CAMSS hardware version
> so that user space can query the exact hardware variant through the media
> controller (e.g. via media-ctl or MEDIA_IOC_DEVICE_INFO). This can help
> identify the platform variant and adapt behaviour accordingly, for example
> allowing libcamera to apply quirks or enable features that cannot be
> discovered through standard V4L2 or media-controller APIs.
>
> The version register is exposed by some platforms through the top-level
> "top" reg region (offset 0). When present, map it and read the version
> once at probe. This is a no-op on platforms not mapping the region (yet).
>
> Reported media info on Agatti/CM2290 (Spectra 520):
> Media Driver Info:
>         Driver name      : qcom-camss
>         Model            : Qualcomm Camera Subsystem
>         Bus info         : platform:5c11000.camss
>         Hardware revision: 0x00050200 (328192)
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 40 +++++++++++++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h |  1 +
>  2 files changed, 41 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 1f691b8940a9b3d8a9c03cb3159ed711d0d18e77..caf11ea21a60b5e10644d3daebbde7371d549ff5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -33,6 +33,9 @@
>  #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
>  #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
>
> +/* Top-level CAMSS version register */
> +#define CAMSS_HW_VERSION		0x0
> +
>  static const struct parent_dev_ops vfe_parent_dev_ops;
>
>  static const struct camss_subdev_resources csiphy_res_8x16[] = {
> @@ -4677,6 +4680,29 @@ void camss_pm_domain_off(struct camss *camss, int id)
>  	}
>  }
>
> +static int camss_read_version(struct camss *camss)
> +{
> +	u32 hw_version;
> +	int ret;
> +
> +	if (!camss->top_base || !camss->res->pm_clks[0])
> +		return 0;
> +
> +	ret = pm_runtime_resume_and_get(camss->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	hw_version = readl_relaxed(camss->top_base + CAMSS_HW_VERSION);
> +
> +	pm_runtime_put_sync(camss->dev);
> +
> +	dev_dbg(camss->dev, "CAMSS HW Version = 0x%08x\n", hw_version);
> +
> +	camss->media_dev.hw_revision = hw_version;
> +
> +	return 0;
> +}
> +
>  static int vfe_parent_dev_ops_get(struct camss *camss, int id)
>  {
>  	int ret = -EINVAL;
> @@ -4866,6 +4892,16 @@ static int camss_init_subdevices(struct camss *camss)
>  		camss->csid_wrapper_base = base;
>  	}
>
> +	/* Optional top register for hardware version info */
> +	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "top")) {
> +		void __iomem *base;
> +
> +		base = devm_platform_ioremap_resource_byname(pdev, "top");
> +		if (IS_ERR(base))
> +			return PTR_ERR(base);
> +		camss->top_base = base;


The read_version() only do once, if move to here and pass down base, needn't
save it to cmass

		ret = camss_read_version(camss, base);
		if (ret)
			return ret;

reduce one goto branch, which is quite easy to make mistake.

Frank


> +	}
> +
>  	for (i = 0; i < camss->res->csid_num; i++) {
>  		ret = msm_csid_subdev_init(camss, &camss->csid[i],
>  					   &res->csid_res[i], i);
> @@ -5456,6 +5492,10 @@ static int camss_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_v4l2_device_unregister;
>
> +	ret = camss_read_version(camss);
> +	if (ret)
> +		goto err_v4l2_device_unregister;
> +
>  	ret = camss_parse_ports(camss);
>  	if (ret < 0)
>  		goto err_v4l2_device_unregister;
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index fe5fe25d5f18d8a3ce35b48077a975f1453c341f..cce79e56f58c8bdc0097f4a1702df22c4248f2fa 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -133,6 +133,7 @@ struct camss {
>  	struct ispif_device *ispif;
>  	struct vfe_device *vfe;
>  	void __iomem *csid_wrapper_base;
> +	void __iomem *top_base;
>  	atomic_t ref_count;
>  	int genpd_num;
>  	struct device *genpd;
>
> --
> 2.34.1
>
