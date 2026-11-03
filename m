Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793699726;
	b=A/IrRCm9YkgnTHzvuYy37/YBxphaRRs7nxygNtpFWg47JEsP3AslrTW3orF69nzcgn3+
	 q+sYumwdi772CR+Ub1IYBywZXnsRIfNzRF8uRI+ZxOKeKs/gz+K8z+oh8YD7IscsjkZyJ
	 Os3B3jsxhEWVT5PXLU8z9kgCVEiLAqMqJC7eShr2wEXkjr+99z/I0KuO8ldDOGPKJuLb8
	 ZpfbsfjyG+ONkeMe/s8MXqVbL9yx1d4uLg+8iKnzge7Siv25bx/aSVmyaRvOonjTVbqN+
	 JNjxjCdp6b8GueAjsQYEUiGM3Og8rGgwfK1nSiUQZ5WC3EQl7DNY8u83d5CEyUoH6qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699726;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QK4W0+2rV4uOAdyR8XXjP33BimgTB6QVk2rt1yvwufo=;
	b=t5sjPaNRJpSpKFnsaM9Rb/Tm/EI0M9rNR5c7SLdBoLVRNZObWVS3rqBeZcXYvIV/hGVT
	 Z290I8h0zFCaQ5FLT8vywTjqRuorgysV3X6/iDnqnPj3n+T3c8yzGMmN6XJ9qWnELKajE
	 xNnsAa+SPxIGjGan8c5DlgPvlTIrkJpQWLbMmXVvK1xEd+5VQIyq4mQbSAP9d/UDyysme
	 OGeOlr7IukyR6hoAa+fYrkbnM02CR0fgH/h9Km8YKxhBrH4hKWpiopMsNHG+Z2/j+dP2l
	 aB9Ch6NIFtE10WwCqvPdk2xibcH7KqJA4+MvZpLzxTDA4EhLN5/zP72HFz2EJqjo72Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherry.de;
	spf=pass smtp.mailfrom=cherry.de;
	dkim=pass header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=jgo4xsFJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.58
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013058.outbound.protection.outlook.com [52.101.83.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58CF606D81F
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 09:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B58CF606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=jgo4xsFJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxCzh5J84XG3ws7XSpeyM8qiZMEwNGuSQADP2dFe2U94ND8Xt1xfghjDzxpdMH1XQp1APc32VEm7LBLcojI0CMzHagShdp6ju5JiQuR/HIzAS9r4o1zhpe8uU/LJUu2JJ+1uwVjb+30evcfuzevjBqd58DZiUqR96P88/OuIpEKqGTBQZCyLKpISCtVHOIcSTUS2lfw87VIeA/KqE7QQlIJo/QnTbp0BwwsIWiw7UXIA3F6zzP1qmAe05hNrHyifjYAsIrfq1jPRpM8/UpV1kaX44Az+pn2edGCFZaRi0AHraHiO7c1QEQGCU1pbkYOJlTopaWSdwjGv/Fe1cabSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QK4W0+2rV4uOAdyR8XXjP33BimgTB6QVk2rt1yvwufo=;
 b=PLz0V16xnFJEyWU9ll6zgsgRj+ge1U4mouxOvxQmFDleyXaj4Iz+lrmved2ho4iSsMkEs2AV/f9dPtj2zbCfrMv6GUod248rvk0bo1nc/u1wm/w27lWz89bjY5lh+9aEzIk8z1ZFHI0aI4rZl02iLEqVF3xd+eeqM7FOp3zFbBddaoglicZsUAt/JqxdiL5M1VYR7x719IWdjSjk+F5fOdEIJk/XJ/vMrcETUmPm4JGSKf5rZgj+CeVtQg8BB9Bsy5d6/zBQQ4mFrNgyEWfl5R32QkFlchlIJ/Vh1g7Cp/EpPRQ3Mk1UhVS1s73BGuQUhHuMiHv1f61sQBNMjgyP3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QK4W0+2rV4uOAdyR8XXjP33BimgTB6QVk2rt1yvwufo=;
 b=jgo4xsFJU/dmSVSB1dzyQNC2NPNOvKXmk+fHUkqsFcFyjJ/sw0Rpn7VNXMdKbWqWLXSANGaGERvcAmdkVHicLs0mhxYj2TtTo0DO5e/rh+HckeZAuuimKPIdj6WE7I2L1nNlGjySYt0PXud2MozhRV90tFVhoMmfEIwY222px0s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AM9PR04MB8488.eurprd04.prod.outlook.com (2603:10a6:20b:41b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 09:55:18 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 09:55:18 +0000
Message-ID: <23c37a5a-25b7-4f72-986e-d7cd89ba9fd5@cherry.de>
Date: Tue, 3 Nov 2026 10:55:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] media: i2c: ov5675: Move camera init out of the
 link_freq sequence
To: Heiko Stuebner <heiko@sntech.de>, sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20261026101646.2450051-1-heiko@sntech.de>
 <20261026101646.2450051-3-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261026101646.2450051-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0050.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::39) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
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
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AM9PR04MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d8a6e1-e87e-435e-7fcd-08df399090c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261102123227099003|261021123027099003|4143699003|11063799006|56012099006|261009223027099003|261022075727099003|261028144727099003|261021121427099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	LuPGxh07axlHWiWEOa5psRQ9G7JAlsjhJbMh4Om4td3HSC6WJPaxTjArs2jQmktzZuEeC/18iNzg/MRt22RD756kJC5dbS+a43TruLTTz8rD0O5qs5VnNIIKdGyVE9SVUK2MWlxewS6Bw39PVUZAA7yw50VXc/ly71eJpy3yrHIEvd9ZL52VeFnrEWBGktftWhf+vIdY85yu/Rozknq+bdENG3Shfug+bX+U7rcu92/sUM2MZrmPU74DtW3bmtrIuFikvKHiBImev/3YCd7z6ntVOu1v8ktHcakFbtLMW7rUacD+V1vObypq8H5N9cA9HL/eJesnhAX1Xk4iW3i7h84ybgv431p6KwGhbVSoZEpHXXlMBfx1PCTXMm3JiPODwTrVG2mMXB8uf21z/fL4+hyq6oQxW1dr7qF+gAo7FP1mPvnjT3lxYFIMk9dlMtl65DJftGBydcWY1+RmT7U002Hs4O4W1fYPMzFn6kCV4DAwBtzUVhUpt3QdD2HtxpKhSIbQEVEg5rhR/aTtEgJW1VHEHUHOX9kUWYYxkOzZ2rLDTO8myRuIhwDQ0jqI5kfuhmiTjia3FJlxjJLfb0TpszHreIon5w1dCW8RNvbklpLOSykAKL9zl5D2uHhmoxNH4KJO7m5ErA06tCQ4yJ7aINJhEliTA6hW27YbG/oUUrw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261102123227099003)(261021123027099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261028144727099003)(261021121427099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXhVU1pCVy9OVDlNOGhtTmxUbExPRnlLcUVtb1FwQmhGQndlUlh1bWh4MVpV?=
 =?utf-8?B?cmdzTmthUiswMjdWUmkvZXZ5dEc5eUNuVXU0bktieUVKYUFyaHVSeDZjbkVD?=
 =?utf-8?B?SmdQV0taczVhbG8xZjc4eFB6Zkc2WjJ6M0hLL0ZmZlVRSlZKYWhsRC9vNkZS?=
 =?utf-8?B?MDRlRU5CYUlFNjJ0NHRwbjhPb0JmNmRmdkNVckJGVlNUOGNwQnFFN005L2hQ?=
 =?utf-8?B?UFpyWGFlZ2F3VHROYTZpekwwMHJUZE94ejRiUkFpMUg3S0lhWXpWWUN4MTlJ?=
 =?utf-8?B?M2xiQytBR2dEcW5Qc3BNc2ljWkpyVEFRMDdLelR6OVNxanpzY2RLdHJHZ2pL?=
 =?utf-8?B?Qys1aDd3b3BBS1hUcDlDcUg3SEFxank4bnR6cklWV2JzZnpzcWFUOUVjc0Nm?=
 =?utf-8?B?MEk1RCtPL3pLSTczWHlmcWdqZjg3Kys5Ym94OEN4YythL1kzSlpzSUVoeHc5?=
 =?utf-8?B?L0tYUzNJUEdJTXFzWnBaY3dLcWxFMjF1eFZqWEd0T0JhTFRFMkZLL2c4akdw?=
 =?utf-8?B?bDBKRUZUSzB0QVNFZ09NbUg5ZFh6NjFCdmpVWXBlRWhsU3dyOTRlUU0xT2tH?=
 =?utf-8?B?bmEwekRGeGlOSWxJSFU5SjdTZmQwTFh0N0hRVGZjV05hYWFHTGE5NEFzSFRX?=
 =?utf-8?B?a2lNS1VoR1ZnQzlkNUZIRXJHeXdpdEZYR204Zm40Z0lRQ09ieE44SGxIOGxC?=
 =?utf-8?B?V1ZkbkNrWEtHWDkvTlBqRDNONmNleCtnTmpxZ2UrVGNTcXVyai9JT3YrQzFR?=
 =?utf-8?B?Lzk2cVVLcGRTNG9nNnZrSEZrY3I1Q3V5MDlRYnhNVnVtMEpwR09HL0xEQVVX?=
 =?utf-8?B?RnFGUlJhM2tDUzZraHpnQ1FLMW5GMG5Vb2d6czF5Qm4rb25JTHBsbUFhRlVn?=
 =?utf-8?B?bElTcFVqM25FcEQ3ZTJuOUs0ZHVUeFEzY0VqS2tDUEVhUzZiRk1kamxPTHE1?=
 =?utf-8?B?R21nSEJNMUZOUDM2dHJtNDJxdTFLSmF6OEpuelRJdGV4Mmo5cC9pdll2VlNN?=
 =?utf-8?B?SEsvS2N0ZHg0Z0RTZndGQzFNZ29vOWlpTWdDTmJJS1dsLzMvWlZPZkdiMHFu?=
 =?utf-8?B?dDV5b3dxczlCTktoLzJiYlFNSzFFSEZyWjBVamo4ZW82K0Q5RWRQNFhadGNx?=
 =?utf-8?B?d0dOZDJXanRHeUs1SlJvQk1wNFlhMitLQXA2b1BKbWpEU2lsaEpzc1NTV1Ev?=
 =?utf-8?B?OGZUZnUvOG53T0JOYnZqcjJ5aTJOYVo0RTQ0TVhTcE9aMENvREtpbSt0bXlF?=
 =?utf-8?B?Y2txcGE3RmhvaXBKMUFNODdPNGpxWjVtYjdpVnBTcXJhbXlqZUNRb2VJRkJF?=
 =?utf-8?B?ZWYxKzJNN2Z3d3dJeTZ5Tzd5bGpJNG5EYzhtTUZ1bnd1eWg5cWExRlNNTUlh?=
 =?utf-8?B?MjlQQ292ZnRkM3BxVi9aV0IyeE1pLzJBOThlT1NSN21GVmx0UzVseGZaYlZz?=
 =?utf-8?B?c2tENHFudmFUUmhwcGdtVTV0VVVNSHZwQ0U5Sk9ZbGZualYrWDVaZHRudVJT?=
 =?utf-8?B?b3d6SGtVTjZTV3kwS1FiUC9lS2NmVmtlbGZuTU13aHNNTWRWRTRYUWpuVVFm?=
 =?utf-8?B?a1kzTmJGMGNhVUVadmRWQXpwRHhVa2tEV3A3R1pXL1RJT1AwTGE3dzl5ektZ?=
 =?utf-8?B?cFdoM0dYMU5ZdU44VGJZbjFPVzcxeHY2TC9scE5vZFMvc21rSHd2RnlmU3ZB?=
 =?utf-8?B?WUZMVFgrSkl1NzExdDlUTDFhZzZDNm1JRDh1TThKQmhpcm1NcTBsMGNOd0t1?=
 =?utf-8?B?Zk5HMUJGSDY2S2lzTkZZMkFjbHNSMmc3aTJQMFdJUnRYTDJHNHVMVkxrWlBm?=
 =?utf-8?B?Z05wK1BjMkhBWHBQei9QQVA3NWZzL2h5aTA2MXJNOGIwTFJPRkRFSTlZZnR5?=
 =?utf-8?B?VDZUcnU2WXhncFExVy82L203a0IrYjduRjladmhMZytoUVgzWVdmSnRreEFD?=
 =?utf-8?B?eGxmcGY4cUJMVjVtU3RaQml4MjlxcWhhYWVYRzJtcVRVN1BJalBpMktoR3Br?=
 =?utf-8?B?QzFHNCt1QUxMOWsrMDFHTzFRTk1QSjJvTlpyUVRIQkxqMkxaQ1p5bDdRVnRX?=
 =?utf-8?B?Q2lOazFQSVZ2QkFad3dkZ0V1OUxaQXVleHFKMndMTFJwTjJLeVU0NFdvWGl4?=
 =?utf-8?B?Z04xTFlWbVBZQndJZlkyNVV1Y29ta08wZDFvS3hWZ2VyUHdremwvNDZOQVhH?=
 =?utf-8?B?bG81MnFPYjV0cFEweDJnT21WVzk5UkhHcXpzVXppcndQNFZaYXRmK3BOdEVt?=
 =?utf-8?B?S3hCRFErSFpNTFhFMUhwLzRLcjBGVEZ5R3lrWFFGcEhyT3RqWjd6UXlkeFlN?=
 =?utf-8?B?OHJveXBGdWhrVkRmZFVNWU9kOTNOVGpwajJlY0NuYWVGU3VVcFROQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d8a6e1-e87e-435e-7fcd-08df399090c5
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:55:17.8673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++pDVa/md5z6qdXtCtBWXMQr8mTwNb0FGK/2EwWpoYPvJQkGLfowWzm4BV27UL4wvF4xD8jQSyeK1/7ERlnx3u37XmxyRBQySTkluuX6J2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8488

Hi Heiko,

On 10/26/26 11:16 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The register sequence for the PLL configuration also contains basic
> setup like the software-reset and making sure the module is in stanbdy
> mode.
> 
> Instead of having the byte sequences, move those to a dedicated function.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Nitpick below.

> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   drivers/media/i2c/ov5675.c | 26 ++++++++++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index 5a5d34708e39..f6fea59c08ea 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -32,6 +32,9 @@
>   #define OV5675_MODE_STANDBY		0x00
>   #define OV5675_MODE_STREAMING		0x01
>   
> +#define OV5675_REG_SOFTWARE_RST		0x0103
> +#define OV5675_SOFTWARE_RST		BIT(0)
> +
>   /* vertical-timings from sensor */
>   #define OV5675_REG_VTS			0x380e
>   #define OV5675_VTS_30FPS		0x07e4
> @@ -130,8 +133,6 @@ struct ov5675_mode {
>   };
>   
>   static const struct ov5675_reg mipi_data_rate_900mbps[] = {
> -	{0x0103, 0x01},
> -	{0x0100, 0x00},
>   	{0x0300, 0x04},
>   	{0x0302, 0x8d},
>   	{0x0303, 0x00},
> @@ -890,6 +891,23 @@ static int ov5675_identify_module(struct ov5675 *ov5675)
>   	return 0;
>   }
>   
> +static int ov5675_init_module(struct ov5675 *ov5675)
> +{
> +	int ret;
> +
> +	ret = ov5675_write_reg(ov5675, OV5675_REG_SOFTWARE_RST,
> +			       OV5675_REG_VALUE_08BIT, OV5675_SOFTWARE_RST);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5675_write_reg(ov5675, OV5675_REG_MODE_SELECT,
> +			       OV5675_REG_VALUE_08BIT, OV5675_MODE_STANDBY);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

Last 6 lines can be simplified to:

return ov5675_write_reg(ov5675, OV5675_REG_MODE_SELECT,
                         OV5675_REG_VALUE_08BIT, OV5675_MODE_STANDBY);

Cheers,
Quentin
