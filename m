Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A5B6FBF
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 22:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774218617; cv=none; b=RVdDJoy9MEKDWrbS5oTdnJYm7TBGLbs2shRc1h5bUY8OLsemGdN6A61Q5lzhsUQsrqGc4EnDf2FFs+uCYWJHLPrVr24CjebzvvskcsorNNQw8s+FqRdPTUV0ln8jjqIWcabBY9rpWf0r054osnRTH7/bjOqvPyhPePjkwlORsk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774218617; c=relaxed/simple;
	bh=46ReIzd8S7BAS35eN/rpuDUuQrm7ytTbmdr/H9sRwHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mQGwjOFTzPi+zm5btBfNqxGd7FcbDbNlnDKJccUrlit0Lp17F9UboJrs3Vo7glGJS7w/eMGWVhxQAQzjxngxhkkP6gvV9WzIrm2CNMA73/GSB23CWM94wfQnEQyWqS/d198gK5OtBiVkMjsFRTV/6lo5oaw8yrMi3gz3+/QA7eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXp/KV3S; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXp/KV3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774218616; x=1805754616;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=46ReIzd8S7BAS35eN/rpuDUuQrm7ytTbmdr/H9sRwHk=;
  b=YXp/KV3SFty9GfUSJE6D/cVgRlku0MJKUX/SWrqGgubXbnmRYda77SGI
   7POxcoYauJJbpZ5TX9xhw0bgc9q5XPzH0TzJqFmNDhcV+HiJFz7SsS1jb
   VVPHjRRPcPjxYfHuUlAdxXumn+JLqi571YGYXUCmBwHGjFgKnxB+CWZX0
   tNe5286pHHtgWpBshIlvlvEMmtcSIoM+SVp+nEAPiB/rd3Cz0wY19Qym9
   ZY5D2m6xkgCplDzaN1UclDtJqNXT5aGYesxFCpTNt+GigV/dhH8Mlkmri
   frI5C9Mp6FWxpyAUJ/cIzyEwBZox09fVHh6QbcvZlC86qKlS+TZvhzYbS
   w==;
X-CSE-ConnectionGUID: T/vj5on8RlKHGfNlWmRlGA==
X-CSE-MsgGUID: kx+Y4QKwSauWI0SYPTDt5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75290574"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="75290574"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 15:30:15 -0700
X-CSE-ConnectionGUID: ZdywP6AGQQOVGDR7AX54eQ==
X-CSE-MsgGUID: c3Tjq33fR6iwIt/3kemWPA==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.240])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 15:30:13 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4C749121CFA;
	Mon, 23 Mar 2026 00:30:17 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w4RJI-000000036rm-2ZZK;
	Mon, 23 Mar 2026 00:30:16 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 1/1] media: v4l2-subdev: Return an error from set streaming if not supported
Date: Mon, 23 Mar 2026 00:30:16 +0200
Message-ID: <20260322223016.741370-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a sub-device sets neither {enable_streams, disable_streams} pad ops nor
s_stream video op, v4l2_subdev_s_stream_helper() calls
v4l2_subdev_{enable,disable}_streams() recursively, exhausting the stack.
Return -ENOIOCTLCMD if neither op is defined when enable_streams or
disable_streams is called to handle the situation gracefully.

Reported-by: David Heidelberg <david@ixit.cz>
Fixes: b62949ddaa52 ("media: subdev: Support single-stream case in v4l2_subdev_enable/disable_streams()")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 831c69c958b8..f8ea4afc6cbb 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2334,11 +2334,13 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
 
 	/* Fallback on .s_stream() if .enable_streams() isn't available. */
 	use_s_stream = !v4l2_subdev_has_op(sd, pad, enable_streams);
-
-	if (!use_s_stream)
+	if (!use_s_stream) {
 		state = v4l2_subdev_lock_and_get_active_state(sd);
-	else
+	} else {
+		if (!v4l2_subdev_has_op(sd, video, s_stream))
+			return -ENOIOCTLCMD;
 		state = NULL;
+	}
 
 	/*
 	 * Verify that the requested streams exist and that they are not
@@ -2435,11 +2437,13 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
 
 	/* Fallback on .s_stream() if .disable_streams() isn't available. */
 	use_s_stream = !v4l2_subdev_has_op(sd, pad, disable_streams);
-
-	if (!use_s_stream)
+	if (!use_s_stream) {
 		state = v4l2_subdev_lock_and_get_active_state(sd);
-	else
+	} else {
+		if (!v4l2_subdev_has_op(sd, video, s_stream))
+			return -ENOIOCTLCMD;
 		state = NULL;
+	}
 
 	/*
 	 * Verify that the requested streams exist and that they are not
-- 
2.47.3

