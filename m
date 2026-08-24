Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575E241379E
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573691; cv=none; b=NjrC/8z+ZsKFNBBt+TjkmSEV9Yc3Sfx3vR5ktGndWuv4SjoX67TMmLXxqx6GoiaB5M2GJlHZZbut9eFfeUnOEYAMabnAdTTup6vjaSj1bDzXQOnp9mgaZ8cgYC9w5eS+bhGlBwPyA+N+OHXwxQnfFLZFmzRdDgLLdhLhMBSaWro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573691; c=relaxed/simple;
	bh=AVu/IpOZZLRri8THwESzHrWhKTzTa7mnaJao6tiZQtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0TQI0//LNBE6IhiA6Vc0i9QlhKhlSn3xjyeVNaRCMDZuKOzlC75olzrJF1TSuwMKqcdYVjKmA994YlCCv1Xbrc28d3BJHBhC5/cACI9eqvEu0IzzsZbm5INxnwjhLNX04rcQ36cwiML7Q5AxZiW4G1XzTjEH7iJgkU5Pa/rw9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEZohaww; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEZohaww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573690; x=1819109690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AVu/IpOZZLRri8THwESzHrWhKTzTa7mnaJao6tiZQtM=;
  b=gEZohawwwnfiomYIbpTsYESzlDDSLzz/Lvc/LVqGBg3Xc0d7VqJTSmTj
   KUWN8//4CRyVHSgyRHtClEC84xetBog1hWWIVTsevzIEFzCZRjBUMmELV
   +dv3Zm6mXymdBY0vQfkKueQUx6FzGVTfmQfnynlpfOqgk41XcmJKmSzI8
   dpz/omKKtUeWBoZ0gYTwqWiKBkPlNh30pRY3kNLTXQLh8PDWK+2fR6o6x
   R/Dj/Z3WXxYfjhjhZOjdbmFJgTXgeK9KzSWjsFq6FwxzjjiIUFp0tc9mm
   4yBbty5olMoMPgI5oIFdyYdlEgj7/VwKp5dtrGvU1RpmJi+iVCAw726nf
   Q==;
X-CSE-ConnectionGUID: G2wkiFnzTfqRzy9jkA2WMg==
X-CSE-MsgGUID: jua57lQBRYGTH6FHO8MpEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036506"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036506"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:47 -0700
X-CSE-ConnectionGUID: WB1Nlg9NQa+9p+/md+Il8g==
X-CSE-MsgGUID: xC0gPABuRxOj+00lzs5kUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787652"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6B002121E1C;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E39B-2NIV;
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
Subject: [PATCH v3 09/29] media: ds90ub953: Use v4l2_subdev_get_frame_desc_passthrough_csi2()
Date: Mon, 24 Aug 2026 15:14:31 +0300
Message-ID: <20260824121451.3348583-10-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/ds90ub953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index d4228e1134ff..1ed1ae90eaae 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -635,7 +635,7 @@ static const struct v4l2_subdev_pad_ops ub953_pad_ops = {
 	.enable_streams = ub953_enable_streams,
 	.disable_streams = ub953_disable_streams,
 	.set_routing = ub953_set_routing,
-	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough_csi2,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ub953_set_fmt,
 };
-- 
2.47.3

