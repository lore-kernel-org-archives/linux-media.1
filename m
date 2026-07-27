Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022104.outbound.protection.outlook.com [52.101.126.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5752E2931DB;
	Mon, 27 Jul 2026 06:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133970; cv=fail; b=F62gUlsny3wFgnzS125GfBZkT22HMvphcY5rf7sJdq0rn6neVK2S6U3iB9ABFX+HdUVZ14d7dUa5DXV7OqflTCbNYkmyCK0qFD6XcbRCWhhjEQszrdSCfbbRh0oTbntjsHYreIvlFl+byHpXtKaKkYEisSGtuH4xorDOMg3dc08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133970; c=relaxed/simple;
	bh=kV97fhN4rU2Cgqixb7Jrr1hlZre6n4FHknjZxvFGF4s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Oqcxk4XOjb8p5N/V39E0gWrGcCO6zKU6JaI/3/kjPGVc0vk9tBWxQH9fQQzod1P2Gt9SWJNp05LJx3NQxFZB0onTY7PpeQvFTeF5lhgHhONEYdyjQdVXH/cEp43l9hXis4sasdu0Hxn/7vd5+Gr/K1slfzaxqwcL4dCBOPXEQcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Kt3ALyqU; arc=fail smtp.client-ip=52.101.126.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Kt3ALyqU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhMuI6wSjlSa6/M1IJmi59sDEjb4DMwUzDPEdNPsBFvRmBeYWbPCwGBYGYmvKlHlctVZy7NNZcyLLjta86rehdDn/IHXAbOywxn7MSP8OuTlpSyB/670epRqVn5mspd4BWUC01qb0OAWRuNJ1dmK1p+6IFXhg/CZNVIQCCvM3V7NYn4oLEDnuv0toc4ss314vFdBbk4RETALys/HOuAxzVZyvCdnXr7E/y/FMtpcb4XbwGkq3gsKjjxHzxmpo4TBMuV2eWh5UC7ke0ISMU+JUFh0F1YPS8OTnY2geMBsbvUyw+KGeI0ecZNoohbyBgbmMG4aqIAL87YgrMUaNYfqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kZwy/1P/au4qjayKYhm+jPemBnaWoR8pIekrh755uY=;
 b=NDgfbo7XQ/CtR0I/oIgJHbp/OEDDFwyS8vh7wYqQ9bCHsqIK4O2kpQAW8kW016634w9PtrYnbLXumrfs1YSExBfD1QnEZ1pftv4R8wp89obKM3vtmOM/+Nmexk5IEZe5HIb1dyIpzeqy844wpWqZZHlV80Y/fTG+OjeypC71nD53uYItTDFmx/Ag9f4t8b5t5NO/Uk3jH/h6I5dd/L8EGZh917KAwU6AKImB5U8V8FLq773yuXcHJHpOkNu/Y5Ndq5Ytk9c/uzONv/N8lN0YVDsHK8aW9TVJsfFBwVXS36bvKvr0rjtxgGF2MIdlz1BBkz1FwYaRfCgqVem/NtXNQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kZwy/1P/au4qjayKYhm+jPemBnaWoR8pIekrh755uY=;
 b=Kt3ALyqUF9ZLzqLuvz+O9rk0c56u5P6Oihup9ywOjNOcfwtNZiKCfcCz2uVOkTP5/C3GU/qeJSTpdTtSMRu7zhUtCWHa9Op953xnGa09mEE28BA7NgAIFQBdzkzNzHaJPRHTq8oOGo197TfZt9MbK7UycDpE9dayfZzIiEcRmlzOlKbREgjXBL0DQbx7HMBC2Bl0uyruAA1zxoGg48NxA9rp24EdDS3h5FIlHYiyNgPIVk9+pfUU9AfiaDxKm729sLFsVzFuGx+U8JCzifXZIxn02NKkIkgKh6gvBBDHjiVhL56Q7TR3sArTJP81o2eJRFpRwISi8jh/eyjpryT5HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by JH0PR03MB7445.apcprd03.prod.outlook.com (2603:1096:990:19::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 06:32:43 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 06:32:43 +0000
Message-ID: <787775ec-bcf8-4474-a772-88780c49262d@amlogic.com>
Date: Mon, 27 Jul 2026 14:32:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
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
 <20260724-b4-s4-vdec-upstream-v6-3-6072a7ee7428@amlogic.com>
 <20260727-brawny-silent-kangaroo-a02c9c@quoll>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <20260727-brawny-silent-kangaroo-a02c9c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0100.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::14) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|JH0PR03MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: 18de34d6-01df-4611-8437-08deeba8dd12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	62dyZp08yyJZm0jBP7DmGVG3ba9zD6MJF2+cXBnphn5sOdhRkjp3Cyk4JrHQs8LVg6hBCnvjuG7nUWtdIlvH+/DE/S6NjKka6UZvXezOQHRparM7FQw4Hdkz7c7Bf46ZmtokFM5KSuZW4j1pbVFGkYWUYJC1aR9rzR+8EmuYzqzwodUGGeDrFDvKakaVUib2l+zdno1ta4orwWkxGKpfscHyCLies5UAdQVPffYPczsN3+HDsQJ9PoPoZoV/+0qsIYC1DXX/6+Z+29bvaoUeLZwVv1KCo0mZ2aSavdRrQ7g1fia3f9e0b6iCBCwZ/s7oZXcvw5a3y36eB/5xBv838olpx4eu1Vi7bpItxyU37ToN3HsvupVPPkoXoQTiR7NGz53TxF5idHk/oskXU7ba3nzO34nzZZ3ePwL2V1CrijJNI3hhfNmGr/fVGm+WrbqpKfTujYAP3iSZcPjC28OANw8db6xBgu4nmZADY2AjyIYslqYFsH7ZEujy02G7+2MGtzvG3h7gp6yVLTFjQtNqK4NJi7UvJJ111v9SmJA6SlehBX1u4uJ/8UGZYgFI3fvdmsBKcND3bDVYiYZt0q3hShXNIlSCniP/JerAbBvmWRsTB+Ippy5SxzDN5HBplZ5XBnAj5LafutVU8x9JnTl91xzGYWAFD+a316mU8HM89EY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDBRVUpWR0JyU3lKc0RSOFN2ajFTdkk5S2xFaHF2WDd6OWJGSzBrN0tPQ0Zi?=
 =?utf-8?B?b0oyME5HNkRvaHB0NUtNMmE5MXgyVkk1NFJWeEZ2Y0dJWUlQTHd6ZlFmeXVG?=
 =?utf-8?B?M2JEOGUxTVFOcDVVck1OSzVpM3RCRFBtUGtjNHhvbHpWNThUcTNudUR2SjZn?=
 =?utf-8?B?bDBiUEZkNklGa01VNkpFWGxkdTJ3WS9XUmRGMThQbUpleFhPclJoeWlNUEJM?=
 =?utf-8?B?bGRNa0lhNXZoc0ZQTTlsTDZmTmhhRi9ETVkxdnF5OGQzNUhDQ0U0YkxCTlJQ?=
 =?utf-8?B?MGFtbnBzZ1JPRHRaWitMK1lMdFR6K3ZVLzFwYnJUNVhEZ0hnaVc1RW9sSEs2?=
 =?utf-8?B?cW02dC9vL3dFZkZteXVkOGpZSkxFWjZscDNiaXcrNnV3eEo2a2pyeDMzVEpm?=
 =?utf-8?B?WTVVbFVEcFNJZVpRaXRWVFczYlp0UVdpYVR6bXB6ek9POE8wS3YzZFpQdWNt?=
 =?utf-8?B?VlFybGpXdjcxbXc3S1V1cTZ0dXRENWZhZ21WeXN6NlJNUmJjY05selB1bWtm?=
 =?utf-8?B?UGhwdzNYSXV3b2NLZnhuOHhtQWNCRHR5Ry84TTVDeGJULzVjQ25UT3FnMlc2?=
 =?utf-8?B?VnE1T2FDWFdiMG1LRTZoT1RJTHZYRGNERGpsUzNMSk5ENVVxelg5a212d2w2?=
 =?utf-8?B?aGcvREhRNGI5SlIxeVZSd1NMYlpXeEk0RkJnRnBES1daL2ladUwwVU1nMEdX?=
 =?utf-8?B?V0V4eHdHdHpUYitIcmhwSUNKZm8zMUhKS2dENHNxcDIzODZaRzE1R1huRm1s?=
 =?utf-8?B?L1dNR3ZkZGhrQ1NSN0R2VkRORkRNcHhxVllhbnM2N2R6TVpoZHpnZTBXVm5s?=
 =?utf-8?B?d3hFVm5MUDBoTFBGamlodWZiRjRneTJwMVoxdFYzeTlJZnJKbU1XR3VTc1pi?=
 =?utf-8?B?eTF1bjJhZ251MU5DMDRPdi9UbXJXRjRpR2QvdGx4NVNEK3phL3VwUUgyVFVX?=
 =?utf-8?B?K2UvdjdSV014MS9sQzFFTTByTVY1TEt1WEJ4Myt5b1NYVFQrS1ozWWFWRm0z?=
 =?utf-8?B?ZExyVFUvWGFyT0JiczJrNTllWmRwRGdyTVhWVC9HUTBXdGNaVEdBN3E0ZXQv?=
 =?utf-8?B?TEVqRjNXOWY1djh1MVh2NEg2Y0FxbVdJSGg5UDR1d1dGL1ZaYmp1aUlzT1R0?=
 =?utf-8?B?ZklMQjRta2ZJM29vV2J2bmM3KzA1S3ZjaUVQSXQ1VUJ4MGpnSlhMcThFUElh?=
 =?utf-8?B?ZWZKSEdXbGgxOFArZ1FvQWNPTGJzK1k0Vkt4UmhBVSt2dUF0Y2Z0endUZUhw?=
 =?utf-8?B?QWpRN0FIUW83Q3pZSTJRTUJ4L1M2bEtRMGlHQjlySlRBc25uRnVBVk56TSs3?=
 =?utf-8?B?MmdyV1E2cm1PdEhGb3NDV01id0Q4dUxEclRjekpyZnFqbTlVdUlJQTJvMWZn?=
 =?utf-8?B?Z21YTTNkTFdOZEFjRGVHcXRTNnZ5aWcwS1I0UERGWGxRTDJWdlhGa3RsRXRM?=
 =?utf-8?B?Y0cyT2thY0lFRGRyTzUvMXU4WlU5ZUhzZytwNzFKaWRkWlZHaSsvUkhvbU1p?=
 =?utf-8?B?blVoVDZEcnJTdGdmL0tOKzlDRjBkcGlTUXlJMUJab0RRTnczeHRlbzRrNXpn?=
 =?utf-8?B?dzQ5WEVhUmYyQThEaHFwdk5OUkIwb3VuYms2TG1FeG56SnhnNW4yd1BOV1Ir?=
 =?utf-8?B?VW4wQWI5OHlqdERGNFRFS1NtOHhzQ3ZYYXVYUFNtS3J4ZGlsUnltV3hDaHB2?=
 =?utf-8?B?RHRWUXI5d0E5SHpiREt2UVFiMWlEczR4OVFhclUvZ3h6cmR4S0FkUmpXTjZC?=
 =?utf-8?B?SzRrTmEyVnUwVWp4WjVOUXZiM3lJQi9SWWt1K05UZmFLK3gxVDcyQ0NjQlRl?=
 =?utf-8?B?TldLOCswYzl3ajBQUXhraDRERHJUeGFpbjd3SDNCaVBGVzRuSlFrUi92SUY2?=
 =?utf-8?B?SVZOTis0TEpPbXNFdjlQbmMzZ3ZwckhQOWt1elBna1VJd2QwemVQSk1tMFNN?=
 =?utf-8?B?MklMQ0M4NDg5S2s5bFVHaUhIUnpuOUQ1Sms5azJHRGk3QkdFWk9FVGlzaFNY?=
 =?utf-8?B?WUdhMmxvRFhsRzJKOTBDdXFjN0ZFdS9oNGVYdWE3Tm5DYzV0djBXWjA1ZDlR?=
 =?utf-8?B?eDUzb25wcG5QS3ZFQ3ZacHVHL09SVWp3ZklJSlZWQTQ0U2s3WGtpeE9HNXFT?=
 =?utf-8?B?OXlPQUpSUEhWY0REdVNhQldVSGJSaW9JQnRJcitVbnQzN3ppRHJNZk9nVVNI?=
 =?utf-8?B?U29JWWNDd1RCK1JsUEdjNjg4cXlLNXhJY2x5M29uejZqN0NkR2NwakJzZUxI?=
 =?utf-8?B?SDQ3MkFGS3poZGRiR3ZxcDlsTXU1K1FHWVRwV3o3bFhoSVJMOHB6b21COU80?=
 =?utf-8?B?cTlmTzdhcWRBVytiZWhCK1NpTlBZTEJZZEZCTitCZWk1QVovVmwrdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18de34d6-01df-4611-8437-08deeba8dd12
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 06:32:43.1301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jb+/ukXn5It2jtKo/q0jkAbtRcYCRE/P0TBiSohfcFWlJhkuNIaC/wYAZnM1o/++raEcDNVWhWHU254+3Vvdpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7445

Hi Krzysztof

> On Fri, Jul 24, 2026 at 03:04:53PM +0800, Zhentao Guo wrote:
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
>> +    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>> +    #include <dt-bindings/power/meson-s4-power.h>
>> +    #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
>> +    video-codec@fe320000 {
>> +      compatible = "amlogic,s4-vdec";
>> +      reg = <0xfe320000 0x10000>,
>> +            <0xfe036000 0x20>;
>> +      amlogic,canvas = <&canvas>;
>> +      reg-names = "dos",
>> +                  "dmc";
> Please read carefully DTS coding style.
>
> You also need to address all comments from Sashiko.
Thanks for pointing out, I'm checking all the comments from Sashiko and 
will give out my improvement.
>
> Best regards,
> Krzysztof

BRs

Zhentao

