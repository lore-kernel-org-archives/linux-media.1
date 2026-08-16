Received: from s1.inspiredexperts.com (s1.inspiredexperts.com [162.243.156.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29863C7DE8;
	Sun, 16 Aug 2026 20:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.156.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786913376; cv=none; b=PLENEEo8a8ZfSBadjBjIpZKsR7POpcsyv18MCdTEFJaNbVeqFgWX0XjTOjf8CQX/rjM7xEq8zHo7SoXKUrF1DzYg6vtdDp0Pj5ltY0vF0nUxeLJmlNTDSXx1frEtJ/61GxV+M6S/eTYZbsMIqf0kK2Kx0vKfldeKLNa7wZCslq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786913376; c=relaxed/simple;
	bh=46IiIggRmnLUvkSgKJVe3PChnBDXiHF0Uw1YbWuNOQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ri2jw7BLK2X6nGbea1rUJinfnnCt63C4dG1Xm4Mmj8wZx7+9WIGimE1LNb3HAtmjQe/1/TLqGGA2fBG5ehTO5a4wi1NzqiGRaD78/+Q54mU7YS9mETkOYTc9gb8hXJLRMVE34f1+qlN3ZAnwhArmtrTK0oh3RipueOfZcd1C2g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inspiredexperts.com; spf=pass smtp.mailfrom=inspiredexperts.com; dkim=pass (1024-bit key) header.d=inspiredexperts.com header.i=@inspiredexperts.com header.b=Rre3thOC; arc=none smtp.client-ip=162.243.156.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inspiredexperts.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspiredexperts.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inspiredexperts.com header.i=@inspiredexperts.com header.b="Rre3thOC"
Received: from localhost (s1.inspiredexperts.com [127.0.0.1])
	by s1.inspiredexperts.com (Postfix) with ESMTP id 70E1BD2D689;
	Sun, 16 Aug 2026 14:42:39 -0600 (MDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inspiredexperts.com;
	s=default; t=1786912960;
	bh=1cj7ZLEBt+/7dTu7kCExSMuF87hTeXpwyElowCzid14=;
	h=From:To:Cc:Subject:Date:From;
	b=Rre3thOC190M+LphUG65vaS43n1wNaJTS1Jn4JJNguT2NaSIpSGqWRWv79jmhjmOu
	 8KSoSEz9yt6YEaJOyK6hDWkTGJ1M3AnCFciLRBbsDhJvB96nlzbiuP/V00p0kyfP3G
	 ntn4tKr2eJcDVqKkt6uOmTz6e+TVn9Gbl5lGYP2c=
From: James Alexander <opensource@inspiredexperts.com>
To: Jimmy Su <jimmy.su@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov08x40: implement crop selection
Date: Sun, 16 Aug 2026 14:42:39 -0600
Message-ID: <20260816204239.2844654-1-opensource@inspiredexperts.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *

libcamera asks raw sensor drivers for crop bounds and the active crop.
The ov08x40 driver currently has no selection operation. This causes camera
setup to fail with rectangle ioctl errors on the tested HP Spectre.

Record the crop used by each mode and return native size, crop bounds and
the active crop through get_selection(). Initialise the try crop when the
subdevice is opened as well.

Compile-tested against Linux base fd923b32d761. Hardware-tested with the
full patch set across 25 consecutive reboots on an HP Spectre x360
14-eu0xxx running Ubuntu 7.0.0-29-generic.

Signed-off-by: James Alexander <opensource@inspiredexperts.com>
---
diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 5eaf454f4..785157587 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -38,6 +38,13 @@
 #define OV08X40_REG_CHIP_ID		0x300a
 #define OV08X40_CHIP_ID			0x560858
 
+#define OV08X40_NATIVE_WIDTH		3856U
+#define OV08X40_NATIVE_HEIGHT		2416U
+#define OV08X40_PIXEL_ARRAY_LEFT	0U
+#define OV08X40_PIXEL_ARRAY_TOP		0U
+#define OV08X40_PIXEL_ARRAY_WIDTH	3856U
+#define OV08X40_PIXEL_ARRAY_HEIGHT	2416U
+
 /* V_TIMING internal */
 #define OV08X40_REG_VTS			0x380e
 #define OV08X40_VTS_30FPS		0x09c4	/* the VTS need to be half in normal mode */
@@ -147,6 +154,7 @@ struct ov08x40_mode {
 	u32 link_freq_index;
 	/* Default register values */
 	struct ov08x40_reg_list reg_list;
+	struct v4l2_rect crop;
 
 	/* Exposure calculation */
 	u16 exposure_margin;
@@ -1233,6 +1241,12 @@ static const struct ov08x40_mode supported_modes[] = {
 			.regs = mode_3856x2416_regs,
 		},
 		.link_freq_index = OV08X40_LINK_FREQ_400MHZ_INDEX,
+		.crop = {
+			.left = OV08X40_PIXEL_ARRAY_LEFT,
+			.top = OV08X40_PIXEL_ARRAY_TOP,
+			.width = OV08X40_PIXEL_ARRAY_WIDTH,
+			.height = OV08X40_PIXEL_ARRAY_HEIGHT,
+		},
 		.exposure_shift = 1,
 		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
 	},
@@ -1248,6 +1262,12 @@ static const struct ov08x40_mode supported_modes[] = {
 			.regs = mode_3856x2176_regs_800mbps,
 		},
 		.link_freq_index = OV08X40_LINK_FREQ_400MHZ_INDEX,
+		.crop = {
+			.left = OV08X40_PIXEL_ARRAY_LEFT,
+			.top = 120,
+			.width = OV08X40_PIXEL_ARRAY_WIDTH,
+			.height = 2176,
+		},
 		.exposure_shift = 1,
 		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
 	},
@@ -1264,6 +1284,12 @@ static const struct ov08x40_mode supported_modes[] = {
 			.regs = mode_1928x1208_regs,
 		},
 		.link_freq_index = OV08X40_LINK_FREQ_400MHZ_INDEX,
+		.crop = {
+			.left = OV08X40_PIXEL_ARRAY_LEFT,
+			.top = OV08X40_PIXEL_ARRAY_TOP,
+			.width = OV08X40_PIXEL_ARRAY_WIDTH,
+			.height = OV08X40_PIXEL_ARRAY_HEIGHT,
+		},
 		.exposure_shift = 0,
 		.exposure_margin = OV08X40_EXPOSURE_BIN_MAX_MARGIN,
 	},
@@ -1279,6 +1305,12 @@ static const struct ov08x40_mode supported_modes[] = {
 			.regs = mode_3856x2176_regs_1500mbps,
 		},
 		.link_freq_index = OV08X40_LINK_FREQ_749MHZ_INDEX,
+		.crop = {
+			.left = OV08X40_PIXEL_ARRAY_LEFT,
+			.top = 120,
+			.width = OV08X40_PIXEL_ARRAY_WIDTH,
+			.height = 2176,
+		},
 		.exposure_shift = 1,
 		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
 	},
@@ -1294,6 +1326,12 @@ static const struct ov08x40_mode supported_modes[] = {
 			.regs = mode_1928x1088_regs_1500mbps,
 		},
 		.link_freq_index = OV08X40_LINK_FREQ_749MHZ_INDEX,
+		.crop = {
+			.left = OV08X40_PIXEL_ARRAY_LEFT,
+			.top = 120,
+			.width = OV08X40_PIXEL_ARRAY_WIDTH,
+			.height = 2176,
+		},
 		.exposure_shift = 0,
 		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
 	},
@@ -1547,6 +1585,7 @@ static int ov08x40_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	struct ov08x40 *ov08x = to_ov08x40(sd);
 	struct v4l2_mbus_framefmt *try_fmt =
 		v4l2_subdev_state_get_format(fh->state, 0);
+	struct v4l2_rect *try_crop;
 
 	mutex_lock(&ov08x->mutex);
 
@@ -1556,7 +1595,9 @@ static int ov08x40_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	try_fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	try_fmt->field = V4L2_FIELD_NONE;
 
-	/* No crop or compose */
+	try_crop = v4l2_subdev_state_get_crop(fh->state, 0);
+	*try_crop = default_mode->crop;
+
 	mutex_unlock(&ov08x->mutex);
 
 	return 0;
@@ -1842,6 +1883,54 @@ static int ov08x40_get_pad_format(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static const struct v4l2_rect *
+ov08x40_get_pad_crop(struct ov08x40 *ov08x,
+		     struct v4l2_subdev_state *sd_state,
+		     unsigned int pad, enum v4l2_subdev_format_whence which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_state_get_crop(sd_state, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &ov08x->cur_mode->crop;
+	}
+
+	return NULL;
+}
+
+static int ov08x40_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	struct ov08x40 *ov08x = to_ov08x40(sd);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		mutex_lock(&ov08x->mutex);
+		sel->r = *ov08x40_get_pad_crop(ov08x, sd_state, sel->pad,
+					       sel->which);
+		mutex_unlock(&ov08x->mutex);
+		return 0;
+
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = OV08X40_NATIVE_WIDTH;
+		sel->r.height = OV08X40_NATIVE_HEIGHT;
+		return 0;
+
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.left = OV08X40_PIXEL_ARRAY_LEFT;
+		sel->r.top = OV08X40_PIXEL_ARRAY_TOP;
+		sel->r.width = OV08X40_PIXEL_ARRAY_WIDTH;
+		sel->r.height = OV08X40_PIXEL_ARRAY_HEIGHT;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static int
 ov08x40_set_pad_format(struct v4l2_subdev *sd,
 		       struct v4l2_subdev_state *sd_state,
@@ -2060,6 +2149,7 @@ static const struct v4l2_subdev_pad_ops ov08x40_pad_ops = {
 	.get_fmt = ov08x40_get_pad_format,
 	.set_fmt = ov08x40_set_pad_format,
 	.enum_frame_size = ov08x40_enum_frame_size,
+	.get_selection = ov08x40_get_selection,
 };
 
 static const struct v4l2_subdev_ops ov08x40_subdev_ops = {
-- 
2.46.0
