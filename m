Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6F03B2FDB
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 16:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933722; cv=none; b=GKHDt8UrEOLHgzoSZBpPqxF6iRMaIZD/k8Z8ktQgQRnXB0FW/P+lU14r1YS0CFGj72w785i/M1PvGNp7HN3cuQv/lvAn0L9+hz+aCOtTKdo9FCYCzIqodWzc9QmVelCsm9p8UgyvVBPM0VYI8tZaEp1s+QME4f44bN4//Kr4tKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933722; c=relaxed/simple;
	bh=iCYX+cUaCtQ4bN3ALteiERNIDMz9F+FipYW2g2utSpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPeBw8rzX7zTr1OP20cGuDTeEkpwbpIj/xaAhIlKIUDCVKy8cIP+5OB8pOlRTWDJ0lOipEphTP9UCcGg2dmm9gnQEZB20jj+6jwj9R8R/yRonb4ItW84MnMqXPxSNNkVK77+TliF2yO05BPhVfujiR5nO6SHMg8ZQPJJtQ2qgZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPr2uaLi; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPr2uaLi"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482e2fdf5abso508883f8f.2
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 09:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933719; x=1788538519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQLeqh8HcDgzW1atthmYStR7xCvFnxlRC6GnRW5zm60=;
        b=WPr2uaLi3pn4JgxjWSiMEbSe8RYEQG0v28uw7QFwWS+G88dUsD6sZI0iN8sqjKEWFP
         sU7zKKNjWY7jxI3ZpkuD/h/I/YUnd+zxJTDPobPh9EcgOinYyKaDGpeKWs57WY+/49fJ
         dUUoGUkUZdBReeJwVPQRW+L4IESYOJpEflxUC28Pux1SJ7y0Ag2jHyXEfbGEShzWgqj8
         ZRfxSFCubigdxAcUv8XAD6H4SvN3qmZRs6avEwb3rXHmcH8t4qeWrNc3+Vy3d2HXE/kh
         oVFPm+uSN5siihg3WzOldQOzaOQ5VZq+rg5Oh7ONZXwlRsEHJ764o/+CMaF6VD/9W/By
         g2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933719; x=1788538519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQLeqh8HcDgzW1atthmYStR7xCvFnxlRC6GnRW5zm60=;
        b=QeTLW8kyUbTdew9bbewqyjqVtdkgcp1tn3j6Bzp55rsGKMT5c1WrjWJX8taT1eYiV7
         HFVl1aD2lT6mcBq/Z0LJGcWrEnkkkgY9Gy4ZrU5K7SC8uz3SjNgyZ9kOxM6oWYS6XANj
         vzXGn0mjrIZzdvcROc5pr4sXycjJ0f9p5Zd+D0XOIPwjBCmbHrbpjREknzkc8eg+Z+1k
         ti+hf1pZoT5EO4PkfBDazp7v/Srvu69HairnMefoCFeCyMfhWiZkpNHJv1CDr/jF89Zn
         Ap51rfutxtqMw4FlcomttmZDNPyi0CqQmL+gDuKRSpmM8uMmU6jZ/Q2++W2nwjGyKluc
         YH5w==
X-Gm-Message-State: AFuF++mTZVMy9xHHWnfPDM+yeNK9Xx9PyLLnTAYfL0sUQfFxyzTRx6DN
	3MRoW1M6hUGR8Z8rIaohZDDhB10GWKdApZ/8mstr8AUGGW/GjTaBipHmSaeCulSD
X-Gm-Gg: AR+sD13rRQtH/soQbtpCPfj1mgmTM0kmavfYrfCNk19Ed7sVupr5cwae/s8f2Gm+pOe
	QxlbUbbieqvJHxlT2aqWPf5RPd0UjSxrIoTrvNsDfC48cwNY6jPs5oqi2IJedXCdApUnGyJpuqO
	yC/8WrvTSIdwx6NoZjwMgZovn6G0sXFq5aAco0F4xcX/B2aOK5ZCz0ljIlPfhuKMOPeTFthnzcZ
	eRCpQt9p//uGBsfL82D3EhYJ1rR8SuqQC5KmTeKLtmtXjgtJzCN5qd5QS7f9diS9/5/8FaotoJH
	xa6wz62gAKldBgISPBayqatqciH9jRz8d+5Nm+z+1N9vnHOmEzQVwjwK8TWDoVuBGbjAbkC4vlM
	nDr2lCyip+ZNJT3+GGvWeo63pSZFn0IJ0f2CDqKuUHsdQWPwqdtXbaLzUcsCvTm9Fmi2poQs7kW
	wsE2/4t0HA+s1DRjykbZoLHe0FnWCRlCjYRTuZlSHcDgUF0co8Okho+Est/OpE0Dmkmb351VI4k
	xFJ8Sm6abdt6LrfD29JiW+NBWjrvQWoBHEhnDvyrA==
X-Received: by 2002:a05:6000:481a:b0:47f:f43e:f0cd with SMTP id ffacd0b85a97d-482f7977a45mr13716275f8f.4.1787933719359;
        Fri, 28 Aug 2026 09:15:19 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:19 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 08/15] media: ov2740: support 288 MHz link frequency
Date: Fri, 28 Aug 2026 18:14:50 +0200
Message-ID: <8ad0d4958d140486e69c05e55865df49e55cd5b9.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
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

Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/
Link: https://lore.kernel.org/linux-media/apF0Cds9fnqQ7XRg@kekkonen.localdomain/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/i2c/ov2740.c | 45 +++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 18bb3ac9701f..c67fcbad5bdb 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -12,14 +12,16 @@
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
-#define OV2740_MCLK			19200000
+#define OV2740_MCLK			(192 * HZ_PER_MHZ / 10)
 #define OV2740_DATA_LANES		2
 #define OV2740_RGB_DEPTH		10
 
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

