Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11022081.outbound.protection.outlook.com [40.107.209.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4072F7F1B;
	Mon,  3 Aug 2026 05:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734985; cv=fail; b=oIve0Gd8L9KvW4aDHz1GLjdQYKE8x5uTGjclLzYbUXOkXUHccsKOBzF/ZCAQp4E/ReQbQF7tc3lavZHIsfqyMvEsxvmYMq1sdy+W0gMWuGXzylRdOhpGNJ0E9x17wUNa7rw9KtEEhNMy1ccajbMkjSdz+wqPp/0AFF8yJADbjVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734985; c=relaxed/simple;
	bh=2+jqUXV5e+t2ZJzS0Duh7s5CEIk8wnpQED/Oc8rspMg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZdRsET00jeCxMkirJWTzxSfgDptR0gaoC87c4lw8X92I6PSYbr+dm5A6ri+ONc1dG8Z+23YKGq8OySORid1NZJdjJYEih0HISD6dCYpJDbZl+q0Qctf+CevOZmQqyp2a+oFkUqEW6JuXkU21/udwgI9W80TAXi52VJFi3oc0zus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=O5IgL2M2; arc=fail smtp.client-ip=40.107.209.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="O5IgL2M2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oK1qj0XQxOiWuHollQ0KuBWSbHZ7sMKic0ssPamw2DhcVmZJ12F+1h3T+xrQAZBqLRGaOb5wJfiowxgV6+LnvaJgyUlg9b/rkkFTf5Q30juzd7lZXNO+vbMjbKTeqfXcgURjj+4Z18p4Pj4LxTyLXqGV6uMHUGrtgu9kCA1pzQIGU9lT4vd4EwhjnAykgr1NO3RnbmlxI/zZ6yaVJnitPRpnJ7Xjzj6SKHiVp9o39BckPA/6/mOzUDTaFwOx6mQZVxVEf+wrFmUoBKAmwpK/nPD6Or/5lQc/OT1KQ4e6Gdc2HPwVY2fqGjJqmMnpLQB56XDXT4GWI5WLz4E9nWAb2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgwUny/O53z2MDiekhBL2KoC65jPpvHmSOD5LlJh77w=;
 b=POQ3sz7RO83k5y0KttJzOKUr8DwF6EL5/Z3dSrJ4+7rad2dV4zmjP9jWdLnrHRXKYmHXCLNORCjEjwbGa5odn13YE2bV75ivhsiuKw8onPE0pz3bvvvnzWSazd84ceacVfdX9B3gFxtFph+4kOQmZRCGjav5IFWE5UKfjXzniigm+BRCG8pv9Ea7v1U9gryYO+nXK9Roq/zRVSC6/aZKRPep0qXpnyqFopMNUZgAa/IG6/Zf9u+miteOd0TLGdNjMtMLHqxaE0B+3WwuZu4ZnV6iT9A9b52JC8iHmBmGur1F0c1OzYzj+4PNatZWj7HcoFU6tmcVGUnjNaz7PobGyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgwUny/O53z2MDiekhBL2KoC65jPpvHmSOD5LlJh77w=;
 b=O5IgL2M2tELmtuFbeFOr5w5OUhKf2XCUSAcid3qQ7R+yFJTavHIarlglkXjgL1ZSRR3PNVxc95Zzn3n51rjjPC08JUeaT0Qn42CLqSx8T38R/Lng/wNZWeG5Rf9rFKD5e6aWKr9zUcAZZ7IBNAHKQOh5VtMWE5H3qvB/0+EY4TJQ90E68JBLlwKrFh1iS54fqruV3QbYKjpUw31pJFmhx6Tsy7bECokc4N9m+6EnT5G8C39WyWAUKrDSloXbE/lqQqe5O7158fUCl0ch8yUX+2zuxOOnB1wBFbsRzxQtfUjp7q8ALgn3mmOHghsBW8w0JJstVqh1kmif2uJu1Gq+mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by MN6PR18MB5466.namprd18.prod.outlook.com (2603:10b6:208:470::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 05:29:41 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::ba9:422:da8:b963]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::ba9:422:da8:b963%6]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 05:29:40 +0000
Message-ID: <a8383bd7-802b-41b0-897b-812b4a8fca33@axiado.com>
Date: Mon, 3 Aug 2026 13:29:35 +0800
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
Content-Language: en-US
From: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <ed8ca066-bb8b-4476-be96-37a2b6e022ab@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0050.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::6)
 To PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|MN6PR18MB5466:EE_
X-MS-Office365-Filtering-Correlation-Id: a30a7b70-05ea-4070-a6e1-08def1203786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|42112799006|1800799024|4143699003|56012099006|3023799007|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1T1lS4FBgSU311u1ERevDCtLnrSK5aGOdOazoEAm38S2oBwxnIoQNAvE6+mE5/tpKNGo2CBvqFI0d9FIvjm4dWDMbvRg+jaGe7+GkYgZyndpvDhIxaDT/1Q5bANF+AR91OP9qOMR0JjF7Al1S6/nzrS0VjzwEw8QE+Cp4QK+8TOJRd2Xh+ZDX7bLilaKAtDbxezLHzoiJp1o1yNKQrwkgaoywZ2sS7n7TfEpGmBPTGCnYBsN/jLMgFWXZuJJ3LW2sTnmmamvuOwDWemP3FWmqCOWc0WS1k64+uI2JNK+elsIN9ebm0BGBwNQwwB0mnhCMKDxHJrvo8QAVmbCNx8B7jViwWAbFZhcys6mvSa4WPfDfzhmRyukM9yuf3WUlrPB51CrwjxmEbN5ZLCEqZ/5dNcHvs5Hy5gGgEBDqUm7OEwSGLp4ULq6Q3v5zO2TZx0bg2ug/J40WH4QiqyHE2lwquY5wQo21GHptPn04fcq9fonw8EqM/H8WGqN3XGW2sSKad7x6STIJCS3j1mcdCDh+OD0qqeVDa0s/BHgNUOZuGbCzXj3yLyUBEmiRon16+/M8dgzJdiOwuMzVofyxBweQyBE264CM4p6ZsvzSQw6AlL74WHSh4C2WOKfRagUhvuo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(42112799006)(1800799024)(4143699003)(56012099006)(3023799007)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHdGM0dvaHVFR2JkTEk3ZHBidmdvWWRhaXUvR3VaazB0Vk92SE9XYkRFOUx0?=
 =?utf-8?B?WFkxeEw1bDYzVWdzcklUNTdzT2lFQjB3VEFUNndUeXdWYUw5RWY2a1V1YW43?=
 =?utf-8?B?TXlNNjROMUJCZ3FWTzZJZEVZVjVMUUF2WWgyM1dIQis5V0NhZERjNDE3TU1D?=
 =?utf-8?B?SDkyOGp1akl5QnJkZWJ3blc1RUJ2R3Z2Y3V3dm9uOTJSUndLUkNpdDRhRUE2?=
 =?utf-8?B?Z2wvbnJ1TG5Ea3dja2V0cXFXb1BJY0lRRTQweTNCZ0hTTWg5bEYrQTkzYUt2?=
 =?utf-8?B?OUhqU0F4cjYvRGJINHlTVURqNlh6aTFiSUtjVUxCSG9jUklPazVORmRpcHhq?=
 =?utf-8?B?MnJ3WGlLVEd6YjVBMmcxbGR4bWJZNkFuaGdqSGZxMmVpQ2Fvc2NiUnAvekZV?=
 =?utf-8?B?UEQvcE14Q2VrLzg1S2Q0bzc5UVk0bTdyWU9lQTlQMGhIdEdmQTNhWExYZkVz?=
 =?utf-8?B?SVFDcEZOQWlqS21OcUx2WmlodlY1TnNyQ0N6dnZRZ1kxTWo5UUdRRHErTFF6?=
 =?utf-8?B?anpjZThzOFRCU1I3ak8zamtPYlZyeGpVVGx1VkF0UjdPZHFvYVV3S0w4NDQ5?=
 =?utf-8?B?Y2Q0SUlIeGpwS1l6Nm5LZWdtV2dvUVdJSUp4SVBwSnFJYmY3QmFKRUNoZlpV?=
 =?utf-8?B?bHJ6UHVwNUdmY1A3SllrbzFzTmYwcytyamY5ekh1dEhBUnFEWTlpWWpCMi90?=
 =?utf-8?B?M3VKaUdkNERDdlkxY0IxeUFlaDZEb1ZhN0xGVWowNHRzUDR1bjkvNmpha2N3?=
 =?utf-8?B?bFgwVHdaUXhaQ3hibkNMWmQvSjZQUEJaeFNzOHN3aE5jOVJ2SnFjNkJZUGtH?=
 =?utf-8?B?NWpRSUJLb2lxcUtKbE82UW4rcC9RS3l1emVjb1FOT1RWb0wrOTYwblpUbWk2?=
 =?utf-8?B?cXVkSmh6NWc2YlVrcUUzWldBZDNmTm45WEhZbUZqVWxEMUZKd0VVcWh4TC83?=
 =?utf-8?B?NVJRRjRmYWZBVnFwcStkS1RWY1I0QWl5Tjh0cllQbjdJY2ptdi9wWktVamhl?=
 =?utf-8?B?ZWdIZE9UNzRZb2dDRFA2QndUd3NjdG9QTy96Z3YxVlZUVUpIR2VVNmxQbXJk?=
 =?utf-8?B?L3JPQkVqZnR4NVNZV0dKZlhJSzlORXJEenIzN04wbHpPQUxsN0lQMWppU25B?=
 =?utf-8?B?ZEVUbWtIaWZrb1RTUzJZQ3hvNCtpNjVVcXZxRVNHYlVEVmZIMEVnMk5MUFFs?=
 =?utf-8?B?U3lYMWlpcC9qbUFLbERYajZEbXBUL0UxbHFkb2NtaXI2RlV0OWVRTURvd3Zx?=
 =?utf-8?B?TXkvZUUrWlQzQUJndlJKM1dkMzBGTE4rVHZobGhaUlF5b0k2bjZKN1BKMlFw?=
 =?utf-8?B?TDh1SjBYakcwUGZTMGtIQUJ1eDAzcnRsSW56YmVsWjhCRU1MRUR2aE14YTlR?=
 =?utf-8?B?dkNSQU1PSlp0MWtFTmdlUkZ1N3JkYjlEK1VRZEdVQWxSb1owdUxrelQvZEJj?=
 =?utf-8?B?bVRXcnVYWm0zYWVvQXU2akpJbWFmalZabW1PcjA4TnROTWwzZnhXMFJXczQ4?=
 =?utf-8?B?L2EwT29ZZWo3VklzbDQ2b2l2MFBuYVJSM1I5dDE2b1B2eVpWUkJWb3ZzMHM2?=
 =?utf-8?B?aFF0b1pwdURpSWNhbEIvZnVNcmlCdWxoa2tCa0NGWVF6YmdJeTVRbHNkYmJP?=
 =?utf-8?B?Q3RIcWU1aDcyUXp6dkkwL0ZPdW52Ly9ySDN2dTJUSnJWbjJvR0IybUFqVmp0?=
 =?utf-8?B?SW14SXo1VU5ULzNzYWNUUXVoRlRuUHdzMk8rVDJYUVIraXZVSEVaNEJRYytM?=
 =?utf-8?B?UFRLOXMySExiNmNDbXhzY0haSkljb0VWK1cxSldJWmRQdDVhMGVaRFBTU2Vn?=
 =?utf-8?B?bUdOSEFkeEJCelk2MHVXWXk3RXJIbUhTQ2FmU2NTRFhLWVVrK2gxMzk2TUtY?=
 =?utf-8?B?c0pFaWVsQzZtb2QxclhQTVRaMUltNk14Y3VieExpZG9yR3piOTZvbjZQYnUy?=
 =?utf-8?B?VGZibFhzUnNyUTE4OUMzVVJDY2w4cEdHZnVNQU5ZRkkrUWVVUUgvekdxdzdh?=
 =?utf-8?B?dzdZMDJycTlwYmJMNGI3NW83MklKNTBCSE1VejdPa0xRb3FtUjhiZEw1ejRr?=
 =?utf-8?B?Mml1cXVteVM3TWhhTVRwVUZsWTlXaGY1eWhYZlVlWXpWVGEzSXNVWEZJYkx5?=
 =?utf-8?B?V1g2akdsbmp1clhIbStmWnc5a2RzYUdBTDdoZ0Y5RktNZXBhRytCWXZmK2ZT?=
 =?utf-8?B?S3BHUUVHRVk0ZHJRQXdCLzBjZTNNWTJjY3dqemV1dFVKMnd0dVo4Zk5xZ2hP?=
 =?utf-8?B?Q2taZjFzYmx1QnAzMjVJU3VOVCtQZU44cEVDMzFpQldjWUQ5THVIV2JZc0dh?=
 =?utf-8?Q?DVbn15V0khp7xb3v4M?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30a7b70-05ea-4070-a6e1-08def1203786
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 05:29:40.7453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2eLE1IrFMrCwvMmAGGV5Oa6gQDXXWbuiFAX+JBfyy416ev6OCompb8zqfWcV5FQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR18MB5466

On 7/30/2026 4:12 PM, Krzysztof Kozlowski wrote:
> On 30/07/2026 09:26, Tzu-Hao Wei wrote:
>> Add a Device Tree binding for the Axiado AX3000 and AX3005 video
>> capture path. There is no local register interface to describe: frames
>> arrive asynchronously into a reserved memory region written by the
>> host's display engine over PCIe, and this node only identifies that
>> region.
>>
>> memory-region accepts an optional second entry for a host-written
>> control mailbox, letting the driver detect the mode the host is
>> actually driving instead of only echoing back the configured capture
>> format.
>>
>> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
>> ---
>>   .../bindings/media/axiado,ax3000-video.yaml        | 44 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  8 ++++
>>   2 files changed, 52 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml b/Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..c6d8d1843aac9f42869ff90a550b92d0bed7c16f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml
>> @@ -0,0 +1,44 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/axiado,ax3000-video.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Axiado AX3000 Video Controller
>> +
>> +maintainers:
>> +  - Shubhangini G <shubhangini@axiado.com>
>> +  - Tzu-Hao Wei <twei@axiado.com>
>> +  - Prasad Bolisetty <pbolisetty@axiado.com>
>> +
>> +description:
>> +  Axiado AX3000 video capture controller. Reads frames written by the
>> +  display engine into a shared reserved memory region and exposes them
>> +  as a V4L2 capture device.
> 
> This is really incomplete. You need at least way to power things on,
> reset them, provide clocks, sensors, data paths. Or at the very minimal:
> START capturing the frames after configuring the resolution.
> 
> It seems you described driver or just a piece of entire video pipeline.
> 

Thanks for your feedback.

The Axiado AX3000 and AX3005 SoCs expose a display capture path that
delivers frames into a shared reserved memory region and exposes them
as a standard V4L2 capture device via the videobuf2 framework.

There is no local register interface for this driver to program: frame
delivery is controlled entirely by the host-side display engine and
the PCIe endpoint mapping that feeds the shared region, both external
to this driver. A software polling timer schedules a workqueue item at
the configured framerate, which copies frames from the WC-mapped
shared region into vmalloc-backed vb2 buffers. Running the copy in a
work item rather than directly in the timer callback keeps potentially
multi-megabyte memcpy and per-pixel conversion work out of softirq
context.

To provide more context, this hardware path is designed for BMC iKVM
applications. The physical data flow is:
Host Display Engine -> PCIe -> BMC Shared Memory -> v4l2 (video0).

>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: axiado,ax3000-video
>> +      - items:
>> +          - const: axiado,ax3005-video
>> +          - const: axiado,ax3000-video
>> +
>> +  memory-region:
>> +    minItems: 1
>> +    items:
>> +      - description: video frame buffer, shared with the display engine
>> +      - description: optional control mailbox, shared with the host
> 
> Why is it optional?
> 

The second memory region is optional because it is not available on all
supported hardware configurations or use cases.

For instance, another supported use case has the following data flow:
vtconsole -> framebuffer -> Shared Memory -> v4l2 (video0).

The first region handles the raw video frame data (which is sufficient
for capture if configured by userspace). The second region provides
host control info for automatic resolution detection.

In the vtconsole scenario, this second control region is not present.
Making it required would incorrectly exclude systems that can capture
frames but lack auto-detection. I will clarify this variance in v2.

Best regards,
TH

> Best regards,
> Krzysztof

