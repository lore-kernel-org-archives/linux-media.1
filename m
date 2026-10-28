Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793200951;
	b=BToWihwZPpM2LvEoNIZnEoLAuuOAYpE8IJH8guxfDuoH44NfWdqbiebrjHzwS2gXXPgH
	 oDw3t6EEY/2bWFn/UGpR4baHXGntwGqezn5vDc8danVTKaLbSVcEkRABYqVklf/u+J+bN
	 iXhOIRYfWgPm+vToD+OkjunVpxjuoKy39QpzsrLlANox7NUpp5/cKAi66K2X9VtZgpAdo
	 BSrBa6fqsFbQeUC0txu4890ao8dMzLxBZQTLYASgc6HQjSwWGq1IW60Gz1mKprl9kGJyG
	 qzGTj5luvxgl15xorJP9weCQx+kU+ruTU4F5v1BhfYa6bcE1ux+U1ekP9pNbgSlnZ5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200951;
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
	bh=ST25MXQDUN+WqHS62mjpogUkoRYT4IjlWOsqeqjRBjE=;
	b=Vyb9ZHCQRXQntl1HrLFRggsnLqsG7lZK0rFLgsmQZWg5T4WS/JbKm0jOlt/L+EoqAM++
	 mEZnp9v7jux2g5/0WRQltBghAqgRs6vh4RyxaVmo7sLD/4joTQfr8NiNnWFzlQ6MJeLrN
	 NoDSr6B54cGNmQkUTKcj1FwWoEvdhU1uRQw2F84yWzkS77E7zzffTVvHv2zA2Lh69VrvU
	 6sN9LcDGo6fLmEgWJB6bTWQcfw/n2IBtEc41DTUstCTDcIYi1qfiWRJLrByInT8PbyNi9
	 yhNgb2G3kYPfAQv54h1R8z1E1Eh3NoDQbCTC4lBXE7ZyKvjZXyH0ZZw/MG5Gbi0g07g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=N+9liaJT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.57
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011057.outbound.protection.outlook.com [40.107.130.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF8D60A2609;
	Wed, 28 Oct 2026 15:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FF8D60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=N+9liaJT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGuDR47QN/uxscA6TIr8jmSql6PgbpKIEDXlMZ/CCQBE96WoRHscmXCp1DFvb86NyxPN00ZpRAD7oc+KSaW+YqrCN5/E1HJfN7A184dGwjiKKe16U8vRCJddCX70RNe+u3SvAwYF/Ti8hd0UQrXVSFUsw2tsNXYin+sYoYBL8duZWZ0ZutoMfvsrbB1rY/DC0v3mimps57Nm3oM41kVuWWhxsQGeHJn5nwtvmUlIjmiw8fTICR63bRyeVYMHEfcUrezmeJftWSuIuz/CclnDrL/TosOUTA3B0SsY2glWOtASk3l7IgDUk9LVHsT/W0JIhtvUPGj7NfpgNbolXoSTOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ST25MXQDUN+WqHS62mjpogUkoRYT4IjlWOsqeqjRBjE=;
 b=zL2Uyk4DbBqwKm3e9uX2gcjtvEwGhFe/vsnf5sfD0HLHhTG1Y7vt4FnNQwp92PCi+wnFwtTzD/7XtfiFwx0xe6/0wuccwka4J7/qzZCZ+gmB0m08Cz96GBmBbOtZZnLDf/+m+ceTneHVTctkRzXgookhG/5Rw1WKJBaBlMCxkmMDN61Ctnpz2Ix0r7rShqKLLZSOlhslcEowkIabNyI8uYmprEQh+DKQ+iBCJyxTGzY2AMPXEOhpQgNfQwVYL/w1sZcpHegwrjZRBhuNRI2s2EY01uqO12dds4V8hwouJNWEoVsxadKC9cHYVV4wM3N4LhLD9hExjpOBXL/ad9UNOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ST25MXQDUN+WqHS62mjpogUkoRYT4IjlWOsqeqjRBjE=;
 b=N+9liaJTBNoRDKzvwXSukud73pupL0ajWICk2ThRW2gEo/XgwWLhTX9hdLuScfQPm/ybjTNayOadhNjSFELz5MYyi1CLZS5PdVnwDxWFyl2RJbFv2wSChAfA4ATp9g/j7jootx7Wnp6hGFutWgsGAtzn1Ttc8R+oZ5v7136IfU7FSPvJYK4ucKyxauCDAy1D9/z/Nt/hJqic++tiZnKxrKRcDumOPGqVZwF5LHuLuCt1DadPmgWqFiPooBqLL2fgD1lQ8MT2wW8f3UNAC9fALAa27y/xEASggaQz3gIbV4LD+Jy4UOBvLJnoCf2L6TisyafRFkmsYhGv8QJixz+PuA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU2PR04MB8584.eurprd04.prod.outlook.com (2603:10a6:10:2db::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 15:22:26 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 15:22:26 +0000
Date: Wed, 28 Oct 2026 11:22:19 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/7] media: qcom: camss: Allow CSI2 PHY devices
 without CSIPHY resources
Message-ID: <auITK_NmQYX6E6Vj@lizhi-Precision-Tower-5810>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-4-vz@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026224957.1115370-4-vz@kernel.org>
X-ClientProxiedBy: DS1PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:8:457::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU2PR04MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d8e9247-7cd5-4a12-1757-08df350745d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|19092799006|366016|261026140227099003|4143699003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|10067099003|18002099003|261026121527099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BLQE+c6dZCOvYdFlvh8dyr8zVrOKLbfMa23P38FLkf+BMYgHsyflegQbF52GFPQXca2NirAD4onGkYDG8ixrQTZ4TPZNJiV210fXstXOIVaOtkk5D5Rjy5ce85VdYld0TyvNgHRxWOFQ8tsVFsX7M4q89wvL1X08ST8MQHH/drWVYT23RScrSCqe68LM2tjjA2DB01bjFdYewN0+kB9ZuuKuKMoPn/lX5Wy/FoTAshG/Tpne2pWXEXZskXxS1FOwxzGZ1pqg1MT+bVYderXtM3kaPTl2ZJkVIwVBgt8aIRmV1o8chVtcx+XY5ljx9kANIBBZ4dzpEW6M6nWFTyBV+j8DgfENdnzrBXF4naqRTT3XcV6qb5cRdaFUU2gzMaacKxqBhGrbE4mdNZk6h5KFU5T/sInaPErxK63ozJ4MpfJEmYCmyAmKh2jDAngk3hJhoPIZeqhEJ+qFcTV/mz2fgSQOkfFalZV7NbPbXLKvSyCvS6T9F6wzGAyR6Xd9yy9KqLKQV02iDQ2hpP1tZhvubTQr2hwUm43Owk6Ed16s0JGbXK0atMjxoSSfwMlxRPDGzWunItdz6UOlQjYvuTUGQG8NdblUsoS5XjGNTM95WkOBl/8rlRRv2oxKOREwmDR63U4SLfE6+e+E3lAVRsA9PQtCePNk9gM5ILgFeqptlTM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(19092799006)(366016)(261026140227099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(261026121527099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dYgRDyDDqYRNsaYBIoTrhiMfT5asJRGlNs9Z7e8IkK72jGzAD5WhWAWz4jD+?=
 =?us-ascii?Q?GSEDHs6ZazptEilWcvsRRF6EyORRa0PS+ltQgxDlCsnRs/Dj+pV42FVRCq3U?=
 =?us-ascii?Q?7bKvUl3ONatCDGEFxMvtFPfZl6ubCbO/QWHLEFZf57L8hvUnuJo4Lb7RiRVP?=
 =?us-ascii?Q?4Jod2EEb9fSZGrh7K7U163/5so0vXxDJOCPB1a/zquxNvOIWOnCwX0f7oDTt?=
 =?us-ascii?Q?b37ds3oOkWKA5qT/xgmEuTzRbWGP0/pxYy/TwNtMazXpL0u/+da3g7SQWrTm?=
 =?us-ascii?Q?IHUjUGLSfRUWix6y8OXGn3O65JHxw1fpVgnDX1jslX5w+9D7EtEGfL8Hr5UB?=
 =?us-ascii?Q?w0+GiqOF9cACkYviS4/d4C5zBk2By3zyrBzNC14UeNU0AtD8lCAX1lPWjDxy?=
 =?us-ascii?Q?boBw1hY1Ux+kA3k1ftFETPhvMKV4FYqKFttqSrc3UWUHeXVtx6vIiAOdr3vB?=
 =?us-ascii?Q?qylujJkjhn9VF1THEEjJk+Qu1tu32fkCFM0I1UNt9byAipaTrh1ufcrrS5si?=
 =?us-ascii?Q?cCot/udZf1fiyE0hdoISd0BbGVIpXN8Fe8zlwG5dIswZH07uos1Lgb1qLcz0?=
 =?us-ascii?Q?wdQ1/rGPCqwlK2Fh6XBfPzwf+D+reXBVtuWEWFSfPB4PzWsPcwMKNMNH6QQb?=
 =?us-ascii?Q?2FEw4zuyIR0WzEFnXOVOhNXlB1MAlTavnd/fOTLSDxA+5Phibf7VLcMPapL6?=
 =?us-ascii?Q?Bh1wbnjSxq4HHa/sCudGlqq6SXgFUIynWFYAvi2S6DaXum3Cc8MQEVkk+vdR?=
 =?us-ascii?Q?FuZL7XiFX/kme0h4tKWFCs90mBFHGkxbc3BeN+GSgnyOOG9bt4KyJ5NojW3a?=
 =?us-ascii?Q?tKhTXa0j/Z/u+SAbZ5RDWFyClV0rKF3gyJDEaJfpaYcpRtGu9GNkh8Ht34zG?=
 =?us-ascii?Q?4z7RAdPTMNtMUmKlLzhSWfHtfXN1wJoolUSdenWUNWbACmv/c/TYXTerL+JV?=
 =?us-ascii?Q?Ay8LOfP5FnY5f3PGqGcnqNG7w9q8JX1Z5jv+ESn/Df41pd+c1NTpbLSppDDd?=
 =?us-ascii?Q?36/raMg0d0scFq8jN2wKZ9telRR64TvrYtpR/TBFTzTfVyyQ0jbIDJxBB8pQ?=
 =?us-ascii?Q?FFPGX8UuiBp5dlFEHHjn0/Q8i6mB7DlnS1T3FrlLskARoA0rHFCoO/zIczDT?=
 =?us-ascii?Q?ZCNUpDFVbEGJZSqvB/b9iE4fZzoCdDPLWAdH16WE5Aa+5PS/JPpliFUckbQi?=
 =?us-ascii?Q?ONaMZzC9vdGTs5nPbz8fz4T1d6wH94Nod3vVsR/iE+gOrQ/1OE44vcNja68n?=
 =?us-ascii?Q?hLzLY/P+gLY/qxYqe4NusxWNoHe69lNMmj8rW31ASk55MkL/hR13NwCJi48R?=
 =?us-ascii?Q?ge81dfsDIc2hETep1ksjBfNweAEUwMZo+DRkoxZgiZ/tdrgv7kuUw1W5bKIa?=
 =?us-ascii?Q?YXFf11O+Rbg0zydrxvI/IbL5+AC0mOpVykgVULdRUm6vFZkEmP/xfrG0083g?=
 =?us-ascii?Q?qtdpRKK+MSKN1U9K2y39oidp1C2/MjkHuaItk3mDlaj6f9iGSIPA9jhNeZRp?=
 =?us-ascii?Q?SHgis2ffS9b1pC5UmEQd5QfY1t1CP7tAxutlw9vFsAtEEHrzITTtGEG/2HJU?=
 =?us-ascii?Q?l/C95Wwr2lBI5rf4BYkEwz7NbAKUBpTT/uhrJE3e5Aac7NR16o8FyuZngicM?=
 =?us-ascii?Q?ttbIO17ShvElk6QTvG3O7J9Bl6u5pQg071io6wwvXSuIqzJ+V6dK0IG5e7Ph?=
 =?us-ascii?Q?9+K7398AlXL9pjFmlPZAltpZg/RsLKdyKfKYn5EPcHajkK5ZPUBlNLTV6BZ5?=
 =?us-ascii?Q?9E9MZ8NoVynPa2s53Go06rbHH92klhEWrg1wuwd6f9HL+Hiluxmb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8e9247-7cd5-4a12-1757-08df350745d2
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 15:22:26.3547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5rELYXh6zH+kdNDG66yqUbh9E7bDw10S6g2igtjD0nenwo5eAH+KmMIblUHGGsJS/SxuittWerN1F10IMJ0rg6cFf3c3jKJJ9EQ8ODkp8Qze7m8cT8mabzUnqZobjyL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8584

On Tue, Oct 27, 2026 at 12:49:53AM +0200, Vladimir Zapolskiy wrote:
> If CAMSS CSIPHYs are supported by the stand-alone CSI2 PHY driver only,
> there is no need to provide description of legacy CSIPHY resources in
> the CAMSS driver, therefore if CSIPHY resources are not given for some
> supported platform, use CAMSS CSIPHY port numbers as CSIPHY identifiers.
>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++++++++---
>  drivers/media/platform/qcom/camss/camss.c        |  8 ++++++--
>  2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index f99eea2ef228..8ecd514451d2 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -799,6 +799,11 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
>  	return ret;
>  }
>
> +/* Fallback to generic SDM845 compatible formats for non-legacy CSIPHYs */
> +static const struct csiphy_subdev_resources csiphy_res_phy = {
> +	.formats = &csiphy_formats_sdm845,
> +};
> +
>  /*
>   * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
>   * @camss: CAMSS structure
> @@ -808,7 +813,7 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
>   */
>  int msm_csiphy_subdev_init(struct camss *camss, u8 port)
>  {
> -	const struct camss_subdev_resources *res = &camss->res->csiphy_res[port];
> +	const struct camss_subdev_resources *res = camss->res->csiphy_res;
>  	struct csiphy_device *csiphy = &camss->csiphy[port];
>  	struct device *dev = camss->dev;
>  	struct device_node *ep, *remote;
> @@ -836,8 +841,13 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 port)
>  	}
>
>  	csiphy->camss = camss;
> -	csiphy->id = res->csiphy.id;
> -	csiphy->res = &res->csiphy;
> +	if (res) {
> +		csiphy->id = res[port].csiphy.id;
> +		csiphy->res = &res[port].csiphy;
> +	} else {
> +		csiphy->id = port;
> +		csiphy->res = &csiphy_res_phy;
> +	}
>
>  	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy->id);
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index c54185c93a8a..b0d60e70e4bb 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4796,7 +4796,10 @@ static void camss_detect_legacy_phy(struct camss *camss)
>  	struct device_node *remote;
>  	struct device_node *ep;
>
> -	camss->legacy_phy = true;
> +	/* Legacy CSIPHY description implies the provided CSIPHY resources */
> +	camss->legacy_phy = !!camss->res->csiphy_res;
> +	if (!camss->legacy_phy)
> +		goto done;
>
>  	/* Find first remote-endpoint and determine if its a PHY */
>  	for_each_endpoint_of_node(camss->dev->of_node, ep) {
> @@ -4810,6 +4813,7 @@ static void camss_detect_legacy_phy(struct camss *camss)
>  		break;
>  	}
>
> +done:
>  	dev_dbg(camss->dev, "legacy phy mode %s\n",
>  		camss->legacy_phy ? "true" : "false");
>  }
> @@ -4841,7 +4845,7 @@ static int camss_init_subdevices(struct camss *camss)
>
>  		if (ret < 0) {
>  			dev_err(camss->dev, "csiphy %d init fail\n",
> -				res->csiphy_res[i].csiphy.id);
> +				res->csiphy_res ? res->csiphy_res[i].csiphy.id : i);
>  			return ret;
>  		}
>  	}
> --
> 2.51.0
>
