Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273CE419FC5
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573699; cv=none; b=SB/5+RSkdV6y00hmSYYzQ6pmAyk+0ASgO/MlQgg/ifzhkz4tYdgXEncQB9JFOMhFlGSPebd0HyZ63EVnO+fld+4gIyXFSCglGU8GZSZG8PyjTsScIra3f1xanKBg1b+uCGBgoer+oBkeNpuJKOr5I/KLsZSaBePbCXYSGPJcrkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573699; c=relaxed/simple;
	bh=+5ysEBYePwxoCQMQNv3vK/miPxqepgMu/PzqkdN0ugE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qokpsu8jGEdjAgZkGpavLTQY2JmgSX9CkYE+WGlVqGNrn6hWFdpBdlBpIfmytCMP4tMdAaYJdibSXutXwf/bHEZFfrLMW6ena3YF+4BrzPAMwUk3l37s50RpTIBzSJqP/d0UHlnjyrZW0ZuXeTxist827uve4BvUDgDFlgrXpJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iglHfU8/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iglHfU8/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573698; x=1819109698;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+5ysEBYePwxoCQMQNv3vK/miPxqepgMu/PzqkdN0ugE=;
  b=iglHfU8/VwZwlAiAbUCDEv1od/eA7/rMeONkoy5tms6lNvW9ndlrSQWq
   6n4HAxvOAR9dm98ZosZnfahdZptPjrt4OI2QryLBDcwKGlXhNUGG/ztAh
   CCkyADoxViGJt6YzgizwoX54QFHBajgSrDWpP+r8Gz+0hZXAEhmMWCOlf
   lr/e8lNBOEZyvb9vvtSQsURyOK1pmJ/VU+f7dXIln+LeQHx9CyKAR3P7f
   FhlZ3zEmnLQQzn/HC5DBnqNOhaiKc22mQ7VUWOxPxgE+lxs74Be0Bl+Vr
   PkJ1dbxQnGfbAAx6uax8xfkcFTGJN+C0miqSUm6Uv32AA+pLO054d6efZ
   w==;
X-CSE-ConnectionGUID: kJYyGTivTUq0gLm04LQiZg==
X-CSE-MsgGUID: 9q7xHZZSRtqzjhPZcPaA0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036578"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036578"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:52 -0700
X-CSE-ConnectionGUID: b5sJwCueTpK9+QxP66WHsw==
X-CSE-MsgGUID: VrQjU2vASUOJ60fjK3goBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787666"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:50 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7D077121F29;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E39f-2iLT;
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
Subject: [PATCH v3 15/29] media: v4l2-subdev: Return dynamically allocated pass-through routes
Date: Mon, 24 Aug 2026 15:14:37 +0300
Message-ID: <20260824121451.3348583-16-sakari.ailus@linux.intel.com>
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

Count the number of pass-through routes, allocate memory and then return
the full table to the caller.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 61 +++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 9 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index c9f38b0313eb..d34704aad88e 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2561,13 +2561,42 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 	struct media_pad *local_sink_pad;
 	struct v4l2_subdev_route *route;
 	struct device *dev = sd->dev;
-	int ret = 0;
+	unsigned int num_entries = 0;
+	int ret;
 
 	lockdep_assert_held(state->lock);
 
 	if (WARN_ON(!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
 		return -EINVAL;
 
+	/* Count the number of entries first */
+	media_entity_for_each_pad(&sd->entity, local_sink_pad) {
+		if (!(local_sink_pad->flags & MEDIA_PAD_FL_SINK))
+			continue;
+
+		for_each_active_route(&state->routing, route) {
+			if (route->source_pad != pad ||
+			    route->sink_pad != local_sink_pad->index)
+				continue;
+
+			num_entries++;
+
+			if (num_entries > V4L2_FRAME_DESC_ENTRY_MAX)
+				return -E2BIG;
+		}
+	}
+
+	if (num_entries > V4L2_FRAME_DESC_ENTRY_MAX)
+		return -E2BIG;
+
+	if (num_entries > V4L2_FRAME_DESC_ENTRY_PREALLOC) {
+		fd->entry = kzalloc_objs(*fd->entry, num_entries, GFP_KERNEL);
+		if (!fd->entry)
+			return -ENOMEM;
+
+		fd->len_entries = num_entries;
+	}
+
 	/* Iterate over sink pads */
 	media_entity_for_each_pad(&sd->entity, local_sink_pad) {
 		struct v4l2_mbus_frame_desc source_fd;
@@ -2594,12 +2623,15 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 				if (IS_ERR(remote_source_pad)) {
 					dev_dbg(dev, "Failed to find remote pad for sink pad %u\n",
 						local_sink_pad->index);
-					return PTR_ERR(remote_source_pad);
+					ret = PTR_ERR(remote_source_pad);
+					goto err_free;
 				}
 
 				remote_sd = media_entity_to_v4l2_subdev(remote_source_pad->entity);
-				if (!remote_sd)
-					return -EINVAL;
+				if (!remote_sd) {
+					ret = -EINVAL;
+					goto err_free;
+				}
 
 				ret = v4l2_subdev_call(remote_sd, pad,
 						       get_frame_desc,
@@ -2609,7 +2641,7 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 					dev_err(dev,
 						"Failed to get frame desc from remote subdev %s\n",
 						remote_sd->name);
-					return ret;
+					goto err_free;
 				}
 
 				have_source_fd = true;
@@ -2620,7 +2652,8 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 					dev_err(dev,
 						"Frame desc type mismatch: %u != %u\n",
 						fd->type, source_fd.type);
-					return -EPIPE;
+					ret = -EPIPE;
+					goto err_free;
 				}
 			}
 
@@ -2635,12 +2668,14 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 				dev_dbg(dev,
 					"Failed to find stream %u from source frame desc\n",
 					route->sink_stream);
-				return -EPIPE;
+				ret = -EPIPE;
+				goto err_free;
 			}
 
-			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_PREALLOC) {
+			if (fd->num_entries >= fd->len_entries) {
 				dev_dbg(dev, "Frame desc entry limit reached\n");
-				return -E2BIG;
+				ret = -E2BIG;
+				goto err_free;
 			}
 
 			fd->entry[fd->num_entries] = *source_entry;
@@ -2652,6 +2687,14 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 	}
 
 	return 0;
+
+err_free:
+	kfree(fd->entry);
+	fd->entry = fd->entry_mem;
+	fd->num_entries = 0;
+	fd->len_entries = V4L2_FRAME_DESC_ENTRY_PREALLOC;
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(__v4l2_subdev_get_frame_desc_passthrough);
 
-- 
2.47.3

