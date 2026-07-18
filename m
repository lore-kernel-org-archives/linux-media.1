Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021138.outbound.protection.outlook.com [40.107.57.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA53373BF2;
	Sat, 18 Jul 2026 20:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405501; cv=fail; b=fTjhOjZP7CvUngkeLTH1Kklc8qYOzzeF7Ru6xzVCDTAviQuFheXVaHCYTd0vkXuGqJUtRuovC0vwvUCwA8/aVPQYEMbKvZAXADvM8soXwQzMIq1j/FB3HtVB04qNNML5CcooyPu2E04TNPdTvsoe9QUdTrHuGAd080RmQJwCcWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405501; c=relaxed/simple;
	bh=TFioPRNRHj2/WpTxiGxjyPw30p5oLdeYvw7G2wsTpKs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S2PlnbQp3ORSyV0/LLc379/MTeVh+Rtb1tPsxyTbmCjW9X3qKrDLx6/Qe2um5afeUiXt4XFxNDPc+9hwdMmuh4VKsx3cVLI1BfNa8BFKy3IGo1UluCpt+mwQ4JMNXJ5vKrh+Tyl9AuYDlnnPZZ5cBEG+8g58/V/fRrQ15cJ2aVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=BoFj2M3J reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="BoFj2M3J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+SavS22EKBg+IKg7QT5O5lFJVPrQW0x2+c7rYGw6LbNkAsb/K6l/2T46imbge/ufRIPO+6As7wVJJqn/n/Lh8TQkqfESKOtNILZpkofVpIp05PSkWwzuRsC4yfpkmNAA3/T97s39cywyKJVxN/z8Sel1vxS6Bi7lpCT2J+eDEXb8YXoSCp4cycbF601xcumaSp6Nefx/m/npcI7NP8kjODb0yBbGJaj757flnfD9GrsGxqv2AV3UhEetjeI37dP/dgJ+6De+Bkbq4Y3HRXGrpfJ0CMkA3U0gJEgWiWwoik8kJkjcjrlHwxptyj9godHxwg3G558szJL140HL5Qffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40yFaiZiWa1D14Yz894KaSGlFDqktHVRFAfwfdsxUP4=;
 b=XVB5wnBKXW51ERfEf1XTi5rpJ9DZFsK6cIJ6YRbp/l4edX2hisLzzP8qat/WgGJNmYzRIWuisTXLc0YoHdt4fi/rNNvJ3U7dcKEK4uPSO0WSR/SuVozKswkQ6iL+YkAOgZYQYQRnb7fGg7CsxKow4zQbDCx2HtrxIfIqlC0ICf7qBYqGljMLa+6Tx3dvFuY4o4DxctgQVualBQ7Pz0gNszKREf1OS2hIiQidjt2mPEzPEaBgbWfwRFds50p8HlCNX9O+dfXVS4spyHYisq/FAEClZblLn0Y59etUuLgAHfczdzJ/XlQdgDCDmWlo1CMmurCO44uqzn0XQzmbPjjAYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40yFaiZiWa1D14Yz894KaSGlFDqktHVRFAfwfdsxUP4=;
 b=BoFj2M3J9fJo2MClbiAPKZ1E4qJ2j+tBM8Fadm0d3ztzIBPyHxB7fimDizHMVGhkjkDRcT+SmpWmxb2I748Y4o23i7pqHRRgEYCgkdPJdmQVgVIe9K6/34bhWaoL3FJNpwhEgTbCLMPJ9uNSmCmIVJjQHX0LUyrIZ/sW1RAvdjL5X+8eBitl+6ZPwdHgDCAmLro4Zo/U2XsV4iQI/xnVHNlKaQE2RSYctj+pWCqXwco/vKUmQH6rinVz2/PNKK/BRC/2OZrBqKYCjO6KfpPuaLOt7QKLdXwBiMajzswMAfgm4Z1QQqtZABt/pR+zaVtbLx0KFVaYpty6n38HqlhPaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB2078.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.14; Sat, 18 Jul
 2026 20:11:37 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:11:36 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/17] media: i2c: os05b10: fix negative hblank calculation
Date: Sun, 19 Jul 2026 01:39:06 +0530
Message-Id: <20260718200912.16001-16-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB2078:EE_
X-MS-Office365-Filtering-Correlation-Id: 94823a34-5603-4e36-230f-08dee508c573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|10070799003|56012099006|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MQg6kSIDYI4dfb1LKJWT0voVPTD/ld9Qybr/5O2JYRcbb3BXRO44nVuV1S3rDpg0PReurbYTHJ2KacsyuZz2xlvnCfUjbM6FUWpY4DBD53zNwI9cqjZkhbCYxQR94fKcefgFvpUF4PsTedF7qICRdv3ySDevOQsxOZ8iDTkH1PstrMEPYU0ZWTowUYKp5Gv42z/hf9VFAPlKt3Glgoshk8A1lTTWciQb4xPu4ui4KXJVqump3rvhmE1yx/QYhXvUZRSLEsM769vAlcNgAVTHtEaiXC5VYTkpCC2q4zpRv1hSCWrsz4CghMa/YSFKl9n3ZfMiV7f4aExZuWrOzr/PTEnmH5mrssiddoIwnL6UtgWyF/qq7Y6jnWWK0tOLokgCJTi5xIBLD8xuql8dzXTx1VwnMM16MbRQ3tdSOJVPiP644jOZGQBumdcMMDbbfRTQM+MCYn6wpOmnaWlIKHgYAwP/7HM3gc5uUDYb/2bFy+fAwkyyFtbSVrbCkPHXRaIzSifMGq6bPTtROZhdmTRgcdzQwLnF6FhKnDOea0vvuIXlbWOU6cnr1Dcz1mePq1/MYuK3x09AsJ0EB1jw/jkTulLqs9NeFxFc6Banh/svu2BR/8m0GjGx1O0gnjP5zlcZXo983LHpmEFkuVjUinyikWPuqO6ztBgDSJ7atL/dT84=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(10070799003)(56012099006)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ui4f3A+9nGGMwWw0YUtAJ/uM7TQWmR8G3wAy1b0EeSxhnzYktAuubQVWajS+?=
 =?us-ascii?Q?9uGBIUupMkRv+f0STLqqz7S1nojsGIDukReg4ms3V1J69W9ZwvRF3cjok7H7?=
 =?us-ascii?Q?Ec5jblO/O1W7Kapfzr5Pv2Zis4pSmTd+m+qEQ7Z+vfG3OUGHm0a16oInjhR5?=
 =?us-ascii?Q?xNzkffHVVuiyE7FD1/T6Yj9IFxSCKWPNucSrLvI0RYFZPKhyjpz8oIZZ0CH5?=
 =?us-ascii?Q?N5AT2IL3TdUckb2Nq/c8aBf6mnbeN8MStY58QcQ5OfIj1x4SZVWoNbVaZbOP?=
 =?us-ascii?Q?NSwxs8Iq8VaAdqfmQTJiKvyq6aJrKBqqFQcuqybfS6dxTdlt5jmXoXUQwOMR?=
 =?us-ascii?Q?Oyy7zqMTF5lFQ/bW2psaXeFDnlZpo16qJqehPspDoF4ePGK8AuL5VqNEtC4g?=
 =?us-ascii?Q?TYDprvZ1EcQumRid/YNs6+aZZD+PMrVDJvDQKh755okF7K3aK2Tt+8pH+nbu?=
 =?us-ascii?Q?nIfYn3j+4/Tnsbm8edvkDIjGVQIhrFcfjaBH89L+SNSMJi+CL8bAUZIsYpwP?=
 =?us-ascii?Q?nai+pyNX1FgWm0/SrhzoBNy1SaZKSWIvRcW39fkGaFrIdFPjsw/ErwglRc9O?=
 =?us-ascii?Q?8zc2EUHfPSJZ3ijdLE/9vGrL/7OSXB116lQwCI06I/PAQGWC13/VL4KNWCH/?=
 =?us-ascii?Q?bKoZvbjcOASBNRfgKBRXcFz5u16M3vHdNr9O9BziXFNLFcrwSnZayGilGT4V?=
 =?us-ascii?Q?TtWnJubDRYR6S2RJ4ZD8VOvexbxezrXC3DV/22/UjMJDu8Qiddc65CkmaCzd?=
 =?us-ascii?Q?tnzqICoHdXlqm2kK5eYRVFk1jLgOo8SIsF9f71aiyJOurxytFcK4jk22oaVI?=
 =?us-ascii?Q?w+y9MhRlw1OpZxuWc9YfsYVHQ6Rzh08u4j+x7GNKX4TKQVD+Zc3WbjWmZC39?=
 =?us-ascii?Q?Q4Dh5y1Oe6J+JPldo2Fu1ZGxo9YLnfUk7F1VTQfzXAsB8aGlVSNOIrp76BHV?=
 =?us-ascii?Q?iWJGQGmfN/XYHwo03ZBKG1JRCrEhjH9+M8IZ4V8PXx/bHafdrpzpMfqz6JOp?=
 =?us-ascii?Q?A6go81ju6jODAoSnAjvDYTcGGS44fg4HUu89+YSOyfiKy2zKJM9Xu7cLgJto?=
 =?us-ascii?Q?Dd8x5ffcXmj/nFw/rK6ZTEmjOcAA/mG6QeaVllc+ANnrHAyti444diA26qmY?=
 =?us-ascii?Q?2C7UO9oFc19ZH/wgxZm1QpQWStpqYO+mMTFVHix3kTJN3Xrfc8+aYKFfEFYW?=
 =?us-ascii?Q?mVoJZd0WdNd4cuW0yvjWz1hBGMGctJs4v2hkh8VbyWlWQ1Sjbzu1kc0l2gSe?=
 =?us-ascii?Q?aUafPSWBVk7IECtwq4rq0WeAIc4jxoI2BPPqfaOJaglMJ6ygfTH7mO2KriUk?=
 =?us-ascii?Q?izAV1pwih2heff7soCY99QPpZb9T+A5CjTUN+bucC0btM03NV24SoBIUwY17?=
 =?us-ascii?Q?ngdbU2dXoYWG2qk+Q2qJeHw8MSMo47pFVjrRsPLlv4ihRUZoPISaSKd3Tmec?=
 =?us-ascii?Q?vwiREpO9SvVgoEFyzJL3bdIN0ee5I5oyaw6DCe7mp49nO5dQb27KbNk92pgk?=
 =?us-ascii?Q?vD1UQUFaqGu1RoQUhYe8XeKAtbYapbdhlY/lGPj+RWW9Dz0buckj1fA96gf4?=
 =?us-ascii?Q?SbuB2TZJwxYMeC/1llJVCmg++J8YltuO5lVfdXhF1Z2BKiPhd5zsIRzp9QR2?=
 =?us-ascii?Q?dMIhsJKhkU0Pax3lfs5enPWzEDVrvMpT2qT8bmO48yxJHJMMHhbLeBeIUeNL?=
 =?us-ascii?Q?lQWvlnJSypgt33iulBEgNAJMdJy6lMT1zBP8A3S1J1KdTKMxxWvREEzqLepX?=
 =?us-ascii?Q?W0/cx4x47+9gM7+W5zwsBdml9km/NwuN1jgNMgYCT2MBg8igLL7Prkqo3y/Y?=
X-MS-Exchange-AntiSpam-MessageData-1: An17ZnogQ3TVAXysH8CIiu92AiuRSTcUPF4=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 94823a34-5603-4e36-230f-08dee508c573
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:11:36.9298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KYoTe59IMcybC6HOabYswN/4eutsRCFHD6Rarw0zWBMgBSvTSiNUqpdB3WLUvA00OECS6TIkt7VO/VGHepLXakwoerVtYcRCqrrIpneWLyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2078

hblank is computed as "mode->hts - mode->width", but both are u32.
For every mode hts < width (e.g. 1744 vs 2592 for 2592x1944), so the
subtraction wraps in unsigned 32-bit arithmetic instead of going
negative. That wrapped value ends up in the control's s64 min/max,
which v4l2-compliance flags as out of range:

    fail: v4l2-test-controls.cpp(413): returned control value out of range
    fail: v4l2-test-controls.cpp(476): invalid control 009e0902

and v4l2-ctl shows:

    horizontal_blanking 0x009e0902 (int): min=4294966448 max=4294966448
    step=1 default=4294966448 value=-848 flags=read-only, has-min-max

The same bug exists in os05b10_init_controls(), which sets the
control's default before os05b10_set_framing_limits() runs.

Fix both sites by casting to a signed type before subtracting, so the
real (possibly negative) value is computed directly.

Fixes: 3aa9296a23ec4 ("media: i2c: add os05b10 image sensor driver")
Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 6d91a9660660..59097eb96561 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -871,7 +871,8 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 				      const struct os05b10_mode *mode)
 {
 	u64 pixel_rate = os05b10_pixel_rate(os05b10, mode);
-	u32 hblank, vblank, vblank_max;
+	u32 vblank, vblank_max;
+	s32 hblank;
 	int ret;
 
 	ret = __v4l2_ctrl_modify_range(os05b10->pixel_rate, pixel_rate,
@@ -883,7 +884,7 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 	if (ret)
 		return ret;
 
-	hblank = mode->hts - mode->width;
+	hblank = (s32)mode->hts - (s32)mode->width;
 	ret = __v4l2_ctrl_modify_range(os05b10->hblank, hblank, hblank, 1,
 				       hblank);
 	if (ret)
@@ -1272,9 +1273,10 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 static int os05b10_init_controls(struct os05b10 *os05b10)
 {
 	const struct os05b10_mode *mode = &supported_modes_10bit[0];
-	u64 hblank_def, vblank_def, exp_max, pixel_rate;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
+	u64 vblank_def, exp_max, pixel_rate;
+	s64 hblank_def;
 	int ret;
 
 	ctrl_hdlr = &os05b10->handler;
@@ -1295,7 +1297,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	if (os05b10->link_freq)
 		os05b10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	hblank_def = mode->hts - mode->width;
+	hblank_def = (s64)mode->hts -(s64)mode->width;
 	os05b10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
 					    hblank_def, hblank_def,
 					    1, hblank_def);
-- 
2.34.1

