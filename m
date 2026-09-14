Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1729244781E
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 11:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386123; cv=none; b=TVq8TPgp7XMrbmerGEKC4sbKv90MLVnDXIm/8uRTd+TGL9OFpHOZnKUAPI8A/ZB9I8E/iZJEsJVJO0y9ukkjSTnIaZz8mkP9K1AG0S0qNVJkUbhNpOu1jDU3LFOldE8P+jFlYKxkniMpg86GEbsVYBV9iLMepTPhrx0lmLMOJkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386123; c=relaxed/simple;
	bh=61DWdQ9ZTaFGqjgaQgHcgnO8/DkWZc52N1xjMQUc+EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FhLHneuozZtMrNguBvo0cfECGDFo6to2jlQdTtvgsNzVAzsvuSbeUV6XpM+0zz9fDChGwsYN+UYVxa9ehnFLwLeacVJ/jhq/u4RQoO9WuyHW5FQA70vVgblPUe7JoocbYhJB+lMV9uP33fhiZDDZIFDfk0o988QNND3hJ32Dkq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cudBbyod; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cudBbyod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789386121; x=1820922121;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=61DWdQ9ZTaFGqjgaQgHcgnO8/DkWZc52N1xjMQUc+EY=;
  b=cudBbyodryBDfnDpJzsb2zE/IPKx5RFNCRr+3weqgsr3HwWMOHbwJmnD
   LZ6DDxPyUYI5Op/h1J42YbszLwy6HhykIRps4v5HLFgJ/fvgs5ID3XuBs
   akEYHo9R0jc7d1c6IW6SlRYxFYlKvM4/3AxJh5b+ixMC9mV9xyssowsv/
   8tqNJTS/Yaf4IHAVflWsaN59b93IybgT8HW9CqlKLWnT8rB2yoyWL8RFO
   rYYidWiLuUAQJk75F+t9iY064JL+gR3WNaBPwtBnRfpxhmYQiGrMx6w69
   EbqQacAjMOY2cwTj/bAMpOX+Kx/+rgZ1MhYaitZkB5Kqxu7L20m6s/VSx
   A==;
X-CSE-ConnectionGUID: e8KGzNd4SEGZ0RtYJND4HQ==
X-CSE-MsgGUID: wedUx7HoTIiaycZvJAjubg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93431889"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="93431889"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:41:58 -0700
X-CSE-ConnectionGUID: 4OE+rTWSQvCM/bt3svRJFg==
X-CSE-MsgGUID: NMm/9d7VTjWJL2JVkMlreg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="270812717"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.61])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:41:51 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AAA84121BB7;
	Mon, 14 Sep 2026 14:41:56 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x654D-00000002PXb-0b2p;
	Mon, 14 Sep 2026 14:41:45 +0300
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
	Antti Laakso <antti.laakso@linux.intel.com>
Subject: [PATCH v8 03/13] media: imx219: Account for rate_factor in control steps
Date: Mon, 14 Sep 2026 14:41:34 +0300
Message-ID: <20260914114145.574791-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914114145.574791-1-sakari.ailus@linux.intel.com>
References: <20260914114145.574791-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The controls that are divided by the rate_factor before writing them to
the registers have the step of the value of the rate_factor. Take this
into account when the control's range is modified. The controls are
created in a configuration where rate_factor is always 1, hence there's no
need to change the code adding new controls.

Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 5184523de8be..b1f29037af74 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -340,13 +340,13 @@ static const struct imx219_mode supported_modes[] = {
 		/* 2x2 binned 60fps mode */
 		.width = 1640,
 		.height = 1232,
-		.fll_def = 1707,
+		.fll_def = 1706,
 	},
 	{
 		/* 640x480 60fps mode */
 		.width = 640,
 		.height = 480,
-		.fll_def = 1707,
+		.fll_def = 1706,
 	},
 };
 
@@ -473,8 +473,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = __v4l2_ctrl_modify_range(imx219->exposure,
 					       imx219->exposure->minimum,
 					       exposure_max,
-					       imx219->exposure->step,
-					       exposure_def);
+					       rate_factor, exposure_def);
 		if (ret)
 			return ret;
 
@@ -902,7 +901,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 
 		/* Update limits and set FPS to default */
 		ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
-					       IMX219_FLL_MAX - mode->height, 1,
+					       IMX219_FLL_MAX - mode->height,
+					       rate_factor,
 					       mode->fll_def - mode->height);
 		if (ret)
 			return ret;
@@ -920,8 +920,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 		ret = __v4l2_ctrl_modify_range(imx219->exposure,
 					       imx219->exposure->minimum,
 					       exposure_max,
-					       imx219->exposure->step,
-					       exposure_def);
+					       rate_factor, exposure_def);
 		if (ret)
 			return ret;
 
@@ -946,8 +945,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 			return ret;
 
 		/* Scale the pixel rate based on the mode specific factor */
-		pixel_rate = imx219_get_pixel_rate(imx219) *
-			     imx219_get_rate_factor(state);
+		pixel_rate = imx219_get_pixel_rate(imx219) * rate_factor;
 		ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
 					       pixel_rate, 1, pixel_rate);
 		if (ret)
-- 
2.47.3

