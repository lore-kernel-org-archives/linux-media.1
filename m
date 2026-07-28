Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010041.outbound.protection.outlook.com [52.101.84.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F34544C65C;
	Tue, 28 Jul 2026 15:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254008; cv=fail; b=A8c49iSjiTF/Sh3ih/pIffrzQTuPSWaZz0pzCgaqqyzk9NDEOuK9odsSayiKx8HmHOnViBsq92vmt5/C4wJhrgOUNEGZ5dcoYOiEEZg63w4MCOtmHEP5NzQsmBruVHjus7zSABRfpa4v/vpC9hZLYcJfrPfSWrND/yVGro+WMvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254008; c=relaxed/simple;
	bh=6nLiGewcGpdFiXXEfwmusAzc96oKithsmvtTTewQDY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f5ILu95Rv31nApvujFhXLS03Dj/T2X+x5aCO0oSE+ZpxhTpmiM4pZzDhlM7xIP9I6RQSmF1dFiMfXxgM//S+1EJ3NXM7Aab/O/uBBkNQWWujN3l8+uv8Z6tzYtxOYWuml62cdK1J/M4AcJORGj0gyGAjQy0j6+XQ9FisI8vlgqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MGdTdmVO; arc=fail smtp.client-ip=52.101.84.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MGdTdmVO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFk7JlSY9uqAKlwcKrU7NcBKjdpDNx2lEzfZ965TSvMcfhdwiklICgvQjoqplamnER/dWaJqrixTrFkijwiwq5IDAf/LIIC8XkcxY3iArbrGKdl0z37cTiCAk78J87HPRCKTWWf9Ca4xVOreABeIdmTLf+ea7lzxVndYroEKeE+g6d8pauz2pY6cOM5sF91RUdSHncYczvq23yAeq0dk0uW4ELIeituJSLM5VsS/07lo1Pw7eSu1s4Ym5+ETiEFla5CHiE0jdOZDuHBrVqGDBF7mRdv/PYCeq1YycAhwCDFnfQr1afcUxeAWI9skI2SV8LrSQFms91bEzFlwyb0jAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaYWksTXUDqmMmjdnd+qG3AI9XTe/m9EtG4m2gAdWyc=;
 b=bVzEnWTnNtBNC/fwUXUYmezO6rO1tDbEt2xVKOVllHSwfAFMrohQX+w3N38JeTDriwrYqx4X7Bf85MIkniuY73N5Mk5/vHYgpk6i4G1oi6cSWIwNYilX8YYt6Kl45ZXR/vAQwhl+kES808Umw9vj/BmSORedHq+GUQXo2YUuGv0oKPsYnLml9ZT2NNPnBBWwJOAHFhwCkzPnB+oRYxydDsCi5FZUKU6fZ2CazdzmWlhuiyCE6vUXPnfAQlY6N0DLTBUm67YBA2HmEd9LjSim6GWGAjIIwCMmlr3sPm87Y7YHJhjGQTc+OfkN9r6CAE6HzVpuGUS09IoR1y61CNbOig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaYWksTXUDqmMmjdnd+qG3AI9XTe/m9EtG4m2gAdWyc=;
 b=MGdTdmVOMJk+DoWQWy8R6HZiy+BUtPMvAoPZrzJ3vW2yLFeFZ35VZg7xb+zgV/FZ/mJ1bdTPdjwwPQVxGEtzTszKsFXUp/QUB1mXQvE2TlA7Fytaxf2I9OJ5NsPBRtMYW0nyo9hZr1QH4fhitKuXfiksus7tkTMKnI0+50HL1rrpIrlat1XzQockDYmIU8B/MzepNF6Eg5nfrBnb3rU3MFx/hIf6bXEOCksyWEHuPpZEtbqSbLbO1siRoMwpvi0tUYgtF50JkISkFkAw857S7dKrJcHanaELmgUa4pQomPUeBi7s3pWY2O1IRqILlXCJ7Tm0bLNBK9QpB+JCl+Zihg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11829.eurprd04.prod.outlook.com (2603:10a6:102:523::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 15:53:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 15:53:23 +0000
Date: Tue, 28 Jul 2026 10:53:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Subject: Re: [PATCH v3] media: hantro: release runtime resources when
 device_run fails
Message-ID: <amjQafSHo5cjCTnW@SMW015318>
References: <20260724131208.2315-1-tharitt97@gmail.com>
 <20260726024243.730-1-tharitt97@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726024243.730-1-tharitt97@gmail.com>
X-ClientProxiedBy: PH8P221CA0053.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11829:EE_
X-MS-Office365-Filtering-Correlation-Id: ab330e99-c78b-4a82-ab42-08deecc05aac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZLKbCD3jmSbBRg/YsaXBO/JwgS2gfWrh38JyFWLqGMVXQZbONYpyxVEYS9IDOQnSdu82X8vX+VN8tGP2HxiFMRB+pJq8UaKTPRKoLKgxc04hZldsCK7PDo7KBavutV8+L8dUu5Ou1JObyKU1l0VwA3DvyWX6POSddNMC6qx9TbB/+XYKfTrCYpMch+sh3my5BlSzqoWpLddjPmfWZig9zaX3XZdfNv3/a4SEqz/OBGw6DF+GdHaLMpLj2KcQGwSX9agADrm/XbbqDSQ+40wa6wa2C4Ya7eYxok9xXRa588/lVxYKexD2Y//Bhnbb35pC6QTbrdnz6frjCU3XjeO8YgCsFnHh3XqwgjSwbg2qqddNv/7RXUY3kyVVvrKDwYyPq9IkmzCv9DTxYrQeekF2cWqGoLH+jQ/i/bYg2jb1+Kg+BFHlEvJV+5xMsrr/GL26jaQthoxIrCGka08/r407ZEBEG7EnJIcACx3+FOI6CdseomKjfHzMwqG/ZnglFoQmfRZbNXAKlAklFPamR1+eNI28NOv6CTjmlLPUQAo3EdWteKrwyuOg6fkDBMS/6Mvv5vwKDQgYZ/opq35lvCmrdCBfP1eOut6N1myOM5gpX7ekYl+d9NJeBOyPocAZNE3XTj1r98aqd/MifWefZXVldo991WV4SJi/DJhqZE60Qcg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qi5PscL9ryYKMNy5fstX5HsIPkEUITSW91PbDTJCpH1ICfMo7yXhohgkYzRj?=
 =?us-ascii?Q?zGljTnMRyouO0kXZ0/98wHxCWmEOkocga/XTO6MBr3iZouPP4o/k6Mgfm3kx?=
 =?us-ascii?Q?UWwYM8avGeLR8lMYNnYFIkdm6L7vp5qpkZb8nIamWbkXMgZ2MrCeUnBmbZUD?=
 =?us-ascii?Q?VGXGXF0tko1cLLTtorhJ4j+2kKxbxO216MQuCwGd+iZaHmgtVtqqGHVmr5js?=
 =?us-ascii?Q?/m5hH1voX1QmTLO49Z0nBOxhkEed9ZlvqiG4XD8AwQWwf1Uq+m0ZvLrFRO9R?=
 =?us-ascii?Q?wtombxU40GTkEqRctIFllvZKurnWj/ogOAMZLVUvl6OO6nDwEXDrGLWdPBXM?=
 =?us-ascii?Q?fFANpDxWHY0K0BcLswsn12kTSlR/YKoIlosx8Lv9Nqv1OJ4dIcg3EkyF1juF?=
 =?us-ascii?Q?CVlHB8vVkeJS8Cosw0ynU3npAGrTuyOnwh4UNIrtCVB8V5jeNVMjaxg3dfui?=
 =?us-ascii?Q?9qnsKaSpZinSw+et0iTRYryhbtnX2fgRUwJDNmUDjKLz75O9vfBsUZh7EVUs?=
 =?us-ascii?Q?03ktYFs6MNNIe2dX2v5eywI+ZI7Xj0yoHqkW8StCFfzQaHNSPRBOgpelFtWk?=
 =?us-ascii?Q?tX0CCDZBH9XwdC71BDE92Uz4rTQfHJwDtc7vp/iNUC5ZJYsIjRXoWqNUXzNL?=
 =?us-ascii?Q?wFMMBjU/zjdsi0J3mhWCe75yu/EoNseNFEgMWshcB88i3SXJf2VOmtpaGMv1?=
 =?us-ascii?Q?Cp+f9rrYUiwJiuUl635LO1RJIx5rlD4uBRavJXers6OngvICGwpIqMaL9Icf?=
 =?us-ascii?Q?yhTSIIkQ9i5yBDMKSwvxC1UgsgWK+lmOAZOfSyY8zpW+fB/rY+kZhuMxIARR?=
 =?us-ascii?Q?XNEASMWjpN4p9PB9txBtM8fy7ZIGHZmLjhdHoGm+0FhrLLckobSVhdRq/rdV?=
 =?us-ascii?Q?TWs90enMN1y2IZwsgnggc4aMBH4F8ue6Y4jyFKUQK5zwD9NDpxhXUjt2jua1?=
 =?us-ascii?Q?gA5UxPX9H7C4dtn9AeklOVrvnk5wK2jY+I+sC7+vtR+bcq/rjrIG4RKeFHL/?=
 =?us-ascii?Q?KubjPRaoSSTglu2ucsRCPeHCxDZ4bQOFD7qRrbbIrxCLHAmArJ3hYjqzNrID?=
 =?us-ascii?Q?4vR8PEsXu+2mSYw1YbtTo7gjrwpRwi2e+q8e5QzghrzZXOsVzKnBoYTjnxVN?=
 =?us-ascii?Q?SOtu02qhSaa2AZYKEkwHT0SJmLRWybeH2lihM7DfiSD6/kynNZPvOmUe9Xdk?=
 =?us-ascii?Q?6gHkgciYBW51Twd3F0tokR3IShOwpWqYUAttJ0uK+n9Wt4thW0MatXbT15Sx?=
 =?us-ascii?Q?6yhhUGW0zbIHQaQIsiavbR9x/Sx2yzUocpVoEcPICN6BkJ5tP3Fi2iZfxVkb?=
 =?us-ascii?Q?GO89zIIXfNKod0lNkpLWZT9C17KOvhEX/7V66Gu1+UJD53kC1duBrl4uLlhX?=
 =?us-ascii?Q?807cZvazTK5pKyMDMCFU1zi6mTZrSxKKaCzZIH1cAQgJ/JGjdNn/IMWRITrN?=
 =?us-ascii?Q?5JjK4hTfTuA6mvdruYYkxNuQKSTx4NU1TgIjnHPLgAo5XUZsHYmMw05smwcc?=
 =?us-ascii?Q?X/N0G+Xu9bJtb3fm+IBP4JxYxbHsVr17zjwqRtEZegZ6MoEGPdtngis4eiVC?=
 =?us-ascii?Q?tzdWSa7/iFezhYf3g/+TW8KMRjVisZyg0e8wzZHcKsIFkzGXUNa4DNYIJXW6?=
 =?us-ascii?Q?6UZ9aRi9RFBMKaKUd8mkEFjv7tD4uxVSK1tDhgadXHeG+9n7ohgIbEMWLYFh?=
 =?us-ascii?Q?NkSbYnd/ZPA6249tPF0/MpwH/LJPg/hTT8wyeiCSlm1YvG0oEka8+LDUOmlm?=
 =?us-ascii?Q?0ooXUl6Cglggj31czFCoZ2RT76CqBtA6EDZ/IYarqrcveYFAwasX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab330e99-c78b-4a82-ab42-08deecc05aac
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 15:53:23.5094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DcxBOJcX3p9gmDg0p0ZD5mP3mUMlrUkG1vOxsdZByNsgnWuyOVdZd+fgYuECMS2bdZ7R9FVFsnVIDGrbFiD72XtsqWhJpx+YbKiAI8edk8C69e7OkZyCyLA0A3aVoheN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11829

On Sun, Jul 26, 2026 at 02:42:43AM +0000, Tharit Tangkijwanichakul wrote:
> [You don't often get email from tharitt97@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> device_run() acquires a runtime PM reference and enables the VPU clocks
> before invoking the codec-specific run callback.
>
> If clk_bulk_enable() fails, the runtime PM reference is left held. If
> the codec-specific run callback fails, both the enabled clocks and the
> runtime PM reference are left held.
>
> Make the clocks part of the device's runtime PM state by enabling them
> from the runtime-resume callback and disabling them from the
> runtime-suspend callback.
>
> Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
> ---
> Changes in v3:
> - Move clock enable and disable operations into the runtime PM
>   callbacks, as suggested by Frank Li.
> - Remove vpu from argument in hantro_job_finish() and
>   hantro_job_finish_no_pm(). It is accessible by ctx.
>
> Changes in v2:
> - Fix the codec run failure path to disable the clocks before dropping
>   the runtime PM reference.
> - Use a local vpu variable in device_run().
>
> Tested on a ROCK 5B (RK3588) using the Hantro G1 decoder and Fluster:
>
>   H.264 (JVT-AVC_V1):          129/135, unchanged
>   MPEG-2 (MPEG2_VIDEO-MAIN):    23/43, unchanged
>   VP8 (VP8-TEST-VECTORS):       61/61, unchanged
>
>  .../media/platform/verisilicon/hantro_drv.c   | 68 +++++++++++--------
>  1 file changed, 39 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 2e81877f640f..7978bb72569e 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -59,8 +59,7 @@ static const struct v4l2_event hantro_eos_event = {
>         .type = V4L2_EVENT_EOS
>  };
>
> -static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
> -                                   struct hantro_ctx *ctx,
> +static void hantro_job_finish_no_pm(struct hantro_ctx *ctx,
>                                     enum vb2_buffer_state result)
>  {
>         struct vb2_v4l2_buffer *src, *dst;
> @@ -86,15 +85,13 @@ static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
>                                          result);
>  }
>
> -static void hantro_job_finish(struct hantro_dev *vpu,
> -                             struct hantro_ctx *ctx,
> +static void hantro_job_finish(struct hantro_ctx *ctx,
>                               enum vb2_buffer_state result)
>  {
> -       pm_runtime_put_autosuspend(vpu->dev);
> -
> -       clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
> +       struct hantro_dev *vpu = ctx->dev;
>
> -       hantro_job_finish_no_pm(vpu, ctx, result);
> +       pm_runtime_put_autosuspend(vpu->dev);
> +       hantro_job_finish_no_pm(ctx, result);
>  }
>
>  void hantro_irq_done(struct hantro_dev *vpu,
> @@ -111,7 +108,7 @@ void hantro_irq_done(struct hantro_dev *vpu,
>         if (cancel_delayed_work(&vpu->watchdog_work)) {
>                 if (result == VB2_BUF_STATE_DONE && ctx->codec_ops->done)
>                         ctx->codec_ops->done(ctx);
> -               hantro_job_finish(vpu, ctx, result);
> +               hantro_job_finish(ctx, result);
>         }
>  }
>
> @@ -127,7 +124,7 @@ void hantro_watchdog(struct work_struct *work)
>                 vpu_err("frame processing timed out!\n");
>                 if (ctx->codec_ops->reset)
>                         ctx->codec_ops->reset(ctx);
> -               hantro_job_finish(vpu, ctx, VB2_BUF_STATE_ERROR);
> +               hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
>         }
>  }
>
> @@ -170,29 +167,24 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
>  static void device_run(void *priv)
>  {
>         struct hantro_ctx *ctx = priv;
> +       struct hantro_dev *vpu = ctx->dev;
>         struct vb2_v4l2_buffer *src, *dst;
>         int ret;
>
>         src = hantro_get_src_buf(ctx);
>         dst = hantro_get_dst_buf(ctx);
>
> -       ret = pm_runtime_resume_and_get(ctx->dev->dev);
> -       if (ret < 0)
> -               goto err_cancel_job;
> -
> -       ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
> -       if (ret)
> -               goto err_cancel_job;
> +       ret = pm_runtime_resume_and_get(vpu->dev);
> +       if (ret < 0) {
> +               hantro_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
> +               return;
> +       }
>
>         v4l2_m2m_buf_copy_metadata(src, dst);
>
> -       if (ctx->codec_ops->run(ctx))
> -               goto err_cancel_job;
> -
> -       return;
> -
> -err_cancel_job:
> -       hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
> +       ret = ctx->codec_ops->run(ctx);
> +       if (ret)
> +               hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
>  }
>
>  static const struct v4l2_m2m_ops vpu_m2m_ops = {
> @@ -1292,22 +1284,40 @@ static void hantro_remove(struct platform_device *pdev)
>         pm_runtime_disable(vpu->dev);
>  }
>
> -#ifdef CONFIG_PM

You need sperate patch to remove this. simple remove this here may cause
build error or warning at NO CONFIG_PM config

I suggest use following patch do below thing

1. Remove CONFIG_PM

2. Use DEFINE_RUNTIME_DEV_PM_OP()

3, Need update

.pm = pm_ptr(&hantro_pm_ops),

Frank

>  static int hantro_runtime_resume(struct device *dev)
>  {
>         struct hantro_dev *vpu = dev_get_drvdata(dev);
> +       int ret;
>
> -       if (vpu->variant->runtime_resume)
> -               return vpu->variant->runtime_resume(vpu);
> +       ret = clk_bulk_enable(vpu->variant->num_clocks, vpu->clocks);
> +       if (ret)
> +               return ret;
> +
> +       if (vpu->variant->runtime_resume) {
> +               ret = vpu->variant->runtime_resume(vpu);
> +               if (ret)
> +                       goto err_disable_clocks;
> +       }
>
>         return 0;
> +
> +err_disable_clocks:
> +       clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
> +       return ret;
> +}
> +
> +static int hantro_runtime_suspend(struct device *dev)
> +{
> +       struct hantro_dev *vpu = dev_get_drvdata(dev);
> +
> +       clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
> +       return 0;
>  }
> -#endif
>
>  static const struct dev_pm_ops hantro_pm_ops = {
>         SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>                                 pm_runtime_force_resume)
> -       SET_RUNTIME_PM_OPS(NULL, hantro_runtime_resume, NULL)
> +       SET_RUNTIME_PM_OPS(hantro_runtime_suspend, hantro_runtime_resume, NULL)
>  };
>
>  static struct platform_driver hantro_driver = {
> --
> 2.47.3
>
