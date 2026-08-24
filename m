Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BD6416878
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573694; cv=none; b=jtNKTIqhS27isnMYoCWkEq8Pbz8Yoq9xJmwa/sNfPUseweXEfzc2RcPOFZJnWvduqSRH2+GOkB2wkHRPCeFNx6OiLmnYJWeTqYIM2pqp9f9JXzDbzWY87YmHqjtrjWU/gkeso7+F5FYDZDRR6Xg0y8OHRQSbacj8gT4hzpsUBic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573694; c=relaxed/simple;
	bh=XuVZ5weMIuPIn/2XTtvB+0TAf2WajpIVGEScfc676pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KYa8FpksPgvaP3zodvlCqQFLhCxTlHnPMULYQEkASQrNJXK5Yj5gTncNEXCcTzEDc/M4xd06fhNA33pcfcjLs0fsHu+1a9OOXMlL4/pCNsswKlEK70NFnHo7668UtGbqysrkynlzNz8xeMxRqFXS9S8KU+ew2cgOwihF8AYzq9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/zCIiX4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/zCIiX4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573693; x=1819109693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XuVZ5weMIuPIn/2XTtvB+0TAf2WajpIVGEScfc676pU=;
  b=m/zCIiX46Oc8vPkQlDK+MV6OEtsrLZpNuHnjPAsBgiNnssv5Rv9EDWdc
   t7qE2gvfK7RcoBcxh5D62qEY2hJS2i4oWttbkbcMFOf34mU6Xa1O1PW+0
   P9rYgX5NHCnn/o+cBza6YxuB6X+kV5iBlLXJgelvfNbldzAqyBZGFTyUs
   Kn28FibAf8vvxY5F6K2skqYnGEXpDhrcNjounVTpty2Ug7Iv08enmO8vW
   kJIQ889DP5Jlf1ju1rU/YjQayxzJ/ll3xu9iYWFVZ0Uo2QcZJRWb+e+G4
   BnVGDmNh2uDcefwUKK7g7m2D6FBqsc6w3L39Z4NK4Ltq+oFo4D9O24Mt7
   g==;
X-CSE-ConnectionGUID: Hs0MlincQmmt89YwxOSzaQ==
X-CSE-MsgGUID: equRdEn0RwOyMiBDaRB+9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036545"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036545"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:51 -0700
X-CSE-ConnectionGUID: xz3b8KHXQayGWQLd4rf/Zg==
X-CSE-MsgGUID: UCQJJbCOQb68erY4q8aKmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787658"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 949F1122727;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E3AE-37kE;
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
Subject: [PATCH v3 22/29] media: rkisp1: Use v4l2_subdev_get_frame_desc()
Date: Mon, 24 Aug 2026 15:14:44 +0300
Message-ID: <20260824121451.3348583-23-sakari.ailus@linux.intel.com>
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
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 2311672cedb1..eb8e881759f7 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
  */
 
+#include <linux/cleanup.h>
 #include <linux/iopoll.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -87,11 +88,9 @@ static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
 				struct media_pad *source)
 {
 	struct v4l2_subdev *source_sd;
-	struct v4l2_mbus_frame_desc fd;
 	unsigned int dt;
 	u32 mask;
 	u32 val;
-	int ret;
 
 	/*
 	 * Configure and enable the gasket with the CSI-2 data type. Set the
@@ -101,22 +100,24 @@ static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
 	 */
 
 	source_sd = media_entity_to_v4l2_subdev(source->entity);
-	ret = v4l2_subdev_call(source_sd, pad, get_frame_desc,
-			       source->index, &fd);
-	if (ret) {
+
+	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
+		v4l2_subdev_get_frame_desc(source_sd, source->index,
+					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (IS_ERR(fd)) {
 		dev_err(rkisp1->dev,
-			"failed to get frame descriptor from '%s':%u: %d\n",
-			source_sd->name, 0, ret);
-		return ret;
+			"failed to get frame descriptor from '%s':%u: %pe\n",
+			source_sd->name, 0, fd);
+		return PTR_ERR(fd);
 	}
 
-	if (fd.num_entries != 1) {
+	if (fd->num_entries != 1) {
 		dev_err(rkisp1->dev, "invalid frame descriptor for '%s':%u\n",
 			source_sd->name, 0);
 		return -EINVAL;
 	}
 
-	dt = fd.entry[0].bus.csi2.dt;
+	dt = fd->entry[0].bus.csi2.dt;
 
 	if (rkisp1->gasket_id == 0) {
 		mask = ISP_DEWARP_CONTROL_MIPI_CSI1_HS_POLARITY
-- 
2.47.3

