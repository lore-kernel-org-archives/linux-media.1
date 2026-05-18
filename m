Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A642C48A2D1
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122603; cv=none; b=shW/iwEFpP6wfuM48ar+in5JVxC/pGsTVC4/tt3uhOp/8pwlYQtUP6mYhIgDokOgiFS8CKNRjlWBHvLdBvYg3vMOfDs9dTJY7XxlmysmmqXwbpSQ1SKEVFTbJze+VV2XPqQ9HrsdroLWFdPErPx/J/ABu+eDWFAZWcAqzGgEho0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122603; c=relaxed/simple;
	bh=KDjfoJcjKV7pHGadUcM8FWZf/FTghjFKZI6Xzjni+x0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MbjXLrGdYcy8HZE+6OUWj3ImD6Fz8Xj7gpqn8yXDbHfaFhizQPlR3WJ80uaDYZhS62I09FbiC8Zxqot5GWXcwsi+WsnJ7AaIkE7ozAJnwETtTBMTYpj7TL8hHdZRGfIixWPuFobdOMLlf/Z89RnDp7gB3aSi0R/EzXLW2rvUrRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6v9JcZa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6v9JcZa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122602; x=1810658602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KDjfoJcjKV7pHGadUcM8FWZf/FTghjFKZI6Xzjni+x0=;
  b=F6v9JcZaikOPUr6XlxzJKmDzV0YsuEphDUooC5AKeWKsAacqC8wEUw0D
   BL5y1Fml/vg7C6I1YS9mTGCZUXtb9TfJuagv7SBec9E5h1KR9TObZ4Sh4
   G6kLo5FFRbnibySGFMfxsVGL5JRbSyKSk1YnbFCAPANKLOSAJRGQc6Q02
   Y8jagTws8fCbYtS2ipzLYRdinwKf/kyiK8cNrsxuD+uOunmZAWbbI2wdM
   E31yPiRa1+1mKaZ5EGB/UeV8cOR2XUC0FOLj+X3UcT8XQz/2AwJARinPK
   2xc7/96CGO5QFQ0s+JsrkySuzwSj1QmxKF1kckAbm3FmVu6LQ+uDws0e+
   A==;
X-CSE-ConnectionGUID: lIbhbqszShGP4iUFMzkiCQ==
X-CSE-MsgGUID: K1qwtzAYR6uWPyMoazRWLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413813"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413813"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:20 -0700
X-CSE-ConnectionGUID: 5PeODe9lTjChA1033N06jQ==
X-CSE-MsgGUID: 1QPtKwabQLi1fyTN5o6LzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019133"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:17 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 27283120D59;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E89d-0Kq9;
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
Subject: [PATCH v2 02/17] media: v4l2-subdev: Align frame descriptor error codes with routing
Date: Mon, 18 May 2026 19:43:02 +0300
Message-ID: <20260518164318.3367888-3-sakari.ailus@linux.intel.com>
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

__v4l2_subdev_get_frame_desc_passthrough() returns -ENOSPC when there are
too many routes. There's a subtle difference when compared to -E2BIG, but
-E2BIG can be used in this case as well. In practice this was unlikely to
having been ever returned from the kernel as things currently stand.

-ENOSPC can be then repurposed for signalling of running out of entries in
the statically allocated array.

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

