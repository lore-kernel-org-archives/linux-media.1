Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008530;
	b=XZfa2PaWGjC2uFAMDXtkHYzLIuXYwbDjkeBShbJlo8/UkWKwYmX+b5j7vgFVVQWULPHv
	 9geqKTY3Kc7X8tvt0nXF+XiovevA/vPgUMyFlOsL17kXvYhQGZqrB/EChoj/VXeh8UqIB
	 B4tTvASDURyJMDAi/QVgxjTor95EXAQj3E+4HdntQn4AMZsvl4fRWWSU2zYsmWul8HjVA
	 iEqG/OvVVHRR5wJo6P0G2gmg0jFjZYwwzqP2iuvWma4Pj81rcSiK8xo4gUKiZ9MoYkPS+
	 UPKywM15xkCD2/ASXUIwFeM8BNeq98ZoI5Hqp0vhPUvFiXQ72vzbkCDMXov3ADlxOMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008530;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=hxDG1Vtlr4M5y2iZzgJGvUdqprtN5Oq+EXLsBNDY/AQ=;
	b=xE8oO7vfnSXfyp7wXouf34Lp5VMMqMZcu3T0MYT/g53g5JWNcefU9EmRqk3p581l386O
	 6zLDWsDGj8ukk7htmkWh52Rj7YNdyCU0fAB4OMZHBMi/VQ6Fc3ddKeSXP7Pb+yR7DCY+T
	 QxeTRjKFVC5iP/BMtU9RL0AOGjDEPwwEj+rNLbGxmgUOBVWoBGnTq+Qeg8TJBoe/3SBbZ
	 HObCQdbunTlc3qgz2Yb+qruGz6UJgXoVPZsf0kb6tcbmS6/sslJl1Ip6OJdLqQ5jvnhil
	 UjcVuEC+Fa3pf6FSLcHlzxVl5yzpmd2rNU+fVQGdOVd2tUGrqIE28xF+wcW1mY+oMwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nAobJnhA;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDD4606A33E
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADDD4606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nAobJnhA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008530; x=1826544530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hmWSTrsyFHEu/9Ruc+g4ffbKLICNWhmHjlPG51AkuQU=;
  b=nAobJnhAEzKWdT12KVPYWRbVNC+wO0pSwnnJTBDq5QyaY6x9OeRpONu6
   0XRGeJbIgocV19KywFjHStNEprSKuWdlIKMwzvzqyAun/Ho8n3e+HrYuw
   jZUP11myxDQ8zgAvnZkYg/D6iWgws59wz+eTBzoBYwNZPMh0K3My7rVGP
   npYdAHxiyBiInXkaM9J/jcpCiZyJequDX1fKEkslDJgNnR5x/KEiVutbF
   N0zpyULSUMGIYAWkgRsc7RTaYcbeUeH0+4Fc+fWSfmuE+MoLv+bEk+Gnk
   swAqmL39dGKBzfJ62f/3UoYNoYZMV+faVc+3Al5FbpdUvWEHEp9pvlDXD
   w==;
X-CSE-ConnectionGUID: I3AUqzDpQ+2WTS6SRGUfbw==
X-CSE-MsgGUID: l7dxN4wIQ8+X7PMTBVelnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738818"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738818"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:47 -0800
X-CSE-ConnectionGUID: 8B9I1Um/SIuYMH927r1o8Q==
X-CSE-MsgGUID: 2fT3gD/XQhS14Xuhqn4YjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076060"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:40 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0DA35122C4F;
	Wed, 18 Nov 2026 15:28:21 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000te7-2wCi;
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
Subject: [PATCH v13 66/73] media: imx219: Support LINE_LENGTH_PIXELS and FRAME_LENGTH_LINES controls
Date: Wed, 18 Nov 2026 15:28:12 +0200
Message-ID: <20261118132819.213473-67-sakari.ailus@linux.intel.com>
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

Support V4L2_CID_LINE_LENGTH_PIXELS and V4L2_CID_FRAME_LENGTH_LINES
controls. These two controls provide direct access to sensor's line and
frame lengths, without requiring a reference crop rectangle.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c  | 171 +++++++++++++++++++++++-------------
 include/media/v4l2-common.h |   3 +
 2 files changed, 112 insertions(+), 62 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 0b0fbc082e18..bb3682be1c9f 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -399,12 +399,17 @@ struct imx219 {
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *vflip;
 	struct v4l2_ctrl *hflip;
+	struct v4l2_ctrl *fll;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *llp;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *binning;
 
 	/* Two or Four lanes */
 	u8 lanes;
+
+	/* For handling frame timing dependencies. */
+	bool setting_ctrl;
 };
 
 static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
@@ -486,9 +491,10 @@ enum imx219_binning_factor_indices {
 
 static const struct {
 	u8 h, v;
+	u16 llp_min;
 } imx219_binnings[] = {
-	[IMX219_BINNING_11] = { IMX219_BINNING_NONE, IMX219_BINNING_NONE, },
-	[IMX219_BINNING_22] = { IMX219_BINNING_X2_ANALOG, IMX219_BINNING_X2_ANALOG, },
+	[IMX219_BINNING_11] = { IMX219_BINNING_NONE, IMX219_BINNING_NONE, IMX219_LLP_MIN, },
+	[IMX219_BINNING_22] = { IMX219_BINNING_X2_ANALOG, IMX219_BINNING_X2_ANALOG, IMX219_BINNED_LLP_MIN, },
 };
 
 static const s64 imx219_binning_factors[] = {
@@ -502,8 +508,10 @@ static inline u32 imx219_get_rate_factor(struct imx219 *imx219)
 		IMX219_BINNING_X2_ANALOG ? 2 : 1;
 }
 
-static void imx219_apply_binning(struct v4l2_subdev_state *state,
-				 struct v4l2_rect *crop, unsigned int index)
+static int imx219_apply_binning(struct imx219 *imx219,
+				struct v4l2_subdev_state *state,
+				struct v4l2_rect *crop, int rate_factor,
+				unsigned int index)
 {
 	struct v4l2_rect *compose =
 		v4l2_subdev_state_get_compose(state, IMX219_PAD_IMAGE);
@@ -514,6 +522,7 @@ static void imx219_apply_binning(struct v4l2_subdev_state *state,
 		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
 					     IMX219_STREAM_EDATA);
 	s64 binning = imx219_binning_factors[index];
+	int ret;
 
 	crop->width = clamp(crop->width, IMX219_OUTPUT_X_SIZE_MIN *
 			    V4L2_BINNING_FACTORS_HNUM(binning),
@@ -539,6 +548,33 @@ static void imx219_apply_binning(struct v4l2_subdev_state *state,
 
 	embedded_format->width =
 		embedded_source_format->width = source_format->width;
+
+	int fll_min = IMX219_VBLANK_MIN + source_format->height;
+	ret = __v4l2_ctrl_modify_range(imx219->fll, fll_min, IMX219_FLL_MAX,
+				       rate_factor, fll_min);
+	if (ret)
+		return ret;
+
+	int vblank_min = IMX219_VBLANK_MIN;
+	ret = __v4l2_ctrl_modify_range(imx219->vblank,
+				       vblank_min,
+				       IMX219_FLL_MAX - source_format->height,
+				       rate_factor, vblank_min);
+	if (ret)
+		return ret;
+
+	int llp_min = imx219_binnings[index].llp_min;
+	ret = __v4l2_ctrl_modify_range(imx219->llp, llp_min, IMX219_LLP_MAX,
+				       IMX219_LLP_STEP, llp_min);
+	if (ret)
+		return ret;
+
+	return __v4l2_ctrl_modify_range(imx219->hblank,
+					llp_min - (int)source_format->width,
+					IMX219_LLP_MAX -
+					(int)source_format->width,
+					IMX219_LLP_STEP,
+					llp_min - (int)source_format->width);
 }
 
 static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
@@ -557,35 +593,27 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 	rate_factor = imx219_get_rate_factor(imx219);
 
 	switch (ctrl->id) {
-	case V4L2_CID_VBLANK: {
-		int exposure_max, exposure_def;
-
-		/* Update max exposure while meeting expected vblanking */
-		exposure_max = format->height + ctrl->val -
-			IMX219_EXPOSURE_OFFSET * rate_factor;
-		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
-				exposure_max : IMX219_EXPOSURE_DEFAULT;
-		ret = __v4l2_ctrl_modify_range(imx219->exposure,
-					       imx219->exposure->minimum,
-					       exposure_max,
-					       rate_factor, exposure_def);
+	case V4L2_CID_FRAME_LENGTH_LINES:
+	case V4L2_CID_VBLANK:
+	case V4L2_CID_LINE_LENGTH_PIXELS:
+	case V4L2_CID_HBLANK:
+		ret = v4l2_sensor_fll_llp_set(imx219->fll, imx219->vblank,
+					      imx219->llp, imx219->hblank,
+					      imx219->exposure, format, ctrl,
+					      &imx219->setting_ctrl,
+					      IMX219_EXPOSURE_OFFSET *
+					      rate_factor);
 		if (ret)
 			return ret;
 		break;
-	}
 	case V4L2_CID_BINNING_FACTORS: {
 		struct v4l2_rect *crop =
 			v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
 
-		cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H,
-			  imx219_binnings[ctrl->val].h, &ret);
-		cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V,
-			  imx219_binnings[ctrl->val].v, &ret);
-
-		if (ctrl->val != ctrl->cur.val)
-			imx219_apply_binning(state, crop, ctrl->val);
-
-		return 0;
+		ret = imx219_apply_binning(imx219, state, crop, rate_factor,
+					   ctrl->val);
+		if (ret)
+			return ret;
 	}
 	}
 
@@ -618,13 +646,22 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(imx219->regmap, IMX219_REG_ORIENTATION,
 			  imx219->hflip->val | imx219->vflip->val << 1, &ret);
 		break;
-	case V4L2_CID_VBLANK:
+	case V4L2_CID_FRAME_LENGTH_LINES:
 		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
-			  (format->height + ctrl->val) / rate_factor, &ret);
+			  ctrl->val / rate_factor, &ret);
 		break;
+	case V4L2_CID_LINE_LENGTH_PIXELS:
+		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A, ctrl->val,
+			  &ret);
+		break;
+	case V4L2_CID_VBLANK:
 	case V4L2_CID_HBLANK:
-		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
-			  format->width + ctrl->val, &ret);
+		break;
+	case V4L2_CID_BINNING_FACTORS:
+		cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H,
+			  imx219_binnings[ctrl->val].h, &ret);
+		cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V,
+			  imx219_binnings[ctrl->val].v, &ret);
 		break;
 	case V4L2_CID_TEST_PATTERN_RED:
 		cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
@@ -699,10 +736,19 @@ static int imx219_init_controls(struct imx219 *imx219)
 		imx219->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* Initial blanking and exposure. Limits are updated during set_fmt */
+	imx219->fll = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
+					V4L2_CID_FRAME_LENGTH_LINES,
+					IMX219_ACTIVE_AREA_HEIGHT +
+					IMX219_VBLANK_MIN, IMX219_FLL_MAX, 1,
+					mode->fll_def);
 	imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
 					   V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
 					   IMX219_FLL_MAX - mode->height, 1,
 					   mode->fll_def - mode->height);
+	imx219->llp = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
+					V4L2_CID_LINE_LENGTH_PIXELS,
+					IMX219_LLP_MIN, IMX219_LLP_MAX, 1,
+					IMX219_LLP_MIN);
 	imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
 					   V4L2_CID_HBLANK,
 					   IMX219_LLP_MIN - mode->width,
@@ -782,6 +828,11 @@ static int imx219_init_controls(struct imx219 *imx219)
 		goto error;
 	}
 
+	imx219->fll->flags |= V4L2_CTRL_FLAG_UPDATE;
+	imx219->vblank->flags |= V4L2_CTRL_FLAG_UPDATE;
+	imx219->llp->flags |= V4L2_CTRL_FLAG_UPDATE;
+	imx219->hblank->flags |= V4L2_CTRL_FLAG_UPDATE;
+
 	ret = v4l2_fwnode_device_parse(&client->dev, &props);
 	if (ret)
 		goto error;
@@ -1141,39 +1192,39 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 		IMX219_ACTIVE_AREA_TOP;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		int exposure_max;
-		int exposure_def;
-		int llp_min;
+		unsigned int binning = bin_hv == 1 ?
+			IMX219_BINNING_11 : IMX219_BINNING_22;
 		int pixel_rate;
 
-		ret = __v4l2_ctrl_s_ctrl(imx219->binning, bin_hv == 1 ?
-					 IMX219_BINNING_11 : IMX219_BINNING_22);
+		ret = __v4l2_ctrl_s_ctrl(imx219->binning, binning);
+		if (ret)
+			return ret;
+
+		int rate_factor = imx219_get_rate_factor(imx219);
+		ret = imx219_apply_binning(imx219, state, crop, rate_factor,
+					   binning);
 		if (ret)
 			return ret;
 
 		/* Update limits and set FPS to default */
-		ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
-					       IMX219_FLL_MAX - mode->height,
+		ret = __v4l2_ctrl_modify_range(imx219->vblank,
+					       imx219->vblank->minimum,
+					       imx219->vblank->maximum,
 					       rate_factor,
 					       mode->fll_def - mode->height);
 		if (ret)
 			return ret;
 
-		ret = __v4l2_ctrl_s_ctrl(imx219->vblank,
-					 mode->fll_def - mode->height);
+		ret = __v4l2_ctrl_modify_range(imx219->fll,
+					       imx219->fll->minimum,
+					       imx219->fll->maximum,
+					       rate_factor,
+					       mode->fll_def);
 		if (ret)
 			return ret;
 
-		/* Update max exposure while meeting expected vblanking */
-		int rate_factor = imx219_get_rate_factor(imx219);
-		exposure_max = mode->fll_def -
-			IMX219_EXPOSURE_OFFSET * rate_factor;
-		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
-				exposure_max : IMX219_EXPOSURE_DEFAULT;
-		ret = __v4l2_ctrl_modify_range(imx219->exposure,
-					       imx219->exposure->minimum,
-					       exposure_max,
-					       rate_factor, exposure_def);
+		ret = __v4l2_ctrl_s_ctrl(imx219->vblank,
+					 mode->fll_def - mode->height);
 		if (ret)
 			return ret;
 
@@ -1183,18 +1234,9 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 		 * operates on two lines together. So we switch to a higher
 		 * minimum of 3560.
 		 */
-		llp_min = imx219_binnings[imx219->binning->val].h ==
-			IMX219_BINNING_X2_ANALOG ?
-			IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
-		ret = __v4l2_ctrl_modify_range(imx219->hblank,
-					       llp_min - mode->width,
-					       IMX219_LLP_MAX - mode->width,
-					       IMX219_LLP_STEP,
-					       llp_min - mode->width);
-		if (ret)
-			return ret;
-
-		ret = __v4l2_ctrl_s_ctrl(imx219->hblank, llp_min - mode->width);
+		ret = __v4l2_ctrl_s_ctrl(imx219->hblank,
+					 imx219_binnings[binning].llp_min -
+					 mode->width);
 		if (ret)
 			return ret;
 
@@ -1322,8 +1364,13 @@ static int imx219_set_selection(struct v4l2_subdev *sd,
 		struct imx219 *imx219 = to_imx219(sd);
 		struct v4l2_rect *crop =
 			v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
+		int ret;
 
-		imx219_apply_binning(state, &sel->r, imx219->binning->val);
+		ret = imx219_apply_binning(imx219, state, &sel->r,
+					   imx219_get_rate_factor(imx219),
+					   imx219->binning->val);
+		if (ret)
+			return ret;
 
 		*crop = sel->r;
 
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index d29575a9f137..bd244c00d91a 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -17,6 +17,9 @@
 #include <linux/time.h>
 #include <media/v4l2-dev.h>
 
+struct v4l2_ctrl;
+struct v4l2_mbus_framefmt;
+
 /* Common printk constructs for v4l-i2c drivers. These macros create a unique
    prefix consisting of the driver name, the adapter number and the i2c
    address. */
-- 
2.47.3

