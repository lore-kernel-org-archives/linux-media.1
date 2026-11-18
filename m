Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008530;
	b=TpOS1X0dicGiWArpnCnx6mbQMUQqhbLcp5Nfd0yQiO038NI+mBva8clfgBFtX5SPdZ0W
	 tIuR7d/NxE7MN/0oQrJaf+jGUh4uj5XzyFVxP25RT+/F2zUTTRQxpFp4pchOGKZ9F0CrP
	 jJ2BFJG4Nz7kose0ifVbs1O5konOO0tbnqSmzgwPB+44y8hOakbQzqS0CUkUPv7JskT9T
	 qOKhtIwdCpywUjg47SHVDjBhNYH4Fr/B5gNpgmXbW0SXSXPu7pLdOeUA7gFdxJQkfno+6
	 ZJ6cfRsDAuRoO9Ce1v75FubDejJtEFtgWUcXtjC2RfDWZk0IDPNy0RpkKqXP4D8VxfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008530;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=TIZ5NvfZJrkJLlQxj1r0u5RWXRQYSJS4vJWZhTPi6pk=;
	b=szqU7UgAjh67U+O3dl/24oBDKQ3FMeh/Uzf+liRdGYAai0qnSFgt80Y5lA9tTb+V/6tr
	 A3PxUkmlOeryxVs1HKB/IIwRRtkhGOzRm/H8wUDy/XzWl8do8yJ97O81Iuy1SuoboQLv/
	 FsDk8j2qRf7VTI5sL2O/hybFctB1HoaV3B1WUnkzauIfDKUOnGhbBovZFdlmkksReFlIE
	 iHGNOd+/1mmFQMU1k87LLRFT9sN9Qvp4LBEM0OVNLkotg2UF0GuMXVsIF5xlV/TNSESuG
	 DsHoqhoDP6x9rQVVVxs/v8NwRsrDa8oW+xAKRMcz/NEHTRNPIS0mqcFkmkv5hDudB+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OWyINIrB;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60485606A33F
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60485606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OWyINIrB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008530; x=1826544530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wxd/ggH1pfTRA6CK36PbWmXgO/S8UbuBByS79ZYNuS0=;
  b=OWyINIrB+HKHzGi5YE8NKJokOlJs0P2kXKE1/X5jzkB14vqrAqcWMLZA
   fuwgDf1LCUJFwHEiCFVfLGo5Vwy2bSEvGTZYlJealiFwyOHsGtoFVNAin
   IXBgS+ZJaDWZy6fvKyvlISKtht0z+JxPJTLC53GBjApHzYdnvtQrPJVCZ
   qwsslvF13t1mLYPtEJuPCZdCNrZKvnSi1dxuGcv/BPNwHLML42ckGLNJv
   ycr+uvE34yVzRcOPLEjEqstUAltDQpH5YZj18Zr2Zbp/5+d180UXPETR/
   PAaxXp+GKp0EB79ukru+Rhqk0t5g8MqC7uxQjctzudhN+QEmmHkjR4fxD
   g==;
X-CSE-ConnectionGUID: 8DseXrL6RJm6cyTPrT6t7w==
X-CSE-MsgGUID: WcUl9wbtSNOLIxtsbxmiJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738852"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738852"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:47 -0800
X-CSE-ConnectionGUID: RbStNC3dS9mt18N9daJhrQ==
X-CSE-MsgGUID: ecNa+g3vSDaUTQQAL8UagQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076065"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:40 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0A8A0122C1F;
	Wed, 18 Nov 2026 15:28:21 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000te2-2s3U;
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
Subject: [PATCH v13 65/73] media: imx219: Allow configuring cropping and binning through CRSM
Date: Wed, 18 Nov 2026 15:28:11 +0200
Message-ID: <20261118132819.213473-66-sakari.ailus@linux.intel.com>
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

Enable the configuration of cropping and binning through the Common Raw
Sensor Model. Also change the minimum embedded data line length the same
as that of the output pixel data line.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 103 +++++++++++++++++++++++++++++++++----
 1 file changed, 94 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 7b7412da0d60..0b0fbc082e18 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -160,6 +160,9 @@
 #define IMX219_PIXEL_ARRAY_HEIGHT	2480U
 #define IMX219_NATIVE_FORMAT		MEDIA_BUS_FMT_SRGGB10_1X10
 
+#define IMX219_OUTPUT_X_SIZE_MIN	0x100
+#define IMX219_OUTPUT_Y_SIZE_MIN	0x100
+
 /* Embedded metadata stream height */
 #define IMX219_EMBEDDED_DATA_HEIGHT	2U
 
@@ -499,6 +502,45 @@ static inline u32 imx219_get_rate_factor(struct imx219 *imx219)
 		IMX219_BINNING_X2_ANALOG ? 2 : 1;
 }
 
+static void imx219_apply_binning(struct v4l2_subdev_state *state,
+				 struct v4l2_rect *crop, unsigned int index)
+{
+	struct v4l2_rect *compose =
+		v4l2_subdev_state_get_compose(state, IMX219_PAD_IMAGE);
+	struct v4l2_mbus_framefmt *source_format =
+		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					     IMX219_STREAM_IMAGE);
+	struct v4l2_mbus_framefmt *embedded_source_format =
+		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					     IMX219_STREAM_EDATA);
+	s64 binning = imx219_binning_factors[index];
+
+	crop->width = clamp(crop->width, IMX219_OUTPUT_X_SIZE_MIN *
+			    V4L2_BINNING_FACTORS_HNUM(binning),
+			    IMX219_ACTIVE_AREA_WIDTH) & ~1;
+	crop->height = clamp(crop->height, IMX219_OUTPUT_Y_SIZE_MIN *
+			     V4L2_BINNING_FACTORS_VNUM(binning),
+			     IMX219_ACTIVE_AREA_HEIGHT) & ~1;
+	crop->left = clamp((unsigned int)crop->left, IMX219_ACTIVE_AREA_LEFT,
+			   IMX219_ACTIVE_AREA_LEFT + IMX219_ACTIVE_AREA_WIDTH -
+			   crop->width);
+	crop->top = clamp((unsigned int)crop->top, IMX219_ACTIVE_AREA_TOP,
+			  IMX219_ACTIVE_AREA_TOP + IMX219_ACTIVE_AREA_HEIGHT -
+			  crop->height);
+
+	compose->width = crop->width / V4L2_BINNING_FACTORS_HNUM(binning);
+	compose->height = crop->height / V4L2_BINNING_FACTORS_VNUM(binning);
+
+	source_format->width = compose->width;
+	source_format->height = compose->height;
+
+	struct v4l2_mbus_framefmt *embedded_format =
+		v4l2_subdev_state_get_format(state, IMX219_PAD_EDATA);
+
+	embedded_format->width =
+		embedded_source_format->width = source_format->width;
+}
+
 static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx219 *imx219 =
@@ -531,9 +573,21 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 			return ret;
 		break;
 	}
-	case V4L2_CID_BINNING_FACTORS:
+	case V4L2_CID_BINNING_FACTORS: {
+		struct v4l2_rect *crop =
+			v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
+
+		cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H,
+			  imx219_binnings[ctrl->val].h, &ret);
+		cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V,
+			  imx219_binnings[ctrl->val].v, &ret);
+
+		if (ctrl->val != ctrl->cur.val)
+			imx219_apply_binning(state, crop, ctrl->val);
+
 		return 0;
 	}
+	}
 
 	/*
 	 * Applying V4L2 control value only happens
@@ -728,8 +782,6 @@ static int imx219_init_controls(struct imx219 *imx219)
 		goto error;
 	}
 
-	imx219->binning->flags = V4L2_CTRL_FLAG_READ_ONLY;
-
 	ret = v4l2_fwnode_device_parse(&client->dev, &props);
 	if (ret)
 		goto error;
@@ -798,11 +850,6 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
 		  crop->top - IMX219_ACTIVE_AREA_TOP + crop->height - 1, &ret);
 
-	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H,
-		  imx219_binnings[imx219->binning->val].h, &ret);
-	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V,
-		  imx219_binnings[imx219->binning->val].v, &ret);
-
 	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
 		  format->width, &ret);
 	cci_write(imx219->regmap, IMX219_REG_Y_OUTPUT_SIZE,
@@ -881,6 +928,7 @@ static int imx219_enable_streams(struct v4l2_subdev *sd,
 	/* vflip and hflip cannot change during streaming */
 	__v4l2_ctrl_grab(imx219->vflip, true);
 	__v4l2_ctrl_grab(imx219->hflip, true);
+	__v4l2_ctrl_grab(imx219->binning, true);
 
 	return 0;
 
@@ -908,6 +956,7 @@ static int imx219_disable_streams(struct v4l2_subdev *sd,
 
 	__v4l2_ctrl_grab(imx219->vflip, false);
 	__v4l2_ctrl_grab(imx219->hflip, false);
+	__v4l2_ctrl_grab(imx219->binning, false);
 
 	pm_runtime_put_autosuspend(&client->dev);
 
@@ -995,7 +1044,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 		if (fse->code != MEDIA_BUS_FMT_META_8 || fse->index > 0)
 			return -EINVAL;
 
-		fse->min_width = IMX219_ACTIVE_AREA_WIDTH;
+		fse->min_width = IMX219_OUTPUT_X_SIZE_MIN;
 		fse->max_width = IMX219_ACTIVE_AREA_WIDTH;
 		fse->min_height = IMX219_EMBEDDED_DATA_HEIGHT;
 		fse->max_height = IMX219_EMBEDDED_DATA_HEIGHT;
@@ -1253,6 +1302,41 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 	}
 }
 
+static int imx219_set_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	if (!(ci && ci->caps & V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR))
+		return -EINVAL;
+
+	/*
+	 * The embedded data stream doesn't support selection rectangles,
+	 * neither on the embedded data pad nor on the source pad.
+	 */
+	if (sel->pad != IMX219_PAD_IMAGE || sel->stream != IMX219_STREAM_IMAGE)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP: {
+		struct imx219 *imx219 = to_imx219(sd);
+		struct v4l2_rect *crop =
+			v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
+
+		imx219_apply_binning(state, &sel->r, imx219->binning->val);
+
+		*crop = sel->r;
+
+		return 0;
+	}
+	case V4L2_SEL_TGT_COMPOSE:
+		sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				 struct v4l2_mbus_frame_desc *fd)
 {
@@ -1377,6 +1461,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
+	.set_selection = imx219_set_selection,
 	.enum_frame_size = imx219_enum_frame_size,
 	.get_frame_desc = imx219_get_frame_desc,
 	.enable_streams = imx219_enable_streams,
-- 
2.47.3

