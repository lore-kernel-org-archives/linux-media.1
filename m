Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12C241A4FF
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573701; cv=none; b=q+vo2sWgt60krPyQC8tZDZxTRLdgUTgBafdSR/870/2d7FBkxTUdRoBK+nXOHLHakfALpLByIv3XOp2+OnH8rtyxLbTuVg5AYItAPmFk5DzA5lngud9vU+WW4ZJh2/MVXMvGjDaeD6y9XskmbT4+G7817/RLj8Cap3PBP7aJ9j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573701; c=relaxed/simple;
	bh=FlmHYnsovKJ+tULtge0+Ct1gfMmpx94X0UA/U/yrhpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHUEpRWYgtZMDl5g2sGpSR/IJsJLQiIaX0Ya1n/xmaM0v06AD/Q3VFMZ2O7tJOX/XNIC0jZBnbYk30fZWsDSJD9ErdsWziywvEetg/XYYLUjraWDz/QxHs2sxYPp3hhNGV6s9N+PII+WIr6iFa7UILGTPWA/LyMGElJCl8BcGGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/wA+zW1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/wA+zW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573699; x=1819109699;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FlmHYnsovKJ+tULtge0+Ct1gfMmpx94X0UA/U/yrhpE=;
  b=l/wA+zW1+KHJka63dsb3F8PzgBVgA95YZ2+aMx8hf2y5NxnH2nrdbRZL
   ZHg+FfXU5q83dUHOPdMHBOjhFDFcBzxuWT++uGCa67Y8p8tCn1y+3OoN/
   SPZBZAaABpKdwsIaTJVplyUG9mwvom5BgANI5NjbASnJClZtxHSB6x+oW
   M8sYWVT95ZJEgWEx0m3SewmXywLPuiljDECR8vALRNQYyTwQjgMbN7WFc
   /Ywmp0SeCDXm8BukfT+eZeYkMe/ziissFsmOCovzCiNuwpn0fQ+uahJzF
   KCmSas6IS7Xx+i0l62AOCwSfSQ4oIRxHi7o0/WmX/R9BXzYqDEFdbY2+s
   Q==;
X-CSE-ConnectionGUID: rPZNbsNkRhu8xBtcRI46wA==
X-CSE-MsgGUID: UBnM/MbrS1CHwO/mhzUgFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036579"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036579"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:52 -0700
X-CSE-ConnectionGUID: 5ZCnMUVvQz+tbi1SOcnmgQ==
X-CSE-MsgGUID: BawVXSoQQsikCWAdlHwqjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787667"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:50 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 991AF1229CB;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E3AK-3BM5;
	Mon, 24 Aug 2026 15:14:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [PATCH v3 23/29] media: exynos4-is: Use v4l2_subdev_get_frame_desc()
Date: Mon, 24 Aug 2026 15:14:45 +0300
Message-ID: <20260824121451.3348583-24-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
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

