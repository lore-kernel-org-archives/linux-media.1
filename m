Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E335438239C
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 20:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787604312; cv=fail; b=NOcTcDqoU1dbkuSlBII+7VJOl1lYHcHqvzUbF4qDKOaTYb3JCNxqIUVGTVK9KXdVpmWYZoD9draKjtOQlBKERRZAC1Ny1Aw8g3ksnErWf9JU0Ud81epQNH3DkrMF55uPaIev7DmRfYI8Jt6g/kHr1YLyL70+2GYl3GYCOJmGavA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787604312; c=relaxed/simple;
	bh=gHY1TnAiVIubfZE4yifOcyTi95DEOjxGfOygIu4J6rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b5vzak5+wm78wIrFZZYpUu/fPhvgjiOHeOiIJxVAP0BMbXCChwe2A3ArUu7jHAPrAXzeWOiQj0S3GluNUL3/ymBf1ZAMNCzQvrfba7l7ha7+V6GgKhbwI3TuUNr0tkXglMySv37ofegOMKk+kobum4cPR4i9O+6b889f6xm2YNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qKyidtDG; arc=fail smtp.client-ip=52.101.66.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qKyidtDG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWRzuw4FAt4yzzcemwCNKBmqtAI6pSn8hWMGolr3CYrba4CjFAGQGf+Tf/luYrS2PEzvAuLdkhA3sOaXR/fwaUxWf+YKsVJQ5rDuwObQzunEe275PGsQitzq02NSdhqECJ6Z/uudq07GG4aYwNs8Rsbx1YU6nbKcgpGIx55ZGzAMmA0jalJ4c2pvON9DZF5hlD6UXuCVtSSJ27V7l0CCs/+3nrz4+tZhcEXOnewBsF215HRuDl82wOF8DdddRIJDa+LA+XqH1+8s4ijnrbTlCcKOQ02c83rx5pguhGdzyPsxjlh3tSjWMoDKq3BPB2y/UvtRx6Z3QPyk9/Q70An5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blQ98hmALOzLEkW+opu2Tn4bfVlwaxOoIDlrXT1bpco=;
 b=dpwGyHt8+SxaZXwtw70sTxacn+ibqkh7nVZxjtgDbMhuQdNkP9iOYk4Y5ZAcjd26DEzMV0j+DgLbJoiNYX5Z7Mjnv3lPVdg7uyVagJL+4aKV1EzAjCYiVFs+k7tOLl8rjX1sgJdd7vrjvcEabaDxWGlpA7YJLaSXSAdGMrZVmVZo4+3M8BL9IxHuexRmjE+f2rOeRzlbAmI7UxgrW3b7jpFJccmvog++WSJH0wv/0bjZubTN8VO/2eNSCxVtlEgtD52AOjAMR0n4hQFPhhqxD9WNTnFBJwWivEjuLjh817I4lhkU6+t69dYNXzxDTBi+iPwHo98PCYlxuu+nhh8zVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blQ98hmALOzLEkW+opu2Tn4bfVlwaxOoIDlrXT1bpco=;
 b=qKyidtDGefc2rvJciPwupRi94d0czz+GmsnDN3mqk24mCpcnPJOaB1appQthihQKukT271FnTMdt2hqoMFnN+loBzd7X5AIcNJ7rQ9vL72plvVjoPKw9QMPpQ0bqda2nTP9S76fn/67Zl7fKR7+Ucm34jjc7yXvgfcEeAc1V/IOkDjEfjue8tYDxaAF3Q+uRP4lYijLWG3mQWzY3KVLwx78Ps5lcbJHkbDuMg4AgOeSALwWxCbyvGggtNH0kVaBKKFRfmR6lN4NZb8iYpAVU0SSETbG11/pzHG0QjsDF65TWC+25PbMbG59eswhhdQ8aJ0Reois9JYQeQ0gQs0TLpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10268.eurprd04.prod.outlook.com (2603:10a6:800:21f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 20:45:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 20:45:04 +0000
Date: Mon, 24 Aug 2026 16:44:55 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 10/29] media: nxp: imx8-isi: Use
 v4l2_subdev_get_frame_desc_passthrough_csi2()
Message-ID: <aoytRxV4lsVIeslD@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-11-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-11-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH0PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:510:5::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10268:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e32a36-aacd-4a3e-dfc8-08df022092fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|56012099006|10067099003|22082099003|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LcsC6knaWuQ4XBbNpAGZOoW+DNrlwMCs1k5TP0qK5BDwXcv2U9ysF6YBwlfOzE26/si21tItz1uNeQ8IxekGPEECYMG0Po8kYp8+O/GMk5iCzmEgMPlx95z9ZvkJxQJyz2ixACqoV+ktMTtKt6d977RQE86lwVSKg5/WDSnoVDwG4Pb9y4/sqOqVzql4VjZkikeWn9ezsDmnIG2Wnfj+Z0RUVIvBRa0FNNXxM9swEJHh2peRYZJQPoK/ZSQ433O5+T0WuG0gOBAqlJPHSs0JC9wGnkETdQfHr51rRrA1rD5GiOL2J6QF23POuNblXfvzPDHWIVMZvmsAb9ea+QKFsiAIeR6r1MsgTUC5bbN6I29o79mQg21ilm2sjb3hjn6d4dTFljpfMfzIBg5FXLCemq27be+ltCH3Pi2YZhUprxzu5uC3yVEwDTOBJI49MBS6rKr+mFg5IHPpDn3fXIkd3avhMKTbXrxneP58m36BZyXjWUAJoMms55x3f506o5ArV6dUnW1h6f5+XC0nEmklixu9i59qB7lTgddRZLw81PGfxDG4sif0dnk95CByFgHf4/4Eg/VW1IsBr0yxoEoN+yQp7CDbbnxx5cZhyrtaQ2/bbf0E4BGxvt7h17uOhqK+sDqe3L/vpF2M94VKXvKinEoZdEHWU0GNK/sKuqIp8dQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(22082099003)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5WAlmAP3OLWhd+TrDgb5vrBolYgSwj2JmWrniqNtiR9ghkHhy5PgC6drRN3z?=
 =?us-ascii?Q?fKqlORWyxxhb5q0xlUBdt5BwDs7S7QNaxu1BhjEvSC5PrC4HkNjgsIsr2wD+?=
 =?us-ascii?Q?ZEGRWA2sja/MLMEmjRDTmZo6cjOlsZHucRWMusyMTF0OoxjJLBuj9GXLn+w9?=
 =?us-ascii?Q?4M7P8+PupELNzSD+Rk0sN9CMdRk7E9uu5G0qgessR8nquzJB6vuKXJY0+8aR?=
 =?us-ascii?Q?0TlZBsedr3N6BBYlo9Ct1rhTFXVT9gCVbNHrlSiDzrxDgfv5zUhEVWJs5C8d?=
 =?us-ascii?Q?z+DZEPLF8EkG4ZYhqpS0lJr6PTb6pHNirLMx6cmbf858+lbImpTmBcosmxEr?=
 =?us-ascii?Q?kEKOi/fnqw97KYyMRCLSGrt7YBZBK8mVAlUqe+ojIaYiW6UwzM3c8v15JxYB?=
 =?us-ascii?Q?3okWkIqh8fXriPUW3I2FeQeD64TdYawuTUAiQAC5seNm8EXSEjH9Pr9UacJQ?=
 =?us-ascii?Q?qP/DHgGwv2VATURT4f8/eepJzy1FA8a5YbEd228wA3E3Jc/J2AbManMAOuBS?=
 =?us-ascii?Q?fqOQipsKP5hMWFekMReYEXowpTHH/sGrzDGTmUx2DP9raV2/fV92S9x24Z2g?=
 =?us-ascii?Q?XrDZ0KI76uWMtx3Cy3xXCqkwjXHfSs7ILQKx8NtfrFS7qFbD5SUhoUIU2qsh?=
 =?us-ascii?Q?bWDEIv+Jj2ADj/P2S55TqP346F0t/ukrmKl4V3kLnEaeL95pj/FVA3kfscW9?=
 =?us-ascii?Q?VriF4xRfUd6UH6S81U514OXH6EUZN7jAnIE2e6wSw24bK8oUJBF55r7/cT5l?=
 =?us-ascii?Q?PL5KHky8m+zIHjNzAtD2bzx9ZkHMbrf6yuLyV/fNuZB1ynqyZjHwRmfr0Urn?=
 =?us-ascii?Q?fyuF35FUyDmm65OUgq2HMhoBPXNPxmc0Un98n2z2IZPHAVRVolEuHVI2ICGR?=
 =?us-ascii?Q?ffH2J9OMQbs98niaQkwxGDZRRPy/AaDvR75Tn/13T3BXidOVoezA4WTeCwr2?=
 =?us-ascii?Q?oUULXUQHffbv5/sIb0WvJWo/tZ/eLy8tUIq072UZsUgmYOlufxZHjjOMWvKI?=
 =?us-ascii?Q?PRtuDpTaY9RsTFgfKbblmCm/+fnF0vApE8V2jONCy6nnPdL3My9hJzlqHEm/?=
 =?us-ascii?Q?BAO5dKSs2tKFIaGWeOAVnnKk3oYxA21qPswLy3VmWjSNJ/es/lPUTPWrn73Q?=
 =?us-ascii?Q?ES9gulGBbTyiiNmjAvnKs7LsChJK+o8hD0bcUZDkJOA7+feqrox2G7NB3POI?=
 =?us-ascii?Q?/C9k094m9WrP9sGH2+KU5YSEhmuIhL7P0AKx1HEPn6RPrBMEaauxB1Z+Xky8?=
 =?us-ascii?Q?wJBq9pbUerWC/kiuy6dWkSMwYNvZw6LOkcck15WSPEB8P52zvkaVoXEZmd2o?=
 =?us-ascii?Q?lQo0qL+qq0mU2+6wFYi+LWPkelk3yyMcBfcpNYWNxqwJ89Hu0pXay9jgpKDi?=
 =?us-ascii?Q?lNuCIBVNY7+LjUql8Gi/4hZAIIT3MAHvf1/SaIwzXR0UEFRLEnc59eKVM19X?=
 =?us-ascii?Q?oKBkAl9+DxnsYlmyiBwFqYMKjpbLdUtKXPA14L1kpe5tiqACk+mWAa6nvJDl?=
 =?us-ascii?Q?e71OSTyLpbo82eTTiAxLPYFO4rQMa00TPwt8I2tVaTPw1tEYvLmpbQCLx8Jl?=
 =?us-ascii?Q?LqzG4GCDVXS2SN82g2jMXv+C/wv+aC0DPr3gP0PTxLCMXNZKYSzlHcTGLY+a?=
 =?us-ascii?Q?oa5RYGip/MoGJiLIgeFstoTPQYjPLTMSKKYh+jdqur2igFoxwoHSUOdgsMDX?=
 =?us-ascii?Q?/ahFr4mN/owHfCyi3XBjn66NJt9B98r/vpnYmIfAhU1ioY7GvTLuPu8uqzyJ?=
 =?us-ascii?Q?IBu3h6/o0xkyO2Meqjp9hE6IaX0P9J3GszTFS9ND3OYNQFwFDqjh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e32a36-aacd-4a3e-dfc8-08df022092fa
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 20:45:03.9575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yjmrWg6oChL6a0khqepzbNX+nHtRkz9pZAUjefbZrLZd28/66F22kIB35ncfa/2e4GEY1Tbry6hiBaAS33RdA4vvJx4qS2OucGGdICKPFEU0fqg53pwHxQZaE+VLfVA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10268

On Mon, Aug 24, 2026 at 03:14:32PM +0300, Sakari Ailus wrote:
> Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to set
> the frame descriptor type in the get_frame_desc() callback.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 7bb1335f2110..e6c38a769205 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -462,7 +462,7 @@ static const struct v4l2_subdev_pad_ops mxc_isi_crossbar_subdev_pad_ops = {
>  	.enum_mbus_code = mxc_isi_crossbar_enum_mbus_code,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = mxc_isi_crossbar_set_fmt,
> -	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
> +	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough_csi2,
>  	.set_routing = mxc_isi_crossbar_set_routing,
>  	.enable_streams = mxc_isi_crossbar_enable_streams,
>  	.disable_streams = mxc_isi_crossbar_disable_streams,
> --
> 2.47.3
>
