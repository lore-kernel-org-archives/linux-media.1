Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11022130.outbound.protection.outlook.com [40.107.209.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4340627A92D;
	Mon,  3 Aug 2026 23:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785799894; cv=fail; b=PNGP+ugjSEymAtUy0FlQICPrRbBEDp9qCreA+Ynli2WrectNg/r5tfJ7DRkmJU7M5EomLa/iII9FbV8SppicyAuAvytt9/XaoZtg8t9xVJUOQVk1AquNiV28rDEvWHMRqEw3t2samCf1SBeC5W9byZyIXSwtPpJ/10R3TYrJuvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785799894; c=relaxed/simple;
	bh=E0ld4uBYvbwzcPfO5cighgE2H5rLEvG1TehfStZDY34=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O4U4C0UAJXgpOSdzv8FQxFIMsffW1Yw3tagJMvUjeq0JjwZ/4xv3uZZMnkC9OyCRf1woP6hwsNqZpGQaeDyaKMEnD8k/hsQHK4V+AiCZJPQoCiaTCraD5NTNWFkxPQKl98hnzJ7ZDoRVZXr2E6kEb+7oJ8l96FZ1mpXnwSEF0tE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=WWzs9jMo; arc=fail smtp.client-ip=40.107.209.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="WWzs9jMo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oG4xdjMeFVJv+/xePttj/TAiuL1xCljzFS4omdOA/29Sr5D3OPhZ43FSLtV34tce2eotePtfMFfy7YnsxWeBDDuDZbDWYfV1W3CFe27E1UHnbPUIvA0xwKKPS0V1eJsN4WRjHrbHqY5ILTFod6Yhud/Zf9RCoyAJpTcp7ZYwXHOkykW6keB0S8ueqEWZV2uq2dD7M08+wsDGosIH2ghvxc/beraBV5uhKY/7v5ZNirDDAc1FkREi4kL/otU5G4bm5qSXQ0l6wBXwxICWV2z6bUkiAoKcuqhWG8LHvPUo0kn9W3TLrZN/l3H69OtER0xU3EoQFwF+EfNjoZjzERlsYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cXqWSk8dqPHs0b52b6EmMH/d/T1PPtU8jj/3AAA/CU=;
 b=IYejpl7s8rnR/F7YfBuzph3ujX697p0a/82md8jlVg9h+W0JiKiupvaAvLcV5ndhOvPvEDrRaj8PSWlZWEDWpU8hE9qOA4rPaAGGoXiRf9LZVyk0lQct0ZBCY2ZBHlMmDaDFNXkZ0BIBDSHva9d3FwWuaUULKipactEXBD2iQnDNWsDZSoU//q9mCwR+7y32UeeHhOIMqNTtYlISQ58sxtqdo7ozShW4a/nVey4Uwz2qvUGH1gZ+qQUEDSLbRvzNhPkL56h29/DDaT70TisyHl5U8hOp6AtskXFd5ZufQ79wo3kypC78xo9D5jeFWnYtJqCdbKpsp2qs5uA9qExIAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cXqWSk8dqPHs0b52b6EmMH/d/T1PPtU8jj/3AAA/CU=;
 b=WWzs9jMotYWHivumcvHiq+Az/OdUNZGOeRdC8jwhVxqQNLLEnh69pEUv7sT2WTPLTQ3J8p0aXmmzYjepBKDga1oOWMRfX3abZlkh3PzF8GXeAJKZszX4mDQCtnxi5Mb8FCdkPpAklIoXGc6fpTaJTxwqTf5en6nv//aC0XoGbtMgyAcTd4XJxAYuDMTySc9XpAGbFSzv1950JMswc/64Xb+3EtwdOzM14Ok0dbAgyipTQAvvBLC2x51HOpPdSP+/n/fxoL+37K5JHw/Hkq9w+Zd3sFrMTAhwOK6pWsWK2GRjG8UT3jRH0xEPW840fUZvoNvXzOnj55A8lkGOW3x26w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by DM6PR18MB3570.namprd18.prod.outlook.com (2603:10b6:5:2ab::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 23:31:29 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::ba9:422:da8:b963]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::ba9:422:da8:b963%6]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 23:31:29 +0000
Message-ID: <b585130e-710a-434d-bf06-cc06f9bffc33@axiado.com>
Date: Tue, 4 Aug 2026 07:31:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: add axiado,ax3000-video
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Shubhangini G <shubhangini@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20260730-ax3000-display-driver-v1-0-4fbd4d0c85d3@axiado.com>
 <20260730-ax3000-display-driver-v1-1-4fbd4d0c85d3@axiado.com>
 <ed8ca066-bb8b-4476-be96-37a2b6e022ab@kernel.org>
 <a8383bd7-802b-41b0-897b-812b4a8fca33@axiado.com>
 <9f689436-04c6-48d6-8342-7fac998f3910@kernel.org>
Content-Language: en-US
From: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <9f689436-04c6-48d6-8342-7fac998f3910@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0023.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::7)
 To PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|DM6PR18MB3570:EE_
X-MS-Office365-Filtering-Correlation-Id: dd9acd85-d61b-4087-fbed-08def1b75845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|42112799006|23010399003|376014|1800799024|7416014|56012099006|10067099003|4143699003|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/Hica3yyzTtRFwllEkIZ7XFN+VRNp3pt/DTbM3OjcJ4bD1vIKhYnCWGM7fx8/OW7zRzREg3nH/CyTa9LNm7fYh65kCkKXpmuR4nDkAIfWHWG0M4rraMdbnyN8E3yidDUyi9Ib6gdv/Nlb4pVtgF8b/8yF9+gP+rPxi0Oz05xZt6+w9ZLFpbXws9/cpkjEDyei4ZdlyuSy5hLQ83aLg+iITeogpVD8V511yLU9US7/kon1YwmJJWBfYP8Yr252HbK/DddE3eJXM0CefZoeQhAxMFfRkm4/HaqERC1fLgYrj6pNMoRfmRo9++cAJuLCMFUjSOi7z6fZidrCB4En5QOFMO+YpZ4cY6YbeL7UCXNJKB0hhPFgHjxskrA+GtozeXAMGagruJnU9rMD9zK0cgRIrhpfUsVQHZpTj82drP1zLAdllin8o1aA9EklbGBGN3wm/JkeVIEpbeez9PLNBJcmnGSLpoPcaz+fzpIIJakFez5W5JBsuEw0MMXvIixXwVmbGY9M0ohrsgHvK1Me/XfR0Aoy4exTkyKX9hLjVdlwWvkX3KGUHyciouluL4Tlxxt2ctuksPterLoixEq9oE5nZFZ+7RF0yPfCMWqW/KVWUMcQGpL8IY0R+sEp7ba+2ol
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(23010399003)(376014)(1800799024)(7416014)(56012099006)(10067099003)(4143699003)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2o1NjN1eE82eE1sYUJZR1A2UWU0RzR4Z0R3SXdSR0V5cHFHVzVpZjJ2L1M0?=
 =?utf-8?B?Ym05aFF3dWtTVzBGR3BaYjNvV3FGa1lIbEw0V2Z6RE5TcFFVZkxnUmVBcmUz?=
 =?utf-8?B?aDhpMURqRE52dktBRE0vYWFOMnlub2FHOWRKNHo1TTFBUmxXTGVYb3paWHBn?=
 =?utf-8?B?aHl2SWtzS21Jd3I0TlBxbitBeFBiWWhXdEtlZUNLeHRpU1FLcmhWSy9LdS9M?=
 =?utf-8?B?NDFZYTFpUUpzbjErRUcvd3g2TUVQNmQ1eUFnRlQxWC8wTWZyRTFMRGdJVEE1?=
 =?utf-8?B?Y1BIVi85ckx0ajRTV2c5eTJxUlFQM3U2bGJsdExNOExCYkVMMFNzOWwwVVVQ?=
 =?utf-8?B?NlhHZFkxd0xVeWQvd0hsTDlFT3pXUTZjYjcxZXBzTzAvY0hGYjd2OEVRN0JX?=
 =?utf-8?B?SFdUMjFzNVhodTVLQXZIUUE0ck1RUHNkRkFPeFRMZ1c1OVo1ampPY1p1Q0sv?=
 =?utf-8?B?aFhkeUdVRndXeWlRS29oQnBhQWdlYnJBNFdza1lFcURKN0JBWmlCdCsyZ3RN?=
 =?utf-8?B?SDVSd1VGYXYvL3J3YlF4bWhTRXFJckYrZXJXdWh5MTNvYzE1SnVJKy9mMWMr?=
 =?utf-8?B?ZnNBZHFVTTIzekRNUVJRQ2VkaFVDam9SYVBwNWVoeGVkUm9JOTB6T1hwMEFT?=
 =?utf-8?B?bFRxdWdHSEJGaGROb3lzSUhvYUx3SEEzby8zTVVGNjhlcDR3NEZOZSszdHA3?=
 =?utf-8?B?US9ZVzVJWUQwcTNZeFZaZGlucEVhVFNiQ2U1VXprMStYY3FCMFc1cm1weXRK?=
 =?utf-8?B?cUVGYncwT21tcGMzOHJuTlUrdU55RzVoYUt3L1RIRUpzU3kvdXdBdHIrSFZx?=
 =?utf-8?B?Y3BNd2x4ejQyc2orbXhUWkFXWDFIV3B4ZWlhR09TRzJ3a0R1cHFqSU16YzdB?=
 =?utf-8?B?Z0p0YXg3OXBTTDJQeFMrNGMrS2N2QTkreDRZMTZKaGhOSEhNeGNJSVZSQzVB?=
 =?utf-8?B?SENwWlBKdjBPNjBpMmdIUTJHeVl5c1hTbXQ4dmNTUklBWDNEL1h3anAyWjAw?=
 =?utf-8?B?WkZ5NjRKMzNmZURaTFVpV3NqaURrYXFxUGgyM1R2dzh3cFQyZFdiOE5GcVAv?=
 =?utf-8?B?VTB1VlBxYWREbDZYRmp1M1pSMjdSSUdtTWJ4QTJ5R1c5TlBGUzk1SDdBc1Ax?=
 =?utf-8?B?RTI3WFVkakRQME1LT0k4SWRKUVZMcUE1QTdnN0YvaTNLZER5aEJIc2V3L0sr?=
 =?utf-8?B?UVkzWHpUSkpuYVRvQTJkVnFBWjJCcHh5M09Pb3VpdGxwYXBhZ1lBczN4blc1?=
 =?utf-8?B?M210Nnc5cG1YK1BoWUt3aitrT1dwR1c0aFdQR1RvNWNBbHBDTzZSMXVSUk1O?=
 =?utf-8?B?c0x6QkhlbjduVHFLcVl2amhtZFZHM2lQcUF3cWFUVDlwL0lISzRtZVVsRWpt?=
 =?utf-8?B?WVNRcEoxWjFLMkdkalg1S3NpeHA0ZFZNaEZzSVZUbmkzSU11S0hNNWdnd2hM?=
 =?utf-8?B?UEZ3VFM0S0ZZZitLY3phVzFHYVFWR3ZDRmZOV2pkUVlYYVFLZlNZeW5tSHRa?=
 =?utf-8?B?Q0NPem9vanduNTZtZnZRNklaS25MVVZYbHJ1ajE3QW8xYlR2WHpkZVg0V2JZ?=
 =?utf-8?B?bmYyVk1SQ0IvTGdoaHQwekNnTjFUR2E0Uk55NTJhNVVReE85eXVBdUNBQjFy?=
 =?utf-8?B?MWFWbytyNXEwYkRyQXZkNkpQRStQWGlQbWJQNGlqTDNTbkV3YzBxWjFWL242?=
 =?utf-8?B?YjdzMHNaa3VKWTg0UDBGSVhQYzA0cnlaeTY0TjJ2YTVFTTMvWDZTRVpxZGZy?=
 =?utf-8?B?dzZDVnZyYnpjY2VJR2pOYkZVZlU4Qk90Ykd2TitZa2srOEtodTFpOERhcjV1?=
 =?utf-8?B?NDd0QWZIbDBHalI3dWZpb2l2VzhQL0dmYmdsOFF5M0o3Rm5BZ2w5b3d1eTJp?=
 =?utf-8?B?Z0ExNUg2YnF6ZnFyTnZJQzhsZWFlOHdldmdMRGVlT0lKT2RIZmZ1TDB1NlJ3?=
 =?utf-8?B?cTJ3VXhHVWhPakZLZ3hXQUhkUU4rdlpaQUtPTWFiR2lJYlR5dnR6NGJNVEVv?=
 =?utf-8?B?ZllkY0dHaWVBMUhkK0hjT3k2VlhPVEZMMExpY0ordDk3Nyt0UzE4aHBpcjlo?=
 =?utf-8?B?NTNXYjdPd2NrOUE1b3JQRjZVbTdVVnoxaGNDQ0RQd3E4bWhaRUhkeGl5UzAz?=
 =?utf-8?B?RFE3VzBxbEsrVjI1QmQ4dW85Mi91TStHdG85MldUV2REamYvaGlpaGZkalhP?=
 =?utf-8?B?QnNYNE52b0V3ZTJkUGxjMHUwOGlqUTlUOWUxRk4wZ2dBS0tEbDR4WlJKM0Vn?=
 =?utf-8?B?RW9ZMno0VEQ1Smw5cWNFRGZJczhPL2ZvRXYvbGZ0V0JIU0tHblhiT1FUMHF5?=
 =?utf-8?Q?8fd1LzlBWjXvVoX8V3?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd9acd85-d61b-4087-fbed-08def1b75845
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 23:31:29.7251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQWNJLGLzsMHxr77ZjXpsU9x0ROBULsQ8FXj1nzLgnJT3DYtQ73PlP/EWzHmVPFj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3570

On 2026/8/3 2:28 PM, Krzysztof Kozlowski wrote:
> On 03/08/2026 07:29, Tzu-Hao Wei wrote:
>> On 7/30/2026 4:12 PM, Krzysztof Kozlowski wrote:
>>> On 30/07/2026 09:26, Tzu-Hao Wei wrote:
>>>> Add a Device Tree binding for the Axiado AX3000 and AX3005 video
>>>> capture path. There is no local register interface to describe: frames
>>>> arrive asynchronously into a reserved memory region written by the
>>>> host's display engine over PCIe, and this node only identifies that
>>>> region.
>>>>
>>>> memory-region accepts an optional second entry for a host-written
>>>> control mailbox, letting the driver detect the mode the host is
>>>> actually driving instead of only echoing back the configured capture
>>>> format.
>>>>
>>>> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
>>>> ---
>>>>   .../bindings/media/axiado,ax3000-video.yaml        | 44 ++++++++++++++++++++++
>>>>   MAINTAINERS                                        |  8 ++++
>>>>   2 files changed, 52 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml b/Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml
>>>> new file mode 100644
>>>> index 0000000000000000000000000000000000000000..c6d8d1843aac9f42869ff90a550b92d0bed7c16f
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml
>>>> @@ -0,0 +1,44 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/media/axiado,ax3000-video.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Axiado AX3000 Video Controller
>>>> +
>>>> +maintainers:
>>>> +  - Shubhangini G <shubhangini@axiado.com>
>>>> +  - Tzu-Hao Wei <twei@axiado.com>
>>>> +  - Prasad Bolisetty <pbolisetty@axiado.com>
>>>> +
>>>> +description:
>>>> +  Axiado AX3000 video capture controller. Reads frames written by the
>>>> +  display engine into a shared reserved memory region and exposes them
>>>> +  as a V4L2 capture device.
>>>
>>> This is really incomplete. You need at least way to power things on,
>>> reset them, provide clocks, sensors, data paths. Or at the very minimal:
>>> START capturing the frames after configuring the resolution.
>>>
>>> It seems you described driver or just a piece of entire video pipeline.
>>>
>>
>> Thanks for your feedback.
>>
>> The Axiado AX3000 and AX3005 SoCs expose a display capture path that
>> delivers frames into a shared reserved memory region and exposes them
>> as a standard V4L2 capture device via the videobuf2 framework.
>>
>> There is no local register interface for this driver to program: frame
>> delivery is controlled entirely by the host-side display engine and
>> the PCIe endpoint mapping that feeds the shared region, both external
>> to this driver. A software polling timer schedules a workqueue item at
>> the configured framerate, which copies frames from the WC-mapped
>> shared region into vmalloc-backed vb2 buffers. Running the copy in a
>> work item rather than directly in the timer callback keeps potentially
>> multi-megabyte memcpy and per-pixel conversion work out of softirq
>> context.
> 
> Then this is not a separate device. You just described a Linux driver.
> 
> I still wait for answers of my question above. You described getting
> buffers only.
> 

Thank you for the continued review.

To correctly represent this in device tree without describing a
software driver as a hardware device, would moving the schema into
/reserved-memory be the preferred approach for v2?

Specifically, we are considering moving it to:
Documentation/devicetree/bindings/reserved-memory/axiado,ax3000-video-mem.yaml

This would follow the same Devicetree architectural pattern as
qcom,rmtfs-mem:
Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml

Just as qcom,rmtfs-mem describes a reserved memory buffer used by
remote processors and exports /dev/rmtfs_mem%d without hardware MMIO
registers, clocks, or resets, axiado,ax3000-video describes the
reserved memory buffer used by the AX3000 display pipeline and exports
/dev/video0.

Does representing axiado,ax3000-video as a reserved-memory node look
like the appropriate way to model this in v2?

Best regards,
TH 

>>
>> To provide more context, this hardware path is designed for BMC iKVM
>> applications. The physical data flow is:
>> Host Display Engine -> PCIe -> BMC Shared Memory -> v4l2 (video0).
> 
> Great, not a device. Linux driver.
> 
>>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>> +      - const: axiado,ax3000-video
>>>> +      - items:
>>>> +          - const: axiado,ax3005-video
>>>> +          - const: axiado,ax3000-video
>>>> +
>>>> +  memory-region:
>>>> +    minItems: 1
>>>> +    items:
>>>> +      - description: video frame buffer, shared with the display engine
>>>> +      - description: optional control mailbox, shared with the host
>>>
>>> Why is it optional?
>>>
>>
>> The second memory region is optional because it is not available on all
>> supported hardware configurations or use cases.
>>
>> For instance, another supported use case has the following data flow:
>> vtconsole -> framebuffer -> Shared Memory -> v4l2 (video0).
> 
> Use case is irrelevant to actual hardware.
> 
> 
> Best regards,
> Krzysztof

