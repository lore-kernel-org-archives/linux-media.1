Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008523;
	b=CwpzCEDVA88pWC4cIUvtvWYLal7XYoep+w9WTPW7R6dlccZ+pLTLN+DJqkmrgMQoE3j+
	 W4Kk7CvzrCp5bRtXYugXqvQ9elL3ERvp2e/C/PNChYZXm4MstdUW5mYO29VNol+WAsqzM
	 /EenffTSGI5/MiAPIC34nvtIRsx2vzqIYCcFBTQ6Bzf2v+bG3PpXin20gO5sqjcd0LqgP
	 Lfh9dxvWLLcAOulFClnDiLO9bOeSUJ7+lzezR4ugnXjt+3jYEKl4i8ZDgmFnnFe+rmSTQ
	 YKOggnuUAUfSmvkGFm603hnu0FFd0el0jX3cKS5sMu3ELxuS7HnjNquRETxJSSNIYbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008523;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=t4eIgH6ngeVZpw3Jo0T9L+ifOlV00FjDpFMAzKVaIo4=;
	b=AJEqw0q1/JPGVS7hhdQKoxxZhTxVl508ZgC4TCDYu4raercMWulTK7zB93deOCodEcOr
	 BngXgsunrztTf2zoqcnuP6jXO7SKpPp60pJ/BpMEEFp9RNfZFHxcNDci4Rp/ZixWp5afv
	 tXNn09U+bVyNE2C8sl5AE41sezO4y1HqlORXyRR9AhocKLKCYPebCi5rt9W2/IHDnJ4bx
	 mYDDqon8WZi9p79zoEJqb2ZmuFIxtOdyBkR8mFA0GXwPpaigoqpW1brTxKUhtOS8gWITP
	 NHRMQ9t4J3jZr6ZnyvMcqsN7CbilYJbFiIBybpyS7uot7c5uN3x13Qk1B/YmGdFaK0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gVCFTqPf;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C711D606A335
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C711D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gVCFTqPf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008523; x=1826544523;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WvxbVSFrlmWe/7Wfq8QqF5HdrV/2OsOnfSYB6gm9eRU=;
  b=gVCFTqPfo6aqLhhED1cjASq3xYljJv5keoDxLtBaEjZQlq+2uxBYNJt+
   6ZToP9IHTa7t16FTpGLsWEKGtE2nu7RoVCm9+nIyBOvMdgnVBDFKCUCET
   DHGn3rR8hAcmqEJChAoJG8OmEz7649klLr9WeNSq84D3sBOf0Kq+cHzls
   bbWt0Dt/0iBz2IdTkuPQ9InqnrJNB36blmQoQ0Oo535QNI1D10+l3iZUx
   RT+iLoTHtzVXt3ivAEDi6kAYMFp4ImUKreJ14lz00gDSxdCoLCznZUaV1
   V21pyyV8Kf1xiTsYnSeHFMxZQjaYpFXn0GVEWWESvvCJBrXiCiu15h+H0
   Q==;
X-CSE-ConnectionGUID: 67XLD8HcSpaEIF0Pk9DLZw==
X-CSE-MsgGUID: s+ILW+xTQMGjsSSeUIxv7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3702768"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3702768"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:40 -0800
X-CSE-ConnectionGUID: hdbu2FxVS6uu/TVkyMWZ3A==
X-CSE-MsgGUID: fk1o4BQZSK6ENIpKqwNcwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10678042"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:31 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0624C122C1D;
	Wed, 18 Nov 2026 15:28:21 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tdx-2nxL;
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
Subject: [PATCH v13 64/73] media: imx219: Add V4L2_CID_BINNING_FACTORS
Date: Wed, 18 Nov 2026 15:28:10 +0200
Message-ID: <20261118132819.213473-65-sakari.ailus@linux.intel.com>
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

Add support for the V4L2_CID_BINNING_FACTORS control. It'll be read-only
for now.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 92 ++++++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 39 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index e073e34df96b..7b7412da0d60 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -398,6 +398,7 @@ struct imx219 {
 	struct v4l2_ctrl *hflip;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *binning;
 
 	/* Two or Four lanes */
 	u8 lanes;
@@ -471,40 +472,33 @@ imx219_get_embedded_format_code(const struct v4l2_mbus_framefmt *format)
 	}
 }
 
-static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
-			       u8 *bin_v)
-{
-	const struct v4l2_mbus_framefmt *format =
-		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
-					      IMX219_STREAM_IMAGE);
-	const struct v4l2_rect *crop =
-		v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
-	u32 hbin = crop->width / format->width;
-	u32 vbin = crop->height / format->height;
-
-	if (hbin == 2 && vbin == 2) {
-		*bin_h = IMX219_BINNING_X2_ANALOG;
-		*bin_v = IMX219_BINNING_X2_ANALOG;
-	} else {
-		*bin_h = IMX219_BINNING_NONE;
-		*bin_v = IMX219_BINNING_NONE;
-	}
+/* -----------------------------------------------------------------------------
+ * Controls
+ */
 
-}
+enum imx219_binning_factor_indices {
+	IMX219_BINNING_11,
+	IMX219_BINNING_22,
+};
 
-static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state)
-{
-	u8 bin_h, bin_v;
+static const struct {
+	u8 h, v;
+} imx219_binnings[] = {
+	[IMX219_BINNING_11] = { IMX219_BINNING_NONE, IMX219_BINNING_NONE, },
+	[IMX219_BINNING_22] = { IMX219_BINNING_X2_ANALOG, IMX219_BINNING_X2_ANALOG, },
+};
 
-	imx219_get_binning(state, &bin_h, &bin_v);
+static const s64 imx219_binning_factors[] = {
+	[IMX219_BINNING_11] = V4L2_BINNING_FACTORS_MAKE(1, 1, 1, 1),
+	[IMX219_BINNING_22] = V4L2_BINNING_FACTORS_MAKE(2, 1, 2, 1),
+};
 
-	return (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ? 2 : 1;
+static inline u32 imx219_get_rate_factor(struct imx219 *imx219)
+{
+	return imx219_binnings[imx219->binning->val].v ==
+		IMX219_BINNING_X2_ANALOG ? 2 : 1;
 }
 
-/* -----------------------------------------------------------------------------
- * Controls
- */
-
 static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx219 *imx219 =
@@ -518,9 +512,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
 	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
 					      IMX219_STREAM_IMAGE);
-	rate_factor = imx219_get_rate_factor(state);
+	rate_factor = imx219_get_rate_factor(imx219);
 
-	if (ctrl->id == V4L2_CID_VBLANK) {
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK: {
 		int exposure_max, exposure_def;
 
 		/* Update max exposure while meeting expected vblanking */
@@ -534,7 +529,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 					       rate_factor, exposure_def);
 		if (ret)
 			return ret;
-
+		break;
+	}
+	case V4L2_CID_BINNING_FACTORS:
+		return 0;
 	}
 
 	/*
@@ -612,6 +610,9 @@ static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
 	return (imx219->lanes == 2) ? IMX219_PIXEL_RATE : IMX219_PIXEL_RATE_4LANE;
 }
 
+static_assert(ARRAY_SIZE(imx219_binnings) ==
+	      ARRAY_SIZE(imx219_binning_factors));
+
 /* Initialize control handlers */
 static int imx219_init_controls(struct imx219 *imx219)
 {
@@ -714,6 +715,12 @@ static int imx219_init_controls(struct imx219 *imx219)
 	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_CONFIG_MODEL,
 			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR,
 			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR);
+	imx219->binning =
+		v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx219_ctrl_ops,
+				       V4L2_CID_BINNING_FACTORS,
+				       ARRAY_SIZE(imx219_binning_factors) - 1,
+				       IMX219_BINNING_11,
+				       imx219_binning_factors);
 
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
@@ -721,6 +728,8 @@ static int imx219_init_controls(struct imx219 *imx219)
 		goto error;
 	}
 
+	imx219->binning->flags = V4L2_CTRL_FLAG_READ_ONLY;
+
 	ret = v4l2_fwnode_device_parse(&client->dev, &props);
 	if (ret)
 		goto error;
@@ -772,7 +781,6 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 {
 	const struct v4l2_mbus_framefmt *format;
 	const struct v4l2_rect *crop;
-	u8 bin_h, bin_v;
 	u32 bpp;
 	int ret = 0;
 
@@ -790,9 +798,10 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
 		  crop->top - IMX219_ACTIVE_AREA_TOP + crop->height - 1, &ret);
 
-	imx219_get_binning(state, &bin_h, &bin_v);
-	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
-	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H,
+		  imx219_binnings[imx219->binning->val].h, &ret);
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V,
+		  imx219_binnings[imx219->binning->val].v, &ret);
 
 	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
 		  format->width, &ret);
@@ -1083,12 +1092,16 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 		IMX219_ACTIVE_AREA_TOP;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		int rate_factor = imx219_get_rate_factor(state);
 		int exposure_max;
 		int exposure_def;
 		int llp_min;
 		int pixel_rate;
 
+		ret = __v4l2_ctrl_s_ctrl(imx219->binning, bin_hv == 1 ?
+					 IMX219_BINNING_11 : IMX219_BINNING_22);
+		if (ret)
+			return ret;
+
 		/* Update limits and set FPS to default */
 		ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
 					       IMX219_FLL_MAX - mode->height,
@@ -1103,6 +1116,7 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 			return ret;
 
 		/* Update max exposure while meeting expected vblanking */
+		int rate_factor = imx219_get_rate_factor(imx219);
 		exposure_max = mode->fll_def -
 			IMX219_EXPOSURE_OFFSET * rate_factor;
 		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
@@ -1120,9 +1134,9 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 		 * operates on two lines together. So we switch to a higher
 		 * minimum of 3560.
 		 */
-		imx219_get_binning(state, &bin_h, &bin_v);
-		llp_min = (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ?
-				  IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
+		llp_min = imx219_binnings[imx219->binning->val].h ==
+			IMX219_BINNING_X2_ANALOG ?
+			IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
 		ret = __v4l2_ctrl_modify_range(imx219->hblank,
 					       llp_min - mode->width,
 					       IMX219_LLP_MAX - mode->width,
-- 
2.47.3

