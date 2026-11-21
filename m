Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244509;
	b=PqJdqdg23c87aHtGr8PKvZShRjvzyU3PQh2UcqIPQk/05ZOzAhabp73AGb5b7/aSNo/5
	 sLWpTGmpxV+0PZq6pwg00SpJwb6v36273QxHu+TYzrH2Traecs2YflGLLXZ75eRnnWjdK
	 dq1cJ+AYKycSmAbQOQ+9fFTa0TValUE+Cb8OZU87J5J31ev8H1mW0xlr7iZGWX33s0FnW
	 7HlOZXrV4L2XQWKKeXnwWQTvz9J7y44QNC6fxsIkxNlO8PmJWKcc9LtBpGeMhzJva/bxG
	 6LB+OBZAMnzuh5OD4AIoqOQIYqClKDpursL9vjiAaiP23mKrAgMJoKzmyQ1X2uTZC4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244509;
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
	bh=CVJpsQtvDSUE+HShfPhcZ2wgJ4YVQd2XZ/LijqD2Iq8=;
	b=hiPvXXfosIiUf8qnnlew1BNhgG4Ey0b1Ga0yR9s+wBmXiA/7LbPKXKzraOg/BLP3EqEE
	 SvHR/Cvq3XdM1fUVrL+S1IkSLj4Eajq5BHofJTZqQh1xzGgqQG4eN8dFCNtCZkJA+KkXF
	 qpUI+ePs2QQwpCJB9kOp4ROkcsD5HrrSFfZTN3gEr7vIt/9q80hwJxhOfUa2a1i0yGaR7
	 iPsPEbz8evRNpb/ngB9inqB5K8gkIAXjPhFRhjx9Ct6JWJSQuZs73zBXOLCYzvlPYU9Bh
	 3tUkcIanAjas8FZKOmyFpOrINizVsvGorbdfaW1xwIOvbOvZVBSkIR6JwGPVTN968Lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.77
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021077.outbound.protection.outlook.com [40.107.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E7B606A320;
	Sat, 21 Nov 2026 07:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67E7B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AojhrSJlPwaPk7J4/F/qQIaGT1e30kBzPax/4IfahLrlHcMooXdQ1iEZkUxqzFWdBp+Mj5bIGHwwYJ3t/n29BM1yQ6/dgKBCngSh/QLuOzjar8DvAXfIswivI+FUNZm5V7exhdkXj07eJt62sBcJQXuxQzQBovL0pV/pEPezamyRZJk9dv06vCPTCES4cxMadHkz7a2KZKBWi7wCLkBIxDwHjPvznyKXGdCEwwsusaTPjFqu7tFcdOvHq/l5Dt+QP7Zxgbl3UuTJJL8kWySs/WWM8bs+xeZ/ZWA3A/TeKABpYdnrV7qMXtYCwiO+EkxFsJZR5jlPdXbaGyPJMcMJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVJpsQtvDSUE+HShfPhcZ2wgJ4YVQd2XZ/LijqD2Iq8=;
 b=iOHz+fInQ+yqAW3KQgZy61w8YTGPlfAt1wGHa9DzWkO6o5OGMyVzU504cP2QcFyTNTrlmldFeY24613aP9tFe7+FJHOLrV69ITz9HLKHCq04mag/aaaOHm4aBO47LAns+jXoo0bdpWqylRi0kAGjPit+Wtw47FfO0W7I0+jnhppyHbX6IyJ62Poi1SqHA5m0TPp1oY+YrXO5q/XJ3llrNrHX6xw1CuRsTIcnZIDkQCoXUkcMtis58Tc4Peyltmi0UGD9wh3rqXZ13S4mwzCrEqio1IC2rYz1X803PmKcgQ4GQcsJLoFq6F4EIK0Cds50OIua22+y1itAZkS9g4h1fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1768.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:01:45 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:01:45 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/15] media: i2c: os05b10: add V4L2 digital gain control
Date: Sat, 21 Nov 2026 12:30:58 +0530
Message-Id: <20261121070107.1768-9-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: db388a07-11f6-45cf-c0e6-08df479d4db6
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|38350700014|10067099003|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261028144727099003|261026140227099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
 NCAcoPfhDfv1hXdtnAONdObJn5kzuJ9QORHL5vr70xRww6l88AkWVAoAQ7gebbwdriJgJ7nPNVV2l65qs4kse/5mrr2Go4uy4RWP/n2tUVuYqXMlK2k9sEJdyDrMsl3nYqC514qHGzNggl5FI6CCTnu+RfPTRirD3DX8R8lvt1g8gycI5EYtJiOK0GNyW/EAXaFnFAUAsAetsS4GxRBNq1y3J0edflknmYFEYp5x9qDE/x1SkBT1zi1fXIBVCLor+LMK6nKCFDUjrcRLI1THZWoXXpqg9TB6I7VJLD4golQxoGbKRqDHmky94qPxlsQQKET11fsvYlRyAUkF3ahvPjPLuRqSudwymn7akaPkjpvb3ROilZtL1Ux7IU7AFkNndBZBMOmWBaICxWr/rnyHNncShMfci0iNZ13UcF4qtsKoQZJEPevOCSckVPYlBs+GBBjsEC8VMGFNmbumwl4fow/4ugAdtHLZoxexn+812FB9lFWQ+Wlb4aU0P0W7nDGDB1Dd6PInwG8giR9GmNWnFwvqIp57wHhZnGY+KzcEgCR2j3/w1HgaEyObwurBPM5qS/DSZQPT847DLqfQyTCeyZEv6ugf8TEDtFrgCx7OD3A23hev1+z40qCEvFire0XcU0Jxgfi8iqdP/L0KbBNrjYSYKYBsCH9sriIQcg36ZoeYzl0i9zrQSGccV8kEub8dBxOSBDIR8VCSWfSzZXgeUQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(38350700014)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?VCD73TGPEnu3BfzSJdiUKV2ZRpE8lv2oqOjDAryVbBIdXA3hCyCXmlVb9K5E?=
 =?us-ascii?Q?CdXi+afcp1aCUwmBfo3qmC39njBCGwlslZ83D94UJM+js2YYmc2lled389L0?=
 =?us-ascii?Q?hrL7ysgC6WklbjRusoQTNIisOWTJpC9Z+fOL7Nr55z8IHekLCXByb/5qNkV6?=
 =?us-ascii?Q?G6Y9U37K9rXbGhCpth76VHwDo8NQFpmpKfx4IIi+J1kWeS2qBaINF6NQVXey?=
 =?us-ascii?Q?5Z5I1x2VQlOqay5dB7RIccDCqYaUQny9UiQZZuGMbAu/mdLFOzqMNwp7eLT0?=
 =?us-ascii?Q?XnlHY8DxpoTLmC89R1bBftGStwq23KQzar7CleL6O4iXOX19PySNxVmAv06l?=
 =?us-ascii?Q?goDjsA8P6lnFq3u4YrQUYg4d1gn7riVKidXvKVLks2nhCXbODk04GQ7lDLeE?=
 =?us-ascii?Q?5bRLTeGsVANi0xphzifmxe3Mdzqq450ztYm69r5P5CQ/zO8oXMfVCZeaSby5?=
 =?us-ascii?Q?W3tSHCn5jJAsK+WnSrWZ6Hy1PWZYqWIeY09r2WNmzHLn2/iUIf5fygIGh5xL?=
 =?us-ascii?Q?rQv/yuP0k94P5RaOdBmge79/7wWbmmsXAYrHIAsON+HgvFf7mCkrCo78aOvz?=
 =?us-ascii?Q?sjE1kpg5cIFX9SudUW0jgpAVxAlqUWTaJEDgUlD5koc6EpfIMYCy13hAAvv1?=
 =?us-ascii?Q?wxKs07+zzf5ANnv5DMvCcg7Jp2aYc+Fec3oOZxnJon/W2GzukIR/F1aoGpCg?=
 =?us-ascii?Q?cadv88eaulmGDPpLzyeSLtaM4+ejvexI9jd27nTS87rKfjajHqsi66FzI12H?=
 =?us-ascii?Q?W35+AxCqNjHhJkB6gsKzjRnbHaMA51scU2MO8wz/cSR5+3/0CIvDfVBApmbx?=
 =?us-ascii?Q?K9ETf7NnWnW914+n+4mQyiOVuIThxR/mcPp6SmaE7xmI1zbh5zofg55LiurY?=
 =?us-ascii?Q?hAAJSsgi1w66s0WbWbSdYMRkuWeflE+8KiY4XUD1WdPqFK9uRmrW+470E6A/?=
 =?us-ascii?Q?5vgSsYB3kk/E7JxOV67lyNDr5GBixPpBy+ENtk3Tt0jCiQps+ruFhA5l2S9T?=
 =?us-ascii?Q?W7pvr2M9BjyqgQiqTE4cCFJo4BcjP7bxl4cuhYIRrjAy++H0b4l4N8TZJfpd?=
 =?us-ascii?Q?RYBeb0Lje+00fnsiSQKw+kVpo7hOx4nBRUk7Dqb64cJInSG3wUTZ1tfHBN3L?=
 =?us-ascii?Q?5nxGJE/PowUSDVEnSp3W17TIi8P9km+YEvmRyGDccudm6ZIN5S1ZLvhNSwsP?=
 =?us-ascii?Q?1CHb1HJ/yRpBjn8DH5M2vwCwzdu0ekRjeFbOgc0sfeuWNkguEcCYMzJk5N9M?=
 =?us-ascii?Q?gQL+9bVPgKyMKVl5LVNIk8RLaPul5oH6xXk8xBJ1ZpRTZy+4o3hUGxubQIMa?=
 =?us-ascii?Q?+YuW+5m3CSd0YMWWy1XFZGOhL+LMaUSt4js/jot/oPe5UYZCl85CwcXt/6oG?=
 =?us-ascii?Q?/6SgoILcIXrMIf0CyKHxuLImutkw09BMcpjdJXgPp/Y6+Qrft2pawPthewZ7?=
 =?us-ascii?Q?bmczGDdJhBbXkU6EFSWEl3ADykme2GEsiErXH5Yypk1ZWryBZgd/npDQz+G9?=
 =?us-ascii?Q?1FaQw+z2g7dPKClvsuVelsl60LNJH4b74XPRCUsGaAAI1ZnTxCiKAzHOgBee?=
 =?us-ascii?Q?j3pGMiuZyZ52+PT2Usi0B2R/YJDc6XsgiJGRFyPU/HowwDSC/bd54Ws2Sxsn?=
 =?us-ascii?Q?U/4hkzSDVVDtkOf85tuF9fYd/QX8NLSZDtcrEQQCub8oMwSrcxoNgBZVFNa9?=
 =?us-ascii?Q?cEgNekA7SfbvI9GhrnXmMst3mwoWdj2lgsuO5PIcldMDDGckoxppmUqpjJBJ?=
 =?us-ascii?Q?CMFUyoHRaVB1/lk4ihMBYa+Y6DtC05g=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: db388a07-11f6-45cf-c0e6-08df479d4db6
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:01:45.0182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itC7IloqfpCc8iYCg6ZDfUBSvIFSUkP32b/7U9Glux8ieczqiZTduX2ml0KWX6xem2C450GaejP2BVNV4KKy/3+OoZZWNFKyL0StaLI5308=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1768

Stop programming digital gain in the common register sequence and expose it as
a V4L2_CID_DIGITAL_GAIN control. Initialize the new control and handle writes
in the ctrl callback.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/os05b10.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index c75866489e7a..5fd63f106c39 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -132,7 +132,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3108), 0x7d },
 	{ CCI_REG8(0x3109), 0xfc },
 	{ CCI_REG8(0x3503), 0x88 },
-	{ OS05B10_REG_DIGITAL_GAIN, OS05B10_DIGITAL_GAIN_DEFAULT },
 	{ OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },
 	{ OS05B10_REG_DIGITAL_GAIN_SHORT, 0x0400 },
 	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
@@ -543,6 +542,10 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_GAIN,
 				ctrl->val, NULL);
 		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		ret = cci_write(os05b10->cci, OS05B10_REG_DIGITAL_GAIN,
+				ctrl->val, NULL);
+		break;
 	case V4L2_CID_EXPOSURE:
 		ret = cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
 				ctrl->val, NULL);
@@ -926,7 +929,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	        return ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -960,6 +963,10 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 			  OS05B10_ANALOG_GAIN_MIN, OS05B10_ANALOG_GAIN_MAX,
 			  OS05B10_ANALOG_GAIN_STEP, OS05B10_ANALOG_GAIN_DEFAULT);
 
+	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+	                  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
+	                  OS05B10_DIGITAL_GAIN_STEP, OS05B10_DIGITAL_GAIN_DEFAULT);
+
 	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
 					      &props);
 	if (ret) {
-- 
2.34.1

