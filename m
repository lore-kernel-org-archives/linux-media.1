Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68AE41D64E
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167880; cv=fail; b=LkfGrrXoHOCeBxNWJf+wOYbGYc+Q6UeoYU8hdqOnLl8z9KXDqbT8S7A6TQYeFabL7pk8Ri06Ovk910ptTRnu3HeD7DOuoMbh4CyQ7C9DkkQm5rGt3MboVwi3tabTzbvXnmxrMeGJ3uave4wmoGdl91GoZxrbYABscl10Xr0C3cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167880; c=relaxed/simple;
	bh=J9ooYj0ACe/C71ytQWT+WvQajqWbFZI8RXAu2jLnoTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oK5MXdS1njf4vjlShNAjWP0FbDqileTPS+y2ZwuNX6NXNJz9EjeLHmE2Nhrur5BJW30ulwoR61zvHxPHmFsQoC01mUU0sSQ56f/2b6+eF7IVKdM115N2ns9gE+uPyyavEVMfbZ2cs40dqaV1cprZ4Tpyr9+vKiERY7UQfuHvaKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rbJqDePl; arc=fail smtp.client-ip=40.107.159.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rbJqDePl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7vubf75hqut7wVvLyhdCoxEfJr+psK0F1N5hmwwI3UtI8rODN4wbL/tGppAVDljSJNiWbEEoN6/JGviPq4m2uPDY9KknYun9n72Pq70wAmZwpm9i8yxvVhF/PtgaaTKvywnUJccbvKaV4rV4y80tXC8Y+pAOLysUlgeQ0dY3nxp08ba8bQgJ+crg479FSRotzX0ox3Yy45/0H2Ulb/uM30etsjgTF9kLayF29dOpugDBGE56wX4wEkfubEO8o6LBM3Vm2K04LupIy/kxnoYtStnc1LsySh3qsBWAsSnZ6AnhfDVHvHCjSSYvQTZD3U6zavJS4rVTG0F/0ZsM4dcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pU15c4jO9GNImrfoMLMUAxgT2Nq3WYjB0r4PJAGy+wU=;
 b=STPS0lHI7b7BpJm6KPKFPbh48PV9uazZZls5xAVaKYO9GgIIcsVyynOdDr1c3dEWWqHNVP5k1ofIMpDXdZbsMHVNGt4tVhChTmqp2fOnMIB8IwIZQ81TEaZlUBJtGvpLQqxm5u8H5pH8/3eIF9X5GufYz+tPPLXQvKck6K6A5eihgoUys1GNQ8SVtrvDPd+rSBBSksPs3ZGWz2gxjPN+vIM+0C+gt/aRGHLLT2pTXxomkt0r+nwy5GUfH8QKJoufqyQqMKvU0RHMzZRNEyi+4ZlY8SjeiTcDyDlgptIoPN5kWcku2nMF8N7ck6WZXKtLhcTSfd35XBggnYS64CDP2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pU15c4jO9GNImrfoMLMUAxgT2Nq3WYjB0r4PJAGy+wU=;
 b=rbJqDePl4BY/uQt8mViutirC8jlp+mORXc3i5MShuaYV9D03MIEsvYXJki9YKlwDMl43kwFIqfyXUXjIJ521Ig2co6vQx1SmJwksXqh0FFam3OJSUPTrpf1WD2fr/72zgyVWBbx7LFLAXiaBuZ/hYK0kdx4KdE7QHOL1EjXjdqIzgGLzIr/FlFQdUaJvB1YMOLRasJoyblR4DoF4Sq0+sXUxD5kPDfoJfs2KTz7ggMp6wDorFRXUF5bwSRqhqgPUreukSeM1/UtO9m/Hg5oNnRtuOLpwENxi+gdAsJl2qNiwyDT1QJkyAS3NoXq52S3GHBV7+bJ1zOzq/5wiF6v5Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7497.eurprd04.prod.outlook.com (2603:10a6:10:204::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 15:57:55 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 15:57:54 +0000
Date: Mon, 27 Jul 2026 11:57:48 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, Ming Qian <ming.qian@nxp.com>
Subject: Re: [PATCHv2 07/19] media: amphion: drop unnecessary
 vb2_queue_release call
Message-ID: <amd__MCXYrM00n6d@lizhi-Precision-Tower-5810>
References: <cover.1785157986.git.hverkuil+cisco@kernel.org>
 <ad98713850b578c4d304f2635a2c0a248a1ffb91.1785157986.git.hverkuil+cisco@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad98713850b578c4d304f2635a2c0a248a1ffb91.1785157986.git.hverkuil+cisco@kernel.org>
X-ClientProxiedBy: SA1P222CA0102.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7497:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6f2d24-d969-4e76-dfe0-08deebf7d213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|19092799006|4143699003|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	q9uPzIwtoE5Kk9ETD9As7oCc7XwviUfurUulIuUt5EzqIUPYQ8YIxUawcV5LLGJSFYLrFJ/8gtXQmBu0hPViBYRKX+trZCgeuqdxn6PKkj8CLNAe6ISpp+geUxe3lz5i+bd4xfdSskqCpF4akUoBfDfsvg75+7wXbTNi4smMRvy0Jz0JUYaA8vE+YJTUH3ugUOzgjy8XlJ2ibd9zCMJC05InMpSda7zbsR03gEzd8AEPKYLKVrAYM3yMjW8Ohsjs74aOhg+e1eG9i4xxdvUyhlTqx5omq6G1xbSHu0JVnI07e7AyqgT1z7OQ0+Ya4RG2Zzt/rSjXEnjY/zcz6XANqsn/QxAOIQWfssh1f/Rrjjy6VG1DJyyJSnvurlo+5Js0NvmmTwKJklIEaxK59Hum8IS45PPzG9qlNOkb7rPM7liGsq43Ij4fyG6HCcdmI1/ZoT6l8F4B7oz6ZcLk90Hg84k5+D1pEi60GbF6nscDS50GWHTQnpSdJtw8fVEN95brTlncvkn1K71kucIg14COE1WPm+XsjPVAaQbFMQsFtbC7GH6gmol2jq1lENb2ntRc0LUe413MEmMcaMSfDY5u14wDSa4yXVqK1vt4XlXLAoGAK/EVKEvryGT7mCyhfFX6al91uVNeMUlOPY8fTQ5Ly3rP5Gx+1HXKDqsskeNkhB4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(19092799006)(4143699003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7edQKjfF8u7QDBWkg2ejR9DRxYfiWyhpQvR9TGC/bnvzb9n4bAsOfkKu2iGl?=
 =?us-ascii?Q?/qUsmvgUTXatBen6uhFt17qLbrvBSQo+wvPL42wgOZFqfPYBNutP0fJEr2O7?=
 =?us-ascii?Q?cRRl2sbBp9HnRDiPdeQKrg4lq42q/CxvpP+uWjWc1dXfU3tVgZWufvorx8l3?=
 =?us-ascii?Q?QN0XMURchp9uKa3DHPwQkQS4Yz4dsDAqUpmsX45MpZUteGdaLNcXgtO7oJmP?=
 =?us-ascii?Q?SLnqY5NaOXZs+z8IKB7zGGAkZnDA8HqwNz27M582gQHXF4di1qQnkUpyvyU5?=
 =?us-ascii?Q?7QZ7ivTS74EowVBVw3ITY2p5rNTr5cSoul3eU9pCDtjOJ6Gz8bnvSUT3d6gn?=
 =?us-ascii?Q?k5xaOP/7RnNNQamSnrV59ESkGfSMJFaUi/SymbcqkwsnZH065IvG8RywAElO?=
 =?us-ascii?Q?E+fT4WNCGrUZyAhLb8scPpEYSS3fSAaIh+mpjBE/f/ebFq4W7FNKygH46ecG?=
 =?us-ascii?Q?a4QhNkiF2Qafan1bF7APP+d/M/yiIFZESnf/672KdZ1DFpGk0AqOGmQYqjff?=
 =?us-ascii?Q?OUsOy/5WJr/ekmIXn98JBpJqkm72kiGEvRYX3cU6+1jrf2PzIFLgqu0S019k?=
 =?us-ascii?Q?HojT9KQxvSs5j8fhMV4OTg7veocM9Vz081l8eRA7giEMueJyAoRaXxGn5EjM?=
 =?us-ascii?Q?Sr4vmk/WBMIWcxIWDOT8Un6DKQ9PrQfEt68FbcF3Q0A/64yMcFVWoO+wraVp?=
 =?us-ascii?Q?X1rt+R6DLwYKDTuoE2WJSzn0w7HIUBhPymPphV7EmUE6f3y/Z+vzj/ARIGPR?=
 =?us-ascii?Q?cernRWL/Cg9Qu+yZB52dPkfspmmv0XVjv3xCa2dfp9cK2GhzfLQCotTiwurS?=
 =?us-ascii?Q?I3hqzE4nX1Vh1GnefjFzEiKWFbG4i7Y8ijHskNAByeQR92k9cRxcRtQBXubP?=
 =?us-ascii?Q?Xf+9pfR8oZrOTHseVu4Cx1NeUxWZkg7oW7vgpZSaBoNATmFGgMzOsbwb+MEw?=
 =?us-ascii?Q?zNMM9lxdej+3wpwvqU6MgjcRcIwj58aRApKoBJYYUu7G3J9ryfeuL7e+zJN0?=
 =?us-ascii?Q?igNq7jxC3YFdgMSRebG5irOzJ6Qw7jKU8SS74SO1h8KR7c9k9HFxTuNTPdvI?=
 =?us-ascii?Q?ELC8uh3A6nwblJaY91JPZNCFkZKtF/mRUY97HMlRdNm+6NBmkMn6+j9eDQSR?=
 =?us-ascii?Q?9DW0CR5QcZ//zQuvytEsFyITOUgHgDBIKpTPaIsziqwk4IVhsm+JiLddM2NW?=
 =?us-ascii?Q?13YZcRtJK/AmlO/tVAJUCorsOvdLCxaK+6/ZhQ9NqVLcurz3Nq+QmNaH9tei?=
 =?us-ascii?Q?N37XyZJCyt31K82kUWUFKU8PhY1tKsUc/u0nLIzu1/rp/JbTPQEo6AmFK1sj?=
 =?us-ascii?Q?DGSi0UiuewtLN6l4EN3FZfFmQCVH0defkzJdAB7cFu3lTqvEkvpvfr6XUTXr?=
 =?us-ascii?Q?amHJz7HRxwxOJWEDnBRkgDf0kYA3NJOWuOAKYOb1TBN5y294DGO9tQO9/9Br?=
 =?us-ascii?Q?Jizc7sVLQ5A1FHsUv54DqRdoZDuTEtBYGrDAnIP6wN8WOwEwzBSl+DJRgRqa?=
 =?us-ascii?Q?5sKhCOq30C1zo+LD/m172L3ETjn4XWJLhjKFyKDU5ebQiLL7XrUI8oKUgrum?=
 =?us-ascii?Q?8BETi7c3A0u8OlWrewGF8ayOJDYZpvGNrcjenzQaF9iXuBLe3WRoLix1CIB8?=
 =?us-ascii?Q?i6Wrcp7MZ4B1b98TGAq8+f8HISLPGzRQRWJdnn31Rt0Ia8Jyxu2OZunIodrK?=
 =?us-ascii?Q?poMcYZcUDB1R+XI6WwaXYFItvR8G+LxFK1YGBCK8oEKKH1llYKduwuPpa+kp?=
 =?us-ascii?Q?NteGZ6b4hB+9UZ/xaKaOSi4RLb6Q5a4=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6f2d24-d969-4e76-dfe0-08deebf7d213
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 15:57:54.8865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAG8CVvPE17gnUl9pmuLy5BUPOKMu2ZcuOFXG8kSBAEhTrb6K/Q1f9yf/Kh8h0+fcCJIqx63hBj4WLnfSJiYJvql0T9BhyMHEOKjVSIy6WOcpifWCNrJvGL8JjGeh/OM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7497

On Mon, Jul 27, 2026 at 03:12:54PM +0200, Hans Verkuil wrote:
> If vb2_queue_init fails, then there is no need to call
> vb2_queue_release.
>
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Cc: Ming Qian <ming.qian@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/media/platform/amphion/vpu_v4l2.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
> index 7cccc994fc50..af03cb82e9d5 100644
> --- a/drivers/media/platform/amphion/vpu_v4l2.c
> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> @@ -684,13 +684,7 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
>  	dst_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
>  	dst_vq->dev = inst->vpu->dev;
>  	dst_vq->lock = &inst->lock;
> -	ret = vb2_queue_init(dst_vq);
> -	if (ret) {
> -		vb2_queue_release(src_vq);
> -		return ret;
> -	}
> -
> -	return 0;
> +	return vb2_queue_init(dst_vq);
>  }
>
>  static int vpu_v4l2_release(struct vpu_inst *inst)
> --
> 2.53.0
>
