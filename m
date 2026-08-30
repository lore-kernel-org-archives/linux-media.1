Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8440C3ACEEA
	for <linux-media@vger.kernel.org>; Sun, 30 Aug 2026 16:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788105778; cv=none; b=RmdzI8YAhiya9If7pardQEwJ7MOQa4sk3vPhd+0VcBw+IMVTxLauiyYGSy4LPgrYz/rigYLPh92Y7DpscRoa0zQgpvn3Bnjy/CEpjOmUIwlCQHASSevqsKMX7nqnfjoozImaj0VA5ZMBf1U+9t2WMWcpq8zVzSfGeOUesPY0smc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788105778; c=relaxed/simple;
	bh=RHIFxs9YrEaoTa6ZvV6LQUL3AldolGdxoyL81l2Y4vA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NJlZNzLgsCJbptlLBM6l/zL1Ezynk/AlStqZbua/AYQds7Rk0N4nSFHqneWZXy7UbsVZci9oXkqvVcf9wga04ooGxEo+DT6BlzDoyJGiQpmYGD8lwIIged4CXLj/WfpDr2a/6cSE4pZUugFAk/nvR5lKZFX3z0s6ldmV4/AZ8Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ey47t9wb; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ey47t9wb"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8534d507f59so2838161b3a.0
        for <linux-media@vger.kernel.org>; Sun, 30 Aug 2026 09:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105776; x=1788710576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HROlraX6vGLZgnawqAwSnbTcyoz5nQUPKuJqXPgTnHE=;
        b=Ey47t9wbO6UPuZNqIfwVlrfy3QaQ6DagsFw60iN7UjZLfcqj/Bnxxa4nkyzbvbrv+u
         wxxqV040zKrUmd3Gv50IAiagkpBL5qiMGt4J9++sFue2j7KIOmlFjhGoYdleDV0mcxBA
         SqKQullQb5CNzZ157OqteNOos17NANy1MQ/cXi8gFizb2FFMsFcrNbiF3vHNNVpQhxkm
         Yk8CDPMekX0Cpyj9aua+dbkNTMMgzEKlzm/4QHuZXJJFEdv2yL3kn7Ac4kdfgCTucTgD
         cjk/+DsA9yXnYQjaKFAZPcX9y8cdHKXEpRS5pBeC9F3rlneBhE1yDk1zgWXTaT8BuJlr
         0wrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105776; x=1788710576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HROlraX6vGLZgnawqAwSnbTcyoz5nQUPKuJqXPgTnHE=;
        b=L5r+uQ47mWgZyadWoWjGi4jdvESU1Pe/Fg6Llr/BD56fJf+GIC6FGskp7Rv/xDK7d7
         07suZ9c24N3UVIYHOz1MEj9vGkD0WP7ozik3QvU4PRsvBb6JUysOiG50GWBuCPN9P3SY
         n1/Q8trxseI+J96AFsF7DbDXGtoDbkDxjyrut6+bM9ktZWV2jSvlWxthbjcoS0+49AW5
         x7vYE8uM0OKpaLE3qG0IEFekJjETcjoygYb04XNpO2GiZQ9l1kVW+GccnCLECX1hOEst
         +i0wv+DP5Ru8Yp3Dc0m3t6RvFYUkCbpxPEPBPU/Hu6PzmF/PVzQMM18v6QNIxMsete9j
         TQiw==
X-Forwarded-Encrypted: i=1; AHgh+RoACjn6x9MzE4kpLFxPqi7T6dSQHOvBo0k6Fq8UCHwVNHXtmV1UpXQh/o2fc5yFJa6xvyKxoA5BbX58eQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lgddPYnM1bcMIBIxB3k0Ah74Z6PxObMtn1MhBTFctazjvltaNZ
	csIltkLIKSmda9papoAoA5wKZVI5/jhbHoUgsIvKhG/Z8AFc7Ks8kW/x
X-Gm-Gg: AR+sD13oW8mwbQZ1cmyclEhtcbhbzcc2QvWeITZGEs+beXw4+aLGmINsbjQM2rb5VtZ
	8ttBnvqdxEwPUzglTL+91TqqVFbXzDS79U/xg6yLRorvgcRb8fTDpG1dIQa2BAwMI11JbHVbsqe
	l2hwK1JZlEY3GjI73R8EIRpcIo5aWyLKtK8WEaHo7tvEtDOPEs95wApSKv3jrMR5PJAGJLweOzF
	Y7bdaWgsq8Q3Yh23n3Lj2cdn+lyqA3J+jsMboMckp1wTu1ioIz9/VB+n71tbUds1G0RITPL30Z1
	fLAQ0gyDhD4ysZ+0rjr1DnSAYZqS92aY6p4gWAOy4vG+XrXf2DR3FKvb5OU6fpmR3krV4sk5phY
	HyWh9DVLcPpBklrA9GyADzpEcCoGkUX4iNFS8yvUt/zrbe91FrQZWlhjQ3ydE6zaf2vJaaYJix/
	t35jbs7w44vTpRm8Gbk+eq0SwPzURc6LqzfUSGavVRGXstDF900ZJbzRo9kh7Fr2MqkFqGjp5w1
	CIbunDhlH8Dr4PSq59h/TgnfST2A37goYe7mPVNCmgtWu6pNXFV
X-Received: by 2002:a05:6a21:3944:b0:3d3:ae40:ab0f with SMTP id adf61e73a8af0-3d3ae40b247mr22013318637.26.1788105775652;
        Sun, 30 Aug 2026 09:02:55 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:02:55 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 2/5] media: hi846: Fix link frequency handling
Date: Mon, 31 Aug 2026 00:00:22 +0800
Message-ID: <20260830160025.211384-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830160025.211384-1-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Link frequency is tied to PLL configuration, lane count, and external
and configurable clock, so use runtime here instead of hardcoding for
specific configuration. To implement this, we do

1. Drop fixed link freqs, we calculate the driver supported values and
use v4l2_link_freq_to_bitmap() to get the intersection with the DT
supported values.

2. Attach mipi_clk_div_{2,4}lane to current mode, and use the div with
mclk clock, lane count to calculate link frequency.

3. Drop mclk clock rate check.

Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v6:
- Add link freq ctrl back (Sakari)
- Use v4l2_link_freq_to_bitmap() to get matched link freqs (Sakari)
- Move clk_get() before than hi846_parse_dt(), since we use clock in hi846_parse_dt()
v5:
- Use separated fields instead of raw register values for PLL cfg (Sakari)
- Use mul_u64_u32_div() to avoid loss of pricision and u64/u32 issues (Sakari)
- Drop line break (Sakari)
---
 drivers/media/i2c/hi846.c | 151 ++++++++++++++++++++++++--------------
 1 file changed, 94 insertions(+), 57 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 7f069aca0fce..2f8624f9bdf3 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2021 Purism SPC
 
-#include <linux/unaligned.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -11,6 +11,7 @@
 #include <linux/pm.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -219,8 +220,8 @@ struct hi846_mode {
 	/* Horizontal timing size */
 	u32 llp;
 
-	/* Link frequency needed for this resolution */
-	u8 link_freq_index;
+	u8 mipi_clk_div_2lane;
+	u8 mipi_clk_div_4lane;
 
 	u16 fps;
 
@@ -1040,13 +1041,6 @@ static const char * const hi846_test_pattern_menu[] = {
 	"Resolution Pattern",
 };
 
-#define FREQ_INDEX_640	0
-#define FREQ_INDEX_1280	1
-static const s64 hi846_link_freqs[] = {
-	[FREQ_INDEX_640] = 80000000,
-	[FREQ_INDEX_1280] = 200000000,
-};
-
 static const struct hi846_reg_list hi846_init_regs_list_2lane = {
 	.num_of_regs = ARRAY_SIZE(hi846_init_2lane),
 	.regs = hi846_init_2lane,
@@ -1061,7 +1055,13 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 640,
 		.height = 480,
-		.link_freq_index = FREQ_INDEX_640,
+		.mipi_clk_div_2lane = 4,
+		/*
+		 * Dummy but necessary if we set this mode default, otherwise
+		 * hi846_calc_pixel_rate() will be broken in
+		 * hi846_init_controls()
+		 */
+		.mipi_clk_div_4lane = 8,
 		.fps = 120,
 		.frame_len = 631,
 		.llp = HI846_LINE_LENGTH,
@@ -1086,7 +1086,8 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.link_freq_index = FREQ_INDEX_1280,
+		.mipi_clk_div_2lane = 2,
+		.mipi_clk_div_4lane = 4,
 		.fps = 90,
 		.frame_len = 842,
 		.llp = HI846_LINE_LENGTH,
@@ -1112,7 +1113,8 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 1632,
 		.height = 1224,
-		.link_freq_index = FREQ_INDEX_1280,
+		.mipi_clk_div_2lane = 2,
+		.mipi_clk_div_4lane = 4,
 		.fps = 30,
 		.frame_len = 2526,
 		.llp = HI846_LINE_LENGTH,
@@ -1167,6 +1169,9 @@ struct hi846 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
 
+	s64 link_freqs[ARRAY_SIZE(supported_modes)];
+	int num_link_freqs;
+
 	struct mutex mutex; /* protect cur_mode, streaming and chip access */
 	const struct hi846_mode *cur_mode;
 	bool streaming;
@@ -1192,21 +1197,41 @@ static const struct hi846_datafmt *hi846_find_datafmt(u32 code)
 	return NULL;
 }
 
-static inline u8 hi846_get_link_freq_index(struct hi846 *hi846)
+static u64
+hi846_get_link_freq(const struct hi846 *hi846, const struct hi846_mode *mode)
 {
-	return hi846->cur_mode->link_freq_index;
+	u64 mclk = clk_get_rate(hi846->clock);
+	u8 mipi_clk_div;
+
+	if (hi846->nr_lanes == 2)
+		mipi_clk_div = mode->mipi_clk_div_2lane;
+	else
+		mipi_clk_div = mode->mipi_clk_div_4lane;
+
+	/*
+	 * HI846_REG_PLL_CFG_MIPI1_H = 0x025a, it is fixed in listed modes
+	 * [11:8]: 0x02 => pre_div = 3
+	 * [7:0]: 0x5a => multiplier = 90
+	 */
+	return mul_u64_u32_div(mclk, 90, 3 * mipi_clk_div);
 }
 
-static u64 hi846_get_link_freq(struct hi846 *hi846)
+static int hi846_get_link_freq_index(const struct hi846 *hi846,
+				     const struct hi846_mode *mode)
 {
-	u8 index = hi846_get_link_freq_index(hi846);
+	u64 link_freq = hi846_get_link_freq(hi846, mode);
+	int i;
+
+	for (i = 0; i < hi846->num_link_freqs; i++)
+		if (hi846->link_freqs[i] == link_freq)
+			return i;
 
-	return hi846_link_freqs[index];
+	return -EINVAL;
 }
 
 static u64 hi846_calc_pixel_rate(struct hi846 *hi846)
 {
-	u64 link_freq = hi846_get_link_freq(hi846);
+	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
 	u64 pixel_rate = link_freq * 2 * hi846->nr_lanes;
 
 	do_div(pixel_rate, HI846_RGB_DEPTH);
@@ -1429,8 +1454,8 @@ static int hi846_init_controls(struct hi846 *hi846)
 	hi846->link_freq =
 		v4l2_ctrl_new_int_menu(ctrl_hdlr, &hi846_ctrl_ops,
 				       V4L2_CID_LINK_FREQ,
-				       ARRAY_SIZE(hi846_link_freqs) - 1,
-				       0, hi846_link_freqs);
+				       hi846->num_link_freqs - 1,
+				       0, hi846->link_freqs);
 	if (hi846->link_freq)
 		hi846->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
@@ -1503,10 +1528,9 @@ static int hi846_set_video_mode(struct hi846 *hi846, int fps)
 	u64 frame_length;
 	int ret = 0;
 	int dummy_lines;
-	u64 link_freq = hi846_get_link_freq(hi846);
+	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
 
-	dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__,
-		hi846_get_link_freq(hi846));
+	dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__, link_freq);
 
 	do_div(link_freq, fps);
 	frame_length = link_freq;
@@ -1699,6 +1723,7 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	const struct hi846_datafmt *fmt = hi846_find_datafmt(mf->code);
 	u32 tgt_fps;
 	s32 vblank_def, h_blank;
+	int idx;
 
 	if (!fmt) {
 		mf->code = hi846_colour_fmts[0].code;
@@ -1749,7 +1774,14 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	mf->code = HI846_MEDIA_BUS_FORMAT;
 	mf->field = V4L2_FIELD_NONE;
 
-	__v4l2_ctrl_s_ctrl(hi846->link_freq, hi846_get_link_freq_index(hi846));
+	idx = hi846_get_link_freq_index(hi846, hi846->cur_mode);
+	if (idx < 0) {
+		dev_err(&client->dev,
+			"failed to get link freq index: %d\n", idx);
+		return -EINVAL;
+	}
+
+	__v4l2_ctrl_s_ctrl(hi846->link_freq, idx);
 	__v4l2_ctrl_s_ctrl_int64(hi846->pixel_rate,
 				 hi846_calc_pixel_rate(hi846));
 
@@ -1947,20 +1979,33 @@ static int hi846_identify_module(struct hi846 *hi846)
 	return 0;
 }
 
-static s64 hi846_check_link_freqs(struct hi846 *hi846,
-				  struct v4l2_fwnode_endpoint *ep)
+static int hi846_add_link_freqs(struct hi846 *hi846, struct device *dev,
+				struct v4l2_fwnode_endpoint *ep)
 {
-	const s64 *freqs = hi846_link_freqs;
-	int freqs_count = ARRAY_SIZE(hi846_link_freqs);
-	int i, j;
-
-	for (i = 0; i < freqs_count; i++) {
-		for (j = 0; j < ep->nr_of_link_frequencies; j++)
-			if (freqs[i] == ep->link_frequencies[j])
-				break;
-		if (j == ep->nr_of_link_frequencies)
-			return freqs[i];
-	}
+	s64 hi846_link_freqs[ARRAY_SIZE(supported_modes)];
+	unsigned long freq_bitmap;
+	int ret, i;
+
+	/*
+	 * Since the MCLK freq varies between platforms, calculating driver
+	 * supported link freqs here.
+	 */
+	for (i = 0; i < ARRAY_SIZE(supported_modes); i++)
+		hi846_link_freqs[i] = hi846_get_link_freq(hi846, &supported_modes[i]);
+
+	ret = v4l2_link_freq_to_bitmap(dev, ep->link_frequencies,
+				       ep->nr_of_link_frequencies,
+				       hi846_link_freqs,
+				       ARRAY_SIZE(hi846_link_freqs),
+				       &freq_bitmap);
+	if (ret || !freq_bitmap)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(hi846_link_freqs); i++)
+		if (BIT(i) & freq_bitmap) {
+			hi846->link_freqs[hi846->num_link_freqs++] = hi846_link_freqs[i];
+			dev_dbg(dev, "Add supported link frequency %lld\n", hi846_link_freqs[i]);
+		}
 
 	return 0;
 }
@@ -1973,7 +2018,6 @@ static int hi846_parse_dt(struct hi846 *hi846, struct device *dev)
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
 	int ret;
-	s64 fq;
 
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep) {
@@ -2004,11 +2048,10 @@ static int hi846_parse_dt(struct hi846 *hi846, struct device *dev)
 		goto check_hwcfg_error;
 	}
 
-	/* Check that link frequences for all the modes are in device tree */
-	fq = hi846_check_link_freqs(hi846, &bus_cfg);
-	if (fq) {
-		dev_err(dev, "Link frequency of %lld is not supported\n", fq);
-		ret = -EINVAL;
+	/* Add link frequencies which are supported by both DT and the driver */
+	ret = hi846_add_link_freqs(hi846, dev, &bus_cfg);
+	if (ret) {
+		dev_err(dev, "failed to add link frequency %d\n", ret);
 		goto check_hwcfg_error;
 	}
 
@@ -2041,30 +2084,24 @@ static int hi846_probe(struct i2c_client *client)
 	struct hi846 *hi846;
 	int ret;
 	int i;
-	u32 mclk_freq;
 
 	hi846 = devm_kzalloc(&client->dev, sizeof(*hi846), GFP_KERNEL);
 	if (!hi846)
 		return -ENOMEM;
 
-	ret = hi846_parse_dt(hi846, &client->dev);
-	if (ret) {
-		dev_err(&client->dev, "failed to check HW configuration: %d",
-			ret);
-		return ret;
-	}
-
+	/* Get the MCLK first, since we need it to calculate link freqs */
 	hi846->clock = devm_v4l2_sensor_clk_get(&client->dev, NULL);
 	if (IS_ERR(hi846->clock))
 		return dev_err_probe(&client->dev, PTR_ERR(hi846->clock),
 				     "failed to get clock: %pe\n",
 				     hi846->clock);
 
-	mclk_freq = clk_get_rate(hi846->clock);
-	if (mclk_freq != 25000000)
-		dev_warn(&client->dev,
-			 "External clock freq should be 25000000, not %u.\n",
-			 mclk_freq);
+	ret = hi846_parse_dt(hi846, &client->dev);
+	if (ret) {
+		dev_err(&client->dev, "failed to check HW configuration: %d",
+			ret);
+		return ret;
+	}
 
 	for (i = 0; i < HI846_NUM_SUPPLIES; i++)
 		hi846->supplies[i].supply = hi846_supply_names[i];
-- 
2.55.0

