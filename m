Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793201490;
	b=m8KWqCXQ0V47bLIctfRqn0WHyZ5HZj93A3R7qWwRC0WdrdM7JTHwXzfHwHXLFFBe6A+i
	 +h6Te7O4m0dMtVhoIuSL95HRMGSYHAege5xSrfh0b/WVLpgEQrfbdVp5aF+gbf8ntzUOl
	 SLc+q7+MOOBn0GQHUcvpv5Do2zIhNp9lQx0vDNABlH4G60jbQcGNzHnWNIQsrHlGFoWJv
	 uZH4z6rk9LffN51RCS3NM92WXNGEde70yE9n78j2g1nl3tzLu6eTTXA334rIkv3+99XqG
	 U8FQ+MOYMuT7XTVAvhHdzsAUFFLVN6PMkYW3T9Sm1MIco15MYInEIb4l9Hk+rAZGyYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201490;
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
	bh=IX3JOYzFZd7L6LKermR36vDkcbmBt1yq22Rvwr7h24o=;
	b=jH45V8Hu8IAwm4T1WKqg+hnOtxgaDkpRPZ5yRFLimtOBVdi0SJRNsSQk/deeoWw+wkU9
	 Lh1w5aczRji3+KL7fif58ta9CLx/CkzvAEdgpboLPrQeJVgwm6fe89IyeHaKNH0S84bTr
	 go4WX/+jT3Sa9oy2l9wv67NF9JphSoT4uqymP725vlJtkXz5KqFM/NuxuBROf9dB/CtsV
	 7K3Y7WW37SZDcvWJnmZ4Z1PMoxy4pwyfFyJGQUpVkZtsakCI69MPRr2kRcPhbekOWyQHn
	 P2+kt5QJDhA4hrjWkYMssgQuXc2dMFbH9RGWNRhh7QKj26lyjueLQYcv5xBJ/pCcE0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=o4krB7q7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.50
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011050.outbound.protection.outlook.com [40.107.130.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086AD606A31D;
	Wed, 28 Oct 2026 15:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 086AD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=o4krB7q7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6OZKQcX0m7HUdc69dkdksKYC+hCggiZoA5orpCMqjiTQocYAG01/QLlUOl0ny5rmA1BePLi8tiHxJZ5v+UDO188xuQeejw/s6ENtTBP256S+N7lThIUVxaGsmmFXAOPhVbYWDX/YfjPzVexxgwdWU/t7MiEOHzSugsb/msn3RO7DXthWgWPmAhNhYR1G9KCPkbElir9aE+pfl1PqBEhS65z71CXdOawFhAxbYPcoSvKWg7oAfPGWHV90ioRxpEguGdijJLlf4slB3RiNx5OsitEqkbUqRcpUxxzeud6jzAxK4GtkFN+WtF8vpxIezs2pnC4P7E3sInv63vxf/Cwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IX3JOYzFZd7L6LKermR36vDkcbmBt1yq22Rvwr7h24o=;
 b=DuYjfMfidwh30EFZUUJEaN0OtkV/ZDmmo4P0WvbkGR3X5LKYKsb+qCgrGhSyEOPWlZk52VCjl1zqp8InS7LCiLAq4NjmFYRtu23RVfMP0i2D33Rvo1lD6xGo/7UaTepDVeXbvHduDA7swrvTX9qncwX8J/1rcsLF4i/2Q+NNstVcwtYS7IOy5Ixa7eso5jwq6ee/ZBpYTwQHd8JdhVR2yzdUnayqm8GjwWTOf3XkBmlqFAIXuN454zWODbjo8b+jzNCpLUVFQBFx1R9oIdUOklM/dCbaYqvboVvggbKHBQ5x7crezNJCZmJ/9mTSVr/qHmqfGLUU/D7BGqwfYDGu/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IX3JOYzFZd7L6LKermR36vDkcbmBt1yq22Rvwr7h24o=;
 b=o4krB7q74J02RY0n58n4Qw+Ec81q54mWAQKntnVjSv/yYazGaSt5jLC+JzKBKV/pA+mNojJxq0wvFXztbisonQdRyPTmsTczUHsFx7P0qeLHrtGJw2oRlvF6FeAU6JJk0WVJndYMQBJduNRIg7ASw2Cuq/AwVkujs4i2FZPAgfIhDxTBCt3GjH+JZRk8dIL22ykaQpvNC5ZCsufMSgxUYEf2aBSsFd1d/WFlnZa+GDTAF3KAMW1oq4ozoHap5Y5web1xdj5vVP8S4Z/2erTBygdTmb3YtL3P5VfQCt2+Gj7T3PfWxQH8EAyOqTkJgneJrhlVdtT6HPIR/Iv0+Yj99g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB11522.eurprd04.prod.outlook.com (2603:10a6:150:286::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 15:31:22 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 15:31:21 +0000
Date: Wed, 28 Oct 2026 11:31:12 -0400
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
Subject: Re: [PATCH v2 4/7] media: qcom: camss: Add SM8450 CAMSS support
Message-ID: <auIVQNdHp91xwzqO@lizhi-Precision-Tower-5810>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-5-vz@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026224957.1115370-5-vz@kernel.org>
X-ClientProxiedBy: PH7P220CA0048.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::19) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB11522:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db824b7-a3e8-4e69-23c7-08df350884cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|19092799006|1800799024|11063799006|261026140227099003|4143699003|56012099006|261021121427099003|261022105027099003|261009223027099003|10067099003|261028144727099002|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rmdygdOl2wHlQ8qnQgo/8BAGDqN9EyEqP17vNJHrGSTdHp5WFlEvE5kpNRQFvzaTmPjUfSISkYokh7eY0o+cgKqQAnsjX6m7Xl7pt4KwPXgkhu/8CP92vjqj9Txmsl0Os9iLR0u/3eS1Yc1zqzh9xZEMeqQUM27uc2cipiuYxRPxBc9xHdEbsTrFRexX5u/hoAW1Y8JZ+0PDSavnZBTs3uAOSdCmFzRWs1jWmLFWln6Zoo+be3lb5QNk/mgV/NRyvaKZSgvHpZAOrzc77pdIJCdPG50WOXzhO0Hb2O7Qt5S2LqtFzAUgmsxeRK000RHdclKc7uCE1v8hu01hWxhdBWOoIZagK++BNjBN4YXBGUv+aEBkA3/Qy/XzmkaQaxSLv3ZDKTuqZ8W8Jbv4ifC3ojxb4bxtqpZl357oiftL/8nWsGZO2aKS2Mtz7h3T1/krUCHFW95vYC9SWbY4iuAwwghEHVNSufGi8QWpeQzpSVcxzEI1WG4phyxpwf6gxtDaGrFE+dkyRLPcC0CHQj2YdYRh8n2XI3VTpfLh4G46Xgqm06odhET/wEddGQB6LyyV19e0QIHu4k9GnvuNxBTi8Puo1rvPy0XVOg+DeDz9PKB6uHkyrph7SZUL3AXwDcGAK9n5U7+UbWTdGuCpUQmWAaFMYBA1sfGq3l+VXPxvxs0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(19092799006)(1800799024)(11063799006)(261026140227099003)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(10067099003)(261028144727099002)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EOTFx003ncNip93XrfWQLLGmcS/Sy8raN1mfhCxct3t45S8euIozklQUq20W?=
 =?us-ascii?Q?KskSiK3do1Tu+HwGb9uARghmajCox2oWSWCVy/bL+1Wk+iGwNPLfQgeEIqSy?=
 =?us-ascii?Q?1SjDlZSLugGW5c6NMhq1G0NOW+YooBqeSmltEhd0L+gdOKDZ4pEv7s6PBI/p?=
 =?us-ascii?Q?Wmzg2ZTLn5YAMTkmT2E7er5pHUzz8bBRNawlG7AkiJFyvpu8/i5ZPgBhpPne?=
 =?us-ascii?Q?Cm7oEmPHyKMtUibS2DgFOtuafoHxxTvT0CPVX6t+33eb7raOzQwDVVvHH68a?=
 =?us-ascii?Q?8HBc+uW0fEI9818LKZA8MlYTlJWoqqq6SUCV1Yx7gM4qp2a1SpDxTQ7IXewC?=
 =?us-ascii?Q?7iO5h/705JmEGDTXjMMa/4vskifNyyDAH1kkGcmAd9sV9Vs2b0viPv2iuncD?=
 =?us-ascii?Q?APPHjKjcPT2dNN69Nxgg0q/EjP7ZMPDTY4LoJ43aMWmWY9ictUpwsudwbOzn?=
 =?us-ascii?Q?k1WPkkH7PAivjqCc0bw5mkvymTir2xLzouYgBFVQB1ciaBX8S0UXeCE6wi34?=
 =?us-ascii?Q?xqBOgFE+vkp90ecx/tEsJW7xnsJOHqVF7l1j5ao1WCLziXYA0UhVOxTo2n5X?=
 =?us-ascii?Q?kIqb5NsT7BRiTG2TFIIbYGSWt5XNIz0Z2xz32U8ratT0L+nJOaSkVv4s3pGf?=
 =?us-ascii?Q?Tk4zVvxXTpR/7wYGeiRGoXnf7mRRxwhTzdmUfn23xNFgMNP18+H7Nb0Sw/Vn?=
 =?us-ascii?Q?kpzJPsDMXhdG+FuYNCtKob79aMlDjriqLprX2YdoRiDzFjU1Kv+4VTiubfO7?=
 =?us-ascii?Q?AffH9RP0k2H95aNVLvLxeVHfXjnBDZOOyXAAltsU+JYIkzj8DJAVdmNVKkEg?=
 =?us-ascii?Q?LFu3DhCJCqE/LbJODCayV6Jpk/iz1hsVUs0u1NiZAEJyQuhaezHEpTr2+vZv?=
 =?us-ascii?Q?sQcEKNSTtOgse84Zw0QqLqFuwBPxF8ggSLGVX5IBXddaamNIHG2HFeUuexn3?=
 =?us-ascii?Q?oeRMOl5iV35/XYWS2gWTFHk3BMqM9IXKpvcdBf47e+AE+WnwQw6SQg8T2noV?=
 =?us-ascii?Q?S8EdX13pZvoFEhrflu3g1m3mb6XhOVYaBw9adPv6e7imrwb/JzKQ2Jxc1Uhs?=
 =?us-ascii?Q?QIqAx4svC+8CtNc6lLX2ELrkXrjRbbToH/GYMAc2gFBDcyCUauBxFonBMNRL?=
 =?us-ascii?Q?jlQeIReiDSUeDdyZAWBnEzYwbufZVWwskzORV+VzT3sYjyOj3ypIvwrKP+dh?=
 =?us-ascii?Q?G2GlOL0S7uG7oObSob0j/B+j0p6IzaH/n4j5sPfAroMMhF7AVELi+brFx8IL?=
 =?us-ascii?Q?bOVe9fhyd0Cni2q8lK28+NlEcePuhy5bS/HzeP1K1A0teNBEBbTvlV3RXrsK?=
 =?us-ascii?Q?s4xlBFSDav/ZlVHA69hhLu8FAzTre3Fnrg638YRH4ZMjsGFJu4Yx4W1J421l?=
 =?us-ascii?Q?odWrYQwA2dbm6jdj1b6B23xlrcwFlUyxI+sdhyboiqKxKTDFTZ0Wf5sBmwDm?=
 =?us-ascii?Q?uXgYp2Qv5YIVGXZ8Dmpp8L5xoov9fCo3GJc4+m9Le1Ap4n40uIXeRPTsutLP?=
 =?us-ascii?Q?gz/sTej3/Abkb9kyeBl704TUPacU25HKOvELaMd+0psc1ujlXB+9zDzJFrkS?=
 =?us-ascii?Q?TTifpR73AypOycYnzNa88/mvKAaJ7W9oMyQ1S0qC0DoBdQO44tWxUAsgrXL2?=
 =?us-ascii?Q?0kRkSR8y7o5mls0WdQpgNaGKRBSebSd9aBh5/UcVSTwOg98x77jtLr0ERlLU?=
 =?us-ascii?Q?L+HW7j0fhTBUifHIuCZ3A1pwC5lRtAO7orjcWj0H4fjI1SU2VNd0rGkUgtHx?=
 =?us-ascii?Q?/7TXtQS50O4wQwcOZ09/fOqye3i7CZOqhuiwmRjPPxyIFGiEsImU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db824b7-a3e8-4e69-23c7-08df350884cc
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 15:31:21.4701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lW6yfIhSzJtHdGDqWFw123L7tF9nk4QcJQHBo1DPn60AKgV212drgOrjloJHVW5NdvnClGiMba+Quq2fpcPNqmDr931lO5DRrYoSrCBJAfu6nYtRC18yCVpxaN5Yvq8q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11522

On Tue, Oct 27, 2026 at 12:49:54AM +0200, Vladimir Zapolskiy wrote:
> Add support of the camera subsystem (CAMSS) found on Qualcomm SM8450 SoC.
>
> The CAMSS IP on SM8450 contains:
> * three CSID and two CSID lite, which are supported by CSID 680,
> * three VFE and two VFE lite blocks, which are supported by VFE 680,
> * three CSI test pattern generators, which are supported by TPG Gen1.
>
> Qualcomm SM8450 CSIPHYs are supported by the CSI2 PHY driver only.
>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
>  drivers/media/platform/qcom/camss/camss.c     | 236 ++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h     |   1 +
>  3 files changed, 239 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 2680a9914765..8ebd67bd9b2e 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -350,6 +350,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>  	case CAMSS_8280XP:
>  	case CAMSS_8300:
>  	case CAMSS_845:
> +	case CAMSS_8450:
>  	case CAMSS_8550:
>  	case CAMSS_8650:
>  	case CAMSS_8775P:
> @@ -2010,6 +2011,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
>  	case CAMSS_8280XP:
>  	case CAMSS_8300:
>  	case CAMSS_845:
> +	case CAMSS_8450:
>  	case CAMSS_8550:
>  	case CAMSS_8650:
>  	case CAMSS_8775P:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index b0d60e70e4bb..1db66976e51b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2967,6 +2967,226 @@ static const struct resources_icc icc_res_sc8280xp[] = {
>  	},
>  };
>
> +static const struct camss_subdev_resources csid_res_sm8450[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csid", "csiphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 480000000 },
> +				{ 400000000 }, },
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.hw_ops = &csid_ops_680,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2,
> +		},
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csid", "csiphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 480000000 },
> +				{ 400000000 }, },
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.hw_ops = &csid_ops_680,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2,
> +		},
> +	},
> +	/* CSID2 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csid", "csiphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 480000000 },
> +				{ 400000000 }, },
> +		.reg = { "csid2" },
> +		.interrupt = { "csid2" },
> +		.csid = {
> +			.hw_ops = &csid_ops_680,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2,
> +		},
> +	},
> +	/* CSID_LITE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "csiphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 480000000 },
> +				{ 400000000 },
> +				{ 400000000 }, },
> +		.reg = { "csid_lite0" },
> +		.interrupt = { "csid_lite0" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_680,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2,
> +		},
> +	},
> +	/* CSID_LITE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "csiphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 480000000 },
> +				{ 400000000 },
> +				{ 400000000 }, },
> +		.reg = { "csid_lite1" },
> +		.interrupt = { "csid_lite1" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_680,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2,
> +		},
> +	},
> +};
> +
> +static const struct camss_subdev_resources vfe_res_sm8450[] = {
> +	/* IFE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_hf_axi", "camnoc_axi", "cpas_ahb",
> +			   "core_ahb", "cpas_fast_ahb", "cpas_vfe0",
> +			   "vfe0_fast_ahb", "vfe0" },
> +		.clock_rate = { { 0 },
> +				{ 300000000, 400000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 432000000, 594000000, 675000000, 727000000 }, },

Nit:
	Can you align clock and clock_rate wrap method,

	"gcc_hf_axi", "camnoc_axi", "cpas_ahb",

	{0}, { 300000000, 400000000 }, {0},

1st line have 3 clock at .clock,
clock rate also 3 clock_rate.

So reader can know corresponding rate quickly,

	for example, If I know rate of cpas_fast_ahb, reader can simple
locate by second row and second col.

Frank
