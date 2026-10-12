Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68A9490C0A
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 14:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815743; cv=none; b=kGmeWDuffHMkKsJF+UF2DszYO64mpO3cexQu1v9rXu2sNNwkKPN4fs7YsWHqDZz8v8FrrTh07P7U2S22LdjrxX7pq7TpoufEg6ARwvfoN+A0PqqxJFYOolLNpycCYMNuPuW1pFeJFFtK10su3L3m0vqaeE4a7AwMbRNxBnRokW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815743; c=relaxed/simple;
	bh=Ss47ZgD09dOj/UKeJPH9Y9COWloBGKnaLz+6F8Ki/do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GOSXVSmieS4QxZSfPIbvjd2YGK3V7T4hFUHnyCzoBpMuDITd+3j+Q451Pe3fcntLdqRrElKxXtnRgHOH3ZVf7wjnB55P0c9t1ZVSuwFmumK7HmR+lD7rV3Vw5r2TZG2NfwksFdxMaZdcx/VWdvaWe583G9cmbDie2OeMOpb/9iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5FbbveF; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5FbbveF"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afe0081a6so1349035f8f.2
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 07:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791815737; x=1792420537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNPmkzGpWJi91RdX/MwSYm28MsounCEy4wd+YqulLmE=;
        b=l5FbbveFlnegMr4GFNQXjN08h5GRPUaA7V7gzfD7tOPLsLET++xeaRjEPnpuaR1D5O
         BDb5nnHSRP82LiLX/gXl1Xvjbh+8KN/LFsF51yY+NXAD8Nv5WfSFARRPOOxkZydxeduh
         CgOC0MZYWTMoVAoEgobKtk6UbcbQ/Q4/ZA5yN1/pqPYQdCoj7a+liv6n/97FTySgqyGx
         BG35W9WE/taS4t4jyWsHPgrvBvsmoYqvLts6WcNrqX/XMXAOnlH46sK2d2ecWcipPdiX
         7YV1K1QiTUPDDrn9CsvgYyefrICREgWipZLNtNjM1ROd7owUoAyYWgr8rkQtfbbnd4D8
         VKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815737; x=1792420537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yNPmkzGpWJi91RdX/MwSYm28MsounCEy4wd+YqulLmE=;
        b=kAejMKfJypCbdjPoKTTSaF6/o4WwQVKl2/+jlU5QHzug9/aqeWFgRcflbGx21hecZE
         tgsO3NE8yx1jdu+Xop8jE2baZ4qW5mIz+VEwegtW+cHGhci0U5wFn9FvkMs03FgYyQ7w
         DiacTgnLZY8ST2xdaMaSFYqPg3zEMOTtr25b6bwi+MJDqV7EBiksJyZ1H1HMaCDwgtgK
         m/FhnqDQtRkYRsDfYCl/IaXe8ZkMdIFfWWHEHyH8MynrHHvvXEes8DW3jCsiC7pNVuMk
         EVfDOkpNyTLFYCRWz5NGbgSYyBm44s4bepLHMiEMGFP0P+QkTm93jPdiaDaxYapqFI1d
         kN+Q==
X-Forwarded-Encrypted: i=1; AKwUvByJZm36whZoR+0qKqY3/ZbOs64uj+qECr1/KxE+dV4WfVYQLoYE9PCVI2zrQE1ZwhK0C/DZDajAyyeuEw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIA6wcFFARPkvXPjqTSbwN2RZVnziFgOSCjnGvESFvHGRo2NzJZ
	4pBAJm8KRuV1MwxgoaMGUuW83S6C7vKKaz/ZRxAk884cIslj6IcSYEVc
X-Gm-Gg: AYBFou0NXGdNKRbkmxXPl21Q05We4hPrmaCjHVloVfGeYqNQzWIJkAmMNsFsnqvV8xs
	nzeq0gaF5+jNQZgmWg6tCtyXKi0tPDPSw7uw/xgHwbopHrVeBh2Si2BM+r88YGrU1exYmi9Wfqg
	miRseAwoGskHfHoDoKiAB3ADe7lbZyQ523TzJoovfe7E1ZeugE88hSx7DyQm5kFswqPDV+NwnoR
	n1TaPVDelL8w33Fk+XmHljgGZ3qSWe7a0tLwlDWZ2UAHaNN9AmjB5jdCTnirtbKJdd8lako0jS4
	5Bla8uqfIYMIuxOMz9FG3NRut3Y7mPr9fhTrF/Pzh2JciFetJsXxS4Tu4UCpkM6aeQv/dF3OYDR
	FR//AOyEhlR/UcG425WoG3/MalExD8+fCUa8ej/X+8vLv/G6xzFYQcLpPkCAbNfThHTjsycaNaQ
	mSY4p5kWizU9o4LFU84kkXWO/4JVCea1mHRnb+kuTeV4z08dfq6xgbyDr8iD1611OCN3Kk/d+4F
	cLwGw1K078hGNC4wyXPmlCLMLRnJ1UrPEeaMFY2TnsBWcBP8oKLjoOnZJMnjcz8V7RG0RYztIKM
	C912eU5FYSFIaoWTg0a042r0cexnko09ZFQDTFZS6oHoE+ACQW9X5smnEWsG9+4K7jzMLyqV8Hx
	+sLz6r5v/FreQktCaqt2ORiQrx+LmMfiS1wcVE1CMCr1/FC30+BaWmgw=
X-Received: by 2002:a5d:4404:0:b0:488:8c99:fbc8 with SMTP id ffacd0b85a97d-48dbacec9c3mr13938633f8f.50.1791815736792;
        Mon, 12 Oct 2026 07:35:36 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20899559f8f.9.2026.10.12.07.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:35:36 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] media: i2c: gc8034: Add crop support
Date: Mon, 12 Oct 2026 16:34:41 +0200
Message-ID: <20261012143443.34897-6-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012143443.34897-1-nicfio@gmail.com>
References: <20261009072733.39877-1-nicfio@gmail.com>
 <20261012143443.34897-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the crop selection on the source pad, as for the GC5035: the
vertical crop is done by the readout window, the horizontal crop by the
sensor output crop, as the column start register only gives valid images
at some values. Crop offsets are even, to keep the RGGB order, and sizes
are multiples of 4. The width ranges from 512 to 3280: up to 384 columns
the CSI-2 receiver gets corrupted frames, 448 worked and 512 is kept as a
conservative minimum; an output as wide as the readout window causes
CSI-2 errors. The height ranges from 64 to 2448: with readout windows
taller than the vendor one (2464 rows) the frames get longer than
computed.

set_fmt and the vertical blanking behave as in the GC5035 driver.

Tested in the same way as the GC5035: v4l2-compliance and crop rectangles
at the bounds, in the corners, at the minimum size and in the centre.

Assisted-by: claude-opus-5-5 coccinelle sparse smatch
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---
 drivers/media/i2c/gc8034.c | 168 +++++++++++++++++++++++++++++++++++--
 1 file changed, 161 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/gc8034.c b/drivers/media/i2c/gc8034.c
index c21fb8510..732ee6c78 100644
--- a/drivers/media/i2c/gc8034.c
+++ b/drivers/media/i2c/gc8034.c
@@ -8,6 +8,7 @@
  * The registers and sequences come from the Rockchip BSP driver,
  * rockchip-linux/kernel, branch develop-5.10.
  */
+#include <linux/align.h>
 #include <linux/array_size.h>
 #include <linux/clk.h>
 #include <linux/container_of.h>
@@ -17,6 +18,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/math.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -89,6 +91,12 @@
  *
  * The default crop rectangle is the 3264x2448 image of the vendor register
  * sequence, at (8, 52) in the area.
+ *
+ * Output widths up to 384 pixels gave corrupted frames on the CSI-2 receiver,
+ * 448 pixels and above worked; 512 is kept as the minimum. With a readout
+ * window taller than the 2464 rows of the vendor sequence, the frames were
+ * longer than the timing model below by the extra rows, so the output height
+ * is limited to 2448.
  */
 #define GC8034_AREA_WIDTH		3282
 #define GC8034_AREA_HEIGHT		2500
@@ -102,6 +110,10 @@
 #define GC8034_CROP_TOP			52
 #define GC8034_WIDTH			3264
 #define GC8034_HEIGHT			2448
+#define GC8034_MIN_WIDTH		512
+#define GC8034_MIN_HEIGHT		64
+#define GC8034_MAX_WIDTH		(GC8034_WIN_WIDTH - 4)
+#define GC8034_MAX_HEIGHT		2448
 
 /*
  * The frame is the readout window plus 20 lines plus the blanking register.
@@ -210,6 +222,7 @@ struct gc8034 {
 
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 
 	struct regmap *regmap;
@@ -487,14 +500,55 @@ static int gc8034_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index > 0)
 		return -EINVAL;
 
-	fse->min_width = GC8034_WIDTH;
-	fse->max_width = GC8034_WIDTH;
-	fse->min_height = GC8034_HEIGHT;
-	fse->max_height = GC8034_HEIGHT;
+	/* The output size is the size of the crop rectangle. */
+	fse->min_width = GC8034_MIN_WIDTH;
+	fse->max_width = GC8034_MAX_WIDTH;
+	fse->min_height = GC8034_MIN_HEIGHT;
+	fse->max_height = GC8034_MAX_HEIGHT;
 
 	return 0;
 }
 
+/*
+ * Update the controls that depend on the output size. Called with the state
+ * lock held, which is also the control handler lock.
+ */
+static int gc8034_update_ctrls(struct gc8034 *gc8034,
+			       const struct v4l2_mbus_framefmt *format)
+{
+	s64 exposure_max;
+	int ret;
+
+	ret = __v4l2_ctrl_modify_range(gc8034->hblank,
+				       GC8034_HTS - format->width,
+				       GC8034_HTS - format->width, 1,
+				       GC8034_HTS - format->width);
+	if (ret)
+		return ret;
+
+	/*
+	 * As in ov01a10, setting the format or the crop rectangle resets the
+	 * vertical blanking.
+	 */
+	ret = __v4l2_ctrl_modify_range(gc8034->vblank, GC8034_VBLANK_MIN,
+				       GC8034_VTS_MAX - format->height, 1,
+				       GC8034_VBLANK_MIN);
+	if (ret)
+		return ret;
+
+	ret = __v4l2_ctrl_s_ctrl(gc8034->vblank, GC8034_VBLANK_MIN);
+	if (ret)
+		return ret;
+
+	exposure_max = round_down(format->height + gc8034->vblank->val -
+				  GC8034_EXP_MARGIN, GC8034_EXP_STEP);
+
+	return __v4l2_ctrl_modify_range(gc8034->exposure, GC8034_EXP_MIN,
+					exposure_max, GC8034_EXP_STEP,
+					min_t(s64, GC8034_EXP_DEF,
+					      exposure_max));
+}
+
 static void gc8034_fill_format(struct v4l2_mbus_framefmt *fmt,
 			       const struct v4l2_rect *crop)
 {
@@ -537,6 +591,102 @@ static int gc8034_get_selection(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int gc8034_set_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct gc8034 *gc8034 = to_gc8034(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect rect;
+	u32 max_width, max_height;
+
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    v4l2_subdev_is_streaming(sd))
+		return -EBUSY;
+
+	/*
+	 * Even offsets keep the RGGB order. The width is a multiple of 4 so
+	 * that RAW10 lines are a whole number of bytes; only heights that are
+	 * multiples of 4 have been tested.
+	 */
+	rect.left = ALIGN_DOWN(clamp(sel->r.left, 0,
+				     GC8034_AREA_WIDTH - GC8034_MIN_WIDTH), 2);
+	rect.top = ALIGN_DOWN(clamp(sel->r.top, 0,
+				    GC8034_AREA_HEIGHT - GC8034_MIN_HEIGHT), 2);
+	max_width = min(GC8034_MAX_WIDTH, GC8034_AREA_WIDTH - rect.left);
+	max_height = min(GC8034_MAX_HEIGHT, GC8034_AREA_HEIGHT - rect.top);
+	rect.width = ALIGN_DOWN(clamp_t(u32, sel->r.width, GC8034_MIN_WIDTH,
+					max_width), 4);
+	rect.height = ALIGN_DOWN(clamp_t(u32, sel->r.height, GC8034_MIN_HEIGHT,
+					 max_height), 4);
+
+	*v4l2_subdev_state_get_crop(state, 0) = rect;
+	sel->r = rect;
+
+	/* No binning or scaling: the output size is the crop size. */
+	format = v4l2_subdev_state_get_format(state, 0);
+	gc8034_fill_format(format, &rect);
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		return gc8034_update_ctrls(gc8034, format);
+
+	return 0;
+}
+
+/*
+ * No binning or scaling: the output size is the size of the crop rectangle. A
+ * new width or height centres the crop rectangle on the default crop
+ * rectangle along that axis, within the area, for userspace that does not set
+ * the crop rectangle first. The default size gives the default rectangle back.
+ */
+static int gc8034_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
+			  struct v4l2_subdev_state *state,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct gc8034 *gc8034 = to_gc8034(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
+	u32 width, height;
+	int pos;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    v4l2_subdev_is_streaming(sd))
+		return -EBUSY;
+
+	width = ALIGN_DOWN(clamp_t(u32, fmt->format.width, GC8034_MIN_WIDTH,
+				   GC8034_MAX_WIDTH), 4);
+	height = ALIGN_DOWN(clamp_t(u32, fmt->format.height, GC8034_MIN_HEIGHT,
+				    GC8034_MAX_HEIGHT), 4);
+
+	crop = v4l2_subdev_state_get_crop(state, 0);
+	if (width != crop->width) {
+		pos = GC8034_CROP_LEFT + (GC8034_WIDTH - (int)width) / 2;
+		pos = clamp(pos, 0, GC8034_AREA_WIDTH - (int)width);
+		crop->left = ALIGN_DOWN(pos, 2);
+		crop->width = width;
+	}
+	if (height != crop->height) {
+		pos = GC8034_CROP_TOP + (GC8034_HEIGHT - (int)height) / 2;
+		pos = clamp(pos, 0, GC8034_AREA_HEIGHT - (int)height);
+		crop->top = ALIGN_DOWN(pos, 2);
+		crop->height = height;
+	}
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	gc8034_fill_format(format, crop);
+	fmt->format = *format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		return gc8034_update_ctrls(gc8034, format);
+
+	return 0;
+}
+
 static int gc8034_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
@@ -750,7 +900,9 @@ static const struct v4l2_subdev_pad_ops gc8034_pad_ops = {
 	.enum_mbus_code = gc8034_enum_mbus_code,
 	.enum_frame_size = gc8034_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = gc8034_set_fmt,
 	.get_selection = gc8034_get_selection,
+	.set_selection = gc8034_set_selection,
 	.get_frame_desc = gc8034_get_frame_desc,
 	.enable_streams = gc8034_enable_streams,
 	.disable_streams = gc8034_disable_streams,
@@ -825,9 +977,11 @@ static int gc8034_init_controls(struct gc8034 *gc8034)
 			  GC8034_PIXEL_RATE, GC8034_PIXEL_RATE, 1,
 			  GC8034_PIXEL_RATE);
 
-	v4l2_ctrl_new_std(ctrl_hdlr, &gc8034_ctrl_ops, V4L2_CID_VBLANK,
-			  GC8034_VBLANK_MIN, GC8034_VTS_MAX - GC8034_HEIGHT, 1,
-			  GC8034_VBLANK_MIN);
+	/* Ranges for the default crop rectangle, see gc8034_update_ctrls(). */
+	gc8034->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &gc8034_ctrl_ops,
+					   V4L2_CID_VBLANK, GC8034_VBLANK_MIN,
+					   GC8034_VTS_MAX - GC8034_HEIGHT, 1,
+					   GC8034_VBLANK_MIN);
 
 	gc8034->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
 					   GC8034_HTS - GC8034_WIDTH,
-- 
2.47.3

