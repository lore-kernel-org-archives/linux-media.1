Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A95D389E16
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 12:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898110; cv=none; b=nNiujXCpCiVWbZNy6G/GDLAVToYt8B/7dVtDsgMbou7l7PSLRn5bEt9GKRrpw+yB3dnWa6AOH/RzgPzndiKCUFSqgTR1B4WKKZPi1y9acYhwox54uCpGNKIRT4l0cgC2ajg1+t5rPOX2q2iXxQr1EqQ+Xshlfg9G5RaATtXYPxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898110; c=relaxed/simple;
	bh=dJ1rCw2AJeqI7XmfDieveHBn75GsqkHPx1rx5J8kOHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gStkTkP6nI/mQCPiZgwERDs+k/kSXWQbLz12Hkjl8BkLAJ4Iad8ypeQvvFHez9HFAE5dSC3R5VRvpgY9YhGtbKaf9aVAOiW1CR+GGm96YDwPSMB4C9nl+D60UOHQHjTY/A8K8kIwse+EPeuP7Hr8T9ehbD5gB/blt0Rlic8bslI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUQ6y/II; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUQ6y/II"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777898108; x=1809434108;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dJ1rCw2AJeqI7XmfDieveHBn75GsqkHPx1rx5J8kOHo=;
  b=hUQ6y/IImpD98fM8+9BaKm7YZynOt850gmAaToMy5+vh8WKBx8zzrxIO
   dBQbwEFvcmtsdMArFV39d/F7SP3281Fi7WshWBgKVqpOldoUrgBzo5rap
   fPGt9XMval5Zkt8N8YdVRPw7UmgU6L28kUrCpEYlAPv8DkxaluzQnlei2
   RDGQPZ7gDfhtWuqCRnEFNz2wInjnX9AcmK9zfEJ0ElKSMAJhnpJBMgJNA
   jeQZmbPlkLlI6vcvs2m3yLMCCOwBvBBWlxIVVC6snwV/h8D1CX1EOCZZk
   6SwEeYzy6NBfLLotKH79Ji7GciTjW8cDUOQ6Ef5QeRABSpZCe5/HL+kIK
   A==;
X-CSE-ConnectionGUID: 42MFBobtS3CYMDsDhOWYVg==
X-CSE-MsgGUID: 3fETG+TXST2/HG86BOjL/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78852522"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="78852522"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 05:35:07 -0700
X-CSE-ConnectionGUID: lRrvCg/DTBGN+UY4+G7oZQ==
X-CSE-MsgGUID: BQWB3oh6RkiV5jBpDOI2RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="232356257"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.114])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 05:35:06 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BE8E6121CC4;
	Mon, 04 May 2026 15:35:04 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wJsVr-00000001kUi-3ufn;
	Mon, 04 May 2026 15:35:03 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Heidelberg <david@ixit.cz>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 1/1] media: v4l2-subdev: Fail {enable,disable}_streams and s_streaming nicely
Date: Mon,  4 May 2026 15:35:03 +0300
Message-ID: <20260504123503.417044-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a sub-device does not set enable_streams() and disable_streams() pad
ops while it sets the s_stream() video op to
v4l2_subdev_s_stream_helper(), enabling or disabling streaming either way
on the sub-device will result calling v4l2_subdev_s_stream_helper() and
v4l2_subdev_{enable,disable}_streams() recursively, exhausting the stack.
Return -ENOIOCTLCMD in this case to handle the situation gracefully.

Reported-by: David Heidelberg <david@ixit.cz>
Fixes: b62949ddaa52 ("media: subdev: Support single-stream case in v4l2_subdev_enable/disable_streams()")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v2:

- Move the check, with checking the pad ops, to
  v4l2_subdev_s_stream_helper().

 drivers/media/v4l2-core/v4l2-subdev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 831c69c958b8..3b726f044d3f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2504,6 +2504,10 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
 	u64 source_mask = 0;
 	int pad_index = -1;
 
+	if (WARN_ON_ONCE(!v4l2_subdev_has_op(sd, pad, enable_streams) ||
+			 !v4l2_subdev_has_op(sd, pad, disable_streams)))
+		return -ENOIOCTLCMD;
+
 	/*
 	 * Find the source pad. This helper is meant for subdevs that have a
 	 * single source pad, so failures shouldn't happen, but catch them
-- 
2.47.3

