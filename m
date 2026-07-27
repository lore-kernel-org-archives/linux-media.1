Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023074.outbound.protection.outlook.com [40.107.44.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0676B3DD51E;
	Mon, 27 Jul 2026 07:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136790; cv=fail; b=VX2otYoAgpv4Fqhdxwwgmkr32xH8zY8eqM3PwnAWNeWU2WarEFAlOWMStZ3lP4sOdUi1uF1HFJbziWhQOSBTjMiZy0u7FBgkaPS3aLhIwypfeM9/3ioFF4XXFTKbOq766HeNbq2lPIJ94OKNdGGbVLM3Pn344N8Wxkc05kOtdSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136790; c=relaxed/simple;
	bh=JSdLksvE8GeDVdqg5cs1ekFEY4MgP8h5lhp+5shEMgs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sH8fUKhBRbazEHQDPJzjP4BfEjrMLNqaf9vn0tIOrWuqI5lNYet3PWQE15Ch703xOKZ8TAVvrv81pTMT75uimOcpJQextnKFFYpwJWopea3FYMzuiTJJsxEdr+fvGQsUXpLKYeqTwBSf6vnq9fBvLR1RFGWYp6QMLR3UU4lz54k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=yRCmIlMr; arc=fail smtp.client-ip=40.107.44.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="yRCmIlMr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1nMktM68Sc8gdPLBKgLntMzYNs0K5OWM+zHyxYaUvCIXUc73Ps7FTHsZZe3o3c0bc3w78DPU5Un8m5ieYWHwZH+1XAOk33hyPqpaLlmFmpP5ULmntrGkASpR4yR/I7E+OFGyPK6DBlE/4xh7pN77skR58vkbOAey1acxrWSKF3S5wpu17Oqt8dAj9tpHHN8KUnecSHCS05qrp9gbUx3zhlKL13kuZ3iikR3GKun0z4MdYhZTlWFaYa6p8+qyW0e+TkT7d8mWYdqmVmq2kF4eJYhN//yJE2MIzkIElkLVd+MXNB19QIshafYikIHSDelSalsNZrHTEqON4JXDAuR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfWv0lxaAee8KCqyj0nJQ4bQlq3yEz9NJTnkD/yvvII=;
 b=YseE21iEkFYw6mx4uBkMmy3PN8pjuTDUeKb3TOmLTDV1T+CzrbhAJ8ZiHEk3sG1/yrADpzFaDxkpfIiFsnQ/KpsszvrI9dWqrQFVI3OTs7dDhvOkXvlogYPaWW+rAkrBUmq1KCgdRfPP98/RDy1w4DYTMmD6UQyIcSZ3gX7EpFBCXAXCjGhlNq37OUUA5ub/xT+88vuwYuTW7R/ecKwFuQ4/3GzWbUgGw1RchULAXUaUHiwpbnDrUiM6JvImDjzww8FoPpteIh8WpOiFICQv4x4SLqpooT38Er/zxUAvLUQn6vUlNIY3lOQOCNGVNEBSMPtCq9/Ox78kXEvCi8/vYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfWv0lxaAee8KCqyj0nJQ4bQlq3yEz9NJTnkD/yvvII=;
 b=yRCmIlMrL0xVes4IQxAneMPjwmQoYxLekeXM5/ygM9DmtfK8abAy7Nzec9wEZM60tZXQDQLkpBXvSPit8H0H4cp/gA1yyo4Mvhd4tY8538UV8HtU7lvqmKgVEBQsxg+cfVVmoNlPleAErGT9ykAupkIz7Qksl0nFNidtKgAB1lKU6hYZqkTf/3Ik1SUWZk1vnrhkZG8xT+dNCm2DKGKBjXFWviuBLoEAVXzDvaTU0YEMnWPeT34xa0IjxCjZiX6wtSoArqMlM2fnb6sj5h5mMG2hIIsV6iCoaYTHg6uNjzUBvRK8w4nVOonIC7RzS9Yhdw0kLJjTp9QdnurMtwzpaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by JH0PR03MB8620.apcprd03.prod.outlook.com (2603:1096:990:9d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:19:45 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:19:44 +0000
Message-ID: <983d5ac5-e489-4d28-a1d3-ba736b3cdc28@amlogic.com>
Date: Mon, 27 Jul 2026 15:19:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-6-6072a7ee7428@amlogic.com>
 <20260727-vivid-native-bloodhound-4c7ff6@quoll>
 <16ede5f1-dcd4-4b43-98a9-02754796de81@kernel.org>
 <b7d083b4-fe1e-4788-b027-fa803d067521@amlogic.com>
 <e9c42d55-905c-4bab-8e63-e859a8f4fd46@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <e9c42d55-905c-4bab-8e63-e859a8f4fd46@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI3PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::8) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|JH0PR03MB8620:EE_
X-MS-Office365-Filtering-Correlation-Id: c0fe3c1a-107c-4f28-09f9-08deebaf6f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	phapUrMGGh560x0SWoRCnU2wKHnYRNSY90J19M+11n7StgBuvLPVmS7UKLlL5fsu5F4EV8OqvPS14XnQHDNYnTKRx8fWuvQfcjgSNHoIJ5D9JIv+CPj6nSKv6x3ttcAZzpq1no6wehRUo/DIQkdr3hOsXSlJcZvuUDVp3EjDqC8Y3Di6Cwu6TEiAfZWvxsH9wCfn43jjFquTVh8ARDuzfg92xEed22y23ahYPgGerw1LDMuyrmK89lkcIhtHjYrgKTL56P/0E5GC31aE7O4mavCU0VX9GwbCEEDnMz2wQM8pL4eXTbsC74tt6jxsflHHZZqVZ2xuCKmQLk6jtrkTJ0wdoxBIAATgWdP98RiMhlrPmjKtAAqsFExnfgMwTKWGFUNpp/SBvw+A8r+lBQOivMCmw37fZ4xu+ZvH5X1Hq29Swi38rv8g14t006/Fsu9qWKXBZtJ7SD5SK91oh2EbszETGM9iteu4HkamWYx17EgdHR2q8uncO8JuOaYVkWxZcC+wd3BbquV81eHhWUC0kLYtG9vU+O19aReLm0siWpxnbX2eeblbjkSB0Ea9V1RNq4q+Hz0BQ3J9C+1uZYMs7pm+YW+SuVQedvr9tdDDZsbWQxZge80Ur1ogrSk78pDtiIlyj3+gPmBWN1FS3M5Dx81v+qs+k6M+1+02bnjuEeY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnJvQldKZVh4QXRyZnpnUEtuS21IQjYwYm95b2d2TnZVelBiMzAvc0ZVeldG?=
 =?utf-8?B?eGQxanowVlRsbkJkNjBEZ3VDWXkrQXplWHpXaFpjNFh6WTJQWFBKV1RoODNZ?=
 =?utf-8?B?MlRvMG5rcTFLazNhRThpT3VadE1ZYmF4aWlSeWgyZWR1b2JndVVLRzYwaU11?=
 =?utf-8?B?SXZJR1k1RUozNERQeE9EdW5PcXF0NStUbnRCOU9JeDNBdDhSdkZLY0o1WnNI?=
 =?utf-8?B?SldDdVh4SXVyZE4vMnlFUldwWllhOUZvNjNVZ252NDlqN1FtM1dVRjl4QmJI?=
 =?utf-8?B?aC9XUmwrcGVyZEZsaHU5WXQ5SlVvU0s1K2FuWDc2R09TOXRzMVJpM2FhTDlu?=
 =?utf-8?B?b0JTUjlMNGJHYURORG5Bdm9ONHNTUmJmazZxaFRIbUZNaFpXczF0V0d4ZEsv?=
 =?utf-8?B?S09iTnc1dWwvdGo1RlhiL09NQWlzLytZOEhkK1Z2d0FoU3FTTHJ3Zk5jUyt3?=
 =?utf-8?B?ZVFISlFaSTVLNGRza2czdHpTbjZrZGtCYy9aTVBzRGNtMEZtUVU3R3Q5Yk52?=
 =?utf-8?B?d1ZqeVBMWjYycGViSXFiNW9nekdIN1VBSllESk5PS3JHcTR6TXd2UTNLZVBw?=
 =?utf-8?B?K21yOFhpSmhlUlF1UEtRSUlhYy9iZVZWUW5CZmtKTmxMTVNzajVYaFhsZnhP?=
 =?utf-8?B?Q3liVGE0djBGWVl0V3N1azJEbWFZb1pUVmVJdHcxYk1Oa0owenZXRThMTEUr?=
 =?utf-8?B?djlXYUIwUXJtZW5ZWjdFL0VKNTZBVnpaZE5RdVpsMnByL0w4SitWazVZZ0o0?=
 =?utf-8?B?VzRKYWk2ZjE0bEZ2U2x2czVPNnozVHd4bFB1S3RmYW5KZk9LKzJCS055Y2Yz?=
 =?utf-8?B?L3hRYzUxNzFLSDEzeVdBTnZHT3pkaGNUc3VJWmI1VnVjL1ErdlpaRS9UMVJo?=
 =?utf-8?B?TDZRWG9MM3BSaXlRNC8yWkVZcUxrN3JNY3ZtUUlYSUNIMmgwZEtwbEZyZXND?=
 =?utf-8?B?cHNBSlZ5UC8ra095bTh6emxkOVNoaW9lcXErUTd5RG5lREQwYnh4dHNReHd6?=
 =?utf-8?B?ZlRBTStQVkZXNW1FdWRLbHMwUVE2MUxBZFBmL0NBbjRsSHg5Zm9odmhjQzBu?=
 =?utf-8?B?UVlsQm5sblpydG42NEg5dmpsWTZkOHFmMnliZDllL2VpZmRQRzFPWjYyQnZP?=
 =?utf-8?B?UFZ4dzFiRU9ZRzBBT01GR2tHNlp4ZTJzSStLd294NUE0dXBUYmVDVmtqRkU0?=
 =?utf-8?B?OXJrbjc1VC80ZnNXVVQrS2NOc1ZXcTcrM2VNRkhsRW4xeldzSFMrVUpZSjhp?=
 =?utf-8?B?QnMxaWtYU1VnTGNJQUdDMWRqOW85eElHQ0EvT1VMRW5JVVVOa3gya3NoQzA5?=
 =?utf-8?B?dmxwNlU5aFdoMEIzdHZScXVCdUVPT3cxV281L2Vpa0JLR0F1b1paWmloMzZ1?=
 =?utf-8?B?SGhOVUdKZHlPYnNWZEtOVDNLeE0wUFNLdGV1ZTY3alF4VExQcVlzUXZBeTR1?=
 =?utf-8?B?ak5CT2VjbENGd1Y4cTNZcmJ1SXRMTEwxc0Z3WGxIc0VvVW1KbnR2U0t4bkxU?=
 =?utf-8?B?ZmhnN3QrRGQ5a0RMZGpuQmx0Y1JmU1djbzVOWmcxcm9uY3BVbUhXeGcreFpy?=
 =?utf-8?B?QXhNYkxxbUpsMzdrQ0pGNi9WOFlaSHBIZk9QT2ExSndXci94M2JVc2h3bjQ4?=
 =?utf-8?B?QTZCWWtRc0t5YVN1bFFreFY3ekZlQXdkRk5iNURUdExXdUl6OFFMZ244Rkhi?=
 =?utf-8?B?Z09FS1hmZDFqZXZtQ0FBbVZRUUc2citOSUpiSGRwTHBuZmFyWHp4Z1BKZ2Nq?=
 =?utf-8?B?TTQxUXhDS3RiWXNBYXNKbUhMazZTbWhhNnNwQ2c1QS9zZkdNSXNYYlgwZVJs?=
 =?utf-8?B?MjNVUTErOWc3RE1IREQ3dkxZaXh0Tk1zczFvbDRnYng4TEF5ZjV2VkZwRGNu?=
 =?utf-8?B?Rlk1aFIrZDZSQWlHZ2ZPTUVuL1hLZE1HVjNVRHdmcmFqa1FoZE1MYm9tejZM?=
 =?utf-8?B?S1l4dHl4cjMrdkFFbHZEejBVNzJJMndiWmpueCtoc1FGR2Z3Z0NoVlkxTmFM?=
 =?utf-8?B?V2tvMzhVRVlLUEdQVVk2emFPOUJBQnkxcThyTE1adTRXYWFBYlQzSlBlVFcr?=
 =?utf-8?B?ajhVc0xWWWlUY2pldGlWczFyeEpHODJpRkQrckw4azRjcW5XZGlOdkpRMElD?=
 =?utf-8?B?MlU3eFhjYW1QVzZYK2I5VC9ITEp1dFNiNExNbnJxMnJtRnltWE9DMkZqampP?=
 =?utf-8?B?aW85NzNaYWcyRU5sY3R1WFh5K2JNQ0FUMllQN1VULzJXQVAvcGtlbHVoQXBj?=
 =?utf-8?B?VFBxMGRPVDdKN3duamxUYVg5UE9heWpvLzR0bnNGMnZFeDNWZjR3b3VSQi9L?=
 =?utf-8?B?RUhCOGxsSjlLSXdaa2UyL1hscVNlVWRCdFA0TENoU0RWaVFpaXpkUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0fe3c1a-107c-4f28-09f9-08deebaf6f07
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:19:44.9084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxgiZeW+wFSmfG+aUbSUJmPu2mTAL2Mt44/nceGAcKOJ7wSs90thq2KsKai+dMrgwcdfsCvCd6h3hJ5AJzVDeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8620


> On 27/07/2026 08:36, Zhentao Guo wrote:
>> Hi Krzysztof
>>
>>> On 27/07/2026 08:24, Krzysztof Kozlowski wrote:
>>>> On Fri, Jul 24, 2026 at 03:04:56PM +0800, Zhentao Guo wrote:
>>>>> Enable the Amlogic V4L2 stateless video decoder driver as a module
>>>>> in the arm64 defconfig. This driver is needed for stateless video
>>>>> decoding support on Amlogic SoCs.
>>>> Which boards use it? Look at `git log` to learn how this commit should
>>>> be written.
>>> I already ASKED YOU this at v4 and pointing you to git log history. Not
>>> much improved.
>>>
>>> Did you even check any commits?
>> I did check some of the commits. I'll refer to more git logs of other
>> commits, and describe this patch as clearly as possible.
> No, you need to provide reason WHY do we want it in mainline. You do not
> need to write more sentences. The reason is some mainline board using it.
Yes, I read the other feedback from you and see what you mean. Actually 
I missed the point when I was reading other git logs before. Thanks for 
the reminder, it's clear to me now.
>
> Best regards,
> Krzysztof

BRs,

Zhentao

