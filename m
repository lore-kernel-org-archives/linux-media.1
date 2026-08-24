Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C4A419302
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573698; cv=none; b=VRYeZIcZk24Dop5NjxBVXlh5NrOi04hHXc1gBaW3OfPBIOouT0c5DV+bOHfOEqTT9t3zJg1/1CtnZaoAipN+NO55Ne/n99plgmjGkv4cyF66l/llCngfO4jwDmEMf+/Kitn1c4b7cj/7J8AOp0m/znfiUvhhGZBOA7nZj81a5nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573698; c=relaxed/simple;
	bh=HfAawddpAq74fAhNjHkmArww3ydntulmM65/XPRoUSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RPl/6kgnZ7izxqIlkB1kMA+UMyuLuNq9H7hvd9E+NIKCNLtmn9d1/ABpZbLpie4ozUG2jZlM/PFQLJpqe1GKQkobYpW2LQ2JWsN4Zmo975jgREYQ/rh204kcCW7OVBZg0hkerR7zGsOlPv/01zv4idIbKHJkI1oEi7jqoU0JBoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jdQlA/k6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdQlA/k6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573696; x=1819109696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HfAawddpAq74fAhNjHkmArww3ydntulmM65/XPRoUSU=;
  b=jdQlA/k6tmnxT4u1A+dyEpCFCqvRHhwp5ezG0On2KFEIt5/pF6598SSm
   KScjzd/F3lVPJ0n9xGfmt+uyYo/bcJykHMhnLZvOzasFZCpKqc/CcTFoe
   yIOvIRds0uGAT0weHX5bqLzheMQ0env+wt6evh9B5hMNZ/2CGhmybfEL4
   KE76us3xUSsdHzVXJfTR45bN5kV4pQ7TP4gY7Cer5yeLUnCxedx1L1M5B
   3bzfTXvaHjFzxB2pQMrpzD1UfBqbTIHRj2keLTfQe6/6S1H3nelIrCqsE
   mm4D5rCZr5+mIR8TrhqSCiCw3JyoF77g2hBEaur9zVAJZrkOKfn5dcRN9
   g==;
X-CSE-ConnectionGUID: W1hs+UAfQq21j+GKuy5u7g==
X-CSE-MsgGUID: BNeUzVfwRl26hSqISD+33A==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036585"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:52 -0700
X-CSE-ConnectionGUID: 4A61zlbASDOLTZ0V8HHelA==
X-CSE-MsgGUID: JdmhXunWTCW+UC0QhUxA/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787671"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:50 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9EDDF122A3C;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E3AT-3IL7;
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
Subject: [PATCH v3 25/29] media: ipu6: Use v4l2_subdev_get_frame_desc()
Date: Mon, 24 Aug 2026 15:14:47 +0300
Message-ID: <20260824121451.3348583-26-sakari.ailus@linux.intel.com>
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
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 22 ++++++++-----------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 7e539a0c6c92..5317b01935a3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -6,6 +6,7 @@
 #include <linux/atomic.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -600,11 +601,9 @@ int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
 {
 	struct v4l2_mbus_frame_desc_entry *desc_entry = NULL;
 	struct device *dev = &csi2->isys->adev->auxdev.dev;
-	struct v4l2_mbus_frame_desc desc;
 	struct v4l2_subdev *source;
 	struct media_pad *pad;
 	unsigned int i;
-	int ret;
 
 	source = media_entity_to_v4l2_subdev(source_entity);
 	if (!source)
@@ -614,18 +613,15 @@ int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
 	if (!pad)
 		return -EPIPE;
 
-	ret = v4l2_subdev_call(source, pad, get_frame_desc, pad->index, &desc);
-	if (ret)
-		return ret;
-
-	if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		dev_err(dev, "Unsupported frame descriptor type\n");
-		return -EINVAL;
-	}
+	struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
+		v4l2_subdev_get_frame_desc(source, pad->index,
+					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
 
-	for (i = 0; i < desc.num_entries; i++) {
-		if (source_stream == desc.entry[i].stream) {
-			desc_entry = &desc.entry[i];
+	for (i = 0; i < desc->num_entries; i++) {
+		if (source_stream == desc->entry[i].stream) {
+			desc_entry = &desc->entry[i];
 			break;
 		}
 	}
-- 
2.47.3

