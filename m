Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.82
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244492;
	b=Zb4V3s1ry/5wMMpMwmC20odsqzlvr8aOyeHOT/Xi4wPtJnAzSjpfvGnZCNmwl+yJyVAq
	 nB+4XrD2fiEAh9wTPq2WmwxdM0BsnliWPlbDhZHxb2EC3N+FRqYTqr3FFOvEptQrIz1sL
	 eFCC/JMP1Gp2Pev9YkerMpSLvl0d2MrkwRkgJGUYcefS/4P86OpfQR+BGAkJ9D8sOLgzn
	 0DVn4pcZAkw5WybKisIHRG2KwyWNvEKJi209d3J3TdlfY0kCk7mcaVirt0mXC6Iw0T9Kz
	 2mtCyGX6oFJL2rMMfoS6p+hNLvaKeB0zWIRdOWTUzcbqbzlukIBURtPEMTWKVV19Luw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244492;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=DO5AxPUX8McmlNq/EmEmROr2EnAqWBuOKK4Wod3kWmU=;
	b=AZmqIUAO0d6p9PdfgbRevAdNqpu7qsKul6mqp4GYRx2ODnu/Iv3H/RY7ByQd1pVLY5JY
	 P9m9EPwfNIjFSeA/qsU4ChLwdjtGNbr/mutB8SpEEUkB6BLtz2DWtZxbh145MbT2C38Hy
	 eTi9cJUxP7d88A2XjUIZFownXAwmIDmDgTnEHRlMQrgpKSvQOjwd1LEWwk5Q7gZkqE9QR
	 F6xHBhYwp9qaYq5Fpres6BudY19EtR1FtosxbbbF7HVkbp680YwFhqXuz+Qh1g6i39rWN
	 KJEeKSf0+K7pqtn6+Bybq1VYmxGhuXkLgjSgSyQbxhvi1K6rN70vE2oeJDVv1o/ne+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.82
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021082.outbound.protection.outlook.com [40.107.57.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF8D606A320;
	Sat, 21 Nov 2026 07:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF8D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5mvV9dPcJZJolv3k+Sm/O4EmlVeKiIO5MlsfbS4gWBvEOiGbu/Qfb4Zls61/57WOAKAJfhAGAHmyI1uG04auIdpzoBzXXKc/OobS3IvDY8hztPTJMHBjsCY+dPyZSZy18ZTkOQc1yYdd/QAFGo+bGShEaHrW6Ss/D99z0Nd0ljYdDA8OW0Kvtx0hzDQpLdgvU5zbZxQBLi4KLqo1/6VOor0Nw9sPw9UHiOCuu4NanGLG4liccHmZPw41mCoJYYPiZzzOU2/lOIiMFM/2bvTpJQfeM5vgZ+/sXcutOm1wVanes4h3YiLaiSqmkrol/KwukYDPBLe/TtzBONDMI8keQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DO5AxPUX8McmlNq/EmEmROr2EnAqWBuOKK4Wod3kWmU=;
 b=Siij2vrp7jsPMr5HOyza0tBYCmlfTIeWtqsYPEk2IiUhMCdBTW2um8HVChsP2yYrZgeT+JpQcId1hHtVcIZpg8ajhNZjYYHV0oFwRMEPrxnO/H7rczh66vOCoE8kuyCAnAteaJT1wJYhsx+TxBh2X3WXwOJ+x1yAulltFvouplnQIlkAGfIIP3u6DxYdRML3z7C9gRE8zAuIRPlHyF9v2vst6muJnLBxSb31UBYwu7JZGUzb7RGtOlpdLtyRFvpyU/7EPtXILEwRTXRjsCAs0wbRSQqeLc0bQfIllCMeNSb21UjkxY1mlcLFgKc4kFmtP2mxFtSm0alFEN3+f9Mz7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB1492.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:01:27 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:01:27 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 00/15] media: i2c: os05b10: Refactor driver and Add new features
Date: Sat, 21 Nov 2026 12:30:50 +0530
Message-Id: <20261121070107.1768-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:269::13) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN3P287MB1492:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e62b1aa-6c7e-4f32-af06-08df479d4303
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|6133799003|18002099003|13003099007|56012099006|10067099003|261028144727099003|261026140227099003|261021121427099003|261102123227099003|261021123027099003|261022075727099003|261022105027099003|261026121527099003|261009223027099003|261009221227099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 E1sqfROPgvN4n5nX7DGH/J+YL/PbMRTxtWJ+w7LTINxc7ZUFKQHRhFIJo2MVC0grzEL/h7HJQXgC6BJgxqtAP0GyIBBFHAkTE+ch8ZPqPmQxbjJ6vaBaT8cW6Hxg9RfFbETRvkKqRmRW1aJvPlIOJTmygKebnt4JdK97AMkEZUBMUkAUS4X4NXFTxSirIguXm622xMTjcvpWnWjQqiUGOTnU5NgS/lwvub+2/En8Iznspg1UrquGYusAnmlNed2S46KnTRZ+I9ybFBexqtAaGnbSQUHBK1YXaxgTJT0QoQcE21M1JExT7mgsXk0qWmDq9u1DUzdX3osD1MARhUs6DMR5RUCVk/imCdGYG6sYmnFKZE4aWq7IVTBsCo0+dt2VztkK6uSwX7Gh0vZha4ejrfGjwNaX8dP8HGhBNC3fs8nrvAozH4WgbSLk0Rt8uCV597NdHi6rLLa/ZwERemtQPpT3AwcwMkwbdjAVAkBVlNSzzjK5O7+OI3qMOsj7VLkJGORbE1btSmyCqhs8Gm7P0j6LckvzWX0xJoJMhNHvl5OZqeIe1dNDUIOi3vMyVTRmoIaZFGlkL7gf1jQjY9RTfwq2ODAZbcTo7Hx9sGKO3KSPu+68vQgHkztLLa6LJyxsCJqo1bD9YZ7E5w8Zx6xk1cim2ubeIu2R1bC2ZeX0rOw=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(6133799003)(18002099003)(13003099007)(56012099006)(10067099003)(261028144727099003)(261026140227099003)(261021121427099003)(261102123227099003)(261021123027099003)(261022075727099003)(261022105027099003)(261026121527099003)(261009223027099003)(261009221227099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eEx6dWdVbVJaTjZUaDJLbkF6b3ZxeHQrd0lKU2tnYUVGQ0Z2VTlKYmN0N01D?=
 =?utf-8?B?U3dHMWdudG9uWHBxMGxPVVlNWmM4cXhlNGtoVUIweDlIVHZ0MlFiZCswK016?=
 =?utf-8?B?NVFudENrVmwxZ2pMM29jR1hTTVBPWE9ZNnBkYi9iY1VHeHpuVmp1NUxpVVU1?=
 =?utf-8?B?VEpYS0IrSGw2ZFJiUTM2VjJ6WjlkT1RnYnNUcHU0N2pGbTE4Uy9Wb1BKSXAr?=
 =?utf-8?B?UWhwNVhhMWI4VHMzN0tFaHZpamRvckk2WUk1bFIwK3RtblpIMXJiUEZIV1FJ?=
 =?utf-8?B?VWZPb0JLT05iVXJHVitoM3NNY3h1U2oydzBYVU9WY2lnUXVMbFpXNkVRNGIr?=
 =?utf-8?B?aDhJT1dhWjhkWmRESGVLUi9UOEE4MGJYMERDRUpNeUNmTmw3cVljTkduWVJU?=
 =?utf-8?B?OUgzZHQ5MXNTNkE1cjBHMHdoVFdPR0hJVnVyUFBUWHM2NVl6bFRxT1F1WVNk?=
 =?utf-8?B?YWtrbTIreElxV1A3WnBPcDNGVkNiV3hNM2MwbUF1dnBoZ0RPR016VWJvSGxX?=
 =?utf-8?B?b1pZWGdYMlRWUGF6YlArWjYyL3RveUlDNjZPM25xb3dWSFFDM3gyT3JDai9J?=
 =?utf-8?B?RHVQTi9RQjRBRXlMYnZwNjk4SEtZdTYxR0dNYm9QaFkrZ09hK25Id3dSTk5V?=
 =?utf-8?B?dlRBWTVDZFU1dG9EWDZ3ZlArMVBtQWlBUEp1bDVPcDgyVEtlOFZGZ1pybjBZ?=
 =?utf-8?B?OEI5VDdjb0hUUFdoTEVXTFB6bzBWenl2T2VsVTJwZy9vdXNHclQ3OENHWGJG?=
 =?utf-8?B?S29IZlFRbzFrQ2RZS2FLeTNXb1R2YXdMWUlUcVVVbEIyalp0QjczQU5NZlVy?=
 =?utf-8?B?Y2FNajlZN21DdnVBNEwvK2NQeEQxTFBSUUs1YXJ2Y0lhVTZ2YndPTFBDbEI0?=
 =?utf-8?B?MGR0akZkemNYOVU2RmZrOXJ1OEFzZVVtdkVpYWduNTV2bWtWdStjdXh1WHRO?=
 =?utf-8?B?Um0zK2ZSUllYRDJkdVN1ZlNzcW9oZWhTeGl2WE1URDZqSEQ4SkdnNzdXY0Fh?=
 =?utf-8?B?SUlXTmlJSGtBb29Fc2tEQmdpeTNKZFVpZ29tSjdNQUFGdG5SL09ocVF4TXZE?=
 =?utf-8?B?ZVltRGE3UEpRUzJVR2swZjhTZkZ3c1NlTjRTMld3dXVSMnFJWW82MXNFRUk1?=
 =?utf-8?B?Zy9zT0gvdVYwZFduUTFJV3d3bXJUK1NHSnVobXROVnpZMldkZUtuOHBlYXpk?=
 =?utf-8?B?Q29IL3BQdkd3Mm1va0k2aVg5MEdrTnRVSWJESFpmV3B2L2tTdjA5WXJGc04r?=
 =?utf-8?B?NE13TkFjSlRmWm84a3g4VWZwcURpMlJkTk43ME1mcklOT3o4VWxUNmQrakZ6?=
 =?utf-8?B?aDYzakpuRktCS3hUOXBKRVo3eGc2ZzJ0a21ydElHcGs5ckVYQW1mV0RkMGRV?=
 =?utf-8?B?MDRYTE9ZOVpGZFF1ZEFwcVJyL3lZanJQa3FZMS9WTjRNMUo5cjJnQ1MzNGZl?=
 =?utf-8?B?STJuVzh4ZXdqZzNMYWxLU1IvWXMxUWI4VC9rRC8zNnNxdFVXd1VMWDVLVDBI?=
 =?utf-8?B?SS9ueXpoZjB1d1F3Rzg0TUNrV25rRFNHY2lObEtaMFpCV0ZmUnl2OEt4UE1F?=
 =?utf-8?B?ZW80VTM4NEpyTGJkdThNNThpY0NReHMzMmFSR1U5UUJlTnhpcENrZVVIeCtx?=
 =?utf-8?B?ZWNab3o3aHdqSU0vQUZsWXB1eHR3aGpSeDI5eGkvMDZmanVOMDdkSFgxV3c0?=
 =?utf-8?B?NVhadk4vMmJTeDE1YzN1M1JlS085MUZpSzJVRDlnVlZDcFFSU28rc3V4aWU5?=
 =?utf-8?B?ZUdxeU0ya1hDRThvRjRCRHVhYjlGejVKSWM4b0E1dExXWWF4NlV2K1d0bmg4?=
 =?utf-8?B?aFJGNzJ3cXZSZml2Y0Z0UTAwQ3dYSnAxTHRpVkpLbmpINVdJSWdEa1BZMUs3?=
 =?utf-8?B?QWZJN2dISWhGN01KQUpEQktCTGtjaWJRN3dtYUZXTkxyYWNpNGRvSG5lNGtU?=
 =?utf-8?B?eFFqdS8xbnFhYXE2WER4MmdRT205OStlRXFKeC80S0RKaVkvdnpaQ21INi9V?=
 =?utf-8?B?YzZFclo3eFFQbC83SHNhY2owcWpiZFJaVkFmR25jTDVnZHZJdGx3OUJGZXF0?=
 =?utf-8?B?bjhwQVNxTHo3a09YRFVWbzQ0eHU3Q3F5bkJXSzZjcHU0Sjdnbldxbjd5OTN4?=
 =?utf-8?B?cDJZTmFRV3FXZ2RxektoM01JR1pGc3Q2dWN1dkMxbWNpUHgxOVN6aGhPRXZE?=
 =?utf-8?B?YjFUZHdRS1ZyL1pFQmw5K2ExYTlCbHlra1dKRnJzY2JtSXpkbGw0TDFUNmRE?=
 =?utf-8?B?TGpJUEd3dTBqdGFPKzNrcDNCTnYxVVM3citWNTZqZnBQdkFjOWdrekVMaVA4?=
 =?utf-8?B?aU5OUFFIV2hlQUR4cStJSXdnVUlUdDNsd29kL2s0dHM2RCtGNGtKeDBwQTZS?=
 =?utf-8?Q?J5aMgHq5TdeOQbSw=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e62b1aa-6c7e-4f32-af06-08df479d4303
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:01:27.1378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDgAEUIiCBBtk6XGmvpcYEVKJWrJOdVpbLviAPUM1yQzmHRKgf6T82Gaf515U6nBn4/28O92JkCZpPSoXZmhxT8C2uqabae1H3BUfXE1lbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1492

This series improves the OS05B10 sensor driver with cleanup,
refactoring, additional controls, and support for new modes.

Patches 1–4 are small, self-contained fixes and cleanups. Unused
group-hold programming is removed, the vmax variable used by the
VBLANK control is renamed to vts, the active format is updated before
adjusting framing controls, and runtime PM autosuspend is enabled.

Patches 5–7 refactor the driver. Register definitions are introduced,
the initialization tables are reorganized by splitting common and
mode-specific registers, and unused control fields are removed with
simplified error handling in control init.

Patches 8–10 add additional V4L2 controls including digital gain,
horizontal/vertical flip, and test pattern support.

Patches 11–12 extend the driver with 12-bit RAW support and add new
operating modes including 1080p and 2x2 binned 720p.

Patch 13 keeps the exposure range and default in sync with the active
mode on VBLANK and mode changes.

Patch 14 adds support for 2-lane MIPI CSI-2 operation.

Patch 15 fixes the horizontal blanking calculation and reports the
sensor's real internal pixel rate.

All patches were tested on the Debix Model A board running
Linux kernel v7.2.0-rc4.

Changelog:

v5 -> v6 

- Addressed Sakari's review comments.

v4 -> v5

- A few patches were mistakenly sent from an older version.

v3 -> v4

- Reorder the series: simple fixes first, then refactoring, then features.
- Drop v3 patch 1/17 (Use pm_runtime_get_if_active() when applying controls).
- Drop v3 patch 9/17: pixel rate does not depend on bpp.
- Patch 4/15: Call pm_runtime_dont_use_autosuspend() on probe error and remove.
- Patch 5/15: Add OS05B10_REG_PLL_CTRL(n); use named values in the init table.
- Patch 9/15: Chain cci_*() errors; update active format on flip change.
- Patch 11/15: os05b10_get_format_code() takes the mbus code instead of bpp.
- Patch 15/15: HTS counts 4 pixels; fixed 420 MPix/s pixel rate; add Fixes: tag.
- Collect Reviewed-by tags.

Link to v3: https://lore.kernel.org/linux-media/20260718200912.16001-1-tarang.raval@siliconsignals.io/

v2 -> v3

- Patch 1/17: Drop Fixes:/Cc: stable tags; use "if (!pm_runtime_get_if_active(...))"
- Patch 3/17: Drop unused HDR define; use GAIN_DEFAULT macro;
  DIGITAL_GAIN_STEP 16 -> 1 (tested, not in datasheet)
- Patch 4/17: Drop unrelated cosmetic reordering
- Patch 6/17: Use OS05B10_MIRROR/OS05B10_FLIP macros instead of GENMASK
- Patch 7/17: Clarify 0x5080 removal in commit msg; fix test_pattern_menu[]
  casing
- Patch 8/17: Merge codes_12/codes_10 into one table; handle NULL mode list
- Add new Patch 16/17 & 17/17: Enable runtime PM autosuspend; remove unused
  control fields/simplify

Link to v2: https://lore.kernel.org/linux-media/20260325114404.95188-1-tarang.raval@siliconsignals.io/T/#t

v1 -> v2
- Added a separate patch to fix the use of pm_runtime_get_if_active().
- Modified patch 11 Remove unneccery exposure range update now just modifiyng one time only instead of twice.
- Add One patch for fix negative hblank calculation

Link to v1: https://lore.kernel.org/linux-media/20260306123304.76722-1-tarang.raval@siliconsignals.io/T/#t

Tarang Raval (15):
  media: i2c: os05b10: drop unused group-hold programming
  media: i2c: os05b10: Rename vmax variable in VBLANK control
  media: i2c: os05b10: Update active format before adjusting framing
    controls
  media: i2c: os05b10: Enable runtime PM autosuspend
  media: i2c: os05b10: add register definitions and use them in init
    table
  media: i2c: os05b10: split common and mode-specific init registers
  media: i2c: os05b10: remove unused control fields, simplify error
    handling
  media: i2c: os05b10: add V4L2 digital gain control
  media: i2c: os05b10: Add H/V flip support
  media: i2c: os05b10: Add test pattern options
  media: i2c: os05b10: add 12-bit RAW mode support
  media: i2c: os05b10: Add 1080p and 2x2 binning 720p modes
  media: i2c: os05b10: keep exposure default in sync with the active
    mode on VBLANK changes
  media: i2c: os05b10: add 2-lane support
  media: i2c: os05b10: fix horizontal blanking calculation

 drivers/media/i2c/os05b10.c | 733 +++++++++++++++++++++++++++---------
 1 file changed, 558 insertions(+), 175 deletions(-)

-- 
2.34.1

