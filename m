Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C3B4A205D
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 19:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289500; cv=none; b=JCSSdlQLPx8Zch3goxmb45UUu82kiMzQkCFlGPuxLC7ak5O2N5e4+kRWEl5mNrHE1x9iZVg7C+MkpEcqtJz77Gy+Yz4Uhc4WBF9Xru81yuhbgK8eNbkL8BrIXRagr3YRvZCvOH9J72Btzdh2v4D3fA24Y9YqGiLlmEo/bibJL54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289500; c=relaxed/simple;
	bh=4JjOP6xA1fWJTzg0nGLviFM/abTCFakLq0J+yMqID+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FEGISkYyL/4UI0kTXjetv/XrnsaNhV7HjIE0dmaZZ7YAgdw0jPyRPfiDoZ/td+1DcImlsHxNxrpJvtVboia1uc8Epj+dnYBV12E3PtxZPGnkwkFkEN0pOFg3CBCcHYpA6+55rk2+HUD0cFCB8h/PKyhWgqz8BLzYCc/0Unqq6dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHSI2Cpi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHSI2Cpi"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so1199715e9.2
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 12:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289496; x=1788894296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brlxyZ2t63L8fQignAF7hkZpVD232LlJffHWx51Zan4=;
        b=RHSI2Cpi1XL4uLINq56yaIGDPYD+PVFNIMEbQLR0tdDF8mzJUG34kl9Lo+T1Yl7iur
         fyl6GbdUd/AuvYiD4IXbJnwcNTqHpzAUHU5qtH3Em+iG17wOezkKj1NNGNPE2AwJiH6o
         JsnsBjG5QEN1lpmiYg++5sZEMAsVpF9H+65MH4yVabChuKv3EAO6kPNHjKreCvY8Mz+/
         zs92NGFRTETY9AZ/UIKfBOceDR8FC3v8I5hUwnAtv8UT5yIJSXD4jXAozPgjmuUOHMgn
         yZLfh63wzlTZ8K5UlYPRSGgnURwOcWXeUr16c5Sk0S47dSXX5XUqnfTvokv4AGHFa52n
         hrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289496; x=1788894296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=brlxyZ2t63L8fQignAF7hkZpVD232LlJffHWx51Zan4=;
        b=JoerbMn7rQjglxPAoEnNqbPUBqt7+9FcUhgciRAMZjcsraWotrS4ch4ueeuaHaFsSs
         sDPD9ZUbjmYYHqtdO+k2RAwIaksAy9YXMrD6pgFsGnIZ9+V4fuySDlyiLoLfyup2qYQ2
         lEHF3NCaibeykL5fmKzMiE0fa2wqyGWImAwP1UqaKjGtIHBD2N6AvSEm/LmK7J4o9Lvy
         cebJn/aTcLDw1sc/DPHmjX9ft4PdmyQUAMj+f8l7hR2AsBhMouk2ZVkhYDScf/jUOrgg
         nxHxVPkbpKCoSJ3USqRPuL/DYJO1yEhmLYIodJLT1QRlciNIT/pbudr9SAWwz+9waoUj
         rTqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+C+O+eYzsIrGC9fFCJWTOiOAQZmVoPbUKMIfg7H4irzIZUm/6DRpt4K0L3jLsbC/uPPUOIv1LLReDzw==@vger.kernel.org
X-Gm-Message-State: AFuF++n76Bb+gP9ByRLml74VE7a2AvcYrF/VocY1DCcC1s2RAhkkdEDF
	rHhKfNAdPPZZT+23wLZYAjU1rNVg25TwvJ/aR8DDYJjugVFbdmv4wOZI
X-Gm-Gg: AR+sD11cYYAjTlCw/OcSrwGZTvWVl9yMszvo3rU0YVLi9IFpdLk9DPTbPstTfgJf6EO
	KWQOeCPTn4IT81iNiSjfg/gdyXW+wULp2/nu043kuFFfkXBsAGNgZWPqscLMWOhrOge1P0L7bGr
	QDQl9BELfR/xlPVxAH/Z69vyi0JulrqXTLLvnsp80ldUCRB21oi73N80y7t/o6NU2zJIDGrMRCW
	hJvX0LYZSFxcX30GAIXXjDWotzcomWjpCj2NRCYI7FDNJF7d8tI1Bea47+lO/BSUd2G+hD05cEp
	i16ig10TFD96xEa7N2hh+QywjDiWhV/n4nwgf4zv0ZLhCw9StyGBivzYD3+Q8dFb/h6Q5lXXAx+
	EnkuHLR6l0t1Svg1tOSqYjRoh6aBZSenDQ4vgBsfXQiFUSk6JCjwxFDGinQ5sQSwUEFb/Dv4sqF
	idL/Xabh2vXWwS1m6DJHTKvZ2D64DSETE8WWzuL0DZohoH90jLMMt8LSsJJGb3Tsgl3wr9l+qtX
	eHqjjSa6QgVnZt6tx6xda1KKM2rxnsTepvDE+hblg==
X-Received: by 2002:a05:600c:3b20:b0:499:8704:242c with SMTP id 5b1f17b1804b1-49b91bd78cdmr481597865e9.0.1788289496316;
        Tue, 01 Sep 2026 12:04:56 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:55 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/16] media: ov2740: support 288 MHz link frequency
Date: Tue,  1 Sep 2026 21:04:30 +0200
Message-ID: <f274b7459e890f05015483804cab62ae0647ae12.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91 front camera uses two CSI-2 lanes at a
288 MHz link frequency. Add the matching PLL configuration and mode
timing.

Reuse the existing 1932x1092 crop and mode register list so the Bayer
order remains SGRBG across link frequencies. Cropping the CSI-2
receiver output to a smaller processed frame is a userspace pipeline
decision.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 43 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 18bb3ac9701f..f3d91c87b3d5 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -12,12 +12,14 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/unaligned.h>
+#include <linux/units.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 
-#define OV2740_LINK_FREQ_360MHZ		360000000ULL
-#define OV2740_LINK_FREQ_180MHZ		180000000ULL
+#define OV2740_LINK_FREQ_360MHZ		(360 * HZ_PER_MHZ)
+#define OV2740_LINK_FREQ_288MHZ		(288 * HZ_PER_MHZ)
+#define OV2740_LINK_FREQ_180MHZ		(180 * HZ_PER_MHZ)
 #define OV2740_SCLK			72000000LL
 #define OV2740_MCLK			19200000
 #define OV2740_DATA_LANES		2
@@ -91,6 +93,7 @@ struct nvm_data {
 
 enum {
 	OV2740_LINK_FREQ_360MHZ_INDEX,
+	OV2740_LINK_FREQ_288MHZ_INDEX,
 	OV2740_LINK_FREQ_180MHZ_INDEX,
 };
 
@@ -142,6 +145,14 @@ static const struct ov2740_reg mipi_data_rate_720mbps[] = {
 	{0x0312, 0x11},
 };
 
+static const struct ov2740_reg mipi_data_rate_576mbps[] = {
+	{0x0302, 0x1e},
+	{0x0303, 0x00},
+	{0x030d, 0x1e},
+	{0x030e, 0x02},
+	{0x0312, 0x01},
+};
+
 static const struct ov2740_reg mipi_data_rate_360mbps[] = {
 	{0x0302, 0x4b},
 	{0x0303, 0x01},
@@ -468,6 +479,7 @@ static const char * const ov2740_test_pattern_menu[] = {
 
 static const s64 link_freq_menu_items[] = {
 	OV2740_LINK_FREQ_360MHZ,
+	OV2740_LINK_FREQ_288MHZ,
 	OV2740_LINK_FREQ_180MHZ,
 };
 
@@ -478,6 +490,12 @@ static const struct ov2740_link_freq_config link_freq_configs[] = {
 			.regs = mipi_data_rate_720mbps,
 		}
 	},
+	[OV2740_LINK_FREQ_288MHZ_INDEX] = {
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mipi_data_rate_576mbps),
+			.regs = mipi_data_rate_576mbps,
+		}
+	},
 	[OV2740_LINK_FREQ_180MHZ_INDEX] = {
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mipi_data_rate_360mbps),
@@ -502,6 +520,22 @@ static const struct ov2740_mode supported_modes_360mhz[] = {
 	},
 };
 
+static const struct ov2740_mode supported_modes_288mhz[] = {
+	{
+		.width = 1932,
+		.height = 1092,
+		.hts = 2160,
+		.vts_min = 1776,
+		.vts_def = 1776,
+		.vts_max = 32767,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1932x1092_regs_360mhz),
+			.regs = mode_1932x1092_regs_360mhz,
+		},
+		.link_freq_index = OV2740_LINK_FREQ_288MHZ_INDEX,
+	},
+};
+
 static const struct ov2740_mode supported_modes_180mhz[] = {
 	{
 		.width = 1932,
@@ -1178,6 +1212,11 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
 			ov2740->supported_modes_count =
 				ARRAY_SIZE(supported_modes_360mhz);
 			break;
+		case OV2740_LINK_FREQ_288MHZ_INDEX:
+			ov2740->supported_modes = supported_modes_288mhz;
+			ov2740->supported_modes_count =
+				ARRAY_SIZE(supported_modes_288mhz);
+			break;
 		case OV2740_LINK_FREQ_180MHZ_INDEX:
 			ov2740->supported_modes = supported_modes_180mhz;
 			ov2740->supported_modes_count =
-- 
2.53.0

