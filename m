Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6986414A38
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573687; cv=none; b=jxrjp1L31hbdIZyX08uWsqKSHOmwaR8DB2WhSLJ6km5DmOvcUzC/d47JuZSmzpOmG4g5TnDc2+4NG+xhlZ3j/j5gOSNArnPpvIqhlaZfXOuAFLXLyExL38sxDl8N8FrSHHXegUkPuNPwaolKZF+VVs4xvgYYlBvTg1y32WGvm6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573687; c=relaxed/simple;
	bh=VRC3oflD7RFwluiGXbQjB+Bqpth99TM2Y2DfihlowJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cI1finSNXBFOfOnjRXqKjNgX84KKspbQrrRCCtISrYoufTZiswsdF/ikiOsxShmaXPwtrFgXswIUV7xVnNIlr9QQWvCN/FQSKfoTbqw8vUq+3XHxLM6vW/hp7s4twiQfew5yXhdsCq8bJEk/viouPYQKdM9zZkd1UoUw1vAbcBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpEM1Eq/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpEM1Eq/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573685; x=1819109685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VRC3oflD7RFwluiGXbQjB+Bqpth99TM2Y2DfihlowJg=;
  b=CpEM1Eq/6qOndsRzcdVMieNGYMoxccETYWSVNZ93ppl/ZQd4Pi5shuIP
   3Gr0iC36rt2Els1cNPS/1t1nqDM8+bHPHlC7UNB0NFVwtTTwrajU/gtXb
   5H1GZD7UxLQj1h6DQ1wLIDov+C6biHffLPoC1ED5sRXJpYErH6fX29I/G
   zlEnTBc2NTnnInwRq1Qhr6yfYbsn9tVq8dcKh7Y2pg+oubymECXUyuXIi
   wkMsqbUc+m+Cl+1B7vn7B92DpJmsPe0QS8W+E5l20PZzKnqZXfY/8/53U
   7eDImxCN8/T05067891YyqJkkDXSRr85ywsCLFllb1fMk1G6QWtABPXoq
   A==;
X-CSE-ConnectionGUID: vbb/KicNREm1T692SJKscw==
X-CSE-MsgGUID: jMuOyLgrTQa1VyYR9cebrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036461"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036461"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:43 -0700
X-CSE-ConnectionGUID: k7KgCIPiRp+2up+FzJkRxQ==
X-CSE-MsgGUID: i9dygKO2QpiwGN9ln4HpUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787637"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:41 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5702B121C43;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E38i-1yjh;
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
Subject: [PATCH v3 03/29] media: v4l2-subdev: Prepare for changes in getting frame descriptors
Date: Mon, 24 Aug 2026 15:14:25 +0300
Message-ID: <20260824121451.3348583-4-sakari.ailus@linux.intel.com>
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

Introduce v4l2_subdev_alloc_frame_desc() and v4l2_subdev_free_frame_desc()
to both facilitate implementing drivers that need frame descriptors as
well as prepare for having a larger number of frame descriptors.
If the remote sub-device does not support frame descriptors,
v4l2_subdev_get_frame_desc() creates one (with a single entry)
opportunistically, thus avoiding the need to add frame descriptor support
to sensor drivers the device for which only generates a single stream, or
managing the situation on the caller side.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 75 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 34 ++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d93ed50255ed..a5c53dc8c396 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -20,6 +20,7 @@
 #include <linux/version.h>
 #include <linux/videodev2.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -2671,6 +2672,80 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough);
 
+struct v4l2_mbus_frame_desc *
+v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			   enum v4l2_mbus_frame_desc_type type)
+{
+	int ret;
+
+	if (type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL &&
+	    type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+		return ERR_PTR(-EINVAL);
+
+	struct v4l2_mbus_frame_desc *desc = kzalloc_obj(*desc, GFP_KERNEL);
+	if (!desc)
+		return ERR_PTR(-ENOMEM);
+
+	desc->type = type;
+
+	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
+		unsigned int type = desc->type;
+
+		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
+		if (ret < 0)
+			goto err_free;
+
+		if (desc->type != type) {
+			dev_dbg(sd->dev,
+				"wrong type of frame descriptor for pad %d (got %u, expected %u)\n",
+				pad, desc->type, type);
+			ret = -EINVAL;
+			goto err_free;
+		}
+
+		return desc;
+	}
+
+	struct v4l2_subdev_format subdev_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = pad,
+	};
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_lock_and_get_active_state(sd);
+	ret = v4l2_subdev_call(sd, pad, get_fmt, state, &subdev_fmt);
+	v4l2_subdev_unlock_state(state);
+	if (ret < 0)
+		goto err_free;
+
+	struct v4l2_mbus_frame_desc_entry *entry = &desc->entry[0];
+
+	entry->pixelcode = subdev_fmt.format.code;
+
+	if (desc->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		ret = media_bus_fmt_to_csi2_dt(subdev_fmt.format.code);
+		if (ret < 0)
+			goto err_free;
+
+		entry->bus.csi2.dt = ret;
+	}
+
+	desc->num_entries = 1;
+
+	return desc;
+
+err_free:
+	v4l2_subdev_free_frame_desc(desc);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
+
+void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc)
+{
+	kfree(desc);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_free_frame_desc);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d256b7ec8f84..e7127953ac22 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -8,6 +8,7 @@
 #ifndef _V4L2_SUBDEV_H
 #define _V4L2_SUBDEV_H
 
+#include <linux/cleanup.h>
 #include <linux/types.h>
 #include <linux/v4l2-subdev.h>
 #include <media/media-entity.h>
@@ -1778,6 +1779,39 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 					   unsigned int pad,
 					   struct v4l2_mbus_frame_desc *fd);
 
+/**
+ * v4l2_subdev_get_frame_desc() - Get a frame descriptor for a pad
+ * @sd: The sub-device
+ * @pad: The number of the pad in @sd from which to obtain the frame descriptor
+ * @type: The type of the frame descriptor
+ *
+ * Obtain a frame descriptor from a sub-device. If the sub-device supports the
+ * get_frame_desc pad operation, its result is returned, just like calling it
+ * directly using v4l2_subdev_call(). If the sub-device driver does not support
+ * it, then a frame descriptor containing a single entry is created using the
+ * information from the sub-device format for types
+ * V4L2_MBUS_FRAME_DESC_TYPE_CSI2 and V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL.
+ *
+ * The caller is required to set @desc->type to the expected bus type.
+ *
+ * The caller is required to release the memory of the frame descriptor entries
+ * for each frame descriptor obtained by calling this function using
+ * v4l2_subdev_free_frame_desc().
+ *
+ * Return: The frame descriptor on success or a negative error code on failure.
+ */
+struct v4l2_mbus_frame_desc *
+v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			   enum v4l2_mbus_frame_desc_type type);
+
+/**
+ * v4l2_subdev_free_frame_desc() - Release the memory of a frame descriptor
+ * @desc: A pointer to a frame descriptor
+ *
+ * Release the frame descriptor.
+ */
+void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
-- 
2.47.3

