Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008523;
	b=yUQ6I68CBKi5SeTmmDDo4fvMUtneUHMEwk9T3aYNPMfgkYTqWudlms0umnli3YfRMxUq
	 wdFdbrpNdJ8TDpAP5EAzJXXW/SD6WUIA4odxNGQR4vjQQnG+zPGeWTcPxe0T8dHqz4rJ5
	 5tvf71B5g3+rKEHZXlsfgb77jDIgURXJrteiQSNqNRIAlgNiALDeZMCXnQ9Qwip+7tj60
	 1zy1QzjrWT5HXNFn2C/lvTwytMylU0qkyoIP+zE73EqTcu88+NG0ukBYyKj+8ns1vnre7
	 N4AoujwQpNVnhNiK0OaJe2f9UiyH91qOO1dD5HTFW4WvSzScDX45QD7mMpWoove/1iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008523;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=DY9yc2fmzpeYciaIw2GHA40n4Gqn4CAxitXky74Gejg=;
	b=tvNpxAHZMc+AUKb6YH9nBKz8P1NdgrqWqVtL+Pwr8GbvbOSk7fr15nTqPYxyFVHhWZIK
	 ViLDBrrlHEovHPoZiZlEqAnE3vf8ACl3bnndWm1E3gm2NlcMpSUShvOmV00EPlE6+0NV/
	 PFR4AllK7gaEGSWC+iL6buUuEMPUAz088WAejD/HnQ3DYBJGsGqm1BalBTTqNuZZhgAmL
	 9f+VAbSPWwYCIkRb8dhRmfGIPQFoZ4/A/kSDWHkUfnRUusaGaDYGy7NaOP9sqfElPPVRY
	 gfdgVv3GZa+abKfIAu7gOH6UP2N7abbOQT5F0VyJ27qtw/eVsAHxuC//CKrOotEnKmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dr3E+vVD;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3E1606A337
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B3E1606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dr3E+vVD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008524; x=1826544524;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xD67dST7j7rVZ20meSFwpp8LYZmh5Ua8SH10Ie26WzQ=;
  b=Dr3E+vVDt7WV57mfYB1Ab/vmJgboz9H4n7c8R+xeCDAJkGF/pK3luyuO
   I4ngp4nZBjX56dpY0Tp0aak//K0O2LvN1+94QGwyzEzUGWpjFNWORgh53
   FnBvWL4IENT0eIdeNd4lIC+Y+4AGJMPeaexn79u23UeWGFNnAOrf+Ms/k
   tJegoz93hJFa+Rz7kuLyZhVebPByz0Fg3EZOt4VXRmYWIqWTzESg/KajG
   H0EC7kBiQCYYC6CvWRtVwn2a5m562k3rZpysWtXTEfzjv919Z3Sesi5G7
   aUxzHMC1Ef966OvdNavqYvSivMisXI/g5RYSWB0vNgFe0ewrh98wsNJCM
   A==;
X-CSE-ConnectionGUID: I/YWw/VgTbyRryfoQ+jxMg==
X-CSE-MsgGUID: 99/yD22dS0ahj2xKvez5Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3702784"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3702784"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:40 -0800
X-CSE-ConnectionGUID: MbP0QWSvS86dTHvjP361Yw==
X-CSE-MsgGUID: vSWo3YZ/SiaKk29n9+USng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10678040"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:31 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F368E122C10;
	Wed, 18 Nov 2026 15:28:20 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tdn-2g4g;
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
Subject: [PATCH v13 62/73] media: imx219: Add embedded data support
Date: Wed, 18 Nov 2026 15:28:08 +0200
Message-ID: <20261118132819.213473-63-sakari.ailus@linux.intel.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The IMX219 generates embedded data unconditionally. Report it as an
additional stream, with a new internal embedded data pad, and update
subdev operations accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 176 +++++++++++++++++++++++++++++++------
 1 file changed, 150 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f61dd3a25ac6..d0dad5c4eb46 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -160,6 +160,9 @@
 #define IMX219_PIXEL_ARRAY_HEIGHT	2480U
 #define IMX219_NATIVE_FORMAT		MEDIA_BUS_FMT_SRGGB10_1X10
 
+/* Embedded metadata stream height */
+#define IMX219_EMBEDDED_DATA_HEIGHT	2U
+
 /* Mode : resolution and related config&values */
 struct imx219_mode {
 	/* Frame width */
@@ -361,11 +364,13 @@ static const struct imx219_mode supported_modes[] = {
 enum imx219_pad_ids {
 	IMX219_PAD_SOURCE = 0,
 	IMX219_PAD_IMAGE,
+	IMX219_PAD_EDATA,
 	IMX219_NUM_PADS,
 };
 
 enum imx219_stream_ids {
 	IMX219_STREAM_IMAGE,
+	IMX219_STREAM_EDATA,
 };
 
 struct imx219 {
@@ -434,6 +439,25 @@ static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
 	}
 }
 
+static u32
+imx219_get_embedded_format_code(const struct v4l2_mbus_framefmt *format)
+{
+	switch (format->code) {
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		return MEDIA_BUS_FMT_META_8;
+
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	default:
+		return MEDIA_BUS_FMT_META_10;
+	}
+}
+
 static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
 			       u8 *bin_v)
 {
@@ -777,6 +801,9 @@ static int imx219_enable_streams(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
 	int ret;
 
+	if (!(streams_mask & 1ULL))
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&client->dev);
 	if (ret < 0)
 		return ret;
@@ -834,6 +861,9 @@ static int imx219_disable_streams(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
 	int ret;
 
+	if (!(streams_mask & 1ULL))
+		return 0;
+
 	/* set stream off register */
 	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
 			IMX219_MODE_STANDBY, NULL);
@@ -854,17 +884,32 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 {
 	struct imx219 *imx219 = to_imx219(sd);
 
-	if (code->pad == IMX219_PAD_IMAGE) {
-		/* The internal image pad is hardwired to the native format. */
+	switch (code->pad) {
+	case IMX219_PAD_IMAGE:
 		if (code->index > 0)
 			return -EINVAL;
 
-		code->code = IMX219_NATIVE_FORMAT;
-	} else {
-		/*
-		 * On the source pad, the sensor supports multiple raw formats
-		 * with different bit depths.
-		 */
+		code->code = MEDIA_BUS_FMT_RAW_10;
+		return 0;
+
+	case IMX219_PAD_EDATA:
+		if (code->index > 0)
+			return -EINVAL;
+
+		code->code = MEDIA_BUS_FMT_META_8;
+		return 0;
+
+	case IMX219_PAD_SOURCE:
+	default:
+		break;
+	}
+
+	/*
+	 * On the source pad, the sensor supports multiple image raw formats
+	 * with different bit depths. The embedded data format bit depth
+	 * follows the image stream.
+	 */
+	if (code->stream == IMX219_STREAM_IMAGE) {
 		u32 format;
 
 		if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4)
@@ -872,6 +917,15 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 
 		format = imx219_mbus_formats[code->index * 4];
 		code->code = imx219_get_format_code(imx219, format);
+	} else {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+						   IMX219_STREAM_EDATA);
+		code->code = fmt->code;
 	}
 
 	return 0;
@@ -883,15 +937,33 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 {
 	struct imx219 *imx219 = to_imx219(sd);
 
-	if (fse->pad == IMX219_PAD_IMAGE) {
+	switch (fse->pad) {
+	case IMX219_PAD_IMAGE:
 		if (fse->code != MEDIA_BUS_FMT_RAW_10 || fse->index > 0)
 			return -EINVAL;
 
-		fse->min_width = IMX219_PIXEL_ARRAY_WIDTH;
-		fse->max_width = IMX219_PIXEL_ARRAY_WIDTH;
-		fse->min_height = IMX219_PIXEL_ARRAY_HEIGHT;
-		fse->max_height = IMX219_PIXEL_ARRAY_HEIGHT;
-	} else {
+		fse->min_width = IMX219_ACTIVE_AREA_WIDTH;
+		fse->max_width = IMX219_ACTIVE_AREA_WIDTH;
+		fse->min_height = IMX219_ACTIVE_AREA_HEIGHT;
+		fse->max_height = IMX219_ACTIVE_AREA_HEIGHT;
+		return 0;
+
+	case IMX219_PAD_EDATA:
+		if (fse->code != MEDIA_BUS_FMT_META_8 || fse->index > 0)
+			return -EINVAL;
+
+		fse->min_width = IMX219_ACTIVE_AREA_WIDTH;
+		fse->max_width = IMX219_ACTIVE_AREA_WIDTH;
+		fse->min_height = IMX219_EMBEDDED_DATA_HEIGHT;
+		fse->max_height = IMX219_EMBEDDED_DATA_HEIGHT;
+		return 0;
+
+	case IMX219_PAD_SOURCE:
+	default:
+		break;
+	}
+
+	if (fse->stream == IMX219_STREAM_IMAGE) {
 		if (fse->code != imx219_get_format_code(imx219, fse->code) ||
 		    fse->index >= ARRAY_SIZE(supported_modes))
 			return -EINVAL;
@@ -900,6 +972,21 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 		fse->max_width = fse->min_width;
 		fse->min_height = supported_modes[fse->index].height;
 		fse->max_height = fse->min_height;
+	} else {
+		struct v4l2_mbus_framefmt *fmt;
+
+		fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+						   IMX219_STREAM_EDATA);
+		if (fse->code != fmt->code)
+			return -EINVAL;
+
+		if (fse->index > 0)
+			return -EINVAL;
+
+		fse->min_width = fmt->width;
+		fse->max_width = fmt->width;
+		fse->min_height = IMX219_EMBEDDED_DATA_HEIGHT;
+		fse->max_height = IMX219_EMBEDDED_DATA_HEIGHT;
 	}
 
 	return 0;
@@ -911,13 +998,16 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 {
 	struct imx219 *imx219 = to_imx219(sd);
 	const struct imx219_mode *mode;
-	struct v4l2_mbus_framefmt *format;
+	struct v4l2_mbus_framefmt *format, *embedded_format;
 	struct v4l2_rect *crop;
 	u8 bin_h, bin_v, bin_hv;
 	int ret;
 
 	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
 					      IMX219_STREAM_IMAGE);
+	embedded_format =
+		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					     IMX219_STREAM_EDATA);
 
 	/*
 	 * Adjust the requested format to match the closest mode. The Bayer
@@ -939,6 +1029,8 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 
 	*format = fmt->format;
 
+	embedded_format->code = imx219_get_embedded_format_code(format);
+
 	/*
 	 * Use binning to maximize the crop rectangle size, and centre it in the
 	 * sensor.
@@ -1031,7 +1123,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	if (!(ci && ci->caps & V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR))
 		return imx219_set_pad_format_compat(sd, state, fmt);
 
-	if (fmt->pad != IMX219_PAD_SOURCE)
+	if (fmt->pad != IMX219_PAD_SOURCE && fmt->stream != IMX219_STREAM_IMAGE)
 		return v4l2_subdev_get_fmt(sd, state, fmt);
 
 	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
@@ -1082,7 +1174,11 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 	}
 
-	if (sel->pad != IMX219_PAD_IMAGE)
+	/*
+	 * The embedded data stream doesn't support selection rectangles,
+	 * neither on the embedded data pad nor on the source pad.
+	 */
+	if (sel->pad != IMX219_PAD_IMAGE || sel->stream != IMX219_STREAM_IMAGE)
 		return -EINVAL;
 
 	switch (sel->target) {
@@ -1112,35 +1208,41 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				 struct v4l2_mbus_frame_desc *fd)
 {
-	const struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev_state *state;
-	u32 code;
+	u32 img_code;
+	u32 ed_code;
 
 	if (pad != IMX219_PAD_SOURCE)
 		return -EINVAL;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
-	fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
-					   IMX219_STREAM_IMAGE);
-	code = fmt->code;
+	img_code = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+						IMX219_STREAM_IMAGE)->code;
+	ed_code = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					       IMX219_STREAM_EDATA)->code;
 	v4l2_subdev_unlock_state(state);
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
-	fd->num_entries = 1;
+	fd->num_entries = 2;
 
-	fd->entry[0].pixelcode = code;
+	fd->entry[0].pixelcode = img_code;
 	fd->entry[0].stream = IMX219_STREAM_IMAGE;
 	fd->entry[0].bus.csi2.vc = 0;
-	fd->entry[0].bus.csi2.dt = imx219_format_bpp(code) == 8 ?
+	fd->entry[0].bus.csi2.dt = imx219_format_bpp(img_code) == 8 ?
 		MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
 
+	fd->entry[1].pixelcode = ed_code;
+	fd->entry[1].stream = IMX219_STREAM_EDATA;
+	fd->entry[1].bus.csi2.vc = 0;
+	fd->entry[1].bus.csi2.dt = MIPI_CSI2_DT_EMBEDDED_8B;
+
 	return 0;
 }
 
 static int imx219_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
-	struct v4l2_subdev_route routes[1] = {
+	struct v4l2_subdev_route routes[] = {
 		{
 			.sink_pad = IMX219_PAD_IMAGE,
 			.sink_stream = 0,
@@ -1149,6 +1251,14 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
 				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
 				 V4L2_SUBDEV_ROUTE_FL_STATIC,
+		}, {
+			.sink_pad = IMX219_PAD_EDATA,
+			.sink_stream = 0,
+			.source_pad = IMX219_PAD_SOURCE,
+			.source_stream = IMX219_STREAM_EDATA,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
+				 V4L2_SUBDEV_ROUTE_FL_STATIC,
 		},
 	};
 	struct v4l2_subdev_krouting routing = {
@@ -1171,6 +1281,11 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *source_format =
 		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
 					     IMX219_STREAM_IMAGE);
+	struct v4l2_mbus_framefmt *embedded_format =
+		v4l2_subdev_state_get_format(state, IMX219_PAD_EDATA);
+	struct v4l2_mbus_framefmt *embedded_source_format =
+		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					     IMX219_STREAM_EDATA);
 
 	/* The image pad models the pixel array, and thus has a fixed format. */
 	pixel_array_format->code = MEDIA_BUS_FMT_RAW_10;
@@ -1195,6 +1310,13 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 	source_format->width = compose->width;
 	source_format->height = compose->height;
 
+	embedded_format->code = imx219_get_embedded_format_code(source_format);
+	embedded_format->width = source_format->width;
+	embedded_format->height = IMX219_EMBEDDED_DATA_HEIGHT;
+	embedded_format->field = V4L2_FIELD_NONE;
+
+	*embedded_source_format = *embedded_format;
+
 	return 0;
 }
 
@@ -1470,6 +1592,8 @@ static int imx219_probe(struct i2c_client *client)
 	imx219->pads[IMX219_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 	imx219->pads[IMX219_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK
 					     | MEDIA_PAD_FL_INTERNAL;
+	imx219->pads[IMX219_PAD_EDATA].flags = MEDIA_PAD_FL_SINK
+					     | MEDIA_PAD_FL_INTERNAL;
 
 	ret = media_entity_pads_init(&imx219->sd.entity,
 				     ARRAY_SIZE(imx219->pads), imx219->pads);
-- 
2.47.3

