Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023074.outbound.protection.outlook.com [52.101.127.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AD0390CA9;
	Thu, 13 Aug 2026 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610405; cv=fail; b=MfxPrQ0+0r3FSrVhYks3ohtsAqgRWV2puDLNdjpn+2cXtAyPTz/V1oJw2xKq/gWkKhaAX8E/YdJ8FoMF5ESZq9S0bwCm86O3ii7PZMcnl0fv/gX5xNpKYrZ9a3LYQTmqHk5wIGTCmuQgBFqyJ4Cx5YhaRrxFAnpoFqcAWJUgAhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610405; c=relaxed/simple;
	bh=fCxb3gX5jWkUMd/sDSpB4VQ4RvfDCO1qz0j5IognllQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ceZ6cY5jpWZ56edqv02SkJCmeHD7Ie1KjNX4kNUYcvKK99xjoFzGyHLAX9fDfcrq9pRPsZAAnpP/n2YAd9zvGKr72cuSYkM0jnxrKt6WwVGICeVJu7+noEb8Es/pdbLQ7fQTA297fb5ngQt9zU/cQaIGiBrketziJslYmqIUuOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=NM3e//pT; arc=fail smtp.client-ip=52.101.127.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="NM3e//pT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWUcj2dN7j0l/Xwf0hWCvn0L89s1qmKudATl/pM8ygW4l5We/BBW+BY4OYNbJdMd4ezoeYoZTiDgw5ZQKBCIKNqsSeiuTDPwjFym0pGUcHadTyyCFV0XYbmpDTNCtXnNZ1cbdozek0yTAmSDgdGiyL/KgjZ+FGtryixiC2JqvLEYZcL00CWcJbebW/EEeym4XzzlPfzX5ZF2hzo6+od8ZSYbDvBxPSWYBrahpFh7JZ8s8+fEdM/xcyU5ry7uAPs2J7Fy9UdbbM0fPUSEKsQaq59mWZhOVVxCRgduLEaItsWr7nVZDJQJ+pY4fhro/oGABsz9toMSWgrnjLiDScW0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grCyy9zTRwg3O66Wp1XnXrxUOrpyGQzjNyhJ4w8cV/U=;
 b=EOLhk1nMT5tcHnj/kPmNRwW74YnIbwMUBFUgVW/xe5H9Zyx1EopWGTtMEjVwAMCAZNcm1UbvUt+dnzyQ4JWp+0LF2MEkBB3fXrQNGYix+EtbgAhkMkxI7uP+dKLUuVOLfc7yaeR1QcuVeyy5/aZVyy4TrOyxA9RBJTMczW/hM9LYgR3OlNBkDM1l6Fc0iuPzj1ujwnz8klQaIeZSvg1F9QtmbzeDoZq4uHqoX9aYNyZ+SSVShWLPsTuC5flfsJ8MU5ZrWdTQ3EGwNfZH1SlvoJkdsg5Jpw4pPymSALIUXY0aoLyvWZ6yN1rR8uzH4fdvWW639h7nI3QFeL24Fw4otg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grCyy9zTRwg3O66Wp1XnXrxUOrpyGQzjNyhJ4w8cV/U=;
 b=NM3e//pTbykOyh2lygGiao+HPwaamNmpH03nLINOo2De00sOFqZShjXRGBCXH6i6/+C9lsXd3eBeZPIe2h6lnIz8aOIwgwPOwq6Y+ioJrPiXB2P6Y1P+tmIakFztRsMBj1KwLs6UB0bsxpOwPvX84EUUwtodQ9vZMhXp+BoCngvA8DWIpRf3udpbDEoYsu7tOng94A7b/n1vwgVnu2t5Dl0EAqXYejgUYdC7mBvick/rvuPZAsTdeg+selsJZWYMxSfoksPWY2XRKfgg2m2MupBDHQkgTPruQxTkl1NJtqWFl8HPD59v3SiE++1o+m0Ohyi05UHRh8RKk3xjmRUP/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by PS1PPF8AB88AC68.apcprd03.prod.outlook.com (2603:1096:308::2df) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 08:39:54 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 08:39:54 +0000
Message-ID: <80e58bd7-7eb7-4d05-b309-115643767a43@amlogic.com>
Date: Thu, 13 Aug 2026 16:39:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
 <20260812-b4-s4-vdec-upstream-v7-3-3fae085861bd@amlogic.com>
 <20260813-rustling-sassy-terrier-11b99d@quoll>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <20260813-rustling-sassy-terrier-11b99d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|PS1PPF8AB88AC68:EE_
X-MS-Office365-Filtering-Correlation-Id: 58720953-38d4-4ef6-d968-08def9167260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|3023799007|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MaKndnI14yolYzFxnJRk0oKNP6bLavoDj1xsCQLUu9FGUNNeRWqQiqBky6zDVzuiU6X1nXAY8LunnfVQaIR5qNwU3pyzUappEZ9lnClzYU1t2KjZCl2OGzBfAS6mSfqM5ssjjCwkeV3dqIvHnA9sKdX/InVbq6q1O/lceyM7R3uYjwpEA1HEbxB4362V3ZxlsZwe7tuFQuNT7vWehTCHkaWsxKP4nubHJOvT0F6yaSpOB5j9TfNht9HtCBpL2DT1blj/8P9c1FrYyvVw03qlw3ziWC7sBvFqXjOpqDdhz5jkZ4sotw+hV4PLH1tuRov00E/wT9oww+tss8+LorqWETl54ZiSxBEV8P7zVL0wB262+xA42gwd/2mKOpb9eZ0rPsB/IkAuZULygYaOEm1OD2rbMPnEVk3dZW01kIFVjvufG5jqIO9mDBatbfyvvqnECJbJ4T+BUQ62W60/GCSLxkv0aYw74jyQ14MMKz7iHddhaDYqyxnaxGPYUK2L4CX41mSOpyFuRJWbYRVGFIl3IrID4XjGkApuYAANRDMw5WnR0ml1GhWFHPYzE/29AtlzfS8mCEbOLO1uKcr3W6YAolsUO53ep7D8sD1UU2IfCWTIILfDT6bdwhblE3kt2dvT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(3023799007)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVFDaTNTSnVYLzNrbkh2M3V3Nk5JZkkrY1NCN0ErTU9ISU9PRFdaK1VoUWpt?=
 =?utf-8?B?MTNmYzhPTVpMb2NkbkUyaXNqWGNWWWVheXhoRTEvY1AvVkdwTytoNjZ3NWd4?=
 =?utf-8?B?ekhqNVdVV0VqQUd3QUN4eU1WajRKdnUwK2NOWUlkVTM0THBwVU8wY2NBakZX?=
 =?utf-8?B?V1V6RTBRM2lKQTFGcm5JbENpbTdBR2EyQTg3bFlyK1dIQ05LcG13UzdXZzZL?=
 =?utf-8?B?Uzc4L1hMcmFnbURBZ2xxdDJ4eDM5RXZxemJibFNRMHBubENQZmpXWk9zb2lN?=
 =?utf-8?B?K0JKYktOcW8yeWV5QnR1Mi9yU1pIcWtpbGFlVVllbmZxVE1GNk96VnZEbEV6?=
 =?utf-8?B?b1c5QjkvMkJBajJLeXM1NmlNZHVWQUpsanFrSm9keFhabk9LdTRrMG4xQ0Zv?=
 =?utf-8?B?YWE4dWZmdVBSZVZEdlJyUWV4TGZaM0Fta2U2b1JFYjh2N2YxN1UwWVBNUCtV?=
 =?utf-8?B?QzZCSUV0Uk41MzRMLzNaelZRcXQySUJGck1ySm55OVJhK3owYXlSVUk3Ykxv?=
 =?utf-8?B?RnEwVU83b1RrN0d6djFTcThhTE12VGtXZUJoU3pEZDU4Mm55WDgxaG5ndXZT?=
 =?utf-8?B?K3RRL2JvclZDYW9JcVp6OGF5WWdXcFRSbG1GMXVycFp5UEZlVFAwTlpmZ2NR?=
 =?utf-8?B?OFgvZERNcUhoR2pXS2dHeXozZmcwdWp6MlNicHBScGpyQzVxWEhVVlNZYlZ2?=
 =?utf-8?B?R3J6UkI0bWRBNDFDa3FwamVvQTZYU0h0NVFCeVlnWnAxNmhQMW9HeHRoU3Vz?=
 =?utf-8?B?Z2JHVnRJZzJ0UkJVMDJXWXVjQ3Q1anlETkhHTUwrSlFKb3V6eE5QRXRvRmR0?=
 =?utf-8?B?RThHNlYxNHNLY1AzRFNKdzRBTG5Hc2MraEpodWVBaU5YR2VBajY5aFRQdk8v?=
 =?utf-8?B?WjZtdmxDbFhuSXBZYzduV2tBOEFUVHlrODIwRHhRVVRSdzFZbVBZZDFMSW9y?=
 =?utf-8?B?bGptSTJzL3hFZU5NQWFETzJKK2QzTE41KytsSGdiU0ZwNU5rLzV1Y2xqU1Rl?=
 =?utf-8?B?aEVUNEkzdlh4TFBUVnpoWFhuVGZBRlpmaE1PSC9JbWdmSFE5ZGQxL204MEcx?=
 =?utf-8?B?Q04yQjB2UHlpaTQyemNiSnJWVXhTZGJwbVlYTG1YSS9SVi9aYTJiT3JvVExJ?=
 =?utf-8?B?dURwbWxWTXVPOHh1MHltSWQxVm45a3VNbG1neHQ1SXZYVU5veDdUaFVRN21s?=
 =?utf-8?B?QVFOc2hyRUM5MFVrSldkRTVSSUkzb2pVMklucjE1SkoyUVZ4cVZLWDhzUE0z?=
 =?utf-8?B?ZlpLZzNhU0NwVDNVN2w2TVkxMVl0QlA1UXhnOUsycWFocjBsR2plclFRMmRV?=
 =?utf-8?B?UHBUMkxyQ0VVS0pYQjlOcjNrWEZlNjg1QXVneTNsbVROcVFubEpYNVFvVVdp?=
 =?utf-8?B?ejhTemhWQncwVU5UUEQ0OENyVDBZQlNqbFlwa0I4TXZsTmFNSmhPS1hKVVRi?=
 =?utf-8?B?OUJGSFpHY0FsaTA0K24xUXBJa1RNd3Y4ekJuK1U5cCtsZWxrSElxb1J3RjdW?=
 =?utf-8?B?SyttWUxlc29hZ0NYRnM3aUY4NjA5SFpoTkFsbThJb0p1UHdrZ0ZHOE5Qd2dS?=
 =?utf-8?B?QjhYNlpLZDRPYi9xSVlGR3ZHUlNKQ1BCa0YxVU94WkxYdWxySWhBZHF2anlJ?=
 =?utf-8?B?alpvV0FBdEkwak1nMDRQRVp0Q3ByY1F3Sms4bGZmK3ZKK2E3cm14UThjNnFQ?=
 =?utf-8?B?dmd5elA1TmFWcklSQ0VKWExxT1dtc1dtNllUYU9HdWZuQ0hiSXFhL2ZvZE1l?=
 =?utf-8?B?RVN6UFVMZUh6RDh3SGpmb3Exbm83VUgrZFZGcEFBOUNRK29QMkVmc1AwbnRG?=
 =?utf-8?B?MVZKZGdqNkIyY3pwcjQzMHBMUHhWcEZUZmhWSmFZVlVNOGlIVnJzaGRLT0xM?=
 =?utf-8?B?bE8wVGlQdVdyeXdJRWtHSHlkZStnYmdnaXQ5K2FhVmpobjJhczg2TDd3Tm12?=
 =?utf-8?B?R1VDRVJkeFVqUTJFS0t0Z3QrSUE3TG0rYU10TXRCMG4yMUVwY1p2ZWMyaE83?=
 =?utf-8?B?WjlRclBVb2lTMVR1WEFnWGozWXhJYTNFVXdydWVFWjhuNUVEenNsVlRsM1Np?=
 =?utf-8?B?MkgzVlBqdURqR01PeExFL3k2OTVUWEowSmplMmVxUXBiYkhjNDRlUHlkeVVE?=
 =?utf-8?B?YUZwMTBUK2ZpWUo5dGJxNUlTdGNEdEhVNjZGcEs4dENMcyt5aVZpQ0gzNWwz?=
 =?utf-8?B?d05PN1ErR001OEFCbjVCak9lQmZwVFJMYi9TdDNPcW1SaHc1U3JJRnI3TFVv?=
 =?utf-8?B?MjlEcXVsMThlUHVRZjZmNlZOKzR0VHpZZmRLblFqZGpVeW9Ha2E5YWl0ZEpu?=
 =?utf-8?B?ZjlEOElUWnNScm40ZUhkREowbW5LcUtHV3JxdkQ0L1hHUUZrZk8vZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58720953-38d4-4ef6-d968-08def9167260
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 08:39:54.0703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEjifFey5Pj8kGt+MlTFqv9fBQQiPGb4zHxanDDdEEH66i98XoBFll0v1zgt0/9L4GnwJrE7/OFsoy3j7oEjZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF8AB88AC68

Hi Krzysztof

> On Wed, Aug 12, 2026 at 10:41:25AM +0800, Zhentao Guo wrote:
>> Describe the initial support for the V4L2 stateless video decoder
>> driver used with the Amlogic S4 (S805X2) platform.
>>
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>>   .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 111 +++++++++++++++++++++
>>   1 file changed, 111 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>> new file mode 100644
>> index 000000000000..b5af3f931b26
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>> @@ -0,0 +1,111 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Video Decode Accelerator
>> +
>> +maintainers:
>> +  - Zhentao Guo <zhentao.guo@amlogic.com>
>> +
>> +description:
>> +  The Video Decoder Accelerator present on Amlogic SOCs.
>> +  It supports stateless h264 decoding.
>> +
>> +properties:
>> +  compatible:
>> +    const: amlogic,s4-vdec
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dos
>> +      - const: dmc
>> +
>> +  interrupts:
>> +    maxItems: 2
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: hvdec
>> +      - const: vdec
> vdec is the name of the module, so not really useful name.
Ok, I'll come up with a new name and change it in the next revision.
>> +
>> +  clocks:
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: dos
>> +      - const: vdec
> Same here
OK, but there would be a nit. In file 
drivers/soc/amlogic/meson-clk-measure.c, This clock source is also named 
*"vdec"*in|drivers/soc/amlogic/meson-clk-measure.c|, where a 
*"vdec"*clock node is created in debugfs for checking its status. Using 
a different name in the driver (including DT and binding) would make it 
inconsistent with the debugfs node naming.
>> +      - const: hevcf
>> +
>> +  power-domains:
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: vdec
>> +      - const: hvdec
> Same here.
Ok, I'll rename this.
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  amlogic,canvas:
>> +    description: should point to a canvas provider node
> You basically duplicate the property name. Say something useful, what is
> it used for?
I'll update the description to explain its usage in the next version.
>
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  secure-monitor:
>> +    description: phandle to the secure-monitor node
> Can a property whose type is a phandle and is called "secure-monitor" be
> not "phandle to the secure-monitor node"?
>
> Write useful code, not redundant.
Okay, I'll explain it more detailed.
> Anyway, missing vendor prefix as it is not a generic property (otherwise
> point me to generic schema defining it).
I checked the upstream code, this is not a generic property. I'll add 
the prefix.
>
> Best regards,
> Krzysztof

BRs

Zhentao

