Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.109
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445715;
	b=RO60hifFpZr95CwiHOc/lx1ZY3HNDyYeU10TAzd98rb11sBGxCbVlp6p5gXxeqD7dXEP
	 IyARNfjbutm68ALzhXkktldPrfJD3T2TLcNQfev64JRakwydTbzlIRPOjpdDd00biByi9
	 XS4hiDH9QucsyQartB6THzoF61CcbGRByyb0O9v8HZ3ho4DoYy/ltDp8BbmVdImw2kFuw
	 bpGOTqa4XzUOMBMU8zGDbBcsiSyEyDXNQ8QkppCPtR6IT8IR/PZgVInReqXSA5/XX47uy
	 VhzJY5A2m6bCbJ5TO1ms9YwxmbhQb/47laRwyrBPM47G75IzuHu/msTuXyEWnDVnM+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445715;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=l2taCXCD9bdO3YEA+EqKbY07b1XZPPrX/WZSxS4/dWE=;
	b=O2eKLhXKB9HYrX3yvHdHINdzEdAS49H6xtvZZfgmmw7w3EWIMawUkoGGSsuCLVzysbp/
	 /aPX5yiQ1QqCp8daGe7rPL9xxsSiYtNPkvOoAQ6+L38Np18LAATCYV8QCy621IP+FGYEf
	 R5v3dW/Rz6R0AW1xuZDttb/mWQT/4hM49yOKMNgyCkqhzcOBHkoUUPZ5qoGAAlN1qGmFL
	 ddsx13O63wGTNJPlV4P6kfdppGpMi9h7lGRMIPUmmXeGyzBbUqpYgv2fA4DMYf9bb0tEl
	 plavJBNb8pAF5990t6VXzCmFgkabmZquM15B1lNyzZd6bHaTVEtCItwvv4+Op3FLh1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.109
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021109.outbound.protection.outlook.com [40.107.51.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A15606B080;
	Mon, 23 Nov 2026 14:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8A15606B080
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xsfXNJ3X9fSY28iiHmaVmDh4CFeJJ8yHGKhacsn2pp80vGf3NR/64bbFrfafefR24EaH71wiKtaYi8bgS8y8QiAG8nciZqT4n354mAw8QLApPgh71My8XGC4aiuRvyAQTNupkREMc14ZMi3uSBqiHbKWXBGfqfXdp/MI6HgAkBdyFGN5iLVOqlEHKUMFkOevbosqGctuYqGiqNrQB9jGycoHfke6EbgdPZrZfS59lR0zRnmulB2tVcvV80KsK1d49Xic2QWGmqrkuI9kYhXyOOrAo8cibsMujM6D9WrSSMTytOfgbFUCTyuyM+M/1apxmR5XpB/+FgU/3k5cEjoRew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2taCXCD9bdO3YEA+EqKbY07b1XZPPrX/WZSxS4/dWE=;
 b=EujsUKkGSHqGQDficOmX3fMXB1m3BVtJaEurFRiL2V2Ujode6nV9XZBHEg97Fg/kyh6tuwgSvTN78CxEcbEVmTu/t8TiUEmRSkAL9L6WqSeK9gHAQ+HICCkaDV7imIKH39/+YHbV9c1qQdBk+15IGvCZTSWJbjXwbXMUmnbOx4giPOiAM6+rQJjIK0bqiE/YPANjnz7zx18dZf1h3pP6qLi4SHFa4zxfEEKVHHRxh1Hh5VaoaxRjobwfgXObJsQSbXYhomOX6AnMqMpuOFB+zNjEcpM0nVVTNQ5zsRWPVXLQacPbsv1k3RwGVKn6SL9l5X4ODkA1UJiSf3qe0YI+Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PNWP287MB5428.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:320::14)
 by PNZP287MB4106.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:282::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 14:55:09 +0000
Received: from PNWP287MB5428.INDP287.PROD.OUTLOOK.COM
 ([fe80::13c8:b6b8:e4e6:ddf3]) by PNWP287MB5428.INDP287.PROD.OUTLOOK.COM
 ([fe80::13c8:b6b8:e4e6:ddf3%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 14:55:08 +0000
From: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
To:
Cc: tarang.raval@siliconsignals.io,
	sakari.ailus@linux.intel.com,
	Bhavin Sharma <bhavin.sharma@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Hermes Wu <Hermes.wu@ite.com.tw>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: i2c: Add os05e10 camera sensor driver
Date: Mon, 23 Nov 2026 20:24:36 +0530
Message-Id: <20261123145445.66636-1-bhavin.sharma@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::9) To PNWP287MB5428.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:320::14)
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
X-MS-TrafficTypeDiagnostic: PNWP287MB5428:EE_|PNZP287MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: c04c563a-9984-4df6-3e14-08df4971c476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|23010399003|18002099003|6133799003|3023799007|56012099006|5023799004|261009223027099003|261028144727099003|261102123227099003|261026140227099003|261022115727099003|261026121527099003|261022075727099003|261022105027099003|261021121427099003|261022113327099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	aVhkrjoVedxiXQslMvOxa3Bq+smwQ1+Jsn6ccbYDwpLwQT+fFCn2anzjXb+EcRsRh7JGi1zJIEAHiUZS4XFAUnf/ax4elXjpLYPNoP8N+hPsAAqAmFxErmdA8qshvCBa7sCXF9ldzugfvHUHhD5iFR3rzXhlHLfkQadz0r87Dra2W7WKsMXfzbonBxlx8KCO9PBD3FQ+eOdKrnKt+71uCK4rS4ljhcS67eyKYSiMw0X17YRiQiftmlLjrTdfjIAZHEjN8qeu112h3HXlzTNjowuRERLNYs9k9EL0Up7IbostW8zLY6TiiVcyViwC2qc0zBXABY4zaW5JuYM0pN9dZP0SMB7cfJFLlASFyhWHRi+TXneUfXVuqQRGT93GoUHJAScr96tQxlmBtuG7gJgLL9fGj7Fz+JeUbb+8DdIsAiuYMzhOS0P+fW8cD7zenfH1JV4QbN4XQNK2vKltN4iPjsL8blVrruOtC5MSZ3CAxT52jZOSmg8qRnuuiNdxhSG4+unlCs9gNwYwGphGpds7xuUvpWI0Y5ByOdoqRAUBB0S/ys5jMCZsdRuhp0soGHFn6DgAIzlL9k0msNV5CN6N4t7wD6yE135+llCLRLKlROAcXDpsEapL1OXzUPSKLJS8NozMEzzwuX1uP2wmV9YZ4ZFCLJo7aBajznhyrPXS0fl2CJLN5j/cYY4cFTj5epHuG0OC2Fw1xgpJygQZFxnpUYQ+BNsiNR+dUGXLzc5mGqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNWP287MB5428.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(23010399003)(18002099003)(6133799003)(3023799007)(56012099006)(5023799004)(261009223027099003)(261028144727099003)(261102123227099003)(261026140227099003)(261022115727099003)(261026121527099003)(261022075727099003)(261022105027099003)(261021121427099003)(261022113327099003)(38350700014)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xNR+bqLWa3SOjjAQiCmVI+zgyKuhnrzLC5ZnsU2S/6aI2lPTn2W8Ns8BhOoh?=
 =?us-ascii?Q?OjLxMSeu+ITMP7gUyIaXdFsiDUR/GfcwBxqrSxxDrJtoWIdxyy2gZsyaJ4Y2?=
 =?us-ascii?Q?CQ/XnlDCWvtjSik6xyi8mQDQJzXiT6zPBsxitfRsyeCJvZu84sJdjjCHgPX9?=
 =?us-ascii?Q?9q/ThtmyXoq6yBLaThWZpnZdnhZ5x9BZ8xcDc+10mB8Ka22JX55TlfNJ/wPm?=
 =?us-ascii?Q?QQTyu10r1tgGpNXJ0/VKvpoxgZwLZcnM52vUWDvgkbPWqkq0OY9dsLrC0Xtc?=
 =?us-ascii?Q?8DRbWiwBN3qkZRBLFSo8m8EQhcQQpUp9C0roxj1F6EKShzXLeImfVeGzhTmo?=
 =?us-ascii?Q?ZR5L0hEkftskXsU8LKle5D+A2LJ95ZTk5MyJF5u33/ttw108ab7Ay3b7XOns?=
 =?us-ascii?Q?1ZNW62w4+L7NPpNhBpnGKkAsCjqULJBBvzSccyHUOND37AIck4oWURM7KFyX?=
 =?us-ascii?Q?24DNUOqdGPBQBs22qMW+ysK0BpQfge0T/U1X17g4fm+lmiCmqHALHj4TKCfJ?=
 =?us-ascii?Q?leY6UrwtCz2zOHJz5+ZVojoKZpIf9IGt2c3pXCZGnqwmvO3bCDAFmq7d0LWh?=
 =?us-ascii?Q?u+1UdZkmKbHyjdA0A/CvLJT9UbTyXxuJnp7YMlKm56s83fk9ab7/Ck79l+tR?=
 =?us-ascii?Q?kG9+3I2W+EjKOq18sBP+E126l8WmRkip/qetDGK23UmqnLCqvEiEOuMyu7u/?=
 =?us-ascii?Q?Sq6bMsbeEvRX2BlahyxKiJcNiOC/qL7d/x7O7m9Wso76aNZgDgCgE/U3YPFm?=
 =?us-ascii?Q?tBa2r9DMYmpVFER7oSYYM4UVtTPS2nP5pzDHpbyj+IxWxHxPpTdyb87ZI5Gm?=
 =?us-ascii?Q?xneNlnio8Qy89DaSswTKQ+CYvuRsF/lbFG9sRNvQcrRHPfbyOursGZBldRyi?=
 =?us-ascii?Q?1ZX17xZF3FYGrsuveXyu4W5ErCpOKUhVuNVYQLa+VjdzZTIGAz7O+m06OeuY?=
 =?us-ascii?Q?k1ep6T8byQHSoRCX8DE1kUxg9YnQWXQJhiLcn9YKMjRkpQTEWnUSBT5Y9+eS?=
 =?us-ascii?Q?/ghs9r1DYWwuunVJeFj1vUhWFEll38UqqgkcamHJpUwTvN3QModrA3gi/ZLv?=
 =?us-ascii?Q?wm2bIQv0pZZzkUXOLK29pM0CBqQ+9pVhImNXKtgRGEYsBmxAMuELoEOBLJx0?=
 =?us-ascii?Q?E2J4dY/iGresEeObs6iG6lqSmy252Bkuzl61FWhE2O4ozXVhKHVhWqi7sm1O?=
 =?us-ascii?Q?wE8qdG3DC8760g8f48tsc/iYU0RUebufDMURTuPNSRSIahgdXmpXbCy6t0dD?=
 =?us-ascii?Q?Xvr7ea7k9gIBQy/7ZxvOiiyMRvEneG/wdlkTuJjLyy/Q58dZLyJeapwIuugS?=
 =?us-ascii?Q?D9VLjVZFIrmnj7BfsTkdkEdyTfao07gd//zyFGpAhhFcLjbN5LsPqYYuOOhT?=
 =?us-ascii?Q?ADUgHbpcizDO9ixbf5eqU3Wg2uoYDF1KhLWksIzhtz4T9PtN7T/oJBMiWLqZ?=
 =?us-ascii?Q?DlkGOZxjTCzJLVbLlSOKCx7ecPrNyvaRlaUcs65H0arkCUCH9jiMtYm6EVAe?=
 =?us-ascii?Q?CTh/JIXa7VXgsUntLr3d45tZVJvnUuOIQR+gx3JexupQsI7R4ljShuHMLrnx?=
 =?us-ascii?Q?7Qp6yAhuyQgCq7RyDFf1yfPIz5cXIpstmw7MRoYF1GyDySD8meOPM91/7cxB?=
 =?us-ascii?Q?IzkFmZ+o0lH2oVj/FcyU2UneIgL17gsOgl+x7EnJ11iz5XvdFEVpQQyAUiAf?=
 =?us-ascii?Q?pCgeykjtWSqjPkO+wy6UHoS+y9WmwdtagBgHCw6d5rnQBuONT1+8AgMzUI3G?=
 =?us-ascii?Q?QY4Edmq/TRzareIY/IvpJkkXFE421hM=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c04c563a-9984-4df6-3e14-08df4971c476
X-MS-Exchange-CrossTenant-AuthSource: PNWP287MB5428.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 14:55:08.7613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rj0YjG/lwVlhdhB0FW4u8u6IRtkosVvif8cfpxAg5URJodUfhhTEUZCPPEjkYgIAU7mG46k2e1mODVmI8L9OvnXXBGOzVTGa0iOkTXZ5kYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZP287MB4106

The following features are supported:
- Manual exposure an gain control support.
- vblank control support.
- mode support 2592 x 1944 @ 60 fps, SBGGR10

The driver is tested on mainline branch v7.3.0-rc6 on IMX8MP Verdin Toradex.

root@verdin-imx8mp-15445880:~# v4l2-compliance -d /dev/v4l-subdev3
v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev3:

Driver Info:
	Driver version   : 7.3.0
	Capabilities     : 0x00000000

Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev3 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 9 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev3: 44, Succeeded: 44, Failed: 0, Warnings: 0

Bhavin Sharma (1):
  media: i2c: add os05e10 image sensor driver

Elgin Perumbilly (1):
  dt-bindings: media: i2c: Add os05e10 sensor

 .../bindings/media/i2c/ovti,os05e10.yaml      | 103 ++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/os05e10.c                   | 969 ++++++++++++++++++
 5 files changed, 1091 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05e10.yaml
 create mode 100644 drivers/media/i2c/os05e10.c

--
2.34.1

