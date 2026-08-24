Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013064.outbound.protection.outlook.com [52.101.72.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FAF38F65D
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 20:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787604284; cv=fail; b=DSSHEhHiLSe3bR+9AzICrFDUjA63HlQLfOyWAM6wJE8m7aDbnG9lwvuItzpQctJ85a2i0KhPOlglKCo+aX/XfzWtKf+dY8U6t02MT14D1YDHisdSZ7o0kZ+sgKuEEY20nbEHzNicx265HjmU3XuyYQDsjg/Kz5ca4P0pH9zVaJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787604284; c=relaxed/simple;
	bh=7I064X6pz/uKaSA0VpHiPEhz3WgE2KhmxcMfkMfyAbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KGHdAVOXCjwO2MYIm/JyP7xTB5zs7Nk9nlW8VJC8Z8BC0DyZCa+pIVAQf2NMMoXQhEUF9KPDdG+WtIOlLc/Lo4b1iW+cVsMVT4sTRBY4Nqdr8XTZyvxsUUTbaBawU75tuvk5bCgozpdhtTSTVLbr/1ncgRF84vK74xd4Of/JrdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nr3SvAGH; arc=fail smtp.client-ip=52.101.72.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nr3SvAGH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsYRJCIXzr+/6wydA7HmdZFi/uNl+OK3Kwrn1QJFYi3EWJdREeQN7FsJVdJRMXzIDThY5dLiCJv9tj46DPDcuNdA+SXF1KmTXd7uzQfugRvwXXQUeq/Kz5gH7gEpRifeIBP/9MGDy5ls9izrf3hWG7Jn601mlXVI4TEZkOPOC1QKIVMqzNRIdzR6f+taR5OurmRF7Zxp6UsqjVnkQof4Ce7AqO7fvKFm5OOBpRMRLyZV9Ol339npKQtgdgankYD9RQZX5/3iZnq8336P1rZHWzaBYs8ybMip9IDa5K3X/B1ZtTz+AftJgkfsWy4QLKcR+42RX1797onptTwp2QnFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1BEHTVKaWhA14Jjh6sQTIkD6a4G8zyiArr6x+zvq5w=;
 b=mhA5qcKh/C/8HvUmaMb/Xw/vi1/ofWyzeF1cpJFYCNFXCqEChBjX9SXEjfg9hdVHSEffWhPCHv1fXKVJOTpsMExLpQzaK1VosULD6yNyNzupEoqldtWtGldSZHttuYhYGannX4iew8R2mOeoDXKCfOXCWYeY8uk8Za2v+EwoQ9kVXFVRugB3OS6iJsRfMZjwTekTfa/oaZHciPZ7VN1TaGvxM1qHptzxB6l/XO/cgczW2AxDEHOfyfsiKV38QxoGCcS3BfMwuXXKZQAqfHTNZghoYVBdn89Z+hMRdVWOv712lo85yjrX7hP93707auP1W8uuJW5qW/f/GU+3hxmGEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1BEHTVKaWhA14Jjh6sQTIkD6a4G8zyiArr6x+zvq5w=;
 b=nr3SvAGH+K3RfCbt8Mc7FmXAXBwtEcC8dRCIiI69KPO3HmPgZ+LDjmwQRtrBjBNqMVZThTNnbr7fJFccPW8TEFwheyT5KmQOYCsBIME5pM6c7jhBCcfpxKx+ot7TNeyTn3cpI4DQI3EI7qJS/YfrS98YQJl9pitx+/K4yPZykrPjMUpTN3bdYDJ+nGACoKq22v109jeyKIH5xqLSiUap8YmOf1IHuEQ7f0RGxAogEZjeT1iWyMS5V9RWc7XmWDNPCCy1BkDg2KGVZ3dLgXTS3MzGWksXHw9d7y3y62fmUqD9VWrKxNfbLG7ls9HDJ2BfFxjrIL82imJmlLsBeLUpLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10268.eurprd04.prod.outlook.com (2603:10a6:800:21f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 20:44:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 20:44:38 +0000
Date: Mon, 24 Aug 2026 16:44:31 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 09/29] media: ds90ub953: Use
 v4l2_subdev_get_frame_desc_passthrough_csi2()
Message-ID: <aoytLxb2sGCyoxEs@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-10-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-10-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH8PR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10268:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c73d943-714e-4325-c45d-08df022083c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|56012099006|10067099003|22082099003|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3RcZxndzMT2ulEKPBd5Fo/qR7g9hgieVWqUy4LHgGfCS3oM3kL0rsAoSLhg0QGRZ4AqvVytsmDkm9gOxki7tFh4JgliqJnGNOt4dEBA5ddNMnqipBX/PnRoimN6DNWWQ/ZpuApiYX987/eyQ3VYbQvtxgbJHO4DxoNYGceepbz57TOJZ+9MzlsKzxQbAtlNgdXQ1kkDkTWXglT8AMT1fLO13k/dH6tCQImjN/zOZE9Rs9i4PeRyPqZTsyWWIs6+msdgaG2NQNqND2udFmtKj+OJB5qQTEkUsGqEv0Y4DSRMKYTKnXwFChFHRwVyFbDxg0r1S+FWTzwxzigjMRRZeR836kIqZaYBmxfGt8LcdAU/QRcnD/nojhc8ow3UmeqsuP5Rlp3mhvmRyyAImArmppnRE0sutSgW19froHTgLa6nII9PpTKyp/gGu/SSh5/F1AeTYEi/VflbBrnn99R6NOzcXq5mbQdITB2CCPMumfgBX3P/VvmFhHirUHJ1DRcgL8/yEte/SuznrEmymOLIvfuJnsVYrJwy5Cc0PFBOs0SowaYEMRcJ35RmXXCvcDX9qya213qZzcgzRwIzHdotUZ6/sK/m2cnSAj8ww4+lTV9ge7rRyNuWXfZB5HnOa2M7q1DX7hvoab+hygYAdNOxvRSEEFJp9kPaEaiwjA26kP80=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(22082099003)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?siKfPis+T0SujP1n++ixgXG/Hhe+rYKZ5PoO0RKTZwM76bT++AYy9es6cwYo?=
 =?us-ascii?Q?1dd85yyx1OzbR7BlfIMqCnwOm/7/IkOIpysYMBd+nGeYX/wNfO5ZTNuTDz55?=
 =?us-ascii?Q?dlev2e6/aY0jVBoxCoAe53FHxLNjDfppBKd/Smh6bkeVmmEqXZFqAR9rbpVY?=
 =?us-ascii?Q?i5o+QTkV42+nfogJKTKMc6akGV0h0nb/zyfkG/LveAVlHvbiwmlpO2pwTWdS?=
 =?us-ascii?Q?TKvsYgocIi3k2NPZNCEBqCW2MwhUIaGPa0slk09uhE9KthapxyFYOW7axhl7?=
 =?us-ascii?Q?mjoiV07+Y6FHtbY1jFjzxokcfRe/chZThL/tNHz+SHnia4mqhXH8oqQi58mu?=
 =?us-ascii?Q?Ykv+QyvldcMTrdA/kr2lOBP07OJ+zhjMbHasCRxk4/Jcu0l/hr4Ayh3RoXyN?=
 =?us-ascii?Q?HF0OAFmrh1tacpv6QizIQeffArremrmYqNCY+69/IUEUlgU7TmShDIn8LK8j?=
 =?us-ascii?Q?hzIFl9Ax9rQOaLHcMZrDpnf5Ldm0/da3g381h8qtc4muPX/OF7FTHAp9rPeF?=
 =?us-ascii?Q?lQYy3iov8O+/zVmeYtePmdxZN8BswvGArJ15Y57UxBd1AyfxOYugsG50L0aD?=
 =?us-ascii?Q?K3rsY1spByUeUjrRu3TwPH15wCBcVmD+CmeoFwgQ8P3PdWUpOveB8KtCHZZY?=
 =?us-ascii?Q?idVj7su88jkOHj6qFKsVDv0eNnvLC+3/UhQqMTmE+D5fhlV317NeLOOSmQJB?=
 =?us-ascii?Q?2uCjTBiQVAxmf0HYLBXRe5Ub0Obo03OuTlJ9N7vAMATlxBlDvbFgrQAuVj3n?=
 =?us-ascii?Q?EPavFFDdseoTpc6BYp+2FGTJRF41aIlh6oBfxF453rgvHomCFGSPZjqZfYaG?=
 =?us-ascii?Q?XKISFQq8WIvQO7+ECjnAIsC45eiTGw1fqe+J72Kjzy98r+NFl9v1hy+orECl?=
 =?us-ascii?Q?Oj3j3TNr7h5fhANOfSx39LjJDKXa20I3Q6tPBCulFkWZM61JKB99f8xxVmwS?=
 =?us-ascii?Q?Gf6LTWwfZVbcTme3gWFvzaUC3LY5zw4DkcxKK7dAM2mDO+AGtQWDsQJax4/y?=
 =?us-ascii?Q?lwhtkqdGseG07pU5dIzHfP3qXBtpajtcN2EpYVgqdQjViBYZ6q6sqKtRYM7l?=
 =?us-ascii?Q?O/DsWb6A+yA1ZkFRPT0lZOKolPtd3q2YOWmKo7uAsmBdp/AmGJxZ78EqaVTJ?=
 =?us-ascii?Q?F/kjSeUFxjd1HusgVV77rEoeFREOcUTnubXXNkTEnFzq07TDDGFHIhP06t8q?=
 =?us-ascii?Q?B204ZZsMXpDUdoRi0e5IgFwDPdjBmshnAirNbb0cV7IZa/zI6GiPQ5dmX6Tp?=
 =?us-ascii?Q?HfyCQ605oUMh/Jsc3hKIuEXBPHBQjkLLpVuAuGbFEwn9cpHiMwqbaETEhYa9?=
 =?us-ascii?Q?IlegSTmzcReG/uJTsP1I46kO8q2OoM57mJppcDvtwL7SqqE0knKk0Wcxpz9f?=
 =?us-ascii?Q?91vxeKjcP/NMJGlgWGQeTggpVrsIM2v3MMk+Nln2gPshj2bwrsZABks+Bvcr?=
 =?us-ascii?Q?CCuN83KvUZAzgg3fsX9yoV9NKs2OxVkDBhxFh8AkoRnx/xv7NHvvNaKPpNFm?=
 =?us-ascii?Q?B87JIMcyrH8UNOCyaeFDelHVJGlMilyLDttVSdMW6dVQmSMq/ZEysyvCUbfO?=
 =?us-ascii?Q?jcxFO/Orzr9Dk0FDkQYHWxNLMTcai7ePEp1XDzfbq5HYwZzpOk7dhtGFX/x8?=
 =?us-ascii?Q?g6lxbP/uufX/a7THINgPRLJEUVwVhlnstlHlXUIN9E1VXdd+cONr7ILYV6Dp?=
 =?us-ascii?Q?wz4JASjJ19rP6dgQXMIO3H5mYjVyQAy4IUrmZnhmp3ATl9SdtCbmzDygh9Ev?=
 =?us-ascii?Q?aL7zCUHWuO1SGedHEs2tmbaHNcCxv/NaEr5qI21tRKZgmmf6WfNl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c73d943-714e-4325-c45d-08df022083c4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 20:44:38.4372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3rbeaNrsPjtgR2szD6vJ57h6ufxpaiDGPOEZm362BGIfB/LUSq8yEEskkNwNMMURPG5iJByidYDh2Dm1xSDjnvKeDLMfoJnRHlDtvFKlQIRqRgE4vwaCruSEa5pNO5l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10268

On Mon, Aug 24, 2026 at 03:14:31PM +0300, Sakari Ailus wrote:
> Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to set
> the frame descriptor type in the get_frame_desc() callback.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/i2c/ds90ub953.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
> index d4228e1134ff..1ed1ae90eaae 100644
> --- a/drivers/media/i2c/ds90ub953.c
> +++ b/drivers/media/i2c/ds90ub953.c
> @@ -635,7 +635,7 @@ static const struct v4l2_subdev_pad_ops ub953_pad_ops = {
>  	.enable_streams = ub953_enable_streams,
>  	.disable_streams = ub953_disable_streams,
>  	.set_routing = ub953_set_routing,
> -	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
> +	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough_csi2,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = ub953_set_fmt,
>  };
> --
> 2.47.3
>
