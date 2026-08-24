Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6012341686A
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573697; cv=none; b=TtfZt6vOm3oq3EWxT9y+O0ELq8cgQHN+hYfVluOQFUhVwy6yUJ7Y6m/4TGD7FivDnUlvrDKeXygdxF+YiBBz32zJUSkCMnVQRqQ6U7EOQHZzjk9MBe+9TlvvVGNpwXH5RJVztNyNVrwlnGeHtgvGh2VX9iY+U+UE5KE2Mb38mss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573697; c=relaxed/simple;
	bh=Vu8PIyW3nH+fYtJGNneseUrOObAhdGFmhAUEoYUlo2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WaaszcrZtfkYMnsY0EkXupB2UHS1cPE0eX1EHmvEj5zkgkOSrxs9Ec0EHhOUOEhkCSPBjT0QXJ7gWx8Z2yr8SKDt5jgMHTzR7wukBWmEjQKbgcGvIu9O3nxCQcYXwRgUbeQlIyrE6mr4VVg7iIX0Dcll4ibdOWa6/4vhR9WSEG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgNl3Grf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgNl3Grf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573696; x=1819109696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vu8PIyW3nH+fYtJGNneseUrOObAhdGFmhAUEoYUlo2c=;
  b=bgNl3GrfJ0feHlvkhHdQV22TdD9dUcPuzdGpls0AJkTqjhIdOPiAFuWw
   DT9e+Nm7Hz56lvdN3C9SdMcwOINaZaUhQN6XQD4ayx/edoAU0e05d9U7E
   u6K9FDVhZ75IqOvh3xZbd7F0OhMBt46zfWZEqVHYQowmBtM3VAF1CwuEr
   ieWxOzz8t/QVttU0zzIDOjC6VUJAFjUTCcg2sAxZLPDYqgi4YjrZD7oSl
   SVD3IIw7deobxLlMwTt/PfvYAUssDqbj1pPW/N03xru80OI8YyCcbl3d0
   Mub8fW7AoavYfGfXBVhqsRiwDi1hRSj5dCg9yUK7AyVrzKG052zwoqGVN
   w==;
X-CSE-ConnectionGUID: d8WcmUicRy21dcdwPxzObA==
X-CSE-MsgGUID: mrKa2vnsQv2HRyCapRbZrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036572"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036572"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:51 -0700
X-CSE-ConnectionGUID: KZ0ZqtNTTA+AcF3+x/UlyA==
X-CSE-MsgGUID: RLJ5JIDcSnyNY29rluOsuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787665"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:50 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 92B2712265F;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E3AA-34Pp;
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
Subject: [PATCH v3 21/29] media: rzg2l-cru: Use v4l2_subdev_get_frame_desc()
Date: Mon, 24 Aug 2026 15:14:43 +0300
Message-ID: <20260824121451.3348583-22-sakari.ailus@linux.intel.com>
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
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 27 +++++--------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 91eda5034248..90c074527e01 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -11,6 +11,7 @@
  * Copyright (C) 2008 Magnus Damm
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
@@ -438,31 +439,17 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 
 static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 {
-	struct v4l2_mbus_frame_desc fd = { };
 	struct media_pad *remote_pad;
-	int ret;
 
 	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
-	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
-	if (ret < 0 && ret != -ENOIOCTLCMD) {
-		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");
-		return ret;
-	}
-	/* If remote subdev does not implement .get_frame_desc default to VC0. */
-	if (ret == -ENOIOCTLCMD)
-		return 0;
 
-	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		dev_err(cru->dev, "get_frame_desc returned invalid bus type %d\n", fd.type);
-		return -EINVAL;
-	}
-
-	if (!fd.num_entries) {
-		dev_err(cru->dev, "get_frame_desc returned zero entries\n");
-		return -EINVAL;
-	}
+	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
+		v4l2_subdev_get_frame_desc(cru->ip.remote, remote_pad->index,
+					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (IS_ERR(fd))
+		return PTR_ERR(fd);
 
-	return fd.entry[0].bus.csi2.vc;
+	return fd->entry[0].bus.csi2.vc;
 }
 
 void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
-- 
2.47.3

