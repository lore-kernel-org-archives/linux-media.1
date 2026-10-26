Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013053;
	b=JuWFe+QxtkVSSLypl5w+3Az2MreSWiYkSEqCSdA9QXzR71OOrxg8B2tPulH75xkEujtM
	 JQsYImPs0GanDi0Vs3QA2UDIS6kUbfwoTksM9V9xop679KvQIHQFGyMeV1kREerM3WNRI
	 K9CO5phUZgs5rLRphWi20Wd/ShxQW3R9c/sc/y4zGO+OUGmGt9LC/t4L8Wl7nCj8Y+oHY
	 8RvArV6Y+V2lh1045EVr/2K7YoLcT9YoclD1+8t7LeRqltAi+ubrMzqRLNe6H5DUIs01C
	 y61hLghkgRNe9/aRxAGJ9L4TEj1WOsHQOXulIOwR/N5N55f/fTE+RUl3S4wxzrKTP1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AeJpWAOoIyC7Os3oyjM1e/I/dQTm9UtGMECDstaLpqI=;
	b=iaSjTguQGu0PLeePzY2y61kWaUV8J2IaJHMSuoBajkCggHxSU3GDFhEvLvEa/HdKMnoy
	 qsl5121etgh41NqQVXgD1tUX/sN3QrDjuqDfPTmTMZzjkIqD7//6dHmvbzEEYjn+TMm84
	 eNtPNcFoWeVCPD9bRBcMFYJoTD9FH47ZxXli2n6JAkpqLqlAB3lGQiayJZD+Rmb+OTPdI
	 St2NLgOcf6sX8ppHz/EPAYXeGo3l5C5uuARaNcPYTjap1++K0jyoboOUcykSaDqPQg4H6
	 RP9M0bjYlEpdnD3LOy5Y+HaFidhBx0L5YRtXab5iF51B4RZh1chRBEUOW2/bjxMONqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IqtNd8ya;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAC6606C9E6
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 11:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EAC6606C9E6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IqtNd8ya
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3adb9cbb0c3so286052a91.1
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 04:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013052; x=1793617852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AeJpWAOoIyC7Os3oyjM1e/I/dQTm9UtGMECDstaLpqI=;
        b=IqtNd8ya6/ORt2YKtwr67E73cC01QsBlM0+wf1OeJcklU+2vCAjNrlfBiy02j5c/qH
         ufH5MXCbUX6UqziazDE3rfKFrqMzVhLhU53slPRjw5AUUutSpTusblnGeDGqCDiH2uHj
         mYcb55yiZNEBNmQRfEi8wPTFwbPL11bIeduYwZVrMsmOqHtpeCk54LARZlsnP9+yazH3
         FG0+3LumFRnQ8Oaf0lzneGOiAhSxb3SV6G7PmPkszzmVm6Y8gaH69EY4ZnZM2D7TYyEw
         y0Pl84qiyR14K3qgC9TflBHC+kF4dhDjOmEoZUmydiVyCYx24ciA1Sk2e6LGLav4McnD
         vquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013052; x=1793617852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AeJpWAOoIyC7Os3oyjM1e/I/dQTm9UtGMECDstaLpqI=;
        b=2eniPXO06zROkPR5LbZdwwefYwmT6EdKlmXxmp8Xa2SdrCla7lNfEq9Fb7P14tkQel
         kfFn8eWM4Fktadfc2vvTWGAstJl3JreLSnzMWVrLN8SNypjSUg4BVydwY+2NiwVZtEkj
         g7BVLzx9hJNkcYH3KXShzom7Gl50iGOCgmCwIZcToaWIBSdw4/BK7SykUWd+AbUh/fq3
         FNZjLFmxsHZzFBMxHYkQOc09wvS2JN8kjPI7Zi/akGXVBwW6wDGUjJVVi8pYa1cvYSsn
         WyKpWhOclohpvji1xLg3kxnLu7cJ0PMlydfKl34jq+PqxbwPMV0rbOovyyw8bSL4H7LL
         W/xA==
X-Gm-Message-State: AFq9FYJ6OIvSkfuON3wNcG3ui139zep45D114oz8B52YXRnPRyGtHELe
	wwsIyCn62B0GEcbS+8Ohm54bca1nVNJi670acABQfWkOCAHcPVHPMzfBNxnuuPsm0tA=
X-Gm-Gg: AYBFou3YqAcdP3RCEtrTPwwBDljew0L4cstHMT7pD+zE3SLDjtQwMiLLuAq/i/LAltb
	CCvmZfUidtdHh/eFHsRqMrxUyUmxDy5GJigA3fwZTMUgVIVLrA4Ql5SUrwl6yd8Kh06RsFYYV5i
	Y8bZIVxC3PqS1/ebwDlOeY1uYBkqqCqYwE+ZnEaiQosflXGGOhVQIHoJxBIZdKiut24WWb5fScR
	V0abIR2gn5ldV0DsFmdWZ+Gz6AccDFEHU8lN6gX/IcKpMb9/tkICPZj6irsIt1oz15yvY8ERKq3
	FrxfR5hljV5l5WgnGTHdInmHnjbw2Z25NRp5fms5Bqo4g8SZ4JzeocaB6/Fgcw4K1fWfVnt/y7m
	qEkTWlce2ZtXfLGAxCfYjTgrp/Xog8C4A7ra56+T1x9X+z+WW0zNbAqM/oJvTF/8LN72tZeG8DO
	yuTbMhWoKBI1X2Zh+uCGceCkX8jEdZd3MQgW1p7LmhZ+WL+vKuHL8CAVRQFny4F5Jqi4IUaFq7v
	Wokdr/knQ7eilH3G86AaRPsPKTykrNpxu4hq8D9LGx5ZFrtGz/e4P92QZhSaGCwyz/6cyOCjE4n
	5cgLJf78GinyhPp4oKMtPTpUGCZm43NvAn0i0R08Ty9t/yPNSq90TA8iCuT9c3DBlvZ5hIbosna
	nl7k4IauCxa4dfO4zS9JCC3ZPCXYfeiSo2QbmYI6gnch9H5+oHxEt4ZcMJ/AwmeL9790=
X-Received: by 2002:a17:90b:55ce:b0:3aa:ff60:9bb8 with SMTP id 98e67ed59e1d1-3adead62140mr9315977a91.3.1793013052375;
        Mon, 26 Oct 2026 04:10:52 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm8023593a91.8.2026.10.26.04.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:52 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Antoine Pichot <antoine.pichot@gmail.com>
Subject: [PATCH 6/7] media: i2c: ov7251: Add strobe output enable control
Date: Mon, 26 Oct 2026 20:10:31 +0900
Message-ID: <20261026111032.88355-7-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026111032.88355-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OV7251 has a STROBE output that pulses during the exposure of
selected frames, meant to drive an illuminator. On the Microsoft
Surface Book 2 the front OV7251 is an infrared camera (Windows Hello)
and its 850 nm emitter is wired to that pin: ACPI describes no separate
LED, GPIO line or regulator for it. The mode tables leave the pad
disabled, so the camera only sees an unlit scene.

Add a V4L2_CID_FLASH_STROBE_OE control, off by default. When enabled
it sets the STROBE pad output enable (SC_REG5 bit 3), strobes
alternate frames (frame pattern 0xaa instead of the default 0xa5, which
lights four frames in eight) and sets the
pulse length (strobe frame span, in lines) to the exposure time,
clamped between 52 lines and 45% of the frame length, never more than
776 lines. When disabled it
restores the defaults the mode tables used to write. The span follows
exposure and vertical blanking changes while the strobe is enabled.

The limits come from the Windows driver, which clamps the span to 52
to 776 lines: 776 lines is 45% of the 1724-line frame of the 30 fps
mode. Expressing the upper limit as a duty cycle keeps the emitter
within that envelope (eye safety) at 60 and 90 fps too, where a fixed
776 lines would let the pulse cover up to 96% of the frame (552 of 572
lines). Keeping the 776-line limit as well bounds the pulse when
vertical blanking stretches the frame, up to 65535 lines.

Alternate frames is what the Windows driver uses for face recognition
on this hardware: its 30 and 60 fps modes write 0xaa, and a register
dump taken during a Windows Hello sign-in on a Surface Book 2 shows the
same. Lighting every frame (0xff, which two of its other modes use)
would double the average emitter power. User space tells lit frames
from dark ones by their brightness; V4L2 has no per-frame illumination
flag yet.

The control is written only while the sensor is powered, and from
__v4l2_ctrl_handler_setup() at stream start, after the mode and strobe
register tables. Setting it while the sensor is idle does not power it
up, and the emitter goes off with the sensor when streaming stops.

On a Surface Book 2 at analogue gain 128 the mean pixel value of the
infrared image of a room is 19 unlit; with the strobe enabled the lit
frames read 496 at exposure 504 (span 504) and 587 at exposure 1704
(span 776), the dark frames in between 18 to 20.
The span read back while streaming is 258 at 90 fps, 45% of the
572-line frame.

Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 85 ++++++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index ad66422d9e..de650b4457 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/unaligned.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
@@ -54,8 +55,15 @@
 #define OV7251_PLL2_SYS_DIV_REG		0x309a
 #define OV7251_PLL2_ADC_DIV_REG		0x309b
 #define OV7251_SC_REG5			0x3005
+#define OV7251_SC_REG5_STROBE_OE	BIT(3)
 #define OV7251_STROBE_FRAME_PATTERN	0x3b81
+#define OV7251_STROBE_FRAME_PATTERN_ALT	0xaa	/* alternate frames */
+#define OV7251_STROBE_FRAME_PATTERN_DEF	0xa5
 #define OV7251_STROBE_FRAME_SPAN	0x3b8c
+#define OV7251_STROBE_FRAME_SPAN_DEF	0x1a
+#define OV7251_STROBE_SPAN_MIN		52
+#define OV7251_STROBE_SPAN_MAX		776
+#define OV7251_STROBE_MAX_DUTY_PERCENT	45
 
 #define OV7251_NATIVE_WIDTH		656
 #define OV7251_NATIVE_HEIGHT		496
@@ -151,6 +159,7 @@ struct ov7251 {
 	struct v4l2_ctrl *gain;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *strobe;
 
 	/* Cached register values */
 	u8 aec_pk_manual;
@@ -243,11 +252,12 @@ static const struct reg_value ov7251_global_init_setting[] = {
 	{ 0x303b, 0x02 },
 };
 
-/* Strobe output settings, the same for all modes */
+/*
+ * Strobe output settings, the same for all modes. The STROBE_OE control
+ * writes SC_REG5, the frame pattern and the frame span.
+ */
 static const struct reg_value ov7251_strobe_regs[] = {
-	{ OV7251_SC_REG5, 0x00 },
 	{ 0x3b80, 0x00 },
-	{ OV7251_STROBE_FRAME_PATTERN, 0xa5 },
 	{ 0x3b82, 0x10 },
 	{ 0x3b83, 0x00 },
 	{ 0x3b84, 0x08 },
@@ -258,10 +268,6 @@ static const struct reg_value ov7251_strobe_regs[] = {
 	{ 0x3b89, 0x00 },
 	{ 0x3b8a, 0x00 },
 	{ 0x3b8b, 0x05 },
-	{ OV7251_STROBE_FRAME_SPAN, 0x00 },
-	{ 0x3b8d, 0x00 },
-	{ 0x3b8e, 0x00 },
-	{ 0x3b8f, 0x1a },
 	{ 0x3b94, 0x05 },
 	{ 0x3b95, 0xf2 },
 	{ 0x3b96, 0x40 },
@@ -724,7 +730,7 @@ static int ov7251_write_reg(struct ov7251 *ov7251, u16 reg, u8 val)
 static int ov7251_write_seq_regs(struct ov7251 *ov7251, u16 reg, u8 *val,
 				 u8 num)
 {
-	u8 regbuf[5];
+	u8 regbuf[6];
 	u8 nregbuf = sizeof(reg) + num * sizeof(*val);
 	int ret = 0;
 
@@ -976,6 +982,56 @@ static int ov7251_set_test_pattern(struct ov7251 *ov7251, s32 value)
 	return ret;
 }
 
+static int ov7251_set_strobe_span(struct ov7251 *ov7251)
+{
+	u32 span = OV7251_STROBE_FRAME_SPAN_DEF;
+	u32 vts, max_span;
+	u8 val[4];
+
+	/*
+	 * The pulse starts with the integration: make it cover the exposure,
+	 * from 52 lines up to 45% of the frame and never more than 776 lines.
+	 * The vendor driver caps it at 776 lines, 45% of the 1724 lines 30 fps
+	 * frame; the duty cycle limit keeps the emitter within that envelope
+	 * at higher frame rates, the absolute one with long vertical blanking.
+	 */
+	if (ov7251->strobe->val) {
+		vts = ov7251->current_mode->height + ov7251->vblank->val;
+		max_span = DIV_ROUND_UP(vts * OV7251_STROBE_MAX_DUTY_PERCENT,
+					100);
+		max_span = min(max_span, OV7251_STROBE_SPAN_MAX);
+		span = clamp_t(u32, ov7251->exposure->val,
+			       OV7251_STROBE_SPAN_MIN, max_span);
+	}
+
+	put_unaligned_be32(span, val);
+
+	return ov7251_write_seq_regs(ov7251, OV7251_STROBE_FRAME_SPAN, val,
+				     sizeof(val));
+}
+
+static int ov7251_set_strobe(struct ov7251 *ov7251, s32 value)
+{
+	int ret;
+
+	/*
+	 * The other SC_REG5 bits enable other pads, which the mode tables
+	 * have always left disabled (0x00).
+	 */
+	ret = ov7251_write_reg(ov7251, OV7251_SC_REG5,
+			       value ? OV7251_SC_REG5_STROBE_OE : 0);
+	if (ret)
+		return ret;
+
+	ret = ov7251_write_reg(ov7251, OV7251_STROBE_FRAME_PATTERN,
+			       value ? OV7251_STROBE_FRAME_PATTERN_ALT :
+				       OV7251_STROBE_FRAME_PATTERN_DEF);
+	if (ret)
+		return ret;
+
+	return ov7251_set_strobe_span(ov7251);
+}
+
 static const char * const ov7251_test_pattern_menu[] = {
 	"Disabled",
 	"Vertical Pattern Bars",
@@ -1019,6 +1075,8 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_EXPOSURE:
 		ret = ov7251_set_exposure(ov7251, ctrl->val);
+		if (!ret && ov7251->strobe->val)
+			ret = ov7251_set_strobe_span(ov7251);
 		break;
 	case V4L2_CID_GAIN:
 		ret = ov7251_set_gain(ov7251, ctrl->val);
@@ -1034,6 +1092,11 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_VBLANK:
 		ret = ov7251_vts_configure(ov7251, ctrl->val);
+		if (!ret && ov7251->strobe->val)
+			ret = ov7251_set_strobe_span(ov7251);
+		break;
+	case V4L2_CID_FLASH_STROBE_OE:
+		ret = ov7251_set_strobe(ov7251, ctrl->val);
 		break;
 	default:
 		ret = -EINVAL;
@@ -1574,7 +1637,7 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 	if (ret)
 		return ret;
 
-	v4l2_ctrl_handler_init(&ov7251->ctrls, 11);
+	v4l2_ctrl_handler_init(&ov7251->ctrls, 12);
 	ov7251->ctrls.lock = &ov7251->lock;
 
 	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
@@ -1621,6 +1684,10 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 					   OV7251_TIMING_MIN_VTS, vblank_max, 1,
 					   vblank_def);
 
+	ov7251->strobe = v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
+					   V4L2_CID_FLASH_STROBE_OE,
+					   0, 1, 1, 0);
+
 	v4l2_ctrl_new_fwnode_properties(&ov7251->ctrls, &ov7251_ctrl_ops,
 					&props);
 
-- 
2.53.0

