Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1344189DD
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573699; cv=none; b=HTgHDXYBJN8hf6AOn3VHTdfAjA0GYRD9/Htv1FFuwj9/PtRqSLEea6MYK/4uddwuv8Ei1fhjz9wxUWJbG+sctdjTcEVwQm5XpZdREgxrAR3uOG3+OOLw47P/thBPf8Clxs06TX4DGHi3UgoVrI+9zArWFjv8IR9S2L/cNJb0rLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573699; c=relaxed/simple;
	bh=lgU240DOU68eyaLYt5Q6gWSGIhKmaCA/s88p0IDqliQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+7U7xB2GywTm6X42n53jfFm+QlYcPhz8nRPiRwtfa65VvPijK6YsLVOncxL8qPAuQfiJGxh50JbUqm0E5jZ2+dAVUu0R6pX8FsX4oWRWv7ixMj6TV5UI2gt5Rn27WiZDo2kaDd0n2dNtfNB77jLWdW7yIuUQhqrWtv5b0kTWSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gr+pGtIf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gr+pGtIf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573697; x=1819109697;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lgU240DOU68eyaLYt5Q6gWSGIhKmaCA/s88p0IDqliQ=;
  b=Gr+pGtIff0SqI+ZhMkhxuncRWHd44u0dNmgs+X83if1G/+Mw+/POj57+
   2DtSzatqjVh07q8PCoOCMES4EqvBgt9bK99ftGA19OSpHbiSETP56rGlL
   vfeZwXz9+48hMIg7c1h8JHkas39kDeiHkREzL9SfRWFGF2uSAXbIAUQfe
   nyPpxe2/1tRIlN9obBbCwSI8RG8HxMBiI0J10R2Top3K7qKEog4nFeDGS
   lQ9i67P+rdzCizuyl3ySKJN4kPryQ3oxEKdWLlWjeeYPT1tep/mYzRGPW
   BKsrR5TnLSinrKQY8eOKyplMkfiT3w++ZfZ1ylWrFV75/WgQ4ljMUwpD7
   g==;
X-CSE-ConnectionGUID: GveP/gHqTj6AKyaPZgAsHA==
X-CSE-MsgGUID: FkPPfHJ6Q/WZ4Mm9wE4TKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036570"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036570"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:51 -0700
X-CSE-ConnectionGUID: e1ncj6kzTw61xTh+sqAnjQ==
X-CSE-MsgGUID: xaB6T/0NT+G5XGfWHvpzOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787670"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:50 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A7EC3122A50;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E3Ai-3SCI;
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
Subject: [PATCH v3 28/29] media: v4l2-subdev: Use v4l2_subdev_get_frame_desc() for passthrough
Date: Mon, 24 Aug 2026 15:14:50 +0300
Message-ID: <20260824121451.3348583-29-sakari.ailus@linux.intel.com>
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

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor in
__v4l2_subdev_get_frame_desc_passthrough(). This is preferred over calling
the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 34 +++++++++++++--------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 8c3c5b6e4ee8..2172bb8313ec 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2558,6 +2558,7 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 					     unsigned int pad,
 					     struct v4l2_mbus_frame_desc *fd)
 {
+	struct v4l2_mbus_frame_desc *source_fd = NULL;
 	struct media_pad *local_sink_pad;
 	struct v4l2_subdev_route *route;
 	struct device *dev = sd->dev;
@@ -2599,9 +2600,6 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 
 	/* Iterate over sink pads */
 	media_entity_for_each_pad(&sd->entity, local_sink_pad) {
-		struct v4l2_mbus_frame_desc source_fd;
-		bool have_source_fd = false;
-
 		if (!(local_sink_pad->flags & MEDIA_PAD_FL_SINK))
 			continue;
 
@@ -2618,7 +2616,7 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 			    route->sink_pad != local_sink_pad->index)
 				continue;
 
-			if (!have_source_fd) {
+			if (!source_fd) {
 				remote_source_pad = media_pad_remote_pad_unique(local_sink_pad);
 				if (IS_ERR(remote_source_pad)) {
 					dev_dbg(dev, "Failed to find remote pad for sink pad %u\n",
@@ -2633,33 +2631,31 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 					goto err_free;
 				}
 
-				ret = v4l2_subdev_call(remote_sd, pad,
-						       get_frame_desc,
-						       remote_source_pad->index,
-						       &source_fd);
-				if (ret) {
+				source_fd = v4l2_subdev_get_frame_desc(remote_sd,
+								       remote_source_pad->index,
+								       fd->type);
+				if (IS_ERR(source_fd)) {
+					ret = PTR_ERR(source_fd);
 					dev_err(dev,
 						"Failed to get frame desc from remote subdev %s\n",
 						remote_sd->name);
 					goto err_free;
 				}
 
-				have_source_fd = true;
-
 				if (fd->num_entries == 0) {
-					fd->type = source_fd.type;
-				} else if (fd->type != source_fd.type) {
+					fd->type = source_fd->type;
+				} else if (fd->type != source_fd->type) {
 					dev_err(dev,
 						"Frame desc type mismatch: %u != %u\n",
-						fd->type, source_fd.type);
+						fd->type, source_fd->type);
 					ret = -EPIPE;
 					goto err_free;
 				}
 			}
 
-			for (unsigned int i = 0; i < source_fd.num_entries; i++) {
-				if (source_fd.entry[i].stream == route->sink_stream) {
-					source_entry = &source_fd.entry[i];
+			for (unsigned int i = 0; i < source_fd->num_entries; i++) {
+				if (source_fd->entry[i].stream == route->sink_stream) {
+					source_entry = &source_fd->entry[i];
 					break;
 				}
 			}
@@ -2684,11 +2680,15 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 
 			fd->num_entries++;
 		}
+
+		v4l2_subdev_free_frame_desc(source_fd);
+		source_fd = NULL;
 	}
 
 	return 0;
 
 err_free:
+	v4l2_subdev_free_frame_desc(source_fd);
 	kfree(fd->entry);
 	fd->entry = fd->entry_mem;
 	fd->num_entries = 0;
-- 
2.47.3

