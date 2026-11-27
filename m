Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749275;
	b=UyF9PjKPDqjHO6YQfSsUZhWcrTYFwv1G3TxwPkaEfB0VX+LEYYumyitAyzka/j8x8IVg
	 riVF95NKr19qWo3+HQlf8jUUyKq3zqFO+GdpWotEa5G2ymRgDlhxuBW0B4IlHoCjZf7XA
	 KJLCxj2c7MbERSdX17F4ky3nkD+5mSo/QxqOFo0YK2Y2rA1ZRgY1TJvd1yeq1Gdar65pe
	 I7g3H87TZugJUMR0QfAmA1o9i0ac5MQI3uy+j8OWshBY+kDTBLqGCf7yldpU0qDwd4k2v
	 xuAWC2kSgVcYYWmDs/Kcp1Z2U26ivNbap/IP83htF8HRNnIDrWk8yPTwf8ozp4qf+sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749275;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6f1uOl7RxJHImN4mGoBox0m+nZGD9bVUQUx31vjZOJs=;
	b=06HmnPKDRGXmXR1fpwc2BpjZYprXdC1b6OxdKl4aEhSgy6/qVeT3G0upDxn2lDqj7ca8
	 oGZXwalS/cTULvQoh4+Z7M8sqLW+/kSy6NaT3hmsMbeZqhKYMtPDumsp1CNomCJn5zmpD
	 K/bR6/E1j66Y82hipUUoGovD1mYUT/JgAv1//nuoH7nXJFtsIQABMt+igZBDVq6tlzpoZ
	 a2xqKuoi2quRVwPaq2DkJuYkAD8QYglKmOCgb6NPrsMJdjq8+KqQHitmWlCujh4JaFmYg
	 MUIcgtdtHUC09v00UvJisGhuEsZpagws//4P649LB/VjdMpblALZgJs4Ox6E5tLF1/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UAWwXq08;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4503A606A31E;
	Fri, 27 Nov 2026 03:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4503A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UAWwXq08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795749275; x=1827285275;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fmiNeW9sYNjiSyE9JKXUwvTVQc6OfZEEhmdjiSxFS2s=;
  b=UAWwXq08E9fsCVP00pBFUFH4+XZtsmjXaGupYsTnlwWAUzvhMWCciwt9
   RaBPtMPYQpFwCpACtNdAs+l1uLkJ/WO3JmdYECrQgptqVewBMPxib0xLK
   dRcl0pAe0GL1QNWEGLkpm0C357hnSrXMEmXh2OUSODEWdxaocero6R9Tt
   k2sgPw1o9JIoDNoe/9DkZr6qytaOJWA6dNEvJgq5beRz2f4lYHNl2AbK5
   Xox1tJ51wpHzgUrJJxeJyTfvBI5hw4/vbdA9g3N9zSWK/e4t9CMRhLQjz
   AWKiITAV9gXd/ahw/Jbfm6u0Ms7uNn3Y/7rb4HY1/e2PG7jbBFKwqXsy7
   Q==;
X-CSE-ConnectionGUID: tsRGIcb2QHKZ3smgMaQDKg==
X-CSE-MsgGUID: EQnKm6HhTMGBgOFXfwQ07w==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4500750"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4500750"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 19:14:33 -0800
X-CSE-ConnectionGUID: fWG0a0/rSS+UlFL9w0Ekag==
X-CSE-MsgGUID: saGROWhNTuSYPApyR4O24Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12297210"
Received: from ubuntu26.bj.intel.com ([172.16.121.122])
  by orviesa007.jf.intel.com with ESMTP; 26 Nov 2026 19:14:30 -0800
From: Lin Yang <linx.yang@intel.com>
To: hverkuil-cisco@xs4all.nl,
	mchehab@kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lin Yang <linx.yang@intel.com>
Subject: [PATCH v2] media: i2c: Add driver for Lontium LT6911GXD HDMI to MIPI CSI-2 bridge
Date: Fri, 27 Nov 2026 11:12:28 +0800
Message-ID: <20261127031241.1012474-1-linx.yang@intel.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for the Lontium LT6911GXD HDMI to MIPI CSI-2 bridge chip.
The device converts HDMI 2.0 input signals to MIPI CSI-2 (C-PHY) output
and supports resolutions up to 4K@60fps.

The driver implements:
- Standard V4L2 subdev and media controller interfaces.
- Video timing detection and reporting via V4L2 DV timings ops
  (s_dv_timings, g_dv_timings, query_dv_timings, enum_dv_timings,
  and dv_timings_cap).
- Hotplug detection (HPD) through a threaded interrupt handler.
- Active state and format management synchronized with HDMI source
  status changes.
- Register access abstraction using the V4L2 CCI framework.

Also register the ACPI hardware ID (INTC1124) in Intel IPU bridge
supported sensor list so that the bridge can enumerate and connect
the device on Intel IPU platforms.

Signed-off-by: Lin Yang <linx.yang@intel.com>
---
v1 -> v2:
- Add entry in MAINTAINERS for lt6911gxd to fix checkpatch warning.

 MAINTAINERS                          |   7 +
 drivers/media/i2c/Kconfig            |  14 +
 drivers/media/i2c/Makefile           |   1 +
 drivers/media/i2c/lt6911gxd.c        | 845 +++++++++++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c |   2 +
 5 files changed, 869 insertions(+)
 create mode 100644 drivers/media/i2c/lt6911gxd.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c72a281a816718..2b2b33fc62485a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15658,6 +15658,13 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
 F:	drivers/hid/hid-lg-g15.c
 
+LONTIUM LT6911GXD HDMI TO MIPI CSI-2 BRIDGE
+M:	Lin Yang <linx.yang@intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	drivers/media/i2c/lt6911gxd.c
+
 LONTIUM LT8912B MIPI TO HDMI BRIDGE
 M:	Francesco Dolcini <francesco@dolcini.it>
 S:	Maintained
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 11c30252540e9c..2ec15c0dd64345 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1373,6 +1373,20 @@ config VIDEO_IT6625
 	  To compile this driver as a module, choose M here: the
 	  module will be called it6625.
 
+config VIDEO_LT6911GXD
+	tristate "Lontium LT6911GXD decoder"
+	depends on ACPI && VIDEO_DEV && I2C
+	select V4L2_FWNODE
+	select V4L2_CCI_I2C
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  This is a Video4Linux2 subdevice driver for the Lontium
+	  LT6911GXD HDMI to MIPI CSI-2 bridge.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called lt6911gxd.
+
 config VIDEO_LT6911UXE
 	tristate "Lontium LT6911UXE decoder"
 	depends on ACPI && VIDEO_DEV && I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 59e31af457cd3e..9d68d9227dfe4b 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_VIDEO_IT6625) += it6625.o
 obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
 obj-$(CONFIG_VIDEO_LM3560) += lm3560.o
 obj-$(CONFIG_VIDEO_LM3646) += lm3646.o
+obj-$(CONFIG_VIDEO_LT6911GXD) += lt6911gxd.o
 obj-$(CONFIG_VIDEO_LT6911UXE) += lt6911uxe.o
 obj-$(CONFIG_VIDEO_M52790) += m52790.o
 obj-$(CONFIG_VIDEO_MAX9271_LIB) += max9271.o
diff --git a/drivers/media/i2c/lt6911gxd.c b/drivers/media/i2c/lt6911gxd.c
new file mode 100644
index 00000000000000..02f4a41b7ff7ea
--- /dev/null
+++ b/drivers/media/i2c/lt6911gxd.c
@@ -0,0 +1,845 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2023 - 2025 Intel Corporation.
+
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/v4l2-dv-timings.h>
+
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-dv-timings.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+
+#define LT6911GXD_CHIP_ID		0x2204
+#define REG_CHIP_ID			CCI_REG16(0xe100)
+
+#define REG_ENABLE_I2C			CCI_REG8(0xe0ee)
+#define REG_PIX_CLK			CCI_REG24(0xe085)
+#define REG_BYTE_CLK			CCI_REG24(0xe092)
+#define REG_H_TOTAL			CCI_REG16(0xe088)
+#define REG_V_TOTAL			CCI_REG16(0xe08a)
+#define REG_H_ACTIVE			CCI_REG16(0xe08c)
+#define REG_V_ACTIVE			CCI_REG16(0xe08e)
+#define REG_MIPI_TX_CTRL		CCI_REG8(0xe0b0)
+
+/* Interrupts */
+#define REG_INT_HDMI			CCI_REG8(0xe084)
+#define INT_VIDEO_DISAPPEAR		0x0
+#define INT_VIDEO_READY			0x1
+
+#define LT6911GXD_DEFAULT_LANES		2
+#define LT6911_PAGE_CONTROL		0xff
+
+static const struct v4l2_dv_timings_cap lt6911gxd_timings_cap_4kp60 = {
+	.type = V4L2_DV_BT_656_1120,
+	/* keep this initialization for compatibility with CLANG */
+	.reserved = { 0 },
+	V4L2_INIT_BT_TIMINGS(1280, 3840,			/* min/max width */
+			     720, 2160,			/* min/max height */
+			     50000000, 600000000,	/* min/max pixelclock */
+			     V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
+			     V4L2_DV_BT_STD_CVT,
+			     V4L2_DV_BT_CAP_PROGRESSIVE |
+			     V4L2_DV_BT_CAP_CUSTOM |
+			     V4L2_DV_BT_CAP_REDUCED_BLANKING)
+};
+
+static const struct regmap_range_cfg lt6911gxd_ranges[] = {
+	{
+		.name = "register_range",
+		.range_min =  0,
+		.range_max = 0xffff,
+		.selector_reg = LT6911_PAGE_CONTROL,
+		.selector_mask = 0xff,
+		.selector_shift = 0,
+		.window_start = 0,
+		.window_len = 0x100,
+	},
+};
+
+static const struct regmap_config lt6911gxd_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xffff,
+	.ranges = lt6911gxd_ranges,
+	.num_ranges = ARRAY_SIZE(lt6911gxd_ranges),
+};
+
+struct lt6911gxd_mode {
+	u32 width;
+	u32 height;
+	u32 htotal;
+	u32 vtotal;
+	u32 code;
+	u32 fps;
+	u32 lanes;
+	s64 link_freq;
+	u64 pixel_clk;
+};
+
+struct lt6911gxd {
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_dv_timings timings;
+	struct lt6911gxd_mode cur_mode;
+	struct regmap *regmap;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *irq_gpio;
+};
+
+static const struct v4l2_event lt6911gxd_ev_source_change = {
+	.type = V4L2_EVENT_SOURCE_CHANGE,
+	.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
+};
+
+static const struct v4l2_event lt6911gxd_ev_stream_end = {
+	.type = V4L2_EVENT_EOS,
+};
+
+static inline struct lt6911gxd *to_lt6911gxd(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct lt6911gxd, sd);
+}
+
+static s64 get_pixel_rate(struct lt6911gxd *lt6911gxd)
+{
+	s64 pixel_rate;
+
+	if (!lt6911gxd->cur_mode.lanes)
+		return 0;
+
+	pixel_rate = (s64)lt6911gxd->cur_mode.width *
+		     lt6911gxd->cur_mode.height *
+		     lt6911gxd->cur_mode.fps * 16;
+	do_div(pixel_rate, lt6911gxd->cur_mode.lanes);
+
+	return pixel_rate;
+}
+
+static bool lt6911gxd_match_dv_timings(const struct v4l2_dv_timings *t,
+				       const struct lt6911gxd_mode *mode)
+{
+	const struct v4l2_bt_timings *bt = &t->bt;
+	u64 pclk_delta = div_u64(mode->pixel_clk, 100); /* 1% margin */
+
+	if (t->type != V4L2_DV_BT_656_1120)
+		return false;
+
+	if (bt->width == mode->width &&
+	    bt->height == mode->height &&
+	    V4L2_DV_BT_FRAME_WIDTH(bt) == mode->htotal &&
+	    V4L2_DV_BT_FRAME_HEIGHT(bt) == mode->vtotal &&
+	    bt->pixelclock >= mode->pixel_clk - pclk_delta &&
+	    bt->pixelclock <= mode->pixel_clk + pclk_delta)
+		return true;
+
+	return false;
+}
+
+static int lt6911gxd_get_detected_timings(struct v4l2_subdev *sd,
+					  struct v4l2_dv_timings *timings)
+{
+	struct lt6911gxd *lt6911gxd = to_lt6911gxd(sd);
+	struct v4l2_bt_timings *bt = &timings->bt;
+	int i;
+
+	if (!lt6911gxd->cur_mode.width || !lt6911gxd->cur_mode.height)
+		return -ENOLCK;
+
+	memset(timings, 0, sizeof(*timings));
+
+	/* Check if detected timings match standard presets (CEA-861 / DMT) */
+	for (i = 0; v4l2_dv_timings_presets[i].bt.width; i++) {
+		if (v4l2_valid_dv_timings(&v4l2_dv_timings_presets[i],
+					  &lt6911gxd_timings_cap_4kp60,
+					  NULL, NULL) &&
+		    lt6911gxd_match_dv_timings(&v4l2_dv_timings_presets[i],
+					       &lt6911gxd->cur_mode)) {
+			*timings = v4l2_dv_timings_presets[i];
+			v4l2_find_dv_timings_cap(timings,
+						 &lt6911gxd_timings_cap_4kp60,
+						 (u32)div_u64(timings->bt.pixelclock, 100),
+						 NULL, NULL);
+			return 0;
+		}
+	}
+
+	timings->type = V4L2_DV_BT_656_1120;
+
+	bt->width = lt6911gxd->cur_mode.width;
+	bt->height = lt6911gxd->cur_mode.height;
+	bt->vsync = lt6911gxd->cur_mode.vtotal - lt6911gxd->cur_mode.height;
+	bt->hsync = lt6911gxd->cur_mode.htotal - lt6911gxd->cur_mode.width;
+	bt->pixelclock = lt6911gxd->cur_mode.pixel_clk;
+
+	v4l2_find_dv_timings_cap(timings, &lt6911gxd_timings_cap_4kp60,
+				 (u32)div_u64(timings->bt.pixelclock, 100),
+				 NULL, NULL);
+
+	return 0;
+}
+
+static int lt6911gxd_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
+				  struct v4l2_dv_timings *timings)
+{
+	struct lt6911gxd *lt6911gxd = to_lt6911gxd(sd);
+	struct v4l2_subdev_state *state;
+
+	if (pad != 0)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	if (v4l2_match_dv_timings(&lt6911gxd->timings, timings, 0, false)) {
+		v4l2_subdev_unlock_state(state);
+		return 0;
+	}
+
+	if (!v4l2_valid_dv_timings(timings, &lt6911gxd_timings_cap_4kp60,
+				   NULL, NULL)) {
+		v4l2_subdev_unlock_state(state);
+		return -ERANGE;
+	}
+	lt6911gxd->timings = *timings;
+	v4l2_subdev_unlock_state(state);
+
+	return 0;
+}
+
+static int lt6911gxd_g_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
+				  struct v4l2_dv_timings *timings)
+{
+	struct lt6911gxd *lt6911gxd = to_lt6911gxd(sd);
+	struct v4l2_subdev_state *state;
+
+	if (pad != 0)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	*timings = lt6911gxd->timings;
+	v4l2_subdev_unlock_state(state);
+
+	return 0;
+}
+
+static int lt6911gxd_query_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
+				      struct v4l2_dv_timings *timings)
+{
+	struct v4l2_subdev_state *state;
+	int ret;
+
+	if (pad != 0)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	ret = lt6911gxd_get_detected_timings(sd, timings);
+	if (ret) {
+		v4l2_subdev_unlock_state(state);
+		return ret;
+	}
+
+	if (!v4l2_valid_dv_timings(timings, &lt6911gxd_timings_cap_4kp60,
+				   NULL, NULL)) {
+		v4l2_subdev_unlock_state(state);
+		return -ERANGE;
+	}
+
+	v4l2_subdev_unlock_state(state);
+	return 0;
+}
+
+static int lt6911gxd_enum_dv_timings(struct v4l2_subdev *sd,
+				     struct v4l2_enum_dv_timings *timings)
+{
+	if (timings->pad != 0)
+		return -EINVAL;
+
+	return v4l2_enum_dv_timings_cap(timings,
+			&lt6911gxd_timings_cap_4kp60, NULL, NULL);
+}
+
+static int lt6911gxd_dv_timings_cap(struct v4l2_subdev *sd,
+				    struct v4l2_dv_timings_cap *cap)
+{
+	if (cap->pad != 0)
+		return -EINVAL;
+
+	*cap = lt6911gxd_timings_cap_4kp60;
+	return 0;
+}
+
+static int lt6911gxd_status_update(struct lt6911gxd *lt6911gxd)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&lt6911gxd->sd);
+	u64 int_event;
+	u64 byte_clk, pixel_clk, fps, fps_x100;
+	u64 htotal, vtotal, width, height;
+	int ret = 0;
+
+	/* Read interrupt event */
+	cci_read(lt6911gxd->regmap, REG_INT_HDMI, &int_event, &ret);
+	if (ret) {
+		dev_err(&client->dev, "failed to read interrupt event: %d\n",
+			ret);
+		return ret;
+	}
+
+	switch (int_event) {
+	case INT_VIDEO_READY:
+		cci_read(lt6911gxd->regmap, REG_BYTE_CLK, &byte_clk, &ret);
+		byte_clk *= 1000;
+		cci_read(lt6911gxd->regmap, REG_PIX_CLK, &pixel_clk, &ret);
+		pixel_clk *= 1000;
+
+		if (ret || byte_clk == 0 || pixel_clk == 0) {
+			dev_dbg(&client->dev,
+				"invalid ByteClock or PixelClock\n");
+			return -EINVAL;
+		}
+
+		cci_read(lt6911gxd->regmap, REG_H_TOTAL, &htotal, &ret);
+		cci_read(lt6911gxd->regmap, REG_V_TOTAL, &vtotal, &ret);
+		if (ret || htotal == 0 || vtotal == 0) {
+			dev_dbg(&client->dev, "invalid htotal or vtotal\n");
+			return -EINVAL;
+		}
+
+		fps = div_u64(pixel_clk, htotal * vtotal);
+		fps_x100 = div_u64(pixel_clk * 100ULL, htotal * vtotal);
+		if (fps_x100 > 6050) {
+			dev_dbg(&client->dev,
+				"max fps is 60, current fps: %llu.%02llu\n",
+				fps_x100 / 100, fps_x100 % 100);
+			return -EINVAL;
+		}
+
+		cci_read(lt6911gxd->regmap, REG_H_ACTIVE, &width, &ret);
+		cci_read(lt6911gxd->regmap, REG_V_ACTIVE, &height, &ret);
+		if (ret || width == 0 || width > 3840 ||
+		    height == 0 || height > 2160) {
+			dev_dbg(&client->dev,
+				"invalid width (%llu) or height (%llu)\n",
+				width, height);
+			return -EINVAL;
+		}
+
+		if (lt6911gxd->cur_mode.width != width ||
+		    lt6911gxd->cur_mode.height != height ||
+		    lt6911gxd->cur_mode.fps != fps) {
+			lt6911gxd->cur_mode.height = height;
+			lt6911gxd->cur_mode.width = width;
+			lt6911gxd->cur_mode.fps = fps;
+			/* MIPI Clock Rate = ByteClock × 4, defined in lt6911gxd spec */
+			lt6911gxd->cur_mode.link_freq = byte_clk * 4;
+			lt6911gxd->cur_mode.pixel_clk = pixel_clk;
+			lt6911gxd->cur_mode.vtotal = vtotal;
+			lt6911gxd->cur_mode.htotal = htotal;
+			v4l2_subdev_notify_event(&lt6911gxd->sd,
+						 &lt6911gxd_ev_source_change);
+			dev_dbg(&client->dev,
+				"notify new resolution or fps: %llux%llu@%llu.%02llu\n",
+				width, height,
+				fps_x100 / 100, fps_x100 % 100);
+		}
+		break;
+
+	case INT_VIDEO_DISAPPEAR:
+		cci_write(lt6911gxd->regmap, REG_MIPI_TX_CTRL, 0x0, &ret);
+		lt6911gxd->cur_mode.height = 0;
+		lt6911gxd->cur_mode.width = 0;
+		lt6911gxd->cur_mode.fps = 0;
+		lt6911gxd->cur_mode.link_freq = 0;
+		v4l2_subdev_notify_event(&lt6911gxd->sd,
+					 &lt6911gxd_ev_stream_end);
+		dev_dbg(&client->dev, "notify video disappear\n");
+		break;
+
+	default:
+		ret = -ENOLINK;
+	}
+
+	dev_dbg(&client->dev, "event 0x%llx, ret: %d\n", int_event, ret);
+	return ret;
+}
+
+static int lt6911gxd_init_controls(struct lt6911gxd *lt6911gxd)
+{
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	s64 pixel_rate;
+	int ret;
+
+	ctrl_hdlr = &lt6911gxd->ctrl_handler;
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 1);
+	if (ret)
+		return ret;
+
+	pixel_rate = get_pixel_rate(lt6911gxd);
+	lt6911gxd->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
+						  V4L2_CID_PIXEL_RATE,
+						  pixel_rate, pixel_rate, 1,
+						  pixel_rate);
+
+	if (ctrl_hdlr->error) {
+		ret = ctrl_hdlr->error;
+		goto hdlr_free;
+	}
+	lt6911gxd->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+
+hdlr_free:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+	return ret;
+}
+
+static void lt6911gxd_update_pad_format(const struct lt6911gxd_mode *mode,
+					struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->code = mode->code;
+	fmt->field = V4L2_FIELD_NONE;
+}
+
+static int lt6911gxd_enable_streams(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    u32 pad, u64 streams_mask)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct lt6911gxd *lt6911gxd = to_lt6911gxd(sd);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
+		return ret;
+
+	cci_write(lt6911gxd->regmap, REG_MIPI_TX_CTRL, 0x1, &ret);
+	if (ret) {
+		dev_err(&client->dev, "failed to start stream: %d\n", ret);
+		goto err_rpm_put;
+	}
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(&client->dev);
+	return ret;
+}
+
+static int lt6911gxd_disable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     u32 pad, u64 streams_mask)
+{
+	struct lt6911gxd *lt6911gxd = to_lt6911gxd(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(&lt6911gxd->sd);
+	int ret;
+
+	ret = cci_write(lt6911gxd->regmap, REG_MIPI_TX_CTRL, 0x0, NULL);
+	if (ret)
+		dev_err(&client->dev, "failed to stop stream: %d\n", ret);
+
+	pm_runtime_put(&client->dev);
+	return 0;
+}
+
+static int lt6911gxd_set_format(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_format *fmt)
+{
+	struct lt6911gxd *lt6911gxd = to_lt6911gxd(sd);
+	u64 pixel_rate;
+
+	if (fmt->pad != 0)
+		return -EINVAL;
+
+	lt6911gxd_update_pad_format(&lt6911gxd->cur_mode, &fmt->format);
+	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	pixel_rate = get_pixel_rate(lt6911gxd);
+	v4l2_ctrl_modify_range(lt6911gxd->pixel_rate, pixel_rate,
+			       pixel_rate, 1, pixel_rate);
+
+	return 0;
+}
+
+static int lt6911gxd_enum_mbus_code(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *sd_state,
+				    struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct lt6911gxd *lt6911gxd = to_lt6911gxd(sd);
+
+	if (code->pad != 0 || code->index != 0)
+		return -EINVAL;
+
+	code->code = lt6911gxd->cur_mode.code;
+
+	return 0;
+}
+
+static int lt6911gxd_get_mbus_config(struct v4l2_subdev *sd,
+				     unsigned int pad,
+				     struct v4l2_mbus_config *cfg)
+{
+	struct lt6911gxd *lt6911gxd = to_lt6911gxd(sd);
+	struct v4l2_subdev_state *state;
+
+	if (pad != 0)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	cfg->type = V4L2_MBUS_CSI2_CPHY;
+	cfg->link_freq = lt6911gxd->cur_mode.link_freq;
+	v4l2_subdev_unlock_state(state);
+
+	return 0;
+}
+
+static int lt6911gxd_init_state(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
+		: V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+
+	return lt6911gxd_set_format(sd, NULL, sd_state, &fmt);
+}
+
+static const struct v4l2_subdev_video_ops lt6911gxd_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+/*
+ * lt6911gxd provides editable EDID for customers, but only can be edited like
+ * updating flash. Due to this limitation, it is not possible to implement
+ * EDID support.
+ */
+static const struct v4l2_subdev_pad_ops lt6911gxd_pad_ops = {
+	.set_fmt = lt6911gxd_set_format,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.enable_streams = lt6911gxd_enable_streams,
+	.disable_streams = lt6911gxd_disable_streams,
+	.enum_mbus_code = lt6911gxd_enum_mbus_code,
+	.get_frame_interval = v4l2_subdev_get_frame_interval,
+	.s_dv_timings = lt6911gxd_s_dv_timings,
+	.g_dv_timings = lt6911gxd_g_dv_timings,
+	.query_dv_timings = lt6911gxd_query_dv_timings,
+	.enum_dv_timings = lt6911gxd_enum_dv_timings,
+	.dv_timings_cap = lt6911gxd_dv_timings_cap,
+	.get_mbus_config = lt6911gxd_get_mbus_config,
+};
+
+static const struct v4l2_subdev_core_ops lt6911gxd_subdev_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops lt6911gxd_subdev_ops = {
+	.core = &lt6911gxd_subdev_core_ops,
+	.video = &lt6911gxd_video_ops,
+	.pad = &lt6911gxd_pad_ops,
+};
+
+static const struct media_entity_operations lt6911gxd_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_internal_ops lt6911gxd_internal_ops = {
+	.init_state = lt6911gxd_init_state,
+};
+
+static int lt6911gxd_fwnode_parse(struct lt6911gxd *lt6911gxd,
+				  struct device *dev)
+{
+	struct fwnode_handle *endpoint;
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_CPHY,
+	};
+	int ret;
+
+	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
+						   FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!endpoint)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "endpoint node not found\n");
+
+	ret = v4l2_fwnode_endpoint_parse(endpoint, &bus_cfg);
+	fwnode_handle_put(endpoint);
+	if (ret) {
+		dev_err(dev, "failed to parse endpoint node: %d\n", ret);
+		goto out_err;
+	}
+
+	/*
+	 * Check the number of MIPI CSI2 data lanes,
+	 * lt6911gxd only support 2 lanes.
+	 */
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != LT6911GXD_DEFAULT_LANES) {
+		dev_err(dev, "only 2 data lanes are currently supported\n");
+		ret = -EINVAL;
+		goto out_err;
+	}
+	lt6911gxd->cur_mode.lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
+	lt6911gxd->cur_mode.code = MEDIA_BUS_FMT_UYVY8_1X16;
+
+	return 0;
+
+out_err:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+	return ret;
+}
+
+static int lt6911gxd_identify_module(struct lt6911gxd *lt6911gxd,
+				     struct device *dev)
+{
+	u64 val;
+	int ret = 0;
+
+	/* Chip ID should be confirmed when the I2C slave is active */
+	cci_write(lt6911gxd->regmap, REG_ENABLE_I2C, 0x1, &ret);
+	cci_read(lt6911gxd->regmap, REG_CHIP_ID, &val, &ret);
+	cci_write(lt6911gxd->regmap, REG_ENABLE_I2C, 0x0, &ret);
+	if (ret)
+		return dev_err_probe(dev, ret, "fail to read chip id\n");
+
+	if (val != LT6911GXD_CHIP_ID) {
+		return dev_err_probe(dev, -ENXIO, "chip id mismatch: %x!=%x\n",
+				     LT6911GXD_CHIP_ID, (u16)val);
+	}
+
+	return 0;
+}
+
+static irqreturn_t lt6911gxd_threaded_irq_fn(int irq, void *dev_id)
+{
+	struct lt6911gxd *lt6911gxd = dev_id;
+	struct v4l2_subdev *sd = &lt6911gxd->sd;
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE
+	};
+	int ret;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	ret = lt6911gxd_status_update(lt6911gxd);
+	if (!ret && lt6911gxd->cur_mode.width) {
+		/*
+		 * As a HDMI to CSI2 bridge, it needs to update the format in time
+		 * when the HDMI source changes.
+		 */
+		lt6911gxd_set_format(sd, NULL, state, &fmt);
+	}
+	v4l2_subdev_unlock_state(state);
+
+	return IRQ_HANDLED;
+}
+
+static void lt6911gxd_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct lt6911gxd *lt6911gxd = to_lt6911gxd(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	free_irq(gpiod_to_irq(lt6911gxd->irq_gpio), lt6911gxd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(&lt6911gxd->ctrl_handler);
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
+static int lt6911gxd_probe(struct i2c_client *client)
+{
+	struct lt6911gxd *lt6911gxd;
+	struct device *dev = &client->dev;
+	int ret;
+
+	lt6911gxd = devm_kzalloc(dev, sizeof(*lt6911gxd), GFP_KERNEL);
+	if (!lt6911gxd)
+		return -ENOMEM;
+
+	lt6911gxd->regmap = devm_regmap_init_i2c(client,
+						 &lt6911gxd_regmap_config);
+	if (IS_ERR(lt6911gxd->regmap))
+		return dev_err_probe(dev, PTR_ERR(lt6911gxd->regmap),
+				     "failed to init CCI\n");
+
+	v4l2_i2c_subdev_init(&lt6911gxd->sd, client, &lt6911gxd_subdev_ops);
+
+	lt6911gxd->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(lt6911gxd->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(lt6911gxd->reset_gpio),
+				     "failed to get reset gpio\n");
+
+	lt6911gxd->irq_gpio = devm_gpiod_get(dev, "hpd", GPIOD_IN);
+	if (IS_ERR(lt6911gxd->irq_gpio))
+		return dev_err_probe(dev, PTR_ERR(lt6911gxd->irq_gpio),
+				     "failed to get hpd gpio\n");
+
+	ret = lt6911gxd_fwnode_parse(lt6911gxd, dev);
+	if (ret)
+		return ret;
+
+	/* Wait for the device to stabilize after reset */
+	usleep_range(10000, 10500);
+
+	ret = lt6911gxd_identify_module(lt6911gxd, dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to find chip\n");
+
+	ret = lt6911gxd_init_controls(lt6911gxd);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to init control\n");
+
+	lt6911gxd->sd.dev = dev;
+	lt6911gxd->sd.internal_ops = &lt6911gxd_internal_ops;
+	lt6911gxd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	lt6911gxd->sd.entity.ops = &lt6911gxd_subdev_entity_ops;
+	lt6911gxd->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	lt6911gxd->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&lt6911gxd->sd.entity, 1, &lt6911gxd->pad);
+	if (ret) {
+		dev_err(dev, "failed to init entity pads: %d\n", ret);
+		goto v4l2_ctrl_handler_free;
+	}
+
+	/*
+	 * Device is already turned on by i2c-core with ACPI domain PM.
+	 * Enable runtime PM and turn off the device.
+	 */
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
+
+	ret = v4l2_subdev_init_finalize(&lt6911gxd->sd);
+	if (ret) {
+		dev_err(dev, "failed to init v4l2 subdev: %d\n", ret);
+		goto media_entity_cleanup;
+	}
+
+	/* Setting irq */
+	ret = request_threaded_irq(gpiod_to_irq(lt6911gxd->irq_gpio), NULL,
+				   lt6911gxd_threaded_irq_fn,
+				   IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
+				   IRQF_ONESHOT,
+				   NULL, lt6911gxd);
+	if (ret) {
+		dev_err(dev, "failed to request IRQ: %d\n", ret);
+		goto subdev_cleanup;
+	}
+
+	ret = v4l2_async_register_subdev_sensor(&lt6911gxd->sd);
+	if (ret) {
+		dev_err(dev, "failed to register V4L2 subdev: %d\n", ret);
+		goto free_irq;
+	}
+
+	/* Initial status check in case cable was already connected before boot */
+	ret = lt6911gxd_status_update(lt6911gxd);
+	if (!ret && lt6911gxd->cur_mode.width) {
+		struct v4l2_subdev_state *state;
+		struct v4l2_subdev_format fmt = {
+			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		};
+
+		state = v4l2_subdev_lock_and_get_active_state(&lt6911gxd->sd);
+		lt6911gxd_set_format(&lt6911gxd->sd, NULL, state, &fmt);
+		v4l2_subdev_unlock_state(state);
+	}
+
+	return 0;
+
+free_irq:
+	free_irq(gpiod_to_irq(lt6911gxd->irq_gpio), lt6911gxd);
+
+subdev_cleanup:
+	v4l2_subdev_cleanup(&lt6911gxd->sd);
+
+media_entity_cleanup:
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	media_entity_cleanup(&lt6911gxd->sd.entity);
+
+v4l2_ctrl_handler_free:
+	v4l2_ctrl_handler_free(lt6911gxd->sd.ctrl_handler);
+
+	return ret;
+}
+
+static int lt6911gxd_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct lt6911gxd *lt6911gxd = to_lt6911gxd(sd);
+
+	/* Active low gpio reset, set 1 to power off sensor */
+	gpiod_set_value_cansleep(lt6911gxd->reset_gpio, 1);
+
+	return 0;
+}
+
+static int lt6911gxd_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct lt6911gxd *lt6911gxd = to_lt6911gxd(sd);
+	int ret = 0;
+	int count = 0;
+
+	if (lt6911gxd->reset_gpio) {
+		do {
+			gpiod_set_value_cansleep(lt6911gxd->reset_gpio, 0);
+			ret = gpiod_get_value_cansleep(lt6911gxd->reset_gpio);
+			msleep(200);
+
+			if (++count >= 20) {
+				dev_err(&client->dev,
+					"failed to power on reset gpio, reset gpio is %d\n", ret);
+				ret = -ETIMEDOUT;
+				break;
+			}
+		} while (ret != 0);
+	}
+
+	return ret;
+}
+
+static const struct dev_pm_ops lt6911gxd_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(lt6911gxd_suspend, lt6911gxd_resume)
+};
+
+static const struct acpi_device_id lt6911gxd_acpi_ids[] = {
+	{ "INTC1124" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, lt6911gxd_acpi_ids);
+
+static struct i2c_driver lt6911gxd_i2c_driver = {
+	.driver = {
+		.name = "lt6911gxd",
+		.pm = pm_sleep_ptr(&lt6911gxd_pm_ops),
+		.acpi_match_table = ACPI_PTR(lt6911gxd_acpi_ids),
+	},
+	.probe = lt6911gxd_probe,
+	.remove = lt6911gxd_remove,
+};
+
+module_i2c_driver(lt6911gxd_i2c_driver);
+
+MODULE_AUTHOR("Xiaohong Zou <xiaohong.zou@intel.com>");
+MODULE_AUTHOR("Lin Yang <linx.yang@intel.com>");
+MODULE_DESCRIPTION("Lontium lt6911gxd HDMI to MIPI Bridge Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a8c436..c31cbefc065a52 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -90,6 +90,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
 	/* Lontium lt6911uxe */
 	IPU_SENSOR_CONFIG("INTC10C5", 0),
+	/* Lontium lt6911gxd */
+	IPU_SENSOR_CONFIG("INTC1124", 0),
 	/* Omnivision OV01A10 / OV01A1B / OV01A1S */
 	IPU_SENSOR_CONFIG("OVTI01A0", 1, 400000000),
 	IPU_SENSOR_CONFIG("OVTI01AB", 1, 400000000),
-- 
2.53.0

