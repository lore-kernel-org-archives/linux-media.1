Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267983;
	b=JgnrKpd/675H8jUolk5p/MgKTeWMob2OA4KGzrovcw3gOysI+RrgQfrXGg95HVlY8K5J
	 zvNC08YK/dO5rVPqm6L7IJjhyKiUBYe7hGZKMkKIbHR7BuBIlp6o7mrN5FqcvjxHV2Ip3
	 P1Y8PA652pWn7iCnaxhk2lbiw5ePRZzcjbLVvQLpzyKkT39oo4SvXojhwwfudn4bu5Qzz
	 nV8Rf8jRUJPirZuyqNSuodF9L2HtrA9N/BNQzxFSvEIz6lUEKEllgeh2sAnDLfPOyZ+Gm
	 quogdFi768g727y6tFrAvd62mVsY4O3jFL4MhO/rdrEhKEHx1wLgRYted+7my4yiArg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zwpdxzq/WcfSOjL57zIT4PrpsEc3o3kmbfQWvILYAxU=;
	b=OXp+7d7O0PFT4Y+kXJVCpiSfr9W7dCbuQAIRSmT35agAFH9nClhp/lRhGP1+Udwc4yVl
	 k69/tKmQG3NmwXMJ6L9TRaaA9ppTfs2M5CPuHYjX7hLFYQWummcGNJT0ZZtrs9JhRTQXe
	 73nQIRct6T1lXe8Xd5jnrOCunZ8+HNivt0yysDXlWaKLYoBO5B9AiMvO/kTUp/Jm7Lokt
	 CjxZK2NUtgYR2UXvkp8Ub9xxIOQocN/sIkRk9x+iO+ylA+wMlr2uP8p139hYiu/bWpQGG
	 QQ7TUJ35BCQ0OggGgAM+zHF7PPtAUJ9TVo1Vi0qaejjSkl0OG86RPsfT9DPNCJ2H5Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LWl//dU0";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D671F606A6BB
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 13:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D671F606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LWl//dU0
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so16511885e9.2
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 05:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267981; x=1795872781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwpdxzq/WcfSOjL57zIT4PrpsEc3o3kmbfQWvILYAxU=;
        b=LWl//dU03z1C+qSwkZvXEy4JwPY9iXsSDmJSk/UxOd9UpUr6ZVgbwex+7kp6CfTrUR
         cLyg6AEM2ToTPGVdg/ZrKf3tWhYGyDyEoIM3TBOdyPoMokOw39wAm9gXLyqij7SgQA+y
         Hb+ED4JRi2pI5rHWTRUO0ycFCDMm6hXjx80E6BDFG+4zoyzGEnJnSAxRZAuVnXlqrREN
         jPOVIk1BqhojkuTmi2aS8OiqXYkLNCaijrvyuMHMCPjkwiCDzyXesriLF9Onae4ra7ND
         Qpk/rgWs0o5oc1d7PgRMKTd49g0dT/HUsY/C4Yj/w8gV3cpjnJG+8V/6NFFvJsn15ydE
         YXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267981; x=1795872781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwpdxzq/WcfSOjL57zIT4PrpsEc3o3kmbfQWvILYAxU=;
        b=U2RY0dA0nYUgRwF2Bu8JzFX6HE9vvA6/BdpUvpC2Ta1LWOKvWYOGeNHqFPxr+XSW0a
         fP7kixqFx7VHYNev1mn51AOldgO/4Ydf2pasdZUvSeO5tsUa33bHfQG3jL+3hGD77d0m
         JqXpauhlR2B0JhP0ZQTQ0dptfIYahjhHUUPGeJimw9+3AFF2kxVGQ4bQ3dpE0C5aOibm
         ikxBbc4Ha/KPOlLxVpBF7GG08XtvHFRhCQS1sIRdbDJSNAzUcQBRl7cD+1MmmoZhWbIH
         D2ex5SNM/ZufdUCeN+vy1xFjiEHsUQheAqRyLJvO+Sd9TCiDPGprDJdW/ZAxrVTitkPJ
         oPwA==
X-Gm-Message-State: APuU4Z+E36yYdI5P3+MW8ZqBlXAo8lToPGnUtntHmYw692gwVtQWgw4Y
	wba11eWkYGGAT5UiZeEzKDXfM5Zps75hGfIsuogjuHLfolG1q7fsB7kyq9LG8A==
X-Gm-Gg: AZFdTZcN+BRiLVgAhz4FNrUUd3Y1t1cOE4OM9FAWKNVDX7ZCvNOMfIrquLPnAgpKvDl
	ONzZ86VnTfzf5z+pYlWv5/NK3lVqoXJ7MCw8QjL/yxq1QcbyfG7akSKd/97IQrRzdUwW+MIaP/9
	IKKIpZy//5ZkYAO21L1nemZ/ZoxLe1jpS1K3pZD1TtWcizN/SBQzi7m1n0KD0aV5OsZosEzHRQ7
	CR8zr+4ezgpMTxApJzyGoFnVQYRa67JETGY6py8GKFYmI927O6FJrxISi3Q8BZGA5laFoZ4sgWv
	EZ1sxGA1uCki6hygUJ5XciYkw6/fWN6oTcviwCG3SACSoG2N+fq/e8hu/6PG8DshhtBKj3gjANL
	YOQ1/hKIFqSFrmGFdq1JLTL2iVwxDqoEgBTWbtnE/puLkNrZRKgfnJxwrbGgAUB84YXE/1ibq5+
	5Y18STVIGfzxWmjpEKwX7GuGCY3NQrKB6jrvfDySdgNQ0bgZADPqi1A+cTq3W/kuJdSaTI1fvE3
	YzlrMPPAC08sAjUKVglVupqKc4a6nE1gv4iJwsWHrB3XhtvcbU+TQnCfgh2ianiN15BGXj7fEUs
	bAucjcTivc27HMLG2CdPL8/TTsDTfwhsoIv5e80/zK+w2Kj3R6xtsEc/rcL/YdYSBr5z/RI1UiQ
	/+H+aJIo8NIGb
X-Received: by 2002:a05:600c:4e87:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4bb88938d38mr144837645e9.30.1795267981193;
        Sat, 21 Nov 2026 05:33:01 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:00 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 07/14] media: ov2740: support 288 MHz link frequency
Date: Sat, 21 Nov 2026 14:31:37 +0100
Message-ID: <3885fc22c2a195125139d5d748a65e739acf0871.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
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

The Lenovo Yoga Book YB1-X91 front camera uses two CSI-2 lanes at a
288 MHz link frequency. Add the matching PLL configuration and mode
timing.

Reuse the existing 1932x1092 crop and mode register list so the Bayer
order remains SGRBG across link frequencies. Cropping the CSI-2
receiver output to a smaller processed frame is a userspace pipeline
decision.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 43 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 7d786d09f..30eb58eed 100644
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
@@ -1179,6 +1213,11 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
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


