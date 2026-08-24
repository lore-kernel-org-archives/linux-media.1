Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCEE414A21
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573687; cv=none; b=QC60Kib0piVcUhI2IVaIOFNHXqQHmQjWM9frBK19RaBs6522Sg1bgEU/ePdTxtymWePXbg819MIr7eo4/lXVYlRVgkWagDOylXJkR+g2fYJG9OlXZYoJ560rtBmGklzQAAFwKhCrab2CxLz9GwdqDf+WgHx0k2dW38DNoHv8HVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573687; c=relaxed/simple;
	bh=dvYXniDQJhFBVnItMK+44HIXt1UXi0Dbp5sNvOdfso8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CMi1eA0kswx7S2Bw9pj2vLbRMzMhFXL+e15OGEGNAjzsUEgq6V3RwBjvN8j03UULIgdq+w3Wrc74QQiwjY2xZgMOC6iIBV8QijfvlmDwmBs6Bb6FuW4fXq5SvjeyF9s4jbwOIEjbT+XWMYakLUTBQSK2LACQ0wve5JG133Xy56g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dELSMB0T; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dELSMB0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573685; x=1819109685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dvYXniDQJhFBVnItMK+44HIXt1UXi0Dbp5sNvOdfso8=;
  b=dELSMB0TuxVg3ZZROrmVn5HHpWMqoO6C4Ho3DjZe1fJGhHTxNR/vGg/l
   UFB5Mbd3BKrYyvkqN06CIUbV5p2sCh2dyt2xjfeL8BcFwEhx9xV7B5KIQ
   ptfvOaf1oklrJmu4ee1ZsjRWRBprQPdL9rYO7mbB4HFNJqbo0M3Wo2KPl
   sgkNlODeWyqOdwkkDkaSakMLFtJ60BlbQkB76znpy8UwNDrZsIcJwsBTV
   Uoijkpo7avXUJd7++6/DBL4iLd8zt5wMiZO/yXnIgW9c3MRGKE3BFK5Yv
   Ixhs/ncyeSTRuLJH5vxiX6zgC7FnDDq5/rnliiLRe9LgKQibjWaKmD8If
   Q==;
X-CSE-ConnectionGUID: oxfN3pDHRN6AeyQ8ZH3acA==
X-CSE-MsgGUID: 1Ay7q57iQuyRv7lfWljf+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036455"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036455"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:43 -0700
X-CSE-ConnectionGUID: eBywm3WwQ0a0FBSnC4y7mw==
X-CSE-MsgGUID: UoTW29CpRtSB63BQsHUjkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787639"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:41 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 56C45121C42;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E38e-1u7w;
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
Subject: [PATCH v3 02/29] media: v4l2-subdev: Align frame descriptor error codes with routing
Date: Mon, 24 Aug 2026 15:14:24 +0300
Message-ID: <20260824121451.3348583-3-sakari.ailus@linux.intel.com>
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

__v4l2_subdev_get_frame_desc_passthrough() returns -ENOSPC when there are
too many routes. There's a subtle difference when compared to -E2BIG, but
-E2BIG can be used in this case as well. In practice this was unlikely to
having been ever returned from the kernel as things currently stand.

Align the error codes with the routing IOCTLs.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e9f81b9be9e2..d93ed50255ed 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2639,7 +2639,7 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 
 			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
 				dev_dbg(dev, "Frame desc entry limit reached\n");
-				return -ENOSPC;
+				return -E2BIG;
 			}
 
 			fd->entry[fd->num_entries] = *source_entry;
-- 
2.47.3

