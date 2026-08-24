Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEEB414A1F
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573691; cv=none; b=iHC7zkelwCTH6SLdOsiYUg+VNXghjZevfK1jWAlex0ERA3xFBC4RYHOkRbQ2UZLRZzbH/IMUUpFNZnFpl0IAlBxMNRmRrtr03BFo2lMt+Qb/wAlBAdBcQUgpboF2kYDPm2alKB00KrqkgQZC+QourwZlr3TFpQGtpeEbtXztVBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573691; c=relaxed/simple;
	bh=j7IZ4Z2B+m878/k4TmKD52UAnpnHwBywqvtv5Oul8HI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GjnJ0fBcTn5Rnv0A9G/yS5tCLfvAzoS1iz5Q64WaB3PtcVEMOfxnnMoFb+HWYMLWEQXm3Ks+Y9uP8bKVgI7Fxd/FEa/68/yZ+WaQpYqpB/WfQzH1YRbaNJYd1P/toYJ37WtbqrQY/shdCozFPYJqchJKxkPtNcD6FCuWaaGq7tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUTiAxzm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUTiAxzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573689; x=1819109689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j7IZ4Z2B+m878/k4TmKD52UAnpnHwBywqvtv5Oul8HI=;
  b=FUTiAxzmEtEhO7bcapgMgiWEVpFnT/bxZ0BL1cLAFcLRQcOwVvjEoA0u
   C5xX+kvAVxet+W3PGKIo4jz41tfa7CZUOPdqDa2Om3myKEeBCSfd/fu/J
   XK14G3n1qiuo01tNS3H96rs+ln/q8g3XV7+yiMAtMiCgiP4H2Qdh4K9K7
   Mwj909mHDBGbSDzBkHN7KvaJDpAckA2O2oNjKBmnC2URBay5731OWk8a9
   fyKOa24okR7rLyAFEzn6drIQmZaPKiomtNN91BiPcIdKxFqHiV7/CjqMn
   3M/FxJUKNQFylCtuAjASzl9pRB13ROGBswefVkhv0JLOYyEWsdfxcQPCh
   g==;
X-CSE-ConnectionGUID: jcGhIlK2ThKO5gdpwv2hYg==
X-CSE-MsgGUID: qUG080HJTJWhlmgRATyLWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036493"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036493"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:47 -0700
X-CSE-ConnectionGUID: tzK1QmP3T2aFovwT9fHtmg==
X-CSE-MsgGUID: xpd7431XQRe9fHQgL5GRVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787648"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 60502121DD7;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E38u-2AtO;
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
Subject: [PATCH v3 06/29] media: v4l2-subdev: Change the maximum number of routes
Date: Mon, 24 Aug 2026 15:14:28 +0300
Message-ID: <20260824121451.3348583-7-sakari.ailus@linux.intel.com>
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

As the frame descriptors are now allocated dynamically, allow as many
routes that there can be dynamically allocated frame descriptors.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e15d3f63e004..071657459202 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1088,14 +1088,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 				num_active_routes++;
 		}
 
-		/*
-		 * Drivers that implement routing need to report a frame
-		 * descriptor accordingly, with up to one entry per route. Until
-		 * the frame descriptors entries get allocated dynamically,
-		 * limit the number of active routes to
-		 * V4L2_FRAME_DESC_ENTRY_PREALLOC.
-		 */
-		if (num_active_routes > V4L2_FRAME_DESC_ENTRY_PREALLOC)
+		if (num_active_routes > V4L2_FRAME_DESC_ENTRY_MAX)
 			return -E2BIG;
 
 		/*
-- 
2.47.3

