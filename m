Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701875;
	b=XjxNaElHNoBCwiSpjW75mQ4nyVSn32zJenK89/S1jisJsFRT1Zo9Uectu0z3AJhOw4Zh
	 qq2GEmjD+W0/tCZjo0YbJ+eLLkP/rEcBXcHKWUKeYxxuyhl6JGq9YsYg5mjOus854eUuf
	 Q8dipc0+5N7/hqDC+s56bYn/yyv1GfI0BnGDk6JGE7XcJS6pjRU2TF9NCKFuCMAVc1d40
	 q3RDiwpZ2VJneC1EKTu4DGS5sf1D0Y+kdk/ppJlrYI6qc644X54R4QT5oKlxc2raUskQ4
	 0GX8CDihD6fhsY0KOkk/tCPZQUqgugO2h5/bqt76FNjFFEQQ9U1IB1j6CV/w8XsUF2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701875;
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
	bh=6jbRVEY8lVic6z/S/KWcFb1KfQpVA2gN6dYHkNDnKrg=;
	b=fJpCywIQ53hXj46htM2f9ZIHLKdB/jBnP34wUGltneS9/SWFO6teR8EbTe8wyhxLSiWl
	 WaqKm2IGr+Qx+EilMP0STqJx1/6V4H5Py9vsKZe4XWTEp20XQf88zgN+yQ9pZrmh+djIw
	 3ItT4a4Tc4dojl70fnfazxtfNhCmJwpKuy8keaJuRUj1SZJQDnDppTLewYcHq0DRmDuMj
	 Zkq7lhi7UvCznLT33DPafvybB/T/MytDKbY0CdgiiHGbyuf6+dNH8KZoBdIBDXjO6hVQd
	 C6uKJs3Gav/JxQN/Y0NuKTa6s/KnMxpNrvBlXy5sXJg+pwTwxKyOk6ycL9SKpn2OL/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherry.de;
	spf=pass smtp.mailfrom=cherry.de;
	dkim=pass header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=m93Qiko6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.7
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013007.outbound.protection.outlook.com [52.101.83.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0899606A337
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 10:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0899606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=m93Qiko6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOsnAkerTkFHpjyI9wXXPnB++mtJgNoiJoqi4rux2ZK5PlFf4FGmHZTlkdQykI0D/Zj/anJz/3wpLl2owlNzG5OakY9PVdCrN5NaKPJ6R1J/wTVlRu3jEs/IkwvAKs7qNskDy/Qbr5R5UZ4q03DextbdafWwFvmc6ns7ixWQlDaBegaeKbtROiX3wfJdK60/bBMzfWFQIwhEhUpEwb9QSkvJg05sVTZQ4p3NjgUJk70RIepOHJrO59mZ8v7KnWFyxVpjVy1xxnzPKAmFtFXPYzqHqdvMPWj/76WwGJhOZDItivZOQyb+6VKB0Cq39NCYJRWo03V9Yys0jRfBrsbzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jbRVEY8lVic6z/S/KWcFb1KfQpVA2gN6dYHkNDnKrg=;
 b=LBRLErZmw2YQfRC/w3l1UNpzgSj4SDpA6AH7R4CM5T02ZaLrFuAwddfv/pvJ4yyBnN9l94PvxUF0vT/QO36/6x35Mv9LaUHELDltq1bu8RS9pzjKAo0GIbzVRY756xQc8wd8yfnyCHIGnScrKNN7H819c+Spn0TemlgBQAMILQ0roIkIGFFG6kp6UPc3cyBz5Y5XC6YXcYVvrRX92NfnNP84DJVenyMAnxi77QPWJcc3XASrRN9zMmNmRjp6K+zoxQ+P2DcazP0q5yidNVVMG/Lg93zd6lbyDvHUYxl8SkTocZu7v+gaqhwybqC6oMilLys+vtf75wE9jbV8/EBuKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jbRVEY8lVic6z/S/KWcFb1KfQpVA2gN6dYHkNDnKrg=;
 b=m93Qiko6kSwR5LXyHKRcd4akdPRE0DNDD4LMHNsWNImJW7N105rrXJE19l8heFJWMGwD9/dpNpc5l7tecuIlMTQG6PXQlUnaUzHm6o0i1KpVjXF67fXkYn2GmPx0UPUb0mgeaTUmEygPbVKPAMa72eNtBxgm9aGUGlOzwGnq8bo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by PAXPR04MB9253.eurprd04.prod.outlook.com (2603:10a6:102:2bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:31:07 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 10:31:07 +0000
Message-ID: <c9e7fae9-56d8-45c1-8383-73e19c9cf296@cherry.de>
Date: Tue, 3 Nov 2026 11:31:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] media: i2c: ov5675: Make room for checking for
 multiple input frequencies
To: Heiko Stuebner <heiko@sntech.de>, sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20261026101646.2450051-1-heiko@sntech.de>
 <20261026101646.2450051-4-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261026101646.2450051-4-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::18) To PA3PR04MB11153.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|PAXPR04MB9253:EE_
X-MS-Office365-Filtering-Correlation-Id: 9145f9fc-d072-41ac-fb38-08df399591ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|261102123227099003|10067099003|261009223027099003|261021121427099003|261021123027099003|4143699003|11063799006|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	guzSRLsTmvPmu68W5JekTIupMupYNSsXJxCZBfdV8TexHoAkk7t3fFXWyHJ7XL8GNu9+lqK5gCZh2oUe6hD5u5momtrWL6c9hqZBJehLH1SCVlkzblwmxRfCjfZmo2yOuJ+zyKuNKx3iP1f1B6W6xbKTkcMVU65jUto9V58mv+1axZ1F4KdXJXAnUEj1tn+KflZkfvdG4MuKrKNxbtJQ/27o2JQvGMx+dg2XbVoOj4xhAxJGz5q1tviZeDmWJkrrIq1TFgXG27U83N6XaSyPMIIZ45tIixBoMDiuzeX2sgqOK6oV1LjmXOy20CNh40W57YWG6JfNaR0W1hvZI6kxQqCSXchKJ7xLVA6WEeAzowA50RnIwxjOuGA/wTH0dUmzcctNNndZ8A0jlum5fWiYbMrIBmrCegWWoc5nBHeit01Tbp/fc2zRd2Ngxz9MBqcv0g9aONy67dB0lcMqyc8IL8+RdDVnIyba8SXb1+DyradvVgH5J8M3H80zttYNZC13okwwwCNWcs/U8uL4UmsjbBrTV5cmE2QJk+pCNl2XjdDRQW3HYhdnnwYUk3cGLWPF2Og5EDbKcE8i9BM/u3Fo3bEtBBcNdWWwPUIXN5yxXrUIXv5FYXz987UooxEnv8LMx/b4JYEQEipRIEeZ0DQqAn2M85y+/kmc4XIbK6s6Eco=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(261102123227099003)(10067099003)(261009223027099003)(261021121427099003)(261021123027099003)(4143699003)(11063799006)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFlXblRod3BwcmhidHZ6elBESUlIQUxvRCtVQVd2NWo4bDdBRCtaZzRIZzdn?=
 =?utf-8?B?bkNOWS9RWi8vbm9iclBmZHZYMFgrUnhpQkh0a2ROTmZidnNjRFRwK3RiTks1?=
 =?utf-8?B?Ry9rMzF3cytuWm0xZnFXRkk2aWR1a3ZEZ0hDUmFLL0hpc2svWSt1ckQrNFN4?=
 =?utf-8?B?dkpZTDhQOHpuM213WXEzYlVCTFE1ME50V2N1Zk1qWGxxSUpXRUVDNkYrQmNy?=
 =?utf-8?B?WUhDV0MvYnk4WXVMOERUVGVrRVY4eFltNVFPYUVIRHduSnVLbmZtOThJOG81?=
 =?utf-8?B?ckljYXlBbkNwV2pueklhUkxuQkMxTFQremJVZW5jS1RGSWszYW5qZ0JGNFow?=
 =?utf-8?B?Q3d6N3dwMzdRclQycS9FeWNXWUgvMlhQdDM4S1lEOVF4QTcvTWpCTkhhUVBJ?=
 =?utf-8?B?RktPSkl5SXc2b2JjQlBNdVRSeHpOWVJqRDNJdnBTajVRd1Y0QzhLenRmdWhs?=
 =?utf-8?B?TFBuT1IrV0FzdGJzM2U4T284V1c3dWZQeUVOWlZ2cWFZdlVUWjRZQ1RvWG1r?=
 =?utf-8?B?T25sM2dEdmZrVWh6YkdMZjRkK1JraHhFVTg5NFJDb21SdmU1VW1pLzY1NWZ2?=
 =?utf-8?B?dzg5Qjg1K05ZT05iSE1pdGtFd1VwejhCajY2a21SZ2l0UHltSm1zbTNzSWs3?=
 =?utf-8?B?Z1RHUTJiZ0k2bm92MkhkdEdCL3dzcVJidHF3QmhWUHlJVm1uOXo0eHVoTU5V?=
 =?utf-8?B?Z0s2VkVHWEV4ckFmbm15THc3NkswU2drbGplR2ZydnhGL3RJMnVvWEdzY2lz?=
 =?utf-8?B?RFJRYkVOMGgxWi9BSUpoSkl5UHUzaEtKUkJ3OEVuVDk3VkxnUThuQ0FIVnc5?=
 =?utf-8?B?eldaa2NkcEFrK0RvT21SRG16dHVoMTZBd3ErWmdDTHQ5blNyVjNpTmpvdkRB?=
 =?utf-8?B?MzgzcXNmVXpucGZlRHhjUEYxNzd5V3pGdi92Q2ZUZThTK2ZZalRrcWZPMlZN?=
 =?utf-8?B?TFNZc2JleDh5MkpZNnQ0OHhiWEZOWFUwcnBsWE9MejBHQlVkY2tFNGphNkpH?=
 =?utf-8?B?Uy9iSzRGamEzalM3Z0NHaGVZK1dwMjFVZ1FkR0k2SytUM1lST0xNanlNZkY3?=
 =?utf-8?B?SSt2RmRxTFZyWDA2d1I5bmpRakxJbUZJd2ZBdUlQRUp0L0NZOHBHbDVyS3JS?=
 =?utf-8?B?elpJajhwQzRCbm81TTdkSlE0Wno3TmJHMGkwTU5SaTNRVnpNYkRnS3VmRFBR?=
 =?utf-8?B?SUZsODgzUVJNSlFzcGJtQkU4dU82eElKZkI0dDRZSnJTWmVtcVFsLzhpNVUx?=
 =?utf-8?B?UFRwejlZK2VXNWhoNHlnTnFtU3FYcU03S2s3L0FaWGUwMGhYQzFTVittRnBY?=
 =?utf-8?B?Q1c2cUM2T3U2aU5XU2xsWG1xa01Fb0k1ZFQyM2tQNFJvVWdQek9MK2RoekZs?=
 =?utf-8?B?K3NlT25QRmVLdURqaWNGVVo1cFdkMWdKdGczcWxQbXpwVk5pYW5kVUZteGtj?=
 =?utf-8?B?WjRVb0F4MURhTll4cjh6WWdqYUkrUVNGMnBrTjlJMXdCdStsSDRUWWRXWGhu?=
 =?utf-8?B?c2wvZVMxbEtuOHdYVjNQMXhCV0JVSzZhUlNpQXlITlZwREVEQWl4R1RKd1Aw?=
 =?utf-8?B?QW1yQUNEV2RVU2R4Yk1FQmx3OTdiUTQ0L25QOW8wNFRUWUpIVTNDMWt1L2pi?=
 =?utf-8?B?QXFtZHc1QlhSRDVvdlFpbWI2VTF1c3JveUp0ckthV3BySXBiVThKVUV5Q1Mx?=
 =?utf-8?B?ZXkyVnNOL3ZpdWNLcVAxVDN3RFQzaUc5elVuVDFFS1U0SGY1cjhHTkhRTEtF?=
 =?utf-8?B?ak92VVNDNHVrMDNCOElmYlpJS2RTTVhqSERVL0lkbVVjeFpXQis5NzJWTlVn?=
 =?utf-8?B?SzN4dzZjV3A0a0JONmFDYW1uZWxGdlpIajU1N2o5RUc0OTFqY1N6NjVGTWg1?=
 =?utf-8?B?UENscVZDaWhnN01WQU5DVlh2bGJ1V25GSlIzNlJKNDlncVZpeWE0Yk9PNjNo?=
 =?utf-8?B?RnBIbGR5Rmtsd2VWTkd2SXpVb0tvd0R6TWRDVXJmR3FlQ1RJWGsyZXcwa25j?=
 =?utf-8?B?N3pHejNzamNnQmlxK0VBTk9IUDhXOGlTWVF4U0w2S0VjUEQ5MGJZM0pvSzl3?=
 =?utf-8?B?cU5Kb2tDVGUwR1RFMXllUzJpckVHaXR4UjE2cVVWS1dwRFhvYVFjcngrUmZx?=
 =?utf-8?B?cnJpdDZTR2lpRU9xQmJCTmtYZXN1NDZYd2FpOTU0VC9weU1YQmFSclFjL0ZT?=
 =?utf-8?B?Nm1OVFlQVCtEYnpkemFNSHkzeEhMSE5LbGpydHZVSWUwOFBJSVdVUm9LZjds?=
 =?utf-8?B?OWJZOUFBUDV5VWlmQUI5T05FRVZFOU9QU3NFVVhQZEI4QUxIcTFmRHkrMHNv?=
 =?utf-8?B?K2QrcmQwaURkalNBaUxFVGozN2hVVkEwWmViM1pSRWFFcHNIZ0cwdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9145f9fc-d072-41ac-fb38-08df399591ff
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:31:07.3913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYoe/Gx0UsPwzjDDRZhYVTuflWbI22vgZ5ONTODFjAfm6Id84ata6J6qQqVbRJXyavRYAaibrexKrwN8BeV0iDXITb9IqE3HOezfxMoWgu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9253

Hi Heiko,

On 10/26/26 11:16 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Right now the driver only allows the single 19.2MHz input clock, but we
> want to support multiple ones in the future. So as a first step, adapt
> the frequency check to handle a list of supported frequencies.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   drivers/media/i2c/ov5675.c | 26 +++++++++++++++++++++-----
>   1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index f6fea59c08ea..1a0ee12912ca 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -21,7 +21,6 @@
>   
>   #define OV5675_LINK_FREQ_450MHZ		450000000ULL
>   #define OV5675_SCLK			90000000LL
> -#define OV5675_XVCLK_19_2		19200000
>   #define OV5675_DATA_LANES		2
>   #define OV5675_RGB_DEPTH		10
>   
> @@ -132,6 +131,17 @@ struct ov5675_mode {
>   	const struct ov5675_reg_list reg_list;
>   };
>   
> +/* Clock rate */
> +
> +enum xvclk_rate {
> +	OV5675_XVCLK_19_2,
> +	OV5675_NUM_SUPPORTED_RATES
> +};
> +
> +static const unsigned long supported_xvclk_rates[] = {
> +	[OV5675_XVCLK_19_2] = 19200000,
> +};
> +
>   static const struct ov5675_reg mipi_data_rate_900mbps[] = {
>   	{0x0300, 0x04},
>   	{0x0302, 0x8d},
> @@ -500,6 +510,7 @@ struct ov5675 {
>   	struct media_pad pad;
>   	struct v4l2_ctrl_handler ctrl_handler;
>   	struct clk *xvclk;
> +	unsigned long xvclk_rate;

Why this new member in the struct? You don't seem to be using it, in 
this patch or later.

I think you meant to declare pll_config_index instead

>   	struct gpio_desc *reset_gpio;
>   	struct regulator_bulk_data supplies[OV5675_NUM_SUPPLIES];
>   
> @@ -1195,7 +1206,6 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
>   	struct v4l2_fwnode_endpoint bus_cfg = {
>   		.bus_type = V4L2_MBUS_CSI2_DPHY
>   	};
> -	unsigned long xvclk_rate;
>   	int ret;
>   	unsigned int i, j;
>   
> @@ -1216,10 +1226,16 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
>   		goto check_hwcfg_error;
>   	}
>   
> -	xvclk_rate = clk_get_rate(ov5675->xvclk);
> -	if (xvclk_rate != OV5675_XVCLK_19_2) {
> +	ov5675->xvclk_rate = clk_get_rate(ov5675->xvclk);
> +
> +	for (i = 0; i < ARRAY_SIZE(supported_xvclk_rates); i++) {
> +		if (ov5675->xvclk_rate == supported_xvclk_rates[i])

and set it here, like in patch 4?

Cheers,
Quentin
