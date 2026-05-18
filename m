Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E067148C3EB
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122613; cv=none; b=NWicVDnkh0WIMin7pdEYQkxSACgGGmWGMutyXPrXdjDQ+6WOjVBGARusFD3P8GBvx85BLJZldYgBsi9tyKGyVOlCEB48L+Zhvm3kapLBb0gF1Mof5iCvQ+xMzG+Y1NuYDH5SNE7zpd/5go06HuiAN/VLKQMUXA2bhD15yBxyCKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122613; c=relaxed/simple;
	bh=FlmHYnsovKJ+tULtge0+Ct1gfMmpx94X0UA/U/yrhpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AWbEBxKaffN2o/KeEHP5sFVBNWmWRY6HsI5PIwPIUoFAsxjtHLaq2JwyCTVXKbNEiLycQL2zS95Y+f17F1V7IeJyB4eqALiaj8SOVyZlKtcXnx3hnShBU0xqYYCx5AZwdWQVAJywLoL+eO8vkW+DpkOA/CCgYvwGJCFuMiiw3cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WSFJOy2V; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSFJOy2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122612; x=1810658612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FlmHYnsovKJ+tULtge0+Ct1gfMmpx94X0UA/U/yrhpE=;
  b=WSFJOy2V2qHAZIN1p1/iA8aqCv/O7izlanGgFhdesCWOqSokFxMIAAly
   e0ENNKD12bk3kaLTElogyb05SKlSte76pEUHU0Yjx0Kf9PljPcW6MCLXl
   mTQEm4ok13aidN6wJMa6r9HDUAJI0RCDGSo+/Thlvf3Jl2fDJWzSjtPmn
   lCxTPXoor3pSqNs4pCtd7F1l9fgeg5DQSh29K4ANFdQvw5lZr+3fEh5PY
   nMn6VYIS00OQt1u45M3cGx1YuoFYqbtvuiA4erEJx0s311TnSpAjgvftp
   sXtE5Ue7qNVWRx9LrKG6OoZ78SVT+I2umLqit7YMqICZOWqr+Vm1atSnn
   w==;
X-CSE-ConnectionGUID: h7dur+WuS7uv9dG0ktWTdA==
X-CSE-MsgGUID: vxDW/OMlROWciaaL0Bes1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413860"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413860"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:29 -0700
X-CSE-ConnectionGUID: 554e379kSLSGDafkqL9vLQ==
X-CSE-MsgGUID: kgCLIYgASwCBGHO/oDaMxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019245"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:24 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4FA8B121D20;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E8Aa-17TF;
	Mon, 18 May 2026 19:43:18 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Frank Li <Frank.li@nxp.com>
Subject: [PATCH v2 14/17] media: exynos4-is: Use v4l2_subdev_get_frame_desc()
Date: Mon, 18 May 2026 19:43:14 +0300
Message-ID: <20260518164318.3367888-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../platform/samsung/exynos4-is/fimc-capture.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
index d85811f4b8c5..b5749f9cba39 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
@@ -6,6 +6,7 @@
  * Sylwester Nawrocki <s.nawrocki@samsung.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
@@ -853,7 +854,8 @@ static int fimc_get_sensor_frame_desc(struct v4l2_subdev *sensor,
 				      struct v4l2_plane_pix_format *plane_fmt,
 				      unsigned int num_planes, bool try)
 {
-	struct v4l2_mbus_frame_desc fd = { };
+	struct v4l2_mbus_frame_desc *alloc_fd
+		__free(v4l2_subdev_free_frame_desc) = NULL, fd = { };
 	int i, ret;
 	int pad;
 
@@ -861,10 +863,18 @@ static int fimc_get_sensor_frame_desc(struct v4l2_subdev *sensor,
 		fd.entry[i].length = plane_fmt[i].sizeimage;
 
 	pad = sensor->entity.num_pads - 1;
-	if (try)
+	if (try) {
 		ret = v4l2_subdev_call(sensor, pad, set_frame_desc, pad, &fd);
-	else
-		ret = v4l2_subdev_call(sensor, pad, get_frame_desc, pad, &fd);
+	} else {
+		alloc_fd = v4l2_subdev_get_frame_desc(sensor, pad,
+						      V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+		if (IS_ERR(alloc_fd)) {
+			ret = PTR_ERR(alloc_fd);
+		} else {
+			fd = *alloc_fd;
+			ret = 0;
+		}
+	}
 
 	if (ret < 0)
 		return ret;
-- 
2.47.3

