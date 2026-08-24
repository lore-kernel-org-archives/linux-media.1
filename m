Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2875C3EFD02
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573690; cv=none; b=OPP8YhXdfcWrah6uiwuWHeHXu4A4+bAsq4rOQSy3c0FenmKjv0CetbUlxJ0VpeMsX9QzrBA0LVNQYAKRlt2+FExXyqaZ1w65qPRnOh23iRBt/++n4o1LpvadCXamCZ2DDes+yVXYlEqIvEI17IWBYlMTfqxG4Pv+70q8KA5FXE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573690; c=relaxed/simple;
	bh=exXKW7HHAhKXzc1NXmkcw15buJ81PxS1Ioo1KHhIqhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+dlZM8uLT4t0JrDz5WTnP53v15cwfiLjErW2iPpYxph3enZ7x1+6+qQ/Z8ecMRJnkxef2KerYV4uXkn+VAA0kvqqdnA6n1qiRxKRAc5Sgzj3gXdkBTASLgElJfgDke6Dc5OTg1QyIwOyPlVIcPI0rVg7b+8e8TcPTVeIFcO3wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itskxqcU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itskxqcU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573689; x=1819109689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=exXKW7HHAhKXzc1NXmkcw15buJ81PxS1Ioo1KHhIqhA=;
  b=itskxqcUHq+IBLhXkj2MOr2SSnoJMs52VDEN41QEVpJbWSlZ3AerK17Y
   pUby10CorHIFngx57zkiukSMjJjLEA1T+p3UE5RpHUqMaQSU30ny9qqu7
   rD5E66/nbldxEosqgD3I9LlxeOiQBZY4yVZ6crSpo/Cslz63QX99fxLB+
   f8xhSU1aQDwG/QjeHtBP1G1sGCv9u1IZCmATWLj3TGqSVFarhp/iMCVaL
   aj5oq6qt4+1XXpEFlX+aSvGtu3kxtzVm44Wx23ma8yMvbALB5AL03oETe
   iQSRv3Ks1cI8pyCy3ws4BxcidPvwbd5K2MmtfHgybt7lUPCWsOwfOplok
   Q==;
X-CSE-ConnectionGUID: /y23BFmUQlOTOsFLUPx3ww==
X-CSE-MsgGUID: VHCaU68GRY+4UxmiJP8SsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036502"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036502"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:47 -0700
X-CSE-ConnectionGUID: XJ4+PHyKSpuqATcOTWKiLw==
X-CSE-MsgGUID: 6MvTvq0bTKimKqnNPlLUJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787647"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5DAC2121C8C;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E38q-26bz;
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
Subject: [PATCH v3 05/29] media: v4l2-subdev: Allow allocating frame descriptors based on the need
Date: Mon, 24 Aug 2026 15:14:27 +0300
Message-ID: <20260824121451.3348583-6-sakari.ailus@linux.intel.com>
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

Frame descriptors entries require a small amount of memory per entry (20
bytes), but if the number of entries in a frame descriptor is large, an
unreasonably large amount of memory would need to be allocated in the
stack. Therefore the number of entries has been limited to 8.

Support larger frame descriptors by making the entry field a pointer that
by default points to a pre-allocated array while the get_frame_desc() pad
o may allocate as much memory as required, up to V4L2_FRAME_DESC_ENTRY_MAX
which is changed to 64.

The caller is also responsible for releasing the allocated memory by
calling v4l2_subdev_free_frame_desc().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 45 ++++++++++++++++++++-------
 include/media/v4l2-subdev.h           | 42 ++++++++++++++++++-------
 2 files changed, 63 insertions(+), 24 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a5c53dc8c396..e15d3f63e004 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -63,10 +63,6 @@ static bool v4l2_subdev_enable_streams_api;
 /*
  * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a set
  * of streams.
- *
- * Note that V4L2_FRAME_DESC_ENTRY_MAX is related: V4L2_FRAME_DESC_ENTRY_MAX
- * restricts the total number of streams in a pad, although the stream ID is
- * not restricted.
  */
 #define V4L2_SUBDEV_MAX_STREAM_ID 63
 
@@ -354,6 +350,7 @@ static int call_set_frame_interval(struct v4l2_subdev *sd,
 static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			       struct v4l2_mbus_frame_desc *fd)
 {
+	unsigned int type;
 	unsigned int i;
 	int ret;
 
@@ -362,16 +359,26 @@ static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		return -EOPNOTSUPP;
 #endif
 
-	memset(fd, 0, sizeof(*fd));
+	type = fd->type;
+	memset_after(fd, 0, type);
+	fd->entry = fd->entry_mem;
+	fd->len_entries = ARRAY_SIZE(fd->entry_mem);
 
 	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
 	if (ret)
 		return ret;
 
+	if (type == V4L2_MBUS_FRAME_DESC_TYPE_UNDEFINED) {
+		type = fd->type;
+	} else if (type != fd->type) {
+		dev_dbg(sd->dev, "Expected frame descriptor type %u, got %u\n",
+			type, fd->type);
+		return -EINVAL;
+	}
+
 	dev_dbg(sd->dev, "Frame descriptor on pad %u, type %s\n", pad,
-		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
-		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" :
-		"unknown");
+		type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
+		type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" : "unknown");
 
 	for (i = 0; i < fd->num_entries; i++) {
 		struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[i];
@@ -1086,9 +1093,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		 * descriptor accordingly, with up to one entry per route. Until
 		 * the frame descriptors entries get allocated dynamically,
 		 * limit the number of active routes to
-		 * V4L2_FRAME_DESC_ENTRY_MAX.
+		 * V4L2_FRAME_DESC_ENTRY_PREALLOC.
 		 */
-		if (num_active_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		if (num_active_routes > V4L2_FRAME_DESC_ENTRY_PREALLOC)
 			return -E2BIG;
 
 		/*
@@ -2638,7 +2645,7 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 				return -EPIPE;
 			}
 
-			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
+			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_PREALLOC) {
 				dev_dbg(dev, "Frame desc entry limit reached\n");
 				return -E2BIG;
 			}
@@ -2703,6 +2710,14 @@ v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			goto err_free;
 		}
 
+		if (desc->num_entries > desc->len_entries) {
+			dev_dbg(sd->dev,
+				"too many frame descriptors; got %u, expected at most %u\n",
+				desc->num_entries, desc->len_entries);
+			ret = -EINVAL;
+			goto err_free;
+		}
+
 		return desc;
 	}
 
@@ -2717,7 +2732,10 @@ v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	if (ret < 0)
 		goto err_free;
 
-	struct v4l2_mbus_frame_desc_entry *entry = &desc->entry[0];
+	desc->entry = desc->entry_mem;
+	desc->len_entries = ARRAY_SIZE(desc->entry_mem);
+
+	struct v4l2_mbus_frame_desc_entry *entry = desc->entry;
 
 	entry->pixelcode = subdev_fmt.format.code;
 
@@ -2742,6 +2760,9 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
 
 void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc)
 {
+	if (desc->entry != desc->entry_mem)
+		kfree(desc->entry);
+
 	kfree(desc);
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_free_frame_desc);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index c10ca3f5d979..daebf8982c43 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -366,11 +366,13 @@ struct v4l2_mbus_frame_desc_entry {
 	} bus;
 };
 
- /*
-  * If this number is too small, it should be dropped altogether and the
-  * API switched to a dynamic number of frame descriptor entries.
-  */
-#define V4L2_FRAME_DESC_ENTRY_MAX	8
+/* Size of the statically allocated frame descriptor array. */
+#define V4L2_FRAME_DESC_ENTRY_PREALLOC	8
+/*
+ * Maximum number of dynamically allocated frame descriptors. Note that
+ * V4L2_SUBDEV_MAX_STREAM_ID is related to this limit as well.
+ */
+#define V4L2_FRAME_DESC_ENTRY_MAX	64
 
 /**
  * enum v4l2_mbus_frame_desc_type - media bus frame description type
@@ -393,13 +395,17 @@ enum v4l2_mbus_frame_desc_type {
 /**
  * struct v4l2_mbus_frame_desc - media bus data frame description
  * @type: type of the bus (enum v4l2_mbus_frame_desc_type)
- * @entry: frame descriptors array
- * @num_entries: number of entries in @entry array
+ * @entry_mem: memory for the frame descriptors (@entry)
+ * @entry: pointer to the frame descriptors
+ * @num_entries: number of entries in @entry
+ * @len_entries: number of entries allocated for @entry
  */
 struct v4l2_mbus_frame_desc {
 	enum v4l2_mbus_frame_desc_type type;
-	struct v4l2_mbus_frame_desc_entry entry[V4L2_FRAME_DESC_ENTRY_MAX];
+	struct v4l2_mbus_frame_desc_entry entry_mem[V4L2_FRAME_DESC_ENTRY_PREALLOC];
+	struct v4l2_mbus_frame_desc_entry *entry;
 	unsigned short num_entries;
+	unsigned short len_entries;
 };
 
 /**
@@ -781,7 +787,17 @@ struct v4l2_subdev_state {
  * @link_validate: used by the media controller code to check if the links
  *		   that belongs to a pipeline can be used for stream.
  *
- * @get_frame_desc: get the current low level media bus frame parameters.
+ * @get_frame_desc: get the current low level media bus frame parameters. The
+ *		    callback is required to update the num_entries field to the
+ *		    total number of entries in the frame descriptor. The
+ *		    callback shall fill the first entries array up to
+ *		    len_entries, which signifies the number of entries
+ *		    allocated. If the number of entries needed exceeds
+ *		    len_entries, allocate enough memory using kzalloc_objs() or
+ *		    a similar function returning kmalloc() memory. Never call
+ *		    this directly in drivers, use v4l2_subdev_get_frame_desc()
+ *		    instead. The maximum number of num_entries is
+ *		    V4L2_FRAME_DESC_ENTRY_MAX.
  *
  * @set_frame_desc: set the low level media bus frame parameters, @fd array
  *                  may be adjusted by the subdev driver to device capabilities.
@@ -1794,8 +1810,9 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
  *
  * The caller is required to set @desc->type to the expected bus type.
  *
- * The caller is required to release the memory of the frame descriptor entries
- * for each frame descriptor obtained by calling this function using
+ * The entries in the frame descriptor are allocated based on the need. The
+ * caller is required to release the memory of the frame descriptor entries for
+ * each frame descriptor obtained by calling this function using
  * v4l2_subdev_free_frame_desc().
  *
  * Use __free() to release the frame descriptor automatically::
@@ -1813,7 +1830,8 @@ v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
  * v4l2_subdev_free_frame_desc() - Release the memory of a frame descriptor
  * @desc: A pointer to a frame descriptor
  *
- * Release the frame descriptor.
+ * Release the frame descriptor entries in a frame descriptor as well as the
+ * frame descriptor itself.
  */
 void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc);
 
-- 
2.47.3

