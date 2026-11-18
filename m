Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008522;
	b=dm+MOKuiyerF9yWSLi4XB0NgdvGZOgM+2psSHWt2coDSYsrVmvPfRYP5S2B5xHud1vNb
	 MkO+CapGqeYH12t0pPshK6IgJ+EmFvLK+O1JQxDNrdW0A1OsbysR25cewWLeLa44rvwQl
	 S/gw/+BnZqIKoaR69o0X66WfA2I/Z0r7PN/7mRM1Dp3mxIB2Xt2hmXC4higjROP16xWk3
	 jgpQM1wX5ytD3C8NGSxyDJ1lE6rYND3HNfn4M4T/eHJnOZM5bfB+OkTh0hkSQ3Dhzv/C+
	 WZPK8eEwqBn+EbPPirM7PMpthxNO05qPw6tGir3Bo8Cga7sCPq9RAOTxxQ71UCkyMSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008522;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=iruxOlvdE3BrGbI22S7/j7iYMUANeKuKWec0oQ3AV8M=;
	b=gdMj44duSzZbIBGWS7tS2bcXFCKInsGARp1JNu0QFrQ4J9lyQ4D5uYQlDh+Nj7Y4kHnh
	 8S/CvfbRVoAiiKu0j7ATGolnUqWiNWC7TAjJwE4rsvjjn4IZMoy87Y/x+HdECEQJuXYID
	 jo71FhWV8cCkCGRLVTZ3o999se+P1RUkBlo+Y9SKY6c+5EYhgyUY2vGdi3XyTPFca1ODe
	 POyNBLEInMytiys0x5Pmj5h5BRwuGbju2WB177ICSTBq/07cEXs55XzhxNTlyy2Yttkcu
	 1oQZxHeQsVGpyu55uxdlaKrr3BVM8DVBicVJgmom67LwHXtYJY2zgzUJuLNvH5jnZoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FajDSmbI;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9277606A338
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9277606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FajDSmbI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008522; x=1826544522;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M/u/nSMigXXyB0GjiKmdOwv6nLfGRkIyxpUkmR+uURo=;
  b=FajDSmbIJOEGPE3aq6zrhCejjQs9gqv6FLVQIc2BZyPUPN/ukzAdVpmd
   oG+Nhmop6qo+1qd8UOL0XsOB8XxjPSbOHIqh1YfGfYORVOftX2qEY9io8
   wLJGh2aGhh0aBpMr+Dwdo+P/nbmd3CzFpGSBoJzcEA4jKcsLwALmOcix5
   HMJrl6Ry6wYuqfRdp9uA0Tg7M7/pWA1059FsCFQ8o8r2cKRO/KdGASo/s
   db4Y5VdzBi2cUhYl/uarJSfeIms0MItXjfX0BM1Rlmvd7tBSRsDPO4xfy
   ajZBPLbCL7E2FWLefGO2dm88bvdMXs7WrjghsasTxM4p0iudQUTTLallw
   A==;
X-CSE-ConnectionGUID: +q83HsvQTISgthFj6fTvbA==
X-CSE-MsgGUID: P/o07Y4OSNOHKnwFJeW7Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3702742"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3702742"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:39 -0800
X-CSE-ConnectionGUID: WXVqbUwFR2iTy+yXQ0WI4g==
X-CSE-MsgGUID: GL88Xea2TTK2DtHm7/FM1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10678034"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:31 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E8174122B9E;
	Wed, 18 Nov 2026 15:28:20 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tdY-2UUl;
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
Subject: [PATCH v13 59/73] media: imx219: Add image stream
Date: Wed, 18 Nov 2026 15:28:05 +0200
Message-ID: <20261118132819.213473-60-sakari.ailus@linux.intel.com>
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

In preparation for embedded data stream support, introduce a new
imx219_stream_ids enumeration for stream IDs, with a single value,
IMX219_STREAM_IMAGE for the image data stream. Use it when accessing the
formats, crop and compose rectangles on the source pad. This is meant to
reduce the size of further commits, and doesn't introduce any functional
change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 7facb1344e88..3acccb203210 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -363,6 +363,10 @@ enum imx219_pad_ids {
 	IMX219_NUM_PADS,
 };
 
+enum imx219_stream_ids {
+	IMX219_STREAM_IMAGE,
+};
+
 struct imx219 {
 	struct v4l2_subdev sd;
 	struct media_pad pads[IMX219_NUM_PADS];
@@ -433,9 +437,10 @@ static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
 			       u8 *bin_v)
 {
 	const struct v4l2_mbus_framefmt *format =
-		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					      IMX219_STREAM_IMAGE);
 	const struct v4l2_rect *crop =
-		v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE);
+		v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
 	u32 hbin = crop->width / format->width;
 	u32 vbin = crop->height / format->height;
 
@@ -473,7 +478,8 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 	int ret = 0;
 
 	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
-	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					      IMX219_STREAM_IMAGE);
 	rate_factor = imx219_get_rate_factor(state);
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
@@ -700,7 +706,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	u32 bpp;
 	int ret = 0;
 
-	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					      IMX219_STREAM_IMAGE);
 	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
 	bpp = imx219_get_format_bpp(format);
 
@@ -890,7 +897,8 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 	u8 bin_h, bin_v, bin_hv;
 	int ret;
 
-	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					      IMX219_STREAM_IMAGE);
 
 	/*
 	 * Adjust the requested format to match the closest mode. The Bayer
@@ -922,7 +930,7 @@ static int imx219_set_pad_format_compat(struct v4l2_subdev *sd,
 	/* Ensure bin_h and bin_v are same to avoid 1:2 or 2:1 stretching */
 	bin_hv = min(bin_h, bin_v);
 
-	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE);
+	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
 	crop->width = format->width * bin_hv;
 	crop->height = format->height * bin_hv;
 	crop->left = (IMX219_PIXEL_ARRAY_WIDTH - crop->width) / 2;
@@ -1007,7 +1015,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	if (fmt->pad != IMX219_PAD_SOURCE)
 		return v4l2_subdev_get_fmt(sd, state, fmt);
 
-	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					      IMX219_STREAM_IMAGE);
 
 	format->code = fmt->format.code =
 		imx219_get_format_code(imx219, fmt->format.code);
@@ -1091,7 +1100,8 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 	struct v4l2_rect *compose =
 		v4l2_subdev_state_get_compose(state, IMX219_PAD_IMAGE);
 	struct v4l2_mbus_framefmt *source_format =
-		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+		v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					     IMX219_STREAM_IMAGE);
 
 	/* The image pad models the pixel array, and thus has a fixed format. */
 	pixel_array_format->code = MEDIA_BUS_FMT_RAW_10;
-- 
2.47.3

