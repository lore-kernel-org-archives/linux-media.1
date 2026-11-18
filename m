Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008514;
	b=NEXPJmdQn6+hR5nOQvSba2IwCJDq7IpCYbAj4MyUWwuI7lf7XPx0EpC8EZXZ3xJUBq9X
	 EVMWZm40T84Y6MnVbuRcHuGFx0BXP9a7yxFTZDf1wBVPJmiXl9YtcDHySuPXEsc0+mvda
	 M6eCmBK8I4DdkbiD1eDah67iS9AHB/D7dvPhlWljF2XGSP/o/HOOD+1RKwrXKAxVvH6nj
	 3V+Jx2t7QGcgPmjIC+1Mj0tSMQQOo1hOUtuwgV9NdUaSSwej+OFt+S7uir3yuESRbsY5I
	 5jdRgEirWnK1jSPb04h8ngNqDrC/ahmnt2y55Lr0iu7G46QbxlOG9cYt5Lhf/RP6nNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008514;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=yJkPWm5hVmWSI3LO1k1pknUFg9NLjEfMYEXDTHKdWyo=;
	b=BaCWSg9zHhH8u2mHiRlghWHYv1mtRy6Ptl377XX1G5PdwpXe2ovsp0ggMyy3Ki4noq6c
	 u9H75SiW5BjmPTLuQhP4fLCZ2/yAgkDSIdWA9605iyiw0KZzLWVG0+EtSdEVBSaAP0IrM
	 IjF9oIJmXiQoKaxL9+4AVH+MyvJ7P++iQKfjr2M/SbNTmZzy3ZMdv6bDj4YTRpr3pAdhT
	 pl7ExQCUybfnCrvKNZyJiVDfxelSoCyf6VUmQD2bQtqilKwxLGCrMiK8faH5faPIrcZOL
	 bqETZyVOG3Sq2PmTle/U9CCK2hziv2YQ3+EXSvnA5L1CUxWq/XZfHqf+pZSxnNCh/tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nFzzhYDO;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBCF606A334
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FBCF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nFzzhYDO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008514; x=1826544514;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DkhsaCcpgL21+sPcoCMbFDn6w97eJuMEU4SWjuRCaMM=;
  b=nFzzhYDOYfGRAHDP31mJHNQCUK+H2KWPEeF1HU/WzR3MHn2rjJX0lN3G
   /5DI0Le+l5QYPV6OymzT7JE1YPGg2ANCMse/seoLGhGdnp/tgv5utpJGd
   5XfGL2wcaSbAuTpRVRULawbw3UfXuCdEyUUGM2R0x1erQbm6SPZBZ7PcO
   MgdjEoF4HlAgXziMRoBTZWgwlI/ag3HL+MQwZDE8LT9D5xt3O+Fg1I3/U
   uG+hmgGBioAzL10AP1papE5PbxQJTuBW9DiBhQXwoY58GNEfJcyxJI4/E
   60CGFCiA+oOouEc0bUYPX4YamX4AdF5lFRZYHiNJAT5hjJLfBlFGlyxTI
   g==;
X-CSE-ConnectionGUID: OErIsHEuQoWQyBRmaGecmw==
X-CSE-MsgGUID: +NOfUTEmSl22b+DwJcdZtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3702632"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3702632"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:31 -0800
X-CSE-ConnectionGUID: kdp1jq21T/yFLOmn0YW9nQ==
X-CSE-MsgGUID: 4pZaC17cSQeqTVwamvMytw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10678008"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:23 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CABD6121C41;
	Wed, 18 Nov 2026 15:28:20 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tcv-1yc4;
	Wed, 18 Nov 2026 15:28:20 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v13 51/73] media: ov2740: Add support for embedded data
Date: Wed, 18 Nov 2026 15:27:57 +0200
Message-ID: <20261118132819.213473-52-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118132819.213473-1-sakari.ailus@linux.intel.com>
References: <20261118132819.213473-1-sakari.ailus@linux.intel.com>
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

Add support for embedded data. This introduces two internal pads for pixel
and embedded data streams. As the driver supports a single mode only,
there's no need for backward compatibility in mode selection.

The embedded data is configured to be placed before the image data whereas
after the image data is the default.

This patch includes switching to {enable,disable}_streams as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 258 ++++++++++++++++++++++++++++---------
 1 file changed, 197 insertions(+), 61 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 536325bb7b92..e10df4840dca 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -12,6 +12,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/unaligned.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -23,6 +24,11 @@
 #define OV2740_DATA_LANES		2
 #define OV2740_RGB_DEPTH		10
 
+#define OV2740_CROP_TOP			4U
+#define OV2740_CROP_LEFT		4U
+#define OV2740_ACTIVE_WIDTH		1936U
+#define OV2740_ACTIVE_HEIGHT		1096U
+
 #define OV2740_REG_CHIP_ID		0x300a
 #define OV2740_CHIP_ID			0x2740
 
@@ -72,6 +78,15 @@
 #define OV2740_REG_ISP_CTRL00		0x5000
 /* ISP CTRL01 */
 #define OV2740_REG_ISP_CTRL01		0x5001
+
+/* Embedded data line location control */
+#define OV2740_REG_EMBEDDED_FLAG	0x5a08
+#define OV2740_EMBEDDED_FLAG_FOOTER	BIT(2) /* otherwise it's in header */
+#define OV2740_EMBEDDED_FLAG_MYSTERY	BIT(1)
+#define OV2740_REG_EMBEDDED_DT		0x3036
+#define OV2740_REG_EMBEDDED_CTRL	0x4307
+#define OV2740_EMBEDDED_CTRL_MYSTERY	0x30
+#define OV2740_EMBEDDED_CTRL_ENABLE	BIT(0)
 /* Customer Addresses: 0x7010 - 0x710F */
 #define CUSTOMER_USE_OTP_SIZE		0x100
 /* OTP registers from sensor */
@@ -83,6 +98,21 @@ static const char * const ov2740_supply_name[] = {
 	"DVDD",
 };
 
+enum {
+	OV2740_PAD_SOURCE,
+	OV2740_PAD_PIXEL,
+	OV2740_PAD_META,
+	OV2740_NUM_PADS,
+};
+
+enum {
+	OV2740_STREAM_PIXEL,
+	OV2740_STREAM_META,
+};
+
+#define OV2740_META_WIDTH		100U
+#define OV2740_META_HEIGHT		1U
+
 struct nvm_data {
 	struct nvmem_device *nvmem;
 	struct regmap *regmap;
@@ -156,6 +186,7 @@ static const struct ov2740_reg mode_1932x1092_regs_360mhz[] = {
 	{0x3000, 0x00},
 	{0x3018, 0x32},
 	{0x3031, 0x0a},
+	{OV2740_REG_EMBEDDED_DT, MIPI_CSI2_DT_EMBEDDED_8B},
 	{0x3080, 0x08},
 	{0x3083, 0xB4},
 	{0x3103, 0x00},
@@ -260,7 +291,8 @@ static const struct ov2740_reg mode_1932x1092_regs_360mhz[] = {
 	{0x4017, 0x10},
 	{0x4044, 0x02},
 	{0x4304, 0x08},
-	{0x4307, 0x30},
+	{OV2740_REG_EMBEDDED_CTRL,
+	 OV2740_EMBEDDED_CTRL_MYSTERY | OV2740_EMBEDDED_CTRL_ENABLE},
 	{0x4320, 0x80},
 	{0x4322, 0x00},
 	{0x4323, 0x00},
@@ -309,6 +341,7 @@ static const struct ov2740_reg mode_1932x1092_regs_180mhz[] = {
 	{0x3000, 0x00},
 	{0x3018, 0x32},	/* 0x32 for 2 lanes, 0x12 for 1 lane */
 	{0x3031, 0x0a},
+	{OV2740_REG_EMBEDDED_DT, MIPI_CSI2_DT_EMBEDDED_8B},
 	{0x3080, 0x08},
 	{0x3083, 0xB4},
 	{0x3103, 0x00},
@@ -413,7 +446,8 @@ static const struct ov2740_reg mode_1932x1092_regs_180mhz[] = {
 	{0x4017, 0x10},
 	{0x4044, 0x02},
 	{0x4304, 0x08},
-	{0x4307, 0x30},
+	{OV2740_REG_EMBEDDED_CTRL,
+	 OV2740_EMBEDDED_CTRL_MYSTERY | OV2740_EMBEDDED_CTRL_ENABLE},
 	{0x4320, 0x80},
 	{0x4322, 0x00},
 	{0x4323, 0x00},
@@ -522,7 +556,7 @@ struct ov2740 {
 	struct device *dev;
 
 	struct v4l2_subdev sd;
-	struct media_pad pad;
+	struct media_pad pads[OV2740_NUM_PADS];
 	struct v4l2_ctrl_handler ctrl_handler;
 
 	/* V4L2 Controls */
@@ -837,15 +871,6 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	return 0;
 }
 
-static void ov2740_update_pad_format(const struct ov2740_mode *mode,
-				     struct v4l2_mbus_framefmt *fmt)
-{
-	fmt->width = mode->width;
-	fmt->height = mode->height;
-	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
-	fmt->field = V4L2_FIELD_NONE;
-}
-
 static int ov2740_load_otp_data(struct nvm_data *nvm)
 {
 	struct device *dev = regmap_get_device(nvm->regmap);
@@ -936,15 +961,25 @@ static int ov2740_load_otp_data(struct nvm_data *nvm)
 	return ret;
 }
 
-static int ov2740_start_streaming(struct ov2740 *ov2740)
+static int ov2740_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
+	struct ov2740 *ov2740 = to_ov2740(sd);
 	const struct ov2740_reg_list *reg_list;
 	int link_freq_index;
 	int ret;
 
+	if (!(streams_mask & 1ULL))
+		return 0;
+
+	ret = pm_runtime_resume_and_get(ov2740->dev);
+	if (ret < 0)
+		return ret;
+
 	ret = ov2740_identify_module(ov2740);
 	if (ret)
-		return ret;
+		goto out_pm_put;
 
 	if (ov2740->nvm)
 		ov2740_load_otp_data(ov2740->nvm);
@@ -953,7 +988,7 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
 	ret = ov2740_write_reg(ov2740, 0x0103, 1, 0x01);
 	if (ret) {
 		dev_err(ov2740->dev, "failed to reset\n");
-		return ret;
+		goto out_pm_put;
 	}
 
 	usleep_range(10000, 15000);
@@ -963,83 +998,98 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
 	ret = ov2740_write_reg_list(ov2740, reg_list);
 	if (ret) {
 		dev_err(ov2740->dev, "failed to set plls\n");
-		return ret;
+		goto out_pm_put;
 	}
 
 	reg_list = &ov2740->cur_mode->reg_list;
 	ret = ov2740_write_reg_list(ov2740, reg_list);
 	if (ret) {
 		dev_err(ov2740->dev, "failed to set mode\n");
-		return ret;
+		goto out_pm_put;
 	}
 
 	ret = __v4l2_ctrl_handler_setup(ov2740->sd.ctrl_handler);
 	if (ret)
-		return ret;
+		goto out_pm_put;
+
+	ret = ov2740_write_reg(ov2740, OV2740_REG_EMBEDDED_FLAG, 1,
+			       OV2740_EMBEDDED_FLAG_MYSTERY);
+	if (ret)
+		goto out_pm_put;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
 			       OV2740_MODE_STREAMING);
-	if (ret)
+	if (ret) {
 		dev_err(ov2740->dev, "failed to start streaming\n");
+		goto out_pm_put;
+	}
 
-	return ret;
-}
+	return 0;
 
-static void ov2740_stop_streaming(struct ov2740 *ov2740)
-{
-	if (ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
-			     OV2740_MODE_STANDBY))
-		dev_err(ov2740->dev, "failed to stop streaming\n");
+out_pm_put:
+	pm_runtime_put(ov2740->dev);
+
+	return ret;
 }
 
-static int ov2740_set_stream(struct v4l2_subdev *sd, int enable)
+static int ov2740_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
 	struct ov2740 *ov2740 = to_ov2740(sd);
-	struct v4l2_subdev_state *sd_state;
-	int ret = 0;
-
-	sd_state = v4l2_subdev_lock_and_get_active_state(&ov2740->sd);
+	int ret;
 
-	if (enable) {
-		ret = pm_runtime_resume_and_get(ov2740->dev);
-		if (ret < 0)
-			goto out_unlock;
+	if (!(streams_mask & 1ULL))
+		return 0;
 
-		ret = ov2740_start_streaming(ov2740);
-		if (ret) {
-			enable = 0;
-			ov2740_stop_streaming(ov2740);
-			pm_runtime_put(ov2740->dev);
-		}
-	} else {
-		ov2740_stop_streaming(ov2740);
-		pm_runtime_put(ov2740->dev);
-	}
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
+			       OV2740_MODE_STANDBY);
 
-out_unlock:
-	v4l2_subdev_unlock_state(sd_state);
+	pm_runtime_put(ov2740->dev);
 
 	return ret;
 }
 
-static int ov2740_set_format(struct v4l2_subdev *sd,
-			     const struct v4l2_subdev_client_info *ci,
-			     struct v4l2_subdev_state *sd_state,
-			     struct v4l2_subdev_format *fmt)
+static int __ov2740_set_format(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_mbus_framefmt *format,
+			       enum v4l2_subdev_format_whence which,
+			       unsigned int pad, unsigned int stream)
 {
+	struct v4l2_mbus_framefmt *src_pix_fmt, *src_meta_fmt, *meta_fmt;
 	struct ov2740 *ov2740 = to_ov2740(sd);
 	const struct ov2740_mode *mode;
 	s32 vblank_def, h_blank;
 
+	/*
+	 * Allow setting format on internal pixel pad as well as the source
+	 * pad's pixel stream (for compatibility).
+	 */
+	if ((pad == OV2740_PAD_SOURCE && stream == OV2740_STREAM_META) ||
+	    pad == OV2740_PAD_META) {
+		*format = *v4l2_subdev_state_get_format(sd_state, pad, stream);
+		return 0;
+	}
+
+	meta_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_META, 0);
+	src_pix_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
+						   OV2740_STREAM_PIXEL);
+	src_meta_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
+						    OV2740_STREAM_META);
+
 	mode = v4l2_find_nearest_size(ov2740->supported_modes,
 				      ov2740->supported_modes_count,
 				      width, height,
-				      fmt->format.width, fmt->format.height);
+				      format->width, format->height);
 
-	ov2740_update_pad_format(mode, &fmt->format);
-	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+	src_pix_fmt->code = format->code;
+	src_pix_fmt->width = mode->width;
+	src_pix_fmt->height = mode->height;
 
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+	*format = *src_pix_fmt;
+	*src_meta_fmt = *meta_fmt;
+
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 
 	ov2740->cur_mode = mode;
@@ -1059,6 +1109,15 @@ static int ov2740_set_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov2740_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
+			     struct v4l2_subdev_state *sd_state,
+			     struct v4l2_subdev_format *fmt)
+{
+	return __ov2740_set_format(sd, sd_state, &fmt->format, fmt->which,
+				   fmt->pad, fmt->stream);
+}
+
 static int ov2740_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -1095,15 +1154,84 @@ static int ov2740_enum_frame_size(struct v4l2_subdev *sd,
 static int ov2740_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state)
 {
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = OV2740_PAD_PIXEL,
+			.source_pad = OV2740_PAD_SOURCE,
+			.source_stream = OV2740_STREAM_PIXEL,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		}, {
+			.sink_pad = OV2740_PAD_META,
+			.source_pad = OV2740_PAD_SOURCE,
+			.source_stream = OV2740_STREAM_META,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.routes = routes,
+		.num_routes = ARRAY_SIZE(routes),
+	};
 	struct ov2740 *ov2740 = to_ov2740(sd);
+	int ret;
+
+	ret = v4l2_subdev_set_routing(sd, sd_state, &routing);
+	if (ret)
+		return ret;
+
+	struct v4l2_subdev_state *active_state =
+		v4l2_subdev_get_locked_active_state(sd);
+	struct v4l2_mbus_framefmt *pix_fmt =
+		v4l2_subdev_state_get_format(sd_state, OV2740_PAD_PIXEL, 0);
+
+	pix_fmt->code = MEDIA_BUS_FMT_RAW_10;
+	pix_fmt->width = OV2740_CROP_LEFT + OV2740_ACTIVE_WIDTH;
+	pix_fmt->height = OV2740_CROP_TOP + OV2740_ACTIVE_HEIGHT;
+	pix_fmt->field = V4L2_FIELD_NONE;
+
+	struct v4l2_mbus_framefmt *meta_fmt =
+		v4l2_subdev_state_get_format(sd_state, OV2740_PAD_META, 0);
+
+	meta_fmt->code = MEDIA_BUS_FMT_META_10;
+	meta_fmt->width = OV2740_META_WIDTH;
+	meta_fmt->height = OV2740_META_HEIGHT;
+
+	return __ov2740_set_format(sd, sd_state, pix_fmt,
+				   active_state == sd_state ?
+				   V4L2_SUBDEV_FORMAT_ACTIVE :
+				   V4L2_SUBDEV_FORMAT_TRY, OV2740_PAD_PIXEL, 0);
+}
+
+static int ov2740_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *desc)
+{
+	struct v4l2_mbus_frame_desc_entry *entry = desc->entry;
+	struct v4l2_subdev_state *sd_state;
+	struct v4l2_mbus_framefmt *fmt;
+
+	desc->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
+					   OV2740_STREAM_PIXEL);
+	entry->pixelcode = fmt->code;
+	v4l2_subdev_unlock_state(sd_state);
+
+	entry->stream = OV2740_STREAM_PIXEL;
+	entry->bus.csi2.dt = MIPI_CSI2_DT_RAW10;
+	entry++;
+	desc->num_entries++;
+
+	entry->pixelcode = MEDIA_BUS_FMT_META_10;
+	entry->stream = OV2740_STREAM_META;
+	entry->bus.csi2.dt = MIPI_CSI2_DT_EMBEDDED_8B;
+	entry++;
+	desc->num_entries++;
 
-	ov2740_update_pad_format(&ov2740->supported_modes[0],
-				 v4l2_subdev_state_get_format(sd_state, 0));
 	return 0;
 }
 
 static const struct v4l2_subdev_video_ops ov2740_video_ops = {
-	.s_stream = ov2740_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
@@ -1111,6 +1239,9 @@ static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
 	.set_fmt = ov2740_set_format,
 	.enum_mbus_code = ov2740_enum_mbus_code,
 	.enum_frame_size = ov2740_enum_frame_size,
+	.enable_streams = ov2740_enable_streams,
+	.disable_streams = ov2740_disable_streams,
+	.get_frame_desc = ov2740_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops ov2740_subdev_ops = {
@@ -1408,11 +1539,16 @@ static int ov2740_probe(struct i2c_client *client)
 	}
 
 	ov2740->sd.state_lock = ov2740->ctrl_handler.lock;
-	ov2740->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov2740->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	ov2740->sd.entity.ops = &ov2740_subdev_entity_ops;
 	ov2740->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-	ov2740->pad.flags = MEDIA_PAD_FL_SOURCE;
-	ret = media_entity_pads_init(&ov2740->sd.entity, 1, &ov2740->pad);
+	ov2740->pads[OV2740_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	ov2740->pads[OV2740_PAD_PIXEL].flags =
+		MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
+	ov2740->pads[OV2740_PAD_META].flags =
+		MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
+	ret = media_entity_pads_init(&ov2740->sd.entity,
+				     ARRAY_SIZE(ov2740->pads), ov2740->pads);
 	if (ret) {
 		dev_err_probe(dev, ret, "failed to init entity pads\n");
 		goto probe_error_v4l2_ctrl_handler_free;
-- 
2.47.3

