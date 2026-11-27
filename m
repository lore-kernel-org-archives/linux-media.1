Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.84
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795749949;
	b=zos3Mjei3XwAwuk1US43SpvfSTUl1LTgMl/bpJrLze3Bk4tvRsU4HiVMztIdIo7DMfCm
	 Lq4vyIA9c9nqqTUD4+tgQMS9srZTIfPzg0A+i5CbOQlC3oxzYaCSLcHsc28J/sSOYUFzv
	 QksmFAxj29J/ntwJuswA02H9rOxVWXc1xqA5EWGr5/NanA+0nkGKLtltt10N7Ha2nlQjt
	 Lsx90r3v9K22CEvuILxW+5SbuFfUIhXAnxUzrYHrgAMV9OI9CuunKIWNos78aqkuG+o56
	 pWYpEWNb1umMlNskEV+/RA9HSy2D3p/Uv4mBwN+7GFNoBozvo0k++zXHGy+w6pjzcvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749949;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-PublicTrafficType:client-request-id:
	 request-id:X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
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
	bh=PvK2R9x3IYHoQ9s2JRmSkxGvYXJTQgBXkMpevIpkjuQ=;
	b=ym6zAH+NljggFybKoH6hf2wqQdvIextJTOUwGYIiKsgEwk8nFAirE1ZvyigkDugJOvna
	 Gz26HIE2RaVTCDHM1NVT6V90PcFCwA9tCY/B48w8TPd48dPPHihtEVxcnk6itw8R27zV5
	 zf3G1CAofj9/kwhko7DilqnIRdrf4gYlVeh2+u0sIeu2xsz/8d/KtFjQoKRuoJL5QkNVt
	 5exy95xRYefALcwGrKlI7WosHWyNkyhjU0YAy7s27edxr71Tm6nXnymFOYpQB9wFr0+2g
	 Nq9pu4va61ywUOCB0/cJOG3o3e1EnxfIH7TlS/zcBuPHo4Kp6rzxIxLruuI0yoFUDhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=yxgl4ETU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.84
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022084.outbound.protection.outlook.com [40.107.75.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BA0606A31C;
	Fri, 27 Nov 2026 03:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8BA0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=yxgl4ETU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrioRz5EvyBJzDUYTY5RX7UFpgmE8RTLPhqX6mQ/fbWscTH/A+Brd4PizO5XwAtA1nw1LFVb7UQ3LETdhWU9duNnFCXC3y6HF+muS5LPJCpkyHLgWEqGgOjXHkVnQ9Ti62eErxnx26TEGz2LVJzBMjiYtnV63jGrI8EF15AtticiZQnCZ6RJ5fA1wdujn0jv/XygnW0PUt3DZqnY+l2CEx/GWfLHRxM2DW4WmpvROaegS34MYuYELVJMpPP5oMU4zI8zK3rS1ByUbXmemJLqZarwaxLWEcqdosn/s6m2F8ZPn8IjxH+cud+yXF8bNVf8JBshSbLBbgrC2V2HO8/doQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvK2R9x3IYHoQ9s2JRmSkxGvYXJTQgBXkMpevIpkjuQ=;
 b=W6vBBonCz53ZNa+rkgTzwrAIrPPdQPBlFc72ttZ/W0gZasXnyMOb/d0H5/n0keRvtWg9XKdy7msCnXdCHAMhPl6DbtWiVOTH9PAoFL3UPhGT7JyWPtj9BI/PQUyJuoL1SV7HlMq08LT7yrAme00I/VdqKWADQRJQxgjlgvV9jFXspKD/BN9USIC04MFtPQJ13xVNinMBfisSzhy50UoomzU1fdPQjI0NvdW2X/+bsUo4VBcm3JZOjyPbD8cq6bCovBloBkYbtt3gRyc8YTCVKNaomJzucLkv65iCoMvdMe2SnDOkagviG15ns5UOUPwdW69Hi1qoZDUUjHIKiLZhLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvK2R9x3IYHoQ9s2JRmSkxGvYXJTQgBXkMpevIpkjuQ=;
 b=yxgl4ETUESBdRWb05qpX0PpnPFPRPV0s5uyepsJPyRZLw2Gk7I8tqe/8vB02LkYyF7E2Ev3SGdvdamECpsYzJjZlMrusEWpeMMZmIwUfrru0+Z1glwkGopNNNJsnkknXirhHjWahVYaDe3p8HA1Shk7VE4uvFgTkPOr08NLVa7kIKQUJAmLnM5Bal/+UCqtiyhP8CYclg7p4/cYFAug4IJlF6p0U6dvAAswndEirF+sCIO7m6v4ZqL090F4SvA8vqR+J56siGKEUY1Qoe0XGvXTN4iPOuGiZm/fYSu9iRt/tUHLak+NjkXix/vLI6OJMkvGQujbTiA+uxU6a6IzMUA==
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SG2PR03MB6537.apcprd03.prod.outlook.com with HTTP via P2P; Fri, 27 Nov
 2026 03:25:44 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 03:25:44 +0000
Message-ID: <d221b7a5-e2f3-4957-bd6a-4f7b40277001@amlogic.com>
Date: Fri, 27 Nov 2026 11:25:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] ir: support IR for Amlogic A9 SoC
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261127-a9-ir-v4-0-666dbffa76da@amlogic.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20261127-a9-ir-v4-0-666dbffa76da@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0004.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::13) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SG2PR03MB6537:EE_
X-MS-PublicTrafficType: Email
client-request-id: f9aff4a8-b7bf-4bd6-9656-faaf03778217
request-id: 0235683e-4f8a-42bc-7f73-08df4c361ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|261026121527099003|10067099003|11063799006|56012099006|261009223027099003|261021121427099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	LtHEc4Rf7pA3Ne9DFJ46P1tBr9JPkvikTF3PXyqN5XT9yvLeVaOi0sTRuAQHYtL1PA67bz5Wumy8/c7LIJYFz7a6eInfK4s3hl+MOwRHh53igzLH7MRgaq0E9gvjgQcwUVtY2TJUBQZ1nnk1Swum8AoyzZv1Gi2zNnSDGJd6Miy9u3D0af7hh0qhVDMNLNUN9+UG4Jt7XzfwDfbSgIbqsJTSlC0B+ZuG704R4Z8vH4ORqkfiWHaOk+c6bZM/1iDPA6hZotJJFcWPwLQUFKbmIj3upZJv2DaInPJvSBOUGUBS11M1IW7MbFxUV9KC3BiYfZL7UyR1brp0llkjCFkKRnYxG0HDO2ed6xJ7xzSvxVNzDY3gbSc5jEWMT2dAIkLR5+VRExhIsUCLxpqs5DJF7d/J1ee46Pk8xb9yoUirWWlXlUQkWJbdJYZbHaxuBdJDoqQ7b/Zwqa+qT81KJWvUL8FU5R0NDPbYdS+PlHZT9a6tQf7dPl9CnnnKwUDNfy0BThLgdgayW3Wr26bxbOHZUfXX7TIYqXlTlujOU4aAeYiNFy7Hlj5OsZ5/eiIiOIknOmQhRqLl2uSI3KMrvs1IR3mBzvXeyAJG5QHD6VrTN9I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(261026121527099003)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVJMcFJ1TjRBblYrZGx5eW9yOVhPRjhLS2laTUdsZGxSTTBkZUVETVBMTisz?=
 =?utf-8?B?SUQ2anM5Yngza1hJZzlOckxLd3FUSWI2dXZoaVRJV0dCcUdHUDdGOTNqTXpz?=
 =?utf-8?B?V1o4d0JDUzM0UUNKQjU4QjF6MDhLOVhXd00rL3Z2Z3I3SU5EanYrREtCcEZs?=
 =?utf-8?B?Yit1VjU0YjF0VTZoQTNxZ0lvZ0xwQ0l6elo0THJGSlRSWTZKMExJdkl2cjBW?=
 =?utf-8?B?M1pUR2w3OTQ3Y0hHMGlzTEtyeWN2WHQ1SS93ZmNPM0tsdG5rOTU1VDAyOEp5?=
 =?utf-8?B?UU1pWHhaZGRFY3ZSLzh3K0lybTJNM0RZVHNjc25xRGdhQXJITVZDUUlUS0Nk?=
 =?utf-8?B?c2RpYlRNOGVVSGJuUkJ6REpqR3FjNEZMclB2NjhxeCtuM09xbTFOaGJ2UWts?=
 =?utf-8?B?L0Z3dGFQVk1qY1RiOG9JZXo0aDVVS1g1ckYzbWtYMVhSQjFjWDNnbnJFN3V1?=
 =?utf-8?B?RHdHSURlSDR5dkl2Y1lrbURhSk14aHJ0bHMwbjhzcGIzNVNGT1V2WHczVjl6?=
 =?utf-8?B?TjBBZzIvQ0ZxeWh5S1BJMzh2TGNCa2FXbGdySDdsajNzUTRGUVpEcVQxUzlR?=
 =?utf-8?B?RGxJQ29uMkorMUZLMzhqUTBZU0cvWFNWOGVNZ084N08yellxeXMzZXJtbzRt?=
 =?utf-8?B?NTNwR3pCMUJKRVdtQ1JQZ0VwNHJIK1dQNEo1OWx3MzZ0MHZ6ZHlHRnNoakFq?=
 =?utf-8?B?ZDh5OVJYQXhuUjBmM25yTmRJRjNSeE41bWM5K1ArU3JrOGIzRTFPekJnWFkw?=
 =?utf-8?B?ZkdWS3BtQWdBOU9GOWJyV2ZXTkhONld3cEYwdndrSEZ4bUVZZGFXNUZoNGox?=
 =?utf-8?B?ZUFlK1hjalNEd0oxM2ZIbytCL2FhRDVOeVBISlZ5UTdTekNpRWxRY3VaT1g5?=
 =?utf-8?B?T1h1Ri9OV3hRd0llVm5kalFBem9NeVE0dTNmbkVZa01hYzE5L00yNHRmeGpq?=
 =?utf-8?B?a2p3STM1eFEyUWVCSjhMbTJOR0JRNi9sMFZ2MmEzM21hZ1hZa25FMHZrTUlo?=
 =?utf-8?B?VUVucUo4R1ZmSkYrSnV0WEsyUUxEbmM3ZzJsS3ZwZUFFWUp2NTlpOGl4MlRr?=
 =?utf-8?B?bitNZ1prVnVXZXZaUE51Z2FHMndQQ2g1VlFDV3VML2V0WFpGWjhPYzkvMTdN?=
 =?utf-8?B?QVd4dHN0d3UwMk9ITEtJSkJER3ZLZmVyQWFrc1JvOGJUUGNVL2kvckVZd1Jj?=
 =?utf-8?B?NVduUWEyNk9ZUk1ZSHZCTGRFbjRRdGpiL2xLSjJjWFRSZGFMOHBreTBTV2Nh?=
 =?utf-8?B?L2JUODJheHkveC9GL3RuZTBMdEJybjNsWWVYUjJ0RmtjSjU5S0h2UXBpQWdY?=
 =?utf-8?B?STZoVm1YQnN6VnROVXcwcmhRbi82MFBwWGlUcE1uMkc5NXBiaUFCL3kzV2lW?=
 =?utf-8?B?OEk3QXRwakxXeEd6blZYVHRLRUJOZnVyRXl3S2l0TnZJZlgvK3g3WWN0Tng2?=
 =?utf-8?B?Q0tRZk5xNCtDeUs0NzRNZWpVVVFVQUtsSVNIU1l0Y1h5K0Fjbit4VjNSUGRP?=
 =?utf-8?B?MFR0UmVINTNBU3AxaERVWWJOS2d5K0R2NkdVN25xajArMFJyTVIyc0MrdlpB?=
 =?utf-8?B?YTc3WThySlZIajBWTU1SN1k1S1VaQ2tEZFlYTklpTEhqYyt5aVBEaHhqdzFQ?=
 =?utf-8?B?UFZQdGcvQW5LZWZzbjViemM5aXE0enRWUFZXUUE3SVVFQjBVdG82cUlLYUZu?=
 =?utf-8?B?cXgrdHppa3lvVkExeTUrTytTVUpTbEdNSWFZQ1EzOWVYWjFSdTRVWTRYTno2?=
 =?utf-8?B?NFRldTZnV0cra3hyWDBYTTduTXVXQVV3MFdOL01rTXJQL2NKdkRTWklKdGpK?=
 =?utf-8?B?NjJwd1hoQzEyeG0rTFNXWUZSbEFrOVdhU0tSandSOU5xNXhQV1krd29aK1RG?=
 =?utf-8?B?MHNzTGdOUUl4OU5HOVRLZXNTNFpadmZEeVVDdW9kNzYwelZnT05ocEEvMEMx?=
 =?utf-8?B?cTVUcVhiRTZ2RFpERWcrZldXa2tiM2JQUmRDb0s5aklmVXdBOXVxWUlnSVJW?=
 =?utf-8?B?bDNZY0pEMklrdk1OaWZIajYybXdLTUJOUnMrZ2hkdHZqbjM3dmZCaU9jWk12?=
 =?utf-8?B?eVB6eDdGL1ExM0ZYWk83NU55eFlpWFZhK0ZHbU1rNWN2TWFPbDFaYTRFR001?=
 =?utf-8?B?R2c5cy8zdVl5WlhFSG1ibnp6R0lBSWNYd1VwRkJjc3ZqRDlZV1l0dTJuZFZK?=
 =?utf-8?B?bWRuQyswbk9SY3lQNzhLcnZBcjMxQXIvNEdRdjY1YXVXUFJ1MGRlbnVpWnp4?=
 =?utf-8?B?MjZCMDkzREpsWFdpTGQ2Z25jeUcxSGlYbXZNdHo3NDJqN0RXYUVTTVYvS21J?=
 =?utf-8?B?Qk8wckV6Uk51dzFlZ1ZlMEVnZG9YRWtDZHFTRStVNWVKWXlWNHNsQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0235683e-4f8a-42bc-7f73-08df4c361ef9
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 03:25:44.2335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TiFHz1foF3Omb/IEa8OFQOFi07+9fZ1H2mGIt2WKF+qCLXM7dnIU1dACZVtlnO1cmm0oMkF8zLyEBNSTdoJRThSeRDC9jqZi4GcjmkWuqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6537

Hi, all
    Please ignore this part.

On 2026/11/27 11:11, Xianwei Zhao via B4 Relay wrote:
> [ EXTERNAL EMAIL ]
> 
> Document the Amlogic A9 IR controller compatible string and
> add the IR controller node for the Amlogic A9 SoC.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Changes in v4:
> - Add Neil Armstrong's Reviewed-by tag.
> - Add Sean Young as the primary recipient.
> - Link to v3: https://lore.kernel.org/r/20260903-a9-ir-v3-0-cd471c667c15@amlogic.com
> 
> Changes in v3:
> - Align the node of group-remote-input-ao-pins.
> - Link to v2: https://lore.kernel.org/r/20260709-a9-ir-v2-0-42c21d7a6ffc@amlogic.com
> 
> Changes in v2:
> - Rename the IR input pinctrl group and its phandle from remote_pins to remote_input_ao_pins.
> - Link to v1: https://lore.kernel.org/r/20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com
> 
> ---
> Xianwei Zhao (2):
>        dt-bindings: media: meson6-ir: Add Amlogic A9 IR compatible
>        arm64: dts: amlogic: a9: Add IR controller support
> 
>   .../devicetree/bindings/media/amlogic,meson6-ir.yaml       |  4 ++++
>   arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts    |  6 ++++++
>   arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi                | 14 ++++++++++++++
>   3 files changed, 24 insertions(+)
> ---
> base-commit: 807a34cf91c1d91f2beb3cacef9eaa98bd56d172
> change-id: 20260706-a9-ir-354fb297e716
> 
> Best regards,
> --
> Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> 
