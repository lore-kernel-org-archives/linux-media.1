Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793716714;
	b=kCFl9RKVCn979bUqajsw3rKjuAJb/G1gt5+bvuvCf4S9RSeQm87E8EAO4Q91Y56ZaeZS
	 naNR0lrr+uU/fZumr3EQS5jgfKFHIKIS0rfNqRcISn3fMwWBgFoaM7z4jPW9QMPWsA6Ua
	 s5sq0X0tEKZIM4oGqM/IQaSQUe8XgmQry2oTvfBpjUpWUhgkoj/3DUH+07lCOHrf/uEzl
	 E4MHy9axnw5mGi4qr8v4OnpH5ND3TzXrV9vXPHr7tuOQVtf/CHsgJfljF/SgbFNX+8hjL
	 Fjk+8fj9jccmtQJimFoMgBTWPtHDj2RL4SLjv2+HL1YpMlHBZduCCqXaip7czthHFPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716714;
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
	bh=DwhwwuKU/AVxPgvEXKmrIzNLb7pkFZci5bBBS9f3N6A=;
	b=wukZ8VY2SYt6I5eUZBEovFvQwqHKxFUUUsy6YMoj84oBTr4kj1joUZwsXXa9N51CS4Xp
	 sCX7qMg/4kEYYYJvWR2jjJyS0s/5uB0KIzcLoEDSzYstIWtnwtn4Sdw+iUKgO5A+UyV0N
	 wTry5cJk/t3TYmwcTY4je0IicqjsEKirVM0JLQepa0hw3E3AX8KayriIuU1inKU0i57BW
	 nCkkGNdn2t3n8QoIllzPyqd2haVKO9Epr9CYk4MHSURJEuRdskITLzNCaXK2VSfnl8w1N
	 pkFwHIF/VEOT9vISn3CWdmDALR86H3DlU8/CFhhRDJ8KWFE5qLQ7jCWJr+0XbbZaXQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherry.de;
	spf=pass smtp.mailfrom=cherry.de;
	dkim=pass header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=eFKvSIw7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.42
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013042.outbound.protection.outlook.com [40.107.159.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC40606A32D
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 14:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EC40606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=eFKvSIw7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJ4xsBOhA++4tSI4xxEl0EJVouIy0n4nlTI8nQClPz+8egJc3ZhPgF7olNQ28ThMfrVyKXB4Rni5usYfTDoxEu6Fb0JFF5m922nCr6samEqWBUdlFjqGKtM7P1wc9pdtiwbKO4kObppCtrPu4YP7PLQ6YOo/lSHJtc8gerBotF7TLUE7bQSltMYdHlz+InOlPw+Hp88uo+HLtznTrDwbIaL07vZTsultxy+EoCb6hNFjyxYmtH33GWqn51Don5EhzhYkRncr8OZQV+EBSCPD1/2XvDmXLcPlDyCqIHuBcBOwECk16rcJvSLp52/f5/YAl4MZVP+EgiLZbNQDS5dykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwhwwuKU/AVxPgvEXKmrIzNLb7pkFZci5bBBS9f3N6A=;
 b=Hg90UbABFfWfR1ItvXTEEj2khYqlDGwJzRafU6o8ku9lb6YLL087BXbFTFAxxjNAz177toLMoJU+Ay5BY8Qr4iwD8wwlUKxL8dbh+gCQrVlgsaK43T/LD7TjxwJT8it+YEQ0KQ6CNWX2WnC45Ni/NmTCq8e9XYI+jmwdWAe0hQ7qA1eOznzTmostGaW5GJKU3j31q8FQ1h6OwO/jsJLdk8qr6Xrl7jr6/a3h4lN2KYV4u08fl4DmyyZRwmma+vcssVzBcikslLBuzlNEW7LlEGBPE60HywPd2k6GnICi8F3F0muVXfReW8RByGUYYAUiwFAd1g83vC7KZd/FarN9Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwhwwuKU/AVxPgvEXKmrIzNLb7pkFZci5bBBS9f3N6A=;
 b=eFKvSIw7IcnTMQ5HLqmNjVML1HuvHobPqM6Z7IAajVIOjj4M1xuGXAwZZGzWlKPYXqij8k0FnevNOOyVMy5OcTJd3s0/c7xxDQ+p1bp2qEaKLRvlfOHCwGbycmyVmuzemYCZtJH3ophikxvYV9oBy8bCsIaBF9SyVf/n5XJT8vU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by FRRPR04MB12593.eurprd04.prod.outlook.com (2603:10a6:d10:1cd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 14:38:29 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 14:38:29 +0000
Message-ID: <829339b2-18fe-4dda-b91e-fa9cf8be7929@cherry.de>
Date: Tue, 3 Nov 2026 15:38:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] media: i2c: ov5675: Add PLL settings for a 24MHz
 input clock
To: Heiko Stuebner <heiko@sntech.de>, sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20261026101646.2450051-1-heiko@sntech.de>
 <20261026101646.2450051-6-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261026101646.2450051-6-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0046.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::35) To PA3PR04MB11153.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|FRRPR04MB12593:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a63f0cb-60cc-45a8-d617-08df39b820c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|56012099006|261028144727099003|261022075727099003|261026140227099003|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RbYJRil+Y6YSFyrf5M1WxNeYXVNbj+gAG6RY6JQO0soJEk/wQAecAnEg/d3tVsP1W58eP8brSTKYDHFYN2MzQp/4znxQ0si8jgWVPc+iehFr595cGtP0O9O670qGvaNKR5edXKsC1hSjvXEVrBvcDK+t/BSgg5MwivzH4IRx5GE6xd/SX803dtiT70HH1b0+k+xvQmSlG4/T8oSnYQx+Z/3OCk42jPiSrxYe9hE0knPYjnP71cVzUk84X1xThS6HUsGBYT7GEqVAUCg1iI2OVj5hlExwu0+IViHOWM4OYu9hyUz1/E+cHSbaYSVgFOgr5nZhgikTXM7K9bphWJdBu0c2M9PwQI2vlJYL8udZc42mLJmuy/bqxBK7qf7KWqeatoi3357z7Ik3P0vmqSHLhiEbh2qFh0DwvoqtuH7Ls6Z12UE69C9mSA7lGnrLNzxwYIFUyKqpiZLKESUXwn9bQc6XUwgQzDgu2/r2EhghcfBrLG8HIdbgmlU0bX3Nl4lkAj/t3YO+IayJrADo2P+ysnYYaJaT7Wheg02pTK6vohdL1ihpqSQHaZXLJBzvmhD4UDzeqIlSBRS9tg3u3cODIeIvv4ZWmcBwPufbFxN3r5Z4U0UN38XmjtKlxPeEPsVPMig9727BVPACg6uC+sqGNsc24a+BkMYHA8OK4u4GpAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(261028144727099003)(261022075727099003)(261026140227099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEJMdFJJSTBoQXdQeEJPSk10SkR4Zkl2NzUreExmODNScUFxVms0am51R1dS?=
 =?utf-8?B?YkRqVW92SUIzcEZyeHhadTFQWm5RQlIzSmZnN3B3YWpUbUowNEFHL3dya1hl?=
 =?utf-8?B?S1M4NTZoV2lUL0N5Rmh4Zzk1ODU2Zm1VNVBWaEE0RU5vSWpXeU9JMG5POTFL?=
 =?utf-8?B?dS93dHoxRVoxRHlUYWpJNlh1b2JmZWhSNUZ2V2N2c1BONGphdmJFUlRWeVNO?=
 =?utf-8?B?NXY4TThZQ1F4WUREakM1eklMclhDRG9kM3g5Q0c0V1R0RzZ1TUVMSzMvbmJz?=
 =?utf-8?B?YnNKRUlzaW5DRGpxcVYrUHozVDZPME5xRlVBTXh3WGlreXlKRlhxdUVSSmNp?=
 =?utf-8?B?VkQ5b3M2TDNwaGJBUjg3cGpFdG9nU1JBUk4xMUtTTW1LTDRmV2h5Mk9rMVJB?=
 =?utf-8?B?MzFmNGtCeVA2WXpadkU1REdJT1F4ZWVtTzNyQjZtUzZsVHNHS1Ntbms0MmFu?=
 =?utf-8?B?MkZGeTZMazBMTXNqdjFOSzRWbWFpcnlkM21INWZzK2hwR0hVWURLNG84MXhD?=
 =?utf-8?B?cENZUjhwd1RYUVg5SXQ3dHNFTVBtS1NZSlNTbHEyQitReUhwS3dZNFZqTEsy?=
 =?utf-8?B?Znc3REtOTEtyZU1RWWgybHFMWm52TXo3bWhZMkpRVUVxZE9UeHdqTnZHSG1L?=
 =?utf-8?B?czVQb0tteU1oQXpiV3hRWE01ZTlBYVd3elU3aERtSFR0ZlpqTmdyWTFqbDNN?=
 =?utf-8?B?aEZrUXYyNlZQeVJOMXRXTlhQTzRDRVI5V3FhWks1RlNEaGhiYVhMajBSeUZG?=
 =?utf-8?B?Skp2ejVNUzh2b1hRdk5McnZSclhyd0lML1NQYnBOdC9wQzNxa2YrYTFkYm1O?=
 =?utf-8?B?VGh2enlwMWQ3TW5CdGdESUxGRlI5K2tlSFVZbWZlWG96ZUhVMkdQSzFyZHM1?=
 =?utf-8?B?MitGRzVpMXZVc0ZWRzgvbS9HTFovZ3hVUXVIMVRXM2sxemhGQ0Y3RzU4Qzdn?=
 =?utf-8?B?aWIvSDBqMVVVelNDVWxxeWNJUkJKZG5LQkpYR0JzSGhJaDZ6SFdBYzgybTY4?=
 =?utf-8?B?Q0pQemVSQkJNNnJ4bUlISkNUOUNCUkdTU1F4bTZpc2xBNEJ4VnBjanhFcTVC?=
 =?utf-8?B?QXJyNU1YaC9mZ0dvZGs1ZVZWMjRTMDJ4Mk9JNWlic0hTSGRxUmRpNEd0NUFt?=
 =?utf-8?B?ZG45b0xjU3hiK25kc0dYcjFDV3NUZ0FOOUFicUdqenFGcmsxMmdIeCtvVFJk?=
 =?utf-8?B?T3F1amVMVE0zNmNoNkVxcGdhZ1VmZVVRSCs2N3NUM05yaHNtSTZ4dHlOTU9p?=
 =?utf-8?B?VGFjZXVTQW94TjU3WmRVeWZhdlBNeGdjYi9icUtiakdpcEVuMmJQd0tYYU9v?=
 =?utf-8?B?QWpxSGUrMWNNSWVvNzB3blNhV2NZVUJNVVkvMXZuU1lIblhISERCVDBaZHBl?=
 =?utf-8?B?ZkRpWC95YU8wU2prQmJIeWZOckdqTGlRdUpBU1phSzZtbENjY1llNys1L2V5?=
 =?utf-8?B?a0FxZFBFWFR4SFUxZVBXT3Q3Nmo2WW0rcHNMb3pvalE4N1AyTEdFY3hWdzlT?=
 =?utf-8?B?V3JJWWJwUU9NWHg2YUtaMlhkOUpPYWl5VE1SVjdxRWVJN3dTb2oxblloeGlL?=
 =?utf-8?B?R0lJTlBpZzltYk5WVFREVHVkUEkzNG9vSHAxQ1lyTGEvWmV4VlVkdlAwRzh1?=
 =?utf-8?B?ZmlUNEZXR1BGNmtvZFYvT0E0Y3kzK2NpaFhjaHdiUWFvVkZIdmpGQi9vTWU3?=
 =?utf-8?B?bFhTcXR2T0ZvQWdXMklIaGJGZnlrTkMxK05PVUt1VG8yTGJVSjBzVUZ4eVo2?=
 =?utf-8?B?eGkrZzMzSDdaZ2FKb3ZLWWl1RDJHTk9OeVVXWEpCZGVESUZpclluZmZodUh6?=
 =?utf-8?B?Rk5ZajhDSmNFTmwyMENxUzZldkdZYUQxNW01TlNZUm5lL3UxNHVraG44eUFr?=
 =?utf-8?B?dm1HWnVWVGpyTkpyRDRHN1NaU3l6UVVFRHFUaFBXLzMrTUVlQi85aFdRS25z?=
 =?utf-8?B?cDMvdUVwUGtjMzRlNitId2x2YnpHZGc1YnNlVVBzNWFjOWE3SGtXUWxaWVQx?=
 =?utf-8?B?T3l1Q1N4TFhROVJmVzhuS1dPNm52OVBZZHpoeGVuKzZ0bVdXa081cERSQlds?=
 =?utf-8?B?S0dJNlMvT3pDTWgzQ1VlYVIyVW40V1dqdkNPaFowakVobkpENHZITjJ3VFZP?=
 =?utf-8?B?NUorMGVueUpHWDcvdmpMVzZQWHBYVFY2aStoMWZIeDdtNGNyL014ZWwyZHZR?=
 =?utf-8?B?M01IWENIZ3pxNnMyNWFCTlFtZStXbElmUU0zUjZJQ0FqcVBveFBGTWl0QVk5?=
 =?utf-8?B?ZEg5NUVSZ0JFZnFCM2FwTmZjNlgzeHQrTUNoY1duZjd2ZG5VZUFOSmN2MXo3?=
 =?utf-8?B?akZLZ3ZnckFBNG8xOHY5SytnU1ZselVVU3E5NmhWSFZQa2ZDWTkrQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a63f0cb-60cc-45a8-d617-08df39b820c5
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 14:38:29.7915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54p+MZslC47mIlZTk2KjnZnTOeXjdhOhqujNpgrgH6dkE6NaGtFG3yBow2gvoDrsqn9yRD+8gER2Ttg7J/2qK4mUoduWzFQKCseh0UA0DB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12593

Hi Heiko,

On 10/26/26 11:16 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The ov5675 datasheet actually only specifies settings for 6MHz and 24MHz
> input clocks. As some boards cannot supply the correct 19.2MHz currently
> required, add a second set of PLL configs for said 24MHz input clock
> with the values specified in the datasheet.
> 
> Using the same calculation over the clock-diagram results in the correct
> expected clocks for MIPI_PHYCLK of 900MHz, MIPI_PCLK of 112MHz and SCLK
> of 90MHz.
> 

I'm assuming we'll have eventually different values for pll_prediv 
member due to review provided on patch 4/5, so I'm not giving my Rb yet, 
but the content here is fine by me.

Thanks!
Quentin
