Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793109503;
	b=RlGefAZ+6cuZ2Ew2GGtEajQsWwWD+KSJ4NRS/R6YgvBIDVq2is+TkKgggNgpqgN+DIsA
	 aLNl84ya5sbui2mc0AC32+wK3CYVCXnJd8S37NT1okAzj3HGSNMKk73sSLlNTf0ScQxh1
	 vDNmQiFV2g6PTf9s1QMobgu7hCnjUqh7yBFsX6NvcgTNrMcCHE1hTU0X50S+ynpA6RX3b
	 1EKRxytP+wVqMd9E1Gi+c/fQb343Uy/flITstgMX7WnR0cObt3D2AKzff3H8sN4wZqsG/
	 6wm88JNJfskG2w7yuOwUeXHk4qGtsiAqAMrj0dzqFGVyb/UTRXHWZtjEBNZm0sAdbBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109503;
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
	bh=SkQi9TaHdvkhxK+xlOcotrQ6Mb2V83TlV49edZd2nv8=;
	b=U8BrXdlCSBWRQQOnZyCV42giZQusDuxDw4sDUoHzGXTGlWKaYL0lbYEjcsiQVrMYWYXB
	 lIHRGtszuT6xJ6iYsN6W1KnXq6FIQTuHjm8fviOUmRtU2cQjQQP7eytCAWxwqucsDbRy5
	 NNUacxlLPBH7/OPUSIyvSFnojPj6ONtDHoB8M/YMNVaHXs5+KRLedwJ9tDTfreWfVf5Hm
	 dlj8cgCierQq1cf0wBDkaz0AdhU/FtKE83GBbnnxO7pv+3uxMGkvxb4QnuoKjXTFaVZir
	 TNRfJY/jPTj9b3bCQI2OSalwtZYYHKMAa0w+cv3BE1vt1iDNC1HAPFQmObj7bSuhh3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherry.de;
	spf=pass smtp.mailfrom=cherry.de;
	dkim=pass header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=Q6O5gzI4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.52
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128A6606A322
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 13:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 128A6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=Q6O5gzI4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNMDj0ICST8sR/tjQcPO4OckK/1MBMiPpbyNtPkSghUwvqBSYJSsY6Itloh8lHReCnsHZm40+e43AIqfE5dh89OpRzoHIXfvwyPbkA+vURRlQYdRdzn5Ofp2+InWMeEkEZFVDv6QXH4DbW5vcedoUZYlScnbYArwAcjweanlJsjnH8fMhUrz4uhq6Flr4BEBWndlBzsAbQL0m/XpfPVw/t8oD03jBfOSsJiqWfUf5V/W+iY49J9YuqpmJra3wmoLx8624wC8mYWkqhilQVcImQh2Edb9z8T3+Zvcgw49UbbHB8t178ecZiPgxaUEGoGRbayDOVs42KGD2veQynn+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkQi9TaHdvkhxK+xlOcotrQ6Mb2V83TlV49edZd2nv8=;
 b=dhnNLLYJMK7QNc5itA+xUSsQ7ZPXNOby8OJjsxUYRD7zFf7qWfDMjG5DWAvrGhwSvg3ADrsLZCHbk9ilVPvXFLbF8AnFWUvPvgEVXnDMRyMkASU+0Kh4PgcGZkVNHC70gcHylanTZfsHtHzl7dZb5CU3RLDbq5LaPBILdeSsQM8UeXlFfH2x1yi9O6onRn0o115m46L9fSwHeKCigiV99F3n2QKG4rl1u6yqms/icCO+KiQq8yBFL5dS+z5MzrwdWpOKAyh5oRO3dINEi5xAKftJgCzBJcz0BH9mtEvjLrr+Snd+1KSj9zzTWWAIPPreVc0+OhgdgaDX+GD/1Hcq6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkQi9TaHdvkhxK+xlOcotrQ6Mb2V83TlV49edZd2nv8=;
 b=Q6O5gzI4RK+hKqyERGgCQgCAcjyXVUUOobKvMVXWeiaNwbt57RpSEkHVsTfGbYNEdz5B1VpkaI9E00GH7v+tfaLxpunB8MGoTE0qm2GDR1zfnpg4WVUMSZpBK3f9y9ua/epd7iOHZV4/5V/jFDH5kcSti4RYfQP8VeRjX/F/nPs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by GVXPR04MB10325.eurprd04.prod.outlook.com (2603:10a6:150:1e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 13:58:15 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 13:58:14 +0000
Message-ID: <c36a6cf3-47a3-4ce8-8fda-6a6994ddcdcf@cherry.de>
Date: Tue, 27 Oct 2026 14:58:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [0/3] media: support Y8/GREY and Y10 bus/pixel formats for
 Rockchip VICAP and Synopsys CSI2RX
To: linux-media@vger.kernel.org, Quentin Schulz <foss+kernel@0leil.net>
Cc: Linux Media CI <media-ci@linuxtv.org>
References: <20261016-v4l-y8-y10-csi-vicap-v1-0-27bb87aa745d@cherry.de>
 <6ad266ed.dd457072.1a88ca.20d8@mx.google.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <6ad266ed.dd457072.1a88ca.20d8@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI4PEPF0000013F.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::889) To PA3PR04MB11153.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|GVXPR04MB10325:EE_
X-MS-Office365-Filtering-Correlation-Id: 56055869-7104-4ec1-24eb-08df3432584f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|261009223027099003|10067099003|56012099006|18002099003|22082099003|261026121527099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	toZMGirj4kYz4LcgwhRfHjfFJH14xKeVXWMvqMwBO36etaIXgv1fHBRi5tu1KSEU8eGAAz1bAEFtQPRYrBz4VYNzViftOUbGdmtjdZhKQwJi6M5R5ZyQUyamxM5i8160E1JKw/dLRg/r70Vc8gkB796IHUMH8b++qsW22r8kq7dL89eXTHsb/JHdCcTXxtoteG2bdV5lbJ4qt7jNYqgZp8/NI0rlf6UixbD3B6K4zrf6DeT/OHrUEWbjy+QkyvjF8kUuAp4Ce64OTGv6My3PejXFE6sdpEGWFPG8EjBCljFXtPLBjMuyCwEfKDX0FdbhS5UnAhCiWSHUGoMaLAJ5lfrP8d01Tq+/a9DsYa5uNrM7PG2tiY8W8Kv7Sv9kP7vgqgNESDA+iJuJQyuXuEl7kenLQlIrePgl3bYJRc7N0rVEAJ+95WfDOPAXgn6NUDua4xNG5WbpFCHa+UDFPN00KnGiWz+hMysW98bfd3dgwmgb5Ro6BLOeYb5vwLSr9jDij3vnq6uRZmjqCywmGTUR2wSbYknTfqxMjGf4/JQD/bZjkPmKXrLJfBbFZWl9kDu+hyhqHkIRTGt+OsLkrEpKGHOmlYcMcgCakV1dWFoGVlEIpSIVKun7Rd45e7+DMJ3JPYhL6sHa6zXsYjw5HR9N53CaDdDPM8xP9h6Wt3GGHVk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261009223027099003)(10067099003)(56012099006)(18002099003)(22082099003)(261026121527099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SktsUnl0Z0krVzk1eEtpTmttL0FveU02OTdTRlp3cGw3eC9Ld2ZQcDBGb3hO?=
 =?utf-8?B?blovOVVwVnd6dDFycnowNWtHY1FkN2xpTDVTYXNIVFBNM3gvZWJONUtEVFJL?=
 =?utf-8?B?aXRxak5EVFRuU0JXRGkvTGFWWFM5RHpEbVlqNTl3UUZwQU9XZVcyZk1HSFRn?=
 =?utf-8?B?Qm1qbmxnMlh4T1lLZ0dtNWtlNVJNeWI4bVFsYkNOYWFkUWtIZU1IZDdPREtL?=
 =?utf-8?B?YjY1OWYraUVxaGdXZ2cxV0ZtM2Zvc2pDUVJRMWdNWXE2bTVMWE1VS0JrN2FS?=
 =?utf-8?B?cXFxN1o0bldHN2RGTVZnbXRsZ1QyS3RTRlZ2WTh1ZVpJbVlBSm5oNlZQTWF3?=
 =?utf-8?B?eFZUOE1hZ2FRenM0U1NjSkxGS0k0S005T1Vadmh6Y3piSXBhS0pMY0RCOXBi?=
 =?utf-8?B?UEhKcjZYaUVFTnpNVmQrQU8wSytGa3Npd293Q1lvMll1MlBPNzVnL09STnR0?=
 =?utf-8?B?ZWpMMFF0eGhYU0RydmFwTkFoamJLek9yWW1PaE1mWS9FdzBVQVc4MzBjNE0x?=
 =?utf-8?B?R1JJUUlxdUNJUDdya0hJYXMwWnR4K0VyNnl5enQ2UmdacnpwQnBrSzh1Vm9U?=
 =?utf-8?B?eVJsbmtWN2xOa20xUnBtNGxGQzZXVVJpcDIrdTZ4dVF0S0lNS2IxSUgrVkRN?=
 =?utf-8?B?TFYzWVYzQmFUOVRRcER5Si9GYldKcHBmZUIyQ1QzSXF6bUVoM3k0bXl2ejVl?=
 =?utf-8?B?UFR4R3BpWUdxbGdGQjg4QXVzbTQvcDFOc1dadVdvZS84ZytFem9KN0FOdkpz?=
 =?utf-8?B?VmZpdFRnejhCaFVWN0dONTRYZjVvc0Z3SnZhRjFyTEwwOE01a1dGTjJEenU4?=
 =?utf-8?B?K1hHTDI1dFlaT050RWJINXNmVHVmNHJMNlc0UTRicWVEVHd5WVRpSlpETk84?=
 =?utf-8?B?dHNUWk0rdVY1V0VjTmZNMkRTZXRDa3g1dHEycXZwR2ZYZWo0NnN4cjg4N203?=
 =?utf-8?B?bWkyMXdVVm9UOXJlbEVBK0QzNk9mejROZ2pETUZUbXdnRTljcjk1UG1tMEFC?=
 =?utf-8?B?YndNNWlwWVJ0UlRocktNeTc2TlBNR2Rod0hhZEZBemdOZG94V0ZVemtBSm5G?=
 =?utf-8?B?SitPSU9JVHl5V2cyR1JzVWxRNndMU29FQ1YrMnpQbWtCOXFLdCsvMlNlSW80?=
 =?utf-8?B?SWdEZThJNlNkU2svY0E0eVlCdkgwbElNZnhaNGRsc2gydE85am9rMUE5eThU?=
 =?utf-8?B?V3ZJRFEvQUpmeVJOQmhBR1d3aWtPWkh4eVI1bmRqVmE5TDZ6RWRRTWJUdUdU?=
 =?utf-8?B?cU0wd3piVnMrU3VCbUwvd3k1ZFdVQ2tncmhKa0c2Y1VxZFR3VzhjOWtkUElh?=
 =?utf-8?B?anF1cUNZcU1mNHNma2NuazZEcXRWSGxLRkFBTklBT3BJZzFzTStIUHFrVTFS?=
 =?utf-8?B?TmZXWlhNS0hpcC93WGdaaVJEZE81VUx4SWFvREE5ZlhIZW52dUJBdTFBZG9B?=
 =?utf-8?B?SjV3ekpDUzRISThiN2k2MGVJL1NQV09vU1FheTMyWWVXSkJQWThJaXJJNmcx?=
 =?utf-8?B?TFhpUk05MjBFanJYbkp3TjdiWFE1Y2lXZVlFQ0RneGtNNGZTTURPRnJGR3NH?=
 =?utf-8?B?bGJabXF5bGk1ay9WcnR3c3c2MGRvMEl3OG9rbkNCcWtsQXU2RXJHQ3BmWHpr?=
 =?utf-8?B?UXIzVFFiMmJmK2JZNldCeHlDQjF4TTJ1VXd2azVwQ0FYRlNPREp0RTBqcHhP?=
 =?utf-8?B?MFFmZnVDUWtPNzVady95QVZhR2xhQzNlUjZDc1E0Z2s4bmtDMDg4Y1F6cHhw?=
 =?utf-8?B?N3JQTG92bklXSExJRmVPUmlxUlNpdHZZQ2FiTlFxSmhrUGtQVEU2ZEE0S0E2?=
 =?utf-8?B?SWozYWQ3eUEwalFENmk0VHJCUUZTVFBZczBpbUpiOWM0a3lQQXU0VkJSK2NQ?=
 =?utf-8?B?K1MyaWtmbDBnVVpZMWxpYklmbWNGMUc2TFVyaXVGNkI5NjBYUjMyS0VLWHhT?=
 =?utf-8?B?NXpSSDI1UklhZ05wb2VRN2VvZ1p0RnRteFdsTUVscng1UDhZMG4wTXlkNDBW?=
 =?utf-8?B?UVk5VzdQQnNFWFRNYUNvOUlmK0lPUkpUN1l3TnJ0UGc3THFHSVA3NTRaRnNt?=
 =?utf-8?B?ekZyY0NLb1g0N1YvdHVIWHhLenlmK3Z0L0h2dmFYWllpY0pQWVVabUVMUmFZ?=
 =?utf-8?B?WnJIdXN2U3pYUnpoR2VtQWt6RWxnNFZSSjZLVFMrZHM4eXRmNm8wQlFldkxj?=
 =?utf-8?B?TE1GcjE2a1ZCb3MrYS9lUS80Ty9aMUhPUGJCdk5zcUw0dlprRE95R256TVF3?=
 =?utf-8?B?Y0c0YzNRSEo2QUNuQXRLOGFuZzJjd0hieHl6WDZGUTArK0xQa1hic3dlUkg4?=
 =?utf-8?B?Njh1RnVHWUhWUDVsM05kamNxZDd6MzhVZk0xQUd4Y21WQmJJZ2Vldz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 56055869-7104-4ec1-24eb-08df3432584f
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 13:58:14.6305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6SNf+iDrcSPtoIDGGjbd/PiLzn95cI46Cm8Yk0gLoaz8UcBOCV9Aa/ZNEYfsJylHyrU9bot0tsgDeHh+/kbEj0h1FniTkcsoBQ86uTynbAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10325

On 10/16/26 8:03 PM, Patchwork Integration wrote:
> Dear Quentin Schulz:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test checkpatch:./0001-media-v4l2-common-add-V4L2_PIX_FMT_Y10-to-v4l2_forma.patch checkpatch
> WARNING: line length of 191 exceeds 100 columns
> #25: FILE: drivers/media/v4l2-core/v4l2-common.c:336:
> +{ .format = V4L2_PIX_FMT_Y10,     .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> 
> total: 0 errors, 1 warnings, 0 checks, 7 lines checked
> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 

Unless requested by a human, I won't do that as the patch follows the 
current formatting in this file.

Quentin
