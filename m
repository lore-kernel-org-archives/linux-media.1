Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008521;
	b=SH4JOswApapzLywyDHqm6TKEuzKj5eLnP0cCXi6lD7bsSCzvnqEh7C9nOZtkmbuw16lm
	 ISnBr4vRjyFkl1EAj7o/1H20ardpJoOWvYJsRwIB1bf9bKk64CMZ6NvrBcyJxbVHJp4XH
	 j2/HqEdMngsBXK4xRCyoM5E9vkMAsj9IAzCrvt497umbhIoBYWpM1uVJR+J4uELmTXu0k
	 wkIlhlaoMMNjwr7SV0S8mHf99OXqQHHDkTSkGgZP5metG/tgPKJBY3QOrWulDPeIS0I8I
	 B8yNc2DwjpMPUnzq5/vpKpKxIhK8srVfxN+Vobn+a3BRp2qDSpYmQw9gNjvIhmgjHfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008521;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=CMRcKzx0kKV8I1nvykD+TIoCv5zypj70OprUkvDyzZM=;
	b=xxhjFwyRpGaf6ANfFTnBx+jSckQ0rFx4bhn1rkATk/Qo6EktBISkNff20nrSsfP22V6H
	 h0vBpY9arPqT7WOL+EgqbQkF0dlwvOMNSZm0rv/Ek83DnWJhA6XEWz5XDB7f5SQv0s+xo
	 FVAM/jiXYYp0q8zbCtfEm6IOtYUn1FyfgQGQMGMCkoNouIkgbwGojdVoWE/ZHpswbP0aR
	 cp9bURXlYkAMyy6lmba+5YR/tocjtJu1PnZuQ6uUrMFGmh7GCbNTx/Jla/6AWTiO/yRyP
	 eOwdZe967gNou4annVOXiSXV5/peCqb2MS2p+lquNSwYhSnNKAZQb1NbMItZO0i7S4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AsBrIc4u;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C721606A332
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C721606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AsBrIc4u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008521; x=1826544521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I0ODA+LXJG7uqKOkhgwJEr5YpiR61+0eDfJI6YdNUMc=;
  b=AsBrIc4uvG7bFD3/be3Mz3i20icgRNZHc94pdBAO4diWby66pBhAu7Fz
   OWd+9TVvQWDC5ISV661NBvi7j++VVXrsQpyzR2WurHV4OUIECKzYqUo7I
   zJ4qGPQA/p4uI3Rag/eyuUw9AXi14AGfj/4T8AmBOAP1fVVVodmxKRD5/
   JsQ1+HjkS3yWAcMsPI/FuUb4Y4HPVBapXFBPeJDoXpr9Uk0Fl6cGeEJxw
   BEybUhSqfvV4MY3Z1ckjPFMGf0G18ewo9J6fFfY/PnFuK433Viqcu+5D+
   yZSSsVba9QhLRurwbqsJSFPpVYR/qa9DBIWXrXCkmIX2G8q1F+OhUjEMI
   Q==;
X-CSE-ConnectionGUID: Ht3muZpjQxiUnjr55ewGcw==
X-CSE-MsgGUID: 9R9ZSwmKQlWqfwi2vmtg/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3702711"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3702711"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:39 -0800
X-CSE-ConnectionGUID: KszYCpXdShm3OrUAjwwpjg==
X-CSE-MsgGUID: zbPpXQ/NQV6NTdeZyeVzaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10678030"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:31 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E4464122B90;
	Wed, 18 Nov 2026 15:28:20 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tdT-2QSn;
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
Subject: [PATCH v13 58/73] media: imx219: Add internal image pad for Common Raw Sensor Model
Date: Wed, 18 Nov 2026 15:28:04 +0200
Message-ID: <20261118132819.213473-59-sakari.ailus@linux.intel.com>
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

Add internal image pad in preparation of supporting the Common Raw Sensor
Model. A compatibility interface provided for the existing users.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 232 +++++++++++++++++++++++++++----------
 1 file changed, 173 insertions(+), 59 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 1580562093e8..7facb1344e88 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -145,13 +145,19 @@
 #define IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED	363000000
 #define IMX219_DEFAULT_LINK_FREQ_4LANE	364000000
 
+/* For compatibility with the old UAPI. */
+#define IMX219_COMPAT_ACTIVE_AREA_TOP	8U
 /* IMX219 native and active pixel array size. */
-#define IMX219_NATIVE_WIDTH		3296U
-#define IMX219_NATIVE_HEIGHT		2480U
+#define IMX219_INACTIVE_AREA_HEIGHT	42U
 #define IMX219_ACTIVE_AREA_LEFT		8U
-#define IMX219_ACTIVE_AREA_TOP		8U
+#define IMX219_ACTIVE_AREA_TOP		(IMX219_INACTIVE_AREA_HEIGHT + 8U)
 #define IMX219_ACTIVE_AREA_WIDTH	3280U
 #define IMX219_ACTIVE_AREA_HEIGHT	2464U
+#define IMX219_PIXEL_ARRAY_LEFT		0U
+#define IMX219_PIXEL_ARRAY_TOP		IMX219_INACTIVE_AREA_HEIGHT
+#define IMX219_PIXEL_ARRAY_WIDTH	3296U
+#define IMX219_PIXEL_ARRAY_HEIGHT	2480U
+#define IMX219_NATIVE_FORMAT		MEDIA_BUS_FMT_SRGGB10_1X10
 
 /* Mode : resolution and related config&values */
 struct imx219_mode {
@@ -351,9 +357,15 @@ static const struct imx219_mode supported_modes[] = {
 	},
 };
 
+enum imx219_pad_ids {
+	IMX219_PAD_SOURCE = 0,
+	IMX219_PAD_IMAGE,
+	IMX219_NUM_PADS,
+};
+
 struct imx219 {
 	struct v4l2_subdev sd;
-	struct media_pad pad;
+	struct media_pad pads[IMX219_NUM_PADS];
 
 	struct regmap *regmap;
 	struct clk *xclk; /* system clock to IMX219 */
@@ -421,8 +433,9 @@ static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
 			       u8 *bin_v)
 {
 	const struct v4l2_mbus_framefmt *format =
-		v4l2_subdev_state_get_format(state, 0);
-	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	const struct v4l2_rect *crop =
+		v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE);
 	u32 hbin = crop->width / format->width;
 	u32 vbin = crop->height / format->height;
 
@@ -460,7 +473,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 	int ret = 0;
 
 	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
-	format = v4l2_subdev_state_get_format(state, 0);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
 	rate_factor = imx219_get_rate_factor(state);
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
@@ -687,8 +700,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	u32 bpp;
 	int ret = 0;
 
-	format = v4l2_subdev_state_get_format(state, 0);
-	crop = v4l2_subdev_state_get_crop(state, 0);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
 	bpp = imx219_get_format_bpp(format);
 
 	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
@@ -815,10 +828,25 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 {
 	struct imx219 *imx219 = to_imx219(sd);
 
-	if (code->index >= (ARRAY_SIZE(imx219_mbus_formats) / 4))
-		return -EINVAL;
+	if (code->pad == IMX219_PAD_IMAGE) {
+		/* The internal image pad is hardwired to the native format. */
+		if (code->index > 0)
+			return -EINVAL;
+
+		code->code = IMX219_NATIVE_FORMAT;
+	} else {
+		/*
+		 * On the source pad, the sensor supports multiple raw formats
+		 * with different bit depths.
+		 */
+		u32 format;
 
-	code->code = imx219_get_format_code(imx219, imx219_mbus_formats[code->index * 4]);
+		if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4)
+			return -EINVAL;
+
+		format = imx219_mbus_formats[code->index * 4];
+		code->code = imx219_get_format_code(imx219, format);
+	}
 
 	return 0;
 }
@@ -828,27 +856,32 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct imx219 *imx219 = to_imx219(sd);
-	u32 code;
-
-	if (fse->index >= ARRAY_SIZE(supported_modes))
-		return -EINVAL;
 
-	code = imx219_get_format_code(imx219, fse->code);
-	if (fse->code != code)
-		return -EINVAL;
+	if (fse->pad == IMX219_PAD_IMAGE) {
+		if (fse->code != MEDIA_BUS_FMT_RAW_10 || fse->index > 0)
+			return -EINVAL;
 
-	fse->min_width = supported_modes[fse->index].width;
-	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes[fse->index].height;
-	fse->max_height = fse->min_height;
+		fse->min_width = IMX219_PIXEL_ARRAY_WIDTH;
+		fse->max_width = IMX219_PIXEL_ARRAY_WIDTH;
+		fse->min_height = IMX219_PIXEL_ARRAY_HEIGHT;
+		fse->max_height = IMX219_PIXEL_ARRAY_HEIGHT;
+	} else {
+		if (fse->code != imx219_get_format_code(imx219, fse->code) ||
+		    fse->index >= ARRAY_SIZE(supported_modes))
+			return -EINVAL;
+
+		fse->min_width = supported_modes[fse->index].width;
+		fse->max_width = fse->min_width;
+		fse->min_height = supported_modes[fse->index].height;
+		fse->max_height = fse->min_height;
+	}
 
 	return 0;
 }
 
-static int imx219_set_pad_format(struct v4l2_subdev *sd,
-				 const struct v4l2_subdev_client_info *ci,
-				 struct v4l2_subdev_state *state,
-				 struct v4l2_subdev_format *fmt)
+static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					struct v4l2_subdev_format *fmt)
 {
 	struct imx219 *imx219 = to_imx219(sd);
 	const struct imx219_mode *mode;
@@ -857,7 +890,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	u8 bin_h, bin_v, bin_hv;
 	int ret;
 
-	format = v4l2_subdev_state_get_format(state, 0);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
 
 	/*
 	 * Adjust the requested format to match the closest mode. The Bayer
@@ -889,11 +922,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	/* Ensure bin_h and bin_v are same to avoid 1:2 or 2:1 stretching */
 	bin_hv = min(bin_h, bin_v);
 
-	crop = v4l2_subdev_state_get_crop(state, 0);
+	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE);
 	crop->width = format->width * bin_hv;
 	crop->height = format->height * bin_hv;
-	crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
-	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
+	crop->left = (IMX219_PIXEL_ARRAY_WIDTH - crop->width) / 2;
+	crop->top = (IMX219_PIXEL_ARRAY_HEIGHT - crop->height) / 2 +
+		IMX219_ACTIVE_AREA_TOP;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		int rate_factor = imx219_get_rate_factor(state);
@@ -959,51 +993,130 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx219_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct imx219 *imx219 = to_imx219(sd);
+	struct v4l2_mbus_framefmt *format;
+
+	if (!(ci && ci->caps & V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR))
+		return imx219_set_pad_format_compat(sd, state, fmt);
+
+	if (fmt->pad != IMX219_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, state, fmt);
+
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+
+	format->code = fmt->format.code =
+		imx219_get_format_code(imx219, fmt->format.code);
+
+	return 0;
+}
+
 static int imx219_get_selection(struct v4l2_subdev *sd,
 				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
-	switch (sel->target) {
-	case V4L2_SEL_TGT_CROP:
-		sel->r = *v4l2_subdev_state_get_crop(state, 0);
-		return 0;
+	if (!(ci &&
+	      ci->caps & V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR)) {
+		if (sel->pad != IMX219_PAD_SOURCE)
+			return -EINVAL;
+
+		switch (sel->target) {
+		case V4L2_SEL_TGT_CROP:
+			sel->r = *v4l2_subdev_state_get_crop(state,
+							     IMX219_PAD_IMAGE);
+			sel->r.top += -IMX219_ACTIVE_AREA_TOP +
+				IMX219_COMPAT_ACTIVE_AREA_TOP;
+			return 0;
+
+		case V4L2_SEL_TGT_NATIVE_SIZE:
+			sel->r.top = 0;
+			sel->r.left = 0;
+			sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
+			sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
+
+			return 0;
+
+		case V4L2_SEL_TGT_CROP_DEFAULT:
+		case V4L2_SEL_TGT_CROP_BOUNDS:
+			sel->r.top = IMX219_COMPAT_ACTIVE_AREA_TOP;
+			sel->r.left = IMX219_ACTIVE_AREA_LEFT;
+			sel->r.width = IMX219_ACTIVE_AREA_WIDTH;
+			sel->r.height = IMX219_ACTIVE_AREA_HEIGHT;
+
+			return 0;
+		}
 
-	case V4L2_SEL_TGT_NATIVE_SIZE:
-		sel->r.top = 0;
-		sel->r.left = 0;
-		sel->r.width = IMX219_NATIVE_WIDTH;
-		sel->r.height = IMX219_NATIVE_HEIGHT;
+		return -EINVAL;
+	}
 
-		return 0;
+	if (sel->pad != IMX219_PAD_IMAGE)
+		return -EINVAL;
 
-	case V4L2_SEL_TGT_CROP_DEFAULT:
+	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 		sel->r.top = IMX219_ACTIVE_AREA_TOP;
 		sel->r.left = IMX219_ACTIVE_AREA_LEFT;
 		sel->r.width = IMX219_ACTIVE_AREA_WIDTH;
 		sel->r.height = IMX219_ACTIVE_AREA_HEIGHT;
-
 		return 0;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.top = IMX219_ACTIVE_AREA_TOP;
+		sel->r.left = IMX219_ACTIVE_AREA_LEFT;
+		sel->r.width = IMX219_ACTIVE_AREA_WIDTH;
+		sel->r.height = IMX219_ACTIVE_AREA_HEIGHT;
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *v4l2_subdev_state_get_crop(state, sel->pad);
+		return 0;
+	case V4L2_SEL_TGT_COMPOSE:
+		sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
+		return 0;
+	default:
+		return -EINVAL;
 	}
-
-	return -EINVAL;
 }
 
 static int imx219_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_TRY,
-		.pad = 0,
-		.format = {
-			.code = MEDIA_BUS_FMT_SRGGB10_1X10,
-			.width = supported_modes[0].width,
-			.height = supported_modes[0].height,
-		},
-	};
+	struct v4l2_mbus_framefmt *pixel_array_format =
+		v4l2_subdev_state_get_format(state, IMX219_PAD_IMAGE);
+	struct v4l2_rect *analogue_crop =
+		v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
+	struct v4l2_rect *compose =
+		v4l2_subdev_state_get_compose(state, IMX219_PAD_IMAGE);
+	struct v4l2_mbus_framefmt *source_format =
+		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+
+	/* The image pad models the pixel array, and thus has a fixed format. */
+	pixel_array_format->code = MEDIA_BUS_FMT_RAW_10;
+	pixel_array_format->width = IMX219_ACTIVE_AREA_WIDTH;
+	pixel_array_format->height = IMX219_ACTIVE_AREA_HEIGHT;
+	pixel_array_format->field = V4L2_FIELD_NONE;
+	pixel_array_format->colorspace = V4L2_COLORSPACE_RAW;
+	pixel_array_format->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	pixel_array_format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	pixel_array_format->xfer_func = V4L2_XFER_FUNC_NONE;
+
+	analogue_crop->top = IMX219_ACTIVE_AREA_TOP;
+	analogue_crop->left = IMX219_ACTIVE_AREA_LEFT;
+	analogue_crop->width = IMX219_ACTIVE_AREA_WIDTH;
+	analogue_crop->height = IMX219_ACTIVE_AREA_HEIGHT;
+
+	compose->width = analogue_crop->width;
+	compose->height = analogue_crop->height;
+
+	*source_format = *pixel_array_format;
+	source_format->code = IMX219_NATIVE_FORMAT;
+	source_format->width = compose->width;
+	source_format->height = compose->height;
 
-	return imx219_set_pad_format(sd, NULL, state, &fmt);
+	return 0;
 }
 
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
@@ -1270,14 +1383,15 @@ static int imx219_probe(struct i2c_client *client)
 	if (ret)
 		goto error_power_off;
 
-	/* Initialize subdev */
 	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
-	/* Initialize source pad */
-	imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
+	imx219->pads[IMX219_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	imx219->pads[IMX219_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK
+					     | MEDIA_PAD_FL_INTERNAL;
 
-	ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
+	ret = media_entity_pads_init(&imx219->sd.entity,
+				     ARRAY_SIZE(imx219->pads), imx219->pads);
 	if (ret) {
 		dev_err_probe(dev, ret, "failed to init entity pads\n");
 		goto error_handler_free;
-- 
2.47.3

