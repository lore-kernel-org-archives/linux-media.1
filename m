Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.82
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244493;
	b=QjGOOzJzh8QRhef6KrYkxNHBHR46hIuWxJvQtGutgTcraU18+aLELzAn2ebP8Z1q+GI5
	 nGNagF9BoxebV3ZnuPNtG+w6io5z6vk+FbzfFHtJAQHegQVJzyMlctzJol2zmYEt6lz+n
	 La8oYKsgHKH3K1Givhkndv7xbY8MkHST3AC2mXNpMcEOsj2kV1L5pqBiU4YOj0COywhzf
	 MgjrMOzMhKNC+/VYdJxU7u+0kZZwY+Mwno4Hgu/Cl7TvipIjttb8MzNe/k6L/cf4kOSXd
	 C8VVOCmtV1PW9o0+O+Q93Q74WTOchn3PnjQFu7h5Qt/9ZvznSZMYh6bj2817WPdnaEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244493;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
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
	bh=y2/kzQrNyTwTgyUCqUSmim9urUqccLyozgMUuH+Qgfc=;
	b=w+IT65W7yocIi9sRLcr5Dw60pKq/rAMrpYB90ORH7JXQiUfDCLw6IUn5hDvu/hWrhzwc
	 bpc7ccrxz7bQ+rt22aQOciZZLLEEJHU35L+VVq8+hGrFmNOFa0YvryGYfJsT5D0pzBnAi
	 SLqjuWj3KCiCQ1dfA1oVGDD1uw9N8AMt81hdISXcsQDF+W4MhVlW5UqrczqPkaK7iuQOV
	 YGU5qgV1t8Pnr+a/vN7jQqxaag93dFAF4J2q8ogXiqOZN4BZaH23R8S67D0EjcP92ztcn
	 ousxdRsl0/ZRTin/Gwm66VDCmK7o1SJ6h6K8/+BmgccK045lvqhtz+LG1Sz+gIgZ2Wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.82
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021082.outbound.protection.outlook.com [40.107.57.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63209606A33F;
	Sat, 21 Nov 2026 07:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63209606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASwMJyp55kOKLbMdaFBjZvfgIK6TLnB0dUkFeb7g+FOjFc58miTUBtiETweFgIqRYVqylNlVqZlGaLcT+akFQYn5iv5F6axxaQXnBiBN/ojgfkXo8JLQNnuqHKu30AZ6zuCK/MvqPfxk+URaHSTfhWfEIRKyqhZ8nj7+d0rInlS4dbgcpxoM0xlG/eaAzYwksKV40ArbPxsif9OTo7fjz3RdAHZm1Fh+2yaaUUs6KYUdiYRl7sAawhKpXXMr3B/GiDAiLuxnbs2Ns4zNBvTWRz4pnreN/gnaZEa7EsoYQhGMp6gpHg6+lux3i/El4UExuQ1AxQpf5TdvAF/clvRNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2/kzQrNyTwTgyUCqUSmim9urUqccLyozgMUuH+Qgfc=;
 b=ON7kcuJybFuQcShwtPojNByHVyMrp7M7RJwOcAvvOIpfwTvI974+nNY92lPvUVobbFPz6odGPNa16sk0DOsWL2Rj9+NdD8rBth4yReJxlUFbTSXl+QYylCWPwNJ1UngVPUdPAQ89ttqBj07BK/tNR56m6bv8PziDWjCVgX5hozAknwUxuKSAjCQEsHib8vQr4JaA//WRVRlfj65qhfE30qriWPka/4u2sLtr7N47Ud4pV6fFPtHxDyr3TCtBHZKyJrqabVV8XyD7xchUDlCcTEhEIoICh85s+R/Gh/uT10qPBM/HRMItmiipUMbiUgsHYybYJayhGh4KfyWW5bpr/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB1492.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:01:31 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:01:31 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 02/15] media: i2c: os05b10: Rename vmax variable in VBLANK control
Date: Sat, 21 Nov 2026 12:30:52 +0530
Message-Id: <20261121070107.1768-3-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121070107.1768-1-tarang.raval@siliconsignals.io>
References: <20261121070107.1768-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-MS-Office365-Filtering-Correlation-Id: c7e786fb-46cb-44c6-e398-08df479d4591
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|22082099003|18002099003|56012099006|10067099003|261028144727099003|261026140227099003|261021121427099003|261102123227099003|261021123027099003|261022105027099003|261009223027099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 qMQKZn0LmnGaVbDyMlj3sl5UP1xQYwQS50jgmu96IhhTiXtsKgl7SLtAFGvymE/tCmYX2fXQt4yo9L0Gu0UCkmIjdr9qI2vcTLDRrud1JPpkeS5BRdq5HknShhnClSAhpWoWHI4bCrqYWB8JXxeIaEymaVvHqsGnIkKhXia2GFV9Nde0HXvd8VayvtTtxfIGCU71pEPzhHoYQfid6ub2Z5HObpjthx6TBU7RbBvvU7CJSu8i32MAJY3nZ8t0pyOnV2oExoV9dWnGN88p9dbM8VX+J4/DC3VM5iuhh0GyMd/n0tgH/2hOVXdIisyOwIxxAeolEPRESXkDgOBZfvcG3ZVLQGvpw4jNOFq06ioX2tRF3+uQBeop2rZbVfhQdqfMOfyoy8g0pvwjFNQVXZBHOfjq/ijqhYjxmFvA1sCHgXmZ5lk8qPjobw9doAs/kdMVVuHoGnMl8PZBoUobv726gdGvnDB0a6gJiX9fbAbh+EEG8qGPC/kjm/Uer2bVWZC4zwxWNWXvA/BHjtew9r/KF5TD/0wHorOECUoryOfSGU4DilQfIUVCYZg3trfDed0UUJHdFptRFFH58ewnqUQXWCKu1Z42AGFp+NFzJEcruXUME+zD/jOKCdsEDrN2Th/oZ9lWkTugVEDWuSErq2ob/Jt2c95GBPftCwLKpVQmvOl6mAM6rPJssoEWJ2qcZaVPuViluQG07KoV1bWqgzIEpGw6whaXwlzxuzS4XwXunvc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(261028144727099003)(261026140227099003)(261021121427099003)(261102123227099003)(261021123027099003)(261022105027099003)(261009223027099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?RyMwTQ1qjEkwKWEoOF5RtREorOT/fjqj34koQdKgTl7eW5Q9MRLQyi/Rc1PI?=
 =?us-ascii?Q?LdKnYs47PQXPUs3t3hC/XoHCNfNQu1ut4HfG9W+hpIkKwcGFulHuw/Wy6VUo?=
 =?us-ascii?Q?9orLL3BL45wmAq+MOaqxrq7APEvdQ0CAY/7KjywgD6s8v1Bpz9DWW0Wfx4Re?=
 =?us-ascii?Q?QCgd++DVPS/OhchhVL/uJWVYCWMoHWyBNTtwkG+fI+dAvIdvk1tW3KzncXmO?=
 =?us-ascii?Q?uBzmXIAeJ3BimVJhvevpZaaa+IHR/Akv1zlF/hGLukz7ry4GJ3DuKpGKC25L?=
 =?us-ascii?Q?/gr84ESxmlTZ+guDmL+fr9Ki7ypYymQ6/0JiWCA8yh2ZS+Lolv76F82PRD+n?=
 =?us-ascii?Q?0NYoyVUgfHoznlxVnPXCYnHffEV9sM0K3eMMOd4/iSKk9cQr6o2hQMMFcnYJ?=
 =?us-ascii?Q?C5bSxa8ibb1je6i+rZbDpLhSLLVZKTpLDIF2CwUh04yPMRZfH0lGMB2eq9R0?=
 =?us-ascii?Q?Cbjre/fqX8QdbCdbfdQfbzQhFDaB2PYPa2M3u8QTYdM86RG61JRX4haDPM77?=
 =?us-ascii?Q?Zvy6VRIJAx+RCjE1kIXxncuqHceBl9vrvzpW198Jy9PHaVx8MNhcnRSYeu9g?=
 =?us-ascii?Q?p15jZ3jH96wkwpq/mwL2tLhVtOrwtRjd2ndUwlVZ59Usy+I2JXj7ipu/yjPK?=
 =?us-ascii?Q?nN+nilJ+lPCkMbGJ2RvKjU7EgBFsRiVDhTt209GHYBDJbHCsYrLW8b3W0th+?=
 =?us-ascii?Q?x+SJfVE2WA5U/RfbdnMwEUQ/lOvxTLaQ1kgiTMdsWlPRLy4Xj2Uclx2MpV/S?=
 =?us-ascii?Q?MStOtyn6WDO7i7azm7Uaqf1uwrw/qYJrqOlQbLFf6BsRmUZnpjhYZua6DFjB?=
 =?us-ascii?Q?LSdas+8jUkSYYH6sxQTSwJkDUYM7c6asBnA5wPw7Q55EP3UEJdsoMfxENRLV?=
 =?us-ascii?Q?t7ZXoDf/4lr4GGkt1A9biVzrodcWkoOkGrzwG4RXuN9o++ZCDb2FU+4aZXQ+?=
 =?us-ascii?Q?udKdH5DaHGdpRRtvjJAd7HqMsSepA84Ugu+piEj9T7iyFLIYbvN+P0mLCvUQ?=
 =?us-ascii?Q?sD+eYS0JGc7K1Fin8fsmFKL9tkNnjwsqBXzI36d0Mamm/oRlndBMvgjYQJPb?=
 =?us-ascii?Q?SPC5I2nXBKXhBFkKd3Loaq1hz650I4sBONS+KpDVZ+qAuo+OhM/vTw2ONZSR?=
 =?us-ascii?Q?y5cWsxoXBWGfAvGw+pc/7xSeGaX/nitR/9Kt2wDLhuHZwznLZlVhJvdq2ZzZ?=
 =?us-ascii?Q?v0Cj+YUL1xHTUhZ3/7lbmqFBECuAJkJIlXIaHN+ShAM9Hcludnj3SL0W6wUF?=
 =?us-ascii?Q?cNblgGpiCoir71092dIEL763fvMxh2cb8MkBE4EvvjcM/BqYGm8bAWKU8hMV?=
 =?us-ascii?Q?dKOwh96KNjbGYpryIpsu+6u4wHIfGWyAtRguliZl27+rv5N9jhcWqSFzR0VJ?=
 =?us-ascii?Q?8X1nEj9nGaru+ahEK/AZJIOnnfGTO2kQMM6TFLGGNTZ2hsxC6gBjuudZl7WA?=
 =?us-ascii?Q?T6XjI3pWqJxju3RCWeHYiE6x4i4TiK/P69x4ZTg2UFX/weUt1QnXcxSWFbr8?=
 =?us-ascii?Q?P2/afLjRbW0wlRTynnsUlGdcWL9RlkMwRGnRQ0CzrDe1bLThkn3MOIt0sIxp?=
 =?us-ascii?Q?ZmcmAUp1arZI8nwaMfPEg8fP7999fOws7h4CuEzKONIa2Sj+wwjc82+L1Ws9?=
 =?us-ascii?Q?D03dLKiwIWvtBgJybr0XPKZPHNsDvB9RTSWLmFalKvP4xt+X46sVdtTy/VGC?=
 =?us-ascii?Q?g0RuAxPoEN3mP+mt3/iTAltqUuYmIfBRzvcjVEmWPYtxopo+WjBUiQFgIB9L?=
 =?us-ascii?Q?NvxOWJ4PNNhSIqdnm1ZT2zZ6UNoI/bo=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e786fb-46cb-44c6-e398-08df479d4591
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:01:31.3442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxfIcQtZRkwOpP35/rXsc5nEK/CQ3h243hqAsKmunhEhI/brZrAm7ZHUHcbasu1iQyEjyxJzJ0p6u3phy+2svD85DLKIv9iqjf0m9MZprJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1492

The VBLANK control programs the sensor VTS register. Rename the local
variable from vmax to vts to match the register meaning and improve
readability.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index d5f573b1614a..46246d297a44 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -477,7 +477,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 						     struct os05b10, handler);
 	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *fmt;
-	int vmax, ret;
+	int vts, ret;
 
 	state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
 	fmt = v4l2_subdev_state_get_format(state, 0);
@@ -499,8 +499,8 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
-		vmax = fmt->height + ctrl->val;
-		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vmax, NULL);
+		vts = fmt->height + ctrl->val;
+		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vts, NULL);
 		break;
 	case V4L2_CID_ANALOGUE_GAIN:
 		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_GAIN,
-- 
2.34.1

