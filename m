Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C6F34D4DE
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765740; cv=none; b=oxRtlcVC/1shOxrn+W7O4t77tCJREbtiqW5rDqJC3rM+Xvg2pcpct0KKXie1Z0eHOMvvRwkptZpwY24foYDZExzYqegrHsZfPxg0OyYkAgdzTMuIpfSY1GdQvqLoGF2hLFEY7MFU5MMdvftcflSQVTAFyCzxACkYBh47kgGmxvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765740; c=relaxed/simple;
	bh=4Q1Uktloa61ZUhI+AJXF8UNESfNsJ32wZnEun+FPn8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B7zbQFRLkwNt4oxZFlEb640snc2CGCJIvgpcqMfnIsOGe7p520vzA0MzCKgW9RBSiMP3ib55Z5SCjCgCWMMaJjkEIlm4Rd1gNHZvaMaziOaWJDsSRlCxjIgJFZJ3nNw4PJGZ6i0s3sk/pdLhKXuXiH6HMWOOW/ITnNpzWONSTdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmIXbzvy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmIXbzvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765739; x=1807301739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4Q1Uktloa61ZUhI+AJXF8UNESfNsJ32wZnEun+FPn8U=;
  b=XmIXbzvyS+ijANNOguUmeyEAh5MooFD35+XNTyCdUbL63vpxiZG8P50a
   8kpU7zXghyAmWnBcpCu72CnAYm4lw3Lmvxc+PvHlgTtTLf7NYv+fN5V0S
   DN0AqQK3MQeVXVAkhmKQmVAxJ/hdBS4EFcMUGKKxzZJVMETqvi6L+Zu69
   lCc3y6/0q406gCAKh01EKI30GzPZl3OZwoYIe4AR4MsuFHKKtXVFWimE/
   9g+wvXiOi/GndlDqyR852fjiuLsG3xWBbNbcKFanKpaAwqmMz3JrQChDp
   O79NGg+vCq7D3oTcj4AWgfMEC6yOny8O3s+bYZ7XvrVq4ckEP0wsMiFgu
   g==;
X-CSE-ConnectionGUID: Q1am0fikSy627EFU1hYJww==
X-CSE-MsgGUID: U5ScX7NOQb2wVxQ1zgqG4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176665"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176665"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:33 -0700
X-CSE-ConnectionGUID: FLjvXmiaQDyRfS/yyZv4Ug==
X-CSE-MsgGUID: WVMxEg6UQ++sEQjKzSM5/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047623"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EBBD2122956;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045nt-1eNy;
	Thu, 09 Apr 2026 23:15:02 +0300
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
Subject: [PATCH v12 50/86] media: ov2740: Add support for generic raw formats
Date: Thu,  9 Apr 2026 23:14:25 +0300
Message-ID: <20260409201501.975242-51-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RAW_10 media bus code and V4L2_CID_CFA_PATTERN as well as
V4L2_CID_CFA_PATTERN_FLIP control support.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index b3d0c7e81585..cc9cd7ccbf1f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -807,7 +807,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -855,6 +855,13 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
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
@@ -1090,6 +1097,9 @@ static int __ov2740_set_format(struct v4l2_subdev *sd,
 				      width, height,
 				      format->width, format->height);
 
+	if (format->code != MEDIA_BUS_FMT_RAW_10)
+		format->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+
 	src_pix_fmt->code = format->code;
 	src_pix_fmt->width = mode->width;
 	src_pix_fmt->height = mode->height;
@@ -1130,10 +1140,14 @@ static int ov2740_enum_mbus_code(struct v4l2_subdev *sd,
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
@@ -1148,7 +1162,8 @@ static int ov2740_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index >= ov2740->supported_modes_count)
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
+	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10 &&
+	    fse->code != MEDIA_BUS_FMT_RAW_10)
 		return -EINVAL;
 
 	fse->min_width = supported_modes[fse->index].width;
-- 
2.47.3

