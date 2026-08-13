Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA633B4EA3;
	Thu, 13 Aug 2026 22:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786658524; cv=fail; b=Ik5q04MsMH5bW76reWpcGB9Lt0ct+TfMeATXNNVoTx9nBGuSEaCJdR8suTCtq8wm12+6yofHLmbuszTmsmmWXrTiNBEWZ9zznhkBFX1dbYxHxytkLU+ZMNoevFI2Y5xiyiveqpwyvvpqiGhI5fGWJUIgKs5OeeeV3K2TSyVgqNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786658524; c=relaxed/simple;
	bh=ifubnsndUbLEhv7XojjlKJvI8SgfRp+Y1tWB9iRXLmY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=s2UP9v6G88iU5dtCOZ88yV7+h/JHT2gXLgCLS0QUW1rtcDSEcAJmB5yTdO5rYXf+duuIW891IBPbhauExHyLhwAEbhtxGLlYMBpSKH7BpTDHKC3+FulkHZ2WvCdisArk3Y7Zeumb0173pa17CsNEQp4mWiY8UsqFc4AAlJD9h9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=xqi3I0wc; arc=fail smtp.client-ip=52.101.65.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="xqi3I0wc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOA50BtK6dmrZH7v2G9+BDhoLHxBy/nkXJPDM100R4Sg5iCr7BqB/nzOmiAn+ufJKyidJIapdc5mZD8oGfz85NJ22e+9L9Twd7e6LmhAwgRtHkQKXDQVeicETM6sJnbBL4sgAVpNWpzWa79mH0g5GDIi0OuLEBzrRGcQ7gdvy7BfviBW/FCZGiX0QkrIDYM6WnNiziSFejOTEH9UJEPui2FJW7Gd9su8DC0bEkl9rMmArykff9rW6uAcMnk7+8EAb68e4MnNZ+pI2ZGIlV2nKQHTZRHrhyl3NI053k/BrF1JI5n2nECq51T+RWo8O+PZTbB7+mP7UyVYDik/j1EjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYzy9XoIHXumdMSz9z0xb+TOEFTJpVRkoY8OUWWlcZ8=;
 b=bEdlNNugvkhpX9SWkzKcb6lrFPHkuRbRjsEySRSgxxrORsOOHFQW5OxMgbLbPMAxLxQqfKmokdYu3Cm31xajSpOflz8YNbpzUZg0wVNII4gS5PPuoLCj8IVE2DDjAtlO9z98yvX4RqjitKYGO5lbSCiX7cuAxtb0T/TJ/iplvm7hxGuen13vowNSzmRrE8zLQ8hP2HmcPRixEVdTldwRar5vCm0ghMqONqymTBOQQsbChu+l2cuQ0fKF+qmjomaMQQ5LNXNnad/Bnk5WlqsFrjhYcXDOm5UcPS6WBTct049f5kizdUsSCDA/8U+oJU4GBW6R3B7vdFfsJGfQRgAqMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYzy9XoIHXumdMSz9z0xb+TOEFTJpVRkoY8OUWWlcZ8=;
 b=xqi3I0wcX3tT82E9D07TksOKm2T/lSVidXJrWlyCF/nPiwMHn68sIkdfAmxF9oMOXJuPz01i7n+lppRZA/BsD45fA/HT6lVDaBdjK8gyPO8VV7j5p8GMqaMebqX5fhmdrM6rxvIfSiM3zuh6DopWYzZKpyVH9Ny7YWKtXcR0fIQyn5dAwYgDdDZo3rMiGa4KVlM7IbKBLFhP0aPPECK9Lp7NqcDDr152xqqJfWxreMHi0DhNWHXc8uDzsYyyK9309idNIY34g7jZEhAmKSVFESjlYTY7TXI6JUC35Laa1dS6ltwsmFfkVsxzkQZRts0HD+CtX12/AXIU6BuEvvY8Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by VI0P189MB3288.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Thu, 13 Aug
 2026 22:01:58 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%6]) with mapi id 15.21.0339.004; Thu, 13 Aug 2026
 22:01:57 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
To: Miguel Vadillo <miguel.vadillo@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yunseong.kim@ericsson.com,
	ysk@kzalloc.com
Subject: [BUG] intel_cvs: WARNING in __setup_irq: IRQF_ONESHOT without thread_fn
Date: Fri, 14 Aug 2026 00:01:28 +0200
Message-ID: <20260813220127.7462-2-yunseong.kim@est.tech>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00023978.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::36c) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|VI0P189MB3288:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b1263e9-946c-45a1-eda7-08def9867e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|18002099003|11063799006|56012099006|3023799007|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	b4YZSIt31uqElqn6meSOAxlaFHx3KOhHlp62+aYtS+glqv8OMe7ojmfizK3UF4Ym2aIgQ6uR9/6EW6orDPz38NXMIJoC3nBPmp8f4+nS/vXKu7ZbEXBrIuhK9P17D+fHelbhd2UpKvY849mfOLIhVopeQK8vFBMsP7esh+DQnvyzsypuKdnKBI0TG4FPT7c/lqLEYp54Ijttwz6Y5arx4GJC0gMbd0CbFF0WVkKtlHdtnhIgDppcbLoCEFAF6/ZA7bSyM7Dmjf9tzb9SMLyB44DN0Y3w2ZxNF59uG3s8/0jeIlIhR2cVp+JP/CRmFON93tbd9HeZ51gPdAhDVZbTOTcjtTTLnIBNNRMtxHEk7Fx9xbbSOCbpKPs0Nt8oqhWISngbPwcALWYGoQm0LQrRzz8Mjn4tQmTXXcHVAjOa4RZRlughUOQKmu0Dm+RyIqCbuMFGaDPLfNOKn+KNdzA3E5x15a6frT74EQQCIMCLBAjr7JAtxNDyTHidIh2QxQsasJljGfGs5YAd8kNHK3kcjwXztftfYjxCRQfbgE6l917AG7UCTtNyscaTFqeqSYCdvER8w8ZEVG+889DhndXeu3qRzHLEarQ5ND0IO/LbO6ArSQsBqFdG4Z2bsWIoM9fmqgmovo6UVd0eu5Sf17XCNlJ96A/MFuZE6M/CTZvnfns=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(18002099003)(11063799006)(56012099006)(3023799007)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RBJt2+jSFwqAwPzY1qm07rvFTW4O7j06imfwoxmv416C1nVQqDXoBmuTkhvg?=
 =?us-ascii?Q?h6TZyXbr7lYf2GjU9pvZaP6GBwvhCmCN1lcrANbo/bwNe0CPyJIEAkYvAaky?=
 =?us-ascii?Q?iQqN6IJmbcmEGzH20aaE/C8gpZv3nwXphpvTvCMT0ZxejPSsPHLhelu00bYm?=
 =?us-ascii?Q?ZsnNnCr4HIVZBg4u/BanOMXd7/l6xFd+7yOrWu8ea9AxcqOxeD1EfFELfwE/?=
 =?us-ascii?Q?x2mYPRc7CRiInaKRCG/DcBghnQWrDAreGHXE3gs88HZI2Y2vhMk6GUTyvw7A?=
 =?us-ascii?Q?vD03lxzfcsNw/9UMlnnK0SerNFWd2e6m3y+Xz3gViDyTM2+a3axRmjaWdByU?=
 =?us-ascii?Q?zZEdZYKOqZeI2r3+OuUoxkm13qtjJbfThYwLPmJTlWoEYVCwYzfa6A3aMpE8?=
 =?us-ascii?Q?nim76mpLgAvztbjiGP5FACAi/GyDTta4ipdkuwSCuWsnJIU8zMvezLkECD79?=
 =?us-ascii?Q?MN1WozWv1tqVL09hVFg33p4kNMjLwwNEDhOe7pC9oDmHU2JSOPAuwsY9mL3N?=
 =?us-ascii?Q?TV3orYL2B74eNDwksKw8Gx2VtStvAnZZ2kuCeh2IqIfBOOQ9EFOEoknxbmOq?=
 =?us-ascii?Q?Z2dwXOrraR8J3rBrwOuo4Y4AdsSHypDYombmQJVwQDZDsw6gKamOQQG/YVHt?=
 =?us-ascii?Q?HDNsj5VgQiHmw8ntVfS6Wo8iKCwUDx/CrKtGnb1JWDD6g3SUUff6o+GW37x+?=
 =?us-ascii?Q?LOXdw59NzpJtwa5HTgQpeuuim5jTNs5SIeeop3FjXWcSCFePAcrmj2R8H4CP?=
 =?us-ascii?Q?Ah59MyLskr5yRtttLMMrkuZfVk43Cf6cYT255X2bp2YPfNLouF+f+Dbnudu0?=
 =?us-ascii?Q?nmlPfEvZ6VD8n7QOK3swsf4LLmoZQqVL0aS7wNHSy1UBpIehFf1COUjF3fyG?=
 =?us-ascii?Q?yKGf7q39i0TxKIO4y9W58z1JPXMP5WaGmd5LXCdQzRhT3lCuPxyTINX+y42T?=
 =?us-ascii?Q?ns8HMJ98OXyLV4vbbh5zNfhTa57QtJEyZHUO/HjVTaM+1YVJvqhfJtz0EuPY?=
 =?us-ascii?Q?rmCra3W9r03acQHQCHfCBrQWIR3fOd2grbzK2+xsGWl1AS1I4ZQZOdn/xReS?=
 =?us-ascii?Q?WokzF+f/RCeOUkKCHb6tcxb8u+PedqOggL79SPW+1dyT3jx+RIF91qAuvDJz?=
 =?us-ascii?Q?OpCSUlbXeKzZ3Ylin6iFtjMQzNIPVoiMKM4zqA6Ax1pWFInaEPcC+EcCtXmN?=
 =?us-ascii?Q?r2rO8tQxym6JQRl7bkW5TJeXN9rDYTB3LaAinpTmhz86E8n2HQ0hmglK79DJ?=
 =?us-ascii?Q?ekyO3/RwmcslucbXXmz1SSgDQK3AjkxzaoGbsUGfvLaGGFKNbLKCYiw+8u3T?=
 =?us-ascii?Q?Kn8YOhd5EJQSCle4zA2WvUjc7zu/foDTPV5A5d8NaJ6lx2TNiq3NmUZd02fV?=
 =?us-ascii?Q?oc0Mped6+ihW7aXpSnXaLN+ObjZnTzciVPXS4wCIMJfZVqn2fAnFtcQeTyA0?=
 =?us-ascii?Q?AQ4jBE/e2rRQaSNkITQuotAsEv6qjSEYVXTsrUjAdPc7yrgOubawtzsrxma3?=
 =?us-ascii?Q?EfFjqIuYIEQ+yDDT4TuQok3mj4j6DY01eXcxd+bfpF6yf//YCGoBZzF1frxC?=
 =?us-ascii?Q?859k07zqEBvjDea1WKmQ95JkOW+NICCryXE+Wmd5rn5kBoHgK8sJknPZpQ7k?=
 =?us-ascii?Q?KKY3G0CtWZk92nWhf0jQjio4WTD7DgbLGRmExXt4isVKayOEK75pMr7xZQOX?=
 =?us-ascii?Q?mk1yqtzDsxJtF/BQU3t58e13eFlTqJORvf7mU6zHFc9TuQ8hr0A1DOu7woI6?=
 =?us-ascii?Q?8NktMgHWtbAgHBO3F3LTRvJoPVRhUauKM85iYLSHektv0xRzmRlgebWKejue?=
X-MS-Exchange-AntiSpam-MessageData-1: Z5KIaG7+QLrDXA==
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1263e9-946c-45a1-eda7-08def9867e81
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 22:01:57.9058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7cDn4YUFijWLT3kQ+tvQENXXch6MdeOHBzJuetSOjeaX2yNEc+CiNufL2NTDvKfQQNjEbzwG4OiB1N7nf5K5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3288

Hi,

On a Dell Pro 14 Premium PA14250 (Intel Lunar Lake, BIOS 2.13.4), the
Intel CVS (Computer Vision Sensing) driver triggers the following
WARNING on every boot while probing the CVS controller (i2c-INTC10DE:00).
The probe continues afterwards and the IPU7 camera works normally, so
this is cosmetic, but it splats a full backtrace on each boot.

Kernel: 7.1.3+deb13-amd64 (Debian 7.1.3-1~bpo13+1)
Driver: intel_cvs built as a DKMS module from the standalone tree at
        https://github.com/intel/vision-drivers (hence the OE/unsigned
        taint below), which is what users on kernels predating the
        drivers/media/i2c/cvs mainline merge have to use for this
        hardware.

[   14.002098] Intel CVS driver i2c-INTC10DE:00: cvs_common_probe: probed a=
s i2c device
[   14.006334] ------------[ cut here ]------------
[   14.006335] WARNING: kernel/irq/manage.c:1502 at __setup_irq+0x50c/0x720=
, CPU#3: (udev-worker)/693
[   14.006339] Modules linked in: int3403_thermal(+) processor_thermal_devi=
ce(+) ov08x40(+) processor_thermal_wt_hint intel_cvs(OE+) intel_skl_int3472=
_tps68470 v4l2_fwnode platform_temperature_control pmt_telemetry(+) intel_h=
id(+) processor_thermal_soc_slider pmt_discovery int3400_thermal v4l2_async=
 cfg80211 processor_thermal_rfim acpi_thermal_rel processor_thermal_rapl sp=
arse_keymap intel_skl_int3472_discrete joydev intel_rapl_common pmt_class i=
ntel_pmc_ssram_telemetry intel_skl_int3472_common processor_thermal_wt_req =
acpi_tad acpi_pad intel_vpu processor_thermal_power_floor intel_ipu7(C+) pr=
ocessor_thermal_mbox drm_shmem_helper ipu_bridge int340x_thermal_zone ac ev=
dev rfkill v4l2loopback(OE) videodev mc msr i2c_dev parport_pc ppdev lp par=
port efi_pstore nfnetlink efivarfs ip_tables x_tables autofs4 ext4 crc16 mb=
cache jbd2 crc32c_cryptoapi dm_crypt dm_mod hid_sensor_custom hid_sensor_hu=
b intel_ishtp_hid i2c_usbio gpio_usbio usbio xe drm_gpuvm configfs drm_gpus=
vm_helper drm_buddy gpu_sched drm_ttm_helper ttm drm_exec
[   14.006361]  i2c_algo_bit ucsi_acpi drm_suballoc_helper typec_ucsi drm_d=
isplay_helper typec hid_multitouch cec hid_generic roles rc_core psmouse ae=
sni_intel nvme i2c_hid_acpi drm_client_lib gf128mul serio_raw i2c_hid xhci_=
pci intel_lpss_pci nvme_core xhci_hcd hid drm_kms_helper video intel_lpss i=
ntel_ish_ipc nvme_keyring drm usbcore thunderbolt nvme_auth idma64 intel_vs=
ec intel_ishtp usb_common wmi battery button pinctrl_intel_platform
[   14.006373] CPU: 3 UID: 0 PID: 693 Comm: (udev-worker) Tainted: G       =
  C OE       7.1.3+deb13-amd64 #1 PREEMPT(lazy)  Debian 7.1.3-1~bpo13+1=20
[   14.006375] Tainted: [C]=3DCRAP, [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
[   14.006375] Hardware name: Dell Inc. Dell Pro 14 Premium PA14250/0NGT53,=
 BIOS 2.13.4 05/20/2026
[   14.006377] RIP: 0010:__setup_irq+0x50c/0x720
[   14.006378] Code: fe ff ff bb 01 00 00 00 48 c7 c1 ff ff ff ff f3 48 0f =
bc c9 48 d3 e3 48 83 f9 3f 0f 87 56 2d de ff 49 89 5e 48 e9 d8 fd ff ff <0f=
> 0b 85 c9 0f 85 87 00 00 00 81 e2 00 00 01 00 0f 85 70 fb ff ff
[   14.006379] RSP: 0018:ffffced5853837f0 EFLAGS: 00010246
[   14.006381] RAX: 0000000000206002 RBX: ffff8d3bc9db7f80 RCX: 00000000000=
00000
[   14.006381] RDX: 0000000000000402 RSI: ffff8d3b8eeaee00 RDI: 00000000000=
00000
[   14.006382] RBP: 00000000000000ae R08: 0000000000000080 R09: ffff8d3bc9d=
b7f80
[   14.006382] R10: 0000000000000000 R11: ffff8d3c01c2bdb8 R12: 00000000000=
00000
[   14.006383] R13: ffff8d3b8eeaee00 R14: ffff8d3bc9db7f80 R15: ffff8d3b8ee=
aee00
[   14.006384] FS:  00007f8def0829c0(0000) GS:ffff8d433e7d6000(0000) knlGS:=
0000000000000000
[   14.006385] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   14.006385] CR2: 000055c5c6ac1998 CR3: 000000010b2dc003 CR4: 0000000008f=
70ef0
[   14.006386] PKRU: 55555554
[   14.006386] Call Trace:
[   14.006388]  <TASK>
[   14.006390]  ? __pfx_cvs_irq_handler+0x10/0x10 [intel_cvs]
[   14.006393]  request_threaded_irq+0xe2/0x1b0
[   14.006394]  devm_request_threaded_irq+0x81/0x120
[   14.006396]  ? __pfx_cvs_irq_handler+0x10/0x10 [intel_cvs]
[   14.006398]  cvs_common_probe.cold+0x266/0x41e [intel_cvs]
[   14.006400]  i2c_device_probe+0x18b/0x350
[   14.006403]  really_probe+0xde/0x380
[   14.006404]  ? __pfx___driver_attach+0x10/0x10
[   14.006406]  ? __pfx___driver_attach+0x10/0x10
[   14.006407]  __driver_probe_device+0x84/0x150
[   14.006408]  driver_probe_device+0x1f/0xa0
[   14.006409]  __driver_attach+0xba/0x1f0
[   14.006410]  bus_for_each_dev+0x8e/0xe0
[   14.006411]  bus_add_driver+0x11f/0x200
[   14.006412]  driver_register+0x72/0xd0
[   14.006414]  i2c_register_driver+0x45/0xc0
[   14.006415]  ? __pfx_icvs_init+0x10/0x10 [intel_cvs]
[   14.006417]  icvs_init+0x1d/0xff0 [intel_cvs]
[   14.006418]  ? __pfx_icvs_init+0x10/0x10 [intel_cvs]
[   14.006419]  do_one_initcall+0x5c/0x320
[   14.006422]  do_init_module+0x60/0x250
[   14.006423]  init_module_from_file+0xd6/0x130
[   14.006425]  idempotent_init_module+0x114/0x310
[   14.006426]  __x64_sys_finit_module+0x71/0xe0
[   14.006427]  do_syscall_64+0xea/0x640
[   14.006429]  ? vfs_statx+0x80/0x160
[   14.006431]  ? vfs_fstatat+0x54/0x90
[   14.006432]  ? __do_sys_newfstatat+0x3b/0x80
[   14.006433]  ? restore_fpregs_from_fpstate+0x3c/0x90
[   14.006434]  ? switch_fpu_return+0x5d/0xf0
[   14.006435]  ? __seccomp_filter+0x42/0x5d0
[   14.006437]  ? do_syscall_64+0x9f/0x640
[   14.006438]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   14.006439] RIP: 0033:0x7f8def31a7b9
[   14.006445] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 =
89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48=
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 27 66 0d 00 f7 d8 64 89 01 48
[   14.006446] RSP: 002b:00007ffccecf4ec8 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000139
[   14.006447] RAX: ffffffffffffffda RBX: 00005649ac2886b0 RCX: 00007f8def3=
1a7b9
[   14.006448] RDX: 0000000000000004 RSI: 00007f8def06344d RDI: 00000000000=
0002b
[   14.006448] RBP: 0000000000000004 R08: 0000000000000000 R09: 00005649ac1=
4a000
[   14.006449] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f8def0=
6344d
[   14.006449] R13: 0000000000020000 R14: 00005649ac27c980 R15: 00000000000=
00000
[   14.006450]  </TASK>
[   14.006451] ---[ end trace 0000000000000000 ]---
[   14.006493] Intel CVS driver i2c-INTC10DE:00: find_oem_prod_id: ACPI met=
hod OPID not found
[   14.012483] ov08x40 i2c-OVTI08F4:00: supply dovdd not found, using dummy=
 regulator
[   14.013736] ov08x40 i2c-OVTI08F4:00: supply avdd not found, using dummy =
regulator
[   14.013926] ov08x40 i2c-OVTI08F4:00: supply dvdd not found, using dummy =
regulator
[   14.014064] Intel CVS driver i2c-INTC10DE:00: magic number in dev respon=
se not supported
[   14.014066] Intel CVS driver i2c-INTC10DE:00: cvs_find_magic_num_support=
:Device protocol is 1.0
[   14.022987] intel-ipu7 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE

The warning at kernel/irq/manage.c:1502 (v7.1.3) is:

	/*
	 * IRQF_ONESHOT means the interrupt source in the IRQ chip will be
	 * masked until the threaded handled is done. If there is no thread
	 * handler then it makes no sense to have IRQF_ONESHOT.
	 */
	WARN_ON_ONCE(new->flags & IRQF_ONESHOT && !new->thread_fn);

The standalone vision-drivers tree requests the wake IRQ with a hardirq
handler and no thread function (drivers/misc/icvs/intel_cvs.c, cvs_init()):

	ret =3D devm_request_irq(icvs->dev, icvs->irq, cvs_irq_handler,
			       IRQF_ONESHOT | IRQF_NO_SUSPEND,
			       dev_name(icvs->dev), icvs);

devm_request_irq() passes thread_fn =3D NULL, so IRQF_ONESHOT trips the
WARN_ON_ONCE above.

The mainline driver is NOT affected: drivers/media/i2c/cvs/core.c:749
(as of v7.2-rc7) already does this correctly with a NULL primary
handler and a threaded handler:

	ret =3D devm_request_threaded_irq(dev, ctx->irq, NULL,
					cvs_irq_handler,
					IRQF_ONESHOT | IRQF_NO_SUSPEND,
					"cvs_wake", ctx);

Could the same fix be applied to the standalone/DKMS vision-drivers
tree (either switch to devm_request_threaded_irq() with a NULL primary
handler as in mainline, or drop IRQF_ONESHOT from the non-threaded
request)? That tree is what ships to users on pre-7.2 kernels, and
right now every boot on such systems is tainted by this splat.

My System information:

Hardware:  Dell Pro 14 Premium PA14250 (Lunar Lake), BIOS 2.13.4 05/20/2026
           CVS controller at ACPI i2c-INTC10DE:00, camera OV08X40
           (ACPI OVTI08F4) behind Intel IPU7 via Synaptics SVP7500
           USB-to-I2C bridge (usbio)
Kernel:    7.1.3+deb13-amd64, Debian 7.1.3-1~bpo13+1 (trixie-backports)
Modules:   intel_cvs from intel/vision-drivers DKMS; intel_ipu7 DKMS from
           intel/ipu7-drivers; in-tree usbio/i2c-usbio/gpio-usbio, ov08x40

Happy to test patches.
