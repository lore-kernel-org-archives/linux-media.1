Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008512;
	b=VDsx5fY3i98H2kOaA/l1RLcctlDb/MMNCe6FvvEqzwGCQKAy5PuYIjuoXcTyTZhC8vER
	 9KKzTVfRgBmTHtf077twB1oSU/qIVwIX58pA7zlZgO5Abng9F5VrM4pr/AflfrBUqsN4P
	 ZN9sVrFZdhmjEQKRwqYqpPa2Yah4A4quY+dLKfKmTe8uCeGLRsb6tuUGfygpUUmuG7YYS
	 prx2vNyLLlB+diByTMbCoy8rHYUlbtuhhNLHbpdXjS/k2nr96nPpOse8nxkjbeottkHdj
	 T7Xg1HWNnNGKHK/0D0qfcVS6SjWbaK5YmndQYHJU418OZdI7Ge7mTF0nxqqy55xETzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008512;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=GivGzC8M0LvT1xs+cK4jTgOuw3MXn3D1GtklTQ54RfY=;
	b=43buoOHOFrFPWDmw+8MmlN7Dizb8wo9YO+1yaVJxlYNREJgjwERYKL4g9t5jI2OepkRD
	 Gz5EuJB/F2rg5DNEWAHkAHN38GxTtxeFvywENsT29MvyvBULQoMI5aPiGHZygJtmpkVyB
	 AGxvtnayB5rXZjcUxszqau3UYJdLexF+FEenw0Z6EXmia1MjZmOuwd5i8o8hTcvzDItuV
	 uEMT45QUj16zmmwYRxYb1ITRD3Ycirpqn1V9KLL08Z0QzciyIHOQfw1R0hWb8fAheWHiL
	 +jdsCuS9UM8sDGpjzr3eWShQIY2/dNNNtf6+HFrNpo3pbV09y2mySGIKqob73BXDRkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DNBM4cZq;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41063606A32F
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41063606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DNBM4cZq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008512; x=1826544512;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NpyFTdElazDhJo9oqNbLr3nQydbLBOjnlQALrYS+pLc=;
  b=DNBM4cZqpYodycUESkCB1WRV0dgi/iSSuBk4z0SGjwk/SDZDq0u5f6jG
   mZrBA46G7V7iUpo7yX1C//YFhi/0/121+F0YDhAlPvFQ4CGfmFBFwes0f
   l8eBFPcJPNQqtIZKAnoVhl/B3P0erb71UvRUFrV43W5JEF675n5cSdLpj
   jDZbStAxgRInuc00+a7UEZFIHG6c78y16N9msXpvw5PNnxrvJaZnarobZ
   KBvCf1Dj+eekC4YVTAXKyD/hYkjlMzZUTtVKQeTzKEjYH6sLcPswe8kVj
   Vu5sjq97ggheVbMZdIxfZNTc8JQSCHubRu8oxsgjDI3dKEGqHMhgRmwPS
   Q==;
X-CSE-ConnectionGUID: 5zIea2aMQ+CjcVhTxqKUUw==
X-CSE-MsgGUID: kH+pBwBmQ5umxhsey4nl4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3702603"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3702603"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:31 -0800
X-CSE-ConnectionGUID: qLKSm0QIQbuumt67HYHgRA==
X-CSE-MsgGUID: l885gF+BSXuV/yEniweryQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10678002"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:23 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CDE11121C9E;
	Wed, 18 Nov 2026 15:28:20 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tcz-22YZ;
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
Subject: [PATCH v13 52/73] media: ov2740: Add support for generic raw formats
Date: Wed, 18 Nov 2026 15:27:58 +0200
Message-ID: <20261118132819.213473-53-sakari.ailus@linux.intel.com>
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

Add RAW_10 media bus code and V4L2_CID_CFA_PATTERN as well as
V4L2_CID_CFA_PATTERN_FLIP control support.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index e10df4840dca..fe7a8d72ac8b 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -804,7 +804,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -852,6 +852,13 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 				     V4L2_CID_TEST_PATTERN,
 				     ARRAY_SIZE(ov2740_test_pattern_menu) - 1,
 				     0, 0, ov2740_test_pattern_menu);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_CFA_PATTERN,
+			  V4L2_CFA_PATTERN_GRBG, V4L2_CFA_PATTERN_GRBG,
+			  1, V4L2_CFA_PATTERN_GRBG);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL,
+			  V4L2_CID_CFA_PATTERN_FLIP,
+			  0, V4L2_CFA_PATTERN_FLIP_BOTH,
+			  0, V4L2_CFA_PATTERN_FLIP_BOTH);
 
 	ret = v4l2_fwnode_device_parse(ov2740->dev, &props);
 	if (ret) {
@@ -1082,6 +1089,9 @@ static int __ov2740_set_format(struct v4l2_subdev *sd,
 				      width, height,
 				      format->width, format->height);
 
+	if (format->code != MEDIA_BUS_FMT_RAW_10)
+		format->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+
 	src_pix_fmt->code = format->code;
 	src_pix_fmt->width = mode->width;
 	src_pix_fmt->height = mode->height;
@@ -1122,10 +1132,14 @@ static int ov2740_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index > 0)
+	const u32 codes[] = {
+		MEDIA_BUS_FMT_SGRBG10_1X10,
+		MEDIA_BUS_FMT_RAW_10,
+	};
+	if (code->index >= ARRAY_SIZE(codes))
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	code->code = codes[code->index];
 
 	return 0;
 }
@@ -1140,7 +1154,8 @@ static int ov2740_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index >= ov2740->supported_modes_count)
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
+	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10 &&
+	    fse->code != MEDIA_BUS_FMT_RAW_10)
 		return -EINVAL;
 
 	fse->min_width = supported_modes[fse->index].width;
-- 
2.47.3

