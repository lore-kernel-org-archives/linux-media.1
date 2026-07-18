Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020136.outbound.protection.outlook.com [52.101.225.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057DD35E923;
	Sat, 18 Jul 2026 20:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405385; cv=fail; b=Cwrx7PDXpk1n7HuTVSWgSFxZl0Ljxp/n1Wfw17bzbCKyuu8n3whI+kUsclXQKTDqdQD4qYRTL/4vYI5X9iQbrrsky3G38n/OrwTKAmP8+swgp6I/xxWezpBNyIk7BiYiTxwVQUXg/DmHUif9m3ZJ9YiTUhLJw6k2NNGl9J+35sQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405385; c=relaxed/simple;
	bh=znwXhpz1UmQI5Sma4b6MY+JZDoBzy6xFTDZuv9hFSoo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=j1PKbKLa9zfs6fjSVe+/uNkA5ctq9+OEU6zlM1uITxUvgeNt0bBljvGcbvT6BMGF0KuTHC+PbOB9jjL7e718VkP8IdnsmO+eDGZ0f8SNduyUIUD3HU3hgWns9xT6B8UXrgwUfwU7UijfWVURn3VVYily1ahy9qhDGOEGO41av8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=NOALgURq reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="NOALgURq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TegGH065t+9QzdbYQd7856jiT2ykPAkQAR9BVt75ahJvmSxoIcScVfH3VxE98pSq+nqvuzRRHCbgWW7Rjalpjx1d2iNcSXcaj86/OjA6xjIqwGl6F+Sf2Blz86jTC/vJWCk7hmSq3akbPZg66P2GxYCY0jWKFVxKdP76ZgfFfBHLLmF4F4yASCCtQnWrdmeIDux3KFiCl+l754CUuDXDLZVWc+DLM1kR8F77JUnfgQq4AHtijkZNquAt1C2ob9f2mD8z1KLyuJ7DUM0QVEalnXXJBp0kFUvnM1mXPa1t0YUshsnjfPBJ9fJ9U04zd4+sEhGRnQA2k4kKgkTJ1kOt6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjEEKuLpwW3AL/cbls5wohP2WBTkPg5xMgz8cbJjB2Y=;
 b=a9E6QRin4f8uG/gbbHjlrOIS/h9vS+N02zyRTvHAC27LP3S+wqThvFecqy95UVLO12wLepOZAqDxWkLjMXWlyTdNn4LrIA+4+4v6/IxzpTYwfCD2EWHEi9RfEyFdFY4Qj5iNyU8AsZ2S29CeRUQHvblmdi3eD2G5xM5WJnDEvuw/RB60QL+LkSkUCyMG9Pa57SKxgbaok4o0IM2BH+CEqZtjjoPfdwHEGGMDBVmqUqHE1pFycwu0LlgClrCgn96obTu+PdxFezHkTgFLFOW0QangMjNv8yImmxWKH1xNvzQLtfDVYWjxiy6h5fLtQQv+x+gKIY/QoFV14Kwkz6/9SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjEEKuLpwW3AL/cbls5wohP2WBTkPg5xMgz8cbJjB2Y=;
 b=NOALgURqBa+LpMZKY3SiIFRAwaQuhhEEWpdnrUaVZtLTAPXw6pPL8QEk1IEKQ+dRJ4ihgxjBNXnW+PnWim0hSyCUGkxvFGBiYb1qbRE+fWZmFIvZRZ9hU8l4CPLTyIluxbFoFtp6VZWiHpix90B2y9SI8PrwrmYrhnCI1OMk60nmgwQ0lqiiYO5/SrYs/8UXR7rm1v2Zn2hUkDIw6pAgQK4KUKk+r92IDt7ejJVLYHon7dyugoOf4N/XkuB4UpChEq0eWrYMVnm1/EYt7ryEmMiR1i1Agp4mU3+ufcWhB7C69GRABskioip0YfGA76hOTEdcrvqaVP87eTk1KPnyHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1343.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Sat, 18 Jul
 2026 20:09:39 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:09:38 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/17] media: i2c: os05b10: Refactor driver and Add new features
Date: Sun, 19 Jul 2026 01:38:51 +0530
Message-Id: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::23) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB1343:EE_
X-MS-Office365-Filtering-Correlation-Id: b7779010-4e2e-40b5-7deb-08dee5087e87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|52116014|18002099003|13003099007|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	BDQ67Phkctco+6YpWTWh7ZlXAB1dUoT4uHLHCCGhpFSNKNkbVGk434whbvr9FmRNKIeesXhboMTIogsOYBfso89QCerfHIGg0xSGAJPTKruzPWWJF2F50dF3u3zULECjFJhC/a1oWzS6Q/YesPhaQS9cApimLAvbl6COwErOXb83C0u+vgmduTVif5X14Dwtgsv2qOo1l4BdggoErUCA97oOE/8U3JvJcfxRUJAo6kdEHFtN8VVGNU6przdvv4ytQNlaG2WdIyfTgS62OpHim85YxjnLBFx20+h0CrHHeqYoV4VDwUKLZ0A96FljdzWnGCM7msIsHkpuSI31VfzcK0MT7FCvNOw0xJTpjo+OKYivODrfmLjXHquzmge4dW/GnhQazg4NkbaEi8m/tEZxU38nkGN2jIQU/TmYrBsSAy1MqbAUwAPOTgj6FqBaAC+E74gFYtPybOh12/TOif/G2NI6iXS/X50I7xPmJzq1pvXD5UwL1oe/1URkzL+lRNCtBsqU+Z0p/aApznHYcl+zmtndoC6QpVw8wrbFxQV+s71a3hjQBHoihtDy9KkPaInVgWoRvIp68KdutkuXC3lfqLIBSJy7369M+AE78Th5qFq8iESC13LVKGrrT9L1wYlb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(52116014)(18002099003)(13003099007)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzNMelpkcU9GaGNiV25vRXdvTUY4anVBWVRBT3ZXTHg5Zkl0YXlFVlpIVzRm?=
 =?utf-8?B?d29mR3dtYkZ5RTF0aUliaW51Vno1SU9QRVhhNSsvRnFYUjRzeUZFR05Sb1ZI?=
 =?utf-8?B?NVdjU1oxdXcwRTF5YnVtQVBBcGxiRUdxT1RmT3QzVjBiUFd3ZUY1NUpLUTds?=
 =?utf-8?B?d3B4OCtjaUp0eEVDZE5YNHhMSjJiY2k5eEV5K3lLRmpZM0xmb2R0UkxrZ3VQ?=
 =?utf-8?B?c29ScEdVNHBNYXc5bmY0eWVCU1FYM0tlQWRQQktDdHpvK3BXeHlEZ0JubWVI?=
 =?utf-8?B?OHcrZHpzUnJLK1E3c0NlK0c0eWdwRWNkR1k4TXpYcHJnTHdxc2orOERqQWFl?=
 =?utf-8?B?Wld5ajNEWVpXOURRRk0rRmJGallNVjFzU3dpY2JQZmszM2ozSzg1WVVSV1Bo?=
 =?utf-8?B?NWVlWDh1TFZGQXM5Ym9IQnNUbTY2cWIrY1VLR0hSWVVPdHk4RHVIWk1teDJP?=
 =?utf-8?B?WkNYSld4dk8xcENEaE9DRmhyN0xvT1I2RU5jU2pPSGQvbWtWMXZQNEI5ZVhM?=
 =?utf-8?B?TWZ1ayt2Yy9FMFl4emFWWVQ4ZWJQYzVpQ0NNdWF4YmprS0oyczhtOUhmTHVK?=
 =?utf-8?B?MERXNWF2TnluVjZLRHlRMzFjaWtjdDU0RXVlNjhReWJsM1ZTenpacEFYSXVK?=
 =?utf-8?B?ODVmRWplQ1laWlZ6SVpnSGdzNXlxeTBuZ3pnUEEyclAwT3RvU0RIQVJTc3lO?=
 =?utf-8?B?akhvamNkWFFjVng1Z0JINm5pVDRyMTZwYklnMDc4RUZuSFhMaktXY2lvNS9x?=
 =?utf-8?B?enQ3Umxxb21TcWRUbmR3dlk4cTUrU2sybzZ5WVNzQitYNTNROWFFTzNJUFRw?=
 =?utf-8?B?aHhUN0g0Q05pWHdtWjI1R3lkK3Ara1VKc3M0empoekZ0NS9QcVV4SHRyTGdq?=
 =?utf-8?B?azlsamdZZkVGREZhL1gvVXpLZFV5UGRNL0ZBWnRWdUd6Z3dLanhCS1E1WWxD?=
 =?utf-8?B?SUx0K2hnaFBoNHBHOGtBMDFoTm8zNVAxb0JiZVVvMXlsMDZ6cnpqb3k2Y2FG?=
 =?utf-8?B?dUhZT1FOM0w5ODlIL1pQT0RpTHQ2RE5IVWR2Z0pYaDFvSm0yeDM4emJFVTRI?=
 =?utf-8?B?OWJucFBUcUd6UWdZZW9lNDBOQ0FCM1haTTVSbkdLQ3JYN3BsRjA4RHBLQkJD?=
 =?utf-8?B?NlNKNHhjbmh0MzNlWXMxZkh2aWQxTThMWUFHejNnV0puOFJycmNwV0QybHRJ?=
 =?utf-8?B?SnRhUjVON2NhQ0tyZWJKVVRPb3BMaWxJK3lVM1NaVjZpL2MwWTdaa1lKOFNC?=
 =?utf-8?B?aVFRTGVVT2xNRGdrVW1iSTBVSE1vdEQvUEJySXRjVHJRYXQ0U1MvZmNLNmpR?=
 =?utf-8?B?Mlk2T1B2bk82dW02c0dvU2Y1NHkwaFVzYVo3bVRWeVBGTkR5NUxPaEZwNnp4?=
 =?utf-8?B?Z0taOG53ZUQ5NVVacDB3NitxWC9hWk1nbUhNYStNOFhVSzJZeUx6TXhiVFhh?=
 =?utf-8?B?SVhnYy8rY1liMkF0YU9KQmYybDZtNHhKb0NrZlQrT3NSTjJrV0RlUzNGRmpU?=
 =?utf-8?B?c1FhQXlJYk1GNmVjRHVpaUszNTliS0h1WURMeTJ4cXk5b0h5ek1pU09qQ3Ry?=
 =?utf-8?B?WUZWTzNVZTlUVWdwdTd4YTloUnhISHRmRkdSMVBiV3ZYR1dDK3B1dkJQdi9v?=
 =?utf-8?B?OW9TbzJtZHAzV2szQXl5aDU3RjgybzlyWkRLUDB3OTJ0a0pSSDg1b2lBWUFI?=
 =?utf-8?B?N292a0xOV1ZueDlWRUdpa1Bzcmo2NnYxQkU5MCthdW5GSUdxQXdyQzNWaUhO?=
 =?utf-8?B?WFg2eE9VRk5wSnVpaFdvV2FRcUJGS2JkWko1dS9tZ3R4QzQwdi9La2JleVFH?=
 =?utf-8?B?dUUyNjhxT1FFbzN1UzNSRjQ1bjh6am1nSUdDczVtZ1dLVWVGNUtkNmdrdG5T?=
 =?utf-8?B?V2JXazRkSVFGeFo3d3p6d0luZkJ0Z1lrTWlva09YT3lwcEdubDJ0LzV1dkt3?=
 =?utf-8?B?SUhOTVEwQ2JhcUpCMDJVdDVLcUlqUHp0SjU0aGVaeURrK0lpMEZISUFRY3BS?=
 =?utf-8?B?RVZPdm90MEVUbnVtMWdEMzZ4NTFGcG5sVTR1M2VrRGZWVWRobWNnZGx1My80?=
 =?utf-8?B?d2lDUERtR2IvU3ZUcWtBd3htVjAzR0k2SllBMzJqT2tlVStncmFTZ0ZpRzV0?=
 =?utf-8?B?eUgySW9CV2FkZWhGZHVsenpKcXJSWWtXckNySitTcWxQMnBOYXRjNGNpK01G?=
 =?utf-8?B?c21ncE9CWTNhWkNXUkV4OW9vNmk0Z2RBQjg5VkswNFRvR0FYOWpiSkFiTE1o?=
 =?utf-8?B?Y2YzQjY4eWZRVmRRSmhKb2xDcUlKemhmdnlkdlhvd1RtcWZxSVJBU3VHRm1R?=
 =?utf-8?B?L3hWL3dveDFsbzh1SElGb1h2Wm5abmx1NG91Q3JucVpORis3YW0yVTZyNDAv?=
 =?utf-8?Q?FKi599HpbNmZ81/+FG1gElALZun9z550cURz4r6Afoebj?=
X-MS-Exchange-AntiSpam-MessageData-1: owJWia2OOIlVVCeVgx/rpvF2NhmremTNP/g=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: b7779010-4e2e-40b5-7deb-08dee5087e87
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:09:38.1671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4AqTixPSRH7X8+a+49y5JdKblpiSYw2mzgF69DTGUfBqPvdqRCoYMEYQeNcoT/qPBBz1r+ZopkOa8BSVTpLRoj80zacNCOR+nFmIvO7aWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1343

This series improves the OS05B10 sensor driver with cleanup,
refactoring, additional controls, and support for new modes.

Patch 1 Use pm_runtime_get_if_active() when applying controls.

Patches 2–3 perform initial cleanup and refactoring. Unused
group-hold programming is removed, register definitions are
introduced, and the initialization tables are reorganized by
splitting common and mode-specific registers.

Patches 5–7 add additional V4L2 controls including digital gain,
horizontal/vertical flip, and test pattern support.

Patches 8–10 extend the driver with 12-bit RAW support, update
pixel rate handling when switching between 10-bit and 12-bit
modes, and add new operating modes including 1080p and 2x2
binned 720p.

Patches 11–13/17 improve control handling and internal logic by
keeping vblank and exposure in sync on mode changes, updating
the active format before adjusting framing controls, and
renaming the vmax variable used by the VBLANK control. Remove unused
controls.

Patch 14 adds support for 2-lane MIPI CSI-2 operation.

Patch 15 fix negative hblank calculation.

Patch 16 Enable runtime PM autosuspend

All patches were tested on the Debix Model A board running
Linux kernel v7.0-rc2.

Changelog:

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

Tarang Raval (17):
  media: i2c: os05b10: Use pm_runtime_get_if_active() when applying
    controls
  media: i2c: os05b10: drop unused group-hold programming
  media: i2c: os05b10: add register definitions and use them in init
    table
  media: i2c: os05b10: split common and mode-specific init registers
  media: i2c: os05b10: add V4L2 digital gain control
  media: i2c: os05b10: Add H/V flip support
  media: i2c: os05b10: Add test pattern options
  media: i2c: os05b10: add 12-bit RAW mode support
  media: i2c: os05b10: update pixel rate on 10/12-bit mode switch
  media: i2c: os05b10: Add 1080p and 2x2 binning 720p modes
  media: i2c: os05b10: keep vblank and exposure range in sync on mode
    switch
  media: i2c: os05b10: Update active format before adjusting framing
    controls
  media: i2c: os05b10: Rename vmax variable in VBLANK control
  media: i2c: os05b10: add 2-lane support
  media: i2c: os05b10: fix negative hblank calculation
  media: i2c: os05b10: Enable runtime PM autosuspend
  media: i2c: os05b10: remove unused control fields, simplify error
    handling

 drivers/media/i2c/os05b10.c | 744 +++++++++++++++++++++++++++---------
 1 file changed, 570 insertions(+), 174 deletions(-)

--
2.34.1

