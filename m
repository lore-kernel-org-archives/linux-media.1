Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.94
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795419343;
	b=PEb3YmmlGSLGoZgcMVI/m6lbDixoduJ4UawsLY2fuGtfgXToq7toWbcxq3hqtSQ5URmQ
	 L8xhIhtyHUqSSPxhuAN5LxOdC5f3cDhZMQ0MrnB5+wdabbfCtiyUV2zimlQsPVAPrOLpc
	 m8clMjW6T50Iv3yhi9OH9AWTFF9pVrcPhFLhp9XZDuOqlFn6VLOpzleLEMqYZuzBKDE3z
	 rI/y78TRqf3vTsyM9gYxttXaVvpr9dIIPVh9I8bmsqMyuC8bA1oPAuS1RARUy7yxjSbNe
	 xCX7PClFoDf4FMOkPL7GZSO+ZgyG2QzJOjUb+vgc9IqiydOhikf2Zj7c6tpo/I1BcoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419343;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=UAprrplEPsRyklvJQG2BEriwF3KmZrQkcKVu4nyTnok=;
	b=BxT8BBTAimc2xRlwikMImSY6DDOvfQm4XP7FLhHFM+fJI0l0xMxenkbad5gqYEvAmm24
	 eKWPoWW+ATGT9cYDJMrJJPtqnjN06dZCFuB1UX04OYeByaGrhXSczxrpDp1wL/0K3SJQQ
	 J7ieFePuepb8lstQ2Sw3HDV2XSRKjHv23xEmnFTaSFnTIdEkc+UOH07rQk6K3gyd1kvhr
	 NPgD/150+p0vihLvaj8cyWcRt9KxC5UDJDopvf/BP0dgsKoV0SNWCwKFokQTftLGPssi4
	 INla5v4aFspVuBNuDy7xs0PJ4aPa+V/x/o6JoHW3st4L0wYgxkU+2qytK+EAjsOlK5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b="HcaPxNe/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.94
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022094.outbound.protection.outlook.com [40.107.75.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C767606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C767606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=HcaPxNe/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQOOHKRTE1HHJzpX8lxLlCTZKyPmZi7aZOdIM7xtp8sAM7aQULmUHAh6O5amGDeJoX0trFG60RSTqNtmm+uuAI7LcOygmFFLp2JBrI+dho9Uvv1uMCRc1FYnj0D0D8ZEO8oq4vrwNnNrzabH1+Qhwu+sc0vVMH08S3p7nuxgf0YW4r1CG9MPdWm6Iy6wTkB7b9UyFsNDMHiDUc5ufl1EuhGa8Vuo5MvfJqfjIR0EN6sJ2q5ndPCyCFCpRFGElqu5d1x8IXoBONsydjUzW5oUtR3nTL23obIdcm9zMzvvHTM3RiM3LrbzisHLIu1moH+0Jb9yMI+k3IjKiUt1W5Lvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAprrplEPsRyklvJQG2BEriwF3KmZrQkcKVu4nyTnok=;
 b=DnetbCyfESpkkaw5iYp+SYHP9ZsmbURhkS/KiKutSPz6L55EriJcfoP4n/DPIyIeWvnq3UOqJDI2jS+8dW2cbcyv9ALq0GTRM4sqUKWkPXAry5ar5z9i4r9xQu/07FsLsBhEWcE/JEOZW1vH8a1tyo6HoUrJR+EW8fE8iozn6GKGpq6H4JjoKrcBVbz6UAtgWVBhngBsJBGh9UHy7FV5r/9VPJzCsrFh1/LK2MCkLI7v7JIEQ2WVnCl9HRXcqPquJ3R+nJCMtpHFbDihuBWCFz4jHc5KhEmJWR8Ka3bCybrSdCJToKg/q8kwXUFlKDr9/oaZqckfjTG6jVVMPJOjPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAprrplEPsRyklvJQG2BEriwF3KmZrQkcKVu4nyTnok=;
 b=HcaPxNe/23CMnhm9eSzakhuGFKW+qIh+4E1wr7llPXqFziC9YX2XxzKG83nCNkGJg/Mh2RFS0zEtmIKjG/YiifCq7jf10u6iamwE0RAkKOZXtAFv7DuV1lXz2gor+JKMuL/BtK9LjPd+/zCOSB5MNsmVQHXDMXLqoxoFO2U3jZ3VHSqoXCPSdrKi1ksQviBX8ogYldSlcIto1Sb9y54s4pI6Xiu0aDLdOlfdtpaLz6pw2GIXtmRlVvCg3iNnR0IZ+olM32p2ShoP+2Fh9udz6XqP7o8HPnbYpmn9ztlMj259NUujbWAcKSCtp1B0r2jshQ7dH2qXD629Mrv81SvvJQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by KUZPR03MB9455.apcprd03.prod.outlook.com (2603:1096:d10:45::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Mon, 23 Nov
 2026 07:35:38 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 07:35:38 +0000
Message-ID: <9a5feadb-13d9-4654-9c5e-f7e97a1b8081@amlogic.com>
Date: Mon, 23 Nov 2026 15:35:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Amlogic S4 (S805X2) video decoder firmware for linux-firmware
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Arden Jin <Arden.Jin@amlogic.com>,
 Hui Zhang <Hui.Zhang@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org
References: <cda06da6-e7e0-4522-b1ab-ec542d4703d2@molgen.mpg.de>
 <8be8337a-5b73-4a9a-82a5-5acbdb6d6964@amlogic.com>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <8be8337a-5b73-4a9a-82a5-5acbdb6d6964@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
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
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|KUZPR03MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: bed05e22-ae01-4f28-f05c-08df49345e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|261028144727099003|10067099003|11063799006|261102123227099003|4143699003|5023799004|261022075727099003|261009223027099003|56012099006|261022105027099003|261026121527099003|261021121427099003|261026140227099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	rMNZa0Vl6OrAyCYJQC0UVsz1ElQTTB/slhDEFn4fxtDUumhrr3PDyIUIpUgLqajwRgSQWyOaNwmjwieLXt5NXiJIFCC4NtIlgfJyFvKE7yzamHy3PXMrzqPCRZDQJhnuKAzDSzF34t77oJ2mJNuyBnckZf5FjUFDYDLpD6nAC/5msKv1gA2We4Mgeeqq2rSJMo+BqE7TcY6IsRxRN2y2Y5Jq5S8zH9dGjyzNvejJtz4I2ch+1xQIRv8+ylv73l0yh3fWVOgTgQ18nd96Z7OyHMNa4kRKzSO4wOHEqgqRnHylW7b6kZVKlBW3auDuR61a36cY3/SywrcA4fMEj//lTeY5hUZHgJGJWcXcBaAOWsXMz0mKtBGNbAS5JH1heOiBtIsYJ4nb1n81/LX7tulyQdSH1i0T4M88vrBWw2Dta45hOUtqPDzVPCxP02SEVsHTpZXavseLn7VE2njmcw7FdtodvQAOzZHiIDtHfNvYr+aBm8KAJwyeFa4L/8bVB86cCpX3sGtUhXX+ycElHuUui5twRunR6MzRmGVdIE7RYebzFd+ArYXmYRQ5IWZuU1V2GZrQs+7v8aDRq4ZgTb2pU8yTU1yQIHHAlAJh2uCgvzY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261028144727099003)(10067099003)(11063799006)(261102123227099003)(4143699003)(5023799004)(261022075727099003)(261009223027099003)(56012099006)(261022105027099003)(261026121527099003)(261021121427099003)(261026140227099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3JGb0h0YkZPaS83UzlhaUhZMVVPZ0RWS0NmdWpOMWptdUdsUDNEc1FuNEx0?=
 =?utf-8?B?UVdSaGFmOGc1cS9NYXlablJjY251cHYvZVJLTWtkc3ZNS0U4TWZLajk5TlU3?=
 =?utf-8?B?aWordEgvRzVZdllXUWdZR29ZZU9yWncyRUZERTV3UytuTDI3eDNibzBiOTVG?=
 =?utf-8?B?REFFZnRBME82LzdpQTJ0YkpIc2xkazFyWTRXd3JUak5hMEVha2dKM0VmbjlE?=
 =?utf-8?B?UWRKeExrUXVHRzQ5TENXVHRlQ1I0QkhYRTAwZ1FjMXFZVmVpaGFnWk4zWk1x?=
 =?utf-8?B?Y3BId3pFWnUvZlJVSktCdFNvZGhsNjFsWXM5cGJTREdZaEp0VU91ejVHdEJt?=
 =?utf-8?B?MEVPWlFibDFMRlBFZXNmdDRnR00xNHpnZ1hzVFdLM2g3VFZiYkZHV2Y5NGJR?=
 =?utf-8?B?cUR2bmtSRThOcVRISGJvTTFqUWRUbnVveEJ3czludXNvSHE0L3M4a1VMaHF3?=
 =?utf-8?B?RlcxZndmVVFCOXJLRndzMHFUOVVqR25KWEliTUtCc1ozUWF5Vjdib09nSzBE?=
 =?utf-8?B?cHVsT0h2cldQb3ZJdCtpdnZKS0JkLzVYZ2FPUk50azNvWlFUL2Uwa0pwa2xM?=
 =?utf-8?B?WU1xb0ExSngwZDJkRnJmZGlKaThJcW0yclZaSmx1WG0rd1M5L1Q3ZWR1RldS?=
 =?utf-8?B?VS9hQUMvOEFMWlpiVnJQeEJLYVR2MkFQSWc3Q1RKVlQvdWVzaXlwOHVCY3dY?=
 =?utf-8?B?bzlPcTVCdC9zMVNDc1QySGE5RVhQWit0bVFKMTcvKzlqN2M0R3JFUzJIRkxm?=
 =?utf-8?B?WjJPUG5vcjJHZVhvUlhXbVNOOEVjRUhpNGN0OGdOc082TDVLSG5QcXhlR0ZY?=
 =?utf-8?B?aUFmSXhLd0RHeDQ1RW5hWXByMVZra2lMalV1bEorY1d5VlN6N2owK3JISUIv?=
 =?utf-8?B?NVE1QUFnaGhwRFNVcVhYOVFmTFhIbXVwTyswOTlTQnJ0aWNqb1RPKzFYWXdK?=
 =?utf-8?B?N28raXp0WXpwbHQyRUwzUTlwSlROYmdyaEVvNThGT2RPeDRzV3BjTGZXb2d3?=
 =?utf-8?B?NEErVEszQWZnNjVyTGhCUi8vWEVkTEJqN25CaVZNMitXZUdOcVQ2YTdIdnRZ?=
 =?utf-8?B?RnFwUElzSkQraHZodWdGR3ZVbXFwUkRSYkluUllzVjJJbkc4TEZrSnlPUy9Z?=
 =?utf-8?B?QmEvN2hBRHdzazROdDlHYVlaWmdSRHRidGRaS0JSaFNscjArRGo3cTNtbXVw?=
 =?utf-8?B?Q1h3dis5REpUZnJLZkRVVmtiVGdadk53UmFqMHFYNi9ldElxZEMrY3ZpU0o3?=
 =?utf-8?B?NmZBanpORStXd0xIaFdzb29sN3dnOXJESFRKaTVlMUpIeks2Z2M4L2lYVzRv?=
 =?utf-8?B?eWtMcjgzbldLYkdTbHJUVTJNYUxMNzdFQ2o0VURESFlJWVFjZGJZdnB6d2Jr?=
 =?utf-8?B?VGpjeHcwMnNhT1dNZklSa2ErVzdnTitqdFJkV1FJSXlYTGROU1Znc3BQUzZv?=
 =?utf-8?B?aXM0dXNqMmJwQ0w2dHhNa1pmelFYNkdiKzhWSUtSMUdoSk9NdjU5STJNcUdN?=
 =?utf-8?B?V0xUVUpCSVU4NGZRQ0JsNzViKzJCSW9NdTZKSUtSRlordjRoemFJanJvMFN6?=
 =?utf-8?B?bnRsZ1k1eTNYa2k0c2dWMUM5Qld4bUNQMkNTVTFreUhyMUlaS2JtMHhoVGNv?=
 =?utf-8?B?Ym5LMCtiQ2pDbEZHaUlRSmFPenJLN3BzKzBFNkJzNUNNc2h1UHlZUi9ZOFVJ?=
 =?utf-8?B?a2FXUnVZRVJKOUJ4WmlXKytadWY3VVZQNjJ5ajZOK3lsTGxRYVJiK1RRSzJv?=
 =?utf-8?B?bzU1MUZQNVBKMFNQbWV1cnNPNXVjaE1QcHoxUXdzMEduWXhjYVNoZXAraWVG?=
 =?utf-8?B?MFc1bTY2WEtkbWwzdlB5K0dqNVNFSzVRY29mMVNsM1hJbW1NQ0dmbGxHVER5?=
 =?utf-8?B?eHlkN1RBY0gwd2p3aTZKK2pRanFBQVZmNzhPUEI5ZEJTby9oNXRlaU1xbHFS?=
 =?utf-8?B?c29pNkhJK3FGdzg5RUFBRzU5TFZ6NXdDbVlhQjJwSDlvU0FGcVNGcWFabE9t?=
 =?utf-8?B?aGY0S1Q5dHorM2xYSmVLcjdhakF4Q1h4ekxiYnRnV3JqbTVZaXJWRENhRlhV?=
 =?utf-8?B?eWxlNFhlVytiUWkrMjR3anFRNExZMVdTT3JaR0xRRnZvZ3pHb1dHcGIxMFph?=
 =?utf-8?B?bUQ3c2ExZDJmeklBc3F2M2p6bE9SclJBano5VlNOVmV2TjU4ZVE3N3ZzNk5h?=
 =?utf-8?B?ZENrbEpudk52MUJtaVg4RTczQjZtZ3RwbjZHT3lqVGt1ZzZPcGZhRUp4VVlN?=
 =?utf-8?B?a3VvVnJDc1c4VDRKdUtCcktBUTY5blBaZzdzcEpEQkVPUlZ5bmIzaU1DOG53?=
 =?utf-8?B?YzR4bEZ3bmFoSFpzRU9iLzc3Nm1SQmlodHRreHhDcWpsbWt1Y2lHUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed05e22-ae01-4f28-f05c-08df49345e75
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 07:35:38.4445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHdbg5otClEOTzLwZdQFJS98DfjyZ3+NdwwUzYaumj9ZQXhFjn/g3o9yl1JrnKf/99vmSzhDFGvXC2HCRdrmDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9455

Dear Paul,

> Hi Paul,
>    A colleague of ours(zhentao.guo@amlogic.com) knows this part better.
>
> Hi Zhentao,
>    Could you please take a look? Thanks!
>
> On 2026/11/22 17:18, Paul Menzel wrote:
>>
>> Dear Xianwei, dear Arden,
>>
>>
>> Before buying a Chromecast with Google TV HD (boreal, Amlogic
>> S805X2/S4), I would like to sort out the firmware situation.
>>
>> linux-firmware has meson/vdec/*.bin for GXBB up to SM1 under
>> LICENSES/LICENSE.amlogic_vdec, extracted from Amlogic’s July 2019
>> release (linux-firmware commits e04cc56d and fb505a69, with Arden in
>> Cc). There is nothing for S4.
>>
>> In the media_modules sources Google published for boreal [1] (package
>> v0.4.66, commit 1752357, built 2024-12-27), I found:
>>
>> 1.  firmware/S805X2/video_ucode.bin and firmware/S805X2G/video_ucode.bin
>> are NEWP packages: only the headers are in plaintext, and the microcode
>> is encrypted and loaded through OP-TEE (TEE_SMC_LOAD_VIDEO_FW).
>>
>> 2.  The headers record the CRC32 of the plaintext. Each of the 14 S4
>> entries has the CRC32 and size of an entry in the generic plaintext
>> package firmware/video_ucode.bin:
>>
>>      - SM1 builds: h264_multi, mpeg12_multi, vc1, xvid_multi, avs_multi,
>> h264_mvc
>>      - G12A builds: hevc, h264_multi_mmu
>>      - T5D builds: vp9_mmu, hevc_mmu, hevc_mmu_swap
>>      - SC2 av1_mmu, T7 avs2_mmu, G12B mjpeg_multi
>>
>> 3.  None of them is byte-identical to a file in linux-firmware, and the
>> current package no longer contains the single-instance H.264 and
>> MPEG-1/2 microcode that the mainline driver loads (g12a_h264.bin,
>> gxl_mpeg12.bin).
>>
>> The files carry no license, so I cannot submit them myself. My 
>> questions:
>>
>> 1.  Does Amlogic agree to distributing the S4 video decoder firmware in
>> linux-firmware under LICENSE.amlogic_vdec? Concretely, the plaintext
>> builds S4 uses, as meson/vdec/s4_*.bin. Would you prefer to submit them
>> yourself, or to ack a submission from me?
In fact, Amlogic is currently working on upstream decoder for the S4, 
including stateless decoder driver patchset: 
https://lore.kernel.org/linux-amlogic/20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com/ 
<https://lore.kernel.org/linux-amlogic/20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com/>, 
along with the matching firmware submission: 
https://lore.kernel.org/linux-amlogic/20261116094040.4176202-1-zhentao.guo@amlogic.com/. 
The current firmware submission covers the S4 platform and the H.264 
codec; we will extend it to more platforms and more codec formats in the 
future. And of course, we plan to make these submissions ourselves.
>>
>> 2.  The mainline driver loads the microcode from the non-secure world,
>> by pointing (HEVC_)IMEM_DMA_ADR at a coherent buffer. Does this work on
>> S4, or does the DOS block only accept microcode loaded by BL32? If the
>> latter, is the SMC interface documented, and does the BL32 on production
>> S4 devices include the microcode?
Unlike the legacy chips that already supported in mainline (such as G12, 
SM1, etc.), the S4 and the newer chips can only accept firmware that is 
loaded into secure memory by BL32 and then read by the AMRISC hardware 
currently. The microcode on production devices is also loaded following 
this same procedure. The legacy chips can support the unsigned firmware 
loaded by CPU. The stateless decoder for the S4 will also support these 
legacy chips in the next year.

>>
>> 3.  Does g12a_h264.bin work on S4, or is there an S4 build of the
>> single-instance H.264 microcode? Or should the mainline driver use
>> h264_multi on newer SoCs?
The g12a_h264.bin does not work on S4, and no more single-instance H264 
microcode can run on S4 and the newer SOCs. All the new SOCs can only 
use the h264_multi firmware.
>>
>>
>> Kind regards,
>>
>> Paul
>>
>>
>> [1]: 
>> https://nest-open-source.googlesource.com/manifest_repos/media_modules

Best regards,

Zhentao

