Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6723AD50A;
	Fri, 24 Jul 2026 16:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909572; cv=fail; b=VWqWrUZcuHkeS3re+fty+XHWz2NuE2ImLQqc4tx4dIyu5Aw6EBqiSMgsZEa9NRvIrxtwqUPVUPi7nfO3SW0vkTpgFMQKtwKZilSKLyB6IzjuVf+HQnry8z5NRKeZKYhk1MLp+eM3XMaNmiceyUY9GbHOdQ1Ql5/rEsW1nem0ZRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909572; c=relaxed/simple;
	bh=ASIrr78Sfd73d6wJFvTXFZn8IIPxmNmOmfsY2N+BZMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=naagDpXOA2B4Wj/WHkvh2I5NxS3taheqBez9NXPnS9V5n8SP7aqV/fnwDZ/01/AnlWcWBHOMjzybcC3VD2dI8TXt+HY/g9Dgi3BN0k0ZGYMYpBIMhXFC1IzkCQgI5K9fBDuWJH7ZK3qU3cfRqs65vll44ru2JuaY3i1j72JIP44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=skMiQ6Rq; arc=fail smtp.client-ip=52.101.69.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="skMiQ6Rq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmFRV+hUnoB1TKItjNlDaoeB8QFlP8Yvg5qg7DbGy3gqtq08EJVpB9hBE4q9zu66wO5TRahPZfEIUjFDZsbVJsegFqoZ6rC62JYv+Q00XxY+djaHS2K5vffC63vUw0A/OESW8ZvlHOn0GjQsIx8s3xH4Vf42ayQxXP3NfAmVtKpFVW5Cb1P5qA1jg2Qgrwt8iu4CNnvy/0GH0sgQJBq0Me2zbqokmCaw74XStjvmtIgs1O8cgJe0kXnywNlXcwjDLNTGMyEHvYR+YnkPQ8M7R0kewHVgznjKMzDn0NX994bW5WhvgPRL1xMkcm8D6C7hRCZC4YcXSxwY8aNIdDvhZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vg4s7YQGEpbn6uVh1jE8hIHTM50DTd5oWkY0y49LalI=;
 b=SRFKTV9wjYCIyYmRamW7jZnlkcicon02kDtI8z4uPvzOyV06AEsKkOgYiDhbEmo9kJicB+hbM9HIt/bM2mfN7UxD78XfjdzNTd2Njn67UF1a/RB85WFHArRjU0g8fzTqwXl2Ns1sXzKOuFUJx9ZIx3kx1bKqBY3hXew8lx5OlMVDxS/DBAXp40sn604ucTVNCkdx6kfCuC6FweJuzMyxx/WIn3+Wf7uPdKuoNgccJTyn4i4YoOsML0lMVawBQa/IEOQtxXeRGB1RZSgJEKzh8LeZ4wDX1isyBUlBzkPz22k8z+cF7Y6v21wgm2Sh6rjlaTanSZsdQ83xq+t865RJGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vg4s7YQGEpbn6uVh1jE8hIHTM50DTd5oWkY0y49LalI=;
 b=skMiQ6Rq9BWV9LR6oer0nUaubmUvs/mbtv63ZOIGD2yzWO7RzYZvBzx+KT8xQ0n/M/VcewN/WYlZwxAiJ8OqbMjPLmFx8uuKqTLr5qlZlOfwIL5EUf2pSV9xSNOXRF8T7DT4LfZFkGzASzA4vSFJtn9aNO9WNSf1GO376l86ikoihVlBfIZCQJ+knE4aHHf4+/OrRPWgfiFgdbiMhGcsHiqxVP8ITfF+gaGOTNxG097qIieU+OuosAl60Z9KbWUTcj7qeP474OojG25HvCnd4v2B9bMfjjpIMfV1E7u/0bx+2ZJzwkFKcxDJFjpVUu7LLl4s0rflSOaFo69B0WXGsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB7132.eurprd04.prod.outlook.com (2603:10a6:10:12e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 16:12:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 16:12:43 +0000
Date: Fri, 24 Jul 2026 12:12:35 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Subject: Re: [PATCH] media: hantro: release runtime resources when device_run
 fails
Message-ID: <amOO86K_3wuTd_92@lizhi-Precision-Tower-5810>
References: <20260724111548.2109-1-tharitt97@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724111548.2109-1-tharitt97@gmail.com>
X-ClientProxiedBy: SN7PR04CA0160.namprd04.prod.outlook.com
 (2603:10b6:806:125::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: ae0356fa-3881-43fb-f991-08dee99e645a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|19092799006|1800799024|366016|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KZTAJjFCUckBohTk3T3OB5mG1pRnIqpdtVWm/HwirdDBGMPBn3TymcV0Qxjok85EswYsyIOm1N3sQASVZKY+mtqCImtBzBmWuGftZzUyvyE0SQ7NH2d31sa9qeogeLdUplCo3lpl0K+y6Pb5MdA66mc5pvhiU4DeLh3fEfPpZnV3KpuukkViLSKGgmwSpEBa2iIzW1Yf17BPcJ+TSvslfYNWz/ifCR1sETQe0sJeoZIsmluEUWaf94AT+hIRA9RMgw9Img3E3IxN8gW+aG13gygj40e92A2QJ0hKDtHJdPyq5WnYbnfZ+wtuzo4x12n7hMHjGS71Bdt+ciwfu1WwS4Zeb263wcssmMPB6YDyqIA6NLO45tHug3Dk8zLGdNscmcrMMePCr9NOwktn7NlhBh0NlbybRPZWyIElcESyndfVH+Dc5bWigu6vAuLG5J5JaCbvgyGTCxlfzzByNSAJhfXQPqexwL/TtiiHKWW8w8olkWIKmwf2nHUZC++/DXOnHMdW+OEiCpm0XzW5Re4j2/QdmXVZVmAx+VvAkorG/CPB7ZzNV9z8GJiFnqWQFsuQYSUgP9B8isPo5BbRiZ2g7yIMpq5uWZ8ByU59pk7qpykvcT+eQu/spHTYoCaTC4Rbp+jHdCtI3eY3fPvnMrHwWjm5yXLpao5MeugwD+Xee/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(19092799006)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wAlCJgTgaIKLFyRMWhQwk6acgBMSqY4RaDEw43ldU/0X/qSzwDl7wnYRo+MV?=
 =?us-ascii?Q?fYRJUnTCE0gXoTzgskP7h43mGxymiR6aS0ojIDFY764TATBlftd5RQ921nN+?=
 =?us-ascii?Q?Gjv+3p8K2/RQTPZr1Bsu1JyFPtk1X4Am3DqdGy+BhmxSwmP/H4q8DSmZIuUd?=
 =?us-ascii?Q?ZoHdPj1zd1FWuAh46nIoKIs9Ey175Ejz8poqAf6oy9ziNZFFDGM3a8PoTjjl?=
 =?us-ascii?Q?ad37rk05J7ExPEPb1IoBTybLdHW6fU2rb4KRf0w/C+hXlORsbBqEu3skUQZU?=
 =?us-ascii?Q?GpSoGTd/yitDsSMDFQf2zVJODbhQePZW5Ef2Bjd9sxAIBLJVkFQBgKDSNlhB?=
 =?us-ascii?Q?IGASHOEIGbK9G2IHnpDzDYXty7DkDrsISDCMW0FCmJOd1fP3vZv0w6IqIyHc?=
 =?us-ascii?Q?93AauE3py4LVlPbgKBG3lQnz+zbMtBKwhawI6ommWd5Yap/f8ChPF8RR+Lc7?=
 =?us-ascii?Q?ntPdJU8O6LL6XYMqLUR0bhE7caL5ina8e6ubazQWDqODJVrPmqybzTXRhhOl?=
 =?us-ascii?Q?ew3obAUUdznNsrBv7e55Ci9VXyVR63c6oUJbGcanWjHM8Ue4UuOw9qS25CSf?=
 =?us-ascii?Q?W5Oa1mpvF6u/raIJFb34K6OZBDONXDxIUPhw5lvBKB8Np/ByXA+VcYlzkTXx?=
 =?us-ascii?Q?+6xuuns3nzmllpALzqFkehmswBLOJES89b45TJdEIe0ZrGw6uDXvQfvQhryo?=
 =?us-ascii?Q?A934v3hG0TeZ2IRMvYMh1M72d5F5YrPlTgHW1A4skDVwNBlVgDcqfJdJ3euZ?=
 =?us-ascii?Q?VE5En4cNyhrDf3JaGl0Hhjin3ZrPkiJy+/z8Sp04pXB7wNhc8ZEXUWKiZAnE?=
 =?us-ascii?Q?md+dweUaOTdxSm/b6a9ErvwHdNgIOEloLbupSSosw6Xg2EsUF/K1FilAtbFs?=
 =?us-ascii?Q?vXuSBrCzAUqqk5iOL2ECv9yQ1hZmgvg3kZ8+5jffUFosb7vXudOaHNn1qJaa?=
 =?us-ascii?Q?upQevb9J7zs+HjzZqqK7gxHZCDtbWh1+zV3Zo9FuPL1PXAALAzFozG6rMQoX?=
 =?us-ascii?Q?Izt/3xwYAU85bIOJW4IVjnC5N+pvGx+bCYinOqzYB7XHass2d9Vrru9pHYEL?=
 =?us-ascii?Q?18wZyvwYaTq9ZakkWfaOO/kuqiGgNY0OpJpKNlXi/WtAxqf72Rp1pObEwJ9h?=
 =?us-ascii?Q?Waupj+ZAMmQPASK4dbZKc3SP6LbmH3MOGljbucRFBeXMhrtuGgK00d8ml6Z9?=
 =?us-ascii?Q?3RyBW5fePuvI/xf1BriEt9WyDDf7rLttXf45y5MdsxjIRZ2otSum/35P8Njk?=
 =?us-ascii?Q?dGwrVZzX0ooAEVgFFoSw/S7NO0hmGfQllSY5dtfF7AVGpU8PZaoFcUMFxOaI?=
 =?us-ascii?Q?4PrlEulBz+652mShMHfM59JGdCCFdVZlDOdquad1aiAlX4lwCER4eoYtOyh3?=
 =?us-ascii?Q?NcZ8RbDjTuWoqUzVD2wEuruB5So7LK4m9Q5xw9SXqIMbmWGIjuExx7evSz18?=
 =?us-ascii?Q?VQLHuO+OAp+0slJ1jT1o/88dIdnZp4Lzz1fQG+VMdY8rXHmLpZm2AeiB1mnc?=
 =?us-ascii?Q?zpIeZDxReyhdXBIMCDPQdA6txow7GwpvxlK/CAmg5eQGKgT5yO9oMQapeSMI?=
 =?us-ascii?Q?1+6k/Mo4Tq/zRpjqSxViKZlWuRBqFa89hqQ4j5UgfG/rETJo53eG541QF3lx?=
 =?us-ascii?Q?3s8dH9imh7CU2C7isCp/oOmeJb7gnbdpzdbwo2N7sYWL3KHd/WqRfhcbfXoX?=
 =?us-ascii?Q?gK8pW7HQoT+8FTss3CnnzfFUAEl7F4zBs8qjx3HMA6B12EK1YfDF40xUqPIP?=
 =?us-ascii?Q?0+u1AmAZKnmwRc2xAz0i6mh1jryejTIjbImyzqm/SXG3l7d2lFr0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae0356fa-3881-43fb-f991-08dee99e645a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 16:12:43.4465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtB6OERPWfmkKEmMXGGDxIHV5Xfc+ykIbkRgimBcWOAJVDxUwijLCIOYXkp46I20Fa6sUyDH4hS+ZFQttn9WFSla4Bi3SLAUWjYJ0S8LOpTirECcIqalSAqbHg0h1JWI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7132

On Fri, Jul 24, 2026 at 11:15:48AM +0000, Tharit Tangkijwanichakul wrote:
> device_run() acquires a runtime PM reference and enables the VPU clocks
> before invoking the codec-specific run callback.
>
> If clk_bulk_enable() fails, the runtime PM reference is left held. If
> the codec-specific run callback fails, both the enabled clocks and the
> runtime PM reference are left held.
>
> Add separate error paths to release the resources acquired by
> device_run(). Disable the clocks when the codec run callback fails, and
> drop the runtime PM reference when either clock enabling or the codec
> run callback fails.
>
> Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
> ---
> Tested on a Rockchip RK3588 (Rock 5B) board with Fluster:
>   H.264 (JVT-AVC_V1):	     129/135, unchanged
>   MPEG-2 (MPEG2_VIDEO-MAIN): 23/43, unchanged
>   VP8 (VP8-TEST-VECTORS):    61/61, unchanged
>
>  drivers/media/platform/verisilicon/hantro_drv.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 2e81877f640f..9daaf129211d 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -170,6 +170,7 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
>  static void device_run(void *priv)
>  {
>  	struct hantro_ctx *ctx = priv;
> +	struct hantro_dev *vpu = ctx->dev;
>  	struct vb2_v4l2_buffer *src, *dst;
>  	int ret;
>
> @@ -178,11 +179,11 @@ static void device_run(void *priv)
>
>  	ret = pm_runtime_resume_and_get(ctx->dev->dev);
>  	if (ret < 0)
> -		goto err_cancel_job;
> +		goto err_disable_clock;
>
>  	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
>  	if (ret)
> -		goto err_cancel_job;
> +		goto err_pm_put_autosuspend;

Mix use runtime pm and clock is not good.

You can put clk_bulk_enable() into runtime pm resume call back
and clk_bulk_disable() into runtime pm suspend call back.

Frank

>
>  	v4l2_m2m_buf_copy_metadata(src, dst);
>
> @@ -191,8 +192,12 @@ static void device_run(void *priv)
>
>  	return;
>
> +err_disable_clock:
> +	clk_bulk_disable(vpu->variant->num_clocks, ctx->dev->clocks);
> +err_pm_put_autosuspend:
> +	pm_runtime_put_autosuspend(vpu->dev);
>  err_cancel_job:
> -	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
> +	hantro_job_finish_no_pm(vpu, ctx, VB2_BUF_STATE_ERROR);
>  }
>
>  static const struct v4l2_m2m_ops vpu_m2m_ops = {
>
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> --
> 2.47.3
>
