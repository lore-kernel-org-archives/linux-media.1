Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF06341379E
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573695; cv=none; b=reLUETEgch3EabDDH4n1UfnrSJfvwoPaajD83+Tma2WrG0lYsOETM0QgV3ClHGSGET1q45h/6DMjHeJra4pyH7u1uvJH6WxZqZhAbYFQl0zuSw9LGQFJXULE/0P/9pDuzs12LS5eQ/Q33Dsuhker8QhOcqz3LT2nmHzTu3YrMCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573695; c=relaxed/simple;
	bh=RuVe0A1tYy0mGbbk/pKdqqZjawo0qaOO+M1qqzp/cH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RVwlWNTNug/xy5AlVsMtT1mR0Tg/5j5mKQ1Ybi3GdQDM1GU3amwhhCtv6sEIgJLOjkz5YroYHZBEWfdkoCr9Y1XEiM6l2Jxu/xeOxRtI9Ds036QVFdTBfY1BJpXf/wIcya0SRLl40BwUQXOWNOaCKwpIkQIe0Z1CFTGzOHjoOfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCqgiFFz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCqgiFFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573693; x=1819109693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RuVe0A1tYy0mGbbk/pKdqqZjawo0qaOO+M1qqzp/cH4=;
  b=PCqgiFFz94Sm3Haz23+3oeZr6zFGYh55hMew4Rl7CEXWyRwX5s3EGnAt
   45Y7qV+yP+liqQow2OUFwX6DxoHE8+6eNCbTe1BvHS9L2C4RYBJJgyJD0
   ZOzK9FVyCd5WtVJVNnk2it5TMCEXzNt6hdjIDgsM8/y1nuKdc06r0rCbu
   pMmXxWrbizsecgXWhbCH5OMkRRHj9mzfY7J25Hl/GdFjyhkXs/4ZwjtgN
   G5LjvdXoNQQHOMAxql/Y/blabP6DMKNUjHxUPjtp7M/OCCDQsseWx8bpF
   ruV3v7VUaa1H7COhZpSmPM5s3QVJ0t73837tZOYbLaRXpPsQYA9QxXzQy
   w==;
X-CSE-ConnectionGUID: 0Xzxw6BNSmmvtEynd6SV9g==
X-CSE-MsgGUID: AaPwop4GQiG1l/bIqA2BIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036550"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036550"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:51 -0700
X-CSE-ConnectionGUID: /G6IDbrVTqmTbj8AF+n2TA==
X-CSE-MsgGUID: BshWfOjvRTOHhPdLPQZR1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787659"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8E193122609;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E3A5-30yc;
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
Subject: [PATCH v3 20/29] media: raspberrypi: cfe: Use v4l2_subdev_get_frame_desc()
Date: Mon, 24 Aug 2026 15:14:42 +0300
Message-ID: <20260824121451.3348583-21-sakari.ailus@linux.intel.com>
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
preferred over calling the get_frame_desc() pad operation directly. Also
remove the workaround for drivers not implementing the get_frame_desc()
pad op.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/raspberrypi/rp1-cfe/cfe.c  | 51 ++++---------------
 1 file changed, 11 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e97b9..e99a77e0878e 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2023-2024 Ideas on Board Oy
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -778,32 +779,9 @@ static irqreturn_t cfe_isr(int irq, void *dev)
  * Stream helpers
  */
 
-static int cfe_get_vc_dt_fallback(struct cfe_device *cfe, u8 *vc, u8 *dt)
-{
-	struct v4l2_subdev_state *state;
-	struct v4l2_mbus_framefmt *fmt;
-	const struct cfe_fmt *cfe_fmt;
-
-	state = v4l2_subdev_get_locked_active_state(&cfe->csi2.sd);
-
-	fmt = v4l2_subdev_state_get_format(state, CSI2_PAD_SINK, 0);
-	if (!fmt)
-		return -EINVAL;
-
-	cfe_fmt = find_format_by_code(fmt->code);
-	if (!cfe_fmt)
-		return -EINVAL;
-
-	*vc = 0;
-	*dt = cfe_fmt->csi_dt;
-
-	return 0;
-}
-
 static int cfe_get_vc_dt(struct cfe_device *cfe, unsigned int channel, u8 *vc,
 			 u8 *dt)
 {
-	struct v4l2_mbus_frame_desc remote_desc;
 	struct v4l2_subdev_state *state;
 	u32 sink_stream;
 	unsigned int i;
@@ -816,34 +794,27 @@ static int cfe_get_vc_dt(struct cfe_device *cfe, unsigned int channel, u8 *vc,
 	if (ret)
 		return ret;
 
-	ret = v4l2_subdev_call(cfe->source_sd, pad, get_frame_desc,
-			       cfe->source_pad, &remote_desc);
-	if (ret == -ENOIOCTLCMD) {
-		cfe_dbg(cfe, "source does not support get_frame_desc, use fallback\n");
-		return cfe_get_vc_dt_fallback(cfe, vc, dt);
-	} else if (ret) {
+	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
+		v4l2_subdev_get_frame_desc(cfe->source_sd, cfe->source_pad,
+					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (IS_ERR(fd)) {
 		cfe_err(cfe, "Failed to get frame descriptor\n");
-		return ret;
-	}
-
-	if (remote_desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		cfe_err(cfe, "Frame descriptor does not describe CSI-2 link");
-		return -EINVAL;
+		return PTR_ERR(fd);
 	}
 
-	for (i = 0; i < remote_desc.num_entries; i++) {
-		if (remote_desc.entry[i].stream == sink_stream)
+	for (i = 0; i < fd->num_entries; i++) {
+		if (fd->entry[i].stream == sink_stream)
 			break;
 	}
 
-	if (i == remote_desc.num_entries) {
+	if (i == fd->num_entries) {
 		cfe_err(cfe, "Stream %u not found in remote frame desc\n",
 			sink_stream);
 		return -EINVAL;
 	}
 
-	*vc = remote_desc.entry[i].bus.csi2.vc;
-	*dt = remote_desc.entry[i].bus.csi2.dt;
+	*vc = fd->entry[i].bus.csi2.vc;
+	*dt = fd->entry[i].bus.csi2.dt;
 
 	return 0;
 }
-- 
2.47.3

