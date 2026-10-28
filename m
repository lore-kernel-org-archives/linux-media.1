Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793196196;
	b=x8Xomf0Fft+LQsPaPXCAeza6GN6zmlAbes8f9mfagU/5/nRYjPIryVmuNGdAolN66C/N
	 x6tnWpy8O9UeYk5bg2/6ZmYZGpD7YeXv2FUuK81m24iHKUSmjwuar8OefwQGU5adalH+0
	 uOlDdwHkTmoPnvDk9nYb0yavQDU9zNjJ9JPort8K6ZQ1N0Z9/hWHcJsde2pdSB+hOdlZs
	 MdLkFdOtZn5hHuPVk2NpNxYI767R5beEi0h8PdDM5EowKZvWS3atmnNqIayyheF+E/Tdi
	 yUoDsMDiVOtLfj479C87Kj3x60+zp+XlCKMRPLkWm0BKau9kYrmVs12iifFp5+9fBmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196196;
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
	bh=fBRHM/dYBJXFpqQucE3MolM3R+rfLw6UNPmgzLOD6Rc=;
	b=Ot9nYFPeJ6IAwwZBZwoptVAnvU1OtIC8vVJEGof6wmZlzUGHGFTYFl094pMjBgTkUY0p
	 BefSsip0PrMCpmoJ/HAVIB4ZkNg0gRCfvbmihOxs7/y8psRGltM38cAIAS+ywwEumxmIl
	 e5WTVdFuDbecsDW0QIGk785SMDVCjZHgo1j79dP9UniIsUf18OAS+kl68Q4F2XXr8IQoh
	 6SkGrhMLwTa5OxQUQpVAtBAQ6qWE68+LkmxO3GJtDbNECDy7JN0Hm8a9ypdrQvT4sHa2v
	 rrpW5iCjXcwNkcREuccg3uE76k7cWgJHB9PL5dGh/Son4fbTwR5xEGXpcwzHirn7Row==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="wNxjDQ/E";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.21
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010021.outbound.protection.outlook.com [40.93.198.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C110C606A31A
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C110C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wNxjDQ/E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ninfdi4xIbyOUU8rbx4J98tNMfP77ik2zWdAZPNjKmTPDBtxFlasH/QDEyu8+XhdDRpkxH1C9AKU0+leTAh8zIFKMwK6JSmb0tG9v6TyplY1J/4r/th1Q47KRQWC+8l5ehTveLt+FRdzmOE3RYZwTHgttdSVtq5e/71WW22nUJSFv60YjmElrCCmB6zzYN5VZTTBrEzHX6dgM0U2qbg7jC9meKIWBC6FqrOBDERtTtADF1u1Da4mIg0MouyEzXriIH2hkWkQBz8v0JObQ9gMW5nUcaLTdkRs7WBYiFh9YFhTNk3YYvkbrGHhklKtK9wuqP34PfjDY/i3l0YH4jsyKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBRHM/dYBJXFpqQucE3MolM3R+rfLw6UNPmgzLOD6Rc=;
 b=N9O3mqvnbHVgjgFjKXJfqzhUC20PsZzMMDKP1WbFwLTBtySu874vVBJdGnmgbtfyWTrYr98B3MA0rA0PIgzIDLXOWESs65dEFvRZ53I6xi1y94RCVFmdubgaPyr07fHwkmPFBx2P+0bzABMs2bwMLQFOlII2f6PA0P6Os1YjTyTYxSPR15FW9JcNeORnTJ8pAr8PGtVxMYE+/oXL0wvz7pMAW4cl15oLyxbYlhyaxSEdiIqbsmInJflXNL2M8fKC+2XBI+5Oc6t3pEDcGVDTFU1SMnf1IjYdGxk7EQxm1a8aljUGoavLQo+San62GO+HIGLK9iKHt4kiX9GwLDlJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBRHM/dYBJXFpqQucE3MolM3R+rfLw6UNPmgzLOD6Rc=;
 b=wNxjDQ/EoEXqpgCWfa4lAx308Z/Ta/2a/LJ8eArImuDmNzIArquUyR8nhBkSyw+Zw/MuDjlA+vgTeqthNIGEgDqVOl+KdwIcsiSdjGs2S6NLBx7hIohVchiJ2EidDnzkb+3sHSdsveKmItuZi0u+BFvo8unKJiC4ug+g7zykPoQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH4PR12MB590718.namprd12.prod.outlook.com (2603:10b6:610:50f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 14:03:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 14:03:13 +0000
Message-ID: <52a82bea-3105-4bb5-a6e0-b1a0e3b808b3@amd.com>
Date: Wed, 28 Oct 2026 15:03:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] dma-buf: system_heap: 2MB chunks on x86
To: Davidlohr Bueso <dave@stgolabs.net>, sumit.semwal@linaro.org,
 phasta@kernel.org
Cc: benjamin.gaignard@collabora.com, jstultz@google.com,
 tjmercier@google.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260928195850.1982569-1-dave@stgolabs.net>
 <20261007120745.bvhqqa6cowqnt3jc@offworld>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20261007120745.bvhqqa6cowqnt3jc@offworld>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH4PR12MB590718:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0053df-54fe-4498-005b-08df34fc3448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|4143699003|5023799004|56012099006|261009223027099003|261022105027099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022075727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Lr3qCr3FT2Cb6OFmehfKG+E92mOPGJOO5GnroUr9rSGcbdw8lqoYMVs3C3x7IxuZkCGRqNgi4tF1bdI1T89oIPpTWCsbiy1kGWSydT/6rOUIjXBm6UD5oxbc6mMCdyYVbeR0B21lPOqmSX/4vnsxVgba7KA+Gbo7G0ShGYkg7Avk6JZcF9z1SXio3S+EyhLKljcdY1RFS4EEZpBCuWKDqNXG6rt16OGt2qYNJfJLgIcJ9Ntz1IIwSvRE5mwPuphn+jL8UQJW79cdv2Ww5Dgn2OfsAE+kFgjeqgiIUTaD1eFk0AqY2YlKnsyBhqFOBXrpYprGeRbuy96hSl0IZXGsRS6wyRe8KJcQASh6IBrnyXjaGh96Nn56SW+o1JVUmbSAvI6Uz8IkuzoK3wl06pBFKWkNCMmQg8jMtARB2kukyElhfLJdmd7qXCIK+TvaenstVu2L12vEhw+irU2q5yqkxyt2jPcbLYb9OXrpQfLNjRJxQFyFD49HwD6EtucXkeLywKbvQLjebPrnIuYC5fMVrBH+gFqeqNhGavOMrJJmUW7G2RGJDk2+Wp5KiBWzVw7BPbGulyfmn+N9g6lMfeXYcm/tL7VW01YPiEu7JoI79E//GlAZJ/VMosvkuPSdu43b
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(4143699003)(5023799004)(56012099006)(261009223027099003)(261022105027099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022075727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1BORDkwV1ZDMG9ld3hVSjEyNFQ1cGZhZzhCS1o2c2huOUZ1VGRseW52SGpJ?=
 =?utf-8?B?V3FJNUkrWEJlekk2Q2pJMXZyMmJLU0VQZk9tZVdxeC9VankvWXZ5TlYrQ0N3?=
 =?utf-8?B?dThJZmhGYm9jZk5WeHNvaytZbktJL3ZSa1VmbHRoMU5JNnRZMUZXMUQxR1BM?=
 =?utf-8?B?UkhqN3RJaWdVSjM3Z21rWmR6QzN3Q1VYMGdkVTNFcWFMN0VJYmlsOFBMaFRL?=
 =?utf-8?B?WVBJcTg2d0FDRmNqbHkrQjg0UTIrYkkzR1JvYlNFMGMycUhoaGl3bHg3NTFS?=
 =?utf-8?B?Y2p5enJ6dFpwQkxsNG0xbVpDMHNSYkdnRzJMbURpVS9NYWFnKytjNG1Lbndm?=
 =?utf-8?B?ako2VTU3UWF2MjBwNmJ0QlI4RmpKeU9nNm5nSy9ScTFpelVHSmFUdTZ1TGgy?=
 =?utf-8?B?dWFUYWExcHBVSS83ckQ3ZW92Y29BMUh3aXN3eHlOa2FhdUtDSXppTGw3ZUZL?=
 =?utf-8?B?K0lTWG80RDJtOFJZQ21uSHdGZUhRU2N1OGcvUlpEajhwR29WR25JcjJYZHJ6?=
 =?utf-8?B?L0h5S1ZRUnZtc3grRnZ1ZGVZZENDaHN6eWF3SmhDc0lhWlRNTFBULzZldEZs?=
 =?utf-8?B?VThrZ1VBZ3ZyUXFVQ1NWMmR4R0RxUWJ3THptWUhnOVhsOWJYb281dU5RVnVt?=
 =?utf-8?B?cU9pTlBDR0FUMjRCbng4cDJubm80Nmx6eUJmWVE2aHlzSXJxUTlabUVBakpM?=
 =?utf-8?B?QnV3OGt0SkdyRFlNeTFWaGtEeXVFUGpCTGRvVC91MGZuQkRlNDRsbjFpS3Np?=
 =?utf-8?B?bE5LdkVManp2SUYxMjQ3VGN5ZlRpelNPYzhkSmp2UzBzMkJ1bWZFMTYyYWR2?=
 =?utf-8?B?SEZBV1BheUF5a3lEVitPZnJXUVhDUEZOOWtaeHlxcjR5L3B6aUQ5Uiswdk1q?=
 =?utf-8?B?OUx2cUViZTRVNXFrbndENHIxQ0w1TkVvZ0Vmc0dyK2E5YW1hcGhjbFJLS2tG?=
 =?utf-8?B?OXFqK0JvdnIreVhzUnZzM3JHU0cybmNiZ054aG9ZYTM2VG1kQTJxakpad3N1?=
 =?utf-8?B?UE9lWXpDMWt6STBxaVcwdE43andVWGlabi9IMlhBT3ZUUjRkbVAydzNsbFlt?=
 =?utf-8?B?UEdJS3dCMFB1MExMUGlXYkhNQWZEVVl5aWRmSWc5RUg1WE9yeTkrZko0TzIy?=
 =?utf-8?B?dnZ1cU9ZQi9KYU9Jd0xJRzhTdlBkK1N4T28xZjJCSExpTkRrU0RLWUZ0R3ZO?=
 =?utf-8?B?dkJuL202L285ZTdhcHY2YytmTnFNamthaXpiMFp1VjZ5Y0h6Um1LblpRVFpI?=
 =?utf-8?B?U25obTNqSW5WdHFkVXVmbDlISlR0dm9mRDJvZ1BGUU9WTEdWUVd2UTJwaFIz?=
 =?utf-8?B?d2t1VUVKSmdWd1ZYQllMM0FUN3p1SHU3Y2ovNzdrMktFc2dIbi9vc0lIVVhB?=
 =?utf-8?B?VWw5NGFtc20xVXRZaldwdzRvVDNES3ZvSC9MVlBuTjE4b1hzYW5MV2NFSHZX?=
 =?utf-8?B?UlR4MEZDM0tHU0Y4WWdKbFF4QnFxeCtmMnlhUUZ1aWhTTnNZdGN5azJDOFpB?=
 =?utf-8?B?MVdkZTE3M1haVlVOaGNkN05PaUY5OHhPaGVIcVU0ZWhGdHJqM3NJQjNKblpY?=
 =?utf-8?B?TFFIUlRJcks4eVFBRkg0VFVJUlBnZW5vUXJUMjY3RTh6Nm9MZWZ1OVNYZlVO?=
 =?utf-8?B?OWR0YnV6ZjF4N3A4cjE5Q3hidTdVTlRuRzlNNmtsR0htOWxtekJVRVY1ZFZz?=
 =?utf-8?B?a1lHWkp0YW9lNDRidlViTG0vUzdCeXZnRG10dEpxekNrVjdXb3R1ZGU1QUpC?=
 =?utf-8?B?N0NZZklwUHdaSzF5VUVTczAwM1RNdTZ6dnREekxjbm9wQ1hxQkJZUmxGWWxO?=
 =?utf-8?B?UUNtbU1KM0c0OGtVSlM3K3FMdkI3UzV6Vk52bXgwd2x1d2dUV29iM0V5dUVk?=
 =?utf-8?B?YkRXeXptTW5aNWZSRFVFdlZVTE1keGJqQTgvbXc0aGRmU0NzN1VYcklxUGtk?=
 =?utf-8?B?eS9lYU9qNnJONzFDRkg4Z1phYm1CUnNyTW1pUldON0ttUVNDSG13MDJKdFZR?=
 =?utf-8?B?eVBBelhqK1hhYVhDay9nVHZtRElFMHZHV1BxL0tIVWxZc1ZmRlg3cWpmc3Ix?=
 =?utf-8?B?MVRXR1YrUTRoOC9ZTVN5WkZhcGZabDBVNEhlalR5OVVvcmh2VmpacVZNQnRM?=
 =?utf-8?B?cHkrNWxrRTJzU25BKzM5RmZqVEtWSWQrSFUxTnlGVkZLeHp5ZjBiaGhoaG85?=
 =?utf-8?B?Y3hLWGhhei9ZVHM3dkJGYjlzdU5wOXhJWlZjL1Z1MUgvZGlFN2VTWGdYSkpX?=
 =?utf-8?B?WE8rS013enozcnJBM1pGM2xJcHpJaGUyWVUyUUcveHhhMWdwY3R1eU5rLzFp?=
 =?utf-8?Q?IN8VybB3qGAPuoy8/2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0053df-54fe-4498-005b-08df34fc3448
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 14:03:13.3585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfgcBLij+YElZtsLDZtikNZ/MTbGCC46vJJb2TLWKhc654BXo96SfMmfv4MrA0fp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR12MB590718

I've just pushed patch #1 to drm-misc-fixes.

I'm still wondering if #2 is actually optimal. From what I've heard only 2MiB should be used and especially 64k doesn't make sense any more on modern HW.

Regards,
Christian.

On 10/7/26 14:07, Davidlohr Bueso wrote:
> ping? if nothing else patch 1 should be picked up.
> 
> Thanks,
> Davidlohr
> 
> On Mon, 28 Sep 2026, Davidlohr Bueso wrote:
> 
>> Hello,
>>
>> Changes from v1 (https://lore.kernel.org/all/20260914212258.2657788-1-dave@stgolabs.net/)
>>
>> - The bug fix is now patch 1, unchanged from v1, picked up tags.
>> - Removed patch that adjusts per base page size (arm).
>> - The 2MB order is x86 only, so Arm keeps what it has. Left other platforms
>>  as is as well to reduce the change impact. (Christian)
>> - The orders and the fragmentation trade-off are documented, both in the
>>  code and in the userspace heap documentation. (Christian)
>>
>> Thanks!
>>
>> Davidlohr Bueso (2):
>>  dma-buf: validate the attachment before asserting its reservation lock
>>  dma-buf: system_heap: allocate 2MB chunks on x86
>>
>> Documentation/userspace-api/dma-buf-heaps.rst |  4 ++++
>> drivers/dma-buf/dma-buf-mapping.c             |  4 ++--
>> drivers/dma-buf/heaps/system_heap.c           | 24 ++++++++++++++-----
>> 3 files changed, 24 insertions(+), 8 deletions(-)
>>
>> -- 
>> 2.39.5
>>

