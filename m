Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013025.outbound.protection.outlook.com [40.107.162.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A391C6FF5;
	Thu, 20 Aug 2026 07:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210006; cv=fail; b=ugS/arIuCEOD5L1PsJU8pEw9BEx3sPSknnLyaEGKUJiy/wndrSwl7m2zY3xPL34gXThZk90WSYVSMUhg3TCEv4rm8zLGw1FnWlAqNXAjUcT4wgb+j+zu2bJhIIQUZld28wyPmz6VrfAnGgywmMfPzlEhTvHxYiiugmqDkN0nRag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210006; c=relaxed/simple;
	bh=sSV04KMHRgms8eLDFBQ/wBQgXCa9tFg3DmsFgtFbZcc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSFLbVTjRuD1lBzfH1EUphwD+deJY2T6Xo7FJD/LR3r9WqhCvSxA6oLemy6BfaQrcszPO9uJrMTv3gIOIQOPyL6+zOMVfUOZeG5+fR30fWTo1gF1BVYyKXJ/fuOzMK+f6+57BtTcwCFtPeu20EaYv7ZoHdwhWMLuVX3KAYclIr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=i5UsCgPd; arc=fail smtp.client-ip=40.107.162.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="i5UsCgPd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pl00DgFACnz6Ae7xDxgqNQDNRo993jWsP0lr0SjvYPtDGzh+3ymnprSDkqW06W3K/EHOYEijPleqyQWBzvJaChMeUuGR5ZCvg8KsvcylWNSdAA9OmDfQbbY9OY4364uVZegNIzHcrvBdWyKMDX+bB80n6jAbB35gqenRpznvAYp0npnIc2i2vCXaGM8D+sS/hWRxWNvkR9fKBhL+FTMngLmDfHZR/ToPxzJ+2/wyoVA6dUPNDBuIPgC0h3mikw8imYzzKca2UHolmHA1zLz9IVKNA8nbbv+fIQg/9MIX4QkAnzHmC01G3ANgmAYpVX7PSrcf9hwnORXMSIL9o//4Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkTfuTYJ93nywvpSKFjkzxgC5NUBpOIBH4vkgQrAOyk=;
 b=yDQm8xwzMNNuR3ID52T0KplddmCWJpiPwDDdRBZOlI9qAHJMIpjWKM5380QyHUPAQJ0ZE7VGJEz9ss6c1xl8V3JJLKaiCm+SgPc31cCteT74UPSM1ugxcxSzx7Y+Orhgi6/FO8dtA/B7Du+tBI0bNrKO4ciVcipVmdC3nAkmFAMX6uxeDjJbpG48Rko5S/rhtiE4JrbP5caNwv7YzSZGjlvyf2CiN95aHmkDu0P6WAC7PYuJh8g/M2GQTAGTRZIgRF2kkMqgTV8nJWelJK/nzn33gjRomLCq5bfueqdhSUZOMrlm6VYXYmpTCKaPB4IQPhEtFjstdeMlZO0RL5e3LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkTfuTYJ93nywvpSKFjkzxgC5NUBpOIBH4vkgQrAOyk=;
 b=i5UsCgPdG/CfAcJAKLmMPjARoQeeoSQtmjj2YfXy8Pr4VWkhhMkT9aPEGfi5KWFyyQ64la8VT9M/n4YvLn7CKpJmJknVi8kCn5nzQX7bSbOwWpQbkv03xojnhvzgrJAP27LsKxo7NMVzBOG6U1E4KzYxoDePdIq7O/bK89PGaiLslQAYd36ka1zUC0htZNWe7FYJL3bjH56XqUwcrAf0JuZKUNDsHIeQmH+fMwBKxai6248vGgzFoBAT0pmci92QKca3ZD0ikeCKWoHnggJr3Aj1hC+IOvg68hfFmKIXi+M9QEwRFHYw2b25fxVTP7Wo2Cjr0XvSEk3uAL0S8X/B+g==
Received: from DU2PR04CA0304.eurprd04.prod.outlook.com (2603:10a6:10:2b5::9)
 by BESPR10MB9343.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:b10:f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 07:13:18 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::ad) by DU2PR04CA0304.outlook.office365.com
 (2603:10a6:10:2b5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 07:13:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 07:13:18 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:18:17 +0200
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:13:17 +0200
Date: Thu, 20 Aug 2026 09:13:11 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, <linux-media@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 10/13] media: stm32: dcmipp: pixelproc: addition of
 dcmipp-pixelproc subdev
Message-ID: <aoapB478q-3OVY9c@gnbcxd0016.gnb.st.com>
References: <20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com>
 <20260724-stm32-dcmipp-pixel-pipes-support-v3-10-f77fe7e723d9@foss.st.com>
 <23512cf4-1991-4ee8-96c5-a83e8ba197ca@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <23512cf4-1991-4ee8-96c5-a83e8ba197ca@kernel.org>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFF:EE_|BESPR10MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: 4835eb7d-ba1a-4c06-e015-08defe8a8293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|10067099003|56012099006|6133799003|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	NXNA+2kZtfp/yQe0dC6xdUDV7/cysE6czTp5pTnB0nPKR/Tj05azlUe/NK6Jxm0DDAHm2PbwkAWAckNyF1ufCYO55RwwloFHjfMellx9f1m6av6vYK/yhVcNJRqC8W2UWfCY4CBl6FY//viVaCCLeT8m6lvxiRkc65Qsl1J7X4Qj08mrjpdrcGZRd7/Sqw9JbRPK/KXNyotjA9StYWS75T/a1V/xCpy8At5ipxyALk7L0cVzI+70pWOQc4PwpdpgILtr5bq4z1peyFUzSnXWvDoHXLypO9/IDKSsA0Wjt0xxED4q9R6YWIMZIZpi80RP2TfkqMGra2n2sGsljXKbUXppoN6gKK45aygCOKUS2wvzO02hZniNEo2oOfxL2K7iOhfBl8VTXpjQsbyACep/322boiBe5jyJbv0yMDnmIYOH45KMMqEdU3ShrMo4xDKbn4brvzLdyFH+azD/ls65PBmaa5UnL0so9A/x4mteASGfjgADnS8RhG6zH5n2fyr6ZrMcMPE3mpXiMLhg+R9+Clex6nu5DEsl50e22+GS7YNMVsO5dhZQrt2qPa8N+o3WhDDMISlaYgM5VwToA5X/FYQRu6BYqye9ZuVIwWZR44M+83Mj6+q5vTjp0cqeukxOmgj4VS7xekvn+R8/ILhrPC0LFdGWFQTBjPT2ZY6AFMhJI7oWoXA2HkN+rwoOSfNv4SMzwO10IZQuGspQKktu7Q==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(10067099003)(56012099006)(6133799003)(4143699003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tabBAm6jnLYkMgSM5yk/UoHLvckh1qBQRoJRgPZxQrchsxvXSDg02y0OEU3RUItlfRX8LLVhmON04R8PeFcLxDZ8zHW+S4k3h6tS1oaLQNrOUcNmeWqnwr6hzKnZg5O7jduU+IW6i/JviALk5yYEU11VXD6Pcvl4Mj0T+VT3KfdcDg81JU5P/hmPPeuev2pNfgKtAAazeRyydfRcxbFxSbBN520mgEGvCMaQE++w7fez0FKAslDp5v71sCvf19EDMfUktHSmWAjE63sjnDqZo8lA5KNCnIxBv/D2srhpQ1hf/ub6aqmG2FDkRXS8yl7hatEv66rzBUpTEXeOCWL11QXh3n50EncDjMtR7idmjXhQgwLunUPHD6jpOGNeMyOEFU8KK4luQdPHfIrnAc7zZFnIGRTfXGmZvf9wUop7pIhvniaXkXsaoy8hvpOFB1Zq
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:13:18.1676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4835eb7d-ba1a-4c06-e015-08defe8a8293
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR10MB9343

Hi Hans,

thanks for the review,

On Mon, Jul 27, 2026 at 03:49:38PM +0200, Hans Verkuil wrote:
> Hi Alain,
> 
> Some control-related comments:
> 
> On 24/07/2026 18:13, Alain Volmat wrote:
> > Addition of the driver for dcmipp-pixelproc subdev.  This subdev is the
> > last one before the capture device at the tail of both main and
> > aux pipelines.
> > 
> > It is in charge of:
> >   - framerate adjustment
> >   - downscale
> >   - gamma correction
> >   - color conversion
> >   - pixel packing
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   2 +-
> >  .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |   4 +
> >  .../st/stm32/stm32-dcmipp/dcmipp-pixelproc.c       | 941 +++++++++++++++++++++
> >  3 files changed, 946 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
> > index a708534a51af4..7178934bb116b 100644
> > --- a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
> > +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
> > @@ -1,5 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-bytecap.o
> > -stm32-dcmipp-y += dcmipp-pixelcommon.o dcmipp-isp.o
> > +stm32-dcmipp-y += dcmipp-pixelcommon.o dcmipp-isp.o dcmipp-pixelproc.o
> >  
> >  obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
> > diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
> > index e04fde86550a5..8f41473605aae 100644
> > --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
> > +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
> > @@ -285,5 +285,9 @@ void dcmipp_bytecap_ent_release(struct dcmipp_ent_device *ved);
> >  struct dcmipp_ent_device *dcmipp_isp_ent_init(const char *entity_name,
> >  					      struct dcmipp_device *dcmipp);
> >  void dcmipp_isp_ent_release(struct dcmipp_ent_device *ved);
> > +struct dcmipp_ent_device *
> > +dcmipp_pixelproc_ent_init(const char *entity_name,
> > +			  struct dcmipp_device *dcmipp);
> > +void dcmipp_pixelproc_ent_release(struct dcmipp_ent_device *ved);
> >  
> >  #endif
> > diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
> > new file mode 100644
> > index 0000000000000..4372c75508725
> > --- /dev/null
> > +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
> 
> <snip>
> 
> > +/*
> > + * Functions handling controls
> > + */
> > +#define V4L2_CID_PIXELPROC_GAMMA_CORRECTION	(V4L2_CID_USER_BASE | 0x1001)
> 
> You need to reserve a range in include/uapi/linux/v4l2-controls.h for this
> driver (search for V4L2_CID_USER_MALI_C55_BASE).

Done in v4.

> 
> And the define should include the driver name. 'PIXELPROC' is much too generic.
> It probably should be called DCMIPP_PIXELPROC.

Done in v4.

> Please document what this control does. Typically a new header is added to
> include/linux/uapi for this driver containing the CID and the documentation.
> See: include/uapi/linux/dw100.h

Looking at other drivers such as raspberry etc, they seems to have their
header in include/uapi/linux/media/xx so I added a new header include/uapi/linux/media/st/dcmipp_config.h

> 
> > +
> > +static int dcmipp_pixelproc_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct dcmipp_pixelproc_device *pixelproc =
> > +		container_of(ctrl->handler,
> > +			     struct dcmipp_pixelproc_device, ctrls);
> > +
> > +	if (!pm_runtime_get_if_in_use(pixelproc->dev))
> > +		return 0;
> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_PIXELPROC_GAMMA_CORRECTION:
> > +		reg_write(pixelproc, DCMIPP_PxGMCR(pixelproc->pipe_id),
> > +			  (ctrl->val ? DCMIPP_PxGMCR_ENABLE : 0));
> > +		break;
> > +	}
> > +
> > +	pm_runtime_put(pixelproc->dev);
> > +
> > +	return 0;
> > +};
> > +
> > +static const struct v4l2_ctrl_ops dcmipp_pixelproc_ctrl_ops = {
> > +	.s_ctrl = dcmipp_pixelproc_s_ctrl,
> > +};
> > +
> > +static const struct v4l2_ctrl_config dcmipp_pixelproc_ctrls[] = {
> > +	{
> > +		.ops		= &dcmipp_pixelproc_ctrl_ops,
> > +		.id		= V4L2_CID_PIXELPROC_GAMMA_CORRECTION,
> > +		.type		= V4L2_CTRL_TYPE_BOOLEAN,
> > +		.name		= "Gamma correction",
> 
> "Gamma Correction". More likely, "Gamma Correction Enable" (and ENABLE should probably
> be in the CID define as well).

Done in v4.

Regards,
Alain
