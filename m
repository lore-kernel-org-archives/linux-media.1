Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.91
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244520;
	b=vcIBl3hznvZNLvpvHnP0lXCEoBh+z71u2nnzkMa9+zuCh0LtxOJmPRSgDeRmi1ywx2El
	 oBDXDHhXVSuwkZhRZZA1e9srvPKj5/vl9Gmk6JlSV+C7bcrbk8ua4LzugkWR1P0rYLHIq
	 QqrAI4xplLl4BmHZK4DwPRBrjpQT4wVWSIUps0EO5ncZlDj/9VaDVijBA5gcPVRRCjT33
	 NryC5aUio7ZV/+Q9MCkHr0OhLM24Fw2S4xlRjV8B0I7gFaI476jhtLoJQtp8dbiQwwm/u
	 TzhEdMiFi+sxEjjQMuEVcVJNCUXTnAoTU082XJnSEJsrGilnMDhBA8mg6eCwlH/fKJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244520;
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
	bh=mXTXoWEM8qzzLmAJwE80emmC4940ZTNtqVhJPLTTyKs=;
	b=XIdDVk5amIrqcoiavxxGSEmhpm3bGk0+zFdTw4kFZwMTBGwGmE6ff8Wgqs8nTfT5NnVH
	 Lwj62bNWxDG9fh9Gw+R8l2Ur1TPNVmeAzJrKJL6INcvYe1/UQ21BK/Xe2qi8j9MPFvH4E
	 wgvm50gT988oYYRKpzhA605TXWAsd0592ahSs9XV2U8stVoM96l6S7pOEonCqVsyjUvbi
	 5Jk+Qm81usvMCUalJ7DVj96MvOb4XitSaYxmkkD144wHfjxfxdf3iLpDzkw6bV7EuJTWk
	 qXs9JJpwlZVPQqn04aQOcAGiMJQqXv3Eu11I0Tr8gRAORINcvYXLUYduf9XGMqvGQhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.91
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021091.outbound.protection.outlook.com [40.107.57.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3F2606A33B;
	Sat, 21 Nov 2026 07:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A3F2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJRk3fP/XEU5P8/Om8m9KV2I70a0TOxiZpCT1YPlZ/1itKH/DxEJGGs10dCjrUglQBMkrEPy57dm+Nq0hECgjMlDk8ywY9lRIhrhfbeDrl1CVDfiPrcmHPX0PIvkLdnZD2+msACv6fIgTxAhQQjlb7Qe08zAoC+xWQ5AaAtMI11XZkOBXlphTzK3t6LrXYrUtuYGnGARxobMIYU4SJojJHaqJKrM3HevG6PWMwXTtppF9DG6WqEovKwkA33RVcy1/qL2rrc//InfGUbN1thgXjGHyH3e49ygekMi/z/ZuqIYtbCSEuExO1qm4Q24i+fTpMPWDKnFQ6xO/wQWGdPZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXTXoWEM8qzzLmAJwE80emmC4940ZTNtqVhJPLTTyKs=;
 b=bs2T1DHjPeKO6bJn5KHx8sI81uuINv7lZNbNwa9+Ec/ibVALA49O4EwEgv8KdibHiExLyX6hkWoA1xE2feEJG3E+R5hUPE65uS44zeNW6WadKqD/rJ4C/3zuOBO8VpYaCekGuU4Y8cEFPqMptuwy05RPtglT9Q8Tztovl2RLnB10nvRMCqqea7djEV8oAMkAixmDe+SM3IOspQ0XJzCkKbAZL8UV/kVPf2H0UOJT/vsRvNiXIEpJ3J+6qyXyBcDfOEEVVJL/t85/2Z+ZsNLb5Qh31RdGGGsWfNXOBOkI+3LlNPyInH6b5up8ZNMhZXsONQznJyIbGf2YawC02bMAuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1768.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:01:56 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:01:56 +0000
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
Subject: [PATCH v6 13/15] media: i2c: os05b10: keep exposure default in sync with the active mode on VBLANK changes
Date: Sat, 21 Nov 2026 12:31:03 +0530
Message-Id: <20261121070107.1768-14-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB1768:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d1684f-2562-4279-76e0-08df479d54cb
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|38350700014|10067099003|56012099006|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261028144727099003|261026140227099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 2nVERoWFiEQu5I5iHi9842y8t9VkJswZjib55MVpJdkPlCX0bpgmWMBcvN7PWZosfSHQ67f2UBk9s9eXE1mXX11vhIr4zsE80JaRqM7J6civTXZ0yDsJ8tIuL+bf6C7YR7K3kL0GTiO5/gaOL1Z6+mAzphI0WxIcdKeImPzj8JlKr/j/CQ/os3iV6xgzPhG+XXhRjCoUSjm7LhtUC7Bs0d0slqO054Sc0+H83y2vVzfoJyz+NqqtumLNkw3ovhEr8LTiFpgBtBg1hZWEXbiya+mKBeSW4rQ/DGbRU5sHMMd1jI3MAPjEwqlWZTWY75m8m/EGBWu7m+o9P2hVMZchOKZjpRKYRvEE0bXgW7ZTpM2dn5o13mr36VxApSRx8y41C4ZO/1OqpQzVuKPJ8KgrtlVIlMjZCSmtPbalBUqaoIoRExgqTXpauVAh+N2ZKPZsWhDRNwCC35Gm92nvlYPszvwRdwJYJqDqq7OuR8bWqSJLRqvTiOMpGlE3JR9qnm9aZ7zfqsv4FRsa5lV8zitiTpxP2/WptjUz/aFJHoMXLhW1GgTQ78gAhsm84o/vjYY1ZC1Z7iOyjq9nHGfFJUj4o2xjP391NAnsOOfy61om6MFqussfru8Xzf6uL2T7P58tNPPkuP3dHRCqYa38H1p7lf8+VSPs45MpOLVkEu3M1ueRO5BlD2uum9J4LbDaqcl20kt55JnZ9PKV7cvI6F0N7+UX4a5gpvEdVfi7s+roTC4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(38350700014)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261028144727099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?pJaOaaNFqALL/ssKnGWw0J9ID/Q9ri1+v7WVvsRxXGLaMN3t8EFNR3DF4Ha6?=
 =?us-ascii?Q?5/YYNhFPZzdQXvGyNI8qIR8iwVYYhcCGBtEA5nGF+R8dQHTxkZ8cAT6A0Eqh?=
 =?us-ascii?Q?tGz5Vc6I0cyKQE3fsvbqjPHgRfjqZLK+KNdDtJShRVeF1LFXcmLcZsTP0dJA?=
 =?us-ascii?Q?DqoFiEIqIqZfWaEFChh1lwcNOnTgXzrEeoQ1+7GnobH7p9PkWCUI3RR/u3BE?=
 =?us-ascii?Q?K3TBGdrQzZL1SweqMCUDaJPj5JQ+ZxVpdovvNPOUg4+6crUiJQ5mTgGSSlhh?=
 =?us-ascii?Q?Led/+FWf6ikGJ43qjFtEka7dHmbny6dz8UpYnVyHULA2Xo16Wl4NxjlCAqod?=
 =?us-ascii?Q?zGrTS2C7GY4590OAGvr+rLd07HAncHpCukB10Z725w740zBwR3RoKDygzv1Y?=
 =?us-ascii?Q?ZHlsggCz3yX3gmethfWnAzpJ52CDSlVSNEuxBZC6vjuNr56iNv1KQ3VwAhuq?=
 =?us-ascii?Q?4LDrOZO82lqJLAHG4OE+o9Wjo/JMcdBIoM5Umw45wMwN2DjdK6FVWP5B62E6?=
 =?us-ascii?Q?TgGVjLUdY4w7sjyw8oOCAte4KVEVwquHVPfcZTKWggshBtx5EPY46QKWGnvj?=
 =?us-ascii?Q?sRPifST4v6K1bzfBeigRioOtXq2GUkIQL/UP8pEnzN5TVtecvp6RwgzULRC9?=
 =?us-ascii?Q?6ZtUs/QNrMfeK74O1Czl34PWTukXEyv4W9b3X3E8LeIduFavfWH1Y7OFxVdE?=
 =?us-ascii?Q?iKh00Ft7lhxxxcdpSqLcYNRZKJj5P8AZmB+wCTySSYPLe5iscjYyoX250HB2?=
 =?us-ascii?Q?//PNO3ImWRCKrVfIigN48QU7uYVgsKl0koIm/yis23xsEAQU/T9UmdHyuTKi?=
 =?us-ascii?Q?P+u4lI1dDQGxAMLHNqp0hGXbhIjZpSWe0MXATaQ61FiEDj4ZUmXo7kSGHhr5?=
 =?us-ascii?Q?DBGqevYGZfn/s2OIXMvTuGakU77Dnbu8s3bXHZQqf8awtxOaSCdp2aIVjeET?=
 =?us-ascii?Q?Q0NivTx8mU6hkup5MNfOXAZpV33ID2Q6G1JLwoEVFQh42uXTN/x2b10op3dG?=
 =?us-ascii?Q?PnAM1XEjyA4dojxGyygR9TProqyZpWAG3UNsmlpOH3GTWb5zp4JgGa7AHgVo?=
 =?us-ascii?Q?1rqEfD9q8FeHZuuxPHS5bkI8VLrMSPPFwrj37Gjw/Mx0ZF/p8Up9TINpSWEx?=
 =?us-ascii?Q?7jTqU4IA6QCb9Tuf1JIQSKTK/0a/cR3jo3V4JxfxykAdrQESjmb/6xzMtQq3?=
 =?us-ascii?Q?KxN1bVBmRf3aA8G0e9FBSddHrpjQLhtMgUF94ezhbk6X9zRYb6YgMsMQityQ?=
 =?us-ascii?Q?HDbK0TmQ1nrpaZK09n9eSo+3R79NBQxoG6zu9JjTh5AyOs8GyuKM9kZHTnaw?=
 =?us-ascii?Q?B2RBc5n22PYsmn/HUBF7ZAFhF78W7tNZlAE915qiepGbExh9OSe1E48TPiKJ?=
 =?us-ascii?Q?fkKXfwd7fceUuqIBWoYUm7hL+CZlwV/WisdquUq+9/orw3ODwvnZoXDOE8ED?=
 =?us-ascii?Q?lKbcTNo1PrcZUjhLPy4X9yHvOX4xg7DbTbKM55nS/dbKzxgNVYyi8Fl7OjRo?=
 =?us-ascii?Q?99WVGEUWDjDeX6+z59Z59t+0aoBlT3vPyZrE7VQtpxYcnnS3a4p+x4Gv7Jxv?=
 =?us-ascii?Q?v5lnBvc2IUfCN8scgDm70vbWDRFCXlSEZq+/JfFAv2/f0sSGPP9ODobhf//O?=
 =?us-ascii?Q?9aDM14RWpRSBweAl37iqh7HpD/qsxB/uxL4NRZO2UYL6jFq/Vxsjt5UXIlxl?=
 =?us-ascii?Q?ZpT5l7wlEitxxX5dNl8QUQA25Q45rUk1+gh7QgcBtF7dXlq1Kawe58fW9AEt?=
 =?us-ascii?Q?nSpmREBGlOTof0QhTkwKzt3NV1DG1FQ=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d1684f-2562-4279-76e0-08df479d54cb
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:01:56.8846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bEcbogx1K8aptCndDHob4dzEy2ZQx3rxomOuBNuzme2UGHhKRASzCSlefw4kW15DdO187xxrsWiQ2GNcJ6wQQWCSE0arB9FLY2xpcsNmM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1768

Update vblank through the control path on mode changes so exposure
limits and default values are recalculated consistently from the
active mode.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 895acfa04c7d..c03738d20a2b 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -16,6 +16,7 @@
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -751,13 +752,23 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
 						     struct os05b10, handler);
+	const struct os05b10_mode *mode_list;
 	struct v4l2_subdev_state *state;
+	const struct os05b10_mode *mode;
 	struct v4l2_mbus_framefmt *fmt;
+	unsigned int num_modes;
 	int vts, ret;
 
 	state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
 	fmt = v4l2_subdev_state_get_format(state, 0);
 
+	ret = get_mode_table(os05b10, fmt->code, &mode_list, &num_modes);
+	if (ret)
+		return ret;
+
+	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
+				      fmt->width, fmt->height);
+
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		/* Honour the VBLANK limits when setting exposure. */
 		s64 max = fmt->height + ctrl->val - OS05B10_EXPOSURE_MARGIN;
@@ -765,7 +776,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = __v4l2_ctrl_modify_range(os05b10->exposure,
 					       os05b10->exposure->minimum, max,
 					       os05b10->exposure->step,
-					       os05b10->exposure->default_value);
+					       min_t(s64, mode->exp, max));
 		if (ret)
 			return ret;
 	}
@@ -851,15 +862,19 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 
 	vblank = mode->vts - mode->height;
 	vblank_max = OS05B10_VTS_MAX - mode->height;
-	ret = __v4l2_ctrl_modify_range(os05b10->vblank, 0, vblank_max, 1,
+	ret = __v4l2_ctrl_modify_range(os05b10->vblank, vblank, vblank_max, 1,
 				       vblank);
 	if (ret)
 		return ret;
 
 	max_exp = mode->vts - OS05B10_EXPOSURE_MARGIN;
-	return __v4l2_ctrl_modify_range(os05b10->exposure,
-					OS05B10_EXPOSURE_MIN, max_exp,
-					OS05B10_EXPOSURE_STEP, mode->exp);
+	ret = __v4l2_ctrl_modify_range(os05b10->exposure,
+				       OS05B10_EXPOSURE_MIN, max_exp,
+				       OS05B10_EXPOSURE_STEP, mode->exp);
+	if (ret)
+		return ret;
+
+	return __v4l2_ctrl_s_ctrl(os05b10->vblank, vblank);
 }
 
 static int os05b10_set_pad_format(struct v4l2_subdev *sd,
-- 
2.34.1

