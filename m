Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023101.outbound.protection.outlook.com [40.107.44.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9EB3BCD23;
	Mon, 27 Jul 2026 07:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136358; cv=fail; b=Hn0Am+4+MH6pPb99XbgsbvwEmy9NDDHXP2dEKxthc2YQoZQUZUecOZmJFbUpEy/zD8mFFqwTL0wSWvSB349fBCB2O3dapv0slWD/HmPgFMO615hsMg7lOKNndPuJZpnTbf+CKSybhuK+ilkeuhh2YshwnKBa53XRtOxk//JGDpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136358; c=relaxed/simple;
	bh=ia6RSV/gNiKJKXFa7JrRPfsv4GVLghGkGYkpEio+ZTE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QExNoM6HLMn+nNPrjkg9MZlNT/ilVK2F1wA3QjKMiJYe6tdgaAwhgBjqE1feOOv1UIGJla5oEKtkVe70cg5Ikw894JEjCqqI9x3WI2MrxhB7WxAtUXuiLR/vjMtBQ5CLina1cYdAO1ZgzwFbW2sn6i9+1LsgmIfugl04GWkYJdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=OSYLJDz3; arc=fail smtp.client-ip=40.107.44.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="OSYLJDz3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6DC7PPp9cK0jYkb3TSXwLJ8OoTECnmUAvuEMzK6HEmhJzTuSFYjVZnmAvUIhq8JmKaSMNjkcrN+SL+8UkhBe6Mx+Q7t7e7UasofMsUlc3KMnyITGNZtwZvshoeSR+irzPZPsdPKgfXl9B4dDBWiCBRf9eZ3+N4k3pAuAg9Kq+MV8x20CgPNMEctC0VStkoh5bCL0/ugVGPq9j1ri+BSWw1HQx4eTKaZojKv/0+ZwuSn9tx730h9LqDZ+b6FK4QJHoBhN+QNrzfa86vCaXL+rXH90gZrZVE9+5eB+cIbMICjtnO3aDoSBMuzzoA06TxSZ5Q0jWvjuyniCYUs8Ced1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/vKa2JeZkI/5C9TSf3Hz5OA1iXYFDFM1Y8yctsC1Sk=;
 b=R83VLbKOWXe7YfvzR/mBnz+SzrGjGklA1s7G8QCv/5gviWkjO2Kbp+RM8I24l47/V01NKdXAyt1b0OUHXI2gdm2chId7RLwyRnh+OH70iqX0rylmkAG7Ea6a3D6QOICa5FkBD9s03zpeYdnoKctSsTu3UmoZ6MR2SpFgxK/jl3nttDxG6pnI++xRBMbtktlul4urY8giK88daH8fWsTbdh7qxsMGAoEDzNWL/Sm6YbFPjPnAGz8B7xHOwzaGDmY5ugtSx3OWwDYYLsMii7I+5WRH4eAAQkKD8KnxP9qsXJpJxi5KTTE7c6F3XxF4eedkvEsgm0HSq9Pl1YDlfhOTfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/vKa2JeZkI/5C9TSf3Hz5OA1iXYFDFM1Y8yctsC1Sk=;
 b=OSYLJDz3UbErVYyaeP+6BzCerU79qOqs6LIbka13KZiLV2JWzgh8s7IOK52Gmdrcsl+LbifoeWZJHxYo0yRaoaJgpa6hBmhBzfNkB37J0GdAvQQ9HQwStYpH5HC4aCyk4wdIH26DZdOrEUj5cICV+mKFuSO8v0xWISt4E24lpN1mNww5hfkl9HncIK6C2YDXfUMx2bkA8Swj+9ZYzH26sr46A8lJw0k/PWztMRJ30tPJK9SHPXrew59Ci1PXiLcOB5qH6r+9ryx8kshiQCVXpLJQTNV9AQMG1L4+pTaCIJI4+e/BotYmhth5pvfg4V3H98g6IjXXDOHliJUtvcjqjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SEYPR03MB7891.apcprd03.prod.outlook.com (2603:1096:101:173::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:12:33 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:12:32 +0000
Message-ID: <3ecfe659-1f8f-46b2-9f1d-6a3b06734093@amlogic.com>
Date: Mon, 27 Jul 2026 15:12:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] decoder: Add V4L2 stateless H.264 decoder driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-4-6072a7ee7428@amlogic.com>
 <0ce72645-aec6-478d-afad-b5c9f838d7ea@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <0ce72645-aec6-478d-afad-b5c9f838d7ea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI3PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::10) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SEYPR03MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb084c3-0479-40f0-465d-08deebae6d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|4143699003|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EzjrWutk1X9jBQ3466IZA+e1702G+WDClGmFn+vma+U3Jo9ERvh05g6VQRMky8e/0g0ZEvCYYV69VasBHAywGBOCXA0rCpbmPxPKIL2A03bnRiimLBQ/P9/PxXncCV5vzzefWtjKQiIJrUxEL/H0qHznWee2Z4+wIn2fUgpl8qbKxPjujA58liAP3YH4tn+xq88SRIK4UBDywJeCwCXLozdYeup6qSv42G0m3QpcTH7RKy/gO3lASIoZtQMcao04mhR2mBqLsj1mmGA4P+913V46wkkVbvOU3MRTHU9az1CNNq7Us2X17RJnMm5hvgqY2T5Z034pWTS1zl/Oa9D536BgY8PGTKt8TL27CqovJaFYyrFHQFhHZO3PMvIOELEgWUMhQjCLlGj8K3I7aee99A3918bMMLHqOVYd2+dc1a7QMQx/nujEY7dpAYMUzfXzsF/doDlCh4RaJ2rDSlub4TYSRbZeNqvYUKo6p61BBqduqSCX8m7oMCjJ3Z1fCYy4ai2nMzmUxaf7fNSO3XgXkwDGbJ6WLUI+XdVilyiLYrbfFkwxT7Tr9EdPBH80f832tnJ4P6S0mwZhFgmBSkbPT6WmkecSNUvkBlOM/Av8ychtWN/NCZrhdT94UUUtxaaQhpN7EsB1dU11DXiuIsuKkGrYVgHZj5Vf2A48MNfu0NA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(4143699003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEJlTG10OU9VMTBMRnpNckEzMnNGVVRlYnYzWmV5V2xnN0VyQmxuMUZNOXhO?=
 =?utf-8?B?NHJ2dGFReHptbWdVQWF2Y0IzQVowS0g5VWFSdTJrSEY4U1ZJam5pWnBpbUZI?=
 =?utf-8?B?VWU3eG5ab2dwd2l5NVJpNEhGeHJWUkNPZlBKTCswemJBbWUvckw2ayt1M3pK?=
 =?utf-8?B?NGw3ZG1qKzlVUk50TXdsM2JmczA3TyttcEhuODR5ZVY5ajJkMlRYd0NTc0U4?=
 =?utf-8?B?MzhJQ2tiNUFqRm9YMW5TM0hFY1hzRGIxdC9zUmdMSWtJRUUzd2dwRkYyN3Mx?=
 =?utf-8?B?cy9EM2pVSHh1QW5nMy8zdXZrQys1V0Yya2hMWDBMV2RVTFU1Z2JpcU1qMXdX?=
 =?utf-8?B?R0dJd29CNlRuNmlPaW1ydnQ4K29mSWlWSEtFYUZyTmZFdHFHaGRsbjk0TTZC?=
 =?utf-8?B?ZXB1SHlJQUNiNlYyaWRPNlVuRjJ4Wm1IZDlQaDQ1OS9PaTlveG5DVWNsbkY1?=
 =?utf-8?B?SEx4SnUrcUdGdlVMeWlUcDE5cVVNSTZSNDBIWmR0c0NUanVrc2tqb0VVdVJH?=
 =?utf-8?B?N3BCekF4Ymg1N1FIWEZ1c0hlL0NRQk9kdHF5OHNNM2VLd1NFUWEzMGlqMlpx?=
 =?utf-8?B?R0VFS001VFE2STBoSWhkbGhYcUJTL0lwTFAwWTZnTk44UVJWbDFnc25Qay9J?=
 =?utf-8?B?UXJ1SkZFU0Zaa1d0TTFrTXVQQldEV3pFUlk4RlY3bjRXM05QUlJTV2lzcllk?=
 =?utf-8?B?ck9PZzNyV3hRT2pmS3dTTjh2eWtaaUFaazZZZTRoc1pVMjNXVVlnV3FPbUkw?=
 =?utf-8?B?alNTTlEzVnZFZEk5L01lbGM5V2VmanRYaDBSK21GWW9HczBGOUgrd2xLOTFo?=
 =?utf-8?B?WnRFUEpIZTVnRU05QmF2ZDlDTVhEV09ic2pWNkI2dmRGVVJBQjVrVWtJclpM?=
 =?utf-8?B?aXM4eXlTa1RiaWRmUUhjUkNQSEdicG91UU9CcUpudDFvZEJ5N2J3ZlZWeEd3?=
 =?utf-8?B?NnFtMUd6UjUwdGZNeE45bTNPMGF2TzFHZkhZd0l3SmhtRGJBR2ZMamNHc0dU?=
 =?utf-8?B?Zkd5dm9BcXJQcDhZYWVvWXZnRUNXY0paMlhPbmgwazdmU2s0VGptNjQrM2VQ?=
 =?utf-8?B?VlBuNlhGQ3ZFcFpYaHh0bDNKUjhubkxZeWVRbDhUOFBnNEpma0FSRmppT1pk?=
 =?utf-8?B?WUdybDBTNllDQ0dCK0xkOERKTlJmZHVLbzh1NmlmMWhoRDVhYlZjZXRwYWdu?=
 =?utf-8?B?eEkxSzVQVFc2QklQZDBiWlJrOFQrZHg1Tkp2a2trekQxanJua05uMjdGWkZy?=
 =?utf-8?B?VTl6NUUyaXJ0OGwzL3M3ZE5HL05HQndtcEtiYnFpaDFGc0lrbnUveTlETDBo?=
 =?utf-8?B?eERCZUNWYmJ2RmlrNEl0S3N1b0JRWGhkdGh1RjBrYmpTRXpDaE1POFo5aE5U?=
 =?utf-8?B?QTdOaGhZNUZHOEY0S3pjRjV3cjNSc3pFclFFZ0RjVnpnaHN2QW9rSWtzbUs2?=
 =?utf-8?B?dWNwNWdaTGlvMW1NRWRDbTNvdmVsOWZSQ3UyQ3FTZGFORFR2ME1rbWl0dy9H?=
 =?utf-8?B?WGVMT3EwVjJKUVpzMkNuNklwOHBXVjVxWE95L0Z5U1RVNjAwM0ZoT1laNDVT?=
 =?utf-8?B?UXgzUVIrOFNxbjlZTWNHUnFMK2d5aWducHJkQ3hVNEYrNGtYNGdtR2RIS3J0?=
 =?utf-8?B?V1FlTVRnNGxpVHljcGJFM05Lc05KNCtob2dYN2haeGl2N2hFbE1RY2ovTVZB?=
 =?utf-8?B?OUl2eDR1WmZjai9DNjRpQ1VPRVl1bjRKeC85a29adlA1RmJySU9lMVl1WkVz?=
 =?utf-8?B?L2hqdUtrSHQ1K0d4eUlOYkxUYktWYzdYc2V0S0ZOclMzUTg0U2IzWUNkMEhw?=
 =?utf-8?B?UDNybXUyaTJrYWs3SDgvbmVFaVFhdll4RVdkVXkrbjQ1Z0k1RE45SlhHUzZu?=
 =?utf-8?B?TTE1eUFUbnZ4dWtnQ09PZkdMWW5xbUVmNDZWR2NKWU5JbUdCemNHMXNUUW5Q?=
 =?utf-8?B?dTgzczlkOXc4ZmF5ZG1JSWgwYXlROVFTTStPWGJVLzRjUWNvdFZUbFhhWVdr?=
 =?utf-8?B?YVJ0REVpeEY1d2xHMVloeVllbmdOajE5MFBSUWE1cXg4QWgxMW1ZL2hLZXpa?=
 =?utf-8?B?a1MzdlYxM3Fra3NjZmZ6SGpwV3lnYXdFdjR0d3hXb3dnMy9ZV3l2YUhNM0Zo?=
 =?utf-8?B?YUFDSnJ1MTgwbDlEbWpZR2lnMHN5cmVvRGtvNGpzRkg1MnlzbjN2Z0Y3WHB6?=
 =?utf-8?B?MmczUFNvSXVrQm03UkhxeXVUTlV5cC8rcDMwYklOb0l4YXNtNngxdlVkTzd3?=
 =?utf-8?B?aVhEMjY2Z2ozSkpZTDFVeFEvZXhLNC9GRDNrWU1Sd3ozY2pHU2JTMElnNGg0?=
 =?utf-8?B?Qm9OdXZvanlZODV1UWwrRGlrRWRXVHdWcGlPN3JuajBzbndsYlVTUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb084c3-0479-40f0-465d-08deebae6d55
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:12:32.5441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khznn/iYZkm01IWGfLFZzlz4Ex/z4ambjS52RCVQI6bpnzYxOcIckPIB4kIsWsehsKq7rMvIWCY3lqH+V3X3YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7891

Hi Krzysztof,

> On 24/07/2026 09:04, Zhentao Guo via B4 Relay wrote:
>> From: Zhentao Guo <zhentao.guo@amlogic.com>
>>
>> Add initial support for V4L2 stateless video decoder
>> driver on Amlogic S4(S805X2) platform. In phase 1,
>> it supports 8bit H.264 bitstreams decoding. Currently
>> only progressive streams are supported.
>>
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>>   MAINTAINERS                                        |    7 +
>>   drivers/media/platform/amlogic/Kconfig             |    1 +
>>   drivers/media/platform/amlogic/Makefile            |    1 +
>>   drivers/media/platform/amlogic/vdec/Kconfig        |   18 +
>>   drivers/media/platform/amlogic/vdec/Makefile       |    4 +
>>   drivers/media/platform/amlogic/vdec/TODO           |    7 +
>>   drivers/media/platform/amlogic/vdec/aml_vdec.c     |  736 +++++++
>>   drivers/media/platform/amlogic/vdec/aml_vdec.h     |   33 +
>>   drivers/media/platform/amlogic/vdec/aml_vdec_drv.c |  239 +++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_drv.h |  172 ++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c  |  538 +++++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_hw.h  |  157 ++
>>   .../platform/amlogic/vdec/aml_vdec_platform.c      |   81 +
>>   .../platform/amlogic/vdec/aml_vdec_platform.h      |   46 +
>>   .../media/platform/amlogic/vdec/aml_vdec_tee_fw.c  |  240 +++
>>   .../media/platform/amlogic/vdec/aml_vdec_tee_fw.h  |   27 +
>>   drivers/media/platform/amlogic/vdec/h264.c         | 2067 ++++++++++++++++++++
>>   drivers/media/platform/amlogic/vdec/h264.h         |  299 +++
>>   drivers/media/platform/amlogic/vdec/reg_defines.h  |  177 ++
>>   19 files changed, 4850 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a112ce9f0fa0..a27ea19907f9 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1423,6 +1423,13 @@ S:     Maintained
>>   F:   Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
>>   F:   drivers/spi/spi-amlogic-spisg.c
>>
>> +AMLOGIC VDEC DRIVER
>> +M:   Zhentao Guo <zhentao.guo@amlogic.com>
>> +L:   linux-media@vger.kernel.org
> You can drop the L:. Subsystem defines it.
OK, got it. I'll drop this.
>
>> +S:   Maintained
>> +F:   Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
>> +F:   drivers/media/platform/amlogic/vdec/
>> +
>>   AMPHENOL CHIPCAP 2 DRIVER
>>   M:   Javier Carrasco <javier.carrasco.cruz@gmail.com>
>>   L:   linux-hwmon@vger.kernel.org
>> diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
>> index 458acf3d5fa8..7c541ac0d0c3 100644
>> --- a/drivers/media/platform/amlogic/Kconfig
>> +++ b/drivers/media/platform/amlogic/Kconfig
>> @@ -4,3 +4,4 @@ comment "Amlogic media platform drivers"
>>
>>   source "drivers/media/platform/amlogic/c3/Kconfig"
>>   source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
>> +source "drivers/media/platform/amlogic/vdec/Kconfig"
>> diff --git a/drivers/media/platform/amlogic/Makefile b/drivers/media/platform/amlogic/Makefile
>> index c744afcd1b9e..7409de674c0b 100644
>> --- a/drivers/media/platform/amlogic/Makefile
>> +++ b/drivers/media/platform/amlogic/Makefile
>> @@ -2,3 +2,4 @@
>>
>>   obj-y += c3/
>>   obj-y += meson-ge2d/
>> +obj-y += vdec/
>> diff --git a/drivers/media/platform/amlogic/vdec/Kconfig b/drivers/media/platform/amlogic/vdec/Kconfig
>> new file mode 100644
>> index 000000000000..d392967c7743
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/Kconfig
>> @@ -0,0 +1,18 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +
>> +config VIDEO_AMLOGIC_VDEC
>> +    tristate "Amlogic Video Decoder Driver"
>> +    depends on ARCH_MESON || COMPILE_TEST
>> +    depends on VIDEO_DEV
>> +    depends on V4L_MEM2MEM_DRIVERS
>> +    depends on TEE
>> +    select VIDEOBUF2_DMA_CONTIG
>> +    select V4L2_H264
>> +    select V4L2_MEM2MEM_DEV
>> +    select MESON_CANVAS
>> +    select MESON_SM
>> +    help
>> +      This is a v4l2 driver for Amlogic video decoder driver.
>> +       This driver is designed to support V4L2 M2M STATELESS
>> +       interface.
> Somehow messed indentation.
I'll fix the indentation problem in the next revision.
> ...
>
>> +err_media_dev_register:
>> +     v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
>> +error_m2m_mc_register:
>> +     media_device_cleanup(&dev->mdev);
>> +err_vid_dev_register:
>> +     v4l2_m2m_release(dev->m2m_dev_dec);
>> +err_hw_init:
>> +     dev->dec_hw = NULL;
>> +err_dec_mem_init:
>> +     video_device_release(vfd_dec);
>> +err_device_alloc:
>> +     v4l2_device_unregister(&dev->v4l2_dev);
>> +     return ret;
>> +}
>> +
>> +static void aml_vdec_drv_remove(struct platform_device *pdev)
>> +{
>> +     struct aml_vdec_dev *dev = platform_get_drvdata(pdev);
>> +
>> +     vdec_disable(dev->dec_hw);
>> +
>> +     if (media_devnode_is_registered(dev->mdev.devnode)) {
>> +             media_device_unregister(&dev->mdev);
>> +             media_device_cleanup(&dev->mdev);
>> +     }
>> +
>> +     if (dev->m2m_dev_dec)
>> +             v4l2_m2m_release(dev->m2m_dev_dec);
>> +     if (dev->vfd)
>> +             video_unregister_device(dev->vfd);
>> +     if (dev->dec_hw) {
> I do not understand why do you release resources conditionally. Where
> they allocated conditionally? Why probe is not releasing them the same
> way in error paths?

These resources are allocated unconditionally in probe, so they should 
be released unconditionally as well.

I was being overly cautious here to avoid potential double-free 
scenarios. But in fact these resources are only released in remove(), so 
the conditional is redundant. I'll drop it in the next revision.

>
>> +             dev->pvdec_data->destroy_hw_resource(dev);
>> +             dev->dec_hw = NULL;
> What's the purpose of this? If this is needed, then your driver has
> serious concurrency issues which are not solved with it.
>
Do you mean the statement 'dev->dec_hw = NULL;'? Actuallyin the remove 
callback, all resources are at the end of their lifecycle and no other 
path will access this pointer. This was just my coding habit, nulling 
out pointers after freeing them. I'll drop it if you think this is 
unnecessary.
>> +     }
>> +     v4l2_device_unregister(&dev->v4l2_dev);
>> +}
>> +
>> +static const struct of_device_id aml_vdec_match[] = {
>> +     {.compatible = "amlogic,s4-vdec", .data = &aml_vdec_s4_pdata},
> Fix the style, so you will not re-introduce issue Uwe is fixing.
Thanks for the reminder. I will refer to Uwe's patch and improve this.
>
>
> Best regards,
> Krzysztof

BRs

Zhentao

