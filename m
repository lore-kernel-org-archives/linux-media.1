Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022118.outbound.protection.outlook.com [52.101.43.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C75F3DEFFE;
	Thu,  6 Aug 2026 08:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004449; cv=fail; b=Pj0lLwnOzqQ8WfFuwanrGno6sYwl1UGXt5NHfPKgUp1CwXoqFU7ij/vkdCQEeDlQT8wMGGCWOvAgbGQ705xO4oMQAsCSOXyl0btU5z3sY9DBa2Fk/tIxg7di2BawHEMd1kO06P614uaqjHR3WxN9l+XZukKEfVE0RL2s+L02f/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004449; c=relaxed/simple;
	bh=OQrY4fO2e8NS+EU4rVZiO1ZAlhq/MRhjjIwDqfQ2sXE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VtF03Hl4o/WW7ppaXVuVbabj6QvISd8fpOSjhbl5njuieYfxvYGncOZJHaerMmoJSRC342Hm50E+a44xl09LTRC09AXkhGiXO2ZroXYnBlDuR/TzKM0bmYixEyTfYYekCgGElF67D3RN32rwquvYLojX4Kf1cNxA/GGz5K/U/tk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=hnrrARuU; arc=fail smtp.client-ip=52.101.43.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="hnrrARuU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ds4f0nZYx1wvZeEy9aLT2ojgb/NAW+CJ6L1gey3LN+MTo/8xXf9IqxPZW2wY963Ke01y5SCKj6HQ2RLLHAloJ55+6+xsNpKt0uqCE5oX6SbTuwvMEjE+/9Q5zNOCqpLnioevvXkbybWIzDzNsB/5B9tkm7TMZVLHgIPRQcStAR0heF9KnkiMRQNVgfxxxDgHZAKtZbMwOhDZ53S/cpjW9XVp+D7inUfdGUJifzwcwc1Hrotsv3DREd4t4zBz0Nuu1qRCBX+Ez5DPCGgFw+difBsLFoI/8HnOIcRC6PO3qdplCceRgMPauScGEeY9baklXMHBzim+miQd5E69bfxsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzxlFfjKSR7L23FWsQpcKHzSKBrXOTR2zTIs2ca9OCo=;
 b=MTvTjdPgGtlHpgXFXVElQnjJwQvh2NdQKAcPQDOOTsqb1cEjpujEKs4TlavDjpYYyDGQGpdhZmX2YLdXcDsQazdhYC+DyLbTpnPnfGLDdVMGcV8Q9xabqMRntPTqqqy/0JRdYbTErjstuimCyLtjHwpT4ydeKkN1eJU4FTtKUKxQPUY0Tao5NWDODieFFRcvPG3QAwJdF+mhn7dqYi8OLqGEMjYeBzzv0q94vIv3qq8f8UiHF7UNF5Y1i4cl4r7LpHWzwKOAjmV23UOlnXpIcTc0Hkqbw4BahPkVGmSvH0g++Xv2azF8laKahwPM6kri4/s37ieY/dZN0ReDuiFAzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzxlFfjKSR7L23FWsQpcKHzSKBrXOTR2zTIs2ca9OCo=;
 b=hnrrARuUAYDBLVT7xiyB7ekoOG6tYFHHkfvVcQuUOdGwcLSj+Wg7Pr90dTcIEP1ArA03RI9cFRGlN8P6/wRm47Oer9VHfWC7HEZOa1MEgLWpVyCX7uIlfCozCWm988ZYcSCmVsyDQaz7AoyuzfA0JUvBNPZrRRqag27Rq7mJFEUTqTn5sMbQ2hlWodgOj9uYJOkW6CbfaE6wGK+HHHpc/e7op5XezkOPwxA1NG8nr28d3qtKcmg+qqLoBxeYIwUOAYVRLT4Fd5cmuA7lcUoJzqJHvkViORDe+cdUq1Blby3BC+VnndgFG60PqZECrdA6vPH12D9RG+/kPntIINI01w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by CH3PR18MB6025.namprd18.prod.outlook.com (2603:10b6:610:1d7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 08:20:44 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::ba9:422:da8:b963]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::ba9:422:da8:b963%6]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 08:20:44 +0000
Message-ID: <5d2a80ed-6c74-4ad7-8d18-c05e38bd8208@axiado.com>
Date: Thu, 6 Aug 2026 16:20:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: add axiado,ax3000-video
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shubhangini G <shubhangini@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Karthikeyan Mitran <kmitran@axiado.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20260730-ax3000-display-driver-v1-0-4fbd4d0c85d3@axiado.com>
 <20260730-ax3000-display-driver-v1-1-4fbd4d0c85d3@axiado.com>
 <ed8ca066-bb8b-4476-be96-37a2b6e022ab@kernel.org>
 <a8383bd7-802b-41b0-897b-812b4a8fca33@axiado.com>
 <9f689436-04c6-48d6-8342-7fac998f3910@kernel.org>
 <b585130e-710a-434d-bf06-cc06f9bffc33@axiado.com>
 <20260804-healthy-versatile-barnacle-b58db9@quoll>
Content-Language: en-US
From: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <20260804-healthy-versatile-barnacle-b58db9@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0032.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::13) To PH0PR18MB4558.namprd18.prod.outlook.com
 (2603:10b6:510:ac::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|CH3PR18MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: 276d6b76-aead-43c7-a421-08def3939c72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|42112799006|366016|1800799024|10067099003|56012099006|5023799004|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	sgV06jKVzmDZjoWkthjWrp7XMyO7ybfTMivjgcFW9nY17vPGGXHHY49vNQzN5xlIrRr4j31nJ6NEwPmwPpfd6KkQ6SY9T7c5eZ7OGCxjN6ez9ZDjLtakpR2ak2NMJDRlC6noZqFaOnR+40WUYIgu2oc8ckl8jPIP9M3Jezah92S2QPrFwwv8EO1GddcJJSN8PKyQ5twGjuwF93BqnNamXW9XbnQI2HXeeYWdWa64p3vElTxRDm4sCXDKi77GQau3YnRKvngWMk3GbFBiQKSejYU/IYj/kT3TlazvAsPty0F41u8M3+mLLBeo3kC//x/nikW42r3Lfcees/S5XUGDw9i5ZoDN4z6LDBlrP2uykZgtuZsVmOt5ZwXrmwiz7hThPBwSAcrVYhjY08iVkdnF85k7CxQPinQagSqye0reTEHV8vhQw+DDOSmuGPmZxEFT8p7UFZLLjHq5kX8/eGkntBetGtHIiAMty7V752TWlyL0rswiSMZp1G8i34bStcJR9eDb5zySOEt4k/sMIfGuw5p74+GvHm10rRBFu+ew6U2J/UcdPDE9D8fdrKIZQ1HC4qkafhHD15NxI1shcLLSnvQj2QMiMEX4YXRPA2HR8CAglA7ahN3VrKQaogZMBHmCGIpI6mqzmKnK3u2zmJZsm57Ay/20v+F4swPn/zeAg3A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(42112799006)(366016)(1800799024)(10067099003)(56012099006)(5023799004)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnlvSzNUYW5manJwMGpFUjN4RHZCaU9CLzV0OXRudWl4MUR2N01ROHM3R2Zh?=
 =?utf-8?B?bCtYM2traVZteG9qbDRhV1QvMUltaXJOUWcyOGNYYUFaVmRndUQ0L0lJMUp2?=
 =?utf-8?B?cTh1YmRBT0xydWtiNEwxRFJ1TzU4Sm5EaGZqK21SVGRrMnNjQ0NCdktRSUhi?=
 =?utf-8?B?L1lRZGUyMllxMDd6N3dkSTNxSkJadUVTTXBSajJSQU5PK01kZDJaSVVpbzNQ?=
 =?utf-8?B?VVNKVEVPUEhyWXJDcE4vRWZpWnRyNHdOUXFKcjFnTlVLQ0VucWRXMEluRE14?=
 =?utf-8?B?dENoZHBWaWpzbEdVdWhzcXcvS1hETGpLUDZ5MFJmOFBhb2o5SFdpY2Rqa3dQ?=
 =?utf-8?B?QUFxOW1yTzVqa3cycTRreUw4RkNHSUZvaGxSbWhsYXpGcUlNK0RxUE5rL2xv?=
 =?utf-8?B?RGp2TVk5TGJUNC9aNFRwOXdBSmMvaE8yRjM3MFdvWnVzRlNTbnVmRU9SM0Y0?=
 =?utf-8?B?V2JKN0tMZkwvM1l4M2JadEpCcGJoMmFBSGQ1RDRpMWlXY2psb0xPS3JFK0RM?=
 =?utf-8?B?a0lzdm5pbFo4VytuZHlvYVBxZnBMU2lFWDZBTTUvcnRsbGwzaVQyQmVUVmFy?=
 =?utf-8?B?WlpnNmlhZjEwUlBqYXZHaXlDMzZ3UWJoWFpidjJJTGF4MkJWWDRtWm9pKzMw?=
 =?utf-8?B?aVFMREs0aFc5KzBiSVNaeHU1aWwzclJtT2NlNVZsYXhtU0ZJVTRENlRxbUN0?=
 =?utf-8?B?a21TUVZpMTltUkNYcDhEUnQ1SjRqYW9oK2c0U0JkWVhJY0dNU1NLY2k0UU5v?=
 =?utf-8?B?K3lYMlhXY09YaWdDVnJFaFphL0VUM211YU5vVUZ1Y0F1RVpNMnZZckhtRU9o?=
 =?utf-8?B?S245QVNQViszTHozVStCVExRcTdqWHpET2w2dGwzMS9ab0JyUE00YmNJa3R0?=
 =?utf-8?B?YnVtcGtocTFlNW9hZjJwNUdMTk5yMzFHMWJMbE15WmRoOHdhM1ZaZ0tqS3lU?=
 =?utf-8?B?SndteWZwbWJKdlNKbkU3dzZkSUxOT254dzkyRjJodVZhSHV2K1JhTHJOK1dr?=
 =?utf-8?B?dGwzcG5TSGdDRGh0WXBUdUQyVmFRRW5udXpadndZVmFobFdrNmVXSUFqNFE5?=
 =?utf-8?B?Rm54OWw4aCtVejVHVmwxWlEwTjFHVW1xZzY5V25RNzRYd2F5YVR3VnNoUmRm?=
 =?utf-8?B?cjZOcE1rRG9sbUpMS0t3V2UzY29lOUJYdkRPV0xtMUVxZThoZHpMNzZTRnB6?=
 =?utf-8?B?Vlp2ZmJHNGNTZXppVGI3VG9KbHdRZE9TYWNkYWxGMyszYmdmV1V5dG1zbkFu?=
 =?utf-8?B?Zk1XZ0tOb3l1bWE0RUQ4d1UvUmxDSmZsUis0M1A0SFFqZWVtaE8rcDE1TzYw?=
 =?utf-8?B?b29sZTFOVHBZSURUYUdvazRuV29VYUxJMTVSN3Z4Q1pWdGhvR3JyaW5lZ3RT?=
 =?utf-8?B?elEzSWVOb0pJeUtmb3pZUU9RQnhJclhnS1M3REQ0MTdjR3p4MXBTSVQ0YkhR?=
 =?utf-8?B?Vm5zS1NjYjZmTDVlWk9PZU9VRTRtR2xpbVVCYUxNRTdsSFNMQVZDWUdGRnFG?=
 =?utf-8?B?NS92VmFpWTVGcU9zQ0p6RjdDYXVlUXJTU0dhUTFNTFhVOFFyenJ3dHExTXUx?=
 =?utf-8?B?MUZrQnZrTGpjM0JzSWJpVmxOdUJJRldtSkh3cFFmZC95QU1JZm9PUmhsMU9D?=
 =?utf-8?B?ZkJOWE1ENFQvZmw2ak1hSFpZUGNxUFd1ZG91SVVHY3Z0ZWJsQ0pteDZmY2VP?=
 =?utf-8?B?K2U2cVp3RzVlTUYxZmQ1QlY2REJvNks0RnZUUTU4akxObE9JM3RMTkhxZGFY?=
 =?utf-8?B?bFZjLzVhYjNDMTdtZVloc0IvMWNFUkdaSEdqZmh1dFdYWUFUN2VOQTRkOWxq?=
 =?utf-8?B?Um5yOVo1dzBlLzVWTzM4Z2l4VWJGL2c1TWFBNGJIYUF0UWN4aWJCSVgyYlVS?=
 =?utf-8?B?bXk3YUNjamhuUC9tVElPMGVwY2k0Sk96VWpwYUN6Ky9QbUlmMVBuU2dldjZE?=
 =?utf-8?B?SURvNHYxSk5maHpoRGpaSEN2MWFCQmNVeUNlNk5VcE96VjJ6cndkZGE2VFh2?=
 =?utf-8?B?aWZnQ1Zqd09XakVMRFFzQUhCRzY0bU9HZHlSWEdDZDFra3kvWW9rNThSa0Rz?=
 =?utf-8?B?YUdUbTFOZzU5c0RuRm5CQ1ZvOXhQMXpkbytHTWJVSWNiNUVzMk5GREQ2bDc2?=
 =?utf-8?B?dEhUUWRLUDRoazVJNkt0NXV5eWlYMGZIc1hQSUN4UHJWcWl3bXY4aVRmc1ZO?=
 =?utf-8?B?RWJVcGpsbVdmRWZwYzVWOWhuVU9tZ0dUV21TTWx1MnBaMEl5VE9ibHdZRHdp?=
 =?utf-8?B?cHZCZWJuL2xPUEZHWEtNV0pRekdvbTZKcnFHZERrOUQ0UHVIUEtDMDRuWUNU?=
 =?utf-8?B?SWJ3eFVMSHErRUV6ZnNaakJDc0EzYVRzM0Fjdng2QzY5cGFSeHJHdz09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 276d6b76-aead-43c7-a421-08def3939c72
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 08:20:44.6819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/MVqbMsyDWAabA46PPD8mJVxZRy/tPh8GnWylzPeo1mXaKmhTLTueRlsy+5w0np
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR18MB6025

On 8/4/2026 3:55 PM, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On Tue, Aug 04, 2026 at 07:31:25AM +0800, Tzu-Hao Wei wrote:
>>>> There is no local register interface for this driver to program: frame
>>>> delivery is controlled entirely by the host-side display engine and
>>>> the PCIe endpoint mapping that feeds the shared region, both external
>>>> to this driver. A software polling timer schedules a workqueue item at
>>>> the configured framerate, which copies frames from the WC-mapped
>>>> shared region into vmalloc-backed vb2 buffers. Running the copy in a
>>>> work item rather than directly in the timer callback keeps potentially
>>>> multi-megabyte memcpy and per-pixel conversion work out of softirq
>>>> context.
>>>
>>> Then this is not a separate device. You just described a Linux driver.
>>>
>>> I still wait for answers of my question above. You described getting
>>> buffers only.
>>>
>>
>> Thank you for the continued review.
>>
>> To correctly represent this in device tree without describing a
>> software driver as a hardware device, would moving the schema into
>> /reserved-memory be the preferred approach for v2?
>>
>> Specifically, we are considering moving it to:
>> Documentation/devicetree/bindings/reserved-memory/axiado,ax3000-video-mem.yaml
> 
> I would rather suggest this should be part of the device handling the
> host side of the device. Or is there none?
> 
> Again, how do you configure the frame parameters or start capturing the
> data?
> 

Thank you for the review.

Regarding frame parameters and capture:
1. Frame parameters: The remote host writes the active resolution and
    format into the control mailbox (the second memory region).
2. Starting capture: There is no hardware "start" register. The remote
    host continuously writes frames into the VRAM asynchronously. Our
    driver simply starts reading from the VRAM in software when requested.

We did consider making this a child node of the PCIe Endpoint. However,
that does not fit our architecture because this memory acts as a shared
VRAM across multiple subsystems.

Currently, we are preparing two other drivers for upstream: PCIe EP and
DRM/HDMI. In our primary use case, a remote host writes frames via PCIe
directly into this VRAM. Our DRM driver concurrently reads this same
VRAM to drive a physical monitor, while this V4L2 driver captures the
frames for userspace (e.g., obmc-ikvm).

Because this memory is shared simultaneously by PCIe hardware,
the DRM, and V4L2, no single software driver can simply allocate it
dynamically. So, I think it should be defined at the system level as a
shared reserved-memory region.

Given this hardware topology, do you have a recommended devicetree
pattern for representing this shared VRAM? We are open to your
suggestions on the best way to model this upstream.

Best regards,
TH

>>
>> This would follow the same Devicetree architectural pattern as
>> qcom,rmtfs-mem:
>> Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
>>
>> Just as qcom,rmtfs-mem describes a reserved memory buffer used by
>> remote processors and exports /dev/rmtfs_mem%d without hardware MMIO
>> registers, clocks, or resets, axiado,ax3000-video describes the
>> reserved memory buffer used by the AX3000 display pipeline and exports
>> /dev/video0.
>>
>> Does representing axiado,ax3000-video as a reserved-memory node look
>> like the appropriate way to model this in v2?
> 
> So from a device we went now to pure memory... That's quite a change and
> would prove this was completely bogus hardware description.
> 
> I actually fail to see any hardware here, because you could just
> allocate whatever memory and pass it to your host, no? Why it has to be
> a reserved memory?
> 
> Best regards,
> Krzysztof
> 

