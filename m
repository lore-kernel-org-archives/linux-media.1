Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013032.outbound.protection.outlook.com [52.101.83.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958C8165F1A
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 12:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784636336; cv=fail; b=m6VLwp9b6RfV1OjuNEJ/f+Ds1/40K4b0/zf+6C5QThQkPcnK4TRbstIbfw1IE0s7DYLPeY/hfe355Z6DK7B27t9Kn5juYMhipJ9fWt95M9A2JskS00hz5nTPZQHeWqckZDFkcaKwGsE5qNIndDxb0TowlX2MJ0nvHOBolEttvGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784636336; c=relaxed/simple;
	bh=Vpslvo/dSSB72fymrWHLHpFhN7lcXOXVxulYdJjG89I=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptk2fhcvJycKB7Zk2ejZV83mYTe4cDDs+djwWEZVH/WYMEw8TXVMo3HMz6yr6iSAhtb9LeQmQghKv8mM5yrpkUn5iNM1X2p9Ac7GmKyqSeN0KI+02ZJt7hRXHMmYZQzpfS5ygL5t2cVrz3+6VS6zM6IHkqH3lM6XzDfOSoX03bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=k6IMTEjx; arc=fail smtp.client-ip=52.101.83.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="k6IMTEjx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQPMlSdi7PHU3FuqjVy/sfslKmRNNsDmgHDMDFmu5/q3DPvVrn/UDDml8KsIRN4sKm82O3rR9z98tm40RCuKwvsSqi6/lfbHvaywb1qNqsK2L4xux7mgiNB5lxKwZ25Ed3klLwBguckT1FmjAjlBD9bTtxqB7mhO1doGq+24bn8qerWDAld/BP5TEaP36KZPA6n7QajEoPDLExl1IH26aA3orULT1vJ1QC5ElPa33pCnwns7Lhvr0tA8q+BU9mA9d62DKqzbmwao9SOkQX0cOq1GaPvKKSSfW6UKTYPT8Y8IwTuDop0IQ/9ASEa//ZYsCHaBu9GLXzt4RJbc4st//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYU1rJF3CJfjk/6tRB6pgzqf2m6z/n0AwnoC8+PlZdA=;
 b=MHKIWoo2Zb4h/R+AzXGX14MixJJvQOv/xdIJ30oB3n24CV8DA9FRrtILVaHObys+wMHh9SeqvsMdsFGakEeCrD8ojWGXjESfJ9LuZUXl/WxV5VUNxE0wXAShyOp9wEY5yG6DtknKyjz3dL8oKsySxpRkCs9eaQq9qEBeIxn6qX2QlREfadQ1N0k6TdmZb8b4OFCteuEzvmhknz97ows0RN9PzQ1pN/ws/QQElhXTskYm/zvUZuNxRK/Hr+BY2UObLqcAO9FS8fHfITOrLt7ZH0W2hzNdPAY6ykv7TY6+iqnW6pwUUXKmXEBOAagB7QVplnf0qMV4Mqfa07M/5gHIUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYU1rJF3CJfjk/6tRB6pgzqf2m6z/n0AwnoC8+PlZdA=;
 b=k6IMTEjx5IAKA2lQwphxYoz95qRMeMO5p+q8zlKnjvU5C92zpDSKa/nNgja2/QOVbKJFyYJTPSai3IWVaztYkRP/IxrCIHtYTBPQqCf3RuC+qHUNx160EBcEXcUQz3VgUg87BeestpxUy5VSCHtvG4hN1fMQogG2K3rrayCkdEaqUK7xSA1L0BVojJ9ELynU+AHjGZzaulxP02/tV9iustF/Da3LkvW3HQwfhkWEzSX9A0GewaP3H73Bfcsm7pjQWf6Kl98GcMdzJbD0jNEWQ38Y/tixGlJ4Hz8dpNqt5P/0O6Rhose/wnQDrMsJOfGBI7Pg4SOmaRxZXE61A6cb5g==
Received: from DU2PR04CA0319.eurprd04.prod.outlook.com (2603:10a6:10:2b5::24)
 by DU4PR10MB9190.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:55a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 12:18:50 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::98) by DU2PR04CA0319.outlook.office365.com
 (2603:10a6:10:2b5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Tue,
 21 Jul 2026 12:18:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 12:18:49 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 21 Jul
 2026 14:23:25 +0200
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 21 Jul
 2026 14:18:48 +0200
Date: Tue, 21 Jul 2026 14:18:42 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Biren Pandya <birenpandya@gmail.com>
CC: <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v3 06/22] media: platform: stm32-csi: Add missing
 media_entity_cleanup()
Message-ID: <al9jomV3t_UOWJ1c@gnbcxd0016.gnb.st.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
 <20260614202835.11977-7-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260614202835.11977-7-birenpandya@gmail.com>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008859:EE_|DU4PR10MB9190:EE_
X-MS-Office365-Filtering-Correlation-Id: 90bab68e-d1d2-40bb-a734-08dee72238bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ja+yLaRdkDLnnncWYF+csjOYss9sWGDEp+S9obqAEEvH8ersvrFK1dc2qRZtQ3RB0+fm8Ye/PSrNcqoXU+gkODjbEPncG7Vr77ygh7ZflNLKGyhbEKEQ4cFm5WISw6A8nMfITiAiTsD+Q8ko9wOMCQPwwft2RPKAtEThxBAoUtKNQ2Ma09JKHHSvfQdeX8NsRXf4MB5nLclmvL3D4Hoj819v3HD9EK5GvRxCgKVSPwkrqAEb12MYtwLxE2KDAznxru79bhcbi1rHxtAD5NRVbGNlHQV0+HjBxy3P7vWgtCBgP82HvrTMIU14iLRKFZSbS/lfpjFmnqP2tG5fLfnIdw7GtBytXMSiZghDzeZ+TiFdwrbYKYGv2ZhvxbYJtXelR3hWd9OYu6qbY/Riv0WJ4i9PF3ug5VZyXBoABMiX85mymE/EGXOyhX7S7HNQoeC0sj2/6sTRyAA9xwa6m6u5WWYUJNp2D14ZSOFGewtHKLoZsTxSpmfnueBOErDUBxToOeewXCMnzS7Jke4kOQ4rqCIgpYAEefV1wSKg+TdXcl02XkERhBjb7zQAOMbZEprh7lv7SO5Ap9n1XOi6V5fEnKy70rDYqfh+ORP/5GgrN0mdFSPIV39/wdTpxW81jKvbr7OCXr5Otx/sSt0DC5pk063bvEu467tGeCfQ3hzx7IHW5awPC/3cm+B7L+FtZ5Hf9ClnrSfWWHDFilxv2Noeig==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rNyqPrXTM6dXeb/yl0VC0Hgpl73XCQuy9zYRuxzzZZg80Vmn/8x6c9NfgmFPKcA/SvgQGtPkyf5TXAdmi5Vi1o4rkh2XvVI10RqNRAMk4xZyvGbkHP1bXbXNF6Rs6eVdGMCEC/jy6O2yyhdH683QvunXGSkEMR8tP4IZBpeModHFj0plyEyxRBJ2Ae3ceYp32XjirgzasI8RvDOfIK4NybE0dKkGzHjQ1vzdK+Jk+CAVKaA8LcEb3M+FXK9/1+vZZa1b017zix94REK0pSd9PztCW0P4rPWen83iJc90H7haFqjz8Ei7DxBibwsrJCsuoBQzfnQj+uGUu76qyS+oaUiZTGjDO0O+DGRRnfVhNQq7+4ZPJrovVa9GvmaKH5j0z3izf6Bqn6a+wRsIhhsHe+0l0wF7iAS+RppDt2VuqNMR/kV10zR1nNjtX11ETEs/
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 12:18:49.8810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90bab68e-d1d2-40bb-a734-08dee72238bd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9190

Hi,

thanks for your patch.

On Mon, Jun 15, 2026 at 01:58:06AM +0530, Biren Pandya wrote:
> The media_entity_pads_init() (or media_entity_init()) function initializes
> the media entity, but the driver forgets to call media_entity_cleanup()
> in the error paths and remove function. Add the missing calls to fix the
> API violation and prevent potential future memory leaks.
> 
> Fixes: dcb0f4c16be5 ("media: stm32: csi: addition of the STM32 CSI driver")
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/platform/st/stm32/stm32-csi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
> index fd2b6dfbd44c..0847fd347d56 100644
> --- a/drivers/media/platform/st/stm32/stm32-csi.c
> +++ b/drivers/media/platform/st/stm32/stm32-csi.c
> @@ -1060,6 +1060,7 @@ static int stm32_csi_probe(struct platform_device *pdev)
>  
>  err_cleanup:
>  	v4l2_async_nf_cleanup(&csidev->notifier);
> +	media_entity_cleanup(&csidev->sd.entity);
>  	return ret;
>  }
>  
> @@ -1068,6 +1069,7 @@ static void stm32_csi_remove(struct platform_device *pdev)
>  	struct stm32_csi_dev *csidev = platform_get_drvdata(pdev);
>  
>  	v4l2_async_unregister_subdev(&csidev->sd);
> +	media_entity_cleanup(&csidev->sd.entity);
>  
>  	pm_runtime_disable(&pdev->dev);
>  }

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

> -- 
> 2.50.1 (Apple Git-155)
> 
