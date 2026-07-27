Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022110.outbound.protection.outlook.com [52.101.126.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998C422576E;
	Mon, 27 Jul 2026 02:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785120221; cv=fail; b=FCXoP9RY2vbWwgYtBjjCi5ifeeBrK2u3PpnAiUNrtyy/V5DLYphlQmokdSk+c2aU9ANikk8umFIab1OrzXnpFAG2u4yooml3W5TD2Q70a451f6gNyScRxxTRoA0T1xIqC7K0aXLWGv6TXic7v978Uh/d+8jg6l/kWv8m7RFrm08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785120221; c=relaxed/simple;
	bh=wH/xRkVGPwTkvHL4CP4BD2kIE+HvZbJ3NKh5cq55oMw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=knYMwC6hwDXaRmJFSwypHjkDxZt6fT01g0li1u9AOlYP4a6bok39o/5H8osHNeJPMHcXxhI6Qa1e/9tZE3Q54uhnEIt/SRk3kEW8ZGVOBhuGmeD0O3ACB3oDME24ZeL8zDeOKbbb7llOJUJk+KwG3QhnMSR9VcSQjLEr6T31Cfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Gx91jRqi; arc=fail smtp.client-ip=52.101.126.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Gx91jRqi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMKADiR+pc7T7KgTBIC/daAAQeuApDvSiZr57XjU5+CT9BwoY/joOoS+3UFKb/eN+TCcH7WfOiBafX4+xWmM6L0yuM6CIUSBL7vag2QibLSyqLtc1OK3aa2UdK357JZiERmn++hY2PMuiVMYxyHGPfFi0cDxRqiOVQteLvdNWUePu2pihsN3jXviI3dkS1k/GYBExhc+2pqhDcYuCQBrmi+zprxwVfE8ivtr60MmtjpiTfaklgIsuqMbQiEH18RthTqQ8VkmLCHWvoce92bYMnTrDiZK44HjeknzJkkVclo8G0Bpy+8+aURO/PW6sChVNw9P7PrY2obMhj0polOLuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcEORw9VWKJR3acYG87doG5MIJ2DTptp9ZRY0sqkBXg=;
 b=obWiNBwZ8EMnEzZY43/7PlgjDIw89+CmVVd/ElL+MRqk8h3cOr+DKnG07+AQxapnoCCBxMZ+n0Q3e2DxtRI+v3vsjhtUxQiYbqyqwTOCmrW7lcvejO5Un/tUVb0c48an9LOLxNOpwZuG+xMn9D2l5ipKLqWE2W4lYD3Rm10Zs14yyU5dxShl2N2d/Oz+Yo5ZTX+F2Xttp+gwNE5Ex350vsLb1ZMRDT71UYptUSWnlNYh1JyXfT/vnPfHRuXPzl8Y7PQ5VlwiGzkdTJCU+QwAe4Xd2myKuc3oO5ySextUZftey/H9pGAmL5R7n/01JPJvux5djZDU9A9rxKNA37nUtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcEORw9VWKJR3acYG87doG5MIJ2DTptp9ZRY0sqkBXg=;
 b=Gx91jRqiHzyykw+IIaRKHikEFXgl3okCayEmpv34IOkJEQ6omju0aBRoSWA0pRPyD3ia6X3cdISw1TeqzoWkGFadiFCYEc8Q667M24ps/qJZ4KwMX77Q2Lej0+TA1Flf2Z3K1HX5DTmpZQ0cE9jfGL2nyH2hnfohzOO/rlxM1cBGRxQ1ixAXSMruw4TQ/NnUBy1cR6JeXU/ImsZ+xFgKNJUQzIlG1FuXjYkzZX9p2MCzkAVXMVMW68sUV38Fm8nwaX/Jr0mymZqeYauOq4jw9fySj1Ifho7ZFfftjJ0HGuUOSrhm37RZXXr/4cXu8ILb2OQznTJAzdl4hcqm7p3wDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by KL1PR03MB7871.apcprd03.prod.outlook.com (2603:1096:820:f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 02:43:35 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 02:43:35 +0000
Message-ID: <f00f7e3a-68b6-441a-af6f-ceccd2053080@amlogic.com>
Date: Mon, 27 Jul 2026 10:43:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] Add Amlogic stateless H.264 video decoder for S4
To: Ferass El Hafidi <funderscore@postmarketos.org>,
 linux-amlogic@lists.infradead.org, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <tiocog.2cefvi325on5y@postmarketos.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <tiocog.2cefvi325on5y@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|KL1PR03MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f5c050-9ff3-4221-a4b9-08deeb88daa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|921020|6133799003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1WHfLgtV6XhGv1BFupV7qNc4U9p94/vwJl00BCfTIr6CC1QuKEJlt0ZiyOijZb15aLy5Dm2Anf9dfvHA5m5go9qBE6t3uhJLPGSKYUr4ME6vpkrG+C2A+7vi1k6LskdaOCZUcYV975og6Mi8XrATOWmlMe2hTKBrNd28ctPNU13FWF3myyfBVzfb7zXQHoFcMr4TJMk7Pcx8ShhkGWq6xtULeqfkszs7NX/wa77jSVNaWuioGR8OmPrqBPRKSLpC7B/3uzUIh+SztfC4qkKpCfB+wcJFFsp5KnCYcCnT1LPV0/6uT38bi0T0ui/TlkJSR48mMpgoDrOuJDwIublqAQV478MfXPa5X+alD6ulJVN0mHfHa7D7n2pXhgWmv/zM1Aj3EeTI6LNKU+LC5dTNJgh4xYO4lZSql8F4R/ga5u8maj4/K96cf+h7xW16aAtKM4/zwa25wlc2ilxq8ELY5g0+KjN8i4atCdD3ziQyQZIRnQWmXFcCYSnRV0qINILh9pR/PHHjScHL3Ebr7UIJ+uO6Mu2KQVPfX14ubaisgNr7+nEeSiFlObUSthego1cpuW6XMfbN9r3QfImeZWaJ342AxGiQx6PXZrKvR+FXbdMsoM1MjIrVda0COe77iJlmYklZbOe/DPa9onW30KYdXp9JwgTSaMbe7Ur+pglHe9yihfsGBTwsRqM+yLOjCrAHmcpsIRb+9Xc0Fi95dks5mA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(921020)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDYyQzdVVFB1dWJuWjdNNnNIbXlLZ1NkUWkwUVRrQ3hxbkQwODlMYUZZQncz?=
 =?utf-8?B?eUhxT1dGbGlBOEZaMkEzN0d4Mnl6aEs2ajM1bG5NQytMaDJEY0lvb0MxbTNT?=
 =?utf-8?B?VjNVY1dqT1RzSCtrYmRrdkQ2aWZGSkdtdEo0ODZSRDNZRjl5ZDJpOERid0gv?=
 =?utf-8?B?Yk5lcXA1R0xtR3p1a2NaalhhR0N3YTVBY3NiL0xDTzdscGk3MzJTYVVIU3pz?=
 =?utf-8?B?S2ZGcU5QWTJoemdZZ3JMSTcxY0VvbGhydmdVUTBDVGpVZTNKV2J3M1Qwek5y?=
 =?utf-8?B?T3V2b2xrYnJIUTBCTTQxdHhtcFlScXhIbEZxcDhxbXNLM1VpeE94ZG9qL0lr?=
 =?utf-8?B?a3ZGdEFoamNaZElBQ3dlTHkwcU1yckw1ZXB0czB6MWVseXg1WnR6Rks3VUVX?=
 =?utf-8?B?cytBY0cycVp1RjB5V0JpaGxEUzNsWlkrdGNpY25xdmFuMUdsV1kzN281OTk1?=
 =?utf-8?B?RWNIQ3kvM2JBZnlXV2hSajgwc25IT0ZTRVZJM0lNcVJMTXBrQjBxV3R2UHBj?=
 =?utf-8?B?ZFF0a2dhaTlqZFBzbnR6cU9INzNBRzJuY2QyNDNVQXprNXFUYnc3M3lYaTh6?=
 =?utf-8?B?NjA1T3BVQnUrcHdHb3E0WjRmOWFIczBSVVNDdjFZcHJyc3FRRitZaTZ3TWYr?=
 =?utf-8?B?QnBQNmJMcFplRE5jVnpmZ3h0M1dXWi83NnN6NmxEcUY3MjUxbVpMMHROMXJP?=
 =?utf-8?B?TENDYmdDdVNuYldyUzFCbzVuV3pYWU9QRzhvOHJXTEo4ZUlsWE1mRC9YYUNo?=
 =?utf-8?B?Vk0vZU9tZWNnaHVSL2RDOWZTWjRWSytBU1pjRHAwbDJhMld0RFVqZ2JzTDFO?=
 =?utf-8?B?eFdsbUdHNFB1RkVBbzBCTzNHaUNNVjhqNXhpQ1ZxUlBFQ1craTdDQ1FxdnIw?=
 =?utf-8?B?eDZraGVjODdnUG5XZ1poZk5pMW95N2pVck41dURYa2FaN2dBalhZWWhadTdJ?=
 =?utf-8?B?WFh0djVybWhwcVdoZnlRVUs0MldvOUdqNnN4K29aeENZWjBrSHlESGZ4ckFY?=
 =?utf-8?B?a3RHTHRvNkhzUHl5V0NGWHp2TWU3M2p4WXhCdFJMQW5pbVdaWmczOUMwNTJX?=
 =?utf-8?B?MzRVTTVYWDFveWhoMnhuK2F5Vm0va3lDM0VEaTZ4MmF2ekwyMXkySTEzclBR?=
 =?utf-8?B?R2ljc3ZPM1JtMWlLeEsxVkVJaVRoQTY2MUtKVTJOMWo4Z1JXa3E3RHYvaGZl?=
 =?utf-8?B?cEpwL0hYeUh2czJNaU9NQ0w1cVM4a2VnR3ZEM1hHRlNrUERybEd4aklGdnBm?=
 =?utf-8?B?Y2tNNm5FZGpJbVRzZ0JyQTMvNUl4Q0lQcU1aSnpWUUVXcm92bUl0TmZNQXlt?=
 =?utf-8?B?bE1mQmFycGw1aGhBOWZYY1lpeDRnS2NLWU9ENlVmbk1QUnRLZ3VQcWt5M1I4?=
 =?utf-8?B?NFp2SXp4NndsbzRWMmtpdENGTnRLRkt3L3Z5V3cvdEhETGZtWGpZNTcraTYr?=
 =?utf-8?B?WDRxU3pRWm0walpvajAxekRiQTliOTNEMmFUOEVkSFY1R0ZncGozV0xlZHdO?=
 =?utf-8?B?NitQNTQ4NXZEQU5oRFYyemF2QlEzbDIvMEkraUM5NHlIUUtmclB0N29jdXgx?=
 =?utf-8?B?REJQaW9GRXhKNzUrak5DUnZGd3BIMWVxb2ZwdGFrem4vODZLSGx1VlJuVm9j?=
 =?utf-8?B?Skthb2lMOEpxQWdYRnF6b3o5MVh6d3REOEUwdmhnRERCRDJidVgxSHlEVnBH?=
 =?utf-8?B?aGpucmlkc2FOWVdyV0w4Mk8wRkZvTlNFYktMWjl0WE1NWnJsVk5LMlVVYW9p?=
 =?utf-8?B?UUFpdjRtM0xxcm52cVI2NEpJc0dVY2ZaTG5VamdyS1E1cmNxQnptRjFwajlT?=
 =?utf-8?B?T1I5ZGtraGNDNHlGc08wdG5rRUxsOWlWbGRuOGVkbkhlTDlaZjNWRVhRMzMr?=
 =?utf-8?B?MTZrTVczRW9HOXl2QUJBTkN4aWtPWWtCZnpqRlJSNWU0WWhGZmhibkpiY29S?=
 =?utf-8?B?N2Z3dzBKb1ZHdGdwQ3ZDbHFwUkhRc3JIS01oVHFHQS8yaCtPY2gvU0QrUzB5?=
 =?utf-8?B?bmJTRTVxMGl1dHBSR1pvZTJXSnhCS01QeE9IYWN5akFQc2hndGZzcFhFTnEr?=
 =?utf-8?B?dUJxSXlITkJEelFQMGpkV1VCUmNMWnV6S2Q2dTUzaTJydWFWbHkxYWFQaHFR?=
 =?utf-8?B?SUM5dTMvNGlKWVFQSk1xLzZpclI3d3ZQdXFJR044L2owUStXdnpoNGJ5T09F?=
 =?utf-8?B?djJ1VEpNVmsxOW53WWltTUJieUpRZ0tTOUFPVTJwdjZOVlpiTWdDRWlLYmRP?=
 =?utf-8?B?cTNxdmtsSjF6T3AvMGJJUkNqOVZkTG9UVk9VRS9XeEM5aVFWZjg3M0NnMmFF?=
 =?utf-8?B?RWRJa0RCdzNHQmdLTURjajJ0LzdwWnJ3anNJUTEwTzNyUFhGZytYQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f5c050-9ff3-4221-a4b9-08deeb88daa3
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 02:43:35.3311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxdX3AbWLcCwlHsrYTNKtpInbE3iu4zRr4+IjK/ZuBs6G6+Mh0BKte8GTHTkJBYrX7fScwgMWKAyhsQw/wugdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7871

Hi Feras,

>
> Hi Zhentao,
>
> On Fri, 24 Jul 2026 07:04, Zhentao Guo via B4 Relay 
> <devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
>> Introduce initial driver support for Amlogic's new video acceleration
>> hardware architecture, designed for video stream decoding.
>>
>> Compared to the current Amlogic video decoder hardware architecture,
>> this new implementation eliminates the Esparser hardware component,
>> enabling direct vb2 buffer input. The driver is designed to support
>> the V4L2 M2M stateless decoder API. The initial phase includes support
>> for H.264 decoding on Amlogic S805X2 platform.
>>
>> The driver needs to work alongside with a signed firmware. The 
>> loading process of
>> the signed fw is as follow.
>
> Is the firmware still signed on devices that do not have secure boot
> enabled? (which means none of their boot chain is signed)
> Do the signing checks take place in BL32 or elsewhere?

The firmware mentioned is not enabled in the chips without the secure 
boot . In other words, this policy is not effective for the legacy 
platform like SM1/G12.

Yes, the signing check process happens in BL32.

>
>> Stage1: Decypt and decompose the full firmware package when the 
>> driver is probed.
>>  +---------------------+ +---------------------+
>>  |  Decoder Driver     |                        |  TEE Shared Memory  |
>>  |  (Kernel Space)     | |                     |
>>  |  +---------------+  |                        | +---------------+  |
>>  |  | video_ucode   |  |                        |  | firmware      |  |
>>  |  |    .bin       |  |  Copy payload to SHM   |  | payload     |  |
>>  |  | (from fs)     |  | ---------------------> |  | (Secure RAM)  |  |
>>  |  +---------------+  |                        | +---------------+  |
>>  +---------------------+ +----------+----------+
>>                                                            |
>>                                                            | PTA 
>> Invocation
>>                                                            v
>> +-------------------------------+
>>                                       | BL32              |
>>                                       | +-------------------------+  |
>>                                       |  | Decrypt Firmware        |  |
>>                                       | +-----------+-------------+  |
>>                                       | |                |
>>                                       | v                |
>>                                       | +-------------------------+  |
>>                                       |  | Decompose the full      |  |
>>                                      |  | firmware pacakge        |  |
>>                                       | +-----------+-------------+  |
>>                                       | |                |
>>                                       | v                |
>>                                       | +-------------------------+  |
>>                                       |  | Store decomposed .bin   |  |
>>                                       |  | in Secure Memory        |  |
>>                                       | +-------------------------+  |
>> +-------------------------------+
>>
>
> Is BL32 strictly needed to load that firmware? I know on at least 
> older SoCs
> (sm1 and older) BL32 is not required for booting and amlogic-based 
> SBCs are
> often used without BL32. So once this gets ported to older SoCs, would
> it have a hard-dependency on BL32? And if yes, can upstream Arm Trusted
> Firmware-A BL32 be used instead of the Amlogic blob?

At least on S4 and newer SoC platforms, loading this firmware strictly 
requires the closed-source BL32 provided by Amlogic. If this solution is 
ported to older SoCs, it will also have a dependency on BL32.
The upstream Arm Trusted Firmware-A BL32 cannot be used either, as it 
lacks the capability to verify firmware signatures.
I understand your concerns, but this is primarily for the security of 
encrypted data. Amlogic SoCs do not have a dedicated CPU for processing 
encrypted data, both encrypted and clear data eventually converge on the 
AMRISC micro-core for processing (the firmware mentioned above is what 
drives this core). Therefore, we need to encrypt the firmware to prevent 
it from being reverse-engineered, which would otherwise lead to the risk 
of encrypted data leakage.
>
> Best regards,
> Ferass

Best regards,

Zhentao

