Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021075.outbound.protection.outlook.com [40.107.51.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D3223708;
	Wed, 19 Aug 2026 12:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144238; cv=fail; b=TRKnop4Qgx4e/hRcqIbBhC/s5cUfzmRYZQn10Ev3TfTUAoYslREJwUOKQy46KMqDdnm5w6clW+QsDva1faKRBKOPFDh0vGL8g/kaAKu2rxSc3JkAFVq1J4Of1t1MuoDJNSAaSlUeMEW0SRrTqJ+Q8J8g2FCqbpfDFH/3Z4uoKmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144238; c=relaxed/simple;
	bh=5ZeiJWPlQRYR4tqCPFOXtw3UCy1DzzrLLH7V+dxyt3I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qr1J/0OEZsQyu5tgfsby76SgoIGTRRPW+dwNc027yg6lFXciLzJbUmZtIN4hIFcnSRhpl0rgXsYAy09YnGoIZmgxCLHP7nYiYUDwVT/J/AYXwlGzyZb2w8u16w1+GUJUkw+dP5Sopl15gDHgX5aVAp9eoH0yHEE1DgLIf1gJVwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=G1HipSaU reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.51.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="G1HipSaU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPjXngqfx79XYAvPTrWZwbcHP5kPg7EjDc+S43l7iJWOsrSTaQSnh4qzLDeiXuiA+qnH/oO9KTarvDrzRtfchTJTzYpE1jxL8f/o/PglGOMuy3kSdwwpDiyJ4WXm2mWAzIt1h+JHflLVLnKX22X3UDFio8w4APz+xHmjDlhLbGpoMI/CmbCkzAzFca9VcTCkqxPVGqiOpnj7LC0rwLNLTfTIZ/YruaAJKU8f1HvNFiCV7NVTmSdfkQeq4tSJN7drDMywgiv4JZRt8s3xdmSp0u+7gFtQSG0Q7erCi1rw51XIMVDuDCgEehGzLwo1U2qAJEyMH2AXp27dy2npk9U8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZ6MsJQQaAxS92hZsgzO2InvRmh8nTAWbTEd7cJgfdA=;
 b=czzioNrCVRCWyFlLax/7JJE2Z22tyEjmJI/0N5AEwqOKX/Q7areuAreqhd4+V8hV54ZZlZXr4rMHUscfty3pR621zQqyRyOjbq3gG2bEDbpXggtRd/Go7AbTLMqSYWVjIQcbkpuKBAY8wVIP/D4vpl+rQ09e3XXx3P25ISTmsxytI0bJ7uU29S6ekHdqdM/+mD42qDPFCQSPeq28uvOO8Ui8zcfh9MvQojQzWqEXBdCvaKct4gcVXy4x7AsjwZFviIDbHve4SQJ2LTQY3k4OUIPTdP6yEBHv8/dMEpanDmdfxrQrDkfuv7GdAFdHkU3lxA89ACJazpfx9N62gi9JhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZ6MsJQQaAxS92hZsgzO2InvRmh8nTAWbTEd7cJgfdA=;
 b=G1HipSaUvekqb70ndmSxerJlIDWvGcGJ49jPcYPFNgOrKTzgTbA+LJbRHpNLHm6z9tHLIc45Hc81AMhNujCQNXqKGKf8beTlgb/Y2kTbTzerkBLtXy7kQJj04tjQHQcZYOCJ8BpqllO2vJGcn1cU0IRnjCkgMdryHX6tr0Xe/5uoCponA7rxproy38jd3lRjxGo9Pk69lfRCGWRvfTiQ/9mXw3QXXuumSEJv6ael7wROToym4Y4wWkgxGgrbPvMAZRehqB7LwmRA2Tdnsm0zN2dLlg8o16hwH2P2+EcjdRHHDlFJbDapFkQU32L6HZlv2IhIOtXHw5NUER2diA/Njw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA0P287MB0458.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:c9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 12:57:12 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 12:57:11 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	tarang.raval@siliconsignals.io,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Kate Hsuan <hpa@redhat.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] media: i2c: Add imx576 camera sensor driver
Date: Wed, 19 Aug 2026 18:26:38 +0530
Message-Id: <20260819125647.68910-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0074.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::8) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MA0P287MB0458:EE_
X-MS-Office365-Filtering-Correlation-Id: f86e36cb-8957-4c83-4f6b-08defdf1622a
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|7416014|52116014|376014|1800799024|366016|38350700014|6133799003|3023799007|56012099006|10067099003|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info:
 tzlqv3t+ini8kGfizge4PMsZT6sAD3OQzcGorx8ZdsrYqQSoYQhGT3MD7mOX/yUg3QYIsaB8x9kusVt9xrpWvW9NSr1Twmd7ScSPv7xPPM6PN/CWDHIgVcbMN7MRnuO2Vw+Z2CgNT0Oof1BUShD896IosHSVQ637TDhkJQLwTl4LRqFtZM5s4omFkVdFH4L3hGA3MB8dYU0EkfrEZq5cMjP8sfUFODJyIqxf0Is/bcqdDSdnmcjVIvQs5W2uQn8Ytb8SQfIQjGYZmZ36b1S8exmayH4DcrsjXDiK4jCxn5rbtIKM2PYQCI/CcBFscfE4l8idYCZ5df05t8RNf3W3EM3R1qm+fWczd1KQErnElopemDpQC7b8XNcavajAkT/XlxaYZf3tMFxL9hx+ZnUusnGY9dgjLdO65bwR3GKGPwErJDFuArgHnf4kRZEdmBikb9cD/rebAw8AelddGPyukd0xIC34X7QbS/mBwwKNej8SYDO13vGsA5DWDnn5NcrBo4EX1XgStfJ0wwvN4C+G4jX8Xp1KjjvFeBsHN0BCaleZcfyk0e29t1/Iun5kRhPvMiu0RzGJ+EljG9+ojmjppBvLnFMheYMSdf+xQSfd+twV61UP2HwPzhke4oHsmlucgVwTfIdSlT2D7i+shndBNYOdB///BOSANw0T7kQN2lUFIKTG8h+cFOwGJk7um5dbtyEZWD1MhZduLsupW4pn6zQMj8yFN2QaU45dofiv9uA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(6133799003)(3023799007)(56012099006)(10067099003)(5023799004)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?BMqY8Z2/gJThabdrvmU/ac5/yD1YldoYFeLu9t63WikTq8vocVktnpB9P7TH?=
 =?us-ascii?Q?8Lgu2XkNzAje5v88dbIcst1feoTS+JTaaF4Mlaz32iQTa/seW+h0r18+eSJz?=
 =?us-ascii?Q?0KaTvpTxiV9wsFBEGyq59IALoHcLIv4SoaGJZGOfkjHGLQHdDd8/TO7RrYTX?=
 =?us-ascii?Q?s8HjN2PT4c3FITISnmNKhN6/R/tI1yO/PXrQLqFfWHuSHvlFFdD/wVukVGA8?=
 =?us-ascii?Q?TPDNol3PAnyAfLANwu3/fg6Wr/t5nRddjHcmoQhy3whTez9+6vz7DoTThuFr?=
 =?us-ascii?Q?9osybw+KoLulRCi+p+13qt+IVL8ggED3JF+tSZ31ENKtbf3FTcenSO0E3xhm?=
 =?us-ascii?Q?4lFv0QBIVmDdKpT3TVP9IfIuan6DuQ4xJntADwUFm4DdzRQEoIDhHNuVW7WX?=
 =?us-ascii?Q?UtzkOyvc6dw45CAgUbRHPamgKLN6YSJxbSn9G/giw4OttKrl8/FD3geVTqRK?=
 =?us-ascii?Q?GshnueI1MJtnuZDJnVRJTAxSJc4BE6yigTs53n3ves57fAXTjUt9/Q3UT5s7?=
 =?us-ascii?Q?dwQhQm/OvwLKuxBiPhKp9/WloE0kE1pX1QZqg2p9QY1ErZ7HPTNpaPA017IZ?=
 =?us-ascii?Q?FY6S4rH2nl85sXJ4YO2aLwswWjXau0OhGOdKBjaqmjwJTIXDg3oEDbb7RePQ?=
 =?us-ascii?Q?FkmUeeP0cII1/IOpnpiA+9A/HYiSdzoXNfNp/W928FrrS8leT/DbYsC57F3V?=
 =?us-ascii?Q?Vs9oIcln5AhP9nG+FkAbORQfp1UwPtkTHLe8/X97cBqW3kOBp2G5xKuW3+uZ?=
 =?us-ascii?Q?mM6GQOsxgfJu/6Nk5SqOzqHiUOjzVn83NYOxYbF7rG7VUYtxhq6akW5P9RJh?=
 =?us-ascii?Q?d7s+lhP7jOLyX11X9nOtkX7du1CYUqFiAulBCENmqs0LqXyGsfNvWnQsRCkx?=
 =?us-ascii?Q?oBnrCcMjv22zkFY/7Ba69PDDVGc4nWOZuuu+eZ0CyHJbTraZapzprEOyFChB?=
 =?us-ascii?Q?TwskvfcPTWObYDHPpSaFVjLK8RuXaM3RWzK4XVl0Hf3iEbpukOfPD1p39G94?=
 =?us-ascii?Q?6jUhhKHFlqGEhjsAOtI5e5AHgZ5wDm3042Qkd29cUTKSM9TBz6uMLj+ot3RG?=
 =?us-ascii?Q?xODA24rmrbI8FJFFsfWn72+8+8YryaRg4CXNTP05sXHkilhHuU97F7jCWyww?=
 =?us-ascii?Q?4Flp4ybVmERZ0Dup7RhgprNHH/aLdfh/6zIikCBl4htWa1BZokldRGLLScem?=
 =?us-ascii?Q?rasQcWBSEEOKII0MZr3uFD06gvkb830xFebWFuQMZ+Qk15S9uUFL0jJaSsli?=
 =?us-ascii?Q?GhxLHpZMhgYP3gMafv8bI7qtYbGVdH9209E7kQazUHWhVoDHPtfqwFDPTVjC?=
 =?us-ascii?Q?vpiBoL94sko5RZA1ksKzWbo1RY1qSSRpByuKRQYX7L45lufeYTRWQKjJfhmd?=
 =?us-ascii?Q?/iXSREkyOJbm6z58bO++or+3YRjgc2t6+QhChRIDPtqQPDJoK5AprlvndV/D?=
 =?us-ascii?Q?dXNFSG7qTHS9kL4QQaIc0h3ZVK4sX/SfKuHznn8iAdWrRU92jFe39nqm8mHl?=
 =?us-ascii?Q?qgHanNyLb0fbVOLyW+mIyHk9dss/ykxUe8AJx4WwQXp/EkSRcnflvbYvp2Ta?=
 =?us-ascii?Q?WU9UihzTiYy73Z4CuBJ8fGpmcg0piVtWN84SqE3jfAItko5SLIA7UocF4VnO?=
 =?us-ascii?Q?La9rWhaF2VvEHPF1gV7xgIf9TJjbd8b5UHVIOAshlq+iPEZQu3+ZnM7vQ5Ya?=
 =?us-ascii?Q?xI2gPeT1DMMLThGcIls0vKTM5wOz0V3PbFBw63yiY2XJew2e5OyKJ1DV938Y?=
 =?us-ascii?Q?P8qSruJcG6YuPwi8V/pW0+LsEBr0ZtNuLpX5Hvxx/zBBnJBf6ePx?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: f86e36cb-8957-4c83-4f6b-08defdf1622a
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 12:57:11.0409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQb0AZI7GCaESwqXF5CfyhP7+Z0MLI6ZHzeKtJr7KGLTvRccy5q9I60GaBYrOAeYjjFmwZLYG6ZdcPVvDfH5sVim5nO1fBKYtNW6vd5LwDNKQFAYcSVdVKzfPBFVe/GO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0458

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- Supported resolution: 5760 x 4312 30fps (SRGGB10)

This series depends on the SM6350 CAMSS support series
https://lore.kernel.org/linux-arm-msm/20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com/

The driver has been tested on the mainline v7.0-rc6 kernel on the Fairphone 4 running postmarketOS.

fairphone-fp4:~$ v4l2-compliance -d /dev/v4l-subdev21
v4l2-compliance 1.32.0, 64 bits, 64-bit time_t

Compliance test for device /dev/v4l-subdev21:

Driver Info:
	Driver version   : 7.0.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which
Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev21 open: OK
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
	Standard Controls: 12 Private Controls: 0

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
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for device /dev/v4l-subdev21: 46, Succeeded: 46, Failed: 0, Warnings: 0


V3 -> V4

In Patch 2/3
- Use CCS-supported registers.
- Add corresponding CCS PLL calculations.
- Remove registers already defined in ccs-regs.h.
- Add more link frequencies support.

- Dropped Patch 3/3 as per review, will push it after the binding lands in mainline/linux-next.


V2 -> V3

In Patch 1/3
- Added required endpoint

In Patch 2/3
- Change the capturing to full active-area of 5760x4312, up to 30fps.
- Replace mode table with imx576_program_window().
- Added DT-configurable link frequency with PLL parameters.

In Patch 3/3
- Replace the hardcoded orientation <0> with <MEDIA_ORIENTATION_FRONT>.


V1 -> V2

In Patch 1/3
- Rename regulator supplies to (vana, vdig, vif).

In Patch 2/3
- Rename link_freq array to avoid confusion with the link_freq control.
- Use IMX576_EXPOSURE_STEP in exposure control range update.
- Make cci_write() error handling consistent.
- Return imx576_set_pad_format() result instead of return 0.
- Initialize link_freq_index before creating the link frequency control.
- Replace dev_err() with dev_err_probe().
- Remove redundant comment.

In Patch 3/3
- Added the remaining supplies CSIPHYs (0-3).
- Add comment for camera orientation property.
- Move cam_mclk1_default{..} pinctrl definition to SoC SM6350 dtsi.


Hardevsinh Palaniya (1):
  dt-bindings: media: i2c: Add imx576 sensor

Himanshu Bhavani (1):
  media: i2c: add imx576 image sensor driver

 .../bindings/media/i2c/sony,imx576.yaml       |  114 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx576.c                    | 1103 +++++++++++++++++
 5 files changed, 1236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
 create mode 100644 drivers/media/i2c/imx576.c

--
2.34.1

