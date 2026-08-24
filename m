Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0F841686A
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573694; cv=none; b=Uo1ZuPDOudKmcHnbKBdfCjo6sqz9C9fAEnR7gkbFOaZTNJXf6Fx2v1hPgVFXi1IBRWHcO3lBgTNz27pGleQ37x8cpQ0fxZbL0y2/nC48OLy/5455QvwxEt8kHezM6ZLSbu3jeuMYYYS4uqzOGcYe6VKZbEpqZvOn1erA5mL+9ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573694; c=relaxed/simple;
	bh=PqYwr311acoUS5FEdqrqTdmxr3ydf+5HKltvKVbS+EM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mMtVXy3UvL5axk9bkr+FmlPPzV2lj3qK0MvNOeCKSiVVzhwjPZIBJrlAQlRA6CQ7CpIl4d5mzD2Af8iN/FEbQbR4Mny1s4woNBfNKgR1YOkCyY2Z01amnY3W+4woVNign6ms+vTHgpcfao4VyrSfnxiy1tc9whprz5vsxEc7aQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E2RfLRuD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2RfLRuD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573693; x=1819109693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PqYwr311acoUS5FEdqrqTdmxr3ydf+5HKltvKVbS+EM=;
  b=E2RfLRuDSMcqgvK+LaEDo84Mw3+gOA2BtZWjyI2zhzpvZgysaHL7ce1R
   d3bLyIomnfVh1sPGhruB7lHfw2h7M2Un1vzYiGW3AMoUAc7EF/AglkCkZ
   /ZW2rHJ0GxMHBW3pcarYTfKjWkDTvwKXRpCFbL4EW488EmUfKJ3wJYUF9
   pQhHnJGdnmCh3UBoAiVTrecSqeXkdn/QzLmNN6FeWU0m+443ytiJEx0XN
   S+/YSRwiqHI42S9tAVCAsvHtMy2khZ6/4XIxnJ8qfz51XGrIcu6lcVa4i
   VEiECJpj5sUTStc6FSdC9GowV2z5UZm3eEMURXmKmzNi2FaaHNVfny3ny
   A==;
X-CSE-ConnectionGUID: WbPvvhOkTR2dyZ/guXomDA==
X-CSE-MsgGUID: S9nRYB0ESEWtA4ScTLmH/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036526"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036526"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:47 -0700
X-CSE-ConnectionGUID: MHhp0FZLTzGh17JPYd3wdw==
X-CSE-MsgGUID: aH9doaj9TfaNX5l1Qdr/JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787650"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 63721121DEE;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E38y-2FNX;
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
Subject: [PATCH v3 07/29] media: v4l2-subdev: Add frame descriptor passthrough for CSI-2 and DVP
Date: Mon, 24 Aug 2026 15:14:29 +0300
Message-ID: <20260824121451.3348583-8-sakari.ailus@linux.intel.com>
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

Add frame descriptor pass-through functions specific to MIPI CSI-2 and DVP
(parallel) interfaces. The two new functions are needed in order to
support frame descriptor-less sub-device drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 20 +++++++++++
 include/media/v4l2-subdev.h           | 49 +++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 071657459202..f5fa62038754 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2672,6 +2672,26 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough);
 
+int v4l2_subdev_get_frame_desc_passthrough_dvp(struct v4l2_subdev *sd,
+					       unsigned int pad,
+					       struct v4l2_mbus_frame_desc *fd)
+{
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
+
+	return v4l2_subdev_get_frame_desc_passthrough(sd, pad, fd);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough_dvp);
+
+int v4l2_subdev_get_frame_desc_passthrough_csi2(struct v4l2_subdev *sd,
+						unsigned int pad,
+						struct v4l2_mbus_frame_desc *fd)
+{
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	return v4l2_subdev_get_frame_desc_passthrough(sd, pad, fd);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough_csi2);
+
 struct v4l2_mbus_frame_desc *
 v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			   enum v4l2_mbus_frame_desc_type type)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index daebf8982c43..80ae7649f5c7 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1795,6 +1795,55 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 					   unsigned int pad,
 					   struct v4l2_mbus_frame_desc *fd);
 
+/**
+ * v4l2_subdev_get_frame_desc_passthrough_dvp() - Helper to implement the subdev
+ *	get_frame_desc operation in simple passthrough cases for DVP
+ * @sd: The subdevice
+ * @pad: The source pad index
+ * @fd: The mbus frame desc
+ *
+ * This function locks the subdevice's active state, calls
+ * __v4l2_subdev_get_frame_desc_passthrough(), and unlocks the state.
+ *
+ * This function can be assigned directly as the .get_frame_desc callback in
+ * &v4l2_subdev_pad_ops for subdevices that pass streams through without
+ * modification. Drivers that need to perform additional work should use
+ * __v4l2_subdev_get_frame_desc_passthrough() in their custom
+ * .get_frame_desc implementation instead.
+ *
+ * This callback can be used for the DVP (Digital Video Port), also often called
+ * simply the "parallel interface".
+ *
+ * Return: 0 on success, or a negative error code otherwise.
+ */
+int v4l2_subdev_get_frame_desc_passthrough_dvp(struct v4l2_subdev *sd,
+					       unsigned int pad,
+					       struct v4l2_mbus_frame_desc *fd);
+
+/**
+ * v4l2_subdev_get_frame_desc_passthrough_csi2() - Helper to implement the subdev
+ *	get_frame_desc operation in simple passthrough cases for MIPI CSI-2
+ * @sd: The subdevice
+ * @pad: The source pad index
+ * @fd: The mbus frame desc
+ *
+ * This function locks the subdevice's active state, calls
+ * __v4l2_subdev_get_frame_desc_passthrough(), and unlocks the state.
+ *
+ * This function can be assigned directly as the .get_frame_desc callback in
+ * &v4l2_subdev_pad_ops for subdevices that pass streams through without
+ * modification. Drivers that need to perform additional work should use
+ * __v4l2_subdev_get_frame_desc_passthrough() in their custom
+ * .get_frame_desc implementation instead.
+ *
+ * This callback can be used for the MIPI CSI-2 interface.
+ *
+ * Return: 0 on success, or a negative error code otherwise.
+ */
+int v4l2_subdev_get_frame_desc_passthrough_csi2(struct v4l2_subdev *sd,
+						unsigned int pad,
+						struct v4l2_mbus_frame_desc *fd);
+
 /**
  * v4l2_subdev_get_frame_desc() - Get a frame descriptor for a pad
  * @sd: The sub-device
-- 
2.47.3

