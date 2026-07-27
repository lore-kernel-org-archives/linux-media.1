Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013060.outbound.protection.outlook.com [40.107.162.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F9F34750A;
	Mon, 27 Jul 2026 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165525; cv=fail; b=jaD1/RnIJ+1Vr5fmgQdpb5AqcIQ2qUpH6NGgQ0t2pDOPDipk46BDAPP83ezQnIerhJIBKtBRidI6U0lI3jRa5vIBwtHIwlXNyoTB9N+P9g+4wYHwLR1kOS1BTIJAuRc1dir9EeqSSoP45xgioUS1A9XDBe2N1lClfBfoBs+ZFuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165525; c=relaxed/simple;
	bh=YLFOR33WIzh/sTaX/jgdJexBo9g3h2G6zB5Ent+nsF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uXXPOGZ32KRQBEIwSgCf3l1vWbpUl0VkXlRBimlb9MQklern3vlDEgObZYcHlmctlpuO9h/auHMgvFOENc5xQk12sdXcol3V3VCkFu2PQZs97oVDF1HTNVdLCYiAi6Im0IJ9y9yTEj+wf1/CtNZPc+AZnFmjo39qTj18RnKEHUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=M1QH2q+S; arc=fail smtp.client-ip=40.107.162.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="M1QH2q+S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpTofPwefvlhVpq+pZ8YzQO+D6vtkwYukBpu+OLN+C4dDw1pzNBA43itiN0TsndZVPVC6cB38K9MTJ2zqA+KIfff/wOVmkoSWGE9arEZZHU9b6lm7yAGb7skJDXdK9X3/btgT3YcxyKK95Qeh/JZA5vCBhtRPBg3dpKjD203AmkTelrF9iul02+COSd+toXkMiXE8kKD5wXHQrjw/FDXXSGojKIF+o5RyMjquRmD09qR59bH+S7r6Ie61Cse6CIfkGHV2QI6MXMNmd3StfYkk0P3niudrmHky6COcM/cG/I6aoj1O9FURQJdbsEZrID7144fxUencvJp8dZ5xuXXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9pt0b+TDbm7q//eLZdpRXXQp6kWgA1UWd1e5dvCL8M=;
 b=iP9ozPSG22j3gnQjmRLLMMcr9U5cn3CSbpG6CorqOoXCAqdmZyczS6jGohPqFphkY6Huw2z7bK1Qt5c2klmZw4LF5Ujn+vqFG8Y1O66Qj4Z6JhQYZDQD0CSVYk9mWwXKiRmpvsumLjSVoEphubGenLxfZrvxfPOArzbILtgHVQtmpHsjpYwGCElw/8Mou9Ip41dggtxhK+1N/OwyPvWiJZmkSpNiIZRf3yUVzElMUqlKhLcbQNMP3acD+UKdY80VHI4vH7AnQkhdKjydsPuUp6mmQQc46LrmDwTWC0Kxw+EJMoqEg1iyYeJ+rN5/r6FJEIBKyOtgiEaDtCLm0RDEgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9pt0b+TDbm7q//eLZdpRXXQp6kWgA1UWd1e5dvCL8M=;
 b=M1QH2q+SPSm4Zvyc+QwWJRchbOHHdThEcQtJi5zTV64muTN3Qgx/rQ/VcTbNosWlHwfVTtlWTHp/Z5WGonELymXC6ncNWIEqYYbskQDrAA98+E9wwxhxxFGSccv5qlXulQMt44ruT/2sodWPgwItnKXsoUO2DXsDR0hPIEm8X5ciBZuA0zzTCa5Bih1t5diL6f2NvRkWH5hXpyT2ChrNi+pLaLzY7b60/W6pYPBSQg2gH6Pl4Ndpe2kNkO5ErSdkQTk9sWlqBQylQ5FY3Tt2gpcN3tUHEXhMG21gpTFbRJVc4V4a2zKvxx4/PF+Bc64XdNBxWMAdCX1jADF5lhHDdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB10016.eurprd04.prod.outlook.com (2603:10a6:10:4dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 15:18:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 15:18:39 +0000
Date: Mon, 27 Jul 2026 10:18:30 -0500
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
Message-ID: <amd2xoJdT5VffcoO@SMW015318>
References: <20260724131208.2315-1-tharitt97@gmail.com>
 <20260726024243.730-1-tharitt97@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726024243.730-1-tharitt97@gmail.com>
X-ClientProxiedBy: SA0PR11CA0146.namprd11.prod.outlook.com
 (2603:10b6:806:131::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB10016:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ebd7d5-8cf1-4467-fba7-08deebf255f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	L+6sKWchwY/bVB5z/7K9Ze6zhjwxFutu5BoPrSDIW/9uEN7hDqHIwPUfEdRMqn1oL1b1xQLNQwn+g0C7TCKSp8udeqpjN7Ht8TRI0N/EdTJ/WaeCieV7KQlLK1Pwlq15tW5a9kl5m7H5ivFLKIYMSLXQ3RVfA8GaQgNw3pLlPpW/uLK5GFxJgy8i+2wV0yo+Bgb1UF18LTUtiEYUbBeyQIlKdMjLZYfPkIqEquWF2bIbZ1/IpE2nBAHJ5r5yi+gudcy/7+Zwheq3QIX23ITzPrr3GtZSdGb1biTKBYVfB6G5upuJUpGbHvfnhnOCymIFfk9yw/XYn6/Wf6aeLY5+LqY396jV/b7eIC3Hisp6V+U91jc9OZAqikCtGoB3cTY7h7lbXPtpSYf3Lu2fVayzt6xZhKuMmM26nc9NU1Dr86tvNWidZFRa8/hmpmpSJShRbGxha2Nocaz9322g0ss0BZ1GWPspfXYgo8Akv/roVgo6DeRyUR/0yo3lXZqM9Unx5NejjOn4cJWYm1EEJ3smoXgK8ShanykBdDGlYE8/exUuZ7cFMPTrvIiygW3uLBUGgt9ll2fl8lYwgARoYfS2tB1rcrrNrjxeyfPZoyl36x3fjGGOG5RQ6BK8c8q1XUWJOwbybL9NSej46bBqyr7Ve7HNWxt4Xust8x6k4vpYzsE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G8111dwA09rq1RJ2BFf4Rp5Ka824jXKzj41NcT8U8SasHgUHlcLXBZ+cB8se?=
 =?us-ascii?Q?jzVJPGsFp07cF+OrZ62+vxwm0Gp2MS9UqWaQiCn50Drig9RJ5QrD7stiZ9B8?=
 =?us-ascii?Q?TVHOIhl+09ljVvpQejiMHkCqL4ksXaBk9pjAaaK5BWmylQuH2+5abRKbOmNa?=
 =?us-ascii?Q?ntdyXVjPVP2pn7KO9O2s+fiXRcBfV+h+0FLFrpMKVhQgT0wnRruH4HLzhD2Z?=
 =?us-ascii?Q?c/tuHsEgmhWa++gWb/3fNrQIdNib0c4XL+y3VDWcdztSy528730WJyGuxgJv?=
 =?us-ascii?Q?5NN5XeavA5zirawro7t+JIrUtJlLnTR3wrwbcz7I7M5TqjZCedU/SY36FxY5?=
 =?us-ascii?Q?x6tWWLHMc4OAzLM+1+K8eVFk32/r2xSSu1CFHZQZxjXzxEu36NvRiGG4smHx?=
 =?us-ascii?Q?FPaihEcMYkywrvA/1vhDnhgl6wfbwSaiyYaG7KJf7AVDCouWw+DOPK6Ux1X4?=
 =?us-ascii?Q?GRjSQ6Xqb/lCNOoBCyk2Oe6SnfYycflD6BMfGu1zsOodaV6H5pfAba0T1M2K?=
 =?us-ascii?Q?t2KxfghQyk0+9Jx6jrGCmx2RqNy0s7S0Wat0/H6LKJvWHRU/a8EniIwPm27m?=
 =?us-ascii?Q?TsQgW2vuNG34uvoTr2WQFD7GxnsmLOM6zZpW0rUoVGmHdgs5MIuxh5pU84vJ?=
 =?us-ascii?Q?zsIccvvg54PLZo33CAJNASBNYRvYe8B6XEyuHAeuG7MF4GkNsw/pfEqy75kT?=
 =?us-ascii?Q?SkjS2/hGwOO+1jlQJRTG+L9kPpQWG6uG/psJuz9ki+MAqWQo6GC7k9Rw0Mzv?=
 =?us-ascii?Q?U3szdH1PM0d4vCtnZ7dKLSTWcWcKsj64k1pu/UvXGz5/ErDV88EqC+Kj/fj1?=
 =?us-ascii?Q?4ynra+WAWe3M5+IfMULuHl8bJodJRJBuc+1YCDPhq3nkjh15boB/3brZrYaw?=
 =?us-ascii?Q?3E/gACEvIo8yCI9dOmeX1vDruQgiKtqKYnKcFzzUNvzagdt5gq5bS+GkXumj?=
 =?us-ascii?Q?N1DH+0IeSzi6RzPbdmrmw0FVXUszTDvfpfdobg032S+/fC7zzyaBd1LGfG41?=
 =?us-ascii?Q?myRbkmpqfb2mlHapjAOKyiYS2L++ZncJ0aDQus9Y2djMEKp/bZ3ISDL8wrpJ?=
 =?us-ascii?Q?pe3ZgvEpO1/OzekeBseBz0x9Swf/nCvhTGvYfnKq6oCNNwoGgtbUH1Ki9jqe?=
 =?us-ascii?Q?UF5Dft8hI1XdJNXqLpqD9QtK6vVTWGTE2hB3F4KdXg4ZEH8NqFzSYRhPFH8D?=
 =?us-ascii?Q?cnLp4UyYqgsyO3PqxDYWRKAVb0ch7V1Krg+g9uYV5+hXlMEGpNQU3IPB/2UB?=
 =?us-ascii?Q?NgAldq8mbfj1VFUgzL05X7Z9Ma1eRqwTKHVB8oNteNAph3pS7+bHou4PO7VO?=
 =?us-ascii?Q?Mjwjv4cw14gkMwVz/27+mPxvW+YzUQW+qmjUu+u/8ocYu/eVC34ej3SP7a/g?=
 =?us-ascii?Q?jtUDur0SdTpW5lQPoXiW5RJE71Pzdf+mIBzB0/9neRbnsI0IoEe0ABtAbL4Y?=
 =?us-ascii?Q?FZkuGGtbAq2eq5fTNO35fAM/WdJY7QKl4eed+kaFxKWD6e5xDZrvfy3N57ic?=
 =?us-ascii?Q?5RDzkvyrrXAxn+PGHCCK8lIvEKgAIo9+cgKFFKoAOU+f3EnYr5gS8VY1XAex?=
 =?us-ascii?Q?VlazJx99XGOF0bP73wcQJpYv1shqt18Hh8PJOZxZJVPWmzwTrqU5uBhVkIr3?=
 =?us-ascii?Q?kwsaht+MZpF1JfQt4QF1TrUdA98oJ4RokXWdq/4spjfOfK7bZ0TjkqVdSlne?=
 =?us-ascii?Q?97kLoFDmXO0qYkT+H/XwB8xCwgmC0aivD6nyPrQjYeCke55xh0M8+54eIkfs?=
 =?us-ascii?Q?L00kq5bh9hXMa8pRaIBaTzviU5ABhkXxa5PBSPJDnwK0MO6bFCW3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ebd7d5-8cf1-4467-fba7-08deebf255f3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 15:18:39.3113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99Eb4XlzFYn88bJgTRayPzW3qlmJhYtbWPoJ5dqqJcBbiNwFUdXjVY5gnewk2fH7xB+A744GtaCojqUG0KeLomgmhc0cIFXvWUP8Eb/qjn7qJdIcWVCAv+DtM0KXI3cU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10016

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

You need convert to model RUMTIME_PM_OPS and SYSTEM_SLEEP_PM_OPS

pm_ptr(hantro_pm_ops) at below hantro_driver

and remove CONFIG_PM first,

then add move clock manage into runtime pm management

If you remove "CONFIG_PM" here, cause build error at some special config.

Or keep CONFIG_PM at this patch, then convert to RUMTIME_PM_OPS() in
following patch.

Frank

>  };
>
>  static struct platform_driver hantro_driver = {
> --
> 2.47.3
>
