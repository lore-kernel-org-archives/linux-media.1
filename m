Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008521;
	b=JlNrXOsNuzjqiKZ6oGBZwEor5ole1P/D05GPPSa2Nh1C8NOjQifuuzdJFdqD5TyuolYU
	 Dgn4cM5UZB4Ug9ZVhs1JsQoGuez2QGcJH01qfnm18MdLJFZfKTCOEej0fa+POFe7/SQX7
	 l8afeRpujaGd17ALF+ldTmcsZGS1o1BL6AIuQ0SPEHLiOuMHm4Vbspm9NDoZidflRrp2B
	 0wDCOdsyrlupNsjOwSW+aAf+Cymxyddb9yb8afHMHXJr4V/l+USG47ieg2ALvksI4pE+n
	 90INWl7EHdZh1SR3ov+8fYot2qkVj3VS8Sh0LdVa/gBkyscqM2PwYKcpTsV+gELaizw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008521;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=d6fwNSzh+Cvp/spDprhJYkF5R1lWmynwViXlGtk5bF4=;
	b=Gob8ngo/hMSYuPHhIcDbYCR2iN3HXlRq/CnMK6AWEWfOGZBHzASFMqRnRq/b6O+bK/rk
	 qdeVjB0LZkQDBKMXjJyhcB8UiohdZSA8/WXGtSEp3KQXP2w3cLA6BaFAMsRwIT/asqWEz
	 FhzEto4HIhz0P+JDIjqj55uq9cfj+c6w3Vvmfb7A4no2I3dXQVhU+A51vKM6aogA5bmJF
	 9XHbzESZw1PwEao0l5RDZgYRTzGFb4DxKvznfj8Bzejc7I4eB21LYGQy4ZIg1G/4gYJi0
	 XyANo4Xe6zgj+Qk8aVLT+40HjWK51Dlv7wEz9GstgYkwV6TNxRvB7vmZ4/5lyQROyNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="TTwC/cdv";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4BF606A333
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A4BF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TTwC/cdv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008522; x=1826544522;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dkHlG0GwMMxs17ot+km7G3kUk3jTgHoTOVVDBWWLImk=;
  b=TTwC/cdvicR82ofAYFKU7j1T31ChvjYvsp+azhy46imPDHyupY4+PFCZ
   fGqpPUjfJiG4Si8elv6hGQZH3G9pHpyJVG1e44sw4EtXbG/0aiEoeliOY
   iSeBWjjYUvfNAlut0Oh2YwQS9E7zKW/LFawmGMb3ahLNiOaL85gFQO9jG
   tFnUAKcukXUMHEKRDD+rJ424ksuhYPHbVlUa98C/0vLdcxd07aVHBXVxI
   WZrgcFxu0OA5wZTQQOahwzBBq26LUH+QnOqwo5otxN/I/XULdNTRhFKjZ
   eTKoqtAljThjc2Ac1rSAFDWM5UBLyP86fmiXtTW5wLqxlTJIexv/fQO8V
   A==;
X-CSE-ConnectionGUID: b4zPmlyKQTuGNk6yWxjO6g==
X-CSE-MsgGUID: Sf/OZCCXS3e92Jqx4DEHjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3702724"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3702724"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:39 -0800
X-CSE-ConnectionGUID: cuhPIYDxRp240CbeE/qpWg==
X-CSE-MsgGUID: 9WkBqHOvTBy8kKT2AOsDtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10678036"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:31 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D9A1A122A7B;
	Wed, 18 Nov 2026 15:28:20 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tdE-2Ez7;
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
Subject: [PATCH v13 55/73] media: ov2740: Add support for FLL and LLP controls
Date: Wed, 18 Nov 2026 15:28:01 +0200
Message-ID: <20261118132819.213473-56-sakari.ailus@linux.intel.com>
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

Add support for the V4L2_CID_FRAME_LENGTH_LINES and
V4L2_CID_LINE_LENGTH_PIXELS controls.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 55 ++++++++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index ff1f5158786b..eaf6183b802d 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -16,6 +16,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
 
 #define OV2740_LINK_FREQ_360MHZ		360000000ULL
 #define OV2740_LINK_FREQ_180MHZ		180000000ULL
@@ -562,9 +563,12 @@ struct ov2740 {
 	/* V4L2 Controls */
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *fll;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *llp;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	bool setting_ctrl;
 
 	/* GPIOs, clocks, regulators */
 	struct gpio_desc *reset_gpio;
@@ -738,18 +742,28 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov2740 *ov2740 = container_of(ctrl->handler,
 					     struct ov2740, ctrl_handler);
-	s64 exposure_max;
-	int ret;
+	int ret = 0;
 
 	/* Propagate change of current control to all related controls */
-	if (ctrl->id == V4L2_CID_VBLANK) {
-		/* Update max exposure while meeting expected vblanking */
-		exposure_max = ov2740->cur_mode->height + ctrl->val -
-			       OV2740_EXPOSURE_MAX_MARGIN;
-		__v4l2_ctrl_modify_range(ov2740->exposure,
-					 ov2740->exposure->minimum,
-					 exposure_max, ov2740->exposure->step,
-					 exposure_max);
+	switch (ctrl->id) {
+	case V4L2_CID_FRAME_LENGTH_LINES:
+	case V4L2_CID_VBLANK:
+	case V4L2_CID_LINE_LENGTH_PIXELS:
+	case V4L2_CID_HBLANK: {
+		struct v4l2_subdev_state *state =
+			v4l2_subdev_get_locked_active_state(&ov2740->sd);
+		const struct v4l2_mbus_framefmt *format =
+			v4l2_subdev_state_get_format(state, OV2740_PAD_SOURCE,
+						     OV2740_STREAM_PIXEL);
+
+		ret = v4l2_sensor_fll_llp_set(ov2740->fll, ov2740->vblank,
+					      ov2740->llp, ov2740->hblank,
+					      ov2740->exposure, format,
+					      ctrl, &ov2740->setting_ctrl,
+					      OV2740_EXPOSURE_MAX_MARGIN);
+		if (ret)
+			return ret;
+	}
 	}
 
 	/* V4L2 controls values will be applied only when power is already up */
@@ -773,8 +787,10 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_VBLANK:
-		ret = ov2740_write_reg(ov2740, OV2740_REG_VTS, 2,
-				       ov2740->cur_mode->height + ctrl->val);
+		break;
+
+	case V4L2_CID_FRAME_LENGTH_LINES:
+		ret = ov2740_write_reg(ov2740, OV2740_REG_VTS, 2, ctrl->val);
 		break;
 
 	case V4L2_CID_TEST_PATTERN:
@@ -804,7 +820,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 15);
 	if (ret)
 		return ret;
 
@@ -825,10 +841,22 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	vblank_min = ov2740->cur_mode->vts_min - ov2740->cur_mode->height;
 	vblank_max = ov2740->cur_mode->vts_max - ov2740->cur_mode->height;
 	vblank_default = ov2740->cur_mode->vts_def - ov2740->cur_mode->height;
+	ov2740->fll = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+					V4L2_CID_FRAME_LENGTH_LINES,
+					ov2740->cur_mode->vts_min,
+					ov2740->cur_mode->vts_max, 1,
+					ov2740->cur_mode->vts_def);
 	ov2740->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					   V4L2_CID_VBLANK, vblank_min,
 					   vblank_max, 1, vblank_default);
 
+	ov2740->llp = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+					V4L2_CID_LINE_LENGTH_PIXELS,
+					ov2740->cur_mode->hts,
+					ov2740->cur_mode->hts, 1,
+					ov2740->cur_mode->hts);
+	if (ov2740->llp)
+		ov2740->llp->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	h_blank = ov2740->cur_mode->hts - ov2740->cur_mode->width;
 	ov2740->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					   V4L2_CID_HBLANK, h_blank, h_blank, 1,
@@ -1215,7 +1243,6 @@ static int ov2740_init_state(struct v4l2_subdev *sd,
 		.routes = routes,
 		.num_routes = ARRAY_SIZE(routes),
 	};
-	struct ov2740 *ov2740 = to_ov2740(sd);
 	int ret;
 
 	ret = v4l2_subdev_set_routing(sd, sd_state, &routing);
-- 
2.47.3

