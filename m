Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010021.outbound.protection.outlook.com [52.101.84.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB95402457
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 13:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781703223; cv=fail; b=VXT+z3o2emLOV6kMbs0wjsUiDGtGZfcIkZBV92dFtmd2hxjcP649KfLVjlbMd5CAHclBKixoPC/rNTHgzoW8+a5N3DaRxrNrTBCstOCCzPLEk6Kul3R3jEyZstZkD58he8sJMN5LKoxuPOM8+RlfEh4zxcSh13NXQRa+40sutGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781703223; c=relaxed/simple;
	bh=zxOkg+TbnUKYDEsaPC9V5GPSOVUw0olReKdyRp0+qH4=;
	h=Date:From:To:Cc:Subject:Content-Type:Message-ID:MIME-Version; b=ugqMlGDA6ALOrnOzvYIxt2J5zMmDwTadFEBSyispupWbH9TtwqaNXEuIDXha0168QYb9NcSJga++8/wMVEKp3t3WYMSNWj267/iq+T+DCvm7g6lkhOX3o6xmfGMzFAp47wiSWxkb1OFEsKlBctt45+Yc/Djd2NSj8a4jLV/Exqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qkOihpeS; arc=fail smtp.client-ip=52.101.84.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qkOihpeS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FP22H7vrPNAey0MfqTbE8bR4Q9G1CtjJqOgDT+8FgMBU5keFMZ86A/NDc5zIxPhZD1zNafCZWlyYNWCU+EUtT9XXYdRn/7mBwyJMfhpJRF0AjbIkqLLwhiFTECyteBzsbnE3xeEdGTYZKtA6HTCJimGmbqusBU1tOa/mBd8qEysES9DSjkWJKy/0cMqt1exkbEsm9HwUe9nn8ml43/ZHNTIl6T2dNSPgRQSUnAyXwIqG8WdNzTlQ7P5IPi1EzjYeEHeX+7TSIY4Whl3IpDQnhar+cIpXVEkSrOB5l1Hpk50v2ku6SE6PMC1cHd78nkVlDKP0zhMRCbAL3miH+eqz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jn73BzeDd/dMvLbNxsY2lC4hjIYX4cMZyjBsIMp/Z68=;
 b=afSZO0yqfibWopyDmlCJkhKR14rIftLJlfmCSC9ViyIa7wBFJgk8iDe6n6qpDTaAYaVT6n/HRfvICQ7s5a2e10H2q3Styw02O7l8I5def8Hq1Kzo8OozkfaOzZNQF6pAcOYu1iq5Oc8Yb9gMjZ+FTCCd0VCwmoV+57S3hMB3i0BFnxPu35skZSvoOPZlyhkgNX+3XL7Pax/+ukMbC9qCmvY43lznCnQkC4znxs6ibW1lYYCL9rIJQb2dAm6P0OExDewUGdVVRG8KDwz1VI29N7AEknjDb6XsQvI5YmHgrBLOLDPSNdcsSKzwAIUJfV1XT94YyFa4u7kTbC1UwLGTxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jn73BzeDd/dMvLbNxsY2lC4hjIYX4cMZyjBsIMp/Z68=;
 b=qkOihpeSy4RFVYVVdRWsja9N3/AFGwdGsf7oBDhPKt3pWdSeisknxEL2w/kCxuyibuoGdzqGZZiXH60ML7ri44anFQzPtZifaBzhhTwWfybUBZS/4G17YKM9VHk4fWw+twO9M2jElyBCu1TmXALW9xL+g46DJkwOG979oW5eueNretNWtE5btH1Jadyue/87wsi8ZL1vO391PfCIWSRq5wtohighLOgRbj3mViJOfYM/f9/l2q9l6rs3JYG0j03O/u2ec7od+sZnn8bBCOLPWmZOnWzOOPOva28wEY5h3tidatDKek2RO51F5/wgn7vhIakozXL7dP+2NU8wRG5h9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by DU4PR04MB11859.eurprd04.prod.outlook.com (2603:10a6:10:61e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 13:33:38 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 13:33:38 +0000
Date: Wed, 17 Jun 2026 21:36:53 +0800
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
To: guoniu.zhou@nxp.com
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v10 4/4] media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Message-ID:
 <GV1PR04MB115139D90CF3E5A8AE2BED6FFBBE42@GV1PR04MB11513.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|DU4PR04MB11859:EE_
X-MS-Office365-Filtering-Correlation-Id: 9892b5ed-853b-43c0-b509-08decc75092b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	wKQjB48KrynaAvHaoUwFMf57vl1Cj/GixpmfllA6urp3przwzfsTqlCzO6GZFB9ZFPusL7l6vncPVEvaj7PgHEUGeBPqaNvWfP7nra3x6Yd5h/goEusRRmg+Cq7DutlVd67KvTWGjG0cINnXcUYomw8gNZ2IQJAaO04Q2JIzWZevZtWN4C9MvIevc5lS7r6GOvMm9anxSI7xwvisXq8XV64PEbdIDlL5O9j+hSfsWXdZ0NSP1kMQk+u7pzNOVc/CCzDcgtEvPU94+F8Yu4InymVh5B4uWnaBOgW3sC8FZbcuUmu1ogEYsLMgEHgr2X0dEZA+qaQSNNVia7tK/3gNPFfGNIx5D3FjNdqSAluL2e0in8MRNwaYbWAgf2/qxZrALYN54zac7gaYJz9tZJsV0F4zg5OHIaPWgvNRzcMrqm/LcwUMMDIclTbkmL5oSy+HroA5HKgrgx98e++VUMzsWHJ2UHo+PTIg2NIqysjD0QhpGeXj9/0GnKvu+VhnR+sxyXAkrvr2EsqfGN1j9fEyJJHNLMXo7v65tbbCqA3XuCC0VeqF1gKaQI4ddeVLhtGBFE5hKDcl3N8SljAbheNj6GV9PdRPxTY5WK7nWdVPlp8Q3BC1yXMMQg0ZXN614fl5wT40l68etuvlNWr4hnGqjkANTxHIxw3Hi68oFS2gZiVnGw/BvBO8wkj30PGtlYjQIiz6nDGMYhC8AkUFBkmBhA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kRIf7zfstcGbnDg9KmAeqSj4CbobEIzXiWnYI5eTU6JV1NH99asa/DKGj7Qa?=
 =?us-ascii?Q?muZdreY0qkdV3h5MrXLvds5owOJRyNWIldzDIMGf5dcP5aUCza8tSbpD5aIW?=
 =?us-ascii?Q?+krm6zNoY6jhQcFjRTseq8SaYW7GsJCOJWP1zDn/0GqEgJMXoSl06INtp4s1?=
 =?us-ascii?Q?5SLK4yF74gkTgdOO5vE+Pnglik9dFfHuXklnYuS1rEC3PuUzF7fWL8SuDNZv?=
 =?us-ascii?Q?GtUFCRHKdV4OO4ELM1Feyvuq5F3CHKre1Pq8OaO9gaijk4iA9gSDXqUCIToy?=
 =?us-ascii?Q?QUV8Afmi6oOEO6wKKNgjXuHR1JrW3DOIQnWEx3RAOqLLDQ+6grjvSzjm3liK?=
 =?us-ascii?Q?80uOya7q7i6DA0RpUjXGxi5yMI4OzTRIn6xi8sK+4CINC5MDGKdZHMdHpjMK?=
 =?us-ascii?Q?u14jy6fA4zUJkEOMS/Rf/W1XeVWPKWBPtnNNndMpWwCXrI7PQAWpYxu50o+7?=
 =?us-ascii?Q?KmssPMea9wGK7gk4SbyFbZErsah09T1kj/Gb9v7cZ1xXfu+Mh0P5Xb4uotlK?=
 =?us-ascii?Q?MHJq6ledZ9cAyVf6hAMMPhv0IEEkVEnuaibX1VOGUPw7khKf3dMYQzvQx+ob?=
 =?us-ascii?Q?zFp+wALHCwVAa0IJbf0hGiLCn+RdfGhINARBOWPPIYZgjWnZOeSdFd84UKap?=
 =?us-ascii?Q?y3zE8R+3ChGUhjPe+xincTJ5p31vTcPPE25rGyJarnPj4HWvlBaqqmFVIpOK?=
 =?us-ascii?Q?v0+JqbnMpeDTkd8BKvzyJFBzU+uy6P0/oyfBK8Mg8BrVUJhWbKfmQ1anw/nY?=
 =?us-ascii?Q?mz3FNNsW+/56EA3PPZK53joaIGPYForPQpWbNCa0GbtVsDIN9r0slI0xriEQ?=
 =?us-ascii?Q?hT4Ap1+eQRL+Hvizid0VM0NkUNBKDZGvrPCFj8JM43YTV4jVr0YiFioCH8WG?=
 =?us-ascii?Q?/TDOT9dgSyOVX1tO8m+W6cW4Mxyqykk29YW2Ln6ijSNRnk6cVhuWqLi4HZfo?=
 =?us-ascii?Q?GaZbeG3fVlrj7M+wekKkwZqoUhqrZCXVJ2d1A6trg9Dk+FyaRIPHk+QgAEer?=
 =?us-ascii?Q?M4+xfz9YYMKdwH0+6h5DlciIhr2WgBZ4mcg7M0VOQn8524POT/tmLz8/AtNa?=
 =?us-ascii?Q?Da4ScnUL7xzWJKBvApnrlGu+q9JWut1BzTTVAE6CGchDEa/3sbtTYcppT4v8?=
 =?us-ascii?Q?DjVCjowWi6fAQBDE5ju90hxZuH1xplgTlvbSEvd25btNLrjxyhKEOfSTgkpF?=
 =?us-ascii?Q?m9zLSHQPywu0WslmbwcR+tQbEa12MUvdMNF6LVUWFSFKO5eqAAF11qKwKDtK?=
 =?us-ascii?Q?cmGguSdmYWKtDJfJLT/0qyGVC/qQq1lGGGdH5dv0Yj5GL5ksVMBEs+46PL1L?=
 =?us-ascii?Q?1K01n3DJuSPAXfr+DZpXe2nClXf2yBubINO2XRd+ctv9nR3ax1ya7kAFZAuC?=
 =?us-ascii?Q?fMFXdRhbKso1fQ5bTAdH62wVQ2nJ5rO0hTWGXms1ZjcdxgEJPgLWKm/9rDPV?=
 =?us-ascii?Q?puLfXeHQVbIf/00GPkQmAdU62KNL5vcXdDnUZmgdzGhC1M0zFe6PfYm1M1r4?=
 =?us-ascii?Q?UJe8yPYvEeS3A7uyu8qjiOm9lx9+yVpqSFjxRVezCE2YnZADbGd7B21MHzwA?=
 =?us-ascii?Q?ms4Mp/G5VOcl4pBYmGDum4v0IEW5ujjzqZamZ2MBrseKpwIcGizAWoIJm5XM?=
 =?us-ascii?Q?TBj960m+WoFnLCVinAEsLVXQ+La/x9YGthABlaj74ze+NxWYeJ5fD21unViw?=
 =?us-ascii?Q?r8kc0ocglX92Sz3QL7jVmriJeiyr9x21MzMaeZP/L3RF6LRbGwVHmrYTo/EQ?=
 =?us-ascii?Q?YGmlhAJE22kPJIpH7JWjpxwEPu8AB4JJOzUP6/qO5p2ONqb9Gz93?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9892b5ed-853b-43c0-b509-08decc75092b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 13:33:37.9030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFexP32SJVi1s4JwNi/Wqmc4r5umnqtNtbW7n+el+qqzxJ3ZY59FSoz5v0Q0vnsnZGm5D4aP1SbRKSky19yUurEcJzXZuArtxgNrRu0dEBg3LGWoO4ZYwMbX24LN880l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11859

commit b87cd0a71bef669634083e804de2130b52b0d007
Author: Guoniu Zhou <guoniu.zhou@nxp.com>

media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

The CSI pixel formatter is a module found on i.MX95 used to reformat
packet info, pixel and non-pixel data from CSI-2 host controller to
match Pixel Link(PL) definition.

Link: https://lore.kernel.org/linux-media/20260617-csi_formatter-v10-4-xxxxx@oss.nxp.com/

> diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/media/platform/nxp/imx95-csi-formatter.c
> new file mode 100644
> index 000000000000..xxxxx
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c

[ ... ]

> +static int csi_formatter_start_stream(struct csi_formatter *formatter,
> +				      struct v4l2_subdev_state *state,
> +				      u64 stream_mask)
> +{
> +	const struct csi_formatter_pix_format *pix_fmt;
> +	struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_mbus_frame_desc fd = {};
> +	u64 configured_streams = 0;
> +	unsigned int i;
> +	u32 val;
> +	int vc;
> +	int ret;
> +
> +	ret = v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
> +			       formatter->remote_pad, &fd);
> +	if (ret < 0 && ret != -ENOIOCTLCMD) {
> +		dev_err(formatter->dev, "Failed to get frame desc: %d\n", ret);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < CSI_FORMATTER_VC_NUM; ++i) {
> +		if (!(stream_mask & BIT(i)))
> +			continue;
> +
> +		fmt = v4l2_subdev_state_get_format(state,
> +						   CSI_FORMATTER_PAD_SINK, i);
> +
> +		pix_fmt = csi_formatter_find_format(fmt->code);
> +
> +		val = BIT(csi_formatter_get_index_by_dt(pix_fmt->data_type));
> +
> +		if (ret == -ENOIOCTLCMD) {
> +			/*
> +			 * Source doesn't implement get_frame_desc, use
> +			 * default VC 0
> +			 */
> +			vc = 0;
> +		} else {
> +			vc = csi_formatter_get_vc(formatter, &fd, i);
> +			if (vc < 0) {
> +				ret = vc;
> +				goto err_cleanup;
> +			}
> +		}
> +
> +		csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), val);
> +		configured_streams |= BIT(i);
> +	}

When the upstream subdevice doesn't implement get_frame_desc (returning
-ENOIOCTLCMD), all active streams are configured to use virtual channel 0.
If stream_mask has multiple bits set (for example, streams 0, 1, and 2 are
all active), each iteration writes to the same register:

    Stream 0: csi_formatter_write(CSI_VC_PIXEL_DATA_TYPE(0), val_for_stream_0)
    Stream 1: csi_formatter_write(CSI_VC_PIXEL_DATA_TYPE(0), val_for_stream_1)
    Stream 2: csi_formatter_write(CSI_VC_PIXEL_DATA_TYPE(0), val_for_stream_2)

Does this cause the later streams to overwrite the configuration of earlier
streams? Only the last stream's configuration would remain in the register,
while the earlier streams would have incorrect or missing configuration.

The driver advertises multi-stream support via V4L2_SUBDEV_FL_STREAMS, and
the loop processes all bits in stream_mask, but the fallback path assumes
only one stream will be active.

Should the fallback map stream index to virtual channel instead?

    if (ret == -ENOIOCTLCMD) {
        /* Map stream index to VC when frame desc unavailable */
        vc = i;
    } else {
        ...
    }

This would prevent configuration collisions when multiple streams are
enabled with legacy sensors.

