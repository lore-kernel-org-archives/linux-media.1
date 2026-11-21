Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244510;
	b=wvPjp39IrdxP5dd3LeN3iD9Ksqn5lhi3KbNTdNGWeVD5eXpxB5M4qarxmXRM6o5vGq8j
	 ZjlnELeREo5L0m9GVDeBPBtgVM+SWLpEtJTMmvQU4vlNYT7ppjNAAbpKBUag1q84AIelz
	 t0dpdsAs69vKj7FXDTUOy/XXlj8SiyHMMHvz/+FFH/qJ+oFwKZyYw5+k+s9y4tz2hWRaI
	 cOo2jrWuycXC0nugSmgTHB3C/d3Fg2abscEoQRU8GbpmR8q9Vx5WXistjEOq9SKqFjUYY
	 WdsHg3wfoXoTmamDfVYQ4zwJGpUGvQfCnd+H4KziN7EaujWnGXFjYlEHtl9EQ5MmdLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244510;
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
	bh=003uZpwnK4nzOJUjDn7Gk2rqCfivY/2N2q5ad/Ms9xM=;
	b=Il+oijdkUjDglx9Arici+U4fsn+0BBApOKiohDcrDrD52btjTP712eOCvwUtPYM5hrnn
	 uryGCw51TOVMqZR2YHv3cTj4jPtcqIkhV2ro2uwgG82JhPNjNaYO08q1Hkygv0WCP6aUs
	 jqJTgKzq7vYNjN41gjlPrY3hrGlKwsfaCGUAIMARztZZQfoOt/WN+rKWaT/7hYiuSQU9F
	 F3uYwdoQiJiitetbpe1DjyTpsPXvbpw7+0eE8xTTTbFRA23u0JhfE3CFp2m/KHz3+dAr1
	 ClmJuQCD0zpFg6EXj36anDUt2TxGgO3DVjC4mlDfSA5SzwV1h946dGW8Z2b7oJTXkgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.77
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021077.outbound.protection.outlook.com [40.107.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422B0606A338;
	Sat, 21 Nov 2026 07:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 422B0606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFfh4jvkDBqng0qJcgeYH8WGa8j+UGh/6k+aQf0TRJZ/hqIjowUAboadqgQ9FqT04tuS92SeYg9+PD6fQD+XW7+VTSaOsItLz8BnmcH1XDjQ5PtpCr2RRpoXeGxh1x43Pve8I4NTjssPGAeFxrKTh8qoXgtKuZbKk09h/PoBL0oH0ZT5qA2zoPw6kzALeCIRFxyXqKePhz4sB3waHd9+eSU0EUnSdiV/SCU487Y4v5KjrzDxAReYzbJBwK9R+d4TIYx++YOh/zmNjhTfKaH3uknmYIkq8D3E6MuURAYwJsO6bYbh5x3x597ffva2QqYe3pL+s8aA/02J3mVvbi8D+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=003uZpwnK4nzOJUjDn7Gk2rqCfivY/2N2q5ad/Ms9xM=;
 b=Lsb3wM81wcbzxQ5vd/Z/lcdlZ1CcKWq1LWEnmPcJZvh0d1kDnB/ONk48GcDtefQ8tSYKKTi+AdNbbhBGu3y+8qS84EFpJ0fal7tPon/R++1N12wDnJLgVCf94f69RxCaibVY+V6BjPit99bA9IQxR9rOKAO/61J+5rM9XA5PDxcK2ym4fhHI5UuBCPwrqZX3PIJ5ICN9iPkK5flrC93BXDLVwudzJJAxHcEXQvJhWOfowkvVLITSblr0UMddE5mkVFVTgYy2RUXWK/I0hP2A7GPMpZLPzBdRHFru5GQ70kzJCRlxfhaRLjE+VFAiNBHJfq6qdqto4vjZYsWKSpzT3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1768.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:01:47 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:01:47 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 09/15] media: i2c: os05b10: Add H/V flip support
Date: Sat, 21 Nov 2026 12:30:59 +0530
Message-Id: <20261121070107.1768-10-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: d4e061d1-49a5-4c3c-e609-08df479d4ef9
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|38350700014|10067099003|56012099006|261021123027099003|261021121427099003|261022075727099003|261022115727099003|261022105027099003|261009223027099003|261009221227099003|261028144727099003|261026140227099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 Mgmn480QCDq4eAiTP+XL1+Y5KdyhOihe8wogEzC3zp4XeAiB9UuPP7tOZ+oGqFjhd25tLI2ZTUI1enyBMaYYy4GyuGH8ioFiOqsW6qvS8wj50+dLZdhGINa9FaB1O0zArNLp8ZCd4MKkVCKHdq5xF8mJqLtgGdW+rQEmrybzk5t8gkLz15FZJ5BBqe1r4l29AeeCU/n/f7jk213h3yOz/AU6UyCV/mWZT0RmN11vcJrtHugT/Hzd0ff7+JcoS4SnO4rGZoTPLt1CYPbXbA+bK6XFTMj9LQlu0XbScoUc/sunNgMeGJNK8PjRxparQkbE9kZau34kaUSqu284z/F5Ddynb8KKo5Cix0s65Ij2j6QtLOAPEPs0s0TF2Nj04Zxb/x68VTdKtPUti8+MPSgxn/xlVhZR/2Vb4UNVkYv3hl5A3Le7trolQuUel7xjXfwadlWRs12CWevdBDaIYwX23BKX1U8knknWpKwqChWjNb/cWBEzKw5ZgA3QhJjBB1xWY8zIIpatIjDHgEll1zDUZPDLlLVBUUkpzgBSftMx0a88VWoAUXbX1ylLKCf+jFsmOMjuiReBgFfwK/asOn3MS+M2q63WVuZPyEwMKQdND/XF1qtUQf0nErhz6zxfCHOhm3cdXQKfE3jj703LCOyuOLBekq1oqqdCsdaigNfzvkWAv7Db/BoHZ/YOut/oSGXsw9lzo1dQt9xdqM8Zl2fC1mOJNtM6+xBiffQkG/76jgA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(38350700014)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022115727099003)(261022105027099003)(261009223027099003)(261009221227099003)(261028144727099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?snr4JfxkmMSuYSPiQG1xT6KxMfzvCl7lwQ2QzUL1mfLiVSW5XpqQ8YChLu+L?=
 =?us-ascii?Q?z2EESDU+kU+/pBt8/u8/+wcAUS0O3Dpy5dlmnAqtg2nAogIz8iqM+nKdBRnL?=
 =?us-ascii?Q?uQosLK/3T3yd1oD+JBG1p29DAFjujgxVNOTI1WElm5+Iua4QBr3dfmRVD9k/?=
 =?us-ascii?Q?9uwLgGp9KHxdUy9EMIAfng9l4chkiBmxTl9Gz8RRaQeoM1BJeMScaX5jlX2O?=
 =?us-ascii?Q?mUcVNgSHU3V2l6HSIhR/5yV+mf43Q4UmNz3+XKjJ6J3oAECjkGQuhqJCyC1P?=
 =?us-ascii?Q?DsXopc5BRjqRfbbL3QTFvw4aAFxbPPnaCZBQidZNlhRp0xbYLme7/pMIi2Gu?=
 =?us-ascii?Q?FbeInA3AEEil3y34dUlRE9qPrdFHoPm/mGW8ZdMcsGIFNWLqn1GxaM/Rvic5?=
 =?us-ascii?Q?9Z1AKFK+e5GGODZpiVmgmLaA/2f5S7UoVMYNLik/cOunDE/vQpqF8mVV1I2Z?=
 =?us-ascii?Q?VHLaU1A1CQB4X+9pmVKLqe+IVTzKcSiHmHfUAXg6+0bg7CGiqsc0F1LcsJp9?=
 =?us-ascii?Q?pjjY+SZAYsR/OYS7HaW9haI/SnQA4SJWGrIun9EJZQpRXPRz2y2h0esGvhje?=
 =?us-ascii?Q?b/r7vR57WuPQl5yrHX6dGmHur1zgSzwPYfNbhQl2d3HSV5OFqIpsq8/+7393?=
 =?us-ascii?Q?YEcQ1alx2r+t9eEPAfyXpfo7br4aGvLPtfybyxz2AW2f9rHy74iSmb4qW+Ce?=
 =?us-ascii?Q?UvFqUkSriND3fvNH99Q2OSJ+CtoxcU4BnPrf90isCei3+CUKeTGlFs1rCSKt?=
 =?us-ascii?Q?Urr4SBaZREpEWdCH1r34l+T6qxI0eFELJMR+rU5GGoNTTaJ8gMIpVGqtzIRp?=
 =?us-ascii?Q?ncMU/jzb2xBEoPKSH8wqb1NCFuWC7sc7dZ0tuvq4CJBlQyfdnCuS8CYMDYDs?=
 =?us-ascii?Q?uZu+RcRCDqZ2h8PqYFeNDFOGtJCU9Lc3LMu946oStwGfkrify55irFmhffgt?=
 =?us-ascii?Q?PWG1oPYA7gFcR1R+xnnmQ5feRZ3FB3bwoiFN7lRV3bF4Xf9OZVve+ecf4LOh?=
 =?us-ascii?Q?nP+UCwVNW3eOOVm/sZNMbwaBEUBcjGe5b1V54uPfk//b+zNEYBOZPiUXedJK?=
 =?us-ascii?Q?68UqBVHEA1f9vtf4rklTeZ+bcVxzFGVuRWkVOsQydaEsG41Vyna5v+f9zmEO?=
 =?us-ascii?Q?P1Vn5zzavdJ2nLXDZ6cNVH98ZDVPwc8+rE2p8AU7muVtDMTiOXgPf2SEQu+W?=
 =?us-ascii?Q?qk5h0SX1zkrp7hTP2TFO7geOMHWYP0C7V5OI8UbYK1X7FjOmqHPBUz8uLtZ9?=
 =?us-ascii?Q?UEqKafeKYFt+y741fUBO2mDEZhkX6K0N6n9DE5V2MQ1pNi6DxgEaMLjAsc3n?=
 =?us-ascii?Q?RGy6uPSZ3QZnD0rn/SZye8LRdnmlB/3BfmGAMO3jFIOg95oC5eCh5CubT9iF?=
 =?us-ascii?Q?/sYm8+E6PY81nc+q/WgZowftST52xrbZmwBPfvA2VIaSXInPyGO+V8BWntYt?=
 =?us-ascii?Q?4aNn80jlmuWSOnMNAb3N8vexKHRwcwbG8ENFHuZkOrcuARtMv9Lgv/yqShKu?=
 =?us-ascii?Q?CT4ldu9bB0xuInGkGcsyPSCGOBRsl71uakrB2QpAQPUYy38JCA+1PzZ8i1Z4?=
 =?us-ascii?Q?ORr5GVGY0owsbgXS37D6YdN2Uo4Gd7vGtmkgUGJhtargpO41YLI5nZmuCQVJ?=
 =?us-ascii?Q?e5GP+2ciWEhOKPHfYaCRf0Jjlc0h+ABO+g3m70ipN5AEKBbgoEFrZpQzN5cd?=
 =?us-ascii?Q?7TMt6SQl6GakKRayqeX327DuF6FswvFWwWi+PaLSSdW/IZeyGhsMopGcPWo7?=
 =?us-ascii?Q?slbd4mb4OEOFkS+8hcTYaNTHdVDrVVY=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e061d1-49a5-4c3c-e609-08df479d4ef9
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:01:47.2037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXs5w7tt15uwOOJNSZEqGLP/pB1NmzclQXUR5q+EAFAhTez963IHNaDXAkU7nOMQs6b1cyyuszt2nrpP13AcXllbUDdOCOM9+UUs+I64OBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1768

Add HFLIP and VFLIP controls, lock them while streaming, and update
the reported Bayer format based on the flip state.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 61 ++++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 5fd63f106c39..7b82ba274768 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -92,6 +92,10 @@
 #define OS05B10_MIRROR			BIT(3)
 #define OS05B10_FLIP			GENMASK(5, 4)
 
+#define OS05B10_REG_ANALOG_FLIP		CCI_REG8(0x3716)
+#define OS05B10_ANALOG_FLIP_MAGIC	0x04
+#define OS05B10_ANALOG_FLIP_DISABLE	BIT(5)
+
 #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
 
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
@@ -227,7 +231,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x370f), 0x1c },
 	{ CCI_REG8(0x3710), 0x00 },
 	{ CCI_REG8(0x3713), 0x00 },
-	{ CCI_REG8(0x3716), 0x24 },
 	{ CCI_REG8(0x371a), 0x1e },
 	{ CCI_REG8(0x3724), 0x09 },
 	{ CCI_REG8(0x3725), 0xb2 },
@@ -459,6 +462,8 @@ struct os05b10 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *hflip;
 
 	u32 link_freq_index;
 	u32 data_lanes;
@@ -507,6 +512,16 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 	return container_of_const(sd, struct os05b10, sd);
 };
 
+static u32 os05b10_get_format_code(struct os05b10 *os05b10)
+{
+	static const u32 codes[2][2] = {
+		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
+		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
+	};
+
+	return codes[os05b10->vflip->val][os05b10->hflip->val];
+}
+
 static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
@@ -550,6 +565,25 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
 				ctrl->val, NULL);
 		break;
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+		ret = 0;
+		cci_update_bits(os05b10->cci, OS05B10_REG_FORMAT1,
+				OS05B10_MIRROR | OS05B10_FLIP,
+				(!os05b10->hflip->val ?
+				 OS05B10_MIRROR : 0) |
+				(os05b10->vflip->val ?
+				 OS05B10_FLIP : 0), &ret);
+
+		cci_write(os05b10->cci, OS05B10_REG_ANALOG_FLIP,
+			  OS05B10_ANALOG_FLIP_MAGIC |
+			  (os05b10->vflip->val ? 0 : OS05B10_ANALOG_FLIP_DISABLE),
+			  &ret);
+		if (ret)
+			break;
+
+		fmt->code = os05b10_get_format_code(os05b10);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -564,10 +598,12 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
+	struct os05b10 *os05b10 = to_os05b10(sd);
+
+	if (code->index)
 		return -EINVAL;
 
-	code->code = os05b10_mbus_codes[code->index];
+	code->code = os05b10_get_format_code(os05b10);
 
 	return 0;
 }
@@ -708,6 +744,9 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto err_rpm_put;
 
+	__v4l2_ctrl_grab(os05b10->vflip, true);
+	__v4l2_ctrl_grab(os05b10->hflip, true);
+
 	return 0;
 
 err_rpm_put:
@@ -728,6 +767,9 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(os05b10->dev, "failed to set stream off\n");
 
+	__v4l2_ctrl_grab(os05b10->vflip, false);
+	__v4l2_ctrl_grab(os05b10->hflip, false);
+
 	pm_runtime_put_autosuspend(os05b10->dev);
 
 	return 0;
@@ -736,6 +778,7 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
 static int os05b10_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state)
 {
+	struct os05b10 *os05b10 = to_os05b10(sd);
 	struct v4l2_mbus_framefmt *format;
 	const struct os05b10_mode *mode;
 
@@ -743,7 +786,7 @@ static int os05b10_init_state(struct v4l2_subdev *sd,
 	format = v4l2_subdev_state_get_format(state, 0);
 
 	mode = &supported_modes_10bit[0];
-	format->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	format->code = os05b10_get_format_code(os05b10);
 
 	/* Update image pad formate */
 	format->width = mode->width;
@@ -929,7 +972,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	        return ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -967,6 +1010,12 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	                  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
 	                  OS05B10_DIGITAL_GAIN_STEP, OS05B10_DIGITAL_GAIN_DEFAULT);
 
+	os05b10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					   V4L2_CID_HFLIP, 0, 1, 1, 0);
+
+	os05b10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					   V4L2_CID_VFLIP, 0, 1, 1, 0);
+
 	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
 					      &props);
 	if (ret) {
@@ -977,6 +1026,8 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 
 	link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	os05b10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+	os05b10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	os05b10->sd.ctrl_handler = ctrl_hdlr;
 
-- 
2.34.1

