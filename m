Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECED46DFE4;
	Tue, 21 Jul 2026 16:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650645; cv=fail; b=PLCysjj1A86KaQjizs4It4T7B4LelDR5IT2GLQ5dYF5iER4hjeHIYkPO3pjELsupBUtE8yOTt4Vt1//P1X2EwQ94K8El+xcVI5pOyCMDZxFG+4rgbjIGmJvgSXGTFy5H2SMhdK8kLHsT47dOgKI9caBYVw5r9ieP+oZIfIXhHkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650645; c=relaxed/simple;
	bh=1157Oqg5wweoA8pZdJR5fw+kVHAeH7XBvqfiDuoM+qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ooSzSXulSIJ7VsOvau1Uk9aXrvLiL9P/cXmeX3HoFmHSrYF/3VL/6eeHOnOhcaY+jtr87d2f5AggKkVRB/xxM88BU8CCndWArR+OLSZmJTaFaV93ttIC/6+7J3JVT1vaqKzlhC1M5jFKSg4pK9BVUVv/2HRCswECMD46h+whVDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cap7lc4O; arc=fail smtp.client-ip=52.101.65.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cap7lc4O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJKRqIhig7mIteqKFQ7rnNLMA4HHO0i8gsLZe5sHdE+QUtPHOI9Y/bZdLugu/6wKXL6KI3F/fSAnO42TR+InKIE9Qa1zD9JYq/EhyHifPzvLlD77lHkgd9tlajaKroJycDNbz+YF2LfpBOkuQFOdlRrf9VwqKk7P5MW1sRxyw+3B4BD4xKg5BjMk2RkzirYz2EkHP+0VjUwya8IaOpsnl9dM/O/M9rp1NZtUx5e56aoKK6UMojRvwQsfaFUrXg2X05fkGh8yEeux/cr2kbBAZSbr0yEj3mFqZ2PqFSovfD2CInDT+bFk+FwkK7qU7FQhffAh673PvFhUiq/2qLTKaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEnKF2LSlnCasLelzKeX75mbBnOtlcQDMt5+iIsw1+w=;
 b=dhuVEzwsG6vnycDriHKWr8Yd4j+Mz6rFiiJwnabsnunNNS1iac/kr0wPY+ZMCXuDtk13/hb1jj9LFlhAlg8Gm+RjH3f9WqhGnARxDFz5X2kpQcP/a+UNbgMtTDk/+qBsPOr/qm3GQbUhg6ZM1dIEU+fJ8EphtxOX7gwqmmkcntUiudX78n0mwlB7qYWQFMMYG6HOV8wl2gtbwCPe1MX1tYeNKNTnbtgVKW7xwCTZ/0w4sA/BaNSUOgABv4W30SqImviL6NnOcQt++osGaFeQ0M8e4QQ2V8+OFZ6FUtgaL8ypJ4IHDZQvxVtLcyyHfALh+j2MGUxLFtgW+WO3FALr4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEnKF2LSlnCasLelzKeX75mbBnOtlcQDMt5+iIsw1+w=;
 b=cap7lc4O1vY75rAr9TIh35yqDSYia8jf7q7mC1IcBankNEOn4Wk0It+jtApOJp/FY5n7vhQAtEez0b5MV8CbvcPVU7LU8sKzXKb2cVV6zguQZDbZMbl2Mcq+oJ8KMDsykYV6ABjccrZGVq84PPO9nSC+3UbTgUJf6MsP5V+XgtXmIDzQJYmMOpMcw6l5PpD88tpkIcZFQmshhQ0zkE61K54/6Huoa1btBXQ13/bDZuJJ+n6wg7dH+YjA7WVDQ7nEi5kIJwtk/mAlXZuLAG/Ab05SMkqYAsQtKZC3vs4Obd9n+krgGtE7NJD44d+7hyshoHcRcYC+1Hz6zeddUx8kxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10904.eurprd04.prod.outlook.com (2603:10a6:800:269::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 16:17:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 16:17:19 +0000
Date: Tue, 21 Jul 2026 12:17:11 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: qcom: camss: Add PM clock definitions for
 QCM2290
Message-ID: <al-bh_SrvsyhyazY@lizhi-Precision-Tower-5810>
References: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
 <20260721-camss-version-v2-2-b2440d99085a@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-camss-version-v2-2-b2440d99085a@oss.qualcomm.com>
X-ClientProxiedBy: PH7PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:510:174::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10904:EE_
X-MS-Office365-Filtering-Correlation-Id: de0262ec-e494-43ec-67d4-08dee74389d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CogoBHBRUEUErxfk1O28QuxOzVzn462FBKTQCuuItoNPisdXYBZzQ7ogTsuEqfYt/rm31xmLdcnfvutQoHHbSXYj25Q7fNfXYR7M6/Y8oZtPIGGG7UQTjS2zkVFGtMKwG/hAMvF3aMcVuV0H4+7kz5uP105EL3nWKeYqShNIR7EPogoNXgHx944pwwigVjLRLLWkZFvCWXKJFMNBZpehlR6eETsTArkG7Bj7QS8fQ1ZtYlqt9yMbRpmaSLtkatH9Je+MTU1JSCDv+7C3yLGA3mT+yqRI1Dvz0oyYdNThNdsXxN9vA3Mlg5APZEVooIkA2H0eaI7o4ReBHOVG/cLC6hyeoM3YsYssQ/xORmVUqm2j/CretiJ+jrL0A/hSPhr1Sj7uG7r12wfCiUtvNVr43+zovxgbxrW7cXYui6lKPzLzHRbEOvDfF7NVKB7jTbXZUmAPhNIcgRxNyU33thG2bNAEDOlIO5C12OjQlL/UAJCVoTn3cDUDJoUXhAprKYrmyWnBRQPpYRVCc+powjlHdSgaIG+VboXAFXeKZBnRwa7PjZfV4Ej8ShhMRYvZ41qsSUunJ4mNQCkHyAIm7f/LZGLy1+2jtMsUXWFvipBxfIh4bWt2TiZSakg8FPVx7P668lpfCASuRUaIKnDMuvAq/aLmU5696rxSbMHnOdY7UlY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t1Rwb8t1EjZOszEJf4ZJC5FzZpStywu9kEzWNOY55/HeW2dCnVEgVbpofbNu?=
 =?us-ascii?Q?rCTIV0LFu//A5B+LEAXHdT+kZ8aItI9Nf51Vb4gKmNlPyWE8aJ8GFJnPNYnd?=
 =?us-ascii?Q?5z9QIsFj7ntcHBj6X1uVkIaRWsEJobS9xeW+E4VtG9vMfGh7c/FOc1zSq0Vj?=
 =?us-ascii?Q?bUbuyEPqd95LhUcf6odeonBVFYj8+b37nVF0/CwZ1JdinDcrySueasyeEu1B?=
 =?us-ascii?Q?MHQs/TwzXtOcCmcWgEvecxbxufE08BLGEwzSgIkupI3rlrv6fHeA1e2+2Qmc?=
 =?us-ascii?Q?rlOdaX8mt6PemgWty5GnTlIVRCOgIBZGJVV1FJFZbUCYg82JDY81QcN3obPc?=
 =?us-ascii?Q?xgbAwo2vz25GtsdOPNJ8MmBTrF1H9kI7LaZYnhqM8UXqvFVwFO44i98PZ8nI?=
 =?us-ascii?Q?o/Jx8LhpMhi3Ay0RcGgdxydxltTkWdjPiPrZt4/+eBPt/uajCoDnixB8KKjF?=
 =?us-ascii?Q?rID9+7Rif0UHoUZtZTmHlfIk+QB8KJ18uXcCwfV6yqgUh5LfBddA0QJK+ltf?=
 =?us-ascii?Q?Hmm9n4rAUl6q69KNmdFa/gdUvoWd53Iiq6dk7uA5S/paKhGUDxM1C3Mubw6V?=
 =?us-ascii?Q?/QOKSHtMJOoGBqVxSDhd0soUq45KYHIln2m1ihwkzW6xTmALZFBvUtmDwW/Q?=
 =?us-ascii?Q?KzU9hJb9PWQ16hhFd9Bu+xJjx1+M4qhUD8EqzhMHnjI5v4T50+j+uhqG5BvX?=
 =?us-ascii?Q?y8ezV3G09tcJl8UQi6xDRXvExxo9cQWYrkq2JxhY6hfHdaYXYcokVEq79JOq?=
 =?us-ascii?Q?ThkSp3hxqLt9f/3/0DV1ejGefGJ+Q/CkY3gbfoh6HTc3+045RkigilShu0yi?=
 =?us-ascii?Q?SVfuzVWtWkheYKn9WEEudr1gJQjfKiz44MsuoJR74TqFS7dIjLDhusZ8jUJN?=
 =?us-ascii?Q?Vc+A0DgQ52BIlUtko/PmgqJdBPp7LVf1RcpmWWEwyfBNH6TGoNDB0ZD4ylxq?=
 =?us-ascii?Q?5hDdC4lm4By0VIxfnQZLshtiiWWOlFh+vGK82tfDpjtMuovvYPqKo2bvVXvr?=
 =?us-ascii?Q?iSu6B/U0Y3b+tkweYXOA2jnVHf46ycWxcPGZzjhLcClafJsbJjHNDRSGZ7jr?=
 =?us-ascii?Q?bUPEE9LLraLZjWbXmjrKgAS4AU6wwATSAIwBNR+wA6QrVFptNmnkF84gxSSH?=
 =?us-ascii?Q?3xectSiYzzIK7N33FXArcE9IdkDf0YR1Qo5KyWm8sIT6dhLGYS+y2pyNv6YR?=
 =?us-ascii?Q?Fyf1XWqYdJ6OFOXvb0rAES9FSk3VwyJDhMPRQ00fjW5FbLpJ1YiTOr+nNdYR?=
 =?us-ascii?Q?1RmL6pw/CCSDtRWW7lGQ8dooBwkrZ4noEZo2wd0KbnbPMLczazwQoCT0UX7M?=
 =?us-ascii?Q?T/lK1g2WbPlVsI5mVm//6BQ7KzOWqIEX+aHEL23Zsd3uGtocGvWi/mn2Opdl?=
 =?us-ascii?Q?y9tmNrzVHv8wndKxEiWh4DMBQaT0DJx1T8ycPr26ZxP9Tw2dDVHM1OCnlrRx?=
 =?us-ascii?Q?pPpKoZjlop21wTsbUDynqj+P1l3UnTE6A1sT8K1Z90maxkmxYSzh6KxyWfHb?=
 =?us-ascii?Q?2ptwwjIfju8c6+TFpcka7Q4C7+iPRqOCXzhG02S2yRu1hfmDBha5rRDF90bx?=
 =?us-ascii?Q?VhJyMWWrMt+raw9F4+1jAQTgMU7QisV5Lr6dLAclTwP7QcIPMjyJfeVAC22q?=
 =?us-ascii?Q?hEn4l10T9PeU+FO3HoTw7rihLpLhlDLMp43liCVISfrXPaR3Zls2p+Eg5zqu?=
 =?us-ascii?Q?Xy+M1PrRxJD//h6SSxS3ji9lY6GF7VBp6EZocFf+ZWLaPM4EJIEKJwk6chfd?=
 =?us-ascii?Q?6JvSCal7lyNCyisQ7dmCNahE+PcWzzE1sv4RfgEYi9q5A4RW441C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de0262ec-e494-43ec-67d4-08dee74389d2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 16:17:19.7521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8s4adZ37C1WapwmdOEnMP/VxEjUOeZpl+DyCECIGVkBjgvcrPM2cAyZWMjhYgCPoTEgbWZIIgaXrV1zSIIMOFGjmc8/hRe08JkAMh5b63reaMzWxldTiOHBYQF5Voma
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10904

On Tue, Jul 21, 2026 at 03:21:09PM +0200, Loic Poulain wrote:
> Provide the required CAMSS PM clock descriptors for the QCM2290
> platform. Register the top_ahb, ahb and axi clocks so they can be
> managed automatically through the PM clock framework (they are part
> of the camss-top group).
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/qcom/camss/camss.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 01a9d4f780fbe130554601481bed50eac5978bed..a87161f3d5524a6e40a7281e28787538613dd9cd 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5591,6 +5591,7 @@ static const struct camss_resources msm8996_resources = {
>
>  static const struct camss_resources qcm2290_resources = {
>  	.version = CAMSS_2290,
> +	.pm_clks = { "top_ahb", "ahb", "axi" },
>  	.csiphy_res = csiphy_res_2290,
>  	.csid_res = csid_res_2290,
>  	.vfe_res = vfe_res_2290,
>
> --
> 2.34.1
>
