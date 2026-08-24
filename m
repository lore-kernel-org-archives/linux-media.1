Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297C618DB01
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 20:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787603655; cv=fail; b=Y9bb7fgHEAC7RGdTDANzNiZd8Z+q6qFwlDjk+J5NvQ22vXPjwjYSti45QRllmFt3UIS7ubfjglobVJ4KJ/dQM6gcdRhDh44EYUKqOn+lN+FkrL1NQUIiUHYJxjLVuCSCwN/VoxH+5QtzqGsT0SDoOorhT0q9BkogDijvcMpAedE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787603655; c=relaxed/simple;
	bh=YTlbnzuKGkBrcDKghFkoV+SZNvr58b0/uYeSkpcYnTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZC3QwNsY0H+Ga0Jk16esPNYkJENGflWZO3/t/96mWUX3A40UqfucIeB0nwV1ttaBy1tn3JLobc1vhGq0A8rXr1+GgMlnGstAhJt4ji+jonnRqZHGQVP3d3Qp37Bcj6ozwPEXktdO36Ee7iif5iPsFz/kyvNWzLxU7TNHzShM020=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=skTzt+Mt; arc=fail smtp.client-ip=40.107.159.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="skTzt+Mt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFEtr/OWE69+sPxt8RoQHyFSBefsH4FdIpCdtmBn6sSf3u0mlxhLBdEjdgq3OxTAfnWQ4VED4NUpqQkVGzravJvcouFkcq43OPDCK1i0ES0OcBc9KVmTwfjqYgkoSQEuIM957c+IDXyNe+KM2UVe2FFEKfcFCZhg8A7F1zLUlvll+fb18KjJvMOg4CFrqhIfdYcW2cWVtGVX9pgaPyzOAQYaho8UsyZCTuwOcgRYZ0C2zqFhk1NVrns6n2SvzmHGpVQCQcHui1KWGJdM4fRNq/W6r3ECLd+jW98lBFQ/nmxUChLmUC4MLXRM1XVf78SMFwR1ZvB9KnG7nBV+lmK1bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FzQTbdzEYF013LysVqSl8H3vmxA1R73jtbEB4IZGSM=;
 b=iMlTMRVg1Z/6BrBgDXL6A8A0FqK2HZxNIl1OD2hwOKd7AQWtF4gppcGy5kWbLe4nxZDD4glstj/4W0+LYmSjbo3XR9O0wDIZYvA2+3O9cjw6e4xytTgeT5AAHk9yFgoIKJ6IuRe8iWwHs6yJ7neaC6wOPp9v+Jli4WdXs7/As3YQoKB/K2GOBEmHHX/3TdTBxYCEVvEYL/P8zWJYIzg3ccBZqex0Lv0Moc5iY6m5AsMaHXpiQpv93/FLF6/U9/qm73jbec3FOyUa0DcF/DEpkPGSbmLg9b9+w+cK1+C01/F41vtIbTjKCnqvksDmLxtXz++R0bcM3fNrtNnSg5WYWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FzQTbdzEYF013LysVqSl8H3vmxA1R73jtbEB4IZGSM=;
 b=skTzt+Mt7vwtFezdsAnKBjtUbuyOj5wWOiiHHY36y5TvteRlhLFqH+1Ew1zY9cslGfgOgzsMULNSLeSyu/vLY1oxLkcv06OUGO7Xyx5NCJJwZg36Eye7/ZupegmNt5HPxFA6D8BMtlZNo7fRmzplDlEc8CZCxgwEwDNUVAc+5YJqYTuLzN14AYJqqGfDHp4mKElV1zb0ROL1Zb6TbOA+6OxSHo3CNE2r8oWnl//Gmev6p1BvLzoYr9QI2ch+zfV/mSZS2cpBL2PgbDCsbU7fHYayxKpfDTFdbt4o/JRcK03GkwmiKLf58NgFkeUJeIydv+smZl6plgGwlfCx7MGalw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8869.eurprd04.prod.outlook.com (2603:10a6:10:2e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 20:34:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 20:34:10 +0000
Date: Mon, 24 Aug 2026 16:34:03 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 04/29] media: v4l2-subdev: Allow releasing frame
 descriptors on return
Message-ID: <aoyqu4MGBd9tXPDe@lizhi-Precision-Tower-5810>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-5-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824121451.3348583-5-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SA1PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: a4522d65-c9bc-4611-ee89-08df021f0d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|56012099006|10067099003|22082099003|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8dfaxDXO5g+x0D/d9RjnH1F5F7FhF2daM/WR9az7p7mzwGVLGK9SxfupQcmV9gwudgzvI8oTCJuc7UWAQ1C/Pi8totIKvdzgf2En0RI0CBT+MrWhXReQm7OBnd3deu/8Fiht9WOlEGkp0oIBEtzsgoJL5xWkwmh+g4f+f6QHZzGrLJq93tSI+ONTgSExv8lDZP1v0eRFJQBerRSI3i+ealRMJsft5jnfU3pCiILN9H/fTrCYlVX5JIN2ltoeNINPnAY6Zo/MxN8Xq0o3ALRwGhqoeEx1HrIok4Kl6niQO1iNMpPy+8xTjl/G5bNduNZCcs2IBjsiIAkUa73KUMt2jRvrn0SupJkxxTjk7G3OuGd8ZMqzblQZBYKd56Y63B/3buX1vvnQxa+nwN2s86O899pzf3vKBXt2b8fhkzJ4bF7M+/2r38bFEmYK9MS6NTHwR3zJFnG6yBxSF5TOHCi2DOiqF1gMiGXFRTjE1oD/cEneYKDQNp9y1GXIJU414oD9MSFbPMyVBqs6MLPE9WXedC4bm6rTEiU/+8sc9Jt8XYwpE1L3IVdQY1Yurz6R/tJ+bfJZhYuE2bwl8/Ll2jtr2VrdPcXUjoqAfyNo/jQ77vgEQMeRkg7R1MWoP1u2AfeE9QXWUFXg5Z7RDz9Rzuu86L1J+ehHiYfQuqzN0vvCquI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(22082099003)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9SgcyRZ9GRnqQdthcX/PKvGeEUJX7FtjzhEZQbjr27/EqwNxD6fJmUknh6GC?=
 =?us-ascii?Q?mmrwI/zeYl9z5Q9hqQ4uKwZERbXzlN1EF9HakMw9Bx5nOFZqFmNMxBBOPZJG?=
 =?us-ascii?Q?dJXBOd4PNaJxaJ7HKvQul5R63HtIKZ/CWUhHA/MXhKuvgNhuO4h3qJz38pnx?=
 =?us-ascii?Q?SKHWr4na3H79xjgtUZhIJzamyYDcjo+OiCo1yutU/bgj3+LaX3mZz5/BOE/M?=
 =?us-ascii?Q?NMDoRqSk6p5Pe4xnY+v4DxJ4PS2bvPkUhT+d2fDIvKY7MFXVYtTuOO/8hXXe?=
 =?us-ascii?Q?fOD264qNe76acY4pZSRzqaaZ3ylGle1P36VHW7Vs+APenm90isNR+20owXHG?=
 =?us-ascii?Q?LTJvdDTwqPsvLW8K0+e5vqHN6BAbum0S61YOQ5GAd3/E8ouocgFtMLB4CzUi?=
 =?us-ascii?Q?S3OL8dU9VXS8mFqGpLSHqS9ZYiwErYg2Fray12uxM9ix6+dQD8HIynAyvcTP?=
 =?us-ascii?Q?i/aDiF0LCBg8fjNevdAHeTLFzfox1C4LjsOia98JlQF+88/iBOrlyk0Jkpwk?=
 =?us-ascii?Q?odo6JiyEE2+sXy8UndqS7yqXjB4vlc58/wUcLvDpZqzF9G9EJQoINzm9MvIf?=
 =?us-ascii?Q?PMnNbHObunYB7T5xSjREHbUKrJLvD1aj4FGv5c57eNsN8plI40nCR/ljq5Y6?=
 =?us-ascii?Q?XP9775sEttRndgg29hzrTZQwMg1Ksb24dcNAGnZlnexk+uQzd03B9BY/SI01?=
 =?us-ascii?Q?RJqCh2FjIubj4EnullQ4YJpH86VinYr4Ps2pP+oyTCKE/bFTz8409S+5QgIe?=
 =?us-ascii?Q?caDJ6Ixk0PFHDgPAeix0Csj2MwM6DlXREgSiwt8vtWwTIaC41upLpItefAJl?=
 =?us-ascii?Q?LubbYWnZYnZqZ4cY0FhMd4CdBWJc2+mfsILEu7c7xLTXsIFiaF0K2tMTt3FL?=
 =?us-ascii?Q?SF43sXLrQzSaxYgx18V1qBb6lb5JSeMwW6rVNI9fG8mkE2sT9G6YNsArZe7w?=
 =?us-ascii?Q?/90FojIsMHYR1qQx9xgDBACY68SNEz3XLqxE3D9U3ux6ubL/uFEWLB6o3SDq?=
 =?us-ascii?Q?4/gha+Kv8zK8aTMcB4GyDkGiuHZqFtiuEY6eQbwq5E84m/tGl1cKEGyuqtWr?=
 =?us-ascii?Q?pbXIF0pH9mSQ6nm2FGjrB9cbwKdEFpGb1UTTvVjgCnXEOd+7EirK0yNFhSLo?=
 =?us-ascii?Q?BuQtz773veh340wVRZSjSBy5d7OrqftNoziLZZsfvHd+eQam2yjloU5N1Ps7?=
 =?us-ascii?Q?yXg61rf99Mmc/59uigkiFpK2D+3Ml15MI5AfrVlglltwRs3QVzXX3GkYol18?=
 =?us-ascii?Q?RINAaDGMdg2hkbcPEnduYJ+dCUKIo6vnRkBszAAoJt/mRTqdpfF5b6Jp1Rct?=
 =?us-ascii?Q?rFntwc/OZDMuZPReBk/RX8qWa5uiQ4fDUEixy0dqujIZR/A4cRU7UmUq/jfA?=
 =?us-ascii?Q?wGE3FHy9Y+JOmoBHD2y1lj4UHJQW6CDrsSgw/koLtHvJqsaS4udfJmMez1ba?=
 =?us-ascii?Q?AIMS/xtiNzGL/NahPvmO2HdM/Z5yYm5T9xfN5y7y8B+c4MQbrk4y0Q1gwd1w?=
 =?us-ascii?Q?ziFvZvuZmVGylEz+pPNkd83KDnaRqnQqp12RQsDY1lntNhqHEajRFC7WY9lM?=
 =?us-ascii?Q?Nw4+KMKD5ijsg9vU/t6WaiIuLb3F2jXP55kBFDcrJ2CXEhA9S9AIi91rfDO/?=
 =?us-ascii?Q?HN9XRMkkQFPv3MY8VFf4+kNzq8//ofWrLK1ry7KSf5OWO6I2bzrFp7DegAah?=
 =?us-ascii?Q?yMV2OSjeHZ4XJJKQQut3ZSjiOQDxwr/tyq53AoUmBq7012rENblC5UMocJK1?=
 =?us-ascii?Q?uzkcKSoYQ6SNS/vnW3sGpfUEzYNoWlvmTqKtGdSqEhZvvI3rg7Hq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4522d65-c9bc-4611-ee89-08df021f0d8e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 20:34:10.6398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVWlkrCzCqI0sAeH7Z0PzKpTF0ZQT5Z4N3G90G48+OdUIB2D4na49j3yGtQ/tObPej5Wz8EQzAerfX18k3ZliaSSNnjg7lA77a4CFtSQtc2apkVfy/k6JiSqKx8VtyAh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8869

On Mon, Aug 24, 2026 at 03:14:26PM +0300, Sakari Ailus wrote:
> Use DEFINE_FREE() to allow using __free() to release frame descriptors
> using v4l2_subdev_free_frame_desc().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  include/media/v4l2-subdev.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index e7127953ac22..c10ca3f5d979 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1798,6 +1798,11 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>   * for each frame descriptor obtained by calling this function using
>   * v4l2_subdev_free_frame_desc().
>   *
> + * Use __free() to release the frame descriptor automatically::
> + *
> + *    struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
> + *            v4l2_subdev_get_frame_desc(sd, pad, desc);
> + *
>   * Return: The frame descriptor on success or a negative error code on failure.
>   */
>  struct v4l2_mbus_frame_desc *
> @@ -1812,6 +1817,10 @@ v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>   */
>  void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc);
>
> +DEFINE_FREE(v4l2_subdev_free_frame_desc, struct v4l2_mbus_frame_desc *, \
> +	    if (!IS_ERR_OR_NULL(_T))					\
> +		    v4l2_subdev_free_frame_desc(_T))
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> --
> 2.47.3
>
