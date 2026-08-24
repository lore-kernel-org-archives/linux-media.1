Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948CA414A16
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573688; cv=none; b=cyVRi96CDuPv7bZ9DU1raOoAHIBV5Mq8rJHcV6MGb1J/zHBfxIdVOslx0l28qfLbWfuhsz4pchxvpAhKhKjH6phckhZAw3iw7P80yr41kF5n3ftxgRMNHry0u9GvGSr09QXIftX1KJ1laDh6b9O+AB0T9KnA6/6oGL496swAxMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573688; c=relaxed/simple;
	bh=eLY3OKvtFWB+dmz4Q8NSldyb7fslThjoqv4bG6UXaWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSysDzzBn/vPeYxUrEJ5Q2AiS7XaygBVZcXaiUPzWEMdsOjeGBHIpxa8Qjro51zTXEPJDUX9pYsHMaNeerKNS7gwmnNf86yAPkAF23cbNf00UeRpJmy/lz8QrSquluxTpWXeqUnzGkLYiYPa9x1WEASI19lLjWa4Jg2fiwH2Hyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGiv3uDW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGiv3uDW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573687; x=1819109687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eLY3OKvtFWB+dmz4Q8NSldyb7fslThjoqv4bG6UXaWk=;
  b=EGiv3uDWNKHwEgsN7e3+8uEnPTyP/AZqU4AiBKIqcOIWboqVFx05OvAM
   ioPy5TzcAxuFv2Bnm7nAxg0HHHdisQp+bPBixIo5cijrg6E1wncXOLbKj
   2osxRXkdZjkPBWCcxn7/iGApPOFWMUChIFDWCAVaUML6pfuIb6mYG+CuJ
   Mmekmw8u0cXRw1yLsTQKLzftjMwBrMhkMeZeazolNndtwA4BZZsq+EPGs
   iV2DeoBhzhHUIl8HcmWUR6fuH736Ry4rfgqQaXy80mIc/y6bFmm71aW6G
   2mhCH+EjKStlu1YiAvpNMYH+YnxGJSEGNFL+0noJIPCDdxKRkvxRaiSmL
   Q==;
X-CSE-ConnectionGUID: jgE9NhfFQQaC4D8OyKbuUA==
X-CSE-MsgGUID: 7uUu9yppRkiHKPpsQMlNeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036489"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036489"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:47 -0700
X-CSE-ConnectionGUID: aasQGqV5RrWc415NJn9zAA==
X-CSE-MsgGUID: AX4+DdRuTrGXM18PWB7ASg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787649"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 660B3121E10;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E396-2JWG;
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
Subject: [PATCH v3 08/29] media: ds90ub913: Use v4l2_subdev_get_frame_desc_passthrough_csi2()
Date: Mon, 24 Aug 2026 15:14:30 +0300
Message-ID: <20260824121451.3348583-9-sakari.ailus@linux.intel.com>
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

Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to set
the frame descriptor type in the get_frame_desc() callback.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ds90ub913.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 6abb5e324ae1..922865f03d37 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -487,7 +487,7 @@ static const struct v4l2_subdev_pad_ops ub913_pad_ops = {
 	.enable_streams = ub913_enable_streams,
 	.disable_streams = ub913_disable_streams,
 	.set_routing = ub913_set_routing,
-	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough_csi2,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ub913_set_fmt,
 };
-- 
2.47.3

