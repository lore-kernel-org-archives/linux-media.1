Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3C83FA5F0
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669050; cv=none; b=MBHrar6xI8lGvced0omCnuB4ybaBKpYg/CpXCYXPBszmOI8uda36JZbNjyI38RGT7Ik/2G75gXybo2N9hr1t+Ym1Mp06X7OpafLCtZG8PzX3kJMrVoyyqeRrMg/3kMJQK4oXTRXjQDXUd5ttiOHzSWxwDGwaF6mU995O+816RPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669050; c=relaxed/simple;
	bh=GInGFqKdQdm2+LdwfMSFiHSH4Hxnxx3QinARZCBApTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NaSaJzhdHGQhgVkwpTPAaZZ9LgQgnUVEymGwCBdYBHNdbvs1ryD17Dx2m8akDOvuqUd0JX69b1yLEWDqO7XGcNxeGFQ0z9WoHFjX85Z1IsyipU2Qi5b3Tf+6zeN798dj2YdTnZgY6G0+9+l1OUu5n7DfMpDUBJj3g/uIeirbh80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/zRTTTz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/zRTTTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669050; x=1810205050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GInGFqKdQdm2+LdwfMSFiHSH4Hxnxx3QinARZCBApTY=;
  b=d/zRTTTz8siGHzhQC76ESpuHJpe2SexlcOm47lnrMYfOsv8DjCNg/DaX
   aQqs3JKyHqyCST0Xq1u08a52C0Z4XaLpoXk3yZA/1Upm6Xq1+6QPuuRiK
   vmzZRqzf7V3xTgVIZLzoFwnYgB27eWcx37fA4j/I+8lCpwTru3hrcnei8
   mTcQdJAhhemUz+fVqu6vREmYrQvZiAvRBX0PByuz6Fy/Xje5CxoaLDh+z
   gI9Uxmsm2jd9kLrkouPqPcV35yegusCMQfr7HTDP61bMCBic+pGnGKXzm
   +EVTUwvKuH3fXjGuLevw39riMrQNps07IJjn99AwUrIW3tPZ0CZ0jV+Lb
   Q==;
X-CSE-ConnectionGUID: w3EdVT/hSLKSKpWm7CbAdA==
X-CSE-MsgGUID: YFeyl9raRKWvw2ehkVKsqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464466"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464466"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:07 -0700
X-CSE-ConnectionGUID: HnTxB0d+R/GUwN9lzDaN9w==
X-CSE-MsgGUID: fpyfeIJiT7akXp7OLMsZrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599261"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CBC0D121CFD;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S1W-3GWm;
	Wed, 13 May 2026 13:43:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 07/17] media: v4l2-subdev: Return dynamically allocated pass-through routes
Date: Wed, 13 May 2026 13:43:48 +0300
Message-ID: <20260513104358.2252605-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Count the number of pass-through routes and then return the full table
once enough memory is available for it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 43d8c0f8701f..9d7f616ab7ea 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2650,20 +2650,22 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 				return -EPIPE;
 			}
 
-			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_PREALLOC) {
+			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
 				dev_dbg(dev, "Frame desc entry limit reached\n");
 				return -E2BIG;
 			}
 
-			fd->entry[fd->num_entries] = *source_entry;
-
-			fd->entry[fd->num_entries].stream = route->source_stream;
+			if (fd->num_entries < fd->len_entries) {
+				fd->entry[fd->num_entries] = *source_entry;
+				fd->entry[fd->num_entries].stream =
+					route->source_stream;
+			}
 
 			fd->num_entries++;
 		}
 	}
 
-	return 0;
+	return fd->num_entries < fd->len_entries ? 0 : -ENOSPC;
 }
 EXPORT_SYMBOL_GPL(__v4l2_subdev_get_frame_desc_passthrough);
 
-- 
2.47.3

