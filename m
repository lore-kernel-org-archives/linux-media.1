Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4970413780
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573685; cv=none; b=NyMas9Atjj0kIC2acZldi1JC2P2HuHzWWfb0onyIZxM6owrzIX34UFYmi9sXufsUu6mYBo32Qivqw5e58+jVB0TokSq2q+IColWbCGG2XpMBE3xYDpulsnLGs+A2jFyWg/cFJ3YKrdSWszCc2U2fs8xW+TKrLrvxH1uVSjc2d7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573685; c=relaxed/simple;
	bh=RNmY1aDFRPojv5boQNhCgkgGzwJtCgJdvgaBWaKjuOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZzmyDvDlEjeCbb9oK1Vt7qY06ltnKNVGCJQXoYsArszu0qBAKceH1p9Tt2CNbznVq5JbjGtTpztRIdPiAjKbfM3Ymhe3+pEMKJrP87q2I6LNuvb8GjHaqvlQ0eI5M4WBlqQ5hI5U4CAB5F9Fl69rRXbkZDd95+fVDWsH4/k+gSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ceX+EoKm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceX+EoKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573683; x=1819109683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RNmY1aDFRPojv5boQNhCgkgGzwJtCgJdvgaBWaKjuOk=;
  b=ceX+EoKmLYQ3oh0uILMBj+J4qT0HTNMQ2HX37lgSo3+DjoH5P2eEXYM+
   EjYfwY+RNc31Wsl0KD5UDRoTpRIu9WQMVCx8dYovNCBrZKpRKSvsPrkjN
   gq82u5IUxRwznpurL6AqAX2QW4ZUdkMZXmxEUi6VDBr4GOz73Urc7gbSr
   L+jWZ44GJmRoF6hRNHzATe6vz2IpTbtbcK1v7+5+CUTZOwp9QhdSMq7iB
   RkE87cTsoHy3Hll6XLjQ7jNOwoT6LI+8JftRdAJXyn6XXz0kHo5ARBhkK
   Q0y2KP3Z1UZhRNNOnYjxYliHUX8bECEc0PtDIL34CddtRrtMergpn39mw
   A==;
X-CSE-ConnectionGUID: oCGqBA58SIKNJrKnYqFGwQ==
X-CSE-MsgGUID: Urc+whX2QAmtClKTpT5UoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036452"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036452"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:43 -0700
X-CSE-ConnectionGUID: lQAOqjUAQ7+LIGN3d1A/ng==
X-CSE-MsgGUID: 2/2NGAqlTp2LhuvP+JiPQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787638"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:41 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5A2F4121C7B;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E38m-232E;
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
Subject: [PATCH v3 04/29] media: v4l2-subdev: Allow releasing frame descriptors on return
Date: Mon, 24 Aug 2026 15:14:26 +0300
Message-ID: <20260824121451.3348583-5-sakari.ailus@linux.intel.com>
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

Use DEFINE_FREE() to allow using __free() to release frame descriptors
using v4l2_subdev_free_frame_desc().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-subdev.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index e7127953ac22..c10ca3f5d979 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1798,6 +1798,11 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
  * for each frame descriptor obtained by calling this function using
  * v4l2_subdev_free_frame_desc().
  *
+ * Use __free() to release the frame descriptor automatically::
+ *
+ *    struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
+ *            v4l2_subdev_get_frame_desc(sd, pad, desc);
+ *
  * Return: The frame descriptor on success or a negative error code on failure.
  */
 struct v4l2_mbus_frame_desc *
@@ -1812,6 +1817,10 @@ v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
  */
 void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc);
 
+DEFINE_FREE(v4l2_subdev_free_frame_desc, struct v4l2_mbus_frame_desc *, \
+	    if (!IS_ERR_OR_NULL(_T))					\
+		    v4l2_subdev_free_frame_desc(_T))
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
-- 
2.47.3

