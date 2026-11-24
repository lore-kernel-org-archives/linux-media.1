Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795498954;
	b=WiB7WYwmoh1xYLc5OuSib5E3v2D0zKdy6jD8a8lvSNHrk1XqjaAgbh2E0wLdLuX6CHh3
	 wzb4fB7d/utid/V8pcq1bWjA1rh+qaIzQtnNLpbKiZzxGgMNWDyjOTAvQD8kmwzKUO8hy
	 ajhDm2+xTEJ4sVXifzyh3mBSRZ6cyiUebsdb070b1wDPEMkA353JtdN+cYsFtIaYdltqb
	 tzT17uCfEmJ8OlfhOqt126u6DuiT82YxucubVWjKM2+DsuZn3XoExWM5zrt+x+k9TDKrn
	 6vGxtsFk/Kg8qfyDLclrCk3HeofHTfnHYG9Ol1T7CwCQBpIupRk4rXeJO1fvPFE3fAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498954;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=CsEkjb1uWfW/tcjvaGqkhVYdKeGuCnwy7Bq5a8rpit0=;
	b=l2jD8VA3NnqyVLOYeIo3eeXZHbQYzKgfAedip3ffYP2kXOq+rXZZRrnV9Hvyl7Aa7W6k
	 dHzxskrsvLDbBzdeVrQLu3nlmHFmdhT/xILuFjBYivxkWz0KUjjUUCepeI7rpRrh/0Mit
	 QD40fiXYHT923Y7s/UDGPcLyfe+Kq57ulf7fj4KqwnxUTe3Xt+YY+9ff5kd4T8jqjt8RL
	 yUFyJNVuD5JU+SIIQJTXvO7tRgUqHfVeF4lXnxOyLeXObmSf/BlRYeh/VwAQeQIuAbXpd
	 mOYF/MYyvxDkEgnkfj6RR4DsXf6lfwo4InF/70pT4RbIFqY3M/kARCNg764BMmf741g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZBSMcK7d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.56
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED703606A31E;
	Tue, 24 Nov 2026 05:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED703606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZBSMcK7d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZN2IIjGzJ4DMoX6b3qIPB17WUp7iT9TH0JNRXax3ZAiRt9SX6MDjRSFtYMnmAUWJxFwv3M+Vig299oYrOWtDsSOX8qXMEEUDFwtdwE1CiAhm8/RjmjdRV36uvCE4H8WrB7geUX6Q1O/VUjl3xQjUnEjqd8teUeX82+92PXZhgOnu39nCbfWJN2byn8s87PbA1qKpRdobeDBUCH7mZ18hcOGv/BWNYMC+n1ShvvJQVYQ8059Uxb7T7WbhVQzsfBium+9ezmlmbRID5DJCuu2N5hD+45XRtZoVS087Yftr7IWxW0r8Ci3yAqmzLs/7WqZrucZYRJibmDoH5gXh01AA3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsEkjb1uWfW/tcjvaGqkhVYdKeGuCnwy7Bq5a8rpit0=;
 b=y78MTYdGHnOXjnFGN5VngTdnE/eDs9AE9QClbHzoiI3f5lYrqucACsn4unlTIxoJ+hbGHUvCYqg4/shRgxmdaL3FOb7Quxzng0r1r0DpaABeCbxGhC1XGklhAbix9PDcTF6LkHOikHlKgb3TE/etxq3pMBd5KIhhVlV9eHoOR0VVW/qOKjLIrSwUcx5FpiyNaNZoFKv8uRbLFWrkWYsr5Oq0uT6SRCmmzcQntxtyCjqzz9pAX7zLBM/BN6Ow36tEpWJ7bC4FLFnA4IbbgBKpznaytcblSDmH9oXHIlcuM50lkIh1Au7t3UQxTUBrtbC7Ji6AemPBkSf2l7VbRT4+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsEkjb1uWfW/tcjvaGqkhVYdKeGuCnwy7Bq5a8rpit0=;
 b=ZBSMcK7d7IKh5d1UhbykEqR0j9NCZ2AbVHnZZ+ozSzwc2pZ3Ml6849tbpGIHUU0icaiKpGwJC4wuF1pIhRmD/fpte+ZpEvDF7+J110H/77pDUqKRoX7JetjfNpo63ihDtr0Q34yzUGGc7t24u89jUY3DIS0Y3eLplY5X0wOvyaz4ueqvJQ+uzcupFq/rtNmnPiOESbkgBBotdQeVoVpoW2fR7JEruqLOUNmt59DFd7swVoKvNwMujMUvdrd1KUAoj42dKB4hiPMJ/GyLRwQl+rU7WjK6uQlCj/SPXtIPzOxS99Fmk1S99pTvzSNXOMaSx3Xo/GWkGb5gKYRVRqpA4w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB7PR04MB4698.eurprd04.prod.outlook.com (2603:10a6:10:1c::21)
 by GVXPR04MB11480.eurprd04.prod.outlook.com (2603:10a6:150:285::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 05:42:28 +0000
Received: from DB7PR04MB4698.eurprd04.prod.outlook.com
 ([fe80::c571:bdf2:afe7:c03c]) by DB7PR04MB4698.eurprd04.prod.outlook.com
 ([fe80::c571:bdf2:afe7:c03c%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 05:42:28 +0000
Date: Tue, 24 Nov 2026 14:42:19 +0900
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Zhou Peng <eagle.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, linux-imx@nxp.com, 
	imx@lists.linux.dev, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: amphion: Enable non-coherent allocation for raw
 frame buffers
Message-ID: <awUiZWa4ZTMhFeVL@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
References: <20261119-amphion-non-coherent-v1-1-c3154395e448@oss.nxp.com>
 <awSn9NyulPPPIIT8@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awSn9NyulPPPIIT8@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SG2PR02CA0124.apcprd02.prod.outlook.com
 (2603:1096:4:188::9) To DB7PR04MB4698.eurprd04.prod.outlook.com
 (2603:10a6:10:1c::21)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4698:EE_|GVXPR04MB11480:EE_
X-MS-Office365-Filtering-Correlation-Id: 166f792f-f23f-458b-bc16-08df49edb9a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|18002099003|22082099003|3023799007|56012099006|11063799006|4143699003|261102123227099003|261028144727099003|261009223027099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	UiTJw13blnX/rNfxuivPwa5ugGSCLk5L9v/6ncD9osvJUMg/yF+OUvVuHCIOKpyMnVFupUiVxB/RSRje+G++Nv3bstnlalsb5uB4esps5635YDWSGHE8PI/VIBq6ydRqFikPDx1r0J8DInAQFFtf+OOeODQFcQqDRbmTiFQExBoygjKDbkZ5hU3fvtIthIFmpObG9FwLXiOTs4lEDiXBS3yWlZjr/F2vRrTJJ4i0+CW9d9+oePxQNGFJHfsSnkCVyImV6WxhuOkKDYahJ3uPqV4SMRMTbWuEq1e4fiMx5kpTqtpmZJbgPCUPNRyPmQaMRpWbEX5QRwXWAEToM1UeejoL8XO23gZJe29WCPH6bud8iPgtxCLrRXM6SCHuqEp7DIxjaHE0PoQ1euEKiHDIZ3ICYEtk1srNutVr/SYqxDmIv4HyyF1r6KiGDA3nz8ytR58Tvim6qO2tkATDACm0L1+vb3R0zJlsiWhK884AdFq33DJYMb4ZXZmir7OTzKsWS/z83xqXRulJtNyliy7XQ3fs5y5Z9w0qMCRcBI8Wl73hdya6Hi6zmMxh0r+ns3xZ6pudqhiwCp2EAPBzvzndl8RYfKX6PQGmrpkJtEswcx59SPJ/C031ePLFNcoQpSL7lrCjxkFN3OHCkToj8Auo5n/os1TCtyyn07EodVOlcys=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4698.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(4143699003)(261102123227099003)(261028144727099003)(261009223027099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y8YUN1BP0OQJt4+xuddfZOy++39jVaD5Sibppn4pls5U1+aeOFv0R3YnV2b9?=
 =?us-ascii?Q?QnOv7vnPTw1hpv78G3cAMl5CDkHswIo52pXNFPbl3URmBSudFTLe8/iAwXlr?=
 =?us-ascii?Q?7NkEKThFF8PGFtsUCVzC9S3m5tC+S19ypSI3PO0+fdyCY+37U4Te/OL+YQUl?=
 =?us-ascii?Q?97/AUiYpcQxr54T3SIvo2ilwMQcU+i45CPCAaantw6TDxATyVpk30WX+36Bf?=
 =?us-ascii?Q?yhvAlBcoxrMEZ9e4rRnMg5VQXyaskqEB4uk59bUT1exLpjO4cfOrWqOxDIZy?=
 =?us-ascii?Q?6XlZ23uyR1UwqkaGNNTsWzoMpxaZTHZKU8wDM1WC3lGR1vnEty6w16H/U7J/?=
 =?us-ascii?Q?+gcLWOLWTua/MYrLXJuwo8OwfrtSt4yvtnY4NdV/acTdIRY/NPgT4aRu6V4b?=
 =?us-ascii?Q?13+wHWBADYUeTw53l/5RfTInnOJCN/hJyheL23ueMtpVKuUV9sb79myeyASR?=
 =?us-ascii?Q?+74yRzEPmnFsJcI1bwyk1hVBfoaIMRaNvzIVZ9vPmEQq5jYoner0EI2OCHqi?=
 =?us-ascii?Q?sjjdj0NMw+yPKeL4vxeOrYEe5RIhzGxrcuIboczbq2Pb2gDytwevr7un+pFZ?=
 =?us-ascii?Q?+0nrcbxWaWihj6MLto6Kej7KviVKKyQdnNAqyBxk10M4qkETNQFJ5HFB0vPC?=
 =?us-ascii?Q?uCbxbblWBK92VXHO1gj2tQ9+faRUqoRzMFiQg306P6DDerec1Zg+Xy/Q7Q6O?=
 =?us-ascii?Q?rvfGhdMwmUUTr8bRBCQDhLub5CjfNAKiS5HSjugcO9JxXxIzfp+DhbKP6ORR?=
 =?us-ascii?Q?HTeEDAxyKbCVQmLw+3Yx4JzUi6g378Sztx7qFsm3UvAEhDr+mmdxytOo4uy2?=
 =?us-ascii?Q?xql2DL2g30BfWTaY/ebrWKuNfDLYgDQmKvz/FZqYkzm/qEKO7Mu5yd32knOg?=
 =?us-ascii?Q?YLWDmuoM+mA/kDEUlShTcAjGDy8kZHcMOd4FyE0n4mWjEbQKBRvwZj6zpxEM?=
 =?us-ascii?Q?/WR1TW2MVAlyK5qF8Cv43F64GfnvB4ncF3YdIVNjN7jStc8X6uNuNfk2r4qm?=
 =?us-ascii?Q?w1fs9HTs84LHOIal9ybl+Tdd0W7Syb5qlz36b6UD/qjpM6+xYhIG+USVlKem?=
 =?us-ascii?Q?+6oxemf+Q0Va1OmBh2F00W6mUg7zTpPYq1tiXXQPMjey/1HhLjLt8HL1HEhM?=
 =?us-ascii?Q?5GfuJO8JYsR+x+CT+UMg/4Bm2IIAHsXDS1fVITseC6GG4646kMCw6+y5AdSF?=
 =?us-ascii?Q?eLAVnSRhXnHrV1a+klxAnWQpkzZJci+UVMuCfs2GrrVV98tVo0nKWcvrQlKZ?=
 =?us-ascii?Q?vReB7SaCoOa6oV7bHnspFKVGlxdfQE0nkf0i1bPDzirj3m0T668w3jDsR15t?=
 =?us-ascii?Q?XBbrHiGLnfwxExUYBAcevkLWYw1r3/qnNYUiXHV4bPqbwSc3JypOgiE228A0?=
 =?us-ascii?Q?j/JzKb/eC5x2BirFbbVZ8tFS56/KboR3azOPzXsuilkYnkDST1zlhFd35cl/?=
 =?us-ascii?Q?5hDTyY7EIhInzfAyhtjnkDCMxj8zmA7Oz/I9JeWpcbzEetIrnw0NQNWC1svs?=
 =?us-ascii?Q?c7HXZ2foO8NB5SJuZbleY17W/3HtL83DIh8q1TAxRwYA+pxWMuYIUvK2WqCM?=
 =?us-ascii?Q?aeVgJzYNfR/uuYQf4eDak3RVmJU9FaVfftpQC+2h3zYzVvjIjXgJrSocjmF3?=
 =?us-ascii?Q?omsiiKYkfiOTYacqTW2cftClPQ1VXnxvlYZdIRcp96Cn9v8ZjWjT4EdwrTUm?=
 =?us-ascii?Q?O/zKn58fS4Vl37Vi6thOjjwRzKwlsdxyChtZPVQOA90UUoDAr+757v0rcHWE?=
 =?us-ascii?Q?SXqIipJ7DCz+3nCWFWuyTSg49W173B7vnj15ahyhEUlK/6p41Sgy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 166f792f-f23f-458b-bc16-08df49edb9a0
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4698.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 05:42:28.2630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joKyc6yGGSwafjgmqIYnBmJoeql7r4LqS4ifFJlleA72HYZT5hW68VVGAILU5/cbM2QQ38Ol5u4kBKpYqyijg2hAtHlaSjPJCkASBxfyiyOd0LEjHJ4JGoC9WZfH/nGT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11480

Hi Frank,

On Mon, Nov 23, 2026 at 03:54:12PM -0500, Frank Li wrote:
> On Thu, Nov 19, 2026 at 04:27:14PM +0900, Ming Qian wrote:
> > Allow applications to allocate raw frame buffers with
> > V4L2_MEMORY_FLAG_NON_COHERENT for efficient CPU access. The required
> > cache synchronization is handled by videobuf2 in its prepare() and
> > finish() methods.
> >
> > Set allow_cache_hints only for the encoder OUTPUT and decoder CAPTURE
> > queues. Leave it disabled for compressed bitstream queues, as the
> > driver may access their payloads through the CPU.
> 
> "V4L2_MEMORY_FLAG_NON_COHERENT for efficient CPU access", but here
> "Leave it disabled for compressed bitstream queues, as the
>  driver may access their payloads through the CPU"
> 
> Look like description is contradiction
> 
> Frank
> 

Sorry for the confusion. By "efficient CPU access", I meant userspace
access to linear frame buffers.

For linear frame buffers, V4L2_MEMORY_FLAG_NON_COHERENT enables cached
mmap access from userspace, while videobuf2 maintains coherency through
prepare()/finish() during QBUF/DQBUF processing.

For compressed buffers, the amphion driver copies data into the
internal ring stream buffer when decoding, and out of it when encoding.
Enabling non-coherent allocation for these buffers would require
additional synchronization around those CPU copies.

This patch therefore enables the option only for linear frame buffers
and leaves compressed bitstream queues unchanged.

Regards,
Ming

> >
> > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > ---
> >  drivers/media/platform/amphion/vpu_v4l2.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
> > index 7cccc994fc50..c8d52f0af879 100644
> > --- a/drivers/media/platform/amphion/vpu_v4l2.c
> > +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> > @@ -664,6 +664,8 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
> >  	src_vq->mem_ops = &vb2_dma_contig_memops;
> >  	if (inst->type == VPU_CORE_TYPE_DEC && inst->use_stream_buffer)
> >  		src_vq->mem_ops = &vb2_vmalloc_memops;
> > +	if (inst->type == VPU_CORE_TYPE_ENC)
> > +		src_vq->allow_cache_hints = 1;
> >  	src_vq->drv_priv = inst;
> >  	src_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
> >  	src_vq->dev = inst->vpu->dev;
> > @@ -680,6 +682,8 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
> >  	dst_vq->mem_ops = &vb2_dma_contig_memops;
> >  	if (inst->type == VPU_CORE_TYPE_ENC && inst->use_stream_buffer)
> >  		dst_vq->mem_ops = &vb2_vmalloc_memops;
> > +	if (inst->type == VPU_CORE_TYPE_DEC)
> > +		dst_vq->allow_cache_hints = 1;
> >  	dst_vq->drv_priv = inst;
> >  	dst_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
> >  	dst_vq->dev = inst->vpu->dev;
> >
> > ---
> > base-commit: 7969a6f407cf55b5254c824c87875452655ef11e
> > change-id: 20261119-amphion-non-coherent-f61009334dff
> >
