Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3D93E1D0B
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122601; cv=none; b=Mqj/75uWJBauPAwan/6cK9I6cB5YSqdy74nPmuea0lVSXBHtnhC1sxcWD0jlNLNSFOoSR6mPH3UWbhgQhoVWj/O2ahkxy5+CsqFABxuRLxOW7HeFR60ESGC5si86Cp2AkExbNzXUJsCf2/OKDSxrnCAHErsmitvk1aKOOgtQUJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122601; c=relaxed/simple;
	bh=RNmY1aDFRPojv5boQNhCgkgGzwJtCgJdvgaBWaKjuOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzdpbf9gjM/IpEWgJLSYPEs23auSyusZLQBVLt0HRKaIhIQE3bghVxhtZdlgLfK976IB+Arz1Ma9O1F0vdZMAE9lTP/tx0D5LJS5hXYkWvPGRrorFx7SIfPiE2QjELQE4uEU0a6Fi15FypYQxY0pdDdk6VafMnOexoehToT/hSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpT/068g; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpT/068g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122600; x=1810658600;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RNmY1aDFRPojv5boQNhCgkgGzwJtCgJdvgaBWaKjuOk=;
  b=lpT/068gtaLWcPjXn37hq2x4UU5vfpMOBIKqvmlKkjhePRE9dC6cS/bl
   fXI9kahGVI1rxV0UVrbinjoAsbg/iYRJ4EZTNW8PhMPIWiPuESUujviMb
   gq91QzjgGL4gDEpW97/jS/tJD1ujM5R81+vizjiqmMh05X92LYRLwIHel
   q277cTABQclSqUwu5J5uXavMeBycaWopk2LalgW/9lgrrVt6cCqpxi4XF
   rYNAHtY1xLNWkh163P0mYCmZ5Hrw9dCjmkiFZXn8qJurqYpc143YJpbnr
   W8p7+NnX2NQY8+jsa6gJN3LpUtLqoCMDC/zlmZM8XxFICJCs2+Hf6sEgc
   A==;
X-CSE-ConnectionGUID: N2sJ8uRqS+OXpISXR2c/+A==
X-CSE-MsgGUID: baSQ22/AQ5iBfvOPtk1pRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413815"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413815"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:20 -0700
X-CSE-ConnectionGUID: mt+4hcnkQmmHpH5wvMqhmw==
X-CSE-MsgGUID: Yb0VXC4lTOqxpzGeQg39xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019135"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:17 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2C836121CD8;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E89l-0TgJ;
	Mon, 18 May 2026 19:43:18 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Frank Li <Frank.li@nxp.com>
Subject: [PATCH v2 04/17] media: v4l2-subdev: Allow releasing frame descriptors on return
Date: Mon, 18 May 2026 19:43:04 +0300
Message-ID: <20260518164318.3367888-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
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

