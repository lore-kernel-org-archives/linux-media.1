Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93B841A564
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573702; cv=none; b=i2vqNQ03ltMUZ/YQ4TyS5fcw+jsyPCACfD6kH79iwaibT2wqqHB7oOoIHT+yHZggfscPAFa/hvs9J/WASjXOcAQf5ETdeuGMb/dzWAUNTQPGau3k5xkIOgZaul5aw06J1mFElMOKXfo7v6R02x4hk6mKOqiYL674ij5drJx5HIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573702; c=relaxed/simple;
	bh=bfFIDkRQ1fggnV5w5Zyt/HOQAHOzrAT7yaeh6vd2jqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=REoTz59hCUlOQSj7My72Qw03ySWiwWsI53D1wxt74r6UUqech64leIM9nTGKAJoUzXRSwqhFecMXcw/TY8R/voAWO+wbwz6YuMrhr3E59zEaqWcaudkreNvsUtuaImOVStCZy7AC3ILsd0S4b3xHQ/Vd0gA7JoNVeNs2bkvxKAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVnD1JTo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVnD1JTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573701; x=1819109701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bfFIDkRQ1fggnV5w5Zyt/HOQAHOzrAT7yaeh6vd2jqU=;
  b=MVnD1JToFkVTUkTK6+0YJ+5upu+jE/dQ57lVNGHavMSaPitsxdV9e/cD
   TXFMudLbDmNZGsRttCSgHU+7O9NY9HA0XI0dmvKecVJg6N//NRPirGhXV
   rf3u9jaCOYvroR8bPz+TCE2yl78DxWCkLi/IiWdlV6uVEQa+bOHBzZoWm
   XFx6p0DUqxMJwnjZCGAZNZI+8HB9WjVba3SjkkImMwh1LJazI9/GHngwN
   lIvGyqZeglc0iW4mEiG9lCkZlUo7MpgTuWioCYnSEeAZ0feHhfC8Ev/7C
   RcraY5jxQzU1HQFnAYsrJSo0JDCqdi4AXUgdhebkYnL4l+QymcsAoEBi5
   w==;
X-CSE-ConnectionGUID: NOIgCaQ7TLCkNISE/vl0LA==
X-CSE-MsgGUID: HksKWB8CQSm672vU0nflfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036600"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036600"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:52 -0700
X-CSE-ConnectionGUID: JKo5EzMaQIOsNh90QBN4MA==
X-CSE-MsgGUID: CLCCabN+S2aA0kfiPPHWBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787669"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:50 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9B848122A3B;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E3AP-3ErE;
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
Subject: [PATCH v3 24/29] media: ti: cal: Use v4l2_subdev_get_frame_desc()
Date: Mon, 24 Aug 2026 15:14:46 +0300
Message-ID: <20260824121451.3348583-25-sakari.ailus@linux.intel.com>
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
 drivers/media/platform/ti/cal/cal-camerarx.c | 26 +++++------
 drivers/media/platform/ti/cal/cal.c          | 49 ++++++--------------
 2 files changed, 27 insertions(+), 48 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 00a71dac0ff4..9ea1f3551d22 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -9,6 +9,7 @@
  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
@@ -872,7 +873,8 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				       struct v4l2_mbus_frame_desc *fd)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
-	struct v4l2_mbus_frame_desc remote_desc;
+	struct v4l2_mbus_frame_desc *remote_desc
+		__free(v4l2_subdev_free_frame_desc) = NULL;
 	const struct media_pad *remote_pad;
 	struct v4l2_subdev_state *state;
 	u32 sink_stream;
@@ -893,24 +895,20 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		goto out_unlock;
 	}
 
-	ret = v4l2_subdev_call(phy->source, pad, get_frame_desc,
-			       remote_pad->index, &remote_desc);
-	if (ret)
-		goto out_unlock;
-
-	if (remote_desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		cal_err(phy->cal,
-			"Frame descriptor does not describe CSI-2 link");
-		ret = -EINVAL;
+	remote_desc =
+		v4l2_subdev_get_frame_desc(phy->source, remote_pad->index,
+					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (IS_ERR(remote_desc)) {
+		ret = PTR_ERR(remote_desc);
 		goto out_unlock;
 	}
 
-	for (i = 0; i < remote_desc.num_entries; i++) {
-		if (remote_desc.entry[i].stream == sink_stream)
+	for (i = 0; i < remote_desc->num_entries; i++) {
+		if (remote_desc->entry[i].stream == sink_stream)
 			break;
 	}
 
-	if (i == remote_desc.num_entries) {
+	if (i == remote_desc->num_entries) {
 		cal_err(phy->cal, "Stream %u not found in remote frame desc\n",
 			sink_stream);
 		ret = -EINVAL;
@@ -919,7 +917,7 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
 	fd->num_entries = 1;
-	fd->entry[0] = remote_desc.entry[i];
+	fd->entry[0] = remote_desc->entry[i];
 
 out_unlock:
 	v4l2_subdev_unlock_state(state);
diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index b7e77b6b8950..20192f90d5b3 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -445,55 +445,36 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
 	return stopped;
 }
 
-static int
-cal_get_remote_frame_desc_entry(struct cal_ctx *ctx,
-				struct v4l2_mbus_frame_desc_entry *entry)
+int cal_ctx_prepare(struct cal_ctx *ctx)
 {
-	struct v4l2_mbus_frame_desc fd;
 	struct media_pad *phy_source_pad;
-	int ret;
 
 	phy_source_pad = media_pad_remote_pad_first(&ctx->pad);
 	if (!phy_source_pad)
 		return -ENODEV;
 
-	ret = v4l2_subdev_call(&ctx->phy->subdev, pad, get_frame_desc,
-			       phy_source_pad->index, &fd);
-	if (ret)
-		return ret;
+	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
+		v4l2_subdev_get_frame_desc(&ctx->phy->subdev,
+					   phy_source_pad->index,
+					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (IS_ERR(fd))
+		return PTR_ERR(fd);
 
-	if (fd.num_entries != 1)
+	if (fd->num_entries != 1)
 		return -EINVAL;
 
-	*entry = fd.entry[0];
+	ctx_dbg(2, ctx, "Framedesc: stream %u, len %u, vc %u, dt %#x\n",
+		fd->entry[0].stream, fd->entry[0].length,
+		fd->entry[0].bus.csi2.vc, fd->entry[0].bus.csi2.dt);
 
-	return 0;
-}
-
-int cal_ctx_prepare(struct cal_ctx *ctx)
-{
-	struct v4l2_mbus_frame_desc_entry entry;
-	int ret;
-
-	ret = cal_get_remote_frame_desc_entry(ctx, &entry);
-
-	if (ret == -ENOIOCTLCMD) {
-		ctx->vc = 0;
-		ctx->datatype = CAL_CSI2_CTX_DT_ANY;
-	} else if (!ret) {
-		ctx_dbg(2, ctx, "Framedesc: stream %u, len %u, vc %u, dt %#x\n",
-			entry.stream, entry.length, entry.bus.csi2.vc,
-			entry.bus.csi2.dt);
-
-		ctx->vc = entry.bus.csi2.vc;
-		ctx->datatype = entry.bus.csi2.dt;
-	} else {
-		return ret;
-	}
+	ctx->vc = fd->entry[0].bus.csi2.vc;
+	ctx->datatype = fd->entry[0].bus.csi2.dt;
 
 	ctx->use_pix_proc = ctx->vb_vidq.type == V4L2_BUF_TYPE_VIDEO_CAPTURE;
 
 	if (ctx->use_pix_proc) {
+		int ret;
+
 		ret = cal_reserve_pix_proc(ctx->cal);
 		if (ret < 0) {
 			ctx_err(ctx, "Failed to reserve pix proc: %d\n", ret);
-- 
2.47.3

