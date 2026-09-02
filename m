Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F8D4A5EB7
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 14:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360850; cv=none; b=KeV4iTPh1C+XyCyRGcRMy78Vw06i+I/sq1BZSkAuSTIzAdcBN9cJzRMgHRY+w36yS9ozFGtQw/pq2MkI3xD0rBLQEC39AgksF3nRrcJ+WPJAKKcr6wE4uE6AX/v3wEjAgjp8mVl7BFfHemoAQvl/v+CZUSGPmYytWKXlLQ5qQ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360850; c=relaxed/simple;
	bh=4JjOP6xA1fWJTzg0nGLviFM/abTCFakLq0J+yMqID+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UHZnk00g3oDiohjIFeCapBJmS29Laj6xWVy/9cvBjLqZ7Q/oUtbPkpug8UpRDqCN6TWSdyExsZvnBl+BHSvY9OE2/wObU80L3Mkn4YhE/Zhwgc2vnXE6oQBoyoGntBqG50Ggl0Yf9W/eyOI+ODhm+BBI4nxVxdFWWFORd638FgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bkmlr74p; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bkmlr74p"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482dd6ee390so1164053f8f.3
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 07:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360844; x=1788965644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brlxyZ2t63L8fQignAF7hkZpVD232LlJffHWx51Zan4=;
        b=Bkmlr74pF9BV96kDstPUPzeMqUcJzUMl4FDP740XVLZHDQYIWJiRRRXmeGDhLc5k1I
         hg/bVgD7Y/034NFFH+98nYXsPlOs5qkOb2UQi2wRAeAsx1RvRRkRRFXi3P/A/T39UGmC
         pJpe5mOwic7isM0lEOBDEu5OmFVl5sQtWveWTbSxPllZbIw0Wyo4eqseDa9lIseig6wK
         xKHPgjP12E5Xodm+SQpQtX7B/rQdKiYdlYwNaIOR2OMfyCRhJxvDOlk4gJiilKHGTX4l
         ZwOOBvjdWiFZmrrYpxT7ZongYZxrU9PjFYMqxQ2DjVPSBfKXRmN111Srw92IUU1v2/au
         v4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360844; x=1788965644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=brlxyZ2t63L8fQignAF7hkZpVD232LlJffHWx51Zan4=;
        b=dtWyFl+Hz1sQt1orlYdSYRw6SZcPuh/u1StJD/wUZqzdyo+s71RhsVfbsOOiTaVA6S
         NPmqdb7LmA7eExXiY5bxhng7wr22Ay+Q6oK93AnHyMY4L0EYyPZrURtdcfudS6hpQJQq
         +tmIPdpqabo96EsXD/QGVjSpIeWUo5l5aRPBto+aanmXl0xJ5JJMTPInG9yoXN9DOkkx
         ct31v3jsIedzsiDIQdIBZmDZjeWjCVqh7IQWaCmmLR/Ju3Kcdzy6qpmme6KlBOqJ7LYz
         ixV2Yu3HOPA9ATwaL2IVqESi9tE1VO2PIX2j/Y9Rp0BINwu//HC4EVA+/A8hl+m2lj05
         XVrw==
X-Forwarded-Encrypted: i=1; AKwUvBwRjypjmtVRNAQTrayJSFUwA5QMbnNw7G4r5t7DEoRbGKgDf0z8UGYObylSmkQ8oeMvDuqf3n9zePm48g==@vger.kernel.org
X-Gm-Message-State: AFuF++mWIChvKuIiFCgwIM2DX7caafSwFrAAaUxz29m1r6bosZJfl+sb
	tAY00D9mzR5THWjORX0mGg4qmaMPq85HqUTiRW2ipq7UMN3njQqwH6D1
X-Gm-Gg: AYBFou2dBMTqgeUnpigg5tk9qS7zF9HzExDM9gvPDzbmYUWxC8JfYDTwTvbWdES8Z/U
	KJ5c6UUmDo+NtzPEw8Dtpk6AC/aX3gPpdTnAWvpmHuWbGl8tiRV/bH5a75gvFux9Qq8lDW3EPdv
	zdafe7C0UAwrjtgpGZa0ejtECxGNVabvKREtSyrV2vizn2NGqzwTnVhGbJON5z1yFNytn9wyBWw
	iQ1H7VSsCNHXqwnKZ5lRfkvnfeaZjUpbsJZrFxaKeyFYsGaY+gCJYug+eEh9Q71+wp13LgPq2DK
	B3buhT+P60Ekp+51z2yqNf5XLeVaDH1MDLrJoQaDbixuhhB91fcxHMcHInvF7ApM7yVl661yo0l
	AmoEiy6G6w70sJtut48MfOhovnCjHL2ks3IXjVH2NlcmVGXzYV6DS0IVcOfHRNPO0VKjtL3oldA
	dmbKz5/p7NLnsp52zCj0QPQZPuE0iLu59NCCcHoIUcaiOKQGQnD76aCM7aqcMDiKthFdPR+XY7H
	fYNJxJARzFRPQaWBb9LZX1Ppm3Sey7Rzb9Dz4icxV5hpvl26DsIEqU=
X-Received: by 2002:a05:6000:1847:b0:484:3931:c698 with SMTP id ffacd0b85a97d-48488dee004mr9537119f8f.5.1788360843914;
        Wed, 02 Sep 2026 07:54:03 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:03 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 08/16] media: ov2740: support 288 MHz link frequency
Date: Wed,  2 Sep 2026 16:53:37 +0200
Message-ID: <f86a0f5b228f99bc045cd019d89182021678a0f0.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
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

