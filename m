Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F10545D9A
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079897; cv=none; b=BpWo7pUHHi2tD+cGzcPJsUNgAEHHd/wfyYbhAZastrV5TdHoH1ZCabNClVhXT4tvQQ9gJvnp2p1NBy2FYUoWCE1ckGrfJ9/wSkkD0PVhVuLmI7kdtsj7pWXGYmKQRCvCT+BBYZAzSKYjUr39h2P6ITKVM8pfnDumVWMdEXo7KaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079897; c=relaxed/simple;
	bh=WFwaN6l1InwHpWmro44GXUpQlmOi9SBBR9O6QCn2b80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VPEofgtFvW/7jNKGz1HX4WM3G8aOpxl8MthX0x8RSUNrW38uzwDYlOI2PbKzlU/o+e6MKSEaY4gJx2zZMeb9pAxUp0iInRMzba8PPvXFJH9/GgN4C3tWqHFjRIz7ica/XqnUXDSiFe3W6rpl/l5OXfM7EGNQFSSo6mUFgT9PlcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=oO1X54ql; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="oO1X54ql"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afe75f055so602179f8f.2
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 08:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079872; x=1792684672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3In2oOWO8+3UsZU5x8EvcHjp1PcydHDNy8dPtqhayIc=;
        b=oO1X54qlBQAugab6birvpc0WKJW3ShbgET9LTlM/MMM+d2UooQcVkzUbsmM67Ri2Aw
         Gq/zSt/EPdX1rUoQGWCK0xWYJ1oGY4fksbfzAq4z76BYkGKmRI5nc1J+gRKOlSLFLyzV
         2CqklgOR/JR9+cYu7aGBTxvB351yP3OKhpQybtc06VK3/8+aEydgWLfzldvr5sH9cV6I
         oCM4Utbv/HSuM6c/60QC03tRJDTT33YcQ2d9MX+XcOS8Gu5JNCujhXoIdmzUpq6DjOLw
         DMUC6Zd5x818uGYVSw7MrsxCVNiKXqi00hGPdU1SRgAHXvigVwpQY0vadKa6/DTsKG95
         xYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079872; x=1792684672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3In2oOWO8+3UsZU5x8EvcHjp1PcydHDNy8dPtqhayIc=;
        b=Ujk6zFUxGsOklEDA6qxNcsb/oYofXn5P4IP+e0T/mjvN3rNZKOl6v/8C5EeFaCkMKU
         lVuhf2z4eDrovX1+7tb/xv1YgL/oZ7tBqiH7fPfbEN+On2BO2bOEQdN4SY2out9x6oFF
         6JoIbfI6wN4aVDLF9A7B1yUo0XNVdaJj3guDGC29Y+TJx3hSWFCEYv/KQfRY/2eBYXbU
         JwDhhpoYqwZ6V6TeOnhUYgo4kUTkZlXIYvsoidhwWvf9BWsd8IJrNGGyYHJqvJlguBri
         XYjORfamOtNqar4x6lERYcoSa5q4UhZIg2pjAaUF9xj8J0yoNPsduXGPra0ZHJIBmVrJ
         GGoA==
X-Forwarded-Encrypted: i=1; AKwUvBz30j6nNAeH7J5eHwDGQWlx7nQO7OfUhbGFQRM94M/xDPiCwQQGxS8uxjnWtmIRwBgysk01xPzx6w4ceg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK9LAMhMnZH503bDGIk2KlPvp0AKuQh5kisMAFwrsYyIOcbB9EI
	xh0sAYbVix4JX5eG6AXdIotmDLRfgVDB2dKRtoNA26H3mmS5zjgtvU8ZaW5co3DB/Z4=
X-Gm-Gg: AYBFou1ZSO3zbn/SLSdgahWYDFqdEhTSHyhyZFL78jsYOkw11Exv2xrOhF6PGvtqT/K
	nu5TpF8QzOlOXtHjrY2srI7JLamI7my1fxiXU1ozEWMtY8z9rka653shZEcGBNS3uNh6WlCYMYM
	N8Gx0DvXt4ceJlJq2n9HkVn68txJciCsrEibIgsHf0k/yixmc2k/v1PeHZ5M342y6yDtjrGWPhI
	DMdbk1TfjBAVrsh3Y3M4xi21IrJf2Y15UksUITqJ8ykJGhmRs0pUSZy6R9OTFoI+Rfrr9OOkoH1
	xfysJZJwfsEvrV69Ll1gybHl1lGHV7njQlvuJDlLZh/6s1ESjSCO8VYkfPR9Ief/XzbLIJB4VJG
	idGFr+5ugeRpQhG9jyh6kzB7B21epOIx7wTkDlLbGcTChzvGOi7CB8YPBfVXHLV9QurezIl3oam
	CXucuTMG5QvPdNtr39slK+dld5+gsIseZ5tZd7N6a3xT/23JbNRWsWuQu6iabl7RJWUYu0tF/VH
	80TWvSORfgCXkTWaXVOndON4kvlUQ9MDbLGgY8ZGExjQoeBHA==
X-Received: by 2002:adf:e183:0:b0:487:490:8391 with SMTP id ffacd0b85a97d-48dbaadd94cmr38049648f8f.16.1792079871811;
        Thu, 15 Oct 2026 08:57:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:51 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:41 +0100
Subject: [PATCH v4 15/16] media: sony-starvis2: Parameterise exposure min
 and step
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-15-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

All the Starvis2 sensors supported to this point have specified
the range for the SHR (exposure) register as being 4 to
(number of line per frame -1).

Newer sensors are deviating from that, so parameterise
these into the sensor variant, replacing STARVIS2_EXPOSURE_MIN,
STARVIS2_EXPOSURE_STEP, and STARVIS2_SHR_MIN.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 8585f5c93dc2..5f360f557671 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -67,11 +67,8 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR                  CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN                  4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN             1
-#define STARVIS2_EXPOSURE_STEP            1
 #define STARVIS2_EXPOSURE_DEFAULT         1000
 
 /*
@@ -640,6 +637,9 @@ struct starvis2_variant {
 	unsigned int vmax_default;
 	const u16 *hmax_min_link_freq;
 	u16 hmax_min_pixel_array;
+	unsigned int exposure_min;
+	unsigned int exposure_step;
+	unsigned int shr_min;
 };
 
 static const struct starvis2_variant imx678_variant_def = {
@@ -666,6 +666,9 @@ static const struct starvis2_variant imx678_variant_def = {
 	.vmax_default = 2250,
 	.hmax_min_link_freq = imx678_min_hmax_2lane,
 	.hmax_min_pixel_array = 550,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx662_common_regs[] = {
@@ -796,6 +799,9 @@ static const struct starvis2_variant imx662_variant_def = {
 	.vmax_default = 1136,
 	.hmax_min_link_freq = imx662_min_hmax_2lane,
 	.hmax_min_pixel_array = 990,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx675_common_regs[] = {
@@ -983,6 +989,9 @@ static const struct starvis2_variant imx675_variant_def = {
 	.vmax_default = 2024,
 	.hmax_min_link_freq = imx675_min_hmax_2lane,
 	.hmax_min_pixel_array = 528,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx832_common_regs[] = {
@@ -1076,6 +1085,9 @@ static const struct starvis2_variant imx832_variant_def = {
 	.vmax_default = 1136,
 	.hmax_min_link_freq = imx832_min_hmax_2lane,
 	.hmax_min_pixel_array = 990,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 struct starvis2_model_info {
@@ -1247,12 +1259,15 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		starvis2->vmax = format->height + ctrl->val;
 
 		current_exposure = clamp_t(u32, current_exposure,
-					   STARVIS2_EXPOSURE_MIN,
-					   starvis2->vmax - STARVIS2_SHR_MIN);
+					   starvis2->variant->exposure_min,
+					   starvis2->vmax -
+						starvis2->variant->shr_min);
 		ret = __v4l2_ctrl_modify_range(starvis2->exposure,
-					       STARVIS2_EXPOSURE_MIN,
-					       starvis2->vmax - STARVIS2_SHR_MIN,
-					       1, current_exposure);
+					       starvis2->variant->exposure_min,
+					       starvis2->vmax -
+						starvis2->variant->shr_min,
+					       starvis2->variant->exposure_step,
+					       current_exposure);
 		if (ret)
 			return ret;
 	}
@@ -1775,10 +1790,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 
 	starvis2->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
 					       V4L2_CID_EXPOSURE,
-					       STARVIS2_EXPOSURE_MIN,
+					       starvis2->variant->exposure_min,
 					       starvis2->variant->vmax_default -
-					       STARVIS2_SHR_MIN,
-					       STARVIS2_EXPOSURE_STEP,
+						starvis2->variant->shr_min,
+					       starvis2->variant->exposure_step,
 					       STARVIS2_EXPOSURE_DEFAULT);
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,

-- 
2.34.1

