Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB7E3D75DA
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662804; cv=none; b=L8/DqYTIjubHMwLjtd/1MFIX0LF+ee4citbESxa7XfLDf43w9wZX0Jkyq8BDLmCpzOQL4T47tKtWs6jHjDgFjAWkjA0VrIQBkuqZ3iXkoAxX4BwYaod3mAGyTpF9tXjj5lEfm/ds33F8nsU7a8xKl2L4xJTyGFPDMEZQWsLkP+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662804; c=relaxed/simple;
	bh=pYFozUXBhOHY2SCGb7DsIAqay6Mv9Li+qN0aPfoeNO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LzfECski1bk3AGfrz8aiqggucLFxWIKlFoOmSKdq5bAt8LRVmOoN5aAOewGJu+o3bj+wFniwe9XZTXnDFdTA+PTUMKd9DRJCZ66ieWSgpgJM8QApOwcnhmP0AporU4En/bDroPtS3QqLdjRZfihauSjN0/1ugndasf3Q7QNPyHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jc1si2Y3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jc1si2Y3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662799; x=1807198799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pYFozUXBhOHY2SCGb7DsIAqay6Mv9Li+qN0aPfoeNO8=;
  b=Jc1si2Y30FR+01mG+EpjYW3QX180F8lIlcJCFqKjlHQKvIS90IaEdQ04
   3QdMlGmS2gAw2omW7ccrzV/bzIzZot3t6zj6/qIOkOryEnBhpX0T1wevL
   0H/zlkmYL0IY95KTUAVdfMeBvHHihSuAggLh3Ps6eu/R2PVCRoQRwP2/P
   fYX7n8AAVoCdcVKZF7K5v8Lj/n5DMmKywAnc8HHoglNZX9d+iVPowKm5d
   Rpn8WXCB7NqZ2jFD4N1fjQJKaNXq0BZiJLJFdvvewXxeuG6dP4G81rpem
   ZnyWGj5NNeFDS8mU1utb7m5qI1j63qB0iV4iZXBqeC88DGKdcPCPRcfsB
   g==;
X-CSE-ConnectionGUID: 2ksu7he5SaqOk4FtlL3hOQ==
X-CSE-MsgGUID: La+JSxmCQXWYA7iuIzKYtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038337"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038337"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:53 -0700
X-CSE-ConnectionGUID: 6ReD4yWrQka0pXDQqtuHWA==
X-CSE-MsgGUID: 4ro9JN7mTJmrrF85R63lKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740280"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D4C60121DD9;
	Wed, 08 Apr 2026 18:39:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044Cc-1GP0;
	Wed, 08 Apr 2026 18:39:39 +0300
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
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
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
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v4 05/29] media: imx219: Fix vertical blanking and exposure for analogue binning
Date: Wed,  8 Apr 2026 18:39:14 +0300
Message-ID: <20260408153939.969381-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When vertical analogue binning is in use, the minimum frame length in
lines decreases to around half of the normal. In relation to the sensor's
output size this means vertical blanking can be negative but that's not an
issue as control values are signed. Remove the workaround for this
non-issue that doubled the pixel rate, frame length in lines and exposure
time.

The resulting change also fixes the minimum, the maximum and the step
values for the control.

Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 6819a2fa3262..a72630ad1561 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -420,15 +420,6 @@ static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
 
 }
 
-static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state)
-{
-	u8 bin_h, bin_v;
-
-	imx219_get_binning(state, &bin_h, &bin_v);
-
-	return (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ? 2 : 1;
-}
-
 /* -----------------------------------------------------------------------------
  * Controls
  */
@@ -440,12 +431,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
 	const struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	u32 rate_factor;
 	int ret = 0;
 
 	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
 	format = v4l2_subdev_state_get_format(state, 0);
-	rate_factor = imx219_get_rate_factor(state);
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
@@ -478,7 +467,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE:
 		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
-			  ctrl->val / rate_factor, &ret);
+			  ctrl->val, &ret);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
 		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
@@ -495,7 +484,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_VBLANK:
 		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
-			  (format->height + ctrl->val) / rate_factor, &ret);
+			  format->height + ctrl->val, &ret);
 		break;
 	case V4L2_CID_HBLANK:
 		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
@@ -878,7 +867,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		unsigned int rate_factor = imx219_get_rate_factor(state);
 		int exposure_max;
 		int exposure_def;
 		int llp_min;
@@ -886,15 +874,16 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 
 		/* Update limits and set FPS to default */
 		ret = __v4l2_ctrl_modify_range(imx219->vblank,
-					       IMX219_VBLANK_MIN * rate_factor,
-					       (IMX219_FLL_MAX - mode->height) *
-					       rate_factor, rate_factor,
-					       mode->fll_def - mode->height);
+					       (int)(mode->height / binning),
+					       IMX219_FLL_MAX - mode->height, 1,
+					       (int)(mode->fll_def / binning) -
+					       (int)mode->height);
 		if (ret)
 			return ret;
 
 		ret = __v4l2_ctrl_s_ctrl(imx219->vblank,
-					 mode->fll_def - mode->height);
+					 (int)(mode->fll_def / binning) -
+					 (int)mode->height);
 		if (ret)
 			return ret;
 
@@ -931,7 +920,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 			return ret;
 
 		/* Scale the pixel rate based on the mode specific factor */
-		pixel_rate = imx219_get_pixel_rate(imx219) * rate_factor;
+		pixel_rate = imx219_get_pixel_rate(imx219);
 		ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
 					       pixel_rate, 1, pixel_rate);
 		if (ret)
-- 
2.47.3

