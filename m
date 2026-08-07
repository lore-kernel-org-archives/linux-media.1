Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6569D47668C
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105503; cv=none; b=FJNvWgpZxJqf10202TpMaf3avYkIa7ft8OgFv11cmbMiS34JCPIP4rodWY81941Lf3DgE26TJiMO5uqY/ICuszoF4QcmNOMwvxOvUCRCMuKS6CTXfngZk2MnR0fTtdj7P9MnfFQ4ldFXm9QUBgNtwTHgU7Ma5Llm63vBm1bRCcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105503; c=relaxed/simple;
	bh=HMAg8e0QZ6LTcD3B31G/lbHx82ZCK7dUrk4AicHalIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gDl1stisRzsoMcCqdh1HwJfD2ZN9suiKyYJK6YB6+9Z/3SEmQGhIG48WgtzDiCjE+7dAU/KywSc6BGqnm8c7ZK48gfwtDuP05uwvdU+ZmuJSpd4zsaJPzt6NtL+R/dsxTcHD1FyD+AOD31rISzLwAuTVgLQiEU9rc6A3c5VNCPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxOvyFBX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxOvyFBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786105484; x=1817641484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HMAg8e0QZ6LTcD3B31G/lbHx82ZCK7dUrk4AicHalIY=;
  b=hxOvyFBXsHc2QtwfEbrfiUo5UhkQhcctOhNULEepSzz5t7Yz2utRO5P7
   JO0WPK9NHN/3p3W0aPMDxnJI1WSZLmT7JcY6mQXJjEilBhR+pWVFPCEE6
   1qp5PpjcKEZPgJUsqUWBLOfdJeMn/9unA0ZyTPotNK6IpuJIJtn/qKWam
   7uiweda8BVPZAXFjbQYGcO5ngKvwAhaObNTH6h5ghKDAipktd06ZPGFPt
   z6WtwvuOn1T3GR+Amm3DEgECvNUetzwbIApr+LoolRwEr8TZI810gElbu
   sgo+DNblP8Cmw8SINLRMToSS6PQ7CUUEyIK5IIBe4yESxA8vY0vkI7tEM
   w==;
X-CSE-ConnectionGUID: AmZmynTYQcC/ztNPceg2lg==
X-CSE-MsgGUID: GjjbqxpFRFy3vDjEW8CZWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90591929"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90591929"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:29 -0700
X-CSE-ConnectionGUID: ajRwkPhuQSuX/Q8IJc40XA==
X-CSE-MsgGUID: +lfIeu2XTDm/bcPxkROuZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259779641"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.179])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:23 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 938CC121CB1;
	Fri, 07 Aug 2026 15:24:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wsJcP-00000000Bvh-30xg;
	Fri, 07 Aug 2026 15:24:09 +0300
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
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v7 03/14] media: imx219: Account for rate_factor in control steps
Date: Fri,  7 Aug 2026 15:23:58 +0300
Message-ID: <20260807122409.45807-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
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

