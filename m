Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2796F476CD9
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 12:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105531; cv=none; b=VQ4zO1hNeBOaE3s3S3IYau0Uqhv6qJYsxszfsvBT0oiFBojJ+7srQC53Lznu3lGP46hEzu1MjWv3eagnNSYbWR3GuXkwSyly6ShbDyMLPUu9qemICUVtQG/JnSusRo9/u+w6Tck7E8zQv5BF8aQsWgMTFreAsgs+iJDiPJZvWC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105531; c=relaxed/simple;
	bh=vavXAcbvQmjLduNX5kIw4qVXAV4lQyycy7zDt2jwynI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rDZBc9/S26PCjyjcwNy+UCebDinqpeRn32Hhn+iv0o18YfggHVq13Fe+PMaChm9hM3kCp/rea+NUnLLcmPwbbkGTgdS0Bm1zJZDhBTKFRSaKQ1AAARs/EeFugfoCBAg2+Bid6TLJIyOLdP0oG0M9IgVLRXjgex+F9g5LBvI4y90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5LgX8Pe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5LgX8Pe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786105508; x=1817641508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vavXAcbvQmjLduNX5kIw4qVXAV4lQyycy7zDt2jwynI=;
  b=N5LgX8PeEM6I8DrGYk98nCRIzaF0i0RHPzeqsE0gv8XbNMIRAPYngvOv
   uLh3hAUDAhT1uFgMg0vAik7sBYJtNNroey/Dhlva2s0VhZUEWBkbZGESI
   hkvKjml52QRsPW6+2y4f+fkBORkNRle4hPjT7K1V0Fa0RwTrJ+ROwEPS3
   rV3PT9iDVcZAz7nRqMm20ya9YlIlnTFkEqLVW1GaHMy/ORGTmtIgTXBrc
   necYHKRvTYq/nHj1Zd3iDsw4yfB6Nw4lpxTlLJ/WSTbKwQxAfHtmnMMly
   ogw8ucdq1MSy2alDEjW+W02EBoSMgkVVR4hpj5AMkgqrLFtEbx3uJ57Kd
   A==;
X-CSE-ConnectionGUID: xMXyMkubRMqvVc7qRp59fA==
X-CSE-MsgGUID: MXoLP0rZS5Kh+DOFq+8ldg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90591992"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90591992"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:37 -0700
X-CSE-ConnectionGUID: 1jlcIWpNRlCTegVaP/k57A==
X-CSE-MsgGUID: qnS8Mfz+QxCO0HxPm0jE6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259779676"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.179])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:31 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B4993121CEE;
	Fri, 07 Aug 2026 15:24:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wsJcP-00000000BwK-3bvr;
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
Subject: [PATCH v7 12/14] media: mt9m001: Pass sub-device state to set_selection() callback
Date: Fri,  7 Aug 2026 15:24:07 +0300
Message-ID: <20260807122409.45807-13-sakari.ailus@linux.intel.com>
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

When the set_selection() pad operation is called from mt9m001_s_fmt(),
it receives a NULL pointer for the state argument. As the function does
not use the state this does not cause any issue in practice, but it
could cause NULL pointer dereferences if the mt9m001_set_selection()
implementation is modified. Avoid future issues by passing the subdev
state.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/mt9m001.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 0ade967b357b..d8fffed0818a 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -343,6 +343,7 @@ static int mt9m001_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int mt9m001_s_fmt(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_state *state,
 			 const struct mt9m001_datafmt *fmt,
 			 struct v4l2_mbus_framefmt *mf)
 {
@@ -359,7 +360,7 @@ static int mt9m001_s_fmt(struct v4l2_subdev *sd,
 	int ret;
 
 	/* No support for scaling so far, just crop. TODO: use skipping */
-	ret = mt9m001_set_selection(sd, NULL, &sel);
+	ret = mt9m001_set_selection(sd, state, &sel);
 	if (!ret) {
 		mf->width	= mt9m001->rect.width;
 		mf->height	= mt9m001->rect.height;
@@ -404,7 +405,7 @@ static int mt9m001_set_fmt(struct v4l2_subdev *sd,
 	mf->xfer_func	= V4L2_XFER_FUNC_DEFAULT;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		return mt9m001_s_fmt(sd, fmt, mf);
+		return mt9m001_s_fmt(sd, sd_state, fmt, mf);
 	*v4l2_subdev_state_get_format(sd_state, 0) = *mf;
 	return 0;
 }
-- 
2.47.3

