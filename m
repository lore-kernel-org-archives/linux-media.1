Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC714189DD
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573696; cv=none; b=ExZsX67ClfleXMznftjAgUzdUWq7/RKQUt9Pu0kjsJy0KFBj/9brGtqtAEt/WprwcwuGTidQHaYdvDqR4ke69eiFV9CrP6qCD19zdyYL8Bn5JVeIjUZIkixvFu814H4lhk4P5/db3MBRticnavdZKJVCaVTHDhHr4FXEe0+J0Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573696; c=relaxed/simple;
	bh=kC0YH+trolAKGgZLYonk97NQCKApmDrg6R9ElYl8JZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bN+vzK85gmyzuTqPrzPeGoW5/FAioDkhSxZZU8aNbI4I06Gjbsh5Ztr6Z1j7Ywqds6Up2hOutEJk8SKgnanZlXea+5/pJs6zetEZo3DdIU4XW+xYwmhHmzBpZF5IOwMAf0FTpG53y6Vrp907HRiNIvpqq3mkjzMSKVDEuPYnjpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QI/LtwOu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QI/LtwOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573695; x=1819109695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kC0YH+trolAKGgZLYonk97NQCKApmDrg6R9ElYl8JZ4=;
  b=QI/LtwOuewbNZM7KcLxXj6ykgWb/EIuQdSMWuaXhXBUjM27DE3rhzcab
   FloYO26HkLoeizJ0WG6bU4Gg/kl35T+6OHsOHUxSDEeBb4AYajgf89dE1
   UjyrVyPfnZlV3oo7CwJvCCkWTHg9Udf6KS2Up4YeHEBcxXfEk0L3C7NOt
   4tcpBuF/oz89rnd19FU9RtpUda9kudHWPiuU8AuBID4tSHejywBUvpsZs
   6+0m/Lmagmqjdb/zzvVLoFS1LQQcAiL38euo07B9+DE2nvXNNFNyu7HC8
   D9AUm8Ery0s4N0UCCn6eDZ34GGkLG9o6/tCet7ZIUlonC1svXj7Efr1kt
   A==;
X-CSE-ConnectionGUID: gyykAD92ScK4dBG8TPEG7A==
X-CSE-MsgGUID: 3GCtmESeTgurak98WFYdSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036566"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036566"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:51 -0700
X-CSE-ConnectionGUID: MhXQJ/QXT/e7znoSmchsnA==
X-CSE-MsgGUID: /w22N8zcQ3iQYVARcM4mYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787668"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:50 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AB544122A66;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E3Ao-3W76;
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
Subject: [PATCH v3 29/29] media: j721e-csi2rx: Use v4l2_subdev_get_frame_desc()
Date: Mon, 24 Aug 2026 15:14:51 +0300
Message-ID: <20260824121451.3348583-30-sakari.ailus@linux.intel.com>
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
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 32 +++++++------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 4769931b1930..9152f6ba6d7d 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -909,10 +909,7 @@ static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
 {
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_ctx *curr_ctx;
-	struct v4l2_mbus_frame_desc fd;
 	struct media_pad *source_pad;
-	const struct ti_csi2rx_fmt *fmt;
-	int ret;
 	unsigned int i, j;
 
 	/* Get the frame desc from source */
@@ -920,20 +917,15 @@ static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
 	if (IS_ERR(source_pad))
 		return PTR_ERR(source_pad);
 
-	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, source_pad->index, &fd);
-	if (ret) {
-		if (ret == -ENOIOCTLCMD) {
-			ctx->vc = 0;
-			fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
-			ctx->dt = fmt->csi_dt;
-		}
-		return ret;
-	}
-
-	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
-		return -EINVAL;
+	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
+		v4l2_subdev_get_frame_desc(csi->source, source_pad->index,
+					   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (IS_ERR(fd))
+		return PTR_ERR(fd);
 
 	for (i = 0; i < csi->num_ctx; i++) {
+		int ret;
+
 		curr_ctx = &csi->ctx[i];
 
 		/* Capture VC 0 by default */
@@ -943,15 +935,15 @@ static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
 		if (ret)
 			continue;
 
-		for (j = 0; j < fd.num_entries; j++) {
-			if (curr_ctx->stream == fd.entry[j].stream) {
-				curr_ctx->vc = fd.entry[j].bus.csi2.vc;
-				curr_ctx->dt = fd.entry[j].bus.csi2.dt;
+		for (j = 0; j < fd->num_entries; j++) {
+			if (curr_ctx->stream == fd->entry[j].stream) {
+				curr_ctx->vc = fd->entry[j].bus.csi2.vc;
+				curr_ctx->dt = fd->entry[j].bus.csi2.dt;
 				break;
 			}
 
 			/* Return error if no matching stream found */
-			if (j == fd.num_entries)
+			if (j == fd->num_entries)
 				return -EINVAL;
 		}
 	}
-- 
2.47.3

